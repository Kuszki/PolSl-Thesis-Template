function set_format(ahandle, aname, comma, varargin)

	fm_e = @(x) regexprep(x, '[Ee]([+-])0+(\d+)', 'E$1$2');
	fm_m = @(x) strrep(x, '-', '−');
	fm_c = @(x) strrep(x, '.', ',');

	if comma
		fm_f = @(x) fm_c(fm_m(fm_e(x)));
	else
		fm_f = @(x) fm_m(fm_e(x));
	end

	if (nargin < 3 || nargin > 4)
		error('wrong number of input parameters');
	end

	switch aname

		case 'Title'

			htit = get(ahandle, 'Title');
			stit = get(htit, 'string');

			set(htit, 'string', fm_f(stit));

		case 'XY'

			set_format(ahandle, 'X', comma, varargin{:});
			set_format(ahandle, 'Y', comma, varargin{:});

		case {'X', 'Y'}

			tick = get(ahandle, strcat(aname, 'Tick'));
			n = length(tick);
			labels = cell(1, n);

			for i = 1 : n
				labels{i} = fm_f(num2str(tick(i), varargin{:}));
			end

			set(ahandle, strcat(aname, 'TickLabel'), labels);

		otherwise

			error('wrong axis name - use one of X, Y or XY');

	end

end

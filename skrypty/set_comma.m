function set_comma(ahandle, aname, varargin)

	if (nargin < 2 || nargin > 3)
		error('wrong number of input parameters');
	end

	switch aname

		case 'XY'

			set_comma(ahandle, 'X', varargin{:});
			set_comma(ahandle, 'Y', varargin{:});

		case {'X', 'Y'}

			tick = get(ahandle, strcat(aname, 'Tick'));

			n = length(tick);
			labels = cell(1,n);

			for i = 1:n
				label = num2str(tick(i), varargin{:});
				labels{i} = strrep(label, '.', ',');
			end


			set(ahandle, strcat(aname, 'TickLabel'), labels);

		otherwise

			error('wrong axis name - use one of X, Y or XY');

	end

end

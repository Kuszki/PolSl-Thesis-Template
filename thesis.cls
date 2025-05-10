\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}
\LoadClassWithOptions{report}

\directlua{pdf.setminorversion(7)}
\RequirePackage[a-3u, allxmp, pdf17]{pdfx}
\pdfminorversion=7

\RequirePackage[backend = biber, style = numeric-comp, sorting = nyt, sortcites = true, maxnames = 9]{biblatex}
\RequirePackage[font = small, labelfont = bf, textfont = it, singlelinecheck = false]{caption}
\RequirePackage[inner = 3.0cm, outer = 2.0cm, top = 2.5cm, bottom = 2.5cm]{geometry}
\RequirePackage[leftmargin = 12pt, rightmargin = 12pt, font = itshape]{quoting}
\RequirePackage[locale = PL]{siunitx}

\RequirePackage[autostyle]{csquotes}
\RequirePackage[section]{placeins}
\RequirePackage[polish]{babel}
\RequirePackage{unicode-math}
\RequirePackage{indentfirst}
\RequirePackage{longtable}
\RequirePackage{emptypage}
\RequirePackage{tabularx}
\RequirePackage{interval}
\RequirePackage{setspace}
\RequirePackage{titlesec}
\RequirePackage{fontspec}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{totcount}
\RequirePackage{multirow}
\RequirePackage{multicol}
\RequirePackage{enumitem}
\RequirePackage{textcomp}
\RequirePackage{lmodern}
\RequirePackage{tocloft}
\RequirePackage{parskip}
\RequirePackage{gensymb}
\RequirePackage{comment}
\RequirePackage{wrapfig}
\RequirePackage{xpatch}
\RequirePackage{minted}
\RequirePackage{calc}
\RequirePackage{xurl}

\DeclareSIUnit[quantity-product=-]\bitOwych{bitowych}
\DeclareSIUnit[quantity-product=-]\bitOwego{bitowego}
\DeclareSIUnit[quantity-product=-]\bitOwaa{bitową}
\DeclareSIUnit[quantity-product=-]\bitOwa{bitowa}
\DeclareSIUnit[quantity-product=-]\bitOwe{bitowe}
\DeclareSIUnit[quantity-product=-]\bitOwy{bitowy}
\DeclareSIUnit[quantity-product=-]\bitOw{bitów}
\DeclareSIUnit[quantity-product=-]\bitY{bity}
\DeclareSIUnit[quantity-product=-]\bit{bit}

\DeclareSIUnit[quantity-product=-]\numTej{tej}
\DeclareSIUnit[quantity-product=]\percent{\char"0025}
\DeclareSIUnit\degreeCelsius{\char"2103}

\babelprovide[transforms = oneletter.nobreak]{polish}
\babelprovide[justification = unhyphenated]{polish}
\hypersetup{hidelinks, breaklinks = true}

\titleformat{name = \chapter, numberless}[block]{\normalfont\bfseries\huge}{}{0pt}{}
\titleformat{name = \chapter}[block]{\normalfont\bfseries\huge}{}{0pt}{\thechapter.~}
\titleformat{name = \section}[block]{\normalfont\bfseries\large}{}{0pt}{\thesection.~}

\xpatchcmd{\interval}{interval,}{interval,scaled,}{}{}

\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}

\renewcommand{\cftchapaftersnum}{.}
\renewcommand{\cftsecaftersnum}{.}
\renewcommand{\arraystretch}{1.30}

\renewcommand\floatpagefraction{0.85}
\renewcommand\topfraction{0.85}
\renewcommand\bottomfraction{0.35}
\renewcommand\textfraction{0.25}

\DefineBibliographyStrings{polish}{
	urlseen = {dostęp},
	in      = {}
}

\newcommand{\hugelinespacing}{\renewcommand{\baselinestretch}{1.60} \normalsize}

\newcommand{\normallinespacing}{\renewcommand{\baselinestretch}{1.30} \normalsize}
\newcommand{\mediumlinespacing}{\renewcommand{\baselinestretch}{1.00} \normalsize}
\newcommand{\narrowlinespacing}{\renewcommand{\baselinestretch}{0.70} \normalsize}

\newcommand{\makecaption}[2]{\caption{\label{#1}#2}}
\newcommand{\emb}[1]{\left(#1\right)}

\setlength{\parskip}{12pt plus 5pt minus 2pt}
\setlength{\floatsep}{16pt plus 3pt minus 3pt}
\setlength{\intextsep}{16pt plus 3pt minus 3pt}
\setlength{\textfloatsep}{16pt plus 3pt minus 3pt}
\setlength{\abovecaptionskip}{10pt plus 2pt minus 1pt}
\setlength{\belowcaptionskip}{0pt plus 2pt minus 0pt}

\setlength{\parindent}{32pt}
\setlength{\headheight}{16pt}
\setlength{\tabcolsep}{6pt}
\setlength{\itemsep}{6pt}
\setlength{\jot}{6pt}

\counterwithout{listing}{chapter}
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}
\counterwithout{equation}{chapter}

\setlist{leftmargin = \parindent}
\setenumerate{noitemsep}
\setitemize{noitemsep}

\fancyhead{}
\fancyhead[OR]{\nouppercase{\small\leftmark}}
\fancyhead[EL]{\nouppercase{\small\@author~:~\@title}}

\def\maketitle
{
	\renewcommand{\familydefault}{\sfdefault}
	\begin{titlepage}
		\includegraphics[width = 5.25cm]{obrazki/polsl_logo} \\
		{\Large \bf \MakeUppercase{\worktype}}
		\vskip 20pt
		{\large \bf \@title}
		\vskip 10pt
		{\large \bf \@author} \\
		{\bf Nr albumu: \authalbum}
		\vskip 20pt
		\begin{tabular}[c]{r @{~:~} l}
		{\large {\bf Kierunek}}    & {\large \sf \edudir}   \\
		{\large {\bf Specjalność}} & {\large \sf \edupath}  \\
		\end{tabular}
		\vskip 20pt
		{\large \bf \MakeUppercase{Prowadzący pracę}} \\
		{\large \bf \fullpromoter} \\
		{\large \bf \MakeUppercase{\institute}} \\
		{\large \bf \MakeUppercase{\department}}
		\vfill
		{\large \bf \MakeUppercase{\fulldate}}
		\vskip 15pt
	\end{titlepage}
	\renewcommand{\familydefault}{\rmdefault}
}

\def\titlepage
{
	\newpage
	\normallinespacing
	\pagestyle{empty}
	\pagenumbering{alph}
	\centering
	\normalsize
	\vbox to \vsize
	\bgroup\bgroup
}

\def\endtitlepage
{
	\par
	\kern 0pt
	\egroup
	\vss
	\egroup
	\clearpage
	\normallinespacing
}

\def\preface
{
	\pagestyle{plain}
	\pagenumbering{roman}
	\noindent\textbf{Tytuł pracy:}~\@title\par
	\noindent\textbf{Streszczenie:}~\input{dodatki/streszczenie}\par
	\noindent\textbf{Słowa kluczowe:}~\keywordspl\par
	\vskip 15pt
	\noindent\textbf{Thesis title:}~\titleen\par
	\noindent\textbf{Summary:}~\input{dodatki/abstract}\par
	\noindent\textbf{Key words:}~\keywordsen\par
	\clearpage
	\normallinespacing
	\tableofcontents
}

\def\appendix
{
	\clearpage
	\mediumlinespacing
	\pagestyle{plain}
	\printbibliography[heading = bibintoc, title = Literatura]
}

\def\body
{
	\clearpage
	\normallinespacing
	\pagenumbering{arabic}
	\pagestyle{fancy}
}

\sisetup
{
	separate-uncertainty = true,
	retain-explicit-plus = true,
	reset-text-family    = false,
	reset-text-series    = false,
	reset-text-shape     = false,
	space-before-unit    = true,
	tight-spacing        = true,
	use-xspace           = true,
	per-mode             = fraction,
	inline-per-mode      = fraction,
	list-exponents       = combine-bracket,
	list-units           = single,
	range-exponents      = combine-bracket,
	range-units          = bracket,
	range-phrase         = \,;\,,
	quantity-product     = ~,
	exponent-product     = \cdot,
	mode                 = match
}

\intervalconfig
{
	left closed fence    = [,
	right closed fence   = ],
	left open fence      = (,
	right open fence     = ),
	separator symbol     = ;
}

% to allow break long gathers
\allowdisplaybreaks[1]
% --------------------

% to avoid widows and clubs
\widowpenalty=10000
\clubpenalty=10000
% --------------------

% to count chapters
\regtotcounter{chapter}
% --------------------

% for wider matrices
\setcounter{MaxMatrixCols}{15}
% --------------------

% for delimiters size
\delimitershortfall=-1pt
\delimiterfactor=900
% --------------------

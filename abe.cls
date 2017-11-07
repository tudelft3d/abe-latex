% A+BE series LaTeX template by:
%   Ken Arroyo Ohori
%   Vero Crickx

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{abe}[2015/04/07 A+BE template]

\LoadClass[fontsize=9pt,
           numbers=noenddot,
           twoside]{scrbook}

% Crown quarto paper
\RequirePackage[paperwidth=535.748pt,
                paperheight=697.323pt,
                top=52pt,
                bottom=86.323pt,
                left=126.248pt,
                right=71.5pt,
                footskip=52pt,
                asymmetric]{geometry}

% Font setup
\RequirePackage{fontspec}
\addtokomafont{disposition}{\normalfont}
\addtokomafont{pagenumber}{\color{abecolor}}
\addtokomafont{captionlabel}{\color{abecolor}}
\addtokomafont{footnotereference}{\color{abecolor}}
\addtokomafont{footnoterule}{\color{abecolor}}

% Other packages
\RequirePackage[titles]{tocloft}
\RequirePackage[automark]{scrlayer-scrpage}
\RequirePackage{scrextend}
\RequirePackage[document]{ragged2e}
\RequirePackage{tabularx}
\RequirePackage{titling}
\RequirePackage[english]{babel}
\RequirePackage{xcolor}
\RequirePackage[singlelinecheck=false]{caption}
\RequirePackage{natbib}
\RequirePackage[xetex,
                breaklinks]{hyperref}

% ABE color
\definecolor{abecolor}{rgb}{0, 0.68, 0.94}

% Custom commands
\newcommand{\abethesistitle}[1]{\newcommand \abethesisthetitle {#1}}
\newcommand{\abethesissubtitle}[1]{\newcommand \abethesisthesubtitle {#1}}
\newcommand{\abeauthortitle}[1]{\newcommand \abeauthorthetitle {#1}}
\newcommand{\abeauthorname}[1]{\newcommand \abeauthorthename {#1}}
\newcommand{\abeauthorsurname}[1]{\newcommand \abeauthorthesurname {#1}}
\newcommand{\abeauthordepartment}[1]{\newcommand \abeauthorthedepartment {#1}}
\newcommand{\abeauthorplaceofbirth}[1]{\newcommand \abeauthortheplaceofbirth {#1}}
\newcommand{\abedefencedate}[1]{\newcommand \abedefencethedate {#1}}
\newcommand{\abedefencetime}[1]{\newcommand \abedefencethetime {#1}}

% Page style
\renewpagestyle{scrheadings}{
  {}%
  {}%
  {}
}{
  {\makebox[0pt][r]{\color{abecolor}\footnotesize\hspace{13pt}}{\footnotesize\upshape\bfseries\abethesisthetitle}\hfill\pagemark}%
  {\makebox[0pt][r]{\color{abecolor}\footnotesize\hspace{13pt}}{\footnotesize\upshape\bfseries\chaptername{}}\hfill\pagemark}%
  {}
}

% ABE rules
\makeatletter
\newcommand \aberule {{\vspace{1mm}\color{abecolor}\normalsize \leavevmode \cleaders \hb@xt@ .3em{\hss.\hss }\hfill \kern \z@}}
\makeatother
\makeatletter
\newcommand \abeblackrule {{\vspace{1mm}\normalsize \leavevmode \cleaders \hb@xt@ .3em{\hss.\hss }\hfill \kern \z@}}
\makeatother

% Captions
\captionsetup{labelsep=quad}

% Element names
\addto\captionsenglish{%
  \renewcommand{\figurename}{FIGURE}%
  \renewcommand{\tablename}{TABLE}%
}

% Paragraph spacing
\setlength{\parskip}{10pt}

% Lists
\renewcommand{\labelitemi}{\color{abecolor}$\bullet$}
\renewcommand{\labelitemii}{\color{abecolor}--}
\renewcommand{\labelitemiii}{\color{abecolor}$\cdot$}
\renewcommand{\labelitemiv}{\color{abecolor}-}

% Footnote style
\setfootnoterule{\linewidth}
\deffootnote{0cm}{0cm}{\color{abecolor}\thefootnotemark\hspace{13pt}}
\setlength{\skip\footins}{26pt}
\setlength{\footnotesep}{\baselineskip}

% Chapter title style
\renewcommand*{\chapterformat}{%
\makebox[0pt][r]{\chapappifchapterprefix{\ }\color{abecolor}\thechapter\autodot\hspace{13pt}}}

% New part command
\let\LaTeXStandardSection\part%
\renewcommand{\part}[1]{%
\begingroup % Limit the renewcommand of \thepart
\renewcommand{\thepart}{}%  
\refstepcounter{part}%
\addcontentsline{toc}{part}{\protect{\numberline{PART\enskip\Roman{part}\thepart}{#1}}}
\LaTeXStandardSection*{\nopagebreak%
\makebox[0pt][r]{\color{abecolor}\bfseries\Huge PART\enskip\Roman{part}\hspace{13pt}}{\bfseries\Huge\color{abecolor} #1}\\\vspace{78pt}%
}%
\endgroup
}%

% New section command
\let\LaTeXStandardSection\section%
\makeatletter
\renewcommand{\section}{%
\@ifstar{\abestarredsection}{\abeunstarredsection}%
}%
\makeatother

\newcommand{\abestarredsection}[1]{
%\addcontentsline{toc}{section}{\protect{\numberline{}{#1}}}
\LaTeXStandardSection*{\nopagebreak\aberule\\%
{\bfseries\large #1}\\%
\vspace{-2mm}\aberule\\%
}%
}

\newcommand{\abeunstarredsection}[1]{
\refstepcounter{section}%
\addcontentsline{toc}{section}{\protect{\numberline{\color{abecolor}\thesection}{#1}}}
\LaTeXStandardSection*{\nopagebreak\aberule\\%
\makebox[0pt][r]{\color{abecolor}\bfseries\large\S\enskip\thechapter.\arabic{section}\hspace{13pt}}{\bfseries\large #1}\\%
\vspace{-2mm}\aberule\\%
}%
}

% New subsection command
\let\LaTeXStandardSection\subsection%
\makeatletter
\renewcommand{\subsection}{%
\@ifstar{\abestarredsubsection}{\abeunstarredsubsection}%
}%
\makeatother

\newcommand{\abestarredsubsection}[1]{
%\addcontentsline{toc}{subsection}{\protect{\numberline{}{#1}}}
\LaTeXStandardSection*{\nopagebreak%
{\bfseries\large #1}\\%
\vspace{-2mm}\aberule\\%
}%
}

\newcommand{\abeunstarredsubsection}[1]{
\refstepcounter{subsection}%
\addcontentsline{toc}{subsection}{\protect{\numberline{\color{abecolor}\thesubsection}{#1}}}
\LaTeXStandardSection*{\nopagebreak%
\makebox[0pt][r]{\color{abecolor}\bfseries\large\S\enskip\thechapter.\arabic{section}.\arabic{subsection}\hspace{13pt}}{\bfseries\large #1}\\%
\vspace{-2mm}\aberule\\%
}%
}

% New subsubsection command
\let\LaTeXStandardSection\subsubsection%
\makeatletter
\renewcommand{\subsubsection}{%
\@ifstar{\abestarredsubsubsection}{\abeunstarredsubsubsection}%
}%
\makeatother

\newcommand{\abestarredsubsubsection}[1]{
\addcontentsline{toc}{subsubsection}{\protect{\numberline{}{#1}}}
\LaTeXStandardSection*{\nopagebreak%
{\bfseries\large #1}\\%
\vspace{-2mm}\abeblackrule\\%
}%
}

\newcommand{\abeunstarredsubsubsection}[1]{
\refstepcounter{subsubsection}%
\addcontentsline{toc}{subsubsection}{\protect{\numberline{\color{abecolor}\thesubsubsection}{#1}}}
\LaTeXStandardSection*{\nopagebreak%
\makebox[0pt][r]{\color{abecolor}\bfseries\large\S\enskip\thechapter.\arabic{section}.\arabic{subsection}.\arabic{subsubsection}\hspace{13pt}}{\bfseries\large #1}\\%
\vspace{-2mm}\abeblackrule\\%
}%
}

% New paragraph command
\let\LaTeXStandardSection\paragraph%
\renewcommand{\paragraph}[1]{%
\LaTeXStandardSection*{\nopagebreak%
\normalfont\normalsize\color{abecolor}\uppercase{#1}
}%
}%

% Set up table of contents
\newlength{\abenumlen}
\setlength{\abenumlen}{1.5cm}
\newlength{\abeafternumlen}
\setlength{\abeafternumlen}{0.5cm}

\setlength{\cftbeforepartskip}{1.5cm}
\setlength{\cftpartnumwidth}{\abenumlen}
% \setlength{\cftpartindent}{-\abenumlen}
\renewcommand{\cftpartpresnum}{\hfil\color{abecolor}PART~}
\renewcommand{\cftpartaftersnum}{\hspace*{\abeafternumlen}}
\renewcommand{\cftpartfont}{\color{abecolor}\bfseries\Large}
\renewcommand{\cftpartleader}{}
\renewcommand{\cftpartpagefont}{\color{abecolor}\bfseries\scshape}
\renewcommand{\cftpartafterpnum}{\\\vspace{-3.25pt}\hspace{-\abenumlen}\aberule}

\setlength{\cftbeforechapskip}{0.5cm}
\setlength{\cftchapindent}{0pt}
\setlength{\cftchapnumwidth}{\abenumlen}
% \setlength{\cftchapindent}{-\abenumlen}
\renewcommand{\cftchappresnum}{\color{abecolor}}
\renewcommand{\cftchapaftersnum}{\hspace*{\abeafternumlen}}
\renewcommand{\cftchapfont}{\Large}
\renewcommand{\cftchapleader}{}
\renewcommand{\cftchappagefont}{\color{abecolor}\scshape}
\renewcommand{\cftchapafterpnum}{\\\vspace{-3.25pt}\hspace{-\abenumlen}\aberule}

\setlength{\cftbeforesecskip}{0.5cm}
\setlength{\cftsecindent}{0pt}
\setlength{\cftsecnumwidth}{\abenumlen}
% \setlength{\cftsecindent}{-\abenumlen}
\renewcommand{\cftsecpresnum}{\hfil\color{abecolor}}
\renewcommand{\cftsecaftersnum}{\hspace*{\abeafternumlen}}
\renewcommand{\cftsecleader}{}
\renewcommand{\cftsecpagefont}{\color{abecolor}\scshape}
\renewcommand{\cftsecafterpnum}{\\\vspace{-3.25pt}\hspace{-\abenumlen}}

\setlength{\cftsubsecindent}{0pt}
\setlength{\cftsubsecnumwidth}{\abenumlen}
% \setlength{\cftsubsecindent}{-\abenumlen}
\renewcommand{\cftsubsecpresnum}{\hfil\color{abecolor}}
\renewcommand{\cftsubsecaftersnum}{\hspace*{\abeafternumlen}}
\renewcommand{\cftsubsecleader}{}
\renewcommand{\cftsubsecpagefont}{\color{abecolor}\scshape}
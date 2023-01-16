%Tells the compiler which latex version is needed
\NeedsTeXFormat{LaTeX2e}

%Information about the class that will be Provided
\ProvidesClass{Classes/ifasDiss}[2016/03/21 IFAS Dissertation Template]

%Language
\usepackage[german,english]{babel} %the last language is the active one

%Template Class and Font
\LoadClass[9pt,a5paper]{extbook}

%\renewcommand{\rmdefault}{lrm}
%\renewcommand{\familydefault}{\rmdefault}
%\RequirePackage{cmbright}
%\RequirePackage[bitstream-charter]{mathdesign}


%Fonts of the Table Of Contents
%\usepackage{tocloft}
%\renewcommand\cftchappagefont{\fontfamily{lmodern} \selectfont }
%\renewcommand\cftsecpagefont{\fontfamily{lmodern} \selectfont}
%\renewcommand\cftsubsecpagefont{\fontfamily{lmodern} \selectfont}


%\renewcommand{\seriesdefault}{l}
\renewcommand{\baselinestretch}{1.15}

\usepackage{charter}
\usepackage[expert]{mathdesign}

%Heading
\RequirePackage{titlesec}

%AMS Packages
\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{amsmath}
\RequirePackage{mathtools}

%Math: change space before and after equations 
\RequirePackage{xpatch}
\xapptocmd\normalsize{%
\abovedisplayskip=20pt plus 3pt minus 9pt
%\abovedisplayshortskip=0pt plus 3pt
\belowdisplayskip=20pt plus 3pt minus 9pt
%\belowdisplayshortskip=7pt plus 3pt minus 4pt
}{}{}

%UNI-Code
%\RequirePackage[utf8]{inputenc}

%Package to Modify Header Styles
\RequirePackage{titlesec}

%Package for tables
\RequirePackage{array}

%Package for Graphics
\usepackage{tikz}
\usepackage{tikz-3dplot}

%Multicolumn Package
\RequirePackage{multicol}

%Package to set Page size and margins
\RequirePackage[top=1.4cm, bottom=1.4cm, left=1.0cm, right=1.0cm, headsep=0.55cm]{geometry}

%Fancy header package to set header and footer for mainmatter
\RequirePackage{fancyhdr}
\fancypagestyle{acknowledgement}{
	\renewcommand{\headrulewidth}{0.4pt}
	\fancyhf{}
	\fancyhead[LE]{\slshape Acknowledgement}
	%\fancyhead[RO]{\slshape\rightmark}
}


\fancypagestyle{abstract}{
	\renewcommand{\headrulewidth}{0.4pt}
	\fancyhf{}
	\fancyhead[LE]{\slshape Abstract}
	%\fancyhead[RO]{\slshape\rightmark}
}

\fancypagestyle{zusammenfassung}{
	\renewcommand{\headrulewidth}{0.4pt}
	\fancyhf{}
	\fancyhead[LE]{\slshape Zusammenfassung}
	%\fancyhead[RO]{\slshape\rightmark}
}

\fancypagestyle{mainmatter}{
	\renewcommand{\headrulewidth}{0.4pt}
	\fancyhf{}
	\fancyhead[LE]{\slshape \leftmark}
	\fancyhead[RO]{\slshape \rightmark}
	\fancyfoot[LE,RO]{\thepage}
}

%Set header and footer for chapter pages
\fancypagestyle{fancyplain}{
	\renewcommand{\headrulewidth}{0pt}
	\fancyhf{}
	\fancyhead[RO]{\quad}
	\fancyfoot[RO]{\thepage}
}

%Commands for header marks
\renewcommand{\chaptermark}[1]{\markboth{\thechapter\hspace{2ex} #1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\hspace{2ex} #1}}

%Formatting--------------------------------------------------------------------------
%Format Chapter
\titleformat{\chapter}[block]
	{\thispagestyle{fancyplain}\huge\raggedright\bfseries\rmfamily%
	%\titlerule\vspace{0.8ex}
	}
	{\thechapter}{2ex}{}
	%[\titlerule]

%Format section
\titleformat{\section}[block]
	{\LARGE\raggedright\bfseries\rmfamily}
	{\thesection}{2ex}{}
	[]

%Format subsection	
\titleformat{\subsection}[block]
	{\Large\raggedright\bfseries\rmfamily}
	{\thesubsection}{2ex}{}
	[]

%Format subsubsection
\titleformat{\subsubsection}[block]
	{\large\raggedright\bfseries\rmfamily}
	{}{0ex}{}
	[]
	
%Spacing for chapter, section, subsection and subsubsection respectively
\titlespacing*{\chapter}{0pt}{6ex}{6ex}[0pt]
\titlespacing*{\section}{0pt}{3ex}{2ex}[0ex]
\titlespacing*{\subsection}{0pt}{3ex}{2ex}[0ex]
\titlespacing*{\subsubsection}{0pt}{2ex}{1ex}[0ex]

%Environments for dedication, acknowledgement, and abstract respectively ------------
\newenvironment{dedication}
{	\pagestyle{empty}
	\null
	\vspace{5cm}	
	\begin{multicols}{2} 
	\null\vfill\columnbreak
	\begin{quote}}
{\end{quote}\end{multicols}\newpage\null\thispagestyle{empty}\newpage }

\newenvironment{acknowledgement}
{\pagenumbering{gobble}
    \chapter*{Acknowledgements}
    \pagestyle{acknowledgement}}
{\\\hfill\\\vspace{1cm}Aachen, \today\hfill\@author\newpage\null\thispagestyle{empty}
\newpage}

\newenvironment{zusammenfassung}
{\pagenumbering{gobble}
	\chapter*{Zusammenfassung}
	\pagestyle{zusammenfassung}}
{\newpage}

\newenvironment{abstract}
{\pagenumbering{gobble}
	\chapter*{Abstract}
	\pagestyle{abstract}}
{\newpage}

\newenvironment{cv}
{\newpage\pagestyle{empty}
	\begin{flushleft}	 
		\vspace{6pt}
		%\rule{\textwidth}{0.4pt}
		{\bfseries\raggedright\huge\rmfamily Curriculum Vitae \par}
		%\rule[2mm]{\textwidth}{0.4pt}
	}
{\end{flushleft}\vfill\clearpage}

% Nomenclature -------------------------------------------------------------------
%Packages
\RequirePackage[intoc]{nomencl}
\RequirePackage{siunitx,etoolbox}

%Command to add units
\newcommand{\nomunits}[1]{\hfill\makebox[8em]{#1\hfill}\ignorespaces}

%Command to instert new header including units
\newcommand{\insertnomheaders}{\item[\bfseries\rmfamily Symbol]%
\textbf{\rmfamily Description}\nomunits{\textbf{\rmfamily Units}}}


%Nomenclature groups
\renewcommand\nomgroup[1]{%
  \vspace{2em} \item[\Large\bfseries\rmfamily
  \ifstrequal{#1}{A}{Acronyms}{%
  \ifstrequal{#1}{R}{Roman Symbols}{%
  \ifstrequal{#1}{G}{Greek Symbols}{%
  \ifstrequal{#1}{S}{Superscripts}{% 
  \ifstrequal{#1}{U}{Subscripts}{%   
  \ifstrequal{#1}{X}{Other Symbols}{}}}}}}]%
  \insertnomheaders%
}

%Dont know what this is
\renewcommand*{\nompreamble}{\markboth{\nomname}{\nomname}}

%Make the description into a paragraph box (for line breaking)
\newcommand{\nomdescr}[1]{\parbox[t]{5cm}{\raggedright #1}}

%Define new macro to set entries with units
\newcommand{\nomwithunits}[4]{\nomenclature[#1]{#2}{\nomdescr{#3}\nomunits{#4}}}

%Make the nomenclature
\makenomenclature

%Set the nomenclature preamble
\def\nompreamble {Local symbols and notations are explained at the place they first appeared and are not a part of this nomenclature. Units are displayed in the appropriate SI-Units whenever possible. Physical pressure is given as absolute pressure compared to a perfect vacuum. Bold printed letters ($ \bullet $) represent vectors and/or matrices, where matrices are always capital letters. Complex Numbers are presented in the general form $x+iy$ where $x$ is the real and $y$ the imaginary part of the number.}



%Appendix---------------------------------------------------------------------
\usepackage[]{appendix}

%Bibliography---------------------------------------------------------------------
\bibliographystyle{alpha}

%Packages for cv--------------------------------------------------------------
\usepackage{blindtext,scrextend}

%Figures--------------------------------------------------------------------------
\RequirePackage{graphicx,subcaption}

%Font for entire Document---------------------------------------------------------
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
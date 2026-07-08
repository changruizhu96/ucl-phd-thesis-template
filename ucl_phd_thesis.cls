% Based on the original report class by Giordano Scarciotti.
% Adapted as a UCL PhD thesis template.
% Version 2.0.0 - 07/07/2026

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% DO NOT MODIFY THIS FILE %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\PassOptionsToPackage{dvipsnames}{xcolor}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ucl_phd_thesis}[2026/07/07 - UCL PhD Thesis Format]
\LoadClass[a4paper,oneside,openany]{book}

\RequirePackage{pgfcore}
\RequirePackage{geometry} 
\RequirePackage{bookmark}
\RequirePackage{graphicx}
\RequirePackage{setspace}
\RequirePackage{kantlipsum}

\RequirePackage{iftex}
\ifPDFTeX
  \RequirePackage[T1]{fontenc}
  \RequirePackage[utf8]{inputenc}
  \RequirePackage[english]{babel}
\else
  \RequirePackage{fontspec}
  \RequirePackage{polyglossia}
  \setdefaultlanguage{english}
\fi

\RequirePackage{minitoc}

\makeatletter
\def\input@path{{chapters/}}
\makeatother

\RequirePackage[printonlyused]{acronym}

\RequirePackage{ifthen}
\newboolean{list_of_tables}
\newboolean{list_of_figures}
\newboolean{acknowledgement}
\newboolean{impact_statement}
\newboolean{publications}
\newboolean{show_second_marker}
\newboolean{acronyms}
\newboolean{edge_labels}
\newboolean{final_thesis}
\newboolean{double_spacing}




\newlength{\logowidth}    \setlength{\logowidth}{55mm}
\newlength{\logopad}      \setlength{\logopad}{17.5mm}
\newlength{\marginleft}   \setlength{\marginleft}{3cm}   % Minimum margins are 2cm
\newlength{\marginright}  \setlength{\marginright}{3cm} 
\newlength{\margintop}    \setlength{\margintop}{3cm}
\newlength{\marginbottom} \setlength{\marginbottom}{3cm}  
\newlength{\marginhead} \setlength{\marginhead}{1cm}
\newlength{\marginfoot} \setlength{\marginfoot}{0.8cm}

\geometry{a4paper, top=\margintop, left=\marginleft, right=\marginright, bottom=\marginbottom, headsep=\marginhead, footskip=\marginfoot, nomarginpar}

\setlength{\parskip}{2ex plus 0.5ex minus 0.2ex}

%% Title page
\makeatletter
\def\degree#1{\gdef\@degree{#1}}
\def\course#1{\gdef\@course{#1}}
\def\subtitle#1{\gdef\@subtitle{#1}}
\def\studentid#1{\gdef\@studentid{#1}}
\def\cid#1{\gdef\@studentid{#1}}
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\secondmarker#1{\gdef\@secondmarker{#1}}
\def\submityear#1{\gdef\@submityear{#1}}
\def\extendeddegree#1{\gdef\@extendeddegree{#1}}
\def\thesis#1{\gdef\@thesis{#1}}
\def\department#1{\gdef\@department{#1}}
\def\university#1{\gdef\@university{#1}}

\def\@degree{PhD}
\def\@course{}
\def\@subtitle{}
\def\@studentid{}
\def\@supervisor{}
\def\@secondmarker{}
\def\@submityear{\the\year}
\def\@department{Department of Computer Science}
\def\@university{University College London}

\newcommand{\titletext}{\@thesis\ submitted in fulfilment of the requirements for the degree of\ \linebreak \textbf{\@extendeddegree}}


\newcommand{\thesisspacing}{
\ifthenelse{\boolean{double_spacing}}{\doublespacing}{\singlespacing}
}

\def\maketitle{

\setboolean{show_second_marker}{false}
\ifthenelse{\equal{\@degree}{PhD}}
 {
   \extendeddegree{Doctor of Philosophy}
 }{
   \extendeddegree{\@degree}
 }
\thesis{A thesis}

  \begin{titlepage}
    \hypertarget{TitlePage}{}
    \bookmark[dest=TitlePage,level=-1]{Front matter}
	\phantomsection \pdfbookmark[section]{Title page}{title}
    \pgfdeclareimage[width=\logowidth]{UCL_Logo}{UCL_Logo}
    \pgftext[at=\pgfpoint{-\marginleft+\logopad}{\margintop+\parskip-\logopad}, top, left]{\pgfuseimage{UCL_Logo}}

    \begin{center}
	  \vspace*{\fill}
    \vskip 2cm
      \doublespacing {\huge  \textsc \@title} \par\singlespacing
      \ifthenelse{\equal{\@subtitle}{}}{}{
        \vskip 0.5cm
        {\Large \textsc \@subtitle}
      }
      \vskip 2cm
      Author\\[2mm]
      {\large \textsc \@author}\\[1mm]
      \ifthenelse{\equal{\@studentid}{}}{}{{\normalsize Student ID: \@studentid}}
      \vskip 1cm
      Supervised by\\[2mm]
      {\large \textsc \@supervisor}\\[1mm]
      \ifthenelse{\boolean{show_second_marker}}{
      \vskip 1cm
      \@secondmarker\\[1mm]
      \vskip 4cm
      }{\vskip 5cm}
      \titletext
	  \vskip 0.5cm
	  \@department\\
   \@university\\
   \@submityear
      \vspace*{\fill}
    \end{center}
  \end{titlepage}
  
  \pagenumbering{arabic}
  \setcounter{page}{2} % ensure no number on title page, numbers on other pages match those in the PDF
}
\makeatother


\RequirePackage{silence}
\WarningsOff[everypage]
\RequirePackage[contents={},opacity=1,scale=1,color=black]{background}
\WarningsOn[everypage]


\RequirePackage{xpatch}
\makeatletter
\xpatchcmd{\chapter}{\thispagestyle{plain}}
                    {\thispagestyle{empty}\stepcounter{counter}}
                    {}{}
\makeatother

\RequirePackage{tikzpagenodes}
\RequirePackage{totcount}

\regtotcounter{counter}
\newcounter{counter}


\usetikzlibrary{calc}
\usetikzlibrary{shapes.symbols} 
\usetikzlibrary{shapes.misc} 

\RequirePackage{fancyhdr}

% UCL Brand and Experience 2026 palette:
% https://www.ucl.ac.uk/brand-and-experience/brand/visual-guidelines/colour
\definecolor{UCLDarkPurple}{HTML}{361A54}
\definecolor{UCLBrightPurple}{HTML}{993BFF}
\definecolor{UCLMidPurple}{HTML}{BA82FF}
\definecolor{UCLHeritageBlue}{HTML}{30D6FF}
\colorlet{UCLPrimary}{UCLDarkPurple}

\newcommand{\chapterpublicationnote}[1]{%
  \begingroup
  \singlespacing
  \vspace{0.5cm}
  \noindent\textcolor{UCLPrimary}{\rule{\textwidth}{0.6pt}}\par
  \noindent\textbf{\textcolor{UCLPrimary}{Publication note.}} #1\par
  \vspace{-0.5ex}
  \noindent\textcolor{UCLPrimary}{\rule{\textwidth}{0.6pt}}\par
  \vspace{0.5cm}
  \endgroup
  \thesisspacing
}

\setlength{\headheight}{24pt}
\fancypagestyle{fancy}{
\fancyhead{}
\fancyfoot{}
\fancyhead[L]{\color{UCLPrimary}\rightmark}
\fancyhead[R]{\color{UCLPrimary}\thepage}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\headrule}{\hbox to\headwidth{%
  \color{UCLPrimary}\leaders\hrule height \headrulewidth\hfill}}
\renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{plain}{%
  \fancyhf{}%
  \fancyhead[R]{\color{UCLPrimary}\thepage}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\headrule}{\hbox to\headwidth{%
  \color{UCLPrimary}\leaders\hrule height \headrulewidth\hfill}}
\renewcommand{\footrulewidth}{0pt}
  \Materialfalse
  \afterpage{\Materialtrue}%
}
\fancypagestyle{empty}{%
  \fancyhf{}%
  \renewcommand{\headrulewidth}{0.0pt}%
  \Materialfalse
  \afterpage{\Materialtrue}%
}



\newif\ifMaterial

\newlength\LabelSize
\setlength\LabelSize{1.5cm}


\AtBeginDocument{%
  \setlength\LabelSize{\dimexpr\textheight/\totvalue{counter}\relax}%
  \ifdim\LabelSize>1.5cm\relax
  \global\setlength\LabelSize{1.5cm}%
  \fi
}
\makeatletter
\newcommand\AddLabels{%
  \Materialtrue
  \AddEverypageHook{%
    \ifMaterial
    \ifodd\value{page}%
    \backgroundsetup{
      angle=0,
      position={current page.east|-current page text area.north east},
      vshift=0pt-(\thecounter-2)*45pt,
      hshift=-15,
      contents={%
        \tikz\node[cho label] {\thechapter};
      }%
    }%
    \else
    \backgroundsetup{
      angle=0,
      position={current page.west|-current page text area.north west},
      vshift=0pt-(\thecounter-2)*45pt,
      hshift=15,
      contents={%
        \tikz\node[che label] {\thechapter};
      }%
    }%
    \fi
    \BgMaterial
    \else\relax\fi
  }%
}
\makeatother
\tikzset{
  che label/.style={fill,rounded rectangle, fill=UCLPrimary,anchor=west,text width=\LabelSize, align=right,text height=30pt,text depth=15pt,text=white,font=\sffamily\fontsize{25pt}{0pt}\selectfont},
}
\tikzset{
  cho label/.style={fill,rounded rectangle, fill=UCLPrimary,anchor=west,text width=\LabelSize, align=left,text height=30pt,text depth=15pt,text=white,font=\sffamily\fontsize{25pt}{0pt}\selectfont},
}

\newcommand\RemoveLabels{\Materialfalse}


\RequirePackage{titlesec}
\titleformat{\chapter}[display]
  {\normalfont\bfseries\raggedright\color{UCLPrimary}}{\fontsize{72}{76}\selectfont\thechapter}{8pt}{\Huge\raggedright\color{UCLPrimary}}
\titlespacing*{\chapter}{0pt}{0pt}{20pt}


\def\preamble{

\dominitoc % Do not change - required
\maketitle % Do not change - required

\pagestyle{empty} % Do not change - required
\frontmatter % Do not change - required
\thesisspacing % Do not change - required

\pagestyle{plain} % Do not change - required


\input{OrigSta_Copyright.tex} % Do not remove

\cleardoublepage\phantomsection
\addcontentsline{toc}{chapter}{Abstract}\mtcaddchapter 
\chapter*{Abstract}
\addtocounter{counter}{-1}
\input{Abstract.tex} % Do not remove

\ifthenelse{\boolean{impact_statement}}{
\cleardoublepage\phantomsection
\addcontentsline{toc}{chapter}{Impact Statement}\mtcaddchapter 
\chapter*{Impact Statement}
\addtocounter{counter}{-1}
\input{ImpactStatement.tex}
}{}

\ifthenelse{\boolean{acknowledgement}}{
\cleardoublepage\phantomsection
\addcontentsline{toc}{chapter}{Acknowledgments}\mtcaddchapter 
\chapter*{Acknowledgments}
\addtocounter{counter}{-1}
\input{Acknowledgement.tex} % OPTIONAL CAN BE REMOVED
}{}

\ifthenelse{\boolean{publications}}{
\cleardoublepage\phantomsection
\addcontentsline{toc}{chapter}{Publications and Author Contributions}\mtcaddchapter 
\chapter*{Publications and Author Contributions}
\addtocounter{counter}{-1}
\input{PublicationsAndContributions.tex}
}{}

\singlespacing % Do not change - required
\tableofcontents % Do not change - required

\ifthenelse{\boolean{acronyms}}{
\cleardoublepage\phantomsection
\addcontentsline{toc}{chapter}{List of Acronyms}\mtcaddchapter 
\chapter*{List of Acronyms}
\addtocounter{counter}{-1}
\input{chapters/ListAcronyms.tex} % OPTIONAL CAN BE REMOVED
}{}

\ifthenelse{\boolean{list_of_figures}}{
\cleardoublepage\phantomsection
\addcontentsline{toc}{chapter}{\listfigurename}\mtcaddchapter
\listoffigures % Optional
\addtocounter{counter}{-1}
}{}

\ifthenelse{\boolean{list_of_tables}}{
\cleardoublepage\phantomsection
\addcontentsline{toc}{chapter}
{\listtablename}\mtcaddchapter
\listoftables
\addtocounter{counter}{-1}
}{} % OPTIONAL CAN BE ADDED

\mainmatter % Do not change - required
\bookmarksetup{startatroot}
\pagestyle{fancy} % Do not change - required
\ifthenelse{\boolean{edge_labels}}{
\AddLabels % Do not change - required
}{}
}


\newcommand{\conclusions}[1]{
\cleardoublepage % Do not change - required
\RemoveLabels % Do not change - required
\cleardoublepage\phantomsection
\addcontentsline{toc}{chapter}{{#1}}\mtcaddchapter 
\chapter*{{#1}}
\markboth{{\MakeUppercase {#1}}}{{\MakeUppercase {#1}}}
\addtocounter{counter}{-1}
% Edit the content of these files 
\input{Conclusions} % Do not remove
\cleardoublepage % Do not change - required
\ifthenelse{\boolean{edge_labels}}{
\AddLabels % Do not change - required
}{}
}

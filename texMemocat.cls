% This document class provides a simple memo for LaTeX users.
% It is based on article.cls and inherits most of the functionality
% that class.
% 
% Author: Rob Oakes, Copyright 2010.  Released under the LGPL, version 3.
% A copy of the LGPL can be found at http://www.gnu.org/licenses/lgpl.html

% Catalan version and enhancements: Joan Queralt Gil, <jqueralt at gmail dot com>  Copyright 2013.  Released under the LGPL, version 3.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{texMemocat}[2013/08/29 - Simple Memo Catalan Class, Including Logo]

%%%%%% Fonts
\RequirePackage{palatino}
%\RequirePackage{bookman}

%%%%%% 
% Load the Base Class
%\LoadClassWithOptions{article} %original
\LoadClass[a4paper,10pt]{article} %changed in Catalan version


% Begin Requirements
\RequirePackage{ifthen}

% More requirements added in Catalan version:
\RequirePackage[svgnames]{xcolor} %permits the use of colors
\RequirePackage{graphicx}         %lets include graphics
\RequirePackage{microtype}        %enhances typografy
\RequirePackage{lastpage}         %Number of Last Page for numbering pages



% Set the Paper Size and margins
\RequirePackage{geometry}
\geometry{margin=1.0in}


% Formating paragraphs
\setlength{\parskip}{\baselineskip} %distance between paragraphs
\setlength{\parindent}{0cm}         %eliminates indentation

% Headings and footers
\RequirePackage{tikz}               %lets use graphics in footers
\usetikzlibrary{
  calc,
  decorations.pathmorphing,
  fadings,
  shadows,
  shapes.geometric,
  shapes.misc,
}

\RequirePackage{fancyhdr}           %enhances headings and footers 
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}  %eliminates rule in headings
\rhead{}
%\cfoot{\tikz{\node[ball color=black,circle,text=white]{\thepage};}}   %alternative foot
\cfoot{\tikz{\filldraw(0,0) node[ellipse,minimum height=0.8cm,minimum width=2cm,draw=black,fill=gray!20,text=black]{\thepage\  $|$  \pageref{LastPage}};}} 

%%%% Hyperlinks
\RequirePackage{hyperref}
\hypersetup{colorlinks=true,
            linkcolor=blue}


% Specialized memo Commands (To, From, Subject, Logo, Letterhead Address)

\def\@memoto{\relax}
\newcommand{\memoto}[1]{\gdef\@memoto{#1}}
\def\@textto{\relax}                                       %definition of command \textto that provides translation
\newcommand{\textto}[1]{\gdef\@textto{#1}}

\def\@memofrom{\relax}
\newcommand{\memofrom}[1]{\gdef\@memofrom{#1}}
\def\@textfrom{\relax}                                     %definition of command \textfrom that provides translation
\newcommand{\textfrom}[1]{\gdef\@textfrom{#1}}

\def\@memosubject{\relax}
\newcommand{\memosubject}[1]{\gdef\@memosubject{#1}}
\def\@textfrom{\relax}                                     %definition of command \textsubject that provides translation
\newcommand{\textsubject}[1]{\gdef\@textsubject{#1}}

\def\@memodate{\relax}
\newcommand{\memodate}[1]{\gdef\@memodate{#1}}
\def\@textfrom{\relax}                                     %definition of command \textdate that provides translation
\newcommand{\textdate}[1]{\gdef\@textdate{#1}}

\def\@memologo{\relax}
\newcommand{\logo}[1]{\gdef\@memologo{\protect #1}}

\def\@letterheadaddress{\relax}
\newcommand{\lhaddress}[1]{\gdef\@letterheadaddress{#1}}

\def\@texttitle{\relax}                                    %definition of command \texttitle that provides translation for title 'Memorandum'
\newcommand{\texttitle}[1]{\gdef\@texttitle{#1}}

% Custom Document Formatting
\newcommand\decorativeline[1][1pt]{
	\par\noindent%
	\rule[0.5ex]{\linewidth}{#1}\par
}

% Language class options

\DeclareOption{catalan}{
  \renewcommand{\textto}{Per a}
  \renewcommand{\textfrom}{De}
  \renewcommand{\textsubject}{Tema}
  \renewcommand{\textdate}{Data}
  \renewcommand{\texttitle}{M\textsc{emor\`andum}}
}
\DeclareOption{english}{
  \renewcommand{\textto}{To}
  \renewcommand{\textfrom}{From}
  \renewcommand{\textsubject}{Subject}
  \renewcommand{\textdate}{Date}
    \renewcommand{\texttitle}{M\textsc{emorandum}}
}
\DeclareOption{spanish}{
  \renewcommand{\textto}{Para}
  \renewcommand{\textfrom}{De}
  \renewcommand{\textsubject}{Tema}
  \renewcommand{\textdate}{Fecha}
  \renewcommand{\texttitle}{M\textsc{emor\'andum}}
}
\ExecuteOptions{}
\ProcessOptions\relax

% Create the Letterhead and To/From Block

\renewcommand{\maketitle}{\makememotitle}
\newcommand\makememotitle{
	\ifthenelse{\equal{\@memologo}{\relax}}{}
	{ % Create With Logo
	\begin{minipage}[t]{1\columnwidth}%
		\begin{flushright}
			\vspace{-0.6in}
			\@memologo
			%\vspace{0.5in}
		%\par
		\end{flushright}%
	\end{minipage}
	}
        % from http://texblog.org/2012/03/07/writing-a-memo-in-latex/	
	{\begin{center}
	\Large\bf
        \texttitle
        \end{center}}
	% To, From, Subject Block
	% Changed fixed text by new commands
	\begin{description}
		\ifthenelse{\equal{\@memoto}{\relax}}{}{\item [{\textto:}] \sffamily\@memoto}
		\ifthenelse{\equal{\@memofrom}{\relax}}{}{\item [{\textfrom:}] \@memofrom}
		\ifthenelse{\equal{\@memosubject}{\relax}}{}{\item [{\textsubject:}] \@memosubject}
		\ifthenelse{\equal{\@memodate}{\relax}}{}{\item [{\textdate:}] \@memodate}
	\end{description}
	\decorativeline\bigskip{}
}


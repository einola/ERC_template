\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{erc}[2024/01/28 ERC template class]

% Class options BOne or BTwo
\newif\iferc@BOne
\newif\iferc@BTwo

\DeclareOption{b1}{\erc@BOnetrue\erc@BTwofalse}
\DeclareOption{b2}{\erc@BOnefalse\erc@BTwotrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ExecuteOptions{b1}
\ProcessOptions\relax

% Page setup
\LoadClass[11pt,a4paper]{article}
\RequirePackage[left=2cm,top=1.8cm,bottom=1.5cm,right=2cm,headsep=.45cm,footskip=.8cm]{geometry}


% Header
\RequirePackage{fancyhdr}
\RequirePackage[table]{xcolor}

\fancyhf{} % clear all header and footer fields

\pagestyle{fancy}

\fancyhead[L]{\textcolor{gray}{\emph{\@authorlastname}}}
\fancyfoot[C]{\textcolor{gray}{\thepage}}
\fancyhead[R]{\textcolor{gray}{{\@acronym}}}
\setlength{\headheight}{14.5pt}

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% Different headers for B1 and B2
\iferc@BOne
    \fancyhead[C]{\textcolor{gray}{Part B1}}
\fi

\iferc@BTwo
    \fancyhead[C]{\textcolor{gray}{Part B2}}
\fi

% Title
\RequirePackage{enumitem}

\newcommand{\acronym}[1]{\def\@acronym{#1}}
\newcommand{\institution}[1]{\def\@institution{#1}}
\renewcommand{\author}[2][]{\def\@authorlastname{#1}\def\@author{#2}}
\newcommand{\granttypeyear}[1]{\def\@granttypeyear{#1}}
\newcommand{\duration}[1]{\def\@duration{#1}}

\iferc@BOne
    \renewcommand{\maketitle}{
        {\centering\bfseries\Large
        \@granttypeyear\par
        Research proposal [Part B1]\\
        \normalfont\huge
        \vspace{.5cm}\@title\par
        \vspace{.2cm}\@acronym\par
        \normalfont\normalsize\raggedright\vspace{1cm}
        \begin{itemize}[noitemsep]
            \item \textbf{Principal investigator (PI):} \@author
            \item \textbf{Host institution:} \@institution
            \item \textbf{Proposal duration:} \@duration~months%
        \end{itemize}
        \par\vspace{1em}
        }
    }
\fi


\iferc@BTwo
    \renewcommand{\maketitle}{
        {\centering\bfseries\Large
        ERC Starting Grant 2023\\
        Part B2\\
        \normalfont\huge
        \vspace{.5cm}\@title\par
        \vspace{.5cm}
        }
    }
\fi

% Abstract
\RequirePackage[linewidth=1pt]{mdframed}
\renewenvironment{abstract}{\mdframed}{\endmdframed
\iferc@BOne \newpage\fi
}

% Use the \section command for sections a and b
\renewcommand\thesection{Section \alph{section}:}
\renewcommand\thesubsection{\arabic{subsection}}
\@addtoreset{section}{part}

% Hyperlinks and TOC for PDF
\RequirePackage[
        plainpages=false,%
        breaklinks,%
        colorlinks,%
        citecolor=black,%
        filecolor=black,%
        linkcolor=black,%
        urlcolor=black,%
        bookmarksopenlevel=2,%
        pdfpagemode=UseOutlines]{hyperref}
\AtBeginDocument{
    \hypersetup{
        pdftitle={\@title},%
        pdfauthor={\@author},%
        pdfsubject={\@granttypeyear},%
        addtopdfcreator={using \csname ver@erc.cls\endcsname~(https://github.com/einola/ERC\_template)}
    }
}

% Environments and counters for WPs, tasks, objectives, hypotheses, and research questions
% counters
\newcounter{wpCntr}
\newcounter{taskCntr}[wpCntr]
\counterwithin{taskCntr}{wpCntr}

\newcounter{objCntr}
\newcounter{hypCntr}
\newcounter{resqCntr}

% Environments

% Work package
\newcommand{\workpackage}[1]%
    {\refstepcounter{wpCntr}%
        \belowpdfbookmark{WP\thewpCntr:~#1}{WP\thewpCntr}%
        \subsubsection*{WP\thewpCntr:~#1}}

% Tasks
% For B1 a \task is an item within a 'description' environment
\iferc@BOne
    \newcommand{\task}[1]%
        {\refstepcounter{taskCntr}%
        \item[Task~\thetaskCntr:]~#1}
\fi

% For B2 a \task is a wrapper around \paragraph{}
\iferc@BTwo
\newcommand{\task}[1]%
    {\refstepcounter{taskCntr}%
    \paragraph{Task~\thetaskCntr:~#1}}
\fi

% Objectives (numbered and not)
\newenvironment{objective*}%
    {\begin{quote}\begin{bfseries}\begin{flushleft}}%
    {\end{flushleft}\end{bfseries}\end{quote}}

\newenvironment{objective}[1][Objective~]%
    {\refstepcounter{objCntr}\begin{objective*}#1\theobjCntr:}%
    {\end{objective*}}

% Hypothesis (numbered and not)
\newenvironment{hypothesis*}%
    {\begin{quote}\begin{bfseries}\begin{flushleft}}%
    {\end{flushleft}\end{bfseries}\end{quote}}

\newenvironment{hypothesis}[1][Hypothesis~]%
    {\refstepcounter{hypCntr}\begin{hypothesis*}#1\thehypCntr:}%
    {\end{hypothesis*}\ignorespacesafterend}

% Research questions (numbered and not)
\newenvironment{resq*}%
    {\begin{quote}\begin{bfseries}\begin{flushleft}}%
    {\end{flushleft}\end{bfseries}\end{quote}}

\newenvironment{resq}[1][Research~question~]%
    {\refstepcounter{resqCntr}\begin{resq*}#1\theresqCntr:}%
    {\end{resq*}}

\newcommand{\wpref}[1]{WP\ref{#1}}
\newcommand{\tskref}[1]{T\ref{#1}}

% Tables
\RequirePackage{longtable}

\endinput

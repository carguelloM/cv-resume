%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV - RESUME CLASS FILE
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% This class file defines the structure and design of the template. 
%
% Original header:
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
% Created by Trey Hunner and modified by www.LaTeXTemplates.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}[2010/07/10 v0.9 Resume class]

\LoadClass[11pt,letterpaper]{article} % Font size and paper type

\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements

\pagestyle{empty} % Suppress page numbers

%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

\def \name#1{\def\@name{#1}} % Defines the \name command to set name
\def \@name {} % Sets \@name to empty by default

\def \addressSep {$\diamond$} % Set default address separator to a diamond

% One, two or three address lines can be specified 
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

% \address command can be used to set the first, second, and third address (last 2 optional)
\def \address #1{
  \@ifundefined{@addresstwo}{
    \def \@addresstwo {#1}
  }{
  \@ifundefined{@addressthree}{
  \def \@addressthree {#1}
  }{
     \def \@addressone {#1}
  }}
}

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{
  \begingroup
    \def \\ {\addressSep\ }
    \centerline{#1}
  \endgroup
  \par
  \addressskip
}

% \printname is used to print the name as a page header
\def \printname {
  \begingroup
    \hfil{\MakeUppercase{\namesize\bf \@name}}\hfil
    \nameskip\break
  \endgroup
}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document  % Begin document
  \printname % Print the name specified with \name
  \@ifundefined{@addressone}{}{ % Print the first address if specified
    \printaddress{\@addressone}}
  \@ifundefined{@addresstwo}{}{ % Print the second address if specified
    \printaddress{\@addresstwo}}
     \@ifundefined{@addressthree}{}{ % Print the third address if specified
    \printaddress{\@addressthree}}
}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the large sections within the CV
\newenvironment{rSection}[1]{ % 1 input argument - section name
  \sectionskip
  \MakeUppercase{\bf #1} % Section title
  \sectionlineskip
  \hrule % Horizontal line
  \begin{list}{}{ % List for each individual item in the section
    \setlength{\leftmargin}{1.5em} % Margin within the section
  }
  \item[]
}{
  \end{list}
}

%----------------------------------------------------------------------------------------
%	Publications format 
%----------------------------------------------------------------------------------------
% Define separate counters
\newcounter{cpcounter}
\newcounter{jacounter}
\newcounter{pcounter}

%init all counters to zero 
% \setcounter{cpcounter}{0}
% \setcounter{jacounter}{0}
% \setcounter{pcounter}{0}

% display counter
\newcommand{\cpcounterlabel}{%
    \stepcounter{cpcounter} % Increment the counter
    \textbf{CP\thecpcounter} % Format as CPXX
}

\newcommand{\jacounterlabel}{
  \stepcounter{jacounter}
  \textbf{JA\thejacounter}
}

\newcommand{\pcounterlabel}{
  \stepcounter{pcounter}
  \textbf{P\thepcounter}

}

\newenvironment{rSubsection_Conference}[1]{ 
 {\bf #1} 
  \begin{list}{\cpcounterlabel}{    \setcounter{cpcounter}{0}% Initialize the counter
    \setlength{\labelwidth}{3em}% Reserve space for the label
    \setlength{\labelsep}{0.5em}% Space between the label and the text
    \setlength{\leftmargin}{4em}% Total indentation for the list items
    \setlength{\rightmargin}{5pt}% No extra margin on the right
  }
  }{
  \end{list}
  \vspace{0.5em} % Some space after the list of bullet points
}

\newenvironment{rSubsection_Journal}[1]{ 
 {\bf #1} 
  \begin{list}{\jacounterlabel}{ \setcounter{jacounter}{0}% Initialize the counter
    \setlength{\labelwidth}{3em}% Reserve space for the label
    \setlength{\labelsep}{0.5em}% Space between the label and the text
    \setlength{\leftmargin}{4em}% Total indentation for the list items
    \setlength{\rightmargin}{5pt}% No extra margin on the right
  }
  }{
  \end{list}
  \vspace{0.5em} % Some space after the list of bullet points
}

\newenvironment{rSubsection_Poster}[1]{ 
 {\bf #1} 
  \begin{list}{\pcounterlabel}{ \setcounter{pcounter}{0}% Initialize the counter
    \setlength{\labelwidth}{3em}% Reserve space for the label
    \setlength{\labelsep}{0.5em}% Space between the label and the text
    \setlength{\leftmargin}{4em}% Total indentation for the list items
    \setlength{\rightmargin}{5pt}% No extra margin on the right
  }
  }{
  \end{list}
  \vspace{0.5em} % Some space after the list of bullet points
}
%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rSubsection}[4]{ % 4 input arguments - company name, year(s) employed, job title and location
 {\bf #1} \hfill {#2} % Bold company name and date on the right
 \ifthenelse{\equal{#3}{}}{}{ % If the third argument is not specified, don't print the job title and location line
  \\
  {\bf{\em #3}} \hfill {\em #4} % Italic job title and location
  }\smallskip
  \begin{list}{$\cdot$}{\leftmargin=0em} % \cdot used for bullets, no indentation
   \itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
  }{
  \end{list}
  \vspace{0.5em} % Some space after the list of bullet points
}

%----------------------------------------------------------------------------------------
%	TEACHING EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rSubsection_ta}[5]{ % 5 input arguments - company name, year(s) employed, job title and location
 {\bf #1} \hfill {#2} % Bold company name and date on the right
 \ifthenelse{\equal{#3}{}}{}{ % If the third argument is not specified, don't print the job title and location line
  \\
  {\bf{\em #3}} \hfill {\em #4} % Italic job title and location
  \\
  {\em #5}
  }\smallskip
  \begin{list}{$\cdot$}{\leftmargin=0em} % \cdot used for bullets, no indentation
   \itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
  }{
  \end{list}
  \vspace{0.5em} % Some space after the list of bullet points
}

%---------------------------------------------------------------------------------------
% Projects
%----------------------------------------------------------------------------------------
\newenvironment{rSubsection_project}[2]{ % 4 input arguments - company name, year(s) employed, job title and location
 {\bf #1} \hfill {#2} \\ % Bold company name and date on the right 
  \vspace{0.5em} % Some space after the list of bullet points
}

%----------------------------------------------------------------------------------------
%	RESEARCH EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------
\newenvironment{rSubsection_ra}[6]{ % 5 input arguments - company name, year(s) employed, job title and location
 {\bf #1} \hfill {#2} % Bold company name and date on the right
 \ifthenelse{\equal{#3}{}}{}{ % If the third argument is not specified, don't print the job title and location line
  \\
  {\bf{\em #3}} \hfill {\em #4} % Italic job title and location
  \\
  {\em #5} \\
  {\em Advisor: #6}
  }\smallskip
  \begin{list}{$\cdot$}{\leftmargin=0em} % \cdot used for bullets, no indentation
   \itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
  }{
  \end{list}
  \vspace{0.5em} % Some space after the list of bullet points
}
% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\huge} % Size of the name at the top of the document
\def\addressskip{\smallskip} % The space between the two address (or phone/email) lines
\def\sectionlineskip{\medskip} % The space above the horizontal line for each section 
\def\nameskip{\bigskip} % The space after your name at the top
\def\sectionskip{\medskip} % The space after the heading section

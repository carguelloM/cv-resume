%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Resume / CV class
%
% Based on the class by Trey Hunner (Copyright (C) 2010), distributed via
% http://www.LaTeXTemplates.com, with the publication-list environments added
% locally. Copying and distribution of this file, with or without
% modification, are permitted in any medium without royalty provided the
% copyright notice and this notice are preserved. Offered as-is, without
% any warranty.
%
% Changes from the previous local version:
%   * Institution line is italic again, not bold-italic (see \orgfont).
%   * \sectionfont / \rolefont / \orgfont hooks added so weights can be
%     changed in one place instead of edited inline.
%   * Obsolete LaTeX 2.09 \bf and \em switches replaced with \bfseries /
%     \itshape / \textbf.
%   * rSubsection_project now has an end-definition (it previously had none
%     and silently absorbed the following \par as its end code).
%   * \pcounterlabel no longer contains a blank line, which put a stray \par
%     inside a list label.
%   * \address now fills addressone, then two, then three, in that order.
%   * Bullet lists indent to \rbulletindent so bullets line up under the
%     role/organisation block instead of hanging left of it.
%   * \Needspace guard keeps a section heading from stranding at a page foot.
%   * \usepackage replaced with \RequirePackage, as required in a class file.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2026/08/27 v1.0 Resume class]
\LoadClass[11pt,letterpaper]{article}
\RequirePackage[parfill]{parskip}
\RequirePackage{array}
\RequirePackage{ifthen}
\RequirePackage{needspace}
\pagestyle{empty}

% Style hooks
\newcommand{\sectionfont}{\bfseries}
\newcommand{\rolefont}{\bfseries}
\newcommand{\orgfont}{\itshape}
\newcommand{\rbulletindent}{1.5em}

\def\name#1{\def\@name{#1}}
\def\@name{}
\def\addressSep{$\diamond$}
\let\@addressone\relax
\let\@addresstwo\relax
\let\@addressthree\relax
\def\address#1{%
  \@ifundefined{@addressone}{\def\@addressone{#1}}%
  {\@ifundefined{@addresstwo}{\def\@addresstwo{#1}}%
  {\def\@addressthree{#1}}}%
}
\def\printaddress#1{%
  \begingroup
    \def\\{\addressSep\ }%
    \centerline{#1}%
  \endgroup
  \par\addressskip
}
\def\printname{%
  \begingroup
    \centerline{\namesize\bfseries\MakeUppercase{\@name}}%
    \nameskip
  \endgroup
  \par
}
\let\ori@document=\document
\renewcommand{\document}{%
  \ori@document
  \printname
  \@ifundefined{@addressone}{}{\printaddress{\@addressone}}%
  \@ifundefined{@addresstwo}{}{\printaddress{\@addresstwo}}%
  \@ifundefined{@addressthree}{}{\printaddress{\@addressthree}}%
}
\newenvironment{rSection}[1]{%
  \Needspace*{7\baselineskip}% keep a heading with at least some of its body
  \sectionskip
  {\sectionfont\MakeUppercase{#1}}%
  \sectionlineskip
  \hrule
  \begin{list}{}{\setlength{\leftmargin}{1.5em}}%
  \item[]
}{%
  \end{list}%
}
\newcounter{cpcounter}\newcounter{jacounter}\newcounter{pcounter}
\newcommand{\cpcounterlabel}{\stepcounter{cpcounter}\textbf{CP\thecpcounter}}
\newcommand{\jacounterlabel}{\stepcounter{jacounter}\textbf{JA\thejacounter}}
\newcommand{\pcounterlabel}{\stepcounter{pcounter}\textbf{P\thepcounter}}
\newcommand{\rPubList}[2]{%
  \begin{list}{#1}{\setcounter{#2}{0}%
    \setlength{\labelwidth}{3em}\setlength{\labelsep}{0.5em}%
    \setlength{\leftmargin}{4em}\setlength{\rightmargin}{5pt}}%
}
\newenvironment{rSubsection_Conference}[1]{%
  {\rolefont #1}\rPubList{\cpcounterlabel}{cpcounter}%
}{\end{list}\vspace{0.5em}}
\newenvironment{rSubsection_Journal}[1]{%
  {\rolefont #1}\rPubList{\jacounterlabel}{jacounter}%
}{\end{list}\vspace{0.5em}}
\newenvironment{rSubsection_Poster}[1]{%
  {\rolefont #1}\rPubList{\pcounterlabel}{pcounter}%
}{\end{list}\vspace{0.5em}}
\newcommand{\rBullets}{%
  \begin{list}{$\cdot$}{\setlength{\leftmargin}{\rbulletindent}%
    \setlength{\labelwidth}{1em}\setlength{\labelsep}{0.5em}%
    \setlength{\itemsep}{-0.5em}\setlength{\topsep}{0pt}}%
}
\newenvironment{rSubsection}[4]{%
  {\rolefont #1}\hfill{#2}%
  \ifthenelse{\equal{#3}{}}{}{\\{\orgfont #3}\hfill{\orgfont #4}}%
  \smallskip\rBullets
}{\end{list}\vspace{0.5em}}
\newenvironment{rSubsection_ta}[5]{%
  {\rolefont #1}\hfill{#2}%
  \ifthenelse{\equal{#3}{}}{}{\\{\orgfont #3}\hfill{\orgfont #4}\\{\orgfont #5}}%
  \smallskip\rBullets
}{\end{list}\vspace{0.5em}}
\newenvironment{rSubsection_ra}[6]{%
  {\rolefont #1}\hfill{#2}%
  \ifthenelse{\equal{#3}{}}{}{\\{\orgfont #3}\hfill{\orgfont #4}\\{\orgfont #5}\\{\orgfont Advisor: #6}}%
  \smallskip\rBullets
}{\end{list}\vspace{0.5em}}
\newenvironment{rSubsection_project}[2]{%
  {\rolefont #1}\hfill{#2}\\
}{\vspace{0.5em}}
\def\namesize{\huge}
\def\addressskip{\smallskip}
\def\sectionlineskip{\medskip}
\def\nameskip{\bigskip}
\def\sectionskip{\medskip}
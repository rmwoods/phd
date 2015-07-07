%%% ======================================================================
%%%  @LaTeX-file{
%%%     filename  = "macthesis.sty",
%%%     date      = "2005/05/24",
%%%     time      = "15:00:00 EDT",


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[1995/06/01]
\ProvidesClass{macthesis}[2005/05/24 v2.3.0 macthesis class]
\RequirePackage{ifthen}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Declare options for different degree types.
% Allowable degrees are:
%     Ph.D. using class option <phd>
%     M.S. using class option <ms>
%     M.Eng. using class option <meng>
%     M.A. using class option <ma>
%     B.S. using class option <bs>
%     B.A. using class option <ba>
%     Bachelors degree with honors using class option <honors>
%
% The option of an option sets the boolean for that option to
% true and all others to false.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newboolean{mac@secondthesissupervisor}
\newboolean{mac@honorsdepthead}
\newboolean{mac@honors}
\newboolean{mac@bs}
\newboolean{mac@ba}
\newboolean{mac@ms}
\newboolean{mac@meng}
\newboolean{mac@ma}
\newboolean{mac@phd}
\newboolean{mac@toc}
\setboolean{mac@secondthesissupervisor}{false}
\setboolean{mac@honorsdepthead}{false}
\setboolean{mac@honors}{false}
\setboolean{mac@bs}{false}
\setboolean{mac@ba}{false}
\setboolean{mac@ms}{false}
\setboolean{mac@meng}{false}
\setboolean{mac@ma}{false}
\setboolean{mac@phd}{false}

\DeclareOption{bs}{\setboolean{mac@bs}{true}\setboolean{mac@phd}{false}}
\DeclareOption{ba}{\setboolean{mac@ba}{true}\setboolean{mac@phd}{false}}
\DeclareOption{ms}{\setboolean{mac@ms}{true}\setboolean{mac@phd}{false}}
\DeclareOption{meng}{\setboolean{mac@meng}{true}\setboolean{mac@phd}{false}}
\DeclareOption{ma}{\setboolean{mac@ma}{true}\setboolean{mac@phd}{false}}
\DeclareOption{phd}{\setboolean{mac@phd}{true}}
\DeclareOption{inlinechaptertoc}{\setboolean{mac@toc}{true}}
\DeclareOption{honorsdepthead}{\setboolean{mac@honorsdepthead}{true}}
\DeclareOption{secondthesissupervisor}{\setboolean{mac@secondthesissupervisor}{true}}
\DeclareOption{honors}{\setboolean{mac@honors}{true}%...
\setboolean{mac@bs}{false}\setboolean{mac@ba}{false}\setboolean{mac@phd}{false}}

\DeclareOption{draft}{\PassOptionsToClass{\CurrentOption}{report}}
\DeclareOption*{\PackageWarning{macthesis}{Unknown option `\CurrentOption'. Ignoring}}
\ExecuteOptions{phd} % the default option is <phd>
\ProcessOptions
\LoadClass[openright,oneside,12pt]{book}
\RequirePackage{calc}
\RequirePackage{setspace}
% If you are using the subfigure package, load the tocloft package with
% the subfigure option and comment out the next line.
\RequirePackage{tocloft}[2003/09/26]
%\RequirePackage[subfigure]{tocloft}[2003/09/26]
\RequirePackage{fancyhdr}
%
%*****************************************************



% Define the margins and other spacings.
\setlength{\oddsidemargin}{0.5in} %plus 1 inch
\setlength{\topmargin}{-0.25in}%{0.25in} %plus 1 inch. Header is in margin
\setlength{\headheight}{18pt}%{12pt}
\setlength{\headsep}{1.25\baselineskip}%{1.8\baselineskip}
\textheight=8.5in %8.25in
\setlength{\textheight}{8.5in} %{8.25in}
\setlength{\textwidth}{5.5in}
% !!!!!!!! SEE ALSO SETTING AT END OF FILE (thesismainmatter)!!!!!!!!


% Set the baselinestretch using the setspace package.
% The LaTeX Companion claims that a \baselinestretch of
% 1.24 gives one-and-a-half line spacing, which is allowed
% by the mac thesis office. FC likes 1.28 better. :-)
\setstretch{1.5}


%%%%%%%%%%%%%%%%%%%%%%%%
% Settings for tocloft %
%%%%%%%%%%%%%%%%%%%%%%%%
% Format chapter entries so that the chapter name goes on a line
% following "Chapter #".
\ifthenelse{\boolean{mac@toc}}
{%
% Format chapter entries so that the chapter name goes the same line
% as "Chapter #".
\renewcommand{\cftchappresnum}{Chapter }
\newlength{\mylength}% a "scratch" length
\settowidth{\mylength}{\bfseries\cftchappresnum\cftchapaftersnum}% extra space
\addtolength{\cftchapnumwidth}{\mylength} % add the extra space
}
{%
\newlength{\mylength}% a "scratch" length
\settowidth{\mylength}{\bfseries\cftchappresnum\cftchapaftersnum}% extra space
\addtolength{\cftchapnumwidth}{\mylength} % add the extra space
\renewcommand{\cftchapfont}{\bfseries}
\renewcommand{\cftchapleader}{\bfseries\cftdotfill{\cftchapdotsep}}
\renewcommand{\cftchappagefont}{\bfseries}
\renewcommand{\cftchappresnum}{Chapter }
\renewcommand{\cftchapaftersnumb}{\\}
}%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Here we define internal "commands" that will be used to store the
% thesis title, author name, department, etc.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Store the title of the thesis.
\newcommand{\mac@title}{Seeing the Forest \emph{With} the Trees: A Novel Radiative Transfer Algorithm for Astrophysical Simulations.}
\renewcommand{\title}[1]{\renewcommand{\mac@title}{#1}}

% Store the author's name.
\newcommand{\mac@author}{Rory Woods}
\renewcommand{\author}[1]{\renewcommand{\mac@author}{#1}}

% Store the department name.
\newcommand{\mac@dept}{Physics \& Astronomy}
\providecommand{\dept}[1]{\renewcommand{\mac@dept}{#1}}

% Store the date the degree will be conferred.
\newcommand{\mac@degreedate}{September 2015}
\providecommand{\degreedate}[1]{\renewcommand{\mac@degreedate}{#1}}

% Store the year of the copyright.
\newcommand{\mac@copyrightyear}{2015}
\providecommand{\copyrightyear}[1]{\renewcommand{\mac@copyrightyear}{#1}}

% Store the document type.
\newcommand{\mac@documenttype}{Thesis}
\providecommand{\documenttype}[1]{\renewcommand{\mac@documenttype}{#1}}

% Store the academic unit to which the document has been submitted.
\newcommand{\mac@submittedto}{School of Graduate Studies}
\providecommand{\submittedto}[1]{\renewcommand{\mac@submittedto}{#1}}

% Store the the info for the honors degree(s) type(s).
\newcommand{\mac@honorsdegreeinfo}{for a baccalaureate degree in Physics}
\providecommand{\honorsdegreeinfo}[1]{\renewcommand{\mac@honorsdegreeinfo}{#1}}

% Store the academic unit to which the document has been submitted.
\newcommand{\mac@honorsadviser}{Drs.~James Wadsley}
\providecommand{\honorsadviser}[1]{\renewcommand{\mac@honorsadviser}{#1}}

% Store the academic unit to which the document has been submitted.
\newcommand{\mac@honorsdepthead}{Dr.~David Venus}
\providecommand{\honorsdepthead}[1]{\renewcommand{\mac@honorsdepthead}{#1}}

% Store the name of the second Thesis Supervisor for a baccalaureate degree.
\newcommand{\mac@secondthesissupervisor}{Dr.~Hugh M.~P. Couchman}
\providecommand{\secondthesissupervisor}[1]{\renewcommand{\mac@secondthesissupervisor}{#1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Store the name of the degree by determining which boolean was
% set in the class option was specified.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifthenelse{\boolean{mac@bs}}%
{\newcommand{\mac@degreetype}{Baccalaureate of Science}}%
{}

\ifthenelse{\boolean{mac@ba}}%
{\newcommand{\mac@degreetype}{Baccalaureate of Arts}}%
{}

\ifthenelse{\boolean{mac@ms}}%
{\newcommand{\mac@degreetype}{\textbf{M}aster of \textbf{S}cience}}%
{}

\ifthenelse{\boolean{mac@meng}}%
{\newcommand{\mac@degreetype}{Master of Engineering}}%
{}

\ifthenelse{\boolean{mac@ma}}%
{\newcommand{\mac@degreetype}{Master of Arts}}%
{}

\ifthenelse{\boolean{mac@phd}}%
{\newcommand{\mac@degreetype}{Doctor of Philosophy}}%
{}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Store the number of readers in \mac@readers. This quantity is
% input in the main file using the \numberofreaders command.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\mac@readers}{2}
\providecommand{\numberofreaders}[1]{\renewcommand{\mac@readers}{#1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%Supervisor and committee members
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\mac@advisor}{Drs.~James Wadsley & Hugh Couchman}
\newcommand{\mac@advisortitle}{}
\newcommand{\mac@advisoroption}{}%
\providecommand{\advisor}[3][]%
{\renewcommand{\mac@advisoroption}{#1}%
\renewcommand{\mac@advisor}{#2}%
\renewcommand{\mac@advisortitle}{#3}}

\newcommand{\mac@readerone}{Dr.~Laura Parker}
\newcommand{\mac@readeronetitle}{}
\newcommand{\mac@readeroneoption}{}%
\providecommand{\readerone}[3][]%
{\renewcommand{\mac@readeroneoption}{#1}%
\renewcommand{\mac@readerone}{#2}%
\renewcommand{\mac@readeronetitle}{#3}}

\newcommand{\mac@readertwo}{Dr.~Christine Wilson}
\newcommand{\mac@readertwotitle}{}
\newcommand{\mac@readertwooption}{}%
\providecommand{\readertwo}[3][]%
{\renewcommand{\mac@readertwooption}{#1}%
\renewcommand{\mac@readertwo}{#2}%
\renewcommand{\mac@readertwotitle}{#3}}

\newcommand{\mac@readerthree}{}
\newcommand{\mac@readerthreetitle}{}
\newcommand{\mac@readerthreeoption}{}%
\providecommand{\readerthree}[3][]%
{\renewcommand{\mac@readerthreeoption}{#1}%
\renewcommand{\mac@readerthree}{#2}%
\renewcommand{\mac@readerthreetitle}{#3}}

\newcommand{\mac@readerfour}{}
\newcommand{\mac@readerfourtitle}{}
\newcommand{\mac@readerfouroption}{}%
\providecommand{\readerfour}[3][]%
{\renewcommand{\mac@readerfouroption}{#1}%
\renewcommand{\mac@readerfour}{#2}%
\renewcommand{\mac@readerfourtitle}{#3}}

\newcommand{\mac@readerfive}{}
\newcommand{\mac@readerfivetitle}{}
\newcommand{\mac@readerfiveoption}{}%
\providecommand{\readerfive}[3][]%
{\renewcommand{\mac@readerfiveoption}{#1}%
\renewcommand{\mac@readerfive}{#2}%
\renewcommand{\mac@readerfivetitle}{#3}}

\newcommand{\mac@readersix}{}
\newcommand{\mac@readersixtitle}{}
\newcommand{\mac@readersixoption}{}%
\providecommand{\readersix}[3][]%
{\renewcommand{\mac@readersixoption}{#1}%
\renewcommand{\mac@readersix}{#2}%
\renewcommand{\mac@readersixtitle}{#3}}


\newsavebox{\tempbox}
\renewcommand{\@makecaption}[2]{%
\vspace{7pt}\sbox{\tempbox}{\small\textbf{#1.} #2}%
\ifthenelse{\lengthtest{\wd\tempbox > \linewidth}}%
{\small\textbf{#1.} #2\par}%
{\centering \small\textbf{#1.} #2}%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                %
% The actual layout begins here. %
%                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Here is the permission page.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\macpermissionpage}{%
\thispagestyle{empty}
\begin{singlespace}
\noindent
I grant McMaster University the non-exclusive right to use this work for the University's own purposes and to make single copies of the work available to the public on a not-for-profit basis if copies are not otherwise available. \\[0.6in]
\mbox{} \hfill
\parbox{3in}{\begin{center} \rule{3in}{0.4pt} \\ \mac@author
\end{center}}
\end{singlespace}
\newpage
\addtocounter{page}{-1}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Here is the title page.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\mactitlepage}{%

\thispagestyle{empty}
%\mbox{}\vfill
%\noindent
\vspace*{2.75in}

\begin{center}
  SEEING THE FOREST \emph{WITH} THE TREES: A NOVEL RADIATIVE TRANSFER ALGORITHM FOR ASTROPHYSICAL SIMULATIONS.
\end{center}

%\vfill


\newpage


\setcounter{page}{1}
\thispagestyle{empty}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%if-then-else%%%%%%%%%%%%%%%%%%%%%%%%%%%(\not{} = ! in C language)
\ifthenelse{\boolean{mac@honors}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%then%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
{%
\vspace*{-0.75in}
%\enlargethispage{0.5in}
\begin{center}
MCMASTER UNIVERSITY
\end{center}
\vfill
\begin{center}
\mac@dept
\end{center}
\vfill
\begin{center}
\mac@title
\end{center}
\vfill
\begin{center}
\mac@author \\ \mac@degreedate
\end{center}
\vfill
\begin{center}
A thesis \\ submitted in partial fulfillment \\ of the requirements \\
\mac@honorsdegreeinfo
\end{center}
\vfill
\mbox{}
\ifthenelse{\boolean{mac@honorsdepthead}}{%
\begin{tabbing}%
Approved: \= \rule{2.75in}{0.5pt} \quad Date: \= \rule{1.5in}{0.5pt} \\[-3pt]
          \> \qquad \mac@advisor \\[-3pt]
          \> \qquad Thesis Supervisor \\[8mm]
%
\ifthenelse{\boolean{mac@secondthesissupervisor}}{%
          \> \rule{2.75in}{0.5pt}              \> \rule{1.5in}{0.5pt} \\[-3pt]
          \> \qquad \mac@secondthesissupervisor \\[-3pt]
          \> \qquad Thesis Supervisor \\[8mm]
}{}%
%
          \> \rule{2.75in}{0.5pt}              \> \rule{1.5in}{0.5pt} \\[-3pt]
          \> \qquad \mac@honorsadviser \\[-3pt]
          \> \qquad Honors Adviser \\[8mm]
 %
          \> \rule{2.75in}{0.5pt}              \> \rule{1.5in}{0.5pt} \\[-3pt]
          \> \qquad \mac@honorsdepthead \\[-3pt]
          \> \qquad Department Head
\end{tabbing}%
}%
{%
\begin{tabbing}%
Approved: \= \rule{2.75in}{0.5pt} \quad Date: \= \rule{1.5in}{0.5pt} \\[-3pt]
          \> \qquad \mac@advisor \\[-3pt]
          \> \qquad Thesis Supervisor \\[8mm]
%
\ifthenelse{\boolean{mac@secondthesissupervisor}}{%
          \> \rule{2.75in}{0.5pt}              \> \rule{1.5in}{0.5pt} \\[-3pt]
          \> \qquad \mac@secondthesissupervisor \\[-3pt]
          \> \qquad Thesis Supervisor \\[8mm]
}{}%
%
          \> \rule{2.75in}{0.5pt}              \> \rule{1.5in}{0.5pt} \\[-3pt]
          \> \qquad \mac@honorsadviser \\[-3pt]
          \> \qquad Honors Adviser
\end{tabbing}%
}%
}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%else%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
{%
\vspace*{-0.75in}
\begin{center}
    \textbf{ }
\end{center}
\vfill
\begin{center}
    \setstretch{2}
    \bfseries\uppercase\expandafter{\mac@title}
\end{center}
\vfill
\begin{center}
    By\\
    RORY WOODS, B.Sc., M.Sc.\\
\end{center}
\vfill
\begin{center}
    A Thesis \\
    Submitted to the School of Graduate Studies\\
    in Partial Fulfillment of the Requirements\\
    for the Degree of
\end{center}
\vfill
\begin{center}
     \mac@degreetype
\end{center}
\vfill
%\begin{center}
%    \mac@degreedate
%\end{center}
\vfill
\begin{center}
    {McMaster University\\
            }
\end{center}
\begin{center}
    \copyright\ \mac@author,\  \mac@degreedate
\end{center}
\newpage
\ifthenelse{\boolean{mac@ms} \or \boolean{mac@meng} \or \boolean{mac@ma}}{\macpermissionpage}{}
}
%%%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Here is the signature page.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\signature}[1]{%
\begin{minipage}{\textwidth}
   \rule{3.9in}{0.4pt} \hfill \rule{1.375in}{0.4pt} \\ {\normalsize #1}
\end{minipage}}

\newlength{\mac@sigoptionskip}
\newlength{\mac@sigafteroptionskip}
\newlength{\mac@intersigspace}
% \newlength{\mac@spacebeforedateofsig}
% \settowidth{\mac@spacebeforedateofsig}{\normalsize Date of Signature}
\setlength{\mac@sigoptionskip}{-0.04in}
\newcommand{\mac@signaturepage}{%
    \footnotesize
    \ifthenelse{\mac@readers = 6}{%
        \setlength{\mac@sigafteroptionskip}{2.65\baselineskip}
        \setlength{\mac@intersigspace}{2.65\baselineskip}
    }%
    {%
        \setlength{\mac@sigafteroptionskip}{3.4\baselineskip}
        \setlength{\mac@intersigspace}{3.4\baselineskip}
    }
    \enlargethispage*{0.5in}
    \thispagestyle{empty}
    \vspace*{-0.5in}
    \noindent {\normalsize We approve the submission of \mac@author's\
      Ph.D. thesis to the McMaster School of Graduate Studies for
      examination.}\\[0.1in] 
    \mbox{}\hspace{4.0in} {\normalsize Date of Signature}\\[3\baselineskip]
    \signature\mac@advisor\\[1mm]
         \mac@advisortitle
         \ifthenelse{\equal{\mac@advisoroption}{}}%
                    {\\[\mac@intersigspace]}%
                    {\\[\mac@sigoptionskip]
                        \mac@advisoroption \\[\mac@sigafteroptionskip]}
\ifcase \mac@readers
\or
     \signature\mac@readerone\\[1mm]
          \mac@readeronetitle
          \ifthenelse{\equal{\mac@readeroneoption}{}}%
                     {}%
                     {\\[\mac@sigoptionskip] \mac@readeroneoption}
\or
     \signature\mac@readerone\\[1mm]
          \mac@readeronetitle
          \ifthenelse{\equal{\mac@readeroneoption}{}}%
                     {\\[\mac@intersigspace]}%
                     {\\[\mac@sigoptionskip]
                               \mac@readeroneoption \\[\mac@sigafteroptionskip]}
     \signature\mac@readertwo\\[1mm]
          \mac@readertwotitle
          \ifthenelse{\equal{\mac@readertwooption}{}}%
                     {}%
                     {\\[\mac@sigoptionskip] \mac@readertwooption}
\or
     \signature{\mac@readerone}\\[1mm]
          \mac@readeronetitle
          \ifthenelse{\equal{\mac@readeroneoption}{}}%
                     {\\[\mac@intersigspace]}%
                     {\\[\mac@sigoptionskip]
                               \mac@readeroneoption \\[\mac@sigafteroptionskip]}
     \signature{\mac@readertwo}\\[1mm]
          \mac@readertwotitle
          \ifthenelse{\equal{\mac@readertwooption}{}}%
                     {\\[\mac@intersigspace]}%
                     {\\[\mac@sigoptionskip]
                               \mac@readertwooption \\[\mac@sigafteroptionskip]}
     \signature{\mac@readerthree}\\[1mm]
          \mac@readerthreetitle
          \ifthenelse{\equal{\mac@readerthreeoption}{}}%
                     {}%
                     {\\[\mac@sigoptionskip] \mac@readerthreeoption}
\or
     \signature\mac@readerone\\[1mm]
          \mac@readeronetitle
          \ifthenelse{\equal{\mac@readeroneoption}{}}%
                     {\\[\mac@intersigspace]}%
                     {\\[\mac@sigoptionskip]
                               \mac@readeroneoption \\[\mac@sigafteroptionskip]}
     \signature\mac@readertwo\\[1mm]
          \mac@readertwotitle
          \ifthenelse{\equal{\mac@readertwooption}{}}%
                     {\\[\mac@intersigspace]}%
                     {\\[\mac@sigoptionskip]
                               \mac@readertwooption \\[\mac@sigafteroptionskip]}
     \signature\mac@readerthree\\[1mm]
          \mac@readerthreetitle
          \ifthenelse{\equal{\mac@readerthreeoption}{}}%
                     {\\[\mac@intersigspace]}%
                     {\\[\mac@sigoptionskip]
                               \mac@readerthreeoption \\[\mac@sigafteroptionskip]}
     \signature\mac@readerfour\\[1mm]
          \mac@readerfourtitle
          \ifthenelse{\equal{\mac@readerfouroption}{}}%
                     {}%
                     {\\[\mac@sigoptionskip] \mac@readerfouroption}
\or
     \signature\mac@readerone\\[1mm]
          \mac@readeronetitle
          \ifthenelse{\equal{\mac@readeroneoption}{}}%
                     {\\[\mac@intersigspace]}%
                     {\\[\mac@sigoptionskip]
                               \mac@readeroneoption \\[\mac@sigafteroptionskip]}
     \signature\mac@readertwo\\[1mm]
          \mac@readertwotitle
          \ifthenelse{\equal{\mac@readertwooption}{}}%
                     {\\[\mac@intersigspace]}%
                     {\\[\mac@sigoptionskip]
                               \mac@readertwooption \\[\mac@sigafteroptionskip]}
     \signature\mac@readerthree\\[1mm]
          \mac@readerthreetitle
          \ifthenelse{\equal{\mac@readerthreeoption}{}}%
                     {\\[\mac@intersigspace]}%
                     {\\[\mac@sigoptionskip]
                               \mac@readerthreeoption \\[\mac@sigafteroptionskip]}
     \signature\mac@readerfour\\[1mm]
          \mac@readerfourtitle
          \ifthenelse{\equal{\mac@readerfouroption}{}}%
                     {\\[\mac@intersigspace]}%
                     {\\[\mac@sigoptionskip]
                               \mac@readerfouroption \\[\mac@sigafteroptionskip]}
     \signature\mac@readerfive\\[1mm]
          \mac@readerfivetitle
          \ifthenelse{\equal{\mac@readerfiveoption}{}}%
                     {}%
                     {\\[\mac@sigoptionskip] \mac@readerfiveoption}
\or
     \signature\mac@readerone\\[1mm]
          \mac@readeronetitle
          \ifthenelse{\equal{\mac@readeroneoption}{}}%
                     {\\[\mac@intersigspace]}%
                     {\\[\mac@sigoptionskip]
                               \mac@readeroneoption \\[\mac@sigafteroptionskip]}
     \signature\mac@readertwo\\[1mm]
          \mac@readertwotitle
          \ifthenelse{\equal{\mac@readertwooption}{}}%
                     {\\[\mac@intersigspace]}%
                     {\\[\mac@sigoptionskip]
                               \mac@readertwooption \\[\mac@sigafteroptionskip]}
     \signature\mac@readerthree\\[1mm]
          \mac@readerthreetitle
          \ifthenelse{\equal{\mac@readerthreeoption}{}}%
                     {\\[\mac@intersigspace]}%
                     {\\[\mac@sigoptionskip]
                               \mac@readerthreeoption \\[\mac@sigafteroptionskip]}
     \signature\mac@readerfour\\[1mm]
          \mac@readerfourtitle
          \ifthenelse{\equal{\mac@readerfouroption}{}}%
                     {\\[\mac@intersigspace]}%
                     {\\[\mac@sigoptionskip]
                               \mac@readerfouroption \\[\mac@sigafteroptionskip]}
     \signature\mac@readerfive\\[1mm]
          \mac@readerfivetitle
          \ifthenelse{\equal{\mac@readerfiveoption}{}}%
                     {\\[\mac@intersigspace]}%
                     {\\[\mac@sigoptionskip]
                               \mac@readerfiveoption \\[\mac@sigafteroptionskip]}
     \signature\mac@readersix\\[1mm]
          \mac@readersixtitle
          \ifthenelse{\equal{\mac@readersixoption}{}}%
                     {}%
                     {\\[\mac@sigoptionskip] \mac@readersixoption}
\fi
\newpage
\normalsize
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Here is the committee page.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\maccommitteepage}{%
%    \setlength{\textheight}{8in}
    \ifthenelse{\mac@readers = 6}{%
        \setlength{\mac@sigafteroptionskip}{1.0\baselineskip}
        \setlength{\mac@intersigspace}{1.0\baselineskip}
    }%
    {%
        \setlength{\mac@sigafteroptionskip}{1.5\baselineskip}
        \setlength{\mac@intersigspace}{1.5\baselineskip}
    }
    \thispagestyle{empty}
    \vspace*{-0.5in}
    \noindent {\normalsize The thesis of \mac@author\ was reviewed and approved$^{*}$ by the following:}\\[3\baselineskip]
\mbox{}\hfill
\parbox{\textwidth - 0.5in}{
         \mac@advisor\\[\mac@sigoptionskip]
         \mac@advisortitle
         \ifthenelse{\equal{\mac@advisoroption}{}}%
                    {\\[\mac@intersigspace]}%
                    {\\[\mac@sigoptionskip]
                        \mac@advisoroption \\[\mac@sigafteroptionskip]}
\ifcase \mac@readers
\or
          \mac@readerone\\[\mac@sigoptionskip]
          \mac@readeronetitle
          \ifthenelse{\equal{\mac@readeroneoption}{}}%
                     {}%
                     {\\[\mac@sigoptionskip] \mac@readeroneoption}
\or
          \mac@readerone\\[\mac@sigoptionskip]
          \mac@readeronetitle
          \ifthenelse{\equal{\mac@readeroneoption}{}}%
                     {\\[\mac@intersigspace]}%
                     {\\[\mac@sigoptionskip]
                               \mac@readeroneoption \\[\mac@sigafteroptionskip]}
          \mac@readertwo\\[\mac@sigoptionskip]
          \mac@readertwotitle
          \ifthenelse{\equal{\mac@readertwooption}{}}%
                     {}%
                     {\\[\mac@sigoptionskip] \mac@readertwooption}
\or
          {\mac@readerone}\\[\mac@sigoptionskip]
          \mac@readeronetitle
          \ifthenelse{\equal{\mac@readeroneoption}{}}%
                     {\\[\mac@intersigspace]}%
                     {\\[\mac@sigoptionskip]
                               \mac@readeroneoption \\[\mac@sigafteroptionskip]}
          {\mac@readertwo}\\[\mac@sigoptionskip]
          \mac@readertwotitle
          \ifthenelse{\equal{\mac@readertwooption}{}}%
                     {\\[\mac@intersigspace]}%
                     {\\[\mac@sigoptionskip]
                               \mac@readertwooption \\[\mac@sigafteroptionskip]}
          {\mac@readerthree}\\[\mac@sigoptionskip]
          \mac@readerthreetitle
          \ifthenelse{\equal{\mac@readerthreeoption}{}}%
                     {}%
                     {\\[\mac@sigoptionskip] \mac@readerthreeoption}
\or
          \mac@readerone\\[\mac@sigoptionskip]
          \mac@readeronetitle
          \ifthenelse{\equal{\mac@readeroneoption}{}}%
                     {\\[\mac@intersigspace]}%
                     {\\[\mac@sigoptionskip]
                               \mac@readeroneoption \\[\mac@sigafteroptionskip]}
          \mac@readertwo\\[\mac@sigoptionskip]
          \mac@readertwotitle
          \ifthenelse{\equal{\mac@readertwooption}{}}%
                     {\\[\mac@intersigspace]}%
                     {\\[\mac@sigoptionskip]
                               \mac@readertwooption \\[\mac@sigafteroptionskip]}
          \mac@readerthree\\[\mac@sigoptionskip]
          \mac@readerthreetitle
          \ifthenelse{\equal{\mac@readerthreeoption}{}}%
                     {\\[\mac@intersigspace]}%
                     {\\[\mac@sigoptionskip]
                               \mac@readerthreeoption \\[\mac@sigafteroptionskip]}
          \mac@readerfour\\[\mac@sigoptionskip]
          \mac@readerfourtitle
          \ifthenelse{\equal{\mac@readerfouroption}{}}%
                     {}%
                     {\\[\mac@sigoptionskip] \mac@readerfouroption}
\or
          \mac@readerone\\[\mac@sigoptionskip]
          \mac@readeronetitle
          \ifthenelse{\equal{\mac@readeroneoption}{}}%
                     {\\[\mac@intersigspace]}%
                     {\\[\mac@sigoptionskip]
                               \mac@readeroneoption \\[\mac@sigafteroptionskip]}
          \mac@readertwo\\[\mac@sigoptionskip]
          \mac@readertwotitle
          \ifthenelse{\equal{\mac@readertwooption}{}}%
                     {\\[\mac@intersigspace]}%
                     {\\[\mac@sigoptionskip]
                               \mac@readertwooption \\[\mac@sigafteroptionskip]}
          \mac@readerthree\\[\mac@sigoptionskip]
          \mac@readerthreetitle
          \ifthenelse{\equal{\mac@readerthreeoption}{}}%
                     {\\[\mac@intersigspace]}%
                     {\\[\mac@sigoptionskip]
                               \mac@readerthreeoption \\[\mac@sigafteroptionskip]}
          \mac@readerfour\\[\mac@sigoptionskip]
          \mac@readerfourtitle
          \ifthenelse{\equal{\mac@readerfouroption}{}}%
                     {\\[\mac@intersigspace]}%
                     {\\[\mac@sigoptionskip]
                               \mac@readerfouroption \\[\mac@sigafteroptionskip]}
          \mac@readerfive\\[\mac@sigoptionskip]
          \mac@readerfivetitle
          \ifthenelse{\equal{\mac@readerfiveoption}{}}%
                     {}%
                     {\\[\mac@sigoptionskip] \mac@readerfiveoption}
\or
          \mac@readerone\\[\mac@sigoptionskip]
          \mac@readeronetitle
          \ifthenelse{\equal{\mac@readeroneoption}{}}%
                     {\\[\mac@intersigspace]}%
                     {\\[\mac@sigoptionskip]
                               \mac@readeroneoption \\[\mac@sigafteroptionskip]}
          \mac@readertwo\\[\mac@sigoptionskip]
          \mac@readertwotitle
          \ifthenelse{\equal{\mac@readertwooption}{}}%
                     {\\[\mac@intersigspace]}%
                     {\\[\mac@sigoptionskip]
                               \mac@readertwooption \\[\mac@sigafteroptionskip]}
          \mac@readerthree\\[\mac@sigoptionskip]
          \mac@readerthreetitle
          \ifthenelse{\equal{\mac@readerthreeoption}{}}%
                     {\\[\mac@intersigspace]}%
                     {\\[\mac@sigoptionskip]
                               \mac@readerthreeoption \\[\mac@sigafteroptionskip]}
          \mac@readerfour\\[\mac@sigoptionskip]
          \mac@readerfourtitle
          \ifthenelse{\equal{\mac@readerfouroption}{}}%
                     {\\[\mac@intersigspace]}%
                     {\\[\mac@sigoptionskip]
                               \mac@readerfouroption \\[\mac@sigafteroptionskip]}
          \mac@readerfive\\[\mac@sigoptionskip]
          \mac@readerfivetitle
          \ifthenelse{\equal{\mac@readerfiveoption}{}}%
                     {\\[\mac@intersigspace]}%
                     {\\[\mac@sigoptionskip]
                               \mac@readerfiveoption \\[\mac@sigafteroptionskip]}
          \mac@readersix\\[\mac@sigoptionskip]
          \mac@readersixtitle
          \ifthenelse{\equal{\mac@readersixoption}{}}%
                     {}%
                     {\\[\mac@sigoptionskip] \mac@readersixoption}
\fi
}

\mbox{}\vfill

\noindent
\parbox{\textwidth}{$^{*}$Signatures are on file in the Graduate School.}

\newpage
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%signature page cover
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\macsigpage}{%\setlength{\textheight}{8.0in}
{\thispagestyle{empty}
\sffamily%\bfseries
\mbox{}\vfill
\noindent

\begin{center}
  RADIATIVE TRANSFER IN GALAXIES
\end{center}

\vfill
}

\newpage
\mac@signaturepage}

\newcommand{\descriptivenote}[1]{%
\pagestyle{plain}
    \begin{onehalfspace}
        \input{#1}
    \end{onehalfspace}
\newpage
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%abstract
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\thesisabstract}[1]{
\pagestyle{plain}
%\chapter{Abstract}
    \begin{onehalfspace}
\addcontentsline{toc}{chapter}{Abstract}
        \input{#1}
    \end{onehalfspace}
\newpage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Table of Contents
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\contentsname}{Table of Contents}
\setcounter{secnumdepth}{10}
\setcounter{tocdepth}{4}
\newcommand{\thesistableofcontents}{%
\begin{singlespace}
\setstretch{2}
\if@twocolumn
\@restonecoltrue\onecolumn
\else
\@restonecolfalse
\fi
\chapter*{\contentsname
\@mkboth{%
\MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
\@starttoc{toc}%
\if@restonecol\twocolumn\fi%
\end{singlespace}
\clearpage
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%List of Figure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\thesislistoffigures}{%
\addcontentsline{toc}{chapter}{List of Figures}
\begin{singlespace}
\if@twocolumn
\@restonecoltrue\onecolumn
\else
\@restonecolfalse
\fi
\chapter*{\listfigurename
\@mkboth{%
\MakeUppercase\listfigurename}{\MakeUppercase\listfigurename}}%
\@starttoc{lof}%
\if@restonecol\twocolumn\fi
\end{singlespace}
\clearpage
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%List of Tables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\thesislistoftables}{%
\addcontentsline{toc}{chapter}{List of Tables}
\begin{singlespace}
\if@twocolumn
\@restonecoltrue\onecolumn
\else
\@restonecolfalse
\fi
\chapter*{\listtablename
\@mkboth{%
\MakeUppercase\listtablename}{\MakeUppercase\listtablename}}%
\@starttoc{lot}%
\if@restonecol\twocolumn\fi
\end{singlespace}
\clearpage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%List of Symbols
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\thesislistofsymbols}[1]{%
\chapter*{List of Symbols}
\addcontentsline{toc}{chapter}{List of Symbols}
\begin{singlespace}
    \input{#1}
\end{singlespace}
}

\newcommand{\thesiscoauthorship}[1]{%
%\chapter*{Co-Authorship}
\addcontentsline{toc}{chapter}{Co-Authorship}
\begin{onehalfspace}
    \input{#1}
\end{onehalfspace}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Acknowledgments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\thesisacknowledgments}[1]{%
%\chapter*{Acknowledgments}
\addcontentsline{toc}{chapter}{Acknowledgments}
    \begin{onehalfspace}
        \input{#1}
    \end{onehalfspace}
%\begin{singlespace}
%    \input{#1}
%\end{singlespace}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Dedication
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\thesisdedication}[2]{%
\chapter*{#2}
\begin{singlespace}
    \input{#1}
\end{singlespace}
\newpage
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Epigraph/Quotes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\thesisepigraph}[2]{%
\begin{singlespace}
    \input{#1}
\end{singlespace}
\newpage
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Appendix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\Appendix}[1]{%
\ifthenelse{\value{chapter} = 0}
{\addtocontents{toc}{\string\renewcommand{\string\cftchappresnum}{Appendix }}}
{}
\chapter{#1}
}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareRobustCommand{\thesismainmatter}{%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\oddsidemargin}{0.5in}
\setlength{\topmargin}{-0.25in}%{0.25in}
\setlength{\headheight}{18pt}
\setlength{\headsep}{1.25\baselineskip}%{1.8\baselineskip}
\setlength{\textwidth}{5.5in} %for double-sided thesis, both margins are 1.5in
\textheight=8.5in

\mainmatter
\pagestyle{empty}
\renewcommand{\@oddhead}{\mbox{}\hfill\arabic{page}}
\let\ps@plain = \ps@empty
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\vita}[1]{%
\begin{singlespace}
\thispagestyle{empty}
\begin{center}
    \textbf{{\large Vita} \\[0.1in] \mac@author}
\end{center}
\input{#1}
\end{singlespace}
}


%%
%% End of file `macthesis.cls'.

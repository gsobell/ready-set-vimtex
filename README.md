# ready-set-vimtex
bootstrap `vimtex` + `ultisnips`, with (mostly) sane defaults

## But First!
Read Elijan Mastnak's [series](https://ejmastnak.com/tutorials/vim-latex/intro/), and Gilles Castel’s [original article](https://castel.dev/post/lecture-notes-1/).

This is for those who want a starting point that "just works" (and also for those who look over my shoulder and ask "what's that!?")

## For the Impatient

First, make sure you have $ \text{LaTeX}$ properly installed:

For Arch Linux and its derivatives ( Arch $\frac{dy}{dx}$):

```
pacman -S texlive-basic texlive-bin texlive-fontsrecommended texlive-mathscience
```

Now, the `vim` plugins. Note that `vimtex` and `delimitmate` are in the `AUR`. You can alternatively use a vim plugin manager, but I don't bother.

```
yay -S vim-vimtex vim-ultisnips vim-delimitmate
```

Good job! All done! That was quick, right?


## Exciting Features!
Generate matrices with ease! `pmat3x3` with just a `tab` becomes:

```latex
\begin{pmatrix}
         &  &  \\
         &  &  \\
         &  &  \\
\end{pmatrix}
```
With tab stops (just like typing a matrix on Wolfram Alpha)! 

## Idiosyncrasies
Sometimes you just want to write the letters that trigger a snippet, and you end up fighting the auto complete.

## Table of Snippets:

Note that not all of these may render correctly, since the Github latex rendering doesn't include the `amsmath` package. 

Table generated with `parsnip.py`, for parsing snippets.

| Trigger | Name | Plaintext | LaTeX | Flags | Context | 
| --- | --- | --- | --- | --- | --- |
| beg | begin{} / end{} | \begin{$1}$2\end{$1}$0 | \begin{}\end{} | bA | None |
| \beg | begin{} / end{} | \begin{$1}$2\end{$1}$0 | \begin{}\end{} | bA | None |
| enum | enumerate | \begin{enumerate}\item $0\end{enumerate} | \begin{enumerate}\item \end{enumerate} | bA | None |
| item | itemize | \begin{itemize}\item $0\end{itemize} | \begin{itemize}\item \end{itemize} | bA | None |
| sec | section | \section{$0} | \section{} | bA | None |
| ssec | subsection | \subsection{$0} | \subsection{} | bA | None |
| sssec | subsubsection | \subsubsection{$0} | \subsubsection{} | bA | None |
| foot | footnote | \footnote{$0} | \footnote{} | "footnote" | None |
| theorem | theorem | \begin{theorem}$1\end{theorem}$0 | \begin{theorem}\end{theorem} | bA | None |
| def | definition | \begin{definition}$1\end{definition}$0 | \begin{definition}\end{definition} | bA | None |
| claim | claim | \begin{claim}$1\end{claim}$0 | \begin{claim}\end{claim} | bA | None |
| marg | margin note | \marginpar{$0} | \marginpar{} | note" | None |
| mm | Math | $${1}$`!pif t[2] and t[2][0] not in [',', '.', '?', '-', ' ']:snip.rv = ' 'else:snip.rv = ''`$2 | $${1}$`!pif t[2] and t[2][0] not in [',', '.', '?', '-', ' ']:snip.rv = ' 'else:snip.rv = ''` | wA | None |
| dm | Math | \[${1:${VISUAL}}\] $0 | \[${1:${VISUAL}}\]  | wA | None |
| ali | Align | \begin{align*}${1:${VISUAL}}\end{align*} | \begin{align*}${1:${VISUAL}}\end{align*} | bA | None |
| ff | fraction | \frac{$1}{$2}$0 | $$ \frac{}{} $$ | A | "math()" |
| ceil | ceil | \left\lceil $1 \right\rceil $0 | $$ \left\lceil  \right\rceil  $$ | iA | "math()" |
| floor | floor | \left\lfloor $1 \right\rfloor$0 | $$ \left\lfloor  \right\rfloor $$ | iA | "math()" |
| le | <= | \leqslant | $$ \leqslant $$ | A | "math()" |
| ge | >= | \geqslant | $$ \geqslant $$ | A | "math()" |
| ne | != | \neq | $$ \neq $$ | A | "math()" |
| ee | ∃ | \exists \; | $$ \exists \; $$ | iiA | "math()" |
| aa | ∀ | \forall \; | $$ \forall \; $$ | iA | "math()" |
| in | ∈ | \in | $$ \in $$ | A | "math()" |
| nin | !∈ | \notin | $$ \notin $$ | A | "math()" |
| xx | cross | \times | $$ \times $$ | A | "math()" |
| cd | cdot | \cdot | \cdot | A | None |
| qq | spaceing | \qquad | $$ \qquad $$ | A | "math()" |
| to | -> | \to | $$ \to $$ | A | "math()" |
| => | => | \implies | $$ \implies $$ | "=>" | "math()" |
| iff | iff | \iff | $$ \iff $$ | Ai | "math()" |
| f0 | f(x_0) | f(x_0) $0 | $$ f(x_0)  $$ | iA | "math()" |
| fx | f(x) | f(x) $0 | $$ f(x)  $$ | iA | "math()" |
| f'x | f(x) | f'(x)  $0 | $$ f'(x)   $$ | iA | "math()" |
| ab | (a,b) | a, b | $$ a, b $$ | iA | "math()" |
| ... | ... | \ldots | $$ \ldots $$ | A | "math()" |
| ooo | ∞ | \infty | $$ \infty $$ | Ai | "math()" |
| x0 | x_0 | x_{0} | $$ x_{0} $$ | Ai | "math()" |
| nn | ∩ | \cap | $$ \cap $$ | A | "math()" |
| uu | ∪ | \cup | $$ \cup $$ | A | "math()" |
| cc | ⊆ | \subseteq | $$ \subseteq $$ | A | "math()" |
| st | such that | \text{ such that } | $$ \text{ such that } $$ | A | "math()" |
| st | such that | such that | such that | that" | None |
| N | Naturals | \mathbb{N} | $$ \mathbb{N} $$ | A | "math()" |
| Z | Integers | \mathbb{Z} | $$ \mathbb{Z} $$ | A | "math()" |
| Q | Rationals | \mathbb{Q} | $$ \mathbb{Q} $$ | A | "math()" |
| R | Reals | \mathbb{R} | $$ \mathbb{R} $$ | A | "math()" |
| C | Complex | \mathbb{C} | $$ \mathbb{C} $$ | "Complex" | "math()" |
| F | Field | \mathbb{F} | $$ \mathbb{F} $$ | "Field" | "math()" |
| bb | blackboard bold | \mathbb{$0} | $$ \mathbb{} $$ | i | "math()" |
| bb | blackboard bold | $\mathbb{$0}$ | $\mathbb{}$ | i | None |
| tt | text, AMS | \text{$1} $0 | $$ \text{}  $$ | A | "math()" |
| lr( | left( right) | \left( ${1:${VISUAL}} \right) $0 | \left( ${1:${VISUAL}} \right)  | i | None |
| lr| | left| right| | \left| ${1:${VISUAL}} \right| $0 | \left| ${1:${VISUAL}} \right|  | i | None |
| lr{ | left\{ right\} | \left\\{ ${1:${VISUAL}} \right\\} $0 | \left\\{ ${1:${VISUAL}} \right\\}  | i | None |
| lr[ | left[ right] | \left[ ${1:${VISUAL}} \right] $0 | \left[ ${1:${VISUAL}} \right]  | i | None |
| ub | underbrace | \underbrace{$1}_{$2} | $$ \underbrace{}_{} $$ | A | "math()" |
| sum | sum | \sum_{k=${1:1}}^{${2:\infty}} ${3:a_k z^n} | $$ \sum_{k=${1:1}}^{${2:\infty}} ${3:a_k z^n} $$ | w | "math()" |
| \int | integral | \int_{${1:a}}^{${2:b}} ${3:f(x)}\, dx | $$ \int_{${1:a}}^{${2:b}} ${3:f(x)}\, dx $$ | wA | "math()" |
| taylor | taylor | \sum_{${1:k}=${2:0}}^{${3:\infty}} ${4:c_$1} (x-a)^$1 $0 | \sum_{${1:k}=${2:0}}^{${3:\infty}} ${4:c_} (x-a)^  | w | None |
| lim | limit | \lim_{${1:n} \to ${2:\infty}} | \lim_{${1:n} \to ${2:\infty}} | w | None |
| sr | ^2 | ^2 | $$ ^2 $$ | iA | "math()" |
| cb | ^3 | ^3 | $$ ^3 $$ | iA | "math()" |
| __ | subscript | _{$1}$0 | _{} | iA | None |
| ^^ | superscript | ^{$1}$0 | ^{} | iA | None |
| rt | n-root | \sqrt[${1:2}]{$2} | $$ \sqrt[${1:2}]{} $$ | iA | "math()" |
| log | log | \log | $$ \log $$ | A | "math()" |
| cos | cos | \cos | $$ \cos $$ | A | "math()" |
| sin | sin | \sin | $$ \sin $$ | A | "math()" |
| cvec | column vector | \begin{pmatrix} ${1:x}_${2:1}\\\\ \vdots\\\\ $1_${2:n} \end{pmatrix} | \begin{pmatrix} ${1:x}_${2:1}\\\\ \vdots\\\\ _${2:n} \end{pmatrix} | iA | None |
| "(small|[bBpvV])?mat(rix)?(\d+)x(\d+)" | (small|[bBpvV])?mat(rix)?(\d+)x(\d+) |  |  | br | None |
| plot | Plot | \begin{figure}[$1]\centering\begin{tikzpicture}\begin{axis}[xmin= ${2:-10}, xmax= ${3:10},ymin= ${4:-10}, ymax = ${5:10},axis lines = middle,]\addplot[domain=$2:$3, samples=${6:100}]{$7};\end{axis}\end{tikzpicture}\caption{$8}\label{${9:$8}}\end{figure} | \begin{figure}[]\centering\begin{tikzpicture}\begin{axis}[xmin= ${2:-10}, xmax= ${3:10},ymin= ${4:-10}, ymax = ${5:10},axis lines = middle,]\addplot[domain=:, samples=${6:100}]{};\end{axis}\end{tikzpicture}\caption{}\label{${9:}}\end{figure} | w | None |
| la | λ | \lambda | $$ \lambda $$ | i | "math()" |
| ep | ε | \varepsilon | $$ \varepsilon $$ | i | "math()" |
| de | δ | \delta | $$ \delta $$ | i | "math()" |
| om | ω | \omega | $$ \omega $$ | i | "math()" |
| pi | π | \pi | $$ \pi $$ | i | "math()" |
| al | α | \alpha | $$ \alpha $$ | i | "math()" |
# ready-set-vimtex
bootstrap `vimtex` + `ultisnips`, with (mostly) sane defaults

## But First!
Read Elijan Mastnak's [series](https://ejmastnak.com/tutorials/vim-latex/intro/), and Gilles Castel’s [original article](https://castel.dev/post/lecture-notes-1/).

This is for those who want a starting point that "just works" (and also for those who look over my shoulder and ask "what's that!?")

# For the Impatient

First, make sure you have $\LaTeX$ properly installed:

For Arch Linux and its derivatives ( Arch $\frac{dy}{dx}$):

```
pacman -S texlive-basic texlive-bin texlive-fontsrecommended texlive-mathscience --needed
```

Now, the `vim` plugins. Note that `vimtex` and `delimitmate` are in the `AUR`. You can alternatively use a vim plugin manager, but I don't bother.

```
yay -S vim-vimtex vim-ultisnips vim-delimitmate
```

Last, but not least, place the config files in `~/.vim`. Here's a handy script to expedite that, and backup your current `vimrc`:

```
sh <(curl -s https://raw.githubusercontent.com/gsobell/ready-set-vimtex/main/setup.sh)

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

# Table of Snippets

Note that not all of these may render correctly, since the Github latex rendering doesn't include the `amsmath` package. 


## LaTex Structure
| Trigger | Name | LaTeX | Flags | Context | 
| --- | --- | --- | --- | --- |
| beg | begin{} / end{} | `\begin{ } \end{ } ` | bA | None |
| \beg | begin{} / end{} | `\begin{ } \end{ } ` | bA | None |
| enum | enumerate | `\begin{enumerate}\item  \end{enumerate}` | bA | None |
| item | itemize | `\begin{itemize}\item  \end{itemize}` | bA | None |
| sec | section | \section{ } | bA | None |
| ssec | subsection | \subsection{ } | bA | None |
| sssec | subsubsection | \subsubsection{ } | bA | None |
| foot | footnote | \footnote{ } | None | None |
| theorem | theorem | `\begin{theorem} \end{theorem} ` | bA | None |
| def | definition | `\begin{definition} \end{definition} ` | bA | None |
| claim | claim | `\begin{claim} \end{claim} ` | bA | None |
| marg | margin note | \marginpar{ } | None | None |
| mm | Math | $${1}$`!pif t[2] and t[2][0] not in [',', '.', '?', '-', ' ']:snip.rv = ' 'else:snip.rv = ''`  | wA | None |
| dm | Math | \[${1:${VISUAL}}\]   | wA | None |
| ali | Align | `\begin{align*}${1:${VISUAL}}\end{align*}` | bA | None |
## Logic and Operators
| Trigger | Name | LaTeX | Flags | Context | 
| --- | --- | --- | --- | --- |
| ff | fraction |  $$\frac{ }{ } $$ | A | "math()" |
| ceil | ceil |  $$\left\lceil   \right\rceil  $$ | iA | "math()" |
| floor | floor |  $$\left\lfloor   \right\rfloor $$ | iA | "math()" |
| le | <= |  $$\leqslant$$ | A | "math()" |
| ge | >= |  $$\geqslant$$ | A | "math()" |
| ne | != |  $$\neq$$ | A | "math()" |
| ee | ∃ |  $$\exists \;$$ | iiA | "math()" |
| aa | ∀ |  $$\forall \;$$ | iA | "math()" |
| in | ∈ |  $$\in$$ | A | "math()" |
| nin | ∉ |  $$\notin$$ | A | "math()" |
| xx | cross |  $$\times$$ | A | "math()" |
| cd | cdot | \cdot | A | None |
| qq | spaceing |  $$\qquad$$ | A | "math()" |
| to | -> |  $$\to$$ | A | "math()" |
| => | => |  $$\implies$$ | None | "math()" |
| iff | iff |  $$\iff$$ | Ai | "math()" |
| f0 | f(x_0) |  $$f(x_0)  $$ | iA | "math()" |
| fx | f(x) |  $$f(x)  $$ | iA | "math()" |
| f'x | f(x) |  $$f'(x)   $$ | iA | "math()" |
| ab | (a,b) |  $$a, b$$ | iA | "math()" |
| ... | ... |  $$\ldots$$ | A | "math()" |
| ooo | ∞ |  $$\infty$$ | Ai | "math()" |
| x0 | x_0 |  $$x_{0}$$ | Ai | "math()" |
| nn | ∩ |  $$\cap$$ | A | "math()" |
| uu | ∪ |  $$\cup$$ | A | "math()" |
| cc | ⊆ |  $$\subseteq$$ | A | "math()" |
| st | such that |  $$\text{ such that }$$ | A | "math()" |
| st | such that | such that | None | None |
## Math Typesetting
| Trigger | Name | LaTeX | Flags | Context | 
| --- | --- | --- | --- | --- |
| N | Naturals |  $$\mathbb{N}$$ | A | "math()" |
| Z | Integers |  $$\mathbb{Z}$$ | A | "math()" |
| Q | Rationals |  $$\mathbb{Q}$$ | A | "math()" |
| R | Reals |  $$\mathbb{R}$$ | A | "math()" |
| C | Complex |  $$\mathbb{C}$$ | None | "math()" |
| F | Field |  $$\mathbb{F}$$ | None | "math()" |
| bb | blackboard bold |  $$\mathbb{ }$$ | i | "math()" |
| bb | blackboard bold | $\mathbb{ }$ | i | None |
| tt | text, AMS |  $$\text{ }  $$ | A | "math()" |
| lr( | left( right) | \left( ${1:${VISUAL}} \right)   | i | None |
| lr| | left| right| | \left| ${1:${VISUAL}} \right|   | i | None |
| lr{ | left\{ right\} | \left\\{ ${1:${VISUAL}} \right\\}   | i | None |
| lr[ | left[ right] | \left[ ${1:${VISUAL}} \right]   | i | None |
| ub | underbrace |  $$\underbrace{ }_{ }$$ | A | "math()" |
| sum | sum |  $$\sum_{k=${1:1}}^{${2:\infty}} ${3:a_k z^n}$$ | w | "math()" |
| \int | integral |  $$\int_{${1:a}}^{${2:b}} ${3:f(x)}\, dx$$ | wA | "math()" |
| taylor | taylor | \sum_{${1:k}=${2:0}}^{${3:\infty}} ${4:c_ } (x-a)^    | w | None |
| lim | limit | \lim_{${1:n} \to ${2:\infty}} | w | None |
| sr | ^2 |  $$^2$$ | iA | "math()" |
| cb | ^3 |  $$^3$$ | iA | "math()" |
| __ | subscript | _{ }  | iA | None |
| ^^ | superscript | ^{ }  | iA | None |
| rt | n-root |  $$\sqrt[${1:2}]{ }$$ | iA | "math()" |
| log | log |  $$\log$$ | A | "math()" |
| cos | cos |  $$\cos$$ | A | "math()" |
| sin | sin |  $$\sin$$ | A | "math()" |
| cvec | column vector | `\begin{pmatrix} ${1:x}_${2:1}\\\\ \vdots\\\\  _${2:n} \end{pmatrix}` | iA | None |
| "(small|[bBpvV])?mat(rix)?(\d+)x(\d+)" | (small|[bBpvV])?mat(rix)?(\d+)x(\d+) |  | br | None |
| plot | Plot | `\begin{figure}[ ]\centering\begin{tikzpicture}\begin{axis}[xmin= ${2:-10}, xmax= ${3:10},ymin= ${4:-10}, ymax = ${5:10},axis lines = middle,]\addplot[domain= : , samples=${6:100}]{ };\end{axis}\end{tikzpicture}\caption{ }\label{${9: }}\end{figure}` | w | None |
| '(?<!\\)(arcsin|arccos|arctan|arccot|arccsc|arcsec|)' | ln |  $$#\\`!p snip.rv = match.group(1)`$$ | rwA | "math()" |
| '(?<!\\)(sin|cos|tan|cot|csc|ln|log|exp)' | ln |  $$#\\`!p snip.rv = match.group(1)`$$ | rwA | "math()" |
## Greek
| Trigger | Name | LaTeX | Flags | Context | 
| --- | --- | --- | --- | --- |
| la | λ |  $$\lambda$$ | i | "math()" |
| ep | ε |  $$\varepsilon$$ | i | "math()" |
| de | δ |  $$\delta$$ | i | "math()" |
| om | ω |  $$\omega$$ | i | "math()" |
| pi | π |  $$\pi$$ | i | "math()" |
| al | α |  $$\alpha$$ | i | "math()" |
---
Cooked up with [`parsnip.py`](https://github.com/gsobell/ready-set-vimtex/blob/main/parsnip.py), a tool for parsing snippets into markdown tables.

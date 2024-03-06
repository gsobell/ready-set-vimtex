# ready-set-vimtex
bootstrap `vimtex` + `ultisnips`, with (mostly) sane defaults

## But First!
Read Elijan Mastnak's [series](https://ejmastnak.com/tutorials/vim-latex/intro/), and Gilles Castel’s [original article](https://castel.dev/post/lecture-notes-1/).

This is for those who want a starting point that "just works" (and also for those who look over my shoulder and ask "what's that!?")

## For the Impatient

First, make sure you have $\LaTeX$ properly installed:

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

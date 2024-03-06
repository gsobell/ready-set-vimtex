" Styled and colored underline support
let &t_AU = "\e[58:5:%dm"
let &t_8u = "\e[58:2:%lu:%lu:%lum"
let &t_Us = "\e[4:2m"
let &t_Cs = "\e[4:3m"
let &t_ds = "\e[4:4m"
let &t_Ds = "\e[4:5m"
let &t_Ce = "\e[4:0m"
" Strikethrough
let &t_Ts = "\e[9m"
let &t_Te = "\e[29m"
" Truecolor support
let &t_8f = "\e[38:2:%lu:%lu:%lum"
let &t_8b = "\e[48:2:%lu:%lu:%lum"
let &t_RF = "\e]10;?\e\\"
let &t_RB = "\e]11;?\e\\"
" Bracketed paste
let &t_BE = "\e[?2004h"
let &t_BD = "\e[?2004l"
let &t_PS = "\e[200~"
let &t_PE = "\e[201~"
" Cursor control
let &t_RC = "\e[?12$p"
let &t_SH = "\e[%d q"
let &t_RS = "\eP$q q\e\\"
let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"
let &t_VS = "\e[?12l"
" Focus tracking
let &t_fe = "\e[?1004h"
let &t_fd = "\e[?1004l"
execute "set <FocusGained>=\<Esc>[I"
execute "set <FocusLost>=\<Esc>[O"
" Window title
let &t_ST = "\e[22;2t"
let &t_RT = "\e[23;2t"

" vim hardcodes background color erase even if the terminfo file does
" not contain bce. This causes incorrect background rendering when
" using a color theme with a background color in terminals such as
" kitty that do not support background color erase.
let &t_ut=''

colorscheme nord
syntax enable
filetype on
filetype plugin on
filetype plugin on

"VimTex
let g:vimtex_view_method = 'zathura'
if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif
"nmap <localleader>vv <plug>(vimtex-view)
set omnifunc=syntaxcomplete#Complete
" aux file clean on close
augroup vimtex_config
  autocmd!
  autocmd Filetype tex autocmd BufUnload <buffer> VimtexClean
augroup END

let g:clipbrdDefaultReg = '+'
set autoindent
set backup
set backupdir=$XDG_CACHE_HOME/vim,~/,/tmp
set belloff=all
set directory=$XDG_CACHE_HOME/vim,~/,/tmp
set expandtab
set foldmethod=marker
set hlsearch
set ignorecase
set incsearch
set mouse=a
set noerrorbells
set number relativenumber
set showcmd
set showmatch
set showmatch
set smartcase
set smartindent
set smarttab
set term=kitty
set undofile
set viminfo+=n$XDG_CACHE_HOME/vim/viminfo
set wildmenu
set wildmode=list:longest,full
set wrap linebreak
source $VIMRUNTIME/vimrc_example.vim
"set undodir=~/.vim/undodir
"set directory=~/.vim/tmp
"set backupdir=~/.vim/backup
"inoremap { {}<ESC>ha
"inoremap \" \""<ESC>ha
"inoremap { {}<ESC>ha
"inoremap ] ]<ESC>ha
"inoremap ) )<ESC>ha

:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a

" portable bracket handling
" inoremap " ""<left>
" inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O


"autocmd FileType tex,markdown setlocal spell spelllang=en_us
autocmd FileType markdown setlocal spell spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" ctrl-click forward search to zathura
" nnoremap <C-LeftMouse> <plug>(vimtex-view)

set clipboard=unnamedplus

autocmd BufNewFile,BufReadPre,BufRead *.md setfiletype markdown
autocmd Filetype markdown setlocal com=s1:/*,mb:*,ex:*/,://,b:%,:XCOMM,n:>,b:- | set formatoptions=tcroqln
autocmd FileType markdown inoremap $ $$<ESC>ha

"UltiSnips
let g:UltiSnipsExpandTrigger       = '<Tab>'    " use Tab to expand snippets
let g:UltiSnipsJumpForwardTrigger  = '<Tab>'    " use Tab to move forward through tabstops
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'  " use Shift-Tab to move backward through tabstops
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']         

"reload snippets in vim
nnoremap <leader>u :call UltiSnips#RefreshSnippets()<CR>:echom "UltiSnips: Snippets refreshed."<CR>

"reload vimrc
nnoremap <leader>v :source $MYVIMRC<CR>:echom "Vim configuration reloaded"<CR>

" Toggle comment at the beginning of the line with Ctrl+D for various file types
autocmd FileType tex,python,vim,bash,haskell,markdown nnoremap <silent> <C-d> :call ToggleComment()<CR>

function! ToggleComment()
    let s:line_num = line('.')
    let s:line = getline(s:line_num)

    " Check the file type and set the comment character accordingly
    let s:comment_char = 
        \ (&ft == 'tex' ? '%' :
        \ &ft == 'python' ? '#' :
        \ &ft == 'vim' ? '"' :
        \ &ft == 'bash' ? '#' :
        \ &ft == 'haskell' ? '--' :
        \ &ft == 'markdown' ? '<!--' : '')

    " Check if the line starts with the comment character
    if s:line =~ '^\s*' . s:comment_char
        " Remove the comment character at the beginning of the line
        execute 's/^\s*' . s:comment_char . '//'
    else
        " Add the comment character at the beginning of the line
        execute 's/^\(\s*\)/\1' . s:comment_char . '/'
    endif
endfunction

"spelling dropdown
nnoremap <Leader>s ea<C-X><C-S>
inoremap <expr> <CR> pumvisible() ? "\<C-y><Esc>" : "\<CR>"

" Toggle format in LaTex files
function! ToggleFormatting(format)
  let word = expand('<cword>')
  let line = getline('.')
  let cursor_col = col('.')
  let start_col = searchpos('\%'.cursor_col.'c' . word, 'n', line('.'))[1]

  if line =~ '\v\\' . a:format . '\{' . word . '\}'
    " Word is already in the specified format, remove formatting
    execute 'silent s/\\' . a:format . '{' . word . '}/' . word . '/ge'
  else
    " Word is not in the specified format, add formatting
    execute 'silent s/' . word . '/\\' . a:format . '{' . word . '}/ge'
  endif
endfunction

"normal:
nnoremap <silent> <C-b> :call ToggleFormatting('textbf')<CR>
nnoremap <silent> <C-e> :call ToggleFormatting('emph')<CR>
"insert:
inoremap <silent> <C-b> <C-o>:call ToggleFormatting('textbf')<CR>
inoremap <silent> <C-e> <C-o>:call ToggleFormatting('emph')<CR>


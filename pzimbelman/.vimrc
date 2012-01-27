"Suppress persistent highlighting of searched terms"
set nohlsearch

set nocompatible
set backspace=indent,eol,start
set ruler

set notitle

let mapleader = ","

set tabstop=2 shiftwidth=2 expandtab

set autowriteall

"F6 to user awsfind on the word under the cursor
nnoremap <silent> <F6> :!awsfind <cword><CR>

"incrementally search file"
set incsearch

"put filename in title bar"
set title

"allow backspacing over everything in INSERT mode
set bs=2

"search for files like bash"
set wildmode=list:longest

" autosave if I switch to another buffer
set autowriteall

"move swp files into .vim-tmp/"
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" edit and update vimrc from ANYWHERE
map <leader>rc :e ~/.vim/.vimrc<CR><C-W>
map <leader>rs :so %

" take me to the command line.
map <leader>c :!<CR>

" grep recursively, ignoring case
map <leader>g :! grep -ir 

"svn commands
map <leader>up :! svn up<CR>
map <leader>ci :! export VISUAL=vi && svn ci<CR>
map <leader>st :! svn st<CR>

" FuzzyFinder and switchback commands
map <leader>e :e#<CR>

map <leader>s :%s/

" Split screen vertically and move between screens.
map <leader>v :vsp<CR> 

" set question mark to be part of a VIM word. in Ruby it is!
set isk=@,48-57,_,?,!,192-255
map <leader>n :tnext


" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
endif

if &term=="xterm"
     set t_Co=8
     set t_Sb=^[[4%dm
     set t_Sf=^[[3%dm
endif

" Run Ruby unit tests with gT (for all) or gt (only test under
" cursor) in command mode
augroup RubyTests
  au!
  autocmd BufRead,BufNewFile *_test.rb,test_*.rb
    \ :nmap gt V:<C-U>!$HOME/.vim/bin/ruby-run-focused-unit-test 
    \ % <C-R>=line("'<")<CR>p <CR>|
    \ :nmap gT :<C-U>!ruby %<CR>
augroup END

let Tlist_Ctags_Cmd='/usr/bin/ctags'

noremap <buffer> tp ?^sub.*:.*Test<cr>w"zye:!TEST_METHOD='<c-r>z' prove -v %<cr>

autocmd FileType make setlocal noexpandtab
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType c setlocal shiftwidth=8 tabstop=8 noexpandtab cindent


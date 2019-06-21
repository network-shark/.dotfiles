set nocompatible

" Initialize Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Enable syntax highlighting
syntax on

filetype plugin indent on


" settings needed for solarized colorscheme
syntax enable
set background=dark
color solarized


"more characters will be sent to the screen for redrawing
set ttyfast

" proper undo with hitory "
set undodir=~/.vim/undo
set undofile " Maintain undo history between sessions"

"time waited for key press(es) to complete. It makes for a faster key
"response
set ttimeout
set ttimeoutlen=50
" alwasy display status line
set laststatus=2
"modifiedflag, charcount, filepercent, filepath
set statusline=%=%m\ %c\ %P\ %f

" Add line numbers
set number
set ruler
set cursorline

" Disable Backup and Swap files
set noswapfile
set nobackup
set nowritebackup

" Set encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
"set tabstop=2
"set shiftwidth=2
"set softtabstop=2
"set expandtab

" Show trailing spaces and highlight hard tabs
set list listchars=tab:»·,trail:·

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Strip trailing whitespaces on each save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Close window if last remaining window is NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

au FileType nerdtree setl cole=3 cocu+=n


" Search related settings
set incsearch
set hlsearch

" Map Ctrl+l to clear highlighted searches
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Highlight characters behind the 80 chars margin
:au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)


" Disable code folding
set nofoldenable

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
"#let NERDTreeDirArrows = 1
"§#let NERDTreeNodeDelimiter = "+"
let NERDTreeNodeDelimiter = "\u00a0"

" Enable Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_python_checkers = ['pylint']

" Use dedicated syntax checkers for these languages
"let g:syntastic_mode_map = {
"    \ "mode": "active",
"    \ "passive_filetypes": ["erlang"] }

" Ignorde JS files on CTAGS generation
let g:vim_tags_ignore_files = ['.gitignore', '.svnignore', '.cvsignore', '*.js', '*.json', '*.css']

" make uses real tabs
au FileType make set noexpandtab

" Erlang uses 4 spaces
au FileType erlang set softtabstop=4 tabstop=4 shiftwidth=4

" Go uses tabs
au FileType go set noexpandtab tabstop=4 shiftwidth=4

" Go Foo
let g:go_fmt_command = "goimports"

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" ctrp custom ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.eunit$',
  \ 'file': '\.exe$\|\.so$\|\.dll\|\.beam$\|\.DS_Store$'
  \ }

let g:erlangCheckFile = "~/.vim/bundle/vimerl/compiler/erlang_check_file.erl"
let g:erlangHighlightErrors = 1


" Use Ag instead of Ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" Gitgutter
let g:gitgutter_sign_column_always = 1
set updatetime=250

" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab
"
" Ansible Stuff
"au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible

" FZF Runtimepath "
set rtp+=~/.fzf

set runtimepath^=~/.vim/bundle/ag
"Show hidden files Nerdtree
"let NERDTreeShowHidden=1


"The Leader
let mapleader="\<Space>"
"save current buffer
nnoremap <leader>w :w<cr>


"autoclose tags
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap " ""<Left>

"move lines around
nnoremap <leader>k :m-2<cr>==
nnoremap <leader>j :m+<cr>==
xnoremap <leader>k :m-2<cr>gv=gv
xnoremap <leader>j :m'>+<cr>gv=gv


inoremap jk <esc>

"Vim Airline
let g:airline_powerline_fonts = 1
""let g:tmuxline_preset = 'nightly_fox'
" or
let g:tmuxline_preset = 'full'
" or
""let g:tmuxline_preset = 'tmux'
""let g:tmuxline_preset = 'tmux'
""let g:tmuxline_preset = {
""      \'a'    : '#S',
""      \'b'    : '#W',
""      \'c'    : '#H',
""      \'win'  : '#I #W',
""      \'cwin' : '#I #W',
""      \'x'    : '%a',
""      \'y'    : '#W %R',
""      \'z'    : '#H'}
"only needed if you would create a new tmux bar config"
""let g:tmuxline_preset = {
""      \'a'    : '#S',
""      \'c'    : ['#(whoami)', '#(uptime | cut -d " " -f 1,2,3)'],
""      \'win'  : ['#I', '#W'],
""      \'cwin' : ['#I', '#W', '#F'],
""      \'x'    : '#(date)',
""      \'y'    : ['%R', '%a', '%Y'],
""      \'z'    : '#H'}





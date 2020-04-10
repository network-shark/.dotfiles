set nocompatible

" Initialize Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Enable syntax highlighting
syntax on

filetype plugin indent on

""""
" settings needed for solarized colorscheme
syntax enable
set background=dark
color solarized

" " really, just don't
nnoremap <Up>    <NOP>
nnoremap <Down>  <NOP>
nnoremap <Left>  <NOP>
nnoremap <Right> <NOP>

"" disable beep
set visualbell
"" disable beep
set noerrorbells

"" enables to search files in subdirectories
set path+=**
"" tabcompletion inside vim commandline
set wildmenu
"" E37: No write since last change (add ! to override)
set hidden
" set show matching parenthesis
set showmatch

"more characters will be sent to the screen for redrawing
set ttyfast

" TODO
" capslock to escape not working
"au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
"au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'


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
"set number
set ruler
" vertical line
"set cursorcolumn
" highlights present line
set cursorline
" turn hybrid line numbers on
:set number relativenumber

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
" show search matches as you type
set incsearch
" highlight search terms
set hlsearch

" Make double-<Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

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
"let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_checkers = ['mccabe,pep8,pyflakes']

" Use dedicated syntax checkers for these languages
"let g:syntastic_mode_map = {
"    \ "mode": "active",
"    \ "passive_filetypes": ["erlang"] }

" Ignorde JS files on CTAGS generation
let g:vim_tags_ignore_files = ['.gitignore', '.svnignore', '.cvsignore', '*.js', '*.json', '*.css']

" make uses real tabs
au FileType make set noexpandtab


" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" ctrp custom ignores
"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.eunit$',
"  \ 'file': '\.exe$\|\.so$\|\.dll\|\.beam$\|\.DS_Store$'
"  \ }



" Use Ag instead of Ack
"
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  let g:grepprg= 'ag --nogroup --nocolor'
endif

" Gitgutter
let g:gitgutter_sign_column_always = 1
set updatetime=250
" sls files
let g:sls_use_jinja_syntax = 1

" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 et si ai
autocmd FileType yml setlocal ts=2 sts=2 sw=2 et si ai

" Ansible Stuff
"au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible

" FZF Runtimepath "
set rtp+=~/.fzf
let g:fzf_layout = { 'down': '~40%' }



"set runtimepath^=~/.vim/bundle/ag
"Show hidden files Nerdtree
"let NERDTreeShowHidden=1


"The Leader
let mapleader="\<Space>"
"save current buffer
nnoremap <leader>w :w<cr>

"disbale ctrl + w
map <C-w> <Nop>
"
nnoremap <C-g> :Ag<Cr>
nnoremap <leader>g :GFiles<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>h :History<cr>

"
nnoremap <C-p> :Files<Cr>

" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], [preview window], [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Bat: https://github.com/sharkdp/bat
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

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



" COC Settings IDE Settings
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

"Use <Tab> and <S-Tab> to navigate the completion lis
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" TODO I don't thin shift tab works
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" or
"
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



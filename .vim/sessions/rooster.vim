let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <Plug>(fzf-maps-i) :call fzf#vim#maps('i', 0)
inoremap <expr> <Plug>(fzf-complete-buffer-line) fzf#vim#complete#buffer_line()
inoremap <expr> <Plug>(fzf-complete-line) fzf#vim#complete#line()
inoremap <expr> <Plug>(fzf-complete-file-ag) fzf#vim#complete#path('ag -l -g ""')
inoremap <expr> <Plug>(fzf-complete-file) fzf#vim#complete#path("find . -path '*/\.*' -prune -o -type f -print -o -type l -print | sed 's:^..::'")
inoremap <expr> <Plug>(fzf-complete-path) fzf#vim#complete#path("find . -path '*/\.*' -prune -o -print | sed '1d;s:^..::'")
inoremap <expr> <Plug>(fzf-complete-word) fzf#vim#complete#word()
nnoremap <silent>  :nohlsearch
xnoremap  j :m'>+gv=gv
xnoremap  k :m-2gv=gv
nnoremap  j :m+==
nnoremap  k :m-2==
nnoremap  w :w
map \n :NERDTreeToggle
vmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
vnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(netrw#GX(),netrw#CheckIfRemote(netrw#GX()))
onoremap <silent> <Plug>(fzf-maps-o) :call fzf#vim#maps('o', 0)
xnoremap <silent> <Plug>(fzf-maps-x) :call fzf#vim#maps('x', 0)
nnoremap <silent> <Plug>(fzf-maps-n) :call fzf#vim#maps('n', 0)
inoremap jk 
let &cpo=s:cpo_save
unlet s:cpo_save
set background=dark
set backspace=indent,eol,start
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=en
set hlsearch
set incsearch
set laststatus=2
set listchars=tab:»·,trail:·
set modelines=0
set ruler
set runtimepath=~/.vim/bundle/ag,~/.vim,~/.vim/bundle/Vim-Jinja2-Syntax,~/.vim/bundle/ack.vim,~/.vim/bundle/fzf.vim,~/.vim/bundle/nerdtree,~/.vim/bundle/salt-vim,~/.vim/bundle/syntastic,~/.vim/bundle/tmuxline.vim,~/.vim/bundle/vim-airline,~/.vim/bundle/vim-airline-themes,~/.vim/bundle/vim-pathogen,/usr/share/vim/vimfiles,/usr/share/vim/vim80,/usr/share/vim/vimfiles/after,~/.vim/after,~/.fzf
set statusline=%=%m\ %c\ %P\ %f
set noswapfile
set ttimeout
set ttimeoutlen=50
set undodir=~/.vim/undo
set undofile
set updatetime=250
set window=0
set nowritebackup
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/tmux-layouts
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +0 8pane
badd +0 tmux_dev_salt.sh
argglobal
silent! argdel *
edit 8pane
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
3wincmd h
wincmd w
wincmd w
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=1 winheight=1 winminwidth=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 31 + 133) / 267)
exe 'vert 2resize ' . ((&columns * 78 + 133) / 267)
exe 'vert 3resize ' . ((&columns * 78 + 133) / 267)
exe 'vert 4resize ' . ((&columns * 77 + 133) / 267)
argglobal
enew
file NERD_tree_1
let s:cpo_save=&cpo
set cpo&vim
nnoremap <buffer> <silent> <NL> :call nerdtree#ui_glue#invokeKeyMap("<C-j>")
nnoremap <buffer> <silent>  :call nerdtree#ui_glue#invokeKeyMap("<C-k>")
nnoremap <buffer> <silent>  :call nerdtree#ui_glue#invokeKeyMap(g:NERDTreeMapActivateNode)
nnoremap <buffer> <silent> ? :call nerdtree#ui_glue#invokeKeyMap("?")
nnoremap <buffer> <silent> A :call nerdtree#ui_glue#invokeKeyMap("A")
nnoremap <buffer> <silent> B :call nerdtree#ui_glue#invokeKeyMap("B")
nnoremap <buffer> <silent> C :call nerdtree#ui_glue#invokeKeyMap("C")
nnoremap <buffer> <silent> CD :call nerdtree#ui_glue#invokeKeyMap("CD")
nnoremap <buffer> <silent> D :call nerdtree#ui_glue#invokeKeyMap("D")
nnoremap <buffer> <silent> F :call nerdtree#ui_glue#invokeKeyMap("F")
nnoremap <buffer> <silent> I :call nerdtree#ui_glue#invokeKeyMap("I")
nnoremap <buffer> <silent> J :call nerdtree#ui_glue#invokeKeyMap("J")
nnoremap <buffer> <silent> K :call nerdtree#ui_glue#invokeKeyMap("K")
nnoremap <buffer> <silent> O :call nerdtree#ui_glue#invokeKeyMap("O")
nnoremap <buffer> <silent> P :call nerdtree#ui_glue#invokeKeyMap("P")
nnoremap <buffer> <silent> R :call nerdtree#ui_glue#invokeKeyMap("R")
nnoremap <buffer> <silent> T :call nerdtree#ui_glue#invokeKeyMap("T")
nnoremap <buffer> <silent> U :call nerdtree#ui_glue#invokeKeyMap("U")
nnoremap <buffer> <silent> X :call nerdtree#ui_glue#invokeKeyMap("X")
nnoremap <buffer> <silent> cd :call nerdtree#ui_glue#invokeKeyMap("cd")
nnoremap <buffer> <silent> e :call nerdtree#ui_glue#invokeKeyMap("e")
nnoremap <buffer> <silent> f :call nerdtree#ui_glue#invokeKeyMap("f")
nnoremap <buffer> <silent> go :call nerdtree#ui_glue#invokeKeyMap("go")
nnoremap <buffer> <silent> gs :call nerdtree#ui_glue#invokeKeyMap("gs")
nnoremap <buffer> <silent> gi :call nerdtree#ui_glue#invokeKeyMap("gi")
nnoremap <buffer> <silent> i :call nerdtree#ui_glue#invokeKeyMap("i")
nnoremap <buffer> <silent> m :call nerdtree#ui_glue#invokeKeyMap("m")
nnoremap <buffer> <silent> o :call nerdtree#ui_glue#invokeKeyMap("o")
nnoremap <buffer> <silent> p :call nerdtree#ui_glue#invokeKeyMap("p")
nnoremap <buffer> <silent> q :call nerdtree#ui_glue#invokeKeyMap("q")
nnoremap <buffer> <silent> r :call nerdtree#ui_glue#invokeKeyMap("r")
nnoremap <buffer> <silent> s :call nerdtree#ui_glue#invokeKeyMap("s")
nnoremap <buffer> <silent> t :call nerdtree#ui_glue#invokeKeyMap("t")
nnoremap <buffer> <silent> u :call nerdtree#ui_glue#invokeKeyMap("u")
nnoremap <buffer> <silent> x :call nerdtree#ui_glue#invokeKeyMap("x")
nnoremap <buffer> <silent> <MiddleMouse> :call nerdtree#ui_glue#invokeKeyMap("<MiddleMouse>")
nnoremap <buffer> <silent> <2-LeftMouse> :call nerdtree#ui_glue#invokeKeyMap("<2-LeftMouse>")
nnoremap <buffer> <silent> <LeftRelease> <LeftRelease>:call nerdtree#ui_glue#invokeKeyMap("<LeftRelease>")
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal noautoindent
setlocal backupcopy=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=hide
setlocal nobuflisted
setlocal buftype=nofile
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
set cursorline
setlocal cursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'nerdtree'
setlocal filetype=nerdtree
endif
setlocal fixendofline
setlocal foldcolumn=0
set nofoldenable
setlocal nofoldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
set list
setlocal nolist
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal nomodifiable
setlocal nrformats=bin,octal,hex
set number
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal readonly
setlocal norelativenumber
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%!airline#statusline(1)
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'nerdtree'
setlocal syntax=nerdtree
endif
setlocal tabstop=8
setlocal tagcase=
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal winfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
wincmd w
argglobal
setlocal noautoindent
setlocal backupcopy=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
set cursorline
setlocal cursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != ''
setlocal filetype=
endif
setlocal fixendofline
setlocal foldcolumn=0
set nofoldenable
setlocal nofoldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
set list
setlocal list
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%!airline#statusline(2)
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != ''
setlocal syntax=
endif
setlocal tabstop=8
setlocal tagcase=
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 3 - ((2 * winheight(0) + 25) / 50)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
3
normal! 0
wincmd w
argglobal
if bufexists('tmux_dev_salt.sh') | buffer tmux_dev_salt.sh | else | edit tmux_dev_salt.sh | endif
setlocal noautoindent
setlocal backupcopy=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=#%s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
set cursorline
setlocal cursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'sh'
setlocal filetype=sh
endif
setlocal fixendofline
setlocal foldcolumn=0
set nofoldenable
setlocal nofoldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetShIndent()
setlocal indentkeys=0{,0},!^F,o,O,e,0=then,0=do,0=else,0=elif,0=fi,0=esac,0=done,0=end,),0=;;,0=;&,0=fin,0=fil,0=fip,0=fir,0=fix
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
set list
setlocal list
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%!airline#statusline(3)
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'sh'
setlocal syntax=sh
endif
setlocal tabstop=8
setlocal tagcase=
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 3 - ((2 * winheight(0) + 25) / 50)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
3
normal! 0
wincmd w
argglobal
enew
setlocal noautoindent
setlocal backupcopy=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
set cursorline
setlocal cursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != ''
setlocal filetype=
endif
setlocal fixendofline
setlocal foldcolumn=0
set nofoldenable
setlocal nofoldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
set list
setlocal list
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%!airline#statusline(4)
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != ''
setlocal syntax=
endif
setlocal tabstop=8
setlocal tagcase=
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
wincmd w
3wincmd w
exe 'vert 1resize ' . ((&columns * 31 + 133) / 267)
exe 'vert 2resize ' . ((&columns * 78 + 133) / 267)
exe 'vert 3resize ' . ((&columns * 78 + 133) / 267)
exe 'vert 4resize ' . ((&columns * 77 + 133) / 267)
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
set winminheight=1 winminwidth=1
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :

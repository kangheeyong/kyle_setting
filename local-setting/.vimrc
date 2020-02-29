runtime vimrc_example.vim
let &runtimepath.=',/root/.vim/'
set rtp+=~/.fzf
set encoding=utf-8
export TERM="screen-256color"
"
filetype plugin on
"
"===============================================================================
"==========  CUSTOMIZATION (vimrc)  ============================================
"===============================================================================
"

"-------------------------------------------------------------------------------
" Use of dictionaries
"-------------------------------------------------------------------------------
"
set complete+=k           " scan the files given with the 'dictionary' option
"
"-------------------------------------------------------------------------------
" Various settings
"-------------------------------------------------------------------------------
"
set autoread              " read open files again when changed outside Vim
set autowrite             " write a modified buffer on each :next , ...
set browsedir  =current   " which directory to use for the file browser
set incsearch             " use incremental search
set shiftwidth =4         " number of spaces to use for each step of indent
set tabstop    =4         " number of spaces that a <Tab> in the file counts for
set visualbell            " visual bell instead of beeping
set number                                " line number, add ummae
set title                                    " add ummae
set ts=4
set expandtab
set autoindent
set cindent
set wrap
set smarttab
set ignorecase
set smartcase
set history=500
set belloff=all
syntax on


"-------------------------------------------------------------------------------
" Change the working directory to the directory containing the current file
"-------------------------------------------------------------------------------
if has("autocmd")
  autocmd BufEnter * :lchdir %:p:h
endif " has("autocmd")
"
"-------------------------------------------------------------------------------
" Filename completion
"
"   wildmenu : command-line completion operates in an enhanced mode
" wildignore : A file that matches with one of these
"              patterns is ignored when completing file or directory names.
"-------------------------------------------------------------------------------
"
set wildmenu
set wildignore=*.bak,*.o,*.e,*~
"
"-------------------------------------------------------------------------------
" print options  (pc = percentage of the media size)
"-------------------------------------------------------------------------------
set printoptions=left:8pc,right:3pc
"
"-------------------------------------------------------------------------------
" taglist.vim : toggle the taglist window
" taglist.vim : define the title texts for make
" taglist.vim : define the title texts for qmake
"-------------------------------------------------------------------------------
" noremap <silent> <F7> :TlistUpdate<CR>
 noremap <silent> <F8> :Tlist<CR>
 noremap <silent> <F9> :TlistSync<CR>
 noremap <silent> <F11>  <Esc><Esc>:Tlist<CR>
inoremap <silent> <F11>  <Esc><Esc>:Tlist<CR>

let Tlist_Use_Right_Window = 1

let tlist_make_settings  = 'make;m:makros;t:targets'
let tlist_qmake_settings = 'qmake;t:SystemVariables'

if has("autocmd")
  " ----------  qmake : set filetype for *.pro  ----------
  autocmd BufNewFile,BufRead *.pro  set filetype=qmake
endif " has("autocmd")

set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized
"colorscheme asmanian2

set backupdir=/root/tmp

" ----c---- "
" use NUL instead /dev/null in Windows
autocmd FileType c setlocal formatprg=indent\ -kr\ --no-tabs\ 2>\ /dev/null
autocmd FileType cpp setlocal formatprg=indent\ -kr\ --no-tabs\ 2>\ /dev/null
"set cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1
if has("autocmd")
    autocmd FileType c map <buffer> <F7> gggqG
    autocmd FileType cpp map <buffer> <F7> gggqG
endif

" -----python-mode----- "
set foldlevel=99
let g:pymode_options_colorcolumn = 0
let g:pymode_lint_ignore = "E501,E402"

" -----rope----- "
let g:pymode_rope = 0

" -----python-jedi----- "
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
"autocmd FileType python setlocal completeopt-=preview

" ------nerd----- "
map <C-n> :NERDTreeToggle<CR>

syntax on
syntax enable

" -----pathogen----- "
call pathogen#infect('/root/.vim/bundle/{}')
call pathogen#helptags()

" -----plug----- "
call plug#begin('~/.vim/plugged')
Plug 'Konfekt/FastFold',                { 'tag': '5.0' }
Plug 'davidhalter/jedi-vim',            { 'commit': '914754a04e0ea0882b3172230199fd771b02dc95' }
Plug 'fs111/pydoc.vim',                 { 'commit': '092a195220ff5bb9216ca5c9430256a4448ba708' }
Plug 'heavenshell/vim-pydocstring',     { 'tag': '0.6.0' }
Plug 'nvie/vim-flake8',                 { 'tag': '1.6' }
Plug 'python-mode/python-mode',         { 'tag': '0.9.0' }
Plug 'scrooloose/nerdtree',             { 'tag': '5.0.0' }
Plug 'vim-scripts/taglist.vim',         { 'tag': '4.5' }
Plug 'SirVer/ultisnips',                { 'tag': '3.1' }
Plug 'honza/vim-snippets',              { 'commit': '1ba4a66c11d8fd4309656bc2994d683580d54de3' }
Plug 'vim-airline/vim-airline',         { 'tag': 'v0.10' }
Plug 'junegunn/fzf',                    { 'tag': '0.18.0', 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim',                { 'commit': 'b31512e2a2d062ee4b6eb38864594c83f1ad2c2f' }
Plug 'tpope/vim-surround',              { 'tag': 'v2.1' }
Plug 'aldantas/vim-custom-surround',    { 'tag': '1.1' }
Plug 'airblade/vim-gitgutter',          { 'commit': '7eeea63e62b1cc088a75c7a7c244fc774d82e5bb' }

Plug '/root/.vim/plug_manually_installed/gtags'
call plug#end()

" -----pydocstring----- "
autocmd FileType python setlocal softtabstop=4

" -----cscope-gtags----- "
if has("cscope")
    set csprg=gtags-cscope
    function! LoadGtagsCscope()
        let db = findfile("GTAGS", ".;")
        if (!empty(db))
            try
                if db == "/GTAGS"
                    let path = "/"
                elseif db == "GTAGS"
                    let path = getcwd()
                else
                    let path = strpart(db, 0, match(db, "/GTAGS$"))
                endif
                set nocscopeverbose
                exe "cs add " . db . " " . path . " -a"
                set cscopeverbose
            catch
            endtry
        elseif $CSCOPE_DB != ""
            cs add $CSCOPE_DB
        endif
    endfunction
    au BufEnter * call LoadGtagsCscope()
    set cscopetag

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif


" -----load user vim configs----- "
try
    source ~/.users/$USER_NAME/vim_configs.vim
catch
endtry


" reference : https://github.com/theasta/dotfiles

" Environment {
    " Basics {
"    set nocompatible        " Must be first line
    " }

    " Setup Bundle Support {
        " The next three lines ensure that the ~/.vim/bundle/ system works
"        filetype on
"        filetype off
"        if has('vim_starting')
"        set runtimepath+=~/.vim/bundle/neobundle.vim/
"        endif
"        call neobundle#begin(expand('~/.vim/bundle/'))
"        call neobundle#end()
    " }
" }

" Bundles {
    " Use bundles config {
"        if filereadable(expand("~/.vimrc.bundles"))
"            source ~/.vimrc.bundles
"        endif
    " }

"    filetype plugin indent on     " Required!
"    NeoBundleCheck
" }

filetype plugin indent on   " Automatically detect file types.
syntax on                   " Syntax highlighting
scriptencoding utf-8        " Character encoding used in this file

set encoding=utf8           " character encoding used inside Vim
set fileencodings=utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1
set tenc=utf-8

set autoread                        " Set to auto read when a file is changed from the outside
set history=1000                    " Store a ton of history (default is 20)
set nospell                         " Spell checking off
set hidden                          " Allow buffer switching without saving
set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set noswapfile                    " Use an SCM instead of swap files
set number
set relativenumber
set showmode                    " Display the current mode (legochen)
highlight clear SignColumn      " SignColumn should match background for
                                " things like vim-gitgutter
set laststatus=2
set backspace=indent,eol,start  " Backspace for dummies
set linespace=1                 " No extra spaces between rows
set showmatch                   " Show matching brackets/parenthesis
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set nofoldenable                " Auto fold code
set visualbell
set title
set splitbelow
set cursorline
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set magic                       "Set magic on, for regular expressions
set mat=2                       "How many tenths of a second to blink
set list

set autoindent                  " Indent at the same level of the previous line
set smartindent
set tabstop=4                   " An indentation every four columns
set shiftwidth=4                " Use indents of 4 spaces
set softtabstop=4               " Let backspace delete indent
set expandtab                   " Use spaces instead of tabs
set shiftround                  " Round indent to multiple of shiftwidth
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

" Remove trailing whitespaces and ^M chars
set smarttab                     "Uses shiftwidth instead of tabstop at the start of lines
"set mouse=a                 " Automatically enable mouse usage
"set mousehide               " Hide the mouse cursor while typing

" Plugins {
    " OmniComplete {
        if has("autocmd") && exists("+omnifunc")
            autocmd Filetype *
                \if &omnifunc == "" |
                \setlocal omnifunc=syntaxcomplete#Complete |
                \endif
        endif

        hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
        hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
        hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE
    " }

    " JSON {
        nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
    " }
" }

if &term == 'xterm' || &term == 'screen' || &term == 'xterm-color'
set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
endif

""""""""""""""""""""""""""""""
" => Colorscheme
""""""""""""""""""""""""""""""
colorscheme molokai
colors molokai

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType js set omnifunc=javascriptcomplete#CompleteJS

" map
 map <C-A> ^
 map <C-E> $
 map <C-C> :vsplit
 map <C-D> :diffsplit
 map <C-M>/ :s#\( *\)//#\1#<CR>
 map <C-M># :%s/\( *\)#/\1/<CR>
 map <C-X> :%s/ *$//g<CR>
 set diffopt=vertical

" status line
 set statusline=%<%f\                     " Filename
 set statusline+=%w%h%m%r                 " Options
 if exists('*fugitive#statusline')
    set statusline+={fugitive#statusline()}  " Git Hotness
 endif
 set statusline+=\ [%{&ff}/%Y]            " Filetype
 set statusline+=\ [%{getcwd()}]          " Current dir
 set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

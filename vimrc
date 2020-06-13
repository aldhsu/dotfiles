" ------------------------------------------------------------------------------
"          FILE: .vimrc
"   DESCRIPTION: Vim configuration file. Based heavily on Sorin Ionescu's.
"        AUTHOR: Christopher Chow (chris at chowie dot net)
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" General Settings
" ------------------------------------------------------------------------------
command! W :w                                " Seriously, it's not like :W is bound
                                             " to anything anyway.
set nocompatible                             " Turn off vi compatibility.
set undolevels=1000                          " Large undo levels.
set undofile                                 " Save undo tree.
set undodir=/tmp                             " Undo tree directory.
set history=50                               " Size of command history.
set encoding=utf8                            " Always use unicode.
set backspace=indent,eol,start               " Fix backspace.

set nobackup                                 " Disable backups.
set nowritebackup
set noswapfile

set notimeout                                " Fix lag in iTerm.
set ttimeout
set timeoutlen=50
set nomodeline
set selection=inclusive                      " Select to the end of line.

set spelllang=en_au                          " Set spell check language.
set tags+=tags                               " Enable tags.
set nu
set clipboard=unnamed                        " Fix clipboard for macOS sierra using reattach-for-namespace
set spell spelllang=en_us 
set lazyredraw                               " Skip redrawing while in a macro for faster completion
set inccommand=nosplit                       " NeoVim only, shows realtime matches eg. :s/()/()
set shell=zsh
set iskeyword-=_                            " Underscore now acts as word boundary
" ------------------------------------------------------------------------------
" Plug
" ------------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" Language / syntax support.
Plug 'tpope/vim-rails'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'mustache/vim-mustache-handlebars'
Plug 'ap/vim-css-color'
Plug 'mutewinter/tomdoc.vim'
Plug 'cespare/vim-toml'
Plug 'hashivim/vim-hashicorp-tools'
Plug 'lmeijvogel/vim-yaml-helper'
Plug 'w0rp/ale'
Plug 'junegunn/vim-emoji'
Plug 'sheerun/vim-polyglot'
Plug 'alvan/vim-closetag'
Plug 'shime/vim-livedown'
Plug 'mattn/emmet-vim'
Plug 'zxqfl/tabnine-vim', {'for': ['ruby']}
Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': ['rust']}

Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'lotabout/skim.vim'
Plug 'janko-m/vim-test'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug 'henrik/rename.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ciaranm/detectindent'
Plug 'bkad/CamelCaseMotion'

Plug 'dyng/auto_mkdir'
Plug 'rizzatti/dash.vim'

Plug 'mbbill/undotree'
" Themes
Plug 'chriskempson/base16-vim'

call plug#end()

source ~/.config/nvim/platform.vim
source ~/.config/nvim/core.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/mappings.vim
" ------------------------------------------------------------------------------
" Binds
" ------------------------------------------------------------------------------
let mapleader = ","               " Use comma as leader.

" Save
map <Leader>w :wa<CR>

" Rg
nnoremap <leader>a :Rg<space>

" Rename buffer
nnoremap <Leader><Leader>r :Rename!<space>

" Copy current file path
nnoremap <Leader>cp :let @" = expand("%")

" Fugitive Status
map <Leader>s :Gstatus<CR>

" Remap esc
imap jj <ESC>
imap jk <ESC>
imap kj <ESC>

" Use v to toggle visual mode.
vno v <esc>

nmap <Leader>n :nohlsearch<CR>

" Save and run tests in Ruby

" nmap <silent> <leader>R :wa<CR> :call RunNearestTestWithGUIChrome()<CR>
" nmap <silent> <leader>r :wa<CR> :TestFile<CR>
" nmap <silent> <leader>l :wa<CR> :TestLast<CR>
" nmap <silent> <leader>a :TestSuite<CR>
" nmap <silent> <leader>g :TestVisit<CR>

" au FileType ruby nmap <Leader>r :wa<CR>:VroomRunTestFile<CR>
" au FileType ruby nmap <Leader>R :wa<CR>:VroomRunNearestTest<CR>
" au FileType ruby imap <Leader>r <ESC>:wa<CR>:VroomRunTestFile<CR>
" au FileType ruby imap <Leader>R <ESC>:wa<CR>:VroomRunNearestTest<CR>

" Save and run tests in JavasScript
let g:syntastic_javascript_checkers=['jscs']

" Dash integration

map <leader>F :Dash<CR>

" Explorer
nmap <Leader>e :Exp <CR>
nmap <Leader>E :Vex <CR>

" Explorer display
let g:netrw_liststyle=3
let g:netrw_list_hide= '.DS_Store'

" Refresh all open windows
nmap <Leader>% :windo e <CR>

" JSON format
nmap <Leader>j :%!python -m json.tool <CR>

" Yank filename into buffer
nmap <Leader>n :let @" = expand("%")<CR>

" YAML Helper
nmap <Leader>y :YamlGoToKey 
nmap <Leader>Y :YamlGetFullPath<CR>

" ------------------------------------------------------------------------------
" Deoplete
" ------------------------------------------------------------------------------

let g:deoplete#enable_at_startup = 1
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" ------------------------------------------------------------------------------
" Airline
" ------------------------------------------------------------------------------
let g:airline_powerline_fonts = 1

" ------------------------------------------------------------------------------
" the_silver_searcher
" ------------------------------------------------------------------------------
" Ignore log files.
let g:ag_prg="ag --column --smart-case --ignore \"*.log\""

" Bind a key for quick searching
nnoremap <leader>a :Ag<space>
nnoremap <leader>A :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

" ------------------------------------------------------------------------------
" rails.vim
" ------------------------------------------------------------------------------
" Set ctags command so that tags are supported by YouCompleteMe
let g:rails_ctags_arguments = ['--languages=-javascript', '--fields=+l', '--exclude=.git', '--exclude=log']

" ------------------------------------------------------------------------------
" vim-go
" ------------------------------------------------------------------------------
let g:go_fmt_command = "goimports"

" ------------------------------------------------------------------------------
" vim-closetag
" ------------------------------------------------------------------------------
let g:closetag_filenames = "*.html.erb,*.html,*.xhtml,*.phtml"

" ------------------------------------------------------------------------------
" Search and Replace
" ------------------------------------------------------------------------------
set incsearch                     " Show partial matches as search is entered.
set hlsearch                      " Highlight search patterns.
set ignorecase                    " Enable case insensitive search.
set smartcase                     " Disable case insensitivity if mixed case.
set wrapscan                      " Wrap to top of buffer when searching.
set gdefault                      " Make search and replace global by default.

" ------------------------------------------------------------------------------
" White Space
" ------------------------------------------------------------------------------
set tabstop=4                     " Set tab to equal 4 spaces.
set softtabstop=4                 " Set soft tabs equal to 4 spaces.
set shiftwidth=4                  " Set auto indent spacing.
set shiftround                    " Shift to the next round tab stop.
set expandtab                     " Expand tabs into spaces.
set smarttab                      " Insert spaces in front of lines.
set listchars=tab:··,trail:·      " Show leading whitespace
set list

" ------------------------------------------------------------------------------
" Presentation
" ------------------------------------------------------------------------------
set shortmess=aIoO                " Show short messages, no intro.
set ttyfast                       " Fast scrolling when on a decent connection.
set nowrap                        " Wrap text.
set showcmd                       " Show last command.
set ruler                         " Show the cursor position.
set hidden                        " Allow hidden buffers.
set showmatch                     " Show matching parenthesis.
set matchpairs+=<:>               " Pairs to match.
set cf                            " Enable error jumping.
syntax on                         " Enable syntax highlighting.
filetype on                       " Detect file type.
filetype indent on                " Enable file indenting.
filetype plugin indent on         " Load syntax files for better indenting.
highlight ColorColumn ctermbg=236 guibg=#262D51
autocmd InsertEnter,InsertLeave * set cul!

" ------------------------------------------------------------------------------
" User Interface
" ------------------------------------------------------------------------------
set termguicolors
colorscheme base16-tomorrow-night
set background=dark
let &t_8f="\e[38;2;%ld;%ld;%ldm"
let &t_8b="\e[48;2;%ld;%ld;%ldm"

if has('gui_running')
    set guioptions-=m             " Disable menu bar.
    set guioptions-=T             " Disable the tool bar bar.
    set guioptions-=l             " Disable left scrollbar.
    set guioptions-=L             " Disable left scrollbar when split.
    set guioptions-=r             " Diable right scrollbar.
    set guioptions-=a             " Do not auto copy selection to clipboard.

    " If MacVim do some specific things.
    set guifont=Source\ Code\ Pro\ for\ Powerline:h14
    set lines=52                      " Window size.
    set columns=165
    set vb                            " Disable the audible bell.
endif

if has('mouse')
    set mouse=a                   " Enable mouse everywhere.
    set mousemodel=popup_setpos   " Show a pop-up for right-click.
    set mousehide                 " Hide mouse while typing.
endif

" ------------------------------------------------------------------------------
" Status Line
" ------------------------------------------------------------------------------

" Always show status.
set laststatus=2

" Disable status line fill chars.
set fillchars+=stl:\ ,stlnc:\ " Space.

au FileType coffee setlocal tabstop=2 softtabstop=2 shiftwidth=2
au FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2 colorcolumn=121 textwidth=120
au FileType yaml,html.handlebars,html,haml,scss setlocal tabstop=2 softtabstop=2 shiftwidth=2
au FileType go setlocal tabstop=2 shiftwidth=2 noexpandtab nolist
au FileType javascript,js setlocal tabstop=2 shiftwidth=2 softtabstop=2

autocmd BufEnter *.m compiler mlint

au BufNewFile,BufRead Vagrantfile,Berksfile set filetype=ruby

" Don't hide quotes in JSON.
let g:vim_json_syntax_conceal = 0

" When not in a Rails project, vim-rails doesn't highlight
" RSpec files. Do it manually.
if !exists(":Rails!")
  function! SyntaxForRspec()
    syn keyword rubyRspec describe context it its specify shared_context shared_examples_for it_should_behave_like it_behaves_like before after around subject fixtures controller_name helper_name scenario feature background
    syn match rubyRspec '\<let\>!\='
    syn keyword rubyRspec violated pending expect double mock mock_model stub_model
    syn match rubyRspec '\.\@<!\<stub\>!\@!'
    highlight def link rubyRspec Function
  endfunction
  au BufNewFile,BufRead *_spec.rb call SyntaxForRspec()
endif

" Strip Trailing Whitespace
function! StripTrailingWhitespace()
    if !&binary && &modifiable && &filetype != 'diff'
        let l:winview = winsaveview()
        %s/\s\+$//e
        let @/=''
        call winrestview(l:winview)
    endif
endfunction
nnoremap <leader>W :call StripTrailingWhitespace()<CR>

" Create Spec File
function! CreateSpecFile()
    let fileExt = expand("%:e")
    if fileExt == "rb" || fileExt =="erb" || fileExt == "rake"
        vsplit
        let filePath = expand("%")
        let fileName = expand("%:t:r")
        let specPath = substitute(substitute(filePath, "app", "spec", ""), fileName, fileName . "_spec", "")
        let stringCommand = ":e " . specPath
        execute stringCommand

        "check if spec already exists
        if empty(glob(specPath))
            execute "normal! iRSpec.describe "
            " regex could be simplified with matching word start
            let className = substitute(substitute(fileName, "_\\(\\w\\)", "\\U\\1", "g"), "\\w", "\\U\\0", "")
            let stringWriteClass = "normal i " . className . " do\<cr>end\<esc>"
            execute stringWriteClass
            echo "Created spec file."
        else
            echo "Spec file already exists. Opened for you."
        endif
    else
        echo "Tried to create spec but not a Ruby file."
    endif
endfunction
command AVN call CreateSpecFile()

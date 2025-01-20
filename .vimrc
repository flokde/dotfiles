" Comments in Vimscript start with a `"`.

" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).

set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plug Ins
Plugin 'itchyny/lightline.vim'

" Unused Color schemes
" Plugin 'tomasiser/vim-code-dark'
" Plugin 'morhetz/gruvbox'

Plugin 'preservim/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'christoomey/vim-tmux-navigator'

" Fuzzy Finder
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'

" Plugin 'nvie/vim-flake8'
Plugin 'dense-analysis/ale'
Plugin 'smbl64/vim-black-macchiato'
Plugin 'wincent/command-t'

" Snippet Stuff
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'jpalardy/vim-slime'

" Makes stuff more readable
Plugin 'mechatroner/rainbow_csv'
Plugin 'luochen1990/rainbow'
Bundle 'wellle/context.vim'

" Markdown stuff
Plugin 'godlygeek/tabular'
Plugin 'preservim/vim-markdown'
Plugin 'iamcco/markdown-preview.nvim'

" Fugitive for better Git
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
" filetype plugin on
autocmd BufNewFile,BufRead *.py set ft=python

" Nerdtree settings
autocmd VimEnter * NERDTree | wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamed

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Rebind <Leader> key
let mapleader = ","

" easier moving between tabs
" map <Leader>n <esc>:tabprevious<CR>
" map <Leader>m <esc>:tabnext<CR>
map <c-n> <esc>:tabprevious<CR>
map <c-m> <esc>:tabnext<CR>

" currently disabled as tmux-vim-navigator takes care of this
" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
" map <c-j> <c-w>j
" map <c-k> <c-w>k
" map <c-l> <c-w>l
" map <c-h> <c-w>h

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" quote a word
nnoremap <Leader>q" ciw""<Esc>P
nnoremap <Leader>q' ciw''<Esc>P
nnoremap <Leader>q( ciw()<Esc>P
nnoremap <Leader>q[ ciw[]<Esc>P
nnoremap <Leader>q{ ciw[]<Esc>P
nnoremap <Leader>qd daW"=substitute(@@,"'\\\|\"","","g")<CR>P

" easier moving of code blocks
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Set folding to fold indented blocks
set foldmethod=indent
" Have everything unfolded on start
set foldlevel=99
set foldcolumn=2
" Have fold over entire file and set leader shortcut
" :let &l:foldlevel = indent('.') / &shiftwidth
:nnoremap <silent> <leader>z :let&l:fdl=indent('.')/&sw<cr>
" zR to open all folds, za to toggle current fold

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number
" set colorcolumn=80
" highlight ColorColumn ctermbg=0 guibg=green

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Highlight on search
set hlsearch

" Center when jumping around search results
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Double leader to clear search highlighting
nnoremap <Leader>, :noh<Enter>

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" python debuggin
nnoremap <leader>p oimport pdb; pdb.set_trace()<Esc>

""" color scheme
" set background=dark

" solarized light
syntax enable
set background=light

"gruvbox
" autocmd vimenter * ++nested colorscheme gruvbox


colorscheme solarized
" colorscheme palenight
" colorscheme codedark

set colorcolumn=80

" Flake8 settings
" let g:PyFlakeOnWrite = 1

" ale settings for linting and fixing
let g:ale_linters = {'python': ['flake8']}
" let g:ale_lsp_root = {}
let g:ale_fixers = {'python': ['black', 'isort'],
\   '*': ['remove_trailing_lines', 'trim_whitespaces'],
\}

" Set this variable to 1 to fix files when you save them.
" let g:ale_fix_on_save = 1

" Prettier markers for errors and warnings
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'

" Show number of errors according to ale
" function! LinterStatus() abort
"     let l:counts = ale#statusline#Count(bufnr(''))    let l:all_errors = l:counts.error + l:counts.style_error
"     let l:all_non_errors = l:counts.total - l:all_errors    return l:counts.total == 0 ? 'OK' : printf(
"         \   '%d⨉ %d⚠ ',
"         \   all_non_errors,
"         \   all_errors
"         \)
" endfunction

" set statusline+=%=
" set statusline+=\ %{LinterStatus()}

" Jump to next ale error
nmap <silent> <leader>e <Plug>(ale_next_wrap)

" copied from the internet to get tmux-vim navigation to work
" https://github.com/christoomey/vim-tmux-navigator/issues/234
nmap <C-j> :TmuxNavigateDown<cr>
nmap <C-k> :TmuxNavigateUp<cr>
nmap <C-l> :TmuxNavigateRight<cr>
imap <C-h> :TmuxNavigateLeft<cr>
imap <C-j> :TmuxNavigateDown<cr>
imap <C-k> :TmuxNavigateUp<cr>
imap <C-l> :TmuxNavigateRight<cr>

" ctags should check not only current directory, but higher level ones, too
set tags=tags;/

" move left and right
" noremap ö l
" noremap l h

" black macchiato vim integration
autocmd FileType python xmap <buffer> <Leader>f <plug>(BlackMacchiatoSelection)
autocmd FileType python nmap <buffer> <Leader>f <plug>(BlackMacchiatoCurrentLine)

" fix legacy snipmate parser is deprecated
" let g:snipMate = { 'snippet_version' : 1 }
" UltiSnips config
let g:UltiSnipsExpandTrigger="<Leader>a"
" " list all snippets for current filetype
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-i>"
let g:UltiSnipsJumpBackwardTrigger="<c-u>"


" vim-slime configuration
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}

" Commenting blocks of code.
" augroup commenting_blocks_of_code
"   autocmd!
"   autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
"   autocmd FileType sh,ruby,python   let b:comment_leader = '# '
"   autocmd FileType conf,fstab       let b:comment_leader = '# '
"   autocmd FileType tex              let b:comment_leader = '% '
"   autocmd FileType mail             let b:comment_leader = '> '
"   autocmd FileType vim              let b:comment_leader = '" '
" augroup END
" noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
" noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" source: https://stackoverflow.com/a/24046914/2571881
let s:comment_map = {
    \   "c": '\/\/',
    \   "cpp": '\/\/',
    \   "go": '\/\/',
    \   "java": '\/\/',
    \   "javascript": '\/\/',
    \   "lua": '--',
    \   "scala": '\/\/',
    \   "php": '\/\/',
    \   "python": '#',
    \   "ruby": '#',
    \   "rust": '\/\/',
    \   "sh": '#',
    \   "desktop": '#',
    \   "fstab": '#',
    \   "conf": '#',
    \   "profile": '#',
    \   "bashrc": '#',
    \   "bash_profile": '#',
    \   "mail": '>',
    \   "eml": '>',
    \   "bat": 'REM',
    \   "ahk": ';',
    \   "vim": '"',
    \   "tex": '%',
    \ }

function! ToggleComment()
    if has_key(s:comment_map, &filetype)
        let comment_leader = s:comment_map[&filetype]
        if getline('.') =~ '^\s*$'
            " Skip empty line
            return
        endif
        if getline('.') =~ '^\s*' . comment_leader
            " Uncomment the line
            execute 'silent s/\v\s*\zs' . comment_leader . '\s*\ze//'
        else
            " Comment the line
            execute 'silent s/\v^(\s*)/\1' . comment_leader . ' /'
        endif
    else
        echo "No comment leader found for filetype"
    endif
endfunction

nnoremap <Leader>c :call ToggleComment()<CR>
vnoremap <Leader>c :call ToggleComment()<CR>
" end comment toggle stuff


" YouCompleteMe settings
set completeopt-=preview
nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <leader>gt :YcmCompleter GetType<CR>
nnoremap <leader>gp :YcmCompleter GetParent<CR> " Doesn't work for python :(
nnoremap <leader>go :YcmCompleter GetDoc<CR>

" Rainbow Brackets on
let g:rainbow_active = 1

" let lightcolors =  ['lightblue', 'lightyellow', 'red', 'darkgreen', 'darkyellow', 'lightred', 'yellow', 'cyan', 'magenta', 'white']
let darkcolors = ['DarkBlue', 'Magenta', 'Black', 'Red', 'DarkGray', 'DarkGreen', 'DarkYellow']
let g:rainbow_conf = {'ctermfgs': darkcolors}

" Not losing registry when pasting, so we could paste an additional time
xnoremap p pgvy

" Get Silver Surfer on shortcut
nnoremap <leader>x :Ag <CR>

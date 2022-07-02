" Load Plug
call plug#begin('~/.vim/plugged')

" Plugins
" Cosmetic
Plug 'chriskempson/base16-vim'
Plug 'dylanaraps/wal.vim'
Plug 'ap/vim-css-color'

"" Writing
Plug 'junegunn/goyo.vim'
Plug 'preservim/vim-wordy'
Plug 'liuchengxu/vista.vim'
Plug 'dense-analysis/ale'
" End Plug
call plug#end()


" Filetype detection
set nocompatible
filetype plugin indent on

" Colors
syntax enable

" Status line
set laststatus=2
set statusline=%t

" GUI
set guifont=Cousine\ NF\ Regular\ 12

if has('gui_running')
    "GUI colors
    colorscheme base16-grayscale-dark
else
    " Term colors
    colorscheme wal
endif

" Line numbering
set number relativenumber " hybrid numbering for easier vertical navigation

" Whitespace
set tabstop=4 " tabs are 4 spaces
set shiftwidth=4 
set expandtab " tabs insert spaces

" Misc UI
set wildmenu " visual autocomplete for commands
set showcmd "show command in bottom bar

" Open Vista
nnoremap <F2> :Vista!!<CR>

" Search
set incsearch " search as characters are entered
set hlsearch " highlight matches
nnoremap <leader><space> :nohlsearch<CR>

" ALE edit Shortcuts \ + n or N to jump to errors
nnoremap <leader>n :ALENext<CR>
nnoremap <leader>N :ALEPrevious<CR>


" ALE
" Disabled at startup
let g:ale_enabled = 0
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'css': ['prettier'],
\   'scss': ['prettier']
\}

let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_error = '⛔'
let g:ale_sign_warning = '⚠️'

" Toggle Ale
nnoremap <F3> :ALEToggle<CR>

" Markdown
au BufNewFile,BufRead *.{md,mdown,mkd,markdown,mdwn} call WriteMode()

function! WriteMode()
    set linebreak " break lines at words (visual)
    set nocursorline " turn current line highlighting off
	setlocal spell spelllang=en_us
    set statusline=%t " Filename
    set statusline+=%=%= " Switch to right side
    set statusline+=%{wordcount().words}\ words " Display a word count
endfunction

" Javascript/web stuff
au BufNewFile,BufRead *.{css,scss,js,javascript,pug,html,vue} call WebMode()

function! WebMode()
    set tabstop=2
    set shiftwidth=2
    set expandtab
    " autocomplete curly braces
    inoremap {<CR> {<CR>}<Esc>ko
    " ALE prettier fix on save
    let g:ale_fix_on_save = 1


endfunction


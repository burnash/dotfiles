call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set autoindent                  " preserve current indent on new lines
set textwidth=0                 " disable wrap
set backspace=indent,eol,start  " make backspaces delete sensibly
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

set tabstop=2                   " indentation levels every two columns
set expandtab                   " convert all tabs typed to spaces
set shiftwidth=2                " indent/outdent by two columns
set shiftround                  " indent/outdent to nearest tabstop
set nowrap

set matchpairs+=<:>             " allow % to bounce between angles too

set vb                          " use visual bell instead of beeping

set incsearch                   " incremental search

set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search patter is all

set hlsearch                    " highlight search

set title                       " change the terminal's title
set ruler                       " ruler

set fillchars=vert:\|           " change splitter

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

" syntax highlighting
set bg=light
syntax on

" dont use Q for Ex mode
map Q :q

" make tab in v mode ident code
"vmap <tab> >gv
"vmap <s-tab> <gv

" make tab in normal mode ident code
nmap <tab> I<tab><esc>
nmap <s-tab> ^i<bs><esc>

" paste mode - this will avoid unexpected effects when you
" cut or copy some text from one window and paste it in Vim.
"set pastetoggle=<F11>

" taglist
filetype on
nnoremap <silent> <F8> :TlistToggle<CR>

filetype plugin indent on

" This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" Toggle line numbers and fold column for easy copying:
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>


" python specific
" autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" following some perl specific settings
"

" autoindent
autocmd FileType perl set autoindent|set smartindent

" 4 space tabs
autocmd FileType perl set tabstop=4|set shiftwidth=4|set expandtab|set softtabstop=4

" 4 space tabs
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab|set softtabstop=4


" show matching brackets
autocmd FileType perl set showmatch

" show line numbers
" autocmd FileType perl set number

" check perl code with :make
autocmd FileType perl set makeprg=perl\ -wc\ %\ $*
autocmd FileType perl set errorformat=%f:%l:%m
autocmd FileType perl set autowrite

" Trim trailing whitespace
au FileType c,cpp,java,php,perl,python,html,htmldjango,mason,tt2html,css au BufWritePre * :%s/\s\+$//e

" Restore position in a file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" NERDTree
nmap ,m :NERDTreeToggle<CR>
nmap ,n :NERDTreeClose<CR>:NERDTreeFind<CR>
nmap ,N :NERDTreeClose<CR>

" Buffergator
nnoremap <silent> ,b :BuffergatorToggle<CR>
nnoremap <silent> ,B :BuffergatorClose<CR>
nnoremap <silent> ,t :BuffergatorTabsOpen<CR>
nnoremap <silent> ,T :BuffergatorTabsClose<CR>

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$', '^\.git$' ]

"let NERDTreeShowBookmarks=1       " Show the bookmarks table on startup
"let NERDTreeShowFiles=1           " Show hidden files, too
"let NERDTreeShowHidden=1
"let NERDTreeQuitOnOpen=1          " Quit on opening files from the tree
"let NERDTreeHighlightCursorline=1 " Highlight the selected entry in the tree
"let NERDTreeMouseMode=2           " Use a single click to fold/unfold directories
                                  " and a double click to open files

" Open settings
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Switch windows fast
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Universal semicolon
nnoremap ; :

map <F9> :w!<CR>:!python %<CR>
map <F12> :set number!<Bar>set number?<CR>
"map <silent><F9> <ESC>:!pychecker %<CR>
map <silent><F3> <ESC>:w!<ESC>:!python -m pdb %<CR>

map <F8> :w!<CR>:!scala %<CR>
map <F7> :w!<CR>:!rdebug %<CR>

source $HOME/.vim/ru_mapping.vimrc

let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" CoffeeTags
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif

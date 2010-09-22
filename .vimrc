set autoindent                  " preserve current indent on new lines
set textwidth=78                " wrap at this column
set backspace=indent,eol,start  " make backspaces delete sensibly

set tabstop=4                   " indentation levels every four columns
set expandtab                   " convert all tabs typed to spaces
set shiftwidth=4                " indent/outdent by four columns
set shiftround                  " indent/outdent to nearest tabstop

set matchpairs+=<:>             " allow % to bounce between angles too

set vb                          " use visual bell instead of beeping

set incsearch                   " incremental search

" syntax highlighting
set bg=light
syntax on

"highlight search
set hlsearch

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

"This unsets the "last search pattern" register by hitting return
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

" show matching brackets
autocmd FileType perl set showmatch

" show line numbers
" autocmd FileType perl set number

" check perl code with :make
autocmd FileType perl set makeprg=perl\ -wc\ %\ $*
autocmd FileType perl set errorformat=%f:%l:%m
autocmd FileType perl set autowrite


" trim trailing whitespace
au FileType c,cpp,java,php,perl,python,html,htmldjango,mason,tt2html,css au BufWritePre * :%s/\s\+$//e

au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" Open settings
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Switch windows fast
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Universal semicolon
nnoremap ; :


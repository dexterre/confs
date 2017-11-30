set nocompatible              " be iMproved, required
filetype off                  " required
set hidden                    " keep unsaved buffers open

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'arcticicestudio/nord-vim'
Bundle 'christoomey/vim-tmux-navigator'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'itchyny/lightline.vim'
Plugin 'leafgarland/typescript-vim'
Bundle 'yonchu/accelerated-smooth-scroll'
Plugin 'airblade/vim-gitgutter'
Plugin 'othree/yajs.vim'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'jdonaldson/vaxe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" Allow copying
set clipboard=unnamed

" Syntax on
syntax on

" Always show status bar
set laststatus=2

" Show line numbers
set number

" Show whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use GUI color settings
if !has('gui_running')
  set t_Co=256
endif

" Don't show insert at bottom
set noshowmode

" Color scheme
colorscheme nord

" Prevent swap files
set shortmess+=A

" Ctrl-p to launch fzf
nnoremap <c-p> :FZF<cr>
nnoremap <c-l> :Buffers<cr>

" Use Ag in vim
let g:ackprg = 'ag --vimgrep'

" Indent html
filetype plugin indent on
set filetype=html
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" set autocomplete
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" enable mouse scrolling
set mouse=a

" Exclude certain directories in Ctrl-P
" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
      \ 'file': '\.so$\|\.dat$|\.DS_Store$'
      \ }

" NERDTree Config
let NERDTreeShowHidden=1

" Commenting blocks of code.
autocmd FileType c,cpp,typescript,javascript let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" Lightline customization
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'right': [['percent'], ['lineinfo']],
      \ }
      \}

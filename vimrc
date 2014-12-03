set nocompatible               " be iMproved
filetype off                   " required!
set bs=indent,eol,start        " Backspace over everything in insert mode
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

set antialias                     " MacVim: smooth fonts.
set encoding=utf-8                " Use UTF-8 everywhere.
set clipboard=unnamed

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Bundles
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'rstacruz/sparkup'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'majutsushi/tagbar'
Bundle 'skammer/vim-css-color'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'bling/vim-airline'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-lua-ftplugin'
Bundle 'tpope/vim-vinegar'
Bundle 'tpope/vim-markdown'
Bundle 'mhinz/vim-signify'
Bundle 'chriskempson/base16-vim'

" required!
filetype plugin indent on
syntax on

colorscheme Tomorrow-Night

set guifont=Source\ Code\ Pro\ ExtraLight\ for\ Powerline:h14
set background=dark

set shiftwidth=4
set softtabstop=4
set expandtab

set number
set vb

set hlsearch
set incsearch
set ignorecase
set smartcase
set autoindent

autocmd BufEnter * silent! lcd %:p:h " alternative to autochdir

if executable('ack')
    set grepprg=ack\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ $*
    set grepformat=%f:%l:%c:%m
endif

" no looking back
set nobackup
set nowritebackup
set noswapfile

" no sidebar
set go-=L 
set guioptions-=r

" vim tagbar
nmap <F8> :TagbarToggle<CR>

" cursor line
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline cursorcolumn
  au WinLeave * setlocal nocursorline nocursorcolumn
augroup END

" syntastic
let g:syntastic_check_on_open=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

set t_Co=256

set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" no banner for netrw
let g:netrw_banner=0

" set leader
let mapleader = "\\"
let g:mapleader = "\\"

" airline
let g:airline_powerline_fonts = 1

"ig
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#1c1c1c ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=235
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

set timeoutlen=500

au BufRead,BufNewFile *.scss set filetype=css

" xml
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" syntastic jsxhint
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_javascript_jsxhint_args = '-c ~/code/vimeo/.jsxhintrc'

" vim signify
let g:signify_vcs_list = [ 'git' ]

" highlight lines in Sy and vimdiff etc.)

highlight DiffAdd           cterm=bold ctermbg=none ctermfg=none
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=none
highlight DiffChange        cterm=bold ctermbg=none ctermfg=none

" highlight signs in Sy

highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=34
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=196
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=208

""" Unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#set_profile('files', 
    \ 'context', {
        \ 'smartcase': 1
    \ })
call unite#custom#source('line,outline','matchers','matcher_fuzzy')
let g:unite_prompt='» '

" ctrl-p
let g:unite_source_file_rec_max_cache_files = 0
call unite#custom#source('file_mru,file_rec,file_rec/async,grepocate',
    \ 'max_candidates', 0)
call unite#custom#source('file_rec,file_rec/async', 'matchers', 'matcher_project_ignore_files')
call unite#custom#source('file_rec,file_rec/async', 'ignore_pattern', '\.sass-cache/\|node_modules/\|\.vagrant/')
nnoremap <C-p> :Unite -start-insert file_rec/async<cr>
nnoremap <C-g> :Unite -start-insert file_rec/git<cr>

" ack
let g:unite_source_grep_command = 'ack'
let g:unite_source_grep_default_opts='--no-heading --no-color -C4'
let g:unite_source_grep_recursive_opt=''
nnoremap <space>/ :Unite grep:.<cr>

" yankstack
let g:unite_source_history_yank_enable = 1
nnoremap <space>y :Unite history/yank<cr>

" juggle
nnoremap <space>s :Unite -quick-match buffer<cr>

" quick cd
nnoremap <leader>cd :lcd %<cr>

set shell=zsh

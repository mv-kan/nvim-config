syntax on
set nu ru et
set ts=2 sts=2 sw=2
set hlsearch
" set cursorline " underline is dead with this setting on 
call plug#begin() 
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'preservim/nerdtree'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'neovim/nvim-lspconfig'
call plug#end()

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" added lsp-config 
" here is source:  https://www.getman.io/posts/programming-go-in-neovim/ 

lua require("lsp_config")

autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
autocmd BufWritePre *.go lua goimports(1000)

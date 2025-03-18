syntax on
colorscheme tender
set termguicolors
set background=dark
set clipboard+=unnamed
set invnumber invrelativenumber
set signcolumn=no  
set completeopt=menu,menuone,noinsert
set timeoutlen=300
set wildignore+=*.pyc,__pycache__
set undodir=~/.vim/undo//
set smartindent
set foldmethod=syntax
set foldlevelstart=99
set foldenable 

filetype indent on
autocmd BufRead,BufWritePre *.sh normal gg=G

" Autosave
set noswapfile
au BufLeave,CursorHold,FocusLost * if(getbufinfo('%')[0].changed) | do BufWritePre | sil! up | do BufWritePost | endif

inoremap <Space> <Space>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

let g:rust_fold = 1 
let g:alduin_Shout_Dragon_Aspect = 1
let g:NetrwIsOpen = 0
let g:rustfmt_autosave = 1

function! ToggleNetrw()
  if g:NetrwIsOpen
    let l:i = bufnr("$")
    while l:i >= 1
      if getbufvar(l:i, "&filetype") == "netrw"
        execute "silent! bwipeout " . l:i
      endif
      let l:i -= 1
    endwhile
    let g:NetrwIsOpen = 0
  else
    let g:netrw_browse_split = 0
    let g:netrw_altv = 1
    let g:netrw_liststyle = 3    
    let g:NetrwIsOpen = 1
    execute "silent Explore"
  endif
endfunction

function! NetrwMapping()
  nmap <buffer> h -
  nmap <buffer> l <CR>
  nmap <buffer> . gh
  nmap <buffer> r :Lexplore<CR>
  setlocal statusline=\ %f
endfunction

augroup NETRWOPTIONS
  autocmd!
  autocmd FileType netrw call NetrwMapping()
  autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" | q | endif
augroup END

let g:netrw_banner = 0
let g:netrw_winsize = -28
let g:netrw_liststyle = 3
let g:netrw_sort_sequence = '[\/]$,*'
let g:netrw_browse_split = 4
nnoremap <silent><space>e :call ToggleNetrw()<CR>
nnoremap <leader>wj <C-w>j  " Space + W + J to move to the window below
nnoremap <leader>wk <C-w>k  " Space + W + K to move to the window above
nnoremap <leader>wh <C-w>h  " Space + W + H to move to the left window
nnoremap <leader>wl <C-w>l  " Space + W + L to move to the right window
nnoremap <leader>gl :!lazygit<CR> " Space + G + L to open lazygit

" Define session directory
let g:workspace_session_directory = expand('$HOME/.vim/sessions/')

" Ensure the directory exists
if !isdirectory(g:workspace_session_directory)
    call mkdir(g:workspace_session_directory, 'p')
endif

" Auto-load session if no arguments are given
augroup AutoSession
    autocmd!
    autocmd VimEnter * nested if len(v:argv) == 1 | silent! execute 'source ' . g:workspace_session_directory . 'default.vim' | endif
    autocmd VimLeave * if len(v:argv) == 1 | execute 'mksession! ' . g:workspace_session_directory . 'default.vim' | endif
augroup END

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

let g:lsp_document_code_action_signs_enabled = 0
let g:lsp_diagnostics_enabled = 0 

" VIM LSP
augroup LspMappings
  autocmd!
  autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'rust-analyzer',
        \ 'cmd': ['rust-analyzer'],
        \ 'allowlist': ['rust'],
        \ })

    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': ['clangd'],
        \ 'allowlist': ['c'],
    \ })

    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'tsserver',
        \ 'cmd': ['typescript-language-server', '--stdio'],
        \ 'allowlist': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'],
    \ })

    " ESLint for Linting
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'eslint',
        \ 'cmd': ['vscode-eslint-language-server', '--stdio'],
        \ 'allowlist': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'],
    \ })
augroup END

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> cs <plug>(lsp-document-symbol-search)
    nmap <buffer> cS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> ci <plug>(lsp-implementation)
    nmap <buffer> ct <plug>(lsp-type-definition)
    nmap <buffer> cr <plug>(lsp-rename)
    nmap <buffer> cf <plug>(lsp-document-format)
    nmap <buffer> cci <plug>(lsp-call-hierarchy-incoming)
    nmap <buffer> cco <plug>(lsp-call-hierarchy-outgoing)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 2000
    autocmd! BufWritePre *.c,*.rs,*.go call execute('LspDocumentFormatSync')
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

set packpath+=~/.vim/configs

" Load Pathogen and configure plugin paths
let s:vim_runtime = expand('<sfile>:p:h') . "/.."
execute 'call pathogen#infect(s:vim_runtime . "/plugins_forked/*")'
call pathogen#helptags()

" => bufExplorer plugin
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
nmap <leader>, :BufExplorer<cr>

" => YankStack
let g:yankstack_yank_keys = ['y', 'd']
nmap <C-p> <Plug>yankstack_substitute_older_paste
nmap <C-n> <Plug>yankstack_substitute_newer_paste

"FZF
set rtp+=/opt/homebrew/opt/fzf
nnoremap <leader>gg :Rg<CR>
nmap <Space><Space> :Files<cr>
nmap <leader>gb :Buffers<cr>
nmap <leader>gc :Commits<cr>
nmap <leader>gn :Lines<cr>
nmap <leader>gd :Changes<cr>
nmap <leader>gm :Marks<cr>
nmap <leader>gw :Windows<cr>
nmap <leader>gh :History<cr>
let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --exclude .git --exclude target --color=never'
let $FZF_DEFAULT_OPTS="--color=16"
let g:fzf_preview_window = []
let g:fzf_layout = { 'down': '~40%' }
autocmd! FileType fzf tnoremap <buffer> <Esc> <C-c>
tnoremap <C-[> <C-c>

" => ZenCoding
let g:user_zen_mode='a'

" => snipMate (beside <TAB> support <CTRL-j>)
ino <C-j> <C-r>=snipMate#TriggerSnippet()<cr>
snor <C-j> <esc>i<right><C-r>=snipMate#TriggerSnippet()<cr>
let g:snipMate = { 'snippet_version' : 1 }

" => vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-s>'
let g:multi_cursor_select_all_word_key = '<A-s>'
let g:multi_cursor_start_key           = 'g<C-s>'
let g:multi_cursor_select_all_key      = 'g<A-s>'
let g:multi_cursor_next_key            = '<C-s>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'

" Annotate strings with gettext
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>

" => lightline
let g:lightline = {
      \ 'colorscheme': 'tender',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*FugitiveHead")?FugitiveHead():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

" => Vimroom
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>

" => Git gutter (Git diff)
let g:gitgutter_enabled=1
nnoremap <silent> <leader>d :GitGutterToggle<cr>

" => EditorConfig (project-specific EditorConfig rule)
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" => Fugitive
" Copy the link to the line of a Git repository to the clipboard
nnoremap <leader>v :.GBrowse!<CR>
xnoremap <leader>v :GBrowse!<CR>



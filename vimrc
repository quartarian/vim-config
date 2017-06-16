"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pathogen inclusion 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call pathogen#infect()
call pathogen#helptags()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set pastetoggle=<F2>  "F2 triggers pastmode
set mouse=a           "Enable Mouse in all mode
set expandtab " tabs become spaces
set tabstop=4 " width of tabs
set shiftwidth=4
set softtabstop=4
set autoindent " auto indentation
" set smartindent
set hlsearch "highlight search terms
set incsearch " highlight and search to while typing
set nu "show line numbers
set nobackup " don't create backup files or swap files - they annoy my version control
set nowb " dont create backup before save
set noswapfile " No .swp files
set hid " change buffer without save
set showmatch " Show matching bracets when text indicator is over them
set ruler " show current position
set nocompatible " Noneone likes vi anyway
:hi MatchParen cterm=bold ctermbg=none ctermfg=none "embolden matching parentheses
set t_Co=256
" Remap F1 to Escape
map <F1> <Esc> 
imap <F1> <Esc>

" Pane resize in tmux
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Typo Correction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iabbrev adn and
iabbrev tehn then
iabbrev waht what

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" IDE Setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
  augroup module
    " Drupal *.module and *.install files.
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.tpl set filetype=html
    autocmd BufRead,BufNewFile *.dust set filetype=html
    autocmd BufRead,BufNewFile *.wsgi set filetype=python
    autocmd BufRead,BufNewFile *.json set filetype=javascript
    autocmd BufRead,BufNewFile *.hbs set filetype=html
    autocmd BufNewFile,BufRead *.ccss set filetype=sass
  augroup END
endif

filetype plugin on
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType scss set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP

" Visualize all tabs
set list
set listchars=tab:>-,trail:~

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","
" Format json
map <leader>j :%!python -m json.tool<CR>

" Quick switch buffers
nnoremap <C-Left> :tabp<CR>
nnoremap <C-Right> :tabn<CR>

" Code Folding
nnoremap <leader> za
vnoremap <leader> za

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Quick edit .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic (https://github.com/spf13/spf13-vim/blob/master/.vimrc)
if has('statusline')
  set laststatus=2
  " Broken down into easily includeable segments
  set statusline=%<%f\    " Filename
  set statusline+=%w%h%m%r " Options
  set statusline+=\ [%{&ff}/%Y]            " filetype
  set statusline+=%#warningmsg#
  set statusline+=%{fugitive#statusline()}
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  set statusline+=%{ObsessionStatus()} " :help obsession-status
  let g:syntastic_enable_signs=1
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
imap <expr> <Tab> emmet#expandAbbrIntelligent("\<Tab>")
" let g:user_emmet_expandabbr_key='<C-Tab>'
"map <leader>c :%!python -m json.tool<CR>
let g:user_emmet_expandabbr_key='<C-c>'


" PHP Complete
let g:phpcomplete_index_composer_command="/usr/bin/composer"

" YCM
let g:ycm_server_python_interpreter = '/usr/bin/python'

" Vdebug
let g:vdebug_options = {"path_maps": {"/var/www": "/home/matt/Work/IRC/Repo"}, "break_on_open": 0, "watch_window_style": "compact","ide_key": ''}
" let g:vdebug_keymap['run'] = '<C-F5>'
" let g:vdebug_options= {
"     \    "port" : 9000,
"     \    "server" : 'localhost',
"     \    "debug_file_level" : 2,
"     \    "ide_key": '', 
"     \    "debug_file" : '~/vdebug.log',
"     \}

" Ctrl-P
let g:ctrlp_cmd='CtrlP :pwd'

" Simple ToDo
let g:simple_todo_tick_symbol = '✔'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Themes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Blazer
"let g:airline_theme = 'ubaryd'
":colorscheme blazer

" Distinguished
let g:airline_theme = 'bubblegum'
color distinguished
hi Normal ctermfg=252 ctermbg=none

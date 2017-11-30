"
" Start Vundle
"
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" :PluginInstall
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" autocomplete
    " cd ~/.vim/bundle/YouCompleteMe
    " ./install.sh --clang-completer
    " http://susu.github.io/posts/clang-completion-in-vim-with-youcompleteme/
Plugin 'Valloric/YouCompleteMe'

" required for vim-clang-format
Bundle 'kana/vim-operator-user.git'

" formatting for c, c++ files
Bundle 'rhysd/vim-clang-format'

" Nice comment toggling.
" Has a lot of unneeded keybindings?
Plugin 'tomtom/tcomment_vim.git'

" Python formatting
Plugin 'pignacio/vim-yapf-format'

" Plugin 'vim-scripts/taglist.vim'

Plugin 'majutsushi/tagbar'
" shows multiple files nicely
" <F1> for help doesn't work
" doesn't show vim leader (taglist does)

" Automatic tabs and spaces
" Plugin 'tpope/vim-sleuth.git'

" opening companion files
" might be better than a.vim?
Plugin 'derekwyatt/vim-fswitch'
" settings are in .vim/after/plugin/fswitch.vim

Plugin 'vim-syntastic/syntastic.git'

" Solarized color scheme
Plugin 'altercation/vim-colors-solarized'

" Syntax plugins
Plugin 'vim-scripts/scons.vim.git'
Plugin 'vim-scripts/SWIG-syntax.git'
Plugin 'stephpy/vim-yaml.git'

" python lint, lots of other stuff
Bundle 'klen/python-mode'

call vundle#end()
filetype plugin indent on
"
" ### end vundle stuff ###
"
let g:yapf_format_yapf_location = '~/software/yapf'

" leader key
let mapleader=","

" Avoid hitting Esc so much - use jk instead.
inoremap jk <C-[>
" C-[ is better than Esc, not clear why.

" sudo write this
cmap W! w !sudo tee % >/dev/null

set nobackup  " don't save swap files
set backspace=indent,eol,start

set smarttab
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Keeps cursor away from the edges of the screen.
set scrolloff=10
set sidescrolloff=5

" set smartcase
set number
nnoremap <F2> :set nonumber!<CR>
set pastetoggle=<F2>

" Show white space, with particular characters.
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set display+=lastline

" Disable Ex mode
map Q <Nop>

" Search highlighting
set incsearch
set hlsearch
nnoremap <silent> <CR> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR>:redraw<CR>
" nnoremap <silent><CR> :nohlsearch<CR><CR>

" Alwasy show the status bar.
set laststatus=2

" Show row and column
set ruler

" Autocompletion of file browsing.
set wildmenu
set wildmode=longest:list

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

set autoread
set history=1000
set sessionoptions-=options

" Effects what vim restores, see :help viminfo-!
if !empty(&viminfo)
  set viminfo^=!
endif

" " Open taglist, does multiple buffers
" map <silent> <leader>; :TlistToggle<CR>

" Open tag bar
map <silent> <leader>l :TagbarToggle<CR>

" Saves you from losing text from <C-U> and <C-W>
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

" Movement between tabs
" <C-I> is <Tab>, so don't map in insert mode.
" Maybe stop using tabs at all, try CtrlP?
nnoremap <C-I> :tabprev<CR>
nnoremap <C-O> :tabnext<CR>

" Movement between splits
nmap <C-K> <C-w><Up>
nmap <C-J> <C-w><Down>
nmap <C-L> <C-w><Right>
nmap <C-H> <C-w><Left>
set splitbelow
set splitright

"
" Some tComment settings
"
" yank visual before toggle comment
vmap gy ygvgc
" yank and past visual before toggle comment
vmap gyy ygvgc'>gp'.
" yank line before toggle comment
nmap gy yygcc
" yank and paste line before toggle comment and remember position
" it works both in normal and insert mode
" Use :t-1 instead of yyP to preserve registers
nmap gyy mz:t-1<cr>gCc`zmz
" imap gyy <esc>:t-1<cr>gCcgi  " Makes g laggy

" "
" " Syntastic settings
" "
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Note that pep8 didn't work until flake8 was installed
" pylint seems to be broken
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
" let g:syntastic_python_checkers = ['pep8']
let g:syntastic_python_checkers = ['flake8']

" Command for finding a config file and passing it to pep8
" Works, but pep8 doesn't recognize it
function! FindConfig(prefix, what, where)
    let cfg = findfile(a:what, escape(a:where, ' ') . ';')
    return cfg !=# '' ? ' ' . a:prefix . ' ' . shellescape(cfg) : ''
endfunction

" autocmd FileType python let b:syntastic_python_pep8_args =
"     \ get(g:, 'syntastic_python_pep8_args', '') .
"     \ FindConfig('--config', 'config.pep8', expand('<afile>:p:h', 1))

autocmd FileType python let b:syntastic_python_flake8_args =
    \ get(g:, 'syntastic_python_flake8_args', '') .
    \ FindConfig('--config', '.flake8', expand('<afile>:p:h', 1))

"
"--------- YouCompleteMe options ------------------------
"
let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:Show_diagnostics_ui = 1 "default 1

"will put icons in Vim's gutter on lines that have a diagnostic set.
"Turning this off will also turn off the YcmErrorLine and YcmWarningLine
"highlighting
let g:ycm_enable_diagnostic_signs = 1  " signs in gutter
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1

let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_collect_identifiers_from_tags_files = 1 "default 0

" let g:ycm_global_ycm_extra_conf="~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_global_ycm_extra_conf="~/.vim/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0  "ask before loading, security issue

let g:ycm_goto_buffer_command = 'new-tab'
" let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_filetype_whitelist = { '*': 1 }  " only work on certain filetypes?
let g:ycm_key_invoke_completion = '<C-Space>'

nmap <Leader>ff :YcmCompleter FixIt <CR>
nmap <Leader>g :YcmCompleter GoToImprecise <CR>

""" clang format options ---------------------------------
let g:clang_format#command = "clang-format-4.0"
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "ColumnLimit" : 90,
            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>fc :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>fc :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

let g:ycm_global_ycm_extra_conf = '~/dotfiles/.ycm_extra_conf.py'

" ???
set completeopt=menu,menuone

"
" python-mode mappings ----------------------------
"
map <leader>fp :PymodeLintAuto<CR>
map <leader>fy :YapfFullFormat<CR>

" let g:pymode_doc_key = 'K'

let g:pymode_rope=0
let g:pymode_debug=1
let g:pymode_rope_completion = 0
let g:pymode_rope_lookup_project = 0

" syntax highlighting
let g:pymode_syntax=1
let g:pymode_syntax_all=1
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all

let g:pymode_folding = 0  " comletely disable folding
" set foldlevelstart=2

"Lint
let g:pymode_lint = 0
let g:pymode_lint_checker = "flake8"  " mccabe, pyflakes, others?
let g:pymode_lint_write = 0  " auto check on save

" Turn off column limit highlighting
let g:pymode_options_colorcolumn = 0

" Setting for solarized colorscheme
" Install solarized dark/light over *new* profiles
" https://github.com/sigurdga/gnome-terminal-colors-solarized.git
set t_Co=16
let g:solarized_termcolors=16
set background=dark
colorscheme solarized
call togglebg#map("<f6>")

" Key mapping for simple .vimrc editing
nmap <silent> <leader>ev :tabe $MYVIMRC<CR>

" Source .vimrc file
map <silent> <leader>sv :source $MYVIMRC<CR>:exe ":echo 'vimrc reloaded'"<CR>

" file types to recognize
au BufNewFile,BufRead SCons* set filetype=scons
au BufNewFile,BufRead CMake* set filetype=cmake
au BufNewFile,BufRead *.i set filetype=swig
au BufNewFile,BufRead *.swig set filetype=swig
au BufNewFile,BufRead *.swg set filetype=swig
au BufNewFile,BufRead *.sip set filetype=swig  " Hack, probably not great
au BufNewFile,BufRead *.ino set filetype=c  " arduino files
au BufNewFile,BufRead *.sage set filetype=python
au BufNewFile,BufRead *.urdf set filetype=xml
au BufNewFile,BufRead *.launch set filetype=xml
au BufNewFile,BufRead *.c set filetype=c

autocmd BufRead,BufNewFile *.launch setfiletype roslaunch

autocmd FileType scons set commentstring=#\ %s
autocmd FileType cmake set commentstring=#\ %s
autocmd FileType cpp set commentstring=//\ %s
autocmd FileType swig set commentstring=//\ %s
autocmd FileType c set commentstring=//\ %s

" VIM-PLUG 
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" PLUGINS 
" Make sure you use single quotes 
" " " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align 
" Plug 'junegunn/vim-easy-align' 
" " " Any valid git URL is allowed 
" Plug 'https://github.com/junegunn/vim-github-dashboard.git' 
" " Initialize plugin system 
call plug#begin('~/.local/share/nvim/site/plugged')
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify', { 'tag': 'legacy' }
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-speeddating', { 'for': [ 'org', 'dotoo' ] }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dhruvasagar/vim-dotoo'
Plug 'easymotion/vim-easymotion'
Plug 'mbbill/undotree'
Plug 'msanders/snipmate.vim'
Plug 'Yggdroot/indentLine'
Plug 'godlygeek/tabular'
Plug 'dhruvasagar/vim-table-mode'
Plug 'bogado/file-line'
Plug 'pechorin/any-jump.vim'
Plug 'gcmt/taboo.vim'
Plug 'wellle/context.vim'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()
" Then reload init.vim and :PlugInstall to install plugins.

" COLORSCHEMES 
" colorscheme Papercolor 
colorscheme gruvbox 
" colorscheme Atelier_SavannaDark
" colorscheme flattened_dark 
" colorscheme solarized 
set bg=dark 
autocmd ColorScheme * highlight TabLineSel ctermfg=Yellow ctermbg=Black

" Timeouts
set notimeout
set ttimeout
set ttimeoutlen=10
set timeoutlen=500

" GENERAL SETTINGS
let mapleader=" "
set ts=2 sts=2 sw=2 expandtab
set ai ci
set nowrap 
set nowb 
set noswapfile 
set nobackup 
set nowritebackup 
set undodir=~/.config/.nvim/undodir 
set undofile 
set scrolloff=8 
set signcolumn=number 
set rnu nu 
set hidden 
set smartcase 
set ignorecase 
set nocompatible 
set wildmenu 
set wildignorecase 
set wildignore=\*.git/\* 
set wildmode=longest:full,full 
set complete=.,w,b,u,t 
set completeopt=longest,menuone 
set foldmethod=syntax foldlevel=10 
set splitbelow splitright 
set nrformats+=alpha 
set lazyredraw 
set showmatch 
set noshowcmd 
set vb 
set t_vb= 
set shortmess=atIsc 
set ru 
set clipboard=unnamed 
set wildchar=<Tab> wildmenu wildmode=full 
set colorcolumn=+1 
set encoding=utf-8 
set guioptions=-e 
set sessionoptions+=tabpages,globals

set laststatus=3
set winbar=%=%m%r\ %{expand('%:t')}
set statusline=%#Search#\ %{expand('%:t')}\ %m%r\ %#DiffChange#\ %{FugitiveStatusline()}\ %#LineNr#%=%<%l,%c%V\ %P\ [%{&ff}]\ %y\ (%{strftime(\"%m/%d\ %H:%M\",getftime(expand(\"%:p\")))})\ 
" DEFAULT STATUSLINE
" set statusline=%f%h%m%r\ [%{&ff}]\ (%{strftime(\"%H:%M\ %d/%m/%Y\",getftime(expand(\"%:p\")))})%=%l,%c%V\ %P

let g:statusline_active = "%#Search#\ %{expand('%:t')}\ %m%r\ %#DiffChange#\ %{FugitiveStatusline()}\ %#LineNr#%=%<%l,%c%V\ %P\ [%{&ff}]\ %y\ (%{strftime(\"%m/%d\ %H:%M\",getftime(expand(\"%:p\")))})\ "
let g:statusline_inactive = "\ %{expand('%:t')}\ %m%r\ %#DiffChange#\ %#LineNr#%=%<%l,%c%V\ %P\ "

augroup statusline
autocmd!
autocmd WinEnter,BufEnter * setlocal statusline=%!statusline_active
autocmd WinLeave,BufLeave * setlocal statusline=%!statusline_inactive
augroup end

syntax enable
filetype plugin on
filetype plugin indent on
autocmd VimEnter * IndentLinesDisable
autocmd InsertEnter * set nornu
autocmd InsertLeave * set rnu

let g:indentLine_defaultGroup = 'SpecialKey'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_fileTypeExclude = ["vimwiki", "help", "undotree", "diff"]
let g:indentLine_bufTypeExclude = ["help", "terminal"]

let g:taboo_tab_format = " %f " 
let g:taboo_renamed_tab_format = " [%l] "

au FocusGained,BufEnter * :checktime
au InsertLeave * silent! set nopaste

let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax
au FileType yaml setlocal foldmethod=indent
au FileType yml setlocal foldmethod=indent
au FileType make setl noexpandtab
au BufNewFile,BufRead *.org set ft=dotoo


if has("persistent_undo") 
  let target_path = expand('~/.config/.nvim/undodir')
  " create the directory and any parent directories 
  " if the location does not exist. 
  if !isdirectory(target_path) 
    call mkdir(target_path, "p", 0700) 
  endif
  let &undodir=target_path 
  set undofile 
endif

" DOTOO
let g:dotoo#agenda#files=['~/org/**/*.org']
let g:dotoo#capture#refile=expand('~/org/refile.org')

" NETRW
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_preview=1

augroup netrw_mappings
  au!
  au filetype netrw call NetrwMappings()
augroup END

" KEY UNMAPPINGS
map <Space>tm <Nop>

" KEY MAPPINGS
nnoremap <silent><C-l> :wincmd l<CR>
nnoremap <silent><C-h> :wincmd h<CR>
nnoremap <silent><C-k> :wincmd k<CR>
nnoremap <silent><C-j> :wincmd j<CR>

" find and list buffers
nnoremap <leader>bf :b<Space>
nnoremap <leader>bl :buffers<CR>
nnoremap <silent>bk :bd<CR>
nnoremap <silent>bs :w!<CR>
nnoremap <silent><leader>cf :let @*=printf('file:%s:%d', expand('%:p') , line('.'))<CR>

" insert date
nnoremap <silent><leader>dt :put =strftime('* %a %Y-%m-%d %H:%M:%S%z')<CR>

nnoremap <silent><leader>dv :Gvdiffsplit<CR>

" fuzzy fuzzy
nnoremap <silent><leader>ff :Files<CR>
nnoremap <silent><leader>fg :GFiles<CR>
nnoremap <silent><leader>ft :Tags<CR>
nnoremap <silent><leader>fb :Buffers<CR>
nnoremap <silent><leader>fh :History<CR>
nnoremap <silent><leader>fc :Commits<CR>
nnoremap <silent><leader>fr :Rg<CR>

" Git binds
nnoremap <silent><leader>gg :G<CR>
nnoremap <silent><leader>gb :G blame<CR>
" git log
nnoremap <silent><leader>gl :GV<CR>
" git log for the current file
nnoremap <silent><leader>gf :GV!<CR>
nnoremap <silent><leader>gp :G push<CR>
" save and add to staging area
nnoremap <silent><leader>gw :Gwrite<CR>

" NERDTREE
nnoremap <silent><leader>nl :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'!',
                \ 'Staged'    :'+',
                \ 'Untracked' :'?',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'𖡄',
                \ }

" Greatest paste remaps ever!!
nnoremap <silent><leader>p :set paste expandtab<CR>
vnoremap <silent><leader>p "_dP

" structure csv(tabularize)
nnoremap <silent><leader>sc :Tabularize /,<CR>
" structure json
nnoremap <silent><leader>sj :%!jq .<CR>
" structure by replacing tabs by 2 spaces
nnoremap <silent><leader>st :%s/\t/  /g<CR>

" following unimpaired.vim's convention
nnoremap <silent>yoz :set rnu! nu! smd! ru!<CR>
nnoremap <silent>you :UndotreeToggle<CR>
nnoremap <silent>yoi :IndentLinesToggle<CR>
nnoremap <silent>yot :TableModeToggle<CR>

" tabs
nnoremap <silent><leader>tc :tabclose<CR>
" mnemonic for factory hence f
nnoremap <silent><leader>tf :TabooReset<CR>
nnoremap <silent><leader>tn :tabnew<CR>
nnoremap <silent><leader>to :tabonly<CR>
nnoremap <leader>tr :TabooRename<Space>
" sends the current pane into a different tab maintaining the pane in the current tab
" <C-w>T does the same thing but does not maintain the pane in the current tab
nnoremap <silent>ts :tab sp<CR>
nmap <silent><S-Tab> :tabprev<CR>
nmap <silent><Tab> :tabnext<CR>

" Reorient windows between vertical and horizontal
nnoremap <silent>tv <C-w>t<C-w>H
nnoremap <silent>th <C-w>t<C-w>K

nnoremap <silent>[wh :resize -5<CR>
nnoremap <silent>]wh :resize +5<CR>

nnoremap <silent>[wv :vertical resize -5<CR>
nnoremap <silent>]wv :vertical resize +5<CR>

" run a command on each line that matches
vnoremap <leader>c <ESC>:'<,'>g//<Left>

" the ultimate find and replace
" to match whole word, surround it with \<word\>
" eg, :s/\<bar\>/baz
vnoremap <leader>r <ESC>:'<,'>s/\%V/gI<Left><Left><Left>

" the ultimate surround
vnoremap <leader>s <ESC>:'<,'>s/\%V\(\w.*\)/"\1"<Left><Left><Left><Left>

" the ultimate find
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" to retain visual selection upon indent/unindent
vnoremap > >gv
vnoremap < <gv

" change every backslash to forward slash and vice-versa in the current line
nnoremap <silent> <Leader>/ :let tmp=@/<Bar>s:\\:/:ge<Bar>let @/=tmp<Bar>noh<CR>
nnoremap <silent> <Leader><Bslash> :let tmp=@/<Bar>s:/:\\:ge<Bar>let @/=tmp<Bar>noh<CR>

" Cycling through buffers
nnoremap <C-n> :execute ":buffer ".(bufnr("%") + 1)<CR>
nnoremap <C-p> :execute ":buffer ".(bufnr("%") - 1)<CR>

" ins-completion
inoremap ^] ^X^]
inoremap ^F ^X^F
inoremap ^D ^X^D
inoremap ^L ^X^L

" presentation mode - source .vimrc to undo
nnoremap <silent><F5> :set nornu nonu nosmd nohid noru signcolumn=no colorcolumn=<CR>

" FUNCTIONS
fun! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"
    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")
    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif
    let @/ = l:pattern
    let @" = l:saved_reg
endfun

fun! NetrwMappings()
  nnoremap <silent><buffer><C-l> :wincmd l<CR>
endfun


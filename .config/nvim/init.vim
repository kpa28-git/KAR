""                            _
"""     ____  ___  ____ _   __(_)___ ___
"""    / __ \/ _ \/ __ \ | / / / __ `__ \
"""   / / / /  __/ /_/ / |/ / / / / / / /
"""  /_/ /_/\___/\____/|___/_/_/ /_/ /_/
""" neovim runtime config file.

syntax on
filetype plugin indent on

""" PLUGIN MANAGER INSTALL (junegunn/vim-plug)
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


""" PLUGINS INSTALL (:PlugClean/:PlugUpgrade/:PlugInstall/:PlugUpdate)
call plug#begin("$HOME/.config/nvim/plugged")

" ********** UI Plugins **********
Plug 'scrooloose/nerdtree'		" Nerdtree sidebar
Plug 'bling/vim-airline'		" Lightweight statusbar
Plug 'bling/vim-bufferline'		" Lightweight bufferbar
Plug 'junegunn/goyo.vim'		" Distraction free writing

" ********** Languages/Syntax **********
Plug 'tpope/vim-commentary'		" Toggle comment/uncomment ('gc')
Plug 'tpope/vim-surround'		" Toggle surrounding parens/brackets/others ('cs<1><2>', 'ds<1>', 'yss<1>', and others)
Plug 'rust-lang/rust.vim'		" Rust lang plugin required by syntastic
Plug 'mboughaba/i3config.vim'		" i3 config syntax

" ********** Autocomplete **********
Plug 'Valloric/YouCompleteMe'		" Autocomplete plugin (requires python-jedi for python)

" ********** Linting **********
Plug 'scrooloose/syntastic'		" Syntax checking plugin for Vim (requires python-jedi for python)

" ********** External Integration **********
Plug 'emakman/nvim-latex-previewer'	" LaTeX Previewer ('<Leader>p' or ':LatexPreviewToggle')
Plug 'jreybert/vimagit'			" Git integration plugin
Plug 'vimwiki/vimwiki'			" Vimwiki notetaking plugin
"Plug 'klen/python-mode'		" Python mode (docs, refactor, lints...)

call plug#end()


""" GENERAL CONFIG
let mapleader=","
set bg=light
set mouse=a
set nohlsearch
set clipboard=unnamedplus
set nocompatible
filetype plugin on
syntax on
set encoding=utf-8
set number relativenumber

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults:
set splitbelow splitright

" Enable standard autocomplete
set wildmode=longest,list,full

" Disable autocomment on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Show all whitespace
autocmd FileType * set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
autocmd FileType * set list

" Force tabs
autocmd FileType * set noexpandtab


""" GENERAL MAPPINGS
" Copy/Paste with ctrl+c/ctrl+p
vnoremap <C-c> "+y
map <C-p> "+P

" Global find/replace alised to 'S'
nnoremap S :%s//g<Left><Left>

" Open my bibliography file in split
map <leader>b :vsp<space>$BIB<CR>
map <leader>r :vsp<space>$REFER<CR>


""" GENERAL BUFFER AUTOCMDs
" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" When shortcut files are updated, renew bash and ranger configs with new material:
autocmd BufWritePost ~/.config/bmdirs,~/.config/bmfiles !shortcuts

" Automatically recompile suckless program configs:
autocmd BufWritePost config.h,config.def.h !sudo make install

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear %


""" NAVIGATION SHORTCUTS
" Buffer navigation with Alt+{h,l}
map <M-l> :bn<cr>
map <M-h> :bp<cr>
map <M-Left> :bn<cr>
map <M-Right> :bp<cr>

" Split window navigation with <Ctrl>+{h,j,k,l}
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <C-Left> <C-w>h
map <C-Down> <C-w>j
map <C-Up> <C-w>k
map <C-Right> <C-w>l


""" PLUGIN CONFIG + KEY MAPS
" ********** UI Plugins **********
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Goyo distraction free plugin
map <leader>f :Goyo \| set bg=light \| set linebreak<CR>

" ********** Autocomplete **********
nmap <leader>g :YcmCompleter GoTo<CR>
nmap <leader>d :YcmCompleter GetDoc<CR>
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 0
let g:ycm_complete_in_strings = 1
let g:ycm_complete_in_comments = 0
let g:ycm_min_num_of_chars_for_completion = 2

" ********** Linting **********
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_error_symbol='X'
let g:syntastic_style_error_symbol='X'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['python']
let g:syntastic_json_checkers = ['jsonval']
let g:syntastic_yaml_checkers = ['pyyaml']

" ********** External Integration **********
nmap <buffer> <leader>p :LatexPreviewToggle<CR>
nmap <buffer> <leader>[ :PrevLatexPreviewMode<CR>
nmap <buffer> <leader>] :NextLatexPreviewMode<CR>

" Compile text document, be it groff/LaTeX/markdown/etc.
map <leader>c :w! \| !txtcompiler <c-r>%<CR>

" Render and preview github-style markdown with python-grip
map <leader>m :!grip<space>%

" <leader>+o(rthography): Spellcheck
map <leader>o :setlocal spell! spelllang=en_us<CR>

" <leader>+s(hellcheck): run file in shellcheck
map <leader>s :!clear && shellcheck %<CR>


""" FILETYPE CONFIG
let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex

" i3config detection
aug i3config_ft_detection
	au!
	au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

" LaTeX
	" Word count:
	autocmd FileType tex map <leader>w :w !detex \| wc -w<CR>
	" Code snippets
	autocmd FileType tex inoremap ,fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
	autocmd FileType tex inoremap ,fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
	autocmd FileType tex inoremap ,exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
	autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
	autocmd FileType tex inoremap ,bf \textbf{}<++><Esc>T{i
	autocmd FileType tex vnoremap , <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
	autocmd FileType tex inoremap ,it \textit{}<++><Esc>T{i
	autocmd FileType tex inoremap ,ct \textcite{}<++><Esc>T{i
	autocmd FileType tex inoremap ,cp \parencite{}<++><Esc>T{i
	autocmd FileType tex inoremap ,glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
	autocmd FileType tex inoremap ,x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
	autocmd FileType tex inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
	autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
	autocmd FileType tex inoremap ,li <Enter>\item<Space>
	autocmd FileType tex inoremap ,ref \ref{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
	autocmd FileType tex inoremap ,ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
	autocmd FileType tex inoremap ,can \cand{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ,con \const{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ,v \vio{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ,a \href{}{<++>}<Space><++><Esc>2T{i
	autocmd FileType tex inoremap ,sc \textsc{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,st <Esc>F{i*<Esc>f}i
	autocmd FileType tex inoremap ,beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
	autocmd FileType tex inoremap ,up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
	autocmd FileType tex nnoremap ,up /usepackage<Enter>o\usepackage{}<Esc>i
	autocmd FileType tex inoremap ,tt \texttt{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,bt {\blindtext}
	autocmd FileType tex inoremap ,nu $\varnothing$
	autocmd FileType tex inoremap ,col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
	autocmd FileType tex inoremap ,rn (\ref{})<++><Esc>F}i

" Tex Bib
	autocmd FileType bib inoremap ,a @article{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>journal<Space>=<Space>{<++>},<Enter>volume<Space>=<Space>{<++>},<Enter>pages<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i
	autocmd FileType bib inoremap ,b @book{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>6kA,<Esc>i
	autocmd FileType bib inoremap ,c @incollection{<Enter>author<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>booktitle<Space>=<Space>{<++>},<Enter>editor<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i

" MARKDOWN
	autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
	autocmd Filetype markdown,rmd inoremap ,n ---<Enter><Enter>
	autocmd Filetype markdown,rmd inoremap ,b ****<++><Esc>F*hi
	autocmd Filetype markdown,rmd inoremap ,s ~~~~<++><Esc>F~hi
	autocmd Filetype markdown,rmd inoremap ,e **<++><Esc>F*i
	autocmd Filetype markdown,rmd inoremap ,h ====<Space><++><Esc>F=hi
	autocmd Filetype markdown,rmd inoremap ,i ![](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ,a [](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ,1 #<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,2 ##<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,3 ###<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,l --------<Enter>
	autocmd Filetype rmd inoremap ,r ```{r}<CR>```<CR><CR><esc>2kO
	autocmd Filetype rmd inoremap ,p ```{python}<CR>```<CR><CR><esc>2kO
	autocmd Filetype rmd inoremap ,c ```<cr>```<cr><cr><esc>2kO

" Python
" Indentation options:
	autocmd FileType python set autoindent
	autocmd FileType python set smartindent

" Bash/POSIX shell


" Rust


" C++



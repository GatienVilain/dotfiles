" ##### Vim Config #####
" Vim configuration using BÉPO french layout
" based on https://learnvim.irian.to/
"
" Author: Gatien Vilain
"

" ======= Options ==========
set nocompatible " Enable Vim-specific features
set hidden " Don’t prompt the message to save the file when switching buffers
set hlsearch incsearch " Highlight all matching phrases while typing
set relativenumber number " Display current and relative line numbers
set mouse=a " Enables mouse support everywhere
set undolevels=1000 "Increase undo deep

" Enable projet’s structural hierarchy
set nocp
filetype plugin on

" Fixe l’encodage en UTF-8
set encoding=utf-8
set fileencoding=utf-8

" Usefull with bépo layout
" Colorier les espaces insécables pour éviter les problèmes dans le code
highlight NbSp ctermbg=lightgray guibg=lightred
match NbSp /\%xa0/

" ====== Mappings =========
let mapleader = " " " map <leader> key to Space

" Tab fait un Esc, Maj+Tab fait un Tab
inoremap <Tab> <Esc>
inoremap &lt;S-Tab> <Tab>
vnoremap <Tab> <Esc>
vnoremap &lt;S-Tab> <Tab>

" Centrer la page sur le curseur avec Entrée en mode normal
noremap <Return> zz

" ======== AutoCMD ========

" Disable highlight for previous search with two Escape
nnoremap <silent> <C-l> :noh<return><esc>

" ======= Glue Code for external tools ======

" Set Ripgrep as the external search tool (need ripgrep install)
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" Open url under the cursor, in visuel mode, into firefox
vmap ,o :<C-U>!firefox "<cfile>" &> /dev/null<CR><CR>

" ===== Plugins=======
" Using Plug installer
" https://github.com/junegunn/vim-plug
"
if ! empty(globpath(&rtp, 'autoload/plug.vim'))
    call plug#begin()

    " Integrate Vim's '+' register with the Wayland system clipboard
    Plug 'jasonccox/vim-wayland-clipboard'
    
    " Bépo layout
    Plug 'michamos/vim-bepo'

    " Plugin to improve netrw
    Plug 'tpope/vim-vinegar'

    " Add theme Catppucin
    "Plug 'catppuccin/vim', { 'as': 'catppuccin' }
    "set termguicolors " Needed to get the expected visuals
    "colorscheme catppuccin_mocha

    " Enable fzf in vim
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    "
    " Map some shortcut to use fzf (need fzf plugin)
    nnoremap <silent> <C-f> :Files<CR>
    "<Leader> mean '\'
    nnoremap <silent> <Leader>b :Buffers<CR>
    nnoremap <silent> <Leader>f :Rg<CR>
    nnoremap <silent> <Leader>/ :BLines<CR>
    nnoremap <silent> <Leader>' :Marks<CR>
    nnoremap <silent> <Leader>g :Commits<CR>
    nnoremap <silent> <Leader>H :Helptags<CR>
    nnoremap <silent> <Leader>hh :History<CR>
    nnoremap <silent> <Leader>h: :History:<CR>
    nnoremap <silent> <Leader>h/ :History/<CR>

    " Create your own text objects
    Plug 'kana/vim-textobj-user'

    " Rainbow brackets
    Plug 'frazrepo/vim-rainbow'

    
    " Lets you to peek into the contents of the registers 
    Plug 'junegunn/vim-peekaboo'

    call plug#end()

else 
    "echo 'INFO: Plug installer not found. Load configuration without plugins'

    " ========== Bépo layout (if plugins can’t be used) ============
    " https://bepo.fr/wiki/Vim#Reconfiguration_totale_des_touches
    "
    " {W} -> [É]
    " ——————————
    " On remappe W sur É :
    noremap é w
    noremap É W
    " Corollaire: on remplace les text objects aw, aW, iw et iW
    " pour effacer/remplacer un mot quand on n’est pas au début (daé / laé).
    onoremap aé aw
    onoremap aÉ aW
    onoremap ié iw
    onoremap iÉ iW
    " Pour faciliter les manipulations de fenêtres, on utilise {W} comme un Ctrl+W :
    noremap w <C-w>
    noremap W <C-w><C-w>
    "
    " [HJKL] -> {CTSR}
    " ————————————————
    " {cr} = « gauche / droite »
    noremap c h
    noremap r l
    " {ts} = « haut / bas »
    noremap t j
    noremap s k
    " {CR} = « haut / bas de l'écran »
    noremap C H
    noremap R L
    " {TS} = « joindre / aide »
    noremap T J
    noremap S K
    " Corollaire : repli suivant / précédent
    noremap zs zj
    noremap zt zk
    "
    " {HJKL} <- [CTSR]
    " ————————————————
    " {J} = « Jusqu'à »            (j = suivant, J = précédant)
    noremap j t
    noremap J T
    " {L} = « Change »             (l = attend un mvt, L = jusqu'à la fin de ligne)
    noremap l c
    noremap L C
    " {H} = « Remplace »           (h = un caractère slt, H = reste en « Remplace »)
    noremap h r
    noremap H R
    " {K} = « Substitue »          (k = caractère, K = ligne)
    noremap k s
    noremap K S
    " Corollaire : correction orthographique
    noremap ]k ]s
    noremap [k [s
    "
    " Désambiguation de {g}
    " —————————————————————
    " ligne écran précédente / suivante (à l'intérieur d'une phrase)
    noremap gs gk
    noremap gt gj
    " onglet précédent / suivant
    noremap gb gT
    noremap gé gt
    " optionnel : {gB} / {gÉ} pour aller au premier / dernier onglet
    noremap gB :exe "silent! tabfirst"<CR>
    noremap gÉ :exe "silent! tablast"<CR>
    " optionnel : {g"} pour aller au début de la ligne écran
    noremap g" g0
    "
    " <> en direct
    " ————————————
    noremap « <
    noremap » >
    "
    " Remaper la gestion des fenêtres
    " ———————————————————————————————
    noremap wt <C-w>j
    noremap ws <C-w>k
    noremap wc <C-w>h
    noremap wr <C-w>l
    noremap wd <C-w>c
    noremap wo <C-w>s
    noremap wp <C-w>o
    noremap w<SPACE> :split<CR>
    noremap w<CR> :vsplit<CR>
    "
    " Remaper Ctrl-C sur l’Échap
    " ——————————————————————————
    inoremap <C-C> <Esc>
    vnoremap <C-C> <Esc>
    "
    " Remaper la command Ex
    " —————————————————————
    if has("autocmd")
    augroup netrw_dvorak_fix
	autocmd!
	autocmd filetype netrw call Fix_netrw_maps_for_dvorak()
    augroup END
    function! Fix_netrw_maps_for_dvorak()
	noremap <buffer> t j
	noremap <buffer> s k
	noremap <buffer> k s
    endfunction
    endif


endif 

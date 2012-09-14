call pathogen#infect()        " pathogen.vim - path option manipulation

set nocompatible              " We're running Vim, not Vi!
syntax on                     " Enable syntax highlighting
filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins

set backspace=2               " Backspace works across lines now

set expandtab                 " Me no like hardtabs (only in Makefiles)
set tabstop=4                 " Me like 4-space indentation
set shiftwidth=4              " ~
set softtabstop=4             " ~
set autoindent
set number                    " show line numbers
set mouse=a                   " enable the mouse

"set colorcolumn=80            " width marker

set dir=~/.vim/swp            " the directory whare swap files will go

let mapleader=","             " defines the actual <Leader>

" solarized madness is on
syntax enable
set background=dark
"colorscheme default
colorscheme darkblue
"colorscheme solarized
"call togglebg#map("<F11>")    " toggles the solarized background

" close html tags plugin on only for html-like sources
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

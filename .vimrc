set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'vim-ruby/vim-ruby'
Bundle 'The-NERD-tree'

syntax on
filetype indent plugin on
autocmd FileType ruby compiler ruby 
autocmd FileType eruby compiler eruby
autocmd FileType rubyunit compiler rubyunit
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby set makeprg=ruby\ %

set shiftwidth=4
set ts=4
set cindent
set ruler
set incsearch	
set hlsearch
set nowrap
set bg=dark
set path+=$NEXUS_DIR/searchcraft/src/include
set path+=$NEXUS_DIR/**
set path+=$LINGUIST_DIR/**
set path+=/usr/include/**
set fdm=marker
set history=100
set shellpipe=2>&1\\|gSTLFilt.pl\ -width:210\\|\ tee
set syntax=eruby
syntax on
au BufNewFile,BufReadPost *.c set cindent ts=4 omnifunc=ccomplete#Complete
au BufNewFile,BufReadPost *.ddl set cindent
au BufNewFile,BufReadPost *.cpp,*.cc,*.h,*.hh set cindent
au BufNewFile,BufReadPost *.tex set autoindent
au BufNewFile,BufReadPost *.java set cindent
au BufNewFile,BufReadPost *.html,*.htm,*.htxt set smartindent
au BufNewFile,BufReadPost *.php,*.ptxt set smartindent
au BufNewFile,BufReadPost *.rb,*.rhtml set smartindent ts=4 sw=4
au BufNewFile,BufReadPost *.lua set smartindent ts=4 sw=4
au BufNewFile,BufReadPost *.log set ft=log

au Syntax rhtml runtime! syntax/eruby.vim

" TagList
nmap <F11> :TlistToggle<cr>

" vim:sw=4:ts=4:smarttab:autoindent:fdm=marker:cms="%s
" nhn_convention:max-column-width=110 notation=NhN
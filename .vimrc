set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
let g:vundle_default_git_proto = 'https'

" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'

" My Bundles here:
Plugin 'kisow/snipmate.vim'
Plugin 'kisow/vim-pgk'

" original repos on github
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'fatih/vim-go'
Plugin 'vim-ruby/vim-ruby'
Plugin 'astashov/vim-ruby-debugger'

" vim-scripts repos
Plugin 'The-NERD-tree'
Plugin 'Conque-GDB'
Plugin 'TagHighlight'
Plugin 'cscope_macros.vim'
Plugin 'Cpp11-Syntax-Support'
Plugin 'xterm-color-table.vim'

call vundle#end()
filetype plugin indent on

set ts=4
set sts=4
set sw=4
set expandtab
set cindent
set ruler
set incsearch	
set hlsearch
set nowrap
set fdm=marker
set bg=dark
set path+=$NEXUS_SRC_DIR/**
set path+=$LINGUIST_DIR/**
set path+=/usr/local/include/**
set path+=/usr/include/**
set history=100
set t_Co=256
set shellpipe=2>&1\\|gSTLFilt.pl\ -width:190\\|\ tee
syntax on
autocmd FileType ruby compiler ruby 
autocmd FileType eruby compiler eruby
autocmd FileType rubyunit compiler rubyunit
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby set makeprg=ruby\ %
au BufNewFile,BufReadPost *.c set cindent ts=4 omnifunc=ccomplete#Complete
au BufNewFile,BufReadPost *.ddl set cindent
au BufNewFile,BufReadPost *.cpp,*.cc,*.h,*.hh,*.hpp set cindent syntax=cpp.doxygen
au BufNewFile,BufReadPost *.dox set syntax=cpp.doxygen
au BufNewFile,BufReadPost *.tex set autoindent
au BufNewFile,BufReadPost *.java set cindent
au BufNewFile,BufReadPost *.html,*.htm,*.htxt set smartindent
au BufNewFile,BufReadPost *.php,*.ptxt set smartindent
au BufNewFile,BufReadPost *.rb,*.rhtml set smartindent ts=4 sw=4
au BufNewFile,BufReadPost *.lua set smartindent ts=4 sw=4
au BufNewFile,BufReadPost *.log set ft=log

au Syntax rhtml runtime! syntax/eruby.vim

" vim:sw=4:ts=4:smarttab:autoindent:fdm=marker:cms="%s
" nhn_convention:max-column-width=110 notation=NhN

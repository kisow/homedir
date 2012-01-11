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
set tenc=utf8
set history=100
set shellpipe=2>&1\\|gSTLFilt.pl\ -width:210\\|\ tee
set asm=0
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

set syntax=eruby
au Syntax rhtml runtime! syntax/eruby.vim
au BufNewFile,BufReadPost *.scs so ${NEXUS_DIR}/share/scs.vim

helptags ~/.vim/doc

" TagList
nmap <F11> :TlistToggle<cr>

" CheckDiff"{{{
nmap gt :call CheckDiff()<cr>
function! CheckDiff()
	let diff_file = matchstr(getline("."), '\S\+\.diff')

	if diff_file =~ '.*\.diff'
		let diff_header = readfile(diff_file, '', 1024)
		let ptn = '--- [^:]\+: .\(\/\S\+\)\S\S'
		let out = matchlist(diff_header, ptn)

		" ntest diff format
		if empty(out) != 1
			let orgfile = out[1] . ".tmp"
			let ptn = '+++ [^:]\+: .\(\/\S\+\)\S\S'
			let out = matchlist(diff_header, ptn)
			let newfile = out[1] . ".tmp"
		else
			" (unified) diff format 
			let ptn = '--- \(\/\S\+\)'
			let out = matchlist(diff_header, ptn)

			if empty(out) != 1
				let orgfile = out[1]
				let ptn = '+++ \(\/\S\+\)'
				let out = matchlist(diff_header, ptn)
				let newfile = out[1]
			else
				echo "unknown diff format!"
				return
			endif
		endif
		exe "edit " . newfile
		exe "vert diffsplit " . orgfile
	else
		echo "this is NOT a diff_file"
	endif
endfunction
"}}}

" vim:sw=4:ts=4:smarttab:autoindent:enc=utf8:fdm=marker:cms="%s
" nhn_convention:max-column-width=110 notation=NhN

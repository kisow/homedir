" Mappings example for use with gdb
" Maintainer:	<xdegaye at users dot sourceforge dot net>
" Last Change:	Mar 6 2006

if ! has("gdb")
    finish
endif

nmap <F10> :bel 50vs gdb-variables<cr><C-W>p

let s:gdb_k = 1
nmap <F12> :call <SID>Toggle()<CR>


" Toggle between vim default and custom mappings
function! s:Toggle()
    if s:gdb_k
	let s:gdb_k = 0

	map <Space> :call gdb("")<CR>
	nmap <silent> <C-Z> :call gdb("\032")<CR>

	nmap <silent> B :call gdb("info breakpoints")<CR>
	nmap <silent> L :call gdb("info locals")<CR>
	nmap <silent> A :call gdb("info args")<CR>
	nmap <silent> s :call gdb("step")<CR>
	nmap <silent> S :call gdb("stepi")<CR>
	nmap <silent> n :call gdb("next")<CR>
	nmap <silent> N :call gdb("nexti")<CR>
	nmap <silent> f :call gdb("finish")<CR>
	nmap <silent> r :call gdb("run")<CR>
	nmap <silent> R :call gdb("run " . getline("."))<CR>
	nmap <silent> q :call gdb("quit")<CR>
	nmap <silent> c :call gdb("continue")<CR>
	nmap <silent> w :call gdb("where")<CR>
	nmap <silent> <F6> :call gdb("up")<CR>
	nmap <silent> <F5> :call gdb("down")<CR>
	nmap <silent> <F4> :call gdb("set follow-fork-mode parent")<CR>
	nmap <silent> <F3> :call gdb("set follow-fork-mode child")<CR>
	nmap <silent> <F9> :call gdb("set print pretty")<CR>

	" set/clear bp at current line
	nmap <silent> b :call <SID>Breakpoint("break")<CR>
	nmap <silent> e :call <SID>Breakpoint("clear")<CR>
	nmap <silent> u :call <SID>Breakpoint("until")<CR>

	" print value at cursor
	nmap <silent> p :call gdb("print " . expand("<cword>"))<CR>

	" print string at cursor
	nmap <silent> t :call gdb("printf \"%s\\n\", " . expand("<cword>") . ".c_str()")<CR>

	" print string at cursor
	nmap <silent> T :call gdb("printf \"%s\\n\", (const char*) " . expand("<cword>") . "")<CR>

	" display Visual selected string
	vmap <silent> t y:call gdb("printf \"%s\\n\", (const char*) " . "<C-R>" . ".c_str()")<CR>

	" display Visual selected string
	vmap <silent> T y:call gdb("printf \"%s\\n\", (const char*) " . "<C-R>"")<CR>

	" display Visual selected expression
	vmap <silent> p y:call gdb("createvar " . "<C-R>"")<CR>

	" print value referenced by word at cursor
	nmap <silent> P :call gdb("print *" . expand("<cword>"))<CR>

	echohl ErrorMsg
	echo "gdb keys mapped"
	echohl None

    " Restore vim defaults
    else
	let s:gdb_k = 1
	nunmap <Space>
	nunmap <C-Z>

	nunmap B
	nunmap L
	nunmap A
	nunmap s
	nunmap S
	nunmap n
	nunmap N
	nunmap f
	nunmap r
	nunmap R
	nunmap q
	nunmap c
	nunmap w
	nunmap <F6>
	nunmap <F5>
	nunmap <F4>
	nunmap <F3>

	nunmap b
	nunmap e
	nunmap p
	nunmap P
	nunmap t
	nunmap T
	nunmap u

	echohl ErrorMsg
	echo "gdb keys reset to default"
	echohl None
    endif
endfunction

" Run cmd on the current line in assembly or symbolic source code
" parameter cmd may be 'break' or 'clear'
function! s:Breakpoint(cmd)
    " An asm buffer (a 'nofile')
    if &buftype == "nofile"
	" line start with address 0xhhhh...
	let s = substitute(getline("."), "^\\s*\\(0x\\x\\+\\).*$", "*\\1", "")
	if s != "*"
	    call gdb(a:cmd . " " . s)
	endif
    " A source file
    else
	let s = "\"" . fnamemodify(expand("%"), ":p") . ":" . line(".") . "\""
	call gdb(a:cmd . " " . s)
    endif
endfunction

" map vimGdb keys
" call s:Toggle()


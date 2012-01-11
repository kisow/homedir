" Vim syntax file
" Language: ntest log
" Author:  Jae Hoon Kim <kisow@nhncorp.com>
" Last Change: May, 31, 2011

" Setup {{{
" React to possibly already-defined syntax.
" For version 5.x: Clear all syntax items unconditionally
" For version 6.x: Quit when a syntax file was already loaded
"if version >= 600
"  if exists("b:current_syntax")
"    finish
"  endif
"else
"  syntax clear
"endif
syntax clear

" }}}
" Base constructs {{{
" syn match scsComment "^\s*#.*$" contains=scsFixme
"syn match ntestPath "\(\s\|=\)" transparent
syn match ntestPath "\/home1\/\S\+" display
syn match ntestPass "\[PASS\]" display
syn match ntestFail "\[FAIL\]" display

" Define Folding..
" }}}
" Define the default highlighting {{{
" For version 5.7 and earlier: Only when not done already
" For version 5.8 and later: Only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_scs_syntax_inits")
  if version < 508
    let did_scs_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
"    command -nargs=+ HiLink hi link <args>
  endif

  HiLink ntestPath         		Underlined
  HiLink ntestPass				Type
  HiLink ntestFail				Error

  delcommand HiLink
endif
" }}}
let b:current_syntax = "log"

" Vim syntax file
" Language:	    RSL
" Maintainer:   Nickolay Kudasov
" File Types:	.rsl

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn match   rslSpecialChar  contained "\\\([0-9]\+\|o[0-7]\+\|x[0-9a-fA-F]\+\|[\"\\'&\\abfnrtv]\|^[A-Z^_\[\\\]]\)"
syn region  rslString       start=+"+  skip=+\\\\\|\\"+  end=+"+ contains=rslSpecialChar

syn match   rslContainer    "[a-zA-Z_][0-9a-zA-Z_]*-\(inf\)\?\(set\|list\)"
syn region  rslComment      start=+\/\*+ end=+\*\/+

syn keyword rslBaseType     Bool Int Nat Real Char Text Unit
syn keyword rslValue        chaos true false

syn keyword rslFunction     abs real int isin hd tl card length
syn keyword rslFunction     union inter len elems inds dom rng

syn keyword rslKeyword      if then elsif else end while
syn keyword rslKeyword      all exists exists!
syn keyword rslKeyword      is as scheme class
syn keyword rslKeyword      type value axiom variable
syn keyword rslKeyword      let in post pre
syn keyword rslKeyword      write read
syn keyword rslKeyword      local for do

if version >= 508 || !exists("did_rsl_syntax_inits")
  if version < 508
    let did_rsl_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink rslString          String
  HiLink rslSpecialChar     SpecialChar

  HiLink rslContainer       Type
  HiLink rslBaseType        Type

  HiLink rslFunction        Function
  HiLink rslValue           SpecialChar
  HiLink rslKeyword         Keyword

  HiLink rslComment         Comment

  delcommand HiLink
endif

let b:current_syntax = "rsl"


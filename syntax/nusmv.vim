" Vim syntax file
" Language:    NuSMV
" Maintainer:  Wannes Meert <wannes.meert@cs.kuleuven.be>
" Last Change: 2010 07 18
" Url:         http://nusmv.irst.itc.it/

if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

" Case sensitive
syn case match

syn cluster nusmvNotContained contains=nusmvTodo

" Comments
syn region	nusmvComment		start="--" end="$" contains=nusmvTodo
syn keyword	nusmvTodo			contained TODO FIXME XXX

" Module
syn region	nusmvModule			transparent matchgroup=nusmvModuleKeyword start="^\s*MODULE " end="\(MODULE\)\@=" contains=ALLBUT,@nusmvNotContained

" Identifiers
syn match	nusmvVariable		"\<[a-zA-Z_][a-zA-Z0-9_$#\\-]*\>" contained
syn match	nusmvValue			"\(TRUE\|FALSE\|\d+\)"

" Keywords
syn keyword	nusmvSectionKeyword	VAR ASSIGN FAIRNESS TRANS INIT DEFINE CONSTANTS IVAR INVAR SPEC CTLSPEC LTLSPEC PSLSPEC COMPUTE INVARSPEC JUSTICE COMPASSION ISA CONSTRAINT SIMPWFF CTLWFF LTLWFF PSLWFF COMPWFF
syn keyword nusmvStorageKeyword	boolean array of integer real word word1 bool
syn keyword nusmvControlKeyword	process case esac self

" Operators
syn keyword nusmvOperator		init next EX AX EF AF EG AG E F O G H X Y Z A U S V T BU EBF ABF ABG
syn match	NusmvOperator		":-" contained
syn match	NusmvOperator		"<-" contained



hi def link nusmvComment	Comment
hi def link nusmvTodo		Todo
hi def link nusmvVariable	Constant
hi def link nusmvValue		Number

hi def link nusmvModuleKeyword	Special
hi def link nusmvSectionKeyword	Special
hi def link nusmvStorageKeyword	Special
hi def link nusmvControlKeyword	Special

hi def link nusmvOperator	Operator

let b:current_syntax = "nusvm"


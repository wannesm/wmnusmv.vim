" WMNuSMV.vim plugin
" Author:  Wannes Meert
" Email:   wannes.meert@cs.kuleuven.be
" Version: 0.1

if exists('s:loaded')
	finish
endif
let s:loaded = 1

" ...

" Comments
set commentstring=--%s

" Cmd-B
"unmap <D-b>
"map <D-b> :!NuSMV %
setl makeprg=NuSMV\ %
setl errorformat=file\ %f:\ line\ %l:\ %m


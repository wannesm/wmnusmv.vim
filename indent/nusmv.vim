if exists('b:did_indent') | finish | endif
let b:did_indent = 1

setlocal nolisp
setlocal autoindent

setlocal indentexpr=NusmvIndent(v:lnum)
setlocal indentkeys+=;,=case,=esac,=VAR,=ASSIGN,=FAIRNESS,=TRANS,=INIT,=DEFINE,=CONSTANTS,=IVAR,=INVAR,=SPEC,=CTLSPEC,=LTLSPEC,=PSLSPEC,=COMPUTE,=INVARSPEC,=JUSTICE,=COMPASSION,=ISA,=CONSTRAINT,=SIMPWFF,=CTLWFF,=LTLWFF,=PSLWFF,=COMPWFF,=FROZENVAR

if exists("*NusmvIndent") | finish | endif

function s:startsModule(line)
    return a:line =~# '^\s*MODULE '
endfunction

function s:hasSectionKeyword(line)
    return a:line =~# '\<\(VAR\|ASSIGN\|FAIRNESS\|TRANS\|INIT\|DEFINE\|CONSTANTS\|IVAR\|INVAR\|SPEC\|CTLSPEC\|LTLSPEC\|PSLSPEC\|COMPUTE\|INVARSPEC\|JUSTICE\|COMPASSION\|ISA\|CONSTRAINT\|SIMPWFF\|CTLWFF\|LTLWFF\|PSLWFF\|COMPWFF\|FROZENVAR\)\>'
endfunction

function s:getPreviousNotEmptyLineNr(lnum)
    let lnum = a:lnum - 1
    while lnum > 0
        if !(getline(lnum) =~ '^\s*$')
            return lnum
        endif
        let lnum = lnum - 1
    endwhile
    return 0
endfunction

function s:hasCaseKeyword(line)
    return a:line =~# '\<case\>'
endfunction

function s:isCaseEsacStatement(line)
    return a:line =~# '^.*\:[^=-\:].*;'
endfunction

function NusmvIndent(lnum)
    let curr_line = getline(a:lnum)
    if s:startsModule(curr_line)
        return 0
    endif
    if s:hasSectionKeyword(curr_line)
        return 0
    endif

    let prev_line_nr = s:getPreviousNotEmptyLineNr(a:lnum)
    let prev_line = getline(prev_line_nr)
    if prev_line != ''
        let i = indent(prev_line_nr)
        if s:hasSectionKeyword(prev_line)
            return i + 4
        endif
        if s:hasCaseKeyword(prev_line) && s:isCaseEsacStatement(curr_line)
            let i += 4
        endif
        if s:isCaseEsacStatement(prev_line) && !s:isCaseEsacStatement(curr_line)
            let i -= 4
        endif
        return i
    endif
    return -1
endfunction

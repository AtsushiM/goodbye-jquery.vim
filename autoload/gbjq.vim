"AUTHOR:   Atsushi Mizoue <asionfb@gmail.com>
"WEBSITE:  https://github.com/AtsushiM/goodbye-jquery.vim
"VERSION:  0.1
"LICENSE:  MIT

function! gbjq#check()
    let now_no = 1
    let last_no = line('$') + 1
    let errors = []
    let filename = expand('%:p')

    while now_no < last_no
        let e = getline(now_no)
        let line = matchlist(e, '\v\/\/goodbye jQuery\.')

        if line == []
            let line = matchlist(e, '\vjQuery')

            if line != []
                let type = 'Notice'
                call add(errors, gbjq#errorline(filename, now_no, type, 'maybe jQuery.'))
            endif

            let line = matchlist(e, '\v\$\(')

            if line != []
                let type = 'Notice'
                call add(errors, gbjq#errorline(filename, now_no, type, 'maybe jQuery selector. replace "document.querySelector()" or "document.querySelectorAll()".'))
            endif

            let line = matchlist(e, '\v\.('.join(g:goodbye_jquery_method_names, '|').')\(')

            if line != []
                let type = 'Notice'
                call add(errors, gbjq#errorline(filename, now_no, type, 'maybe "jQuery.'.line[1].'()". '.g:goodbye_jquery_method_hint[line[1]]))
            endif

        endif

        let now_no = now_no + 1
    endwhile

    setlocal errorformat=%f:%l:%m
    cgetexpr join(errors, "\n")
    copen
endfunction

function! gbjq#errorline(file, line, type, txt)
    return a:file.':'.a:line.':[ '.a:type.' ] '.a:txt
endfunction

function! gbjq#ignore()
    call setline('.', getline('.').' //goodbye jQuery.')
endfunction
function! gbjq#remember()
    call setline('.', join(split(getline('.'), ' //goodbye jQuery.'), ''))
endfunction

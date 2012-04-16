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

            let line = matchlist(e, '\v(\$|jQuery)[^_].*')

            if line != []
                let type = 'Notice'
                call add(errors, filename.':'.now_no.':['.type.'] '.'use jQuery selector. After correction, please change "$" => "$_"')
            endif

            let line = matchlist(e, '\v\.('.join(g:goodbye_jquery_method_names, '|').')\(')

            if line != []
                let type = 'Notice'
                call add(errors, filename.':'.now_no.':['.type.'] '.'use jQuery method "'.line[1].'". '.g:goodbye_jquery_method_hint[line[1]])
            endif

        endif

        let now_no = now_no + 1
    endwhile

    setlocal errorformat=%f:%l:%m
    cgetexpr join(errors, "\n")
    copen
endfunction

function! gbjq#ignore()
    call setline('.', getline('.').' //goodbye jQuery.')
endfunction
function! gbjq#remember()
    call setline('.', join(split(getline('.'), ' //goodbye jQuery.'), ''))
endfunction

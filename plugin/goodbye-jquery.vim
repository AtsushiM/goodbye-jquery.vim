"AUTHOR:   Atsushi Mizoue <asionfb@gmail.com>
"WEBSITE:  https://github.com/AtsushiM/goodbye-jquery.vim
"VERSION:  0.1
"LICENSE:  MIT

" $I_XXXX : idセレクタ
" $C_XXXX : classセレクタ
" $T_XXXX : タグセレクタ
"
" TODO: 変更した行にコメントを付ける（検索用）

function! GBJQ()
    let line_no = 1
    let line_end = line('w$')
    let now_no = 1

    while now_no <= line_end
        let line = matchlist(getline(now_no), '\v^(.{-})(\$I_.{-})(\..{-})\((.{-})\)\s*[;{]$')
        let ret = ''

        if line != []
            if line[3] == '.html'
                call setline(now_no, GB_html(line))
                let ret = GB_html(line)
            elseif line[3] == '.attr'
                let ret = GB_attr(line)
            elseif line[3] == '.css'
                let ret = GB_css(line)
            elseif line[3] == '.val'
                let ret = GB_val(line)
            elseif line[3] == '.click'
                let ret = GB_click(line)
            endif
        endif

        if ret != ''
            call setline(now_no, ret)
        endif

        let now_no = now_no + 1
    endwhile

endfunction

function! GB_html(ary)
    let ary = a:ary
    let ret = ary[1].ary[2].'[0]'.'.innerHTML'

    if ary[4] != ''
        let ret = ret.' = '.ary[4]
    endif

    let ret = ret.';'

    return ret
endfunction

function! GB_attr(ary)
    " TODO check
    let ary = a:ary
    let ret = ary[1].ary[2].'[0]'

    if ary[4] != ''
        let at = matchlist(ary[4], '\v(.{-})\s{-},\s*(.*)')

        if at != []
            let ret = ret.'['.at[1].']'.' = '.at[2]
        else
            let ret = ret.'['.ary[4].']'
        endif
    endif

    let ret = ret.';'

    return ret
endfunction

function! GB_css(ary)
    " TODO cammelcase,check

    let ary = a:ary
    let ret = ary[1].ary[2].'[0].value'

    if ary[4] != ''
        let at = GB_comma_split(ary[4])

        if at != []
            let ret = ret.'['.at[1].']'.' = '.at[2]
        else
            let ret = ret.'['.ary[4].']'
        endif
    endif

    let ret = ret.';'

    return ret
endfunction

function! GB_val(ary)
    let ary = a:ary
    let ret = ary[1].ary[2].'[0]'.'.value'

    if ary[4] != ''
        let ret = ret.' = '.ary[4]
    endif

    let ret = ret.';'

    return ret
endfunction

function! GB_click(ary)
    let ary = a:ary
    let ret = ary[1].ary[2].'[0]'.'.onclick = ('.ary[4].') {'

    echo ary

    return ret
endfunction

function! GB_comma_split(str)
    return matchlist(a:str, '\v(.{-})\s{-},\s*(.*)')
endfunction

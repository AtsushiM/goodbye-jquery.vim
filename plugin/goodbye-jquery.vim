"AUTHOR:   Atsushi Mizoue <asionfb@gmail.com>
"WEBSITE:  https://github.com/AtsushiM/goodbye-jquery.vim
"VERSION:  0.1
"LICENSE:  MIT

if exists("g:loaded_goodbye_jquery")
    finish
endif
let g:loaded_goodbye_jquery = 1

let s:save_cpo = &cpo
set cpo&vim

command! GBJQ call gbjq#check()
command! GBJQIgnore call gbjq#ignore()
command! GBJQRemember call gbjq#remember()

let &cpo = s:save_cpo

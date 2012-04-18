"AUTHOR:   Atsushi Mizoue <asionfb@gmail.com>
"WEBSITE:  https://github.com/AtsushiM/goodbye-jquery.vim
"VERSION:  0.1
"LICENSE:  MIT

let s:save_cpo = &cpo
set cpo&vim

if !exists('g:goodbye_jquery_method_hint')
let g:goodbye_jquery_method_hint = {
            \'add':'',
            \'addClass':'replace "elm.className".',
            \'after':'replace "elm.appendChild" or "elm.insertBefore".',
            \'ajax':'replace "XMLHttpRequest()".',
            \'ajaxComplete':'',
            \'ajaxError':'',
            \'ajaxPrefilter':'',
            \'ajaxSend':'',
            \'ajaxSetup':'',
            \'ajaxStart':'',
            \'ajaxStop':'',
            \'ajaxSuccess':'',
            \'andSelf':'',
            \'animate':'',
            \'append':'replace "elm.appendChild()" or "elm.insertBefore()".',
            \'appendTo':'replace "elm.appendChild()" or "elm.insertBefore()".',
            \'attr':'',
            \'before':'replace "elm.appendChild()" or "elm.insertBefore()".',
            \'bind':'',
            \'blur':'',
            \'Callbacks':'',
            \'disable':'replace "elm.disable".',
            \'empty':'replace "elm.innerHTML = null".',
            \'fire':'',
            \'fired':'',
            \'fireWith':'',
            \'lock':'',
            \'locked':'',
            \'remove':'',
            \'change':'replace "elm.onchange = function(){}".',
            \'children':'',
            \'clearQueue':'',
            \'click':'replace "elm.onclick = function(){}".',
            \'clone':'',
            \'closest':'',
            \'contains':'',
            \'contents':'',
            \'css':'replace "elm.style".',
            \'data':'',
            \'dblclick':'',
            \'always':'',
            \'done':'',
            \'fail':'',
            \'isRejected':'',
            \'isResolved':'',
            \'notify':'',
            \'notifyWith':'',
            \'pipe':'',
            \'progress':'',
            \'promise':'',
            \'reject':'',
            \'rejectWith':'',
            \'resolve':'',
            \'resolveWith':'',
            \'state':'',
            \'then':'',
            \'delay':'replace "setTimeout(function(){}, time)".',
            \'delegate':'',
            \'dequeue':'',
            \'detach':'',
            \'die':'',
            \'each':'replace "for(){}".',
            \'end':'',
            \'eq':'',
            \'error':'',
            \'isDefaultPrevented':'',
            \'isImmediatePropagationStopped':'',
            \'isPropagationStopped':'',
            \'preventDefault':'',
            \'stopImmediatePropagation':'',
            \'stopPropagation':'',
            \'extend':'',
            \'fadeIn':'',
            \'fadeOut':'',
            \'fadeTo':'',
            \'fadeToggle':'',
            \'filter':'',
            \'find':'replace "document.querySelector()" or "document.querySelectorAll()".',
            \'first':'',
            \'focus':'',
            \'focusin':'',
            \'focusout':'',
            \'get':'',
            \'getJSON':'',
            \'getScript':'',
            \'globalEval':'',
            \'grep':'',
            \'hasClass':'replace "elm.className".',
            \'hasData':'',
            \'height':'replace "elm.style.height".',
            \'hide':'replace "elm.style.display = '."'".'none'."'".'".',
            \'holdReady':'',
            \'hover':'',
            \'html':'replace "elm.innerHTML".',
            \'inArray':'',
            \'index':'',
            \'innerHeight':'replace "elm.style.height + elm.style.paddingTop + elm.style.paddingBottom".',
            \'innerWidth':'replace "elm.style.width + elm.style.paddingRight + elm.style.paddingLeft".',
            \'insertAfter':'replace "elm.appendChild()" or "elm.insertBefore()".',
            \'insertBefore':'replace "elm.appendChild()" or "elm.insertBefore()".',
            \'is':'',
            \'isArray':'',
            \'isEmptyObject':'',
            \'isFunction':'',
            \'isNumeric':'',
            \'isPlainObject':'',
            \'isWindow':'',
            \'isXMLDoc':'',
            \'keydown':'replace "onkeydown = function(){}".',
            \'keypress':'replace "onkeypress = function(){}".',
            \'keyup':'replace "onkeyup = function(){}".',
            \'last':'replace "document.querySelector()".',
            \'live':'',
            \'load':'replace "XMLHttpRequest()".',
            \'makeArray':'',
            \'map':'replace "for(){}".',
            \'merge':'replace "array.concat()".',
            \'mousedown':'replace "onmousedown = function(){}".',
            \'mouseenter':'replace "onmouseover = function(){}".',
            \'mouseleave':'replace "onmouseout = function(){}".',
            \'mousemove':'replace "onmousemove = function(){}".',
            \'mouseout':'replace "onmouseout = function(){}".',
            \'mouseover':'replace "onmouseover = function(){}".',
            \'mouseup':'replace "onmouseup = function(){}".',
            \'next':'',
            \'nextAll':'',
            \'nextUntil':'',
            \'noConflict':'',
            \'noop':'replace "function(){}".',
            \'not':'replace "elm.remove(elm)".',
            \'now':'replace "new Date().getTime()".',
            \'off':'',
            \'offset':'replace "elm.offsetTop or elm.offsetLeft".',
            \'offsetParent':'',
            \'on':'',
            \'one':'',
            \'outerHeight':'replace "elm.style.height + elm.borderTop + elm.borderBottom + elm.paddingTop + elm.paddingBottom".',
            \'outerWidth':'replace "elm.style.width + elm.borderRight + elm.borderLeft + elm.paddingRight + elm.paddingLeft".',
            \'param':'',
            \'parent':'replace "elm.parentNode".',
            \'parents':'',
            \'parentsUntil':'',
            \'parseXML':'',
            \'position':'',
            \'post':'',
            \'prepend':'',
            \'prependTo':'',
            \'prev':'',
            \'prevAll':'',
            \'prevUntil':'',
            \'prop':'',
            \'proxy':'',
            \'pushStack':'',
            \'queue':'',
            \'ready':'',
            \'removeAttr':'',
            \'removeClass':'replace "elm.className".',
            \'removeData':'',
            \'removeProp':'',
            \'replaceAll':'',
            \'replaceWith':'',
            \'resize':'replace "window.onresize = function(){}".',
            \'scroll':'replace "elm.onscroll = function(){}".',
            \'scrollLeft':'',
            \'scrollTop':'',
            \'select':'',
            \'serialize':'',
            \'serializeArray':'',
            \'show':'replace "elm.style.display = '."'".'block'."'".'".',
            \'siblings':'',
            \'size':'',
            \'slice':'',
            \'slideDown':'',
            \'slideToggle':'',
            \'slideUp':'',
            \'stop':'',
            \'sub':'',
            \'submit':'replace "elm.submit()".',
            \'text':'replace "elm.innerText".',
            \'toArray':'',
            \'toggle':'',
            \'toggleClass':'',
            \'trigger':'',
            \'triggerHandler':'',
            \'trim':'',
            \'type':'',
            \'unbind':'',
            \'undelegate':'',
            \'unique':'',
            \'unload':'',
            \'unwrap':'',
            \'val':'replace "elm.value".',
            \'when':'',
            \'width':'replace "elm.style.width".',
            \'wrap':'',
            \'wrapAll':'',
            \'wrapInner':'',
            \'tmpl':'',
            \'tmplItem':'',
            \'link':'',
            \'template':'',
            \'unlink':''
            \}
endif

let s:goodbye_jquery_method_names = []
for [name, exp] in items(g:goodbye_jquery_method_hint)
    call add(s:goodbye_jquery_method_names, name)
endfor

function! gbjq#check()
    let now_no = 1
    let last_no = line('$') + 1
    let errors = []
    let filename = expand('%:p')

    while now_no < last_no
        let e = getline(now_no)
        let line = matchlist(e, '\v\/\/goodbye jQuery\.')

        if line == []
            let o = e
            let type = 'Notice'

            let e = o
            let end = 0
            while end != 1
                let line = matchlist(e, '\v(.{-}jQuery)(.*)')

                if line != []
                    call add(errors, gbjq#errorline(filename, now_no, type, 'maybe jQuery.'))
                    let e = line[2]
                else
                    let end = 1
                endif
            endwhile

            let e = o
            let end = 0
            while end != 1
                let line = matchlist(e, '\v(.{-}\$)\((.*)')

                if line != []
                    call add(errors, gbjq#errorline(filename, now_no, type, 'maybe jQuery selector. replace "document.querySelector()" or "document.querySelectorAll()".'))
                    let e = line[2]
                else
                    let end = 1
                endif
            endwhile

            let e = o
            let end = 0
            while end != 1
                let line = matchlist(e, '\v\C\.('.join(s:goodbye_jquery_method_names, '|').')\((.*)')

                if line != []
                    call add(errors, gbjq#errorline(filename, now_no, type, 'maybe "jQuery.'.line[1].'()". '.g:goodbye_jquery_method_hint[line[1]]))
                    let e = line[2]
                else
                    let end = 1
                endif
            endwhile

        endif

        let now_no = now_no + 1
    endwhile

    if len(errors) != 0
        setlocal errorformat=%f:%l:%m
        cgetexpr join(errors, "\n")
        copen
    else
        cclose
        echo 'goodbye jQuery!'
    endif
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

let &cpo = s:save_cpo

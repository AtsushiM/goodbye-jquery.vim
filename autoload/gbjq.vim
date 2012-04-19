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
            \'andSelf':'replace "document.querySelector()" or "document.querySelectorAll()".',
            \'animate':'repalce CSS3 trasition or "setTimeout()" animation.',
            \'append':'replace "elm.appendChild()" or "elm.insertBefore()".',
            \'appendTo':'replace "elm.appendChild()" or "elm.insertBefore()".',
            \'attr':'',
            \'before':'replace "elm.appendChild()" or "elm.insertBefore()".',
            \'bind':'',
            \'blur':'replace "elm.onblur = function(){}".',
            \'Callbacks':'',
            \'disable':'replace "elm.disable".',
            \'empty':'replace "elm.innerHTML = null".',
            \'fire':'',
            \'fired':'',
            \'fireWith':'',
            \'lock':'',
            \'locked':'',
            \'remove':'replace "elm.parentNode.removeChild(elm)".',
            \'change':'replace "elm.onchange = function(){}".',
            \'children':'replace "document.querySelector()" or "document.querySelectorAll()".',
            \'clearQueue':'',
            \'click':'replace "elm.onclick = function(){}".',
            \'clone':'',
            \'closest':'replace "document.querySelector()" or "document.querySelectorAll()".',
            \'contains':'',
            \'contents':'',
            \'css':'replace "elm.style".',
            \'data':'',
            \'dblclick':'replace "elm.onclick = function(){}".',
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
            \'detach':'replace "elm.parentNode.removeChild(elm)".',
            \'die':'',
            \'each':'replace "for(){}".',
            \'end':'',
            \'eq':'replace "document.querySelector()" or "document.querySelectorAll()".',
            \'error':'replace "elm.onerror = function(){}".',
            \'isDefaultPrevented':'replace "event.preventDefault()".',
            \'isImmediatePropagationStopped':'replace "event.stopImmediatePropagation()".',
            \'isPropagationStopped':'replace "event.stopPropagation()".',
            \'preventDefault':'replace "event.preventDefault()".',
            \'stopImmediatePropagation':'replace "event.stopImmediatePropagation()".',
            \'stopPropagation':'replace "event.stopPropagation()".',
            \'extend':'',
            \'fadeIn':'repalce CSS3 trasition or "setTimeout()" animation.',
            \'fadeOut':'repalce CSS3 trasition or "setTimeout()" animation.',
            \'fadeTo':'repalce CSS3 trasition or "setTimeout()" animation.',
            \'fadeToggle':'repalce CSS3 trasition or "setTimeout()" animation.',
            \'filter':'',
            \'find':'replace "document.querySelector()" or "document.querySelectorAll()".',
            \'first':'replace "document.querySelector()" or "document.querySelectorAll()".',
            \'focus':'replace "elm.focus()".',
            \'focusin':'',
            \'focusout':'',
            \'get':'replace "XMLHttpRequest()".',
            \'getJSON':'replace "XMLHttpRequest()".',
            \'getScript':'replace "document.body.appendChild(script)".',
            \'globalEval':'replace "eval()".',
            \'grep':'',
            \'hasClass':'replace "elm.className".',
            \'hasData':'',
            \'height':'replace "elm.style.height".',
            \'hide':'replace "elm.style.display = '."'".'none'."'".'".',
            \'holdReady':'',
            \'hover':'replace "elm.onmouseover = function(){}" and "elm.onmouseout = function(){}".',
            \'html':'replace "elm.innerHTML".',
            \'inArray':'',
            \'index':'',
            \'innerHeight':'replace "elm.style.height + elm.style.paddingTop + elm.style.paddingBottom".',
            \'innerWidth':'replace "elm.style.width + elm.style.paddingRight + elm.style.paddingLeft".',
            \'insertAfter':'replace "elm.appendChild()" or "elm.insertBefore()".',
            \'insertBefore':'replace "elm.appendChild()" or "elm.insertBefore()".',
            \'is':'replace "document.querySelector()" or "document.querySelectorAll()".',
            \'isArray':'replace "Object.prototype.toString.call()" or "typeof()".',
            \'isEmptyObject':'replace "Object.prototype.toString.call()" or "typeof()".',
            \'isFunction':'replace "Object.prototype.toString.call()" or "typeof()".',
            \'isNumeric':'replace "Object.prototype.toString.call()" or "typeof()".',
            \'isPlainObject':'replace "Object.prototype.toString.call()" or "typeof()".',
            \'isWindow':'replace "Object.prototype.toString.call()" or "typeof()".',
            \'isXMLDoc':'replace "Object.prototype.toString.call()" or "typeof()".',
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
            \'next':'replace "document.querySelector()".',
            \'nextAll':'replace "document.querySelectorAll()".',
            \'nextUntil':'replace "document.querySelectorAll()".',
            \'noConflict':'',
            \'noop':'replace "function(){}".',
            \'not':'replace "elm.remove(elm)".',
            \'now':'replace "new Date().getTime()".',
            \'off':'',
            \'offset':'replace "elm.offsetTop or elm.offsetLeft".',
            \'offsetParent':'replace "elm.offsetTop or elm.offsetLeft".',
            \'on':'',
            \'one':'',
            \'outerHeight':'replace "elm.style.height + elm.borderTop + elm.borderBottom + elm.paddingTop + elm.paddingBottom".',
            \'outerWidth':'replace "elm.style.width + elm.borderRight + elm.borderLeft + elm.paddingRight + elm.paddingLeft".',
            \'param':'replace "encodeURI()".',
            \'parent':'replace "elm.parentNode".',
            \'parents':'replace "elm.parentNode".',
            \'parentsUntil':'replace "elm.parentNode".',
            \'parseXML':'',
            \'position':'replace "elm.offsetTop" and "elm.offsetLeft".',
            \'post':'replace "XMLHttpRequest()".',
            \'prepend':'replace "elm.innerHTML".',
            \'prependTo':'replace "elm.innerHTML".',
            \'prev':'replace "document.querySelector()".',
            \'prevAll':'replace "document.querySelectorAll()".',
            \'prevUntil':'replace "document.querySelectorAll()".',
            \'prop':'',
            \'proxy':'',
            \'pushStack':'',
            \'queue':'',
            \'ready':'move script </body> upper.',
            \'removeAttr':'',
            \'removeClass':'replace "elm.className".',
            \'removeData':'',
            \'removeProp':'',
            \'replaceAll':'replace "elm.innerHTML".',
            \'replaceWith':'replace "elm.innerHTML".',
            \'resize':'replace "window.onresize = function(){}".',
            \'scroll':'replace "elm.onscroll = function(){}".',
            \'scrollLeft':'replace "elm.scrollLeft".',
            \'scrollTop':'replace "elm.scrollTop".',
            \'select':'',
            \'serialize':'',
            \'serializeArray':'',
            \'show':'replace "elm.style.display = '."'".'block'."'".'".',
            \'siblings':'replace "document.querySelector()" or "document.querySelectorAll()".',
            \'size':'replace "document.querySelectorAll().length".',
            \'slice':'replace "document.querySelectorAll().slice()".',
            \'slideDown':'repalce CSS3 trasition or "setTimeout()" animation.',
            \'slideToggle':'repalce CSS3 trasition or "setTimeout()" animation.',
            \'slideUp':'repalce CSS3 trasition or "setTimeout()" animation.',
            \'stop':'',
            \'sub':'',
            \'submit':'replace "elm.submit()".',
            \'text':'replace "elm.innerText".',
            \'toArray':'',
            \'toggle':'replace "elm.onclick = function(){}".',
            \'toggleClass':'replace "elm.className".',
            \'trigger':'',
            \'triggerHandler':'',
            \'trim':'replace "txt.toString().replace(/^[\s\xA0]+/, '''').replace(/[\s\xA0]+$/, '''')".',
            \'type':'replace "Object.prototype.toString.call()" or "typeof()".',
            \'unbind':'',
            \'undelegate':'',
            \'unique':'',
            \'unload':'',
            \'unwrap':'replace "elm.parentNode.removeChild(elm)".',
            \'val':'replace "elm.value".',
            \'when':'',
            \'width':'replace "elm.style.width".',
            \'wrap':'replace "elm.appendChild" or "elm.insertBefore".',
            \'wrapAll':'replace "elm.appendChild" or "elm.insertBefore".',
            \'wrapInner':'replace "elm.appendChild" or "elm.insertBefore".',
            \'tmpl':'',
            \'tmplItem':'',
            \'link':'',
            \'template':'',
            \'unlink':''
            \}
endif

let s:temp = []
for [name, exp] in items(g:goodbye_jquery_method_hint)
    call add(s:temp, name)
endfor
let s:goodbye_jquery_method_names = join(s:temp, '|')
unlet s:temp

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
                let line = matchlist(e, '\v.{-}(jQuery|$)\.(.*)')

                if line != []
                    call add(errors, gbjq#errorline(filename, now_no, type, 'maybe jQuery object.'))
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
                let line = matchlist(e, '\v\C\.('.s:goodbye_jquery_method_names.')\((.*)')

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
    " return a:file.':'.a:line.':[ '.a:type.' ] '.a:txt
    return a:file.':'.a:line.':'.a:txt
endfunction

function! gbjq#ignore()
    call setline('.', getline('.').' //goodbye jQuery.')
endfunction
function! gbjq#remember()
    call setline('.', join(split(getline('.'), ' //goodbye jQuery.'), ''))
endfunction

let &cpo = s:save_cpo

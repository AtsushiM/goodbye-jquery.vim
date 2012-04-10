(function() {
    var $I_xxx = $('#aaaaa'),
        $C_xxx = $('#bbbbb'),
        $T_xxx = $('#ccccc');

    var html = $I_xxxx.html();
    $I_xxxx.html('aaaaa');

    var attr = $I_xxx.attr('alt');
    $I_xxxx.attr('alt', 'aaaaa');

    var css = $I_xxx.css('css');
    $I_xxxx.css('padding', '0px');

    var css = $I_xxx.val();
    $I_xxxx.val('padding');

    $I_xxx.click(function() {
        console.log(1111);
    });
}());

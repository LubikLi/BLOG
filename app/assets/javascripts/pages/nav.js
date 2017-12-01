$(document).on('turbolinks:load', function () {
    if ($('.home-page').length) {
        $('.nav-search-onkeydown').on('onkeydown', function (e) {
            if (e.which == 13) {//.which属性判断按下的是哪个键，回车键的键位序号为13
                $('button.search').trigger("click");//触发搜索按钮的点击事件
            }
        });
    }
});

Blog.setupInfiniteScroll = function (listWrapperSelector, itemSelector, callback) {

    var $container = $(listWrapperSelector);

    $container.infinitescroll({
            // Pagination element that will be hidden
            navSelector: '.pagination',
            // Next page link
            nextSelector: '.pagination a[rel=next]',

            // Selector of items to retrieve
            itemSelector: itemSelector,

            // Loading message
            loading: {
                msg: $('<div class="loading-spinner text-center">' +
                    '<div class="spinner"><div class="bounce1"></div><div class="bounce2"></div><div class="bounce3"></div></div>' +
                    '<span class="loading-message">' +
                    '加载中...' +
                    '</span>' +
                    '</div>'),
                speed: 0
            },
            state: {
                currPage: $container.data('current-page') || 1
            },
            errorCallback: function (errorType) {
                if (errorType === 'done') {
                    $container.parent().addClass('all-pages-loaded');
                    $container.parent().append('<div class="refresh-content text-center"><p>已显示全部</p></div>');
                }
            }
        },

        function (data, opts) {
            if (callback) {
                callback($container, data);
            }

            if (opts.state.currPage) {
                $container.attr('data-current-page', opts.state.currPage);
            }
        });

    $container.addClass('js-infinite-scroll-list');
    $container.parent().addClass('infinite-scroll-list');

};

Blog.setupInfiniteScroll.init = function (wrapSelector, itemSelector, callback) {
    if ($(wrapSelector).length > 0) {
        Blog.setupInfiniteScroll(wrapSelector, itemSelector, callback);
    }
};

$(document).on('turbolinks:load', function () {

    Blog.setupInfiniteScroll.init('.article_list', '.article_list li');

});

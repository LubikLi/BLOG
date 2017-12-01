$(document).on('turbolinks:load', function () {
    if ($('.get-code').length) {
        new Blog.PhoneNumberWithValidCodeInput('form');
    }
});

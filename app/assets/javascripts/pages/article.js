$(document).on('turbolinks:load', function () {
    if ($('.terms-of-service').length) {
        var is_true = false;
        var check_box = $(this).prev();

        $(".terms_of_service_label").on('click', function () {
            is_true = !is_true;
            if (!is_true) {
                check_box.val = 0;
                console.log(check_box.val)
            } else {
                check_box.val = 1;
                console.log(check_box.val)
            }
        });
    }
});

$(document).on('turbolinks:load', function () {
    if ($('.users-sessions-page').length) {
        $('.change-login-button').click(function () {
            var $activeBox = $('.login-box.show');
            var $deActiveBox = $('.login-box:not(.show)');
            $activeBox.removeClass('show');
            $deActiveBox.addClass('show');
        });

        if ($('.fast-login .password').length) {
            $('.fast-login .password').blur(function () {
                var pwVal = $('.fast-login .password').val();


                if (pwVal !== '' && pwVal !== null) {
                    $('.preset-password').show();
                    $('.fast-login .password').attr('required', 'required');
                } else {
                    $('.preset-password').hide();
                    $('.fast-login .password').attr('required', false);
                }
            });
        }

        if ($('.login').length) {
            var loginValidator = $('.login').validator();
            loginValidator.on('invalid.bs.validator', function () {// console.log(e.detail)
                $('.login-button-box button').attr('disabled', true);
            });
            loginValidator.on('valid.bs.validator', function () {
                $('.login-button-box button').attr('disabled', false);
            });
        }

        if ($('.login-error').length) {
            setTimeout(function () {
                $('.login-error').removeClass('active');
                $('.login-error').show();
            }, 2000);
        }

        if ($('.get-code').length) {
            new Blog.PhoneNumberWithValidCodeInput('form');
        }
    }

    if ($('.sign-out').length){
        $('.sign-out p').hover(function () {
            $(this).addClass('sign-out-active').siblings().removeClass('sign-out-active');
        });
    }

    if ($('.contact-box').length){
        $('.contact-box li a').hover(function () {
            $(this).addClass('contact').parent().siblings().children().removeClass('contact');
        });
    }

});

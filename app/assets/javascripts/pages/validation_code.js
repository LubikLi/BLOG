var Blog = {};
Blog.createValidationCodeBtnHandler = function(phoneEl, configOptions){
    var defaultOptions = {url: phoneEl ? '/api/validation_code' : '/api/validation_code/to_logged_consumer', sentText: '重新发送(TIME)', resendText: '重新发送'};
    var options = $.extend(defaultOptions, configOptions);
    function sendValidationCode() {
        $.ajax({
            url: options.url,
            type: 'post',
            dataType: 'json',
            data: phoneEl ? {phone: $(phoneEl).val()} : {},
            success: function () {}
        });
    }

    return function(e) {
        e.preventDefault();
        var $this = $(this);
        $this.attr('disabled', true);
        sendValidationCode();
        var times = 60;
        var rs = setInterval(function () {
            $this.text(options.sentText.replace('TIME', times));
            $this.addClass('sent');
            times--;
            if (times < 0) {
                $this.text(options.resendText);
                $this.attr('disabled', false);
                $this.removeClass('sent');
                clearInterval(rs);
            }
        }, 1000);
    };
};

Blog.PhoneNumberWithValidCodeInput = function (el, configOptions) {
    var sendValidCodeBtn = $('.validation-code-btn', el);
    var phoneNumberInput = $('input[type=tel]', el);

    function tryEnableValidationBtn() {
        if (phoneNumberInput.val().match(phoneNumberInput.data('pattern') || /\d{11}/)) {
            sendValidCodeBtn.attr('disabled', false);
        } else {
            sendValidCodeBtn.attr('disabled', true);
        }
    }

    tryEnableValidationBtn();
    phoneNumberInput.on('input', tryEnableValidationBtn);
    sendValidCodeBtn.click(Blog.createValidationCodeBtnHandler(phoneNumberInput, configOptions));
};

Blog.PhoneNumberWithValidCode = function (el) {
    var sendValidCodeBtn = $('.validation-code-btn', el);
    sendValidCodeBtn.click(Blog.createValidationCodeBtnHandler());
};


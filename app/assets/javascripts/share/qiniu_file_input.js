Blog.initQiNiuFileInput = function (el, options) {
    var qiNiuFileInputContainer = $(el);

    var $fileInput = qiNiuFileInputContainer.find('input[type=file]');
    var token = $fileInput.data('token');
    var maxSizeInKB = parseInt($fileInput.data('max-file-size'));
    var $originalInput = qiNiuFileInputContainer.find('.original-input');
    var $preview = qiNiuFileInputContainer.find('.preview');
    var progress = $('.progress', el);
    var progressBar = $('.progress-bar', el);

    $fileInput.fileupload({
        url: 'http://upload.qiniu.com/',
        acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
        paramName: 'file',
        formData: [{name: 'token', value: token}],
        add: function (e, data) {
            if (maxSizeInKB) {
                if (data.files && data.files[0] && data.files[0].size / 1024 < maxSizeInKB) {
                    data.submit();
                } else {
                    $('#prompt').modal('show');
                }
            } else {
                data.submit();
            }
        },
        done: function (e, data) {
            var resizeUrl = Blog.cdnBaseUrl + data.result.key + Blog.previewMdSize;
            var img;
            if (options && options.useBackgroundPreview) {
                img = $('<span class="background-img-tag"/>').css('background-image', 'url(' + resizeUrl + ')');
            } else {
                img = $('<img/>').attr('src', resizeUrl);
            }
            $originalInput.val(data.result.key).trigger('change');
            $preview.html(img);
            progress.css('display', 'none');
            $preview.css('display', 'block');
            if (options && options.done) {
                options.done(data.result.key, resizeUrl);
            }
        },
        progress: function (e, data) {
            var percentage = parseInt(data.loaded / data.total * 100, 10);

            progress.css('display', 'inherit');
            progressBar.css('width', percentage + '%');

            if (options && options.onProcess) {
                options.onProcess(percentage);
            }
        }
    });
};

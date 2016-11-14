(function () {
    toastr.options = {
        closeButton: false,
        debug: false,
        newestOnTop: true,
        progressBar: false,
        positionClass: 'toast-bottom-right',
        preventDuplicates: false,
        onclick: null,
        showDuration: 300,
        hideDuration: 1000,
        timeOut: 5000,
        extendedTimeOut: 1000,
        showEasing: 'swing',
        hideEasing: 'linear',
        showMethod: 'fadeIn',
        hideMethod: 'fadeOut'
    };

    jQuery(function ($) {
        var pageLoading = false;
        var warningActionInProcess = false;
        var addingRedirect = false;
        var modifyingRedirect = false;
        var warningCallbacks = {
            pre_action: function (response, $alert) {
                handleAjaxSuccess(response, function () {
                    $alert.remove();
                }, function () {
                    $('#pre-action-content-textarea').val(response.data.content);
                    $('#pre-action-content-help').html(response.error.pre_action_file_not_writable + '<br>' + response.data.help);
                    $('#pre-action-content-modal').modal('show');

                    return false;
                });
            },
            default: function (response) {
                handleAjaxSuccess(response);
            }
        };

        /**
         *
         * @param {string} title
         * @param {string} message
         * @param {string} type
         */
        function notify(title, message, type) {
            if (!toastr.hasOwnProperty(type) || typeof toastr[type] !== 'function') {
                type = 'info';
            }
            toastr[type](message || '', title);
        }

        /**
         *
         * @param {string} title
         * @param {string} message
         */
        function notifySuccess(title, message) {
            notify(title, message || '', 'success');
        }

        /**
         * @param {object} errors
         */
        function notifyErrors(errors) {
            for (var er in errors) {
                if (errors.hasOwnProperty(er)) {
                    notify(errors[er], '', 'error');
                }
            }
        }

        function notifyNoResponse() {
            notify(getText('ajax-no-response'), '', 'warning');
        }

        function handleAjaxError(xhr, options, error) {
            if (xhr.status == 200) {
                notify(getText('ajax-error'), error.message, 'error');
            } else {
                notify(getText('ajax-error') + ' ' + xhr.status, error.message, 'error');
            }
        }

        function handleAjaxSuccess(response) {
            var args = Array.prototype.slice.call(arguments);
            var defaultAction = true;
            if (response.success) {
                if (typeof args[1] === 'function' && args[1].call(this, response.success, response) === false) {
                    defaultAction = false;
                }
                if (defaultAction)
                    notifySuccess(response.success);
            } else if (response.error) {
                if (typeof args[2] === 'function' && args[2].call(this, response.error, response) === false) {
                    defaultAction = false;
                }

                if (defaultAction)
                    notifyErrors(response.error);
            } else {
                if (typeof args[3] === 'function' && args[3].call(this, response) === false) {
                    defaultAction = false;
                }

                if (defaultAction)
                    notifyNoResponse();
            }
        }

        /**
         *
         * @param {string} data
         * @param {string} value
         * @param {int|null} id
         * @returns {string}
         */
        function getSelector(data, value, id) {
            return '[data-' + data + '="' + value + '"][data-redirect-id="' + id + '"]';
        }

        /**
         *
         * @param {string} type
         * @param {int} id
         * @param {jQuery} context
         * @returns {jQuery}
         */
        function getButton(type, id, context) {
            return $($(getSelector('button', type, id), context || null).get(0));
        }

        /**
         *
         * @param {string} what
         * @param {int} id
         * @param {jQuery} context
         * @returns {jQuery}
         */
        function getPreview(what, id, context) {
            return $($(getSelector('preview', what, id), context || null).get(0));
        }

        /**
         *
         * @param {string} what
         * @param {int|null} id
         * @param {jQuery} context
         * @returns {jQuery}
         */
        function getInput(what, id, context) {
            return $($(getSelector('input', what, id), context || null).get(0));
        }

        /**
         *
         * @param {object} controls
         */
        function startEdit(controls) {
            controls.$editButton.addClass('hidden');
            controls.$saveButton.removeClass('hidden');
            controls.$cancelButton.removeClass('hidden');

            controls.$fromInput.attr('type', 'text');
            controls.$fromPreview.addClass('hidden');
            controls.$toInput.attr('type', 'text');
            controls.$toPreview.addClass('hidden');
            controls.$codeInput.removeClass('hidden');
            controls.$codePreview.addClass('hidden');
            controls.$statusInput.removeClass('hidden');
            controls.$statusPreview.addClass('hidden');

            backupControlValues(controls);
        }

        /**
         *
         * @param {object} controls
         */
        function endEdit(controls) {
            controls.$editButton.removeClass('hidden');
            controls.$saveButton.addClass('hidden');
            controls.$cancelButton.addClass('hidden');

            controls.$fromInput.attr('type', 'hidden');
            controls.$fromPreview.removeClass('hidden');
            controls.$toInput.attr('type', 'hidden');
            controls.$toPreview.removeClass('hidden');
            controls.$codeInput.addClass('hidden');
            controls.$codePreview.removeClass('hidden');
            controls.$statusInput.addClass('hidden');
            controls.$statusPreview.removeClass('hidden');

            removeControlBackupValues(controls);
        }

        /**
         * @returns {boolean}
         */
        function hasNotSavedFields() {
            return $('[data-input]:visible').length > 0;
        }

        /**
         * @param {Object} controls
         * @param {boolean} state
         */
        function changeControlsDisabledState(controls, state) {
            for (var control in controls) {
                if (controls.hasOwnProperty(control)) {
                    if (state) {
                        controls[control].attr('disabled', 'disabled');
                    } else {
                        controls[control].removeAttr('disabled');
                    }
                }
            }
        }

        /**
         * @param {object} controls
         */
        function backupControlValues(controls) {
            for (var control in controls) {
                if (controls.hasOwnProperty(control) && controls[control].is('input, select')) {
                    controls[control].attr('data-initial-value', controls[control].val());
                }
            }
        }

        /**
         * @param {object} controls
         */
        function restoreControlValues(controls) {
            for (var control in controls) {
                if (controls.hasOwnProperty(control) && controls[control].is('input, select')) {
                    controls[control].val(controls[control].data('initial-value'));
                }
            }
        }

        /**
         * @param {object} controls
         */
        function removeControlBackupValues(controls) {
            for (var control in controls) {
                if (controls.hasOwnProperty(control) && controls[control].is('input, select')) {
                    controls[control].attr('data-initial-value', '');
                }
            }
        }

        /**
         * @param {object} controls
         * @returns {{from: *, to: *, code: *, status: *}}
         */
        function getControlValues(controls) {
            return {
                from: controls.$fromInput.val(),
                to: controls.$toInput.val(),
                code: controls.$codeInput.val(),
                status: controls.$statusInput.val()
            }
        }

        /**
         * @param {object} controls
         */
        function updatePreviews(controls) {
            controls.$fromPreview.html(controls.$fromInput.val());
            controls.$toPreview.html(controls.$toInput.val());
            controls.$codePreview.html($('option:selected', controls.$codeInput).text());
            controls.$statusPreview.html($('option:selected', controls.$statusInput).text());
        }

        /**
         * @param {jQuery} $button
         * @param {int|null} id
         * @returns {{
         * $editButton: jQuery,
         * $saveButton: jQuery,
         * $cancelButton: jQuery,
         * $deleteButton: jQuery,
         * $fromPreview: jQuery,
         * $fromInput: jQuery,
         * $toPreview: jQuery,
         * $toInput: jQuery,
         * $codePreview: jQuery,
         * $codeInput: jQuery,
         * $statusPreview: jQuery,
         * $statusInput: jQuery,
         * }}
         */
        function getControls($button, id) {
            var row = $button.closest('tr');
            id = id || $button.data('redirect-id');

            return {
                $editButton: getButton('edit', id, row),
                $saveButton: getButton('save', id, row),
                $cancelButton: getButton('cancel', id, row),
                $deleteButton: getButton('delete', id, row),
                $fromPreview: getPreview('from', id, row),
                $fromInput: getInput('from', id, row),
                $toPreview: getPreview('to', id, row),
                $toInput: getInput('to', id, row),
                $codePreview: getPreview('code', id, row),
                $codeInput: getInput('code', id, row),
                $statusPreview: getPreview('status', id, row),
                $statusInput: getInput('status', id, row)
            }
        }

        /**
         * @param {string} type
         * @returns {jQuery}
         */
        function getAction(type) {
            return $('[data-action-url="' + type + '"]').val();
        }

        /**
         * @param name
         * @returns {string}
         */
        function getText(name) {
            var $input = $('[data-text="' + name + '"]');

            return $input.length ? $input.val() : name;
        }

        /**
         * @param {string} url
         */
        function loadPage(url) {
            if (!pageLoading) {
                if (hasNotSavedFields()) {
                    bootbox.confirm({
                        message: getText('confirm-leave-page'),
                        buttons: {
                            confirm: {
                                label: getText('button-yes'),
                                className: 'btn btn-danger'
                            },
                            cancel: {
                                label: getText('button-no'),
                                className: 'btn btn-primary'
                            }
                        },
                        callback: function (status) {
                           if (status) {
                               updateContent(url);
                           }
                        }
                    });
                } else {
                    updateContent(url);
                }
            }
        }

        function updateContent(url) {
            pageLoading = true;

            var $content = $('#load-content'),
                $overlay = $('#loading-overlay');

            $.ajax({
                url: url,
                type: 'get',
                beforeSend: function () {
                    $('body').scrollTop($content.offset().top);
                    $overlay.removeClass('hidden');
                },
                success: function (response) {
                    $content.html(response);
                },
                error: handleAjaxError,
                complete: function () {
                    $overlay.addClass('hidden');
                    pageLoading = false;
                }
            });

        }

        /**
         * @param {Event} e
         */
        function editRedirect(e) {
            e.preventDefault();
            var $button = $(this),
                controls = getControls($button);

            startEdit(controls);
        }

        /**
         * @param {Event} e
         */
        function saveRedirect(e) {
            e.preventDefault();
            if (!modifyingRedirect) {
                modifyingRedirect = true;

                var $button = $(this),
                    redirectId = $button.data('redirect-id'),
                    controls = getControls($button),
                    newValues = getControlValues(controls);

                $.ajax({
                    url: getAction('save'),
                    type: 'post',
                    dataType: 'json',
                    data: $.extend(newValues, {
                        redirect_id: redirectId
                    }),
                    beforeSend: function () {
                        changeControlsDisabledState(controls, true);
                    },
                    success: function (response) {
                        handleAjaxSuccess(response, function () {
                            updatePreviews(controls);

                            endEdit(controls);
                        });
                    },
                    error: handleAjaxError,
                    complete: function () {
                        changeControlsDisabledState(controls, false);
                        modifyingRedirect = false;
                    }
                });
            }
        }

        /**
         * @param {Event} e
         */
        function cancelEditing(e) {
            e.preventDefault();
            var $button = $(this),
                controls = getControls($button);

            restoreControlValues(controls);
            endEdit(controls);
        }

        /**
         * @param {Event} e
         */
        function deleteRedirect(e) {
            e.preventDefault();
            if (!modifyingRedirect) {
                var $button = $(this),
                    redirectId = $button.data('redirect-id'),
                    controls = getControls($button);

                bootbox.confirm({
                    message: getText('confirm-delete'),
                    buttons: {
                        confirm: {
                            label: getText('button-yes')
                        },
                        cancel: {
                            label: getText('button-no')
                        }
                    },
                    callback: function (status) {
                        if (status) {
                            modifyingRedirect = true;
                            $.ajax({
                                url: getAction('delete'),
                                type: 'post',
                                dataType: 'json',
                                data: {
                                    redirect_id: redirectId
                                },
                                beforeSend: function () {
                                    changeControlsDisabledState(controls, true);
                                },
                                success: function (response) {
                                    handleAjaxSuccess(response, function () {
                                        controls.$deleteButton.closest('tr').remove();
                                    });
                                },
                                error: handleAjaxError,
                                complete: function () {
                                    changeControlsDisabledState(controls, false);
                                    modifyingRedirect = false;
                                }
                            });
                        }
                    }
                });
            }
        }

        /**
         * @param {Event} e
         */
        function loadContentFromLink(e) {
            e.preventDefault();
            var $link = $(this),
                url = $link.attr('href');

            loadPage(url);

            if ($link.data('load') == 'warning') {
                $link.closest('.alert').remove();
            }
        }

        /**
         * @param {Event} e
         */
        function loadContentFromForm(e) {
            e.preventDefault();
            var $form = $(this),
                url = new URL($form.attr('action'));

            url.search = $form.serialize();

            loadPage(url.toString());
        }

        $('body')
            .on('click', '[data-button="edit"]', editRedirect)
            .on('click', '[data-button="save"]', saveRedirect)
            .on('keydown', '[data-input]', function (e) {
                var ENTER = 13;
                if (e.which === ENTER) {
                    saveRedirect.call(this, e);
                }
            })
            .on('click', '[data-button="cancel"]', cancelEditing)
            .on('click', '[data-button="delete"]', deleteRedirect)
            .on('click', '[data-load="pagination"], [data-load="sort"], [data-load="warning"]', loadContentFromLink)
            .on('submit', '[data-load="search"]', loadContentFromForm);
        
        $('#add-redirect-form').on('submit', function (e) {
            e.preventDefault();
            var $form = $(this),
                $modal = $form.closest('.modal'),
                $addButton = $('[data-button="add"]'),
                $submitButton = $('button[type="submit"]', $modal),
                $closeButton = $('[data-dismiss="modal"]', $modal),
                $loading = $('.add-redirect-loading', $modal);

            if (!addingRedirect) {
                addingRedirect = true;
                $.ajax({
                    url: getAction('add'),
                    type: 'post',
                    dataType: 'json',
                    data: $form.serialize(),
                    beforeSend: function () {
                        $submitButton.attr('disabled', 'disabled');
                        $closeButton.attr('disabled', 'disabled');
                        $loading.removeClass('hidden');
                    },
                    success: function (response) {
                        handleAjaxSuccess(response, function () {
                            $modal.modal('hide');
                            $('input[type="text"]', $modal).val('');
                            loadPage($addButton.data('update-url'));
                        });
                    },
                    error: handleAjaxError,
                    complete: function () {
                        $submitButton.removeAttr('disabled');
                        $closeButton.removeAttr('disabled');
                        $loading.addClass('hidden');
                        addingRedirect = false;
                    }
                });
            }
        });
        $('[data-warning="not-show-again"]').on('click', function () {
            var $link = $(this),
                type = $link.data('type');

            $.ajax({
                url: getAction('not-show-again'),
                type: 'post',
                dataType: 'json',
                data: {
                    type: type
                },
                success: function (response) {
                    handleAjaxSuccess(response);
                },
                error: handleAjaxError
            });
        });
        $('[data-warning="action"]').on('click', function (e) {
            e.preventDefault();
            var $link = $(this),
                type = $link.data('type'),
                $alert = $link.closest('.alert'),
                $loading = $('.warning-action-loading', $alert);

            if (!warningActionInProcess) {
                warningActionInProcess = true;
                $.ajax({
                    url: getAction('warning-action'),
                    type: 'post',
                    dataType: 'json',
                    data: {
                        type: type
                    },
                    beforeSend: function () {
                        $loading.removeClass('hidden');
                    },
                    success: function (response) {
                        if (response.type && warningCallbacks.hasOwnProperty(response.type) && typeof warningCallbacks[response.type] === 'function') {
                            warningCallbacks[response.type].call(this, response, $alert);
                        } else {
                            warningCallbacks.default.call(this, response, $alert);
                        }
                    },
                    error: handleAjaxError,
                    complete: function () {
                        $loading.addClass('hidden');
                        warningActionInProcess = false;
                    }
                })
            }
        });
    });
}).call(this);

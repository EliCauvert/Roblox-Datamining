; // bundle: page___7afae4a200c4786bd9639cb16d5b5842_m
; // files: DataPager.js, utilities/dialog.js, common/deviceMeta.js, AbuseReport/AbuseReportDispatcher.js

; // DataPager.js
function DataPager(totalItems, itemsPerPage, itemContainerDivID, pagerContainerDivID, GetItemsPaged_Function, ItemFormatter_Function, ItemFormatterCallback_Function, pagerOptions) {
    if (!(this instanceof DataPager)) {
        return new DataPager(totalItems, containerDivID, GetItemsPaged_Function, ItemFormatter_Function);
    }
    var totalItems = totalItems;
    var itemsPerPage = itemsPerPage;
    var currentPage = 1;
    var maxPage = Math.ceil(totalItems / itemsPerPage);
    var itemContainerDiv = $('#' + itemContainerDivID);
    var pagerContainerDiv = $('#' + pagerContainerDivID);
    var getItemsPaged = GetItemsPaged_Function;
    var itemFormatter = ItemFormatter_Function;
    var itemFormatterCallback = ItemFormatterCallback_Function;
    var options = {
        Paging_PageNumbers_AreLinks: true,
        FetchItemsOnLoad: true,
        pagingClickFunction: false
    };
    for (var op in pagerOptions) {
        options[op] = pagerOptions[op];
    }

    function updatePager() {
        if (currentPage < 1)
            currentPage = 1;
        if (currentPage > maxPage)
            currentPage = maxPage;
        pagerContainerDiv.find(".disabled").removeClass('disabled');
        if (!options.Paging_PageNumbers_AreLinks) {
            pagerContainerDiv.find('.CurrentPage').text(currentPage);
        } else {
            pagerContainerDiv.find(":contains('" + currentPage + "')").addClass('disabled');
        }
        if (currentPage == 1) {
            pagerContainerDiv.find('[pagingaction="First"]').addClass('disabled');
            pagerContainerDiv.find('[pagingaction="Previous"]').addClass('disabled');
            pagerContainerDiv.find('[pagingaction="Next"]').removeClass('disabled');
            pagerContainerDiv.find('[pagingaction="Last"]').removeClass('disabled');
        }
        if (currentPage == maxPage) {
            pagerContainerDiv.find('[pagingaction="First"]').removeClass('disabled');
            pagerContainerDiv.find('[pagingaction="Previous"]').removeClass('disabled');
            pagerContainerDiv.find('[pagingaction="Next"]').addClass('disabled');
            pagerContainerDiv.find('[pagingaction="Last"]').addClass('disabled');
        }
    }

    function pagingClick() {
        elem = $(this);
        if (elem.hasClass('disabled') || elem.attr('pagingaction') === undefined) {
            return;
        }
        currentPage = parseInt(currentPage, 10);
        switch (elem.attr('pagingaction')) {
            case 'First':
                currentPage = 1;
                break;
            case 'Previous':
                currentPage -= 1;
                break;
            case 'Next':
                currentPage += 1;
                break;
            case 'Last':
                currentPage = maxPage;
                break;
            default:
                currentPage = elem.html();
                break;
        }
        if (currentPage < 1)
            currentPage = 1;
        if (currentPage > maxPage)
            currentPage = maxPage;
        if (!options.pagingClickFunction) {
            itemContainerDiv.html('<div class="loading"></div>');
            getItemsPaged((currentPage - 1) * itemsPerPage + 1, itemsPerPage);
        } else {
            options.pagingClickFunction(currentPage);
        }
    };
    var updateHtml = function(response) {
        itemContainerDiv.html('');
        var data = response;
        itemContainerDiv.append(data);
    };
    var callUpdatePager = function(newTotal, newPage) {
        if (newPage != undefined) currentPage = newPage;
        totalItems = newTotal;
        if (maxPage != Math.ceil(totalItems / itemsPerPage) || totalItems == itemsPerPage || totalItems == 0) {
            maxPage = Math.ceil(totalItems / itemsPerPage);
            drawPager();
        }
        updatePager();
    };
    var update = function(response) {
        itemContainerDiv.html('');
        var data = response.data;
        if (data == null || data.length == 0) {
            itemContainerDiv.append(itemFormatter(data));
            return;
        }
        for (var i = 0; i < data.length; i++) {
            itemContainerDiv.append(itemFormatter(data[i]));
            itemFormatterCallback(data[i]);
        }
        itemContainerDiv.append('<div style="clear:both;"></div>');
        totalItems = response.totalItems;
        if (maxPage != Math.ceil(totalItems / itemsPerPage)) {
            maxPage = Math.ceil(totalItems / itemsPerPage);
            drawPager();
        }
        updatePager();
    };

    function drawPager() {
        if (totalItems <= itemsPerPage) {
            pagerContainerDiv.html('');
            return;
        }
        var pagerspan = $('<span></span>').append('<a class="disabled pager first" pagingaction="First">First</a><a class="disabled pager previous" pagingaction="Previous">Previous</a>');
        if (options.Paging_PageNumbers_AreLinks) {
            pagerspan.append('<a class="disabled pager page text" pagingaction="PageNum">1</a>');
            for (var i = itemsPerPage; i < totalItems; i += itemsPerPage) {
                pagerspan.append('<a pagingaction="PageNum">' + ((i / itemsPerPage) + 1) + '</a>');
            }
            pagerspan.append('<a class="pager next" pagingaction="Next">Next</a><a class="pager last" pagingaction="Last">Last</a>');
        } else {
            pagerspan = $('<span></span>').append('<a class="disabled pager first" pagingaction="First"></a><a class="disabled pager previous" pagingaction="Previous"></a>');
            pagerspan.append('<span class="page text">Page <span class="CurrentPage">1</span> of <span class="TotalPages">' + maxPage + '</span></span>');
            pagerspan.append('<a class="pager next" pagingaction="Next"></a><a class="pager last" pagingaction="Last"></a>');
        }
        pagerspan.children().each(function() {
            $(this).bind('click', pagingClick);
        });
        pagerContainerDiv.html($('<div class="JSPager_Container"></div>').append(pagerspan));
    }
    (function() {
        if (options.FetchItemsOnLoad) getItemsPaged(1, itemsPerPage);
        if (totalItems > itemsPerPage) {
            drawPager();
        }
    })();
    return {
        getItemsPaged: getItemsPaged,
        update: update,
        updateHtml: updateHtml,
        callUpdatePager: callUpdatePager,
        totalItems: totalItems,
        itemContainerDiv: itemContainerDiv,
        getStartIndex: function() {
            return (currentPage - 1) * itemsPerPage + 1;
        },
        getCurrentPage: function() {
            return currentPage;
        },
        isLastPage: function() {
            return maxPage == currentPage;
        }
    };
}

; // utilities/dialog.js
if (typeof Roblox === "undefined") {
    Roblox = {};
}
if (typeof Roblox.Dialog === "undefined") {
    Roblox.Dialog = function() {
        var CONTAINER_SELECTOR = ".simplemodal-container";
        var BUTTON_CLASS_GREEN = "btn-primary-md";
        var BUTTON_CLASS_BLUE = "btn-secondary-md";
        var BUTTON_CLASS_WHITE = "btn-control-md";
        var BUTTON_CLASS_GREEN_DISABLED = "btn-primary-md disabled";
        var BUTTON_CLASS_BLUE_DISABLED = "btn-secondary-md disabled";
        var BUTTON_CLASS_WHITE_DISABLED = "btn-control-md disabled";
        var BUTTON_CLASS_NONE = "btn-none";
        var BUTTON_SELECTOR_YES = ".modal-btns #confirm-btn";
        var BUTTON_SELECTOR_NO = ".modal-btns #decline-btn";
        var MODAL_CHECKBOX_SELECTOR = "#modal-checkbox-input";
        var status = {
            isOpen: false
        };
        var modalProperties = {
            overlayClose: true,
            escClose: true,
            opacity: 80,
            zIndex: 1040,
            overlayCss: {
                backgroundColor: "#000"
            },
            onClose: close,
            focus: false
        };
        var dialogDefaults = {
            Yes: "Yes",
            No: "No",
            Agree: "Agree"
        };

        function open(properties) {
            status.isOpen = true;
            var defaults = {
                titleText: "",
                bodyContent: "",
                footerText: "",
                footerMiddleAligned: false,
                acceptText: Roblox.Lang.ControlsResources["Action.Yes"] || dialogDefaults.Yes,
                declineText: Roblox.Lang.ControlsResources["Action.No"] || dialogDefaults.No,
                acceptColor: BUTTON_CLASS_BLUE,
                declineColor: BUTTON_CLASS_WHITE,
                xToCancel: false,
                onAccept: function() {
                    return false;
                },
                onDecline: function() {
                    return false;
                },
                onCancel: function() {
                    return false;
                },
                imageUrl: null,
                showAccept: true,
                showDecline: true,
                allowHtmlContentInBody: false,
                allowHtmlContentInFooter: false,
                dismissable: true,
                fieldValidationRequired: false,
                onOpenCallback: function() {},
                onCloseCallback: close,
                cssClass: null,
                checkboxAgreementText: Roblox.Lang.ControlsResources["Action.Agree"] || dialogDefaults.Agree,
                checkboxAgreementRequired: false
            };
            properties = $.extend({}, defaults, properties);
            modalProperties.overlayClose = properties.dismissable;
            modalProperties.escClose = properties.dismissable;
            if (properties.onCloseCallback) {
                modalProperties.onClose = function() {
                    properties.onCloseCallback();
                    close();
                }
            }
            var yesBtn = $(BUTTON_SELECTOR_YES);
            yesBtn.html(properties.acceptText);
            yesBtn.attr("class", properties.acceptColor);
            yesBtn.unbind();
            yesBtn.bind('click', function() {
                if (_buttonIsDisabled(yesBtn)) {
                    return false;
                }
                if (properties.fieldValidationRequired) {
                    btnClickCallbackFirst(properties.onAccept);
                } else {
                    btnClick(properties.onAccept);
                }
                return false;
            });
            var noBtn = $(BUTTON_SELECTOR_NO);
            noBtn.html(properties.declineText);
            noBtn.attr("class", properties.declineColor);
            noBtn.unbind();
            noBtn.bind('click', function() {
                if (_buttonIsDisabled(noBtn)) {
                    return false;
                }
                btnClick(properties.onDecline);
                return false;
            });
            var checkbox = $(MODAL_CHECKBOX_SELECTOR);
            checkbox.unbind();
            checkbox.bind("change", function() {
                if (checkbox.is(":checked")) {
                    _enableButton(yesBtn);
                } else {
                    _disableButton(yesBtn);
                }
            });
            var modal = $('[data-modal-type="confirmation"]');
            modal.find(".modal-title").text(properties.titleText);
            if (properties.imageUrl == null) {
                modal.addClass('noImage');
            } else {
                modal.find('img.modal-thumb').attr('src', properties.imageUrl);
                modal.removeClass('noImage');
            }
            if (status.extraClass) {
                modal.removeClass(status.extraClass);
                status.extraClass = false;
            }
            if (properties.cssClass != null) {
                modal.addClass(properties.cssClass);
                status.extraClass = properties.cssClass;
            }
            if (properties.allowHtmlContentInBody) {
                modal.find(".modal-message").html(properties.bodyContent);
            } else {
                modal.find(".modal-message").text(properties.bodyContent);
            }
            if (properties.checkboxAgreementRequired) {
                _disableButton(yesBtn);
                modal.find(".modal-checkbox.checkbox > input").prop("checked", false);
                modal.find(".modal-checkbox.checkbox > label").text(properties.checkboxAgreementText);
                modal.find(".modal-checkbox.checkbox").show();
            } else {
                modal.find(".modal-checkbox.checkbox > input").prop("checked", true);
                modal.find(".modal-checkbox.checkbox").hide();
            }
            if ($.trim(properties.footerText) == "") {
                modal.find(".modal-footer").hide();
            } else {
                modal.find(".modal-footer").show();
            }
            if (properties.allowHtmlContentInFooter) {
                modal.find(".modal-footer").html(properties.footerText);
            } else {
                modal.find(".modal-footer").text(properties.footerText);
            }
            if (properties.footerMiddleAligned) {
                modal.find(".modal-footer").addClass("modal-footer-center");
            }
            modal.modal(modalProperties);
            var cancelBtn = $(CONTAINER_SELECTOR + " .modal-header .close");
            cancelBtn.unbind();
            cancelBtn.bind('click', function() {
                btnClick(properties.onCancel);
                return false;
            });
            if (!properties.xToCancel) {
                cancelBtn.hide();
            }
            if (!properties.showAccept) {
                yesBtn.hide();
            }
            if (!properties.showDecline) {
                noBtn.hide();
            }
            $("#rbx-body").addClass("modal-mask");
            properties.onOpenCallback();
        }

        function _disableButton(btn) {
            if (btn.hasClass(BUTTON_CLASS_WHITE)) {
                btn.addClass(BUTTON_CLASS_WHITE_DISABLED);
            } else if (btn.hasClass(BUTTON_CLASS_GREEN)) {
                btn.addClass(BUTTON_CLASS_GREEN_DISABLED);
            } else if (btn.hasClass(BUTTON_CLASS_BLUE)) {
                btn.addClass(BUTTON_CLASS_BLUE_DISABLED);
            }
        }

        function _buttonIsDisabled(btn) {
            if (btn.hasClass(BUTTON_CLASS_BLUE_DISABLED) || btn.hasClass(BUTTON_CLASS_WHITE_DISABLED) || btn.hasClass(BUTTON_CLASS_GREEN_DISABLED)) {
                return true;
            }
            return false;
        }

        function disableButtons() {
            var yesBtn = $(BUTTON_SELECTOR_YES);
            var noBtn = $(BUTTON_SELECTOR_NO);
            _disableButton(yesBtn);
            _disableButton(noBtn);
        }

        function _enableButton(btn) {
            if (btn.hasClass(BUTTON_CLASS_WHITE_DISABLED)) {
                btn.removeClass(BUTTON_CLASS_WHITE_DISABLED);
                btn.addClass(BUTTON_CLASS_WHITE);
            } else if (btn.hasClass(BUTTON_CLASS_GREEN_DISABLED)) {
                btn.removeClass(BUTTON_CLASS_GREEN_DISABLED);
                btn.addClass(BUTTON_CLASS_GREEN);
            } else if (btn.hasClass(BUTTON_CLASS_BLUE_DISABLED)) {
                btn.removeClass(BUTTON_CLASS_BLUE_DISABLED);
                btn.addClass(BUTTON_CLASS_BLUE);
            }
        }

        function enableButtons() {
            var yesBtn = $(BUTTON_SELECTOR_YES);
            var noBtn = $(BUTTON_SELECTOR_NO);
            _enableButton(yesBtn);
            _enableButton(noBtn);
        }

        function clickYes() {
            if (status.isOpen) {
                var yesBtn = $(BUTTON_SELECTOR_YES);
                yesBtn.click();
            }
        }

        function clickNo() {
            var noBtn = $(BUTTON_SELECTOR_NO);
            noBtn.click();
        }

        function close(id) {
            status.isOpen = false;
            if (typeof id !== 'undefined') {
                $.modal.close(id);
            } else {
                $.modal.close();
            }
            $("#rbx-body").removeClass("modal-mask");
        }

        function btnClick(callBack) {
            close();
            if (typeof callBack === 'function') {
                callBack();
            }
        }

        function btnClickCallbackFirst(callBack) {
            if (typeof callBack === 'function') {
                var returnVal = callBack();
                if (returnVal !== 'undefined') {
                    if (returnVal == false) {
                        return false;
                    }
                }
            }
            close();
        }

        function toggleProcessing(isShown, closeClass) {
            var modal = $(".modal-body");
            if (isShown) {
                modal.find(".modal-btns").hide();
                modal.find(".modal-processing").show();
            } else {
                modal.find(".modal-btns").show();
                modal.find(".modal-processing").hide();
            }
            if (typeof closeClass !== "undefined" && closeClass !== "") {
                $.modal.close("." + closeClass);
            }
        }
        return {
            open: open,
            close: close,
            disableButtons: disableButtons,
            enableButtons: enableButtons,
            clickYes: clickYes,
            clickNo: clickNo,
            status: status,
            toggleProcessing: toggleProcessing,
            green: BUTTON_CLASS_GREEN,
            blue: BUTTON_CLASS_BLUE,
            white: BUTTON_CLASS_WHITE,
            none: BUTTON_CLASS_NONE
        };
    }();
}
$(document).keypress(function(e) {
    if (Roblox.Dialog.isOpen && e.which === 13) {
        Roblox.Dialog.clickYes();
    }
});

; // common/deviceMeta.js
var Roblox = Roblox || {};
Roblox.DeviceMeta = (function() {
    var metaTag = document.querySelector('meta[name="device-meta"]');
    if (metaTag === null) {
        console.debug("Error loading device information from meta tag - please check if meta tag is present");
        return;
    }
    var keyMap = metaTag.dataset || {};
    var appTypes = {
        android: "android",
        ios: "ios",
        xbox: "xbox",
        uwp: "uwp",
        amazon: "amazon",
        win32: "win32",
        universalapp: "universalApp",
        unknown: "unknown"
    };
    var deviceTypes = {
        computer: "computer",
        tablet: "tablet",
        phone: "phone",
        console: "console"
    };
    return function() {
        return {
            deviceType: deviceTypes[keyMap.deviceType] || '',
            appType: appTypes[keyMap.appType] || '',
            isInApp: keyMap.isInApp === 'true',
            isDesktop: keyMap.isDesktop === 'true',
            isPhone: keyMap.isPhone === 'true',
            isTablet: keyMap.isTablet === 'true',
            isConsole: keyMap.isConsole === 'true',
            isAndroidApp: keyMap.isAndroidApp === 'true',
            isIosApp: keyMap.isIosApp === 'true',
            isUWPApp: keyMap.isUwpApp === 'true',
            isXboxApp: keyMap.isXboxApp === 'true',
            isAmazonApp: keyMap.isAmazonApp === 'true',
            isWin32App: keyMap.isWin32App === 'true',
            isStudio: keyMap.isStudio === 'true',
            isIosDevice: keyMap.isIosDevice === 'true',
            isAndroidDevice: keyMap.isAndroidDevice === 'true',
            isUniversalApp: keyMap.isUniversalApp === 'true',
            isChromeOs: keyMap.isChromeOs === 'true',
            isPcGdkApp: keyMap.isPcGdkApp === 'true',
            isSamsungGalaxyStoreApp: keyMap.isSamsungGalaxyStoreApp === 'true',
        }
    };
})();

; // AbuseReport/AbuseReportDispatcher.js
var Roblox = Roblox || {};
Roblox.AbuseReportDispatcher = (function() {
    var isInitialized = false;
    var getParamFromQueryString = function(param, url) {
        param = param.replace(/[\[\]]/g, "\\$&");
        var regex = new RegExp("[?&]" + param + "(=([^&#]*)|&|#|$)"),
            results = regex.exec(url);
        if (!results) {
            return null;
        }
        if (!results[2]) {
            return "";
        }
        return decodeURIComponent(results[2].replace(/\+/g, " "));
    }
    var triggerUrlAction = function(url) {
        if (typeof(url) !== "string") {
            return false;
        }
        url = url.toLowerCase();
        var parts = url.split("?");
        var link = parts[0];
        var action;
        var pvMeta = Roblox.AbuseReportPVMeta;
        var deviceMeta = Roblox.DeviceMeta();
        pvMeta.inApp = deviceMeta.isInApp;
        if (link && typeof(link) === "string") {
            action = link.split("abusereport/")[1];
        }
        if (action) {
            var payload = {
                actionName: action,
                id: getParamFromQueryString("id", url),
                redirectUrl: getParamFromQueryString("redirecturl", url)
            };
            if (getParamFromQueryString("conversationid", url)) {
                payload["conversationId"] = getParamFromQueryString("conversationid", url);
            }
            if (getParamFromQueryString("stringid", url)) {
                payload["stringId"] = getParamFromQueryString("stringid", url);
            }
            if (getParamFromQueryString("forumPostId", url)) {
                payload["forumPostId"] = getParamFromQueryString("forumPostId", url);
            }
            if (getParamFromQueryString("partyguid", url)) {
                payload["partyGuid"] = getParamFromQueryString("partyguid", url);
            }
            if (payload.id && payload.redirectUrl) {
                var newQuerystring = $.param(payload);
                var embedUrlPath = "abusereport/embedded/" + action + "?" + newQuerystring;
                var embeddedUrl = Roblox.Endpoints.getAbsoluteUrl("/" + embedUrlPath);
                if (pvMeta.inApp) {
                    if (pvMeta.inAppEnabled) {
                        var params = {
                            urlPath: embedUrlPath,
                            feature: "Abuse Report"
                        };
                        console.debug("Calling navigateToFeature for Hybrid Overlay");
                        Roblox.Hybrid.Navigation.navigateToFeature(params, function(status) {
                            console.debug("navigateToFeature ---- status:" + status);
                        });
                    } else {
                        window.location.href = url;
                    }
                } else if (pvMeta.phoneEnabled) {
                    window.location.href = embeddedUrl;
                } else {
                    window.location.href = url;
                }
            }
        }
    }
    var listener = function(e) {
        e.preventDefault();
        var url = $(this).attr("href");
        if (url) {
            triggerUrlAction(url);
        }
    }
    var initialize = function() {
        if (!isInitialized) {
            $(".abuse-report-modal").click(listener);
            $(".messages-container").on("click", ".abuse-report-modal", listener);
            $("#AjaxCommentsContainer").on("click", ".abuse-report-modal", listener);
            $("#item-context-menu").on("click", ".abuse-report-modal", listener);
            $(".GroupWallPane").on("click", ".abuse-report-modal", listener);
            $(".group-details-container").on("click", ".abuse-report-modal", listener);
            isInitialized = true;
        }
    }
    return {
        triggerUrlAction: triggerUrlAction,
        initialize: initialize
    };
})();
$(document).ready(function() {
    Roblox.AbuseReportDispatcher.initialize();
});

; //Bundle detector
Roblox && Roblox.BundleDetector && Roblox.BundleDetector.bundleDetected('page');
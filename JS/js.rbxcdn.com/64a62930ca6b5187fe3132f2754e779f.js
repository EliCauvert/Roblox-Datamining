; // bundle: page___7510e420b299316101ab37a6b4274775_m
; // files: common/deviceMeta.js, AbuseReport/AbuseReportDispatcher.js

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
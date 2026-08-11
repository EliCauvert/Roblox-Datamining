! function() {
    try {
        var t = "undefined" != typeof window ? window : "undefined" != typeof global ? global : "undefined" != typeof globalThis ? globalThis : "undefined" != typeof self ? self : {};
        t.SENTRY_RELEASE = {
            id: "5af98963c3044609bbba86bef8b8e32284e249cb"
        };
        var o = (new t.Error).stack;
        o && (t._sentryDebugIds = t._sentryDebugIds || {}, t._sentryDebugIds[o] = "394fdd5a-6400-4b17-9fb4-0d6942263914", t._sentryDebugIdIdentifier = "sentry-dbid-394fdd5a-6400-4b17-9fb4-0d6942263914")
    } catch (t) {}
}(),
function() {
    "use strict";
    var t = {},
        o = {};

    function n(e) {
        var a = o[e];
        if (void 0 !== a) return a.exports;
        var i = o[e] = {
            exports: {}
        };
        return t[e](i, i.exports, n), i.exports
    }
    n.d = function(t, o) {
        for (var e in o) n.o(o, e) && !n.o(t, e) && Object.defineProperty(t, e, {
            enumerable: !0,
            get: o[e]
        })
    }, n.o = function(t, o) {
        return Object.prototype.hasOwnProperty.call(t, o)
    }, n.r = function(t) {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(t, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(t, "__esModule", {
            value: !0
        })
    }, n.rv = function() {
        return "1.5.7"
    }, n.ruid = "bundler=rspack@1.5.7";
    var e = {};

    function a(t, o) {
        (null == o || o > t.length) && (o = t.length);
        for (var n = 0, e = Array(o); n < o; n++) e[n] = t[n];
        return e
    }
    n.r(e), n.d(e, {
        EnvironmentUrls: function() {
            return d
        },
        default: function() {
            return h
        }
    });
    var i = function(t, o) {
        var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : window;
        if ("string" == typeof t) n[t] = o;
        else {
            var e = function(t) {
                    if (Array.isArray(t)) return a(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || function(t, o) {
                    if (t) {
                        if ("string" == typeof t) return a(t, void 0);
                        var n = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return a(t, o)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }(),
                i = e.pop(),
                r = n,
                s = !0,
                c = !1,
                p = void 0;
            try {
                for (var l, u = e[Symbol.iterator](); !(s = (l = u.next()).done); s = !0) {
                    var h, d = l.value;
                    null != (h = r)[d] || (h[d] = {}), r = r[d]
                }
            } catch (t) {
                c = !0, p = t
            } finally {
                try {
                    s || null == u.return || u.return()
                } finally {
                    if (c) throw p
                }
            }
            r[i] = o
        }
    };

    function r(t, o) {
        (null == o || o > t.length) && (o = t.length);
        for (var n = 0, e = Array(o); n < o; n++) e[n] = t[n];
        return e
    }
    var s = function(t) {
            var o, n = document.querySelector('meta[name="environment-meta"]');
            if (null == n ? void 0 : n.dataset.domain) return {
                production: "false" === n.dataset.isTestingSite,
                domainName: n.dataset.domain.split(".")[0],
                rootDomain: n.dataset.domain
            };
            var e = (o = t.split(".").reverse(), function(t) {
                    if (Array.isArray(t)) return t
                }(o) || function(t, o) {
                    var n, e, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var i = [],
                            r = !0,
                            s = !1;
                        try {
                            for (a = a.call(t); !(r = (n = a.next()).done) && (i.push(n.value), i.length !== o); r = !0);
                        } catch (t) {
                            s = !0, e = t
                        } finally {
                            try {
                                r || null == a.return || a.return()
                            } finally {
                                if (s) throw e
                            }
                        }
                        return i
                    }
                }(o, 3) || function(t, o) {
                    if (t) {
                        if ("string" == typeof t) return r(t, 3);
                        var n = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return r(t, o)
                    }
                }(o, 3) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()),
                a = e[0],
                i = e[1],
                s = e[2];
            if (null != a && null != i) {
                var c = "".concat(i, ".").concat(a);
                if ("roblox.com" === c || "simulprod.com" === c || "rblx.org" === c) return {
                    production: !0,
                    domainName: "roblox",
                    rootDomain: "roblox.com"
                };
                if (null == s ? void 0 : s.startsWith("sitetest")) return {
                    production: !1,
                    domainName: s,
                    rootDomain: "".concat(s, ".robloxlabs.com")
                }
            }
            throw Error("Unknown environment for ".concat(t))
        }(window.location.hostname),
        c = s.production,
        p = s.domainName,
        l = s.rootDomain,
        u = {
            abtestingApiSite: "https://abtesting.".concat(l),
            accountInformationApi: "https://accountinformation.".concat(l),
            accountSettingsApi: "https://accountsettings.".concat(l),
            adConfigurationApi: "https://adconfiguration.".concat(l),
            adsApi: "https://ads.".concat(l),
            advertiseApi: "https://advertise.".concat(l),
            apiGatewayUrl: "https://apis.".concat(l),
            apiProxyUrl: "https://api.".concat(l),
            assetDeliveryApi: "https://assetdelivery.".concat(l),
            authApi: "https://auth.".concat(l),
            avatarApi: "https://avatar.".concat(l),
            badgesApi: "https://badges.".concat(l),
            beaconApi: "https://apis.".concat(l, "/beacon-api"),
            billingApi: "https://billing.".concat(l),
            captchaApi: "https://captcha.".concat(l),
            catalogApi: "https://catalog.".concat(l),
            chatApi: "https://apis.".concat(l, "/platform-chat-api"),
            chatModerationApi: "https://chatmoderation.".concat(l),
            contactsApi: "https://contacts.".concat(l),
            contactsServiceApi: "https://apis.".concat(l, "/contacts-api"),
            contentStoreApi: "https://contentstore.".concat(l),
            developApi: "https://develop.".concat(l),
            domain: l,
            economyApi: "https://economy.".concat(l),
            economycreatorstatsApi: "https://economycreatorstats.".concat(l),
            engagementPayoutsApi: "https://engagementpayouts.".concat(l),
            followingsApi: "https://followings.".concat(l),
            friendsApi: "https://friends.".concat(l),
            gameInternationalizationApi: "https://gameinternationalization.".concat(l),
            gamesApi: "https://games.".concat(l),
            gameJoinApi: "https://gamejoin.".concat(l),
            gameUpdateNotificationsApi: "https://apis.".concat(l, "/game-update-notifications"),
            groupsApi: "https://groups.".concat(l),
            groupsModerationApi: "https://groupsmoderation.".concat(l),
            helpSite: "https://en.help.".concat(l),
            inventoryApi: "https://inventory.".concat(l),
            itemConfigurationApi: "https://itemconfiguration.".concat(l),
            legacyChatApi: "https://chat.".concat(l),
            localeApi: "https://locale.".concat(l),
            localizationTablesApi: "https://localizationtables.".concat(l),
            matchmakingApi: "https://apis.".concat(l, "/matchmaking-api"),
            metricsApi: "https://metrics.".concat(l),
            midasApi: "https://midas.".concat(l),
            modalsApi: "https://apis.".concat(l, "/modals-api"),
            notificationApi: "https://notifications.".concat(l),
            passProductPurchasingApi: "https://apis.".concat(l, "/pass-product-purchasing"),
            bundlesProductPurchasingApi: "https://apis.".concat(l, "/bundles-product-purchasing"),
            premiumFeaturesApi: "https://premiumfeatures.".concat(l),
            presenceApi: "https://presence.".concat(l),
            privateMessagesApi: "https://privatemessages.".concat(l),
            profileInsightsApi: "https://apis.".concat(l, "/profile-insights-api"),
            publishApi: "https://publish.".concat(l),
            restrictedHoursServiceApi: "https://apis.".concat(l, "/restricted-hours-service"),
            screenTimeApi: "https://apis.rcs.roblox.com/screen-time-api",
            shareApi: "https://share.".concat(l),
            shareLinksApi: "https://apis.".concat(l, "/sharelinks"),
            shareLinksApiV2: "https://apis.".concat(l, "/deeplinks"),
            showcasesApi: "https://apis.".concat(l, "/showcases-api"),
            thumbnailsApi: "https://thumbnails.".concat(l),
            tradesApi: "https://trades.".concat(l),
            translationRolesApi: "https://translationroles.".concat(l),
            twoStepVerificationApi: "https://twostepverification.".concat(l),
            userAgreementsServiceApi: "https://apis.".concat(l, "/user-agreements"),
            userModerationApi: "https://usermoderation.".concat(l),
            usersApi: "https://users.".concat(l),
            userSettingsApi: "https://apis.".concat(l, "/user-settings-api"),
            voiceApi: "https://voice.".concat(l),
            websiteUrl: "https://www.".concat(l),
            apiGatewayCdnUrl: c ? "https://apis.rbxcdn.com" : "https://apis.".concat(l),
            eduAuthenticationApi: c ? "https://auth.rblx.org" : "https://auth.".concat(p, ".rblx.org"),
            eduWebsiteUrl: c ? "https://www.rblx.org" : "https://www.".concat(p, ".rblx.org"),
            guildedBaseUrl: c ? "https://guilded.gg" : "sitetest1" === p ? "https://tarobi-dev-test.com" : "sitetest2" === p || "sitetest3" === p ? "https://tarobi-dev-sandbox.com" : "https://tarobi-dev-test.com",
            vngGamesShopUrl: c ? "https://shop.vnggames.com/vn/game/roblox" : "https://sbx-shop.vnggames.com/vn/game/roblox",
            stripeCheckoutDomain: "pay.".concat(l),
            amazonStoreLink: "https://www.amazon.com/Roblox-Corporation/dp/B00NUF4YOA",
            amazonWebStoreLink: "https%3a%2f%2fwww.amazon.com%2froblox%3f%26_encoding%3dUTF8%26tag%3dr05d13-20%26linkCode%3dur2%26linkId%3d5562fc29c05b45562a86358c198356eb%26camp%3d1789%26creative%3d9325",
            appProtocolUrl: "robloxmobile://",
            appStoreLink: "https://itunes.apple.com/us/app/roblox-mobile/id431946152",
            googlePlayStoreLink: "https://play.google.com/store/apps/details?id=com.roblox.client&amp;hl=en",
            iosAppStoreLink: "https://itunes.apple.com/us/app/roblox-mobile/id431946152",
            windowsStoreLink: "https://www.microsoft.com/en-us/store/games/roblox/9nblgggzm6wm",
            xboxStoreLink: "https://www.microsoft.com/en-us/p/roblox/bq1tn1t79v9k"
        },
        h = u,
        d = u;
    i(["Roblox", "core-scripts", "environmentUrls"], e), i(["Roblox", "EnvironmentUrls"], h)
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("EnvironmentUrls");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/environmentUrls-8f0a4182a25bc6dc.js.map
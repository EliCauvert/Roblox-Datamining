! function() {
    try {
        var t = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        t.SENTRY_RELEASE = {
            id: "e43c94045db314a010295d6a96d80023207ebc61"
        };
        var o = (new t.Error).stack;
        o && (t._sentryDebugIds = t._sentryDebugIds || {}, t._sentryDebugIds[o] = "7f1a3e81-e8ed-408b-ae99-f04888738319", t._sentryDebugIdIdentifier = "sentry-dbid-7f1a3e81-e8ed-408b-ae99-f04888738319")
    } catch (t) {}
}(),
function() {
    "use strict";
    var t = {},
        o = {};

    function a(e) {
        var n = o[e];
        if (void 0 !== n) return n.exports;
        var i = o[e] = {
            exports: {}
        };
        return t[e](i, i.exports, a), i.exports
    }
    a.d = function(t, o) {
        for (var e in o) a.o(o, e) && !a.o(t, e) && Object.defineProperty(t, e, {
            enumerable: !0,
            get: o[e]
        })
    }, a.o = function(t, o) {
        return Object.prototype.hasOwnProperty.call(t, o)
    }, a.r = function(t) {
        "u" > typeof Symbol && Symbol.toStringTag && Object.defineProperty(t, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(t, "__esModule", {
            value: !0
        })
    }, a.rv = function() {
        return "1.7.12"
    }, a.ruid = "bundler=rspack@1.7.12";
    var e = {};

    function n(t, o) {
        (null == o || o > t.length) && (o = t.length);
        for (var a = 0, e = Array(o); a < o; a++) e[a] = t[a];
        return e
    }
    a.r(e), a.d(e, {
        EnvironmentUrls: function() {
            return m
        },
        default: function() {
            return h
        }
    });
    var i = function(t, o) {
        var a = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : window;
        if ("string" == typeof t) a[t] = o;
        else {
            var e = function(t) {
                    if (Array.isArray(t)) return n(t)
                }(t) || function(t) {
                    if ("u" > typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || function(t) {
                    if (t) {
                        if ("string" == typeof t) return n(t, void 0);
                        var o = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === o && t.constructor && (o = t.constructor.name), "Map" === o || "Set" === o) return Array.from(o);
                        if ("Arguments" === o || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(o)) return n(t, void 0)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }(),
                i = e.pop(),
                r = a,
                s = !0,
                c = !1,
                p = void 0;
            try {
                for (var l, u = e[Symbol.iterator](); !(s = (l = u.next()).done); s = !0) {
                    var h, m = l.value;
                    null != (h = r)[m] || (h[m] = {}), r = r[m]
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
        for (var a = 0, e = Array(o); a < o; a++) e[a] = t[a];
        return e
    }
    var s = function(t) {
            var o, a = document.querySelector('meta[name="environment-meta"]');
            if (null == a ? void 0 : a.dataset.domain) return {
                production: "false" === a.dataset.isTestingSite,
                domainName: a.dataset.domain.split(".")[0],
                rootDomain: a.dataset.domain
            };
            var e = function(t) {
                    if (Array.isArray(t)) return t
                }(o = t.split(".").reverse()) || function(t) {
                    var o, a, e = null == t ? null : "u" > typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != e) {
                        var n = [],
                            i = !0,
                            r = !1;
                        try {
                            for (e = e.call(t); !(i = (o = e.next()).done) && (n.push(o.value), 3 !== n.length); i = !0);
                        } catch (t) {
                            r = !0, a = t
                        } finally {
                            try {
                                i || null == e.return || e.return()
                            } finally {
                                if (r) throw a
                            }
                        }
                        return n
                    }
                }(o) || function(t) {
                    if (t) {
                        if ("string" == typeof t) return r(t, 3);
                        var o = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === o && t.constructor && (o = t.constructor.name), "Map" === o || "Set" === o) return Array.from(o);
                        if ("Arguments" === o || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(o)) return r(t, 3)
                    }
                }(o) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }(),
                n = e[0],
                i = e[1],
                s = e[2];
            if (null != n && null != i) {
                var c = "".concat(i, ".").concat(n);
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
            assetPathPrefix: "https://assets.create.".concat(l),
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
            playWebsite: "https://play.".concat(l),
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
        m = u;
    i(["Roblox", "core-scripts", "environmentUrls"], e), i(["Roblox", "EnvironmentUrls"], h)
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("EnvironmentUrls");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/environmentUrls-3b8051f497e57981.js.map
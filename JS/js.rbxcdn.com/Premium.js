! function() {
    var n = {
            1006: function(e, r, n) {
                var t = {
                    "./premiumConstants.js": 6384
                };

                function o(e) {
                    e = i(e);
                    return n(e)
                }

                function i(e) {
                    if (n.o(t, e)) return t[e];
                    e = new Error("Cannot find module '" + e + "'");
                    throw e.code = "MODULE_NOT_FOUND", e
                }
                o.keys = function() {
                    return Object.keys(t)
                }, o.resolve = i, (e.exports = o).id = 1006
            },
            9737: function(e, r, n) {
                var t = {
                    "./premiumConstantsService.js": 8614,
                    "./premiumService.js": 8287
                };

                function o(e) {
                    e = i(e);
                    return n(e)
                }

                function i(e) {
                    if (n.o(t, e)) return t[e];
                    e = new Error("Cannot find module '" + e + "'");
                    throw e.code = "MODULE_NOT_FOUND", e
                }
                o.keys = function() {
                    return Object.keys(t)
                }, o.resolve = i, (e.exports = o).id = 9737
            },
            7525: function(e) {
                function i(e) {
                    return e.replace(/([a-z])([A-Z])/g, "$1-$2").toLowerCase()
                }

                function u(e) {
                    return e.split("/").pop().replace(".html", "")
                }
                var r = {
                    importFilesUnderPath: function(e) {
                        e.keys().forEach(e)
                    },
                    templateCacheGenerator: function(e, r, t, o) {
                        return e.module(r, []).run(["$templateCache", function(n) {
                            t && t.keys().forEach(function(e) {
                                var r = i(u(e));
                                n.put(r, t(e))
                            }), o && o.keys().forEach(function(e) {
                                var r = i(u(e));
                                n.put(r, o(e).replace(/<\/?script[^>]*>/gi, ""))
                            })
                        }])
                    }
                };
                e.exports = r
            },
            6384: function(e, r, n) {
                "use strict";
                n.r(r);
                var t = {
                    modals: {
                        bodyCenterCss: "premium-modal-center"
                    },
                    templates: {
                        annualPremiumBanner: "annual-premium-banner",
                        subscriptionCard: "subscription-card",
                        subscriptionContainer: "subscription-container",
                        robuxPackage: "robux-package",
                        robuxContainer: "robux-container",
                        robuxContainerBase: "robux-container-base",
                        robuxSubscriptionUpsellContainer: "robux-subscription-upsell-container",
                        robuxSubscriptionUpsellPackage: "robux-subscription-upsell-package",
                        purchaseWarningModal: "purchase-warning-modal",
                        highlightBadge: "highlight-badge"
                    },
                    urls: {
                        productsUrl: "/v1/products",
                        userStatusUrl: "/v1/users/{userid}/subscriptions",
                        paymentPageUrl: "/upgrades/paymentmethods?",
                        mobilePaymentUrl: "/mobile-app-upgrades/buy?",
                        subscribePageUrl: "/premium/membership?ctx=leftnav",
                        termsUrl: "/info/terms",
                        privacyUrl: "/info/privacy",
                        revocationPolicyUrl: "/info/terms#eu-uk-revocation-policy",
                        robuxInfoUrl: "/info/get-robux",
                        billingSettingUrl: "/my/account#!/billing",
                        purchaseWarningUrl: "/purchase-warning/v1/purchase-warnings?",
                        acknowledgePurchaseWarningUrl: "/purchase-warning/v1/purchase-warnings/acknowledge"
                    },
                    pageContext: {
                        robux: "PremiumRobux",
                        subscription: "PremiumSubscriptions",
                        purchaseWarningModal: "purchaseWarningModal"
                    },
                    errorCodes: {
                        productsNotFound: 1,
                        userNotFound: 10,
                        userSubscriptionNotFound: 20,
                        unableToCaculateRobuxGrant: 50,
                        exceedRobuxGrantMax: 51
                    },
                    events: {
                        buyButtonClicked: "Roblox.Membership.buySubscription"
                    },
                    streamEventParams: {
                        active: "active",
                        willExpire: "will_expire",
                        wantMoreBtn: "want_more",
                        robloxHelpLink: "robux_help_page",
                        learnMoreLink: "learn_more_premium",
                        getMoreLink: "get_more_premium",
                        termsOfUseLink: "terms_use_premium",
                        revocationPolicyLink: "revocation_policy_premium",
                        privacyPolicyLink: "privacy_policy_premium",
                        buyBtn: "buy",
                        robuxPackagesTooltip: "robux_package_info",
                        subscriberPremiumTooltip: "subscriber_premium_info",
                        nonSubscriberPremiumTooltip: "non_subscriber_premium_info"
                    },
                    premiumFeatureType: {
                        subscription: "Subscription",
                        robux: "Robux",
                        unknown: "unknown",
                        month: "month"
                    },
                    messages: {
                        upgradeErrorTitle: "Upgrade Unavailable",
                        upgradeErrorBody: "We're sorry, we are unable to change your subscription as we can not currently pay out your remaining Robux balance. Please contact customer support at https://www.roblox.com/support."
                    },
                    subscriptions: {
                        RobloxPremium450: "RobloxPremium450",
                        RobloxPremium1000: "RobloxPremium1000",
                        RobloxPremium2200: "RobloxPremium2200",
                        RobloxPremium450OneMonth: "RobloxPremium450OneMonth",
                        RobloxPremium1000OneMonth: "RobloxPremium1000OneMonth",
                        RobloxPremium2200OneMonth: "RobloxPremium2200OneMonth"
                    },
                    firstTimeRobuxPurchasePackage: {
                        FourtyRobux: "40 Robux"
                    },
                    platformType: {
                        isAndroidApp: "isAndroidApp",
                        isAmazonApp: "isAmazonApp",
                        isIosApp: "isIosApp",
                        isUwpApp: "isUwpApp",
                        isXboxApp: "isXboxApp",
                        isUniversalApp: "isUniversalApp",
                        isDesktop: "isDesktop"
                    },
                    purchaseWarningActions: {
                        U13PaymentModal: "U13PaymentModal",
                        ParentalConsentWarningPaymentModal13To17: "ParentalConsentWarningPaymentModal13To17",
                        U13MonthlyThreshold1Modal: "U13MonthlyThreshold1Modal",
                        RequireEmailVerification: "RequireEmailVerification",
                        U13MonthlyThreshold2Modal: "U13MonthlyThreshold2Modal"
                    },
                    purchaseDevice: {
                        mobile: "mobile",
                        desktop: "desktop"
                    },
                    annualPremiumExp: {
                        layerName: "Payments.AnnualPremium"
                    }
                };
                n(8547).A.constant("premiumConstants", t), r.default = t
            },
            8547: function(e, r, n) {
                "use strict";
                var t = n(7577),
                    o = n(127),
                    o = n.n(o)().module("premium", ["robloxApp"]).config(["languageResourceProvider", function(e) {
                        var r = (new t.TranslationResourceProvider).getTranslationResource("Feature.Premium");
                        e.setTranslationResources([r])
                    }]);
                r.A = o
            },
            8614: function(e, r, n) {
                "use strict";
                n.r(r);
                n = n(8547);

                function t(e, r) {
                    var t = r;
                    return {
                        links: {
                            robuxHelper: t.get("Link.RobuxHelp")
                        },
                        errorMessages: {
                            noData: t.get("Message.NoDataError"),
                            general: t.get("Message.GeneralError")
                        },
                        modalParams: {
                            switchPlan: function(e, r, n) {
                                return {
                                    titleText: t.get("Heading.SwitchPlanModal"),
                                    bodyText: t.get("Message.SwitchPlanBody", {
                                        price: e,
                                        renewalDate: r
                                    }),
                                    actionButtonShow: !0,
                                    actionButtonText: t.get("Label.Confirm"),
                                    neutralButtonText: t.get("Label.Cancel"),
                                    cssClass: n
                                }
                            },
                            alreadyCancelled: function(e) {
                                return {
                                    titleText: t.get("Heading.SubscriptionUnavailable"),
                                    bodyText: t.get("Message.SubscriptionUnavailableModal", {
                                        expiredDate: e
                                    }),
                                    actionButtonShow: !1
                                }
                            },
                            serverError: {
                                titleText: t.get("Heading.ServerError"),
                                bodyText: t.get("Message.ServerError"),
                                actionButtonShow: !1
                            },
                            generalError: {
                                titleText: t.get("Heading.GeneralError"),
                                bodyText: t.get("Message.GeneralError"),
                                actionButtonShow: !1
                            }
                        }
                    }
                }
                t.$inject = ["$log", "languageResource"], n.A.factory("premiumConstantsService", t), r.default = t
            },
            8287: function(e, r, n) {
                "use strict";
                n.r(r);
                var b = n(7577),
                    n = n(8547);

                function t(n, r, o, i, t, u, a, s) {
                    function e(e) {
                        if (!b.EnvironmentUrls || !b.EnvironmentUrls.premiumFeaturesApi) return n(function(e, r) {
                            r({
                                errorMsg: "Url is null. Please try again later."
                            })
                        });
                        var r = {
                            url: b.EnvironmentUrls.premiumFeaturesApi + a.urls.productsUrl
                        };
                        return t.httpGet(r, e)
                    }

                    function l() {
                        return (0, b.DeviceMeta)().isAndroidApp
                    }

                    function p() {
                        return (0, b.DeviceMeta)().isIosApp
                    }

                    function c() {
                        return (0, b.DeviceMeta)().isDesktop && !(0, b.DeviceMeta)().isUWPApp || !(0, b.DeviceMeta)().isAmazonApp && !(0, b.DeviceMeta)().isUWPApp && !(0, b.DeviceMeta)().isIosApp && !(0, b.DeviceMeta)().isAndroidApp
                    }

                    function m() {
                        return (0, b.DeviceMeta)().isAmazonApp || (0, b.DeviceMeta)().isUWPApp || (0, b.DeviceMeta)().isIosApp || (0, b.DeviceMeta)().isAndroidApp
                    }

                    function d() {
                        return n(function(e, r) {
                            r({
                                errorMsg: "Url is null. Please try again later."
                            })
                        })
                    }
                    return {
                        inRobloxApp: function() {
                            return (0, b.DeviceMeta)().isInApp
                        },
                        isIosApp: p,
                        isAndroidApp: l,
                        isWin32App: function() {
                            return (0, b.DeviceMeta)().isWin32App
                        },
                        isInDesktopMode: c,
                        isInAppMode: m,
                        getProductPolicy: function() {
                            return b.Guac.callBehaviour("robux-product-policy")
                        },
                        getSubscriptionPageData: function() {
                            return {
                                subscriptions: [],
                                recurringSubscriptions: [],
                                nonRecurringSubscriptions: [],
                                userPlan: null,
                                errorMessage: null,
                                isInAppMode: m()
                            }
                        },
                        getRobuxPageData: function() {
                            return {
                                robuxs: [],
                                userPlan: null,
                                errorMessage: null,
                                isInAppMode: m(),
                                isInDesktopMode: c(),
                                upsellPackage: null,
                                firstTimePackage: null
                            }
                        },
                        getMembershipProducts: function() {
                            return e({
                                typeName: a.premiumFeatureType.subscription,
                                skipPremiumUserCheck: !0
                            })
                        },
                        getAllProducts: function() {
                            return e()
                        },
                        getUserStatus: function() {
                            if (!b.EnvironmentUrls.premiumFeaturesApi || !b.CurrentUser) return d();
                            var e = {
                                url: b.EnvironmentUrls.premiumFeaturesApi + a.urls.userStatusUrl.replace("{userid}", b.CurrentUser.userId)
                            };
                            return t.httpGet(e)
                        },
                        getPurchaseUrl: function(e, r) {
                            if (!e) return "";
                            var n = {},
                                t = "",
                                t = l() ? (n.id = e.mobileProductId.toLowerCase(), n.recurring = "Subscription" === e.premiumFeatureTypeName && !e.mobileProductId.endsWith("OneMonth"), a.urls.mobilePaymentUrl + o(n)) : (0, b.DeviceMeta)().isAmazonApp || (0, b.DeviceMeta)().isUWPApp ? (n.id = e.mobileProductId.toLowerCase(), a.urls.mobilePaymentUrl + o(n)) : p() ? (n.id = e.mobileProductId, a.urls.mobilePaymentUrl + o(n)) : (n = {
                                    ap: e.productId,
                                    page: r
                                }, a.urls.paymentPageUrl + o(n));
                            return i.getAbsoluteUrl(t)
                        },
                        purchaseSubscription: function(e) {
                            e = a.urls.paymentPageUrl + o(e);
                            r.location.href = i.getAbsoluteUrl(e)
                        },
                        patchSubscription: function(e) {
                            if (!b.EnvironmentUrls.premiumFeaturesApi || !b.CurrentUser) return d();
                            var r = b.EnvironmentUrls.premiumFeaturesApi + a.urls.userStatusUrl.replace("{userid}", b.CurrentUser.userId),
                                r = {
                                    url: r += "?".concat(o({
                                        productId: e
                                    }))
                                };
                            return t.httpPatch(r, e)
                        },
                        getSubscriptionPageUrl: function() {
                            return i.getAbsoluteUrl(a.urls.subscribePageUrl)
                        },
                        getTermsPageUrl: function() {
                            return i.getAbsoluteUrl(a.urls.termsUrl)
                        },
                        getPrivacyPageUrl: function() {
                            return i.getAbsoluteUrl(a.urls.privacyUrl)
                        },
                        getRevocationPolicyUrl: function() {
                            return i.getAbsoluteUrl(a.urls.revocationPolicyUrl)
                        },
                        getBillingSettingUrl: function() {
                            return i.getAbsoluteUrl(a.urls.billingSettingUrl)
                        },
                        sendInteractionClickEvent: function(e, r, n, t, o) {
                            t = {
                                pid: n,
                                from_pid: t
                            };
                            b.FormEvents && b.FormEvents.SendInteractionClick(e, o, r, t)
                        },
                        sendModalClickEvent: function(e, r, n, t) {
                            t = {
                                pid: n,
                                from_pid: t
                            };
                            u.sendModalEvent(e, r, t)
                        },
                        sendModalShownEvent: function(e, r, n) {
                            n = {
                                pid: r,
                                from_pid: n
                            };
                            u.sendModalEvent(e, u.modalActions.shown, n)
                        },
                        sendModalDismissedEvent: function(e, r, n) {
                            n = {
                                pid: r,
                                from_pid: n
                            };
                            u.sendModalEvent(e, u.modalActions.dismissed, n)
                        },
                        getMembershipMapping: function(e) {
                            var r = s;
                            switch (e) {
                                case a.subscriptions.RobloxPremium450:
                                case a.subscriptions.RobloxPremium450OneMonth:
                                    return r.get("Label.RobloxPremium450");
                                case a.subscriptions.RobloxPremium1000:
                                case a.subscriptions.RobloxPremium1000OneMonth:
                                    return r.get("Label.RobloxPremium1000");
                                case a.subscriptions.RobloxPremium2200:
                                case a.subscriptions.RobloxPremium2200OneMonth:
                                    return r.get("Label.RobloxPremium2200");
                                default:
                                    return r.get("Label.RobloxPremium")
                            }
                        },
                        getUsersCurrentPlatform: function() {
                            return (0, b.DeviceMeta)().isAndroidApp ? a.platformType.isAndroidApp : (0, b.DeviceMeta)().isAmazonApp ? a.platformType.isAmazonApp : (0, b.DeviceMeta)().isIosApp ? a.platformType.isIosApp : (0, b.DeviceMeta)().isUWPApp ? a.platformType.isUwpApp : (0, b.DeviceMeta)().isXboxApp ? a.platformType.isXboxApp : (0, b.DeviceMeta)().isUniversalApp ? a.platformType.isUniversalApp : a.platformType.isDesktop
                        },
                        getPurchaseWarning: function(e, r) {
                            r = 1 < arguments.length && void 0 !== r && r;
                            if (!b.EnvironmentUrls || !b.EnvironmentUrls.apiGatewayUrl) return d();
                            r = {
                                productId: e,
                                is13To17ScaryModalEnabled: r
                            }, r = {
                                url: "".concat(b.EnvironmentUrls.apiGatewayUrl).concat(a.urls.purchaseWarningUrl).concat(o(r))
                            };
                            return t.httpGet(r)
                        },
                        acknowledgePurchaseWarning: function(e, r) {
                            if (!b.EnvironmentUrls || !b.EnvironmentUrls.apiGatewayUrl) return d();
                            r = {
                                url: "".concat(b.EnvironmentUrls.apiGatewayUrl).concat(a.urls.acknowledgePurchaseWarningUrl),
                                timeout: r
                            }, e = {
                                acknowledgement: e
                            };
                            return t.httpPost(r, e)
                        }
                    }
                }
                t.$inject = ["$q", "$window", "$httpParamSerializer", "urlService", "httpService", "eventStreamService", "premiumConstants", "languageResource"], n.A.factory("premiumService", t), r.default = t
            },
            7577: function(e) {
                "use strict";
                e.exports = Roblox
            },
            127: function(e) {
                "use strict";
                e.exports = angular
            }
        },
        t = {};

    function o(e) {
        var r = t[e];
        if (void 0 !== r) return r.exports;
        r = t[e] = {
            exports: {}
        };
        return n[e](r, r.exports, o), r.exports
    }
    o.n = function(e) {
            var r = e && e.__esModule ? function() {
                return e.default
            } : function() {
                return e
            };
            return o.d(r, {
                a: r
            }), r
        }, o.d = function(e, r) {
            for (var n in r) o.o(r, n) && !o.o(e, n) && Object.defineProperty(e, n, {
                enumerable: !0,
                get: r[n]
            })
        }, o.o = function(e, r) {
            return Object.prototype.hasOwnProperty.call(e, r)
        }, o.r = function(e) {
            "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
                value: "Module"
            }), Object.defineProperty(e, "__esModule", {
                value: !0
            })
        },
        function() {
            "use strict";
            var e = o(7525);
            o(8547), (0, e.importFilesUnderPath)(o(1006)), (0, e.importFilesUnderPath)(o(9737))
        }()
}();
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/ae8ee5f3f32687bc20b24428959c77b0-premium.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("Premium");
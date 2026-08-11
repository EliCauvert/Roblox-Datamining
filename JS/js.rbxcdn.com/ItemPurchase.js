! function() {
    try {
        var t = "undefined" != typeof window ? window : "undefined" != typeof global ? global : "undefined" != typeof globalThis ? globalThis : "undefined" != typeof self ? self : {};
        t.SENTRY_RELEASE = {
            id: "5960d68f3004fe1e0dcd4f2002dbf68fb28a00f7"
        };
        var r = (new t.Error).stack;
        r && (t._sentryDebugIds = t._sentryDebugIds || {}, t._sentryDebugIds[r] = "c84f1e4f-a29e-4d37-8e73-e4fb936e5f66", t._sentryDebugIdIdentifier = "sentry-dbid-c84f1e4f-a29e-4d37-8e73-e4fb936e5f66")
    } catch (t) {}
}(),
function() {
    "use strict";
    var t = {
            964: function(t, r) {
                Object.defineProperty(r, "__esModule", {
                    value: !0
                });
                var n, i, a, o = {
                        exports: {}
                    },
                    s = o.exports = {};

                function l() {
                    throw Error("setTimeout has not been defined")
                }

                function c() {
                    throw Error("clearTimeout has not been defined")
                }
                try {
                    n = "function" == typeof setTimeout ? setTimeout : l
                } catch (t) {
                    n = l
                }
                try {
                    i = "function" == typeof clearTimeout ? clearTimeout : c
                } catch (t) {
                    i = c
                }

                function u(t) {
                    if (n === setTimeout) return setTimeout(t, 0);
                    if ((n === l || !n) && setTimeout) return n = setTimeout, setTimeout(t, 0);
                    try {
                        return n(t, 0)
                    } catch (r) {
                        try {
                            return n.call(null, t, 0)
                        } catch (r) {
                            return n.call(this, t, 0)
                        }
                    }
                }
                var d = [],
                    f = !1,
                    p = -1;

                function m() {
                    f && a && (f = !1, a.length ? d = a.concat(d) : p = -1, d.length && h())
                }

                function h() {
                    if (!f) {
                        var t = u(m);
                        f = !0;
                        for (var r = d.length; r;) {
                            for (a = d, d = []; ++p < r;) a && a[p].run();
                            p = -1, r = d.length
                        }
                        a = null, f = !1,
                            function(t) {
                                if (i === clearTimeout) return clearTimeout(t);
                                if ((i === c || !i) && clearTimeout) return i = clearTimeout, clearTimeout(t);
                                try {
                                    i(t)
                                } catch (r) {
                                    try {
                                        return i.call(null, t)
                                    } catch (r) {
                                        return i.call(this, t)
                                    }
                                }
                            }(t)
                    }
                }

                function b(t, r) {
                    this.fun = t, this.array = r
                }

                function y() {}

                function v() {}
                s.nextTick = function(t) {
                    var r = Array(arguments.length - 1);
                    if (arguments.length > 1)
                        for (var n = 1; n < arguments.length; n++) r[n - 1] = arguments[n];
                    d.push(new b(t, r)), 1 !== d.length || f || u(h)
                }, b.prototype.run = function() {
                    this.fun.apply(null, this.array)
                }, s.title = "browser", s.browser = !0, s.env = {}, s.argv = [], s.version = "", s.versions = {}, s.on = y, s.addListener = y, s.once = y, s.off = y, s.removeListener = y, s.removeAllListeners = y, s.emit = y, s.prependListener = y, s.prependOnceListener = y, s.listeners = function(t) {
                    return []
                }, s.binding = function(t) {
                    throw Error("process.binding is not supported")
                }, s.cwd = function() {
                    return "/"
                }, s.chdir = function(t) {
                    throw Error("process.chdir is not supported")
                }, s.umask = function() {
                    return 0
                };
                var g = o.exports.browser,
                    w = o.exports.binding,
                    x = {},
                    S = "browser",
                    P = "browser",
                    E = "browser",
                    I = [],
                    A = {
                        nextTick: o.exports.nextTick,
                        title: o.exports.title,
                        browser: g,
                        env: o.exports.env,
                        argv: o.exports.argv,
                        version: o.exports.version,
                        versions: o.exports.versions,
                        on: o.exports.on,
                        addListener: o.exports.addListener,
                        once: o.exports.once,
                        off: o.exports.off,
                        removeListener: o.exports.removeListener,
                        removeAllListeners: o.exports.removeAllListeners,
                        emit: o.exports.emit,
                        emitWarning: v,
                        prependListener: o.exports.prependListener,
                        prependOnceListener: o.exports.prependOnceListener,
                        listeners: o.exports.listeners,
                        binding: w,
                        cwd: o.exports.cwd,
                        chdir: o.exports.chdir,
                        umask: o.exports.umask,
                        exit: v,
                        pid: 1,
                        features: x,
                        kill: v,
                        dlopen: v,
                        uptime: v,
                        memoryUsage: v,
                        uvCounters: v,
                        platform: S,
                        arch: P,
                        execPath: E,
                        execArgv: I
                    };
                r.addListener = o.exports.addListener, r.arch = P, r.argv = o.exports.argv, r.binding = w, r.browser = g, r.chdir = o.exports.chdir, r.cwd = o.exports.cwd, r.default = A, r.dlopen = v, r.emit = o.exports.emit, r.emitWarning = v, r.env = o.exports.env, r.execArgv = I, r.execPath = E, r.exit = v, r.features = x, r.kill = v, r.listeners = o.exports.listeners, r.memoryUsage = v, r.nextTick = o.exports.nextTick, r.off = o.exports.off, r.on = o.exports.on, r.once = o.exports.once, r.pid = 1, r.platform = S, r.prependListener = o.exports.prependListener, r.prependOnceListener = o.exports.prependOnceListener, r.removeAllListeners = o.exports.removeAllListeners, r.removeListener = o.exports.removeListener, r.title = o.exports.title, r.umask = o.exports.umask, r.uptime = v, r.uvCounters = v, r.version = o.exports.version, r.versions = o.exports.versions, r = t.exports = A
            },
            620: function(t, r, n) {
                t.exports = {}
            },
            405: function(t, r, n) {
                t.exports = {}
            }
        },
        r = {};

    function n(i) {
        var a = r[i];
        if (void 0 !== a) return a.exports;
        var o = r[i] = {
            exports: {}
        };
        return t[i](o, o.exports, n), o.exports
    }
    n.m = t, n.n = function(t) {
        var r = t && t.__esModule ? function() {
            return t.default
        } : function() {
            return t
        };
        return n.d(r, {
            a: r
        }), r
    }, n.d = function(t, r) {
        for (var i in r) n.o(r, i) && !n.o(t, i) && Object.defineProperty(t, i, {
            enumerable: !0,
            get: r[i]
        })
    }, n.k = function(t) {
        return "" + t + ".css"
    }, n.g = function() {
        if ("object" == typeof globalThis) return globalThis;
        try {
            return this || Function("return this")()
        } catch (t) {
            if ("object" == typeof window) return window
        }
    }(), n.o = function(t, r) {
        return Object.prototype.hasOwnProperty.call(t, r)
    }, n.r = function(t) {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(t, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(t, "__esModule", {
            value: !0
        })
    }, n.nc = void 0, n.rv = function() {
        return "1.5.7"
    }, n.g.importScripts && (i = n.g.location + "");
    var i, a = n.g.document;
    if (!i && a && (a.currentScript && "SCRIPT" === a.currentScript.tagName.toUpperCase() && (i = a.currentScript.src), !i)) {
        var o = a.getElementsByTagName("script");
        if (o.length)
            for (var s = o.length - 1; s > -1 && (!i || !/^http(s?):/.test(i));) i = o[s--].src
    }
    if (!i) throw Error("Automatic publicPath is not supported in this browser");
    n.p = i.replace(/^blob:/, "").replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/[^\/]+$/, "/"), n.ruid = "bundler=rspack@1.5.7",
        function() {
            var t, r, i, a, o = window.ReactJSX,
                s = window.Roblox["core-scripts"].util.ready,
                l = n.n(s),
                c = window.Roblox["core-scripts"].react,
                u = window.React,
                d = n.n(u),
                f = window.PropTypes,
                p = n.n(f),
                m = window.ReactStyleGuide,
                h = {
                    common: ["IAPExperience.PurchaseError", "Feature.NotApproved", "Feature.RobloxSubscription"],
                    feature: "Purchasing.PurchaseDialog"
                },
                b = {
                    common: [],
                    feature: "Feature.Item"
                },
                y = {
                    transactionFailure: "TransactionFailureView",
                    insufficientFunds: "InsufficientFundsView",
                    priceChanged: "PriceChangedView",
                    pendingProductsLimitExceeded: "PendingProductsLimitExceeded"
                },
                v = {
                    freeLabel: "Label.Free",
                    okAction: "Action.Ok",
                    insufficientFundsHeading: "Heading.InsufficientFunds",
                    insufficientFundsMessage: "Message.InsufficientFunds",
                    doneAction: "Action.Done",
                    cancelAction: "Action.Cancel",
                    buyRobuxAction: "Action.BuyRobux",
                    buyAccessAction: "Action.BuyAccess",
                    buyItemHeading: "Heading.BuyItem",
                    buyNowAction: "Action.BuyNow",
                    buyExperience: "Title.BuyExperience",
                    getItemHeading: "Heading.GetItem",
                    getNowAction: "Action.GetNow",
                    priceChangedHeading: "Heading.PriceChanged",
                    priceChangedMessage: "Message.PriceChanged",
                    balanceAfterMessage: "Message.BalanceAfter",
                    agreeAndPayLabel: "Label.AgreeAndPay",
                    promptGetFreeAccessMessage: "Message.PromptGetFreeAccess",
                    promptGetFreeMessage: "Message.PromptGetFree",
                    promptBuyAccessMessage: "Message.PromptBuyAccess",
                    promptBuyMessage: "Message.PromptBuy",
                    promptBuySimplifiedMessage: "Message.PromptBuySimplified",
                    configureAction: "Action.Customize",
                    notNowAction: "Action.NotNow",
                    customizeAction: "Action.Customize",
                    continueAction: "Action.Continue",
                    purchaseCompleteHeading: "Heading.PurchaseComplete",
                    successfullyBoughtAccessMessage: "Message.SuccessfullyBoughtAccess",
                    successfullyBoughtMessage: "Message.SuccessfullyBought",
                    successfullyRenewedAccessMessage: "Message.SuccessfullyRenewedAccess",
                    successfullyRenewedMessage: "Message.SuccessfullyRenewed",
                    successfullyAcquiredAccessMessage: "Message.SuccessfullyAcquiredAccess",
                    successfullyAcquiredMessage: "Message.SuccessfullyAcquired",
                    itemGrantDelayMessage: "Message.ItemGrantDelay",
                    errorOccuredHeading: "Heading.ErrorOccured",
                    purchasingUnavailableMessage: "Message.PurchasingUnavailable",
                    buyAction: "Action.Buy",
                    installAction: "Action.Install",
                    getAction: "Action.Get",
                    bestPriceLabel: "Label.BestPrice",
                    priceLabel: "Label.Price",
                    premiumDiscountOpportunityPromptLabel: "Label.PremiumDiscountOpportunityPrompt",
                    premiumDiscountSavingsLabel: "Label.PremiumDiscountSavings",
                    premiumExclusiveEligiblePromptLabel: "Label.PremiumExclusiveEligiblePrompt",
                    premiumExclusiveIneligiblePromptLabel: "Label.PremiumExclusiveIneligiblePrompt",
                    getPremiumAction: "Action.GetPremium",
                    itemNotCurrentlyForSaleLabel: "Label.ItemNotCurrentlyForSale",
                    itemNoLongerForSaleLabel: "Label.ItemNoLongerForSale",
                    purchasingTemporarilyUnavailableLabel: "Label.PurchasingTemporarilyUnavailable",
                    itemAvailableInventoryLabel: "Label.ItemAvailableInventory",
                    noOneCurrentlySellingLabel: "Label.NoOneCurrentlySelling",
                    inventoryAction: "Action.Inventory",
                    OffsaleCountdownHourMinuteSecondLabel: "Label.OffsaleCountdownHourMinuteSecond",
                    CountdownTimerDayHourMinute: "Label.CountdownTimerDayHourMinute",
                    batchBuyItemHeading: "Heading.BuyItems",
                    batchBuyPromptMessage: "Message.PromptBatchBuy",
                    batchBuyBalanceAfterMessage: "Message.BalanceAfter",
                    purchaseCompletedMessage: "Heading.PurchaseCompleted",
                    generalPurchaseErrorMessage: "Heading.GeneralError",
                    batchBuyPartialSuccessGeneralFailureMessage: "Heading.PartialSuccessGeneralFailure",
                    batchBuyPartialSuccessItemsOwnedFailureMessage: "Heading.PartialSuccessItemsOwnedFailure",
                    batchBuyPartialSuccessInsufficientFundsFailureMessage: "Heading.PartialSuccessInsufficientFundsFailure",
                    batchBuyPartialSuccessNetworkErrorFailureMessage: "Heading.PartialSuccessNetworkErrorFailure",
                    batchBuyPartialSuccessFloodcheckFailureMessage: "Heading.PartialSuccessFloodcheckFailure",
                    purchaseErrorFailureMessage: "Heading.PurchaseFailure",
                    batchBuyItemsOwnedFailureMessage: "Heading.ItemsOwnedFailure",
                    insufficientFundsFailureMessage: "Heading.InsufficientFundsFailure",
                    networkErrroFailureMessage: "Heading.NetworkErrorFailure",
                    floodcheckFailureMessage: "Heading.FloodcheckFailure",
                    batchBuyPartialSuccessPremiumNeededFailureMessage: "Heading.PartialSuccessPremiumNeededFailure",
                    batchBuyPartialSuccessNoSellersFailureMessage: "Heading.PartialSuccessNoSellersFailure",
                    premiumNeededFailureMessage: "Heading.PremiumNeededFailure",
                    noSellersFailureMessage: "Heading.NoSellersFailure",
                    batchBuyPartialSuccessInExperienceOnlyFailureMessage: "Heading.PartialSuccessInExperienceOnlyFailure",
                    inExperienceOnlyFailureMessage: "Heading.InExperienceOnlyFailure",
                    redirectToPartnerWebsiteMessage: "Description.RedirectToPartnerWebsite",
                    continueToPaymentAction: "Action.ContinueToPayment",
                    leavingRobloxHeading: "Heading.LeavingRoblox",
                    pendingDeveloperProductLimitReachedMessage: "Message.PendingDeveloperProductLimitReached",
                    pendingDeveloperProductLimitReachedHeading: "Heading.PendingDeveloperProductLimitReached",
                    additionalRobuxNeeded: "Message.AdditionalRobux",
                    economicRestrictionsErrorHeading: "Heading.EconomicRestrictionsError",
                    timedOptionDaysAbbreviation: "Label.TimedOptionDaysAbbreviation",
                    timedOptionDaysTimerStartsWhenYouBuy: "Label.TimedOptionDaysTimerStartsWhenYouBuy",
                    unifiedPurchaseCompletionMessage: "Message.UnifiedPurchaseCompletion"
                },
                g = {
                    Plugin: 38,
                    Decal: 13,
                    Model: 10,
                    Video: 62,
                    MeshPart: 40,
                    Place: 9,
                    Badge: 21,
                    GamePass: 34,
                    Animation: 24
                },
                w = {
                    insufficientFunds: "InsufficientFunds",
                    retryErrorMessage: "Failed to determine purchasability status. Please try again by refreshing.",
                    notForSale: "NotForSale",
                    unauthorizedMessage: "Unauthorized",
                    twoStepVerificationRequired: "TwoStepVerificationRequired"
                },
                x = {
                    FraudPaymentAuthorizationAttempt: "Label.Sublabel.FraudPaymentAbuse",
                    FraudVirtualEconomyAbuse: "Label.Sublabel.FraudVirtualEconomyAbuse",
                    FraudAbuseOfAffiliateSystem: "Label.Sublabel.FraudAbuseOfTheAffiliateSystem",
                    FraudAttemptedUnauthorizedPaymentMethodUse: "Label.Sublabel.FraudAttemptedUnauthorizedPaymentMethodUse",
                    FraudRepeatedRefundRequests: "Label.Sublabel.FraudRepeatedRefundRequests",
                    FraudSuspiciousRefundRequests: "Label.Sublabel.FraudSuspiciousRefundRequests",
                    FraudUnauthorizedPurchase: "Label.Sublabel.FraudUnauthorizedPurchase",
                    FraudUseOfUnauthorizedOffPlatformTransactions: "Label.Sublabel.FraudUseOfUnauthorizedOffPlatformTransactions",
                    FraudUseOfUnauthorizedPaymentMethod: "Label.Sublabel.FraudUseOfUnauthorizedPaymentMethod",
                    FraudSuspiciousAccountPatterns: "Label.Sublabel.FraudSuspiciousAccountPatterns",
                    FraudChargeback: "Label.AbuseType.Chargeback"
                };

            function S(t, r) {
                (null == r || r > t.length) && (r = t.length);
                for (var n = 0, i = Array(r); n < r; n++) i[n] = t[n];
                return i
            }

            function P() {
                var t, r = (t = (0, m.createModal)(), function(t) {
                        if (Array.isArray(t)) return t
                    }(t) || function(t, r) {
                        var n, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                        if (null != a) {
                            var o = [],
                                s = !0,
                                l = !1;
                            try {
                                for (a = a.call(t); !(s = (n = a.next()).done) && (o.push(n.value), o.length !== r); s = !0);
                            } catch (t) {
                                l = !0, i = t
                            } finally {
                                try {
                                    s || null == a.return || a.return()
                                } finally {
                                    if (l) throw i
                                }
                            }
                            return o
                        }
                    }(t, 2) || function(t, r) {
                        if (t) {
                            if ("string" == typeof t) return S(t, 2);
                            var n = Object.prototype.toString.call(t).slice(8, -1);
                            if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return S(t, r)
                        }
                    }(t, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    n = r[0],
                    i = r[1];

                function a(t) {
                    var r = t.translate,
                        i = t.title,
                        a = t.message,
                        s = t.onDecline,
                        l = (0, o.jsx)("div", {
                            className: "modal-message",
                            children: a
                        });
                    return (0, o.jsx)(n, {
                        title: i,
                        body: l,
                        thumbnail: (0, o.jsx)("span", {
                            className: "icon-warning-orange-150x150"
                        }),
                        neutralButtonText: r(v.okAction),
                        onNeutral: s,
                        actionButtonShow: !1
                    })
                }
                return a.defaultProps = {
                    onDecline: null
                }, a.propTypes = {
                    translate: p().func.isRequired,
                    title: p().string.isRequired,
                    message: p().string.isRequired,
                    onDecline: p().func
                }, [(0, c.withTranslations)(a, h), i]
            }
            var E = window.ReactDOMServer,
                I = window.CoreRobloxUtilities,
                A = window.Roblox["core-scripts"].environmentUrls,
                T = window.CoreUtilities,
                O = A.EnvironmentUrls.economyApi,
                j = A.EnvironmentUrls.catalogApi,
                N = A.EnvironmentUrls.apiGatewayUrl,
                R = A.EnvironmentUrls.twoStepVerificationApi,
                C = A.EnvironmentUrls.vngGamesShopUrl,
                M = function(t) {
                    return T.urlService.getUrlWithQueries("/Upgrades/Robux.aspx", {
                        ctx: t
                    })
                },
                D = function(t, r) {
                    return "/premium/membership?ctx=WebItemDetail&upsellTargetType=".concat(r, "&upsellTargetId=").concat(t)
                },
                k = function() {
                    return C
                },
                F = window.Roblox["core-scripts"].format.number;

            function L(t) {
                var r = t.translate,
                    n = t.price,
                    i = t.color,
                    a = t.useFreeText;
                return 0 === n && a ? (0, o.jsx)("span", {
                    className: "text-robux text-free",
                    children: r(v.freeLabel)
                }) : (0, o.jsxs)(d().Fragment, {
                    children: [(0, o.jsx)("span", {
                        className: "icon-robux".concat(i ? "-".concat(i) : "", "-16x16")
                    }), (0, o.jsx)("span", {
                        className: "text-robux",
                        children: (0, F.formatNumber)(n)
                    })]
                })
            }
            L.defaultProps = {
                color: "",
                useFreeText: !0
            }, L.propTypes = {
                price: p().number.isRequired,
                translate: p().func.isRequired,
                color: p().string,
                useFreeText: p().bool
            };
            var _ = (0, c.withTranslations)(L, h);

            function U(t, r) {
                (null == r || r > t.length) && (r = t.length);
                for (var n = 0, i = Array(r); n < r; n++) i[n] = t[n];
                return i
            }

            function B() {
                var t, r = (t = (0, m.createModal)(), function(t) {
                        if (Array.isArray(t)) return t
                    }(t) || function(t, r) {
                        var n, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                        if (null != a) {
                            var o = [],
                                s = !0,
                                l = !1;
                            try {
                                for (a = a.call(t); !(s = (n = a.next()).done) && (o.push(n.value), o.length !== r); s = !0);
                            } catch (t) {
                                l = !0, i = t
                            } finally {
                                try {
                                    s || null == a.return || a.return()
                                } finally {
                                    if (l) throw i
                                }
                            }
                            return o
                        }
                    }(t, 2) || function(t, r) {
                        if (t) {
                            if ("string" == typeof t) return U(t, 2);
                            var n = Object.prototype.toString.call(t).slice(8, -1);
                            if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return U(t, r)
                        }
                    }(t, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    n = r[0],
                    i = r[1];

                function a(t) {
                    var r = t.translate,
                        i = t.robuxNeeded,
                        a = t.source,
                        s = t.onAccept,
                        l = (0, o.jsx)("div", {
                            className: "modal-message",
                            dangerouslySetInnerHTML: {
                                __html: r(v.insufficientFundsMessage, {
                                    robux: (0, E.renderToString)((0, o.jsx)(_, {
                                        price: i
                                    }))
                                })
                            }
                        });
                    return i || (l = (0, o.jsxs)("div", {
                        children: [" ", r(v.additionalRobuxNeeded)]
                    })), (0, o.jsx)(n, {
                        title: r(v.insufficientFundsHeading),
                        body: l,
                        thumbnail: (0, o.jsx)("span", {
                            className: "money-stack-icon"
                        }),
                        neutralButtonText: r(v.cancelAction),
                        actionButtonText: r(v.buyRobuxAction),
                        onAction: function() {
                            return I.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(I.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, I.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBUX_UPSELL, I.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, I.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.BUY_ROBUX), s ? s() : window.location = M(a), !1
                        },
                        onClose: function() {
                            I.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(I.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, I.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBUX_UPSELL, I.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, I.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.CANCEL)
                        },
                        actionButtonShow: !0
                    })
                }
                return a.defaultProps = {
                    onAccept: null,
                    source: ""
                }, a.propTypes = {
                    translate: p().func.isRequired,
                    source: p().string,
                    onAccept: p().func,
                    robuxNeeded: p().number.isRequired
                }, [(0, c.withTranslations)(a, h), i]
            }
            var q = function() {
                var t = document.getElementById("ItemPurchaseAjaxData");
                return t ? {
                    userRobuxBalance: parseInt(t.getAttribute("data-user-balance-robux"), 10),
                    userBc: parseInt(t.getAttribute("data-user-bc"), 10),
                    hasCurrencyServiceError: "True" === t.getAttribute("data-has-currency-service-error"),
                    currencyServiceErrorMessage: t.getAttribute("data-currency-service-error-message")
                } : {}
            };

            function z(t) {
                var r = t.translate,
                    n = t.expectedPrice,
                    i = t.currentRobuxBalance,
                    a = null != i ? i : q().userRobuxBalance;
                return i ? (0, o.jsx)("span", {
                    dangerouslySetInnerHTML: {
                        __html: r(v.balanceAfterMessage, {
                            robuxBalance: (0, E.renderToString)((0, o.jsx)(_, {
                                price: a - n,
                                color: "gray",
                                useFreeText: !1
                            }))
                        })
                    }
                }) : (0, o.jsx)("span", {})
            }
            z.propTypes = {
                expectedPrice: p().number.isRequired,
                currentRobuxBalance: p().number,
                translate: p().func.isRequired
            }, z.defaultProps = {
                currentRobuxBalance: void 0
            };
            var V = (0, c.withTranslations)(z, h);

            function G(t, r) {
                (null == r || r > t.length) && (r = t.length);
                for (var n = 0, i = Array(r); n < r; n++) i[n] = t[n];
                return i
            }

            function H(t, r) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, r) {
                    var n, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var o = [],
                            s = !0,
                            l = !1;
                        try {
                            for (a = a.call(t); !(s = (n = a.next()).done) && (o.push(n.value), !r || o.length !== r); s = !0);
                        } catch (t) {
                            l = !0, i = t
                        } finally {
                            try {
                                s || null == a.return || a.return()
                            } finally {
                                if (l) throw i
                            }
                        }
                        return o
                    }
                }(t, r) || function(t, r) {
                    if (t) {
                        if ("string" == typeof t) return G(t, r);
                        var n = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return G(t, r)
                    }
                }(t, r) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function W() {
                var t = H((0, m.createModal)(), 2),
                    r = t[0],
                    n = t[1];

                function i(t) {
                    var n = t.translate,
                        i = t.expectedPrice,
                        a = t.currentPrice,
                        s = t.onAction,
                        l = t.loading,
                        c = H((0, u.useState)(!1), 2),
                        f = c[0],
                        p = c[1],
                        m = (0, o.jsxs)(d().Fragment, {
                            children: [(0, o.jsx)("div", {
                                className: "modal-message",
                                dangerouslySetInnerHTML: {
                                    __html: n(v.priceChangedMessage, {
                                        robuxBefore: (0, E.renderToString)((0, o.jsx)(_, {
                                            price: i,
                                            color: "gray"
                                        })),
                                        robuxAfter: (0, E.renderToString)((0, o.jsx)(_, {
                                            price: a,
                                            color: "gray"
                                        }))
                                    })
                                }
                            }), (0, o.jsxs)("div", {
                                className: "modal-checkbox checkbox",
                                children: [(0, o.jsx)("input", {
                                    id: "modal-checkbox-input",
                                    name: "agreementCheckBox",
                                    type: "checkbox",
                                    checked: f
                                }), (0, o.jsx)("label", {
                                    onClick: function() {
                                        return p(!f)
                                    },
                                    htmlFor: "modal-checkbox-input",
                                    children: n(v.agreeAndPayLabel)
                                })]
                            })]
                        });
                    return (0, o.jsx)(r, {
                        title: n(v.priceChangedHeading),
                        body: m,
                        neutralButtonText: n(v.cancelAction),
                        actionButtonText: n(v.buyRobuxAction),
                        onAction: s,
                        loading: l,
                        disableActionButton: !f,
                        footerText: (0, o.jsx)(V, {
                            expectedPrice: a
                        }),
                        actionButtonShow: !0
                    })
                }
                return i.defaultProps = {
                    loading: !1
                }, i.propTypes = {
                    translate: p().func.isRequired,
                    expectedPrice: p().number.isRequired,
                    currentPrice: p().number.isRequired,
                    onAction: p().func.isRequired,
                    loading: p().bool
                }, [(0, c.withTranslations)(i, h), n]
            }
            var X = window.Roblox["core-scripts"].format.string;

            function K(t) {
                var r = t.name;
                return (0, o.jsx)("span", {
                    className: "font-bold",
                    children: r
                })
            }

            function Y(t, r) {
                (null == r || r > t.length) && (r = t.length);
                for (var n = 0, i = Array(r); n < r; n++) i[n] = t[n];
                return i
            }
            K.propTypes = {
                name: p().string.isRequired
            };

            function $() {
                var t, r = (t = (0, m.createModal)(), function(t) {
                        if (Array.isArray(t)) return t
                    }(t) || function(t, r) {
                        var n, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                        if (null != a) {
                            var o = [],
                                s = !0,
                                l = !1;
                            try {
                                for (a = a.call(t); !(s = (n = a.next()).done) && (o.push(n.value), o.length !== r); s = !0);
                            } catch (t) {
                                l = !0, i = t
                            } finally {
                                try {
                                    s || null == a.return || a.return()
                                } finally {
                                    if (l) throw i
                                }
                            }
                            return o
                        }
                    }(t, 2) || function(t, r) {
                        if (t) {
                            if ("string" == typeof t) return Y(t, 2);
                            var n = Object.prototype.toString.call(t).slice(8, -1);
                            if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return Y(t, r)
                        }
                    }(t, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    n = r[0],
                    i = r[1];

                function a(t) {
                    var r, i, a = t.translate,
                        s = t.title,
                        l = t.expectedPrice,
                        c = t.displayPrice,
                        u = t.thumbnail,
                        d = t.assetName,
                        f = t.assetType,
                        p = t.assetTypeDisplayName,
                        m = t.sellerName,
                        h = t.isPlace,
                        b = t.onAction,
                        y = t.loading,
                        g = t.currentRobuxBalance,
                        w = !!("Subscription" === f && c),
                        x = {
                            assetName: (0, E.renderToString)((0, o.jsx)(K, {
                                name: d
                            })),
                            assetType: p || f,
                            seller: (0, X.escapeHtml)(m),
                            robux: w ? '<span class="text-robux">'.concat((0, X.escapeHtml)(c), "</span>") : (0, E.renderToString)((0, o.jsx)(_, {
                                price: l
                            }))
                        },
                        S = h ? v.promptBuyAccessMessage : v.promptBuyMessage;
                    h || "" !== x.seller || (S = v.promptBuySimplifiedMessage), w || 0 === l ? (r = a(v.getItemHeading), i = a(v.getNowAction)) : (r = a(v.buyItemHeading), i = a(v.buyNowAction)), w && (r = a(v.buyItemHeading), i = a(v.buyNowAction)), h && (i = a(v.buyAccessAction));
                    var P = (0, o.jsx)("div", {
                        className: "modal-message",
                        dangerouslySetInnerHTML: {
                            __html: a(S, x)
                        }
                    });
                    return (0, o.jsx)(n, {
                        title: s || r,
                        body: P,
                        thumbnail: u,
                        neutralButtonText: a(v.cancelAction),
                        actionButtonText: i,
                        onAction: b,
                        footerText: w ? null : (0, o.jsx)(V, {
                            expectedPrice: l,
                            currentRobuxBalance: g
                        }),
                        loading: y,
                        actionButtonShow: !0
                    })
                }
                return a.defaultProps = {
                    isPlace: !1,
                    assetTypeDisplayName: "",
                    title: "",
                    loading: !1,
                    currentRobuxBalance: void 0,
                    displayPrice: ""
                }, a.propTypes = {
                    translate: p().func.isRequired,
                    title: p().string,
                    expectedPrice: p().number.isRequired,
                    displayPrice: p().string,
                    thumbnail: p().node.isRequired,
                    assetName: p().string.isRequired,
                    assetType: p().string.isRequired,
                    assetTypeDisplayName: p().string,
                    sellerName: p().string.isRequired,
                    isPlace: p().bool,
                    onAction: p().func.isRequired,
                    loading: p().bool,
                    currentRobuxBalance: p().number
                }, [(0, c.withTranslations)(a, h), i]
            }
            var J = function() {
                return (J = Object.assign || function(t) {
                    for (var r, n = 1, i = arguments.length; n < i; n++)
                        for (var a in r = arguments[n]) Object.prototype.hasOwnProperty.call(r, a) && (t[a] = r[a]);
                    return t
                }).apply(this, arguments)
            };

            function Q(t, r) {
                var n = {};
                for (var i in t) Object.prototype.hasOwnProperty.call(t, i) && 0 > r.indexOf(i) && (n[i] = t[i]);
                if (null != t && "function" == typeof Object.getOwnPropertySymbols) {
                    var a = 0;
                    for (i = Object.getOwnPropertySymbols(t); a < i.length; a++) 0 > r.indexOf(i[a]) && Object.prototype.propertyIsEnumerable.call(t, i[a]) && (n[i[a]] = t[i[a]])
                }
                return n
            }
            var Z = function() {
                for (var t, r, n = 0, i = "", a = arguments.length; n < a; n++)(t = arguments[n]) && (r = function t(r) {
                    var n, i, a = "";
                    if ("string" == typeof r || "number" == typeof r) a += r;
                    else if ("object" == (void 0 === r ? "undefined" : r && "undefined" != typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r))
                        if (Array.isArray(r)) {
                            var o = r.length;
                            for (n = 0; n < o; n++) r[n] && (i = t(r[n])) && (a && (a += " "), a += i)
                        } else
                            for (i in r) r[i] && (a && (a += " "), a += i);
                    return a
                }(t)) && (i && (i += " "), i += r);
                return i
            };

            function ee(t, r) {
                (null == r || r > t.length) && (r = t.length);
                for (var n = 0, i = Array(r); n < r; n++) i[n] = t[n];
                return i
            }
            var et = (null == (eE = globalThis) ? void 0 : eE.document) ? u.useLayoutEffect : function() {},
                er = u[" useId ".trim().toString()] || function() {},
                en = 0;

            function ei(t) {
                var r, n = (r = u.useState(er()), function(t) {
                        if (Array.isArray(t)) return t
                    }(r) || function(t, r) {
                        var n, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                        if (null != a) {
                            var o = [],
                                s = !0,
                                l = !1;
                            try {
                                for (a = a.call(t); !(s = (n = a.next()).done) && (o.push(n.value), o.length !== r); s = !0);
                            } catch (t) {
                                l = !0, i = t
                            } finally {
                                try {
                                    s || null == a.return || a.return()
                                } finally {
                                    if (l) throw i
                                }
                            }
                            return o
                        }
                    }(r, 2) || function(t, r) {
                        if (t) {
                            if ("string" == typeof t) return ee(t, 2);
                            var n = Object.prototype.toString.call(t).slice(8, -1);
                            if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return ee(t, r)
                        }
                    }(r, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    i = n[0],
                    a = n[1];
                return et(function() {
                    t || a(function(t) {
                        return null != t ? t : String(en++)
                    })
                }, [t]), t || (i ? "radix-".concat(i) : "")
            }
            var ea = window.ReactDOM,
                eo = n.n(ea);

            function es(t, r) {
                (null == r || r > t.length) && (r = t.length);
                for (var n = 0, i = Array(r); n < r; n++) i[n] = t[n];
                return i
            }

            function el(t, r, n) {
                return r in t ? Object.defineProperty(t, r, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[r] = n, t
            }

            function ec(t, r) {
                return null != r && "undefined" != typeof Symbol && r[Symbol.hasInstance] ? !!r[Symbol.hasInstance](t) : t instanceof r
            }

            function eu(t) {
                for (var r = 1; r < arguments.length; r++) {
                    var n = null != arguments[r] ? arguments[r] : {},
                        i = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (i = i.concat(Object.getOwnPropertySymbols(n).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(n, t).enumerable
                    }))), i.forEach(function(r) {
                        el(t, r, n[r])
                    })
                }
                return t
            }

            function ed(t, r) {
                return r = null != r ? r : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(r)) : (function(t, r) {
                    var n = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var i = Object.getOwnPropertySymbols(t);
                        n.push.apply(n, i)
                    }
                    return n
                })(Object(r)).forEach(function(n) {
                    Object.defineProperty(t, n, Object.getOwnPropertyDescriptor(r, n))
                }), t
            }

            function ef(t, r) {
                if (null == t) return {};
                var n, i, a = function(t, r) {
                    if (null == t) return {};
                    var n, i, a = {},
                        o = Object.keys(t);
                    for (i = 0; i < o.length; i++) n = o[i], r.indexOf(n) >= 0 || (a[n] = t[n]);
                    return a
                }(t, r);
                if (Object.getOwnPropertySymbols) {
                    var o = Object.getOwnPropertySymbols(t);
                    for (i = 0; i < o.length; i++) n = o[i], !(r.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(t, n) && (a[n] = t[n])
                }
                return a
            }

            function ep(t, r) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, r) {
                    var n, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var o = [],
                            s = !0,
                            l = !1;
                        try {
                            for (a = a.call(t); !(s = (n = a.next()).done) && (o.push(n.value), !r || o.length !== r); s = !0);
                        } catch (t) {
                            l = !0, i = t
                        } finally {
                            try {
                                s || null == a.return || a.return()
                            } finally {
                                if (l) throw i
                            }
                        }
                        return o
                    }
                }(t, r) || eh(t, r) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function em(t) {
                return function(t) {
                    if (Array.isArray(t)) return es(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || eh(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function eh(t, r) {
                if (t) {
                    if ("string" == typeof t) return es(t, r);
                    var n = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return es(t, r)
                }
            }

            function eb(t, r) {
                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    i = n.checkForDefaultPrevented,
                    a = void 0 === i || i;
                return function(n) {
                    if (null == t || t(n), !1 === a || !n.defaultPrevented) return null == r ? void 0 : r(n)
                }
            }

            function ey(t, r) {
                if ("function" == typeof t) return t(r);
                null != t && (t.current = r)
            }

            function ev() {
                for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                return function(t) {
                    var n = !1,
                        i = r.map(function(r) {
                            var i = ey(r, t);
                            return n || "function" != typeof i || (n = !0), i
                        });
                    if (n) return function() {
                        for (var t = 0; t < i.length; t++) {
                            var n = i[t];
                            "function" == typeof n ? n() : ey(r[t], null)
                        }
                    }
                }
            }

            function eg() {
                for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                return u.useCallback(ev.apply(void 0, em(r)), r)
            }
            var ew = Symbol("radix.slottable");

            function ex(t) {
                return u.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === ew
            }
            var eS = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, r) {
                var n, i, a, s, l, c = (i = n = "Primitive.".concat(r), (a = u.forwardRef(function(t, r) {
                        var n = t.children,
                            i = ef(t, ["children"]);
                        if (u.isValidElement(n)) {
                            var a, o, s, l = (s = null == (a = Object.getOwnPropertyDescriptor(n.props, "ref")) ? void 0 : a.get) && "isReactWarning" in s && s.isReactWarning ? n.ref : (s = null == (o = Object.getOwnPropertyDescriptor(n, "ref")) ? void 0 : o.get) && "isReactWarning" in s && s.isReactWarning ? n.props.ref : n.props.ref || n.ref,
                                c = function(t, r) {
                                    var n = eu({}, r);
                                    for (var i in r) ! function(i) {
                                        var a = t[i],
                                            o = r[i];
                                        /^on[A-Z]/.test(i) ? a && o ? n[i] = function() {
                                            for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                                            o.apply(void 0, em(r)), a.apply(void 0, em(r))
                                        } : a && (n[i] = a) : "style" === i ? n[i] = eu({}, a, o) : "className" === i && (n[i] = [a, o].filter(Boolean).join(" "))
                                    }(i);
                                    return eu({}, t, n)
                                }(i, n.props);
                            return n.type !== u.Fragment && (c.ref = r ? ev(r, l) : l), u.cloneElement(n, c)
                        }
                        return u.Children.count(n) > 1 ? u.Children.only(null) : null
                    })).displayName = "".concat(i, ".SlotClone"), s = a, (l = u.forwardRef(function(t, r) {
                        var n = t.children,
                            i = ef(t, ["children"]),
                            a = u.Children.toArray(n),
                            l = a.find(ex);
                        if (l) {
                            var c = l.props.children,
                                d = a.map(function(t) {
                                    return t === l ? u.Children.count(c) > 1 ? u.Children.only(null) : u.isValidElement(c) ? c.props.children : null : t
                                });
                            return (0, o.jsx)(s, ed(eu({}, i), {
                                ref: r,
                                children: u.isValidElement(c) ? u.cloneElement(c, void 0, d) : null
                            }))
                        }
                        return (0, o.jsx)(s, ed(eu({}, i), {
                            ref: r,
                            children: n
                        }))
                    })).displayName = "".concat(n, ".Slot"), l),
                    d = u.forwardRef(function(t, n) {
                        var i = t.asChild,
                            a = ef(t, ["asChild"]),
                            s = i ? c : r;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, o.jsx)(s, ed(eu({}, a), {
                            ref: n
                        }))
                    });
                return d.displayName = "Primitive.".concat(r), ed(eu({}, t), el({}, r, d))
            }, {});

            function eP(t) {
                var r = u.useRef(t);
                return u.useEffect(function() {
                    r.current = t
                }), u.useMemo(function() {
                    return function() {
                        for (var t, n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return null == (t = r.current) ? void 0 : t.call.apply(t, [r].concat(em(i)))
                    }
                }, [])
            }
            var eE, eI, eA, eT = "dismissableLayer.update",
                eO = u.createContext({
                    layers: new Set,
                    layersWithOutsidePointerEventsDisabled: new Set,
                    branches: new Set
                }),
                ej = u.forwardRef(function(t, r) {
                    var n, i, a = t.disableOutsidePointerEvents,
                        s = void 0 !== a && a,
                        l = t.onEscapeKeyDown,
                        c = t.onPointerDownOutside,
                        d = t.onFocusOutside,
                        f = t.onInteractOutside,
                        p = t.onDismiss,
                        m = ef(t, ["disableOutsidePointerEvents", "onEscapeKeyDown", "onPointerDownOutside", "onFocusOutside", "onInteractOutside", "onDismiss"]),
                        h = u.useContext(eO),
                        b = ep(u.useState(null), 2),
                        y = b[0],
                        v = b[1],
                        g = null != (i = null == y ? void 0 : y.ownerDocument) ? i : null == (n = globalThis) ? void 0 : n.document,
                        w = ep(u.useState({}), 2)[1],
                        x = eg(r, function(t) {
                            return v(t)
                        }),
                        S = Array.from(h.layers),
                        P = ep(em(h.layersWithOutsidePointerEventsDisabled).slice(-1), 1)[0],
                        E = S.indexOf(P),
                        I = y ? S.indexOf(y) : -1,
                        A = h.layersWithOutsidePointerEventsDisabled.size > 0,
                        T = I >= E,
                        O = function(t) {
                            var r, n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (r = globalThis) ? void 0 : r.document,
                                i = eP(t),
                                a = u.useRef(!1),
                                o = u.useRef(function() {});
                            return u.useEffect(function() {
                                var t = function(t) {
                                        if (t.target && !a.current) {
                                            var r = function() {
                                                    eR("dismissableLayer.pointerDownOutside", i, s, {
                                                        discrete: !0
                                                    })
                                                },
                                                s = {
                                                    originalEvent: t
                                                };
                                            "touch" === t.pointerType ? (n.removeEventListener("click", o.current), o.current = r, n.addEventListener("click", o.current, {
                                                once: !0
                                            })) : r()
                                        } else n.removeEventListener("click", o.current);
                                        a.current = !1
                                    },
                                    r = window.setTimeout(function() {
                                        n.addEventListener("pointerdown", t)
                                    }, 0);
                                return function() {
                                    window.clearTimeout(r), n.removeEventListener("pointerdown", t), n.removeEventListener("click", o.current)
                                }
                            }, [n, i]), {
                                onPointerDownCapture: function() {
                                    return a.current = !0
                                }
                            }
                        }(function(t) {
                            var r = t.target,
                                n = em(h.branches).some(function(t) {
                                    return t.contains(r)
                                });
                            T && !n && (null == c || c(t), null == f || f(t), t.defaultPrevented || null == p || p())
                        }, g),
                        j = function(t) {
                            var r, n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (r = globalThis) ? void 0 : r.document,
                                i = eP(t),
                                a = u.useRef(!1);
                            return u.useEffect(function() {
                                var t = function(t) {
                                    t.target && !a.current && eR("dismissableLayer.focusOutside", i, {
                                        originalEvent: t
                                    }, {
                                        discrete: !1
                                    })
                                };
                                return n.addEventListener("focusin", t),
                                    function() {
                                        return n.removeEventListener("focusin", t)
                                    }
                            }, [n, i]), {
                                onFocusCapture: function() {
                                    return a.current = !0
                                },
                                onBlurCapture: function() {
                                    return a.current = !1
                                }
                            }
                        }(function(t) {
                            var r = t.target;
                            em(h.branches).some(function(t) {
                                return t.contains(r)
                            }) || (null == d || d(t), null == f || f(t), t.defaultPrevented || null == p || p())
                        }, g);
                    return function(t) {
                        var r, n, i = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (r = globalThis) ? void 0 : r.document,
                            a = (n = u.useRef(t), u.useEffect(function() {
                                n.current = t
                            }), u.useMemo(function() {
                                return function() {
                                    for (var t, r = arguments.length, i = Array(r), a = 0; a < r; a++) i[a] = arguments[a];
                                    return null == (t = n.current) ? void 0 : t.call.apply(t, [n].concat(em(i)))
                                }
                            }, []));
                        u.useEffect(function() {
                            var t = function(t) {
                                "Escape" === t.key && a(t)
                            };
                            return i.addEventListener("keydown", t, {
                                    capture: !0
                                }),
                                function() {
                                    return i.removeEventListener("keydown", t, {
                                        capture: !0
                                    })
                                }
                        }, [a, i])
                    }(function(t) {
                        I === h.layers.size - 1 && (null == l || l(t), !t.defaultPrevented && p && (t.preventDefault(), p()))
                    }, g), u.useEffect(function() {
                        if (y) return s && (0 === h.layersWithOutsidePointerEventsDisabled.size && (eA = g.body.style.pointerEvents, g.body.style.pointerEvents = "none"), h.layersWithOutsidePointerEventsDisabled.add(y)), h.layers.add(y), eN(),
                            function() {
                                s && 1 === h.layersWithOutsidePointerEventsDisabled.size && (g.body.style.pointerEvents = eA)
                            }
                    }, [y, g, s, h]), u.useEffect(function() {
                        return function() {
                            y && (h.layers.delete(y), h.layersWithOutsidePointerEventsDisabled.delete(y), eN())
                        }
                    }, [y, h]), u.useEffect(function() {
                        var t = function() {
                            return w({})
                        };
                        return document.addEventListener(eT, t),
                            function() {
                                return document.removeEventListener(eT, t)
                            }
                    }, []), (0, o.jsx)(eS.div, ed(eu({}, m), {
                        ref: x,
                        style: eu({
                            pointerEvents: A ? T ? "auto" : "none" : void 0
                        }, t.style),
                        onFocusCapture: eb(t.onFocusCapture, j.onFocusCapture),
                        onBlurCapture: eb(t.onBlurCapture, j.onBlurCapture),
                        onPointerDownCapture: eb(t.onPointerDownCapture, O.onPointerDownCapture)
                    }))
                });

            function eN() {
                var t = new CustomEvent(eT);
                document.dispatchEvent(t)
            }

            function eR(t, r, n, i) {
                var a = i.discrete,
                    o = n.originalEvent.target,
                    s = new CustomEvent(t, {
                        bubbles: !1,
                        cancelable: !0,
                        detail: n
                    });
                r && o.addEventListener(t, r, {
                    once: !0
                }), a ? o && ea.flushSync(function() {
                    return o.dispatchEvent(s)
                }) : o.dispatchEvent(s)
            }
            ej.displayName = "DismissableLayer", u.forwardRef(function(t, r) {
                var n = u.useContext(eO),
                    i = u.useRef(null),
                    a = eg(r, i);
                return u.useEffect(function() {
                    var t = i.current;
                    if (t) return n.branches.add(t),
                        function() {
                            n.branches.delete(t)
                        }
                }, [n.branches]), (0, o.jsx)(eS.div, ed(eu({}, t), {
                    ref: a
                }))
            }).displayName = "DismissableLayerBranch";
            var eC = 0;

            function eM() {
                var t = document.createElement("span");
                return t.setAttribute("data-radix-focus-guard", ""), t.tabIndex = 0, t.style.outline = "none", t.style.opacity = "0", t.style.position = "fixed", t.style.pointerEvents = "none", t
            }

            function eD(t, r) {
                if ("function" == typeof t) return t(r);
                null != t && (t.current = r)
            }

            function ek() {
                for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                return function(t) {
                    var n = !1,
                        i = r.map(function(r) {
                            var i = eD(r, t);
                            return n || "function" != typeof i || (n = !0), i
                        });
                    if (n) return function() {
                        for (var t = 0; t < i.length; t++) {
                            var n = i[t];
                            "function" == typeof n ? n() : eD(r[t], null)
                        }
                    }
                }
            }
            var eF = Symbol("radix.slottable");

            function eL(t) {
                return u.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === eF
            }
            var e_ = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, r) {
                var n, i, a, s, l, c = (i = n = "Primitive.".concat(r), (a = u.forwardRef(function(t, r) {
                        var n = t.children,
                            i = ef(t, ["children"]);
                        if (u.isValidElement(n)) {
                            var a, o, s, l = (s = null == (a = Object.getOwnPropertyDescriptor(n.props, "ref")) ? void 0 : a.get) && "isReactWarning" in s && s.isReactWarning ? n.ref : (s = null == (o = Object.getOwnPropertyDescriptor(n, "ref")) ? void 0 : o.get) && "isReactWarning" in s && s.isReactWarning ? n.props.ref : n.props.ref || n.ref,
                                c = function(t, r) {
                                    var n = eu({}, r);
                                    for (var i in r) ! function(i) {
                                        var a = t[i],
                                            o = r[i];
                                        /^on[A-Z]/.test(i) ? a && o ? n[i] = function() {
                                            for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                                            o.apply(void 0, em(r)), a.apply(void 0, em(r))
                                        } : a && (n[i] = a) : "style" === i ? n[i] = eu({}, a, o) : "className" === i && (n[i] = [a, o].filter(Boolean).join(" "))
                                    }(i);
                                    return eu({}, t, n)
                                }(i, n.props);
                            return n.type !== u.Fragment && (c.ref = r ? ek(r, l) : l), u.cloneElement(n, c)
                        }
                        return u.Children.count(n) > 1 ? u.Children.only(null) : null
                    })).displayName = "".concat(i, ".SlotClone"), s = a, (l = u.forwardRef(function(t, r) {
                        var n = t.children,
                            i = ef(t, ["children"]),
                            a = u.Children.toArray(n),
                            l = a.find(eL);
                        if (l) {
                            var c = l.props.children,
                                d = a.map(function(t) {
                                    return t === l ? u.Children.count(c) > 1 ? u.Children.only(null) : u.isValidElement(c) ? c.props.children : null : t
                                });
                            return (0, o.jsx)(s, ed(eu({}, i), {
                                ref: r,
                                children: u.isValidElement(c) ? u.cloneElement(c, void 0, d) : null
                            }))
                        }
                        return (0, o.jsx)(s, ed(eu({}, i), {
                            ref: r,
                            children: n
                        }))
                    })).displayName = "".concat(n, ".Slot"), l),
                    d = u.forwardRef(function(t, n) {
                        var i = t.asChild,
                            a = ef(t, ["asChild"]),
                            s = i ? c : r;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, o.jsx)(s, ed(eu({}, a), {
                            ref: n
                        }))
                    });
                return d.displayName = "Primitive.".concat(r), ed(eu({}, t), el({}, r, d))
            }, {});

            function eU(t) {
                var r = u.useRef(t);
                return u.useEffect(function() {
                    r.current = t
                }), u.useMemo(function() {
                    return function() {
                        for (var t, n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return null == (t = r.current) ? void 0 : t.call.apply(t, [r].concat(em(i)))
                    }
                }, [])
            }
            var eB = "focusScope.autoFocusOnMount",
                eq = "focusScope.autoFocusOnUnmount",
                ez = {
                    bubbles: !1,
                    cancelable: !0
                },
                eV = u.forwardRef(function(t, r) {
                    var n = t.loop,
                        i = void 0 !== n && n,
                        a = t.trapped,
                        s = void 0 !== a && a,
                        l = t.onMountAutoFocus,
                        c = t.onUnmountAutoFocus,
                        d = ef(t, ["loop", "trapped", "onMountAutoFocus", "onUnmountAutoFocus"]),
                        f = ep(u.useState(null), 2),
                        p = f[0],
                        m = f[1],
                        h = eU(l),
                        b = eU(c),
                        y = u.useRef(null),
                        v = function() {
                            for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                            return u.useCallback(ek.apply(void 0, em(r)), r)
                        }(r, function(t) {
                            return m(t)
                        }),
                        g = u.useRef({
                            paused: !1,
                            pause: function() {
                                this.paused = !0
                            },
                            resume: function() {
                                this.paused = !1
                            }
                        }).current;
                    u.useEffect(function() {
                        if (s) {
                            var t = function(t) {
                                    if (!g.paused && p) {
                                        var r = t.target;
                                        p.contains(r) ? y.current = r : eW(y.current, {
                                            select: !0
                                        })
                                    }
                                },
                                r = function(t) {
                                    if (!g.paused && p) {
                                        var r = t.relatedTarget;
                                        null !== r && (p.contains(r) || eW(y.current, {
                                            select: !0
                                        }))
                                    }
                                };
                            document.addEventListener("focusin", t), document.addEventListener("focusout", r);
                            var n = new MutationObserver(function(t) {
                                var r = !0,
                                    n = !1,
                                    i = void 0;
                                if (document.activeElement === document.body) try {
                                    for (var a, o = t[Symbol.iterator](); !(r = (a = o.next()).done); r = !0) a.value.removedNodes.length > 0 && eW(p)
                                } catch (t) {
                                    n = !0, i = t
                                } finally {
                                    try {
                                        r || null == o.return || o.return()
                                    } finally {
                                        if (n) throw i
                                    }
                                }
                            });
                            return p && n.observe(p, {
                                    childList: !0,
                                    subtree: !0
                                }),
                                function() {
                                    document.removeEventListener("focusin", t), document.removeEventListener("focusout", r), n.disconnect()
                                }
                        }
                    }, [s, p, g.paused]), u.useEffect(function() {
                        if (p) {
                            eX.add(g);
                            var t = document.activeElement;
                            if (!p.contains(t)) {
                                var r = new CustomEvent(eB, ez);
                                p.addEventListener(eB, h), p.dispatchEvent(r), r.defaultPrevented || (! function(t) {
                                    var r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                                        n = r.select,
                                        i = void 0 !== n && n,
                                        a = document.activeElement,
                                        o = !0,
                                        s = !1,
                                        l = void 0;
                                    try {
                                        for (var c, u = t[Symbol.iterator](); !(o = (c = u.next()).done); o = !0) {
                                            var d = c.value;
                                            if (eW(d, {
                                                    select: i
                                                }), document.activeElement !== a) return
                                        }
                                    } catch (t) {
                                        s = !0, l = t
                                    } finally {
                                        try {
                                            o || null == u.return || u.return()
                                        } finally {
                                            if (s) throw l
                                        }
                                    }
                                }(eG(p).filter(function(t) {
                                    return "A" !== t.tagName
                                }), {
                                    select: !0
                                }), document.activeElement === t && eW(p))
                            }
                            return function() {
                                p.removeEventListener(eB, h), setTimeout(function() {
                                    var r = new CustomEvent(eq, ez);
                                    p.addEventListener(eq, b), p.dispatchEvent(r), r.defaultPrevented || eW(null != t ? t : document.body, {
                                        select: !0
                                    }), p.removeEventListener(eq, b), eX.remove(g)
                                }, 0)
                            }
                        }
                    }, [p, h, b, g]);
                    var w = u.useCallback(function(t) {
                        if ((i || s) && !g.paused) {
                            var r = "Tab" === t.key && !t.altKey && !t.ctrlKey && !t.metaKey,
                                n = document.activeElement;
                            if (r && n) {
                                var a, o = t.currentTarget,
                                    l = ep([eH(a = eG(o), o), eH(a.reverse(), o)], 2),
                                    c = l[0],
                                    u = l[1];
                                c && u ? t.shiftKey || n !== u ? t.shiftKey && n === c && (t.preventDefault(), i && eW(u, {
                                    select: !0
                                })) : (t.preventDefault(), i && eW(c, {
                                    select: !0
                                })) : n === o && t.preventDefault()
                            }
                        }
                    }, [i, s, g.paused]);
                    return (0, o.jsx)(e_.div, ed(eu({
                        tabIndex: -1
                    }, d), {
                        ref: v,
                        onKeyDown: w
                    }))
                });

            function eG(t) {
                for (var r = [], n = document.createTreeWalker(t, NodeFilter.SHOW_ELEMENT, {
                        acceptNode: function(t) {
                            var r = "INPUT" === t.tagName && "hidden" === t.type;
                            return t.disabled || t.hidden || r ? NodeFilter.FILTER_SKIP : t.tabIndex >= 0 ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_SKIP
                        }
                    }); n.nextNode();) r.push(n.currentNode);
                return r
            }

            function eH(t, r) {
                var n = !0,
                    i = !1,
                    a = void 0;
                try {
                    for (var o, s = t[Symbol.iterator](); !(n = (o = s.next()).done); n = !0) {
                        var l = o.value;
                        if (! function(t, r) {
                                var n = r.upTo;
                                if ("hidden" === getComputedStyle(t).visibility) return !0;
                                for (; t && (void 0 === n || t !== n);) {
                                    if ("none" === getComputedStyle(t).display) return !0;
                                    t = t.parentElement
                                }
                                return !1
                            }(l, {
                                upTo: r
                            })) return l
                    }
                } catch (t) {
                    i = !0, a = t
                } finally {
                    try {
                        n || null == s.return || s.return()
                    } finally {
                        if (i) throw a
                    }
                }
            }

            function eW(t) {
                var r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    n = r.select;
                if (t && t.focus) {
                    var i, a = document.activeElement;
                    t.focus({
                        preventScroll: !0
                    }), t !== a && ec(i = t, HTMLInputElement) && "select" in i && void 0 !== n && n && t.select()
                }
            }
            eV.displayName = "FocusScope";
            var eX = (tg = [], {
                add: function(t) {
                    var r = tg[0];
                    t !== r && (null == r || r.pause()), (tg = eK(tg, t)).unshift(t)
                },
                remove: function(t) {
                    var r;
                    null == (r = (tg = eK(tg, t))[0]) || r.resume()
                }
            });

            function eK(t, r) {
                var n = em(t),
                    i = n.indexOf(r);
                return -1 !== i && n.splice(i, 1), n
            }

            function eY(t, r) {
                if ("function" == typeof t) return t(r);
                null != t && (t.current = r)
            }
            var e$ = Symbol("radix.slottable");

            function eJ(t) {
                return u.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === e$
            }
            var eQ = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, r) {
                    var n, i, a, s, l, c = (i = n = "Primitive.".concat(r), (a = u.forwardRef(function(t, r) {
                            var n = t.children,
                                i = ef(t, ["children"]);
                            if (u.isValidElement(n)) {
                                var a, o, s, l = (s = null == (a = Object.getOwnPropertyDescriptor(n.props, "ref")) ? void 0 : a.get) && "isReactWarning" in s && s.isReactWarning ? n.ref : (s = null == (o = Object.getOwnPropertyDescriptor(n, "ref")) ? void 0 : o.get) && "isReactWarning" in s && s.isReactWarning ? n.props.ref : n.props.ref || n.ref,
                                    c = function(t, r) {
                                        var n = eu({}, r);
                                        for (var i in r) ! function(i) {
                                            var a = t[i],
                                                o = r[i];
                                            /^on[A-Z]/.test(i) ? a && o ? n[i] = function() {
                                                for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                                                o.apply(void 0, em(r)), a.apply(void 0, em(r))
                                            } : a && (n[i] = a) : "style" === i ? n[i] = eu({}, a, o) : "className" === i && (n[i] = [a, o].filter(Boolean).join(" "))
                                        }(i);
                                        return eu({}, t, n)
                                    }(i, n.props);
                                return n.type !== u.Fragment && (c.ref = r ? function() {
                                    for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                                    return function(t) {
                                        var n = !1,
                                            i = r.map(function(r) {
                                                var i = eY(r, t);
                                                return n || "function" != typeof i || (n = !0), i
                                            });
                                        if (n) return function() {
                                            for (var t = 0; t < i.length; t++) {
                                                var n = i[t];
                                                "function" == typeof n ? n() : eY(r[t], null)
                                            }
                                        }
                                    }
                                }(r, l) : l), u.cloneElement(n, c)
                            }
                            return u.Children.count(n) > 1 ? u.Children.only(null) : null
                        })).displayName = "".concat(i, ".SlotClone"), s = a, (l = u.forwardRef(function(t, r) {
                            var n = t.children,
                                i = ef(t, ["children"]),
                                a = u.Children.toArray(n),
                                l = a.find(eJ);
                            if (l) {
                                var c = l.props.children,
                                    d = a.map(function(t) {
                                        return t === l ? u.Children.count(c) > 1 ? u.Children.only(null) : u.isValidElement(c) ? c.props.children : null : t
                                    });
                                return (0, o.jsx)(s, ed(eu({}, i), {
                                    ref: r,
                                    children: u.isValidElement(c) ? u.cloneElement(c, void 0, d) : null
                                }))
                            }
                            return (0, o.jsx)(s, ed(eu({}, i), {
                                ref: r,
                                children: n
                            }))
                        })).displayName = "".concat(n, ".Slot"), l),
                        d = u.forwardRef(function(t, n) {
                            var i = t.asChild,
                                a = ef(t, ["asChild"]),
                                s = i ? c : r;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, o.jsx)(s, ed(eu({}, a), {
                                ref: n
                            }))
                        });
                    return d.displayName = "Primitive.".concat(r), ed(eu({}, t), el({}, r, d))
                }, {}),
                eZ = (null == (eI = globalThis) ? void 0 : eI.document) ? u.useLayoutEffect : function() {},
                e0 = u.forwardRef(function(t, r) {
                    var n, i, a = t.container,
                        s = ef(t, ["container"]),
                        l = ep(u.useState(!1), 2),
                        c = l[0],
                        d = l[1];
                    eZ(function() {
                        return d(!0)
                    }, []);
                    var f = a || c && (null == (i = globalThis) || null == (n = i.document) ? void 0 : n.body);
                    return f ? eo().createPortal((0, o.jsx)(eQ.div, ed(eu({}, s), {
                        ref: r
                    })), f) : null
                });
            e0.displayName = "Portal";
            var e1 = new WeakMap,
                e2 = new WeakMap,
                e3 = {},
                e4 = 0,
                e6 = function(t) {
                    return t && (t.host || e6(t.parentNode))
                },
                e8 = function(t, r, n, i) {
                    var a = (Array.isArray(t) ? t : [t]).map(function(t) {
                        if (r.contains(t)) return t;
                        var n = e6(t);
                        return n && r.contains(n) ? n : (console.error("aria-hidden", t, "in not contained inside", r, ". Doing nothing"), null)
                    }).filter(function(t) {
                        return !!t
                    });
                    e3[n] || (e3[n] = new WeakMap);
                    var o = e3[n],
                        s = [],
                        l = new Set,
                        c = new Set(a),
                        u = function(t) {
                            t && !l.has(t) && (l.add(t), u(t.parentNode))
                        };
                    a.forEach(u);
                    var d = function(t) {
                        t && !c.has(t) && Array.prototype.forEach.call(t.children, function(t) {
                            if (l.has(t)) d(t);
                            else try {
                                var r = t.getAttribute(i),
                                    a = null !== r && "false" !== r,
                                    c = (e1.get(t) || 0) + 1,
                                    u = (o.get(t) || 0) + 1;
                                e1.set(t, c), o.set(t, u), s.push(t), 1 === c && a && e2.set(t, !0), 1 === u && t.setAttribute(n, "true"), a || t.setAttribute(i, "true")
                            } catch (r) {
                                console.error("aria-hidden: cannot operate on ", t, r)
                            }
                        })
                    };
                    return d(r), l.clear(), e4++,
                        function() {
                            s.forEach(function(t) {
                                var r = e1.get(t) - 1,
                                    a = o.get(t) - 1;
                                e1.set(t, r), o.set(t, a), r || (e2.has(t) || t.removeAttribute(i), e2.delete(t)), a || t.removeAttribute(n)
                            }), --e4 || (e1 = new WeakMap, e1 = new WeakMap, e2 = new WeakMap, e3 = {})
                        }
                },
                e5 = function(t, r, n) {
                    void 0 === n && (n = "data-aria-hidden");
                    var i = Array.from(Array.isArray(t) ? t : [t]),
                        a = r || ("undefined" == typeof document ? null : (Array.isArray(t) ? t[0] : t).ownerDocument.body);
                    return a ? (i.push.apply(i, Array.from(a.querySelectorAll("[aria-live]"))), e8(i, a, n, "aria-hidden")) : function() {
                        return null
                    }
                },
                e7 = "right-scroll-bar-position",
                e9 = "width-before-scroll-bar";

            function te(t, r) {
                return "function" == typeof t ? t(r) : t && (t.current = r), t
            }
            var tt = "undefined" != typeof window ? u.useLayoutEffect : u.useEffect,
                tr = new WeakMap,
                tn = function(t) {
                    var r = t.sideCar,
                        n = Q(t, ["sideCar"]);
                    if (!r) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                    var i = r.read();
                    if (!i) throw Error("Sidecar medium not found");
                    return u.createElement(i, J({}, n))
                };
            tn.isSideCarExport = !0;
            var ti = (void 0 === tw && (tw = {}), (void 0 === tx && (tx = function(t) {
                    return t
                }), tS = [], tP = !1, tE = {
                    read: function() {
                        if (tP) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                        return tS.length ? tS[tS.length - 1] : null
                    },
                    useMedium: function(t) {
                        var r = tx(t, tP);
                        return tS.push(r),
                            function() {
                                tS = tS.filter(function(t) {
                                    return t !== r
                                })
                            }
                    },
                    assignSyncMedium: function(t) {
                        for (tP = !0; tS.length;) {
                            var r = tS;
                            tS = [], r.forEach(t)
                        }
                        tS = {
                            push: function(r) {
                                return t(r)
                            },
                            filter: function() {
                                return tS
                            }
                        }
                    },
                    assignMedium: function(t) {
                        tP = !0;
                        var r = [];
                        if (tS.length) {
                            var n = tS;
                            tS = [], n.forEach(t), r = tS
                        }
                        var i = function() {
                                var n = r;
                                r = [], n.forEach(t)
                            },
                            a = function() {
                                return Promise.resolve().then(i)
                            };
                        a(), tS = {
                            push: function(t) {
                                r.push(t), a()
                            },
                            filter: function(t) {
                                return r = r.filter(t), tS
                            }
                        }
                    }
                }).options = J({
                    async: !0,
                    ssr: !1
                }, tw), tE),
                ta = function() {},
                to = u.forwardRef(function(t, r) {
                    var n, i, a, o, s = u.useRef(null),
                        l = u.useState({
                            onScrollCapture: ta,
                            onWheelCapture: ta,
                            onTouchMoveCapture: ta
                        }),
                        c = l[0],
                        d = l[1],
                        f = t.forwardProps,
                        p = t.children,
                        m = t.className,
                        h = t.removeScrollBar,
                        b = t.enabled,
                        y = t.shards,
                        v = t.sideCar,
                        g = t.noIsolation,
                        w = t.inert,
                        x = t.allowPinchZoom,
                        S = t.as,
                        P = t.gapMode,
                        E = Q(t, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        I = (n = [s, r], i = function(t) {
                            return n.forEach(function(r) {
                                return te(r, t)
                            })
                        }, (a = (0, u.useState)(function() {
                            return {
                                value: null,
                                callback: i,
                                facade: {
                                    get current() {
                                        return a.value
                                    },
                                    set current(e) {
                                        var t = a.value;
                                        t !== e && (a.value = e, a.callback(e, t))
                                    }
                                }
                            }
                        })[0]).callback = i, o = a.facade, tt(function() {
                            var t = tr.get(o);
                            if (t) {
                                var r = new Set(t),
                                    i = new Set(n),
                                    a = o.current;
                                r.forEach(function(t) {
                                    i.has(t) || te(t, null)
                                }), i.forEach(function(t) {
                                    r.has(t) || te(t, a)
                                })
                            }
                            tr.set(o, n)
                        }, [n]), o),
                        A = J(J({}, E), c);
                    return u.createElement(u.Fragment, null, b && u.createElement(v, {
                        sideCar: ti,
                        removeScrollBar: h,
                        shards: y,
                        noIsolation: g,
                        inert: w,
                        setCallbacks: d,
                        allowPinchZoom: !!x,
                        lockRef: s,
                        gapMode: P
                    }), f ? u.cloneElement(u.Children.only(p), J(J({}, A), {
                        ref: I
                    })) : u.createElement(void 0 === S ? "div" : S, J({}, A, {
                        className: m,
                        ref: I
                    }), p))
                });
            to.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, to.classNames = {
                fullWidth: e9,
                zeroRight: e7
            };
            var ts = function() {
                    var t = 0,
                        r = null;
                    return {
                        add: function(i) {
                            var a, o;
                            0 == t && (r = function() {
                                if (!document) return null;
                                var t = document.createElement("style");
                                t.type = "text/css";
                                var r = n.nc;
                                return r && t.setAttribute("nonce", r), t
                            }()) && ((a = r).styleSheet ? a.styleSheet.cssText = i : a.appendChild(document.createTextNode(i)), o = r, (document.head || document.getElementsByTagName("head")[0]).appendChild(o)), t++
                        },
                        remove: function() {
                            --t || !r || (r.parentNode && r.parentNode.removeChild(r), r = null)
                        }
                    }
                },
                tl = function() {
                    var t, r = (t = ts(), function(r, n) {
                        u.useEffect(function() {
                            return t.add(r),
                                function() {
                                    t.remove()
                                }
                        }, [r && n])
                    });
                    return function(t) {
                        return r(t.styles, t.dynamic), null
                    }
                },
                tc = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                tu = function(t) {
                    return parseInt(t || "", 10) || 0
                },
                td = function(t) {
                    if (void 0 === t && (t = "margin"), "undefined" == typeof window) return tc;
                    var r, n, i, a, o, s = (r = t, i = (n = window.getComputedStyle(document.body))["padding" === r ? "paddingLeft" : "marginLeft"], a = n["padding" === r ? "paddingTop" : "marginTop"], o = n["padding" === r ? "paddingRight" : "marginRight"], [tu(i), tu(a), tu(o)]),
                        l = document.documentElement.clientWidth,
                        c = window.innerWidth;
                    return {
                        left: s[0],
                        top: s[1],
                        right: s[2],
                        gap: Math.max(0, c - l + s[2] - s[0])
                    }
                },
                tf = tl(),
                tp = "data-scroll-locked",
                tm = function(t, r, n, i) {
                    var a = t.left,
                        o = t.top,
                        s = t.right,
                        l = t.gap;
                    return void 0 === n && (n = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(i, ";\n   padding-right: ").concat(l, "px ").concat(i, ";\n  }\n  body[").concat(tp, "] {\n    overflow: hidden ").concat(i, ";\n    overscroll-behavior: contain;\n    ").concat([r && "position: relative ".concat(i, ";"), "margin" === n && "\n    padding-left: ".concat(a, "px;\n    padding-top: ").concat(o, "px;\n    padding-right: ").concat(s, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(l, "px ").concat(i, ";\n    "), "padding" === n && "padding-right: ".concat(l, "px ").concat(i, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(e7, " {\n    right: ").concat(l, "px ").concat(i, ";\n  }\n  \n  .").concat(e9, " {\n    margin-right: ").concat(l, "px ").concat(i, ";\n  }\n  \n  .").concat(e7, " .").concat(e7, " {\n    right: 0 ").concat(i, ";\n  }\n  \n  .").concat(e9, " .").concat(e9, " {\n    margin-right: 0 ").concat(i, ";\n  }\n  \n  body[").concat(tp, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(l, "px;\n  }\n")
                },
                th = function() {
                    var t = parseInt(document.body.getAttribute(tp) || "0", 10);
                    return isFinite(t) ? t : 0
                },
                tb = function(t) {
                    var r = t.noRelative,
                        n = t.noImportant,
                        i = t.gapMode,
                        a = void 0 === i ? "margin" : i;
                    u.useEffect(function() {
                        return document.body.setAttribute(tp, (th() + 1).toString()),
                            function() {
                                var t = th() - 1;
                                t <= 0 ? document.body.removeAttribute(tp) : document.body.setAttribute(tp, t.toString())
                            }
                    }, []);
                    var o = u.useMemo(function() {
                        return td(a)
                    }, [a]);
                    return u.createElement(tf, {
                        styles: tm(o, !r, a, n ? "" : "!important")
                    })
                },
                ty = !1;
            if ("undefined" != typeof window) try {
                var tv = Object.defineProperty({}, "passive", {
                    get: function() {
                        return ty = !0, !0
                    }
                });
                window.addEventListener("test", tv, tv), window.removeEventListener("test", tv, tv)
            } catch (t) {
                ty = !1
            }
            var tg, tw, tx, tS, tP, tE, tI, tA = !!ty && {
                    passive: !1
                },
                tT = function(t, r) {
                    if (!ec(t, Element)) return !1;
                    var n = window.getComputedStyle(t);
                    return "hidden" !== n[r] && (n.overflowY !== n.overflowX || "TEXTAREA" === t.tagName || "visible" !== n[r])
                },
                tO = function(t, r) {
                    var n = r.ownerDocument,
                        i = r;
                    do {
                        if ("undefined" != typeof ShadowRoot && ec(i, ShadowRoot) && (i = i.host), tj(t, i)) {
                            var a = tN(t, i);
                            if (a[1] > a[2]) return !0
                        }
                        i = i.parentNode
                    } while (i && i !== n.body);
                    return !1
                },
                tj = function(t, r) {
                    return "v" === t ? tT(r, "overflowY") : tT(r, "overflowX")
                },
                tN = function(t, r) {
                    return "v" === t ? [r.scrollTop, r.scrollHeight, r.clientHeight] : [r.scrollLeft, r.scrollWidth, r.clientWidth]
                },
                tR = function(t, r, n, i, a) {
                    var o, s = (o = window.getComputedStyle(r).direction, "h" === t && "rtl" === o ? -1 : 1),
                        l = s * i,
                        c = n.target,
                        u = r.contains(c),
                        d = !1,
                        f = l > 0,
                        p = 0,
                        m = 0;
                    do {
                        var h = tN(t, c),
                            b = h[0],
                            y = h[1] - h[2] - s * b;
                        (b || y) && tj(t, c) && (p += y, m += b), c = ec(c, ShadowRoot) ? c.host : c.parentNode
                    } while (!u && c !== document.body || u && (r.contains(c) || r === c));
                    return (f && (a && 1 > Math.abs(p) || !a && l > p) || !f && (a && 1 > Math.abs(m) || !a && -l > m)) && (d = !0), d
                },
                tC = function(t) {
                    return "changedTouches" in t ? [t.changedTouches[0].clientX, t.changedTouches[0].clientY] : [0, 0]
                },
                tM = function(t) {
                    return [t.deltaX, t.deltaY]
                },
                tD = function(t) {
                    return t && "current" in t ? t.current : t
                },
                tk = 0,
                tF = [],
                tL = (tI = function(t) {
                    var r = u.useRef([]),
                        n = u.useRef([0, 0]),
                        i = u.useRef(),
                        a = u.useState(tk++)[0],
                        o = u.useState(tl)[0],
                        s = u.useRef(t);
                    u.useEffect(function() {
                        s.current = t
                    }, [t]), u.useEffect(function() {
                        if (t.inert) {
                            document.body.classList.add("block-interactivity-".concat(a));
                            var r = (function(t, r, n) {
                                if (n || 2 == arguments.length)
                                    for (var i, a = 0, o = r.length; a < o; a++) !i && a in r || (i || (i = Array.prototype.slice.call(r, 0, a)), i[a] = r[a]);
                                return t.concat(i || Array.prototype.slice.call(r))
                            })([t.lockRef.current], (t.shards || []).map(tD), !0).filter(Boolean);
                            return r.forEach(function(t) {
                                    return t.classList.add("allow-interactivity-".concat(a))
                                }),
                                function() {
                                    document.body.classList.remove("block-interactivity-".concat(a)), r.forEach(function(t) {
                                        return t.classList.remove("allow-interactivity-".concat(a))
                                    })
                                }
                        }
                    }, [t.inert, t.lockRef.current, t.shards]);
                    var l = u.useCallback(function(t, r) {
                            if ("touches" in t && 2 === t.touches.length || "wheel" === t.type && t.ctrlKey) return !s.current.allowPinchZoom;
                            var a, o = tC(t),
                                l = n.current,
                                c = "deltaX" in t ? t.deltaX : l[0] - o[0],
                                u = "deltaY" in t ? t.deltaY : l[1] - o[1],
                                d = t.target,
                                f = Math.abs(c) > Math.abs(u) ? "h" : "v";
                            if ("touches" in t && "h" === f && "range" === d.type) return !1;
                            var p = tO(f, d);
                            if (!p) return !0;
                            if (p ? a = f : (a = "v" === f ? "h" : "v", p = tO(f, d)), !p) return !1;
                            if (!i.current && "changedTouches" in t && (c || u) && (i.current = a), !a) return !0;
                            var m = i.current || a;
                            return tR(m, r, t, "h" === m ? c : u, !0)
                        }, []),
                        c = u.useCallback(function(t) {
                            if (tF.length && tF[tF.length - 1] === o) {
                                var n = "deltaY" in t ? tM(t) : tC(t),
                                    i = r.current.filter(function(r) {
                                        var i;
                                        return r.name === t.type && (r.target === t.target || t.target === r.shadowParent) && (i = r.delta, i[0] === n[0] && i[1] === n[1])
                                    })[0];
                                if (i && i.should) t.cancelable && t.preventDefault();
                                else if (!i) {
                                    var a = (s.current.shards || []).map(tD).filter(Boolean).filter(function(r) {
                                        return r.contains(t.target)
                                    });
                                    (a.length > 0 ? l(t, a[0]) : !s.current.noIsolation) && t.cancelable && t.preventDefault()
                                }
                            }
                        }, []),
                        d = u.useCallback(function(t, n, i, a) {
                            var o = {
                                name: t,
                                delta: n,
                                target: i,
                                should: a,
                                shadowParent: function(t) {
                                    for (var r = null; null !== t;) ec(t, ShadowRoot) && (r = t.host, t = t.host), t = t.parentNode;
                                    return r
                                }(i)
                            };
                            r.current.push(o), setTimeout(function() {
                                r.current = r.current.filter(function(t) {
                                    return t !== o
                                })
                            }, 1)
                        }, []),
                        f = u.useCallback(function(t) {
                            n.current = tC(t), i.current = void 0
                        }, []),
                        p = u.useCallback(function(r) {
                            d(r.type, tM(r), r.target, l(r, t.lockRef.current))
                        }, []),
                        m = u.useCallback(function(r) {
                            d(r.type, tC(r), r.target, l(r, t.lockRef.current))
                        }, []);
                    u.useEffect(function() {
                        return tF.push(o), t.setCallbacks({
                                onScrollCapture: p,
                                onWheelCapture: p,
                                onTouchMoveCapture: m
                            }), document.addEventListener("wheel", c, tA), document.addEventListener("touchmove", c, tA), document.addEventListener("touchstart", f, tA),
                            function() {
                                tF = tF.filter(function(t) {
                                    return t !== o
                                }), document.removeEventListener("wheel", c, tA), document.removeEventListener("touchmove", c, tA), document.removeEventListener("touchstart", f, tA)
                            }
                    }, []);
                    var h = t.removeScrollBar,
                        b = t.inert;
                    return u.createElement(u.Fragment, null, b ? u.createElement(o, {
                        styles: "\n  .block-interactivity-".concat(a, " {pointer-events: none;}\n  .allow-interactivity-").concat(a, " {pointer-events: all;}\n")
                    }) : null, h ? u.createElement(tb, {
                        gapMode: t.gapMode
                    }) : null)
                }, ti.useMedium(tI), tn),
                t_ = u.forwardRef(function(t, r) {
                    return u.createElement(to, J({}, t, {
                        ref: r,
                        sideCar: tL
                    }))
                });

            function tU(t, r) {
                (null == r || r > t.length) && (r = t.length);
                for (var n = 0, i = Array(r); n < r; n++) i[n] = t[n];
                return i
            }

            function tB(t, r, n) {
                return r in t ? Object.defineProperty(t, r, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[r] = n, t
            }

            function tq(t) {
                for (var r = 1; r < arguments.length; r++) {
                    var n = null != arguments[r] ? arguments[r] : {},
                        i = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (i = i.concat(Object.getOwnPropertySymbols(n).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(n, t).enumerable
                    }))), i.forEach(function(r) {
                        tB(t, r, n[r])
                    })
                }
                return t
            }

            function tz(t, r) {
                return r = null != r ? r : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(r)) : (function(t, r) {
                    var n = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var i = Object.getOwnPropertySymbols(t);
                        n.push.apply(n, i)
                    }
                    return n
                })(Object(r)).forEach(function(n) {
                    Object.defineProperty(t, n, Object.getOwnPropertyDescriptor(r, n))
                }), t
            }

            function tV(t, r) {
                if (null == t) return {};
                var n, i, a = function(t, r) {
                    if (null == t) return {};
                    var n, i, a = {},
                        o = Object.keys(t);
                    for (i = 0; i < o.length; i++) n = o[i], r.indexOf(n) >= 0 || (a[n] = t[n]);
                    return a
                }(t, r);
                if (Object.getOwnPropertySymbols) {
                    var o = Object.getOwnPropertySymbols(t);
                    for (i = 0; i < o.length; i++) n = o[i], !(r.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(t, n) && (a[n] = t[n])
                }
                return a
            }

            function tG(t, r) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, r) {
                    var n, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var o = [],
                            s = !0,
                            l = !1;
                        try {
                            for (a = a.call(t); !(s = (n = a.next()).done) && (o.push(n.value), !r || o.length !== r); s = !0);
                        } catch (t) {
                            l = !0, i = t
                        } finally {
                            try {
                                s || null == a.return || a.return()
                            } finally {
                                if (l) throw i
                            }
                        }
                        return o
                    }
                }(t, r) || tW(t, r) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tH(t) {
                return function(t) {
                    if (Array.isArray(t)) return tU(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || tW(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tW(t, r) {
                if (t) {
                    if ("string" == typeof t) return tU(t, r);
                    var n = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return tU(t, r)
                }
            }

            function tX(t, r) {
                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    i = n.checkForDefaultPrevented,
                    a = void 0 === i || i;
                return function(n) {
                    if (null == t || t(n), !1 === a || !n.defaultPrevented) return null == r ? void 0 : r(n)
                }
            }

            function tK(t, r) {
                if ("function" == typeof t) return t(r);
                null != t && (t.current = r)
            }

            function tY() {
                for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                return function(t) {
                    var n = !1,
                        i = r.map(function(r) {
                            var i = tK(r, t);
                            return n || "function" != typeof i || (n = !0), i
                        });
                    if (n) return function() {
                        for (var t = 0; t < i.length; t++) {
                            var n = i[t];
                            "function" == typeof n ? n() : tK(r[t], null)
                        }
                    }
                }
            }

            function t$() {
                for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                return u.useCallback(tY.apply(void 0, tH(r)), r)
            }

            function tJ() {
                for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                var i = r[0];
                if (1 === r.length) return i;
                var a = function() {
                    var t = r.map(function(t) {
                        return {
                            useScope: t(),
                            scopeName: t.scopeName
                        }
                    });
                    return function(r) {
                        var n = t.reduce(function(t, n) {
                            var i = n.useScope,
                                a = n.scopeName;
                            return tq({}, t, i(r)["__scope".concat(a)])
                        }, {});
                        return u.useMemo(function() {
                            return tB({}, "__scope".concat(i.scopeName), n)
                        }, [n])
                    }
                };
                return a.scopeName = i.scopeName, a
            }

            function tQ(t) {
                var r = u.useRef(t);
                return u.useEffect(function() {
                    r.current = t
                }), u.useMemo(function() {
                    return function() {
                        for (var t, n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return null == (t = r.current) ? void 0 : t.call.apply(t, [r].concat(tH(i)))
                    }
                }, [])
            }
            t_.classNames = to.classNames;
            var tZ = (null == (oJ = globalThis) ? void 0 : oJ.document) ? u.useLayoutEffect : function() {},
                t0 = function(t) {
                    var r, n, i, a, o, s, l, c, d, f, p, m, h, b, y = t.present,
                        v = t.children,
                        g = (a = (i = tG(u.useState(), 2))[0], o = i[1], s = u.useRef({}), l = u.useRef(y), c = u.useRef("none"), f = (d = tG((r = y ? "mounted" : "unmounted", n = {
                            mounted: {
                                UNMOUNT: "unmounted",
                                ANIMATION_OUT: "unmountSuspended"
                            },
                            unmountSuspended: {
                                MOUNT: "mounted",
                                ANIMATION_END: "unmounted"
                            },
                            unmounted: {
                                MOUNT: "mounted"
                            }
                        }, u.useReducer(function(t, r) {
                            var i;
                            return null != (i = n[t][r]) ? i : t
                        }, r)), 2))[0], p = d[1], u.useEffect(function() {
                            var t = t1(s.current);
                            c.current = "mounted" === f ? t : "none"
                        }, [f]), tZ(function() {
                            var t = s.current,
                                r = l.current;
                            if (r !== y) {
                                var n = c.current,
                                    i = t1(t);
                                y ? p("MOUNT") : "none" === i || "none" === (null == t ? void 0 : t.display) ? p("UNMOUNT") : p(r && n !== i ? "ANIMATION_OUT" : "UNMOUNT"), l.current = y
                            }
                        }, [y, p]), tZ(function() {
                            if (a) {
                                var t, r, n = null != (r = a.ownerDocument.defaultView) ? r : window,
                                    i = function(r) {
                                        var i = t1(s.current).includes(r.animationName);
                                        if (r.target === a && i && (p("ANIMATION_END"), !l.current)) {
                                            var o = a.style.animationFillMode;
                                            a.style.animationFillMode = "forwards", t = n.setTimeout(function() {
                                                "forwards" === a.style.animationFillMode && (a.style.animationFillMode = o)
                                            })
                                        }
                                    },
                                    o = function(t) {
                                        t.target === a && (c.current = t1(s.current))
                                    };
                                return a.addEventListener("animationstart", o), a.addEventListener("animationcancel", i), a.addEventListener("animationend", i),
                                    function() {
                                        n.clearTimeout(t), a.removeEventListener("animationstart", o), a.removeEventListener("animationcancel", i), a.removeEventListener("animationend", i)
                                    }
                            }
                            p("ANIMATION_END")
                        }, [a, p]), {
                            isPresent: ["mounted", "unmountSuspended"].includes(f),
                            ref: u.useCallback(function(t) {
                                t && (s.current = getComputedStyle(t)), o(t)
                            }, [])
                        }),
                        w = "function" == typeof v ? v({
                            present: g.isPresent
                        }) : u.Children.only(v),
                        x = t$(g.ref, (b = null == (m = Object.getOwnPropertyDescriptor(w.props, "ref")) ? void 0 : m.get) && "isReactWarning" in b && b.isReactWarning ? w.ref : (b = null == (h = Object.getOwnPropertyDescriptor(w, "ref")) ? void 0 : h.get) && "isReactWarning" in b && b.isReactWarning ? w.props.ref : w.props.ref || w.ref);
                    return "function" == typeof v || g.isPresent ? u.cloneElement(w, {
                        ref: x
                    }) : null
                };

            function t1(t) {
                return (null == t ? void 0 : t.animationName) || "none"
            }

            function t2(t) {
                var r, n, i = (r = t, (n = u.forwardRef(function(t, r) {
                        var n = t.children,
                            i = tV(t, ["children"]);
                        if (u.isValidElement(n)) {
                            var a, o, s, l = (s = null == (a = Object.getOwnPropertyDescriptor(n.props, "ref")) ? void 0 : a.get) && "isReactWarning" in s && s.isReactWarning ? n.ref : (s = null == (o = Object.getOwnPropertyDescriptor(n, "ref")) ? void 0 : o.get) && "isReactWarning" in s && s.isReactWarning ? n.props.ref : n.props.ref || n.ref,
                                c = function(t, r) {
                                    var n = tq({}, r);
                                    for (var i in r) ! function(i) {
                                        var a = t[i],
                                            o = r[i];
                                        /^on[A-Z]/.test(i) ? a && o ? n[i] = function() {
                                            for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                                            o.apply(void 0, tH(r)), a.apply(void 0, tH(r))
                                        } : a && (n[i] = a) : "style" === i ? n[i] = tq({}, a, o) : "className" === i && (n[i] = [a, o].filter(Boolean).join(" "))
                                    }(i);
                                    return tq({}, t, n)
                                }(i, n.props);
                            return n.type !== u.Fragment && (c.ref = r ? tY(r, l) : l), u.cloneElement(n, c)
                        }
                        return u.Children.count(n) > 1 ? u.Children.only(null) : null
                    })).displayName = "".concat(r, ".SlotClone"), n),
                    a = u.forwardRef(function(t, r) {
                        var n = t.children,
                            a = tV(t, ["children"]),
                            s = u.Children.toArray(n),
                            l = s.find(t4);
                        if (l) {
                            var c = l.props.children,
                                d = s.map(function(t) {
                                    return t === l ? u.Children.count(c) > 1 ? u.Children.only(null) : u.isValidElement(c) ? c.props.children : null : t
                                });
                            return (0, o.jsx)(i, tz(tq({}, a), {
                                ref: r,
                                children: u.isValidElement(c) ? u.cloneElement(c, void 0, d) : null
                            }))
                        }
                        return (0, o.jsx)(i, tz(tq({}, a), {
                            ref: r,
                            children: n
                        }))
                    });
                return a.displayName = "".concat(t, ".Slot"), a
            }
            t0.displayName = "Presence";
            var t3 = Symbol("radix.slottable");

            function t4(t) {
                return u.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === t3
            }
            var t6 = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, r) {
                    var n = t2("Primitive.".concat(r)),
                        i = u.forwardRef(function(t, i) {
                            var a = t.asChild,
                                s = tV(t, ["asChild"]),
                                l = a ? n : r;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, o.jsx)(l, tz(tq({}, s), {
                                ref: i
                            }))
                        });
                    return i.displayName = "Primitive.".concat(r), tz(tq({}, t), tB({}, r, i))
                }, {}),
                t8 = "Dialog",
                t5 = tG(function(t) {
                    var r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        n = [],
                        i = function() {
                            var r = n.map(function(t) {
                                return u.createContext(t)
                            });
                            return function(n) {
                                var i = (null == n ? void 0 : n[t]) || r;
                                return u.useMemo(function() {
                                    return tB({}, "__scope".concat(t), tz(tq({}, n), tB({}, t, i)))
                                }, [n, i])
                            }
                        };
                    return i.scopeName = t, [function(r, i) {
                        var a = u.createContext(i),
                            s = n.length;
                        n = tH(n).concat([i]);
                        var l = function(r) {
                            var n, i = r.scope,
                                l = r.children,
                                c = tV(r, ["scope", "children"]),
                                d = (null == i || null == (n = i[t]) ? void 0 : n[s]) || a,
                                f = u.useMemo(function() {
                                    return c
                                }, Object.values(c));
                            return (0, o.jsx)(d.Provider, {
                                value: f,
                                children: l
                            })
                        };
                        return l.displayName = r + "Provider", [l, function(n, o) {
                            var l, c = (null == o || null == (l = o[t]) ? void 0 : l[s]) || a,
                                d = u.useContext(c);
                            if (d) return d;
                            if (void 0 !== i) return i;
                            throw Error("`".concat(n, "` must be used within `").concat(r, "`"))
                        }]
                    }, tJ.apply(void 0, [i].concat(tH(r)))]
                }(t8), 2),
                t7 = t5[0],
                t9 = (t5[1], tG(t7(t8), 2)),
                re = t9[0],
                rt = t9[1],
                rr = function(t) {
                    var r, n, i, a, s, l, c, d, f, p, m, h, b, y, v, g, w, x = t.__scopeDialog,
                        S = t.children,
                        P = t.open,
                        E = t.defaultOpen,
                        I = t.onOpenChange,
                        A = t.modal,
                        T = u.useRef(null),
                        O = u.useRef(null),
                        j = tG((n = (r = {
                            prop: P,
                            defaultProp: E,
                            onChange: I
                        }).prop, b = (h = tG((l = (s = {
                            defaultProp: r.defaultProp,
                            onChange: a = void 0 === (i = r.onChange) ? function() {} : i
                        }).defaultProp, c = s.onChange, f = tG(d = u.useState(l), 1)[0], p = u.useRef(f), m = tQ(c), u.useEffect(function() {
                            p.current !== f && (m(f), p.current = f)
                        }, [f, p, m]), d), 2))[0], y = h[1], g = (v = void 0 !== n) ? n : b, w = tQ(a), [g, u.useCallback(function(t) {
                            if (v) {
                                var r = "function" == typeof t ? t(n) : t;
                                r !== n && w(r)
                            } else y(t)
                        }, [v, n, y, w])]), 2),
                        N = j[0],
                        R = j[1];
                    return (0, o.jsx)(re, {
                        scope: x,
                        triggerRef: T,
                        contentRef: O,
                        contentId: ei(),
                        titleId: ei(),
                        descriptionId: ei(),
                        open: void 0 !== N && N,
                        onOpenChange: R,
                        onOpenToggle: u.useCallback(function() {
                            return R(function(t) {
                                return !t
                            })
                        }, [R]),
                        modal: void 0 === A || A,
                        children: S
                    })
                };
            rr.displayName = t8;
            var rn = "DialogTrigger";
            u.forwardRef(function(t, r) {
                var n = t.__scopeDialog,
                    i = tV(t, ["__scopeDialog"]),
                    a = rt(rn, n),
                    s = t$(r, a.triggerRef);
                return (0, o.jsx)(t6.button, tz(tq({
                    type: "button",
                    "aria-haspopup": "dialog",
                    "aria-expanded": a.open,
                    "aria-controls": a.contentId,
                    "data-state": rP(a.open)
                }, i), {
                    ref: s,
                    onClick: tX(t.onClick, a.onOpenToggle)
                }))
            }).displayName = rn;
            var ri = "DialogPortal",
                ra = tG(t7(ri, {
                    forceMount: void 0
                }), 2),
                ro = ra[0],
                rs = ra[1],
                rl = function(t) {
                    var r = t.__scopeDialog,
                        n = t.forceMount,
                        i = t.children,
                        a = t.container,
                        s = rt(ri, r);
                    return (0, o.jsx)(ro, {
                        scope: r,
                        forceMount: n,
                        children: u.Children.map(i, function(t) {
                            return (0, o.jsx)(t0, {
                                present: n || s.open,
                                children: (0, o.jsx)(e0, {
                                    asChild: !0,
                                    container: a,
                                    children: t
                                })
                            })
                        })
                    })
                };
            rl.displayName = ri;
            var rc = "DialogOverlay",
                ru = u.forwardRef(function(t, r) {
                    var n = rs(rc, t.__scopeDialog),
                        i = t.forceMount,
                        a = void 0 === i ? n.forceMount : i,
                        s = tV(t, ["forceMount"]),
                        l = rt(rc, t.__scopeDialog);
                    return l.modal ? (0, o.jsx)(t0, {
                        present: a || l.open,
                        children: (0, o.jsx)(rf, tz(tq({}, s), {
                            ref: r
                        }))
                    }) : null
                });
            ru.displayName = rc;
            var rd = t2("DialogOverlay.RemoveScroll"),
                rf = u.forwardRef(function(t, r) {
                    var n = t.__scopeDialog,
                        i = tV(t, ["__scopeDialog"]),
                        a = rt(rc, n);
                    return (0, o.jsx)(t_, {
                        as: rd,
                        allowPinchZoom: !0,
                        shards: [a.contentRef],
                        children: (0, o.jsx)(t6.div, tz(tq({
                            "data-state": rP(a.open)
                        }, i), {
                            ref: r,
                            style: tq({
                                pointerEvents: "auto"
                            }, i.style)
                        }))
                    })
                }),
                rp = "DialogContent",
                rm = u.forwardRef(function(t, r) {
                    var n = rs(rp, t.__scopeDialog),
                        i = t.forceMount,
                        a = void 0 === i ? n.forceMount : i,
                        s = tV(t, ["forceMount"]),
                        l = rt(rp, t.__scopeDialog);
                    return (0, o.jsx)(t0, {
                        present: a || l.open,
                        children: l.modal ? (0, o.jsx)(rh, tz(tq({}, s), {
                            ref: r
                        })) : (0, o.jsx)(rb, tz(tq({}, s), {
                            ref: r
                        }))
                    })
                });
            rm.displayName = rp;
            var rh = u.forwardRef(function(t, r) {
                    var n = rt(rp, t.__scopeDialog),
                        i = u.useRef(null),
                        a = t$(r, n.contentRef, i);
                    return u.useEffect(function() {
                        var t = i.current;
                        if (t) return e5(t)
                    }, []), (0, o.jsx)(ry, tz(tq({}, t), {
                        ref: a,
                        trapFocus: n.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: tX(t.onCloseAutoFocus, function(t) {
                            var r;
                            t.preventDefault(), null == (r = n.triggerRef.current) || r.focus()
                        }),
                        onPointerDownOutside: tX(t.onPointerDownOutside, function(t) {
                            var r = t.detail.originalEvent,
                                n = 0 === r.button && !0 === r.ctrlKey;
                            (2 === r.button || n) && t.preventDefault()
                        }),
                        onFocusOutside: tX(t.onFocusOutside, function(t) {
                            return t.preventDefault()
                        })
                    }))
                }),
                rb = u.forwardRef(function(t, r) {
                    var n = rt(rp, t.__scopeDialog),
                        i = u.useRef(!1),
                        a = u.useRef(!1);
                    return (0, o.jsx)(ry, tz(tq({}, t), {
                        ref: r,
                        trapFocus: !1,
                        disableOutsidePointerEvents: !1,
                        onCloseAutoFocus: function(r) {
                            var o, s;
                            null == (o = t.onCloseAutoFocus) || o.call(t, r), r.defaultPrevented || (i.current || null == (s = n.triggerRef.current) || s.focus(), r.preventDefault()), i.current = !1, a.current = !1
                        },
                        onInteractOutside: function(r) {
                            null == (o = t.onInteractOutside) || o.call(t, r), r.defaultPrevented || (i.current = !0, "pointerdown" === r.detail.originalEvent.type && (a.current = !0));
                            var o, s, l = r.target;
                            (null == (s = n.triggerRef.current) ? void 0 : s.contains(l)) && r.preventDefault(), "focusin" === r.detail.originalEvent.type && a.current && r.preventDefault()
                        }
                    }))
                }),
                ry = u.forwardRef(function(t, r) {
                    var n = t.__scopeDialog,
                        i = t.trapFocus,
                        a = t.onOpenAutoFocus,
                        s = t.onCloseAutoFocus,
                        l = tV(t, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        c = rt(rp, n),
                        d = u.useRef(null),
                        f = t$(r, d);
                    return u.useEffect(function() {
                        var t, r, n = document.querySelectorAll("[data-radix-focus-guard]");
                        return document.body.insertAdjacentElement("afterbegin", null != (t = n[0]) ? t : eM()), document.body.insertAdjacentElement("beforeend", null != (r = n[1]) ? r : eM()), eC++,
                            function() {
                                1 === eC && document.querySelectorAll("[data-radix-focus-guard]").forEach(function(t) {
                                    return t.remove()
                                }), eC--
                            }
                    }, []), (0, o.jsxs)(o.Fragment, {
                        children: [(0, o.jsx)(eV, {
                            asChild: !0,
                            loop: !0,
                            trapped: i,
                            onMountAutoFocus: a,
                            onUnmountAutoFocus: s,
                            children: (0, o.jsx)(ej, tz(tq({
                                role: "dialog",
                                id: c.contentId,
                                "aria-describedby": c.descriptionId,
                                "aria-labelledby": c.titleId,
                                "data-state": rP(c.open)
                            }, l), {
                                ref: f,
                                onDismiss: function() {
                                    return c.onOpenChange(!1)
                                }
                            }))
                        }), (0, o.jsxs)(o.Fragment, {
                            children: [(0, o.jsx)(rT, {
                                titleId: c.titleId
                            }), (0, o.jsx)(rO, {
                                contentRef: d,
                                descriptionId: c.descriptionId
                            })]
                        })]
                    })
                }),
                rv = "DialogTitle",
                rg = u.forwardRef(function(t, r) {
                    var n = t.__scopeDialog,
                        i = tV(t, ["__scopeDialog"]),
                        a = rt(rv, n);
                    return (0, o.jsx)(t6.h2, tz(tq({
                        id: a.titleId
                    }, i), {
                        ref: r
                    }))
                });
            rg.displayName = rv;
            var rw = "DialogDescription";
            u.forwardRef(function(t, r) {
                var n = t.__scopeDialog,
                    i = tV(t, ["__scopeDialog"]),
                    a = rt(rw, n);
                return (0, o.jsx)(t6.p, tz(tq({
                    id: a.descriptionId
                }, i), {
                    ref: r
                }))
            }).displayName = rw;
            var rx = "DialogClose",
                rS = u.forwardRef(function(t, r) {
                    var n = t.__scopeDialog,
                        i = tV(t, ["__scopeDialog"]),
                        a = rt(rx, n);
                    return (0, o.jsx)(t6.button, tz(tq({
                        type: "button"
                    }, i), {
                        ref: r,
                        onClick: tX(t.onClick, function() {
                            return a.onOpenChange(!1)
                        })
                    }))
                });

            function rP(t) {
                return t ? "open" : "closed"
            }
            rS.displayName = rx;
            var rE = "DialogTitleWarning",
                rI = tG((oz = {
                    contentName: rp,
                    titleName: rv,
                    docsSlug: "dialog"
                }, oV = u.createContext(oz), (oG = function(t) {
                    var r = t.children,
                        n = tV(t, ["children"]),
                        i = u.useMemo(function() {
                            return n
                        }, Object.values(n));
                    return (0, o.jsx)(oV.Provider, {
                        value: i,
                        children: r
                    })
                }).displayName = rE + "Provider", [oG, function(t) {
                    var r = u.useContext(oV);
                    if (r) return r;
                    if (void 0 !== oz) return oz;
                    throw Error("`".concat(t, "` must be used within `").concat(rE, "`"))
                }]), 2),
                rA = (rI[0], rI[1]),
                rT = function(t) {
                    var r = t.titleId,
                        n = rA(rE),
                        i = "`".concat(n.contentName, "` requires a `").concat(n.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(n.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(n.docsSlug);
                    return u.useEffect(function() {
                        r && (document.getElementById(r) || console.error(i))
                    }, [i, r]), null
                },
                rO = function(t) {
                    var r = t.contentRef,
                        n = t.descriptionId,
                        i = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(rA("DialogDescriptionWarning").contentName, "}.");
                    return u.useEffect(function() {
                        var t, a = null == (t = r.current) ? void 0 : t.getAttribute("aria-describedby");
                        n && a && (document.getElementById(n) || console.warn(i))
                    }, [i, r, n]), null
                };

            function rj(t, r) {
                (null == r || r > t.length) && (r = t.length);
                for (var n = 0, i = Array(r); n < r; n++) i[n] = t[n];
                return i
            }

            function rN(t, r, n) {
                return r in t ? Object.defineProperty(t, r, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[r] = n, t
            }

            function rR(t) {
                for (var r = 1; r < arguments.length; r++) {
                    var n = null != arguments[r] ? arguments[r] : {},
                        i = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (i = i.concat(Object.getOwnPropertySymbols(n).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(n, t).enumerable
                    }))), i.forEach(function(r) {
                        rN(t, r, n[r])
                    })
                }
                return t
            }

            function rC(t, r) {
                return r = null != r ? r : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(r)) : (function(t, r) {
                    var n = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var i = Object.getOwnPropertySymbols(t);
                        n.push.apply(n, i)
                    }
                    return n
                })(Object(r)).forEach(function(n) {
                    Object.defineProperty(t, n, Object.getOwnPropertyDescriptor(r, n))
                }), t
            }

            function rM(t, r) {
                if (null == t) return {};
                var n, i, a = function(t, r) {
                    if (null == t) return {};
                    var n, i, a = {},
                        o = Object.keys(t);
                    for (i = 0; i < o.length; i++) n = o[i], r.indexOf(n) >= 0 || (a[n] = t[n]);
                    return a
                }(t, r);
                if (Object.getOwnPropertySymbols) {
                    var o = Object.getOwnPropertySymbols(t);
                    for (i = 0; i < o.length; i++) n = o[i], !(r.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(t, n) && (a[n] = t[n])
                }
                return a
            }

            function rD(t) {
                return function(t) {
                    if (Array.isArray(t)) return rj(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || function(t, r) {
                    if (t) {
                        if ("string" == typeof t) return rj(t, void 0);
                        var n = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return rj(t, r)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rk(t, r) {
                if ("function" == typeof t) return t(r);
                null != t && (t.current = r)
            }
            var rF = Symbol("radix.slottable");

            function rL(t) {
                return u.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === rF
            }
            var r_ = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(t, r) {
                    var n, i, a, s, l, c = (i = n = "Primitive.".concat(r), (a = u.forwardRef(function(t, r) {
                            var n = t.children,
                                i = rM(t, ["children"]);
                            if (u.isValidElement(n)) {
                                var a, o, s, l = (s = null == (a = Object.getOwnPropertyDescriptor(n.props, "ref")) ? void 0 : a.get) && "isReactWarning" in s && s.isReactWarning ? n.ref : (s = null == (o = Object.getOwnPropertyDescriptor(n, "ref")) ? void 0 : o.get) && "isReactWarning" in s && s.isReactWarning ? n.props.ref : n.props.ref || n.ref,
                                    c = function(t, r) {
                                        var n = rR({}, r);
                                        for (var i in r) ! function(i) {
                                            var a = t[i],
                                                o = r[i];
                                            /^on[A-Z]/.test(i) ? a && o ? n[i] = function() {
                                                for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                                                var i = o.apply(void 0, rD(r));
                                                return a.apply(void 0, rD(r)), i
                                            } : a && (n[i] = a) : "style" === i ? n[i] = rR({}, a, o) : "className" === i && (n[i] = [a, o].filter(Boolean).join(" "))
                                        }(i);
                                        return rR({}, t, n)
                                    }(i, n.props);
                                return n.type !== u.Fragment && (c.ref = r ? function() {
                                    for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                                    return function(t) {
                                        var n = !1,
                                            i = r.map(function(r) {
                                                var i = rk(r, t);
                                                return n || "function" != typeof i || (n = !0), i
                                            });
                                        if (n) return function() {
                                            for (var t = 0; t < i.length; t++) {
                                                var n = i[t];
                                                "function" == typeof n ? n() : rk(r[t], null)
                                            }
                                        }
                                    }
                                }(r, l) : l), u.cloneElement(n, c)
                            }
                            return u.Children.count(n) > 1 ? u.Children.only(null) : null
                        })).displayName = "".concat(i, ".SlotClone"), s = a, (l = u.forwardRef(function(t, r) {
                            var n = t.children,
                                i = rM(t, ["children"]),
                                a = u.Children.toArray(n),
                                l = a.find(rL);
                            if (l) {
                                var c = l.props.children,
                                    d = a.map(function(t) {
                                        return t === l ? u.Children.count(c) > 1 ? u.Children.only(null) : u.isValidElement(c) ? c.props.children : null : t
                                    });
                                return (0, o.jsx)(s, rC(rR({}, i), {
                                    ref: r,
                                    children: u.isValidElement(c) ? u.cloneElement(c, void 0, d) : null
                                }))
                            }
                            return (0, o.jsx)(s, rC(rR({}, i), {
                                ref: r,
                                children: n
                            }))
                        })).displayName = "".concat(n, ".Slot"), l),
                        d = u.forwardRef(function(t, n) {
                            var i = t.asChild,
                                a = rM(t, ["asChild"]),
                                s = i ? c : r;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, o.jsx)(s, rC(rR({}, a), {
                                ref: n
                            }))
                        });
                    return d.displayName = "Primitive.".concat(r), rC(rR({}, t), rN({}, r, d))
                }, {}),
                rU = Object.freeze({
                    position: "absolute",
                    border: 0,
                    width: 1,
                    height: 1,
                    padding: 0,
                    margin: -1,
                    overflow: "hidden",
                    clip: "rect(0, 0, 0, 0)",
                    whiteSpace: "nowrap",
                    wordWrap: "normal"
                }),
                rB = u.forwardRef(function(t, r) {
                    return (0, o.jsx)(r_.span, rC(rR({}, t), {
                        ref: r,
                        style: rR({}, rU, t.style)
                    }))
                });

            function rq(t, r) {
                void 0 === r && (r = {});
                var n = r.insertAt;
                if (t && "undefined" != typeof document) {
                    var i = document.head || document.getElementsByTagName("head")[0],
                        a = document.createElement("style");
                    a.type = "text/css", "top" === n && i.firstChild ? i.insertBefore(a, i.firstChild) : i.appendChild(a), a.styleSheet ? a.styleSheet.cssText = t : a.appendChild(document.createTextNode(t))
                }
            }
            rB.displayName = "VisuallyHidden", rq(".bg-common-backdrop{background-color:var(--color-common-backdrop)}.shadow-transient-high{box-shadow:var(--size-0) var(--size-50) var(--size-100) -.5px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-250) var(--size-500) -.75px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-400) var(--size-800) -1px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-1200) var(--size-1400) -1.5px var(--alpha-color-shadow-subtle)}.shadow-transient-low{box-shadow:var(--size-0) var(--size-50) var(--size-100) -.5px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-250) var(--size-500) -.75px var(--alpha-color-shadow-subtle)}.foundation-web-portal-zindex{z-index:1050}.fui-future-shadow-affixed-low{box-shadow:0 0 var(--size-100) 0 var(--fui-future-alpha-color-shadow-subtle),0 0 var(--size-500) 0 var(--fui-future-alpha-color-shadow-subtle)}:root{--light-mode-stroke-contrast-alpha:rgba(27,37,75,.5);--dark-mode-stroke-contrast-alpha:rgba(208,217,251,.4);--color-stroke-contrast-alpha:var(--light-mode-stroke-contrast-alpha);--alpha-light-mode-shadow-subtle:rgba(0,0,0,.08);--alpha-dark-mode-shadow-subtle:rgba(4,4,8,.25);--alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}@media (prefers-color-scheme:dark){:root{--color-stroke-contrast-alpha:var(--dark-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}}.light-theme{--color-stroke-contrast-alpha:var(--light-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}.dark-theme{--color-stroke-contrast-alpha:var(--dark-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}.system-theme{--color-stroke-contrast-alpha:var(--light-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}@media (prefers-color-scheme:dark){.system-theme{--color-stroke-contrast-alpha:var(--dark-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}}.stroke-contrast-alpha{border-color:var(--color-stroke-contrast-alpha)}.foundation-web-input.focus-within\\:stroke-system-emphasis:focus-within{box-shadow:inset 0 0 0 1px var(--color-system-emphasis)}.foundation-web-input.focus-within\\:stroke-system-alert:focus-within{box-shadow:inset 0 0 0 1px var(--color-system-alert)}");
            var rz = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                rV = d().forwardRef(function(t, r) {
                    var n = t.name,
                        i = t.size,
                        a = t.className,
                        o = (t.children, Q(t, ["name", "size", "className", "children"]));
                    return d().createElement("span", Object.assign({
                        ref: r,
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-icon",
                        className: Z("grow-0 shrink-0 basis-auto icon", n, rz[void 0 === i ? "Medium" : i], a)
                    }, o))
                });
            rV.displayName = "Icon";
            var rG = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                rH = function(t) {
                    var r = t.className;
                    return d().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: Z("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", r)
                    })
                },
                rW = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-medium"
                },
                rX = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                rK = function(t) {
                    var r = t.variant,
                        n = t.size,
                        i = t.isCircular,
                        a = t.className,
                        o = Q(t, ["variant", "size", "isCircular", "className"]);
                    return d().createElement("button", Object.assign({
                        type: "button",
                        className: Z("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", rG, rX[r], rW[n], i && "radius-circle", a)
                    }, o), d().createElement(rH, null), d().createElement(rV, {
                        name: "icon-regular-x",
                        size: n
                    }))
                };
            rq(".foundation-web-dialog-overlay{bottom:0;display:grid;left:0;overflow-y:auto;place-items:center;position:fixed;right:0;top:0}.foundation-web-dialog-close-container{right:var(--size-300);top:var(--size-300);z-index:1}.foundation-web-dialog-hero-media{border-top-left-radius:var(--radius-large);border-top-right-radius:var(--radius-large);margin-left:calc(var(--stroke-standard)*-1);margin-right:calc(var(--stroke-standard)*-1);margin-top:calc(var(--stroke-standard)*-1);overflow:clip}.foundation-web-dialog-content[data-size=Small]{max-width:calc(var(--size-100)*80);min-width:calc(var(--size-100)*75)}.foundation-web-dialog-content[data-size=Medium]{max-width:calc(var(--size-100)*120);min-width:calc(var(--size-100)*75)}.foundation-web-dialog-content[data-size=Large]{max-width:calc(var(--size-100)*160);min-width:calc(var(--size-100)*75)}@keyframes foundation-web-dialog-backdrop-fade-in{0%{opacity:0}to{opacity:1}}@keyframes foundation-web-dialog-backdrop-fade-out{0%{opacity:1}to{opacity:0}}@keyframes foundation-web-dialog-content-scale-in{0%{transform:scale(.975)}to{transform:scale(1)}}@keyframes foundation-web-dialog-content-scale-out{0%{transform:scale(1)}to{transform:scale(.975)}}@media (prefers-reduced-motion:no-preference){.foundation-web-dialog-overlay[data-state=open]{animation:foundation-web-dialog-backdrop-fade-in var(--time-100) var(--ease-linear)}.foundation-web-dialog-overlay[data-state=closed]{animation:foundation-web-dialog-backdrop-fade-out var(--time-100) var(--ease-linear)}.foundation-web-dialog-content[data-state=open]{animation:foundation-web-dialog-content-scale-in var(--time-300) var(--ease-standard-out)}.foundation-web-dialog-content[data-state=closed]{animation:foundation-web-dialog-content-scale-out var(--time-300) var(--ease-standard-out)}}");
            var rY = (0, u.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    hasDescription: !1,
                    type: "Default"
                }),
                r$ = function() {
                    var t = (0, u.useContext)(rY);
                    if (!t) throw Error("Dialog components must be used within a Dialog");
                    return t
                },
                rJ = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                rQ = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                rZ = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                r0 = function(t) {
                    var r = t.open,
                        n = t.onOpenChange,
                        i = t.children,
                        a = t.size,
                        o = t.type,
                        s = void 0 === o ? "Default" : o,
                        l = t.isModal,
                        c = t.hasCloseAffordance,
                        f = t.closeLabel,
                        p = t.hasMarginTop,
                        m = void 0 === p || p,
                        h = t.hasMarginBottom,
                        b = void 0 === h || h,
                        y = t.hasDescription,
                        v = void 0 !== y && y,
                        g = t.experimentalDisablePointerEventsStylingOnBody,
                        w = void 0 !== g && g,
                        x = (0, u.useMemo)(function() {
                            return {
                                size: a,
                                isModal: l,
                                type: s,
                                hasCloseAffordance: c,
                                closeLabel: f,
                                hasMarginTop: m,
                                hasMarginBottom: b,
                                hasDescription: v
                            }
                        }, [a, l, s, c, f, m, b, v]);
                    return (0, u.useEffect)(function() {
                        w && setTimeout(function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }, 0)
                    }, [w, r]), d().createElement(rY.Provider, {
                        value: x
                    }, d().createElement(rr, {
                        open: r,
                        onOpenChange: n
                    }, i))
                };
            r0.displayName = "Dialog";
            var r1 = function(t) {
                var r = t.children,
                    n = t.className,
                    i = t.style,
                    a = t.overlayClassName,
                    o = t.overlayStyle,
                    s = t.onOpenAutoFocus,
                    l = Q(t, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
                    c = r$(),
                    u = c.size,
                    f = c.isModal,
                    p = c.hasCloseAffordance,
                    m = c.closeLabel,
                    h = c.hasDescription,
                    b = Z("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", f && "bg-common-backdrop", a),
                    y = Z("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", n);
                return d().createElement(rl, null, d().createElement(ru, {
                    className: b,
                    style: o
                }, d().createElement(rm, Object.assign({
                    className: y,
                    "data-size": u,
                    style: i,
                    onOpenAutoFocus: s
                }, !h && {
                    "aria-describedby": void 0
                }, l), p && d().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, d().createElement(rS, {
                    asChild: !0
                }, d().createElement(rK, {
                    variant: "OverMedia",
                    size: u,
                    isCircular: !0,
                    "aria-label": m
                }))), r)))
            };
            r1.displayName = "DialogContent";
            var r2 = function(t) {
                var r = t.children,
                    n = t.className,
                    i = Q(t, ["children", "className"]),
                    a = r$(),
                    o = a.size,
                    s = a.hasMarginTop,
                    l = a.hasMarginBottom,
                    c = Z(rJ[o], s && rQ[o], l && rZ[o], n);
                return d().createElement("div", Object.assign({
                    className: c
                }, i), r)
            };
            r2.displayName = "DialogBody";
            var r3 = function(t) {
                var r = t.children,
                    n = t.className,
                    i = Q(t, ["children", "className"]),
                    a = r$().size,
                    o = Z(rJ[a], rZ[a], n);
                return d().createElement("div", Object.assign({
                    className: o
                }, i), r)
            };

            function r4(t, r) {
                (null == r || r > t.length) && (r = t.length);
                for (var n = 0, i = Array(r); n < r; n++) i[n] = t[n];
                return i
            }

            function r6(t) {
                for (var r = 1; r < arguments.length; r++) {
                    var n = null != arguments[r] ? arguments[r] : {},
                        i = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (i = i.concat(Object.getOwnPropertySymbols(n).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(n, t).enumerable
                    }))), i.forEach(function(r) {
                        var i;
                        i = n[r], r in t ? Object.defineProperty(t, r, {
                            value: i,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : t[r] = i
                    })
                }
                return t
            }

            function r8(t, r) {
                return r = null != r ? r : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(r)) : (function(t, r) {
                    var n = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var i = Object.getOwnPropertySymbols(t);
                        n.push.apply(n, i)
                    }
                    return n
                })(Object(r)).forEach(function(n) {
                    Object.defineProperty(t, n, Object.getOwnPropertyDescriptor(r, n))
                }), t
            }

            function r5(t, r) {
                if (null == t) return {};
                var n, i, a = function(t, r) {
                    if (null == t) return {};
                    var n, i, a = {},
                        o = Object.keys(t);
                    for (i = 0; i < o.length; i++) n = o[i], r.indexOf(n) >= 0 || (a[n] = t[n]);
                    return a
                }(t, r);
                if (Object.getOwnPropertySymbols) {
                    var o = Object.getOwnPropertySymbols(t);
                    for (i = 0; i < o.length; i++) n = o[i], !(r.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(t, n) && (a[n] = t[n])
                }
                return a
            }

            function r7(t) {
                return function(t) {
                    if (Array.isArray(t)) return r4(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || function(t, r) {
                    if (t) {
                        if ("string" == typeof t) return r4(t, void 0);
                        var n = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return r4(t, r)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function r9(t) {
                return t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t
            }

            function ne(t, r) {
                if ("function" == typeof t) return t(r);
                null != t && (t.current = r)
            }
            r3.displayName = "DialogFooter";
            var nt = Symbol.for("react.lazy"),
                nr = u[" use ".trim().toString()];

            function nn(t) {
                var r;
                return null != t && "object" == (void 0 === t ? "undefined" : r9(t)) && "$$typeof" in t && t.$$typeof === nt && "_payload" in t && "object" == r9(r = t._payload) && null !== r && "then" in r
            }
            var ni = ((oq = u.forwardRef(function(t, r) {
                    var n = t.children,
                        i = r5(t, ["children"]);
                    if (nn(n) && "function" == typeof nr && (n = nr(n._payload)), u.isValidElement(n)) {
                        var a, o, s, l, c = (l = null == (o = Object.getOwnPropertyDescriptor((a = n).props, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning ? a.ref : (l = null == (s = Object.getOwnPropertyDescriptor(a, "ref")) ? void 0 : s.get) && "isReactWarning" in l && l.isReactWarning ? a.props.ref : a.props.ref || a.ref,
                            d = function(t, r) {
                                var n = r6({}, r);
                                for (var i in r) ! function(i) {
                                    var a = t[i],
                                        o = r[i];
                                    /^on[A-Z]/.test(i) ? a && o ? n[i] = function() {
                                        for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                                        var i = o.apply(void 0, r7(r));
                                        return a.apply(void 0, r7(r)), i
                                    } : a && (n[i] = a) : "style" === i ? n[i] = r6({}, a, o) : "className" === i && (n[i] = [a, o].filter(Boolean).join(" "))
                                }(i);
                                return r6({}, t, n)
                            }(i, n.props);
                        return n.type !== u.Fragment && (d.ref = r ? function() {
                            for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                            return function(t) {
                                var n = !1,
                                    i = r.map(function(r) {
                                        var i = ne(r, t);
                                        return n || "function" != typeof i || (n = !0), i
                                    });
                                if (n) return function() {
                                    for (var t = 0; t < i.length; t++) {
                                        var n = i[t];
                                        "function" == typeof n ? n() : ne(r[t], null)
                                    }
                                }
                            }
                        }(r, c) : c), u.cloneElement(n, d)
                    }
                    return u.Children.count(n) > 1 ? u.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), oH = oq, (oW = u.forwardRef(function(t, r) {
                    var n = t.children,
                        i = r5(t, ["children"]);
                    nn(n) && "function" == typeof nr && (n = nr(n._payload));
                    var a = u.Children.toArray(n),
                        s = a.find(no);
                    if (s) {
                        var l = s.props.children,
                            c = a.map(function(t) {
                                return t === s ? u.Children.count(l) > 1 ? u.Children.only(null) : u.isValidElement(l) ? l.props.children : null : t
                            });
                        return (0, o.jsx)(oH, r8(r6({}, i), {
                            ref: r,
                            children: u.isValidElement(l) ? u.cloneElement(l, void 0, c) : null
                        }))
                    }
                    return (0, o.jsx)(oH, r8(r6({}, i), {
                        ref: r,
                        children: n
                    }))
                })).displayName = "".concat("Slot", ".Slot"), oW),
                na = Symbol("radix.slottable");

            function no(t) {
                return u.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === na
            }
            var ns = "opacity-[0.5]";
            rq("@keyframes rotation{0%{transform:rotate(0deg)}to{transform:rotate(359deg)}}.foundation-web-loading-spinner{animation:rotation 1s linear infinite normal}");
            var nl = function(t) {
                    var r = t.width,
                        n = t.height;
                    return d().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: r,
                        height: n,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, d().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                },
                nc = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                nu = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                nd = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                nf = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                np = (0, u.forwardRef)(function(t, r) {
                    var n = t.children,
                        i = t.className,
                        a = t.style,
                        o = t.isDisabled,
                        s = void 0 !== o && o,
                        l = t.isLoading,
                        c = void 0 !== l && l,
                        u = t.icon,
                        f = t.size,
                        p = void 0 === f ? "Large" : f,
                        m = t.variant,
                        h = void 0 === m ? "Emphasis" : m,
                        b = t.asChild,
                        y = Q(t, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        v = Z("foundation-web-button", s ? ns : [rG, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", nu[p], s ? nf[h] : nd[h], i),
                        g = Object.assign({
                            textDecoration: "none"
                        }, a),
                        w = function(t) {
                            return d().createElement(d().Fragment, null, d().createElement(rH, null), c && d().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, d().createElement(nl, {
                                width: nc[p],
                                height: nc[p]
                            })), d().createElement("span", {
                                className: Z("flex items-center min-width-0", "Large" === p || "Medium" === p ? "gap-small" : "gap-xsmall", c && "invisible")
                            }, u && d().createElement(rV, {
                                name: u,
                                size: p
                            }), d().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, t)))
                        };
                    if (b) {
                        var x = Q(y, ["as"]),
                            S = d().Children.only(n);
                        return d().createElement(ni, Object.assign({
                            ref: r
                        }, x, {
                            className: v,
                            style: g,
                            "aria-disabled": s || void 0
                        }), d().cloneElement(S, {}, w(S.props.children)))
                    }
                    if ("a" === y.as) {
                        y.as;
                        var P = y.href,
                            E = Q(y, ["as", "href"]);
                        return d().createElement("a", Object.assign({
                            ref: r
                        }, E, {
                            "aria-disabled": s,
                            href: s ? void 0 : P,
                            className: v,
                            style: g
                        }), w(n))
                    }
                    var I = Q(y, ["as"]);
                    return d().createElement("button", Object.assign({
                        ref: r,
                        type: "button"
                    }, I, {
                        disabled: s,
                        className: v,
                        style: g
                    }), w(n))
                });

            function nm(t, r) {
                (null == r || r > t.length) && (r = t.length);
                for (var n = 0, i = Array(r); n < r; n++) i[n] = t[n];
                return i
            }

            function nh(t) {
                return function(t) {
                    if (Array.isArray(t)) return nm(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || function(t, r) {
                    if (t) {
                        if ("string" == typeof t) return nm(t, void 0);
                        var n = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return nm(t, r)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var nb = "__FN_nvfToKPAOuiV__",
                ny = new RegExp("".concat(nb, "(\\d+)\\|")),
                nv = function(t, r, n, i) {
                    var a = function(t) {
                            for (var r = 1; r < arguments.length; r++) {
                                var n = null != arguments[r] ? arguments[r] : {},
                                    i = Object.keys(n);
                                "function" == typeof Object.getOwnPropertySymbols && (i = i.concat(Object.getOwnPropertySymbols(n).filter(function(t) {
                                    return Object.getOwnPropertyDescriptor(n, t).enumerable
                                }))), i.forEach(function(r) {
                                    var i;
                                    i = n[r], r in t ? Object.defineProperty(t, r, {
                                        value: i,
                                        enumerable: !0,
                                        configurable: !0,
                                        writable: !0
                                    }) : t[r] = i
                                })
                            }
                            return t
                        }({}, i),
                        s = {};
                    null == n || n.forEach(function(t, r) {
                        var n = r.toString(),
                            i = "".concat(nb).concat(n, "|"),
                            o = "".concat("__FN_END_nvfToKPAOuiV__").concat(n, "|");
                        a[t.opening] = i, a[t.closing] = o, s[n] = {
                            start: i,
                            end: o,
                            render: t.render,
                            used: !1
                        }
                    });
                    var l = t(r, a),
                        c = function(t) {
                            var n = [],
                                i = ny.exec(t);
                            if (!i) return [t];
                            i.index > 0 && n.push(t.slice(0, i.index));
                            var a = i[1] && s[i[1]];
                            if (!a) return console.warn("Unexpected malformed segment", r), [];
                            a.used = !0;
                            var o = t.indexOf(a.end);
                            if (-1 === o) return console.warn("Unexpected malformed segment", r), [];
                            var l = t.slice(i.index + i[0].length, o),
                                u = a.render(c(l));
                            Array.isArray(u) ? n.push.apply(n, nh(u)) : n.push(u);
                            var d = t.slice(o + a.end.length);
                            return d.length > 0 && n.push.apply(n, nh(c(d))), n
                        },
                        d = c(l).filter(function(t) {
                            return "" !== t
                        });
                    return Object.values(s).some(function(t) {
                        return !t.used
                    }) ? (console.warn("Unused segments found", r), []) : d.map(function(t, r) {
                        return (0, o.jsx)(u.Fragment, {
                            children: t
                        }, r)
                    })
                },
                ng = (0, c.withTranslations)(function(t) {
                    var r = t.translate,
                        n = t.price,
                        i = t.color,
                        a = void 0 === i ? "" : i,
                        s = t.useFreeText;
                    return 0 === n && (void 0 === s || s) ? (0, o.jsx)("span", {
                        className: "text-robux text-free",
                        children: r(v.freeLabel)
                    }) : (0, o.jsxs)(d().Fragment, {
                        children: [(0, o.jsx)("span", {
                            className: "icon-robux".concat(a ? "-".concat(a) : "", "-16x16")
                        }), (0, o.jsx)("span", {
                            className: "text-robux ml-1 text-body-medium",
                            children: (0, F.formatNumber)(n)
                        })]
                    })
                }, h),
                nw = function(t) {
                    var r = t.translate,
                        n = t.titleText,
                        i = t.currentRobuxBalance;
                    return (0, o.jsxs)("div", {
                        id: "rbx-unified-purchase-heading",
                        className: "flex flex-row items-center justify-between",
                        style: {
                            paddingRight: 42
                        },
                        children: [(0, o.jsx)("span", {
                            className: "text-heading-medium",
                            children: n
                        }), "number" == typeof i && (0, o.jsx)("div", {
                            className: "flex flex-row items-center",
                            children: (0, o.jsx)(ng, {
                                translate: r,
                                price: i,
                                color: "",
                                useFreeText: !1
                            })
                        })]
                    })
                },
                nx = (0, c.withTranslations)(function(t) {
                    var r = t.open,
                        n = t.onClose,
                        i = t.itemName,
                        a = t.currentRobuxBalance,
                        s = t.translate,
                        l = s(v.purchaseCompleteHeading),
                        c = s(v.okAction),
                        u = [{
                            opening: "boldStart",
                            closing: "boldEnd",
                            render: function(t) {
                                return (0, o.jsx)("b", {
                                    children: t
                                })
                            }
                        }];
                    return (0, o.jsx)(r0, {
                        open: r,
                        onOpenChange: n,
                        size: "Medium",
                        isModal: !0,
                        hasCloseAffordance: !0,
                        closeLabel: s("Action.Close"),
                        children: (0, o.jsxs)(r1, {
                            className: "relative width-full",
                            "aria-describedby": "unified-purchase-completion-modal-body",
                            children: [(0, o.jsxs)(r2, {
                                className: "gap-xlarge flex flex-col",
                                children: [(0, o.jsx)("div", {
                                    style: {
                                        marginTop: -4
                                    },
                                    children: (0, o.jsx)(nw, {
                                        translate: s,
                                        titleText: l,
                                        currentRobuxBalance: a
                                    })
                                }), (0, o.jsx)("div", {
                                    className: "flex justify-center gap-bottom-large",
                                    children: (0, o.jsx)(rV, {
                                        name: "icon-regular-circle-check",
                                        size: "XLarge",
                                        style: {
                                            fontSize: 48,
                                            width: 48,
                                            height: 48,
                                            lineHeight: 1
                                        }
                                    })
                                }), (0, o.jsx)("div", {
                                    id: "unified-purchase-completion-modal-body",
                                    className: "text-center text-body-large",
                                    children: nv(s, v.unifiedPurchaseCompletionMessage, u, {
                                        assetName: i
                                    })
                                })]
                            }), (0, o.jsx)(r3, {
                                className: "gap-small flex flex-col mt-[40px]",
                                children: (0, o.jsx)("div", {
                                    className: "flex flex-row-reverse",
                                    children: (0, o.jsx)(np, {
                                        variant: "Emphasis",
                                        className: "fill basis-0",
                                        onClick: n,
                                        children: c
                                    })
                                })
                            })]
                        })
                    })
                }, h),
                nS = ((oX = nS || {}).Bought = "bought", oX.Renewed = "renewed", oX);

            function nP(t, r) {
                (null == r || r > t.length) && (r = t.length);
                for (var n = 0, i = Array(r); n < r; n++) i[n] = t[n];
                return i
            }

            function nE(t, r) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, r) {
                    var n, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var o = [],
                            s = !0,
                            l = !1;
                        try {
                            for (a = a.call(t); !(s = (n = a.next()).done) && (o.push(n.value), !r || o.length !== r); s = !0);
                        } catch (t) {
                            l = !0, i = t
                        } finally {
                            try {
                                s || null == a.return || a.return()
                            } finally {
                                if (l) throw i
                            }
                        }
                        return o
                    }
                }(t, r) || function(t, r) {
                    if (t) {
                        if ("string" == typeof t) return nP(t, r);
                        var n = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return nP(t, r)
                    }
                }(t, r) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nI(t) {
                var r = t.customPurchaseConfirmationModal,
                    n = nE((0, m.createModal)(), 2),
                    i = n[0],
                    a = n[1],
                    s = null;

                function l(t) {
                    var n, a, l, c = t.translate,
                        u = t.expectedPrice,
                        f = t.thumbnail,
                        p = t.assetName,
                        m = t.assetType,
                        h = t.assetIsWearable,
                        b = t.assetTypeDisplayName,
                        y = t.sellerName,
                        g = t.isPlace,
                        w = t.isPrivateServer,
                        x = t.onAccept,
                        S = t.onDecline,
                        P = t.transactionVerb,
                        I = t.itemDelayed,
                        A = t.currentRobuxBalance,
                        O = t.shouldShowUnifiedPurchaseCompletionModal,
                        j = nE(d().useState(!1), 2),
                        N = j[0],
                        R = j[1];
                    d().useEffect(function() {
                        if (r || O) return s = R,
                            function() {
                                s === R && (s = null)
                            };
                        s = null
                    }, [O]);
                    var C = c(v.continueAction);
                    w ? (n = c(v.configureAction), C = c(v.notNowAction)) : I ? (n = c(v.customizeAction), C = c(v.doneAction)) : h && (n = c(v.customizeAction), C = c(v.notNowAction), a = function() {
                        return window.location.href = T.urlService.getAbsoluteUrl("/my/avatar"), !1
                    });
                    var M = {
                        assetName: (0, E.renderToString)((0, o.jsx)(K, {
                            name: p
                        })),
                        assetType: b || m,
                        seller: (0, X.escapeHtml)(y),
                        robux: (0, E.renderToString)((0, o.jsx)(_, {
                            price: u
                        }))
                    };
                    l = P === nS.Bought ? g ? v.successfullyAcquiredAccessMessage : v.successfullyBoughtMessage : P === nS.Renewed ? g ? v.successfullyRenewedAccessMessage : v.successfullyRenewedMessage : g ? v.successfullyAcquiredAccessMessage : v.successfullyAcquiredMessage;
                    var D = (0, o.jsx)("div", {
                        className: "modal-message",
                        dangerouslySetInnerHTML: {
                            __html: "".concat(c(l, M), " ").concat(I ? c(v.itemGrantDelayMessage) : "")
                        }
                    });
                    return r ? d().createElement(r, {
                        open: N,
                        onClose: function() {
                            R(!1), S ? S() : window.location.reload()
                        },
                        itemName: p
                    }) : O && !w ? (0, o.jsx)(nx, {
                        open: N,
                        onClose: function() {
                            R(!1), S ? S() : window.location.reload()
                        },
                        itemName: p,
                        currentRobuxBalance: A - u
                    }) : (0, o.jsx)(i, {
                        title: c(v.purchaseCompleteHeading),
                        body: D,
                        thumbnail: f,
                        neutralButtonText: C,
                        actionButtonText: n,
                        onAction: x || a,
                        onNeutral: S,
                        footerText: !w && (0, o.jsx)(V, {
                            expectedPrice: u,
                            currentRobuxBalance: A
                        }),
                        actionButtonShow: !!n,
                        disableActionButton: I,
                        onClose: function() {
                            return window.location.reload()
                        }
                    })
                }
                return l.defaultProps = {
                    isPlace: !1,
                    assetTypeDisplayName: "",
                    transactionVerb: "",
                    assetIsWearable: !1,
                    isPrivateServer: !1,
                    onAccept: null,
                    onDecline: null,
                    itemDelayed: !1,
                    currentRobuxBalance: void 0,
                    shouldShowUnifiedPurchaseCompletionModal: !1
                }, l.propTypes = {
                    translate: p().func.isRequired,
                    transactionVerb: p().string,
                    expectedPrice: p().number.isRequired,
                    thumbnail: p().node.isRequired,
                    assetName: p().string.isRequired,
                    assetType: p().string.isRequired,
                    assetTypeDisplayName: p().string,
                    assetIsWearable: p().bool,
                    sellerName: p().string.isRequired,
                    isPlace: p().bool,
                    isPrivateServer: p().bool,
                    onAccept: p().func,
                    onDecline: p().func,
                    itemDelayed: p().bool,
                    currentRobuxBalance: p().number,
                    shouldShowUnifiedPurchaseCompletionModal: p().bool
                }, [(0, c.withTranslations)(l, h), {
                    open: function() {
                        s ? s(!0) : a.open()
                    },
                    close: function() {
                        s ? s(!1) : a.close()
                    }
                }]
            }
            var nA = window.Roblox,
                nT = window.TanstackQuery,
                nO = window.Roblox["core-scripts"].http.http,
                nj = function(t, r) {
                    var n, i = {
                        url: (n = t, "".concat(N, "/marketplace-sales/v1/item/").concat(n, "/purchase-item")),
                        retryable: !0,
                        withCredentials: !0
                    };
                    return nO.post(i, r)
                },
                nN = function(t, r) {
                    var n, i = {
                        url: (n = t, "".concat(N, "/marketplace-sales/v1/item/").concat(n, "/purchase-resale")),
                        retryable: !0,
                        withCredentials: !0
                    };
                    return nO.post(i, r)
                },
                nR = function(t, r) {
                    var n, i = {
                        url: (n = t, "".concat(N, "/developer-products/v1/developer-products/").concat(n, "/purchase?requestLocationType=ExperienceDetailPage")),
                        withCredentials: !0
                    };
                    return nO.post(i, r)
                },
                nC = function(t, r) {
                    var n, i = {
                        url: (n = t, "".concat(N, "/game-passes/v1/game-passes/").concat(n, "/purchase")),
                        retryable: !0,
                        withCredentials: !0
                    };
                    return nO.post(i, r)
                },
                nM = function(t, r) {
                    var n, i = {
                        url: (n = t, "".concat(O, "/v1/purchases/products/").concat(n)),
                        retryable: !0,
                        withCredentials: !0
                    };
                    return nO.post(i, r)
                },
                nD = function(t, r) {
                    var n, i = {
                        url: (n = t, "".concat(N, "/v1/subscriptions/purchase-with-robux/").concat(n)),
                        withCredentials: !0
                    };
                    return nO.post(i, r)
                },
                nk = function(t, r) {
                    var n, i = {
                        url: (n = t, "".concat(N, "/v1/subscriptions/prepare-purchase/").concat(n, "/web")),
                        withCredentials: !0
                    };
                    return nO.post(i, r)
                },
                nF = function(t, r, n, i) {
                    var a = {
                        url: "".concat("".concat(N, "/cloud/v2/avatar-marketplace-orders"), "?idempotencyKey.key=").concat(i),
                        retryable: !0,
                        withCredentials: !0
                    };
                    return nO.post(a, {
                        purchasingUser: "users/".concat(t),
                        context: {
                            productSurface: r
                        },
                        fulfillmentGroups: [n]
                    })
                },
                nL = function(t, r) {
                    var n, i, a = {
                        url: (n = t, i = r, "".concat(j, "/v1/catalog/items/").concat(n, "/details?itemType=").concat(i)),
                        retryable: !0,
                        withCredentials: !0
                    };
                    return nO.get(a)
                },
                n_ = function(t) {
                    var r, n = {
                        url: (r = t, "".concat(O, "/v1/products/").concat(r, "?showPurchasable=true")),
                        retryable: !0,
                        withCredentials: !0
                    };
                    return nO.get(n)
                },
                nU = function(t) {
                    var r, n = {
                        url: (r = t, "".concat(O, "/v1/assets/").concat(r, "/resellers?limit=10")),
                        retryable: !0,
                        withCredentials: !0
                    };
                    return nO.get(n)
                },
                nB = function() {
                    return nO.get({
                        url: "".concat(O, "/v2/metadata"),
                        retryable: !0,
                        withCredentials: !0
                    })
                },
                nq = function(t) {
                    var r, n = {
                        url: (r = t, "".concat(O, "/v1/users/").concat(r, "/currency")),
                        retryable: !0,
                        withCredentials: !0
                    };
                    return nO.get(n)
                };

            function nz(t, r, n, i, a, o, s) {
                try {
                    var l = t[o](s),
                        c = l.value
                } catch (t) {
                    n(t);
                    return
                }
                l.done ? r(c) : Promise.resolve(c).then(i, a)
            }

            function nV(t) {
                return function() {
                    var r = this,
                        n = arguments;
                    return new Promise(function(i, a) {
                        var o = t.apply(r, n);

                        function s(t) {
                            nz(o, i, a, s, l, "next", t)
                        }

                        function l(t) {
                            nz(o, i, a, s, l, "throw", t)
                        }
                        s(void 0)
                    })
                }
            }

            function nG(t, r) {
                var n, i, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return s.next = l(0), s.throw = l(1), s.return = l(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
                    return this
                }), s;

                function l(l) {
                    return function(c) {
                        var u = [l, c];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; s && (s = 0, u[0] && (o = 0)), o;) try {
                            if (n = 1, i && (a = 2 & u[0] ? i.return : u[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, u[1])).done) return a;
                            switch (i = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                case 0:
                                case 1:
                                    a = u;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, i = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                        o.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && o.label < a[1]) {
                                        o.label = a[1], a = u;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(u);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            u = r.call(t, o)
                        } catch (t) {
                            u = [6, t], i = 0
                        } finally {
                            n = a = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function nH(t, r, n, i, a, o, s) {
                try {
                    var l = t[o](s),
                        c = l.value
                } catch (t) {
                    n(t);
                    return
                }
                l.done ? r(c) : Promise.resolve(c).then(i, a)
            }

            function nW(t) {
                return function() {
                    var r = this,
                        n = arguments;
                    return new Promise(function(i, a) {
                        var o = t.apply(r, n);

                        function s(t) {
                            nH(o, i, a, s, l, "next", t)
                        }

                        function l(t) {
                            nH(o, i, a, s, l, "throw", t)
                        }
                        s(void 0)
                    })
                }
            }

            function nX(t, r) {
                var n, i, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return s.next = l(0), s.throw = l(1), s.return = l(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
                    return this
                }), s;

                function l(l) {
                    return function(c) {
                        var u = [l, c];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; s && (s = 0, u[0] && (o = 0)), o;) try {
                            if (n = 1, i && (a = 2 & u[0] ? i.return : u[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, u[1])).done) return a;
                            switch (i = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                case 0:
                                case 1:
                                    a = u;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, i = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                        o.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && o.label < a[1]) {
                                        o.label = a[1], a = u;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(u);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            u = r.call(t, o)
                        } catch (t) {
                            u = [6, t], i = 0
                        } finally {
                            n = a = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var nK = nA.AccountIntegrityChallengeService.TwoStepVerification;

            function nY(t) {
                var r = t.systemFeedbackService,
                    n = t.translate;
                r.warning(n("Response.VerificationError"))
            }
            var n$ = (0, c.withTranslations)(function(t) {
                    var r = t.translate,
                        n = t.isTwoStepVerificationActive,
                        i = t.stopTwoStepVerification,
                        a = t.systemFeedbackService;
                    return (0, u.useEffect)(function() {
                        n && nW(function() {
                            return nX(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        return [4, nV(function() {
                                            var t, r, n;
                                            return nG(this, function(i) {
                                                switch (i.label) {
                                                    case 0:
                                                        var a;
                                                        t = {
                                                            url: (a = nA.CurrentUser.userId, "".concat(R, "/v1/users/").concat(a, "/configuration")),
                                                            retryable: !0,
                                                            withCredentials: !0
                                                        }, i.label = 1;
                                                    case 1:
                                                        return i.trys.push([1, 3, , 4]), [4, nO.get(t)];
                                                    case 2:
                                                        return [2, ((null == (n = i.sent()) || null == (r = n.data) ? void 0 : r.methods) || []).some(function(t) {
                                                            return !!t.enabled
                                                        })];
                                                    case 3:
                                                        return i.sent(), [2, !1];
                                                    case 4:
                                                        return [2]
                                                }
                                            })
                                        })()];
                                    case 1:
                                        if (t.sent()) ! function t(r) {
                                            return nW(function(r) {
                                                var n, i, a, o, s;
                                                return nX(this, function(l) {
                                                    switch (l.label) {
                                                        case 0:
                                                            return n = r.stopTwoStepVerification, i = r.systemFeedbackService, a = r.totalAttempts, o = r.translate, [4, nV(function() {
                                                                var t;
                                                                return nG(this, function(r) {
                                                                    switch (r.label) {
                                                                        case 0:
                                                                            var n;
                                                                            t = {
                                                                                url: (n = "spend-friction", "".concat(O, "/v2/").concat(n, "/two-step-verification/generate")),
                                                                                retryable: !0,
                                                                                withCredentials: !0
                                                                            }, r.label = 1;
                                                                        case 1:
                                                                            return r.trys.push([1, 3, , 4]), [4, nO.post(t)];
                                                                        case 2:
                                                                            return [2, r.sent().data || null];
                                                                        case 3:
                                                                            return r.sent(), [2, null];
                                                                        case 4:
                                                                            return [2]
                                                                    }
                                                                })
                                                            })()];
                                                        case 1:
                                                            return (s = l.sent()) ? nA.AccountIntegrityChallengeService.TwoStepVerification.renderChallenge({
                                                                containerId: "two-sv-popup-entry",
                                                                userId: nA.CurrentUser.userId,
                                                                challengeId: s,
                                                                actionType: nK.ActionType.RobuxSpend,
                                                                renderInline: !1,
                                                                shouldShowRememberDeviceCheckbox: !1,
                                                                onChallengeCompleted: function(t) {
                                                                    return nW(function() {
                                                                        var r;
                                                                        return nX(this, function(a) {
                                                                            var l, c, u, d;
                                                                            switch (a.label) {
                                                                                case 0:
                                                                                    return [4, (l = t.verificationToken, nV(function() {
                                                                                        var t, r, n;
                                                                                        return nG(this, function(i) {
                                                                                            switch (i.label) {
                                                                                                case 0:
                                                                                                    var a;
                                                                                                    t = {
                                                                                                        url: (a = "spend-friction", "".concat(O, "/v2/").concat(a, "/two-step-verification/redeem")),
                                                                                                        retryable: !0,
                                                                                                        withCredentials: !0
                                                                                                    }, r = {
                                                                                                        challengeToken: s,
                                                                                                        verificationToken: l
                                                                                                    }, i.label = 1;
                                                                                                case 1:
                                                                                                    return i.trys.push([1, 3, , 4]), [4, nO.post(t, r)];
                                                                                                case 2:
                                                                                                    return [2, null != (n = i.sent().data) && n];
                                                                                                case 3:
                                                                                                    return i.sent(), [2, !1];
                                                                                                case 4:
                                                                                                    return [2]
                                                                                            }
                                                                                        })
                                                                                    })())];
                                                                                case 1:
                                                                                    return (r = a.sent(), n(), r) ? (u = (c = {
                                                                                        systemFeedbackService: i,
                                                                                        translate: o
                                                                                    }).systemFeedbackService, d = c.translate, u.success(d("Response.SuccessfulVerificationV2"))) : nY({
                                                                                        systemFeedbackService: i,
                                                                                        translate: o
                                                                                    }), [2]
                                                                            }
                                                                        })
                                                                    })()
                                                                },
                                                                onChallengeInvalidated: function() {
                                                                    var r = a || 0;
                                                                    r < 3 ? t({
                                                                        stopTwoStepVerification: n,
                                                                        systemFeedbackService: i,
                                                                        translate: o,
                                                                        totalAttempts: r + 1
                                                                    }) : (nY({
                                                                        systemFeedbackService: i,
                                                                        translate: o
                                                                    }), n())
                                                                },
                                                                onModalChallengeAbandoned: function() {}
                                                            }) : nY({
                                                                systemFeedbackService: i,
                                                                translate: o
                                                            }), [2]
                                                    }
                                                })
                                            }).apply(this, arguments)
                                        }({
                                            stopTwoStepVerification: i,
                                            systemFeedbackService: a,
                                            translate: r
                                        });
                                        else {
                                            var n;
                                            n = {
                                                titleText: r("Heading.TwoStepVerificationRequiredV3"),
                                                bodyContent: r("Message.TwoStepVerificationRequiredV4"),
                                                imageUrl: void 0,
                                                acceptText: r("Action.GoToSecurity"),
                                                acceptColor: "btn-primary-md",
                                                onAccept: function() {
                                                    window.location.href = nA.Endpoints.getAbsoluteUrl("/my/account#!/security")
                                                },
                                                declineText: r("Action.Cancel"),
                                                dismissable: !0,
                                                allowHtmlContentInBody: !0,
                                                onOpenCallback: function() {}
                                            }, nA.Dialog.open(n)
                                        }
                                        return [2]
                                }
                            })
                        })()
                    }, [n]), (0, o.jsx)("div", {
                        id: "two-sv-popup-entry"
                    })
                }, h),
                nJ = {
                    GAME_PASS: "Game Pass",
                    BUNDLE: "Bundle",
                    BUNDLE_ALIAS: "Package",
                    PRIVATE_SERVER: "Private Server",
                    DEVELOPER_PRODUCT: "Product",
                    SUBSCRIPTION: "Subscription"
                };

            function nQ(t, r) {
                (null == r || r > t.length) && (r = t.length);
                for (var n = 0, i = Array(r); n < r; n++) i[n] = t[n];
                return i
            }

            function nZ(t, r, n) {
                return r in t ? Object.defineProperty(t, r, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[r] = n, t
            }

            function n0(t) {
                for (var r = 1; r < arguments.length; r++) {
                    var n = null != arguments[r] ? arguments[r] : {},
                        i = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (i = i.concat(Object.getOwnPropertySymbols(n).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(n, t).enumerable
                    }))), i.forEach(function(r) {
                        nZ(t, r, n[r])
                    })
                }
                return t
            }

            function n1(t, r) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, r) {
                    var n, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var o = [],
                            s = !0,
                            l = !1;
                        try {
                            for (a = a.call(t); !(s = (n = a.next()).done) && (o.push(n.value), !r || o.length !== r); s = !0);
                        } catch (t) {
                            l = !0, i = t
                        } finally {
                            try {
                                s || null == a.return || a.return()
                            } finally {
                                if (l) throw i
                            }
                        }
                        return o
                    }
                }(t, r) || n3(t, r) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function n2(t) {
                return function(t) {
                    if (Array.isArray(t)) return nQ(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || n3(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function n3(t, r) {
                if (t) {
                    if ("string" == typeof t) return nQ(t, r);
                    var n = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return nQ(t, r)
                }
            }

            function n4(t, r) {
                if ("function" == typeof t) return t(r);
                null != t && (t.current = r)
            }

            function n6() {
                for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                return function(t) {
                    var n = !1,
                        i = r.map(function(r) {
                            var i = n4(r, t);
                            return n || "function" != typeof i || (n = !0), i
                        });
                    if (n) return function() {
                        for (var t = 0; t < i.length; t++) {
                            var n = i[t];
                            "function" == typeof n ? n() : n4(r[t], null)
                        }
                    }
                }
            }

            function n8() {
                for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                return u.useCallback(n6.apply(void 0, n2(r)), r)
            }

            function n5() {
                for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                var i = r[0];
                if (1 === r.length) return i;
                var a = function() {
                    var t = r.map(function(t) {
                        return {
                            useScope: t(),
                            scopeName: t.scopeName
                        }
                    });
                    return function(r) {
                        var n = t.reduce(function(t, n) {
                            var i = n.useScope,
                                a = n.scopeName;
                            return n0({}, t, i(r)["__scope".concat(a)])
                        }, {});
                        return u.useMemo(function() {
                            return nZ({}, "__scope".concat(i.scopeName), n)
                        }, [n])
                    }
                };
                return a.scopeName = i.scopeName, a
            }

            function n7(t, r) {
                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    i = n.checkForDefaultPrevented,
                    a = void 0 === i || i;
                return function(n) {
                    if (null == t || t(n), !1 === a || !n.defaultPrevented) return null == r ? void 0 : r(n)
                }
            }

            function n9(t) {
                var r = u.useRef(t);
                return u.useEffect(function() {
                    r.current = t
                }), u.useMemo(function() {
                    return function() {
                        for (var t, n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return null == (t = r.current) ? void 0 : t.call.apply(t, [r].concat(n2(i)))
                    }
                }, [])
            }
            var ie = (null == (oQ = globalThis) ? void 0 : oQ.document) ? u.useLayoutEffect : function() {},
                it = function(t) {
                    var r, n, i, a, o, s, l, c, d, f, p, m, h, b, y = t.present,
                        v = t.children,
                        g = (a = (i = n1(u.useState(), 2))[0], o = i[1], s = u.useRef({}), l = u.useRef(y), c = u.useRef("none"), f = (d = n1((r = y ? "mounted" : "unmounted", n = {
                            mounted: {
                                UNMOUNT: "unmounted",
                                ANIMATION_OUT: "unmountSuspended"
                            },
                            unmountSuspended: {
                                MOUNT: "mounted",
                                ANIMATION_END: "unmounted"
                            },
                            unmounted: {
                                MOUNT: "mounted"
                            }
                        }, u.useReducer(function(t, r) {
                            var i;
                            return null != (i = n[t][r]) ? i : t
                        }, r)), 2))[0], p = d[1], u.useEffect(function() {
                            var t = ir(s.current);
                            c.current = "mounted" === f ? t : "none"
                        }, [f]), ie(function() {
                            var t = s.current,
                                r = l.current;
                            if (r !== y) {
                                var n = c.current,
                                    i = ir(t);
                                y ? p("MOUNT") : "none" === i || "none" === (null == t ? void 0 : t.display) ? p("UNMOUNT") : p(r && n !== i ? "ANIMATION_OUT" : "UNMOUNT"), l.current = y
                            }
                        }, [y, p]), ie(function() {
                            if (a) {
                                var t, r, n = null != (r = a.ownerDocument.defaultView) ? r : window,
                                    i = function(r) {
                                        var i = ir(s.current).includes(r.animationName);
                                        if (r.target === a && i && (p("ANIMATION_END"), !l.current)) {
                                            var o = a.style.animationFillMode;
                                            a.style.animationFillMode = "forwards", t = n.setTimeout(function() {
                                                "forwards" === a.style.animationFillMode && (a.style.animationFillMode = o)
                                            })
                                        }
                                    },
                                    o = function(t) {
                                        t.target === a && (c.current = ir(s.current))
                                    };
                                return a.addEventListener("animationstart", o), a.addEventListener("animationcancel", i), a.addEventListener("animationend", i),
                                    function() {
                                        n.clearTimeout(t), a.removeEventListener("animationstart", o), a.removeEventListener("animationcancel", i), a.removeEventListener("animationend", i)
                                    }
                            }
                            p("ANIMATION_END")
                        }, [a, p]), {
                            isPresent: ["mounted", "unmountSuspended"].includes(f),
                            ref: u.useCallback(function(t) {
                                t && (s.current = getComputedStyle(t)), o(t)
                            }, [])
                        }),
                        w = "function" == typeof v ? v({
                            present: g.isPresent
                        }) : u.Children.only(v),
                        x = n8(g.ref, (b = null == (m = Object.getOwnPropertyDescriptor(w.props, "ref")) ? void 0 : m.get) && "isReactWarning" in b && b.isReactWarning ? w.ref : (b = null == (h = Object.getOwnPropertyDescriptor(w, "ref")) ? void 0 : h.get) && "isReactWarning" in b && b.isReactWarning ? w.props.ref : w.props.ref || w.ref);
                    return "function" == typeof v || g.isPresent ? u.cloneElement(w, {
                        ref: x
                    }) : null
                };

            function ir(t) {
                return (null == t ? void 0 : t.animationName) || "none"
            }
            it.displayName = "Presence";
            var ii = 0,
                ia = function() {
                    var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "\xabr",
                        r = (0, u.useRef)();
                    return r.current || (ii += 1, r.current = "".concat(t).concat(ii)), r.current
                };

            function io(t, r) {
                (null == r || r > t.length) && (r = t.length);
                for (var n = 0, i = Array(r); n < r; n++) i[n] = t[n];
                return i
            }

            function is(t, r, n) {
                return r in t ? Object.defineProperty(t, r, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[r] = n, t
            }

            function il(t) {
                for (var r = 1; r < arguments.length; r++) {
                    var n = null != arguments[r] ? arguments[r] : {},
                        i = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (i = i.concat(Object.getOwnPropertySymbols(n).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(n, t).enumerable
                    }))), i.forEach(function(r) {
                        is(t, r, n[r])
                    })
                }
                return t
            }

            function ic(t, r) {
                return r = null != r ? r : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(r)) : (function(t, r) {
                    var n = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var i = Object.getOwnPropertySymbols(t);
                        n.push.apply(n, i)
                    }
                    return n
                })(Object(r)).forEach(function(n) {
                    Object.defineProperty(t, n, Object.getOwnPropertyDescriptor(r, n))
                }), t
            }

            function iu(t, r) {
                if (null == t) return {};
                var n, i, a = function(t, r) {
                    if (null == t) return {};
                    var n, i, a = {},
                        o = Object.keys(t);
                    for (i = 0; i < o.length; i++) n = o[i], r.indexOf(n) >= 0 || (a[n] = t[n]);
                    return a
                }(t, r);
                if (Object.getOwnPropertySymbols) {
                    var o = Object.getOwnPropertySymbols(t);
                    for (i = 0; i < o.length; i++) n = o[i], !(r.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(t, n) && (a[n] = t[n])
                }
                return a
            }

            function id(t, r) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, r) {
                    var n, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var o = [],
                            s = !0,
                            l = !1;
                        try {
                            for (a = a.call(t); !(s = (n = a.next()).done) && (o.push(n.value), !r || o.length !== r); s = !0);
                        } catch (t) {
                            l = !0, i = t
                        } finally {
                            try {
                                s || null == a.return || a.return()
                            } finally {
                                if (l) throw i
                            }
                        }
                        return o
                    }
                }(t, r) || im(t, r) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ip(t) {
                return function(t) {
                    if (Array.isArray(t)) return io(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || im(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function im(t, r) {
                if (t) {
                    if ("string" == typeof t) return io(t, r);
                    var n = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return io(t, r)
                }
            }
            rq(".data-\\[state\\=unchecked\\]\\:stroke-contrast-alpha[data-state=unchecked]{border-color:var(--color-stroke-contrast-alpha)}");
            var ih = u.forwardRef(function(t, r) {
                var n = t.children,
                    i = iu(t, ["children"]),
                    a = u.Children.toArray(n),
                    s = a.find(iv);
                if (s) {
                    var l = s.props.children,
                        c = a.map(function(t) {
                            return t === s ? u.Children.count(l) > 1 ? u.Children.only(null) : u.isValidElement(l) ? l.props.children : null : t
                        });
                    return (0, o.jsx)(ib, ic(il({}, i), {
                        ref: r,
                        children: u.isValidElement(l) ? u.cloneElement(l, void 0, c) : null
                    }))
                }
                return (0, o.jsx)(ib, ic(il({}, i), {
                    ref: r,
                    children: n
                }))
            });
            ih.displayName = "Slot";
            var ib = u.forwardRef(function(t, r) {
                var n = t.children,
                    i = iu(t, ["children"]);
                if (u.isValidElement(n)) {
                    var a, o, s, l = (s = null == (a = Object.getOwnPropertyDescriptor(n.props, "ref")) ? void 0 : a.get) && "isReactWarning" in s && s.isReactWarning ? n.ref : (s = null == (o = Object.getOwnPropertyDescriptor(n, "ref")) ? void 0 : o.get) && "isReactWarning" in s && s.isReactWarning ? n.props.ref : n.props.ref || n.ref,
                        c = function(t, r) {
                            var n = il({}, r);
                            for (var i in r) ! function(i) {
                                var a = t[i],
                                    o = r[i];
                                /^on[A-Z]/.test(i) ? a && o ? n[i] = function() {
                                    for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                                    o.apply(void 0, ip(r)), a.apply(void 0, ip(r))
                                } : a && (n[i] = a) : "style" === i ? n[i] = il({}, a, o) : "className" === i && (n[i] = [a, o].filter(Boolean).join(" "))
                            }(i);
                            return il({}, t, n)
                        }(i, n.props);
                    return n.type !== u.Fragment && (c.ref = r ? n6(r, l) : l), u.cloneElement(n, c)
                }
                return u.Children.count(n) > 1 ? u.Children.only(null) : null
            });
            ib.displayName = "SlotClone";
            var iy = function(t) {
                var r = t.children;
                return (0, o.jsx)(o.Fragment, {
                    children: r
                })
            };

            function iv(t) {
                return u.isValidElement(t) && t.type === iy
            }
            var ig = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, r) {
                    var n = u.forwardRef(function(t, n) {
                        var i = t.asChild,
                            a = iu(t, ["asChild"]),
                            s = i ? ih : r;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, o.jsx)(s, ic(il({}, a), {
                            ref: n
                        }))
                    });
                    return n.displayName = "Primitive.".concat(r), ic(il({}, t), is({}, r, n))
                }, {}),
                iw = "Checkbox",
                ix = id(function(t) {
                    var r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        n = [],
                        i = function() {
                            var r = n.map(function(t) {
                                return u.createContext(t)
                            });
                            return function(n) {
                                var i = (null == n ? void 0 : n[t]) || r;
                                return u.useMemo(function() {
                                    var r, a;
                                    return nZ({}, "__scope".concat(t), (r = n0({}, n), a = null != (a = nZ({}, t, i)) ? a : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(a)) : (function(t, r) {
                                        var n = Object.keys(t);
                                        if (Object.getOwnPropertySymbols) {
                                            var i = Object.getOwnPropertySymbols(t);
                                            n.push.apply(n, i)
                                        }
                                        return n
                                    })(Object(a)).forEach(function(t) {
                                        Object.defineProperty(r, t, Object.getOwnPropertyDescriptor(a, t))
                                    }), r))
                                }, [n, i])
                            }
                        };
                    return i.scopeName = t, [function(r, i) {
                        var a = u.createContext(i),
                            s = n.length;
                        n = n2(n).concat([i]);
                        var l = function(r) {
                            var n, i = r.scope,
                                l = r.children,
                                c = function(t, r) {
                                    if (null == t) return {};
                                    var n, i, a = function(t, r) {
                                        if (null == t) return {};
                                        var n, i, a = {},
                                            o = Object.keys(t);
                                        for (i = 0; i < o.length; i++) n = o[i], r.indexOf(n) >= 0 || (a[n] = t[n]);
                                        return a
                                    }(t, r);
                                    if (Object.getOwnPropertySymbols) {
                                        var o = Object.getOwnPropertySymbols(t);
                                        for (i = 0; i < o.length; i++) n = o[i], !(r.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(t, n) && (a[n] = t[n])
                                    }
                                    return a
                                }(r, ["scope", "children"]),
                                d = (null == i || null == (n = i[t]) ? void 0 : n[s]) || a,
                                f = u.useMemo(function() {
                                    return c
                                }, Object.values(c));
                            return (0, o.jsx)(d.Provider, {
                                value: f,
                                children: l
                            })
                        };
                        return l.displayName = r + "Provider", [l, function(n, o) {
                            var l, c = (null == o || null == (l = o[t]) ? void 0 : l[s]) || a,
                                d = u.useContext(c);
                            if (d) return d;
                            if (void 0 !== i) return i;
                            throw Error("`".concat(n, "` must be used within `").concat(r, "`"))
                        }]
                    }, n5.apply(void 0, [i].concat(n2(r)))]
                }(iw), 2),
                iS = ix[0],
                iP = (ix[1], id(iS(iw), 2)),
                iE = iP[0],
                iI = iP[1],
                iA = u.forwardRef(function(t, r) {
                    var n, i, a, s, l, c, d, f, p, m, h, b, y, v, g, w, x, S = t.__scopeCheckbox,
                        P = t.name,
                        E = t.checked,
                        I = t.defaultChecked,
                        A = t.required,
                        T = t.disabled,
                        O = t.value,
                        j = void 0 === O ? "on" : O,
                        N = t.onCheckedChange,
                        R = t.form,
                        C = iu(t, ["__scopeCheckbox", "name", "checked", "defaultChecked", "required", "disabled", "value", "onCheckedChange", "form"]),
                        M = id(u.useState(null), 2),
                        D = M[0],
                        k = M[1],
                        F = n8(r, function(t) {
                            return k(t)
                        }),
                        L = u.useRef(!1),
                        _ = !D || R || !!D.closest("form"),
                        U = id((i = (n = {
                            prop: E,
                            defaultProp: I,
                            onChange: N
                        }).prop, y = (b = n1((c = (l = {
                            defaultProp: n.defaultProp,
                            onChange: s = void 0 === (a = n.onChange) ? function() {} : a
                        }).defaultProp, d = l.onChange, p = n1(f = u.useState(c), 1)[0], m = u.useRef(p), h = n9(d), u.useEffect(function() {
                            m.current !== p && (h(p), m.current = p)
                        }, [p, m, h]), f), 2))[0], v = b[1], w = (g = void 0 !== i) ? i : y, x = n9(s), [w, u.useCallback(function(t) {
                            if (g) {
                                var r = "function" == typeof t ? t(i) : t;
                                r !== i && x(r)
                            } else v(t)
                        }, [g, i, v, x])]), 2),
                        B = U[0],
                        q = void 0 !== B && B,
                        z = U[1],
                        V = u.useRef(q);
                    return u.useEffect(function() {
                        var t = null == D ? void 0 : D.form;
                        if (t) {
                            var r = function() {
                                return z(V.current)
                            };
                            return t.addEventListener("reset", r),
                                function() {
                                    return t.removeEventListener("reset", r)
                                }
                        }
                    }, [D, z]), (0, o.jsxs)(iE, {
                        scope: S,
                        state: q,
                        disabled: T,
                        children: [(0, o.jsx)(ig.button, ic(il({
                            type: "button",
                            role: "checkbox",
                            "aria-checked": iN(q) ? "mixed" : q,
                            "aria-required": A,
                            "data-state": iR(q),
                            "data-disabled": T ? "" : void 0,
                            disabled: T,
                            value: j
                        }, C), {
                            ref: F,
                            onKeyDown: n7(t.onKeyDown, function(t) {
                                "Enter" === t.key && t.preventDefault()
                            }),
                            onClick: n7(t.onClick, function(t) {
                                z(function(t) {
                                    return !!iN(t) || !t
                                }), _ && (L.current = t.isPropagationStopped(), L.current || t.stopPropagation())
                            })
                        })), _ && (0, o.jsx)(ij, {
                            control: D,
                            bubbles: !L.current,
                            name: P,
                            value: j,
                            checked: q,
                            required: A,
                            disabled: T,
                            form: R,
                            style: {
                                transform: "translateX(-100%)"
                            },
                            defaultChecked: !iN(I) && I
                        })]
                    })
                });
            iA.displayName = iw;
            var iT = "CheckboxIndicator",
                iO = u.forwardRef(function(t, r) {
                    var n = t.__scopeCheckbox,
                        i = t.forceMount,
                        a = iu(t, ["__scopeCheckbox", "forceMount"]),
                        s = iI(iT, n);
                    return (0, o.jsx)(it, {
                        present: i || iN(s.state) || !0 === s.state,
                        children: (0, o.jsx)(ig.span, ic(il({
                            "data-state": iR(s.state),
                            "data-disabled": s.disabled ? "" : void 0
                        }, a), {
                            ref: r,
                            style: il({
                                pointerEvents: "none"
                            }, t.style)
                        }))
                    })
                });
            iO.displayName = iT;
            var ij = function(t) {
                var r, n, i, a, s = t.control,
                    l = t.checked,
                    c = t.bubbles,
                    d = void 0 === c || c,
                    f = t.defaultChecked,
                    p = iu(t, ["control", "checked", "bubbles", "defaultChecked"]),
                    m = u.useRef(null),
                    h = (r = u.useRef({
                        value: l,
                        previous: l
                    }), u.useMemo(function() {
                        return r.current.value !== l && (r.current.previous = r.current.value, r.current.value = l), r.current.previous
                    }, [l])),
                    b = (i = (n = n1(u.useState(void 0), 2))[0], a = n[1], ie(function() {
                        if (s) {
                            a({
                                width: s.offsetWidth,
                                height: s.offsetHeight
                            });
                            var t = new ResizeObserver(function(t) {
                                if (Array.isArray(t) && t.length) {
                                    var r, n, i = t[0];
                                    if ("borderBoxSize" in i) {
                                        var o = i.borderBoxSize,
                                            l = Array.isArray(o) ? o[0] : o;
                                        r = l.inlineSize, n = l.blockSize
                                    } else r = s.offsetWidth, n = s.offsetHeight;
                                    a({
                                        width: r,
                                        height: n
                                    })
                                }
                            });
                            return t.observe(s, {
                                    box: "border-box"
                                }),
                                function() {
                                    return t.unobserve(s)
                                }
                        }
                        a(void 0)
                    }, [s]), i);
                u.useEffect(function() {
                    var t = m.current,
                        r = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set;
                    if (h !== l && r) {
                        var n = new Event("click", {
                            bubbles: d
                        });
                        t.indeterminate = iN(l), r.call(t, !iN(l) && l), t.dispatchEvent(n)
                    }
                }, [h, l, d]);
                var y = u.useRef(!iN(l) && l);
                return (0, o.jsx)("input", ic(il({
                    type: "checkbox",
                    "aria-hidden": !0,
                    defaultChecked: null != f ? f : y.current
                }, p), {
                    tabIndex: -1,
                    ref: m,
                    style: ic(il({}, t.style, b), {
                        position: "absolute",
                        pointerEvents: "none",
                        opacity: 0,
                        margin: 0
                    })
                }))
            };

            function iN(t) {
                return "indeterminate" === t
            }

            function iR(t) {
                return iN(t) ? "indeterminate" : t ? "checked" : "unchecked"
            }
            var iC = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-600"
                },
                iM = {
                    XSmall: "",
                    Small: "",
                    Medium: "",
                    Large: "padding-y-xxsmall"
                },
                iD = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                ik = {
                    XSmall: "",
                    Small: "padding-top-xxsmall",
                    Medium: "padding-top-xxsmall",
                    Large: "padding-top-xxsmall"
                },
                iF = function(t) {
                    var r = t.label,
                        n = t.className,
                        i = t.isChecked,
                        a = t.isDisabled,
                        o = t.size,
                        s = t.hint,
                        l = t.placement,
                        c = t.onCheckedChange,
                        u = t.id,
                        f = Q(t, ["label", "className", "isChecked", "isDisabled", "size", "hint", "placement", "onCheckedChange", "id"]),
                        p = ia(),
                        m = u || p,
                        h = r && d().createElement("label", {
                            htmlFor: m,
                            className: Z("flex flex-col grow-1 gap-xsmall", !a && "cursor-pointer")
                        }, d().createElement("span", {
                            className: Z(iD[o], ik[o], "content-emphasis")
                        }, r), s && d().createElement("span", {
                            className: "text-body-medium content-default"
                        }, s));
                    return d().createElement("div", {
                        className: Z("foundation-web-checkbox flex gap-medium", a && ns, !a && "cursor-pointer", n)
                    }, "End" === l && h, d().createElement("div", {
                        className: Z(iM[o])
                    }, d().createElement(iA, Object.assign({
                        "data-slot": "checkbox",
                        className: Z(iC[o], rG, !a && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
                        id: m,
                        checked: i,
                        disabled: a,
                        onCheckedChange: c,
                        "aria-label": r
                    }, f), d().createElement(rH, null), d().createElement(iO, {
                        "data-slot": "checkbox-indicator",
                        className: Z(iC[o], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
                    }))), "Start" === l && h)
                },
                iL = {
                    Neutral: "bg-shift-200",
                    Standard: "bg-shift-200",
                    Contrast: "bg-system-contrast",
                    Emphasis: "bg-system-emphasis",
                    Success: "bg-[rgb(from_var(--color-system-success)_r_g_b_/_0.2)]",
                    Warning: "bg-[rgb(from_var(--color-system-warning)_r_g_b_/_0.2)]",
                    Alert: "bg-[rgb(from_var(--color-system-alert)_r_g_b_/_0.2)]",
                    OverMedia: "bg-over-media-0"
                },
                i_ = {
                    Neutral: "content-emphasis",
                    Standard: "content-emphasis",
                    Contrast: "content-inverse-emphasis",
                    Emphasis: "content-[var(--dark-mode-content-emphasis)]",
                    Success: "content-emphasis",
                    Warning: "content-emphasis",
                    Alert: "content-emphasis",
                    OverMedia: "content-emphasis"
                },
                iU = {
                    Neutral: "content-emphasis",
                    Standard: "content-emphasis",
                    Contrast: "content-inverse-emphasis",
                    Emphasis: "content-[var(--dark-mode-content-emphasis)]",
                    Success: "content-system-success",
                    Warning: "content-system-warning",
                    Alert: "content-system-alert",
                    OverMedia: "content-emphasis"
                },
                iB = {
                    Neutral: "stroke-none",
                    Standard: "stroke-none",
                    Contrast: "stroke-none",
                    Emphasis: "stroke-none",
                    Success: "stroke-none",
                    Warning: "stroke-none",
                    Alert: "stroke-none",
                    OverMedia: "stroke-none"
                },
                iq = {
                    Small: "height-600",
                    XSmall: "height-400"
                },
                iz = {
                    Small: "padding-x-small",
                    XSmall: "padding-x-xsmall"
                },
                iV = {
                    Small: "width-600",
                    XSmall: "width-400"
                },
                iG = {
                    Small: "text-label-small",
                    XSmall: "text-caption-small"
                },
                iH = {
                    Small: "padding-y-xsmall",
                    XSmall: "padding-y-none"
                },
                iW = {
                    Small: "XSmall",
                    XSmall: "XSmall"
                },
                iX = {
                    Pill: "radius-circle",
                    Box: "radius-small"
                },
                iK = d().forwardRef(function(t, r) {
                    var n = t.className,
                        i = t.label,
                        a = t.variant,
                        o = void 0 === a ? "Standard" : a,
                        s = t.icon,
                        l = t.iconPosition,
                        c = void 0 === l ? "Leading" : l,
                        u = t.size,
                        f = void 0 === u ? "Small" : u,
                        p = t.shape,
                        m = Q(t, ["className", "label", "variant", "icon", "iconPosition", "size", "shape"]),
                        h = s && !i,
                        b = "padding-x-xxsmall";
                    s && (b = "Leading" === c ? "padding-right-xxsmall" : "padding-left-xxsmall");
                    var y = s && d().createElement(rV, {
                        name: s,
                        size: iW[f],
                        className: iU[o]
                    });
                    return d().createElement("div", Object.assign({
                        ref: r
                    }, m, {
                        className: Z("foundation-web-badge flex items-center select-none gap-[var(--size-150)]", iX[void 0 === p ? "Pill" : p], iq[f], h ? [iV[f], "justify-center"] : ["width-[fit-content]", iz[f]], iL[o], i_[o], iB[o], n)
                    }), "Leading" === c && y, i && d().createElement("span", {
                        className: Z("text-no-wrap text-truncate-split", iG[f], iH[f], b, i_[o])
                    }, i), "Trailing" === c && y)
                });
            iK.displayName = "Badge";
            var iY = window.EventTracker,
                i$ = function(t, r, n) {
                    return "".concat("RenderTracking", "-").concat("Purchase", "-").concat(t, "-").concat(r, "-").concat(n)
                },
                iJ = function(t, r, n) {
                    return (0, u.useEffect)(function() {
                        n && (0, iY.fireEvent)(i$(t, r, "open"))
                    }, [t, r, n]), {
                        trackUpsellClick: (0, u.useCallback)(function() {
                            (0, iY.fireEvent)(i$(t, r, "click"))
                        }, [t, r])
                    }
                };

            function iQ(t, r) {
                (null == r || r > t.length) && (r = t.length);
                for (var n = 0, i = Array(r); n < r; n++) i[n] = t[n];
                return i
            }
            var iZ = "roblox_plus_upsell_new_badge_seen",
                i0 = function() {
                    try {
                        return "true" === window.localStorage.getItem(iZ)
                    } catch (t) {
                        return !0
                    }
                },
                i1 = function() {
                    try {
                        window.localStorage.setItem(iZ, "true")
                    } catch (t) {}
                },
                i2 = function(t) {
                    var r, n, i, a, s, l, c = t.translate,
                        d = t.assetType,
                        f = t.subscriptionProductInfo,
                        p = t.onBannerClick,
                        m = (r = (0, u.useState)(i0), function(t) {
                            if (Array.isArray(t)) return t
                        }(r) || function(t, r) {
                            var n, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                            if (null != a) {
                                var o = [],
                                    s = !0,
                                    l = !1;
                                try {
                                    for (a = a.call(t); !(s = (n = a.next()).done) && (o.push(n.value), o.length !== r); s = !0);
                                } catch (t) {
                                    l = !0, i = t
                                } finally {
                                    try {
                                        s || null == a.return || a.return()
                                    } finally {
                                        if (l) throw i
                                    }
                                }
                                return o
                            }
                        }(r, 2) || function(t, r) {
                            if (t) {
                                if ("string" == typeof t) return iQ(t, 2);
                                var n = Object.prototype.toString.call(t).slice(8, -1);
                                if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return iQ(t, r)
                            }
                        }(r, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        h = m[0],
                        b = m[1],
                        y = null == f || null == (n = f.productTypeDetails.robloxSubscriptionProductDetails) ? void 0 : n.featureConfig,
                        v = null == y || null == (i = y.virtualTransactionDiscounts) ? void 0 : i.find(function(t) {
                            return 0 === t.periodIndex
                        }),
                        g = c("Label.BlackbirdUpsellBanner", {
                            discountPercentage: null == v || null == (a = v.discountPercent) ? void 0 : a.toFixed(0)
                        }),
                        w = null != (l = null == f || null == (s = f.eligibleOffers) ? void 0 : s.some(function(t) {
                            return "FreeTrial" === t.offerType
                        })) && l;
                    iJ("UnifiedPurchaseModalUpsellBanner", d, !!f);
                    var x = (0, u.useCallback)(function() {
                            i1(), b(!0), p()
                        }, [p]),
                        S = h ? (0, o.jsx)("span", {
                            className: "content-default underline",
                            children: c(w ? "Action.TrialSubscription" : "Action.Subscribe")
                        }) : (0, o.jsx)(iK, {
                            variant: "Contrast",
                            label: c("Label.New")
                        });
                    return f ? (0, o.jsxs)("button", {
                        type: "button",
                        className: "gap-y-medium flex flex-row justify-between padding-medium bg-shift-100 stroke-default stroke-thick radius-medium cursor-pointer text-body-medium margin-top-[12px]",
                        onClick: x,
                        onKeyDown: function(t) {
                            ("Enter" === t.key || " " === t.key) && (t.preventDefault(), x())
                        },
                        children: [(0, o.jsxs)("div", {
                            className: "gap-x-small flex items-center",
                            children: [(0, o.jsx)(rV, {
                                name: "icon-regular-roblox-plus",
                                size: "Small"
                            }), (0, o.jsx)("span", {
                                children: g
                            })]
                        }), S]
                    }) : null
                },
                i3 = new Set(["_self", "_parent", "_top"]),
                i4 = {
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                i6 = {
                    Standard: "content-emphasis",
                    Emphasis: "content-emphasis",
                    Inverse: "content-inverse-default"
                },
                i8 = (0, u.forwardRef)(function(t, r) {
                    var n, i, a, o = t.children,
                        s = t.className,
                        l = t.size,
                        c = t.color,
                        u = t.variant,
                        f = t.underline,
                        p = void 0 === f ? "hover" : f,
                        m = t.isExternal,
                        h = t.asChild,
                        b = Q(t, ["children", "className", "size", "color", "variant", "underline", "isExternal", "asChild"]),
                        y = (n = null != (a = b.as) ? a : "a", i = "button" === b.as ? void 0 : b.target, void 0 !== m ? m : "button" !== n && void 0 !== i && !i3.has(i)),
                        v = Z("foundation-web-link", "button" === b.as && "bg-none stroke-none padding-none appearance-none [text-align:inherit]", ("Standalone" === (void 0 === u ? "Standalone" : u) || y) && "inline-flex items-center gap-xsmall", void 0 !== l && i4[l], i6[void 0 === c ? "Emphasis" : c], "always" === p ? "underline" : "no-underline", "hover" === p && "hover:underline", "motion-safe:transition-opacity", "hover:cursor-pointer hover:[opacity:0.8]", "radius-xsmall focus-visible:[outline-style:solid] focus-visible:[outline-width:var(--stroke-standard)] focus-visible:[outline-color:var(--color-system-emphasis)]", s),
                        g = y ? d().createElement("span", {
                            "aria-hidden": !0,
                            "data-testid": "foundation-web-icon",
                            className: Z("grow-0 shrink-0 basis-auto icon size-[1em]", "icon-regular-arrow-up-right-from-square")
                        }) : null;
                    if (h) {
                        var w = Q(b, ["as"]),
                            x = d().Children.only(o);
                        return d().isValidElement(x) ? d().createElement(ni, Object.assign({
                            ref: r
                        }, w, {
                            className: v
                        }), d().cloneElement(x, {}, d().createElement(d().Fragment, null, x.props.children, g))) : null
                    }
                    if ("button" === b.as) {
                        b.as;
                        var S = b.type,
                            P = Q(b, ["as", "type"]);
                        return d().createElement("button", Object.assign({
                            ref: r,
                            type: null != S ? S : "button"
                        }, P, {
                            className: v
                        }), o, g)
                    }
                    var E = Q(b, ["as"]);
                    return d().createElement("a", Object.assign({
                        ref: r
                    }, E, {
                        className: v
                    }), o, g)
                });

            function i5(t, r) {
                (null == r || r > t.length) && (r = t.length);
                for (var n = 0, i = Array(r); n < r; n++) i[n] = t[n];
                return i
            }

            function i7(t) {
                return t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t
            }
            i8.displayName = "Link";
            var i9 = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof window ? window : void 0 !== n.g ? n.g : "undefined" != typeof self ? self : {},
                ae = "object" == (void 0 === i9 ? "undefined" : i7(i9)) && i9 && i9.Object === Object && i9,
                at = "object" == ("undefined" == typeof self ? "undefined" : i7(self)) && self && self.Object === Object && self;
            ae || at || Function("return this")();
            var ar = "undefined" != typeof window ? u.useLayoutEffect : u.useEffect,
                an = "undefined" == typeof window;

            function ai(t) {
                var r, n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    i = n.defaultValue,
                    a = void 0 !== i && i,
                    o = n.initializeWithValue,
                    s = void 0 === o || o,
                    l = function(t) {
                        return an ? a : window.matchMedia(t).matches
                    },
                    c = (r = (0, u.useState)(function() {
                        return s ? l(t) : a
                    }), function(t) {
                        if (Array.isArray(t)) return t
                    }(r) || function(t, r) {
                        var n, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                        if (null != a) {
                            var o = [],
                                s = !0,
                                l = !1;
                            try {
                                for (a = a.call(t); !(s = (n = a.next()).done) && (o.push(n.value), o.length !== r); s = !0);
                            } catch (t) {
                                l = !0, i = t
                            } finally {
                                try {
                                    s || null == a.return || a.return()
                                } finally {
                                    if (l) throw i
                                }
                            }
                            return o
                        }
                    }(r, 2) || function(t, r) {
                        if (t) {
                            if ("string" == typeof t) return i5(t, 2);
                            var n = Object.prototype.toString.call(t).slice(8, -1);
                            if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return i5(t, r)
                        }
                    }(r, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    d = c[0],
                    f = c[1];

                function p() {
                    f(l(t))
                }
                return ar(function() {
                    var r = window.matchMedia(t);
                    return p(), r.addListener ? r.addListener(p) : r.addEventListener("change", p),
                        function() {
                            r.removeListener ? r.removeListener(p) : r.removeEventListener("change", p)
                        }
                }, [t]), d
            }
            var aa = {
                    Large: "size-1200",
                    Medium: "size-1000",
                    Small: "size-800",
                    XSmall: "size-600"
                },
                ao = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-700"
                },
                as = {
                    Large: {
                        circular: "radius-circle",
                        square: "radius-medium"
                    },
                    Medium: {
                        circular: "radius-circle",
                        square: "radius-medium"
                    },
                    Small: {
                        circular: "radius-circle",
                        square: "radius-medium"
                    },
                    XSmall: {
                        circular: "radius-circle",
                        square: "radius-small"
                    }
                },
                al = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-alert",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                ac = {
                    Emphasis: "bg-action-standard",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                au = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-shift-300",
                    OverMedia: "bg-over-media-0"
                },
                ad = {
                    Default: {
                        Emphasis: "content-action-emphasis",
                        Standard: "content-action-standard",
                        Alert: "content-action-alert",
                        Utility: "content-emphasis",
                        OverMedia: "content-emphasis"
                    },
                    Inverse: {
                        Emphasis: "content-inverse-action-emphasis",
                        Standard: "content-inverse-action-standard",
                        Alert: "content-inverse-action-alert",
                        Utility: "content-inverse-emphasis",
                        OverMedia: "content-inverse-emphasis"
                    }
                },
                af = {
                    Default: {
                        Emphasis: "content-action-standard",
                        Standard: "content-action-standard",
                        Alert: "content-action-standard",
                        Utility: "content-emphasis",
                        OverMedia: "content-emphasis"
                    },
                    Inverse: {
                        Emphasis: "content-inverse-action-standard",
                        Standard: "content-inverse-action-standard",
                        Alert: "content-inverse-action-standard",
                        Utility: "content-inverse-emphasis",
                        OverMedia: "content-inverse-emphasis"
                    }
                },
                ap = (0, u.forwardRef)(function(t, r) {
                    var n, i = t.className,
                        a = t.icon,
                        o = t.ariaLabel,
                        s = t.isDisabled,
                        l = void 0 !== s && s,
                        c = t.isCircular,
                        u = t.isSelected,
                        f = t.size,
                        p = void 0 === f ? "Large" : f,
                        m = t.variant,
                        h = void 0 === m ? "Emphasis" : m,
                        b = t.iconColor,
                        y = void 0 === b ? "Default" : b,
                        v = t.asChild,
                        g = t.children,
                        w = Q(t, ["className", "icon", "ariaLabel", "isDisabled", "isCircular", "isSelected", "size", "variant", "iconColor", "asChild", "children"]);
                    n = l ? ac[h] : void 0 !== u && u ? au[h] : al[h];
                    var x = Z("foundation-web-icon-button", l ? ns : [rG, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", aa[p], as[p][void 0 !== c && c ? "circular" : "square"], n, i),
                        S = d().createElement(d().Fragment, null, d().createElement(rH, null), d().createElement("span", {
                            className: Z("icon", a, ao[p], l ? af[y][h] : ad[y][h])
                        }));
                    if (v) {
                        var P = Q(w, ["as"]),
                            E = d().Children.only(g);
                        return d().createElement(ni, Object.assign({
                            ref: r
                        }, P, {
                            className: x,
                            "aria-label": o,
                            "aria-disabled": l || void 0
                        }), d().cloneElement(E, {}, S))
                    }
                    if ("a" === w.as) {
                        w.as;
                        var I = w.href,
                            A = Q(w, ["as", "href"]);
                        return d().createElement("a", Object.assign({
                            ref: r
                        }, A, {
                            "aria-label": o,
                            "aria-disabled": l,
                            href: l ? void 0 : I,
                            className: x
                        }), S)
                    }
                    var T = Q(w, ["as"]);
                    return d().createElement("button", Object.assign({
                        ref: r,
                        type: "button"
                    }, T, {
                        "aria-label": o,
                        disabled: l,
                        className: x
                    }), S)
                });
            rq("@keyframes fui-base-sheet-overlay-fade-in{0%{background-color:transparent}to{background-color:var(--color-common-backdrop)}}@keyframes fui-base-sheet-overlay-fade-out{0%{background-color:var(--color-common-backdrop)}to{background-color:transparent}}@keyframes fui-base-sheet-slide-in-from-right{0%{transform:translateX(110%)}to{transform:translateX(0)}}@keyframes fui-base-sheet-slide-out-to-right{0%{transform:translateX(0)}to{transform:translateX(110%)}}@keyframes fui-base-sheet-slide-in-from-left{0%{transform:translateX(-110%)}to{transform:translateX(0)}}@keyframes fui-base-sheet-slide-out-to-left{0%{transform:translateX(0)}to{transform:translateX(-110%)}}@keyframes fui-base-sheet-fade-in{0%{opacity:0}to{opacity:1}}@keyframes fui-base-sheet-fade-out{0%{opacity:1}to{opacity:0}}@keyframes fui-base-sheet-slide-in-from-bottom{0%{transform:translateY(110%)}to{transform:translateY(0)}}@keyframes fui-base-sheet-slide-out-to-bottom{0%{transform:translateY(0)}to{transform:translateY(110%)}}.fui-base-sheet-overlay{background-color:var(--color-common-backdrop)}.fui-base-sheet-overlay[data-state=open]{animation:fui-base-sheet-overlay-fade-in var(--time-100) var(--ease-linear)}.fui-base-sheet-overlay[data-state=closed]{animation:fui-base-sheet-overlay-fade-out var(--time-100) var(--ease-linear)}.fui-base-sheet-overlay[data-type=bottomSheet]{align-items:flex-end;justify-content:center}.fui-base-sheet-overlay[data-type=bottomSheet] .fui-base-sheet-content{border-top-left-radius:var(--radius-large);border-top-right-radius:var(--radius-large);margin-left:env(safe-area-inset-left);margin-right:env(safe-area-inset-right);max-height:90vh;max-width:440px;padding-bottom:env(safe-area-inset-bottom);width:100%}.fui-base-sheet-overlay .fui-base-sheet-content[data-state=open]{animation-duration:var(--time-300);animation-timing-function:var(--ease-standard-out)}.fui-base-sheet-overlay .fui-base-sheet-content[data-state=closed]{animation-duration:var(--time-100);animation-timing-function:var(--ease-standard-in)}.fui-base-sheet-overlay[data-type=bottomSheet] .fui-base-sheet-content[data-state=open]{animation-name:fui-base-sheet-slide-in-from-bottom}.fui-base-sheet-overlay[data-type=bottomSheet] .fui-base-sheet-content[data-state=closed]{animation-name:fui-base-sheet-slide-out-to-bottom}.fui-base-sheet-overlay[data-type=sideSheet][data-side=right]{align-items:stretch;justify-content:flex-end}.fui-base-sheet-overlay[data-type=sideSheet][data-side=left]{align-items:stretch;justify-content:flex-start}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=true] .fui-base-sheet-content{max-height:100vh;padding-bottom:env(safe-area-inset-bottom);padding-top:env(safe-area-inset-top);width:100%}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=true][data-side=right] .fui-base-sheet-content{max-width:360px;max-width:max(env(safe-area-inset-right) + 360px,360px);padding-right:env(safe-area-inset-right)}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=true][data-side=left] .fui-base-sheet-content{max-width:360px;max-width:max(env(safe-area-inset-right) + 360px,360px);padding-left:env(safe-area-inset-left)}.fui-base-sheet-overlay[data-type=sideSheet][data-side=right] .fui-base-sheet-content[data-state=open]{animation-name:fui-base-sheet-slide-in-from-right}.fui-base-sheet-overlay[data-type=sideSheet][data-side=right] .fui-base-sheet-content[data-state=closed]{animation-name:fui-base-sheet-slide-out-to-right}.fui-base-sheet-overlay[data-type=sideSheet][data-side=left] .fui-base-sheet-content[data-state=open]{animation-name:fui-base-sheet-slide-in-from-left}.fui-base-sheet-overlay[data-type=sideSheet][data-side=left] .fui-base-sheet-content[data-state=closed]{animation-name:fui-base-sheet-slide-out-to-left}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=false] .fui-base-sheet-content{border-radius:var(--radius-large);margin:var(--padding-medium);margin-bottom:max(env(safe-area-inset-bottom),var(--padding-medium));margin-top:max(env(safe-area-inset-top),var(--padding-medium));max-height:100vh;max-width:360px;width:100%}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=false][data-side=right] .fui-base-sheet-content{margin-right:max(env(safe-area-inset-right),var(--padding-medium))}.fui-base-sheet-overlay[data-type=sideSheet][data-flush=false][data-side=left] .fui-base-sheet-content{margin-left:max(env(safe-area-inset-left),var(--padding-medium))}.fui-base-sheet-overlay[data-type=centerSheet]{align-items:center;justify-content:center;padding:var(--padding-medium)}.fui-base-sheet-overlay[data-type=centerSheet] .fui-base-sheet-content{border-radius:var(--radius-large);max-height:90vh}.fui-base-sheet-overlay[data-type=centerSheet][data-size=Medium] .fui-base-sheet-content{max-width:480px;width:100%}.fui-base-sheet-overlay[data-type=centerSheet][data-size=Large] .fui-base-sheet-content{max-width:640px;width:100%}.fui-base-sheet-overlay[data-type=centerSheet] .fui-base-sheet-content[data-state=open]{animation-name:fui-base-sheet-fade-in}.fui-base-sheet-overlay[data-type=centerSheet] .fui-base-sheet-content[data-state=closed]{animation-name:fui-base-sheet-fade-out}");
            var am = function(t) {
                var r = t.type,
                    n = t.sideSheetSide,
                    i = t.isSideSheetFlush,
                    a = t.centerSheetSize,
                    o = t.children,
                    s = t.overlayClassName,
                    l = t.contentClassName,
                    c = t.onOpenAutoFocus,
                    u = t.onCloseAutoFocus,
                    f = t.onPointerDownOutside,
                    p = t.onEscapeKeyDown,
                    m = t.onInteractOutside;
                return d().createElement(rl, null, d().createElement(ru, {
                    "data-testid": "fui-base-sheet-overlay",
                    "data-type": r,
                    "data-side": "sideSheet" === r ? void 0 === n ? "right" : n : void 0,
                    "data-flush": "sideSheet" === r ? void 0 !== i && i : void 0,
                    "data-size": "centerSheet" === r ? void 0 === a ? "Medium" : a : void 0,
                    className: Z("fui-base-sheet-overlay", "foundation-web-portal-zindex fixed inset-[0] flex", s)
                }, d().createElement(rm, {
                    "data-testid": "fui-base-sheet-content",
                    className: Z("fui-base-sheet-content relative bg-surface-100 stroke-muted stroke-standard shadow-transient-high", "flex flex-col clip", l),
                    onOpenAutoFocus: c,
                    onCloseAutoFocus: u,
                    onPointerDownOutside: f,
                    onEscapeKeyDown: p,
                    onInteractOutside: m
                }, o)))
            };

            function ah(t, r) {
                return null != r && "undefined" != typeof Symbol && r[Symbol.hasInstance] ? !!r[Symbol.hasInstance](t) : t instanceof r
            }
            var ab = function(t) {
                    var r, n = t.currentTarget;
                    if (n) {
                        var i = n.querySelectorAll("[data-autofocus-priority]");
                        if (0 !== i.length) {
                            var a = [];
                            i.forEach(function(t) {
                                var r = parseInt(t.getAttribute("data-autofocus-priority") || "", 10);
                                !Number.isNaN(r) && ah(t, HTMLElement) && a.push({
                                    element: t,
                                    priority: r
                                })
                            }), a.sort(function(t, r) {
                                return t.priority - r.priority
                            });
                            var o = a.find(function(t) {
                                var r, n;
                                return ("function" != typeof(n = r = t.element).checkVisibility || n.checkVisibility()) && !!(!("disabled" in r) || !r.disabled) && "true" !== r.getAttribute("aria-disabled")
                            });
                            if (o) {
                                t.preventDefault();
                                var s = document.activeElement === o.element;
                                o.element.focus(), s || ah(r = o.element, HTMLInputElement) && "function" == typeof r.select && r.select()
                            }
                        }
                    }
                },
                ay = (0, u.createContext)(null),
                av = function() {
                    var t = (0, u.useContext)(ay);
                    if (!t) throw Error("Sheet components must be used within a Sheet");
                    return t
                },
                ag = function(t) {
                    var r = t.open,
                        n = t.onOpenChange,
                        i = t.defaultOpen,
                        a = t.children;
                    return d().createElement(rr, {
                        open: r,
                        onOpenChange: n,
                        defaultOpen: i,
                        modal: !0
                    }, a)
                },
                aw = function(t) {
                    var r, n = t.children,
                        i = t.centerSheetSize,
                        a = void 0 === i ? "Medium" : i,
                        o = t.largeScreenVariant,
                        s = void 0 === o ? "center" : o,
                        l = t.closeLabel,
                        c = t.className,
                        f = t.mobilePortraitClassName,
                        p = t.mobileLandscapeClassName,
                        m = t.largeScreenClassName,
                        h = t.onOpenAutoFocus,
                        b = t.onCloseAutoFocus,
                        y = t.onPointerDownOutside,
                        v = t.onEscapeKeyDown,
                        g = t.onInteractOutside,
                        w = ai("(orientation: portrait) and (max-width: 600px)"),
                        x = ai("(orientation: landscape) and (max-height: 600px)");
                    r = w ? "bottomSheet" : x || "side" === s ? "sideSheet" : "centerSheet";
                    var S = (0, u.useMemo)(function() {
                            return {
                                centerSheetSize: a,
                                largeScreenVariant: s,
                                closeLabel: l,
                                isPortraitMobile: w,
                                isLandscapeMobile: x,
                                type: r
                            }
                        }, [a, s, l, w, x, r]),
                        P = Z(c, w && f, x && p, !w && !x && m);
                    return d().createElement(ay.Provider, {
                        value: S
                    }, d().createElement(am, {
                        type: r,
                        sideSheetSide: "right",
                        isSideSheetFlush: x,
                        centerSheetSize: a,
                        contentClassName: P,
                        onOpenAutoFocus: null != h ? h : ab,
                        onCloseAutoFocus: b,
                        onPointerDownOutside: y,
                        onEscapeKeyDown: v,
                        onInteractOutside: g
                    }, n))
                },
                ax = (0, u.forwardRef)(function(t, r) {
                    var n = t.children,
                        i = t.className,
                        a = t.hasPaddingX,
                        o = Q(t, ["children", "className", "hasPaddingX"]),
                        s = av().type;
                    return d().createElement("div", Object.assign({
                        ref: r,
                        className: Z("scroll-y", (void 0 === a || a) && "padding-x-xlarge", "sideSheet" === s ? "grow-1" : "", i)
                    }, o), n)
                });
            ax.displayName = "SheetBody";
            var aS = function(t) {
                    var r = t.className,
                        n = t.children,
                        i = t.navigation,
                        a = t.utilities,
                        o = t.visuallyHideTitleText,
                        s = av().closeLabel,
                        l = d().createElement(rg, {
                            className: "text-heading-small margin-none"
                        }, n);
                    return d().createElement("div", {
                        className: Z(r, i ? "padding-left-medium" : "padding-left-xlarge", "padding-right-small padding-y-small", "flex items-center justify-between")
                    }, d().createElement("div", {
                        className: Z("flex items-center", i && "gap-xsmall")
                    }, i, o ? d().createElement(rB, null, l) : l), d().createElement("div", {
                        className: Z("flex items-center", a && "gap-xxsmall")
                    }, a, d().createElement("div", {
                        className: "fui-sheet-close-affordance-container"
                    }, d().createElement(rS, {
                        asChild: !0
                    }, d().createElement(ap, {
                        variant: "Utility",
                        size: "Medium",
                        icon: "icon-regular-x",
                        ariaLabel: s || "",
                        "data-autofocus-priority": "1000"
                    })))))
                },
                aP = function(t) {
                    var r = t.units + 1e-9 * t.nanos;
                    return new Intl.NumberFormat(void 0, {
                        style: "currency",
                        currency: t.currencyCode
                    }).format(r)
                },
                aE = function(t) {
                    var r, n = t.translate,
                        i = t.eligibleOffers,
                        a = t.price,
                        s = t.periodType,
                        l = aP(a),
                        c = null != (r = null == i ? void 0 : i.some(function(t) {
                            return "FreeTrial" === t.offerType
                        })) && r ? nv(n, "Description.BillingInfoWithFreeTrialOffer", [{
                            opening: "boldTagStart",
                            closing: "boldTagEnd",
                            render: function(t) {
                                return (0, o.jsx)("span", {
                                    className: "font-bold",
                                    children: t
                                })
                            }
                        }], {
                            trialPeriod: "1",
                            trialPeriodType: s,
                            price: l,
                            periodType: s
                        }) : nv(n, "Description.BillingInfo", [{
                            opening: "priceStart",
                            closing: "priceEnd",
                            render: function(t) {
                                return (0, o.jsx)("span", {
                                    className: "text-heading-medium",
                                    children: t
                                })
                            }
                        }], {
                            price: l,
                            periodType: s
                        });
                    return (0, o.jsx)("span", {
                        className: "text-body-large",
                        children: c
                    })
                },
                aI = function(t) {
                    var r = t.iconName,
                        n = t.label;
                    return (0, o.jsxs)("div", {
                        className: "gap-x-large align-items-center flex flex-row",
                        children: [(0, o.jsx)(rV, {
                            name: r,
                            size: "Large"
                        }), (0, o.jsx)("span", {
                            className: "text-body-large",
                            children: n
                        })]
                    })
                },
                aA = function(t) {
                    return new Intl.NumberFormat(void 0, {
                        maximumFractionDigits: 0
                    }).format(t)
                },
                aT = function(t) {
                    var r = t.translate,
                        n = t.featureConfig,
                        i = t.periodType,
                        a = (0, u.useMemo)(function() {
                            var t;
                            return null == (t = n.virtualTransactionDiscounts) ? void 0 : t.find(function(t) {
                                return 0 === t.periodIndex
                            })
                        }, [n]),
                        s = (0, u.useMemo)(function() {
                            var t;
                            return null == (t = n.virtualTransactionDiscounts) ? void 0 : t.filter(function(t) {
                                return t.periodIndex > 0
                            }).reduce(function(t, r) {
                                return null === t || r.periodIndex < t.periodIndex ? r : t
                            }, null)
                        }, [n]);
                    return (0, o.jsxs)("div", {
                        className: "gap-y-xlarge flex flex-col",
                        children: [a && (0, o.jsx)(aI, {
                            iconName: "icon-regular-tag",
                            label: r("Label.BlackbirdVTDiscountFirst", {
                                discountPercent: aA(a.discountPercent)
                            })
                        }), s && (0, o.jsx)(aI, {
                            iconName: "icon-regular-tag-arrow-up",
                            label: r("Label.BlackbirdVTDiscountSecond", {
                                discountPercent: aA(s.discountPercent),
                                periodIndex: String(s.periodIndex),
                                periodType: i
                            })
                        }), n.privateServerDiscounts && n.privateServerDiscounts.length > 0 && (0, o.jsx)(aI, {
                            iconName: "icon-regular-controller",
                            label: r("Description.Benefit.PrivateServers")
                        }), n.isRobuxTransferEnabled && (0, o.jsx)(aI, {
                            iconName: "icon-regular-robux",
                            label: r("Description.Benefit.RobuxTransfers")
                        })]
                    })
                };

            function aO(t, r) {
                (null == r || r > t.length) && (r = t.length);
                for (var n = 0, i = Array(r); n < r; n++) i[n] = t[n];
                return i
            }
            var aj = function(t) {
                    var r, n = t.productType,
                        i = t.productId,
                        a = t.deviceMeta,
                        s = t.isDisabled,
                        l = void 0 !== s && s,
                        c = t.children,
                        d = t.upsellUuid,
                        f = t.paymentSessionId,
                        p = t.redirectUrl,
                        m = t.trackSubscriptionButtonClick,
                        h = (r = (0, u.useState)(!1), function(t) {
                            if (Array.isArray(t)) return t
                        }(r) || function(t, r) {
                            var n, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                            if (null != a) {
                                var o = [],
                                    s = !0,
                                    l = !1;
                                try {
                                    for (a = a.call(t); !(s = (n = a.next()).done) && (o.push(n.value), o.length !== r); s = !0);
                                } catch (t) {
                                    l = !0, i = t
                                } finally {
                                    try {
                                        s || null == a.return || a.return()
                                    } finally {
                                        if (l) throw i
                                    }
                                }
                                return o
                            }
                        }(r, 2) || function(t, r) {
                            if (t) {
                                if ("string" == typeof t) return aO(t, 2);
                                var n = Object.prototype.toString.call(t).slice(8, -1);
                                if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return aO(t, r)
                            }
                        }(r, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        b = h[0],
                        y = h[1],
                        v = (0, u.useCallback)(function() {
                            l || (null == m || m(), y(!0))
                        }, [l, m]),
                        g = (0, u.useMemo)(function() {
                            if (a.isDesktop) {
                                var t = new URL("/upgrades/paymentmethods", window.location.origin);
                                return t.searchParams.append("ctx", "subscription"), t.searchParams.append("type", n), t.searchParams.append("id", i), p && t.searchParams.append("returnUrl", p), d && t.searchParams.append(I.upsellUtil.constants.UPSELL_QUERY_PARAM_KEY, d), f && t.searchParams.append("paymentSessionId", f), t.toString()
                            }
                            if (a.isAndroidApp || a.isIosApp) {
                                var r = new URL("/mobile-app-upgrades/buy", window.location.origin);
                                return r.searchParams.append("ctx", "subscription"), r.searchParams.append("type", n), r.searchParams.append("id", i), r.toString()
                            }
                        }, [a.isDesktop, a.isAndroidApp, a.isIosApp, n, i, d, f, p]);
                    return (0, o.jsx)(np, {
                        as: "a",
                        href: g,
                        isDisabled: l || !g,
                        isLoading: b,
                        variant: "Emphasis",
                        onClick: v,
                        children: c
                    })
                },
                aN = [{
                    opening: "linkStart",
                    closing: "linkEnd",
                    render: function(t) {
                        return (0, o.jsx)(i8, {
                            href: "https://www.roblox.com/info/terms",
                            color: "Standard",
                            target: "_blank",
                            isExternal: !1,
                            children: t
                        })
                    }
                }],
                aR = function(t) {
                    var r, n = t.translate,
                        i = t.subscriptionProductInfo,
                        a = t.isFreeTrial,
                        s = t.open,
                        l = t.onClose,
                        c = t.isDisabled,
                        u = t.upsellUuid,
                        d = t.paymentSessionId,
                        f = t.redirectUrl,
                        p = t.trackSubscriptionButtonClick,
                        m = (0, nA.DeviceMeta)(),
                        h = i.productKey,
                        b = h.type,
                        y = h.id,
                        v = i.periodType,
                        g = i.localizedPrice,
                        w = i.eligibleOffers,
                        x = null == (r = i.productTypeDetails.robloxSubscriptionProductDetails) ? void 0 : r.featureConfig;
                    return (0, o.jsx)(ag, {
                        open: s,
                        onOpenChange: function(t) {
                            t || l()
                        },
                        children: (0, o.jsxs)(aw, {
                            centerSheetSize: "Medium",
                            largeScreenVariant: "center",
                            closeLabel: n("Action.Close"),
                            children: [(0, o.jsx)(aS, {
                                children: (0, o.jsxs)("div", {
                                    className: "gap-x-small flex items-center",
                                    children: [(0, o.jsx)(rV, {
                                        className: "!size-1000",
                                        name: "icon-regular-roblox-plus"
                                    }), n("Title.GetBlackbird")]
                                })
                            }), (0, o.jsx)(ax, {
                                children: (0, o.jsxs)("div", {
                                    className: "padding-large gap-y-xlarge flex flex-col",
                                    children: [(0, o.jsx)(aE, {
                                        translate: n,
                                        eligibleOffers: w,
                                        periodType: v,
                                        price: g
                                    }), x && (0, o.jsx)(aT, {
                                        translate: n,
                                        featureConfig: x,
                                        periodType: v
                                    }), (0, o.jsx)(aj, {
                                        deviceMeta: m,
                                        isDisabled: void 0 !== c && c,
                                        productId: y,
                                        productType: b,
                                        upsellUuid: u,
                                        paymentSessionId: d,
                                        redirectUrl: f,
                                        trackSubscriptionButtonClick: p,
                                        children: n(a ? "Action.TryItForFree" : "Action.Subscribe")
                                    }), (0, o.jsx)("span", {
                                        className: "text-caption-medium content-muted",
                                        children: nv(n, a ? "Label.FreeTrialDisclosureV2" : "Description.SubscriptionLegal", aN)
                                    })]
                                })
                            })]
                        })
                    })
                },
                aC = function(t) {
                    var r = t.translate,
                        n = t.thumbnail,
                        i = t.assetName,
                        a = t.expectedPrice,
                        s = t.displayPrice,
                        l = t.priceSuffix,
                        c = (t.thumbnailSizePx, t.rentalOptionDays),
                        u = void 0 === c ? null : c,
                        d = t.discountInformation,
                        f = (null == d ? void 0 : d.originalPrice) != null && d.originalPrice > a;
                    return (0, o.jsxs)("div", {
                        className: "flex flex-row items-center gap-large",
                        children: [(0, o.jsxs)("div", {
                            className: "relative shrink-0 unified-modal-thumbnail-container",
                            style: {
                                maxWidth: "40vw",
                                maxHeight: "40vw"
                            },
                            children: [(0, o.jsx)("div", {
                                className: "rounded",
                                style: {
                                    width: "100%",
                                    height: "100%",
                                    backgroundColor: "rgba(255,255,255,0.06)"
                                }
                            }), (0, o.jsx)("div", {
                                className: "absolute unified-modal-thumbnail",
                                style: {
                                    inset: 0,
                                    display: "flex",
                                    alignItems: "center",
                                    justifyContent: "center"
                                },
                                children: n
                            })]
                        }), (0, o.jsxs)("div", {
                            className: "min-w-0 flex flex-col gap-small",
                            children: [(0, o.jsx)("span", {
                                className: "text-body-large break-words",
                                children: (0, o.jsx)(K, {
                                    name: i
                                })
                            }), null != u && u > 0 && (0, o.jsxs)("div", {
                                className: "flex flex-row items-center gap-small",
                                children: [(0, o.jsx)(rV, {
                                    name: "icon-regular-clock"
                                }), (0, o.jsx)("span", {
                                    children: r(v.timedOptionDaysTimerStartsWhenYouBuy, {
                                        days: u
                                    }) || "".concat(u, " days (Timer starts when you buy)")
                                })]
                            }), f ? (0, o.jsxs)("div", {
                                className: "flex flex-row items-center flex-wrap gap-x-small",
                                children: [(0, o.jsxs)("span", {
                                    className: "flex flex-row items-center",
                                    children: [(0, o.jsx)(_, {
                                        translate: r,
                                        price: a,
                                        color: "",
                                        useFreeText: !1
                                    }), l && (0, o.jsx)("span", {
                                        className: "text-robux",
                                        children: l
                                    })]
                                }), (0, o.jsxs)("span", {
                                    className: "flex flex-row items-center",
                                    style: {
                                        textDecoration: "line-through",
                                        opacity: .6
                                    },
                                    children: [(0, o.jsx)(_, {
                                        translate: r,
                                        price: d.originalPrice,
                                        color: "",
                                        useFreeText: !1
                                    }), l && (0, o.jsx)("span", {
                                        className: "text-robux",
                                        children: l
                                    })]
                                })]
                            }) : s ? (0, o.jsx)("div", {
                                className: "flex flex-row items-center",
                                children: (0, o.jsxs)("span", {
                                    className: "text-robux",
                                    children: [s, l]
                                })
                            }) : (0, o.jsxs)("div", {
                                className: "flex flex-row items-center",
                                children: [(0, o.jsx)(_, {
                                    translate: r,
                                    price: a,
                                    color: "",
                                    useFreeText: !1
                                }), l && (0, o.jsx)("span", {
                                    className: "text-robux",
                                    children: l
                                })]
                            })]
                        })]
                    })
                },
                aM = function(t, r) {
                    (0, u.useEffect)(function() {
                        r && (0, iY.fireEvent)("".concat("RenderTracking", "-").concat("Purchase", "-").concat(t))
                    }, [r])
                };

            function aD(t, r) {
                (null == r || r > t.length) && (r = t.length);
                for (var n = 0, i = Array(r); n < r; n++) i[n] = t[n];
                return i
            }
            rq(".foundation-web-accordion-content{grid-template-rows:0fr}.foundation-web-accordion-content[data-state=open]{grid-template-rows:1fr}.foundation-web-accordion-content[data-state=open][data-size=xsmall] .foundation-web-accordion-content-inner{padding-bottom:var(--padding-small);padding-top:var(--padding-xsmall)}.foundation-web-accordion-content[data-state=open][data-size=small] .foundation-web-accordion-content-inner{padding-bottom:var(--padding-large);padding-top:var(--padding-xsmall)}.foundation-web-accordion-content[data-state=open][data-size=large] .foundation-web-accordion-content-inner,.foundation-web-accordion-content[data-state=open][data-size=medium] .foundation-web-accordion-content-inner{padding-bottom:var(--padding-xlarge);padding-top:var(--padding-xsmall)}");
            var ak = (0, u.createContext)(null),
                aF = (0, u.createContext)(null),
                aL = {
                    XSmall: "min-height-600",
                    Small: "min-height-800",
                    Medium: "min-height-1000",
                    Large: "min-height-1200"
                },
                a_ = {
                    XSmall: "padding-y-xsmall",
                    Small: "padding-y-xsmall",
                    Medium: "padding-y-small",
                    Large: "padding-y-small"
                },
                aU = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium",
                    Large: "text-title-large"
                },
                aB = {
                    XSmall: "size-300",
                    Small: "size-400",
                    Medium: "size-500",
                    Large: "size-600"
                },
                aq = (0, u.forwardRef)(function(t, r) {
                    var n = t.children,
                        i = t.className,
                        a = t.size,
                        o = void 0 === a ? "Medium" : a,
                        s = t.hasDivider,
                        l = void 0 !== s && s,
                        c = t.isContained,
                        f = void 0 !== c && c,
                        p = t.isDisabled,
                        m = void 0 !== p && p,
                        h = (0, u.useMemo)(function() {
                            return {
                                size: o,
                                hasDivider: l,
                                isContained: f,
                                isDisabled: m
                            }
                        }, [o, l, f, m]);
                    return d().createElement(ak.Provider, {
                        value: h
                    }, d().createElement("div", {
                        ref: r,
                        className: Z("foundation-web-accordion", "flex flex-col items-start width-full", l && "[&>*:not(:last-child)]:[border-bottom:1px_solid_var(--color-stroke-default)]", i)
                    }, n))
                }),
                az = (0, u.forwardRef)(function(t, r) {
                    var n, i = t.children,
                        a = t.className,
                        o = t.isDisabled,
                        s = void 0 !== o && o,
                        l = t.defaultOpen,
                        c = t.isOpen,
                        f = t.onOpenChange,
                        p = (0, u.useContext)(ak),
                        m = (n = (0, u.useState)(void 0 !== l && l), function(t) {
                            if (Array.isArray(t)) return t
                        }(n) || function(t, r) {
                            var n, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                            if (null != a) {
                                var o = [],
                                    s = !0,
                                    l = !1;
                                try {
                                    for (a = a.call(t); !(s = (n = a.next()).done) && (o.push(n.value), o.length !== r); s = !0);
                                } catch (t) {
                                    l = !0, i = t
                                } finally {
                                    try {
                                        s || null == a.return || a.return()
                                    } finally {
                                        if (l) throw i
                                    }
                                }
                                return o
                            }
                        }(n, 2) || function(t, r) {
                            if (t) {
                                if ("string" == typeof t) return aD(t, 2);
                                var n = Object.prototype.toString.call(t).slice(8, -1);
                                if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return aD(t, r)
                            }
                        }(n, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        h = m[0],
                        b = m[1],
                        y = null != c ? c : h,
                        v = ia("fui-a-");
                    if (!p) throw Error("AccordionItem must be used within Accordion");
                    var g = p.isContained,
                        w = p.isDisabled,
                        x = (0, u.useCallback)(function(t) {
                            s || w || (void 0 === c && b(t), null == f || f(t))
                        }, [s, w, c, f]),
                        S = (0, u.useMemo)(function() {
                            return {
                                isOpen: y,
                                setOpen: x,
                                isDisabled: s,
                                triggerId: "".concat(v, "-trigger"),
                                contentId: "".concat(v, "-content")
                            }
                        }, [y, x, s, v]);
                    return d().createElement(aF.Provider, {
                        value: S
                    }, d().createElement("div", {
                        ref: r,
                        "data-contained": g,
                        "data-state": y ? "open" : "closed",
                        className: Z("foundation-web-accordion-item", "width-full", a)
                    }, i))
                }),
                aV = function(t) {
                    var r = t.children,
                        n = t.className,
                        i = (0, u.useContext)(ak),
                        a = (0, u.useContext)(aF);
                    if (!i) throw Error("AccordionItemTrigger must be used within Accordion");
                    if (!a) throw Error("AccordionItemTrigger must be used within AccordionItem");
                    var o = i.size,
                        s = i.isContained,
                        l = i.isDisabled,
                        c = a.isOpen,
                        f = a.setOpen,
                        p = a.isDisabled,
                        m = l || p;
                    return d().createElement("button", {
                        id: a.triggerId,
                        type: "button",
                        className: Z(rG, "relative flex items-center justify-between gap-small cursor-pointer content-default bg-none stroke-none width-full", aL[o], a_[o], s ? "padding-x-medium" : "padding-x-none", m && [ns, "pointer-events-none"], n),
                        "aria-expanded": c,
                        "aria-controls": a.contentId,
                        onClick: function(t) {
                            t.preventDefault(), m || f(!c)
                        }
                    }, d().createElement(rH, null), d().createElement("div", {
                        className: "flex items-center min-width-0 grow-1"
                    }, d().createElement("span", {
                        className: Z("text-align-x-left", aU[o])
                    }, r)), d().createElement("span", {
                        className: Z("foundation-web-accordion-chevron shrink-0", aB[o], "icon icon-regular-chevron-large-down", "motion-safe:transition-transform duration-200"),
                        style: {
                            transform: c ? "rotate(180deg)" : "rotate(0deg)"
                        }
                    }))
                },
                aG = function(t) {
                    var r = t.children,
                        n = t.className,
                        i = (0, u.useContext)(ak),
                        a = (0, u.useContext)(aF);
                    if (!i) throw Error("AccordionItemContent must be used within Accordion");
                    if (!a) throw Error("AccordionItemContent must be used within AccordionItem");
                    var o = i.size,
                        s = a.isOpen ? {} : {
                            inert: "inert"
                        };
                    return d().createElement("div", Object.assign({
                        id: a.contentId,
                        role: "region",
                        "aria-labelledby": a.triggerId,
                        "aria-hidden": !a.isOpen,
                        "data-state": a.isOpen ? "open" : "closed",
                        "data-size": o.toLowerCase()
                    }, s, {
                        className: Z("foundation-web-accordion-content grid clip width-full motion-safe:transition-all duration-200 ease-standard-out")
                    }), d().createElement("div", {
                        className: Z("foundation-web-accordion-content-inner width-full min-height-0 clip padding-top-none padding-bottom-none motion-safe:transition-transform duration-200", !a.isOpen && "pointer-events-none", n)
                    }, r))
                };

            function aH(t) {
                return !!(null == t ? void 0 : t.some(function(t) {
                    return "ROBLOX_PLUS" === t.discountType || "BlackbirdSubscription" === t.discountCampaign || "RobloxPlusSubscription" === t.discountCampaign || "RobloxSubscription" === t.discountCampaign
                }))
            }
            var aW = String.fromCodePoint(57346),
                aX = RegExp("".concat(aW, "|\\\\u\\{E002\\}|\\\\uE002"), "gi"),
                aK = function(t) {
                    var r = t.text,
                        n = t.className,
                        i = t.id;
                    return (0, o.jsx)("span", {
                        id: i,
                        className: Z("inline", n),
                        children: function(t) {
                            if (aX.lastIndex = 0, !aX.test(t)) return [t];
                            for (var r = [], n = 0, i = RegExp(aX.source, "gi"), a = i.exec(t); a;) {
                                var s = a.index;
                                s > n && r.push(t.slice(n, s)), r.push((0, o.jsx)("span", {
                                    className: "icon-robux-16x16 inline-block align-text-bottom",
                                    "aria-hidden": !0
                                }, "robux-icon-".concat(s))), n = s + a[0].length, a = i.exec(t)
                            }
                            return n < t.length && r.push(t.slice(n)), r
                        }(r)
                    })
                };

            function aY(t, r) {
                (null == r || r > t.length) && (r = t.length);
                for (var n = 0, i = Array(r); n < r; n++) i[n] = t[n];
                return i
            }
            var a$ = function(t) {
                    var r = t.amount,
                        n = Math.abs(r);
                    return (0, o.jsxs)(d().Fragment, {
                        children: [r < 0 && (0, o.jsx)("span", {
                            className: "text-robux",
                            children: "-"
                        }), (0, o.jsx)("span", {
                            className: "icon-robux-16x16"
                        }), (0, o.jsx)("span", {
                            className: "text-robux",
                            children: (0, F.formatNumber)(n)
                        })]
                    })
                },
                aJ = function(t) {
                    var r, n = t.translate,
                        i = t.normalizedDiscount,
                        a = t.savingsSummary,
                        s = i.savedAmount,
                        l = i.originalPrice,
                        c = i.totalPrice,
                        d = i.discountLines,
                        f = (r = (0, u.useState)(!1), function(t) {
                            if (Array.isArray(t)) return t
                        }(r) || function(t, r) {
                            var n, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                            if (null != a) {
                                var o = [],
                                    s = !0,
                                    l = !1;
                                try {
                                    for (a = a.call(t); !(s = (n = a.next()).done) && (o.push(n.value), o.length !== r); s = !0);
                                } catch (t) {
                                    l = !0, i = t
                                } finally {
                                    try {
                                        s || null == a.return || a.return()
                                    } finally {
                                        if (l) throw i
                                    }
                                }
                                return o
                            }
                        }(r, 2) || function(t, r) {
                            if (t) {
                                if ("string" == typeof t) return aY(t, 2);
                                var n = Object.prototype.toString.call(t).slice(8, -1);
                                if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return aY(t, r)
                            }
                        }(r, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        p = f[0],
                        m = f[1],
                        h = aH(d),
                        b = null == a ? void 0 : a.trim(),
                        y = [{
                            opening: "amountStart",
                            closing: "amountEnd",
                            render: function() {
                                return (0, o.jsx)(a$, {
                                    amount: s
                                })
                            }
                        }],
                        v = function(t) {
                            var r;
                            return aH([t]) ? t.localizedAttribution ? (0, o.jsx)(aK, {
                                text: t.localizedAttribution
                            }) : n("Label.PlusBenefitDiscount", {
                                discountPercent: String(null != (r = t.discountPercent) ? r : 0)
                            }) : (0, o.jsx)(aK, {
                                text: t.label
                            })
                        };
                    return (0, o.jsx)(aq, {
                        className: "text-body-medium padding-none stroke-default stroke-thick radius-medium",
                        children: (0, o.jsxs)(az, {
                            isOpen: p,
                            onOpenChange: m,
                            children: [(0, o.jsx)(aV, {
                                className: Z("!padding-medium bg-shift-100 width-full flex flex-row items-center justify-between", p && "[border-bottom-left-radius:0] [border-bottom-right-radius:0]"),
                                children: (0, o.jsxs)("div", {
                                    className: "flex flex-row items-center gap-x-small content-emphasis",
                                    children: [h && !b && (0, o.jsx)(rV, {
                                        name: "icon-regular-roblox-plus",
                                        size: "Medium"
                                    }), (0, o.jsx)("span", {
                                        children: b ? (0, o.jsx)(aK, {
                                            text: b
                                        }) : h ? nv(n, "Description.SavingWithPlus", y, {
                                            robuxAmount: (0, F.formatNumber)(s)
                                        }) : n("Description.SavingRobux", {
                                            robuxAmount: (0, F.formatNumber)(s)
                                        })
                                    })]
                                })
                            }), (0, o.jsxs)(aG, {
                                className: "!padding-none",
                                children: [(0, o.jsxs)("div", {
                                    className: "padding-medium padding-bottom-small flex flex-col gap-y-small bg-shift-100 stroke-default stroke-thick",
                                    style: {
                                        borderTop: "0px",
                                        borderLeft: "0px",
                                        borderRight: "0px"
                                    },
                                    children: [(0, o.jsxs)("div", {
                                        className: "flex flex-row items-center justify-between content-default",
                                        children: [(0, o.jsx)("span", {
                                            children: n("Label.Subtotal")
                                        }), (0, o.jsx)("span", {
                                            className: "flex flex-row items-center",
                                            children: (0, o.jsx)(a$, {
                                                amount: l
                                            })
                                        })]
                                    }), d.map(function(t, r) {
                                        var n;
                                        return (0, o.jsxs)("div", {
                                            className: "flex flex-row items-center justify-between content-default",
                                            children: [(0, o.jsx)("span", {
                                                children: v(t)
                                            }), (0, o.jsx)("span", {
                                                className: "flex flex-row items-center",
                                                children: (0, o.jsx)(a$, {
                                                    amount: -t.discountAmount
                                                })
                                            })]
                                        }, "".concat(null != (n = t.discountCampaign) ? n : "discount", "-").concat(r))
                                    })]
                                }), (0, o.jsxs)("div", {
                                    className: "padding-medium flex flex-row items-center justify-between text-heading-small content-default bg-shift-100",
                                    children: [(0, o.jsx)("span", {
                                        children: n("Label.Total")
                                    }), (0, o.jsx)("span", {
                                        className: "flex flex-row items-center",
                                        children: (0, o.jsx)(a$, {
                                            amount: c
                                        })
                                    })]
                                })]
                            })]
                        })
                    })
                };

            function aQ(t, r, n, i, a, o, s) {
                try {
                    var l = t[o](s),
                        c = l.value
                } catch (t) {
                    n(t);
                    return
                }
                l.done ? r(c) : Promise.resolve(c).then(i, a)
            }

            function aZ(t) {
                return function() {
                    var r = this,
                        n = arguments;
                    return new Promise(function(i, a) {
                        var o = t.apply(r, n);

                        function s(t) {
                            aQ(o, i, a, s, l, "next", t)
                        }

                        function l(t) {
                            aQ(o, i, a, s, l, "throw", t)
                        }
                        s(void 0)
                    })
                }
            }

            function a0(t, r) {
                var n, i, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return s.next = l(0), s.throw = l(1), s.return = l(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
                    return this
                }), s;

                function l(l) {
                    return function(c) {
                        var u = [l, c];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; s && (s = 0, u[0] && (o = 0)), o;) try {
                            if (n = 1, i && (a = 2 & u[0] ? i.return : u[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, u[1])).done) return a;
                            switch (i = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                case 0:
                                case 1:
                                    a = u;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, i = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                        o.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && o.label < a[1]) {
                                        o.label = a[1], a = u;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(u);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            u = r.call(t, o)
                        } catch (t) {
                            u = [6, t], i = 0
                        } finally {
                            n = a = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var a1 = null;

            function a2(t, r, n, i, a, o, s) {
                try {
                    var l = t[o](s),
                        c = l.value
                } catch (t) {
                    n(t);
                    return
                }
                l.done ? r(c) : Promise.resolve(c).then(i, a)
            }

            function a3(t, r) {
                (null == r || r > t.length) && (r = t.length);
                for (var n = 0, i = Array(r); n < r; n++) i[n] = t[n];
                return i
            }

            function a4(t, r, n, i, a, o, s) {
                try {
                    var l = t[o](s),
                        c = l.value
                } catch (t) {
                    n(t);
                    return
                }
                l.done ? r(c) : Promise.resolve(c).then(i, a)
            }

            function a6(t) {
                for (var r = 1; r < arguments.length; r++) {
                    var n = null != arguments[r] ? arguments[r] : {},
                        i = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (i = i.concat(Object.getOwnPropertySymbols(n).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(n, t).enumerable
                    }))), i.forEach(function(r) {
                        var i;
                        i = n[r], r in t ? Object.defineProperty(t, r, {
                            value: i,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : t[r] = i
                    })
                }
                return t
            }

            function a8(t, r) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, r) {
                    var n, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var o = [],
                            s = !0,
                            l = !1;
                        try {
                            for (a = a.call(t); !(s = (n = a.next()).done) && (o.push(n.value), !r || o.length !== r); s = !0);
                        } catch (t) {
                            l = !0, i = t
                        } finally {
                            try {
                                s || null == a.return || a.return()
                            } finally {
                                if (l) throw i
                            }
                        }
                        return o
                    }
                }(t, r) || function(t, r) {
                    if (t) {
                        if ("string" == typeof t) return a3(t, r);
                        var n = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return a3(t, r)
                    }
                }(t, r) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var a5 = window.Roblox["core-scripts"].localStorage.localStorage,
                a7 = n.n(a5),
                a9 = window.Roblox["core-scripts"].paymentsFlow,
                oe = n.n(a9);

            function ot(t, r, n, i, a, o, s) {
                try {
                    var l = t[o](s),
                        c = l.value
                } catch (t) {
                    n(t);
                    return
                }
                l.done ? r(c) : Promise.resolve(c).then(i, a)
            }

            function or(t) {
                return t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t
            }
            var on = ((oK = {}).GET = "GET", oK.POST = "POST", oK),
                oi = ((oY = {}).PAYMENT = "Payment", oY.ROBUX = "Robux", oY.ROBUX_GIFTING = "RobuxGifting", oY.ROBUX_REDESIGN = "RobuxRedesign", oY),
                oa = ((o$ = {}).VERIFY_PHONE_VERIFICATION_SESSION = "VerifyPhoneVerificationSession", o$.LANDING_PAGE_METADATA = "GetLandingPageMetadata", o$.GET_USER_NAME = "GetUserName", o$.PREPARE_PAYMENT = "PreparePayment", o$.GET_METADATA = "GetMetadata", o$.GET_PRODUCTS = "GetProducts", o$.GET_PAYMENT_METHODS_INFO = "GetPaymentMethodsInfo", o$.GET_PURCHASE_WARNING = "GetPurchaseWarning", o$.GET_USER_PURCHASE_ELIGIBILITY = "GetUserPurchaseEligibility", o$.CREATE_PAYMENT_SESSION = "CreatePaymentSession", o$.GET_PAYMENT_SESSION = "GetPaymentSession", o$.GET_PAYMENT_SESSION_BY_CHECKOUT_SESSION_ID = "GetPaymentSessionByCheckoutSessionId", o$.CREATE_BONUS_SESSION = "CreateBonusSession", o$.GET_BONUS_SESSION_BY_CHECKOUT_SESSION_ID = "GetBonusSessionByCheckoutSessionId", o$.GET_DISPLAYABLE_BONUS_FOR_PRODUCT = "GetDisplayableBonusForProduct", o$.GET_THUMBNAILS = "GetThumbnails", o$.HANDLE_GAME_PASS_JOIN_EVENT = "HandleGamePassJoinEvent", o$.GET_ROBUX_BALANCE = "GetRobuxBalance", o$.GET_AUTH_TICKET = "GetAuthTicket", o$.GET_CLIENT_ASSERTION = "GetClientAssertion", o$),
                oo = function(t, r, n) {
                    return new Promise(function(i) {
                        (0, iY.fireEvent)("API_COUNTER_".concat(t, "_").concat(r, "_").concat(n || "Throughput")), i()
                    })
                },
                os = function(t, r, n) {
                    return new Promise(function(i) {
                        (0, iY.fireEvent)("ERROR_COUNTER_".concat(t, "_").concat(r, "_").concat(n || "UnknownAxiosError")), i()
                    })
                };

            function ol(t, r, n, i, a) {
                var o;
                return (o = function(t, r, n, i, a) {
                    var o, s, l, c, u, d, f;
                    return function(t, r) {
                        var n, i, a, o = {
                                label: 0,
                                sent: function() {
                                    if (1 & a[0]) throw a[1];
                                    return a[1]
                                },
                                trys: [],
                                ops: []
                            },
                            s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                        return s.next = l(0), s.throw = l(1), s.return = l(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
                            return this
                        }), s;

                        function l(l) {
                            return function(c) {
                                var u = [l, c];
                                if (n) throw TypeError("Generator is already executing.");
                                for (; s && (s = 0, u[0] && (o = 0)), o;) try {
                                    if (n = 1, i && (a = 2 & u[0] ? i.return : u[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, u[1])).done) return a;
                                    switch (i = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                        case 0:
                                        case 1:
                                            a = u;
                                            break;
                                        case 4:
                                            return o.label++, {
                                                value: u[1],
                                                done: !1
                                            };
                                        case 5:
                                            o.label++, i = u[1], u = [0];
                                            continue;
                                        case 7:
                                            u = o.ops.pop(), o.trys.pop();
                                            continue;
                                        default:
                                            if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                o = 0;
                                                continue
                                            }
                                            if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                                o.label = u[1];
                                                break
                                            }
                                            if (6 === u[0] && o.label < a[1]) {
                                                o.label = a[1], a = u;
                                                break
                                            }
                                            if (a && o.label < a[2]) {
                                                o.label = a[2], o.ops.push(u);
                                                break
                                            }
                                            a[2] && o.ops.pop(), o.trys.pop();
                                            continue
                                    }
                                    u = r.call(t, o)
                                } catch (t) {
                                    u = [6, t], i = 0
                                } finally {
                                    n = a = 0
                                }
                                if (5 & u[0]) throw u[1];
                                return {
                                    value: u[0] ? u[1] : void 0,
                                    done: !0
                                }
                            }
                        }
                    }(this, function(p) {
                        switch (p.label) {
                            case 0:
                                o = n.feature, s = n.call, oo(o, s), p.label = 1;
                            case 1:
                                return p.trys.push([1, 3, , 4]), [4, "GET" === t ? T.httpService.get(r, i) : T.httpService.post(r, i)];
                            case 2:
                                return c = (l = p.sent()).data, u = l.headers, oo(o, s, 200), [2, (null == a ? void 0 : a(c, u)) || c];
                            case 3:
                                var m, h, b;
                                return (void 0 === (m = d = p.sent()) ? "undefined" : or(m)) === "object" && "status" in m ? os(o, s, d.status) : (void 0 === d ? "undefined" : or(d)) === "object" && "config" in d ? os(o, s, null == (f = d.response) ? void 0 : f.status) : (console.error(d), h = o, b = s, new Promise(function(t) {
                                    (0, iY.fireEvent)("ERROR_COUNTER_".concat(h, "_").concat(b, "_NonAxiosError")), t()
                                })), [2, void 0];
                            case 4:
                                return [2]
                        }
                    })
                }, function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, i) {
                        var a = o.apply(t, r);

                        function s(t) {
                            ot(a, n, i, s, l, "next", t)
                        }

                        function l(t) {
                            ot(a, n, i, s, l, "throw", t)
                        }
                        s(void 0)
                    })
                }).apply(this, arguments)
            }

            function oc(t, r, n, i, a, o, s) {
                try {
                    var l = t[o](s),
                        c = l.value
                } catch (t) {
                    n(t);
                    return
                }
                l.done ? r(c) : Promise.resolve(c).then(i, a)
            }

            function ou(t) {
                return function() {
                    var r = this,
                        n = arguments;
                    return new Promise(function(i, a) {
                        var o = t.apply(r, n);

                        function s(t) {
                            oc(o, i, a, s, l, "next", t)
                        }

                        function l(t) {
                            oc(o, i, a, s, l, "throw", t)
                        }
                        s(void 0)
                    })
                }
            }

            function od(t, r) {
                var n, i, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return s.next = l(0), s.throw = l(1), s.return = l(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
                    return this
                }), s;

                function l(l) {
                    return function(c) {
                        var u = [l, c];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; s && (s = 0, u[0] && (o = 0)), o;) try {
                            if (n = 1, i && (a = 2 & u[0] ? i.return : u[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, u[1])).done) return a;
                            switch (i = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                case 0:
                                case 1:
                                    a = u;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, i = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                        o.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && o.label < a[1]) {
                                        o.label = a[1], a = u;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(u);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            u = r.call(t, o)
                        } catch (t) {
                            u = [6, t], i = 0
                        } finally {
                            n = a = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function of(t, r) {
                (null == r || r > t.length) && (r = t.length);
                for (var n = 0, i = Array(r); n < r; n++) i[n] = t[n];
                return i
            }

            function op(t, r, n, i, a, o, s) {
                try {
                    var l = t[o](s),
                        c = l.value
                } catch (t) {
                    n(t);
                    return
                }
                l.done ? r(c) : Promise.resolve(c).then(i, a)
            }

            function om(t, r) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, r) {
                    var n, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var o = [],
                            s = !0,
                            l = !1;
                        try {
                            for (a = a.call(t); !(s = (n = a.next()).done) && (o.push(n.value), !r || o.length !== r); s = !0);
                        } catch (t) {
                            l = !0, i = t
                        } finally {
                            try {
                                s || null == a.return || a.return()
                            } finally {
                                if (l) throw i
                            }
                        }
                        return o
                    }
                }(t, r) || function(t, r) {
                    if (t) {
                        if ("string" == typeof t) return of(t, r);
                        var n = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return of(t, r)
                    }
                }(t, r) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var oh = "paymentSession-".concat((null === nA.CurrentUser || void 0 === nA.CurrentUser ? void 0 : nA.CurrentUser.userId) || "loggedout");

            function ob(t, r) {
                (null == r || r > t.length) && (r = t.length);
                for (var n = 0, i = Array(r); n < r; n++) i[n] = t[n];
                return i
            }

            function oy(t, r) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, r) {
                    var n, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var o = [],
                            s = !0,
                            l = !1;
                        try {
                            for (a = a.call(t); !(s = (n = a.next()).done) && (o.push(n.value), !r || o.length !== r); s = !0);
                        } catch (t) {
                            l = !0, i = t
                        } finally {
                            try {
                                s || null == a.return || a.return()
                            } finally {
                                if (l) throw i
                            }
                        }
                        return o
                    }
                }(t, r) || function(t, r) {
                    if (t) {
                        if ("string" == typeof t) return ob(t, r);
                        var n = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return ob(t, r)
                    }
                }(t, r) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var ov = (0, c.withTranslations)(function(t) {
                var r, n, i, a, s, l, c, f, p, m, h, b, y, v, g, w, x, S, P, E, O, j, N, R, C, M, D, k, F, L, _, U, B, q, z, V, G, H = t.translate,
                    W = t.titleText,
                    X = t.actionButtonText,
                    K = t.expectedPrice,
                    Y = t.displayPrice,
                    $ = t.thumbnail,
                    J = t.assetName,
                    Q = t.assetType,
                    Z = (t.assetTypeDisplayName, t.sellerName, t.onAction),
                    ee = t.onSecondaryAction,
                    et = t.secondaryActionButtonText,
                    er = t.footerDisclaimerText,
                    en = t.priceSuffix,
                    ei = t.onCancel,
                    ea = t.loading,
                    eo = void 0 !== ea && ea,
                    es = t.currentRobuxBalance,
                    el = t.rentalOptionDays,
                    ec = void 0 === el ? null : el,
                    eu = t.open,
                    ed = void 0 !== eu && eu,
                    ef = t.subscriptionProductInfo,
                    ep = t.discountInformation,
                    em = t.collectibleItemId,
                    eh = t.isLimited,
                    eb = oy((0, u.useState)(!1), 2),
                    ey = eb[0],
                    ev = eb[1],
                    eg = oy((0, u.useState)(), 2),
                    ew = eg[0],
                    ex = eg[1],
                    eS = oy((0, u.useState)(), 2),
                    eP = eS[0],
                    eE = eS[1],
                    eI = (i = void 0 === (n = (r = {
                        collectibleItemId: void 0 === em ? null : em,
                        rentalOptionDays: ec,
                        expectedPrice: K,
                        isLimitedItem: void 0 !== eh && eh,
                        open: ed
                    }).collectibleItemId) ? null : n, s = void 0 === (a = r.rentalOptionDays) ? null : a, l = r.expectedPrice, c = r.isLimitedItem, p = void 0 !== (f = r.open) && f, m = r.onPriceResolved, h = null != l && l <= 0 || void 0 !== c && c, y = (b = a8((0, u.useState)([]), 2))[0], v = b[1], g = (0, u.useRef)([]), (0, u.useEffect)(function() {
                        g.current = y
                    }, [y]), x = (w = a8((0, u.useState)(), 2))[0], S = w[1], E = (P = a8((0, u.useState)(void 0), 2))[0], O = P[1], N = (j = a8((0, u.useState)(), 2))[0], R = j[1], M = (C = a8((0, u.useState)(!1), 2))[0], D = C[1], k = (0, u.useRef)(0), F = (0, u.useRef)(m), (0, u.useEffect)(function() {
                        F.current = m
                    }, [m]), L = (0, u.useCallback)(function(t) {
                        var r;
                        return (r = function() {
                            var r, n, a, o, l, c, u, d, f, p;
                            return function(t, r) {
                                var n, i, a, o = {
                                        label: 0,
                                        sent: function() {
                                            if (1 & a[0]) throw a[1];
                                            return a[1]
                                        },
                                        trys: [],
                                        ops: []
                                    },
                                    s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                return s.next = l(0), s.throw = l(1), s.return = l(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
                                    return this
                                }), s;

                                function l(l) {
                                    return function(c) {
                                        var u = [l, c];
                                        if (n) throw TypeError("Generator is already executing.");
                                        for (; s && (s = 0, u[0] && (o = 0)), o;) try {
                                            if (n = 1, i && (a = 2 & u[0] ? i.return : u[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, u[1])).done) return a;
                                            switch (i = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                                case 0:
                                                case 1:
                                                    a = u;
                                                    break;
                                                case 4:
                                                    return o.label++, {
                                                        value: u[1],
                                                        done: !1
                                                    };
                                                case 5:
                                                    o.label++, i = u[1], u = [0];
                                                    continue;
                                                case 7:
                                                    u = o.ops.pop(), o.trys.pop();
                                                    continue;
                                                default:
                                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                        o = 0;
                                                        continue
                                                    }
                                                    if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                                        o.label = u[1];
                                                        break
                                                    }
                                                    if (6 === u[0] && o.label < a[1]) {
                                                        o.label = a[1], a = u;
                                                        break
                                                    }
                                                    if (a && o.label < a[2]) {
                                                        o.label = a[2], o.ops.push(u);
                                                        break
                                                    }
                                                    a[2] && o.ops.pop(), o.trys.pop();
                                                    continue
                                            }
                                            u = r.call(t, o)
                                        } catch (t) {
                                            u = [6, t], i = 0
                                        } finally {
                                            n = a = 0
                                        }
                                        if (5 & u[0]) throw u[1];
                                        return {
                                            value: u[0] ? u[1] : void 0,
                                            done: !0
                                        }
                                    }
                                }
                            }(this, function(m) {
                                var b, y, g, w;
                                switch (m.label) {
                                    case 0:
                                        if (!i || h) return [2];
                                        r = k.current + 1, k.current = r, D(!0), m.label = 1;
                                    case 1:
                                        return m.trys.push([1, , 3, 4]), [4, (b = a6({
                                            featureKey: "MARKETPLACE_CART",
                                            items: [null != s && s > 0 ? {
                                                collectibleItemId: i,
                                                rentalDays: s
                                            } : {
                                                collectibleItemId: i,
                                                isPermanent: !0
                                            }]
                                        }, (null == t ? void 0 : t.length) ? {
                                            unselectedOffers: t
                                        } : {}), (y = function() {
                                            var t, r, n;
                                            return function(t, r) {
                                                var n, i, a, o = {
                                                        label: 0,
                                                        sent: function() {
                                                            if (1 & a[0]) throw a[1];
                                                            return a[1]
                                                        },
                                                        trys: [],
                                                        ops: []
                                                    },
                                                    s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                                return s.next = l(0), s.throw = l(1), s.return = l(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
                                                    return this
                                                }), s;

                                                function l(l) {
                                                    return function(c) {
                                                        var u = [l, c];
                                                        if (n) throw TypeError("Generator is already executing.");
                                                        for (; s && (s = 0, u[0] && (o = 0)), o;) try {
                                                            if (n = 1, i && (a = 2 & u[0] ? i.return : u[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, u[1])).done) return a;
                                                            switch (i = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                                                case 0:
                                                                case 1:
                                                                    a = u;
                                                                    break;
                                                                case 4:
                                                                    return o.label++, {
                                                                        value: u[1],
                                                                        done: !1
                                                                    };
                                                                case 5:
                                                                    o.label++, i = u[1], u = [0];
                                                                    continue;
                                                                case 7:
                                                                    u = o.ops.pop(), o.trys.pop();
                                                                    continue;
                                                                default:
                                                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                                        o = 0;
                                                                        continue
                                                                    }
                                                                    if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                                                        o.label = u[1];
                                                                        break
                                                                    }
                                                                    if (6 === u[0] && o.label < a[1]) {
                                                                        o.label = a[1], a = u;
                                                                        break
                                                                    }
                                                                    if (a && o.label < a[2]) {
                                                                        o.label = a[2], o.ops.push(u);
                                                                        break
                                                                    }
                                                                    a[2] && o.ops.pop(), o.trys.pop();
                                                                    continue
                                                            }
                                                            u = r.call(t, o)
                                                        } catch (t) {
                                                            u = [6, t], i = 0
                                                        } finally {
                                                            n = a = 0
                                                        }
                                                        if (5 & u[0]) throw u[1];
                                                        return {
                                                            value: u[0] ? u[1] : void 0,
                                                            done: !0
                                                        }
                                                    }
                                                }
                                            }(this, function(i) {
                                                switch (i.label) {
                                                    case 0:
                                                        t = {
                                                            url: "".concat(A.EnvironmentUrls.apiGatewayUrl, "/marketplace-sales/v1/cart-pricing"),
                                                            withCredentials: !0
                                                        }, i.label = 1;
                                                    case 1:
                                                        return i.trys.push([1, 3, , 4]), [4, nO.post(t, b)];
                                                    case 2:
                                                        if (200 !== (r = i.sent()).status) return [2, null];
                                                        return [2, null != (n = r.data) ? n : null];
                                                    case 3:
                                                        return i.sent(), [2, null];
                                                    case 4:
                                                        return [2]
                                                }
                                            })
                                        }, function() {
                                            var t = this,
                                                r = arguments;
                                            return new Promise(function(n, i) {
                                                var a = y.apply(t, r);

                                                function o(t) {
                                                    a2(a, n, i, o, s, "next", t)
                                                }

                                                function s(t) {
                                                    a2(a, n, i, o, s, "throw", t)
                                                }
                                                o(void 0)
                                            })
                                        })())];
                                    case 2:
                                        if (c = m.sent(), r !== k.current) return [2];
                                        if (!c) return R(void 0), [2];
                                        return (null == (d = null != (u = null == (n = c.items) ? void 0 : n.find(function(t) {
                                            return t.collectibleItemId === i
                                        })) ? u : null == (a = c.items) ? void 0 : a[0]) ? void 0 : d.priceInRobux) != null && S(d.priceInRobux), O(null != (f = null == d ? void 0 : d.discountInformation) ? f : null), R((null == (o = c.savingsSummary) ? void 0 : o.trim()) || void 0), null == (l = F.current) || l.call(F, null != (p = null == d ? void 0 : d.priceInRobux) ? p : void 0), v(null != (w = null == (g = c.availableOffers) ? void 0 : g.reduce(function(t, r) {
                                            var n, i, a = null == (n = r.localizedDescription) ? void 0 : n.trim();
                                            return r.offerId && a && t.push({
                                                offerId: r.offerId,
                                                localizedText: a,
                                                selected: null != (i = r.selected) && i
                                            }), t
                                        }, [])) ? w : []), [3, 4];
                                    case 3:
                                        return r === k.current && D(!1), [7];
                                    case 4:
                                        return [2]
                                }
                            })
                        }, function() {
                            var t = this,
                                n = arguments;
                            return new Promise(function(i, a) {
                                var o = r.apply(t, n);

                                function s(t) {
                                    a4(o, i, a, s, l, "next", t)
                                }

                                function l(t) {
                                    a4(o, i, a, s, l, "throw", t)
                                }
                                s(void 0)
                            })
                        })()
                    }, [i, s, h]), (0, u.useEffect)(function() {
                        if (!p) {
                            k.current += 1, S(void 0), O(void 0), R(void 0), v([]), D(!1);
                            return
                        }
                        i && !h && L().catch(function() {})
                    }, [p, i, h, L]), _ = (0, u.useCallback)(function(t, r) {
                        var n = g.current.map(function(n) {
                            var i, a;
                            return n.offerId === t ? (i = a6({}, n), a = a = {
                                selected: r
                            }, Object.getOwnPropertyDescriptors ? Object.defineProperties(i, Object.getOwnPropertyDescriptors(a)) : (function(t, r) {
                                var n = Object.keys(t);
                                if (Object.getOwnPropertySymbols) {
                                    var i = Object.getOwnPropertySymbols(t);
                                    n.push.apply(n, i)
                                }
                                return n
                            })(Object(a)).forEach(function(t) {
                                Object.defineProperty(i, t, Object.getOwnPropertyDescriptor(a, t))
                            }), i) : n
                        });
                        g.current = n, v(n);
                        var i = n.filter(function(t) {
                            return !t.selected
                        }).map(function(t) {
                            return t.offerId
                        });
                        L(i.length ? i : void 0).catch(function() {})
                    }, [L]), U = (0, u.useMemo)(function() {
                        return y.filter(function(t) {
                            return t.selected
                        }).map(function(t) {
                            return t.offerId
                        })
                    }, [y]), {
                        offerSelections: y,
                        resolvedPrice: x,
                        resolvedDiscountInformation: E,
                        resolvedSavingsSummary: N,
                        isPricingLoading: M,
                        selectedOfferIds: U,
                        handleOfferCheckedChange: _
                    }),
                    eA = eI.offerSelections,
                    eT = eI.resolvedPrice,
                    eO = eI.resolvedDiscountInformation,
                    ej = eI.resolvedSavingsSummary,
                    eN = eI.isPricingLoading,
                    eR = eI.selectedOfferIds,
                    eC = eI.handleOfferCheckedChange,
                    eM = oy((0, u.useState)(!1), 2),
                    eD = eM[0],
                    ek = eM[1],
                    eF = function() {
                        var t = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
                        return function() {
                            var t = arguments.length > 0 && void 0 !== arguments[0] && arguments[0],
                                r = om((0, u.useState)(t ? void 0 : a7().getLocalStorage(oh)), 2),
                                n = r[0],
                                i = r[1],
                                a = om((0, u.useState)(!1), 2),
                                o = a[0],
                                s = a[1],
                                l = (0, u.useCallback)(function(t) {
                                    var r;
                                    return (r = function() {
                                        var r, n;
                                        return function(t, r) {
                                            var n, i, a, o = {
                                                    label: 0,
                                                    sent: function() {
                                                        if (1 & a[0]) throw a[1];
                                                        return a[1]
                                                    },
                                                    trys: [],
                                                    ops: []
                                                },
                                                s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                            return s.next = l(0), s.throw = l(1), s.return = l(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
                                                return this
                                            }), s;

                                            function l(l) {
                                                return function(c) {
                                                    var u = [l, c];
                                                    if (n) throw TypeError("Generator is already executing.");
                                                    for (; s && (s = 0, u[0] && (o = 0)), o;) try {
                                                        if (n = 1, i && (a = 2 & u[0] ? i.return : u[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, u[1])).done) return a;
                                                        switch (i = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                                            case 0:
                                                            case 1:
                                                                a = u;
                                                                break;
                                                            case 4:
                                                                return o.label++, {
                                                                    value: u[1],
                                                                    done: !1
                                                                };
                                                            case 5:
                                                                o.label++, i = u[1], u = [0];
                                                                continue;
                                                            case 7:
                                                                u = o.ops.pop(), o.trys.pop();
                                                                continue;
                                                            default:
                                                                if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                                    o = 0;
                                                                    continue
                                                                }
                                                                if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                                                    o.label = u[1];
                                                                    break
                                                                }
                                                                if (6 === u[0] && o.label < a[1]) {
                                                                    o.label = a[1], a = u;
                                                                    break
                                                                }
                                                                if (a && o.label < a[2]) {
                                                                    o.label = a[2], o.ops.push(u);
                                                                    break
                                                                }
                                                                a[2] && o.ops.pop(), o.trys.pop();
                                                                continue
                                                        }
                                                        u = r.call(t, o)
                                                    } catch (t) {
                                                        u = [6, t], i = 0
                                                    } finally {
                                                        n = a = 0
                                                    }
                                                    if (5 & u[0]) throw u[1];
                                                    return {
                                                        value: u[0] ? u[1] : void 0,
                                                        done: !0
                                                    }
                                                }
                                            }
                                        }(this, function(a) {
                                            switch (a.label) {
                                                case 0:
                                                    if (!t) return [3, 2];
                                                    return [4, ou(function() {
                                                        return od(this, function(r) {
                                                            return [2, ol(on.GET, {
                                                                withCredentials: !0,
                                                                url: "".concat(nA.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-sessions/").concat(t)
                                                            }, {
                                                                feature: oi.PAYMENT,
                                                                call: oa.GET_PAYMENT_SESSION
                                                            })]
                                                        })
                                                    })()];
                                                case 1:
                                                    return n = a.sent(), [3, 4];
                                                case 2:
                                                    return [4, ou(function() {
                                                        return od(this, function(t) {
                                                            return [2, ol(on.POST, {
                                                                withCredentials: !0,
                                                                url: "".concat(nA.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-sessions")
                                                            }, {
                                                                feature: oi.PAYMENT,
                                                                call: oa.CREATE_PAYMENT_SESSION
                                                            }, {
                                                                paymentFlowId: oe().getPaymentFlowUuid()
                                                            })]
                                                        })
                                                    })()];
                                                case 3:
                                                    n = a.sent(), a.label = 4;
                                                case 4:
                                                    if (!(r = n)) return [2];
                                                    return a7().setLocalStorage(oh, r.paymentSession), i(r.paymentSession), [2]
                                            }
                                        })
                                    }, function() {
                                        var t = this,
                                            n = arguments;
                                        return new Promise(function(i, a) {
                                            var o = r.apply(t, n);

                                            function s(t) {
                                                op(o, i, a, s, l, "next", t)
                                            }

                                            function l(t) {
                                                op(o, i, a, s, l, "throw", t)
                                            }
                                            s(void 0)
                                        })
                                    })()
                                }, []);
                            return (0, u.useEffect)(function() {
                                if (n) {
                                    new Date(n.expiresAt) < new Date && (s(!0), l());
                                    return
                                }
                                var t, r = null == (t = T.urlService.getQueryParam("paymentSessionId")) ? void 0 : t.toString();
                                r || s(!0), l(r)
                            }, [l, n]), (0, u.useMemo)(function() {
                                return {
                                    paymentSession: n,
                                    wasCreatedByCurrentClient: o
                                }
                            }, [n, o])
                        }(t).paymentSession
                    }(!1),
                    eL = null == eF ? void 0 : eF.id,
                    e_ = (0, u.useMemo)(function() {
                        return eL ? {
                            paymentSessionId: eL
                        } : {}
                    }, [eL]);
                (0, u.useEffect)(function() {
                    var t = !1;
                    return aZ(function() {
                            return a0(this, function(t) {
                                return a1 ? [2, a1] : [2, a1 = aZ(function() {
                                    return a0(this, function(t) {
                                        switch (t.label) {
                                            case 0:
                                                return t.trys.push([0, 2, , 3]), [4, nA.Guac.callBehaviour("app-policy")];
                                            case 1:
                                                var r;
                                                return [2, (null == (r = t.sent()) ? void 0 : r.DisableRobloxPlusEntrypoints) === !0];
                                            case 2:
                                                return t.sent(), [2, !1];
                                            case 3:
                                                return [2]
                                        }
                                    })
                                })()]
                            })
                        })().then(function(r) {
                            !t && r && ek(!0)
                        }).catch(function() {}),
                        function() {
                            t = !0
                        }
                }, []);
                var eU = null != eT ? eT : K,
                    eB = void 0 !== eO ? eO : ep,
                    eq = eD || (null == (q = document.querySelector('meta[name="subscription-data"]')) || null == (B = q.dataset) ? void 0 : B.isEnabled) !== "true",
                    ez = null != (V = null == ef || null == (z = ef.eligibleOffers) ? void 0 : z.some(function(t) {
                        return "FreeTrial" === t.offerType
                    })) && V,
                    eV = (0, u.useMemo)(function() {
                        var t, r, n, i, a, o, s;
                        return (null == eB ? void 0 : eB.originalPrice) && eB.originalPrice > eU ? (o = null != (r = eB.originalPrice) ? r : 0, {
                            savedAmount: s = null != (i = null != (n = eB.totalDiscountAmount) ? n : eB.totalAmountSaved) ? i : 0,
                            originalPrice: o,
                            totalPrice: o - s,
                            discountLines: null != (a = null == (t = eB.discounts) ? void 0 : t.map(function(t, r) {
                                var n, i, a, o, s = null != (a = null != (i = t.discountAmount) ? i : t.robuxDiscountAmount) ? a : 0,
                                    l = (null == (n = t.localizedDiscountAttribution) ? void 0 : n.trim()) || void 0,
                                    c = l || t.discountCampaign || "Discount ".concat(r + 1);
                                return {
                                    discountAmount: s,
                                    discountCampaign: t.discountCampaign || t.discountId || "line-".concat(r),
                                    discountType: t.discountType,
                                    label: c,
                                    localizedAttribution: l,
                                    discountPercent: null != (o = t.discountPercentage) ? o : t.robuxDiscountPercentage
                                }
                            })) ? a : []
                        }) : null
                    }, [eB, eU]),
                    eG = (0, u.useRef)(!1);
                (0, u.useEffect)(function() {
                    if (!ey) {
                        eG.current = !1;
                        return
                    }
                    if (!eG.current && eL) {
                        eG.current = !0, I.paymentFlowAnalyticsService.startRobloxPlusUpsellFlow({
                            assetType: Q
                        });
                        var t = ez ? I.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_FREE_TRIAL : I.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_SUBSCRIBE;
                        I.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(I.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_SINGLE_ITEM_PLUS_UPSELL, !1, I.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBLOX_PLUS_UPSELL_BANNER, I.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN, t, e_)
                    }
                }, [ey, eL, Q, ez, e_]);
                var eH = (0, u.useCallback)(function(t) {
                        var r = t ? I.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_FREE_TRIAL : I.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_SUBSCRIBE;
                        I.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(I.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_SINGLE_ITEM_PLUS_UPSELL, !1, I.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBLOX_PLUS_UPSELL_BANNER, I.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, r, e_)
                    }, [e_]),
                    eW = iJ("UnifiedPurchaseModalUpsellSheet", Q, ey).trackUpsellClick,
                    eX = (0, u.useCallback)(function() {
                        eW(), eH(ez)
                    }, [eW, eH, ez]),
                    eK = (0, u.useCallback)(function() {
                        ex(I.paymentFlowAnalyticsService.purchaseFlowUuid), eE(window.location.pathname + window.location.hash), ev(!0), null == ei || ei()
                    }, [ei]),
                    eY = (0, u.useCallback)(function() {
                        return ev(!1)
                    }, []);
                return aM("UnifiedPurchaseModal", ed), (0, o.jsxs)(d().Fragment, {
                    children: [(0, o.jsx)(r0, {
                        open: ed,
                        onOpenChange: function(t) {
                            !t && ei && ei()
                        },
                        isModal: !0,
                        size: "Large",
                        type: "Default",
                        closeLabel: H("Action.Close") || "Close",
                        hasCloseAffordance: !0,
                        children: (0, o.jsxs)(r1, {
                            className: "relative unified-purchase-dialog-content",
                            children: [(0, o.jsxs)(r2, {
                                className: "gap-xlarge flex flex-col",
                                children: [(0, o.jsx)("div", {
                                    style: {
                                        marginTop: 2
                                    },
                                    children: (0, o.jsx)(nw, {
                                        translate: H,
                                        titleText: W,
                                        currentRobuxBalance: Y ? void 0 : es
                                    })
                                }), (0, o.jsx)(aC, {
                                    translate: H,
                                    thumbnail: $,
                                    assetName: J,
                                    expectedPrice: eU,
                                    displayPrice: Y,
                                    priceSuffix: en,
                                    rentalOptionDays: ec,
                                    discountInformation: eB
                                }), eA.map(function(t) {
                                    var r = "purchase-offer-label-".concat(t.offerId);
                                    return (0, o.jsxs)("label", {
                                        htmlFor: "purchase-offer-checkbox-".concat(t.offerId),
                                        className: "flex flex-row items-start gap-x-small self-start cursor-pointer",
                                        children: [(0, o.jsx)(iF, {
                                            id: "purchase-offer-checkbox-".concat(t.offerId),
                                            "aria-labelledby": r,
                                            placement: "Start",
                                            size: "Small",
                                            isChecked: t.selected,
                                            onCheckedChange: function(r) {
                                                eC(t.offerId, !0 === r)
                                            },
                                            isDisabled: eN,
                                            "data-testid": "purchase-promo-checkbox-".concat(t.offerId)
                                        }), (0, o.jsx)(aK, {
                                            id: r,
                                            text: t.localizedText,
                                            className: "text-body-medium content-default"
                                        })]
                                    }, t.offerId)
                                }), eV && eV.savedAmount > 0 && (0, o.jsx)(aJ, {
                                    translate: H,
                                    normalizedDiscount: eV,
                                    savingsSummary: ej
                                })]
                            }), (0, o.jsxs)(r3, {
                                className: "flex flex-col mt-[40px]",
                                children: [(0, o.jsxs)("div", {
                                    className: "gap-small flex flex-col",
                                    children: [(0, o.jsx)("div", {
                                        className: "flex flex-row-reverse",
                                        children: (0, o.jsx)(np, {
                                            variant: "Emphasis",
                                            className: "fill basis-0",
                                            onClick: function() {
                                                return Z(function(t) {
                                                    for (var r = 1; r < arguments.length; r++) {
                                                        var n = null != arguments[r] ? arguments[r] : {},
                                                            i = Object.keys(n);
                                                        "function" == typeof Object.getOwnPropertySymbols && (i = i.concat(Object.getOwnPropertySymbols(n).filter(function(t) {
                                                            return Object.getOwnPropertyDescriptor(n, t).enumerable
                                                        }))), i.forEach(function(r) {
                                                            var i;
                                                            i = n[r], r in t ? Object.defineProperty(t, r, {
                                                                value: i,
                                                                enumerable: !0,
                                                                configurable: !0,
                                                                writable: !0
                                                            }) : t[r] = i
                                                        })
                                                    }
                                                    return t
                                                }({
                                                    purchasePrice: eU
                                                }, eR.length ? {
                                                    offerIds: eR
                                                } : {}))
                                            },
                                            isDisabled: eo || eN,
                                            "data-testid": "purchase-confirm-button",
                                            children: X
                                        })
                                    }), ee && et && (0, o.jsx)("div", {
                                        className: "flex flex-row-reverse",
                                        children: (0, o.jsx)(np, {
                                            variant: "Standard",
                                            className: "fill basis-0",
                                            onClick: ee,
                                            isDisabled: eo,
                                            "data-testid": "purchase-secondary-button",
                                            children: et
                                        })
                                    })]
                                }), !aH(null != (G = null == eV ? void 0 : eV.discountLines) ? G : null) && !eq && (0, o.jsx)(i2, {
                                    translate: H,
                                    assetType: Q,
                                    subscriptionProductInfo: ef,
                                    onBannerClick: eK
                                }), er && (0, o.jsx)("p", {
                                    className: "text-body-small content-default",
                                    style: {
                                        marginTop: 12
                                    },
                                    children: er
                                })]
                            })]
                        })
                    }), ef && !eq && (0, o.jsx)(aR, {
                        translate: H,
                        open: ey,
                        onClose: eY,
                        subscriptionProductInfo: ef,
                        isFreeTrial: ez,
                        upsellUuid: ew,
                        paymentSessionId: eL,
                        redirectUrl: eP,
                        trackSubscriptionButtonClick: eX
                    })]
                })
            }, h);

            function og(t, r) {
                (null == r || r > t.length) && (r = t.length);
                for (var n = 0, i = Array(r); n < r; n++) i[n] = t[n];
                return i
            }

            function ow(t, r) {
                return null != r && "undefined" != typeof Symbol && r[Symbol.hasInstance] ? !!r[Symbol.hasInstance](t) : t instanceof r
            }
            var ox = function(t, r) {
                return (ox = Object.setPrototypeOf || ow({
                    __proto__: []
                }, Array) && function(t, r) {
                    t.__proto__ = r
                } || function(t, r) {
                    for (var n in r) Object.prototype.hasOwnProperty.call(r, n) && (t[n] = r[n])
                })(t, r)
            };

            function oS(t, r) {
                if ("function" != typeof r && null !== r) throw TypeError("Class extends value " + String(r) + " is not a constructor or null");

                function n() {
                    this.constructor = t
                }
                ox(t, r), t.prototype = null === r ? Object.create(r) : (n.prototype = r.prototype, new n)
            }
            var oP = function() {
                return (oP = Object.assign || function(t) {
                    for (var r, n = 1, i = arguments.length; n < i; n++)
                        for (var a in r = arguments[n]) Object.prototype.hasOwnProperty.call(r, a) && (t[a] = r[a]);
                    return t
                }).apply(this, arguments)
            };

            function oE(t, r, n, i) {
                return new(n || (n = Promise))(function(a, o) {
                    function s(t) {
                        try {
                            c(i.next(t))
                        } catch (t) {
                            o(t)
                        }
                    }

                    function l(t) {
                        try {
                            c(i.throw(t))
                        } catch (t) {
                            o(t)
                        }
                    }

                    function c(t) {
                        var r;
                        t.done ? a(t.value) : (ow(r = t.value, n) ? r : new n(function(t) {
                            t(r)
                        })).then(s, l)
                    }
                    c((i = i.apply(t, r || [])).next())
                })
            }

            function oI(t, r) {
                var n, i, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return s.next = l(0), s.throw = l(1), s.return = l(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
                    return this
                }), s;

                function l(l) {
                    return function(c) {
                        var u = [l, c];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; s && (s = 0, u[0] && (o = 0)), o;) try {
                            if (n = 1, i && (a = 2 & u[0] ? i.return : u[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, u[1])).done) return a;
                            switch (i = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                case 0:
                                case 1:
                                    a = u;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, i = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                        o.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && o.label < a[1]) {
                                        o.label = a[1], a = u;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(u);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            u = r.call(t, o)
                        } catch (t) {
                            u = [6, t], i = 0
                        } finally {
                            n = a = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function oA(t, r, n) {
                if (n || 2 == arguments.length)
                    for (var i, a = 0, o = r.length; a < o; a++) !i && a in r || (i || (i = Array.prototype.slice.call(r, 0, a)), i[a] = r[a]);
                return t.concat(i || Array.prototype.slice.call(r))
            }
            "function" == typeof SuppressedError && SuppressedError;
            var oT = {
                    envName: ""
                },
                oO = !1,
                oj = function() {
                    try {
                        if ("undefined" == typeof window) return oP({}, oT);
                        var t = localStorage.getItem("Roblox.MrRouterConfig");
                        if (null == t) return oP({}, oT);
                        var r = JSON.parse(t);
                        if ("object" != (void 0 === r ? "undefined" : r && "undefined" != typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || null === r) return oP({}, oT);
                        var n = oP(oP({}, oT), "envName" in r && "string" == typeof r.envName && {
                            envName: r.envName
                        });
                        return n.envName && !oO && (oO = !0, console.warn('[MrRouter] Routing to non-production environment: "'.concat(n.envName, '"'))), n
                    } catch (t) {
                        return oP({}, oT)
                    }
                },
                oN = "mrrouter-env",
                oR = "tracestate",
                oC = "traceparent",
                oM = function(t) {
                    var r = t.indexOf("=");
                    return (-1 === r ? t : t.slice(0, r)).trim()
                },
                oD = function(t, r) {
                    var n = "".concat(oN, "=").concat(encodeURIComponent(r)),
                        i = null == t ? void 0 : t.trim(),
                        a = i ? i.split(",") : [],
                        o = a.findIndex(function(t) {
                            return oM(t) === oN
                        });
                    if (-1 === o) return oA(oA([], a.map(function(t) {
                        return t.trim()
                    }), !0), [n], !1).join(",");
                    var s = a.filter(function(t) {
                        return oM(t) !== oN
                    }).map(function(t) {
                        return t.trim()
                    });
                    return s.splice(o, 0, n), s.join(",")
                },
                ok = function(t) {
                    var r = new Uint8Array(t);
                    return crypto.getRandomValues(r), Array.from(r, function(t) {
                        return t.toString(16).padStart(2, "0")
                    }).join("")
                },
                oF = "undefined" != typeof crypto && "function" == typeof crypto.randomUUID,
                oL = function() {
                    return oF ? crypto.randomUUID().replaceAll("-", "").slice(0, 32) : ok(16)
                },
                o_ = function() {
                    return oF ? crypto.randomUUID().replaceAll("-", "").slice(0, 16) : ok(8)
                },
                oU = function(t) {
                    var r = oj().envName;
                    if (r.length > 0 && (t[oR] = oD(t[oR], r), !t[oC])) {
                        var n = oL(),
                            i = o_();
                        t[oC] = "00-".concat(n, "-").concat(i, "-01")
                    }
                };

            function oB(t, r) {
                return null != r && "undefined" != typeof Symbol && r[Symbol.hasInstance] ? !!r[Symbol.hasInstance](t) : t instanceof r
            }
            n(964);
            var oq, oz, oV, oG, oH, oW, oX, oK, oY, o$, oJ, oQ, oZ, o0 = function(t) {
                    return t.replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/\d+/, "/number")
                },
                o1 = function(t, r) {
                    return !1 === r.ok && !1 === [401, 403, 404].includes(r.status) && t(Error("Network error"), {
                        tags: {
                            apiUrl: o0(r.url),
                            apiStatus: null == r ? void 0 : r.status,
                            cors: !1
                        }
                    }), r
                },
                o2 = function(t, r) {
                    t(Error("Network error"), {
                        tags: {
                            apiUrl: o0(r),
                            cors: !0
                        }
                    })
                },
                o3 = function() {
                    function t(t) {
                        this.captureException = t
                    }
                    return t.prototype.post = function(t) {
                        return oE(this, void 0, void 0, function() {
                            return oI(this, function(r) {
                                return [2, o1(this.captureException, t.response)]
                            })
                        })
                    }, t.prototype.onError = function(t) {
                        return oE(this, void 0, void 0, function() {
                            return oI(this, function(r) {
                                return o2(this.captureException, t.url), [2]
                            })
                        })
                    }, t
                }(),
                o4 = function(t) {
                    if (document) {
                        var r, n, i = document.getElementById("hba-frame");
                        return null === i && ((r = document.createElement("iframe")).id = "hba-frame", r.style.cssText = "position: fixed; top: 0; left: 0; width: 0%; height: 0%; z-index: -1", r.src = "https://www.".concat(t, "/hba/iframe"), n = r, i = (null == document ? void 0 : document.body) ? document.body.appendChild(n) : null), i
                    }
                    return null
                },
                o6 = function() {
                    var t = window.location.hostname.split(".").slice(0, -2).join(".");
                    return t.includes("create") ? "creator_hub" : t.includes("advertise") ? "ads_manager" : "creator_hub"
                },
                o8 = function(t, r) {
                    try {
                        fetch("https://apis.".concat(t, "/account-security-service/v1/metrics/record"), {
                            method: "POST",
                            body: JSON.stringify({
                                name: "load_time_hba_frame",
                                value: r,
                                labelValues: {
                                    origin_site: o6()
                                }
                            })
                        })
                    } catch (t) {}
                },
                o5 = function(t, r) {
                    try {
                        fetch("https://apis.".concat(t, "/account-security-service/v1/metrics/record"), {
                            method: "POST",
                            body: JSON.stringify({
                                name: "response_time_hba_frame",
                                value: r,
                                labelValues: {
                                    origin_site: o6()
                                }
                            })
                        })
                    } catch (t) {}
                },
                o7 = function(t, r, n) {
                    return void 0 === n && (n = 1500), new Promise(function(i, a) {
                        var o, s, l = performance.now(),
                            c = window.setTimeout(function() {
                                o8(t, performance.now() - l),
                                    function(t) {
                                        try {
                                            fetch("https://apis.".concat(t, "/account-security-service/v1/metrics/record"), {
                                                method: "POST",
                                                body: JSON.stringify({
                                                    name: "event_hba_frame",
                                                    value: 1,
                                                    labelValues: {
                                                        event_type: "FrameLoadTimedOut",
                                                        origin_site: o6()
                                                    }
                                                })
                                            })
                                        } catch (t) {}
                                    }(t), a(Error("Promise timed out after ".concat(n, " ms")))
                            }, n),
                            u = o = function(r) {
                                var n = r.data;
                                r.origin === "https://www.".concat(t) && "dataFromHbaFrame" === n.msg && "loaded" === n.data.type && (window.removeEventListener("message", o, !1), window.clearTimeout(c), o8(t, performance.now() - l), i())
                            };
                        window.addEventListener("message", u, !1), null == (s = r.contentWindow) || s.postMessage({
                            msg: "checkLoadedRequest"
                        }, "https://www.".concat(t))
                    })
                },
                o9 = function(t, r, n, i, a, o, s) {
                    var l;
                    if (void 0 === s && (s = 100), window) {
                        var c, u = performance.now(),
                            d = window.setTimeout(function() {
                                o5(n, performance.now() - u),
                                    function(t) {
                                        try {
                                            fetch("https://apis.".concat(t, "/account-security-service/v1/metrics/record"), {
                                                method: "POST",
                                                body: JSON.stringify({
                                                    name: "event_hba_frame",
                                                    value: 1,
                                                    labelValues: {
                                                        event_type: "FrameResponseTimedOut",
                                                        origin_site: o6()
                                                    }
                                                })
                                            })
                                        } catch (t) {}
                                    }(n), t({
                                        url: a.url,
                                        init: a.init
                                    })
                            }, s),
                            f = c = function(r) {
                                var i = r.data,
                                    s = a.url,
                                    l = a.init;
                                if (r.origin === "https://www.".concat(n) && "dataFromHbaFrame" === i.msg && "batHeader" === i.data.type && (!i.data.identifier || i.data.identifier === o))
                                    if (!i.data.isError && i.data.batHeader) {
                                        window.clearTimeout(d), window.removeEventListener("message", c, !1), o5(n, performance.now() - u);
                                        var f = i.data.batHeader;
                                        t({
                                            url: s,
                                            init: oP(oP({}, l), {
                                                headers: oP(oP({}, l.headers), {
                                                    "x-bound-auth-token": f["x-bound-auth-token"]
                                                })
                                            })
                                        })
                                    } else window.clearTimeout(d), window.removeEventListener("message", c, !1), o5(n, performance.now() - u), t({
                                        url: s,
                                        init: l
                                    })
                            };
                        window.addEventListener("message", f, !1), null == (l = i.contentWindow) || l.postMessage({
                            msg: "signSubdomainRequest",
                            identifier: o,
                            serializedSubdomainRequestData: JSON.stringify({
                                url: a.url,
                                requestInit: a.init
                            })
                        }, "https://www.".concat(n))
                    }
                },
                se = function() {
                    return crypto.randomUUID()
                },
                st = function() {
                    function t(t, r, n) {
                        void 0 === r && (r = 1500), void 0 === n && (n = 100), this.robloxSiteDomain = t, this.hbaFrameAlreadyLoaded = !1, this.hbaFrameLoadFailed = !1, this.hbaFrame = null, this.loadTimeOut = r, this.dataTimeOut = n
                    }
                    return t.prototype.getOrCreateHbaFrame = function() {
                        return o4(this.robloxSiteDomain)
                    }, t.prototype.pre = function(t) {
                        var r = this;
                        return new Promise(function(n, i) {
                            var a = t.url,
                                o = t.init;
                            if (r.hbaFrame = r.getOrCreateHbaFrame(), null !== r.hbaFrame) {
                                var s = se();
                                r.hbaFrameAlreadyLoaded ? o9(n, 0, r.robloxSiteDomain, r.hbaFrame, t, s, r.dataTimeOut) : r.hbaFrameLoadFailed ? n({
                                    url: a,
                                    init: o
                                }) : o7(r.robloxSiteDomain, r.hbaFrame, r.loadTimeOut).then(function() {
                                    r.hbaFrame ? (r.hbaFrameAlreadyLoaded = !0, o9(n, 0, r.robloxSiteDomain, r.hbaFrame, t, s, r.dataTimeOut)) : n({
                                        url: a,
                                        init: o
                                    })
                                }).catch(function() {
                                    r.hbaFrameLoadFailed = !0, n({
                                        url: a,
                                        init: o
                                    })
                                })
                            } else n({
                                url: a,
                                init: o
                            })
                        })
                    }, t
                }();
            (t = oZ || (oZ = {})).UNKNOWN = "unknown", t.INVALIDATED = "invalidated", t.ABANDONED = "abandoned", t.LOADFAILED = "loadfailed";
            var sr = function(t) {
                    function r(r) {
                        var n = t.call(this, "challenge error for challenge kind ".concat(r.kind)) || this;
                        return n.parameters = r, n
                    }
                    return oS(r, t), r.prototype.match = function(t) {
                        return this.parameters.kind === t.parameters.kind && JSON.stringify(this.parameters.data) === JSON.stringify(t.parameters.data)
                    }, r.prototype.matchAbandoned = function(t) {
                        return this.match(t) && t.parameters.kind === oZ.ABANDONED
                    }, r
                }(Error),
                sn = "rblx-challenge-id",
                si = "rblx-challenge-type",
                sa = "rblx-challenge-metadata",
                so = function(t, r) {
                    return 403 === t.status && t.headers.has(sn) && t.headers.has(si) && t.headers.has(sa) && "iframe" === r
                },
                ss = function(t) {
                    var r, n, i, a, o, s, l, c, u, d = t.url,
                        f = t.request,
                        p = t.response,
                        m = t.robloxSiteDomain,
                        h = (o = new URLSearchParams([
                            ["challenge-type", "generic"],
                            ["dark-mode", "true"],
                            ["barista-mode", "true"],
                            ["generic-challenge-type", null != (r = p.headers.get(si)) ? r : ""],
                            ["generic-challenge-id", null != (n = p.headers.get(sn)) ? n : ""],
                            ["challenge-metadata-json", null != (i = p.headers.get(sa)) ? i : ""],
                            ["origin", null != (a = window.location.hostname.split(".").slice(0, -2).join(".")) ? a : ""]
                        ]), s = new URL("https://www.".concat(m, "/challenge/cdn/hybrid?").concat(o.toString())), (l = document.createElement("iframe")).id = "challenge-frame", l.allowFullscreen = !0, l.setAttribute("allowtransparency", "true"), l.setAttribute("allow", "publickey-credentials-get;publickey-credentials-create"), l.style.cssText = "position: fixed; top: 0; left: 0; width: 100%; height: 100%; visibility: hidden; color-scheme: normal; border: none; z-index: 2147483647;", l.src = s.toString(), l.onload = function() {
                            l.style.visibility = "visible"
                        }, c = l, document && document.body ? document.body.appendChild(c) : null);
                    return new Promise(function(t, r) {
                        window && h && (u = function(n) {
                            var i, a, o, s, l, c, u, m, h, b, y;
                            if (n.data && n.data.genericChallengeResponse) switch (n.data.genericChallengeResponse.type) {
                                case "challengeAbandoned":
                                    r(new sr({
                                        kind: oZ.ABANDONED,
                                        data: {
                                            challengeType: null != (i = p.headers.get(si)) ? i : ""
                                        }
                                    }));
                                    break;
                                case "challengeDisplayed":
                                    break;
                                case "challengeCompleted":
                                    (u = n.data.genericChallengeResponse.data).challengeType && u.metadata ? t((m = u.metadata, fetch(d, oP(oP({}, f), {
                                        headers: oP(oP({}, f.headers), ((h = {})[sn] = null != (b = p.headers.get(sn)) ? b : "", h[sa] = btoa(JSON.stringify(m)), h[si] = null != (y = p.headers.get(si)) ? y : "", h))
                                    })))) : r(new sr({
                                        kind: oZ.UNKNOWN,
                                        data: {
                                            challengeType: null != (a = p.headers.get(si)) ? a : ""
                                        }
                                    }));
                                    break;
                                case "challengeInvalidated":
                                    r((u = n.data.genericChallengeResponse.data) && u.challengeType && u.metadata ? new sr({
                                        kind: oZ.INVALIDATED,
                                        data: u
                                    }) : new sr({
                                        kind: oZ.INVALIDATED,
                                        data: {
                                            challengeType: null != (o = p.headers.get(si)) ? o : ""
                                        }
                                    }));
                                    break;
                                case "challengeParsed":
                                    !1 === (u = n.data.genericChallengeResponse.data).parsed && r(new sr({
                                        kind: oZ.UNKNOWN,
                                        data: {
                                            challengeType: null != (s = p.headers.get(si)) ? s : ""
                                        }
                                    }));
                                    break;
                                case "challengeInitialized":
                                    !1 === (u = n.data.genericChallengeResponse.data).initialized && r(new sr({
                                        kind: oZ.UNKNOWN,
                                        data: {
                                            challengeType: null != (l = p.headers.get(si)) ? l : ""
                                        }
                                    }));
                                    break;
                                case "challengePageLoaded":
                                    !1 === (u = n.data.genericChallengeResponse.data).pageLoaded && r(new sr({
                                        kind: oZ.LOADFAILED,
                                        data: {
                                            challengeType: null != (c = p.headers.get(si)) ? c : ""
                                        }
                                    }))
                            }
                        }, window.addEventListener("message", u, !1))
                    }).finally(function() {
                        null == h || h.remove(), u && window.removeEventListener("message", u, !1)
                    })
                },
                sl = function() {
                    function t(t, r) {
                        void 0 === r && (r = "iframe"), this.robloxSiteDomain = t, this.genericChallengeMiddlewareType = r
                    }
                    return t.prototype.post = function(t) {
                        var r = t.url,
                            n = t.init,
                            i = t.response;
                        return so(i, this.genericChallengeMiddlewareType) ? ss({
                            url: r,
                            request: n,
                            response: i,
                            robloxSiteDomain: this.robloxSiteDomain
                        }) : Promise.resolve(i)
                    }, t
                }(),
                sc = function(t) {
                    var r = t.elapsedTime,
                        n = t.url,
                        i = t.status,
                        a = t.schemaPath;
                    return {
                        eventName: "apiVitals",
                        parameters: {
                            elapsedTime: String(r),
                            apiUrl: n,
                            statusCode: String(i),
                            schemaPath: a
                        }
                    }
                },
                su = function() {
                    function t(t) {
                        this.unifiedLogger = t
                    }
                    return t.prototype.post = function(t) {
                        return this.unifiedLogger.logApiVitalsEvent(sc({
                            elapsedTime: t.elapsedTime,
                            url: t.url,
                            status: t.response.status,
                            schemaPath: t.schemaPath
                        })), Promise.resolve(t.response)
                    }, t
                }(),
                sd = "x-csrf-token",
                sf = ["POST", "PATCH", "DELETE", "PUT"],
                sp = function() {
                    var t, r = "";
                    try {
                        "undefined" != typeof window && (r = null != (t = localStorage.getItem(sd)) ? t : "")
                    } catch (t) {
                        console.warn("Error reading localStorage key “".concat(sd, "”:"), t)
                    }
                    return r
                },
                sm = sp(),
                sh = function(t) {
                    try {
                        sm = t, "undefined" != typeof window && localStorage.setItem(sd, t)
                    } catch (t) {
                        console.warn("Error setting localStorage key “".concat(sd, "”:"), t)
                    }
                },
                sb = function() {
                    function t() {
                        this.currentToken = sp()
                    }
                    return t.prototype.pre = function(t) {
                        var r, n = t.url,
                            i = t.init,
                            a = this.currentToken;
                        return i.headers && "object" == ((r = i.headers) && "undefined" != typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) && sd in i.headers && (a = i.headers[sd]) && (this.currentToken = a, sh(a)), i.method && sf.includes(i.method) ? Promise.resolve({
                            url: n,
                            init: this.prepareRequestInit(i)
                        }) : Promise.resolve({
                            url: n,
                            init: i
                        })
                    }, t.prototype.post = function(t) {
                        var r = t.fetch,
                            n = t.url,
                            i = t.init,
                            a = t.response,
                            o = a.headers.get(sd);
                        return 403 === a.status && a.headers.has(sd) && null !== o ? (this.currentToken = o, sh(o), r(n, this.prepareRequestInit(i))) : Promise.resolve(a)
                    }, t.prototype.prepareRequestInit = function(t) {
                        var r;
                        return oP(oP({}, t), {
                            headers: oP(oP({}, t.headers), ((r = {})[sd] = this.currentToken, r))
                        })
                    }, t
                }(),
                sy = [],
                sv = function(t) {
                    sy = sy.filter(function(r) {
                        return r !== t
                    })
                },
                sg = function(t) {
                    var r = t.url;
                    503 === t.status && sy.forEach(function(t) {
                        return t(r)
                    })
                },
                sw = function() {
                    function t() {}
                    return t.prototype.subscribe = function(t) {
                        return sy.push(t),
                            function() {
                                return sv(t)
                            }
                    }, t.prototype.unsubscribe = function(t) {
                        return sv(t)
                    }, t.prototype.post = function(t) {
                        var r = t.response;
                        return sg(r), Promise.resolve(r)
                    }, t
                }(),
                sx = function() {
                    function t() {}
                    return t.prototype.pre = function(t) {
                        var r = t.url,
                            n = t.init;
                        if (!oj().envName) return Promise.resolve({
                            url: r,
                            init: n
                        });
                        var i = oP({}, n.headers);
                        return oU(i), Promise.resolve({
                            url: r,
                            init: oP(oP({}, n), {
                                headers: i
                            })
                        })
                    }, t
                }(),
                sS = new sb,
                sP = new sw,
                sE = [function(t) {
                    return t.captureException ? new o3(t.captureException) : void 0
                }, function(t) {
                    return t.robloxSiteDomain && t.enableBoundAuthToken ? new st(t.robloxSiteDomain, t.boundAuthTokenLoadTimeout, t.boundAuthTokenDataTimeout) : void 0
                }, function(t) {
                    return t.robloxSiteDomain ? new sl(t.robloxSiteDomain, t.genericChallengeMiddlewareType) : void 0
                }, function(t) {
                    return t.unifiedLogger ? new su(t.unifiedLogger) : void 0
                }, function() {
                    return sS
                }, function() {
                    return sP
                }, function(t) {
                    return t.enableMrRouter ? new sx : void 0
                }],
                sI = function() {
                    function t(t) {
                        void 0 === t && (t = {}), this.configuration = t
                    }
                    return Object.defineProperty(t.prototype, "config", {
                        set: function(t) {
                            this.configuration = t
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(t.prototype, "basePath", {
                        get: function() {
                            return this.configuration.basePath
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(t.prototype, "fetchApi", {
                        get: function() {
                            return this.configuration.fetchApi || window.fetch.bind(window)
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(t.prototype, "middleware", {
                        get: function() {
                            return this.configuration.middleware || []
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(t.prototype, "queryParamsStringify", {
                        get: function() {
                            return this.configuration.queryParamsStringify || function t(r, n) {
                                return void 0 === n && (n = ""), Object.keys(r).map(function(i) {
                                    return function r(n, i, a) {
                                        void 0 === a && (a = "");
                                        var o = a + (a.length ? "[".concat(n, "]") : n);
                                        if (oB(i, Array)) {
                                            var s = i.map(function(t) {
                                                return encodeURIComponent(String(t))
                                            }).join("&".concat(encodeURIComponent(o), "="));
                                            return "".concat(encodeURIComponent(o), "=").concat(s)
                                        }
                                        return oB(i, Set) ? r(n, Array.from(i), a) : oB(i, Date) ? "".concat(encodeURIComponent(o), "=").concat(encodeURIComponent(i.toISOString())) : oB(i, Object) ? t(i, o) : "".concat(encodeURIComponent(o), "=").concat(encodeURIComponent(String(i)))
                                    }(i, r[i], n)
                                }).filter(function(t) {
                                    return t.length > 0
                                }).join("&")
                            }
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(t.prototype, "username", {
                        get: function() {
                            return this.configuration.username
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(t.prototype, "password", {
                        get: function() {
                            return this.configuration.password
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(t.prototype, "apiKey", {
                        get: function() {
                            var t = this.configuration.apiKey;
                            if (t) return "function" == typeof t ? t : function() {
                                return t
                            }
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(t.prototype, "accessToken", {
                        get: function() {
                            var t = this,
                                r = this.configuration.accessToken;
                            if (r) return "function" == typeof r ? r : function() {
                                return oE(t, void 0, void 0, function() {
                                    return oI(this, function(t) {
                                        return [2, r]
                                    })
                                })
                            }
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(t.prototype, "headers", {
                        get: function() {
                            return this.configuration.headers
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(t.prototype, "credentials", {
                        get: function() {
                            return this.configuration.credentials
                        },
                        enumerable: !1,
                        configurable: !0
                    }), t
                }(),
                sA = new sI,
                sT = function() {
                    function t(t) {
                        void 0 === t && (t = sA);
                        var r = this;
                        this.configuration = t, this.fetchApi = function(t, n, i) {
                            return oE(r, void 0, void 0, function() {
                                var r, a, o, s, l, c, u, d, f, p, m, h, b, y = this;
                                return oI(this, function(v) {
                                    switch (v.label) {
                                        case 0:
                                            r = function(t, r) {
                                                return y.fetchApi(t, r, i)
                                            }, a = {
                                                url: t,
                                                init: n
                                            }, o = 0, s = this.middleware, v.label = 1;
                                        case 1:
                                            return o < s.length ? (b = s[o]).pre ? [4, b.pre(oP({
                                                fetch: r
                                            }, a))] : [3, 3] : [3, 4];
                                        case 2:
                                            a = v.sent() || a, v.label = 3;
                                        case 3:
                                            return o++, [3, 1];
                                        case 4:
                                            l = void 0, c = performance.now(), v.label = 5;
                                        case 5:
                                            return v.trys.push([5, 7, , 12]), [4, (this.configuration.fetchApi || fetch)(a.url, a.init)];
                                        case 6:
                                            return l = v.sent(), u = performance.now(), [3, 12];
                                        case 7:
                                            d = v.sent(), u = performance.now(), f = 0, p = this.middleware, v.label = 8;
                                        case 8:
                                            return f < p.length ? (b = p[f]).onError ? [4, b.onError({
                                                fetch: r,
                                                url: a.url,
                                                init: a.init,
                                                error: d,
                                                response: l ? l.clone() : void 0
                                            })] : [3, 10] : [3, 11];
                                        case 9:
                                            l = v.sent() || l, v.label = 10;
                                        case 10:
                                            return f++, [3, 8];
                                        case 11:
                                            if (void 0 === l) throw oB(d, Error) ? new sj(d, "The request failed and the interceptors did not return an alternative response") : d;
                                            return [3, 12];
                                        case 12:
                                            m = 0, h = this.middleware, v.label = 13;
                                        case 13:
                                            return m < h.length ? (b = h[m]).post ? [4, b.post({
                                                fetch: r,
                                                url: a.url,
                                                init: a.init,
                                                response: l.clone(),
                                                elapsedTime: u - c,
                                                schemaPath: i
                                            })] : [3, 15] : [3, 16];
                                        case 14:
                                            l = v.sent() || l, v.label = 15;
                                        case 15:
                                            return m++, [3, 13];
                                        case 16:
                                            return [2, l]
                                    }
                                })
                            })
                        }, this.middleware = t.middleware
                    }
                    return t.prototype.withMiddleware = function() {
                        for (var t, r = [], n = 0; n < arguments.length; n++) r[n] = arguments[n];
                        var i = this.clone();
                        return i.middleware = (t = i.middleware).concat.apply(t, r), i
                    }, t.prototype.withPreMiddleware = function() {
                        for (var t = [], r = 0; r < arguments.length; r++) t[r] = arguments[r];
                        var n = t.map(function(t) {
                            return {
                                pre: t
                            }
                        });
                        return this.withMiddleware.apply(this, n)
                    }, t.prototype.withPostMiddleware = function() {
                        for (var t = [], r = 0; r < arguments.length; r++) t[r] = arguments[r];
                        var n = t.map(function(t) {
                            return {
                                post: t
                            }
                        });
                        return this.withMiddleware.apply(this, n)
                    }, t.prototype.isJsonMime = function(r) {
                        return !!r && t.jsonRegex.test(r)
                    }, t.prototype.request = function(t, r) {
                        return oE(this, void 0, void 0, function() {
                            var n, i, a, o;
                            return oI(this, function(s) {
                                switch (s.label) {
                                    case 0:
                                        return [4, this.createFetchParams(t, r)];
                                    case 1:
                                        return i = (n = s.sent()).url, a = n.init, [4, this.fetchApi(i, a, t.schemaPath)];
                                    case 2:
                                        if ((o = s.sent()) && o.status >= 200 && o.status < 300) return [2, o];
                                        throw new sO(o, "Response from ".concat(o.url, " returned an error code ").concat(o.status))
                                }
                            })
                        })
                    }, t.prototype.createFetchParams = function(t, r) {
                        return oE(this, void 0, void 0, function() {
                            var n, i, a, o, s, l, c, u = this;
                            return oI(this, function(d) {
                                var f, p;
                                switch (d.label) {
                                    case 0:
                                        return n = this.configuration.basePath + t.path, void 0 !== t.query && 0 !== Object.keys(t.query).length && (n += "?" + this.configuration.queryParamsStringify(t.query)), Object.keys(i = Object.assign({}, this.configuration.headers, t.headers)).forEach(function(t) {
                                            return void 0 === i[t] ? delete i[t] : {}
                                        }), a = "function" == typeof r ? r : function() {
                                            return oE(u, void 0, void 0, function() {
                                                return oI(this, function(t) {
                                                    return [2, r]
                                                })
                                            })
                                        }, o = {
                                            method: t.method,
                                            headers: i,
                                            body: t.body,
                                            credentials: this.configuration.credentials
                                        }, l = [oP({}, o)], [4, a({
                                            init: o,
                                            context: t
                                        })];
                                    case 1:
                                        return s = oP.apply(void 0, l.concat([d.sent()])), c = oP(oP({}, s), {
                                            body: (f = s.body, "undefined" != typeof FormData && oB(f, FormData) || oB(s.body, URLSearchParams) || (p = s.body, "undefined" != typeof Blob && oB(p, Blob)) ? s.body : JSON.stringify(s.body))
                                        }), [2, {
                                            url: n,
                                            init: c
                                        }]
                                }
                            })
                        })
                    }, t.prototype.clone = function() {
                        var t = new(0, this.constructor)(this.configuration);
                        return t.middleware = this.middleware.slice(), t
                    }, t.jsonRegex = RegExp("^(:?application/json|[^;/ 	]+/[^;/ 	]+[+]json)[ 	]*(:?;.*)?$", "i"), t
                }(),
                sO = function(t) {
                    function r(r, n) {
                        var i = t.call(this, n) || this;
                        return i.response = r, i.name = "ResponseError", i
                    }
                    return oS(r, t), r
                }(Error),
                sj = function(t) {
                    function r(r, n) {
                        var i = t.call(this, n) || this;
                        return i.cause = r, i.name = "FetchError", i
                    }
                    return oS(r, t), r
                }(Error),
                sN = function(t) {
                    function r(r, n) {
                        var i = t.call(this, n) || this;
                        return i.field = r, i.name = "RequiredError", i
                    }
                    return oS(r, t), r
                }(Error);

            function sR(t, r) {
                return null != t[r]
            }
            var sC = function() {
                    function t(t, r) {
                        void 0 === r && (r = function(t) {
                            return t
                        }), this.raw = t, this.transformer = r
                    }
                    return t.prototype.value = function() {
                        return oE(this, void 0, void 0, function() {
                            var t;
                            return oI(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return t = this.transformer, [4, this.raw.json()];
                                    case 1:
                                        return [2, t.apply(this, [r.sent()])]
                                }
                            })
                        })
                    }, t
                }(),
                sM = ((function(t) {
                    this.raw = t
                }).prototype.value = function() {
                    return oE(this, void 0, void 0, function() {
                        return oI(this, function(t) {
                            return [2, void 0]
                        })
                    })
                }, (function(t) {
                    this.raw = t
                }).prototype.value = function() {
                    return oE(this, void 0, void 0, function() {
                        return oI(this, function(t) {
                            switch (t.label) {
                                case 0:
                                    return [4, this.raw.blob()];
                                case 1:
                                    return [2, t.sent()]
                            }
                        })
                    })
                }, (function(t) {
                    this.raw = t
                }).prototype.value = function() {
                    return oE(this, void 0, void 0, function() {
                        return oI(this, function(t) {
                            switch (t.label) {
                                case 0:
                                    return [4, this.raw.text()];
                                case 1:
                                    return [2, t.sent()]
                            }
                        })
                    })
                }, function(t) {
                    function r(r) {
                        void 0 === r && (r = {});
                        var n, i = oP({}, r),
                            a = i.middleware || [];
                        return a.unshift.apply(a, (n = r, sE.map(function(t) {
                            return t(n)
                        }).filter(function(t) {
                            return t
                        }))), i.middleware = a, t.call(this, i) || this
                    }
                    return oS(r, t), r
                }(sI));

            function sD(t, r) {
                return null != r && "undefined" != typeof Symbol && r[Symbol.hasInstance] ? !!r[Symbol.hasInstance](t) : t instanceof r
            }
            var sk = function(t, r) {
                return (sk = Object.setPrototypeOf || sD({
                    __proto__: []
                }, Array) && function(t, r) {
                    t.__proto__ = r
                } || function(t, r) {
                    for (var n in r) Object.prototype.hasOwnProperty.call(r, n) && (t[n] = r[n])
                })(t, r)
            };

            function sF(t, r, n, i) {
                return new(n || (n = Promise))(function(a, o) {
                    function s(t) {
                        try {
                            c(i.next(t))
                        } catch (t) {
                            o(t)
                        }
                    }

                    function l(t) {
                        try {
                            c(i.throw(t))
                        } catch (t) {
                            o(t)
                        }
                    }

                    function c(t) {
                        var r;
                        t.done ? a(t.value) : (sD(r = t.value, n) ? r : new n(function(t) {
                            t(r)
                        })).then(s, l)
                    }
                    c((i = i.apply(t, r || [])).next())
                })
            }

            function sL(t, r) {
                var n, i, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return s.next = l(0), s.throw = l(1), s.return = l(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
                    return this
                }), s;

                function l(l) {
                    return function(c) {
                        var u = [l, c];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; s && (s = 0, u[0] && (o = 0)), o;) try {
                            if (n = 1, i && (a = 2 & u[0] ? i.return : u[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, u[1])).done) return a;
                            switch (i = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                case 0:
                                case 1:
                                    a = u;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, i = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                        o.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && o.label < a[1]) {
                                        o.label = a[1], a = u;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(u);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            u = r.call(t, o)
                        } catch (t) {
                            u = [6, t], i = 0
                        } finally {
                            n = a = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function s_(t) {
                return t
            }
            "function" == typeof SuppressedError && SuppressedError;

            function sU(t, r) {
                return null == t ? t : {
                    currencyCode: t.currencyCode,
                    units: t.units,
                    nanos: t.nanos
                }
            }

            function sB(t) {
                return t
            }

            function sq(t) {
                var r, n;
                return null == (r = t) ? r : {
                    offerType: sR(r, "offerType") ? r.offerType : void 0,
                    freeTrialOffer: sR(r, "freeTrialOffer") ? null == (n = r.freeTrialOffer) ? n : {
                        periodType: n.periodType,
                        duration: n.duration,
                        estimatedTrialEndDate: sR(n, "estimatedTrialEndDate") ? null === n.estimatedTrialEndDate ? null : new Date(n.estimatedTrialEndDate) : void 0
                    } : void 0
                }
            }

            function sz(t) {
                var r;
                return null == (r = t) ? r : {
                    type: r.type,
                    id: r.id
                }
            }

            function sV(t) {
                var r;
                return null == (r = t) ? r : {
                    tierId: r.tierId,
                    periodIndex: r.periodIndex,
                    discountPercent: r.discountPercent
                }
            }

            function sG(t) {
                var r, n, i, a, o, s, l;
                return null == (r = t) ? r : {
                    productKey: sz(r.productKey),
                    periodType: r.periodType,
                    periodCount: r.periodCount,
                    localizedPrice: sU(r.localizedPrice),
                    localizedPriceDisplayString: r.localizedPriceDisplayString,
                    localizedStrikethroughPrice: sU(r.localizedStrikethroughPrice),
                    localizedStrikethroughPriceDisplayString: r.localizedStrikethroughPriceDisplayString,
                    productTypeDetails: null == (n = r.productTypeDetails) ? n : {
                        currencySubscriptionProductDetails: sR(n, "currencySubscriptionProductDetails") ? null == (i = n.currencySubscriptionProductDetails) ? i : {
                            currencyType: i.currencyType,
                            entitledAmountMicros: i.entitledAmountMicros
                        } : void 0,
                        developerSubscriptionProductDetails: sR(n, "developerSubscriptionProductDetails") ? null == (a = n.developerSubscriptionProductDetails) ? a : {
                            universeId: a.universeId,
                            imageAssetId: a.imageAssetId,
                            localizedName: a.localizedName,
                            localizedDescription: a.localizedDescription
                        } : void 0,
                        robloxSubscriptionProductDetails: sR(n, "robloxSubscriptionProductDetails") ? null == (o = n.robloxSubscriptionProductDetails) ? o : {
                            featureConfig: null == (s = o.featureConfig) ? s : {
                                virtualTransactionDiscounts: null === s.virtualTransactionDiscounts ? null : s.virtualTransactionDiscounts.map(sV),
                                isRobuxTransferEnabled: s.isRobuxTransferEnabled,
                                isTradingEnabled: s.isTradingEnabled,
                                isUgcPublishingEnabled: s.isUgcPublishingEnabled,
                                privateServerDiscounts: null === s.privateServerDiscounts ? null : s.privateServerDiscounts.map(sV),
                                currencySubscriptionConfig: null == (l = s.currencySubscriptionConfig) ? l : {
                                    currencyType: l.currencyType,
                                    entitledAmountMicros: l.entitledAmountMicros
                                }
                            }
                        } : void 0
                    },
                    eligibleOffers: r.eligibleOffers.map(sq)
                }
            }

            function sH(t) {
                var r, n, i, a, o, s, l;
                return null == (r = t) ? r : {
                    productKey: sz(r.productKey),
                    periodType: r.periodType,
                    displayPrice: sU(r.displayPrice),
                    activationTimestampMs: r.activationTimestampMs,
                    expirationTimestampMs: r.expirationTimestampMs,
                    nextRenewalTimestampMs: r.nextRenewalTimestampMs,
                    paymentProvider: sB(r.paymentProvider),
                    purchasePlatform: r.purchasePlatform,
                    paymentProfile: null == (n = r.paymentProfile) ? n : {
                        id: n.id,
                        cardInfo: null == (i = n.cardInfo) ? i : {
                            cardNetwork: i.cardNetwork,
                            lastFourDigits: i.lastFourDigits,
                            expirationMonth: i.expirationMonth,
                            expirationYear: i.expirationYear
                        }
                    },
                    activeOffers: r.activeOffers.map(sq),
                    productTypeMembershipDetails: null == (a = r.productTypeMembershipDetails) ? a : {
                        robloxSubscriptionMembershipDetails: sR(a, "robloxSubscriptionMembershipDetails") ? null == (o = a.robloxSubscriptionMembershipDetails) ? o : {
                            features: null == (s = o.features) ? s : {
                                productType: s.productType,
                                virtualTransactionDiscountTierId: s.virtualTransactionDiscountTierId,
                                isRobuxTransferEnabled: s.isRobuxTransferEnabled,
                                isTradingEnabled: s.isTradingEnabled,
                                isUgcPublishingEnabled: s.isUgcPublishingEnabled,
                                privateServerDiscountTierId: s.privateServerDiscountTierId
                            },
                            currencySubscriptionBenefit: null == (l = o.currencySubscriptionBenefit) ? l : {
                                currencyType: l.currencyType,
                                entitledAmountMicrosPerGrantingPeriod: l.entitledAmountMicrosPerGrantingPeriod,
                                grantingPeriodType: l.grantingPeriodType
                            }
                        } : void 0
                    },
                    productInfo: sG(r.productInfo)
                }
            }
            var sW = function(t) {
                    function r() {
                        return null !== t && t.apply(this, arguments) || this
                    }
                    return function(t, r) {
                        if ("function" != typeof r && null !== r) throw TypeError("Class extends value " + String(r) + " is not a constructor or null");

                        function n() {
                            this.constructor = t
                        }
                        sk(t, r), t.prototype = null === r ? Object.create(r) : (n.prototype = r.prototype, new n)
                    }(r, t), r.prototype.subscriptionsV2GetProductDisplayPriceRaw = function(t, r) {
                        return sF(this, void 0, void 0, function() {
                            var n, i;
                            return sL(this, function(a) {
                                switch (a.label) {
                                    case 0:
                                        if (null === t.subscriptionProductType || void 0 === t.subscriptionProductType) throw new sN("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetProductDisplayPrice.");
                                        if (null === t.subscriptionProductId || void 0 === t.subscriptionProductId) throw new sN("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetProductDisplayPrice.");
                                        return n = {}, i = {}, void 0 !== t.robloxPlaceId && null !== t.robloxPlaceId && (i["Roblox-Place-Id"] = String(t.robloxPlaceId)), [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/display-price".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(t.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(t.subscriptionProductId))),
                                            method: "GET",
                                            headers: i,
                                            query: n
                                        }, r)];
                                    case 1:
                                        return [2, new sC(a.sent(), function(t) {
                                            return null == t ? t : {
                                                displayPrice: sU(t.displayPrice)
                                            }
                                        })]
                                }
                            })
                        })
                    }, r.prototype.subscriptionsV2GetProductDisplayPrice = function(t, r) {
                        return sF(this, void 0, void 0, function() {
                            return sL(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2GetProductDisplayPriceRaw(t, r)];
                                    case 1:
                                        return [4, n.sent().value()];
                                    case 2:
                                        return [2, n.sent()]
                                }
                            })
                        })
                    }, r.prototype.subscriptionsV2GetProductPaymentMetadataRaw = function(t, r) {
                        return sF(this, void 0, void 0, function() {
                            var n, i;
                            return sL(this, function(a) {
                                switch (a.label) {
                                    case 0:
                                        if (null === t.subscriptionProductType || void 0 === t.subscriptionProductType) throw new sN("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetProductPaymentMetadata.");
                                        if (null === t.subscriptionProductId || void 0 === t.subscriptionProductId) throw new sN("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetProductPaymentMetadata.");
                                        return n = {}, i = {}, [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/payment-metadata".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(t.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(t.subscriptionProductId))),
                                            method: "GET",
                                            headers: i,
                                            query: n
                                        }, r)];
                                    case 1:
                                        return [2, new sC(a.sent(), function(t) {
                                            return null == t ? t : {
                                                paymentMethods: t.paymentMethods.map(s_),
                                                paymentProviders: t.paymentProviders.map(sB)
                                            }
                                        })]
                                }
                            })
                        })
                    }, r.prototype.subscriptionsV2GetProductPaymentMetadata = function(t, r) {
                        return sF(this, void 0, void 0, function() {
                            return sL(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2GetProductPaymentMetadataRaw(t, r)];
                                    case 1:
                                        return [4, n.sent().value()];
                                    case 2:
                                        return [2, n.sent()]
                                }
                            })
                        })
                    }, r.prototype.subscriptionsV2GetSubscriptionProductInfoRaw = function(t, r) {
                        return sF(this, void 0, void 0, function() {
                            var n, i;
                            return sL(this, function(a) {
                                switch (a.label) {
                                    case 0:
                                        if (null === t.subscriptionProductType || void 0 === t.subscriptionProductType) throw new sN("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetSubscriptionProductInfo.");
                                        if (null === t.subscriptionProductId || void 0 === t.subscriptionProductId) throw new sN("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetSubscriptionProductInfo.");
                                        return n = {}, i = {}, [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(t.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(t.subscriptionProductId))),
                                            method: "GET",
                                            headers: i,
                                            query: n
                                        }, r)];
                                    case 1:
                                        return [2, new sC(a.sent(), function(t) {
                                            return null == t ? t : {
                                                subscriptionProductInfo: sG(t.subscriptionProductInfo)
                                            }
                                        })]
                                }
                            })
                        })
                    }, r.prototype.subscriptionsV2GetSubscriptionProductInfo = function(t, r) {
                        return sF(this, void 0, void 0, function() {
                            return sL(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2GetSubscriptionProductInfoRaw(t, r)];
                                    case 1:
                                        return [4, n.sent().value()];
                                    case 2:
                                        return [2, n.sent()]
                                }
                            })
                        })
                    }, r.prototype.subscriptionsV2ListAvailableSubscriptionProductsRaw = function(t, r) {
                        return sF(this, void 0, void 0, function() {
                            var n, i;
                            return sL(this, function(a) {
                                switch (a.label) {
                                    case 0:
                                        return n = {}, void 0 !== t.productType && (n.ProductType = t.productType), void 0 !== t.includePurchased && (n.IncludePurchased = t.includePurchased), void 0 !== t.includeBundles && (n.IncludeBundles = t.includeBundles), void 0 !== t.purchasePlatform && (n.PurchasePlatform = t.purchasePlatform), void 0 !== t.skipEligibilityCheck && (n.SkipEligibilityCheck = t.skipEligibilityCheck), void 0 !== t.grantType && (n.GrantType = t.grantType), void 0 !== t.paymentProvider && (n.PaymentProvider = t.paymentProvider), i = {}, [4, this.request({
                                            path: "/v2/products",
                                            method: "GET",
                                            headers: i,
                                            query: n
                                        }, r)];
                                    case 1:
                                        return [2, new sC(a.sent(), function(t) {
                                            return null == t ? t : {
                                                productKeys: t.productKeys.map(sz),
                                                products: t.products.map(sG)
                                            }
                                        })]
                                }
                            })
                        })
                    }, r.prototype.subscriptionsV2ListAvailableSubscriptionProducts = function() {
                        return sF(this, arguments, void 0, function(t, r) {
                            return void 0 === t && (t = {}), sL(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2ListAvailableSubscriptionProductsRaw(t, r)];
                                    case 1:
                                        return [4, n.sent().value()];
                                    case 2:
                                        return [2, n.sent()]
                                }
                            })
                        })
                    }, r.prototype.subscriptionsV2ListSubscriptionsRaw = function(t, r) {
                        return sF(this, void 0, void 0, function() {
                            var n, i;
                            return sL(this, function(a) {
                                switch (a.label) {
                                    case 0:
                                        return n = {}, void 0 !== t.productType && (n.ProductType = t.productType), void 0 !== t.expirationTimestampMsStart && (n.ExpirationTimestampMsStart = t.expirationTimestampMsStart), void 0 !== t.expirationTimestampMsEnd && (n.ExpirationTimestampMsEnd = t.expirationTimestampMsEnd), void 0 !== t.cursor && (n.Cursor = t.cursor), void 0 !== t.resultsPerPage && (n.ResultsPerPage = t.resultsPerPage), i = {}, [4, this.request({
                                            path: "/v2/user/subscriptions",
                                            method: "GET",
                                            headers: i,
                                            query: n
                                        }, r)];
                                    case 1:
                                        return [2, new sC(a.sent(), function(t) {
                                            return null == t ? t : {
                                                subscriptions: t.subscriptions.map(sH),
                                                hasMore: t.hasMore,
                                                cursor: t.cursor
                                            }
                                        })]
                                }
                            })
                        })
                    }, r.prototype.subscriptionsV2ListSubscriptions = function() {
                        return sF(this, arguments, void 0, function(t, r) {
                            return void 0 === t && (t = {}), sL(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2ListSubscriptionsRaw(t, r)];
                                    case 1:
                                        return [4, n.sent().value()];
                                    case 2:
                                        return [2, n.sent()]
                                }
                            })
                        })
                    }, r.prototype.subscriptionsV2PreparePurchaseV2Raw = function(t, r) {
                        return sF(this, void 0, void 0, function() {
                            var n, i;
                            return sL(this, function(a) {
                                switch (a.label) {
                                    case 0:
                                        if (null === t.subscriptionProductType || void 0 === t.subscriptionProductType) throw new sN("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2PreparePurchaseV2.");
                                        if (null === t.subscriptionProductId || void 0 === t.subscriptionProductId) throw new sN("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2PreparePurchaseV2.");
                                        return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", void 0 !== t.robloxUniverseId && null !== t.robloxUniverseId && (i["Roblox-Universe-Id"] = String(t.robloxUniverseId)), [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/prepare-purchase".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(t.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(t.subscriptionProductId))),
                                            method: "POST",
                                            headers: i,
                                            query: n,
                                            body: function(t) {
                                                if (void 0 !== t) return null === t ? null : {
                                                    paymentProvider: t.paymentProvider,
                                                    universeId: t.universeId,
                                                    paymentProviderPurchaseOptions: function(t) {
                                                        if (void 0 !== t) return null === t ? null : {
                                                            stripePurchaseOptions: function(t) {
                                                                if (void 0 !== t) return null === t ? null : {
                                                                    cancelUrlPathName: t.cancelUrlPathName,
                                                                    successUrlPathName: t.successUrlPathName
                                                                }
                                                            }(t.stripePurchaseOptions),
                                                            appleAppStorePurchaseOptions: function(t) {
                                                                if (void 0 !== t) return null === t ? null : {
                                                                    providerCountryCode: t.providerCountryCode
                                                                }
                                                            }(t.appleAppStorePurchaseOptions),
                                                            braintreePurchaseOptions: function(t) {
                                                                if (void 0 !== t) return null === t ? null : {
                                                                    paymentMethod: t.paymentMethod
                                                                }
                                                            }(t.braintreePurchaseOptions)
                                                        }
                                                    }(t.paymentProviderPurchaseOptions),
                                                    paymentSessionId: t.paymentSessionId
                                                }
                                            }(t.preparePurchaseV2Request)
                                        }, r)];
                                    case 1:
                                        return [2, new sC(a.sent(), function(t) {
                                            var r, n, i, a, o, s;
                                            return null == t ? t : {
                                                paymentProvider: sB(t.paymentProvider),
                                                providerPurchasePayload: null == (r = t.providerPurchasePayload) ? r : {
                                                    stripePurchasePayload: sR(r, "stripePurchasePayload") ? null == (n = r.stripePurchasePayload) ? n : {
                                                        checkoutUrl: n.checkoutUrl
                                                    } : void 0,
                                                    appleAppStorePurchasePayload: sR(r, "appleAppStorePurchasePayload") ? null == (i = r.appleAppStorePurchasePayload) ? i : {
                                                        appAccountToken: i.appAccountToken,
                                                        partnerBillingJwtToken: i.partnerBillingJwtToken,
                                                        partnerBillingGenericProductId: i.partnerBillingGenericProductId
                                                    } : void 0,
                                                    googlePlayStorePurchasePayload: sR(r, "googlePlayStorePurchasePayload") ? null == (a = r.googlePlayStorePurchasePayload) ? a : {
                                                        providerProductId: a.providerProductId,
                                                        providerProductType: a.providerProductType,
                                                        chargeRequestId: a.chargeRequestId,
                                                        offerId: sR(a, "offerId") ? a.offerId : void 0
                                                    } : void 0,
                                                    creditBalancePurchasePayload: sR(r, "creditBalancePurchasePayload") ? null == (o = r.creditBalancePurchasePayload) ? o : {
                                                        checkoutUrl: o.checkoutUrl
                                                    } : void 0,
                                                    braintreePurchasePayload: sR(r, "braintreePurchasePayload") ? null == (s = r.braintreePurchasePayload) ? s : {
                                                        productToken: s.productToken,
                                                        price: s.price,
                                                        currencyCode: s.currencyCode,
                                                        clientAuthorizationToken: s.clientAuthorizationToken
                                                    } : void 0
                                                },
                                                nativeProviderPurchasePayloadString: t.nativeProviderPurchasePayloadString
                                            }
                                        })]
                                }
                            })
                        })
                    }, r.prototype.subscriptionsV2PreparePurchaseV2 = function(t, r) {
                        return sF(this, void 0, void 0, function() {
                            return sL(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2PreparePurchaseV2Raw(t, r)];
                                    case 1:
                                        return [4, n.sent().value()];
                                    case 2:
                                        return [2, n.sent()]
                                }
                            })
                        })
                    }, r
                }(sT),
                sX = A.EnvironmentUrls.apiGatewayUrl,
                sK = new sW(new sM({
                    robloxSiteDomain: A.EnvironmentUrls.domain,
                    basePath: "".concat(sX, "/subscriptions"),
                    credentials: "include"
                }));

            function sY(t, r) {
                (null == r || r > t.length) && (r = t.length);
                for (var n = 0, i = Array(r); n < r; n++) i[n] = t[n];
                return i
            }

            function s$(t, r, n, i, a, o, s) {
                try {
                    var l = t[o](s),
                        c = l.value
                } catch (t) {
                    n(t);
                    return
                }
                l.done ? r(c) : Promise.resolve(c).then(i, a)
            }

            function sJ(t) {
                for (var r = 1; r < arguments.length; r++) {
                    var n = null != arguments[r] ? arguments[r] : {},
                        i = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (i = i.concat(Object.getOwnPropertySymbols(n).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(n, t).enumerable
                    }))), i.forEach(function(r) {
                        var i;
                        i = n[r], r in t ? Object.defineProperty(t, r, {
                            value: i,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : t[r] = i
                    })
                }
                return t
            }

            function sQ(t, r) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, r) {
                    var n, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var o = [],
                            s = !0,
                            l = !1;
                        try {
                            for (a = a.call(t); !(s = (n = a.next()).done) && (o.push(n.value), !r || o.length !== r); s = !0);
                        } catch (t) {
                            l = !0, i = t
                        } finally {
                            try {
                                s || null == a.return || a.return()
                            } finally {
                                if (l) throw i
                            }
                        }
                        return o
                    }
                }(t, r) || function(t, r) {
                    if (t) {
                        if ("string" == typeof t) return sY(t, r);
                        var n = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return sY(t, r)
                    }
                }(t, r) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var sZ = "Bad Request",
                s0 = "ReactBuyButtonNewUpsellProcessFailedDueToError",
                s1 = "ReactBuyButtonNewUpsellProcessFailedDueToNotLoaded",
                s2 = "ReactBuyButtonNewUpsellProcessNewUpsellFromReactBuyButton";

            function s3() {
                var t, r, n = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                    i = n.customPurchaseVerificationModal,
                    a = n.customPurchaseConfirmationModal,
                    s = n.customPurchaseVerificationModalService,
                    l = (n.forceUnifiedModal, q().userRobuxBalance),
                    f = sQ((0, m.createSystemFeedback)(), 2),
                    b = f[0],
                    g = f[1],
                    w = sQ((0, m.createSystemFeedback)(), 2),
                    S = w[0],
                    A = w[1],
                    O = sQ($(), 2),
                    j = O[0],
                    N = O[1],
                    R = sQ((t = null, r = {
                        open: function() {
                            t && t(!0)
                        },
                        close: function() {
                            t && t(!1)
                        }
                    }, [(0, c.withTranslations)(function(n) {
                        var i, a, s, l = n.translate,
                            c = n.title,
                            u = n.expectedPrice,
                            f = n.displayPrice,
                            p = void 0 === f ? "" : f,
                            m = n.thumbnail,
                            h = n.assetName,
                            b = n.assetType,
                            y = n.assetTypeDisplayName,
                            g = void 0 === y ? "" : y,
                            w = n.sellerName,
                            x = n.isPlace,
                            S = void 0 !== x && x,
                            P = n.onAction,
                            I = n.onSecondaryAction,
                            A = n.primaryActionButtonText,
                            O = n.secondaryActionButtonText,
                            j = n.footerDisclaimerText,
                            N = n.priceSuffix,
                            R = n.loading,
                            C = n.currentRobuxBalance,
                            M = n.rentalOptionDays,
                            D = n.subscriptionProductInfo,
                            k = void 0 === D ? null : D,
                            F = n.discountInformation,
                            L = void 0 === F ? null : F,
                            U = n.collectibleItemId,
                            B = void 0 === U ? null : U,
                            q = n.isLimited,
                            z = (i = d().useState(!1), function(t) {
                                if (Array.isArray(t)) return t
                            }(i) || function(t, r) {
                                var n, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                                if (null != a) {
                                    var o = [],
                                        s = !0,
                                        l = !1;
                                    try {
                                        for (a = a.call(t); !(s = (n = a.next()).done) && (o.push(n.value), o.length !== r); s = !0);
                                    } catch (t) {
                                        l = !0, i = t
                                    } finally {
                                        try {
                                            s || null == a.return || a.return()
                                        } finally {
                                            if (l) throw i
                                        }
                                    }
                                    return o
                                }
                            }(i, 2) || function(t, r) {
                                if (t) {
                                    if ("string" == typeof t) return og(t, 2);
                                    var n = Object.prototype.toString.call(t).slice(8, -1);
                                    if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return og(t, r)
                                }
                            }(i, 2) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }()),
                            V = z[0],
                            G = z[1];
                        d().useEffect(function() {
                            return t = G,
                                function() {
                                    t === G && (t = null)
                                }
                        }, []);
                        var H = {
                            assetName: (0, E.renderToString)((0, o.jsx)(K, {
                                name: h
                            })),
                            assetType: g || b,
                            seller: (0, X.escapeHtml)(w),
                            robux: (0, E.renderToString)((0, o.jsx)(_, {
                                translate: l,
                                price: u,
                                color: "",
                                useFreeText: !1
                            }))
                        };
                        S ? v.promptBuyAccessMessage : v.promptBuyMessage, S || "" !== H.seller || v.promptBuySimplifiedMessage;
                        var W = !!("Subscription" === b && p);
                        W ? (a = l(v.buyItemHeading), s = l(v.buyAction)) : 0 === u ? (a = l(v.getItemHeading), s = l(v.getNowAction)) : (a = l(v.buyItemHeading), s = l(v.buyAction)), S && (a = l(v.buyExperience));
                        var Y = (void 0 === j ? "" : j) || void 0;
                        if ("Subscription" === b) {
                            var $ = document.documentElement.lang || "en-us",
                                J = T.urlService.getUrlWithLocale("/info/terms", $),
                                Q = "{{LINK_START}}",
                                Z = "{{LINK_END}}",
                                ee = l("Description.SubscribeTermsAgreement", {
                                    linkStart: Q,
                                    linkEnd: Z
                                }).split(new RegExp("".concat(Q, "|").concat(Z)));
                            Y = (0, o.jsxs)(d().Fragment, {
                                children: [ee[0], (0, o.jsx)("a", {
                                    style: {
                                        color: "inherit",
                                        textDecoration: "underline"
                                    },
                                    target: "_blank",
                                    rel: "noreferrer",
                                    href: J,
                                    children: ee[1]
                                }), ee[2]]
                            })
                        }
                        return (0, o.jsx)(ov, {
                            translate: l,
                            titleText: (void 0 === c ? "" : c) || a,
                            actionButtonText: (void 0 === A ? "" : A) || s,
                            expectedPrice: u,
                            displayPrice: W ? p : void 0,
                            thumbnail: m,
                            assetName: h,
                            assetType: b,
                            assetTypeDisplayName: g,
                            sellerName: w,
                            isPlace: S,
                            onAction: P,
                            onSecondaryAction: I,
                            secondaryActionButtonText: I ? void 0 === O ? "" : O : void 0,
                            footerDisclaimerText: Y,
                            priceSuffix: N,
                            loading: void 0 !== R && R,
                            currentRobuxBalance: C,
                            rentalOptionDays: void 0 === M ? null : M,
                            open: V,
                            onCancel: r.close,
                            subscriptionProductInfo: null != k ? k : void 0,
                            discountInformation: null != L ? L : void 0,
                            collectibleItemId: null != B ? B : void 0,
                            isLimited: void 0 !== q && q
                        })
                    }, h), r]), 2),
                    C = R[0],
                    M = R[1],
                    D = sQ(B(), 2),
                    k = D[0],
                    F = D[1],
                    L = sQ(nI({
                        customPurchaseConfirmationModal: a
                    }), 2),
                    U = L[0],
                    z = L[1],
                    V = sQ(W(), 2),
                    G = V[0],
                    H = V[1],
                    Y = sQ(P(), 2),
                    J = Y[0],
                    Q = Y[1],
                    Z = {
                        errorObject: {},
                        itemDetail: {},
                        startOriginalFlowCallback: function() {
                            return null
                        }
                    },
                    ee = function() {
                        Z.itemDetail.buyButtonElementDataset && (I.paymentFlowAnalyticsService.startRobuxUpsellFlow(Z.itemDetail.buyButtonElementDataset.assetType, !!Z.itemDetail.buyButtonElementDataset.userassetId, Z.itemDetail.buyButtonElementDataset.isPrivateServer, Z.itemDetail.buyButtonElementDataset.isPlace, Z.itemDetail.buyButtonElementDataset.productId), F.open())
                    },
                    et = function() {
                        if (nA.ItemPurchaseUpsellService && (null == Z || null == (t = Z.itemDetail) ? void 0 : t.expectedItemPrice)) {
                            if (l - (null == Z || null == (r = Z.itemDetail) ? void 0 : r.expectedItemPrice) >= 0) return void ee();
                            try {
                                var t, r, n, i = (null == (n = Z.itemDetail.buyButtonElementDataset) ? void 0 : n.assetType) === "Subscription" ? {
                                    userBalanceRobux: String(Number.isFinite(l) ? l : 0),
                                    imageurl: "",
                                    alerturl: ""
                                } : void 0;
                                nA.ItemPurchaseUpsellService.startItemUpsellProcess(Z.errorObject, Z.itemDetail, Z.startOriginalFlowCallback, i, Z.shouldShowUnifiedPurchaseModal).catch(function() {}), window.EventTracker.fireEvent(s2)
                            } catch (t) {
                                window.EventTracker.fireEvent(s0), ee()
                            }
                        } else window.EventTracker.fireEvent(s1), ee()
                    },
                    er = function(t, r, n) {
                        var i, a = Math.ceil(n / 60);
                        if (a > 24) {
                            var o, s = Math.ceil(a / 24);
                            return t("Text.EconomicRestrictionsDaysGeneral", {
                                violation: t(null != (o = x[r]) ? o : "Label.Sublabel.FraudPaymentAbuse"),
                                day: s
                            })
                        }
                        return t("Text.EconomicRestrictionsHoursGeneral", {
                            violation: t(null != (i = x[r]) ? i : "Label.Sublabel.FraudPaymentAbuse"),
                            hour: a
                        })
                    };

                function en(t) {
                    var r, n, a, c = t.translate,
                        f = t.assetName,
                        p = t.assetType,
                        m = t.assetTypeDisplayName,
                        h = t.productId,
                        w = t.expectedCurrency,
                        x = t.expectedPrice,
                        P = t.expectedSellerId,
                        E = t.expectedPromoId,
                        I = t.userAssetId,
                        O = t.thumbnail,
                        R = t.sellerName,
                        D = t.sellerType,
                        L = t.showSuccessBanner,
                        _ = t.isPlace,
                        B = t.isPrivateServer,
                        V = t.handlePurchase,
                        W = t.onPurchaseSuccess,
                        X = t.collectibleItemId,
                        K = t.collectibleItemInstanceId,
                        Y = t.collectibleProductId,
                        $ = t.isLimited,
                        en = t.customProps,
                        ei = t.rentalOptionDays,
                        ea = void 0 === ei ? null : ei,
                        eo = t.saleLocationId,
                        es = void 0 === eo ? null : eo,
                        el = t.discountInformation,
                        ec = void 0 === el ? null : el,
                        eu = t.subscriptionTargetKey,
                        ed = void 0 === eu ? null : eu,
                        ef = t.subscriptionPaymentProvider,
                        ep = void 0 === ef ? "" : ef,
                        em = t.subscriptionSecondaryPaymentProvider,
                        eh = void 0 === em ? "" : em,
                        eb = t.subscriptionTitle,
                        ey = t.primaryActionButtonText,
                        ev = t.secondaryActionButtonText,
                        eg = t.subscriptionFooterDisclaimer,
                        ew = t.subscriptionCancelPath,
                        ex = void 0 === ew ? "" : ew,
                        eS = t.displayPrice,
                        eP = void 0 === eS ? "" : eS,
                        eE = t.priceSuffix,
                        eI = void 0 === eE ? "" : eE,
                        eA = sQ((0, u.useState)(!1), 2),
                        eT = eA[0],
                        eO = eA[1],
                        ej = sQ((0, u.useState)(null), 2),
                        eN = ej[0],
                        eR = ej[1],
                        eC = sQ((0, u.useState)(null), 2),
                        eM = eC[0],
                        eD = eC[1],
                        ek = sQ((0, u.useState)(x - l), 2),
                        eF = ek[0],
                        eL = ek[1],
                        e_ = sQ((0, u.useState)(null), 2),
                        eU = e_[0],
                        eB = e_[1],
                        eq = sQ((0, u.useState)(l), 2),
                        ez = eq[0],
                        eV = eq[1],
                        eG = sQ((0, u.useState)(function() {
                            return T.uuidService.generateRandomUuid()
                        }), 1)[0],
                        eH = sQ((0, u.useState)(!1), 2),
                        eW = eH[0],
                        eX = eH[1],
                        eK = function() {
                            return eX(!0)
                        },
                        eY = sQ((0, u.useState)(!1), 2),
                        e$ = eY[0],
                        eJ = eY[1],
                        eQ = sQ((0, u.useState)(!1), 2),
                        eZ = eQ[0],
                        e0 = eQ[1],
                        e1 = (0, nT.useQuery)({
                            queryKey: ["list-available-subscription-products", nA.CurrentUser.userId],
                            queryFn: function() {
                                return sK.subscriptionsV2ListAvailableSubscriptionProducts({
                                    productType: "Blackbird",
                                    includePurchased: !1
                                })
                            },
                            select: function(t) {
                                var r;
                                return null != (r = t.products[0]) ? r : null
                            },
                            enabled: eZ,
                            retry: 1,
                            retryDelay: 100
                        }).data,
                        e2 = function() {
                            nq(nA.CurrentUser.userId).then(function(t) {
                                eV(t.data.robux), eL(x - t.data.robux)
                            }).catch(function() {
                                eV(void 0)
                            })
                        };
                    (0, u.useEffect)(function() {
                        var t = q().userRobuxBalance;
                        nA.CurrentUser.isAuthenticated && !Number.isFinite(t) ? e2() : (eV(t), eL(x - t))
                    }, [h, x, P]), (0, u.useEffect)(function() {
                        eW && eJ(!0)
                    }, [eW]), (0, u.useEffect)(function() {
                        nA.CurrentUser.isAuthenticated && e0(!0)
                    }, []);
                    var e3 = function() {
                            s ? s.close() : eZ ? M.close() : N.close(), H.close()
                        },
                        e4 = function(t, r) {
                            var n = {
                                assetType: p,
                                assetTypeDisplayName: m,
                                expectedCurrency: w,
                                expectedPrice: r,
                                expectedSellerId: P,
                                itemName: f,
                                itemType: p,
                                productId: h,
                                userassetId: I,
                                placeproductpromotionId: E,
                                isPrivateServer: B,
                                isPlace: _,
                                collectibleItemId: X,
                                collectibleItemInstanceId: K,
                                collectibleProductId: Y,
                                subscriptionTargetKey: ed,
                                rentalOptionDays: ea
                            };
                            Z = {
                                errorObject: {
                                    shortfallPrice: t,
                                    currentCurrency: w,
                                    isPlace: _
                                },
                                itemDetail: {
                                    expectedItemPrice: r,
                                    assetName: f,
                                    isLimited: $,
                                    buyButtonElementDataset: n,
                                    thumbnail: O,
                                    priceSuffix: eI,
                                    discountInformation: ec
                                },
                                startOriginalFlowCallback: function() {
                                    nA.ItemPurchaseUpsellService && nA.ItemPurchaseUpsellService.showExceedLargestInsufficientRobuxModal ? nA.ItemPurchaseUpsellService.showExceedLargestInsufficientRobuxModal(t, n, ee, void 0, eZ) : ee()
                                },
                                shouldShowUnifiedPurchaseModal: eZ
                            }
                        },
                        e6 = function(t) {
                            var r = t.showDivId,
                                n = t.title,
                                i = t.errorMsg,
                                a = t.price,
                                o = t.shortfallPrice,
                                s = t.onDecline;
                            r === y.transactionFailure ? (eR({
                                title: n,
                                message: i,
                                onDecline: s
                            }), Q.open()) : r === y.insufficientFunds ? (eL(o), e4(o, a), et()) : r === y.priceChanged && (eD(a), H.open())
                        },
                        e8 = function(t) {
                            eB(t), z.open()
                        },
                        e5 = function(t) {
                            eO(!0), nR(h, {
                                expectedPrice: t,
                                saleLocationType: "Website",
                                saleLocationId: es,
                                idempotencyKey: eG
                            }).then(function(t) {
                                var r = t.data;
                                if (void 0 !== r.FailureReason && void 0 !== r.ExpirationTimeInMinutes) {
                                    eO(!1), e3(), e6({
                                        title: c(v.economicRestrictionsErrorHeading),
                                        errorMsg: er(c, r.FailureReason, r.ExpirationTimeInMinutes),
                                        showDivId: y.transactionFailure
                                    });
                                    return
                                }
                                if (eO(!1), e3(), r.purchased || "TwoStepVerificationRequired" !== r.reason)
                                    if (r.purchased) {
                                        if (W(), L) return void g.success(c(v.purchaseCompleteHeading));
                                        e8({
                                            assetIsWearable: !1,
                                            transactionVerb: "",
                                            onDecline: function() {
                                                window.location.reload()
                                            }
                                        })
                                    } else e6({
                                        title: c(v.errorOccuredHeading),
                                        errorMsg: c(v.generalPurchaseErrorMessage),
                                        showDivId: y.transactionFailure
                                    });
                                else eK()
                            }).catch(function(t) {
                                console.debug(t), eO(!1), e3();
                                var r, n = null == (r = t.data) ? void 0 : r.errorCode;
                                t && 500 === t.status && n === y.pendingProductsLimitExceeded ? e6({
                                    title: c(v.pendingDeveloperProductLimitReachedHeading),
                                    errorMsg: c(v.pendingDeveloperProductLimitReachedMessage),
                                    showDivId: y.transactionFailure
                                }) : t && (null == t ? void 0 : t.status) !== 400 ? 429 === t.status ? e6({
                                    title: c(v.errorOccuredHeading),
                                    errorMsg: c(v.floodcheckFailureMessage, {
                                        throttleTime: 1
                                    }),
                                    showDivId: y.transactionFailure
                                }) : e6({
                                    title: c(v.errorOccuredHeading),
                                    errorMsg: c(v.generalPurchaseErrorMessage),
                                    showDivId: y.transactionFailure
                                }) : e6({
                                    title: c(v.errorOccuredHeading),
                                    errorMsg: c(v.purchasingUnavailableMessage),
                                    showDivId: y.transactionFailure
                                })
                            })
                        },
                        e7 = function(t) {
                            eO(!0), nC(h, {
                                expectedPrice: t,
                                idempotencyKey: eG
                            }).then(function(t) {
                                var r = t.data;
                                if (void 0 !== r.failureReason && void 0 !== r.expirationTimeInMinutes) {
                                    eO(!1), e3(), e6({
                                        title: c(v.economicRestrictionsErrorHeading),
                                        errorMsg: er(c, r.failureReason, r.expirationTimeInMinutes),
                                        showDivId: y.transactionFailure
                                    });
                                    return
                                }
                                if (eO(!1), e3(), r.purchased || "TwoStepVerificationRequired" !== r.reason)
                                    if (r.purchased) {
                                        if (W(), L) return void g.success(c(v.purchaseCompleteHeading));
                                        e8({
                                            assetIsWearable: !1,
                                            transactionVerb: r.transactionVerb,
                                            onDecline: function() {
                                                window.location.reload()
                                            }
                                        })
                                    } else e6({
                                        title: c(v.errorOccuredHeading),
                                        errorMsg: c(v.generalPurchaseErrorMessage),
                                        showDivId: y.transactionFailure
                                    });
                                else eK()
                            }).catch(function(t) {
                                console.debug(t), eO(!1), e3(), t && (null == t ? void 0 : t.status) !== 400 ? 429 === t.status ? e6({
                                    title: c(v.errorOccuredHeading),
                                    errorMsg: c(v.floodcheckFailureMessage, {
                                        throttleTime: 1
                                    }),
                                    showDivId: y.transactionFailure
                                }) : e6({
                                    title: c(v.errorOccuredHeading),
                                    errorMsg: c(v.generalPurchaseErrorMessage),
                                    showDivId: y.transactionFailure
                                }) : e6({
                                    title: c(v.errorOccuredHeading),
                                    errorMsg: c(v.purchasingUnavailableMessage),
                                    showDivId: y.transactionFailure
                                })
                            })
                        },
                        e9 = function(t) {
                            var r = {
                                expectedCurrency: w,
                                expectedPrice: t,
                                expectedSellerId: P
                            };
                            (E > 0 && (r.expectedPromoId = E), I > 0 && (r.userAssetId = I), V) ? V({
                                params: r,
                                handleError: e6,
                                setLoading: eO,
                                openConfirmation: e8,
                                closeAll: e3
                            }): (eO(!0), nM(h, r).then(function(t) {
                                var r = t.data;
                                if (void 0 !== r.FailureReason && void 0 !== r.ExpirationTimeInMinutes) {
                                    eO(!1), e3(), e6({
                                        title: c(v.economicRestrictionsErrorHeading),
                                        errorMsg: er(c, r.FailureReason, r.ExpirationTimeInMinutes),
                                        showDivId: y.transactionFailure
                                    });
                                    return
                                }
                                console.debug(r);
                                var n = r.statusCode,
                                    i = r.assetIsWearable,
                                    a = r.transactionVerb;
                                if (eO(!1), e3(), r.purchased || "TwoStepVerificationRequired" !== r.reason)
                                    if (500 === n) e6(r);
                                    else {
                                        if (W(), L) return void g.success(c(v.purchaseCompleteHeading));
                                        e8({
                                            assetIsWearable: i,
                                            transactionVerb: a,
                                            onDecline: function() {
                                                window.location.reload()
                                            }
                                        })
                                    }
                                else eK()
                            }).catch(function(t) {
                                if (console.debug(t), eO(!1), e3(), t && (null == t ? void 0 : t.statusText) !== sZ) {
                                    429 === t.status && e6({
                                        title: c(v.errorOccuredHeading),
                                        errorMsg: c(v.floodcheckFailureMessage, {
                                            throttleTime: 1
                                        }),
                                        showDivId: y.transactionFailure
                                    });
                                    try {
                                        e6(JSON.parse(null == t ? void 0 : t.statusText))
                                    } catch (r) {
                                        e6({
                                            errorMsg: null == t ? void 0 : t.statusText
                                        })
                                    }
                                } else e6({
                                    title: c(v.errorOccuredHeading),
                                    errorMsg: c(v.purchasingUnavailableMessage),
                                    showDivId: y.transactionFailure
                                })
                            }))
                        },
                        te = function(t, r) {
                            var n;
                            return (n = function() {
                                var n, i, a, o, s, l, u;
                                return function(t, r) {
                                    var n, i, a, o = {
                                            label: 0,
                                            sent: function() {
                                                if (1 & a[0]) throw a[1];
                                                return a[1]
                                            },
                                            trys: [],
                                            ops: []
                                        },
                                        s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                    return s.next = l(0), s.throw = l(1), s.return = l(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
                                        return this
                                    }), s;

                                    function l(l) {
                                        return function(c) {
                                            var u = [l, c];
                                            if (n) throw TypeError("Generator is already executing.");
                                            for (; s && (s = 0, u[0] && (o = 0)), o;) try {
                                                if (n = 1, i && (a = 2 & u[0] ? i.return : u[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, u[1])).done) return a;
                                                switch (i = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                                    case 0:
                                                    case 1:
                                                        a = u;
                                                        break;
                                                    case 4:
                                                        return o.label++, {
                                                            value: u[1],
                                                            done: !1
                                                        };
                                                    case 5:
                                                        o.label++, i = u[1], u = [0];
                                                        continue;
                                                    case 7:
                                                        u = o.ops.pop(), o.trys.pop();
                                                        continue;
                                                    default:
                                                        if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                            o = 0;
                                                            continue
                                                        }
                                                        if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                                            o.label = u[1];
                                                            break
                                                        }
                                                        if (6 === u[0] && o.label < a[1]) {
                                                            o.label = a[1], a = u;
                                                            break
                                                        }
                                                        if (a && o.label < a[2]) {
                                                            o.label = a[2], o.ops.push(u);
                                                            break
                                                        }
                                                        a[2] && o.ops.pop(), o.trys.pop();
                                                        continue
                                                }
                                                u = r.call(t, o)
                                            } catch (t) {
                                                u = [6, t], i = 0
                                            } finally {
                                                n = a = 0
                                            }
                                            if (5 & u[0]) throw u[1];
                                            return {
                                                value: u[0] ? u[1] : void 0,
                                                done: !0
                                            }
                                        }
                                    }
                                }(this, function(d) {
                                    switch (d.label) {
                                        case 0:
                                            if (n = {
                                                    collectibleItemId: X,
                                                    expectedCurrency: w,
                                                    expectedPrice: t,
                                                    expectedPurchaserId: nA.CurrentUser.userId,
                                                    expectedPurchaserType: "User",
                                                    rentalOptionDays: ea,
                                                    expectedSellerId: P,
                                                    expectedSellerType: D,
                                                    idempotencyKey: eG
                                                }, K && (n.collectibleItemInstanceId = K), Y && (n.collectibleProductId = Y), (null == r ? void 0 : r.length) && (n.offerIds = r), V) return V({
                                                params: n,
                                                handleError: e6,
                                                setLoading: eO,
                                                openConfirmation: e8,
                                                closeAll: e3
                                            }), [2];
                                            eO(!0), i = K ? nN : nj, d.label = 1;
                                        case 1:
                                            return d.trys.push([1, 3, , 4]), [4, i(X, n)];
                                        case 2:
                                            if (void 0 !== (a = d.sent().data).failureReason && void 0 !== a.expirationTimeInMinutes) return eO(!1), e3(), e6({
                                                title: c(v.economicRestrictionsErrorHeading),
                                                errorMsg: er(c, a.failureReason, a.expirationTimeInMinutes),
                                                showDivId: y.transactionFailure
                                            }), [2];
                                            if (o = a.transactionVerb, eO(!1), e3(), "number" == typeof(l = null != (s = a.statusCode) ? s : a.status) && l >= 400 || (null == a ? void 0 : a.purchased) === !1)(null == a ? void 0 : a.purchased) === !1 && (null == a ? void 0 : a.reason) === "TwoStepVerificationRequired" ? eK() : (null == a ? void 0 : a.purchased) === !1 && (null == a ? void 0 : a.purchaseResult) === "Flooded" ? e6({
                                                title: c(v.errorOccuredHeading),
                                                errorMsg: c(v.floodcheckFailureMessage, {
                                                    throttleTime: 1
                                                }),
                                                showDivId: y.transactionFailure
                                            }) : "InsufficientBalance" === a.errorMessage ? F.open() : e6({
                                                title: c(v.errorOccuredHeading),
                                                errorMsg: c(v.purchasingUnavailableMessage),
                                                showDivId: y.transactionFailure,
                                                onDecline: function() {
                                                    window.location.reload()
                                                }
                                            });
                                            else {
                                                if (W(), L) return g.success(c(v.purchaseCompleteHeading)), [2];
                                                e8({
                                                    assetIsWearable: !0,
                                                    transactionVerb: o,
                                                    itemDelayed: null == a ? void 0 : a.pending,
                                                    expectedPrice: null != t ? t : x,
                                                    onDecline: function() {
                                                        window.location.reload()
                                                    }
                                                })
                                            }
                                            return [3, 4];
                                        case 3:
                                            if (console.debug(u = d.sent()), nA.AccountIntegrityChallengeService.Generic.ChallengeError.matchAbandoned(eN)) return eO(!1), [2];
                                            if (eO(!1), e3(), u && (null == u ? void 0 : u.statusText) !== sZ) {
                                                429 === u.status && e6({
                                                    title: c(v.errorOccuredHeading),
                                                    errorMsg: c(v.floodcheckFailureMessage, {
                                                        throttleTime: 1
                                                    }),
                                                    showDivId: y.transactionFailure
                                                });
                                                try {
                                                    e6(JSON.parse(null == u ? void 0 : u.statusText))
                                                } catch (t) {
                                                    e6({
                                                        errorMsg: null == u ? void 0 : u.statusText
                                                    })
                                                }
                                            } else e6({
                                                title: c(v.errorOccuredHeading),
                                                errorMsg: c(v.purchasingUnavailableMessage),
                                                showDivId: y.transactionFailure
                                            });
                                            return [3, 4];
                                        case 4:
                                            return [2]
                                    }
                                })
                            }, function() {
                                var t = this,
                                    r = arguments;
                                return new Promise(function(i, a) {
                                    var o = n.apply(t, r);

                                    function s(t) {
                                        s$(o, i, a, s, l, "next", t)
                                    }

                                    function l(t) {
                                        s$(o, i, a, s, l, "throw", t)
                                    }
                                    s(void 0)
                                })
                            })()
                        },
                        tt = function(t, r) {
                            var n = r || ep;
                            if (eO(!0), "Robux" === n) {
                                var i = 0;
                                if (Number.isFinite(ez) ? i = ez : Number.isFinite(l) && (i = l), i < t) {
                                    eO(!1), e3(), e4(t - i, t), et();
                                    return
                                }
                                nD(ed, {
                                    priceInRobux: t
                                }).then(function(t) {
                                    var r = t.data;
                                    eO(!1), e3(), r.isSuccess ? (W(), L ? g.success(c(v.purchaseCompleteHeading)) : e8({
                                        assetIsWearable: !1,
                                        transactionVerb: "",
                                        onDecline: function() {
                                            window.location.reload()
                                        }
                                    })) : e6({
                                        title: c(v.errorOccuredHeading),
                                        errorMsg: r.errorMessage || c(v.generalPurchaseErrorMessage),
                                        showDivId: y.transactionFailure
                                    })
                                }).catch(function(t) {
                                    eO(!1), e3(), (null == t ? void 0 : t.status) === 429 ? e6({
                                        title: c(v.errorOccuredHeading),
                                        errorMsg: c(v.floodcheckFailureMessage, {
                                            throttleTime: 1
                                        }),
                                        showDivId: y.transactionFailure
                                    }) : e6({
                                        title: c(v.errorOccuredHeading),
                                        errorMsg: c(v.generalPurchaseErrorMessage),
                                        showDivId: y.transactionFailure
                                    })
                                });
                                return
                            }
                            nk(ed, {
                                stripeCancelUrlPathName: ex,
                                paymentProvider: n
                            }).then(function(t) {
                                var r = t.data;
                                if (r.invalidReason) {
                                    eO(!1), e3();
                                    var i = sQ(r.invalidReason.split("/"), 3),
                                        a = i[1],
                                        o = i[2];
                                    e6({
                                        title: c(v.economicRestrictionsErrorHeading),
                                        errorMsg: er(c, a, parseInt(o, 10)) || c(v.generalPurchaseErrorMessage),
                                        showDivId: y.transactionFailure
                                    });
                                    return
                                }
                                if ("Stripe" === n && r.providerPayload) {
                                    var s = JSON.parse(r.providerPayload);
                                    s.CheckoutUrl && (eO(!1), window.location.href = s.CheckoutUrl)
                                } else "CreditBalance" === n && r.providerPayload ? (eO(!1), window.location.href = "/upgrades/redeem?ap=0&subscriptionTargetKey=".concat(ed)) : (eO(!1), e3(), e6({
                                    title: c(v.errorOccuredHeading),
                                    errorMsg: c(v.generalPurchaseErrorMessage),
                                    showDivId: y.transactionFailure
                                }))
                            }).catch(function(t) {
                                eO(!1), e3(), (null == t ? void 0 : t.status) === 429 ? e6({
                                    title: c(v.errorOccuredHeading),
                                    errorMsg: c(v.floodcheckFailureMessage, {
                                        throttleTime: 1
                                    }),
                                    showDivId: y.transactionFailure
                                }) : e6({
                                    title: c(v.errorOccuredHeading),
                                    errorMsg: c(v.generalPurchaseErrorMessage),
                                    showDivId: y.transactionFailure
                                })
                            })
                        },
                        tr = function(t, r) {
                            X ? te(t, r) : "Product" === p ? e5(t) : "Game Pass" === p ? e7(t) : "Subscription" === p ? tt(t) : e9(t)
                        };
                    if (i) a = d().createElement(i, sJ({}, sJ({
                        assetName: f,
                        assetType: p,
                        expectedPrice: x,
                        thumbnail: O,
                        sellerName: R,
                        loading: eT,
                        onAction: function() {
                            return tr(x)
                        }
                    }, en)));
                    else if (eZ) {
                        var tn = "Subscription" === p && eh ? function() {
                            return tt(x, eh), !1
                        } : void 0;
                        a = (0, o.jsx)(C, {
                            title: (void 0 === eb ? "" : eb) || void 0,
                            expectedPrice: x,
                            displayPrice: eP,
                            thumbnail: O,
                            assetName: f,
                            assetType: p,
                            assetTypeDisplayName: m,
                            sellerName: R,
                            isPlace: _,
                            loading: eT,
                            currentRobuxBalance: ez,
                            rentalOptionDays: ea,
                            onAction: function() {
                                var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                                    r = t.purchasePrice;
                                return tr(null != r ? r : x, t.offerIds), !1
                            },
                            primaryActionButtonText: void 0 === ey ? "" : ey,
                            onSecondaryAction: tn,
                            secondaryActionButtonText: void 0 === ev ? "" : ev,
                            footerDisclaimerText: (void 0 === eg ? "" : eg) || void 0,
                            priceSuffix: eI || void 0,
                            subscriptionProductInfo: function(t, r, n) {
                                if ("Subscription" !== t || !r) return n || void 0
                            }(p, eP, void 0 === e1 ? null : e1),
                            discountInformation: ec || void 0,
                            collectibleItemId: X || void 0,
                            isLimited: $ || !1
                        })
                    } else a = (0, o.jsx)(j, {
                        expectedPrice: x,
                        displayPrice: eP,
                        thumbnail: O,
                        assetName: f,
                        assetType: p,
                        assetTypeDisplayName: m,
                        sellerName: R,
                        isPlace: _,
                        loading: eT,
                        collectibleItemId: X,
                        collectibleItemInstanceId: K,
                        currentRobuxBalance: ez,
                        onAction: function() {
                            return tr(x), !1
                        }
                    });
                    return eF > 0 && nA.ItemPurchaseUpsellService && e4(eF, null != eM ? eM : x), (0, o.jsxs)(d().Fragment, {
                        children: [(0, o.jsx)(n$, {
                            isTwoStepVerificationActive: eW,
                            stopTwoStepVerification: function() {
                                return eX(!1)
                            },
                            systemFeedbackService: A
                        }), (0, o.jsx)(k, {
                            robuxNeeded: eF
                        }), (!eF || eF <= 0) && a, eN && (0, o.jsx)(J, {
                            title: eN.title,
                            message: eN.message,
                            onDecline: eN.onDecline
                        }), null != eM && (0, o.jsx)(G, {
                            expectedPrice: x,
                            currentPrice: eM,
                            loading: eT,
                            onAction: function() {
                                return tr(eM), !1
                            }
                        }), eU && (0, o.jsx)(U, (r = sJ({
                            thumbnail: O,
                            assetName: f,
                            assetType: p,
                            assetTypeDisplayName: m,
                            sellerName: R,
                            isPlace: _,
                            isPrivateServer: B,
                            expectedPrice: eM || x,
                            currentRobuxBalance: ez
                        }, eU), n = n = {
                            shouldShowUnifiedPurchaseCompletionModal: eZ
                        }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(t, r) {
                            var n = Object.keys(t);
                            if (Object.getOwnPropertySymbols) {
                                var i = Object.getOwnPropertySymbols(t);
                                n.push.apply(n, i)
                            }
                            return n
                        })(Object(n)).forEach(function(t) {
                            Object.defineProperty(r, t, Object.getOwnPropertyDescriptor(n, t))
                        }), r)), L && (0, o.jsx)(b, {}), e$ && (0, o.jsx)(S, {})]
                    })
                }
                en.defaultProps = {
                    isPlace: !1,
                    isPrivateServer: !1,
                    productId: null,
                    assetTypeDisplayName: "",
                    expectedPromoId: 0,
                    userAssetId: 0,
                    showSuccessBanner: !1,
                    handlePurchase: null,
                    onPurchaseSuccess: function() {
                        return null
                    },
                    customProps: {},
                    collectibleItemId: null,
                    collectibleItemInstanceId: null,
                    collectibleProductId: null,
                    sellerType: null,
                    isLimited: !1,
                    saleLocationId: null,
                    rentalOptionDays: null,
                    subscriptionTargetKey: null,
                    discountInformation: null,
                    subscriptionPaymentProvider: "",
                    subscriptionSecondaryPaymentProvider: "",
                    subscriptionTitle: "",
                    primaryActionButtonText: "",
                    secondaryActionButtonText: "",
                    subscriptionFooterDisclaimer: "",
                    subscriptionCancelPath: "",
                    displayPrice: "",
                    priceSuffix: "",
                    subscriptionProductType: null,
                    subscriptionProductId: null
                }, en.propTypes = {
                    translate: p().func.isRequired,
                    productId: function(t, r, n) {
                        var i = t.collectibleItemId,
                            a = t.productId,
                            o = t.subscriptionTargetKey;
                        return i || o || "number" == typeof a ? null : Error("Invalid prop ".concat(r, " supplied to ").concat(n, ". Validation failed."))
                    },
                    expectedCurrency: p().number.isRequired,
                    expectedPrice: p().number.isRequired,
                    thumbnail: p().node.isRequired,
                    assetName: p().string.isRequired,
                    assetType: p().string.isRequired,
                    assetTypeDisplayName: p().string,
                    expectedSellerId: p().number.isRequired,
                    sellerName: p().string.isRequired,
                    sellerType: p().string,
                    isPlace: p().bool,
                    isPrivateServer: p().bool,
                    expectedPromoId: p().number,
                    userAssetId: p().number,
                    showSuccessBanner: p().bool,
                    handlePurchase: p().func,
                    onPurchaseSuccess: p().func,
                    customProps: p().func,
                    collectibleItemId: p().string,
                    collectibleItemInstanceId: p().string,
                    collectibleProductId: p().string,
                    isLimited: p().bool,
                    saleLocationId: p().number,
                    rentalOptionDays: p().number,
                    discountInformation: p().shape({
                        originalPrice: p().number,
                        totalDiscountAmount: p().number,
                        totalDiscountPercentage: p().number,
                        discounts: p().arrayOf(p().shape({
                            discountAmount: p().number,
                            discountPercentage: p().number,
                            discountCampaign: p().string,
                            localizedDiscountAttribution: p().string
                        }))
                    }),
                    subscriptionTargetKey: p().string,
                    subscriptionPaymentProvider: p().string,
                    subscriptionSecondaryPaymentProvider: p().string,
                    subscriptionTitle: p().string,
                    primaryActionButtonText: p().string,
                    secondaryActionButtonText: p().string,
                    subscriptionFooterDisclaimer: p().string,
                    subscriptionCancelPath: p().string,
                    displayPrice: p().string,
                    priceSuffix: p().string,
                    subscriptionProductType: p().string,
                    subscriptionProductId: p().string
                };
                var ei = (0, c.withTranslations)(en, h);
                return [function(t) {
                    return (0, o.jsx)(nT.QueryClientProvider, {
                        client: c.queryClient,
                        children: (0, o.jsx)(ei, sJ({}, t))
                    })
                }, {
                    start: function() {
                        s ? s.open() : M.open(), et()
                    }
                }]
            }
            var s4 = window.Roblox["core-scripts"].meta.user;

            function s6(t, r) {
                (null == r || r > t.length) && (r = t.length);
                for (var n = 0, i = Array(r); n < r; n++) i[n] = t[n];
                return i
            }

            function s8(t) {
                for (var r = 1; r < arguments.length; r++) {
                    var n = null != arguments[r] ? arguments[r] : {},
                        i = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (i = i.concat(Object.getOwnPropertySymbols(n).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(n, t).enumerable
                    }))), i.forEach(function(r) {
                        var i;
                        i = n[r], r in t ? Object.defineProperty(t, r, {
                            value: i,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : t[r] = i
                    })
                }
                return t
            }
            var s5 = function(t, r) {
                    var n, i, a, o = (n = s8({}, t), i = i = {
                        expectedSellerId: r.expectedSellerId,
                        owned: r.owned,
                        id: r.id,
                        itemType: r.itemType,
                        assetType: r.assetType,
                        name: r.name,
                        description: r.description,
                        productId: r.productId,
                        price: r.price,
                        lowestPrice: r.lowestPrice,
                        creatorTargetId: r.creatorTargetId,
                        creatorName: r.creatorName,
                        hasLimitedPrivateSales: void 0 !== r.lowestPrice,
                        isPublicDomain: 0 === r.price,
                        offSaleDeadline: r.offSaleDeadline,
                        isLimited: r.itemRestrictions.includes("Limited") || r.itemRestrictions.includes("LimitedUnique"),
                        collectibleItemId: r.collectibleItemId,
                        collectibleItemDetails: r.collectibleItemDetails,
                        unitsAvailableForConsumption: void 0 !== r.unitsAvailableForConsumption ? r.unitsAvailableForConsumption : 0,
                        priceStatus: null != (a = r.priceStatus) ? a : r.priceStatus,
                        itemRestrictions: r.itemRestrictions
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(i)) : (function(t, r) {
                        var n = Object.keys(t);
                        if (Object.getOwnPropertySymbols) {
                            var i = Object.getOwnPropertySymbols(t);
                            n.push.apply(n, i)
                        }
                        return n
                    })(Object(i)).forEach(function(t) {
                        Object.defineProperty(n, t, Object.getOwnPropertyDescriptor(i, t))
                    }), n);
                    return void 0 !== r.premiumPricing && (o.premiumPriceInRobux = r.premiumPricing.premiumPriceInRobux, o.premiumDiscountPercentage = r.premiumPricing.premiumDiscountPercentage), o.isLimited && (o.price = void 0 !== o.lowestPrice ? o.lowestPrice : o.price), void 0 !== o.collectibleItemId && (o.resellerAvailable = r.hasResellers, o.isPurchasable = void 0 !== r.lowestPrice, o.isMarketPlaceEnabled = "ShopAndAllExperiences" === r.saleLocationType || "ShopOnly" === r.saleLocationType), o
                },
                s7 = function(t, r) {
                    var n = s8({}, t);
                    if (n.resellerAvailable = r.data.data.length > 0, n.resellerAvailable) {
                        var i, a = (i = r.data.data, function(t) {
                            if (Array.isArray(t)) return t
                        }(i) || function(t, r) {
                            var n, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                            if (null != a) {
                                var o = [],
                                    s = !0,
                                    l = !1;
                                try {
                                    for (a = a.call(t); !(s = (n = a.next()).done) && (o.push(n.value), o.length !== r); s = !0);
                                } catch (t) {
                                    l = !0, i = t
                                } finally {
                                    try {
                                        s || null == a.return || a.return()
                                    } finally {
                                        if (l) throw i
                                    }
                                }
                                return o
                            }
                        }(i, 1) || function(t, r) {
                            if (t) {
                                if ("string" == typeof t) return s6(t, 1);
                                var n = Object.prototype.toString.call(t).slice(8, -1);
                                if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return s6(t, r)
                            }
                        }(i, 1) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0];
                        n.price = a.price, n.firstReseller = a
                    }
                    return n
                },
                s9 = function(t, r, n) {
                    var i = s8({}, t);
                    return !r.purchasable && r.reason && r.reason !== w.insufficientFunds && r.reason !== w.twoStepVerificationRequired ? i.isPurchasable = r.purchasable : (!r.purchasable && r.reason && r.reason === w.twoStepVerificationRequired && (i.twoStepVerificationRequired = !0), i.isPurchasable = !0), i.assetTypeDisplayName = r.assetTypeDisplayName, i.loading = !1, i.loadFailure = !1, i.isMarketPlaceEnabled = n.data.isMarketPlaceEnabled && n.data.isItemsXchangeEnabled, i
                },
                le = function(t) {
                    var r = s8({}, t);
                    return r.isPurchasable = !1, r
                },
                lt = ((r = lt || {}).Asset = "asset", r.Bundle = "bundle", r);

            function lr(t, r) {
                (null == r || r > t.length) && (r = t.length);
                for (var n = 0, i = Array(r); n < r; n++) i[n] = t[n];
                return i
            }

            function ln(t, r, n, i, a, o, s) {
                try {
                    var l = t[o](s),
                        c = l.value
                } catch (t) {
                    n(t);
                    return
                }
                l.done ? r(c) : Promise.resolve(c).then(i, a)
            }

            function li(t) {
                return function() {
                    var r = this,
                        n = arguments;
                    return new Promise(function(i, a) {
                        var o = t.apply(r, n);

                        function s(t) {
                            ln(o, i, a, s, l, "next", t)
                        }

                        function l(t) {
                            ln(o, i, a, s, l, "throw", t)
                        }
                        s(void 0)
                    })
                }
            }

            function la(t, r) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, r) {
                    var n, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var o = [],
                            s = !0,
                            l = !1;
                        try {
                            for (a = a.call(t); !(s = (n = a.next()).done) && (o.push(n.value), !r || o.length !== r); s = !0);
                        } catch (t) {
                            l = !0, i = t
                        } finally {
                            try {
                                s || null == a.return || a.return()
                            } finally {
                                if (l) throw i
                            }
                        }
                        return o
                    }
                }(t, r) || function(t, r) {
                    if (t) {
                        if ("string" == typeof t) return lr(t, r);
                        var n = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return lr(t, r)
                    }
                }(t, r) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function lo(t, r) {
                var n, i, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return s.next = l(0), s.throw = l(1), s.return = l(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
                    return this
                }), s;

                function l(l) {
                    return function(c) {
                        var u = [l, c];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; s && (s = 0, u[0] && (o = 0)), o;) try {
                            if (n = 1, i && (a = 2 & u[0] ? i.return : u[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, u[1])).done) return a;
                            switch (i = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                case 0:
                                case 1:
                                    a = u;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, i = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                        o.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && o.label < a[1]) {
                                        o.label = a[1], a = u;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(u);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            u = r.call(t, o)
                        } catch (t) {
                            u = [6, t], i = 0
                        } finally {
                            n = a = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var ls = function(t) {
                    var r = la((0, u.useState)(), 2),
                        n = r[0],
                        i = r[1],
                        a = la((0, u.useState)([]), 2),
                        o = a[0],
                        s = a[1],
                        l = la((0, u.useState)({}), 2),
                        c = l[0],
                        d = l[1],
                        f = 0,
                        p = function() {
                            f < 5 ? (b(), f += 1) : s([{
                                loading: !1,
                                loadFailure: !0
                            }])
                        },
                        m = (0, u.useCallback)(function() {
                            (0, s4.isAuthenticated)() ? nB().then(function(t) {
                                i(t)
                            }).catch(function() {
                                p()
                            }): i({
                                data: {
                                    isMarketplaceEnabled: !1,
                                    isItemsXchangeEnabled: !1
                                }
                            })
                        }, []);

                    function h(t) {
                        return li(function() {
                            var r, i, a;
                            return lo(this, function(o) {
                                switch (o.label) {
                                    case 0:
                                        if (t.inCache) return [2, c[t.itemType.toLowerCase()][t.id]];
                                        if (!(r = s5({}, t)).isLimited) return [3, 4];
                                        o.label = 1;
                                    case 1:
                                        return o.trys.push([1, 3, , 4]), [4, nU(r.id)];
                                    case 2:
                                        return i = o.sent(), r = s7(r, i), [3, 4];
                                    case 3:
                                        return o.sent(), r.resellerAvailable = !1, [3, 4];
                                    case 4:
                                        if (void 0 === t.productId) return [3, 8];
                                        if (!(0, s4.isAuthenticated)()) return [3, 7];
                                        if (void 0 !== r.collectibleItemId) return [3, 6];
                                        return [4, n_(t.productId)];
                                    case 5:
                                        a = o.sent(), r = s9(r, a.data, n), o.label = 6;
                                    case 6:
                                        return [3, 8];
                                    case 7:
                                        r = le(r), o.label = 8;
                                    case 8:
                                        return [2, r]
                                }
                            })
                        })()
                    }
                    var b = (0, u.useCallback)(function() {
                        li(function() {
                            var r, n, i, a;
                            return lo(this, function(o) {
                                switch (o.label) {
                                    case 0:
                                        if (r = [], t.forEach(function(t) {
                                                void 0 === c[t.itemType.toLowerCase()][t.id] && r.push(t)
                                            }), !(r.length > 0)) return [3, 2];
                                        return i = [], r.map(function(t) {
                                            return i.push({
                                                itemType: t.itemType,
                                                id: t.id
                                            })
                                        }), [4, nA.ItemDetailsHydrationService.getItemDetails(i, !1, !0)];
                                    case 1:
                                        n = o.sent(), o.label = 2;
                                    case 2:
                                        return a = [], t.forEach(function(t) {
                                            if (void 0 === c[t.itemType.toLowerCase()][t.id]) {
                                                var r = n.find(function(r) {
                                                    return r.id === t.id && r.itemType.toLowerCase() === t.itemType.toLowerCase()
                                                });
                                                r && a.push(r)
                                            } else a.push({
                                                id: t.id,
                                                itemType: t.itemType,
                                                inCache: !0
                                            })
                                        }), [2, a]
                                }
                            })
                        })().then(function(t) {
                            try {
                                li(function() {
                                    var r, n;
                                    return lo(this, function(i) {
                                        switch (i.label) {
                                            case 0:
                                                return i.trys.push([0, 2, , 3]), [4, Promise.all(t.map(function(t) {
                                                    return h(t)
                                                }))];
                                            case 1:
                                                return s(r = i.sent()), n = c, r.forEach(function(t) {
                                                    t.isLimited || c[t.itemType.toLowerCase()][t.id] || (n[t.itemType.toLowerCase()][t.id] = t)
                                                }), d(n), [3, 3];
                                            case 2:
                                                return i.sent(), p(), [3, 3];
                                            case 3:
                                                return [2]
                                        }
                                    })
                                })()
                            } catch (t) {
                                p()
                            }
                        }).catch(function() {
                            p()
                        })
                    }, [n, t, h]);
                    return (0, u.useEffect)(function() {
                        var t = {};
                        t[lt.Asset] = {}, t[lt.Bundle] = {}, d(t), m()
                    }, []), (0, u.useEffect)(function() {
                        void 0 !== n && b()
                    }, [n, t]), {
                        itemDetails: o,
                        batchLoadItemDetails: b
                    }
                },
                ll = window.RobloxThumbnails,
                lc = ((i = lc || {}).Success = "Success", i.AlreadyOwned = "ALREADY_OWNED", i.InsufficientFunds = "INSUFFICIENT_ROBUX", i.ExceptionOccured = "INTERNAL", i.TooManyPurchases = "QUOTA_EXCEEDED", i.CaughtError = "CaughtError", i.PremiumNeeded = "INSUFFICIENT_MEMBERSHIP", i.NoSellers = "NOT_FOR_SALE", i.TwoStepVerificationRequired = "TwoStepVerificationRequired", i.InExperienceOnly = "PURCHASE_PLACE_INVALID", i);

            function lu(t, r) {
                (null == r || r > t.length) && (r = t.length);
                for (var n = 0, i = Array(r); n < r; n++) i[n] = t[n];
                return i
            }

            function ld(t, r, n, i, a, o, s) {
                try {
                    var l = t[o](s),
                        c = l.value
                } catch (t) {
                    n(t);
                    return
                }
                l.done ? r(c) : Promise.resolve(c).then(i, a)
            }

            function lf(t, r) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, r) {
                    var n, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var o = [],
                            s = !0,
                            l = !1;
                        try {
                            for (a = a.call(t); !(s = (n = a.next()).done) && (o.push(n.value), !r || o.length !== r); s = !0);
                        } catch (t) {
                            l = !0, i = t
                        } finally {
                            try {
                                s || null == a.return || a.return()
                            } finally {
                                if (l) throw i
                            }
                        }
                        return o
                    }
                }(t, r) || function(t, r) {
                    if (t) {
                        if ("string" == typeof t) return lu(t, r);
                        var n = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return lu(t, r)
                    }
                }(t, r) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var lp = "lookId";

            function lm(t) {
                var r = t.itemsCount,
                    n = t.item,
                    i = t.index,
                    a = t.timedOption,
                    s = t.translate,
                    l = n.name;
                return (0, o.jsxs)("div", {
                    className: "modal-multi-item-image-container",
                    children: [a && (0, o.jsx)("div", {
                        className: "timed-options-badge-container",
                        children: (0, o.jsx)(iK, {
                            variant: "Neutral",
                            icon: "icon-regular-clock",
                            className: "bg-surface-0",
                            label: (null == a ? void 0 : a.days) ? s(v.timedOptionDaysAbbreviation, {
                                days: a.days
                            }) : ""
                        })
                    }), (0, o.jsx)(ll.Thumbnail2d, {
                        type: n.itemType.toLowerCase() === lt.Bundle ? ll.ThumbnailTypes.bundleThumbnail : ll.ThumbnailTypes.assetThumbnail,
                        size: ll.DefaultThumbnailSize,
                        targetId: n.id,
                        containerClass: "batch-buy-thumbnail",
                        format: ll.ThumbnailFormat.webp,
                        altName: l
                    }), r > 3 && 2 === i && (0, o.jsx)("div", {
                        className: "thumb-overlay",
                        children: (0, o.jsxs)("div", {
                            className: "font-header-1",
                            children: ["＋", r - 3]
                        })
                    })]
                })
            }
            var lh = function(t, r) {
                var n, i = lf(r.split("/"), 4),
                    a = i[2],
                    o = Math.ceil(i[3] / 60);
                if (o > 24) {
                    var s, l = Math.ceil(o / 24);
                    return {
                        success: !1,
                        message: "Text.EconomicRestrictionsDaysGeneral",
                        params: {
                            violation: t(null != (s = x[a]) ? s : "Label.Sublabel.FraudPaymentAbuse"),
                            day: l
                        }
                    }
                }
                return {
                    success: !1,
                    message: "Text.EconomicRestrictionsHoursGeneral",
                    params: {
                        violation: t(null != (n = x[a]) ? n : "Label.Sublabel.FraudPaymentAbuse"),
                        hour: o
                    }
                }
            };

            function lb(t, r) {
                (null == r || r > t.length) && (r = t.length);
                for (var n = 0, i = Array(r); n < r; n++) i[n] = t[n];
                return i
            }
            var ly = window.Roblox["core-scripts"].guac;

            function lv(t, r) {
                (null == r || r > t.length) && (r = t.length);
                for (var n = 0, i = Array(r); n < r; n++) i[n] = t[n];
                return i
            }

            function lg(t, r) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, r) {
                    var n, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var o = [],
                            s = !0,
                            l = !1;
                        try {
                            for (a = a.call(t); !(s = (n = a.next()).done) && (o.push(n.value), !r || o.length !== r); s = !0);
                        } catch (t) {
                            l = !0, i = t
                        } finally {
                            try {
                                s || null == a.return || a.return()
                            } finally {
                                if (l) throw i
                            }
                        }
                        return o
                    }
                }(t, r) || function(t, r) {
                    if (t) {
                        if ("string" == typeof t) return lv(t, r);
                        var n = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return lv(t, r)
                    }
                }(t, r) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var lw = lg(B(), 2),
                lx = lw[0],
                lS = lw[1],
                lP = lg(function() {
                    var t = lf((0, m.createModal)(), 2),
                        r = t[0],
                        n = t[1];

                    function i(t) {
                        var n, i, a = t.translate,
                            s = t.title,
                            l = t.expectedTotalPrice,
                            c = t.items,
                            f = t.itemDetails,
                            p = t.currentRobuxBalance,
                            m = t.purchaseMetadata,
                            h = t.onCancel,
                            b = t.onTransactionComplete,
                            y = t.onAction,
                            g = t.loading,
                            w = t.productSurface,
                            x = t.systemFeedbackService,
                            S = lf((0, u.useState)(!1), 2),
                            P = S[0],
                            I = S[1],
                            A = function() {
                                x.loading(a("Message.TwoStepVerificationBatchPurchase")), I(!0)
                            },
                            O = lf((0, u.useState)(!1), 2),
                            j = O[0],
                            N = O[1],
                            R = {
                                itemCount: f.length,
                                robux: (0, E.renderToString)((0, o.jsx)("span", {
                                    className: "robux-price",
                                    children: (0, o.jsx)(_, {
                                        price: l
                                    })
                                }))
                            },
                            C = v.batchBuyPromptMessage;
                        0 === l ? (n = a(v.getItemHeading), i = a(v.getNowAction)) : (n = a(v.buyItemHeading), i = a(v.buyNowAction));
                        var M = null == f ? void 0 : f.slice(0, 3);

                        function D(t) {
                            var r, n = function(t, r, n) {
                                var i = 0,
                                    a = [];
                                if (!r) return {
                                    success: !1,
                                    message: v.purchaseErrorFailureMessage
                                };
                                if (200 === r.status) {
                                    if (r.data && r.data.message && r.data.message.startsWith("Error/EconomicRestrictions")) return lh(t, r.data.message);
                                    if (r.data.fulfillmentGroups[0].lineItems.forEach(function(t) {
                                            if ("SUCCEEDED" === t.status) i += 1;
                                            else {
                                                var r = a.find(function(r) {
                                                    return r.error === t.errorReason
                                                });
                                                r ? r.count += 1 : a.push({
                                                    error: t.errorReason,
                                                    count: 1
                                                })
                                            }
                                        }), i === r.data.fulfillmentGroups[0].lineItems.length) return {
                                        success: !0,
                                        message: v.purchaseCompleteHeading
                                    };
                                    var o = {
                                        error: "",
                                        count: 0
                                    };
                                    if (a.forEach(function(t) {
                                            t.count > o.count && (o = t)
                                        }), i > 0) switch (o.error) {
                                        case lc.AlreadyOwned:
                                            return {
                                                success: !1, message: v.batchBuyPartialSuccessItemsOwnedFailureMessage, params: {
                                                    itemCountSuccess: i,
                                                    itemCountFailure: o.count
                                                }
                                            };
                                        case lc.InsufficientFunds:
                                            return {
                                                success: !1, message: v.batchBuyPartialSuccessInsufficientFundsFailureMessage, params: {
                                                    itemCountSuccess: i,
                                                    itemCountFailure: o.count
                                                }
                                            };
                                        case lc.ExceptionOccured:
                                            return {
                                                success: !1, message: v.batchBuyPartialSuccessNetworkErrorFailureMessage, params: {
                                                    itemCountSuccess: i,
                                                    itemCountFailure: o.count
                                                }
                                            };
                                        case lc.TooManyPurchases:
                                            return {
                                                success: !1, message: v.batchBuyPartialSuccessFloodcheckFailureMessage, params: {
                                                    itemCountSuccess: i,
                                                    itemCountFailure: o.count
                                                }
                                            };
                                        case lc.PremiumNeeded:
                                            return {
                                                success: !1, message: v.batchBuyPartialSuccessPremiumNeededFailureMessage, params: {
                                                    itemCountSuccess: i,
                                                    itemCountFailure: o.count
                                                }
                                            };
                                        case lc.NoSellers:
                                            return {
                                                success: !1, message: v.batchBuyPartialSuccessNoSellersFailureMessage, params: {
                                                    itemCountSuccess: i,
                                                    itemCountFailure: o.count
                                                }
                                            };
                                        case lc.InExperienceOnly:
                                            return {
                                                success: !1, message: v.batchBuyPartialSuccessInExperienceOnlyFailureMessage, params: {
                                                    itemCountSuccess: i,
                                                    itemCountFailure: o.count
                                                }
                                            };
                                        default:
                                            return {
                                                success: !1, message: v.batchBuyPartialSuccessGeneralFailureMessage, params: {
                                                    itemCountSuccess: i,
                                                    itemCountFailure: o.count
                                                }
                                            }
                                    }
                                    switch (o.error) {
                                        case lc.AlreadyOwned:
                                            return {
                                                success: !1, message: v.batchBuyItemsOwnedFailureMessage
                                            };
                                        case lc.InsufficientFunds:
                                            return {
                                                success: !1, message: v.insufficientFundsFailureMessage
                                            };
                                        case lc.ExceptionOccured:
                                            return {
                                                success: !1, message: v.networkErrroFailureMessage
                                            };
                                        case lc.TooManyPurchases:
                                            return {
                                                success: !1, message: v.floodcheckFailureMessage, params: {
                                                    throttleTime: 5
                                                }
                                            };
                                        case lc.PremiumNeeded:
                                            return {
                                                success: !1, message: v.premiumNeededFailureMessage
                                            };
                                        case lc.NoSellers:
                                            return {
                                                success: !1, message: v.noSellersFailureMessage
                                            };
                                        case lc.InExperienceOnly:
                                            return {
                                                success: !1, message: v.inExperienceOnlyFailureMessage
                                            }
                                    }
                                } else if (403 === r.status && r.data.message.includes("2sv")) n();
                                else if (400 === r.status && r.data.message.includes("InsufficientTotalBalance")) return {
                                    success: !1,
                                    message: v.insufficientFundsFailureMessage
                                };
                                return {
                                    success: !1,
                                    message: v.purchaseErrorFailureMessage
                                }
                            }(a, t, A);
                            r = n.params ? a(n.message, n.params) : a(n.message), n.success ? x.success(r) : x.warning(r)
                        }
                        var k = (0, o.jsxs)(u.Fragment, {
                            children: [(0, o.jsx)("div", {
                                className: "modal-message multi-item",
                                dangerouslySetInnerHTML: {
                                    __html: a(C, R)
                                }
                            }), void 0 !== f && f.length > 0 && (0, o.jsx)("div", {
                                className: "modal-multi-item-images-container",
                                children: M.map(function(t, r) {
                                    var n = c.find(function(r) {
                                        return r.id === t.id && r.itemType === t.itemType
                                    });
                                    return (0, o.jsx)(lm, {
                                        itemsCount: f.length,
                                        item: t,
                                        index: r,
                                        timedOption: null == n ? void 0 : n.timedOption,
                                        translate: a
                                    }, t.itemId)
                                })
                            })]
                        });
                        return (0, o.jsxs)(d().Fragment, {
                            children: [(0, o.jsx)(n$, {
                                isTwoStepVerificationActive: P,
                                stopTwoStepVerification: function() {
                                    N(!0), I(!1)
                                },
                                systemFeedbackService: x
                            }), (0, o.jsx)(r, {
                                title: s || n,
                                body: k,
                                neutralButtonText: a(v.cancelAction),
                                actionButtonText: i,
                                onAction: function() {
                                    var t, r = !1;
                                    (f.forEach(function(t) {
                                        r = r || t.twoStepVerificationRequired
                                    }), r && !j) ? A(): ((t = function() {
                                        var t, r, n, i, a, o, s, l, u, d;
                                        return function(t, r) {
                                            var n, i, a, o = {
                                                    label: 0,
                                                    sent: function() {
                                                        if (1 & a[0]) throw a[1];
                                                        return a[1]
                                                    },
                                                    trys: [],
                                                    ops: []
                                                },
                                                s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                            return s.next = l(0), s.throw = l(1), s.return = l(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
                                                return this
                                            }), s;

                                            function l(l) {
                                                return function(c) {
                                                    var u = [l, c];
                                                    if (n) throw TypeError("Generator is already executing.");
                                                    for (; s && (s = 0, u[0] && (o = 0)), o;) try {
                                                        if (n = 1, i && (a = 2 & u[0] ? i.return : u[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, u[1])).done) return a;
                                                        switch (i = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                                            case 0:
                                                            case 1:
                                                                a = u;
                                                                break;
                                                            case 4:
                                                                return o.label++, {
                                                                    value: u[1],
                                                                    done: !1
                                                                };
                                                            case 5:
                                                                o.label++, i = u[1], u = [0];
                                                                continue;
                                                            case 7:
                                                                u = o.ops.pop(), o.trys.pop();
                                                                continue;
                                                            default:
                                                                if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                                    o = 0;
                                                                    continue
                                                                }
                                                                if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                                                    o.label = u[1];
                                                                    break
                                                                }
                                                                if (6 === u[0] && o.label < a[1]) {
                                                                    o.label = a[1], a = u;
                                                                    break
                                                                }
                                                                if (a && o.label < a[2]) {
                                                                    o.label = a[2], o.ops.push(u);
                                                                    break
                                                                }
                                                                a[2] && o.ops.pop(), o.trys.pop();
                                                                continue
                                                        }
                                                        u = r.call(t, o)
                                                    } catch (t) {
                                                        u = [6, t], i = 0
                                                    } finally {
                                                        n = a = 0
                                                    }
                                                    if (5 & u[0]) throw u[1];
                                                    return {
                                                        value: u[0] ? u[1] : void 0,
                                                        done: !0
                                                    }
                                                }
                                            }
                                        }(this, function(p) {
                                            switch (p.label) {
                                                case 0:
                                                    t = {
                                                        strategy: "BEST_EFFORT",
                                                        lineItems: []
                                                    }, r = [], n = [], f.forEach(function(t) {
                                                        var i = {};
                                                        if (void 0 !== t.collectibleItemId) {
                                                            var a = c.find(function(r) {
                                                                return r.id === t.id && r.itemType === t.itemType
                                                            });
                                                            !("ExperiencesDevApiOnly" !== t.collectibleItemDetails.saleLocationType && t.collectibleItemDetails.unitsAvailableForConsumption > 0 && (!t.collectibleItemDetails.hasResellers || t.collectibleItemDetails.price < t.collectibleItemDetails.lowestResalePrice)) && t.collectibleItemDetails.lowestAvailableResaleProductId ? i.collectibleProductId = t.collectibleItemDetails.lowestAvailableResaleProductId : i.collectibleProductId = t.collectibleItemDetails.collectibleProductId, (null == a ? void 0 : a.timedOption) ? (i.rentalOption = {
                                                                durationDays: a.timedOption.days
                                                            }, i.agreedPriceRobux = a.timedOption.price) : i.agreedPriceRobux = t.collectibleItemDetails.lowestPrice
                                                        } else void 0 !== t.firstReseller ? (i.limitedV1InstanceId = "".concat(t.firstReseller.userAssetId), i.agreedPriceRobux = t.firstReseller.price) : (i.virtualEconomyProductId = "".concat(t.productId), i.agreedPriceRobux = t.premiumPriceInRobux && (0, s4.isPremiumUser)() ? t.premiumPriceInRobux : t.price);
                                                        r.push(i);
                                                        var o = {
                                                            data: {
                                                                itemData: {},
                                                                reason: ""
                                                            }
                                                        };
                                                        "Asset" === t.itemType ? o.data.itemData.assetId = t.id : o.data.itemData.bundleId = t.id, n.push(o)
                                                    }), t.lineItems = r, i = m.has(lp) ? m.get(lp) : "", a = T.uuidService.generateRandomUuid(), o = void 0 !== i && "" !== i ? "web_looks_purchase-".concat(i, "-").concat(a) : a, p.label = 1;
                                                case 1:
                                                    return p.trys.push([1, 3, , 4]), [4, nF(nA.CurrentUser.userId, w, t, o)];
                                                case 2:
                                                    if ((l = (s = p.sent()).data).message && l.message.startsWith("Error/EconomicRestrictions")) return D(s), b(n), [2];
                                                    return u = 0, l.fulfillmentGroups[0].lineItems.forEach(function(t) {
                                                        n[u].data.reason = "SUCCEEDED" === t.status ? "Success" : t.errorReason, u += 1
                                                    }), [3, 4];
                                                case 3:
                                                    return s = p.sent(), d = 0, n.forEach(function(t) {
                                                        s && (n[d].data.reason = null == s ? void 0 : s.data.message), d += 1
                                                    }), [3, 4];
                                                case 4:
                                                    return D(s), b(n), [2]
                                            }
                                        })
                                    }, function() {
                                        var r = this,
                                            n = arguments;
                                        return new Promise(function(i, a) {
                                            var o = t.apply(r, n);

                                            function s(t) {
                                                ld(o, i, a, s, l, "next", t)
                                            }

                                            function l(t) {
                                                ld(o, i, a, s, l, "throw", t)
                                            }
                                            s(void 0)
                                        })
                                    })(), y())
                                },
                                onNeutral: function() {
                                    h()
                                },
                                footerText: (0, o.jsx)(V, {
                                    expectedPrice: l,
                                    currentRobuxBalance: p
                                }),
                                loading: g,
                                actionButtonShow: f
                            })]
                        })
                    }
                    return i.defaultProps = {
                        title: "",
                        loading: !1
                    }, i.propTypes = {
                        translate: p().func.isRequired,
                        title: p().string,
                        expectedTotalPrice: p().number.isRequired,
                        items: p().arrayOf(p().shape({
                            itemName: p().string.isRequired,
                            itemType: p().string.isRequired,
                            timedOption: p().shape({
                                days: p().number.isRequired,
                                price: p().number.isRequired
                            })
                        })).isRequired,
                        currentRobuxBalance: p().number.isRequired,
                        purchaseMetadata: p().instanceOf(Map).isRequired,
                        itemDetails: p().arrayOf(p().shape({
                            productId: p().number.isRequired,
                            price: p().number.isRequired,
                            itemName: p().string.isRequired,
                            itemType: p().string.isRequired,
                            assetTypeDisplayName: p().string.isRequired,
                            sellerName: p().string.isRequired,
                            expectedSellerId: p().number.isRequired,
                            isPurchasable: p().bool.isRequired,
                            isOwned: p().bool.isRequired,
                            isPlugin: p().bool.isRequired,
                            itemDetailItemId: p().number.isRequired,
                            loading: p().bool.isRequired,
                            userQualifiesForPremiumPrices: p().bool.isRequired,
                            premiumPriceInRobux: p().number.isRequired,
                            isAuthenticated: p().bool.isRequired,
                            resellerAvailable: p().bool.isRequired,
                            firstReseller: p().shape({
                                seller: {
                                    name: p().string.isRequired,
                                    id: p().number.isRequired
                                },
                                userAssetId: p().number.isRequired
                            }).isRequired,
                            isMarketPlaceEnabled: p().bool.isRequired
                        })).isRequired,
                        onCancel: p().func.isRequired,
                        onTransactionComplete: p().func.isRequired,
                        onAction: p().func.isRequired,
                        loading: p().bool,
                        productSurface: p().string.isRequired,
                        systemFeedbackService: p().func.isRequired
                    }, [(0, c.withTranslations)(i, h), n]
                }(), 2),
                lE = lP[0],
                lI = lP[1],
                lA = lg(function() {
                    var t, r = (t = (0, m.createModal)(), function(t) {
                            if (Array.isArray(t)) return t
                        }(t) || function(t, r) {
                            var n, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                            if (null != a) {
                                var o = [],
                                    s = !0,
                                    l = !1;
                                try {
                                    for (a = a.call(t); !(s = (n = a.next()).done) && (o.push(n.value), o.length !== r); s = !0);
                                } catch (t) {
                                    l = !0, i = t
                                } finally {
                                    try {
                                        s || null == a.return || a.return()
                                    } finally {
                                        if (l) throw i
                                    }
                                }
                                return o
                            }
                        }(t, 2) || function(t, r) {
                            if (t) {
                                if ("string" == typeof t) return lb(t, 2);
                                var n = Object.prototype.toString.call(t).slice(8, -1);
                                if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return lb(t, r)
                            }
                        }(t, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        n = r[0],
                        i = r[1];

                    function a(t) {
                        var r = t.translate,
                            i = t.onContinueToPayment,
                            a = r(v.redirectToPartnerWebsiteMessage, {
                                linebreak: "\n\n"
                            }) || "This purchase must be completed on our partner’s website. You will be returned to Roblox after the purchase is completed.\n\n Proceed to partner website for payment?",
                            s = (0, o.jsx)("p", {
                                className: "modal-body",
                                children: a
                            });
                        return (0, o.jsx)(n, {
                            title: r(v.leavingRobloxHeading) || "Leaving Roblox",
                            body: s,
                            neutralButtonText: r(v.cancelAction),
                            actionButtonText: r(v.continueToPaymentAction) || "Continue To Payment",
                            onAction: function() {
                                I.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(I.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, I.paymentFlowAnalyticsService.ENUM_VIEW_NAME.LEAVE_ROBLOX_WARNING, I.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, I.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.CONTINUE_TO_VNG), i()
                            },
                            onClose: function() {
                                I.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(I.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, I.paymentFlowAnalyticsService.ENUM_VIEW_NAME.LEAVE_ROBLOX_WARNING, I.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, I.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.CANCEL)
                            },
                            actionButtonShow: !0
                        })
                    }
                    return a.defaultProps = {
                        onContinueToPayment: null
                    }, a.propTypes = {
                        translate: p().func.isRequired,
                        onContinueToPayment: p().func
                    }, [(0, c.withTranslations)(a, h), i]
                }(), 2),
                lT = lA[0],
                lO = lA[1];

            function lj(t) {
                var r = t.currentUserBalance,
                    n = t.items,
                    i = t.itemDetails,
                    a = t.purchaseMetadata,
                    s = t.onBuyButtonClick,
                    l = t.onConfirm,
                    c = t.onCancel,
                    f = t.onTransactionComplete,
                    p = t.productSurface,
                    h = t.displayPriceOnButton,
                    b = t.systemFeedbackService,
                    y = t.translate,
                    g = t.variant,
                    w = void 0 === g ? m.Button.variants.growth : g,
                    x = t.size,
                    S = void 0 === x ? m.Button.sizes.large : x,
                    P = !1,
                    E = 0,
                    I = 0,
                    A = [],
                    O = lg((0, u.useState)(!1), 2),
                    j = O[0],
                    R = O[1],
                    C = lg((0, u.useState)(!1), 2),
                    D = C[0],
                    L = C[1],
                    _ = lg((0, u.useState)(null), 2),
                    U = _[0],
                    B = _[1],
                    q = lg((0, u.useState)(null), 2),
                    z = q[0],
                    V = q[1],
                    G = function() {
                        var t = {
                            ReturnUrl: window.location.pathname
                        };
                        return T.urlService.getUrlWithQueries("/login", t)
                    };
                if ((0, u.useEffect)(function() {
                        (0, ly.callBehaviour)("vng-buy-robux").then(function(t) {
                            L(t.shouldShowVng)
                        }).catch(function(t) {
                            console.debug(t), L(!1)
                        })
                    }, []), !(0, s4.isAuthenticated)()) return (0, o.jsx)("div", {
                    className: "sign-in",
                    children: (0, o.jsx)(m.Button, {
                        className: "action-button batch-buy-purchase-button sign-in-button",
                        variant: w,
                        size: S,
                        onClick: function() {
                            window.location = G()
                        },
                        children: y(v.buyAction)
                    })
                });
                if (void 0 === i || i.length > 0 && i[0] && i[0].loading || void 0 === r) return (0, o.jsx)("div", {
                    className: "loading",
                    children: (0, o.jsx)(m.Button, {
                        className: "action-button batch-buy-purchase-button",
                        variant: w,
                        size: S,
                        isDisabled: !0,
                        children: (0, o.jsx)(m.Loading, {})
                    })
                });
                if (0 === i.length || i[0] && i[0].loadFailure) return (0, o.jsx)(m.Button, {
                    className: "action-button batch-buy-purchase-button",
                    variant: w,
                    size: S,
                    isDisabled: !0,
                    children: h ? (0, o.jsxs)("div", {
                        className: "purchase-price",
                        children: [(0, o.jsx)("span", {
                            className: "icon-robux-white-28x28"
                        }), (0, o.jsx)("span", {
                            className: "purchase-price-text text-robux-lg",
                            children: (0, F.formatNumber)(E)
                        })]
                    }) : (0, o.jsx)("div", {
                        children: y(v.buyAction)
                    })
                });
                i.forEach(function(t) {
                    (void 0 !== t.collectibleItemId ? t.isMarketPlaceEnabled && t.isPurchasable || t.resellerAvailable : t.isMarketPlaceEnabled && (t.resellerAvailable || t.isPurchasable)) && (P = !0);
                    var r = n.find(function(r) {
                        return r.id === t.id && r.itemType === t.itemType
                    });
                    (null == r ? void 0 : r.timedOption) ? E += r.timedOption.price: void 0 !== t.collectibleItemDetails ? t.collectibleItemDetails.lowestPrice ? E += t.collectibleItemDetails.lowestPrice : t.collectibleItemId.price && (E += t.collectibleItemDetails.price) : t.premiumPriceInRobux && (0, s4.isPremiumUser)() ? I += t.premiumPriceInRobux : t.lowestPrice ? E += t.lowestPrice : t.price && (E += t.price), t.resellerAvailable && A.push(t)
                });
                var H = E + I - r,
                    W = (0, o.jsx)(m.Loading, {});
                j || (W = h ? (0, o.jsxs)("div", {
                    className: "purchase-price",
                    children: [(0, o.jsx)("span", {
                        className: "icon-robux-white-28x28"
                    }), (0, o.jsx)("span", {
                        className: "purchase-price-text text-robux-lg",
                        children: (0, F.formatNumber)(E)
                    })]
                }) : (0, o.jsx)("div", {
                    children: y(v.buyAction)
                }));
                var X = function() {
                    D ? lO.open() : window.location = M("")
                };
                return (0, o.jsxs)(d().Fragment, {
                    children: [(0, o.jsx)("div", {
                        className: "batch-buy-purchase-button-container",
                        children: (0, o.jsx)(m.Button, {
                            className: "action-button batch-buy-purchase-button",
                            variant: w,
                            size: S,
                            onClick: function() {
                                H > 0 ? (V((0, o.jsx)(lx, {
                                    robuxNeeded: H,
                                    onAccept: X
                                })), lS.open()) : (B((0, o.jsx)(lE, {
                                    title: y(v.buyNowAction),
                                    expectedTotalPrice: E + I,
                                    items: n,
                                    purchaseMetadata: a,
                                    itemDetails: i,
                                    resaleItems: A,
                                    currentRobuxBalance: r,
                                    onCancel: function() {
                                        var t;
                                        null == lI || null == (t = lI.close) || t.call(lI), c()
                                    },
                                    onTransactionComplete: function(t) {
                                        R(!1), f(t)
                                    },
                                    onAction: function() {
                                        var t;
                                        null == lI || null == (t = lI.close) || t.call(lI), R(!0), l()
                                    },
                                    loading: !1,
                                    productSurface: p,
                                    systemFeedbackService: b
                                })), lI.open()), s()
                            },
                            isDisabled: !P,
                            children: W
                        })
                    }), H > 0 && (0, o.jsx)("div", {
                        id: "insufficient-funds-modal",
                        children: z
                    }), D && (0, o.jsx)("div", {
                        id: "leave-roblox-warning-modal",
                        children: (0, o.jsx)(lT, {
                            onContinueToPayment: function() {
                                nO.get({
                                    url: "".concat(N, "/vng-payments/v1/getVngShopUrl"),
                                    withCredentials: !0
                                }).then(function(t) {
                                    var r = t.data.vngShopRedirectUrl;
                                    window.open(r, "_blank").focus()
                                }).catch(function() {
                                    window.open(k, "_blank").focus()
                                }), lO.close()
                            }
                        })
                    }), U && (0, o.jsx)("div", {
                        id: "multi-item-purchase-modal",
                        children: U
                    })]
                })
            }
            lj.propTypes = {
                currentUserBalance: p().number.isRequired,
                items: p().arrayOf(p().shape({
                    id: p().number.isRequired,
                    itemType: p().string.isRequired,
                    timedOption: p().shape({
                        days: p().number.isRequired,
                        price: p().number.isRequired
                    })
                })).isRequired,
                purchaseMetadata: p().instanceOf(Map).isRequired,
                itemDetails: p().arrayOf(p().shape({
                    productId: p().number.isRequired,
                    price: p().number.isRequired,
                    itemName: p().string.isRequired,
                    itemType: p().string.isRequired,
                    assetTypeDisplayName: p().string.isRequired,
                    sellerName: p().string.isRequired,
                    expectedSellerId: p().number.isRequired,
                    isPurchasable: p().bool.isRequired,
                    isOwned: p().bool.isRequired,
                    isPlugin: p().bool.isRequired,
                    itemDetailItemId: p().number.isRequired,
                    loading: p().bool.isRequired,
                    loadFailure: p().bool,
                    userQualifiesForPremiumPrices: p().bool.isRequired,
                    premiumPriceInRobux: p().number,
                    isAuthenticated: p().bool.isRequired,
                    resellerAvailable: p().bool.isRequired,
                    firstReseller: p().shape({
                        seller: {
                            name: p().string.isRequired,
                            id: p().number.isRequired
                        },
                        userAssetId: p().number.isRequired
                    }),
                    isMarketPlaceEnabled: p().bool.isRequired
                })).isRequired,
                onBuyButtonClick: p().func.isRequired,
                onConfirm: p().func.isRequired,
                onCancel: p().func.isRequired,
                onTransactionComplete: p().func.isRequired,
                productSurface: p().string.isRequired,
                displayPriceOnButton: p().bool.isRequired,
                systemFeedbackService: p().func.isRequired,
                translate: p().func.isRequired,
                variant: p().string,
                size: p().string
            }, lj.defaultProps = {
                variant: m.Button.variants.growth,
                size: m.Button.sizes.large
            };
            var lN = (0, c.withTranslations)(lj, h);

            function lR(t, r) {
                (null == r || r > t.length) && (r = t.length);
                for (var n = 0, i = Array(r); n < r; n++) i[n] = t[n];
                return i
            }

            function lC(t) {
                var r, n = t.items,
                    i = t.purchaseMetadata,
                    a = t.onBuyButtonClick,
                    s = t.systemFeedbackService,
                    l = t.onConfirm,
                    c = t.onCancel,
                    d = t.onTransactionComplete,
                    f = t.productSurface,
                    p = t.displayPriceOnButton,
                    m = t.translate,
                    h = t.variant,
                    b = t.size,
                    y = (r = (0, u.useState)(void 0), function(t) {
                        if (Array.isArray(t)) return t
                    }(r) || function(t, r) {
                        var n, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                        if (null != a) {
                            var o = [],
                                s = !0,
                                l = !1;
                            try {
                                for (a = a.call(t); !(s = (n = a.next()).done) && (o.push(n.value), o.length !== r); s = !0);
                            } catch (t) {
                                l = !0, i = t
                            } finally {
                                try {
                                    s || null == a.return || a.return()
                                } finally {
                                    if (l) throw i
                                }
                            }
                            return o
                        }
                    }(r, 2) || function(t, r) {
                        if (t) {
                            if ("string" == typeof t) return lR(t, 2);
                            var n = Object.prototype.toString.call(t).slice(8, -1);
                            if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return lR(t, r)
                        }
                    }(r, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    v = y[0],
                    g = y[1],
                    w = function() {
                        nq((0, s4.userId)()).then(function(t) {
                            g(t.data.robux)
                        }).catch(function() {
                            g(void 0)
                        })
                    };
                (0, u.useEffect)(function() {
                    (0, s4.isAuthenticated)() && w()
                }, []);
                var x = ls(n).itemDetails;
                return (0, o.jsx)(lN, {
                    currentUserBalance: v,
                    items: n,
                    itemDetails: x,
                    purchaseMetadata: i,
                    systemFeedbackService: s,
                    onBuyButtonClick: a,
                    onConfirm: l,
                    onCancel: c,
                    onTransactionComplete: d,
                    productSurface: f,
                    displayPriceOnButton: p,
                    translate: m,
                    variant: h,
                    size: b
                })
            }
            n(620), lC.propTypes = {
                items: p().arrayOf(p().object).isRequired,
                purchaseMetadata: p().instanceOf(Map).isRequired,
                onBuyButtonClick: p().func,
                onConfirm: p().func,
                onCancel: p().func,
                onTransactionComplete: p().func,
                systemFeedbackService: p().func.isRequired,
                productSurface: p().string,
                displayPriceOnButton: p().bool,
                translate: p().func.isRequired,
                variant: p().string,
                size: p().string
            }, lC.defaultProps = {
                onBuyButtonClick: function() {},
                onConfirm: function() {},
                onCancel: function() {},
                onTransactionComplete: function(t) {},
                productSurface: "SHOPPING_CART_WEB",
                displayPriceOnButton: !1,
                variant: m.Button.variants.growth,
                size: m.Button.sizes.large
            };
            var lM = (0, c.withTranslations)(lC, h),
                lD = (0, c.withTranslations)(function(t) {
                    var r = t.ItemPurchase,
                        n = t.itemPurchaseService,
                        i = t.innerProps;
                    return d().useEffect(function() {
                        setTimeout(function() {
                            return n.start()
                        }, 70)
                    }, [n]), (0, o.jsx)(r, function(t) {
                        for (var r = 1; r < arguments.length; r++) {
                            var n = null != arguments[r] ? arguments[r] : {},
                                i = Object.keys(n);
                            "function" == typeof Object.getOwnPropertySymbols && (i = i.concat(Object.getOwnPropertySymbols(n).filter(function(t) {
                                return Object.getOwnPropertyDescriptor(n, t).enumerable
                            }))), i.forEach(function(r) {
                                var i;
                                i = n[r], r in t ? Object.defineProperty(t, r, {
                                    value: i,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : t[r] = i
                            })
                        }
                        return t
                    }({}, i))
                }, h);

            function lk(t, r) {
                (null == r || r > t.length) && (r = t.length);
                for (var n = 0, i = Array(r); n < r; n++) i[n] = t[n];
                return i
            }
            var lF = function(t) {
                var r;
                return {
                    originalPrice: t.originalPrice,
                    totalDiscountAmount: t.totalAmountSaved,
                    totalDiscountPercentage: t.totalAmountSaved && t.originalPrice && t.originalPrice > 0 ? t.totalAmountSaved / t.originalPrice : void 0,
                    discounts: null == (r = t.discounts) ? void 0 : r.map(function(t) {
                        var r;
                        return {
                            discountAmount: t.robuxDiscountAmount,
                            discountPercentage: t.robuxDiscountPercentage,
                            discountCampaign: t.discountCampaign,
                            localizedDiscountAttribution: null != (r = t.localizedDiscountAttribution) ? r : void 0
                        }
                    })
                }
            };

            function lL(t, r) {
                (null == r || r > t.length) && (r = t.length);
                for (var n = 0, i = Array(r); n < r; n++) i[n] = t[n];
                return i
            }

            function l_(t, r) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, r) {
                    var n, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var o = [],
                            s = !0,
                            l = !1;
                        try {
                            for (a = a.call(t); !(s = (n = a.next()).done) && (o.push(n.value), !r || o.length !== r); s = !0);
                        } catch (t) {
                            l = !0, i = t
                        } finally {
                            try {
                                s || null == a.return || a.return()
                            } finally {
                                if (l) throw i
                            }
                        }
                        return o
                    }
                }(t, r) || function(t, r) {
                    if (t) {
                        if ("string" == typeof t) return lL(t, r);
                        var n = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return lL(t, r)
                    }
                }(t, r) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var lU = function(t, r, n) {
                var i = l_((0, u.useState)({
                        expectedSellerId: 0,
                        owned: !1,
                        isPurchasable: !1,
                        id: 0,
                        itemType: "",
                        assetType: "",
                        name: "",
                        description: "",
                        productId: 0,
                        creatorTargetId: 0,
                        creatorName: "",
                        price: null,
                        loading: !0,
                        loadFailure: !1,
                        premiumPricing: null,
                        premiumDiscountPercentage: null,
                        hasLimitedPrivateSales: !1,
                        isPublicDomain: !1,
                        premiumPriceInRobux: null,
                        assetTypeDisplayName: "",
                        offSaleDeadline: null,
                        unitsAvailableForConsumption: 0,
                        isLimited: !1,
                        resellerAvailable: !1,
                        firstReseller: {},
                        priceStatus: "",
                        isMarketPlaceEnabled: !0
                    }), 2),
                    a = i[0],
                    o = i[1],
                    s = function() {
                        o({
                            loading: !1,
                            loadFailure: !0
                        })
                    },
                    l = (0, u.useCallback)(function() {
                        t(r, n).then(function(t) {
                            var r = t.data,
                                n = {
                                    expectedSellerId: r.expectedSellerId,
                                    owned: r.owned,
                                    id: r.id,
                                    itemType: r.itemType,
                                    assetType: r.assetType,
                                    name: r.name,
                                    description: r.description,
                                    productId: r.productId,
                                    price: r.price,
                                    lowestPrice: r.lowestPrice,
                                    creatorTargetId: r.creatorTargetId,
                                    creatorName: r.creatorName,
                                    hasLimitedPrivateSales: void 0 !== r.lowestPrice,
                                    isPublicDomain: 0 === r.price,
                                    offSaleDeadline: r.offSaleDeadline,
                                    isLimited: r.itemRestrictions.includes("Limited") || r.itemRestrictions.includes("LimitedUnique"),
                                    unitsAvailableForConsumption: void 0 !== r.unitsAvailableForConsumption ? r.unitsAvailableForConsumption : 0,
                                    priceStatus: void 0 !== r.priceStatus ? r.priceStatus : "",
                                    itemRestrictions: r.itemRestrictions
                                };
                            void 0 !== r.premiumPricing && (n.premiumPriceInRobux = r.premiumPricing.premiumPriceInRobux, n.premiumDiscountPercentage = r.premiumPricing.premiumDiscountPercentage), n.isLimited && (n.price = void 0 !== n.lowestPrice ? n.lowestPrice : n.price, nU(n.id).then(function(t) {
                                if (n.resellerAvailable = t.data.data.length > 0, n.resellerAvailable) {
                                    var r = l_(t.data.data, 1)[0];
                                    n.price = r.price, n.firstReseller = r
                                }
                            })), n_(r.productId).then(function(t) {
                                !t.data.purchasable && t.data.reason && t.data.reason !== w.insufficientFunds ? n.isPurchasable = t.data.purchasable : n.isPurchasable = !0, n.assetTypeDisplayName = t.data.assetTypeDisplayName, n.loading = !1, n.loadFailure = !1, nB().then(function(t) {
                                    n.isMarketPlaceEnabled = t.data.isMarketPlaceEnabled && t.data.isItemsXchangeEnabled, o(n)
                                }).catch(function() {
                                    s()
                                })
                            }).catch(function(t) {
                                t.statusText === w.unauthorizedMessage ? (n.loading = !1, n.loadFailure = !1, o(n)) : s()
                            })
                        }).catch(function() {
                            s()
                        })
                    }, [r, n, t]);
                return (0, u.useEffect)(function() {
                    l()
                }, []), {
                    itemDetail: a,
                    loadItemDetail: l
                }
            };

            function lB(t, r) {
                (null == r || r > t.length) && (r = t.length);
                for (var n = 0, i = Array(r); n < r; n++) i[n] = t[n];
                return i
            }
            var lq = (a = s3(), function(t) {
                    if (Array.isArray(t)) return t
                }(a) || function(t, r) {
                    var n, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var o = [],
                            s = !0,
                            l = !1;
                        try {
                            for (a = a.call(t); !(s = (n = a.next()).done) && (o.push(n.value), o.length !== r); s = !0);
                        } catch (t) {
                            l = !0, i = t
                        } finally {
                            try {
                                s || null == a.return || a.return()
                            } finally {
                                if (l) throw i
                            }
                        }
                        return o
                    }
                }(a, 2) || function(t, r) {
                    if (t) {
                        if ("string" == typeof t) return lB(t, 2);
                        var n = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return lB(t, r)
                    }
                }(a, 2) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()),
                lz = lq[0],
                lV = lq[1],
                lG = function(t) {
                    nA.GameLauncher.openPluginInStudio(t)
                };

            function lH(t) {
                var r = t.translate,
                    n = t.productId,
                    i = t.price,
                    a = t.itemName,
                    s = t.itemType,
                    l = t.assetTypeDisplayName,
                    c = t.sellerName,
                    u = t.expectedSellerId,
                    f = t.isPurchasable,
                    p = t.isOwned,
                    h = t.isPlugin,
                    b = t.itemDetailItemId,
                    y = t.loading,
                    g = t.userQualifiesForPremiumPrices,
                    w = t.premiumPriceInRobux,
                    x = t.isAuthenticated,
                    S = t.resellerAvailable,
                    P = t.firstReseller,
                    E = t.isMarketPlaceEnabled,
                    A = function() {
                        return 0 === i ? r(v.getAction) : r(v.buyAction)
                    };
                if (y) return (0, o.jsx)(m.Loading, {});
                if (!x) return null != w ? (0, o.jsx)(m.Button, {
                    id: "upgrade-button",
                    className: "btn-fixed-width-lg btn-primary-lg",
                    onClick: function() {
                        I.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(I.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_PREMIUM_PURCHASE, !1, I.paymentFlowAnalyticsService.ENUM_VIEW_NAME.PREMIUM_UPSELL, I.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, I.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.GET_PREMIUM), window.open(D(b, s))
                    },
                    children: r(v.getPremiumAction)
                }) : (0, o.jsx)(m.Button, {
                    className: "btn-fixed-width-lg btn-growth-lg PurchaseButton",
                    onClick: function() {
                        window.location = "/login"
                    },
                    children: A()
                });
                var T = (0, o.jsx)(ll.Thumbnail2d, {
                    type: "bundle" === s ? ll.ThumbnailTypes.bundleThumbnail : ll.ThumbnailTypes.assetThumbnail,
                    size: ll.DefaultThumbnailSize,
                    targetId: b,
                    format: ll.ThumbnailFormat.webp,
                    altName: a
                });
                return h && (p || 0 === i) ? (0, o.jsx)(m.Button, {
                    className: "btn-fixed-width-lg btn-primary-lg InstallButton",
                    onClick: function() {
                        lG(b)
                    },
                    children: (0, o.jsx)("span", {
                        children: r(v.installAction)
                    })
                }) : (0, o.jsxs)(d().Fragment, {
                    children: [(0, o.jsx)(m.Button, {
                        className: "btn-fixed-width-lg btn-growth-lg PurchaseButton",
                        onClick: lV.start,
                        isDisabled: !(E && (S || f)),
                        children: A()
                    }), (0, o.jsx)(lz, {
                        productId: n,
                        expectedPrice: g && null != w ? w : i,
                        thumbnail: T,
                        assetTypeDisplayName: l,
                        assetName: a,
                        sellerName: P ? P.seller.name : c,
                        expectedSellerId: P ? P.seller.id : u,
                        userAssetId: P ? P.userAssetId : 0,
                        showSuccessBanner: !0
                    })]
                })
            }
            lH.propTypes = {
                translate: p().func.isRequired,
                productId: p().number.isRequired,
                price: p().number.isRequired,
                itemName: p().string.isRequired,
                itemType: p().string.isRequired,
                assetTypeDisplayName: p().string.isRequired,
                sellerName: p().string.isRequired,
                expectedSellerId: p().number.isRequired,
                isPurchasable: p().bool.isRequired,
                isOwned: p().bool.isRequired,
                isPlugin: p().bool.isRequired,
                itemDetailItemId: p().number.isRequired,
                loading: p().bool.isRequired,
                userQualifiesForPremiumPrices: p().bool.isRequired,
                premiumPriceInRobux: p().number.isRequired,
                isAuthenticated: p().bool.isRequired,
                resellerAvailable: p().bool.isRequired,
                firstReseller: p().shape({
                    seller: {
                        name: p().string.isRequired,
                        id: p().number.isRequired
                    },
                    userAssetId: p().number.isRequired
                }).isRequired,
                isMarketPlaceEnabled: p().bool.isRequired
            };
            var lW = (0, c.withTranslations)(lH, b);

            function lX(t) {
                var r = t.translate,
                    n = t.isLimited,
                    i = t.resellerAvailable;
                return (0, o.jsx)("div", {
                    className: "text-label field-label price-label",
                    children: (0, o.jsx)("span", {
                        children: r(n && i ? v.bestPriceLabel : v.priceLabel)
                    })
                })
            }
            lX.propTypes = {
                translate: p().func.isRequired,
                isLimited: p().bool.isRequired,
                resellerAvailable: p().bool.isRequired
            };
            var lK = (0, c.withTranslations)(lX, b);

            function lY(t) {
                var r = t.translate,
                    n = t.price,
                    i = t.itemType,
                    a = t.itemDetailItemId,
                    s = t.premiumPriceInRobux,
                    l = t.premiumDiscountPercentage,
                    c = t.userQualifiesForPremiumPrices,
                    u = t.isOwned,
                    f = t.loading,
                    p = t.loadFailure,
                    h = t.unitsAvailableForConsumption,
                    b = t.isLimited,
                    y = t.isPlugin,
                    g = t.resellerAvailable,
                    x = t.priceStatus,
                    S = t.offSaleDeadline,
                    P = t.isMarketPlaceEnabled,
                    A = null == s && null == n,
                    T = !0,
                    O = "",
                    j = function(t) {
                        I.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(I.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_PREMIUM_PURCHASE, !1, I.paymentFlowAnalyticsService.ENUM_VIEW_NAME.PREMIUM_UPSELL, I.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, t.target.innerText)
                    };
                return f ? (0, o.jsx)(m.Loading, {}) : (!f && p ? O = w.retryErrorMessage : x === v.offSale && null === S ? O = r(v.itemNoLongerForSaleLabel) : P || u ? y || !u || b ? b && 0 === h && !g ? O = r(v.noOneCurrentlySellingLabel) : T = !1 : O = r(v.itemAvailableInventoryLabel) : O = r(v.purchasingTemporarilyUnavailableLabel), 0 === n) ? null : T && !u ? (0, o.jsx)("div", {
                    className: "price-container-text",
                    children: (0, o.jsxs)("div", {
                        className: "item-first-line",
                        children: [" ", O, " "]
                    })
                }) : (0, o.jsxs)("div", {
                    className: "price-container-text",
                    children: [T ? (0, o.jsxs)("div", {
                        className: "item-first-line",
                        children: [" ", O, " "]
                    }) : null, (0, o.jsx)(lK, {
                        translate: r,
                        isLimited: b,
                        resellerAvailable: g
                    }), (0, o.jsx)("div", {
                        className: "price-info",
                        children: (0, o.jsxs)("div", {
                            className: "icon-text-wrapper clearfix icon-robux-price-container",
                            children: [A ? (0, o.jsx)("span", {
                                className: "icon-robux-16x16 icon-robux-gray-16x16 wait-for-i18n-format-render"
                            }) : (0, o.jsx)("span", {
                                className: "icon-robux-16x16 wait-for-i18n-format-render"
                            }), (0, o.jsx)("span", {
                                className: "text-robux-lg wait-for-i18n-format-render",
                                children: c && null != s ? (0, F.formatNumber)(s) : (0, F.formatNumber)(n)
                            })]
                        })
                    }), function() {
                        if (null == s || u) return null;
                        if (null == n) return c ? (0, o.jsx)("span", {
                            className: "small text field-content empty-label wait-for-i18n-format-render",
                            children: r(v.premiumExclusiveEligiblePromptLabel)
                        }) : (0, o.jsx)("span", {
                            className: "small text field-content empty-label wait-for-i18n-format-render",
                            children: r(v.premiumExclusiveIneligiblePromptLabel)
                        });
                        var t = {
                            originalPrice: (0, E.renderToString)((0, o.jsx)(_, {
                                price: n
                            })),
                            discountPercentage: l,
                            premiumDiscountedPrice: (0, E.renderToString)((0, o.jsx)(_, {
                                price: s
                            }))
                        };
                        return (0, o.jsxs)(d().Fragment, {
                            children: [(0, o.jsx)("div", {
                                className: "text-label field-label empty-label",
                                children: "\xa0"
                            }), (0, o.jsx)("span", {
                                className: "premium-prompt small text field-content empty-label wait-for-i18n-format-render",
                                children: c ? (0, o.jsx)("a", {
                                    "aria-label": " ",
                                    href: D(a, i),
                                    dangerouslySetInnerHTML: {
                                        __html: r(v.premiumDiscountSavingsLabel, t)
                                    },
                                    onClick: function(t) {
                                        j(t), window.open(D(a, i))
                                    }
                                }) : (0, o.jsx)("a", {
                                    "aria-label": " ",
                                    href: D(a, i),
                                    dangerouslySetInnerHTML: {
                                        __html: r(v.premiumDiscountOpportunityPromptLabel, t)
                                    },
                                    onClick: function(t) {
                                        j(t), window.open(D(a, i))
                                    }
                                })
                            })]
                        })
                    }()]
                })
            }
            lY.propTypes = {
                translate: p().func.isRequired,
                price: p().number.isRequired,
                itemType: p().string.isRequired,
                itemDetailItemId: p().number.isRequired,
                premiumPriceInRobux: p().number.isRequired,
                premiumDiscountPercentage: p().number.isRequired,
                userQualifiesForPremiumPrices: p().bool.isRequired,
                loading: p().bool.isRequired,
                isOwned: p().bool.isRequired,
                loadFailure: p().bool.isRequired,
                unitsAvailableForConsumption: p().number.isRequired,
                isLimited: p().bool.isRequired,
                isPlugin: p().bool.isRequired,
                resellerAvailable: p().bool.isRequired,
                priceStatus: p().string.isRequired,
                offSaleDeadline: p().string.isRequired,
                isMarketPlaceEnabled: p().bool.isRequired
            };
            var l$ = (0, c.withTranslations)(lY, {
                common: [],
                feature: "Feature.ItemModel"
            });

            function lJ(t, r) {
                (null == r || r > t.length) && (r = t.length);
                for (var n = 0, i = Array(r); n < r; n++) i[n] = t[n];
                return i
            }

            function lQ(t, r) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, r) {
                    var n, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var o = [],
                            s = !0,
                            l = !1;
                        try {
                            for (a = a.call(t); !(s = (n = a.next()).done) && (o.push(n.value), !r || o.length !== r); s = !0);
                        } catch (t) {
                            l = !0, i = t
                        } finally {
                            try {
                                s || null == a.return || a.return()
                            } finally {
                                if (l) throw i
                            }
                        }
                        return o
                    }
                }(t, r) || function(t, r) {
                    if (t) {
                        if ("string" == typeof t) return lJ(t, r);
                        var n = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return lJ(t, r)
                    }
                }(t, r) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function lZ(t) {
                var r = t.translate,
                    n = t.offSaleDeadline,
                    i = lQ((0, u.useState)(0), 2),
                    a = i[0],
                    s = i[1],
                    l = lQ((0, u.useState)(0), 2),
                    c = l[0],
                    d = l[1],
                    f = lQ((0, u.useState)(0), 2),
                    p = f[0],
                    m = f[1],
                    h = lQ((0, u.useState)(0), 2),
                    b = h[0],
                    y = h[1];
                return (0, u.useEffect)(function() {
                    var t = 0,
                        r = function() {
                            if (new Date < new Date(n)) {
                                var t = Date.now(),
                                    r = (new Date(n).getTime() - t) / 1e3;
                                s(Math.floor(r / 86400)), d(Math.floor(r / 3600 % 24)), m(Math.floor(r / 60 % 60)), y(Math.floor(r % 60))
                            }
                        };
                    return r(), t = setInterval(r, 1e3),
                        function() {
                            return clearInterval(t)
                        }
                }, [s, d, m, y]), (0, o.jsx)("div", {
                    id: "sale-clock",
                    className: "text-error sale-clock desktop-sale-clock",
                    children: a < 1 ? (0, o.jsx)("div", {
                        className: "text",
                        dangerouslySetInnerHTML: {
                            __html: r(v.OffsaleCountdownHourMinuteSecondLabel, {
                                numberOfHours: c,
                                numberOfMinutes: p,
                                numberOfSeconds: b
                            })
                        }
                    }) : b < 1 ? (window.location.reload(), null) : (0, o.jsx)("div", {
                        className: "text",
                        dangerouslySetInnerHTML: {
                            __html: r(v.CountdownTimerDayHourMinute, {
                                numberOfDays: a,
                                numberOfHours: c,
                                numberOfMinutes: p
                            })
                        }
                    })
                })
            }
            lZ.propTypes = {
                translate: p().func.isRequired,
                offSaleDeadline: p().string.isRequired
            };
            var l0 = (0, c.withTranslations)(lZ, b),
                l1 = window.HeaderScripts,
                l2 = 0,
                l3 = 1;

            function l4(t) {
                var r, n, i = t.translate,
                    a = t.assetType,
                    s = l1.deviceMeta.getDeviceMeta(),
                    l = "phone" === s.deviceType,
                    c = (r = (0, s4.userId)(), "/users/".concat(r, "/inventory"));
                return (n = a === g.Plugin || a === g.Decal || a === g.Model || a === g.Video || a === g.Animation ? l3 : a === g.Place || a === g.Badge || a === g.GamePass || a === g.Animation ? null : l2) === l2 && !s.isInApp && (l1.deviceMeta.isAndroidApp || l1.deviceMeta.isIosApp) && (l1.deviceMeta.isPhone || l1.deviceMeta.isTablet) ? (0, o.jsx)("a", {
                    id: "open-in-avatar-editor-button",
                    href: "/#",
                    className: "btn-fixed-width-lg btn-control-md",
                    children: (0, o.jsx)("span", {
                        className: "icon-nav-charactercustomizer"
                    })
                }) : n !== l2 || l ? (0, o.jsx)("a", {
                    id: "inventory-button",
                    href: c,
                    className: "btn-fixed-width-lg btn-control-md",
                    children: i(v.inventoryAction)
                }) : (0, o.jsx)("a", {
                    id: "edit-avatar-button",
                    href: "/my/avatar",
                    className: "btn-control-md",
                    children: (0, o.jsx)("span", {
                        className: "icon-nav-charactercustomizer"
                    })
                })
            }
            l4.propTypes = {
                translate: p().func.isRequired,
                assetType: p().number.isRequired
            };
            var l6 = (0, c.withTranslations)(l4, b),
                l8 = function() {
                    var t = document.getElementById("item-container");
                    return t ? {
                        itemDetailItemId: parseInt(t.getAttribute("data-item-id"), 10),
                        itemDetailItemType: t.getAttribute("data-item-type")
                    } : null
                };

            function l5(t) {
                var r = t.translate,
                    n = l8(),
                    i = n.itemDetailItemId,
                    a = lU(nL, i, n.itemDetailItemType).itemDetail;
                return (0, o.jsxs)(d().Fragment, {
                    children: [(0, o.jsx)(l$, {
                        translate: r,
                        price: a.price,
                        itemType: a.itemType,
                        itemDetailItemId: i,
                        premiumPriceInRobux: a.premiumPriceInRobux,
                        premiumDiscountPercentage: a.premiumDiscountPercentage,
                        userQualifiesForPremiumPrices: (0, s4.isPremiumUser)(),
                        isOwned: a.owned,
                        loading: a.loading,
                        loadFailure: a.loadFailure,
                        unitsAvailableForConsumption: a.unitsAvailableForConsumption,
                        isLimited: a.isLimited,
                        isPlugin: a.assetType === g.Plugin,
                        resellerAvailable: a.resellerAvailable,
                        priceStatus: a.priceStatus,
                        offSaleDeadline: a.offSaleDeadline,
                        isMarketPlaceEnabled: a.isMarketPlaceEnabled
                    }), !a.loadFailure && (a.owned && (!a.isLimited || a.unitsAvailableForConsumption > 0) ? (0, o.jsx)("div", {
                        className: "action-button",
                        children: (0, o.jsx)(l6, {
                            translate: r,
                            assetType: a.assetType
                        })
                    }) : (0, o.jsxs)("div", {
                        className: "action-button",
                        children: [(0, o.jsx)(lW, {
                            translate: r,
                            productId: a.productId,
                            price: a.price,
                            itemType: a.itemType,
                            assetTypeDisplayName: a.assetTypeDisplayName,
                            itemName: a.name,
                            sellerName: a.creatorName,
                            expectedSellerId: a.expectedSellerId,
                            isPurchasable: a.isPurchasable,
                            isOwned: a.owned,
                            isInstallable: a.assetType === g.Plugin,
                            itemDetailItemId: i,
                            loading: a.loading,
                            hasLimitedPrivateSales: a.hasLimitedPrivateSales,
                            userQualifiesForPremiumPrices: (0, s4.isPremiumUser)(),
                            premiumPriceInRobux: a.premiumPriceInRobux,
                            isAuthenticated: (0, s4.isAuthenticated)(),
                            unitsAvailableForConsumption: a.unitsAvailableForConsumption,
                            isLimited: a.isLimited,
                            resellerAvailable: a.resellerAvailable,
                            firstReseller: a.firstReseller,
                            isMarketPlaceEnabled: a.isMarketPlaceEnabled
                        }), null !== a.offSaleDeadline && (0, o.jsx)(l0, {
                            translate: r,
                            offSaleDeadline: a.offSaleDeadline
                        })]
                    }))]
                })
            }
            l5.propTypes = {
                translate: p().func.isRequired
            }, n(405), window.RobloxItemPurchase = {
                createTransactionFailureModal: P,
                createInsufficientFundsModal: B,
                createPriceChangedModal: W,
                createPurchaseVerificationModal: $,
                createPurchaseConfirmationModal: nI,
                createItemPurchase: s3,
                errorTypeIds: y,
                getMetaData: q,
                BalanceAfterSaleText: V,
                PriceLabel: _,
                AssetName: K,
                TransactionVerb: nS,
                BatchBuyPriceContainer: lM,
                ASSET_TYPE_ENUM: nJ,
                startGamepassPurchaseFlow: function(t) {
                    var r, n = "rbx-gamepass-purchase-root",
                        i = document.getElementById(n);
                    i || ((i = document.createElement("div")).id = n, document.body.appendChild(i));
                    var a = d().createElement(ll.Thumbnail2d, {
                            type: ll.ThumbnailTypes.assetThumbnail,
                            targetId: t.iconAssetId,
                            size: ll.ThumbnailGamePassIconSize.size150,
                            format: ll.ThumbnailFormat.webp,
                            altName: t.assetName
                        }),
                        o = (r = s3(), function(t) {
                            if (Array.isArray(t)) return t
                        }(r) || function(t, r) {
                            var n, i, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                            if (null != a) {
                                var o = [],
                                    s = !0,
                                    l = !1;
                                try {
                                    for (a = a.call(t); !(s = (n = a.next()).done) && (o.push(n.value), o.length !== r); s = !0);
                                } catch (t) {
                                    l = !0, i = t
                                } finally {
                                    try {
                                        s || null == a.return || a.return()
                                    } finally {
                                        if (l) throw i
                                    }
                                }
                                return o
                            }
                        }(r, 2) || function(t, r) {
                            if (t) {
                                if ("string" == typeof t) return lk(t, 2);
                                var n = Object.prototype.toString.call(t).slice(8, -1);
                                if ("Object" === n && t.constructor && (n = t.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return lk(t, r)
                            }
                        }(r, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        s = o[0],
                        l = o[1];
                    return (0, ea.render)(d().createElement(lD, {
                            ItemPurchase: s,
                            itemPurchaseService: l,
                            innerProps: {
                                thumbnail: a,
                                productId: t.productId,
                                assetName: t.assetName,
                                assetType: nJ.GAME_PASS,
                                sellerName: t.sellerName,
                                expectedCurrency: 1,
                                expectedSellerId: t.expectedSellerId,
                                expectedPrice: t.expectedPrice,
                                discountInformation: t.discountInformation ? lF(t.discountInformation) : null,
                                onPurchaseSuccess: t.onPurchaseSuccess
                            }
                        }), i),
                        function() {
                            i && ((0, ea.unmountComponentAtNode)(i), i.remove())
                        }
                }
            }, l()(function() {
                var t = document.getElementById("display-price-container");
                t && (0, c.renderWithErrorBoundary)((0, o.jsx)(l5, {}), t)
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("ItemPurchase");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/itemPurchase-df0eb2a6e3122f78.js.map
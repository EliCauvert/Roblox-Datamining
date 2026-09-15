! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "a8b4d42c69383bb6853e75e25b9bba5c52745c9c"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "aa5f6a43-1993-4365-99d9-11516f9d5906", e._sentryDebugIdIdentifier = "sentry-dbid-aa5f6a43-1993-4365-99d9-11516f9d5906")
    } catch (e) {}
}(),
function() {
    var e = {
            977: function(e, t, r) {
                function n(e) {
                    return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
                }
                var i = 0 / 0,
                    o = /^\s+|\s+$/g,
                    a = /^[-+]0x[0-9a-f]+$/i,
                    l = /^0b[01]+$/i,
                    c = /^0o[0-7]+$/i,
                    s = parseInt,
                    u = (void 0 === r.g ? "undefined" : n(r.g)) == "object" && r.g && r.g.Object === Object && r.g,
                    d = ("u" < typeof self ? "undefined" : n(self)) == "object" && self && self.Object === Object && self,
                    f = u || d || Function("return this")(),
                    p = Object.prototype.toString,
                    m = Math.max,
                    b = Math.min,
                    y = function() {
                        return f.Date.now()
                    };

                function h(e) {
                    var t = void 0 === e ? "undefined" : n(e);
                    return !!e && ("object" == t || "function" == t)
                }

                function v(e) {
                    if ("number" == typeof e) return e;
                    if ((void 0 === (t = e) ? "undefined" : n(t)) == "symbol" || t && (void 0 === t ? "undefined" : n(t)) == "object" && "[object Symbol]" == p.call(t)) return i;
                    if (h(e)) {
                        var t, r = "function" == typeof e.valueOf ? e.valueOf() : e;
                        e = h(r) ? r + "" : r
                    }
                    if ("string" != typeof e) return 0 === e ? e : +e;
                    e = e.replace(o, "");
                    var u = l.test(e);
                    return u || c.test(e) ? s(e.slice(2), u ? 2 : 8) : a.test(e) ? i : +e
                }
                e.exports = function(e, t, r) {
                    var n, i, o, a, l, c, s = 0,
                        u = !1,
                        d = !1,
                        f = !0;
                    if ("function" != typeof e) throw TypeError("Expected a function");

                    function p(t) {
                        var r = n,
                            o = i;
                        return n = i = void 0, s = t, a = e.apply(o, r)
                    }

                    function g(e) {
                        var r = e - c,
                            n = e - s;
                        return void 0 === c || r >= t || r < 0 || d && n >= o
                    }

                    function w() {
                        var e, r, n, i = y();
                        if (g(i)) return P(i);
                        l = setTimeout(w, (e = i - c, r = i - s, n = t - e, d ? b(n, o - r) : n))
                    }

                    function P(e) {
                        return (l = void 0, f && n) ? p(e) : (n = i = void 0, a)
                    }

                    function O() {
                        var e, r = y(),
                            o = g(r);
                        if (n = arguments, i = this, c = r, o) {
                            if (void 0 === l) return s = e = c, l = setTimeout(w, t), u ? p(e) : a;
                            if (d) return l = setTimeout(w, t), p(c)
                        }
                        return void 0 === l && (l = setTimeout(w, t)), a
                    }
                    return t = v(t) || 0, h(r) && (u = !!r.leading, o = (d = "maxWait" in r) ? m(v(r.maxWait) || 0, t) : o, f = "trailing" in r ? !!r.trailing : f), O.cancel = function() {
                        void 0 !== l && clearTimeout(l), s = 0, n = c = i = l = void 0
                    }, O.flush = function() {
                        return void 0 === l ? a : P(y())
                    }, O
                }
            },
            773: function(e, t) {
                "use strict";
                Object.defineProperty(t, "__esModule", {
                    value: !0
                });
                var r, n, i, o = {
                        exports: {}
                    },
                    a = o.exports = {};

                function l() {
                    throw Error("setTimeout has not been defined")
                }

                function c() {
                    throw Error("clearTimeout has not been defined")
                }
                try {
                    r = "function" == typeof setTimeout ? setTimeout : l
                } catch (e) {
                    r = l
                }
                try {
                    n = "function" == typeof clearTimeout ? clearTimeout : c
                } catch (e) {
                    n = c
                }

                function s(e) {
                    if (r === setTimeout) return setTimeout(e, 0);
                    if ((r === l || !r) && setTimeout) return r = setTimeout, setTimeout(e, 0);
                    try {
                        return r(e, 0)
                    } catch (t) {
                        try {
                            return r.call(null, e, 0)
                        } catch (t) {
                            return r.call(this, e, 0)
                        }
                    }
                }
                var u = [],
                    d = !1,
                    f = -1;

                function p() {
                    d && i && (d = !1, i.length ? u = i.concat(u) : f = -1, u.length && m())
                }

                function m() {
                    if (!d) {
                        var e = s(p);
                        d = !0;
                        for (var t = u.length; t;) {
                            for (i = u, u = []; ++f < t;) i && i[f].run();
                            f = -1, t = u.length
                        }
                        i = null, d = !1,
                            function(e) {
                                if (n === clearTimeout) return clearTimeout(e);
                                if ((n === c || !n) && clearTimeout) return n = clearTimeout, clearTimeout(e);
                                try {
                                    n(e)
                                } catch (t) {
                                    try {
                                        return n.call(null, e)
                                    } catch (t) {
                                        return n.call(this, e)
                                    }
                                }
                            }(e)
                    }
                }

                function b(e, t) {
                    this.fun = e, this.array = t
                }

                function y() {}

                function h() {}
                a.nextTick = function(e) {
                    var t = Array(arguments.length - 1);
                    if (arguments.length > 1)
                        for (var r = 1; r < arguments.length; r++) t[r - 1] = arguments[r];
                    u.push(new b(e, t)), 1 !== u.length || d || s(m)
                }, b.prototype.run = function() {
                    this.fun.apply(null, this.array)
                }, a.title = "browser", a.browser = !0, a.env = {}, a.argv = [], a.version = "", a.versions = {}, a.on = y, a.addListener = y, a.once = y, a.off = y, a.removeListener = y, a.removeAllListeners = y, a.emit = y, a.prependListener = y, a.prependOnceListener = y, a.listeners = function(e) {
                    return []
                }, a.binding = function(e) {
                    throw Error("process.binding is not supported")
                }, a.cwd = function() {
                    return "/"
                }, a.chdir = function(e) {
                    throw Error("process.chdir is not supported")
                }, a.umask = function() {
                    return 0
                };
                var v = o.exports.browser,
                    g = o.exports.binding,
                    w = {},
                    P = "browser",
                    O = "browser",
                    S = "browser",
                    x = [],
                    j = {
                        nextTick: o.exports.nextTick,
                        title: o.exports.title,
                        browser: v,
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
                        emitWarning: h,
                        prependListener: o.exports.prependListener,
                        prependOnceListener: o.exports.prependOnceListener,
                        listeners: o.exports.listeners,
                        binding: g,
                        cwd: o.exports.cwd,
                        chdir: o.exports.chdir,
                        umask: o.exports.umask,
                        exit: h,
                        pid: 1,
                        features: w,
                        kill: h,
                        dlopen: h,
                        uptime: h,
                        memoryUsage: h,
                        uvCounters: h,
                        platform: P,
                        arch: O,
                        execPath: S,
                        execArgv: x
                    };
                t.addListener = o.exports.addListener, t.arch = O, t.argv = o.exports.argv, t.binding = g, t.browser = v, t.chdir = o.exports.chdir, t.cwd = o.exports.cwd, t.default = j, t.dlopen = h, t.emit = o.exports.emit, t.emitWarning = h, t.env = o.exports.env, t.execArgv = x, t.execPath = S, t.exit = h, t.features = w, t.kill = h, t.listeners = o.exports.listeners, t.memoryUsage = h, t.nextTick = o.exports.nextTick, t.off = o.exports.off, t.on = o.exports.on, t.once = o.exports.once, t.pid = 1, t.platform = P, t.prependListener = o.exports.prependListener, t.prependOnceListener = o.exports.prependOnceListener, t.removeAllListeners = o.exports.removeAllListeners, t.removeListener = o.exports.removeListener, t.title = o.exports.title, t.umask = o.exports.umask, t.uptime = h, t.uvCounters = h, t.version = o.exports.version, t.versions = o.exports.versions, e.exports = j
            }
        },
        t = {};

    function r(n) {
        var i = t[n];
        if (void 0 !== i) return i.exports;
        var o = t[n] = {
            exports: {}
        };
        return e[n](o, o.exports, r), o.exports
    }
    r.m = e, r.n = function(e) {
            var t = e && e.__esModule ? function() {
                return e.default
            } : function() {
                return e
            };
            return r.d(t, {
                a: t
            }), t
        }, r.d = function(e, t) {
            for (var n in t) r.o(t, n) && !r.o(e, n) && Object.defineProperty(e, n, {
                enumerable: !0,
                get: t[n]
            })
        }, r.g = function() {
            if ("object" == typeof globalThis) return globalThis;
            try {
                return this || Function("return this")()
            } catch (e) {
                if ("object" == typeof window) return window
            }
        }(), r.o = function(e, t) {
            return Object.prototype.hasOwnProperty.call(e, t)
        }, r.r = function(e) {
            "u" > typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
                value: "Module"
            }), Object.defineProperty(e, "__esModule", {
                value: !0
            })
        }, r.nc = void 0, r.rv = function() {
            return "1.7.12"
        }, r.ruid = "bundler=rspack@1.7.12",
        function() {
            "use strict";
            var e, t, n, i, o = window.ReactJSX,
                a = window.Roblox["core-scripts"].util.ready,
                l = r.n(a),
                c = window.Roblox["core-scripts"].react,
                s = window.React,
                u = r.n(s),
                d = window.PropTypes,
                f = r.n(d),
                p = window.ReactStyleGuide,
                m = {
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
                h = {
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
                v = {
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
                g = {
                    insufficientFunds: "InsufficientFunds",
                    retryErrorMessage: "Failed to determine purchasability status. Please try again by refreshing.",
                    notForSale: "NotForSale",
                    unauthorizedMessage: "Unauthorized",
                    twoStepVerificationRequired: "TwoStepVerificationRequired"
                },
                w = {
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

            function P(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function O() {
                var e, t = function(e) {
                        if (Array.isArray(e)) return e
                    }(e = (0, p.createModal)()) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var i = [],
                                o = !0,
                                a = !1;
                            try {
                                for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 2 !== i.length); o = !0);
                            } catch (e) {
                                a = !0, r = e
                            } finally {
                                try {
                                    o || null == n.return || n.return()
                                } finally {
                                    if (a) throw r
                                }
                            }
                            return i
                        }
                    }(e) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return P(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return P(e, 2)
                        }
                    }(e) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    r = t[0],
                    n = t[1];

                function i(e) {
                    var t = e.translate,
                        n = e.title,
                        i = e.message,
                        a = e.onDecline,
                        l = (0, o.jsx)("div", {
                            className: "modal-message",
                            children: i
                        });
                    return (0, o.jsx)(r, {
                        title: n,
                        body: l,
                        thumbnail: (0, o.jsx)("span", {
                            className: "icon-warning-orange-150x150"
                        }),
                        neutralButtonText: t(h.okAction),
                        onNeutral: a,
                        actionButtonShow: !1
                    })
                }
                return i.defaultProps = {
                    onDecline: null
                }, i.propTypes = {
                    translate: f().func.isRequired,
                    title: f().string.isRequired,
                    message: f().string.isRequired,
                    onDecline: f().func
                }, [(0, c.withTranslations)(i, m), n]
            }
            var S = window.ReactDOMServer,
                x = window.CoreRobloxUtilities,
                j = window.Roblox["core-scripts"].environmentUrls,
                I = window.CoreUtilities,
                E = j.EnvironmentUrls.economyApi,
                A = j.EnvironmentUrls.catalogApi,
                T = j.EnvironmentUrls.apiGatewayUrl,
                R = j.EnvironmentUrls.twoStepVerificationApi,
                N = j.EnvironmentUrls.vngGamesShopUrl,
                C = function(e) {
                    return I.urlService.getUrlWithQueries("/Upgrades/Robux.aspx", {
                        ctx: e
                    })
                },
                D = function(e, t) {
                    return "/premium/membership?ctx=WebItemDetail&upsellTargetType=".concat(t, "&upsellTargetId=").concat(e)
                },
                M = function() {
                    return N
                },
                k = window.Roblox["core-scripts"].format.number;

            function F(e) {
                var t = e.translate,
                    r = e.price,
                    n = e.color,
                    i = e.useFreeText;
                return 0 === r && i ? (0, o.jsx)("span", {
                    className: "text-robux text-free",
                    children: t(h.freeLabel)
                }) : (0, o.jsxs)(u().Fragment, {
                    children: [(0, o.jsx)("span", {
                        className: "icon-robux".concat(n ? "-".concat(n) : "", "-16x16")
                    }), (0, o.jsx)("span", {
                        className: "text-robux",
                        children: (0, k.formatNumber)(r)
                    })]
                })
            }
            F.defaultProps = {
                color: "",
                useFreeText: !0
            }, F.propTypes = {
                price: f().number.isRequired,
                translate: f().func.isRequired,
                color: f().string,
                useFreeText: f().bool
            };
            var L = (0, c.withTranslations)(F, m);

            function _(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function U() {
                var e, t = function(e) {
                        if (Array.isArray(e)) return e
                    }(e = (0, p.createModal)()) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var i = [],
                                o = !0,
                                a = !1;
                            try {
                                for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 2 !== i.length); o = !0);
                            } catch (e) {
                                a = !0, r = e
                            } finally {
                                try {
                                    o || null == n.return || n.return()
                                } finally {
                                    if (a) throw r
                                }
                            }
                            return i
                        }
                    }(e) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return _(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return _(e, 2)
                        }
                    }(e) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    r = t[0],
                    n = t[1];

                function i(e) {
                    var t = e.translate,
                        n = e.robuxNeeded,
                        i = e.source,
                        a = e.onAccept,
                        l = (0, o.jsx)("div", {
                            className: "modal-message",
                            dangerouslySetInnerHTML: {
                                __html: t(h.insufficientFundsMessage, {
                                    robux: (0, S.renderToString)((0, o.jsx)(L, {
                                        price: n
                                    }))
                                })
                            }
                        });
                    return n || (l = (0, o.jsxs)("div", {
                        children: [" ", t(h.additionalRobuxNeeded)]
                    })), (0, o.jsx)(r, {
                        title: t(h.insufficientFundsHeading),
                        body: l,
                        thumbnail: (0, o.jsx)("span", {
                            className: "money-stack-icon"
                        }),
                        neutralButtonText: t(h.cancelAction),
                        actionButtonText: t(h.buyRobuxAction),
                        onAction: function() {
                            return x.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(x.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, x.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBUX_UPSELL, x.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, x.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.BUY_ROBUX), a ? a() : window.location = C(i), !1
                        },
                        onClose: function() {
                            x.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(x.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, x.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBUX_UPSELL, x.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, x.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.CANCEL)
                        },
                        actionButtonShow: !0
                    })
                }
                return i.defaultProps = {
                    onAccept: null,
                    source: ""
                }, i.propTypes = {
                    translate: f().func.isRequired,
                    source: f().string,
                    onAccept: f().func,
                    robuxNeeded: f().number.isRequired
                }, [(0, c.withTranslations)(i, m), n]
            }
            var B = function() {
                var e = document.getElementById("ItemPurchaseAjaxData");
                return e ? {
                    userRobuxBalance: parseInt(e.getAttribute("data-user-balance-robux"), 10),
                    userBc: parseInt(e.getAttribute("data-user-bc"), 10),
                    hasCurrencyServiceError: "True" === e.getAttribute("data-has-currency-service-error"),
                    currencyServiceErrorMessage: e.getAttribute("data-currency-service-error-message")
                } : {}
            };

            function q(e) {
                var t = e.translate,
                    r = e.expectedPrice,
                    n = e.currentRobuxBalance,
                    i = null != n ? n : B().userRobuxBalance;
                return n ? (0, o.jsx)("span", {
                    dangerouslySetInnerHTML: {
                        __html: t(h.balanceAfterMessage, {
                            robuxBalance: (0, S.renderToString)((0, o.jsx)(L, {
                                price: i - r,
                                color: "gray",
                                useFreeText: !1
                            }))
                        })
                    }
                }) : (0, o.jsx)("span", {})
            }
            q.propTypes = {
                expectedPrice: f().number.isRequired,
                currentRobuxBalance: f().number,
                translate: f().func.isRequired
            }, q.defaultProps = {
                currentRobuxBalance: void 0
            };
            var V = (0, c.withTranslations)(q, m);

            function z(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function G(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            l = !1;
                        try {
                            for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return z(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return z(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function H() {
                var e = G((0, p.createModal)(), 2),
                    t = e[0],
                    r = e[1];

                function n(e) {
                    var r = e.translate,
                        n = e.expectedPrice,
                        i = e.currentPrice,
                        a = e.onAction,
                        l = e.loading,
                        c = G((0, s.useState)(!1), 2),
                        d = c[0],
                        f = c[1],
                        p = (0, o.jsxs)(u().Fragment, {
                            children: [(0, o.jsx)("div", {
                                className: "modal-message",
                                dangerouslySetInnerHTML: {
                                    __html: r(h.priceChangedMessage, {
                                        robuxBefore: (0, S.renderToString)((0, o.jsx)(L, {
                                            price: n,
                                            color: "gray"
                                        })),
                                        robuxAfter: (0, S.renderToString)((0, o.jsx)(L, {
                                            price: i,
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
                                    checked: d
                                }), (0, o.jsx)("label", {
                                    onClick: function() {
                                        return f(!d)
                                    },
                                    htmlFor: "modal-checkbox-input",
                                    children: r(h.agreeAndPayLabel)
                                })]
                            })]
                        });
                    return (0, o.jsx)(t, {
                        title: r(h.priceChangedHeading),
                        body: p,
                        neutralButtonText: r(h.cancelAction),
                        actionButtonText: r(h.buyRobuxAction),
                        onAction: a,
                        loading: l,
                        disableActionButton: !d,
                        footerText: (0, o.jsx)(V, {
                            expectedPrice: i
                        }),
                        actionButtonShow: !0
                    })
                }
                return n.defaultProps = {
                    loading: !1
                }, n.propTypes = {
                    translate: f().func.isRequired,
                    expectedPrice: f().number.isRequired,
                    currentPrice: f().number.isRequired,
                    onAction: f().func.isRequired,
                    loading: f().bool
                }, [(0, c.withTranslations)(n, m), r]
            }
            var W = window.Roblox["core-scripts"].format.string;

            function K(e) {
                var t = e.name;
                return (0, o.jsx)("span", {
                    className: "font-bold",
                    children: t
                })
            }

            function X(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            K.propTypes = {
                name: f().string.isRequired
            };

            function $() {
                var e, t = function(e) {
                        if (Array.isArray(e)) return e
                    }(e = (0, p.createModal)()) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var i = [],
                                o = !0,
                                a = !1;
                            try {
                                for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 2 !== i.length); o = !0);
                            } catch (e) {
                                a = !0, r = e
                            } finally {
                                try {
                                    o || null == n.return || n.return()
                                } finally {
                                    if (a) throw r
                                }
                            }
                            return i
                        }
                    }(e) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return X(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return X(e, 2)
                        }
                    }(e) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    r = t[0],
                    n = t[1];

                function i(e) {
                    var t, n, i = e.translate,
                        a = e.title,
                        l = e.expectedPrice,
                        c = e.displayPrice,
                        s = e.thumbnail,
                        u = e.assetName,
                        d = e.assetType,
                        f = e.assetTypeDisplayName,
                        p = e.sellerName,
                        m = e.isPlace,
                        b = e.onAction,
                        y = e.loading,
                        v = e.currentRobuxBalance,
                        g = !!("Subscription" === d && c),
                        w = {
                            assetName: (0, S.renderToString)((0, o.jsx)(K, {
                                name: u
                            })),
                            assetType: f || d,
                            seller: (0, W.escapeHtml)(p),
                            robux: g ? '<span class="text-robux">'.concat((0, W.escapeHtml)(c), "</span>") : (0, S.renderToString)((0, o.jsx)(L, {
                                price: l
                            }))
                        },
                        P = m ? h.promptBuyAccessMessage : h.promptBuyMessage;
                    m || "" !== w.seller || (P = h.promptBuySimplifiedMessage), g || 0 === l ? (t = i(h.getItemHeading), n = i(h.getNowAction)) : (t = i(h.buyItemHeading), n = i(h.buyNowAction)), g && (t = i(h.buyItemHeading), n = i(h.buyNowAction)), m && (n = i(h.buyAccessAction));
                    var O = (0, o.jsx)("div", {
                        className: "modal-message",
                        dangerouslySetInnerHTML: {
                            __html: i(P, w)
                        }
                    });
                    return (0, o.jsx)(r, {
                        title: a || t,
                        body: O,
                        thumbnail: s,
                        neutralButtonText: i(h.cancelAction),
                        actionButtonText: n,
                        onAction: b,
                        footerText: g ? null : (0, o.jsx)(V, {
                            expectedPrice: l,
                            currentRobuxBalance: v
                        }),
                        loading: y,
                        actionButtonShow: !0
                    })
                }
                return i.defaultProps = {
                    isPlace: !1,
                    assetTypeDisplayName: "",
                    title: "",
                    loading: !1,
                    currentRobuxBalance: void 0,
                    displayPrice: ""
                }, i.propTypes = {
                    translate: f().func.isRequired,
                    title: f().string,
                    expectedPrice: f().number.isRequired,
                    displayPrice: f().string,
                    thumbnail: f().node.isRequired,
                    assetName: f().string.isRequired,
                    assetType: f().string.isRequired,
                    assetTypeDisplayName: f().string,
                    sellerName: f().string.isRequired,
                    isPlace: f().bool,
                    onAction: f().func.isRequired,
                    loading: f().bool,
                    currentRobuxBalance: f().number
                }, [(0, c.withTranslations)(i, m), n]
            }
            var Y = function() {
                    for (var e, t, r = 0, n = "", i = arguments.length; r < i; r++)(e = arguments[r]) && (t = function e(t) {
                        var r, n, i = "";
                        if ("string" == typeof t || "number" == typeof t) i += t;
                        else if ("object" == (void 0 === t ? "undefined" : t && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t))
                            if (Array.isArray(t)) {
                                var o = t.length;
                                for (r = 0; r < o; r++) t[r] && (n = e(t[r])) && (i && (i += " "), i += n)
                            } else
                                for (n in t) t[n] && (i && (i += " "), i += n);
                        return i
                    }(e)) && (n && (n += " "), n += t);
                    return n
                },
                J = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                Q = function(e) {
                    var t = e.className;
                    return u().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: Y("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                };

            function Z(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ee(e) {
                if (Array.isArray(e)) return e
            }

            function et() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function er(e, t) {
                if (e) {
                    if ("string" == typeof e) return Z(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return Z(e, t)
                }
            }
            var en = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                ei = u().forwardRef(function(e, t) {
                    var r, n = ee(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || er(r) || et(),
                        i = n[0],
                        o = n.slice(1),
                        a = i.name,
                        l = i.size,
                        c = i.className,
                        s = (i.children, function(e, t) {
                            if (null == e) return {};
                            var r, n, i, o = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                return o
                            }
                            if (o = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, i = {},
                                        o = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                                    return i
                                }(e, t), Object.getOwnPropertySymbols)
                                for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                            return o
                        }(i, ["name", "size", "className", "children"])),
                        d = (ee(o) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    o = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 1 !== i.length); o = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        o || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return i
                            }
                        }(o) || er(o, 1) || et())[0];
                    return u().createElement("span", function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var r = null != arguments[t] ? arguments[t] : {},
                                n = Object.keys(r);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(r, e).enumerable
                            }))), n.forEach(function(t) {
                                var n;
                                n = r[t], t in e ? Object.defineProperty(e, t, {
                                    value: n,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = n
                            })
                        }
                        return e
                    }({
                        ref: d,
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-icon",
                        className: Y("grow-0 shrink-0 basis-auto icon", a, en[void 0 === l ? "Medium" : l], c)
                    }, s))
                });
            ei.displayName = "Icon";
            var eo = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-medium"
                },
                ea = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                el = function(e) {
                    var t = e.variant,
                        r = e.size,
                        n = e.isCircular,
                        i = e.className,
                        o = function(e, t) {
                            if (null == e) return {};
                            var r, n, i, o = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                return o
                            }
                            if (o = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, i = {},
                                        o = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                                    return i
                                }(e, t), Object.getOwnPropertySymbols)
                                for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                            return o
                        }(e, ["variant", "size", "isCircular", "className"]);
                    return u().createElement("button", function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var r = null != arguments[t] ? arguments[t] : {},
                                n = Object.keys(r);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(r, e).enumerable
                            }))), n.forEach(function(t) {
                                var n;
                                n = r[t], t in e ? Object.defineProperty(e, t, {
                                    value: n,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = n
                            })
                        }
                        return e
                    }({
                        type: "button",
                        className: Y("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", J, ea[t], eo[r], n && "radius-circle", i)
                    }, o), u().createElement(Q, null), u().createElement(ei, {
                        name: "icon-regular-x",
                        size: r
                    }))
                };

            function ec(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    i = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === i || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function es(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function eu(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function ed() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map(function(t) {
                            var n = eu(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        });
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : eu(t[e], null)
                        }
                    }
                }
            }

            function ef() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return s.useCallback(ed.apply(void 0, function(e) {
                    if (Array.isArray(e)) return es(e)
                }(t) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return es(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return es(e, void 0)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function ep(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function em(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function eb(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        em(e, t, r[t])
                    })
                }
                return e
            }

            function ey(e, t) {
                if (null == e) return {};
                var r, n, i, o = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                    return o
                }
                if (o = function(e, t) {
                        if (null == e) return {};
                        var r, n, i = {},
                            o = Object.getOwnPropertyNames(e);
                        for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                        return i
                    }(e, t), Object.getOwnPropertySymbols)
                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                return o
            }

            function eh(e) {
                return function(e) {
                    if (Array.isArray(e)) return ep(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return ep(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ep(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ev(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    r = [],
                    n = function() {
                        var t = r.map(function(e) {
                            return s.createContext(e)
                        });
                        return function(r) {
                            var n = (null == r ? void 0 : r[e]) || t;
                            return s.useMemo(function() {
                                var t, i;
                                return em({}, "__scope".concat(e), (t = eb({}, r), i = null != (i = em({}, e, n)) ? i : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(i)) : (function(e) {
                                    var t = Object.keys(e);
                                    if (Object.getOwnPropertySymbols) {
                                        var r = Object.getOwnPropertySymbols(e);
                                        t.push.apply(t, r)
                                    }
                                    return t
                                })(Object(i)).forEach(function(e) {
                                    Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(i, e))
                                }), t))
                            }, [r, n])
                        }
                    };
                return n.scopeName = e, [function(t, n) {
                    var i = s.createContext(n),
                        a = r.length;
                    r = eh(r).concat([n]);
                    var l = function(t) {
                        var r, n = t.scope,
                            l = t.children,
                            c = ey(t, ["scope", "children"]),
                            u = (null == n || null == (r = n[e]) ? void 0 : r[a]) || i,
                            d = s.useMemo(function() {
                                return c
                            }, Object.values(c));
                        return (0, o.jsx)(u.Provider, {
                            value: d,
                            children: l
                        })
                    };
                    return l.displayName = t + "Provider", [l, function(r, o) {
                        var l, c = (null == o || null == (l = o[e]) ? void 0 : l[a]) || i,
                            u = s.useContext(c);
                        if (u) return u;
                        if (void 0 !== n) return n;
                        throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                    }]
                }, eg.apply(void 0, [n].concat(eh(t)))]
            }

            function eg() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                var n = t[0];
                if (1 === t.length) return n;
                var i = function() {
                    var e = t.map(function(e) {
                        return {
                            useScope: e(),
                            scopeName: e.scopeName
                        }
                    });
                    return function(t) {
                        var r = e.reduce(function(e, r) {
                            var n = r.useScope,
                                i = r.scopeName;
                            return eb({}, e, n(t)["__scope".concat(i)])
                        }, {});
                        return s.useMemo(function() {
                            return em({}, "__scope".concat(n.scopeName), r)
                        }, [r])
                    }
                };
                return i.scopeName = n.scopeName, i
            }
            var ew = (null == (lS = globalThis) ? void 0 : lS.document) ? s.useLayoutEffect : function() {};

            function eP(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var eO = s[" useId ".trim().toString()] || function() {},
                eS = 0;

            function ex(e) {
                var t, r = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = s.useState(eO())) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var i = [],
                                o = !0,
                                a = !1;
                            try {
                                for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 2 !== i.length); o = !0);
                            } catch (e) {
                                a = !0, r = e
                            } finally {
                                try {
                                    o || null == n.return || n.return()
                                } finally {
                                    if (a) throw r
                                }
                            }
                            return i
                        }
                    }(t) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return eP(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return eP(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r[0],
                    i = r[1];
                return ew(function() {
                    e || i(function(e) {
                        return null != e ? e : String(eS++)
                    })
                }, [e]), e || (n ? "radix-".concat(n) : "")
            }

            function ej(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function eI(e) {
                var t = s.useRef(e);
                return s.useEffect(function() {
                    t.current = e
                }), s.useMemo(function() {
                    return function() {
                        for (var e, r = arguments.length, n = Array(r), i = 0; i < r; i++) n[i] = arguments[i];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                            if (Array.isArray(e)) return ej(e)
                        }(n) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(n) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return ej(e, void 0);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ej(e, void 0)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }
                }, [])
            }

            function eE(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function eA(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            l = !1;
                        try {
                            for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return eE(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eE(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var eT = window.RadixUI["react-dismissable-layer"],
                eR = window.ReactDOM,
                eN = r.n(eR);

            function eC(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function eD(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function eM(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function ek(e, t) {
                if (null == e) return {};
                var r, n, i, o = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                    return o
                }
                if (o = function(e, t) {
                        if (null == e) return {};
                        var r, n, i = {},
                            o = Object.getOwnPropertyNames(e);
                        for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                        return i
                    }(e, t), Object.getOwnPropertySymbols)
                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                return o
            }

            function eF(e) {
                return function(e) {
                    if (Array.isArray(e)) return eC(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return eC(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return eC(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function eL(e) {
                var t, r, n = (t = e, (r = s.forwardRef(function(e, t) {
                        var r = e.children,
                            n = ek(e, ["children"]);
                        if (s.isValidElement(r)) {
                            var i, o, a, l, c, u = (c = (l = null == (o = Object.getOwnPropertyDescriptor((i = r).props, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? i.ref : (c = (l = null == (a = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                                d = function(e, t) {
                                    var r = eD({}, t);
                                    for (var n in t) ! function(n) {
                                        var i = e[n],
                                            o = t[n];
                                        /^on[A-Z]/.test(n) ? i && o ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            o.apply(void 0, eF(t)), i.apply(void 0, eF(t))
                                        } : i && (r[n] = i) : "style" === n ? r[n] = eD({}, i, o) : "className" === n && (r[n] = [i, o].filter(Boolean).join(" "))
                                    }(n);
                                    return eD({}, e, r)
                                }(n, r.props);
                            return r.type !== s.Fragment && (d.ref = t ? ed(t, u) : u), s.cloneElement(r, d)
                        }
                        return s.Children.count(r) > 1 ? s.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), r),
                    i = s.forwardRef(function(e, t) {
                        var r = e.children,
                            i = ek(e, ["children"]),
                            a = s.Children.toArray(r),
                            l = a.find(eU);
                        if (l) {
                            var c = l.props.children,
                                u = a.map(function(e) {
                                    return e !== l ? e : s.Children.count(c) > 1 ? s.Children.only(null) : s.isValidElement(c) ? c.props.children : null
                                });
                            return (0, o.jsx)(n, eM(eD({}, i), {
                                ref: t,
                                children: s.isValidElement(c) ? s.cloneElement(c, void 0, u) : null
                            }))
                        }
                        return (0, o.jsx)(n, eM(eD({}, i), {
                            ref: t,
                            children: r
                        }))
                    });
                return i.displayName = "".concat(e, ".Slot"), i
            }
            var e_ = Symbol("radix.slottable");

            function eU(e) {
                return s.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === e_
            }

            function eB(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function eq(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        eB(e, t, r[t])
                    })
                }
                return e
            }

            function eV(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }
            var ez = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                var r = eL("Primitive.".concat(t)),
                    n = s.forwardRef(function(e, n) {
                        var i = e.asChild,
                            a = function(e, t) {
                                if (null == e) return {};
                                var r, n, i, o = {};
                                if ("u" > typeof Reflect && Reflect.ownKeys) {
                                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                    return o
                                }
                                if (o = function(e, t) {
                                        if (null == e) return {};
                                        var r, n, i = {},
                                            o = Object.getOwnPropertyNames(e);
                                        for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                                        return i
                                    }(e, t), Object.getOwnPropertySymbols)
                                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                return o
                            }(e, ["asChild"]),
                            l = i ? r : t;
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, o.jsx)(l, eV(eq({}, a), {
                            ref: n
                        }))
                    });
                return n.displayName = "Primitive.".concat(t), eV(eq({}, e), eB({}, t, n))
            }, {});

            function eG(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function eH(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            l = !1;
                        try {
                            for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || eW(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function eW(e, t) {
                if (e) {
                    if ("string" == typeof e) return eG(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eG(e, t)
                }
            }
            var eK = "focusScope.autoFocusOnMount",
                eX = "focusScope.autoFocusOnUnmount",
                e$ = {
                    bubbles: !1,
                    cancelable: !0
                },
                eY = s.forwardRef(function(e, t) {
                    var r, n, i = e.loop,
                        a = void 0 !== i && i,
                        l = e.trapped,
                        c = void 0 !== l && l,
                        u = e.onMountAutoFocus,
                        d = e.onUnmountAutoFocus,
                        f = function(e, t) {
                            if (null == e) return {};
                            var r, n, i, o = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                return o
                            }
                            if (o = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, i = {},
                                        o = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                                    return i
                                }(e, t), Object.getOwnPropertySymbols)
                                for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                            return o
                        }(e, ["loop", "trapped", "onMountAutoFocus", "onUnmountAutoFocus"]),
                        p = eH(s.useState(null), 2),
                        m = p[0],
                        b = p[1],
                        y = eI(u),
                        h = eI(d),
                        v = s.useRef(null),
                        g = ef(t, function(e) {
                            return b(e)
                        }),
                        w = s.useRef({
                            paused: !1,
                            pause: function() {
                                this.paused = !0
                            },
                            resume: function() {
                                this.paused = !1
                            }
                        }).current;
                    s.useEffect(function() {
                        if (c) {
                            var e = function(e) {
                                    if (!w.paused && m) {
                                        var t = e.target;
                                        m.contains(t) ? v.current = t : eZ(v.current, {
                                            select: !0
                                        })
                                    }
                                },
                                t = function(e) {
                                    if (!w.paused && m) {
                                        var t = e.relatedTarget;
                                        null !== t && (m.contains(t) || eZ(v.current, {
                                            select: !0
                                        }))
                                    }
                                };
                            document.addEventListener("focusin", e), document.addEventListener("focusout", t);
                            var r = new MutationObserver(function(e) {
                                if (document.activeElement === document.body) {
                                    var t = !0,
                                        r = !1,
                                        n = void 0;
                                    try {
                                        for (var i, o = e[Symbol.iterator](); !(t = (i = o.next()).done); t = !0) i.value.removedNodes.length > 0 && eZ(m)
                                    } catch (e) {
                                        r = !0, n = e
                                    } finally {
                                        try {
                                            t || null == o.return || o.return()
                                        } finally {
                                            if (r) throw n
                                        }
                                    }
                                }
                            });
                            return m && r.observe(m, {
                                    childList: !0,
                                    subtree: !0
                                }),
                                function() {
                                    document.removeEventListener("focusin", e), document.removeEventListener("focusout", t), r.disconnect()
                                }
                        }
                    }, [c, m, w.paused]), s.useEffect(function() {
                        if (m) {
                            e0.add(w);
                            var e = document.activeElement;
                            if (!m.contains(e)) {
                                var t = new CustomEvent(eK, e$);
                                m.addEventListener(eK, y), m.dispatchEvent(t), t.defaultPrevented || (function(e) {
                                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                                        r = t.select,
                                        n = void 0 !== r && r,
                                        i = document.activeElement,
                                        o = !0,
                                        a = !1,
                                        l = void 0;
                                    try {
                                        for (var c, s = e[Symbol.iterator](); !(o = (c = s.next()).done); o = !0) {
                                            var u = c.value;
                                            if (eZ(u, {
                                                    select: n
                                                }), document.activeElement !== i) return
                                        }
                                    } catch (e) {
                                        a = !0, l = e
                                    } finally {
                                        try {
                                            o || null == s.return || s.return()
                                        } finally {
                                            if (a) throw l
                                        }
                                    }
                                }(eJ(m).filter(function(e) {
                                    return "A" !== e.tagName
                                }), {
                                    select: !0
                                }), document.activeElement === e && eZ(m))
                            }
                            return function() {
                                m.removeEventListener(eK, y), setTimeout(function() {
                                    var t = new CustomEvent(eX, e$);
                                    m.addEventListener(eX, h), m.dispatchEvent(t), t.defaultPrevented || eZ(null != e ? e : document.body, {
                                        select: !0
                                    }), m.removeEventListener(eX, h), e0.remove(w)
                                }, 0)
                            }
                        }
                    }, [m, y, h, w]);
                    var P = s.useCallback(function(e) {
                        if ((a || c) && !w.paused) {
                            var t = "Tab" === e.key && !e.altKey && !e.ctrlKey && !e.metaKey,
                                r = document.activeElement;
                            if (t && r) {
                                var n, i, o = e.currentTarget,
                                    l = eH([eQ(i = eJ(n = o), n), eQ(i.reverse(), n)], 2),
                                    s = l[0],
                                    u = l[1];
                                s && u ? e.shiftKey || r !== u ? e.shiftKey && r === s && (e.preventDefault(), a && eZ(u, {
                                    select: !0
                                })) : (e.preventDefault(), a && eZ(s, {
                                    select: !0
                                })) : r === o && e.preventDefault()
                            }
                        }
                    }, [a, c, w.paused]);
                    return (0, o.jsx)(ez.div, (r = function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var r = null != arguments[t] ? arguments[t] : {},
                                n = Object.keys(r);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(r, e).enumerable
                            }))), n.forEach(function(t) {
                                var n;
                                n = r[t], t in e ? Object.defineProperty(e, t, {
                                    value: n,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = n
                            })
                        }
                        return e
                    }({
                        tabIndex: -1
                    }, f), n = n = {
                        ref: g,
                        onKeyDown: P
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(n)).forEach(function(e) {
                        Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                    }), r))
                });

            function eJ(e) {
                for (var t = [], r = document.createTreeWalker(e, NodeFilter.SHOW_ELEMENT, {
                        acceptNode: function(e) {
                            var t = "INPUT" === e.tagName && "hidden" === e.type;
                            return e.disabled || e.hidden || t ? NodeFilter.FILTER_SKIP : e.tabIndex >= 0 ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_SKIP
                        }
                    }); r.nextNode();) t.push(r.currentNode);
                return t
            }

            function eQ(e, t) {
                var r = !0,
                    n = !1,
                    i = void 0;
                try {
                    for (var o, a = e[Symbol.iterator](); !(r = (o = a.next()).done); r = !0) {
                        var l = o.value;
                        if (! function(e, t) {
                                var r = t.upTo;
                                if ("hidden" === getComputedStyle(e).visibility) return !0;
                                for (; e && (void 0 === r || e !== r);) {
                                    if ("none" === getComputedStyle(e).display) return !0;
                                    e = e.parentElement
                                }
                                return !1
                            }(l, {
                                upTo: t
                            })) return l
                    }
                } catch (e) {
                    n = !0, i = e
                } finally {
                    try {
                        r || null == a.return || a.return()
                    } finally {
                        if (n) throw i
                    }
                }
            }

            function eZ(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    r = t.select;
                if (e && e.focus) {
                    var n, i, o, a = document.activeElement;
                    e.focus({
                        preventScroll: !0
                    }), e !== a && (i = n = e, null != (o = HTMLInputElement) && "u" > typeof Symbol && o[Symbol.hasInstance] ? !!o[Symbol.hasInstance](i) : i instanceof o) && "select" in n && void 0 !== r && r && e.select()
                }
            }
            eY.displayName = "FocusScope";
            var e0 = (lo = [], {
                add: function(e) {
                    var t = lo[0];
                    e !== t && (null == t || t.pause()), (lo = e1(lo, e)).unshift(e)
                },
                remove: function(e) {
                    var t;
                    null == (t = (lo = e1(lo, e))[0]) || t.resume()
                }
            });

            function e1(e, t) {
                var r = function(e) {
                        if (Array.isArray(e)) return eG(e)
                    }(e) || function(e) {
                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(e) || eW(e) || function() {
                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r.indexOf(t);
                return -1 !== n && r.splice(n, 1), r
            }

            function e2(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var e3 = s.forwardRef(function(e, t) {
                var r, n, i, a, l, c = e.container,
                    u = function(e, t) {
                        if (null == e) return {};
                        var r, n, i, o = {};
                        if ("u" > typeof Reflect && Reflect.ownKeys) {
                            for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                            return o
                        }
                        if (o = function(e, t) {
                                if (null == e) return {};
                                var r, n, i = {},
                                    o = Object.getOwnPropertyNames(e);
                                for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                                return i
                            }(e, t), Object.getOwnPropertySymbols)
                            for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                        return o
                    }(e, ["container"]),
                    d = function(e) {
                        if (Array.isArray(e)) return e
                    }(r = s.useState(!1)) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var i = [],
                                o = !0,
                                a = !1;
                            try {
                                for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 2 !== i.length); o = !0);
                            } catch (e) {
                                a = !0, r = e
                            } finally {
                                try {
                                    o || null == n.return || n.return()
                                } finally {
                                    if (a) throw r
                                }
                            }
                            return i
                        }
                    }(r) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return e2(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return e2(e, 2)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    f = d[0],
                    p = d[1];
                ew(function() {
                    return p(!0)
                }, []);
                var m = c || f && (null == (l = globalThis) || null == (a = l.document) ? void 0 : a.body);
                return m ? eN().createPortal((0, o.jsx)(ez.div, (n = function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var r = null != arguments[t] ? arguments[t] : {},
                            n = Object.keys(r);
                        "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                            return Object.getOwnPropertyDescriptor(r, e).enumerable
                        }))), n.forEach(function(t) {
                            var n;
                            n = r[t], t in e ? Object.defineProperty(e, t, {
                                value: n,
                                enumerable: !0,
                                configurable: !0,
                                writable: !0
                            }) : e[t] = n
                        })
                    }
                    return e
                }({}, u), i = i = {
                    ref: t
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(i)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(i)).forEach(function(e) {
                    Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(i, e))
                }), n)), m) : null
            });

            function e4(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function e6(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            l = !1;
                        try {
                            for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return e4(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return e4(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            e3.displayName = "Portal";
            var e8 = function(e) {
                var t, r, n, i, o, a, l, c, u, d, f, p, m, b, y, h, v, g = e.present,
                    w = e.children,
                    P = (t = g, o = (i = e6(s.useState(), 2))[0], a = i[1], l = s.useRef({}), c = s.useRef(t), u = s.useRef("none"), f = (d = e6((r = t ? "mounted" : "unmounted", n = {
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
                    }, s.useReducer(function(e, t) {
                        var r = n[e][t];
                        return null != r ? r : e
                    }, r)), 2))[0], p = d[1], s.useEffect(function() {
                        var e = e5(l.current);
                        u.current = "mounted" === f ? e : "none"
                    }, [f]), ew(function() {
                        var e = l.current,
                            r = c.current;
                        if (r !== t) {
                            var n = u.current,
                                i = e5(e);
                            t ? p("MOUNT") : "none" === i || (null == e ? void 0 : e.display) === "none" ? p("UNMOUNT") : r && n !== i ? p("ANIMATION_OUT") : p("UNMOUNT"), c.current = t
                        }
                    }, [t, p]), ew(function() {
                        if (o) {
                            var e, t, r = null != (e = o.ownerDocument.defaultView) ? e : window,
                                n = function(e) {
                                    var n = e5(l.current).includes(e.animationName);
                                    if (e.target === o && n && (p("ANIMATION_END"), !c.current)) {
                                        var i = o.style.animationFillMode;
                                        o.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                            "forwards" === o.style.animationFillMode && (o.style.animationFillMode = i)
                                        })
                                    }
                                },
                                i = function(e) {
                                    e.target === o && (u.current = e5(l.current))
                                };
                            return o.addEventListener("animationstart", i), o.addEventListener("animationcancel", n), o.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(t), o.removeEventListener("animationstart", i), o.removeEventListener("animationcancel", n), o.removeEventListener("animationend", n)
                                }
                        }
                        p("ANIMATION_END")
                    }, [o, p]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: s.useCallback(function(e) {
                            e && (l.current = getComputedStyle(e)), a(e)
                        }, [])
                    }),
                    O = "function" == typeof w ? w({
                        present: P.isPresent
                    }) : s.Children.only(w),
                    S = ef(P.ref, (v = (h = null == (b = Object.getOwnPropertyDescriptor((m = O).props, "ref")) ? void 0 : b.get) && "isReactWarning" in h && h.isReactWarning) ? m.ref : (v = (h = null == (y = Object.getOwnPropertyDescriptor(m, "ref")) ? void 0 : y.get) && "isReactWarning" in h && h.isReactWarning) ? m.props.ref : m.props.ref || m.ref);
                return "function" == typeof w || P.isPresent ? s.cloneElement(O, {
                    ref: S
                }) : null
            };

            function e5(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }
            e8.displayName = "Presence";
            var e7 = window.RadixUI["react-focus-guards"],
                e9 = function() {
                    return (e9 = Object.assign || function(e) {
                        for (var t, r = 1, n = arguments.length; r < n; r++)
                            for (var i in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
                        return e
                    }).apply(this, arguments)
                };

            function te(e, t) {
                var r = {};
                for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && 0 > t.indexOf(n) && (r[n] = e[n]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols)
                    for (var i = 0, n = Object.getOwnPropertySymbols(e); i < n.length; i++) 0 > t.indexOf(n[i]) && Object.prototype.propertyIsEnumerable.call(e, n[i]) && (r[n[i]] = e[n[i]]);
                return r
            }
            var tt = "right-scroll-bar-position",
                tr = "width-before-scroll-bar";

            function tn(e, t) {
                return "function" == typeof e ? e(t) : e && (e.current = t), e
            }
            var ti = "u" > typeof window ? s.useLayoutEffect : s.useEffect,
                to = new WeakMap,
                ta = (void 0 === ll && (ll = {}), (void 0 === lc && (lc = function(e) {
                    return e
                }), ls = [], lu = !1, ld = {
                    read: function() {
                        if (lu) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                        return ls.length ? ls[ls.length - 1] : null
                    },
                    useMedium: function(e) {
                        var t = lc(e, lu);
                        return ls.push(t),
                            function() {
                                ls = ls.filter(function(e) {
                                    return e !== t
                                })
                            }
                    },
                    assignSyncMedium: function(e) {
                        for (lu = !0; ls.length;) {
                            var t = ls;
                            ls = [], t.forEach(e)
                        }
                        ls = {
                            push: function(t) {
                                return e(t)
                            },
                            filter: function() {
                                return ls
                            }
                        }
                    },
                    assignMedium: function(e) {
                        lu = !0;
                        var t = [];
                        if (ls.length) {
                            var r = ls;
                            ls = [], r.forEach(e), t = ls
                        }
                        var n = function() {
                                var r = t;
                                t = [], r.forEach(e)
                            },
                            i = function() {
                                return Promise.resolve().then(n)
                            };
                        i(), ls = {
                            push: function(e) {
                                t.push(e), i()
                            },
                            filter: function(e) {
                                return t = t.filter(e), ls
                            }
                        }
                    }
                }).options = e9({
                    async: !0,
                    ssr: !1
                }, ll), ld),
                tl = function() {},
                tc = s.forwardRef(function(e, t) {
                    var r, n, i, o, a = s.useRef(null),
                        l = s.useState({
                            onScrollCapture: tl,
                            onWheelCapture: tl,
                            onTouchMoveCapture: tl
                        }),
                        c = l[0],
                        u = l[1],
                        d = e.forwardProps,
                        f = e.children,
                        p = e.className,
                        m = e.removeScrollBar,
                        b = e.enabled,
                        y = e.shards,
                        h = e.sideCar,
                        v = e.noRelative,
                        g = e.noIsolation,
                        w = e.inert,
                        P = e.allowPinchZoom,
                        O = e.as,
                        S = e.gapMode,
                        x = te(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        j = (r = [a, t], n = function(e) {
                            return r.forEach(function(t) {
                                return tn(t, e)
                            })
                        }, (i = (0, s.useState)(function() {
                            return {
                                value: null,
                                callback: n,
                                facade: {
                                    get current() {
                                        return i.value
                                    },
                                    set current(value) {
                                        var e = i.value;
                                        e !== value && (i.value = value, i.callback(value, e))
                                    }
                                }
                            }
                        })[0]).callback = n, o = i.facade, ti(function() {
                            var e = to.get(o);
                            if (e) {
                                var t = new Set(e),
                                    n = new Set(r),
                                    i = o.current;
                                t.forEach(function(e) {
                                    n.has(e) || tn(e, null)
                                }), n.forEach(function(e) {
                                    t.has(e) || tn(e, i)
                                })
                            }
                            to.set(o, r)
                        }, [r]), o),
                        I = e9(e9({}, x), c);
                    return s.createElement(s.Fragment, null, b && s.createElement(h, {
                        sideCar: ta,
                        removeScrollBar: m,
                        shards: y,
                        noRelative: v,
                        noIsolation: g,
                        inert: w,
                        setCallbacks: u,
                        allowPinchZoom: !!P,
                        lockRef: a,
                        gapMode: S
                    }), d ? s.cloneElement(s.Children.only(f), e9(e9({}, I), {
                        ref: j
                    })) : s.createElement(void 0 === O ? "div" : O, e9({}, I, {
                        className: p,
                        ref: j
                    }), f))
                });
            tc.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, tc.classNames = {
                fullWidth: tr,
                zeroRight: tt
            };
            var ts = function(e) {
                var t = e.sideCar,
                    r = te(e, ["sideCar"]);
                if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                var n = t.read();
                if (!n) throw Error("Sidecar medium not found");
                return s.createElement(n, e9({}, r))
            };
            ts.isSideCarExport = !0;
            var tu = function() {
                    var e = 0,
                        t = null;
                    return {
                        add: function(n) {
                            if (0 == e && (t = function() {
                                    if (!document) return null;
                                    var e = document.createElement("style");
                                    e.type = "text/css";
                                    var t = lx || r.nc;
                                    return t && e.setAttribute("nonce", t), e
                                }())) {
                                var i, o;
                                (i = t).styleSheet ? i.styleSheet.cssText = n : i.appendChild(document.createTextNode(n)), o = t, (document.head || document.getElementsByTagName("head")[0]).appendChild(o)
                            }
                            e++
                        },
                        remove: function() {
                            --e || !t || (t.parentNode && t.parentNode.removeChild(t), t = null)
                        }
                    }
                },
                td = function() {
                    var e = tu();
                    return function(t, r) {
                        s.useEffect(function() {
                            return e.add(t),
                                function() {
                                    e.remove()
                                }
                        }, [t && r])
                    }
                },
                tf = function() {
                    var e = td();
                    return function(t) {
                        return e(t.styles, t.dynamic), null
                    }
                },
                tp = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                tm = function(e) {
                    return parseInt(e || "", 10) || 0
                },
                tb = function(e) {
                    var t = window.getComputedStyle(document.body),
                        r = t["padding" === e ? "paddingLeft" : "marginLeft"],
                        n = t["padding" === e ? "paddingTop" : "marginTop"],
                        i = t["padding" === e ? "paddingRight" : "marginRight"];
                    return [tm(r), tm(n), tm(i)]
                },
                ty = function(e) {
                    if (void 0 === e && (e = "margin"), "u" < typeof window) return tp;
                    var t = tb(e),
                        r = document.documentElement.clientWidth,
                        n = window.innerWidth;
                    return {
                        left: t[0],
                        top: t[1],
                        right: t[2],
                        gap: Math.max(0, n - r + t[2] - t[0])
                    }
                },
                th = tf(),
                tv = "data-scroll-locked",
                tg = function(e, t, r, n) {
                    var i = e.left,
                        o = e.top,
                        a = e.right,
                        l = e.gap;
                    return void 0 === r && (r = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(n, ";\n   padding-right: ").concat(l, "px ").concat(n, ";\n  }\n  body[").concat(tv, "] {\n    overflow: hidden ").concat(n, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(n, ";"), "margin" === r && "\n    padding-left: ".concat(i, "px;\n    padding-top: ").concat(o, "px;\n    padding-right: ").concat(a, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(l, "px ").concat(n, ";\n    "), "padding" === r && "padding-right: ".concat(l, "px ").concat(n, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(tt, " {\n    right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(tr, " {\n    margin-right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(tt, " .").concat(tt, " {\n    right: 0 ").concat(n, ";\n  }\n  \n  .").concat(tr, " .").concat(tr, " {\n    margin-right: 0 ").concat(n, ";\n  }\n  \n  body[").concat(tv, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(l, "px;\n  }\n")
                },
                tw = function() {
                    var e = parseInt(document.body.getAttribute(tv) || "0", 10);
                    return isFinite(e) ? e : 0
                },
                tP = function() {
                    s.useEffect(function() {
                        return document.body.setAttribute(tv, (tw() + 1).toString()),
                            function() {
                                var e = tw() - 1;
                                e <= 0 ? document.body.removeAttribute(tv) : document.body.setAttribute(tv, e.toString())
                            }
                    }, [])
                },
                tO = function(e) {
                    var t = e.noRelative,
                        r = e.noImportant,
                        n = e.gapMode,
                        i = void 0 === n ? "margin" : n;
                    tP();
                    var o = s.useMemo(function() {
                        return ty(i)
                    }, [i]);
                    return s.createElement(th, {
                        styles: tg(o, !t, i, r ? "" : "!important")
                    })
                },
                tS = !1;
            if ("u" > typeof window) try {
                var tx = Object.defineProperty({}, "passive", {
                    get: function() {
                        return tS = !0, !0
                    }
                });
                window.addEventListener("test", tx, tx), window.removeEventListener("test", tx, tx)
            } catch (e) {
                tS = !1
            }
            var tj = !!tS && {
                passive: !1
            };

            function tI(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var tE = function(e, t) {
                    if (!tI(e, Element)) return !1;
                    var r = window.getComputedStyle(e);
                    return "hidden" !== r[t] && (r.overflowY !== r.overflowX || "TEXTAREA" === e.tagName || "visible" !== r[t])
                },
                tA = function(e, t) {
                    var r = t.ownerDocument,
                        n = t;
                    do {
                        if ("u" > typeof ShadowRoot && tI(n, ShadowRoot) && (n = n.host), tT(e, n)) {
                            var i = tR(e, n);
                            if (i[1] > i[2]) return !0
                        }
                        n = n.parentNode
                    } while (n && n !== r.body);
                    return !1
                },
                tT = function(e, t) {
                    return "v" === e ? tE(t, "overflowY") : tE(t, "overflowX")
                },
                tR = function(e, t) {
                    return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
                },
                tN = function(e, t, r, n, i) {
                    var o, a = (o = window.getComputedStyle(t).direction, "h" === e && "rtl" === o ? -1 : 1),
                        l = a * n,
                        c = r.target,
                        s = t.contains(c),
                        u = !1,
                        d = l > 0,
                        f = 0,
                        p = 0;
                    do {
                        if (!c) break;
                        var m = tR(e, c),
                            b = m[0],
                            y = m[1] - m[2] - a * b;
                        (b || y) && tT(e, c) && (f += y, p += b);
                        var h = c.parentNode;
                        c = h && h.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? h.host : h
                    } while (!s && c !== document.body || s && (t.contains(c) || t === c));
                    return d && (i && 1 > Math.abs(f) || !i && l > f) ? u = !0 : !d && (i && 1 > Math.abs(p) || !i && -l > p) && (u = !0), u
                },
                tC = function(e) {
                    return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
                },
                tD = function(e) {
                    return [e.deltaX, e.deltaY]
                },
                tM = function(e) {
                    return e && "current" in e ? e.current : e
                },
                tk = 0,
                tF = [],
                tL = (lf = function(e) {
                    var t = s.useRef([]),
                        r = s.useRef([0, 0]),
                        n = s.useRef(),
                        i = s.useState(tk++)[0],
                        o = s.useState(tf)[0],
                        a = s.useRef(e);
                    s.useEffect(function() {
                        a.current = e
                    }, [e]), s.useEffect(function() {
                        if (e.inert) {
                            document.body.classList.add("block-interactivity-".concat(i));
                            var t = (function(e, t, r) {
                                if (r || 2 == arguments.length)
                                    for (var n, i = 0, o = t.length; i < o; i++) !n && i in t || (n || (n = Array.prototype.slice.call(t, 0, i)), n[i] = t[i]);
                                return e.concat(n || Array.prototype.slice.call(t))
                            })([e.lockRef.current], (e.shards || []).map(tM), !0).filter(Boolean);
                            return t.forEach(function(e) {
                                    return e.classList.add("allow-interactivity-".concat(i))
                                }),
                                function() {
                                    document.body.classList.remove("block-interactivity-".concat(i)), t.forEach(function(e) {
                                        return e.classList.remove("allow-interactivity-".concat(i))
                                    })
                                }
                        }
                    }, [e.inert, e.lockRef.current, e.shards]);
                    var l = s.useCallback(function(e, t) {
                            if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !a.current.allowPinchZoom;
                            var i, o = tC(e),
                                l = r.current,
                                c = "deltaX" in e ? e.deltaX : l[0] - o[0],
                                s = "deltaY" in e ? e.deltaY : l[1] - o[1],
                                u = e.target,
                                d = Math.abs(c) > Math.abs(s) ? "h" : "v";
                            if ("touches" in e && "h" === d && "range" === u.type) return !1;
                            var f = tA(d, u);
                            if (!f) return !0;
                            if (f ? i = d : (i = "v" === d ? "h" : "v", f = tA(d, u)), !f) return !1;
                            if (!n.current && "changedTouches" in e && (c || s) && (n.current = i), !i) return !0;
                            var p = n.current || i;
                            return tN(p, t, e, "h" === p ? c : s, !0)
                        }, []),
                        c = s.useCallback(function(e) {
                            if (tF.length && tF[tF.length - 1] === o) {
                                var r = "deltaY" in e ? tD(e) : tC(e),
                                    n = t.current.filter(function(t) {
                                        var n;
                                        return t.name === e.type && (t.target === e.target || e.target === t.shadowParent) && (n = t.delta, n[0] === r[0] && n[1] === r[1])
                                    })[0];
                                if (n && n.should) {
                                    e.cancelable && e.preventDefault();
                                    return
                                }
                                if (!n) {
                                    var i = (a.current.shards || []).map(tM).filter(Boolean).filter(function(t) {
                                        return t.contains(e.target)
                                    });
                                    (i.length > 0 ? l(e, i[0]) : !a.current.noIsolation) && e.cancelable && e.preventDefault()
                                }
                            }
                        }, []),
                        u = s.useCallback(function(e, r, n, i) {
                            var o = {
                                name: e,
                                delta: r,
                                target: n,
                                should: i,
                                shadowParent: function(e) {
                                    for (var t, r, n = null; null !== e;) t = e, (null != (r = ShadowRoot) && "u" > typeof Symbol && r[Symbol.hasInstance] ? !!r[Symbol.hasInstance](t) : t instanceof r) && (n = e.host, e = e.host), e = e.parentNode;
                                    return n
                                }(n)
                            };
                            t.current.push(o), setTimeout(function() {
                                t.current = t.current.filter(function(e) {
                                    return e !== o
                                })
                            }, 1)
                        }, []),
                        d = s.useCallback(function(e) {
                            r.current = tC(e), n.current = void 0
                        }, []),
                        f = s.useCallback(function(t) {
                            u(t.type, tD(t), t.target, l(t, e.lockRef.current))
                        }, []),
                        p = s.useCallback(function(t) {
                            u(t.type, tC(t), t.target, l(t, e.lockRef.current))
                        }, []);
                    s.useEffect(function() {
                        return tF.push(o), e.setCallbacks({
                                onScrollCapture: f,
                                onWheelCapture: f,
                                onTouchMoveCapture: p
                            }), document.addEventListener("wheel", c, tj), document.addEventListener("touchmove", c, tj), document.addEventListener("touchstart", d, tj),
                            function() {
                                tF = tF.filter(function(e) {
                                    return e !== o
                                }), document.removeEventListener("wheel", c, tj), document.removeEventListener("touchmove", c, tj), document.removeEventListener("touchstart", d, tj)
                            }
                    }, []);
                    var m = e.removeScrollBar,
                        b = e.inert;
                    return s.createElement(s.Fragment, null, b ? s.createElement(o, {
                        styles: "\n  .block-interactivity-".concat(i, " {pointer-events: none;}\n  .allow-interactivity-").concat(i, " {pointer-events: all;}\n")
                    }) : null, m ? s.createElement(tO, {
                        noRelative: e.noRelative,
                        gapMode: e.gapMode
                    }) : null)
                }, ta.useMedium(lf), ts),
                t_ = s.forwardRef(function(e, t) {
                    return s.createElement(tc, e9({}, e, {
                        ref: t,
                        sideCar: tL
                    }))
                });
            t_.classNames = tc.classNames;
            var tU = new WeakMap,
                tB = new WeakMap,
                tq = {},
                tV = 0,
                tz = function(e) {
                    return e && (e.host || tz(e.parentNode))
                },
                tG = function(e, t, r, n) {
                    var i = (Array.isArray(e) ? e : [e]).map(function(e) {
                        if (t.contains(e)) return e;
                        var r = tz(e);
                        return r && t.contains(r) ? r : (console.error("aria-hidden", e, "in not contained inside", t, ". Doing nothing"), null)
                    }).filter(function(e) {
                        return !!e
                    });
                    tq[r] || (tq[r] = new WeakMap);
                    var o = tq[r],
                        a = [],
                        l = new Set,
                        c = new Set(i),
                        s = function(e) {
                            !e || l.has(e) || (l.add(e), s(e.parentNode))
                        };
                    i.forEach(s);
                    var u = function(e) {
                        !e || c.has(e) || Array.prototype.forEach.call(e.children, function(e) {
                            if (l.has(e)) u(e);
                            else try {
                                var t = e.getAttribute(n),
                                    i = null !== t && "false" !== t,
                                    c = (tU.get(e) || 0) + 1,
                                    s = (o.get(e) || 0) + 1;
                                tU.set(e, c), o.set(e, s), a.push(e), 1 === c && i && tB.set(e, !0), 1 === s && e.setAttribute(r, "true"), i || e.setAttribute(n, "true")
                            } catch (t) {
                                console.error("aria-hidden: cannot operate on ", e, t)
                            }
                        })
                    };
                    return u(t), l.clear(), tV++,
                        function() {
                            a.forEach(function(e) {
                                var t = tU.get(e) - 1,
                                    i = o.get(e) - 1;
                                tU.set(e, t), o.set(e, i), t || (tB.has(e) || e.removeAttribute(n), tB.delete(e)), i || e.removeAttribute(r)
                            }), --tV || (tU = new WeakMap, tU = new WeakMap, tB = new WeakMap, tq = {})
                        }
                },
                tH = function(e, t, r) {
                    void 0 === r && (r = "data-aria-hidden");
                    var n = Array.from(Array.isArray(e) ? e : [e]),
                        i = t || ("u" < typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body);
                    return i ? (n.push.apply(n, Array.from(i.querySelectorAll("[aria-live], script"))), tG(n, i, r, "aria-hidden")) : function() {
                        return null
                    }
                };

            function tW(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tK(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function tX(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function t$(e, t) {
                if (null == e) return {};
                var r, n, i, o = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                    return o
                }
                if (o = function(e, t) {
                        if (null == e) return {};
                        var r, n, i = {},
                            o = Object.getOwnPropertyNames(e);
                        for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                        return i
                    }(e, t), Object.getOwnPropertySymbols)
                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                return o
            }

            function tY(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            l = !1;
                        try {
                            for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return tW(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tW(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var tJ = "Dialog",
                tQ = tY(ev(tJ), 2),
                tZ = tQ[0];
            tQ[1];
            var t0 = tY(tZ(tJ), 2),
                t1 = t0[0],
                t2 = t0[1],
                t3 = function(e) {
                    var t, r, n, i, a, l, c, u, d, f, p, m, b, y, h, v, g, w = e.__scopeDialog,
                        P = e.children,
                        O = e.open,
                        S = e.defaultOpen,
                        x = e.onOpenChange,
                        j = e.modal,
                        I = s.useRef(null),
                        E = s.useRef(null),
                        A = tY((d = (u = {
                            prop: O,
                            defaultProp: S,
                            onChange: x
                        }).prop, b = (m = eA((r = (t = {
                            defaultProp: u.defaultProp,
                            onChange: p = void 0 === (f = u.onChange) ? function() {} : f
                        }).defaultProp, n = t.onChange, a = eA(i = s.useState(r), 1)[0], l = s.useRef(a), c = eI(n), s.useEffect(function() {
                            l.current !== a && (c(a), l.current = a)
                        }, [a, l, c]), i), 2))[0], y = m[1], v = (h = void 0 !== d) ? d : b, g = eI(p), [v, s.useCallback(function(e) {
                            if (h) {
                                var t = "function" == typeof e ? e(d) : e;
                                t !== d && g(t)
                            } else y(e)
                        }, [h, d, y, g])]), 2),
                        T = A[0],
                        R = A[1];
                    return (0, o.jsx)(t1, {
                        scope: w,
                        triggerRef: I,
                        contentRef: E,
                        contentId: ex(),
                        titleId: ex(),
                        descriptionId: ex(),
                        open: void 0 !== T && T,
                        onOpenChange: R,
                        onOpenToggle: s.useCallback(function() {
                            return R(function(e) {
                                return !e
                            })
                        }, [R]),
                        modal: void 0 === j || j,
                        children: P
                    })
                };
            t3.displayName = tJ;
            var t4 = "DialogTrigger";
            s.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = t$(e, ["__scopeDialog"]),
                    i = t2(t4, r),
                    a = ef(t, i.triggerRef);
                return (0, o.jsx)(ez.button, tX(tK({
                    type: "button",
                    "aria-haspopup": "dialog",
                    "aria-expanded": i.open,
                    "aria-controls": i.contentId,
                    "data-state": rm(i.open)
                }, n), {
                    ref: a,
                    onClick: ec(e.onClick, i.onOpenToggle)
                }))
            }).displayName = t4;
            var t6 = "DialogPortal",
                t8 = tY(tZ(t6, {
                    forceMount: void 0
                }), 2),
                t5 = t8[0],
                t7 = t8[1],
                t9 = function(e) {
                    var t = e.__scopeDialog,
                        r = e.forceMount,
                        n = e.children,
                        i = e.container,
                        a = t2(t6, t);
                    return (0, o.jsx)(t5, {
                        scope: t,
                        forceMount: r,
                        children: s.Children.map(n, function(e) {
                            return (0, o.jsx)(e8, {
                                present: r || a.open,
                                children: (0, o.jsx)(e3, {
                                    asChild: !0,
                                    container: i,
                                    children: e
                                })
                            })
                        })
                    })
                };
            t9.displayName = t6;
            var re = "DialogOverlay",
                rt = s.forwardRef(function(e, t) {
                    var r = t7(re, e.__scopeDialog),
                        n = e.forceMount,
                        i = void 0 === n ? r.forceMount : n,
                        a = t$(e, ["forceMount"]),
                        l = t2(re, e.__scopeDialog);
                    return l.modal ? (0, o.jsx)(e8, {
                        present: i || l.open,
                        children: (0, o.jsx)(rn, tX(tK({}, a), {
                            ref: t
                        }))
                    }) : null
                });
            rt.displayName = re;
            var rr = eL("DialogOverlay.RemoveScroll"),
                rn = s.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = t$(e, ["__scopeDialog"]),
                        i = t2(re, r);
                    return (0, o.jsx)(t_, {
                        as: rr,
                        allowPinchZoom: !0,
                        shards: [i.contentRef],
                        children: (0, o.jsx)(ez.div, tX(tK({
                            "data-state": rm(i.open)
                        }, n), {
                            ref: t,
                            style: tK({
                                pointerEvents: "auto"
                            }, n.style)
                        }))
                    })
                }),
                ri = "DialogContent",
                ro = s.forwardRef(function(e, t) {
                    var r = t7(ri, e.__scopeDialog),
                        n = e.forceMount,
                        i = void 0 === n ? r.forceMount : n,
                        a = t$(e, ["forceMount"]),
                        l = t2(ri, e.__scopeDialog);
                    return (0, o.jsx)(e8, {
                        present: i || l.open,
                        children: l.modal ? (0, o.jsx)(ra, tX(tK({}, a), {
                            ref: t
                        })) : (0, o.jsx)(rl, tX(tK({}, a), {
                            ref: t
                        }))
                    })
                });
            ro.displayName = ri;
            var ra = s.forwardRef(function(e, t) {
                    var r = t2(ri, e.__scopeDialog),
                        n = s.useRef(null),
                        i = ef(t, r.contentRef, n);
                    return s.useEffect(function() {
                        var e = n.current;
                        if (e) return tH(e)
                    }, []), (0, o.jsx)(rc, tX(tK({}, e), {
                        ref: i,
                        trapFocus: r.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: ec(e.onCloseAutoFocus, function(e) {
                            var t;
                            e.preventDefault(), null == (t = r.triggerRef.current) || t.focus()
                        }),
                        onPointerDownOutside: ec(e.onPointerDownOutside, function(e) {
                            var t = e.detail.originalEvent,
                                r = 0 === t.button && !0 === t.ctrlKey;
                            (2 === t.button || r) && e.preventDefault()
                        }),
                        onFocusOutside: ec(e.onFocusOutside, function(e) {
                            return e.preventDefault()
                        })
                    }))
                }),
                rl = s.forwardRef(function(e, t) {
                    var r = t2(ri, e.__scopeDialog),
                        n = s.useRef(!1),
                        i = s.useRef(!1);
                    return (0, o.jsx)(rc, tX(tK({}, e), {
                        ref: t,
                        trapFocus: !1,
                        disableOutsidePointerEvents: !1,
                        onCloseAutoFocus: function(t) {
                            var o, a;
                            null == (o = e.onCloseAutoFocus) || o.call(e, t), t.defaultPrevented || (n.current || null == (a = r.triggerRef.current) || a.focus(), t.preventDefault()), n.current = !1, i.current = !1
                        },
                        onInteractOutside: function(t) {
                            null == (o = e.onInteractOutside) || o.call(e, t), t.defaultPrevented || (n.current = !0, "pointerdown" === t.detail.originalEvent.type && (i.current = !0));
                            var o, a, l = t.target;
                            (null == (a = r.triggerRef.current) ? void 0 : a.contains(l)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && i.current && t.preventDefault()
                        }
                    }))
                }),
                rc = s.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = e.trapFocus,
                        i = e.onOpenAutoFocus,
                        a = e.onCloseAutoFocus,
                        l = t$(e, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        c = t2(ri, r),
                        u = s.useRef(null),
                        d = ef(t, u);
                    return (0, e7.useFocusGuards)(), (0, o.jsxs)(o.Fragment, {
                        children: [(0, o.jsx)(eY, {
                            asChild: !0,
                            loop: !0,
                            trapped: n,
                            onMountAutoFocus: i,
                            onUnmountAutoFocus: a,
                            children: (0, o.jsx)(eT.DismissableLayer, tX(tK({
                                role: "dialog",
                                id: c.contentId,
                                "aria-describedby": c.descriptionId,
                                "aria-labelledby": c.titleId,
                                "data-state": rm(c.open)
                            }, l), {
                                ref: d,
                                onDismiss: function() {
                                    return c.onOpenChange(!1)
                                }
                            }))
                        }), (0, o.jsxs)(o.Fragment, {
                            children: [(0, o.jsx)(rv, {
                                titleId: c.titleId
                            }), (0, o.jsx)(rg, {
                                contentRef: u,
                                descriptionId: c.descriptionId
                            })]
                        })]
                    })
                }),
                rs = "DialogTitle",
                ru = s.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = t$(e, ["__scopeDialog"]),
                        i = t2(rs, r);
                    return (0, o.jsx)(ez.h2, tX(tK({
                        id: i.titleId
                    }, n), {
                        ref: t
                    }))
                });
            ru.displayName = rs;
            var rd = "DialogDescription";
            s.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = t$(e, ["__scopeDialog"]),
                    i = t2(rd, r);
                return (0, o.jsx)(ez.p, tX(tK({
                    id: i.descriptionId
                }, n), {
                    ref: t
                }))
            }).displayName = rd;
            var rf = "DialogClose",
                rp = s.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = t$(e, ["__scopeDialog"]),
                        i = t2(rf, r);
                    return (0, o.jsx)(ez.button, tX(tK({
                        type: "button"
                    }, n), {
                        ref: t,
                        onClick: ec(e.onClick, function() {
                            return i.onOpenChange(!1)
                        })
                    }))
                });

            function rm(e) {
                return e ? "open" : "closed"
            }
            rp.displayName = rf;
            var rb = "DialogTitleWarning",
                ry = tY((lp = {
                    contentName: ri,
                    titleName: rs,
                    docsSlug: "dialog"
                }, lm = s.createContext(lp), (lb = function(e) {
                    var t = e.children,
                        r = ey(e, ["children"]),
                        n = s.useMemo(function() {
                            return r
                        }, Object.values(r));
                    return (0, o.jsx)(lm.Provider, {
                        value: n,
                        children: t
                    })
                }).displayName = rb + "Provider", [lb, function(e) {
                    var t = s.useContext(lm);
                    if (t) return t;
                    if (void 0 !== lp) return lp;
                    throw Error("`".concat(e, "` must be used within `").concat(rb, "`"))
                }]), 2),
                rh = (ry[0], ry[1]),
                rv = function(e) {
                    var t = e.titleId,
                        r = rh(rb),
                        n = "`".concat(r.contentName, "` requires a `").concat(r.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(r.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(r.docsSlug);
                    return s.useEffect(function() {
                        t && (document.getElementById(t) || console.error(n))
                    }, [n, t]), null
                },
                rg = function(e) {
                    var t = e.contentRef,
                        r = e.descriptionId,
                        n = rh("DialogDescriptionWarning"),
                        i = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(n.contentName, "}.");
                    return s.useEffect(function() {
                        var e, n = null == (e = t.current) ? void 0 : e.getAttribute("aria-describedby");
                        r && n && (document.getElementById(r) || console.warn(i))
                    }, [i, t, r]), null
                };

            function rw(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rP(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function rO(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function rS(e, t) {
                if (null == e) return {};
                var r, n, i, o = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                    return o
                }
                if (o = function(e, t) {
                        if (null == e) return {};
                        var r, n, i = {},
                            o = Object.getOwnPropertyNames(e);
                        for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                        return i
                    }(e, t), Object.getOwnPropertySymbols)
                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                return o
            }

            function rx(e) {
                return function(e) {
                    if (Array.isArray(e)) return rw(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return rw(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rw(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var rj = Symbol("radix.slottable");

            function rI(e) {
                return s.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === rj
            }

            function rE(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function rA(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        rE(e, t, r[t])
                    })
                }
                return e
            }

            function rT(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }
            var rR = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
                var r, n, i, a, l, c = (r = i = "Primitive.".concat(t), (n = s.forwardRef(function(e, t) {
                        var r = e.children,
                            n = rS(e, ["children"]);
                        if (s.isValidElement(r)) {
                            var i, o, a, l, c, u = (c = (l = null == (o = Object.getOwnPropertyDescriptor((i = r).props, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? i.ref : (c = (l = null == (a = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                                d = function(e, t) {
                                    var r = rP({}, t);
                                    for (var n in t) ! function(n) {
                                        var i = e[n],
                                            o = t[n];
                                        /^on[A-Z]/.test(n) ? i && o ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            var n = o.apply(void 0, rx(t));
                                            return i.apply(void 0, rx(t)), n
                                        } : i && (r[n] = i) : "style" === n ? r[n] = rP({}, i, o) : "className" === n && (r[n] = [i, o].filter(Boolean).join(" "))
                                    }(n);
                                    return rP({}, e, r)
                                }(n, r.props);
                            return r.type !== s.Fragment && (d.ref = t ? ed(t, u) : u), s.cloneElement(r, d)
                        }
                        return s.Children.count(r) > 1 ? s.Children.only(null) : null
                    })).displayName = "".concat(r, ".SlotClone"), a = n, (l = s.forwardRef(function(e, t) {
                        var r = e.children,
                            n = rS(e, ["children"]),
                            i = s.Children.toArray(r),
                            l = i.find(rI);
                        if (l) {
                            var c = l.props.children,
                                u = i.map(function(e) {
                                    return e !== l ? e : s.Children.count(c) > 1 ? s.Children.only(null) : s.isValidElement(c) ? c.props.children : null
                                });
                            return (0, o.jsx)(a, rO(rP({}, n), {
                                ref: t,
                                children: s.isValidElement(c) ? s.cloneElement(c, void 0, u) : null
                            }))
                        }
                        return (0, o.jsx)(a, rO(rP({}, n), {
                            ref: t,
                            children: r
                        }))
                    })).displayName = "".concat(i, ".Slot"), l),
                    u = s.forwardRef(function(e, r) {
                        var n = e.asChild,
                            i = function(e, t) {
                                if (null == e) return {};
                                var r, n, i, o = {};
                                if ("u" > typeof Reflect && Reflect.ownKeys) {
                                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                    return o
                                }
                                if (o = function(e, t) {
                                        if (null == e) return {};
                                        var r, n, i = {},
                                            o = Object.getOwnPropertyNames(e);
                                        for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                                        return i
                                    }(e, t), Object.getOwnPropertySymbols)
                                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                return o
                            }(e, ["asChild"]),
                            a = n ? c : t;
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, o.jsx)(a, rT(rA({}, i), {
                            ref: r
                        }))
                    });
                return u.displayName = "Primitive.".concat(t), rT(rA({}, e), rE({}, t, u))
            }, {});

            function rN(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }
            var rC = Object.freeze({
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
                rD = s.forwardRef(function(e, t) {
                    var r, n;
                    return (0, o.jsx)(rR.span, (r = rN({}, e), n = n = {
                        ref: t,
                        style: rN({}, rC, e.style)
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(n)).forEach(function(e) {
                        Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                    }), r))
                });

            function rM(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function rk(e, t) {
                if (null == e) return {};
                var r, n, i, o = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                    return o
                }
                if (o = function(e, t) {
                        if (null == e) return {};
                        var r, n, i = {},
                            o = Object.getOwnPropertyNames(e);
                        for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                        return i
                    }(e, t), Object.getOwnPropertySymbols)
                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                return o
            }
            rD.displayName = "VisuallyHidden";
            var rF = (0, s.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    hasDescription: !1,
                    type: "Default"
                }),
                rL = function() {
                    var e = (0, s.useContext)(rF);
                    if (!e) throw Error("Dialog components must be used within a Dialog");
                    return e
                },
                r_ = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                rU = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                rB = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                rq = function(e) {
                    var t = e.open,
                        r = e.onOpenChange,
                        n = e.children,
                        i = e.size,
                        o = e.type,
                        a = void 0 === o ? "Default" : o,
                        l = e.isModal,
                        c = e.hasCloseAffordance,
                        d = e.closeLabel,
                        f = e.hasMarginTop,
                        p = void 0 === f || f,
                        m = e.hasMarginBottom,
                        b = void 0 === m || m,
                        y = e.hasDescription,
                        h = void 0 !== y && y,
                        v = e.experimentalDisablePointerEventsStylingOnBody,
                        g = void 0 !== v && v,
                        w = (0, s.useMemo)(function() {
                            return {
                                size: i,
                                isModal: l,
                                type: a,
                                hasCloseAffordance: c,
                                closeLabel: d,
                                hasMarginTop: p,
                                hasMarginBottom: b,
                                hasDescription: h
                            }
                        }, [i, l, a, c, d, p, b, h]);
                    return (0, s.useEffect)(function() {
                        g && setTimeout(function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }, 0)
                    }, [g, t]), u().createElement(rF.Provider, {
                        value: w
                    }, u().createElement(t3, {
                        open: t,
                        onOpenChange: r
                    }, n))
                };
            rq.displayName = "Dialog";
            var rV = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.style,
                    i = e.overlayClassName,
                    o = e.overlayStyle,
                    a = e.onOpenAutoFocus,
                    l = rk(e, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
                    c = rL(),
                    s = c.size,
                    d = c.isModal,
                    f = c.hasCloseAffordance,
                    p = c.closeLabel,
                    m = c.hasDescription,
                    b = Y("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", d && "bg-common-backdrop", i),
                    y = Y("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", r);
                return u().createElement(t9, null, u().createElement(rt, {
                    className: b,
                    style: o
                }, u().createElement(ro, rM({
                    className: y,
                    "data-size": s,
                    style: n,
                    onOpenAutoFocus: a
                }, !m && {
                    "aria-describedby": void 0
                }, l), f && u().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, u().createElement(rp, {
                    asChild: !0
                }, u().createElement(el, {
                    variant: "OverMedia",
                    size: s,
                    isCircular: !0,
                    "aria-label": p
                }))), t)))
            };
            rV.displayName = "DialogContent";
            var rz = function(e) {
                var t = e.children,
                    r = e.className,
                    n = rk(e, ["children", "className"]),
                    i = rL(),
                    o = i.size,
                    a = i.hasMarginTop,
                    l = i.hasMarginBottom,
                    c = Y(r_[o], a && rU[o], l && rB[o], r);
                return u().createElement("div", rM({
                    className: c
                }, n), t)
            };
            rz.displayName = "DialogBody";
            var rG = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.hidden,
                    i = rk(e, ["children", "className", "hidden"]),
                    o = u().createElement(ru, rM({
                        className: r
                    }, i), t);
                return n ? u().createElement(rD, null, o) : o
            };
            rG.displayName = "DialogTitle";
            var rH = function(e) {
                var t = e.children,
                    r = e.className,
                    n = rk(e, ["children", "className"]),
                    i = rL().size,
                    o = Y(r_[i], rB[i], r);
                return u().createElement("div", rM({
                    className: o
                }, n), t)
            };
            rH.displayName = "DialogFooter";
            var rW = "opacity-[0.5]",
                rK = function(e) {
                    var t = e.width,
                        r = e.height;
                    return u().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: t,
                        height: r,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, u().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                };

            function rX(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function r$(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function rY(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function rJ(e, t) {
                if (null == e) return {};
                var r, n, i, o = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                    return o
                }
                if (o = function(e, t) {
                        if (null == e) return {};
                        var r, n, i = {},
                            o = Object.getOwnPropertyNames(e);
                        for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                        return i
                    }(e, t), Object.getOwnPropertySymbols)
                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                return o
            }

            function rQ(e) {
                return function(e) {
                    if (Array.isArray(e)) return rX(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return rX(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rX(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rZ(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var r0 = Symbol.for("react.lazy"),
                r1 = s[" use ".trim().toString()];

            function r2(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : rZ(e)) === "object" && "$$typeof" in e && e.$$typeof === r0 && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : rZ(t)) === "object" && null !== t && "then" in t
            }
            var r3 = ((la = s.forwardRef(function(e, t) {
                    var r = e.children,
                        n = rJ(e, ["children"]);
                    if (r2(r) && "function" == typeof r1 && (r = r1(r._payload)), s.isValidElement(r)) {
                        var i, o, a, l, c, u = (c = (l = null == (o = Object.getOwnPropertyDescriptor((i = r).props, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? i.ref : (c = (l = null == (a = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                            d = function(e, t) {
                                var r = r$({}, t);
                                for (var n in t) ! function(n) {
                                    var i = e[n],
                                        o = t[n];
                                    /^on[A-Z]/.test(n) ? i && o ? r[n] = function() {
                                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                        var n = o.apply(void 0, rQ(t));
                                        return i.apply(void 0, rQ(t)), n
                                    } : i && (r[n] = i) : "style" === n ? r[n] = r$({}, i, o) : "className" === n && (r[n] = [i, o].filter(Boolean).join(" "))
                                }(n);
                                return r$({}, e, r)
                            }(n, r.props);
                        return r.type !== s.Fragment && (d.ref = t ? ed(t, u) : u), s.cloneElement(r, d)
                    }
                    return s.Children.count(r) > 1 ? s.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), ly = la, (lh = s.forwardRef(function(e, t) {
                    var r = e.children,
                        n = rJ(e, ["children"]);
                    r2(r) && "function" == typeof r1 && (r = r1(r._payload));
                    var i = s.Children.toArray(r),
                        a = i.find(r6);
                    if (a) {
                        var l = a.props.children,
                            c = i.map(function(e) {
                                return e !== a ? e : s.Children.count(l) > 1 ? s.Children.only(null) : s.isValidElement(l) ? l.props.children : null
                            });
                        return (0, o.jsx)(ly, rY(r$({}, n), {
                            ref: t,
                            children: s.isValidElement(l) ? s.cloneElement(l, void 0, c) : null
                        }))
                    }
                    return (0, o.jsx)(ly, rY(r$({}, n), {
                        ref: t,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), lh),
                r4 = Symbol("radix.slottable");

            function r6(e) {
                return s.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === r4
            }

            function r8(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function r5(e) {
                if (Array.isArray(e)) return e
            }

            function r7() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function r9(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function ne(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function nt(e, t) {
                if (null == e) return {};
                var r, n, i, o = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                    return o
                }
                if (o = function(e, t) {
                        if (null == e) return {};
                        var r, n, i = {},
                            o = Object.getOwnPropertyNames(e);
                        for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                        return i
                    }(e, t), Object.getOwnPropertySymbols)
                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                return o
            }

            function nr(e, t) {
                if (e) {
                    if ("string" == typeof e) return r8(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return r8(e, t)
                }
            }
            var nn = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                ni = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                no = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                na = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                nl = (0, s.forwardRef)(function(e, t) {
                    var r, n = r5(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || nr(r) || r7(),
                        i = n[0],
                        o = n.slice(1),
                        a = i.children,
                        l = i.className,
                        c = i.style,
                        s = i.isDisabled,
                        d = void 0 !== s && s,
                        f = i.isLoading,
                        p = void 0 !== f && f,
                        m = i.icon,
                        b = i.size,
                        y = void 0 === b ? "Large" : b,
                        h = i.variant,
                        v = void 0 === h ? "Emphasis" : h,
                        g = i.asChild,
                        w = nt(i, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        P = (r5(o) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    o = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 1 !== i.length); o = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        o || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return i
                            }
                        }(o) || nr(o, 1) || r7())[0],
                        O = Y("foundation-web-button", d ? rW : [J, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", ni[y], d ? na[v] : no[v], l),
                        S = r9({
                            textDecoration: "none"
                        }, c),
                        x = function(e) {
                            return u().createElement(u().Fragment, null, u().createElement(Q, null), p && u().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, u().createElement(rK, {
                                width: nn[y],
                                height: nn[y]
                            })), u().createElement("span", {
                                className: Y("flex items-center min-width-0", "Large" === y || "Medium" === y ? "gap-small" : "gap-xsmall", p && "invisible")
                            }, m && u().createElement(ei, {
                                name: m,
                                size: y
                            }), u().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (g) {
                        w.as;
                        var j = nt(w, ["as"]),
                            I = u().Children.only(a);
                        return u().createElement(r3, ne(r9({
                            ref: P
                        }, j), {
                            className: O,
                            style: S,
                            "aria-disabled": d || void 0
                        }), u().cloneElement(I, {}, x(I.props.children)))
                    }
                    if ("a" === w.as) {
                        w.as;
                        var E = w.href,
                            A = nt(w, ["as", "href"]);
                        return u().createElement("a", ne(r9({
                            ref: P
                        }, A), {
                            "aria-disabled": d,
                            href: d ? void 0 : E,
                            className: O,
                            style: S
                        }), x(a))
                    }
                    w.as;
                    var T = nt(w, ["as"]);
                    return u().createElement("button", ne(r9({
                        ref: P,
                        type: "button"
                    }, T), {
                        disabled: d,
                        className: O,
                        style: S
                    }), x(a))
                });

            function nc(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ns(e) {
                return function(e) {
                    if (Array.isArray(e)) return nc(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return nc(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nc(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var nu = "__FN_nvfToKPAOuiV__",
                nd = new RegExp("".concat(nu, "(\\d+)\\|")),
                nf = function(e, t, r, n) {
                    var i = function(e) {
                            for (var t = 1; t < arguments.length; t++) {
                                var r = null != arguments[t] ? arguments[t] : {},
                                    n = Object.keys(r);
                                "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                    return Object.getOwnPropertyDescriptor(r, e).enumerable
                                }))), n.forEach(function(t) {
                                    var n;
                                    n = r[t], t in e ? Object.defineProperty(e, t, {
                                        value: n,
                                        enumerable: !0,
                                        configurable: !0,
                                        writable: !0
                                    }) : e[t] = n
                                })
                            }
                            return e
                        }({}, n),
                        a = {};
                    null == r || r.forEach(function(e, t) {
                        var r = t.toString(),
                            n = "".concat(nu).concat(r, "|"),
                            o = "".concat("__FN_END_nvfToKPAOuiV__").concat(r, "|");
                        i[e.opening] = n, i[e.closing] = o, a[r] = {
                            start: n,
                            end: o,
                            render: e.render,
                            used: !1
                        }
                    });
                    var l = e(t, i),
                        c = function(e) {
                            var r = [],
                                n = nd.exec(e);
                            if (!n) return [e];
                            n.index > 0 && r.push(e.slice(0, n.index));
                            var i = n[1] && a[n[1]];
                            if (!i) return console.warn("Unexpected malformed segment", t), [];
                            i.used = !0;
                            var o = e.indexOf(i.end);
                            if (-1 === o) return console.warn("Unexpected malformed segment", t), [];
                            var l = e.slice(n.index + n[0].length, o),
                                s = i.render(c(l));
                            Array.isArray(s) ? r.push.apply(r, ns(s)) : r.push(s);
                            var u = e.slice(o + i.end.length);
                            return u.length > 0 && r.push.apply(r, ns(c(u))), r
                        },
                        u = c(l).filter(function(e) {
                            return "" !== e
                        });
                    return Object.values(a).some(function(e) {
                        return !e.used
                    }) ? (console.warn("Unused segments found", t), []) : u.map(function(e, t) {
                        return (0, o.jsx)(s.Fragment, {
                            children: e
                        }, t)
                    })
                },
                np = (0, c.withTranslations)(function(e) {
                    var t = e.translate,
                        r = e.price,
                        n = e.color,
                        i = void 0 === n ? "" : n,
                        a = e.useFreeText;
                    return 0 === r && (void 0 === a || a) ? (0, o.jsx)("span", {
                        className: "text-robux text-free",
                        children: t(h.freeLabel)
                    }) : (0, o.jsxs)(u().Fragment, {
                        children: [(0, o.jsx)("span", {
                            className: "icon-robux".concat(i ? "-".concat(i) : "", "-16x16")
                        }), (0, o.jsx)("span", {
                            className: "text-robux ml-1 text-body-medium",
                            children: (0, k.formatNumber)(r)
                        })]
                    })
                }, m),
                nm = function(e) {
                    var t = e.translate,
                        r = e.titleText,
                        n = e.currentRobuxBalance;
                    return (0, o.jsxs)("div", {
                        id: "rbx-unified-purchase-heading",
                        className: "flex flex-row items-center justify-between",
                        style: {
                            paddingRight: 42
                        },
                        children: [(0, o.jsx)("span", {
                            className: "text-heading-medium",
                            children: r
                        }), "number" == typeof n && (0, o.jsx)("div", {
                            className: "flex flex-row items-center",
                            children: (0, o.jsx)(np, {
                                translate: t,
                                price: n,
                                color: "",
                                useFreeText: !1
                            })
                        })]
                    })
                },
                nb = (0, c.withTranslations)(function(e) {
                    var t = e.open,
                        r = e.onClose,
                        n = e.itemName,
                        i = e.currentRobuxBalance,
                        a = e.translate,
                        l = a(h.purchaseCompleteHeading),
                        c = a(h.okAction),
                        s = [{
                            opening: "boldStart",
                            closing: "boldEnd",
                            render: function(e) {
                                return (0, o.jsx)("b", {
                                    children: e
                                })
                            }
                        }];
                    return (0, o.jsx)(rq, {
                        open: t,
                        onOpenChange: r,
                        size: "Medium",
                        isModal: !0,
                        hasCloseAffordance: !0,
                        closeLabel: a("Action.Close"),
                        children: (0, o.jsxs)(rV, {
                            className: "relative width-full",
                            "aria-describedby": "unified-purchase-completion-modal-body",
                            children: [(0, o.jsxs)(rz, {
                                className: "gap-xlarge flex flex-col",
                                children: [(0, o.jsx)("div", {
                                    style: {
                                        marginTop: -4
                                    },
                                    children: (0, o.jsx)(nm, {
                                        translate: a,
                                        titleText: l,
                                        currentRobuxBalance: i
                                    })
                                }), (0, o.jsx)("div", {
                                    className: "flex justify-center gap-bottom-large",
                                    children: (0, o.jsx)(ei, {
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
                                    children: nf(a, h.unifiedPurchaseCompletionMessage, s, {
                                        assetName: n
                                    })
                                })]
                            }), (0, o.jsx)(rH, {
                                className: "gap-small flex flex-col mt-[40px]",
                                children: (0, o.jsx)("div", {
                                    className: "flex flex-row-reverse",
                                    children: (0, o.jsx)(nl, {
                                        variant: "Emphasis",
                                        className: "fill basis-0",
                                        onClick: r,
                                        children: c
                                    })
                                })
                            })]
                        })
                    })
                }, m),
                ny = ((lv = ny || {}).Bought = "bought", lv.Renewed = "renewed", lv);

            function nh(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nv(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            l = !1;
                        try {
                            for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return nh(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nh(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ng(e) {
                var t = e.customPurchaseConfirmationModal,
                    r = nv((0, p.createModal)(), 2),
                    n = r[0],
                    i = r[1],
                    a = null;

                function l(e) {
                    var r, i, l, c = e.translate,
                        s = e.expectedPrice,
                        d = e.thumbnail,
                        f = e.assetName,
                        p = e.assetType,
                        m = e.assetIsWearable,
                        b = e.assetTypeDisplayName,
                        y = e.sellerName,
                        v = e.isPlace,
                        g = e.isPrivateServer,
                        w = e.onAccept,
                        P = e.onDecline,
                        O = e.transactionVerb,
                        x = e.itemDelayed,
                        j = e.currentRobuxBalance,
                        E = e.shouldShowUnifiedPurchaseCompletionModal,
                        A = nv(u().useState(!1), 2),
                        T = A[0],
                        R = A[1];
                    u().useEffect(function() {
                        if (t || E) return a = R,
                            function() {
                                a === R && (a = null)
                            };
                        a = null
                    }, [E]);
                    var N = c(h.continueAction);
                    g ? (r = c(h.configureAction), N = c(h.notNowAction)) : x ? (r = c(h.customizeAction), N = c(h.doneAction)) : m && (r = c(h.customizeAction), N = c(h.notNowAction), i = function() {
                        return window.location.href = I.urlService.getAbsoluteUrl("/my/avatar"), !1
                    });
                    var C = {
                        assetName: (0, S.renderToString)((0, o.jsx)(K, {
                            name: f
                        })),
                        assetType: b || p,
                        seller: (0, W.escapeHtml)(y),
                        robux: (0, S.renderToString)((0, o.jsx)(L, {
                            price: s
                        }))
                    };
                    l = O === ny.Bought ? v ? h.successfullyAcquiredAccessMessage : h.successfullyBoughtMessage : O === ny.Renewed ? v ? h.successfullyRenewedAccessMessage : h.successfullyRenewedMessage : v ? h.successfullyAcquiredAccessMessage : h.successfullyAcquiredMessage;
                    var D = (0, o.jsx)("div", {
                        className: "modal-message",
                        dangerouslySetInnerHTML: {
                            __html: "".concat(c(l, C), " ").concat(x ? c(h.itemGrantDelayMessage) : "")
                        }
                    });
                    return t ? u().createElement(t, {
                        open: T,
                        onClose: function() {
                            R(!1), P ? P() : window.location.reload()
                        },
                        itemName: f
                    }) : E && !g ? (0, o.jsx)(nb, {
                        open: T,
                        onClose: function() {
                            R(!1), P ? P() : window.location.reload()
                        },
                        itemName: f,
                        currentRobuxBalance: j - s
                    }) : (0, o.jsx)(n, {
                        title: c(h.purchaseCompleteHeading),
                        body: D,
                        thumbnail: d,
                        neutralButtonText: N,
                        actionButtonText: r,
                        onAction: w || i,
                        onNeutral: P,
                        footerText: !g && (0, o.jsx)(V, {
                            expectedPrice: s,
                            currentRobuxBalance: j
                        }),
                        actionButtonShow: !!r,
                        disableActionButton: x,
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
                    translate: f().func.isRequired,
                    transactionVerb: f().string,
                    expectedPrice: f().number.isRequired,
                    thumbnail: f().node.isRequired,
                    assetName: f().string.isRequired,
                    assetType: f().string.isRequired,
                    assetTypeDisplayName: f().string,
                    assetIsWearable: f().bool,
                    sellerName: f().string.isRequired,
                    isPlace: f().bool,
                    isPrivateServer: f().bool,
                    onAccept: f().func,
                    onDecline: f().func,
                    itemDelayed: f().bool,
                    currentRobuxBalance: f().number,
                    shouldShowUnifiedPurchaseCompletionModal: f().bool
                }, [(0, c.withTranslations)(l, m), {
                    open: function() {
                        a ? a(!0) : i.open()
                    },
                    close: function() {
                        a ? a(!1) : i.close()
                    }
                }]
            }
            var nw = window.Roblox["core-scripts"].paymentsFlow,
                nP = r.n(nw),
                nO = window.Roblox,
                nS = ((lg = {}).UNKNOWN = "unknown", lg.ABANDONED = "abandoned", lg.INVALIDATED = "invalidated", lg);

            function nx(e, t, r) {
                return (nx = nN() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var i = new(Function.bind.apply(e, n));
                    return r && nA(i, r.prototype), i
                }).apply(null, arguments)
            }

            function nj(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var n = t[r];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                }
            }

            function nI(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function nE(e) {
                return (nE = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function nA(e, t) {
                return (nA = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function nT(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function nR(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (nR = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return nx(e, arguments, nE(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), nA(r, e)
                })(e)
            }

            function nN() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (nN = function() {
                    return !!e
                })()
            }
            var nC = "generic-challenge-error",
                nD = function(e) {
                    var t, r;
                    if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                    function n(e) {
                        var t, r, i;
                        if (!(this instanceof n)) throw TypeError("Cannot call a class as a function");
                        return r = n, i = [n.getMessage(e)], r = nE(r), nI(t = function(e, t) {
                            if (t && ("object" === nT(t) || "function" == typeof t)) return t;
                            if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                            return e
                        }(this, nN() ? Reflect.construct(r, i || [], nE(this).constructor) : r.apply(this, i)), "_parameters", void 0), nI(t, "_className", void 0), Object.setPrototypeOf(t, n.prototype), t.name = n.name, t._parameters = e, t._className = nC, t
                    }
                    return n.prototype = Object.create(e && e.prototype, {
                        constructor: {
                            value: n,
                            writable: !0,
                            configurable: !0
                        }
                    }), e && nA(n, e), t = [{
                        key: "parameters",
                        get: function() {
                            return this._parameters
                        }
                    }], r = [{
                        key: "match",
                        value: function(e) {
                            return (void 0 === e ? "undefined" : nT(e)) === "object" && null !== e && e._className === nC
                        }
                    }, {
                        key: "matchAbandoned",
                        value: function(e) {
                            return n.match(e) && e.parameters.kind === nS.ABANDONED
                        }
                    }, {
                        key: "getMessage",
                        value: function(e) {
                            return "Got (".concat(["Kind: ".concat(e.kind), "Type: ".concat(e.data.challengeType || "unknown"), "Code: ".concat(e.kind === nS.INVALIDATED ? e.data.errorCode : "null")].join("; "), ")")
                        }
                    }], t && nj(n.prototype, t), r && nj(n, r), n
                }(nR(Error)),
                nM = window.Roblox["core-scripts"].meta.user,
                nk = "function" == typeof crypto.randomUUID,
                nF = function() {
                    var e = new Uint8Array(16);
                    crypto.getRandomValues(e);
                    var t = Array.from(e, function(e, t) {
                        return (6 === t ? 15 & e | 64 : 8 === t ? 63 & e | 128 : e).toString(16).padStart(2, "0")
                    });
                    return "".concat(t.slice(0, 4).join(""), "-").concat(t.slice(4, 6).join(""), "-").concat(t.slice(6, 8).join(""), "-") + "".concat(t.slice(8, 10).join(""), "-").concat(t.slice(10, 16).join(""))
                },
                nL = function() {
                    return nk ? crypto.randomUUID() : nF()
                },
                n_ = window.TanstackQuery,
                nU = window.Roblox["core-scripts"].http.http,
                nB = function(e, t) {
                    var r, n = {
                        url: (r = e, "".concat(T, "/marketplace-sales/v1/item/").concat(r, "/purchase-item")),
                        retryable: !0,
                        withCredentials: !0
                    };
                    return nU.post(n, t)
                },
                nq = function(e, t) {
                    var r, n = {
                        url: (r = e, "".concat(T, "/marketplace-sales/v1/item/").concat(r, "/purchase-resale")),
                        retryable: !0,
                        withCredentials: !0
                    };
                    return nU.post(n, t)
                },
                nV = function(e, t) {
                    var r, n = {
                        url: (r = e, "".concat(T, "/developer-products/v1/developer-products/").concat(r, "/purchase?requestLocationType=ExperienceDetailPage")),
                        withCredentials: !0
                    };
                    return nU.post(n, t)
                },
                nz = function(e, t) {
                    var r, n = {
                        url: (r = e, "".concat(T, "/game-passes/v1/game-passes/").concat(r, "/purchase")),
                        retryable: !0,
                        withCredentials: !0
                    };
                    return nU.post(n, t)
                },
                nG = function(e, t) {
                    var r, n = {
                        url: (r = e, "".concat(E, "/v1/purchases/products/").concat(r)),
                        retryable: !0,
                        withCredentials: !0
                    };
                    return nU.post(n, t)
                },
                nH = function(e, t) {
                    var r, n = {
                        url: (r = e, "".concat(T, "/v1/subscriptions/purchase-with-robux/").concat(r)),
                        withCredentials: !0
                    };
                    return nU.post(n, t)
                },
                nW = function(e, t) {
                    var r, n = {
                        url: (r = e, "".concat(T, "/v1/subscriptions/prepare-purchase/").concat(r, "/web")),
                        withCredentials: !0
                    };
                    return nU.post(n, t)
                },
                nK = function(e, t, r, n) {
                    var i = {
                        url: "".concat("".concat(T, "/cloud/v2/avatar-marketplace-orders"), "?idempotencyKey.key=").concat(n),
                        retryable: !0,
                        withCredentials: !0
                    };
                    return nU.post(i, {
                        purchasingUser: "users/".concat(e),
                        context: {
                            productSurface: t
                        },
                        fulfillmentGroups: [r]
                    })
                };

            function nX(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, i)
            }

            function n$(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, i) {
                        var o = e.apply(t, r);

                        function a(e) {
                            nX(o, n, i, a, l, "next", e)
                        }

                        function l(e) {
                            nX(o, n, i, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function nY(e, t) {
                var r, n, i, o = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(a, "next", {
                    value: c(0)
                }), l(a, "throw", {
                    value: c(1)
                }), l(a, "return", {
                    value: c(2)
                }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), a;

                function c(l) {
                    return function(c) {
                        var s = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, s[0] && (o = 0)), o;) try {
                            if (r = 1, n && (i = 2 & s[0] ? n.return : s[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, s[1])).done) return i;
                            switch (n = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                case 0:
                                case 1:
                                    i = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < i[1]) {
                                        o.label = i[1], i = s;
                                        break
                                    }
                                    if (i && o.label < i[2]) {
                                        o.label = i[2], o.ops.push(s);
                                        break
                                    }
                                    i[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], n = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var nJ = function() {
                    return "".concat(T, "/marketplace-items/v1/items/details")
                },
                nQ = function(e, t) {
                    var r, n, i = {
                        url: (r = e, n = t, "".concat(A, "/v1/catalog/items/").concat(r, "/details?itemType=").concat(n)),
                        retryable: !0,
                        withCredentials: !0
                    };
                    return nU.get(i)
                },
                nZ = function(e) {
                    var t, r = {
                        url: (t = e, "".concat(E, "/v1/products/").concat(t, "?showPurchasable=true")),
                        retryable: !0,
                        withCredentials: !0
                    };
                    return nU.get(r)
                },
                n0 = function(e) {
                    var t, r = {
                        url: (t = e, "".concat(E, "/v1/assets/").concat(t, "/resellers?limit=10")),
                        retryable: !0,
                        withCredentials: !0
                    };
                    return nU.get(r)
                },
                n1 = function() {
                    return nU.get({
                        url: "".concat(E, "/v2/metadata"),
                        retryable: !0,
                        withCredentials: !0
                    })
                },
                n2 = function(e) {
                    var t, r = {
                        url: (t = e, "".concat(E, "/v1/users/").concat(t, "/currency")),
                        retryable: !0,
                        withCredentials: !0
                    };
                    return nU.get(r)
                },
                n3 = window.Roblox["core-scripts"].endpoints;

            function n4(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, i)
            }

            function n6(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, i) {
                        var o = e.apply(t, r);

                        function a(e) {
                            n4(o, n, i, a, l, "next", e)
                        }

                        function l(e) {
                            n4(o, n, i, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function n8(e, t) {
                var r, n, i, o = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(a, "next", {
                    value: c(0)
                }), l(a, "throw", {
                    value: c(1)
                }), l(a, "return", {
                    value: c(2)
                }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), a;

                function c(l) {
                    return function(c) {
                        var s = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, s[0] && (o = 0)), o;) try {
                            if (r = 1, n && (i = 2 & s[0] ? n.return : s[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, s[1])).done) return i;
                            switch (n = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                case 0:
                                case 1:
                                    i = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < i[1]) {
                                        o.label = i[1], i = s;
                                        break
                                    }
                                    if (i && o.label < i[2]) {
                                        o.label = i[2], o.ops.push(s);
                                        break
                                    }
                                    i[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], n = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function n5(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, i)
            }

            function n7(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, i) {
                        var o = e.apply(t, r);

                        function a(e) {
                            n5(o, n, i, a, l, "next", e)
                        }

                        function l(e) {
                            n5(o, n, i, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function n9(e, t) {
                var r, n, i, o = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(a, "next", {
                    value: c(0)
                }), l(a, "throw", {
                    value: c(1)
                }), l(a, "return", {
                    value: c(2)
                }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), a;

                function c(l) {
                    return function(c) {
                        var s = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, s[0] && (o = 0)), o;) try {
                            if (r = 1, n && (i = 2 & s[0] ? n.return : s[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, s[1])).done) return i;
                            switch (n = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                case 0:
                                case 1:
                                    i = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < i[1]) {
                                        o.label = i[1], i = s;
                                        break
                                    }
                                    if (i && o.label < i[2]) {
                                        o.label = i[2], o.ops.push(s);
                                        break
                                    }
                                    i[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], n = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var ie = nO.AccountIntegrityChallengeService.TwoStepVerification;

            function it(e) {
                var t = e.systemFeedbackService,
                    r = e.translate;
                t.warning(r("Response.VerificationError"))
            }
            var ir = (0, c.withTranslations)(function(e) {
                    var t = e.translate,
                        r = e.isTwoStepVerificationActive,
                        n = e.stopTwoStepVerification,
                        i = e.systemFeedbackService;
                    return (0, s.useEffect)(function() {
                        r && n7(function() {
                            return n9(this, function(e) {
                                switch (e.label) {
                                    case 0:
                                        return [4, n6(function() {
                                            var e, t, r, n;
                                            return n8(this, function(i) {
                                                switch (i.label) {
                                                    case 0:
                                                        var o;
                                                        t = {
                                                            url: (o = null != (e = (0, nM.userId)()) ? e : "", "".concat(R, "/v1/users/").concat(o, "/configuration")),
                                                            retryable: !0,
                                                            withCredentials: !0
                                                        }, i.label = 1;
                                                    case 1:
                                                        return i.trys.push([1, 3, , 4]), [4, nU.get(t)];
                                                    case 2:
                                                        return [2, ((null == (n = i.sent()) || null == (r = n.data) ? void 0 : r.methods) || []).some(function(e) {
                                                            return !!e.enabled
                                                        })];
                                                    case 3:
                                                        return i.sent(), [2, !1];
                                                    case 4:
                                                        return [2]
                                                }
                                            })
                                        })()];
                                    case 1:
                                        if (e.sent()) ! function e(t) {
                                            return n7(function(t) {
                                                var r, n, i, o, a, l;
                                                return n9(this, function(c) {
                                                    switch (c.label) {
                                                        case 0:
                                                            return r = t.stopTwoStepVerification, n = t.systemFeedbackService, i = t.totalAttempts, o = t.translate, [4, n6(function() {
                                                                var e;
                                                                return n8(this, function(t) {
                                                                    switch (t.label) {
                                                                        case 0:
                                                                            var r;
                                                                            e = {
                                                                                url: (r = "spend-friction", "".concat(E, "/v2/").concat(r, "/two-step-verification/generate")),
                                                                                retryable: !0,
                                                                                withCredentials: !0
                                                                            }, t.label = 1;
                                                                        case 1:
                                                                            return t.trys.push([1, 3, , 4]), [4, nU.post(e)];
                                                                        case 2:
                                                                            return [2, t.sent().data || null];
                                                                        case 3:
                                                                            return t.sent(), [2, null];
                                                                        case 4:
                                                                            return [2]
                                                                    }
                                                                })
                                                            })()];
                                                        case 1:
                                                            return (a = c.sent()) ? nO.AccountIntegrityChallengeService.TwoStepVerification.renderChallenge({
                                                                containerId: "two-sv-popup-entry",
                                                                userId: String(null != (l = (0, nM.userId)()) ? l : ""),
                                                                challengeId: a,
                                                                actionType: ie.ActionType.RobuxSpend,
                                                                renderInline: !1,
                                                                shouldShowRememberDeviceCheckbox: !1,
                                                                onChallengeCompleted: function(e) {
                                                                    return n7(function() {
                                                                        var t;
                                                                        return n9(this, function(i) {
                                                                            var l, c, s, u;
                                                                            switch (i.label) {
                                                                                case 0:
                                                                                    return [4, (l = e.verificationToken, n6(function() {
                                                                                        var e, t, r;
                                                                                        return n8(this, function(n) {
                                                                                            switch (n.label) {
                                                                                                case 0:
                                                                                                    var i;
                                                                                                    e = {
                                                                                                        url: (i = "spend-friction", "".concat(E, "/v2/").concat(i, "/two-step-verification/redeem")),
                                                                                                        retryable: !0,
                                                                                                        withCredentials: !0
                                                                                                    }, t = {
                                                                                                        challengeToken: a,
                                                                                                        verificationToken: l
                                                                                                    }, n.label = 1;
                                                                                                case 1:
                                                                                                    return n.trys.push([1, 3, , 4]), [4, nU.post(e, t)];
                                                                                                case 2:
                                                                                                    return [2, null != (r = n.sent().data) && r];
                                                                                                case 3:
                                                                                                    return n.sent(), [2, !1];
                                                                                                case 4:
                                                                                                    return [2]
                                                                                            }
                                                                                        })
                                                                                    })())];
                                                                                case 1:
                                                                                    return (t = i.sent(), r(), t) ? (s = (c = {
                                                                                        systemFeedbackService: n,
                                                                                        translate: o
                                                                                    }).systemFeedbackService, u = c.translate, s.success(u("Response.SuccessfulVerificationV2"))) : it({
                                                                                        systemFeedbackService: n,
                                                                                        translate: o
                                                                                    }), [2]
                                                                            }
                                                                        })
                                                                    })()
                                                                },
                                                                onChallengeInvalidated: function() {
                                                                    var t = i || 0;
                                                                    t < 3 ? e({
                                                                        stopTwoStepVerification: r,
                                                                        systemFeedbackService: n,
                                                                        translate: o,
                                                                        totalAttempts: t + 1
                                                                    }) : (it({
                                                                        systemFeedbackService: n,
                                                                        translate: o
                                                                    }), r())
                                                                },
                                                                onModalChallengeAbandoned: function() {}
                                                            }) : it({
                                                                systemFeedbackService: n,
                                                                translate: o
                                                            }), [2]
                                                    }
                                                })
                                            }).apply(this, arguments)
                                        }({
                                            stopTwoStepVerification: n,
                                            systemFeedbackService: i,
                                            translate: t
                                        });
                                        else {
                                            var r;
                                            r = {
                                                titleText: t("Heading.TwoStepVerificationRequiredV3"),
                                                bodyContent: t("Message.TwoStepVerificationRequiredV4"),
                                                imageUrl: void 0,
                                                acceptText: t("Action.GoToSecurity"),
                                                acceptColor: "btn-primary-md",
                                                onAccept: function() {
                                                    window.location.href = (0, n3.getAbsoluteUrl)("/my/account#!/security")
                                                },
                                                declineText: t("Action.Cancel"),
                                                dismissable: !0,
                                                allowHtmlContentInBody: !0,
                                                onOpenCallback: function() {}
                                            }, nO.Dialog.open(r)
                                        }
                                        return [2]
                                }
                            })
                        })()
                    }, [r]), (0, o.jsx)("div", {
                        id: "two-sv-popup-entry"
                    })
                }, m),
                ii = {
                    GAME_PASS: "Game Pass",
                    BUNDLE: "Bundle",
                    BUNDLE_ALIAS: "Package",
                    PRIVATE_SERVER: "Private Server",
                    DEVELOPER_PRODUCT: "Product",
                    SUBSCRIPTION: "Subscription"
                },
                io = 0,
                ia = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "\xabr",
                        t = (0, s.useRef)();
                    return t.current || (io += 1, t.current = "".concat(e).concat(io)), t.current
                };

            function il(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    i = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === i || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function ic(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function is(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            l = !1;
                        try {
                            for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return ic(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ic(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            "u" > typeof window && window.document && window.document.createElement;
            var iu = s[" useInsertionEffect ".trim().toString()] || ew;

            function id(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ip(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function im(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            l = !1;
                        try {
                            for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return ip(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ip(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            Symbol("RADIX:SYNC_STATE");
            var ib = function(e) {
                var t, r, n, i, o, a, l, c, u, d, f, p, m, b, y, h, v, g = e.present,
                    w = e.children,
                    P = (t = g, o = (i = im(s.useState(), 2))[0], a = i[1], l = s.useRef(null), c = s.useRef(t), u = s.useRef("none"), f = (d = im((r = t ? "mounted" : "unmounted", n = {
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
                    }, s.useReducer(function(e, t) {
                        var r = n[e][t];
                        return null != r ? r : e
                    }, r)), 2))[0], p = d[1], s.useEffect(function() {
                        var e = iy(l.current);
                        u.current = "mounted" === f ? e : "none"
                    }, [f]), ew(function() {
                        var e = l.current,
                            r = c.current;
                        if (r !== t) {
                            var n = u.current,
                                i = iy(e);
                            t ? p("MOUNT") : "none" === i || (null == e ? void 0 : e.display) === "none" ? p("UNMOUNT") : r && n !== i ? p("ANIMATION_OUT") : p("UNMOUNT"), c.current = t
                        }
                    }, [t, p]), ew(function() {
                        if (o) {
                            var e, t, r = null != (e = o.ownerDocument.defaultView) ? e : window,
                                n = function(e) {
                                    var n = iy(l.current).includes(CSS.escape(e.animationName));
                                    if (e.target === o && n && (p("ANIMATION_END"), !c.current)) {
                                        var i = o.style.animationFillMode;
                                        o.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                            "forwards" === o.style.animationFillMode && (o.style.animationFillMode = i)
                                        })
                                    }
                                },
                                i = function(e) {
                                    e.target === o && (u.current = iy(l.current))
                                };
                            return o.addEventListener("animationstart", i), o.addEventListener("animationcancel", n), o.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(t), o.removeEventListener("animationstart", i), o.removeEventListener("animationcancel", n), o.removeEventListener("animationend", n)
                                }
                        }
                        p("ANIMATION_END")
                    }, [o, p]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: s.useCallback(function(e) {
                            l.current = e ? getComputedStyle(e) : null, a(e)
                        }, [])
                    }),
                    O = "function" == typeof w ? w({
                        present: P.isPresent
                    }) : s.Children.only(w),
                    S = ef(P.ref, (v = (h = null == (b = Object.getOwnPropertyDescriptor((m = O).props, "ref")) ? void 0 : b.get) && "isReactWarning" in h && h.isReactWarning) ? m.ref : (v = (h = null == (y = Object.getOwnPropertyDescriptor(m, "ref")) ? void 0 : y.get) && "isReactWarning" in h && h.isReactWarning) ? m.props.ref : m.props.ref || m.ref);
                return "function" == typeof w || P.isPresent ? s.cloneElement(O, {
                    ref: S
                }) : null
            };

            function iy(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }

            function ih(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iv(e) {
                if (Array.isArray(e)) return e
            }

            function ig() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function iw(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function iP(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function iO(e, t) {
                if (null == e) return {};
                var r, n, i, o = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                    return o
                }
                if (o = function(e, t) {
                        if (null == e) return {};
                        var r, n, i = {},
                            o = Object.getOwnPropertyNames(e);
                        for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                        return i
                    }(e, t), Object.getOwnPropertySymbols)
                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                return o
            }

            function iS(e, t) {
                return iv(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            l = !1;
                        try {
                            for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || ij(e, t) || ig()
            }

            function ix(e) {
                return iv(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || ij(e) || ig()
            }

            function ij(e, t) {
                if (e) {
                    if ("string" == typeof e) return ih(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ih(e, t)
                }
            }
            ib.displayName = "Presence";
            var iI = "Checkbox",
                iE = iS(ev(iI), 2),
                iA = iE[0];
            iE[1];
            var iT = iS(iA(iI), 2),
                iR = iT[0],
                iN = iT[1];

            function iC(e) {
                var t, r, n, i, a, l, c, u, d, f, p, m, b, y, h, v, g, w, P, O, S = e.__scopeCheckbox,
                    x = e.checked,
                    j = e.children,
                    I = e.defaultChecked,
                    E = e.disabled,
                    A = e.form,
                    T = e.name,
                    R = e.onCheckedChange,
                    N = e.required,
                    C = e.value,
                    D = e.internal_do_not_use_render,
                    M = iS((f = (d = {
                        prop: x,
                        defaultProp: null != I && I,
                        onChange: R,
                        caller: iI
                    }).prop, p = d.defaultProp, m = d.onChange, b = d.caller, h = (y = is((r = (t = {
                        defaultProp: p,
                        onChange: void 0 === m ? function() {} : m
                    }).defaultProp, n = t.onChange, a = (i = is(s.useState(r), 2))[0], l = i[1], c = s.useRef(a), u = s.useRef(n), iu(function() {
                        u.current = n
                    }, [n]), s.useEffect(function() {
                        if (c.current !== a) {
                            var e;
                            null == (e = u.current) || e.call(u, a), c.current = a
                        }
                    }, [a, c]), [a, l, u]), 3))[0], v = y[1], g = y[2], P = (w = void 0 !== f) ? f : h, O = s.useRef(void 0 !== f), s.useEffect(function() {
                        var e = O.current;
                        if (e !== w) {
                            var t = w ? "controlled" : "uncontrolled";
                            console.warn("".concat(b, " is changing from ").concat(e ? "controlled" : "uncontrolled", " to ").concat(t, ". Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component."))
                        }
                        O.current = w
                    }, [w, b]), [P, s.useCallback(function(e) {
                        if (w) {
                            var t, r = "function" == typeof e ? e(f) : e;
                            r !== f && (null == (t = g.current) || t.call(g, r))
                        } else v(e)
                    }, [w, f, v, g])]), 2),
                    k = M[0],
                    F = M[1],
                    L = iS(s.useState(null), 2),
                    _ = L[0],
                    U = L[1],
                    B = iS(s.useState(null), 2),
                    q = B[0],
                    V = B[1],
                    z = s.useRef(!1),
                    G = !_ || !!A || !!_.closest("form"),
                    H = {
                        checked: k,
                        disabled: E,
                        setChecked: F,
                        control: _,
                        setControl: U,
                        name: T,
                        form: A,
                        value: void 0 === C ? "on" : C,
                        hasConsumerStoppedPropagationRef: z,
                        required: N,
                        defaultChecked: !iB(I) && I,
                        isFormControl: G,
                        bubbleInput: q,
                        setBubbleInput: V
                    };
                return (0, o.jsx)(iR, iP(iw({
                    scope: S
                }, H), {
                    children: "function" == typeof D ? D(H) : j
                }))
            }
            var iD = "CheckboxTrigger",
                iM = s.forwardRef(function(e, t) {
                    var r = ix([e, t]),
                        n = r[0],
                        i = r.slice(1),
                        a = n.__scopeCheckbox,
                        l = n.onKeyDown,
                        c = n.onClick,
                        u = iO(n, ["__scopeCheckbox", "onKeyDown", "onClick"]),
                        d = iS(i, 1)[0],
                        f = iN(iD, a),
                        p = f.control,
                        m = f.value,
                        b = f.disabled,
                        y = f.checked,
                        h = f.required,
                        v = f.setControl,
                        g = f.setChecked,
                        w = f.hasConsumerStoppedPropagationRef,
                        P = f.isFormControl,
                        O = f.bubbleInput,
                        S = ef(d, v),
                        x = s.useRef(y);
                    return s.useEffect(function() {
                        var e = null == p ? void 0 : p.form;
                        if (e) {
                            var t = function() {
                                return g(x.current)
                            };
                            return e.addEventListener("reset", t),
                                function() {
                                    return e.removeEventListener("reset", t)
                                }
                        }
                    }, [p, g]), (0, o.jsx)(rR.button, iP(iw({
                        type: "button",
                        role: "checkbox",
                        "aria-checked": iB(y) ? "mixed" : y,
                        "aria-required": h,
                        "data-state": iq(y),
                        "data-disabled": b ? "" : void 0,
                        disabled: b,
                        value: m
                    }, u), {
                        ref: S,
                        onKeyDown: il(l, function(e) {
                            "Enter" === e.key && e.preventDefault()
                        }),
                        onClick: il(c, function(e) {
                            g(function(e) {
                                return !!iB(e) || !e
                            }), O && P && (w.current = e.isPropagationStopped(), w.current || e.stopPropagation())
                        })
                    }))
                });
            iM.displayName = iD;
            var ik = s.forwardRef(function(e, t) {
                var r = e.__scopeCheckbox,
                    n = e.name,
                    i = e.checked,
                    a = e.defaultChecked,
                    l = e.required,
                    c = e.disabled,
                    s = e.value,
                    u = e.onCheckedChange,
                    d = e.form,
                    f = iO(e, ["__scopeCheckbox", "name", "checked", "defaultChecked", "required", "disabled", "value", "onCheckedChange", "form"]);
                return (0, o.jsx)(iC, {
                    __scopeCheckbox: r,
                    checked: i,
                    defaultChecked: a,
                    disabled: c,
                    required: l,
                    onCheckedChange: u,
                    name: n,
                    form: d,
                    value: s,
                    internal_do_not_use_render: function(e) {
                        var n = e.isFormControl;
                        return (0, o.jsxs)(o.Fragment, {
                            children: [(0, o.jsx)(iM, iP(iw({}, f), {
                                ref: t,
                                __scopeCheckbox: r
                            })), n && (0, o.jsx)(iU, {
                                __scopeCheckbox: r
                            })]
                        })
                    }
                })
            });
            ik.displayName = iI;
            var iF = "CheckboxIndicator",
                iL = s.forwardRef(function(e, t) {
                    var r = e.__scopeCheckbox,
                        n = e.forceMount,
                        i = iO(e, ["__scopeCheckbox", "forceMount"]),
                        a = iN(iF, r);
                    return (0, o.jsx)(ib, {
                        present: n || iB(a.checked) || !0 === a.checked,
                        children: (0, o.jsx)(rR.span, iP(iw({
                            "data-state": iq(a.checked),
                            "data-disabled": a.disabled ? "" : void 0
                        }, i), {
                            ref: t,
                            style: iw({
                                pointerEvents: "none"
                            }, e.style)
                        }))
                    })
                });
            iL.displayName = iF;
            var i_ = "CheckboxBubbleInput",
                iU = s.forwardRef(function(e, t) {
                    var r, n, i, a, l, c = ix([e, t]),
                        u = c[0],
                        d = c.slice(1),
                        f = u.__scopeCheckbox,
                        p = iO(u, ["__scopeCheckbox"]),
                        m = iS(d, 1)[0],
                        b = iN(i_, f),
                        y = b.control,
                        h = b.hasConsumerStoppedPropagationRef,
                        v = b.checked,
                        g = b.defaultChecked,
                        w = b.required,
                        P = b.disabled,
                        O = b.name,
                        S = b.value,
                        x = b.form,
                        j = b.bubbleInput,
                        I = ef(m, b.setBubbleInput),
                        E = (r = s.useRef({
                            value: v,
                            previous: v
                        }), s.useMemo(function() {
                            return r.current.value !== v && (r.current.previous = r.current.value, r.current.value = v), r.current.previous
                        }, [v])),
                        A = (a = (i = function(e) {
                            if (Array.isArray(e)) return e
                        }(n = s.useState(void 0)) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    o = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 2 !== i.length); o = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        o || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return i
                            }
                        }(n) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return id(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return id(e, 2)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0], l = i[1], ew(function() {
                            if (y) {
                                l({
                                    width: y.offsetWidth,
                                    height: y.offsetHeight
                                });
                                var e = new ResizeObserver(function(e) {
                                    if (Array.isArray(e) && e.length) {
                                        var t, r, n = e[0];
                                        if ("borderBoxSize" in n) {
                                            var i = n.borderBoxSize,
                                                o = Array.isArray(i) ? i[0] : i;
                                            t = o.inlineSize, r = o.blockSize
                                        } else t = y.offsetWidth, r = y.offsetHeight;
                                        l({
                                            width: t,
                                            height: r
                                        })
                                    }
                                });
                                return e.observe(y, {
                                        box: "border-box"
                                    }),
                                    function() {
                                        return e.unobserve(y)
                                    }
                            }
                            l(void 0)
                        }, [y]), a);
                    s.useEffect(function() {
                        if (j) {
                            var e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                                t = !h.current;
                            if (E !== v && e) {
                                var r = new Event("click", {
                                    bubbles: t
                                });
                                j.indeterminate = iB(v), e.call(j, !iB(v) && v), j.dispatchEvent(r)
                            }
                        }
                    }, [j, E, v, h]);
                    var T = s.useRef(!iB(v) && v);
                    return (0, o.jsx)(rR.input, iP(iw({
                        type: "checkbox",
                        "aria-hidden": !0,
                        defaultChecked: null != g ? g : T.current,
                        required: w,
                        disabled: P,
                        name: O,
                        value: S,
                        form: x
                    }, p), {
                        tabIndex: -1,
                        ref: I,
                        style: iP(iw({}, p.style, A), {
                            position: "absolute",
                            pointerEvents: "none",
                            opacity: 0,
                            margin: 0,
                            transform: "translateX(-100%)"
                        })
                    }))
                });

            function iB(e) {
                return "indeterminate" === e
            }

            function iq(e) {
                return iB(e) ? "indeterminate" : e ? "checked" : "unchecked"
            }
            iU.displayName = i_;
            var iV = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-600"
                },
                iz = {
                    XSmall: "",
                    Small: "",
                    Medium: "",
                    Large: "padding-y-xxsmall"
                },
                iG = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                iH = {
                    XSmall: "",
                    Small: "padding-top-xxsmall",
                    Medium: "padding-top-xxsmall",
                    Large: "padding-top-xxsmall"
                },
                iW = function(e) {
                    var t = e.label,
                        r = e.className,
                        n = e.isChecked,
                        i = e.isDisabled,
                        o = e.size,
                        a = e.hint,
                        l = e.placement,
                        c = e.onCheckedChange,
                        s = e.id,
                        d = function(e, t) {
                            if (null == e) return {};
                            var r, n, i, o = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                return o
                            }
                            if (o = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, i = {},
                                        o = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                                    return i
                                }(e, t), Object.getOwnPropertySymbols)
                                for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                            return o
                        }(e, ["label", "className", "isChecked", "isDisabled", "size", "hint", "placement", "onCheckedChange", "id"]),
                        f = ia(),
                        p = s || f,
                        m = t && u().createElement("label", {
                            htmlFor: p,
                            className: Y("flex flex-col grow-1 gap-xsmall", !i && "cursor-pointer")
                        }, u().createElement("span", {
                            className: Y(iG[o], iH[o], "content-emphasis")
                        }, t), a && u().createElement("span", {
                            className: "text-body-medium content-default"
                        }, a));
                    return u().createElement("div", {
                        className: Y("foundation-web-checkbox flex gap-medium", i && "opacity-[0.5]", !i && "cursor-pointer", r)
                    }, "End" === l && m, u().createElement("div", {
                        className: Y(iz[o])
                    }, u().createElement(ik, function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var r = null != arguments[t] ? arguments[t] : {},
                                n = Object.keys(r);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(r, e).enumerable
                            }))), n.forEach(function(t) {
                                var n;
                                n = r[t], t in e ? Object.defineProperty(e, t, {
                                    value: n,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = n
                            })
                        }
                        return e
                    }({
                        "data-slot": "checkbox",
                        className: Y(iV[o], J, !i && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
                        id: p,
                        checked: n,
                        disabled: i,
                        onCheckedChange: c,
                        "aria-label": t
                    }, d), u().createElement(Q, null), u().createElement(iL, {
                        "data-slot": "checkbox-indicator",
                        className: Y(iV[o], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
                    }))), "Start" === l && m)
                };

            function iK(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iX(e) {
                if (Array.isArray(e)) return e
            }

            function i$() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function iY(e, t) {
                if (e) {
                    if ("string" == typeof e) return iK(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return iK(e, t)
                }
            }
            var iJ = {
                    Neutral: "bg-shift-200",
                    Standard: "bg-shift-200",
                    Contrast: "bg-system-contrast",
                    Emphasis: "bg-system-emphasis",
                    Success: "bg-[rgb(from_var(--color-system-success)_r_g_b_/_0.2)]",
                    Warning: "bg-[rgb(from_var(--color-system-warning)_r_g_b_/_0.2)]",
                    Alert: "bg-[rgb(from_var(--color-system-alert)_r_g_b_/_0.2)]",
                    OverMedia: "bg-over-media-0"
                },
                iQ = {
                    Neutral: "content-emphasis",
                    Standard: "content-emphasis",
                    Contrast: "content-inverse-emphasis",
                    Emphasis: "content-[var(--dark-mode-content-emphasis)]",
                    Success: "content-emphasis",
                    Warning: "content-emphasis",
                    Alert: "content-emphasis",
                    OverMedia: "content-emphasis"
                },
                iZ = {
                    Neutral: "content-emphasis",
                    Standard: "content-emphasis",
                    Contrast: "content-inverse-emphasis",
                    Emphasis: "content-[var(--dark-mode-content-emphasis)]",
                    Success: "content-system-success",
                    Warning: "content-system-warning",
                    Alert: "content-system-alert",
                    OverMedia: "content-emphasis"
                },
                i0 = {
                    Neutral: "stroke-none",
                    Standard: "stroke-none",
                    Contrast: "stroke-none",
                    Emphasis: "stroke-none",
                    Success: "stroke-none",
                    Warning: "stroke-none",
                    Alert: "stroke-none",
                    OverMedia: "stroke-none"
                },
                i1 = {
                    Small: "height-600",
                    XSmall: "height-400"
                },
                i2 = {
                    Small: "padding-x-small",
                    XSmall: "padding-x-xsmall"
                },
                i3 = {
                    Small: "width-600",
                    XSmall: "width-400"
                },
                i4 = {
                    Small: "text-label-small",
                    XSmall: "text-caption-small"
                },
                i6 = {
                    Small: "padding-y-xsmall",
                    XSmall: "padding-y-none"
                },
                i8 = {
                    Small: "XSmall",
                    XSmall: "XSmall"
                },
                i5 = {
                    Pill: "radius-circle",
                    Box: "radius-small"
                },
                i7 = u().forwardRef(function(e, t) {
                    var r, n, i, o = iX(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || iY(r) || i$(),
                        a = o[0],
                        l = o.slice(1),
                        c = a.className,
                        s = a.label,
                        d = a.variant,
                        f = void 0 === d ? "Standard" : d,
                        p = a.icon,
                        m = a.iconPosition,
                        b = void 0 === m ? "Leading" : m,
                        y = a.size,
                        h = void 0 === y ? "Small" : y,
                        v = a.shape,
                        g = function(e, t) {
                            if (null == e) return {};
                            var r, n, i, o = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                return o
                            }
                            if (o = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, i = {},
                                        o = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                                    return i
                                }(e, t), Object.getOwnPropertySymbols)
                                for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                            return o
                        }(a, ["className", "label", "variant", "icon", "iconPosition", "size", "shape"]),
                        w = (iX(l) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    o = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 1 !== i.length); o = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        o || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return i
                            }
                        }(l) || iY(l, 1) || i$())[0],
                        P = p && !s,
                        O = "padding-x-xxsmall";
                    p && (O = "Leading" === b ? "padding-right-xxsmall" : "padding-left-xxsmall");
                    var S = p && u().createElement(ei, {
                        name: p,
                        size: i8[h],
                        className: iZ[f]
                    });
                    return u().createElement("div", (n = function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var r = null != arguments[t] ? arguments[t] : {},
                                n = Object.keys(r);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(r, e).enumerable
                            }))), n.forEach(function(t) {
                                var n;
                                n = r[t], t in e ? Object.defineProperty(e, t, {
                                    value: n,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = n
                            })
                        }
                        return e
                    }({
                        ref: w
                    }, g), i = i = {
                        className: Y("foundation-web-badge flex items-center select-none gap-[var(--size-150)]", i5[void 0 === v ? "Pill" : v], i1[h], P ? [i3[h], "justify-center"] : ["width-[fit-content]", i2[h]], iJ[f], iQ[f], i0[f], c)
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(i)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(i)).forEach(function(e) {
                        Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(i, e))
                    }), n), "Leading" === b && S, s && u().createElement("span", {
                        className: Y("text-no-wrap text-truncate-split", i4[h], i6[h], O, iQ[f])
                    }, s), "Trailing" === b && S)
                });
            i7.displayName = "Badge";
            var i9 = window.EventTracker,
                oe = function(e, t, r) {
                    return "".concat("RenderTracking", "-").concat("Purchase", "-").concat(e, "-").concat(t, "-").concat(r)
                },
                ot = function(e, t, r) {
                    return (0, s.useEffect)(function() {
                        r && (0, i9.fireEvent)(oe(e, t, "open"))
                    }, [e, t, r]), {
                        trackUpsellClick: (0, s.useCallback)(function() {
                            (0, i9.fireEvent)(oe(e, t, "click"))
                        }, [e, t])
                    }
                };

            function or(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var on = "roblox_plus_upsell_new_badge_seen",
                oi = function() {
                    try {
                        return "true" === window.localStorage.getItem(on)
                    } catch (e) {
                        return !0
                    }
                },
                oo = function() {
                    try {
                        window.localStorage.setItem(on, "true")
                    } catch (e) {}
                },
                oa = function(e) {
                    var t, r, n, i, a, l, c = e.translate,
                        u = e.assetType,
                        d = e.subscriptionProductInfo,
                        f = e.onBannerClick,
                        p = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, s.useState)(oi)) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    o = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 2 !== i.length); o = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        o || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return i
                            }
                        }(t) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return or(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return or(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        m = p[0],
                        b = p[1],
                        y = null == d || null == (n = d.productTypeDetails.robloxSubscriptionProductDetails) ? void 0 : n.featureConfig,
                        h = null == y || null == (i = y.virtualTransactionDiscounts) ? void 0 : i.find(function(e) {
                            return 0 === e.periodIndex
                        }),
                        v = c("Label.BlackbirdUpsellBanner", {
                            discountPercentage: null == h || null == (a = h.discountPercent) ? void 0 : a.toFixed(0)
                        }),
                        g = null != (r = null == d || null == (l = d.eligibleOffers) ? void 0 : l.some(function(e) {
                            return "FreeTrial" === e.offerType
                        })) && r;
                    ot("UnifiedPurchaseModalUpsellBanner", u, !!d);
                    var w = (0, s.useCallback)(function() {
                            oo(), b(!0), f()
                        }, [f]),
                        P = m ? (0, o.jsx)("span", {
                            className: "content-default underline",
                            children: c(g ? "Action.TrialSubscription" : "Action.Subscribe")
                        }) : (0, o.jsx)(i7, {
                            variant: "Contrast",
                            label: c("Label.New")
                        });
                    return d ? (0, o.jsxs)("button", {
                        type: "button",
                        className: "gap-y-medium flex flex-row justify-between padding-medium bg-shift-100 stroke-default stroke-thick radius-medium cursor-pointer text-body-medium margin-top-[12px]",
                        onClick: w,
                        onKeyDown: function(e) {
                            ("Enter" === e.key || " " === e.key) && (e.preventDefault(), w())
                        },
                        children: [(0, o.jsxs)("div", {
                            className: "gap-x-small flex items-center",
                            children: [(0, o.jsx)(ei, {
                                name: "icon-regular-roblox-plus",
                                size: "Small"
                            }), (0, o.jsx)("span", {
                                children: v
                            })]
                        }), P]
                    }) : null
                };

            function ol(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oc(e) {
                if (Array.isArray(e)) return e
            }

            function os() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function ou(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function od(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function of(e, t) {
                if (null == e) return {};
                var r, n, i, o = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                    return o
                }
                if (o = function(e, t) {
                        if (null == e) return {};
                        var r, n, i = {},
                            o = Object.getOwnPropertyNames(e);
                        for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                        return i
                    }(e, t), Object.getOwnPropertySymbols)
                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                return o
            }

            function op(e, t) {
                if (e) {
                    if ("string" == typeof e) return ol(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ol(e, t)
                }
            }
            var om = new Set(["_self", "_parent", "_top"]),
                ob = {
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                oy = {
                    Standard: "content-emphasis",
                    Emphasis: "content-emphasis",
                    Inverse: "content-inverse-default"
                },
                oh = (0, s.forwardRef)(function(e, t) {
                    var r, n, i, o, a = oc(i = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(i) || op(i) || os(),
                        l = a[0],
                        c = a.slice(1),
                        s = l.children,
                        d = l.className,
                        f = l.size,
                        p = l.color,
                        m = l.variant,
                        b = l.underline,
                        y = void 0 === b ? "hover" : b,
                        h = l.isExternal,
                        v = l.asChild,
                        g = of(l, ["children", "className", "size", "color", "variant", "underline", "isExternal", "asChild"]),
                        w = (oc(c) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    o = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 1 !== i.length); o = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        o || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return i
                            }
                        }(c) || op(c, 1) || os())[0],
                        P = (r = null != (o = g.as) ? o : "a", n = "button" === g.as ? void 0 : g.target, void 0 !== h ? h : "button" !== r && void 0 !== n && !om.has(n)),
                        O = Y("foundation-web-link", "button" === g.as && "bg-none stroke-none padding-none appearance-none [text-align:inherit]", ("Standalone" === (void 0 === m ? "Standalone" : m) || P) && "inline-flex items-center gap-xsmall", void 0 !== f && ob[f], oy[void 0 === p ? "Emphasis" : p], "always" === y ? "underline" : "no-underline", "hover" === y && "hover:underline", "motion-safe:transition-opacity", "hover:cursor-pointer hover:[opacity:0.8]", "radius-xsmall focus-visible:[outline-style:solid] focus-visible:[outline-width:var(--stroke-standard)] focus-visible:[outline-color:var(--color-system-emphasis)]", d),
                        S = P ? u().createElement("span", {
                            "aria-hidden": !0,
                            "data-testid": "foundation-web-icon",
                            className: Y("grow-0 shrink-0 basis-auto icon size-[1em]", "icon-regular-arrow-up-right-from-square")
                        }) : null;
                    if (v) {
                        g.as;
                        var x = of(g, ["as"]),
                            j = u().Children.only(s);
                        return u().isValidElement(j) ? u().createElement(r3, od(ou({
                            ref: w
                        }, x), {
                            className: O
                        }), u().cloneElement(j, {}, u().createElement(u().Fragment, null, j.props.children, S))) : null
                    }
                    if ("button" === g.as) {
                        g.as;
                        var I = g.type,
                            E = of(g, ["as", "type"]);
                        return u().createElement("button", od(ou({
                            ref: w,
                            type: null != I ? I : "button"
                        }, E), {
                            className: O
                        }), s, S)
                    }
                    g.as;
                    var A = of(g, ["as"]);
                    return u().createElement("a", od(ou({
                        ref: w
                    }, A), {
                        className: O
                    }), s, S)
                });

            function ov(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function og(e) {
                if (Array.isArray(e)) return e
            }

            function ow() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function oP(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function oO(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function oS(e, t) {
                if (null == e) return {};
                var r, n, i, o = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                    return o
                }
                if (o = function(e, t) {
                        if (null == e) return {};
                        var r, n, i = {},
                            o = Object.getOwnPropertyNames(e);
                        for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                        return i
                    }(e, t), Object.getOwnPropertySymbols)
                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                return o
            }

            function ox(e, t) {
                if (e) {
                    if ("string" == typeof e) return ov(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ov(e, t)
                }
            }
            oh.displayName = "Link";
            var oj = {
                    Large: "size-1200",
                    Medium: "size-1000",
                    Small: "size-800",
                    XSmall: "size-600"
                },
                oI = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-700"
                },
                oE = {
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
                oA = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-alert",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                oT = {
                    Emphasis: "bg-action-standard",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                oR = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-shift-300",
                    OverMedia: "bg-over-media-0"
                },
                oN = {
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
                oC = {
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
                oD = (0, s.forwardRef)(function(e, t) {
                    var r, n, i = og(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || ox(r) || ow(),
                        o = i[0],
                        a = i.slice(1),
                        l = o.className,
                        c = o.icon,
                        s = o.ariaLabel,
                        d = o.isDisabled,
                        f = void 0 !== d && d,
                        p = o.isCircular,
                        m = o.isSelected,
                        b = o.size,
                        y = void 0 === b ? "Large" : b,
                        h = o.variant,
                        v = void 0 === h ? "Emphasis" : h,
                        g = o.iconColor,
                        w = void 0 === g ? "Default" : g,
                        P = o.asChild,
                        O = o.children,
                        S = oS(o, ["className", "icon", "ariaLabel", "isDisabled", "isCircular", "isSelected", "size", "variant", "iconColor", "asChild", "children"]),
                        x = (og(a) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    o = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 1 !== i.length); o = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        o || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return i
                            }
                        }(a) || ox(a, 1) || ow())[0];
                    n = f ? oT[v] : void 0 !== m && m ? oR[v] : oA[v];
                    var j = Y("foundation-web-icon-button", f ? rW : [J, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", oj[y], oE[y][void 0 !== p && p ? "circular" : "square"], n, l),
                        I = u().createElement(u().Fragment, null, u().createElement(Q, null), u().createElement("span", {
                            className: Y("icon", c, oI[y], f ? oC[w][v] : oN[w][v])
                        }));
                    if (P) {
                        S.as;
                        var E = oS(S, ["as"]),
                            A = u().Children.only(O);
                        return u().createElement(r3, oO(oP({
                            ref: x
                        }, E), {
                            className: j,
                            "aria-label": s,
                            "aria-disabled": f || void 0
                        }), u().cloneElement(A, {}, I))
                    }
                    if ("a" === S.as) {
                        S.as;
                        var T = S.href,
                            R = oS(S, ["as", "href"]);
                        return u().createElement("a", oO(oP({
                            ref: x
                        }, R), {
                            "aria-label": s,
                            "aria-disabled": f,
                            href: f ? void 0 : T,
                            className: j
                        }), I)
                    }
                    S.as;
                    var N = oS(S, ["as"]);
                    return u().createElement("button", oO(oP({
                        ref: x,
                        type: "button"
                    }, N), {
                        "aria-label": s,
                        disabled: f,
                        className: j
                    }), I)
                }),
                oM = function(e) {
                    var t = e.type,
                        r = e.sideSheetSide,
                        n = e.isSideSheetFlush,
                        i = e.centerSheetSize,
                        o = e.children,
                        a = e.overlayClassName,
                        l = e.contentClassName,
                        c = e.onOpenAutoFocus,
                        s = e.onCloseAutoFocus,
                        d = e.onPointerDownOutside,
                        f = e.onEscapeKeyDown,
                        p = e.onInteractOutside;
                    return u().createElement(t9, null, u().createElement(rt, {
                        "data-testid": "fui-base-sheet-overlay",
                        "data-type": t,
                        "data-side": "sideSheet" === t ? void 0 === r ? "right" : r : void 0,
                        "data-flush": "sideSheet" === t ? void 0 !== n && n : void 0,
                        "data-size": "centerSheet" === t ? void 0 === i ? "Medium" : i : void 0,
                        className: Y("fui-base-sheet-overlay", "foundation-web-portal-zindex fixed inset-[0] flex", a)
                    }, u().createElement(ro, {
                        "data-testid": "fui-base-sheet-content",
                        className: Y("fui-base-sheet-content relative bg-surface-100 stroke-muted stroke-standard shadow-transient-high", "flex flex-col clip", l),
                        onOpenAutoFocus: c,
                        onCloseAutoFocus: s,
                        onPointerDownOutside: d,
                        onEscapeKeyDown: f,
                        onInteractOutside: p
                    }, o)))
                };

            function ok(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var oF = function(e) {
                    return ("function" != typeof e.checkVisibility || e.checkVisibility()) && !("disabled" in e && e.disabled || "true" === e.getAttribute("aria-disabled"))
                },
                oL = function(e) {
                    ok(e, HTMLInputElement) && "function" == typeof e.select && e.select()
                },
                o_ = function(e) {
                    var t = e.currentTarget;
                    if (t) {
                        var r = t.querySelectorAll("[data-autofocus-priority]");
                        if (0 !== r.length) {
                            var n = [];
                            r.forEach(function(e) {
                                var t = parseInt(e.getAttribute("data-autofocus-priority") || "", 10);
                                !Number.isNaN(t) && ok(e, HTMLElement) && n.push({
                                    element: e,
                                    priority: t
                                })
                            }), n.sort(function(e, t) {
                                return e.priority - t.priority
                            });
                            var i = n.find(function(e) {
                                return oF(e.element)
                            });
                            if (i) {
                                e.preventDefault();
                                var o = document.activeElement === i.element;
                                i.element.focus(), o || oL(i.element)
                            }
                        }
                    }
                };

            function oU(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            r(977);
            var oB = "u" > typeof window ? s.useLayoutEffect : s.useEffect,
                oq = "u" < typeof window;

            function oV(e) {
                var t, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    n = r.defaultValue,
                    i = void 0 !== n && n,
                    o = r.initializeWithValue,
                    a = void 0 === o || o,
                    l = function(e) {
                        return oq ? i : window.matchMedia(e).matches
                    },
                    c = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = (0, s.useState)(function() {
                        return a ? l(e) : i
                    })) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var i = [],
                                o = !0,
                                a = !1;
                            try {
                                for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 2 !== i.length); o = !0);
                            } catch (e) {
                                a = !0, r = e
                            } finally {
                                try {
                                    o || null == n.return || n.return()
                                } finally {
                                    if (a) throw r
                                }
                            }
                            return i
                        }
                    }(t) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return oU(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return oU(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    u = c[0],
                    d = c[1];

                function f() {
                    d(l(e))
                }
                return oB(function() {
                    var t = window.matchMedia(e);
                    return f(), t.addListener ? t.addListener(f) : t.addEventListener("change", f),
                        function() {
                            t.removeListener ? t.removeListener(f) : t.removeEventListener("change", f)
                        }
                }, [e]), u
            }

            function oz(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oG(e) {
                if (Array.isArray(e)) return e
            }

            function oH() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function oW(e, t) {
                if (e) {
                    if ("string" == typeof e) return oz(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oz(e, t)
                }
            }
            var oK = (0, s.createContext)(null),
                oX = function() {
                    var e = (0, s.useContext)(oK);
                    if (!e) throw Error("Sheet components must be used within a Sheet");
                    return e
                },
                o$ = function(e) {
                    var t = e.open,
                        r = e.onOpenChange,
                        n = e.defaultOpen,
                        i = e.children;
                    return u().createElement(t3, {
                        open: t,
                        onOpenChange: r,
                        defaultOpen: n,
                        modal: !0
                    }, i)
                },
                oY = function(e) {
                    var t, r = e.children,
                        n = e.centerSheetSize,
                        i = void 0 === n ? "Medium" : n,
                        o = e.largeScreenVariant,
                        a = void 0 === o ? "center" : o,
                        l = e.closeLabel,
                        c = e.className,
                        d = e.mobilePortraitClassName,
                        f = e.mobileLandscapeClassName,
                        p = e.largeScreenClassName,
                        m = e.onOpenAutoFocus,
                        b = e.onCloseAutoFocus,
                        y = e.onPointerDownOutside,
                        h = e.onEscapeKeyDown,
                        v = e.onInteractOutside,
                        g = oV("(orientation: portrait) and (max-width: 600px)"),
                        w = oV("(orientation: landscape) and (max-height: 600px)");
                    t = g ? "bottomSheet" : w || "side" === a ? "sideSheet" : "centerSheet";
                    var P = (0, s.useMemo)(function() {
                            return {
                                centerSheetSize: i,
                                largeScreenVariant: a,
                                closeLabel: l,
                                isPortraitMobile: g,
                                isLandscapeMobile: w,
                                type: t
                            }
                        }, [i, a, l, g, w, t]),
                        O = Y(c, g && d, w && f, !g && !w && p);
                    return u().createElement(oK.Provider, {
                        value: P
                    }, u().createElement(oM, {
                        type: t,
                        sideSheetSide: "right",
                        isSideSheetFlush: w,
                        centerSheetSize: i,
                        contentClassName: O,
                        onOpenAutoFocus: null != m ? m : o_,
                        onCloseAutoFocus: b,
                        onPointerDownOutside: y,
                        onEscapeKeyDown: h,
                        onInteractOutside: v
                    }, r))
                },
                oJ = (0, s.forwardRef)(function(e, t) {
                    var r, n = oG(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || oW(r) || oH(),
                        i = n[0],
                        o = n.slice(1),
                        a = i.children,
                        l = i.className,
                        c = i.hasPaddingX,
                        s = function(e, t) {
                            if (null == e) return {};
                            var r, n, i, o = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                return o
                            }
                            if (o = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, i = {},
                                        o = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                                    return i
                                }(e, t), Object.getOwnPropertySymbols)
                                for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                            return o
                        }(i, ["children", "className", "hasPaddingX"]),
                        d = (oG(o) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    o = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 1 !== i.length); o = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        o || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return i
                            }
                        }(o) || oW(o, 1) || oH())[0],
                        f = oX().type;
                    return u().createElement("div", function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var r = null != arguments[t] ? arguments[t] : {},
                                n = Object.keys(r);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(r, e).enumerable
                            }))), n.forEach(function(t) {
                                var n;
                                n = r[t], t in e ? Object.defineProperty(e, t, {
                                    value: n,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = n
                            })
                        }
                        return e
                    }({
                        ref: d,
                        className: Y("scroll-y", (void 0 === c || c) && "padding-x-xlarge", "sideSheet" === f ? "grow-1" : "", l)
                    }, s), a)
                });
            oJ.displayName = "SheetBody";
            var oQ = function(e) {
                    var t = e.className,
                        r = e.children,
                        n = e.navigation,
                        i = e.utilities,
                        o = e.visuallyHideTitleText,
                        a = oX().closeLabel,
                        l = u().createElement(ru, {
                            className: "text-heading-small margin-none"
                        }, r);
                    return u().createElement("div", {
                        className: Y(t, n ? "padding-left-medium" : "padding-left-xlarge", "padding-right-small padding-y-small", "flex items-center justify-between")
                    }, u().createElement("div", {
                        className: Y("flex items-center", n && "gap-xsmall")
                    }, n, o ? u().createElement(rD, null, l) : l), u().createElement("div", {
                        className: Y("flex items-center", i && "gap-xxsmall")
                    }, i, u().createElement("div", {
                        className: "fui-sheet-close-affordance-container"
                    }, u().createElement(rp, {
                        asChild: !0
                    }, u().createElement(oD, {
                        variant: "Utility",
                        size: "Medium",
                        icon: "icon-regular-x",
                        ariaLabel: a || "",
                        "data-autofocus-priority": "1000"
                    })))))
                },
                oZ = function(e) {
                    var t = e.units + 1e-9 * e.nanos;
                    return new Intl.NumberFormat(void 0, {
                        style: "currency",
                        currency: e.currencyCode
                    }).format(t)
                },
                o0 = function(e) {
                    var t, r = e.translate,
                        n = e.eligibleOffers,
                        i = e.price,
                        a = e.periodType,
                        l = oZ(i),
                        c = null != (t = null == n ? void 0 : n.some(function(e) {
                            return "FreeTrial" === e.offerType
                        })) && t ? nf(r, "Description.BillingInfoWithFreeTrialOffer", [{
                            opening: "boldTagStart",
                            closing: "boldTagEnd",
                            render: function(e) {
                                return (0, o.jsx)("span", {
                                    className: "font-bold",
                                    children: e
                                })
                            }
                        }], {
                            trialPeriod: "1",
                            trialPeriodType: a,
                            price: l,
                            periodType: a
                        }) : nf(r, "Description.BillingInfo", [{
                            opening: "priceStart",
                            closing: "priceEnd",
                            render: function(e) {
                                return (0, o.jsx)("span", {
                                    className: "text-heading-medium",
                                    children: e
                                })
                            }
                        }], {
                            price: l,
                            periodType: a
                        });
                    return (0, o.jsx)("span", {
                        className: "text-body-large",
                        children: c
                    })
                },
                o1 = function(e) {
                    var t = e.iconName,
                        r = e.label;
                    return (0, o.jsxs)("div", {
                        className: "gap-x-large align-items-center flex flex-row",
                        children: [(0, o.jsx)(ei, {
                            name: t,
                            size: "Large"
                        }), (0, o.jsx)("span", {
                            className: "text-body-large",
                            children: r
                        })]
                    })
                },
                o2 = function(e) {
                    return new Intl.NumberFormat(void 0, {
                        maximumFractionDigits: 0
                    }).format(e)
                },
                o3 = function(e) {
                    var t = e.translate,
                        r = e.featureConfig,
                        n = e.periodType,
                        i = (0, s.useMemo)(function() {
                            var e;
                            return null == (e = r.virtualTransactionDiscounts) ? void 0 : e.find(function(e) {
                                return 0 === e.periodIndex
                            })
                        }, [r]),
                        a = (0, s.useMemo)(function() {
                            var e;
                            return null == (e = r.virtualTransactionDiscounts) ? void 0 : e.filter(function(e) {
                                return e.periodIndex > 0
                            }).reduce(function(e, t) {
                                return null === e || t.periodIndex < e.periodIndex ? t : e
                            }, null)
                        }, [r]);
                    return (0, o.jsxs)("div", {
                        className: "gap-y-xlarge flex flex-col",
                        children: [i && (0, o.jsx)(o1, {
                            iconName: "icon-regular-tag",
                            label: t("Label.BlackbirdVTDiscountFirst", {
                                discountPercent: o2(i.discountPercent)
                            })
                        }), a && (0, o.jsx)(o1, {
                            iconName: "icon-regular-tag-arrow-up",
                            label: t("Label.BlackbirdVTDiscountSecond", {
                                discountPercent: o2(a.discountPercent),
                                periodIndex: String(a.periodIndex),
                                periodType: n
                            })
                        }), r.privateServerDiscounts && r.privateServerDiscounts.length > 0 && (0, o.jsx)(o1, {
                            iconName: "icon-regular-controller",
                            label: t("Description.Benefit.PrivateServers")
                        }), r.isRobuxTransferEnabled && (0, o.jsx)(o1, {
                            iconName: "icon-regular-robux",
                            label: t("Description.Benefit.RobuxTransfers")
                        })]
                    })
                };

            function o4(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var o6 = function(e) {
                    var t, r = e.productType,
                        n = e.productId,
                        i = e.deviceMeta,
                        a = e.isDisabled,
                        l = void 0 !== a && a,
                        c = e.children,
                        u = e.upsellUuid,
                        d = e.paymentSessionId,
                        f = e.redirectUrl,
                        p = e.trackSubscriptionButtonClick,
                        m = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, s.useState)(!1)) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    o = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 2 !== i.length); o = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        o || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return i
                            }
                        }(t) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return o4(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return o4(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        b = m[0],
                        y = m[1],
                        h = (0, s.useCallback)(function() {
                            l || (null == p || p(), y(!0))
                        }, [l, p]),
                        v = (0, s.useMemo)(function() {
                            if (i.isDesktop) {
                                var e = new URL("/upgrades/paymentmethods", window.location.origin);
                                return e.searchParams.append("ctx", "subscription"), e.searchParams.append("type", r), e.searchParams.append("id", n), f && e.searchParams.append("returnUrl", f), u && e.searchParams.append(x.upsellUtil.constants.UPSELL_QUERY_PARAM_KEY, u), d && e.searchParams.append("paymentSessionId", d), e.toString()
                            }
                            if (i.isAndroidApp || i.isIosApp) {
                                var t = new URL("/mobile-app-upgrades/buy", window.location.origin);
                                return t.searchParams.append("ctx", "subscription"), t.searchParams.append("type", r), t.searchParams.append("id", n), t.toString()
                            }
                        }, [i.isDesktop, i.isAndroidApp, i.isIosApp, r, n, u, d, f]);
                    return (0, o.jsx)(nl, {
                        as: "a",
                        href: v,
                        isDisabled: l || !v,
                        isLoading: b,
                        variant: "Emphasis",
                        onClick: h,
                        children: c
                    })
                },
                o8 = [{
                    opening: "linkStart",
                    closing: "linkEnd",
                    render: function(e) {
                        return (0, o.jsx)(oh, {
                            href: "https://www.roblox.com/info/terms",
                            color: "Standard",
                            target: "_blank",
                            isExternal: !1,
                            children: e
                        })
                    }
                }],
                o5 = function(e) {
                    var t, r = e.translate,
                        n = e.subscriptionProductInfo,
                        i = e.isFreeTrial,
                        a = e.open,
                        l = e.onClose,
                        c = e.isDisabled,
                        s = e.upsellUuid,
                        u = e.paymentSessionId,
                        d = e.redirectUrl,
                        f = e.trackSubscriptionButtonClick,
                        p = (0, nO.DeviceMeta)(),
                        m = n.productKey,
                        b = m.type,
                        y = m.id,
                        h = n.periodType,
                        v = n.localizedPrice,
                        g = n.eligibleOffers,
                        w = null == (t = n.productTypeDetails.robloxSubscriptionProductDetails) ? void 0 : t.featureConfig;
                    return (0, o.jsx)(o$, {
                        open: a,
                        onOpenChange: function(e) {
                            e || l()
                        },
                        children: (0, o.jsxs)(oY, {
                            centerSheetSize: "Medium",
                            largeScreenVariant: "center",
                            closeLabel: r("Action.Close"),
                            children: [(0, o.jsx)(oQ, {
                                children: (0, o.jsxs)("div", {
                                    className: "gap-x-small flex items-center",
                                    children: [(0, o.jsx)(ei, {
                                        className: "!size-1000",
                                        name: "icon-regular-roblox-plus"
                                    }), r("Title.GetBlackbird")]
                                })
                            }), (0, o.jsx)(oJ, {
                                children: (0, o.jsxs)("div", {
                                    className: "padding-large gap-y-xlarge flex flex-col",
                                    children: [(0, o.jsx)(o0, {
                                        translate: r,
                                        eligibleOffers: g,
                                        periodType: h,
                                        price: v
                                    }), w && (0, o.jsx)(o3, {
                                        translate: r,
                                        featureConfig: w,
                                        periodType: h
                                    }), (0, o.jsx)(o6, {
                                        deviceMeta: p,
                                        isDisabled: void 0 !== c && c,
                                        productId: y,
                                        productType: b,
                                        upsellUuid: s,
                                        paymentSessionId: u,
                                        redirectUrl: d,
                                        trackSubscriptionButtonClick: f,
                                        children: r(i ? "Action.TryItForFree" : "Action.Subscribe")
                                    }), (0, o.jsx)("span", {
                                        className: "text-caption-medium content-muted",
                                        children: nf(r, i ? "Label.FreeTrialDisclosureV2" : "Description.SubscriptionLegal", o8)
                                    })]
                                })
                            })]
                        })
                    })
                },
                o7 = function(e) {
                    var t = e.translate,
                        r = e.thumbnail,
                        n = e.assetName,
                        i = e.expectedPrice,
                        a = e.displayPrice,
                        l = e.priceSuffix,
                        c = (e.thumbnailSizePx, e.rentalOptionDays),
                        s = void 0 === c ? null : c,
                        u = e.discountInformation,
                        d = (null == u ? void 0 : u.originalPrice) != null && u.originalPrice > i;
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
                                children: r
                            })]
                        }), (0, o.jsxs)("div", {
                            className: "min-w-0 flex flex-col gap-small",
                            children: [(0, o.jsx)("span", {
                                className: "text-body-large break-words",
                                children: (0, o.jsx)(K, {
                                    name: n
                                })
                            }), null != s && s > 0 && (0, o.jsxs)("div", {
                                className: "flex flex-row items-center gap-small",
                                children: [(0, o.jsx)(ei, {
                                    name: "icon-regular-clock"
                                }), (0, o.jsx)("span", {
                                    children: t(h.timedOptionDaysTimerStartsWhenYouBuy, {
                                        days: s
                                    }) || "".concat(s, " days (Timer starts when you buy)")
                                })]
                            }), d ? (0, o.jsxs)("div", {
                                className: "flex flex-row items-center flex-wrap gap-x-small",
                                children: [(0, o.jsxs)("span", {
                                    className: "flex flex-row items-center",
                                    children: [(0, o.jsx)(L, {
                                        translate: t,
                                        price: i,
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
                                    children: [(0, o.jsx)(L, {
                                        translate: t,
                                        price: u.originalPrice,
                                        color: "",
                                        useFreeText: !1
                                    }), l && (0, o.jsx)("span", {
                                        className: "text-robux",
                                        children: l
                                    })]
                                })]
                            }) : a ? (0, o.jsx)("div", {
                                className: "flex flex-row items-center",
                                children: (0, o.jsxs)("span", {
                                    className: "text-robux",
                                    children: [a, l]
                                })
                            }) : (0, o.jsxs)("div", {
                                className: "flex flex-row items-center",
                                children: [(0, o.jsx)(L, {
                                    translate: t,
                                    price: i,
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
                o9 = function(e, t) {
                    (0, s.useEffect)(function() {
                        t && (0, i9.fireEvent)("".concat("RenderTracking", "-").concat("Purchase", "-").concat(e))
                    }, [t])
                };

            function ae(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var at = (0, s.createContext)(null),
                ar = (0, s.createContext)(null),
                an = {
                    XSmall: "min-height-600",
                    Small: "min-height-800",
                    Medium: "min-height-1000",
                    Large: "min-height-1200"
                },
                ai = {
                    XSmall: "padding-y-xsmall",
                    Small: "padding-y-xsmall",
                    Medium: "padding-y-small",
                    Large: "padding-y-small"
                },
                ao = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium",
                    Large: "text-title-large"
                },
                aa = {
                    XSmall: "size-300",
                    Small: "size-400",
                    Medium: "size-500",
                    Large: "size-600"
                },
                al = (0, s.forwardRef)(function(e, t) {
                    var r = e.children,
                        n = e.className,
                        i = e.size,
                        o = void 0 === i ? "Medium" : i,
                        a = e.hasDivider,
                        l = void 0 !== a && a,
                        c = e.isContained,
                        d = void 0 !== c && c,
                        f = e.isDisabled,
                        p = void 0 !== f && f,
                        m = (0, s.useMemo)(function() {
                            return {
                                size: o,
                                hasDivider: l,
                                isContained: d,
                                isDisabled: p
                            }
                        }, [o, l, d, p]);
                    return u().createElement(at.Provider, {
                        value: m
                    }, u().createElement("div", {
                        ref: t,
                        className: Y("foundation-web-accordion", "flex flex-col items-start width-full", l && "[&>*:not(:last-child)]:[border-bottom:1px_solid_var(--color-stroke-default)]", n)
                    }, r))
                }),
                ac = (0, s.forwardRef)(function(e, t) {
                    var r, n = e.children,
                        i = e.className,
                        o = e.isDisabled,
                        a = void 0 !== o && o,
                        l = e.defaultOpen,
                        c = e.isOpen,
                        d = e.onOpenChange,
                        f = (0, s.useContext)(at),
                        p = function(e) {
                            if (Array.isArray(e)) return e
                        }(r = (0, s.useState)(void 0 !== l && l)) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    o = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 2 !== i.length); o = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        o || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return i
                            }
                        }(r) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return ae(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ae(e, 2)
                            }
                        }(r) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        m = p[0],
                        b = p[1],
                        y = null != c ? c : m,
                        h = ia("fui-a-");
                    if (!f) throw Error("AccordionItem must be used within Accordion");
                    var v = f.isContained,
                        g = f.isDisabled,
                        w = (0, s.useCallback)(function(e) {
                            a || g || (void 0 === c && b(e), null == d || d(e))
                        }, [a, g, c, d]),
                        P = (0, s.useMemo)(function() {
                            return {
                                isOpen: y,
                                setOpen: w,
                                isDisabled: a,
                                triggerId: "".concat(h, "-trigger"),
                                contentId: "".concat(h, "-content")
                            }
                        }, [y, w, a, h]);
                    return u().createElement(ar.Provider, {
                        value: P
                    }, u().createElement("div", {
                        ref: t,
                        "data-contained": v,
                        "data-state": y ? "open" : "closed",
                        className: Y("foundation-web-accordion-item", "width-full", i)
                    }, n))
                }),
                as = function(e) {
                    var t = e.children,
                        r = e.className,
                        n = (0, s.useContext)(at),
                        i = (0, s.useContext)(ar);
                    if (!n) throw Error("AccordionItemTrigger must be used within Accordion");
                    if (!i) throw Error("AccordionItemTrigger must be used within AccordionItem");
                    var o = n.size,
                        a = n.isContained,
                        l = n.isDisabled,
                        c = i.isOpen,
                        d = i.setOpen,
                        f = i.isDisabled,
                        p = l || f;
                    return u().createElement("button", {
                        id: i.triggerId,
                        type: "button",
                        className: Y(J, "relative flex items-center justify-between gap-small cursor-pointer content-default bg-none stroke-none width-full", an[o], ai[o], a ? "padding-x-medium" : "padding-x-none", p && ["opacity-[0.5]", "pointer-events-none"], r),
                        "aria-expanded": c,
                        "aria-controls": i.contentId,
                        onClick: function(e) {
                            e.preventDefault(), p || d(!c)
                        }
                    }, u().createElement(Q, null), u().createElement("div", {
                        className: "flex items-center min-width-0 grow-1"
                    }, u().createElement("span", {
                        className: Y("text-align-x-left", ao[o])
                    }, t)), u().createElement("span", {
                        className: Y("foundation-web-accordion-chevron shrink-0", aa[o], "icon icon-regular-chevron-large-down", "motion-safe:transition-transform duration-200"),
                        style: {
                            transform: c ? "rotate(180deg)" : "rotate(0deg)"
                        }
                    }))
                },
                au = function(e) {
                    var t, r, n = e.children,
                        i = e.className,
                        o = (0, s.useContext)(at),
                        a = (0, s.useContext)(ar);
                    if (!o) throw Error("AccordionItemContent must be used within Accordion");
                    if (!a) throw Error("AccordionItemContent must be used within AccordionItem");
                    var l = o.size,
                        c = a.isOpen ? {} : {
                            inert: "inert"
                        };
                    return u().createElement("div", (t = function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var r = null != arguments[t] ? arguments[t] : {},
                                n = Object.keys(r);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(r, e).enumerable
                            }))), n.forEach(function(t) {
                                var n;
                                n = r[t], t in e ? Object.defineProperty(e, t, {
                                    value: n,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = n
                            })
                        }
                        return e
                    }({
                        id: a.contentId,
                        role: "region",
                        "aria-labelledby": a.triggerId,
                        "aria-hidden": !a.isOpen,
                        "data-state": a.isOpen ? "open" : "closed",
                        "data-size": l.toLowerCase()
                    }, c), r = r = {
                        className: Y("foundation-web-accordion-content grid clip width-full motion-safe:transition-all duration-200 ease-standard-out")
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(r)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(r)).forEach(function(e) {
                        Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(r, e))
                    }), t), u().createElement("div", {
                        className: Y("foundation-web-accordion-content-inner width-full min-height-0 clip padding-top-none padding-bottom-none motion-safe:transition-transform duration-200", !a.isOpen && "pointer-events-none", i)
                    }, n))
                };

            function ad(e) {
                return !!(null == e ? void 0 : e.some(function(e) {
                    return "ROBLOX_PLUS" === e.discountType || "BlackbirdSubscription" === e.discountCampaign || "RobloxPlusSubscription" === e.discountCampaign || "RobloxSubscription" === e.discountCampaign
                }))
            }
            var af = String.fromCodePoint(57346),
                ap = RegExp("".concat(af, "|\\\\u\\{E002\\}|\\\\uE002"), "gi"),
                am = function(e) {
                    var t = e.text,
                        r = e.className,
                        n = e.id;
                    return (0, o.jsx)("span", {
                        id: n,
                        className: Y("inline", r),
                        children: function(e) {
                            if (ap.lastIndex = 0, !ap.test(e)) return [e];
                            for (var t = [], r = 0, n = RegExp(ap.source, "gi"), i = n.exec(e); i;) {
                                var a = i.index;
                                a > r && t.push(e.slice(r, a)), t.push((0, o.jsx)("span", {
                                    className: "icon-robux-16x16 inline-block align-text-bottom",
                                    "aria-hidden": !0
                                }, "robux-icon-".concat(a))), r = a + i[0].length, i = n.exec(e)
                            }
                            return r < e.length && t.push(e.slice(r)), t
                        }(t)
                    })
                };

            function ab(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var ay = function(e) {
                    var t = e.amount,
                        r = Math.abs(t);
                    return (0, o.jsxs)(u().Fragment, {
                        children: [t < 0 && (0, o.jsx)("span", {
                            className: "text-robux",
                            children: "-"
                        }), (0, o.jsx)("span", {
                            className: "icon-robux-16x16"
                        }), (0, o.jsx)("span", {
                            className: "text-robux",
                            children: (0, k.formatNumber)(r)
                        })]
                    })
                },
                ah = function(e) {
                    var t, r = e.translate,
                        n = e.normalizedDiscount,
                        i = e.savingsSummary,
                        a = n.savedAmount,
                        l = n.originalPrice,
                        c = n.totalPrice,
                        u = n.discountLines,
                        d = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, s.useState)(!1)) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    o = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 2 !== i.length); o = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        o || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return i
                            }
                        }(t) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return ab(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ab(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        f = d[0],
                        p = d[1],
                        m = ad(u),
                        b = null == i ? void 0 : i.trim(),
                        y = [{
                            opening: "amountStart",
                            closing: "amountEnd",
                            render: function() {
                                return (0, o.jsx)(ay, {
                                    amount: a
                                })
                            }
                        }],
                        h = function(e) {
                            var t;
                            return ad([e]) ? e.localizedAttribution ? (0, o.jsx)(am, {
                                text: e.localizedAttribution
                            }) : r("Label.PlusBenefitDiscount", {
                                discountPercent: String(null != (t = e.discountPercent) ? t : 0)
                            }) : (0, o.jsx)(am, {
                                text: e.label
                            })
                        };
                    return (0, o.jsx)(al, {
                        className: "text-body-medium padding-none stroke-default stroke-thick radius-medium",
                        children: (0, o.jsxs)(ac, {
                            isOpen: f,
                            onOpenChange: p,
                            children: [(0, o.jsx)(as, {
                                className: Y("!padding-medium bg-shift-100 width-full flex flex-row items-center justify-between", f && "[border-bottom-left-radius:0] [border-bottom-right-radius:0]"),
                                children: (0, o.jsxs)("div", {
                                    className: "flex flex-row items-center gap-x-small content-emphasis",
                                    children: [m && !b && (0, o.jsx)(ei, {
                                        name: "icon-regular-roblox-plus",
                                        size: "Medium"
                                    }), (0, o.jsx)("span", {
                                        children: b ? (0, o.jsx)(am, {
                                            text: b
                                        }) : m ? nf(r, "Description.SavingWithPlus", y, {
                                            robuxAmount: (0, k.formatNumber)(a)
                                        }) : r("Description.SavingRobux", {
                                            robuxAmount: (0, k.formatNumber)(a)
                                        })
                                    })]
                                })
                            }), (0, o.jsxs)(au, {
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
                                            children: r("Label.Subtotal")
                                        }), (0, o.jsx)("span", {
                                            className: "flex flex-row items-center",
                                            children: (0, o.jsx)(ay, {
                                                amount: l
                                            })
                                        })]
                                    }), u.map(function(e, t) {
                                        var r;
                                        return (0, o.jsxs)("div", {
                                            className: "flex flex-row items-center justify-between content-default",
                                            children: [(0, o.jsx)("span", {
                                                children: h(e)
                                            }), (0, o.jsx)("span", {
                                                className: "flex flex-row items-center",
                                                children: (0, o.jsx)(ay, {
                                                    amount: -e.discountAmount
                                                })
                                            })]
                                        }, "".concat(null != (r = e.discountCampaign) ? r : "discount", "-").concat(t))
                                    })]
                                }), (0, o.jsxs)("div", {
                                    className: "padding-medium flex flex-row items-center justify-between text-heading-small content-default bg-shift-100",
                                    children: [(0, o.jsx)("span", {
                                        children: r("Label.Total")
                                    }), (0, o.jsx)("span", {
                                        className: "flex flex-row items-center",
                                        children: (0, o.jsx)(ay, {
                                            amount: c
                                        })
                                    })]
                                })]
                            })]
                        })
                    })
                };

            function av(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, i)
            }

            function ag(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, i) {
                        var o = e.apply(t, r);

                        function a(e) {
                            av(o, n, i, a, l, "next", e)
                        }

                        function l(e) {
                            av(o, n, i, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function aw(e, t) {
                var r, n, i, o = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(a, "next", {
                    value: c(0)
                }), l(a, "throw", {
                    value: c(1)
                }), l(a, "return", {
                    value: c(2)
                }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), a;

                function c(l) {
                    return function(c) {
                        var s = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, s[0] && (o = 0)), o;) try {
                            if (r = 1, n && (i = 2 & s[0] ? n.return : s[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, s[1])).done) return i;
                            switch (n = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                case 0:
                                case 1:
                                    i = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < i[1]) {
                                        o.label = i[1], i = s;
                                        break
                                    }
                                    if (i && o.label < i[2]) {
                                        o.label = i[2], o.ops.push(s);
                                        break
                                    }
                                    i[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], n = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var aP = null;

            function aO(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, i)
            }

            function aS(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ax(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, i)
            }

            function aj(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function aI(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            l = !1;
                        try {
                            for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return aS(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aS(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var aE = window.Roblox["core-scripts"].localStorage.localStorage,
                aA = r.n(aE);

            function aT(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, i)
            }

            function aR(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var aN = ((lw = {}).GET = "GET", lw.POST = "POST", lw),
                aC = ((lP = {}).PAYMENT = "Payment", lP.ROBUX = "Robux", lP.ROBUX_GIFTING = "RobuxGifting", lP.ROBUX_REDESIGN = "RobuxRedesign", lP),
                aD = ((lO = {}).VERIFY_PHONE_VERIFICATION_SESSION = "VerifyPhoneVerificationSession", lO.LANDING_PAGE_METADATA = "GetLandingPageMetadata", lO.GET_USER_NAME = "GetUserName", lO.PREPARE_PAYMENT = "PreparePayment", lO.GET_METADATA = "GetMetadata", lO.GET_PRODUCTS = "GetProducts", lO.GET_PAYMENT_METHODS_INFO = "GetPaymentMethodsInfo", lO.GET_PURCHASE_WARNING = "GetPurchaseWarning", lO.GET_USER_PURCHASE_ELIGIBILITY = "GetUserPurchaseEligibility", lO.CREATE_PAYMENT_SESSION = "CreatePaymentSession", lO.GET_PAYMENT_SESSION = "GetPaymentSession", lO.GET_PAYMENT_SESSION_BY_CHECKOUT_SESSION_ID = "GetPaymentSessionByCheckoutSessionId", lO.CREATE_BONUS_SESSION = "CreateBonusSession", lO.GET_BONUS_SESSION_BY_CHECKOUT_SESSION_ID = "GetBonusSessionByCheckoutSessionId", lO.GET_DISPLAYABLE_BONUS_FOR_PRODUCT = "GetDisplayableBonusForProduct", lO.GET_THUMBNAILS = "GetThumbnails", lO.HANDLE_GAME_PASS_JOIN_EVENT = "HandleGamePassJoinEvent", lO.GET_ROBUX_BALANCE = "GetRobuxBalance", lO.GET_AUTH_TICKET = "GetAuthTicket", lO.GET_CLIENT_ASSERTION = "GetClientAssertion", lO),
                aM = function(e, t, r) {
                    return new Promise(function(n) {
                        (0, i9.fireEvent)("API_COUNTER_".concat(e, "_").concat(t, "_").concat(r || "Throughput")), n()
                    })
                },
                ak = function(e, t, r) {
                    return new Promise(function(n) {
                        (0, i9.fireEvent)("ERROR_COUNTER_".concat(e, "_").concat(t, "_").concat(r || "UnknownAxiosError")), n()
                    })
                };

            function aF(e, t, r, n, i) {
                var o;
                return (o = function(e, t, r, n, i) {
                    var o, a, l, c, s, u, d;
                    return function(e, t) {
                        var r, n, i, o = {
                                label: 0,
                                sent: function() {
                                    if (1 & i[0]) throw i[1];
                                    return i[1]
                                },
                                trys: [],
                                ops: []
                            },
                            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                            l = Object.defineProperty;
                        return l(a, "next", {
                            value: c(0)
                        }), l(a, "throw", {
                            value: c(1)
                        }), l(a, "return", {
                            value: c(2)
                        }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                            value: function() {
                                return this
                            }
                        }), a;

                        function c(l) {
                            return function(c) {
                                var s = [l, c];
                                if (r) throw TypeError("Generator is already executing.");
                                for (; a && (a = 0, s[0] && (o = 0)), o;) try {
                                    if (r = 1, n && (i = 2 & s[0] ? n.return : s[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, s[1])).done) return i;
                                    switch (n = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                        case 0:
                                        case 1:
                                            i = s;
                                            break;
                                        case 4:
                                            return o.label++, {
                                                value: s[1],
                                                done: !1
                                            };
                                        case 5:
                                            o.label++, n = s[1], s = [0];
                                            continue;
                                        case 7:
                                            s = o.ops.pop(), o.trys.pop();
                                            continue;
                                        default:
                                            if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                o = 0;
                                                continue
                                            }
                                            if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                                o.label = s[1];
                                                break
                                            }
                                            if (6 === s[0] && o.label < i[1]) {
                                                o.label = i[1], i = s;
                                                break
                                            }
                                            if (i && o.label < i[2]) {
                                                o.label = i[2], o.ops.push(s);
                                                break
                                            }
                                            i[2] && o.ops.pop(), o.trys.pop();
                                            continue
                                    }
                                    s = t.call(e, o)
                                } catch (e) {
                                    s = [6, e], n = 0
                                } finally {
                                    r = i = 0
                                }
                                if (5 & s[0]) throw s[1];
                                return {
                                    value: s[0] ? s[1] : void 0,
                                    done: !0
                                }
                            }
                        }
                    }(this, function(f) {
                        switch (f.label) {
                            case 0:
                                o = r.feature, a = r.call, aM(o, a), f.label = 1;
                            case 1:
                                return f.trys.push([1, 3, , 4]), [4, "GET" === e ? I.httpService.get(t, n) : I.httpService.post(t, n)];
                            case 2:
                                return c = (l = f.sent()).data, s = l.headers, aM(o, a, 200), [2, (null == i ? void 0 : i(c, s)) || c];
                            case 3:
                                var p, m, b;
                                return (void 0 === (p = u = f.sent()) ? "undefined" : aR(p)) === "object" && "status" in p ? ak(o, a, u.status) : (void 0 === u ? "undefined" : aR(u)) === "object" && "config" in u ? ak(o, a, null == (d = u.response) ? void 0 : d.status) : (console.error(u), m = o, b = a, new Promise(function(e) {
                                    (0, i9.fireEvent)("ERROR_COUNTER_".concat(m, "_").concat(b, "_NonAxiosError")), e()
                                })), [2, void 0];
                            case 4:
                                return [2]
                        }
                    })
                }, function() {
                    var e = this,
                        t = arguments;
                    return new Promise(function(r, n) {
                        var i = o.apply(e, t);

                        function a(e) {
                            aT(i, r, n, a, l, "next", e)
                        }

                        function l(e) {
                            aT(i, r, n, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }).apply(this, arguments)
            }

            function aL(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, i)
            }

            function a_(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, i) {
                        var o = e.apply(t, r);

                        function a(e) {
                            aL(o, n, i, a, l, "next", e)
                        }

                        function l(e) {
                            aL(o, n, i, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function aU(e, t) {
                var r, n, i, o = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(a, "next", {
                    value: c(0)
                }), l(a, "throw", {
                    value: c(1)
                }), l(a, "return", {
                    value: c(2)
                }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), a;

                function c(l) {
                    return function(c) {
                        var s = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, s[0] && (o = 0)), o;) try {
                            if (r = 1, n && (i = 2 & s[0] ? n.return : s[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, s[1])).done) return i;
                            switch (n = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                case 0:
                                case 1:
                                    i = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < i[1]) {
                                        o.label = i[1], i = s;
                                        break
                                    }
                                    if (i && o.label < i[2]) {
                                        o.label = i[2], o.ops.push(s);
                                        break
                                    }
                                    i[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], n = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function aB(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aq(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, i)
            }

            function aV(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            l = !1;
                        try {
                            for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return aB(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aB(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var az = "paymentSession-".concat((null === nO.CurrentUser || void 0 === nO.CurrentUser ? void 0 : nO.CurrentUser.userId) || "loggedout");

            function aG(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aH(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            l = !1;
                        try {
                            for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return aG(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aG(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var aW = (0, c.withTranslations)(function(e) {
                var t, r, n, i, a, l, c, d, f, p, m, b, y, h, v, g, w, P, O, S, E, A, T, R, N, C, D, M, k, F, L, _, U, B, q, V = e.translate,
                    z = e.titleText,
                    G = e.actionButtonText,
                    H = e.expectedPrice,
                    W = e.displayPrice,
                    K = e.thumbnail,
                    X = e.assetName,
                    $ = e.assetType,
                    Y = (e.assetTypeDisplayName, e.sellerName, e.onAction),
                    J = e.onSecondaryAction,
                    Q = e.secondaryActionButtonText,
                    Z = e.footerDisclaimerText,
                    ee = e.priceSuffix,
                    et = e.onCancel,
                    er = e.loading,
                    en = void 0 !== er && er,
                    ei = e.currentRobuxBalance,
                    eo = e.rentalOptionDays,
                    ea = void 0 === eo ? null : eo,
                    el = e.open,
                    ec = void 0 !== el && el,
                    es = e.subscriptionProductInfo,
                    eu = e.discountInformation,
                    ed = e.collectibleItemId,
                    ef = e.isLimited,
                    ep = aH((0, s.useState)(!1), 2),
                    em = ep[0],
                    eb = ep[1],
                    ey = aH((0, s.useState)(), 2),
                    eh = ey[0],
                    ev = ey[1],
                    eg = aH((0, s.useState)(), 2),
                    ew = eg[0],
                    eP = eg[1],
                    eO = (n = void 0 === (r = (t = {
                        collectibleItemId: void 0 === ed ? null : ed,
                        rentalOptionDays: ea,
                        expectedPrice: H,
                        isLimitedItem: void 0 !== ef && ef,
                        open: ec
                    }).collectibleItemId) ? null : r, a = void 0 === (i = t.rentalOptionDays) ? null : i, l = t.expectedPrice, c = t.isLimitedItem, f = void 0 !== (d = t.open) && d, p = t.onPriceResolved, m = null != l && l <= 0 || void 0 !== c && c, y = (b = aI((0, s.useState)([]), 2))[0], h = b[1], v = (0, s.useRef)([]), (0, s.useEffect)(function() {
                        v.current = y
                    }, [y]), w = (g = aI((0, s.useState)(), 2))[0], P = g[1], S = (O = aI((0, s.useState)(void 0), 2))[0], E = O[1], T = (A = aI((0, s.useState)(), 2))[0], R = A[1], C = (N = aI((0, s.useState)(!1), 2))[0], D = N[1], M = (0, s.useRef)(0), k = (0, s.useRef)(p), (0, s.useEffect)(function() {
                        k.current = p
                    }, [p]), F = (0, s.useCallback)(function(e) {
                        var t;
                        return (t = function() {
                            var t, r, i, o, l, c, s, u, d, f;
                            return function(e, t) {
                                var r, n, i, o = {
                                        label: 0,
                                        sent: function() {
                                            if (1 & i[0]) throw i[1];
                                            return i[1]
                                        },
                                        trys: [],
                                        ops: []
                                    },
                                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                    l = Object.defineProperty;
                                return l(a, "next", {
                                    value: c(0)
                                }), l(a, "throw", {
                                    value: c(1)
                                }), l(a, "return", {
                                    value: c(2)
                                }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                                    value: function() {
                                        return this
                                    }
                                }), a;

                                function c(l) {
                                    return function(c) {
                                        var s = [l, c];
                                        if (r) throw TypeError("Generator is already executing.");
                                        for (; a && (a = 0, s[0] && (o = 0)), o;) try {
                                            if (r = 1, n && (i = 2 & s[0] ? n.return : s[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, s[1])).done) return i;
                                            switch (n = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                                case 0:
                                                case 1:
                                                    i = s;
                                                    break;
                                                case 4:
                                                    return o.label++, {
                                                        value: s[1],
                                                        done: !1
                                                    };
                                                case 5:
                                                    o.label++, n = s[1], s = [0];
                                                    continue;
                                                case 7:
                                                    s = o.ops.pop(), o.trys.pop();
                                                    continue;
                                                default:
                                                    if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                        o = 0;
                                                        continue
                                                    }
                                                    if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                                        o.label = s[1];
                                                        break
                                                    }
                                                    if (6 === s[0] && o.label < i[1]) {
                                                        o.label = i[1], i = s;
                                                        break
                                                    }
                                                    if (i && o.label < i[2]) {
                                                        o.label = i[2], o.ops.push(s);
                                                        break
                                                    }
                                                    i[2] && o.ops.pop(), o.trys.pop();
                                                    continue
                                            }
                                            s = t.call(e, o)
                                        } catch (e) {
                                            s = [6, e], n = 0
                                        } finally {
                                            r = i = 0
                                        }
                                        if (5 & s[0]) throw s[1];
                                        return {
                                            value: s[0] ? s[1] : void 0,
                                            done: !0
                                        }
                                    }
                                }
                            }(this, function(p) {
                                var b, y, v, g;
                                switch (p.label) {
                                    case 0:
                                        if (!n || m) return [2];
                                        t = M.current + 1, M.current = t, D(!0), p.label = 1;
                                    case 1:
                                        return p.trys.push([1, , 3, 4]), [4, (b = aj({
                                            featureKey: "MARKETPLACE_CART",
                                            items: [null != a && a > 0 ? {
                                                collectibleItemId: n,
                                                rentalDays: a
                                            } : {
                                                collectibleItemId: n,
                                                isPermanent: !0
                                            }]
                                        }, (null == e ? void 0 : e.length) ? {
                                            unselectedOffers: e
                                        } : {}), (y = function() {
                                            var e, t, r;
                                            return function(e, t) {
                                                var r, n, i, o = {
                                                        label: 0,
                                                        sent: function() {
                                                            if (1 & i[0]) throw i[1];
                                                            return i[1]
                                                        },
                                                        trys: [],
                                                        ops: []
                                                    },
                                                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                                    l = Object.defineProperty;
                                                return l(a, "next", {
                                                    value: c(0)
                                                }), l(a, "throw", {
                                                    value: c(1)
                                                }), l(a, "return", {
                                                    value: c(2)
                                                }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                                                    value: function() {
                                                        return this
                                                    }
                                                }), a;

                                                function c(l) {
                                                    return function(c) {
                                                        var s = [l, c];
                                                        if (r) throw TypeError("Generator is already executing.");
                                                        for (; a && (a = 0, s[0] && (o = 0)), o;) try {
                                                            if (r = 1, n && (i = 2 & s[0] ? n.return : s[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, s[1])).done) return i;
                                                            switch (n = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                                                case 0:
                                                                case 1:
                                                                    i = s;
                                                                    break;
                                                                case 4:
                                                                    return o.label++, {
                                                                        value: s[1],
                                                                        done: !1
                                                                    };
                                                                case 5:
                                                                    o.label++, n = s[1], s = [0];
                                                                    continue;
                                                                case 7:
                                                                    s = o.ops.pop(), o.trys.pop();
                                                                    continue;
                                                                default:
                                                                    if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                                        o = 0;
                                                                        continue
                                                                    }
                                                                    if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                                                        o.label = s[1];
                                                                        break
                                                                    }
                                                                    if (6 === s[0] && o.label < i[1]) {
                                                                        o.label = i[1], i = s;
                                                                        break
                                                                    }
                                                                    if (i && o.label < i[2]) {
                                                                        o.label = i[2], o.ops.push(s);
                                                                        break
                                                                    }
                                                                    i[2] && o.ops.pop(), o.trys.pop();
                                                                    continue
                                                            }
                                                            s = t.call(e, o)
                                                        } catch (e) {
                                                            s = [6, e], n = 0
                                                        } finally {
                                                            r = i = 0
                                                        }
                                                        if (5 & s[0]) throw s[1];
                                                        return {
                                                            value: s[0] ? s[1] : void 0,
                                                            done: !0
                                                        }
                                                    }
                                                }
                                            }(this, function(n) {
                                                switch (n.label) {
                                                    case 0:
                                                        e = {
                                                            url: "".concat(j.EnvironmentUrls.apiGatewayUrl, "/marketplace-sales/v1/cart-pricing"),
                                                            withCredentials: !0
                                                        }, n.label = 1;
                                                    case 1:
                                                        return n.trys.push([1, 3, , 4]), [4, nU.post(e, b)];
                                                    case 2:
                                                        if (200 !== (r = n.sent()).status) return [2, null];
                                                        return [2, null != (t = r.data) ? t : null];
                                                    case 3:
                                                        return n.sent(), [2, null];
                                                    case 4:
                                                        return [2]
                                                }
                                            })
                                        }, function() {
                                            var e = this,
                                                t = arguments;
                                            return new Promise(function(r, n) {
                                                var i = y.apply(e, t);

                                                function o(e) {
                                                    aO(i, r, n, o, a, "next", e)
                                                }

                                                function a(e) {
                                                    aO(i, r, n, o, a, "throw", e)
                                                }
                                                o(void 0)
                                            })
                                        })())];
                                    case 2:
                                        if (d = p.sent(), t !== M.current) return [2];
                                        if (!d) return R(void 0), [2];
                                        return (null == (f = null != (r = null == (l = d.items) ? void 0 : l.find(function(e) {
                                            return e.collectibleItemId === n
                                        })) ? r : null == (c = d.items) ? void 0 : c[0]) ? void 0 : f.priceInRobux) != null && P(f.priceInRobux), E(null != (i = null == f ? void 0 : f.discountInformation) ? i : null), R((null == (s = d.savingsSummary) ? void 0 : s.trim()) || void 0), null == (u = k.current) || u.call(k, null != (o = null == f ? void 0 : f.priceInRobux) ? o : void 0), h(null != (g = null == (v = d.availableOffers) ? void 0 : v.reduce(function(e, t) {
                                            var r, n, i = null == (r = t.localizedDescription) ? void 0 : r.trim();
                                            return t.offerId && i && e.push({
                                                offerId: t.offerId,
                                                localizedText: i,
                                                selected: null != (n = t.selected) && n
                                            }), e
                                        }, [])) ? g : []), [3, 4];
                                    case 3:
                                        return t === M.current && D(!1), [7];
                                    case 4:
                                        return [2]
                                }
                            })
                        }, function() {
                            var e = this,
                                r = arguments;
                            return new Promise(function(n, i) {
                                var o = t.apply(e, r);

                                function a(e) {
                                    ax(o, n, i, a, l, "next", e)
                                }

                                function l(e) {
                                    ax(o, n, i, a, l, "throw", e)
                                }
                                a(void 0)
                            })
                        })()
                    }, [n, a, m]), (0, s.useEffect)(function() {
                        if (!f) {
                            M.current += 1, P(void 0), E(void 0), R(void 0), h([]), D(!1);
                            return
                        }
                        n && !m && F().catch(function() {})
                    }, [f, n, m, F]), L = (0, s.useCallback)(function(e, t) {
                        var r = v.current.map(function(r) {
                            var n, i;
                            return r.offerId === e ? (n = aj({}, r), i = i = {
                                selected: t
                            }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(i)) : (function(e) {
                                var t = Object.keys(e);
                                if (Object.getOwnPropertySymbols) {
                                    var r = Object.getOwnPropertySymbols(e);
                                    t.push.apply(t, r)
                                }
                                return t
                            })(Object(i)).forEach(function(e) {
                                Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(i, e))
                            }), n) : r
                        });
                        v.current = r, h(r);
                        var n = r.filter(function(e) {
                            return !e.selected
                        }).map(function(e) {
                            return e.offerId
                        });
                        F(n.length ? n : void 0).catch(function() {})
                    }, [F]), _ = (0, s.useMemo)(function() {
                        return y.filter(function(e) {
                            return e.selected
                        }).map(function(e) {
                            return e.offerId
                        })
                    }, [y]), {
                        offerSelections: y,
                        resolvedPrice: w,
                        resolvedDiscountInformation: S,
                        resolvedSavingsSummary: T,
                        isPricingLoading: C,
                        selectedOfferIds: _,
                        handleOfferCheckedChange: L
                    }),
                    eS = eO.offerSelections,
                    ex = eO.resolvedPrice,
                    ej = eO.resolvedDiscountInformation,
                    eI = eO.resolvedSavingsSummary,
                    eE = eO.isPricingLoading,
                    eA = eO.selectedOfferIds,
                    eT = eO.handleOfferCheckedChange,
                    eR = aH((0, s.useState)(!1), 2),
                    eN = eR[0],
                    eC = eR[1],
                    eD = function() {
                        var e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
                        return function() {
                            var e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0],
                                t = aV((0, s.useState)(e ? void 0 : aA().getLocalStorage(az)), 2),
                                r = t[0],
                                n = t[1],
                                i = aV((0, s.useState)(!1), 2),
                                o = i[0],
                                a = i[1],
                                l = (0, s.useCallback)(function(e) {
                                    var t;
                                    return (t = function() {
                                        var t, r;
                                        return function(e, t) {
                                            var r, n, i, o = {
                                                    label: 0,
                                                    sent: function() {
                                                        if (1 & i[0]) throw i[1];
                                                        return i[1]
                                                    },
                                                    trys: [],
                                                    ops: []
                                                },
                                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                                l = Object.defineProperty;
                                            return l(a, "next", {
                                                value: c(0)
                                            }), l(a, "throw", {
                                                value: c(1)
                                            }), l(a, "return", {
                                                value: c(2)
                                            }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                                                value: function() {
                                                    return this
                                                }
                                            }), a;

                                            function c(l) {
                                                return function(c) {
                                                    var s = [l, c];
                                                    if (r) throw TypeError("Generator is already executing.");
                                                    for (; a && (a = 0, s[0] && (o = 0)), o;) try {
                                                        if (r = 1, n && (i = 2 & s[0] ? n.return : s[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, s[1])).done) return i;
                                                        switch (n = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                                            case 0:
                                                            case 1:
                                                                i = s;
                                                                break;
                                                            case 4:
                                                                return o.label++, {
                                                                    value: s[1],
                                                                    done: !1
                                                                };
                                                            case 5:
                                                                o.label++, n = s[1], s = [0];
                                                                continue;
                                                            case 7:
                                                                s = o.ops.pop(), o.trys.pop();
                                                                continue;
                                                            default:
                                                                if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                                    o = 0;
                                                                    continue
                                                                }
                                                                if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                                                    o.label = s[1];
                                                                    break
                                                                }
                                                                if (6 === s[0] && o.label < i[1]) {
                                                                    o.label = i[1], i = s;
                                                                    break
                                                                }
                                                                if (i && o.label < i[2]) {
                                                                    o.label = i[2], o.ops.push(s);
                                                                    break
                                                                }
                                                                i[2] && o.ops.pop(), o.trys.pop();
                                                                continue
                                                        }
                                                        s = t.call(e, o)
                                                    } catch (e) {
                                                        s = [6, e], n = 0
                                                    } finally {
                                                        r = i = 0
                                                    }
                                                    if (5 & s[0]) throw s[1];
                                                    return {
                                                        value: s[0] ? s[1] : void 0,
                                                        done: !0
                                                    }
                                                }
                                            }
                                        }(this, function(i) {
                                            switch (i.label) {
                                                case 0:
                                                    if (!e) return [3, 2];
                                                    return [4, a_(function() {
                                                        return aU(this, function(t) {
                                                            return [2, aF(aN.GET, {
                                                                withCredentials: !0,
                                                                url: "".concat(nO.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-sessions/").concat(e)
                                                            }, {
                                                                feature: aC.PAYMENT,
                                                                call: aD.GET_PAYMENT_SESSION
                                                            })]
                                                        })
                                                    })()];
                                                case 1:
                                                    return r = i.sent(), [3, 4];
                                                case 2:
                                                    return [4, a_(function() {
                                                        return aU(this, function(e) {
                                                            return [2, aF(aN.POST, {
                                                                withCredentials: !0,
                                                                url: "".concat(nO.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-sessions")
                                                            }, {
                                                                feature: aC.PAYMENT,
                                                                call: aD.CREATE_PAYMENT_SESSION
                                                            }, {
                                                                paymentFlowId: nP().getPaymentFlowUuid()
                                                            })]
                                                        })
                                                    })()];
                                                case 3:
                                                    r = i.sent(), i.label = 4;
                                                case 4:
                                                    if (!(t = r)) return [2];
                                                    return aA().setLocalStorage(az, t.paymentSession), n(t.paymentSession), [2]
                                            }
                                        })
                                    }, function() {
                                        var e = this,
                                            r = arguments;
                                        return new Promise(function(n, i) {
                                            var o = t.apply(e, r);

                                            function a(e) {
                                                aq(o, n, i, a, l, "next", e)
                                            }

                                            function l(e) {
                                                aq(o, n, i, a, l, "throw", e)
                                            }
                                            a(void 0)
                                        })
                                    })()
                                }, []);
                            return (0, s.useEffect)(function() {
                                if (r) {
                                    new Date(r.expiresAt) < new Date && (a(!0), l());
                                    return
                                }
                                var e, t = null == (e = I.urlService.getQueryParam("paymentSessionId")) ? void 0 : e.toString();
                                t || a(!0), l(t)
                            }, [l, r]), (0, s.useMemo)(function() {
                                return {
                                    paymentSession: r,
                                    wasCreatedByCurrentClient: o
                                }
                            }, [r, o])
                        }(e).paymentSession
                    }(!1),
                    eM = null == eD ? void 0 : eD.id,
                    ek = (0, s.useMemo)(function() {
                        return eM ? {
                            paymentSessionId: eM
                        } : {}
                    }, [eM]);
                (0, s.useEffect)(function() {
                    var e = !1;
                    return ag(function() {
                            return aw(this, function(e) {
                                return aP ? [2, aP] : [2, aP = ag(function() {
                                    return aw(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return e.trys.push([0, 2, , 3]), [4, nO.Guac.callBehaviour("app-policy")];
                                            case 1:
                                                var t;
                                                return [2, (null == (t = e.sent()) ? void 0 : t.DisableRobloxPlusEntrypoints) === !0];
                                            case 2:
                                                return e.sent(), [2, !1];
                                            case 3:
                                                return [2]
                                        }
                                    })
                                })()]
                            })
                        })().then(function(t) {
                            !e && t && eC(!0)
                        }).catch(function() {}),
                        function() {
                            e = !0
                        }
                }, []);
                var eF = null != ex ? ex : H,
                    eL = void 0 !== ej ? ej : eu,
                    e_ = null != (U = null == es || null == (q = es.eligibleOffers) ? void 0 : q.some(function(e) {
                        return "FreeTrial" === e.offerType
                    })) && U,
                    eU = (0, s.useMemo)(function() {
                        var e, t, r, n, i, o, a;
                        return (null == eL ? void 0 : eL.originalPrice) && eL.originalPrice > eF ? (o = null != (e = eL.originalPrice) ? e : 0, {
                            savedAmount: a = null != (t = null != (r = eL.totalDiscountAmount) ? r : eL.totalAmountSaved) ? t : 0,
                            originalPrice: o,
                            totalPrice: o - a,
                            discountLines: null != (n = null == (i = eL.discounts) ? void 0 : i.map(function(e, t) {
                                var r, n, i, o, a = null != (r = null != (n = e.discountAmount) ? n : e.robuxDiscountAmount) ? r : 0,
                                    l = (null == (o = e.localizedDiscountAttribution) ? void 0 : o.trim()) || void 0,
                                    c = l || e.discountCampaign || "Discount ".concat(t + 1);
                                return {
                                    discountAmount: a,
                                    discountCampaign: e.discountCampaign || e.discountId || "line-".concat(t),
                                    discountType: e.discountType,
                                    label: c,
                                    localizedAttribution: l,
                                    discountPercent: null != (i = e.discountPercentage) ? i : e.robuxDiscountPercentage
                                }
                            })) ? n : []
                        }) : null
                    }, [eL, eF]),
                    eB = (0, s.useRef)(!1);
                (0, s.useEffect)(function() {
                    if (!em) {
                        eB.current = !1;
                        return
                    }
                    if (!eB.current && eM) {
                        eB.current = !0, x.paymentFlowAnalyticsService.startRobloxPlusUpsellFlow({
                            assetType: $
                        });
                        var e = e_ ? x.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_FREE_TRIAL : x.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_SUBSCRIBE;
                        x.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(x.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_SINGLE_ITEM_PLUS_UPSELL, !1, x.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBLOX_PLUS_UPSELL_BANNER, x.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN, e, ek)
                    }
                }, [em, eM, $, e_, ek]);
                var eq = (0, s.useCallback)(function(e) {
                        var t = e ? x.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_FREE_TRIAL : x.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.ROBLOX_PLUS_SUBSCRIBE;
                        x.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(x.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_SINGLE_ITEM_PLUS_UPSELL, !1, x.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBLOX_PLUS_UPSELL_BANNER, x.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, t, ek)
                    }, [ek]),
                    eV = ot("UnifiedPurchaseModalUpsellSheet", $, em).trackUpsellClick,
                    ez = (0, s.useCallback)(function() {
                        eV(), eq(e_)
                    }, [eV, eq, e_]),
                    eG = (0, s.useCallback)(function() {
                        ev(x.paymentFlowAnalyticsService.purchaseFlowUuid), eP(window.location.pathname + window.location.hash), eb(!0), null == et || et()
                    }, [et]),
                    eH = (0, s.useCallback)(function() {
                        return eb(!1)
                    }, []);
                return o9("UnifiedPurchaseModal", ec), (0, o.jsxs)(u().Fragment, {
                    children: [(0, o.jsx)(rq, {
                        open: ec,
                        onOpenChange: function(e) {
                            !e && et && et()
                        },
                        isModal: !0,
                        size: "Large",
                        type: "Default",
                        closeLabel: V("Action.Close") || "Close",
                        hasCloseAffordance: !0,
                        children: (0, o.jsxs)(rV, {
                            className: "relative unified-purchase-dialog-content",
                            children: [(0, o.jsxs)(rz, {
                                className: "gap-xlarge flex flex-col",
                                children: [(0, o.jsx)("div", {
                                    style: {
                                        marginTop: 2
                                    },
                                    children: (0, o.jsx)(nm, {
                                        translate: V,
                                        titleText: z,
                                        currentRobuxBalance: W ? void 0 : ei
                                    })
                                }), (0, o.jsx)(o7, {
                                    translate: V,
                                    thumbnail: K,
                                    assetName: X,
                                    expectedPrice: eF,
                                    displayPrice: W,
                                    priceSuffix: ee,
                                    rentalOptionDays: ea,
                                    discountInformation: eL
                                }), eS.map(function(e) {
                                    var t = "purchase-offer-label-".concat(e.offerId);
                                    return (0, o.jsxs)("label", {
                                        htmlFor: "purchase-offer-checkbox-".concat(e.offerId),
                                        className: "flex flex-row items-start gap-x-small self-start cursor-pointer",
                                        children: [(0, o.jsx)(iW, {
                                            id: "purchase-offer-checkbox-".concat(e.offerId),
                                            "aria-labelledby": t,
                                            placement: "Start",
                                            size: "Small",
                                            isChecked: e.selected,
                                            onCheckedChange: function(t) {
                                                eT(e.offerId, !0 === t)
                                            },
                                            isDisabled: eE,
                                            "data-testid": "purchase-promo-checkbox-".concat(e.offerId)
                                        }), (0, o.jsx)(am, {
                                            id: t,
                                            text: e.localizedText,
                                            className: "text-body-medium content-default"
                                        })]
                                    }, e.offerId)
                                }), eU && eU.savedAmount > 0 && (0, o.jsx)(ah, {
                                    translate: V,
                                    normalizedDiscount: eU,
                                    savingsSummary: eI
                                })]
                            }), (0, o.jsxs)(rH, {
                                className: "flex flex-col mt-[40px]",
                                children: [(0, o.jsxs)("div", {
                                    className: "gap-small flex flex-col",
                                    children: [(0, o.jsx)("div", {
                                        className: "flex flex-row-reverse",
                                        children: (0, o.jsx)(nl, {
                                            variant: "Emphasis",
                                            className: "fill basis-0",
                                            onClick: function() {
                                                return Y(function(e) {
                                                    for (var t = 1; t < arguments.length; t++) {
                                                        var r = null != arguments[t] ? arguments[t] : {},
                                                            n = Object.keys(r);
                                                        "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                                            return Object.getOwnPropertyDescriptor(r, e).enumerable
                                                        }))), n.forEach(function(t) {
                                                            var n;
                                                            n = r[t], t in e ? Object.defineProperty(e, t, {
                                                                value: n,
                                                                enumerable: !0,
                                                                configurable: !0,
                                                                writable: !0
                                                            }) : e[t] = n
                                                        })
                                                    }
                                                    return e
                                                }({
                                                    purchasePrice: eF
                                                }, eA.length ? {
                                                    offerIds: eA
                                                } : {}))
                                            },
                                            isDisabled: en || eE,
                                            "data-testid": "purchase-confirm-button",
                                            children: G
                                        })
                                    }), J && Q && (0, o.jsx)("div", {
                                        className: "flex flex-row-reverse",
                                        children: (0, o.jsx)(nl, {
                                            variant: "Standard",
                                            className: "fill basis-0",
                                            onClick: J,
                                            isDisabled: en,
                                            "data-testid": "purchase-secondary-button",
                                            children: Q
                                        })
                                    })]
                                }), !ad(null != (B = null == eU ? void 0 : eU.discountLines) ? B : null) && !eN && (0, o.jsx)(oa, {
                                    translate: V,
                                    assetType: $,
                                    subscriptionProductInfo: es,
                                    onBannerClick: eG
                                }), Z && (0, o.jsx)("p", {
                                    className: "text-body-small content-default",
                                    style: {
                                        marginTop: 12
                                    },
                                    children: Z
                                })]
                            })]
                        })
                    }), es && !eN && (0, o.jsx)(o5, {
                        translate: V,
                        open: em,
                        onClose: eH,
                        subscriptionProductInfo: es,
                        isFreeTrial: e_,
                        upsellUuid: eh,
                        paymentSessionId: eM,
                        redirectUrl: ew,
                        trackSubscriptionButtonClick: ez
                    })]
                })
            }, m);

            function aK(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aX(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var a$ = function(e, t) {
                return (a$ = Object.setPrototypeOf || aX({
                    __proto__: []
                }, Array) && function(e, t) {
                    e.__proto__ = t
                } || function(e, t) {
                    for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
                })(e, t)
            };

            function aY(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                function r() {
                    this.constructor = e
                }
                a$(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
            }
            var aJ = function() {
                return (aJ = Object.assign || function(e) {
                    for (var t, r = 1, n = arguments.length; r < n; r++)
                        for (var i in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
                    return e
                }).apply(this, arguments)
            };

            function aQ(e, t, r, n) {
                return new(r || (r = Promise))(function(i, o) {
                    function a(e) {
                        try {
                            c(n.next(e))
                        } catch (e) {
                            o(e)
                        }
                    }

                    function l(e) {
                        try {
                            c(n.throw(e))
                        } catch (e) {
                            o(e)
                        }
                    }

                    function c(e) {
                        var t;
                        e.done ? i(e.value) : (aX(t = e.value, r) ? t : new r(function(e) {
                            e(t)
                        })).then(a, l)
                    }
                    c((n = n.apply(e, t || [])).next())
                })
            }

            function aZ(e, t) {
                var r, n, i, o = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function l(l) {
                    return function(c) {
                        var s = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, s[0] && (o = 0)), o;) try {
                            if (r = 1, n && (i = 2 & s[0] ? n.return : s[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, s[1])).done) return i;
                            switch (n = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                case 0:
                                case 1:
                                    i = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < i[1]) {
                                        o.label = i[1], i = s;
                                        break
                                    }
                                    if (i && o.label < i[2]) {
                                        o.label = i[2], o.ops.push(s);
                                        break
                                    }
                                    i[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], n = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function a0(e, t, r) {
                if (r || 2 == arguments.length)
                    for (var n, i = 0, o = t.length; i < o; i++) !n && i in t || (n || (n = Array.prototype.slice.call(t, 0, i)), n[i] = t[i]);
                return e.concat(n || Array.prototype.slice.call(t))
            }
            "function" == typeof SuppressedError && SuppressedError;
            var a1 = {
                    envName: ""
                },
                a2 = !1,
                a3 = function() {
                    try {
                        if ("u" < typeof window) return aJ({}, a1);
                        var e = localStorage.getItem("Roblox.MrRouterConfig");
                        if (null == e) return aJ({}, a1);
                        var t = JSON.parse(e);
                        if ("object" != (void 0 === t ? "undefined" : t && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) || null === t) return aJ({}, a1);
                        var r = aJ(aJ({}, a1), "envName" in t && "string" == typeof t.envName && {
                            envName: t.envName
                        });
                        return r.envName && !a2 && (a2 = !0, console.warn('[MrRouter] Routing to non-production environment: "'.concat(r.envName, '"'))), r
                    } catch (e) {
                        return aJ({}, a1)
                    }
                },
                a4 = "mrrouter-env",
                a6 = "tracestate",
                a8 = "traceparent",
                a5 = function(e) {
                    var t = e.indexOf("=");
                    return (-1 === t ? e : e.slice(0, t)).trim()
                },
                a7 = function(e, t) {
                    var r = "".concat(a4, "=").concat(encodeURIComponent(t)),
                        n = null == e ? void 0 : e.trim(),
                        i = n ? n.split(",") : [],
                        o = i.findIndex(function(e) {
                            return a5(e) === a4
                        });
                    if (-1 === o) return a0(a0([], i.map(function(e) {
                        return e.trim()
                    }), !0), [r], !1).join(",");
                    var a = i.filter(function(e) {
                        return a5(e) !== a4
                    }).map(function(e) {
                        return e.trim()
                    });
                    return a.splice(o, 0, r), a.join(",")
                },
                a9 = function(e) {
                    var t = new Uint8Array(e);
                    return crypto.getRandomValues(t), Array.from(t, function(e) {
                        return e.toString(16).padStart(2, "0")
                    }).join("")
                },
                le = "u" > typeof crypto && "function" == typeof crypto.randomUUID,
                lt = function() {
                    return le ? crypto.randomUUID().replaceAll("-", "").slice(0, 32) : a9(16)
                },
                lr = function() {
                    return le ? crypto.randomUUID().replaceAll("-", "").slice(0, 16) : a9(8)
                },
                ln = function(e) {
                    var t = a3().envName;
                    if (t.length > 0 && (e[a6] = a7(e[a6], t), !e[a8])) {
                        var r = lt(),
                            n = lr();
                        e[a8] = "00-".concat(r, "-").concat(n, "-01")
                    }
                };

            function li(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            r(773);
            var lo, la, ll, lc, ls, lu, ld, lf, lp, lm, lb, ly, lh, lv, lg, lw, lP, lO, lS, lx, lj, lI = function(e) {
                    return e.replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/\d+/, "/number")
                },
                lE = function(e, t) {
                    return !1 === t.ok && !1 === [401, 403, 404].includes(t.status) && e(Error("Network error"), {
                        tags: {
                            apiUrl: lI(t.url),
                            apiStatus: null == t ? void 0 : t.status,
                            cors: !1
                        }
                    }), t
                },
                lA = function(e, t) {
                    e(Error("Network error"), {
                        tags: {
                            apiUrl: lI(t),
                            cors: !0
                        }
                    })
                },
                lT = function() {
                    function e(e) {
                        this.captureException = e
                    }
                    return e.prototype.post = function(e) {
                        return aQ(this, void 0, void 0, function() {
                            return aZ(this, function(t) {
                                return [2, lE(this.captureException, e.response)]
                            })
                        })
                    }, e.prototype.onError = function(e) {
                        return aQ(this, void 0, void 0, function() {
                            return aZ(this, function(t) {
                                return lA(this.captureException, e.url), [2]
                            })
                        })
                    }, e
                }(),
                lR = function(e) {
                    if (document) {
                        var t, r, n = document.getElementById("hba-frame");
                        return null === n && ((t = document.createElement("iframe")).id = "hba-frame", t.style.cssText = "position: fixed; top: 0; left: 0; width: 0%; height: 0%; z-index: -1", t.src = "https://www.".concat(e, "/hba/iframe"), r = t, n = (null == document ? void 0 : document.body) ? document.body.appendChild(r) : null), n
                    }
                    return null
                },
                lN = function() {
                    var e = window.location.hostname.split(".").slice(0, -2).join(".");
                    return e.includes("create") ? "creator_hub" : e.includes("advertise") ? "ads_manager" : "creator_hub"
                },
                lC = function(e, t) {
                    try {
                        fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                            method: "POST",
                            body: JSON.stringify({
                                name: "load_time_hba_frame",
                                value: t,
                                labelValues: {
                                    origin_site: lN()
                                }
                            })
                        })
                    } catch (e) {}
                },
                lD = function(e, t) {
                    try {
                        fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                            method: "POST",
                            body: JSON.stringify({
                                name: "response_time_hba_frame",
                                value: t,
                                labelValues: {
                                    origin_site: lN()
                                }
                            })
                        })
                    } catch (e) {}
                },
                lM = function(e, t, r) {
                    return void 0 === r && (r = 1500), new Promise(function(n, i) {
                        var o, a, l = performance.now(),
                            c = window.setTimeout(function() {
                                lC(e, performance.now() - l),
                                    function(e) {
                                        try {
                                            fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                                                method: "POST",
                                                body: JSON.stringify({
                                                    name: "event_hba_frame",
                                                    value: 1,
                                                    labelValues: {
                                                        event_type: "FrameLoadTimedOut",
                                                        origin_site: lN()
                                                    }
                                                })
                                            })
                                        } catch (e) {}
                                    }(e), i(Error("Promise timed out after ".concat(r, " ms")))
                            }, r),
                            s = o = function(t) {
                                var r = t.data;
                                t.origin === "https://www.".concat(e) && "dataFromHbaFrame" === r.msg && "loaded" === r.data.type && (window.removeEventListener("message", o, !1), window.clearTimeout(c), lC(e, performance.now() - l), n())
                            };
                        window.addEventListener("message", s, !1), null == (a = t.contentWindow) || a.postMessage({
                            msg: "checkLoadedRequest"
                        }, "https://www.".concat(e))
                    })
                },
                lk = function(e, t, r, n, i, o, a) {
                    var l;
                    if (void 0 === a && (a = 100), window) {
                        var c, s = performance.now(),
                            u = window.setTimeout(function() {
                                lD(r, performance.now() - s),
                                    function(e) {
                                        try {
                                            fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                                                method: "POST",
                                                body: JSON.stringify({
                                                    name: "event_hba_frame",
                                                    value: 1,
                                                    labelValues: {
                                                        event_type: "FrameResponseTimedOut",
                                                        origin_site: lN()
                                                    }
                                                })
                                            })
                                        } catch (e) {}
                                    }(r), e({
                                        url: i.url,
                                        init: i.init
                                    })
                            }, a),
                            d = c = function(t) {
                                var n = t.data,
                                    a = i.url,
                                    l = i.init;
                                if (t.origin === "https://www.".concat(r) && "dataFromHbaFrame" === n.msg && "batHeader" === n.data.type && (!n.data.identifier || n.data.identifier === o))
                                    if (!n.data.isError && n.data.batHeader) {
                                        window.clearTimeout(u), window.removeEventListener("message", c, !1), lD(r, performance.now() - s);
                                        var d = n.data.batHeader;
                                        e({
                                            url: a,
                                            init: aJ(aJ({}, l), {
                                                headers: aJ(aJ({}, l.headers), {
                                                    "x-bound-auth-token": d["x-bound-auth-token"]
                                                })
                                            })
                                        })
                                    } else window.clearTimeout(u), window.removeEventListener("message", c, !1), lD(r, performance.now() - s), e({
                                        url: a,
                                        init: l
                                    })
                            };
                        window.addEventListener("message", d, !1), null == (l = n.contentWindow) || l.postMessage({
                            msg: "signSubdomainRequest",
                            identifier: o,
                            serializedSubdomainRequestData: JSON.stringify({
                                url: i.url,
                                requestInit: i.init
                            })
                        }, "https://www.".concat(r))
                    }
                },
                lF = function() {
                    return crypto.randomUUID()
                },
                lL = function() {
                    function e(e, t, r) {
                        void 0 === t && (t = 1500), void 0 === r && (r = 100), this.robloxSiteDomain = e, this.hbaFrameAlreadyLoaded = !1, this.hbaFrameLoadFailed = !1, this.hbaFrame = null, this.loadTimeOut = t, this.dataTimeOut = r
                    }
                    return e.prototype.getOrCreateHbaFrame = function() {
                        return lR(this.robloxSiteDomain)
                    }, e.prototype.pre = function(e) {
                        var t = this;
                        return new Promise(function(r, n) {
                            var i = e.url,
                                o = e.init;
                            if (t.hbaFrame = t.getOrCreateHbaFrame(), null !== t.hbaFrame) {
                                var a = lF();
                                t.hbaFrameAlreadyLoaded ? lk(r, 0, t.robloxSiteDomain, t.hbaFrame, e, a, t.dataTimeOut) : t.hbaFrameLoadFailed ? r({
                                    url: i,
                                    init: o
                                }) : lM(t.robloxSiteDomain, t.hbaFrame, t.loadTimeOut).then(function() {
                                    t.hbaFrame ? (t.hbaFrameAlreadyLoaded = !0, lk(r, 0, t.robloxSiteDomain, t.hbaFrame, e, a, t.dataTimeOut)) : r({
                                        url: i,
                                        init: o
                                    })
                                }).catch(function() {
                                    t.hbaFrameLoadFailed = !0, r({
                                        url: i,
                                        init: o
                                    })
                                })
                            } else r({
                                url: i,
                                init: o
                            })
                        })
                    }, e
                }();
            (e = lj || (lj = {})).UNKNOWN = "unknown", e.INVALIDATED = "invalidated", e.ABANDONED = "abandoned", e.LOADFAILED = "loadfailed";
            var l_ = function(e) {
                    function t(t) {
                        var r = e.call(this, "challenge error for challenge kind ".concat(t.kind)) || this;
                        return r.parameters = t, r
                    }
                    return aY(t, e), t.prototype.match = function(e) {
                        return this.parameters.kind === e.parameters.kind && JSON.stringify(this.parameters.data) === JSON.stringify(e.parameters.data)
                    }, t.prototype.matchAbandoned = function(e) {
                        return this.match(e) && e.parameters.kind === lj.ABANDONED
                    }, t
                }(Error),
                lU = "rblx-challenge-id",
                lB = "rblx-challenge-type",
                lq = "rblx-challenge-metadata",
                lV = function(e, t) {
                    return 403 === e.status && e.headers.has(lU) && e.headers.has(lB) && e.headers.has(lq) && "iframe" === t
                },
                lz = function(e) {
                    var t, r, n, i, o, a, l, c, s, u = e.url,
                        d = e.request,
                        f = e.response,
                        p = e.robloxSiteDomain,
                        m = (o = new URLSearchParams([
                            ["challenge-type", "generic"],
                            ["dark-mode", "true"],
                            ["barista-mode", "true"],
                            ["generic-challenge-type", null != (t = f.headers.get(lB)) ? t : ""],
                            ["generic-challenge-id", null != (r = f.headers.get(lU)) ? r : ""],
                            ["challenge-metadata-json", null != (n = f.headers.get(lq)) ? n : ""],
                            ["origin", null != (i = window.location.hostname.split(".").slice(0, -2).join(".")) ? i : ""]
                        ]), a = new URL("https://www.".concat(p, "/challenge/cdn/hybrid?").concat(o.toString())), (l = document.createElement("iframe")).id = "challenge-frame", l.allowFullscreen = !0, l.setAttribute("allowtransparency", "true"), l.setAttribute("allow", "publickey-credentials-get;publickey-credentials-create"), l.style.cssText = "position: fixed; top: 0; left: 0; width: 100%; height: 100%; visibility: hidden; color-scheme: normal; border: none; z-index: 2147483647;", l.src = a.toString(), l.onload = function() {
                            l.style.visibility = "visible"
                        }, c = l, document && document.body ? document.body.appendChild(c) : null);
                    return new Promise(function(e, t) {
                        window && m && (s = function(r) {
                            var n, i, o, a, l, c, s, p, m, b, y;
                            if (r.data && r.data.genericChallengeResponse) switch (r.data.genericChallengeResponse.type) {
                                case "challengeAbandoned":
                                    t(new l_({
                                        kind: lj.ABANDONED,
                                        data: {
                                            challengeType: null != (n = f.headers.get(lB)) ? n : ""
                                        }
                                    }));
                                    break;
                                case "challengeDisplayed":
                                    break;
                                case "challengeCompleted":
                                    (s = r.data.genericChallengeResponse.data).challengeType && s.metadata ? e((p = s.metadata, fetch(u, aJ(aJ({}, d), {
                                        headers: aJ(aJ({}, d.headers), ((m = {})[lU] = null != (b = f.headers.get(lU)) ? b : "", m[lq] = btoa(JSON.stringify(p)), m[lB] = null != (y = f.headers.get(lB)) ? y : "", m))
                                    })))) : t(new l_({
                                        kind: lj.UNKNOWN,
                                        data: {
                                            challengeType: null != (i = f.headers.get(lB)) ? i : ""
                                        }
                                    }));
                                    break;
                                case "challengeInvalidated":
                                    t((s = r.data.genericChallengeResponse.data) && s.challengeType && s.metadata ? new l_({
                                        kind: lj.INVALIDATED,
                                        data: s
                                    }) : new l_({
                                        kind: lj.INVALIDATED,
                                        data: {
                                            challengeType: null != (o = f.headers.get(lB)) ? o : ""
                                        }
                                    }));
                                    break;
                                case "challengeParsed":
                                    !1 === (s = r.data.genericChallengeResponse.data).parsed && t(new l_({
                                        kind: lj.UNKNOWN,
                                        data: {
                                            challengeType: null != (a = f.headers.get(lB)) ? a : ""
                                        }
                                    }));
                                    break;
                                case "challengeInitialized":
                                    !1 === (s = r.data.genericChallengeResponse.data).initialized && t(new l_({
                                        kind: lj.UNKNOWN,
                                        data: {
                                            challengeType: null != (l = f.headers.get(lB)) ? l : ""
                                        }
                                    }));
                                    break;
                                case "challengePageLoaded":
                                    !1 === (s = r.data.genericChallengeResponse.data).pageLoaded && t(new l_({
                                        kind: lj.LOADFAILED,
                                        data: {
                                            challengeType: null != (c = f.headers.get(lB)) ? c : ""
                                        }
                                    }))
                            }
                        }, window.addEventListener("message", s, !1))
                    }).finally(function() {
                        null == m || m.remove(), s && window.removeEventListener("message", s, !1)
                    })
                },
                lG = function() {
                    function e(e, t) {
                        void 0 === t && (t = "iframe"), this.robloxSiteDomain = e, this.genericChallengeMiddlewareType = t
                    }
                    return e.prototype.post = function(e) {
                        var t = e.url,
                            r = e.init,
                            n = e.response;
                        return lV(n, this.genericChallengeMiddlewareType) ? lz({
                            url: t,
                            request: r,
                            response: n,
                            robloxSiteDomain: this.robloxSiteDomain
                        }) : Promise.resolve(n)
                    }, e
                }(),
                lH = function(e) {
                    var t = e.elapsedTime,
                        r = e.url,
                        n = e.status,
                        i = e.schemaPath;
                    return {
                        eventName: "apiVitals",
                        parameters: {
                            elapsedTime: String(t),
                            apiUrl: r,
                            statusCode: String(n),
                            schemaPath: i
                        }
                    }
                },
                lW = function() {
                    function e(e) {
                        this.unifiedLogger = e
                    }
                    return e.prototype.post = function(e) {
                        return this.unifiedLogger.logApiVitalsEvent(lH({
                            elapsedTime: e.elapsedTime,
                            url: e.url,
                            status: e.response.status,
                            schemaPath: e.schemaPath
                        })), Promise.resolve(e.response)
                    }, e
                }(),
                lK = "x-csrf-token",
                lX = ["POST", "PATCH", "DELETE", "PUT"],
                l$ = function() {
                    var e, t = "";
                    try {
                        "u" > typeof window && (t = null != (e = localStorage.getItem(lK)) ? e : "")
                    } catch (e) {
                        console.warn("Error reading localStorage key “".concat(lK, "”:"), e)
                    }
                    return t
                },
                lY = l$(),
                lJ = function(e) {
                    try {
                        lY = e, "u" > typeof window && localStorage.setItem(lK, e)
                    } catch (e) {
                        console.warn("Error setting localStorage key “".concat(lK, "”:"), e)
                    }
                },
                lQ = function() {
                    function e() {
                        this.currentToken = l$()
                    }
                    return e.prototype.pre = function(e) {
                        var t, r = e.url,
                            n = e.init,
                            i = this.currentToken;
                        return n.headers && "object" == ((t = n.headers) && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) && lK in n.headers && (i = n.headers[lK]) && (this.currentToken = i, lJ(i)), n.method && lX.includes(n.method) ? Promise.resolve({
                            url: r,
                            init: this.prepareRequestInit(n)
                        }) : Promise.resolve({
                            url: r,
                            init: n
                        })
                    }, e.prototype.post = function(e) {
                        var t = e.fetch,
                            r = e.url,
                            n = e.init,
                            i = e.response,
                            o = i.headers.get(lK);
                        return 403 === i.status && i.headers.has(lK) && null !== o ? (this.currentToken = o, lJ(o), t(r, this.prepareRequestInit(n))) : Promise.resolve(i)
                    }, e.prototype.prepareRequestInit = function(e) {
                        var t;
                        return aJ(aJ({}, e), {
                            headers: aJ(aJ({}, e.headers), ((t = {})[lK] = this.currentToken, t))
                        })
                    }, e
                }(),
                lZ = [],
                l0 = function(e) {
                    lZ = lZ.filter(function(t) {
                        return t !== e
                    })
                },
                l1 = function(e) {
                    var t = e.url;
                    503 === e.status && lZ.forEach(function(e) {
                        return e(t)
                    })
                },
                l2 = function() {
                    function e() {}
                    return e.prototype.subscribe = function(e) {
                        return lZ.push(e),
                            function() {
                                return l0(e)
                            }
                    }, e.prototype.unsubscribe = function(e) {
                        return l0(e)
                    }, e.prototype.post = function(e) {
                        var t = e.response;
                        return l1(t), Promise.resolve(t)
                    }, e
                }(),
                l3 = function() {
                    function e() {}
                    return e.prototype.pre = function(e) {
                        var t = e.url,
                            r = e.init;
                        if (!a3().envName) return Promise.resolve({
                            url: t,
                            init: r
                        });
                        var n = aJ({}, r.headers);
                        return ln(n), Promise.resolve({
                            url: t,
                            init: aJ(aJ({}, r), {
                                headers: n
                            })
                        })
                    }, e
                }(),
                l4 = new lQ,
                l6 = new l2,
                l8 = [function(e) {
                    return e.captureException ? new lT(e.captureException) : void 0
                }, function(e) {
                    return e.robloxSiteDomain && e.enableBoundAuthToken ? new lL(e.robloxSiteDomain, e.boundAuthTokenLoadTimeout, e.boundAuthTokenDataTimeout) : void 0
                }, function(e) {
                    return e.robloxSiteDomain ? new lG(e.robloxSiteDomain, e.genericChallengeMiddlewareType) : void 0
                }, function(e) {
                    return e.unifiedLogger ? new lW(e.unifiedLogger) : void 0
                }, function() {
                    return l4
                }, function() {
                    return l6
                }, function(e) {
                    return e.enableMrRouter ? new l3 : void 0
                }],
                l5 = function() {
                    function e(e) {
                        void 0 === e && (e = {}), this.configuration = e
                    }
                    return Object.defineProperty(e.prototype, "config", {
                        set: function(e) {
                            this.configuration = e
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(e.prototype, "basePath", {
                        get: function() {
                            return this.configuration.basePath
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(e.prototype, "fetchApi", {
                        get: function() {
                            return this.configuration.fetchApi || window.fetch.bind(window)
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(e.prototype, "middleware", {
                        get: function() {
                            return this.configuration.middleware || []
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(e.prototype, "queryParamsStringify", {
                        get: function() {
                            return this.configuration.queryParamsStringify || function e(t, r) {
                                return void 0 === r && (r = ""), Object.keys(t).map(function(n) {
                                    return function t(r, n, i) {
                                        void 0 === i && (i = "");
                                        var o = i + (i.length ? "[".concat(r, "]") : r);
                                        if (li(n, Array)) {
                                            var a = n.map(function(e) {
                                                return encodeURIComponent(String(e))
                                            }).join("&".concat(encodeURIComponent(o), "="));
                                            return "".concat(encodeURIComponent(o), "=").concat(a)
                                        }
                                        return li(n, Set) ? t(r, Array.from(n), i) : li(n, Date) ? "".concat(encodeURIComponent(o), "=").concat(encodeURIComponent(n.toISOString())) : li(n, Object) ? e(n, o) : "".concat(encodeURIComponent(o), "=").concat(encodeURIComponent(String(n)))
                                    }(n, t[n], r)
                                }).filter(function(e) {
                                    return e.length > 0
                                }).join("&")
                            }
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(e.prototype, "username", {
                        get: function() {
                            return this.configuration.username
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(e.prototype, "password", {
                        get: function() {
                            return this.configuration.password
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(e.prototype, "apiKey", {
                        get: function() {
                            var e = this.configuration.apiKey;
                            if (e) return "function" == typeof e ? e : function() {
                                return e
                            }
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(e.prototype, "accessToken", {
                        get: function() {
                            var e = this,
                                t = this.configuration.accessToken;
                            if (t) return "function" == typeof t ? t : function() {
                                return aQ(e, void 0, void 0, function() {
                                    return aZ(this, function(e) {
                                        return [2, t]
                                    })
                                })
                            }
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(e.prototype, "headers", {
                        get: function() {
                            return this.configuration.headers
                        },
                        enumerable: !1,
                        configurable: !0
                    }), Object.defineProperty(e.prototype, "credentials", {
                        get: function() {
                            return this.configuration.credentials
                        },
                        enumerable: !1,
                        configurable: !0
                    }), e
                }(),
                l7 = new l5,
                l9 = function() {
                    function e(e) {
                        void 0 === e && (e = l7);
                        var t = this;
                        this.configuration = e, this.fetchApi = function(e, r, n) {
                            return aQ(t, void 0, void 0, function() {
                                var t, i, o, a, l, c, s, u, d, f, p, m, b, y = this;
                                return aZ(this, function(h) {
                                    switch (h.label) {
                                        case 0:
                                            t = function(e, t) {
                                                return y.fetchApi(e, t, n)
                                            }, i = {
                                                url: e,
                                                init: r
                                            }, o = 0, a = this.middleware, h.label = 1;
                                        case 1:
                                            return o < a.length ? (b = a[o]).pre ? [4, b.pre(aJ({
                                                fetch: t
                                            }, i))] : [3, 3] : [3, 4];
                                        case 2:
                                            i = h.sent() || i, h.label = 3;
                                        case 3:
                                            return o++, [3, 1];
                                        case 4:
                                            l = void 0, c = performance.now(), h.label = 5;
                                        case 5:
                                            return h.trys.push([5, 7, , 12]), [4, (this.configuration.fetchApi || fetch)(i.url, i.init)];
                                        case 6:
                                            return l = h.sent(), s = performance.now(), [3, 12];
                                        case 7:
                                            u = h.sent(), s = performance.now(), d = 0, f = this.middleware, h.label = 8;
                                        case 8:
                                            return d < f.length ? (b = f[d]).onError ? [4, b.onError({
                                                fetch: t,
                                                url: i.url,
                                                init: i.init,
                                                error: u,
                                                response: l ? l.clone() : void 0
                                            })] : [3, 10] : [3, 11];
                                        case 9:
                                            l = h.sent() || l, h.label = 10;
                                        case 10:
                                            return d++, [3, 8];
                                        case 11:
                                            if (void 0 === l) throw li(u, Error) ? new ct(u, "The request failed and the interceptors did not return an alternative response") : u;
                                            return [3, 12];
                                        case 12:
                                            p = 0, m = this.middleware, h.label = 13;
                                        case 13:
                                            return p < m.length ? (b = m[p]).post ? [4, b.post({
                                                fetch: t,
                                                url: i.url,
                                                init: i.init,
                                                response: l.clone(),
                                                elapsedTime: s - c,
                                                schemaPath: n
                                            })] : [3, 15] : [3, 16];
                                        case 14:
                                            l = h.sent() || l, h.label = 15;
                                        case 15:
                                            return p++, [3, 13];
                                        case 16:
                                            return [2, l]
                                    }
                                })
                            })
                        }, this.middleware = e.middleware
                    }
                    return e.prototype.withMiddleware = function() {
                        for (var e, t = [], r = 0; r < arguments.length; r++) t[r] = arguments[r];
                        var n = this.clone();
                        return n.middleware = (e = n.middleware).concat.apply(e, t), n
                    }, e.prototype.withPreMiddleware = function() {
                        for (var e = [], t = 0; t < arguments.length; t++) e[t] = arguments[t];
                        var r = e.map(function(e) {
                            return {
                                pre: e
                            }
                        });
                        return this.withMiddleware.apply(this, r)
                    }, e.prototype.withPostMiddleware = function() {
                        for (var e = [], t = 0; t < arguments.length; t++) e[t] = arguments[t];
                        var r = e.map(function(e) {
                            return {
                                post: e
                            }
                        });
                        return this.withMiddleware.apply(this, r)
                    }, e.prototype.isJsonMime = function(t) {
                        return !!t && e.jsonRegex.test(t)
                    }, e.prototype.request = function(e, t) {
                        return aQ(this, void 0, void 0, function() {
                            var r, n, i, o;
                            return aZ(this, function(a) {
                                switch (a.label) {
                                    case 0:
                                        return [4, this.createFetchParams(e, t)];
                                    case 1:
                                        return n = (r = a.sent()).url, i = r.init, [4, this.fetchApi(n, i, e.schemaPath)];
                                    case 2:
                                        if ((o = a.sent()) && o.status >= 200 && o.status < 300) return [2, o];
                                        throw new ce(o, "Response from ".concat(o.url, " returned an error code ").concat(o.status))
                                }
                            })
                        })
                    }, e.prototype.createFetchParams = function(e, t) {
                        return aQ(this, void 0, void 0, function() {
                            var r, n, i, o, a, l, c, s = this;
                            return aZ(this, function(u) {
                                var d, f;
                                switch (u.label) {
                                    case 0:
                                        return r = this.configuration.basePath + e.path, void 0 !== e.query && 0 !== Object.keys(e.query).length && (r += "?" + this.configuration.queryParamsStringify(e.query)), Object.keys(n = Object.assign({}, this.configuration.headers, e.headers)).forEach(function(e) {
                                            return void 0 === n[e] ? delete n[e] : {}
                                        }), i = "function" == typeof t ? t : function() {
                                            return aQ(s, void 0, void 0, function() {
                                                return aZ(this, function(e) {
                                                    return [2, t]
                                                })
                                            })
                                        }, o = {
                                            method: e.method,
                                            headers: n,
                                            body: e.body,
                                            credentials: this.configuration.credentials
                                        }, l = [aJ({}, o)], [4, i({
                                            init: o,
                                            context: e
                                        })];
                                    case 1:
                                        return a = aJ.apply(void 0, l.concat([u.sent()])), c = aJ(aJ({}, a), {
                                            body: (d = a.body, "u" > typeof FormData && li(d, FormData) || li(a.body, URLSearchParams) || (f = a.body, "u" > typeof Blob && li(f, Blob)) ? a.body : JSON.stringify(a.body))
                                        }), [2, {
                                            url: r,
                                            init: c
                                        }]
                                }
                            })
                        })
                    }, e.prototype.clone = function() {
                        var e = new(0, this.constructor)(this.configuration);
                        return e.middleware = this.middleware.slice(), e
                    }, e.jsonRegex = RegExp("^(:?application/json|[^;/ 	]+/[^;/ 	]+[+]json)[ 	]*(:?;.*)?$", "i"), e
                }(),
                ce = function(e) {
                    function t(t, r) {
                        var n = e.call(this, r) || this;
                        return n.response = t, n.name = "ResponseError", n
                    }
                    return aY(t, e), t
                }(Error),
                ct = function(e) {
                    function t(t, r) {
                        var n = e.call(this, r) || this;
                        return n.cause = t, n.name = "FetchError", n
                    }
                    return aY(t, e), t
                }(Error),
                cr = function(e) {
                    function t(t, r) {
                        var n = e.call(this, r) || this;
                        return n.field = t, n.name = "RequiredError", n
                    }
                    return aY(t, e), t
                }(Error);

            function cn(e, t) {
                return null != e[t]
            }
            var ci = function() {
                    function e(e, t) {
                        void 0 === t && (t = function(e) {
                            return e
                        }), this.raw = e, this.transformer = t
                    }
                    return e.prototype.value = function() {
                        return aQ(this, void 0, void 0, function() {
                            var e;
                            return aZ(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        return e = this.transformer, [4, this.raw.json()];
                                    case 1:
                                        return [2, e.apply(this, [t.sent()])]
                                }
                            })
                        })
                    }, e
                }(),
                co = ((function(e) {
                    this.raw = e
                }).prototype.value = function() {
                    return aQ(this, void 0, void 0, function() {
                        return aZ(this, function(e) {
                            return [2, void 0]
                        })
                    })
                }, (function(e) {
                    this.raw = e
                }).prototype.value = function() {
                    return aQ(this, void 0, void 0, function() {
                        return aZ(this, function(e) {
                            switch (e.label) {
                                case 0:
                                    return [4, this.raw.blob()];
                                case 1:
                                    return [2, e.sent()]
                            }
                        })
                    })
                }, (function(e) {
                    this.raw = e
                }).prototype.value = function() {
                    return aQ(this, void 0, void 0, function() {
                        return aZ(this, function(e) {
                            switch (e.label) {
                                case 0:
                                    return [4, this.raw.text()];
                                case 1:
                                    return [2, e.sent()]
                            }
                        })
                    })
                }, function(e) {
                    function t(t) {
                        void 0 === t && (t = {});
                        var r, n = aJ({}, t),
                            i = n.middleware || [];
                        return i.unshift.apply(i, (r = t, l8.map(function(e) {
                            return e(r)
                        }).filter(function(e) {
                            return e
                        }))), n.middleware = i, e.call(this, n) || this
                    }
                    return aY(t, e), t
                }(l5));

            function ca(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var cl = function(e, t) {
                return (cl = Object.setPrototypeOf || ca({
                    __proto__: []
                }, Array) && function(e, t) {
                    e.__proto__ = t
                } || function(e, t) {
                    for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
                })(e, t)
            };

            function cc(e, t, r, n) {
                return new(r || (r = Promise))(function(i, o) {
                    function a(e) {
                        try {
                            c(n.next(e))
                        } catch (e) {
                            o(e)
                        }
                    }

                    function l(e) {
                        try {
                            c(n.throw(e))
                        } catch (e) {
                            o(e)
                        }
                    }

                    function c(e) {
                        var t;
                        e.done ? i(e.value) : (ca(t = e.value, r) ? t : new r(function(e) {
                            e(t)
                        })).then(a, l)
                    }
                    c((n = n.apply(e, t || [])).next())
                })
            }

            function cs(e, t) {
                var r, n, i, o = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                    return this
                }), a;

                function l(l) {
                    return function(c) {
                        var s = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, s[0] && (o = 0)), o;) try {
                            if (r = 1, n && (i = 2 & s[0] ? n.return : s[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, s[1])).done) return i;
                            switch (n = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                case 0:
                                case 1:
                                    i = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < i[1]) {
                                        o.label = i[1], i = s;
                                        break
                                    }
                                    if (i && o.label < i[2]) {
                                        o.label = i[2], o.ops.push(s);
                                        break
                                    }
                                    i[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], n = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function cu(e) {
                return e
            }
            "function" == typeof SuppressedError && SuppressedError;

            function cd(e, t) {
                return null == e ? e : {
                    currencyCode: e.currencyCode,
                    units: e.units,
                    nanos: e.nanos
                }
            }

            function cf(e) {
                return e
            }

            function cp(e) {
                var t, r;
                return null == (t = e) ? t : {
                    offerType: cn(t, "offerType") ? t.offerType : void 0,
                    freeTrialOffer: cn(t, "freeTrialOffer") ? null == (r = t.freeTrialOffer) ? r : {
                        periodType: r.periodType,
                        duration: r.duration,
                        estimatedTrialEndDate: cn(r, "estimatedTrialEndDate") ? null === r.estimatedTrialEndDate ? null : new Date(r.estimatedTrialEndDate) : void 0
                    } : void 0
                }
            }

            function cm(e) {
                var t;
                return null == (t = e) ? t : {
                    type: t.type,
                    id: t.id
                }
            }

            function cb(e) {
                var t;
                return null == (t = e) ? t : {
                    tierId: t.tierId,
                    periodIndex: t.periodIndex,
                    discountPercent: t.discountPercent
                }
            }

            function cy(e) {
                var t, r, n, i, o, a, l, c, s;
                return null == (t = e) ? t : {
                    productKey: cm(t.productKey),
                    periodType: t.periodType,
                    periodCount: t.periodCount,
                    localizedPrice: cd(t.localizedPrice),
                    localizedPriceDisplayString: t.localizedPriceDisplayString,
                    localizedStrikethroughPrice: cd(t.localizedStrikethroughPrice),
                    localizedStrikethroughPriceDisplayString: t.localizedStrikethroughPriceDisplayString,
                    productTypeDetails: null == (r = t.productTypeDetails) ? r : {
                        currencySubscriptionProductDetails: cn(r, "currencySubscriptionProductDetails") ? null == (n = r.currencySubscriptionProductDetails) ? n : {
                            currencyType: n.currencyType,
                            entitledAmountMicros: n.entitledAmountMicros
                        } : void 0,
                        developerSubscriptionProductDetails: cn(r, "developerSubscriptionProductDetails") ? null == (i = r.developerSubscriptionProductDetails) ? i : {
                            universeId: i.universeId,
                            imageAssetId: i.imageAssetId,
                            localizedName: i.localizedName,
                            localizedDescription: i.localizedDescription
                        } : void 0,
                        robloxSubscriptionProductDetails: cn(r, "robloxSubscriptionProductDetails") ? null == (o = r.robloxSubscriptionProductDetails) ? o : {
                            featureConfig: null == (a = o.featureConfig) ? a : {
                                virtualTransactionDiscounts: null === a.virtualTransactionDiscounts ? null : a.virtualTransactionDiscounts.map(cb),
                                isRobuxTransferEnabled: a.isRobuxTransferEnabled,
                                isTradingEnabled: a.isTradingEnabled,
                                isUgcPublishingEnabled: a.isUgcPublishingEnabled,
                                privateServerDiscounts: null === a.privateServerDiscounts ? null : a.privateServerDiscounts.map(cb),
                                currencySubscriptionConfig: null == (l = a.currencySubscriptionConfig) ? l : {
                                    currencyType: l.currencyType,
                                    entitledAmountMicros: l.entitledAmountMicros
                                },
                                coreContentPublishingConfig: null == (c = a.coreContentPublishingConfig) ? c : {
                                    minimumPeriodIndex: c.minimumPeriodIndex
                                },
                                isAppThemesEnabled: a.isAppThemesEnabled,
                                isProfileFrameEnabled: a.isProfileFrameEnabled,
                                isAiBackgroundEnabled: a.isAiBackgroundEnabled,
                                robuxTransferConfig: null == (s = a.robuxTransferConfig) ? s : {
                                    isElevatedLimitEnabled: s.isElevatedLimitEnabled
                                }
                            }
                        } : void 0
                    },
                    eligibleOffers: t.eligibleOffers.map(cp)
                }
            }

            function ch(e) {
                var t;
                return null == (t = e) ? t : {
                    referralId: t.referralId,
                    senderUserId: t.senderUserId,
                    status: t.status,
                    createdTimestampMs: t.createdTimestampMs
                }
            }

            function cv(e) {
                var t, r, n, i, o, a, l;
                return null == (t = e) ? t : {
                    productKey: cm(t.productKey),
                    periodType: t.periodType,
                    displayPrice: cd(t.displayPrice),
                    activationTimestampMs: t.activationTimestampMs,
                    expirationTimestampMs: t.expirationTimestampMs,
                    nextRenewalTimestampMs: t.nextRenewalTimestampMs,
                    paymentProvider: cf(t.paymentProvider),
                    purchasePlatform: t.purchasePlatform,
                    paymentProfile: null == (r = t.paymentProfile) ? r : {
                        id: r.id,
                        cardInfo: null == (n = r.cardInfo) ? n : {
                            cardNetwork: n.cardNetwork,
                            lastFourDigits: n.lastFourDigits,
                            expirationMonth: n.expirationMonth,
                            expirationYear: n.expirationYear
                        }
                    },
                    activeOffers: t.activeOffers.map(cp),
                    productTypeMembershipDetails: null == (i = t.productTypeMembershipDetails) ? i : {
                        robloxSubscriptionMembershipDetails: cn(i, "robloxSubscriptionMembershipDetails") ? null == (o = i.robloxSubscriptionMembershipDetails) ? o : {
                            features: null == (a = o.features) ? a : {
                                productType: a.productType,
                                virtualTransactionDiscountTierId: a.virtualTransactionDiscountTierId,
                                isRobuxTransferEnabled: a.isRobuxTransferEnabled,
                                isTradingEnabled: a.isTradingEnabled,
                                isUgcPublishingEnabled: a.isUgcPublishingEnabled,
                                privateServerDiscountTierId: a.privateServerDiscountTierId,
                                isCoreContentPublishingEnabled: a.isCoreContentPublishingEnabled,
                                isAppThemesEnabled: a.isAppThemesEnabled,
                                isProfileFrameEnabled: a.isProfileFrameEnabled,
                                isAiBackgroundEnabled: a.isAiBackgroundEnabled,
                                isRobuxTransferElevatedLimitEnabled: a.isRobuxTransferElevatedLimitEnabled
                            },
                            currencySubscriptionBenefit: null == (l = o.currencySubscriptionBenefit) ? l : {
                                currencyType: l.currencyType,
                                entitledAmountMicrosPerGrantingPeriod: l.entitledAmountMicrosPerGrantingPeriod,
                                grantingPeriodType: l.grantingPeriodType
                            }
                        } : void 0
                    },
                    productInfo: cy(t.productInfo)
                }
            }
            var cg = function(e) {
                    function t() {
                        return null !== e && e.apply(this, arguments) || this
                    }
                    return function(e, t) {
                        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                        function r() {
                            this.constructor = e
                        }
                        cl(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
                    }(t, e), t.prototype.subscriptionsV2CheckSubscriptionReferralEligibilityRaw = function(e, t) {
                        return cc(this, void 0, void 0, function() {
                            var r, n;
                            return cs(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        return r = {}, void 0 !== e.referrerId && (r.referrerId = e.referrerId), n = {}, [4, this.request({
                                            path: "/v2/referral-eligibility",
                                            schemaPath: "/v2/referral-eligibility",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new ci(i.sent(), function(e) {
                                            return null == e ? e : {
                                                eligibility: e.eligibility
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2CheckSubscriptionReferralEligibility = function() {
                        return cc(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), cs(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2CheckSubscriptionReferralEligibilityRaw(e, t)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ClaimSubscriptionProductRaw = function(e, t) {
                        return cc(this, void 0, void 0, function() {
                            var r, n;
                            return cs(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new cr("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2ClaimSubscriptionProduct.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new cr("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2ClaimSubscriptionProduct.");
                                        return r = {}, void 0 !== e.grantType && (r.grantType = e.grantType), n = {}, [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/claim".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                            schemaPath: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/claim",
                                            method: "POST",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new ci(i.sent())]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ClaimSubscriptionProduct = function(e, t) {
                        return cc(this, void 0, void 0, function() {
                            return cs(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2ClaimSubscriptionProductRaw(e, t)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2CreateSubscriptionReferralRaw = function(e, t) {
                        return cc(this, void 0, void 0, function() {
                            var r, n;
                            return cs(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        return r = {}, void 0 !== e.referrerId && (r.referrerId = e.referrerId), n = {}, [4, this.request({
                                            path: "/v2/referrals",
                                            schemaPath: "/v2/referrals",
                                            method: "POST",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new ci(i.sent(), function(e) {
                                            return null == e ? e : {
                                                referralId: e.referralId
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2CreateSubscriptionReferral = function() {
                        return cc(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), cs(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2CreateSubscriptionReferralRaw(e, t)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2CreateSubscriptionReferralLinkRaw = function(e) {
                        return cc(this, void 0, void 0, function() {
                            var t, r;
                            return cs(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        return t = {}, r = {}, [4, this.request({
                                            path: "/v2/referral-links",
                                            schemaPath: "/v2/referral-links",
                                            method: "POST",
                                            headers: r,
                                            query: t
                                        }, e)];
                                    case 1:
                                        return [2, new ci(n.sent(), function(e) {
                                            return null == e ? e : {
                                                deepLinkUrl: e.deepLinkUrl
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2CreateSubscriptionReferralLink = function(e) {
                        return cc(this, void 0, void 0, function() {
                            return cs(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2CreateSubscriptionReferralLinkRaw(e)];
                                    case 1:
                                        return [4, t.sent().value()];
                                    case 2:
                                        return [2, t.sent()]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2GetProductDisplayPriceRaw = function(e, t) {
                        return cc(this, void 0, void 0, function() {
                            var r, n;
                            return cs(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new cr("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetProductDisplayPrice.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new cr("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetProductDisplayPrice.");
                                        return r = {}, n = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (n["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/display-price".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                            schemaPath: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/display-price",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new ci(i.sent(), function(e) {
                                            return null == e ? e : {
                                                displayPrice: cd(e.displayPrice)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2GetProductDisplayPrice = function(e, t) {
                        return cc(this, void 0, void 0, function() {
                            return cs(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2GetProductDisplayPriceRaw(e, t)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2GetProductPaymentMetadataRaw = function(e, t) {
                        return cc(this, void 0, void 0, function() {
                            var r, n;
                            return cs(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new cr("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetProductPaymentMetadata.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new cr("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetProductPaymentMetadata.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/payment-metadata".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                            schemaPath: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/payment-metadata",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new ci(i.sent(), function(e) {
                                            return null == e ? e : {
                                                paymentMethods: e.paymentMethods.map(cu),
                                                paymentProviders: e.paymentProviders.map(cf)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2GetProductPaymentMetadata = function(e, t) {
                        return cc(this, void 0, void 0, function() {
                            return cs(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2GetProductPaymentMetadataRaw(e, t)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2GetSubscriptionProductInfoRaw = function(e, t) {
                        return cc(this, void 0, void 0, function() {
                            var r, n;
                            return cs(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new cr("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetSubscriptionProductInfo.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new cr("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetSubscriptionProductInfo.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                            schemaPath: "/v2/products/{subscriptionProductType}/{subscriptionProductId}",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new ci(i.sent(), function(e) {
                                            return null == e ? e : {
                                                subscriptionProductInfo: cy(e.subscriptionProductInfo)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2GetSubscriptionProductInfo = function(e, t) {
                        return cc(this, void 0, void 0, function() {
                            return cs(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2GetSubscriptionProductInfoRaw(e, t)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ListAvailableSubscriptionProductsRaw = function(e, t) {
                        return cc(this, void 0, void 0, function() {
                            var r, n;
                            return cs(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        return r = {}, void 0 !== e.productType && (r.ProductType = e.productType), void 0 !== e.includePurchased && (r.IncludePurchased = e.includePurchased), void 0 !== e.includeBundles && (r.IncludeBundles = e.includeBundles), void 0 !== e.purchasePlatform && (r.PurchasePlatform = e.purchasePlatform), void 0 !== e.skipEligibilityCheck && (r.SkipEligibilityCheck = e.skipEligibilityCheck), void 0 !== e.grantType && (r.GrantType = e.grantType), void 0 !== e.paymentProvider && (r.PaymentProvider = e.paymentProvider), void 0 !== e.includeExtendedTermProducts && (r.IncludeExtendedTermProducts = e.includeExtendedTermProducts), n = {}, [4, this.request({
                                            path: "/v2/products",
                                            schemaPath: "/v2/products",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new ci(i.sent(), function(e) {
                                            return null == e ? e : {
                                                productKeys: e.productKeys.map(cm),
                                                products: e.products.map(cy)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ListAvailableSubscriptionProducts = function() {
                        return cc(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), cs(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2ListAvailableSubscriptionProductsRaw(e, t)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ListSubscriptionReferralsRaw = function(e, t) {
                        return cc(this, void 0, void 0, function() {
                            var r, n;
                            return cs(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        return r = {}, void 0 !== e.status && (r.Status = e.status), void 0 !== e.earliestCreatedTimestampMs && (r.EarliestCreatedTimestampMs = e.earliestCreatedTimestampMs), void 0 !== e.pageSize && (r.PageSize = e.pageSize), void 0 !== e.cursor && (r.Cursor = e.cursor), n = {}, [4, this.request({
                                            path: "/v2/referrals",
                                            schemaPath: "/v2/referrals",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new ci(i.sent(), function(e) {
                                            return null == e ? e : {
                                                referrals: e.referrals.map(ch),
                                                nextCursor: e.nextCursor,
                                                hasMore: e.hasMore
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ListSubscriptionReferrals = function() {
                        return cc(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), cs(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2ListSubscriptionReferralsRaw(e, t)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ListSubscriptionsRaw = function(e, t) {
                        return cc(this, void 0, void 0, function() {
                            var r, n;
                            return cs(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        return r = {}, void 0 !== e.productType && (r.ProductType = e.productType), void 0 !== e.expirationTimestampMsStart && (r.ExpirationTimestampMsStart = e.expirationTimestampMsStart), void 0 !== e.expirationTimestampMsEnd && (r.ExpirationTimestampMsEnd = e.expirationTimestampMsEnd), void 0 !== e.cursor && (r.Cursor = e.cursor), void 0 !== e.resultsPerPage && (r.ResultsPerPage = e.resultsPerPage), n = {}, [4, this.request({
                                            path: "/v2/user/subscriptions",
                                            schemaPath: "/v2/user/subscriptions",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new ci(i.sent(), function(e) {
                                            return null == e ? e : {
                                                subscriptions: e.subscriptions.map(cv),
                                                hasMore: e.hasMore,
                                                cursor: e.cursor
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ListSubscriptions = function() {
                        return cc(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), cs(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2ListSubscriptionsRaw(e, t)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2PreparePurchaseV2Raw = function(e, t) {
                        return cc(this, void 0, void 0, function() {
                            var r, n;
                            return cs(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new cr("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2PreparePurchaseV2.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new cr("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2PreparePurchaseV2.");
                                        return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxUniverseId && null !== e.robloxUniverseId && (n["Roblox-Universe-Id"] = String(e.robloxUniverseId)), [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/prepare-purchase".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                            schemaPath: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/prepare-purchase",
                                            method: "POST",
                                            headers: n,
                                            query: r,
                                            body: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    paymentProvider: e.paymentProvider,
                                                    universeId: e.universeId,
                                                    paymentProviderPurchaseOptions: function(e) {
                                                        if (void 0 !== e) return null === e ? null : {
                                                            stripePurchaseOptions: function(e) {
                                                                if (void 0 !== e) return null === e ? null : {
                                                                    cancelUrlPathName: e.cancelUrlPathName,
                                                                    successUrlPathName: e.successUrlPathName
                                                                }
                                                            }(e.stripePurchaseOptions),
                                                            appleAppStorePurchaseOptions: function(e) {
                                                                if (void 0 !== e) return null === e ? null : {
                                                                    providerCountryCode: e.providerCountryCode
                                                                }
                                                            }(e.appleAppStorePurchaseOptions),
                                                            braintreePurchaseOptions: function(e) {
                                                                if (void 0 !== e) return null === e ? null : {
                                                                    paymentMethod: e.paymentMethod
                                                                }
                                                            }(e.braintreePurchaseOptions)
                                                        }
                                                    }(e.paymentProviderPurchaseOptions),
                                                    paymentSessionId: e.paymentSessionId,
                                                    referrerId: e.referrerId
                                                }
                                            }(e.preparePurchaseV2Request)
                                        }, t)];
                                    case 1:
                                        return [2, new ci(i.sent(), function(e) {
                                            var t, r, n, i, o, a;
                                            return null == e ? e : {
                                                paymentProvider: cf(e.paymentProvider),
                                                providerPurchasePayload: null == (t = e.providerPurchasePayload) ? t : {
                                                    stripePurchasePayload: cn(t, "stripePurchasePayload") ? null == (r = t.stripePurchasePayload) ? r : {
                                                        checkoutUrl: r.checkoutUrl
                                                    } : void 0,
                                                    appleAppStorePurchasePayload: cn(t, "appleAppStorePurchasePayload") ? null == (n = t.appleAppStorePurchasePayload) ? n : {
                                                        appAccountToken: n.appAccountToken,
                                                        partnerBillingJwtToken: n.partnerBillingJwtToken,
                                                        partnerBillingGenericProductId: n.partnerBillingGenericProductId
                                                    } : void 0,
                                                    googlePlayStorePurchasePayload: cn(t, "googlePlayStorePurchasePayload") ? null == (i = t.googlePlayStorePurchasePayload) ? i : {
                                                        providerProductId: i.providerProductId,
                                                        providerProductType: i.providerProductType,
                                                        chargeRequestId: i.chargeRequestId,
                                                        offerId: cn(i, "offerId") ? i.offerId : void 0
                                                    } : void 0,
                                                    creditBalancePurchasePayload: cn(t, "creditBalancePurchasePayload") ? null == (o = t.creditBalancePurchasePayload) ? o : {
                                                        checkoutUrl: o.checkoutUrl,
                                                        checkoutToken: cn(o, "checkoutToken") ? o.checkoutToken : void 0,
                                                        robloxManagedTax: cn(o, "robloxManagedTax") ? o.robloxManagedTax : void 0,
                                                        requiresBillingAddress: cn(o, "requiresBillingAddress") ? o.requiresBillingAddress : void 0,
                                                        chargeRequestId: cn(o, "chargeRequestId") ? o.chargeRequestId : void 0,
                                                        baseAmount: cn(o, "baseAmount") ? o.baseAmount : void 0,
                                                        taxAmount: cn(o, "taxAmount") ? o.taxAmount : void 0,
                                                        totalAmount: cn(o, "totalAmount") ? o.totalAmount : void 0,
                                                        currencyCode: cn(o, "currencyCode") ? o.currencyCode : void 0
                                                    } : void 0,
                                                    braintreePurchasePayload: cn(t, "braintreePurchasePayload") ? null == (a = t.braintreePurchasePayload) ? a : {
                                                        productToken: a.productToken,
                                                        price: a.price,
                                                        currencyCode: a.currencyCode,
                                                        clientAuthorizationToken: a.clientAuthorizationToken
                                                    } : void 0
                                                },
                                                nativeProviderPurchasePayloadString: e.nativeProviderPurchasePayloadString
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2PreparePurchaseV2 = function(e, t) {
                        return cc(this, void 0, void 0, function() {
                            return cs(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.subscriptionsV2PreparePurchaseV2Raw(e, t)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, t
                }(l9),
                cw = j.EnvironmentUrls.apiGatewayUrl,
                cP = new cg(new co({
                    robloxSiteDomain: j.EnvironmentUrls.domain,
                    basePath: "".concat(cw, "/subscriptions"),
                    credentials: "include"
                }));

            function cO(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function cS(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, i)
            }

            function cx(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function cj(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            l = !1;
                        try {
                            for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return cO(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return cO(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var cI = "Bad Request",
                cE = "ReactBuyButtonNewUpsellProcessFailedDueToError",
                cA = "ReactBuyButtonNewUpsellProcessFailedDueToNotLoaded",
                cT = "ReactBuyButtonNewUpsellProcessNewUpsellFromReactBuyButton";

            function cR() {
                var e, t, r = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                    n = r.customPurchaseVerificationModal,
                    i = r.customPurchaseConfirmationModal,
                    a = r.customPurchaseVerificationModalService,
                    l = (r.forceUnifiedModal, B().userRobuxBalance),
                    d = cj((0, p.createSystemFeedback)(), 2),
                    b = d[0],
                    v = d[1],
                    g = cj((0, p.createSystemFeedback)(), 2),
                    P = g[0],
                    x = g[1],
                    j = cj($(), 2),
                    E = j[0],
                    A = j[1],
                    T = cj((e = null, t = {
                        open: function() {
                            e && e(!0)
                        },
                        close: function() {
                            e && e(!1)
                        }
                    }, [(0, c.withTranslations)(function(r) {
                        var n, i, a, l = r.translate,
                            c = r.title,
                            s = r.expectedPrice,
                            d = r.displayPrice,
                            f = void 0 === d ? "" : d,
                            p = r.thumbnail,
                            m = r.assetName,
                            b = r.assetType,
                            y = r.assetTypeDisplayName,
                            v = void 0 === y ? "" : y,
                            g = r.sellerName,
                            w = r.isPlace,
                            P = void 0 !== w && w,
                            O = r.onAction,
                            x = r.onSecondaryAction,
                            j = r.primaryActionButtonText,
                            E = r.secondaryActionButtonText,
                            A = r.footerDisclaimerText,
                            T = r.priceSuffix,
                            R = r.loading,
                            N = r.currentRobuxBalance,
                            C = r.rentalOptionDays,
                            D = r.subscriptionProductInfo,
                            M = void 0 === D ? null : D,
                            k = r.discountInformation,
                            F = void 0 === k ? null : k,
                            _ = r.collectibleItemId,
                            U = void 0 === _ ? null : _,
                            B = r.isLimited,
                            q = function(e) {
                                if (Array.isArray(e)) return e
                            }(n = u().useState(!1)) || function(e) {
                                var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                if (null != n) {
                                    var i = [],
                                        o = !0,
                                        a = !1;
                                    try {
                                        for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 2 !== i.length); o = !0);
                                    } catch (e) {
                                        a = !0, r = e
                                    } finally {
                                        try {
                                            o || null == n.return || n.return()
                                        } finally {
                                            if (a) throw r
                                        }
                                    }
                                    return i
                                }
                            }(n) || function(e) {
                                if (e) {
                                    if ("string" == typeof e) return aK(e, 2);
                                    var t = Object.prototype.toString.call(e).slice(8, -1);
                                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return aK(e, 2)
                                }
                            }(n) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }(),
                            V = q[0],
                            z = q[1];
                        u().useEffect(function() {
                            return e = z,
                                function() {
                                    e === z && (e = null)
                                }
                        }, []);
                        var G = {
                            assetName: (0, S.renderToString)((0, o.jsx)(K, {
                                name: m
                            })),
                            assetType: v || b,
                            seller: (0, W.escapeHtml)(g),
                            robux: (0, S.renderToString)((0, o.jsx)(L, {
                                translate: l,
                                price: s,
                                color: "",
                                useFreeText: !1
                            }))
                        };
                        P ? h.promptBuyAccessMessage : h.promptBuyMessage, P || "" !== G.seller || h.promptBuySimplifiedMessage;
                        var H = !!("Subscription" === b && f);
                        H ? (i = l(h.buyItemHeading), a = l(h.buyAction)) : 0 === s ? (i = l(h.getItemHeading), a = l(h.getNowAction)) : (i = l(h.buyItemHeading), a = l(h.buyAction)), P && (i = l(h.buyExperience));
                        var X = (void 0 === A ? "" : A) || void 0;
                        if ("Subscription" === b) {
                            var $ = document.documentElement.lang || "en-us",
                                Y = I.urlService.getUrlWithLocale("/info/terms", $),
                                J = "{{LINK_START}}",
                                Q = "{{LINK_END}}",
                                Z = l("Description.SubscribeTermsAgreement", {
                                    linkStart: J,
                                    linkEnd: Q
                                }).split(new RegExp("".concat(J, "|").concat(Q)));
                            X = (0, o.jsxs)(u().Fragment, {
                                children: [Z[0], (0, o.jsx)("a", {
                                    style: {
                                        color: "inherit",
                                        textDecoration: "underline"
                                    },
                                    target: "_blank",
                                    rel: "noreferrer",
                                    href: Y,
                                    children: Z[1]
                                }), Z[2]]
                            })
                        }
                        return (0, o.jsx)(aW, {
                            translate: l,
                            titleText: (void 0 === c ? "" : c) || i,
                            actionButtonText: (void 0 === j ? "" : j) || a,
                            expectedPrice: s,
                            displayPrice: H ? f : void 0,
                            thumbnail: p,
                            assetName: m,
                            assetType: b,
                            assetTypeDisplayName: v,
                            sellerName: g,
                            isPlace: P,
                            onAction: O,
                            onSecondaryAction: x,
                            secondaryActionButtonText: x ? void 0 === E ? "" : E : void 0,
                            footerDisclaimerText: X,
                            priceSuffix: T,
                            loading: void 0 !== R && R,
                            currentRobuxBalance: N,
                            rentalOptionDays: void 0 === C ? null : C,
                            open: V,
                            onCancel: t.close,
                            subscriptionProductInfo: null != M ? M : void 0,
                            discountInformation: null != F ? F : void 0,
                            collectibleItemId: null != U ? U : void 0,
                            isLimited: void 0 !== B && B
                        })
                    }, m), t]), 2),
                    R = T[0],
                    N = T[1],
                    C = cj(U(), 2),
                    D = C[0],
                    M = C[1],
                    k = cj(ng({
                        customPurchaseConfirmationModal: i
                    }), 2),
                    F = k[0],
                    _ = k[1],
                    q = cj(H(), 2),
                    V = q[0],
                    z = q[1],
                    G = cj(O(), 2),
                    X = G[0],
                    Y = G[1],
                    J = {
                        errorObject: {},
                        itemDetail: {},
                        startOriginalFlowCallback: function() {
                            return null
                        }
                    },
                    Q = function() {
                        J.itemDetail.buyButtonElementDataset && (nP().startRobuxUpsellFlow(J.itemDetail.buyButtonElementDataset.assetType, !!J.itemDetail.buyButtonElementDataset.userassetId, J.itemDetail.buyButtonElementDataset.isPrivateServer, J.itemDetail.buyButtonElementDataset.isPlace, J.itemDetail.buyButtonElementDataset.productId), M.open())
                    },
                    Z = function() {
                        if (nO.ItemPurchaseUpsellService && (null == J || null == (e = J.itemDetail) ? void 0 : e.expectedItemPrice)) {
                            if (l - (null == J || null == (t = J.itemDetail) ? void 0 : t.expectedItemPrice) >= 0) return void Q();
                            try {
                                var e, t, r, n = (null == (r = J.itemDetail.buyButtonElementDataset) ? void 0 : r.assetType) === "Subscription" ? {
                                    userBalanceRobux: String(Number.isFinite(l) ? l : 0),
                                    imageurl: "",
                                    alerturl: ""
                                } : void 0;
                                nO.ItemPurchaseUpsellService.startItemUpsellProcess(J.errorObject, J.itemDetail, J.startOriginalFlowCallback, n, J.shouldShowUnifiedPurchaseModal).catch(function() {}), window.EventTracker.fireEvent(cT)
                            } catch (e) {
                                window.EventTracker.fireEvent(cE), Q()
                            }
                        } else window.EventTracker.fireEvent(cA), Q()
                    },
                    ee = function(e, t, r) {
                        var n = Math.ceil(r / 60);
                        if (n > 24) {
                            var i, o, a = Math.ceil(n / 24);
                            return e("Text.EconomicRestrictionsDaysGeneral", {
                                violation: e(null != (o = w[t]) ? o : "Label.Sublabel.FraudPaymentAbuse"),
                                day: a
                            })
                        }
                        return e("Text.EconomicRestrictionsHoursGeneral", {
                            violation: e(null != (i = w[t]) ? i : "Label.Sublabel.FraudPaymentAbuse"),
                            hour: n
                        })
                    };

                function et(e) {
                    var t, r, i, c = e.translate,
                        d = e.assetName,
                        f = e.assetType,
                        p = e.assetTypeDisplayName,
                        m = e.productId,
                        g = e.expectedCurrency,
                        w = e.expectedPrice,
                        O = e.expectedSellerId,
                        S = e.expectedPromoId,
                        j = e.userAssetId,
                        I = e.thumbnail,
                        T = e.sellerName,
                        C = e.sellerType,
                        k = e.showSuccessBanner,
                        L = e.isPlace,
                        U = e.isPrivateServer,
                        q = e.handlePurchase,
                        G = e.onPurchaseSuccess,
                        H = e.collectibleItemId,
                        W = e.collectibleItemInstanceId,
                        K = e.collectibleProductId,
                        $ = e.isLimited,
                        et = e.customProps,
                        er = e.rentalOptionDays,
                        en = void 0 === er ? null : er,
                        ei = e.saleLocationId,
                        eo = void 0 === ei ? null : ei,
                        ea = e.discountInformation,
                        el = void 0 === ea ? null : ea,
                        ec = e.subscriptionTargetKey,
                        es = void 0 === ec ? null : ec,
                        eu = e.subscriptionPaymentProvider,
                        ed = void 0 === eu ? "" : eu,
                        ef = e.subscriptionSecondaryPaymentProvider,
                        ep = void 0 === ef ? "" : ef,
                        em = e.subscriptionTitle,
                        eb = e.primaryActionButtonText,
                        ey = e.secondaryActionButtonText,
                        eh = e.subscriptionFooterDisclaimer,
                        ev = e.subscriptionCancelPath,
                        eg = void 0 === ev ? "" : ev,
                        ew = e.displayPrice,
                        eP = void 0 === ew ? "" : ew,
                        eO = e.priceSuffix,
                        eS = void 0 === eO ? "" : eO,
                        ex = e.deepLinkId,
                        ej = void 0 === ex ? null : ex,
                        eI = cj((0, s.useState)(!1), 2),
                        eE = eI[0],
                        eA = eI[1],
                        eT = cj((0, s.useState)(null), 2),
                        eR = eT[0],
                        eN = eT[1],
                        eC = cj((0, s.useState)(null), 2),
                        eD = eC[0],
                        eM = eC[1],
                        ek = cj((0, s.useState)(w - l), 2),
                        eF = ek[0],
                        eL = ek[1],
                        e_ = cj((0, s.useState)(null), 2),
                        eU = e_[0],
                        eB = e_[1],
                        eq = cj((0, s.useState)(l), 2),
                        eV = eq[0],
                        ez = eq[1],
                        eG = cj((0, s.useState)(function() {
                            return nL()
                        }), 1)[0],
                        eH = cj((0, s.useState)(!1), 2),
                        eW = eH[0],
                        eK = eH[1],
                        eX = function() {
                            return eK(!0)
                        },
                        e$ = cj((0, s.useState)(!1), 2),
                        eY = e$[0],
                        eJ = e$[1],
                        eQ = cj((0, s.useState)(!1), 2),
                        eZ = eQ[0],
                        e0 = eQ[1],
                        e1 = (0, n_.useQuery)({
                            queryKey: ["list-available-subscription-products", (0, nM.userId)()],
                            queryFn: function() {
                                return cP.subscriptionsV2ListAvailableSubscriptionProducts({
                                    productType: "Blackbird",
                                    includePurchased: !1
                                })
                            },
                            select: function(e) {
                                var t;
                                return null != (t = e.products[0]) ? t : null
                            },
                            enabled: eZ,
                            retry: 1,
                            retryDelay: 100
                        }).data,
                        e2 = function() {
                            n2((0, nM.userId)()).then(function(e) {
                                ez(e.data.robux), eL(w - e.data.robux)
                            }).catch(function() {
                                ez(void 0)
                            })
                        };
                    (0, s.useEffect)(function() {
                        var e = B().userRobuxBalance;
                        (0, nM.isAuthenticated)() && !Number.isFinite(e) ? e2() : (ez(e), eL(w - e))
                    }, [m, w, O]), (0, s.useEffect)(function() {
                        eW && eJ(!0)
                    }, [eW]), (0, s.useEffect)(function() {
                        (0, nM.isAuthenticated)() && e0(!0)
                    }, []);
                    var e3 = function() {
                            a ? a.close() : eZ ? N.close() : A.close(), z.close()
                        },
                        e4 = function(e, t) {
                            var r = {
                                assetType: f,
                                assetTypeDisplayName: p,
                                expectedCurrency: g,
                                expectedPrice: t,
                                expectedSellerId: O,
                                itemName: d,
                                itemType: f,
                                productId: m,
                                userassetId: j,
                                placeproductpromotionId: S,
                                isPrivateServer: U,
                                isPlace: L,
                                collectibleItemId: H,
                                collectibleItemInstanceId: W,
                                collectibleProductId: K,
                                subscriptionTargetKey: es,
                                rentalOptionDays: en
                            };
                            J = {
                                errorObject: {
                                    shortfallPrice: e,
                                    currentCurrency: g,
                                    isPlace: L
                                },
                                itemDetail: {
                                    expectedItemPrice: t,
                                    assetName: d,
                                    isLimited: $,
                                    buyButtonElementDataset: r,
                                    thumbnail: I,
                                    priceSuffix: eS,
                                    discountInformation: el
                                },
                                startOriginalFlowCallback: function() {
                                    nO.ItemPurchaseUpsellService && nO.ItemPurchaseUpsellService.showExceedLargestInsufficientRobuxModal ? nO.ItemPurchaseUpsellService.showExceedLargestInsufficientRobuxModal(e, r, Q, void 0, eZ) : Q()
                                },
                                shouldShowUnifiedPurchaseModal: eZ
                            }
                        },
                        e6 = function(e) {
                            var t = e.showDivId,
                                r = e.title,
                                n = e.errorMsg,
                                i = e.price,
                                o = e.shortfallPrice,
                                a = e.onDecline;
                            t === y.transactionFailure ? (eN({
                                title: r,
                                message: n,
                                onDecline: a
                            }), Y.open()) : t === y.insufficientFunds ? (eL(o), e4(o, i), Z()) : t === y.priceChanged && (eM(i), z.open())
                        },
                        e8 = function(e) {
                            eB(e), _.open()
                        },
                        e5 = function(e) {
                            eA(!0), nV(m, {
                                expectedPrice: e,
                                saleLocationType: "Website",
                                saleLocationId: eo,
                                idempotencyKey: eG
                            }).then(function(e) {
                                var t = e.data;
                                if (void 0 !== t.FailureReason && void 0 !== t.ExpirationTimeInMinutes) {
                                    eA(!1), e3(), e6({
                                        title: c(h.economicRestrictionsErrorHeading),
                                        errorMsg: ee(c, t.FailureReason, t.ExpirationTimeInMinutes),
                                        showDivId: y.transactionFailure
                                    });
                                    return
                                }
                                if (eA(!1), e3(), t.purchased || "TwoStepVerificationRequired" !== t.reason)
                                    if (t.purchased) {
                                        if (G(), k) return void v.success(c(h.purchaseCompleteHeading));
                                        e8({
                                            assetIsWearable: !1,
                                            transactionVerb: "",
                                            onDecline: function() {
                                                window.location.reload()
                                            }
                                        })
                                    } else e6({
                                        title: c(h.errorOccuredHeading),
                                        errorMsg: c(h.generalPurchaseErrorMessage),
                                        showDivId: y.transactionFailure
                                    });
                                else eX()
                            }).catch(function(e) {
                                console.debug(e), eA(!1), e3();
                                var t, r = null == (t = e.data) ? void 0 : t.errorCode;
                                e && 500 === e.status && r === y.pendingProductsLimitExceeded ? e6({
                                    title: c(h.pendingDeveloperProductLimitReachedHeading),
                                    errorMsg: c(h.pendingDeveloperProductLimitReachedMessage),
                                    showDivId: y.transactionFailure
                                }) : e && (null == e ? void 0 : e.status) !== 400 ? 429 === e.status ? e6({
                                    title: c(h.errorOccuredHeading),
                                    errorMsg: c(h.floodcheckFailureMessage, {
                                        throttleTime: 1
                                    }),
                                    showDivId: y.transactionFailure
                                }) : e6({
                                    title: c(h.errorOccuredHeading),
                                    errorMsg: c(h.generalPurchaseErrorMessage),
                                    showDivId: y.transactionFailure
                                }) : e6({
                                    title: c(h.errorOccuredHeading),
                                    errorMsg: c(h.purchasingUnavailableMessage),
                                    showDivId: y.transactionFailure
                                })
                            })
                        },
                        e7 = function(e) {
                            eA(!0), nz(m, {
                                expectedPrice: e,
                                idempotencyKey: eG
                            }).then(function(e) {
                                var t = e.data;
                                if (void 0 !== t.failureReason && void 0 !== t.expirationTimeInMinutes) {
                                    eA(!1), e3(), e6({
                                        title: c(h.economicRestrictionsErrorHeading),
                                        errorMsg: ee(c, t.failureReason, t.expirationTimeInMinutes),
                                        showDivId: y.transactionFailure
                                    });
                                    return
                                }
                                if (eA(!1), e3(), t.purchased || "TwoStepVerificationRequired" !== t.reason)
                                    if (t.purchased) {
                                        if (G(), k) return void v.success(c(h.purchaseCompleteHeading));
                                        e8({
                                            assetIsWearable: !1,
                                            transactionVerb: t.transactionVerb,
                                            onDecline: function() {
                                                window.location.reload()
                                            }
                                        })
                                    } else e6({
                                        title: c(h.errorOccuredHeading),
                                        errorMsg: c(h.generalPurchaseErrorMessage),
                                        showDivId: y.transactionFailure
                                    });
                                else eX()
                            }).catch(function(e) {
                                console.debug(e), eA(!1), e3(), e && (null == e ? void 0 : e.status) !== 400 ? 429 === e.status ? e6({
                                    title: c(h.errorOccuredHeading),
                                    errorMsg: c(h.floodcheckFailureMessage, {
                                        throttleTime: 1
                                    }),
                                    showDivId: y.transactionFailure
                                }) : e6({
                                    title: c(h.errorOccuredHeading),
                                    errorMsg: c(h.generalPurchaseErrorMessage),
                                    showDivId: y.transactionFailure
                                }) : e6({
                                    title: c(h.errorOccuredHeading),
                                    errorMsg: c(h.purchasingUnavailableMessage),
                                    showDivId: y.transactionFailure
                                })
                            })
                        },
                        e9 = function(e) {
                            var t = {
                                expectedCurrency: g,
                                expectedPrice: e,
                                expectedSellerId: O
                            };
                            (S > 0 && (t.expectedPromoId = S), j > 0 && (t.userAssetId = j), q) ? q({
                                params: t,
                                handleError: e6,
                                setLoading: eA,
                                openConfirmation: e8,
                                closeAll: e3
                            }): (eA(!0), nG(m, t).then(function(e) {
                                var t = e.data;
                                if (void 0 !== t.FailureReason && void 0 !== t.ExpirationTimeInMinutes) {
                                    eA(!1), e3(), e6({
                                        title: c(h.economicRestrictionsErrorHeading),
                                        errorMsg: ee(c, t.FailureReason, t.ExpirationTimeInMinutes),
                                        showDivId: y.transactionFailure
                                    });
                                    return
                                }
                                console.debug(t);
                                var r = t.statusCode,
                                    n = t.assetIsWearable,
                                    i = t.transactionVerb;
                                if (eA(!1), e3(), t.purchased || "TwoStepVerificationRequired" !== t.reason)
                                    if (500 === r) e6(t);
                                    else {
                                        if (G(), k) return void v.success(c(h.purchaseCompleteHeading));
                                        e8({
                                            assetIsWearable: n,
                                            transactionVerb: i,
                                            onDecline: function() {
                                                window.location.reload()
                                            }
                                        })
                                    }
                                else eX()
                            }).catch(function(e) {
                                if (console.debug(e), eA(!1), e3(), e && (null == e ? void 0 : e.statusText) !== cI) {
                                    429 === e.status && e6({
                                        title: c(h.errorOccuredHeading),
                                        errorMsg: c(h.floodcheckFailureMessage, {
                                            throttleTime: 1
                                        }),
                                        showDivId: y.transactionFailure
                                    });
                                    try {
                                        e6(JSON.parse(null == e ? void 0 : e.statusText))
                                    } catch (t) {
                                        e6({
                                            errorMsg: null == e ? void 0 : e.statusText
                                        })
                                    }
                                } else e6({
                                    title: c(h.errorOccuredHeading),
                                    errorMsg: c(h.purchasingUnavailableMessage),
                                    showDivId: y.transactionFailure
                                })
                            }))
                        },
                        te = function(e, t) {
                            var r;
                            return (r = function() {
                                var r, n, i, o, a, l, s;
                                return function(e, t) {
                                    var r, n, i, o = {
                                            label: 0,
                                            sent: function() {
                                                if (1 & i[0]) throw i[1];
                                                return i[1]
                                            },
                                            trys: [],
                                            ops: []
                                        },
                                        a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                        l = Object.defineProperty;
                                    return l(a, "next", {
                                        value: c(0)
                                    }), l(a, "throw", {
                                        value: c(1)
                                    }), l(a, "return", {
                                        value: c(2)
                                    }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                                        value: function() {
                                            return this
                                        }
                                    }), a;

                                    function c(l) {
                                        return function(c) {
                                            var s = [l, c];
                                            if (r) throw TypeError("Generator is already executing.");
                                            for (; a && (a = 0, s[0] && (o = 0)), o;) try {
                                                if (r = 1, n && (i = 2 & s[0] ? n.return : s[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, s[1])).done) return i;
                                                switch (n = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                                    case 0:
                                                    case 1:
                                                        i = s;
                                                        break;
                                                    case 4:
                                                        return o.label++, {
                                                            value: s[1],
                                                            done: !1
                                                        };
                                                    case 5:
                                                        o.label++, n = s[1], s = [0];
                                                        continue;
                                                    case 7:
                                                        s = o.ops.pop(), o.trys.pop();
                                                        continue;
                                                    default:
                                                        if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                            o = 0;
                                                            continue
                                                        }
                                                        if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                                            o.label = s[1];
                                                            break
                                                        }
                                                        if (6 === s[0] && o.label < i[1]) {
                                                            o.label = i[1], i = s;
                                                            break
                                                        }
                                                        if (i && o.label < i[2]) {
                                                            o.label = i[2], o.ops.push(s);
                                                            break
                                                        }
                                                        i[2] && o.ops.pop(), o.trys.pop();
                                                        continue
                                                }
                                                s = t.call(e, o)
                                            } catch (e) {
                                                s = [6, e], n = 0
                                            } finally {
                                                r = i = 0
                                            }
                                            if (5 & s[0]) throw s[1];
                                            return {
                                                value: s[0] ? s[1] : void 0,
                                                done: !0
                                            }
                                        }
                                    }
                                }(this, function(u) {
                                    switch (u.label) {
                                        case 0:
                                            if (r = {
                                                    collectibleItemId: H,
                                                    expectedCurrency: g,
                                                    expectedPrice: e,
                                                    expectedPurchaserId: (0, nM.userId)(),
                                                    expectedPurchaserType: "User",
                                                    rentalOptionDays: en,
                                                    expectedSellerId: O,
                                                    expectedSellerType: C,
                                                    idempotencyKey: eG
                                                }, W && (r.collectibleItemInstanceId = W), K && (r.collectibleProductId = K), (null == t ? void 0 : t.length) && (r.offerIds = t), ej && (r.deepLinkId = ej), q) return q({
                                                params: r,
                                                handleError: e6,
                                                setLoading: eA,
                                                openConfirmation: e8,
                                                closeAll: e3
                                            }), [2];
                                            eA(!0), n = W ? nq : nB, u.label = 1;
                                        case 1:
                                            return u.trys.push([1, 3, , 4]), [4, n(H, r)];
                                        case 2:
                                            if (void 0 !== (o = u.sent().data).failureReason && void 0 !== o.expirationTimeInMinutes) return eA(!1), e3(), e6({
                                                title: c(h.economicRestrictionsErrorHeading),
                                                errorMsg: ee(c, o.failureReason, o.expirationTimeInMinutes),
                                                showDivId: y.transactionFailure
                                            }), [2];
                                            if (a = o.transactionVerb, eA(!1), e3(), "number" == typeof(l = null != (i = o.statusCode) ? i : o.status) && l >= 400 || (null == o ? void 0 : o.purchased) === !1)(null == o ? void 0 : o.purchased) === !1 && (null == o ? void 0 : o.reason) === "TwoStepVerificationRequired" ? eX() : (null == o ? void 0 : o.purchased) === !1 && (null == o ? void 0 : o.purchaseResult) === "Flooded" ? e6({
                                                title: c(h.errorOccuredHeading),
                                                errorMsg: c(h.floodcheckFailureMessage, {
                                                    throttleTime: 1
                                                }),
                                                showDivId: y.transactionFailure
                                            }) : "InsufficientBalance" === o.errorMessage ? M.open() : e6({
                                                title: c(h.errorOccuredHeading),
                                                errorMsg: c(h.purchasingUnavailableMessage),
                                                showDivId: y.transactionFailure,
                                                onDecline: function() {
                                                    window.location.reload()
                                                }
                                            });
                                            else {
                                                if (G(), k) return v.success(c(h.purchaseCompleteHeading)), [2];
                                                e8({
                                                    assetIsWearable: !0,
                                                    transactionVerb: a,
                                                    itemDelayed: null == o ? void 0 : o.pending,
                                                    expectedPrice: null != e ? e : w,
                                                    onDecline: function() {
                                                        window.location.reload()
                                                    }
                                                })
                                            }
                                            return [3, 4];
                                        case 3:
                                            if (console.debug(s = u.sent()), nD.matchAbandoned(eR)) return eA(!1), [2];
                                            if (eA(!1), e3(), s && (null == s ? void 0 : s.statusText) !== cI) {
                                                429 === s.status && e6({
                                                    title: c(h.errorOccuredHeading),
                                                    errorMsg: c(h.floodcheckFailureMessage, {
                                                        throttleTime: 1
                                                    }),
                                                    showDivId: y.transactionFailure
                                                });
                                                try {
                                                    e6(JSON.parse(null == s ? void 0 : s.statusText))
                                                } catch (e) {
                                                    e6({
                                                        errorMsg: null == s ? void 0 : s.statusText
                                                    })
                                                }
                                            } else e6({
                                                title: c(h.errorOccuredHeading),
                                                errorMsg: c(h.purchasingUnavailableMessage),
                                                showDivId: y.transactionFailure
                                            });
                                            return [3, 4];
                                        case 4:
                                            return [2]
                                    }
                                })
                            }, function() {
                                var e = this,
                                    t = arguments;
                                return new Promise(function(n, i) {
                                    var o = r.apply(e, t);

                                    function a(e) {
                                        cS(o, n, i, a, l, "next", e)
                                    }

                                    function l(e) {
                                        cS(o, n, i, a, l, "throw", e)
                                    }
                                    a(void 0)
                                })
                            })()
                        },
                        tt = function(e, t) {
                            var r = t || ed;
                            if (eA(!0), "Robux" === r) {
                                var n = 0;
                                if (Number.isFinite(eV) ? n = eV : Number.isFinite(l) && (n = l), n < e) {
                                    eA(!1), e3(), e4(e - n, e), Z();
                                    return
                                }
                                nH(es, {
                                    priceInRobux: e,
                                    idempotencyKey: eG
                                }).then(function(e) {
                                    var t = e.data;
                                    eA(!1), e3(), t.isSuccess ? (G(), k ? v.success(c(h.purchaseCompleteHeading)) : e8({
                                        assetIsWearable: !1,
                                        transactionVerb: "",
                                        onDecline: function() {
                                            window.location.reload()
                                        }
                                    })) : e6({
                                        title: c(h.errorOccuredHeading),
                                        errorMsg: t.errorMessage || c(h.generalPurchaseErrorMessage),
                                        showDivId: y.transactionFailure
                                    })
                                }).catch(function(e) {
                                    eA(!1), e3(), (null == e ? void 0 : e.status) === 429 ? e6({
                                        title: c(h.errorOccuredHeading),
                                        errorMsg: c(h.floodcheckFailureMessage, {
                                            throttleTime: 1
                                        }),
                                        showDivId: y.transactionFailure
                                    }) : e6({
                                        title: c(h.errorOccuredHeading),
                                        errorMsg: c(h.generalPurchaseErrorMessage),
                                        showDivId: y.transactionFailure
                                    })
                                });
                                return
                            }
                            nW(es, {
                                stripeCancelUrlPathName: eg,
                                paymentProvider: r
                            }).then(function(e) {
                                var t = e.data;
                                if (t.invalidReason) {
                                    eA(!1), e3();
                                    var n = cj(t.invalidReason.split("/"), 3),
                                        i = n[1],
                                        o = n[2];
                                    e6({
                                        title: c(h.economicRestrictionsErrorHeading),
                                        errorMsg: ee(c, i, parseInt(o, 10)) || c(h.generalPurchaseErrorMessage),
                                        showDivId: y.transactionFailure
                                    });
                                    return
                                }
                                if ("Stripe" === r && t.providerPayload) {
                                    var a = JSON.parse(t.providerPayload);
                                    a.CheckoutUrl && (eA(!1), window.location.href = a.CheckoutUrl)
                                } else "CreditBalance" === r && t.providerPayload ? (eA(!1), window.location.href = "/upgrades/redeem?ap=0&subscriptionTargetKey=".concat(es)) : (eA(!1), e3(), e6({
                                    title: c(h.errorOccuredHeading),
                                    errorMsg: c(h.generalPurchaseErrorMessage),
                                    showDivId: y.transactionFailure
                                }))
                            }).catch(function(e) {
                                eA(!1), e3(), (null == e ? void 0 : e.status) === 429 ? e6({
                                    title: c(h.errorOccuredHeading),
                                    errorMsg: c(h.floodcheckFailureMessage, {
                                        throttleTime: 1
                                    }),
                                    showDivId: y.transactionFailure
                                }) : e6({
                                    title: c(h.errorOccuredHeading),
                                    errorMsg: c(h.generalPurchaseErrorMessage),
                                    showDivId: y.transactionFailure
                                })
                            })
                        },
                        tr = function(e, t) {
                            H ? te(e, t) : "Product" === f ? e5(e) : "Game Pass" === f ? e7(e) : "Subscription" === f ? tt(e) : e9(e)
                        };
                    if (n) i = u().createElement(n, cx({}, cx({
                        assetName: d,
                        assetType: f,
                        expectedPrice: w,
                        thumbnail: I,
                        sellerName: T,
                        loading: eE,
                        onAction: function() {
                            return tr(w)
                        }
                    }, et)));
                    else if (eZ) {
                        var tn = "Subscription" === f && ep ? function() {
                            return tt(w, ep), !1
                        } : void 0;
                        i = (0, o.jsx)(R, {
                            title: (void 0 === em ? "" : em) || void 0,
                            expectedPrice: w,
                            displayPrice: eP,
                            thumbnail: I,
                            assetName: d,
                            assetType: f,
                            assetTypeDisplayName: p,
                            sellerName: T,
                            isPlace: L,
                            loading: eE,
                            currentRobuxBalance: eV,
                            rentalOptionDays: en,
                            onAction: function() {
                                var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                                    t = e.purchasePrice;
                                return tr(null != t ? t : w, e.offerIds), !1
                            },
                            primaryActionButtonText: void 0 === eb ? "" : eb,
                            onSecondaryAction: tn,
                            secondaryActionButtonText: void 0 === ey ? "" : ey,
                            footerDisclaimerText: (void 0 === eh ? "" : eh) || void 0,
                            priceSuffix: eS || void 0,
                            subscriptionProductInfo: function(e, t, r) {
                                if ("Subscription" !== e || !t) return r || void 0
                            }(f, eP, void 0 === e1 ? null : e1),
                            discountInformation: el || void 0,
                            collectibleItemId: H || void 0,
                            isLimited: $ || !1
                        })
                    } else i = (0, o.jsx)(E, {
                        expectedPrice: w,
                        displayPrice: eP,
                        thumbnail: I,
                        assetName: d,
                        assetType: f,
                        assetTypeDisplayName: p,
                        sellerName: T,
                        isPlace: L,
                        loading: eE,
                        collectibleItemId: H,
                        collectibleItemInstanceId: W,
                        currentRobuxBalance: eV,
                        onAction: function() {
                            return tr(w), !1
                        }
                    });
                    return eF > 0 && nO.ItemPurchaseUpsellService && e4(eF, null != eD ? eD : w), (0, o.jsxs)(u().Fragment, {
                        children: [(0, o.jsx)(ir, {
                            isTwoStepVerificationActive: eW,
                            stopTwoStepVerification: function() {
                                return eK(!1)
                            },
                            systemFeedbackService: x
                        }), (0, o.jsx)(D, {
                            robuxNeeded: eF
                        }), (!eF || eF <= 0) && i, eR && (0, o.jsx)(X, {
                            title: eR.title,
                            message: eR.message,
                            onDecline: eR.onDecline
                        }), null != eD && (0, o.jsx)(V, {
                            expectedPrice: w,
                            currentPrice: eD,
                            loading: eE,
                            onAction: function() {
                                return tr(eD), !1
                            }
                        }), eU && (0, o.jsx)(F, (t = cx({
                            thumbnail: I,
                            assetName: d,
                            assetType: f,
                            assetTypeDisplayName: p,
                            sellerName: T,
                            isPlace: L,
                            isPrivateServer: U,
                            expectedPrice: eD || w,
                            currentRobuxBalance: eV
                        }, eU), r = r = {
                            shouldShowUnifiedPurchaseCompletionModal: eZ
                        }, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(r)) : (function(e) {
                            var t = Object.keys(e);
                            if (Object.getOwnPropertySymbols) {
                                var r = Object.getOwnPropertySymbols(e);
                                t.push.apply(t, r)
                            }
                            return t
                        })(Object(r)).forEach(function(e) {
                            Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(r, e))
                        }), t)), k && (0, o.jsx)(b, {}), eY && (0, o.jsx)(P, {})]
                    })
                }
                et.defaultProps = {
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
                    subscriptionProductId: null,
                    deepLinkId: null
                }, et.propTypes = {
                    translate: f().func.isRequired,
                    productId: function(e, t, r) {
                        var n = e.collectibleItemId,
                            i = e.productId,
                            o = e.subscriptionTargetKey;
                        return n || o || "number" == typeof i ? null : Error("Invalid prop ".concat(t, " supplied to ").concat(r, ". Validation failed."))
                    },
                    expectedCurrency: f().number.isRequired,
                    expectedPrice: f().number.isRequired,
                    thumbnail: f().node.isRequired,
                    assetName: f().string.isRequired,
                    assetType: f().string.isRequired,
                    assetTypeDisplayName: f().string,
                    expectedSellerId: f().number.isRequired,
                    sellerName: f().string.isRequired,
                    sellerType: f().string,
                    isPlace: f().bool,
                    isPrivateServer: f().bool,
                    expectedPromoId: f().number,
                    userAssetId: f().number,
                    showSuccessBanner: f().bool,
                    handlePurchase: f().func,
                    onPurchaseSuccess: f().func,
                    customProps: f().func,
                    collectibleItemId: f().string,
                    collectibleItemInstanceId: f().string,
                    collectibleProductId: f().string,
                    isLimited: f().bool,
                    saleLocationId: f().number,
                    rentalOptionDays: f().number,
                    discountInformation: f().shape({
                        originalPrice: f().number,
                        totalDiscountAmount: f().number,
                        totalDiscountPercentage: f().number,
                        discounts: f().arrayOf(f().shape({
                            discountAmount: f().number,
                            discountPercentage: f().number,
                            discountCampaign: f().string,
                            localizedDiscountAttribution: f().string
                        }))
                    }),
                    subscriptionTargetKey: f().string,
                    subscriptionPaymentProvider: f().string,
                    subscriptionSecondaryPaymentProvider: f().string,
                    subscriptionTitle: f().string,
                    primaryActionButtonText: f().string,
                    secondaryActionButtonText: f().string,
                    subscriptionFooterDisclaimer: f().string,
                    subscriptionCancelPath: f().string,
                    displayPrice: f().string,
                    priceSuffix: f().string,
                    subscriptionProductType: f().string,
                    subscriptionProductId: f().string,
                    deepLinkId: f().string
                };
                var er = (0, c.withTranslations)(et, m);
                return [function(e) {
                    return (0, o.jsx)(n_.QueryClientProvider, {
                        client: c.queryClient,
                        children: (0, o.jsx)(er, cx({}, e))
                    })
                }, {
                    start: function() {
                        a ? a.open() : N.open(), Z()
                    }
                }]
            }

            function cN(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function cC(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }
            var cD = function(e, t) {
                    var r, n, i, o = (r = cC({}, e), n = n = {
                        expectedSellerId: t.expectedSellerId,
                        owned: t.owned,
                        id: t.id,
                        itemType: t.itemType,
                        assetType: t.assetType,
                        name: t.name,
                        description: t.description,
                        productId: t.productId,
                        price: t.price,
                        lowestPrice: t.lowestPrice,
                        creatorTargetId: t.creatorTargetId,
                        creatorName: t.creatorName,
                        hasLimitedPrivateSales: void 0 !== t.lowestPrice,
                        isPublicDomain: 0 === t.price,
                        offSaleDeadline: t.offSaleDeadline,
                        isLimited: t.itemRestrictions.includes("Limited") || t.itemRestrictions.includes("LimitedUnique"),
                        collectibleItemId: t.collectibleItemId,
                        collectibleItemDetails: t.collectibleItemDetails,
                        unitsAvailableForConsumption: void 0 !== t.unitsAvailableForConsumption ? t.unitsAvailableForConsumption : 0,
                        priceStatus: null != (i = t.priceStatus) ? i : t.priceStatus,
                        itemRestrictions: t.itemRestrictions
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(n)).forEach(function(e) {
                        Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                    }), r);
                    return void 0 !== t.premiumPricing && (o.premiumPriceInRobux = t.premiumPricing.premiumPriceInRobux, o.premiumDiscountPercentage = t.premiumPricing.premiumDiscountPercentage), o.isLimited && (o.price = void 0 !== o.lowestPrice ? o.lowestPrice : o.price), void 0 !== o.collectibleItemId && (o.resellerAvailable = t.hasResellers, o.isPurchasable = void 0 !== t.lowestPrice, o.isMarketPlaceEnabled = "ShopAndAllExperiences" === t.saleLocationType || "ShopOnly" === t.saleLocationType), o
                },
                cM = function(e, t) {
                    var r = cC({}, e);
                    if (r.resellerAvailable = t.data.data.length > 0, r.resellerAvailable) {
                        var n, i = (function(e) {
                            if (Array.isArray(e)) return e
                        }(n = t.data.data) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    o = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 1 !== i.length); o = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        o || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return i
                            }
                        }(n) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return cN(e, 1);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return cN(e, 1)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0];
                        r.price = i.price, r.firstReseller = i
                    }
                    return r
                },
                ck = function(e, t, r) {
                    var n = cC({}, e);
                    return !t.purchasable && t.reason && t.reason !== g.insufficientFunds && t.reason !== g.twoStepVerificationRequired ? n.isPurchasable = t.purchasable : (!t.purchasable && t.reason && t.reason === g.twoStepVerificationRequired && (n.twoStepVerificationRequired = !0), n.isPurchasable = !0), n.assetTypeDisplayName = t.assetTypeDisplayName, n.loading = !1, n.loadFailure = !1, n.isMarketPlaceEnabled = r.data.isMarketPlaceEnabled && r.data.isItemsXchangeEnabled, n
                },
                cF = function(e) {
                    var t = cC({}, e);
                    return t.isPurchasable = !1, t
                };

            function cL(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, i)
            }
            var c_ = function(e, t) {
                    var r;
                    return (r = function() {
                        var r, n;
                        return function(e, t) {
                            var r, n, i, o = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & i[0]) throw i[1];
                                        return i[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                l = Object.defineProperty;
                            return l(a, "next", {
                                value: c(0)
                            }), l(a, "throw", {
                                value: c(1)
                            }), l(a, "return", {
                                value: c(2)
                            }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                                value: function() {
                                    return this
                                }
                            }), a;

                            function c(l) {
                                return function(c) {
                                    var s = [l, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, s[0] && (o = 0)), o;) try {
                                        if (r = 1, n && (i = 2 & s[0] ? n.return : s[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, s[1])).done) return i;
                                        switch (n = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                            case 0:
                                            case 1:
                                                i = s;
                                                break;
                                            case 4:
                                                return o.label++, {
                                                    value: s[1],
                                                    done: !1
                                                };
                                            case 5:
                                                o.label++, n = s[1], s = [0];
                                                continue;
                                            case 7:
                                                s = o.ops.pop(), o.trys.pop();
                                                continue;
                                            default:
                                                if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                    o = 0;
                                                    continue
                                                }
                                                if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                                    o.label = s[1];
                                                    break
                                                }
                                                if (6 === s[0] && o.label < i[1]) {
                                                    o.label = i[1], i = s;
                                                    break
                                                }
                                                if (i && o.label < i[2]) {
                                                    o.label = i[2], o.ops.push(s);
                                                    break
                                                }
                                                i[2] && o.ops.pop(), o.trys.pop();
                                                continue
                                        }
                                        s = t.call(e, o)
                                    } catch (e) {
                                        s = [6, e], n = 0
                                    } finally {
                                        r = i = 0
                                    }
                                    if (5 & s[0]) throw s[1];
                                    return {
                                        value: s[0] ? s[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(i) {
                            switch (i.label) {
                                case 0:
                                    if (0 === (r = e.filter(function(e) {
                                            return e.collectibleItemId && void 0 === e.collectibleItemDetails
                                        }).map(function(e) {
                                            return e.collectibleItemId
                                        })).length) return [2, e];
                                    return [4, t(r)];
                                case 1:
                                    return n = i.sent(), e.forEach(function(e) {
                                        e.collectibleItemId && void 0 === e.collectibleItemDetails && (e.collectibleItemDetails = n.find(function(t) {
                                            return t.collectibleItemId === e.collectibleItemId
                                        }))
                                    }), [2, e]
                            }
                        })
                    }, function() {
                        var e = this,
                            t = arguments;
                        return new Promise(function(n, i) {
                            var o = r.apply(e, t);

                            function a(e) {
                                cL(o, n, i, a, l, "next", e)
                            }

                            function l(e) {
                                cL(o, n, i, a, l, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                },
                cU = ((t = cU || {}).Asset = "asset", t.Bundle = "bundle", t);

            function cB(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function cq(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, i)
            }

            function cV(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, i) {
                        var o = e.apply(t, r);

                        function a(e) {
                            cq(o, n, i, a, l, "next", e)
                        }

                        function l(e) {
                            cq(o, n, i, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function cz(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            l = !1;
                        try {
                            for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return cB(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return cB(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function cG(e, t) {
                var r, n, i, o = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(a, "next", {
                    value: c(0)
                }), l(a, "throw", {
                    value: c(1)
                }), l(a, "return", {
                    value: c(2)
                }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), a;

                function c(l) {
                    return function(c) {
                        var s = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, s[0] && (o = 0)), o;) try {
                            if (r = 1, n && (i = 2 & s[0] ? n.return : s[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, s[1])).done) return i;
                            switch (n = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                case 0:
                                case 1:
                                    i = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < i[1]) {
                                        o.label = i[1], i = s;
                                        break
                                    }
                                    if (i && o.label < i[2]) {
                                        o.label = i[2], o.ops.push(s);
                                        break
                                    }
                                    i[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], n = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var cH = function(e) {
                var t = cz((0, s.useState)(), 2),
                    r = t[0],
                    n = t[1],
                    i = cz((0, s.useState)([]), 2),
                    o = i[0],
                    a = i[1],
                    l = cz((0, s.useState)({}), 2),
                    c = l[0],
                    u = l[1],
                    d = 0,
                    f = function() {
                        d < 5 ? (b(), d += 1) : a([{
                            loading: !1,
                            loadFailure: !0
                        }])
                    },
                    p = (0, s.useCallback)(function() {
                        (0, nM.isAuthenticated)() ? n1().then(function(e) {
                            n(e)
                        }).catch(function() {
                            f()
                        }): n({
                            data: {
                                isMarketplaceEnabled: !1,
                                isItemsXchangeEnabled: !1
                            }
                        })
                    }, []);

                function m(e) {
                    return cV(function() {
                        var t, n, i;
                        return cG(this, function(o) {
                            switch (o.label) {
                                case 0:
                                    if (e.inCache) return [2, c[e.itemType.toLowerCase()][e.id]];
                                    if (!(t = cD({}, e)).isLimited) return [3, 4];
                                    o.label = 1;
                                case 1:
                                    return o.trys.push([1, 3, , 4]), [4, n0(t.id)];
                                case 2:
                                    return n = o.sent(), t = cM(t, n), [3, 4];
                                case 3:
                                    return o.sent(), t.resellerAvailable = !1, [3, 4];
                                case 4:
                                    if (void 0 === e.productId) return [3, 8];
                                    if (!(0, nM.isAuthenticated)()) return [3, 7];
                                    if (void 0 !== t.collectibleItemId) return [3, 6];
                                    return [4, nZ(e.productId)];
                                case 5:
                                    i = o.sent(), t = ck(t, i.data, r), o.label = 6;
                                case 6:
                                    return [3, 8];
                                case 7:
                                    t = cF(t), o.label = 8;
                                case 8:
                                    return [2, t]
                            }
                        })
                    })()
                }
                var b = (0, s.useCallback)(function() {
                    cV(function() {
                        var t, r, n, i;
                        return cG(this, function(o) {
                            switch (o.label) {
                                case 0:
                                    var a;
                                    if (t = [], e.forEach(function(e) {
                                            void 0 === c[e.itemType.toLowerCase()][e.id] && t.push(e)
                                        }), !(t.length > 0)) return [3, 3];
                                    return n = [], t.map(function(e) {
                                        return n.push({
                                            itemType: e.itemType,
                                            id: e.id
                                        })
                                    }), [4, (a = n, nU.post({
                                        url: "".concat(A, "/v1/catalog/items/details"),
                                        retryable: !0,
                                        withCredentials: !0
                                    }, {
                                        items: a
                                    }))];
                                case 1:
                                    return [4, c_(r = o.sent().data.data, function(e) {
                                        var t;
                                        return t = e, n$(function() {
                                            var e, r, n;
                                            return nY(this, function(i) {
                                                switch (i.label) {
                                                    case 0:
                                                        return r = {
                                                            url: nJ(),
                                                            retryable: !0,
                                                            withCredentials: !0
                                                        }, n = {
                                                            itemIds: t
                                                        }, [4, nU.post(r, n)];
                                                    case 1:
                                                        return [2, null != (e = i.sent().data) ? e : []]
                                                }
                                            })
                                        })()
                                    })];
                                case 2:
                                    o.sent(), o.label = 3;
                                case 3:
                                    return i = [], e.forEach(function(e) {
                                        if (void 0 === c[e.itemType.toLowerCase()][e.id]) {
                                            var t = r.find(function(t) {
                                                return t.id === e.id && t.itemType.toLowerCase() === e.itemType.toLowerCase()
                                            });
                                            t && i.push(t)
                                        } else i.push({
                                            id: e.id,
                                            itemType: e.itemType,
                                            inCache: !0
                                        })
                                    }), [2, i]
                            }
                        })
                    })().then(function(e) {
                        try {
                            cV(function() {
                                var t, r;
                                return cG(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            return n.trys.push([0, 2, , 3]), [4, Promise.all(e.map(function(e) {
                                                return m(e)
                                            }))];
                                        case 1:
                                            return a(t = n.sent()), r = c, t.forEach(function(e) {
                                                e.isLimited || c[e.itemType.toLowerCase()][e.id] || (r[e.itemType.toLowerCase()][e.id] = e)
                                            }), u(r), [3, 3];
                                        case 2:
                                            return n.sent(), f(), [3, 3];
                                        case 3:
                                            return [2]
                                    }
                                })
                            })()
                        } catch (e) {
                            f()
                        }
                    }).catch(function() {
                        f()
                    })
                }, [r, e, m]);
                return (0, s.useEffect)(function() {
                    var e = {};
                    e[cU.Asset] = {}, e[cU.Bundle] = {}, u(e), p()
                }, []), (0, s.useEffect)(function() {
                    void 0 !== r && b()
                }, [r, e]), {
                    itemDetails: o,
                    batchLoadItemDetails: b
                }
            };

            function cW(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function cK(e) {
                if (Array.isArray(e)) return e
            }

            function cX() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function c$(e, t) {
                if (e) {
                    if ("string" == typeof e) return cW(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return cW(e, t)
                }
            }
            var cY = {
                    Small: {
                        dimension: 16,
                        strokeWidth: 2,
                        textClass: "text-caption-small"
                    },
                    Medium: {
                        dimension: 32,
                        strokeWidth: 3,
                        textClass: "text-caption-small",
                        valueContainerSize: 36
                    },
                    Large: {
                        dimension: 48,
                        strokeWidth: 4,
                        textClass: "text-caption-medium",
                        valueContainerSize: 52
                    }
                },
                cJ = u().forwardRef(function(e, t) {
                    var r, n = cK(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || c$(r) || cX(),
                        i = n[0],
                        o = n.slice(1),
                        a = i.className,
                        l = i.size,
                        c = void 0 === l ? "Large" : l,
                        s = i.variant,
                        d = i.value,
                        f = i.showValue,
                        p = void 0 !== f && f,
                        m = i.ariaLabel,
                        b = function(e, t) {
                            if (null == e) return {};
                            var r, n, i, o = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                return o
                            }
                            if (o = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, i = {},
                                        o = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                                    return i
                                }(e, t), Object.getOwnPropertySymbols)
                                for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                            return o
                        }(i, ["className", "size", "variant", "value", "showValue", "ariaLabel"]),
                        y = (cK(o) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    o = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 1 !== i.length); o = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        o || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return i
                            }
                        }(o) || c$(o, 1) || cX())[0],
                        h = cY[c],
                        v = h.dimension,
                        g = h.strokeWidth,
                        w = h.textClass,
                        P = h.valueContainerSize,
                        O = (v - g) / 2,
                        S = 2 * Math.PI * O,
                        x = v / 2,
                        j = Math.min(100, Math.max(0, void 0 === d ? 0 : d)),
                        I = p && void 0 !== P ? P : v,
                        E = "Determinate" === (void 0 === s ? "Determinate" : s);
                    return u().createElement("div", function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var r = null != arguments[t] ? arguments[t] : {},
                                n = Object.keys(r);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(r, e).enumerable
                            }))), n.forEach(function(t) {
                                var n;
                                n = r[t], t in e ? Object.defineProperty(e, t, {
                                    value: n,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = n
                            })
                        }
                        return e
                    }({
                        ref: y,
                        className: Y("foundation-web-progress-circle inline-flex items-center justify-center", a),
                        role: "progressbar",
                        "aria-label": m,
                        "aria-valuemin": E ? 0 : void 0,
                        "aria-valuemax": E ? 100 : void 0,
                        "aria-valuenow": E ? j : void 0,
                        style: {
                            width: I,
                            height: I
                        }
                    }, b), u().createElement("svg", {
                        width: v,
                        height: v,
                        viewBox: "0 0 ".concat(v, " ").concat(v),
                        className: "relative"
                    }, u().createElement("circle", {
                        cx: x,
                        cy: x,
                        r: O,
                        fill: "none",
                        strokeWidth: g,
                        style: {
                            stroke: "var(--color-shift-200)"
                        }
                    }), u().createElement("circle", {
                        cx: x,
                        cy: x,
                        r: O,
                        fill: "none",
                        strokeWidth: g,
                        strokeDasharray: E ? S : "".concat(.75 * S, " ").concat(.25 * S),
                        strokeDashoffset: E ? S * (1 - j / 100) : 0,
                        strokeLinecap: "round",
                        className: Y(!E && "foundation-web-progress-circle-indeterminate"),
                        style: E ? {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transform: "rotate(-90deg)",
                            transformOrigin: "50% 50%",
                            transition: "stroke-dashoffset 0.3s ease-out"
                        } : {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transformOrigin: "50% 50%"
                        }
                    })), E && p && "Large" === c && u().createElement("div", {
                        className: Y("absolute content-emphasis flex items-center justify-center", w),
                        "aria-hidden": "true"
                    }, u().createElement("span", null, Math.round(j)), u().createElement("span", null, "%")))
                });
            cJ.displayName = "ProgressCircle";
            var cQ = window.Roblox["core-scripts"].util.url,
                cZ = window.RobloxThumbnails,
                c0 = ((n = c0 || {}).Success = "Success", n.AlreadyOwned = "ALREADY_OWNED", n.InsufficientFunds = "INSUFFICIENT_ROBUX", n.ExceptionOccured = "INTERNAL", n.TooManyPurchases = "QUOTA_EXCEEDED", n.CaughtError = "CaughtError", n.PremiumNeeded = "INSUFFICIENT_MEMBERSHIP", n.NoSellers = "NOT_FOR_SALE", n.TwoStepVerificationRequired = "TwoStepVerificationRequired", n.InExperienceOnly = "PURCHASE_PLACE_INVALID", n);

            function c1(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function c2(e) {
                if (Array.isArray(e)) return e
            }

            function c3() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function c4(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function c6(e, t) {
                if (e) {
                    if ("string" == typeof e) return c1(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return c1(e, t)
                }
            }
            var c8 = (0, s.forwardRef)(function(e, t) {
                var r, n, i, o = c2(i = [e, t]) || function(e) {
                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(i) || c6(i) || c3(),
                    a = o[0],
                    l = o.slice(1),
                    c = a.className,
                    s = a.style,
                    d = a.orientation,
                    f = void 0 === d ? "horizontal" : d,
                    p = a.variant,
                    m = void 0 === p ? "Standard" : p,
                    b = function(e, t) {
                        if (null == e) return {};
                        var r, n, i, o = {};
                        if ("u" > typeof Reflect && Reflect.ownKeys) {
                            for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                            return o
                        }
                        if (o = function(e, t) {
                                if (null == e) return {};
                                var r, n, i = {},
                                    o = Object.getOwnPropertyNames(e);
                                for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                                return i
                            }(e, t), Object.getOwnPropertySymbols)
                            for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                        return o
                    }(a, ["className", "style", "orientation", "variant"]),
                    y = (c2(l) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var i = [],
                                o = !0,
                                a = !1;
                            try {
                                for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 1 !== i.length); o = !0);
                            } catch (e) {
                                a = !0, r = e
                            } finally {
                                try {
                                    o || null == n.return || n.return()
                                } finally {
                                    if (a) throw r
                                }
                            }
                            return i
                        }
                    }(l) || c6(l, 1) || c3())[0],
                    h = "vertical" === f,
                    v = {};
                return h || "Inset" !== m ? h || "InsetLeft" !== m ? h || "InsetRight" !== m || (v = {
                    marginRight: "var(--padding-xlarge)"
                }) : v = {
                    marginLeft: "var(--padding-xlarge)"
                } : v = {
                    marginLeft: "var(--padding-xlarge)",
                    marginRight: "var(--padding-xlarge)"
                }, u().createElement("div", (r = c4({
                    ref: y
                }, b), n = n = {
                    role: "separator",
                    "data-orientation": f,
                    "aria-orientation": f,
                    style: c4({
                        borderRightWidth: 0,
                        borderBottomWidth: 0,
                        boxSizing: "border-box",
                        borderStyle: "solid"
                    }, h ? {
                        height: "100%",
                        width: 0,
                        borderLeftWidth: "var(--stroke-standard)",
                        borderTopWidth: 0
                    } : "Thick" === m ? {
                        height: "var(--size-250)",
                        borderTop: "var(--stroke-standard)",
                        borderLeftWidth: 0,
                        background: "var(--color-common-heavydivider, rgba(0, 0, 0, 0.50))"
                    } : {
                        height: 0,
                        borderTopWidth: "var(--stroke-standard)",
                        borderLeftWidth: 0
                    }, v, s),
                    className: Y("stroke-default self-stretch", c)
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(n)).forEach(function(e) {
                    Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                }), r))
            });
            c8.displayName = "Divider";
            var c5 = function(e) {
                var t = e.open,
                    r = e.title,
                    n = e.body,
                    i = e.footerText,
                    a = void 0 === i ? null : i,
                    l = e.actionButtonShow,
                    c = e.actionButtonText,
                    s = e.neutralButtonText,
                    u = void 0 === s ? "" : s,
                    d = e.onAction,
                    f = e.onNeutral,
                    p = e.loading,
                    m = e.disableActionButton,
                    b = e.closeLabel,
                    y = void 0 === b ? "Close" : b;
                return (0, o.jsx)(rq, {
                    open: t,
                    onOpenChange: function(e) {
                        e || null == f || f()
                    },
                    isModal: !0,
                    size: "Medium",
                    type: "Default",
                    hasCloseAffordance: !1,
                    hasMarginTop: !1,
                    closeLabel: y,
                    children: (0, o.jsxs)(rV, {
                        className: "relative width-full",
                        children: [(0, o.jsx)(oD, {
                            icon: "icon-regular-x",
                            ariaLabel: y,
                            variant: "OverMedia",
                            size: "Large",
                            isCircular: !0,
                            onClick: f,
                            style: {
                                position: "absolute",
                                top: "var(--size-300)",
                                right: "var(--size-300)",
                                zIndex: 1
                            }
                        }), (0, o.jsx)(rG, {
                            className: "padding-x-xlarge padding-top-xlarge padding-bottom-medium",
                            children: r
                        }), (0, o.jsx)(c8, {}), (0, o.jsx)(rz, {
                            className: "padding-top-medium",
                            children: void 0 === n ? null : n
                        }), (0, o.jsxs)(rH, {
                            className: "gap-small flex flex-col",
                            children: [void 0 !== p && p ? (0, o.jsx)(cJ, {
                                variant: "Indeterminate",
                                ariaLabel: "Loading"
                            }) : (0, o.jsxs)("div", {
                                className: "gap-small flex flex-row justify-center",
                                children: [void 0 !== l && l && (0, o.jsx)(nl, {
                                    variant: "Emphasis",
                                    onClick: d,
                                    isDisabled: void 0 !== m && m,
                                    style: {
                                        minWidth: "7rem"
                                    },
                                    children: void 0 === c ? "" : c
                                }), u && (0, o.jsx)(nl, {
                                    variant: "Standard",
                                    onClick: f,
                                    style: {
                                        minWidth: "7rem"
                                    },
                                    children: u
                                })]
                            }), a && (0, o.jsx)("div", {
                                className: "text-footer",
                                children: a
                            })]
                        })]
                    })
                })
            };

            function c7(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function c9(e, t, r, n, i, o, a) {
                try {
                    var l = e[o](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, i)
            }

            function se(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function st(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            l = !1;
                        try {
                            for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return c7(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return c7(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var sr = "lookId";

            function sn(e) {
                var t = e.itemsCount,
                    r = e.item,
                    n = e.index,
                    i = e.timedOption,
                    a = e.translate,
                    l = r.name;
                return (0, o.jsxs)("div", {
                    className: "modal-multi-item-image-container",
                    children: [i && (0, o.jsx)("div", {
                        className: "timed-options-badge-container",
                        children: (0, o.jsx)(i7, {
                            variant: "Neutral",
                            icon: "icon-regular-clock",
                            className: "bg-surface-0",
                            label: (null == i ? void 0 : i.days) ? a(h.timedOptionDaysAbbreviation, {
                                days: i.days
                            }) : ""
                        })
                    }), (0, o.jsx)(cZ.Thumbnail2d, {
                        type: r.itemType.toLowerCase() === cU.Bundle ? cZ.ThumbnailTypes.bundleThumbnail : cZ.ThumbnailTypes.assetThumbnail,
                        size: cZ.DefaultThumbnailSize,
                        targetId: r.id,
                        containerClass: "batch-buy-thumbnail",
                        format: cZ.ThumbnailFormat.webp,
                        altName: l
                    }), t > 3 && 2 === n && (0, o.jsx)("div", {
                        className: "thumb-overlay",
                        children: (0, o.jsxs)("div", {
                            className: "font-header-1",
                            children: ["＋", t - 3]
                        })
                    })]
                })
            }
            var si = function(e, t) {
                    var r = st(t.split("/"), 4),
                        n = r[2],
                        i = Math.ceil(r[3] / 60);
                    if (i > 24) {
                        var o, a, l = Math.ceil(i / 24);
                        return {
                            success: !1,
                            message: "Text.EconomicRestrictionsDaysGeneral",
                            params: {
                                violation: e(null != (a = w[n]) ? a : "Label.Sublabel.FraudPaymentAbuse"),
                                day: l
                            }
                        }
                    }
                    return {
                        success: !1,
                        message: "Text.EconomicRestrictionsHoursGeneral",
                        params: {
                            violation: e(null != (o = w[n]) ? o : "Label.Sublabel.FraudPaymentAbuse"),
                            hour: i
                        }
                    }
                },
                so = window.Roblox["core-scripts"].guac;

            function sa(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function sl(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            l = !1;
                        try {
                            for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return sa(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return sa(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var sc = sl(U(), 2),
                ss = sc[0],
                su = sc[1],
                sd = function() {
                    function e(e) {
                        var t, r, n = e.translate,
                            i = e.open,
                            a = e.title,
                            l = e.expectedTotalPrice,
                            c = e.items,
                            d = e.itemDetails,
                            f = e.currentRobuxBalance,
                            p = e.purchaseMetadata,
                            m = e.marketplaceOfferPricing,
                            b = e.onCancel,
                            y = e.onTransactionComplete,
                            v = e.onAction,
                            g = e.loading,
                            w = e.productSurface,
                            P = e.systemFeedbackService,
                            O = st((0, s.useState)(!1), 2),
                            x = O[0],
                            j = O[1],
                            I = function() {
                                P.loading(n("Message.TwoStepVerificationBatchPurchase")), j(!0)
                            },
                            E = st((0, s.useState)(!1), 2),
                            A = E[0],
                            T = E[1],
                            R = {
                                itemCount: d.length,
                                robux: (0, S.renderToString)((0, o.jsx)("span", {
                                    className: "robux-price",
                                    children: (0, o.jsx)(L, {
                                        price: l
                                    })
                                }))
                            },
                            N = h.batchBuyPromptMessage;
                        0 === l ? (t = n(h.getItemHeading), r = n(h.getNowAction)) : (t = n(h.buyItemHeading), r = n(h.buyNowAction));
                        var C = null == d ? void 0 : d.slice(0, 3);

                        function D(e) {
                            var t, r = function(e, t, r) {
                                var n = 0,
                                    i = [];
                                if (!t) return {
                                    success: !1,
                                    message: h.purchaseErrorFailureMessage
                                };
                                if (200 === t.status) {
                                    if (t.data && t.data.message && t.data.message.startsWith("Error/EconomicRestrictions")) return si(e, t.data.message);
                                    if (t.data.fulfillmentGroups[0].lineItems.forEach(function(e) {
                                            if ("SUCCEEDED" === e.status) n += 1;
                                            else {
                                                var t = i.find(function(t) {
                                                    return t.error === e.errorReason
                                                });
                                                t ? t.count += 1 : i.push({
                                                    error: e.errorReason,
                                                    count: 1
                                                })
                                            }
                                        }), n === t.data.fulfillmentGroups[0].lineItems.length) return {
                                        success: !0,
                                        message: h.purchaseCompleteHeading
                                    };
                                    var o = {
                                        error: "",
                                        count: 0
                                    };
                                    if (i.forEach(function(e) {
                                            e.count > o.count && (o = e)
                                        }), n > 0) switch (o.error) {
                                        case c0.AlreadyOwned:
                                            return {
                                                success: !1, message: h.batchBuyPartialSuccessItemsOwnedFailureMessage, params: {
                                                    itemCountSuccess: n,
                                                    itemCountFailure: o.count
                                                }
                                            };
                                        case c0.InsufficientFunds:
                                            return {
                                                success: !1, message: h.batchBuyPartialSuccessInsufficientFundsFailureMessage, params: {
                                                    itemCountSuccess: n,
                                                    itemCountFailure: o.count
                                                }
                                            };
                                        case c0.ExceptionOccured:
                                            return {
                                                success: !1, message: h.batchBuyPartialSuccessNetworkErrorFailureMessage, params: {
                                                    itemCountSuccess: n,
                                                    itemCountFailure: o.count
                                                }
                                            };
                                        case c0.TooManyPurchases:
                                            return {
                                                success: !1, message: h.batchBuyPartialSuccessFloodcheckFailureMessage, params: {
                                                    itemCountSuccess: n,
                                                    itemCountFailure: o.count
                                                }
                                            };
                                        case c0.PremiumNeeded:
                                            return {
                                                success: !1, message: h.batchBuyPartialSuccessPremiumNeededFailureMessage, params: {
                                                    itemCountSuccess: n,
                                                    itemCountFailure: o.count
                                                }
                                            };
                                        case c0.NoSellers:
                                            return {
                                                success: !1, message: h.batchBuyPartialSuccessNoSellersFailureMessage, params: {
                                                    itemCountSuccess: n,
                                                    itemCountFailure: o.count
                                                }
                                            };
                                        case c0.InExperienceOnly:
                                            return {
                                                success: !1, message: h.batchBuyPartialSuccessInExperienceOnlyFailureMessage, params: {
                                                    itemCountSuccess: n,
                                                    itemCountFailure: o.count
                                                }
                                            };
                                        default:
                                            return {
                                                success: !1, message: h.batchBuyPartialSuccessGeneralFailureMessage, params: {
                                                    itemCountSuccess: n,
                                                    itemCountFailure: o.count
                                                }
                                            }
                                    }
                                    switch (o.error) {
                                        case c0.AlreadyOwned:
                                            return {
                                                success: !1, message: h.batchBuyItemsOwnedFailureMessage
                                            };
                                        case c0.InsufficientFunds:
                                            return {
                                                success: !1, message: h.insufficientFundsFailureMessage
                                            };
                                        case c0.ExceptionOccured:
                                            return {
                                                success: !1, message: h.networkErrroFailureMessage
                                            };
                                        case c0.TooManyPurchases:
                                            return {
                                                success: !1, message: h.floodcheckFailureMessage, params: {
                                                    throttleTime: 5
                                                }
                                            };
                                        case c0.PremiumNeeded:
                                            return {
                                                success: !1, message: h.premiumNeededFailureMessage
                                            };
                                        case c0.NoSellers:
                                            return {
                                                success: !1, message: h.noSellersFailureMessage
                                            };
                                        case c0.InExperienceOnly:
                                            return {
                                                success: !1, message: h.inExperienceOnlyFailureMessage
                                            }
                                    }
                                } else if (403 === t.status && t.data.message.includes("2sv")) r();
                                else if (400 === t.status && t.data.message.includes("InsufficientTotalBalance")) return {
                                    success: !1,
                                    message: h.insufficientFundsFailureMessage
                                };
                                return {
                                    success: !1,
                                    message: h.purchaseErrorFailureMessage
                                }
                            }(n, e, I);
                            t = r.params ? n(r.message, r.params) : n(r.message), r.success ? P.success(t) : P.warning(t)
                        }
                        var M = (0, o.jsxs)(s.Fragment, {
                            children: [(0, o.jsx)("div", {
                                className: "modal-message multi-item",
                                dangerouslySetInnerHTML: {
                                    __html: n(N, R)
                                }
                            }), void 0 !== d && d.length > 0 && (0, o.jsx)("div", {
                                className: "modal-multi-item-images-container",
                                children: C.map(function(e, t) {
                                    var r = c.find(function(t) {
                                        return t.id === e.id && t.itemType === e.itemType
                                    });
                                    return (0, o.jsx)(sn, {
                                        itemsCount: d.length,
                                        item: e,
                                        index: t,
                                        timedOption: null == r ? void 0 : r.timedOption,
                                        translate: n
                                    }, "".concat(e.itemType, "-").concat(e.id))
                                })
                            })]
                        });
                        return (0, o.jsxs)(u().Fragment, {
                            children: [(0, o.jsx)(ir, {
                                isTwoStepVerificationActive: x,
                                stopTwoStepVerification: function() {
                                    T(!0), j(!1)
                                },
                                systemFeedbackService: P
                            }), (0, o.jsx)(c5, {
                                open: i,
                                title: a || t,
                                body: M,
                                neutralButtonText: n(h.cancelAction),
                                actionButtonText: r,
                                onAction: function() {
                                    var e, t = !1;
                                    (d.forEach(function(e) {
                                        t = t || e.twoStepVerificationRequired
                                    }), t && !A) ? I(): ((e = function() {
                                        var e, t, r, n, i, o, a, l, s, u;
                                        return function(e, t) {
                                            var r, n, i, o = {
                                                    label: 0,
                                                    sent: function() {
                                                        if (1 & i[0]) throw i[1];
                                                        return i[1]
                                                    },
                                                    trys: [],
                                                    ops: []
                                                },
                                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                                l = Object.defineProperty;
                                            return l(a, "next", {
                                                value: c(0)
                                            }), l(a, "throw", {
                                                value: c(1)
                                            }), l(a, "return", {
                                                value: c(2)
                                            }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                                                value: function() {
                                                    return this
                                                }
                                            }), a;

                                            function c(l) {
                                                return function(c) {
                                                    var s = [l, c];
                                                    if (r) throw TypeError("Generator is already executing.");
                                                    for (; a && (a = 0, s[0] && (o = 0)), o;) try {
                                                        if (r = 1, n && (i = 2 & s[0] ? n.return : s[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, s[1])).done) return i;
                                                        switch (n = 0, i && (s = [2 & s[0], i.value]), s[0]) {
                                                            case 0:
                                                            case 1:
                                                                i = s;
                                                                break;
                                                            case 4:
                                                                return o.label++, {
                                                                    value: s[1],
                                                                    done: !1
                                                                };
                                                            case 5:
                                                                o.label++, n = s[1], s = [0];
                                                                continue;
                                                            case 7:
                                                                s = o.ops.pop(), o.trys.pop();
                                                                continue;
                                                            default:
                                                                if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                                    o = 0;
                                                                    continue
                                                                }
                                                                if (3 === s[0] && (!i || s[1] > i[0] && s[1] < i[3])) {
                                                                    o.label = s[1];
                                                                    break
                                                                }
                                                                if (6 === s[0] && o.label < i[1]) {
                                                                    o.label = i[1], i = s;
                                                                    break
                                                                }
                                                                if (i && o.label < i[2]) {
                                                                    o.label = i[2], o.ops.push(s);
                                                                    break
                                                                }
                                                                i[2] && o.ops.pop(), o.trys.pop();
                                                                continue
                                                        }
                                                        s = t.call(e, o)
                                                    } catch (e) {
                                                        s = [6, e], n = 0
                                                    } finally {
                                                        r = i = 0
                                                    }
                                                    if (5 & s[0]) throw s[1];
                                                    return {
                                                        value: s[0] ? s[1] : void 0,
                                                        done: !0
                                                    }
                                                }
                                            }
                                        }(this, function(f) {
                                            switch (f.label) {
                                                case 0:
                                                    e = {
                                                        strategy: "BEST_EFFORT",
                                                        lineItems: []
                                                    }, t = [], r = [], d.forEach(function(e) {
                                                        var n = {};
                                                        if (void 0 !== e.collectibleItemId) {
                                                            var i, o, a, l, s = c.find(function(t) {
                                                                return t.id === e.id && t.itemType === e.itemType
                                                            });
                                                            !("ExperiencesDevApiOnly" !== e.collectibleItemDetails.saleLocationType && e.collectibleItemDetails.unitsAvailableForConsumption > 0 && (!e.collectibleItemDetails.hasResellers || e.collectibleItemDetails.price < e.collectibleItemDetails.lowestResalePrice)) && e.collectibleItemDetails.lowestAvailableResaleProductId ? n.collectibleProductId = e.collectibleItemDetails.lowestAvailableResaleProductId : n.collectibleProductId = e.collectibleItemDetails.collectibleProductId, (null == s ? void 0 : s.timedOption) && (n.rentalOption = {
                                                                durationDays: s.timedOption.days
                                                            });
                                                            var u = (i = n, (o = m[e.collectibleItemId]) ? se((a = se({}, i), l = l = {
                                                                agreedPriceRobux: o.priceInRobux
                                                            }, Object.getOwnPropertyDescriptors ? Object.defineProperties(a, Object.getOwnPropertyDescriptors(l)) : (function(e) {
                                                                var t = Object.keys(e);
                                                                if (Object.getOwnPropertySymbols) {
                                                                    var r = Object.getOwnPropertySymbols(e);
                                                                    t.push.apply(t, r)
                                                                }
                                                                return t
                                                            })(Object(l)).forEach(function(e) {
                                                                Object.defineProperty(a, e, Object.getOwnPropertyDescriptor(l, e))
                                                            }), a), o.offerIds.length > 0 ? {
                                                                offerIds: o.offerIds
                                                            } : {}) : null);
                                                            u ? n = u : (null == s ? void 0 : s.timedOption) ? n.agreedPriceRobux = s.timedOption.price : n.agreedPriceRobux = e.collectibleItemDetails.lowestPrice
                                                        } else void 0 !== e.firstReseller ? (n.limitedV1InstanceId = "".concat(e.firstReseller.userAssetId), n.agreedPriceRobux = e.firstReseller.price) : (n.virtualEconomyProductId = "".concat(e.productId), n.agreedPriceRobux = e.premiumPriceInRobux && (0, nM.isPremiumUser)() ? e.premiumPriceInRobux : e.price);
                                                        t.push(n);
                                                        var d = {
                                                            data: {
                                                                itemData: {},
                                                                reason: ""
                                                            }
                                                        };
                                                        "Asset" === e.itemType ? d.data.itemData.assetId = e.id : d.data.itemData.bundleId = e.id, r.push(d)
                                                    }), e.lineItems = t, n = p.has(sr) ? p.get(sr) : "", i = nL(), o = void 0 !== n && "" !== n ? "web_looks_purchase-".concat(n, "-").concat(i) : i, f.label = 1;
                                                case 1:
                                                    return f.trys.push([1, 3, , 4]), [4, nK((0, nM.userId)(), w, e, o)];
                                                case 2:
                                                    if ((l = (a = f.sent()).data).message && l.message.startsWith("Error/EconomicRestrictions")) return D(a), y(r), [2];
                                                    return s = 0, l.fulfillmentGroups[0].lineItems.forEach(function(e) {
                                                        r[s].data.reason = "SUCCEEDED" === e.status ? "Success" : e.errorReason, s += 1
                                                    }), [3, 4];
                                                case 3:
                                                    return a = f.sent(), u = 0, r.forEach(function(e) {
                                                        a && (r[u].data.reason = null == a ? void 0 : a.data.message), u += 1
                                                    }), [3, 4];
                                                case 4:
                                                    return D(a), y(r), [2]
                                            }
                                        })
                                    }, function() {
                                        var t = this,
                                            r = arguments;
                                        return new Promise(function(n, i) {
                                            var o = e.apply(t, r);

                                            function a(e) {
                                                c9(o, n, i, a, l, "next", e)
                                            }

                                            function l(e) {
                                                c9(o, n, i, a, l, "throw", e)
                                            }
                                            a(void 0)
                                        })
                                    })(), v())
                                },
                                onNeutral: function() {
                                    b()
                                },
                                footerText: (0, o.jsx)(V, {
                                    expectedPrice: l,
                                    currentRobuxBalance: f
                                }),
                                loading: g,
                                actionButtonShow: !!d
                            })]
                        })
                    }
                    return e.defaultProps = {
                        open: !1,
                        title: "",
                        loading: !1,
                        marketplaceOfferPricing: {}
                    }, e.propTypes = {
                        translate: f().func.isRequired,
                        open: f().bool,
                        title: f().string,
                        expectedTotalPrice: f().number.isRequired,
                        items: f().arrayOf(f().shape({
                            itemName: f().string.isRequired,
                            itemType: f().string.isRequired,
                            timedOption: f().shape({
                                days: f().number.isRequired,
                                price: f().number.isRequired
                            })
                        })).isRequired,
                        currentRobuxBalance: f().number.isRequired,
                        purchaseMetadata: f().instanceOf(Map).isRequired,
                        marketplaceOfferPricing: f().objectOf(f().shape({
                            priceInRobux: f().number.isRequired,
                            offerIds: f().arrayOf(f().string).isRequired
                        })),
                        itemDetails: f().arrayOf(f().shape({
                            productId: f().number.isRequired,
                            price: f().number.isRequired,
                            itemName: f().string.isRequired,
                            itemType: f().string.isRequired,
                            assetTypeDisplayName: f().string.isRequired,
                            sellerName: f().string.isRequired,
                            expectedSellerId: f().number.isRequired,
                            isPurchasable: f().bool.isRequired,
                            isOwned: f().bool.isRequired,
                            isPlugin: f().bool.isRequired,
                            itemDetailItemId: f().number.isRequired,
                            loading: f().bool.isRequired,
                            userQualifiesForPremiumPrices: f().bool.isRequired,
                            premiumPriceInRobux: f().number.isRequired,
                            isAuthenticated: f().bool.isRequired,
                            resellerAvailable: f().bool.isRequired,
                            firstReseller: f().shape({
                                seller: {
                                    name: f().string.isRequired,
                                    id: f().number.isRequired
                                },
                                userAssetId: f().number.isRequired
                            }).isRequired,
                            isMarketPlaceEnabled: f().bool.isRequired
                        })).isRequired,
                        onCancel: f().func.isRequired,
                        onTransactionComplete: f().func.isRequired,
                        onAction: f().func.isRequired,
                        loading: f().bool,
                        productSurface: f().string.isRequired,
                        systemFeedbackService: f().func.isRequired
                    }, (0, c.withTranslations)(e, m)
                }(),
                sf = function() {
                    function e(e) {
                        var t = e.translate,
                            r = e.open,
                            n = e.onContinueToPayment,
                            i = e.onClose,
                            a = t(h.redirectToPartnerWebsiteMessage, {
                                linebreak: "\n\n"
                            }) || "This purchase must be completed on our partner’s website. You will be returned to Roblox after the purchase is completed.\n\n Proceed to partner website for payment?",
                            l = (0, o.jsx)("p", {
                                className: "modal-body",
                                children: a
                            });
                        return (0, o.jsx)(c5, {
                            open: r,
                            title: t(h.leavingRobloxHeading) || "Leaving Roblox",
                            body: l,
                            neutralButtonText: t(h.cancelAction),
                            actionButtonText: t(h.continueToPaymentAction) || "Continue To Payment",
                            onAction: function() {
                                x.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(x.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, x.paymentFlowAnalyticsService.ENUM_VIEW_NAME.LEAVE_ROBLOX_WARNING, x.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, x.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.CONTINUE_TO_VNG), n()
                            },
                            onNeutral: i,
                            actionButtonShow: !0
                        })
                    }
                    return e.defaultProps = {
                        open: !1,
                        onContinueToPayment: null,
                        onClose: null
                    }, e.propTypes = {
                        translate: f().func.isRequired,
                        open: f().bool,
                        onContinueToPayment: f().func,
                        onClose: f().func
                    }, (0, c.withTranslations)(e, m)
                }();

            function sp(e) {
                var t = e.currentUserBalance,
                    r = e.items,
                    n = e.itemDetails,
                    i = e.purchaseMetadata,
                    a = e.marketplaceOfferPricing,
                    l = e.onBuyButtonClick,
                    c = e.onConfirm,
                    d = e.onCancel,
                    f = e.onTransactionComplete,
                    p = e.productSurface,
                    m = e.displayPriceOnButton,
                    b = e.systemFeedbackService,
                    y = e.translate,
                    v = e.variant,
                    g = void 0 === v ? "Emphasis" : v,
                    w = e.size,
                    P = void 0 === w ? "Large" : w,
                    O = !1,
                    S = 0,
                    x = 0,
                    j = [],
                    I = sl((0, s.useState)(!1), 2),
                    E = I[0],
                    A = I[1],
                    R = sl((0, s.useState)(!1), 2),
                    N = R[0],
                    D = R[1],
                    F = sl((0, s.useState)(!1), 2),
                    L = F[0],
                    _ = F[1],
                    U = sl((0, s.useState)(!1), 2),
                    B = U[0],
                    q = U[1],
                    V = sl((0, s.useState)(!1), 2),
                    z = V[0],
                    G = V[1],
                    H = sl((0, s.useState)(null), 2),
                    W = H[0],
                    K = H[1],
                    X = function() {
                        var e = {
                            ReturnUrl: window.location.pathname
                        };
                        return (0, cQ.getUrlWithQueries)("/login", e)
                    };
                if ((0, s.useEffect)(function() {
                        (0, so.callBehaviour)("vng-buy-robux").then(function(e) {
                            D(e.shouldShowVng)
                        }).catch(function(e) {
                            console.debug(e), D(!1)
                        })
                    }, []), !(0, nM.isAuthenticated)()) return (0, o.jsx)("div", {
                    className: "sign-in",
                    children: (0, o.jsx)(nl, {
                        className: "action-button batch-buy-purchase-button sign-in-button",
                        variant: g,
                        size: P,
                        onClick: function() {
                            window.location = X()
                        },
                        children: y(h.buyAction)
                    })
                });
                if (void 0 === n || n.length > 0 && n[0] && n[0].loading || void 0 === t) return (0, o.jsx)("div", {
                    className: "loading",
                    children: (0, o.jsx)(nl, {
                        className: "action-button batch-buy-purchase-button",
                        variant: g,
                        size: P,
                        isDisabled: !0,
                        children: (0, o.jsx)(cJ, {
                            variant: "Indeterminate",
                            size: "Small",
                            ariaLabel: "Loading"
                        })
                    })
                });
                if (0 === n.length || n[0] && n[0].loadFailure) return (0, o.jsx)(nl, {
                    className: "action-button batch-buy-purchase-button",
                    variant: g,
                    size: P,
                    isDisabled: !0,
                    children: m ? (0, o.jsxs)("div", {
                        className: "purchase-price",
                        children: [(0, o.jsx)("span", {
                            className: "icon-robux-white-28x28"
                        }), (0, o.jsx)("span", {
                            className: "purchase-price-text text-robux-lg",
                            children: (0, k.formatNumber)(S)
                        })]
                    }) : (0, o.jsx)("div", {
                        children: y(h.buyAction)
                    })
                });
                n.forEach(function(e) {
                    (void 0 !== e.collectibleItemId ? e.isMarketPlaceEnabled && e.isPurchasable || e.resellerAvailable : e.isMarketPlaceEnabled && (e.resellerAvailable || e.isPurchasable)) && (O = !0);
                    var t, n = r.find(function(t) {
                            return t.id === e.id && t.itemType === e.itemType
                        }),
                        i = null == (t = a[e.collectibleItemId]) ? void 0 : t.priceInRobux;
                    void 0 !== i ? S += i : (null == n ? void 0 : n.timedOption) ? S += n.timedOption.price : void 0 !== e.collectibleItemDetails ? e.collectibleItemDetails.lowestPrice ? S += e.collectibleItemDetails.lowestPrice : e.collectibleItemId.price && (S += e.collectibleItemDetails.price) : e.premiumPriceInRobux && (0, nM.isPremiumUser)() ? x += e.premiumPriceInRobux : e.lowestPrice ? S += e.lowestPrice : e.price && (S += e.price), e.resellerAvailable && j.push(e)
                });
                var $ = S + x - t,
                    Y = (0, o.jsx)(cJ, {
                        variant: "Indeterminate",
                        size: "Small",
                        ariaLabel: "Loading"
                    });
                E || (Y = m ? (0, o.jsxs)("div", {
                    className: "purchase-price",
                    children: [(0, o.jsx)("span", {
                        className: "icon-robux-white-28x28"
                    }), (0, o.jsx)("span", {
                        className: "purchase-price-text text-robux-lg",
                        children: (0, k.formatNumber)(S)
                    })]
                }) : (0, o.jsx)("div", {
                    children: y(h.buyAction)
                }));
                var J = function() {
                    N ? q(!0) : window.location = C("")
                };
                return (0, o.jsxs)(u().Fragment, {
                    children: [(0, o.jsx)("div", {
                        className: "batch-buy-purchase-button-container",
                        children: (0, o.jsx)(nl, {
                            className: "action-button batch-buy-purchase-button",
                            variant: g,
                            size: P,
                            onClick: function() {
                                $ > 0 ? (K((0, o.jsx)(ss, {
                                    robuxNeeded: $,
                                    onAccept: J
                                })), su.open()) : (G(!0), _(!0)), l()
                            },
                            isDisabled: !O,
                            children: Y
                        })
                    }), $ > 0 && (0, o.jsx)("div", {
                        id: "insufficient-funds-modal",
                        children: W
                    }), N && (0, o.jsx)("div", {
                        id: "leave-roblox-warning-modal",
                        children: (0, o.jsx)(sf, {
                            open: B,
                            onContinueToPayment: function() {
                                nU.get({
                                    url: "".concat(T, "/vng-payments/v1/getVngShopUrl"),
                                    withCredentials: !0
                                }).then(function(e) {
                                    var t = e.data.vngShopRedirectUrl;
                                    window.open(t, "_blank").focus()
                                }).catch(function() {
                                    window.open(M, "_blank").focus()
                                }), q(!1)
                            },
                            onClose: function() {
                                return q(!1)
                            }
                        })
                    }), z && (0, o.jsx)("div", {
                        id: "multi-item-purchase-modal",
                        children: (0, o.jsx)(sd, {
                            open: L,
                            title: y(h.buyNowAction),
                            expectedTotalPrice: S + x,
                            items: r,
                            purchaseMetadata: i,
                            marketplaceOfferPricing: a,
                            itemDetails: n,
                            resaleItems: j,
                            currentRobuxBalance: t,
                            onCancel: function() {
                                _(!1), d()
                            },
                            onTransactionComplete: function(e) {
                                A(!1), f(e)
                            },
                            onAction: function() {
                                _(!1), A(!0), c()
                            },
                            loading: !1,
                            productSurface: p,
                            systemFeedbackService: b
                        })
                    })]
                })
            }

            function sm(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function sb(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function sy(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }
            sp.propTypes = {
                currentUserBalance: f().number.isRequired,
                items: f().arrayOf(f().shape({
                    id: f().number.isRequired,
                    itemType: f().string.isRequired,
                    timedOption: f().shape({
                        days: f().number.isRequired,
                        price: f().number.isRequired
                    })
                })).isRequired,
                purchaseMetadata: f().instanceOf(Map).isRequired,
                marketplaceOfferPricing: f().objectOf(f().shape({
                    priceInRobux: f().number.isRequired,
                    offerIds: f().arrayOf(f().string).isRequired
                })),
                itemDetails: f().arrayOf(f().shape({
                    productId: f().number.isRequired,
                    price: f().number.isRequired,
                    itemName: f().string.isRequired,
                    itemType: f().string.isRequired,
                    assetTypeDisplayName: f().string.isRequired,
                    sellerName: f().string.isRequired,
                    expectedSellerId: f().number.isRequired,
                    isPurchasable: f().bool.isRequired,
                    isOwned: f().bool.isRequired,
                    isPlugin: f().bool.isRequired,
                    itemDetailItemId: f().number.isRequired,
                    loading: f().bool.isRequired,
                    loadFailure: f().bool,
                    userQualifiesForPremiumPrices: f().bool.isRequired,
                    premiumPriceInRobux: f().number,
                    isAuthenticated: f().bool.isRequired,
                    resellerAvailable: f().bool.isRequired,
                    firstReseller: f().shape({
                        seller: {
                            name: f().string.isRequired,
                            id: f().number.isRequired
                        },
                        userAssetId: f().number.isRequired
                    }),
                    isMarketPlaceEnabled: f().bool.isRequired
                })).isRequired,
                onBuyButtonClick: f().func.isRequired,
                onConfirm: f().func.isRequired,
                onCancel: f().func.isRequired,
                onTransactionComplete: f().func.isRequired,
                productSurface: f().string.isRequired,
                displayPriceOnButton: f().bool.isRequired,
                systemFeedbackService: f().func.isRequired,
                translate: f().func.isRequired,
                variant: f().string,
                size: f().string
            }, sp.defaultProps = {
                marketplaceOfferPricing: {},
                variant: "Emphasis",
                size: "Large"
            };
            var sh = function() {},
                sv = function(e) {
                    var t, r = e.items,
                        n = e.purchaseMetadata,
                        i = e.marketplaceOfferPricing,
                        a = e.systemFeedbackService,
                        l = e.onBuyButtonClick,
                        c = void 0 === l ? sh : l,
                        u = e.onConfirm,
                        d = void 0 === u ? sh : u,
                        f = e.onCancel,
                        p = void 0 === f ? sh : f,
                        m = e.onTransactionComplete,
                        b = void 0 === m ? sh : m,
                        y = e.productSurface,
                        h = e.displayPriceOnButton,
                        v = e.variant,
                        g = e.size,
                        w = e.translate,
                        P = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, s.useState)(void 0)) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    o = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 2 !== i.length); o = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        o || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return i
                            }
                        }(t) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return sm(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return sm(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        O = P[0],
                        S = P[1];
                    (0, s.useEffect)(function() {
                        (0, nM.isAuthenticated)() && n2((0, nM.userId)()).then(function(e) {
                            S(e.data.robux)
                        }).catch(function() {
                            S(void 0)
                        })
                    }, []);
                    var x = cH(r).itemDetails;
                    return (0, o.jsx)(sp, {
                        currentUserBalance: O,
                        items: r,
                        itemDetails: x,
                        purchaseMetadata: n,
                        marketplaceOfferPricing: void 0 === i ? {} : i,
                        systemFeedbackService: a,
                        onBuyButtonClick: c,
                        onConfirm: d,
                        onCancel: p,
                        onTransactionComplete: b,
                        productSurface: void 0 === y ? "SHOPPING_CART_WEB" : y,
                        displayPriceOnButton: void 0 !== h && h,
                        translate: w,
                        variant: void 0 === v ? "Emphasis" : v,
                        size: void 0 === g ? "Large" : g
                    })
                },
                sg = function(e) {
                    var t = (0, c.useTranslation)().translate;
                    return (0, o.jsx)(sv, sy(sb({}, e), {
                        translate: t
                    }))
                },
                sw = (0, c.withTranslations)(function(e) {
                    var t = e.ItemPurchase,
                        r = e.itemPurchaseService,
                        n = e.innerProps;
                    return u().useEffect(function() {
                        setTimeout(function() {
                            return r.start()
                        }, 70)
                    }, [r]), (0, o.jsx)(t, function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var r = null != arguments[t] ? arguments[t] : {},
                                n = Object.keys(r);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(r, e).enumerable
                            }))), n.forEach(function(t) {
                                var n;
                                n = r[t], t in e ? Object.defineProperty(e, t, {
                                    value: n,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = n
                            })
                        }
                        return e
                    }({}, n))
                }, m);

            function sP(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var sO = function(e) {
                var t;
                return {
                    originalPrice: e.originalPrice,
                    totalDiscountAmount: e.totalAmountSaved,
                    totalDiscountPercentage: e.totalAmountSaved && e.originalPrice && e.originalPrice > 0 ? e.totalAmountSaved / e.originalPrice : void 0,
                    discounts: null == (t = e.discounts) ? void 0 : t.map(function(e) {
                        var t;
                        return {
                            discountAmount: e.robuxDiscountAmount,
                            discountPercentage: e.robuxDiscountPercentage,
                            discountCampaign: e.discountCampaign,
                            localizedDiscountAttribution: null != (t = e.localizedDiscountAttribution) ? t : void 0
                        }
                    })
                }
            };

            function sS(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function sx(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            l = !1;
                        try {
                            for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return sS(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return sS(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var sj = function(e, t, r) {
                var n = sx((0, s.useState)({
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
                    i = n[0],
                    o = n[1],
                    a = function() {
                        o({
                            loading: !1,
                            loadFailure: !0
                        })
                    },
                    l = (0, s.useCallback)(function() {
                        e(t, r).then(function(e) {
                            var t = e.data,
                                r = {
                                    expectedSellerId: t.expectedSellerId,
                                    owned: t.owned,
                                    id: t.id,
                                    itemType: t.itemType,
                                    assetType: t.assetType,
                                    name: t.name,
                                    description: t.description,
                                    productId: t.productId,
                                    price: t.price,
                                    lowestPrice: t.lowestPrice,
                                    creatorTargetId: t.creatorTargetId,
                                    creatorName: t.creatorName,
                                    hasLimitedPrivateSales: void 0 !== t.lowestPrice,
                                    isPublicDomain: 0 === t.price,
                                    offSaleDeadline: t.offSaleDeadline,
                                    isLimited: t.itemRestrictions.includes("Limited") || t.itemRestrictions.includes("LimitedUnique"),
                                    unitsAvailableForConsumption: void 0 !== t.unitsAvailableForConsumption ? t.unitsAvailableForConsumption : 0,
                                    priceStatus: void 0 !== t.priceStatus ? t.priceStatus : "",
                                    itemRestrictions: t.itemRestrictions
                                };
                            void 0 !== t.premiumPricing && (r.premiumPriceInRobux = t.premiumPricing.premiumPriceInRobux, r.premiumDiscountPercentage = t.premiumPricing.premiumDiscountPercentage), r.isLimited && (r.price = void 0 !== r.lowestPrice ? r.lowestPrice : r.price, n0(r.id).then(function(e) {
                                if (r.resellerAvailable = e.data.data.length > 0, r.resellerAvailable) {
                                    var t = sx(e.data.data, 1)[0];
                                    r.price = t.price, r.firstReseller = t
                                }
                            })), nZ(t.productId).then(function(e) {
                                !e.data.purchasable && e.data.reason && e.data.reason !== g.insufficientFunds ? r.isPurchasable = e.data.purchasable : r.isPurchasable = !0, r.assetTypeDisplayName = e.data.assetTypeDisplayName, r.loading = !1, r.loadFailure = !1, n1().then(function(e) {
                                    r.isMarketPlaceEnabled = e.data.isMarketPlaceEnabled && e.data.isItemsXchangeEnabled, o(r)
                                }).catch(function() {
                                    a()
                                })
                            }).catch(function(e) {
                                e.statusText === g.unauthorizedMessage ? (r.loading = !1, r.loadFailure = !1, o(r)) : a()
                            })
                        }).catch(function() {
                            a()
                        })
                    }, [t, r, e]);
                return (0, s.useEffect)(function() {
                    l()
                }, []), {
                    itemDetail: i,
                    loadItemDetail: l
                }
            };

            function sI(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var sE = function(e) {
                    if (Array.isArray(e)) return e
                }(i = cR()) || function(e) {
                    var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != n) {
                        var i = [],
                            o = !0,
                            a = !1;
                        try {
                            for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 2 !== i.length); o = !0);
                        } catch (e) {
                            a = !0, r = e
                        } finally {
                            try {
                                o || null == n.return || n.return()
                            } finally {
                                if (a) throw r
                            }
                        }
                        return i
                    }
                }(i) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return sI(e, 2);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return sI(e, 2)
                    }
                }(i) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }(),
                sA = sE[0],
                sT = sE[1],
                sR = function(e) {
                    nO.GameLauncher.openPluginInStudio(e)
                };

            function sN(e) {
                var t = e.translate,
                    r = e.productId,
                    n = e.price,
                    i = e.itemName,
                    a = e.itemType,
                    l = e.assetTypeDisplayName,
                    c = e.sellerName,
                    s = e.expectedSellerId,
                    d = e.isPurchasable,
                    f = e.isOwned,
                    m = e.isPlugin,
                    b = e.itemDetailItemId,
                    y = e.loading,
                    v = e.userQualifiesForPremiumPrices,
                    g = e.premiumPriceInRobux,
                    w = e.isAuthenticated,
                    P = e.resellerAvailable,
                    O = e.firstReseller,
                    S = e.isMarketPlaceEnabled,
                    j = function() {
                        return 0 === n ? t(h.getAction) : t(h.buyAction)
                    };
                if (y) return (0, o.jsx)(p.Loading, {});
                if (!w) return null != g ? (0, o.jsx)(p.Button, {
                    id: "upgrade-button",
                    className: "btn-fixed-width-lg btn-primary-lg",
                    onClick: function() {
                        x.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(x.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_PREMIUM_PURCHASE, !1, x.paymentFlowAnalyticsService.ENUM_VIEW_NAME.PREMIUM_UPSELL, x.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, x.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.GET_PREMIUM), window.open(D(b, a))
                    },
                    children: t(h.getPremiumAction)
                }) : (0, o.jsx)(p.Button, {
                    className: "btn-fixed-width-lg btn-growth-lg PurchaseButton",
                    onClick: function() {
                        window.location = "/login"
                    },
                    children: j()
                });
                var I = (0, o.jsx)(cZ.Thumbnail2d, {
                    type: "bundle" === a ? cZ.ThumbnailTypes.bundleThumbnail : cZ.ThumbnailTypes.assetThumbnail,
                    size: cZ.DefaultThumbnailSize,
                    targetId: b,
                    format: cZ.ThumbnailFormat.webp,
                    altName: i
                });
                return m && (f || 0 === n) ? (0, o.jsx)(p.Button, {
                    className: "btn-fixed-width-lg btn-primary-lg InstallButton",
                    onClick: function() {
                        sR(b)
                    },
                    children: (0, o.jsx)("span", {
                        children: t(h.installAction)
                    })
                }) : (0, o.jsxs)(u().Fragment, {
                    children: [(0, o.jsx)(p.Button, {
                        className: "btn-fixed-width-lg btn-growth-lg PurchaseButton",
                        onClick: sT.start,
                        isDisabled: !(S && (P || d)),
                        children: j()
                    }), (0, o.jsx)(sA, {
                        productId: r,
                        expectedPrice: v && null != g ? g : n,
                        thumbnail: I,
                        assetTypeDisplayName: l,
                        assetName: i,
                        sellerName: O ? O.seller.name : c,
                        expectedSellerId: O ? O.seller.id : s,
                        userAssetId: O ? O.userAssetId : 0,
                        showSuccessBanner: !0
                    })]
                })
            }
            sN.propTypes = {
                translate: f().func.isRequired,
                productId: f().number.isRequired,
                price: f().number.isRequired,
                itemName: f().string.isRequired,
                itemType: f().string.isRequired,
                assetTypeDisplayName: f().string.isRequired,
                sellerName: f().string.isRequired,
                expectedSellerId: f().number.isRequired,
                isPurchasable: f().bool.isRequired,
                isOwned: f().bool.isRequired,
                isPlugin: f().bool.isRequired,
                itemDetailItemId: f().number.isRequired,
                loading: f().bool.isRequired,
                userQualifiesForPremiumPrices: f().bool.isRequired,
                premiumPriceInRobux: f().number.isRequired,
                isAuthenticated: f().bool.isRequired,
                resellerAvailable: f().bool.isRequired,
                firstReseller: f().shape({
                    seller: {
                        name: f().string.isRequired,
                        id: f().number.isRequired
                    },
                    userAssetId: f().number.isRequired
                }).isRequired,
                isMarketPlaceEnabled: f().bool.isRequired
            };
            var sC = (0, c.withTranslations)(sN, b);

            function sD(e) {
                var t = e.translate,
                    r = e.isLimited,
                    n = e.resellerAvailable;
                return (0, o.jsx)("div", {
                    className: "text-label field-label price-label",
                    children: (0, o.jsx)("span", {
                        children: t(r && n ? h.bestPriceLabel : h.priceLabel)
                    })
                })
            }
            sD.propTypes = {
                translate: f().func.isRequired,
                isLimited: f().bool.isRequired,
                resellerAvailable: f().bool.isRequired
            };
            var sM = (0, c.withTranslations)(sD, b);

            function sk(e) {
                var t = e.translate,
                    r = e.price,
                    n = e.itemType,
                    i = e.itemDetailItemId,
                    a = e.premiumPriceInRobux,
                    l = e.premiumDiscountPercentage,
                    c = e.userQualifiesForPremiumPrices,
                    s = e.isOwned,
                    d = e.loading,
                    f = e.loadFailure,
                    m = e.unitsAvailableForConsumption,
                    b = e.isLimited,
                    y = e.isPlugin,
                    v = e.resellerAvailable,
                    w = e.priceStatus,
                    P = e.offSaleDeadline,
                    O = e.isMarketPlaceEnabled,
                    j = null == a && null == r,
                    I = !0,
                    E = "",
                    A = function(e) {
                        x.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(x.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_PREMIUM_PURCHASE, !1, x.paymentFlowAnalyticsService.ENUM_VIEW_NAME.PREMIUM_UPSELL, x.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, e.target.innerText)
                    };
                return d ? (0, o.jsx)(p.Loading, {}) : (!d && f ? E = g.retryErrorMessage : w === h.offSale && null === P ? E = t(h.itemNoLongerForSaleLabel) : O || s ? y || !s || b ? b && 0 === m && !v ? E = t(h.noOneCurrentlySellingLabel) : I = !1 : E = t(h.itemAvailableInventoryLabel) : E = t(h.purchasingTemporarilyUnavailableLabel), 0 === r) ? null : I && !s ? (0, o.jsx)("div", {
                    className: "price-container-text",
                    children: (0, o.jsxs)("div", {
                        className: "item-first-line",
                        children: [" ", E, " "]
                    })
                }) : (0, o.jsxs)("div", {
                    className: "price-container-text",
                    children: [I ? (0, o.jsxs)("div", {
                        className: "item-first-line",
                        children: [" ", E, " "]
                    }) : null, (0, o.jsx)(sM, {
                        translate: t,
                        isLimited: b,
                        resellerAvailable: v
                    }), (0, o.jsx)("div", {
                        className: "price-info",
                        children: (0, o.jsxs)("div", {
                            className: "icon-text-wrapper clearfix icon-robux-price-container",
                            children: [j ? (0, o.jsx)("span", {
                                className: "icon-robux-16x16 icon-robux-gray-16x16 wait-for-i18n-format-render"
                            }) : (0, o.jsx)("span", {
                                className: "icon-robux-16x16 wait-for-i18n-format-render"
                            }), (0, o.jsx)("span", {
                                className: "text-robux-lg wait-for-i18n-format-render",
                                children: c && null != a ? (0, k.formatNumber)(a) : (0, k.formatNumber)(r)
                            })]
                        })
                    }), function() {
                        if (null == a || s) return null;
                        if (null == r) return c ? (0, o.jsx)("span", {
                            className: "small text field-content empty-label wait-for-i18n-format-render",
                            children: t(h.premiumExclusiveEligiblePromptLabel)
                        }) : (0, o.jsx)("span", {
                            className: "small text field-content empty-label wait-for-i18n-format-render",
                            children: t(h.premiumExclusiveIneligiblePromptLabel)
                        });
                        var e = {
                            originalPrice: (0, S.renderToString)((0, o.jsx)(L, {
                                price: r
                            })),
                            discountPercentage: l,
                            premiumDiscountedPrice: (0, S.renderToString)((0, o.jsx)(L, {
                                price: a
                            }))
                        };
                        return (0, o.jsxs)(u().Fragment, {
                            children: [(0, o.jsx)("div", {
                                className: "text-label field-label empty-label",
                                children: "\xa0"
                            }), (0, o.jsx)("span", {
                                className: "premium-prompt small text field-content empty-label wait-for-i18n-format-render",
                                children: c ? (0, o.jsx)("a", {
                                    "aria-label": " ",
                                    href: D(i, n),
                                    dangerouslySetInnerHTML: {
                                        __html: t(h.premiumDiscountSavingsLabel, e)
                                    },
                                    onClick: function(e) {
                                        A(e), window.open(D(i, n))
                                    }
                                }) : (0, o.jsx)("a", {
                                    "aria-label": " ",
                                    href: D(i, n),
                                    dangerouslySetInnerHTML: {
                                        __html: t(h.premiumDiscountOpportunityPromptLabel, e)
                                    },
                                    onClick: function(e) {
                                        A(e), window.open(D(i, n))
                                    }
                                })
                            })]
                        })
                    }()]
                })
            }
            sk.propTypes = {
                translate: f().func.isRequired,
                price: f().number.isRequired,
                itemType: f().string.isRequired,
                itemDetailItemId: f().number.isRequired,
                premiumPriceInRobux: f().number.isRequired,
                premiumDiscountPercentage: f().number.isRequired,
                userQualifiesForPremiumPrices: f().bool.isRequired,
                loading: f().bool.isRequired,
                isOwned: f().bool.isRequired,
                loadFailure: f().bool.isRequired,
                unitsAvailableForConsumption: f().number.isRequired,
                isLimited: f().bool.isRequired,
                isPlugin: f().bool.isRequired,
                resellerAvailable: f().bool.isRequired,
                priceStatus: f().string.isRequired,
                offSaleDeadline: f().string.isRequired,
                isMarketPlaceEnabled: f().bool.isRequired
            };
            var sF = (0, c.withTranslations)(sk, {
                common: [],
                feature: "Feature.ItemModel"
            });

            function sL(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function s_(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var o = [],
                            a = !0,
                            l = !1;
                        try {
                            for (i = i.call(e); !(a = (r = i.next()).done) && (o.push(r.value), !t || o.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == i.return || i.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return sL(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return sL(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function sU(e) {
                var t = e.translate,
                    r = e.offSaleDeadline,
                    n = s_((0, s.useState)(0), 2),
                    i = n[0],
                    a = n[1],
                    l = s_((0, s.useState)(0), 2),
                    c = l[0],
                    u = l[1],
                    d = s_((0, s.useState)(0), 2),
                    f = d[0],
                    p = d[1],
                    m = s_((0, s.useState)(0), 2),
                    b = m[0],
                    y = m[1];
                return (0, s.useEffect)(function() {
                    var e = 0,
                        t = function() {
                            if (new Date < new Date(r)) {
                                var e = Date.now(),
                                    t = (new Date(r).getTime() - e) / 1e3;
                                a(Math.floor(t / 86400)), u(Math.floor(t / 3600 % 24)), p(Math.floor(t / 60 % 60)), y(Math.floor(t % 60))
                            }
                        };
                    return t(), e = setInterval(t, 1e3),
                        function() {
                            return clearInterval(e)
                        }
                }, [a, u, p, y]), (0, o.jsx)("div", {
                    id: "sale-clock",
                    className: "text-error sale-clock desktop-sale-clock",
                    children: i < 1 ? (0, o.jsx)("div", {
                        className: "text",
                        dangerouslySetInnerHTML: {
                            __html: t(h.OffsaleCountdownHourMinuteSecondLabel, {
                                numberOfHours: c,
                                numberOfMinutes: f,
                                numberOfSeconds: b
                            })
                        }
                    }) : b < 1 ? (window.location.reload(), null) : (0, o.jsx)("div", {
                        className: "text",
                        dangerouslySetInnerHTML: {
                            __html: t(h.CountdownTimerDayHourMinute, {
                                numberOfDays: i,
                                numberOfHours: c,
                                numberOfMinutes: f
                            })
                        }
                    })
                })
            }
            sU.propTypes = {
                translate: f().func.isRequired,
                offSaleDeadline: f().string.isRequired
            };
            var sB = (0, c.withTranslations)(sU, b),
                sq = window.HeaderScripts,
                sV = 0,
                sz = 1;

            function sG(e) {
                var t, r, n = e.translate,
                    i = e.assetType,
                    a = sq.deviceMeta.getDeviceMeta(),
                    l = "phone" === a.deviceType,
                    c = (t = (0, nM.userId)(), "/users/".concat(t, "/inventory"));
                return (r = i === v.Plugin || i === v.Decal || i === v.Model || i === v.Video || i === v.Animation ? sz : i === v.Place || i === v.Badge || i === v.GamePass || i === v.Animation ? null : sV) === sV && !a.isInApp && (sq.deviceMeta.isAndroidApp || sq.deviceMeta.isIosApp) && (sq.deviceMeta.isPhone || sq.deviceMeta.isTablet) ? (0, o.jsx)("a", {
                    id: "open-in-avatar-editor-button",
                    href: "/#",
                    className: "btn-fixed-width-lg btn-control-md",
                    children: (0, o.jsx)("span", {
                        className: "icon-nav-charactercustomizer"
                    })
                }) : r !== sV || l ? (0, o.jsx)("a", {
                    id: "inventory-button",
                    href: c,
                    className: "btn-fixed-width-lg btn-control-md",
                    children: n(h.inventoryAction)
                }) : (0, o.jsx)("a", {
                    id: "edit-avatar-button",
                    href: "/my/avatar",
                    className: "btn-control-md",
                    children: (0, o.jsx)("span", {
                        className: "icon-nav-charactercustomizer"
                    })
                })
            }
            sG.propTypes = {
                translate: f().func.isRequired,
                assetType: f().number.isRequired
            };
            var sH = (0, c.withTranslations)(sG, b),
                sW = function() {
                    var e = document.getElementById("item-container");
                    return e ? {
                        itemDetailItemId: parseInt(e.getAttribute("data-item-id"), 10),
                        itemDetailItemType: e.getAttribute("data-item-type")
                    } : null
                };

            function sK(e) {
                var t = e.translate,
                    r = sW(),
                    n = r.itemDetailItemId,
                    i = sj(nQ, n, r.itemDetailItemType).itemDetail;
                return (0, o.jsxs)(u().Fragment, {
                    children: [(0, o.jsx)(sF, {
                        translate: t,
                        price: i.price,
                        itemType: i.itemType,
                        itemDetailItemId: n,
                        premiumPriceInRobux: i.premiumPriceInRobux,
                        premiumDiscountPercentage: i.premiumDiscountPercentage,
                        userQualifiesForPremiumPrices: (0, nM.isPremiumUser)(),
                        isOwned: i.owned,
                        loading: i.loading,
                        loadFailure: i.loadFailure,
                        unitsAvailableForConsumption: i.unitsAvailableForConsumption,
                        isLimited: i.isLimited,
                        isPlugin: i.assetType === v.Plugin,
                        resellerAvailable: i.resellerAvailable,
                        priceStatus: i.priceStatus,
                        offSaleDeadline: i.offSaleDeadline,
                        isMarketPlaceEnabled: i.isMarketPlaceEnabled
                    }), !i.loadFailure && (i.owned && (!i.isLimited || i.unitsAvailableForConsumption > 0) ? (0, o.jsx)("div", {
                        className: "action-button",
                        children: (0, o.jsx)(sH, {
                            translate: t,
                            assetType: i.assetType
                        })
                    }) : (0, o.jsxs)("div", {
                        className: "action-button",
                        children: [(0, o.jsx)(sC, {
                            translate: t,
                            productId: i.productId,
                            price: i.price,
                            itemType: i.itemType,
                            assetTypeDisplayName: i.assetTypeDisplayName,
                            itemName: i.name,
                            sellerName: i.creatorName,
                            expectedSellerId: i.expectedSellerId,
                            isPurchasable: i.isPurchasable,
                            isOwned: i.owned,
                            isInstallable: i.assetType === v.Plugin,
                            itemDetailItemId: n,
                            loading: i.loading,
                            hasLimitedPrivateSales: i.hasLimitedPrivateSales,
                            userQualifiesForPremiumPrices: (0, nM.isPremiumUser)(),
                            premiumPriceInRobux: i.premiumPriceInRobux,
                            isAuthenticated: (0, nM.isAuthenticated)(),
                            unitsAvailableForConsumption: i.unitsAvailableForConsumption,
                            isLimited: i.isLimited,
                            resellerAvailable: i.resellerAvailable,
                            firstReseller: i.firstReseller,
                            isMarketPlaceEnabled: i.isMarketPlaceEnabled
                        }), null !== i.offSaleDeadline && (0, o.jsx)(sB, {
                            translate: t,
                            offSaleDeadline: i.offSaleDeadline
                        })]
                    }))]
                })
            }
            sK.propTypes = {
                translate: f().func.isRequired
            }, window.RobloxItemPurchase = {
                createTransactionFailureModal: O,
                createInsufficientFundsModal: U,
                createPriceChangedModal: H,
                createPurchaseVerificationModal: $,
                createPurchaseConfirmationModal: ng,
                createItemPurchase: cR,
                errorTypeIds: y,
                getMetaData: B,
                BalanceAfterSaleText: V,
                PriceLabel: L,
                AssetName: K,
                TransactionVerb: ny,
                BatchBuyPriceContainer: function(e) {
                    var t = e.translate,
                        r = function(e, t) {
                            if (null == e) return {};
                            var r, n, i, o = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                return o
                            }
                            if (o = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, i = {},
                                        o = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                                    return i
                                }(e, t), Object.getOwnPropertySymbols)
                                for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                            return o
                        }(e, ["translate"]);
                    return t ? (0, o.jsx)(sv, sy(sb({}, r), {
                        translate: t
                    })) : (0, o.jsx)(c.TranslationProvider, {
                        config: m,
                        children: (0, o.jsx)(sg, sb({}, r))
                    })
                },
                ASSET_TYPE_ENUM: ii,
                startGamepassPurchaseFlow: function(e) {
                    var t, r = "rbx-gamepass-purchase-root",
                        n = document.getElementById(r);
                    n || ((n = document.createElement("div")).id = r, document.body.appendChild(n));
                    var i = u().createElement(cZ.Thumbnail2d, {
                            type: cZ.ThumbnailTypes.assetThumbnail,
                            targetId: e.iconAssetId,
                            size: cZ.ThumbnailGamePassIconSize.size150,
                            format: cZ.ThumbnailFormat.webp,
                            altName: e.assetName
                        }),
                        o = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = cR()) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    o = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(o = (t = n.next()).done) && (i.push(t.value), 2 !== i.length); o = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        o || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return i
                            }
                        }(t) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return sP(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return sP(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        a = o[0],
                        l = o[1];
                    return (0, eR.render)(u().createElement(sw, {
                            ItemPurchase: a,
                            itemPurchaseService: l,
                            innerProps: {
                                thumbnail: i,
                                productId: e.productId,
                                assetName: e.assetName,
                                assetType: ii.GAME_PASS,
                                sellerName: e.sellerName,
                                expectedCurrency: 1,
                                expectedSellerId: e.expectedSellerId,
                                expectedPrice: e.expectedPrice,
                                discountInformation: e.discountInformation ? sO(e.discountInformation) : null,
                                onPurchaseSuccess: e.onPurchaseSuccess
                            }
                        }), n),
                        function() {
                            n && ((0, eR.unmountComponentAtNode)(n), n.remove())
                        }
                }
            }, l()(function() {
                var e = document.getElementById("display-price-container");
                e && (0, c.renderWithErrorBoundary)((0, o.jsx)(sK, {}), e)
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("ItemPurchase");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/itemPurchase-4c8dfc78bcc6afad.js.map
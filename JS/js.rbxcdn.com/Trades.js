! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "4f56b5748834aa2819272ee8286aa31571ff4c2e"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "73fe8381-cbcb-407a-a418-6c5487b874b2", e._sentryDebugIdIdentifier = "sentry-dbid-73fe8381-cbcb-407a-a418-6c5487b874b2")
    } catch (e) {}
}(),
function() {
    var e = {
            977: function(e, t, r) {
                function n(e) {
                    return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
                }
                var o = 0 / 0,
                    a = /^\s+|\s+$/g,
                    i = /^[-+]0x[0-9a-f]+$/i,
                    l = /^0b[01]+$/i,
                    c = /^0o[0-7]+$/i,
                    u = parseInt,
                    s = (void 0 === r.g ? "undefined" : n(r.g)) == "object" && r.g && r.g.Object === Object && r.g,
                    f = ("u" < typeof self ? "undefined" : n(self)) == "object" && self && self.Object === Object && self,
                    d = s || f || Function("return this")(),
                    p = Object.prototype.toString,
                    m = Math.max,
                    y = Math.min,
                    b = function() {
                        return d.Date.now()
                    };

                function v(e) {
                    var t = void 0 === e ? "undefined" : n(e);
                    return !!e && ("object" == t || "function" == t)
                }

                function h(e) {
                    if ("number" == typeof e) return e;
                    if ((void 0 === (t = e) ? "undefined" : n(t)) == "symbol" || t && (void 0 === t ? "undefined" : n(t)) == "object" && "[object Symbol]" == p.call(t)) return o;
                    if (v(e)) {
                        var t, r = "function" == typeof e.valueOf ? e.valueOf() : e;
                        e = v(r) ? r + "" : r
                    }
                    if ("string" != typeof e) return 0 === e ? e : +e;
                    e = e.replace(a, "");
                    var s = l.test(e);
                    return s || c.test(e) ? u(e.slice(2), s ? 2 : 8) : i.test(e) ? o : +e
                }
                e.exports = function(e, t, r) {
                    var n, o, a, i, l, c, u = 0,
                        s = !1,
                        f = !1,
                        d = !0;
                    if ("function" != typeof e) throw TypeError("Expected a function");

                    function p(t) {
                        var r = n,
                            a = o;
                        return n = o = void 0, u = t, i = e.apply(a, r)
                    }

                    function g(e) {
                        var r = e - c,
                            n = e - u;
                        return void 0 === c || r >= t || r < 0 || f && n >= a
                    }

                    function O() {
                        var e, r, n, o = b();
                        if (g(o)) return w(o);
                        l = setTimeout(O, (e = o - c, r = o - u, n = t - e, f ? y(n, a - r) : n))
                    }

                    function w(e) {
                        return (l = void 0, d && n) ? p(e) : (n = o = void 0, i)
                    }

                    function j() {
                        var e, r = b(),
                            a = g(r);
                        if (n = arguments, o = this, c = r, a) {
                            if (void 0 === l) return u = e = c, l = setTimeout(O, t), s ? p(e) : i;
                            if (f) return l = setTimeout(O, t), p(c)
                        }
                        return void 0 === l && (l = setTimeout(O, t)), i
                    }
                    return t = h(t) || 0, v(r) && (s = !!r.leading, a = (f = "maxWait" in r) ? m(h(r.maxWait) || 0, t) : a, d = "trailing" in r ? !!r.trailing : d), j.cancel = function() {
                        void 0 !== l && clearTimeout(l), u = 0, n = c = o = l = void 0
                    }, j.flush = function() {
                        return void 0 === l ? i : w(b())
                    }, j
                }
            }
        },
        t = {};

    function r(n) {
        var o = t[n];
        if (void 0 !== o) return o.exports;
        var a = t[n] = {
            exports: {}
        };
        return e[n](a, a.exports, r), a.exports
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
            var e, t, n, o, a, i, l, c, u, s, f, d, p, m, y, b, v, h, g, O, w, j, x, S, P, E, A, C, I, N, R, T, k, D, M, L, _, F, U, z, K, H, W, B, V, q, X, $ = window.ReactJSX,
                G = window.Roblox["core-scripts"].util.ready,
                Y = r.n(G),
                Q = window.Roblox["core-scripts"].react,
                Z = window.React,
                J = r.n(Z),
                ee = window.ReactStyleGuide,
                et = JSON.parse('{"P":["Common.AssetTypes","CommonUI.Controls","Authentication.TwoStepVerification","IAPExperience.PurchaseError","Purchasing.PurchaseDialog","Feature.NotApproved","Feature.Trades"]}'),
                er = /\/(?:trades|users)(?:\/.*)?$/,
                en = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : window.location.pathname;
                    return e.replace(er, "")
                },
                eo = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : window.location.pathname,
                        t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : window.location.search,
                        r = /\/trades\/(\d+)\/counter\/?$/.exec(e);
                    if (r) return {
                        view: "counter",
                        tradeId: parseInt(r[1], 10)
                    };
                    var n = /\/users\/(\d+)\/trade\/?$/.exec(e);
                    return n ? {
                        view: "create",
                        userId: parseInt(n[1], 10)
                    } : /\/trades\/?$/.test(e) ? {
                        view: "list",
                        tab: new URLSearchParams(t).get("tab") || void 0
                    } : null
                },
                ea = function(e) {
                    var t, r, n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : en();
                    switch (e.view) {
                        case "counter":
                            return "".concat(n, "/trades/").concat(null != (t = e.tradeId) ? t : "", "/counter");
                        case "create":
                            return "".concat(n, "/users/").concat(null != (r = e.userId) ? r : "", "/trade");
                        default:
                            return "".concat(n, "/trades").concat(e.tab ? "?tab=".concat(encodeURIComponent(e.tab)) : "")
                    }
                },
                ei = (0, Z.createContext)(null),
                el = ei.Provider,
                ec = function() {
                    var e = (0, Z.useContext)(ei);
                    if (!e) throw Error("useTradesRouter must be used within a TradesRouterProvider");
                    return e
                },
                eu = window.Roblox["core-scripts"].meta.user,
                es = window.Roblox["core-scripts"].environmentUrls,
                ef = r.n(es),
                ed = window.Roblox["core-scripts"].endpoints,
                ep = {
                    states: {
                        tradesList: "trades-list",
                        tradeWithUser: "trade-with-user",
                        counterTrade: "counter-trade"
                    },
                    urls: {
                        tradesApi: ef().tradesApi,
                        inventoryApi: ef().inventoryApi,
                        usersApi: ef().usersApi,
                        privacySettings: (0, ed.getAbsoluteUrl)("/my/account#!/privacy"),
                        settings: (0, ed.getAbsoluteUrl)("/my/account#!/security"),
                        membership: (0, ed.getAbsoluteUrl)("/premium/membership"),
                        limitedsCatalog: (0, ed.getAbsoluteUrl)("/catalog?Category=1&salesTypeFilter=2&CreatorName=Roblox"),
                        badRequest: (0, ed.getAbsoluteUrl)("/request-error?code=400"),
                        forbidden: (0, ed.getAbsoluteUrl)("/request-error?code=403"),
                        get2SVConfiguration: "".concat(ef().twoStepVerificationApi, "/v1/users/{userId}/configuration"),
                        generate: "".concat(ef().tradesApi, "/v1/trade-friction/two-step-verification/generate"),
                        redeem: "".concat(ef().tradesApi, "/v1/trade-friction/two-step-verification/redeem"),
                        getSettings: "".concat(ef().apiGatewayUrl, "/user-settings-api/v1/user-settings"),
                        setTradeQuality: "".concat(ef().apiGatewayUrl, "/user-settings-api/v1/user-settings")
                    },
                    tradeStatusType: {
                        inbound: "Inbound",
                        outbound: "Outbound",
                        inactive: "Inactive",
                        completed: "Completed"
                    },
                    tradeQualityType: {
                        none: "None",
                        low: "Low",
                        medium: "Medium",
                        high: "High"
                    },
                    tradeStatus: {
                        unknown: "Unknown",
                        open: "Open",
                        pending: "Pending",
                        completed: "Completed",
                        expired: "Expired",
                        declined: "Declined",
                        rejectedDueToError: "RejectedDueToError",
                        countered: "Countered",
                        processing: "Processing",
                        interventionRequired: "InterventionRequired"
                    },
                    tradeErrors: {
                        invalidTrade: 2,
                        inactiveTrade: 3,
                        unauthorized: 4,
                        tradeSystemUnavailable: 5,
                        needsConfirmation: 6,
                        userCannotTrade: 7,
                        invalidPartner: 10,
                        invalidUserAssets: 12,
                        tradeUnbalanced: 15,
                        tradeQualityInsufficient: 16,
                        insufficientRobux: 17,
                        tooManyRobux: 18,
                        cannotTradeWithSelf: 21,
                        userPrivacyTooStrict: 22,
                        tradeFrictionEncountered: 23,
                        robuxRequiresPlus: 30
                    },
                    tradeEligibility: {
                        legalOrRegulatoryRestrictions: "IneligibleLegalOrRegulatoryRestrictions",
                        ageCheckRequired: "IneligibleAgeCheckRequired",
                        freeTradesLimitReached: "IneligibleFreeTradesLimitReached"
                    },
                    freeTradesWindow: {
                        month: "Month"
                    },
                    freeTradesEndDate: "2026-12-31T00:00:00",
                    freeTradesUpsellStorageKey: "Roblox.Trades.FreeTradesUpsell",
                    canTradeWithStatus: {
                        canTrade: "CanTrade",
                        senderCannotTrade: "SenderCannotTrade",
                        senderAgeCheckRequired: "SenderAgeCheckRequired",
                        cannotTradeWithSelf: "CannotTradeWithSelf",
                        unknownError: "UnknownError"
                    },
                    invalidUserAssetReason: {
                        doesNotExist: "DoesNotExist",
                        notOwned: "NotOwned",
                        recipientNeedsMembership: "RecipientNeedsMembership",
                        contentRatingRestricted: "ContentRatingRestricted",
                        recipientNeedsHigherMembershipType: "RecipientNeedsHigherMembershipType",
                        notTradeable: "NotTradeable"
                    },
                    tradesVisiblePerPage: 10,
                    tradesLoadedPerPage: 25,
                    maxItemsPerSide: 4,
                    getTradableItemsLimit: 50,
                    holdingPeriodDays: 2,
                    minRobux: 0,
                    maxRobux: 1e7,
                    maxRobuxAsPercentOfValue: 50,
                    minValueRatio: "50%",
                    inventoryFilters: [{
                        labelKey: "Label.AllCategories",
                        value: ""
                    }, {
                        labelKey: "Label.HatAccessories",
                        value: "HatAccessory"
                    }, {
                        labelKey: "Label.HairAccessories",
                        value: "HairAccessory"
                    }, {
                        labelKey: "Label.FaceAccessories",
                        value: "FaceAccessory"
                    }, {
                        labelKey: "Label.NeckAccessories",
                        value: "NeckAccessory"
                    }, {
                        labelKey: "Label.ShoulderAccessories",
                        value: "ShoulderAccessory"
                    }, {
                        labelKey: "Label.FrontAccessories",
                        value: "FrontAccessory"
                    }, {
                        labelKey: "Label.BackAccessories",
                        value: "BackAccessory"
                    }, {
                        labelKey: "Label.WaistAccessories",
                        value: "WaistAccessory"
                    }, {
                        labelKey: "Label.Gear",
                        value: "Gear"
                    }, {
                        labelKey: "Label.Faces",
                        value: "Face"
                    }, {
                        labelKey: "Label.JacketAccessory",
                        value: "JacketAccessory"
                    }, {
                        labelKey: "Label.SweaterAccessory",
                        value: "SweaterAccessory"
                    }, {
                        labelKey: "Label.DressSkirtAccessory",
                        value: "DressSkirtAccessory"
                    }, {
                        labelKey: "Label.Characters",
                        value: "Character"
                    }, {
                        labelKey: "Label.Heads",
                        value: "DynamicHead"
                    }, {
                        labelKey: "Label.Shoes",
                        value: "Shoes"
                    }, {
                        labelKey: "Label.Animations",
                        value: "Animation"
                    }],
                    inventorySearchDebounceMs: 500,
                    inventorySearchMaxLength: 100,
                    tradesList: {
                        scrollBarLazyLoadDistancePx: 200
                    },
                    economicRestrictionsViolationLabels: {
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
                    }
                },
                em = window.Roblox["core-scripts"].format.string,
                ey = window.Roblox["core-scripts"].http.http,
                eb = window.Roblox["core-scripts"].format.number,
                ev = window.Roblox["core-scripts"].meta.device,
                eh = window.Roblox["core-scripts"].intl.intl,
                eg = r.n(eh),
                eO = function(e) {
                    var t = Math.round(e);
                    return Math.abs(e) % 1 != .5 || t % 2 == 0 ? t : t - 1
                },
                ew = function(e) {
                    var t = parseInt(String(e), 10);
                    return t >= ep.minRobux && t <= ep.maxRobux
                },
                ej = function(e) {
                    return Number.isInteger(parseInt(String(e), 10))
                },
                ex = function() {
                    return 30
                },
                eS = function(e) {
                    return ew(e) ? eO(.7 * e) : 0
                },
                eP = function(e) {
                    var t, r = e.items.reduce(function(e, t) {
                            return e + (t.recentAveragePrice ? t.recentAveragePrice : 0)
                        }, 0),
                        n = null != (t = e.robux) ? t : 0;
                    return ej(n) && ew(n) && (r += parseInt(String(n), 10)), r
                },
                eE = function(e) {
                    return null == e || "" === e || ej(e) && ew(e)
                },
                eA = function(e, t) {
                    var r;
                    return e.serialNumber ? t("Label.SerialNumber", {
                        serialNumber: (0, eb.formatNumber)(e.serialNumber),
                        totalNumber: (0, eb.formatNumber)(null != (r = e.assetStock) ? r : 0)
                    }) : t("Label.NoSerialNumber")
                },
                eC = function(e, t) {
                    var r = e.assetStock ? (0, eb.formatNumber)(e.assetStock) : "";
                    if (null != e.serialNumber) {
                        var n = (0, eb.formatNumber)(e.serialNumber);
                        return r ? "#".concat(n, "/").concat(r) : "#".concat(n)
                    }
                    var o = t("Label.NoSerialNumber");
                    return r ? "".concat(o, " /").concat(r) : o
                },
                eI = function(e) {
                    return null != e && e.limit > 0 && e.remaining >= 0
                },
                eN = function(e) {
                    var t;
                    return eI(e) && (null != (t = null == e ? void 0 : e.remaining) ? t : 0) <= 0
                },
                eR = function() {
                    var e;
                    return !!(null == (e = (0, ev.getDeviceMeta)()) ? void 0 : e.isPhone)
                },
                eT = function(e) {
                    return new(eg())().getDateTimeFormatter().getShortDate(new Date(e))
                };

            function ek(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function eD(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function eM(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            eD(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            eD(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function eL(e) {
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

            function e_(e, t) {
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

            function eF(e) {
                return function(e) {
                    if (Array.isArray(e)) return ek(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || ez(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function eU(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function ez(e, t) {
                if (e) {
                    if ("string" == typeof e) return ek(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ek(e, t)
                }
            }

            function eK(e, t) {
                var r, n, o, a = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(i, "next", {
                    value: c(0)
                }), l(i, "throw", {
                    value: c(1)
                }), l(i, "return", {
                    value: c(2)
                }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function c(l) {
                    return function(c) {
                        var u = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, u[0] && (a = 0)), a;) try {
                            if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                            switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                case 0:
                                case 1:
                                    o = u;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                        a.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && a.label < o[1]) {
                                        a.label = o[1], o = u;
                                        break
                                    }
                                    if (o && a.label < o[2]) {
                                        a.label = o[2], a.ops.push(u);
                                        break
                                    }
                                    o[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            u = t.call(e, a)
                        } catch (e) {
                            u = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var eH = function(e, t) {
                    return (0, em.concat)([(0, em.escapeHtml)(null != e ? e : ""), (0, em.escapeHtml)(null != t ? t : "")], void 0, !0)
                },
                eW = function(e) {
                    return eM(function() {
                        var t, r, n, o;
                        return eK(this, function(a) {
                            switch (a.label) {
                                case 0:
                                    return t = {
                                        url: "".concat(ep.urls.tradesApi, "/v1/trades/").concat(e.tradeStatusType),
                                        withCredentials: !0
                                    }, r = {
                                        cursor: e.cursor,
                                        limit: e.count,
                                        sortOrder: "Desc"
                                    }, [4, ey.get(t, r)];
                                case 1:
                                    return o = ((n = a.sent().data).data || []).map(function(t) {
                                        return e_(eL({}, t), {
                                            tradeStatusType: e.tradeStatusType,
                                            user: t.user ? e_(eL({}, t.user), {
                                                nameForDisplay: t.user.displayName
                                            }) : t.user
                                        })
                                    }), [2, {
                                        nextPageCursor: n.nextPageCursor,
                                        items: o
                                    }]
                            }
                        })
                    })()
                },
                eB = function(e, t) {
                    return eM(function() {
                        var r, n, o, a;
                        return eK(this, function(i) {
                            switch (i.label) {
                                case 0:
                                    return o = {
                                        url: "".concat(ep.urls.tradesApi, "/v2/trades/").concat(t),
                                        withCredentials: !0
                                    }, [4, ey.get(o)];
                                case 1:
                                    if (!(a = i.sent().data)) return [2, null];
                                    return (null == (r = a.participantAOffer.user) ? void 0 : r.id) === e ? a.user = a.participantBOffer.user : (null == (n = a.participantBOffer.user) ? void 0 : n.id) === e && (a.user = a.participantAOffer.user), a.user && (a.user.nameForDisplay = eH(a.user.displayName, a.user.name)), a.offers = [a.participantAOffer, a.participantBOffer], [2, a]
                            }
                        })
                    })()
                },
                eV = null,
                eq = new Set,
                eX = function(e) {
                    B = e, eq.forEach(function(t) {
                        t(e)
                    })
                },
                e$ = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        t = e.refresh;
                    return void 0 !== t && t && (eV = null), null != eV || (eV = ey.get({
                        url: "".concat(ep.urls.tradesApi, "/v2/users/me/can-trade"),
                        withCredentials: !0
                    }).then(function(e) {
                        var t = e.data,
                            r = null != t ? t : null;
                        return eX(r), r
                    }).catch(function(e) {
                        throw eV = null, e
                    })), eV
                },
                eG = function() {
                    e$({
                        refresh: !0
                    }).catch(function() {})
                },
                eY = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        r = t.itemTargetType,
                        n = t.cursor,
                        o = t.limit,
                        a = void 0 === o ? ep.getTradableItemsLimit : o,
                        i = t.search;
                    return eM(function() {
                        var t, o, l, c;
                        return eK(this, function(u) {
                            switch (u.label) {
                                case 0:
                                    return o = {
                                        url: "".concat(ep.urls.tradesApi, "/v2/users/").concat(e, "/tradableItems"),
                                        withCredentials: !0
                                    }, l = {
                                        sortBy: "CreationTime",
                                        sortOrder: "Desc",
                                        limit: a
                                    }, n && (l.cursor = n), r && (l.itemTargetTypes = r), i && (l.search = i), [4, ey.get(o, l)];
                                case 1:
                                    return [2, {
                                        items: ((c = u.sent().data).items || []).reduce(function(e, t) {
                                            return eF(e).concat(eF(t.instances || []))
                                        }, []).map(function(t) {
                                            return e_(eL({}, t), {
                                                id: t.collectibleItemInstanceId,
                                                userId: e
                                            })
                                        }),
                                        nextPageCursor: null != (t = c.nextPageCursor) ? t : null
                                    }]
                            }
                        })
                    })()
                },
                eQ = function(e) {
                    for (var t = null == e ? void 0 : e.response, r = 0, n = [e, null == e ? void 0 : e.data, null == t ? void 0 : t.data]; r < n.length; r++) {
                        var o = function(e) {
                            try {
                                return ey.getApiErrorCodes(e) || []
                            } catch (e) {
                                return []
                            }
                        }(n[r]);
                        if (o.length > 0) return o
                    }
                    return []
                },
                eZ = function(e) {
                    return "string" == typeof e ? e.replace(/[^a-z]/gi, "").toLowerCase() : null
                },
                eJ = function(e) {
                    var t;
                    return (null != (t = eZ(e)) ? t : "").endsWith("agecheckrequired")
                },
                e0 = function(e) {
                    var t;
                    return (null != (t = eZ(e)) ? t : "").endsWith("freetradeslimitreached")
                },
                e1 = function(e) {
                    if (7 === e) return !0;
                    if ("string" != typeof e) return !1;
                    var t = e.replace(/[^a-z]/gi, "").toLowerCase();
                    return "reasonsenderagecheckrequired" === t || "senderagecheckrequired" === t
                },
                e2 = function(e) {
                    var t = new WeakSet,
                        r = function(e) {
                            return !(!e || (void 0 === e ? "undefined" : eU(e)) !== "object" || t.has(e)) && (t.add(e), Object.entries(e).some(function(e) {
                                var t = function(e) {
                                        if (Array.isArray(e)) return e
                                    }(e) || function(e) {
                                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                        if (null != n) {
                                            var o = [],
                                                a = !0,
                                                i = !1;
                                            try {
                                                for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                                            } catch (e) {
                                                i = !0, r = e
                                            } finally {
                                                try {
                                                    a || null == n.return || n.return()
                                                } finally {
                                                    if (i) throw r
                                                }
                                            }
                                            return o
                                        }
                                    }(e) || ez(e, 2) || function() {
                                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                    }(),
                                    n = t[0],
                                    o = t[1],
                                    a = n.replace(/[^a-z]/gi, "").toLowerCase();
                                return !!("senderagecheckrequired" === a || "reason" === a && e1(o)) || r(o)
                            }))
                        };
                    return r(e)
                },
                e8 = function(e) {
                    var t = function(e) {
                            if (!e || (void 0 === e ? "undefined" : eU(e)) !== "object") return null;
                            var t = e.errors;
                            return Array.isArray(t) ? t : null
                        },
                        r = null == e ? void 0 : e.response,
                        n = t(e) || t(null == e ? void 0 : e.data) || t(null == r ? void 0 : r.data);
                    return n && n.length > 0 ? n[0] : null
                },
                e3 = function(e) {
                    return eM(function() {
                        var t, r, n;
                        return eK(this, function(o) {
                            switch (o.label) {
                                case 0:
                                    return [4, eM(function() {
                                        var t, r, n;
                                        return eK(this, function(o) {
                                            switch (o.label) {
                                                case 0:
                                                    if (e2(e)) return [2, !0];
                                                    if ((null != (t = null == (r = e8(e)) ? void 0 : r.code) ? t : eQ(e)[0]) !== ep.tradeErrors.userCannotTrade) return [2, !1];
                                                    o.label = 1;
                                                case 1:
                                                    return o.trys.push([1, 3, , 4]), [4, e$({
                                                        refresh: !0
                                                    })];
                                                case 2:
                                                    return [2, eJ(null == (n = o.sent()) ? void 0 : n.tradeEligibility)];
                                                case 3:
                                                    return o.sent(), [2, !1];
                                                case 4:
                                                    return [2]
                                            }
                                        })
                                    })()];
                                case 1:
                                    if (o.sent()) return [2, "ageCheck"];
                                    if ((null != (t = null == (r = e8(e)) ? void 0 : r.code) ? t : eQ(e)[0]) !== ep.tradeErrors.userCannotTrade) return [2, "cannotTrade"];
                                    o.label = 2;
                                case 2:
                                    return o.trys.push([2, 4, , 5]), [4, e$()];
                                case 3:
                                    if (e0(null == (n = o.sent()) ? void 0 : n.tradeEligibility) || eN(null == n ? void 0 : n.freeTradesAllowance)) return [2, "upsell"];
                                    return [3, 5];
                                case 4:
                                    return o.sent(), [3, 5];
                                case 5:
                                    return [2, "cannotTrade"]
                            }
                        })
                    })()
                },
                e6 = window.Roblox["core-scripts"].eventStream;

            function e4(e) {
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

            function e5(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var e7 = "tradesListInteraction",
                e9 = "tradeRequestInteractionV2",
                te = "tradeRequestSent",
                tt = "tradePageView",
                tr = "tradeViewed",
                tn = "tradeCenterFirstVisit",
                to = "tradeFilterClick",
                ta = "tradeBannerDismiss",
                ti = function() {
                    var e;
                    return eI(null == (e = B) ? void 0 : e.freeTradesAllowance) && !(0, eu.isBlackbirdUser)()
                },
                tl = function(e) {
                    var t, r;
                    return t = e4({}, e), r = r = {
                        pg: "v2",
                        framework: "react",
                        isUsingFreeTrades: ti()
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(r)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(r)).forEach(function(e) {
                        Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(r, e))
                    }), t
                },
                tc = function(e, t) {
                    var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
                    (0, e6.sendEventWithTarget)(e, t, tl(r))
                },
                tu = function(e, t) {
                    var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                        n = Roblox.AXAnalyticsService,
                        o = Roblox.AXSendTrackingActionType;
                    if (n && "function" == typeof n.sendAXTracking) {
                        var a = e === tt || e === tn || e === tr ? null == o ? void 0 : o.View : null == o ? void 0 : o.Click;
                        n.sendAXTracking({
                            itemName: e,
                            actionType: a,
                            metaData: {
                                metaData: JSON.stringify(e4({
                                    context: t
                                }, tl(r)))
                            }
                        })
                    }
                },
                ts = function(e) {
                    return null !== e && (void 0 === e ? "undefined" : e5(e)) === "object" ? e : null
                },
                tf = function(e) {
                    var t = ts(e);
                    if (t && Array.isArray(t.errors) && 0 !== t.errors.length) return t.errors
                },
                td = function(e) {
                    if ("string" == typeof e) return e;
                    if ("number" == typeof e || "boolean" == typeof e || (void 0 === e ? "undefined" : e5(e)) === "bigint") return String(e);
                    try {
                        var t = JSON.stringify(e);
                        if ("string" == typeof t) return t;
                        return "unserializable error"
                    } catch (e) {
                        return "unserializable error"
                    }
                },
                tp = function(e) {
                    if (void 0 !== e) return td(e)
                },
                tm = function(e) {
                    return "string" == typeof e && e.length > 0 ? e : void 0
                },
                ty = function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    var n = !0,
                        o = !1,
                        a = void 0;
                    try {
                        for (var i, l = t[Symbol.iterator](); !(n = (i = l.next()).done); n = !0) {
                            var c, u = i.value,
                                s = null != (c = ts(null == u ? void 0 : u.config)) ? c : u;
                            if (s) {
                                var f = tm(s.url),
                                    d = tm(s.baseURL),
                                    p = f && /^https?:\/\//i.test(f) ? f : d && f ? "".concat(d.replace(/\/$/, ""), "/").concat(f.replace(/^\//, "")) : null != f ? f : d,
                                    m = tm(s.method);
                                if (p || m) return {
                                    url: p,
                                    method: m
                                }
                            }
                        }
                    } catch (e) {
                        o = !0, a = e
                    } finally {
                        try {
                            n || null == l.return || l.return()
                        } finally {
                            if (o) throw a
                        }
                    }
                    return {}
                },
                tb = function(e) {
                    if (null == e) return {};
                    if ("string" == typeof e) return {
                        errorMessage: e
                    };
                    var t, r, n, o, a, i, l, c = ts(e);
                    if (!c) return {
                        errorMessage: td(e)
                    };
                    var u = ts(c.response),
                        s = null != (t = c.data) ? t : null == u ? void 0 : u.data,
                        f = null != (r = tf(c)) ? r : tf(s),
                        d = null == f ? void 0 : f[0],
                        p = null != (n = "number" == typeof c.status ? c.status : void 0) ? n : "number" == typeof(null == u ? void 0 : u.status) ? u.status : void 0,
                        m = null != (o = "string" == typeof c.statusText ? c.statusText : void 0) ? o : "string" == typeof(null == u ? void 0 : u.statusText) ? u.statusText : void 0,
                        y = "string" == typeof c.name ? c.name : void 0,
                        b = "string" == typeof c.message ? c.message : void 0,
                        v = null != (a = null != (i = null == d ? void 0 : d.message) ? i : b) ? a : m,
                        h = null != (l = null == d ? void 0 : d.code) ? l : "number" == typeof c.code ? c.code : void 0,
                        g = "number" == typeof c.code || "string" == typeof c.code ? c.code : void 0,
                        O = ty(c, u),
                        w = O.url,
                        j = O.method;
                    return {
                        errorStatus: p,
                        errorCode: h,
                        errorMessage: v,
                        errorName: y,
                        errorUrl: w,
                        errorMethod: j,
                        error: tp({
                            status: p,
                            statusText: m,
                            url: w,
                            method: j,
                            data: null != s ? s : f ? {
                                errors: f
                            } : void 0,
                            name: y,
                            message: b,
                            code: g
                        })
                    }
                },
                tv = function(e, t) {
                    var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
                    tu("tradeError", e, e4({}, r, tb(t)))
                },
                th = function(e) {
                    var t = e.offers;
                    if (!t || t.length < 2) return {};
                    var r = function(e) {
                            return e.items.reduce(function(e, t) {
                                return e + (Number(t.recentAveragePrice) || 0)
                            }, 0)
                        },
                        n = Number(t[1].robux) || 0,
                        o = Number(t[0].robux) || 0,
                        a = {
                            totalValueOffered: n += r(t[1]),
                            totalValueRequested: o += r(t[0]),
                            robuxOffered: Number(t[1].robux) || 0,
                            robuxRequested: Number(t[0].robux) || 0
                        };
                    return [0, 1, 2, 3].forEach(function(e) {
                        a["itemValueOffered_".concat(e + 1)] = t[1].items.length > e && t[1].items[e].recentAveragePrice || 0, a["itemValueRequested_".concat(e + 1)] = t[0].items.length > e && t[0].items[e].recentAveragePrice || 0
                    }), a
                },
                tg = function() {
                    var e = "",
                        t = "direct";
                    try {
                        var r = "u" > typeof document && document.referrer || "";
                        if (r) {
                            var n = new URL(r);
                            e = n.host + n.pathname, t = "u" > typeof window && n.host === window.location.host ? /\/users\/\d+/i.test(n.pathname) ? "profile" : "/" === n.pathname || /\/home/i.test(n.pathname) ? "home" : /\/trades/i.test(n.pathname) ? "tradesInternal" : "internalOther" : "external"
                        }
                    } catch (e) {}
                    return {
                        referrer: e,
                        entrySource: t
                    }
                },
                tO = "rbx.trades.hasVisitedTradeCenter",
                tw = function() {
                    try {
                        if (!window.localStorage || "true" === window.localStorage.getItem(tO)) return !1;
                        return window.localStorage.setItem(tO, "true"), !0
                    } catch (e) {
                        return !1
                    }
                },
                tj = function() {
                    var e = (0, Z.useRef)(!1);
                    (0, Z.useEffect)(function() {
                        if (!e.current) {
                            e.current = !0;
                            var t, r, n = tg(),
                                o = tw();
                            tu(tt, "tradesList", {
                                state: ep.states.tradesList,
                                referrer: n.referrer,
                                entrySource: n.entrySource,
                                isFirstVisit: o
                            }), o && (t = null == (r = (0, eu.authenticatedUser)()) ? void 0 : r.id, eM(function() {
                                var e, r, n;
                                return eK(this, function(o) {
                                    switch (o.label) {
                                        case 0:
                                            if (!t || t <= 0) return [2, !1];
                                            e = {
                                                url: "".concat(ep.urls.tradesApi, "/v2/users/").concat(t, "/tradableItems"),
                                                withCredentials: !0
                                            }, r = {
                                                limit: 10,
                                                sortBy: "CreationTime",
                                                sortOrder: "Desc"
                                            }, o.label = 1;
                                        case 1:
                                            return o.trys.push([1, 3, , 4]), [4, ey.get(e, r)];
                                        case 2:
                                            return [2, Array.isArray(null == (n = o.sent().data) ? void 0 : n.items) && n.items.length > 0];
                                        case 3:
                                            return o.sent(), [2, !1];
                                        case 4:
                                            return [2]
                                    }
                                })
                            })()).then(function(e) {
                                tu(tn, "tradesList", {
                                    entrySource: n.entrySource,
                                    ownsLimiteds: e
                                })
                            }).catch(function() {})
                        }
                    }, [])
                };

            function tx(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tS(e) {
                return function(e) {
                    if (Array.isArray(e)) return tx(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return tx(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tx(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var tP = "[trades-react]",
                tE = function() {
                    try {
                        return "false" !== window.localStorage.getItem("tradesReactDebug")
                    } catch (e) {
                        return !0
                    }
                },
                tA = function() {
                    for (var e, t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                    tE() && (e = console).log.apply(e, [tP].concat(tS(r)))
                },
                tC = function() {
                    for (var e, t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                    tE() && (e = console).warn.apply(e, [tP].concat(tS(r)))
                },
                tI = function() {
                    for (var e, t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                    (e = console).error.apply(e, [tP].concat(tS(r)))
                };

            function tN(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tR(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return tN(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tN(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var tT = "rbx.HideMoneyPageBanner",
                tk = "rbx.HideRegionalRestrictionsBanner",
                tD = function(e) {
                    try {
                        return !!window.localStorage && "true" === window.localStorage.getItem(e)
                    } catch (e) {
                        return !1
                    }
                },
                tM = function(e) {
                    try {
                        var t;
                        null == (t = window.localStorage) || t.setItem(e, "true")
                    } catch (e) {}
                },
                tL = function() {
                    var e = (0, Q.useTranslation)().translate,
                        t = tR((0, Z.useState)(!tD(tT)), 2),
                        r = t[0],
                        n = t[1],
                        o = tR((0, Z.useState)(!1), 2),
                        a = o[0],
                        i = o[1],
                        l = tR((0, Z.useState)(tD(tk)), 2),
                        c = l[0],
                        u = l[1];
                    (0, Z.useEffect)(function() {
                        e$().then(function(e) {
                            i((null == e ? void 0 : e.tradeEligibility) === ep.tradeEligibility.legalOrRegulatoryRestrictions)
                        }).catch(function() {
                            i(!1)
                        })
                    }, []);
                    var s = function() {
                            n(!1), tu(ta, "close", {
                                banner: "moneyPage"
                            }), tM(tT)
                        },
                        f = function() {
                            u(!0), tu(ta, "close", {
                                banner: "regionalRestrictions"
                            }), tM(tk)
                        };
                    return (0, $.jsxs)(J().Fragment, {
                        children: [r && (0, $.jsxs)("div", {
                            className: "message-banner money-page-banner",
                            children: [(0, $.jsx)("span", {
                                dangerouslySetInnerHTML: {
                                    __html: e("Message.TransactionsAndSummaryMoved", {
                                        robuxIcon: "<span class='icon-robux-gray-16x16'></span>"
                                    })
                                }
                            }), (0, $.jsx)("span", {
                                className: "icon-close cursor-pointer",
                                role: "button",
                                tabIndex: 0,
                                "aria-label": e("Action.Close"),
                                onClick: s,
                                onKeyDown: function(e) {
                                    ("Enter" === e.key || " " === e.key) && s()
                                }
                            })]
                        }), a && !c && (0, $.jsxs)("div", {
                            className: "message-banner regional-restrictions-banner",
                            children: [(0, $.jsx)("span", {
                                children: e("Error.TradeRestrictedByRegionalRestrictions")
                            }), (0, $.jsx)("span", {
                                className: "icon-close cursor-pointer",
                                role: "button",
                                tabIndex: 0,
                                "aria-label": e("Action.Close"),
                                onClick: f,
                                onKeyDown: function(e) {
                                    ("Enter" === e.key || " " === e.key) && f()
                                }
                            })]
                        })]
                    })
                };

            function t_(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var n = t[r];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                }
            }

            function tF(e) {
                return (tF = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function tU(e, t) {
                return (tU = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function tz() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (tz = function() {
                    return !!e
                })()
            }
            var tK = function(e) {
                    var t, r;
                    if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                    function n(e) {
                        var t, r, o;
                        if (!(this instanceof n)) throw TypeError("Cannot call a class as a function");
                        return r = n, o = [e], r = tF(r), (t = function(e, t) {
                            var r;
                            if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                            if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                            return e
                        }(this, tz() ? Reflect.construct(r, o || [], tF(this).constructor) : r.apply(this, o))).state = {
                            hasError: !1
                        }, t
                    }
                    return n.prototype = Object.create(e && e.prototype, {
                        constructor: {
                            value: n,
                            writable: !0,
                            configurable: !0
                        }
                    }), e && tU(n, e), t = [{
                        key: "componentDidCatch",
                        value: function(e, t) {
                            tI("render error caught by boundary:", e, null == t ? void 0 : t.componentStack), tv("renderErrorBoundary", e, {
                                componentStack: null == t ? void 0 : t.componentStack
                            })
                        }
                    }, {
                        key: "render",
                        value: function() {
                            var e = this.state,
                                t = e.hasError,
                                r = e.message,
                                n = this.props,
                                o = n.children,
                                a = n.fallbackMessage;
                            return t ? (0, $.jsxs)("div", {
                                className: "section-content-off",
                                children: [(0, $.jsx)("p", {
                                    className: "no-items text-error",
                                    children: a
                                }), r && (0, $.jsx)("p", {
                                    className: "text-footer",
                                    children: r
                                })]
                            }) : o
                        }
                    }], r = [{
                        key: "getDerivedStateFromError",
                        value: function(e) {
                            return {
                                hasError: !0,
                                message: null == e ? void 0 : e.message
                            }
                        }
                    }], t && t_(n.prototype, t), r && t_(n, r), n
                }(J().Component),
                tH = function() {
                    for (var e, t, r = 0, n = "", o = arguments.length; r < o; r++)(e = arguments[r]) && (t = function e(t) {
                        var r, n, o = "";
                        if ("string" == typeof t || "number" == typeof t) o += t;
                        else if ("object" == (void 0 === t ? "undefined" : t && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t))
                            if (Array.isArray(t)) {
                                var a = t.length;
                                for (r = 0; r < a; r++) t[r] && (n = e(t[r])) && (o && (o += " "), o += n)
                            } else
                                for (n in t) t[n] && (o && (o += " "), o += n);
                        return o
                    }(e)) && (n && (n += " "), n += t);
                    return n
                },
                tW = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                tB = function(e) {
                    var t = e.className;
                    return J().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: tH("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                },
                tV = "opacity-[0.5]";

            function tq(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tX(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function t$() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map(function(t) {
                            var n = tX(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        });
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : tX(t[e], null)
                        }
                    }
                }
            }

            function tG() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return Z.useCallback(t$.apply(void 0, function(e) {
                    if (Array.isArray(e)) return tq(e)
                }(t) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return tq(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tq(e, void 0)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function tY(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tQ(e) {
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

            function tZ(e, t) {
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

            function tJ(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function t0(e) {
                return function(e) {
                    if (Array.isArray(e)) return tY(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return tY(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tY(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function t1(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var t2 = Symbol.for("react.lazy"),
                t8 = Z[" use ".trim().toString()];

            function t3(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : t1(e)) === "object" && "$$typeof" in e && e.$$typeof === t2 && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : t1(t)) === "object" && null !== t && "then" in t
            }
            var t6 = ((e = Z.forwardRef(function(e, t) {
                    var r = e.children,
                        n = tJ(e, ["children"]);
                    if (t3(r) && "function" == typeof t8 && (r = t8(r._payload)), Z.isValidElement(r)) {
                        var o, a, i, l, c, u = (c = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                            s = function(e, t) {
                                var r = tQ({}, t);
                                for (var n in t) ! function(n) {
                                    var o = e[n],
                                        a = t[n];
                                    /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                        var n = a.apply(void 0, t0(t));
                                        return o.apply(void 0, t0(t)), n
                                    } : o && (r[n] = o) : "style" === n ? r[n] = tQ({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                                }(n);
                                return tQ({}, e, r)
                            }(n, r.props);
                        return r.type !== Z.Fragment && (s.ref = t ? t$(t, u) : u), Z.cloneElement(r, s)
                    }
                    return Z.Children.count(r) > 1 ? Z.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), n = e, (o = Z.forwardRef(function(e, t) {
                    var r = e.children,
                        o = tJ(e, ["children"]);
                    t3(r) && "function" == typeof t8 && (r = t8(r._payload));
                    var a = Z.Children.toArray(r),
                        i = a.find(t5);
                    if (i) {
                        var l = i.props.children,
                            c = a.map(function(e) {
                                return e !== i ? e : Z.Children.count(l) > 1 ? Z.Children.only(null) : Z.isValidElement(l) ? l.props.children : null
                            });
                        return (0, $.jsx)(n, tZ(tQ({}, o), {
                            ref: t,
                            children: Z.isValidElement(l) ? Z.cloneElement(l, void 0, c) : null
                        }))
                    }
                    return (0, $.jsx)(n, tZ(tQ({}, o), {
                        ref: t,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), o),
                t4 = Symbol("radix.slottable");

            function t5(e) {
                return Z.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === t4
            }

            function t7(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function t9(e) {
                if (Array.isArray(e)) return e
            }

            function re() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function rt(e) {
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

            function rr(e, t) {
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

            function rn(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function ro(e, t) {
                if (e) {
                    if ("string" == typeof e) return t7(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return t7(e, t)
                }
            }
            var ra = {
                    Large: "size-1200",
                    Medium: "size-1000",
                    Small: "size-800",
                    XSmall: "size-600"
                },
                ri = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-700"
                },
                rl = {
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
                rc = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-alert",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                ru = {
                    Emphasis: "bg-action-standard",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                rs = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-shift-300",
                    OverMedia: "bg-over-media-0"
                },
                rf = {
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
                rd = {
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
                rp = (0, Z.forwardRef)(function(e, t) {
                    var r, n, o = t9(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || ro(r) || re(),
                        a = o[0],
                        i = o.slice(1),
                        l = a.className,
                        c = a.icon,
                        u = a.ariaLabel,
                        s = a.isDisabled,
                        f = void 0 !== s && s,
                        d = a.isCircular,
                        p = a.isSelected,
                        m = a.size,
                        y = void 0 === m ? "Large" : m,
                        b = a.variant,
                        v = void 0 === b ? "Emphasis" : b,
                        h = a.iconColor,
                        g = void 0 === h ? "Default" : h,
                        O = a.asChild,
                        w = a.children,
                        j = rn(a, ["className", "icon", "ariaLabel", "isDisabled", "isCircular", "isSelected", "size", "variant", "iconColor", "asChild", "children"]),
                        x = (t9(i) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(i) || ro(i, 1) || re())[0];
                    n = f ? ru[v] : void 0 !== p && p ? rs[v] : rc[v];
                    var S = tH("foundation-web-icon-button", f ? tV : [tW, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", ra[y], rl[y][void 0 !== d && d ? "circular" : "square"], n, l),
                        P = J().createElement(J().Fragment, null, J().createElement(tB, null), J().createElement("span", {
                            className: tH("icon", c, ri[y], f ? rd[g][v] : rf[g][v])
                        }));
                    if (O) {
                        j.as;
                        var E = rn(j, ["as"]),
                            A = J().Children.only(w);
                        return J().createElement(t6, rr(rt({
                            ref: x
                        }, E), {
                            className: S,
                            "aria-label": u,
                            "aria-disabled": f || void 0
                        }), J().cloneElement(A, {}, P))
                    }
                    if ("a" === j.as) {
                        j.as;
                        var C = j.href,
                            I = rn(j, ["as", "href"]);
                        return J().createElement("a", rr(rt({
                            ref: x
                        }, I), {
                            "aria-label": u,
                            "aria-disabled": f,
                            href: f ? void 0 : C,
                            className: S
                        }), P)
                    }
                    j.as;
                    var N = rn(j, ["as"]);
                    return J().createElement("button", rr(rt({
                        ref: x,
                        type: "button"
                    }, N), {
                        "aria-label": u,
                        disabled: f,
                        className: S
                    }), P)
                });

            function rm(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ry(e) {
                if (Array.isArray(e)) return e
            }

            function rb() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function rv(e, t) {
                if (e) {
                    if ("string" == typeof e) return rm(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rm(e, t)
                }
            }
            var rh = {
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
                rg = J().forwardRef(function(e, t) {
                    var r, n = ry(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || rv(r) || rb(),
                        o = n[0],
                        a = n.slice(1),
                        i = o.className,
                        l = o.size,
                        c = void 0 === l ? "Large" : l,
                        u = o.variant,
                        s = o.value,
                        f = o.showValue,
                        d = void 0 !== f && f,
                        p = o.ariaLabel,
                        m = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(o, ["className", "size", "variant", "value", "showValue", "ariaLabel"]),
                        y = (ry(a) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(a) || rv(a, 1) || rb())[0],
                        b = rh[c],
                        v = b.dimension,
                        h = b.strokeWidth,
                        g = b.textClass,
                        O = b.valueContainerSize,
                        w = (v - h) / 2,
                        j = 2 * Math.PI * w,
                        x = v / 2,
                        S = Math.min(100, Math.max(0, void 0 === s ? 0 : s)),
                        P = d && void 0 !== O ? O : v,
                        E = "Determinate" === (void 0 === u ? "Determinate" : u);
                    return J().createElement("div", function(e) {
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
                        className: tH("foundation-web-progress-circle inline-flex items-center justify-center", i),
                        role: "progressbar",
                        "aria-label": p,
                        "aria-valuemin": E ? 0 : void 0,
                        "aria-valuemax": E ? 100 : void 0,
                        "aria-valuenow": E ? S : void 0,
                        style: {
                            width: P,
                            height: P
                        }
                    }, m), J().createElement("svg", {
                        width: v,
                        height: v,
                        viewBox: "0 0 ".concat(v, " ").concat(v),
                        className: "relative"
                    }, J().createElement("circle", {
                        cx: x,
                        cy: x,
                        r: w,
                        fill: "none",
                        strokeWidth: h,
                        style: {
                            stroke: "var(--color-shift-200)"
                        }
                    }), J().createElement("circle", {
                        cx: x,
                        cy: x,
                        r: w,
                        fill: "none",
                        strokeWidth: h,
                        strokeDasharray: E ? j : "".concat(.75 * j, " ").concat(.25 * j),
                        strokeDashoffset: E ? j * (1 - S / 100) : 0,
                        strokeLinecap: "round",
                        className: tH(!E && "foundation-web-progress-circle-indeterminate"),
                        style: E ? {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transform: "rotate(-90deg)",
                            transformOrigin: "50% 50%",
                            transition: "stroke-dashoffset 0.3s ease-out"
                        } : {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transformOrigin: "50% 50%"
                        }
                    })), E && d && "Large" === c && J().createElement("div", {
                        className: tH("absolute content-emphasis flex items-center justify-center", g),
                        "aria-hidden": "true"
                    }, J().createElement("span", null, Math.round(S)), J().createElement("span", null, "%")))
                });
            rg.displayName = "ProgressCircle";
            var rO = window.Roblox["core-scripts"].localStorage.localStorage,
                rw = r.n(rO),
                rj = function() {
                    var e, t, r = null != (e = null == (t = (0, eu.authenticatedUser)()) ? void 0 : t.id) ? e : 0;
                    return "".concat(ep.freeTradesUpsellStorageKey, "-").concat(r)
                },
                rx = function() {
                    var e = rw().getLocalStorage(rj());
                    return e && (void 0 === e ? "undefined" : e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e) == "object" ? e : null
                },
                rS = function() {
                    var e;
                    return !!(null == (e = rx()) ? void 0 : e.dismissedAt)
                },
                rP = function() {
                    rw().setLocalStorage(rj(), {
                        dismissedAt: Date.now()
                    })
                };

            function rE(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rA(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function rC(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            rA(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            rA(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function rI(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || rR(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rN(e) {
                return function(e) {
                    if (Array.isArray(e)) return rE(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || rR(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rR(e, t) {
                if (e) {
                    if ("string" == typeof e) return rE(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rE(e, t)
                }
            }

            function rT(e, t) {
                var r, n, o, a = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(i, "next", {
                    value: c(0)
                }), l(i, "throw", {
                    value: c(1)
                }), l(i, "return", {
                    value: c(2)
                }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function c(l) {
                    return function(c) {
                        var u = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, u[0] && (a = 0)), a;) try {
                            if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                            switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                case 0:
                                case 1:
                                    o = u;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                        a.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && a.label < o[1]) {
                                        a.label = o[1], o = u;
                                        break
                                    }
                                    if (o && a.label < o[2]) {
                                        a.label = o[2], a.ops.push(u);
                                        break
                                    }
                                    o[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            u = t.call(e, a)
                        } catch (e) {
                            u = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var rk = function(e, t) {
                    var r = new Set(e.map(function(e) {
                        return e.id
                    }));
                    return rN(e).concat(rN(t.filter(function(e) {
                        return !r.has(e.id)
                    })))
                },
                rD = function() {
                    var e = rI((0, Z.useState)([]), 2),
                        t = e[0],
                        r = e[1],
                        n = rI((0, Z.useState)(!1), 2),
                        o = n[0],
                        a = n[1],
                        i = rI((0, Z.useState)(!1), 2),
                        l = i[0],
                        c = i[1],
                        u = rI((0, Z.useState)(!1), 2),
                        s = u[0],
                        f = u[1],
                        d = rI((0, Z.useState)(!1), 2),
                        p = d[0],
                        m = d[1],
                        y = (0, Z.useRef)(""),
                        b = (0, Z.useRef)(ep.tradeStatusType.inbound),
                        v = (0, Z.useRef)(!1);
                    return {
                        trades: t,
                        loading: o,
                        noResults: l,
                        hasMore: s,
                        loadFailed: p,
                        loadFirstPage: (0, Z.useCallback)(function(e) {
                            return rC(function() {
                                var t, n;
                                return rT(this, function(o) {
                                    switch (o.label) {
                                        case 0:
                                            b.current = e, y.current = "", v.current = !0, r([]), c(!1), f(!1), m(!1), a(!0), o.label = 1;
                                        case 1:
                                            return o.trys.push([1, 3, 4, 5]), [4, eW({
                                                cursor: "",
                                                tradeStatusType: e,
                                                count: ep.tradesLoadedPerPage
                                            })];
                                        case 2:
                                            return y.current = (t = o.sent()).nextPageCursor, r(t.items), c(0 === t.items.length), f(null != t.nextPageCursor), [2, t.items];
                                        case 3:
                                            throw n = o.sent(), m(!0), n;
                                        case 4:
                                            return v.current = !1, a(!1), [7];
                                        case 5:
                                            return [2]
                                    }
                                })
                            })()
                        }, []),
                        loadNextPage: (0, Z.useCallback)(function() {
                            return rC(function() {
                                var e, t;
                                return rT(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            if (v.current || null === y.current || void 0 === y.current) return [2, []];
                                            v.current = !0, m(!1), a(!0), n.label = 1;
                                        case 1:
                                            return n.trys.push([1, 3, 4, 5]), [4, eW({
                                                cursor: y.current || "",
                                                tradeStatusType: b.current,
                                                count: ep.tradesLoadedPerPage
                                            })];
                                        case 2:
                                            return y.current = (e = n.sent()).nextPageCursor, r(function(t) {
                                                return rk(t, e.items)
                                            }), f(null != e.nextPageCursor), [2, e.items];
                                        case 3:
                                            throw t = n.sent(), m(!0), t;
                                        case 4:
                                            return v.current = !1, a(!1), [7];
                                        case 5:
                                            return [2]
                                    }
                                })
                            })()
                        }, []),
                        removeTrade: (0, Z.useCallback)(function(e) {
                            r(function(t) {
                                var r = t.filter(function(t) {
                                    return t.id !== e
                                });
                                return 0 === r.length && c(!0), r
                            })
                        }, []),
                        setNoResults: c
                    }
                };

            function rM(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var rL = function() {
                var e, t, r, n, o = function(e) {
                        if (Array.isArray(e)) return e
                    }(e = (0, Z.useState)(void 0)) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                a = !0,
                                i = !1;
                            try {
                                for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                            } catch (e) {
                                i = !0, r = e
                            } finally {
                                try {
                                    a || null == n.return || n.return()
                                } finally {
                                    if (i) throw r
                                }
                            }
                            return o
                        }
                    }(e) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return rM(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rM(e, 2)
                        }
                    }(e) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    a = o[0],
                    i = o[1];
                (0, Z.useEffect)(function() {
                    var e = !0,
                        t = function(t) {
                            if (e) {
                                var r;
                                i(null != (r = null == t ? void 0 : t.freeTradesAllowance) ? r : null)
                            }
                        };
                    e$().then(t).catch(function() {
                        t(null)
                    });
                    var r = (eq.add(t), function() {
                        eq.delete(t)
                    });
                    return function() {
                        e = !1, r()
                    }
                }, []);
                var l = eI(a),
                    c = (0, eu.isBlackbirdUser)();
                return {
                    isLoaded: void 0 !== a,
                    remaining: null != (t = null == a ? void 0 : a.remaining) ? t : 0,
                    total: null != (r = null == a ? void 0 : a.limit) ? r : 0,
                    window: null != (n = null == a ? void 0 : a.window) ? n : "",
                    shouldShowQuota: l && !c,
                    shouldShowUpsell: !c,
                    isOutOfTrades: eN(a) && !c
                }
            };

            function r_(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rF(e) {
                if (Array.isArray(e)) return e
            }

            function rU() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function rz(e, t) {
                if (e) {
                    if ("string" == typeof e) return r_(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return r_(e, t)
                }
            }
            var rK = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                rH = J().forwardRef(function(e, t) {
                    var r, n = rF(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || rz(r) || rU(),
                        o = n[0],
                        a = n.slice(1),
                        i = o.name,
                        l = o.size,
                        c = o.className,
                        u = (o.children, function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(o, ["name", "size", "className", "children"])),
                        s = (rF(a) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(a) || rz(a, 1) || rU())[0];
                    return J().createElement("span", function(e) {
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
                        ref: s,
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-icon",
                        className: tH("grow-0 shrink-0 basis-auto icon", i, rK[void 0 === l ? "Medium" : l], c)
                    }, u))
                });

            function rW(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rB(e) {
                if (Array.isArray(e)) return e
            }

            function rV() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function rq(e) {
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

            function rX(e, t) {
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

            function r$(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function rG(e, t) {
                if (e) {
                    if ("string" == typeof e) return rW(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rW(e, t)
                }
            }
            rH.displayName = "Icon";
            var rY = {
                    Small: "XSmall",
                    Medium: "Small",
                    Large: "Medium"
                },
                rQ = {
                    Small: ["height-600", "text-label-small"],
                    Medium: ["height-800", "text-label-medium"],
                    Large: ["height-1000", "text-label-medium"]
                },
                rZ = {
                    Small: "padding-left-small",
                    Medium: "padding-left-medium",
                    Large: "padding-left-large"
                },
                rJ = {
                    Small: "padding-left-small",
                    Medium: "padding-left-medium",
                    Large: "padding-left-medium"
                },
                r0 = {
                    Small: "padding-right-small",
                    Medium: "padding-right-medium",
                    Large: "padding-right-large"
                },
                r1 = {
                    Small: "padding-right-small",
                    Medium: "padding-right-medium",
                    Large: "padding-right-medium"
                },
                r2 = {
                    Small: "padding-left-xsmall",
                    Medium: "padding-left-[var(--size-150)]",
                    Large: "padding-left-small"
                },
                r8 = {
                    Small: "padding-right-[var(--size-150)]",
                    Medium: "padding-right-small",
                    Large: "padding-right-[var(--size-250)]"
                },
                r3 = {
                    Standard: "bg-shift-300",
                    Utility: "bg-none"
                },
                r6 = {
                    Small: "size-[var(--icon-size-xsmall)]",
                    Medium: "size-[var(--icon-size-small)]",
                    Large: "size-[var(--icon-size-medium)]"
                },
                r4 = function(e) {
                    var t = e.iconName,
                        r = e.node,
                        n = e.size;
                    return null != t ? J().createElement(rH, {
                        name: t,
                        size: rY[n]
                    }) : null != r ? J().createElement("span", {
                        className: tH("inline-flex items-center justify-center shrink-0", r6[n])
                    }, r) : null
                },
                r5 = (0, Z.forwardRef)(function(e, t) {
                    var r, n = rB(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || rG(r) || rV(),
                        o = n[0],
                        a = n.slice(1),
                        i = o.className,
                        l = o.style,
                        c = o.text,
                        u = o.isDisabled,
                        s = void 0 !== u && u,
                        f = o.size,
                        d = void 0 === f ? "Medium" : f,
                        p = o.variant,
                        m = void 0 === p ? "Standard" : p,
                        y = o.leadingIconName,
                        b = o.leadingIconNode,
                        v = o.trailingIconName,
                        h = o.trailingIconNode,
                        g = r$(o, ["className", "style", "text", "isDisabled", "size", "variant", "leadingIconName", "leadingIconNode", "trailingIconName", "trailingIconNode"]),
                        O = (rB(a) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(a) || rG(a, 1) || rV())[0],
                        w = null != y || null != b,
                        j = null != v || null != h,
                        x = tH(s ? tV : [tW, "cursor-pointer"], "relative flex justify-center items-center radius-circle stroke-none", w ? rJ[d] : rZ[d], j ? r1[d] : r0[d], rQ[d], i),
                        S = J().createElement(J().Fragment, null, J().createElement(tB, null), J().createElement(r4, {
                            iconName: y,
                            node: b,
                            size: d
                        }), J().createElement("span", {
                            className: tH("padding-y-xsmall text-no-wrap text-truncate-end", w && r2[d], j && r8[d])
                        }, c), J().createElement(r4, {
                            iconName: v,
                            node: h,
                            size: d
                        })),
                        P = rq({
                            textDecoration: "none"
                        }, l);
                    if ("a" === g.as) {
                        g.as;
                        var E = g.href,
                            A = r$(g, ["as", "href"]);
                        return J().createElement("a", rX(rq({
                            ref: O
                        }, A), {
                            "aria-disabled": s,
                            href: s ? void 0 : E,
                            className: tH(x, r3[m], "content-action-utility"),
                            style: P
                        }), S)
                    }
                    g.as;
                    var C = g.isChecked,
                        I = g.onCheckedChange,
                        N = r$(g, ["as", "isChecked", "onCheckedChange"]);
                    return J().createElement("button", rX(rq({
                        ref: O,
                        type: "button"
                    }, N), {
                        className: tH(C ? "bg-inverse-surface-0" : r3[m], C ? "content-inverse-emphasis" : "content-action-utility", x),
                        style: P,
                        "aria-pressed": C,
                        disabled: s,
                        onClick: null == I ? void 0 : function() {
                            return I(!C)
                        }
                    }), S)
                });

            function r7(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function r9(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return r7(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return r7(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var ne = function(e) {
                var t = e.options,
                    r = e.value,
                    n = e.onSelect,
                    o = (0, Z.useRef)(null),
                    a = (0, Z.useRef)({}),
                    i = r9((0, Z.useState)(!1), 2),
                    l = i[0],
                    c = i[1],
                    u = r9((0, Z.useState)(!1), 2),
                    s = u[0],
                    f = u[1],
                    d = (0, Z.useCallback)(function() {
                        var e = o.current;
                        e && (c(e.scrollLeft > 1), f(e.scrollWidth - e.clientWidth - e.scrollLeft > 1))
                    }, []);
                return (0, Z.useEffect)(function() {
                    return d(), window.addEventListener("resize", d),
                        function() {
                            window.removeEventListener("resize", d)
                        }
                }, [d, t]), (0, Z.useEffect)(function() {
                    var e;
                    null == (e = a.current[r]) || e.scrollIntoView({
                        block: "nearest",
                        inline: "nearest"
                    })
                }, [r]), (0, $.jsxs)("div", {
                    className: "trade-filter-chips",
                    children: [(0, $.jsx)("div", {
                        className: "trade-filter-chips-scroll",
                        ref: o,
                        onScroll: d,
                        role: "group",
                        children: t.map(function(e) {
                            return (0, $.jsx)(r5, {
                                ref: function(t) {
                                    a.current[e.value] = t
                                },
                                text: e.label,
                                size: "Medium",
                                isChecked: e.value === r,
                                onCheckedChange: function() {
                                    n(e.value)
                                }
                            }, e.value)
                        })
                    }), l && (0, $.jsx)("div", {
                        className: "trade-filter-chips-fade-start",
                        "aria-hidden": !0
                    }), s && (0, $.jsx)("div", {
                        className: "trade-filter-chips-fade-end",
                        "aria-hidden": !0
                    })]
                })
            };

            function nt(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nr(e) {
                if (Array.isArray(e)) return e
            }

            function nn() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function no(e) {
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

            function na(e, t) {
                if (e) {
                    if ("string" == typeof e) return nt(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nt(e, t)
                }
            }
            var ni = (0, Z.forwardRef)(function(e, t) {
                var r, n, o, a = nr(o = [e, t]) || function(e) {
                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(o) || na(o) || nn(),
                    i = a[0],
                    l = a.slice(1),
                    c = i.className,
                    u = i.style,
                    s = i.orientation,
                    f = void 0 === s ? "horizontal" : s,
                    d = i.variant,
                    p = void 0 === d ? "Standard" : d,
                    m = function(e, t) {
                        if (null == e) return {};
                        var r, n, o, a = {};
                        if ("u" > typeof Reflect && Reflect.ownKeys) {
                            for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }
                        if (a = function(e, t) {
                                if (null == e) return {};
                                var r, n, o = {},
                                    a = Object.getOwnPropertyNames(e);
                                for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                return o
                            }(e, t), Object.getOwnPropertySymbols)
                            for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                        return a
                    }(i, ["className", "style", "orientation", "variant"]),
                    y = (nr(l) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                a = !0,
                                i = !1;
                            try {
                                for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); a = !0);
                            } catch (e) {
                                i = !0, r = e
                            } finally {
                                try {
                                    a || null == n.return || n.return()
                                } finally {
                                    if (i) throw r
                                }
                            }
                            return o
                        }
                    }(l) || na(l, 1) || nn())[0],
                    b = "vertical" === f,
                    v = {};
                return b || "Inset" !== p ? b || "InsetLeft" !== p ? b || "InsetRight" !== p || (v = {
                    marginRight: "var(--padding-xlarge)"
                }) : v = {
                    marginLeft: "var(--padding-xlarge)"
                } : v = {
                    marginLeft: "var(--padding-xlarge)",
                    marginRight: "var(--padding-xlarge)"
                }, J().createElement("div", (r = no({
                    ref: y
                }, m), n = n = {
                    role: "separator",
                    "data-orientation": f,
                    "aria-orientation": f,
                    style: no({
                        borderRightWidth: 0,
                        borderBottomWidth: 0,
                        boxSizing: "border-box",
                        borderStyle: "solid"
                    }, b ? {
                        height: "100%",
                        width: 0,
                        borderLeftWidth: "var(--stroke-standard)",
                        borderTopWidth: 0
                    } : "Thick" === p ? {
                        height: "var(--size-250)",
                        borderTop: "var(--stroke-standard)",
                        borderLeftWidth: 0,
                        background: "var(--color-common-heavydivider, rgba(0, 0, 0, 0.50))"
                    } : {
                        height: 0,
                        borderTopWidth: "var(--stroke-standard)",
                        borderLeftWidth: 0
                    }, v, u),
                    className: tH("stroke-default self-stretch", c)
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
            ni.displayName = "Divider";
            var nl = window.RobloxThumbnails,
                nc = function(e) {
                    var t, r;
                    return (null == (t = e.user) ? void 0 : t.id) === (null == (r = (0, eu.authenticatedUser)()) ? void 0 : r.id)
                },
                nu = function(e, t) {
                    var r = ep.tradeStatus;
                    switch (e) {
                        case r.open:
                            return t("Label.TradeStatusOpen");
                        case r.pending:
                            return t("Label.TradeStatusPending");
                        case r.completed:
                            return t("Label.TradeStatusCompleted");
                        case r.expired:
                            return t("Label.TradeStatusExpired");
                        case r.declined:
                            return t("Label.TradeStatusDeclined");
                        case r.rejectedDueToError:
                            return t("Label.TradeStatusRejectedDueToError");
                        case r.countered:
                            return t("Label.TradeStatusCountered");
                        case r.processing:
                            return t("Label.TradeStatusProcessing");
                        case r.interventionRequired:
                            return t("Label.TradeStatusInterventionRequired");
                        default:
                            return t("Label.TradeStatusUnknown")
                    }
                },
                ns = function(e, t, r) {
                    var n = nc(t),
                        o = ep.tradeStatusType;
                    switch (e.tradeStatusType) {
                        case o.completed:
                            return r(n ? "Label.ItemsYouGave" : "Label.ItemsYouReceived");
                        case o.inactive:
                            return r(n ? "Label.ItemsWouldHaveGiven" : "Label.ItemsWouldHaveReceived");
                        case o.inbound:
                        case o.outbound:
                        default:
                            return r(n ? "Label.ItemsYouWillGive" : "Label.ItemsYouWillReceive")
                    }
                },
                nf = function(e) {
                    var t, r = e.trade,
                        n = e.isSelected,
                        o = e.onClick,
                        a = e.onProfileClick,
                        i = (0, Q.useTranslation)().translate,
                        l = r.user;
                    return (0, $.jsxs)("div", {
                        className: "trade-row".concat(n ? " selected" : ""),
                        onClick: function() {
                            o(r)
                        },
                        role: "button",
                        tabIndex: 0,
                        onKeyDown: function(e) {
                            ("Enter" === e.key || " " === e.key) && o(r)
                        },
                        children: [(0, $.jsx)(ni, {
                            className: "trade-row-divider"
                        }), (0, $.jsx)("div", {
                            className: "trade-row-container",
                            children: (0, $.jsx)("div", {
                                className: "trade-row-details",
                                children: (0, $.jsxs)("div", {
                                    children: [(0, $.jsx)("div", {
                                        className: "avatar avatar-headshot avatar-headshot-sm",
                                        children: l ? (0, $.jsx)("a", {
                                            href: "/users/".concat(l.id, "/profile"),
                                            target: "_self",
                                            className: "avatar-card-link",
                                            onClick: function(e) {
                                                e.stopPropagation(), a(r, "listRow")
                                            },
                                            children: (0, $.jsx)(nl.Thumbnail2d, {
                                                type: nl.ThumbnailTypes.avatarHeadshot,
                                                targetId: l.id,
                                                size: nl.ThumbnailAvatarHeadshotSize.size60,
                                                containerClass: "avatar-card-image"
                                            })
                                        }) : (0, $.jsx)("span", {
                                            className: "avatar-card-image"
                                        })
                                    }), (0, $.jsx)("div", {
                                        className: "text-lead",
                                        children: null != (t = null == l ? void 0 : l.nameForDisplay) ? t : ""
                                    }), (0, $.jsx)("div", {
                                        className: "text-date-hint",
                                        children: nu(r.status, i)
                                    }), (0, $.jsx)("span", {
                                        className: "font-caption-body text-date-hint text trade-sent-date",
                                        children: eT(r.created)
                                    })]
                                })
                            })
                        })]
                    })
                },
                nd = function(e) {
                    var t = e.width,
                        r = e.height;
                    return J().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: t,
                        height: r,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, J().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                };

            function np(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nm(e) {
                if (Array.isArray(e)) return e
            }

            function ny() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function nb(e) {
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

            function nv(e, t) {
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

            function nh(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function ng(e, t) {
                if (e) {
                    if ("string" == typeof e) return np(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return np(e, t)
                }
            }
            var nO = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                nw = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                nj = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                nx = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                nS = (0, Z.forwardRef)(function(e, t) {
                    var r, n = nm(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || ng(r) || ny(),
                        o = n[0],
                        a = n.slice(1),
                        i = o.children,
                        l = o.className,
                        c = o.style,
                        u = o.isDisabled,
                        s = void 0 !== u && u,
                        f = o.isLoading,
                        d = void 0 !== f && f,
                        p = o.icon,
                        m = o.size,
                        y = void 0 === m ? "Large" : m,
                        b = o.variant,
                        v = void 0 === b ? "Emphasis" : b,
                        h = o.asChild,
                        g = nh(o, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        O = (nm(a) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(a) || ng(a, 1) || ny())[0],
                        w = tH("foundation-web-button", s ? tV : [tW, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", nw[y], s ? nx[v] : nj[v], l),
                        j = nb({
                            textDecoration: "none"
                        }, c),
                        x = function(e) {
                            return J().createElement(J().Fragment, null, J().createElement(tB, null), d && J().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, J().createElement(nd, {
                                width: nO[y],
                                height: nO[y]
                            })), J().createElement("span", {
                                className: tH("flex items-center min-width-0", "Large" === y || "Medium" === y ? "gap-small" : "gap-xsmall", d && "invisible")
                            }, p && J().createElement(rH, {
                                name: p,
                                size: y
                            }), J().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (h) {
                        g.as;
                        var S = nh(g, ["as"]),
                            P = J().Children.only(i);
                        return J().createElement(t6, nv(nb({
                            ref: O
                        }, S), {
                            className: w,
                            style: j,
                            "aria-disabled": s || void 0
                        }), J().cloneElement(P, {}, x(P.props.children)))
                    }
                    if ("a" === g.as) {
                        g.as;
                        var E = g.href,
                            A = nh(g, ["as", "href"]);
                        return J().createElement("a", nv(nb({
                            ref: O
                        }, A), {
                            "aria-disabled": s,
                            href: s ? void 0 : E,
                            className: w,
                            style: j
                        }), x(i))
                    }
                    g.as;
                    var C = nh(g, ["as"]);
                    return J().createElement("button", nv(nb({
                        ref: O,
                        type: "button"
                    }, C), {
                        disabled: s,
                        className: w,
                        style: j
                    }), x(i))
                });

            function nP(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function nE(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            nP(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            nP(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function nA(e, t) {
                var r, n, o, a = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(i, "next", {
                    value: c(0)
                }), l(i, "throw", {
                    value: c(1)
                }), l(i, "return", {
                    value: c(2)
                }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function c(l) {
                    return function(c) {
                        var u = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, u[0] && (a = 0)), a;) try {
                            if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                            switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                case 0:
                                case 1:
                                    o = u;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                        a.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && a.label < o[1]) {
                                        a.label = o[1], o = u;
                                        break
                                    }
                                    if (o && a.label < o[2]) {
                                        a.label = o[2], a.ops.push(u);
                                        break
                                    }
                                    o[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            u = t.call(e, a)
                        } catch (e) {
                            u = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var nC = function(e) {
                    var t = window.Roblox.AccessManagementUpsellV2Service;
                    return t ? t.startAccessManagementUpsell({
                        featureName: "TriggerFacialAgeEstimationRecourse",
                        namespace: "account_identity/AgeCheck",
                        isAsyncCall: !1,
                        featureSpecificData: {
                            context: "trades",
                            source: e
                        }
                    }) : Promise.reject(Error("AccessManagementUpsellV2Service is unavailable"))
                },
                nI = function() {
                    return nE(function() {
                        var e, t;
                        return nA(this, function(r) {
                            switch (r.label) {
                                case 0:
                                    return t = ep.urls.get2SVConfiguration.replace("{userId}", String(null == (e = (0, eu.authenticatedUser)()) ? void 0 : e.id)), [4, ey.get({
                                        url: t,
                                        withCredentials: !0
                                    })];
                                case 1:
                                    return [2, r.sent().data.methods.some(function(e) {
                                        return e.enabled
                                    })]
                            }
                        })
                    })()
                },
                nN = function() {
                    window.location.href = ep.urls.settings
                },
                nR = function(e, t) {
                    switch (e[0]) {
                        case 2:
                        case 4:
                            return t("Error.TradeUnauthorized");
                        case 6:
                            return t("Error.WaitingForConfirmation");
                        case 10:
                            return t("Error.InvalidTradePartner");
                        case 7:
                            return t("Error.TradeUsersCannotTrade");
                        case 3:
                            return t("Error.TradeInactive");
                        case 5:
                            return t("Error.TradeSystemUnavailable");
                        case 23:
                            return t("Error.TradeFrictionEncountered");
                        default:
                            return t("Error.TradeUnknownError")
                    }
                },
                nT = function(e, t) {
                    var r = ep.invalidUserAssetReason;
                    switch (e) {
                        case r.doesNotExist:
                            return t("Error.UserAssetDoesNotExist");
                        case r.notOwned:
                            return t("Error.UserAssetNotOwned");
                        case r.recipientNeedsMembership:
                        case r.recipientNeedsHigherMembershipType:
                            return t("Error.RequiresPremiumMembership");
                        case r.contentRatingRestricted:
                            return t("Error.UserAssetContentRestricted");
                        case r.notTradeable:
                            return t("Error.UserAssetNotTradeable");
                        default:
                            return t("Error.UserAssetUnknownError")
                    }
                },
                nk = window.Roblox.AccountIntegrityChallengeService.TwoStepVerification,
                nD = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        r = (0, Q.useTranslation)().translate,
                        n = (0, Z.useRef)(""),
                        o = (0, Z.useRef)(0),
                        a = (0, Z.useRef)(t);
                    a.current = t;
                    var i = function() {
                            window.location.reload()
                        },
                        l = function() {
                            e.warning(r("Response.VerificationError"), 100, 6e3)
                        },
                        c = function(t) {
                            var o, c;
                            (o = n.current, c = t.verificationToken, nE(function() {
                                return nA(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return [4, ey.post({
                                                url: ep.urls.redeem,
                                                withCredentials: !0
                                            }, {
                                                challengeToken: o,
                                                verificationToken: c
                                            })];
                                        case 1:
                                            return [2, e.sent().data]
                                    }
                                })
                            })()).then(function(t) {
                                if (t) {
                                    var n;
                                    e.success(r("Response.SuccessfulVerificationV2"), 100, 6e3), (null != (n = a.current.onVerificationSuccess) ? n : i)()
                                } else l()
                            }).catch(l)
                        },
                        u = function() {
                            nE(function() {
                                return nA(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return [4, ey.post({
                                                url: ep.urls.generate,
                                                withCredentials: !0
                                            }, {})];
                                        case 1:
                                            return [2, e.sent().data]
                                    }
                                })
                            })().then(function(e) {
                                var t;
                                n.current = e, nk.renderChallenge({
                                    containerId: "2sv-popup-container",
                                    userId: null == (t = (0, eu.authenticatedUser)()) ? void 0 : t.id,
                                    challengeId: e,
                                    actionType: nk.ActionType.ItemTrade,
                                    renderInline: !1,
                                    shouldShowRememberDeviceCheckbox: !1,
                                    onChallengeCompleted: c,
                                    onChallengeInvalidated: function() {
                                        o.current < 3 && u(), o.current += 1
                                    },
                                    onModalChallengeAbandoned: function() {
                                        var e;
                                        (null != (e = a.current.onChallengeAbandoned) ? e : i)()
                                    }
                                })
                            }).catch(l)
                        };
                    return {
                        start: function() {
                            o.current = 0, u()
                        }
                    }
                },
                nM = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-medium"
                },
                nL = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                n_ = function(e) {
                    var t = e.variant,
                        r = e.size,
                        n = e.isCircular,
                        o = e.className,
                        a = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(e, ["variant", "size", "isCircular", "className"]);
                    return J().createElement("button", function(e) {
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
                        className: tH("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", tW, nL[t], nM[r], n && "radius-circle", o)
                    }, a), J().createElement(tB, null), J().createElement(rH, {
                        name: "icon-regular-x",
                        size: r
                    }))
                };

            function nF(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    o = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === o || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function nU(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nz(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function nK(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        nz(e, t, r[t])
                    })
                }
                return e
            }

            function nH(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function nW(e) {
                return function(e) {
                    if (Array.isArray(e)) return nU(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return nU(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nU(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nB(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    r = [],
                    n = function() {
                        var t = r.map(function(e) {
                            return Z.createContext(e)
                        });
                        return function(r) {
                            var n = (null == r ? void 0 : r[e]) || t;
                            return Z.useMemo(function() {
                                var t, o;
                                return nz({}, "__scope".concat(e), (t = nK({}, r), o = null != (o = nz({}, e, n)) ? o : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(o)) : (function(e) {
                                    var t = Object.keys(e);
                                    if (Object.getOwnPropertySymbols) {
                                        var r = Object.getOwnPropertySymbols(e);
                                        t.push.apply(t, r)
                                    }
                                    return t
                                })(Object(o)).forEach(function(e) {
                                    Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(o, e))
                                }), t))
                            }, [r, n])
                        }
                    };
                return n.scopeName = e, [function(t, n) {
                    var o = Z.createContext(n),
                        a = r.length;
                    r = nW(r).concat([n]);
                    var i = function(t) {
                        var r, n = t.scope,
                            i = t.children,
                            l = nH(t, ["scope", "children"]),
                            c = (null == n || null == (r = n[e]) ? void 0 : r[a]) || o,
                            u = Z.useMemo(function() {
                                return l
                            }, Object.values(l));
                        return (0, $.jsx)(c.Provider, {
                            value: u,
                            children: i
                        })
                    };
                    return i.displayName = t + "Provider", [i, function(r, i) {
                        var l, c = (null == i || null == (l = i[e]) ? void 0 : l[a]) || o,
                            u = Z.useContext(c);
                        if (u) return u;
                        if (void 0 !== n) return n;
                        throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                    }]
                }, nV.apply(void 0, [n].concat(nW(t)))]
            }

            function nV() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                var n = t[0];
                if (1 === t.length) return n;
                var o = function() {
                    var e = t.map(function(e) {
                        return {
                            useScope: e(),
                            scopeName: e.scopeName
                        }
                    });
                    return function(t) {
                        var r = e.reduce(function(e, r) {
                            var n = r.useScope,
                                o = r.scopeName;
                            return nK({}, e, n(t)["__scope".concat(o)])
                        }, {});
                        return Z.useMemo(function() {
                            return nz({}, "__scope".concat(n.scopeName), r)
                        }, [r])
                    }
                };
                return o.scopeName = n.scopeName, o
            }
            var nq = (null == (V = globalThis) ? void 0 : V.document) ? Z.useLayoutEffect : function() {};

            function nX(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var n$ = Z[" useId ".trim().toString()] || function() {},
                nG = 0;

            function nY(e) {
                var t, r = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = Z.useState(n$())) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                a = !0,
                                i = !1;
                            try {
                                for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                            } catch (e) {
                                i = !0, r = e
                            } finally {
                                try {
                                    a || null == n.return || n.return()
                                } finally {
                                    if (i) throw r
                                }
                            }
                            return o
                        }
                    }(t) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return nX(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nX(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r[0],
                    o = r[1];
                return nq(function() {
                    e || o(function(e) {
                        return null != e ? e : String(nG++)
                    })
                }, [e]), e || (n ? "radix-".concat(n) : "")
            }

            function nQ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nZ(e) {
                var t = Z.useRef(e);
                return Z.useEffect(function() {
                    t.current = e
                }), Z.useMemo(function() {
                    return function() {
                        for (var e, r = arguments.length, n = Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                            if (Array.isArray(e)) return nQ(e)
                        }(n) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(n) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return nQ(e, void 0);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nQ(e, void 0)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }
                }, [])
            }

            function nJ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function n0(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return nJ(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nJ(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function n1(e) {
                var t, r, n, o, a, i, l, c = e.prop,
                    u = e.defaultProp,
                    s = e.onChange,
                    f = void 0 === s ? function() {} : s,
                    d = n0((r = (t = {
                        defaultProp: u,
                        onChange: f
                    }).defaultProp, n = t.onChange, a = n0(o = Z.useState(r), 1)[0], i = Z.useRef(a), l = nZ(n), Z.useEffect(function() {
                        i.current !== a && (l(a), i.current = a)
                    }, [a, i, l]), o), 2),
                    p = d[0],
                    m = d[1],
                    y = void 0 !== c,
                    b = y ? c : p,
                    v = nZ(f);
                return [b, Z.useCallback(function(e) {
                    if (y) {
                        var t = "function" == typeof e ? e(c) : e;
                        t !== c && v(t)
                    } else m(e)
                }, [y, c, m, v])]
            }
            var n2 = window.RadixUI["react-dismissable-layer"],
                n8 = window.ReactDOM,
                n3 = r.n(n8);

            function n6(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function n4(e) {
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

            function n5(e, t) {
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

            function n7(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function n9(e) {
                return function(e) {
                    if (Array.isArray(e)) return n6(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return n6(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return n6(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oe(e) {
                var t, r, n = (t = e, (r = Z.forwardRef(function(e, t) {
                        var r = e.children,
                            n = n7(e, ["children"]);
                        if (Z.isValidElement(r)) {
                            var o, a, i, l, c, u = (c = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                s = function(e, t) {
                                    var r = n4({}, t);
                                    for (var n in t) ! function(n) {
                                        var o = e[n],
                                            a = t[n];
                                        /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            a.apply(void 0, n9(t)), o.apply(void 0, n9(t))
                                        } : o && (r[n] = o) : "style" === n ? r[n] = n4({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                                    }(n);
                                    return n4({}, e, r)
                                }(n, r.props);
                            return r.type !== Z.Fragment && (s.ref = t ? t$(t, u) : u), Z.cloneElement(r, s)
                        }
                        return Z.Children.count(r) > 1 ? Z.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), r),
                    o = Z.forwardRef(function(e, t) {
                        var r = e.children,
                            o = n7(e, ["children"]),
                            a = Z.Children.toArray(r),
                            i = a.find(or);
                        if (i) {
                            var l = i.props.children,
                                c = a.map(function(e) {
                                    return e !== i ? e : Z.Children.count(l) > 1 ? Z.Children.only(null) : Z.isValidElement(l) ? l.props.children : null
                                });
                            return (0, $.jsx)(n, n5(n4({}, o), {
                                ref: t,
                                children: Z.isValidElement(l) ? Z.cloneElement(l, void 0, c) : null
                            }))
                        }
                        return (0, $.jsx)(n, n5(n4({}, o), {
                            ref: t,
                            children: r
                        }))
                    });
                return o.displayName = "".concat(e, ".Slot"), o
            }
            var ot = Symbol("radix.slottable");

            function or(e) {
                return Z.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === ot
            }

            function on(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function oo(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        on(e, t, r[t])
                    })
                }
                return e
            }

            function oa(e, t) {
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
            var oi = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                var r = oe("Primitive.".concat(t)),
                    n = Z.forwardRef(function(e, n) {
                        var o = e.asChild,
                            a = function(e, t) {
                                if (null == e) return {};
                                var r, n, o, a = {};
                                if ("u" > typeof Reflect && Reflect.ownKeys) {
                                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                    return a
                                }
                                if (a = function(e, t) {
                                        if (null == e) return {};
                                        var r, n, o = {},
                                            a = Object.getOwnPropertyNames(e);
                                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                        return o
                                    }(e, t), Object.getOwnPropertySymbols)
                                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }(e, ["asChild"]),
                            i = o ? r : t;
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, $.jsx)(i, oa(oo({}, a), {
                            ref: n
                        }))
                    });
                return n.displayName = "Primitive.".concat(t), oa(oo({}, e), on({}, t, n))
            }, {});

            function ol(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oc(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || ou(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ou(e, t) {
                if (e) {
                    if ("string" == typeof e) return ol(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ol(e, t)
                }
            }
            var os = "focusScope.autoFocusOnMount",
                of = "focusScope.autoFocusOnUnmount",
                od = {
                    bubbles: !1,
                    cancelable: !0
                },
                op = Z.forwardRef(function(e, t) {
                    var r, n, o = e.loop,
                        a = void 0 !== o && o,
                        i = e.trapped,
                        l = void 0 !== i && i,
                        c = e.onMountAutoFocus,
                        u = e.onUnmountAutoFocus,
                        s = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(e, ["loop", "trapped", "onMountAutoFocus", "onUnmountAutoFocus"]),
                        f = oc(Z.useState(null), 2),
                        d = f[0],
                        p = f[1],
                        m = nZ(c),
                        y = nZ(u),
                        b = Z.useRef(null),
                        v = tG(t, function(e) {
                            return p(e)
                        }),
                        h = Z.useRef({
                            paused: !1,
                            pause: function() {
                                this.paused = !0
                            },
                            resume: function() {
                                this.paused = !1
                            }
                        }).current;
                    Z.useEffect(function() {
                        if (l) {
                            var e = function(e) {
                                    if (!h.paused && d) {
                                        var t = e.target;
                                        d.contains(t) ? b.current = t : ob(b.current, {
                                            select: !0
                                        })
                                    }
                                },
                                t = function(e) {
                                    if (!h.paused && d) {
                                        var t = e.relatedTarget;
                                        null !== t && (d.contains(t) || ob(b.current, {
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
                                        for (var o, a = e[Symbol.iterator](); !(t = (o = a.next()).done); t = !0) o.value.removedNodes.length > 0 && ob(d)
                                    } catch (e) {
                                        r = !0, n = e
                                    } finally {
                                        try {
                                            t || null == a.return || a.return()
                                        } finally {
                                            if (r) throw n
                                        }
                                    }
                                }
                            });
                            return d && r.observe(d, {
                                    childList: !0,
                                    subtree: !0
                                }),
                                function() {
                                    document.removeEventListener("focusin", e), document.removeEventListener("focusout", t), r.disconnect()
                                }
                        }
                    }, [l, d, h.paused]), Z.useEffect(function() {
                        if (d) {
                            ov.add(h);
                            var e = document.activeElement;
                            if (!d.contains(e)) {
                                var t = new CustomEvent(os, od);
                                d.addEventListener(os, m), d.dispatchEvent(t), t.defaultPrevented || (function(e) {
                                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                                        r = t.select,
                                        n = void 0 !== r && r,
                                        o = document.activeElement,
                                        a = !0,
                                        i = !1,
                                        l = void 0;
                                    try {
                                        for (var c, u = e[Symbol.iterator](); !(a = (c = u.next()).done); a = !0) {
                                            var s = c.value;
                                            if (ob(s, {
                                                    select: n
                                                }), document.activeElement !== o) return
                                        }
                                    } catch (e) {
                                        i = !0, l = e
                                    } finally {
                                        try {
                                            a || null == u.return || u.return()
                                        } finally {
                                            if (i) throw l
                                        }
                                    }
                                }(om(d).filter(function(e) {
                                    return "A" !== e.tagName
                                }), {
                                    select: !0
                                }), document.activeElement === e && ob(d))
                            }
                            return function() {
                                d.removeEventListener(os, m), setTimeout(function() {
                                    var t = new CustomEvent(of, od);
                                    d.addEventListener(of, y), d.dispatchEvent(t), t.defaultPrevented || ob(null != e ? e : document.body, {
                                        select: !0
                                    }), d.removeEventListener(of, y), ov.remove(h)
                                }, 0)
                            }
                        }
                    }, [d, m, y, h]);
                    var g = Z.useCallback(function(e) {
                        if ((a || l) && !h.paused) {
                            var t = "Tab" === e.key && !e.altKey && !e.ctrlKey && !e.metaKey,
                                r = document.activeElement;
                            if (t && r) {
                                var n, o, i = e.currentTarget,
                                    c = oc([oy(o = om(n = i), n), oy(o.reverse(), n)], 2),
                                    u = c[0],
                                    s = c[1];
                                u && s ? e.shiftKey || r !== s ? e.shiftKey && r === u && (e.preventDefault(), a && ob(s, {
                                    select: !0
                                })) : (e.preventDefault(), a && ob(u, {
                                    select: !0
                                })) : r === i && e.preventDefault()
                            }
                        }
                    }, [a, l, h.paused]);
                    return (0, $.jsx)(oi.div, (r = function(e) {
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
                    }, s), n = n = {
                        ref: v,
                        onKeyDown: g
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

            function om(e) {
                for (var t = [], r = document.createTreeWalker(e, NodeFilter.SHOW_ELEMENT, {
                        acceptNode: function(e) {
                            var t = "INPUT" === e.tagName && "hidden" === e.type;
                            return e.disabled || e.hidden || t ? NodeFilter.FILTER_SKIP : e.tabIndex >= 0 ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_SKIP
                        }
                    }); r.nextNode();) t.push(r.currentNode);
                return t
            }

            function oy(e, t) {
                var r = !0,
                    n = !1,
                    o = void 0;
                try {
                    for (var a, i = e[Symbol.iterator](); !(r = (a = i.next()).done); r = !0) {
                        var l = a.value;
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
                    n = !0, o = e
                } finally {
                    try {
                        r || null == i.return || i.return()
                    } finally {
                        if (n) throw o
                    }
                }
            }

            function ob(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    r = t.select;
                if (e && e.focus) {
                    var n, o, a, i = document.activeElement;
                    e.focus({
                        preventScroll: !0
                    }), e !== i && (o = n = e, null != (a = HTMLInputElement) && "u" > typeof Symbol && a[Symbol.hasInstance] ? !!a[Symbol.hasInstance](o) : o instanceof a) && "select" in n && void 0 !== r && r && e.select()
                }
            }
            op.displayName = "FocusScope";
            var ov = (t = [], {
                add: function(e) {
                    var r = t[0];
                    e !== r && (null == r || r.pause()), (t = oh(t, e)).unshift(e)
                },
                remove: function(e) {
                    var r;
                    null == (r = (t = oh(t, e))[0]) || r.resume()
                }
            });

            function oh(e, t) {
                var r = function(e) {
                        if (Array.isArray(e)) return ol(e)
                    }(e) || function(e) {
                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(e) || ou(e) || function() {
                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r.indexOf(t);
                return -1 !== n && r.splice(n, 1), r
            }

            function og(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var oO = Z.forwardRef(function(e, t) {
                var r, n, o, a, i, l = e.container,
                    c = function(e, t) {
                        if (null == e) return {};
                        var r, n, o, a = {};
                        if ("u" > typeof Reflect && Reflect.ownKeys) {
                            for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }
                        if (a = function(e, t) {
                                if (null == e) return {};
                                var r, n, o = {},
                                    a = Object.getOwnPropertyNames(e);
                                for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                return o
                            }(e, t), Object.getOwnPropertySymbols)
                            for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                        return a
                    }(e, ["container"]),
                    u = function(e) {
                        if (Array.isArray(e)) return e
                    }(r = Z.useState(!1)) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                a = !0,
                                i = !1;
                            try {
                                for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                            } catch (e) {
                                i = !0, r = e
                            } finally {
                                try {
                                    a || null == n.return || n.return()
                                } finally {
                                    if (i) throw r
                                }
                            }
                            return o
                        }
                    }(r) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return og(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return og(e, 2)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    s = u[0],
                    f = u[1];
                nq(function() {
                    return f(!0)
                }, []);
                var d = l || s && (null == (i = globalThis) || null == (a = i.document) ? void 0 : a.body);
                return d ? n3().createPortal((0, $.jsx)(oi.div, (n = function(e) {
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
                }({}, c), o = o = {
                    ref: t
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(o)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(o)).forEach(function(e) {
                    Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(o, e))
                }), n)), d) : null
            });

            function ow(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oj(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return ow(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ow(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            oO.displayName = "Portal";
            var ox = function(e) {
                var t, r, n, o, a, i, l, c, u, s, f, d, p, m, y, b, v, h = e.present,
                    g = e.children,
                    O = (t = h, a = (o = oj(Z.useState(), 2))[0], i = o[1], l = Z.useRef({}), c = Z.useRef(t), u = Z.useRef("none"), f = (s = oj((r = t ? "mounted" : "unmounted", n = {
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
                    }, Z.useReducer(function(e, t) {
                        var r = n[e][t];
                        return null != r ? r : e
                    }, r)), 2))[0], d = s[1], Z.useEffect(function() {
                        var e = oS(l.current);
                        u.current = "mounted" === f ? e : "none"
                    }, [f]), nq(function() {
                        var e = l.current,
                            r = c.current;
                        if (r !== t) {
                            var n = u.current,
                                o = oS(e);
                            t ? d("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? d("UNMOUNT") : r && n !== o ? d("ANIMATION_OUT") : d("UNMOUNT"), c.current = t
                        }
                    }, [t, d]), nq(function() {
                        if (a) {
                            var e, t, r = null != (e = a.ownerDocument.defaultView) ? e : window,
                                n = function(e) {
                                    var n = oS(l.current).includes(e.animationName);
                                    if (e.target === a && n && (d("ANIMATION_END"), !c.current)) {
                                        var o = a.style.animationFillMode;
                                        a.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                            "forwards" === a.style.animationFillMode && (a.style.animationFillMode = o)
                                        })
                                    }
                                },
                                o = function(e) {
                                    e.target === a && (u.current = oS(l.current))
                                };
                            return a.addEventListener("animationstart", o), a.addEventListener("animationcancel", n), a.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(t), a.removeEventListener("animationstart", o), a.removeEventListener("animationcancel", n), a.removeEventListener("animationend", n)
                                }
                        }
                        d("ANIMATION_END")
                    }, [a, d]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: Z.useCallback(function(e) {
                            e && (l.current = getComputedStyle(e)), i(e)
                        }, [])
                    }),
                    w = "function" == typeof g ? g({
                        present: O.isPresent
                    }) : Z.Children.only(g),
                    j = tG(O.ref, (v = (b = null == (m = Object.getOwnPropertyDescriptor((p = w).props, "ref")) ? void 0 : m.get) && "isReactWarning" in b && b.isReactWarning) ? p.ref : (v = (b = null == (y = Object.getOwnPropertyDescriptor(p, "ref")) ? void 0 : y.get) && "isReactWarning" in b && b.isReactWarning) ? p.props.ref : p.props.ref || p.ref);
                return "function" == typeof g || O.isPresent ? Z.cloneElement(w, {
                    ref: j
                }) : null
            };

            function oS(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }
            ox.displayName = "Presence";
            var oP = window.RadixUI["react-focus-guards"],
                oE = function() {
                    return (oE = Object.assign || function(e) {
                        for (var t, r = 1, n = arguments.length; r < n; r++)
                            for (var o in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }).apply(this, arguments)
                };

            function oA(e, t) {
                var r = {};
                for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && 0 > t.indexOf(n) && (r[n] = e[n]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols)
                    for (var o = 0, n = Object.getOwnPropertySymbols(e); o < n.length; o++) 0 > t.indexOf(n[o]) && Object.prototype.propertyIsEnumerable.call(e, n[o]) && (r[n[o]] = e[n[o]]);
                return r
            }
            var oC = "right-scroll-bar-position",
                oI = "width-before-scroll-bar";

            function oN(e, t) {
                return "function" == typeof e ? e(t) : e && (e.current = t), e
            }
            var oR = "u" > typeof window ? Z.useLayoutEffect : Z.useEffect,
                oT = new WeakMap,
                ok = (void 0 === a && (a = {}), (void 0 === i && (i = function(e) {
                    return e
                }), l = [], c = !1, u = {
                    read: function() {
                        if (c) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                        return l.length ? l[l.length - 1] : null
                    },
                    useMedium: function(e) {
                        var t = i(e, c);
                        return l.push(t),
                            function() {
                                l = l.filter(function(e) {
                                    return e !== t
                                })
                            }
                    },
                    assignSyncMedium: function(e) {
                        for (c = !0; l.length;) {
                            var t = l;
                            l = [], t.forEach(e)
                        }
                        l = {
                            push: function(t) {
                                return e(t)
                            },
                            filter: function() {
                                return l
                            }
                        }
                    },
                    assignMedium: function(e) {
                        c = !0;
                        var t = [];
                        if (l.length) {
                            var r = l;
                            l = [], r.forEach(e), t = l
                        }
                        var n = function() {
                                var r = t;
                                t = [], r.forEach(e)
                            },
                            o = function() {
                                return Promise.resolve().then(n)
                            };
                        o(), l = {
                            push: function(e) {
                                t.push(e), o()
                            },
                            filter: function(e) {
                                return t = t.filter(e), l
                            }
                        }
                    }
                }).options = oE({
                    async: !0,
                    ssr: !1
                }, a), u),
                oD = function() {},
                oM = Z.forwardRef(function(e, t) {
                    var r, n, o, a, i = Z.useRef(null),
                        l = Z.useState({
                            onScrollCapture: oD,
                            onWheelCapture: oD,
                            onTouchMoveCapture: oD
                        }),
                        c = l[0],
                        u = l[1],
                        s = e.forwardProps,
                        f = e.children,
                        d = e.className,
                        p = e.removeScrollBar,
                        m = e.enabled,
                        y = e.shards,
                        b = e.sideCar,
                        v = e.noRelative,
                        h = e.noIsolation,
                        g = e.inert,
                        O = e.allowPinchZoom,
                        w = e.as,
                        j = e.gapMode,
                        x = oA(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        S = (r = [i, t], n = function(e) {
                            return r.forEach(function(t) {
                                return oN(t, e)
                            })
                        }, (o = (0, Z.useState)(function() {
                            return {
                                value: null,
                                callback: n,
                                facade: {
                                    get current() {
                                        return o.value
                                    },
                                    set current(value) {
                                        var e = o.value;
                                        e !== value && (o.value = value, o.callback(value, e))
                                    }
                                }
                            }
                        })[0]).callback = n, a = o.facade, oR(function() {
                            var e = oT.get(a);
                            if (e) {
                                var t = new Set(e),
                                    n = new Set(r),
                                    o = a.current;
                                t.forEach(function(e) {
                                    n.has(e) || oN(e, null)
                                }), n.forEach(function(e) {
                                    t.has(e) || oN(e, o)
                                })
                            }
                            oT.set(a, r)
                        }, [r]), a),
                        P = oE(oE({}, x), c);
                    return Z.createElement(Z.Fragment, null, m && Z.createElement(b, {
                        sideCar: ok,
                        removeScrollBar: p,
                        shards: y,
                        noRelative: v,
                        noIsolation: h,
                        inert: g,
                        setCallbacks: u,
                        allowPinchZoom: !!O,
                        lockRef: i,
                        gapMode: j
                    }), s ? Z.cloneElement(Z.Children.only(f), oE(oE({}, P), {
                        ref: S
                    })) : Z.createElement(void 0 === w ? "div" : w, oE({}, P, {
                        className: d,
                        ref: S
                    }), f))
                });
            oM.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, oM.classNames = {
                fullWidth: oI,
                zeroRight: oC
            };
            var oL = function(e) {
                var t = e.sideCar,
                    r = oA(e, ["sideCar"]);
                if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                var n = t.read();
                if (!n) throw Error("Sidecar medium not found");
                return Z.createElement(n, oE({}, r))
            };
            oL.isSideCarExport = !0;
            var o_ = function() {
                    var e = 0,
                        t = null;
                    return {
                        add: function(n) {
                            if (0 == e && (t = function() {
                                    if (!document) return null;
                                    var e = document.createElement("style");
                                    e.type = "text/css";
                                    var t = q || r.nc;
                                    return t && e.setAttribute("nonce", t), e
                                }())) {
                                var o, a;
                                (o = t).styleSheet ? o.styleSheet.cssText = n : o.appendChild(document.createTextNode(n)), a = t, (document.head || document.getElementsByTagName("head")[0]).appendChild(a)
                            }
                            e++
                        },
                        remove: function() {
                            --e || !t || (t.parentNode && t.parentNode.removeChild(t), t = null)
                        }
                    }
                },
                oF = function() {
                    var e = o_();
                    return function(t, r) {
                        Z.useEffect(function() {
                            return e.add(t),
                                function() {
                                    e.remove()
                                }
                        }, [t && r])
                    }
                },
                oU = function() {
                    var e = oF();
                    return function(t) {
                        return e(t.styles, t.dynamic), null
                    }
                },
                oz = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                oK = function(e) {
                    return parseInt(e || "", 10) || 0
                },
                oH = function(e) {
                    var t = window.getComputedStyle(document.body),
                        r = t["padding" === e ? "paddingLeft" : "marginLeft"],
                        n = t["padding" === e ? "paddingTop" : "marginTop"],
                        o = t["padding" === e ? "paddingRight" : "marginRight"];
                    return [oK(r), oK(n), oK(o)]
                },
                oW = function(e) {
                    if (void 0 === e && (e = "margin"), "u" < typeof window) return oz;
                    var t = oH(e),
                        r = document.documentElement.clientWidth,
                        n = window.innerWidth;
                    return {
                        left: t[0],
                        top: t[1],
                        right: t[2],
                        gap: Math.max(0, n - r + t[2] - t[0])
                    }
                },
                oB = oU(),
                oV = "data-scroll-locked",
                oq = function(e, t, r, n) {
                    var o = e.left,
                        a = e.top,
                        i = e.right,
                        l = e.gap;
                    return void 0 === r && (r = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(n, ";\n   padding-right: ").concat(l, "px ").concat(n, ";\n  }\n  body[").concat(oV, "] {\n    overflow: hidden ").concat(n, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(n, ";"), "margin" === r && "\n    padding-left: ".concat(o, "px;\n    padding-top: ").concat(a, "px;\n    padding-right: ").concat(i, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(l, "px ").concat(n, ";\n    "), "padding" === r && "padding-right: ".concat(l, "px ").concat(n, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(oC, " {\n    right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(oI, " {\n    margin-right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(oC, " .").concat(oC, " {\n    right: 0 ").concat(n, ";\n  }\n  \n  .").concat(oI, " .").concat(oI, " {\n    margin-right: 0 ").concat(n, ";\n  }\n  \n  body[").concat(oV, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(l, "px;\n  }\n")
                },
                oX = function() {
                    var e = parseInt(document.body.getAttribute(oV) || "0", 10);
                    return isFinite(e) ? e : 0
                },
                o$ = function() {
                    Z.useEffect(function() {
                        return document.body.setAttribute(oV, (oX() + 1).toString()),
                            function() {
                                var e = oX() - 1;
                                e <= 0 ? document.body.removeAttribute(oV) : document.body.setAttribute(oV, e.toString())
                            }
                    }, [])
                },
                oG = function(e) {
                    var t = e.noRelative,
                        r = e.noImportant,
                        n = e.gapMode,
                        o = void 0 === n ? "margin" : n;
                    o$();
                    var a = Z.useMemo(function() {
                        return oW(o)
                    }, [o]);
                    return Z.createElement(oB, {
                        styles: oq(a, !t, o, r ? "" : "!important")
                    })
                },
                oY = !1;
            if ("u" > typeof window) try {
                var oQ = Object.defineProperty({}, "passive", {
                    get: function() {
                        return oY = !0, !0
                    }
                });
                window.addEventListener("test", oQ, oQ), window.removeEventListener("test", oQ, oQ)
            } catch (e) {
                oY = !1
            }
            var oZ = !!oY && {
                passive: !1
            };

            function oJ(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var o0 = function(e, t) {
                    if (!oJ(e, Element)) return !1;
                    var r = window.getComputedStyle(e);
                    return "hidden" !== r[t] && (r.overflowY !== r.overflowX || "TEXTAREA" === e.tagName || "visible" !== r[t])
                },
                o1 = function(e, t) {
                    var r = t.ownerDocument,
                        n = t;
                    do {
                        if ("u" > typeof ShadowRoot && oJ(n, ShadowRoot) && (n = n.host), o2(e, n)) {
                            var o = o8(e, n);
                            if (o[1] > o[2]) return !0
                        }
                        n = n.parentNode
                    } while (n && n !== r.body);
                    return !1
                },
                o2 = function(e, t) {
                    return "v" === e ? o0(t, "overflowY") : o0(t, "overflowX")
                },
                o8 = function(e, t) {
                    return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
                },
                o3 = function(e, t, r, n, o) {
                    var a, i = (a = window.getComputedStyle(t).direction, "h" === e && "rtl" === a ? -1 : 1),
                        l = i * n,
                        c = r.target,
                        u = t.contains(c),
                        s = !1,
                        f = l > 0,
                        d = 0,
                        p = 0;
                    do {
                        if (!c) break;
                        var m = o8(e, c),
                            y = m[0],
                            b = m[1] - m[2] - i * y;
                        (y || b) && o2(e, c) && (d += b, p += y);
                        var v = c.parentNode;
                        c = v && v.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? v.host : v
                    } while (!u && c !== document.body || u && (t.contains(c) || t === c));
                    return f && (o && 1 > Math.abs(d) || !o && l > d) ? s = !0 : !f && (o && 1 > Math.abs(p) || !o && -l > p) && (s = !0), s
                },
                o6 = function(e) {
                    return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
                },
                o4 = function(e) {
                    return [e.deltaX, e.deltaY]
                },
                o5 = function(e) {
                    return e && "current" in e ? e.current : e
                },
                o7 = 0,
                o9 = [],
                ae = (s = function(e) {
                    var t = Z.useRef([]),
                        r = Z.useRef([0, 0]),
                        n = Z.useRef(),
                        o = Z.useState(o7++)[0],
                        a = Z.useState(oU)[0],
                        i = Z.useRef(e);
                    Z.useEffect(function() {
                        i.current = e
                    }, [e]), Z.useEffect(function() {
                        if (e.inert) {
                            document.body.classList.add("block-interactivity-".concat(o));
                            var t = (function(e, t, r) {
                                if (r || 2 == arguments.length)
                                    for (var n, o = 0, a = t.length; o < a; o++) !n && o in t || (n || (n = Array.prototype.slice.call(t, 0, o)), n[o] = t[o]);
                                return e.concat(n || Array.prototype.slice.call(t))
                            })([e.lockRef.current], (e.shards || []).map(o5), !0).filter(Boolean);
                            return t.forEach(function(e) {
                                    return e.classList.add("allow-interactivity-".concat(o))
                                }),
                                function() {
                                    document.body.classList.remove("block-interactivity-".concat(o)), t.forEach(function(e) {
                                        return e.classList.remove("allow-interactivity-".concat(o))
                                    })
                                }
                        }
                    }, [e.inert, e.lockRef.current, e.shards]);
                    var l = Z.useCallback(function(e, t) {
                            if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !i.current.allowPinchZoom;
                            var o, a = o6(e),
                                l = r.current,
                                c = "deltaX" in e ? e.deltaX : l[0] - a[0],
                                u = "deltaY" in e ? e.deltaY : l[1] - a[1],
                                s = e.target,
                                f = Math.abs(c) > Math.abs(u) ? "h" : "v";
                            if ("touches" in e && "h" === f && "range" === s.type) return !1;
                            var d = o1(f, s);
                            if (!d) return !0;
                            if (d ? o = f : (o = "v" === f ? "h" : "v", d = o1(f, s)), !d) return !1;
                            if (!n.current && "changedTouches" in e && (c || u) && (n.current = o), !o) return !0;
                            var p = n.current || o;
                            return o3(p, t, e, "h" === p ? c : u, !0)
                        }, []),
                        c = Z.useCallback(function(e) {
                            if (o9.length && o9[o9.length - 1] === a) {
                                var r = "deltaY" in e ? o4(e) : o6(e),
                                    n = t.current.filter(function(t) {
                                        var n;
                                        return t.name === e.type && (t.target === e.target || e.target === t.shadowParent) && (n = t.delta, n[0] === r[0] && n[1] === r[1])
                                    })[0];
                                if (n && n.should) {
                                    e.cancelable && e.preventDefault();
                                    return
                                }
                                if (!n) {
                                    var o = (i.current.shards || []).map(o5).filter(Boolean).filter(function(t) {
                                        return t.contains(e.target)
                                    });
                                    (o.length > 0 ? l(e, o[0]) : !i.current.noIsolation) && e.cancelable && e.preventDefault()
                                }
                            }
                        }, []),
                        u = Z.useCallback(function(e, r, n, o) {
                            var a = {
                                name: e,
                                delta: r,
                                target: n,
                                should: o,
                                shadowParent: function(e) {
                                    for (var t, r, n = null; null !== e;) t = e, (null != (r = ShadowRoot) && "u" > typeof Symbol && r[Symbol.hasInstance] ? !!r[Symbol.hasInstance](t) : t instanceof r) && (n = e.host, e = e.host), e = e.parentNode;
                                    return n
                                }(n)
                            };
                            t.current.push(a), setTimeout(function() {
                                t.current = t.current.filter(function(e) {
                                    return e !== a
                                })
                            }, 1)
                        }, []),
                        s = Z.useCallback(function(e) {
                            r.current = o6(e), n.current = void 0
                        }, []),
                        f = Z.useCallback(function(t) {
                            u(t.type, o4(t), t.target, l(t, e.lockRef.current))
                        }, []),
                        d = Z.useCallback(function(t) {
                            u(t.type, o6(t), t.target, l(t, e.lockRef.current))
                        }, []);
                    Z.useEffect(function() {
                        return o9.push(a), e.setCallbacks({
                                onScrollCapture: f,
                                onWheelCapture: f,
                                onTouchMoveCapture: d
                            }), document.addEventListener("wheel", c, oZ), document.addEventListener("touchmove", c, oZ), document.addEventListener("touchstart", s, oZ),
                            function() {
                                o9 = o9.filter(function(e) {
                                    return e !== a
                                }), document.removeEventListener("wheel", c, oZ), document.removeEventListener("touchmove", c, oZ), document.removeEventListener("touchstart", s, oZ)
                            }
                    }, []);
                    var p = e.removeScrollBar,
                        m = e.inert;
                    return Z.createElement(Z.Fragment, null, m ? Z.createElement(a, {
                        styles: "\n  .block-interactivity-".concat(o, " {pointer-events: none;}\n  .allow-interactivity-").concat(o, " {pointer-events: all;}\n")
                    }) : null, p ? Z.createElement(oG, {
                        noRelative: e.noRelative,
                        gapMode: e.gapMode
                    }) : null)
                }, ok.useMedium(s), oL),
                at = Z.forwardRef(function(e, t) {
                    return Z.createElement(oM, oE({}, e, {
                        ref: t,
                        sideCar: ae
                    }))
                });
            at.classNames = oM.classNames;
            var ar = new WeakMap,
                an = new WeakMap,
                ao = {},
                aa = 0,
                ai = function(e) {
                    return e && (e.host || ai(e.parentNode))
                },
                al = function(e, t, r, n) {
                    var o = (Array.isArray(e) ? e : [e]).map(function(e) {
                        if (t.contains(e)) return e;
                        var r = ai(e);
                        return r && t.contains(r) ? r : (console.error("aria-hidden", e, "in not contained inside", t, ". Doing nothing"), null)
                    }).filter(function(e) {
                        return !!e
                    });
                    ao[r] || (ao[r] = new WeakMap);
                    var a = ao[r],
                        i = [],
                        l = new Set,
                        c = new Set(o),
                        u = function(e) {
                            !e || l.has(e) || (l.add(e), u(e.parentNode))
                        };
                    o.forEach(u);
                    var s = function(e) {
                        !e || c.has(e) || Array.prototype.forEach.call(e.children, function(e) {
                            if (l.has(e)) s(e);
                            else try {
                                var t = e.getAttribute(n),
                                    o = null !== t && "false" !== t,
                                    c = (ar.get(e) || 0) + 1,
                                    u = (a.get(e) || 0) + 1;
                                ar.set(e, c), a.set(e, u), i.push(e), 1 === c && o && an.set(e, !0), 1 === u && e.setAttribute(r, "true"), o || e.setAttribute(n, "true")
                            } catch (t) {
                                console.error("aria-hidden: cannot operate on ", e, t)
                            }
                        })
                    };
                    return s(t), l.clear(), aa++,
                        function() {
                            i.forEach(function(e) {
                                var t = ar.get(e) - 1,
                                    o = a.get(e) - 1;
                                ar.set(e, t), a.set(e, o), t || (an.has(e) || e.removeAttribute(n), an.delete(e)), o || e.removeAttribute(r)
                            }), --aa || (ar = new WeakMap, ar = new WeakMap, an = new WeakMap, ao = {})
                        }
                },
                ac = function(e, t, r) {
                    void 0 === r && (r = "data-aria-hidden");
                    var n = Array.from(Array.isArray(e) ? e : [e]),
                        o = t || ("u" < typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body);
                    return o ? (n.push.apply(n, Array.from(o.querySelectorAll("[aria-live], script"))), al(n, o, r, "aria-hidden")) : function() {
                        return null
                    }
                };

            function au(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function as(e) {
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

            function af(e, t) {
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

            function ad(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function ap(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return au(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return au(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var am = "Dialog",
                ay = ap(nB(am), 2),
                ab = ay[0];
            ay[1];
            var av = ap(ab(am), 2),
                ah = av[0],
                ag = av[1],
                aO = function(e) {
                    var t = e.__scopeDialog,
                        r = e.children,
                        n = e.open,
                        o = e.defaultOpen,
                        a = e.onOpenChange,
                        i = e.modal,
                        l = Z.useRef(null),
                        c = Z.useRef(null),
                        u = ap(n1({
                            prop: n,
                            defaultProp: o,
                            onChange: a
                        }), 2),
                        s = u[0],
                        f = u[1];
                    return (0, $.jsx)(ah, {
                        scope: t,
                        triggerRef: l,
                        contentRef: c,
                        contentId: nY(),
                        titleId: nY(),
                        descriptionId: nY(),
                        open: void 0 !== s && s,
                        onOpenChange: f,
                        onOpenToggle: Z.useCallback(function() {
                            return f(function(e) {
                                return !e
                            })
                        }, [f]),
                        modal: void 0 === i || i,
                        children: r
                    })
                };
            aO.displayName = am;
            var aw = "DialogTrigger";
            Z.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = ad(e, ["__scopeDialog"]),
                    o = ag(aw, r),
                    a = tG(t, o.triggerRef);
                return (0, $.jsx)(oi.button, af(as({
                    type: "button",
                    "aria-haspopup": "dialog",
                    "aria-expanded": o.open,
                    "aria-controls": o.contentId,
                    "data-state": aH(o.open)
                }, n), {
                    ref: a,
                    onClick: nF(e.onClick, o.onOpenToggle)
                }))
            }).displayName = aw;
            var aj = "DialogPortal",
                ax = ap(ab(aj, {
                    forceMount: void 0
                }), 2),
                aS = ax[0],
                aP = ax[1],
                aE = function(e) {
                    var t = e.__scopeDialog,
                        r = e.forceMount,
                        n = e.children,
                        o = e.container,
                        a = ag(aj, t);
                    return (0, $.jsx)(aS, {
                        scope: t,
                        forceMount: r,
                        children: Z.Children.map(n, function(e) {
                            return (0, $.jsx)(ox, {
                                present: r || a.open,
                                children: (0, $.jsx)(oO, {
                                    asChild: !0,
                                    container: o,
                                    children: e
                                })
                            })
                        })
                    })
                };
            aE.displayName = aj;
            var aA = "DialogOverlay",
                aC = Z.forwardRef(function(e, t) {
                    var r = aP(aA, e.__scopeDialog),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        a = ad(e, ["forceMount"]),
                        i = ag(aA, e.__scopeDialog);
                    return i.modal ? (0, $.jsx)(ox, {
                        present: o || i.open,
                        children: (0, $.jsx)(aN, af(as({}, a), {
                            ref: t
                        }))
                    }) : null
                });
            aC.displayName = aA;
            var aI = oe("DialogOverlay.RemoveScroll"),
                aN = Z.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = ad(e, ["__scopeDialog"]),
                        o = ag(aA, r);
                    return (0, $.jsx)(at, {
                        as: aI,
                        allowPinchZoom: !0,
                        shards: [o.contentRef],
                        children: (0, $.jsx)(oi.div, af(as({
                            "data-state": aH(o.open)
                        }, n), {
                            ref: t,
                            style: as({
                                pointerEvents: "auto"
                            }, n.style)
                        }))
                    })
                }),
                aR = "DialogContent",
                aT = Z.forwardRef(function(e, t) {
                    var r = aP(aR, e.__scopeDialog),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        a = ad(e, ["forceMount"]),
                        i = ag(aR, e.__scopeDialog);
                    return (0, $.jsx)(ox, {
                        present: o || i.open,
                        children: i.modal ? (0, $.jsx)(ak, af(as({}, a), {
                            ref: t
                        })) : (0, $.jsx)(aD, af(as({}, a), {
                            ref: t
                        }))
                    })
                });
            aT.displayName = aR;
            var ak = Z.forwardRef(function(e, t) {
                    var r = ag(aR, e.__scopeDialog),
                        n = Z.useRef(null),
                        o = tG(t, r.contentRef, n);
                    return Z.useEffect(function() {
                        var e = n.current;
                        if (e) return ac(e)
                    }, []), (0, $.jsx)(aM, af(as({}, e), {
                        ref: o,
                        trapFocus: r.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: nF(e.onCloseAutoFocus, function(e) {
                            var t;
                            e.preventDefault(), null == (t = r.triggerRef.current) || t.focus()
                        }),
                        onPointerDownOutside: nF(e.onPointerDownOutside, function(e) {
                            var t = e.detail.originalEvent,
                                r = 0 === t.button && !0 === t.ctrlKey;
                            (2 === t.button || r) && e.preventDefault()
                        }),
                        onFocusOutside: nF(e.onFocusOutside, function(e) {
                            return e.preventDefault()
                        })
                    }))
                }),
                aD = Z.forwardRef(function(e, t) {
                    var r = ag(aR, e.__scopeDialog),
                        n = Z.useRef(!1),
                        o = Z.useRef(!1);
                    return (0, $.jsx)(aM, af(as({}, e), {
                        ref: t,
                        trapFocus: !1,
                        disableOutsidePointerEvents: !1,
                        onCloseAutoFocus: function(t) {
                            var a, i;
                            null == (a = e.onCloseAutoFocus) || a.call(e, t), t.defaultPrevented || (n.current || null == (i = r.triggerRef.current) || i.focus(), t.preventDefault()), n.current = !1, o.current = !1
                        },
                        onInteractOutside: function(t) {
                            null == (a = e.onInteractOutside) || a.call(e, t), t.defaultPrevented || (n.current = !0, "pointerdown" === t.detail.originalEvent.type && (o.current = !0));
                            var a, i, l = t.target;
                            (null == (i = r.triggerRef.current) ? void 0 : i.contains(l)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && o.current && t.preventDefault()
                        }
                    }))
                }),
                aM = Z.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = e.trapFocus,
                        o = e.onOpenAutoFocus,
                        a = e.onCloseAutoFocus,
                        i = ad(e, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        l = ag(aR, r),
                        c = Z.useRef(null),
                        u = tG(t, c);
                    return (0, oP.useFocusGuards)(), (0, $.jsxs)($.Fragment, {
                        children: [(0, $.jsx)(op, {
                            asChild: !0,
                            loop: !0,
                            trapped: n,
                            onMountAutoFocus: o,
                            onUnmountAutoFocus: a,
                            children: (0, $.jsx)(n2.DismissableLayer, af(as({
                                role: "dialog",
                                id: l.contentId,
                                "aria-describedby": l.descriptionId,
                                "aria-labelledby": l.titleId,
                                "data-state": aH(l.open)
                            }, i), {
                                ref: u,
                                onDismiss: function() {
                                    return l.onOpenChange(!1)
                                }
                            }))
                        }), (0, $.jsxs)($.Fragment, {
                            children: [(0, $.jsx)(aq, {
                                titleId: l.titleId
                            }), (0, $.jsx)(aX, {
                                contentRef: c,
                                descriptionId: l.descriptionId
                            })]
                        })]
                    })
                }),
                aL = "DialogTitle",
                a_ = Z.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = ad(e, ["__scopeDialog"]),
                        o = ag(aL, r);
                    return (0, $.jsx)(oi.h2, af(as({
                        id: o.titleId
                    }, n), {
                        ref: t
                    }))
                });
            a_.displayName = aL;
            var aF = "DialogDescription",
                aU = Z.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = ad(e, ["__scopeDialog"]),
                        o = ag(aF, r);
                    return (0, $.jsx)(oi.p, af(as({
                        id: o.descriptionId
                    }, n), {
                        ref: t
                    }))
                });
            aU.displayName = aF;
            var az = "DialogClose",
                aK = Z.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = ad(e, ["__scopeDialog"]),
                        o = ag(az, r);
                    return (0, $.jsx)(oi.button, af(as({
                        type: "button"
                    }, n), {
                        ref: t,
                        onClick: nF(e.onClick, function() {
                            return o.onOpenChange(!1)
                        })
                    }))
                });

            function aH(e) {
                return e ? "open" : "closed"
            }
            aK.displayName = az;
            var aW = "DialogTitleWarning",
                aB = ap((f = {
                    contentName: aR,
                    titleName: aL,
                    docsSlug: "dialog"
                }, d = Z.createContext(f), (p = function(e) {
                    var t = e.children,
                        r = nH(e, ["children"]),
                        n = Z.useMemo(function() {
                            return r
                        }, Object.values(r));
                    return (0, $.jsx)(d.Provider, {
                        value: n,
                        children: t
                    })
                }).displayName = aW + "Provider", [p, function(e) {
                    var t = Z.useContext(d);
                    if (t) return t;
                    if (void 0 !== f) return f;
                    throw Error("`".concat(e, "` must be used within `").concat(aW, "`"))
                }]), 2),
                aV = (aB[0], aB[1]),
                aq = function(e) {
                    var t = e.titleId,
                        r = aV(aW),
                        n = "`".concat(r.contentName, "` requires a `").concat(r.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(r.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(r.docsSlug);
                    return Z.useEffect(function() {
                        t && (document.getElementById(t) || console.error(n))
                    }, [n, t]), null
                },
                aX = function(e) {
                    var t = e.contentRef,
                        r = e.descriptionId,
                        n = aV("DialogDescriptionWarning"),
                        o = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(n.contentName, "}.");
                    return Z.useEffect(function() {
                        var e, n = null == (e = t.current) ? void 0 : e.getAttribute("aria-describedby");
                        r && n && (document.getElementById(r) || console.warn(o))
                    }, [o, t, r]), null
                };

            function a$(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aG(e) {
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

            function aY(e, t) {
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

            function aQ(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function aZ(e) {
                return function(e) {
                    if (Array.isArray(e)) return a$(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return a$(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return a$(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function aJ(e) {
                var t, r, n = (t = e, (r = Z.forwardRef(function(e, t) {
                        var r = e.children,
                            n = aQ(e, ["children"]);
                        if (Z.isValidElement(r)) {
                            var o, a, i, l, c, u = (c = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                s = function(e, t) {
                                    var r = aG({}, t);
                                    for (var n in t) ! function(n) {
                                        var o = e[n],
                                            a = t[n];
                                        /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            var n = a.apply(void 0, aZ(t));
                                            return o.apply(void 0, aZ(t)), n
                                        } : o && (r[n] = o) : "style" === n ? r[n] = aG({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                                    }(n);
                                    return aG({}, e, r)
                                }(n, r.props);
                            return r.type !== Z.Fragment && (s.ref = t ? t$(t, u) : u), Z.cloneElement(r, s)
                        }
                        return Z.Children.count(r) > 1 ? Z.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), r),
                    o = Z.forwardRef(function(e, t) {
                        var r = e.children,
                            o = aQ(e, ["children"]),
                            a = Z.Children.toArray(r),
                            i = a.find(a1);
                        if (i) {
                            var l = i.props.children,
                                c = a.map(function(e) {
                                    return e !== i ? e : Z.Children.count(l) > 1 ? Z.Children.only(null) : Z.isValidElement(l) ? l.props.children : null
                                });
                            return (0, $.jsx)(n, aY(aG({}, o), {
                                ref: t,
                                children: Z.isValidElement(l) ? Z.cloneElement(l, void 0, c) : null
                            }))
                        }
                        return (0, $.jsx)(n, aY(aG({}, o), {
                            ref: t,
                            children: r
                        }))
                    });
                return o.displayName = "".concat(e, ".Slot"), o
            }
            var a0 = Symbol("radix.slottable");

            function a1(e) {
                return Z.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === a0
            }

            function a2(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function a8(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        a2(e, t, r[t])
                    })
                }
                return e
            }

            function a3(e, t) {
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
            var a6 = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
                var r = aJ("Primitive.".concat(t)),
                    n = Z.forwardRef(function(e, n) {
                        var o = e.asChild,
                            a = function(e, t) {
                                if (null == e) return {};
                                var r, n, o, a = {};
                                if ("u" > typeof Reflect && Reflect.ownKeys) {
                                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                    return a
                                }
                                if (a = function(e, t) {
                                        if (null == e) return {};
                                        var r, n, o = {},
                                            a = Object.getOwnPropertyNames(e);
                                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                        return o
                                    }(e, t), Object.getOwnPropertySymbols)
                                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }(e, ["asChild"]),
                            i = o ? r : t;
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, $.jsx)(i, a3(a8({}, a), {
                            ref: n
                        }))
                    });
                return n.displayName = "Primitive.".concat(t), a3(a8({}, e), a2({}, t, n))
            }, {});

            function a4(e) {
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
            var a5 = Object.freeze({
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
                a7 = Z.forwardRef(function(e, t) {
                    var r, n;
                    return (0, $.jsx)(a6.span, (r = a4({}, e), n = n = {
                        ref: t,
                        style: a4({}, a5, e.style)
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

            function a9(e) {
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

            function ie(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }
            a7.displayName = "VisuallyHidden";
            var it = (0, Z.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    hasDescription: !1,
                    type: "Default"
                }),
                ir = function() {
                    var e = (0, Z.useContext)(it);
                    if (!e) throw Error("Dialog components must be used within a Dialog");
                    return e
                },
                io = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                ia = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                ii = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                il = function(e) {
                    var t = e.open,
                        r = e.onOpenChange,
                        n = e.children,
                        o = e.size,
                        a = e.type,
                        i = void 0 === a ? "Default" : a,
                        l = e.isModal,
                        c = e.hasCloseAffordance,
                        u = e.closeLabel,
                        s = e.hasMarginTop,
                        f = void 0 === s || s,
                        d = e.hasMarginBottom,
                        p = void 0 === d || d,
                        m = e.hasDescription,
                        y = void 0 !== m && m,
                        b = e.experimentalDisablePointerEventsStylingOnBody,
                        v = void 0 !== b && b,
                        h = (0, Z.useMemo)(function() {
                            return {
                                size: o,
                                isModal: l,
                                type: i,
                                hasCloseAffordance: c,
                                closeLabel: u,
                                hasMarginTop: f,
                                hasMarginBottom: p,
                                hasDescription: y
                            }
                        }, [o, l, i, c, u, f, p, y]);
                    return (0, Z.useEffect)(function() {
                        v && setTimeout(function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }, 0)
                    }, [v, t]), J().createElement(it.Provider, {
                        value: h
                    }, J().createElement(aO, {
                        open: t,
                        onOpenChange: r
                    }, n))
                };
            il.displayName = "Dialog";
            var ic = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.style,
                    o = e.overlayClassName,
                    a = e.overlayStyle,
                    i = e.onOpenAutoFocus,
                    l = ie(e, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
                    c = ir(),
                    u = c.size,
                    s = c.isModal,
                    f = c.hasCloseAffordance,
                    d = c.closeLabel,
                    p = c.hasDescription,
                    m = tH("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", s && "bg-common-backdrop", o),
                    y = tH("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", r);
                return J().createElement(aE, null, J().createElement(aC, {
                    className: m,
                    style: a
                }, J().createElement(aT, a9({
                    className: y,
                    "data-size": u,
                    style: n,
                    onOpenAutoFocus: i
                }, !p && {
                    "aria-describedby": void 0
                }, l), f && J().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, J().createElement(aK, {
                    asChild: !0
                }, J().createElement(n_, {
                    variant: "OverMedia",
                    size: u,
                    isCircular: !0,
                    "aria-label": d
                }))), t)))
            };
            ic.displayName = "DialogContent";
            var iu = function(e) {
                var t = e.children,
                    r = e.className,
                    n = ie(e, ["children", "className"]),
                    o = ir(),
                    a = o.size,
                    i = o.hasMarginTop,
                    l = o.hasMarginBottom,
                    c = tH(io[a], i && ia[a], l && ii[a], r);
                return J().createElement("div", a9({
                    className: c
                }, n), t)
            };
            iu.displayName = "DialogBody";
            var is = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.hidden,
                    o = ie(e, ["children", "className", "hidden"]),
                    a = J().createElement(a_, a9({
                        className: r
                    }, o), t);
                return n ? J().createElement(a7, null, a) : a
            };
            is.displayName = "DialogTitle";
            var id = function(e) {
                var t = e.children,
                    r = e.className,
                    n = ie(e, ["children", "className"]),
                    o = ir().size,
                    a = tH(io[o], ii[o], r);
                return J().createElement("div", a9({
                    className: a
                }, n), t)
            };
            id.displayName = "DialogFooter";
            var ip = function(e) {
                var t = e.open,
                    r = e.title,
                    n = e.body,
                    o = e.footerNote,
                    a = e.actionText,
                    i = e.actionVariant,
                    l = e.neutralText,
                    c = e.showAction,
                    u = e.closeLabel,
                    s = e.onAction,
                    f = e.onCancel;
                return (0, $.jsx)(il, {
                    open: t,
                    onOpenChange: function(e) {
                        e || f()
                    },
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !0,
                    closeLabel: u,
                    children: (0, $.jsxs)(ic, {
                        style: {
                            width: "100%"
                        },
                        children: [(0, $.jsxs)(iu, {
                            children: [(0, $.jsx)(is, {
                                children: r
                            }), (0, $.jsx)("div", {
                                className: "text-content-emphasis",
                                children: n
                            })]
                        }), (0, $.jsxs)(id, {
                            children: [(0, $.jsxs)("div", {
                                className: "flex gap-x-small",
                                children: [(void 0 === c || c) && (0, $.jsx)(nS, {
                                    variant: void 0 === i ? "Emphasis" : i,
                                    size: "Medium",
                                    className: "fill basis-0",
                                    onClick: function() {
                                        null == s || s()
                                    },
                                    children: a
                                }), (0, $.jsx)(nS, {
                                    variant: "Standard",
                                    size: "Medium",
                                    className: "fill basis-0",
                                    onClick: f,
                                    children: l
                                })]
                            }), o && (0, $.jsx)("div", {
                                className: "padding-top-medium",
                                children: o
                            })]
                        })]
                    })
                })
            };

            function im(e) {
                var t = e.className;
                return J().createElement("svg", {
                    xmlns: "http://www.w3.org/2000/svg",
                    width: "13",
                    height: "6",
                    viewBox: "0 0 13 6",
                    fill: "none",
                    className: tH("block", t),
                    style: {
                        marginTop: -1
                    }
                }, J().createElement("path", {
                    d: "M0.249999 0.666628L4.83579 5.25241C5.61683 6.03346 6.88316 6.03346 7.66421 5.25241L12.25 0.666626L0.249999 0.666628Z",
                    fill: "currentColor"
                }))
            }

            function iy(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    o = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === o || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function ib(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iv(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function ih() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map(function(t) {
                            var n = iv(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        });
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : iv(t[e], null)
                        }
                    }
                }
            }

            function ig() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return Z.useCallback(ih.apply(void 0, function(e) {
                    if (Array.isArray(e)) return ib(e)
                }(t) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return ib(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ib(e, void 0)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function iO(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iw(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function ij(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        iw(e, t, r[t])
                    })
                }
                return e
            }

            function ix(e) {
                return function(e) {
                    if (Array.isArray(e)) return iO(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return iO(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return iO(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function iS(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    r = [],
                    n = function() {
                        var t = r.map(function(e) {
                            return Z.createContext(e)
                        });
                        return function(r) {
                            var n = (null == r ? void 0 : r[e]) || t;
                            return Z.useMemo(function() {
                                var t, o;
                                return iw({}, "__scope".concat(e), (t = ij({}, r), o = null != (o = iw({}, e, n)) ? o : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(o)) : (function(e) {
                                    var t = Object.keys(e);
                                    if (Object.getOwnPropertySymbols) {
                                        var r = Object.getOwnPropertySymbols(e);
                                        t.push.apply(t, r)
                                    }
                                    return t
                                })(Object(o)).forEach(function(e) {
                                    Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(o, e))
                                }), t))
                            }, [r, n])
                        }
                    };
                return n.scopeName = e, [function(t, n) {
                    var o = Z.createContext(n),
                        a = r.length;
                    r = ix(r).concat([n]);
                    var i = function(t) {
                        var r, n = t.scope,
                            i = t.children,
                            l = function(e, t) {
                                if (null == e) return {};
                                var r, n, o, a = {};
                                if ("u" > typeof Reflect && Reflect.ownKeys) {
                                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                    return a
                                }
                                if (a = function(e, t) {
                                        if (null == e) return {};
                                        var r, n, o = {},
                                            a = Object.getOwnPropertyNames(e);
                                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                        return o
                                    }(e, t), Object.getOwnPropertySymbols)
                                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }(t, ["scope", "children"]),
                            c = (null == n || null == (r = n[e]) ? void 0 : r[a]) || o,
                            u = Z.useMemo(function() {
                                return l
                            }, Object.values(l));
                        return (0, $.jsx)(c.Provider, {
                            value: u,
                            children: i
                        })
                    };
                    return i.displayName = t + "Provider", [i, function(r, i) {
                        var l, c = (null == i || null == (l = i[e]) ? void 0 : l[a]) || o,
                            u = Z.useContext(c);
                        if (u) return u;
                        if (void 0 !== n) return n;
                        throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                    }]
                }, iP.apply(void 0, [n].concat(ix(t)))]
            }

            function iP() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                var n = t[0];
                if (1 === t.length) return n;
                var o = function() {
                    var e = t.map(function(e) {
                        return {
                            useScope: e(),
                            scopeName: e.scopeName
                        }
                    });
                    return function(t) {
                        var r = e.reduce(function(e, r) {
                            var n = r.useScope,
                                o = r.scopeName;
                            return ij({}, e, n(t)["__scope".concat(o)])
                        }, {});
                        return Z.useMemo(function() {
                            return iw({}, "__scope".concat(n.scopeName), r)
                        }, [r])
                    }
                };
                return o.scopeName = n.scopeName, o
            }
            var iE = (null == (X = globalThis) ? void 0 : X.document) ? Z.useLayoutEffect : function() {};

            function iA(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var iC = Z["useId".toString()] || function() {},
                iI = 0,
                iN = ["top", "right", "bottom", "left"],
                iR = Math.min,
                iT = Math.max,
                ik = Math.round,
                iD = Math.floor,
                iM = function(e) {
                    return {
                        x: e,
                        y: e
                    }
                },
                iL = {
                    left: "right",
                    right: "left",
                    bottom: "top",
                    top: "bottom"
                },
                i_ = {
                    start: "end",
                    end: "start"
                };

            function iF(e, t) {
                return "function" == typeof e ? e(t) : e
            }

            function iU(e) {
                return e.split("-")[0]
            }

            function iz(e) {
                return e.split("-")[1]
            }

            function iK(e) {
                return "x" === e ? "y" : "x"
            }

            function iH(e) {
                return "y" === e ? "height" : "width"
            }
            var iW = new Set(["top", "bottom"]);

            function iB(e) {
                return iW.has(iU(e)) ? "y" : "x"
            }

            function iV(e) {
                return e.replace(/start|end/g, function(e) {
                    return i_[e]
                })
            }
            var iq = ["left", "right"],
                iX = ["right", "left"],
                i$ = ["top", "bottom"],
                iG = ["bottom", "top"];

            function iY(e) {
                return e.replace(/left|right|bottom|top/g, function(e) {
                    return iL[e]
                })
            }

            function iQ(e) {
                return "number" != typeof e ? function(e) {
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
                    top: 0,
                    right: 0,
                    bottom: 0,
                    left: 0
                }, e) : {
                    top: e,
                    right: e,
                    bottom: e,
                    left: e
                }
            }

            function iZ(e) {
                var t = e.x,
                    r = e.y,
                    n = e.width,
                    o = e.height;
                return {
                    width: n,
                    height: o,
                    top: r,
                    left: t,
                    right: t + n,
                    bottom: r + o,
                    x: t,
                    y: r
                }
            }

            function iJ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function i0(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function i1(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            i0(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            i0(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function i2(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function i8(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        i2(e, t, r[t])
                    })
                }
                return e
            }

            function i3(e, t) {
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

            function i6(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function i4(e) {
                return function(e) {
                    if (Array.isArray(e)) return iJ(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return iJ(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return iJ(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function i5(e, t) {
                var r, n, o, a = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(i, "next", {
                    value: c(0)
                }), l(i, "throw", {
                    value: c(1)
                }), l(i, "return", {
                    value: c(2)
                }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function c(l) {
                    return function(c) {
                        var u = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, u[0] && (a = 0)), a;) try {
                            if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                            switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                case 0:
                                case 1:
                                    o = u;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                        a.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && a.label < o[1]) {
                                        a.label = o[1], o = u;
                                        break
                                    }
                                    if (o && a.label < o[2]) {
                                        a.label = o[2], a.ops.push(u);
                                        break
                                    }
                                    o[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            u = t.call(e, a)
                        } catch (e) {
                            u = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function i7(e, t, r) {
                var n, o = e.reference,
                    a = e.floating,
                    i = iB(t),
                    l = iK(iB(t)),
                    c = iH(l),
                    u = iU(t),
                    s = "y" === i,
                    f = o.x + o.width / 2 - a.width / 2,
                    d = o.y + o.height / 2 - a.height / 2,
                    p = o[c] / 2 - a[c] / 2;
                switch (u) {
                    case "top":
                        n = {
                            x: f,
                            y: o.y - a.height
                        };
                        break;
                    case "bottom":
                        n = {
                            x: f,
                            y: o.y + o.height
                        };
                        break;
                    case "right":
                        n = {
                            x: o.x + o.width,
                            y: d
                        };
                        break;
                    case "left":
                        n = {
                            x: o.x - a.width,
                            y: d
                        };
                        break;
                    default:
                        n = {
                            x: o.x,
                            y: o.y
                        }
                }
                switch (iz(t)) {
                    case "start":
                        n[l] -= p * (r && s ? -1 : 1);
                        break;
                    case "end":
                        n[l] += p * (r && s ? -1 : 1)
                }
                return n
            }

            function i9(e, t) {
                return i1(function() {
                    var r, n, o, a, i, l, c, u, s, f, d, p, m, y, b, v, h, g, O, w, j, x, S, P, E, A, C, I, N, R, T;
                    return i5(this, function(k) {
                        switch (k.label) {
                            case 0:
                                return void 0 === t && (t = {}), n = e.x, o = e.y, a = e.platform, i = e.rects, l = e.elements, c = e.strategy, f = void 0 === (s = (u = iF(t, e)).boundary) ? "clippingAncestors" : s, p = void 0 === (d = u.rootBoundary) ? "viewport" : d, y = void 0 === (m = u.elementContext) ? "floating" : m, v = void 0 !== (b = u.altBoundary) && b, g = iQ(void 0 === (h = u.padding) ? 0 : h), O = "floating" === y ? "reference" : "floating", w = l[v ? O : y], x = a.getClippingRect, S = {}, [4, null == a.isElement ? void 0 : a.isElement(w)];
                            case 1:
                                if (!(null == (r = k.sent()) || r)) return [3, 2];
                                return P = w, [3, 5];
                            case 2:
                                if (E = w.contextElement) return [3, 4];
                                return [4, null == a.getDocumentElement ? void 0 : a.getDocumentElement(l.floating)];
                            case 3:
                                E = k.sent(), k.label = 4;
                            case 4:
                                P = E, k.label = 5;
                            case 5:
                                return [4, x.apply(a, [(S.element = P, S.boundary = f, S.rootBoundary = p, S.strategy = c, S)])];
                            case 6:
                                return j = iZ.apply(void 0, [k.sent()]), A = "floating" === y ? {
                                    x: n,
                                    y: o,
                                    width: i.floating.width,
                                    height: i.floating.height
                                } : i.reference, [4, null == a.getOffsetParent ? void 0 : a.getOffsetParent(l.floating)];
                            case 7:
                                return C = k.sent(), [4, null == a.isElement ? void 0 : a.isElement(C)];
                            case 8:
                                if (!k.sent()) return [3, 10];
                                return [4, null == a.getScale ? void 0 : a.getScale(C)];
                            case 9:
                                return N = k.sent() || {
                                    x: 1,
                                    y: 1
                                }, [3, 11];
                            case 10:
                                N = {
                                    x: 1,
                                    y: 1
                                }, k.label = 11;
                            case 11:
                                if (I = N, !a.convertOffsetParentRelativeRectToViewportRelativeRect) return [3, 13];
                                return [4, a.convertOffsetParentRelativeRectToViewportRelativeRect({
                                    elements: l,
                                    rect: A,
                                    offsetParent: C,
                                    strategy: c
                                })];
                            case 12:
                                return T = k.sent(), [3, 14];
                            case 13:
                                T = A, k.label = 14;
                            case 14:
                                return R = iZ.apply(void 0, [T]), [2, {
                                    top: (j.top - R.top + g.top) / I.y,
                                    bottom: (R.bottom - j.bottom + g.bottom) / I.y,
                                    left: (j.left - R.left + g.left) / I.x,
                                    right: (R.right - j.right + g.right) / I.x
                                }]
                        }
                    })
                })()
            }

            function le(e, t) {
                return {
                    top: e.top - t.height,
                    right: e.right - t.width,
                    bottom: e.bottom - t.height,
                    left: e.left - t.width
                }
            }

            function lt(e) {
                return iN.some(function(t) {
                    return e[t] >= 0
                })
            }
            var lr = new Set(["left", "top"]);

            function ln(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function lo() {
                return "u" > typeof window
            }

            function la(e) {
                return lc(e) ? (e.nodeName || "").toLowerCase() : "#document"
            }

            function li(e) {
                var t;
                return (null == e || null == (t = e.ownerDocument) ? void 0 : t.defaultView) || window
            }

            function ll(e) {
                var t;
                return null == (t = (lc(e) ? e.ownerDocument : e.document) || window.document) ? void 0 : t.documentElement
            }

            function lc(e) {
                return !!lo() && (ln(e, Node) || ln(e, li(e).Node))
            }

            function lu(e) {
                return !!lo() && (ln(e, Element) || ln(e, li(e).Element))
            }

            function ls(e) {
                return !!lo() && (ln(e, HTMLElement) || ln(e, li(e).HTMLElement))
            }

            function lf(e) {
                return !(!lo() || "u" < typeof ShadowRoot) && (ln(e, ShadowRoot) || ln(e, li(e).ShadowRoot))
            }
            var ld = new Set(["inline", "contents"]);

            function lp(e) {
                var t = lS(e),
                    r = t.overflow,
                    n = t.overflowX,
                    o = t.overflowY,
                    a = t.display;
                return /auto|scroll|overlay|hidden|clip/.test(r + o + n) && !ld.has(a)
            }
            var lm = new Set(["table", "td", "th"]),
                ly = [":popover-open", ":modal"];

            function lb(e) {
                return ly.some(function(t) {
                    try {
                        return e.matches(t)
                    } catch (e) {
                        return !1
                    }
                })
            }
            var lv = ["transform", "translate", "scale", "rotate", "perspective"],
                lh = ["transform", "translate", "scale", "rotate", "perspective", "filter"],
                lg = ["paint", "layout", "strict", "content"];

            function lO(e) {
                var t = lw(),
                    r = lu(e) ? lS(e) : e;
                return lv.some(function(e) {
                    return !!r[e] && "none" !== r[e]
                }) || !!r.containerType && "normal" !== r.containerType || !t && !!r.backdropFilter && "none" !== r.backdropFilter || !t && !!r.filter && "none" !== r.filter || lh.some(function(e) {
                    return (r.willChange || "").includes(e)
                }) || lg.some(function(e) {
                    return (r.contain || "").includes(e)
                })
            }

            function lw() {
                return !("u" < typeof CSS) && !!CSS.supports && CSS.supports("-webkit-backdrop-filter", "none")
            }
            var lj = new Set(["html", "body", "#document"]);

            function lx(e) {
                return lj.has(la(e))
            }

            function lS(e) {
                return li(e).getComputedStyle(e)
            }

            function lP(e) {
                return lu(e) ? {
                    scrollLeft: e.scrollLeft,
                    scrollTop: e.scrollTop
                } : {
                    scrollLeft: e.scrollX,
                    scrollTop: e.scrollY
                }
            }

            function lE(e) {
                if ("html" === la(e)) return e;
                var t = e.assignedSlot || e.parentNode || lf(e) && e.host || ll(e);
                return lf(t) ? t.host : t
            }

            function lA(e, t, r) {
                void 0 === t && (t = []), void 0 === r && (r = !0);
                var n, o = function e(t) {
                        var r = lE(t);
                        return lx(r) ? t.ownerDocument ? t.ownerDocument.body : t.body : ls(r) && lp(r) ? r : e(r)
                    }(e),
                    a = o === (null == (n = e.ownerDocument) ? void 0 : n.body),
                    i = li(o);
                if (a) {
                    var l = lC(i);
                    return t.concat(i, i.visualViewport || [], lp(o) ? o : [], l && r ? lA(l) : [])
                }
                return t.concat(o, lA(o, [], r))
            }

            function lC(e) {
                return e.parent && Object.getPrototypeOf(e.parent) ? e.frameElement : null
            }

            function lI(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lN(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function lR(e) {
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

            function lT(e, t) {
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

            function lk(e) {
                return function(e) {
                    if (Array.isArray(e)) return lI(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || lD(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function lD(e, t) {
                if (e) {
                    if ("string" == typeof e) return lI(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return lI(e, t)
                }
            }

            function lM(e) {
                var t = lS(e),
                    r = parseFloat(t.width) || 0,
                    n = parseFloat(t.height) || 0,
                    o = ls(e),
                    a = o ? e.offsetWidth : r,
                    i = o ? e.offsetHeight : n,
                    l = ik(r) !== a || ik(n) !== i;
                return l && (r = a, n = i), {
                    width: r,
                    height: n,
                    $: l
                }
            }

            function lL(e) {
                return lu(e) ? e : e.contextElement
            }

            function l_(e) {
                var t = lL(e);
                if (!ls(t)) return iM(1);
                var r = t.getBoundingClientRect(),
                    n = lM(t),
                    o = n.width,
                    a = n.height,
                    i = n.$,
                    l = (i ? ik(r.width) : r.width) / o,
                    c = (i ? ik(r.height) : r.height) / a;
                return l && Number.isFinite(l) || (l = 1), c && Number.isFinite(c) || (c = 1), {
                    x: l,
                    y: c
                }
            }
            var lF = iM(0);

            function lU(e) {
                var t = li(e);
                return lw() && t.visualViewport ? {
                    x: t.visualViewport.offsetLeft,
                    y: t.visualViewport.offsetTop
                } : lF
            }

            function lz(e, t, r, n) {
                void 0 === t && (t = !1), void 0 === r && (r = !1);
                var o, a = e.getBoundingClientRect(),
                    i = lL(e),
                    l = iM(1);
                t && (n ? lu(n) && (l = l_(n)) : l = l_(e));
                var c = (void 0 === (o = r) && (o = !1), n && (!o || n === li(i)) && o) ? lU(i) : iM(0),
                    u = (a.left + c.x) / l.x,
                    s = (a.top + c.y) / l.y,
                    f = a.width / l.x,
                    d = a.height / l.y;
                if (i)
                    for (var p = li(i), m = n && lu(n) ? li(n) : n, y = p, b = lC(y); b && n && m !== y;) {
                        var v = l_(b),
                            h = b.getBoundingClientRect(),
                            g = lS(b),
                            O = h.left + (b.clientLeft + parseFloat(g.paddingLeft)) * v.x,
                            w = h.top + (b.clientTop + parseFloat(g.paddingTop)) * v.y;
                        u *= v.x, s *= v.y, f *= v.x, d *= v.y, u += O, s += w, b = lC(y = li(b))
                    }
                return iZ({
                    width: f,
                    height: d,
                    x: u,
                    y: s
                })
            }

            function lK(e, t) {
                var r = lP(e).scrollLeft;
                return t ? t.left + r : lz(ll(e)).left + r
            }

            function lH(e, t) {
                var r = e.getBoundingClientRect();
                return {
                    x: r.left + t.scrollLeft - lK(e, r),
                    y: r.top + t.scrollTop
                }
            }
            var lW = new Set(["absolute", "fixed"]);

            function lB(e, t, r) {
                if ("viewport" === t) n = function(e, t) {
                    var r = li(e),
                        n = ll(e),
                        o = r.visualViewport,
                        a = n.clientWidth,
                        i = n.clientHeight,
                        l = 0,
                        c = 0;
                    if (o) {
                        a = o.width, i = o.height;
                        var u = lw();
                        (!u || u && "fixed" === t) && (l = o.offsetLeft, c = o.offsetTop)
                    }
                    var s = lK(n);
                    if (s <= 0) {
                        var f = n.ownerDocument,
                            d = f.body,
                            p = getComputedStyle(d),
                            m = "CSS1Compat" === f.compatMode && parseFloat(p.marginLeft) + parseFloat(p.marginRight) || 0,
                            y = Math.abs(n.clientWidth - d.clientWidth - m);
                        y <= 25 && (a -= y)
                    } else s <= 25 && (a += s);
                    return {
                        width: a,
                        height: i,
                        x: l,
                        y: c
                    }
                }(e, r);
                else if ("document" === t) o = ll(e), a = ll(o), i = lP(o), l = o.ownerDocument.body, c = iT(a.scrollWidth, a.clientWidth, l.scrollWidth, l.clientWidth), u = iT(a.scrollHeight, a.clientHeight, l.scrollHeight, l.clientHeight), s = -i.scrollLeft + lK(o), f = -i.scrollTop, "rtl" === lS(l).direction && (s += iT(a.clientWidth, l.clientWidth) - c), n = {
                    width: c,
                    height: u,
                    x: s,
                    y: f
                };
                else if (lu(t)) p = (d = lz(t, !0, "fixed" === r)).top + t.clientTop, m = d.left + t.clientLeft, y = ls(t) ? l_(t) : iM(1), n = {
                    width: t.clientWidth * y.x,
                    height: t.clientHeight * y.y,
                    x: m * y.x,
                    y: p * y.y
                };
                else {
                    var n, o, a, i, l, c, u, s, f, d, p, m, y, b = lU(e);
                    n = {
                        x: t.x - b.x,
                        y: t.y - b.y,
                        width: t.width,
                        height: t.height
                    }
                }
                return iZ(n)
            }

            function lV(e, t, r) {
                var n = ls(t),
                    o = ll(t),
                    a = "fixed" === r,
                    i = lz(e, !0, a, t),
                    l = {
                        scrollLeft: 0,
                        scrollTop: 0
                    },
                    c = iM(0);
                if (n || !n && !a)
                    if (("body" !== la(t) || lp(o)) && (l = lP(t)), n) {
                        var u = lz(t, !0, a, t);
                        c.x = u.x + t.clientLeft, c.y = u.y + t.clientTop
                    } else o && (c.x = lK(o));
                a && !n && o && (c.x = lK(o));
                var s = !o || n || a ? iM(0) : lH(o, l);
                return {
                    x: i.left + l.scrollLeft - c.x - s.x,
                    y: i.top + l.scrollTop - c.y - s.y,
                    width: i.width,
                    height: i.height
                }
            }

            function lq(e) {
                return "static" === lS(e).position
            }

            function lX(e, t) {
                if (!ls(e) || "fixed" === lS(e).position) return null;
                if (t) return t(e);
                var r = e.offsetParent;
                return ll(e) === r && (r = r.ownerDocument.body), r
            }

            function l$(e, t) {
                var r, n = li(e);
                if (lb(e)) return n;
                if (!ls(e)) {
                    for (var o = lE(e); o && !lx(o);) {
                        if (lu(o) && !lq(o)) return o;
                        o = lE(o)
                    }
                    return n
                }
                for (var a = lX(e, t); a && (r = a, lm.has(la(r))) && lq(a);) a = lX(a, t);
                return a && lx(a) && lq(a) && !lO(a) ? n : a || function(e) {
                    for (var t = lE(e); ls(t) && !lx(t);) {
                        if (lO(t)) return t;
                        if (lb(t)) break;
                        t = lE(t)
                    }
                    return null
                }(e) || n
            }
            var lG = {
                convertOffsetParentRelativeRectToViewportRelativeRect: function(e) {
                    var t = e.elements,
                        r = e.rect,
                        n = e.offsetParent,
                        o = "fixed" === e.strategy,
                        a = ll(n),
                        i = !!t && lb(t.floating);
                    if (n === a || i && o) return r;
                    var l = {
                            scrollLeft: 0,
                            scrollTop: 0
                        },
                        c = iM(1),
                        u = iM(0),
                        s = ls(n);
                    if ((s || !s && !o) && (("body" !== la(n) || lp(a)) && (l = lP(n)), ls(n))) {
                        var f = lz(n);
                        c = l_(n), u.x = f.x + n.clientLeft, u.y = f.y + n.clientTop
                    }
                    var d = !a || s || o ? iM(0) : lH(a, l);
                    return {
                        width: r.width * c.x,
                        height: r.height * c.y,
                        x: r.x * c.x - l.scrollLeft * c.x + u.x + d.x,
                        y: r.y * c.y - l.scrollTop * c.y + u.y + d.y
                    }
                },
                getDocumentElement: ll,
                getClippingRect: function(e) {
                    var t = e.element,
                        r = e.boundary,
                        n = e.rootBoundary,
                        o = e.strategy,
                        a = lk("clippingAncestors" === r ? lb(t) ? [] : function(e, t) {
                            var r = t.get(e);
                            if (r) return r;
                            for (var n = lA(e, [], !1).filter(function(e) {
                                    return lu(e) && "body" !== la(e)
                                }), o = null, a = "fixed" === lS(e).position, i = a ? lE(e) : e; lu(i) && !lx(i);) {
                                var l = lS(i),
                                    c = lO(i);
                                c || "fixed" !== l.position || (o = null), (a ? !c && !o : !c && "static" === l.position && !!o && lW.has(o.position) || lp(i) && !c && function e(t, r) {
                                    var n = lE(t);
                                    return !(n === r || !lu(n) || lx(n)) && ("fixed" === lS(n).position || e(n, r))
                                }(e, i)) ? n = n.filter(function(e) {
                                    return e !== i
                                }) : o = l, i = lE(i)
                            }
                            return t.set(e, n), n
                        }(t, this._c) : [].concat(r)).concat([n]),
                        i = a[0],
                        l = a.reduce(function(e, r) {
                            var n = lB(t, r, o);
                            return e.top = iT(n.top, e.top), e.right = iR(n.right, e.right), e.bottom = iR(n.bottom, e.bottom), e.left = iT(n.left, e.left), e
                        }, lB(t, i, o));
                    return {
                        width: l.right - l.left,
                        height: l.bottom - l.top,
                        x: l.left,
                        y: l.top
                    }
                },
                getOffsetParent: l$,
                getElementRects: function(e) {
                    var t;
                    return (t = function() {
                        var t, r, n, o;
                        return function(e, t) {
                            var r, n, o, a = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                l = Object.defineProperty;
                            return l(i, "next", {
                                value: c(0)
                            }), l(i, "throw", {
                                value: c(1)
                            }), l(i, "return", {
                                value: c(2)
                            }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                                value: function() {
                                    return this
                                }
                            }), i;

                            function c(l) {
                                return function(c) {
                                    var u = [l, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; i && (i = 0, u[0] && (a = 0)), a;) try {
                                        if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                        switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                            case 0:
                                            case 1:
                                                o = u;
                                                break;
                                            case 4:
                                                return a.label++, {
                                                    value: u[1],
                                                    done: !1
                                                };
                                            case 5:
                                                a.label++, n = u[1], u = [0];
                                                continue;
                                            case 7:
                                                u = a.ops.pop(), a.trys.pop();
                                                continue;
                                            default:
                                                if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                    a = 0;
                                                    continue
                                                }
                                                if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                    a.label = u[1];
                                                    break
                                                }
                                                if (6 === u[0] && a.label < o[1]) {
                                                    a.label = o[1], o = u;
                                                    break
                                                }
                                                if (o && a.label < o[2]) {
                                                    a.label = o[2], a.ops.push(u);
                                                    break
                                                }
                                                o[2] && a.ops.pop(), a.trys.pop();
                                                continue
                                        }
                                        u = t.call(e, a)
                                    } catch (e) {
                                        u = [6, e], n = 0
                                    } finally {
                                        r = o = 0
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
                                    return t = this.getOffsetParent || l$, [4, (0, this.getDimensions)(e.floating)];
                                case 1:
                                    return r = a.sent(), n = {}, o = [e.reference], [4, t(e.floating)];
                                case 2:
                                    return [2, (n.reference = lV.apply(void 0, o.concat([a.sent(), e.strategy])), n.floating = {
                                        x: 0,
                                        y: 0,
                                        width: r.width,
                                        height: r.height
                                    }, n)]
                            }
                        })
                    }, function() {
                        var e = this,
                            r = arguments;
                        return new Promise(function(n, o) {
                            var a = t.apply(e, r);

                            function i(e) {
                                lN(a, n, o, i, l, "next", e)
                            }

                            function l(e) {
                                lN(a, n, o, i, l, "throw", e)
                            }
                            i(void 0)
                        })
                    }).call(this)
                },
                getClientRects: function(e) {
                    return Array.from(e.getClientRects())
                },
                getDimensions: function(e) {
                    var t = lM(e);
                    return {
                        width: t.width,
                        height: t.height
                    }
                },
                getScale: l_,
                isElement: lu,
                isRTL: function(e) {
                    return "rtl" === lS(e).direction
                }
            };

            function lY(e, t) {
                return e.x === t.x && e.y === t.y && e.width === t.width && e.height === t.height
            }

            function lQ(e, t, r, n) {
                void 0 === n && (n = {});
                var o, a = n.ancestorScroll,
                    i = void 0 === a || a,
                    l = n.ancestorResize,
                    c = void 0 === l || l,
                    u = n.elementResize,
                    s = void 0 === u ? "function" == typeof ResizeObserver : u,
                    f = n.layoutShift,
                    d = void 0 === f ? "function" == typeof IntersectionObserver : f,
                    p = n.animationFrame,
                    m = void 0 !== p && p,
                    y = lL(e),
                    b = i || c ? lk(y ? lA(y) : []).concat(lk(lA(t))) : [];
                b.forEach(function(e) {
                    i && e.addEventListener("scroll", r, {
                        passive: !0
                    }), c && e.addEventListener("resize", r)
                });
                var v = y && d ? function(e, t) {
                        var r, n = null,
                            o = ll(e);

                        function a() {
                            var e;
                            clearTimeout(r), null == (e = n) || e.disconnect(), n = null
                        }
                        return ! function i(l, c) {
                            void 0 === l && (l = !1), void 0 === c && (c = 1), a();
                            var u = e.getBoundingClientRect(),
                                s = u.left,
                                f = u.top,
                                d = u.width,
                                p = u.height;
                            if (l || t(), d && p) {
                                var m = {
                                        rootMargin: -iD(f) + "px " + -iD(o.clientWidth - (s + d)) + "px " + -iD(o.clientHeight - (f + p)) + "px " + -iD(s) + "px",
                                        threshold: iT(0, iR(1, c)) || 1
                                    },
                                    y = !0;
                                try {
                                    n = new IntersectionObserver(b, lT(lR({}, m), {
                                        root: o.ownerDocument
                                    }))
                                } catch (e) {
                                    n = new IntersectionObserver(b, m)
                                }
                                n.observe(e)
                            }

                            function b(t) {
                                var n = t[0].intersectionRatio;
                                if (n !== c) {
                                    if (!y) return i();
                                    n ? i(!1, n) : r = setTimeout(function() {
                                        i(!1, 1e-7)
                                    }, 1e3)
                                }
                                1 !== n || lY(u, e.getBoundingClientRect()) || i(), y = !1
                            }
                        }(!0), a
                    }(y, r) : null,
                    h = -1,
                    g = null;
                s && (g = new ResizeObserver(function(e) {
                    var n = (function(e) {
                        if (Array.isArray(e)) return e
                    }(e) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                a = !0,
                                i = !1;
                            try {
                                for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); a = !0);
                            } catch (e) {
                                i = !0, r = e
                            } finally {
                                try {
                                    a || null == n.return || n.return()
                                } finally {
                                    if (i) throw r
                                }
                            }
                            return o
                        }
                    }(e) || lD(e, 1) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }())[0];
                    n && n.target === y && g && (g.unobserve(t), cancelAnimationFrame(h), h = requestAnimationFrame(function() {
                        var e;
                        null == (e = g) || e.observe(t)
                    })), r()
                }), y && !m && g.observe(y), g.observe(t));
                var O = m ? lz(e) : null;
                return m && function t() {
                        var n = lz(e);
                        O && !lY(O, n) && r(), O = n, o = requestAnimationFrame(t)
                    }(), r(),
                    function() {
                        var e;
                        b.forEach(function(e) {
                            i && e.removeEventListener("scroll", r), c && e.removeEventListener("resize", r)
                        }), null == v || v(), null == (e = g) || e.disconnect(), g = null, m && cancelAnimationFrame(o)
                    }
            }
            var lZ = function(e) {
                    return {
                        name: "arrow",
                        options: e,
                        fn: function(t) {
                            return i1(function() {
                                var r, n, o, a, i, l, c, u, s, f, d, p, m, y, b, v, h, g, O, w, j, x, S, P, E, A, C, I, N, R, T, k, D, M, L, _, F;
                                return i5(this, function(U) {
                                    switch (U.label) {
                                        case 0:
                                            if (r = t.x, n = t.y, o = t.placement, a = t.rects, i = t.platform, l = t.elements, c = t.middlewareData, s = (u = iF(e, t) || {}).element, d = void 0 === (f = u.padding) ? 0 : f, null == s) return [2, {}];
                                            return p = iQ(d), m = {
                                                x: r,
                                                y: n
                                            }, b = iH(y = iK(iB(o))), [4, i.getDimensions(s)];
                                        case 1:
                                            return v = U.sent(), g = (h = "y" === y) ? "top" : "left", O = h ? "bottom" : "right", w = h ? "clientHeight" : "clientWidth", j = a.reference[b] + a.reference[y] - m[y] - a.floating[b], x = m[y] - a.reference[y], [4, null == i.getOffsetParent ? void 0 : i.getOffsetParent(s)];
                                        case 2:
                                            if (E = !(P = (S = U.sent()) ? S[w] : 0)) return [3, 4];
                                            return [4, null == i.isElement ? void 0 : i.isElement(S)];
                                        case 3:
                                            E = !U.sent(), U.label = 4;
                                        case 4:
                                            return E && (P = l.floating[w] || a.floating[b]), A = j / 2 - x / 2, C = P / 2 - v[b] / 2 - 1, I = iR(p[g], C), N = iR(p[O], C), R = I, T = P - v[b] - N, D = iT(R, iR(k = P / 2 - v[b] / 2 + A, T)), L = (M = !c.arrow && null != iz(o) && k !== D && a.reference[b] / 2 - (k < R ? I : N) - v[b] / 2 < 0) ? k < R ? k - R : k - T : 0, [2, (i2(F = {}, y, m[y] + L), i2(F, "data", i8((i2(_ = {}, y, D), i2(_, "centerOffset", k - D - L), _), M && {
                                                alignmentOffset: L
                                            })), i2(F, "reset", M), F)]
                                    }
                                })
                            })()
                        }
                    }
                },
                lJ = function(e, t, r) {
                    var n, o = new Map,
                        a = lR({
                            platform: lG
                        }, r),
                        i = lT(lR({}, a.platform), {
                            _c: o
                        });
                    return n = lT(lR({}, a), {
                        platform: i
                    }), i1(function() {
                        var r, o, a, i, l, c, u, s, f, d, p, m, y, b, v, h, g, O, w, j, x, S, P, E, A, C;
                        return i5(this, function(I) {
                            switch (I.label) {
                                case 0:
                                    return o = void 0 === (r = n.placement) ? "bottom" : r, i = void 0 === (a = n.strategy) ? "absolute" : a, c = void 0 === (l = n.middleware) ? [] : l, u = n.platform, s = c.filter(Boolean), [4, null == u.isRTL ? void 0 : u.isRTL(t)];
                                case 1:
                                    return f = I.sent(), [4, u.getElementRects({
                                        reference: e,
                                        floating: t,
                                        strategy: i
                                    })];
                                case 2:
                                    m = (p = i7(d = I.sent(), o, f)).x, y = p.y, b = o, v = {}, h = 0, g = 0, I.label = 3;
                                case 3:
                                    if (!(g < s.length)) return [3, 11];
                                    return w = (O = s[g]).name, [4, (0, O.fn)({
                                        x: m,
                                        y: y,
                                        initialPlacement: o,
                                        placement: b,
                                        strategy: i,
                                        middlewareData: v,
                                        rects: d,
                                        platform: u,
                                        elements: {
                                            reference: e,
                                            floating: t
                                        }
                                    })];
                                case 4:
                                    var N;
                                    if (x = (j = I.sent()).x, S = j.y, P = j.data, E = j.reset, m = null != x ? x : m, y = null != S ? S : y, v = i3(i8({}, v), i2({}, w, i8({}, v[w], P))), !(E && h <= 50)) return [3, 10];
                                    if (h++, (void 0 === E ? "undefined" : (N = E) && "u" > typeof Symbol && N.constructor === Symbol ? "symbol" : typeof N) != "object") return [3, 9];
                                    if (E.placement && (b = E.placement), !E.rects) return [3, 8];
                                    if (!0 !== E.rects) return [3, 6];
                                    return [4, u.getElementRects({
                                        reference: e,
                                        floating: t,
                                        strategy: i
                                    })];
                                case 5:
                                    return A = I.sent(), [3, 7];
                                case 6:
                                    A = E.rects, I.label = 7;
                                case 7:
                                    d = A, I.label = 8;
                                case 8:
                                    m = (C = i7(d, b, f)).x, y = C.y, I.label = 9;
                                case 9:
                                    g = -1, I.label = 10;
                                case 10:
                                    return g++, [3, 3];
                                case 11:
                                    return [2, {
                                        x: m,
                                        y: y,
                                        placement: b,
                                        strategy: i,
                                        middlewareData: v
                                    }]
                            }
                        })
                    })()
                };

            function l0(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function l1(e) {
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

            function l2(e, t) {
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

            function l8(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return l0(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return l0(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function l3(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var l6 = "u" > typeof document ? Z.useLayoutEffect : function() {};

            function l4(e, t) {
                if (e === t) return !0;
                if ((void 0 === e ? "undefined" : l3(e)) !== (void 0 === t ? "undefined" : l3(t))) return !1;
                if ("function" == typeof e && e.toString() === t.toString()) return !0;
                if (e && t && (void 0 === e ? "undefined" : l3(e)) === "object") {
                    if (Array.isArray(e)) {
                        if ((r = e.length) !== t.length) return !1;
                        for (n = r; 0 != n--;)
                            if (!l4(e[n], t[n])) return !1;
                        return !0
                    }
                    if ((r = (o = Object.keys(e)).length) !== Object.keys(t).length) return !1;
                    for (n = r; 0 != n--;)
                        if (!({}).hasOwnProperty.call(t, o[n])) return !1;
                    for (n = r; 0 != n--;) {
                        var r, n, o, a = o[n];
                        if (("_owner" !== a || !e.$$typeof) && !l4(e[a], t[a])) return !1
                    }
                    return !0
                }
                return e != e && t != t
            }

            function l5(e) {
                return "u" < typeof window ? 1 : (e.ownerDocument.defaultView || window).devicePixelRatio || 1
            }

            function l7(e, t) {
                var r = l5(e);
                return Math.round(t * r) / r
            }

            function l9(e) {
                var t = Z.useRef(e);
                return l6(function() {
                    t.current = e
                }), t
            }

            function ce(e) {
                void 0 === e && (e = {});
                var t = e.placement,
                    r = void 0 === t ? "bottom" : t,
                    n = e.strategy,
                    o = void 0 === n ? "absolute" : n,
                    a = e.middleware,
                    i = void 0 === a ? [] : a,
                    l = e.platform,
                    c = e.elements,
                    u = void 0 === c ? {} : c,
                    s = u.reference,
                    f = u.floating,
                    d = e.transform,
                    p = void 0 === d || d,
                    m = e.whileElementsMounted,
                    y = e.open,
                    b = l8(Z.useState({
                        x: 0,
                        y: 0,
                        strategy: o,
                        placement: r,
                        middlewareData: {},
                        isPositioned: !1
                    }), 2),
                    v = b[0],
                    h = b[1],
                    g = l8(Z.useState(i), 2),
                    O = g[0],
                    w = g[1];
                l4(O, i) || w(i);
                var j = l8(Z.useState(null), 2),
                    x = j[0],
                    S = j[1],
                    P = l8(Z.useState(null), 2),
                    E = P[0],
                    A = P[1],
                    C = Z.useCallback(function(e) {
                        e !== T.current && (T.current = e, S(e))
                    }, []),
                    I = Z.useCallback(function(e) {
                        e !== k.current && (k.current = e, A(e))
                    }, []),
                    N = s || x,
                    R = f || E,
                    T = Z.useRef(null),
                    k = Z.useRef(null),
                    D = Z.useRef(v),
                    M = null != m,
                    L = l9(m),
                    _ = l9(l),
                    F = l9(y),
                    U = Z.useCallback(function() {
                        if (T.current && k.current) {
                            var e = {
                                placement: r,
                                strategy: o,
                                middleware: O
                            };
                            _.current && (e.platform = _.current), lJ(T.current, k.current, e).then(function(e) {
                                var t = l2(l1({}, e), {
                                    isPositioned: !1 !== F.current
                                });
                                z.current && !l4(D.current, t) && (D.current = t, n8.flushSync(function() {
                                    h(t)
                                }))
                            })
                        }
                    }, [O, r, o, _, F]);
                l6(function() {
                    !1 === y && D.current.isPositioned && (D.current.isPositioned = !1, h(function(e) {
                        return l2(l1({}, e), {
                            isPositioned: !1
                        })
                    }))
                }, [y]);
                var z = Z.useRef(!1);
                l6(function() {
                    return z.current = !0,
                        function() {
                            z.current = !1
                        }
                }, []), l6(function() {
                    if (N && (T.current = N), R && (k.current = R), N && R) {
                        if (L.current) return L.current(N, R, U);
                        U()
                    }
                }, [N, R, U, L, M]);
                var K = Z.useMemo(function() {
                        return {
                            reference: T,
                            floating: k,
                            setReference: C,
                            setFloating: I
                        }
                    }, [C, I]),
                    H = Z.useMemo(function() {
                        return {
                            reference: N,
                            floating: R
                        }
                    }, [N, R]),
                    W = Z.useMemo(function() {
                        var e = {
                            position: o,
                            left: 0,
                            top: 0
                        };
                        if (!H.floating) return e;
                        var t = l7(H.floating, v.x),
                            r = l7(H.floating, v.y);
                        return p ? l1(l2(l1({}, e), {
                            transform: "translate(" + t + "px, " + r + "px)"
                        }), l5(H.floating) >= 1.5 && {
                            willChange: "transform"
                        }) : {
                            position: o,
                            left: t,
                            top: r
                        }
                    }, [o, p, H.floating, v.x, v.y]);
                return Z.useMemo(function() {
                    return l2(l1({}, v), {
                        update: U,
                        refs: K,
                        elements: H,
                        floatingStyles: W
                    })
                }, [v, U, K, H, W])
            }
            var ct = function(e, t) {
                    var r;
                    return l2(l1({}, (void 0 === (r = e) && (r = 0), {
                        name: "offset",
                        options: r,
                        fn: function(e) {
                            return i1(function() {
                                var t, n, o, a, i, l, c;
                                return i5(this, function(u) {
                                    switch (u.label) {
                                        case 0:
                                            var s;
                                            return o = e.x, a = e.y, i = e.placement, l = e.middlewareData, [4, (s = r, i1(function() {
                                                var t, r, n, o, a, i, l, c, u, f, d, p, m, y;
                                                return i5(this, function(b) {
                                                    switch (b.label) {
                                                        case 0:
                                                            return t = e.placement, r = e.platform, n = e.elements, [4, null == r.isRTL ? void 0 : r.isRTL(n.floating)];
                                                        case 1:
                                                            return o = b.sent(), a = iU(t), i = iz(t), l = "y" === iB(t), c = lr.has(a) ? -1 : 1, u = o && l ? -1 : 1, p = (d = "number" == typeof(f = iF(s, e)) ? {
                                                                mainAxis: f,
                                                                crossAxis: 0,
                                                                alignmentAxis: null
                                                            } : {
                                                                mainAxis: f.mainAxis || 0,
                                                                crossAxis: f.crossAxis || 0,
                                                                alignmentAxis: f.alignmentAxis
                                                            }).mainAxis, m = d.crossAxis, y = d.alignmentAxis, i && "number" == typeof y && (m = "end" === i ? -1 * y : y), [2, l ? {
                                                                x: m * u,
                                                                y: p * c
                                                            } : {
                                                                x: p * c,
                                                                y: m * u
                                                            }]
                                                    }
                                                })
                                            })())];
                                        case 1:
                                            if (c = u.sent(), i === (null == (t = l.offset) ? void 0 : t.placement) && null != (n = l.arrow) && n.alignmentOffset) return [2, {}];
                                            return [2, {
                                                x: o + c.x,
                                                y: a + c.y,
                                                data: i3(i8({}, c), {
                                                    placement: i
                                                })
                                            }]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [e, t]
                    })
                },
                cr = function(e, t) {
                    var r;
                    return l2(l1({}, (void 0 === (r = e) && (r = {}), {
                        name: "shift",
                        options: r,
                        fn: function(e) {
                            return i1(function() {
                                var t, n, o, a, i, l, c, u, s, f, d, p, m, y, b, v, h, g, O, w, j, x, S, P, E, A, C, I;
                                return i5(this, function(N) {
                                    switch (N.label) {
                                        case 0:
                                            return t = e.x, n = e.y, o = e.placement, l = void 0 === (i = (a = iF(r, e)).mainAxis) || i, u = void 0 !== (c = a.crossAxis) && c, f = void 0 === (s = a.limiter) ? {
                                                fn: function(e) {
                                                    return {
                                                        x: e.x,
                                                        y: e.y
                                                    }
                                                }
                                            } : s, d = i6(a, ["mainAxis", "crossAxis", "limiter"]), p = {
                                                x: t,
                                                y: n
                                            }, [4, i9(e, d)];
                                        case 1:
                                            return m = N.sent(), v = p[b = iK(y = iB(iU(o)))], h = p[y], l && (g = "y" === b ? "top" : "left", O = "y" === b ? "bottom" : "right", w = v + m[g], j = v - m[O], v = iT(w, iR(v, j))), u && (x = "y" === y ? "top" : "left", S = "y" === y ? "bottom" : "right", P = h + m[x], E = h - m[S], h = iT(P, iR(h, E))), C = f.fn(i3(i8({}, e), (i2(A = {}, b, v), i2(A, y, h), A))), [2, i3(i8({}, C), {
                                                data: {
                                                    x: C.x - t,
                                                    y: C.y - n,
                                                    enabled: (i2(I = {}, b, l), i2(I, y, u), I)
                                                }
                                            })]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [e, t]
                    })
                },
                cn = function(e, t) {
                    var r;
                    return l2(l1({}, (void 0 === (r = e) && (r = {}), {
                        options: r,
                        fn: function(e) {
                            var t, n = e.x,
                                o = e.y,
                                a = e.placement,
                                i = e.rects,
                                l = e.middlewareData,
                                c = iF(r, e),
                                u = c.offset,
                                s = c.mainAxis,
                                f = c.crossAxis,
                                d = {
                                    x: n,
                                    y: o
                                },
                                p = iB(a),
                                m = iK(p),
                                y = d[m],
                                b = d[p],
                                v = iF(void 0 === u ? 0 : u, e),
                                h = "number" == typeof v ? {
                                    mainAxis: v,
                                    crossAxis: 0
                                } : i8({
                                    mainAxis: 0,
                                    crossAxis: 0
                                }, v);
                            if (void 0 === s || s) {
                                var g = "y" === m ? "height" : "width",
                                    O = i.reference[m] - i.floating[g] + h.mainAxis,
                                    w = i.reference[m] + i.reference[g] - h.mainAxis;
                                y < O ? y = O : y > w && (y = w)
                            }
                            if (void 0 === f || f) {
                                var j, x, S = "y" === m ? "width" : "height",
                                    P = lr.has(iU(a)),
                                    E = i.reference[p] - i.floating[S] + (P && (null == (j = l.offset) ? void 0 : j[p]) || 0) + (P ? 0 : h.crossAxis),
                                    A = i.reference[p] + i.reference[S] + (P ? 0 : (null == (x = l.offset) ? void 0 : x[p]) || 0) - (P ? h.crossAxis : 0);
                                b < E ? b = E : b > A && (b = A)
                            }
                            return i2(t = {}, m, y), i2(t, p, b), t
                        }
                    })), {
                        options: [e, t]
                    })
                },
                co = function(e, t) {
                    var r;
                    return l2(l1({}, (void 0 === (r = e) && (r = {}), {
                        name: "flip",
                        options: r,
                        fn: function(e) {
                            return i1(function() {
                                var t, n, o, a, i, l, c, u, s, f, d, p, m, y, b, v, h, g, O, w, j, x, S, P, E, A, C, I, N, R, T, k, D, M, L, _, F, U, z, K;
                                return i5(this, function(H) {
                                    var W, B, V, q, X, $, G, Y, Q, Z, J, ee, et, er, en;
                                    switch (H.label) {
                                        case 0:
                                            if (o = e.placement, a = e.middlewareData, i = e.rects, l = e.initialPlacement, c = e.platform, u = e.elements, d = void 0 === (f = (s = iF(r, e)).mainAxis) || f, m = void 0 === (p = s.crossAxis) || p, y = s.fallbackPlacements, v = void 0 === (b = s.fallbackStrategy) ? "bestFit" : b, g = void 0 === (h = s.fallbackAxisSideDirection) ? "none" : h, w = void 0 === (O = s.flipAlignment) || O, j = i6(s, ["mainAxis", "crossAxis", "fallbackPlacements", "fallbackStrategy", "fallbackAxisSideDirection", "flipAlignment"]), null != (t = a.arrow) && t.alignmentOffset) return [2, {}];
                                            return x = iU(o), S = iB(l), P = iU(l) === l, [4, null == c.isRTL ? void 0 : c.isRTL(u.floating)];
                                        case 1:
                                            return E = H.sent(), A = y || (P || !w ? [iY(l)] : (B = iY(W = l), [iV(W), B, iV(B)])), C = "none" !== g, !y && C && (I = A).push.apply(I, i4((V = l, q = w, X = g, $ = E, G = iz(V), Y = function(e, t, r) {
                                                switch (e) {
                                                    case "top":
                                                    case "bottom":
                                                        if (r) return t ? iX : iq;
                                                        return t ? iq : iX;
                                                    case "left":
                                                    case "right":
                                                        return t ? i$ : iG;
                                                    default:
                                                        return []
                                                }
                                            }(iU(V), "start" === X, $), G && (Y = Y.map(function(e) {
                                                return e + "-" + G
                                            }), q && (Y = Y.concat(Y.map(iV)))), Y))), N = [l].concat(i4(A)), [4, i9(e, j)];
                                        case 2:
                                            if (R = H.sent(), T = [], k = (null == (n = a.flip) ? void 0 : n.overflows) || [], d && T.push(R[x]), m && (Q = o, Z = i, void 0 === (J = E) && (J = !1), ee = iz(Q), er = iH(et = iK(iB(Q))), en = "x" === et ? ee === (J ? "end" : "start") ? "right" : "left" : "start" === ee ? "bottom" : "top", Z.reference[er] > Z.floating[er] && (en = iY(en)), D = [en, iY(en)], T.push(R[D[0]], R[D[1]])), k = i4(k).concat([{
                                                    placement: o,
                                                    overflows: T
                                                }]), !T.every(function(e) {
                                                    return e <= 0
                                                })) {
                                                if ((F = N[_ = ((null == (M = a.flip) ? void 0 : M.index) || 0) + 1]) && ("alignment" !== m || S === iB(F) || k.every(function(e) {
                                                        return iB(e.placement) !== S || e.overflows[0] > 0
                                                    }))) return [2, {
                                                    data: {
                                                        index: _,
                                                        overflows: k
                                                    },
                                                    reset: {
                                                        placement: F
                                                    }
                                                }];
                                                if (!(U = null == (L = k.filter(function(e) {
                                                        return e.overflows[0] <= 0
                                                    }).sort(function(e, t) {
                                                        return e.overflows[1] - t.overflows[1]
                                                    })[0]) ? void 0 : L.placement)) switch (v) {
                                                    case "bestFit":
                                                        (K = null == (z = k.filter(function(e) {
                                                            if (C) {
                                                                var t = iB(e.placement);
                                                                return t === S || "y" === t
                                                            }
                                                            return !0
                                                        }).map(function(e) {
                                                            return [e.placement, e.overflows.filter(function(e) {
                                                                return e > 0
                                                            }).reduce(function(e, t) {
                                                                return e + t
                                                            }, 0)]
                                                        }).sort(function(e, t) {
                                                            return e[1] - t[1]
                                                        })[0]) ? void 0 : z[0]) && (U = K);
                                                        break;
                                                    case "initialPlacement":
                                                        U = l
                                                }
                                                if (o !== U) return [2, {
                                                    reset: {
                                                        placement: U
                                                    }
                                                }]
                                            }
                                            return [2, {}]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [e, t]
                    })
                },
                ca = function(e, t) {
                    var r;
                    return l2(l1({}, (void 0 === (r = e) && (r = {}), {
                        name: "size",
                        options: r,
                        fn: function(e) {
                            return i1(function() {
                                var t, n, o, a, i, l, c, u, s, f, d, p, m, y, b, v, h, g, O, w, j, x, S, P, E, A, C, I, N, R;
                                return i5(this, function(T) {
                                    switch (T.label) {
                                        case 0:
                                            return o = e.placement, a = e.rects, i = e.platform, l = e.elements, s = void 0 === (u = (c = iF(r, e)).apply) ? function() {} : u, [4, i9(e, i6(c, ["apply"]))];
                                        case 1:
                                            if (f = T.sent(), d = iU(o), p = iz(o), m = "y" === iB(o), b = (y = a.floating).width, v = y.height, "top" !== d && "bottom" !== d) return [3, 3];
                                            return h = d, [4, null == i.isRTL ? void 0 : i.isRTL(l.floating)];
                                        case 2:
                                            return g = p === (T.sent() ? "start" : "end") ? "left" : "right", [3, 4];
                                        case 3:
                                            g = d, h = "end" === p ? "top" : "bottom", T.label = 4;
                                        case 4:
                                            return O = v - f.top - f.bottom, w = b - f.left - f.right, j = iR(v - f[h], O), x = iR(b - f[g], w), S = !e.middlewareData.shift, P = j, E = x, null != (t = e.middlewareData.shift) && t.enabled.x && (E = w), null != (n = e.middlewareData.shift) && n.enabled.y && (P = O), S && !p && (A = iT(f.left, 0), C = iT(f.right, 0), I = iT(f.top, 0), N = iT(f.bottom, 0), m ? E = b - 2 * (0 !== A || 0 !== C ? A + C : iT(f.left, f.right)) : P = v - 2 * (0 !== I || 0 !== N ? I + N : iT(f.top, f.bottom))), [4, s(i3(i8({}, e), {
                                                availableWidth: E,
                                                availableHeight: P
                                            }))];
                                        case 5:
                                            return T.sent(), [4, i.getDimensions(l.floating)];
                                        case 6:
                                            if (R = T.sent(), b !== R.width || v !== R.height) return [2, {
                                                reset: {
                                                    rects: !0
                                                }
                                            }];
                                            return [2, {}]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [e, t]
                    })
                },
                ci = function(e, t) {
                    var r;
                    return l2(l1({}, (void 0 === (r = e) && (r = {}), {
                        name: "hide",
                        options: r,
                        fn: function(e) {
                            return i1(function() {
                                var t, n, o, a, i, l, c;
                                return i5(this, function(u) {
                                    switch (u.label) {
                                        case 0:
                                            switch (t = e.rects, a = void 0 === (o = (n = iF(r, e)).strategy) ? "referenceHidden" : o, i = i6(n, ["strategy"]), a) {
                                                case "referenceHidden":
                                                    return [3, 1];
                                                case "escaped":
                                                    return [3, 3]
                                            }
                                            return [3, 5];
                                        case 1:
                                            return [4, i9(e, i3(i8({}, i), {
                                                elementContext: "reference"
                                            }))];
                                        case 2:
                                            return [2, {
                                                data: {
                                                    referenceHiddenOffsets: l = le(u.sent(), t.reference),
                                                    referenceHidden: lt(l)
                                                }
                                            }];
                                        case 3:
                                            return [4, i9(e, i3(i8({}, i), {
                                                altBoundary: !0
                                            }))];
                                        case 4:
                                            return [2, {
                                                data: {
                                                    escapedOffsets: c = le(u.sent(), t.floating),
                                                    escaped: lt(c)
                                                }
                                            }];
                                        case 5:
                                            return [2, {}];
                                        case 6:
                                            return [2]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [e, t]
                    })
                },
                cl = function(e, t) {
                    return l2(l1({}, {
                        name: "arrow",
                        options: e,
                        fn: function(t) {
                            var r = "function" == typeof e ? e(t) : e,
                                n = r.element,
                                o = r.padding;
                            return n && ({}).hasOwnProperty.call(n, "current") ? null != n.current ? lZ({
                                element: n.current,
                                padding: o
                            }).fn(t) : {} : n ? lZ({
                                element: n,
                                padding: o
                            }).fn(t) : {}
                        }
                    }), {
                        options: [e, t]
                    })
                };

            function cc(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function cu(e) {
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

            function cs(e, t) {
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

            function cf(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function cd(e) {
                return function(e) {
                    if (Array.isArray(e)) return cc(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return cc(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return cc(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var cp = Z.forwardRef(function(e, t) {
                var r = e.children,
                    n = cf(e, ["children"]),
                    o = Z.Children.toArray(r),
                    a = o.find(cb);
                if (a) {
                    var i = a.props.children,
                        l = o.map(function(e) {
                            return e !== a ? e : Z.Children.count(i) > 1 ? Z.Children.only(null) : Z.isValidElement(i) ? i.props.children : null
                        });
                    return (0, $.jsx)(cm, cs(cu({}, n), {
                        ref: t,
                        children: Z.isValidElement(i) ? Z.cloneElement(i, void 0, l) : null
                    }))
                }
                return (0, $.jsx)(cm, cs(cu({}, n), {
                    ref: t,
                    children: r
                }))
            });
            cp.displayName = "Slot";
            var cm = Z.forwardRef(function(e, t) {
                var r = e.children,
                    n = cf(e, ["children"]);
                if (Z.isValidElement(r)) {
                    var o, a, i, l, c, u = (c = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref;
                    return Z.cloneElement(r, cs(cu({}, function(e, t) {
                        var r = cu({}, t);
                        for (var n in t) ! function(n) {
                            var o = e[n],
                                a = t[n];
                            /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                a.apply(void 0, cd(t)), o.apply(void 0, cd(t))
                            } : o && (r[n] = o) : "style" === n ? r[n] = cu({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                        }(n);
                        return cu({}, e, r)
                    }(n, r.props)), {
                        ref: t ? ih(t, u) : u
                    }))
                }
                return Z.Children.count(r) > 1 ? Z.Children.only(null) : null
            });
            cm.displayName = "SlotClone";
            var cy = function(e) {
                var t = e.children;
                return (0, $.jsx)($.Fragment, {
                    children: t
                })
            };

            function cb(e) {
                return Z.isValidElement(e) && e.type === cy
            }

            function cv(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function ch(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        cv(e, t, r[t])
                    })
                }
                return e
            }

            function cg(e, t) {
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
            var cO = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                    var r = Z.forwardRef(function(e, r) {
                        var n = e.asChild,
                            o = function(e, t) {
                                if (null == e) return {};
                                var r, n, o, a = {};
                                if ("u" > typeof Reflect && Reflect.ownKeys) {
                                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                    return a
                                }
                                if (a = function(e, t) {
                                        if (null == e) return {};
                                        var r, n, o = {},
                                            a = Object.getOwnPropertyNames(e);
                                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                        return o
                                    }(e, t), Object.getOwnPropertySymbols)
                                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }(e, ["asChild"]),
                            a = n ? cp : t;
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, $.jsx)(a, cg(ch({}, o), {
                            ref: r
                        }))
                    });
                    return r.displayName = "Primitive.".concat(t), cg(ch({}, e), cv({}, t, r))
                }, {}),
                cw = Z.forwardRef(function(e, t) {
                    var r, n, o = e.children,
                        a = e.width,
                        i = e.height,
                        l = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(e, ["children", "width", "height"]);
                    return (0, $.jsx)(cO.svg, (r = function(e) {
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
                    }({}, l), n = n = {
                        ref: t,
                        width: void 0 === a ? 10 : a,
                        height: void 0 === i ? 5 : i,
                        viewBox: "0 0 30 10",
                        preserveAspectRatio: "none",
                        children: e.asChild ? o : (0, $.jsx)("polygon", {
                            points: "0,0 30,0 15,10"
                        })
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

            function cj(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function cx(e) {
                var t = Z.useRef(e);
                return Z.useEffect(function() {
                    t.current = e
                }), Z.useMemo(function() {
                    return function() {
                        for (var e, r = arguments.length, n = Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                            if (Array.isArray(e)) return cj(e)
                        }(n) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(n) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return cj(e, void 0);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return cj(e, void 0)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }
                }, [])
            }

            function cS(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function cP(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function cE(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function cA(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        cE(e, t, r[t])
                    })
                }
                return e
            }

            function cC(e, t) {
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

            function cI(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function cN(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || cR(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function cR(e, t) {
                if (e) {
                    if ("string" == typeof e) return cP(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return cP(e, t)
                }
            }
            cw.displayName = "Arrow";
            var cT = "Popper",
                ck = cN(iS(cT), 2),
                cD = ck[0],
                cM = ck[1],
                cL = cN(cD(cT), 2),
                c_ = cL[0],
                cF = cL[1],
                cU = function(e) {
                    var t = e.__scopePopper,
                        r = e.children,
                        n = cN(Z.useState(null), 2),
                        o = n[0],
                        a = n[1];
                    return (0, $.jsx)(c_, {
                        scope: t,
                        anchor: o,
                        onAnchorChange: a,
                        children: r
                    })
                };
            cU.displayName = cT;
            var cz = "PopperAnchor",
                cK = Z.forwardRef(function(e, t) {
                    var r = e.__scopePopper,
                        n = e.virtualRef,
                        o = cI(e, ["__scopePopper", "virtualRef"]),
                        a = cF(cz, r),
                        i = Z.useRef(null),
                        l = ig(t, i);
                    return Z.useEffect(function() {
                        a.onAnchorChange((null == n ? void 0 : n.current) || i.current)
                    }), n ? null : (0, $.jsx)(cO.div, cC(cA({}, o), {
                        ref: l
                    }))
                });
            cK.displayName = cz;
            var cH = "PopperContent",
                cW = cN(cD(cH), 2),
                cB = cW[0],
                cV = cW[1],
                cq = Z.forwardRef(function(e, t) {
                    var r, n, o, a, i, l, c, u, s, f, d, p, m = e.__scopePopper,
                        y = e.side,
                        b = e.sideOffset,
                        v = e.align,
                        h = void 0 === v ? "center" : v,
                        g = e.alignOffset,
                        O = e.arrowPadding,
                        w = e.avoidCollisions,
                        j = void 0 === w || w,
                        x = e.collisionBoundary,
                        S = void 0 === x ? [] : x,
                        P = e.collisionPadding,
                        E = void 0 === P ? 0 : P,
                        A = e.sticky,
                        C = e.hideWhenDetached,
                        I = e.updatePositionStrategy,
                        N = void 0 === I ? "optimized" : I,
                        R = e.onPlaced,
                        T = cI(e, ["__scopePopper", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "avoidCollisions", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "updatePositionStrategy", "onPlaced"]),
                        k = cF(cH, m),
                        D = cN(Z.useState(null), 2),
                        M = D[0],
                        L = D[1],
                        _ = ig(t, function(e) {
                            return L(e)
                        }),
                        F = cN(Z.useState(null), 2),
                        U = F[0],
                        z = F[1],
                        K = (o = (n = function(e) {
                            if (Array.isArray(e)) return e
                        }(r = Z.useState(void 0)) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(r) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return cS(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return cS(e, 2)
                            }
                        }(r) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0], a = n[1], iE(function() {
                            if (U) {
                                a({
                                    width: U.offsetWidth,
                                    height: U.offsetHeight
                                });
                                var e = new ResizeObserver(function(e) {
                                    if (Array.isArray(e) && e.length) {
                                        var t, r, n = e[0];
                                        if ("borderBoxSize" in n) {
                                            var o = n.borderBoxSize,
                                                i = Array.isArray(o) ? o[0] : o;
                                            t = i.inlineSize, r = i.blockSize
                                        } else t = U.offsetWidth, r = U.offsetHeight;
                                        a({
                                            width: t,
                                            height: r
                                        })
                                    }
                                });
                                return e.observe(U, {
                                        box: "border-box"
                                    }),
                                    function() {
                                        return e.unobserve(U)
                                    }
                            }
                            a(void 0)
                        }, [U]), o),
                        H = null != (i = null == K ? void 0 : K.width) ? i : 0,
                        W = null != (l = null == K ? void 0 : K.height) ? l : 0,
                        B = "number" == typeof E ? E : cA({
                            top: 0,
                            right: 0,
                            bottom: 0,
                            left: 0
                        }, E),
                        V = Array.isArray(S) ? S : [S],
                        q = V.length > 0,
                        X = {
                            padding: B,
                            boundary: V.filter(cY),
                            altBoundary: q
                        },
                        G = ce({
                            strategy: "fixed",
                            placement: (void 0 === y ? "bottom" : y) + ("center" !== h ? "-" + h : ""),
                            whileElementsMounted: function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return lQ.apply(void 0, ((function(e) {
                                    if (Array.isArray(e)) return cP(e)
                                })(t) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(t) || cR(t) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()).concat([{
                                    animationFrame: "always" === N
                                }]))
                            },
                            elements: {
                                reference: k.anchor
                            },
                            middleware: [ct({
                                mainAxis: (void 0 === b ? 0 : b) + W,
                                alignmentAxis: void 0 === g ? 0 : g
                            }), j && cr(cA({
                                mainAxis: !0,
                                crossAxis: !1,
                                limiter: "partial" === (void 0 === A ? "partial" : A) ? cn() : void 0
                            }, X)), j && co(cA({}, X)), ca(cC(cA({}, X), {
                                apply: function(e) {
                                    var t = e.elements,
                                        r = e.rects,
                                        n = e.availableWidth,
                                        o = e.availableHeight,
                                        a = r.reference,
                                        i = a.width,
                                        l = a.height,
                                        c = t.floating.style;
                                    c.setProperty("--radix-popper-available-width", "".concat(n, "px")), c.setProperty("--radix-popper-available-height", "".concat(o, "px")), c.setProperty("--radix-popper-anchor-width", "".concat(i, "px")), c.setProperty("--radix-popper-anchor-height", "".concat(l, "px"))
                                }
                            })), U && cl({
                                element: U,
                                padding: void 0 === O ? 0 : O
                            }), cQ({
                                arrowWidth: H,
                                arrowHeight: W
                            }), void 0 !== C && C && ci(cA({
                                strategy: "referenceHidden"
                            }, X))]
                        }),
                        Y = G.refs,
                        Q = G.floatingStyles,
                        J = G.placement,
                        ee = G.isPositioned,
                        et = G.middlewareData,
                        er = cN(cZ(J), 2),
                        en = er[0],
                        eo = er[1],
                        ea = cx(R);
                    iE(function() {
                        ee && (null == ea || ea())
                    }, [ee, ea]);
                    var ei = null == (c = et.arrow) ? void 0 : c.x,
                        el = null == (u = et.arrow) ? void 0 : u.y,
                        ec = (null == (s = et.arrow) ? void 0 : s.centerOffset) !== 0,
                        eu = cN(Z.useState(), 2),
                        es = eu[0],
                        ef = eu[1];
                    return iE(function() {
                        M && ef(window.getComputedStyle(M).zIndex)
                    }, [M]), (0, $.jsx)("div", {
                        ref: Y.setFloating,
                        "data-radix-popper-content-wrapper": "",
                        style: cA(cC(cA({}, Q), cE({
                            transform: ee ? Q.transform : "translate(0, -200%)",
                            minWidth: "max-content",
                            zIndex: es
                        }, "--radix-popper-transform-origin", [null == (f = et.transformOrigin) ? void 0 : f.x, null == (d = et.transformOrigin) ? void 0 : d.y].join(" "))), (null == (p = et.hide) ? void 0 : p.referenceHidden) && {
                            visibility: "hidden",
                            pointerEvents: "none"
                        }),
                        dir: e.dir,
                        children: (0, $.jsx)(cB, {
                            scope: m,
                            placedSide: en,
                            onArrowChange: z,
                            arrowX: ei,
                            arrowY: el,
                            shouldHideArrow: ec,
                            children: (0, $.jsx)(cO.div, cC(cA({
                                "data-side": en,
                                "data-align": eo
                            }, T), {
                                ref: _,
                                style: cC(cA({}, T.style), {
                                    animation: ee ? void 0 : "none"
                                })
                            }))
                        })
                    })
                });
            cq.displayName = cH;
            var cX = "PopperArrow",
                c$ = {
                    top: "bottom",
                    right: "left",
                    bottom: "top",
                    left: "right"
                },
                cG = Z.forwardRef(function(e, t) {
                    var r, n = e.__scopePopper,
                        o = cI(e, ["__scopePopper"]),
                        a = cV(cX, n),
                        i = c$[a.placedSide];
                    return (0, $.jsx)("span", {
                        ref: a.onArrowChange,
                        style: (cE(r = {
                            position: "absolute",
                            left: a.arrowX,
                            top: a.arrowY
                        }, i, 0), cE(r, "transformOrigin", {
                            top: "",
                            right: "0 0",
                            bottom: "center 0",
                            left: "100% 0"
                        } [a.placedSide]), cE(r, "transform", {
                            top: "translateY(100%)",
                            right: "translateY(50%) rotate(90deg) translateX(-50%)",
                            bottom: "rotate(180deg)",
                            left: "translateY(50%) rotate(-90deg) translateX(50%)"
                        } [a.placedSide]), cE(r, "visibility", a.shouldHideArrow ? "hidden" : void 0), r),
                        children: (0, $.jsx)(cw, cC(cA({}, o), {
                            ref: t,
                            style: cC(cA({}, o.style), {
                                display: "block"
                            })
                        }))
                    })
                });

            function cY(e) {
                return null !== e
            }
            cG.displayName = cX;
            var cQ = function(e) {
                return {
                    name: "transformOrigin",
                    options: e,
                    fn: function(t) {
                        var r, n, o, a, i, l = t.placement,
                            c = t.rects,
                            u = t.middlewareData,
                            s = (null == (o = u.arrow) ? void 0 : o.centerOffset) !== 0,
                            f = s ? 0 : e.arrowWidth,
                            d = s ? 0 : e.arrowHeight,
                            p = cN(cZ(l), 2),
                            m = p[0],
                            y = {
                                start: "0%",
                                center: "50%",
                                end: "100%"
                            } [p[1]],
                            b = (null != (r = null == (a = u.arrow) ? void 0 : a.x) ? r : 0) + f / 2,
                            v = (null != (n = null == (i = u.arrow) ? void 0 : i.y) ? n : 0) + d / 2,
                            h = "",
                            g = "";
                        return "bottom" === m ? (h = s ? y : "".concat(b, "px"), g = "".concat(-d, "px")) : "top" === m ? (h = s ? y : "".concat(b, "px"), g = "".concat(c.floating.height + d, "px")) : "right" === m ? (h = "".concat(-d, "px"), g = s ? y : "".concat(v, "px")) : "left" === m && (h = "".concat(c.floating.width + d, "px"), g = s ? y : "".concat(v, "px")), {
                            data: {
                                x: h,
                                y: g
                            }
                        }
                    }
                }
            };

            function cZ(e) {
                var t = cN(e.split("-"), 2),
                    r = t[0],
                    n = t[1];
                return [r, void 0 === n ? "center" : n]
            }

            function cJ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var c0 = Z.forwardRef(function(e, t) {
                var r, n, o, a, i, l = e.container,
                    c = function(e, t) {
                        if (null == e) return {};
                        var r, n, o, a = {};
                        if ("u" > typeof Reflect && Reflect.ownKeys) {
                            for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }
                        if (a = function(e, t) {
                                if (null == e) return {};
                                var r, n, o = {},
                                    a = Object.getOwnPropertyNames(e);
                                for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                return o
                            }(e, t), Object.getOwnPropertySymbols)
                            for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                        return a
                    }(e, ["container"]),
                    u = function(e) {
                        if (Array.isArray(e)) return e
                    }(r = Z.useState(!1)) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                a = !0,
                                i = !1;
                            try {
                                for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                            } catch (e) {
                                i = !0, r = e
                            } finally {
                                try {
                                    a || null == n.return || n.return()
                                } finally {
                                    if (i) throw r
                                }
                            }
                            return o
                        }
                    }(r) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return cJ(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return cJ(e, 2)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    s = u[0],
                    f = u[1];
                iE(function() {
                    return f(!0)
                }, []);
                var d = l || s && (null == (i = globalThis) || null == (a = i.document) ? void 0 : a.body);
                return d ? n3().createPortal((0, $.jsx)(cO.div, (n = function(e) {
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
                }({}, c), o = o = {
                    ref: t
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(o)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(o)).forEach(function(e) {
                    Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(o, e))
                }), n)), d) : null
            });

            function c1(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function c2(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return c1(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return c1(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            c0.displayName = "Portal";
            var c8 = function(e) {
                var t, r, n, o, a, i, l, c, u, s, f, d, p, m, y, b, v, h = e.present,
                    g = e.children,
                    O = (t = h, a = (o = c2(Z.useState(), 2))[0], i = o[1], l = Z.useRef({}), c = Z.useRef(t), u = Z.useRef("none"), f = (s = c2((r = t ? "mounted" : "unmounted", n = {
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
                    }, Z.useReducer(function(e, t) {
                        var r = n[e][t];
                        return null != r ? r : e
                    }, r)), 2))[0], d = s[1], Z.useEffect(function() {
                        var e = c3(l.current);
                        u.current = "mounted" === f ? e : "none"
                    }, [f]), iE(function() {
                        var e = l.current,
                            r = c.current;
                        if (r !== t) {
                            var n = u.current,
                                o = c3(e);
                            t ? d("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? d("UNMOUNT") : r && n !== o ? d("ANIMATION_OUT") : d("UNMOUNT"), c.current = t
                        }
                    }, [t, d]), iE(function() {
                        if (a) {
                            var e, t, r = null != (e = a.ownerDocument.defaultView) ? e : window,
                                n = function(e) {
                                    var n = c3(l.current).includes(e.animationName);
                                    if (e.target === a && n && (d("ANIMATION_END"), !c.current)) {
                                        var o = a.style.animationFillMode;
                                        a.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                            "forwards" === a.style.animationFillMode && (a.style.animationFillMode = o)
                                        })
                                    }
                                },
                                o = function(e) {
                                    e.target === a && (u.current = c3(l.current))
                                };
                            return a.addEventListener("animationstart", o), a.addEventListener("animationcancel", n), a.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(t), a.removeEventListener("animationstart", o), a.removeEventListener("animationcancel", n), a.removeEventListener("animationend", n)
                                }
                        }
                        d("ANIMATION_END")
                    }, [a, d]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: Z.useCallback(function(e) {
                            e && (l.current = getComputedStyle(e)), i(e)
                        }, [])
                    }),
                    w = "function" == typeof g ? g({
                        present: O.isPresent
                    }) : Z.Children.only(g),
                    j = ig(O.ref, (v = (b = null == (m = Object.getOwnPropertyDescriptor((p = w).props, "ref")) ? void 0 : m.get) && "isReactWarning" in b && b.isReactWarning) ? p.ref : (v = (b = null == (y = Object.getOwnPropertyDescriptor(p, "ref")) ? void 0 : y.get) && "isReactWarning" in b && b.isReactWarning) ? p.props.ref : p.props.ref || p.ref);
                return "function" == typeof g || O.isPresent ? Z.cloneElement(w, {
                    ref: j
                }) : null
            };

            function c3(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }

            function c6(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function c4(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return c6(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return c6(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function c5(e) {
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
            c8.displayName = "Presence";
            var c7 = Z.forwardRef(function(e, t) {
                var r, n;
                return (0, $.jsx)(cO.span, (r = c5({}, e), n = n = {
                    ref: t,
                    style: c5({
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
                    }, e.style)
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

            function c9(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ue(e) {
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

            function ut(e, t) {
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

            function ur(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function un(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || ua(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function uo(e) {
                return function(e) {
                    if (Array.isArray(e)) return c9(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || ua(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ua(e, t) {
                if (e) {
                    if ("string" == typeof e) return c9(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return c9(e, t)
                }
            }
            c7.displayName = "VisuallyHidden";
            var ui = un(iS("Tooltip", [cM]), 2),
                ul = ui[0];
            ui[1];
            var uc = cM(),
                uu = "TooltipProvider",
                us = "tooltip.open",
                uf = un(ul(uu), 2),
                ud = uf[0],
                up = uf[1],
                um = function(e) {
                    var t = e.__scopeTooltip,
                        r = e.delayDuration,
                        n = e.skipDelayDuration,
                        o = void 0 === n ? 300 : n,
                        a = e.disableHoverableContent,
                        i = e.children,
                        l = un(Z.useState(!0), 2),
                        c = l[0],
                        u = l[1],
                        s = Z.useRef(!1),
                        f = Z.useRef(0);
                    return Z.useEffect(function() {
                        var e = f.current;
                        return function() {
                            return window.clearTimeout(e)
                        }
                    }, []), (0, $.jsx)(ud, {
                        scope: t,
                        isOpenDelayed: c,
                        delayDuration: void 0 === r ? 700 : r,
                        onOpen: Z.useCallback(function() {
                            window.clearTimeout(f.current), u(!1)
                        }, []),
                        onClose: Z.useCallback(function() {
                            window.clearTimeout(f.current), f.current = window.setTimeout(function() {
                                return u(!0)
                            }, o)
                        }, [o]),
                        isPointerInTransitRef: s,
                        onPointerInTransitChange: Z.useCallback(function(e) {
                            s.current = e
                        }, []),
                        disableHoverableContent: void 0 !== a && a,
                        children: i
                    })
                };
            um.displayName = uu;
            var uy = "Tooltip",
                ub = un(ul(uy), 2),
                uv = ub[0],
                uh = ub[1],
                ug = function(e) {
                    var t, r, n, o, a, i, l, c, u, s, f, d, p, m, y, b, v, h, g, O, w, j = e.__scopeTooltip,
                        x = e.children,
                        S = e.open,
                        P = e.defaultOpen,
                        E = e.onOpenChange,
                        A = e.disableHoverableContent,
                        C = e.delayDuration,
                        I = up(uy, e.__scopeTooltip),
                        N = uc(j),
                        R = un(Z.useState(null), 2),
                        T = R[0],
                        k = R[1],
                        D = (s = (u = function(e) {
                            if (Array.isArray(e)) return e
                        }(c = Z.useState(iC())) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(c) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return iA(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return iA(e, 2)
                            }
                        }(c) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0], f = u[1], iE(function() {
                            f(function(e) {
                                return null != e ? e : String(iI++)
                            })
                        }, [void 0]), s ? "radix-".concat(s) : ""),
                        M = Z.useRef(0),
                        L = null != A ? A : I.disableHoverableContent,
                        _ = null != C ? C : I.delayDuration,
                        F = Z.useRef(!1),
                        U = un((p = (d = {
                            prop: S,
                            defaultProp: void 0 !== P && P,
                            onChange: function(e) {
                                e ? (I.onOpen(), document.dispatchEvent(new CustomEvent(us))) : I.onClose(), null == E || E(e)
                            }
                        }).prop, v = (b = c4((r = (t = {
                            defaultProp: d.defaultProp,
                            onChange: y = void 0 === (m = d.onChange) ? function() {} : m
                        }).defaultProp, n = t.onChange, a = c4(o = Z.useState(r), 1)[0], i = Z.useRef(a), l = cx(n), Z.useEffect(function() {
                            i.current !== a && (l(a), i.current = a)
                        }, [a, i, l]), o), 2))[0], h = b[1], O = (g = void 0 !== p) ? p : v, w = cx(y), [O, Z.useCallback(function(e) {
                            if (g) {
                                var t = "function" == typeof e ? e(p) : e;
                                t !== p && w(t)
                            } else h(e)
                        }, [g, p, h, w])]), 2),
                        z = U[0],
                        K = void 0 !== z && z,
                        H = U[1],
                        W = Z.useMemo(function() {
                            return K ? F.current ? "delayed-open" : "instant-open" : "closed"
                        }, [K]),
                        B = Z.useCallback(function() {
                            window.clearTimeout(M.current), M.current = 0, F.current = !1, H(!0)
                        }, [H]),
                        V = Z.useCallback(function() {
                            window.clearTimeout(M.current), M.current = 0, H(!1)
                        }, [H]),
                        q = Z.useCallback(function() {
                            window.clearTimeout(M.current), M.current = window.setTimeout(function() {
                                F.current = !0, H(!0), M.current = 0
                            }, _)
                        }, [_, H]);
                    return Z.useEffect(function() {
                        return function() {
                            M.current && (window.clearTimeout(M.current), M.current = 0)
                        }
                    }, []), (0, $.jsx)(cU, ut(ue({}, N), {
                        children: (0, $.jsx)(uv, {
                            scope: j,
                            contentId: D,
                            open: K,
                            stateAttribute: W,
                            trigger: T,
                            onTriggerChange: k,
                            onTriggerEnter: Z.useCallback(function() {
                                I.isOpenDelayed ? q() : B()
                            }, [I.isOpenDelayed, q, B]),
                            onTriggerLeave: Z.useCallback(function() {
                                L ? V() : (window.clearTimeout(M.current), M.current = 0)
                            }, [V, L]),
                            onOpen: B,
                            onClose: V,
                            disableHoverableContent: L,
                            children: x
                        })
                    }))
                };
            ug.displayName = uy;
            var uO = "TooltipTrigger",
                uw = Z.forwardRef(function(e, t) {
                    var r = e.__scopeTooltip,
                        n = ur(e, ["__scopeTooltip"]),
                        o = uh(uO, r),
                        a = up(uO, r),
                        i = uc(r),
                        l = ig(t, Z.useRef(null), o.onTriggerChange),
                        c = Z.useRef(!1),
                        u = Z.useRef(!1),
                        s = Z.useCallback(function() {
                            return c.current = !1
                        }, []);
                    return Z.useEffect(function() {
                        return function() {
                            return document.removeEventListener("pointerup", s)
                        }
                    }, [s]), (0, $.jsx)(cK, ut(ue({
                        asChild: !0
                    }, i), {
                        children: (0, $.jsx)(cO.button, ut(ue({
                            "aria-describedby": o.open ? o.contentId : void 0,
                            "data-state": o.stateAttribute
                        }, n), {
                            ref: l,
                            onPointerMove: iy(e.onPointerMove, function(e) {
                                "touch" !== e.pointerType && (u.current || a.isPointerInTransitRef.current || (o.onTriggerEnter(), u.current = !0))
                            }),
                            onPointerLeave: iy(e.onPointerLeave, function() {
                                o.onTriggerLeave(), u.current = !1
                            }),
                            onPointerDown: iy(e.onPointerDown, function() {
                                c.current = !0, document.addEventListener("pointerup", s, {
                                    once: !0
                                })
                            }),
                            onFocus: iy(e.onFocus, function() {
                                c.current || o.onOpen()
                            }),
                            onBlur: iy(e.onBlur, o.onClose),
                            onClick: iy(e.onClick, o.onClose)
                        }))
                    }))
                });
            uw.displayName = uO;
            var uj = "TooltipPortal",
                ux = un(ul(uj, {
                    forceMount: void 0
                }), 2),
                uS = ux[0],
                uP = ux[1],
                uE = function(e) {
                    var t = e.__scopeTooltip,
                        r = e.forceMount,
                        n = e.children,
                        o = e.container,
                        a = uh(uj, t);
                    return (0, $.jsx)(uS, {
                        scope: t,
                        forceMount: r,
                        children: (0, $.jsx)(c8, {
                            present: r || a.open,
                            children: (0, $.jsx)(c0, {
                                asChild: !0,
                                container: o,
                                children: n
                            })
                        })
                    })
                };
            uE.displayName = uj;
            var uA = "TooltipContent",
                uC = Z.forwardRef(function(e, t) {
                    var r = uP(uA, e.__scopeTooltip),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        a = e.side,
                        i = void 0 === a ? "top" : a,
                        l = ur(e, ["forceMount", "side"]),
                        c = uh(uA, e.__scopeTooltip);
                    return (0, $.jsx)(c8, {
                        present: o || c.open,
                        children: c.disableHoverableContent ? (0, $.jsx)(uk, ut(ue({
                            side: i
                        }, l), {
                            ref: t
                        })) : (0, $.jsx)(uI, ut(ue({
                            side: i
                        }, l), {
                            ref: t
                        }))
                    })
                }),
                uI = Z.forwardRef(function(e, t) {
                    var r = uh(uA, e.__scopeTooltip),
                        n = up(uA, e.__scopeTooltip),
                        o = Z.useRef(null),
                        a = ig(t, o),
                        i = un(Z.useState(null), 2),
                        l = i[0],
                        c = i[1],
                        u = r.trigger,
                        s = r.onClose,
                        f = o.current,
                        d = n.onPointerInTransitChange,
                        p = Z.useCallback(function() {
                            c(null), d(!1)
                        }, [d]),
                        m = Z.useCallback(function(e, t) {
                            var r, n, o, a, i, l, u = e.currentTarget,
                                s = {
                                    x: e.clientX,
                                    y: e.clientY
                                },
                                f = function(e, t) {
                                    var r = Math.abs(t.top - e.y),
                                        n = Math.abs(t.bottom - e.y),
                                        o = Math.abs(t.right - e.x),
                                        a = Math.abs(t.left - e.x);
                                    switch (Math.min(r, n, o, a)) {
                                        case a:
                                            return "left";
                                        case o:
                                            return "right";
                                        case r:
                                            return "top";
                                        case n:
                                            return "bottom";
                                        default:
                                            throw Error("unreachable")
                                    }
                                }(s, u.getBoundingClientRect()),
                                p = function(e, t) {
                                    var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 5,
                                        n = [];
                                    switch (t) {
                                        case "top":
                                            n.push({
                                                x: e.x - r,
                                                y: e.y + r
                                            }, {
                                                x: e.x + r,
                                                y: e.y + r
                                            });
                                            break;
                                        case "bottom":
                                            n.push({
                                                x: e.x - r,
                                                y: e.y - r
                                            }, {
                                                x: e.x + r,
                                                y: e.y - r
                                            });
                                            break;
                                        case "left":
                                            n.push({
                                                x: e.x + r,
                                                y: e.y - r
                                            }, {
                                                x: e.x + r,
                                                y: e.y + r
                                            });
                                            break;
                                        case "right":
                                            n.push({
                                                x: e.x - r,
                                                y: e.y - r
                                            }, {
                                                x: e.x - r,
                                                y: e.y + r
                                            })
                                    }
                                    return n
                                }(s, f),
                                m = (n = (r = t.getBoundingClientRect()).top, o = r.right, a = r.bottom, [{
                                    x: i = r.left,
                                    y: n
                                }, {
                                    x: o,
                                    y: n
                                }, {
                                    x: o,
                                    y: a
                                }, {
                                    x: i,
                                    y: a
                                }]);
                            c(((l = uo(p).concat(uo(m)).slice()).sort(function(e, t) {
                                return e.x < t.x ? -1 : e.x > t.x ? 1 : e.y < t.y ? -1 : 1 * !!(e.y > t.y)
                            }), function(e) {
                                if (e.length <= 1) return e.slice();
                                for (var t = [], r = 0; r < e.length; r++) {
                                    for (var n = e[r]; t.length >= 2;) {
                                        var o = t[t.length - 1],
                                            a = t[t.length - 2];
                                        if ((o.x - a.x) * (n.y - a.y) >= (o.y - a.y) * (n.x - a.x)) t.pop();
                                        else break
                                    }
                                    t.push(n)
                                }
                                t.pop();
                                for (var i = [], l = e.length - 1; l >= 0; l--) {
                                    for (var c = e[l]; i.length >= 2;) {
                                        var u = i[i.length - 1],
                                            s = i[i.length - 2];
                                        if ((u.x - s.x) * (c.y - s.y) >= (u.y - s.y) * (c.x - s.x)) i.pop();
                                        else break
                                    }
                                    i.push(c)
                                }
                                return (i.pop(), 1 === t.length && 1 === i.length && t[0].x === i[0].x && t[0].y === i[0].y) ? t : t.concat(i)
                            }(l))), d(!0)
                        }, [d]);
                    return Z.useEffect(function() {
                        return function() {
                            return p()
                        }
                    }, [p]), Z.useEffect(function() {
                        if (u && f) {
                            var e = function(e) {
                                    return m(e, f)
                                },
                                t = function(e) {
                                    return m(e, u)
                                };
                            return u.addEventListener("pointerleave", e), f.addEventListener("pointerleave", t),
                                function() {
                                    u.removeEventListener("pointerleave", e), f.removeEventListener("pointerleave", t)
                                }
                        }
                    }, [u, f, m, p]), Z.useEffect(function() {
                        if (l) {
                            var e = function(e) {
                                var t = e.target,
                                    r = {
                                        x: e.clientX,
                                        y: e.clientY
                                    },
                                    n = (null == u ? void 0 : u.contains(t)) || (null == f ? void 0 : f.contains(t)),
                                    o = ! function(e, t) {
                                        for (var r = e.x, n = e.y, o = !1, a = 0, i = t.length - 1; a < t.length; i = a++) {
                                            var l = t[a].x,
                                                c = t[a].y,
                                                u = t[i].x,
                                                s = t[i].y;
                                            c > n != s > n && r < (u - l) * (n - c) / (s - c) + l && (o = !o)
                                        }
                                        return o
                                    }(r, l);
                                n ? p() : o && (p(), s())
                            };
                            return document.addEventListener("pointermove", e),
                                function() {
                                    return document.removeEventListener("pointermove", e)
                                }
                        }
                    }, [u, f, l, s, p]), (0, $.jsx)(uk, ut(ue({}, e), {
                        ref: a
                    }))
                }),
                uN = un(ul(uy, {
                    isInside: !1
                }), 2),
                uR = uN[0],
                uT = uN[1],
                uk = Z.forwardRef(function(e, t) {
                    var r = e.__scopeTooltip,
                        n = e.children,
                        o = e["aria-label"],
                        a = e.onEscapeKeyDown,
                        i = e.onPointerDownOutside,
                        l = ur(e, ["__scopeTooltip", "children", "aria-label", "onEscapeKeyDown", "onPointerDownOutside"]),
                        c = uh(uA, r),
                        u = uc(r),
                        s = c.onClose;
                    return Z.useEffect(function() {
                        return document.addEventListener(us, s),
                            function() {
                                return document.removeEventListener(us, s)
                            }
                    }, [s]), Z.useEffect(function() {
                        if (c.trigger) {
                            var e = function(e) {
                                var t = e.target;
                                (null == t ? void 0 : t.contains(c.trigger)) && s()
                            };
                            return window.addEventListener("scroll", e, {
                                    capture: !0
                                }),
                                function() {
                                    return window.removeEventListener("scroll", e, {
                                        capture: !0
                                    })
                                }
                        }
                    }, [c.trigger, s]), (0, $.jsx)(n2.DismissableLayer, {
                        asChild: !0,
                        disableOutsidePointerEvents: !1,
                        onEscapeKeyDown: a,
                        onPointerDownOutside: i,
                        onFocusOutside: function(e) {
                            return e.preventDefault()
                        },
                        onDismiss: s,
                        children: (0, $.jsxs)(cq, ut(ue({
                            "data-state": c.stateAttribute
                        }, u, l), {
                            ref: t,
                            style: ue({}, l.style, {
                                "--radix-tooltip-content-transform-origin": "var(--radix-popper-transform-origin)",
                                "--radix-tooltip-content-available-width": "var(--radix-popper-available-width)",
                                "--radix-tooltip-content-available-height": "var(--radix-popper-available-height)",
                                "--radix-tooltip-trigger-width": "var(--radix-popper-anchor-width)",
                                "--radix-tooltip-trigger-height": "var(--radix-popper-anchor-height)"
                            }),
                            children: [(0, $.jsx)(cy, {
                                children: n
                            }), (0, $.jsx)(uR, {
                                scope: r,
                                isInside: !0,
                                children: (0, $.jsx)(c7, {
                                    id: c.contentId,
                                    role: "tooltip",
                                    children: o || n
                                })
                            })]
                        }))
                    })
                });
            uC.displayName = uA;
            var uD = "TooltipArrow",
                uM = Z.forwardRef(function(e, t) {
                    var r = e.__scopeTooltip,
                        n = ur(e, ["__scopeTooltip"]),
                        o = uc(r);
                    return uT(uD, r).isInside ? null : (0, $.jsx)(cG, ut(ue({}, o, n), {
                        ref: t
                    }))
                });

            function uL(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function u_(e) {
                var t, r = e.position,
                    n = e.hasBeak,
                    o = e.title,
                    a = e.description,
                    i = e.ariaLabel,
                    l = e.delayDurationMs,
                    c = e.children,
                    u = e.open,
                    s = e.onOpenChange,
                    f = e.contentClassName,
                    d = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = r.split("-")) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                a = !0,
                                i = !1;
                            try {
                                for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                            } catch (e) {
                                i = !0, r = e
                            } finally {
                                try {
                                    a || null == n.return || n.return()
                                } finally {
                                    if (i) throw r
                                }
                            }
                            return o
                        }
                    }(t) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return uL(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return uL(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    p = d[0],
                    m = d[1],
                    y = null != i ? i : "string" == typeof o && null == a ? o : void 0;
                return Z.createElement(um, {
                    delayDuration: void 0 === l ? 500 : l
                }, Z.createElement(ug, {
                    open: u,
                    onOpenChange: s
                }, c, Z.createElement(uE, null, Z.createElement(uC, {
                    side: p,
                    align: m,
                    "aria-label": y,
                    className: tH("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", f),
                    sideOffset: 5
                }, (void 0 === n || n) && Z.createElement(uM, {
                    asChild: !0
                }, Z.createElement(im, {
                    className: "content-[var(--inverse-surface-0)]"
                })), Z.createElement("div", {
                    className: "flex flex-col text-truncate-split"
                }, Z.createElement("div", {
                    className: "text-caption-medium content-inverse-default"
                }, o), a && Z.createElement("div", {
                    className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
                }, a))))))
            }

            function uF(e) {
                var t = e.children,
                    r = e.asChild,
                    n = e.className;
                return Z.createElement(uw, {
                    asChild: r,
                    className: n
                }, t)
            }
            uM.displayName = uD;
            var uU = function(e) {
                    var t = e.item,
                        r = e.overlay,
                        n = (0, Q.useTranslation)().translate,
                        o = t.itemTarget.itemType,
                        a = ee.ItemCardUtils.checkIfBundle(o),
                        i = null != t.serialNumber,
                        l = eC(t, n),
                        c = function() {
                            return (0, $.jsxs)(J().Fragment, {
                                children: [(0, $.jsx)("span", {
                                    className: "icon-shop-limited"
                                }), i && (0, $.jsxs)("span", {
                                    className: "limited-number-container",
                                    children: [(0, $.jsx)("span", {
                                        className: "font-caption-header",
                                        children: "#"
                                    }), (0, $.jsx)("span", {
                                        className: "font-caption-header text-subheader limited-number",
                                        children: t.serialNumber
                                    })]
                                })]
                            })
                        },
                        u = l ? (0, $.jsx)(u_, {
                            position: "top-center",
                            delayDurationMs: 0,
                            contentClassName: "trade-serial-tooltip",
                            title: l,
                            children: (0, $.jsxs)("span", {
                                className: "limited-icon-container",
                                children: [c(), (0, $.jsx)(uF, {
                                    asChild: !0,
                                    children: (0, $.jsx)("span", {
                                        className: "limited-hover-target",
                                        "aria-hidden": "true",
                                        children: c()
                                    })
                                })]
                            })
                        }) : (0, $.jsx)("span", {
                            className: "limited-icon-container",
                            children: c()
                        });
                    return (0, $.jsx)(ee.ItemCard, {
                        id: t.itemTarget.targetId,
                        name: t.itemName,
                        type: o,
                        creatorName: void 0,
                        creatorType: "",
                        creatorTargetId: 0,
                        price: t.recentAveragePrice,
                        lowestPrice: void 0,
                        priceStatus: void 0,
                        premiumPricing: void 0,
                        unitsAvailableForConsumption: void 0,
                        itemStatus: void 0,
                        itemRestrictions: void 0,
                        thumbnail2d: (0, $.jsxs)(J().Fragment, {
                            children: [(0, $.jsx)(nl.Thumbnail2d, {
                                type: a ? nl.ThumbnailTypes.bundleThumbnail : nl.ThumbnailTypes.assetThumbnail,
                                targetId: t.itemTarget.targetId,
                                size: nl.DefaultThumbnailSize
                            }), u, r]
                        })
                    })
                },
                uz = function(e) {
                    var t = e.offer,
                        r = e.label,
                        n = (0, Q.useTranslation)().translate,
                        o = !!(t.robux && t.robux > 0);
                    return (0, $.jsxs)("div", {
                        className: "trade-list-detail-offer",
                        children: [(0, $.jsx)(ni, {
                            className: "trade-offer-divider"
                        }), (0, $.jsx)("h3", {
                            className: "trade-list-detail-offer-header font-header-1",
                            children: r
                        }), (0, $.jsx)("ul", {
                            className: "hlist item-cards item-cards-stackable",
                            children: t.items.map(function(e) {
                                return (0, $.jsx)("li", {
                                    className: "list-item item-card trade-item-card",
                                    children: (0, $.jsx)(uU, {
                                        item: e
                                    })
                                }, e.collectibleItemInstanceId)
                            })
                        }), (0, $.jsxs)("div", {
                            children: [o && (0, $.jsxs)("div", {
                                className: "robux-line",
                                children: [(0, $.jsx)("span", {
                                    className: "text-label",
                                    children: n("Label.RobuxOfferedAfterFee", {
                                        percent: "".concat(ex())
                                    })
                                }), (0, $.jsxs)("span", {
                                    className: "robux-line-amount",
                                    children: [(0, $.jsx)("span", {
                                        className: "icon-robux-gray-16x16"
                                    }), (0, $.jsx)("span", {
                                        className: "text-label robux-line-value",
                                        children: (0, eb.formatNumber)(eS(t.robux))
                                    })]
                                })]
                            }), (0, $.jsxs)("div", {
                                className: "robux-line",
                                children: [(0, $.jsx)("span", {
                                    className: "text-lead",
                                    children: n("Label.TotalValue")
                                }), (0, $.jsxs)("span", {
                                    className: "robux-line-amount",
                                    children: [(0, $.jsx)("span", {
                                        className: "icon-robux-16x16"
                                    }), (0, $.jsx)("span", {
                                        className: "text-robux-lg robux-line-value",
                                        children: (0, eb.formatNumber)(eP(t))
                                    })]
                                })]
                            })]
                        })]
                    })
                },
                uK = function(e) {
                    var t = e.type,
                        r = e.sideSheetSide,
                        n = e.isSideSheetFlush,
                        o = e.centerSheetSize,
                        a = e.children,
                        i = e.overlayClassName,
                        l = e.contentClassName,
                        c = e.onOpenAutoFocus,
                        u = e.onCloseAutoFocus,
                        s = e.onPointerDownOutside,
                        f = e.onEscapeKeyDown,
                        d = e.onInteractOutside;
                    return J().createElement(aE, null, J().createElement(aC, {
                        "data-testid": "fui-base-sheet-overlay",
                        "data-type": t,
                        "data-side": "sideSheet" === t ? void 0 === r ? "right" : r : void 0,
                        "data-flush": "sideSheet" === t ? void 0 !== n && n : void 0,
                        "data-size": "centerSheet" === t ? void 0 === o ? "Medium" : o : void 0,
                        className: tH("fui-base-sheet-overlay", "foundation-web-portal-zindex fixed inset-[0] flex", i)
                    }, J().createElement(aT, {
                        "data-testid": "fui-base-sheet-content",
                        className: tH("fui-base-sheet-content relative bg-surface-100 stroke-muted stroke-standard shadow-transient-high", "flex flex-col clip", l),
                        onOpenAutoFocus: c,
                        onCloseAutoFocus: u,
                        onPointerDownOutside: s,
                        onEscapeKeyDown: f,
                        onInteractOutside: d
                    }, a)))
                };

            function uH(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var uW = function(e) {
                    return ("function" != typeof e.checkVisibility || e.checkVisibility()) && !("disabled" in e && e.disabled || "true" === e.getAttribute("aria-disabled"))
                },
                uB = function(e) {
                    uH(e, HTMLInputElement) && "function" == typeof e.select && e.select()
                },
                uV = function(e) {
                    var t = e.currentTarget;
                    if (t) {
                        var r = t.querySelectorAll("[data-autofocus-priority]");
                        if (0 !== r.length) {
                            var n = [];
                            r.forEach(function(e) {
                                var t = parseInt(e.getAttribute("data-autofocus-priority") || "", 10);
                                !Number.isNaN(t) && uH(e, HTMLElement) && n.push({
                                    element: e,
                                    priority: t
                                })
                            }), n.sort(function(e, t) {
                                return e.priority - t.priority
                            });
                            var o = n.find(function(e) {
                                return uW(e.element)
                            });
                            if (o) {
                                e.preventDefault();
                                var a = document.activeElement === o.element;
                                o.element.focus(), a || uB(o.element)
                            }
                        }
                    }
                };

            function uq(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            r(977);
            var uX = "u" > typeof window ? Z.useLayoutEffect : Z.useEffect,
                u$ = "u" < typeof window;

            function uG(e) {
                var t, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    n = r.defaultValue,
                    o = void 0 !== n && n,
                    a = r.initializeWithValue,
                    i = void 0 === a || a,
                    l = function(e) {
                        return u$ ? o : window.matchMedia(e).matches
                    },
                    c = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = (0, Z.useState)(function() {
                        return i ? l(e) : o
                    })) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                a = !0,
                                i = !1;
                            try {
                                for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                            } catch (e) {
                                i = !0, r = e
                            } finally {
                                try {
                                    a || null == n.return || n.return()
                                } finally {
                                    if (i) throw r
                                }
                            }
                            return o
                        }
                    }(t) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return uq(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return uq(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    u = c[0],
                    s = c[1];

                function f() {
                    s(l(e))
                }
                return uX(function() {
                    var t = window.matchMedia(e);
                    return f(), t.addListener ? t.addListener(f) : t.addEventListener("change", f),
                        function() {
                            t.removeListener ? t.removeListener(f) : t.removeEventListener("change", f)
                        }
                }, [e]), u
            }

            function uY(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function uQ(e) {
                if (Array.isArray(e)) return e
            }

            function uZ() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function uJ(e) {
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

            function u0(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function u1(e, t) {
                if (e) {
                    if ("string" == typeof e) return uY(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return uY(e, t)
                }
            }
            var u2 = (0, Z.createContext)(null),
                u8 = function() {
                    var e = (0, Z.useContext)(u2);
                    if (!e) throw Error("Sheet components must be used within a Sheet");
                    return e
                },
                u3 = "padding-x-xlarge",
                u6 = function(e) {
                    var t = e.open,
                        r = e.onOpenChange,
                        n = e.defaultOpen,
                        o = e.children;
                    return J().createElement(aO, {
                        open: t,
                        onOpenChange: r,
                        defaultOpen: n,
                        modal: !0
                    }, o)
                },
                u4 = function(e) {
                    var t, r = e.children,
                        n = e.centerSheetSize,
                        o = void 0 === n ? "Medium" : n,
                        a = e.largeScreenVariant,
                        i = void 0 === a ? "center" : a,
                        l = e.closeLabel,
                        c = e.className,
                        u = e.mobilePortraitClassName,
                        s = e.mobileLandscapeClassName,
                        f = e.largeScreenClassName,
                        d = e.onOpenAutoFocus,
                        p = e.onCloseAutoFocus,
                        m = e.onPointerDownOutside,
                        y = e.onEscapeKeyDown,
                        b = e.onInteractOutside,
                        v = uG("(orientation: portrait) and (max-width: 600px)"),
                        h = uG("(orientation: landscape) and (max-height: 600px)");
                    t = v ? "bottomSheet" : h || "side" === i ? "sideSheet" : "centerSheet";
                    var g = (0, Z.useMemo)(function() {
                            return {
                                centerSheetSize: o,
                                largeScreenVariant: i,
                                closeLabel: l,
                                isPortraitMobile: v,
                                isLandscapeMobile: h,
                                type: t
                            }
                        }, [o, i, l, v, h, t]),
                        O = tH(c, v && u, h && s, !v && !h && f);
                    return J().createElement(u2.Provider, {
                        value: g
                    }, J().createElement(uK, {
                        type: t,
                        sideSheetSide: "right",
                        isSideSheetFlush: h,
                        centerSheetSize: o,
                        contentClassName: O,
                        onOpenAutoFocus: null != d ? d : uV,
                        onCloseAutoFocus: p,
                        onPointerDownOutside: m,
                        onEscapeKeyDown: y,
                        onInteractOutside: b
                    }, r))
                },
                u5 = (0, Z.forwardRef)(function(e, t) {
                    var r, n = uQ(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || u1(r) || uZ(),
                        o = n[0],
                        a = n.slice(1),
                        i = o.children,
                        l = o.className,
                        c = o.hasPaddingX,
                        u = u0(o, ["children", "className", "hasPaddingX"]),
                        s = (uQ(a) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(a) || u1(a, 1) || uZ())[0],
                        f = u8().type;
                    return J().createElement("div", uJ({
                        ref: s,
                        className: tH("scroll-y", (void 0 === c || c) && u3, "sideSheet" === f ? "grow-1" : "", l)
                    }, u), i)
                });
            u5.displayName = "SheetBody";
            var u7 = function(e) {
                    var t = e.className,
                        r = e.children,
                        n = e.navigation,
                        o = e.utilities,
                        a = e.visuallyHideTitleText,
                        i = u8().closeLabel,
                        l = J().createElement(a_, {
                            className: "text-heading-small margin-none"
                        }, r);
                    return J().createElement("div", {
                        className: tH(t, n ? "padding-left-medium" : "padding-left-xlarge", "padding-right-small padding-y-small", "flex items-center justify-between")
                    }, J().createElement("div", {
                        className: tH("flex items-center", n && "gap-xsmall")
                    }, n, a ? J().createElement(a7, null, l) : l), J().createElement("div", {
                        className: tH("flex items-center", o && "gap-xxsmall")
                    }, o, J().createElement("div", {
                        className: "fui-sheet-close-affordance-container"
                    }, J().createElement(aK, {
                        asChild: !0
                    }, J().createElement(rp, {
                        variant: "Utility",
                        size: "Medium",
                        icon: "icon-regular-x",
                        ariaLabel: i || "",
                        "data-autofocus-priority": "1000"
                    })))))
                },
                u9 = function(e) {
                    var t = e.children,
                        r = e.className,
                        n = u0(e, ["children", "className"]);
                    return J().createElement(J().Fragment, null, J().createElement(ni, null), J().createElement("div", uJ({
                        className: tH(u3, "margin-y-small shrink-0", r)
                    }, n), t))
                },
                se = function(e) {
                    return J().createElement(aU, uJ({
                        asChild: !0
                    }, e))
                },
                st = [{
                    icon: "icon-regular-hand-two-arrows-horizontal",
                    labelKey: "Label.UnlimitedTradesPerMonth"
                }, {
                    icon: "icon-regular-tag",
                    labelKey: "Label.PercentOffInGameItemsAvatarsAndMore",
                    values: {
                        percent: 10
                    }
                }, {
                    icon: "icon-regular-tag-arrow-up",
                    labelKey: "Label.PercentOffTheseItemsAfterMonths",
                    values: {
                        percent: 20,
                        months: 2
                    }
                }, {
                    icon: "icon-regular-controller",
                    labelKey: "Label.FreeAndUnlimitedPrivateServers"
                }, {
                    icon: "icon-regular-robux",
                    labelKey: "Label.SendRobuxForFree"
                }],
                sr = function(e) {
                    var t = e.isOpen,
                        r = e.onOpenChange,
                        n = e.onGetPlusClick,
                        o = e.titleKey,
                        a = (0, Q.useTranslation)().translate;
                    return (0, $.jsx)(u6, {
                        open: t,
                        onOpenChange: r,
                        children: (0, $.jsxs)(u4, {
                            largeScreenVariant: "center",
                            className: "trades-sheet trades-sheet-flush-actions",
                            mobilePortraitClassName: "trades-sheet-full-bleed",
                            closeLabel: a("Action.Close"),
                            children: [(0, $.jsx)(u7, {
                                children: (0, $.jsxs)("span", {
                                    className: "trade-plus-upsell-title",
                                    children: [(0, $.jsx)(rH, {
                                        name: "icon-regular-roblox-plus",
                                        size: "Large"
                                    }), a(void 0 === o ? "Header.GetUnlimitedTradesWithPlus" : o)]
                                })
                            }), (0, $.jsx)(u5, {
                                children: (0, $.jsx)("ul", {
                                    className: "trade-plus-benefits",
                                    children: st.map(function(e) {
                                        return (0, $.jsxs)("li", {
                                            className: "trade-plus-benefit",
                                            children: [(0, $.jsx)(rH, {
                                                name: e.icon,
                                                size: "Medium",
                                                className: "trade-plus-benefit-icon",
                                                "aria-hidden": !0
                                            }), a(e.labelKey, e.values)]
                                        }, e.labelKey)
                                    })
                                })
                            }), (0, $.jsx)(u9, {
                                className: "trade-plus-upsell-actions",
                                children: (0, $.jsx)(nS, {
                                    as: "a",
                                    href: ep.urls.membership,
                                    onClick: n,
                                    variant: "Emphasis",
                                    size: "Medium",
                                    children: a("Action.GetPlus")
                                })
                            })]
                        })
                    })
                },
                sn = function(e) {
                    var t = e.title,
                        r = e.description;
                    return (0, $.jsxs)(J().Fragment, {
                        children: [(0, $.jsxs)("div", {
                            className: "trade-age-check-art",
                            children: [(0, $.jsxs)("span", {
                                className: "trade-age-check-art-card trade-age-check-art-card-shield",
                                children: [(0, $.jsx)("span", {
                                    className: "tilted-glyph-frame"
                                }), (0, $.jsx)(rH, {
                                    name: "icon-regular-shield-check",
                                    className: "tilted-glyph",
                                    size: "XXLarge"
                                })]
                            }), (0, $.jsxs)("span", {
                                className: "trade-age-check-art-card trade-age-check-art-card-trade",
                                children: [(0, $.jsx)("span", {
                                    className: "tilted-glyph-frame"
                                }), (0, $.jsx)(rH, {
                                    name: "icon-regular-hand-two-arrows-horizontal",
                                    className: "tilted-glyph",
                                    size: "XXLarge"
                                })]
                            })]
                        }), (0, $.jsxs)("div", {
                            className: "trade-age-check-copy",
                            children: [(0, $.jsx)("h2", {
                                className: "trade-age-check-title",
                                "aria-hidden": !0,
                                children: t
                            }), r]
                        })]
                    })
                },
                so = function(e) {
                    var t = e.isOpen,
                        r = e.onOpenChange,
                        n = e.onContinue,
                        o = (0, Q.useTranslation)().translate,
                        a = (0, Z.useMemo)(function() {
                            return eR()
                        }, []),
                        i = o("Title.LetsCheckYourAge"),
                        l = (0, $.jsx)("p", {
                            className: "trade-age-check-description",
                            children: o("Message.ThisMakesSendingAndReceiving")
                        }),
                        c = (0, $.jsx)(nS, {
                            variant: "Emphasis",
                            size: "Medium",
                            onClick: n,
                            children: o("Action.Continue")
                        });
                    return a ? (0, $.jsx)(u6, {
                        open: t,
                        onOpenChange: r,
                        children: (0, $.jsxs)(u4, {
                            largeScreenVariant: "center",
                            className: "trades-sheet trades-sheet-flush-actions",
                            mobilePortraitClassName: "trades-sheet-full-bleed",
                            closeLabel: o("Action.Close"),
                            children: [(0, $.jsx)(u7, {
                                visuallyHideTitleText: !0,
                                children: i
                            }), (0, $.jsx)(u5, {
                                children: (0, $.jsx)(sn, {
                                    title: i,
                                    description: (0, $.jsx)(se, {
                                        children: l
                                    })
                                })
                            }), (0, $.jsx)(u9, {
                                className: "trade-age-check-actions",
                                children: c
                            })]
                        })
                    }) : (0, $.jsx)(il, {
                        open: t,
                        onOpenChange: r,
                        size: "Medium",
                        isModal: !0,
                        hasCloseAffordance: !0,
                        closeLabel: o("Action.Close"),
                        children: (0, $.jsxs)(ic, {
                            style: {
                                width: "100%"
                            },
                            children: [(0, $.jsxs)(iu, {
                                children: [(0, $.jsx)(is, {
                                    hidden: !0,
                                    children: i
                                }), (0, $.jsx)(sn, {
                                    title: i,
                                    description: l
                                })]
                            }), (0, $.jsx)(id, {
                                className: "trade-age-check-actions",
                                children: c
                            })]
                        })
                    })
                };

            function sa(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function si(e) {
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

            function sl(e, t) {
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

            function sc(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
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
            var su = function(e) {
                    var t = e.trade,
                        r = e.detailLoading,
                        n = e.isMobile,
                        o = e.onBack,
                        a = e.onProfileClick,
                        i = e.onTradeRemoved,
                        l = e.systemFeedbackService,
                        c = (0, Q.useTranslation)().translate,
                        u = ec().navigate,
                        s = nD(l),
                        f = rL(),
                        d = sc((0, Z.useState)(null), 2),
                        p = d[0],
                        m = d[1],
                        y = sc((0, Z.useState)(""), 2),
                        b = y[0],
                        v = y[1],
                        h = sc((0, Z.useState)(!1), 2),
                        g = h[0],
                        O = h[1],
                        w = (0, Z.useRef)(!1),
                        j = (0, Z.useRef)(null);
                    if (!t) return n ? null : (0, $.jsx)("div", {
                        className: "trade-detail-placeholder",
                        children: c("Label.TradeDetailsWillShowUpHere")
                    });
                    var x = t.status === ep.tradeStatus.open,
                        S = t.tradeStatusType === ep.tradeStatusType.inbound,
                        P = t.tradeStatusType === ep.tradeStatusType.outbound,
                        E = t.offers ? t.offers.toSorted(function(e, t) {
                            return Number(nc(t)) - Number(nc(e))
                        }) : [],
                        A = function(e) {
                            var t = Math.ceil(e.ExpirationTimeInMinutes / 60),
                                r = c(ep.economicRestrictionsViolationLabels[e.FailureReason]);
                            v(t > 24 ? c("Text.EconomicRestrictionsDaysGeneral", {
                                violation: r,
                                day: Math.ceil(t / 24)
                            }) : c("Text.EconomicRestrictionsHoursGeneral", {
                                violation: r,
                                hour: t
                            })), m("economic")
                        },
                        C = function(e) {
                            w.current ? l.warning(c("Response.VerificationError")) : (j.current = e, m("ageCheck"))
                        },
                        I = function() {
                            tA("processAccept: accepting trade", t.id), O(!0);
                            var e, r = sl(si({}, th(t)), {
                                tradeId: t.id
                            });
                            (e = t.id, eM(function() {
                                var t, r;
                                return eK(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            return t = {
                                                url: "".concat(ep.urls.tradesApi, "/v1/trades/").concat(e, "/accept"),
                                                withCredentials: !0
                                            }, [4, ey.post(t)];
                                        case 1:
                                            return [2, null != (r = n.sent().data) ? r : {}]
                                    }
                                })
                            })()).then(function(e) {
                                if (tA("processAccept: acceptTrade resolved", e), void 0 !== e.FailureReason && void 0 !== e.ExpirationTimeInMinutes) {
                                    A({
                                        FailureReason: e.FailureReason,
                                        ExpirationTimeInMinutes: e.ExpirationTimeInMinutes
                                    }), O(!1);
                                    return
                                }
                                O(!1), l.success(c("Message.AcceptedTrade")), eG(), i(t.id), tc(e7, "accept", r), tu("tradeCompleted", "accept", r)
                            }).catch(function(e) {
                                var r = eQ(e);
                                if (tC("processAccept: acceptTrade failed", r, e), tv("accept", e, {
                                        tradeId: t.id
                                    }), r.includes(ep.tradeErrors.userCannotTrade)) {
                                    O(!1), e3(e).then(function(e) {
                                        "ageCheck" === e ? C(I) : "upsell" !== e || (0, eu.isBlackbirdUser)() ? l.warning(nR(r, c)) : m("plusUpsell")
                                    }).catch(function() {
                                        l.warning(nR(r, c))
                                    });
                                    return
                                }
                                r.includes(ep.tradeErrors.tradeFrictionEncountered) ? nI().then(function(e) {
                                    e ? s.start() : m("verificationRedirect")
                                }).catch(function() {
                                    m("verificationRedirect")
                                }) : (O(!1), l.warning(nR(r, c)))
                            })
                        },
                        N = function() {
                            tA("processDecline: declining trade", t.id), O(!0);
                            var e, r = sl(si({}, th(t)), {
                                tradeId: t.id
                            });
                            (e = t.id, eM(function() {
                                var t;
                                return eK(this, function(r) {
                                    switch (r.label) {
                                        case 0:
                                            return t = {
                                                url: "".concat(ep.urls.tradesApi, "/v1/trades/").concat(e, "/decline"),
                                                withCredentials: !0
                                            }, [4, ey.post(t)];
                                        case 1:
                                            return r.sent(), [2]
                                    }
                                })
                            })()).then(function() {
                                tA("processDecline: declineTrade resolved"), O(!1), l.success(c("Message.DeclineTradeSuccess")), i(t.id), tu(P ? "tradeCanceled" : "tradeDeclined", P ? "cancel" : "decline", r)
                            }).catch(function(e) {
                                O(!1), tC("processDecline: declineTrade failed", eQ(e), e), tv(P ? "cancel" : "decline", e, {
                                    tradeId: t.id
                                }), l.warning(nR(eQ(e), c))
                            })
                        };
                    return (0, $.jsxs)("div", {
                        children: [(0, $.jsxs)("h2", {
                            className: "trades-header-nowrap font-title",
                            children: [n && (0, $.jsx)(rp, {
                                className: "trade-detail-back",
                                icon: "icon-regular-arrow-small-left",
                                ariaLabel: c("Action.Back"),
                                variant: "Utility",
                                size: "Small",
                                onClick: o
                            }), t.user ? (0, $.jsx)("a", {
                                className: "paired-name",
                                href: "/users/".concat(t.user.id, "/profile"),
                                target: "_blank",
                                rel: "noreferrer",
                                "aria-label": t.user.nameForDisplay,
                                onClick: function() {
                                    a(t, "detailHeader")
                                },
                                dangerouslySetInnerHTML: {
                                    __html: c("Label.TradeWithPartner", {
                                        username: t.user.nameForDisplay
                                    })
                                }
                            }) : (0, $.jsx)("span", {
                                className: "paired-name",
                                dangerouslySetInnerHTML: {
                                    __html: c("Label.TradeWithPartner", {
                                        username: ""
                                    })
                                }
                            })]
                        }), x && (0, $.jsxs)("div", {
                            className: "text-label",
                            children: [c("Label.TradeExpiresOn", {
                                date: ""
                            }), eT(t.expiration)]
                        }), (!t.offers || r) && (0, $.jsx)("div", {
                            className: "flex justify-center margin-y-large",
                            children: (0, $.jsx)(rg, {
                                ariaLabel: c("Label.Loading", void 0, "Loading"),
                                size: "Medium",
                                variant: "Indeterminate"
                            })
                        }), (0, $.jsx)("div", {
                            className: "col-xs-12",
                            children: E.map(function(e, r) {
                                var n, o;
                                return (0, $.jsx)(uz, {
                                    offer: e,
                                    label: ns(t, e, c)
                                }, null != (n = null == (o = e.user) ? void 0 : o.id) ? n : r)
                            })
                        }), x && (0, $.jsxs)("div", {
                            className: "trade-buttons",
                            children: [S && (0, $.jsx)(nS, {
                                variant: "Emphasis",
                                size: "Medium",
                                isDisabled: g,
                                onClick: function() {
                                    if (f.isOutOfTrades) {
                                        tA("accept button clicked while out of trades, opening upsell"), tc(e7, "acceptOutOfTradesUpsell"), m("plusUpsell");
                                        return
                                    }
                                    tA("accept button clicked, opening confirm dialog"), w.current = !1, m("accept")
                                },
                                children: c("Action.AcceptTrade")
                            }), S && t.user && (0, $.jsx)(nS, {
                                variant: "Standard",
                                size: "Medium",
                                isDisabled: g,
                                onClick: function() {
                                    tA("onCounter: countering trade", t.id), tc(e7, "counter"), u({
                                        view: "counter",
                                        tradeId: t.id
                                    })
                                },
                                children: c("Action.CounterTrade")
                            }), (S || P) && (0, $.jsx)(nS, {
                                variant: "Standard",
                                size: "Medium",
                                isDisabled: g,
                                onClick: function() {
                                    tA("decline button clicked, opening confirm dialog"), m("decline")
                                },
                                children: c("Action.DeclineTrade")
                            }), g && (0, $.jsx)("span", {
                                className: "trade-buttons-loading",
                                children: (0, $.jsx)(rg, {
                                    ariaLabel: c("Label.Loading", void 0, "Loading"),
                                    size: "Small",
                                    variant: "Indeterminate"
                                })
                            })]
                        }), (0, $.jsx)(ip, {
                            open: "accept" === p,
                            title: c("Header.AcceptTrade"),
                            body: c("Label.TradesAreFinalOnceComplete"),
                            actionText: c("Action.AcceptTrade"),
                            actionVariant: "Emphasis",
                            neutralText: c("Action.Cancel"),
                            closeLabel: c("Action.Close"),
                            footerNote: (0, $.jsx)("div", {
                                className: "text-footer",
                                children: c("Label.ItemsMayBeHeldUpToDaysAfterTrading", {
                                    days: ep.holdingPeriodDays
                                })
                            }),
                            onAction: function() {
                                m(null), I()
                            },
                            onCancel: function() {
                                m(null)
                            }
                        }), (0, $.jsx)(ip, {
                            open: "decline" === p,
                            title: c("Heading.DeclineTrade"),
                            body: c("Message.DeclineTrade"),
                            actionText: c("Action.DeclineTrade"),
                            actionVariant: "Emphasis",
                            neutralText: c("Action.Cancel"),
                            closeLabel: c("Action.Close"),
                            footerNote: S ? (0, $.jsx)("div", {
                                className: "text-footer",
                                dangerouslySetInnerHTML: {
                                    __html: c("Message.LowballTrades", {
                                        startLink: '<a class="text-link" href="'.concat(ep.urls.privacySettings, '">'),
                                        endLink: "</a>"
                                    })
                                }
                            }) : void 0,
                            onAction: function() {
                                m(null), N(), tc(e7, "decline")
                            },
                            onCancel: function() {
                                m(null)
                            }
                        }), (0, $.jsx)(ip, {
                            open: "economic" === p,
                            title: c("Heading.EconomicRestrictionsError"),
                            body: b,
                            showAction: !1,
                            neutralText: c("Action.Cancel"),
                            closeLabel: c("Action.Close"),
                            onCancel: function() {
                                m(null)
                            }
                        }), (0, $.jsx)(ip, {
                            open: "verificationRedirect" === p,
                            title: c("Heading.TwoStepVerificationRequired"),
                            body: c("Message.TwoStepVerificationRequired"),
                            actionText: c("Action.GoToSecurity"),
                            actionVariant: "Emphasis",
                            neutralText: c("Action.Cancel"),
                            closeLabel: c("Action.Close"),
                            onAction: function() {
                                m(null), nN()
                            },
                            onCancel: function() {
                                m(null), O(!1)
                            }
                        }), (0, $.jsx)(sr, {
                            isOpen: "plusUpsell" === p,
                            onOpenChange: function(e) {
                                e || m(null)
                            },
                            onGetPlusClick: function() {
                                tc(e7, "getPlusUpsell")
                            }
                        }), (0, $.jsx)(so, {
                            isOpen: "ageCheck" === p,
                            onOpenChange: function(e) {
                                e || m(null)
                            },
                            onContinue: function() {
                                m(null), w.current = !0;
                                var e = j.current;
                                nC("accept-trade").then(function(t) {
                                    t && (null == e || e())
                                }).catch(function(e) {
                                    tC("startAgeCheck: FAE flow failed", e), tv("facialAgeEstimation", e, {
                                        source: "acceptTrade"
                                    }), l.warning(c("Response.VerificationError"))
                                })
                            }
                        })]
                    })
                },
                ss = function(e) {
                    var t, r, n = e.title,
                        o = e.subtitle,
                        a = e.action,
                        i = e.className;
                    return (0, $.jsxs)("div", {
                        className: "col-xs-12 trades-empty-state".concat(i ? " ".concat(i) : ""),
                        children: [(0, $.jsxs)("div", {
                            className: "trades-empty-state-art",
                            children: [(0, $.jsx)("span", {
                                className: "tilted-glyph-frame"
                            }), (0, $.jsx)(rH, {
                                name: "icon-regular-hand-two-arrows-horizontal",
                                className: "tilted-glyph",
                                size: "XXLarge"
                            })]
                        }), (0, $.jsxs)("div", {
                            className: "trades-empty-state-copy",
                            children: [(0, $.jsx)("div", {
                                className: "trades-empty-state-title",
                                children: n
                            }), (0, $.jsx)("div", {
                                className: "trades-empty-state-subtitle",
                                children: o
                            })]
                        }), a && (a.href ? (0, $.jsx)(nS, {
                            as: "a",
                            href: a.href,
                            onClick: a.onClick,
                            variant: null != (t = a.variant) ? t : "Standard",
                            size: "Medium",
                            children: a.label
                        }) : (0, $.jsx)(nS, {
                            onClick: a.onClick,
                            variant: null != (r = a.variant) ? r : "Standard",
                            size: "Medium",
                            children: a.label
                        }))]
                    })
                };

            function sf(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function sd(e) {
                if (Array.isArray(e)) return e
            }

            function sp() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function sm(e, t) {
                if (e) {
                    if ("string" == typeof e) return sf(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return sf(e, t)
                }
            }
            var sy = {
                    Compact: "gap-small",
                    Default: "gap-medium"
                },
                sb = {
                    Compact: "text-body-small",
                    Default: "text-body-medium"
                },
                sv = {
                    Standard: "bg-none [box-shadow:inset_0_0_0_var(--stroke-standard)_var(--color-stroke-default)]",
                    Emphasis: "bg-shift-200"
                },
                sh = {
                    Standard: "[box-shadow:inset_0_calc(var(--stroke-standard)*-1)_0_0_var(--color-stroke-default)]",
                    Emphasis: "[background-image:linear-gradient(var(--color-shift-200),var(--color-shift-200))]"
                },
                sg = (0, Z.forwardRef)(function(e, t) {
                    var r, n = sd(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || sm(r) || sp(),
                        o = n[0],
                        a = n.slice(1),
                        i = o.children,
                        l = o.leading,
                        c = o.trailing,
                        u = o.variant,
                        s = void 0 === u ? "Standard" : u,
                        f = o.density,
                        d = o.isAffixed,
                        p = void 0 !== d && d,
                        m = o.className,
                        y = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(o, ["children", "leading", "trailing", "variant", "density", "isAffixed", "className"]),
                        b = (sd(a) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(a) || sm(a, 1) || sp())[0],
                        v = null != f ? f : p ? "Default" : "Compact",
                        h = "Compact" === v ? "padding-medium" : "padding-large";
                    return "Default" === v && p && (h = "padding-y-large padding-x-xlarge"), J().createElement("div", function(e) {
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
                        ref: b,
                        className: tH("foundation-web-context-banner flex items-center width-full min-width-0 [box-sizing:border-box]", h, p ? tH("sticky top-[0] [z-index:1] radius-none bg-surface-100", sh[s]) : tH("radius-medium", sv[s]), m)
                    }, y), J().createElement("div", {
                        className: "flex items-center width-full min-width-0 gap-large padding-y-xxsmall min-height-600 [box-sizing:border-box]"
                    }, J().createElement("div", {
                        className: tH("flex items-center fill min-width-0", sy[v])
                    }, l && J().createElement("div", {
                        className: "flex items-center shrink-0"
                    }, l), J().createElement("div", {
                        className: tH("content-emphasis min-width-0 text-truncate-split text-no-wrap", sb[v])
                    }, i)), c && J().createElement("div", {
                        className: "flex items-center shrink-0"
                    }, c)))
                });

            function sO(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function sw(e) {
                if (Array.isArray(e)) return e
            }

            function sj() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function sx(e, t) {
                if (e) {
                    if ("string" == typeof e) return sO(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return sO(e, t)
                }
            }
            sg.displayName = "ContextBanner";
            var sS = {
                    Neutral: "bg-shift-200",
                    Standard: "bg-shift-200",
                    Contrast: "bg-system-contrast",
                    Emphasis: "bg-system-emphasis",
                    Success: "bg-[rgb(from_var(--color-system-success)_r_g_b_/_0.2)]",
                    Warning: "bg-[rgb(from_var(--color-system-warning)_r_g_b_/_0.2)]",
                    Alert: "bg-[rgb(from_var(--color-system-alert)_r_g_b_/_0.2)]",
                    OverMedia: "bg-over-media-0"
                },
                sP = {
                    Neutral: "content-emphasis",
                    Standard: "content-emphasis",
                    Contrast: "content-inverse-emphasis",
                    Emphasis: "content-[var(--dark-mode-content-emphasis)]",
                    Success: "content-emphasis",
                    Warning: "content-emphasis",
                    Alert: "content-emphasis",
                    OverMedia: "content-emphasis"
                },
                sE = {
                    Neutral: "content-emphasis",
                    Standard: "content-emphasis",
                    Contrast: "content-inverse-emphasis",
                    Emphasis: "content-[var(--dark-mode-content-emphasis)]",
                    Success: "content-system-success",
                    Warning: "content-system-warning",
                    Alert: "content-system-alert",
                    OverMedia: "content-emphasis"
                },
                sA = {
                    Neutral: "stroke-none",
                    Standard: "stroke-none",
                    Contrast: "stroke-none",
                    Emphasis: "stroke-none",
                    Success: "stroke-none",
                    Warning: "stroke-none",
                    Alert: "stroke-none",
                    OverMedia: "stroke-none"
                },
                sC = {
                    Small: "height-600",
                    XSmall: "height-400"
                },
                sI = {
                    Small: "padding-x-small",
                    XSmall: "padding-x-xsmall"
                },
                sN = {
                    Small: "width-600",
                    XSmall: "width-400"
                },
                sR = {
                    Small: "text-label-small",
                    XSmall: "text-caption-small"
                },
                sT = {
                    Small: "padding-y-xsmall",
                    XSmall: "padding-y-none"
                },
                sk = {
                    Small: "XSmall",
                    XSmall: "XSmall"
                },
                sD = {
                    Pill: "radius-circle",
                    Box: "radius-small"
                },
                sM = J().forwardRef(function(e, t) {
                    var r, n, o, a = sw(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || sx(r) || sj(),
                        i = a[0],
                        l = a.slice(1),
                        c = i.className,
                        u = i.label,
                        s = i.variant,
                        f = void 0 === s ? "Standard" : s,
                        d = i.icon,
                        p = i.iconPosition,
                        m = void 0 === p ? "Leading" : p,
                        y = i.size,
                        b = void 0 === y ? "Small" : y,
                        v = i.shape,
                        h = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(i, ["className", "label", "variant", "icon", "iconPosition", "size", "shape"]),
                        g = (sw(l) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(l) || sx(l, 1) || sj())[0],
                        O = d && !u,
                        w = "padding-x-xxsmall";
                    d && (w = "Leading" === m ? "padding-right-xxsmall" : "padding-left-xxsmall");
                    var j = d && J().createElement(rH, {
                        name: d,
                        size: sk[b],
                        className: sE[f]
                    });
                    return J().createElement("div", (n = function(e) {
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
                        ref: g
                    }, h), o = o = {
                        className: tH("foundation-web-badge flex items-center select-none gap-[var(--size-150)]", sD[void 0 === v ? "Pill" : v], sC[b], O ? [sN[b], "justify-center"] : ["width-[fit-content]", sI[b]], sS[f], sP[f], sA[f], c)
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(o)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(o)).forEach(function(e) {
                        Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(o, e))
                    }), n), "Leading" === m && j, u && J().createElement("span", {
                        className: tH("text-no-wrap text-truncate-split", sR[b], sT[b], w, sP[f])
                    }, u), "Trailing" === m && j)
                });
            sM.displayName = "Badge";
            var sL = function(e) {
                    var t = e.message,
                        r = e.endsLabel;
                    return (0, $.jsx)(sg, {
                        className: "trades-quota-banner",
                        density: "Default",
                        leading: (0, $.jsx)(rH, {
                            name: "icon-regular-hand-two-arrows-horizontal",
                            size: "Medium"
                        }),
                        trailing: (0, $.jsx)(sM, {
                            icon: "icon-regular-clock",
                            label: r,
                            shape: "Box"
                        }),
                        children: (0, $.jsx)("span", {
                            className: "trades-quota-banner-message",
                            children: t
                        })
                    })
                },
                s_ = function(e) {
                    var t = e.title,
                        r = e.body,
                        n = e.ctaLabel,
                        o = e.ctaHref,
                        a = e.dismissLabel,
                        i = e.onCtaClick,
                        l = e.onDismiss;
                    return (0, $.jsxs)("div", {
                        className: "trades-upsell-card",
                        children: [(0, $.jsxs)("div", {
                            className: "trades-upsell-card-content",
                            children: [(0, $.jsxs)("div", {
                                className: "trades-upsell-card-copy",
                                children: [(0, $.jsx)("div", {
                                    className: "trades-upsell-card-title",
                                    children: t
                                }), (0, $.jsx)("div", {
                                    className: "trades-upsell-card-body",
                                    children: r
                                })]
                            }), (0, $.jsx)(nS, {
                                as: "a",
                                href: o,
                                onClick: i,
                                variant: "SoftEmphasis",
                                size: "Small",
                                children: n
                            })]
                        }), (0, $.jsxs)("div", {
                            className: "trades-upsell-card-media",
                            children: [(0, $.jsx)("span", {
                                className: "tilted-glyph-frame"
                            }), (0, $.jsx)(rH, {
                                name: "icon-regular-roblox-plus",
                                className: "tilted-glyph",
                                size: "XXLarge"
                            })]
                        }), (0, $.jsx)(rp, {
                            className: "trades-upsell-card-dismiss",
                            icon: "icon-regular-x",
                            ariaLabel: a,
                            variant: "OverMedia",
                            size: "XSmall",
                            isCircular: !0,
                            onClick: l
                        })]
                    })
                },
                sF = [{
                    icon: "icon-regular-shopping-cart",
                    titleKey: "Label.ShopForRobloxLimitedItems",
                    descriptionKey: "Label.YouMustOwnALimitedToStartTrading"
                }, {
                    icon: "icon-regular-magnifying-glass",
                    titleKey: "Label.FindATrader",
                    descriptionKey: "Label.TradeWithUsersThroughTheirProfile"
                }, {
                    icon: "icon-regular-hand-two-arrows-horizontal",
                    titleKey: "Label.SendOffer",
                    descriptionKey: "Label.ChooseTheItemsYouWantToTrade"
                }, {
                    icon: "icon-filled-hand-two-arrows-horizontal",
                    titleKey: "Label.Review",
                    descriptionKey: "Label.TheOtherUserReviewsYourOffer"
                }, {
                    icon: "icon-filled-person-clock",
                    titleKey: "Label.AwaitResponse",
                    descriptionKey: "Label.TheyAcceptRejectOrCounter"
                }, {
                    icon: "icon-regular-two-arrows-left-right",
                    titleKey: "Label.CompleteTheTrade"
                }],
                sU = function(e) {
                    var t = e.isOpen,
                        r = e.onOpenChange,
                        n = e.onShopClick,
                        o = e.onLearnMoreClick,
                        a = (0, Q.useTranslation)().translate;
                    return (0, $.jsx)(u6, {
                        open: t,
                        onOpenChange: r,
                        children: (0, $.jsxs)(u4, {
                            largeScreenVariant: "center",
                            className: "trades-sheet",
                            mobilePortraitClassName: "trades-sheet-full-bleed",
                            closeLabel: a("Action.Close"),
                            children: [(0, $.jsx)(u7, {
                                children: a("Header.HowToTrade")
                            }), (0, $.jsx)(u5, {
                                children: (0, $.jsx)("ol", {
                                    className: "how-to-trade-steps",
                                    children: sF.map(function(e) {
                                        return (0, $.jsxs)("li", {
                                            className: "how-to-trade-step",
                                            children: [(0, $.jsx)(rH, {
                                                name: e.icon,
                                                size: "Large",
                                                className: "how-to-trade-step-icon"
                                            }), (0, $.jsxs)("div", {
                                                children: [(0, $.jsx)("div", {
                                                    className: "how-to-trade-step-title",
                                                    children: a(e.titleKey)
                                                }), e.descriptionKey && (0, $.jsx)("div", {
                                                    className: "how-to-trade-step-description",
                                                    children: a(e.descriptionKey)
                                                })]
                                            })]
                                        }, e.titleKey)
                                    })
                                })
                            }), (0, $.jsxs)(u9, {
                                className: "how-to-trade-actions",
                                children: [(0, $.jsx)(nS, {
                                    as: "a",
                                    href: ep.urls.limitedsCatalog,
                                    onClick: n,
                                    variant: "Emphasis",
                                    size: "Medium",
                                    children: a("Action.Shop")
                                }), (0, $.jsx)(nS, {
                                    as: "a",
                                    href: a("Link.HowToTrade"),
                                    target: "_blank",
                                    rel: "noopener noreferrer",
                                    onClick: o,
                                    variant: "Standard",
                                    size: "Medium",
                                    icon: "icon-regular-arrow-up-right-from-square",
                                    children: a("Action.LearnMore")
                                })]
                            })]
                        })
                    })
                },
                sz = 0,
                sK = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "\xabr",
                        t = (0, Z.useRef)();
                    return t.current || (sz += 1, t.current = "".concat(e).concat(sz)), t.current
                },
                sH = function(e) {
                    var t = e.title,
                        r = e.description,
                        n = e.position;
                    return J().createElement(u_, {
                        position: void 0 === n ? "top-center" : n,
                        title: t,
                        description: r
                    }, J().createElement(uF, {
                        asChild: !0
                    }, J().createElement("span", {
                        role: "button",
                        tabIndex: 0,
                        "aria-label": t,
                        className: "flex items-center content-muted",
                        "data-testid": "label-tooltip-trigger"
                    }, J().createElement(rH, {
                        name: "icon-regular-circle-i",
                        size: "Small"
                    }))))
                };

            function sW(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    o = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === o || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function sB(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            "u" > typeof window && window.document && window.document.createElement;

            function sV(e, t, r) {
                return (sV = sZ() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && sG(o, r.prototype), o
                }).apply(null, arguments)
            }

            function sq(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function sX(e) {
                return (sX = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function s$(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        sq(e, t, r[t])
                    })
                }
                return e
            }

            function sG(e, t) {
                return (sG = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function sY(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return sB(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return sB(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function sQ(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (sQ = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return sV(e, arguments, sX(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), sG(r, e)
                })(e)
            }

            function sZ() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (sZ = function() {
                    return !!e
                })()
            }

            function sJ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function s0(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return sJ(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return sJ(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            sQ(Map);
            var s1 = Z[" useInsertionEffect ".trim().toString()] || nq;

            function s2(e) {
                var t, r, n, o, a, i, l, c, u = e.prop,
                    s = e.defaultProp,
                    f = e.onChange,
                    d = e.caller,
                    p = s0((r = (t = {
                        defaultProp: s,
                        onChange: void 0 === f ? function() {} : f
                    }).defaultProp, n = t.onChange, a = (o = s0(Z.useState(r), 2))[0], i = o[1], l = Z.useRef(a), c = Z.useRef(n), s1(function() {
                        c.current = n
                    }, [n]), Z.useEffect(function() {
                        if (l.current !== a) {
                            var e;
                            null == (e = c.current) || e.call(c, a), l.current = a
                        }
                    }, [a, l]), [a, i, c]), 3),
                    m = p[0],
                    y = p[1],
                    b = p[2],
                    v = void 0 !== u,
                    h = v ? u : m,
                    g = Z.useRef(void 0 !== u);
                return Z.useEffect(function() {
                    var e = g.current;
                    if (e !== v) {
                        var t = v ? "controlled" : "uncontrolled";
                        console.warn("".concat(d, " is changing from ").concat(e ? "controlled" : "uncontrolled", " to ").concat(t, ". Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component."))
                    }
                    g.current = v
                }, [v, d]), [h, Z.useCallback(function(e) {
                    if (v) {
                        var t, r = "function" == typeof e ? e(u) : e;
                        r !== u && (null == (t = b.current) || t.call(b, r))
                    } else y(e)
                }, [v, u, y, b])]
            }
            Symbol("RADIX:SYNC_STATE");
            var s8 = Z.createContext(void 0);

            function s3(e) {
                var t = Z.useContext(s8);
                return e || t || "ltr"
            }

            function s6(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function s4(e) {
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

            function s5(e, t) {
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

            function s7(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function s9(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || fe(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function fe(e, t) {
                if (e) {
                    if ("string" == typeof e) return s6(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return s6(e, t)
                }
            }
            var ft = "rovingFocusGroup.onEntryFocus",
                fr = {
                    bubbles: !1,
                    cancelable: !0
                },
                fn = "RovingFocusGroup",
                fo = s9((b = (y = sY(nB(m = fn + "CollectionProvider"), 2))[0], v = y[1], g = (h = sY(b(m, {
                    collectionRef: {
                        current: null
                    },
                    itemMap: new Map
                }), 2))[0], O = h[1], (w = function(e) {
                    var t = e.scope,
                        r = e.children,
                        n = J().useRef(null),
                        o = J().useRef(new Map).current;
                    return (0, $.jsx)(g, {
                        scope: t,
                        itemMap: o,
                        collectionRef: n,
                        children: r
                    })
                }).displayName = m, x = aJ(j = fn + "CollectionSlot"), (S = J().forwardRef(function(e, t) {
                    var r = e.scope,
                        n = e.children,
                        o = tG(t, O(j, r).collectionRef);
                    return (0, $.jsx)(x, {
                        ref: o,
                        children: n
                    })
                })).displayName = j, E = "data-radix-collection-item", A = aJ(P = fn + "CollectionItemSlot"), (C = J().forwardRef(function(e, t) {
                    var r, n, o = e.scope,
                        a = e.children,
                        i = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(e, ["scope", "children"]),
                        l = J().useRef(null),
                        c = tG(t, l),
                        u = O(P, o);
                    return J().useEffect(function() {
                        return u.itemMap.set(l, s$({
                                ref: l
                            }, i)),
                            function() {
                                u.itemMap.delete(l)
                            }
                    }), (0, $.jsx)(A, (r = s$({}, sq({}, E, "")), n = n = {
                        ref: c,
                        children: a
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
                })).displayName = P, [{
                    Provider: w,
                    Slot: S,
                    ItemSlot: C
                }, function(e) {
                    var t = O(fn + "CollectionConsumer", e);
                    return J().useCallback(function() {
                        var e = t.collectionRef.current;
                        if (!e) return [];
                        var r = Array.from(e.querySelectorAll("[".concat(E, "]")));
                        return Array.from(t.itemMap.values()).sort(function(e, t) {
                            return r.indexOf(e.ref.current) - r.indexOf(t.ref.current)
                        })
                    }, [t.collectionRef, t.itemMap])
                }, v]), 3),
                fa = fo[0],
                fi = fo[1],
                fl = s9(nB(fn, [fo[2]]), 2),
                fc = fl[0],
                fu = fl[1],
                fs = s9(fc(fn), 2),
                ff = fs[0],
                fd = fs[1],
                fp = Z.forwardRef(function(e, t) {
                    return (0, $.jsx)(fa.Provider, {
                        scope: e.__scopeRovingFocusGroup,
                        children: (0, $.jsx)(fa.Slot, {
                            scope: e.__scopeRovingFocusGroup,
                            children: (0, $.jsx)(fm, s5(s4({}, e), {
                                ref: t
                            }))
                        })
                    })
                });
            fp.displayName = fn;
            var fm = Z.forwardRef(function(e, t) {
                    var r = e.__scopeRovingFocusGroup,
                        n = e.orientation,
                        o = e.loop,
                        a = e.dir,
                        i = e.currentTabStopId,
                        l = e.defaultCurrentTabStopId,
                        c = e.onCurrentTabStopIdChange,
                        u = e.onEntryFocus,
                        s = e.preventScrollOnEntryFocus,
                        f = void 0 !== s && s,
                        d = s7(e, ["__scopeRovingFocusGroup", "orientation", "loop", "dir", "currentTabStopId", "defaultCurrentTabStopId", "onCurrentTabStopIdChange", "onEntryFocus", "preventScrollOnEntryFocus"]),
                        p = Z.useRef(null),
                        m = tG(t, p),
                        y = s3(a),
                        b = s9(s2({
                            prop: i,
                            defaultProp: null != l ? l : null,
                            onChange: c,
                            caller: fn
                        }), 2),
                        v = b[0],
                        h = b[1],
                        g = s9(Z.useState(!1), 2),
                        O = g[0],
                        w = g[1],
                        j = nZ(u),
                        x = fi(r),
                        S = Z.useRef(!1),
                        P = s9(Z.useState(0), 2),
                        E = P[0],
                        A = P[1];
                    return Z.useEffect(function() {
                        var e = p.current;
                        if (e) return e.addEventListener(ft, j),
                            function() {
                                return e.removeEventListener(ft, j)
                            }
                    }, [j]), (0, $.jsx)(ff, {
                        scope: r,
                        orientation: n,
                        dir: y,
                        loop: void 0 !== o && o,
                        currentTabStopId: v,
                        onItemFocus: Z.useCallback(function(e) {
                            return h(e)
                        }, [h]),
                        onItemShiftTab: Z.useCallback(function() {
                            return w(!0)
                        }, []),
                        onFocusableItemAdd: Z.useCallback(function() {
                            return A(function(e) {
                                return e + 1
                            })
                        }, []),
                        onFocusableItemRemove: Z.useCallback(function() {
                            return A(function(e) {
                                return e - 1
                            })
                        }, []),
                        children: (0, $.jsx)(a6.div, s5(s4({
                            tabIndex: O || 0 === E ? -1 : 0,
                            "data-orientation": n
                        }, d), {
                            ref: m,
                            style: s4({
                                outline: "none"
                            }, e.style),
                            onMouseDown: sW(e.onMouseDown, function() {
                                S.current = !0
                            }),
                            onFocus: sW(e.onFocus, function(e) {
                                var t = !S.current;
                                if (e.target === e.currentTarget && t && !O) {
                                    var r = new CustomEvent(ft, fr);
                                    if (e.currentTarget.dispatchEvent(r), !r.defaultPrevented) {
                                        var n = x().filter(function(e) {
                                            return e.focusable
                                        });
                                        fh([n.find(function(e) {
                                            return e.active
                                        }), n.find(function(e) {
                                            return e.id === v
                                        })].concat(function(e) {
                                            if (Array.isArray(e)) return s6(e)
                                        }(n) || function(e) {
                                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                        }(n) || fe(n) || function() {
                                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                        }()).filter(Boolean).map(function(e) {
                                            return e.ref.current
                                        }), f)
                                    }
                                }
                                S.current = !1
                            }),
                            onBlur: sW(e.onBlur, function() {
                                return w(!1)
                            })
                        }))
                    })
                }),
                fy = "RovingFocusGroupItem",
                fb = Z.forwardRef(function(e, t) {
                    var r = e.__scopeRovingFocusGroup,
                        n = e.focusable,
                        o = void 0 === n || n,
                        a = e.active,
                        i = e.tabStopId,
                        l = e.children,
                        c = s7(e, ["__scopeRovingFocusGroup", "focusable", "active", "tabStopId", "children"]),
                        u = nY(),
                        s = i || u,
                        f = fd(fy, r),
                        d = f.currentTabStopId === s,
                        p = fi(r),
                        m = f.onFocusableItemAdd,
                        y = f.onFocusableItemRemove,
                        b = f.currentTabStopId;
                    return Z.useEffect(function() {
                        if (o) return m(),
                            function() {
                                return y()
                            }
                    }, [o, m, y]), (0, $.jsx)(fa.ItemSlot, {
                        scope: r,
                        id: s,
                        focusable: o,
                        active: void 0 !== a && a,
                        children: (0, $.jsx)(a6.span, s5(s4({
                            tabIndex: d ? 0 : -1,
                            "data-orientation": f.orientation
                        }, c), {
                            ref: t,
                            onMouseDown: sW(e.onMouseDown, function(e) {
                                o ? f.onItemFocus(s) : e.preventDefault()
                            }),
                            onFocus: sW(e.onFocus, function() {
                                return f.onItemFocus(s)
                            }),
                            onKeyDown: sW(e.onKeyDown, function(e) {
                                if ("Tab" === e.key && e.shiftKey) return void f.onItemShiftTab();
                                if (e.target === e.currentTarget) {
                                    var t = function(e, t, r) {
                                        var n, o = (n = e.key, "rtl" !== r ? n : "ArrowLeft" === n ? "ArrowRight" : "ArrowRight" === n ? "ArrowLeft" : n);
                                        if (!("vertical" === t && ["ArrowLeft", "ArrowRight"].includes(o)) && !("horizontal" === t && ["ArrowUp", "ArrowDown"].includes(o))) return fv[o]
                                    }(e, f.orientation, f.dir);
                                    if (void 0 !== t) {
                                        if (e.metaKey || e.ctrlKey || e.altKey || e.shiftKey) return;
                                        e.preventDefault();
                                        var r = p().filter(function(e) {
                                            return e.focusable
                                        }).map(function(e) {
                                            return e.ref.current
                                        });
                                        if ("last" === t) r.reverse();
                                        else if ("prev" === t || "next" === t) {
                                            "prev" === t && r.reverse();
                                            var n, o, a = r.indexOf(e.currentTarget);
                                            r = f.loop ? (n = r, o = a + 1, n.map(function(e, t) {
                                                return n[(o + t) % n.length]
                                            })) : r.slice(a + 1)
                                        }
                                        setTimeout(function() {
                                            return fh(r)
                                        })
                                    }
                                }
                            }),
                            children: "function" == typeof l ? l({
                                isCurrentTabStop: d,
                                hasTabStop: null != b
                            }) : l
                        }))
                    })
                });
            fb.displayName = fy;
            var fv = {
                ArrowLeft: "prev",
                ArrowUp: "prev",
                ArrowRight: "next",
                ArrowDown: "next",
                PageUp: "first",
                Home: "first",
                PageDown: "last",
                End: "last"
            };

            function fh(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                    r = document.activeElement,
                    n = !0,
                    o = !1,
                    a = void 0;
                try {
                    for (var i, l = e[Symbol.iterator](); !(n = (i = l.next()).done); n = !0) {
                        var c = i.value;
                        if (c === r || (c.focus({
                                preventScroll: t
                            }), document.activeElement !== r)) return
                    }
                } catch (e) {
                    o = !0, a = e
                } finally {
                    try {
                        n || null == l.return || l.return()
                    } finally {
                        if (o) throw a
                    }
                }
            }

            function fg(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function fO(e) {
                var t, r = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = Z.useState(void 0)) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                a = !0,
                                i = !1;
                            try {
                                for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                            } catch (e) {
                                i = !0, r = e
                            } finally {
                                try {
                                    a || null == n.return || n.return()
                                } finally {
                                    if (i) throw r
                                }
                            }
                            return o
                        }
                    }(t) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return fg(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return fg(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r[0],
                    o = r[1];
                return nq(function() {
                    if (e) {
                        o({
                            width: e.offsetWidth,
                            height: e.offsetHeight
                        });
                        var t = new ResizeObserver(function(t) {
                            if (Array.isArray(t) && t.length) {
                                var r, n, a = t[0];
                                if ("borderBoxSize" in a) {
                                    var i = a.borderBoxSize,
                                        l = Array.isArray(i) ? i[0] : i;
                                    r = l.inlineSize, n = l.blockSize
                                } else r = e.offsetWidth, n = e.offsetHeight;
                                o({
                                    width: r,
                                    height: n
                                })
                            }
                        });
                        return t.observe(e, {
                                box: "border-box"
                            }),
                            function() {
                                return t.unobserve(e)
                            }
                    }
                    o(void 0)
                }, [e]), n
            }

            function fw(e) {
                var t = Z.useRef({
                    value: e,
                    previous: e
                });
                return Z.useMemo(function() {
                    return t.current.value !== e && (t.current.previous = t.current.value, t.current.value = e), t.current.previous
                }, [e])
            }

            function fj(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function fx(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return fj(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return fj(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var fS = function(e) {
                var t, r, n, o, a, i, l, c, u, s, f, d, p, m, y, b, v, h = e.present,
                    g = e.children,
                    O = (t = h, a = (o = fx(Z.useState(), 2))[0], i = o[1], l = Z.useRef(null), c = Z.useRef(t), u = Z.useRef("none"), f = (s = fx((r = t ? "mounted" : "unmounted", n = {
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
                    }, Z.useReducer(function(e, t) {
                        var r = n[e][t];
                        return null != r ? r : e
                    }, r)), 2))[0], d = s[1], Z.useEffect(function() {
                        var e = fP(l.current);
                        u.current = "mounted" === f ? e : "none"
                    }, [f]), nq(function() {
                        var e = l.current,
                            r = c.current;
                        if (r !== t) {
                            var n = u.current,
                                o = fP(e);
                            t ? d("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? d("UNMOUNT") : r && n !== o ? d("ANIMATION_OUT") : d("UNMOUNT"), c.current = t
                        }
                    }, [t, d]), nq(function() {
                        if (a) {
                            var e, t, r = null != (e = a.ownerDocument.defaultView) ? e : window,
                                n = function(e) {
                                    var n = fP(l.current).includes(CSS.escape(e.animationName));
                                    if (e.target === a && n && (d("ANIMATION_END"), !c.current)) {
                                        var o = a.style.animationFillMode;
                                        a.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                            "forwards" === a.style.animationFillMode && (a.style.animationFillMode = o)
                                        })
                                    }
                                },
                                o = function(e) {
                                    e.target === a && (u.current = fP(l.current))
                                };
                            return a.addEventListener("animationstart", o), a.addEventListener("animationcancel", n), a.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(t), a.removeEventListener("animationstart", o), a.removeEventListener("animationcancel", n), a.removeEventListener("animationend", n)
                                }
                        }
                        d("ANIMATION_END")
                    }, [a, d]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: Z.useCallback(function(e) {
                            l.current = e ? getComputedStyle(e) : null, i(e)
                        }, [])
                    }),
                    w = "function" == typeof g ? g({
                        present: O.isPresent
                    }) : Z.Children.only(g),
                    j = tG(O.ref, (v = (b = null == (m = Object.getOwnPropertyDescriptor((p = w).props, "ref")) ? void 0 : m.get) && "isReactWarning" in b && b.isReactWarning) ? p.ref : (v = (b = null == (y = Object.getOwnPropertyDescriptor(p, "ref")) ? void 0 : y.get) && "isReactWarning" in b && b.isReactWarning) ? p.props.ref : p.props.ref || p.ref);
                return "function" == typeof g || O.isPresent ? Z.cloneElement(w, {
                    ref: j
                }) : null
            };

            function fP(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }

            function fE(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function fA(e) {
                if (Array.isArray(e)) return e
            }

            function fC() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function fI(e) {
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

            function fN(e, t) {
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

            function fR(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function fT(e, t) {
                return fA(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || fk(e, t) || fC()
            }

            function fk(e, t) {
                if (e) {
                    if ("string" == typeof e) return fE(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return fE(e, t)
                }
            }
            fS.displayName = "Presence";
            var fD = "Radio",
                fM = fT(nB(fD), 2),
                fL = fM[0],
                f_ = fM[1],
                fF = fT(fL(fD), 2),
                fU = fF[0],
                fz = fF[1],
                fK = Z.forwardRef(function(e, t) {
                    var r = e.__scopeRadio,
                        n = e.name,
                        o = e.checked,
                        a = void 0 !== o && o,
                        i = e.required,
                        l = e.disabled,
                        c = e.value,
                        u = void 0 === c ? "on" : c,
                        s = e.onCheck,
                        f = e.form,
                        d = fR(e, ["__scopeRadio", "name", "checked", "required", "disabled", "value", "onCheck", "form"]),
                        p = fT(Z.useState(null), 2),
                        m = p[0],
                        y = p[1],
                        b = tG(t, function(e) {
                            return y(e)
                        }),
                        v = Z.useRef(!1),
                        h = !m || f || !!m.closest("form");
                    return (0, $.jsxs)(fU, {
                        scope: r,
                        checked: a,
                        disabled: l,
                        children: [(0, $.jsx)(a6.button, fN(fI({
                            type: "button",
                            role: "radio",
                            "aria-checked": a,
                            "data-state": fV(a),
                            "data-disabled": l ? "" : void 0,
                            disabled: l,
                            value: u
                        }, d), {
                            ref: b,
                            onClick: sW(e.onClick, function(e) {
                                a || null == s || s(), h && (v.current = e.isPropagationStopped(), v.current || e.stopPropagation())
                            })
                        })), h && (0, $.jsx)(fB, {
                            control: m,
                            bubbles: !v.current,
                            name: n,
                            value: u,
                            checked: a,
                            required: i,
                            disabled: l,
                            form: f,
                            style: {
                                transform: "translateX(-100%)"
                            }
                        })]
                    })
                });
            fK.displayName = fD;
            var fH = "RadioIndicator",
                fW = Z.forwardRef(function(e, t) {
                    var r = e.__scopeRadio,
                        n = e.forceMount,
                        o = fR(e, ["__scopeRadio", "forceMount"]),
                        a = fz(fH, r);
                    return (0, $.jsx)(fS, {
                        present: n || a.checked,
                        children: (0, $.jsx)(a6.span, fN(fI({
                            "data-state": fV(a.checked),
                            "data-disabled": a.disabled ? "" : void 0
                        }, o), {
                            ref: t
                        }))
                    })
                });
            fW.displayName = fH;
            var fB = Z.forwardRef(function(e, t) {
                var r, n = fA(r = [e, t]) || function(e) {
                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(r) || fk(r) || fC(),
                    o = n[0],
                    a = n.slice(1),
                    i = (o.__scopeRadio, o.control),
                    l = o.checked,
                    c = o.bubbles,
                    u = void 0 === c || c,
                    s = fR(o, ["__scopeRadio", "control", "checked", "bubbles"]),
                    f = fT(a, 1)[0],
                    d = Z.useRef(null),
                    p = tG(d, f),
                    m = fw(l),
                    y = fO(i);
                return Z.useEffect(function() {
                    var e = d.current;
                    if (e) {
                        var t = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set;
                        if (m !== l && t) {
                            var r = new Event("click", {
                                bubbles: u
                            });
                            t.call(e, l), e.dispatchEvent(r)
                        }
                    }
                }, [m, l, u]), (0, $.jsx)(a6.input, fN(fI({
                    type: "radio",
                    "aria-hidden": !0,
                    defaultChecked: l
                }, s), {
                    tabIndex: -1,
                    ref: p,
                    style: fN(fI({}, s.style, y), {
                        position: "absolute",
                        pointerEvents: "none",
                        opacity: 0,
                        margin: 0
                    })
                }))
            });

            function fV(e) {
                return e ? "checked" : "unchecked"
            }
            fB.displayName = "RadioBubbleInput";
            var fq = ["ArrowUp", "ArrowDown", "ArrowLeft", "ArrowRight"],
                fX = "RadioGroup",
                f$ = fT(nB(fX, [fu, f_]), 2),
                fG = f$[0];
            f$[1];
            var fY = fu(),
                fQ = f_(),
                fZ = fT(fG(fX), 2),
                fJ = fZ[0],
                f0 = fZ[1],
                f1 = Z.forwardRef(function(e, t) {
                    var r = e.__scopeRadioGroup,
                        n = e.name,
                        o = e.defaultValue,
                        a = e.value,
                        i = e.required,
                        l = void 0 !== i && i,
                        c = e.disabled,
                        u = void 0 !== c && c,
                        s = e.orientation,
                        f = e.dir,
                        d = e.loop,
                        p = e.onValueChange,
                        m = fR(e, ["__scopeRadioGroup", "name", "defaultValue", "value", "required", "disabled", "orientation", "dir", "loop", "onValueChange"]),
                        y = fY(r),
                        b = s3(f),
                        v = fT(s2({
                            prop: a,
                            defaultProp: null != o ? o : null,
                            onChange: p,
                            caller: fX
                        }), 2),
                        h = v[0],
                        g = v[1];
                    return (0, $.jsx)(fJ, {
                        scope: r,
                        name: n,
                        required: l,
                        disabled: u,
                        value: h,
                        onValueChange: g,
                        children: (0, $.jsx)(fp, fN(fI({
                            asChild: !0
                        }, y), {
                            orientation: s,
                            dir: b,
                            loop: void 0 === d || d,
                            children: (0, $.jsx)(a6.div, fN(fI({
                                role: "radiogroup",
                                "aria-required": l,
                                "aria-orientation": s,
                                "data-disabled": u ? "" : void 0,
                                dir: b
                            }, m), {
                                ref: t
                            }))
                        }))
                    })
                });
            f1.displayName = fX;
            var f2 = "RadioGroupItem",
                f8 = Z.forwardRef(function(e, t) {
                    var r = e.__scopeRadioGroup,
                        n = e.disabled,
                        o = fR(e, ["__scopeRadioGroup", "disabled"]),
                        a = f0(f2, r),
                        i = a.disabled || n,
                        l = fY(r),
                        c = fQ(r),
                        u = Z.useRef(null),
                        s = tG(t, u),
                        f = a.value === o.value,
                        d = Z.useRef(!1);
                    return Z.useEffect(function() {
                        var e = function(e) {
                                fq.includes(e.key) && (d.current = !0)
                            },
                            t = function() {
                                return d.current = !1
                            };
                        return document.addEventListener("keydown", e), document.addEventListener("keyup", t),
                            function() {
                                document.removeEventListener("keydown", e), document.removeEventListener("keyup", t)
                            }
                    }, []), (0, $.jsx)(fb, fN(fI({
                        asChild: !0
                    }, l), {
                        focusable: !i,
                        active: f,
                        children: (0, $.jsx)(fK, fN(fI({
                            disabled: i,
                            required: a.required,
                            checked: f
                        }, c, o), {
                            name: a.name,
                            ref: s,
                            onCheck: function() {
                                return a.onValueChange(o.value)
                            },
                            onKeyDown: sW(function(e) {
                                "Enter" === e.key && e.preventDefault()
                            }),
                            onFocus: sW(o.onFocus, function() {
                                var e;
                                d.current && (null == (e = u.current) || e.click())
                            })
                        }))
                    }))
                });
            f8.displayName = f2;
            var f3 = Z.forwardRef(function(e, t) {
                var r = e.__scopeRadioGroup,
                    n = fR(e, ["__scopeRadioGroup"]),
                    o = fQ(r);
                return (0, $.jsx)(fW, fN(fI({}, o, n), {
                    ref: t
                }))
            });

            function f6(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function f4(e) {
                if (Array.isArray(e)) return e
            }

            function f5(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function f7() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function f9(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        f5(e, t, r[t])
                    })
                }
                return e
            }

            function de(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function dt(e, t) {
                return f4(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || dn(e, t) || f7()
            }

            function dr(e) {
                return f4(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || dn(e) || f7()
            }

            function dn(e, t) {
                if (e) {
                    if ("string" == typeof e) return f6(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return f6(e, t)
                }
            }
            f3.displayName = "RadioGroupIndicator";
            var da = "Medium",
                di = "Start",
                dl = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-600"
                },
                dc = {
                    XSmall: "size-150",
                    Small: "size-200",
                    Medium: "size-250",
                    Large: "size-250"
                },
                du = {
                    XSmall: "gap-medium",
                    Small: "gap-medium",
                    Medium: "gap-medium",
                    Large: "gap-large"
                },
                ds = {
                    XSmall: "gap-medium",
                    Small: "gap-large",
                    Medium: "gap-large"
                },
                df = {
                    XSmall: "gap-small",
                    Small: "gap-medium",
                    Medium: "gap-medium"
                },
                dd = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium"
                },
                dp = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                dm = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                dy = (0, Z.createContext)({
                    size: da,
                    placement: di
                }),
                db = function() {
                    var e = (0, Z.useContext)(dy);
                    if (!e) throw Error("Radio must be used within a RadioGroup");
                    return e
                },
                dv = J().forwardRef(function(e, t) {
                    var r = dr([e, t]),
                        n = r[0],
                        o = r.slice(1),
                        a = n.groupLabel,
                        i = n.labelTooltip,
                        l = n.size,
                        c = n.placement,
                        u = n.isDisabled,
                        s = n.className,
                        f = n.children,
                        d = n.id,
                        p = de(n, ["groupLabel", "labelTooltip", "size", "placement", "isDisabled", "className", "children", "id"]),
                        m = dt(o, 1)[0],
                        y = sK(),
                        b = d || y,
                        v = null != l ? l : da,
                        h = null != c ? c : di,
                        g = (0, Z.useMemo)(function() {
                            return {
                                size: v,
                                placement: h,
                                disabled: null != u && u
                            }
                        }, [v, h, u]),
                        O = a ? J().createElement("label", {
                            htmlFor: b,
                            className: tH("foundation-web-radio-group-label", dd[v], "content-default", !i && "padding-bottom-small")
                        }, a) : null,
                        w = O && i ? J().createElement("div", {
                            className: "flex items-center gap-xsmall padding-bottom-small"
                        }, O, J().createElement(sH, i)) : O;
                    return J().createElement(dy.Provider, {
                        value: g
                    }, J().createElement("div", {
                        className: tH("flex fill flex-col", ds[v])
                    }, w, J().createElement(f1, f9({
                        ref: m,
                        id: b,
                        className: tH("foundation-web-radio-group", "flex flex-col", df[v], s)
                    }, p), f)))
                });
            dv.displayName = "RadioGroup";
            var dh = J().forwardRef(function(e, t) {
                var r, n = dr([e, t]),
                    o = n[0],
                    a = n.slice(1),
                    i = o.className,
                    l = o.value,
                    c = o.isDisabled,
                    u = o.label,
                    s = o["aria-label"],
                    f = o["aria-labelledby"],
                    d = o.hint,
                    p = o.id,
                    m = o.size,
                    y = o.placement,
                    b = de(o, ["className", "value", "isDisabled", "label", "aria-label", "aria-labelledby", "hint", "id", "size", "placement"]),
                    v = dt(a, 1)[0],
                    h = (0, Z.useRef)(null),
                    g = (0, Z.useRef)(null),
                    O = dt((0, Z.useState)(!1), 2),
                    w = O[0],
                    j = O[1],
                    x = db(),
                    S = x.size,
                    P = x.placement,
                    E = x.disabled,
                    A = null != m ? m : S,
                    C = null != y ? y : P,
                    I = sK(),
                    N = p || I,
                    R = void 0 !== u && "" !== u,
                    T = "".concat(N, "Label"),
                    k = R ? T : f,
                    D = !!d,
                    M = c || E;
                return (0, Z.useEffect)(function() {
                    var e = new ResizeObserver(function() {
                        var e = h.current,
                            t = g.current,
                            r = function(e) {
                                if (!e) return !1;
                                var t = parseFloat(getComputedStyle(e).lineHeight);
                                return Math.round(e.scrollHeight / t) > 1
                            };
                        j(r(e) || r(t))
                    });
                    return h.current && e.observe(h.current), g.current && e.observe(g.current),
                        function() {
                            return e.disconnect()
                        }
                }, [D, R]), J().createElement("div", {
                    className: tH("flex gap-medium", (f5(r = {}, tV, M), f5(r, "cursor-pointer", !M), f5(r, "flex-row", "Start" === C), f5(r, "flex-row-reverse", "End" === C), r))
                }, J().createElement(f8, f9({
                    ref: v,
                    className: tH("foundation-web-radio", tW, !M && "cursor-pointer", "padding-none shrink-0 grow-0 basis-auto flex items-center justify-center bg-none data-[state=checked]:bg-action-sub-emphasis radius-circle stroke-contrast-alpha stroke-standard", du[A], dl[A], i),
                    disabled: M,
                    value: l,
                    id: N,
                    "aria-describedby": D ? "".concat(N, "Hint") : void 0,
                    "aria-label": s,
                    "aria-labelledby": k
                }, b), J().createElement(tB, null), J().createElement(f3, {
                    className: tH("radius-circle bg-inverse-action-sub-emphasis", dc[A])
                })), J().createElement("div", {
                    className: tH("flex fill flex-col width-full", {
                        "gap-xsmall": w,
                        "gap-none": !w,
                        "padding-top-xxsmall": "XSmall" !== A
                    })
                }, R && J().createElement("label", {
                    ref: h,
                    id: T,
                    htmlFor: N,
                    "aria-describedby": D ? "".concat(N, "Hint") : void 0,
                    className: tH(dp[A], "content-emphasis", !M && "cursor-pointer")
                }, u), D && J().createElement("div", {
                    ref: g,
                    id: "".concat(N, "Hint"),
                    className: tH(dm[A], "content-default")
                }, d)))
            });
            dh.displayName = "Radio";
            var dg = function(e) {
                var t = e.isOpen,
                    r = e.onOpenChange,
                    n = e.options,
                    o = e.value,
                    a = e.onSelect,
                    i = (0, Q.useTranslation)().translate;
                return (0, $.jsx)(u6, {
                    open: t,
                    onOpenChange: r,
                    children: (0, $.jsxs)(u4, {
                        largeScreenVariant: "center",
                        className: "trades-sheet",
                        mobilePortraitClassName: "trades-sheet-full-bleed",
                        closeLabel: i("Action.Close"),
                        children: [(0, $.jsx)(u7, {
                            children: i("Header.TradeQualityFilter")
                        }), (0, $.jsxs)(u5, {
                            children: [(0, $.jsx)(se, {
                                children: (0, $.jsx)("p", {
                                    className: "trade-quality-sheet-description",
                                    children: i("Message.TradeQualityMessage")
                                })
                            }), (0, $.jsx)(dv, {
                                value: o,
                                onValueChange: a,
                                placement: "End",
                                size: "Medium",
                                children: n.map(function(e) {
                                    return (0, $.jsx)(dh, {
                                        value: e.value,
                                        label: e.label
                                    }, e.value)
                                })
                            })]
                        })]
                    })
                })
            };

            function dO(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function dw(e) {
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

            function dj(e, t) {
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

            function dx(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return dO(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return dO(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var dS = [{
                    value: ep.tradeStatusType.inbound,
                    labelKey: "Label.Received",
                    emptyTitleKey: "Label.YouHaveNoTradesRecieved",
                    emptySubtitleKey: "Label.AllOffersWillBeHere"
                }, {
                    value: ep.tradeStatusType.outbound,
                    labelKey: "Label.Sent",
                    emptyTitleKey: "Label.YouHaveNoTradesSent",
                    emptySubtitleKey: "Label.AllYourRequestsWillBeHere"
                }, {
                    value: ep.tradeStatusType.completed,
                    labelKey: "Label.Completed",
                    emptyTitleKey: "Label.YouHaveNoCompletedTrades",
                    emptySubtitleKey: "Label.AllCompletedTradesWillBeHere"
                }, {
                    value: ep.tradeStatusType.inactive,
                    labelKey: "Label.Closed",
                    emptyTitleKey: "Label.YouHaveNoClosedTrades",
                    emptySubtitleKey: "Label.AllClosedTradesWillBeHere"
                }],
                dP = [{
                    value: ep.tradeQualityType.none,
                    labelKey: "Label.None"
                }, {
                    value: ep.tradeQualityType.low,
                    labelKey: "Label.Low"
                }, {
                    value: ep.tradeQualityType.medium,
                    labelKey: "Label.Medium"
                }, {
                    value: ep.tradeQualityType.high,
                    labelKey: "Label.High"
                }],
                dE = function(e) {
                    var t, r, n = e.systemFeedbackService,
                        o = (0, Q.useTranslation)().translate,
                        a = rD(),
                        i = rL(),
                        l = (0, Z.useMemo)(function() {
                            return eR()
                        }, []),
                        c = dx((0, Z.useState)(ep.tradeStatusType.inbound), 2),
                        u = c[0],
                        s = c[1],
                        f = dx((0, Z.useState)(ep.tradeQualityType.none), 2),
                        d = f[0],
                        p = f[1],
                        m = dx((0, Z.useState)(null), 2),
                        y = m[0],
                        b = m[1],
                        v = dx((0, Z.useState)(!1), 2),
                        h = v[0],
                        g = v[1],
                        O = dx((0, Z.useState)("list"), 2),
                        w = O[0],
                        j = O[1],
                        x = dx((0, Z.useState)(!1), 2),
                        S = x[0],
                        P = x[1],
                        E = dx((0, Z.useState)(!1), 2),
                        A = E[0],
                        C = E[1],
                        I = dx((0, Z.useState)(rS), 2),
                        N = I[0],
                        R = I[1],
                        T = (0, Z.useRef)(null),
                        k = (0, Z.useRef)(null),
                        D = (0, Z.useMemo)(function() {
                            return dS.map(function(e) {
                                return {
                                    value: e.value,
                                    label: o(e.labelKey)
                                }
                            })
                        }, [o]),
                        M = (0, Z.useMemo)(function() {
                            return dP.map(function(e) {
                                return {
                                    value: e.value,
                                    label: o(e.labelKey)
                                }
                            })
                        }, [o]),
                        L = null != (r = dS.find(function(e) {
                            return e.value === u
                        })) ? r : dS[0],
                        _ = (0, Z.useCallback)(function(e) {
                            var t;
                            (T.current = e ? e.id : null, e) ? (b(dj(dw({}, e), {
                                offers: void 0
                            })), g(!0), eB(null == (t = (0, eu.authenticatedUser)()) ? void 0 : t.id, e.id).then(function(t) {
                                if (t && T.current === e.id) {
                                    var r = dj(dw({}, t), {
                                        id: e.id,
                                        tradeStatusType: e.tradeStatusType,
                                        expiration: e.expiration,
                                        status: e.status
                                    });
                                    b(r), g(!1), tu(tr, "viewTrade", dj(dw({}, th(r)), {
                                        tradeId: r.id,
                                        tradeStatusType: r.tradeStatusType
                                    }))
                                }
                            }).catch(function(e) {
                                tv("viewTrade", e), g(!1)
                            })) : b(null)
                        }, []),
                        F = (0, Z.useCallback)(function(e) {
                            s(e), b(null), T.current = null, k.current && (k.current.scrollTop = 0);
                            var t = new URL(window.location.href);
                            t.searchParams.set("tab", e), window.history.replaceState({}, "", t.toString()), a.loadFirstPage(e).then(function(e) {
                                e.length > 0 && _(e[0])
                            }).catch(function(t) {
                                tv("loadTradesList", t, {
                                    tab: e
                                }), n.warning(o("Error.FailedToLoadTradesList"))
                            })
                        }, [a, _, n, o]);
                    (0, Z.useEffect)(function() {
                        eM(function() {
                            var e;
                            return eK(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        return e = {
                                            url: "".concat(ep.urls.tradesApi, "/v1/trades/expire-outdated"),
                                            withCredentials: !0
                                        }, [4, ey.post(e)];
                                    case 1:
                                        return t.sent(), [2]
                                }
                            })
                        })().catch(function() {}), eM(function() {
                            var e;
                            return eK(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        return e = {
                                            url: ep.urls.getSettings,
                                            withCredentials: !0
                                        }, [4, ey.get(e)];
                                    case 1:
                                        return [2, t.sent().data]
                                }
                            })
                        })().then(function(e) {
                            (null == e ? void 0 : e.tradeQualityFilter) && p(e.tradeQualityFilter)
                        }).catch(function() {});
                        var e, t, r = new URLSearchParams(window.location.search).get("tab");
                        F(null != (e = null == (t = dS.find(function(e) {
                            return e.value === r
                        })) ? void 0 : t.value) ? e : dS[0].value)
                    }, []);
                    var U = (0, Z.useCallback)(function() {
                            a.loadNextPage().catch(function(e) {
                                tv("loadTradesList", e, {
                                    paged: !0
                                }), n.warning(o("Error.FailedToLoadTradesList"))
                            })
                        }, [a, n, o]),
                        z = (0, Z.useCallback)(function() {
                            var e = k.current;
                            e && !a.loading && a.hasMore && e.scrollTop + e.offsetHeight >= e.scrollHeight - ep.tradesList.scrollBarLazyLoadDistancePx && U()
                        }, [U, a.loading, a.hasMore]);
                    (0, Z.useEffect)(function() {
                        var e = k.current;
                        e && !a.loading && a.hasMore && !a.loadFailed && e.scrollHeight <= e.clientHeight + ep.tradesList.scrollBarLazyLoadDistancePx && U()
                    }, [a.trades, a.loading, a.hasMore, a.loadFailed, U]);
                    var K = function(e) {
                            _(e), j("detail"), tc(e7, "viewTrade")
                        },
                        H = function(e, t) {
                            var r;
                            tu("tradeProfileClick", t, {
                                tradeStatusType: e.tradeStatusType || u,
                                partnerId: null == (r = e.user) ? void 0 : r.id,
                                tradeId: e.id
                            })
                        },
                        W = function() {
                            C(!0), tc(e7, "tradeInfo")
                        },
                        B = i.window.replace(/[^a-z]/gi, "").toLowerCase().includes(ep.freeTradesWindow.month.toLowerCase()) ? "Message.FreeTradesLeftThisMonth" : "Label.FreeTradesRemaining";
                    return (0, $.jsxs)("div", {
                        className: "trades-react".concat(l ? " is-mobile" : ""),
                        children: [(!l || "list" === w) && (0, $.jsxs)("div", {
                            className: "col-xs-12 col-sm-4 trade-row-list",
                            children: [(0, $.jsxs)("div", {
                                className: "trades-header",
                                children: [(0, $.jsx)("h1", {
                                    children: o("Heading.TradesList")
                                }), (0, $.jsxs)("div", {
                                    className: "trades-header-actions",
                                    children: [(0, $.jsx)(rp, {
                                        onClick: W,
                                        icon: "icon-regular-circle-i",
                                        ariaLabel: o("Header.HowToTrade"),
                                        variant: "Utility",
                                        size: "Medium"
                                    }), (0, $.jsx)(rp, {
                                        onClick: function() {
                                            P(!0), tc(e7, "tradeQualityFilter")
                                        },
                                        icon: "icon-regular-gear",
                                        ariaLabel: o("Header.TradeQualityFilter"),
                                        variant: "Utility",
                                        size: "Medium"
                                    })]
                                })]
                            }), (0, $.jsx)(ne, {
                                options: D,
                                value: u,
                                onSelect: function(e) {
                                    var t = e === u;
                                    if (!t || !a.loading) {
                                        var r = t ? "refreshTradeCategory" : "switchTradeCategory";
                                        tc(e7, r, {
                                            category: e
                                        }), tu(to, r, {
                                            filterType: "statusTab",
                                            value: e
                                        }), F(e)
                                    }
                                }
                            }), i.shouldShowQuota && (0, $.jsx)(sL, {
                                message: o(B, {
                                    number: i.remaining,
                                    maxNumber: i.total
                                }),
                                endsLabel: o("Label.EndsDate", {
                                    date: (t = ep.freeTradesEndDate, new(eg())().getDateTimeFormatter().getCustomDateTime(new Date(t), {
                                        month: "short",
                                        day: "numeric"
                                    }))
                                })
                            }), i.shouldShowUpsell && !N && (0, $.jsx)(s_, {
                                title: o("Label.UnlockUnlimitedTrades"),
                                body: o("Message.CompleteAsManyTradesAsYouWantWithPlus"),
                                ctaLabel: o("Action.Subscribe"),
                                ctaHref: ep.urls.membership,
                                dismissLabel: o("Action.Close"),
                                onCtaClick: function() {
                                    tc(e7, "getPlusUpsell")
                                },
                                onDismiss: function() {
                                    rP(), R(!0), tu(ta, "close", {
                                        banner: "freeTradesUpsell"
                                    })
                                }
                            }), (0, $.jsxs)("div", {
                                id: "trade-row-scroll-container",
                                ref: k,
                                onScroll: z,
                                children: [a.trades.map(function(e) {
                                    return (0, $.jsx)(nf, {
                                        trade: e,
                                        isSelected: (null == y ? void 0 : y.id) === e.id,
                                        onClick: K,
                                        onProfileClick: H
                                    }, e.id)
                                }), a.loading && (0, $.jsx)("div", {
                                    className: "flex justify-center margin-y-small",
                                    children: (0, $.jsx)(rg, {
                                        ariaLabel: o("Label.Loading", void 0, "Loading"),
                                        size: "Medium",
                                        variant: "Indeterminate"
                                    })
                                }), a.noResults && !a.loading && (0, $.jsx)(ss, {
                                    title: o(L.emptyTitleKey),
                                    subtitle: o(L.emptySubtitleKey),
                                    action: {
                                        label: o("Action.LearnMore"),
                                        onClick: W
                                    }
                                })]
                            })]
                        }), (!l || "detail" === w) && (0, $.jsx)("div", {
                            className: "col-xs-12 col-sm-8 trades-list-detail",
                            children: (0, $.jsx)(su, {
                                trade: y,
                                detailLoading: h,
                                isMobile: l,
                                onBack: function() {
                                    j("list")
                                },
                                onProfileClick: H,
                                onTradeRemoved: function(e) {
                                    var t = (null == y ? void 0 : y.id) === e,
                                        r = a.trades.filter(function(t) {
                                            return t.id !== e
                                        });
                                    a.removeTrade(e), t && (r.length > 0 ? _(r[0]) : (_(null), j("list"))), z()
                                },
                                systemFeedbackService: n
                            })
                        }), (0, $.jsx)(sU, {
                            isOpen: A,
                            onOpenChange: C,
                            onShopClick: function() {
                                tc(e7, "shopLimiteds")
                            },
                            onLearnMoreClick: function() {
                                tu("tradeHowToTradeClick", "howToTrade")
                            }
                        }), (0, $.jsx)(dg, {
                            isOpen: S,
                            onOpenChange: P,
                            options: M,
                            value: d,
                            onSelect: function(e) {
                                p(e), eM(function() {
                                    var t;
                                    return eK(this, function(r) {
                                        switch (r.label) {
                                            case 0:
                                                return t = {
                                                    url: ep.urls.setTradeQuality,
                                                    withCredentials: !0
                                                }, [4, ey.post(t, {
                                                    tradeQualityFilter: e
                                                })];
                                            case 1:
                                                return r.sent(), [2]
                                        }
                                    })
                                })().catch(function() {}), tu(to, "tradeQuality", {
                                    filterType: "tradeQuality",
                                    value: e
                                })
                            }
                        })]
                    })
                };

            function dA(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function dC(e) {
                if (Array.isArray(e)) return e
            }

            function dI() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function dN(e) {
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

            function dR(e, t) {
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

            function dT(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function dk(e, t) {
                if (e) {
                    if ("string" == typeof e) return dA(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return dA(e, t)
                }
            }
            var dD = new Set(["_self", "_parent", "_top"]),
                dM = {
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                dL = {
                    Standard: "content-emphasis",
                    Emphasis: "content-emphasis",
                    Inverse: "content-inverse-default"
                },
                d_ = (0, Z.forwardRef)(function(e, t) {
                    var r, n, o, a, i = dC(o = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(o) || dk(o) || dI(),
                        l = i[0],
                        c = i.slice(1),
                        u = l.children,
                        s = l.className,
                        f = l.size,
                        d = l.color,
                        p = l.variant,
                        m = l.underline,
                        y = void 0 === m ? "hover" : m,
                        b = l.isExternal,
                        v = l.asChild,
                        h = dT(l, ["children", "className", "size", "color", "variant", "underline", "isExternal", "asChild"]),
                        g = (dC(c) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(c) || dk(c, 1) || dI())[0],
                        O = (r = null != (a = h.as) ? a : "a", n = "button" === h.as ? void 0 : h.target, void 0 !== b ? b : "button" !== r && void 0 !== n && !dD.has(n)),
                        w = tH("foundation-web-link", "button" === h.as && "bg-none stroke-none padding-none appearance-none [text-align:inherit]", ("Standalone" === (void 0 === p ? "Standalone" : p) || O) && "inline-flex items-center gap-xsmall", void 0 !== f && dM[f], dL[void 0 === d ? "Emphasis" : d], "always" === y ? "underline" : "no-underline", "hover" === y && "hover:underline", "motion-safe:transition-opacity", "hover:cursor-pointer hover:[opacity:0.8]", "radius-xsmall focus-visible:[outline-style:solid] focus-visible:[outline-width:var(--stroke-standard)] focus-visible:[outline-color:var(--color-system-emphasis)]", s),
                        j = O ? J().createElement("span", {
                            "aria-hidden": !0,
                            "data-testid": "foundation-web-icon",
                            className: tH("grow-0 shrink-0 basis-auto icon size-[1em]", "icon-regular-arrow-up-right-from-square")
                        }) : null;
                    if (v) {
                        h.as;
                        var x = dT(h, ["as"]),
                            S = J().Children.only(u);
                        return J().isValidElement(S) ? J().createElement(t6, dR(dN({
                            ref: g
                        }, x), {
                            className: w
                        }), J().cloneElement(S, {}, J().createElement(J().Fragment, null, S.props.children, j))) : null
                    }
                    if ("button" === h.as) {
                        h.as;
                        var P = h.type,
                            E = dT(h, ["as", "type"]);
                        return J().createElement("button", dR(dN({
                            ref: g,
                            type: null != P ? P : "button"
                        }, E), {
                            className: w
                        }), u, j)
                    }
                    h.as;
                    var A = dT(h, ["as"]);
                    return J().createElement("a", dR(dN({
                        ref: g
                    }, A), {
                        className: w
                    }), u, j)
                });

            function dF(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            d_.displayName = "Link";
            var dU = function() {
                var e, t = function(e) {
                        if (Array.isArray(e)) return e
                    }(e = (0, Z.useState)(void 0)) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                a = !0,
                                i = !1;
                            try {
                                for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                            } catch (e) {
                                i = !0, r = e
                            } finally {
                                try {
                                    a || null == n.return || n.return()
                                } finally {
                                    if (i) throw r
                                }
                            }
                            return o
                        }
                    }(e) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return dF(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return dF(e, 2)
                        }
                    }(e) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    r = t[0],
                    n = t[1];
                return (0, Z.useEffect)(function() {
                    var e = !0;
                    return e$().then(function(t) {
                            if (e) {
                                var r;
                                n(null != (r = null == t ? void 0 : t.tradeEligibility) ? r : null)
                            }
                        }).catch(function() {
                            e && n(null)
                        }),
                        function() {
                            e = !1
                        }
                }, []), {
                    isLoaded: void 0 !== r,
                    isRequired: eJ(r)
                }
            };

            function dz(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var dK = function(e) {
                var t, r, n, o = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = (0, Z.useState)(void 0)) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                a = !0,
                                i = !1;
                            try {
                                for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                            } catch (e) {
                                i = !0, r = e
                            } finally {
                                try {
                                    a || null == n.return || n.return()
                                } finally {
                                    if (i) throw r
                                }
                            }
                            return o
                        }
                    }(t) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return dz(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return dz(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    a = o[0],
                    i = o[1];
                return (0, Z.useEffect)(function() {
                    if (null != e && !(e <= 0)) {
                        var t = !0;
                        return eM(function() {
                                var t, r, n;
                                return eK(this, function(o) {
                                    switch (o.label) {
                                        case 0:
                                            return r = {
                                                url: "".concat(ep.urls.tradesApi, "/v2/users/").concat(e, "/can-trade-with"),
                                                withCredentials: !0
                                            }, [4, ey.get(r)];
                                        case 1:
                                            return [2, null != (t = null == (n = o.sent().data) ? void 0 : n.currencyTransferEligibility) ? t : null]
                                    }
                                })
                            })().then(function(e) {
                                t && i(e)
                            }).catch(function() {
                                t && i(null)
                            }),
                            function() {
                                t = !1
                            }
                    }
                }, [e]), {
                    isLoaded: void 0 !== a,
                    canSend: null == (r = null == a ? void 0 : a.canSend) || r,
                    canRequest: null == (n = null == a ? void 0 : a.canRequest) || n
                }
            };

            function dH(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function dW(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function dB(e) {
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

            function dV(e, t) {
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

            function dq(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || d$(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function dX(e) {
                return function(e) {
                    if (Array.isArray(e)) return dH(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || d$(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function d$(e, t) {
                if (e) {
                    if ("string" == typeof e) return dH(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return dH(e, t)
                }
            }
            var dG = ep.maxItemsPerSide,
                dY = ep.tradeErrors,
                dQ = function(e) {
                    for (var t = [], r = 0; r < dG; r += 1) e[r] ? t.push({
                        type: "item",
                        tradableItem: e[r]
                    }) : 0 === r || e[r - 1] ? t.push({
                        type: "add-item"
                    }) : t.push({
                        type: "empty"
                    });
                    return t
                },
                dZ = function(e) {
                    return dV(dB({}, e), {
                        slots: dQ(e.items)
                    })
                },
                dJ = function(e) {
                    var t = (0, Q.useTranslation)().translate,
                        r = ec(),
                        n = r.route,
                        o = r.navigate,
                        a = (0, Z.useRef)(function() {}),
                        i = nD(e, {
                            onVerificationSuccess: function() {
                                a.current()
                            },
                            onChallengeAbandoned: function() {}
                        }),
                        l = dq((0, Z.useState)([]), 2),
                        c = l[0],
                        u = l[1],
                        s = dq((0, Z.useState)(!1), 2),
                        f = s[0],
                        d = s[1],
                        p = dq((0, Z.useState)(null), 2),
                        m = p[0],
                        y = p[1],
                        b = dq((0, Z.useState)(null), 2),
                        v = b[0],
                        h = b[1],
                        g = dq((0, Z.useState)(null), 2),
                        O = g[0],
                        w = g[1],
                        j = dq((0, Z.useState)(!1), 2),
                        x = j[0],
                        S = j[1],
                        P = dq((0, Z.useState)(!1), 2),
                        E = P[0],
                        A = P[1],
                        C = dq((0, Z.useState)(null), 2),
                        I = C[0],
                        N = C[1],
                        R = dq((0, Z.useState)(!1), 2),
                        T = R[0],
                        k = R[1],
                        D = dq((0, Z.useState)(!1), 2),
                        M = D[0],
                        L = D[1],
                        _ = dq((0, Z.useState)(void 0), 2),
                        F = _[0],
                        U = _[1],
                        z = dq((0, Z.useState)(!1), 2),
                        K = z[0],
                        H = z[1],
                        W = rL(),
                        B = dK(null == v ? void 0 : v.id),
                        V = dU(),
                        q = (0, Z.useRef)([]),
                        X = (0, Z.useRef)(null),
                        $ = (0, Z.useRef)(null),
                        G = (0, Z.useRef)({}),
                        Y = (0, Z.useRef)(!1),
                        J = (0, Z.useRef)(!1),
                        ee = (0, Z.useRef)(function() {}),
                        et = (0, Z.useRef)(function() {}),
                        er = (0, Z.useCallback)(function(e) {
                            q.current = e, u(e)
                        }, []),
                        en = (0, Z.useCallback)(function() {
                            w(null)
                        }, []),
                        eo = (0, Z.useCallback)(function(e) {
                            e.id && G.current[e.id] && (G.current[e.id] = null)
                        }, []),
                        ea = function(e) {
                            return q.current.find(function(t) {
                                return t.user.id === e
                            })
                        },
                        ei = (0, Z.useCallback)(function(e) {
                            var t = ea(e.userId);
                            return !!(null == t ? void 0 : t.items.some(function(t) {
                                return t.id === e.id
                            }))
                        }, []),
                        el = (0, Z.useCallback)(function(e) {
                            var t = ea(e);
                            return !!(t && t.items.length >= dG)
                        }, []),
                        es = (0, Z.useCallback)(function(e) {
                            return ei(e) || el(e.userId) || !!e.isOnHold
                        }, [ei, el]),
                        ef = (0, Z.useCallback)(function(e) {
                            return !!(e.id && G.current[e.id])
                        }, []),
                        ed = (0, Z.useCallback)(function(e) {
                            return nT(e.id ? G.current[e.id] : null, t)
                        }, [t]),
                        em = (0, Z.useCallback)(function(e) {
                            var t = ea(e.userId);
                            !t || t.items.length >= dG || t.items.some(function(t) {
                                return t.id === e.id
                            }) || e.isOnHold || (er(q.current.map(function(t) {
                                return t.user.id === e.userId ? dZ(dV(dB({}, t), {
                                    items: dX(t.items).concat([e])
                                })) : dZ(dV(dB({}, t), {
                                    items: t.items.filter(function(t) {
                                        return t.id !== e.id
                                    })
                                }))
                            })), eo(e), en())
                        }, [eo, en, er]),
                        ev = (0, Z.useCallback)(function(e) {
                            er(q.current.map(function(t) {
                                return dZ(dV(dB({}, t), {
                                    items: t.items.filter(function(t) {
                                        return t.id !== e.id
                                    })
                                }))
                            })), eo(e), en()
                        }, [eo, en, er]),
                        eh = (0, Z.useCallback)(function(e) {
                            ei(e) ? (ev(e), tc(e9, "itemRemoved")) : (em(e), tc(e9, "itemAdded"))
                        }, [em, ei, ev]),
                        eg = B.isLoaded && !B.canRequest,
                        eO = (0, Z.useRef)(eg);
                    eO.current = eg, (0, Z.useEffect)(function() {
                        if (eg) {
                            var e, t = null == (e = X.current) ? void 0 : e.id;
                            null != t && q.current.some(function(e) {
                                return e.user.id === t && null !== e.robux
                            }) && er(q.current.map(function(e) {
                                return e.user.id === t ? dV(dB({}, e), {
                                    robux: null
                                }) : e
                            }))
                        }
                    }, [er, eg, c]);
                    var ew = (0, Z.useCallback)(function(e, t) {
                            if (e !== (null == (r = X.current) ? void 0 : r.id) || !eO.current) {
                                var r, n = t.replace(/[^0-9]/g, ""),
                                    o = "" === n ? null : parseInt(n, 10);
                                0 === o && (o = null), er(q.current.map(function(t) {
                                    return t.user.id === e ? dV(dB({}, t), {
                                        robux: o
                                    }) : t
                                }))
                            }
                        }, [er]),
                        ej = (0, Z.useCallback)(function(e) {
                            e.robux && e.robux > 0 && tc(e9, "robuxAdded")
                        }, []),
                        ex = function() {
                            var e = q.current.map(function(e) {
                                    return {
                                        userId: e.user.id,
                                        robux: e.robux ? parseInt(String(e.robux), 10) : 0,
                                        collectibleItemInstanceIds: e.items.map(function(e) {
                                            return e.id
                                        })
                                    }
                                }),
                                t = e.find(function(e) {
                                    var t;
                                    return e.userId === (null == (t = (0, eu.authenticatedUser)()) ? void 0 : t.id)
                                }),
                                r = e.find(function(e) {
                                    var t;
                                    return e.userId !== (null == (t = (0, eu.authenticatedUser)()) ? void 0 : t.id)
                                });
                            return {
                                senderOffer: t,
                                recipientOffer: dV(dB({}, r), {
                                    robux: eO.current ? 0 : r.robux
                                })
                            }
                        },
                        eS = function() {
                            return q.current.some(function(e) {
                                return !!(e.robux && e.robux > 0)
                            })
                        },
                        eP = function(e) {
                            var r, n, o = Math.ceil((null != (r = e.ExpirationTimeInMinutes) ? r : 0) / 60),
                                a = t(ep.economicRestrictionsViolationLabels[null != (n = e.FailureReason) ? n : ""]);
                            N(o > 24 ? t("Text.EconomicRestrictionsDaysGeneral", {
                                violation: a,
                                day: Math.ceil(o / 24)
                            }) : t("Text.EconomicRestrictionsHoursGeneral", {
                                violation: a,
                                hour: o
                            }))
                        },
                        eA = function(e) {
                            var t, r;
                            switch (null != (t = null == (r = e8(e)) ? void 0 : r.code) ? t : eQ(e)[0]) {
                                case dY.unauthorized:
                                    return "unauthorized";
                                case dY.userCannotTrade:
                                    return "userCannotTrade";
                                case dY.userPrivacyTooStrict:
                                    return "userPrivacyTooStrict";
                                case dY.invalidUserAssets:
                                    return "invalidUserAssets";
                                case dY.tradeUnbalanced:
                                    return "tradeUnbalanced";
                                case dY.tradeQualityInsufficient:
                                    return "tradeQualityInsufficient";
                                case dY.insufficientRobux:
                                    return "insufficientRobux";
                                case dY.tooManyRobux:
                                    return "tooManyRobux";
                                case dY.robuxRequiresPlus:
                                    return "robuxRequiresPlus";
                                case dY.tradeFrictionEncountered:
                                    return "tradeFrictionEncountered";
                                default:
                                    return "unknown"
                            }
                        },
                        eC = function(r) {
                            Y.current ? e.warning(t("Response.VerificationError")) : (ee.current = r, H(!0))
                        },
                        eN = function(r) {
                            e3(r).then(function(r) {
                                if ("ageCheck" === r) return void eC(function() {
                                    a.current()
                                });
                                if ("upsell" === r && !(0, eu.isBlackbirdUser)()) {
                                    U(void 0), L(!0);
                                    return
                                }
                                e.warning(t("Error.TradeUsersCannotTrade"))
                            }).catch(function() {
                                e.warning(t("Error.TradeUsersCannotTrade"))
                            })
                        },
                        eR = function(r) {
                            var n, o = e8(r),
                                a = null != (n = null == o ? void 0 : o.code) ? n : eQ(r)[0];
                            switch (a) {
                                case dY.unauthorized:
                                    e.warning(t("Error.TradeUnauthorized"));
                                    break;
                                case dY.userCannotTrade:
                                    eN(r);
                                    break;
                                case dY.userPrivacyTooStrict:
                                    e.warning((null == o ? void 0 : o.field) === "sender" ? t("Error.YourPrivacyTooStrict") : t("Error.PartnerPrivacyTooStrict"));
                                    break;
                                case dY.invalidUserAssets:
                                    break;
                                case dY.tradeUnbalanced:
                                    w(t("Error.TradeUnbalanced", {
                                        ratio: ep.minValueRatio
                                    }));
                                    break;
                                case dY.tradeQualityInsufficient:
                                    w(t("Error.TradeQualityInsufficient", {
                                        minValue: (0, eb.formatNumber)(Number(null == o ? void 0 : o.fieldData) || 0)
                                    }));
                                    break;
                                case dY.insufficientRobux:
                                    w(t("Error.YouDoNotHaveEnoughRobux"));
                                    break;
                                case dY.tooManyRobux:
                                    w(t((null == o ? void 0 : o.field) === "sender" ? "Error.RequestHasTooManyRobux" : "Error.OfferHasTooManyRobux", {
                                        percent: ep.maxRobuxAsPercentOfValue
                                    }));
                                    break;
                                case dY.robuxRequiresPlus:
                                    e.warning(t("Message.YouCanOnlyRequestRobuxFromPlusUsers", void 0, "This user needs Roblox Plus to send Robux as part of the trade"));
                                    break;
                                case dY.tradeFrictionEncountered:
                                    nI().then(function(e) {
                                        e ? i.start() : k(!0)
                                    }).catch(function() {
                                        k(!0)
                                    });
                                    break;
                                default:
                                    e.warning(nR(null != a ? [a] : [], t))
                            }
                        },
                        eT = (0, Z.useCallback)(function() {
                            o({
                                view: "list",
                                tab: ep.tradeStatusType.outbound
                            })
                        }, [o]),
                        ek = (0, Z.useCallback)(function() {
                            var r, n, o = q.current,
                                a = null !== $.current,
                                i = ex();
                            S(!0);
                            var l = o.find(function(e) {
                                    var t;
                                    return e.user.id === (null == (t = (0, eu.authenticatedUser)()) ? void 0 : t.id)
                                }),
                                c = dV(dB({}, th({
                                    offers: [o.find(function(e) {
                                        var t;
                                        return e.user.id !== (null == (t = (0, eu.authenticatedUser)()) ? void 0 : t.id)
                                    }), l]
                                })), {
                                    hasRobux: eS(),
                                    partnerId: null == (n = X.current) ? void 0 : n.id
                                }),
                                u = a ? "counter" : "newTrade";
                            (a ? (r = $.current, eM(function() {
                                var e, t;
                                return eK(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            return e = {
                                                url: "".concat(ep.urls.tradesApi, "/v2/trades/").concat(r, "/counter"),
                                                withCredentials: !0
                                            }, [4, ey.post(e, i)];
                                        case 1:
                                            return [2, null != (t = n.sent().data) ? t : {}]
                                    }
                                })
                            })()) : eM(function() {
                                var e, t;
                                return eK(this, function(r) {
                                    switch (r.label) {
                                        case 0:
                                            return e = {
                                                url: "".concat(ep.urls.tradesApi, "/v2/trades/send"),
                                                withCredentials: !0
                                            }, [4, ey.post(e, i)];
                                        case 1:
                                            return [2, null != (t = r.sent().data) ? t : {}]
                                    }
                                })
                            })()).then(function(r) {
                                if (S(!1), void 0 !== r.FailureReason && void 0 !== r.ExpirationTimeInMinutes) return void eP(r);
                                var n = dV(dB({}, c), {
                                    success: !0
                                });
                                (null == r ? void 0 : r.tradeId) && (n.tradeId = r.tradeId), tc(te, u, n);
                                var o = tg();
                                tu(a ? "tradeCountered" : "tradeInitiated", u, dV(dB({}, n), {
                                    entrySource: o.entrySource,
                                    referrer: o.referrer
                                })), e.success(t(a ? "Message.TradeCounteredSuccess" : "Message.TradeSentSuccess")), eG(), eT()
                            }, function(e) {
                                tc(te, u, dV(dB({}, c), {
                                    success: !1,
                                    reason: eA(e)
                                })), tv(a ? "counterTrade" : "sendTrade", e, {
                                    reason: eA(e)
                                }), S(!1), eR(e)
                            })
                        }, [eT, e, t]);
                    a.current = ek;
                    var eD = (0, Z.useCallback)(function() {
                        if (Y.current = !1, V.isRequired && !J.current) return void eC(function() {
                            et.current()
                        });
                        if (W.isOutOfTrades) {
                            U(void 0), L(!0);
                            return
                        }
                        if (B.isLoaded && !B.canSend && eS()) {
                            U("Title.TradeWithRobuxWithPlus"), L(!0);
                            return
                        }((en(), q.current.length > 0 && q.current.every(function(e) {
                            return e.items.length > 0
                        })) ? !q.current.every(function(e) {
                            return eE(e.robux)
                        }) && (w(t("Error.InvalidRobux")), 1) : (w(t("Label.OffersNeedItems")), 1)) || (en(), G.current = {}, A(!0))
                    }, [V.isRequired, en, B.canSend, B.isLoaded, t, W.isOutOfTrades]);
                    et.current = eD;
                    var eL = (0, Z.useCallback)(function() {
                            A(!1)
                        }, []),
                        e_ = (0, Z.useCallback)(function() {
                            A(!1), ek()
                        }, [ek]),
                        eU = (0, Z.useCallback)(function() {
                            N(null)
                        }, []),
                        ez = (0, Z.useCallback)(function() {
                            k(!1)
                        }, []),
                        eW = (0, Z.useCallback)(function() {
                            L(!1), U(void 0)
                        }, []),
                        eV = (0, Z.useCallback)(function() {
                            H(!1)
                        }, []),
                        eq = (0, Z.useCallback)(function(e, r, n) {
                            var o, a = e.id === (null == (o = (0, eu.authenticatedUser)()) ? void 0 : o.id);
                            return dZ({
                                isMyOffer: a,
                                label: t(a ? "Label.YourOffer" : "Label.YourRequest"),
                                robux: null != r ? r : null,
                                items: n || [],
                                slots: [],
                                user: e
                            })
                        }, [t]),
                        eX = (0, Z.useCallback)(function(e, t) {
                            var r;
                            return (r = function() {
                                var r, n;
                                return function(e, t) {
                                    var r, n, o, a = {
                                            label: 0,
                                            sent: function() {
                                                if (1 & o[0]) throw o[1];
                                                return o[1]
                                            },
                                            trys: [],
                                            ops: []
                                        },
                                        i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                        l = Object.defineProperty;
                                    return l(i, "next", {
                                        value: c(0)
                                    }), l(i, "throw", {
                                        value: c(1)
                                    }), l(i, "return", {
                                        value: c(2)
                                    }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                                        value: function() {
                                            return this
                                        }
                                    }), i;

                                    function c(l) {
                                        return function(c) {
                                            var u = [l, c];
                                            if (r) throw TypeError("Generator is already executing.");
                                            for (; i && (i = 0, u[0] && (a = 0)), a;) try {
                                                if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                                switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                                    case 0:
                                                    case 1:
                                                        o = u;
                                                        break;
                                                    case 4:
                                                        return a.label++, {
                                                            value: u[1],
                                                            done: !1
                                                        };
                                                    case 5:
                                                        a.label++, n = u[1], u = [0];
                                                        continue;
                                                    case 7:
                                                        u = a.ops.pop(), a.trys.pop();
                                                        continue;
                                                    default:
                                                        if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                            a = 0;
                                                            continue
                                                        }
                                                        if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                            a.label = u[1];
                                                            break
                                                        }
                                                        if (6 === u[0] && a.label < o[1]) {
                                                            a.label = o[1], o = u;
                                                            break
                                                        }
                                                        if (o && a.label < o[2]) {
                                                            a.label = o[2], a.ops.push(u);
                                                            break
                                                        }
                                                        o[2] && a.ops.pop(), a.trys.pop();
                                                        continue
                                                }
                                                u = t.call(e, a)
                                            } catch (e) {
                                                u = [6, e], n = 0
                                            } finally {
                                                r = o = 0
                                            }
                                            if (5 & u[0]) throw u[1];
                                            return {
                                                value: u[0] ? u[1] : void 0,
                                                done: !0
                                            }
                                        }
                                    }
                                }(this, function(o) {
                                    switch (o.label) {
                                        case 0:
                                            if (!e.length || !t) return [2];
                                            return r = new Set(e), [4, eM(function() {
                                                var e, r, n, o;
                                                return eK(this, function(a) {
                                                    switch (a.label) {
                                                        case 0:
                                                            if (!t || t <= 0) return [2, []];
                                                            e = [], a.label = 1;
                                                        case 1:
                                                            a.trys.push([1, 6, , 7]), a.label = 2;
                                                        case 2:
                                                            return [4, eY(t, {
                                                                cursor: r
                                                            })];
                                                        case 3:
                                                            o = a.sent(), (n = e).push.apply(n, eF(o.items)), r = o.nextPageCursor || void 0, a.label = 4;
                                                        case 4:
                                                            if (r) return [3, 2];
                                                            a.label = 5;
                                                        case 5:
                                                            return [3, 7];
                                                        case 6:
                                                            return a.sent(), [2, e];
                                                        case 7:
                                                            return [2, e]
                                                    }
                                                })
                                            })()];
                                        case 1:
                                            if (!(n = o.sent().filter(function(e) {
                                                    return r.has(e.collectibleItemInstanceId)
                                                }).slice(0, dG).map(function(e) {
                                                    return dV(dB({}, e), {
                                                        userId: t,
                                                        id: e.collectibleItemInstanceId
                                                    })
                                                })).length) return [2];
                                            return er(q.current.map(function(e) {
                                                return e.user.id === t ? dZ(dV(dB({}, e), {
                                                    items: dX(e.items).concat(dX(n))
                                                })) : e
                                            })), n.forEach(eo), [2]
                                    }
                                })
                            }, function() {
                                var e = this,
                                    t = arguments;
                                return new Promise(function(n, o) {
                                    var a = r.apply(e, t);

                                    function i(e) {
                                        dW(a, n, o, i, l, "next", e)
                                    }

                                    function l(e) {
                                        dW(a, n, o, i, l, "throw", e)
                                    }
                                    i(void 0)
                                })
                            })()
                        }, [eo, er]),
                        eZ = (0, Z.useCallback)(function() {
                            if ("u" > typeof URLSearchParams) {
                                var e = new URLSearchParams(window.location.search),
                                    t = function(t) {
                                        return (e.get(t) || "").split(",").map(function(e) {
                                            return e.trim()
                                        }).filter(Boolean)
                                    },
                                    r = t("oitems"),
                                    n = t("ritems");
                                if (r.length) {
                                    var o = q.current.find(function(e) {
                                        return e.isMyOffer
                                    });
                                    eX(r, null == o ? void 0 : o.user.id).catch(function(e) {
                                        tv("addItemsFromUrl", e)
                                    })
                                }
                                if (n.length) {
                                    var a = q.current.find(function(e) {
                                        return !e.isMyOffer
                                    });
                                    eX(n, null == a ? void 0 : a.user.id).catch(function(e) {
                                        tv("addItemsFromUrl", e)
                                    })
                                }
                            }
                        }, [eX]),
                        e1 = (0, Z.useCallback)(function(r) {
                            eM(function() {
                                var e, t, n, o;
                                return eK(this, function(a) {
                                    switch (a.label) {
                                        case 0:
                                            if (!r || r <= 0) throw Error("Invalid user id");
                                            return t = {
                                                url: "".concat(ep.urls.usersApi, "/v1/users"),
                                                withCredentials: !0
                                            }, [4, ey.post(t, {
                                                userIds: [r]
                                            })];
                                        case 1:
                                            if (!(o = null == (n = a.sent().data) || null == (e = n.data) ? void 0 : e[0])) throw Error("User not found");
                                            return [2, {
                                                id: o.id,
                                                name: o.name,
                                                displayName: o.displayName,
                                                nameForDisplay: eH(o.displayName, o.name)
                                            }]
                                    }
                                })
                            })().then(function(e) {
                                tA("openNewTrade: loaded partner", e);
                                var t, r = null != (t = (0, eu.authenticatedUser)()) ? t : {},
                                    n = r.id,
                                    o = r.name,
                                    a = r.displayName,
                                    i = {
                                        id: n,
                                        name: o,
                                        displayName: a,
                                        nameForDisplay: eH(a, o)
                                    },
                                    l = [eq(e, null, []), eq(i, null, [])];
                                h(e), X.current = e, er(l), d(!0), eZ()
                            }).catch(function(r) {
                                tC("openNewTrade: getUserById failed", r), tv("loadTradePartner", r), y(t("Message.InvalidUser")), e.warning(t("Message.InvalidUser"))
                            })
                        }, [eZ, er, eq, e, t]),
                        e2 = (0, Z.useCallback)(function(e) {
                            tA("openNewTrade: userId=", e, "me=", null == (t = (0, eu.authenticatedUser)()) ? void 0 : t.id), er([]), $.current = null, d(!1), y(null);
                            var t, r = ep.canTradeWithStatus,
                                n = ep.urls;
                            Promise.all([eM(function() {
                                var t, r;
                                return eK(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            return t = {
                                                url: "".concat(ep.urls.tradesApi, "/v1/users/").concat(e, "/can-trade-with"),
                                                withCredentials: !0
                                            }, [4, ey.get(t)];
                                        case 1:
                                            return [2, null != (r = n.sent().data) ? r : null]
                                    }
                                })
                            })(), e$().catch(function() {
                                return null
                            })]).then(function(t) {
                                var o = dq(t, 2),
                                    a = o[0],
                                    i = o[1],
                                    l = null == a ? void 0 : a.status;
                                (tA("openNewTrade: canTradeWith status=", l, "tradeEligibility=", null == i ? void 0 : i.tradeEligibility), l === r.canTrade || eJ(l) || e0(l)) ? e1(e): l === r.senderCannotTrade ? eJ(null == i ? void 0 : i.tradeEligibility) || e0(null == i ? void 0 : i.tradeEligibility) || eI(null == i ? void 0 : i.freeTradesAllowance) ? e1(e) : window.location.href = n.membership : window.location.href = l && l !== r.cannotTradeWithSelf && l !== r.unknownError ? n.forbidden : n.badRequest
                            }).catch(function(e) {
                                tC("openNewTrade: canTradeWith failed", e), tv("canTradeWith", e), window.location.href = n.badRequest
                            })
                        }, [er, e1]),
                        e6 = (0, Z.useCallback)(function(r) {
                            var n;
                            tA("openCounterTrade: tradeId=", r), er([]), $.current = r, d(!1), y(null), eB(null == (n = (0, eu.authenticatedUser)()) ? void 0 : n.id, r).then(function(e) {
                                if (tA("openCounterTrade: loaded trade", e), !e || !e.offers) {
                                    tC("openCounterTrade: trade has no offers", e), y(t("Error.TradeUnknownError"));
                                    return
                                }
                                if (e.offers.some(function(e) {
                                        return !e.user
                                    })) {
                                    tC("openCounterTrade: trade has a moderated/null participant", e), y(t("Error.TradeUnknownError"));
                                    return
                                }
                                var r, n, o = e.offers.map(function(t) {
                                        var r, n, o = t.items.map(function(e) {
                                            return dV(dB({}, e), {
                                                id: e.collectibleItemInstanceId,
                                                userId: t.user.id
                                            })
                                        });
                                        return eq(dV(dB({}, t.user), {
                                            nameForDisplay: null != (r = null == (n = e.user) ? void 0 : n.nameForDisplay) ? r : t.user.nameForDisplay
                                        }), t.robux, o)
                                    }),
                                    a = null != (r = null == (n = o.find(function(e) {
                                        return !e.isMyOffer
                                    })) ? void 0 : n.user) ? r : null;
                                h(a), X.current = a, er(o), d(!0)
                            }).catch(function(r) {
                                tC("openCounterTrade: getTrade failed", r), tv("openCounterTrade", r), y(t("Error.TradeUnknownError")), e.warning(t("Error.TradeUnknownError"))
                            })
                        }, [er, eq, e, t]);
                    return (0, Z.useEffect)(function() {
                        tA("useTradeRequest init effect for route", n), "create" === n.view && n.userId ? e2(n.userId) : "counter" === n.view && n.tradeId ? e6(n.tradeId) : tC("useTradeRequest: route missing required params", n)
                    }, [n.view, n.userId, n.tradeId]), {
                        loaded: f,
                        initError: m,
                        partner: v,
                        offers: c,
                        error: O,
                        tradePending: x,
                        isCounterTrade: null !== $.current,
                        isRobuxAmountValid: eE,
                        toggleItem: eh,
                        removeItem: ev,
                        setRobux: ew,
                        onRobuxBlur: ej,
                        isItemInOffers: ei,
                        isItemUnavailable: es,
                        doesItemHaveError: ef,
                        getItemErrorReason: ed,
                        isPartnerRobuxLocked: eg,
                        confirmSendOpen: E,
                        requestSend: eD,
                        cancelSend: eL,
                        confirmSend: e_,
                        economicBody: I,
                        dismissEconomic: eU,
                        verificationRedirectOpen: T,
                        dismissVerificationRedirect: ez,
                        plusUpsellOpen: M,
                        plusUpsellTitleKey: F,
                        dismissPlusUpsell: eW,
                        ageCheckPromptOpen: K,
                        dismissAgeCheckPrompt: eV,
                        startAgeCheck: function() {
                            H(!1), Y.current = !0;
                            var r = null === $.current ? "send-trade" : "counter-trade";
                            nC(r).then(function(e) {
                                e && (J.current = !0, ee.current())
                            }).catch(function(n) {
                                tC("startAgeCheck: FAE flow failed", n), tv("facialAgeEstimation", n, {
                                    source: r
                                }), e.warning(t("Response.VerificationError"))
                            })
                        }
                    }
                };

            function d0(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function d1(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function d2(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            d1(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            d1(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function d8(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || d6(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function d3(e) {
                return function(e) {
                    if (Array.isArray(e)) return d0(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || d6(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function d6(e, t) {
                if (e) {
                    if ("string" == typeof e) return d0(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return d0(e, t)
                }
            }

            function d4(e, t) {
                var r, n, o, a = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(i, "next", {
                    value: c(0)
                }), l(i, "throw", {
                    value: c(1)
                }), l(i, "return", {
                    value: c(2)
                }), "function" == typeof Symbol && l(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function c(l) {
                    return function(c) {
                        var u = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, u[0] && (a = 0)), a;) try {
                            if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                            switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                case 0:
                                case 1:
                                    o = u;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(o = (o = a.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                        a.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && a.label < o[1]) {
                                        a.label = o[1], o = u;
                                        break
                                    }
                                    if (o && a.label < o[2]) {
                                        a.label = o[2], a.ops.push(u);
                                        break
                                    }
                                    o[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            u = t.call(e, a)
                        } catch (e) {
                            u = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var d5 = ep.getTradableItemsLimit,
                d7 = function(e) {
                    var t = d8((0, Z.useState)([]), 2),
                        r = t[0],
                        n = t[1],
                        o = d8((0, Z.useState)(!1), 2),
                        a = o[0],
                        i = o[1],
                        l = d8((0, Z.useState)(!1), 2),
                        c = l[0],
                        u = l[1],
                        s = d8((0, Z.useState)(""), 2),
                        f = s[0],
                        d = s[1],
                        p = d8((0, Z.useState)(""), 2),
                        m = p[0],
                        y = p[1],
                        b = d8((0, Z.useState)(!1), 2),
                        v = b[0],
                        h = b[1],
                        g = d8((0, Z.useState)(!1), 2),
                        O = g[0],
                        w = g[1],
                        j = d8((0, Z.useState)(1), 2),
                        x = j[0],
                        S = j[1],
                        P = (0, Q.useDebounce)(m.trim(), ep.inventorySearchDebounceMs),
                        E = (0, Z.useRef)(window.innerWidth < 991 ? 12 : 10),
                        A = (0, Z.useRef)([]),
                        C = (0, Z.useRef)(0),
                        I = (0, Z.useRef)(null),
                        N = (0, Z.useRef)(0),
                        R = (0, Z.useCallback)(function() {
                            var e = E.current,
                                t = C.current * e,
                                r = A.current;
                            n(r.slice(t, t + e)), h(C.current > 0), w(r.length > t + e || null !== I.current), S(C.current + 1)
                        }, []),
                        T = (0, Z.useCallback)(function(t, r, n) {
                            return d2(function() {
                                var o;
                                return d4(this, function(a) {
                                    switch (a.label) {
                                        case 0:
                                            return [4, eY(e, {
                                                itemTargetType: t || void 0,
                                                cursor: I.current || void 0,
                                                limit: d5,
                                                search: r || void 0
                                            })];
                                        case 1:
                                            if (o = a.sent(), N.current !== n) return [2, !1];
                                            return A.current = d3(A.current).concat(d3(o.items)), I.current = o.nextPageCursor, [2, !0]
                                    }
                                })
                            })()
                        }, [e]),
                        k = (0, Z.useCallback)(function(t, r) {
                            var o = N.current + 1;
                            N.current = o, A.current = [], C.current = 0, I.current = null, n([]), h(!1), w(!1), S(1), u(!1), i(!0), T(t, r, o).then(function(e) {
                                e && (R(), i(!1))
                            }).catch(function(t) {
                                N.current === o && (tC("useInventoryPager: failed to load inventory for user", e, t), i(!1), u(!0))
                            })
                        }, [T, R, e]);
                    (0, Z.useEffect)(function() {
                        k("", "")
                    }, [e]);
                    var D = (0, Z.useRef)(P);
                    (0, Z.useEffect)(function() {
                        D.current !== P && (D.current = P, k(f, P))
                    }, [P, f, k]);
                    var M = (0, Z.useCallback)(function(e) {
                            d(e), k(e, P)
                        }, [P, k]),
                        L = (0, Z.useCallback)(function() {
                            if (!a) {
                                var t = E.current,
                                    r = (C.current + 1) * t,
                                    n = r + t,
                                    o = A.current;
                                if (o.length >= n || null === I.current && o.length > r) {
                                    C.current += 1, R();
                                    return
                                }
                                if (null !== I.current) {
                                    var l = N.current;
                                    i(!0), d2(function() {
                                        return d4(this, function(e) {
                                            switch (e.label) {
                                                case 0:
                                                    if (!(A.current.length < n && null !== I.current)) return [3, 2];
                                                    return [4, T(f, P, l)];
                                                case 1:
                                                    if (!e.sent()) return [2];
                                                    return [3, 0];
                                                case 2:
                                                    return [2]
                                            }
                                        })
                                    })().then(function() {
                                        N.current === l && (A.current.length > r && (C.current += 1), R(), i(!1))
                                    }).catch(function(t) {
                                        N.current === l && (tC("useInventoryPager: failed to load inventory for user", e, t), i(!1), u(!0))
                                    })
                                }
                            }
                        }, [P, f, a, T, R, e]),
                        _ = (0, Z.useCallback)(function() {
                            a || C.current <= 0 || (C.current -= 1, R())
                        }, [a, R]);
                    return {
                        items: r,
                        loading: a,
                        loadFailed: c,
                        filter: f,
                        search: m,
                        appliedSearch: P,
                        hasPrev: v,
                        hasNext: O,
                        page: x,
                        setFilter: M,
                        setSearch: y,
                        loadNext: L,
                        loadPrev: _
                    }
                },
                d9 = Z.forwardRef(function(e, t) {
                    var r, n, o = e.children,
                        a = e.width,
                        i = e.height,
                        l = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(e, ["children", "width", "height"]);
                    return (0, $.jsx)(oi.svg, (r = function(e) {
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
                    }({}, l), n = n = {
                        ref: t,
                        width: void 0 === a ? 10 : a,
                        height: void 0 === i ? 5 : i,
                        viewBox: "0 0 30 10",
                        preserveAspectRatio: "none",
                        children: e.asChild ? o : (0, $.jsx)("polygon", {
                            points: "0,0 30,0 15,10"
                        })
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

            function pe(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function pt(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function pr(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        pt(e, t, r[t])
                    })
                }
                return e
            }

            function pn(e, t) {
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

            function po(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function pa(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || pi(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function pi(e, t) {
                if (e) {
                    if ("string" == typeof e) return pe(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return pe(e, t)
                }
            }
            d9.displayName = "Arrow";
            var pl = "Popper",
                pc = pa(nB(pl), 2),
                pu = pc[0],
                ps = pc[1],
                pf = pa(pu(pl), 2),
                pd = pf[0],
                pp = pf[1],
                pm = function(e) {
                    var t = e.__scopePopper,
                        r = e.children,
                        n = pa(Z.useState(null), 2),
                        o = n[0],
                        a = n[1];
                    return (0, $.jsx)(pd, {
                        scope: t,
                        anchor: o,
                        onAnchorChange: a,
                        children: r
                    })
                };
            pm.displayName = pl;
            var py = "PopperAnchor",
                pb = Z.forwardRef(function(e, t) {
                    var r = e.__scopePopper,
                        n = e.virtualRef,
                        o = po(e, ["__scopePopper", "virtualRef"]),
                        a = pp(py, r),
                        i = Z.useRef(null),
                        l = tG(t, i);
                    return Z.useEffect(function() {
                        a.onAnchorChange((null == n ? void 0 : n.current) || i.current)
                    }), n ? null : (0, $.jsx)(oi.div, pn(pr({}, o), {
                        ref: l
                    }))
                });
            pb.displayName = py;
            var pv = "PopperContent",
                ph = pa(pu(pv), 2),
                pg = ph[0],
                pO = ph[1],
                pw = Z.forwardRef(function(e, t) {
                    var r, n, o, a, i, l, c, u, s = e.__scopePopper,
                        f = e.side,
                        d = e.sideOffset,
                        p = e.align,
                        m = void 0 === p ? "center" : p,
                        y = e.alignOffset,
                        b = e.arrowPadding,
                        v = e.avoidCollisions,
                        h = void 0 === v || v,
                        g = e.collisionBoundary,
                        O = void 0 === g ? [] : g,
                        w = e.collisionPadding,
                        j = void 0 === w ? 0 : w,
                        x = e.sticky,
                        S = e.hideWhenDetached,
                        P = e.updatePositionStrategy,
                        E = void 0 === P ? "optimized" : P,
                        A = e.onPlaced,
                        C = po(e, ["__scopePopper", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "avoidCollisions", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "updatePositionStrategy", "onPlaced"]),
                        I = pp(pv, s),
                        N = pa(Z.useState(null), 2),
                        R = N[0],
                        T = N[1],
                        k = tG(t, function(e) {
                            return T(e)
                        }),
                        D = pa(Z.useState(null), 2),
                        M = D[0],
                        L = D[1],
                        _ = fO(M),
                        F = null != (r = null == _ ? void 0 : _.width) ? r : 0,
                        U = null != (n = null == _ ? void 0 : _.height) ? n : 0,
                        z = "number" == typeof j ? j : pr({
                            top: 0,
                            right: 0,
                            bottom: 0,
                            left: 0
                        }, j),
                        K = Array.isArray(O) ? O : [O],
                        H = K.length > 0,
                        W = {
                            padding: z,
                            boundary: K.filter(pP),
                            altBoundary: H
                        },
                        B = ce({
                            strategy: "fixed",
                            placement: (void 0 === f ? "bottom" : f) + ("center" !== m ? "-" + m : ""),
                            whileElementsMounted: function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return lQ.apply(void 0, ((function(e) {
                                    if (Array.isArray(e)) return pe(e)
                                })(t) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(t) || pi(t) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()).concat([{
                                    animationFrame: "always" === E
                                }]))
                            },
                            elements: {
                                reference: I.anchor
                            },
                            middleware: [ct({
                                mainAxis: (void 0 === d ? 0 : d) + U,
                                alignmentAxis: void 0 === y ? 0 : y
                            }), h && cr(pr({
                                mainAxis: !0,
                                crossAxis: !1,
                                limiter: "partial" === (void 0 === x ? "partial" : x) ? cn() : void 0
                            }, W)), h && co(pr({}, W)), ca(pn(pr({}, W), {
                                apply: function(e) {
                                    var t = e.elements,
                                        r = e.rects,
                                        n = e.availableWidth,
                                        o = e.availableHeight,
                                        a = r.reference,
                                        i = a.width,
                                        l = a.height,
                                        c = t.floating.style;
                                    c.setProperty("--radix-popper-available-width", "".concat(n, "px")), c.setProperty("--radix-popper-available-height", "".concat(o, "px")), c.setProperty("--radix-popper-anchor-width", "".concat(i, "px")), c.setProperty("--radix-popper-anchor-height", "".concat(l, "px"))
                                }
                            })), M && cl({
                                element: M,
                                padding: void 0 === b ? 0 : b
                            }), pE({
                                arrowWidth: F,
                                arrowHeight: U
                            }), void 0 !== S && S && ci(pr({
                                strategy: "referenceHidden"
                            }, W))]
                        }),
                        V = B.refs,
                        q = B.floatingStyles,
                        X = B.placement,
                        G = B.isPositioned,
                        Y = B.middlewareData,
                        Q = pa(pA(X), 2),
                        J = Q[0],
                        ee = Q[1],
                        et = nZ(A);
                    nq(function() {
                        G && (null == et || et())
                    }, [G, et]);
                    var er = null == (o = Y.arrow) ? void 0 : o.x,
                        en = null == (a = Y.arrow) ? void 0 : a.y,
                        eo = (null == (i = Y.arrow) ? void 0 : i.centerOffset) !== 0,
                        ea = pa(Z.useState(), 2),
                        ei = ea[0],
                        el = ea[1];
                    return nq(function() {
                        R && el(window.getComputedStyle(R).zIndex)
                    }, [R]), (0, $.jsx)("div", {
                        ref: V.setFloating,
                        "data-radix-popper-content-wrapper": "",
                        style: pr(pn(pr({}, q), pt({
                            transform: G ? q.transform : "translate(0, -200%)",
                            minWidth: "max-content",
                            zIndex: ei
                        }, "--radix-popper-transform-origin", [null == (l = Y.transformOrigin) ? void 0 : l.x, null == (c = Y.transformOrigin) ? void 0 : c.y].join(" "))), (null == (u = Y.hide) ? void 0 : u.referenceHidden) && {
                            visibility: "hidden",
                            pointerEvents: "none"
                        }),
                        dir: e.dir,
                        children: (0, $.jsx)(pg, {
                            scope: s,
                            placedSide: J,
                            onArrowChange: L,
                            arrowX: er,
                            arrowY: en,
                            shouldHideArrow: eo,
                            children: (0, $.jsx)(oi.div, pn(pr({
                                "data-side": J,
                                "data-align": ee
                            }, C), {
                                ref: k,
                                style: pn(pr({}, C.style), {
                                    animation: G ? void 0 : "none"
                                })
                            }))
                        })
                    })
                });
            pw.displayName = pv;
            var pj = "PopperArrow",
                px = {
                    top: "bottom",
                    right: "left",
                    bottom: "top",
                    left: "right"
                },
                pS = Z.forwardRef(function(e, t) {
                    var r, n = e.__scopePopper,
                        o = po(e, ["__scopePopper"]),
                        a = pO(pj, n),
                        i = px[a.placedSide];
                    return (0, $.jsx)("span", {
                        ref: a.onArrowChange,
                        style: (pt(r = {
                            position: "absolute",
                            left: a.arrowX,
                            top: a.arrowY
                        }, i, 0), pt(r, "transformOrigin", {
                            top: "",
                            right: "0 0",
                            bottom: "center 0",
                            left: "100% 0"
                        } [a.placedSide]), pt(r, "transform", {
                            top: "translateY(100%)",
                            right: "translateY(50%) rotate(90deg) translateX(-50%)",
                            bottom: "rotate(180deg)",
                            left: "translateY(50%) rotate(-90deg) translateX(50%)"
                        } [a.placedSide]), pt(r, "visibility", a.shouldHideArrow ? "hidden" : void 0), r),
                        children: (0, $.jsx)(d9, pn(pr({}, o), {
                            ref: t,
                            style: pn(pr({}, o.style), {
                                display: "block"
                            })
                        }))
                    })
                });

            function pP(e) {
                return null !== e
            }
            pS.displayName = pj;
            var pE = function(e) {
                return {
                    name: "transformOrigin",
                    options: e,
                    fn: function(t) {
                        var r, n, o, a, i, l = t.placement,
                            c = t.rects,
                            u = t.middlewareData,
                            s = (null == (o = u.arrow) ? void 0 : o.centerOffset) !== 0,
                            f = s ? 0 : e.arrowWidth,
                            d = s ? 0 : e.arrowHeight,
                            p = pa(pA(l), 2),
                            m = p[0],
                            y = {
                                start: "0%",
                                center: "50%",
                                end: "100%"
                            } [p[1]],
                            b = (null != (r = null == (a = u.arrow) ? void 0 : a.x) ? r : 0) + f / 2,
                            v = (null != (n = null == (i = u.arrow) ? void 0 : i.y) ? n : 0) + d / 2,
                            h = "",
                            g = "";
                        return "bottom" === m ? (h = s ? y : "".concat(b, "px"), g = "".concat(-d, "px")) : "top" === m ? (h = s ? y : "".concat(b, "px"), g = "".concat(c.floating.height + d, "px")) : "right" === m ? (h = "".concat(-d, "px"), g = s ? y : "".concat(v, "px")) : "left" === m && (h = "".concat(c.floating.width + d, "px"), g = s ? y : "".concat(v, "px")), {
                            data: {
                                x: h,
                                y: g
                            }
                        }
                    }
                }
            };

            function pA(e) {
                var t = pa(e.split("-"), 2),
                    r = t[0],
                    n = t[1];
                return [r, void 0 === n ? "center" : n]
            }

            function pC(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function pI(e) {
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

            function pN(e, t) {
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

            function pR(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function pT(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return pC(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return pC(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var pk = "Popover",
                pD = pT(nB(pk, [ps]), 2),
                pM = pD[0];
            pD[1];
            var pL = ps(),
                p_ = pT(pM(pk), 2),
                pF = p_[0],
                pU = p_[1],
                pz = function(e) {
                    var t = e.__scopePopover,
                        r = e.children,
                        n = e.open,
                        o = e.defaultOpen,
                        a = e.onOpenChange,
                        i = e.modal,
                        l = pL(t),
                        c = Z.useRef(null),
                        u = pT(Z.useState(!1), 2),
                        s = u[0],
                        f = u[1],
                        d = pT(n1({
                            prop: n,
                            defaultProp: o,
                            onChange: a
                        }), 2),
                        p = d[0],
                        m = d[1];
                    return (0, $.jsx)(pm, pN(pI({}, l), {
                        children: (0, $.jsx)(pF, {
                            scope: t,
                            contentId: nY(),
                            triggerRef: c,
                            open: void 0 !== p && p,
                            onOpenChange: m,
                            onOpenToggle: Z.useCallback(function() {
                                return m(function(e) {
                                    return !e
                                })
                            }, [m]),
                            hasCustomAnchor: s,
                            onCustomAnchorAdd: Z.useCallback(function() {
                                return f(!0)
                            }, []),
                            onCustomAnchorRemove: Z.useCallback(function() {
                                return f(!1)
                            }, []),
                            modal: void 0 !== i && i,
                            children: r
                        })
                    }))
                };
            pz.displayName = pk;
            var pK = "PopoverAnchor";
            Z.forwardRef(function(e, t) {
                var r = e.__scopePopover,
                    n = pR(e, ["__scopePopover"]),
                    o = pU(pK, r),
                    a = pL(r),
                    i = o.onCustomAnchorAdd,
                    l = o.onCustomAnchorRemove;
                return Z.useEffect(function() {
                    return i(),
                        function() {
                            return l()
                        }
                }, [i, l]), (0, $.jsx)(pb, pN(pI({}, a, n), {
                    ref: t
                }))
            }).displayName = pK;
            var pH = "PopoverTrigger",
                pW = Z.forwardRef(function(e, t) {
                    var r = e.__scopePopover,
                        n = pR(e, ["__scopePopover"]),
                        o = pU(pH, r),
                        a = pL(r),
                        i = tG(t, o.triggerRef),
                        l = (0, $.jsx)(oi.button, pN(pI({
                            type: "button",
                            "aria-haspopup": "dialog",
                            "aria-expanded": o.open,
                            "aria-controls": o.contentId,
                            "data-state": p2(o.open)
                        }, n), {
                            ref: i,
                            onClick: nF(e.onClick, o.onOpenToggle)
                        }));
                    return o.hasCustomAnchor ? l : (0, $.jsx)(pb, pN(pI({
                        asChild: !0
                    }, a), {
                        children: l
                    }))
                });
            pW.displayName = pH;
            var pB = "PopoverPortal",
                pV = pT(pM(pB, {
                    forceMount: void 0
                }), 2),
                pq = pV[0],
                pX = pV[1],
                p$ = function(e) {
                    var t = e.__scopePopover,
                        r = e.forceMount,
                        n = e.children,
                        o = e.container,
                        a = pU(pB, t);
                    return (0, $.jsx)(pq, {
                        scope: t,
                        forceMount: r,
                        children: (0, $.jsx)(ox, {
                            present: r || a.open,
                            children: (0, $.jsx)(oO, {
                                asChild: !0,
                                container: o,
                                children: n
                            })
                        })
                    })
                };
            p$.displayName = pB;
            var pG = "PopoverContent",
                pY = Z.forwardRef(function(e, t) {
                    var r = pX(pG, e.__scopePopover),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        a = pR(e, ["forceMount"]),
                        i = pU(pG, e.__scopePopover);
                    return (0, $.jsx)(ox, {
                        present: o || i.open,
                        children: i.modal ? (0, $.jsx)(pZ, pN(pI({}, a), {
                            ref: t
                        })) : (0, $.jsx)(pJ, pN(pI({}, a), {
                            ref: t
                        }))
                    })
                });
            pY.displayName = pG;
            var pQ = oe("PopoverContent.RemoveScroll"),
                pZ = Z.forwardRef(function(e, t) {
                    var r = pU(pG, e.__scopePopover),
                        n = Z.useRef(null),
                        o = tG(t, n),
                        a = Z.useRef(!1);
                    return Z.useEffect(function() {
                        var e = n.current;
                        if (e) return ac(e)
                    }, []), (0, $.jsx)(at, {
                        as: pQ,
                        allowPinchZoom: !0,
                        children: (0, $.jsx)(p0, pN(pI({}, e), {
                            ref: o,
                            trapFocus: r.open,
                            disableOutsidePointerEvents: !0,
                            onCloseAutoFocus: nF(e.onCloseAutoFocus, function(e) {
                                var t;
                                e.preventDefault(), a.current || null == (t = r.triggerRef.current) || t.focus()
                            }),
                            onPointerDownOutside: nF(e.onPointerDownOutside, function(e) {
                                var t = e.detail.originalEvent,
                                    r = 0 === t.button && !0 === t.ctrlKey;
                                a.current = 2 === t.button || r
                            }, {
                                checkForDefaultPrevented: !1
                            }),
                            onFocusOutside: nF(e.onFocusOutside, function(e) {
                                return e.preventDefault()
                            }, {
                                checkForDefaultPrevented: !1
                            })
                        }))
                    })
                }),
                pJ = Z.forwardRef(function(e, t) {
                    var r = pU(pG, e.__scopePopover),
                        n = Z.useRef(!1),
                        o = Z.useRef(!1);
                    return (0, $.jsx)(p0, pN(pI({}, e), {
                        ref: t,
                        trapFocus: !1,
                        disableOutsidePointerEvents: !1,
                        onCloseAutoFocus: function(t) {
                            var a, i;
                            null == (a = e.onCloseAutoFocus) || a.call(e, t), t.defaultPrevented || (n.current || null == (i = r.triggerRef.current) || i.focus(), t.preventDefault()), n.current = !1, o.current = !1
                        },
                        onInteractOutside: function(t) {
                            null == (a = e.onInteractOutside) || a.call(e, t), t.defaultPrevented || (n.current = !0, "pointerdown" === t.detail.originalEvent.type && (o.current = !0));
                            var a, i, l = t.target;
                            (null == (i = r.triggerRef.current) ? void 0 : i.contains(l)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && o.current && t.preventDefault()
                        }
                    }))
                }),
                p0 = Z.forwardRef(function(e, t) {
                    var r = e.__scopePopover,
                        n = e.trapFocus,
                        o = e.onOpenAutoFocus,
                        a = e.onCloseAutoFocus,
                        i = e.disableOutsidePointerEvents,
                        l = e.onEscapeKeyDown,
                        c = e.onPointerDownOutside,
                        u = e.onFocusOutside,
                        s = e.onInteractOutside,
                        f = pR(e, ["__scopePopover", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus", "disableOutsidePointerEvents", "onEscapeKeyDown", "onPointerDownOutside", "onFocusOutside", "onInteractOutside"]),
                        d = pU(pG, r),
                        p = pL(r);
                    return (0, oP.useFocusGuards)(), (0, $.jsx)(op, {
                        asChild: !0,
                        loop: !0,
                        trapped: n,
                        onMountAutoFocus: o,
                        onUnmountAutoFocus: a,
                        children: (0, $.jsx)(n2.DismissableLayer, {
                            asChild: !0,
                            disableOutsidePointerEvents: i,
                            onInteractOutside: s,
                            onEscapeKeyDown: l,
                            onPointerDownOutside: c,
                            onFocusOutside: u,
                            onDismiss: function() {
                                return d.onOpenChange(!1)
                            },
                            children: (0, $.jsx)(pw, pN(pI({
                                "data-state": p2(d.open),
                                role: "dialog",
                                id: d.contentId
                            }, p, f), {
                                ref: t,
                                style: pI({}, f.style, {
                                    "--radix-popover-content-transform-origin": "var(--radix-popper-transform-origin)",
                                    "--radix-popover-content-available-width": "var(--radix-popper-available-width)",
                                    "--radix-popover-content-available-height": "var(--radix-popper-available-height)",
                                    "--radix-popover-trigger-width": "var(--radix-popper-anchor-width)",
                                    "--radix-popover-trigger-height": "var(--radix-popper-anchor-height)"
                                })
                            }))
                        })
                    })
                }),
                p1 = "PopoverClose";

            function p2(e) {
                return e ? "open" : "closed"
            }
            Z.forwardRef(function(e, t) {
                var r = e.__scopePopover,
                    n = pR(e, ["__scopePopover"]),
                    o = pU(p1, r);
                return (0, $.jsx)(oi.button, pN(pI({
                    type: "button"
                }, n), {
                    ref: t,
                    onClick: nF(e.onClick, function() {
                        return o.onOpenChange(!1)
                    })
                }))
            }).displayName = p1, Z.forwardRef(function(e, t) {
                var r = e.__scopePopover,
                    n = pR(e, ["__scopePopover"]),
                    o = pL(r);
                return (0, $.jsx)(pS, pN(pI({}, o, n), {
                    ref: t
                }))
            }).displayName = "PopoverArrow";
            var p8 = function(e) {
                var t, r, n, o, a, i, l = null != (t = null == (n = (o = window).matchMedia) || null == (r = n.call(o, "(pointer: coarse)")) ? void 0 : r.matches) && t,
                    c = null == (a = document.activeElement) ? void 0 : a.matches(":focus-visible");
                if (l && !c) return void e.preventDefault();
                var u = null == (i = e.currentTarget) ? void 0 : i.querySelector('[role="menuitem"]:not([aria-disabled="true"])');
                u && (e.preventDefault(), u.focus())
            };

            function p3(e) {
                var t = e.open,
                    r = e.defaultOpen,
                    n = e.onOpenChange,
                    o = e.children;
                return Z.createElement(pz, {
                    open: t,
                    defaultOpen: r,
                    onOpenChange: n
                }, o)
            }

            function p6(e) {
                var t = e.asChild,
                    r = e.disabled,
                    n = e.className,
                    o = e.children;
                return Z.createElement(pW, {
                    asChild: t,
                    disabled: r,
                    className: n
                }, o)
            }

            function p4(e) {
                var t, r, n = e.side,
                    o = e.align,
                    a = e.sideOffset,
                    i = e.className,
                    l = e.children,
                    c = e.ariaLabel,
                    u = e.onOpenAutoFocus,
                    s = function(e, t) {
                        if (null == e) return {};
                        var r, n, o, a = {};
                        if ("u" > typeof Reflect && Reflect.ownKeys) {
                            for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }
                        if (a = function(e, t) {
                                if (null == e) return {};
                                var r, n, o = {},
                                    a = Object.getOwnPropertyNames(e);
                                for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                return o
                            }(e, t), Object.getOwnPropertySymbols)
                            for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                        return a
                    }(e, ["side", "align", "sideOffset", "className", "children", "ariaLabel", "onOpenAutoFocus"]);
                return Z.createElement(p$, null, Z.createElement(pY, (t = function(e) {
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
                    side: void 0 === n ? "bottom" : n,
                    align: void 0 === o ? "center" : o,
                    sideOffset: void 0 === a ? 4 : a
                }, s), r = r = {
                    "aria-label": null != c ? c : s["aria-label"],
                    onOpenAutoFocus: null != u ? u : p8,
                    className: tH("foundation-web-portal-zindex", i)
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(r)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(r)).forEach(function(e) {
                    Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(r, e))
                }), t), l))
            }
            var p5 = {
                    Standard: "bg-none",
                    Contrast: "bg-shift-200",
                    Utility: "bg-none"
                },
                p7 = {
                    Standard: "stroke-standard",
                    Contrast: "stroke-none",
                    Utility: "stroke-none"
                };

            function p9(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function me(e, t) {
                var r = function(e) {
                        if (Array.isArray(e)) return e
                    }(t) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                a = !0,
                                i = !1;
                            try {
                                for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                            } catch (e) {
                                i = !0, r = e
                            } finally {
                                try {
                                    a || null == n.return || n.return()
                                } finally {
                                    if (i) throw r
                                }
                            }
                            return o
                        }
                    }(t) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return p9(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return p9(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r[0];
                return Math.min(r[1], Math.max(n, e))
            }

            function mt(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function mr(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function mn(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        mr(e, t, r[t])
                    })
                }
                return e
            }

            function mo(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return mt(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return mt(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ma(e) {
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
            var mi = Z.forwardRef(function(e, t) {
                var r, n;
                return (0, $.jsx)(oi.span, (r = ma({}, e), n = n = {
                    ref: t,
                    style: ma({
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
                    }, e.style)
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

            function ml(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function mc(e) {
                if (Array.isArray(e)) return e
            }

            function mu() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function ms(e) {
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

            function mf(e, t) {
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

            function md(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function mp(e, t) {
                return mc(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var a = [],
                            i = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(i = (r = o.next()).done) && (a.push(r.value), !t || a.length !== t); i = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                i || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || mm(e, t) || mu()
            }

            function mm(e, t) {
                if (e) {
                    if ("string" == typeof e) return ml(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ml(e, t)
                }
            }
            mi.displayName = "VisuallyHidden";
            var my = [" ", "Enter", "ArrowUp", "ArrowDown"],
                mb = [" ", "Enter"],
                mv = "Select",
                mh = mp((R = (N = mo(nB(I = mv + "CollectionProvider"), 2))[0], T = N[1], D = (k = mo(R(I, {
                    collectionRef: {
                        current: null
                    },
                    itemMap: new Map
                }), 2))[0], M = k[1], (L = function(e) {
                    var t = e.scope,
                        r = e.children,
                        n = J().useRef(null),
                        o = J().useRef(new Map).current;
                    return (0, $.jsx)(D, {
                        scope: t,
                        itemMap: o,
                        collectionRef: n,
                        children: r
                    })
                }).displayName = I, F = oe(_ = mv + "CollectionSlot"), (U = J().forwardRef(function(e, t) {
                    var r = e.scope,
                        n = e.children,
                        o = tG(t, M(_, r).collectionRef);
                    return (0, $.jsx)(F, {
                        ref: o,
                        children: n
                    })
                })).displayName = _, K = "data-radix-collection-item", H = oe(z = mv + "CollectionItemSlot"), (W = J().forwardRef(function(e, t) {
                    var r, n, o = e.scope,
                        a = e.children,
                        i = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(e, ["scope", "children"]),
                        l = J().useRef(null),
                        c = tG(t, l),
                        u = M(z, o);
                    return J().useEffect(function() {
                        return u.itemMap.set(l, mn({
                                ref: l
                            }, i)),
                            function() {
                                u.itemMap.delete(l)
                            }
                    }), (0, $.jsx)(H, (r = mn({}, mr({}, K, "")), n = n = {
                        ref: c,
                        children: a
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
                })).displayName = z, [{
                    Provider: L,
                    Slot: U,
                    ItemSlot: W
                }, function(e) {
                    var t = M(mv + "CollectionConsumer", e);
                    return J().useCallback(function() {
                        var e = t.collectionRef.current;
                        if (!e) return [];
                        var r = Array.from(e.querySelectorAll("[".concat(K, "]")));
                        return Array.from(t.itemMap.values()).sort(function(e, t) {
                            return r.indexOf(e.ref.current) - r.indexOf(t.ref.current)
                        })
                    }, [t.collectionRef, t.itemMap])
                }, T]), 3),
                mg = mh[0],
                mO = mh[1],
                mw = mp(nB(mv, [mh[2], ps]), 2),
                mj = mw[0];
            mw[1];
            var mx = ps(),
                mS = mp(mj(mv), 2),
                mP = mS[0],
                mE = mS[1],
                mA = mp(mj(mv), 2),
                mC = mA[0],
                mI = mA[1],
                mN = function(e) {
                    var t = e.__scopeSelect,
                        r = e.children,
                        n = e.open,
                        o = e.defaultOpen,
                        a = e.onOpenChange,
                        i = e.value,
                        l = e.defaultValue,
                        c = e.onValueChange,
                        u = e.dir,
                        s = e.name,
                        f = e.autoComplete,
                        d = e.disabled,
                        p = e.required,
                        m = e.form,
                        y = mx(t),
                        b = mp(Z.useState(null), 2),
                        v = b[0],
                        h = b[1],
                        g = mp(Z.useState(null), 2),
                        O = g[0],
                        w = g[1],
                        j = mp(Z.useState(!1), 2),
                        x = j[0],
                        S = j[1],
                        P = s3(u),
                        E = mp(n1({
                            prop: n,
                            defaultProp: o,
                            onChange: a
                        }), 2),
                        A = E[0],
                        C = E[1],
                        I = mp(n1({
                            prop: i,
                            defaultProp: l,
                            onChange: c
                        }), 2),
                        N = I[0],
                        R = I[1],
                        T = Z.useRef(null),
                        k = !v || m || !!v.closest("form"),
                        D = mp(Z.useState(new Set), 2),
                        M = D[0],
                        L = D[1],
                        _ = Array.from(M).map(function(e) {
                            return e.props.value
                        }).join(";");
                    return (0, $.jsx)(pm, mf(ms({}, y), {
                        children: (0, $.jsxs)(mP, {
                            required: p,
                            scope: t,
                            trigger: v,
                            onTriggerChange: h,
                            valueNode: O,
                            onValueNodeChange: w,
                            valueNodeHasChildren: x,
                            onValueNodeHasChildrenChange: S,
                            contentId: nY(),
                            value: N,
                            onValueChange: R,
                            open: void 0 !== A && A,
                            onOpenChange: C,
                            dir: P,
                            triggerPointerDownPosRef: T,
                            disabled: d,
                            children: [(0, $.jsx)(mg.Provider, {
                                scope: t,
                                children: (0, $.jsx)(mC, {
                                    scope: e.__scopeSelect,
                                    onNativeOptionAdd: Z.useCallback(function(e) {
                                        L(function(t) {
                                            return new Set(t).add(e)
                                        })
                                    }, []),
                                    onNativeOptionRemove: Z.useCallback(function(e) {
                                        L(function(t) {
                                            var r = new Set(t);
                                            return r.delete(e), r
                                        })
                                    }, []),
                                    children: r
                                })
                            }), k ? (0, $.jsxs)(ya, {
                                "aria-hidden": !0,
                                required: p,
                                tabIndex: -1,
                                name: s,
                                autoComplete: f,
                                value: N,
                                onChange: function(e) {
                                    return R(e.target.value)
                                },
                                disabled: d,
                                form: m,
                                children: [void 0 === N ? (0, $.jsx)("option", {
                                    value: ""
                                }) : null, Array.from(M)]
                            }, _) : null]
                        })
                    }))
                };
            mN.displayName = mv;
            var mR = "SelectTrigger",
                mT = Z.forwardRef(function(e, t) {
                    var r = e.__scopeSelect,
                        n = e.disabled,
                        o = md(e, ["__scopeSelect", "disabled"]),
                        a = mx(r),
                        i = mE(mR, r),
                        l = i.disabled || void 0 !== n && n,
                        c = tG(t, i.onTriggerChange),
                        u = mO(r),
                        s = Z.useRef("touch"),
                        f = mp(yi(function(e) {
                            var t = u().filter(function(e) {
                                    return !e.disabled
                                }),
                                r = t.find(function(e) {
                                    return e.value === i.value
                                }),
                                n = yl(t, e, r);
                            void 0 !== n && i.onValueChange(n.value)
                        }), 3),
                        d = f[0],
                        p = f[1],
                        m = f[2],
                        y = function(e) {
                            l || (i.onOpenChange(!0), m()), e && (i.triggerPointerDownPosRef.current = {
                                x: Math.round(e.pageX),
                                y: Math.round(e.pageY)
                            })
                        };
                    return (0, $.jsx)(pb, mf(ms({
                        asChild: !0
                    }, a), {
                        children: (0, $.jsx)(oi.button, mf(ms({
                            type: "button",
                            role: "combobox",
                            "aria-controls": i.contentId,
                            "aria-expanded": i.open,
                            "aria-required": i.required,
                            "aria-autocomplete": "none",
                            dir: i.dir,
                            "data-state": i.open ? "open" : "closed",
                            disabled: l,
                            "data-disabled": l ? "" : void 0,
                            "data-placeholder": yo(i.value) ? "" : void 0
                        }, o), {
                            ref: c,
                            onClick: nF(o.onClick, function(e) {
                                e.currentTarget.focus(), "mouse" !== s.current && y(e)
                            }),
                            onPointerDown: nF(o.onPointerDown, function(e) {
                                s.current = e.pointerType;
                                var t = e.target;
                                t.hasPointerCapture(e.pointerId) && t.releasePointerCapture(e.pointerId), 0 === e.button && !1 === e.ctrlKey && "mouse" === e.pointerType && (y(e), e.preventDefault())
                            }),
                            onKeyDown: nF(o.onKeyDown, function(e) {
                                var t = "" !== d.current;
                                e.ctrlKey || e.altKey || e.metaKey || 1 !== e.key.length || p(e.key), (!t || " " !== e.key) && my.includes(e.key) && (y(), e.preventDefault())
                            })
                        }))
                    }))
                });
            mT.displayName = mR;
            var mk = "SelectValue",
                mD = Z.forwardRef(function(e, t) {
                    var r = e.__scopeSelect,
                        n = (e.className, e.style, e.children),
                        o = e.placeholder,
                        a = md(e, ["__scopeSelect", "className", "style", "children", "placeholder"]),
                        i = mE(mk, r),
                        l = i.onValueNodeHasChildrenChange,
                        c = void 0 !== n,
                        u = tG(t, i.onValueNodeChange);
                    return nq(function() {
                        l(c)
                    }, [l, c]), (0, $.jsx)(oi.span, mf(ms({}, a), {
                        ref: u,
                        style: {
                            pointerEvents: "none"
                        },
                        children: yo(i.value) ? (0, $.jsx)($.Fragment, {
                            children: void 0 === o ? "" : o
                        }) : n
                    }))
                });
            mD.displayName = mk;
            var mM = Z.forwardRef(function(e, t) {
                e.__scopeSelect;
                var r = e.children,
                    n = md(e, ["__scopeSelect", "children"]);
                return (0, $.jsx)(oi.span, mf(ms({
                    "aria-hidden": !0
                }, n), {
                    ref: t,
                    children: r || "▼"
                }))
            });
            mM.displayName = "SelectIcon";
            var mL = function(e) {
                return (0, $.jsx)(oO, ms({
                    asChild: !0
                }, e))
            };
            mL.displayName = "SelectPortal";
            var m_ = "SelectContent",
                mF = Z.forwardRef(function(e, t) {
                    var r = mE(m_, e.__scopeSelect),
                        n = mp(Z.useState(), 2),
                        o = n[0],
                        a = n[1];
                    return (nq(function() {
                        a(new DocumentFragment)
                    }, []), r.open) ? (0, $.jsx)(mW, mf(ms({}, e), {
                        ref: t
                    })) : o ? n8.createPortal((0, $.jsx)(mz, {
                        scope: e.__scopeSelect,
                        children: (0, $.jsx)(mg.Slot, {
                            scope: e.__scopeSelect,
                            children: (0, $.jsx)("div", {
                                children: e.children
                            })
                        })
                    }), o) : null
                });
            mF.displayName = m_;
            var mU = mp(mj(m_), 2),
                mz = mU[0],
                mK = mU[1],
                mH = oe("SelectContent.RemoveScroll"),
                mW = Z.forwardRef(function(e, t) {
                    var r = e.__scopeSelect,
                        n = e.position,
                        o = void 0 === n ? "item-aligned" : n,
                        a = e.onCloseAutoFocus,
                        i = e.onEscapeKeyDown,
                        l = e.onPointerDownOutside,
                        c = e.side,
                        u = e.sideOffset,
                        s = e.align,
                        f = e.alignOffset,
                        d = e.arrowPadding,
                        p = e.collisionBoundary,
                        m = e.collisionPadding,
                        y = e.sticky,
                        b = e.hideWhenDetached,
                        v = e.avoidCollisions,
                        h = md(e, ["__scopeSelect", "position", "onCloseAutoFocus", "onEscapeKeyDown", "onPointerDownOutside", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "avoidCollisions"]),
                        g = mE(m_, r),
                        O = mp(Z.useState(null), 2),
                        w = O[0],
                        j = O[1],
                        x = mp(Z.useState(null), 2),
                        S = x[0],
                        P = x[1],
                        E = tG(t, function(e) {
                            return j(e)
                        }),
                        A = mp(Z.useState(null), 2),
                        C = A[0],
                        I = A[1],
                        N = mp(Z.useState(null), 2),
                        R = N[0],
                        T = N[1],
                        k = mO(r),
                        D = mp(Z.useState(!1), 2),
                        M = D[0],
                        L = D[1],
                        _ = Z.useRef(!1);
                    Z.useEffect(function() {
                        if (w) return ac(w)
                    }, [w]), (0, oP.useFocusGuards)();
                    var F = Z.useCallback(function(e) {
                            var t = mc(c = k().map(function(e) {
                                    return e.ref.current
                                })) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(c) || mm(c) || mu(),
                                r = t[0],
                                n = mp(t.slice(1).slice(-1), 1)[0],
                                o = document.activeElement,
                                a = !0,
                                i = !1,
                                l = void 0;
                            try {
                                for (var c, u, s = e[Symbol.iterator](); !(a = (u = s.next()).done); a = !0) {
                                    var f = u.value;
                                    if (f === o || (null == f || f.scrollIntoView({
                                            block: "nearest"
                                        }), f === r && S && (S.scrollTop = 0), f === n && S && (S.scrollTop = S.scrollHeight), null == f || f.focus(), document.activeElement !== o)) return
                                }
                            } catch (e) {
                                i = !0, l = e
                            } finally {
                                try {
                                    a || null == s.return || s.return()
                                } finally {
                                    if (i) throw l
                                }
                            }
                        }, [k, S]),
                        U = Z.useCallback(function() {
                            return F([C, w])
                        }, [F, C, w]);
                    Z.useEffect(function() {
                        M && U()
                    }, [M, U]);
                    var z = g.onOpenChange,
                        K = g.triggerPointerDownPosRef;
                    Z.useEffect(function() {
                        if (w) {
                            var e = {
                                    x: 0,
                                    y: 0
                                },
                                t = function(t) {
                                    var r, n, o, a;
                                    e = {
                                        x: Math.abs(Math.round(t.pageX) - (null != (r = null == (o = K.current) ? void 0 : o.x) ? r : 0)),
                                        y: Math.abs(Math.round(t.pageY) - (null != (n = null == (a = K.current) ? void 0 : a.y) ? n : 0))
                                    }
                                },
                                r = function(r) {
                                    e.x <= 10 && e.y <= 10 ? r.preventDefault() : w.contains(r.target) || z(!1), document.removeEventListener("pointermove", t), K.current = null
                                };
                            return null !== K.current && (document.addEventListener("pointermove", t), document.addEventListener("pointerup", r, {
                                    capture: !0,
                                    once: !0
                                })),
                                function() {
                                    document.removeEventListener("pointermove", t), document.removeEventListener("pointerup", r, {
                                        capture: !0
                                    })
                                }
                        }
                    }, [w, z, K]), Z.useEffect(function() {
                        var e = function() {
                            return z(!1)
                        };
                        return window.addEventListener("blur", e), window.addEventListener("resize", e),
                            function() {
                                window.removeEventListener("blur", e), window.removeEventListener("resize", e)
                            }
                    }, [z]);
                    var H = mp(yi(function(e) {
                            var t = k().filter(function(e) {
                                    return !e.disabled
                                }),
                                r = t.find(function(e) {
                                    return e.ref.current === document.activeElement
                                }),
                                n = yl(t, e, r);
                            n && setTimeout(function() {
                                return n.ref.current.focus()
                            })
                        }), 2),
                        W = H[0],
                        B = H[1],
                        V = Z.useCallback(function(e, t, r) {
                            var n = !_.current && !r;
                            (void 0 !== g.value && g.value === t || n) && (I(e), n && (_.current = !0))
                        }, [g.value]),
                        q = Z.useCallback(function() {
                            return null == w ? void 0 : w.focus()
                        }, [w]),
                        X = Z.useCallback(function(e, t, r) {
                            var n = !_.current && !r;
                            (void 0 !== g.value && g.value === t || n) && T(e)
                        }, [g.value]),
                        G = "popper" === o ? mV : mB,
                        Y = G === mV ? {
                            side: c,
                            sideOffset: u,
                            align: s,
                            alignOffset: f,
                            arrowPadding: d,
                            collisionBoundary: p,
                            collisionPadding: m,
                            sticky: y,
                            hideWhenDetached: b,
                            avoidCollisions: v
                        } : {};
                    return (0, $.jsx)(mz, {
                        scope: r,
                        content: w,
                        viewport: S,
                        onViewportChange: P,
                        itemRefCallback: V,
                        selectedItem: C,
                        onItemLeave: q,
                        itemTextRefCallback: X,
                        focusSelectedItem: U,
                        selectedItemText: R,
                        position: o,
                        isPositioned: M,
                        searchRef: W,
                        children: (0, $.jsx)(at, {
                            as: mH,
                            allowPinchZoom: !0,
                            children: (0, $.jsx)(op, {
                                asChild: !0,
                                trapped: g.open,
                                onMountAutoFocus: function(e) {
                                    e.preventDefault()
                                },
                                onUnmountAutoFocus: nF(a, function(e) {
                                    var t;
                                    null == (t = g.trigger) || t.focus({
                                        preventScroll: !0
                                    }), e.preventDefault()
                                }),
                                children: (0, $.jsx)(n2.DismissableLayer, {
                                    asChild: !0,
                                    disableOutsidePointerEvents: !0,
                                    onEscapeKeyDown: i,
                                    onPointerDownOutside: l,
                                    onFocusOutside: function(e) {
                                        return e.preventDefault()
                                    },
                                    onDismiss: function() {
                                        return g.onOpenChange(!1)
                                    },
                                    children: (0, $.jsx)(G, mf(ms({
                                        role: "listbox",
                                        id: g.contentId,
                                        "data-state": g.open ? "open" : "closed",
                                        dir: g.dir,
                                        onContextMenu: function(e) {
                                            return e.preventDefault()
                                        }
                                    }, h, Y), {
                                        onPlaced: function() {
                                            return L(!0)
                                        },
                                        ref: E,
                                        style: ms({
                                            display: "flex",
                                            flexDirection: "column",
                                            outline: "none"
                                        }, h.style),
                                        onKeyDown: nF(h.onKeyDown, function(e) {
                                            var t = e.ctrlKey || e.altKey || e.metaKey;
                                            if ("Tab" === e.key && e.preventDefault(), t || 1 !== e.key.length || B(e.key), ["ArrowUp", "ArrowDown", "Home", "End"].includes(e.key)) {
                                                var r = k().filter(function(e) {
                                                    return !e.disabled
                                                }).map(function(e) {
                                                    return e.ref.current
                                                });
                                                if (["ArrowUp", "End"].includes(e.key) && (r = r.slice().reverse()), ["ArrowUp", "ArrowDown"].includes(e.key)) {
                                                    var n = e.target,
                                                        o = r.indexOf(n);
                                                    r = r.slice(o + 1)
                                                }
                                                setTimeout(function() {
                                                    return F(r)
                                                }), e.preventDefault()
                                            }
                                        })
                                    }))
                                })
                            })
                        })
                    })
                });
            mW.displayName = "SelectContentImpl";
            var mB = Z.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = e.onPlaced,
                    o = md(e, ["__scopeSelect", "onPlaced"]),
                    a = mE(m_, r),
                    i = mK(m_, r),
                    l = mp(Z.useState(null), 2),
                    c = l[0],
                    u = l[1],
                    s = mp(Z.useState(null), 2),
                    f = s[0],
                    d = s[1],
                    p = tG(t, function(e) {
                        return d(e)
                    }),
                    m = mO(r),
                    y = Z.useRef(!1),
                    b = Z.useRef(!0),
                    v = i.viewport,
                    h = i.selectedItem,
                    g = i.selectedItemText,
                    O = i.focusSelectedItem,
                    w = Z.useCallback(function() {
                        if (a.trigger && a.valueNode && c && f && v && h && g) {
                            var e = a.trigger.getBoundingClientRect(),
                                t = f.getBoundingClientRect(),
                                r = a.valueNode.getBoundingClientRect(),
                                o = g.getBoundingClientRect();
                            if ("rtl" !== a.dir) {
                                var i = o.left - t.left,
                                    l = r.left - i,
                                    u = e.left - l,
                                    s = e.width + u,
                                    d = Math.max(s, t.width),
                                    p = me(l, [10, Math.max(10, window.innerWidth - 10 - d)]);
                                c.style.minWidth = s + "px", c.style.left = p + "px"
                            } else {
                                var b = t.right - o.right,
                                    O = window.innerWidth - r.right - b,
                                    w = window.innerWidth - e.right - O,
                                    j = e.width + w,
                                    x = Math.max(j, t.width),
                                    S = me(O, [10, Math.max(10, window.innerWidth - 10 - x)]);
                                c.style.minWidth = j + "px", c.style.right = S + "px"
                            }
                            var P = m(),
                                E = window.innerHeight - 20,
                                A = v.scrollHeight,
                                C = window.getComputedStyle(f),
                                I = parseInt(C.borderTopWidth, 10),
                                N = parseInt(C.paddingTop, 10),
                                R = parseInt(C.borderBottomWidth, 10),
                                T = I + N + A + parseInt(C.paddingBottom, 10) + R,
                                k = Math.min(5 * h.offsetHeight, T),
                                D = window.getComputedStyle(v),
                                M = parseInt(D.paddingTop, 10),
                                L = parseInt(D.paddingBottom, 10),
                                _ = e.top + e.height / 2 - 10,
                                F = h.offsetHeight / 2,
                                U = I + N + (h.offsetTop + F);
                            if (U <= _) {
                                var z = P.length > 0 && h === P[P.length - 1].ref.current;
                                c.style.bottom = "0px";
                                var K = Math.max(E - _, F + (z ? L : 0) + (f.clientHeight - v.offsetTop - v.offsetHeight) + R);
                                c.style.height = U + K + "px"
                            } else {
                                var H = P.length > 0 && h === P[0].ref.current;
                                c.style.top = "0px";
                                var W = Math.max(_, I + v.offsetTop + (H ? M : 0) + F);
                                c.style.height = W + (T - U) + "px", v.scrollTop = U - _ + v.offsetTop
                            }
                            c.style.margin = "".concat(10, "px 0"), c.style.minHeight = k + "px", c.style.maxHeight = E + "px", null == n || n(), requestAnimationFrame(function() {
                                return y.current = !0
                            })
                        }
                    }, [m, a.trigger, a.valueNode, c, f, v, h, g, a.dir, n]);
                nq(function() {
                    return w()
                }, [w]);
                var j = mp(Z.useState(), 2),
                    x = j[0],
                    S = j[1];
                nq(function() {
                    f && S(window.getComputedStyle(f).zIndex)
                }, [f]);
                var P = Z.useCallback(function(e) {
                    e && !0 === b.current && (w(), null == O || O(), b.current = !1)
                }, [w, O]);
                return (0, $.jsx)(mX, {
                    scope: r,
                    contentWrapper: c,
                    shouldExpandOnScrollRef: y,
                    onScrollButtonChange: P,
                    children: (0, $.jsx)("div", {
                        ref: u,
                        style: {
                            display: "flex",
                            flexDirection: "column",
                            position: "fixed",
                            zIndex: x
                        },
                        children: (0, $.jsx)(oi.div, mf(ms({}, o), {
                            ref: p,
                            style: ms({
                                boxSizing: "border-box",
                                maxHeight: "100%"
                            }, o.style)
                        }))
                    })
                })
            });
            mB.displayName = "SelectItemAlignedPosition";
            var mV = Z.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = e.align,
                    o = e.collisionPadding,
                    a = md(e, ["__scopeSelect", "align", "collisionPadding"]),
                    i = mx(r);
                return (0, $.jsx)(pw, mf(ms({}, i, a), {
                    ref: t,
                    align: void 0 === n ? "start" : n,
                    collisionPadding: void 0 === o ? 10 : o,
                    style: ms({
                        boxSizing: "border-box"
                    }, a.style, {
                        "--radix-select-content-transform-origin": "var(--radix-popper-transform-origin)",
                        "--radix-select-content-available-width": "var(--radix-popper-available-width)",
                        "--radix-select-content-available-height": "var(--radix-popper-available-height)",
                        "--radix-select-trigger-width": "var(--radix-popper-anchor-width)",
                        "--radix-select-trigger-height": "var(--radix-popper-anchor-height)"
                    })
                }))
            });
            mV.displayName = "SelectPopperPosition";
            var mq = mp(mj(m_, {}), 2),
                mX = mq[0],
                m$ = mq[1],
                mG = "SelectViewport",
                mY = Z.forwardRef(function(e, t) {
                    var r = e.__scopeSelect,
                        n = e.nonce,
                        o = md(e, ["__scopeSelect", "nonce"]),
                        a = mK(mG, r),
                        i = m$(mG, r),
                        l = tG(t, a.onViewportChange),
                        c = Z.useRef(0);
                    return (0, $.jsxs)($.Fragment, {
                        children: [(0, $.jsx)("style", {
                            dangerouslySetInnerHTML: {
                                __html: "[data-radix-select-viewport]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}[data-radix-select-viewport]::-webkit-scrollbar{display:none}"
                            },
                            nonce: n
                        }), (0, $.jsx)(mg.Slot, {
                            scope: r,
                            children: (0, $.jsx)(oi.div, mf(ms({
                                "data-radix-select-viewport": "",
                                role: "presentation"
                            }, o), {
                                ref: l,
                                style: ms({
                                    position: "relative",
                                    flex: 1,
                                    overflow: "hidden auto"
                                }, o.style),
                                onScroll: nF(o.onScroll, function(e) {
                                    var t = e.currentTarget,
                                        r = i.contentWrapper,
                                        n = i.shouldExpandOnScrollRef;
                                    if ((null == n ? void 0 : n.current) && r) {
                                        var o = Math.abs(c.current - t.scrollTop);
                                        if (o > 0) {
                                            var a = window.innerHeight - 20,
                                                l = Math.max(parseFloat(r.style.minHeight), parseFloat(r.style.height));
                                            if (l < a) {
                                                var u = l + o,
                                                    s = Math.min(a, u),
                                                    f = u - s;
                                                r.style.height = s + "px", "0px" === r.style.bottom && (t.scrollTop = f > 0 ? f : 0, r.style.justifyContent = "flex-end")
                                            }
                                        }
                                    }
                                    c.current = t.scrollTop
                                })
                            }))
                        })]
                    })
                });
            mY.displayName = mG;
            var mQ = "SelectGroup",
                mZ = mp(mj(mQ), 2),
                mJ = mZ[0],
                m0 = mZ[1];
            Z.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = md(e, ["__scopeSelect"]),
                    o = nY();
                return (0, $.jsx)(mJ, {
                    scope: r,
                    id: o,
                    children: (0, $.jsx)(oi.div, mf(ms({
                        role: "group",
                        "aria-labelledby": o
                    }, n), {
                        ref: t
                    }))
                })
            }).displayName = mQ;
            var m1 = "SelectLabel";
            Z.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = md(e, ["__scopeSelect"]),
                    o = m0(m1, r);
                return (0, $.jsx)(oi.div, mf(ms({
                    id: o.id
                }, n), {
                    ref: t
                }))
            }).displayName = m1;
            var m2 = "SelectItem",
                m8 = mp(mj(m2), 2),
                m3 = m8[0],
                m6 = m8[1],
                m4 = Z.forwardRef(function(e, t) {
                    var r = e.__scopeSelect,
                        n = e.value,
                        o = e.disabled,
                        a = void 0 !== o && o,
                        i = e.textValue,
                        l = md(e, ["__scopeSelect", "value", "disabled", "textValue"]),
                        c = mE(m2, r),
                        u = mK(m2, r),
                        s = c.value === n,
                        f = mp(Z.useState(null != i ? i : ""), 2),
                        d = f[0],
                        p = f[1],
                        m = mp(Z.useState(!1), 2),
                        y = m[0],
                        b = m[1],
                        v = tG(t, function(e) {
                            var t;
                            return null == (t = u.itemRefCallback) ? void 0 : t.call(u, e, n, a)
                        }),
                        h = nY(),
                        g = Z.useRef("touch"),
                        O = function() {
                            a || (c.onValueChange(n), c.onOpenChange(!1))
                        };
                    if ("" === n) throw Error("A <Select.Item /> must have a value prop that is not an empty string. This is because the Select value can be set to an empty string to clear the selection and show the placeholder.");
                    return (0, $.jsx)(m3, {
                        scope: r,
                        value: n,
                        disabled: a,
                        textId: h,
                        isSelected: s,
                        onItemTextChange: Z.useCallback(function(e) {
                            p(function(t) {
                                var r;
                                return t || (null != (r = null == e ? void 0 : e.textContent) ? r : "").trim()
                            })
                        }, []),
                        children: (0, $.jsx)(mg.ItemSlot, {
                            scope: r,
                            value: n,
                            disabled: a,
                            textValue: d,
                            children: (0, $.jsx)(oi.div, mf(ms({
                                role: "option",
                                "aria-labelledby": h,
                                "data-highlighted": y ? "" : void 0,
                                "aria-selected": s && y,
                                "data-state": s ? "checked" : "unchecked",
                                "aria-disabled": a || void 0,
                                "data-disabled": a ? "" : void 0,
                                tabIndex: a ? void 0 : -1
                            }, l), {
                                ref: v,
                                onFocus: nF(l.onFocus, function() {
                                    return b(!0)
                                }),
                                onBlur: nF(l.onBlur, function() {
                                    return b(!1)
                                }),
                                onClick: nF(l.onClick, function() {
                                    "mouse" !== g.current && O()
                                }),
                                onPointerUp: nF(l.onPointerUp, function() {
                                    "mouse" === g.current && O()
                                }),
                                onPointerDown: nF(l.onPointerDown, function(e) {
                                    g.current = e.pointerType
                                }),
                                onPointerMove: nF(l.onPointerMove, function(e) {
                                    if (g.current = e.pointerType, a) {
                                        var t;
                                        null == (t = u.onItemLeave) || t.call(u)
                                    } else "mouse" === g.current && e.currentTarget.focus({
                                        preventScroll: !0
                                    })
                                }),
                                onPointerLeave: nF(l.onPointerLeave, function(e) {
                                    if (e.currentTarget === document.activeElement) {
                                        var t;
                                        null == (t = u.onItemLeave) || t.call(u)
                                    }
                                }),
                                onKeyDown: nF(l.onKeyDown, function(e) {
                                    var t;
                                    ((null == (t = u.searchRef) ? void 0 : t.current) === "" || " " !== e.key) && (mb.includes(e.key) && O(), " " === e.key && e.preventDefault())
                                })
                            }))
                        })
                    })
                });
            m4.displayName = m2;
            var m5 = "SelectItemText",
                m7 = Z.forwardRef(function(e, t) {
                    var r = e.__scopeSelect,
                        n = (e.className, e.style, md(e, ["__scopeSelect", "className", "style"])),
                        o = mE(m5, r),
                        a = mK(m5, r),
                        i = m6(m5, r),
                        l = mI(m5, r),
                        c = mp(Z.useState(null), 2),
                        u = c[0],
                        s = c[1],
                        f = tG(t, function(e) {
                            return s(e)
                        }, i.onItemTextChange, function(e) {
                            var t;
                            return null == (t = a.itemTextRefCallback) ? void 0 : t.call(a, e, i.value, i.disabled)
                        }),
                        d = null == u ? void 0 : u.textContent,
                        p = Z.useMemo(function() {
                            return (0, $.jsx)("option", {
                                value: i.value,
                                disabled: i.disabled,
                                children: d
                            }, i.value)
                        }, [i.disabled, i.value, d]),
                        m = l.onNativeOptionAdd,
                        y = l.onNativeOptionRemove;
                    return nq(function() {
                        return m(p),
                            function() {
                                return y(p)
                            }
                    }, [m, y, p]), (0, $.jsxs)($.Fragment, {
                        children: [(0, $.jsx)(oi.span, mf(ms({
                            id: i.textId
                        }, n), {
                            ref: f
                        })), i.isSelected && o.valueNode && !o.valueNodeHasChildren ? n8.createPortal(n.children, o.valueNode) : null]
                    })
                });
            m7.displayName = m5;
            var m9 = "SelectItemIndicator";
            Z.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = md(e, ["__scopeSelect"]);
                return m6(m9, r).isSelected ? (0, $.jsx)(oi.span, mf(ms({
                    "aria-hidden": !0
                }, n), {
                    ref: t
                })) : null
            }).displayName = m9;
            var ye = "SelectScrollUpButton";
            Z.forwardRef(function(e, t) {
                var r = mK(ye, e.__scopeSelect),
                    n = m$(ye, e.__scopeSelect),
                    o = mp(Z.useState(!1), 2),
                    a = o[0],
                    i = o[1],
                    l = tG(t, n.onScrollButtonChange);
                return nq(function() {
                    if (r.viewport && r.isPositioned) {
                        var e = function() {
                                i(t.scrollTop > 0)
                            },
                            t = r.viewport;
                        return e(), t.addEventListener("scroll", e),
                            function() {
                                return t.removeEventListener("scroll", e)
                            }
                    }
                }, [r.viewport, r.isPositioned]), a ? (0, $.jsx)(yr, mf(ms({}, e), {
                    ref: l,
                    onAutoScroll: function() {
                        var e = r.viewport,
                            t = r.selectedItem;
                        e && t && (e.scrollTop = e.scrollTop - t.offsetHeight)
                    }
                })) : null
            }).displayName = ye;
            var yt = "SelectScrollDownButton";
            Z.forwardRef(function(e, t) {
                var r = mK(yt, e.__scopeSelect),
                    n = m$(yt, e.__scopeSelect),
                    o = mp(Z.useState(!1), 2),
                    a = o[0],
                    i = o[1],
                    l = tG(t, n.onScrollButtonChange);
                return nq(function() {
                    if (r.viewport && r.isPositioned) {
                        var e = function() {
                                var e = t.scrollHeight - t.clientHeight;
                                i(Math.ceil(t.scrollTop) < e)
                            },
                            t = r.viewport;
                        return e(), t.addEventListener("scroll", e),
                            function() {
                                return t.removeEventListener("scroll", e)
                            }
                    }
                }, [r.viewport, r.isPositioned]), a ? (0, $.jsx)(yr, mf(ms({}, e), {
                    ref: l,
                    onAutoScroll: function() {
                        var e = r.viewport,
                            t = r.selectedItem;
                        e && t && (e.scrollTop = e.scrollTop + t.offsetHeight)
                    }
                })) : null
            }).displayName = yt;
            var yr = Z.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = e.onAutoScroll,
                    o = md(e, ["__scopeSelect", "onAutoScroll"]),
                    a = mK("SelectScrollButton", r),
                    i = Z.useRef(null),
                    l = mO(r),
                    c = Z.useCallback(function() {
                        null !== i.current && (window.clearInterval(i.current), i.current = null)
                    }, []);
                return Z.useEffect(function() {
                    return function() {
                        return c()
                    }
                }, [c]), nq(function() {
                    var e, t = l().find(function(e) {
                        return e.ref.current === document.activeElement
                    });
                    null == t || null == (e = t.ref.current) || e.scrollIntoView({
                        block: "nearest"
                    })
                }, [l]), (0, $.jsx)(oi.div, mf(ms({
                    "aria-hidden": !0
                }, o), {
                    ref: t,
                    style: ms({
                        flexShrink: 0
                    }, o.style),
                    onPointerDown: nF(o.onPointerDown, function() {
                        null === i.current && (i.current = window.setInterval(n, 50))
                    }),
                    onPointerMove: nF(o.onPointerMove, function() {
                        var e;
                        null == (e = a.onItemLeave) || e.call(a), null === i.current && (i.current = window.setInterval(n, 50))
                    }),
                    onPointerLeave: nF(o.onPointerLeave, function() {
                        c()
                    })
                }))
            });
            Z.forwardRef(function(e, t) {
                e.__scopeSelect;
                var r = md(e, ["__scopeSelect"]);
                return (0, $.jsx)(oi.div, mf(ms({
                    "aria-hidden": !0
                }, r), {
                    ref: t
                }))
            }).displayName = "SelectSeparator";
            var yn = "SelectArrow";

            function yo(e) {
                return "" === e || void 0 === e
            }
            Z.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = md(e, ["__scopeSelect"]),
                    o = mx(r),
                    a = mE(yn, r),
                    i = mK(yn, r);
                return a.open && "popper" === i.position ? (0, $.jsx)(pS, mf(ms({}, o, n), {
                    ref: t
                })) : null
            }).displayName = yn;
            var ya = Z.forwardRef(function(e, t) {
                var r = e.value,
                    n = md(e, ["value"]),
                    o = Z.useRef(null),
                    a = tG(t, o),
                    i = fw(r);
                return Z.useEffect(function() {
                    var e = o.current,
                        t = Object.getOwnPropertyDescriptor(window.HTMLSelectElement.prototype, "value").set;
                    if (i !== r && t) {
                        var n = new Event("change", {
                            bubbles: !0
                        });
                        t.call(e, r), e.dispatchEvent(n)
                    }
                }, [i, r]), (0, $.jsx)(mi, {
                    asChild: !0,
                    children: (0, $.jsx)("select", mf(ms({}, n), {
                        ref: a,
                        defaultValue: r
                    }))
                })
            });

            function yi(e) {
                var t = nZ(e),
                    r = Z.useRef(""),
                    n = Z.useRef(0),
                    o = Z.useCallback(function(e) {
                        var o = r.current + e;
                        t(o),
                            function e(t) {
                                r.current = t, window.clearTimeout(n.current), "" !== t && (n.current = window.setTimeout(function() {
                                    return e("")
                                }, 1e3))
                            }(o)
                    }, [t]),
                    a = Z.useCallback(function() {
                        r.current = "", window.clearTimeout(n.current)
                    }, []);
                return Z.useEffect(function() {
                    return function() {
                        return window.clearTimeout(n.current)
                    }
                }, []), [r, o, a]
            }

            function yl(e, t, r) {
                var n, o, a = t.length > 1 && Array.from(t).every(function(e) {
                        return e === t[0]
                    }) ? t[0] : t,
                    i = r ? e.indexOf(r) : -1,
                    l = (n = e, o = Math.max(i, 0), n.map(function(e, t) {
                        return n[(o + t) % n.length]
                    }));
                1 === a.length && (l = l.filter(function(e) {
                    return e !== r
                }));
                var c = l.find(function(e) {
                    return e.textValue.toLowerCase().startsWith(a.toLowerCase())
                });
                return c !== r ? c : void 0
            }
            ya.displayName = "BubbleSelect";
            var yc = (0, Z.createContext)(null),
                yu = {
                    XSmall: "size-300",
                    Small: "size-400",
                    Medium: "size-500",
                    Large: "size-600"
                },
                ys = {
                    XSmall: "padding-x-medium",
                    Small: "padding-x-medium",
                    Medium: "padding-x-medium",
                    Large: "padding-x-large"
                },
                yf = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium",
                    Large: "text-title-large"
                },
                yd = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                yp = {
                    XSmall: "gap-xsmall",
                    Small: "gap-small",
                    Medium: "gap-small",
                    Large: "gap-small"
                },
                ym = {
                    XSmall: "radius-small",
                    Small: "radius-medium",
                    Medium: "radius-medium",
                    Large: "radius-medium"
                },
                yy = {
                    XSmall: "height-600",
                    Small: "height-800",
                    Medium: "height-1000",
                    Large: "height-1200"
                };

            function yb(e) {
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

            function yv(e, t) {
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

            function yh(e, t) {
                if (null == e) return {};
                var r, n, o, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }(0, Z.forwardRef)(function(e, t) {
                var r = e.label,
                    n = e.labelTooltip,
                    o = e.ariaLabelledBy,
                    a = e.ariaLabel,
                    i = e.className,
                    l = e.size,
                    c = e.variant,
                    u = void 0 === c ? "Standard" : c,
                    s = e.value,
                    f = e.placeholder,
                    d = e.isDisabled,
                    p = e.hasError,
                    m = e.hint,
                    y = e.onValueChange,
                    b = e.onOpenChange,
                    v = e.children,
                    h = sK(),
                    g = (0, Z.useMemo)(function() {
                        return {
                            size: l
                        }
                    }, [l]),
                    O = r ? J().createElement("span", {
                        id: h,
                        className: tH(yf[l], "content-emphasis")
                    }, r) : null;
                return J().createElement(yc.Provider, {
                    value: g
                }, J().createElement("div", {
                    className: tH("flex flex-col", d && ["opacity-[0.5]", "pointer-events-none"], yp[l], i)
                }, O && (n ? J().createElement("div", {
                    className: "flex items-center gap-xsmall"
                }, O, J().createElement(sH, n)) : O), J().createElement(mN, {
                    value: s,
                    disabled: d,
                    onValueChange: y,
                    onOpenChange: b
                }, J().createElement(mT, {
                    className: tH("relative clip group/interactable outline-none", "foundation-web-input flex items-center justify-between width-full cursor-pointer", p5[u], p7[u], ym[l], yy[l], ys[l], yd[l], p ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", void 0 === s ? "content-muted" : "content-default"),
                    ref: t,
                    "aria-labelledby": r ? h : o,
                    "aria-label": a
                }, J().createElement(tB, null), J().createElement("div", {
                    className: "grow-1 text-truncate-split text-align-x-left"
                }, J().createElement(mD, {
                    placeholder: f
                })), J().createElement(mM, {
                    className: tH(yu[l], "icon icon-regular-chevron-large-down content-default")
                })), J().createElement(mL, null, J().createElement(mF, {
                    position: "popper",
                    className: "padding-y-small foundation-web-portal-zindex",
                    style: {
                        maxHeight: "var(--radix-select-content-available-height)"
                    }
                }, v))), m && J().createElement("span", {
                    className: tH("text-caption-small", {
                        "content-system-alert": p,
                        "content-default": !p
                    })
                }, m)))
            }).displayName = "Dropdown";
            var yg = {
                    XSmall: "radius-medium",
                    Small: "radius-large",
                    Medium: "radius-large",
                    Large: "radius-large"
                },
                yO = {
                    XSmall: "padding-xsmall",
                    Small: "padding-small",
                    Medium: "padding-small",
                    Large: "padding-small"
                },
                yw = {
                    XSmall: "padding-x-medium",
                    Small: "padding-x-medium",
                    Medium: "padding-x-medium",
                    Large: "padding-x-large"
                },
                yj = {
                    XSmall: "padding-y-xsmall",
                    Small: "padding-y-small",
                    Medium: "padding-y-small",
                    Large: "padding-y-medium"
                },
                yx = {
                    XSmall: "gap-x-medium",
                    Small: "gap-x-medium",
                    Medium: "gap-x-medium",
                    Large: "gap-x-large"
                },
                yS = {
                    XSmall: "gap-y-xxsmall",
                    Small: "gap-y-xxsmall",
                    Medium: "gap-y-xsmall",
                    Large: "gap-y-xsmall"
                },
                yP = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                yE = {
                    XSmall: "radius-small",
                    Small: "radius-medium",
                    Medium: "radius-medium",
                    Large: "radius-medium"
                },
                yA = (0, Z.createContext)(null),
                yC = function() {
                    var e = (0, Z.useContext)(yA);
                    if (!e) throw Error("Menu components must be used within a Menu");
                    return e
                },
                yI = function(e) {
                    var t, r = e.children,
                        n = e.className,
                        o = e.size,
                        a = (0, Z.useContext)(yc),
                        i = a ? "dropdown" : "standalone",
                        l = null != (t = null != o ? o : null == a ? void 0 : a.size) ? t : "Medium",
                        c = (0, Z.useMemo)(function() {
                            return {
                                size: l,
                                mode: i
                            }
                        }, [l, i]),
                        u = tH("foundation-web-menu bg-surface-100 stroke-standard stroke-default shadow-transient-high", yg[l], n),
                        s = "standalone" === i ? J().createElement(fp, {
                            asChild: !0,
                            orientation: "vertical",
                            loop: !0
                        }, J().createElement("div", {
                            role: "menu",
                            tabIndex: -1,
                            className: u
                        }, r)) : J().createElement("div", {
                            className: u
                        }, r);
                    return J().createElement(yA.Provider, {
                        value: c
                    }, "dropdown" === i ? J().createElement(mY, {
                        asChild: !0,
                        style: {
                            width: "var(--radix-popper-anchor-width)"
                        }
                    }, s) : s)
                },
                yN = function(e) {
                    var t = e.children,
                        r = e.className,
                        n = yC().size;
                    return J().createElement("div", {
                        role: "group",
                        className: tH(yO[n], r)
                    }, t)
                },
                yR = function(e) {
                    var t, r = e.value,
                        n = e.leading,
                        o = e.title,
                        a = e.description,
                        i = e.trailing,
                        l = e.disabled,
                        c = e.className,
                        u = e.onSelect,
                        s = e.asChild,
                        f = e.children,
                        d = yh(e, ["value", "leading", "title", "description", "trailing", "disabled", "className", "onSelect", "asChild", "children"]),
                        p = yC(),
                        m = p.size,
                        y = p.mode,
                        b = tH(tW, "foundation-web-menu-item flex items-center content-default text-truncate-split focus-visible:hover:outline-none cursor-pointer stroke-none bg-none text-align-x-left width-full", yP[m], yw[m], yj[m], yx[m], yE[m], l && "opacity-[0.5]", l && "pointer-events-none", c),
                        v = J().createElement("span", {
                            className: "foundation-web-menu-item-title text-no-wrap text-truncate-split content-emphasis"
                        }, o);
                    switch (y) {
                        case "dropdown":
                            v = J().createElement(m7, {
                                asChild: !0
                            }, v);
                            break;
                        case "standalone":
                            break;
                        default:
                            console.error("Invalid menu mode:", y)
                    }
                    var h = J().createElement(J().Fragment, null, !l && J().createElement(tB, null), n, J().createElement("div", {
                        className: tH("grow-1 text-truncate-split flex flex-col", yS[m])
                    }, v, a && J().createElement("div", {
                        className: "foundation-web-menu-item-description content-muted"
                    }, a)), i);
                    if (s) {
                        d.as;
                        var g = yh(d, ["as"]),
                            O = J().Children.only(f),
                            w = void 0 === o && O.props.children;
                        t = J().createElement(t6, yv(yb({}, g), {
                            role: "standalone" === y ? "menuitem" : void 0,
                            "aria-disabled": l || void 0,
                            className: b,
                            style: {
                                outlineOffset: 0
                            },
                            onClick: l ? void 0 : u
                        }), w ? J().cloneElement(O, {}, J().createElement(J().Fragment, null, !l && J().createElement(tB, null), O.props.children)) : J().cloneElement(O, {}, h))
                    } else if ("a" === d.as) {
                        d.as;
                        var j = d.href,
                            x = yh(d, ["as", "href"]);
                        t = J().createElement("a", yv(yb({}, x), {
                            role: "standalone" === y ? "menuitem" : void 0,
                            "aria-disabled": l,
                            href: l ? void 0 : j,
                            className: b,
                            style: {
                                outlineOffset: 0,
                                textDecoration: "none"
                            },
                            onClick: l ? void 0 : u
                        }), h)
                    } else {
                        d.as;
                        var S = yh(d, ["as"]);
                        t = J().createElement("button", yv(yb({
                            type: "button"
                        }, S), {
                            role: "standalone" === y ? "menuitem" : void 0,
                            "aria-disabled": l,
                            className: b,
                            style: {
                                outlineOffset: 0
                            },
                            onClick: l ? void 0 : u
                        }), h)
                    }
                    return "dropdown" === y ? J().createElement(m4, {
                        value: r,
                        disabled: l,
                        asChild: !0
                    }, t) : J().createElement(fb, {
                        asChild: !0,
                        focusable: !0,
                        tabStopId: r
                    }, t)
                };

            function yT(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var yk = function(e) {
                    var t, r, n = e.options,
                        o = e.value,
                        a = e.onSelect,
                        i = e.ariaLabel,
                        l = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, Z.useState)(!1)) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(t) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return yT(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return yT(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        c = l[0],
                        u = l[1],
                        s = n.find(function(e) {
                            return e.value === o
                        });
                    return (0, $.jsxs)(p3, {
                        open: c,
                        onOpenChange: u,
                        children: [(0, $.jsx)(p6, {
                            asChild: !0,
                            children: (0, $.jsx)(r5, {
                                className: "filter-dropdown-chip",
                                text: null != (r = null == s ? void 0 : s.label) ? r : "",
                                size: "Medium",
                                trailingIconName: "icon-filled-chevron-large-down",
                                isChecked: c,
                                onCheckedChange: u
                            })
                        }), (0, $.jsx)(p4, {
                            align: "start",
                            ariaLabel: i,
                            className: "filter-dropdown-menu",
                            children: (0, $.jsx)(yI, {
                                size: "Medium",
                                children: (0, $.jsx)(yN, {
                                    children: n.map(function(e) {
                                        return (0, $.jsx)(yR, {
                                            value: e.value,
                                            title: e.label,
                                            trailing: e.value === o ? (0, $.jsx)(rH, {
                                                name: "icon-filled-check",
                                                size: "Small"
                                            }) : void 0,
                                            onSelect: function() {
                                                u(!1), a(e.value)
                                            }
                                        }, e.value)
                                    })
                                })
                            })
                        })]
                    })
                },
                yD = function(e) {
                    var t = e.item,
                        r = e.selected,
                        n = e.unavailable,
                        o = e.onClick,
                        a = (0, Q.useTranslation)().translate,
                        i = function() {
                            o(t)
                        },
                        l = n ? (0, $.jsxs)("div", {
                            className: "item-card-equipped",
                            children: [r && (0, $.jsx)("span", {
                                className: "icon-check-selection"
                            }), t.isOnHold && (0, $.jsxs)("div", {
                                className: "item-card-holding",
                                children: [(0, $.jsx)("div", {
                                    className: "icon-uiblox-pending"
                                }), (0, $.jsx)("div", {
                                    className: "item-card-holding-label font-header-2",
                                    children: a("Label.Holding")
                                })]
                            })]
                        }) : null;
                    return (0, $.jsx)("div", {
                        className: "trade-inventory-card".concat(n ? " is-unavailable" : ""),
                        role: "button",
                        tabIndex: 0,
                        "aria-pressed": r,
                        onClickCapture: function(e) {
                            e.target.closest(".item-card-thumb-container") && (e.preventDefault(), e.stopPropagation(), i())
                        },
                        onKeyDown: function(e) {
                            ("Enter" === e.key || " " === e.key) && (e.preventDefault(), i())
                        },
                        children: (0, $.jsx)(uU, {
                            item: t,
                            overlay: l
                        })
                    })
                };

            function yM(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function yL(e) {
                if (Array.isArray(e)) return e
            }

            function y_(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function yF() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function yU(e, t) {
                if (e) {
                    if ("string" == typeof e) return yM(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return yM(e, t)
                }
            }
            var yz = {
                    XSmall: "padding-x-small",
                    Small: "padding-x-medium",
                    Medium: "padding-x-medium",
                    Large: "padding-x-medium"
                },
                yK = {
                    XSmall: "gap-x-xsmall",
                    Small: "gap-x-small",
                    Medium: "gap-x-small",
                    Large: "gap-x-small"
                },
                yH = {
                    XSmall: "height-600",
                    Small: "height-800",
                    Medium: "height-1000",
                    Large: "height-1200"
                },
                yW = {
                    Rounded: {
                        XSmall: "radius-small",
                        Small: "radius-medium",
                        Medium: "radius-medium",
                        Large: "radius-medium"
                    },
                    Pill: {
                        XSmall: "radius-circle",
                        Small: "radius-circle",
                        Medium: "radius-circle",
                        Large: "radius-circle"
                    },
                    Square: {
                        XSmall: "radius-none",
                        Small: "radius-none",
                        Medium: "radius-none",
                        Large: "radius-none"
                    }
                },
                yB = {
                    XSmall: ["text-body-small", "placeholder:text-body-small"],
                    Small: ["text-body-small", "placeholder:text-body-small"],
                    Medium: ["text-body-medium", "placeholder:text-body-medium"],
                    Large: ["text-body-large", "placeholder:text-body-large"]
                },
                yV = "Large",
                yq = (0, Z.forwardRef)(function(e, t) {
                    var r, n = yL(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || yU(r) || yF(),
                        o = n[0],
                        a = n.slice(1),
                        i = o.label,
                        l = o.leadingIconName,
                        c = o.trailingIconName,
                        u = o.leadingIconNode,
                        s = o.trailingIconNode,
                        f = o.hasError,
                        d = o.error,
                        p = o.helperText,
                        m = o.size,
                        y = void 0 === m ? yV : m,
                        b = o.variant,
                        v = void 0 === b ? "Standard" : b,
                        h = o.shape,
                        g = o.isRequired,
                        O = o.isDisabled,
                        w = o.className,
                        j = o.style,
                        x = o.inputContainerClassName,
                        S = o.inputContainerStyle,
                        P = o.id,
                        E = o.placeholder,
                        A = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(o, ["label", "leadingIconName", "trailingIconName", "leadingIconNode", "trailingIconNode", "hasError", "error", "helperText", "size", "variant", "shape", "isRequired", "isDisabled", "className", "style", "inputContainerClassName", "inputContainerStyle", "id", "placeholder"]),
                        C = (yL(a) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(a) || yU(a, 1) || yF())[0],
                        I = sK(),
                        N = P || I,
                        R = "".concat(N, "-description"),
                        T = null != y ? y : yV,
                        k = f || !!d,
                        D = d || p,
                        M = null != l ? l : void 0 === u ? "icon-regular-magnifying-glass" : void 0,
                        L = (0, Z.useMemo)(function() {
                            return M ? J().createElement(rH, {
                                name: M,
                                size: T,
                                className: "content-emphasis",
                                "data-testid": "search-input-leading-icon"
                            }) : u
                        }, [M, u, T]),
                        _ = (0, Z.useMemo)(function() {
                            return c ? J().createElement(rH, {
                                name: c,
                                size: T,
                                className: "content-emphasis",
                                "data-testid": "search-input-trailing-icon"
                            }) : s
                        }, [T, c, s]);
                    return J().createElement("div", {
                        "data-testid": "search-input-wrapper",
                        className: tH("flex width-full flex-col gap-small", w, y_({}, tV, O)),
                        style: j
                    }, i && J().createElement("label", {
                        htmlFor: N,
                        className: tH("text-title-small content-emphasis")
                    }, i, g && J().createElement(J().Fragment, null, " ", J().createElement("span", {
                        className: "content-default"
                    }, "*"))), J().createElement("div", {
                        "data-testid": "search-input-container",
                        className: tH("foundation-web-input flex items-center width-full", !O && "relative clip group/interactable focus-visible:outline-focus disabled:outline-none", p7[v], p5[v], x, yH[T], yW[void 0 === h ? "Rounded" : h][T], yz[T], yK[T], k ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis"),
                        style: S
                    }, J().createElement(tB, {
                        className: "pointer-events-none"
                    }), L && J().createElement("div", {
                        className: "flex shrink-0 items-center"
                    }, L), J().createElement("input", function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var r = null != arguments[t] ? arguments[t] : {},
                                n = Object.keys(r);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(r, e).enumerable
                            }))), n.forEach(function(t) {
                                y_(e, t, r[t])
                            })
                        }
                        return e
                    }({
                        type: "search",
                        id: N,
                        ref: C,
                        placeholder: void 0 === E ? "Search" : E,
                        className: tH("width-full min-width-0 padding-none bg-none stroke-none outline-none content-emphasis placeholder:content-muted [appearance:none]", yB[T], "[&::-webkit-search-cancel-button]:hidden [&::-webkit-search-decoration]:hidden [&::-webkit-search-results-button]:hidden [&::-webkit-search-results-decoration]:hidden"),
                        "aria-invalid": k,
                        "aria-describedby": D ? R : void 0,
                        required: g,
                        disabled: O
                    }, A)), _ && J().createElement("div", {
                        className: "flex shrink-0 items-center",
                        "data-testid": "search-input-trailing-accessory"
                    }, _)), D && J().createElement("span", {
                        id: R,
                        className: tH("text-caption-small", {
                            "content-system-alert": k,
                            "content-default": !k
                        })
                    }, D))
                });
            yq.displayName = "SearchInput";
            var yX = function(e) {
                var t = e.isOpen,
                    r = e.value,
                    n = e.onChange,
                    o = e.onOpen,
                    a = e.onClose,
                    i = (0, Q.useTranslation)().translate,
                    l = (0, Z.useRef)(null),
                    c = i("Label.Search"),
                    u = i("Action.Close");
                (0, Z.useEffect)(function() {
                    if (t) {
                        var e;
                        null == (e = l.current) || e.focus()
                    }
                }, [t]);
                var s = function() {
                    n(""), a()
                };
                return (0, $.jsx)("div", {
                    className: "inventory-search".concat(t ? " is-open" : ""),
                    children: t ? (0, $.jsx)(yq, {
                        ref: l,
                        size: "Medium",
                        name: "inventory-search",
                        value: r,
                        placeholder: c,
                        maxLength: ep.inventorySearchMaxLength,
                        autoComplete: "off",
                        "aria-label": c,
                        trailingIconNode: (0, $.jsx)(rp, {
                            className: "inventory-search-clear",
                            icon: "icon-regular-x",
                            ariaLabel: u,
                            variant: "Utility",
                            size: "XSmall",
                            isCircular: !0,
                            onClick: s
                        }),
                        onChange: function(e) {
                            n(e.target.value)
                        },
                        onKeyDown: function(e) {
                            "Escape" === e.key && (e.preventDefault(), s())
                        }
                    }) : (0, $.jsx)(rp, {
                        className: "inventory-search-toggle",
                        icon: "icon-regular-magnifying-glass",
                        ariaLabel: c,
                        variant: "Utility",
                        size: "Small",
                        isCircular: !0,
                        onClick: o
                    })
                })
            };

            function y$(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var yG = function(e) {
                var t, r, n = e.user,
                    o = e.onItemClick,
                    a = e.isItemInOffers,
                    i = e.isItemUnavailable,
                    l = (0, Q.useTranslation)().translate,
                    c = d7(n.id),
                    u = n.id === (null == (r = (0, eu.authenticatedUser)()) ? void 0 : r.id),
                    s = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = (0, Z.useState)(!1)) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                a = !0,
                                i = !1;
                            try {
                                for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                            } catch (e) {
                                i = !0, r = e
                            } finally {
                                try {
                                    a || null == n.return || n.return()
                                } finally {
                                    if (i) throw r
                                }
                            }
                            return o
                        }
                    }(t) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return y$(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return y$(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    f = s[0],
                    d = s[1],
                    p = (0, Z.useMemo)(function() {
                        return ep.inventoryFilters.map(function(e) {
                            return {
                                value: e.value,
                                label: l(e.labelKey)
                            }
                        })
                    }, [l]),
                    m = u ? l("Label.YourInventory") : l("Label.TheirInventory", {
                        username: n.displayName
                    }),
                    y = !c.loading && !c.loadFailed && 0 === c.items.length;
                return (0, $.jsxs)("div", {
                    className: "col-xs-12 trade-inventory-panel",
                    children: [(0, $.jsx)("div", {
                        className: "row inventory-panel-header",
                        children: (0, $.jsx)("h2", {
                            className: "inventory-label paired-name",
                            children: m
                        })
                    }), (0, $.jsxs)("div", {
                        className: "inventory-filter-row",
                        children: [(0, $.jsx)(yk, {
                            options: p,
                            value: c.filter,
                            onSelect: function(e) {
                                c.setFilter(e), tc(e9, "switchAccessoryType", {
                                    type: e || null
                                }), tu(to, "switchAccessoryType", {
                                    filterType: "inventoryCategory",
                                    value: e || null
                                })
                            },
                            ariaLabel: l("Label.Category")
                        }), (0, $.jsx)(yX, {
                            isOpen: f,
                            value: c.search,
                            onChange: c.setSearch,
                            onOpen: function() {
                                d(!0)
                            },
                            onClose: function() {
                                d(!1)
                            }
                        })]
                    }), (0, $.jsxs)("div", {
                        children: [(0, $.jsx)("ul", {
                            className: "hlist item-cards item-cards-stackable",
                            children: c.items.map(function(e) {
                                return (0, $.jsx)("li", {
                                    className: "list-item item-card trade-item-card",
                                    children: (0, $.jsx)(yD, {
                                        item: e,
                                        selected: a(e),
                                        unavailable: i(e),
                                        onClick: o
                                    })
                                }, e.id)
                            })
                        }), c.loading && (0, $.jsx)("div", {
                            className: "flex justify-center margin-y-small",
                            children: (0, $.jsx)(rg, {
                                ariaLabel: l("Label.Loading", void 0, "Loading"),
                                size: "Medium",
                                variant: "Indeterminate"
                            })
                        }), !c.loading && c.loadFailed && (0, $.jsx)("div", {
                            className: "col-xs-12 container-empty",
                            children: l("Error.TradeUnknownError")
                        }), y && ("" !== c.appliedSearch ? (0, $.jsx)("div", {
                            className: "col-xs-12 container-empty",
                            children: l("Label.NoResultsFound", void 0, "No results found")
                        }) : u ? "" !== c.filter ? (0, $.jsx)("div", {
                            className: "col-xs-12 container-empty",
                            children: l("Label.YourInventoryEmpty")
                        }) : (0, $.jsx)(ss, {
                            className: "trade-inventory-empty-state",
                            title: l("Label.YouHaveNoRobloxLimiteds"),
                            subtitle: l("Label.ShopForMoreToStartTrading")
                        }) : (0, $.jsx)("div", {
                            className: "col-xs-12 container-empty",
                            children: l("Label.TheirInventoryEmpty")
                        })), (c.hasPrev || c.hasNext) && (0, $.jsxs)("div", {
                            className: "trade-inventory-pager",
                            children: [(0, $.jsx)(rp, {
                                icon: "icon-regular-chevron-small-left",
                                variant: "Utility",
                                size: "Small",
                                isCircular: !0,
                                isDisabled: !c.hasPrev || c.loading,
                                ariaLabel: l("Action.Back"),
                                onClick: c.loadPrev
                            }), (0, $.jsx)("span", {
                                className: "trade-inventory-pager-label",
                                children: l("Label.CurrentPage", {
                                    currentPage: c.page
                                })
                            }), (0, $.jsx)(rp, {
                                icon: "icon-regular-chevron-small-right",
                                variant: "Utility",
                                size: "Small",
                                isCircular: !0,
                                isDisabled: !c.hasNext || c.loading,
                                ariaLabel: l("Action.Next"),
                                onClick: function() {
                                    tc(e9, "inventoryPage"), c.loadNext()
                                }
                            })]
                        })]
                    })]
                })
            };

            function yY(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function yQ(e) {
                if (Array.isArray(e)) return e
            }

            function yZ(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function yJ() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function y0(e, t) {
                if (e) {
                    if ("string" == typeof e) return yY(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return yY(e, t)
                }
            }
            var y1 = {
                    XSmall: "padding-x-small",
                    Small: "padding-x-medium",
                    Medium: "padding-x-medium",
                    Large: "padding-x-medium"
                },
                y2 = {
                    XSmall: "gap-x-xsmall",
                    Small: "gap-x-small",
                    Medium: "gap-x-small",
                    Large: "gap-x-small"
                },
                y8 = {
                    XSmall: "height-600",
                    Small: "height-800",
                    Medium: "height-1000",
                    Large: "height-1200"
                },
                y3 = {
                    XSmall: "radius-small",
                    Small: "radius-medium",
                    Medium: "radius-medium",
                    Large: "radius-medium"
                },
                y6 = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium",
                    Large: "text-title-large"
                },
                y4 = {
                    XSmall: ["text-body-small", "placeholder:text-body-small"],
                    Small: ["text-body-small", "placeholder:text-body-small"],
                    Medium: ["text-body-medium", "placeholder:text-body-medium"],
                    Large: ["text-body-large", "placeholder:text-body-large"]
                },
                y5 = (0, Z.forwardRef)(function(e, t) {
                    var r, n, o, a = yQ(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || y0(r) || yJ(),
                        i = a[0],
                        l = a.slice(1),
                        c = i.label,
                        u = i.labelTooltip,
                        s = i.leadingIconName,
                        f = i.trailingIconName,
                        d = i.leadingIconNode,
                        p = i.trailingIconNode,
                        m = i.hasError,
                        y = i.error,
                        b = i.helperText,
                        v = i.size,
                        h = i.variant,
                        g = void 0 === h ? "Standard" : h,
                        O = i.isRequired,
                        w = i.isDisabled,
                        j = i.className,
                        x = i.style,
                        S = i.inputContainerClassName,
                        P = i.inputContainerClassStyle,
                        E = i.id,
                        A = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(i, ["label", "labelTooltip", "leadingIconName", "trailingIconName", "leadingIconNode", "trailingIconNode", "hasError", "error", "helperText", "size", "variant", "isRequired", "isDisabled", "className", "style", "inputContainerClassName", "inputContainerClassStyle", "id"]),
                        C = (yQ(l) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(l) || y0(l, 1) || yJ())[0],
                        I = sK(),
                        N = E || I,
                        R = "".concat(N, "-description"),
                        T = null != v ? v : "Large",
                        k = m || !!y,
                        D = y || b,
                        M = (0, Z.useMemo)(function() {
                            return s ? J().createElement(rH, {
                                name: s,
                                size: T,
                                className: "content-emphasis",
                                "data-testid": "text-input-leading-icon"
                            }) : d
                        }, [s, d, T]),
                        L = (0, Z.useMemo)(function() {
                            return f ? J().createElement(rH, {
                                name: f,
                                size: T,
                                className: "content-emphasis",
                                "data-testid": "text-input-trailing-icon"
                            }) : p
                        }, [T, f, p]),
                        _ = c ? J().createElement("label", {
                            htmlFor: N,
                            className: tH(y6[T], "content-emphasis")
                        }, c, O && J().createElement(J().Fragment, null, " ", J().createElement("span", {
                            className: "content-default"
                        }, "*"))) : null;
                    return J().createElement("div", {
                        "data-testid": "text-input-wrapper",
                        className: tH("flex width-full flex-col gap-small ".concat(j), yZ({}, tV, w)),
                        style: x
                    }, _ && (u ? J().createElement("div", {
                        className: "flex items-center gap-xsmall"
                    }, _, J().createElement(sH, u)) : _), J().createElement("div", {
                        "data-testid": "text-input-container",
                        className: tH("foundation-web-input flex items-center width-full", p7[g], p5[g], S, y8[T], y3[T], y1[T], y2[T], k ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis"),
                        style: P
                    }, M, J().createElement("input", (n = function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var r = null != arguments[t] ? arguments[t] : {},
                                n = Object.keys(r);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(r, e).enumerable
                            }))), n.forEach(function(t) {
                                yZ(e, t, r[t])
                            })
                        }
                        return e
                    }({
                        type: "text",
                        id: N,
                        ref: C,
                        className: tH("width-full padding-none bg-none stroke-none outline-none content-emphasis placeholder:content-muted", y4[T]),
                        style: {
                            appearance: "none"
                        },
                        "aria-invalid": k,
                        "aria-describedby": D ? R : void 0,
                        required: O
                    }, A), o = o = {
                        disabled: w
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(o)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(o)).forEach(function(e) {
                        Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(o, e))
                    }), n)), L), D && J().createElement("span", {
                        id: R,
                        className: tH("text-caption-small", {
                            "content-system-alert": k,
                            "content-default": !k
                        })
                    }, D))
                });
            y5.displayName = "TextInput";
            var y7 = function(e) {
                    var t, r = e.offer,
                        n = e.onRemoveItem,
                        o = e.onRobuxChange,
                        a = e.onRobuxBlur,
                        i = e.isRobuxValid,
                        l = e.doesItemHaveError,
                        c = e.getItemErrorReason,
                        u = e.robuxLocked,
                        s = void 0 !== u && u,
                        f = (0, Q.useTranslation)().translate,
                        d = i(r.robux),
                        p = !!(r.robux && r.robux > 0),
                        m = f("Message.YouCanOnlyRequestRobuxFromPlusUsers", void 0, "This user needs Roblox Plus to send Robux as part of the trade"),
                        y = function(e) {
                            var t = "Bundle" === e.itemTarget.itemType,
                                r = "".concat(t ? "/bundles" : "/catalog", "/").concat(e.itemTarget.targetId, "/").concat(encodeURIComponent(e.itemName.trim().replace(/[^\w\s-]/g, "").replace(/\s+/g, "-"))),
                                o = l(e);
                            return (0, $.jsxs)("div", {
                                className: "trade-request-item".concat(o ? " invalid-request-item" : ""),
                                children: [(0, $.jsx)(rp, {
                                    className: "trade-request-item-remove",
                                    icon: "icon-regular-x",
                                    ariaLabel: "".concat(f("Action.Remove"), " ").concat(e.itemName),
                                    variant: "Utility",
                                    size: "Small",
                                    isCircular: !0,
                                    onClick: function() {
                                        n(e)
                                    }
                                }), (0, $.jsx)(nl.Thumbnail2d, {
                                    type: t ? nl.ThumbnailTypes.bundleThumbnail : nl.ThumbnailTypes.assetThumbnail,
                                    targetId: e.itemTarget.targetId,
                                    size: nl.DefaultThumbnailSize
                                }), (0, $.jsx)("div", {
                                    className: "text-lead item-name",
                                    title: e.itemName,
                                    children: (0, $.jsx)("span", {
                                        children: (0, $.jsx)("a", {
                                            href: r,
                                            target: "_blank",
                                            rel: "noreferrer",
                                            children: e.itemName
                                        })
                                    })
                                }), !!e.recentAveragePrice && (0, $.jsxs)("div", {
                                    className: "item-value",
                                    children: [(0, $.jsx)("span", {
                                        className: "icon-robux-16x16"
                                    }), (0, $.jsx)("span", {
                                        className: "text-robux",
                                        children: (0, eb.formatNumber)(e.recentAveragePrice || 0)
                                    })]
                                }), o && (0, $.jsx)("span", {
                                    className: "text-error",
                                    children: c(e)
                                })]
                            })
                        };
                    return (0, $.jsxs)("div", {
                        className: "trade-request-window-offer",
                        children: [(0, $.jsx)("h2", {
                            children: r.label
                        }), r.slots.map(function(e, t) {
                            if ("item" === e.type && e.tradableItem) {
                                var r;
                                return (0, $.jsx)("div", {
                                    title: eA(e.tradableItem, f),
                                    children: y(e.tradableItem)
                                }, null != (r = e.tradableItem.id) ? r : t)
                            }
                            return "add-item" === e.type ? (0, $.jsx)("div", {
                                className: "trade-request-item draggable-border"
                            }, "add-".concat(t)) : (0, $.jsx)("div", {
                                className: "trade-request-item blank-item"
                            }, "empty-".concat(t))
                        }), (0, $.jsx)(y5, {
                            className: "robux-input-group".concat(s ? " robux-input-group-locked" : ""),
                            size: "Medium",
                            name: "robux",
                            type: "text",
                            inputMode: "numeric",
                            pattern: "\\d*",
                            autoComplete: "off",
                            placeholder: s ? m : f("Label.PlusRobuxAmount"),
                            value: null === r.robux ? "" : String(r.robux),
                            isDisabled: s,
                            hasError: !d,
                            leadingIconName: "icon-regular-robux",
                            title: s ? m : void 0,
                            "aria-label": s ? m : void 0,
                            onChange: function(e) {
                                s || o(r.user.id, e.target.value)
                            },
                            onBlur: function() {
                                a(r)
                            }
                        }), p && (0, $.jsxs)("div", {
                            className: "robux-line",
                            children: [(0, $.jsx)("span", {
                                className: "text-secondary",
                                children: f("Label.AfterRobuxFee", {
                                    percent: "".concat(ex())
                                })
                            }), (0, $.jsxs)("span", {
                                className: "robux-line-amount",
                                children: [(0, $.jsx)("span", {
                                    className: "icon-robux-16x16"
                                }), (0, $.jsx)("span", {
                                    className: "text-secondary robux-line-value",
                                    children: (0, eb.formatNumber)(eS(null != (t = r.robux) ? t : 0))
                                })]
                            })]
                        }), (0, $.jsxs)("div", {
                            className: "robux-line",
                            children: [(0, $.jsx)("span", {
                                className: "text-lead",
                                children: f("Label.TotalValue")
                            }), (0, $.jsxs)("span", {
                                className: "robux-line-amount",
                                children: [(0, $.jsx)("span", {
                                    className: "icon-robux-16x16"
                                }), (0, $.jsx)("span", {
                                    className: "text-robux-lg robux-line-value",
                                    children: (0, eb.formatNumber)(eP(r))
                                })]
                            })]
                        })]
                    })
                },
                y9 = function(e) {
                    var t, r = e.route,
                        n = e.systemFeedbackService,
                        o = (0, Q.useTranslation)().translate,
                        a = ec().navigate,
                        i = (0, Z.useMemo)(function() {
                            return eR()
                        }, []),
                        l = dJ(n),
                        c = (0, Z.useRef)(!1);
                    (0, Z.useEffect)(function() {
                        if (!c.current) {
                            c.current = !0;
                            var e = "counter" === r.view,
                                t = tg();
                            tu(tt, e ? "counterTrade" : "createTrade", {
                                state: e ? ep.states.counterTrade : ep.states.tradeWithUser,
                                referrer: t.referrer,
                                entrySource: t.entrySource
                            })
                        }
                    }, [r.view]);
                    var u = (0, Z.useMemo)(function() {
                        return l.offers.toSorted(function(e, t) {
                            return Number(t.isMyOffer) - Number(e.isMyOffer)
                        })
                    }, [l.offers]);
                    return tA("TradeRequest render: view=", r.view, "loaded=", l.loaded, "initError=", l.initError, "offers=", l.offers.length), (0, $.jsxs)("div", {
                        className: "trades-react trade-request-react".concat(i ? " is-mobile" : ""),
                        children: [(0, $.jsxs)("div", {
                            className: "trade-request-window",
                            children: [(0, $.jsxs)(d_, {
                                as: "button",
                                type: "button",
                                className: "trade-request-back",
                                underline: "always",
                                onClick: function() {
                                    a({
                                        view: "list"
                                    })
                                },
                                children: [(0, $.jsx)(rH, {
                                    name: "icon-regular-arrow-small-left",
                                    size: "Small"
                                }), (0, $.jsx)("span", {
                                    children: o("Action.BackToTrades")
                                })]
                            }), (0, $.jsx)("h1", {
                                className: "trades-header-nowrap",
                                children: l.partner && (0, $.jsx)("span", {
                                    className: "paired-name",
                                    dangerouslySetInnerHTML: {
                                        __html: o("Label.TradeWithPartner", {
                                            username: l.partner.nameForDisplay
                                        })
                                    }
                                })
                            }), (0, $.jsx)("span", {
                                className: "trade-holding-container",
                                children: (0, $.jsx)(u_, {
                                    position: "bottom-end",
                                    title: o("Label.HoldingPolicy"),
                                    description: o("Message.HoldingPolicy"),
                                    children: (0, $.jsx)(uF, {
                                        asChild: !0,
                                        children: (0, $.jsxs)("span", {
                                            className: "tooltip-container",
                                            tabIndex: 0,
                                            children: [(0, $.jsx)("span", {
                                                className: "font-caption-body text trade-holding-period-label",
                                                children: o("Label.HoldingPeriod")
                                            }), (0, $.jsx)("span", {
                                                className: "icon-actions-info-sm"
                                            })]
                                        })
                                    })
                                })
                            }), !l.loaded && !l.initError && (0, $.jsx)("div", {
                                className: "trade-request-loading flex justify-center margin-y-large",
                                children: (0, $.jsx)(rg, {
                                    ariaLabel: o("Label.Loading", void 0, "Loading"),
                                    size: "Medium",
                                    variant: "Indeterminate"
                                })
                            }), l.initError && (0, $.jsx)("div", {
                                className: "text-error section-content-off",
                                children: l.initError
                            }), l.loaded && (0, $.jsx)("div", {
                                className: "trade-request-window-body",
                                children: u.map(function(e, t) {
                                    return (0, $.jsxs)(J().Fragment, {
                                        children: [(0, $.jsx)("div", {
                                            className: "inventory-panel-holder",
                                            children: (0, $.jsx)(yG, {
                                                user: e.user,
                                                onItemClick: l.toggleItem,
                                                isItemInOffers: l.isItemInOffers,
                                                isItemUnavailable: l.isItemUnavailable
                                            })
                                        }), (0, $.jsx)("div", {
                                            className: "trade-request-window-offers-parent",
                                            children: (0, $.jsxs)("div", {
                                                className: "trade-request-window-offers",
                                                children: [(0, $.jsx)(y7, {
                                                    offer: e,
                                                    onRemoveItem: l.removeItem,
                                                    onRobuxChange: l.setRobux,
                                                    onRobuxBlur: l.onRobuxBlur,
                                                    isRobuxValid: l.isRobuxAmountValid,
                                                    doesItemHaveError: l.doesItemHaveError,
                                                    getItemErrorReason: l.getItemErrorReason,
                                                    robuxLocked: !e.isMyOffer && l.isPartnerRobuxLocked
                                                }), t === u.length - 1 && (0, $.jsxs)(J().Fragment, {
                                                    children: [l.error && (0, $.jsx)("div", {
                                                        className: "text-error",
                                                        children: l.error
                                                    }), (0, $.jsx)(nS, {
                                                        className: "width-full",
                                                        variant: "Emphasis",
                                                        size: "Medium",
                                                        isDisabled: l.tradePending,
                                                        isLoading: l.tradePending,
                                                        onClick: l.requestSend,
                                                        children: o("Label.RequestTrade")
                                                    })]
                                                })]
                                            })
                                        })]
                                    }, e.user.id)
                                })
                            })]
                        }), (0, $.jsx)(ip, {
                            open: l.confirmSendOpen,
                            title: o("Header.SendOffer"),
                            body: o("Label.TradesAreFinalOnceComplete"),
                            actionText: o("Action.SendTrade"),
                            actionVariant: "Emphasis",
                            neutralText: o("Action.Cancel"),
                            closeLabel: o("Action.Close"),
                            footerNote: (0, $.jsx)("div", {
                                className: "text-footer",
                                children: o("Label.ItemsMayBeHeldUpToDaysAfterTrading", {
                                    days: ep.holdingPeriodDays
                                })
                            }),
                            onAction: l.confirmSend,
                            onCancel: l.cancelSend
                        }), (0, $.jsx)(ip, {
                            open: null !== l.economicBody,
                            title: o("Heading.EconomicRestrictionsError"),
                            body: null != (t = l.economicBody) ? t : "",
                            showAction: !1,
                            neutralText: o("Action.Cancel"),
                            closeLabel: o("Action.Close"),
                            onCancel: l.dismissEconomic
                        }), (0, $.jsx)(ip, {
                            open: l.verificationRedirectOpen,
                            title: o("Heading.TwoStepVerificationRequired"),
                            body: o("Message.TwoStepVerificationRequired"),
                            actionText: o("Action.GoToSecurity"),
                            actionVariant: "Emphasis",
                            neutralText: o("Action.Cancel"),
                            closeLabel: o("Action.Close"),
                            onAction: function() {
                                l.dismissVerificationRedirect(), nN()
                            },
                            onCancel: l.dismissVerificationRedirect
                        }), (0, $.jsx)(sr, {
                            isOpen: l.plusUpsellOpen,
                            titleKey: l.plusUpsellTitleKey,
                            onOpenChange: function(e) {
                                e || l.dismissPlusUpsell()
                            },
                            onGetPlusClick: function() {
                                tc(e9, "getPlusUpsell")
                            }
                        }), (0, $.jsx)(so, {
                            isOpen: l.ageCheckPromptOpen,
                            onOpenChange: function(e) {
                                e || l.dismissAgeCheckPrompt()
                            },
                            onContinue: l.startAgeCheck
                        })]
                    })
                };

            function be(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var bt = function(e) {
                    var t = e.systemFeedbackService;
                    return tj(), (0, $.jsxs)(J().Fragment, {
                        children: [(0, $.jsx)(tL, {}), (0, $.jsx)(dE, {
                            systemFeedbackService: t
                        })]
                    })
                },
                br = function() {
                    var e, t = (0, Q.useTranslation)().translate,
                        r = (0, ee.useSystemFeedback)(),
                        n = r.SystemFeedbackComponent,
                        o = r.systemFeedbackService,
                        a = function(e) {
                            if (Array.isArray(e)) return e
                        }(e = (0, Z.useState)(function() {
                            var e;
                            return null != (e = eo()) ? e : {
                                view: "list"
                            }
                        })) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    a = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); a = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return o
                            }
                        }(e) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return be(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return be(e, 2)
                            }
                        }(e) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        i = a[0],
                        l = a[1],
                        c = (0, Z.useCallback)(function(e) {
                            var t = ea(e);
                            tA("navigate ->", e, "path:", t), window.history.pushState(null, "", t), l(e)
                        }, []);
                    return (0, Z.useEffect)(function() {
                        var e = function() {
                            var e, t = null != (e = eo()) ? e : {
                                view: "list"
                            };
                            tA("popstate ->", t), l(t)
                        };
                        return window.addEventListener("popstate", e),
                            function() {
                                window.removeEventListener("popstate", e)
                            }
                    }, []), tA("render app view:", i.view, i), (0, $.jsxs)(el, {
                        value: {
                            route: i,
                            navigate: c
                        },
                        children: [(0, $.jsx)(tK, {
                            fallbackMessage: t("Error.FailedToLoadTradesList"),
                            children: "list" === i.view ? (0, $.jsx)(bt, {
                                systemFeedbackService: o
                            }) : (0, $.jsx)(y9, {
                                route: i,
                                systemFeedbackService: o
                            })
                        }), (0, $.jsx)(n, {}), (0, $.jsx)("div", {
                            id: "2sv-popup-container"
                        })]
                    })
                },
                bn = function() {
                    return (0, $.jsx)(Q.TranslationProvider, {
                        config: et.P,
                        children: (0, $.jsx)(ee.SystemFeedbackProvider, {
                            children: (0, $.jsx)(br, {})
                        })
                    })
                };
            Y()(function() {
                var e = document.getElementById("trades-web-app") || document.getElementById("trades-container");
                if (!e) {
                    tI("No container found for React trades mounting (looked for #trades-web-app / #trades-container)."), tv("mount", "No container found for React trades mounting");
                    return
                }
                e.classList.add("trades-container"), tA("mounting React trades into", "#".concat(e.id), "route:", eo());
                try {
                    (0, Q.renderWithErrorBoundary)((0, $.jsx)(bn, {}), e), tA("React trades mounted successfully")
                } catch (e) {
                    tI("React trades failed to mount", e), tv("mount", e)
                }
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("Trades");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/trades-3f4650d9228dc295.js.map
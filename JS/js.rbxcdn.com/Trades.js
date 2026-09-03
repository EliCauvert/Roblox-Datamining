! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "833d08b474076a18fe297c6518609af10129616a"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "d4a5da5d-f62c-4dca-aa20-39000cd8daf5", e._sentryDebugIdIdentifier = "sentry-dbid-d4a5da5d-f62c-4dca-aa20-39000cd8daf5")
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
                    y = Math.max,
                    m = Math.min,
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
                        l = setTimeout(O, (e = o - c, r = o - u, n = t - e, f ? m(n, a - r) : n))
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
                    return t = h(t) || 0, v(r) && (s = !!r.leading, a = (f = "maxWait" in r) ? y(h(r.maxWait) || 0, t) : a, d = "trailing" in r ? !!r.trailing : d), j.cancel = function() {
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
            var e, t, n, o, a, i, l, c, u, s, f, d, p, y, m, b, v, h, g, O, w, j, x, S, P, E, A, C, I, N, R, T, k, D, M, L, _, F, U, z, K, H, W, B, V, q, $ = window.ReactJSX,
                X = window.Roblox["core-scripts"].util.ready,
                G = r.n(X),
                Y = window.Roblox["core-scripts"].react,
                Q = window.React,
                Z = r.n(Q),
                J = window.ReactStyleGuide,
                ee = JSON.parse('{"P":["Common.AssetTypes","CommonUI.Controls","Authentication.TwoStepVerification","IAPExperience.PurchaseError","Purchasing.PurchaseDialog","Feature.NotApproved","Feature.Trades"]}'),
                et = /\/(?:trades|users)(?:\/.*)?$/,
                er = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : window.location.pathname;
                    return e.replace(et, "")
                },
                en = function() {
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
                eo = function(e) {
                    var t, r, n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : er();
                    switch (e.view) {
                        case "counter":
                            return "".concat(n, "/trades/").concat(null != (t = e.tradeId) ? t : "", "/counter");
                        case "create":
                            return "".concat(n, "/users/").concat(null != (r = e.userId) ? r : "", "/trade");
                        default:
                            return "".concat(n, "/trades").concat(e.tab ? "?tab=".concat(encodeURIComponent(e.tab)) : "")
                    }
                },
                ea = (0, Q.createContext)(null),
                ei = ea.Provider,
                el = function() {
                    var e = (0, Q.useContext)(ea);
                    if (!e) throw Error("useTradesRouter must be used within a TradesRouterProvider");
                    return e
                },
                ec = window.Roblox["core-scripts"].meta.user,
                eu = window.Roblox["core-scripts"].environmentUrls,
                es = r.n(eu),
                ef = window.Roblox["core-scripts"].endpoints,
                ed = {
                    states: {
                        tradesList: "trades-list",
                        tradeWithUser: "trade-with-user",
                        counterTrade: "counter-trade"
                    },
                    urls: {
                        tradesApi: es().tradesApi,
                        inventoryApi: es().inventoryApi,
                        usersApi: es().usersApi,
                        privacySettings: (0, ef.getAbsoluteUrl)("/my/account#!/privacy"),
                        settings: (0, ef.getAbsoluteUrl)("/my/account#!/security"),
                        membership: (0, ef.getAbsoluteUrl)("/premium/membership"),
                        limitedsCatalog: (0, ef.getAbsoluteUrl)("/catalog?Category=1&salesTypeFilter=2&CreatorName=Roblox"),
                        badRequest: (0, ef.getAbsoluteUrl)("/request-error?code=400"),
                        forbidden: (0, ef.getAbsoluteUrl)("/request-error?code=403"),
                        get2SVConfiguration: "".concat(es().twoStepVerificationApi, "/v1/users/{userId}/configuration"),
                        generate: "".concat(es().tradesApi, "/v1/trade-friction/two-step-verification/generate"),
                        redeem: "".concat(es().tradesApi, "/v1/trade-friction/two-step-verification/redeem"),
                        getSettings: "".concat(es().apiGatewayUrl, "/user-settings-api/v1/user-settings"),
                        setTradeQuality: "".concat(es().apiGatewayUrl, "/user-settings-api/v1/user-settings")
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
                        tradeFrictionEncountered: 23
                    },
                    tradeEligibility: {
                        legalOrRegulatoryRestrictions: "IneligibleLegalOrRegulatoryRestrictions"
                    },
                    canTradeWithStatus: {
                        canTrade: "CanTrade",
                        senderCannotTrade: "SenderCannotTrade",
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
                ep = window.Roblox["core-scripts"].format.string,
                ey = window.Roblox["core-scripts"].http.http;

            function em(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function eb(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function ev(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            eb(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            eb(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function eh(e) {
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

            function eg(e, t) {
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

            function eO(e) {
                return function(e) {
                    if (Array.isArray(e)) return em(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return em(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return em(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ew(e, t) {
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
            var ej = function(e, t) {
                    return (0, ep.concat)([(0, ep.escapeHtml)(null != e ? e : ""), (0, ep.escapeHtml)(null != t ? t : "")], void 0, !0)
                },
                ex = function(e) {
                    return ev(function() {
                        var t, r, n, o;
                        return ew(this, function(a) {
                            switch (a.label) {
                                case 0:
                                    return t = {
                                        url: "".concat(ed.urls.tradesApi, "/v1/trades/").concat(e.tradeStatusType),
                                        withCredentials: !0
                                    }, r = {
                                        cursor: e.cursor,
                                        limit: e.count,
                                        sortOrder: "Desc"
                                    }, [4, ey.get(t, r)];
                                case 1:
                                    return o = ((n = a.sent().data).data || []).map(function(t) {
                                        return eg(eh({}, t), {
                                            tradeStatusType: e.tradeStatusType,
                                            user: t.user ? eg(eh({}, t.user), {
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
                eS = function(e, t) {
                    return ev(function() {
                        var r, n, o, a;
                        return ew(this, function(i) {
                            switch (i.label) {
                                case 0:
                                    return o = {
                                        url: "".concat(ed.urls.tradesApi, "/v2/trades/").concat(t),
                                        withCredentials: !0
                                    }, [4, ey.get(o)];
                                case 1:
                                    if (!(a = i.sent().data)) return [2, null];
                                    return (null == (r = a.participantAOffer.user) ? void 0 : r.id) === e ? a.user = a.participantBOffer.user : (null == (n = a.participantBOffer.user) ? void 0 : n.id) === e && (a.user = a.participantAOffer.user), a.user && (a.user.nameForDisplay = ej(a.user.displayName, a.user.name)), a.offers = [a.participantAOffer, a.participantBOffer], [2, a]
                            }
                        })
                    })()
                },
                eP = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        r = t.itemTargetType,
                        n = t.cursor,
                        o = t.limit,
                        a = void 0 === o ? ed.getTradableItemsLimit : o,
                        i = t.search;
                    return ev(function() {
                        var t, o, l, c;
                        return ew(this, function(u) {
                            switch (u.label) {
                                case 0:
                                    return o = {
                                        url: "".concat(ed.urls.tradesApi, "/v2/users/").concat(e, "/tradableItems"),
                                        withCredentials: !0
                                    }, l = {
                                        sortBy: "CreationTime",
                                        sortOrder: "Desc",
                                        limit: a
                                    }, n && (l.cursor = n), r && (l.itemTargetTypes = r), i && (l.search = i), [4, ey.get(o, l)];
                                case 1:
                                    return [2, {
                                        items: ((c = u.sent().data).items || []).reduce(function(e, t) {
                                            return eO(e).concat(eO(t.instances || []))
                                        }, []).map(function(t) {
                                            return eg(eh({}, t), {
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
                eE = function(e) {
                    try {
                        return ey.getApiErrorCodes(e) || []
                    } catch (e) {
                        return []
                    }
                },
                eA = function(e) {
                    var t = function(e) {
                            if (!e || (void 0 === e ? "undefined" : e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e) != "object") return null;
                            var t = e.errors;
                            return Array.isArray(t) ? t : null
                        },
                        r = null == e ? void 0 : e.response,
                        n = t(e) || t(null == e ? void 0 : e.data) || t(null == r ? void 0 : r.data);
                    return n && n.length > 0 ? n[0] : null
                },
                eC = window.Roblox["core-scripts"].eventStream;

            function eI(e) {
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

            function eN(e, t) {
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
            var eR = "react",
                eT = "tradesListInteraction",
                ek = "tradeRequestInteractionV2",
                eD = "tradeRequestSent",
                eM = "tradePageView",
                eL = "tradeViewed",
                e_ = "tradeCenterFirstVisit",
                eF = "tradeFilterClick",
                eU = "tradeBannerDismiss",
                ez = function(e, t) {
                    var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
                    (0, eC.sendEventWithTarget)(e, t, eN(eI({}, r), {
                        pg: "v2",
                        framework: eR
                    }))
                },
                eK = function(e, t) {
                    var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                        n = Roblox.AXAnalyticsService,
                        o = Roblox.AXSendTrackingActionType;
                    if (n && "function" == typeof n.sendAXTracking) {
                        var a = e === eM || e === e_ || e === eL ? null == o ? void 0 : o.View : null == o ? void 0 : o.Click;
                        n.sendAXTracking({
                            itemName: e,
                            actionType: a,
                            metaData: {
                                metaData: JSON.stringify(eN(eI({
                                    context: t
                                }, r), {
                                    pg: "v2",
                                    framework: eR
                                }))
                            }
                        })
                    }
                },
                eH = function(e) {
                    if (!e) return {};
                    if ("string" == typeof e) return {
                        errorMessage: e
                    };
                    if ("errors" in e && Array.isArray(e.errors) && e.errors.length > 0) {
                        var t = e.errors[0];
                        return {
                            errorCode: t.code,
                            errorMessage: t.message
                        }
                    }
                    return {
                        errorName: e.name,
                        errorMessage: e.message,
                        errorCode: e.code
                    }
                },
                eW = function(e, t) {
                    var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
                    eK("tradeError", e, eI({}, r, eH(t)))
                },
                eB = function(e) {
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
                eV = function() {
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
                eq = "rbx.trades.hasVisitedTradeCenter",
                e$ = function() {
                    try {
                        if (!window.localStorage || "true" === window.localStorage.getItem(eq)) return !1;
                        return window.localStorage.setItem(eq, "true"), !0
                    } catch (e) {
                        return !1
                    }
                },
                eX = function() {
                    var e = (0, Q.useRef)(!1);
                    (0, Q.useEffect)(function() {
                        if (!e.current) {
                            e.current = !0;
                            var t, r, n = eV(),
                                o = e$();
                            eK(eM, "tradesList", {
                                state: ed.states.tradesList,
                                referrer: n.referrer,
                                entrySource: n.entrySource,
                                isFirstVisit: o
                            }), o && (t = null == (r = (0, ec.authenticatedUser)()) ? void 0 : r.id, ev(function() {
                                var e, r, n;
                                return ew(this, function(o) {
                                    switch (o.label) {
                                        case 0:
                                            if (!t || t <= 0) return [2, !1];
                                            e = {
                                                url: "".concat(ed.urls.tradesApi, "/v2/users/").concat(t, "/tradableItems"),
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
                                eK(e_, "tradesList", {
                                    entrySource: n.entrySource,
                                    ownsLimiteds: e
                                })
                            }).catch(function() {})
                        }
                    }, [])
                };

            function eG(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function eY(e) {
                return function(e) {
                    if (Array.isArray(e)) return eG(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return eG(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return eG(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var eQ = "[trades-react]",
                eZ = function() {
                    try {
                        return "false" !== window.localStorage.getItem("tradesReactDebug")
                    } catch (e) {
                        return !0
                    }
                },
                eJ = function() {
                    for (var e, t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                    eZ() && (e = console).log.apply(e, [eQ].concat(eY(r)))
                },
                e0 = function() {
                    for (var e, t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                    eZ() && (e = console).warn.apply(e, [eQ].concat(eY(r)))
                },
                e1 = function() {
                    for (var e, t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                    (e = console).error.apply(e, [eQ].concat(eY(r)))
                };

            function e2(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function e8(e, t) {
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
                        if ("string" == typeof e) return e2(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return e2(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var e3 = "rbx.HideMoneyPageBanner",
                e6 = "rbx.HideRegionalRestrictionsBanner",
                e5 = function(e) {
                    try {
                        return !!window.localStorage && "true" === window.localStorage.getItem(e)
                    } catch (e) {
                        return !1
                    }
                },
                e4 = function(e) {
                    try {
                        var t;
                        null == (t = window.localStorage) || t.setItem(e, "true")
                    } catch (e) {}
                },
                e7 = function() {
                    var e = (0, Y.useTranslation)().translate,
                        t = e8((0, Q.useState)(!e5(e3)), 2),
                        r = t[0],
                        n = t[1],
                        o = e8((0, Q.useState)(!1), 2),
                        a = o[0],
                        i = o[1],
                        l = e8((0, Q.useState)(e5(e6)), 2),
                        c = l[0],
                        u = l[1];
                    (0, Q.useEffect)(function() {
                        ev(function() {
                            var e, t;
                            return ew(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return e = {
                                            url: "".concat(ed.urls.tradesApi, "/v2/users/me/can-trade"),
                                            withCredentials: !0
                                        }, [4, ey.get(e)];
                                    case 1:
                                        return [2, null != (t = r.sent().data) ? t : null]
                                }
                            })
                        })().then(function(e) {
                            i((null == e ? void 0 : e.tradeEligibility) === ed.tradeEligibility.legalOrRegulatoryRestrictions)
                        }).catch(function() {
                            i(!1)
                        })
                    }, []);
                    var s = function() {
                            n(!1), eK(eU, "close", {
                                banner: "moneyPage"
                            }), e4(e3)
                        },
                        f = function() {
                            u(!0), eK(eU, "close", {
                                banner: "regionalRestrictions"
                            }), e4(e6)
                        };
                    return (0, $.jsxs)(Z().Fragment, {
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

            function e9(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var n = t[r];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                }
            }

            function te(e) {
                return (te = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function tt(e, t) {
                return (tt = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function tr() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (tr = function() {
                    return !!e
                })()
            }
            var tn = function(e) {
                    var t, r;
                    if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                    function n(e) {
                        var t, r, o;
                        if (!(this instanceof n)) throw TypeError("Cannot call a class as a function");
                        return r = n, o = [e], r = te(r), (t = function(e, t) {
                            var r;
                            if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                            if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                            return e
                        }(this, tr() ? Reflect.construct(r, o || [], te(this).constructor) : r.apply(this, o))).state = {
                            hasError: !1
                        }, t
                    }
                    return n.prototype = Object.create(e && e.prototype, {
                        constructor: {
                            value: n,
                            writable: !0,
                            configurable: !0
                        }
                    }), e && tt(n, e), t = [{
                        key: "componentDidCatch",
                        value: function(e, t) {
                            e1("render error caught by boundary:", e, null == t ? void 0 : t.componentStack), eW("renderErrorBoundary", e, {
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
                    }], t && e9(n.prototype, t), r && e9(n, r), n
                }(Z().Component),
                to = function() {
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
                ta = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                ti = function(e) {
                    var t = e.className;
                    return Z().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: to("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                },
                tl = "opacity-[0.5]";

            function tc(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tu(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function ts() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map(function(t) {
                            var n = tu(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        });
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : tu(t[e], null)
                        }
                    }
                }
            }

            function tf() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return Q.useCallback(ts.apply(void 0, function(e) {
                    if (Array.isArray(e)) return tc(e)
                }(t) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return tc(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tc(e, void 0)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function td(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tp(e) {
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

            function ty(e, t) {
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

            function tm(e, t) {
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

            function tb(e) {
                return function(e) {
                    if (Array.isArray(e)) return td(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return td(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return td(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tv(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var th = Symbol.for("react.lazy"),
                tg = Q[" use ".trim().toString()];

            function tO(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : tv(e)) === "object" && "$$typeof" in e && e.$$typeof === th && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : tv(t)) === "object" && null !== t && "then" in t
            }
            var tw = ((e = Q.forwardRef(function(e, t) {
                    var r = e.children,
                        n = tm(e, ["children"]);
                    if (tO(r) && "function" == typeof tg && (r = tg(r._payload)), Q.isValidElement(r)) {
                        var o, a, i, l, c, u = (c = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                            s = function(e, t) {
                                var r = tp({}, t);
                                for (var n in t) ! function(n) {
                                    var o = e[n],
                                        a = t[n];
                                    /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                        var n = a.apply(void 0, tb(t));
                                        return o.apply(void 0, tb(t)), n
                                    } : o && (r[n] = o) : "style" === n ? r[n] = tp({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                                }(n);
                                return tp({}, e, r)
                            }(n, r.props);
                        return r.type !== Q.Fragment && (s.ref = t ? ts(t, u) : u), Q.cloneElement(r, s)
                    }
                    return Q.Children.count(r) > 1 ? Q.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), n = e, (o = Q.forwardRef(function(e, t) {
                    var r = e.children,
                        o = tm(e, ["children"]);
                    tO(r) && "function" == typeof tg && (r = tg(r._payload));
                    var a = Q.Children.toArray(r),
                        i = a.find(tx);
                    if (i) {
                        var l = i.props.children,
                            c = a.map(function(e) {
                                return e !== i ? e : Q.Children.count(l) > 1 ? Q.Children.only(null) : Q.isValidElement(l) ? l.props.children : null
                            });
                        return (0, $.jsx)(n, ty(tp({}, o), {
                            ref: t,
                            children: Q.isValidElement(l) ? Q.cloneElement(l, void 0, c) : null
                        }))
                    }
                    return (0, $.jsx)(n, ty(tp({}, o), {
                        ref: t,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), o),
                tj = Symbol("radix.slottable");

            function tx(e) {
                return Q.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === tj
            }

            function tS(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tP(e) {
                if (Array.isArray(e)) return e
            }

            function tE() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function tA(e) {
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

            function tC(e, t) {
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

            function tI(e, t) {
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

            function tN(e, t) {
                if (e) {
                    if ("string" == typeof e) return tS(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tS(e, t)
                }
            }
            var tR = {
                    Large: "size-1200",
                    Medium: "size-1000",
                    Small: "size-800",
                    XSmall: "size-600"
                },
                tT = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-700"
                },
                tk = {
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
                tD = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-alert",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                tM = {
                    Emphasis: "bg-action-standard",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                tL = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-shift-300",
                    OverMedia: "bg-over-media-0"
                },
                t_ = {
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
                tF = {
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
                tU = (0, Q.forwardRef)(function(e, t) {
                    var r, n, o = tP(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || tN(r) || tE(),
                        a = o[0],
                        i = o.slice(1),
                        l = a.className,
                        c = a.icon,
                        u = a.ariaLabel,
                        s = a.isDisabled,
                        f = void 0 !== s && s,
                        d = a.isCircular,
                        p = a.isSelected,
                        y = a.size,
                        m = void 0 === y ? "Large" : y,
                        b = a.variant,
                        v = void 0 === b ? "Emphasis" : b,
                        h = a.iconColor,
                        g = void 0 === h ? "Default" : h,
                        O = a.asChild,
                        w = a.children,
                        j = tI(a, ["className", "icon", "ariaLabel", "isDisabled", "isCircular", "isSelected", "size", "variant", "iconColor", "asChild", "children"]),
                        x = (tP(i) || function(e) {
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
                        }(i) || tN(i, 1) || tE())[0];
                    n = f ? tM[v] : void 0 !== p && p ? tL[v] : tD[v];
                    var S = to("foundation-web-icon-button", f ? tl : [ta, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", tR[m], tk[m][void 0 !== d && d ? "circular" : "square"], n, l),
                        P = Z().createElement(Z().Fragment, null, Z().createElement(ti, null), Z().createElement("span", {
                            className: to("icon", c, tT[m], f ? tF[g][v] : t_[g][v])
                        }));
                    if (O) {
                        j.as;
                        var E = tI(j, ["as"]),
                            A = Z().Children.only(w);
                        return Z().createElement(tw, tC(tA({
                            ref: x
                        }, E), {
                            className: S,
                            "aria-label": u,
                            "aria-disabled": f || void 0
                        }), Z().cloneElement(A, {}, P))
                    }
                    if ("a" === j.as) {
                        j.as;
                        var C = j.href,
                            I = tI(j, ["as", "href"]);
                        return Z().createElement("a", tC(tA({
                            ref: x
                        }, I), {
                            "aria-label": u,
                            "aria-disabled": f,
                            href: f ? void 0 : C,
                            className: S
                        }), P)
                    }
                    j.as;
                    var N = tI(j, ["as"]);
                    return Z().createElement("button", tC(tA({
                        ref: x,
                        type: "button"
                    }, N), {
                        "aria-label": u,
                        disabled: f,
                        className: S
                    }), P)
                }),
                tz = window.Roblox["core-scripts"].format.number,
                tK = window.Roblox["core-scripts"].meta.device,
                tH = window.Roblox["core-scripts"].intl.intl,
                tW = r.n(tH),
                tB = function(e) {
                    var t = Math.round(e);
                    return Math.abs(e) % 1 != .5 || t % 2 == 0 ? t : t - 1
                },
                tV = function(e) {
                    var t = parseInt(String(e), 10);
                    return t >= ed.minRobux && t <= ed.maxRobux
                },
                tq = function(e) {
                    return Number.isInteger(parseInt(String(e), 10))
                },
                t$ = function() {
                    return 30
                },
                tX = function(e) {
                    return tV(e) ? tB(.7 * e) : 0
                },
                tG = function(e) {
                    var t, r = e.items.reduce(function(e, t) {
                            return e + (t.recentAveragePrice ? t.recentAveragePrice : 0)
                        }, 0),
                        n = null != (t = e.robux) ? t : 0;
                    return tq(n) && tV(n) && (r += parseInt(String(n), 10)), r
                },
                tY = function(e) {
                    return null == e || "" === e || tq(e) && tV(e)
                },
                tQ = function(e, t) {
                    var r;
                    return e.serialNumber ? t("Label.SerialNumber", {
                        serialNumber: (0, tz.formatNumber)(e.serialNumber),
                        totalNumber: (0, tz.formatNumber)(null != (r = e.assetStock) ? r : 0)
                    }) : t("Label.NoSerialNumber")
                },
                tZ = function(e, t) {
                    var r = e.assetStock ? (0, tz.formatNumber)(e.assetStock) : "";
                    if (null != e.serialNumber) {
                        var n = (0, tz.formatNumber)(e.serialNumber);
                        return r ? "#".concat(n, "/").concat(r) : "#".concat(n)
                    }
                    var o = t("Label.NoSerialNumber");
                    return r ? "".concat(o, " /").concat(r) : o
                },
                tJ = function() {
                    var e;
                    return !!(null == (e = (0, tK.getDeviceMeta)()) ? void 0 : e.isPhone)
                },
                t0 = function(e) {
                    return new(tW())().getDateTimeFormatter().getShortDate(new Date(e))
                };

            function t1(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function t2(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function t8(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            t2(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            t2(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function t3(e, t) {
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
                }(e, t) || t5(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function t6(e) {
                return function(e) {
                    if (Array.isArray(e)) return t1(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || t5(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function t5(e, t) {
                if (e) {
                    if ("string" == typeof e) return t1(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return t1(e, t)
                }
            }

            function t4(e, t) {
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
            var t7 = function(e, t) {
                    var r = new Set(e.map(function(e) {
                        return e.id
                    }));
                    return t6(e).concat(t6(t.filter(function(e) {
                        return !r.has(e.id)
                    })))
                },
                t9 = function() {
                    var e = t3((0, Q.useState)([]), 2),
                        t = e[0],
                        r = e[1],
                        n = t3((0, Q.useState)(!1), 2),
                        o = n[0],
                        a = n[1],
                        i = t3((0, Q.useState)(!1), 2),
                        l = i[0],
                        c = i[1],
                        u = t3((0, Q.useState)(!1), 2),
                        s = u[0],
                        f = u[1],
                        d = t3((0, Q.useState)(!1), 2),
                        p = d[0],
                        y = d[1],
                        m = (0, Q.useRef)(""),
                        b = (0, Q.useRef)(ed.tradeStatusType.inbound),
                        v = (0, Q.useRef)(!1);
                    return {
                        trades: t,
                        loading: o,
                        noResults: l,
                        hasMore: s,
                        loadFailed: p,
                        loadFirstPage: (0, Q.useCallback)(function(e) {
                            return t8(function() {
                                var t, n;
                                return t4(this, function(o) {
                                    switch (o.label) {
                                        case 0:
                                            b.current = e, m.current = "", v.current = !0, r([]), c(!1), f(!1), y(!1), a(!0), o.label = 1;
                                        case 1:
                                            return o.trys.push([1, 3, 4, 5]), [4, ex({
                                                cursor: "",
                                                tradeStatusType: e,
                                                count: ed.tradesLoadedPerPage
                                            })];
                                        case 2:
                                            return m.current = (t = o.sent()).nextPageCursor, r(t.items), c(0 === t.items.length), f(null != t.nextPageCursor), [2, t.items];
                                        case 3:
                                            throw n = o.sent(), y(!0), n;
                                        case 4:
                                            return v.current = !1, a(!1), [7];
                                        case 5:
                                            return [2]
                                    }
                                })
                            })()
                        }, []),
                        loadNextPage: (0, Q.useCallback)(function() {
                            return t8(function() {
                                var e, t;
                                return t4(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            if (v.current || null === m.current || void 0 === m.current) return [2, []];
                                            v.current = !0, y(!1), a(!0), n.label = 1;
                                        case 1:
                                            return n.trys.push([1, 3, 4, 5]), [4, ex({
                                                cursor: m.current || "",
                                                tradeStatusType: b.current,
                                                count: ed.tradesLoadedPerPage
                                            })];
                                        case 2:
                                            return m.current = (e = n.sent()).nextPageCursor, r(function(t) {
                                                return t7(t, e.items)
                                            }), f(null != e.nextPageCursor), [2, e.items];
                                        case 3:
                                            throw t = n.sent(), y(!0), t;
                                        case 4:
                                            return v.current = !1, a(!1), [7];
                                        case 5:
                                            return [2]
                                    }
                                })
                            })()
                        }, []),
                        removeTrade: (0, Q.useCallback)(function(e) {
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

            function re(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rt(e) {
                if (Array.isArray(e)) return e
            }

            function rr() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function rn(e, t) {
                if (e) {
                    if ("string" == typeof e) return re(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return re(e, t)
                }
            }
            var ro = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                ra = Z().forwardRef(function(e, t) {
                    var r, n = rt(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || rn(r) || rr(),
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
                        s = (rt(a) || function(e) {
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
                        }(a) || rn(a, 1) || rr())[0];
                    return Z().createElement("span", function(e) {
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
                        className: to("grow-0 shrink-0 basis-auto icon", i, ro[void 0 === l ? "Medium" : l], c)
                    }, u))
                });

            function ri(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rl(e) {
                if (Array.isArray(e)) return e
            }

            function rc() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function ru(e) {
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

            function rs(e, t) {
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

            function rf(e, t) {
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

            function rd(e, t) {
                if (e) {
                    if ("string" == typeof e) return ri(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ri(e, t)
                }
            }
            ra.displayName = "Icon";
            var rp = {
                    Small: "XSmall",
                    Medium: "Small",
                    Large: "Medium"
                },
                ry = {
                    Small: ["height-600", "text-label-small"],
                    Medium: ["height-800", "text-label-medium"],
                    Large: ["height-1000", "text-label-medium"]
                },
                rm = {
                    Small: "padding-left-small",
                    Medium: "padding-left-medium",
                    Large: "padding-left-large"
                },
                rb = {
                    Small: "padding-left-small",
                    Medium: "padding-left-medium",
                    Large: "padding-left-medium"
                },
                rv = {
                    Small: "padding-right-small",
                    Medium: "padding-right-medium",
                    Large: "padding-right-large"
                },
                rh = {
                    Small: "padding-right-small",
                    Medium: "padding-right-medium",
                    Large: "padding-right-medium"
                },
                rg = {
                    Small: "padding-left-xsmall",
                    Medium: "padding-left-[var(--size-150)]",
                    Large: "padding-left-small"
                },
                rO = {
                    Small: "padding-right-[var(--size-150)]",
                    Medium: "padding-right-small",
                    Large: "padding-right-[var(--size-250)]"
                },
                rw = {
                    Standard: "bg-shift-300",
                    Utility: "bg-none"
                },
                rj = {
                    Small: "size-[var(--icon-size-xsmall)]",
                    Medium: "size-[var(--icon-size-small)]",
                    Large: "size-[var(--icon-size-medium)]"
                },
                rx = function(e) {
                    var t = e.iconName,
                        r = e.node,
                        n = e.size;
                    return null != t ? Z().createElement(ra, {
                        name: t,
                        size: rp[n]
                    }) : null != r ? Z().createElement("span", {
                        className: to("inline-flex items-center justify-center shrink-0", rj[n])
                    }, r) : null
                },
                rS = (0, Q.forwardRef)(function(e, t) {
                    var r, n = rl(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || rd(r) || rc(),
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
                        y = void 0 === p ? "Standard" : p,
                        m = o.leadingIconName,
                        b = o.leadingIconNode,
                        v = o.trailingIconName,
                        h = o.trailingIconNode,
                        g = rf(o, ["className", "style", "text", "isDisabled", "size", "variant", "leadingIconName", "leadingIconNode", "trailingIconName", "trailingIconNode"]),
                        O = (rl(a) || function(e) {
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
                        }(a) || rd(a, 1) || rc())[0],
                        w = null != m || null != b,
                        j = null != v || null != h,
                        x = to(s ? tl : [ta, "cursor-pointer"], "relative flex justify-center items-center radius-circle stroke-none", w ? rb[d] : rm[d], j ? rh[d] : rv[d], ry[d], i),
                        S = Z().createElement(Z().Fragment, null, Z().createElement(ti, null), Z().createElement(rx, {
                            iconName: m,
                            node: b,
                            size: d
                        }), Z().createElement("span", {
                            className: to("padding-y-xsmall text-no-wrap text-truncate-end", w && rg[d], j && rO[d])
                        }, c), Z().createElement(rx, {
                            iconName: v,
                            node: h,
                            size: d
                        })),
                        P = ru({
                            textDecoration: "none"
                        }, l);
                    if ("a" === g.as) {
                        g.as;
                        var E = g.href,
                            A = rf(g, ["as", "href"]);
                        return Z().createElement("a", rs(ru({
                            ref: O
                        }, A), {
                            "aria-disabled": s,
                            href: s ? void 0 : E,
                            className: to(x, rw[y], "content-action-utility"),
                            style: P
                        }), S)
                    }
                    g.as;
                    var C = g.isChecked,
                        I = g.onCheckedChange,
                        N = rf(g, ["as", "isChecked", "onCheckedChange"]);
                    return Z().createElement("button", rs(ru({
                        ref: O,
                        type: "button"
                    }, N), {
                        className: to(C ? "bg-inverse-surface-0" : rw[y], C ? "content-inverse-emphasis" : "content-action-utility", x),
                        style: P,
                        "aria-pressed": C,
                        disabled: s,
                        onClick: null == I ? void 0 : function() {
                            return I(!C)
                        }
                    }), S)
                });

            function rP(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rE(e, t) {
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
                        if ("string" == typeof e) return rP(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rP(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var rA = function(e) {
                    var t = e.options,
                        r = e.value,
                        n = e.onSelect,
                        o = (0, Q.useRef)(null),
                        a = (0, Q.useRef)({}),
                        i = rE((0, Q.useState)(!1), 2),
                        l = i[0],
                        c = i[1],
                        u = rE((0, Q.useState)(!1), 2),
                        s = u[0],
                        f = u[1],
                        d = (0, Q.useCallback)(function() {
                            var e = o.current;
                            e && (c(e.scrollLeft > 1), f(e.scrollWidth - e.clientWidth - e.scrollLeft > 1))
                        }, []);
                    return (0, Q.useEffect)(function() {
                        return d(), window.addEventListener("resize", d),
                            function() {
                                window.removeEventListener("resize", d)
                            }
                    }, [d, t]), (0, Q.useEffect)(function() {
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
                                return (0, $.jsx)(rS, {
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
                },
                rC = window.RobloxThumbnails,
                rI = function(e) {
                    var t, r;
                    return (null == (t = e.user) ? void 0 : t.id) === (null == (r = (0, ec.authenticatedUser)()) ? void 0 : r.id)
                },
                rN = function(e, t) {
                    var r = ed.tradeStatus;
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
                rR = function(e, t, r) {
                    var n = rI(t),
                        o = ed.tradeStatusType;
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
                rT = function(e) {
                    var t, r = e.trade,
                        n = e.isSelected,
                        o = e.onClick,
                        a = e.onProfileClick,
                        i = (0, Y.useTranslation)().translate,
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
                        children: [(0, $.jsx)("div", {
                            className: "rbx-divider"
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
                                            children: (0, $.jsx)(rC.Thumbnail2d, {
                                                type: rC.ThumbnailTypes.avatarHeadshot,
                                                targetId: l.id,
                                                size: rC.ThumbnailAvatarHeadshotSize.size60,
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
                                        children: rN(r.status, i)
                                    }), (0, $.jsx)("span", {
                                        className: "font-caption-body text-date-hint text trade-sent-date",
                                        children: t0(r.created)
                                    })]
                                })
                            })
                        })]
                    })
                };

            function rk(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function rD(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            rk(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            rk(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function rM(e, t) {
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
            var rL = function() {
                    return rD(function() {
                        var e, t;
                        return rM(this, function(r) {
                            switch (r.label) {
                                case 0:
                                    return t = ed.urls.get2SVConfiguration.replace("{userId}", String(null == (e = (0, ec.authenticatedUser)()) ? void 0 : e.id)), [4, ey.get({
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
                r_ = function() {
                    window.location.href = ed.urls.settings
                },
                rF = function(e, t) {
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
                rU = function(e, t) {
                    var r = ed.invalidUserAssetReason;
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
                rz = window.Roblox.AccountIntegrityChallengeService.TwoStepVerification,
                rK = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        r = (0, Y.useTranslation)().translate,
                        n = (0, Q.useRef)(""),
                        o = (0, Q.useRef)(0),
                        a = (0, Q.useRef)(t);
                    a.current = t;
                    var i = function() {
                            window.location.reload()
                        },
                        l = function() {
                            e.warning(r("Response.VerificationError"), 100, 6e3)
                        },
                        c = function(t) {
                            var o, c;
                            (o = n.current, c = t.verificationToken, rD(function() {
                                return rM(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return [4, ey.post({
                                                url: ed.urls.redeem,
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
                            rD(function() {
                                return rM(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return [4, ey.post({
                                                url: ed.urls.generate,
                                                withCredentials: !0
                                            }, {})];
                                        case 1:
                                            return [2, e.sent().data]
                                    }
                                })
                            })().then(function(e) {
                                var t;
                                n.current = e, rz.renderChallenge({
                                    containerId: "2sv-popup-container",
                                    userId: null == (t = (0, ec.authenticatedUser)()) ? void 0 : t.id,
                                    challengeId: e,
                                    actionType: rz.ActionType.ItemTrade,
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
                rH = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-medium"
                },
                rW = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                rB = function(e) {
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
                    return Z().createElement("button", function(e) {
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
                        className: to("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", ta, rW[t], rH[r], n && "radius-circle", o)
                    }, a), Z().createElement(ti, null), Z().createElement(ra, {
                        name: "icon-regular-x",
                        size: r
                    }))
                };

            function rV(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    o = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === o || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function rq(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function r$(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function rX(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        r$(e, t, r[t])
                    })
                }
                return e
            }

            function rG(e, t) {
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

            function rY(e) {
                return function(e) {
                    if (Array.isArray(e)) return rq(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return rq(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rq(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rQ(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    r = [],
                    n = function() {
                        var t = r.map(function(e) {
                            return Q.createContext(e)
                        });
                        return function(r) {
                            var n = (null == r ? void 0 : r[e]) || t;
                            return Q.useMemo(function() {
                                var t, o;
                                return r$({}, "__scope".concat(e), (t = rX({}, r), o = null != (o = r$({}, e, n)) ? o : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(o)) : (function(e) {
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
                    var o = Q.createContext(n),
                        a = r.length;
                    r = rY(r).concat([n]);
                    var i = function(t) {
                        var r, n = t.scope,
                            i = t.children,
                            l = rG(t, ["scope", "children"]),
                            c = (null == n || null == (r = n[e]) ? void 0 : r[a]) || o,
                            u = Q.useMemo(function() {
                                return l
                            }, Object.values(l));
                        return (0, $.jsx)(c.Provider, {
                            value: u,
                            children: i
                        })
                    };
                    return i.displayName = t + "Provider", [i, function(r, i) {
                        var l, c = (null == i || null == (l = i[e]) ? void 0 : l[a]) || o,
                            u = Q.useContext(c);
                        if (u) return u;
                        if (void 0 !== n) return n;
                        throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                    }]
                }, rZ.apply(void 0, [n].concat(rY(t)))]
            }

            function rZ() {
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
                            return rX({}, e, n(t)["__scope".concat(o)])
                        }, {});
                        return Q.useMemo(function() {
                            return r$({}, "__scope".concat(n.scopeName), r)
                        }, [r])
                    }
                };
                return o.scopeName = n.scopeName, o
            }
            var rJ = (null == (B = globalThis) ? void 0 : B.document) ? Q.useLayoutEffect : function() {};

            function r0(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var r1 = Q[" useId ".trim().toString()] || function() {},
                r2 = 0;

            function r8(e) {
                var t, r = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = Q.useState(r1())) || function(e) {
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
                            if ("string" == typeof e) return r0(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return r0(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r[0],
                    o = r[1];
                return rJ(function() {
                    e || o(function(e) {
                        return null != e ? e : String(r2++)
                    })
                }, [e]), e || (n ? "radix-".concat(n) : "")
            }

            function r3(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function r6(e) {
                var t = Q.useRef(e);
                return Q.useEffect(function() {
                    t.current = e
                }), Q.useMemo(function() {
                    return function() {
                        for (var e, r = arguments.length, n = Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                            if (Array.isArray(e)) return r3(e)
                        }(n) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(n) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return r3(e, void 0);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return r3(e, void 0)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }
                }, [])
            }

            function r5(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function r4(e, t) {
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
                        if ("string" == typeof e) return r5(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return r5(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function r7(e) {
                var t, r, n, o, a, i, l, c = e.prop,
                    u = e.defaultProp,
                    s = e.onChange,
                    f = void 0 === s ? function() {} : s,
                    d = r4((r = (t = {
                        defaultProp: u,
                        onChange: f
                    }).defaultProp, n = t.onChange, a = r4(o = Q.useState(r), 1)[0], i = Q.useRef(a), l = r6(n), Q.useEffect(function() {
                        i.current !== a && (l(a), i.current = a)
                    }, [a, i, l]), o), 2),
                    p = d[0],
                    y = d[1],
                    m = void 0 !== c,
                    b = m ? c : p,
                    v = r6(f);
                return [b, Q.useCallback(function(e) {
                    if (m) {
                        var t = "function" == typeof e ? e(c) : e;
                        t !== c && v(t)
                    } else y(e)
                }, [m, c, y, v])]
            }
            var r9 = window.RadixUI["react-dismissable-layer"],
                ne = window.ReactDOM,
                nt = r.n(ne);

            function nr(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nn(e) {
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

            function no(e, t) {
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

            function na(e, t) {
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

            function ni(e) {
                return function(e) {
                    if (Array.isArray(e)) return nr(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return nr(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nr(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nl(e) {
                var t, r, n = (t = e, (r = Q.forwardRef(function(e, t) {
                        var r = e.children,
                            n = na(e, ["children"]);
                        if (Q.isValidElement(r)) {
                            var o, a, i, l, c, u = (c = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                s = function(e, t) {
                                    var r = nn({}, t);
                                    for (var n in t) ! function(n) {
                                        var o = e[n],
                                            a = t[n];
                                        /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            a.apply(void 0, ni(t)), o.apply(void 0, ni(t))
                                        } : o && (r[n] = o) : "style" === n ? r[n] = nn({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                                    }(n);
                                    return nn({}, e, r)
                                }(n, r.props);
                            return r.type !== Q.Fragment && (s.ref = t ? ts(t, u) : u), Q.cloneElement(r, s)
                        }
                        return Q.Children.count(r) > 1 ? Q.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), r),
                    o = Q.forwardRef(function(e, t) {
                        var r = e.children,
                            o = na(e, ["children"]),
                            a = Q.Children.toArray(r),
                            i = a.find(nu);
                        if (i) {
                            var l = i.props.children,
                                c = a.map(function(e) {
                                    return e !== i ? e : Q.Children.count(l) > 1 ? Q.Children.only(null) : Q.isValidElement(l) ? l.props.children : null
                                });
                            return (0, $.jsx)(n, no(nn({}, o), {
                                ref: t,
                                children: Q.isValidElement(l) ? Q.cloneElement(l, void 0, c) : null
                            }))
                        }
                        return (0, $.jsx)(n, no(nn({}, o), {
                            ref: t,
                            children: r
                        }))
                    });
                return o.displayName = "".concat(e, ".Slot"), o
            }
            var nc = Symbol("radix.slottable");

            function nu(e) {
                return Q.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === nc
            }

            function ns(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function nf(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        ns(e, t, r[t])
                    })
                }
                return e
            }

            function nd(e, t) {
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
            var np = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                var r = nl("Primitive.".concat(t)),
                    n = Q.forwardRef(function(e, n) {
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
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, $.jsx)(i, nd(nf({}, a), {
                            ref: n
                        }))
                    });
                return n.displayName = "Primitive.".concat(t), nd(nf({}, e), ns({}, t, n))
            }, {});

            function ny(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nm(e, t) {
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
                }(e, t) || nb(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nb(e, t) {
                if (e) {
                    if ("string" == typeof e) return ny(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ny(e, t)
                }
            }
            var nv = "focusScope.autoFocusOnMount",
                nh = "focusScope.autoFocusOnUnmount",
                ng = {
                    bubbles: !1,
                    cancelable: !0
                },
                nO = Q.forwardRef(function(e, t) {
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
                        f = nm(Q.useState(null), 2),
                        d = f[0],
                        p = f[1],
                        y = r6(c),
                        m = r6(u),
                        b = Q.useRef(null),
                        v = tf(t, function(e) {
                            return p(e)
                        }),
                        h = Q.useRef({
                            paused: !1,
                            pause: function() {
                                this.paused = !0
                            },
                            resume: function() {
                                this.paused = !1
                            }
                        }).current;
                    Q.useEffect(function() {
                        if (l) {
                            var e = function(e) {
                                    if (!h.paused && d) {
                                        var t = e.target;
                                        d.contains(t) ? b.current = t : nx(b.current, {
                                            select: !0
                                        })
                                    }
                                },
                                t = function(e) {
                                    if (!h.paused && d) {
                                        var t = e.relatedTarget;
                                        null !== t && (d.contains(t) || nx(b.current, {
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
                                        for (var o, a = e[Symbol.iterator](); !(t = (o = a.next()).done); t = !0) o.value.removedNodes.length > 0 && nx(d)
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
                    }, [l, d, h.paused]), Q.useEffect(function() {
                        if (d) {
                            nS.add(h);
                            var e = document.activeElement;
                            if (!d.contains(e)) {
                                var t = new CustomEvent(nv, ng);
                                d.addEventListener(nv, y), d.dispatchEvent(t), t.defaultPrevented || (function(e) {
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
                                            if (nx(s, {
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
                                }(nw(d).filter(function(e) {
                                    return "A" !== e.tagName
                                }), {
                                    select: !0
                                }), document.activeElement === e && nx(d))
                            }
                            return function() {
                                d.removeEventListener(nv, y), setTimeout(function() {
                                    var t = new CustomEvent(nh, ng);
                                    d.addEventListener(nh, m), d.dispatchEvent(t), t.defaultPrevented || nx(null != e ? e : document.body, {
                                        select: !0
                                    }), d.removeEventListener(nh, m), nS.remove(h)
                                }, 0)
                            }
                        }
                    }, [d, y, m, h]);
                    var g = Q.useCallback(function(e) {
                        if ((a || l) && !h.paused) {
                            var t = "Tab" === e.key && !e.altKey && !e.ctrlKey && !e.metaKey,
                                r = document.activeElement;
                            if (t && r) {
                                var n, o, i = e.currentTarget,
                                    c = nm([nj(o = nw(n = i), n), nj(o.reverse(), n)], 2),
                                    u = c[0],
                                    s = c[1];
                                u && s ? e.shiftKey || r !== s ? e.shiftKey && r === u && (e.preventDefault(), a && nx(s, {
                                    select: !0
                                })) : (e.preventDefault(), a && nx(u, {
                                    select: !0
                                })) : r === i && e.preventDefault()
                            }
                        }
                    }, [a, l, h.paused]);
                    return (0, $.jsx)(np.div, (r = function(e) {
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

            function nw(e) {
                for (var t = [], r = document.createTreeWalker(e, NodeFilter.SHOW_ELEMENT, {
                        acceptNode: function(e) {
                            var t = "INPUT" === e.tagName && "hidden" === e.type;
                            return e.disabled || e.hidden || t ? NodeFilter.FILTER_SKIP : e.tabIndex >= 0 ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_SKIP
                        }
                    }); r.nextNode();) t.push(r.currentNode);
                return t
            }

            function nj(e, t) {
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

            function nx(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    r = t.select;
                if (e && e.focus) {
                    var n, o, a, i = document.activeElement;
                    e.focus({
                        preventScroll: !0
                    }), e !== i && (o = n = e, null != (a = HTMLInputElement) && "u" > typeof Symbol && a[Symbol.hasInstance] ? !!a[Symbol.hasInstance](o) : o instanceof a) && "select" in n && void 0 !== r && r && e.select()
                }
            }
            nO.displayName = "FocusScope";
            var nS = (t = [], {
                add: function(e) {
                    var r = t[0];
                    e !== r && (null == r || r.pause()), (t = nP(t, e)).unshift(e)
                },
                remove: function(e) {
                    var r;
                    null == (r = (t = nP(t, e))[0]) || r.resume()
                }
            });

            function nP(e, t) {
                var r = function(e) {
                        if (Array.isArray(e)) return ny(e)
                    }(e) || function(e) {
                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(e) || nb(e) || function() {
                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r.indexOf(t);
                return -1 !== n && r.splice(n, 1), r
            }

            function nE(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var nA = Q.forwardRef(function(e, t) {
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
                    }(r = Q.useState(!1)) || function(e) {
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
                            if ("string" == typeof e) return nE(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nE(e, 2)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    s = u[0],
                    f = u[1];
                rJ(function() {
                    return f(!0)
                }, []);
                var d = l || s && (null == (i = globalThis) || null == (a = i.document) ? void 0 : a.body);
                return d ? nt().createPortal((0, $.jsx)(np.div, (n = function(e) {
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

            function nC(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nI(e, t) {
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
                        if ("string" == typeof e) return nC(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nC(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            nA.displayName = "Portal";
            var nN = function(e) {
                var t, r, n, o, a, i, l, c, u, s, f, d, p, y, m, b, v, h = e.present,
                    g = e.children,
                    O = (t = h, a = (o = nI(Q.useState(), 2))[0], i = o[1], l = Q.useRef({}), c = Q.useRef(t), u = Q.useRef("none"), f = (s = nI((r = t ? "mounted" : "unmounted", n = {
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
                    }, Q.useReducer(function(e, t) {
                        var r = n[e][t];
                        return null != r ? r : e
                    }, r)), 2))[0], d = s[1], Q.useEffect(function() {
                        var e = nR(l.current);
                        u.current = "mounted" === f ? e : "none"
                    }, [f]), rJ(function() {
                        var e = l.current,
                            r = c.current;
                        if (r !== t) {
                            var n = u.current,
                                o = nR(e);
                            t ? d("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? d("UNMOUNT") : r && n !== o ? d("ANIMATION_OUT") : d("UNMOUNT"), c.current = t
                        }
                    }, [t, d]), rJ(function() {
                        if (a) {
                            var e, t, r = null != (e = a.ownerDocument.defaultView) ? e : window,
                                n = function(e) {
                                    var n = nR(l.current).includes(e.animationName);
                                    if (e.target === a && n && (d("ANIMATION_END"), !c.current)) {
                                        var o = a.style.animationFillMode;
                                        a.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                            "forwards" === a.style.animationFillMode && (a.style.animationFillMode = o)
                                        })
                                    }
                                },
                                o = function(e) {
                                    e.target === a && (u.current = nR(l.current))
                                };
                            return a.addEventListener("animationstart", o), a.addEventListener("animationcancel", n), a.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(t), a.removeEventListener("animationstart", o), a.removeEventListener("animationcancel", n), a.removeEventListener("animationend", n)
                                }
                        }
                        d("ANIMATION_END")
                    }, [a, d]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: Q.useCallback(function(e) {
                            e && (l.current = getComputedStyle(e)), i(e)
                        }, [])
                    }),
                    w = "function" == typeof g ? g({
                        present: O.isPresent
                    }) : Q.Children.only(g),
                    j = tf(O.ref, (v = (b = null == (y = Object.getOwnPropertyDescriptor((p = w).props, "ref")) ? void 0 : y.get) && "isReactWarning" in b && b.isReactWarning) ? p.ref : (v = (b = null == (m = Object.getOwnPropertyDescriptor(p, "ref")) ? void 0 : m.get) && "isReactWarning" in b && b.isReactWarning) ? p.props.ref : p.props.ref || p.ref);
                return "function" == typeof g || O.isPresent ? Q.cloneElement(w, {
                    ref: j
                }) : null
            };

            function nR(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }
            nN.displayName = "Presence";
            var nT = window.RadixUI["react-focus-guards"],
                nk = function() {
                    return (nk = Object.assign || function(e) {
                        for (var t, r = 1, n = arguments.length; r < n; r++)
                            for (var o in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }).apply(this, arguments)
                };

            function nD(e, t) {
                var r = {};
                for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && 0 > t.indexOf(n) && (r[n] = e[n]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols)
                    for (var o = 0, n = Object.getOwnPropertySymbols(e); o < n.length; o++) 0 > t.indexOf(n[o]) && Object.prototype.propertyIsEnumerable.call(e, n[o]) && (r[n[o]] = e[n[o]]);
                return r
            }
            var nM = "right-scroll-bar-position",
                nL = "width-before-scroll-bar";

            function n_(e, t) {
                return "function" == typeof e ? e(t) : e && (e.current = t), e
            }
            var nF = "u" > typeof window ? Q.useLayoutEffect : Q.useEffect,
                nU = new WeakMap,
                nz = (void 0 === a && (a = {}), (void 0 === i && (i = function(e) {
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
                }).options = nk({
                    async: !0,
                    ssr: !1
                }, a), u),
                nK = function() {},
                nH = Q.forwardRef(function(e, t) {
                    var r, n, o, a, i = Q.useRef(null),
                        l = Q.useState({
                            onScrollCapture: nK,
                            onWheelCapture: nK,
                            onTouchMoveCapture: nK
                        }),
                        c = l[0],
                        u = l[1],
                        s = e.forwardProps,
                        f = e.children,
                        d = e.className,
                        p = e.removeScrollBar,
                        y = e.enabled,
                        m = e.shards,
                        b = e.sideCar,
                        v = e.noRelative,
                        h = e.noIsolation,
                        g = e.inert,
                        O = e.allowPinchZoom,
                        w = e.as,
                        j = e.gapMode,
                        x = nD(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        S = (r = [i, t], n = function(e) {
                            return r.forEach(function(t) {
                                return n_(t, e)
                            })
                        }, (o = (0, Q.useState)(function() {
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
                        })[0]).callback = n, a = o.facade, nF(function() {
                            var e = nU.get(a);
                            if (e) {
                                var t = new Set(e),
                                    n = new Set(r),
                                    o = a.current;
                                t.forEach(function(e) {
                                    n.has(e) || n_(e, null)
                                }), n.forEach(function(e) {
                                    t.has(e) || n_(e, o)
                                })
                            }
                            nU.set(a, r)
                        }, [r]), a),
                        P = nk(nk({}, x), c);
                    return Q.createElement(Q.Fragment, null, y && Q.createElement(b, {
                        sideCar: nz,
                        removeScrollBar: p,
                        shards: m,
                        noRelative: v,
                        noIsolation: h,
                        inert: g,
                        setCallbacks: u,
                        allowPinchZoom: !!O,
                        lockRef: i,
                        gapMode: j
                    }), s ? Q.cloneElement(Q.Children.only(f), nk(nk({}, P), {
                        ref: S
                    })) : Q.createElement(void 0 === w ? "div" : w, nk({}, P, {
                        className: d,
                        ref: S
                    }), f))
                });
            nH.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, nH.classNames = {
                fullWidth: nL,
                zeroRight: nM
            };
            var nW = function(e) {
                var t = e.sideCar,
                    r = nD(e, ["sideCar"]);
                if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                var n = t.read();
                if (!n) throw Error("Sidecar medium not found");
                return Q.createElement(n, nk({}, r))
            };
            nW.isSideCarExport = !0;
            var nB = function() {
                    var e = 0,
                        t = null;
                    return {
                        add: function(n) {
                            if (0 == e && (t = function() {
                                    if (!document) return null;
                                    var e = document.createElement("style");
                                    e.type = "text/css";
                                    var t = V || r.nc;
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
                nV = function() {
                    var e = nB();
                    return function(t, r) {
                        Q.useEffect(function() {
                            return e.add(t),
                                function() {
                                    e.remove()
                                }
                        }, [t && r])
                    }
                },
                nq = function() {
                    var e = nV();
                    return function(t) {
                        return e(t.styles, t.dynamic), null
                    }
                },
                n$ = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                nX = function(e) {
                    return parseInt(e || "", 10) || 0
                },
                nG = function(e) {
                    var t = window.getComputedStyle(document.body),
                        r = t["padding" === e ? "paddingLeft" : "marginLeft"],
                        n = t["padding" === e ? "paddingTop" : "marginTop"],
                        o = t["padding" === e ? "paddingRight" : "marginRight"];
                    return [nX(r), nX(n), nX(o)]
                },
                nY = function(e) {
                    if (void 0 === e && (e = "margin"), "u" < typeof window) return n$;
                    var t = nG(e),
                        r = document.documentElement.clientWidth,
                        n = window.innerWidth;
                    return {
                        left: t[0],
                        top: t[1],
                        right: t[2],
                        gap: Math.max(0, n - r + t[2] - t[0])
                    }
                },
                nQ = nq(),
                nZ = "data-scroll-locked",
                nJ = function(e, t, r, n) {
                    var o = e.left,
                        a = e.top,
                        i = e.right,
                        l = e.gap;
                    return void 0 === r && (r = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(n, ";\n   padding-right: ").concat(l, "px ").concat(n, ";\n  }\n  body[").concat(nZ, "] {\n    overflow: hidden ").concat(n, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(n, ";"), "margin" === r && "\n    padding-left: ".concat(o, "px;\n    padding-top: ").concat(a, "px;\n    padding-right: ").concat(i, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(l, "px ").concat(n, ";\n    "), "padding" === r && "padding-right: ".concat(l, "px ").concat(n, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(nM, " {\n    right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(nL, " {\n    margin-right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(nM, " .").concat(nM, " {\n    right: 0 ").concat(n, ";\n  }\n  \n  .").concat(nL, " .").concat(nL, " {\n    margin-right: 0 ").concat(n, ";\n  }\n  \n  body[").concat(nZ, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(l, "px;\n  }\n")
                },
                n0 = function() {
                    var e = parseInt(document.body.getAttribute(nZ) || "0", 10);
                    return isFinite(e) ? e : 0
                },
                n1 = function() {
                    Q.useEffect(function() {
                        return document.body.setAttribute(nZ, (n0() + 1).toString()),
                            function() {
                                var e = n0() - 1;
                                e <= 0 ? document.body.removeAttribute(nZ) : document.body.setAttribute(nZ, e.toString())
                            }
                    }, [])
                },
                n2 = function(e) {
                    var t = e.noRelative,
                        r = e.noImportant,
                        n = e.gapMode,
                        o = void 0 === n ? "margin" : n;
                    n1();
                    var a = Q.useMemo(function() {
                        return nY(o)
                    }, [o]);
                    return Q.createElement(nQ, {
                        styles: nJ(a, !t, o, r ? "" : "!important")
                    })
                },
                n8 = !1;
            if ("u" > typeof window) try {
                var n3 = Object.defineProperty({}, "passive", {
                    get: function() {
                        return n8 = !0, !0
                    }
                });
                window.addEventListener("test", n3, n3), window.removeEventListener("test", n3, n3)
            } catch (e) {
                n8 = !1
            }
            var n6 = !!n8 && {
                passive: !1
            };

            function n5(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var n4 = function(e, t) {
                    if (!n5(e, Element)) return !1;
                    var r = window.getComputedStyle(e);
                    return "hidden" !== r[t] && (r.overflowY !== r.overflowX || "TEXTAREA" === e.tagName || "visible" !== r[t])
                },
                n7 = function(e, t) {
                    var r = t.ownerDocument,
                        n = t;
                    do {
                        if ("u" > typeof ShadowRoot && n5(n, ShadowRoot) && (n = n.host), n9(e, n)) {
                            var o = oe(e, n);
                            if (o[1] > o[2]) return !0
                        }
                        n = n.parentNode
                    } while (n && n !== r.body);
                    return !1
                },
                n9 = function(e, t) {
                    return "v" === e ? n4(t, "overflowY") : n4(t, "overflowX")
                },
                oe = function(e, t) {
                    return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
                },
                ot = function(e, t, r, n, o) {
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
                        var y = oe(e, c),
                            m = y[0],
                            b = y[1] - y[2] - i * m;
                        (m || b) && n9(e, c) && (d += b, p += m);
                        var v = c.parentNode;
                        c = v && v.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? v.host : v
                    } while (!u && c !== document.body || u && (t.contains(c) || t === c));
                    return f && (o && 1 > Math.abs(d) || !o && l > d) ? s = !0 : !f && (o && 1 > Math.abs(p) || !o && -l > p) && (s = !0), s
                },
                or = function(e) {
                    return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
                },
                on = function(e) {
                    return [e.deltaX, e.deltaY]
                },
                oo = function(e) {
                    return e && "current" in e ? e.current : e
                },
                oa = 0,
                oi = [],
                ol = (s = function(e) {
                    var t = Q.useRef([]),
                        r = Q.useRef([0, 0]),
                        n = Q.useRef(),
                        o = Q.useState(oa++)[0],
                        a = Q.useState(nq)[0],
                        i = Q.useRef(e);
                    Q.useEffect(function() {
                        i.current = e
                    }, [e]), Q.useEffect(function() {
                        if (e.inert) {
                            document.body.classList.add("block-interactivity-".concat(o));
                            var t = (function(e, t, r) {
                                if (r || 2 == arguments.length)
                                    for (var n, o = 0, a = t.length; o < a; o++) !n && o in t || (n || (n = Array.prototype.slice.call(t, 0, o)), n[o] = t[o]);
                                return e.concat(n || Array.prototype.slice.call(t))
                            })([e.lockRef.current], (e.shards || []).map(oo), !0).filter(Boolean);
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
                    var l = Q.useCallback(function(e, t) {
                            if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !i.current.allowPinchZoom;
                            var o, a = or(e),
                                l = r.current,
                                c = "deltaX" in e ? e.deltaX : l[0] - a[0],
                                u = "deltaY" in e ? e.deltaY : l[1] - a[1],
                                s = e.target,
                                f = Math.abs(c) > Math.abs(u) ? "h" : "v";
                            if ("touches" in e && "h" === f && "range" === s.type) return !1;
                            var d = n7(f, s);
                            if (!d) return !0;
                            if (d ? o = f : (o = "v" === f ? "h" : "v", d = n7(f, s)), !d) return !1;
                            if (!n.current && "changedTouches" in e && (c || u) && (n.current = o), !o) return !0;
                            var p = n.current || o;
                            return ot(p, t, e, "h" === p ? c : u, !0)
                        }, []),
                        c = Q.useCallback(function(e) {
                            if (oi.length && oi[oi.length - 1] === a) {
                                var r = "deltaY" in e ? on(e) : or(e),
                                    n = t.current.filter(function(t) {
                                        var n;
                                        return t.name === e.type && (t.target === e.target || e.target === t.shadowParent) && (n = t.delta, n[0] === r[0] && n[1] === r[1])
                                    })[0];
                                if (n && n.should) {
                                    e.cancelable && e.preventDefault();
                                    return
                                }
                                if (!n) {
                                    var o = (i.current.shards || []).map(oo).filter(Boolean).filter(function(t) {
                                        return t.contains(e.target)
                                    });
                                    (o.length > 0 ? l(e, o[0]) : !i.current.noIsolation) && e.cancelable && e.preventDefault()
                                }
                            }
                        }, []),
                        u = Q.useCallback(function(e, r, n, o) {
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
                        s = Q.useCallback(function(e) {
                            r.current = or(e), n.current = void 0
                        }, []),
                        f = Q.useCallback(function(t) {
                            u(t.type, on(t), t.target, l(t, e.lockRef.current))
                        }, []),
                        d = Q.useCallback(function(t) {
                            u(t.type, or(t), t.target, l(t, e.lockRef.current))
                        }, []);
                    Q.useEffect(function() {
                        return oi.push(a), e.setCallbacks({
                                onScrollCapture: f,
                                onWheelCapture: f,
                                onTouchMoveCapture: d
                            }), document.addEventListener("wheel", c, n6), document.addEventListener("touchmove", c, n6), document.addEventListener("touchstart", s, n6),
                            function() {
                                oi = oi.filter(function(e) {
                                    return e !== a
                                }), document.removeEventListener("wheel", c, n6), document.removeEventListener("touchmove", c, n6), document.removeEventListener("touchstart", s, n6)
                            }
                    }, []);
                    var p = e.removeScrollBar,
                        y = e.inert;
                    return Q.createElement(Q.Fragment, null, y ? Q.createElement(a, {
                        styles: "\n  .block-interactivity-".concat(o, " {pointer-events: none;}\n  .allow-interactivity-").concat(o, " {pointer-events: all;}\n")
                    }) : null, p ? Q.createElement(n2, {
                        noRelative: e.noRelative,
                        gapMode: e.gapMode
                    }) : null)
                }, nz.useMedium(s), nW),
                oc = Q.forwardRef(function(e, t) {
                    return Q.createElement(nH, nk({}, e, {
                        ref: t,
                        sideCar: ol
                    }))
                });
            oc.classNames = nH.classNames;
            var ou = new WeakMap,
                os = new WeakMap,
                of = {},
                od = 0,
                op = function(e) {
                    return e && (e.host || op(e.parentNode))
                },
                oy = function(e, t, r, n) {
                    var o = (Array.isArray(e) ? e : [e]).map(function(e) {
                        if (t.contains(e)) return e;
                        var r = op(e);
                        return r && t.contains(r) ? r : (console.error("aria-hidden", e, "in not contained inside", t, ". Doing nothing"), null)
                    }).filter(function(e) {
                        return !!e
                    });
                    of [r] || (of [r] = new WeakMap);
                    var a = of [r],
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
                                    c = (ou.get(e) || 0) + 1,
                                    u = (a.get(e) || 0) + 1;
                                ou.set(e, c), a.set(e, u), i.push(e), 1 === c && o && os.set(e, !0), 1 === u && e.setAttribute(r, "true"), o || e.setAttribute(n, "true")
                            } catch (t) {
                                console.error("aria-hidden: cannot operate on ", e, t)
                            }
                        })
                    };
                    return s(t), l.clear(), od++,
                        function() {
                            i.forEach(function(e) {
                                var t = ou.get(e) - 1,
                                    o = a.get(e) - 1;
                                ou.set(e, t), a.set(e, o), t || (os.has(e) || e.removeAttribute(n), os.delete(e)), o || e.removeAttribute(r)
                            }), --od || (ou = new WeakMap, ou = new WeakMap, os = new WeakMap, of = {})
                        }
                },
                om = function(e, t, r) {
                    void 0 === r && (r = "data-aria-hidden");
                    var n = Array.from(Array.isArray(e) ? e : [e]),
                        o = t || ("u" < typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body);
                    return o ? (n.push.apply(n, Array.from(o.querySelectorAll("[aria-live], script"))), oy(n, o, r, "aria-hidden")) : function() {
                        return null
                    }
                };

            function ob(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ov(e) {
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

            function oh(e, t) {
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

            function og(e, t) {
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

            function oO(e, t) {
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
                        if ("string" == typeof e) return ob(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ob(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var ow = "Dialog",
                oj = oO(rQ(ow), 2),
                ox = oj[0];
            oj[1];
            var oS = oO(ox(ow), 2),
                oP = oS[0],
                oE = oS[1],
                oA = function(e) {
                    var t = e.__scopeDialog,
                        r = e.children,
                        n = e.open,
                        o = e.defaultOpen,
                        a = e.onOpenChange,
                        i = e.modal,
                        l = Q.useRef(null),
                        c = Q.useRef(null),
                        u = oO(r7({
                            prop: n,
                            defaultProp: o,
                            onChange: a
                        }), 2),
                        s = u[0],
                        f = u[1];
                    return (0, $.jsx)(oP, {
                        scope: t,
                        triggerRef: l,
                        contentRef: c,
                        contentId: r8(),
                        titleId: r8(),
                        descriptionId: r8(),
                        open: void 0 !== s && s,
                        onOpenChange: f,
                        onOpenToggle: Q.useCallback(function() {
                            return f(function(e) {
                                return !e
                            })
                        }, [f]),
                        modal: void 0 === i || i,
                        children: r
                    })
                };
            oA.displayName = ow;
            var oC = "DialogTrigger";
            Q.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = og(e, ["__scopeDialog"]),
                    o = oE(oC, r),
                    a = tf(t, o.triggerRef);
                return (0, $.jsx)(np.button, oh(ov({
                    type: "button",
                    "aria-haspopup": "dialog",
                    "aria-expanded": o.open,
                    "aria-controls": o.contentId,
                    "data-state": oG(o.open)
                }, n), {
                    ref: a,
                    onClick: rV(e.onClick, o.onOpenToggle)
                }))
            }).displayName = oC;
            var oI = "DialogPortal",
                oN = oO(ox(oI, {
                    forceMount: void 0
                }), 2),
                oR = oN[0],
                oT = oN[1],
                ok = function(e) {
                    var t = e.__scopeDialog,
                        r = e.forceMount,
                        n = e.children,
                        o = e.container,
                        a = oE(oI, t);
                    return (0, $.jsx)(oR, {
                        scope: t,
                        forceMount: r,
                        children: Q.Children.map(n, function(e) {
                            return (0, $.jsx)(nN, {
                                present: r || a.open,
                                children: (0, $.jsx)(nA, {
                                    asChild: !0,
                                    container: o,
                                    children: e
                                })
                            })
                        })
                    })
                };
            ok.displayName = oI;
            var oD = "DialogOverlay",
                oM = Q.forwardRef(function(e, t) {
                    var r = oT(oD, e.__scopeDialog),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        a = og(e, ["forceMount"]),
                        i = oE(oD, e.__scopeDialog);
                    return i.modal ? (0, $.jsx)(nN, {
                        present: o || i.open,
                        children: (0, $.jsx)(o_, oh(ov({}, a), {
                            ref: t
                        }))
                    }) : null
                });
            oM.displayName = oD;
            var oL = nl("DialogOverlay.RemoveScroll"),
                o_ = Q.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = og(e, ["__scopeDialog"]),
                        o = oE(oD, r);
                    return (0, $.jsx)(oc, {
                        as: oL,
                        allowPinchZoom: !0,
                        shards: [o.contentRef],
                        children: (0, $.jsx)(np.div, oh(ov({
                            "data-state": oG(o.open)
                        }, n), {
                            ref: t,
                            style: ov({
                                pointerEvents: "auto"
                            }, n.style)
                        }))
                    })
                }),
                oF = "DialogContent",
                oU = Q.forwardRef(function(e, t) {
                    var r = oT(oF, e.__scopeDialog),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        a = og(e, ["forceMount"]),
                        i = oE(oF, e.__scopeDialog);
                    return (0, $.jsx)(nN, {
                        present: o || i.open,
                        children: i.modal ? (0, $.jsx)(oz, oh(ov({}, a), {
                            ref: t
                        })) : (0, $.jsx)(oK, oh(ov({}, a), {
                            ref: t
                        }))
                    })
                });
            oU.displayName = oF;
            var oz = Q.forwardRef(function(e, t) {
                    var r = oE(oF, e.__scopeDialog),
                        n = Q.useRef(null),
                        o = tf(t, r.contentRef, n);
                    return Q.useEffect(function() {
                        var e = n.current;
                        if (e) return om(e)
                    }, []), (0, $.jsx)(oH, oh(ov({}, e), {
                        ref: o,
                        trapFocus: r.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: rV(e.onCloseAutoFocus, function(e) {
                            var t;
                            e.preventDefault(), null == (t = r.triggerRef.current) || t.focus()
                        }),
                        onPointerDownOutside: rV(e.onPointerDownOutside, function(e) {
                            var t = e.detail.originalEvent,
                                r = 0 === t.button && !0 === t.ctrlKey;
                            (2 === t.button || r) && e.preventDefault()
                        }),
                        onFocusOutside: rV(e.onFocusOutside, function(e) {
                            return e.preventDefault()
                        })
                    }))
                }),
                oK = Q.forwardRef(function(e, t) {
                    var r = oE(oF, e.__scopeDialog),
                        n = Q.useRef(!1),
                        o = Q.useRef(!1);
                    return (0, $.jsx)(oH, oh(ov({}, e), {
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
                oH = Q.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = e.trapFocus,
                        o = e.onOpenAutoFocus,
                        a = e.onCloseAutoFocus,
                        i = og(e, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        l = oE(oF, r),
                        c = Q.useRef(null),
                        u = tf(t, c);
                    return (0, nT.useFocusGuards)(), (0, $.jsxs)($.Fragment, {
                        children: [(0, $.jsx)(nO, {
                            asChild: !0,
                            loop: !0,
                            trapped: n,
                            onMountAutoFocus: o,
                            onUnmountAutoFocus: a,
                            children: (0, $.jsx)(r9.DismissableLayer, oh(ov({
                                role: "dialog",
                                id: l.contentId,
                                "aria-describedby": l.descriptionId,
                                "aria-labelledby": l.titleId,
                                "data-state": oG(l.open)
                            }, i), {
                                ref: u,
                                onDismiss: function() {
                                    return l.onOpenChange(!1)
                                }
                            }))
                        }), (0, $.jsxs)($.Fragment, {
                            children: [(0, $.jsx)(oJ, {
                                titleId: l.titleId
                            }), (0, $.jsx)(o0, {
                                contentRef: c,
                                descriptionId: l.descriptionId
                            })]
                        })]
                    })
                }),
                oW = "DialogTitle",
                oB = Q.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = og(e, ["__scopeDialog"]),
                        o = oE(oW, r);
                    return (0, $.jsx)(np.h2, oh(ov({
                        id: o.titleId
                    }, n), {
                        ref: t
                    }))
                });
            oB.displayName = oW;
            var oV = "DialogDescription",
                oq = Q.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = og(e, ["__scopeDialog"]),
                        o = oE(oV, r);
                    return (0, $.jsx)(np.p, oh(ov({
                        id: o.descriptionId
                    }, n), {
                        ref: t
                    }))
                });
            oq.displayName = oV;
            var o$ = "DialogClose",
                oX = Q.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = og(e, ["__scopeDialog"]),
                        o = oE(o$, r);
                    return (0, $.jsx)(np.button, oh(ov({
                        type: "button"
                    }, n), {
                        ref: t,
                        onClick: rV(e.onClick, function() {
                            return o.onOpenChange(!1)
                        })
                    }))
                });

            function oG(e) {
                return e ? "open" : "closed"
            }
            oX.displayName = o$;
            var oY = "DialogTitleWarning",
                oQ = oO((f = {
                    contentName: oF,
                    titleName: oW,
                    docsSlug: "dialog"
                }, d = Q.createContext(f), (p = function(e) {
                    var t = e.children,
                        r = rG(e, ["children"]),
                        n = Q.useMemo(function() {
                            return r
                        }, Object.values(r));
                    return (0, $.jsx)(d.Provider, {
                        value: n,
                        children: t
                    })
                }).displayName = oY + "Provider", [p, function(e) {
                    var t = Q.useContext(d);
                    if (t) return t;
                    if (void 0 !== f) return f;
                    throw Error("`".concat(e, "` must be used within `").concat(oY, "`"))
                }]), 2),
                oZ = (oQ[0], oQ[1]),
                oJ = function(e) {
                    var t = e.titleId,
                        r = oZ(oY),
                        n = "`".concat(r.contentName, "` requires a `").concat(r.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(r.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(r.docsSlug);
                    return Q.useEffect(function() {
                        t && (document.getElementById(t) || console.error(n))
                    }, [n, t]), null
                },
                o0 = function(e) {
                    var t = e.contentRef,
                        r = e.descriptionId,
                        n = oZ("DialogDescriptionWarning"),
                        o = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(n.contentName, "}.");
                    return Q.useEffect(function() {
                        var e, n = null == (e = t.current) ? void 0 : e.getAttribute("aria-describedby");
                        r && n && (document.getElementById(r) || console.warn(o))
                    }, [o, t, r]), null
                };

            function o1(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function o2(e) {
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

            function o8(e, t) {
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

            function o3(e, t) {
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

            function o6(e) {
                return function(e) {
                    if (Array.isArray(e)) return o1(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return o1(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return o1(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function o5(e) {
                var t, r, n = (t = e, (r = Q.forwardRef(function(e, t) {
                        var r = e.children,
                            n = o3(e, ["children"]);
                        if (Q.isValidElement(r)) {
                            var o, a, i, l, c, u = (c = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                s = function(e, t) {
                                    var r = o2({}, t);
                                    for (var n in t) ! function(n) {
                                        var o = e[n],
                                            a = t[n];
                                        /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            var n = a.apply(void 0, o6(t));
                                            return o.apply(void 0, o6(t)), n
                                        } : o && (r[n] = o) : "style" === n ? r[n] = o2({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                                    }(n);
                                    return o2({}, e, r)
                                }(n, r.props);
                            return r.type !== Q.Fragment && (s.ref = t ? ts(t, u) : u), Q.cloneElement(r, s)
                        }
                        return Q.Children.count(r) > 1 ? Q.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), r),
                    o = Q.forwardRef(function(e, t) {
                        var r = e.children,
                            o = o3(e, ["children"]),
                            a = Q.Children.toArray(r),
                            i = a.find(o7);
                        if (i) {
                            var l = i.props.children,
                                c = a.map(function(e) {
                                    return e !== i ? e : Q.Children.count(l) > 1 ? Q.Children.only(null) : Q.isValidElement(l) ? l.props.children : null
                                });
                            return (0, $.jsx)(n, o8(o2({}, o), {
                                ref: t,
                                children: Q.isValidElement(l) ? Q.cloneElement(l, void 0, c) : null
                            }))
                        }
                        return (0, $.jsx)(n, o8(o2({}, o), {
                            ref: t,
                            children: r
                        }))
                    });
                return o.displayName = "".concat(e, ".Slot"), o
            }
            var o4 = Symbol("radix.slottable");

            function o7(e) {
                return Q.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === o4
            }

            function o9(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function ae(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        o9(e, t, r[t])
                    })
                }
                return e
            }

            function at(e, t) {
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
            var ar = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
                var r = o5("Primitive.".concat(t)),
                    n = Q.forwardRef(function(e, n) {
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
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, $.jsx)(i, at(ae({}, a), {
                            ref: n
                        }))
                    });
                return n.displayName = "Primitive.".concat(t), at(ae({}, e), o9({}, t, n))
            }, {});

            function an(e) {
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
            var ao = Object.freeze({
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
                aa = Q.forwardRef(function(e, t) {
                    var r, n;
                    return (0, $.jsx)(ar.span, (r = an({}, e), n = n = {
                        ref: t,
                        style: an({}, ao, e.style)
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

            function ai(e) {
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

            function al(e, t) {
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
            aa.displayName = "VisuallyHidden";
            var ac = (0, Q.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    hasDescription: !1,
                    type: "Default"
                }),
                au = function() {
                    var e = (0, Q.useContext)(ac);
                    if (!e) throw Error("Dialog components must be used within a Dialog");
                    return e
                },
                as = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                af = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                ad = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                ap = function(e) {
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
                        y = e.hasDescription,
                        m = void 0 !== y && y,
                        b = e.experimentalDisablePointerEventsStylingOnBody,
                        v = void 0 !== b && b,
                        h = (0, Q.useMemo)(function() {
                            return {
                                size: o,
                                isModal: l,
                                type: i,
                                hasCloseAffordance: c,
                                closeLabel: u,
                                hasMarginTop: f,
                                hasMarginBottom: p,
                                hasDescription: m
                            }
                        }, [o, l, i, c, u, f, p, m]);
                    return (0, Q.useEffect)(function() {
                        v && setTimeout(function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }, 0)
                    }, [v, t]), Z().createElement(ac.Provider, {
                        value: h
                    }, Z().createElement(oA, {
                        open: t,
                        onOpenChange: r
                    }, n))
                };
            ap.displayName = "Dialog";
            var ay = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.style,
                    o = e.overlayClassName,
                    a = e.overlayStyle,
                    i = e.onOpenAutoFocus,
                    l = al(e, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
                    c = au(),
                    u = c.size,
                    s = c.isModal,
                    f = c.hasCloseAffordance,
                    d = c.closeLabel,
                    p = c.hasDescription,
                    y = to("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", s && "bg-common-backdrop", o),
                    m = to("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", r);
                return Z().createElement(ok, null, Z().createElement(oM, {
                    className: y,
                    style: a
                }, Z().createElement(oU, ai({
                    className: m,
                    "data-size": u,
                    style: n,
                    onOpenAutoFocus: i
                }, !p && {
                    "aria-describedby": void 0
                }, l), f && Z().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, Z().createElement(oX, {
                    asChild: !0
                }, Z().createElement(rB, {
                    variant: "OverMedia",
                    size: u,
                    isCircular: !0,
                    "aria-label": d
                }))), t)))
            };
            ay.displayName = "DialogContent";
            var am = function(e) {
                var t = e.children,
                    r = e.className,
                    n = al(e, ["children", "className"]),
                    o = au(),
                    a = o.size,
                    i = o.hasMarginTop,
                    l = o.hasMarginBottom,
                    c = to(as[a], i && af[a], l && ad[a], r);
                return Z().createElement("div", ai({
                    className: c
                }, n), t)
            };
            am.displayName = "DialogBody";
            var ab = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.hidden,
                    o = al(e, ["children", "className", "hidden"]),
                    a = Z().createElement(oB, ai({
                        className: r
                    }, o), t);
                return n ? Z().createElement(aa, null, a) : a
            };
            ab.displayName = "DialogTitle";
            var av = function(e) {
                var t = e.children,
                    r = e.className,
                    n = al(e, ["children", "className"]),
                    o = au().size,
                    a = to(as[o], ad[o], r);
                return Z().createElement("div", ai({
                    className: a
                }, n), t)
            };
            av.displayName = "DialogFooter";
            var ah = function(e) {
                var t = e.width,
                    r = e.height;
                return Z().createElement("svg", {
                    className: "foundation-web-loading-spinner",
                    width: t,
                    height: r,
                    viewBox: "0 0 20 20",
                    fill: "none",
                    xmlns: "http://www.w3.org/2000/svg"
                }, Z().createElement("path", {
                    fillRule: "evenodd",
                    clipRule: "evenodd",
                    fill: "currentColor",
                    d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                }))
            };

            function ag(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aO(e) {
                if (Array.isArray(e)) return e
            }

            function aw() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
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

            function ax(e, t) {
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

            function aS(e, t) {
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

            function aP(e, t) {
                if (e) {
                    if ("string" == typeof e) return ag(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ag(e, t)
                }
            }
            var aE = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                aA = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                aC = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                aI = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                aN = (0, Q.forwardRef)(function(e, t) {
                    var r, n = aO(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || aP(r) || aw(),
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
                        y = o.size,
                        m = void 0 === y ? "Large" : y,
                        b = o.variant,
                        v = void 0 === b ? "Emphasis" : b,
                        h = o.asChild,
                        g = aS(o, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        O = (aO(a) || function(e) {
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
                        }(a) || aP(a, 1) || aw())[0],
                        w = to("foundation-web-button", s ? tl : [ta, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", aA[m], s ? aI[v] : aC[v], l),
                        j = aj({
                            textDecoration: "none"
                        }, c),
                        x = function(e) {
                            return Z().createElement(Z().Fragment, null, Z().createElement(ti, null), d && Z().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, Z().createElement(ah, {
                                width: aE[m],
                                height: aE[m]
                            })), Z().createElement("span", {
                                className: to("flex items-center min-width-0", "Large" === m || "Medium" === m ? "gap-small" : "gap-xsmall", d && "invisible")
                            }, p && Z().createElement(ra, {
                                name: p,
                                size: m
                            }), Z().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (h) {
                        g.as;
                        var S = aS(g, ["as"]),
                            P = Z().Children.only(i);
                        return Z().createElement(tw, ax(aj({
                            ref: O
                        }, S), {
                            className: w,
                            style: j,
                            "aria-disabled": s || void 0
                        }), Z().cloneElement(P, {}, x(P.props.children)))
                    }
                    if ("a" === g.as) {
                        g.as;
                        var E = g.href,
                            A = aS(g, ["as", "href"]);
                        return Z().createElement("a", ax(aj({
                            ref: O
                        }, A), {
                            "aria-disabled": s,
                            href: s ? void 0 : E,
                            className: w,
                            style: j
                        }), x(i))
                    }
                    g.as;
                    var C = aS(g, ["as"]);
                    return Z().createElement("button", ax(aj({
                        ref: O,
                        type: "button"
                    }, C), {
                        disabled: s,
                        className: w,
                        style: j
                    }), x(i))
                }),
                aR = function(e) {
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
                    return (0, $.jsx)(ap, {
                        open: t,
                        onOpenChange: function(e) {
                            e || f()
                        },
                        size: "Medium",
                        isModal: !0,
                        hasCloseAffordance: !0,
                        closeLabel: u,
                        children: (0, $.jsxs)(ay, {
                            style: {
                                width: "100%"
                            },
                            children: [(0, $.jsxs)(am, {
                                children: [(0, $.jsx)(ab, {
                                    children: r
                                }), (0, $.jsx)("div", {
                                    className: "text-content-emphasis",
                                    children: n
                                })]
                            }), (0, $.jsxs)(av, {
                                children: [(0, $.jsxs)("div", {
                                    className: "flex gap-x-small",
                                    children: [(void 0 === c || c) && (0, $.jsx)(aN, {
                                        variant: void 0 === i ? "Emphasis" : i,
                                        size: "Medium",
                                        className: "fill basis-0",
                                        onClick: function() {
                                            null == s || s()
                                        },
                                        children: a
                                    }), (0, $.jsx)(aN, {
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

            function aT(e) {
                var t = e.className;
                return Z().createElement("svg", {
                    xmlns: "http://www.w3.org/2000/svg",
                    width: "13",
                    height: "6",
                    viewBox: "0 0 13 6",
                    fill: "none",
                    className: to("block", t),
                    style: {
                        marginTop: -1
                    }
                }, Z().createElement("path", {
                    d: "M0.249999 0.666628L4.83579 5.25241C5.61683 6.03346 6.88316 6.03346 7.66421 5.25241L12.25 0.666626L0.249999 0.666628Z",
                    fill: "currentColor"
                }))
            }

            function ak(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    o = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === o || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function aD(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aM(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function aL() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map(function(t) {
                            var n = aM(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        });
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : aM(t[e], null)
                        }
                    }
                }
            }

            function a_() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return Q.useCallback(aL.apply(void 0, function(e) {
                    if (Array.isArray(e)) return aD(e)
                }(t) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return aD(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return aD(e, void 0)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function aF(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aU(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function az(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        aU(e, t, r[t])
                    })
                }
                return e
            }

            function aK(e) {
                return function(e) {
                    if (Array.isArray(e)) return aF(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return aF(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return aF(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function aH(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    r = [],
                    n = function() {
                        var t = r.map(function(e) {
                            return Q.createContext(e)
                        });
                        return function(r) {
                            var n = (null == r ? void 0 : r[e]) || t;
                            return Q.useMemo(function() {
                                var t, o;
                                return aU({}, "__scope".concat(e), (t = az({}, r), o = null != (o = aU({}, e, n)) ? o : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(o)) : (function(e) {
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
                    var o = Q.createContext(n),
                        a = r.length;
                    r = aK(r).concat([n]);
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
                            u = Q.useMemo(function() {
                                return l
                            }, Object.values(l));
                        return (0, $.jsx)(c.Provider, {
                            value: u,
                            children: i
                        })
                    };
                    return i.displayName = t + "Provider", [i, function(r, i) {
                        var l, c = (null == i || null == (l = i[e]) ? void 0 : l[a]) || o,
                            u = Q.useContext(c);
                        if (u) return u;
                        if (void 0 !== n) return n;
                        throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                    }]
                }, aW.apply(void 0, [n].concat(aK(t)))]
            }

            function aW() {
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
                            return az({}, e, n(t)["__scope".concat(o)])
                        }, {});
                        return Q.useMemo(function() {
                            return aU({}, "__scope".concat(n.scopeName), r)
                        }, [r])
                    }
                };
                return o.scopeName = n.scopeName, o
            }
            var aB = (null == (q = globalThis) ? void 0 : q.document) ? Q.useLayoutEffect : function() {};

            function aV(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var aq = Q["useId".toString()] || function() {},
                a$ = 0,
                aX = ["top", "right", "bottom", "left"],
                aG = Math.min,
                aY = Math.max,
                aQ = Math.round,
                aZ = Math.floor,
                aJ = function(e) {
                    return {
                        x: e,
                        y: e
                    }
                },
                a0 = {
                    left: "right",
                    right: "left",
                    bottom: "top",
                    top: "bottom"
                },
                a1 = {
                    start: "end",
                    end: "start"
                };

            function a2(e, t) {
                return "function" == typeof e ? e(t) : e
            }

            function a8(e) {
                return e.split("-")[0]
            }

            function a3(e) {
                return e.split("-")[1]
            }

            function a6(e) {
                return "x" === e ? "y" : "x"
            }

            function a5(e) {
                return "y" === e ? "height" : "width"
            }
            var a4 = new Set(["top", "bottom"]);

            function a7(e) {
                return a4.has(a8(e)) ? "y" : "x"
            }

            function a9(e) {
                return e.replace(/start|end/g, function(e) {
                    return a1[e]
                })
            }
            var ie = ["left", "right"],
                it = ["right", "left"],
                ir = ["top", "bottom"],
                io = ["bottom", "top"];

            function ia(e) {
                return e.replace(/left|right|bottom|top/g, function(e) {
                    return a0[e]
                })
            }

            function ii(e) {
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

            function il(e) {
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

            function ic(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iu(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function is(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            iu(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            iu(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function id(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function ip(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        id(e, t, r[t])
                    })
                }
                return e
            }

            function iy(e, t) {
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

            function im(e, t) {
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

            function ib(e) {
                return function(e) {
                    if (Array.isArray(e)) return ic(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return ic(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ic(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function iv(e, t) {
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

            function ih(e, t, r) {
                var n, o = e.reference,
                    a = e.floating,
                    i = a7(t),
                    l = a6(a7(t)),
                    c = a5(l),
                    u = a8(t),
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
                switch (a3(t)) {
                    case "start":
                        n[l] -= p * (r && s ? -1 : 1);
                        break;
                    case "end":
                        n[l] += p * (r && s ? -1 : 1)
                }
                return n
            }

            function ig(e, t) {
                return is(function() {
                    var r, n, o, a, i, l, c, u, s, f, d, p, y, m, b, v, h, g, O, w, j, x, S, P, E, A, C, I, N, R, T;
                    return iv(this, function(k) {
                        switch (k.label) {
                            case 0:
                                return void 0 === t && (t = {}), n = e.x, o = e.y, a = e.platform, i = e.rects, l = e.elements, c = e.strategy, f = void 0 === (s = (u = a2(t, e)).boundary) ? "clippingAncestors" : s, p = void 0 === (d = u.rootBoundary) ? "viewport" : d, m = void 0 === (y = u.elementContext) ? "floating" : y, v = void 0 !== (b = u.altBoundary) && b, g = ii(void 0 === (h = u.padding) ? 0 : h), O = "floating" === m ? "reference" : "floating", w = l[v ? O : m], x = a.getClippingRect, S = {}, [4, null == a.isElement ? void 0 : a.isElement(w)];
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
                                return j = il.apply(void 0, [k.sent()]), A = "floating" === m ? {
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
                                return R = il.apply(void 0, [T]), [2, {
                                    top: (j.top - R.top + g.top) / I.y,
                                    bottom: (R.bottom - j.bottom + g.bottom) / I.y,
                                    left: (j.left - R.left + g.left) / I.x,
                                    right: (R.right - j.right + g.right) / I.x
                                }]
                        }
                    })
                })()
            }

            function iO(e, t) {
                return {
                    top: e.top - t.height,
                    right: e.right - t.width,
                    bottom: e.bottom - t.height,
                    left: e.left - t.width
                }
            }

            function iw(e) {
                return aX.some(function(t) {
                    return e[t] >= 0
                })
            }
            var ij = new Set(["left", "top"]);

            function ix(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function iS() {
                return "u" > typeof window
            }

            function iP(e) {
                return iC(e) ? (e.nodeName || "").toLowerCase() : "#document"
            }

            function iE(e) {
                var t;
                return (null == e || null == (t = e.ownerDocument) ? void 0 : t.defaultView) || window
            }

            function iA(e) {
                var t;
                return null == (t = (iC(e) ? e.ownerDocument : e.document) || window.document) ? void 0 : t.documentElement
            }

            function iC(e) {
                return !!iS() && (ix(e, Node) || ix(e, iE(e).Node))
            }

            function iI(e) {
                return !!iS() && (ix(e, Element) || ix(e, iE(e).Element))
            }

            function iN(e) {
                return !!iS() && (ix(e, HTMLElement) || ix(e, iE(e).HTMLElement))
            }

            function iR(e) {
                return !(!iS() || "u" < typeof ShadowRoot) && (ix(e, ShadowRoot) || ix(e, iE(e).ShadowRoot))
            }
            var iT = new Set(["inline", "contents"]);

            function ik(e) {
                var t = iB(e),
                    r = t.overflow,
                    n = t.overflowX,
                    o = t.overflowY,
                    a = t.display;
                return /auto|scroll|overlay|hidden|clip/.test(r + o + n) && !iT.has(a)
            }
            var iD = new Set(["table", "td", "th"]),
                iM = [":popover-open", ":modal"];

            function iL(e) {
                return iM.some(function(t) {
                    try {
                        return e.matches(t)
                    } catch (e) {
                        return !1
                    }
                })
            }
            var i_ = ["transform", "translate", "scale", "rotate", "perspective"],
                iF = ["transform", "translate", "scale", "rotate", "perspective", "filter"],
                iU = ["paint", "layout", "strict", "content"];

            function iz(e) {
                var t = iK(),
                    r = iI(e) ? iB(e) : e;
                return i_.some(function(e) {
                    return !!r[e] && "none" !== r[e]
                }) || !!r.containerType && "normal" !== r.containerType || !t && !!r.backdropFilter && "none" !== r.backdropFilter || !t && !!r.filter && "none" !== r.filter || iF.some(function(e) {
                    return (r.willChange || "").includes(e)
                }) || iU.some(function(e) {
                    return (r.contain || "").includes(e)
                })
            }

            function iK() {
                return !("u" < typeof CSS) && !!CSS.supports && CSS.supports("-webkit-backdrop-filter", "none")
            }
            var iH = new Set(["html", "body", "#document"]);

            function iW(e) {
                return iH.has(iP(e))
            }

            function iB(e) {
                return iE(e).getComputedStyle(e)
            }

            function iV(e) {
                return iI(e) ? {
                    scrollLeft: e.scrollLeft,
                    scrollTop: e.scrollTop
                } : {
                    scrollLeft: e.scrollX,
                    scrollTop: e.scrollY
                }
            }

            function iq(e) {
                if ("html" === iP(e)) return e;
                var t = e.assignedSlot || e.parentNode || iR(e) && e.host || iA(e);
                return iR(t) ? t.host : t
            }

            function i$(e, t, r) {
                void 0 === t && (t = []), void 0 === r && (r = !0);
                var n, o = function e(t) {
                        var r = iq(t);
                        return iW(r) ? t.ownerDocument ? t.ownerDocument.body : t.body : iN(r) && ik(r) ? r : e(r)
                    }(e),
                    a = o === (null == (n = e.ownerDocument) ? void 0 : n.body),
                    i = iE(o);
                if (a) {
                    var l = iX(i);
                    return t.concat(i, i.visualViewport || [], ik(o) ? o : [], l && r ? i$(l) : [])
                }
                return t.concat(o, i$(o, [], r))
            }

            function iX(e) {
                return e.parent && Object.getPrototypeOf(e.parent) ? e.frameElement : null
            }

            function iG(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iY(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function iQ(e) {
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

            function iZ(e, t) {
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

            function iJ(e) {
                return function(e) {
                    if (Array.isArray(e)) return iG(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || i0(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function i0(e, t) {
                if (e) {
                    if ("string" == typeof e) return iG(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return iG(e, t)
                }
            }

            function i1(e) {
                var t = iB(e),
                    r = parseFloat(t.width) || 0,
                    n = parseFloat(t.height) || 0,
                    o = iN(e),
                    a = o ? e.offsetWidth : r,
                    i = o ? e.offsetHeight : n,
                    l = aQ(r) !== a || aQ(n) !== i;
                return l && (r = a, n = i), {
                    width: r,
                    height: n,
                    $: l
                }
            }

            function i2(e) {
                return iI(e) ? e : e.contextElement
            }

            function i8(e) {
                var t = i2(e);
                if (!iN(t)) return aJ(1);
                var r = t.getBoundingClientRect(),
                    n = i1(t),
                    o = n.width,
                    a = n.height,
                    i = n.$,
                    l = (i ? aQ(r.width) : r.width) / o,
                    c = (i ? aQ(r.height) : r.height) / a;
                return l && Number.isFinite(l) || (l = 1), c && Number.isFinite(c) || (c = 1), {
                    x: l,
                    y: c
                }
            }
            var i3 = aJ(0);

            function i6(e) {
                var t = iE(e);
                return iK() && t.visualViewport ? {
                    x: t.visualViewport.offsetLeft,
                    y: t.visualViewport.offsetTop
                } : i3
            }

            function i5(e, t, r, n) {
                void 0 === t && (t = !1), void 0 === r && (r = !1);
                var o, a = e.getBoundingClientRect(),
                    i = i2(e),
                    l = aJ(1);
                t && (n ? iI(n) && (l = i8(n)) : l = i8(e));
                var c = (void 0 === (o = r) && (o = !1), n && (!o || n === iE(i)) && o) ? i6(i) : aJ(0),
                    u = (a.left + c.x) / l.x,
                    s = (a.top + c.y) / l.y,
                    f = a.width / l.x,
                    d = a.height / l.y;
                if (i)
                    for (var p = iE(i), y = n && iI(n) ? iE(n) : n, m = p, b = iX(m); b && n && y !== m;) {
                        var v = i8(b),
                            h = b.getBoundingClientRect(),
                            g = iB(b),
                            O = h.left + (b.clientLeft + parseFloat(g.paddingLeft)) * v.x,
                            w = h.top + (b.clientTop + parseFloat(g.paddingTop)) * v.y;
                        u *= v.x, s *= v.y, f *= v.x, d *= v.y, u += O, s += w, b = iX(m = iE(b))
                    }
                return il({
                    width: f,
                    height: d,
                    x: u,
                    y: s
                })
            }

            function i4(e, t) {
                var r = iV(e).scrollLeft;
                return t ? t.left + r : i5(iA(e)).left + r
            }

            function i7(e, t) {
                var r = e.getBoundingClientRect();
                return {
                    x: r.left + t.scrollLeft - i4(e, r),
                    y: r.top + t.scrollTop
                }
            }
            var i9 = new Set(["absolute", "fixed"]);

            function le(e, t, r) {
                if ("viewport" === t) n = function(e, t) {
                    var r = iE(e),
                        n = iA(e),
                        o = r.visualViewport,
                        a = n.clientWidth,
                        i = n.clientHeight,
                        l = 0,
                        c = 0;
                    if (o) {
                        a = o.width, i = o.height;
                        var u = iK();
                        (!u || u && "fixed" === t) && (l = o.offsetLeft, c = o.offsetTop)
                    }
                    var s = i4(n);
                    if (s <= 0) {
                        var f = n.ownerDocument,
                            d = f.body,
                            p = getComputedStyle(d),
                            y = "CSS1Compat" === f.compatMode && parseFloat(p.marginLeft) + parseFloat(p.marginRight) || 0,
                            m = Math.abs(n.clientWidth - d.clientWidth - y);
                        m <= 25 && (a -= m)
                    } else s <= 25 && (a += s);
                    return {
                        width: a,
                        height: i,
                        x: l,
                        y: c
                    }
                }(e, r);
                else if ("document" === t) o = iA(e), a = iA(o), i = iV(o), l = o.ownerDocument.body, c = aY(a.scrollWidth, a.clientWidth, l.scrollWidth, l.clientWidth), u = aY(a.scrollHeight, a.clientHeight, l.scrollHeight, l.clientHeight), s = -i.scrollLeft + i4(o), f = -i.scrollTop, "rtl" === iB(l).direction && (s += aY(a.clientWidth, l.clientWidth) - c), n = {
                    width: c,
                    height: u,
                    x: s,
                    y: f
                };
                else if (iI(t)) p = (d = i5(t, !0, "fixed" === r)).top + t.clientTop, y = d.left + t.clientLeft, m = iN(t) ? i8(t) : aJ(1), n = {
                    width: t.clientWidth * m.x,
                    height: t.clientHeight * m.y,
                    x: y * m.x,
                    y: p * m.y
                };
                else {
                    var n, o, a, i, l, c, u, s, f, d, p, y, m, b = i6(e);
                    n = {
                        x: t.x - b.x,
                        y: t.y - b.y,
                        width: t.width,
                        height: t.height
                    }
                }
                return il(n)
            }

            function lt(e, t, r) {
                var n = iN(t),
                    o = iA(t),
                    a = "fixed" === r,
                    i = i5(e, !0, a, t),
                    l = {
                        scrollLeft: 0,
                        scrollTop: 0
                    },
                    c = aJ(0);
                if (n || !n && !a)
                    if (("body" !== iP(t) || ik(o)) && (l = iV(t)), n) {
                        var u = i5(t, !0, a, t);
                        c.x = u.x + t.clientLeft, c.y = u.y + t.clientTop
                    } else o && (c.x = i4(o));
                a && !n && o && (c.x = i4(o));
                var s = !o || n || a ? aJ(0) : i7(o, l);
                return {
                    x: i.left + l.scrollLeft - c.x - s.x,
                    y: i.top + l.scrollTop - c.y - s.y,
                    width: i.width,
                    height: i.height
                }
            }

            function lr(e) {
                return "static" === iB(e).position
            }

            function ln(e, t) {
                if (!iN(e) || "fixed" === iB(e).position) return null;
                if (t) return t(e);
                var r = e.offsetParent;
                return iA(e) === r && (r = r.ownerDocument.body), r
            }

            function lo(e, t) {
                var r, n = iE(e);
                if (iL(e)) return n;
                if (!iN(e)) {
                    for (var o = iq(e); o && !iW(o);) {
                        if (iI(o) && !lr(o)) return o;
                        o = iq(o)
                    }
                    return n
                }
                for (var a = ln(e, t); a && (r = a, iD.has(iP(r))) && lr(a);) a = ln(a, t);
                return a && iW(a) && lr(a) && !iz(a) ? n : a || function(e) {
                    for (var t = iq(e); iN(t) && !iW(t);) {
                        if (iz(t)) return t;
                        if (iL(t)) break;
                        t = iq(t)
                    }
                    return null
                }(e) || n
            }
            var la = {
                convertOffsetParentRelativeRectToViewportRelativeRect: function(e) {
                    var t = e.elements,
                        r = e.rect,
                        n = e.offsetParent,
                        o = "fixed" === e.strategy,
                        a = iA(n),
                        i = !!t && iL(t.floating);
                    if (n === a || i && o) return r;
                    var l = {
                            scrollLeft: 0,
                            scrollTop: 0
                        },
                        c = aJ(1),
                        u = aJ(0),
                        s = iN(n);
                    if ((s || !s && !o) && (("body" !== iP(n) || ik(a)) && (l = iV(n)), iN(n))) {
                        var f = i5(n);
                        c = i8(n), u.x = f.x + n.clientLeft, u.y = f.y + n.clientTop
                    }
                    var d = !a || s || o ? aJ(0) : i7(a, l);
                    return {
                        width: r.width * c.x,
                        height: r.height * c.y,
                        x: r.x * c.x - l.scrollLeft * c.x + u.x + d.x,
                        y: r.y * c.y - l.scrollTop * c.y + u.y + d.y
                    }
                },
                getDocumentElement: iA,
                getClippingRect: function(e) {
                    var t = e.element,
                        r = e.boundary,
                        n = e.rootBoundary,
                        o = e.strategy,
                        a = iJ("clippingAncestors" === r ? iL(t) ? [] : function(e, t) {
                            var r = t.get(e);
                            if (r) return r;
                            for (var n = i$(e, [], !1).filter(function(e) {
                                    return iI(e) && "body" !== iP(e)
                                }), o = null, a = "fixed" === iB(e).position, i = a ? iq(e) : e; iI(i) && !iW(i);) {
                                var l = iB(i),
                                    c = iz(i);
                                c || "fixed" !== l.position || (o = null), (a ? !c && !o : !c && "static" === l.position && !!o && i9.has(o.position) || ik(i) && !c && function e(t, r) {
                                    var n = iq(t);
                                    return !(n === r || !iI(n) || iW(n)) && ("fixed" === iB(n).position || e(n, r))
                                }(e, i)) ? n = n.filter(function(e) {
                                    return e !== i
                                }) : o = l, i = iq(i)
                            }
                            return t.set(e, n), n
                        }(t, this._c) : [].concat(r)).concat([n]),
                        i = a[0],
                        l = a.reduce(function(e, r) {
                            var n = le(t, r, o);
                            return e.top = aY(n.top, e.top), e.right = aG(n.right, e.right), e.bottom = aG(n.bottom, e.bottom), e.left = aY(n.left, e.left), e
                        }, le(t, i, o));
                    return {
                        width: l.right - l.left,
                        height: l.bottom - l.top,
                        x: l.left,
                        y: l.top
                    }
                },
                getOffsetParent: lo,
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
                                    return t = this.getOffsetParent || lo, [4, (0, this.getDimensions)(e.floating)];
                                case 1:
                                    return r = a.sent(), n = {}, o = [e.reference], [4, t(e.floating)];
                                case 2:
                                    return [2, (n.reference = lt.apply(void 0, o.concat([a.sent(), e.strategy])), n.floating = {
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
                                iY(a, n, o, i, l, "next", e)
                            }

                            function l(e) {
                                iY(a, n, o, i, l, "throw", e)
                            }
                            i(void 0)
                        })
                    }).call(this)
                },
                getClientRects: function(e) {
                    return Array.from(e.getClientRects())
                },
                getDimensions: function(e) {
                    var t = i1(e);
                    return {
                        width: t.width,
                        height: t.height
                    }
                },
                getScale: i8,
                isElement: iI,
                isRTL: function(e) {
                    return "rtl" === iB(e).direction
                }
            };

            function li(e, t) {
                return e.x === t.x && e.y === t.y && e.width === t.width && e.height === t.height
            }

            function ll(e, t, r, n) {
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
                    y = void 0 !== p && p,
                    m = i2(e),
                    b = i || c ? iJ(m ? i$(m) : []).concat(iJ(i$(t))) : [];
                b.forEach(function(e) {
                    i && e.addEventListener("scroll", r, {
                        passive: !0
                    }), c && e.addEventListener("resize", r)
                });
                var v = m && d ? function(e, t) {
                        var r, n = null,
                            o = iA(e);

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
                                var y = {
                                        rootMargin: -aZ(f) + "px " + -aZ(o.clientWidth - (s + d)) + "px " + -aZ(o.clientHeight - (f + p)) + "px " + -aZ(s) + "px",
                                        threshold: aY(0, aG(1, c)) || 1
                                    },
                                    m = !0;
                                try {
                                    n = new IntersectionObserver(b, iZ(iQ({}, y), {
                                        root: o.ownerDocument
                                    }))
                                } catch (e) {
                                    n = new IntersectionObserver(b, y)
                                }
                                n.observe(e)
                            }

                            function b(t) {
                                var n = t[0].intersectionRatio;
                                if (n !== c) {
                                    if (!m) return i();
                                    n ? i(!1, n) : r = setTimeout(function() {
                                        i(!1, 1e-7)
                                    }, 1e3)
                                }
                                1 !== n || li(u, e.getBoundingClientRect()) || i(), m = !1
                            }
                        }(!0), a
                    }(m, r) : null,
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
                    }(e) || i0(e, 1) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }())[0];
                    n && n.target === m && g && (g.unobserve(t), cancelAnimationFrame(h), h = requestAnimationFrame(function() {
                        var e;
                        null == (e = g) || e.observe(t)
                    })), r()
                }), m && !y && g.observe(m), g.observe(t));
                var O = y ? i5(e) : null;
                return y && function t() {
                        var n = i5(e);
                        O && !li(O, n) && r(), O = n, o = requestAnimationFrame(t)
                    }(), r(),
                    function() {
                        var e;
                        b.forEach(function(e) {
                            i && e.removeEventListener("scroll", r), c && e.removeEventListener("resize", r)
                        }), null == v || v(), null == (e = g) || e.disconnect(), g = null, y && cancelAnimationFrame(o)
                    }
            }
            var lc = function(e) {
                    return {
                        name: "arrow",
                        options: e,
                        fn: function(t) {
                            return is(function() {
                                var r, n, o, a, i, l, c, u, s, f, d, p, y, m, b, v, h, g, O, w, j, x, S, P, E, A, C, I, N, R, T, k, D, M, L, _, F;
                                return iv(this, function(U) {
                                    switch (U.label) {
                                        case 0:
                                            if (r = t.x, n = t.y, o = t.placement, a = t.rects, i = t.platform, l = t.elements, c = t.middlewareData, s = (u = a2(e, t) || {}).element, d = void 0 === (f = u.padding) ? 0 : f, null == s) return [2, {}];
                                            return p = ii(d), y = {
                                                x: r,
                                                y: n
                                            }, b = a5(m = a6(a7(o))), [4, i.getDimensions(s)];
                                        case 1:
                                            return v = U.sent(), g = (h = "y" === m) ? "top" : "left", O = h ? "bottom" : "right", w = h ? "clientHeight" : "clientWidth", j = a.reference[b] + a.reference[m] - y[m] - a.floating[b], x = y[m] - a.reference[m], [4, null == i.getOffsetParent ? void 0 : i.getOffsetParent(s)];
                                        case 2:
                                            if (E = !(P = (S = U.sent()) ? S[w] : 0)) return [3, 4];
                                            return [4, null == i.isElement ? void 0 : i.isElement(S)];
                                        case 3:
                                            E = !U.sent(), U.label = 4;
                                        case 4:
                                            return E && (P = l.floating[w] || a.floating[b]), A = j / 2 - x / 2, C = P / 2 - v[b] / 2 - 1, I = aG(p[g], C), N = aG(p[O], C), R = I, T = P - v[b] - N, D = aY(R, aG(k = P / 2 - v[b] / 2 + A, T)), L = (M = !c.arrow && null != a3(o) && k !== D && a.reference[b] / 2 - (k < R ? I : N) - v[b] / 2 < 0) ? k < R ? k - R : k - T : 0, [2, (id(F = {}, m, y[m] + L), id(F, "data", ip((id(_ = {}, m, D), id(_, "centerOffset", k - D - L), _), M && {
                                                alignmentOffset: L
                                            })), id(F, "reset", M), F)]
                                    }
                                })
                            })()
                        }
                    }
                },
                lu = function(e, t, r) {
                    var n, o = new Map,
                        a = iQ({
                            platform: la
                        }, r),
                        i = iZ(iQ({}, a.platform), {
                            _c: o
                        });
                    return n = iZ(iQ({}, a), {
                        platform: i
                    }), is(function() {
                        var r, o, a, i, l, c, u, s, f, d, p, y, m, b, v, h, g, O, w, j, x, S, P, E, A, C;
                        return iv(this, function(I) {
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
                                    y = (p = ih(d = I.sent(), o, f)).x, m = p.y, b = o, v = {}, h = 0, g = 0, I.label = 3;
                                case 3:
                                    if (!(g < s.length)) return [3, 11];
                                    return w = (O = s[g]).name, [4, (0, O.fn)({
                                        x: y,
                                        y: m,
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
                                    if (x = (j = I.sent()).x, S = j.y, P = j.data, E = j.reset, y = null != x ? x : y, m = null != S ? S : m, v = iy(ip({}, v), id({}, w, ip({}, v[w], P))), !(E && h <= 50)) return [3, 10];
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
                                    y = (C = ih(d, b, f)).x, m = C.y, I.label = 9;
                                case 9:
                                    g = -1, I.label = 10;
                                case 10:
                                    return g++, [3, 3];
                                case 11:
                                    return [2, {
                                        x: y,
                                        y: m,
                                        placement: b,
                                        strategy: i,
                                        middlewareData: v
                                    }]
                            }
                        })
                    })()
                };

            function ls(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lf(e) {
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

            function ld(e, t) {
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

            function lp(e, t) {
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
                        if ("string" == typeof e) return ls(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ls(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ly(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var lm = "u" > typeof document ? Q.useLayoutEffect : function() {};

            function lb(e, t) {
                if (e === t) return !0;
                if ((void 0 === e ? "undefined" : ly(e)) !== (void 0 === t ? "undefined" : ly(t))) return !1;
                if ("function" == typeof e && e.toString() === t.toString()) return !0;
                if (e && t && (void 0 === e ? "undefined" : ly(e)) === "object") {
                    if (Array.isArray(e)) {
                        if ((r = e.length) !== t.length) return !1;
                        for (n = r; 0 != n--;)
                            if (!lb(e[n], t[n])) return !1;
                        return !0
                    }
                    if ((r = (o = Object.keys(e)).length) !== Object.keys(t).length) return !1;
                    for (n = r; 0 != n--;)
                        if (!({}).hasOwnProperty.call(t, o[n])) return !1;
                    for (n = r; 0 != n--;) {
                        var r, n, o, a = o[n];
                        if (("_owner" !== a || !e.$$typeof) && !lb(e[a], t[a])) return !1
                    }
                    return !0
                }
                return e != e && t != t
            }

            function lv(e) {
                return "u" < typeof window ? 1 : (e.ownerDocument.defaultView || window).devicePixelRatio || 1
            }

            function lh(e, t) {
                var r = lv(e);
                return Math.round(t * r) / r
            }

            function lg(e) {
                var t = Q.useRef(e);
                return lm(function() {
                    t.current = e
                }), t
            }

            function lO(e) {
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
                    y = e.whileElementsMounted,
                    m = e.open,
                    b = lp(Q.useState({
                        x: 0,
                        y: 0,
                        strategy: o,
                        placement: r,
                        middlewareData: {},
                        isPositioned: !1
                    }), 2),
                    v = b[0],
                    h = b[1],
                    g = lp(Q.useState(i), 2),
                    O = g[0],
                    w = g[1];
                lb(O, i) || w(i);
                var j = lp(Q.useState(null), 2),
                    x = j[0],
                    S = j[1],
                    P = lp(Q.useState(null), 2),
                    E = P[0],
                    A = P[1],
                    C = Q.useCallback(function(e) {
                        e !== T.current && (T.current = e, S(e))
                    }, []),
                    I = Q.useCallback(function(e) {
                        e !== k.current && (k.current = e, A(e))
                    }, []),
                    N = s || x,
                    R = f || E,
                    T = Q.useRef(null),
                    k = Q.useRef(null),
                    D = Q.useRef(v),
                    M = null != y,
                    L = lg(y),
                    _ = lg(l),
                    F = lg(m),
                    U = Q.useCallback(function() {
                        if (T.current && k.current) {
                            var e = {
                                placement: r,
                                strategy: o,
                                middleware: O
                            };
                            _.current && (e.platform = _.current), lu(T.current, k.current, e).then(function(e) {
                                var t = ld(lf({}, e), {
                                    isPositioned: !1 !== F.current
                                });
                                z.current && !lb(D.current, t) && (D.current = t, ne.flushSync(function() {
                                    h(t)
                                }))
                            })
                        }
                    }, [O, r, o, _, F]);
                lm(function() {
                    !1 === m && D.current.isPositioned && (D.current.isPositioned = !1, h(function(e) {
                        return ld(lf({}, e), {
                            isPositioned: !1
                        })
                    }))
                }, [m]);
                var z = Q.useRef(!1);
                lm(function() {
                    return z.current = !0,
                        function() {
                            z.current = !1
                        }
                }, []), lm(function() {
                    if (N && (T.current = N), R && (k.current = R), N && R) {
                        if (L.current) return L.current(N, R, U);
                        U()
                    }
                }, [N, R, U, L, M]);
                var K = Q.useMemo(function() {
                        return {
                            reference: T,
                            floating: k,
                            setReference: C,
                            setFloating: I
                        }
                    }, [C, I]),
                    H = Q.useMemo(function() {
                        return {
                            reference: N,
                            floating: R
                        }
                    }, [N, R]),
                    W = Q.useMemo(function() {
                        var e = {
                            position: o,
                            left: 0,
                            top: 0
                        };
                        if (!H.floating) return e;
                        var t = lh(H.floating, v.x),
                            r = lh(H.floating, v.y);
                        return p ? lf(ld(lf({}, e), {
                            transform: "translate(" + t + "px, " + r + "px)"
                        }), lv(H.floating) >= 1.5 && {
                            willChange: "transform"
                        }) : {
                            position: o,
                            left: t,
                            top: r
                        }
                    }, [o, p, H.floating, v.x, v.y]);
                return Q.useMemo(function() {
                    return ld(lf({}, v), {
                        update: U,
                        refs: K,
                        elements: H,
                        floatingStyles: W
                    })
                }, [v, U, K, H, W])
            }
            var lw = function(e, t) {
                    var r;
                    return ld(lf({}, (void 0 === (r = e) && (r = 0), {
                        name: "offset",
                        options: r,
                        fn: function(e) {
                            return is(function() {
                                var t, n, o, a, i, l, c;
                                return iv(this, function(u) {
                                    switch (u.label) {
                                        case 0:
                                            var s;
                                            return o = e.x, a = e.y, i = e.placement, l = e.middlewareData, [4, (s = r, is(function() {
                                                var t, r, n, o, a, i, l, c, u, f, d, p, y, m;
                                                return iv(this, function(b) {
                                                    switch (b.label) {
                                                        case 0:
                                                            return t = e.placement, r = e.platform, n = e.elements, [4, null == r.isRTL ? void 0 : r.isRTL(n.floating)];
                                                        case 1:
                                                            return o = b.sent(), a = a8(t), i = a3(t), l = "y" === a7(t), c = ij.has(a) ? -1 : 1, u = o && l ? -1 : 1, p = (d = "number" == typeof(f = a2(s, e)) ? {
                                                                mainAxis: f,
                                                                crossAxis: 0,
                                                                alignmentAxis: null
                                                            } : {
                                                                mainAxis: f.mainAxis || 0,
                                                                crossAxis: f.crossAxis || 0,
                                                                alignmentAxis: f.alignmentAxis
                                                            }).mainAxis, y = d.crossAxis, m = d.alignmentAxis, i && "number" == typeof m && (y = "end" === i ? -1 * m : m), [2, l ? {
                                                                x: y * u,
                                                                y: p * c
                                                            } : {
                                                                x: p * c,
                                                                y: y * u
                                                            }]
                                                    }
                                                })
                                            })())];
                                        case 1:
                                            if (c = u.sent(), i === (null == (t = l.offset) ? void 0 : t.placement) && null != (n = l.arrow) && n.alignmentOffset) return [2, {}];
                                            return [2, {
                                                x: o + c.x,
                                                y: a + c.y,
                                                data: iy(ip({}, c), {
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
                lj = function(e, t) {
                    var r;
                    return ld(lf({}, (void 0 === (r = e) && (r = {}), {
                        name: "shift",
                        options: r,
                        fn: function(e) {
                            return is(function() {
                                var t, n, o, a, i, l, c, u, s, f, d, p, y, m, b, v, h, g, O, w, j, x, S, P, E, A, C, I;
                                return iv(this, function(N) {
                                    switch (N.label) {
                                        case 0:
                                            return t = e.x, n = e.y, o = e.placement, l = void 0 === (i = (a = a2(r, e)).mainAxis) || i, u = void 0 !== (c = a.crossAxis) && c, f = void 0 === (s = a.limiter) ? {
                                                fn: function(e) {
                                                    return {
                                                        x: e.x,
                                                        y: e.y
                                                    }
                                                }
                                            } : s, d = im(a, ["mainAxis", "crossAxis", "limiter"]), p = {
                                                x: t,
                                                y: n
                                            }, [4, ig(e, d)];
                                        case 1:
                                            return y = N.sent(), v = p[b = a6(m = a7(a8(o)))], h = p[m], l && (g = "y" === b ? "top" : "left", O = "y" === b ? "bottom" : "right", w = v + y[g], j = v - y[O], v = aY(w, aG(v, j))), u && (x = "y" === m ? "top" : "left", S = "y" === m ? "bottom" : "right", P = h + y[x], E = h - y[S], h = aY(P, aG(h, E))), C = f.fn(iy(ip({}, e), (id(A = {}, b, v), id(A, m, h), A))), [2, iy(ip({}, C), {
                                                data: {
                                                    x: C.x - t,
                                                    y: C.y - n,
                                                    enabled: (id(I = {}, b, l), id(I, m, u), I)
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
                lx = function(e, t) {
                    var r;
                    return ld(lf({}, (void 0 === (r = e) && (r = {}), {
                        options: r,
                        fn: function(e) {
                            var t, n = e.x,
                                o = e.y,
                                a = e.placement,
                                i = e.rects,
                                l = e.middlewareData,
                                c = a2(r, e),
                                u = c.offset,
                                s = c.mainAxis,
                                f = c.crossAxis,
                                d = {
                                    x: n,
                                    y: o
                                },
                                p = a7(a),
                                y = a6(p),
                                m = d[y],
                                b = d[p],
                                v = a2(void 0 === u ? 0 : u, e),
                                h = "number" == typeof v ? {
                                    mainAxis: v,
                                    crossAxis: 0
                                } : ip({
                                    mainAxis: 0,
                                    crossAxis: 0
                                }, v);
                            if (void 0 === s || s) {
                                var g = "y" === y ? "height" : "width",
                                    O = i.reference[y] - i.floating[g] + h.mainAxis,
                                    w = i.reference[y] + i.reference[g] - h.mainAxis;
                                m < O ? m = O : m > w && (m = w)
                            }
                            if (void 0 === f || f) {
                                var j, x, S = "y" === y ? "width" : "height",
                                    P = ij.has(a8(a)),
                                    E = i.reference[p] - i.floating[S] + (P && (null == (j = l.offset) ? void 0 : j[p]) || 0) + (P ? 0 : h.crossAxis),
                                    A = i.reference[p] + i.reference[S] + (P ? 0 : (null == (x = l.offset) ? void 0 : x[p]) || 0) - (P ? h.crossAxis : 0);
                                b < E ? b = E : b > A && (b = A)
                            }
                            return id(t = {}, y, m), id(t, p, b), t
                        }
                    })), {
                        options: [e, t]
                    })
                },
                lS = function(e, t) {
                    var r;
                    return ld(lf({}, (void 0 === (r = e) && (r = {}), {
                        name: "flip",
                        options: r,
                        fn: function(e) {
                            return is(function() {
                                var t, n, o, a, i, l, c, u, s, f, d, p, y, m, b, v, h, g, O, w, j, x, S, P, E, A, C, I, N, R, T, k, D, M, L, _, F, U, z, K;
                                return iv(this, function(H) {
                                    var W, B, V, q, $, X, G, Y, Q, Z, J, ee, et, er, en;
                                    switch (H.label) {
                                        case 0:
                                            if (o = e.placement, a = e.middlewareData, i = e.rects, l = e.initialPlacement, c = e.platform, u = e.elements, d = void 0 === (f = (s = a2(r, e)).mainAxis) || f, y = void 0 === (p = s.crossAxis) || p, m = s.fallbackPlacements, v = void 0 === (b = s.fallbackStrategy) ? "bestFit" : b, g = void 0 === (h = s.fallbackAxisSideDirection) ? "none" : h, w = void 0 === (O = s.flipAlignment) || O, j = im(s, ["mainAxis", "crossAxis", "fallbackPlacements", "fallbackStrategy", "fallbackAxisSideDirection", "flipAlignment"]), null != (t = a.arrow) && t.alignmentOffset) return [2, {}];
                                            return x = a8(o), S = a7(l), P = a8(l) === l, [4, null == c.isRTL ? void 0 : c.isRTL(u.floating)];
                                        case 1:
                                            return E = H.sent(), A = m || (P || !w ? [ia(l)] : (B = ia(W = l), [a9(W), B, a9(B)])), C = "none" !== g, !m && C && (I = A).push.apply(I, ib((V = l, q = w, $ = g, X = E, G = a3(V), Y = function(e, t, r) {
                                                switch (e) {
                                                    case "top":
                                                    case "bottom":
                                                        if (r) return t ? it : ie;
                                                        return t ? ie : it;
                                                    case "left":
                                                    case "right":
                                                        return t ? ir : io;
                                                    default:
                                                        return []
                                                }
                                            }(a8(V), "start" === $, X), G && (Y = Y.map(function(e) {
                                                return e + "-" + G
                                            }), q && (Y = Y.concat(Y.map(a9)))), Y))), N = [l].concat(ib(A)), [4, ig(e, j)];
                                        case 2:
                                            if (R = H.sent(), T = [], k = (null == (n = a.flip) ? void 0 : n.overflows) || [], d && T.push(R[x]), y && (Q = o, Z = i, void 0 === (J = E) && (J = !1), ee = a3(Q), er = a5(et = a6(a7(Q))), en = "x" === et ? ee === (J ? "end" : "start") ? "right" : "left" : "start" === ee ? "bottom" : "top", Z.reference[er] > Z.floating[er] && (en = ia(en)), D = [en, ia(en)], T.push(R[D[0]], R[D[1]])), k = ib(k).concat([{
                                                    placement: o,
                                                    overflows: T
                                                }]), !T.every(function(e) {
                                                    return e <= 0
                                                })) {
                                                if ((F = N[_ = ((null == (M = a.flip) ? void 0 : M.index) || 0) + 1]) && ("alignment" !== y || S === a7(F) || k.every(function(e) {
                                                        return a7(e.placement) !== S || e.overflows[0] > 0
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
                                                                var t = a7(e.placement);
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
                lP = function(e, t) {
                    var r;
                    return ld(lf({}, (void 0 === (r = e) && (r = {}), {
                        name: "size",
                        options: r,
                        fn: function(e) {
                            return is(function() {
                                var t, n, o, a, i, l, c, u, s, f, d, p, y, m, b, v, h, g, O, w, j, x, S, P, E, A, C, I, N, R;
                                return iv(this, function(T) {
                                    switch (T.label) {
                                        case 0:
                                            return o = e.placement, a = e.rects, i = e.platform, l = e.elements, s = void 0 === (u = (c = a2(r, e)).apply) ? function() {} : u, [4, ig(e, im(c, ["apply"]))];
                                        case 1:
                                            if (f = T.sent(), d = a8(o), p = a3(o), y = "y" === a7(o), b = (m = a.floating).width, v = m.height, "top" !== d && "bottom" !== d) return [3, 3];
                                            return h = d, [4, null == i.isRTL ? void 0 : i.isRTL(l.floating)];
                                        case 2:
                                            return g = p === (T.sent() ? "start" : "end") ? "left" : "right", [3, 4];
                                        case 3:
                                            g = d, h = "end" === p ? "top" : "bottom", T.label = 4;
                                        case 4:
                                            return O = v - f.top - f.bottom, w = b - f.left - f.right, j = aG(v - f[h], O), x = aG(b - f[g], w), S = !e.middlewareData.shift, P = j, E = x, null != (t = e.middlewareData.shift) && t.enabled.x && (E = w), null != (n = e.middlewareData.shift) && n.enabled.y && (P = O), S && !p && (A = aY(f.left, 0), C = aY(f.right, 0), I = aY(f.top, 0), N = aY(f.bottom, 0), y ? E = b - 2 * (0 !== A || 0 !== C ? A + C : aY(f.left, f.right)) : P = v - 2 * (0 !== I || 0 !== N ? I + N : aY(f.top, f.bottom))), [4, s(iy(ip({}, e), {
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
                lE = function(e, t) {
                    var r;
                    return ld(lf({}, (void 0 === (r = e) && (r = {}), {
                        name: "hide",
                        options: r,
                        fn: function(e) {
                            return is(function() {
                                var t, n, o, a, i, l, c;
                                return iv(this, function(u) {
                                    switch (u.label) {
                                        case 0:
                                            switch (t = e.rects, a = void 0 === (o = (n = a2(r, e)).strategy) ? "referenceHidden" : o, i = im(n, ["strategy"]), a) {
                                                case "referenceHidden":
                                                    return [3, 1];
                                                case "escaped":
                                                    return [3, 3]
                                            }
                                            return [3, 5];
                                        case 1:
                                            return [4, ig(e, iy(ip({}, i), {
                                                elementContext: "reference"
                                            }))];
                                        case 2:
                                            return [2, {
                                                data: {
                                                    referenceHiddenOffsets: l = iO(u.sent(), t.reference),
                                                    referenceHidden: iw(l)
                                                }
                                            }];
                                        case 3:
                                            return [4, ig(e, iy(ip({}, i), {
                                                altBoundary: !0
                                            }))];
                                        case 4:
                                            return [2, {
                                                data: {
                                                    escapedOffsets: c = iO(u.sent(), t.floating),
                                                    escaped: iw(c)
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
                lA = function(e, t) {
                    return ld(lf({}, {
                        name: "arrow",
                        options: e,
                        fn: function(t) {
                            var r = "function" == typeof e ? e(t) : e,
                                n = r.element,
                                o = r.padding;
                            return n && ({}).hasOwnProperty.call(n, "current") ? null != n.current ? lc({
                                element: n.current,
                                padding: o
                            }).fn(t) : {} : n ? lc({
                                element: n,
                                padding: o
                            }).fn(t) : {}
                        }
                    }), {
                        options: [e, t]
                    })
                };

            function lC(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lI(e) {
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

            function lN(e, t) {
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

            function lR(e, t) {
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

            function lT(e) {
                return function(e) {
                    if (Array.isArray(e)) return lC(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return lC(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return lC(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var lk = Q.forwardRef(function(e, t) {
                var r = e.children,
                    n = lR(e, ["children"]),
                    o = Q.Children.toArray(r),
                    a = o.find(lL);
                if (a) {
                    var i = a.props.children,
                        l = o.map(function(e) {
                            return e !== a ? e : Q.Children.count(i) > 1 ? Q.Children.only(null) : Q.isValidElement(i) ? i.props.children : null
                        });
                    return (0, $.jsx)(lD, lN(lI({}, n), {
                        ref: t,
                        children: Q.isValidElement(i) ? Q.cloneElement(i, void 0, l) : null
                    }))
                }
                return (0, $.jsx)(lD, lN(lI({}, n), {
                    ref: t,
                    children: r
                }))
            });
            lk.displayName = "Slot";
            var lD = Q.forwardRef(function(e, t) {
                var r = e.children,
                    n = lR(e, ["children"]);
                if (Q.isValidElement(r)) {
                    var o, a, i, l, c, u = (c = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref;
                    return Q.cloneElement(r, lN(lI({}, function(e, t) {
                        var r = lI({}, t);
                        for (var n in t) ! function(n) {
                            var o = e[n],
                                a = t[n];
                            /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                a.apply(void 0, lT(t)), o.apply(void 0, lT(t))
                            } : o && (r[n] = o) : "style" === n ? r[n] = lI({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                        }(n);
                        return lI({}, e, r)
                    }(n, r.props)), {
                        ref: t ? aL(t, u) : u
                    }))
                }
                return Q.Children.count(r) > 1 ? Q.Children.only(null) : null
            });
            lD.displayName = "SlotClone";
            var lM = function(e) {
                var t = e.children;
                return (0, $.jsx)($.Fragment, {
                    children: t
                })
            };

            function lL(e) {
                return Q.isValidElement(e) && e.type === lM
            }

            function l_(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function lF(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        l_(e, t, r[t])
                    })
                }
                return e
            }

            function lU(e, t) {
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
            var lz = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                    var r = Q.forwardRef(function(e, r) {
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
                            a = n ? lk : t;
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, $.jsx)(a, lU(lF({}, o), {
                            ref: r
                        }))
                    });
                    return r.displayName = "Primitive.".concat(t), lU(lF({}, e), l_({}, t, r))
                }, {}),
                lK = Q.forwardRef(function(e, t) {
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
                    return (0, $.jsx)(lz.svg, (r = function(e) {
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

            function lH(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lW(e) {
                var t = Q.useRef(e);
                return Q.useEffect(function() {
                    t.current = e
                }), Q.useMemo(function() {
                    return function() {
                        for (var e, r = arguments.length, n = Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                            if (Array.isArray(e)) return lH(e)
                        }(n) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(n) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return lH(e, void 0);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return lH(e, void 0)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }
                }, [])
            }

            function lB(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lV(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lq(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function l$(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        lq(e, t, r[t])
                    })
                }
                return e
            }

            function lX(e, t) {
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

            function lG(e, t) {
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

            function lY(e, t) {
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
                }(e, t) || lQ(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function lQ(e, t) {
                if (e) {
                    if ("string" == typeof e) return lV(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return lV(e, t)
                }
            }
            lK.displayName = "Arrow";
            var lZ = "Popper",
                lJ = lY(aH(lZ), 2),
                l0 = lJ[0],
                l1 = lJ[1],
                l2 = lY(l0(lZ), 2),
                l8 = l2[0],
                l3 = l2[1],
                l6 = function(e) {
                    var t = e.__scopePopper,
                        r = e.children,
                        n = lY(Q.useState(null), 2),
                        o = n[0],
                        a = n[1];
                    return (0, $.jsx)(l8, {
                        scope: t,
                        anchor: o,
                        onAnchorChange: a,
                        children: r
                    })
                };
            l6.displayName = lZ;
            var l5 = "PopperAnchor",
                l4 = Q.forwardRef(function(e, t) {
                    var r = e.__scopePopper,
                        n = e.virtualRef,
                        o = lG(e, ["__scopePopper", "virtualRef"]),
                        a = l3(l5, r),
                        i = Q.useRef(null),
                        l = a_(t, i);
                    return Q.useEffect(function() {
                        a.onAnchorChange((null == n ? void 0 : n.current) || i.current)
                    }), n ? null : (0, $.jsx)(lz.div, lX(l$({}, o), {
                        ref: l
                    }))
                });
            l4.displayName = l5;
            var l7 = "PopperContent",
                l9 = lY(l0(l7), 2),
                ce = l9[0],
                ct = l9[1],
                cr = Q.forwardRef(function(e, t) {
                    var r, n, o, a, i, l, c, u, s, f, d, p, y = e.__scopePopper,
                        m = e.side,
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
                        T = lG(e, ["__scopePopper", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "avoidCollisions", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "updatePositionStrategy", "onPlaced"]),
                        k = l3(l7, y),
                        D = lY(Q.useState(null), 2),
                        M = D[0],
                        L = D[1],
                        _ = a_(t, function(e) {
                            return L(e)
                        }),
                        F = lY(Q.useState(null), 2),
                        U = F[0],
                        z = F[1],
                        K = (o = (n = function(e) {
                            if (Array.isArray(e)) return e
                        }(r = Q.useState(void 0)) || function(e) {
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
                                if ("string" == typeof e) return lB(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return lB(e, 2)
                            }
                        }(r) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0], a = n[1], aB(function() {
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
                        B = "number" == typeof E ? E : l$({
                            top: 0,
                            right: 0,
                            bottom: 0,
                            left: 0
                        }, E),
                        V = Array.isArray(S) ? S : [S],
                        q = V.length > 0,
                        X = {
                            padding: B,
                            boundary: V.filter(ci),
                            altBoundary: q
                        },
                        G = lO({
                            strategy: "fixed",
                            placement: (void 0 === m ? "bottom" : m) + ("center" !== h ? "-" + h : ""),
                            whileElementsMounted: function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return ll.apply(void 0, ((function(e) {
                                    if (Array.isArray(e)) return lV(e)
                                })(t) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(t) || lQ(t) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()).concat([{
                                    animationFrame: "always" === N
                                }]))
                            },
                            elements: {
                                reference: k.anchor
                            },
                            middleware: [lw({
                                mainAxis: (void 0 === b ? 0 : b) + W,
                                alignmentAxis: void 0 === g ? 0 : g
                            }), j && lj(l$({
                                mainAxis: !0,
                                crossAxis: !1,
                                limiter: "partial" === (void 0 === A ? "partial" : A) ? lx() : void 0
                            }, X)), j && lS(l$({}, X)), lP(lX(l$({}, X), {
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
                            })), U && lA({
                                element: U,
                                padding: void 0 === O ? 0 : O
                            }), cl({
                                arrowWidth: H,
                                arrowHeight: W
                            }), void 0 !== C && C && lE(l$({
                                strategy: "referenceHidden"
                            }, X))]
                        }),
                        Y = G.refs,
                        Z = G.floatingStyles,
                        J = G.placement,
                        ee = G.isPositioned,
                        et = G.middlewareData,
                        er = lY(cc(J), 2),
                        en = er[0],
                        eo = er[1],
                        ea = lW(R);
                    aB(function() {
                        ee && (null == ea || ea())
                    }, [ee, ea]);
                    var ei = null == (c = et.arrow) ? void 0 : c.x,
                        el = null == (u = et.arrow) ? void 0 : u.y,
                        ec = (null == (s = et.arrow) ? void 0 : s.centerOffset) !== 0,
                        eu = lY(Q.useState(), 2),
                        es = eu[0],
                        ef = eu[1];
                    return aB(function() {
                        M && ef(window.getComputedStyle(M).zIndex)
                    }, [M]), (0, $.jsx)("div", {
                        ref: Y.setFloating,
                        "data-radix-popper-content-wrapper": "",
                        style: l$(lX(l$({}, Z), lq({
                            transform: ee ? Z.transform : "translate(0, -200%)",
                            minWidth: "max-content",
                            zIndex: es
                        }, "--radix-popper-transform-origin", [null == (f = et.transformOrigin) ? void 0 : f.x, null == (d = et.transformOrigin) ? void 0 : d.y].join(" "))), (null == (p = et.hide) ? void 0 : p.referenceHidden) && {
                            visibility: "hidden",
                            pointerEvents: "none"
                        }),
                        dir: e.dir,
                        children: (0, $.jsx)(ce, {
                            scope: y,
                            placedSide: en,
                            onArrowChange: z,
                            arrowX: ei,
                            arrowY: el,
                            shouldHideArrow: ec,
                            children: (0, $.jsx)(lz.div, lX(l$({
                                "data-side": en,
                                "data-align": eo
                            }, T), {
                                ref: _,
                                style: lX(l$({}, T.style), {
                                    animation: ee ? void 0 : "none"
                                })
                            }))
                        })
                    })
                });
            cr.displayName = l7;
            var cn = "PopperArrow",
                co = {
                    top: "bottom",
                    right: "left",
                    bottom: "top",
                    left: "right"
                },
                ca = Q.forwardRef(function(e, t) {
                    var r, n = e.__scopePopper,
                        o = lG(e, ["__scopePopper"]),
                        a = ct(cn, n),
                        i = co[a.placedSide];
                    return (0, $.jsx)("span", {
                        ref: a.onArrowChange,
                        style: (lq(r = {
                            position: "absolute",
                            left: a.arrowX,
                            top: a.arrowY
                        }, i, 0), lq(r, "transformOrigin", {
                            top: "",
                            right: "0 0",
                            bottom: "center 0",
                            left: "100% 0"
                        } [a.placedSide]), lq(r, "transform", {
                            top: "translateY(100%)",
                            right: "translateY(50%) rotate(90deg) translateX(-50%)",
                            bottom: "rotate(180deg)",
                            left: "translateY(50%) rotate(-90deg) translateX(50%)"
                        } [a.placedSide]), lq(r, "visibility", a.shouldHideArrow ? "hidden" : void 0), r),
                        children: (0, $.jsx)(lK, lX(l$({}, o), {
                            ref: t,
                            style: lX(l$({}, o.style), {
                                display: "block"
                            })
                        }))
                    })
                });

            function ci(e) {
                return null !== e
            }
            ca.displayName = cn;
            var cl = function(e) {
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
                            p = lY(cc(l), 2),
                            y = p[0],
                            m = {
                                start: "0%",
                                center: "50%",
                                end: "100%"
                            } [p[1]],
                            b = (null != (r = null == (a = u.arrow) ? void 0 : a.x) ? r : 0) + f / 2,
                            v = (null != (n = null == (i = u.arrow) ? void 0 : i.y) ? n : 0) + d / 2,
                            h = "",
                            g = "";
                        return "bottom" === y ? (h = s ? m : "".concat(b, "px"), g = "".concat(-d, "px")) : "top" === y ? (h = s ? m : "".concat(b, "px"), g = "".concat(c.floating.height + d, "px")) : "right" === y ? (h = "".concat(-d, "px"), g = s ? m : "".concat(v, "px")) : "left" === y && (h = "".concat(c.floating.width + d, "px"), g = s ? m : "".concat(v, "px")), {
                            data: {
                                x: h,
                                y: g
                            }
                        }
                    }
                }
            };

            function cc(e) {
                var t = lY(e.split("-"), 2),
                    r = t[0],
                    n = t[1];
                return [r, void 0 === n ? "center" : n]
            }

            function cu(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var cs = Q.forwardRef(function(e, t) {
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
                    }(r = Q.useState(!1)) || function(e) {
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
                            if ("string" == typeof e) return cu(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return cu(e, 2)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    s = u[0],
                    f = u[1];
                aB(function() {
                    return f(!0)
                }, []);
                var d = l || s && (null == (i = globalThis) || null == (a = i.document) ? void 0 : a.body);
                return d ? nt().createPortal((0, $.jsx)(lz.div, (n = function(e) {
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

            function cf(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function cd(e, t) {
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
                        if ("string" == typeof e) return cf(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return cf(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            cs.displayName = "Portal";
            var cp = function(e) {
                var t, r, n, o, a, i, l, c, u, s, f, d, p, y, m, b, v, h = e.present,
                    g = e.children,
                    O = (t = h, a = (o = cd(Q.useState(), 2))[0], i = o[1], l = Q.useRef({}), c = Q.useRef(t), u = Q.useRef("none"), f = (s = cd((r = t ? "mounted" : "unmounted", n = {
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
                    }, Q.useReducer(function(e, t) {
                        var r = n[e][t];
                        return null != r ? r : e
                    }, r)), 2))[0], d = s[1], Q.useEffect(function() {
                        var e = cy(l.current);
                        u.current = "mounted" === f ? e : "none"
                    }, [f]), aB(function() {
                        var e = l.current,
                            r = c.current;
                        if (r !== t) {
                            var n = u.current,
                                o = cy(e);
                            t ? d("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? d("UNMOUNT") : r && n !== o ? d("ANIMATION_OUT") : d("UNMOUNT"), c.current = t
                        }
                    }, [t, d]), aB(function() {
                        if (a) {
                            var e, t, r = null != (e = a.ownerDocument.defaultView) ? e : window,
                                n = function(e) {
                                    var n = cy(l.current).includes(e.animationName);
                                    if (e.target === a && n && (d("ANIMATION_END"), !c.current)) {
                                        var o = a.style.animationFillMode;
                                        a.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                            "forwards" === a.style.animationFillMode && (a.style.animationFillMode = o)
                                        })
                                    }
                                },
                                o = function(e) {
                                    e.target === a && (u.current = cy(l.current))
                                };
                            return a.addEventListener("animationstart", o), a.addEventListener("animationcancel", n), a.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(t), a.removeEventListener("animationstart", o), a.removeEventListener("animationcancel", n), a.removeEventListener("animationend", n)
                                }
                        }
                        d("ANIMATION_END")
                    }, [a, d]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: Q.useCallback(function(e) {
                            e && (l.current = getComputedStyle(e)), i(e)
                        }, [])
                    }),
                    w = "function" == typeof g ? g({
                        present: O.isPresent
                    }) : Q.Children.only(g),
                    j = a_(O.ref, (v = (b = null == (y = Object.getOwnPropertyDescriptor((p = w).props, "ref")) ? void 0 : y.get) && "isReactWarning" in b && b.isReactWarning) ? p.ref : (v = (b = null == (m = Object.getOwnPropertyDescriptor(p, "ref")) ? void 0 : m.get) && "isReactWarning" in b && b.isReactWarning) ? p.props.ref : p.props.ref || p.ref);
                return "function" == typeof g || O.isPresent ? Q.cloneElement(w, {
                    ref: j
                }) : null
            };

            function cy(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }

            function cm(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function cb(e, t) {
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
                        if ("string" == typeof e) return cm(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return cm(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function cv(e) {
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
            cp.displayName = "Presence";
            var ch = Q.forwardRef(function(e, t) {
                var r, n;
                return (0, $.jsx)(lz.span, (r = cv({}, e), n = n = {
                    ref: t,
                    style: cv({
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

            function cg(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function cO(e) {
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

            function cw(e, t) {
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

            function cj(e, t) {
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

            function cx(e, t) {
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
                }(e, t) || cP(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function cS(e) {
                return function(e) {
                    if (Array.isArray(e)) return cg(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || cP(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function cP(e, t) {
                if (e) {
                    if ("string" == typeof e) return cg(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return cg(e, t)
                }
            }
            ch.displayName = "VisuallyHidden";
            var cE = cx(aH("Tooltip", [l1]), 2),
                cA = cE[0];
            cE[1];
            var cC = l1(),
                cI = "TooltipProvider",
                cN = "tooltip.open",
                cR = cx(cA(cI), 2),
                cT = cR[0],
                ck = cR[1],
                cD = function(e) {
                    var t = e.__scopeTooltip,
                        r = e.delayDuration,
                        n = e.skipDelayDuration,
                        o = void 0 === n ? 300 : n,
                        a = e.disableHoverableContent,
                        i = e.children,
                        l = cx(Q.useState(!0), 2),
                        c = l[0],
                        u = l[1],
                        s = Q.useRef(!1),
                        f = Q.useRef(0);
                    return Q.useEffect(function() {
                        var e = f.current;
                        return function() {
                            return window.clearTimeout(e)
                        }
                    }, []), (0, $.jsx)(cT, {
                        scope: t,
                        isOpenDelayed: c,
                        delayDuration: void 0 === r ? 700 : r,
                        onOpen: Q.useCallback(function() {
                            window.clearTimeout(f.current), u(!1)
                        }, []),
                        onClose: Q.useCallback(function() {
                            window.clearTimeout(f.current), f.current = window.setTimeout(function() {
                                return u(!0)
                            }, o)
                        }, [o]),
                        isPointerInTransitRef: s,
                        onPointerInTransitChange: Q.useCallback(function(e) {
                            s.current = e
                        }, []),
                        disableHoverableContent: void 0 !== a && a,
                        children: i
                    })
                };
            cD.displayName = cI;
            var cM = "Tooltip",
                cL = cx(cA(cM), 2),
                c_ = cL[0],
                cF = cL[1],
                cU = function(e) {
                    var t, r, n, o, a, i, l, c, u, s, f, d, p, y, m, b, v, h, g, O, w, j = e.__scopeTooltip,
                        x = e.children,
                        S = e.open,
                        P = e.defaultOpen,
                        E = e.onOpenChange,
                        A = e.disableHoverableContent,
                        C = e.delayDuration,
                        I = ck(cM, e.__scopeTooltip),
                        N = cC(j),
                        R = cx(Q.useState(null), 2),
                        T = R[0],
                        k = R[1],
                        D = (s = (u = function(e) {
                            if (Array.isArray(e)) return e
                        }(c = Q.useState(aq())) || function(e) {
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
                                if ("string" == typeof e) return aV(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return aV(e, 2)
                            }
                        }(c) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0], f = u[1], aB(function() {
                            f(function(e) {
                                return null != e ? e : String(a$++)
                            })
                        }, [void 0]), s ? "radix-".concat(s) : ""),
                        M = Q.useRef(0),
                        L = null != A ? A : I.disableHoverableContent,
                        _ = null != C ? C : I.delayDuration,
                        F = Q.useRef(!1),
                        U = cx((p = (d = {
                            prop: S,
                            defaultProp: void 0 !== P && P,
                            onChange: function(e) {
                                e ? (I.onOpen(), document.dispatchEvent(new CustomEvent(cN))) : I.onClose(), null == E || E(e)
                            }
                        }).prop, v = (b = cb((r = (t = {
                            defaultProp: d.defaultProp,
                            onChange: m = void 0 === (y = d.onChange) ? function() {} : y
                        }).defaultProp, n = t.onChange, a = cb(o = Q.useState(r), 1)[0], i = Q.useRef(a), l = lW(n), Q.useEffect(function() {
                            i.current !== a && (l(a), i.current = a)
                        }, [a, i, l]), o), 2))[0], h = b[1], O = (g = void 0 !== p) ? p : v, w = lW(m), [O, Q.useCallback(function(e) {
                            if (g) {
                                var t = "function" == typeof e ? e(p) : e;
                                t !== p && w(t)
                            } else h(e)
                        }, [g, p, h, w])]), 2),
                        z = U[0],
                        K = void 0 !== z && z,
                        H = U[1],
                        W = Q.useMemo(function() {
                            return K ? F.current ? "delayed-open" : "instant-open" : "closed"
                        }, [K]),
                        B = Q.useCallback(function() {
                            window.clearTimeout(M.current), M.current = 0, F.current = !1, H(!0)
                        }, [H]),
                        V = Q.useCallback(function() {
                            window.clearTimeout(M.current), M.current = 0, H(!1)
                        }, [H]),
                        q = Q.useCallback(function() {
                            window.clearTimeout(M.current), M.current = window.setTimeout(function() {
                                F.current = !0, H(!0), M.current = 0
                            }, _)
                        }, [_, H]);
                    return Q.useEffect(function() {
                        return function() {
                            M.current && (window.clearTimeout(M.current), M.current = 0)
                        }
                    }, []), (0, $.jsx)(l6, cw(cO({}, N), {
                        children: (0, $.jsx)(c_, {
                            scope: j,
                            contentId: D,
                            open: K,
                            stateAttribute: W,
                            trigger: T,
                            onTriggerChange: k,
                            onTriggerEnter: Q.useCallback(function() {
                                I.isOpenDelayed ? q() : B()
                            }, [I.isOpenDelayed, q, B]),
                            onTriggerLeave: Q.useCallback(function() {
                                L ? V() : (window.clearTimeout(M.current), M.current = 0)
                            }, [V, L]),
                            onOpen: B,
                            onClose: V,
                            disableHoverableContent: L,
                            children: x
                        })
                    }))
                };
            cU.displayName = cM;
            var cz = "TooltipTrigger",
                cK = Q.forwardRef(function(e, t) {
                    var r = e.__scopeTooltip,
                        n = cj(e, ["__scopeTooltip"]),
                        o = cF(cz, r),
                        a = ck(cz, r),
                        i = cC(r),
                        l = a_(t, Q.useRef(null), o.onTriggerChange),
                        c = Q.useRef(!1),
                        u = Q.useRef(!1),
                        s = Q.useCallback(function() {
                            return c.current = !1
                        }, []);
                    return Q.useEffect(function() {
                        return function() {
                            return document.removeEventListener("pointerup", s)
                        }
                    }, [s]), (0, $.jsx)(l4, cw(cO({
                        asChild: !0
                    }, i), {
                        children: (0, $.jsx)(lz.button, cw(cO({
                            "aria-describedby": o.open ? o.contentId : void 0,
                            "data-state": o.stateAttribute
                        }, n), {
                            ref: l,
                            onPointerMove: ak(e.onPointerMove, function(e) {
                                "touch" !== e.pointerType && (u.current || a.isPointerInTransitRef.current || (o.onTriggerEnter(), u.current = !0))
                            }),
                            onPointerLeave: ak(e.onPointerLeave, function() {
                                o.onTriggerLeave(), u.current = !1
                            }),
                            onPointerDown: ak(e.onPointerDown, function() {
                                c.current = !0, document.addEventListener("pointerup", s, {
                                    once: !0
                                })
                            }),
                            onFocus: ak(e.onFocus, function() {
                                c.current || o.onOpen()
                            }),
                            onBlur: ak(e.onBlur, o.onClose),
                            onClick: ak(e.onClick, o.onClose)
                        }))
                    }))
                });
            cK.displayName = cz;
            var cH = "TooltipPortal",
                cW = cx(cA(cH, {
                    forceMount: void 0
                }), 2),
                cB = cW[0],
                cV = cW[1],
                cq = function(e) {
                    var t = e.__scopeTooltip,
                        r = e.forceMount,
                        n = e.children,
                        o = e.container,
                        a = cF(cH, t);
                    return (0, $.jsx)(cB, {
                        scope: t,
                        forceMount: r,
                        children: (0, $.jsx)(cp, {
                            present: r || a.open,
                            children: (0, $.jsx)(cs, {
                                asChild: !0,
                                container: o,
                                children: n
                            })
                        })
                    })
                };
            cq.displayName = cH;
            var c$ = "TooltipContent",
                cX = Q.forwardRef(function(e, t) {
                    var r = cV(c$, e.__scopeTooltip),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        a = e.side,
                        i = void 0 === a ? "top" : a,
                        l = cj(e, ["forceMount", "side"]),
                        c = cF(c$, e.__scopeTooltip);
                    return (0, $.jsx)(cp, {
                        present: o || c.open,
                        children: c.disableHoverableContent ? (0, $.jsx)(cJ, cw(cO({
                            side: i
                        }, l), {
                            ref: t
                        })) : (0, $.jsx)(cG, cw(cO({
                            side: i
                        }, l), {
                            ref: t
                        }))
                    })
                }),
                cG = Q.forwardRef(function(e, t) {
                    var r = cF(c$, e.__scopeTooltip),
                        n = ck(c$, e.__scopeTooltip),
                        o = Q.useRef(null),
                        a = a_(t, o),
                        i = cx(Q.useState(null), 2),
                        l = i[0],
                        c = i[1],
                        u = r.trigger,
                        s = r.onClose,
                        f = o.current,
                        d = n.onPointerInTransitChange,
                        p = Q.useCallback(function() {
                            c(null), d(!1)
                        }, [d]),
                        y = Q.useCallback(function(e, t) {
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
                                y = (n = (r = t.getBoundingClientRect()).top, o = r.right, a = r.bottom, [{
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
                            c(((l = cS(p).concat(cS(y)).slice()).sort(function(e, t) {
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
                    return Q.useEffect(function() {
                        return function() {
                            return p()
                        }
                    }, [p]), Q.useEffect(function() {
                        if (u && f) {
                            var e = function(e) {
                                    return y(e, f)
                                },
                                t = function(e) {
                                    return y(e, u)
                                };
                            return u.addEventListener("pointerleave", e), f.addEventListener("pointerleave", t),
                                function() {
                                    u.removeEventListener("pointerleave", e), f.removeEventListener("pointerleave", t)
                                }
                        }
                    }, [u, f, y, p]), Q.useEffect(function() {
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
                    }, [u, f, l, s, p]), (0, $.jsx)(cJ, cw(cO({}, e), {
                        ref: a
                    }))
                }),
                cY = cx(cA(cM, {
                    isInside: !1
                }), 2),
                cQ = cY[0],
                cZ = cY[1],
                cJ = Q.forwardRef(function(e, t) {
                    var r = e.__scopeTooltip,
                        n = e.children,
                        o = e["aria-label"],
                        a = e.onEscapeKeyDown,
                        i = e.onPointerDownOutside,
                        l = cj(e, ["__scopeTooltip", "children", "aria-label", "onEscapeKeyDown", "onPointerDownOutside"]),
                        c = cF(c$, r),
                        u = cC(r),
                        s = c.onClose;
                    return Q.useEffect(function() {
                        return document.addEventListener(cN, s),
                            function() {
                                return document.removeEventListener(cN, s)
                            }
                    }, [s]), Q.useEffect(function() {
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
                    }, [c.trigger, s]), (0, $.jsx)(r9.DismissableLayer, {
                        asChild: !0,
                        disableOutsidePointerEvents: !1,
                        onEscapeKeyDown: a,
                        onPointerDownOutside: i,
                        onFocusOutside: function(e) {
                            return e.preventDefault()
                        },
                        onDismiss: s,
                        children: (0, $.jsxs)(cr, cw(cO({
                            "data-state": c.stateAttribute
                        }, u, l), {
                            ref: t,
                            style: cO({}, l.style, {
                                "--radix-tooltip-content-transform-origin": "var(--radix-popper-transform-origin)",
                                "--radix-tooltip-content-available-width": "var(--radix-popper-available-width)",
                                "--radix-tooltip-content-available-height": "var(--radix-popper-available-height)",
                                "--radix-tooltip-trigger-width": "var(--radix-popper-anchor-width)",
                                "--radix-tooltip-trigger-height": "var(--radix-popper-anchor-height)"
                            }),
                            children: [(0, $.jsx)(lM, {
                                children: n
                            }), (0, $.jsx)(cQ, {
                                scope: r,
                                isInside: !0,
                                children: (0, $.jsx)(ch, {
                                    id: c.contentId,
                                    role: "tooltip",
                                    children: o || n
                                })
                            })]
                        }))
                    })
                });
            cX.displayName = c$;
            var c0 = "TooltipArrow",
                c1 = Q.forwardRef(function(e, t) {
                    var r = e.__scopeTooltip,
                        n = cj(e, ["__scopeTooltip"]),
                        o = cC(r);
                    return cZ(c0, r).isInside ? null : (0, $.jsx)(ca, cw(cO({}, o, n), {
                        ref: t
                    }))
                });

            function c2(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function c8(e) {
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
                            if ("string" == typeof e) return c2(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return c2(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    p = d[0],
                    y = d[1],
                    m = null != i ? i : "string" == typeof o && null == a ? o : void 0;
                return Q.createElement(cD, {
                    delayDuration: void 0 === l ? 500 : l
                }, Q.createElement(cU, {
                    open: u,
                    onOpenChange: s
                }, c, Q.createElement(cq, null, Q.createElement(cX, {
                    side: p,
                    align: y,
                    "aria-label": m,
                    className: to("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", f),
                    sideOffset: 5
                }, (void 0 === n || n) && Q.createElement(c1, {
                    asChild: !0
                }, Q.createElement(aT, {
                    className: "content-[var(--inverse-surface-0)]"
                })), Q.createElement("div", {
                    className: "flex flex-col text-truncate-split"
                }, Q.createElement("div", {
                    className: "text-caption-medium content-inverse-default"
                }, o), a && Q.createElement("div", {
                    className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
                }, a))))))
            }

            function c3(e) {
                var t = e.children,
                    r = e.asChild,
                    n = e.className;
                return Q.createElement(cK, {
                    asChild: r,
                    className: n
                }, t)
            }
            c1.displayName = c0;
            var c6 = function(e) {
                    var t = e.item,
                        r = e.overlay,
                        n = (0, Y.useTranslation)().translate,
                        o = t.itemTarget.itemType,
                        a = J.ItemCardUtils.checkIfBundle(o),
                        i = null != t.serialNumber,
                        l = tZ(t, n),
                        c = function() {
                            return (0, $.jsxs)(Z().Fragment, {
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
                        u = l ? (0, $.jsx)(c8, {
                            position: "top-center",
                            delayDurationMs: 0,
                            contentClassName: "trade-serial-tooltip",
                            title: l,
                            children: (0, $.jsxs)("span", {
                                className: "limited-icon-container",
                                children: [c(), (0, $.jsx)(c3, {
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
                    return (0, $.jsx)(J.ItemCard, {
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
                        thumbnail2d: (0, $.jsxs)(Z().Fragment, {
                            children: [(0, $.jsx)(rC.Thumbnail2d, {
                                type: a ? rC.ThumbnailTypes.bundleThumbnail : rC.ThumbnailTypes.assetThumbnail,
                                targetId: t.itemTarget.targetId,
                                size: rC.DefaultThumbnailSize
                            }), u, r]
                        })
                    })
                },
                c5 = function(e) {
                    var t = e.offer,
                        r = e.label,
                        n = (0, Y.useTranslation)().translate,
                        o = !!(t.robux && t.robux > 0);
                    return (0, $.jsxs)("div", {
                        className: "trade-list-detail-offer",
                        children: [(0, $.jsx)("div", {
                            className: "rbx-divider"
                        }), (0, $.jsx)("h3", {
                            className: "trade-list-detail-offer-header font-header-1",
                            children: r
                        }), (0, $.jsx)("ul", {
                            className: "hlist item-cards item-cards-stackable",
                            children: t.items.map(function(e) {
                                return (0, $.jsx)("li", {
                                    className: "list-item item-card trade-item-card",
                                    children: (0, $.jsx)(c6, {
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
                                        percent: "".concat(t$())
                                    })
                                }), (0, $.jsxs)("span", {
                                    className: "robux-line-amount",
                                    children: [(0, $.jsx)("span", {
                                        className: "icon-robux-gray-16x16"
                                    }), (0, $.jsx)("span", {
                                        className: "text-label robux-line-value",
                                        children: (0, tz.formatNumber)(tX(t.robux))
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
                                        children: (0, tz.formatNumber)(tG(t))
                                    })]
                                })]
                            })]
                        })]
                    })
                };

            function c4(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function c7(e) {
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

            function c9(e, t) {
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

            function ue(e, t) {
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
                        if ("string" == typeof e) return c4(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return c4(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var ut = function(e) {
                    var t = e.trade,
                        r = e.detailLoading,
                        n = e.isMobile,
                        o = e.onBack,
                        a = e.onProfileClick,
                        i = e.onTradeRemoved,
                        l = e.systemFeedbackService,
                        c = (0, Y.useTranslation)().translate,
                        u = el().navigate,
                        s = rK(l),
                        f = ue((0, Q.useState)(null), 2),
                        d = f[0],
                        p = f[1],
                        y = ue((0, Q.useState)(""), 2),
                        m = y[0],
                        b = y[1],
                        v = ue((0, Q.useState)(!1), 2),
                        h = v[0],
                        g = v[1];
                    if (!t) return n ? null : (0, $.jsx)("div", {
                        className: "trade-detail-placeholder",
                        children: c("Label.TradeDetailsWillShowUpHere")
                    });
                    var O = t.status === ed.tradeStatus.open,
                        w = t.tradeStatusType === ed.tradeStatusType.inbound,
                        j = t.tradeStatusType === ed.tradeStatusType.outbound,
                        x = t.offers ? t.offers.toSorted(function(e, t) {
                            return Number(rI(t)) - Number(rI(e))
                        }) : [],
                        S = function(e) {
                            var t = Math.ceil(e.ExpirationTimeInMinutes / 60),
                                r = c(ed.economicRestrictionsViolationLabels[e.FailureReason]);
                            b(t > 24 ? c("Text.EconomicRestrictionsDaysGeneral", {
                                violation: r,
                                day: Math.ceil(t / 24)
                            }) : c("Text.EconomicRestrictionsHoursGeneral", {
                                violation: r,
                                hour: t
                            })), p("economic")
                        },
                        P = function() {
                            eJ("processAccept: accepting trade", t.id), g(!0);
                            var e, r = c9(c7({}, eB(t)), {
                                tradeId: t.id
                            });
                            (e = t.id, ev(function() {
                                var t, r;
                                return ew(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            return t = {
                                                url: "".concat(ed.urls.tradesApi, "/v1/trades/").concat(e, "/accept"),
                                                withCredentials: !0
                                            }, [4, ey.post(t)];
                                        case 1:
                                            return [2, null != (r = n.sent().data) ? r : {}]
                                    }
                                })
                            })()).then(function(e) {
                                if (eJ("processAccept: acceptTrade resolved", e), void 0 !== e.FailureReason && void 0 !== e.ExpirationTimeInMinutes) {
                                    S({
                                        FailureReason: e.FailureReason,
                                        ExpirationTimeInMinutes: e.ExpirationTimeInMinutes
                                    }), g(!1);
                                    return
                                }
                                g(!1), l.success(c("Message.AcceptedTrade")), i(t.id), ez(eT, "accept", r), eK("tradeCompleted", "accept", r)
                            }).catch(function(e) {
                                var r = eE(e);
                                e0("processAccept: acceptTrade failed", r, e), eW("accept", e, {
                                    tradeId: t.id
                                }), r.includes(ed.tradeErrors.tradeFrictionEncountered) ? rL().then(function(e) {
                                    e ? s.start() : p("verificationRedirect")
                                }).catch(function() {
                                    p("verificationRedirect")
                                }) : (g(!1), l.warning(rF(r, c)))
                            })
                        },
                        E = function() {
                            eJ("processDecline: declining trade", t.id), g(!0);
                            var e, r = c9(c7({}, eB(t)), {
                                tradeId: t.id
                            });
                            (e = t.id, ev(function() {
                                var t;
                                return ew(this, function(r) {
                                    switch (r.label) {
                                        case 0:
                                            return t = {
                                                url: "".concat(ed.urls.tradesApi, "/v1/trades/").concat(e, "/decline"),
                                                withCredentials: !0
                                            }, [4, ey.post(t)];
                                        case 1:
                                            return r.sent(), [2]
                                    }
                                })
                            })()).then(function() {
                                eJ("processDecline: declineTrade resolved"), g(!1), l.success(c("Message.DeclineTradeSuccess")), i(t.id), eK(j ? "tradeCanceled" : "tradeDeclined", j ? "cancel" : "decline", r)
                            }).catch(function(e) {
                                g(!1), e0("processDecline: declineTrade failed", eE(e), e), eW(j ? "cancel" : "decline", e, {
                                    tradeId: t.id
                                }), l.warning(rF(eE(e), c))
                            })
                        };
                    return (0, $.jsxs)("div", {
                        children: [(0, $.jsxs)("h2", {
                            className: "trades-header-nowrap font-title",
                            children: [n && (0, $.jsx)("span", {
                                className: "icon-back",
                                role: "button",
                                tabIndex: 0,
                                "aria-label": c("Action.Back"),
                                onClick: o,
                                onKeyDown: function(e) {
                                    ("Enter" === e.key || " " === e.key) && o()
                                }
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
                        }), O && (0, $.jsxs)("div", {
                            className: "text-label",
                            children: [c("Label.TradeExpiresOn", {
                                date: ""
                            }), t0(t.expiration)]
                        }), (!t.offers || r) && (0, $.jsx)("span", {
                            className: "spinner spinner-default"
                        }), (0, $.jsx)("div", {
                            className: "col-xs-12",
                            children: x.map(function(e, r) {
                                var n, o;
                                return (0, $.jsx)(c5, {
                                    offer: e,
                                    label: rR(t, e, c)
                                }, null != (n = null == (o = e.user) ? void 0 : o.id) ? n : r)
                            })
                        }), O && (0, $.jsxs)("div", {
                            className: "trade-buttons",
                            children: [w && (0, $.jsx)("button", {
                                type: "button",
                                className: "btn-cta-md",
                                disabled: h,
                                onClick: function() {
                                    eJ("accept button clicked, opening confirm dialog"), p("accept")
                                },
                                children: c("Action.AcceptTrade")
                            }), w && t.user && (0, $.jsx)("button", {
                                type: "button",
                                className: "btn-control-md",
                                disabled: h,
                                onClick: function() {
                                    eJ("onCounter: countering trade", t.id), ez(eT, "counter"), u({
                                        view: "counter",
                                        tradeId: t.id
                                    })
                                },
                                children: c("Action.CounterTrade")
                            }), (w || j) && (0, $.jsx)("button", {
                                type: "button",
                                className: "btn-control-md",
                                disabled: h,
                                onClick: function() {
                                    eJ("decline button clicked, opening confirm dialog"), p("decline")
                                },
                                children: c("Action.DeclineTrade")
                            }), h && (0, $.jsx)("span", {
                                className: "spinner spinner-sm"
                            })]
                        }), (0, $.jsx)(aR, {
                            open: "accept" === d,
                            title: c("Header.AcceptTrade"),
                            body: c("Label.TradesAreFinalOnceComplete"),
                            actionText: c("Action.AcceptTrade"),
                            actionVariant: "Emphasis",
                            neutralText: c("Action.Cancel"),
                            closeLabel: c("Action.Close"),
                            footerNote: (0, $.jsx)("div", {
                                className: "text-footer",
                                children: c("Label.ItemsMayBeHeldUpToDaysAfterTrading", {
                                    days: ed.holdingPeriodDays
                                })
                            }),
                            onAction: function() {
                                p(null), P()
                            },
                            onCancel: function() {
                                p(null)
                            }
                        }), (0, $.jsx)(aR, {
                            open: "decline" === d,
                            title: c("Heading.DeclineTrade"),
                            body: c("Message.DeclineTrade"),
                            actionText: c("Action.DeclineTrade"),
                            actionVariant: "Emphasis",
                            neutralText: c("Action.Cancel"),
                            closeLabel: c("Action.Close"),
                            footerNote: w ? (0, $.jsx)("div", {
                                className: "text-footer",
                                dangerouslySetInnerHTML: {
                                    __html: c("Message.LowballTrades", {
                                        startLink: '<a class="text-link" href="'.concat(ed.urls.privacySettings, '">'),
                                        endLink: "</a>"
                                    })
                                }
                            }) : void 0,
                            onAction: function() {
                                p(null), E(), ez(eT, "decline")
                            },
                            onCancel: function() {
                                p(null)
                            }
                        }), (0, $.jsx)(aR, {
                            open: "economic" === d,
                            title: c("Heading.EconomicRestrictionsError"),
                            body: m,
                            showAction: !1,
                            neutralText: c("Action.Cancel"),
                            closeLabel: c("Action.Close"),
                            onCancel: function() {
                                p(null)
                            }
                        }), (0, $.jsx)(aR, {
                            open: "verificationRedirect" === d,
                            title: c("Heading.TwoStepVerificationRequired"),
                            body: c("Message.TwoStepVerificationRequired"),
                            actionText: c("Action.GoToSecurity"),
                            actionVariant: "Emphasis",
                            neutralText: c("Action.Cancel"),
                            closeLabel: c("Action.Close"),
                            onAction: function() {
                                p(null), r_()
                            },
                            onCancel: function() {
                                p(null), g(!1)
                            }
                        })]
                    })
                },
                ur = function(e) {
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
                            }), (0, $.jsx)(ra, {
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
                        }), a && (a.href ? (0, $.jsx)(aN, {
                            as: "a",
                            href: a.href,
                            onClick: a.onClick,
                            variant: null != (t = a.variant) ? t : "Standard",
                            size: "Medium",
                            children: a.label
                        }) : (0, $.jsx)(aN, {
                            onClick: a.onClick,
                            variant: null != (r = a.variant) ? r : "Standard",
                            size: "Medium",
                            children: a.label
                        }))]
                    })
                };

            function un(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function uo(e) {
                if (Array.isArray(e)) return e
            }

            function ua() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function ui(e) {
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

            function ul(e, t) {
                if (e) {
                    if ("string" == typeof e) return un(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return un(e, t)
                }
            }
            var uc = (0, Q.forwardRef)(function(e, t) {
                var r, n, o, a = uo(o = [e, t]) || function(e) {
                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(o) || ul(o) || ua(),
                    i = a[0],
                    l = a.slice(1),
                    c = i.className,
                    u = i.style,
                    s = i.orientation,
                    f = void 0 === s ? "horizontal" : s,
                    d = i.variant,
                    p = void 0 === d ? "Standard" : d,
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
                    }(i, ["className", "style", "orientation", "variant"]),
                    m = (uo(l) || function(e) {
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
                    }(l) || ul(l, 1) || ua())[0],
                    b = "vertical" === f,
                    v = {};
                return b || "Inset" !== p ? b || "InsetLeft" !== p ? b || "InsetRight" !== p || (v = {
                    marginRight: "var(--padding-xlarge)"
                }) : v = {
                    marginLeft: "var(--padding-xlarge)"
                } : v = {
                    marginLeft: "var(--padding-xlarge)",
                    marginRight: "var(--padding-xlarge)"
                }, Z().createElement("div", (r = ui({
                    ref: m
                }, y), n = n = {
                    role: "separator",
                    "data-orientation": f,
                    "aria-orientation": f,
                    style: ui({
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
                    className: to("stroke-default self-stretch", c)
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
            uc.displayName = "Divider";
            var uu = function(e) {
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
                return Z().createElement(ok, null, Z().createElement(oM, {
                    "data-testid": "fui-base-sheet-overlay",
                    "data-type": t,
                    "data-side": "sideSheet" === t ? void 0 === r ? "right" : r : void 0,
                    "data-flush": "sideSheet" === t ? void 0 !== n && n : void 0,
                    "data-size": "centerSheet" === t ? void 0 === o ? "Medium" : o : void 0,
                    className: to("fui-base-sheet-overlay", "foundation-web-portal-zindex fixed inset-[0] flex", i)
                }, Z().createElement(oU, {
                    "data-testid": "fui-base-sheet-content",
                    className: to("fui-base-sheet-content relative bg-surface-100 stroke-muted stroke-standard shadow-transient-high", "flex flex-col clip", l),
                    onOpenAutoFocus: c,
                    onCloseAutoFocus: u,
                    onPointerDownOutside: s,
                    onEscapeKeyDown: f,
                    onInteractOutside: d
                }, a)))
            };

            function us(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var uf = function(e) {
                    return ("function" != typeof e.checkVisibility || e.checkVisibility()) && !("disabled" in e && e.disabled || "true" === e.getAttribute("aria-disabled"))
                },
                ud = function(e) {
                    us(e, HTMLInputElement) && "function" == typeof e.select && e.select()
                },
                up = function(e) {
                    var t = e.currentTarget;
                    if (t) {
                        var r = t.querySelectorAll("[data-autofocus-priority]");
                        if (0 !== r.length) {
                            var n = [];
                            r.forEach(function(e) {
                                var t = parseInt(e.getAttribute("data-autofocus-priority") || "", 10);
                                !Number.isNaN(t) && us(e, HTMLElement) && n.push({
                                    element: e,
                                    priority: t
                                })
                            }), n.sort(function(e, t) {
                                return e.priority - t.priority
                            });
                            var o = n.find(function(e) {
                                return uf(e.element)
                            });
                            if (o) {
                                e.preventDefault();
                                var a = document.activeElement === o.element;
                                o.element.focus(), a || ud(o.element)
                            }
                        }
                    }
                };

            function uy(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            r(977);
            var um = "u" > typeof window ? Q.useLayoutEffect : Q.useEffect,
                ub = "u" < typeof window;

            function uv(e) {
                var t, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    n = r.defaultValue,
                    o = void 0 !== n && n,
                    a = r.initializeWithValue,
                    i = void 0 === a || a,
                    l = function(e) {
                        return ub ? o : window.matchMedia(e).matches
                    },
                    c = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = (0, Q.useState)(function() {
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
                            if ("string" == typeof e) return uy(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return uy(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    u = c[0],
                    s = c[1];

                function f() {
                    s(l(e))
                }
                return um(function() {
                    var t = window.matchMedia(e);
                    return f(), t.addListener ? t.addListener(f) : t.addEventListener("change", f),
                        function() {
                            t.removeListener ? t.removeListener(f) : t.removeEventListener("change", f)
                        }
                }, [e]), u
            }

            function uh(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ug(e) {
                if (Array.isArray(e)) return e
            }

            function uO() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function uw(e) {
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

            function uj(e, t) {
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

            function ux(e, t) {
                if (e) {
                    if ("string" == typeof e) return uh(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return uh(e, t)
                }
            }
            var uS = (0, Q.createContext)(null),
                uP = function() {
                    var e = (0, Q.useContext)(uS);
                    if (!e) throw Error("Sheet components must be used within a Sheet");
                    return e
                },
                uE = "padding-x-xlarge",
                uA = function(e) {
                    var t = e.open,
                        r = e.onOpenChange,
                        n = e.defaultOpen,
                        o = e.children;
                    return Z().createElement(oA, {
                        open: t,
                        onOpenChange: r,
                        defaultOpen: n,
                        modal: !0
                    }, o)
                },
                uC = function(e) {
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
                        y = e.onPointerDownOutside,
                        m = e.onEscapeKeyDown,
                        b = e.onInteractOutside,
                        v = uv("(orientation: portrait) and (max-width: 600px)"),
                        h = uv("(orientation: landscape) and (max-height: 600px)");
                    t = v ? "bottomSheet" : h || "side" === i ? "sideSheet" : "centerSheet";
                    var g = (0, Q.useMemo)(function() {
                            return {
                                centerSheetSize: o,
                                largeScreenVariant: i,
                                closeLabel: l,
                                isPortraitMobile: v,
                                isLandscapeMobile: h,
                                type: t
                            }
                        }, [o, i, l, v, h, t]),
                        O = to(c, v && u, h && s, !v && !h && f);
                    return Z().createElement(uS.Provider, {
                        value: g
                    }, Z().createElement(uu, {
                        type: t,
                        sideSheetSide: "right",
                        isSideSheetFlush: h,
                        centerSheetSize: o,
                        contentClassName: O,
                        onOpenAutoFocus: null != d ? d : up,
                        onCloseAutoFocus: p,
                        onPointerDownOutside: y,
                        onEscapeKeyDown: m,
                        onInteractOutside: b
                    }, r))
                },
                uI = (0, Q.forwardRef)(function(e, t) {
                    var r, n = ug(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || ux(r) || uO(),
                        o = n[0],
                        a = n.slice(1),
                        i = o.children,
                        l = o.className,
                        c = o.hasPaddingX,
                        u = uj(o, ["children", "className", "hasPaddingX"]),
                        s = (ug(a) || function(e) {
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
                        }(a) || ux(a, 1) || uO())[0],
                        f = uP().type;
                    return Z().createElement("div", uw({
                        ref: s,
                        className: to("scroll-y", (void 0 === c || c) && uE, "sideSheet" === f ? "grow-1" : "", l)
                    }, u), i)
                });
            uI.displayName = "SheetBody";
            var uN = function(e) {
                    var t = e.className,
                        r = e.children,
                        n = e.navigation,
                        o = e.utilities,
                        a = e.visuallyHideTitleText,
                        i = uP().closeLabel,
                        l = Z().createElement(oB, {
                            className: "text-heading-small margin-none"
                        }, r);
                    return Z().createElement("div", {
                        className: to(t, n ? "padding-left-medium" : "padding-left-xlarge", "padding-right-small padding-y-small", "flex items-center justify-between")
                    }, Z().createElement("div", {
                        className: to("flex items-center", n && "gap-xsmall")
                    }, n, a ? Z().createElement(aa, null, l) : l), Z().createElement("div", {
                        className: to("flex items-center", o && "gap-xxsmall")
                    }, o, Z().createElement("div", {
                        className: "fui-sheet-close-affordance-container"
                    }, Z().createElement(oX, {
                        asChild: !0
                    }, Z().createElement(tU, {
                        variant: "Utility",
                        size: "Medium",
                        icon: "icon-regular-x",
                        ariaLabel: i || "",
                        "data-autofocus-priority": "1000"
                    })))))
                },
                uR = function(e) {
                    var t = e.children,
                        r = e.className,
                        n = uj(e, ["children", "className"]);
                    return Z().createElement(Z().Fragment, null, Z().createElement(uc, null), Z().createElement("div", uw({
                        className: to(uE, "margin-y-small shrink-0", r)
                    }, n), t))
                },
                uT = function(e) {
                    return Z().createElement(oq, uw({
                        asChild: !0
                    }, e))
                },
                uk = [{
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
                uD = function(e) {
                    var t = e.isOpen,
                        r = e.onOpenChange,
                        n = e.onShopClick,
                        o = e.onLearnMoreClick,
                        a = (0, Y.useTranslation)().translate;
                    return (0, $.jsx)(uA, {
                        open: t,
                        onOpenChange: r,
                        children: (0, $.jsxs)(uC, {
                            largeScreenVariant: "center",
                            className: "trades-sheet",
                            mobilePortraitClassName: "trades-sheet-full-bleed",
                            closeLabel: a("Action.Close"),
                            children: [(0, $.jsx)(uN, {
                                children: a("Header.HowToTrade")
                            }), (0, $.jsx)(uI, {
                                children: (0, $.jsx)("ol", {
                                    className: "how-to-trade-steps",
                                    children: uk.map(function(e) {
                                        return (0, $.jsxs)("li", {
                                            className: "how-to-trade-step",
                                            children: [(0, $.jsx)(ra, {
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
                            }), (0, $.jsxs)(uR, {
                                className: "how-to-trade-actions",
                                children: [(0, $.jsx)(aN, {
                                    as: "a",
                                    href: ed.urls.limitedsCatalog,
                                    onClick: n,
                                    variant: "Emphasis",
                                    size: "Medium",
                                    children: a("Action.Shop")
                                }), (0, $.jsx)(aN, {
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
                uM = 0,
                uL = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "\xabr",
                        t = (0, Q.useRef)();
                    return t.current || (uM += 1, t.current = "".concat(e).concat(uM)), t.current
                },
                u_ = function(e) {
                    var t = e.title,
                        r = e.description,
                        n = e.position;
                    return Z().createElement(c8, {
                        position: void 0 === n ? "top-center" : n,
                        title: t,
                        description: r
                    }, Z().createElement(c3, {
                        asChild: !0
                    }, Z().createElement("span", {
                        role: "button",
                        tabIndex: 0,
                        "aria-label": t,
                        className: "flex items-center content-muted",
                        "data-testid": "label-tooltip-trigger"
                    }, Z().createElement(ra, {
                        name: "icon-regular-circle-i",
                        size: "Small"
                    }))))
                };

            function uF(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    o = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === o || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function uU(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            "u" > typeof window && window.document && window.document.createElement;

            function uz(e, t, r) {
                return (uz = u$() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && uB(o, r.prototype), o
                }).apply(null, arguments)
            }

            function uK(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function uH(e) {
                return (uH = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function uW(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        uK(e, t, r[t])
                    })
                }
                return e
            }

            function uB(e, t) {
                return (uB = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function uV(e, t) {
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
                        if ("string" == typeof e) return uU(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return uU(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function uq(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (uq = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return uz(e, arguments, uH(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), uB(r, e)
                })(e)
            }

            function u$() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (u$ = function() {
                    return !!e
                })()
            }

            function uX(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function uG(e, t) {
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
                        if ("string" == typeof e) return uX(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return uX(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            uq(Map);
            var uY = Q[" useInsertionEffect ".trim().toString()] || rJ;

            function uQ(e) {
                var t, r, n, o, a, i, l, c, u = e.prop,
                    s = e.defaultProp,
                    f = e.onChange,
                    d = e.caller,
                    p = uG((r = (t = {
                        defaultProp: s,
                        onChange: void 0 === f ? function() {} : f
                    }).defaultProp, n = t.onChange, a = (o = uG(Q.useState(r), 2))[0], i = o[1], l = Q.useRef(a), c = Q.useRef(n), uY(function() {
                        c.current = n
                    }, [n]), Q.useEffect(function() {
                        if (l.current !== a) {
                            var e;
                            null == (e = c.current) || e.call(c, a), l.current = a
                        }
                    }, [a, l]), [a, i, c]), 3),
                    y = p[0],
                    m = p[1],
                    b = p[2],
                    v = void 0 !== u,
                    h = v ? u : y,
                    g = Q.useRef(void 0 !== u);
                return Q.useEffect(function() {
                    var e = g.current;
                    if (e !== v) {
                        var t = v ? "controlled" : "uncontrolled";
                        console.warn("".concat(d, " is changing from ").concat(e ? "controlled" : "uncontrolled", " to ").concat(t, ". Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component."))
                    }
                    g.current = v
                }, [v, d]), [h, Q.useCallback(function(e) {
                    if (v) {
                        var t, r = "function" == typeof e ? e(u) : e;
                        r !== u && (null == (t = b.current) || t.call(b, r))
                    } else m(e)
                }, [v, u, m, b])]
            }
            Symbol("RADIX:SYNC_STATE");
            var uZ = Q.createContext(void 0);

            function uJ(e) {
                var t = Q.useContext(uZ);
                return e || t || "ltr"
            }

            function u0(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function u1(e) {
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

            function u2(e, t) {
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

            function u8(e, t) {
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

            function u3(e, t) {
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
                }(e, t) || u6(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function u6(e, t) {
                if (e) {
                    if ("string" == typeof e) return u0(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return u0(e, t)
                }
            }
            var u5 = "rovingFocusGroup.onEntryFocus",
                u4 = {
                    bubbles: !1,
                    cancelable: !0
                },
                u7 = "RovingFocusGroup",
                u9 = u3((b = (m = uV(rQ(y = u7 + "CollectionProvider"), 2))[0], v = m[1], g = (h = uV(b(y, {
                    collectionRef: {
                        current: null
                    },
                    itemMap: new Map
                }), 2))[0], O = h[1], (w = function(e) {
                    var t = e.scope,
                        r = e.children,
                        n = Z().useRef(null),
                        o = Z().useRef(new Map).current;
                    return (0, $.jsx)(g, {
                        scope: t,
                        itemMap: o,
                        collectionRef: n,
                        children: r
                    })
                }).displayName = y, x = o5(j = u7 + "CollectionSlot"), (S = Z().forwardRef(function(e, t) {
                    var r = e.scope,
                        n = e.children,
                        o = tf(t, O(j, r).collectionRef);
                    return (0, $.jsx)(x, {
                        ref: o,
                        children: n
                    })
                })).displayName = j, E = "data-radix-collection-item", A = o5(P = u7 + "CollectionItemSlot"), (C = Z().forwardRef(function(e, t) {
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
                        l = Z().useRef(null),
                        c = tf(t, l),
                        u = O(P, o);
                    return Z().useEffect(function() {
                        return u.itemMap.set(l, uW({
                                ref: l
                            }, i)),
                            function() {
                                u.itemMap.delete(l)
                            }
                    }), (0, $.jsx)(A, (r = uW({}, uK({}, E, "")), n = n = {
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
                    var t = O(u7 + "CollectionConsumer", e);
                    return Z().useCallback(function() {
                        var e = t.collectionRef.current;
                        if (!e) return [];
                        var r = Array.from(e.querySelectorAll("[".concat(E, "]")));
                        return Array.from(t.itemMap.values()).sort(function(e, t) {
                            return r.indexOf(e.ref.current) - r.indexOf(t.ref.current)
                        })
                    }, [t.collectionRef, t.itemMap])
                }, v]), 3),
                se = u9[0],
                st = u9[1],
                sr = u3(rQ(u7, [u9[2]]), 2),
                sn = sr[0],
                so = sr[1],
                sa = u3(sn(u7), 2),
                si = sa[0],
                sl = sa[1],
                sc = Q.forwardRef(function(e, t) {
                    return (0, $.jsx)(se.Provider, {
                        scope: e.__scopeRovingFocusGroup,
                        children: (0, $.jsx)(se.Slot, {
                            scope: e.__scopeRovingFocusGroup,
                            children: (0, $.jsx)(su, u2(u1({}, e), {
                                ref: t
                            }))
                        })
                    })
                });
            sc.displayName = u7;
            var su = Q.forwardRef(function(e, t) {
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
                        d = u8(e, ["__scopeRovingFocusGroup", "orientation", "loop", "dir", "currentTabStopId", "defaultCurrentTabStopId", "onCurrentTabStopIdChange", "onEntryFocus", "preventScrollOnEntryFocus"]),
                        p = Q.useRef(null),
                        y = tf(t, p),
                        m = uJ(a),
                        b = u3(uQ({
                            prop: i,
                            defaultProp: null != l ? l : null,
                            onChange: c,
                            caller: u7
                        }), 2),
                        v = b[0],
                        h = b[1],
                        g = u3(Q.useState(!1), 2),
                        O = g[0],
                        w = g[1],
                        j = r6(u),
                        x = st(r),
                        S = Q.useRef(!1),
                        P = u3(Q.useState(0), 2),
                        E = P[0],
                        A = P[1];
                    return Q.useEffect(function() {
                        var e = p.current;
                        if (e) return e.addEventListener(u5, j),
                            function() {
                                return e.removeEventListener(u5, j)
                            }
                    }, [j]), (0, $.jsx)(si, {
                        scope: r,
                        orientation: n,
                        dir: m,
                        loop: void 0 !== o && o,
                        currentTabStopId: v,
                        onItemFocus: Q.useCallback(function(e) {
                            return h(e)
                        }, [h]),
                        onItemShiftTab: Q.useCallback(function() {
                            return w(!0)
                        }, []),
                        onFocusableItemAdd: Q.useCallback(function() {
                            return A(function(e) {
                                return e + 1
                            })
                        }, []),
                        onFocusableItemRemove: Q.useCallback(function() {
                            return A(function(e) {
                                return e - 1
                            })
                        }, []),
                        children: (0, $.jsx)(ar.div, u2(u1({
                            tabIndex: O || 0 === E ? -1 : 0,
                            "data-orientation": n
                        }, d), {
                            ref: y,
                            style: u1({
                                outline: "none"
                            }, e.style),
                            onMouseDown: uF(e.onMouseDown, function() {
                                S.current = !0
                            }),
                            onFocus: uF(e.onFocus, function(e) {
                                var t = !S.current;
                                if (e.target === e.currentTarget && t && !O) {
                                    var r = new CustomEvent(u5, u4);
                                    if (e.currentTarget.dispatchEvent(r), !r.defaultPrevented) {
                                        var n = x().filter(function(e) {
                                            return e.focusable
                                        });
                                        sp([n.find(function(e) {
                                            return e.active
                                        }), n.find(function(e) {
                                            return e.id === v
                                        })].concat(function(e) {
                                            if (Array.isArray(e)) return u0(e)
                                        }(n) || function(e) {
                                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                        }(n) || u6(n) || function() {
                                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                        }()).filter(Boolean).map(function(e) {
                                            return e.ref.current
                                        }), f)
                                    }
                                }
                                S.current = !1
                            }),
                            onBlur: uF(e.onBlur, function() {
                                return w(!1)
                            })
                        }))
                    })
                }),
                ss = "RovingFocusGroupItem",
                sf = Q.forwardRef(function(e, t) {
                    var r = e.__scopeRovingFocusGroup,
                        n = e.focusable,
                        o = void 0 === n || n,
                        a = e.active,
                        i = e.tabStopId,
                        l = e.children,
                        c = u8(e, ["__scopeRovingFocusGroup", "focusable", "active", "tabStopId", "children"]),
                        u = r8(),
                        s = i || u,
                        f = sl(ss, r),
                        d = f.currentTabStopId === s,
                        p = st(r),
                        y = f.onFocusableItemAdd,
                        m = f.onFocusableItemRemove,
                        b = f.currentTabStopId;
                    return Q.useEffect(function() {
                        if (o) return y(),
                            function() {
                                return m()
                            }
                    }, [o, y, m]), (0, $.jsx)(se.ItemSlot, {
                        scope: r,
                        id: s,
                        focusable: o,
                        active: void 0 !== a && a,
                        children: (0, $.jsx)(ar.span, u2(u1({
                            tabIndex: d ? 0 : -1,
                            "data-orientation": f.orientation
                        }, c), {
                            ref: t,
                            onMouseDown: uF(e.onMouseDown, function(e) {
                                o ? f.onItemFocus(s) : e.preventDefault()
                            }),
                            onFocus: uF(e.onFocus, function() {
                                return f.onItemFocus(s)
                            }),
                            onKeyDown: uF(e.onKeyDown, function(e) {
                                if ("Tab" === e.key && e.shiftKey) return void f.onItemShiftTab();
                                if (e.target === e.currentTarget) {
                                    var t = function(e, t, r) {
                                        var n, o = (n = e.key, "rtl" !== r ? n : "ArrowLeft" === n ? "ArrowRight" : "ArrowRight" === n ? "ArrowLeft" : n);
                                        if (!("vertical" === t && ["ArrowLeft", "ArrowRight"].includes(o)) && !("horizontal" === t && ["ArrowUp", "ArrowDown"].includes(o))) return sd[o]
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
                                            return sp(r)
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
            sf.displayName = ss;
            var sd = {
                ArrowLeft: "prev",
                ArrowUp: "prev",
                ArrowRight: "next",
                ArrowDown: "next",
                PageUp: "first",
                Home: "first",
                PageDown: "last",
                End: "last"
            };

            function sp(e) {
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

            function sy(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function sm(e) {
                var t, r = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = Q.useState(void 0)) || function(e) {
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
                            if ("string" == typeof e) return sy(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return sy(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r[0],
                    o = r[1];
                return rJ(function() {
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

            function sb(e) {
                var t = Q.useRef({
                    value: e,
                    previous: e
                });
                return Q.useMemo(function() {
                    return t.current.value !== e && (t.current.previous = t.current.value, t.current.value = e), t.current.previous
                }, [e])
            }

            function sv(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function sh(e, t) {
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
                        if ("string" == typeof e) return sv(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return sv(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var sg = function(e) {
                var t, r, n, o, a, i, l, c, u, s, f, d, p, y, m, b, v, h = e.present,
                    g = e.children,
                    O = (t = h, a = (o = sh(Q.useState(), 2))[0], i = o[1], l = Q.useRef(null), c = Q.useRef(t), u = Q.useRef("none"), f = (s = sh((r = t ? "mounted" : "unmounted", n = {
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
                    }, Q.useReducer(function(e, t) {
                        var r = n[e][t];
                        return null != r ? r : e
                    }, r)), 2))[0], d = s[1], Q.useEffect(function() {
                        var e = sO(l.current);
                        u.current = "mounted" === f ? e : "none"
                    }, [f]), rJ(function() {
                        var e = l.current,
                            r = c.current;
                        if (r !== t) {
                            var n = u.current,
                                o = sO(e);
                            t ? d("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? d("UNMOUNT") : r && n !== o ? d("ANIMATION_OUT") : d("UNMOUNT"), c.current = t
                        }
                    }, [t, d]), rJ(function() {
                        if (a) {
                            var e, t, r = null != (e = a.ownerDocument.defaultView) ? e : window,
                                n = function(e) {
                                    var n = sO(l.current).includes(CSS.escape(e.animationName));
                                    if (e.target === a && n && (d("ANIMATION_END"), !c.current)) {
                                        var o = a.style.animationFillMode;
                                        a.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                            "forwards" === a.style.animationFillMode && (a.style.animationFillMode = o)
                                        })
                                    }
                                },
                                o = function(e) {
                                    e.target === a && (u.current = sO(l.current))
                                };
                            return a.addEventListener("animationstart", o), a.addEventListener("animationcancel", n), a.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(t), a.removeEventListener("animationstart", o), a.removeEventListener("animationcancel", n), a.removeEventListener("animationend", n)
                                }
                        }
                        d("ANIMATION_END")
                    }, [a, d]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: Q.useCallback(function(e) {
                            l.current = e ? getComputedStyle(e) : null, i(e)
                        }, [])
                    }),
                    w = "function" == typeof g ? g({
                        present: O.isPresent
                    }) : Q.Children.only(g),
                    j = tf(O.ref, (v = (b = null == (y = Object.getOwnPropertyDescriptor((p = w).props, "ref")) ? void 0 : y.get) && "isReactWarning" in b && b.isReactWarning) ? p.ref : (v = (b = null == (m = Object.getOwnPropertyDescriptor(p, "ref")) ? void 0 : m.get) && "isReactWarning" in b && b.isReactWarning) ? p.props.ref : p.props.ref || p.ref);
                return "function" == typeof g || O.isPresent ? Q.cloneElement(w, {
                    ref: j
                }) : null
            };

            function sO(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }

            function sw(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function sj(e) {
                if (Array.isArray(e)) return e
            }

            function sx() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function sS(e) {
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

            function sP(e, t) {
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

            function sE(e, t) {
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

            function sA(e, t) {
                return sj(e) || function(e, t) {
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
                }(e, t) || sC(e, t) || sx()
            }

            function sC(e, t) {
                if (e) {
                    if ("string" == typeof e) return sw(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return sw(e, t)
                }
            }
            sg.displayName = "Presence";
            var sI = "Radio",
                sN = sA(rQ(sI), 2),
                sR = sN[0],
                sT = sN[1],
                sk = sA(sR(sI), 2),
                sD = sk[0],
                sM = sk[1],
                sL = Q.forwardRef(function(e, t) {
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
                        d = sE(e, ["__scopeRadio", "name", "checked", "required", "disabled", "value", "onCheck", "form"]),
                        p = sA(Q.useState(null), 2),
                        y = p[0],
                        m = p[1],
                        b = tf(t, function(e) {
                            return m(e)
                        }),
                        v = Q.useRef(!1),
                        h = !y || f || !!y.closest("form");
                    return (0, $.jsxs)(sD, {
                        scope: r,
                        checked: a,
                        disabled: l,
                        children: [(0, $.jsx)(ar.button, sP(sS({
                            type: "button",
                            role: "radio",
                            "aria-checked": a,
                            "data-state": sz(a),
                            "data-disabled": l ? "" : void 0,
                            disabled: l,
                            value: u
                        }, d), {
                            ref: b,
                            onClick: uF(e.onClick, function(e) {
                                a || null == s || s(), h && (v.current = e.isPropagationStopped(), v.current || e.stopPropagation())
                            })
                        })), h && (0, $.jsx)(sU, {
                            control: y,
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
            sL.displayName = sI;
            var s_ = "RadioIndicator",
                sF = Q.forwardRef(function(e, t) {
                    var r = e.__scopeRadio,
                        n = e.forceMount,
                        o = sE(e, ["__scopeRadio", "forceMount"]),
                        a = sM(s_, r);
                    return (0, $.jsx)(sg, {
                        present: n || a.checked,
                        children: (0, $.jsx)(ar.span, sP(sS({
                            "data-state": sz(a.checked),
                            "data-disabled": a.disabled ? "" : void 0
                        }, o), {
                            ref: t
                        }))
                    })
                });
            sF.displayName = s_;
            var sU = Q.forwardRef(function(e, t) {
                var r, n = sj(r = [e, t]) || function(e) {
                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(r) || sC(r) || sx(),
                    o = n[0],
                    a = n.slice(1),
                    i = (o.__scopeRadio, o.control),
                    l = o.checked,
                    c = o.bubbles,
                    u = void 0 === c || c,
                    s = sE(o, ["__scopeRadio", "control", "checked", "bubbles"]),
                    f = sA(a, 1)[0],
                    d = Q.useRef(null),
                    p = tf(d, f),
                    y = sb(l),
                    m = sm(i);
                return Q.useEffect(function() {
                    var e = d.current;
                    if (e) {
                        var t = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set;
                        if (y !== l && t) {
                            var r = new Event("click", {
                                bubbles: u
                            });
                            t.call(e, l), e.dispatchEvent(r)
                        }
                    }
                }, [y, l, u]), (0, $.jsx)(ar.input, sP(sS({
                    type: "radio",
                    "aria-hidden": !0,
                    defaultChecked: l
                }, s), {
                    tabIndex: -1,
                    ref: p,
                    style: sP(sS({}, s.style, m), {
                        position: "absolute",
                        pointerEvents: "none",
                        opacity: 0,
                        margin: 0
                    })
                }))
            });

            function sz(e) {
                return e ? "checked" : "unchecked"
            }
            sU.displayName = "RadioBubbleInput";
            var sK = ["ArrowUp", "ArrowDown", "ArrowLeft", "ArrowRight"],
                sH = "RadioGroup",
                sW = sA(rQ(sH, [so, sT]), 2),
                sB = sW[0];
            sW[1];
            var sV = so(),
                sq = sT(),
                s$ = sA(sB(sH), 2),
                sX = s$[0],
                sG = s$[1],
                sY = Q.forwardRef(function(e, t) {
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
                        y = sE(e, ["__scopeRadioGroup", "name", "defaultValue", "value", "required", "disabled", "orientation", "dir", "loop", "onValueChange"]),
                        m = sV(r),
                        b = uJ(f),
                        v = sA(uQ({
                            prop: a,
                            defaultProp: null != o ? o : null,
                            onChange: p,
                            caller: sH
                        }), 2),
                        h = v[0],
                        g = v[1];
                    return (0, $.jsx)(sX, {
                        scope: r,
                        name: n,
                        required: l,
                        disabled: u,
                        value: h,
                        onValueChange: g,
                        children: (0, $.jsx)(sc, sP(sS({
                            asChild: !0
                        }, m), {
                            orientation: s,
                            dir: b,
                            loop: void 0 === d || d,
                            children: (0, $.jsx)(ar.div, sP(sS({
                                role: "radiogroup",
                                "aria-required": l,
                                "aria-orientation": s,
                                "data-disabled": u ? "" : void 0,
                                dir: b
                            }, y), {
                                ref: t
                            }))
                        }))
                    })
                });
            sY.displayName = sH;
            var sQ = "RadioGroupItem",
                sZ = Q.forwardRef(function(e, t) {
                    var r = e.__scopeRadioGroup,
                        n = e.disabled,
                        o = sE(e, ["__scopeRadioGroup", "disabled"]),
                        a = sG(sQ, r),
                        i = a.disabled || n,
                        l = sV(r),
                        c = sq(r),
                        u = Q.useRef(null),
                        s = tf(t, u),
                        f = a.value === o.value,
                        d = Q.useRef(!1);
                    return Q.useEffect(function() {
                        var e = function(e) {
                                sK.includes(e.key) && (d.current = !0)
                            },
                            t = function() {
                                return d.current = !1
                            };
                        return document.addEventListener("keydown", e), document.addEventListener("keyup", t),
                            function() {
                                document.removeEventListener("keydown", e), document.removeEventListener("keyup", t)
                            }
                    }, []), (0, $.jsx)(sf, sP(sS({
                        asChild: !0
                    }, l), {
                        focusable: !i,
                        active: f,
                        children: (0, $.jsx)(sL, sP(sS({
                            disabled: i,
                            required: a.required,
                            checked: f
                        }, c, o), {
                            name: a.name,
                            ref: s,
                            onCheck: function() {
                                return a.onValueChange(o.value)
                            },
                            onKeyDown: uF(function(e) {
                                "Enter" === e.key && e.preventDefault()
                            }),
                            onFocus: uF(o.onFocus, function() {
                                var e;
                                d.current && (null == (e = u.current) || e.click())
                            })
                        }))
                    }))
                });
            sZ.displayName = sQ;
            var sJ = Q.forwardRef(function(e, t) {
                var r = e.__scopeRadioGroup,
                    n = sE(e, ["__scopeRadioGroup"]),
                    o = sq(r);
                return (0, $.jsx)(sF, sP(sS({}, o, n), {
                    ref: t
                }))
            });

            function s0(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function s1(e) {
                if (Array.isArray(e)) return e
            }

            function s2(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function s8() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function s3(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        s2(e, t, r[t])
                    })
                }
                return e
            }

            function s6(e, t) {
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

            function s5(e, t) {
                return s1(e) || function(e, t) {
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
                }(e, t) || s7(e, t) || s8()
            }

            function s4(e) {
                return s1(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || s7(e) || s8()
            }

            function s7(e, t) {
                if (e) {
                    if ("string" == typeof e) return s0(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return s0(e, t)
                }
            }
            sJ.displayName = "RadioGroupIndicator";
            var s9 = "Medium",
                fe = "Start",
                ft = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-600"
                },
                fr = {
                    XSmall: "size-150",
                    Small: "size-200",
                    Medium: "size-250",
                    Large: "size-250"
                },
                fn = {
                    XSmall: "gap-medium",
                    Small: "gap-medium",
                    Medium: "gap-medium",
                    Large: "gap-large"
                },
                fo = {
                    XSmall: "gap-medium",
                    Small: "gap-large",
                    Medium: "gap-large"
                },
                fa = {
                    XSmall: "gap-small",
                    Small: "gap-medium",
                    Medium: "gap-medium"
                },
                fi = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium"
                },
                fl = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                fc = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                fu = (0, Q.createContext)({
                    size: s9,
                    placement: fe
                }),
                fs = function() {
                    var e = (0, Q.useContext)(fu);
                    if (!e) throw Error("Radio must be used within a RadioGroup");
                    return e
                },
                ff = Z().forwardRef(function(e, t) {
                    var r = s4([e, t]),
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
                        p = s6(n, ["groupLabel", "labelTooltip", "size", "placement", "isDisabled", "className", "children", "id"]),
                        y = s5(o, 1)[0],
                        m = uL(),
                        b = d || m,
                        v = null != l ? l : s9,
                        h = null != c ? c : fe,
                        g = (0, Q.useMemo)(function() {
                            return {
                                size: v,
                                placement: h,
                                disabled: null != u && u
                            }
                        }, [v, h, u]),
                        O = a ? Z().createElement("label", {
                            htmlFor: b,
                            className: to("foundation-web-radio-group-label", fi[v], "content-default", !i && "padding-bottom-small")
                        }, a) : null,
                        w = O && i ? Z().createElement("div", {
                            className: "flex items-center gap-xsmall padding-bottom-small"
                        }, O, Z().createElement(u_, i)) : O;
                    return Z().createElement(fu.Provider, {
                        value: g
                    }, Z().createElement("div", {
                        className: to("flex fill flex-col", fo[v])
                    }, w, Z().createElement(sY, s3({
                        ref: y,
                        id: b,
                        className: to("foundation-web-radio-group", "flex flex-col", fa[v], s)
                    }, p), f)))
                });
            ff.displayName = "RadioGroup";
            var fd = Z().forwardRef(function(e, t) {
                var r, n = s4([e, t]),
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
                    y = o.size,
                    m = o.placement,
                    b = s6(o, ["className", "value", "isDisabled", "label", "aria-label", "aria-labelledby", "hint", "id", "size", "placement"]),
                    v = s5(a, 1)[0],
                    h = (0, Q.useRef)(null),
                    g = (0, Q.useRef)(null),
                    O = s5((0, Q.useState)(!1), 2),
                    w = O[0],
                    j = O[1],
                    x = fs(),
                    S = x.size,
                    P = x.placement,
                    E = x.disabled,
                    A = null != y ? y : S,
                    C = null != m ? m : P,
                    I = uL(),
                    N = p || I,
                    R = void 0 !== u && "" !== u,
                    T = "".concat(N, "Label"),
                    k = R ? T : f,
                    D = !!d,
                    M = c || E;
                return (0, Q.useEffect)(function() {
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
                }, [D, R]), Z().createElement("div", {
                    className: to("flex gap-medium", (s2(r = {}, tl, M), s2(r, "cursor-pointer", !M), s2(r, "flex-row", "Start" === C), s2(r, "flex-row-reverse", "End" === C), r))
                }, Z().createElement(sZ, s3({
                    ref: v,
                    className: to("foundation-web-radio", ta, !M && "cursor-pointer", "padding-none shrink-0 grow-0 basis-auto flex items-center justify-center bg-none data-[state=checked]:bg-action-sub-emphasis radius-circle stroke-contrast-alpha stroke-standard", fn[A], ft[A], i),
                    disabled: M,
                    value: l,
                    id: N,
                    "aria-describedby": D ? "".concat(N, "Hint") : void 0,
                    "aria-label": s,
                    "aria-labelledby": k
                }, b), Z().createElement(ti, null), Z().createElement(sJ, {
                    className: to("radius-circle bg-inverse-action-sub-emphasis", fr[A])
                })), Z().createElement("div", {
                    className: to("flex fill flex-col width-full", {
                        "gap-xsmall": w,
                        "gap-none": !w,
                        "padding-top-xxsmall": "XSmall" !== A
                    })
                }, R && Z().createElement("label", {
                    ref: h,
                    id: T,
                    htmlFor: N,
                    "aria-describedby": D ? "".concat(N, "Hint") : void 0,
                    className: to(fl[A], "content-emphasis", !M && "cursor-pointer")
                }, u), D && Z().createElement("div", {
                    ref: g,
                    id: "".concat(N, "Hint"),
                    className: to(fc[A], "content-default")
                }, d)))
            });
            fd.displayName = "Radio";
            var fp = function(e) {
                var t = e.isOpen,
                    r = e.onOpenChange,
                    n = e.options,
                    o = e.value,
                    a = e.onSelect,
                    i = (0, Y.useTranslation)().translate;
                return (0, $.jsx)(uA, {
                    open: t,
                    onOpenChange: r,
                    children: (0, $.jsxs)(uC, {
                        largeScreenVariant: "center",
                        className: "trades-sheet",
                        mobilePortraitClassName: "trades-sheet-full-bleed",
                        closeLabel: i("Action.Close"),
                        children: [(0, $.jsx)(uN, {
                            children: i("Header.TradeQualityFilter")
                        }), (0, $.jsxs)(uI, {
                            children: [(0, $.jsx)(uT, {
                                children: (0, $.jsx)("p", {
                                    className: "trade-quality-sheet-description",
                                    children: i("Message.TradeQualityMessage")
                                })
                            }), (0, $.jsx)(ff, {
                                value: o,
                                onValueChange: a,
                                placement: "End",
                                size: "Medium",
                                children: n.map(function(e) {
                                    return (0, $.jsx)(fd, {
                                        value: e.value,
                                        label: e.label
                                    }, e.value)
                                })
                            })]
                        })]
                    })
                })
            };

            function fy(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function fm(e) {
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

            function fb(e, t) {
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

            function fv(e, t) {
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
                        if ("string" == typeof e) return fy(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return fy(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var fh = [{
                    value: ed.tradeStatusType.inbound,
                    labelKey: "Label.Received",
                    emptyTitleKey: "Label.YouHaveNoTradesRecieved",
                    emptySubtitleKey: "Label.AllOffersWillBeHere"
                }, {
                    value: ed.tradeStatusType.outbound,
                    labelKey: "Label.Sent",
                    emptyTitleKey: "Label.YouHaveNoTradesSent",
                    emptySubtitleKey: "Label.AllYourRequestsWillBeHere"
                }, {
                    value: ed.tradeStatusType.completed,
                    labelKey: "Label.Completed",
                    emptyTitleKey: "Label.YouHaveNoCompletedTrades",
                    emptySubtitleKey: "Label.AllCompletedTradesWillBeHere"
                }, {
                    value: ed.tradeStatusType.inactive,
                    labelKey: "Label.Closed",
                    emptyTitleKey: "Label.YouHaveNoClosedTrades",
                    emptySubtitleKey: "Label.AllClosedTradesWillBeHere"
                }],
                fg = [{
                    value: ed.tradeQualityType.none,
                    labelKey: "Label.None"
                }, {
                    value: ed.tradeQualityType.low,
                    labelKey: "Label.Low"
                }, {
                    value: ed.tradeQualityType.medium,
                    labelKey: "Label.Medium"
                }, {
                    value: ed.tradeQualityType.high,
                    labelKey: "Label.High"
                }],
                fO = function(e) {
                    var t, r = e.systemFeedbackService,
                        n = (0, Y.useTranslation)().translate,
                        o = t9(),
                        a = (0, Q.useMemo)(function() {
                            return tJ()
                        }, []),
                        i = fv((0, Q.useState)(ed.tradeStatusType.inbound), 2),
                        l = i[0],
                        c = i[1],
                        u = fv((0, Q.useState)(ed.tradeQualityType.none), 2),
                        s = u[0],
                        f = u[1],
                        d = fv((0, Q.useState)(null), 2),
                        p = d[0],
                        y = d[1],
                        m = fv((0, Q.useState)(!1), 2),
                        b = m[0],
                        v = m[1],
                        h = fv((0, Q.useState)("list"), 2),
                        g = h[0],
                        O = h[1],
                        w = fv((0, Q.useState)(!1), 2),
                        j = w[0],
                        x = w[1],
                        S = fv((0, Q.useState)(!1), 2),
                        P = S[0],
                        E = S[1],
                        A = (0, Q.useRef)(null),
                        C = (0, Q.useRef)(null),
                        I = (0, Q.useMemo)(function() {
                            return fh.map(function(e) {
                                return {
                                    value: e.value,
                                    label: n(e.labelKey)
                                }
                            })
                        }, [n]),
                        N = (0, Q.useMemo)(function() {
                            return fg.map(function(e) {
                                return {
                                    value: e.value,
                                    label: n(e.labelKey)
                                }
                            })
                        }, [n]),
                        R = null != (t = fh.find(function(e) {
                            return e.value === l
                        })) ? t : fh[0],
                        T = (0, Q.useCallback)(function(e) {
                            var t;
                            (A.current = e ? e.id : null, e) ? (y(fb(fm({}, e), {
                                offers: void 0
                            })), v(!0), eS(null == (t = (0, ec.authenticatedUser)()) ? void 0 : t.id, e.id).then(function(t) {
                                if (t && A.current === e.id) {
                                    var r = fb(fm({}, t), {
                                        id: e.id,
                                        tradeStatusType: e.tradeStatusType,
                                        expiration: e.expiration,
                                        status: e.status
                                    });
                                    y(r), v(!1), eK(eL, "viewTrade", fb(fm({}, eB(r)), {
                                        tradeId: r.id,
                                        tradeStatusType: r.tradeStatusType
                                    }))
                                }
                            }).catch(function(e) {
                                eW("viewTrade", e), v(!1)
                            })) : y(null)
                        }, []),
                        k = (0, Q.useCallback)(function(e) {
                            c(e), y(null), A.current = null, C.current && (C.current.scrollTop = 0);
                            var t = new URL(window.location.href);
                            t.searchParams.set("tab", e), window.history.replaceState({}, "", t.toString()), o.loadFirstPage(e).then(function(e) {
                                e.length > 0 && T(e[0])
                            }).catch(function(t) {
                                eW("loadTradesList", t, {
                                    tab: e
                                }), r.warning(n("Error.FailedToLoadTradesList"))
                            })
                        }, [o, T, r, n]);
                    (0, Q.useEffect)(function() {
                        ev(function() {
                            var e;
                            return ew(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        return e = {
                                            url: "".concat(ed.urls.tradesApi, "/v1/trades/expire-outdated"),
                                            withCredentials: !0
                                        }, [4, ey.post(e)];
                                    case 1:
                                        return t.sent(), [2]
                                }
                            })
                        })().catch(function() {}), ev(function() {
                            var e;
                            return ew(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        return e = {
                                            url: ed.urls.getSettings,
                                            withCredentials: !0
                                        }, [4, ey.get(e)];
                                    case 1:
                                        return [2, t.sent().data]
                                }
                            })
                        })().then(function(e) {
                            (null == e ? void 0 : e.tradeQualityFilter) && f(e.tradeQualityFilter)
                        }).catch(function() {});
                        var e, t, r = new URLSearchParams(window.location.search).get("tab");
                        k(null != (e = null == (t = fh.find(function(e) {
                            return e.value === r
                        })) ? void 0 : t.value) ? e : fh[0].value)
                    }, []);
                    var D = (0, Q.useCallback)(function() {
                            o.loadNextPage().catch(function(e) {
                                eW("loadTradesList", e, {
                                    paged: !0
                                }), r.warning(n("Error.FailedToLoadTradesList"))
                            })
                        }, [o, r, n]),
                        M = (0, Q.useCallback)(function() {
                            var e = C.current;
                            e && !o.loading && o.hasMore && e.scrollTop + e.offsetHeight >= e.scrollHeight - ed.tradesList.scrollBarLazyLoadDistancePx && D()
                        }, [D, o.loading, o.hasMore]);
                    (0, Q.useEffect)(function() {
                        var e = C.current;
                        e && !o.loading && o.hasMore && !o.loadFailed && e.scrollHeight <= e.clientHeight + ed.tradesList.scrollBarLazyLoadDistancePx && D()
                    }, [o.trades, o.loading, o.hasMore, o.loadFailed, D]);
                    var L = function(e) {
                            T(e), O("detail"), ez(eT, "viewTrade")
                        },
                        _ = function(e, t) {
                            var r;
                            eK("tradeProfileClick", t, {
                                tradeStatusType: e.tradeStatusType || l,
                                partnerId: null == (r = e.user) ? void 0 : r.id,
                                tradeId: e.id
                            })
                        },
                        F = function() {
                            E(!0), ez(eT, "tradeInfo")
                        };
                    return (0, $.jsxs)("div", {
                        className: "trades-react".concat(a ? " is-mobile" : ""),
                        children: [(!a || "list" === g) && (0, $.jsxs)("div", {
                            className: "col-xs-12 col-sm-4 trade-row-list",
                            children: [(0, $.jsxs)("div", {
                                className: "trades-header",
                                children: [(0, $.jsx)("h1", {
                                    children: n("Heading.TradesList")
                                }), (0, $.jsxs)("div", {
                                    className: "trades-header-actions",
                                    children: [(0, $.jsx)(tU, {
                                        onClick: F,
                                        icon: "icon-regular-circle-i",
                                        ariaLabel: n("Header.HowToTrade"),
                                        variant: "Utility",
                                        size: "Medium"
                                    }), (0, $.jsx)(tU, {
                                        onClick: function() {
                                            x(!0), ez(eT, "tradeQualityFilter")
                                        },
                                        icon: "icon-regular-gear",
                                        ariaLabel: n("Header.TradeQualityFilter"),
                                        variant: "Utility",
                                        size: "Medium"
                                    })]
                                })]
                            }), (0, $.jsx)(rA, {
                                options: I,
                                value: l,
                                onSelect: function(e) {
                                    var t = e === l;
                                    if (!t || !o.loading) {
                                        var r = t ? "refreshTradeCategory" : "switchTradeCategory";
                                        ez(eT, r, {
                                            category: e
                                        }), eK(eF, r, {
                                            filterType: "statusTab",
                                            value: e
                                        }), k(e)
                                    }
                                }
                            }), (0, $.jsxs)("div", {
                                id: "trade-row-scroll-container",
                                ref: C,
                                onScroll: M,
                                children: [o.trades.map(function(e) {
                                    return (0, $.jsx)(rT, {
                                        trade: e,
                                        isSelected: (null == p ? void 0 : p.id) === e.id,
                                        onClick: L,
                                        onProfileClick: _
                                    }, e.id)
                                }), o.loading && (0, $.jsx)("span", {
                                    className: "spinner spinner-default"
                                }), o.noResults && !o.loading && (0, $.jsx)(ur, {
                                    title: n(R.emptyTitleKey),
                                    subtitle: n(R.emptySubtitleKey),
                                    action: {
                                        label: n("Action.LearnMore"),
                                        onClick: F
                                    }
                                })]
                            })]
                        }), (!a || "detail" === g) && (0, $.jsx)("div", {
                            className: "col-xs-12 col-sm-8 trades-list-detail",
                            children: (0, $.jsx)(ut, {
                                trade: p,
                                detailLoading: b,
                                isMobile: a,
                                onBack: function() {
                                    O("list")
                                },
                                onProfileClick: _,
                                onTradeRemoved: function(e) {
                                    var t = (null == p ? void 0 : p.id) === e,
                                        r = o.trades.filter(function(t) {
                                            return t.id !== e
                                        });
                                    o.removeTrade(e), t && (r.length > 0 ? T(r[0]) : (T(null), O("list"))), M()
                                },
                                systemFeedbackService: r
                            })
                        }), (0, $.jsx)(uD, {
                            isOpen: P,
                            onOpenChange: E,
                            onShopClick: function() {
                                ez(eT, "shopLimiteds")
                            },
                            onLearnMoreClick: function() {
                                eK("tradeHowToTradeClick", "howToTrade")
                            }
                        }), (0, $.jsx)(fp, {
                            isOpen: j,
                            onOpenChange: x,
                            options: N,
                            value: s,
                            onSelect: function(e) {
                                f(e), ev(function() {
                                    var t;
                                    return ew(this, function(r) {
                                        switch (r.label) {
                                            case 0:
                                                return t = {
                                                    url: ed.urls.setTradeQuality,
                                                    withCredentials: !0
                                                }, [4, ey.post(t, {
                                                    tradeQualityFilter: e
                                                })];
                                            case 1:
                                                return r.sent(), [2]
                                        }
                                    })
                                })().catch(function() {}), eK(eF, "tradeQuality", {
                                    filterType: "tradeQuality",
                                    value: e
                                })
                            }
                        })]
                    })
                };

            function fw(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function fj(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function fx(e) {
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

            function fS(e, t) {
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

            function fP(e, t) {
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
                }(e, t) || fA(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function fE(e) {
                return function(e) {
                    if (Array.isArray(e)) return fw(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || fA(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function fA(e, t) {
                if (e) {
                    if ("string" == typeof e) return fw(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return fw(e, t)
                }
            }
            var fC = ed.maxItemsPerSide,
                fI = ed.tradeErrors,
                fN = function(e) {
                    for (var t = [], r = 0; r < fC; r += 1) e[r] ? t.push({
                        type: "item",
                        tradableItem: e[r]
                    }) : 0 === r || e[r - 1] ? t.push({
                        type: "add-item"
                    }) : t.push({
                        type: "empty"
                    });
                    return t
                },
                fR = function(e) {
                    return fS(fx({}, e), {
                        slots: fN(e.items)
                    })
                },
                fT = function(e) {
                    var t = (0, Y.useTranslation)().translate,
                        r = el(),
                        n = r.route,
                        o = r.navigate,
                        a = (0, Q.useRef)(function() {}),
                        i = rK(e, {
                            onVerificationSuccess: function() {
                                a.current()
                            },
                            onChallengeAbandoned: function() {}
                        }),
                        l = fP((0, Q.useState)([]), 2),
                        c = l[0],
                        u = l[1],
                        s = fP((0, Q.useState)(!1), 2),
                        f = s[0],
                        d = s[1],
                        p = fP((0, Q.useState)(null), 2),
                        y = p[0],
                        m = p[1],
                        b = fP((0, Q.useState)(null), 2),
                        v = b[0],
                        h = b[1],
                        g = fP((0, Q.useState)(null), 2),
                        O = g[0],
                        w = g[1],
                        j = fP((0, Q.useState)(!1), 2),
                        x = j[0],
                        S = j[1],
                        P = fP((0, Q.useState)(!1), 2),
                        E = P[0],
                        A = P[1],
                        C = fP((0, Q.useState)(null), 2),
                        I = C[0],
                        N = C[1],
                        R = fP((0, Q.useState)(!1), 2),
                        T = R[0],
                        k = R[1],
                        D = (0, Q.useRef)([]),
                        M = (0, Q.useRef)(null),
                        L = (0, Q.useRef)(null),
                        _ = (0, Q.useRef)({}),
                        F = (0, Q.useCallback)(function(e) {
                            D.current = e, u(e)
                        }, []),
                        U = (0, Q.useCallback)(function() {
                            w(null)
                        }, []),
                        z = (0, Q.useCallback)(function(e) {
                            e.id && _.current[e.id] && (_.current[e.id] = null)
                        }, []),
                        K = function(e) {
                            return D.current.find(function(t) {
                                return t.user.id === e
                            })
                        },
                        H = (0, Q.useCallback)(function(e) {
                            var t = K(e.userId);
                            return !!(null == t ? void 0 : t.items.some(function(t) {
                                return t.id === e.id
                            }))
                        }, []),
                        W = (0, Q.useCallback)(function(e) {
                            var t = K(e);
                            return !!(t && t.items.length >= fC)
                        }, []),
                        B = (0, Q.useCallback)(function(e) {
                            return H(e) || W(e.userId) || !!e.isOnHold
                        }, [H, W]),
                        V = (0, Q.useCallback)(function(e) {
                            return !!(e.id && _.current[e.id])
                        }, []),
                        q = (0, Q.useCallback)(function(e) {
                            return rU(e.id ? _.current[e.id] : null, t)
                        }, [t]),
                        $ = (0, Q.useCallback)(function(e) {
                            var t = K(e.userId);
                            !t || t.items.length >= fC || t.items.some(function(t) {
                                return t.id === e.id
                            }) || e.isOnHold || (F(D.current.map(function(t) {
                                return t.user.id === e.userId ? fR(fS(fx({}, t), {
                                    items: fE(t.items).concat([e])
                                })) : fR(fS(fx({}, t), {
                                    items: t.items.filter(function(t) {
                                        return t.id !== e.id
                                    })
                                }))
                            })), z(e), U())
                        }, [z, U, F]),
                        X = (0, Q.useCallback)(function(e) {
                            F(D.current.map(function(t) {
                                return fR(fS(fx({}, t), {
                                    items: t.items.filter(function(t) {
                                        return t.id !== e.id
                                    })
                                }))
                            })), z(e), U()
                        }, [z, U, F]),
                        G = (0, Q.useCallback)(function(e) {
                            H(e) ? (X(e), ez(ek, "itemRemoved")) : ($(e), ez(ek, "itemAdded"))
                        }, [$, H, X]),
                        Z = (0, Q.useCallback)(function(e, t) {
                            var r = t.replace(/[^0-9]/g, ""),
                                n = "" === r ? null : parseInt(r, 10);
                            0 === n && (n = null), F(D.current.map(function(t) {
                                return t.user.id === e ? fS(fx({}, t), {
                                    robux: n
                                }) : t
                            }))
                        }, [F]),
                        J = (0, Q.useCallback)(function(e) {
                            e.robux && e.robux > 0 && ez(ek, "robuxAdded")
                        }, []),
                        ee = function() {
                            var e = D.current.map(function(e) {
                                return {
                                    userId: e.user.id,
                                    robux: e.robux ? parseInt(String(e.robux), 10) : 0,
                                    collectibleItemInstanceIds: e.items.map(function(e) {
                                        return e.id
                                    })
                                }
                            });
                            return {
                                senderOffer: e.find(function(e) {
                                    var t;
                                    return e.userId === (null == (t = (0, ec.authenticatedUser)()) ? void 0 : t.id)
                                }),
                                recipientOffer: e.find(function(e) {
                                    var t;
                                    return e.userId !== (null == (t = (0, ec.authenticatedUser)()) ? void 0 : t.id)
                                })
                            }
                        },
                        et = function(e) {
                            var r, n, o = Math.ceil((null != (r = e.ExpirationTimeInMinutes) ? r : 0) / 60),
                                a = t(ed.economicRestrictionsViolationLabels[null != (n = e.FailureReason) ? n : ""]);
                            N(o > 24 ? t("Text.EconomicRestrictionsDaysGeneral", {
                                violation: a,
                                day: Math.ceil(o / 24)
                            }) : t("Text.EconomicRestrictionsHoursGeneral", {
                                violation: a,
                                hour: o
                            }))
                        },
                        er = function(e) {
                            var t, r;
                            switch (null != (t = null == (r = eA(e)) ? void 0 : r.code) ? t : eE(e)[0]) {
                                case fI.unauthorized:
                                    return "unauthorized";
                                case fI.userCannotTrade:
                                    return "userCannotTrade";
                                case fI.userPrivacyTooStrict:
                                    return "userPrivacyTooStrict";
                                case fI.invalidUserAssets:
                                    return "invalidUserAssets";
                                case fI.tradeUnbalanced:
                                    return "tradeUnbalanced";
                                case fI.tradeQualityInsufficient:
                                    return "tradeQualityInsufficient";
                                case fI.insufficientRobux:
                                    return "insufficientRobux";
                                case fI.tooManyRobux:
                                    return "tooManyRobux";
                                case fI.tradeFrictionEncountered:
                                    return "tradeFrictionEncountered";
                                default:
                                    return "unknown"
                            }
                        },
                        en = function(r) {
                            var n, o = eA(r),
                                a = null != (n = null == o ? void 0 : o.code) ? n : eE(r)[0];
                            switch (a) {
                                case fI.unauthorized:
                                    e.warning(t("Error.TradeUnauthorized"));
                                    break;
                                case fI.userCannotTrade:
                                    e.warning(t("Error.TradeUsersCannotTrade"));
                                    break;
                                case fI.userPrivacyTooStrict:
                                    e.warning((null == o ? void 0 : o.field) === "sender" ? t("Error.YourPrivacyTooStrict") : t("Error.PartnerPrivacyTooStrict"));
                                    break;
                                case fI.invalidUserAssets:
                                    break;
                                case fI.tradeUnbalanced:
                                    w(t("Error.TradeUnbalanced", {
                                        ratio: ed.minValueRatio
                                    }));
                                    break;
                                case fI.tradeQualityInsufficient:
                                    w(t("Error.TradeQualityInsufficient", {
                                        minValue: (0, tz.formatNumber)(Number(null == o ? void 0 : o.fieldData) || 0)
                                    }));
                                    break;
                                case fI.insufficientRobux:
                                    w(t("Error.YouDoNotHaveEnoughRobux"));
                                    break;
                                case fI.tooManyRobux:
                                    w(t((null == o ? void 0 : o.field) === "sender" ? "Error.RequestHasTooManyRobux" : "Error.OfferHasTooManyRobux", {
                                        percent: ed.maxRobuxAsPercentOfValue
                                    }));
                                    break;
                                case fI.tradeFrictionEncountered:
                                    rL().then(function(e) {
                                        e ? i.start() : k(!0)
                                    }).catch(function() {
                                        k(!0)
                                    });
                                    break;
                                default:
                                    e.warning(rF(null != a ? [a] : [], t))
                            }
                        },
                        eo = (0, Q.useCallback)(function() {
                            o({
                                view: "list",
                                tab: ed.tradeStatusType.outbound
                            })
                        }, [o]),
                        ea = (0, Q.useCallback)(function() {
                            var r, n, o = D.current,
                                a = null !== L.current,
                                i = ee();
                            S(!0);
                            var l = o.find(function(e) {
                                    var t;
                                    return e.user.id === (null == (t = (0, ec.authenticatedUser)()) ? void 0 : t.id)
                                }),
                                c = fS(fx({}, eB({
                                    offers: [o.find(function(e) {
                                        var t;
                                        return e.user.id !== (null == (t = (0, ec.authenticatedUser)()) ? void 0 : t.id)
                                    }), l]
                                })), {
                                    hasRobux: D.current.some(function(e) {
                                        return !!(e.robux && e.robux > 0)
                                    }),
                                    partnerId: null == (n = M.current) ? void 0 : n.id
                                }),
                                u = a ? "counter" : "newTrade";
                            (a ? (r = L.current, ev(function() {
                                var e, t;
                                return ew(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            return e = {
                                                url: "".concat(ed.urls.tradesApi, "/v2/trades/").concat(r, "/counter"),
                                                withCredentials: !0
                                            }, [4, ey.post(e, i)];
                                        case 1:
                                            return [2, null != (t = n.sent().data) ? t : {}]
                                    }
                                })
                            })()) : ev(function() {
                                var e, t;
                                return ew(this, function(r) {
                                    switch (r.label) {
                                        case 0:
                                            return e = {
                                                url: "".concat(ed.urls.tradesApi, "/v2/trades/send"),
                                                withCredentials: !0
                                            }, [4, ey.post(e, i)];
                                        case 1:
                                            return [2, null != (t = r.sent().data) ? t : {}]
                                    }
                                })
                            })()).then(function(r) {
                                if (S(!1), void 0 !== r.FailureReason && void 0 !== r.ExpirationTimeInMinutes) return void et(r);
                                var n = fS(fx({}, c), {
                                    success: !0
                                });
                                (null == r ? void 0 : r.tradeId) && (n.tradeId = r.tradeId), ez(eD, u, n);
                                var o = eV();
                                eK(a ? "tradeCountered" : "tradeInitiated", u, fS(fx({}, n), {
                                    entrySource: o.entrySource,
                                    referrer: o.referrer
                                })), e.success(t(a ? "Message.TradeCounteredSuccess" : "Message.TradeSentSuccess")), eo()
                            }, function(e) {
                                ez(eD, u, fS(fx({}, c), {
                                    success: !1,
                                    reason: er(e)
                                })), eW(a ? "counterTrade" : "sendTrade", e, {
                                    reason: er(e)
                                }), S(!1), en(e)
                            })
                        }, [eo, e, t]);
                    a.current = ea;
                    var ei = (0, Q.useCallback)(function() {
                            ((U(), D.current.length > 0 && D.current.every(function(e) {
                                return e.items.length > 0
                            })) ? !D.current.every(function(e) {
                                return tY(e.robux)
                            }) && (w(t("Error.InvalidRobux")), 1) : (w(t("Label.OffersNeedItems")), 1)) || (U(), _.current = {}, A(!0))
                        }, [U, t]),
                        eu = (0, Q.useCallback)(function() {
                            A(!1)
                        }, []),
                        es = (0, Q.useCallback)(function() {
                            A(!1), ea()
                        }, [ea]),
                        ef = (0, Q.useCallback)(function() {
                            N(null)
                        }, []),
                        ep = (0, Q.useCallback)(function() {
                            k(!1)
                        }, []),
                        em = (0, Q.useCallback)(function(e, r, n) {
                            var o, a = e.id === (null == (o = (0, ec.authenticatedUser)()) ? void 0 : o.id);
                            return fR({
                                isMyOffer: a,
                                label: t(a ? "Label.YourOffer" : "Label.YourRequest"),
                                robux: null != r ? r : null,
                                items: n || [],
                                slots: [],
                                user: e
                            })
                        }, [t]),
                        eb = (0, Q.useCallback)(function(e, t) {
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
                                            return r = new Set(e), [4, ev(function() {
                                                var e, r, n, o;
                                                return ew(this, function(a) {
                                                    switch (a.label) {
                                                        case 0:
                                                            if (!t || t <= 0) return [2, []];
                                                            e = [], a.label = 1;
                                                        case 1:
                                                            a.trys.push([1, 6, , 7]), a.label = 2;
                                                        case 2:
                                                            return [4, eP(t, {
                                                                cursor: r
                                                            })];
                                                        case 3:
                                                            o = a.sent(), (n = e).push.apply(n, eO(o.items)), r = o.nextPageCursor || void 0, a.label = 4;
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
                                                }).slice(0, fC).map(function(e) {
                                                    return fS(fx({}, e), {
                                                        userId: t,
                                                        id: e.collectibleItemInstanceId
                                                    })
                                                })).length) return [2];
                                            return F(D.current.map(function(e) {
                                                return e.user.id === t ? fR(fS(fx({}, e), {
                                                    items: fE(e.items).concat(fE(n))
                                                })) : e
                                            })), n.forEach(z), [2]
                                    }
                                })
                            }, function() {
                                var e = this,
                                    t = arguments;
                                return new Promise(function(n, o) {
                                    var a = r.apply(e, t);

                                    function i(e) {
                                        fj(a, n, o, i, l, "next", e)
                                    }

                                    function l(e) {
                                        fj(a, n, o, i, l, "throw", e)
                                    }
                                    i(void 0)
                                })
                            })()
                        }, [z, F]),
                        eh = (0, Q.useCallback)(function() {
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
                                    var o = D.current.find(function(e) {
                                        return e.isMyOffer
                                    });
                                    eb(r, null == o ? void 0 : o.user.id).catch(function(e) {
                                        eW("addItemsFromUrl", e)
                                    })
                                }
                                if (n.length) {
                                    var a = D.current.find(function(e) {
                                        return !e.isMyOffer
                                    });
                                    eb(n, null == a ? void 0 : a.user.id).catch(function(e) {
                                        eW("addItemsFromUrl", e)
                                    })
                                }
                            }
                        }, [eb]),
                        eg = (0, Q.useCallback)(function(r) {
                            ev(function() {
                                var e, t, n, o;
                                return ew(this, function(a) {
                                    switch (a.label) {
                                        case 0:
                                            if (!r || r <= 0) throw Error("Invalid user id");
                                            return t = {
                                                url: "".concat(ed.urls.usersApi, "/v1/users"),
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
                                                nameForDisplay: ej(o.displayName, o.name)
                                            }]
                                    }
                                })
                            })().then(function(e) {
                                eJ("openNewTrade: loaded partner", e);
                                var t, r = null != (t = (0, ec.authenticatedUser)()) ? t : {},
                                    n = r.id,
                                    o = r.name,
                                    a = r.displayName,
                                    i = {
                                        id: n,
                                        name: o,
                                        displayName: a,
                                        nameForDisplay: ej(a, o)
                                    },
                                    l = [em(e, null, []), em(i, null, [])];
                                h(e), M.current = e, F(l), d(!0), eh()
                            }).catch(function(r) {
                                e0("openNewTrade: getUserById failed", r), eW("loadTradePartner", r), m(t("Message.InvalidUser")), e.warning(t("Message.InvalidUser"))
                            })
                        }, [eh, F, em, e, t]),
                        ex = (0, Q.useCallback)(function(e) {
                            eJ("openNewTrade: userId=", e, "me=", null == (t = (0, ec.authenticatedUser)()) ? void 0 : t.id), F([]), L.current = null, d(!1), m(null);
                            var t, r = ed.canTradeWithStatus,
                                n = ed.urls;
                            ev(function() {
                                var t, r;
                                return ew(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            return t = {
                                                url: "".concat(ed.urls.tradesApi, "/v1/users/").concat(e, "/can-trade-with"),
                                                withCredentials: !0
                                            }, [4, ey.get(t)];
                                        case 1:
                                            return [2, null != (r = n.sent().data) ? r : null]
                                    }
                                })
                            })().then(function(t) {
                                var o = null == t ? void 0 : t.status;
                                if (eJ("openNewTrade: canTradeWith status=", o), o === r.canTrade) return void eg(e);
                                if (o === r.senderCannotTrade) {
                                    window.location.href = n.membership;
                                    return
                                }
                                window.location.href = o && o !== r.cannotTradeWithSelf && o !== r.unknownError ? n.forbidden : n.badRequest
                            }).catch(function(e) {
                                e0("openNewTrade: canTradeWith failed", e), eW("canTradeWith", e), window.location.href = n.badRequest
                            })
                        }, [F, eg]),
                        eC = (0, Q.useCallback)(function(r) {
                            var n;
                            eJ("openCounterTrade: tradeId=", r), F([]), L.current = r, d(!1), m(null), eS(null == (n = (0, ec.authenticatedUser)()) ? void 0 : n.id, r).then(function(e) {
                                if (eJ("openCounterTrade: loaded trade", e), !e || !e.offers) {
                                    e0("openCounterTrade: trade has no offers", e), m(t("Error.TradeUnknownError"));
                                    return
                                }
                                if (e.offers.some(function(e) {
                                        return !e.user
                                    })) {
                                    e0("openCounterTrade: trade has a moderated/null participant", e), m(t("Error.TradeUnknownError"));
                                    return
                                }
                                var r, n, o = e.offers.map(function(t) {
                                        var r, n, o = t.items.map(function(e) {
                                            return fS(fx({}, e), {
                                                id: e.collectibleItemInstanceId,
                                                userId: t.user.id
                                            })
                                        });
                                        return em(fS(fx({}, t.user), {
                                            nameForDisplay: null != (r = null == (n = e.user) ? void 0 : n.nameForDisplay) ? r : t.user.nameForDisplay
                                        }), t.robux, o)
                                    }),
                                    a = null != (r = null == (n = o.find(function(e) {
                                        return !e.isMyOffer
                                    })) ? void 0 : n.user) ? r : null;
                                h(a), M.current = a, F(o), d(!0)
                            }).catch(function(r) {
                                e0("openCounterTrade: getTrade failed", r), eW("openCounterTrade", r), m(t("Error.TradeUnknownError")), e.warning(t("Error.TradeUnknownError"))
                            })
                        }, [F, em, e, t]);
                    return (0, Q.useEffect)(function() {
                        eJ("useTradeRequest init effect for route", n), "create" === n.view && n.userId ? ex(n.userId) : "counter" === n.view && n.tradeId ? eC(n.tradeId) : e0("useTradeRequest: route missing required params", n)
                    }, [n.view, n.userId, n.tradeId]), {
                        loaded: f,
                        initError: y,
                        partner: v,
                        offers: c,
                        error: O,
                        tradePending: x,
                        isCounterTrade: null !== L.current,
                        isRobuxAmountValid: tY,
                        toggleItem: G,
                        removeItem: X,
                        setRobux: Z,
                        onRobuxBlur: J,
                        isItemInOffers: H,
                        isItemUnavailable: B,
                        doesItemHaveError: V,
                        getItemErrorReason: q,
                        confirmSendOpen: E,
                        requestSend: ei,
                        cancelSend: eu,
                        confirmSend: es,
                        economicBody: I,
                        dismissEconomic: ef,
                        verificationRedirectOpen: T,
                        dismissVerificationRedirect: ep
                    }
                };

            function fk(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function fD(e, t, r, n, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function fM(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var a = e.apply(t, r);

                        function i(e) {
                            fD(a, n, o, i, l, "next", e)
                        }

                        function l(e) {
                            fD(a, n, o, i, l, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function fL(e, t) {
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
                }(e, t) || fF(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function f_(e) {
                return function(e) {
                    if (Array.isArray(e)) return fk(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || fF(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function fF(e, t) {
                if (e) {
                    if ("string" == typeof e) return fk(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return fk(e, t)
                }
            }

            function fU(e, t) {
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
            var fz = ed.getTradableItemsLimit,
                fK = function(e) {
                    var t = fL((0, Q.useState)([]), 2),
                        r = t[0],
                        n = t[1],
                        o = fL((0, Q.useState)(!1), 2),
                        a = o[0],
                        i = o[1],
                        l = fL((0, Q.useState)(!1), 2),
                        c = l[0],
                        u = l[1],
                        s = fL((0, Q.useState)(""), 2),
                        f = s[0],
                        d = s[1],
                        p = fL((0, Q.useState)(""), 2),
                        y = p[0],
                        m = p[1],
                        b = fL((0, Q.useState)(!1), 2),
                        v = b[0],
                        h = b[1],
                        g = fL((0, Q.useState)(!1), 2),
                        O = g[0],
                        w = g[1],
                        j = fL((0, Q.useState)(1), 2),
                        x = j[0],
                        S = j[1],
                        P = (0, Y.useDebounce)(y.trim(), ed.inventorySearchDebounceMs),
                        E = (0, Q.useRef)(window.innerWidth < 991 ? 12 : 10),
                        A = (0, Q.useRef)([]),
                        C = (0, Q.useRef)(0),
                        I = (0, Q.useRef)(null),
                        N = (0, Q.useRef)(0),
                        R = (0, Q.useCallback)(function() {
                            var e = E.current,
                                t = C.current * e,
                                r = A.current;
                            n(r.slice(t, t + e)), h(C.current > 0), w(r.length > t + e || null !== I.current), S(C.current + 1)
                        }, []),
                        T = (0, Q.useCallback)(function(t, r, n) {
                            return fM(function() {
                                var o;
                                return fU(this, function(a) {
                                    switch (a.label) {
                                        case 0:
                                            return [4, eP(e, {
                                                itemTargetType: t || void 0,
                                                cursor: I.current || void 0,
                                                limit: fz,
                                                search: r || void 0
                                            })];
                                        case 1:
                                            if (o = a.sent(), N.current !== n) return [2, !1];
                                            return A.current = f_(A.current).concat(f_(o.items)), I.current = o.nextPageCursor, [2, !0]
                                    }
                                })
                            })()
                        }, [e]),
                        k = (0, Q.useCallback)(function(t, r) {
                            var o = N.current + 1;
                            N.current = o, A.current = [], C.current = 0, I.current = null, n([]), h(!1), w(!1), S(1), u(!1), i(!0), T(t, r, o).then(function(e) {
                                e && (R(), i(!1))
                            }).catch(function(t) {
                                N.current === o && (e0("useInventoryPager: failed to load inventory for user", e, t), i(!1), u(!0))
                            })
                        }, [T, R, e]);
                    (0, Q.useEffect)(function() {
                        k("", "")
                    }, [e]);
                    var D = (0, Q.useRef)(P);
                    (0, Q.useEffect)(function() {
                        D.current !== P && (D.current = P, k(f, P))
                    }, [P, f, k]);
                    var M = (0, Q.useCallback)(function(e) {
                            d(e), k(e, P)
                        }, [P, k]),
                        L = (0, Q.useCallback)(function() {
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
                                    i(!0), fM(function() {
                                        return fU(this, function(e) {
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
                                        N.current === l && (e0("useInventoryPager: failed to load inventory for user", e, t), i(!1), u(!0))
                                    })
                                }
                            }
                        }, [P, f, a, T, R, e]),
                        _ = (0, Q.useCallback)(function() {
                            a || C.current <= 0 || (C.current -= 1, R())
                        }, [a, R]);
                    return {
                        items: r,
                        loading: a,
                        loadFailed: c,
                        filter: f,
                        search: y,
                        appliedSearch: P,
                        hasPrev: v,
                        hasNext: O,
                        page: x,
                        setFilter: M,
                        setSearch: m,
                        loadNext: L,
                        loadPrev: _
                    }
                },
                fH = Q.forwardRef(function(e, t) {
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
                    return (0, $.jsx)(np.svg, (r = function(e) {
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

            function fW(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function fB(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function fV(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        fB(e, t, r[t])
                    })
                }
                return e
            }

            function fq(e, t) {
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

            function f$(e, t) {
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

            function fX(e, t) {
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
                }(e, t) || fG(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function fG(e, t) {
                if (e) {
                    if ("string" == typeof e) return fW(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return fW(e, t)
                }
            }
            fH.displayName = "Arrow";
            var fY = "Popper",
                fQ = fX(rQ(fY), 2),
                fZ = fQ[0],
                fJ = fQ[1],
                f0 = fX(fZ(fY), 2),
                f1 = f0[0],
                f2 = f0[1],
                f8 = function(e) {
                    var t = e.__scopePopper,
                        r = e.children,
                        n = fX(Q.useState(null), 2),
                        o = n[0],
                        a = n[1];
                    return (0, $.jsx)(f1, {
                        scope: t,
                        anchor: o,
                        onAnchorChange: a,
                        children: r
                    })
                };
            f8.displayName = fY;
            var f3 = "PopperAnchor",
                f6 = Q.forwardRef(function(e, t) {
                    var r = e.__scopePopper,
                        n = e.virtualRef,
                        o = f$(e, ["__scopePopper", "virtualRef"]),
                        a = f2(f3, r),
                        i = Q.useRef(null),
                        l = tf(t, i);
                    return Q.useEffect(function() {
                        a.onAnchorChange((null == n ? void 0 : n.current) || i.current)
                    }), n ? null : (0, $.jsx)(np.div, fq(fV({}, o), {
                        ref: l
                    }))
                });
            f6.displayName = f3;
            var f5 = "PopperContent",
                f4 = fX(fZ(f5), 2),
                f7 = f4[0],
                f9 = f4[1],
                de = Q.forwardRef(function(e, t) {
                    var r, n, o, a, i, l, c, u, s = e.__scopePopper,
                        f = e.side,
                        d = e.sideOffset,
                        p = e.align,
                        y = void 0 === p ? "center" : p,
                        m = e.alignOffset,
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
                        C = f$(e, ["__scopePopper", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "avoidCollisions", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "updatePositionStrategy", "onPlaced"]),
                        I = f2(f5, s),
                        N = fX(Q.useState(null), 2),
                        R = N[0],
                        T = N[1],
                        k = tf(t, function(e) {
                            return T(e)
                        }),
                        D = fX(Q.useState(null), 2),
                        M = D[0],
                        L = D[1],
                        _ = sm(M),
                        F = null != (r = null == _ ? void 0 : _.width) ? r : 0,
                        U = null != (n = null == _ ? void 0 : _.height) ? n : 0,
                        z = "number" == typeof j ? j : fV({
                            top: 0,
                            right: 0,
                            bottom: 0,
                            left: 0
                        }, j),
                        K = Array.isArray(O) ? O : [O],
                        H = K.length > 0,
                        W = {
                            padding: z,
                            boundary: K.filter(da),
                            altBoundary: H
                        },
                        B = lO({
                            strategy: "fixed",
                            placement: (void 0 === f ? "bottom" : f) + ("center" !== y ? "-" + y : ""),
                            whileElementsMounted: function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return ll.apply(void 0, ((function(e) {
                                    if (Array.isArray(e)) return fW(e)
                                })(t) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(t) || fG(t) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()).concat([{
                                    animationFrame: "always" === E
                                }]))
                            },
                            elements: {
                                reference: I.anchor
                            },
                            middleware: [lw({
                                mainAxis: (void 0 === d ? 0 : d) + U,
                                alignmentAxis: void 0 === m ? 0 : m
                            }), h && lj(fV({
                                mainAxis: !0,
                                crossAxis: !1,
                                limiter: "partial" === (void 0 === x ? "partial" : x) ? lx() : void 0
                            }, W)), h && lS(fV({}, W)), lP(fq(fV({}, W), {
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
                            })), M && lA({
                                element: M,
                                padding: void 0 === b ? 0 : b
                            }), di({
                                arrowWidth: F,
                                arrowHeight: U
                            }), void 0 !== S && S && lE(fV({
                                strategy: "referenceHidden"
                            }, W))]
                        }),
                        V = B.refs,
                        q = B.floatingStyles,
                        X = B.placement,
                        G = B.isPositioned,
                        Y = B.middlewareData,
                        Z = fX(dl(X), 2),
                        J = Z[0],
                        ee = Z[1],
                        et = r6(A);
                    rJ(function() {
                        G && (null == et || et())
                    }, [G, et]);
                    var er = null == (o = Y.arrow) ? void 0 : o.x,
                        en = null == (a = Y.arrow) ? void 0 : a.y,
                        eo = (null == (i = Y.arrow) ? void 0 : i.centerOffset) !== 0,
                        ea = fX(Q.useState(), 2),
                        ei = ea[0],
                        el = ea[1];
                    return rJ(function() {
                        R && el(window.getComputedStyle(R).zIndex)
                    }, [R]), (0, $.jsx)("div", {
                        ref: V.setFloating,
                        "data-radix-popper-content-wrapper": "",
                        style: fV(fq(fV({}, q), fB({
                            transform: G ? q.transform : "translate(0, -200%)",
                            minWidth: "max-content",
                            zIndex: ei
                        }, "--radix-popper-transform-origin", [null == (l = Y.transformOrigin) ? void 0 : l.x, null == (c = Y.transformOrigin) ? void 0 : c.y].join(" "))), (null == (u = Y.hide) ? void 0 : u.referenceHidden) && {
                            visibility: "hidden",
                            pointerEvents: "none"
                        }),
                        dir: e.dir,
                        children: (0, $.jsx)(f7, {
                            scope: s,
                            placedSide: J,
                            onArrowChange: L,
                            arrowX: er,
                            arrowY: en,
                            shouldHideArrow: eo,
                            children: (0, $.jsx)(np.div, fq(fV({
                                "data-side": J,
                                "data-align": ee
                            }, C), {
                                ref: k,
                                style: fq(fV({}, C.style), {
                                    animation: G ? void 0 : "none"
                                })
                            }))
                        })
                    })
                });
            de.displayName = f5;
            var dt = "PopperArrow",
                dr = {
                    top: "bottom",
                    right: "left",
                    bottom: "top",
                    left: "right"
                },
                dn = Q.forwardRef(function(e, t) {
                    var r, n = e.__scopePopper,
                        o = f$(e, ["__scopePopper"]),
                        a = f9(dt, n),
                        i = dr[a.placedSide];
                    return (0, $.jsx)("span", {
                        ref: a.onArrowChange,
                        style: (fB(r = {
                            position: "absolute",
                            left: a.arrowX,
                            top: a.arrowY
                        }, i, 0), fB(r, "transformOrigin", {
                            top: "",
                            right: "0 0",
                            bottom: "center 0",
                            left: "100% 0"
                        } [a.placedSide]), fB(r, "transform", {
                            top: "translateY(100%)",
                            right: "translateY(50%) rotate(90deg) translateX(-50%)",
                            bottom: "rotate(180deg)",
                            left: "translateY(50%) rotate(-90deg) translateX(50%)"
                        } [a.placedSide]), fB(r, "visibility", a.shouldHideArrow ? "hidden" : void 0), r),
                        children: (0, $.jsx)(fH, fq(fV({}, o), {
                            ref: t,
                            style: fq(fV({}, o.style), {
                                display: "block"
                            })
                        }))
                    })
                });

            function da(e) {
                return null !== e
            }
            dn.displayName = dt;
            var di = function(e) {
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
                            p = fX(dl(l), 2),
                            y = p[0],
                            m = {
                                start: "0%",
                                center: "50%",
                                end: "100%"
                            } [p[1]],
                            b = (null != (r = null == (a = u.arrow) ? void 0 : a.x) ? r : 0) + f / 2,
                            v = (null != (n = null == (i = u.arrow) ? void 0 : i.y) ? n : 0) + d / 2,
                            h = "",
                            g = "";
                        return "bottom" === y ? (h = s ? m : "".concat(b, "px"), g = "".concat(-d, "px")) : "top" === y ? (h = s ? m : "".concat(b, "px"), g = "".concat(c.floating.height + d, "px")) : "right" === y ? (h = "".concat(-d, "px"), g = s ? m : "".concat(v, "px")) : "left" === y && (h = "".concat(c.floating.width + d, "px"), g = s ? m : "".concat(v, "px")), {
                            data: {
                                x: h,
                                y: g
                            }
                        }
                    }
                }
            };

            function dl(e) {
                var t = fX(e.split("-"), 2),
                    r = t[0],
                    n = t[1];
                return [r, void 0 === n ? "center" : n]
            }

            function dc(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function du(e) {
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

            function ds(e, t) {
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

            function df(e, t) {
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

            function dd(e, t) {
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
                        if ("string" == typeof e) return dc(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return dc(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var dp = "Popover",
                dy = dd(rQ(dp, [fJ]), 2),
                dm = dy[0];
            dy[1];
            var db = fJ(),
                dv = dd(dm(dp), 2),
                dh = dv[0],
                dg = dv[1],
                dO = function(e) {
                    var t = e.__scopePopover,
                        r = e.children,
                        n = e.open,
                        o = e.defaultOpen,
                        a = e.onOpenChange,
                        i = e.modal,
                        l = db(t),
                        c = Q.useRef(null),
                        u = dd(Q.useState(!1), 2),
                        s = u[0],
                        f = u[1],
                        d = dd(r7({
                            prop: n,
                            defaultProp: o,
                            onChange: a
                        }), 2),
                        p = d[0],
                        y = d[1];
                    return (0, $.jsx)(f8, ds(du({}, l), {
                        children: (0, $.jsx)(dh, {
                            scope: t,
                            contentId: r8(),
                            triggerRef: c,
                            open: void 0 !== p && p,
                            onOpenChange: y,
                            onOpenToggle: Q.useCallback(function() {
                                return y(function(e) {
                                    return !e
                                })
                            }, [y]),
                            hasCustomAnchor: s,
                            onCustomAnchorAdd: Q.useCallback(function() {
                                return f(!0)
                            }, []),
                            onCustomAnchorRemove: Q.useCallback(function() {
                                return f(!1)
                            }, []),
                            modal: void 0 !== i && i,
                            children: r
                        })
                    }))
                };
            dO.displayName = dp;
            var dw = "PopoverAnchor";
            Q.forwardRef(function(e, t) {
                var r = e.__scopePopover,
                    n = df(e, ["__scopePopover"]),
                    o = dg(dw, r),
                    a = db(r),
                    i = o.onCustomAnchorAdd,
                    l = o.onCustomAnchorRemove;
                return Q.useEffect(function() {
                    return i(),
                        function() {
                            return l()
                        }
                }, [i, l]), (0, $.jsx)(f6, ds(du({}, a, n), {
                    ref: t
                }))
            }).displayName = dw;
            var dj = "PopoverTrigger",
                dx = Q.forwardRef(function(e, t) {
                    var r = e.__scopePopover,
                        n = df(e, ["__scopePopover"]),
                        o = dg(dj, r),
                        a = db(r),
                        i = tf(t, o.triggerRef),
                        l = (0, $.jsx)(np.button, ds(du({
                            type: "button",
                            "aria-haspopup": "dialog",
                            "aria-expanded": o.open,
                            "aria-controls": o.contentId,
                            "data-state": dL(o.open)
                        }, n), {
                            ref: i,
                            onClick: rV(e.onClick, o.onOpenToggle)
                        }));
                    return o.hasCustomAnchor ? l : (0, $.jsx)(f6, ds(du({
                        asChild: !0
                    }, a), {
                        children: l
                    }))
                });
            dx.displayName = dj;
            var dS = "PopoverPortal",
                dP = dd(dm(dS, {
                    forceMount: void 0
                }), 2),
                dE = dP[0],
                dA = dP[1],
                dC = function(e) {
                    var t = e.__scopePopover,
                        r = e.forceMount,
                        n = e.children,
                        o = e.container,
                        a = dg(dS, t);
                    return (0, $.jsx)(dE, {
                        scope: t,
                        forceMount: r,
                        children: (0, $.jsx)(nN, {
                            present: r || a.open,
                            children: (0, $.jsx)(nA, {
                                asChild: !0,
                                container: o,
                                children: n
                            })
                        })
                    })
                };
            dC.displayName = dS;
            var dI = "PopoverContent",
                dN = Q.forwardRef(function(e, t) {
                    var r = dA(dI, e.__scopePopover),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        a = df(e, ["forceMount"]),
                        i = dg(dI, e.__scopePopover);
                    return (0, $.jsx)(nN, {
                        present: o || i.open,
                        children: i.modal ? (0, $.jsx)(dT, ds(du({}, a), {
                            ref: t
                        })) : (0, $.jsx)(dk, ds(du({}, a), {
                            ref: t
                        }))
                    })
                });
            dN.displayName = dI;
            var dR = nl("PopoverContent.RemoveScroll"),
                dT = Q.forwardRef(function(e, t) {
                    var r = dg(dI, e.__scopePopover),
                        n = Q.useRef(null),
                        o = tf(t, n),
                        a = Q.useRef(!1);
                    return Q.useEffect(function() {
                        var e = n.current;
                        if (e) return om(e)
                    }, []), (0, $.jsx)(oc, {
                        as: dR,
                        allowPinchZoom: !0,
                        children: (0, $.jsx)(dD, ds(du({}, e), {
                            ref: o,
                            trapFocus: r.open,
                            disableOutsidePointerEvents: !0,
                            onCloseAutoFocus: rV(e.onCloseAutoFocus, function(e) {
                                var t;
                                e.preventDefault(), a.current || null == (t = r.triggerRef.current) || t.focus()
                            }),
                            onPointerDownOutside: rV(e.onPointerDownOutside, function(e) {
                                var t = e.detail.originalEvent,
                                    r = 0 === t.button && !0 === t.ctrlKey;
                                a.current = 2 === t.button || r
                            }, {
                                checkForDefaultPrevented: !1
                            }),
                            onFocusOutside: rV(e.onFocusOutside, function(e) {
                                return e.preventDefault()
                            }, {
                                checkForDefaultPrevented: !1
                            })
                        }))
                    })
                }),
                dk = Q.forwardRef(function(e, t) {
                    var r = dg(dI, e.__scopePopover),
                        n = Q.useRef(!1),
                        o = Q.useRef(!1);
                    return (0, $.jsx)(dD, ds(du({}, e), {
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
                dD = Q.forwardRef(function(e, t) {
                    var r = e.__scopePopover,
                        n = e.trapFocus,
                        o = e.onOpenAutoFocus,
                        a = e.onCloseAutoFocus,
                        i = e.disableOutsidePointerEvents,
                        l = e.onEscapeKeyDown,
                        c = e.onPointerDownOutside,
                        u = e.onFocusOutside,
                        s = e.onInteractOutside,
                        f = df(e, ["__scopePopover", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus", "disableOutsidePointerEvents", "onEscapeKeyDown", "onPointerDownOutside", "onFocusOutside", "onInteractOutside"]),
                        d = dg(dI, r),
                        p = db(r);
                    return (0, nT.useFocusGuards)(), (0, $.jsx)(nO, {
                        asChild: !0,
                        loop: !0,
                        trapped: n,
                        onMountAutoFocus: o,
                        onUnmountAutoFocus: a,
                        children: (0, $.jsx)(r9.DismissableLayer, {
                            asChild: !0,
                            disableOutsidePointerEvents: i,
                            onInteractOutside: s,
                            onEscapeKeyDown: l,
                            onPointerDownOutside: c,
                            onFocusOutside: u,
                            onDismiss: function() {
                                return d.onOpenChange(!1)
                            },
                            children: (0, $.jsx)(de, ds(du({
                                "data-state": dL(d.open),
                                role: "dialog",
                                id: d.contentId
                            }, p, f), {
                                ref: t,
                                style: du({}, f.style, {
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
                dM = "PopoverClose";

            function dL(e) {
                return e ? "open" : "closed"
            }
            Q.forwardRef(function(e, t) {
                var r = e.__scopePopover,
                    n = df(e, ["__scopePopover"]),
                    o = dg(dM, r);
                return (0, $.jsx)(np.button, ds(du({
                    type: "button"
                }, n), {
                    ref: t,
                    onClick: rV(e.onClick, function() {
                        return o.onOpenChange(!1)
                    })
                }))
            }).displayName = dM, Q.forwardRef(function(e, t) {
                var r = e.__scopePopover,
                    n = df(e, ["__scopePopover"]),
                    o = db(r);
                return (0, $.jsx)(dn, ds(du({}, o, n), {
                    ref: t
                }))
            }).displayName = "PopoverArrow";
            var d_ = function(e) {
                var t, r, n, o, a, i, l = null != (t = null == (n = (o = window).matchMedia) || null == (r = n.call(o, "(pointer: coarse)")) ? void 0 : r.matches) && t,
                    c = null == (a = document.activeElement) ? void 0 : a.matches(":focus-visible");
                if (l && !c) return void e.preventDefault();
                var u = null == (i = e.currentTarget) ? void 0 : i.querySelector('[role="menuitem"]:not([aria-disabled="true"])');
                u && (e.preventDefault(), u.focus())
            };

            function dF(e) {
                var t = e.open,
                    r = e.defaultOpen,
                    n = e.onOpenChange,
                    o = e.children;
                return Q.createElement(dO, {
                    open: t,
                    defaultOpen: r,
                    onOpenChange: n
                }, o)
            }

            function dU(e) {
                var t = e.asChild,
                    r = e.disabled,
                    n = e.className,
                    o = e.children;
                return Q.createElement(dx, {
                    asChild: t,
                    disabled: r,
                    className: n
                }, o)
            }

            function dz(e) {
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
                return Q.createElement(dC, null, Q.createElement(dN, (t = function(e) {
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
                    onOpenAutoFocus: null != u ? u : d_,
                    className: to("foundation-web-portal-zindex", i)
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
            var dK = {
                    Standard: "bg-none",
                    Contrast: "bg-shift-200",
                    Utility: "bg-none"
                },
                dH = {
                    Standard: "stroke-standard",
                    Contrast: "stroke-none",
                    Utility: "stroke-none"
                };

            function dW(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function dB(e, t) {
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
                            if ("string" == typeof e) return dW(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return dW(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r[0];
                return Math.min(r[1], Math.max(n, e))
            }

            function dV(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function dq(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function d$(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        dq(e, t, r[t])
                    })
                }
                return e
            }

            function dX(e, t) {
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
                        if ("string" == typeof e) return dV(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return dV(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function dG(e) {
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
            var dY = Q.forwardRef(function(e, t) {
                var r, n;
                return (0, $.jsx)(np.span, (r = dG({}, e), n = n = {
                    ref: t,
                    style: dG({
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

            function dQ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function dZ(e) {
                if (Array.isArray(e)) return e
            }

            function dJ() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function d0(e) {
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

            function d1(e, t) {
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

            function d2(e, t) {
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

            function d8(e, t) {
                return dZ(e) || function(e, t) {
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
                }(e, t) || d3(e, t) || dJ()
            }

            function d3(e, t) {
                if (e) {
                    if ("string" == typeof e) return dQ(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return dQ(e, t)
                }
            }
            dY.displayName = "VisuallyHidden";
            var d6 = [" ", "Enter", "ArrowUp", "ArrowDown"],
                d5 = [" ", "Enter"],
                d4 = "Select",
                d7 = d8((R = (N = dX(rQ(I = d4 + "CollectionProvider"), 2))[0], T = N[1], D = (k = dX(R(I, {
                    collectionRef: {
                        current: null
                    },
                    itemMap: new Map
                }), 2))[0], M = k[1], (L = function(e) {
                    var t = e.scope,
                        r = e.children,
                        n = Z().useRef(null),
                        o = Z().useRef(new Map).current;
                    return (0, $.jsx)(D, {
                        scope: t,
                        itemMap: o,
                        collectionRef: n,
                        children: r
                    })
                }).displayName = I, F = nl(_ = d4 + "CollectionSlot"), (U = Z().forwardRef(function(e, t) {
                    var r = e.scope,
                        n = e.children,
                        o = tf(t, M(_, r).collectionRef);
                    return (0, $.jsx)(F, {
                        ref: o,
                        children: n
                    })
                })).displayName = _, K = "data-radix-collection-item", H = nl(z = d4 + "CollectionItemSlot"), (W = Z().forwardRef(function(e, t) {
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
                        l = Z().useRef(null),
                        c = tf(t, l),
                        u = M(z, o);
                    return Z().useEffect(function() {
                        return u.itemMap.set(l, d$({
                                ref: l
                            }, i)),
                            function() {
                                u.itemMap.delete(l)
                            }
                    }), (0, $.jsx)(H, (r = d$({}, dq({}, K, "")), n = n = {
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
                    var t = M(d4 + "CollectionConsumer", e);
                    return Z().useCallback(function() {
                        var e = t.collectionRef.current;
                        if (!e) return [];
                        var r = Array.from(e.querySelectorAll("[".concat(K, "]")));
                        return Array.from(t.itemMap.values()).sort(function(e, t) {
                            return r.indexOf(e.ref.current) - r.indexOf(t.ref.current)
                        })
                    }, [t.collectionRef, t.itemMap])
                }, T]), 3),
                d9 = d7[0],
                pe = d7[1],
                pt = d8(rQ(d4, [d7[2], fJ]), 2),
                pr = pt[0];
            pt[1];
            var pn = fJ(),
                po = d8(pr(d4), 2),
                pa = po[0],
                pi = po[1],
                pl = d8(pr(d4), 2),
                pc = pl[0],
                pu = pl[1],
                ps = function(e) {
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
                        y = e.form,
                        m = pn(t),
                        b = d8(Q.useState(null), 2),
                        v = b[0],
                        h = b[1],
                        g = d8(Q.useState(null), 2),
                        O = g[0],
                        w = g[1],
                        j = d8(Q.useState(!1), 2),
                        x = j[0],
                        S = j[1],
                        P = uJ(u),
                        E = d8(r7({
                            prop: n,
                            defaultProp: o,
                            onChange: a
                        }), 2),
                        A = E[0],
                        C = E[1],
                        I = d8(r7({
                            prop: i,
                            defaultProp: l,
                            onChange: c
                        }), 2),
                        N = I[0],
                        R = I[1],
                        T = Q.useRef(null),
                        k = !v || y || !!v.closest("form"),
                        D = d8(Q.useState(new Set), 2),
                        M = D[0],
                        L = D[1],
                        _ = Array.from(M).map(function(e) {
                            return e.props.value
                        }).join(";");
                    return (0, $.jsx)(f8, d1(d0({}, m), {
                        children: (0, $.jsxs)(pa, {
                            required: p,
                            scope: t,
                            trigger: v,
                            onTriggerChange: h,
                            valueNode: O,
                            onValueNodeChange: w,
                            valueNodeHasChildren: x,
                            onValueNodeHasChildrenChange: S,
                            contentId: r8(),
                            value: N,
                            onValueChange: R,
                            open: void 0 !== A && A,
                            onOpenChange: C,
                            dir: P,
                            triggerPointerDownPosRef: T,
                            disabled: d,
                            children: [(0, $.jsx)(d9.Provider, {
                                scope: t,
                                children: (0, $.jsx)(pc, {
                                    scope: e.__scopeSelect,
                                    onNativeOptionAdd: Q.useCallback(function(e) {
                                        L(function(t) {
                                            return new Set(t).add(e)
                                        })
                                    }, []),
                                    onNativeOptionRemove: Q.useCallback(function(e) {
                                        L(function(t) {
                                            var r = new Set(t);
                                            return r.delete(e), r
                                        })
                                    }, []),
                                    children: r
                                })
                            }), k ? (0, $.jsxs)(pG, {
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
                                form: y,
                                children: [void 0 === N ? (0, $.jsx)("option", {
                                    value: ""
                                }) : null, Array.from(M)]
                            }, _) : null]
                        })
                    }))
                };
            ps.displayName = d4;
            var pf = "SelectTrigger",
                pd = Q.forwardRef(function(e, t) {
                    var r = e.__scopeSelect,
                        n = e.disabled,
                        o = d2(e, ["__scopeSelect", "disabled"]),
                        a = pn(r),
                        i = pi(pf, r),
                        l = i.disabled || void 0 !== n && n,
                        c = tf(t, i.onTriggerChange),
                        u = pe(r),
                        s = Q.useRef("touch"),
                        f = d8(pY(function(e) {
                            var t = u().filter(function(e) {
                                    return !e.disabled
                                }),
                                r = t.find(function(e) {
                                    return e.value === i.value
                                }),
                                n = pQ(t, e, r);
                            void 0 !== n && i.onValueChange(n.value)
                        }), 3),
                        d = f[0],
                        p = f[1],
                        y = f[2],
                        m = function(e) {
                            l || (i.onOpenChange(!0), y()), e && (i.triggerPointerDownPosRef.current = {
                                x: Math.round(e.pageX),
                                y: Math.round(e.pageY)
                            })
                        };
                    return (0, $.jsx)(f6, d1(d0({
                        asChild: !0
                    }, a), {
                        children: (0, $.jsx)(np.button, d1(d0({
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
                            "data-placeholder": pX(i.value) ? "" : void 0
                        }, o), {
                            ref: c,
                            onClick: rV(o.onClick, function(e) {
                                e.currentTarget.focus(), "mouse" !== s.current && m(e)
                            }),
                            onPointerDown: rV(o.onPointerDown, function(e) {
                                s.current = e.pointerType;
                                var t = e.target;
                                t.hasPointerCapture(e.pointerId) && t.releasePointerCapture(e.pointerId), 0 === e.button && !1 === e.ctrlKey && "mouse" === e.pointerType && (m(e), e.preventDefault())
                            }),
                            onKeyDown: rV(o.onKeyDown, function(e) {
                                var t = "" !== d.current;
                                e.ctrlKey || e.altKey || e.metaKey || 1 !== e.key.length || p(e.key), (!t || " " !== e.key) && d6.includes(e.key) && (m(), e.preventDefault())
                            })
                        }))
                    }))
                });
            pd.displayName = pf;
            var pp = "SelectValue",
                py = Q.forwardRef(function(e, t) {
                    var r = e.__scopeSelect,
                        n = (e.className, e.style, e.children),
                        o = e.placeholder,
                        a = d2(e, ["__scopeSelect", "className", "style", "children", "placeholder"]),
                        i = pi(pp, r),
                        l = i.onValueNodeHasChildrenChange,
                        c = void 0 !== n,
                        u = tf(t, i.onValueNodeChange);
                    return rJ(function() {
                        l(c)
                    }, [l, c]), (0, $.jsx)(np.span, d1(d0({}, a), {
                        ref: u,
                        style: {
                            pointerEvents: "none"
                        },
                        children: pX(i.value) ? (0, $.jsx)($.Fragment, {
                            children: void 0 === o ? "" : o
                        }) : n
                    }))
                });
            py.displayName = pp;
            var pm = Q.forwardRef(function(e, t) {
                e.__scopeSelect;
                var r = e.children,
                    n = d2(e, ["__scopeSelect", "children"]);
                return (0, $.jsx)(np.span, d1(d0({
                    "aria-hidden": !0
                }, n), {
                    ref: t,
                    children: r || "▼"
                }))
            });
            pm.displayName = "SelectIcon";
            var pb = function(e) {
                return (0, $.jsx)(nA, d0({
                    asChild: !0
                }, e))
            };
            pb.displayName = "SelectPortal";
            var pv = "SelectContent",
                ph = Q.forwardRef(function(e, t) {
                    var r = pi(pv, e.__scopeSelect),
                        n = d8(Q.useState(), 2),
                        o = n[0],
                        a = n[1];
                    return (rJ(function() {
                        a(new DocumentFragment)
                    }, []), r.open) ? (0, $.jsx)(px, d1(d0({}, e), {
                        ref: t
                    })) : o ? ne.createPortal((0, $.jsx)(pO, {
                        scope: e.__scopeSelect,
                        children: (0, $.jsx)(d9.Slot, {
                            scope: e.__scopeSelect,
                            children: (0, $.jsx)("div", {
                                children: e.children
                            })
                        })
                    }), o) : null
                });
            ph.displayName = pv;
            var pg = d8(pr(pv), 2),
                pO = pg[0],
                pw = pg[1],
                pj = nl("SelectContent.RemoveScroll"),
                px = Q.forwardRef(function(e, t) {
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
                        y = e.collisionPadding,
                        m = e.sticky,
                        b = e.hideWhenDetached,
                        v = e.avoidCollisions,
                        h = d2(e, ["__scopeSelect", "position", "onCloseAutoFocus", "onEscapeKeyDown", "onPointerDownOutside", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "avoidCollisions"]),
                        g = pi(pv, r),
                        O = d8(Q.useState(null), 2),
                        w = O[0],
                        j = O[1],
                        x = d8(Q.useState(null), 2),
                        S = x[0],
                        P = x[1],
                        E = tf(t, function(e) {
                            return j(e)
                        }),
                        A = d8(Q.useState(null), 2),
                        C = A[0],
                        I = A[1],
                        N = d8(Q.useState(null), 2),
                        R = N[0],
                        T = N[1],
                        k = pe(r),
                        D = d8(Q.useState(!1), 2),
                        M = D[0],
                        L = D[1],
                        _ = Q.useRef(!1);
                    Q.useEffect(function() {
                        if (w) return om(w)
                    }, [w]), (0, nT.useFocusGuards)();
                    var F = Q.useCallback(function(e) {
                            var t = dZ(c = k().map(function(e) {
                                    return e.ref.current
                                })) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(c) || d3(c) || dJ(),
                                r = t[0],
                                n = d8(t.slice(1).slice(-1), 1)[0],
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
                        U = Q.useCallback(function() {
                            return F([C, w])
                        }, [F, C, w]);
                    Q.useEffect(function() {
                        M && U()
                    }, [M, U]);
                    var z = g.onOpenChange,
                        K = g.triggerPointerDownPosRef;
                    Q.useEffect(function() {
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
                    }, [w, z, K]), Q.useEffect(function() {
                        var e = function() {
                            return z(!1)
                        };
                        return window.addEventListener("blur", e), window.addEventListener("resize", e),
                            function() {
                                window.removeEventListener("blur", e), window.removeEventListener("resize", e)
                            }
                    }, [z]);
                    var H = d8(pY(function(e) {
                            var t = k().filter(function(e) {
                                    return !e.disabled
                                }),
                                r = t.find(function(e) {
                                    return e.ref.current === document.activeElement
                                }),
                                n = pQ(t, e, r);
                            n && setTimeout(function() {
                                return n.ref.current.focus()
                            })
                        }), 2),
                        W = H[0],
                        B = H[1],
                        V = Q.useCallback(function(e, t, r) {
                            var n = !_.current && !r;
                            (void 0 !== g.value && g.value === t || n) && (I(e), n && (_.current = !0))
                        }, [g.value]),
                        q = Q.useCallback(function() {
                            return null == w ? void 0 : w.focus()
                        }, [w]),
                        X = Q.useCallback(function(e, t, r) {
                            var n = !_.current && !r;
                            (void 0 !== g.value && g.value === t || n) && T(e)
                        }, [g.value]),
                        G = "popper" === o ? pP : pS,
                        Y = G === pP ? {
                            side: c,
                            sideOffset: u,
                            align: s,
                            alignOffset: f,
                            arrowPadding: d,
                            collisionBoundary: p,
                            collisionPadding: y,
                            sticky: m,
                            hideWhenDetached: b,
                            avoidCollisions: v
                        } : {};
                    return (0, $.jsx)(pO, {
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
                        children: (0, $.jsx)(oc, {
                            as: pj,
                            allowPinchZoom: !0,
                            children: (0, $.jsx)(nO, {
                                asChild: !0,
                                trapped: g.open,
                                onMountAutoFocus: function(e) {
                                    e.preventDefault()
                                },
                                onUnmountAutoFocus: rV(a, function(e) {
                                    var t;
                                    null == (t = g.trigger) || t.focus({
                                        preventScroll: !0
                                    }), e.preventDefault()
                                }),
                                children: (0, $.jsx)(r9.DismissableLayer, {
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
                                    children: (0, $.jsx)(G, d1(d0({
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
                                        style: d0({
                                            display: "flex",
                                            flexDirection: "column",
                                            outline: "none"
                                        }, h.style),
                                        onKeyDown: rV(h.onKeyDown, function(e) {
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
            px.displayName = "SelectContentImpl";
            var pS = Q.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = e.onPlaced,
                    o = d2(e, ["__scopeSelect", "onPlaced"]),
                    a = pi(pv, r),
                    i = pw(pv, r),
                    l = d8(Q.useState(null), 2),
                    c = l[0],
                    u = l[1],
                    s = d8(Q.useState(null), 2),
                    f = s[0],
                    d = s[1],
                    p = tf(t, function(e) {
                        return d(e)
                    }),
                    y = pe(r),
                    m = Q.useRef(!1),
                    b = Q.useRef(!0),
                    v = i.viewport,
                    h = i.selectedItem,
                    g = i.selectedItemText,
                    O = i.focusSelectedItem,
                    w = Q.useCallback(function() {
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
                                    p = dB(l, [10, Math.max(10, window.innerWidth - 10 - d)]);
                                c.style.minWidth = s + "px", c.style.left = p + "px"
                            } else {
                                var b = t.right - o.right,
                                    O = window.innerWidth - r.right - b,
                                    w = window.innerWidth - e.right - O,
                                    j = e.width + w,
                                    x = Math.max(j, t.width),
                                    S = dB(O, [10, Math.max(10, window.innerWidth - 10 - x)]);
                                c.style.minWidth = j + "px", c.style.right = S + "px"
                            }
                            var P = y(),
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
                                return m.current = !0
                            })
                        }
                    }, [y, a.trigger, a.valueNode, c, f, v, h, g, a.dir, n]);
                rJ(function() {
                    return w()
                }, [w]);
                var j = d8(Q.useState(), 2),
                    x = j[0],
                    S = j[1];
                rJ(function() {
                    f && S(window.getComputedStyle(f).zIndex)
                }, [f]);
                var P = Q.useCallback(function(e) {
                    e && !0 === b.current && (w(), null == O || O(), b.current = !1)
                }, [w, O]);
                return (0, $.jsx)(pA, {
                    scope: r,
                    contentWrapper: c,
                    shouldExpandOnScrollRef: m,
                    onScrollButtonChange: P,
                    children: (0, $.jsx)("div", {
                        ref: u,
                        style: {
                            display: "flex",
                            flexDirection: "column",
                            position: "fixed",
                            zIndex: x
                        },
                        children: (0, $.jsx)(np.div, d1(d0({}, o), {
                            ref: p,
                            style: d0({
                                boxSizing: "border-box",
                                maxHeight: "100%"
                            }, o.style)
                        }))
                    })
                })
            });
            pS.displayName = "SelectItemAlignedPosition";
            var pP = Q.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = e.align,
                    o = e.collisionPadding,
                    a = d2(e, ["__scopeSelect", "align", "collisionPadding"]),
                    i = pn(r);
                return (0, $.jsx)(de, d1(d0({}, i, a), {
                    ref: t,
                    align: void 0 === n ? "start" : n,
                    collisionPadding: void 0 === o ? 10 : o,
                    style: d0({
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
            pP.displayName = "SelectPopperPosition";
            var pE = d8(pr(pv, {}), 2),
                pA = pE[0],
                pC = pE[1],
                pI = "SelectViewport",
                pN = Q.forwardRef(function(e, t) {
                    var r = e.__scopeSelect,
                        n = e.nonce,
                        o = d2(e, ["__scopeSelect", "nonce"]),
                        a = pw(pI, r),
                        i = pC(pI, r),
                        l = tf(t, a.onViewportChange),
                        c = Q.useRef(0);
                    return (0, $.jsxs)($.Fragment, {
                        children: [(0, $.jsx)("style", {
                            dangerouslySetInnerHTML: {
                                __html: "[data-radix-select-viewport]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}[data-radix-select-viewport]::-webkit-scrollbar{display:none}"
                            },
                            nonce: n
                        }), (0, $.jsx)(d9.Slot, {
                            scope: r,
                            children: (0, $.jsx)(np.div, d1(d0({
                                "data-radix-select-viewport": "",
                                role: "presentation"
                            }, o), {
                                ref: l,
                                style: d0({
                                    position: "relative",
                                    flex: 1,
                                    overflow: "hidden auto"
                                }, o.style),
                                onScroll: rV(o.onScroll, function(e) {
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
            pN.displayName = pI;
            var pR = "SelectGroup",
                pT = d8(pr(pR), 2),
                pk = pT[0],
                pD = pT[1];
            Q.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = d2(e, ["__scopeSelect"]),
                    o = r8();
                return (0, $.jsx)(pk, {
                    scope: r,
                    id: o,
                    children: (0, $.jsx)(np.div, d1(d0({
                        role: "group",
                        "aria-labelledby": o
                    }, n), {
                        ref: t
                    }))
                })
            }).displayName = pR;
            var pM = "SelectLabel";
            Q.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = d2(e, ["__scopeSelect"]),
                    o = pD(pM, r);
                return (0, $.jsx)(np.div, d1(d0({
                    id: o.id
                }, n), {
                    ref: t
                }))
            }).displayName = pM;
            var pL = "SelectItem",
                p_ = d8(pr(pL), 2),
                pF = p_[0],
                pU = p_[1],
                pz = Q.forwardRef(function(e, t) {
                    var r = e.__scopeSelect,
                        n = e.value,
                        o = e.disabled,
                        a = void 0 !== o && o,
                        i = e.textValue,
                        l = d2(e, ["__scopeSelect", "value", "disabled", "textValue"]),
                        c = pi(pL, r),
                        u = pw(pL, r),
                        s = c.value === n,
                        f = d8(Q.useState(null != i ? i : ""), 2),
                        d = f[0],
                        p = f[1],
                        y = d8(Q.useState(!1), 2),
                        m = y[0],
                        b = y[1],
                        v = tf(t, function(e) {
                            var t;
                            return null == (t = u.itemRefCallback) ? void 0 : t.call(u, e, n, a)
                        }),
                        h = r8(),
                        g = Q.useRef("touch"),
                        O = function() {
                            a || (c.onValueChange(n), c.onOpenChange(!1))
                        };
                    if ("" === n) throw Error("A <Select.Item /> must have a value prop that is not an empty string. This is because the Select value can be set to an empty string to clear the selection and show the placeholder.");
                    return (0, $.jsx)(pF, {
                        scope: r,
                        value: n,
                        disabled: a,
                        textId: h,
                        isSelected: s,
                        onItemTextChange: Q.useCallback(function(e) {
                            p(function(t) {
                                var r;
                                return t || (null != (r = null == e ? void 0 : e.textContent) ? r : "").trim()
                            })
                        }, []),
                        children: (0, $.jsx)(d9.ItemSlot, {
                            scope: r,
                            value: n,
                            disabled: a,
                            textValue: d,
                            children: (0, $.jsx)(np.div, d1(d0({
                                role: "option",
                                "aria-labelledby": h,
                                "data-highlighted": m ? "" : void 0,
                                "aria-selected": s && m,
                                "data-state": s ? "checked" : "unchecked",
                                "aria-disabled": a || void 0,
                                "data-disabled": a ? "" : void 0,
                                tabIndex: a ? void 0 : -1
                            }, l), {
                                ref: v,
                                onFocus: rV(l.onFocus, function() {
                                    return b(!0)
                                }),
                                onBlur: rV(l.onBlur, function() {
                                    return b(!1)
                                }),
                                onClick: rV(l.onClick, function() {
                                    "mouse" !== g.current && O()
                                }),
                                onPointerUp: rV(l.onPointerUp, function() {
                                    "mouse" === g.current && O()
                                }),
                                onPointerDown: rV(l.onPointerDown, function(e) {
                                    g.current = e.pointerType
                                }),
                                onPointerMove: rV(l.onPointerMove, function(e) {
                                    if (g.current = e.pointerType, a) {
                                        var t;
                                        null == (t = u.onItemLeave) || t.call(u)
                                    } else "mouse" === g.current && e.currentTarget.focus({
                                        preventScroll: !0
                                    })
                                }),
                                onPointerLeave: rV(l.onPointerLeave, function(e) {
                                    if (e.currentTarget === document.activeElement) {
                                        var t;
                                        null == (t = u.onItemLeave) || t.call(u)
                                    }
                                }),
                                onKeyDown: rV(l.onKeyDown, function(e) {
                                    var t;
                                    ((null == (t = u.searchRef) ? void 0 : t.current) === "" || " " !== e.key) && (d5.includes(e.key) && O(), " " === e.key && e.preventDefault())
                                })
                            }))
                        })
                    })
                });
            pz.displayName = pL;
            var pK = "SelectItemText",
                pH = Q.forwardRef(function(e, t) {
                    var r = e.__scopeSelect,
                        n = (e.className, e.style, d2(e, ["__scopeSelect", "className", "style"])),
                        o = pi(pK, r),
                        a = pw(pK, r),
                        i = pU(pK, r),
                        l = pu(pK, r),
                        c = d8(Q.useState(null), 2),
                        u = c[0],
                        s = c[1],
                        f = tf(t, function(e) {
                            return s(e)
                        }, i.onItemTextChange, function(e) {
                            var t;
                            return null == (t = a.itemTextRefCallback) ? void 0 : t.call(a, e, i.value, i.disabled)
                        }),
                        d = null == u ? void 0 : u.textContent,
                        p = Q.useMemo(function() {
                            return (0, $.jsx)("option", {
                                value: i.value,
                                disabled: i.disabled,
                                children: d
                            }, i.value)
                        }, [i.disabled, i.value, d]),
                        y = l.onNativeOptionAdd,
                        m = l.onNativeOptionRemove;
                    return rJ(function() {
                        return y(p),
                            function() {
                                return m(p)
                            }
                    }, [y, m, p]), (0, $.jsxs)($.Fragment, {
                        children: [(0, $.jsx)(np.span, d1(d0({
                            id: i.textId
                        }, n), {
                            ref: f
                        })), i.isSelected && o.valueNode && !o.valueNodeHasChildren ? ne.createPortal(n.children, o.valueNode) : null]
                    })
                });
            pH.displayName = pK;
            var pW = "SelectItemIndicator";
            Q.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = d2(e, ["__scopeSelect"]);
                return pU(pW, r).isSelected ? (0, $.jsx)(np.span, d1(d0({
                    "aria-hidden": !0
                }, n), {
                    ref: t
                })) : null
            }).displayName = pW;
            var pB = "SelectScrollUpButton";
            Q.forwardRef(function(e, t) {
                var r = pw(pB, e.__scopeSelect),
                    n = pC(pB, e.__scopeSelect),
                    o = d8(Q.useState(!1), 2),
                    a = o[0],
                    i = o[1],
                    l = tf(t, n.onScrollButtonChange);
                return rJ(function() {
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
                }, [r.viewport, r.isPositioned]), a ? (0, $.jsx)(pq, d1(d0({}, e), {
                    ref: l,
                    onAutoScroll: function() {
                        var e = r.viewport,
                            t = r.selectedItem;
                        e && t && (e.scrollTop = e.scrollTop - t.offsetHeight)
                    }
                })) : null
            }).displayName = pB;
            var pV = "SelectScrollDownButton";
            Q.forwardRef(function(e, t) {
                var r = pw(pV, e.__scopeSelect),
                    n = pC(pV, e.__scopeSelect),
                    o = d8(Q.useState(!1), 2),
                    a = o[0],
                    i = o[1],
                    l = tf(t, n.onScrollButtonChange);
                return rJ(function() {
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
                }, [r.viewport, r.isPositioned]), a ? (0, $.jsx)(pq, d1(d0({}, e), {
                    ref: l,
                    onAutoScroll: function() {
                        var e = r.viewport,
                            t = r.selectedItem;
                        e && t && (e.scrollTop = e.scrollTop + t.offsetHeight)
                    }
                })) : null
            }).displayName = pV;
            var pq = Q.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = e.onAutoScroll,
                    o = d2(e, ["__scopeSelect", "onAutoScroll"]),
                    a = pw("SelectScrollButton", r),
                    i = Q.useRef(null),
                    l = pe(r),
                    c = Q.useCallback(function() {
                        null !== i.current && (window.clearInterval(i.current), i.current = null)
                    }, []);
                return Q.useEffect(function() {
                    return function() {
                        return c()
                    }
                }, [c]), rJ(function() {
                    var e, t = l().find(function(e) {
                        return e.ref.current === document.activeElement
                    });
                    null == t || null == (e = t.ref.current) || e.scrollIntoView({
                        block: "nearest"
                    })
                }, [l]), (0, $.jsx)(np.div, d1(d0({
                    "aria-hidden": !0
                }, o), {
                    ref: t,
                    style: d0({
                        flexShrink: 0
                    }, o.style),
                    onPointerDown: rV(o.onPointerDown, function() {
                        null === i.current && (i.current = window.setInterval(n, 50))
                    }),
                    onPointerMove: rV(o.onPointerMove, function() {
                        var e;
                        null == (e = a.onItemLeave) || e.call(a), null === i.current && (i.current = window.setInterval(n, 50))
                    }),
                    onPointerLeave: rV(o.onPointerLeave, function() {
                        c()
                    })
                }))
            });
            Q.forwardRef(function(e, t) {
                e.__scopeSelect;
                var r = d2(e, ["__scopeSelect"]);
                return (0, $.jsx)(np.div, d1(d0({
                    "aria-hidden": !0
                }, r), {
                    ref: t
                }))
            }).displayName = "SelectSeparator";
            var p$ = "SelectArrow";

            function pX(e) {
                return "" === e || void 0 === e
            }
            Q.forwardRef(function(e, t) {
                var r = e.__scopeSelect,
                    n = d2(e, ["__scopeSelect"]),
                    o = pn(r),
                    a = pi(p$, r),
                    i = pw(p$, r);
                return a.open && "popper" === i.position ? (0, $.jsx)(dn, d1(d0({}, o, n), {
                    ref: t
                })) : null
            }).displayName = p$;
            var pG = Q.forwardRef(function(e, t) {
                var r = e.value,
                    n = d2(e, ["value"]),
                    o = Q.useRef(null),
                    a = tf(t, o),
                    i = sb(r);
                return Q.useEffect(function() {
                    var e = o.current,
                        t = Object.getOwnPropertyDescriptor(window.HTMLSelectElement.prototype, "value").set;
                    if (i !== r && t) {
                        var n = new Event("change", {
                            bubbles: !0
                        });
                        t.call(e, r), e.dispatchEvent(n)
                    }
                }, [i, r]), (0, $.jsx)(dY, {
                    asChild: !0,
                    children: (0, $.jsx)("select", d1(d0({}, n), {
                        ref: a,
                        defaultValue: r
                    }))
                })
            });

            function pY(e) {
                var t = r6(e),
                    r = Q.useRef(""),
                    n = Q.useRef(0),
                    o = Q.useCallback(function(e) {
                        var o = r.current + e;
                        t(o),
                            function e(t) {
                                r.current = t, window.clearTimeout(n.current), "" !== t && (n.current = window.setTimeout(function() {
                                    return e("")
                                }, 1e3))
                            }(o)
                    }, [t]),
                    a = Q.useCallback(function() {
                        r.current = "", window.clearTimeout(n.current)
                    }, []);
                return Q.useEffect(function() {
                    return function() {
                        return window.clearTimeout(n.current)
                    }
                }, []), [r, o, a]
            }

            function pQ(e, t, r) {
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
            pG.displayName = "BubbleSelect";
            var pZ = (0, Q.createContext)(null),
                pJ = {
                    XSmall: "size-300",
                    Small: "size-400",
                    Medium: "size-500",
                    Large: "size-600"
                },
                p0 = {
                    XSmall: "padding-x-medium",
                    Small: "padding-x-medium",
                    Medium: "padding-x-medium",
                    Large: "padding-x-large"
                },
                p1 = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium",
                    Large: "text-title-large"
                },
                p2 = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                p8 = {
                    XSmall: "gap-xsmall",
                    Small: "gap-small",
                    Medium: "gap-small",
                    Large: "gap-small"
                },
                p3 = {
                    XSmall: "radius-small",
                    Small: "radius-medium",
                    Medium: "radius-medium",
                    Large: "radius-medium"
                },
                p6 = {
                    XSmall: "height-600",
                    Small: "height-800",
                    Medium: "height-1000",
                    Large: "height-1200"
                };

            function p5(e) {
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

            function p4(e, t) {
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

            function p7(e, t) {
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
            }(0, Q.forwardRef)(function(e, t) {
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
                    y = e.hint,
                    m = e.onValueChange,
                    b = e.onOpenChange,
                    v = e.children,
                    h = uL(),
                    g = (0, Q.useMemo)(function() {
                        return {
                            size: l
                        }
                    }, [l]),
                    O = r ? Z().createElement("span", {
                        id: h,
                        className: to(p1[l], "content-emphasis")
                    }, r) : null;
                return Z().createElement(pZ.Provider, {
                    value: g
                }, Z().createElement("div", {
                    className: to("flex flex-col", d && ["opacity-[0.5]", "pointer-events-none"], p8[l], i)
                }, O && (n ? Z().createElement("div", {
                    className: "flex items-center gap-xsmall"
                }, O, Z().createElement(u_, n)) : O), Z().createElement(ps, {
                    value: s,
                    disabled: d,
                    onValueChange: m,
                    onOpenChange: b
                }, Z().createElement(pd, {
                    className: to("relative clip group/interactable outline-none", "foundation-web-input flex items-center justify-between width-full cursor-pointer", dK[u], dH[u], p3[l], p6[l], p0[l], p2[l], p ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", void 0 === s ? "content-muted" : "content-default"),
                    ref: t,
                    "aria-labelledby": r ? h : o,
                    "aria-label": a
                }, Z().createElement(ti, null), Z().createElement("div", {
                    className: "grow-1 text-truncate-split text-align-x-left"
                }, Z().createElement(py, {
                    placeholder: f
                })), Z().createElement(pm, {
                    className: to(pJ[l], "icon icon-regular-chevron-large-down content-default")
                })), Z().createElement(pb, null, Z().createElement(ph, {
                    position: "popper",
                    className: "padding-y-small foundation-web-portal-zindex",
                    style: {
                        maxHeight: "var(--radix-select-content-available-height)"
                    }
                }, v))), y && Z().createElement("span", {
                    className: to("text-caption-small", {
                        "content-system-alert": p,
                        "content-default": !p
                    })
                }, y)))
            }).displayName = "Dropdown";
            var p9 = {
                    XSmall: "radius-medium",
                    Small: "radius-large",
                    Medium: "radius-large",
                    Large: "radius-large"
                },
                ye = {
                    XSmall: "padding-xsmall",
                    Small: "padding-small",
                    Medium: "padding-small",
                    Large: "padding-small"
                },
                yt = {
                    XSmall: "padding-x-medium",
                    Small: "padding-x-medium",
                    Medium: "padding-x-medium",
                    Large: "padding-x-large"
                },
                yr = {
                    XSmall: "padding-y-xsmall",
                    Small: "padding-y-small",
                    Medium: "padding-y-small",
                    Large: "padding-y-medium"
                },
                yn = {
                    XSmall: "gap-x-medium",
                    Small: "gap-x-medium",
                    Medium: "gap-x-medium",
                    Large: "gap-x-large"
                },
                yo = {
                    XSmall: "gap-y-xxsmall",
                    Small: "gap-y-xxsmall",
                    Medium: "gap-y-xsmall",
                    Large: "gap-y-xsmall"
                },
                ya = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                yi = {
                    XSmall: "radius-small",
                    Small: "radius-medium",
                    Medium: "radius-medium",
                    Large: "radius-medium"
                },
                yl = (0, Q.createContext)(null),
                yc = function() {
                    var e = (0, Q.useContext)(yl);
                    if (!e) throw Error("Menu components must be used within a Menu");
                    return e
                },
                yu = function(e) {
                    var t, r = e.children,
                        n = e.className,
                        o = e.size,
                        a = (0, Q.useContext)(pZ),
                        i = a ? "dropdown" : "standalone",
                        l = null != (t = null != o ? o : null == a ? void 0 : a.size) ? t : "Medium",
                        c = (0, Q.useMemo)(function() {
                            return {
                                size: l,
                                mode: i
                            }
                        }, [l, i]),
                        u = to("foundation-web-menu bg-surface-100 stroke-standard stroke-default shadow-transient-high", p9[l], n),
                        s = "standalone" === i ? Z().createElement(sc, {
                            asChild: !0,
                            orientation: "vertical",
                            loop: !0
                        }, Z().createElement("div", {
                            role: "menu",
                            tabIndex: -1,
                            className: u
                        }, r)) : Z().createElement("div", {
                            className: u
                        }, r);
                    return Z().createElement(yl.Provider, {
                        value: c
                    }, "dropdown" === i ? Z().createElement(pN, {
                        asChild: !0,
                        style: {
                            width: "var(--radix-popper-anchor-width)"
                        }
                    }, s) : s)
                },
                ys = function(e) {
                    var t = e.children,
                        r = e.className,
                        n = yc().size;
                    return Z().createElement("div", {
                        role: "group",
                        className: to(ye[n], r)
                    }, t)
                },
                yf = function(e) {
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
                        d = p7(e, ["value", "leading", "title", "description", "trailing", "disabled", "className", "onSelect", "asChild", "children"]),
                        p = yc(),
                        y = p.size,
                        m = p.mode,
                        b = to(ta, "foundation-web-menu-item flex items-center content-default text-truncate-split focus-visible:hover:outline-none cursor-pointer stroke-none bg-none text-align-x-left width-full", ya[y], yt[y], yr[y], yn[y], yi[y], l && "opacity-[0.5]", l && "pointer-events-none", c),
                        v = Z().createElement("span", {
                            className: "foundation-web-menu-item-title text-no-wrap text-truncate-split content-emphasis"
                        }, o);
                    switch (m) {
                        case "dropdown":
                            v = Z().createElement(pH, {
                                asChild: !0
                            }, v);
                            break;
                        case "standalone":
                            break;
                        default:
                            console.error("Invalid menu mode:", m)
                    }
                    var h = Z().createElement(Z().Fragment, null, !l && Z().createElement(ti, null), n, Z().createElement("div", {
                        className: to("grow-1 text-truncate-split flex flex-col", yo[y])
                    }, v, a && Z().createElement("div", {
                        className: "foundation-web-menu-item-description content-muted"
                    }, a)), i);
                    if (s) {
                        d.as;
                        var g = p7(d, ["as"]),
                            O = Z().Children.only(f),
                            w = void 0 === o && O.props.children;
                        t = Z().createElement(tw, p4(p5({}, g), {
                            role: "standalone" === m ? "menuitem" : void 0,
                            "aria-disabled": l || void 0,
                            className: b,
                            style: {
                                outlineOffset: 0
                            },
                            onClick: l ? void 0 : u
                        }), w ? Z().cloneElement(O, {}, Z().createElement(Z().Fragment, null, !l && Z().createElement(ti, null), O.props.children)) : Z().cloneElement(O, {}, h))
                    } else if ("a" === d.as) {
                        d.as;
                        var j = d.href,
                            x = p7(d, ["as", "href"]);
                        t = Z().createElement("a", p4(p5({}, x), {
                            role: "standalone" === m ? "menuitem" : void 0,
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
                        var S = p7(d, ["as"]);
                        t = Z().createElement("button", p4(p5({
                            type: "button"
                        }, S), {
                            role: "standalone" === m ? "menuitem" : void 0,
                            "aria-disabled": l,
                            className: b,
                            style: {
                                outlineOffset: 0
                            },
                            onClick: l ? void 0 : u
                        }), h)
                    }
                    return "dropdown" === m ? Z().createElement(pz, {
                        value: r,
                        disabled: l,
                        asChild: !0
                    }, t) : Z().createElement(sf, {
                        asChild: !0,
                        focusable: !0,
                        tabStopId: r
                    }, t)
                };

            function yd(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var yp = function(e) {
                    var t, r, n = e.options,
                        o = e.value,
                        a = e.onSelect,
                        i = e.ariaLabel,
                        l = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, Q.useState)(!1)) || function(e) {
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
                                if ("string" == typeof e) return yd(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return yd(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        c = l[0],
                        u = l[1],
                        s = n.find(function(e) {
                            return e.value === o
                        });
                    return (0, $.jsxs)(dF, {
                        open: c,
                        onOpenChange: u,
                        children: [(0, $.jsx)(dU, {
                            asChild: !0,
                            children: (0, $.jsx)(rS, {
                                className: "filter-dropdown-chip",
                                text: null != (r = null == s ? void 0 : s.label) ? r : "",
                                size: "Medium",
                                trailingIconName: "icon-filled-chevron-large-down",
                                isChecked: c,
                                onCheckedChange: u
                            })
                        }), (0, $.jsx)(dz, {
                            align: "start",
                            ariaLabel: i,
                            className: "filter-dropdown-menu",
                            children: (0, $.jsx)(yu, {
                                size: "Medium",
                                children: (0, $.jsx)(ys, {
                                    children: n.map(function(e) {
                                        return (0, $.jsx)(yf, {
                                            value: e.value,
                                            title: e.label,
                                            trailing: e.value === o ? (0, $.jsx)(ra, {
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
                yy = function(e) {
                    var t = e.item,
                        r = e.selected,
                        n = e.unavailable,
                        o = e.onClick,
                        a = (0, Y.useTranslation)().translate,
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
                        children: (0, $.jsx)(c6, {
                            item: t,
                            overlay: l
                        })
                    })
                };

            function ym(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function yb(e) {
                if (Array.isArray(e)) return e
            }

            function yv(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function yh() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function yg(e, t) {
                if (e) {
                    if ("string" == typeof e) return ym(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ym(e, t)
                }
            }
            var yO = {
                    XSmall: "padding-x-small",
                    Small: "padding-x-medium",
                    Medium: "padding-x-medium",
                    Large: "padding-x-medium"
                },
                yw = {
                    XSmall: "gap-x-xsmall",
                    Small: "gap-x-small",
                    Medium: "gap-x-small",
                    Large: "gap-x-small"
                },
                yj = {
                    XSmall: "height-600",
                    Small: "height-800",
                    Medium: "height-1000",
                    Large: "height-1200"
                },
                yx = {
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
                yS = {
                    XSmall: ["text-body-small", "placeholder:text-body-small"],
                    Small: ["text-body-small", "placeholder:text-body-small"],
                    Medium: ["text-body-medium", "placeholder:text-body-medium"],
                    Large: ["text-body-large", "placeholder:text-body-large"]
                },
                yP = "Large",
                yE = (0, Q.forwardRef)(function(e, t) {
                    var r, n = yb(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || yg(r) || yh(),
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
                        y = o.size,
                        m = void 0 === y ? yP : y,
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
                        C = (yb(a) || function(e) {
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
                        }(a) || yg(a, 1) || yh())[0],
                        I = uL(),
                        N = P || I,
                        R = "".concat(N, "-description"),
                        T = null != m ? m : yP,
                        k = f || !!d,
                        D = d || p,
                        M = null != l ? l : void 0 === u ? "icon-regular-magnifying-glass" : void 0,
                        L = (0, Q.useMemo)(function() {
                            return M ? Z().createElement(ra, {
                                name: M,
                                size: T,
                                className: "content-emphasis",
                                "data-testid": "search-input-leading-icon"
                            }) : u
                        }, [M, u, T]),
                        _ = (0, Q.useMemo)(function() {
                            return c ? Z().createElement(ra, {
                                name: c,
                                size: T,
                                className: "content-emphasis",
                                "data-testid": "search-input-trailing-icon"
                            }) : s
                        }, [T, c, s]);
                    return Z().createElement("div", {
                        "data-testid": "search-input-wrapper",
                        className: to("flex width-full flex-col gap-small", w, yv({}, tl, O)),
                        style: j
                    }, i && Z().createElement("label", {
                        htmlFor: N,
                        className: to("text-title-small content-emphasis")
                    }, i, g && Z().createElement(Z().Fragment, null, " ", Z().createElement("span", {
                        className: "content-default"
                    }, "*"))), Z().createElement("div", {
                        "data-testid": "search-input-container",
                        className: to("foundation-web-input flex items-center width-full", !O && "relative clip group/interactable focus-visible:outline-focus disabled:outline-none", dH[v], dK[v], x, yj[T], yx[void 0 === h ? "Rounded" : h][T], yO[T], yw[T], k ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis"),
                        style: S
                    }, Z().createElement(ti, {
                        className: "pointer-events-none"
                    }), L && Z().createElement("div", {
                        className: "flex shrink-0 items-center"
                    }, L), Z().createElement("input", function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var r = null != arguments[t] ? arguments[t] : {},
                                n = Object.keys(r);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(r, e).enumerable
                            }))), n.forEach(function(t) {
                                yv(e, t, r[t])
                            })
                        }
                        return e
                    }({
                        type: "search",
                        id: N,
                        ref: C,
                        placeholder: void 0 === E ? "Search" : E,
                        className: to("width-full min-width-0 padding-none bg-none stroke-none outline-none content-emphasis placeholder:content-muted [appearance:none]", yS[T], "[&::-webkit-search-cancel-button]:hidden [&::-webkit-search-decoration]:hidden [&::-webkit-search-results-button]:hidden [&::-webkit-search-results-decoration]:hidden"),
                        "aria-invalid": k,
                        "aria-describedby": D ? R : void 0,
                        required: g,
                        disabled: O
                    }, A)), _ && Z().createElement("div", {
                        className: "flex shrink-0 items-center",
                        "data-testid": "search-input-trailing-accessory"
                    }, _)), D && Z().createElement("span", {
                        id: R,
                        className: to("text-caption-small", {
                            "content-system-alert": k,
                            "content-default": !k
                        })
                    }, D))
                });
            yE.displayName = "SearchInput";
            var yA = function(e) {
                var t = e.isOpen,
                    r = e.value,
                    n = e.onChange,
                    o = e.onOpen,
                    a = e.onClose,
                    i = (0, Y.useTranslation)().translate,
                    l = (0, Q.useRef)(null),
                    c = i("Label.Search"),
                    u = i("Action.Close");
                (0, Q.useEffect)(function() {
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
                    children: t ? (0, $.jsx)(yE, {
                        ref: l,
                        size: "Medium",
                        name: "inventory-search",
                        value: r,
                        placeholder: c,
                        maxLength: ed.inventorySearchMaxLength,
                        autoComplete: "off",
                        "aria-label": c,
                        trailingIconNode: (0, $.jsx)(tU, {
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
                    }) : (0, $.jsx)(tU, {
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

            function yC(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var yI = function(e) {
                    var t, r, n = e.user,
                        o = e.onItemClick,
                        a = e.isItemInOffers,
                        i = e.isItemUnavailable,
                        l = (0, Y.useTranslation)().translate,
                        c = fK(n.id),
                        u = n.id === (null == (r = (0, ec.authenticatedUser)()) ? void 0 : r.id),
                        s = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, Q.useState)(!1)) || function(e) {
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
                                if ("string" == typeof e) return yC(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return yC(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        f = s[0],
                        d = s[1],
                        p = (0, Q.useMemo)(function() {
                            return ed.inventoryFilters.map(function(e) {
                                return {
                                    value: e.value,
                                    label: l(e.labelKey)
                                }
                            })
                        }, [l]),
                        y = u ? l("Label.YourInventory") : l("Label.TheirInventory", {
                            username: n.displayName
                        }),
                        m = !c.loading && !c.loadFailed && 0 === c.items.length;
                    return (0, $.jsxs)("div", {
                        className: "col-xs-12 trade-inventory-panel",
                        children: [(0, $.jsx)("div", {
                            className: "row inventory-panel-header",
                            children: (0, $.jsx)("h2", {
                                className: "inventory-label paired-name",
                                children: y
                            })
                        }), (0, $.jsxs)("div", {
                            className: "inventory-filter-row",
                            children: [(0, $.jsx)(yp, {
                                options: p,
                                value: c.filter,
                                onSelect: function(e) {
                                    c.setFilter(e), ez(ek, "switchAccessoryType", {
                                        type: e || null
                                    }), eK(eF, "switchAccessoryType", {
                                        filterType: "inventoryCategory",
                                        value: e || null
                                    })
                                },
                                ariaLabel: l("Label.Category")
                            }), (0, $.jsx)(yA, {
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
                                        children: (0, $.jsx)(yy, {
                                            item: e,
                                            selected: a(e),
                                            unavailable: i(e),
                                            onClick: o
                                        })
                                    }, e.id)
                                })
                            }), c.loading && (0, $.jsx)("span", {
                                className: "spinner spinner-default"
                            }), !c.loading && c.loadFailed && (0, $.jsx)("div", {
                                className: "col-xs-12 container-empty",
                                children: l("Error.TradeUnknownError")
                            }), m && ("" !== c.appliedSearch ? (0, $.jsx)("div", {
                                className: "col-xs-12 container-empty",
                                children: l("Label.NoResultsFound", void 0, "No results found")
                            }) : u ? "" !== c.filter ? (0, $.jsx)("div", {
                                className: "col-xs-12 container-empty",
                                children: l("Label.YourInventoryEmpty")
                            }) : (0, $.jsx)(ur, {
                                className: "trade-inventory-empty-state",
                                title: l("Label.YouHaveNoRobloxLimiteds"),
                                subtitle: l("Label.ShopForMoreToStartTrading")
                            }) : (0, $.jsx)("div", {
                                className: "col-xs-12 container-empty",
                                children: l("Label.TheirInventoryEmpty")
                            })), (c.hasPrev || c.hasNext) && (0, $.jsxs)("div", {
                                className: "trade-inventory-pager",
                                children: [(0, $.jsx)("button", {
                                    type: "button",
                                    className: "btn-generic-left-sm",
                                    disabled: !c.hasPrev || c.loading,
                                    "aria-label": l("Action.Back"),
                                    onClick: c.loadPrev,
                                    children: (0, $.jsx)("span", {
                                        className: "icon-left"
                                    })
                                }), (0, $.jsx)("span", {
                                    className: "trade-inventory-pager-label",
                                    children: l("Label.CurrentPage", {
                                        currentPage: c.page
                                    })
                                }), (0, $.jsx)("button", {
                                    type: "button",
                                    className: "btn-generic-right-sm",
                                    disabled: !c.hasNext || c.loading,
                                    "aria-label": l("Action.Next"),
                                    onClick: function() {
                                        ez(ek, "inventoryPage"), c.loadNext()
                                    },
                                    children: (0, $.jsx)("span", {
                                        className: "icon-right"
                                    })
                                })]
                            })]
                        })]
                    })
                },
                yN = function(e) {
                    var t, r = e.offer,
                        n = e.onRemoveItem,
                        o = e.onRobuxChange,
                        a = e.onRobuxBlur,
                        i = e.isRobuxValid,
                        l = e.doesItemHaveError,
                        c = e.getItemErrorReason,
                        u = (0, Y.useTranslation)().translate,
                        s = i(r.robux),
                        f = !!(r.robux && r.robux > 0),
                        d = function(e) {
                            var t = "Bundle" === e.itemTarget.itemType,
                                r = "".concat(t ? "/bundles" : "/catalog", "/").concat(e.itemTarget.targetId, "/").concat(encodeURIComponent(e.itemName.trim().replace(/[^\w\s-]/g, "").replace(/\s+/g, "-"))),
                                o = l(e);
                            return (0, $.jsxs)("div", {
                                className: "trade-request-item".concat(o ? " invalid-request-item" : ""),
                                children: [(0, $.jsx)("span", {
                                    className: "icon-background-circle",
                                    children: (0, $.jsx)("span", {
                                        className: "icon-close cursor-pointer",
                                        role: "button",
                                        tabIndex: 0,
                                        "aria-label": "".concat(u("Action.Remove"), " ").concat(e.itemName),
                                        onClick: function() {
                                            n(e)
                                        },
                                        onKeyDown: function(t) {
                                            ("Enter" === t.key || " " === t.key) && (t.preventDefault(), n(e))
                                        }
                                    })
                                }), (0, $.jsx)(rC.Thumbnail2d, {
                                    type: t ? rC.ThumbnailTypes.bundleThumbnail : rC.ThumbnailTypes.assetThumbnail,
                                    targetId: e.itemTarget.targetId,
                                    size: rC.DefaultThumbnailSize
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
                                        children: (0, tz.formatNumber)(e.recentAveragePrice || 0)
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
                                    title: tQ(e.tradableItem, u),
                                    children: d(e.tradableItem)
                                }, null != (r = e.tradableItem.id) ? r : t)
                            }
                            return "add-item" === e.type ? (0, $.jsx)("div", {
                                className: "trade-request-item draggable-border"
                            }, "add-".concat(t)) : (0, $.jsx)("div", {
                                className: "trade-request-item blank-item"
                            }, "empty-".concat(t))
                        }), (0, $.jsxs)("div", {
                            className: "input-group robux-input-group".concat(s ? "" : " form-has-error form-has-feedback"),
                            children: [(0, $.jsx)("input", {
                                className: "form-control input-field",
                                name: "robux",
                                type: "text",
                                inputMode: "numeric",
                                pattern: "\\d*",
                                placeholder: u("Label.PlusRobuxAmount"),
                                value: null === r.robux ? "" : String(r.robux),
                                onChange: function(e) {
                                    o(r.user.id, e.target.value)
                                },
                                onBlur: function() {
                                    a(r)
                                }
                            }), (0, $.jsx)("div", {
                                className: "input-group-btn",
                                children: (0, $.jsx)("span", {
                                    className: "input-addon-btn",
                                    children: (0, $.jsx)("span", {
                                        className: "icon-robux-gray-16x16"
                                    })
                                })
                            })]
                        }), f && (0, $.jsxs)("div", {
                            className: "robux-line",
                            children: [(0, $.jsx)("span", {
                                className: "text-secondary",
                                children: u("Label.AfterRobuxFee", {
                                    percent: "".concat(t$())
                                })
                            }), (0, $.jsxs)("span", {
                                className: "robux-line-amount",
                                children: [(0, $.jsx)("span", {
                                    className: "icon-robux-16x16"
                                }), (0, $.jsx)("span", {
                                    className: "text-secondary robux-line-value",
                                    children: (0, tz.formatNumber)(tX(null != (t = r.robux) ? t : 0))
                                })]
                            })]
                        }), (0, $.jsxs)("div", {
                            className: "robux-line",
                            children: [(0, $.jsx)("span", {
                                className: "text-lead",
                                children: u("Label.TotalValue")
                            }), (0, $.jsxs)("span", {
                                className: "robux-line-amount",
                                children: [(0, $.jsx)("span", {
                                    className: "icon-robux-16x16"
                                }), (0, $.jsx)("span", {
                                    className: "text-robux-lg robux-line-value",
                                    children: (0, tz.formatNumber)(tG(r))
                                })]
                            })]
                        })]
                    })
                },
                yR = function(e) {
                    var t, r = e.route,
                        n = e.systemFeedbackService,
                        o = (0, Y.useTranslation)().translate,
                        a = el().navigate,
                        i = (0, Q.useMemo)(function() {
                            return tJ()
                        }, []),
                        l = fT(n),
                        c = (0, Q.useRef)(!1);
                    (0, Q.useEffect)(function() {
                        if (!c.current) {
                            c.current = !0;
                            var e = "counter" === r.view,
                                t = eV();
                            eK(eM, e ? "counterTrade" : "createTrade", {
                                state: e ? ed.states.counterTrade : ed.states.tradeWithUser,
                                referrer: t.referrer,
                                entrySource: t.entrySource
                            })
                        }
                    }, [r.view]);
                    var u = (0, Q.useMemo)(function() {
                        return l.offers.toSorted(function(e, t) {
                            return Number(t.isMyOffer) - Number(e.isMyOffer)
                        })
                    }, [l.offers]);
                    return eJ("TradeRequest render: view=", r.view, "loaded=", l.loaded, "initError=", l.initError, "offers=", l.offers.length), (0, $.jsxs)("div", {
                        className: "trades-react trade-request-react".concat(i ? " is-mobile" : ""),
                        children: [(0, $.jsxs)("div", {
                            className: "trade-request-window",
                            children: [(0, $.jsxs)("span", {
                                className: "text-link cursor-pointer",
                                role: "button",
                                tabIndex: 0,
                                onClick: function() {
                                    a({
                                        view: "list"
                                    })
                                },
                                onKeyDown: function(e) {
                                    ("Enter" === e.key || " " === e.key) && a({
                                        view: "list"
                                    })
                                },
                                children: [(0, $.jsx)("span", {
                                    className: "icon-back"
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
                                children: (0, $.jsx)(c8, {
                                    position: "bottom-end",
                                    title: o("Label.HoldingPolicy"),
                                    description: o("Message.HoldingPolicy"),
                                    children: (0, $.jsx)(c3, {
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
                            }), !l.loaded && !l.initError && (0, $.jsx)("span", {
                                className: "spinner spinner-default"
                            }), l.initError && (0, $.jsx)("div", {
                                className: "text-error section-content-off",
                                children: l.initError
                            }), l.loaded && (0, $.jsxs)(Z().Fragment, {
                                children: [(0, $.jsx)("div", {
                                    className: "inventory-panel-holder",
                                    children: u.map(function(e) {
                                        return (0, $.jsx)(yI, {
                                            user: e.user,
                                            onItemClick: l.toggleItem,
                                            isItemInOffers: l.isItemInOffers,
                                            isItemUnavailable: l.isItemUnavailable
                                        }, e.user.id)
                                    })
                                }), (0, $.jsx)("div", {
                                    className: "trade-request-window-offers-parent",
                                    children: (0, $.jsxs)("div", {
                                        className: "trade-request-window-offers",
                                        children: [u.map(function(e) {
                                            return (0, $.jsx)(yN, {
                                                offer: e,
                                                onRemoveItem: l.removeItem,
                                                onRobuxChange: l.setRobux,
                                                onRobuxBlur: l.onRobuxBlur,
                                                isRobuxValid: l.isRobuxAmountValid,
                                                doesItemHaveError: l.doesItemHaveError,
                                                getItemErrorReason: l.getItemErrorReason
                                            }, e.user.id)
                                        }), l.error && (0, $.jsx)("div", {
                                            className: "text-error",
                                            children: l.error
                                        }), (0, $.jsx)("button", {
                                            type: "button",
                                            className: "btn-cta-md btn-full-width",
                                            disabled: l.tradePending,
                                            onClick: l.requestSend,
                                            children: o("Label.RequestTrade")
                                        })]
                                    })
                                })]
                            })]
                        }), (0, $.jsx)(aR, {
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
                                    days: ed.holdingPeriodDays
                                })
                            }),
                            onAction: l.confirmSend,
                            onCancel: l.cancelSend
                        }), (0, $.jsx)(aR, {
                            open: null !== l.economicBody,
                            title: o("Heading.EconomicRestrictionsError"),
                            body: null != (t = l.economicBody) ? t : "",
                            showAction: !1,
                            neutralText: o("Action.Cancel"),
                            closeLabel: o("Action.Close"),
                            onCancel: l.dismissEconomic
                        }), (0, $.jsx)(aR, {
                            open: l.verificationRedirectOpen,
                            title: o("Heading.TwoStepVerificationRequired"),
                            body: o("Message.TwoStepVerificationRequired"),
                            actionText: o("Action.GoToSecurity"),
                            actionVariant: "Emphasis",
                            neutralText: o("Action.Cancel"),
                            closeLabel: o("Action.Close"),
                            onAction: function() {
                                l.dismissVerificationRedirect(), r_()
                            },
                            onCancel: l.dismissVerificationRedirect
                        })]
                    })
                };

            function yT(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var yk = function(e) {
                    var t = e.systemFeedbackService;
                    return eX(), (0, $.jsxs)(Z().Fragment, {
                        children: [(0, $.jsx)(e7, {}), (0, $.jsx)(fO, {
                            systemFeedbackService: t
                        })]
                    })
                },
                yD = function() {
                    var e, t = (0, Y.useTranslation)().translate,
                        r = (0, J.useSystemFeedback)(),
                        n = r.SystemFeedbackComponent,
                        o = r.systemFeedbackService,
                        a = function(e) {
                            if (Array.isArray(e)) return e
                        }(e = (0, Q.useState)(function() {
                            var e;
                            return null != (e = en()) ? e : {
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
                                if ("string" == typeof e) return yT(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return yT(e, 2)
                            }
                        }(e) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        i = a[0],
                        l = a[1],
                        c = (0, Q.useCallback)(function(e) {
                            var t = eo(e);
                            eJ("navigate ->", e, "path:", t), window.history.pushState(null, "", t), l(e)
                        }, []);
                    return (0, Q.useEffect)(function() {
                        var e = function() {
                            var e, t = null != (e = en()) ? e : {
                                view: "list"
                            };
                            eJ("popstate ->", t), l(t)
                        };
                        return window.addEventListener("popstate", e),
                            function() {
                                window.removeEventListener("popstate", e)
                            }
                    }, []), eJ("render app view:", i.view, i), (0, $.jsxs)(ei, {
                        value: {
                            route: i,
                            navigate: c
                        },
                        children: [(0, $.jsx)(tn, {
                            fallbackMessage: t("Error.FailedToLoadTradesList"),
                            children: "list" === i.view ? (0, $.jsx)(yk, {
                                systemFeedbackService: o
                            }) : (0, $.jsx)(yR, {
                                route: i,
                                systemFeedbackService: o
                            })
                        }), (0, $.jsx)(n, {}), (0, $.jsx)("div", {
                            id: "2sv-popup-container"
                        })]
                    })
                },
                yM = function() {
                    return (0, $.jsx)(Y.TranslationProvider, {
                        config: ee.P,
                        children: (0, $.jsx)(J.SystemFeedbackProvider, {
                            children: (0, $.jsx)(yD, {})
                        })
                    })
                };
            G()(function() {
                var e = document.getElementById("trades-web-app") || document.getElementById("trades-container");
                if (!e) {
                    e1("No container found for React trades mounting (looked for #trades-web-app / #trades-container)."), eW("mount", "No container found for React trades mounting");
                    return
                }
                e.classList.add("trades-container"), eJ("mounting React trades into", "#".concat(e.id), "route:", en());
                try {
                    (0, Y.renderWithErrorBoundary)((0, $.jsx)(yM, {}), e), eJ("React trades mounted successfully")
                } catch (e) {
                    e1("React trades failed to mount", e), eW("mount", e)
                }
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("Trades");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/trades-2147ba1b2704a967.js.map
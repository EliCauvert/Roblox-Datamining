! function() {
    try {
        var t = "undefined" != typeof window ? window : "undefined" != typeof global ? global : "undefined" != typeof globalThis ? globalThis : "undefined" != typeof self ? self : {};
        t.SENTRY_RELEASE = {
            id: "db78a60ecb123dd93d9f646f75ae47efbf9aed49"
        };
        var n = (new t.Error).stack;
        n && (t._sentryDebugIds = t._sentryDebugIds || {}, t._sentryDebugIds[n] = "f22d3332-164a-4ba7-8d40-877d947c9242", t._sentryDebugIdIdentifier = "sentry-dbid-f22d3332-164a-4ba7-8d40-877d947c9242")
    } catch (t) {}
}(),
function() {
    "use strict";
    var t = {
            452: function(t, n, r) {
                t.exports = {}
            },
            224: function(t, n, r) {
                t.exports = {}
            }
        },
        n = {};

    function r(o) {
        var a = n[o];
        if (void 0 !== a) return a.exports;
        var i = n[o] = {
            exports: {}
        };
        return t[o](i, i.exports, r), i.exports
    }
    r.m = t, r.n = function(t) {
        var n = t && t.__esModule ? function() {
            return t.default
        } : function() {
            return t
        };
        return r.d(n, {
            a: n
        }), n
    }, r.d = function(t, n) {
        for (var o in n) r.o(n, o) && !r.o(t, o) && Object.defineProperty(t, o, {
            enumerable: !0,
            get: n[o]
        })
    }, r.k = function(t) {
        return "" + t + ".css"
    }, r.g = function() {
        if ("object" == typeof globalThis) return globalThis;
        try {
            return this || Function("return this")()
        } catch (t) {
            if ("object" == typeof window) return window
        }
    }(), r.o = function(t, n) {
        return Object.prototype.hasOwnProperty.call(t, n)
    }, r.r = function(t) {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(t, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(t, "__esModule", {
            value: !0
        })
    }, r.nc = void 0, r.rv = function() {
        return "1.5.7"
    }, r.g.importScripts && (o = r.g.location + "");
    var o, a = r.g.document;
    if (!o && a && (a.currentScript && "SCRIPT" === a.currentScript.tagName.toUpperCase() && (o = a.currentScript.src), !o)) {
        var i = a.getElementsByTagName("script");
        if (i.length)
            for (var l = i.length - 1; l > -1 && (!o || !/^http(s?):/.test(o));) o = i[l--].src
    }
    if (!o) throw Error("Automatic publicPath is not supported in this browser");
    r.p = o.replace(/^blob:/, "").replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/[^\/]+$/, "/"), r.ruid = "bundler=rspack@1.5.7",
        function() {
            var t, n, o, a, i, l, u, c, s, d, f, p, v, m, h, y, b, g, w, x, S, O, j, E, C, P, A, T, R, N, I, k, D, L, M, _, F, U, W, z = window.ReactJSX,
                V = window.Roblox["core-scripts"].util.ready,
                B = r.n(V),
                H = window.Roblox["core-scripts"].react,
                K = window.React,
                q = r.n(K),
                X = window.ReactStyleGuide,
                $ = JSON.parse('{"P":["Common.AssetTypes","CommonUI.Controls","Authentication.TwoStepVerification","IAPExperience.PurchaseError","Purchasing.PurchaseDialog","Feature.NotApproved","Feature.Trades"]}'),
                Y = /\/(?:trades|users)(?:\/.*)?$/,
                G = function() {
                    var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : window.location.pathname;
                    return t.replace(Y, "")
                },
                Z = function() {
                    var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : window.location.pathname,
                        n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : window.location.search,
                        r = /\/trades\/(\d+)\/counter\/?$/.exec(t);
                    if (r) return {
                        view: "counter",
                        tradeId: parseInt(r[1], 10)
                    };
                    var o = /\/users\/(\d+)\/trade\/?$/.exec(t);
                    return o ? {
                        view: "create",
                        userId: parseInt(o[1], 10)
                    } : /\/trades\/?$/.test(t) ? {
                        view: "list",
                        tab: new URLSearchParams(n).get("tab") || void 0
                    } : null
                },
                Q = function(t) {
                    var n, r, o = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : G();
                    switch (t.view) {
                        case "counter":
                            return "".concat(o, "/trades/").concat(null != (n = t.tradeId) ? n : "", "/counter");
                        case "create":
                            return "".concat(o, "/users/").concat(null != (r = t.userId) ? r : "", "/trade");
                        default:
                            return "".concat(o, "/trades").concat(t.tab ? "?tab=".concat(encodeURIComponent(t.tab)) : "")
                    }
                },
                J = (0, K.createContext)(null),
                ee = J.Provider,
                et = function() {
                    var t = (0, K.useContext)(J);
                    if (!t) throw Error("useTradesRouter must be used within a TradesRouterProvider");
                    return t
                },
                en = window.Roblox["core-scripts"].meta.user,
                er = window.Roblox["core-scripts"].environmentUrls,
                eo = r.n(er),
                ea = window.Roblox["core-scripts"].endpoints,
                ei = {
                    states: {
                        tradesList: "trades-list",
                        tradeWithUser: "trade-with-user",
                        counterTrade: "counter-trade"
                    },
                    urls: {
                        tradesApi: eo().tradesApi,
                        inventoryApi: eo().inventoryApi,
                        usersApi: eo().usersApi,
                        privacySettings: (0, ea.getAbsoluteUrl)("/my/account#!/privacy"),
                        settings: (0, ea.getAbsoluteUrl)("/my/account#!/security"),
                        membership: (0, ea.getAbsoluteUrl)("/premium/membership"),
                        badRequest: (0, ea.getAbsoluteUrl)("/request-error?code=400"),
                        forbidden: (0, ea.getAbsoluteUrl)("/request-error?code=403"),
                        get2SVConfiguration: "".concat(eo().twoStepVerificationApi, "/v1/users/{userId}/configuration"),
                        generate: "".concat(eo().tradesApi, "/v1/trade-friction/two-step-verification/generate"),
                        redeem: "".concat(eo().tradesApi, "/v1/trade-friction/two-step-verification/redeem"),
                        getSettings: "".concat(eo().apiGatewayUrl, "/user-settings-api/v1/user-settings"),
                        setTradeQuality: "".concat(eo().apiGatewayUrl, "/user-settings-api/v1/user-settings")
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
                el = window.Roblox["core-scripts"].format.string,
                eu = window.Roblox["core-scripts"].http.http;

            function ec(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function es(t, n, r, o, a, i, l) {
                try {
                    var u = t[i](l),
                        c = u.value
                } catch (t) {
                    r(t);
                    return
                }
                u.done ? n(c) : Promise.resolve(c).then(o, a)
            }

            function ed(t) {
                return function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(o, a) {
                        var i = t.apply(n, r);

                        function l(t) {
                            es(i, o, a, l, u, "next", t)
                        }

                        function u(t) {
                            es(i, o, a, l, u, "throw", t)
                        }
                        l(void 0)
                    })
                }
            }

            function ef(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        var o;
                        o = r[n], n in t ? Object.defineProperty(t, n, {
                            value: o,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : t[n] = o
                    })
                }
                return t
            }

            function ep(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function ev(t) {
                return function(t) {
                    if (Array.isArray(t)) return ec(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return ec(t, void 0);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ec(t, n)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function em(t, n) {
                var r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return l.next = u(0), l.throw = u(1), l.return = u(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                    return this
                }), l;

                function u(u) {
                    return function(c) {
                        var s = [u, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                            if (r = 1, o && (a = 2 & s[0] ? o.return : s[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, s[1])).done) return a;
                            switch (o = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                case 0:
                                case 1:
                                    a = s;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, o = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                        i.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && i.label < a[1]) {
                                        i.label = a[1], a = s;
                                        break
                                    }
                                    if (a && i.label < a[2]) {
                                        i.label = a[2], i.ops.push(s);
                                        break
                                    }
                                    a[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            s = n.call(t, i)
                        } catch (t) {
                            s = [6, t], o = 0
                        } finally {
                            r = a = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var eh = function(t, n) {
                    return (0, el.concat)([(0, el.escapeHtml)(null != t ? t : ""), (0, el.escapeHtml)(null != n ? n : "")], void 0, !0)
                },
                ey = function(t) {
                    return ed(function() {
                        var n, r, o, a;
                        return em(this, function(i) {
                            switch (i.label) {
                                case 0:
                                    return n = {
                                        url: "".concat(ei.urls.tradesApi, "/v1/trades/").concat(t.tradeStatusType),
                                        withCredentials: !0
                                    }, r = {
                                        cursor: t.cursor,
                                        limit: t.count,
                                        sortOrder: "Desc"
                                    }, [4, eu.get(n, r)];
                                case 1:
                                    return a = ((o = i.sent().data).data || []).map(function(n) {
                                        return ep(ef({}, n), {
                                            tradeStatusType: t.tradeStatusType,
                                            user: n.user ? ep(ef({}, n.user), {
                                                nameForDisplay: n.user.displayName
                                            }) : n.user
                                        })
                                    }), [2, {
                                        nextPageCursor: o.nextPageCursor,
                                        items: a
                                    }]
                            }
                        })
                    })()
                },
                eb = function(t, n) {
                    return ed(function() {
                        var r, o, a, i;
                        return em(this, function(l) {
                            switch (l.label) {
                                case 0:
                                    return a = {
                                        url: "".concat(ei.urls.tradesApi, "/v2/trades/").concat(n),
                                        withCredentials: !0
                                    }, [4, eu.get(a)];
                                case 1:
                                    if (!(i = l.sent().data)) return [2, null];
                                    return (null == (r = i.participantAOffer.user) ? void 0 : r.id) === t ? i.user = i.participantBOffer.user : (null == (o = i.participantBOffer.user) ? void 0 : o.id) === t && (i.user = i.participantAOffer.user), i.user && (i.user.nameForDisplay = eh(i.user.displayName, i.user.name)), i.offers = [i.participantAOffer, i.participantBOffer], [2, i]
                            }
                        })
                    })()
                },
                eg = function(t, n, r) {
                    var o = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : ei.getTradableItemsLimit;
                    return ed(function() {
                        var a, i, l, u;
                        return em(this, function(c) {
                            switch (c.label) {
                                case 0:
                                    return a = {
                                        url: "".concat(ei.urls.tradesApi, "/v2/users/").concat(t, "/tradableItems"),
                                        withCredentials: !0
                                    }, i = {
                                        sortBy: "CreationTime",
                                        sortOrder: "Desc",
                                        limit: o
                                    }, r && (i.cursor = r), n && (i.itemTargetTypes = n), [4, eu.get(a, i)];
                                case 1:
                                    return [2, {
                                        items: ((l = c.sent().data).items || []).reduce(function(t, n) {
                                            return ev(t).concat(ev(n.instances || []))
                                        }, []).map(function(n) {
                                            return ep(ef({}, n), {
                                                id: n.collectibleItemInstanceId,
                                                userId: t
                                            })
                                        }),
                                        nextPageCursor: null != (u = l.nextPageCursor) ? u : null
                                    }]
                            }
                        })
                    })()
                },
                ew = function(t) {
                    try {
                        return eu.getApiErrorCodes(t) || []
                    } catch (t) {
                        return []
                    }
                },
                ex = function(t) {
                    var n = function(t) {
                            if (!t || (void 0 === t ? "undefined" : t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) != "object") return null;
                            var n = t.errors;
                            return Array.isArray(n) ? n : null
                        },
                        r = null == t ? void 0 : t.response,
                        o = n(t) || n(null == t ? void 0 : t.data) || n(null == r ? void 0 : r.data);
                    return o && o.length > 0 ? o[0] : null
                },
                eS = window.Roblox["core-scripts"].eventStream;

            function eO(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        var o;
                        o = r[n], n in t ? Object.defineProperty(t, n, {
                            value: o,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : t[n] = o
                    })
                }
                return t
            }

            function ej(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }
            var eE = "react",
                eC = "tradesListInteraction",
                eP = "tradeRequestInteractionV2",
                eA = "tradeRequestSent",
                eT = "tradePageView",
                eR = "tradeViewed",
                eN = "tradeCenterFirstVisit",
                eI = "tradeFilterClick",
                ek = "tradeBannerDismiss",
                eD = function(t, n) {
                    var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
                    (0, eS.sendEventWithTarget)(t, n, ej(eO({}, r), {
                        pg: "v2",
                        framework: eE
                    }))
                },
                eL = function(t, n) {
                    var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                        o = Roblox.AXAnalyticsService,
                        a = Roblox.AXSendTrackingActionType;
                    if (o && "function" == typeof o.sendAXTracking) {
                        var i = t === eT || t === eN || t === eR ? null == a ? void 0 : a.View : null == a ? void 0 : a.Click;
                        o.sendAXTracking({
                            itemName: t,
                            actionType: i,
                            metaData: {
                                metaData: JSON.stringify(ej(eO({
                                    context: n
                                }, r), {
                                    pg: "v2",
                                    framework: eE
                                }))
                            }
                        })
                    }
                },
                eM = function(t) {
                    if (!t) return {};
                    if ("string" == typeof t) return {
                        errorMessage: t
                    };
                    if ("errors" in t && Array.isArray(t.errors) && t.errors.length > 0) {
                        var n = t.errors[0];
                        return {
                            errorCode: n.code,
                            errorMessage: n.message
                        }
                    }
                    return {
                        errorName: t.name,
                        errorMessage: t.message,
                        errorCode: t.code
                    }
                },
                e_ = function(t, n) {
                    var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
                    eL("tradeError", t, eO({}, r, eM(n)))
                },
                eF = function(t) {
                    var n = t.offers;
                    if (!n || n.length < 2) return {};
                    var r = function(t) {
                            return t.items.reduce(function(t, n) {
                                return t + (Number(n.recentAveragePrice) || 0)
                            }, 0)
                        },
                        o = Number(n[1].robux) || 0,
                        a = Number(n[0].robux) || 0,
                        i = {
                            totalValueOffered: o += r(n[1]),
                            totalValueRequested: a += r(n[0]),
                            robuxOffered: Number(n[1].robux) || 0,
                            robuxRequested: Number(n[0].robux) || 0
                        };
                    return [0, 1, 2, 3].forEach(function(t) {
                        i["itemValueOffered_".concat(t + 1)] = n[1].items.length > t && n[1].items[t].recentAveragePrice || 0, i["itemValueRequested_".concat(t + 1)] = n[0].items.length > t && n[0].items[t].recentAveragePrice || 0
                    }), i
                },
                eU = function() {
                    var t = "",
                        n = "direct";
                    try {
                        var r = "undefined" != typeof document && document.referrer || "";
                        if (r) {
                            var o = new URL(r);
                            t = o.host + o.pathname, n = "undefined" != typeof window && o.host === window.location.host ? /\/users\/\d+/i.test(o.pathname) ? "profile" : "/" === o.pathname || /\/home/i.test(o.pathname) ? "home" : /\/trades/i.test(o.pathname) ? "tradesInternal" : "internalOther" : "external"
                        }
                    } catch (t) {}
                    return {
                        referrer: t,
                        entrySource: n
                    }
                },
                eW = "rbx.trades.hasVisitedTradeCenter",
                ez = function() {
                    try {
                        if (!window.localStorage || "true" === window.localStorage.getItem(eW)) return !1;
                        return window.localStorage.setItem(eW, "true"), !0
                    } catch (t) {
                        return !1
                    }
                },
                eV = function() {
                    var t = (0, K.useRef)(!1);
                    (0, K.useEffect)(function() {
                        if (!t.current) {
                            t.current = !0;
                            var n, r, o = eU(),
                                a = ez();
                            eL(eT, "tradesList", {
                                state: ei.states.tradesList,
                                referrer: o.referrer,
                                entrySource: o.entrySource,
                                isFirstVisit: a
                            }), a && (n = null == (r = (0, en.authenticatedUser)()) ? void 0 : r.id, ed(function() {
                                var t, r, o;
                                return em(this, function(a) {
                                    switch (a.label) {
                                        case 0:
                                            if (!n || n <= 0) return [2, !1];
                                            t = {
                                                url: "".concat(ei.urls.tradesApi, "/v2/users/").concat(n, "/tradableItems"),
                                                withCredentials: !0
                                            }, r = {
                                                limit: 10,
                                                sortBy: "CreationTime",
                                                sortOrder: "Desc"
                                            }, a.label = 1;
                                        case 1:
                                            return a.trys.push([1, 3, , 4]), [4, eu.get(t, r)];
                                        case 2:
                                            return [2, Array.isArray(null == (o = a.sent().data) ? void 0 : o.items) && o.items.length > 0];
                                        case 3:
                                            return a.sent(), [2, !1];
                                        case 4:
                                            return [2]
                                    }
                                })
                            })()).then(function(t) {
                                eL(eN, "tradesList", {
                                    entrySource: o.entrySource,
                                    ownsLimiteds: t
                                })
                            }).catch(function() {})
                        }
                    }, [])
                };

            function eB(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function eH(t) {
                return function(t) {
                    if (Array.isArray(t)) return eB(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return eB(t, void 0);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eB(t, n)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var eK = "[trades-react]",
                eq = function() {
                    try {
                        return "false" !== window.localStorage.getItem("tradesReactDebug")
                    } catch (t) {
                        return !0
                    }
                },
                eX = function() {
                    for (var t, n = arguments.length, r = Array(n), o = 0; o < n; o++) r[o] = arguments[o];
                    eq() && (t = console).log.apply(t, [eK].concat(eH(r)))
                },
                e$ = function() {
                    for (var t, n = arguments.length, r = Array(n), o = 0; o < n; o++) r[o] = arguments[o];
                    eq() && (t = console).warn.apply(t, [eK].concat(eH(r)))
                },
                eY = function() {
                    for (var t, n = arguments.length, r = Array(n), o = 0; o < n; o++) r[o] = arguments[o];
                    (t = console).error.apply(t, [eK].concat(eH(r)))
                };

            function eG(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function eZ(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var i = [],
                            l = !0,
                            u = !1;
                        try {
                            for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            u = !0, o = t
                        } finally {
                            try {
                                l || null == a.return || a.return()
                            } finally {
                                if (u) throw o
                            }
                        }
                        return i
                    }
                }(t, n) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return eG(t, n);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eG(t, n)
                    }
                }(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var eQ = "rbx.HideMoneyPageBanner",
                eJ = "rbx.HideRegionalRestrictionsBanner",
                e0 = function(t) {
                    try {
                        return !!window.localStorage && "true" === window.localStorage.getItem(t)
                    } catch (t) {
                        return !1
                    }
                },
                e1 = function(t) {
                    try {
                        var n;
                        null == (n = window.localStorage) || n.setItem(t, "true")
                    } catch (t) {}
                },
                e2 = function() {
                    var t = (0, H.useTranslation)().translate,
                        n = eZ((0, K.useState)(!e0(eQ)), 2),
                        r = n[0],
                        o = n[1],
                        a = eZ((0, K.useState)(!1), 2),
                        i = a[0],
                        l = a[1],
                        u = eZ((0, K.useState)(e0(eJ)), 2),
                        c = u[0],
                        s = u[1];
                    (0, K.useEffect)(function() {
                        ed(function() {
                            var t, n;
                            return em(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return t = {
                                            url: "".concat(ei.urls.tradesApi, "/v2/users/me/can-trade"),
                                            withCredentials: !0
                                        }, [4, eu.get(t)];
                                    case 1:
                                        return [2, null != (n = r.sent().data) ? n : null]
                                }
                            })
                        })().then(function(t) {
                            l((null == t ? void 0 : t.tradeEligibility) === ei.tradeEligibility.legalOrRegulatoryRestrictions)
                        }).catch(function() {
                            l(!1)
                        })
                    }, []);
                    var d = function() {
                            o(!1), eL(ek, "close", {
                                banner: "moneyPage"
                            }), e1(eQ)
                        },
                        f = function() {
                            s(!0), eL(ek, "close", {
                                banner: "regionalRestrictions"
                            }), e1(eJ)
                        };
                    return (0, z.jsxs)(q().Fragment, {
                        children: [r && (0, z.jsxs)("div", {
                            className: "message-banner money-page-banner",
                            children: [(0, z.jsx)("span", {
                                dangerouslySetInnerHTML: {
                                    __html: t("Message.TransactionsAndSummaryMoved", {
                                        robuxIcon: "<span class='icon-robux-gray-16x16'></span>"
                                    })
                                }
                            }), (0, z.jsx)("span", {
                                className: "icon-close cursor-pointer",
                                role: "button",
                                tabIndex: 0,
                                "aria-label": t("Action.Close"),
                                onClick: d,
                                onKeyDown: function(t) {
                                    ("Enter" === t.key || " " === t.key) && d()
                                }
                            })]
                        }), i && !c && (0, z.jsxs)("div", {
                            className: "message-banner regional-restrictions-banner",
                            children: [(0, z.jsx)("span", {
                                children: t("Error.TradeRestrictedByRegionalRestrictions")
                            }), (0, z.jsx)("span", {
                                className: "icon-close cursor-pointer",
                                role: "button",
                                tabIndex: 0,
                                "aria-label": t("Action.Close"),
                                onClick: f,
                                onKeyDown: function(t) {
                                    ("Enter" === t.key || " " === t.key) && f()
                                }
                            })]
                        })]
                    })
                };

            function e3(t, n) {
                for (var r = 0; r < n.length; r++) {
                    var o = n[r];
                    o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(t, o.key, o)
                }
            }

            function e4(t) {
                return (e4 = Object.setPrototypeOf ? Object.getPrototypeOf : function(t) {
                    return t.__proto__ || Object.getPrototypeOf(t)
                })(t)
            }

            function e5(t, n) {
                return (e5 = Object.setPrototypeOf || function(t, n) {
                    return t.__proto__ = n, t
                })(t, n)
            }

            function e6() {
                try {
                    var t = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (t) {}
                return (e6 = function() {
                    return !!t
                })()
            }
            var e8 = function(t) {
                    var n, r;
                    if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");

                    function o(t) {
                        var n, r, a;
                        if (!(this instanceof o)) throw TypeError("Cannot call a class as a function");
                        return r = o, a = [t], r = e4(r), (n = function(t, n) {
                            var r;
                            if (n && ("object" == ((r = n) && "undefined" != typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof n)) return n;
                            if (void 0 === t) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                            return t
                        }(this, e6() ? Reflect.construct(r, a || [], e4(this).constructor) : r.apply(this, a))).state = {
                            hasError: !1
                        }, n
                    }
                    return o.prototype = Object.create(t && t.prototype, {
                        constructor: {
                            value: o,
                            writable: !0,
                            configurable: !0
                        }
                    }), t && e5(o, t), n = [{
                        key: "componentDidCatch",
                        value: function(t, n) {
                            eY("render error caught by boundary:", t, null == n ? void 0 : n.componentStack), e_("renderErrorBoundary", t, {
                                componentStack: null == n ? void 0 : n.componentStack
                            })
                        }
                    }, {
                        key: "render",
                        value: function() {
                            var t = this.state,
                                n = t.hasError,
                                r = t.message,
                                o = this.props,
                                a = o.children,
                                i = o.fallbackMessage;
                            return n ? (0, z.jsxs)("div", {
                                className: "section-content-off",
                                children: [(0, z.jsx)("p", {
                                    className: "no-items text-error",
                                    children: i
                                }), r && (0, z.jsx)("p", {
                                    className: "text-footer",
                                    children: r
                                })]
                            }) : a
                        }
                    }], r = [{
                        key: "getDerivedStateFromError",
                        value: function(t) {
                            return {
                                hasError: !0,
                                message: null == t ? void 0 : t.message
                            }
                        }
                    }], n && e3(o.prototype, n), r && e3(o, r), o
                }(q().Component),
                e7 = window.Roblox["core-scripts"].format.number,
                e9 = window.Roblox["core-scripts"].meta.device,
                te = window.Roblox["core-scripts"].intl.intl,
                tt = r.n(te),
                tn = function(t) {
                    var n = Math.round(t);
                    return Math.abs(t) % 1 != .5 || n % 2 == 0 ? n : n - 1
                },
                tr = function(t) {
                    var n = parseInt(String(t), 10);
                    return n >= ei.minRobux && n <= ei.maxRobux
                },
                to = function(t) {
                    return Number.isInteger(parseInt(String(t), 10))
                },
                ta = function() {
                    return 30
                },
                ti = function(t) {
                    return tr(t) ? tn(.7 * t) : 0
                },
                tl = function(t) {
                    var n, r = t.items.reduce(function(t, n) {
                            return t + (n.recentAveragePrice ? n.recentAveragePrice : 0)
                        }, 0),
                        o = null != (n = t.robux) ? n : 0;
                    return to(o) && tr(o) && (r += parseInt(String(o), 10)), r
                },
                tu = function(t) {
                    return null == t || "" === t || to(t) && tr(t)
                },
                tc = function(t, n) {
                    var r;
                    return t.serialNumber ? n("Label.SerialNumber", {
                        serialNumber: (0, e7.formatNumber)(t.serialNumber),
                        totalNumber: (0, e7.formatNumber)(null != (r = t.assetStock) ? r : 0)
                    }) : n("Label.NoSerialNumber")
                },
                ts = function(t, n) {
                    var r = t.assetStock ? (0, e7.formatNumber)(t.assetStock) : "";
                    if (null != t.serialNumber) {
                        var o = (0, e7.formatNumber)(t.serialNumber);
                        return r ? "#".concat(o, "/").concat(r) : "#".concat(o)
                    }
                    var a = n("Label.NoSerialNumber");
                    return r ? "".concat(a, " /").concat(r) : a
                },
                td = function() {
                    var t;
                    return !!(null == (t = (0, e9.getDeviceMeta)()) ? void 0 : t.isPhone)
                },
                tf = function(t) {
                    return new(tt())().getDateTimeFormatter().getShortDate(new Date(t))
                };

            function tp(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function tv(t, n, r, o, a, i, l) {
                try {
                    var u = t[i](l),
                        c = u.value
                } catch (t) {
                    r(t);
                    return
                }
                u.done ? n(c) : Promise.resolve(c).then(o, a)
            }

            function tm(t) {
                return function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(o, a) {
                        var i = t.apply(n, r);

                        function l(t) {
                            tv(i, o, a, l, u, "next", t)
                        }

                        function u(t) {
                            tv(i, o, a, l, u, "throw", t)
                        }
                        l(void 0)
                    })
                }
            }

            function th(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var i = [],
                            l = !0,
                            u = !1;
                        try {
                            for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            u = !0, o = t
                        } finally {
                            try {
                                l || null == a.return || a.return()
                            } finally {
                                if (u) throw o
                            }
                        }
                        return i
                    }
                }(t, n) || tb(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ty(t) {
                return function(t) {
                    if (Array.isArray(t)) return tp(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || tb(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tb(t, n) {
                if (t) {
                    if ("string" == typeof t) return tp(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tp(t, n)
                }
            }

            function tg(t, n) {
                var r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return l.next = u(0), l.throw = u(1), l.return = u(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                    return this
                }), l;

                function u(u) {
                    return function(c) {
                        var s = [u, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                            if (r = 1, o && (a = 2 & s[0] ? o.return : s[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, s[1])).done) return a;
                            switch (o = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                case 0:
                                case 1:
                                    a = s;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, o = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                        i.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && i.label < a[1]) {
                                        i.label = a[1], a = s;
                                        break
                                    }
                                    if (a && i.label < a[2]) {
                                        i.label = a[2], i.ops.push(s);
                                        break
                                    }
                                    a[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            s = n.call(t, i)
                        } catch (t) {
                            s = [6, t], o = 0
                        } finally {
                            r = a = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var tw = function(t, n) {
                    var r = new Set(t.map(function(t) {
                        return t.id
                    }));
                    return ty(t).concat(ty(n.filter(function(t) {
                        return !r.has(t.id)
                    })))
                },
                tx = function() {
                    var t = th((0, K.useState)([]), 2),
                        n = t[0],
                        r = t[1],
                        o = th((0, K.useState)(!1), 2),
                        a = o[0],
                        i = o[1],
                        l = th((0, K.useState)(!1), 2),
                        u = l[0],
                        c = l[1],
                        s = th((0, K.useState)(!1), 2),
                        d = s[0],
                        f = s[1],
                        p = th((0, K.useState)(!1), 2),
                        v = p[0],
                        m = p[1],
                        h = (0, K.useRef)(""),
                        y = (0, K.useRef)(ei.tradeStatusType.inbound),
                        b = (0, K.useRef)(!1);
                    return {
                        trades: n,
                        loading: a,
                        noResults: u,
                        hasMore: d,
                        loadFailed: v,
                        loadFirstPage: (0, K.useCallback)(function(t) {
                            return tm(function() {
                                var n, o;
                                return tg(this, function(a) {
                                    switch (a.label) {
                                        case 0:
                                            y.current = t, h.current = "", b.current = !0, r([]), c(!1), f(!1), m(!1), i(!0), a.label = 1;
                                        case 1:
                                            return a.trys.push([1, 3, 4, 5]), [4, ey({
                                                cursor: "",
                                                tradeStatusType: t,
                                                count: ei.tradesLoadedPerPage
                                            })];
                                        case 2:
                                            return h.current = (n = a.sent()).nextPageCursor, r(n.items), c(0 === n.items.length), f(null != n.nextPageCursor), [2, n.items];
                                        case 3:
                                            throw o = a.sent(), m(!0), o;
                                        case 4:
                                            return b.current = !1, i(!1), [7];
                                        case 5:
                                            return [2]
                                    }
                                })
                            })()
                        }, []),
                        loadNextPage: (0, K.useCallback)(function() {
                            return tm(function() {
                                var t, n;
                                return tg(this, function(o) {
                                    switch (o.label) {
                                        case 0:
                                            if (b.current || null === h.current || void 0 === h.current) return [2, []];
                                            b.current = !0, m(!1), i(!0), o.label = 1;
                                        case 1:
                                            return o.trys.push([1, 3, 4, 5]), [4, ey({
                                                cursor: h.current || "",
                                                tradeStatusType: y.current,
                                                count: ei.tradesLoadedPerPage
                                            })];
                                        case 2:
                                            return h.current = (t = o.sent()).nextPageCursor, r(function(n) {
                                                return tw(n, t.items)
                                            }), f(null != t.nextPageCursor), [2, t.items];
                                        case 3:
                                            throw n = o.sent(), m(!0), n;
                                        case 4:
                                            return b.current = !1, i(!1), [7];
                                        case 5:
                                            return [2]
                                    }
                                })
                            })()
                        }, []),
                        removeTrade: (0, K.useCallback)(function(t) {
                            r(function(n) {
                                var r = n.filter(function(n) {
                                    return n.id !== t
                                });
                                return 0 === r.length && c(!0), r
                            })
                        }, []),
                        setNoResults: c
                    }
                },
                tS = function() {
                    for (var t, n, r = 0, o = "", a = arguments.length; r < a; r++)(t = arguments[r]) && (n = function t(n) {
                        var r, o, a = "";
                        if ("string" == typeof n || "number" == typeof n) a += n;
                        else if ("object" == (void 0 === n ? "undefined" : n && "undefined" != typeof Symbol && n.constructor === Symbol ? "symbol" : typeof n))
                            if (Array.isArray(n)) {
                                var i = n.length;
                                for (r = 0; r < i; r++) n[r] && (o = t(n[r])) && (a && (a += " "), a += o)
                            } else
                                for (o in n) n[o] && (a && (a += " "), a += o);
                        return a
                    }(t)) && (o && (o += " "), o += n);
                    return o
                },
                tO = window.ReactDOM,
                tj = r.n(tO);

            function tE(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function tC(t, n) {
                var r = function(t) {
                        if (Array.isArray(t)) return t
                    }(n) || function(t, n) {
                        var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                        if (null != a) {
                            var i = [],
                                l = !0,
                                u = !1;
                            try {
                                for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), i.length !== n); l = !0);
                            } catch (t) {
                                u = !0, o = t
                            } finally {
                                try {
                                    l || null == a.return || a.return()
                                } finally {
                                    if (u) throw o
                                }
                            }
                            return i
                        }
                    }(n, 2) || function(t, n) {
                        if (t) {
                            if ("string" == typeof t) return tE(t, 2);
                            var r = Object.prototype.toString.call(t).slice(8, -1);
                            if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tE(t, n)
                        }
                    }(n, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    o = r[0];
                return Math.min(r[1], Math.max(o, t))
            }

            function tP(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function tA(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function tT(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        tA(t, n, r[n])
                    })
                }
                return t
            }

            function tR(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function tN(t, n) {
                if (null == t) return {};
                var r, o, a = function(t, n) {
                    if (null == t) return {};
                    var r, o, a = {},
                        i = Object.keys(t);
                    for (o = 0; o < i.length; o++) r = i[o], n.indexOf(r) >= 0 || (a[r] = t[r]);
                    return a
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(t);
                    for (o = 0; o < i.length; o++) r = i[o], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (a[r] = t[r])
                }
                return a
            }

            function tI(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var i = [],
                            l = !0,
                            u = !1;
                        try {
                            for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            u = !0, o = t
                        } finally {
                            try {
                                l || null == a.return || a.return()
                            } finally {
                                if (u) throw o
                            }
                        }
                        return i
                    }
                }(t, n) || tD(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tk(t) {
                return function(t) {
                    if (Array.isArray(t)) return tP(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || tD(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tD(t, n) {
                if (t) {
                    if ("string" == typeof t) return tP(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tP(t, n)
                }
            }

            function tL() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                var o = n[0];
                if (1 === n.length) return o;
                var a = function() {
                    var t = n.map(function(t) {
                        return {
                            useScope: t(),
                            scopeName: t.scopeName
                        }
                    });
                    return function(n) {
                        var r = t.reduce(function(t, r) {
                            var o = r.useScope,
                                a = r.scopeName;
                            return tT({}, t, o(n)["__scope".concat(a)])
                        }, {});
                        return K.useMemo(function() {
                            return tA({}, "__scope".concat(o.scopeName), r)
                        }, [r])
                    }
                };
                return a.scopeName = o.scopeName, a
            }

            function tM(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }

            function t_() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return function(t) {
                    var r = !1,
                        o = n.map(function(n) {
                            var o = tM(n, t);
                            return r || "function" != typeof o || (r = !0), o
                        });
                    if (r) return function() {
                        for (var t = 0; t < o.length; t++) {
                            var r = o[t];
                            "function" == typeof r ? r() : tM(n[t], null)
                        }
                    }
                }
            }

            function tF() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return K.useCallback(t_.apply(void 0, tk(n)), n)
            }

            function tU(t) {
                var n, r, o = (n = t, (r = K.forwardRef(function(t, n) {
                        var r = t.children,
                            o = tN(t, ["children"]);
                        if (K.isValidElement(r)) {
                            var a, i, l, u = (l = null == (a = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (i = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                c = function(t, n) {
                                    var r = tT({}, n);
                                    for (var o in n) ! function(o) {
                                        var a = t[o],
                                            i = n[o];
                                        /^on[A-Z]/.test(o) ? a && i ? r[o] = function() {
                                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                            i.apply(void 0, tk(n)), a.apply(void 0, tk(n))
                                        } : a && (r[o] = a) : "style" === o ? r[o] = tT({}, a, i) : "className" === o && (r[o] = [a, i].filter(Boolean).join(" "))
                                    }(o);
                                    return tT({}, t, r)
                                }(o, r.props);
                            return r.type !== K.Fragment && (c.ref = n ? t_(n, u) : u), K.cloneElement(r, c)
                        }
                        return K.Children.count(r) > 1 ? K.Children.only(null) : null
                    })).displayName = "".concat(n, ".SlotClone"), r),
                    a = K.forwardRef(function(t, n) {
                        var r = t.children,
                            a = tN(t, ["children"]),
                            i = K.Children.toArray(r),
                            l = i.find(tz);
                        if (l) {
                            var u = l.props.children,
                                c = i.map(function(t) {
                                    return t === l ? K.Children.count(u) > 1 ? K.Children.only(null) : K.isValidElement(u) ? u.props.children : null : t
                                });
                            return (0, z.jsx)(o, tR(tT({}, a), {
                                ref: n,
                                children: K.isValidElement(u) ? K.cloneElement(u, void 0, c) : null
                            }))
                        }
                        return (0, z.jsx)(o, tR(tT({}, a), {
                            ref: n,
                            children: r
                        }))
                    });
                return a.displayName = "".concat(t, ".Slot"), a
            }
            var tW = Symbol("radix.slottable");

            function tz(t) {
                return K.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === tW
            }
            var tV = K.createContext(void 0);

            function tB(t) {
                var n = K.useContext(tV);
                return t || n || "ltr"
            }
            var tH = function() {
                return (tH = Object.assign || function(t) {
                    for (var n, r = 1, o = arguments.length; r < o; r++)
                        for (var a in n = arguments[r]) Object.prototype.hasOwnProperty.call(n, a) && (t[a] = n[a]);
                    return t
                }).apply(this, arguments)
            };

            function tK(t, n) {
                var r = {};
                for (var o in t) Object.prototype.hasOwnProperty.call(t, o) && 0 > n.indexOf(o) && (r[o] = t[o]);
                if (null != t && "function" == typeof Object.getOwnPropertySymbols) {
                    var a = 0;
                    for (o = Object.getOwnPropertySymbols(t); a < o.length; a++) 0 > n.indexOf(o[a]) && Object.prototype.propertyIsEnumerable.call(t, o[a]) && (r[o[a]] = t[o[a]])
                }
                return r
            }

            function tq(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function tX(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function t$(t, n) {
                return null != n && "undefined" != typeof Symbol && n[Symbol.hasInstance] ? !!n[Symbol.hasInstance](t) : t instanceof n
            }

            function tY(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        tX(t, n, r[n])
                    })
                }
                return t
            }

            function tG(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function tZ(t, n) {
                if (null == t) return {};
                var r, o, a = function(t, n) {
                    if (null == t) return {};
                    var r, o, a = {},
                        i = Object.keys(t);
                    for (o = 0; o < i.length; o++) r = i[o], n.indexOf(r) >= 0 || (a[r] = t[r]);
                    return a
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(t);
                    for (o = 0; o < i.length; o++) r = i[o], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (a[r] = t[r])
                }
                return a
            }

            function tQ(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var i = [],
                            l = !0,
                            u = !1;
                        try {
                            for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            u = !0, o = t
                        } finally {
                            try {
                                l || null == a.return || a.return()
                            } finally {
                                if (u) throw o
                            }
                        }
                        return i
                    }
                }(t, n) || t0(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tJ(t) {
                return function(t) {
                    if (Array.isArray(t)) return tq(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || t0(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function t0(t, n) {
                if (t) {
                    if ("string" == typeof t) return tq(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tq(t, n)
                }
            }

            function t1(t, n) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    o = r.checkForDefaultPrevented,
                    a = void 0 === o || o;
                return function(r) {
                    if (null == t || t(r), !1 === a || !r.defaultPrevented) return null == n ? void 0 : n(r)
                }
            }

            function t2(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }

            function t3() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return function(t) {
                    var r = !1,
                        o = n.map(function(n) {
                            var o = t2(n, t);
                            return r || "function" != typeof o || (r = !0), o
                        });
                    if (r) return function() {
                        for (var t = 0; t < o.length; t++) {
                            var r = o[t];
                            "function" == typeof r ? r() : t2(n[t], null)
                        }
                    }
                }
            }

            function t4() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return K.useCallback(t3.apply(void 0, tJ(n)), n)
            }
            var t5 = Symbol("radix.slottable");

            function t6(t) {
                return K.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === t5
            }
            var t8 = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                var r, o, a, i, l, u = (o = r = "Primitive.".concat(n), (a = K.forwardRef(function(t, n) {
                        var r = t.children,
                            o = tZ(t, ["children"]);
                        if (K.isValidElement(r)) {
                            var a, i, l, u = (l = null == (a = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (i = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                c = function(t, n) {
                                    var r = tY({}, n);
                                    for (var o in n) ! function(o) {
                                        var a = t[o],
                                            i = n[o];
                                        /^on[A-Z]/.test(o) ? a && i ? r[o] = function() {
                                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                            i.apply(void 0, tJ(n)), a.apply(void 0, tJ(n))
                                        } : a && (r[o] = a) : "style" === o ? r[o] = tY({}, a, i) : "className" === o && (r[o] = [a, i].filter(Boolean).join(" "))
                                    }(o);
                                    return tY({}, t, r)
                                }(o, r.props);
                            return r.type !== K.Fragment && (c.ref = n ? t3(n, u) : u), K.cloneElement(r, c)
                        }
                        return K.Children.count(r) > 1 ? K.Children.only(null) : null
                    })).displayName = "".concat(o, ".SlotClone"), i = a, (l = K.forwardRef(function(t, n) {
                        var r = t.children,
                            o = tZ(t, ["children"]),
                            a = K.Children.toArray(r),
                            l = a.find(t6);
                        if (l) {
                            var u = l.props.children,
                                c = a.map(function(t) {
                                    return t === l ? K.Children.count(u) > 1 ? K.Children.only(null) : K.isValidElement(u) ? u.props.children : null : t
                                });
                            return (0, z.jsx)(i, tG(tY({}, o), {
                                ref: n,
                                children: K.isValidElement(u) ? K.cloneElement(u, void 0, c) : null
                            }))
                        }
                        return (0, z.jsx)(i, tG(tY({}, o), {
                            ref: n,
                            children: r
                        }))
                    })).displayName = "".concat(r, ".Slot"), l),
                    c = K.forwardRef(function(t, r) {
                        var o = t.asChild,
                            a = tZ(t, ["asChild"]),
                            i = o ? u : n;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, z.jsx)(i, tG(tY({}, a), {
                            ref: r
                        }))
                    });
                return c.displayName = "Primitive.".concat(n), tG(tY({}, t), tX({}, n, c))
            }, {});

            function t7(t) {
                var n = K.useRef(t);
                return K.useEffect(function() {
                    n.current = t
                }), K.useMemo(function() {
                    return function() {
                        for (var t, r = arguments.length, o = Array(r), a = 0; a < r; a++) o[a] = arguments[a];
                        return null == (t = n.current) ? void 0 : t.call.apply(t, [n].concat(tJ(o)))
                    }
                }, [])
            }
            var t9, ne, nt = "dismissableLayer.update",
                nn = K.createContext({
                    layers: new Set,
                    layersWithOutsidePointerEventsDisabled: new Set,
                    branches: new Set
                }),
                nr = K.forwardRef(function(t, n) {
                    var r, o, a = t.disableOutsidePointerEvents,
                        i = void 0 !== a && a,
                        l = t.onEscapeKeyDown,
                        u = t.onPointerDownOutside,
                        c = t.onFocusOutside,
                        s = t.onInteractOutside,
                        d = t.onDismiss,
                        f = tZ(t, ["disableOutsidePointerEvents", "onEscapeKeyDown", "onPointerDownOutside", "onFocusOutside", "onInteractOutside", "onDismiss"]),
                        p = K.useContext(nn),
                        v = tQ(K.useState(null), 2),
                        m = v[0],
                        h = v[1],
                        y = null != (o = null == m ? void 0 : m.ownerDocument) ? o : null == (r = globalThis) ? void 0 : r.document,
                        b = tQ(K.useState({}), 2)[1],
                        g = t4(n, function(t) {
                            return h(t)
                        }),
                        w = Array.from(p.layers),
                        x = tQ(tJ(p.layersWithOutsidePointerEventsDisabled).slice(-1), 1)[0],
                        S = w.indexOf(x),
                        O = m ? w.indexOf(m) : -1,
                        j = p.layersWithOutsidePointerEventsDisabled.size > 0,
                        E = O >= S,
                        C = function(t) {
                            var n, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                                o = t7(t),
                                a = K.useRef(!1),
                                i = K.useRef(function() {});
                            return K.useEffect(function() {
                                var t = function(t) {
                                        if (t.target && !a.current) {
                                            var n = function() {
                                                    na("dismissableLayer.pointerDownOutside", o, l, {
                                                        discrete: !0
                                                    })
                                                },
                                                l = {
                                                    originalEvent: t
                                                };
                                            "touch" === t.pointerType ? (r.removeEventListener("click", i.current), i.current = n, r.addEventListener("click", i.current, {
                                                once: !0
                                            })) : n()
                                        } else r.removeEventListener("click", i.current);
                                        a.current = !1
                                    },
                                    n = window.setTimeout(function() {
                                        r.addEventListener("pointerdown", t)
                                    }, 0);
                                return function() {
                                    window.clearTimeout(n), r.removeEventListener("pointerdown", t), r.removeEventListener("click", i.current)
                                }
                            }, [r, o]), {
                                onPointerDownCapture: function() {
                                    return a.current = !0
                                }
                            }
                        }(function(t) {
                            var n = t.target,
                                r = tJ(p.branches).some(function(t) {
                                    return t.contains(n)
                                });
                            E && !r && (null == u || u(t), null == s || s(t), t.defaultPrevented || null == d || d())
                        }, y),
                        P = function(t) {
                            var n, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                                o = t7(t),
                                a = K.useRef(!1);
                            return K.useEffect(function() {
                                var t = function(t) {
                                    t.target && !a.current && na("dismissableLayer.focusOutside", o, {
                                        originalEvent: t
                                    }, {
                                        discrete: !1
                                    })
                                };
                                return r.addEventListener("focusin", t),
                                    function() {
                                        return r.removeEventListener("focusin", t)
                                    }
                            }, [r, o]), {
                                onFocusCapture: function() {
                                    return a.current = !0
                                },
                                onBlurCapture: function() {
                                    return a.current = !1
                                }
                            }
                        }(function(t) {
                            var n = t.target;
                            tJ(p.branches).some(function(t) {
                                return t.contains(n)
                            }) || (null == c || c(t), null == s || s(t), t.defaultPrevented || null == d || d())
                        }, y);
                    return function(t) {
                        var n, r, o = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                            a = (r = K.useRef(t), K.useEffect(function() {
                                r.current = t
                            }), K.useMemo(function() {
                                return function() {
                                    for (var t, n = arguments.length, o = Array(n), a = 0; a < n; a++) o[a] = arguments[a];
                                    return null == (t = r.current) ? void 0 : t.call.apply(t, [r].concat(tJ(o)))
                                }
                            }, []));
                        K.useEffect(function() {
                            var t = function(t) {
                                "Escape" === t.key && a(t)
                            };
                            return o.addEventListener("keydown", t, {
                                    capture: !0
                                }),
                                function() {
                                    return o.removeEventListener("keydown", t, {
                                        capture: !0
                                    })
                                }
                        }, [a, o])
                    }(function(t) {
                        O === p.layers.size - 1 && (null == l || l(t), !t.defaultPrevented && d && (t.preventDefault(), d()))
                    }, y), K.useEffect(function() {
                        if (m) return i && (0 === p.layersWithOutsidePointerEventsDisabled.size && (ne = y.body.style.pointerEvents, y.body.style.pointerEvents = "none"), p.layersWithOutsidePointerEventsDisabled.add(m)), p.layers.add(m), no(),
                            function() {
                                i && 1 === p.layersWithOutsidePointerEventsDisabled.size && (y.body.style.pointerEvents = ne)
                            }
                    }, [m, y, i, p]), K.useEffect(function() {
                        return function() {
                            m && (p.layers.delete(m), p.layersWithOutsidePointerEventsDisabled.delete(m), no())
                        }
                    }, [m, p]), K.useEffect(function() {
                        var t = function() {
                            return b({})
                        };
                        return document.addEventListener(nt, t),
                            function() {
                                return document.removeEventListener(nt, t)
                            }
                    }, []), (0, z.jsx)(t8.div, tG(tY({}, f), {
                        ref: g,
                        style: tY({
                            pointerEvents: j ? E ? "auto" : "none" : void 0
                        }, t.style),
                        onFocusCapture: t1(t.onFocusCapture, P.onFocusCapture),
                        onBlurCapture: t1(t.onBlurCapture, P.onBlurCapture),
                        onPointerDownCapture: t1(t.onPointerDownCapture, C.onPointerDownCapture)
                    }))
                });

            function no() {
                var t = new CustomEvent(nt);
                document.dispatchEvent(t)
            }

            function na(t, n, r, o) {
                var a = o.discrete,
                    i = r.originalEvent.target,
                    l = new CustomEvent(t, {
                        bubbles: !1,
                        cancelable: !0,
                        detail: r
                    });
                n && i.addEventListener(t, n, {
                    once: !0
                }), a ? i && tO.flushSync(function() {
                    return i.dispatchEvent(l)
                }) : i.dispatchEvent(l)
            }
            nr.displayName = "DismissableLayer", K.forwardRef(function(t, n) {
                var r = K.useContext(nn),
                    o = K.useRef(null),
                    a = t4(n, o);
                return K.useEffect(function() {
                    var t = o.current;
                    if (t) return r.branches.add(t),
                        function() {
                            r.branches.delete(t)
                        }
                }, [r.branches]), (0, z.jsx)(t8.div, tG(tY({}, t), {
                    ref: a
                }))
            }).displayName = "DismissableLayerBranch";
            var ni = 0;

            function nl() {
                K.useEffect(function() {
                    var t, n, r = document.querySelectorAll("[data-radix-focus-guard]");
                    return document.body.insertAdjacentElement("afterbegin", null != (t = r[0]) ? t : nu()), document.body.insertAdjacentElement("beforeend", null != (n = r[1]) ? n : nu()), ni++,
                        function() {
                            1 === ni && document.querySelectorAll("[data-radix-focus-guard]").forEach(function(t) {
                                return t.remove()
                            }), ni--
                        }
                }, [])
            }

            function nu() {
                var t = document.createElement("span");
                return t.setAttribute("data-radix-focus-guard", ""), t.tabIndex = 0, t.style.outline = "none", t.style.opacity = "0", t.style.position = "fixed", t.style.pointerEvents = "none", t
            }

            function nc(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }

            function ns() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return function(t) {
                    var r = !1,
                        o = n.map(function(n) {
                            var o = nc(n, t);
                            return r || "function" != typeof o || (r = !0), o
                        });
                    if (r) return function() {
                        for (var t = 0; t < o.length; t++) {
                            var r = o[t];
                            "function" == typeof r ? r() : nc(n[t], null)
                        }
                    }
                }
            }
            var nd = Symbol("radix.slottable");

            function nf(t) {
                return K.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === nd
            }
            var np = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                var r, o, a, i, l, u = (o = r = "Primitive.".concat(n), (a = K.forwardRef(function(t, n) {
                        var r = t.children,
                            o = tZ(t, ["children"]);
                        if (K.isValidElement(r)) {
                            var a, i, l, u = (l = null == (a = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (i = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                c = function(t, n) {
                                    var r = tY({}, n);
                                    for (var o in n) ! function(o) {
                                        var a = t[o],
                                            i = n[o];
                                        /^on[A-Z]/.test(o) ? a && i ? r[o] = function() {
                                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                            i.apply(void 0, tJ(n)), a.apply(void 0, tJ(n))
                                        } : a && (r[o] = a) : "style" === o ? r[o] = tY({}, a, i) : "className" === o && (r[o] = [a, i].filter(Boolean).join(" "))
                                    }(o);
                                    return tY({}, t, r)
                                }(o, r.props);
                            return r.type !== K.Fragment && (c.ref = n ? ns(n, u) : u), K.cloneElement(r, c)
                        }
                        return K.Children.count(r) > 1 ? K.Children.only(null) : null
                    })).displayName = "".concat(o, ".SlotClone"), i = a, (l = K.forwardRef(function(t, n) {
                        var r = t.children,
                            o = tZ(t, ["children"]),
                            a = K.Children.toArray(r),
                            l = a.find(nf);
                        if (l) {
                            var u = l.props.children,
                                c = a.map(function(t) {
                                    return t === l ? K.Children.count(u) > 1 ? K.Children.only(null) : K.isValidElement(u) ? u.props.children : null : t
                                });
                            return (0, z.jsx)(i, tG(tY({}, o), {
                                ref: n,
                                children: K.isValidElement(u) ? K.cloneElement(u, void 0, c) : null
                            }))
                        }
                        return (0, z.jsx)(i, tG(tY({}, o), {
                            ref: n,
                            children: r
                        }))
                    })).displayName = "".concat(r, ".Slot"), l),
                    c = K.forwardRef(function(t, r) {
                        var o = t.asChild,
                            a = tZ(t, ["asChild"]),
                            i = o ? u : n;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, z.jsx)(i, tG(tY({}, a), {
                            ref: r
                        }))
                    });
                return c.displayName = "Primitive.".concat(n), tG(tY({}, t), tX({}, n, c))
            }, {});

            function nv(t) {
                var n = K.useRef(t);
                return K.useEffect(function() {
                    n.current = t
                }), K.useMemo(function() {
                    return function() {
                        for (var t, r = arguments.length, o = Array(r), a = 0; a < r; a++) o[a] = arguments[a];
                        return null == (t = n.current) ? void 0 : t.call.apply(t, [n].concat(tJ(o)))
                    }
                }, [])
            }
            var nm = "focusScope.autoFocusOnMount",
                nh = "focusScope.autoFocusOnUnmount",
                ny = {
                    bubbles: !1,
                    cancelable: !0
                },
                nb = K.forwardRef(function(t, n) {
                    var r = t.loop,
                        o = void 0 !== r && r,
                        a = t.trapped,
                        i = void 0 !== a && a,
                        l = t.onMountAutoFocus,
                        u = t.onUnmountAutoFocus,
                        c = tZ(t, ["loop", "trapped", "onMountAutoFocus", "onUnmountAutoFocus"]),
                        s = tQ(K.useState(null), 2),
                        d = s[0],
                        f = s[1],
                        p = nv(l),
                        v = nv(u),
                        m = K.useRef(null),
                        h = function() {
                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                            return K.useCallback(ns.apply(void 0, tJ(n)), n)
                        }(n, function(t) {
                            return f(t)
                        }),
                        y = K.useRef({
                            paused: !1,
                            pause: function() {
                                this.paused = !0
                            },
                            resume: function() {
                                this.paused = !1
                            }
                        }).current;
                    K.useEffect(function() {
                        if (i) {
                            var t = function(t) {
                                    if (!y.paused && d) {
                                        var n = t.target;
                                        d.contains(n) ? m.current = n : nx(m.current, {
                                            select: !0
                                        })
                                    }
                                },
                                n = function(t) {
                                    if (!y.paused && d) {
                                        var n = t.relatedTarget;
                                        null !== n && (d.contains(n) || nx(m.current, {
                                            select: !0
                                        }))
                                    }
                                };
                            document.addEventListener("focusin", t), document.addEventListener("focusout", n);
                            var r = new MutationObserver(function(t) {
                                var n = !0,
                                    r = !1,
                                    o = void 0;
                                if (document.activeElement === document.body) try {
                                    for (var a, i = t[Symbol.iterator](); !(n = (a = i.next()).done); n = !0) a.value.removedNodes.length > 0 && nx(d)
                                } catch (t) {
                                    r = !0, o = t
                                } finally {
                                    try {
                                        n || null == i.return || i.return()
                                    } finally {
                                        if (r) throw o
                                    }
                                }
                            });
                            return d && r.observe(d, {
                                    childList: !0,
                                    subtree: !0
                                }),
                                function() {
                                    document.removeEventListener("focusin", t), document.removeEventListener("focusout", n), r.disconnect()
                                }
                        }
                    }, [i, d, y.paused]), K.useEffect(function() {
                        if (d) {
                            nS.add(y);
                            var t = document.activeElement;
                            if (!d.contains(t)) {
                                var n = new CustomEvent(nm, ny);
                                d.addEventListener(nm, p), d.dispatchEvent(n), n.defaultPrevented || (! function(t) {
                                    var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                                        r = n.select,
                                        o = void 0 !== r && r,
                                        a = document.activeElement,
                                        i = !0,
                                        l = !1,
                                        u = void 0;
                                    try {
                                        for (var c, s = t[Symbol.iterator](); !(i = (c = s.next()).done); i = !0) {
                                            var d = c.value;
                                            if (nx(d, {
                                                    select: o
                                                }), document.activeElement !== a) return
                                        }
                                    } catch (t) {
                                        l = !0, u = t
                                    } finally {
                                        try {
                                            i || null == s.return || s.return()
                                        } finally {
                                            if (l) throw u
                                        }
                                    }
                                }(ng(d).filter(function(t) {
                                    return "A" !== t.tagName
                                }), {
                                    select: !0
                                }), document.activeElement === t && nx(d))
                            }
                            return function() {
                                d.removeEventListener(nm, p), setTimeout(function() {
                                    var n = new CustomEvent(nh, ny);
                                    d.addEventListener(nh, v), d.dispatchEvent(n), n.defaultPrevented || nx(null != t ? t : document.body, {
                                        select: !0
                                    }), d.removeEventListener(nh, v), nS.remove(y)
                                }, 0)
                            }
                        }
                    }, [d, p, v, y]);
                    var b = K.useCallback(function(t) {
                        if ((o || i) && !y.paused) {
                            var n = "Tab" === t.key && !t.altKey && !t.ctrlKey && !t.metaKey,
                                r = document.activeElement;
                            if (n && r) {
                                var a, l = t.currentTarget,
                                    u = tQ([nw(a = ng(l), l), nw(a.reverse(), l)], 2),
                                    c = u[0],
                                    s = u[1];
                                c && s ? t.shiftKey || r !== s ? t.shiftKey && r === c && (t.preventDefault(), o && nx(s, {
                                    select: !0
                                })) : (t.preventDefault(), o && nx(c, {
                                    select: !0
                                })) : r === l && t.preventDefault()
                            }
                        }
                    }, [o, i, y.paused]);
                    return (0, z.jsx)(np.div, tG(tY({
                        tabIndex: -1
                    }, c), {
                        ref: h,
                        onKeyDown: b
                    }))
                });

            function ng(t) {
                for (var n = [], r = document.createTreeWalker(t, NodeFilter.SHOW_ELEMENT, {
                        acceptNode: function(t) {
                            var n = "INPUT" === t.tagName && "hidden" === t.type;
                            return t.disabled || t.hidden || n ? NodeFilter.FILTER_SKIP : t.tabIndex >= 0 ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_SKIP
                        }
                    }); r.nextNode();) n.push(r.currentNode);
                return n
            }

            function nw(t, n) {
                var r = !0,
                    o = !1,
                    a = void 0;
                try {
                    for (var i, l = t[Symbol.iterator](); !(r = (i = l.next()).done); r = !0) {
                        var u = i.value;
                        if (! function(t, n) {
                                var r = n.upTo;
                                if ("hidden" === getComputedStyle(t).visibility) return !0;
                                for (; t && (void 0 === r || t !== r);) {
                                    if ("none" === getComputedStyle(t).display) return !0;
                                    t = t.parentElement
                                }
                                return !1
                            }(u, {
                                upTo: n
                            })) return u
                    }
                } catch (t) {
                    o = !0, a = t
                } finally {
                    try {
                        r || null == l.return || l.return()
                    } finally {
                        if (o) throw a
                    }
                }
            }

            function nx(t) {
                var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    r = n.select;
                if (t && t.focus) {
                    var o, a = document.activeElement;
                    t.focus({
                        preventScroll: !0
                    }), t !== a && t$(o = t, HTMLInputElement) && "select" in o && void 0 !== r && r && t.select()
                }
            }
            nb.displayName = "FocusScope";
            var nS = (n4 = [], {
                add: function(t) {
                    var n = n4[0];
                    t !== n && (null == n || n.pause()), (n4 = nO(n4, t)).unshift(t)
                },
                remove: function(t) {
                    var n;
                    null == (n = (n4 = nO(n4, t))[0]) || n.resume()
                }
            });

            function nO(t, n) {
                var r = tJ(t),
                    o = r.indexOf(n);
                return -1 !== o && r.splice(o, 1), r
            }

            function nj(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }
            var nE = Symbol("radix.slottable");

            function nC(t) {
                return K.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === nE
            }
            var nP = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                    var r, o, a, i, l, u = (o = r = "Primitive.".concat(n), (a = K.forwardRef(function(t, n) {
                            var r = t.children,
                                o = tZ(t, ["children"]);
                            if (K.isValidElement(r)) {
                                var a, i, l, u = (l = null == (a = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (i = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                    c = function(t, n) {
                                        var r = tY({}, n);
                                        for (var o in n) ! function(o) {
                                            var a = t[o],
                                                i = n[o];
                                            /^on[A-Z]/.test(o) ? a && i ? r[o] = function() {
                                                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                                i.apply(void 0, tJ(n)), a.apply(void 0, tJ(n))
                                            } : a && (r[o] = a) : "style" === o ? r[o] = tY({}, a, i) : "className" === o && (r[o] = [a, i].filter(Boolean).join(" "))
                                        }(o);
                                        return tY({}, t, r)
                                    }(o, r.props);
                                return r.type !== K.Fragment && (c.ref = n ? function() {
                                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                    return function(t) {
                                        var r = !1,
                                            o = n.map(function(n) {
                                                var o = nj(n, t);
                                                return r || "function" != typeof o || (r = !0), o
                                            });
                                        if (r) return function() {
                                            for (var t = 0; t < o.length; t++) {
                                                var r = o[t];
                                                "function" == typeof r ? r() : nj(n[t], null)
                                            }
                                        }
                                    }
                                }(n, u) : u), K.cloneElement(r, c)
                            }
                            return K.Children.count(r) > 1 ? K.Children.only(null) : null
                        })).displayName = "".concat(o, ".SlotClone"), i = a, (l = K.forwardRef(function(t, n) {
                            var r = t.children,
                                o = tZ(t, ["children"]),
                                a = K.Children.toArray(r),
                                l = a.find(nC);
                            if (l) {
                                var u = l.props.children,
                                    c = a.map(function(t) {
                                        return t === l ? K.Children.count(u) > 1 ? K.Children.only(null) : K.isValidElement(u) ? u.props.children : null : t
                                    });
                                return (0, z.jsx)(i, tG(tY({}, o), {
                                    ref: n,
                                    children: K.isValidElement(u) ? K.cloneElement(u, void 0, c) : null
                                }))
                            }
                            return (0, z.jsx)(i, tG(tY({}, o), {
                                ref: n,
                                children: r
                            }))
                        })).displayName = "".concat(r, ".Slot"), l),
                        c = K.forwardRef(function(t, r) {
                            var o = t.asChild,
                                a = tZ(t, ["asChild"]),
                                i = o ? u : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, z.jsx)(i, tG(tY({}, a), {
                                ref: r
                            }))
                        });
                    return c.displayName = "Primitive.".concat(n), tG(tY({}, t), tX({}, n, c))
                }, {}),
                nA = (null == (t9 = globalThis) ? void 0 : t9.document) ? K.useLayoutEffect : function() {},
                nT = K.forwardRef(function(t, n) {
                    var r, o, a = t.container,
                        i = tZ(t, ["container"]),
                        l = tQ(K.useState(!1), 2),
                        u = l[0],
                        c = l[1];
                    nA(function() {
                        return c(!0)
                    }, []);
                    var s = a || u && (null == (o = globalThis) || null == (r = o.document) ? void 0 : r.body);
                    return s ? tj().createPortal((0, z.jsx)(nP.div, tG(tY({}, i), {
                        ref: n
                    })), s) : null
                });
            nT.displayName = "Portal";
            var nR = new WeakMap,
                nN = new WeakMap,
                nI = {},
                nk = 0,
                nD = function(t) {
                    return t && (t.host || nD(t.parentNode))
                },
                nL = function(t, n, r, o) {
                    var a = (Array.isArray(t) ? t : [t]).map(function(t) {
                        if (n.contains(t)) return t;
                        var r = nD(t);
                        return r && n.contains(r) ? r : (console.error("aria-hidden", t, "in not contained inside", n, ". Doing nothing"), null)
                    }).filter(function(t) {
                        return !!t
                    });
                    nI[r] || (nI[r] = new WeakMap);
                    var i = nI[r],
                        l = [],
                        u = new Set,
                        c = new Set(a),
                        s = function(t) {
                            t && !u.has(t) && (u.add(t), s(t.parentNode))
                        };
                    a.forEach(s);
                    var d = function(t) {
                        t && !c.has(t) && Array.prototype.forEach.call(t.children, function(t) {
                            if (u.has(t)) d(t);
                            else try {
                                var n = t.getAttribute(o),
                                    a = null !== n && "false" !== n,
                                    c = (nR.get(t) || 0) + 1,
                                    s = (i.get(t) || 0) + 1;
                                nR.set(t, c), i.set(t, s), l.push(t), 1 === c && a && nN.set(t, !0), 1 === s && t.setAttribute(r, "true"), a || t.setAttribute(o, "true")
                            } catch (n) {
                                console.error("aria-hidden: cannot operate on ", t, n)
                            }
                        })
                    };
                    return d(n), u.clear(), nk++,
                        function() {
                            l.forEach(function(t) {
                                var n = nR.get(t) - 1,
                                    a = i.get(t) - 1;
                                nR.set(t, n), i.set(t, a), n || (nN.has(t) || t.removeAttribute(o), nN.delete(t)), a || t.removeAttribute(r)
                            }), --nk || (nR = new WeakMap, nR = new WeakMap, nN = new WeakMap, nI = {})
                        }
                },
                nM = function(t, n, r) {
                    void 0 === r && (r = "data-aria-hidden");
                    var o = Array.from(Array.isArray(t) ? t : [t]),
                        a = n || ("undefined" == typeof document ? null : (Array.isArray(t) ? t[0] : t).ownerDocument.body);
                    return a ? (o.push.apply(o, Array.from(a.querySelectorAll("[aria-live]"))), nL(o, a, r, "aria-hidden")) : function() {
                        return null
                    }
                },
                n_ = "right-scroll-bar-position",
                nF = "width-before-scroll-bar";

            function nU(t, n) {
                return "function" == typeof t ? t(n) : t && (t.current = n), t
            }
            var nW = "undefined" != typeof window ? K.useLayoutEffect : K.useEffect,
                nz = new WeakMap,
                nV = function(t) {
                    var n = t.sideCar,
                        r = tK(t, ["sideCar"]);
                    if (!n) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                    var o = n.read();
                    if (!o) throw Error("Sidecar medium not found");
                    return K.createElement(o, tH({}, r))
                };
            nV.isSideCarExport = !0;
            var nB = (void 0 === n5 && (n5 = {}), (void 0 === n6 && (n6 = function(t) {
                    return t
                }), n8 = [], n7 = !1, n9 = {
                    read: function() {
                        if (n7) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                        return n8.length ? n8[n8.length - 1] : null
                    },
                    useMedium: function(t) {
                        var n = n6(t, n7);
                        return n8.push(n),
                            function() {
                                n8 = n8.filter(function(t) {
                                    return t !== n
                                })
                            }
                    },
                    assignSyncMedium: function(t) {
                        for (n7 = !0; n8.length;) {
                            var n = n8;
                            n8 = [], n.forEach(t)
                        }
                        n8 = {
                            push: function(n) {
                                return t(n)
                            },
                            filter: function() {
                                return n8
                            }
                        }
                    },
                    assignMedium: function(t) {
                        n7 = !0;
                        var n = [];
                        if (n8.length) {
                            var r = n8;
                            n8 = [], r.forEach(t), n = n8
                        }
                        var o = function() {
                                var r = n;
                                n = [], r.forEach(t)
                            },
                            a = function() {
                                return Promise.resolve().then(o)
                            };
                        a(), n8 = {
                            push: function(t) {
                                n.push(t), a()
                            },
                            filter: function(t) {
                                return n = n.filter(t), n8
                            }
                        }
                    }
                }).options = tH({
                    async: !0,
                    ssr: !1
                }, n5), n9),
                nH = function() {},
                nK = K.forwardRef(function(t, n) {
                    var r, o, a, i, l = K.useRef(null),
                        u = K.useState({
                            onScrollCapture: nH,
                            onWheelCapture: nH,
                            onTouchMoveCapture: nH
                        }),
                        c = u[0],
                        s = u[1],
                        d = t.forwardProps,
                        f = t.children,
                        p = t.className,
                        v = t.removeScrollBar,
                        m = t.enabled,
                        h = t.shards,
                        y = t.sideCar,
                        b = t.noIsolation,
                        g = t.inert,
                        w = t.allowPinchZoom,
                        x = t.as,
                        S = t.gapMode,
                        O = tK(t, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        j = (r = [l, n], o = function(t) {
                            return r.forEach(function(n) {
                                return nU(n, t)
                            })
                        }, (a = (0, K.useState)(function() {
                            return {
                                value: null,
                                callback: o,
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
                        })[0]).callback = o, i = a.facade, nW(function() {
                            var t = nz.get(i);
                            if (t) {
                                var n = new Set(t),
                                    o = new Set(r),
                                    a = i.current;
                                n.forEach(function(t) {
                                    o.has(t) || nU(t, null)
                                }), o.forEach(function(t) {
                                    n.has(t) || nU(t, a)
                                })
                            }
                            nz.set(i, r)
                        }, [r]), i),
                        E = tH(tH({}, O), c);
                    return K.createElement(K.Fragment, null, m && K.createElement(y, {
                        sideCar: nB,
                        removeScrollBar: v,
                        shards: h,
                        noIsolation: b,
                        inert: g,
                        setCallbacks: s,
                        allowPinchZoom: !!w,
                        lockRef: l,
                        gapMode: S
                    }), d ? K.cloneElement(K.Children.only(f), tH(tH({}, E), {
                        ref: j
                    })) : K.createElement(void 0 === x ? "div" : x, tH({}, E, {
                        className: p,
                        ref: j
                    }), f))
                });
            nK.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, nK.classNames = {
                fullWidth: nF,
                zeroRight: n_
            };
            var nq = function() {
                    var t = 0,
                        n = null;
                    return {
                        add: function(o) {
                            var a, i;
                            0 == t && (n = function() {
                                if (!document) return null;
                                var t = document.createElement("style");
                                t.type = "text/css";
                                var n = r.nc;
                                return n && t.setAttribute("nonce", n), t
                            }()) && ((a = n).styleSheet ? a.styleSheet.cssText = o : a.appendChild(document.createTextNode(o)), i = n, (document.head || document.getElementsByTagName("head")[0]).appendChild(i)), t++
                        },
                        remove: function() {
                            --t || !n || (n.parentNode && n.parentNode.removeChild(n), n = null)
                        }
                    }
                },
                nX = function() {
                    var t, n = (t = nq(), function(n, r) {
                        K.useEffect(function() {
                            return t.add(n),
                                function() {
                                    t.remove()
                                }
                        }, [n && r])
                    });
                    return function(t) {
                        return n(t.styles, t.dynamic), null
                    }
                },
                n$ = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                nY = function(t) {
                    return parseInt(t || "", 10) || 0
                },
                nG = function(t) {
                    if (void 0 === t && (t = "margin"), "undefined" == typeof window) return n$;
                    var n, r, o, a, i, l = (n = t, o = (r = window.getComputedStyle(document.body))["padding" === n ? "paddingLeft" : "marginLeft"], a = r["padding" === n ? "paddingTop" : "marginTop"], i = r["padding" === n ? "paddingRight" : "marginRight"], [nY(o), nY(a), nY(i)]),
                        u = document.documentElement.clientWidth,
                        c = window.innerWidth;
                    return {
                        left: l[0],
                        top: l[1],
                        right: l[2],
                        gap: Math.max(0, c - u + l[2] - l[0])
                    }
                },
                nZ = nX(),
                nQ = "data-scroll-locked",
                nJ = function(t, n, r, o) {
                    var a = t.left,
                        i = t.top,
                        l = t.right,
                        u = t.gap;
                    return void 0 === r && (r = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(o, ";\n   padding-right: ").concat(u, "px ").concat(o, ";\n  }\n  body[").concat(nQ, "] {\n    overflow: hidden ").concat(o, ";\n    overscroll-behavior: contain;\n    ").concat([n && "position: relative ".concat(o, ";"), "margin" === r && "\n    padding-left: ".concat(a, "px;\n    padding-top: ").concat(i, "px;\n    padding-right: ").concat(l, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(u, "px ").concat(o, ";\n    "), "padding" === r && "padding-right: ".concat(u, "px ").concat(o, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(n_, " {\n    right: ").concat(u, "px ").concat(o, ";\n  }\n  \n  .").concat(nF, " {\n    margin-right: ").concat(u, "px ").concat(o, ";\n  }\n  \n  .").concat(n_, " .").concat(n_, " {\n    right: 0 ").concat(o, ";\n  }\n  \n  .").concat(nF, " .").concat(nF, " {\n    margin-right: 0 ").concat(o, ";\n  }\n  \n  body[").concat(nQ, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(u, "px;\n  }\n")
                },
                n0 = function() {
                    var t = parseInt(document.body.getAttribute(nQ) || "0", 10);
                    return isFinite(t) ? t : 0
                },
                n1 = function(t) {
                    var n = t.noRelative,
                        r = t.noImportant,
                        o = t.gapMode,
                        a = void 0 === o ? "margin" : o;
                    K.useEffect(function() {
                        return document.body.setAttribute(nQ, (n0() + 1).toString()),
                            function() {
                                var t = n0() - 1;
                                t <= 0 ? document.body.removeAttribute(nQ) : document.body.setAttribute(nQ, t.toString())
                            }
                    }, []);
                    var i = K.useMemo(function() {
                        return nG(a)
                    }, [a]);
                    return K.createElement(nZ, {
                        styles: nJ(i, !n, a, r ? "" : "!important")
                    })
                },
                n2 = !1;
            if ("undefined" != typeof window) try {
                var n3 = Object.defineProperty({}, "passive", {
                    get: function() {
                        return n2 = !0, !0
                    }
                });
                window.addEventListener("test", n3, n3), window.removeEventListener("test", n3, n3)
            } catch (t) {
                n2 = !1
            }
            var n4, n5, n6, n8, n7, n9, re, rt = !!n2 && {
                    passive: !1
                },
                rn = function(t, n) {
                    if (!t$(t, Element)) return !1;
                    var r = window.getComputedStyle(t);
                    return "hidden" !== r[n] && (r.overflowY !== r.overflowX || "TEXTAREA" === t.tagName || "visible" !== r[n])
                },
                rr = function(t, n) {
                    var r = n.ownerDocument,
                        o = n;
                    do {
                        if ("undefined" != typeof ShadowRoot && t$(o, ShadowRoot) && (o = o.host), ro(t, o)) {
                            var a = ra(t, o);
                            if (a[1] > a[2]) return !0
                        }
                        o = o.parentNode
                    } while (o && o !== r.body);
                    return !1
                },
                ro = function(t, n) {
                    return "v" === t ? rn(n, "overflowY") : rn(n, "overflowX")
                },
                ra = function(t, n) {
                    return "v" === t ? [n.scrollTop, n.scrollHeight, n.clientHeight] : [n.scrollLeft, n.scrollWidth, n.clientWidth]
                },
                ri = function(t, n, r, o, a) {
                    var i, l = (i = window.getComputedStyle(n).direction, "h" === t && "rtl" === i ? -1 : 1),
                        u = l * o,
                        c = r.target,
                        s = n.contains(c),
                        d = !1,
                        f = u > 0,
                        p = 0,
                        v = 0;
                    do {
                        var m = ra(t, c),
                            h = m[0],
                            y = m[1] - m[2] - l * h;
                        (h || y) && ro(t, c) && (p += y, v += h), c = t$(c, ShadowRoot) ? c.host : c.parentNode
                    } while (!s && c !== document.body || s && (n.contains(c) || n === c));
                    return (f && (a && 1 > Math.abs(p) || !a && u > p) || !f && (a && 1 > Math.abs(v) || !a && -u > v)) && (d = !0), d
                },
                rl = function(t) {
                    return "changedTouches" in t ? [t.changedTouches[0].clientX, t.changedTouches[0].clientY] : [0, 0]
                },
                ru = function(t) {
                    return [t.deltaX, t.deltaY]
                },
                rc = function(t) {
                    return t && "current" in t ? t.current : t
                },
                rs = 0,
                rd = [],
                rf = (re = function(t) {
                    var n = K.useRef([]),
                        r = K.useRef([0, 0]),
                        o = K.useRef(),
                        a = K.useState(rs++)[0],
                        i = K.useState(nX)[0],
                        l = K.useRef(t);
                    K.useEffect(function() {
                        l.current = t
                    }, [t]), K.useEffect(function() {
                        if (t.inert) {
                            document.body.classList.add("block-interactivity-".concat(a));
                            var n = (function(t, n, r) {
                                if (r || 2 == arguments.length)
                                    for (var o, a = 0, i = n.length; a < i; a++) !o && a in n || (o || (o = Array.prototype.slice.call(n, 0, a)), o[a] = n[a]);
                                return t.concat(o || Array.prototype.slice.call(n))
                            })([t.lockRef.current], (t.shards || []).map(rc), !0).filter(Boolean);
                            return n.forEach(function(t) {
                                    return t.classList.add("allow-interactivity-".concat(a))
                                }),
                                function() {
                                    document.body.classList.remove("block-interactivity-".concat(a)), n.forEach(function(t) {
                                        return t.classList.remove("allow-interactivity-".concat(a))
                                    })
                                }
                        }
                    }, [t.inert, t.lockRef.current, t.shards]);
                    var u = K.useCallback(function(t, n) {
                            if ("touches" in t && 2 === t.touches.length || "wheel" === t.type && t.ctrlKey) return !l.current.allowPinchZoom;
                            var a, i = rl(t),
                                u = r.current,
                                c = "deltaX" in t ? t.deltaX : u[0] - i[0],
                                s = "deltaY" in t ? t.deltaY : u[1] - i[1],
                                d = t.target,
                                f = Math.abs(c) > Math.abs(s) ? "h" : "v";
                            if ("touches" in t && "h" === f && "range" === d.type) return !1;
                            var p = rr(f, d);
                            if (!p) return !0;
                            if (p ? a = f : (a = "v" === f ? "h" : "v", p = rr(f, d)), !p) return !1;
                            if (!o.current && "changedTouches" in t && (c || s) && (o.current = a), !a) return !0;
                            var v = o.current || a;
                            return ri(v, n, t, "h" === v ? c : s, !0)
                        }, []),
                        c = K.useCallback(function(t) {
                            if (rd.length && rd[rd.length - 1] === i) {
                                var r = "deltaY" in t ? ru(t) : rl(t),
                                    o = n.current.filter(function(n) {
                                        var o;
                                        return n.name === t.type && (n.target === t.target || t.target === n.shadowParent) && (o = n.delta, o[0] === r[0] && o[1] === r[1])
                                    })[0];
                                if (o && o.should) t.cancelable && t.preventDefault();
                                else if (!o) {
                                    var a = (l.current.shards || []).map(rc).filter(Boolean).filter(function(n) {
                                        return n.contains(t.target)
                                    });
                                    (a.length > 0 ? u(t, a[0]) : !l.current.noIsolation) && t.cancelable && t.preventDefault()
                                }
                            }
                        }, []),
                        s = K.useCallback(function(t, r, o, a) {
                            var i = {
                                name: t,
                                delta: r,
                                target: o,
                                should: a,
                                shadowParent: function(t) {
                                    for (var n = null; null !== t;) t$(t, ShadowRoot) && (n = t.host, t = t.host), t = t.parentNode;
                                    return n
                                }(o)
                            };
                            n.current.push(i), setTimeout(function() {
                                n.current = n.current.filter(function(t) {
                                    return t !== i
                                })
                            }, 1)
                        }, []),
                        d = K.useCallback(function(t) {
                            r.current = rl(t), o.current = void 0
                        }, []),
                        f = K.useCallback(function(n) {
                            s(n.type, ru(n), n.target, u(n, t.lockRef.current))
                        }, []),
                        p = K.useCallback(function(n) {
                            s(n.type, rl(n), n.target, u(n, t.lockRef.current))
                        }, []);
                    K.useEffect(function() {
                        return rd.push(i), t.setCallbacks({
                                onScrollCapture: f,
                                onWheelCapture: f,
                                onTouchMoveCapture: p
                            }), document.addEventListener("wheel", c, rt), document.addEventListener("touchmove", c, rt), document.addEventListener("touchstart", d, rt),
                            function() {
                                rd = rd.filter(function(t) {
                                    return t !== i
                                }), document.removeEventListener("wheel", c, rt), document.removeEventListener("touchmove", c, rt), document.removeEventListener("touchstart", d, rt)
                            }
                    }, []);
                    var v = t.removeScrollBar,
                        m = t.inert;
                    return K.createElement(K.Fragment, null, m ? K.createElement(i, {
                        styles: "\n  .block-interactivity-".concat(a, " {pointer-events: none;}\n  .allow-interactivity-").concat(a, " {pointer-events: all;}\n")
                    }) : null, v ? K.createElement(n1, {
                        gapMode: t.gapMode
                    }) : null)
                }, nB.useMedium(re), nV),
                rp = K.forwardRef(function(t, n) {
                    return K.createElement(nK, tH({}, t, {
                        ref: n,
                        sideCar: rf
                    }))
                });

            function rv(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }
            rp.classNames = nK.classNames;
            var rm = (null == (a7 = globalThis) ? void 0 : a7.document) ? K.useLayoutEffect : function() {},
                rh = K[" useId ".trim().toString()] || function() {},
                ry = 0;

            function rb(t) {
                var n, r = (n = K.useState(rh()), function(t) {
                        if (Array.isArray(t)) return t
                    }(n) || function(t, n) {
                        var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                        if (null != a) {
                            var i = [],
                                l = !0,
                                u = !1;
                            try {
                                for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), i.length !== n); l = !0);
                            } catch (t) {
                                u = !0, o = t
                            } finally {
                                try {
                                    l || null == a.return || a.return()
                                } finally {
                                    if (u) throw o
                                }
                            }
                            return i
                        }
                    }(n, 2) || function(t, n) {
                        if (t) {
                            if ("string" == typeof t) return rv(t, 2);
                            var r = Object.prototype.toString.call(t).slice(8, -1);
                            if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rv(t, n)
                        }
                    }(n, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    o = r[0],
                    a = r[1];
                return rm(function() {
                    t || a(function(t) {
                        return null != t ? t : String(ry++)
                    })
                }, [t]), t || (o ? "radix-".concat(o) : "")
            }

            function rg(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function rw(t, n, r, o, a, i, l) {
                try {
                    var u = t[i](l),
                        c = u.value
                } catch (t) {
                    r(t);
                    return
                }
                u.done ? n(c) : Promise.resolve(c).then(o, a)
            }

            function rx(t) {
                return function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(o, a) {
                        var i = t.apply(n, r);

                        function l(t) {
                            rw(i, o, a, l, u, "next", t)
                        }

                        function u(t) {
                            rw(i, o, a, l, u, "throw", t)
                        }
                        l(void 0)
                    })
                }
            }

            function rS(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function rO(t, n) {
                return null != n && "undefined" != typeof Symbol && n[Symbol.hasInstance] ? !!n[Symbol.hasInstance](t) : t instanceof n
            }

            function rj(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        rS(t, n, r[n])
                    })
                }
                return t
            }

            function rE(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function rC(t, n) {
                if (null == t) return {};
                var r, o, a = function(t, n) {
                    if (null == t) return {};
                    var r, o, a = {},
                        i = Object.keys(t);
                    for (o = 0; o < i.length; o++) r = i[o], n.indexOf(r) >= 0 || (a[r] = t[r]);
                    return a
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(t);
                    for (o = 0; o < i.length; o++) r = i[o], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (a[r] = t[r])
                }
                return a
            }

            function rP(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var i = [],
                            l = !0,
                            u = !1;
                        try {
                            for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            u = !0, o = t
                        } finally {
                            try {
                                l || null == a.return || a.return()
                            } finally {
                                if (u) throw o
                            }
                        }
                        return i
                    }
                }(t, n) || rR(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rA(t) {
                return function(t) {
                    if (Array.isArray(t)) return rg(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || rR(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rT(t) {
                return t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t
            }

            function rR(t, n) {
                if (t) {
                    if ("string" == typeof t) return rg(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rg(t, n)
                }
            }

            function rN(t, n) {
                var r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return l.next = u(0), l.throw = u(1), l.return = u(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                    return this
                }), l;

                function u(u) {
                    return function(c) {
                        var s = [u, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                            if (r = 1, o && (a = 2 & s[0] ? o.return : s[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, s[1])).done) return a;
                            switch (o = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                case 0:
                                case 1:
                                    a = s;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, o = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                        i.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && i.label < a[1]) {
                                        i.label = a[1], a = s;
                                        break
                                    }
                                    if (a && i.label < a[2]) {
                                        i.label = a[2], i.ops.push(s);
                                        break
                                    }
                                    a[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            s = n.call(t, i)
                        } catch (t) {
                            s = [6, t], o = 0
                        } finally {
                            r = a = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var rI = ["top", "right", "bottom", "left"],
                rk = Math.min,
                rD = Math.max,
                rL = Math.round,
                rM = Math.floor,
                r_ = function(t) {
                    return {
                        x: t,
                        y: t
                    }
                },
                rF = {
                    left: "right",
                    right: "left",
                    bottom: "top",
                    top: "bottom"
                };

            function rU(t, n) {
                return "function" == typeof t ? t(n) : t
            }

            function rW(t) {
                return t.split("-")[0]
            }

            function rz(t) {
                return t.split("-")[1]
            }

            function rV(t) {
                return "x" === t ? "y" : "x"
            }

            function rB(t) {
                return "y" === t ? "height" : "width"
            }

            function rH(t) {
                var n = t[0];
                return "t" === n || "b" === n ? "y" : "x"
            }

            function rK(t) {
                return t.includes("start") ? t.replace("start", "end") : t.replace("end", "start")
            }
            var rq = ["left", "right"],
                rX = ["right", "left"],
                r$ = ["top", "bottom"],
                rY = ["bottom", "top"];

            function rG(t) {
                var n = rW(t);
                return rF[n] + t.slice(n.length)
            }

            function rZ(t) {
                var n, r, o, a;
                return "number" != typeof t ? {
                    top: null != (n = t.top) ? n : 0,
                    right: null != (r = t.right) ? r : 0,
                    bottom: null != (o = t.bottom) ? o : 0,
                    left: null != (a = t.left) ? a : 0
                } : {
                    top: t,
                    right: t,
                    bottom: t,
                    left: t
                }
            }

            function rQ(t) {
                var n = t.x,
                    r = t.y,
                    o = t.width,
                    a = t.height;
                return {
                    width: o,
                    height: a,
                    top: r,
                    left: n,
                    right: n + o,
                    bottom: r + a,
                    x: n,
                    y: r
                }
            }

            function rJ(t, n, r) {
                var o, a = t.reference,
                    i = t.floating,
                    l = rH(n),
                    u = rV(rH(n)),
                    c = rB(u),
                    s = rW(n),
                    d = "y" === l,
                    f = a.x + a.width / 2 - i.width / 2,
                    p = a.y + a.height / 2 - i.height / 2,
                    v = a[c] / 2 - i[c] / 2;
                switch (s) {
                    case "top":
                        o = {
                            x: f,
                            y: a.y - i.height
                        };
                        break;
                    case "bottom":
                        o = {
                            x: f,
                            y: a.y + a.height
                        };
                        break;
                    case "right":
                        o = {
                            x: a.x + a.width,
                            y: p
                        };
                        break;
                    case "left":
                        o = {
                            x: a.x - i.width,
                            y: p
                        };
                        break;
                    default:
                        o = {
                            x: a.x,
                            y: a.y
                        }
                }
                switch (rz(n)) {
                    case "start":
                        o[u] -= v * (r && d ? -1 : 1);
                        break;
                    case "end":
                        o[u] += v * (r && d ? -1 : 1)
                }
                return o
            }

            function r0(t, n) {
                return rx(function() {
                    var r, o, a, i, l, u, c, s, d, f, p, v, m, h, y, b, g, w, x, S, O, j, E, C, P, A, T, R, N, I, k;
                    return rN(this, function(D) {
                        switch (D.label) {
                            case 0:
                                return void 0 === n && (n = {}), o = t.x, a = t.y, i = t.platform, l = t.rects, u = t.elements, c = t.strategy, f = void 0 === (d = (s = rU(n, t)).boundary) ? "clippingAncestors" : d, v = void 0 === (p = s.rootBoundary) ? "viewport" : p, h = void 0 === (m = s.elementContext) ? "floating" : m, b = void 0 !== (y = s.altBoundary) && y, w = rZ(void 0 === (g = s.padding) ? 0 : g), x = u[b ? "floating" === h ? "reference" : "floating" : h], P = i.getClippingRect, A = {}, R = null, [4, null == i.isElement ? void 0 : i.isElement(x)];
                            case 1:
                                if (!(R == (r = D.sent()) || r)) return [3, 2];
                                return T = x, [3, 5];
                            case 2:
                                if (N = x.contextElement) return [3, 4];
                                return [4, null == i.getDocumentElement ? void 0 : i.getDocumentElement(u.floating)];
                            case 3:
                                N = D.sent(), D.label = 4;
                            case 4:
                                T = N, D.label = 5;
                            case 5:
                                return [4, P.apply(i, [(A.element = T, A.boundary = f, A.rootBoundary = v, A.strategy = c, A)])];
                            case 6:
                                return S = rQ.apply(void 0, [D.sent()]), O = "floating" === h ? {
                                    x: o,
                                    y: a,
                                    width: l.floating.width,
                                    height: l.floating.height
                                } : l.reference, [4, null == i.getOffsetParent ? void 0 : i.getOffsetParent(u.floating)];
                            case 7:
                                return j = D.sent(), [4, null == i.isElement ? void 0 : i.isElement(j)];
                            case 8:
                                if (!(I = D.sent())) return [3, 10];
                                return [4, null == i.getScale ? void 0 : i.getScale(j)];
                            case 9:
                                I = D.sent(), D.label = 10;
                            case 10:
                                if (E = I || {
                                        x: 1,
                                        y: 1
                                    }, !i.convertOffsetParentRelativeRectToViewportRelativeRect) return [3, 12];
                                return [4, i.convertOffsetParentRelativeRectToViewportRelativeRect({
                                    elements: u,
                                    rect: O,
                                    offsetParent: j,
                                    strategy: c
                                })];
                            case 11:
                                return k = D.sent(), [3, 13];
                            case 12:
                                k = O, D.label = 13;
                            case 13:
                                return C = rQ.apply(void 0, [k]), [2, {
                                    top: (S.top - C.top + w.top) / E.y,
                                    bottom: (C.bottom - S.bottom + w.bottom) / E.y,
                                    left: (S.left - C.left + w.left) / E.x,
                                    right: (C.right - S.right + w.right) / E.x
                                }]
                        }
                    })
                })()
            }

            function r1(t, n) {
                return {
                    top: t.top - n.height,
                    right: t.right - n.width,
                    bottom: t.bottom - n.height,
                    left: t.left - n.width
                }
            }

            function r2(t) {
                return rI.some(function(n) {
                    return t[n] >= 0
                })
            }
            var r3 = new Set(["left", "top"]);

            function r4() {
                return "undefined" != typeof window
            }

            function r5(t) {
                return r7(t) ? (t.nodeName || "").toLowerCase() : "#document"
            }

            function r6(t) {
                var n;
                return (null == t || null == (n = t.ownerDocument) ? void 0 : n.defaultView) || window
            }

            function r8(t) {
                var n;
                return null == (n = (r7(t) ? t.ownerDocument : t.document) || window.document) ? void 0 : n.documentElement
            }

            function r7(t) {
                return !!r4() && (rO(t, Node) || rO(t, r6(t).Node))
            }

            function r9(t) {
                return !!r4() && (rO(t, Element) || rO(t, r6(t).Element))
            }

            function oe(t) {
                return !!r4() && (rO(t, HTMLElement) || rO(t, r6(t).HTMLElement))
            }

            function ot(t) {
                return !(!r4() || "undefined" == typeof ShadowRoot) && (rO(t, ShadowRoot) || rO(t, r6(t).ShadowRoot))
            }

            function on(t) {
                var n = os(t),
                    r = n.overflow,
                    o = n.overflowX,
                    a = n.overflowY,
                    i = n.display;
                return /auto|scroll|overlay|hidden|clip/.test(r + a + o) && "inline" !== i && "contents" !== i
            }

            function or(t) {
                try {
                    if (t.matches(":popover-open")) return !0
                } catch (t) {}
                try {
                    return t.matches(":modal")
                } catch (t) {
                    return !1
                }
            }
            var oo = /transform|translate|scale|rotate|perspective|filter/,
                oa = /paint|layout|strict|content/,
                oi = function(t) {
                    return !!t && "none" !== t
                };

            function ol(t) {
                var n = r9(t) ? os(t) : t;
                return oi(n.transform) || oi(n.translate) || oi(n.scale) || oi(n.rotate) || oi(n.perspective) || !ou() && (oi(n.backdropFilter) || oi(n.filter)) || oo.test(n.willChange || "") || oa.test(n.contain || "")
            }

            function ou() {
                return null == a9 && (a9 = "undefined" != typeof CSS && CSS.supports && CSS.supports("-webkit-backdrop-filter", "none")), a9
            }

            function oc(t) {
                return /^(html|body|#document)$/.test(r5(t))
            }

            function os(t) {
                return r6(t).getComputedStyle(t)
            }

            function od(t) {
                return r9(t) ? {
                    scrollLeft: t.scrollLeft,
                    scrollTop: t.scrollTop
                } : {
                    scrollLeft: t.scrollX,
                    scrollTop: t.scrollY
                }
            }

            function of(t) {
                if ("html" === r5(t)) return t;
                var n = t.assignedSlot || t.parentNode || ot(t) && t.host || r8(t);
                return ot(n) ? n.host : n
            }

            function op(t, n, r) {
                void 0 === n && (n = []), void 0 === r && (r = !0);
                var o, a = function t(n) {
                        var r = of(n);
                        return oc(r) ? (n.ownerDocument || n).body : oe(r) && on(r) ? r : t(r)
                    }(t),
                    i = a === (null == (o = t.ownerDocument) ? void 0 : o.body),
                    l = r6(a);
                if (i) {
                    var u = ov(l);
                    return n.concat(l, l.visualViewport || [], on(a) ? a : [], u && r ? op(u) : [])
                }
                return n.concat(a, op(a, [], r))
            }

            function ov(t) {
                return t.parent && Object.getPrototypeOf(t.parent) ? t.frameElement : null
            }

            function om(t) {
                var n = os(t),
                    r = parseFloat(n.width) || 0,
                    o = parseFloat(n.height) || 0,
                    a = oe(t),
                    i = a ? t.offsetWidth : r,
                    l = a ? t.offsetHeight : o,
                    u = rL(r) !== i || rL(o) !== l;
                return u && (r = i, o = l), {
                    width: r,
                    height: o,
                    $: u
                }
            }

            function oh(t) {
                return r9(t) ? t : t.contextElement
            }

            function oy(t) {
                var n = oh(t);
                if (!oe(n)) return r_(1);
                var r = n.getBoundingClientRect(),
                    o = om(n),
                    a = o.width,
                    i = o.height,
                    l = o.$,
                    u = (l ? rL(r.width) : r.width) / a,
                    c = (l ? rL(r.height) : r.height) / i;
                return u && Number.isFinite(u) || (u = 1), c && Number.isFinite(c) || (c = 1), {
                    x: u,
                    y: c
                }
            }
            var ob = r_(0);

            function og(t) {
                var n = r6(t);
                return ou() && n.visualViewport ? {
                    x: n.visualViewport.offsetLeft,
                    y: n.visualViewport.offsetTop
                } : ob
            }

            function ow(t, n, r, o) {
                void 0 === n && (n = !1), void 0 === r && (r = !1);
                var a, i = t.getBoundingClientRect(),
                    l = oh(t),
                    u = r_(1);
                n && (o ? r9(o) && (u = oy(o)) : u = oy(t));
                var c = (void 0 === (a = r) && (a = !1), !(!o || a && o !== r6(l)) && a) ? og(l) : r_(0),
                    s = (i.left + c.x) / u.x,
                    d = (i.top + c.y) / u.y,
                    f = i.width / u.x,
                    p = i.height / u.y;
                if (l)
                    for (var v = r6(l), m = o && r9(o) ? r6(o) : o, h = v, y = ov(h); y && o && m !== h;) {
                        var b = oy(y),
                            g = y.getBoundingClientRect(),
                            w = os(y),
                            x = g.left + (y.clientLeft + parseFloat(w.paddingLeft)) * b.x,
                            S = g.top + (y.clientTop + parseFloat(w.paddingTop)) * b.y;
                        s *= b.x, d *= b.y, f *= b.x, p *= b.y, s += x, d += S, y = ov(h = r6(y))
                    }
                return rQ({
                    width: f,
                    height: p,
                    x: s,
                    y: d
                })
            }

            function ox(t, n) {
                var r = od(t).scrollLeft;
                return n ? n.left + r : ow(r8(t)).left + r
            }

            function oS(t, n, r) {
                void 0 === r && (r = !1);
                var o = t.getBoundingClientRect();
                return {
                    x: o.left + n.scrollLeft - (r ? 0 : ox(t, o)),
                    y: o.top + n.scrollTop
                }
            }
            var oO = new Set(["absolute", "fixed"]);

            function oj(t, n, r) {
                if ("viewport" === n) o = function(t, n) {
                    var r = r6(t),
                        o = r8(t),
                        a = r.visualViewport,
                        i = o.clientWidth,
                        l = o.clientHeight,
                        u = 0,
                        c = 0;
                    if (a) {
                        i = a.width, l = a.height;
                        var s = ou();
                        (!s || s && "fixed" === n) && (u = a.offsetLeft, c = a.offsetTop)
                    }
                    return {
                        width: i,
                        height: l,
                        x: u,
                        y: c
                    }
                }(t, r);
                else if ("document" === n) a = r8(t), i = r8(a), l = od(a), u = a.ownerDocument.body, c = rD(i.scrollWidth, i.clientWidth, u.scrollWidth, u.clientWidth), s = rD(i.scrollHeight, i.clientHeight, u.scrollHeight, u.clientHeight), d = -l.scrollLeft + ox(a), f = -l.scrollTop, "rtl" === os(u).direction && (d += rD(i.clientWidth, u.clientWidth) - c), o = {
                    width: c,
                    height: s,
                    x: d,
                    y: f
                };
                else if (r9(n)) v = (p = ow(n, !0, "fixed" === r)).top + n.clientTop, m = p.left + n.clientLeft, h = oe(n) ? oy(n) : r_(1), o = {
                    width: n.clientWidth * h.x,
                    height: n.clientHeight * h.y,
                    x: m * h.x,
                    y: v * h.y
                };
                else {
                    var o, a, i, l, u, c, s, d, f, p, v, m, h, y = og(t);
                    o = {
                        x: n.x - y.x,
                        y: n.y - y.y,
                        width: n.width,
                        height: n.height
                    }
                }
                return rQ(o)
            }

            function oE(t, n, r) {
                var o = oe(n),
                    a = r8(n),
                    i = "fixed" === r,
                    l = ow(t, !0, i, n),
                    u = {
                        scrollLeft: 0,
                        scrollTop: 0
                    },
                    c = r_(0);
                if (o || !o && !i)
                    if (("body" !== r5(n) || on(a)) && (u = od(n)), o) {
                        var s = ow(n, !0, i, n);
                        c.x = s.x + n.clientLeft, c.y = s.y + n.clientTop
                    } else a && (c.x = ox(a));
                i && !o && a && (c.x = ox(a));
                var d = !a || o || i ? r_(0) : oS(a, u);
                return {
                    x: l.left + u.scrollLeft - c.x - d.x,
                    y: l.top + u.scrollTop - c.y - d.y,
                    width: l.width,
                    height: l.height
                }
            }

            function oC(t) {
                return "static" === os(t).position
            }

            function oP(t, n) {
                if (!oe(t) || "fixed" === os(t).position) return null;
                if (n) return n(t);
                var r = t.offsetParent;
                return r8(t) === r && (r = r.ownerDocument.body), r
            }

            function oA(t, n) {
                var r, o = r6(t);
                if (or(t)) return o;
                if (!oe(t)) {
                    for (var a = of(t); a && !oc(a);) {
                        if (r9(a) && !oC(a)) return a;
                        a = of(a)
                    }
                    return o
                }
                for (var i = oP(t, n); i && (r = i, /^(table|td|th)$/.test(r5(r))) && oC(i);) i = oP(i, n);
                return i && oc(i) && oC(i) && !ol(i) ? o : i || function(t) {
                    for (var n = of(t); oe(n) && !oc(n);) {
                        if (ol(n)) return n;
                        if (or(n)) break;
                        n = of(n)
                    }
                    return null
                }(t) || o
            }
            var oT = {
                convertOffsetParentRelativeRectToViewportRelativeRect: function(t) {
                    var n = t.elements,
                        r = t.rect,
                        o = t.offsetParent,
                        a = "fixed" === t.strategy,
                        i = r8(o),
                        l = !!n && or(n.floating);
                    if (o === i || l && a) return r;
                    var u = {
                            scrollLeft: 0,
                            scrollTop: 0
                        },
                        c = r_(1),
                        s = r_(0),
                        d = oe(o);
                    if ((d || !d && !a) && (("body" !== r5(o) || on(i)) && (u = od(o)), oe(o))) {
                        var f = ow(o);
                        c = oy(o), s.x = f.x + o.clientLeft, s.y = f.y + o.clientTop
                    }
                    var p = !i || d || a ? r_(0) : oS(i, u, !0);
                    return {
                        width: r.width * c.x,
                        height: r.height * c.y,
                        x: r.x * c.x - u.scrollLeft * c.x + s.x + p.x,
                        y: r.y * c.y - u.scrollTop * c.y + s.y + p.y
                    }
                },
                getDocumentElement: r8,
                getClippingRect: function(t) {
                    var n = t.element,
                        r = t.boundary,
                        o = t.rootBoundary,
                        a = t.strategy,
                        i = rA("clippingAncestors" === r ? or(n) ? [] : function(t, n) {
                            var r = n.get(t);
                            if (r) return r;
                            for (var o = op(t, [], !1).filter(function(t) {
                                    return r9(t) && "body" !== r5(t)
                                }), a = null, i = "fixed" === os(t).position, l = i ? of(t) : t; r9(l) && !oc(l);) {
                                var u = os(l),
                                    c = ol(l);
                                c || "fixed" !== u.position || (a = null), (i ? !c && !a : !c && "static" === u.position && a && oO.has(a.position) || on(l) && !c && function t(n, r) {
                                    var o = of(n);
                                    return !(o === r || !r9(o) || oc(o)) && ("fixed" === os(o).position || t(o, r))
                                }(t, l)) ? o = o.filter(function(t) {
                                    return t !== l
                                }) : a = u, l = of(l)
                            }
                            return n.set(t, o), o
                        }(n, this._c) : [].concat(r)).concat([o]),
                        l = i[0],
                        u = i.reduce(function(t, r) {
                            var o = oj(n, r, a);
                            return t.top = rD(o.top, t.top), t.right = rk(o.right, t.right), t.bottom = rk(o.bottom, t.bottom), t.left = rD(o.left, t.left), t
                        }, oj(n, l, a));
                    return {
                        width: u.right - u.left,
                        height: u.bottom - u.top,
                        x: u.left,
                        y: u.top
                    }
                },
                getOffsetParent: oA,
                getElementRects: function(t) {
                    return rx(function() {
                        var n, r, o, a;
                        return rN(this, function(i) {
                            switch (i.label) {
                                case 0:
                                    return n = this.getOffsetParent || oA, [4, (0, this.getDimensions)(t.floating)];
                                case 1:
                                    return r = i.sent(), o = {}, a = [t.reference], [4, n(t.floating)];
                                case 2:
                                    return [2, (o.reference = oE.apply(void 0, a.concat([i.sent(), t.strategy])), o.floating = {
                                        x: 0,
                                        y: 0,
                                        width: r.width,
                                        height: r.height
                                    }, o)]
                            }
                        })
                    }).call(this)
                },
                getClientRects: function(t) {
                    return Array.from(t.getClientRects())
                },
                getDimensions: function(t) {
                    var n = om(t);
                    return {
                        width: n.width,
                        height: n.height
                    }
                },
                getScale: oy,
                isElement: r9,
                isRTL: function(t) {
                    return "rtl" === os(t).direction
                }
            };

            function oR(t, n) {
                return t.x === n.x && t.y === n.y && t.width === n.width && t.height === n.height
            }

            function oN(t, n, r, o) {
                void 0 === o && (o = {});
                var a = o.ancestorScroll,
                    i = void 0 === a || a,
                    l = o.ancestorResize,
                    u = void 0 === l || l,
                    c = o.elementResize,
                    s = void 0 === c ? "function" == typeof ResizeObserver : c,
                    d = o.layoutShift,
                    f = void 0 === d ? "function" == typeof IntersectionObserver : d,
                    p = o.animationFrame,
                    v = void 0 !== p && p,
                    m = oh(t),
                    h = i || u ? rA(m ? op(m) : []).concat(rA(op(n))) : [];
                h.forEach(function(t) {
                    i && t.addEventListener("scroll", r, {
                        passive: !0
                    }), u && t.addEventListener("resize", r)
                });
                var y, b = m && f ? function(t, n) {
                        var r, o = null,
                            a = r8(t);

                        function i() {
                            var t;
                            clearTimeout(r), null == (t = o) || t.disconnect(), o = null
                        }
                        return function l(u, c) {
                            void 0 === u && (u = !1), void 0 === c && (c = 1), i();
                            var s = t.getBoundingClientRect(),
                                d = s.left,
                                f = s.top,
                                p = s.width,
                                v = s.height;
                            if (u || n(), p && v) {
                                var m = {
                                        rootMargin: -rM(f) + "px " + -rM(a.clientWidth - (d + p)) + "px " + -rM(a.clientHeight - (f + v)) + "px " + -rM(d) + "px",
                                        threshold: rD(0, rk(1, c)) || 1
                                    },
                                    h = !0;
                                try {
                                    o = new IntersectionObserver(y, rE(rj({}, m), {
                                        root: a.ownerDocument
                                    }))
                                } catch (t) {
                                    o = new IntersectionObserver(y, m)
                                }
                                o.observe(t)
                            }

                            function y(n) {
                                var o = n[0].intersectionRatio;
                                if (o !== c) {
                                    if (!h) return l();
                                    o ? l(!1, o) : r = setTimeout(function() {
                                        l(!1, 1e-7)
                                    }, 1e3)
                                }
                                1 !== o || oR(s, t.getBoundingClientRect()) || l(), h = !1
                            }
                        }(!0), i
                    }(m, r) : null,
                    g = -1,
                    w = null;
                s && (w = new ResizeObserver(function(t) {
                    var o = rP(t, 1)[0];
                    o && o.target === m && w && (w.unobserve(n), cancelAnimationFrame(g), g = requestAnimationFrame(function() {
                        var t;
                        null == (t = w) || t.observe(n)
                    })), r()
                }), m && !v && w.observe(m), w.observe(n));
                var x = v ? ow(t) : null;
                return v && function n() {
                        var o = ow(t);
                        x && !oR(x, o) && r(), x = o, y = requestAnimationFrame(n)
                    }(), r(),
                    function() {
                        var t;
                        h.forEach(function(t) {
                            i && t.removeEventListener("scroll", r), u && t.removeEventListener("resize", r)
                        }), null == b || b(), null == (t = w) || t.disconnect(), w = null, v && cancelAnimationFrame(y)
                    }
            }
            var oI = function(t) {
                    return {
                        name: "arrow",
                        options: t,
                        fn: function(n) {
                            return rx(function() {
                                var r, o, a, i, l, u, c, s, d, f, p, v, m, h, y, b, g, w, x, S, O, j, E, C, P, A, T, R, N, I, k, D, L, M, _, F, U;
                                return rN(this, function(W) {
                                    switch (W.label) {
                                        case 0:
                                            if (r = n.x, o = n.y, a = n.placement, i = n.rects, l = n.platform, u = n.elements, c = n.middlewareData, d = (s = rU(t, n) || {}).element, p = void 0 === (f = s.padding) ? 0 : f, null == d) return [2, {}];
                                            return v = rZ(p), m = {
                                                x: r,
                                                y: o
                                            }, y = rB(h = rV(rH(a))), [4, l.getDimensions(d)];
                                        case 1:
                                            return b = W.sent(), w = (g = "y" === h) ? "top" : "left", x = g ? "bottom" : "right", S = g ? "clientHeight" : "clientWidth", O = i.reference[y] + i.reference[h] - m[h] - i.floating[y], j = m[h] - i.reference[h], [4, null == l.getOffsetParent ? void 0 : l.getOffsetParent(d)];
                                        case 2:
                                            if (!(P = C = (E = W.sent()) ? E[S] : 0)) return [3, 4];
                                            return [4, null == l.isElement ? void 0 : l.isElement(E)];
                                        case 3:
                                            P = W.sent(), W.label = 4;
                                        case 4:
                                            return P || (C = u.floating[S] || i.floating[y]), A = O / 2 - j / 2, T = C / 2 - b[y] / 2 - 1, R = rk(v[w], T), N = rk(v[x], T), I = R, k = C - b[y] - N, L = rD(I, rk(D = C / 2 - b[y] / 2 + A, k)), _ = (M = !c.arrow && null != rz(a) && D !== L && i.reference[y] / 2 - (D < I ? R : N) - b[y] / 2 < 0) ? D < I ? D - I : D - k : 0, [2, (rS(U = {}, h, m[h] + _), rS(U, "data", rj((rS(F = {}, h, L), rS(F, "centerOffset", D - L - _), F), M && {
                                                alignmentOffset: _
                                            })), rS(U, "reset", M), U)]
                                    }
                                })
                            })()
                        }
                    }
                },
                ok = function(t, n, r) {
                    var o, a = new Map,
                        i = rj({
                            platform: oT
                        }, r),
                        l = rE(rj({}, i.platform), {
                            _c: a
                        });
                    return o = rE(rj({}, i), {
                        platform: l
                    }), rx(function() {
                        var r, a, i, l, u, c, s, d, f, p, v, m, h, y, b, g, w, x, S, O, j, E, C, P, A, T;
                        return rN(this, function(R) {
                            switch (R.label) {
                                case 0:
                                    return a = void 0 === (r = o.placement) ? "bottom" : r, l = void 0 === (i = o.strategy) ? "absolute" : i, c = void 0 === (u = o.middleware) ? [] : u, s = o.platform, d = c.filter(Boolean), [4, null == s.isRTL ? void 0 : s.isRTL(n)];
                                case 1:
                                    return f = R.sent(), [4, s.getElementRects({
                                        reference: t,
                                        floating: n,
                                        strategy: l
                                    })];
                                case 2:
                                    m = (v = rJ(p = R.sent(), a, f)).x, h = v.y, y = a, b = {}, g = 0, w = 0, R.label = 3;
                                case 3:
                                    if (!(w < d.length)) return [3, 12];
                                    return S = (x = d[w]).name, [4, (0, x.fn)({
                                        x: m,
                                        y: h,
                                        initialPlacement: a,
                                        placement: y,
                                        strategy: l,
                                        middlewareData: b,
                                        rects: p,
                                        platform: s,
                                        elements: {
                                            reference: t,
                                            floating: n
                                        }
                                    })];
                                case 4:
                                    if (j = (O = R.sent()).x, E = O.y, C = O.data, P = O.reset, m = null != j ? j : m, h = null != E ? E : h, b = rE(rj({}, b), rS({}, S, rj({}, b[S], C))), !(P && g <= 50)) return [3, 10];
                                    if (g++, "object" != (void 0 === P ? "undefined" : rT(P))) return [3, 9];
                                    if (P.placement && (y = P.placement), !P.rects) return [3, 8];
                                    if (!0 !== P.rects) return [3, 6];
                                    return [4, s.getElementRects({
                                        reference: t,
                                        floating: n,
                                        strategy: l
                                    })];
                                case 5:
                                    return T = R.sent(), [3, 7];
                                case 6:
                                    T = P.rects, R.label = 7;
                                case 7:
                                    p = T, R.label = 8;
                                case 8:
                                    m = (A = rJ(p, y, f)).x, h = A.y, R.label = 9;
                                case 9:
                                    w = -1, R.label = 10;
                                case 10:
                                    R.label = 11;
                                case 11:
                                    return w++, [3, 3];
                                case 12:
                                    return [2, {
                                        x: m,
                                        y: h,
                                        placement: y,
                                        strategy: l,
                                        middlewareData: b
                                    }]
                            }
                        })
                    })()
                },
                oD = "undefined" != typeof document ? K.useLayoutEffect : function() {};

            function oL(t, n) {
                if (t === n) return !0;
                if ((void 0 === t ? "undefined" : rT(t)) != (void 0 === n ? "undefined" : rT(n))) return !1;
                if ("function" == typeof t && t.toString() === n.toString()) return !0;
                if (t && n && "object" == (void 0 === t ? "undefined" : rT(t))) {
                    if (Array.isArray(t)) {
                        if ((r = t.length) !== n.length) return !1;
                        for (o = r; 0 != o--;)
                            if (!oL(t[o], n[o])) return !1;
                        return !0
                    }
                    if ((r = (a = Object.keys(t)).length) !== Object.keys(n).length) return !1;
                    for (o = r; 0 != o--;)
                        if (!({}).hasOwnProperty.call(n, a[o])) return !1;
                    for (o = r; 0 != o--;) {
                        var r, o, a, i = a[o];
                        if (("_owner" !== i || !t.$$typeof) && !oL(t[i], n[i])) return !1
                    }
                    return !0
                }
                return t != t && n != n
            }

            function oM(t) {
                return "undefined" == typeof window ? 1 : (t.ownerDocument.defaultView || window).devicePixelRatio || 1
            }

            function o_(t, n) {
                var r = oM(t);
                return Math.round(n * r) / r
            }

            function oF(t) {
                var n = K.useRef(t);
                return oD(function() {
                    n.current = t
                }), n
            }

            function oU(t) {
                void 0 === t && (t = {});
                var n = t.placement,
                    r = void 0 === n ? "bottom" : n,
                    o = t.strategy,
                    a = void 0 === o ? "absolute" : o,
                    i = t.middleware,
                    l = void 0 === i ? [] : i,
                    u = t.platform,
                    c = t.elements,
                    s = void 0 === c ? {} : c,
                    d = s.reference,
                    f = s.floating,
                    p = t.transform,
                    v = void 0 === p || p,
                    m = t.whileElementsMounted,
                    h = t.open,
                    y = rP(K.useState({
                        x: 0,
                        y: 0,
                        strategy: a,
                        placement: r,
                        middlewareData: {},
                        isPositioned: !1
                    }), 2),
                    b = y[0],
                    g = y[1],
                    w = rP(K.useState(l), 2),
                    x = w[0],
                    S = w[1];
                oL(x, l) || S(l);
                var O = rP(K.useState(null), 2),
                    j = O[0],
                    E = O[1],
                    C = rP(K.useState(null), 2),
                    P = C[0],
                    A = C[1],
                    T = K.useCallback(function(t) {
                        t !== k.current && (k.current = t, E(t))
                    }, []),
                    R = K.useCallback(function(t) {
                        t !== D.current && (D.current = t, A(t))
                    }, []),
                    N = d || j,
                    I = f || P,
                    k = K.useRef(null),
                    D = K.useRef(null),
                    L = K.useRef(b),
                    M = null != m,
                    _ = oF(m),
                    F = oF(u),
                    U = oF(h),
                    W = K.useCallback(function() {
                        if (k.current && D.current) {
                            var t = {
                                placement: r,
                                strategy: a,
                                middleware: x
                            };
                            F.current && (t.platform = F.current), ok(k.current, D.current, t).then(function(t) {
                                var n = rE(rj({}, t), {
                                    isPositioned: !1 !== U.current
                                });
                                z.current && !oL(L.current, n) && (L.current = n, tO.flushSync(function() {
                                    g(n)
                                }))
                            })
                        }
                    }, [x, r, a, F, U]);
                oD(function() {
                    !1 === h && L.current.isPositioned && (L.current.isPositioned = !1, g(function(t) {
                        return rE(rj({}, t), {
                            isPositioned: !1
                        })
                    }))
                }, [h]);
                var z = K.useRef(!1);
                oD(function() {
                    return z.current = !0,
                        function() {
                            z.current = !1
                        }
                }, []), oD(function() {
                    if (N && (k.current = N), I && (D.current = I), N && I) {
                        if (_.current) return _.current(N, I, W);
                        W()
                    }
                }, [N, I, W, _, M]);
                var V = K.useMemo(function() {
                        return {
                            reference: k,
                            floating: D,
                            setReference: T,
                            setFloating: R
                        }
                    }, [T, R]),
                    B = K.useMemo(function() {
                        return {
                            reference: N,
                            floating: I
                        }
                    }, [N, I]),
                    H = K.useMemo(function() {
                        var t = {
                            position: a,
                            left: 0,
                            top: 0
                        };
                        if (!B.floating) return t;
                        var n = o_(B.floating, b.x),
                            r = o_(B.floating, b.y);
                        return v ? rj(rE(rj({}, t), {
                            transform: "translate(" + n + "px, " + r + "px)"
                        }), oM(B.floating) >= 1.5 && {
                            willChange: "transform"
                        }) : {
                            position: a,
                            left: n,
                            top: r
                        }
                    }, [a, v, B.floating, b.x, b.y]);
                return K.useMemo(function() {
                    return rE(rj({}, b), {
                        update: W,
                        refs: V,
                        elements: B,
                        floatingStyles: H
                    })
                }, [b, W, V, B, H])
            }
            var oW = function(t, n) {
                    var r;
                    return rE(rj({}, (void 0 === (r = t) && (r = 0), {
                        name: "offset",
                        options: r,
                        fn: function(t) {
                            return rx(function() {
                                var n, o, a, i, l, u, c;
                                return rN(this, function(s) {
                                    switch (s.label) {
                                        case 0:
                                            var d;
                                            return a = t.x, i = t.y, l = t.placement, u = t.middlewareData, [4, (d = r, rx(function() {
                                                var n, r, o, a, i, l, u, c, s, f, p, v, m, h;
                                                return rN(this, function(y) {
                                                    switch (y.label) {
                                                        case 0:
                                                            return n = t.placement, r = t.platform, o = t.elements, [4, null == r.isRTL ? void 0 : r.isRTL(o.floating)];
                                                        case 1:
                                                            return a = y.sent(), i = rW(n), l = rz(n), u = "y" === rH(n), c = r3.has(i) ? -1 : 1, s = a && u ? -1 : 1, v = (p = "number" == typeof(f = rU(d, t)) ? {
                                                                mainAxis: f,
                                                                crossAxis: 0,
                                                                alignmentAxis: null
                                                            } : {
                                                                mainAxis: f.mainAxis || 0,
                                                                crossAxis: f.crossAxis || 0,
                                                                alignmentAxis: f.alignmentAxis
                                                            }).mainAxis, m = p.crossAxis, h = p.alignmentAxis, [2, (l && "number" == typeof h && (m = "end" === l ? -1 * h : h), u ? {
                                                                x: m * s,
                                                                y: v * c
                                                            } : {
                                                                x: v * c,
                                                                y: m * s
                                                            })]
                                                    }
                                                })
                                            })())];
                                        case 1:
                                            return c = s.sent(), [2, l === (null == (n = u.offset) ? void 0 : n.placement) && null != (o = u.arrow) && o.alignmentOffset ? {} : {
                                                x: a + c.x,
                                                y: i + c.y,
                                                data: rE(rj({}, c), {
                                                    placement: l
                                                })
                                            }]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [t, n]
                    })
                },
                oz = function(t, n) {
                    var r;
                    return rE(rj({}, (void 0 === (r = t) && (r = {}), {
                        name: "shift",
                        options: r,
                        fn: function(t) {
                            return rx(function() {
                                var n, o, a, i, l, u, c, s, d, f, p, v, m, h, y, b, g, w, x, S, O, j;
                                return rN(this, function(E) {
                                    switch (E.label) {
                                        case 0:
                                            return n = t.x, o = t.y, a = t.placement, u = void 0 === (l = (i = rU(r, t)).mainAxis) || l, s = void 0 !== (c = i.crossAxis) && c, f = void 0 === (d = i.limiter) ? {
                                                fn: function(t) {
                                                    return {
                                                        x: t.x,
                                                        y: t.y
                                                    }
                                                }
                                            } : d, p = rC(i, ["mainAxis", "crossAxis", "limiter"]), v = {
                                                x: n,
                                                y: o
                                            }, [4, r0(t, p)];
                                        case 1:
                                            return m = E.sent(), b = v[y = rV(h = rH(rW(a)))], g = v[h], u && (w = "y" === y ? "bottom" : "right", b = rD(b + m["y" === y ? "top" : "left"], rk(b, b - m[w]))), s && (x = "y" === h ? "bottom" : "right", g = rD(g + m["y" === h ? "top" : "left"], rk(g, g - m[x]))), O = f.fn(rE(rj({}, t), (rS(S = {}, y, b), rS(S, h, g), S))), [2, rE(rj({}, O), {
                                                data: {
                                                    x: O.x - n,
                                                    y: O.y - o,
                                                    enabled: (rS(j = {}, y, u), rS(j, h, s), j)
                                                }
                                            })]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [t, n]
                    })
                },
                oV = function(t, n) {
                    var r;
                    return rE(rj({}, (void 0 === (r = t) && (r = {}), {
                        options: r,
                        fn: function(t) {
                            var n, o = t.x,
                                a = t.y,
                                i = t.placement,
                                l = t.rects,
                                u = t.middlewareData,
                                c = rU(r, t),
                                s = c.offset,
                                d = c.mainAxis,
                                f = c.crossAxis,
                                p = {
                                    x: o,
                                    y: a
                                },
                                v = rH(i),
                                m = rV(v),
                                h = p[m],
                                y = p[v],
                                b = rU(void 0 === s ? 0 : s, t),
                                g = "number" == typeof b ? {
                                    mainAxis: b,
                                    crossAxis: 0
                                } : rj({
                                    mainAxis: 0,
                                    crossAxis: 0
                                }, b);
                            if (void 0 === d || d) {
                                var w = "y" === m ? "height" : "width",
                                    x = l.reference[m] - l.floating[w] + g.mainAxis,
                                    S = l.reference[m] + l.reference[w] - g.mainAxis;
                                h < x ? h = x : h > S && (h = S)
                            }
                            if (void 0 === f || f) {
                                var O, j, E = "y" === m ? "width" : "height",
                                    C = r3.has(rW(i)),
                                    P = l.reference[v] - l.floating[E] + (C && (null == (O = u.offset) ? void 0 : O[v]) || 0) + (C ? 0 : g.crossAxis),
                                    A = l.reference[v] + l.reference[E] + (C ? 0 : (null == (j = u.offset) ? void 0 : j[v]) || 0) - (C ? g.crossAxis : 0);
                                y < P ? y = P : y > A && (y = A)
                            }
                            return rS(n = {}, m, h), rS(n, v, y), n
                        }
                    })), {
                        options: [t, n]
                    })
                },
                oB = function(t, n) {
                    var r;
                    return rE(rj({}, (void 0 === (r = t) && (r = {}), {
                        name: "flip",
                        options: r,
                        fn: function(t) {
                            return rx(function() {
                                var n, o, a, i, l, u, c, s, d, f, p, v, m, h, y, b, g, w, x, S, O, j, E, C, P, A, T, R, N, I, k, D, L, M, _, F, U, W, z, V;
                                return rN(this, function(B) {
                                    var H, K, q, X, $, Y, G, Z, Q, J, ee, et, en, er, eo;
                                    switch (B.label) {
                                        case 0:
                                            if (i = t.placement, l = t.middlewareData, u = t.rects, c = t.initialPlacement, s = t.platform, d = t.elements, v = void 0 === (p = (f = rU(r, t)).mainAxis) || p, h = void 0 === (m = f.crossAxis) || m, y = f.fallbackPlacements, g = void 0 === (b = f.fallbackStrategy) ? "bestFit" : b, x = void 0 === (w = f.fallbackAxisSideDirection) ? "none" : w, O = void 0 === (S = f.flipAlignment) || S, j = rC(f, ["mainAxis", "crossAxis", "fallbackPlacements", "fallbackStrategy", "fallbackAxisSideDirection", "flipAlignment"]), null != (o = l.arrow) && o.alignmentOffset) return [2, {}];
                                            return E = rW(i), C = rH(c), P = rW(c) === c, [4, null == s.isRTL ? void 0 : s.isRTL(d.floating)];
                                        case 1:
                                            return A = B.sent(), T = y || (P || !O ? [rG(c)] : (K = rG(H = c), [rK(H), K, rK(K)])), R = "none" !== x, !y && R && (n = T).push.apply(n, rA((q = c, X = O, $ = x, Y = A, G = rz(q), Z = function(t, n, r) {
                                                switch (t) {
                                                    case "top":
                                                    case "bottom":
                                                        return r ? n ? rX : rq : n ? rq : rX;
                                                    case "left":
                                                    case "right":
                                                        return n ? r$ : rY;
                                                    default:
                                                        return []
                                                }
                                            }(rW(q), "start" === $, Y), G && (Z = Z.map(function(t) {
                                                return t + "-" + G
                                            }), X && (Z = Z.concat(Z.map(rK)))), Z))), N = [c].concat(rA(T)), [4, r0(t, j)];
                                        case 2:
                                            if (I = B.sent(), k = [], D = (null == (a = l.flip) ? void 0 : a.overflows) || [], v && k.push(I[E]), h && (Q = i, J = u, void 0 === (ee = A) && (ee = !1), et = rz(Q), er = rB(en = rV(rH(Q))), eo = "x" === en ? et === (ee ? "end" : "start") ? "right" : "left" : "start" === et ? "bottom" : "top", J.reference[er] > J.floating[er] && (eo = rG(eo)), L = [eo, rG(eo)], k.push(I[L[0]], I[L[1]])), D = rA(D).concat([{
                                                    placement: i,
                                                    overflows: k
                                                }]), !k.every(function(t) {
                                                    return t <= 0
                                                })) {
                                                if ((U = N[F = ((null == (M = l.flip) ? void 0 : M.index) || 0) + 1]) && ("alignment" !== h || C === rH(U) || D.every(function(t) {
                                                        return rH(t.placement) !== C || t.overflows[0] > 0
                                                    }))) return [2, {
                                                    data: {
                                                        index: F,
                                                        overflows: D
                                                    },
                                                    reset: {
                                                        placement: U
                                                    }
                                                }];
                                                if (!(W = null == (_ = D.filter(function(t) {
                                                        return t.overflows[0] <= 0
                                                    }).sort(function(t, n) {
                                                        return t.overflows[1] - n.overflows[1]
                                                    })[0]) ? void 0 : _.placement)) switch (g) {
                                                    case "bestFit":
                                                        (V = null == (z = D.filter(function(t) {
                                                            if (R) {
                                                                var n = rH(t.placement);
                                                                return n === C || "y" === n
                                                            }
                                                            return !0
                                                        }).map(function(t) {
                                                            return [t.placement, t.overflows.filter(function(t) {
                                                                return t > 0
                                                            }).reduce(function(t, n) {
                                                                return t + n
                                                            }, 0)]
                                                        }).sort(function(t, n) {
                                                            return t[1] - n[1]
                                                        })[0]) ? void 0 : z[0]) && (W = V);
                                                        break;
                                                    case "initialPlacement":
                                                        W = c
                                                }
                                                if (i !== W) return [2, {
                                                    reset: {
                                                        placement: W
                                                    }
                                                }]
                                            }
                                            return [2, {}]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [t, n]
                    })
                },
                oH = function(t, n) {
                    var r;
                    return rE(rj({}, (void 0 === (r = t) && (r = {}), {
                        name: "size",
                        options: r,
                        fn: function(t) {
                            return rx(function() {
                                var n, o, a, i, l, u, c, s, d, f, p, v, m, h, y, b, g, w, x, S, O, j, E, C, P, A, T, R, N, I;
                                return rN(this, function(k) {
                                    switch (k.label) {
                                        case 0:
                                            return a = t.placement, i = t.rects, l = t.platform, u = t.elements, d = void 0 === (s = (c = rU(r, t)).apply) ? function() {} : s, [4, r0(t, rC(c, ["apply"]))];
                                        case 1:
                                            if (f = k.sent(), p = rW(a), v = rz(a), m = "y" === rH(a), y = (h = i.floating).width, b = h.height, "top" !== p && "bottom" !== p) return [3, 3];
                                            return g = p, [4, null == l.isRTL ? void 0 : l.isRTL(u.floating)];
                                        case 2:
                                            return w = v === (k.sent() ? "start" : "end") ? "left" : "right", [3, 4];
                                        case 3:
                                            w = p, g = "end" === v ? "top" : "bottom", k.label = 4;
                                        case 4:
                                            return x = b - f.top - f.bottom, S = y - f.left - f.right, O = rk(b - f[g], x), j = rk(y - f[w], S), E = !t.middlewareData.shift, C = O, P = j, null != (n = t.middlewareData.shift) && n.enabled.x && (P = S), null != (o = t.middlewareData.shift) && o.enabled.y && (C = x), E && !v && (A = rD(f.left, 0), T = rD(f.right, 0), R = rD(f.top, 0), N = rD(f.bottom, 0), m ? P = y - 2 * (0 !== A || 0 !== T ? A + T : rD(f.left, f.right)) : C = b - 2 * (0 !== R || 0 !== N ? R + N : rD(f.top, f.bottom))), [4, d(rE(rj({}, t), {
                                                availableWidth: P,
                                                availableHeight: C
                                            }))];
                                        case 5:
                                            return k.sent(), [4, l.getDimensions(u.floating)];
                                        case 6:
                                            return I = k.sent(), [2, y !== I.width || b !== I.height ? {
                                                reset: {
                                                    rects: !0
                                                }
                                            } : {}]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [t, n]
                    })
                },
                oK = function(t, n) {
                    var r;
                    return rE(rj({}, (void 0 === (r = t) && (r = {}), {
                        name: "hide",
                        options: r,
                        fn: function(t) {
                            return rx(function() {
                                var n, o, a, i, l, u, c;
                                return rN(this, function(s) {
                                    switch (s.label) {
                                        case 0:
                                            switch (n = t.rects, i = void 0 === (a = (o = rU(r, t)).strategy) ? "referenceHidden" : a, l = rC(o, ["strategy"]), i) {
                                                case "referenceHidden":
                                                    return [3, 1];
                                                case "escaped":
                                                    return [3, 3]
                                            }
                                            return [3, 5];
                                        case 1:
                                            return [4, r0(t, rE(rj({}, l), {
                                                elementContext: "reference"
                                            }))];
                                        case 2:
                                            return [2, {
                                                data: {
                                                    referenceHiddenOffsets: u = r1.apply(void 0, [s.sent(), n.reference]),
                                                    referenceHidden: r2(u)
                                                }
                                            }];
                                        case 3:
                                            return [4, r0(t, rE(rj({}, l), {
                                                altBoundary: !0
                                            }))];
                                        case 4:
                                            return [2, {
                                                data: {
                                                    escapedOffsets: c = r1.apply(void 0, [s.sent(), n.floating]),
                                                    escaped: r2(c)
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
                        options: [t, n]
                    })
                },
                oq = function(t, n) {
                    return rE(rj({}, {
                        name: "arrow",
                        options: t,
                        fn: function(n) {
                            var r = "function" == typeof t ? t(n) : t,
                                o = r.element,
                                a = r.padding;
                            return o && ({}).hasOwnProperty.call(o, "current") ? null != o.current ? oI({
                                element: o.current,
                                padding: a
                            }).fn(n) : {} : o ? oI({
                                element: o,
                                padding: a
                            }).fn(n) : {}
                        }
                    }), {
                        options: [t, n]
                    })
                };

            function oX(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function o$(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function oY(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        o$(t, n, r[n])
                    })
                }
                return t
            }

            function oG(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function oZ(t, n) {
                if (null == t) return {};
                var r, o, a = function(t, n) {
                    if (null == t) return {};
                    var r, o, a = {},
                        i = Object.keys(t);
                    for (o = 0; o < i.length; o++) r = i[o], n.indexOf(r) >= 0 || (a[r] = t[r]);
                    return a
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(t);
                    for (o = 0; o < i.length; o++) r = i[o], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (a[r] = t[r])
                }
                return a
            }

            function oQ(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var i = [],
                            l = !0,
                            u = !1;
                        try {
                            for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            u = !0, o = t
                        } finally {
                            try {
                                l || null == a.return || a.return()
                            } finally {
                                if (u) throw o
                            }
                        }
                        return i
                    }
                }(t, n) || o0(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oJ(t) {
                return function(t) {
                    if (Array.isArray(t)) return oX(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || o0(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function o0(t, n) {
                if (t) {
                    if ("string" == typeof t) return oX(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oX(t, n)
                }
            }

            function o1(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }
            var o2 = Symbol("radix.slottable");

            function o3(t) {
                return K.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === o2
            }
            var o4 = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                    var r, o, a, i, l, u = (o = r = "Primitive.".concat(n), (a = K.forwardRef(function(t, n) {
                            var r = t.children,
                                o = oZ(t, ["children"]);
                            if (K.isValidElement(r)) {
                                var a, i, l, u = (l = null == (a = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (i = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                    c = function(t, n) {
                                        var r = oY({}, n);
                                        for (var o in n) ! function(o) {
                                            var a = t[o],
                                                i = n[o];
                                            /^on[A-Z]/.test(o) ? a && i ? r[o] = function() {
                                                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                                i.apply(void 0, oJ(n)), a.apply(void 0, oJ(n))
                                            } : a && (r[o] = a) : "style" === o ? r[o] = oY({}, a, i) : "className" === o && (r[o] = [a, i].filter(Boolean).join(" "))
                                        }(o);
                                        return oY({}, t, r)
                                    }(o, r.props);
                                return r.type !== K.Fragment && (c.ref = n ? function() {
                                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                    return function(t) {
                                        var r = !1,
                                            o = n.map(function(n) {
                                                var o = o1(n, t);
                                                return r || "function" != typeof o || (r = !0), o
                                            });
                                        if (r) return function() {
                                            for (var t = 0; t < o.length; t++) {
                                                var r = o[t];
                                                "function" == typeof r ? r() : o1(n[t], null)
                                            }
                                        }
                                    }
                                }(n, u) : u), K.cloneElement(r, c)
                            }
                            return K.Children.count(r) > 1 ? K.Children.only(null) : null
                        })).displayName = "".concat(o, ".SlotClone"), i = a, (l = K.forwardRef(function(t, n) {
                            var r = t.children,
                                o = oZ(t, ["children"]),
                                a = K.Children.toArray(r),
                                l = a.find(o3);
                            if (l) {
                                var u = l.props.children,
                                    c = a.map(function(t) {
                                        return t === l ? K.Children.count(u) > 1 ? K.Children.only(null) : K.isValidElement(u) ? u.props.children : null : t
                                    });
                                return (0, z.jsx)(i, oG(oY({}, o), {
                                    ref: n,
                                    children: K.isValidElement(u) ? K.cloneElement(u, void 0, c) : null
                                }))
                            }
                            return (0, z.jsx)(i, oG(oY({}, o), {
                                ref: n,
                                children: r
                            }))
                        })).displayName = "".concat(r, ".Slot"), l),
                        c = K.forwardRef(function(t, r) {
                            var o = t.asChild,
                                a = oZ(t, ["asChild"]),
                                i = o ? u : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, z.jsx)(i, oG(oY({}, a), {
                                ref: r
                            }))
                        });
                    return c.displayName = "Primitive.".concat(n), oG(oY({}, t), o$({}, n, c))
                }, {}),
                o5 = K.forwardRef(function(t, n) {
                    var r = t.children,
                        o = t.width,
                        a = t.height,
                        i = oZ(t, ["children", "width", "height"]);
                    return (0, z.jsx)(o4.svg, oG(oY({}, i), {
                        ref: n,
                        width: void 0 === o ? 10 : o,
                        height: void 0 === a ? 5 : a,
                        viewBox: "0 0 30 10",
                        preserveAspectRatio: "none",
                        children: t.asChild ? r : (0, z.jsx)("polygon", {
                            points: "0,0 30,0 15,10"
                        })
                    }))
                });

            function o6(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }

            function o8() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return function(t) {
                    var r = !1,
                        o = n.map(function(n) {
                            var o = o6(n, t);
                            return r || "function" != typeof o || (r = !0), o
                        });
                    if (r) return function() {
                        for (var t = 0; t < o.length; t++) {
                            var r = o[t];
                            "function" == typeof r ? r() : o6(n[t], null)
                        }
                    }
                }
            }

            function o7() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return K.useCallback(o8.apply(void 0, oJ(n)), n)
            }

            function o9() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                var o = n[0];
                if (1 === n.length) return o;
                var a = function() {
                    var t = n.map(function(t) {
                        return {
                            useScope: t(),
                            scopeName: t.scopeName
                        }
                    });
                    return function(n) {
                        var r = t.reduce(function(t, r) {
                            var o = r.useScope,
                                a = r.scopeName;
                            return oY({}, t, o(n)["__scope".concat(a)])
                        }, {});
                        return K.useMemo(function() {
                            return o$({}, "__scope".concat(o.scopeName), r)
                        }, [r])
                    }
                };
                return a.scopeName = o.scopeName, a
            }
            o5.displayName = "Arrow";
            var ae = Symbol("radix.slottable");

            function at(t) {
                return K.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === ae
            }
            var an = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                    var r, o, a, i, l, u = (o = r = "Primitive.".concat(n), (a = K.forwardRef(function(t, n) {
                            var r = t.children,
                                o = oZ(t, ["children"]);
                            if (K.isValidElement(r)) {
                                var a, i, l, u = (l = null == (a = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (i = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                    c = function(t, n) {
                                        var r = oY({}, n);
                                        for (var o in n) ! function(o) {
                                            var a = t[o],
                                                i = n[o];
                                            /^on[A-Z]/.test(o) ? a && i ? r[o] = function() {
                                                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                                i.apply(void 0, oJ(n)), a.apply(void 0, oJ(n))
                                            } : a && (r[o] = a) : "style" === o ? r[o] = oY({}, a, i) : "className" === o && (r[o] = [a, i].filter(Boolean).join(" "))
                                        }(o);
                                        return oY({}, t, r)
                                    }(o, r.props);
                                return r.type !== K.Fragment && (c.ref = n ? o8(n, u) : u), K.cloneElement(r, c)
                            }
                            return K.Children.count(r) > 1 ? K.Children.only(null) : null
                        })).displayName = "".concat(o, ".SlotClone"), i = a, (l = K.forwardRef(function(t, n) {
                            var r = t.children,
                                o = oZ(t, ["children"]),
                                a = K.Children.toArray(r),
                                l = a.find(at);
                            if (l) {
                                var u = l.props.children,
                                    c = a.map(function(t) {
                                        return t === l ? K.Children.count(u) > 1 ? K.Children.only(null) : K.isValidElement(u) ? u.props.children : null : t
                                    });
                                return (0, z.jsx)(i, oG(oY({}, o), {
                                    ref: n,
                                    children: K.isValidElement(u) ? K.cloneElement(u, void 0, c) : null
                                }))
                            }
                            return (0, z.jsx)(i, oG(oY({}, o), {
                                ref: n,
                                children: r
                            }))
                        })).displayName = "".concat(r, ".Slot"), l),
                        c = K.forwardRef(function(t, r) {
                            var o = t.asChild,
                                a = oZ(t, ["asChild"]),
                                i = o ? u : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, z.jsx)(i, oG(oY({}, a), {
                                ref: r
                            }))
                        });
                    return c.displayName = "Primitive.".concat(n), oG(oY({}, t), o$({}, n, c))
                }, {}),
                ar = (null == (ie = globalThis) ? void 0 : ie.document) ? K.useLayoutEffect : function() {},
                ao = "Popper",
                aa = oQ(function(t) {
                    var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        o = function() {
                            var n = r.map(function(t) {
                                return K.createContext(t)
                            });
                            return function(r) {
                                var o = (null == r ? void 0 : r[t]) || n;
                                return K.useMemo(function() {
                                    return o$({}, "__scope".concat(t), oG(oY({}, r), o$({}, t, o)))
                                }, [r, o])
                            }
                        };
                    return o.scopeName = t, [function(n, o) {
                        var a = K.createContext(o),
                            i = r.length;
                        r = oJ(r).concat([o]);
                        var l = function(n) {
                            var r, o = n.scope,
                                l = n.children,
                                u = oZ(n, ["scope", "children"]),
                                c = (null == o || null == (r = o[t]) ? void 0 : r[i]) || a,
                                s = K.useMemo(function() {
                                    return u
                                }, Object.values(u));
                            return (0, z.jsx)(c.Provider, {
                                value: s,
                                children: l
                            })
                        };
                        return l.displayName = n + "Provider", [l, function(r, l) {
                            var u, c = (null == l || null == (u = l[t]) ? void 0 : u[i]) || a,
                                s = K.useContext(c);
                            if (s) return s;
                            if (void 0 !== o) return o;
                            throw Error("`".concat(r, "` must be used within `").concat(n, "`"))
                        }]
                    }, o9.apply(void 0, [o].concat(oJ(n)))]
                }(ao), 2),
                ai = aa[0],
                al = aa[1],
                au = oQ(ai(ao), 2),
                ac = au[0],
                as = au[1],
                ad = function(t) {
                    var n = t.__scopePopper,
                        r = t.children,
                        o = oQ(K.useState(null), 2),
                        a = o[0],
                        i = o[1];
                    return (0, z.jsx)(ac, {
                        scope: n,
                        anchor: a,
                        onAnchorChange: i,
                        children: r
                    })
                };
            ad.displayName = ao;
            var af = "PopperAnchor",
                ap = K.forwardRef(function(t, n) {
                    var r = t.__scopePopper,
                        o = t.virtualRef,
                        a = oZ(t, ["__scopePopper", "virtualRef"]),
                        i = as(af, r),
                        l = K.useRef(null),
                        u = o7(n, l);
                    return K.useEffect(function() {
                        i.onAnchorChange((null == o ? void 0 : o.current) || l.current)
                    }), o ? null : (0, z.jsx)(an.div, oG(oY({}, a), {
                        ref: u
                    }))
                });
            ap.displayName = af;
            var av = "PopperContent",
                am = oQ(ai(av), 2),
                ah = am[0],
                ay = am[1],
                ab = K.forwardRef(function(t, n) {
                    var r, o, a, i, l, u, c, s, d, f, p, v, m = t.__scopePopper,
                        h = t.side,
                        y = t.sideOffset,
                        b = t.align,
                        g = void 0 === b ? "center" : b,
                        w = t.alignOffset,
                        x = t.arrowPadding,
                        S = t.avoidCollisions,
                        O = void 0 === S || S,
                        j = t.collisionBoundary,
                        E = void 0 === j ? [] : j,
                        C = t.collisionPadding,
                        P = void 0 === C ? 0 : C,
                        A = t.sticky,
                        T = t.hideWhenDetached,
                        R = t.updatePositionStrategy,
                        N = void 0 === R ? "optimized" : R,
                        I = t.onPlaced,
                        k = oZ(t, ["__scopePopper", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "avoidCollisions", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "updatePositionStrategy", "onPlaced"]),
                        D = as(av, m),
                        L = oQ(K.useState(null), 2),
                        M = L[0],
                        _ = L[1],
                        F = o7(n, function(t) {
                            return _(t)
                        }),
                        U = oQ(K.useState(null), 2),
                        W = U[0],
                        V = U[1],
                        B = (o = (r = oQ(K.useState(void 0), 2))[0], a = r[1], ar(function() {
                            if (W) {
                                a({
                                    width: W.offsetWidth,
                                    height: W.offsetHeight
                                });
                                var t = new ResizeObserver(function(t) {
                                    if (Array.isArray(t) && t.length) {
                                        var n, r, o = t[0];
                                        if ("borderBoxSize" in o) {
                                            var i = o.borderBoxSize,
                                                l = Array.isArray(i) ? i[0] : i;
                                            n = l.inlineSize, r = l.blockSize
                                        } else n = W.offsetWidth, r = W.offsetHeight;
                                        a({
                                            width: n,
                                            height: r
                                        })
                                    }
                                });
                                return t.observe(W, {
                                        box: "border-box"
                                    }),
                                    function() {
                                        return t.unobserve(W)
                                    }
                            }
                            a(void 0)
                        }, [W]), o),
                        H = null != (p = null == B ? void 0 : B.width) ? p : 0,
                        q = null != (v = null == B ? void 0 : B.height) ? v : 0,
                        X = "number" == typeof P ? P : oY({
                            top: 0,
                            right: 0,
                            bottom: 0,
                            left: 0
                        }, P),
                        $ = Array.isArray(E) ? E : [E],
                        Y = $.length > 0,
                        G = {
                            padding: X,
                            boundary: $.filter(aS),
                            altBoundary: Y
                        },
                        Z = oU({
                            strategy: "fixed",
                            placement: (void 0 === h ? "bottom" : h) + ("center" !== g ? "-" + g : ""),
                            whileElementsMounted: function() {
                                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                return oN.apply(void 0, oJ(n).concat([{
                                    animationFrame: "always" === N
                                }]))
                            },
                            elements: {
                                reference: D.anchor
                            },
                            middleware: [oW({
                                mainAxis: (void 0 === y ? 0 : y) + q,
                                alignmentAxis: void 0 === w ? 0 : w
                            }), O && oz(oY({
                                mainAxis: !0,
                                crossAxis: !1,
                                limiter: "partial" === (void 0 === A ? "partial" : A) ? oV() : void 0
                            }, G)), O && oB(oY({}, G)), oH(oG(oY({}, G), {
                                apply: function(t) {
                                    var n = t.elements,
                                        r = t.rects,
                                        o = t.availableWidth,
                                        a = t.availableHeight,
                                        i = r.reference,
                                        l = i.width,
                                        u = i.height,
                                        c = n.floating.style;
                                    c.setProperty("--radix-popper-available-width", "".concat(o, "px")), c.setProperty("--radix-popper-available-height", "".concat(a, "px")), c.setProperty("--radix-popper-anchor-width", "".concat(l, "px")), c.setProperty("--radix-popper-anchor-height", "".concat(u, "px"))
                                }
                            })), W && oq({
                                element: W,
                                padding: void 0 === x ? 0 : x
                            }), aO({
                                arrowWidth: H,
                                arrowHeight: q
                            }), void 0 !== T && T && oK(oY({
                                strategy: "referenceHidden"
                            }, G))]
                        }),
                        Q = Z.refs,
                        J = Z.floatingStyles,
                        ee = Z.placement,
                        et = Z.isPositioned,
                        en = Z.middlewareData,
                        er = oQ(aj(ee), 2),
                        eo = er[0],
                        ea = er[1],
                        ei = (i = K.useRef(I), K.useEffect(function() {
                            i.current = I
                        }), K.useMemo(function() {
                            return function() {
                                for (var t, n = arguments.length, r = Array(n), o = 0; o < n; o++) r[o] = arguments[o];
                                return null == (t = i.current) ? void 0 : t.call.apply(t, [i].concat(oJ(r)))
                            }
                        }, []));
                    ar(function() {
                        et && (null == ei || ei())
                    }, [et, ei]);
                    var el = null == (l = en.arrow) ? void 0 : l.x,
                        eu = null == (u = en.arrow) ? void 0 : u.y,
                        ec = 0 !== (null == (c = en.arrow) ? void 0 : c.centerOffset),
                        es = oQ(K.useState(), 2),
                        ed = es[0],
                        ef = es[1];
                    return ar(function() {
                        M && ef(window.getComputedStyle(M).zIndex)
                    }, [M]), (0, z.jsx)("div", {
                        ref: Q.setFloating,
                        "data-radix-popper-content-wrapper": "",
                        style: oY(oG(oY({}, J), {
                            transform: et ? J.transform : "translate(0, -200%)",
                            minWidth: "max-content",
                            zIndex: ed,
                            "--radix-popper-transform-origin": [null == (s = en.transformOrigin) ? void 0 : s.x, null == (d = en.transformOrigin) ? void 0 : d.y].join(" ")
                        }), (null == (f = en.hide) ? void 0 : f.referenceHidden) && {
                            visibility: "hidden",
                            pointerEvents: "none"
                        }),
                        dir: t.dir,
                        children: (0, z.jsx)(ah, {
                            scope: m,
                            placedSide: eo,
                            onArrowChange: V,
                            arrowX: el,
                            arrowY: eu,
                            shouldHideArrow: ec,
                            children: (0, z.jsx)(an.div, oG(oY({
                                "data-side": eo,
                                "data-align": ea
                            }, k), {
                                ref: F,
                                style: oG(oY({}, k.style), {
                                    animation: et ? void 0 : "none"
                                })
                            }))
                        })
                    })
                });
            ab.displayName = av;
            var ag = "PopperArrow",
                aw = {
                    top: "bottom",
                    right: "left",
                    bottom: "top",
                    left: "right"
                },
                ax = K.forwardRef(function(t, n) {
                    var r, o = t.__scopePopper,
                        a = oZ(t, ["__scopePopper"]),
                        i = ay(ag, o),
                        l = aw[i.placedSide];
                    return (0, z.jsx)("span", {
                        ref: i.onArrowChange,
                        style: (o$(r = {
                            position: "absolute",
                            left: i.arrowX,
                            top: i.arrowY
                        }, l, 0), o$(r, "transformOrigin", {
                            top: "",
                            right: "0 0",
                            bottom: "center 0",
                            left: "100% 0"
                        } [i.placedSide]), o$(r, "transform", {
                            top: "translateY(100%)",
                            right: "translateY(50%) rotate(90deg) translateX(-50%)",
                            bottom: "rotate(180deg)",
                            left: "translateY(50%) rotate(-90deg) translateX(50%)"
                        } [i.placedSide]), o$(r, "visibility", i.shouldHideArrow ? "hidden" : void 0), r),
                        children: (0, z.jsx)(o5, oG(oY({}, a), {
                            ref: n,
                            style: oG(oY({}, a.style), {
                                display: "block"
                            })
                        }))
                    })
                });

            function aS(t) {
                return null !== t
            }
            ax.displayName = ag;
            var aO = function(t) {
                return {
                    name: "transformOrigin",
                    options: t,
                    fn: function(n) {
                        var r, o, a, i, l, u = n.placement,
                            c = n.rects,
                            s = n.middlewareData,
                            d = 0 !== (null == (r = s.arrow) ? void 0 : r.centerOffset),
                            f = d ? 0 : t.arrowWidth,
                            p = d ? 0 : t.arrowHeight,
                            v = oQ(aj(u), 2),
                            m = v[0],
                            h = {
                                start: "0%",
                                center: "50%",
                                end: "100%"
                            } [v[1]],
                            y = (null != (i = null == (o = s.arrow) ? void 0 : o.x) ? i : 0) + f / 2,
                            b = (null != (l = null == (a = s.arrow) ? void 0 : a.y) ? l : 0) + p / 2,
                            g = "",
                            w = "";
                        return "bottom" === m ? (g = d ? h : "".concat(y, "px"), w = -p + "px") : "top" === m ? (g = d ? h : "".concat(y, "px"), w = "".concat(c.floating.height + p, "px")) : "right" === m ? (g = -p + "px", w = d ? h : "".concat(b, "px")) : "left" === m && (g = "".concat(c.floating.width + p, "px"), w = d ? h : "".concat(b, "px")), {
                            data: {
                                x: g,
                                y: w
                            }
                        }
                    }
                }
            };

            function aj(t) {
                var n = oQ(t.split("-"), 2),
                    r = n[0],
                    o = n[1];
                return [r, void 0 === o ? "center" : o]
            }
            var aE = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                aC = function(t) {
                    var n = t.className;
                    return q().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: tS("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", n)
                    })
                },
                aP = "opacity-[0.5]";

            function aA(t, n) {
                void 0 === n && (n = {});
                var r = n.insertAt;
                if (t && "undefined" != typeof document) {
                    var o = document.head || document.getElementsByTagName("head")[0],
                        a = document.createElement("style");
                    a.type = "text/css", "top" === r && o.firstChild ? o.insertBefore(a, o.firstChild) : o.appendChild(a), a.styleSheet ? a.styleSheet.cssText = t : a.appendChild(document.createTextNode(t))
                }
            }
            aA(".bg-common-backdrop{background-color:var(--color-common-backdrop)}.shadow-transient-high{box-shadow:var(--size-0) var(--size-50) var(--size-100) -.5px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-250) var(--size-500) -.75px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-400) var(--size-800) -1px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-1200) var(--size-1400) -1.5px var(--alpha-color-shadow-subtle)}.shadow-transient-low{box-shadow:var(--size-0) var(--size-50) var(--size-100) -.5px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-250) var(--size-500) -.75px var(--alpha-color-shadow-subtle)}.foundation-web-portal-zindex{z-index:1050}.fui-future-shadow-affixed-low{box-shadow:0 0 var(--size-100) 0 var(--fui-future-alpha-color-shadow-subtle),0 0 var(--size-500) 0 var(--fui-future-alpha-color-shadow-subtle)}:root{--light-mode-stroke-contrast-alpha:rgba(27,37,75,.5);--dark-mode-stroke-contrast-alpha:rgba(208,217,251,.4);--color-stroke-contrast-alpha:var(--light-mode-stroke-contrast-alpha);--alpha-light-mode-shadow-subtle:rgba(0,0,0,.08);--alpha-dark-mode-shadow-subtle:rgba(4,4,8,.25);--alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}@media (prefers-color-scheme:dark){:root{--color-stroke-contrast-alpha:var(--dark-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}}.light-theme{--color-stroke-contrast-alpha:var(--light-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}.dark-theme{--color-stroke-contrast-alpha:var(--dark-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}.system-theme{--color-stroke-contrast-alpha:var(--light-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}@media (prefers-color-scheme:dark){.system-theme{--color-stroke-contrast-alpha:var(--dark-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}}.stroke-contrast-alpha{border-color:var(--color-stroke-contrast-alpha)}.foundation-web-input.focus-within\\:stroke-system-emphasis:focus-within{box-shadow:inset 0 0 0 1px var(--color-system-emphasis)}.foundation-web-input.focus-within\\:stroke-system-alert:focus-within{box-shadow:inset 0 0 0 1px var(--color-system-alert)}");
            var aT = 0,
                aR = function() {
                    var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "\xabr",
                        n = (0, K.useRef)();
                    return n.current || (aT += 1, n.current = "".concat(t).concat(aT)), n.current
                },
                aN = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                aI = q().forwardRef(function(t, n) {
                    var r = t.name,
                        o = t.size,
                        a = t.className,
                        i = (t.children, tK(t, ["name", "size", "className", "children"]));
                    return q().createElement("span", Object.assign({
                        ref: n,
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-icon",
                        className: tS("grow-0 shrink-0 basis-auto icon", r, aN[void 0 === o ? "Medium" : o], a)
                    }, i))
                });

            function ak(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function aD(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function aL(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        aD(t, n, r[n])
                    })
                }
                return t
            }

            function aM(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var i = [],
                            l = !0,
                            u = !1;
                        try {
                            for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            u = !0, o = t
                        } finally {
                            try {
                                l || null == a.return || a.return()
                            } finally {
                                if (u) throw o
                            }
                        }
                        return i
                    }
                }(t, n) || aF(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function a_(t) {
                return function(t) {
                    if (Array.isArray(t)) return ak(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || aF(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function aF(t, n) {
                if (t) {
                    if ("string" == typeof t) return ak(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ak(t, n)
                }
            }

            function aU(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }

            function aW() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return function(t) {
                    var r = !1,
                        o = n.map(function(n) {
                            var o = aU(n, t);
                            return r || "function" != typeof o || (r = !0), o
                        });
                    if (r) return function() {
                        for (var t = 0; t < o.length; t++) {
                            var r = o[t];
                            "function" == typeof r ? r() : aU(n[t], null)
                        }
                    }
                }
            }

            function az() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return K.useCallback(aW.apply(void 0, a_(n)), n)
            }

            function aV(t) {
                var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    r = [],
                    o = function() {
                        var n = r.map(function(t) {
                            return K.createContext(t)
                        });
                        return function(r) {
                            var o = (null == r ? void 0 : r[t]) || n;
                            return K.useMemo(function() {
                                var n, a;
                                return aD({}, "__scope".concat(t), (n = aL({}, r), a = null != (a = aD({}, t, o)) ? a : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(a)) : (function(t, n) {
                                    var r = Object.keys(t);
                                    if (Object.getOwnPropertySymbols) {
                                        var o = Object.getOwnPropertySymbols(t);
                                        r.push.apply(r, o)
                                    }
                                    return r
                                })(Object(a)).forEach(function(t) {
                                    Object.defineProperty(n, t, Object.getOwnPropertyDescriptor(a, t))
                                }), n))
                            }, [r, o])
                        }
                    };
                return o.scopeName = t, [function(n, o) {
                    var a = K.createContext(o),
                        i = r.length;
                    r = a_(r).concat([o]);
                    var l = function(n) {
                        var r, o = n.scope,
                            l = n.children,
                            u = function(t, n) {
                                if (null == t) return {};
                                var r, o, a = function(t, n) {
                                    if (null == t) return {};
                                    var r, o, a = {},
                                        i = Object.keys(t);
                                    for (o = 0; o < i.length; o++) r = i[o], n.indexOf(r) >= 0 || (a[r] = t[r]);
                                    return a
                                }(t, n);
                                if (Object.getOwnPropertySymbols) {
                                    var i = Object.getOwnPropertySymbols(t);
                                    for (o = 0; o < i.length; o++) r = i[o], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (a[r] = t[r])
                                }
                                return a
                            }(n, ["scope", "children"]),
                            c = (null == o || null == (r = o[t]) ? void 0 : r[i]) || a,
                            s = K.useMemo(function() {
                                return u
                            }, Object.values(u));
                        return (0, z.jsx)(c.Provider, {
                            value: s,
                            children: l
                        })
                    };
                    return l.displayName = n + "Provider", [l, function(r, l) {
                        var u, c = (null == l || null == (u = l[t]) ? void 0 : u[i]) || a,
                            s = K.useContext(c);
                        if (s) return s;
                        if (void 0 !== o) return o;
                        throw Error("`".concat(r, "` must be used within `").concat(n, "`"))
                    }]
                }, aB.apply(void 0, [o].concat(a_(n)))]
            }

            function aB() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                var o = n[0];
                if (1 === n.length) return o;
                var a = function() {
                    var t = n.map(function(t) {
                        return {
                            useScope: t(),
                            scopeName: t.scopeName
                        }
                    });
                    return function(n) {
                        var r = t.reduce(function(t, r) {
                            var o = r.useScope,
                                a = r.scopeName;
                            return aL({}, t, o(n)["__scope".concat(a)])
                        }, {});
                        return K.useMemo(function() {
                            return aD({}, "__scope".concat(o.scopeName), r)
                        }, [r])
                    }
                };
                return a.scopeName = o.scopeName, a
            }

            function aH(t, n) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    o = r.checkForDefaultPrevented,
                    a = void 0 === o || o;
                return function(r) {
                    if (null == t || t(r), !1 === a || !r.defaultPrevented) return null == n ? void 0 : n(r)
                }
            }

            function aK(t) {
                var n = K.useRef(t);
                return K.useEffect(function() {
                    n.current = t
                }), K.useMemo(function() {
                    return function() {
                        for (var t, r = arguments.length, o = Array(r), a = 0; a < r; a++) o[a] = arguments[a];
                        return null == (t = n.current) ? void 0 : t.call.apply(t, [n].concat(a_(o)))
                    }
                }, [])
            }
            aI.displayName = "Icon";
            var aq = (null == (it = globalThis) ? void 0 : it.document) ? K.useLayoutEffect : function() {},
                aX = function(t) {
                    var n, r, o, a, i, l, u, c, s, d, f, p, v, m, h = t.present,
                        y = t.children,
                        b = (a = (o = aM(K.useState(), 2))[0], i = o[1], l = K.useRef({}), u = K.useRef(h), c = K.useRef("none"), d = (s = aM((n = h ? "mounted" : "unmounted", r = {
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
                        }, K.useReducer(function(t, n) {
                            var o;
                            return null != (o = r[t][n]) ? o : t
                        }, n)), 2))[0], f = s[1], K.useEffect(function() {
                            var t = a$(l.current);
                            c.current = "mounted" === d ? t : "none"
                        }, [d]), aq(function() {
                            var t = l.current,
                                n = u.current;
                            if (n !== h) {
                                var r = c.current,
                                    o = a$(t);
                                h ? f("MOUNT") : "none" === o || "none" === (null == t ? void 0 : t.display) ? f("UNMOUNT") : f(n && r !== o ? "ANIMATION_OUT" : "UNMOUNT"), u.current = h
                            }
                        }, [h, f]), aq(function() {
                            if (a) {
                                var t, n, r = null != (n = a.ownerDocument.defaultView) ? n : window,
                                    o = function(n) {
                                        var o = a$(l.current).includes(n.animationName);
                                        if (n.target === a && o && (f("ANIMATION_END"), !u.current)) {
                                            var i = a.style.animationFillMode;
                                            a.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                                "forwards" === a.style.animationFillMode && (a.style.animationFillMode = i)
                                            })
                                        }
                                    },
                                    i = function(t) {
                                        t.target === a && (c.current = a$(l.current))
                                    };
                                return a.addEventListener("animationstart", i), a.addEventListener("animationcancel", o), a.addEventListener("animationend", o),
                                    function() {
                                        r.clearTimeout(t), a.removeEventListener("animationstart", i), a.removeEventListener("animationcancel", o), a.removeEventListener("animationend", o)
                                    }
                            }
                            f("ANIMATION_END")
                        }, [a, f]), {
                            isPresent: ["mounted", "unmountSuspended"].includes(d),
                            ref: K.useCallback(function(t) {
                                t && (l.current = getComputedStyle(t)), i(t)
                            }, [])
                        }),
                        g = "function" == typeof y ? y({
                            present: b.isPresent
                        }) : K.Children.only(y),
                        w = az(b.ref, (m = null == (p = Object.getOwnPropertyDescriptor(g.props, "ref")) ? void 0 : p.get) && "isReactWarning" in m && m.isReactWarning ? g.ref : (m = null == (v = Object.getOwnPropertyDescriptor(g, "ref")) ? void 0 : v.get) && "isReactWarning" in m && m.isReactWarning ? g.props.ref : g.props.ref || g.ref);
                    return "function" == typeof y || b.isPresent ? K.cloneElement(g, {
                        ref: w
                    }) : null
                };

            function a$(t) {
                return (null == t ? void 0 : t.animationName) || "none"
            }

            function aY(t) {
                var n = t.className;
                return q().createElement("svg", {
                    xmlns: "http://www.w3.org/2000/svg",
                    width: "13",
                    height: "6",
                    viewBox: "0 0 13 6",
                    fill: "none",
                    className: tS("block", n),
                    style: {
                        marginTop: -1
                    }
                }, q().createElement("path", {
                    d: "M0.249999 0.666628L4.83579 5.25241C5.61683 6.03346 6.88316 6.03346 7.66421 5.25241L12.25 0.666626L0.249999 0.666628Z",
                    fill: "currentColor"
                }))
            }

            function aG(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function aZ(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function aQ(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        aZ(t, n, r[n])
                    })
                }
                return t
            }

            function aJ(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function a0(t, n) {
                if (null == t) return {};
                var r, o, a = function(t, n) {
                    if (null == t) return {};
                    var r, o, a = {},
                        i = Object.keys(t);
                    for (o = 0; o < i.length; o++) r = i[o], n.indexOf(r) >= 0 || (a[r] = t[r]);
                    return a
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(t);
                    for (o = 0; o < i.length; o++) r = i[o], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (a[r] = t[r])
                }
                return a
            }

            function a1(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var i = [],
                            l = !0,
                            u = !1;
                        try {
                            for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            u = !0, o = t
                        } finally {
                            try {
                                l || null == a.return || a.return()
                            } finally {
                                if (u) throw o
                            }
                        }
                        return i
                    }
                }(t, n) || a3(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function a2(t) {
                return function(t) {
                    if (Array.isArray(t)) return aG(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || a3(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function a3(t, n) {
                if (t) {
                    if ("string" == typeof t) return aG(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aG(t, n)
                }
            }
            aX.displayName = "Presence";
            var a4 = K.forwardRef(function(t, n) {
                var r = t.children,
                    o = a0(t, ["children"]),
                    a = K.Children.toArray(r),
                    i = a.find(a8);
                if (i) {
                    var l = i.props.children,
                        u = a.map(function(t) {
                            return t === i ? K.Children.count(l) > 1 ? K.Children.only(null) : K.isValidElement(l) ? l.props.children : null : t
                        });
                    return (0, z.jsx)(a5, aJ(aQ({}, o), {
                        ref: n,
                        children: K.isValidElement(l) ? K.cloneElement(l, void 0, u) : null
                    }))
                }
                return (0, z.jsx)(a5, aJ(aQ({}, o), {
                    ref: n,
                    children: r
                }))
            });
            a4.displayName = "Slot";
            var a5 = K.forwardRef(function(t, n) {
                var r = t.children,
                    o = a0(t, ["children"]);
                if (K.isValidElement(r)) {
                    var a, i, l, u = (l = null == (a = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (i = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref;
                    return K.cloneElement(r, aJ(aQ({}, function(t, n) {
                        var r = aQ({}, n);
                        for (var o in n) ! function(o) {
                            var a = t[o],
                                i = n[o];
                            /^on[A-Z]/.test(o) ? a && i ? r[o] = function() {
                                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                i.apply(void 0, a2(n)), a.apply(void 0, a2(n))
                            } : a && (r[o] = a) : "style" === o ? r[o] = aQ({}, a, i) : "className" === o && (r[o] = [a, i].filter(Boolean).join(" "))
                        }(o);
                        return aQ({}, t, r)
                    }(o, r.props)), {
                        ref: n ? aW(n, u) : u
                    }))
                }
                return K.Children.count(r) > 1 ? K.Children.only(null) : null
            });
            a5.displayName = "SlotClone";
            var a6 = function(t) {
                var n = t.children;
                return (0, z.jsx)(z.Fragment, {
                    children: n
                })
            };

            function a8(t) {
                return K.isValidElement(t) && t.type === a6
            }
            var a7, a9, ie, it, ir, io = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                    var r = K.forwardRef(function(t, r) {
                        var o = t.asChild,
                            a = a0(t, ["asChild"]),
                            i = o ? a4 : n;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, z.jsx)(i, aJ(aQ({}, a), {
                            ref: r
                        }))
                    });
                    return r.displayName = "Primitive.".concat(n), aJ(aQ({}, t), aZ({}, n, r))
                }, {}),
                ia = "dismissableLayer.update",
                ii = K.createContext({
                    layers: new Set,
                    layersWithOutsidePointerEventsDisabled: new Set,
                    branches: new Set
                }),
                il = K.forwardRef(function(t, n) {
                    var r, o, a = t.disableOutsidePointerEvents,
                        i = void 0 !== a && a,
                        l = t.onEscapeKeyDown,
                        u = t.onPointerDownOutside,
                        c = t.onFocusOutside,
                        s = t.onInteractOutside,
                        d = t.onDismiss,
                        f = a0(t, ["disableOutsidePointerEvents", "onEscapeKeyDown", "onPointerDownOutside", "onFocusOutside", "onInteractOutside", "onDismiss"]),
                        p = K.useContext(ii),
                        v = a1(K.useState(null), 2),
                        m = v[0],
                        h = v[1],
                        y = null != (o = null == m ? void 0 : m.ownerDocument) ? o : null == (r = globalThis) ? void 0 : r.document,
                        b = a1(K.useState({}), 2)[1],
                        g = az(n, function(t) {
                            return h(t)
                        }),
                        w = Array.from(p.layers),
                        x = a1(a2(p.layersWithOutsidePointerEventsDisabled).slice(-1), 1)[0],
                        S = w.indexOf(x),
                        O = m ? w.indexOf(m) : -1,
                        j = p.layersWithOutsidePointerEventsDisabled.size > 0,
                        E = O >= S,
                        C = function(t) {
                            var n, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                                o = aK(t),
                                a = K.useRef(!1),
                                i = K.useRef(function() {});
                            return K.useEffect(function() {
                                var t = function(t) {
                                        if (t.target && !a.current) {
                                            var n = function() {
                                                    ic("dismissableLayer.pointerDownOutside", o, l, {
                                                        discrete: !0
                                                    })
                                                },
                                                l = {
                                                    originalEvent: t
                                                };
                                            "touch" === t.pointerType ? (r.removeEventListener("click", i.current), i.current = n, r.addEventListener("click", i.current, {
                                                once: !0
                                            })) : n()
                                        } else r.removeEventListener("click", i.current);
                                        a.current = !1
                                    },
                                    n = window.setTimeout(function() {
                                        r.addEventListener("pointerdown", t)
                                    }, 0);
                                return function() {
                                    window.clearTimeout(n), r.removeEventListener("pointerdown", t), r.removeEventListener("click", i.current)
                                }
                            }, [r, o]), {
                                onPointerDownCapture: function() {
                                    return a.current = !0
                                }
                            }
                        }(function(t) {
                            var n = t.target,
                                r = a2(p.branches).some(function(t) {
                                    return t.contains(n)
                                });
                            E && !r && (null == u || u(t), null == s || s(t), t.defaultPrevented || null == d || d())
                        }, y),
                        P = function(t) {
                            var n, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                                o = aK(t),
                                a = K.useRef(!1);
                            return K.useEffect(function() {
                                var t = function(t) {
                                    t.target && !a.current && ic("dismissableLayer.focusOutside", o, {
                                        originalEvent: t
                                    }, {
                                        discrete: !1
                                    })
                                };
                                return r.addEventListener("focusin", t),
                                    function() {
                                        return r.removeEventListener("focusin", t)
                                    }
                            }, [r, o]), {
                                onFocusCapture: function() {
                                    return a.current = !0
                                },
                                onBlurCapture: function() {
                                    return a.current = !1
                                }
                            }
                        }(function(t) {
                            var n = t.target;
                            a2(p.branches).some(function(t) {
                                return t.contains(n)
                            }) || (null == c || c(t), null == s || s(t), t.defaultPrevented || null == d || d())
                        }, y);
                    return function(t) {
                        var n, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                            o = aK(t);
                        K.useEffect(function() {
                            var t = function(t) {
                                "Escape" === t.key && o(t)
                            };
                            return r.addEventListener("keydown", t, {
                                    capture: !0
                                }),
                                function() {
                                    return r.removeEventListener("keydown", t, {
                                        capture: !0
                                    })
                                }
                        }, [o, r])
                    }(function(t) {
                        O === p.layers.size - 1 && (null == l || l(t), !t.defaultPrevented && d && (t.preventDefault(), d()))
                    }, y), K.useEffect(function() {
                        if (m) return i && (0 === p.layersWithOutsidePointerEventsDisabled.size && (ir = y.body.style.pointerEvents, y.body.style.pointerEvents = "none"), p.layersWithOutsidePointerEventsDisabled.add(m)), p.layers.add(m), iu(),
                            function() {
                                i && 1 === p.layersWithOutsidePointerEventsDisabled.size && (y.body.style.pointerEvents = ir)
                            }
                    }, [m, y, i, p]), K.useEffect(function() {
                        return function() {
                            m && (p.layers.delete(m), p.layersWithOutsidePointerEventsDisabled.delete(m), iu())
                        }
                    }, [m, p]), K.useEffect(function() {
                        var t = function() {
                            return b({})
                        };
                        return document.addEventListener(ia, t),
                            function() {
                                return document.removeEventListener(ia, t)
                            }
                    }, []), (0, z.jsx)(io.div, aJ(aQ({}, f), {
                        ref: g,
                        style: aQ({
                            pointerEvents: j ? E ? "auto" : "none" : void 0
                        }, t.style),
                        onFocusCapture: aH(t.onFocusCapture, P.onFocusCapture),
                        onBlurCapture: aH(t.onBlurCapture, P.onBlurCapture),
                        onPointerDownCapture: aH(t.onPointerDownCapture, C.onPointerDownCapture)
                    }))
                });

            function iu() {
                var t = new CustomEvent(ia);
                document.dispatchEvent(t)
            }

            function ic(t, n, r, o) {
                var a = o.discrete,
                    i = r.originalEvent.target,
                    l = new CustomEvent(t, {
                        bubbles: !1,
                        cancelable: !0,
                        detail: r
                    });
                n && i.addEventListener(t, n, {
                    once: !0
                }), a ? i && tO.flushSync(function() {
                    return i.dispatchEvent(l)
                }) : i.dispatchEvent(l)
            }
            il.displayName = "DismissableLayer", K.forwardRef(function(t, n) {
                var r = K.useContext(ii),
                    o = K.useRef(null),
                    a = az(n, o);
                return K.useEffect(function() {
                    var t = o.current;
                    if (t) return r.branches.add(t),
                        function() {
                            r.branches.delete(t)
                        }
                }, [r.branches]), (0, z.jsx)(io.div, aJ(aQ({}, t), {
                    ref: a
                }))
            }).displayName = "DismissableLayerBranch";
            var is = K["useId".toString()] || function() {},
                id = 0,
                ip = K.forwardRef(function(t, n) {
                    var r = t.children,
                        o = t.width,
                        a = t.height,
                        i = a0(t, ["children", "width", "height"]);
                    return (0, z.jsx)(io.svg, aJ(aQ({}, i), {
                        ref: n,
                        width: void 0 === o ? 10 : o,
                        height: void 0 === a ? 5 : a,
                        viewBox: "0 0 30 10",
                        preserveAspectRatio: "none",
                        children: t.asChild ? r : (0, z.jsx)("polygon", {
                            points: "0,0 30,0 15,10"
                        })
                    }))
                });
            ip.displayName = "Arrow";
            var iv = "Popper",
                im = a1(aV(iv), 2),
                ih = im[0],
                iy = im[1],
                ib = a1(ih(iv), 2),
                ig = ib[0],
                iw = ib[1],
                ix = function(t) {
                    var n = t.__scopePopper,
                        r = t.children,
                        o = a1(K.useState(null), 2),
                        a = o[0],
                        i = o[1];
                    return (0, z.jsx)(ig, {
                        scope: n,
                        anchor: a,
                        onAnchorChange: i,
                        children: r
                    })
                };
            ix.displayName = iv;
            var iS = "PopperAnchor",
                iO = K.forwardRef(function(t, n) {
                    var r = t.__scopePopper,
                        o = t.virtualRef,
                        a = a0(t, ["__scopePopper", "virtualRef"]),
                        i = iw(iS, r),
                        l = K.useRef(null),
                        u = az(n, l);
                    return K.useEffect(function() {
                        i.onAnchorChange((null == o ? void 0 : o.current) || l.current)
                    }), o ? null : (0, z.jsx)(io.div, aJ(aQ({}, a), {
                        ref: u
                    }))
                });
            iO.displayName = iS;
            var ij = "PopperContent",
                iE = a1(ih(ij), 2),
                iC = iE[0],
                iP = iE[1],
                iA = K.forwardRef(function(t, n) {
                    var r, o, a, i, l, u, c, s, d, f, p, v = t.__scopePopper,
                        m = t.side,
                        h = t.sideOffset,
                        y = t.align,
                        b = void 0 === y ? "center" : y,
                        g = t.alignOffset,
                        w = t.arrowPadding,
                        x = t.avoidCollisions,
                        S = void 0 === x || x,
                        O = t.collisionBoundary,
                        j = void 0 === O ? [] : O,
                        E = t.collisionPadding,
                        C = void 0 === E ? 0 : E,
                        P = t.sticky,
                        A = t.hideWhenDetached,
                        T = t.updatePositionStrategy,
                        R = void 0 === T ? "optimized" : T,
                        N = t.onPlaced,
                        I = a0(t, ["__scopePopper", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "avoidCollisions", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "updatePositionStrategy", "onPlaced"]),
                        k = iw(ij, v),
                        D = a1(K.useState(null), 2),
                        L = D[0],
                        M = D[1],
                        _ = az(n, function(t) {
                            return M(t)
                        }),
                        F = a1(K.useState(null), 2),
                        U = F[0],
                        W = F[1],
                        V = (o = (r = aM(K.useState(void 0), 2))[0], a = r[1], aq(function() {
                            if (U) {
                                a({
                                    width: U.offsetWidth,
                                    height: U.offsetHeight
                                });
                                var t = new ResizeObserver(function(t) {
                                    if (Array.isArray(t) && t.length) {
                                        var n, r, o = t[0];
                                        if ("borderBoxSize" in o) {
                                            var i = o.borderBoxSize,
                                                l = Array.isArray(i) ? i[0] : i;
                                            n = l.inlineSize, r = l.blockSize
                                        } else n = U.offsetWidth, r = U.offsetHeight;
                                        a({
                                            width: n,
                                            height: r
                                        })
                                    }
                                });
                                return t.observe(U, {
                                        box: "border-box"
                                    }),
                                    function() {
                                        return t.unobserve(U)
                                    }
                            }
                            a(void 0)
                        }, [U]), o),
                        B = null != (f = null == V ? void 0 : V.width) ? f : 0,
                        H = null != (p = null == V ? void 0 : V.height) ? p : 0,
                        q = "number" == typeof C ? C : aQ({
                            top: 0,
                            right: 0,
                            bottom: 0,
                            left: 0
                        }, C),
                        X = Array.isArray(j) ? j : [j],
                        $ = X.length > 0,
                        Y = {
                            padding: q,
                            boundary: X.filter(iI),
                            altBoundary: $
                        },
                        G = oU({
                            strategy: "fixed",
                            placement: (void 0 === m ? "bottom" : m) + ("center" !== b ? "-" + b : ""),
                            whileElementsMounted: function() {
                                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                return oN.apply(void 0, a2(n).concat([{
                                    animationFrame: "always" === R
                                }]))
                            },
                            elements: {
                                reference: k.anchor
                            },
                            middleware: [oW({
                                mainAxis: (void 0 === h ? 0 : h) + H,
                                alignmentAxis: void 0 === g ? 0 : g
                            }), S && oz(aQ({
                                mainAxis: !0,
                                crossAxis: !1,
                                limiter: "partial" === (void 0 === P ? "partial" : P) ? oV() : void 0
                            }, Y)), S && oB(aQ({}, Y)), oH(aJ(aQ({}, Y), {
                                apply: function(t) {
                                    var n = t.elements,
                                        r = t.rects,
                                        o = t.availableWidth,
                                        a = t.availableHeight,
                                        i = r.reference,
                                        l = i.width,
                                        u = i.height,
                                        c = n.floating.style;
                                    c.setProperty("--radix-popper-available-width", "".concat(o, "px")), c.setProperty("--radix-popper-available-height", "".concat(a, "px")), c.setProperty("--radix-popper-anchor-width", "".concat(l, "px")), c.setProperty("--radix-popper-anchor-height", "".concat(u, "px"))
                                }
                            })), U && oq({
                                element: U,
                                padding: void 0 === w ? 0 : w
                            }), ik({
                                arrowWidth: B,
                                arrowHeight: H
                            }), void 0 !== A && A && oK(aQ({
                                strategy: "referenceHidden"
                            }, Y))]
                        }),
                        Z = G.refs,
                        Q = G.floatingStyles,
                        J = G.placement,
                        ee = G.isPositioned,
                        et = G.middlewareData,
                        en = a1(iD(J), 2),
                        er = en[0],
                        eo = en[1],
                        ea = aK(N);
                    aq(function() {
                        ee && (null == ea || ea())
                    }, [ee, ea]);
                    var ei = null == (i = et.arrow) ? void 0 : i.x,
                        el = null == (l = et.arrow) ? void 0 : l.y,
                        eu = 0 !== (null == (u = et.arrow) ? void 0 : u.centerOffset),
                        ec = a1(K.useState(), 2),
                        es = ec[0],
                        ed = ec[1];
                    return aq(function() {
                        L && ed(window.getComputedStyle(L).zIndex)
                    }, [L]), (0, z.jsx)("div", {
                        ref: Z.setFloating,
                        "data-radix-popper-content-wrapper": "",
                        style: aQ(aJ(aQ({}, Q), {
                            transform: ee ? Q.transform : "translate(0, -200%)",
                            minWidth: "max-content",
                            zIndex: es,
                            "--radix-popper-transform-origin": [null == (c = et.transformOrigin) ? void 0 : c.x, null == (s = et.transformOrigin) ? void 0 : s.y].join(" ")
                        }), (null == (d = et.hide) ? void 0 : d.referenceHidden) && {
                            visibility: "hidden",
                            pointerEvents: "none"
                        }),
                        dir: t.dir,
                        children: (0, z.jsx)(iC, {
                            scope: v,
                            placedSide: er,
                            onArrowChange: W,
                            arrowX: ei,
                            arrowY: el,
                            shouldHideArrow: eu,
                            children: (0, z.jsx)(io.div, aJ(aQ({
                                "data-side": er,
                                "data-align": eo
                            }, I), {
                                ref: _,
                                style: aJ(aQ({}, I.style), {
                                    animation: ee ? void 0 : "none"
                                })
                            }))
                        })
                    })
                });
            iA.displayName = ij;
            var iT = "PopperArrow",
                iR = {
                    top: "bottom",
                    right: "left",
                    bottom: "top",
                    left: "right"
                },
                iN = K.forwardRef(function(t, n) {
                    var r, o = t.__scopePopper,
                        a = a0(t, ["__scopePopper"]),
                        i = iP(iT, o),
                        l = iR[i.placedSide];
                    return (0, z.jsx)("span", {
                        ref: i.onArrowChange,
                        style: (aZ(r = {
                            position: "absolute",
                            left: i.arrowX,
                            top: i.arrowY
                        }, l, 0), aZ(r, "transformOrigin", {
                            top: "",
                            right: "0 0",
                            bottom: "center 0",
                            left: "100% 0"
                        } [i.placedSide]), aZ(r, "transform", {
                            top: "translateY(100%)",
                            right: "translateY(50%) rotate(90deg) translateX(-50%)",
                            bottom: "rotate(180deg)",
                            left: "translateY(50%) rotate(-90deg) translateX(50%)"
                        } [i.placedSide]), aZ(r, "visibility", i.shouldHideArrow ? "hidden" : void 0), r),
                        children: (0, z.jsx)(ip, aJ(aQ({}, a), {
                            ref: n,
                            style: aJ(aQ({}, a.style), {
                                display: "block"
                            })
                        }))
                    })
                });

            function iI(t) {
                return null !== t
            }
            iN.displayName = iT;
            var ik = function(t) {
                return {
                    name: "transformOrigin",
                    options: t,
                    fn: function(n) {
                        var r, o, a, i, l, u = n.placement,
                            c = n.rects,
                            s = n.middlewareData,
                            d = 0 !== (null == (r = s.arrow) ? void 0 : r.centerOffset),
                            f = d ? 0 : t.arrowWidth,
                            p = d ? 0 : t.arrowHeight,
                            v = a1(iD(u), 2),
                            m = v[0],
                            h = {
                                start: "0%",
                                center: "50%",
                                end: "100%"
                            } [v[1]],
                            y = (null != (i = null == (o = s.arrow) ? void 0 : o.x) ? i : 0) + f / 2,
                            b = (null != (l = null == (a = s.arrow) ? void 0 : a.y) ? l : 0) + p / 2,
                            g = "",
                            w = "";
                        return "bottom" === m ? (g = d ? h : "".concat(y, "px"), w = -p + "px") : "top" === m ? (g = d ? h : "".concat(y, "px"), w = "".concat(c.floating.height + p, "px")) : "right" === m ? (g = -p + "px", w = d ? h : "".concat(b, "px")) : "left" === m && (g = "".concat(c.floating.width + p, "px"), w = d ? h : "".concat(b, "px")), {
                            data: {
                                x: g,
                                y: w
                            }
                        }
                    }
                }
            };

            function iD(t) {
                var n = a1(t.split("-"), 2),
                    r = n[0],
                    o = n[1];
                return [r, void 0 === o ? "center" : o]
            }
            var iL = K.forwardRef(function(t, n) {
                var r, o, a = t.container,
                    i = a0(t, ["container"]),
                    l = a1(K.useState(!1), 2),
                    u = l[0],
                    c = l[1];
                aq(function() {
                    return c(!0)
                }, []);
                var s = a || u && (null == (o = globalThis) || null == (r = o.document) ? void 0 : r.body);
                return s ? tj().createPortal((0, z.jsx)(io.div, aJ(aQ({}, i), {
                    ref: n
                })), s) : null
            });
            iL.displayName = "Portal";
            var iM = K.forwardRef(function(t, n) {
                return (0, z.jsx)(io.span, aJ(aQ({}, t), {
                    ref: n,
                    style: aQ({
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
                    }, t.style)
                }))
            });
            iM.displayName = "VisuallyHidden";
            var i_ = a1(aV("Tooltip", [iy]), 2),
                iF = i_[0],
                iU = (i_[1], iy()),
                iW = "TooltipProvider",
                iz = "tooltip.open",
                iV = a1(iF(iW), 2),
                iB = iV[0],
                iH = iV[1],
                iK = function(t) {
                    var n = t.__scopeTooltip,
                        r = t.delayDuration,
                        o = t.skipDelayDuration,
                        a = void 0 === o ? 300 : o,
                        i = t.disableHoverableContent,
                        l = t.children,
                        u = a1(K.useState(!0), 2),
                        c = u[0],
                        s = u[1],
                        d = K.useRef(!1),
                        f = K.useRef(0);
                    return K.useEffect(function() {
                        var t = f.current;
                        return function() {
                            return window.clearTimeout(t)
                        }
                    }, []), (0, z.jsx)(iB, {
                        scope: n,
                        isOpenDelayed: c,
                        delayDuration: void 0 === r ? 700 : r,
                        onOpen: K.useCallback(function() {
                            window.clearTimeout(f.current), s(!1)
                        }, []),
                        onClose: K.useCallback(function() {
                            window.clearTimeout(f.current), f.current = window.setTimeout(function() {
                                return s(!0)
                            }, a)
                        }, [a]),
                        isPointerInTransitRef: d,
                        onPointerInTransitChange: K.useCallback(function(t) {
                            d.current = t
                        }, []),
                        disableHoverableContent: void 0 !== i && i,
                        children: l
                    })
                };
            iK.displayName = iW;
            var iq = "Tooltip",
                iX = a1(iF(iq), 2),
                i$ = iX[0],
                iY = iX[1],
                iG = function(t) {
                    var n, r, o, a, i, l, u, c, s, d, f, p, v, m, h, y, b, g, w, x, S, O = t.__scopeTooltip,
                        j = t.children,
                        E = t.open,
                        C = t.defaultOpen,
                        P = t.onOpenChange,
                        A = t.disableHoverableContent,
                        T = t.delayDuration,
                        R = iH(iq, t.__scopeTooltip),
                        N = iU(O),
                        I = a1(K.useState(null), 2),
                        k = I[0],
                        D = I[1],
                        L = (o = (r = a1(K.useState(is()), 2))[0], a = r[1], aq(function() {
                            a(function(t) {
                                return null != t ? t : String(id++)
                            })
                        }, [n]), n || (o ? "radix-".concat(o) : "")),
                        M = K.useRef(0),
                        _ = null != A ? A : R.disableHoverableContent,
                        F = null != T ? T : R.delayDuration,
                        U = K.useRef(!1),
                        W = a1((l = (i = {
                            prop: E,
                            defaultProp: void 0 !== C && C,
                            onChange: function(t) {
                                t ? (R.onOpen(), document.dispatchEvent(new CustomEvent(iz))) : R.onClose(), null == P || P(t)
                            }
                        }).prop, b = (y = aM((d = (s = {
                            defaultProp: i.defaultProp,
                            onChange: c = void 0 === (u = i.onChange) ? function() {} : u
                        }).defaultProp, f = s.onChange, v = aM(p = K.useState(d), 1)[0], m = K.useRef(v), h = aK(f), K.useEffect(function() {
                            m.current !== v && (h(v), m.current = v)
                        }, [v, m, h]), p), 2))[0], g = y[1], x = (w = void 0 !== l) ? l : b, S = aK(c), [x, K.useCallback(function(t) {
                            if (w) {
                                var n = "function" == typeof t ? t(l) : t;
                                n !== l && S(n)
                            } else g(t)
                        }, [w, l, g, S])]), 2),
                        V = W[0],
                        B = void 0 !== V && V,
                        H = W[1],
                        q = K.useMemo(function() {
                            return B ? U.current ? "delayed-open" : "instant-open" : "closed"
                        }, [B]),
                        X = K.useCallback(function() {
                            window.clearTimeout(M.current), M.current = 0, U.current = !1, H(!0)
                        }, [H]),
                        $ = K.useCallback(function() {
                            window.clearTimeout(M.current), M.current = 0, H(!1)
                        }, [H]),
                        Y = K.useCallback(function() {
                            window.clearTimeout(M.current), M.current = window.setTimeout(function() {
                                U.current = !0, H(!0), M.current = 0
                            }, F)
                        }, [F, H]);
                    return K.useEffect(function() {
                        return function() {
                            M.current && (window.clearTimeout(M.current), M.current = 0)
                        }
                    }, []), (0, z.jsx)(ix, aJ(aQ({}, N), {
                        children: (0, z.jsx)(i$, {
                            scope: O,
                            contentId: L,
                            open: B,
                            stateAttribute: q,
                            trigger: k,
                            onTriggerChange: D,
                            onTriggerEnter: K.useCallback(function() {
                                R.isOpenDelayed ? Y() : X()
                            }, [R.isOpenDelayed, Y, X]),
                            onTriggerLeave: K.useCallback(function() {
                                _ ? $() : (window.clearTimeout(M.current), M.current = 0)
                            }, [$, _]),
                            onOpen: X,
                            onClose: $,
                            disableHoverableContent: _,
                            children: j
                        })
                    }))
                };
            iG.displayName = iq;
            var iZ = "TooltipTrigger",
                iQ = K.forwardRef(function(t, n) {
                    var r = t.__scopeTooltip,
                        o = a0(t, ["__scopeTooltip"]),
                        a = iY(iZ, r),
                        i = iH(iZ, r),
                        l = iU(r),
                        u = az(n, K.useRef(null), a.onTriggerChange),
                        c = K.useRef(!1),
                        s = K.useRef(!1),
                        d = K.useCallback(function() {
                            return c.current = !1
                        }, []);
                    return K.useEffect(function() {
                        return function() {
                            return document.removeEventListener("pointerup", d)
                        }
                    }, [d]), (0, z.jsx)(iO, aJ(aQ({
                        asChild: !0
                    }, l), {
                        children: (0, z.jsx)(io.button, aJ(aQ({
                            "aria-describedby": a.open ? a.contentId : void 0,
                            "data-state": a.stateAttribute
                        }, o), {
                            ref: u,
                            onPointerMove: aH(t.onPointerMove, function(t) {
                                "touch" !== t.pointerType && (s.current || i.isPointerInTransitRef.current || (a.onTriggerEnter(), s.current = !0))
                            }),
                            onPointerLeave: aH(t.onPointerLeave, function() {
                                a.onTriggerLeave(), s.current = !1
                            }),
                            onPointerDown: aH(t.onPointerDown, function() {
                                c.current = !0, document.addEventListener("pointerup", d, {
                                    once: !0
                                })
                            }),
                            onFocus: aH(t.onFocus, function() {
                                c.current || a.onOpen()
                            }),
                            onBlur: aH(t.onBlur, a.onClose),
                            onClick: aH(t.onClick, a.onClose)
                        }))
                    }))
                });
            iQ.displayName = iZ;
            var iJ = "TooltipPortal",
                i0 = a1(iF(iJ, {
                    forceMount: void 0
                }), 2),
                i1 = i0[0],
                i2 = i0[1],
                i3 = function(t) {
                    var n = t.__scopeTooltip,
                        r = t.forceMount,
                        o = t.children,
                        a = t.container,
                        i = iY(iJ, n);
                    return (0, z.jsx)(i1, {
                        scope: n,
                        forceMount: r,
                        children: (0, z.jsx)(aX, {
                            present: r || i.open,
                            children: (0, z.jsx)(iL, {
                                asChild: !0,
                                container: a,
                                children: o
                            })
                        })
                    })
                };
            i3.displayName = iJ;
            var i4 = "TooltipContent",
                i5 = K.forwardRef(function(t, n) {
                    var r = i2(i4, t.__scopeTooltip),
                        o = t.forceMount,
                        a = void 0 === o ? r.forceMount : o,
                        i = t.side,
                        l = void 0 === i ? "top" : i,
                        u = a0(t, ["forceMount", "side"]),
                        c = iY(i4, t.__scopeTooltip);
                    return (0, z.jsx)(aX, {
                        present: a || c.open,
                        children: c.disableHoverableContent ? (0, z.jsx)(le, aJ(aQ({
                            side: l
                        }, u), {
                            ref: n
                        })) : (0, z.jsx)(i6, aJ(aQ({
                            side: l
                        }, u), {
                            ref: n
                        }))
                    })
                }),
                i6 = K.forwardRef(function(t, n) {
                    var r = iY(i4, t.__scopeTooltip),
                        o = iH(i4, t.__scopeTooltip),
                        a = K.useRef(null),
                        i = az(n, a),
                        l = a1(K.useState(null), 2),
                        u = l[0],
                        c = l[1],
                        s = r.trigger,
                        d = r.onClose,
                        f = a.current,
                        p = o.onPointerInTransitChange,
                        v = K.useCallback(function() {
                            c(null), p(!1)
                        }, [p]),
                        m = K.useCallback(function(t, n) {
                            var r, o, a, i, l, u, s = t.currentTarget,
                                d = {
                                    x: t.clientX,
                                    y: t.clientY
                                };
                            c(((u = a2(function(t, n) {
                                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 5,
                                    o = [];
                                switch (n) {
                                    case "top":
                                        o.push({
                                            x: t.x - r,
                                            y: t.y + r
                                        }, {
                                            x: t.x + r,
                                            y: t.y + r
                                        });
                                        break;
                                    case "bottom":
                                        o.push({
                                            x: t.x - r,
                                            y: t.y - r
                                        }, {
                                            x: t.x + r,
                                            y: t.y - r
                                        });
                                        break;
                                    case "left":
                                        o.push({
                                            x: t.x + r,
                                            y: t.y - r
                                        }, {
                                            x: t.x + r,
                                            y: t.y + r
                                        });
                                        break;
                                    case "right":
                                        o.push({
                                            x: t.x - r,
                                            y: t.y - r
                                        }, {
                                            x: t.x - r,
                                            y: t.y + r
                                        })
                                }
                                return o
                            }(d, function(t, n) {
                                var r = Math.abs(n.top - t.y),
                                    o = Math.abs(n.bottom - t.y),
                                    a = Math.abs(n.right - t.x),
                                    i = Math.abs(n.left - t.x);
                                switch (Math.min(r, o, a, i)) {
                                    case i:
                                        return "left";
                                    case a:
                                        return "right";
                                    case r:
                                        return "top";
                                    case o:
                                        return "bottom";
                                    default:
                                        throw Error("unreachable")
                                }
                            }(d, s.getBoundingClientRect()))).concat(a2((o = (r = n.getBoundingClientRect()).top, a = r.right, i = r.bottom, [{
                                x: l = r.left,
                                y: o
                            }, {
                                x: a,
                                y: o
                            }, {
                                x: a,
                                y: i
                            }, {
                                x: l,
                                y: i
                            }]))).slice()).sort(function(t, n) {
                                return t.x < n.x ? -1 : t.x > n.x ? 1 : t.y < n.y ? -1 : +(t.y > n.y)
                            }), function(t) {
                                if (t.length <= 1) return t.slice();
                                for (var n = [], r = 0; r < t.length; r++) {
                                    for (var o = t[r]; n.length >= 2;) {
                                        var a = n[n.length - 1],
                                            i = n[n.length - 2];
                                        if (!((a.x - i.x) * (o.y - i.y) >= (a.y - i.y) * (o.x - i.x))) break;
                                        n.pop()
                                    }
                                    n.push(o)
                                }
                                n.pop();
                                for (var l = [], u = t.length - 1; u >= 0; u--) {
                                    for (var c = t[u]; l.length >= 2;) {
                                        var s = l[l.length - 1],
                                            d = l[l.length - 2];
                                        if (!((s.x - d.x) * (c.y - d.y) >= (s.y - d.y) * (c.x - d.x))) break;
                                        l.pop()
                                    }
                                    l.push(c)
                                }
                                return l.pop(), 1 === n.length && 1 === l.length && n[0].x === l[0].x && n[0].y === l[0].y ? n : n.concat(l)
                            }(u))), p(!0)
                        }, [p]);
                    return K.useEffect(function() {
                        return function() {
                            return v()
                        }
                    }, [v]), K.useEffect(function() {
                        if (s && f) {
                            var t = function(t) {
                                    return m(t, f)
                                },
                                n = function(t) {
                                    return m(t, s)
                                };
                            return s.addEventListener("pointerleave", t), f.addEventListener("pointerleave", n),
                                function() {
                                    s.removeEventListener("pointerleave", t), f.removeEventListener("pointerleave", n)
                                }
                        }
                    }, [s, f, m, v]), K.useEffect(function() {
                        if (u) {
                            var t = function(t) {
                                var n = t.target,
                                    r = {
                                        x: t.clientX,
                                        y: t.clientY
                                    },
                                    o = (null == s ? void 0 : s.contains(n)) || (null == f ? void 0 : f.contains(n)),
                                    a = ! function(t, n) {
                                        for (var r = t.x, o = t.y, a = !1, i = 0, l = n.length - 1; i < n.length; l = i++) {
                                            var u = n[i].x,
                                                c = n[i].y,
                                                s = n[l].x,
                                                d = n[l].y;
                                            c > o != d > o && r < (s - u) * (o - c) / (d - c) + u && (a = !a)
                                        }
                                        return a
                                    }(r, u);
                                o ? v() : a && (v(), d())
                            };
                            return document.addEventListener("pointermove", t),
                                function() {
                                    return document.removeEventListener("pointermove", t)
                                }
                        }
                    }, [s, f, u, d, v]), (0, z.jsx)(le, aJ(aQ({}, t), {
                        ref: i
                    }))
                }),
                i8 = a1(iF(iq, {
                    isInside: !1
                }), 2),
                i7 = i8[0],
                i9 = i8[1],
                le = K.forwardRef(function(t, n) {
                    var r = t.__scopeTooltip,
                        o = t.children,
                        a = t["aria-label"],
                        i = t.onEscapeKeyDown,
                        l = t.onPointerDownOutside,
                        u = a0(t, ["__scopeTooltip", "children", "aria-label", "onEscapeKeyDown", "onPointerDownOutside"]),
                        c = iY(i4, r),
                        s = iU(r),
                        d = c.onClose;
                    return K.useEffect(function() {
                        return document.addEventListener(iz, d),
                            function() {
                                return document.removeEventListener(iz, d)
                            }
                    }, [d]), K.useEffect(function() {
                        if (c.trigger) {
                            var t = function(t) {
                                var n;
                                (null == (n = t.target) ? void 0 : n.contains(c.trigger)) && d()
                            };
                            return window.addEventListener("scroll", t, {
                                    capture: !0
                                }),
                                function() {
                                    return window.removeEventListener("scroll", t, {
                                        capture: !0
                                    })
                                }
                        }
                    }, [c.trigger, d]), (0, z.jsx)(il, {
                        asChild: !0,
                        disableOutsidePointerEvents: !1,
                        onEscapeKeyDown: i,
                        onPointerDownOutside: l,
                        onFocusOutside: function(t) {
                            return t.preventDefault()
                        },
                        onDismiss: d,
                        children: (0, z.jsxs)(iA, aJ(aQ({
                            "data-state": c.stateAttribute
                        }, s, u), {
                            ref: n,
                            style: aJ(aQ({}, u.style), {
                                "--radix-tooltip-content-transform-origin": "var(--radix-popper-transform-origin)",
                                "--radix-tooltip-content-available-width": "var(--radix-popper-available-width)",
                                "--radix-tooltip-content-available-height": "var(--radix-popper-available-height)",
                                "--radix-tooltip-trigger-width": "var(--radix-popper-anchor-width)",
                                "--radix-tooltip-trigger-height": "var(--radix-popper-anchor-height)"
                            }),
                            children: [(0, z.jsx)(a6, {
                                children: o
                            }), (0, z.jsx)(i7, {
                                scope: r,
                                isInside: !0,
                                children: (0, z.jsx)(iM, {
                                    id: c.contentId,
                                    role: "tooltip",
                                    children: a || o
                                })
                            })]
                        }))
                    })
                });
            i5.displayName = i4;
            var lt = "TooltipArrow",
                ln = K.forwardRef(function(t, n) {
                    var r = t.__scopeTooltip,
                        o = a0(t, ["__scopeTooltip"]),
                        a = iU(r);
                    return i9(lt, r).isInside ? null : (0, z.jsx)(iN, aJ(aQ({}, a, o), {
                        ref: n
                    }))
                });

            function lr(t) {
                var n = t.position,
                    r = t.hasBeak,
                    o = t.title,
                    a = t.description,
                    i = t.ariaLabel,
                    l = t.delayDurationMs,
                    u = t.children,
                    c = t.open,
                    s = t.onOpenChange,
                    d = t.contentClassName,
                    f = a1(n.split("-"), 2),
                    p = f[0],
                    v = f[1],
                    m = null != i ? i : "string" == typeof o && null == a ? o : void 0;
                return K.createElement(iK, {
                    delayDuration: void 0 === l ? 500 : l
                }, K.createElement(iG, {
                    open: c,
                    onOpenChange: s
                }, u, K.createElement(i3, null, K.createElement(i5, {
                    side: p,
                    align: v,
                    "aria-label": m,
                    className: tS("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", d),
                    sideOffset: 5
                }, (void 0 === r || r) && K.createElement(ln, {
                    asChild: !0
                }, K.createElement(aY, {
                    className: "content-[var(--inverse-surface-0)]"
                })), K.createElement("div", {
                    className: "flex flex-col text-truncate-split"
                }, K.createElement("div", {
                    className: "text-caption-medium content-inverse-default"
                }, o), a && K.createElement("div", {
                    className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
                }, a))))))
            }

            function lo(t) {
                var n = t.children,
                    r = t.asChild,
                    o = t.className;
                return K.createElement(iQ, {
                    asChild: r,
                    className: o
                }, n)
            }
            ln.displayName = lt;
            var la = function(t) {
                    var n = t.title,
                        r = t.description,
                        o = t.position;
                    return q().createElement(lr, {
                        position: void 0 === o ? "top-center" : o,
                        title: n,
                        description: r
                    }, q().createElement(lo, {
                        asChild: !0
                    }, q().createElement("span", {
                        role: "button",
                        tabIndex: 0,
                        "aria-label": n,
                        className: "flex items-center content-muted",
                        "data-testid": "label-tooltip-trigger"
                    }, q().createElement(aI, {
                        name: "icon-regular-circle-i",
                        size: "Small"
                    }))))
                },
                li = {
                    Standard: "bg-none",
                    Contrast: "bg-shift-200",
                    Utility: "bg-none"
                },
                ll = {
                    Standard: "stroke-standard",
                    Contrast: "stroke-none",
                    Utility: "stroke-none"
                };

            function lu(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function lc(t) {
                if (Array.isArray(t)) return t
            }

            function ls(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function ld(t) {
                if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
            }

            function lf() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function lp(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        ls(t, n, r[n])
                    })
                }
                return t
            }

            function lv(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function lm(t, n) {
                if (null == t) return {};
                var r, o, a = function(t, n) {
                    if (null == t) return {};
                    var r, o, a = {},
                        i = Object.keys(t);
                    for (o = 0; o < i.length; o++) r = i[o], n.indexOf(r) >= 0 || (a[r] = t[r]);
                    return a
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(t);
                    for (o = 0; o < i.length; o++) r = i[o], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (a[r] = t[r])
                }
                return a
            }

            function lh(t, n) {
                return lc(t) || function(t, n) {
                    var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var i = [],
                            l = !0,
                            u = !1;
                        try {
                            for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            u = !0, o = t
                        } finally {
                            try {
                                l || null == a.return || a.return()
                            } finally {
                                if (u) throw o
                            }
                        }
                        return i
                    }
                }(t, n) || lb(t, n) || lf()
            }

            function ly(t) {
                return function(t) {
                    if (Array.isArray(t)) return lu(t)
                }(t) || ld(t) || lb(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function lb(t, n) {
                if (t) {
                    if ("string" == typeof t) return lu(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return lu(t, n)
                }
            }

            function lg(t, n) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    o = r.checkForDefaultPrevented,
                    a = void 0 === o || o;
                return function(r) {
                    if (null == t || t(r), !1 === a || !r.defaultPrevented) return null == n ? void 0 : n(r)
                }
            }

            function lw(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }

            function lx() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return function(t) {
                    var r = !1,
                        o = n.map(function(n) {
                            var o = lw(n, t);
                            return r || "function" != typeof o || (r = !0), o
                        });
                    if (r) return function() {
                        for (var t = 0; t < o.length; t++) {
                            var r = o[t];
                            "function" == typeof r ? r() : lw(n[t], null)
                        }
                    }
                }
            }

            function lS() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return K.useCallback(lx.apply(void 0, ly(n)), n)
            }

            function lO() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                var o = n[0];
                if (1 === n.length) return o;
                var a = function() {
                    var t = n.map(function(t) {
                        return {
                            useScope: t(),
                            scopeName: t.scopeName
                        }
                    });
                    return function(n) {
                        var r = t.reduce(function(t, r) {
                            var o = r.useScope,
                                a = r.scopeName;
                            return lp({}, t, o(n)["__scope".concat(a)])
                        }, {});
                        return K.useMemo(function() {
                            return ls({}, "__scope".concat(o.scopeName), r)
                        }, [r])
                    }
                };
                return a.scopeName = o.scopeName, a
            }

            function lj(t) {
                var n, r, o = (n = t, (r = K.forwardRef(function(t, n) {
                        var r = t.children,
                            o = lm(t, ["children"]);
                        if (K.isValidElement(r)) {
                            var a, i, l, u = (l = null == (a = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (i = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                c = function(t, n) {
                                    var r = lp({}, n);
                                    for (var o in n) ! function(o) {
                                        var a = t[o],
                                            i = n[o];
                                        /^on[A-Z]/.test(o) ? a && i ? r[o] = function() {
                                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                            i.apply(void 0, ly(n)), a.apply(void 0, ly(n))
                                        } : a && (r[o] = a) : "style" === o ? r[o] = lp({}, a, i) : "className" === o && (r[o] = [a, i].filter(Boolean).join(" "))
                                    }(o);
                                    return lp({}, t, r)
                                }(o, r.props);
                            return r.type !== K.Fragment && (c.ref = n ? lx(n, u) : u), K.cloneElement(r, c)
                        }
                        return K.Children.count(r) > 1 ? K.Children.only(null) : null
                    })).displayName = "".concat(n, ".SlotClone"), r),
                    a = K.forwardRef(function(t, n) {
                        var r = t.children,
                            a = lm(t, ["children"]),
                            i = K.Children.toArray(r),
                            l = i.find(lC);
                        if (l) {
                            var u = l.props.children,
                                c = i.map(function(t) {
                                    return t === l ? K.Children.count(u) > 1 ? K.Children.only(null) : K.isValidElement(u) ? u.props.children : null : t
                                });
                            return (0, z.jsx)(o, lv(lp({}, a), {
                                ref: n,
                                children: K.isValidElement(u) ? K.cloneElement(u, void 0, c) : null
                            }))
                        }
                        return (0, z.jsx)(o, lv(lp({}, a), {
                            ref: n,
                            children: r
                        }))
                    });
                return a.displayName = "".concat(t, ".Slot"), a
            }
            var lE = Symbol("radix.slottable");

            function lC(t) {
                return K.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === lE
            }
            var lP = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                var r = lj("Primitive.".concat(n)),
                    o = K.forwardRef(function(t, o) {
                        var a = t.asChild,
                            i = lm(t, ["asChild"]),
                            l = a ? r : n;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, z.jsx)(l, lv(lp({}, i), {
                            ref: o
                        }))
                    });
                return o.displayName = "Primitive.".concat(n), lv(lp({}, t), ls({}, n, o))
            }, {});

            function lA(t) {
                var n = K.useRef(t);
                return K.useEffect(function() {
                    n.current = t
                }), K.useMemo(function() {
                    return function() {
                        for (var t, r = arguments.length, o = Array(r), a = 0; a < r; a++) o[a] = arguments[a];
                        return null == (t = n.current) ? void 0 : t.call.apply(t, [n].concat(ly(o)))
                    }
                }, [])
            }

            function lT(t) {
                var n, r, o, a, i, l, u, c = t.prop,
                    s = t.defaultProp,
                    d = t.onChange,
                    f = void 0 === d ? function() {} : d,
                    p = lh((r = (n = {
                        defaultProp: s,
                        onChange: f
                    }).defaultProp, o = n.onChange, i = lh(a = K.useState(r), 1)[0], l = K.useRef(i), u = lA(o), K.useEffect(function() {
                        l.current !== i && (u(i), l.current = i)
                    }, [i, l, u]), a), 2),
                    v = p[0],
                    m = p[1],
                    h = void 0 !== c,
                    y = h ? c : v,
                    b = lA(f);
                return [y, K.useCallback(function(t) {
                    if (h) {
                        var n = "function" == typeof t ? t(c) : t;
                        n !== c && b(n)
                    } else m(t)
                }, [h, c, m, b])]
            }
            var lR = (null == (F = globalThis) ? void 0 : F.document) ? K.useLayoutEffect : function() {},
                lN = K.forwardRef(function(t, n) {
                    return (0, z.jsx)(lP.span, lv(lp({}, t), {
                        ref: n,
                        style: lp({
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
                        }, t.style)
                    }))
                });
            lN.displayName = "VisuallyHidden";
            var lI = [" ", "Enter", "ArrowUp", "ArrowDown"],
                lk = [" ", "Enter"],
                lD = "Select",
                lL = lh((a = (o = tI(function(t) {
                    var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        o = function() {
                            var n = r.map(function(t) {
                                return K.createContext(t)
                            });
                            return function(r) {
                                var o = (null == r ? void 0 : r[t]) || n;
                                return K.useMemo(function() {
                                    return tA({}, "__scope".concat(t), tR(tT({}, r), tA({}, t, o)))
                                }, [r, o])
                            }
                        };
                    return o.scopeName = t, [function(n, o) {
                        var a = K.createContext(o),
                            i = r.length;
                        r = tk(r).concat([o]);
                        var l = function(n) {
                            var r, o = n.scope,
                                l = n.children,
                                u = tN(n, ["scope", "children"]),
                                c = (null == o || null == (r = o[t]) ? void 0 : r[i]) || a,
                                s = K.useMemo(function() {
                                    return u
                                }, Object.values(u));
                            return (0, z.jsx)(c.Provider, {
                                value: s,
                                children: l
                            })
                        };
                        return l.displayName = n + "Provider", [l, function(r, l) {
                            var u, c = (null == l || null == (u = l[t]) ? void 0 : u[i]) || a,
                                s = K.useContext(c);
                            if (s) return s;
                            if (void 0 !== o) return o;
                            throw Error("`".concat(r, "` must be used within `").concat(n, "`"))
                        }]
                    }, tL.apply(void 0, [o].concat(tk(n)))]
                }(n = lD + "CollectionProvider"), 2))[0], i = o[1], u = (l = tI(a(n, {
                    collectionRef: {
                        current: null
                    },
                    itemMap: new Map
                }), 2))[0], c = l[1], (s = function(t) {
                    var n = t.scope,
                        r = t.children,
                        o = q().useRef(null),
                        a = q().useRef(new Map).current;
                    return (0, z.jsx)(u, {
                        scope: n,
                        itemMap: a,
                        collectionRef: o,
                        children: r
                    })
                }).displayName = n, f = tU(d = lD + "CollectionSlot"), (p = q().forwardRef(function(t, n) {
                    var r = t.scope,
                        o = t.children,
                        a = tF(n, c(d, r).collectionRef);
                    return (0, z.jsx)(f, {
                        ref: a,
                        children: o
                    })
                })).displayName = d, m = "data-radix-collection-item", h = tU(v = lD + "CollectionItemSlot"), (y = q().forwardRef(function(t, n) {
                    var r, o = t.scope,
                        a = t.children,
                        i = tN(t, ["scope", "children"]),
                        l = q().useRef(null),
                        u = tF(n, l),
                        s = c(v, o);
                    return q().useEffect(function() {
                        return s.itemMap.set(l, tT({
                                ref: l
                            }, i)),
                            function() {
                                s.itemMap.delete(l)
                            }
                    }), (0, z.jsx)(h, (tA(r = {}, m, ""), tA(r, "ref", u), tA(r, "children", a), r))
                })).displayName = v, [{
                    Provider: s,
                    Slot: p,
                    ItemSlot: y
                }, function(t) {
                    var n = c(lD + "CollectionConsumer", t);
                    return q().useCallback(function() {
                        var t = n.collectionRef.current;
                        if (!t) return [];
                        var r = Array.from(t.querySelectorAll("[".concat(m, "]")));
                        return Array.from(n.itemMap.values()).sort(function(t, n) {
                            return r.indexOf(t.ref.current) - r.indexOf(n.ref.current)
                        })
                    }, [n.collectionRef, n.itemMap])
                }, i]), 3),
                lM = lL[0],
                l_ = lL[1],
                lF = lh(function(t) {
                    var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        o = function() {
                            var n = r.map(function(t) {
                                return K.createContext(t)
                            });
                            return function(r) {
                                var o = (null == r ? void 0 : r[t]) || n;
                                return K.useMemo(function() {
                                    return ls({}, "__scope".concat(t), lv(lp({}, r), ls({}, t, o)))
                                }, [r, o])
                            }
                        };
                    return o.scopeName = t, [function(n, o) {
                        var a = K.createContext(o),
                            i = r.length;
                        r = ly(r).concat([o]);
                        var l = function(n) {
                            var r, o = n.scope,
                                l = n.children,
                                u = lm(n, ["scope", "children"]),
                                c = (null == o || null == (r = o[t]) ? void 0 : r[i]) || a,
                                s = K.useMemo(function() {
                                    return u
                                }, Object.values(u));
                            return (0, z.jsx)(c.Provider, {
                                value: s,
                                children: l
                            })
                        };
                        return l.displayName = n + "Provider", [l, function(r, l) {
                            var u, c = (null == l || null == (u = l[t]) ? void 0 : u[i]) || a,
                                s = K.useContext(c);
                            if (s) return s;
                            if (void 0 !== o) return o;
                            throw Error("`".concat(r, "` must be used within `").concat(n, "`"))
                        }]
                    }, lO.apply(void 0, [o].concat(ly(n)))]
                }(lD, [lL[2], al]), 2),
                lU = lF[0],
                lW = (lF[1], al()),
                lz = lh(lU(lD), 2),
                lV = lz[0],
                lB = lz[1],
                lH = lh(lU(lD), 2),
                lK = lH[0],
                lq = lH[1],
                lX = function(t) {
                    var n = t.__scopeSelect,
                        r = t.children,
                        o = t.open,
                        a = t.defaultOpen,
                        i = t.onOpenChange,
                        l = t.value,
                        u = t.defaultValue,
                        c = t.onValueChange,
                        s = t.dir,
                        d = t.name,
                        f = t.autoComplete,
                        p = t.disabled,
                        v = t.required,
                        m = t.form,
                        h = lW(n),
                        y = lh(K.useState(null), 2),
                        b = y[0],
                        g = y[1],
                        w = lh(K.useState(null), 2),
                        x = w[0],
                        S = w[1],
                        O = lh(K.useState(!1), 2),
                        j = O[0],
                        E = O[1],
                        C = tB(s),
                        P = lh(lT({
                            prop: o,
                            defaultProp: a,
                            onChange: i
                        }), 2),
                        A = P[0],
                        T = P[1],
                        R = lh(lT({
                            prop: l,
                            defaultProp: u,
                            onChange: c
                        }), 2),
                        N = R[0],
                        I = R[1],
                        k = K.useRef(null),
                        D = !b || m || !!b.closest("form"),
                        L = lh(K.useState(new Set), 2),
                        M = L[0],
                        _ = L[1],
                        F = Array.from(M).map(function(t) {
                            return t.props.value
                        }).join(";");
                    return (0, z.jsx)(ad, lv(lp({}, h), {
                        children: (0, z.jsxs)(lV, {
                            required: v,
                            scope: n,
                            trigger: b,
                            onTriggerChange: g,
                            valueNode: x,
                            onValueNodeChange: S,
                            valueNodeHasChildren: j,
                            onValueNodeHasChildrenChange: E,
                            contentId: rb(),
                            value: N,
                            onValueChange: I,
                            open: void 0 !== A && A,
                            onOpenChange: T,
                            dir: C,
                            triggerPointerDownPosRef: k,
                            disabled: p,
                            children: [(0, z.jsx)(lM.Provider, {
                                scope: n,
                                children: (0, z.jsx)(lK, {
                                    scope: t.__scopeSelect,
                                    onNativeOptionAdd: K.useCallback(function(t) {
                                        _(function(n) {
                                            return new Set(n).add(t)
                                        })
                                    }, []),
                                    onNativeOptionRemove: K.useCallback(function(t) {
                                        _(function(n) {
                                            var r = new Set(n);
                                            return r.delete(t), r
                                        })
                                    }, []),
                                    children: r
                                })
                            }), D ? (0, z.jsxs)(uS, {
                                "aria-hidden": !0,
                                required: v,
                                tabIndex: -1,
                                name: d,
                                autoComplete: f,
                                value: N,
                                onChange: function(t) {
                                    return I(t.target.value)
                                },
                                disabled: p,
                                form: m,
                                children: [void 0 === N ? (0, z.jsx)("option", {
                                    value: ""
                                }) : null, Array.from(M)]
                            }, F) : null]
                        })
                    }))
                };
            lX.displayName = lD;
            var l$ = "SelectTrigger",
                lY = K.forwardRef(function(t, n) {
                    var r = t.__scopeSelect,
                        o = t.disabled,
                        a = lm(t, ["__scopeSelect", "disabled"]),
                        i = lW(r),
                        l = lB(l$, r),
                        u = l.disabled || void 0 !== o && o,
                        c = lS(n, l.onTriggerChange),
                        s = l_(r),
                        d = K.useRef("touch"),
                        f = lh(uO(function(t) {
                            var n = s().filter(function(t) {
                                    return !t.disabled
                                }),
                                r = n.find(function(t) {
                                    return t.value === l.value
                                }),
                                o = uj(n, t, r);
                            void 0 !== o && l.onValueChange(o.value)
                        }), 3),
                        p = f[0],
                        v = f[1],
                        m = f[2],
                        h = function(t) {
                            u || (l.onOpenChange(!0), m()), t && (l.triggerPointerDownPosRef.current = {
                                x: Math.round(t.pageX),
                                y: Math.round(t.pageY)
                            })
                        };
                    return (0, z.jsx)(ap, lv(lp({
                        asChild: !0
                    }, i), {
                        children: (0, z.jsx)(lP.button, lv(lp({
                            type: "button",
                            role: "combobox",
                            "aria-controls": l.contentId,
                            "aria-expanded": l.open,
                            "aria-required": l.required,
                            "aria-autocomplete": "none",
                            dir: l.dir,
                            "data-state": l.open ? "open" : "closed",
                            disabled: u,
                            "data-disabled": u ? "" : void 0,
                            "data-placeholder": ux(l.value) ? "" : void 0
                        }, a), {
                            ref: c,
                            onClick: lg(a.onClick, function(t) {
                                t.currentTarget.focus(), "mouse" !== d.current && h(t)
                            }),
                            onPointerDown: lg(a.onPointerDown, function(t) {
                                d.current = t.pointerType;
                                var n = t.target;
                                n.hasPointerCapture(t.pointerId) && n.releasePointerCapture(t.pointerId), 0 === t.button && !1 === t.ctrlKey && "mouse" === t.pointerType && (h(t), t.preventDefault())
                            }),
                            onKeyDown: lg(a.onKeyDown, function(t) {
                                var n = "" !== p.current;
                                t.ctrlKey || t.altKey || t.metaKey || 1 !== t.key.length || v(t.key), n && " " === t.key || lI.includes(t.key) && (h(), t.preventDefault())
                            })
                        }))
                    }))
                });
            lY.displayName = l$;
            var lG = "SelectValue",
                lZ = K.forwardRef(function(t, n) {
                    var r = t.__scopeSelect,
                        o = (t.className, t.style, t.children),
                        a = t.placeholder,
                        i = lm(t, ["__scopeSelect", "className", "style", "children", "placeholder"]),
                        l = lB(lG, r),
                        u = l.onValueNodeHasChildrenChange,
                        c = void 0 !== o,
                        s = lS(n, l.onValueNodeChange);
                    return lR(function() {
                        u(c)
                    }, [u, c]), (0, z.jsx)(lP.span, lv(lp({}, i), {
                        ref: s,
                        style: {
                            pointerEvents: "none"
                        },
                        children: ux(l.value) ? (0, z.jsx)(z.Fragment, {
                            children: void 0 === a ? "" : a
                        }) : o
                    }))
                });
            lZ.displayName = lG;
            var lQ = K.forwardRef(function(t, n) {
                t.__scopeSelect;
                var r = t.children,
                    o = lm(t, ["__scopeSelect", "children"]);
                return (0, z.jsx)(lP.span, lv(lp({
                    "aria-hidden": !0
                }, o), {
                    ref: n,
                    children: r || "▼"
                }))
            });
            lQ.displayName = "SelectIcon";
            var lJ = function(t) {
                return (0, z.jsx)(nT, lp({
                    asChild: !0
                }, t))
            };
            lJ.displayName = "SelectPortal";
            var l0 = "SelectContent",
                l1 = K.forwardRef(function(t, n) {
                    var r = lB(l0, t.__scopeSelect),
                        o = lh(K.useState(), 2),
                        a = o[0],
                        i = o[1];
                    return (lR(function() {
                        i(new DocumentFragment)
                    }, []), r.open) ? (0, z.jsx)(l6, lv(lp({}, t), {
                        ref: n
                    })) : a ? tO.createPortal((0, z.jsx)(l3, {
                        scope: t.__scopeSelect,
                        children: (0, z.jsx)(lM.Slot, {
                            scope: t.__scopeSelect,
                            children: (0, z.jsx)("div", {
                                children: t.children
                            })
                        })
                    }), a) : null
                });
            l1.displayName = l0;
            var l2 = lh(lU(l0), 2),
                l3 = l2[0],
                l4 = l2[1],
                l5 = lj("SelectContent.RemoveScroll"),
                l6 = K.forwardRef(function(t, n) {
                    var r = t.__scopeSelect,
                        o = t.position,
                        a = void 0 === o ? "item-aligned" : o,
                        i = t.onCloseAutoFocus,
                        l = t.onEscapeKeyDown,
                        u = t.onPointerDownOutside,
                        c = t.side,
                        s = t.sideOffset,
                        d = t.align,
                        f = t.alignOffset,
                        p = t.arrowPadding,
                        v = t.collisionBoundary,
                        m = t.collisionPadding,
                        h = t.sticky,
                        y = t.hideWhenDetached,
                        b = t.avoidCollisions,
                        g = lm(t, ["__scopeSelect", "position", "onCloseAutoFocus", "onEscapeKeyDown", "onPointerDownOutside", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "avoidCollisions"]),
                        w = lB(l0, r),
                        x = lh(K.useState(null), 2),
                        S = x[0],
                        O = x[1],
                        j = lh(K.useState(null), 2),
                        E = j[0],
                        C = j[1],
                        P = lS(n, function(t) {
                            return O(t)
                        }),
                        A = lh(K.useState(null), 2),
                        T = A[0],
                        R = A[1],
                        N = lh(K.useState(null), 2),
                        I = N[0],
                        k = N[1],
                        D = l_(r),
                        L = lh(K.useState(!1), 2),
                        M = L[0],
                        _ = L[1],
                        F = K.useRef(!1);
                    K.useEffect(function() {
                        if (S) return nM(S)
                    }, [S]), nl();
                    var U = K.useCallback(function(t) {
                            var n = lc(c = D().map(function(t) {
                                    return t.ref.current
                                })) || ld(c) || lb(c) || lf(),
                                r = n[0],
                                o = lh(n.slice(1).slice(-1), 1)[0],
                                a = document.activeElement,
                                i = !0,
                                l = !1,
                                u = void 0;
                            try {
                                for (var c, s, d = t[Symbol.iterator](); !(i = (s = d.next()).done); i = !0) {
                                    var f = s.value;
                                    if (f === a || (null == f || f.scrollIntoView({
                                            block: "nearest"
                                        }), f === r && E && (E.scrollTop = 0), f === o && E && (E.scrollTop = E.scrollHeight), null == f || f.focus(), document.activeElement !== a)) return
                                }
                            } catch (t) {
                                l = !0, u = t
                            } finally {
                                try {
                                    i || null == d.return || d.return()
                                } finally {
                                    if (l) throw u
                                }
                            }
                        }, [D, E]),
                        W = K.useCallback(function() {
                            return U([T, S])
                        }, [U, T, S]);
                    K.useEffect(function() {
                        M && W()
                    }, [M, W]);
                    var V = w.onOpenChange,
                        B = w.triggerPointerDownPosRef;
                    K.useEffect(function() {
                        if (S) {
                            var t = {
                                    x: 0,
                                    y: 0
                                },
                                n = function(n) {
                                    var r, o, a, i;
                                    t = {
                                        x: Math.abs(Math.round(n.pageX) - (null != (a = null == (r = B.current) ? void 0 : r.x) ? a : 0)),
                                        y: Math.abs(Math.round(n.pageY) - (null != (i = null == (o = B.current) ? void 0 : o.y) ? i : 0))
                                    }
                                },
                                r = function(r) {
                                    t.x <= 10 && t.y <= 10 ? r.preventDefault() : S.contains(r.target) || V(!1), document.removeEventListener("pointermove", n), B.current = null
                                };
                            return null !== B.current && (document.addEventListener("pointermove", n), document.addEventListener("pointerup", r, {
                                    capture: !0,
                                    once: !0
                                })),
                                function() {
                                    document.removeEventListener("pointermove", n), document.removeEventListener("pointerup", r, {
                                        capture: !0
                                    })
                                }
                        }
                    }, [S, V, B]), K.useEffect(function() {
                        var t = function() {
                            return V(!1)
                        };
                        return window.addEventListener("blur", t), window.addEventListener("resize", t),
                            function() {
                                window.removeEventListener("blur", t), window.removeEventListener("resize", t)
                            }
                    }, [V]);
                    var H = lh(uO(function(t) {
                            var n = D().filter(function(t) {
                                    return !t.disabled
                                }),
                                r = n.find(function(t) {
                                    return t.ref.current === document.activeElement
                                }),
                                o = uj(n, t, r);
                            o && setTimeout(function() {
                                return o.ref.current.focus()
                            })
                        }), 2),
                        q = H[0],
                        X = H[1],
                        $ = K.useCallback(function(t, n, r) {
                            var o = !F.current && !r;
                            (void 0 !== w.value && w.value === n || o) && (R(t), o && (F.current = !0))
                        }, [w.value]),
                        Y = K.useCallback(function() {
                            return null == S ? void 0 : S.focus()
                        }, [S]),
                        G = K.useCallback(function(t, n, r) {
                            var o = !F.current && !r;
                            (void 0 !== w.value && w.value === n || o) && k(t)
                        }, [w.value]),
                        Z = "popper" === a ? l7 : l8,
                        Q = Z === l7 ? {
                            side: c,
                            sideOffset: s,
                            align: d,
                            alignOffset: f,
                            arrowPadding: p,
                            collisionBoundary: v,
                            collisionPadding: m,
                            sticky: h,
                            hideWhenDetached: y,
                            avoidCollisions: b
                        } : {};
                    return (0, z.jsx)(l3, {
                        scope: r,
                        content: S,
                        viewport: E,
                        onViewportChange: C,
                        itemRefCallback: $,
                        selectedItem: T,
                        onItemLeave: Y,
                        itemTextRefCallback: G,
                        focusSelectedItem: W,
                        selectedItemText: I,
                        position: a,
                        isPositioned: M,
                        searchRef: q,
                        children: (0, z.jsx)(rp, {
                            as: l5,
                            allowPinchZoom: !0,
                            children: (0, z.jsx)(nb, {
                                asChild: !0,
                                trapped: w.open,
                                onMountAutoFocus: function(t) {
                                    t.preventDefault()
                                },
                                onUnmountAutoFocus: lg(i, function(t) {
                                    var n;
                                    null == (n = w.trigger) || n.focus({
                                        preventScroll: !0
                                    }), t.preventDefault()
                                }),
                                children: (0, z.jsx)(nr, {
                                    asChild: !0,
                                    disableOutsidePointerEvents: !0,
                                    onEscapeKeyDown: l,
                                    onPointerDownOutside: u,
                                    onFocusOutside: function(t) {
                                        return t.preventDefault()
                                    },
                                    onDismiss: function() {
                                        return w.onOpenChange(!1)
                                    },
                                    children: (0, z.jsx)(Z, lv(lp({
                                        role: "listbox",
                                        id: w.contentId,
                                        "data-state": w.open ? "open" : "closed",
                                        dir: w.dir,
                                        onContextMenu: function(t) {
                                            return t.preventDefault()
                                        }
                                    }, g, Q), {
                                        onPlaced: function() {
                                            return _(!0)
                                        },
                                        ref: P,
                                        style: lp({
                                            display: "flex",
                                            flexDirection: "column",
                                            outline: "none"
                                        }, g.style),
                                        onKeyDown: lg(g.onKeyDown, function(t) {
                                            var n = t.ctrlKey || t.altKey || t.metaKey;
                                            if ("Tab" === t.key && t.preventDefault(), n || 1 !== t.key.length || X(t.key), ["ArrowUp", "ArrowDown", "Home", "End"].includes(t.key)) {
                                                var r = D().filter(function(t) {
                                                    return !t.disabled
                                                }).map(function(t) {
                                                    return t.ref.current
                                                });
                                                if (["ArrowUp", "End"].includes(t.key) && (r = r.slice().reverse()), ["ArrowUp", "ArrowDown"].includes(t.key)) {
                                                    var o = t.target,
                                                        a = r.indexOf(o);
                                                    r = r.slice(a + 1)
                                                }
                                                setTimeout(function() {
                                                    return U(r)
                                                }), t.preventDefault()
                                            }
                                        })
                                    }))
                                })
                            })
                        })
                    })
                });
            l6.displayName = "SelectContentImpl";
            var l8 = K.forwardRef(function(t, n) {
                var r = t.__scopeSelect,
                    o = t.onPlaced,
                    a = lm(t, ["__scopeSelect", "onPlaced"]),
                    i = lB(l0, r),
                    l = l4(l0, r),
                    u = lh(K.useState(null), 2),
                    c = u[0],
                    s = u[1],
                    d = lh(K.useState(null), 2),
                    f = d[0],
                    p = d[1],
                    v = lS(n, function(t) {
                        return p(t)
                    }),
                    m = l_(r),
                    h = K.useRef(!1),
                    y = K.useRef(!0),
                    b = l.viewport,
                    g = l.selectedItem,
                    w = l.selectedItemText,
                    x = l.focusSelectedItem,
                    S = K.useCallback(function() {
                        if (i.trigger && i.valueNode && c && f && b && g && w) {
                            var t = i.trigger.getBoundingClientRect(),
                                n = f.getBoundingClientRect(),
                                r = i.valueNode.getBoundingClientRect(),
                                a = w.getBoundingClientRect();
                            if ("rtl" !== i.dir) {
                                var l = a.left - n.left,
                                    u = r.left - l,
                                    s = t.left - u,
                                    d = t.width + s,
                                    p = Math.max(d, n.width),
                                    v = tC(u, [10, Math.max(10, window.innerWidth - 10 - p)]);
                                c.style.minWidth = d + "px", c.style.left = v + "px"
                            } else {
                                var y = n.right - a.right,
                                    x = window.innerWidth - r.right - y,
                                    S = window.innerWidth - t.right - x,
                                    O = t.width + S,
                                    j = Math.max(O, n.width),
                                    E = tC(x, [10, Math.max(10, window.innerWidth - 10 - j)]);
                                c.style.minWidth = O + "px", c.style.right = E + "px"
                            }
                            var C = m(),
                                P = window.innerHeight - 20,
                                A = b.scrollHeight,
                                T = window.getComputedStyle(f),
                                R = parseInt(T.borderTopWidth, 10),
                                N = parseInt(T.paddingTop, 10),
                                I = parseInt(T.borderBottomWidth, 10),
                                k = R + N + A + parseInt(T.paddingBottom, 10) + I,
                                D = Math.min(5 * g.offsetHeight, k),
                                L = window.getComputedStyle(b),
                                M = parseInt(L.paddingTop, 10),
                                _ = parseInt(L.paddingBottom, 10),
                                F = t.top + t.height / 2 - 10,
                                U = g.offsetHeight / 2,
                                W = R + N + (g.offsetTop + U);
                            if (W <= F) {
                                var z = C.length > 0 && g === C[C.length - 1].ref.current;
                                c.style.bottom = "0px";
                                var V = W + Math.max(P - F, U + (z ? _ : 0) + (f.clientHeight - b.offsetTop - b.offsetHeight) + I);
                                c.style.height = V + "px"
                            } else {
                                var B = C.length > 0 && g === C[0].ref.current;
                                c.style.top = "0px";
                                var H = Math.max(F, R + b.offsetTop + (B ? M : 0) + U) + (k - W);
                                c.style.height = H + "px", b.scrollTop = W - F + b.offsetTop
                            }
                            c.style.margin = "".concat(10, "px 0"), c.style.minHeight = D + "px", c.style.maxHeight = P + "px", null == o || o(), requestAnimationFrame(function() {
                                return h.current = !0
                            })
                        }
                    }, [m, i.trigger, i.valueNode, c, f, b, g, w, i.dir, o]);
                lR(function() {
                    return S()
                }, [S]);
                var O = lh(K.useState(), 2),
                    j = O[0],
                    E = O[1];
                lR(function() {
                    f && E(window.getComputedStyle(f).zIndex)
                }, [f]);
                var C = K.useCallback(function(t) {
                    t && !0 === y.current && (S(), null == x || x(), y.current = !1)
                }, [S, x]);
                return (0, z.jsx)(ue, {
                    scope: r,
                    contentWrapper: c,
                    shouldExpandOnScrollRef: h,
                    onScrollButtonChange: C,
                    children: (0, z.jsx)("div", {
                        ref: s,
                        style: {
                            display: "flex",
                            flexDirection: "column",
                            position: "fixed",
                            zIndex: j
                        },
                        children: (0, z.jsx)(lP.div, lv(lp({}, a), {
                            ref: v,
                            style: lp({
                                boxSizing: "border-box",
                                maxHeight: "100%"
                            }, a.style)
                        }))
                    })
                })
            });
            l8.displayName = "SelectItemAlignedPosition";
            var l7 = K.forwardRef(function(t, n) {
                var r = t.__scopeSelect,
                    o = t.align,
                    a = t.collisionPadding,
                    i = lm(t, ["__scopeSelect", "align", "collisionPadding"]),
                    l = lW(r);
                return (0, z.jsx)(ab, lv(lp({}, l, i), {
                    ref: n,
                    align: void 0 === o ? "start" : o,
                    collisionPadding: void 0 === a ? 10 : a,
                    style: lv(lp({
                        boxSizing: "border-box"
                    }, i.style), {
                        "--radix-select-content-transform-origin": "var(--radix-popper-transform-origin)",
                        "--radix-select-content-available-width": "var(--radix-popper-available-width)",
                        "--radix-select-content-available-height": "var(--radix-popper-available-height)",
                        "--radix-select-trigger-width": "var(--radix-popper-anchor-width)",
                        "--radix-select-trigger-height": "var(--radix-popper-anchor-height)"
                    })
                }))
            });
            l7.displayName = "SelectPopperPosition";
            var l9 = lh(lU(l0, {}), 2),
                ue = l9[0],
                ut = l9[1],
                un = "SelectViewport",
                ur = K.forwardRef(function(t, n) {
                    var r = t.__scopeSelect,
                        o = t.nonce,
                        a = lm(t, ["__scopeSelect", "nonce"]),
                        i = l4(un, r),
                        l = ut(un, r),
                        u = lS(n, i.onViewportChange),
                        c = K.useRef(0);
                    return (0, z.jsxs)(z.Fragment, {
                        children: [(0, z.jsx)("style", {
                            dangerouslySetInnerHTML: {
                                __html: "[data-radix-select-viewport]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}[data-radix-select-viewport]::-webkit-scrollbar{display:none}"
                            },
                            nonce: o
                        }), (0, z.jsx)(lM.Slot, {
                            scope: r,
                            children: (0, z.jsx)(lP.div, lv(lp({
                                "data-radix-select-viewport": "",
                                role: "presentation"
                            }, a), {
                                ref: u,
                                style: lp({
                                    position: "relative",
                                    flex: 1,
                                    overflow: "hidden auto"
                                }, a.style),
                                onScroll: lg(a.onScroll, function(t) {
                                    var n = t.currentTarget,
                                        r = l.contentWrapper,
                                        o = l.shouldExpandOnScrollRef;
                                    if ((null == o ? void 0 : o.current) && r) {
                                        var a = Math.abs(c.current - n.scrollTop);
                                        if (a > 0) {
                                            var i = window.innerHeight - 20,
                                                u = Math.max(parseFloat(r.style.minHeight), parseFloat(r.style.height));
                                            if (u < i) {
                                                var s = u + a,
                                                    d = Math.min(i, s),
                                                    f = s - d;
                                                r.style.height = d + "px", "0px" === r.style.bottom && (n.scrollTop = f > 0 ? f : 0, r.style.justifyContent = "flex-end")
                                            }
                                        }
                                    }
                                    c.current = n.scrollTop
                                })
                            }))
                        })]
                    })
                });
            ur.displayName = un;
            var uo = "SelectGroup",
                ua = lh(lU(uo), 2),
                ui = ua[0],
                ul = ua[1];
            K.forwardRef(function(t, n) {
                var r = t.__scopeSelect,
                    o = lm(t, ["__scopeSelect"]),
                    a = rb();
                return (0, z.jsx)(ui, {
                    scope: r,
                    id: a,
                    children: (0, z.jsx)(lP.div, lv(lp({
                        role: "group",
                        "aria-labelledby": a
                    }, o), {
                        ref: n
                    }))
                })
            }).displayName = uo;
            var uu = "SelectLabel";
            K.forwardRef(function(t, n) {
                var r = t.__scopeSelect,
                    o = lm(t, ["__scopeSelect"]),
                    a = ul(uu, r);
                return (0, z.jsx)(lP.div, lv(lp({
                    id: a.id
                }, o), {
                    ref: n
                }))
            }).displayName = uu;
            var uc = "SelectItem",
                us = lh(lU(uc), 2),
                ud = us[0],
                uf = us[1],
                up = K.forwardRef(function(t, n) {
                    var r = t.__scopeSelect,
                        o = t.value,
                        a = t.disabled,
                        i = void 0 !== a && a,
                        l = t.textValue,
                        u = lm(t, ["__scopeSelect", "value", "disabled", "textValue"]),
                        c = lB(uc, r),
                        s = l4(uc, r),
                        d = c.value === o,
                        f = lh(K.useState(null != l ? l : ""), 2),
                        p = f[0],
                        v = f[1],
                        m = lh(K.useState(!1), 2),
                        h = m[0],
                        y = m[1],
                        b = lS(n, function(t) {
                            var n;
                            return null == (n = s.itemRefCallback) ? void 0 : n.call(s, t, o, i)
                        }),
                        g = rb(),
                        w = K.useRef("touch"),
                        x = function() {
                            i || (c.onValueChange(o), c.onOpenChange(!1))
                        };
                    if ("" === o) throw Error("A <Select.Item /> must have a value prop that is not an empty string. This is because the Select value can be set to an empty string to clear the selection and show the placeholder.");
                    return (0, z.jsx)(ud, {
                        scope: r,
                        value: o,
                        disabled: i,
                        textId: g,
                        isSelected: d,
                        onItemTextChange: K.useCallback(function(t) {
                            v(function(n) {
                                var r;
                                return n || (null != (r = null == t ? void 0 : t.textContent) ? r : "").trim()
                            })
                        }, []),
                        children: (0, z.jsx)(lM.ItemSlot, {
                            scope: r,
                            value: o,
                            disabled: i,
                            textValue: p,
                            children: (0, z.jsx)(lP.div, lv(lp({
                                role: "option",
                                "aria-labelledby": g,
                                "data-highlighted": h ? "" : void 0,
                                "aria-selected": d && h,
                                "data-state": d ? "checked" : "unchecked",
                                "aria-disabled": i || void 0,
                                "data-disabled": i ? "" : void 0,
                                tabIndex: i ? void 0 : -1
                            }, u), {
                                ref: b,
                                onFocus: lg(u.onFocus, function() {
                                    return y(!0)
                                }),
                                onBlur: lg(u.onBlur, function() {
                                    return y(!1)
                                }),
                                onClick: lg(u.onClick, function() {
                                    "mouse" !== w.current && x()
                                }),
                                onPointerUp: lg(u.onPointerUp, function() {
                                    "mouse" === w.current && x()
                                }),
                                onPointerDown: lg(u.onPointerDown, function(t) {
                                    w.current = t.pointerType
                                }),
                                onPointerMove: lg(u.onPointerMove, function(t) {
                                    var n;
                                    w.current = t.pointerType, i ? null == (n = s.onItemLeave) || n.call(s) : "mouse" === w.current && t.currentTarget.focus({
                                        preventScroll: !0
                                    })
                                }),
                                onPointerLeave: lg(u.onPointerLeave, function(t) {
                                    var n;
                                    t.currentTarget === document.activeElement && (null == (n = s.onItemLeave) || n.call(s))
                                }),
                                onKeyDown: lg(u.onKeyDown, function(t) {
                                    var n;
                                    "" !== (null == (n = s.searchRef) ? void 0 : n.current) && " " === t.key || (lk.includes(t.key) && x(), " " === t.key && t.preventDefault())
                                })
                            }))
                        })
                    })
                });
            up.displayName = uc;
            var uv = "SelectItemText",
                um = K.forwardRef(function(t, n) {
                    var r = t.__scopeSelect,
                        o = (t.className, t.style, lm(t, ["__scopeSelect", "className", "style"])),
                        a = lB(uv, r),
                        i = l4(uv, r),
                        l = uf(uv, r),
                        u = lq(uv, r),
                        c = lh(K.useState(null), 2),
                        s = c[0],
                        d = c[1],
                        f = lS(n, function(t) {
                            return d(t)
                        }, l.onItemTextChange, function(t) {
                            var n;
                            return null == (n = i.itemTextRefCallback) ? void 0 : n.call(i, t, l.value, l.disabled)
                        }),
                        p = null == s ? void 0 : s.textContent,
                        v = K.useMemo(function() {
                            return (0, z.jsx)("option", {
                                value: l.value,
                                disabled: l.disabled,
                                children: p
                            }, l.value)
                        }, [l.disabled, l.value, p]),
                        m = u.onNativeOptionAdd,
                        h = u.onNativeOptionRemove;
                    return lR(function() {
                        return m(v),
                            function() {
                                return h(v)
                            }
                    }, [m, h, v]), (0, z.jsxs)(z.Fragment, {
                        children: [(0, z.jsx)(lP.span, lv(lp({
                            id: l.textId
                        }, o), {
                            ref: f
                        })), l.isSelected && a.valueNode && !a.valueNodeHasChildren ? tO.createPortal(o.children, a.valueNode) : null]
                    })
                });
            um.displayName = uv;
            var uh = "SelectItemIndicator";
            K.forwardRef(function(t, n) {
                var r = t.__scopeSelect,
                    o = lm(t, ["__scopeSelect"]);
                return uf(uh, r).isSelected ? (0, z.jsx)(lP.span, lv(lp({
                    "aria-hidden": !0
                }, o), {
                    ref: n
                })) : null
            }).displayName = uh;
            var uy = "SelectScrollUpButton";
            K.forwardRef(function(t, n) {
                var r = l4(uy, t.__scopeSelect),
                    o = ut(uy, t.__scopeSelect),
                    a = lh(K.useState(!1), 2),
                    i = a[0],
                    l = a[1],
                    u = lS(n, o.onScrollButtonChange);
                return lR(function() {
                    if (r.viewport && r.isPositioned) {
                        var t = function() {
                                l(n.scrollTop > 0)
                            },
                            n = r.viewport;
                        return t(), n.addEventListener("scroll", t),
                            function() {
                                return n.removeEventListener("scroll", t)
                            }
                    }
                }, [r.viewport, r.isPositioned]), i ? (0, z.jsx)(ug, lv(lp({}, t), {
                    ref: u,
                    onAutoScroll: function() {
                        var t = r.viewport,
                            n = r.selectedItem;
                        t && n && (t.scrollTop = t.scrollTop - n.offsetHeight)
                    }
                })) : null
            }).displayName = uy;
            var ub = "SelectScrollDownButton";
            K.forwardRef(function(t, n) {
                var r = l4(ub, t.__scopeSelect),
                    o = ut(ub, t.__scopeSelect),
                    a = lh(K.useState(!1), 2),
                    i = a[0],
                    l = a[1],
                    u = lS(n, o.onScrollButtonChange);
                return lR(function() {
                    if (r.viewport && r.isPositioned) {
                        var t = function() {
                                var t = n.scrollHeight - n.clientHeight;
                                l(Math.ceil(n.scrollTop) < t)
                            },
                            n = r.viewport;
                        return t(), n.addEventListener("scroll", t),
                            function() {
                                return n.removeEventListener("scroll", t)
                            }
                    }
                }, [r.viewport, r.isPositioned]), i ? (0, z.jsx)(ug, lv(lp({}, t), {
                    ref: u,
                    onAutoScroll: function() {
                        var t = r.viewport,
                            n = r.selectedItem;
                        t && n && (t.scrollTop = t.scrollTop + n.offsetHeight)
                    }
                })) : null
            }).displayName = ub;
            var ug = K.forwardRef(function(t, n) {
                var r = t.__scopeSelect,
                    o = t.onAutoScroll,
                    a = lm(t, ["__scopeSelect", "onAutoScroll"]),
                    i = l4("SelectScrollButton", r),
                    l = K.useRef(null),
                    u = l_(r),
                    c = K.useCallback(function() {
                        null !== l.current && (window.clearInterval(l.current), l.current = null)
                    }, []);
                return K.useEffect(function() {
                    return function() {
                        return c()
                    }
                }, [c]), lR(function() {
                    var t, n;
                    null == (n = u().find(function(t) {
                        return t.ref.current === document.activeElement
                    })) || null == (t = n.ref.current) || t.scrollIntoView({
                        block: "nearest"
                    })
                }, [u]), (0, z.jsx)(lP.div, lv(lp({
                    "aria-hidden": !0
                }, a), {
                    ref: n,
                    style: lp({
                        flexShrink: 0
                    }, a.style),
                    onPointerDown: lg(a.onPointerDown, function() {
                        null === l.current && (l.current = window.setInterval(o, 50))
                    }),
                    onPointerMove: lg(a.onPointerMove, function() {
                        var t;
                        null == (t = i.onItemLeave) || t.call(i), null === l.current && (l.current = window.setInterval(o, 50))
                    }),
                    onPointerLeave: lg(a.onPointerLeave, function() {
                        c()
                    })
                }))
            });
            K.forwardRef(function(t, n) {
                t.__scopeSelect;
                var r = lm(t, ["__scopeSelect"]);
                return (0, z.jsx)(lP.div, lv(lp({
                    "aria-hidden": !0
                }, r), {
                    ref: n
                }))
            }).displayName = "SelectSeparator";
            var uw = "SelectArrow";

            function ux(t) {
                return "" === t || void 0 === t
            }
            K.forwardRef(function(t, n) {
                var r = t.__scopeSelect,
                    o = lm(t, ["__scopeSelect"]),
                    a = lW(r),
                    i = lB(uw, r),
                    l = l4(uw, r);
                return i.open && "popper" === l.position ? (0, z.jsx)(ax, lv(lp({}, a, o), {
                    ref: n
                })) : null
            }).displayName = uw;
            var uS = K.forwardRef(function(t, n) {
                var r, o = t.value,
                    a = lm(t, ["value"]),
                    i = K.useRef(null),
                    l = lS(n, i),
                    u = (r = K.useRef({
                        value: o,
                        previous: o
                    }), K.useMemo(function() {
                        return r.current.value !== o && (r.current.previous = r.current.value, r.current.value = o), r.current.previous
                    }, [o]));
                return K.useEffect(function() {
                    var t = i.current,
                        n = Object.getOwnPropertyDescriptor(window.HTMLSelectElement.prototype, "value").set;
                    if (u !== o && n) {
                        var r = new Event("change", {
                            bubbles: !0
                        });
                        n.call(t, o), t.dispatchEvent(r)
                    }
                }, [u, o]), (0, z.jsx)(lN, {
                    asChild: !0,
                    children: (0, z.jsx)("select", lv(lp({}, a), {
                        ref: l,
                        defaultValue: o
                    }))
                })
            });

            function uO(t) {
                var n = lA(t),
                    r = K.useRef(""),
                    o = K.useRef(0),
                    a = K.useCallback(function(t) {
                        var a = r.current + t;
                        n(a),
                            function t(n) {
                                r.current = n, window.clearTimeout(o.current), "" !== n && (o.current = window.setTimeout(function() {
                                    return t("")
                                }, 1e3))
                            }(a)
                    }, [n]),
                    i = K.useCallback(function() {
                        r.current = "", window.clearTimeout(o.current)
                    }, []);
                return K.useEffect(function() {
                    return function() {
                        return window.clearTimeout(o.current)
                    }
                }, []), [r, a, i]
            }

            function uj(t, n, r) {
                var o, a = n.length > 1 && Array.from(n).every(function(t) {
                        return t === n[0]
                    }) ? n[0] : n,
                    i = (o = Math.max(r ? t.indexOf(r) : -1, 0), t.map(function(n, r) {
                        return t[(o + r) % t.length]
                    }));
                1 === a.length && (i = i.filter(function(t) {
                    return t !== r
                }));
                var l = i.find(function(t) {
                    return t.textValue.toLowerCase().startsWith(a.toLowerCase())
                });
                return l !== r ? l : void 0
            }
            uS.displayName = "BubbleSelect", aA(".foundation-web-menu-separator{border-top:1px solid var(--color-stroke-default)}");
            var uE = (0, K.createContext)(null),
                uC = {
                    XSmall: "size-300",
                    Small: "size-400",
                    Medium: "size-500",
                    Large: "size-600"
                },
                uP = {
                    XSmall: "padding-x-medium",
                    Small: "padding-x-medium",
                    Medium: "padding-x-medium",
                    Large: "padding-x-large"
                },
                uA = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium",
                    Large: "text-title-large"
                },
                uT = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                uR = {
                    XSmall: "gap-xsmall",
                    Small: "gap-small",
                    Medium: "gap-small",
                    Large: "gap-small"
                },
                uN = {
                    XSmall: "radius-small",
                    Small: "radius-medium",
                    Medium: "radius-medium",
                    Large: "radius-medium"
                },
                uI = {
                    XSmall: "height-600",
                    Small: "height-800",
                    Medium: "height-1000",
                    Large: "height-1200"
                },
                uk = (0, K.forwardRef)(function(t, n) {
                    var r = t.label,
                        o = t.labelTooltip,
                        a = t.ariaLabelledBy,
                        i = t.ariaLabel,
                        l = t.className,
                        u = t.size,
                        c = t.variant,
                        s = void 0 === c ? "Standard" : c,
                        d = t.value,
                        f = t.placeholder,
                        p = t.isDisabled,
                        v = t.hasError,
                        m = t.hint,
                        h = t.onValueChange,
                        y = t.onOpenChange,
                        b = t.children,
                        g = aR(),
                        w = (0, K.useMemo)(function() {
                            return {
                                size: u
                            }
                        }, [u]),
                        x = r ? q().createElement("span", {
                            id: g,
                            className: tS(uA[u], "content-emphasis")
                        }, r) : null;
                    return q().createElement(uE.Provider, {
                        value: w
                    }, q().createElement("div", {
                        className: tS("flex flex-col", p && [aP, "pointer-events-none"], uR[u], l)
                    }, x && (o ? q().createElement("div", {
                        className: "flex items-center gap-xsmall"
                    }, x, q().createElement(la, Object.assign({}, o))) : x), q().createElement(lX, {
                        value: d,
                        disabled: p,
                        onValueChange: h,
                        onOpenChange: y
                    }, q().createElement(lY, {
                        className: tS("relative clip group/interactable outline-none", "foundation-web-input flex items-center justify-between width-full cursor-pointer", li[s], ll[s], uN[u], uI[u], uP[u], uT[u], v ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", void 0 === d ? "content-muted" : "content-default"),
                        ref: n,
                        "aria-labelledby": r ? g : a,
                        "aria-label": i
                    }, q().createElement(aC, null), q().createElement("div", {
                        className: "grow-1 text-truncate-split text-align-x-left"
                    }, q().createElement(lZ, {
                        placeholder: f
                    })), q().createElement(lQ, {
                        className: tS(uC[u], "icon icon-regular-chevron-large-down content-default")
                    })), q().createElement(lJ, null, q().createElement(l1, {
                        position: "popper",
                        className: "padding-y-small foundation-web-portal-zindex",
                        style: {
                            maxHeight: "var(--radix-select-content-available-height)"
                        }
                    }, b))), m && q().createElement("span", {
                        className: tS("text-caption-small", {
                            "content-system-alert": v,
                            "content-default": !v
                        })
                    }, m)))
                });

            function uD(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function uL(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        var o;
                        o = r[n], n in t ? Object.defineProperty(t, n, {
                            value: o,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : t[n] = o
                    })
                }
                return t
            }

            function uM(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function u_(t, n) {
                if (null == t) return {};
                var r, o, a = function(t, n) {
                    if (null == t) return {};
                    var r, o, a = {},
                        i = Object.keys(t);
                    for (o = 0; o < i.length; o++) r = i[o], n.indexOf(r) >= 0 || (a[r] = t[r]);
                    return a
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(t);
                    for (o = 0; o < i.length; o++) r = i[o], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (a[r] = t[r])
                }
                return a
            }

            function uF(t) {
                return function(t) {
                    if (Array.isArray(t)) return uD(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return uD(t, void 0);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return uD(t, n)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function uU(t) {
                return t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t
            }

            function uW(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }
            uk.displayName = "Dropdown";
            var uz = Symbol.for("react.lazy"),
                uV = K[" use ".trim().toString()];

            function uB(t) {
                var n;
                return null != t && "object" == (void 0 === t ? "undefined" : uU(t)) && "$$typeof" in t && t.$$typeof === uz && "_payload" in t && "object" == uU(n = t._payload) && null !== n && "then" in n
            }
            var uH = ((t = K.forwardRef(function(t, n) {
                    var r = t.children,
                        o = u_(t, ["children"]);
                    if (uB(r) && "function" == typeof uV && (r = uV(r._payload)), K.isValidElement(r)) {
                        var a, i, l, u, c = (u = null == (i = Object.getOwnPropertyDescriptor((a = r).props, "ref")) ? void 0 : i.get) && "isReactWarning" in u && u.isReactWarning ? a.ref : (u = null == (l = Object.getOwnPropertyDescriptor(a, "ref")) ? void 0 : l.get) && "isReactWarning" in u && u.isReactWarning ? a.props.ref : a.props.ref || a.ref,
                            s = function(t, n) {
                                var r = uL({}, n);
                                for (var o in n) ! function(o) {
                                    var a = t[o],
                                        i = n[o];
                                    /^on[A-Z]/.test(o) ? a && i ? r[o] = function() {
                                        for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                        var o = i.apply(void 0, uF(n));
                                        return a.apply(void 0, uF(n)), o
                                    } : a && (r[o] = a) : "style" === o ? r[o] = uL({}, a, i) : "className" === o && (r[o] = [a, i].filter(Boolean).join(" "))
                                }(o);
                                return uL({}, t, r)
                            }(o, r.props);
                        return r.type !== K.Fragment && (s.ref = n ? function() {
                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                            return function(t) {
                                var r = !1,
                                    o = n.map(function(n) {
                                        var o = uW(n, t);
                                        return r || "function" != typeof o || (r = !0), o
                                    });
                                if (r) return function() {
                                    for (var t = 0; t < o.length; t++) {
                                        var r = o[t];
                                        "function" == typeof r ? r() : uW(n[t], null)
                                    }
                                }
                            }
                        }(n, c) : c), K.cloneElement(r, s)
                    }
                    return K.Children.count(r) > 1 ? K.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), b = t, (g = K.forwardRef(function(t, n) {
                    var r = t.children,
                        o = u_(t, ["children"]);
                    uB(r) && "function" == typeof uV && (r = uV(r._payload));
                    var a = K.Children.toArray(r),
                        i = a.find(uq);
                    if (i) {
                        var l = i.props.children,
                            u = a.map(function(t) {
                                return t === i ? K.Children.count(l) > 1 ? K.Children.only(null) : K.isValidElement(l) ? l.props.children : null : t
                            });
                        return (0, z.jsx)(b, uM(uL({}, o), {
                            ref: n,
                            children: K.isValidElement(l) ? K.cloneElement(l, void 0, u) : null
                        }))
                    }
                    return (0, z.jsx)(b, uM(uL({}, o), {
                        ref: n,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), g),
                uK = Symbol("radix.slottable");

            function uq(t) {
                return K.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === uK
            }

            function uX(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function u$(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function uY(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        u$(t, n, r[n])
                    })
                }
                return t
            }

            function uG(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function uZ(t, n) {
                if (null == t) return {};
                var r, o, a = function(t, n) {
                    if (null == t) return {};
                    var r, o, a = {},
                        i = Object.keys(t);
                    for (o = 0; o < i.length; o++) r = i[o], n.indexOf(r) >= 0 || (a[r] = t[r]);
                    return a
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(t);
                    for (o = 0; o < i.length; o++) r = i[o], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (a[r] = t[r])
                }
                return a
            }

            function uQ(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var i = [],
                            l = !0,
                            u = !1;
                        try {
                            for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            u = !0, o = t
                        } finally {
                            try {
                                l || null == a.return || a.return()
                            } finally {
                                if (u) throw o
                            }
                        }
                        return i
                    }
                }(t, n) || u0(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function uJ(t) {
                return function(t) {
                    if (Array.isArray(t)) return uX(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || u0(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function u0(t, n) {
                if (t) {
                    if ("string" == typeof t) return uX(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return uX(t, n)
                }
            }

            function u1(t, n) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    o = r.checkForDefaultPrevented,
                    a = void 0 === o || o;
                return function(r) {
                    if (null == t || t(r), !1 === a || !r.defaultPrevented) return null == n ? void 0 : n(r)
                }
            }

            function u2(t) {
                var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    r = [],
                    o = function() {
                        var n = r.map(function(t) {
                            return K.createContext(t)
                        });
                        return function(r) {
                            var o = (null == r ? void 0 : r[t]) || n;
                            return K.useMemo(function() {
                                return u$({}, "__scope".concat(t), uG(uY({}, r), u$({}, t, o)))
                            }, [r, o])
                        }
                    };
                return o.scopeName = t, [function(n, o) {
                    var a = K.createContext(o),
                        i = r.length;
                    r = uJ(r).concat([o]);
                    var l = function(n) {
                        var r, o = n.scope,
                            l = n.children,
                            u = uZ(n, ["scope", "children"]),
                            c = (null == o || null == (r = o[t]) ? void 0 : r[i]) || a,
                            s = K.useMemo(function() {
                                return u
                            }, Object.values(u));
                        return (0, z.jsx)(c.Provider, {
                            value: s,
                            children: l
                        })
                    };
                    return l.displayName = n + "Provider", [l, function(r, l) {
                        var u, c = (null == l || null == (u = l[t]) ? void 0 : u[i]) || a,
                            s = K.useContext(c);
                        if (s) return s;
                        if (void 0 !== o) return o;
                        throw Error("`".concat(r, "` must be used within `").concat(n, "`"))
                    }]
                }, u3.apply(void 0, [o].concat(uJ(n)))]
            }

            function u3() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                var o = n[0];
                if (1 === n.length) return o;
                var a = function() {
                    var t = n.map(function(t) {
                        return {
                            useScope: t(),
                            scopeName: t.scopeName
                        }
                    });
                    return function(n) {
                        var r = t.reduce(function(t, r) {
                            var o = r.useScope,
                                a = r.scopeName;
                            return uY({}, t, o(n)["__scope".concat(a)])
                        }, {});
                        return K.useMemo(function() {
                            return u$({}, "__scope".concat(o.scopeName), r)
                        }, [r])
                    }
                };
                return a.scopeName = o.scopeName, a
            }

            function u4(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }

            function u5() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return function(t) {
                    var r = !1,
                        o = n.map(function(n) {
                            var o = u4(n, t);
                            return r || "function" != typeof o || (r = !0), o
                        });
                    if (r) return function() {
                        for (var t = 0; t < o.length; t++) {
                            var r = o[t];
                            "function" == typeof r ? r() : u4(n[t], null)
                        }
                    }
                }
            }

            function u6() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return K.useCallback(u5.apply(void 0, uJ(n)), n)
            }

            function u8(t) {
                var n, r, o = (n = t, (r = K.forwardRef(function(t, n) {
                        var r = t.children,
                            o = uZ(t, ["children"]);
                        if (K.isValidElement(r)) {
                            var a, i, l, u = (l = null == (a = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (i = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                c = function(t, n) {
                                    var r = uY({}, n);
                                    for (var o in n) ! function(o) {
                                        var a = t[o],
                                            i = n[o];
                                        /^on[A-Z]/.test(o) ? a && i ? r[o] = function() {
                                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                            var o = i.apply(void 0, uJ(n));
                                            return a.apply(void 0, uJ(n)), o
                                        } : a && (r[o] = a) : "style" === o ? r[o] = uY({}, a, i) : "className" === o && (r[o] = [a, i].filter(Boolean).join(" "))
                                    }(o);
                                    return uY({}, t, r)
                                }(o, r.props);
                            return r.type !== K.Fragment && (c.ref = n ? u5(n, u) : u), K.cloneElement(r, c)
                        }
                        return K.Children.count(r) > 1 ? K.Children.only(null) : null
                    })).displayName = "".concat(n, ".SlotClone"), r),
                    a = K.forwardRef(function(t, n) {
                        var r = t.children,
                            a = uZ(t, ["children"]),
                            i = K.Children.toArray(r),
                            l = i.find(u9);
                        if (l) {
                            var u = l.props.children,
                                c = i.map(function(t) {
                                    return t === l ? K.Children.count(u) > 1 ? K.Children.only(null) : K.isValidElement(u) ? u.props.children : null : t
                                });
                            return (0, z.jsx)(o, uG(uY({}, a), {
                                ref: n,
                                children: K.isValidElement(u) ? K.cloneElement(u, void 0, c) : null
                            }))
                        }
                        return (0, z.jsx)(o, uG(uY({}, a), {
                            ref: n,
                            children: r
                        }))
                    });
                return a.displayName = "".concat(t, ".Slot"), a
            }
            var u7 = Symbol("radix.slottable");

            function u9(t) {
                return K.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === u7
            }
            var ce = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(t, n) {
                    var r = u8("Primitive.".concat(n)),
                        o = K.forwardRef(function(t, o) {
                            var a = t.asChild,
                                i = uZ(t, ["asChild"]),
                                l = a ? r : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, z.jsx)(l, uG(uY({}, i), {
                                ref: o
                            }))
                        });
                    return o.displayName = "Primitive.".concat(n), uG(uY({}, t), u$({}, n, o))
                }, {}),
                ct = (null == (U = globalThis) ? void 0 : U.document) ? K.useLayoutEffect : function() {},
                cn = K[" useInsertionEffect ".trim().toString()] || ct,
                cr = "rovingFocusGroup.onEntryFocus",
                co = {
                    bubbles: !1,
                    cancelable: !0
                },
                ca = "RovingFocusGroup",
                ci = (S = (x = uQ(u2(w = ca + "CollectionProvider"), 2))[0], O = x[1], E = (j = uQ(S(w, {
                    collectionRef: {
                        current: null
                    },
                    itemMap: new Map
                }), 2))[0], C = j[1], (P = function(t) {
                    var n = t.scope,
                        r = t.children,
                        o = q().useRef(null),
                        a = q().useRef(new Map).current;
                    return (0, z.jsx)(E, {
                        scope: n,
                        itemMap: a,
                        collectionRef: o,
                        children: r
                    })
                }).displayName = w, T = u8(A = ca + "CollectionSlot"), (R = q().forwardRef(function(t, n) {
                    var r = t.scope,
                        o = t.children,
                        a = u6(n, C(A, r).collectionRef);
                    return (0, z.jsx)(T, {
                        ref: a,
                        children: o
                    })
                })).displayName = A, I = "data-radix-collection-item", k = u8(N = ca + "CollectionItemSlot"), (D = q().forwardRef(function(t, n) {
                    var r, o = t.scope,
                        a = t.children,
                        i = uZ(t, ["scope", "children"]),
                        l = q().useRef(null),
                        u = u6(n, l),
                        c = C(N, o);
                    return q().useEffect(function() {
                        return c.itemMap.set(l, uY({
                                ref: l
                            }, i)),
                            function() {
                                c.itemMap.delete(l)
                            }
                    }), (0, z.jsx)(k, (u$(r = {}, I, ""), u$(r, "ref", u), u$(r, "children", a), r))
                })).displayName = N, [{
                    Provider: P,
                    Slot: R,
                    ItemSlot: D
                }, function(t) {
                    var n = C(ca + "CollectionConsumer", t);
                    return q().useCallback(function() {
                        var t = n.collectionRef.current;
                        if (!t) return [];
                        var r = Array.from(t.querySelectorAll("[".concat(I, "]")));
                        return Array.from(n.itemMap.values()).sort(function(t, n) {
                            return r.indexOf(t.ref.current) - r.indexOf(n.ref.current)
                        })
                    }, [n.collectionRef, n.itemMap])
                }, O]),
                cl = uQ(ci, 3),
                cu = cl[0],
                cc = cl[1],
                cs = uQ(u2(ca, [cl[2]]), 2),
                cd = cs[0],
                cf = (cs[1], uQ(cd(ca), 2)),
                cp = cf[0],
                cv = cf[1],
                cm = K.forwardRef(function(t, n) {
                    return (0, z.jsx)(cu.Provider, {
                        scope: t.__scopeRovingFocusGroup,
                        children: (0, z.jsx)(cu.Slot, {
                            scope: t.__scopeRovingFocusGroup,
                            children: (0, z.jsx)(ch, uG(uY({}, t), {
                                ref: n
                            }))
                        })
                    })
                });
            cm.displayName = ca;
            var ch = K.forwardRef(function(t, n) {
                    var r, o, a, i, l, u, c, s, d, f, p, v, m, h, y, b, g, w, x, S, O, j = t.__scopeRovingFocusGroup,
                        E = t.orientation,
                        C = t.loop,
                        P = t.dir,
                        A = t.currentTabStopId,
                        T = t.defaultCurrentTabStopId,
                        R = t.onCurrentTabStopIdChange,
                        N = t.onEntryFocus,
                        I = t.preventScrollOnEntryFocus,
                        k = void 0 !== I && I,
                        D = uZ(t, ["__scopeRovingFocusGroup", "orientation", "loop", "dir", "currentTabStopId", "defaultCurrentTabStopId", "onCurrentTabStopIdChange", "onEntryFocus", "preventScrollOnEntryFocus"]),
                        L = K.useRef(null),
                        M = u6(n, L),
                        _ = tB(P),
                        F = uQ((o = (r = {
                            prop: A,
                            defaultProp: null != T ? T : null,
                            onChange: R,
                            caller: ca
                        }).prop, a = r.defaultProp, i = r.onChange, l = r.caller, y = (h = uQ((c = (u = {
                            defaultProp: a,
                            onChange: void 0 === i ? function() {} : i
                        }).defaultProp, s = u.onChange, f = (d = uQ(K.useState(c), 2))[0], p = d[1], v = K.useRef(f), m = K.useRef(s), cn(function() {
                            m.current = s
                        }, [s]), K.useEffect(function() {
                            var t;
                            v.current !== f && (null == (t = m.current) || t.call(m, f), v.current = f)
                        }, [f, v]), [f, p, m]), 3))[0], b = h[1], g = h[2], x = (w = void 0 !== o) ? o : y, S = K.useRef(void 0 !== o), K.useEffect(function() {
                            var t = S.current;
                            if (t !== w) {
                                var n = w ? "controlled" : "uncontrolled";
                                console.warn("".concat(l, " is changing from ").concat(t ? "controlled" : "uncontrolled", " to ").concat(n, ". Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component."))
                            }
                            S.current = w
                        }, [w, l]), [x, K.useCallback(function(t) {
                            if (w) {
                                var n, r = "function" == typeof t ? t(o) : t;
                                r !== o && (null == (n = g.current) || n.call(g, r))
                            } else b(t)
                        }, [w, o, b, g])]), 2),
                        U = F[0],
                        W = F[1],
                        V = uQ(K.useState(!1), 2),
                        B = V[0],
                        H = V[1],
                        q = (O = K.useRef(N), K.useEffect(function() {
                            O.current = N
                        }), K.useMemo(function() {
                            return function() {
                                for (var t, n = arguments.length, r = Array(n), o = 0; o < n; o++) r[o] = arguments[o];
                                return null == (t = O.current) ? void 0 : t.call.apply(t, [O].concat(uJ(r)))
                            }
                        }, [])),
                        X = cc(j),
                        $ = K.useRef(!1),
                        Y = uQ(K.useState(0), 2),
                        G = Y[0],
                        Z = Y[1];
                    return K.useEffect(function() {
                        var t = L.current;
                        if (t) return t.addEventListener(cr, q),
                            function() {
                                return t.removeEventListener(cr, q)
                            }
                    }, [q]), (0, z.jsx)(cp, {
                        scope: j,
                        orientation: E,
                        dir: _,
                        loop: void 0 !== C && C,
                        currentTabStopId: U,
                        onItemFocus: K.useCallback(function(t) {
                            return W(t)
                        }, [W]),
                        onItemShiftTab: K.useCallback(function() {
                            return H(!0)
                        }, []),
                        onFocusableItemAdd: K.useCallback(function() {
                            return Z(function(t) {
                                return t + 1
                            })
                        }, []),
                        onFocusableItemRemove: K.useCallback(function() {
                            return Z(function(t) {
                                return t - 1
                            })
                        }, []),
                        children: (0, z.jsx)(ce.div, uG(uY({
                            tabIndex: B || 0 === G ? -1 : 0,
                            "data-orientation": E
                        }, D), {
                            ref: M,
                            style: uY({
                                outline: "none"
                            }, t.style),
                            onMouseDown: u1(t.onMouseDown, function() {
                                $.current = !0
                            }),
                            onFocus: u1(t.onFocus, function(t) {
                                var n = !$.current;
                                if (t.target === t.currentTarget && n && !B) {
                                    var r = new CustomEvent(cr, co);
                                    if (t.currentTarget.dispatchEvent(r), !r.defaultPrevented) {
                                        var o = X().filter(function(t) {
                                            return t.focusable
                                        });
                                        cw([o.find(function(t) {
                                            return t.active
                                        }), o.find(function(t) {
                                            return t.id === U
                                        })].concat(uJ(o)).filter(Boolean).map(function(t) {
                                            return t.ref.current
                                        }), k)
                                    }
                                }
                                $.current = !1
                            }),
                            onBlur: u1(t.onBlur, function() {
                                return H(!1)
                            })
                        }))
                    })
                }),
                cy = "RovingFocusGroupItem",
                cb = K.forwardRef(function(t, n) {
                    var r = t.__scopeRovingFocusGroup,
                        o = t.focusable,
                        a = void 0 === o || o,
                        i = t.active,
                        l = t.tabStopId,
                        u = t.children,
                        c = uZ(t, ["__scopeRovingFocusGroup", "focusable", "active", "tabStopId", "children"]),
                        s = rb(),
                        d = l || s,
                        f = cv(cy, r),
                        p = f.currentTabStopId === d,
                        v = cc(r),
                        m = f.onFocusableItemAdd,
                        h = f.onFocusableItemRemove,
                        y = f.currentTabStopId;
                    return K.useEffect(function() {
                        if (a) return m(),
                            function() {
                                return h()
                            }
                    }, [a, m, h]), (0, z.jsx)(cu.ItemSlot, {
                        scope: r,
                        id: d,
                        focusable: a,
                        active: void 0 !== i && i,
                        children: (0, z.jsx)(ce.span, uG(uY({
                            tabIndex: p ? 0 : -1,
                            "data-orientation": f.orientation
                        }, c), {
                            ref: n,
                            onMouseDown: u1(t.onMouseDown, function(t) {
                                a ? f.onItemFocus(d) : t.preventDefault()
                            }),
                            onFocus: u1(t.onFocus, function() {
                                return f.onItemFocus(d)
                            }),
                            onKeyDown: u1(t.onKeyDown, function(t) {
                                if ("Tab" === t.key && t.shiftKey) return void f.onItemShiftTab();
                                if (t.target === t.currentTarget) {
                                    var n, r, o, a, i, l, u = (n = f.orientation, r = f.dir, o = t.key, a = "rtl" !== r ? o : "ArrowLeft" === o ? "ArrowRight" : "ArrowRight" === o ? "ArrowLeft" : o, "vertical" === n && ["ArrowLeft", "ArrowRight"].includes(a) || "horizontal" === n && ["ArrowUp", "ArrowDown"].includes(a) ? void 0 : cg[a]);
                                    if (void 0 !== u) {
                                        if (t.metaKey || t.ctrlKey || t.altKey || t.shiftKey) return;
                                        t.preventDefault();
                                        var c = v().filter(function(t) {
                                            return t.focusable
                                        }).map(function(t) {
                                            return t.ref.current
                                        });
                                        if ("last" === u) c.reverse();
                                        else if ("prev" === u || "next" === u) {
                                            "prev" === u && c.reverse();
                                            var s = c.indexOf(t.currentTarget);
                                            c = f.loop ? (l = s + 1, (i = c).map(function(t, n) {
                                                return i[(l + n) % i.length]
                                            })) : c.slice(s + 1)
                                        }
                                        setTimeout(function() {
                                            return cw(c)
                                        })
                                    }
                                }
                            }),
                            children: "function" == typeof u ? u({
                                isCurrentTabStop: p,
                                hasTabStop: null != y
                            }) : u
                        }))
                    })
                });
            cb.displayName = cy;
            var cg = {
                ArrowLeft: "prev",
                ArrowUp: "prev",
                ArrowRight: "next",
                ArrowDown: "next",
                PageUp: "first",
                Home: "first",
                PageDown: "last",
                End: "last"
            };

            function cw(t) {
                var n = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                    r = document.activeElement,
                    o = !0,
                    a = !1,
                    i = void 0;
                try {
                    for (var l, u = t[Symbol.iterator](); !(o = (l = u.next()).done); o = !0) {
                        var c = l.value;
                        if (c === r || (c.focus({
                                preventScroll: n
                            }), document.activeElement !== r)) return
                    }
                } catch (t) {
                    a = !0, i = t
                } finally {
                    try {
                        o || null == u.return || u.return()
                    } finally {
                        if (a) throw i
                    }
                }
            }
            var cx = {
                    XSmall: "radius-medium",
                    Small: "radius-large",
                    Medium: "radius-large",
                    Large: "radius-large"
                },
                cS = {
                    XSmall: "padding-xsmall",
                    Small: "padding-small",
                    Medium: "padding-small",
                    Large: "padding-small"
                },
                cO = {
                    XSmall: "padding-x-medium",
                    Small: "padding-x-medium",
                    Medium: "padding-x-medium",
                    Large: "padding-x-large"
                },
                cj = {
                    XSmall: "padding-y-xsmall",
                    Small: "padding-y-small",
                    Medium: "padding-y-small",
                    Large: "padding-y-medium"
                },
                cE = {
                    XSmall: "gap-x-medium",
                    Small: "gap-x-medium",
                    Medium: "gap-x-medium",
                    Large: "gap-x-large"
                },
                cC = {
                    XSmall: "gap-y-xxsmall",
                    Small: "gap-y-xxsmall",
                    Medium: "gap-y-xsmall",
                    Large: "gap-y-xsmall"
                },
                cP = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                cA = {
                    XSmall: "radius-small",
                    Small: "radius-medium",
                    Medium: "radius-medium",
                    Large: "radius-medium"
                },
                cT = (0, K.createContext)(null),
                cR = function() {
                    var t = (0, K.useContext)(cT);
                    if (!t) throw Error("Menu components must be used within a Menu");
                    return t
                },
                cN = function(t) {
                    var n, r = t.children,
                        o = t.className,
                        a = t.size,
                        i = (0, K.useContext)(uE),
                        l = i ? "dropdown" : "standalone",
                        u = null != (n = null != a ? a : null == i ? void 0 : i.size) ? n : "Medium",
                        c = (0, K.useMemo)(function() {
                            return {
                                size: u,
                                mode: l
                            }
                        }, [u, l]),
                        s = tS("foundation-web-menu bg-surface-100 stroke-standard stroke-default shadow-transient-high", cx[u], o),
                        d = "standalone" === l ? q().createElement(cm, {
                            asChild: !0,
                            orientation: "vertical",
                            loop: !0
                        }, q().createElement("div", {
                            role: "menu",
                            tabIndex: -1,
                            className: s
                        }, r)) : q().createElement("div", {
                            className: s
                        }, r);
                    return q().createElement(cT.Provider, {
                        value: c
                    }, "dropdown" === l ? q().createElement(ur, {
                        asChild: !0,
                        style: {
                            width: "var(--radix-popper-anchor-width)"
                        }
                    }, d) : d)
                },
                cI = function(t) {
                    var n = t.children,
                        r = t.className,
                        o = cR().size;
                    return q().createElement("div", {
                        role: "group",
                        className: tS(cS[o], r)
                    }, n)
                },
                ck = function(t) {
                    var n, r = t.value,
                        o = t.leading,
                        a = t.title,
                        i = t.description,
                        l = t.trailing,
                        u = t.disabled,
                        c = t.className,
                        s = t.onSelect,
                        d = t.asChild,
                        f = t.children,
                        p = tK(t, ["value", "leading", "title", "description", "trailing", "disabled", "className", "onSelect", "asChild", "children"]),
                        v = cR(),
                        m = v.size,
                        h = v.mode,
                        y = tS(aE, "foundation-web-menu-item flex items-center content-default text-truncate-split focus-visible:hover:outline-none cursor-pointer stroke-none bg-none text-align-x-left width-full", cP[m], cO[m], cj[m], cE[m], cA[m], u && aP, u && "pointer-events-none", c),
                        b = q().createElement("span", {
                            className: "foundation-web-menu-item-title text-no-wrap text-truncate-split content-emphasis"
                        }, a);
                    switch (h) {
                        case "dropdown":
                            b = q().createElement(um, {
                                asChild: !0
                            }, b);
                            break;
                        case "standalone":
                            break;
                        default:
                            console.error("Invalid menu mode:", h)
                    }
                    var g = q().createElement(q().Fragment, null, !u && q().createElement(aC, null), o, q().createElement("div", {
                        className: tS("grow-1 text-truncate-split flex flex-col", cC[m])
                    }, b, i && q().createElement("div", {
                        className: "foundation-web-menu-item-description content-muted"
                    }, i)), l);
                    if (d) {
                        var w = tK(p, ["as"]),
                            x = q().Children.only(f),
                            S = void 0 === a && x.props.children;
                        n = q().createElement(uH, Object.assign({}, w, {
                            role: "standalone" === h ? "menuitem" : void 0,
                            "aria-disabled": u || void 0,
                            className: y,
                            style: {
                                outlineOffset: 0
                            },
                            onClick: u ? void 0 : s
                        }), S ? q().cloneElement(x, {}, q().createElement(q().Fragment, null, !u && q().createElement(aC, null), x.props.children)) : q().cloneElement(x, {}, g))
                    } else if ("a" === p.as) {
                        p.as;
                        var O = p.href,
                            j = tK(p, ["as", "href"]);
                        n = q().createElement("a", Object.assign({}, j, {
                            role: "standalone" === h ? "menuitem" : void 0,
                            "aria-disabled": u,
                            href: u ? void 0 : O,
                            className: y,
                            style: {
                                outlineOffset: 0,
                                textDecoration: "none"
                            },
                            onClick: u ? void 0 : s
                        }), g)
                    } else {
                        var E = tK(p, ["as"]);
                        n = q().createElement("button", Object.assign({
                            type: "button"
                        }, E, {
                            role: "standalone" === h ? "menuitem" : void 0,
                            "aria-disabled": u,
                            className: y,
                            style: {
                                outlineOffset: 0
                            },
                            onClick: u ? void 0 : s
                        }), g)
                    }
                    return "dropdown" === h ? q().createElement(up, {
                        value: r,
                        disabled: u,
                        asChild: !0
                    }, n) : q().createElement(cb, {
                        asChild: !0,
                        focusable: !0,
                        tabStopId: r
                    }, n)
                },
                cD = "__all__",
                cL = function(t) {
                    return "" === t ? cD : t
                },
                cM = ["Enter", " "],
                c_ = function(t) {
                    var n, r = t.options,
                        o = t.value,
                        a = t.onSelect,
                        i = r.find(function(t) {
                            return t.value === o
                        }),
                        l = (0, K.useRef)("touch");
                    return (0, z.jsx)(uk, {
                        size: "Medium",
                        value: cL(o),
                        placeholder: null != (n = null == i ? void 0 : i.label) ? n : "",
                        onValueChange: function(t) {
                            a(t === cD ? "" : t)
                        },
                        children: (0, z.jsx)(cN, {
                            children: (0, z.jsx)(cI, {
                                children: r.map(function(t) {
                                    var n = function() {
                                        t.value === o && a(o)
                                    };
                                    return (0, z.jsx)(ck, {
                                        value: cL(t.value),
                                        title: t.label,
                                        onPointerDown: function(t) {
                                            l.current = "mouse" === t.pointerType ? "mouse" : "touch"
                                        },
                                        onPointerUp: function() {
                                            "mouse" === l.current && n()
                                        },
                                        onSelect: function() {
                                            "touch" === l.current && n()
                                        },
                                        onKeyDown: function(t) {
                                            cM.includes(t.key) && (l.current = "keyboard", n())
                                        }
                                    }, t.value)
                                })
                            })
                        })
                    })
                },
                cF = window.RobloxThumbnails,
                cU = function(t) {
                    var n, r;
                    return (null == (n = t.user) ? void 0 : n.id) === (null == (r = (0, en.authenticatedUser)()) ? void 0 : r.id)
                },
                cW = function(t, n) {
                    var r = ei.tradeStatus;
                    switch (t) {
                        case r.open:
                            return n("Label.TradeStatusOpen");
                        case r.pending:
                            return n("Label.TradeStatusPending");
                        case r.completed:
                            return n("Label.TradeStatusCompleted");
                        case r.expired:
                            return n("Label.TradeStatusExpired");
                        case r.declined:
                            return n("Label.TradeStatusDeclined");
                        case r.rejectedDueToError:
                            return n("Label.TradeStatusRejectedDueToError");
                        case r.countered:
                            return n("Label.TradeStatusCountered");
                        case r.processing:
                            return n("Label.TradeStatusProcessing");
                        case r.interventionRequired:
                            return n("Label.TradeStatusInterventionRequired");
                        default:
                            return n("Label.TradeStatusUnknown")
                    }
                },
                cz = function(t, n, r) {
                    var o = cU(n),
                        a = ei.tradeStatusType;
                    switch (t.tradeStatusType) {
                        case a.completed:
                            return r(o ? "Label.ItemsYouGave" : "Label.ItemsYouReceived");
                        case a.inactive:
                            return r(o ? "Label.ItemsWouldHaveGiven" : "Label.ItemsWouldHaveReceived");
                        case a.inbound:
                        case a.outbound:
                        default:
                            return r(o ? "Label.ItemsYouWillGive" : "Label.ItemsYouWillReceive")
                    }
                },
                cV = function(t) {
                    var n, r = t.trade,
                        o = t.isSelected,
                        a = t.onClick,
                        i = t.onProfileClick,
                        l = (0, H.useTranslation)().translate,
                        u = r.user;
                    return (0, z.jsxs)("div", {
                        className: "trade-row".concat(o ? " selected" : ""),
                        onClick: function() {
                            a(r)
                        },
                        role: "button",
                        tabIndex: 0,
                        onKeyDown: function(t) {
                            ("Enter" === t.key || " " === t.key) && a(r)
                        },
                        children: [(0, z.jsx)("div", {
                            className: "rbx-divider"
                        }), (0, z.jsx)("div", {
                            className: "trade-row-container",
                            children: (0, z.jsx)("div", {
                                className: "trade-row-details",
                                children: (0, z.jsxs)("div", {
                                    children: [(0, z.jsx)("div", {
                                        className: "avatar avatar-headshot avatar-headshot-sm",
                                        children: u ? (0, z.jsx)("a", {
                                            href: "/users/".concat(u.id, "/profile"),
                                            target: "_self",
                                            className: "avatar-card-link",
                                            onClick: function(t) {
                                                t.stopPropagation(), i(r, "listRow")
                                            },
                                            children: (0, z.jsx)(cF.Thumbnail2d, {
                                                type: cF.ThumbnailTypes.avatarHeadshot,
                                                targetId: u.id,
                                                size: cF.ThumbnailAvatarHeadshotSize.size60,
                                                containerClass: "avatar-card-image"
                                            })
                                        }) : (0, z.jsx)("span", {
                                            className: "avatar-card-image"
                                        })
                                    }), (0, z.jsx)("div", {
                                        className: "text-lead",
                                        children: null != (n = null == u ? void 0 : u.nameForDisplay) ? n : ""
                                    }), (0, z.jsx)("div", {
                                        className: "text-date-hint",
                                        children: cW(r.status, l)
                                    }), (0, z.jsx)("span", {
                                        className: "font-caption-body text-date-hint text trade-sent-date",
                                        children: tf(r.created)
                                    })]
                                })
                            })
                        })]
                    })
                };

            function cB(t, n, r, o, a, i, l) {
                try {
                    var u = t[i](l),
                        c = u.value
                } catch (t) {
                    r(t);
                    return
                }
                u.done ? n(c) : Promise.resolve(c).then(o, a)
            }

            function cH(t) {
                return function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(o, a) {
                        var i = t.apply(n, r);

                        function l(t) {
                            cB(i, o, a, l, u, "next", t)
                        }

                        function u(t) {
                            cB(i, o, a, l, u, "throw", t)
                        }
                        l(void 0)
                    })
                }
            }

            function cK(t, n) {
                var r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return l.next = u(0), l.throw = u(1), l.return = u(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                    return this
                }), l;

                function u(u) {
                    return function(c) {
                        var s = [u, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                            if (r = 1, o && (a = 2 & s[0] ? o.return : s[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, s[1])).done) return a;
                            switch (o = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                case 0:
                                case 1:
                                    a = s;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, o = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                        i.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && i.label < a[1]) {
                                        i.label = a[1], a = s;
                                        break
                                    }
                                    if (a && i.label < a[2]) {
                                        i.label = a[2], i.ops.push(s);
                                        break
                                    }
                                    a[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            s = n.call(t, i)
                        } catch (t) {
                            s = [6, t], o = 0
                        } finally {
                            r = a = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var cq = function() {
                    return cH(function() {
                        var t, n;
                        return cK(this, function(r) {
                            switch (r.label) {
                                case 0:
                                    return n = ei.urls.get2SVConfiguration.replace("{userId}", String(null == (t = (0, en.authenticatedUser)()) ? void 0 : t.id)), [4, eu.get({
                                        url: n,
                                        withCredentials: !0
                                    })];
                                case 1:
                                    return [2, r.sent().data.methods.some(function(t) {
                                        return t.enabled
                                    })]
                            }
                        })
                    })()
                },
                cX = function() {
                    window.location.href = ei.urls.settings
                },
                c$ = function(t, n) {
                    switch (t[0]) {
                        case 2:
                        case 4:
                            return n("Error.TradeUnauthorized");
                        case 6:
                            return n("Error.WaitingForConfirmation");
                        case 10:
                            return n("Error.InvalidTradePartner");
                        case 7:
                            return n("Error.TradeUsersCannotTrade");
                        case 3:
                            return n("Error.TradeInactive");
                        case 5:
                            return n("Error.TradeSystemUnavailable");
                        case 23:
                            return n("Error.TradeFrictionEncountered");
                        default:
                            return n("Error.TradeUnknownError")
                    }
                },
                cY = function(t, n) {
                    var r = ei.invalidUserAssetReason;
                    switch (t) {
                        case r.doesNotExist:
                            return n("Error.UserAssetDoesNotExist");
                        case r.notOwned:
                            return n("Error.UserAssetNotOwned");
                        case r.recipientNeedsMembership:
                        case r.recipientNeedsHigherMembershipType:
                            return n("Error.RequiresPremiumMembership");
                        case r.contentRatingRestricted:
                            return n("Error.UserAssetContentRestricted");
                        case r.notTradeable:
                            return n("Error.UserAssetNotTradeable");
                        default:
                            return n("Error.UserAssetUnknownError")
                    }
                },
                cG = window.Roblox.AccountIntegrityChallengeService.TwoStepVerification,
                cZ = function(t) {
                    var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        r = (0, H.useTranslation)().translate,
                        o = (0, K.useRef)(""),
                        a = (0, K.useRef)(0),
                        i = (0, K.useRef)(n);
                    i.current = n;
                    var l = function() {
                            window.location.reload()
                        },
                        u = function() {
                            t.warning(r("Response.VerificationError"), 100, 6e3)
                        },
                        c = function(n) {
                            var a, c;
                            (a = o.current, c = n.verificationToken, cH(function() {
                                return cK(this, function(t) {
                                    switch (t.label) {
                                        case 0:
                                            return [4, eu.post({
                                                url: ei.urls.redeem,
                                                withCredentials: !0
                                            }, {
                                                challengeToken: a,
                                                verificationToken: c
                                            })];
                                        case 1:
                                            return [2, t.sent().data]
                                    }
                                })
                            })()).then(function(n) {
                                if (n) {
                                    var o;
                                    t.success(r("Response.SuccessfulVerificationV2"), 100, 6e3), (null != (o = i.current.onVerificationSuccess) ? o : l)()
                                } else u()
                            }).catch(u)
                        },
                        s = function() {
                            cH(function() {
                                return cK(this, function(t) {
                                    switch (t.label) {
                                        case 0:
                                            return [4, eu.post({
                                                url: ei.urls.generate,
                                                withCredentials: !0
                                            }, {})];
                                        case 1:
                                            return [2, t.sent().data]
                                    }
                                })
                            })().then(function(t) {
                                var n;
                                o.current = t, cG.renderChallenge({
                                    containerId: "2sv-popup-container",
                                    userId: null == (n = (0, en.authenticatedUser)()) ? void 0 : n.id,
                                    challengeId: t,
                                    actionType: cG.ActionType.ItemTrade,
                                    renderInline: !1,
                                    shouldShowRememberDeviceCheckbox: !1,
                                    onChallengeCompleted: c,
                                    onChallengeInvalidated: function() {
                                        a.current < 3 && s(), a.current += 1
                                    },
                                    onModalChallengeAbandoned: function() {
                                        var t;
                                        (null != (t = i.current.onChallengeAbandoned) ? t : l)()
                                    }
                                })
                            }).catch(u)
                        };
                    return {
                        start: function() {
                            a.current = 0, s()
                        }
                    }
                };

            function cQ(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function cJ(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function c0(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        cJ(t, n, r[n])
                    })
                }
                return t
            }

            function c1(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function c2(t, n) {
                if (null == t) return {};
                var r, o, a = function(t, n) {
                    if (null == t) return {};
                    var r, o, a = {},
                        i = Object.keys(t);
                    for (o = 0; o < i.length; o++) r = i[o], n.indexOf(r) >= 0 || (a[r] = t[r]);
                    return a
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(t);
                    for (o = 0; o < i.length; o++) r = i[o], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (a[r] = t[r])
                }
                return a
            }

            function c3(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var i = [],
                            l = !0,
                            u = !1;
                        try {
                            for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            u = !0, o = t
                        } finally {
                            try {
                                l || null == a.return || a.return()
                            } finally {
                                if (u) throw o
                            }
                        }
                        return i
                    }
                }(t, n) || c5(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function c4(t) {
                return function(t) {
                    if (Array.isArray(t)) return cQ(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || c5(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function c5(t, n) {
                if (t) {
                    if ("string" == typeof t) return cQ(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return cQ(t, n)
                }
            }

            function c6(t, n) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    o = r.checkForDefaultPrevented,
                    a = void 0 === o || o;
                return function(r) {
                    if (null == t || t(r), !1 === a || !r.defaultPrevented) return null == n ? void 0 : n(r)
                }
            }

            function c8(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }

            function c7() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return function(t) {
                    var r = !1,
                        o = n.map(function(n) {
                            var o = c8(n, t);
                            return r || "function" != typeof o || (r = !0), o
                        });
                    if (r) return function() {
                        for (var t = 0; t < o.length; t++) {
                            var r = o[t];
                            "function" == typeof r ? r() : c8(n[t], null)
                        }
                    }
                }
            }

            function c9() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return K.useCallback(c7.apply(void 0, c4(n)), n)
            }

            function se() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                var o = n[0];
                if (1 === n.length) return o;
                var a = function() {
                    var t = n.map(function(t) {
                        return {
                            useScope: t(),
                            scopeName: t.scopeName
                        }
                    });
                    return function(n) {
                        var r = t.reduce(function(t, r) {
                            var o = r.useScope,
                                a = r.scopeName;
                            return c0({}, t, o(n)["__scope".concat(a)])
                        }, {});
                        return K.useMemo(function() {
                            return cJ({}, "__scope".concat(o.scopeName), r)
                        }, [r])
                    }
                };
                return a.scopeName = o.scopeName, a
            }

            function st(t) {
                var n = K.useRef(t);
                return K.useEffect(function() {
                    n.current = t
                }), K.useMemo(function() {
                    return function() {
                        for (var t, r = arguments.length, o = Array(r), a = 0; a < r; a++) o[a] = arguments[a];
                        return null == (t = n.current) ? void 0 : t.call.apply(t, [n].concat(c4(o)))
                    }
                }, [])
            }
            var sn = (null == (W = globalThis) ? void 0 : W.document) ? K.useLayoutEffect : function() {},
                sr = function(t) {
                    var n, r, o, a, i, l, u, c, s, d, f, p, v, m, h = t.present,
                        y = t.children,
                        b = (a = (o = c3(K.useState(), 2))[0], i = o[1], l = K.useRef({}), u = K.useRef(h), c = K.useRef("none"), d = (s = c3((n = h ? "mounted" : "unmounted", r = {
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
                        }, K.useReducer(function(t, n) {
                            var o;
                            return null != (o = r[t][n]) ? o : t
                        }, n)), 2))[0], f = s[1], K.useEffect(function() {
                            var t = so(l.current);
                            c.current = "mounted" === d ? t : "none"
                        }, [d]), sn(function() {
                            var t = l.current,
                                n = u.current;
                            if (n !== h) {
                                var r = c.current,
                                    o = so(t);
                                h ? f("MOUNT") : "none" === o || "none" === (null == t ? void 0 : t.display) ? f("UNMOUNT") : f(n && r !== o ? "ANIMATION_OUT" : "UNMOUNT"), u.current = h
                            }
                        }, [h, f]), sn(function() {
                            if (a) {
                                var t, n, r = null != (n = a.ownerDocument.defaultView) ? n : window,
                                    o = function(n) {
                                        var o = so(l.current).includes(n.animationName);
                                        if (n.target === a && o && (f("ANIMATION_END"), !u.current)) {
                                            var i = a.style.animationFillMode;
                                            a.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                                "forwards" === a.style.animationFillMode && (a.style.animationFillMode = i)
                                            })
                                        }
                                    },
                                    i = function(t) {
                                        t.target === a && (c.current = so(l.current))
                                    };
                                return a.addEventListener("animationstart", i), a.addEventListener("animationcancel", o), a.addEventListener("animationend", o),
                                    function() {
                                        r.clearTimeout(t), a.removeEventListener("animationstart", i), a.removeEventListener("animationcancel", o), a.removeEventListener("animationend", o)
                                    }
                            }
                            f("ANIMATION_END")
                        }, [a, f]), {
                            isPresent: ["mounted", "unmountSuspended"].includes(d),
                            ref: K.useCallback(function(t) {
                                t && (l.current = getComputedStyle(t)), i(t)
                            }, [])
                        }),
                        g = "function" == typeof y ? y({
                            present: b.isPresent
                        }) : K.Children.only(y),
                        w = c9(b.ref, (m = null == (p = Object.getOwnPropertyDescriptor(g.props, "ref")) ? void 0 : p.get) && "isReactWarning" in m && m.isReactWarning ? g.ref : (m = null == (v = Object.getOwnPropertyDescriptor(g, "ref")) ? void 0 : v.get) && "isReactWarning" in m && m.isReactWarning ? g.props.ref : g.props.ref || g.ref);
                    return "function" == typeof y || b.isPresent ? K.cloneElement(g, {
                        ref: w
                    }) : null
                };

            function so(t) {
                return (null == t ? void 0 : t.animationName) || "none"
            }

            function sa(t) {
                var n, r, o = (n = t, (r = K.forwardRef(function(t, n) {
                        var r = t.children,
                            o = c2(t, ["children"]);
                        if (K.isValidElement(r)) {
                            var a, i, l, u = (l = null == (a = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (i = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                c = function(t, n) {
                                    var r = c0({}, n);
                                    for (var o in n) ! function(o) {
                                        var a = t[o],
                                            i = n[o];
                                        /^on[A-Z]/.test(o) ? a && i ? r[o] = function() {
                                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                            i.apply(void 0, c4(n)), a.apply(void 0, c4(n))
                                        } : a && (r[o] = a) : "style" === o ? r[o] = c0({}, a, i) : "className" === o && (r[o] = [a, i].filter(Boolean).join(" "))
                                    }(o);
                                    return c0({}, t, r)
                                }(o, r.props);
                            return r.type !== K.Fragment && (c.ref = n ? c7(n, u) : u), K.cloneElement(r, c)
                        }
                        return K.Children.count(r) > 1 ? K.Children.only(null) : null
                    })).displayName = "".concat(n, ".SlotClone"), r),
                    a = K.forwardRef(function(t, n) {
                        var r = t.children,
                            a = c2(t, ["children"]),
                            i = K.Children.toArray(r),
                            l = i.find(sl);
                        if (l) {
                            var u = l.props.children,
                                c = i.map(function(t) {
                                    return t === l ? K.Children.count(u) > 1 ? K.Children.only(null) : K.isValidElement(u) ? u.props.children : null : t
                                });
                            return (0, z.jsx)(o, c1(c0({}, a), {
                                ref: n,
                                children: K.isValidElement(u) ? K.cloneElement(u, void 0, c) : null
                            }))
                        }
                        return (0, z.jsx)(o, c1(c0({}, a), {
                            ref: n,
                            children: r
                        }))
                    });
                return a.displayName = "".concat(t, ".Slot"), a
            }
            sr.displayName = "Presence";
            var si = Symbol("radix.slottable");

            function sl(t) {
                return K.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === si
            }
            var su = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                    var r = sa("Primitive.".concat(n)),
                        o = K.forwardRef(function(t, o) {
                            var a = t.asChild,
                                i = c2(t, ["asChild"]),
                                l = a ? r : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, z.jsx)(l, c1(c0({}, i), {
                                ref: o
                            }))
                        });
                    return o.displayName = "Primitive.".concat(n), c1(c0({}, t), cJ({}, n, o))
                }, {}),
                sc = "Dialog",
                ss = c3(function(t) {
                    var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        o = function() {
                            var n = r.map(function(t) {
                                return K.createContext(t)
                            });
                            return function(r) {
                                var o = (null == r ? void 0 : r[t]) || n;
                                return K.useMemo(function() {
                                    return cJ({}, "__scope".concat(t), c1(c0({}, r), cJ({}, t, o)))
                                }, [r, o])
                            }
                        };
                    return o.scopeName = t, [function(n, o) {
                        var a = K.createContext(o),
                            i = r.length;
                        r = c4(r).concat([o]);
                        var l = function(n) {
                            var r, o = n.scope,
                                l = n.children,
                                u = c2(n, ["scope", "children"]),
                                c = (null == o || null == (r = o[t]) ? void 0 : r[i]) || a,
                                s = K.useMemo(function() {
                                    return u
                                }, Object.values(u));
                            return (0, z.jsx)(c.Provider, {
                                value: s,
                                children: l
                            })
                        };
                        return l.displayName = n + "Provider", [l, function(r, l) {
                            var u, c = (null == l || null == (u = l[t]) ? void 0 : u[i]) || a,
                                s = K.useContext(c);
                            if (s) return s;
                            if (void 0 !== o) return o;
                            throw Error("`".concat(r, "` must be used within `").concat(n, "`"))
                        }]
                    }, se.apply(void 0, [o].concat(c4(n)))]
                }(sc), 2),
                sd = ss[0],
                sf = (ss[1], c3(sd(sc), 2)),
                sp = sf[0],
                sv = sf[1],
                sm = function(t) {
                    var n, r, o, a, i, l, u, c, s, d, f, p, v, m, h, y, b, g = t.__scopeDialog,
                        w = t.children,
                        x = t.open,
                        S = t.defaultOpen,
                        O = t.onOpenChange,
                        j = t.modal,
                        E = K.useRef(null),
                        C = K.useRef(null),
                        P = c3((r = (n = {
                            prop: x,
                            defaultProp: S,
                            onChange: O
                        }).prop, v = (p = c3((l = (i = {
                            defaultProp: n.defaultProp,
                            onChange: a = void 0 === (o = n.onChange) ? function() {} : o
                        }).defaultProp, u = i.onChange, s = c3(c = K.useState(l), 1)[0], d = K.useRef(s), f = st(u), K.useEffect(function() {
                            d.current !== s && (f(s), d.current = s)
                        }, [s, d, f]), c), 2))[0], m = p[1], y = (h = void 0 !== r) ? r : v, b = st(a), [y, K.useCallback(function(t) {
                            if (h) {
                                var n = "function" == typeof t ? t(r) : t;
                                n !== r && b(n)
                            } else m(t)
                        }, [h, r, m, b])]), 2),
                        A = P[0],
                        T = P[1];
                    return (0, z.jsx)(sp, {
                        scope: g,
                        triggerRef: E,
                        contentRef: C,
                        contentId: rb(),
                        titleId: rb(),
                        descriptionId: rb(),
                        open: void 0 !== A && A,
                        onOpenChange: T,
                        onOpenToggle: K.useCallback(function() {
                            return T(function(t) {
                                return !t
                            })
                        }, [T]),
                        modal: void 0 === j || j,
                        children: w
                    })
                };
            sm.displayName = sc;
            var sh = "DialogTrigger";
            K.forwardRef(function(t, n) {
                var r = t.__scopeDialog,
                    o = c2(t, ["__scopeDialog"]),
                    a = sv(sh, r),
                    i = c9(n, a.triggerRef);
                return (0, z.jsx)(su.button, c1(c0({
                    type: "button",
                    "aria-haspopup": "dialog",
                    "aria-expanded": a.open,
                    "aria-controls": a.contentId,
                    "data-state": sM(a.open)
                }, o), {
                    ref: i,
                    onClick: c6(t.onClick, a.onOpenToggle)
                }))
            }).displayName = sh;
            var sy = "DialogPortal",
                sb = c3(sd(sy, {
                    forceMount: void 0
                }), 2),
                sg = sb[0],
                sw = sb[1],
                sx = function(t) {
                    var n = t.__scopeDialog,
                        r = t.forceMount,
                        o = t.children,
                        a = t.container,
                        i = sv(sy, n);
                    return (0, z.jsx)(sg, {
                        scope: n,
                        forceMount: r,
                        children: K.Children.map(o, function(t) {
                            return (0, z.jsx)(sr, {
                                present: r || i.open,
                                children: (0, z.jsx)(nT, {
                                    asChild: !0,
                                    container: a,
                                    children: t
                                })
                            })
                        })
                    })
                };
            sx.displayName = sy;
            var sS = "DialogOverlay",
                sO = K.forwardRef(function(t, n) {
                    var r = sw(sS, t.__scopeDialog),
                        o = t.forceMount,
                        a = void 0 === o ? r.forceMount : o,
                        i = c2(t, ["forceMount"]),
                        l = sv(sS, t.__scopeDialog);
                    return l.modal ? (0, z.jsx)(sr, {
                        present: a || l.open,
                        children: (0, z.jsx)(sE, c1(c0({}, i), {
                            ref: n
                        }))
                    }) : null
                });
            sO.displayName = sS;
            var sj = sa("DialogOverlay.RemoveScroll"),
                sE = K.forwardRef(function(t, n) {
                    var r = t.__scopeDialog,
                        o = c2(t, ["__scopeDialog"]),
                        a = sv(sS, r);
                    return (0, z.jsx)(rp, {
                        as: sj,
                        allowPinchZoom: !0,
                        shards: [a.contentRef],
                        children: (0, z.jsx)(su.div, c1(c0({
                            "data-state": sM(a.open)
                        }, o), {
                            ref: n,
                            style: c0({
                                pointerEvents: "auto"
                            }, o.style)
                        }))
                    })
                }),
                sC = "DialogContent",
                sP = K.forwardRef(function(t, n) {
                    var r = sw(sC, t.__scopeDialog),
                        o = t.forceMount,
                        a = void 0 === o ? r.forceMount : o,
                        i = c2(t, ["forceMount"]),
                        l = sv(sC, t.__scopeDialog);
                    return (0, z.jsx)(sr, {
                        present: a || l.open,
                        children: l.modal ? (0, z.jsx)(sA, c1(c0({}, i), {
                            ref: n
                        })) : (0, z.jsx)(sT, c1(c0({}, i), {
                            ref: n
                        }))
                    })
                });
            sP.displayName = sC;
            var sA = K.forwardRef(function(t, n) {
                    var r = sv(sC, t.__scopeDialog),
                        o = K.useRef(null),
                        a = c9(n, r.contentRef, o);
                    return K.useEffect(function() {
                        var t = o.current;
                        if (t) return nM(t)
                    }, []), (0, z.jsx)(sR, c1(c0({}, t), {
                        ref: a,
                        trapFocus: r.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: c6(t.onCloseAutoFocus, function(t) {
                            var n;
                            t.preventDefault(), null == (n = r.triggerRef.current) || n.focus()
                        }),
                        onPointerDownOutside: c6(t.onPointerDownOutside, function(t) {
                            var n = t.detail.originalEvent,
                                r = 0 === n.button && !0 === n.ctrlKey;
                            (2 === n.button || r) && t.preventDefault()
                        }),
                        onFocusOutside: c6(t.onFocusOutside, function(t) {
                            return t.preventDefault()
                        })
                    }))
                }),
                sT = K.forwardRef(function(t, n) {
                    var r = sv(sC, t.__scopeDialog),
                        o = K.useRef(!1),
                        a = K.useRef(!1);
                    return (0, z.jsx)(sR, c1(c0({}, t), {
                        ref: n,
                        trapFocus: !1,
                        disableOutsidePointerEvents: !1,
                        onCloseAutoFocus: function(n) {
                            var i, l;
                            null == (i = t.onCloseAutoFocus) || i.call(t, n), n.defaultPrevented || (o.current || null == (l = r.triggerRef.current) || l.focus(), n.preventDefault()), o.current = !1, a.current = !1
                        },
                        onInteractOutside: function(n) {
                            null == (i = t.onInteractOutside) || i.call(t, n), n.defaultPrevented || (o.current = !0, "pointerdown" === n.detail.originalEvent.type && (a.current = !0));
                            var i, l, u = n.target;
                            (null == (l = r.triggerRef.current) ? void 0 : l.contains(u)) && n.preventDefault(), "focusin" === n.detail.originalEvent.type && a.current && n.preventDefault()
                        }
                    }))
                }),
                sR = K.forwardRef(function(t, n) {
                    var r = t.__scopeDialog,
                        o = t.trapFocus,
                        a = t.onOpenAutoFocus,
                        i = t.onCloseAutoFocus,
                        l = c2(t, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        u = sv(sC, r),
                        c = K.useRef(null),
                        s = c9(n, c);
                    return nl(), (0, z.jsxs)(z.Fragment, {
                        children: [(0, z.jsx)(nb, {
                            asChild: !0,
                            loop: !0,
                            trapped: o,
                            onMountAutoFocus: a,
                            onUnmountAutoFocus: i,
                            children: (0, z.jsx)(nr, c1(c0({
                                role: "dialog",
                                id: u.contentId,
                                "aria-describedby": u.descriptionId,
                                "aria-labelledby": u.titleId,
                                "data-state": sM(u.open)
                            }, l), {
                                ref: s,
                                onDismiss: function() {
                                    return u.onOpenChange(!1)
                                }
                            }))
                        }), (0, z.jsxs)(z.Fragment, {
                            children: [(0, z.jsx)(sW, {
                                titleId: u.titleId
                            }), (0, z.jsx)(sz, {
                                contentRef: c,
                                descriptionId: u.descriptionId
                            })]
                        })]
                    })
                }),
                sN = "DialogTitle",
                sI = K.forwardRef(function(t, n) {
                    var r = t.__scopeDialog,
                        o = c2(t, ["__scopeDialog"]),
                        a = sv(sN, r);
                    return (0, z.jsx)(su.h2, c1(c0({
                        id: a.titleId
                    }, o), {
                        ref: n
                    }))
                });
            sI.displayName = sN;
            var sk = "DialogDescription";
            K.forwardRef(function(t, n) {
                var r = t.__scopeDialog,
                    o = c2(t, ["__scopeDialog"]),
                    a = sv(sk, r);
                return (0, z.jsx)(su.p, c1(c0({
                    id: a.descriptionId
                }, o), {
                    ref: n
                }))
            }).displayName = sk;
            var sD = "DialogClose",
                sL = K.forwardRef(function(t, n) {
                    var r = t.__scopeDialog,
                        o = c2(t, ["__scopeDialog"]),
                        a = sv(sD, r);
                    return (0, z.jsx)(su.button, c1(c0({
                        type: "button"
                    }, o), {
                        ref: n,
                        onClick: c6(t.onClick, function() {
                            return a.onOpenChange(!1)
                        })
                    }))
                });

            function sM(t) {
                return t ? "open" : "closed"
            }
            sL.displayName = sD;
            var s_ = "DialogTitleWarning",
                sF = c3((L = {
                    contentName: sC,
                    titleName: sN,
                    docsSlug: "dialog"
                }, M = K.createContext(L), (_ = function(t) {
                    var n = t.children,
                        r = c2(t, ["children"]),
                        o = K.useMemo(function() {
                            return r
                        }, Object.values(r));
                    return (0, z.jsx)(M.Provider, {
                        value: o,
                        children: n
                    })
                }).displayName = s_ + "Provider", [_, function(t) {
                    var n = K.useContext(M);
                    if (n) return n;
                    if (void 0 !== L) return L;
                    throw Error("`".concat(t, "` must be used within `").concat(s_, "`"))
                }]), 2),
                sU = (sF[0], sF[1]),
                sW = function(t) {
                    var n = t.titleId,
                        r = sU(s_),
                        o = "`".concat(r.contentName, "` requires a `").concat(r.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(r.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(r.docsSlug);
                    return K.useEffect(function() {
                        n && (document.getElementById(n) || console.error(o))
                    }, [o, n]), null
                },
                sz = function(t) {
                    var n = t.contentRef,
                        r = t.descriptionId,
                        o = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(sU("DialogDescriptionWarning").contentName, "}.");
                    return K.useEffect(function() {
                        var t, a = null == (t = n.current) ? void 0 : t.getAttribute("aria-describedby");
                        r && a && (document.getElementById(r) || console.warn(o))
                    }, [o, n, r]), null
                };

            function sV(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function sB(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function sH(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        sB(t, n, r[n])
                    })
                }
                return t
            }

            function sK(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function sq(t, n) {
                if (null == t) return {};
                var r, o, a = function(t, n) {
                    if (null == t) return {};
                    var r, o, a = {},
                        i = Object.keys(t);
                    for (o = 0; o < i.length; o++) r = i[o], n.indexOf(r) >= 0 || (a[r] = t[r]);
                    return a
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(t);
                    for (o = 0; o < i.length; o++) r = i[o], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (a[r] = t[r])
                }
                return a
            }

            function sX(t) {
                return function(t) {
                    if (Array.isArray(t)) return sV(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return sV(t, void 0);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return sV(t, n)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function s$(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }
            var sY = Symbol("radix.slottable");

            function sG(t) {
                return K.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === sY
            }
            var sZ = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(t, n) {
                    var r, o, a, i, l, u = (o = r = "Primitive.".concat(n), (a = K.forwardRef(function(t, n) {
                            var r = t.children,
                                o = sq(t, ["children"]);
                            if (K.isValidElement(r)) {
                                var a, i, l, u = (l = null == (a = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (i = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                    c = function(t, n) {
                                        var r = sH({}, n);
                                        for (var o in n) ! function(o) {
                                            var a = t[o],
                                                i = n[o];
                                            /^on[A-Z]/.test(o) ? a && i ? r[o] = function() {
                                                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                                var o = i.apply(void 0, sX(n));
                                                return a.apply(void 0, sX(n)), o
                                            } : a && (r[o] = a) : "style" === o ? r[o] = sH({}, a, i) : "className" === o && (r[o] = [a, i].filter(Boolean).join(" "))
                                        }(o);
                                        return sH({}, t, r)
                                    }(o, r.props);
                                return r.type !== K.Fragment && (c.ref = n ? function() {
                                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                    return function(t) {
                                        var r = !1,
                                            o = n.map(function(n) {
                                                var o = s$(n, t);
                                                return r || "function" != typeof o || (r = !0), o
                                            });
                                        if (r) return function() {
                                            for (var t = 0; t < o.length; t++) {
                                                var r = o[t];
                                                "function" == typeof r ? r() : s$(n[t], null)
                                            }
                                        }
                                    }
                                }(n, u) : u), K.cloneElement(r, c)
                            }
                            return K.Children.count(r) > 1 ? K.Children.only(null) : null
                        })).displayName = "".concat(o, ".SlotClone"), i = a, (l = K.forwardRef(function(t, n) {
                            var r = t.children,
                                o = sq(t, ["children"]),
                                a = K.Children.toArray(r),
                                l = a.find(sG);
                            if (l) {
                                var u = l.props.children,
                                    c = a.map(function(t) {
                                        return t === l ? K.Children.count(u) > 1 ? K.Children.only(null) : K.isValidElement(u) ? u.props.children : null : t
                                    });
                                return (0, z.jsx)(i, sK(sH({}, o), {
                                    ref: n,
                                    children: K.isValidElement(u) ? K.cloneElement(u, void 0, c) : null
                                }))
                            }
                            return (0, z.jsx)(i, sK(sH({}, o), {
                                ref: n,
                                children: r
                            }))
                        })).displayName = "".concat(r, ".Slot"), l),
                        c = K.forwardRef(function(t, r) {
                            var o = t.asChild,
                                a = sq(t, ["asChild"]),
                                i = o ? u : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, z.jsx)(i, sK(sH({}, a), {
                                ref: r
                            }))
                        });
                    return c.displayName = "Primitive.".concat(n), sK(sH({}, t), sB({}, n, c))
                }, {}),
                sQ = Object.freeze({
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
                sJ = K.forwardRef(function(t, n) {
                    return (0, z.jsx)(sZ.span, sK(sH({}, t), {
                        ref: n,
                        style: sH({}, sQ, t.style)
                    }))
                });
            sJ.displayName = "VisuallyHidden";
            var s0 = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-medium"
                },
                s1 = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                s2 = function(t) {
                    var n = t.variant,
                        r = t.size,
                        o = t.isCircular,
                        a = t.className,
                        i = tK(t, ["variant", "size", "isCircular", "className"]);
                    return q().createElement("button", Object.assign({
                        type: "button",
                        className: tS("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", aE, s1[n], s0[r], o && "radius-circle", a)
                    }, i), q().createElement(aC, null), q().createElement(aI, {
                        name: "icon-regular-x",
                        size: r
                    }))
                };
            aA(".foundation-web-dialog-overlay{bottom:0;display:grid;left:0;overflow-y:auto;place-items:center;position:fixed;right:0;top:0}.foundation-web-dialog-close-container{right:var(--size-300);top:var(--size-300);z-index:1}.foundation-web-dialog-hero-media{border-top-left-radius:var(--radius-large);border-top-right-radius:var(--radius-large);margin-left:calc(var(--stroke-standard)*-1);margin-right:calc(var(--stroke-standard)*-1);margin-top:calc(var(--stroke-standard)*-1);overflow:clip}.foundation-web-dialog-content[data-size=Small]{max-width:calc(var(--size-100)*80);min-width:calc(var(--size-100)*75)}.foundation-web-dialog-content[data-size=Medium]{max-width:calc(var(--size-100)*120);min-width:calc(var(--size-100)*75)}.foundation-web-dialog-content[data-size=Large]{max-width:calc(var(--size-100)*160);min-width:calc(var(--size-100)*75)}@keyframes foundation-web-dialog-backdrop-fade-in{0%{opacity:0}to{opacity:1}}@keyframes foundation-web-dialog-backdrop-fade-out{0%{opacity:1}to{opacity:0}}@keyframes foundation-web-dialog-content-scale-in{0%{transform:scale(.975)}to{transform:scale(1)}}@keyframes foundation-web-dialog-content-scale-out{0%{transform:scale(1)}to{transform:scale(.975)}}@media (prefers-reduced-motion:no-preference){.foundation-web-dialog-overlay[data-state=open]{animation:foundation-web-dialog-backdrop-fade-in var(--time-100) var(--ease-linear)}.foundation-web-dialog-overlay[data-state=closed]{animation:foundation-web-dialog-backdrop-fade-out var(--time-100) var(--ease-linear)}.foundation-web-dialog-content[data-state=open]{animation:foundation-web-dialog-content-scale-in var(--time-300) var(--ease-standard-out)}.foundation-web-dialog-content[data-state=closed]{animation:foundation-web-dialog-content-scale-out var(--time-300) var(--ease-standard-out)}}");
            var s3 = (0, K.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    hasDescription: !1,
                    type: "Default"
                }),
                s4 = function() {
                    var t = (0, K.useContext)(s3);
                    if (!t) throw Error("Dialog components must be used within a Dialog");
                    return t
                },
                s5 = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                s6 = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                s8 = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                s7 = function(t) {
                    var n = t.open,
                        r = t.onOpenChange,
                        o = t.children,
                        a = t.size,
                        i = t.type,
                        l = void 0 === i ? "Default" : i,
                        u = t.isModal,
                        c = t.hasCloseAffordance,
                        s = t.closeLabel,
                        d = t.hasMarginTop,
                        f = void 0 === d || d,
                        p = t.hasMarginBottom,
                        v = void 0 === p || p,
                        m = t.hasDescription,
                        h = void 0 !== m && m,
                        y = t.experimentalDisablePointerEventsStylingOnBody,
                        b = void 0 !== y && y,
                        g = (0, K.useMemo)(function() {
                            return {
                                size: a,
                                isModal: u,
                                type: l,
                                hasCloseAffordance: c,
                                closeLabel: s,
                                hasMarginTop: f,
                                hasMarginBottom: v,
                                hasDescription: h
                            }
                        }, [a, u, l, c, s, f, v, h]);
                    return (0, K.useEffect)(function() {
                        b && setTimeout(function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }, 0)
                    }, [b, n]), q().createElement(s3.Provider, {
                        value: g
                    }, q().createElement(sm, {
                        open: n,
                        onOpenChange: r
                    }, o))
                };
            s7.displayName = "Dialog";
            var s9 = function(t) {
                var n = t.children,
                    r = t.className,
                    o = t.style,
                    a = t.overlayClassName,
                    i = t.overlayStyle,
                    l = t.onOpenAutoFocus,
                    u = tK(t, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
                    c = s4(),
                    s = c.size,
                    d = c.isModal,
                    f = c.hasCloseAffordance,
                    p = c.closeLabel,
                    v = c.hasDescription,
                    m = tS("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", d && "bg-common-backdrop", a),
                    h = tS("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", r);
                return q().createElement(sx, null, q().createElement(sO, {
                    className: m,
                    style: i
                }, q().createElement(sP, Object.assign({
                    className: h,
                    "data-size": s,
                    style: o,
                    onOpenAutoFocus: l
                }, !v && {
                    "aria-describedby": void 0
                }, u), f && q().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, q().createElement(sL, {
                    asChild: !0
                }, q().createElement(s2, {
                    variant: "OverMedia",
                    size: s,
                    isCircular: !0,
                    "aria-label": p
                }))), n)))
            };
            s9.displayName = "DialogContent";
            var de = function(t) {
                var n = t.children,
                    r = t.className,
                    o = tK(t, ["children", "className"]),
                    a = s4(),
                    i = a.size,
                    l = a.hasMarginTop,
                    u = a.hasMarginBottom,
                    c = tS(s5[i], l && s6[i], u && s8[i], r);
                return q().createElement("div", Object.assign({
                    className: c
                }, o), n)
            };
            de.displayName = "DialogBody";
            var dt = function(t) {
                var n = t.children,
                    r = t.className,
                    o = t.hidden,
                    a = tK(t, ["children", "className", "hidden"]),
                    i = q().createElement(sI, Object.assign({
                        className: r
                    }, a), n);
                return o ? q().createElement(sJ, null, i) : i
            };
            dt.displayName = "DialogTitle";
            var dn = function(t) {
                var n = t.children,
                    r = t.className,
                    o = tK(t, ["children", "className"]),
                    a = s4().size,
                    i = tS(s5[a], s8[a], r);
                return q().createElement("div", Object.assign({
                    className: i
                }, o), n)
            };
            dn.displayName = "DialogFooter", aA("@keyframes rotation{0%{transform:rotate(0deg)}to{transform:rotate(359deg)}}.foundation-web-loading-spinner{animation:rotation 1s linear infinite normal}");
            var dr = function(t) {
                    var n = t.width,
                        r = t.height;
                    return q().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: n,
                        height: r,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, q().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                },
                da = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                di = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                dl = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                du = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                dc = (0, K.forwardRef)(function(t, n) {
                    var r = t.children,
                        o = t.className,
                        a = t.style,
                        i = t.isDisabled,
                        l = void 0 !== i && i,
                        u = t.isLoading,
                        c = void 0 !== u && u,
                        s = t.icon,
                        d = t.size,
                        f = void 0 === d ? "Large" : d,
                        p = t.variant,
                        v = void 0 === p ? "Emphasis" : p,
                        m = t.asChild,
                        h = tK(t, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        y = tS("foundation-web-button", l ? aP : [aE, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", di[f], l ? du[v] : dl[v], o),
                        b = Object.assign({
                            textDecoration: "none"
                        }, a),
                        g = function(t) {
                            return q().createElement(q().Fragment, null, q().createElement(aC, null), c && q().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, q().createElement(dr, {
                                width: da[f],
                                height: da[f]
                            })), q().createElement("span", {
                                className: tS("flex items-center min-width-0", "Large" === f || "Medium" === f ? "gap-small" : "gap-xsmall", c && "invisible")
                            }, s && q().createElement(aI, {
                                name: s,
                                size: f
                            }), q().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, t)))
                        };
                    if (m) {
                        var w = tK(h, ["as"]),
                            x = q().Children.only(r);
                        return q().createElement(uH, Object.assign({
                            ref: n
                        }, w, {
                            className: y,
                            style: b,
                            "aria-disabled": l || void 0
                        }), q().cloneElement(x, {}, g(x.props.children)))
                    }
                    if ("a" === h.as) {
                        h.as;
                        var S = h.href,
                            O = tK(h, ["as", "href"]);
                        return q().createElement("a", Object.assign({
                            ref: n
                        }, O, {
                            "aria-disabled": l,
                            href: l ? void 0 : S,
                            className: y,
                            style: b
                        }), g(r))
                    }
                    var j = tK(h, ["as"]);
                    return q().createElement("button", Object.assign({
                        ref: n,
                        type: "button"
                    }, j, {
                        disabled: l,
                        className: y,
                        style: b
                    }), g(r))
                }),
                ds = function(t) {
                    var n = t.open,
                        r = t.title,
                        o = t.body,
                        a = t.footerNote,
                        i = t.actionText,
                        l = t.actionVariant,
                        u = t.neutralText,
                        c = t.showAction,
                        s = t.closeLabel,
                        d = t.onAction,
                        f = t.onCancel;
                    return (0, z.jsx)(s7, {
                        open: n,
                        onOpenChange: function(t) {
                            t || f()
                        },
                        size: "Medium",
                        isModal: !0,
                        hasCloseAffordance: !0,
                        closeLabel: s,
                        children: (0, z.jsxs)(s9, {
                            style: {
                                width: "100%"
                            },
                            children: [(0, z.jsxs)(de, {
                                children: [(0, z.jsx)(dt, {
                                    children: r
                                }), (0, z.jsx)("div", {
                                    className: "text-content-emphasis",
                                    children: o
                                })]
                            }), (0, z.jsxs)(dn, {
                                children: [(0, z.jsxs)("div", {
                                    className: "flex gap-x-small",
                                    children: [(void 0 === c || c) && (0, z.jsx)(dc, {
                                        variant: void 0 === l ? "Emphasis" : l,
                                        size: "Medium",
                                        className: "fill basis-0",
                                        onClick: function() {
                                            null == d || d()
                                        },
                                        children: i
                                    }), (0, z.jsx)(dc, {
                                        variant: "Standard",
                                        size: "Medium",
                                        className: "fill basis-0",
                                        onClick: f,
                                        children: u
                                    })]
                                }), a && (0, z.jsx)("div", {
                                    className: "padding-top-medium",
                                    children: a
                                })]
                            })]
                        })
                    })
                },
                dd = function(t) {
                    var n = t.item,
                        r = t.overlay,
                        o = (0, H.useTranslation)().translate,
                        a = n.itemTarget.itemType,
                        i = X.ItemCardUtils.checkIfBundle(a),
                        l = null != n.serialNumber,
                        u = ts(n, o),
                        c = function() {
                            return (0, z.jsxs)(q().Fragment, {
                                children: [(0, z.jsx)("span", {
                                    className: "icon-shop-limited"
                                }), l && (0, z.jsxs)("span", {
                                    className: "limited-number-container",
                                    children: [(0, z.jsx)("span", {
                                        className: "font-caption-header",
                                        children: "#"
                                    }), (0, z.jsx)("span", {
                                        className: "font-caption-header text-subheader limited-number",
                                        children: n.serialNumber
                                    })]
                                })]
                            })
                        },
                        s = u ? (0, z.jsx)(lr, {
                            position: "top-center",
                            delayDurationMs: 0,
                            contentClassName: "trade-serial-tooltip",
                            title: u,
                            children: (0, z.jsxs)("span", {
                                className: "limited-icon-container",
                                children: [c(), (0, z.jsx)(lo, {
                                    asChild: !0,
                                    children: (0, z.jsx)("span", {
                                        className: "limited-hover-target",
                                        "aria-hidden": "true",
                                        children: c()
                                    })
                                })]
                            })
                        }) : (0, z.jsx)("span", {
                            className: "limited-icon-container",
                            children: c()
                        });
                    return (0, z.jsx)(X.ItemCard, {
                        id: n.itemTarget.targetId,
                        name: n.itemName,
                        type: a,
                        creatorName: void 0,
                        creatorType: "",
                        creatorTargetId: 0,
                        price: n.recentAveragePrice,
                        lowestPrice: void 0,
                        priceStatus: void 0,
                        premiumPricing: void 0,
                        unitsAvailableForConsumption: void 0,
                        itemStatus: void 0,
                        itemRestrictions: void 0,
                        thumbnail2d: (0, z.jsxs)(q().Fragment, {
                            children: [(0, z.jsx)(cF.Thumbnail2d, {
                                type: i ? cF.ThumbnailTypes.bundleThumbnail : cF.ThumbnailTypes.assetThumbnail,
                                targetId: n.itemTarget.targetId,
                                size: cF.DefaultThumbnailSize
                            }), s, r]
                        })
                    })
                },
                df = function(t) {
                    var n = t.offer,
                        r = t.label,
                        o = (0, H.useTranslation)().translate,
                        a = !!(n.robux && n.robux > 0);
                    return (0, z.jsxs)("div", {
                        className: "trade-list-detail-offer",
                        children: [(0, z.jsx)("div", {
                            className: "rbx-divider"
                        }), (0, z.jsx)("h3", {
                            className: "trade-list-detail-offer-header font-header-1",
                            children: r
                        }), (0, z.jsx)("ul", {
                            className: "hlist item-cards item-cards-stackable",
                            children: n.items.map(function(t) {
                                return (0, z.jsx)("li", {
                                    className: "list-item item-card trade-item-card",
                                    children: (0, z.jsx)(dd, {
                                        item: t
                                    })
                                }, t.collectibleItemInstanceId)
                            })
                        }), (0, z.jsxs)("div", {
                            children: [a && (0, z.jsxs)("div", {
                                className: "robux-line",
                                children: [(0, z.jsx)("span", {
                                    className: "text-label",
                                    children: o("Label.RobuxOfferedAfterFee", {
                                        percent: "".concat(ta())
                                    })
                                }), (0, z.jsxs)("span", {
                                    className: "robux-line-amount",
                                    children: [(0, z.jsx)("span", {
                                        className: "icon-robux-gray-16x16"
                                    }), (0, z.jsx)("span", {
                                        className: "text-label robux-line-value",
                                        children: (0, e7.formatNumber)(ti(n.robux))
                                    })]
                                })]
                            }), (0, z.jsxs)("div", {
                                className: "robux-line",
                                children: [(0, z.jsx)("span", {
                                    className: "text-lead",
                                    children: o("Label.TotalValue")
                                }), (0, z.jsxs)("span", {
                                    className: "robux-line-amount",
                                    children: [(0, z.jsx)("span", {
                                        className: "icon-robux-16x16"
                                    }), (0, z.jsx)("span", {
                                        className: "text-robux-lg robux-line-value",
                                        children: (0, e7.formatNumber)(tl(n))
                                    })]
                                })]
                            })]
                        })]
                    })
                };

            function dp(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function dv(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        var o;
                        o = r[n], n in t ? Object.defineProperty(t, n, {
                            value: o,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : t[n] = o
                    })
                }
                return t
            }

            function dm(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function dh(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var i = [],
                            l = !0,
                            u = !1;
                        try {
                            for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            u = !0, o = t
                        } finally {
                            try {
                                l || null == a.return || a.return()
                            } finally {
                                if (u) throw o
                            }
                        }
                        return i
                    }
                }(t, n) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return dp(t, n);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return dp(t, n)
                    }
                }(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var dy = function(t) {
                var n = t.trade,
                    r = t.detailLoading,
                    o = t.isMobile,
                    a = t.onBack,
                    i = t.onProfileClick,
                    l = t.onTradeRemoved,
                    u = t.systemFeedbackService,
                    c = (0, H.useTranslation)().translate,
                    s = et().navigate,
                    d = cZ(u),
                    f = dh((0, K.useState)(null), 2),
                    p = f[0],
                    v = f[1],
                    m = dh((0, K.useState)(""), 2),
                    h = m[0],
                    y = m[1],
                    b = dh((0, K.useState)(!1), 2),
                    g = b[0],
                    w = b[1];
                if (!n) return null;
                var x = n.status === ei.tradeStatus.open,
                    S = n.tradeStatusType === ei.tradeStatusType.inbound,
                    O = n.tradeStatusType === ei.tradeStatusType.outbound,
                    j = n.offers ? n.offers.toSorted(function(t, n) {
                        return Number(cU(n)) - Number(cU(t))
                    }) : [],
                    E = function(t) {
                        var n = Math.ceil(t.ExpirationTimeInMinutes / 60),
                            r = c(ei.economicRestrictionsViolationLabels[t.FailureReason]);
                        y(n > 24 ? c("Text.EconomicRestrictionsDaysGeneral", {
                            violation: r,
                            day: Math.ceil(n / 24)
                        }) : c("Text.EconomicRestrictionsHoursGeneral", {
                            violation: r,
                            hour: n
                        })), v("economic")
                    },
                    C = function() {
                        eX("processAccept: accepting trade", n.id), w(!0);
                        var t, r = dm(dv({}, eF(n)), {
                            tradeId: n.id
                        });
                        (t = n.id, ed(function() {
                            var n, r;
                            return em(this, function(o) {
                                switch (o.label) {
                                    case 0:
                                        return n = {
                                            url: "".concat(ei.urls.tradesApi, "/v1/trades/").concat(t, "/accept"),
                                            withCredentials: !0
                                        }, [4, eu.post(n)];
                                    case 1:
                                        return [2, null != (r = o.sent().data) ? r : {}]
                                }
                            })
                        })()).then(function(t) {
                            if (eX("processAccept: acceptTrade resolved", t), void 0 !== t.FailureReason && void 0 !== t.ExpirationTimeInMinutes) {
                                E({
                                    FailureReason: t.FailureReason,
                                    ExpirationTimeInMinutes: t.ExpirationTimeInMinutes
                                }), w(!1);
                                return
                            }
                            w(!1), u.success(c("Message.AcceptedTrade")), l(n.id), eD(eC, "accept", r), eL("tradeCompleted", "accept", r)
                        }).catch(function(t) {
                            var r = ew(t);
                            e$("processAccept: acceptTrade failed", r, t), e_("accept", t, {
                                tradeId: n.id
                            }), r.includes(ei.tradeErrors.tradeFrictionEncountered) ? cq().then(function(t) {
                                t ? d.start() : v("verificationRedirect")
                            }).catch(function() {
                                v("verificationRedirect")
                            }) : (w(!1), u.warning(c$(r, c)))
                        })
                    },
                    P = function() {
                        eX("processDecline: declining trade", n.id), w(!0);
                        var t, r = dm(dv({}, eF(n)), {
                            tradeId: n.id
                        });
                        (t = n.id, ed(function() {
                            var n;
                            return em(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return n = {
                                            url: "".concat(ei.urls.tradesApi, "/v1/trades/").concat(t, "/decline"),
                                            withCredentials: !0
                                        }, [4, eu.post(n)];
                                    case 1:
                                        return r.sent(), [2]
                                }
                            })
                        })()).then(function() {
                            eX("processDecline: declineTrade resolved"), w(!1), u.success(c("Message.DeclineTradeSuccess")), l(n.id), eL(O ? "tradeCanceled" : "tradeDeclined", O ? "cancel" : "decline", r)
                        }).catch(function(t) {
                            w(!1), e$("processDecline: declineTrade failed", ew(t), t), e_(O ? "cancel" : "decline", t, {
                                tradeId: n.id
                            }), u.warning(c$(ew(t), c))
                        })
                    };
                return (0, z.jsxs)("div", {
                    children: [(0, z.jsxs)("h2", {
                        className: "trades-header-nowrap font-title",
                        children: [o && (0, z.jsx)("span", {
                            className: "icon-back",
                            role: "button",
                            tabIndex: 0,
                            "aria-label": c("Action.Back"),
                            onClick: a,
                            onKeyDown: function(t) {
                                ("Enter" === t.key || " " === t.key) && a()
                            }
                        }), n.user ? (0, z.jsx)("a", {
                            className: "paired-name",
                            href: "/users/".concat(n.user.id, "/profile"),
                            target: "_blank",
                            rel: "noreferrer",
                            "aria-label": n.user.nameForDisplay,
                            onClick: function() {
                                i(n, "detailHeader")
                            },
                            dangerouslySetInnerHTML: {
                                __html: c("Label.TradeWithPartner", {
                                    username: n.user.nameForDisplay
                                })
                            }
                        }) : (0, z.jsx)("span", {
                            className: "paired-name",
                            dangerouslySetInnerHTML: {
                                __html: c("Label.TradeWithPartner", {
                                    username: ""
                                })
                            }
                        })]
                    }), x && (0, z.jsxs)("div", {
                        className: "text-label",
                        children: [c("Label.TradeExpiresOn", {
                            date: ""
                        }), tf(n.expiration)]
                    }), (!n.offers || r) && (0, z.jsx)("span", {
                        className: "spinner spinner-default"
                    }), (0, z.jsx)("div", {
                        className: "col-xs-12",
                        children: j.map(function(t, r) {
                            var o, a;
                            return (0, z.jsx)(df, {
                                offer: t,
                                label: cz(n, t, c)
                            }, null != (a = null == (o = t.user) ? void 0 : o.id) ? a : r)
                        })
                    }), x && (0, z.jsxs)("div", {
                        className: "trade-buttons",
                        children: [S && (0, z.jsx)("button", {
                            type: "button",
                            className: "btn-cta-md",
                            disabled: g,
                            onClick: function() {
                                eX("accept button clicked, opening confirm dialog"), v("accept")
                            },
                            children: c("Action.AcceptTrade")
                        }), S && n.user && (0, z.jsx)("button", {
                            type: "button",
                            className: "btn-control-md",
                            disabled: g,
                            onClick: function() {
                                eX("onCounter: countering trade", n.id), eD(eC, "counter"), s({
                                    view: "counter",
                                    tradeId: n.id
                                })
                            },
                            children: c("Action.CounterTrade")
                        }), (S || O) && (0, z.jsx)("button", {
                            type: "button",
                            className: "btn-control-md",
                            disabled: g,
                            onClick: function() {
                                eX("decline button clicked, opening confirm dialog"), v("decline")
                            },
                            children: c("Action.DeclineTrade")
                        }), g && (0, z.jsx)("span", {
                            className: "spinner spinner-sm"
                        })]
                    }), (0, z.jsx)(ds, {
                        open: "accept" === p,
                        title: c("Heading.AcceptTrade"),
                        body: c("Message.AcceptTrade"),
                        actionText: c("Action.AcceptTrade"),
                        actionVariant: "Emphasis",
                        neutralText: c("Action.Cancel"),
                        closeLabel: c("Action.Close"),
                        onAction: function() {
                            v(null), C()
                        },
                        onCancel: function() {
                            v(null)
                        }
                    }), (0, z.jsx)(ds, {
                        open: "decline" === p,
                        title: c("Heading.DeclineTrade"),
                        body: c("Message.DeclineTrade"),
                        actionText: c("Action.DeclineTrade"),
                        actionVariant: "Emphasis",
                        neutralText: c("Action.Cancel"),
                        closeLabel: c("Action.Close"),
                        footerNote: S ? (0, z.jsx)("div", {
                            className: "text-footer",
                            dangerouslySetInnerHTML: {
                                __html: c("Message.LowballTrades", {
                                    startLink: '<a class="text-link" href="'.concat(ei.urls.privacySettings, '">'),
                                    endLink: "</a>"
                                })
                            }
                        }) : void 0,
                        onAction: function() {
                            v(null), P(), eD(eC, "decline")
                        },
                        onCancel: function() {
                            v(null)
                        }
                    }), (0, z.jsx)(ds, {
                        open: "economic" === p,
                        title: c("Heading.EconomicRestrictionsError"),
                        body: h,
                        showAction: !1,
                        neutralText: c("Action.Cancel"),
                        closeLabel: c("Action.Close"),
                        onCancel: function() {
                            v(null)
                        }
                    }), (0, z.jsx)(ds, {
                        open: "verificationRedirect" === p,
                        title: c("Heading.TwoStepVerificationRequired"),
                        body: c("Message.TwoStepVerificationRequired"),
                        actionText: c("Action.GoToSecurity"),
                        actionVariant: "Emphasis",
                        neutralText: c("Action.Cancel"),
                        closeLabel: c("Action.Close"),
                        onAction: function() {
                            v(null), cX()
                        },
                        onCancel: function() {
                            v(null), w(!1)
                        }
                    })]
                })
            };

            function db(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function dg(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        var o;
                        o = r[n], n in t ? Object.defineProperty(t, n, {
                            value: o,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : t[n] = o
                    })
                }
                return t
            }

            function dw(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function dx(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var i = [],
                            l = !0,
                            u = !1;
                        try {
                            for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            u = !0, o = t
                        } finally {
                            try {
                                l || null == a.return || a.return()
                            } finally {
                                if (u) throw o
                            }
                        }
                        return i
                    }
                }(t, n) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return db(t, n);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return db(t, n)
                    }
                }(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var dS = [{
                    value: ei.tradeStatusType.inbound,
                    labelKey: "Label.TradeStatusInbound",
                    noResultsKey: "Label.TradeStatusInboundInEmptyResult"
                }, {
                    value: ei.tradeStatusType.outbound,
                    labelKey: "Label.TradeStatusOutbound",
                    noResultsKey: "TradeStatusOutboundInEmptyResult"
                }, {
                    value: ei.tradeStatusType.completed,
                    labelKey: "Label.TradeStatusCompleted",
                    noResultsKey: "Label.TradeStatusCompletedInEmptyResult"
                }, {
                    value: ei.tradeStatusType.inactive,
                    labelKey: "Label.TradeStatusInactive",
                    noResultsKey: "Label.TradeStatusInactiveInEmptyResult"
                }],
                dO = [{
                    value: ei.tradeQualityType.none,
                    labelKey: "Label.None"
                }, {
                    value: ei.tradeQualityType.low,
                    labelKey: "Label.Low"
                }, {
                    value: ei.tradeQualityType.medium,
                    labelKey: "Label.Medium"
                }, {
                    value: ei.tradeQualityType.high,
                    labelKey: "Label.High"
                }],
                dj = function(t) {
                    var n, r = t.systemFeedbackService,
                        o = (0, H.useTranslation)().translate,
                        a = tx(),
                        i = (0, K.useMemo)(function() {
                            return td()
                        }, []),
                        l = dx((0, K.useState)(ei.tradeStatusType.inbound), 2),
                        u = l[0],
                        c = l[1],
                        s = dx((0, K.useState)(ei.tradeQualityType.none), 2),
                        d = s[0],
                        f = s[1],
                        p = dx((0, K.useState)(null), 2),
                        v = p[0],
                        m = p[1],
                        h = dx((0, K.useState)(!1), 2),
                        y = h[0],
                        b = h[1],
                        g = dx((0, K.useState)("list"), 2),
                        w = g[0],
                        x = g[1],
                        S = (0, K.useRef)(null),
                        O = (0, K.useRef)(null),
                        j = (0, K.useMemo)(function() {
                            return dS.map(function(t) {
                                return {
                                    value: t.value,
                                    label: o(t.labelKey)
                                }
                            })
                        }, [o]),
                        E = (0, K.useMemo)(function() {
                            return dO.map(function(t) {
                                return {
                                    value: t.value,
                                    label: o(t.labelKey)
                                }
                            })
                        }, [o]),
                        C = null != (n = dS.find(function(t) {
                            return t.value === u
                        })) ? n : dS[0],
                        P = (0, K.useCallback)(function(t) {
                            var n;
                            (S.current = t ? t.id : null, t) ? (m(dw(dg({}, t), {
                                offers: void 0
                            })), b(!0), eb(null == (n = (0, en.authenticatedUser)()) ? void 0 : n.id, t.id).then(function(n) {
                                if (n && S.current === t.id) {
                                    var r = dw(dg({}, n), {
                                        id: t.id,
                                        tradeStatusType: t.tradeStatusType,
                                        expiration: t.expiration,
                                        status: t.status
                                    });
                                    m(r), b(!1), eL(eR, "viewTrade", dw(dg({}, eF(r)), {
                                        tradeId: r.id,
                                        tradeStatusType: r.tradeStatusType
                                    }))
                                }
                            }).catch(function(t) {
                                e_("viewTrade", t), b(!1)
                            })) : m(null)
                        }, []),
                        A = (0, K.useCallback)(function(t) {
                            c(t), m(null), S.current = null, O.current && (O.current.scrollTop = 0);
                            var n = new URL(window.location.href);
                            n.searchParams.set("tab", t), window.history.replaceState({}, "", n.toString()), a.loadFirstPage(t).then(function(t) {
                                t.length > 0 && P(t[0])
                            }).catch(function(n) {
                                e_("loadTradesList", n, {
                                    tab: t
                                }), r.warning(o("Error.FailedToLoadTradesList"))
                            })
                        }, [a, P, r, o]);
                    (0, K.useEffect)(function() {
                        ed(function() {
                            var t;
                            return em(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        return t = {
                                            url: "".concat(ei.urls.tradesApi, "/v1/trades/expire-outdated"),
                                            withCredentials: !0
                                        }, [4, eu.post(t)];
                                    case 1:
                                        return n.sent(), [2]
                                }
                            })
                        })().catch(function() {}), ed(function() {
                            var t;
                            return em(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        return t = {
                                            url: ei.urls.getSettings,
                                            withCredentials: !0
                                        }, [4, eu.get(t)];
                                    case 1:
                                        return [2, n.sent().data]
                                }
                            })
                        })().then(function(t) {
                            (null == t ? void 0 : t.tradeQualityFilter) && f(t.tradeQualityFilter)
                        }).catch(function() {});
                        var t, n, r = new URLSearchParams(window.location.search).get("tab");
                        A(null != (n = null == (t = dS.find(function(t) {
                            return t.value === r
                        })) ? void 0 : t.value) ? n : dS[0].value)
                    }, []);
                    var T = (0, K.useCallback)(function() {
                            a.loadNextPage().catch(function(t) {
                                e_("loadTradesList", t, {
                                    paged: !0
                                }), r.warning(o("Error.FailedToLoadTradesList"))
                            })
                        }, [a, r, o]),
                        R = (0, K.useCallback)(function() {
                            var t = O.current;
                            t && !a.loading && a.hasMore && t.scrollTop + t.offsetHeight >= t.scrollHeight - ei.tradesList.scrollBarLazyLoadDistancePx && T()
                        }, [T, a.loading, a.hasMore]);
                    (0, K.useEffect)(function() {
                        var t = O.current;
                        t && !a.loading && a.hasMore && !a.loadFailed && t.scrollHeight <= t.clientHeight + ei.tradesList.scrollBarLazyLoadDistancePx && T()
                    }, [a.trades, a.loading, a.hasMore, a.loadFailed, T]);
                    var N = function(t) {
                            P(t), x("detail"), eD(eC, "viewTrade")
                        },
                        I = function(t, n) {
                            var r;
                            eL("tradeProfileClick", n, {
                                tradeStatusType: t.tradeStatusType || u,
                                partnerId: null == (r = t.user) ? void 0 : r.id,
                                tradeId: t.id
                            })
                        };
                    return (0, z.jsxs)("div", {
                        className: "trades-react".concat(i ? " is-mobile" : ""),
                        children: [(!i || "list" === w) && (0, z.jsxs)("div", {
                            className: "col-xs-12 col-sm-4 trade-row-list",
                            children: [(0, z.jsxs)("div", {
                                className: "trades-header",
                                children: [(0, z.jsx)("div", {
                                    className: "trade-list-dropdown",
                                    children: (0, z.jsx)(c_, {
                                        options: j,
                                        value: u,
                                        onSelect: function(t) {
                                            eD(eC, "switchTradeCategory", {
                                                category: t
                                            }), eL(eI, "switchTradeCategory", {
                                                filterType: "statusTab",
                                                value: t
                                            }), A(t)
                                        }
                                    })
                                }), (0, z.jsx)("h1", {
                                    children: o("Heading.TradesList")
                                }), (0, z.jsx)("a", {
                                    href: o("Link.HowToTrade"),
                                    className: "text-link text-secondary",
                                    onClick: function() {
                                        eD(eC, "tradeInfo"), eL("tradeHowToTradeClick", "howToTrade")
                                    },
                                    children: o("Label.HowToTrade")
                                })]
                            }), u === ei.tradeStatusType.inbound && (0, z.jsxs)("div", {
                                className: "trade-quality",
                                children: [(0, z.jsx)("div", {
                                    className: "trade-quality-label",
                                    children: o("Label.TradeQualityFilter")
                                }), (0, z.jsx)("div", {
                                    className: "trade-list-dropdown",
                                    children: (0, z.jsx)(c_, {
                                        options: E,
                                        value: d,
                                        onSelect: function(t) {
                                            f(t), ed(function() {
                                                var n;
                                                return em(this, function(r) {
                                                    switch (r.label) {
                                                        case 0:
                                                            return n = {
                                                                url: ei.urls.setTradeQuality,
                                                                withCredentials: !0
                                                            }, [4, eu.post(n, {
                                                                tradeQualityFilter: t
                                                            })];
                                                        case 1:
                                                            return r.sent(), [2]
                                                    }
                                                })
                                            })().catch(function() {}), eL(eI, "tradeQuality", {
                                                filterType: "tradeQuality",
                                                value: t
                                            })
                                        }
                                    })
                                })]
                            }), (0, z.jsxs)("div", {
                                id: "trade-row-scroll-container",
                                ref: O,
                                onScroll: R,
                                children: [a.trades.map(function(t) {
                                    return (0, z.jsx)(cV, {
                                        trade: t,
                                        isSelected: (null == v ? void 0 : v.id) === t.id,
                                        onClick: N,
                                        onProfileClick: I
                                    }, t.id)
                                }), a.loading && (0, z.jsx)("span", {
                                    className: "spinner spinner-default"
                                }), a.noResults && !a.loading && (0, z.jsx)("div", {
                                    className: "col-xs-12 container-empty",
                                    children: o("Label.NoTrades", {
                                        status: o(C.noResultsKey)
                                    })
                                })]
                            })]
                        }), (!i || "detail" === w) && (0, z.jsx)("div", {
                            className: "col-xs-12 col-sm-8 trades-list-detail",
                            children: (0, z.jsx)(dy, {
                                trade: v,
                                detailLoading: y,
                                isMobile: i,
                                onBack: function() {
                                    x("list")
                                },
                                onProfileClick: I,
                                onTradeRemoved: function(t) {
                                    var n = (null == v ? void 0 : v.id) === t,
                                        r = a.trades.filter(function(n) {
                                            return n.id !== t
                                        });
                                    a.removeTrade(t), n && (r.length > 0 ? P(r[0]) : (P(null), x("list"))), R()
                                },
                                systemFeedbackService: r
                            })
                        })]
                    })
                };

            function dE(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function dC(t, n, r, o, a, i, l) {
                try {
                    var u = t[i](l),
                        c = u.value
                } catch (t) {
                    r(t);
                    return
                }
                u.done ? n(c) : Promise.resolve(c).then(o, a)
            }

            function dP(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        var o;
                        o = r[n], n in t ? Object.defineProperty(t, n, {
                            value: o,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : t[n] = o
                    })
                }
                return t
            }

            function dA(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function dT(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var i = [],
                            l = !0,
                            u = !1;
                        try {
                            for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            u = !0, o = t
                        } finally {
                            try {
                                l || null == a.return || a.return()
                            } finally {
                                if (u) throw o
                            }
                        }
                        return i
                    }
                }(t, n) || dN(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function dR(t) {
                return function(t) {
                    if (Array.isArray(t)) return dE(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || dN(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function dN(t, n) {
                if (t) {
                    if ("string" == typeof t) return dE(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return dE(t, n)
                }
            }
            var dI = ei.maxItemsPerSide,
                dk = ei.tradeErrors,
                dD = function(t) {
                    for (var n = [], r = 0; r < dI; r += 1) t[r] ? n.push({
                        type: "item",
                        tradableItem: t[r]
                    }) : 0 === r || t[r - 1] ? n.push({
                        type: "add-item"
                    }) : n.push({
                        type: "empty"
                    });
                    return n
                },
                dL = function(t) {
                    return dA(dP({}, t), {
                        slots: dD(t.items)
                    })
                },
                dM = function(t) {
                    var n = (0, H.useTranslation)().translate,
                        r = et(),
                        o = r.route,
                        a = r.navigate,
                        i = (0, K.useRef)(function() {}),
                        l = cZ(t, {
                            onVerificationSuccess: function() {
                                i.current()
                            },
                            onChallengeAbandoned: function() {}
                        }),
                        u = dT((0, K.useState)([]), 2),
                        c = u[0],
                        s = u[1],
                        d = dT((0, K.useState)(!1), 2),
                        f = d[0],
                        p = d[1],
                        v = dT((0, K.useState)(null), 2),
                        m = v[0],
                        h = v[1],
                        y = dT((0, K.useState)(null), 2),
                        b = y[0],
                        g = y[1],
                        w = dT((0, K.useState)(null), 2),
                        x = w[0],
                        S = w[1],
                        O = dT((0, K.useState)(!1), 2),
                        j = O[0],
                        E = O[1],
                        C = dT((0, K.useState)(!1), 2),
                        P = C[0],
                        A = C[1],
                        T = dT((0, K.useState)(null), 2),
                        R = T[0],
                        N = T[1],
                        I = dT((0, K.useState)(!1), 2),
                        k = I[0],
                        D = I[1],
                        L = (0, K.useRef)([]),
                        M = (0, K.useRef)(null),
                        _ = (0, K.useRef)(null),
                        F = (0, K.useRef)({}),
                        U = (0, K.useCallback)(function(t) {
                            L.current = t, s(t)
                        }, []),
                        W = (0, K.useCallback)(function() {
                            S(null)
                        }, []),
                        z = (0, K.useCallback)(function(t) {
                            t.id && F.current[t.id] && (F.current[t.id] = null)
                        }, []),
                        V = function(t) {
                            return L.current.find(function(n) {
                                return n.user.id === t
                            })
                        },
                        B = (0, K.useCallback)(function(t) {
                            var n = V(t.userId);
                            return !!(null == n ? void 0 : n.items.some(function(n) {
                                return n.id === t.id
                            }))
                        }, []),
                        q = (0, K.useCallback)(function(t) {
                            var n = V(t);
                            return !!(n && n.items.length >= dI)
                        }, []),
                        X = (0, K.useCallback)(function(t) {
                            return B(t) || q(t.userId) || !!t.isOnHold
                        }, [B, q]),
                        $ = (0, K.useCallback)(function(t) {
                            return !!(t.id && F.current[t.id])
                        }, []),
                        Y = (0, K.useCallback)(function(t) {
                            return cY(t.id ? F.current[t.id] : null, n)
                        }, [n]),
                        G = (0, K.useCallback)(function(t) {
                            var n = V(t.userId);
                            !n || n.items.length >= dI || n.items.some(function(n) {
                                return n.id === t.id
                            }) || t.isOnHold || (U(L.current.map(function(n) {
                                return n.user.id === t.userId ? dL(dA(dP({}, n), {
                                    items: dR(n.items).concat([t])
                                })) : dL(dA(dP({}, n), {
                                    items: n.items.filter(function(n) {
                                        return n.id !== t.id
                                    })
                                }))
                            })), z(t), W())
                        }, [z, W, U]),
                        Z = (0, K.useCallback)(function(t) {
                            U(L.current.map(function(n) {
                                return dL(dA(dP({}, n), {
                                    items: n.items.filter(function(n) {
                                        return n.id !== t.id
                                    })
                                }))
                            })), z(t), W()
                        }, [z, W, U]),
                        Q = (0, K.useCallback)(function(t) {
                            B(t) ? (Z(t), eD(eP, "itemRemoved")) : (G(t), eD(eP, "itemAdded"))
                        }, [G, B, Z]),
                        J = (0, K.useCallback)(function(t, n) {
                            var r = n.replace(/[^0-9]/g, ""),
                                o = "" === r ? null : parseInt(r, 10);
                            0 === o && (o = null), U(L.current.map(function(n) {
                                return n.user.id === t ? dA(dP({}, n), {
                                    robux: o
                                }) : n
                            }))
                        }, [U]),
                        ee = (0, K.useCallback)(function(t) {
                            t.robux && t.robux > 0 && eD(eP, "robuxAdded")
                        }, []),
                        er = function() {
                            var t = L.current.map(function(t) {
                                return {
                                    userId: t.user.id,
                                    robux: t.robux ? parseInt(String(t.robux), 10) : 0,
                                    collectibleItemInstanceIds: t.items.map(function(t) {
                                        return t.id
                                    })
                                }
                            });
                            return {
                                senderOffer: t.find(function(t) {
                                    var n;
                                    return t.userId === (null == (n = (0, en.authenticatedUser)()) ? void 0 : n.id)
                                }),
                                recipientOffer: t.find(function(t) {
                                    var n;
                                    return t.userId !== (null == (n = (0, en.authenticatedUser)()) ? void 0 : n.id)
                                })
                            }
                        },
                        eo = function(t) {
                            var r, o, a = Math.ceil((null != (r = t.ExpirationTimeInMinutes) ? r : 0) / 60),
                                i = n(ei.economicRestrictionsViolationLabels[null != (o = t.FailureReason) ? o : ""]);
                            N(a > 24 ? n("Text.EconomicRestrictionsDaysGeneral", {
                                violation: i,
                                day: Math.ceil(a / 24)
                            }) : n("Text.EconomicRestrictionsHoursGeneral", {
                                violation: i,
                                hour: a
                            }))
                        },
                        ea = function(t) {
                            var n, r;
                            switch (null != (r = null == (n = ex(t)) ? void 0 : n.code) ? r : ew(t)[0]) {
                                case dk.unauthorized:
                                    return "unauthorized";
                                case dk.userCannotTrade:
                                    return "userCannotTrade";
                                case dk.userPrivacyTooStrict:
                                    return "userPrivacyTooStrict";
                                case dk.invalidUserAssets:
                                    return "invalidUserAssets";
                                case dk.tradeUnbalanced:
                                    return "tradeUnbalanced";
                                case dk.tradeQualityInsufficient:
                                    return "tradeQualityInsufficient";
                                case dk.insufficientRobux:
                                    return "insufficientRobux";
                                case dk.tooManyRobux:
                                    return "tooManyRobux";
                                case dk.tradeFrictionEncountered:
                                    return "tradeFrictionEncountered";
                                default:
                                    return "unknown"
                            }
                        },
                        el = function(r) {
                            var o, a = ex(r),
                                i = null != (o = null == a ? void 0 : a.code) ? o : ew(r)[0];
                            switch (i) {
                                case dk.unauthorized:
                                    t.warning(n("Error.TradeUnauthorized"));
                                    break;
                                case dk.userCannotTrade:
                                    t.warning(n("Error.TradeUsersCannotTrade"));
                                    break;
                                case dk.userPrivacyTooStrict:
                                    t.warning((null == a ? void 0 : a.field) === "sender" ? n("Error.YourPrivacyTooStrict") : n("Error.PartnerPrivacyTooStrict"));
                                    break;
                                case dk.invalidUserAssets:
                                    break;
                                case dk.tradeUnbalanced:
                                    S(n("Error.TradeUnbalanced", {
                                        ratio: ei.minValueRatio
                                    }));
                                    break;
                                case dk.tradeQualityInsufficient:
                                    S(n("Error.TradeQualityInsufficient", {
                                        minValue: (0, e7.formatNumber)(Number(null == a ? void 0 : a.fieldData) || 0)
                                    }));
                                    break;
                                case dk.insufficientRobux:
                                    S(n("Error.YouDoNotHaveEnoughRobux"));
                                    break;
                                case dk.tooManyRobux:
                                    S(n((null == a ? void 0 : a.field) === "sender" ? "Error.RequestHasTooManyRobux" : "Error.OfferHasTooManyRobux", {
                                        percent: ei.maxRobuxAsPercentOfValue
                                    }));
                                    break;
                                case dk.tradeFrictionEncountered:
                                    cq().then(function(t) {
                                        t ? l.start() : D(!0)
                                    }).catch(function() {
                                        D(!0)
                                    });
                                    break;
                                default:
                                    t.warning(c$(null != i ? [i] : [], n))
                            }
                        },
                        ec = (0, K.useCallback)(function() {
                            a({
                                view: "list",
                                tab: ei.tradeStatusType.outbound
                            })
                        }, [a]),
                        es = (0, K.useCallback)(function() {
                            var r, o, a = L.current,
                                i = null !== _.current,
                                l = er();
                            E(!0);
                            var u = a.find(function(t) {
                                    var n;
                                    return t.user.id === (null == (n = (0, en.authenticatedUser)()) ? void 0 : n.id)
                                }),
                                c = dA(dP({}, eF({
                                    offers: [a.find(function(t) {
                                        var n;
                                        return t.user.id !== (null == (n = (0, en.authenticatedUser)()) ? void 0 : n.id)
                                    }), u]
                                })), {
                                    hasRobux: L.current.some(function(t) {
                                        return !!(t.robux && t.robux > 0)
                                    }),
                                    partnerId: null == (o = M.current) ? void 0 : o.id
                                }),
                                s = i ? "counter" : "newTrade";
                            (i ? (r = _.current, ed(function() {
                                var t, n;
                                return em(this, function(o) {
                                    switch (o.label) {
                                        case 0:
                                            return t = {
                                                url: "".concat(ei.urls.tradesApi, "/v2/trades/").concat(r, "/counter"),
                                                withCredentials: !0
                                            }, [4, eu.post(t, l)];
                                        case 1:
                                            return [2, null != (n = o.sent().data) ? n : {}]
                                    }
                                })
                            })()) : ed(function() {
                                var t, n;
                                return em(this, function(r) {
                                    switch (r.label) {
                                        case 0:
                                            return t = {
                                                url: "".concat(ei.urls.tradesApi, "/v2/trades/send"),
                                                withCredentials: !0
                                            }, [4, eu.post(t, l)];
                                        case 1:
                                            return [2, null != (n = r.sent().data) ? n : {}]
                                    }
                                })
                            })()).then(function(r) {
                                if (E(!1), void 0 !== r.FailureReason && void 0 !== r.ExpirationTimeInMinutes) return void eo(r);
                                var o = dA(dP({}, c), {
                                    success: !0
                                });
                                (null == r ? void 0 : r.tradeId) && (o.tradeId = r.tradeId), eD(eA, s, o);
                                var a = eU();
                                eL(i ? "tradeCountered" : "tradeInitiated", s, dA(dP({}, o), {
                                    entrySource: a.entrySource,
                                    referrer: a.referrer
                                })), t.success(n(i ? "Message.TradeCounteredSuccess" : "Message.TradeSentSuccess")), ec()
                            }, function(t) {
                                eD(eA, s, dA(dP({}, c), {
                                    success: !1,
                                    reason: ea(t)
                                })), e_(i ? "counterTrade" : "sendTrade", t, {
                                    reason: ea(t)
                                }), E(!1), el(t)
                            })
                        }, [ec, t, n]);
                    i.current = es;
                    var ef = (0, K.useCallback)(function() {
                            ((W(), L.current.length > 0 && L.current.every(function(t) {
                                return t.items.length > 0
                            })) ? !L.current.every(function(t) {
                                return tu(t.robux)
                            }) && (S(n("Error.InvalidRobux")), 1) : (S(n("Label.OffersNeedItems")), 1)) || (W(), F.current = {}, A(!0))
                        }, [W, n]),
                        ep = (0, K.useCallback)(function() {
                            A(!1)
                        }, []),
                        ey = (0, K.useCallback)(function() {
                            A(!1), es()
                        }, [es]),
                        eS = (0, K.useCallback)(function() {
                            N(null)
                        }, []),
                        eO = (0, K.useCallback)(function() {
                            D(!1)
                        }, []),
                        ej = (0, K.useCallback)(function(t, r, o) {
                            var a, i = t.id === (null == (a = (0, en.authenticatedUser)()) ? void 0 : a.id);
                            return dL({
                                isMyOffer: i,
                                label: n(i ? "Label.YourOffer" : "Label.YourRequest"),
                                robux: null != r ? r : null,
                                items: o || [],
                                slots: [],
                                user: t
                            })
                        }, [n]),
                        eE = (0, K.useCallback)(function(t, n) {
                            var r;
                            return (r = function() {
                                var r, o;
                                return function(t, n) {
                                    var r, o, a, i = {
                                            label: 0,
                                            sent: function() {
                                                if (1 & a[0]) throw a[1];
                                                return a[1]
                                            },
                                            trys: [],
                                            ops: []
                                        },
                                        l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                    return l.next = u(0), l.throw = u(1), l.return = u(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                                        return this
                                    }), l;

                                    function u(u) {
                                        return function(c) {
                                            var s = [u, c];
                                            if (r) throw TypeError("Generator is already executing.");
                                            for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                                                if (r = 1, o && (a = 2 & s[0] ? o.return : s[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, s[1])).done) return a;
                                                switch (o = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                                    case 0:
                                                    case 1:
                                                        a = s;
                                                        break;
                                                    case 4:
                                                        return i.label++, {
                                                            value: s[1],
                                                            done: !1
                                                        };
                                                    case 5:
                                                        i.label++, o = s[1], s = [0];
                                                        continue;
                                                    case 7:
                                                        s = i.ops.pop(), i.trys.pop();
                                                        continue;
                                                    default:
                                                        if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                            i = 0;
                                                            continue
                                                        }
                                                        if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                                            i.label = s[1];
                                                            break
                                                        }
                                                        if (6 === s[0] && i.label < a[1]) {
                                                            i.label = a[1], a = s;
                                                            break
                                                        }
                                                        if (a && i.label < a[2]) {
                                                            i.label = a[2], i.ops.push(s);
                                                            break
                                                        }
                                                        a[2] && i.ops.pop(), i.trys.pop();
                                                        continue
                                                }
                                                s = n.call(t, i)
                                            } catch (t) {
                                                s = [6, t], o = 0
                                            } finally {
                                                r = a = 0
                                            }
                                            if (5 & s[0]) throw s[1];
                                            return {
                                                value: s[0] ? s[1] : void 0,
                                                done: !0
                                            }
                                        }
                                    }
                                }(this, function(a) {
                                    switch (a.label) {
                                        case 0:
                                            if (!t.length || !n) return [2];
                                            return r = new Set(t), [4, ed(function() {
                                                var t, r, o, a;
                                                return em(this, function(i) {
                                                    switch (i.label) {
                                                        case 0:
                                                            if (!n || n <= 0) return [2, []];
                                                            t = [], i.label = 1;
                                                        case 1:
                                                            i.trys.push([1, 6, , 7]), i.label = 2;
                                                        case 2:
                                                            return [4, eg(n, void 0, r)];
                                                        case 3:
                                                            a = i.sent(), (o = t).push.apply(o, ev(a.items)), r = a.nextPageCursor || void 0, i.label = 4;
                                                        case 4:
                                                            if (r) return [3, 2];
                                                            i.label = 5;
                                                        case 5:
                                                            return [3, 7];
                                                        case 6:
                                                            return i.sent(), [2, t];
                                                        case 7:
                                                            return [2, t]
                                                    }
                                                })
                                            })()];
                                        case 1:
                                            if (!(o = a.sent().filter(function(t) {
                                                    return r.has(t.collectibleItemInstanceId)
                                                }).slice(0, dI).map(function(t) {
                                                    return dA(dP({}, t), {
                                                        userId: n,
                                                        id: t.collectibleItemInstanceId
                                                    })
                                                })).length) return [2];
                                            return U(L.current.map(function(t) {
                                                return t.user.id === n ? dL(dA(dP({}, t), {
                                                    items: dR(t.items).concat(dR(o))
                                                })) : t
                                            })), o.forEach(z), [2]
                                    }
                                })
                            }, function() {
                                var t = this,
                                    n = arguments;
                                return new Promise(function(o, a) {
                                    var i = r.apply(t, n);

                                    function l(t) {
                                        dC(i, o, a, l, u, "next", t)
                                    }

                                    function u(t) {
                                        dC(i, o, a, l, u, "throw", t)
                                    }
                                    l(void 0)
                                })
                            })()
                        }, [z, U]),
                        eC = (0, K.useCallback)(function() {
                            if ("undefined" != typeof URLSearchParams) {
                                var t = new URLSearchParams(window.location.search),
                                    n = function(n) {
                                        return (t.get(n) || "").split(",").map(function(t) {
                                            return t.trim()
                                        }).filter(Boolean)
                                    },
                                    r = n("oitems"),
                                    o = n("ritems");
                                if (r.length) {
                                    var a = L.current.find(function(t) {
                                        return t.isMyOffer
                                    });
                                    eE(r, null == a ? void 0 : a.user.id).catch(function(t) {
                                        e_("addItemsFromUrl", t)
                                    })
                                }
                                if (o.length) {
                                    var i = L.current.find(function(t) {
                                        return !t.isMyOffer
                                    });
                                    eE(o, null == i ? void 0 : i.user.id).catch(function(t) {
                                        e_("addItemsFromUrl", t)
                                    })
                                }
                            }
                        }, [eE]),
                        eT = (0, K.useCallback)(function(r) {
                            ed(function() {
                                var t, n, o, a;
                                return em(this, function(i) {
                                    switch (i.label) {
                                        case 0:
                                            if (!r || r <= 0) throw Error("Invalid user id");
                                            return n = {
                                                url: "".concat(ei.urls.usersApi, "/v1/users"),
                                                withCredentials: !0
                                            }, [4, eu.post(n, {
                                                userIds: [r]
                                            })];
                                        case 1:
                                            if (!(a = null == (o = i.sent().data) || null == (t = o.data) ? void 0 : t[0])) throw Error("User not found");
                                            return [2, {
                                                id: a.id,
                                                name: a.name,
                                                displayName: a.displayName,
                                                nameForDisplay: eh(a.displayName, a.name)
                                            }]
                                    }
                                })
                            })().then(function(t) {
                                eX("openNewTrade: loaded partner", t);
                                var n, r = null != (n = (0, en.authenticatedUser)()) ? n : {},
                                    o = r.id,
                                    a = r.name,
                                    i = r.displayName,
                                    l = {
                                        id: o,
                                        name: a,
                                        displayName: i,
                                        nameForDisplay: eh(i, a)
                                    },
                                    u = [ej(t, null, []), ej(l, null, [])];
                                g(t), M.current = t, U(u), p(!0), eC()
                            }).catch(function(r) {
                                e$("openNewTrade: getUserById failed", r), e_("loadTradePartner", r), h(n("Message.InvalidUser")), t.warning(n("Message.InvalidUser"))
                            })
                        }, [eC, U, ej, t, n]),
                        eR = (0, K.useCallback)(function(t) {
                            eX("openNewTrade: userId=", t, "me=", null == (n = (0, en.authenticatedUser)()) ? void 0 : n.id), U([]), _.current = null, p(!1), h(null);
                            var n, r = ei.canTradeWithStatus,
                                o = ei.urls;
                            ed(function() {
                                var n, r;
                                return em(this, function(o) {
                                    switch (o.label) {
                                        case 0:
                                            return n = {
                                                url: "".concat(ei.urls.tradesApi, "/v1/users/").concat(t, "/can-trade-with"),
                                                withCredentials: !0
                                            }, [4, eu.get(n)];
                                        case 1:
                                            return [2, null != (r = o.sent().data) ? r : null]
                                    }
                                })
                            })().then(function(n) {
                                var a = null == n ? void 0 : n.status;
                                if (eX("openNewTrade: canTradeWith status=", a), a === r.canTrade) return void eT(t);
                                if (a === r.senderCannotTrade) {
                                    window.location.href = o.membership;
                                    return
                                }
                                window.location.href = a && a !== r.cannotTradeWithSelf && a !== r.unknownError ? o.forbidden : o.badRequest
                            }).catch(function(t) {
                                e$("openNewTrade: canTradeWith failed", t), e_("canTradeWith", t), window.location.href = o.badRequest
                            })
                        }, [U, eT]),
                        eN = (0, K.useCallback)(function(r) {
                            var o;
                            eX("openCounterTrade: tradeId=", r), U([]), _.current = r, p(!1), h(null), eb(null == (o = (0, en.authenticatedUser)()) ? void 0 : o.id, r).then(function(t) {
                                if (eX("openCounterTrade: loaded trade", t), !t || !t.offers) {
                                    e$("openCounterTrade: trade has no offers", t), h(n("Error.TradeUnknownError"));
                                    return
                                }
                                if (t.offers.some(function(t) {
                                        return !t.user
                                    })) {
                                    e$("openCounterTrade: trade has a moderated/null participant", t), h(n("Error.TradeUnknownError"));
                                    return
                                }
                                var r, o, a = t.offers.map(function(n) {
                                        var r, o, a = n.items.map(function(t) {
                                            return dA(dP({}, t), {
                                                id: t.collectibleItemInstanceId,
                                                userId: n.user.id
                                            })
                                        });
                                        return ej(dA(dP({}, n.user), {
                                            nameForDisplay: null != (o = null == (r = t.user) ? void 0 : r.nameForDisplay) ? o : n.user.nameForDisplay
                                        }), n.robux, a)
                                    }),
                                    i = null != (o = null == (r = a.find(function(t) {
                                        return !t.isMyOffer
                                    })) ? void 0 : r.user) ? o : null;
                                g(i), M.current = i, U(a), p(!0)
                            }).catch(function(r) {
                                e$("openCounterTrade: getTrade failed", r), e_("openCounterTrade", r), h(n("Error.TradeUnknownError")), t.warning(n("Error.TradeUnknownError"))
                            })
                        }, [U, ej, t, n]);
                    return (0, K.useEffect)(function() {
                        eX("useTradeRequest init effect for route", o), "create" === o.view && o.userId ? eR(o.userId) : "counter" === o.view && o.tradeId ? eN(o.tradeId) : e$("useTradeRequest: route missing required params", o)
                    }, [o.view, o.userId, o.tradeId]), {
                        loaded: f,
                        initError: m,
                        partner: b,
                        offers: c,
                        error: x,
                        tradePending: j,
                        isCounterTrade: null !== _.current,
                        isRobuxAmountValid: tu,
                        toggleItem: Q,
                        removeItem: Z,
                        setRobux: J,
                        onRobuxBlur: ee,
                        isItemInOffers: B,
                        isItemUnavailable: X,
                        doesItemHaveError: $,
                        getItemErrorReason: Y,
                        confirmSendOpen: P,
                        requestSend: ef,
                        cancelSend: ep,
                        confirmSend: ey,
                        economicBody: R,
                        dismissEconomic: eS,
                        verificationRedirectOpen: k,
                        dismissVerificationRedirect: eO
                    }
                };

            function d_(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function dF(t, n, r, o, a, i, l) {
                try {
                    var u = t[i](l),
                        c = u.value
                } catch (t) {
                    r(t);
                    return
                }
                u.done ? n(c) : Promise.resolve(c).then(o, a)
            }

            function dU(t) {
                return function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(o, a) {
                        var i = t.apply(n, r);

                        function l(t) {
                            dF(i, o, a, l, u, "next", t)
                        }

                        function u(t) {
                            dF(i, o, a, l, u, "throw", t)
                        }
                        l(void 0)
                    })
                }
            }

            function dW(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var i = [],
                            l = !0,
                            u = !1;
                        try {
                            for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            u = !0, o = t
                        } finally {
                            try {
                                l || null == a.return || a.return()
                            } finally {
                                if (u) throw o
                            }
                        }
                        return i
                    }
                }(t, n) || dV(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function dz(t) {
                return function(t) {
                    if (Array.isArray(t)) return d_(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || dV(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function dV(t, n) {
                if (t) {
                    if ("string" == typeof t) return d_(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return d_(t, n)
                }
            }

            function dB(t, n) {
                var r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return l.next = u(0), l.throw = u(1), l.return = u(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                    return this
                }), l;

                function u(u) {
                    return function(c) {
                        var s = [u, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                            if (r = 1, o && (a = 2 & s[0] ? o.return : s[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, s[1])).done) return a;
                            switch (o = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                case 0:
                                case 1:
                                    a = s;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, o = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                        i.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && i.label < a[1]) {
                                        i.label = a[1], a = s;
                                        break
                                    }
                                    if (a && i.label < a[2]) {
                                        i.label = a[2], i.ops.push(s);
                                        break
                                    }
                                    a[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            s = n.call(t, i)
                        } catch (t) {
                            s = [6, t], o = 0
                        } finally {
                            r = a = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var dH = ei.getTradableItemsLimit,
                dK = function(t) {
                    var n = dW((0, K.useState)([]), 2),
                        r = n[0],
                        o = n[1],
                        a = dW((0, K.useState)(!1), 2),
                        i = a[0],
                        l = a[1],
                        u = dW((0, K.useState)(!1), 2),
                        c = u[0],
                        s = u[1],
                        d = dW((0, K.useState)(""), 2),
                        f = d[0],
                        p = d[1],
                        v = dW((0, K.useState)(!1), 2),
                        m = v[0],
                        h = v[1],
                        y = dW((0, K.useState)(!1), 2),
                        b = y[0],
                        g = y[1],
                        w = dW((0, K.useState)(1), 2),
                        x = w[0],
                        S = w[1],
                        O = (0, K.useRef)(window.innerWidth < 991 ? 12 : 10),
                        j = (0, K.useRef)([]),
                        E = (0, K.useRef)(0),
                        C = (0, K.useRef)(null),
                        P = (0, K.useRef)(0),
                        A = (0, K.useCallback)(function() {
                            var t = O.current,
                                n = E.current * t,
                                r = j.current;
                            o(r.slice(n, n + t)), h(E.current > 0), g(r.length > n + t || null !== C.current), S(E.current + 1)
                        }, []),
                        T = (0, K.useCallback)(function(n, r) {
                            return dU(function() {
                                var o;
                                return dB(this, function(a) {
                                    switch (a.label) {
                                        case 0:
                                            return [4, eg(t, n || void 0, C.current || void 0, dH)];
                                        case 1:
                                            if (o = a.sent(), P.current !== r) return [2, !1];
                                            return j.current = dz(j.current).concat(dz(o.items)), C.current = o.nextPageCursor, [2, !0]
                                    }
                                })
                            })()
                        }, [t]),
                        R = (0, K.useCallback)(function(n) {
                            var r = P.current + 1;
                            P.current = r, j.current = [], E.current = 0, C.current = null, o([]), h(!1), g(!1), S(1), s(!1), l(!0), T(n, r).then(function(t) {
                                t && (A(), l(!1))
                            }).catch(function(n) {
                                P.current === r && (e$("useInventoryPager: failed to load inventory for user", t, n), l(!1), s(!0))
                            })
                        }, [T, A, t]);
                    (0, K.useEffect)(function() {
                        R("")
                    }, [t]);
                    var N = (0, K.useCallback)(function(t) {
                            p(t), R(t)
                        }, [R]),
                        I = (0, K.useCallback)(function() {
                            if (!i) {
                                var n = O.current,
                                    r = (E.current + 1) * n,
                                    o = r + n,
                                    a = j.current;
                                if (a.length >= o || null === C.current && a.length > r) {
                                    E.current += 1, A();
                                    return
                                }
                                if (null !== C.current) {
                                    var u = P.current;
                                    l(!0), dU(function() {
                                        return dB(this, function(t) {
                                            switch (t.label) {
                                                case 0:
                                                    if (!(j.current.length < o && null !== C.current)) return [3, 2];
                                                    return [4, T(f, u)];
                                                case 1:
                                                    if (!t.sent()) return [2];
                                                    return [3, 0];
                                                case 2:
                                                    return [2]
                                            }
                                        })
                                    })().then(function() {
                                        P.current === u && (j.current.length > r && (E.current += 1), A(), l(!1))
                                    }).catch(function(n) {
                                        P.current === u && (e$("useInventoryPager: failed to load inventory for user", t, n), l(!1), s(!0))
                                    })
                                }
                            }
                        }, [f, i, T, A, t]),
                        k = (0, K.useCallback)(function() {
                            i || E.current <= 0 || (E.current -= 1, A())
                        }, [i, A]);
                    return {
                        items: r,
                        loading: i,
                        loadFailed: c,
                        filter: f,
                        hasPrev: m,
                        hasNext: b,
                        page: x,
                        setFilter: N,
                        loadNext: I,
                        loadPrev: k
                    }
                },
                dq = function(t) {
                    var n = t.item,
                        r = t.selected,
                        o = t.unavailable,
                        a = t.onClick,
                        i = (0, H.useTranslation)().translate,
                        l = function() {
                            a(n)
                        },
                        u = o ? (0, z.jsxs)("div", {
                            className: "item-card-equipped",
                            children: [r && (0, z.jsx)("span", {
                                className: "icon-check-selection"
                            }), n.isOnHold && (0, z.jsxs)("div", {
                                className: "item-card-holding",
                                children: [(0, z.jsx)("div", {
                                    className: "icon-uiblox-pending"
                                }), (0, z.jsx)("div", {
                                    className: "item-card-holding-label font-header-2",
                                    children: i("Label.Holding")
                                })]
                            })]
                        }) : null;
                    return (0, z.jsx)("div", {
                        className: "trade-inventory-card".concat(o ? " is-unavailable" : ""),
                        role: "button",
                        tabIndex: 0,
                        "aria-pressed": r,
                        onClickCapture: function(t) {
                            t.target.closest(".item-card-thumb-container") && (t.preventDefault(), t.stopPropagation(), l())
                        },
                        onKeyDown: function(t) {
                            ("Enter" === t.key || " " === t.key) && (t.preventDefault(), l())
                        },
                        children: (0, z.jsx)(dd, {
                            item: n,
                            overlay: u
                        })
                    })
                },
                dX = function(t) {
                    var n, r = t.user,
                        o = t.onItemClick,
                        a = t.isItemInOffers,
                        i = t.isItemUnavailable,
                        l = (0, H.useTranslation)().translate,
                        u = dK(r.id),
                        c = r.id === (null == (n = (0, en.authenticatedUser)()) ? void 0 : n.id),
                        s = (0, K.useMemo)(function() {
                            return ei.inventoryFilters.map(function(t) {
                                return {
                                    value: t.value,
                                    label: l(t.labelKey)
                                }
                            })
                        }, [l]),
                        d = c ? l("Label.YourInventory") : l("Label.TheirInventory", {
                            username: r.displayName
                        });
                    return (0, z.jsxs)("div", {
                        className: "col-xs-12 trade-inventory-panel",
                        children: [(0, z.jsxs)("div", {
                            className: "row inventory-panel-header",
                            children: [(0, z.jsx)("h2", {
                                className: "inventory-label paired-name",
                                children: d
                            }), (0, z.jsx)("div", {
                                className: "trade-list-dropdown inventory-type-dropdown",
                                children: (0, z.jsx)(c_, {
                                    options: s,
                                    value: u.filter,
                                    onSelect: function(t) {
                                        u.setFilter(t), eD(eP, "switchAccessoryType", {
                                            type: t || null
                                        }), eL(eI, "switchAccessoryType", {
                                            filterType: "inventoryCategory",
                                            value: t || null
                                        })
                                    }
                                })
                            })]
                        }), (0, z.jsxs)("div", {
                            children: [(0, z.jsx)("ul", {
                                className: "hlist item-cards item-cards-stackable",
                                children: u.items.map(function(t) {
                                    return (0, z.jsx)("li", {
                                        className: "list-item item-card trade-item-card",
                                        children: (0, z.jsx)(dq, {
                                            item: t,
                                            selected: a(t),
                                            unavailable: i(t),
                                            onClick: o
                                        })
                                    }, t.id)
                                })
                            }), u.loading && (0, z.jsx)("span", {
                                className: "spinner spinner-default"
                            }), !u.loading && u.loadFailed && (0, z.jsx)("div", {
                                className: "col-xs-12 container-empty",
                                children: l("Error.TradeUnknownError")
                            }), !u.loading && !u.loadFailed && 0 === u.items.length && (0, z.jsx)("div", {
                                className: "col-xs-12 container-empty",
                                children: l(c ? "Label.YourInventoryEmpty" : "Label.TheirInventoryEmpty")
                            }), (u.hasPrev || u.hasNext) && (0, z.jsxs)("div", {
                                className: "trade-inventory-pager",
                                children: [(0, z.jsx)("button", {
                                    type: "button",
                                    className: "btn-generic-left-sm",
                                    disabled: !u.hasPrev || u.loading,
                                    "aria-label": l("Action.Back"),
                                    onClick: u.loadPrev,
                                    children: (0, z.jsx)("span", {
                                        className: "icon-left"
                                    })
                                }), (0, z.jsx)("span", {
                                    className: "trade-inventory-pager-label",
                                    children: l("Label.CurrentPage", {
                                        currentPage: u.page
                                    })
                                }), (0, z.jsx)("button", {
                                    type: "button",
                                    className: "btn-generic-right-sm",
                                    disabled: !u.hasNext || u.loading,
                                    "aria-label": l("Action.Next"),
                                    onClick: function() {
                                        eD(eP, "inventoryPage"), u.loadNext()
                                    },
                                    children: (0, z.jsx)("span", {
                                        className: "icon-right"
                                    })
                                })]
                            })]
                        })]
                    })
                },
                d$ = function(t) {
                    var n, r = t.offer,
                        o = t.onRemoveItem,
                        a = t.onRobuxChange,
                        i = t.onRobuxBlur,
                        l = t.isRobuxValid,
                        u = t.doesItemHaveError,
                        c = t.getItemErrorReason,
                        s = (0, H.useTranslation)().translate,
                        d = l(r.robux),
                        f = !!(r.robux && r.robux > 0),
                        p = function(t) {
                            var n = "Bundle" === t.itemTarget.itemType,
                                r = "".concat(n ? "/bundles" : "/catalog", "/").concat(t.itemTarget.targetId, "/").concat(encodeURIComponent(t.itemName.trim().replace(/[^\w\s-]/g, "").replace(/\s+/g, "-"))),
                                a = u(t);
                            return (0, z.jsxs)("div", {
                                className: "trade-request-item".concat(a ? " invalid-request-item" : ""),
                                children: [(0, z.jsx)("span", {
                                    className: "icon-background-circle",
                                    children: (0, z.jsx)("span", {
                                        className: "icon-close cursor-pointer",
                                        role: "button",
                                        tabIndex: 0,
                                        "aria-label": "".concat(s("Action.Remove"), " ").concat(t.itemName),
                                        onClick: function() {
                                            o(t)
                                        },
                                        onKeyDown: function(n) {
                                            ("Enter" === n.key || " " === n.key) && (n.preventDefault(), o(t))
                                        }
                                    })
                                }), (0, z.jsx)(cF.Thumbnail2d, {
                                    type: n ? cF.ThumbnailTypes.bundleThumbnail : cF.ThumbnailTypes.assetThumbnail,
                                    targetId: t.itemTarget.targetId,
                                    size: cF.DefaultThumbnailSize
                                }), (0, z.jsx)("div", {
                                    className: "text-lead item-name",
                                    title: t.itemName,
                                    children: (0, z.jsx)("span", {
                                        children: (0, z.jsx)("a", {
                                            href: r,
                                            target: "_blank",
                                            rel: "noreferrer",
                                            children: t.itemName
                                        })
                                    })
                                }), !!t.recentAveragePrice && (0, z.jsxs)("div", {
                                    className: "item-value",
                                    children: [(0, z.jsx)("span", {
                                        className: "icon-robux-16x16"
                                    }), (0, z.jsx)("span", {
                                        className: "text-robux",
                                        children: (0, e7.formatNumber)(t.recentAveragePrice || 0)
                                    })]
                                }), a && (0, z.jsx)("span", {
                                    className: "text-error",
                                    children: c(t)
                                })]
                            })
                        };
                    return (0, z.jsxs)("div", {
                        className: "trade-request-window-offer",
                        children: [(0, z.jsx)("h2", {
                            children: r.label
                        }), r.slots.map(function(t, n) {
                            if ("item" === t.type && t.tradableItem) {
                                var r;
                                return (0, z.jsx)("div", {
                                    title: tc(t.tradableItem, s),
                                    children: p(t.tradableItem)
                                }, null != (r = t.tradableItem.id) ? r : n)
                            }
                            return "add-item" === t.type ? (0, z.jsx)("div", {
                                className: "trade-request-item draggable-border"
                            }, "add-".concat(n)) : (0, z.jsx)("div", {
                                className: "trade-request-item blank-item"
                            }, "empty-".concat(n))
                        }), (0, z.jsxs)("div", {
                            className: "input-group robux-input-group".concat(d ? "" : " form-has-error form-has-feedback"),
                            children: [(0, z.jsx)("input", {
                                className: "form-control input-field",
                                name: "robux",
                                type: "text",
                                inputMode: "numeric",
                                pattern: "\\d*",
                                placeholder: s("Label.PlusRobuxAmount"),
                                value: null === r.robux ? "" : String(r.robux),
                                onChange: function(t) {
                                    a(r.user.id, t.target.value)
                                },
                                onBlur: function() {
                                    i(r)
                                }
                            }), (0, z.jsx)("div", {
                                className: "input-group-btn",
                                children: (0, z.jsx)("span", {
                                    className: "input-addon-btn",
                                    children: (0, z.jsx)("span", {
                                        className: "icon-robux-gray-16x16"
                                    })
                                })
                            })]
                        }), f && (0, z.jsxs)("div", {
                            className: "robux-line",
                            children: [(0, z.jsx)("span", {
                                className: "text-secondary",
                                children: s("Label.AfterRobuxFee", {
                                    percent: "".concat(ta())
                                })
                            }), (0, z.jsxs)("span", {
                                className: "robux-line-amount",
                                children: [(0, z.jsx)("span", {
                                    className: "icon-robux-16x16"
                                }), (0, z.jsx)("span", {
                                    className: "text-secondary robux-line-value",
                                    children: (0, e7.formatNumber)(ti(null != (n = r.robux) ? n : 0))
                                })]
                            })]
                        }), (0, z.jsxs)("div", {
                            className: "robux-line",
                            children: [(0, z.jsx)("span", {
                                className: "text-lead",
                                children: s("Label.TotalValue")
                            }), (0, z.jsxs)("span", {
                                className: "robux-line-amount",
                                children: [(0, z.jsx)("span", {
                                    className: "icon-robux-16x16"
                                }), (0, z.jsx)("span", {
                                    className: "text-robux-lg robux-line-value",
                                    children: (0, e7.formatNumber)(tl(r))
                                })]
                            })]
                        })]
                    })
                },
                dY = function(t) {
                    var n, r = t.route,
                        o = t.systemFeedbackService,
                        a = (0, H.useTranslation)().translate,
                        i = et().navigate,
                        l = (0, K.useMemo)(function() {
                            return td()
                        }, []),
                        u = dM(o),
                        c = (0, K.useRef)(!1);
                    (0, K.useEffect)(function() {
                        if (!c.current) {
                            c.current = !0;
                            var t = "counter" === r.view,
                                n = eU();
                            eL(eT, t ? "counterTrade" : "createTrade", {
                                state: t ? ei.states.counterTrade : ei.states.tradeWithUser,
                                referrer: n.referrer,
                                entrySource: n.entrySource
                            })
                        }
                    }, [r.view]);
                    var s = (0, K.useMemo)(function() {
                        return u.offers.toSorted(function(t, n) {
                            return Number(n.isMyOffer) - Number(t.isMyOffer)
                        })
                    }, [u.offers]);
                    return eX("TradeRequest render: view=", r.view, "loaded=", u.loaded, "initError=", u.initError, "offers=", u.offers.length), (0, z.jsxs)("div", {
                        className: "trades-react trade-request-react".concat(l ? " is-mobile" : ""),
                        children: [(0, z.jsxs)("div", {
                            className: "trade-request-window",
                            children: [(0, z.jsxs)("span", {
                                className: "text-link cursor-pointer",
                                role: "button",
                                tabIndex: 0,
                                onClick: function() {
                                    i({
                                        view: "list"
                                    })
                                },
                                onKeyDown: function(t) {
                                    ("Enter" === t.key || " " === t.key) && i({
                                        view: "list"
                                    })
                                },
                                children: [(0, z.jsx)("span", {
                                    className: "icon-back"
                                }), (0, z.jsx)("span", {
                                    children: a("Action.BackToTrades")
                                })]
                            }), (0, z.jsx)("h1", {
                                className: "trades-header-nowrap",
                                children: u.partner && (0, z.jsx)("span", {
                                    className: "paired-name",
                                    dangerouslySetInnerHTML: {
                                        __html: a("Label.TradeWithPartner", {
                                            username: u.partner.nameForDisplay
                                        })
                                    }
                                })
                            }), (0, z.jsx)("span", {
                                className: "trade-holding-container",
                                children: (0, z.jsx)(lr, {
                                    position: "bottom-end",
                                    title: a("Label.HoldingPolicy"),
                                    description: a("Message.HoldingPolicy"),
                                    children: (0, z.jsx)(lo, {
                                        asChild: !0,
                                        children: (0, z.jsxs)("span", {
                                            className: "tooltip-container",
                                            tabIndex: 0,
                                            children: [(0, z.jsx)("span", {
                                                className: "font-caption-body text trade-holding-period-label",
                                                children: a("Label.HoldingPeriod")
                                            }), (0, z.jsx)("span", {
                                                className: "icon-actions-info-sm"
                                            })]
                                        })
                                    })
                                })
                            }), !u.loaded && !u.initError && (0, z.jsx)("span", {
                                className: "spinner spinner-default"
                            }), u.initError && (0, z.jsx)("div", {
                                className: "text-error section-content-off",
                                children: u.initError
                            }), u.loaded && (0, z.jsxs)(q().Fragment, {
                                children: [(0, z.jsx)("div", {
                                    className: "inventory-panel-holder",
                                    children: s.map(function(t) {
                                        return (0, z.jsx)(dX, {
                                            user: t.user,
                                            onItemClick: u.toggleItem,
                                            isItemInOffers: u.isItemInOffers,
                                            isItemUnavailable: u.isItemUnavailable
                                        }, t.user.id)
                                    })
                                }), (0, z.jsx)("div", {
                                    className: "trade-request-window-offers-parent",
                                    children: (0, z.jsxs)("div", {
                                        className: "trade-request-window-offers",
                                        children: [s.map(function(t) {
                                            return (0, z.jsx)(d$, {
                                                offer: t,
                                                onRemoveItem: u.removeItem,
                                                onRobuxChange: u.setRobux,
                                                onRobuxBlur: u.onRobuxBlur,
                                                isRobuxValid: u.isRobuxAmountValid,
                                                doesItemHaveError: u.doesItemHaveError,
                                                getItemErrorReason: u.getItemErrorReason
                                            }, t.user.id)
                                        }), u.error && (0, z.jsx)("div", {
                                            className: "text-error",
                                            children: u.error
                                        }), (0, z.jsx)("button", {
                                            type: "button",
                                            className: "btn-cta-md btn-full-width",
                                            disabled: u.tradePending,
                                            onClick: u.requestSend,
                                            children: a("Label.RequestTrade")
                                        })]
                                    })
                                })]
                            })]
                        }), (0, z.jsx)(ds, {
                            open: u.confirmSendOpen,
                            title: a("Heading.SendTrade"),
                            body: a("Message.SendTrade"),
                            actionText: a("Action.SendTrade"),
                            actionVariant: "Emphasis",
                            neutralText: a("Action.Cancel"),
                            closeLabel: a("Action.Close"),
                            onAction: u.confirmSend,
                            onCancel: u.cancelSend
                        }), (0, z.jsx)(ds, {
                            open: null !== u.economicBody,
                            title: a("Heading.EconomicRestrictionsError"),
                            body: null != (n = u.economicBody) ? n : "",
                            showAction: !1,
                            neutralText: a("Action.Cancel"),
                            closeLabel: a("Action.Close"),
                            onCancel: u.dismissEconomic
                        }), (0, z.jsx)(ds, {
                            open: u.verificationRedirectOpen,
                            title: a("Heading.TwoStepVerificationRequired"),
                            body: a("Message.TwoStepVerificationRequired"),
                            actionText: a("Action.GoToSecurity"),
                            actionVariant: "Emphasis",
                            neutralText: a("Action.Cancel"),
                            closeLabel: a("Action.Close"),
                            onAction: function() {
                                u.dismissVerificationRedirect(), cX()
                            },
                            onCancel: u.dismissVerificationRedirect
                        })]
                    })
                };

            function dG(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }
            var dZ = function(t) {
                    var n = t.systemFeedbackService;
                    return eV(), (0, z.jsxs)(q().Fragment, {
                        children: [(0, z.jsx)(e2, {}), (0, z.jsx)(dj, {
                            systemFeedbackService: n
                        })]
                    })
                },
                dQ = function() {
                    var t, n = (0, H.useTranslation)().translate,
                        r = (0, X.useSystemFeedback)(),
                        o = r.SystemFeedbackComponent,
                        a = r.systemFeedbackService,
                        i = (t = (0, K.useState)(function() {
                            var t;
                            return null != (t = Z()) ? t : {
                                view: "list"
                            }
                        }), function(t) {
                            if (Array.isArray(t)) return t
                        }(t) || function(t, n) {
                            var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                            if (null != a) {
                                var i = [],
                                    l = !0,
                                    u = !1;
                                try {
                                    for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), i.length !== n); l = !0);
                                } catch (t) {
                                    u = !0, o = t
                                } finally {
                                    try {
                                        l || null == a.return || a.return()
                                    } finally {
                                        if (u) throw o
                                    }
                                }
                                return i
                            }
                        }(t, 2) || function(t, n) {
                            if (t) {
                                if ("string" == typeof t) return dG(t, 2);
                                var r = Object.prototype.toString.call(t).slice(8, -1);
                                if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return dG(t, n)
                            }
                        }(t, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        l = i[0],
                        u = i[1],
                        c = (0, K.useCallback)(function(t) {
                            var n = Q(t);
                            eX("navigate ->", t, "path:", n), window.history.pushState(null, "", n), u(t)
                        }, []);
                    return (0, K.useEffect)(function() {
                        var t = function() {
                            var t, n = null != (t = Z()) ? t : {
                                view: "list"
                            };
                            eX("popstate ->", n), u(n)
                        };
                        return window.addEventListener("popstate", t),
                            function() {
                                window.removeEventListener("popstate", t)
                            }
                    }, []), eX("render app view:", l.view, l), (0, z.jsxs)(ee, {
                        value: {
                            route: l,
                            navigate: c
                        },
                        children: [(0, z.jsx)(e8, {
                            fallbackMessage: n("Error.FailedToLoadTradesList"),
                            children: "list" === l.view ? (0, z.jsx)(dZ, {
                                systemFeedbackService: a
                            }) : (0, z.jsx)(dY, {
                                route: l,
                                systemFeedbackService: a
                            })
                        }), (0, z.jsx)(o, {}), (0, z.jsx)("div", {
                            id: "2sv-popup-container"
                        })]
                    })
                },
                dJ = function() {
                    return (0, z.jsx)(H.TranslationProvider, {
                        config: $.P,
                        children: (0, z.jsx)(X.SystemFeedbackProvider, {
                            children: (0, z.jsx)(dQ, {})
                        })
                    })
                };
            r(452), r(224), B()(function() {
                var t = document.getElementById("trades-web-app") || document.getElementById("trades-container");
                if (!t) {
                    eY("No container found for React trades mounting (looked for #trades-web-app / #trades-container)."), e_("mount", "No container found for React trades mounting");
                    return
                }
                t.classList.add("trades-container"), eX("mounting React trades into", "#".concat(t.id), "route:", Z());
                try {
                    (0, H.renderWithErrorBoundary)((0, z.jsx)(dJ, {}), t), eX("React trades mounted successfully")
                } catch (t) {
                    eY("React trades failed to mount", t), e_("mount", t)
                }
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("Trades");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/trades-e18bf8dded3c2e5e.js.map
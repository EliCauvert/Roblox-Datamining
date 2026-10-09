! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "ab525e423cf7566448a23ff5f21e35ce1f1d008e"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "c58bf9c2-9a3e-4cf2-bb80-cd46bcbf0869", e._sentryDebugIdIdentifier = "sentry-dbid-c58bf9c2-9a3e-4cf2-bb80-cd46bcbf0869")
    } catch (e) {}
}(),
function() {
    "use strict";
    var e, t, r, n, o, a, i, l, c, u, s, f, p, d, h, y, m, b, v = {},
        g = {};

    function O(e) {
        var t = g[e];
        if (void 0 !== t) return t.exports;
        var r = g[e] = {
            exports: {}
        };
        return v[e](r, r.exports, O), r.exports
    }
    O.m = v, O.n = function(e) {
        var t = e && e.__esModule ? function() {
            return e.default
        } : function() {
            return e
        };
        return O.d(t, {
            a: t
        }), t
    }, O.d = function(e, t) {
        for (var r in t) O.o(t, r) && !O.o(e, r) && Object.defineProperty(e, r, {
            enumerable: !0,
            get: t[r]
        })
    }, O.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, O.r = function(e) {
        "u" > typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, O.nc = void 0, O.rv = function() {
        return "1.7.12"
    }, O.ruid = "bundler=rspack@1.7.12";
    var E = window.Roblox,
        w = window.CoreRobloxUtilities,
        S = "/info/terms",
        P = "ItemPurchaseAjaxData",
        x = "/games/",
        j = "Purchasing.PurchaseDialog",
        A = "CommonUI.Controls",
        I = "Feature.Premium",
        _ = "Game Pass",
        T = "Bundle",
        N = {
            size: "150x150",
            format: "Png",
            isCircular: !1
        },
        C = "Action.BuyRobuxAndItem",
        R = "Action.BuyRobux",
        U = "Action.Cancel",
        M = "Heading.InsufficientRobux",
        k = "Heading.InsufficientRobuxNew",
        D = "Message.InsufficientRobuxAskToPurchasePackage",
        B = "Label.PurchasingTheItem",
        L = "Action.Ok",
        H = "Action.Cancel",
        F = "U13PaymentModal",
        G = "ParentalConsentWarningPaymentModal13To17",
        V = "U13MonthlyThreshold1Modal",
        W = "U13MonthlyThreshold2Modal",
        X = "COOKIE_PARSE_FAILED",
        K = "PRODUCT_INFO_REQUEST_FAILED",
        z = "PRODUCT_INFO_EMPTY",
        Y = "PRODUCT_ID_NOT_EXIST",
        Z = "UPSELL_FAILED",
        q = "NoTypeParsedYet",
        $ = "UpsellShown",
        J = "UpsellCancelled",
        Q = "UpsellCancelledFromU13Modal",
        ee = "CancelledFromLeaveRobloxModal",
        et = "AutoPurchaseSucceed",
        er = "AutoPurchaseFailed",
        en = "U13PaymentModalFailedToShow",
        eo = window.Roblox["core-scripts"].http.http,
        ea = window.Roblox["core-scripts"].environmentUrls,
        ei = O.n(ea);

    function el(e, t, r, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, o)
    }

    function ec(e, t, r) {
        var n;
        return (n = function() {
            var n, o;
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
                        n = {
                            upsell_platform: "WEB",
                            user_robux_balance: parseInt(e.userBalanceRobux, 10),
                            attempt_robux_amount: null != r ? r : t.expectedItemPrice
                        }, o = {
                            url: "".concat(ea.EnvironmentUrls.apiGatewayUrl).concat("/payments-gateway/v1/products/get-upsell-product"),
                            withCredentials: !0
                        }, a.label = 1;
                    case 1:
                        return a.trys.push([1, 3, , 4]), [4, eo.post(o, n)];
                    case 2:
                        return [2, a.sent()];
                    case 3:
                        return [2, Promise.reject(a.sent())];
                    case 4:
                        return [2]
                }
            })
        }, function() {
            var e = this,
                t = arguments;
            return new Promise(function(r, o) {
                var a = n.apply(e, t);

                function i(e) {
                    el(a, r, o, i, l, "next", e)
                }

                function l(e) {
                    el(a, r, o, i, l, "throw", e)
                }
                i(void 0)
            })
        })()
    }
    var eu = window.CoreUtilities,
        es = window.Roblox["core-scripts"].format.string,
        ef = window.Roblox["core-scripts"].format.number;

    function ep(e) {
        var t = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1],
            r = arguments.length > 2 && void 0 !== arguments[2] && arguments[2],
            n = arguments.length > 3 && void 0 !== arguments[3] && arguments[3],
            o = (0, ef.formatNumber)(e),
            a = r ? "<s>".concat(o, "</s>") : o;
        return n ? "<span class='icon-robux-16x16 light-theme'></span><span class='text'>".concat(a, "</span>") : t ? "<span class='icon-robux-16x16'></span><span class='text-robux'>".concat(a, "</span>") : "<span class='icon-robux-gray-16x16'></span><span class='text'>".concat(a, "</span>")
    }
    var ed = "function" == typeof crypto.randomUUID,
        eh = function() {
            var e = new Uint8Array(16);
            crypto.getRandomValues(e);
            var t = Array.from(e, function(e, t) {
                return (6 === t ? 15 & e | 64 : 8 === t ? 63 & e | 128 : e).toString(16).padStart(2, "0")
            });
            return "".concat(t.slice(0, 4).join(""), "-").concat(t.slice(4, 6).join(""), "-").concat(t.slice(6, 8).join(""), "-") + "".concat(t.slice(8, 10).join(""), "-").concat(t.slice(10, 16).join(""))
        },
        ey = function() {
            return ed ? crypto.randomUUID() : eh()
        };

    function em(e) {
        return "".concat("RBXUpsellOfferIds:").concat(e)
    }

    function eb(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function ev(e, t, r, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, o)
    }

    function eg() {
        if (w.upsellUtil.expireUpsellCookie(), window.history) {
            var e = new URL(window.location.href);
            e.searchParams.delete(w.upsellUtil.constants.UPSELL_QUERY_PARAM_KEY);
            var t = e.href;
            window.history.pushState({
                path: t
            }, "", t)
        }
    }

    function eO(e, t, r, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, o)
    }
    var eE = window.EventTracker;

    function ew(e) {
        (0, eE.fireEvent)("WebCatalog" + e)
    }

    function eS(e, t) {
        t === T || "Package" === t ? (0, eE.fireEvent)("WebBundle" + e) : t === _ ? (0, eE.fireEvent)("WebGamePass" + e) : t ? ew(e) : ew("UnknownErrorNoAsset")
    }

    function eP(e, t, r, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, o)
    }

    function ex(e) {
        w.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(w.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, w.paymentFlowAnalyticsService.ENUM_VIEW_NAME.PURCHASE_WARNING, w.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN, e)
    }

    function ej(e, t, r, n, o) {
        var a;
        return (a = function() {
            var a, i;
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
            }(this, function(l) {
                var c, u, s, f, p, d;
                switch (l.label) {
                    case 0:
                        if (!t) return r(), [2, Promise.resolve()];
                        l.label = 1;
                    case 1:
                        return l.trys.push([1, 3, , 4]), [4, (c = e.roblox_product_id, (u = function() {
                            var e, t, r;
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
                            }(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        e = {
                                            productId: c,
                                            is13To17ScaryModalEnabled: !E.CurrentUser.isPremiumUser
                                        }, t = {
                                            url: "".concat(ea.EnvironmentUrls.apiGatewayUrl).concat("/purchase-warning/v1/purchase-warnings"),
                                            withCredentials: !0,
                                            timeout: 5e3
                                        }, n.label = 1;
                                    case 1:
                                        return n.trys.push([1, 3, , 4]), [4, eo.get(t, e)];
                                    case 2:
                                        if (200 !== (r = n.sent()).status || !r.data.action) return [2, Promise.resolve("NoAction")];
                                        return [2, Promise.resolve(r.data.action)];
                                    case 3:
                                        return [2, Promise.reject(n.sent())];
                                    case 4:
                                        return [2]
                                }
                            })
                        }, function() {
                            var e = this,
                                t = arguments;
                            return new Promise(function(r, n) {
                                var o = u.apply(e, t);

                                function a(e) {
                                    ev(o, r, n, a, i, "next", e)
                                }

                                function i(e) {
                                    ev(o, r, n, a, i, "throw", e)
                                }
                                a(void 0)
                            })
                        })())];
                    case 2:
                        return (a = l.sent()) === F || a === G || a === V || a === W ? (a === F ? (ex(w.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.U13_PAYMENT_MODAL), eS("ShowU13PaymentModal", null == o ? void 0 : o.assetType)) : a === V ? (ex(w.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.U13_MONTHLY_THRESHOLD_1_MODAL), eS("ShowU13MonthlyThreshold1Modal", null == o ? void 0 : o.assetType)) : a === W ? (ex(w.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.U13_MONTHLY_THRESHOLD_2_MODAL), eS("ShowU13MonthlyThreshold2Modal", null == o ? void 0 : o.assetType)) : (ex(w.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.PAYMENT_MODAL_13_TO_17), eS("ShowParentalConsentWarningPaymentModal13To17Modal", null == o ? void 0 : o.assetType)), s = n.getTranslationResource(I), f = n.getTranslationResource(A), p = {
                            lineBreak: "<br /><br />",
                            linebreak: "<br /><br />"
                        }, d = "", a === F ? d = s.get("Description.ScaryModalBodyNew", p) : a === G ? d = s.get("Description.ScaryModalBody13To17", {}) : a === V ? d = s.get("Description.ScaryModalThreshold1Body", p) : a === W && (d = s.get("Description.ScaryModalThreshold2Body", p)), E.Dialog.open({
                            titleText: s.get("Heading.ScaryModalTitle", {}),
                            bodyContent: '<div><span class="text-description">'.concat(d, "</span></div>").concat('<div class="text-center"><div class="icon-warning"></div></div>'),
                            declineText: f.get(H, {}),
                            acceptText: f.get("Action.OK", {}),
                            onAccept: function() {
                                var e;
                                return (e = function() {
                                    var e, t;
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
                                    }(this, function(n) {
                                        switch (n.label) {
                                            case 0:
                                                e = {
                                                    acknowledgement: "Confirmed".concat(a)
                                                }, t = {
                                                    url: "".concat(ea.EnvironmentUrls.apiGatewayUrl).concat("/purchase-warning/v1/purchase-warnings/acknowledge"),
                                                    withCredentials: !0,
                                                    timeout: 5e3
                                                }, n.label = 1;
                                            case 1:
                                                return n.trys.push([1, 3, , 4]), [4, eo.post(t, e)];
                                            case 2:
                                                return n.sent(), r(), [2, Promise.resolve()];
                                            case 3:
                                                return [2, Promise.reject(n.sent())];
                                            case 4:
                                                return [2]
                                        }
                                    })
                                }, function() {
                                    var t = this,
                                        r = arguments;
                                    return new Promise(function(n, o) {
                                        var a = e.apply(t, r);

                                        function i(e) {
                                            eO(a, n, o, i, l, "next", e)
                                        }

                                        function l(e) {
                                            eO(a, n, o, i, l, "throw", e)
                                        }
                                        i(void 0)
                                    })
                                })().then(function() {
                                    a === F ? eS("ConfirmU13PaymentModal", null == o ? void 0 : o.assetType) : a === V ? eS("ConfirmU13MonthlyThreshold1Modal", null == o ? void 0 : o.assetType) : a === W ? eS("ConfirmU13MonthlyThreshold2Modal", null == o ? void 0 : o.assetType) : eS("ConfirmParentalConsentWarningPaymentModal13To17Modal", null == o ? void 0 : o.assetType)
                                }).catch(function() {
                                    r()
                                }), !1
                            },
                            onDecline: function() {
                                return eS(Q, null == o ? void 0 : o.assetType), eg(), !1
                            },
                            onCancel: function() {
                                return eS(Q, null == o ? void 0 : o.assetType), eg(), !1
                            },
                            allowHtmlContentInBody: !0,
                            allowHtmlContentInFooter: !1,
                            fieldValidationRequired: !0,
                            dismissable: !0,
                            xToCancel: !0
                        })) : "RequireEmailVerification" === a ? (eS("U13PaymentModalEmailVerificationTriggered", null == o ? void 0 : o.assetType), null == (i = E.EmailVerificationService.handleUserEmailVerificationRequiredByPurchaseWarning()) || i.then(function(e) {
                            ex(w.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.REQUIRE_EMAIL_VERIFICATION), (null == e ? void 0 : e.emailAddress) && (null == e ? void 0 : e.verified) && r()
                        })) : (eS("U13PaymentModalNoAction", null == o ? void 0 : o.assetType), r()), [2, Promise.resolve()];
                    case 3:
                        return [2, Promise.reject(l.sent())];
                    case 4:
                        return [2]
                }
            })
        }, function() {
            var e = this,
                t = arguments;
            return new Promise(function(r, n) {
                var o = a.apply(e, t);

                function i(e) {
                    eP(o, r, n, i, l, "next", e)
                }

                function l(e) {
                    eP(o, r, n, i, l, "throw", e)
                }
                i(void 0)
            })
        })()
    }
    var eA = window.React,
        eI = O.n(eA),
        e_ = window.ReactDOM,
        eT = O.n(e_),
        eN = window.ReactJSX,
        eC = function() {
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
        eR = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
        eU = function(e) {
            var t = e.className;
            return eI().createElement("div", {
                "aria-hidden": !0,
                "data-testid": "foundation-web-state-layer",
                className: eC("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
            })
        };

    function eM(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function ek(e) {
        if (Array.isArray(e)) return e
    }

    function eD() {
        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
    }

    function eB(e, t) {
        if (e) {
            if ("string" == typeof e) return eM(e, t);
            var r = Object.prototype.toString.call(e).slice(8, -1);
            if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eM(e, t)
        }
    }
    var eL = {
            XSmall: "size-[var(--icon-size-xsmall)]",
            Small: "size-[var(--icon-size-small)]",
            Medium: "size-[var(--icon-size-medium)]",
            Large: "size-[var(--icon-size-large)]",
            XLarge: "size-[var(--icon-size-xlarge)]",
            XXLarge: "size-[var(--icon-size-xxlarge)]"
        },
        eH = eI().forwardRef(function(e, t) {
            var r, n = ek(r = [e, t]) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(r) || eB(r) || eD(),
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
                s = (ek(a) || function(e) {
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
                }(a) || eB(a, 1) || eD())[0];
            return eI().createElement("span", function(e) {
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
                className: eC("grow-0 shrink-0 basis-auto icon", i, eL[void 0 === l ? "Medium" : l], c)
            }, u))
        });
    eH.displayName = "Icon";
    var eF = {
            Small: "padding-xsmall",
            Medium: "padding-small",
            Large: "padding-small"
        },
        eG = {
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-100"
        },
        eV = function(e) {
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
            return eI().createElement("button", function(e) {
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
                className: eC("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", eR, eG[t], eF[r], n && "radius-circle", o)
            }, a), eI().createElement(eU, null), eI().createElement(eH, {
                name: "icon-regular-x",
                size: r
            }))
        };

    function eW(e, t) {
        var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
            n = r.checkForDefaultPrevented,
            o = void 0 === n || n;
        return function(r) {
            if (null == e || e(r), !1 === o || !r.defaultPrevented) return null == t ? void 0 : t(r)
        }
    }

    function eX(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function eK(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }

    function ez() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        return function(e) {
            var r = !1,
                n = t.map(function(t) {
                    var n = eK(t, e);
                    return r || "function" != typeof n || (r = !0), n
                });
            if (r) return function() {
                for (var e = 0; e < n.length; e++) {
                    var r = n[e];
                    "function" == typeof r ? r() : eK(t[e], null)
                }
            }
        }
    }

    function eY() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        return eA.useCallback(ez.apply(void 0, function(e) {
            if (Array.isArray(e)) return eX(e)
        }(t) || function(e) {
            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
        }(t) || function(e) {
            if (e) {
                if ("string" == typeof e) return eX(e, void 0);
                var t = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return eX(e, void 0)
            }
        }(t) || function() {
            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()), t)
    }

    function eZ(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function eq(e, t, r) {
        return t in e ? Object.defineProperty(e, t, {
            value: r,
            enumerable: !0,
            configurable: !0,
            writable: !0
        }) : e[t] = r, e
    }

    function e$(e) {
        for (var t = 1; t < arguments.length; t++) {
            var r = null != arguments[t] ? arguments[t] : {},
                n = Object.keys(r);
            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                return Object.getOwnPropertyDescriptor(r, e).enumerable
            }))), n.forEach(function(t) {
                eq(e, t, r[t])
            })
        }
        return e
    }

    function eJ(e, t) {
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

    function eQ(e) {
        return function(e) {
            if (Array.isArray(e)) return eZ(e)
        }(e) || function(e) {
            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
        }(e) || function(e) {
            if (e) {
                if ("string" == typeof e) return eZ(e, void 0);
                var t = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return eZ(e, void 0)
            }
        }(e) || function() {
            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }

    function e0(e) {
        var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
            r = [],
            n = function() {
                var t = r.map(function(e) {
                    return eA.createContext(e)
                });
                return function(r) {
                    var n = (null == r ? void 0 : r[e]) || t;
                    return eA.useMemo(function() {
                        var t, o;
                        return eq({}, "__scope".concat(e), (t = e$({}, r), o = null != (o = eq({}, e, n)) ? o : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(o)) : (function(e) {
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
            var o = eA.createContext(n),
                a = r.length;
            r = eQ(r).concat([n]);
            var i = function(t) {
                var r, n = t.scope,
                    i = t.children,
                    l = eJ(t, ["scope", "children"]),
                    c = (null == n || null == (r = n[e]) ? void 0 : r[a]) || o,
                    u = eA.useMemo(function() {
                        return l
                    }, Object.values(l));
                return (0, eN.jsx)(c.Provider, {
                    value: u,
                    children: i
                })
            };
            return i.displayName = t + "Provider", [i, function(r, i) {
                var l, c = (null == i || null == (l = i[e]) ? void 0 : l[a]) || o,
                    u = eA.useContext(c);
                if (u) return u;
                if (void 0 !== n) return n;
                throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
            }]
        }, e1.apply(void 0, [n].concat(eQ(t)))]
    }

    function e1() {
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
                    return e$({}, e, n(t)["__scope".concat(o)])
                }, {});
                return eA.useMemo(function() {
                    return eq({}, "__scope".concat(n.scopeName), r)
                }, [r])
            }
        };
        return o.scopeName = n.scopeName, o
    }
    var e2 = (null == (h = globalThis) ? void 0 : h.document) ? eA.useLayoutEffect : function() {};

    function e3(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }
    var e6 = eA[" useId ".trim().toString()] || function() {},
        e5 = 0;

    function e4(e) {
        var t, r = function(e) {
                if (Array.isArray(e)) return e
            }(t = eA.useState(e6())) || function(e) {
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
                    if ("string" == typeof e) return e3(e, 2);
                    var t = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return e3(e, 2)
                }
            }(t) || function() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }(),
            n = r[0],
            o = r[1];
        return e2(function() {
            e || o(function(e) {
                return null != e ? e : String(e5++)
            })
        }, [e]), e || (n ? "radix-".concat(n) : "")
    }

    function e8(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function e7(e) {
        var t = eA.useRef(e);
        return eA.useEffect(function() {
            t.current = e
        }), eA.useMemo(function() {
            return function() {
                for (var e, r = arguments.length, n = Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                    if (Array.isArray(e)) return e8(e)
                }(n) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(n) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return e8(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return e8(e, void 0)
                    }
                }(n) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()))
            }
        }, [])
    }

    function e9(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function te(e, t) {
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
                if ("string" == typeof e) return e9(e, t);
                var r = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return e9(e, t)
            }
        }(e, t) || function() {
            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }
    var tt = window.RadixUI["react-dismissable-layer"],
        tr = window.RadixUI["react-focus-scope"];

    function tn(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function to(e) {
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

    function ta(e, t) {
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

    function ti(e, t) {
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

    function tl(e) {
        return function(e) {
            if (Array.isArray(e)) return tn(e)
        }(e) || function(e) {
            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
        }(e) || function(e) {
            if (e) {
                if ("string" == typeof e) return tn(e, void 0);
                var t = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tn(e, void 0)
            }
        }(e) || function() {
            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }

    function tc(e) {
        var t, r, n = (t = e, (r = eA.forwardRef(function(e, t) {
                var r = e.children,
                    n = ti(e, ["children"]);
                if (eA.isValidElement(r)) {
                    var o, a, i, l, c, u = (c = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                        s = function(e, t) {
                            var r = to({}, t);
                            for (var n in t) ! function(n) {
                                var o = e[n],
                                    a = t[n];
                                /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                    a.apply(void 0, tl(t)), o.apply(void 0, tl(t))
                                } : o && (r[n] = o) : "style" === n ? r[n] = to({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                            }(n);
                            return to({}, e, r)
                        }(n, r.props);
                    return r.type !== eA.Fragment && (s.ref = t ? ez(t, u) : u), eA.cloneElement(r, s)
                }
                return eA.Children.count(r) > 1 ? eA.Children.only(null) : null
            })).displayName = "".concat(t, ".SlotClone"), r),
            o = eA.forwardRef(function(e, t) {
                var r = e.children,
                    o = ti(e, ["children"]),
                    a = eA.Children.toArray(r),
                    i = a.find(ts);
                if (i) {
                    var l = i.props.children,
                        c = a.map(function(e) {
                            return e !== i ? e : eA.Children.count(l) > 1 ? eA.Children.only(null) : eA.isValidElement(l) ? l.props.children : null
                        });
                    return (0, eN.jsx)(n, ta(to({}, o), {
                        ref: t,
                        children: eA.isValidElement(l) ? eA.cloneElement(l, void 0, c) : null
                    }))
                }
                return (0, eN.jsx)(n, ta(to({}, o), {
                    ref: t,
                    children: r
                }))
            });
        return o.displayName = "".concat(e, ".Slot"), o
    }
    var tu = Symbol("radix.slottable");

    function ts(e) {
        return eA.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === tu
    }

    function tf(e, t, r) {
        return t in e ? Object.defineProperty(e, t, {
            value: r,
            enumerable: !0,
            configurable: !0,
            writable: !0
        }) : e[t] = r, e
    }

    function tp(e) {
        for (var t = 1; t < arguments.length; t++) {
            var r = null != arguments[t] ? arguments[t] : {},
                n = Object.keys(r);
            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                return Object.getOwnPropertyDescriptor(r, e).enumerable
            }))), n.forEach(function(t) {
                tf(e, t, r[t])
            })
        }
        return e
    }

    function td(e, t) {
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
    var th = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
        var r = tc("Primitive.".concat(t)),
            n = eA.forwardRef(function(e, n) {
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
                return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, eN.jsx)(i, td(tp({}, a), {
                    ref: n
                }))
            });
        return n.displayName = "Primitive.".concat(t), td(tp({}, e), tf({}, t, n))
    }, {});

    function ty(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }
    var tm = eA.forwardRef(function(e, t) {
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
            }(r = eA.useState(!1)) || function(e) {
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
                    if ("string" == typeof e) return ty(e, 2);
                    var t = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ty(e, 2)
                }
            }(r) || function() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }(),
            s = u[0],
            f = u[1];
        e2(function() {
            return f(!0)
        }, []);
        var p = l || s && (null == (i = globalThis) || null == (a = i.document) ? void 0 : a.body);
        return p ? eT().createPortal((0, eN.jsx)(th.div, (n = function(e) {
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
        }), n)), p) : null
    });

    function tb(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function tv(e, t) {
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
                if ("string" == typeof e) return tb(e, t);
                var r = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tb(e, t)
            }
        }(e, t) || function() {
            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }
    tm.displayName = "Portal";
    var tg = function(e) {
        var t, r, n, o, a, i, l, c, u, s, f, p, d, h, y, m, b, v = e.present,
            g = e.children,
            O = (t = v, a = (o = tv(eA.useState(), 2))[0], i = o[1], l = eA.useRef({}), c = eA.useRef(t), u = eA.useRef("none"), f = (s = tv((r = t ? "mounted" : "unmounted", n = {
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
            }, eA.useReducer(function(e, t) {
                var r = n[e][t];
                return null != r ? r : e
            }, r)), 2))[0], p = s[1], eA.useEffect(function() {
                var e = tO(l.current);
                u.current = "mounted" === f ? e : "none"
            }, [f]), e2(function() {
                var e = l.current,
                    r = c.current;
                if (r !== t) {
                    var n = u.current,
                        o = tO(e);
                    t ? p("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? p("UNMOUNT") : r && n !== o ? p("ANIMATION_OUT") : p("UNMOUNT"), c.current = t
                }
            }, [t, p]), e2(function() {
                if (a) {
                    var e, t, r = null != (e = a.ownerDocument.defaultView) ? e : window,
                        n = function(e) {
                            var n = tO(l.current).includes(e.animationName);
                            if (e.target === a && n && (p("ANIMATION_END"), !c.current)) {
                                var o = a.style.animationFillMode;
                                a.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                    "forwards" === a.style.animationFillMode && (a.style.animationFillMode = o)
                                })
                            }
                        },
                        o = function(e) {
                            e.target === a && (u.current = tO(l.current))
                        };
                    return a.addEventListener("animationstart", o), a.addEventListener("animationcancel", n), a.addEventListener("animationend", n),
                        function() {
                            r.clearTimeout(t), a.removeEventListener("animationstart", o), a.removeEventListener("animationcancel", n), a.removeEventListener("animationend", n)
                        }
                }
                p("ANIMATION_END")
            }, [a, p]), {
                isPresent: ["mounted", "unmountSuspended"].includes(f),
                ref: eA.useCallback(function(e) {
                    e && (l.current = getComputedStyle(e)), i(e)
                }, [])
            }),
            E = "function" == typeof g ? g({
                present: O.isPresent
            }) : eA.Children.only(g),
            w = eY(O.ref, (b = (m = null == (h = Object.getOwnPropertyDescriptor((d = E).props, "ref")) ? void 0 : h.get) && "isReactWarning" in m && m.isReactWarning) ? d.ref : (b = (m = null == (y = Object.getOwnPropertyDescriptor(d, "ref")) ? void 0 : y.get) && "isReactWarning" in m && m.isReactWarning) ? d.props.ref : d.props.ref || d.ref);
        return "function" == typeof g || O.isPresent ? eA.cloneElement(E, {
            ref: w
        }) : null
    };

    function tO(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    tg.displayName = "Presence";
    var tE = window.RadixUI["react-focus-guards"],
        tw = function() {
            return (tw = Object.assign || function(e) {
                for (var t, r = 1, n = arguments.length; r < n; r++)
                    for (var o in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                return e
            }).apply(this, arguments)
        };

    function tS(e, t) {
        var r = {};
        for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && 0 > t.indexOf(n) && (r[n] = e[n]);
        if (null != e && "function" == typeof Object.getOwnPropertySymbols)
            for (var o = 0, n = Object.getOwnPropertySymbols(e); o < n.length; o++) 0 > t.indexOf(n[o]) && Object.prototype.propertyIsEnumerable.call(e, n[o]) && (r[n[o]] = e[n[o]]);
        return r
    }
    var tP = "right-scroll-bar-position",
        tx = "width-before-scroll-bar";

    function tj(e, t) {
        return "function" == typeof e ? e(t) : e && (e.current = t), e
    }
    var tA = "u" > typeof window ? eA.useLayoutEffect : eA.useEffect,
        tI = new WeakMap,
        t_ = (void 0 === t && (t = {}), (void 0 === r && (r = function(e) {
            return e
        }), n = [], o = !1, a = {
            read: function() {
                if (o) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                return n.length ? n[n.length - 1] : null
            },
            useMedium: function(e) {
                var t = r(e, o);
                return n.push(t),
                    function() {
                        n = n.filter(function(e) {
                            return e !== t
                        })
                    }
            },
            assignSyncMedium: function(e) {
                for (o = !0; n.length;) {
                    var t = n;
                    n = [], t.forEach(e)
                }
                n = {
                    push: function(t) {
                        return e(t)
                    },
                    filter: function() {
                        return n
                    }
                }
            },
            assignMedium: function(e) {
                o = !0;
                var t = [];
                if (n.length) {
                    var r = n;
                    n = [], r.forEach(e), t = n
                }
                var a = function() {
                        var r = t;
                        t = [], r.forEach(e)
                    },
                    i = function() {
                        return Promise.resolve().then(a)
                    };
                i(), n = {
                    push: function(e) {
                        t.push(e), i()
                    },
                    filter: function(e) {
                        return t = t.filter(e), n
                    }
                }
            }
        }).options = tw({
            async: !0,
            ssr: !1
        }, t), a),
        tT = function() {},
        tN = eA.forwardRef(function(e, t) {
            var r, n, o, a, i = eA.useRef(null),
                l = eA.useState({
                    onScrollCapture: tT,
                    onWheelCapture: tT,
                    onTouchMoveCapture: tT
                }),
                c = l[0],
                u = l[1],
                s = e.forwardProps,
                f = e.children,
                p = e.className,
                d = e.removeScrollBar,
                h = e.enabled,
                y = e.shards,
                m = e.sideCar,
                b = e.noRelative,
                v = e.noIsolation,
                g = e.inert,
                O = e.allowPinchZoom,
                E = e.as,
                w = e.gapMode,
                S = tS(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                P = (r = [i, t], n = function(e) {
                    return r.forEach(function(t) {
                        return tj(t, e)
                    })
                }, (o = (0, eA.useState)(function() {
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
                })[0]).callback = n, a = o.facade, tA(function() {
                    var e = tI.get(a);
                    if (e) {
                        var t = new Set(e),
                            n = new Set(r),
                            o = a.current;
                        t.forEach(function(e) {
                            n.has(e) || tj(e, null)
                        }), n.forEach(function(e) {
                            t.has(e) || tj(e, o)
                        })
                    }
                    tI.set(a, r)
                }, [r]), a),
                x = tw(tw({}, S), c);
            return eA.createElement(eA.Fragment, null, h && eA.createElement(m, {
                sideCar: t_,
                removeScrollBar: d,
                shards: y,
                noRelative: b,
                noIsolation: v,
                inert: g,
                setCallbacks: u,
                allowPinchZoom: !!O,
                lockRef: i,
                gapMode: w
            }), s ? eA.cloneElement(eA.Children.only(f), tw(tw({}, x), {
                ref: P
            })) : eA.createElement(void 0 === E ? "div" : E, tw({}, x, {
                className: p,
                ref: P
            }), f))
        });
    tN.defaultProps = {
        enabled: !0,
        removeScrollBar: !0,
        inert: !1
    }, tN.classNames = {
        fullWidth: tx,
        zeroRight: tP
    };
    var tC = function(e) {
        var t = e.sideCar,
            r = tS(e, ["sideCar"]);
        if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
        var n = t.read();
        if (!n) throw Error("Sidecar medium not found");
        return eA.createElement(n, tw({}, r))
    };
    tC.isSideCarExport = !0;
    var tR = function() {
            var e = 0,
                t = null;
            return {
                add: function(r) {
                    if (0 == e && (t = function() {
                            if (!document) return null;
                            var e = document.createElement("style");
                            e.type = "text/css";
                            var t = y || O.nc;
                            return t && e.setAttribute("nonce", t), e
                        }())) {
                        var n, o;
                        (n = t).styleSheet ? n.styleSheet.cssText = r : n.appendChild(document.createTextNode(r)), o = t, (document.head || document.getElementsByTagName("head")[0]).appendChild(o)
                    }
                    e++
                },
                remove: function() {
                    --e || !t || (t.parentNode && t.parentNode.removeChild(t), t = null)
                }
            }
        },
        tU = function() {
            var e = tR();
            return function(t, r) {
                eA.useEffect(function() {
                    return e.add(t),
                        function() {
                            e.remove()
                        }
                }, [t && r])
            }
        },
        tM = function() {
            var e = tU();
            return function(t) {
                return e(t.styles, t.dynamic), null
            }
        },
        tk = {
            left: 0,
            top: 0,
            right: 0,
            gap: 0
        },
        tD = function(e) {
            return parseInt(e || "", 10) || 0
        },
        tB = function(e) {
            var t = window.getComputedStyle(document.body),
                r = t["padding" === e ? "paddingLeft" : "marginLeft"],
                n = t["padding" === e ? "paddingTop" : "marginTop"],
                o = t["padding" === e ? "paddingRight" : "marginRight"];
            return [tD(r), tD(n), tD(o)]
        },
        tL = function(e) {
            if (void 0 === e && (e = "margin"), "u" < typeof window) return tk;
            var t = tB(e),
                r = document.documentElement.clientWidth,
                n = window.innerWidth;
            return {
                left: t[0],
                top: t[1],
                right: t[2],
                gap: Math.max(0, n - r + t[2] - t[0])
            }
        },
        tH = tM(),
        tF = "data-scroll-locked",
        tG = function(e, t, r, n) {
            var o = e.left,
                a = e.top,
                i = e.right,
                l = e.gap;
            return void 0 === r && (r = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(n, ";\n   padding-right: ").concat(l, "px ").concat(n, ";\n  }\n  body[").concat(tF, "] {\n    overflow: hidden ").concat(n, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(n, ";"), "margin" === r && "\n    padding-left: ".concat(o, "px;\n    padding-top: ").concat(a, "px;\n    padding-right: ").concat(i, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(l, "px ").concat(n, ";\n    "), "padding" === r && "padding-right: ".concat(l, "px ").concat(n, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(tP, " {\n    right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(tx, " {\n    margin-right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(tP, " .").concat(tP, " {\n    right: 0 ").concat(n, ";\n  }\n  \n  .").concat(tx, " .").concat(tx, " {\n    margin-right: 0 ").concat(n, ";\n  }\n  \n  body[").concat(tF, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(l, "px;\n  }\n")
        },
        tV = function() {
            var e = parseInt(document.body.getAttribute(tF) || "0", 10);
            return isFinite(e) ? e : 0
        },
        tW = function() {
            eA.useEffect(function() {
                return document.body.setAttribute(tF, (tV() + 1).toString()),
                    function() {
                        var e = tV() - 1;
                        e <= 0 ? document.body.removeAttribute(tF) : document.body.setAttribute(tF, e.toString())
                    }
            }, [])
        },
        tX = function(e) {
            var t = e.noRelative,
                r = e.noImportant,
                n = e.gapMode,
                o = void 0 === n ? "margin" : n;
            tW();
            var a = eA.useMemo(function() {
                return tL(o)
            }, [o]);
            return eA.createElement(tH, {
                styles: tG(a, !t, o, r ? "" : "!important")
            })
        },
        tK = !1;
    if ("u" > typeof window) try {
        var tz = Object.defineProperty({}, "passive", {
            get: function() {
                return tK = !0, !0
            }
        });
        window.addEventListener("test", tz, tz), window.removeEventListener("test", tz, tz)
    } catch (e) {
        tK = !1
    }
    var tY = !!tK && {
        passive: !1
    };

    function tZ(e, t) {
        return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
    }
    var tq = function(e, t) {
            if (!tZ(e, Element)) return !1;
            var r = window.getComputedStyle(e);
            return "hidden" !== r[t] && (r.overflowY !== r.overflowX || "TEXTAREA" === e.tagName || "visible" !== r[t])
        },
        t$ = function(e, t) {
            var r = t.ownerDocument,
                n = t;
            do {
                if ("u" > typeof ShadowRoot && tZ(n, ShadowRoot) && (n = n.host), tJ(e, n)) {
                    var o = tQ(e, n);
                    if (o[1] > o[2]) return !0
                }
                n = n.parentNode
            } while (n && n !== r.body);
            return !1
        },
        tJ = function(e, t) {
            return "v" === e ? tq(t, "overflowY") : tq(t, "overflowX")
        },
        tQ = function(e, t) {
            return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
        },
        t0 = function(e, t, r, n, o) {
            var a, i = (a = window.getComputedStyle(t).direction, "h" === e && "rtl" === a ? -1 : 1),
                l = i * n,
                c = r.target,
                u = t.contains(c),
                s = !1,
                f = l > 0,
                p = 0,
                d = 0;
            do {
                if (!c) break;
                var h = tQ(e, c),
                    y = h[0],
                    m = h[1] - h[2] - i * y;
                (y || m) && tJ(e, c) && (p += m, d += y);
                var b = c.parentNode;
                c = b && b.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? b.host : b
            } while (!u && c !== document.body || u && (t.contains(c) || t === c));
            return f && (o && 1 > Math.abs(p) || !o && l > p) ? s = !0 : !f && (o && 1 > Math.abs(d) || !o && -l > d) && (s = !0), s
        },
        t1 = function(e) {
            return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
        },
        t2 = function(e) {
            return [e.deltaX, e.deltaY]
        },
        t3 = function(e) {
            return e && "current" in e ? e.current : e
        },
        t6 = 0,
        t5 = [],
        t4 = (i = function(e) {
            var t = eA.useRef([]),
                r = eA.useRef([0, 0]),
                n = eA.useRef(),
                o = eA.useState(t6++)[0],
                a = eA.useState(tM)[0],
                i = eA.useRef(e);
            eA.useEffect(function() {
                i.current = e
            }, [e]), eA.useEffect(function() {
                if (e.inert) {
                    document.body.classList.add("block-interactivity-".concat(o));
                    var t = (function(e, t, r) {
                        if (r || 2 == arguments.length)
                            for (var n, o = 0, a = t.length; o < a; o++) !n && o in t || (n || (n = Array.prototype.slice.call(t, 0, o)), n[o] = t[o]);
                        return e.concat(n || Array.prototype.slice.call(t))
                    })([e.lockRef.current], (e.shards || []).map(t3), !0).filter(Boolean);
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
            var l = eA.useCallback(function(e, t) {
                    if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !i.current.allowPinchZoom;
                    var o, a = t1(e),
                        l = r.current,
                        c = "deltaX" in e ? e.deltaX : l[0] - a[0],
                        u = "deltaY" in e ? e.deltaY : l[1] - a[1],
                        s = e.target,
                        f = Math.abs(c) > Math.abs(u) ? "h" : "v";
                    if ("touches" in e && "h" === f && "range" === s.type) return !1;
                    var p = t$(f, s);
                    if (!p) return !0;
                    if (p ? o = f : (o = "v" === f ? "h" : "v", p = t$(f, s)), !p) return !1;
                    if (!n.current && "changedTouches" in e && (c || u) && (n.current = o), !o) return !0;
                    var d = n.current || o;
                    return t0(d, t, e, "h" === d ? c : u, !0)
                }, []),
                c = eA.useCallback(function(e) {
                    if (t5.length && t5[t5.length - 1] === a) {
                        var r = "deltaY" in e ? t2(e) : t1(e),
                            n = t.current.filter(function(t) {
                                var n;
                                return t.name === e.type && (t.target === e.target || e.target === t.shadowParent) && (n = t.delta, n[0] === r[0] && n[1] === r[1])
                            })[0];
                        if (n && n.should) {
                            e.cancelable && e.preventDefault();
                            return
                        }
                        if (!n) {
                            var o = (i.current.shards || []).map(t3).filter(Boolean).filter(function(t) {
                                return t.contains(e.target)
                            });
                            (o.length > 0 ? l(e, o[0]) : !i.current.noIsolation) && e.cancelable && e.preventDefault()
                        }
                    }
                }, []),
                u = eA.useCallback(function(e, r, n, o) {
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
                s = eA.useCallback(function(e) {
                    r.current = t1(e), n.current = void 0
                }, []),
                f = eA.useCallback(function(t) {
                    u(t.type, t2(t), t.target, l(t, e.lockRef.current))
                }, []),
                p = eA.useCallback(function(t) {
                    u(t.type, t1(t), t.target, l(t, e.lockRef.current))
                }, []);
            eA.useEffect(function() {
                return t5.push(a), e.setCallbacks({
                        onScrollCapture: f,
                        onWheelCapture: f,
                        onTouchMoveCapture: p
                    }), document.addEventListener("wheel", c, tY), document.addEventListener("touchmove", c, tY), document.addEventListener("touchstart", s, tY),
                    function() {
                        t5 = t5.filter(function(e) {
                            return e !== a
                        }), document.removeEventListener("wheel", c, tY), document.removeEventListener("touchmove", c, tY), document.removeEventListener("touchstart", s, tY)
                    }
            }, []);
            var d = e.removeScrollBar,
                h = e.inert;
            return eA.createElement(eA.Fragment, null, h ? eA.createElement(a, {
                styles: "\n  .block-interactivity-".concat(o, " {pointer-events: none;}\n  .allow-interactivity-").concat(o, " {pointer-events: all;}\n")
            }) : null, d ? eA.createElement(tX, {
                noRelative: e.noRelative,
                gapMode: e.gapMode
            }) : null)
        }, t_.useMedium(i), tC),
        t8 = eA.forwardRef(function(e, t) {
            return eA.createElement(tN, tw({}, e, {
                ref: t,
                sideCar: t4
            }))
        });
    t8.classNames = tN.classNames;
    var t7 = new WeakMap,
        t9 = new WeakMap,
        re = {},
        rt = 0,
        rr = function(e) {
            return e && (e.host || rr(e.parentNode))
        },
        rn = function(e, t, r, n) {
            var o = (Array.isArray(e) ? e : [e]).map(function(e) {
                if (t.contains(e)) return e;
                var r = rr(e);
                return r && t.contains(r) ? r : (console.error("aria-hidden", e, "in not contained inside", t, ". Doing nothing"), null)
            }).filter(function(e) {
                return !!e
            });
            re[r] || (re[r] = new WeakMap);
            var a = re[r],
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
                            c = (t7.get(e) || 0) + 1,
                            u = (a.get(e) || 0) + 1;
                        t7.set(e, c), a.set(e, u), i.push(e), 1 === c && o && t9.set(e, !0), 1 === u && e.setAttribute(r, "true"), o || e.setAttribute(n, "true")
                    } catch (t) {
                        console.error("aria-hidden: cannot operate on ", e, t)
                    }
                })
            };
            return s(t), l.clear(), rt++,
                function() {
                    i.forEach(function(e) {
                        var t = t7.get(e) - 1,
                            o = a.get(e) - 1;
                        t7.set(e, t), a.set(e, o), t || (t9.has(e) || e.removeAttribute(n), t9.delete(e)), o || e.removeAttribute(r)
                    }), --rt || (t7 = new WeakMap, t7 = new WeakMap, t9 = new WeakMap, re = {})
                }
        },
        ro = function(e, t, r) {
            void 0 === r && (r = "data-aria-hidden");
            var n = Array.from(Array.isArray(e) ? e : [e]),
                o = t || ("u" < typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body);
            return o ? (n.push.apply(n, Array.from(o.querySelectorAll("[aria-live], script"))), rn(n, o, r, "aria-hidden")) : function() {
                return null
            }
        };

    function ra(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function ri(e) {
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

    function rl(e, t) {
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

    function rc(e, t) {
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

    function ru(e, t) {
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
                if ("string" == typeof e) return ra(e, t);
                var r = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ra(e, t)
            }
        }(e, t) || function() {
            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }
    var rs = "Dialog",
        rf = ru(e0(rs), 2),
        rp = rf[0];
    rf[1];
    var rd = ru(rp(rs), 2),
        rh = rd[0],
        ry = rd[1],
        rm = function(e) {
            var t, r, n, o, a, i, l, c, u, s, f, p, d, h, y, m, b, v = e.__scopeDialog,
                g = e.children,
                O = e.open,
                E = e.defaultOpen,
                w = e.onOpenChange,
                S = e.modal,
                P = eA.useRef(null),
                x = eA.useRef(null),
                j = ru((u = (c = {
                    prop: O,
                    defaultProp: E,
                    onChange: w
                }).prop, d = (p = te((r = (t = {
                    defaultProp: c.defaultProp,
                    onChange: f = void 0 === (s = c.onChange) ? function() {} : s
                }).defaultProp, n = t.onChange, a = te(o = eA.useState(r), 1)[0], i = eA.useRef(a), l = e7(n), eA.useEffect(function() {
                    i.current !== a && (l(a), i.current = a)
                }, [a, i, l]), o), 2))[0], h = p[1], m = (y = void 0 !== u) ? u : d, b = e7(f), [m, eA.useCallback(function(e) {
                    if (y) {
                        var t = "function" == typeof e ? e(u) : e;
                        t !== u && b(t)
                    } else h(e)
                }, [y, u, h, b])]), 2),
                A = j[0],
                I = j[1];
            return (0, eN.jsx)(rh, {
                scope: v,
                triggerRef: P,
                contentRef: x,
                contentId: e4(),
                titleId: e4(),
                descriptionId: e4(),
                open: void 0 !== A && A,
                onOpenChange: I,
                onOpenToggle: eA.useCallback(function() {
                    return I(function(e) {
                        return !e
                    })
                }, [I]),
                modal: void 0 === S || S,
                children: g
            })
        };
    rm.displayName = rs;
    var rb = "DialogTrigger";
    eA.forwardRef(function(e, t) {
        var r = e.__scopeDialog,
            n = rc(e, ["__scopeDialog"]),
            o = ry(rb, r),
            a = eY(t, o.triggerRef);
        return (0, eN.jsx)(th.button, rl(ri({
            type: "button",
            "aria-haspopup": "dialog",
            "aria-expanded": o.open,
            "aria-controls": o.contentId,
            "data-state": rk(o.open)
        }, n), {
            ref: a,
            onClick: eW(e.onClick, o.onOpenToggle)
        }))
    }).displayName = rb;
    var rv = "DialogPortal",
        rg = ru(rp(rv, {
            forceMount: void 0
        }), 2),
        rO = rg[0],
        rE = rg[1],
        rw = function(e) {
            var t = e.__scopeDialog,
                r = e.forceMount,
                n = e.children,
                o = e.container,
                a = ry(rv, t);
            return (0, eN.jsx)(rO, {
                scope: t,
                forceMount: r,
                children: eA.Children.map(n, function(e) {
                    return (0, eN.jsx)(tg, {
                        present: r || a.open,
                        children: (0, eN.jsx)(tm, {
                            asChild: !0,
                            container: o,
                            children: e
                        })
                    })
                })
            })
        };
    rw.displayName = rv;
    var rS = "DialogOverlay",
        rP = eA.forwardRef(function(e, t) {
            var r = rE(rS, e.__scopeDialog),
                n = e.forceMount,
                o = void 0 === n ? r.forceMount : n,
                a = rc(e, ["forceMount"]),
                i = ry(rS, e.__scopeDialog);
            return i.modal ? (0, eN.jsx)(tg, {
                present: o || i.open,
                children: (0, eN.jsx)(rj, rl(ri({}, a), {
                    ref: t
                }))
            }) : null
        });
    rP.displayName = rS;
    var rx = tc("DialogOverlay.RemoveScroll"),
        rj = eA.forwardRef(function(e, t) {
            var r = e.__scopeDialog,
                n = rc(e, ["__scopeDialog"]),
                o = ry(rS, r);
            return (0, eN.jsx)(t8, {
                as: rx,
                allowPinchZoom: !0,
                shards: [o.contentRef],
                children: (0, eN.jsx)(th.div, rl(ri({
                    "data-state": rk(o.open)
                }, n), {
                    ref: t,
                    style: ri({
                        pointerEvents: "auto"
                    }, n.style)
                }))
            })
        }),
        rA = "DialogContent",
        rI = eA.forwardRef(function(e, t) {
            var r = rE(rA, e.__scopeDialog),
                n = e.forceMount,
                o = void 0 === n ? r.forceMount : n,
                a = rc(e, ["forceMount"]),
                i = ry(rA, e.__scopeDialog);
            return (0, eN.jsx)(tg, {
                present: o || i.open,
                children: i.modal ? (0, eN.jsx)(r_, rl(ri({}, a), {
                    ref: t
                })) : (0, eN.jsx)(rT, rl(ri({}, a), {
                    ref: t
                }))
            })
        });
    rI.displayName = rA;
    var r_ = eA.forwardRef(function(e, t) {
            var r = ry(rA, e.__scopeDialog),
                n = eA.useRef(null),
                o = eY(t, r.contentRef, n);
            return eA.useEffect(function() {
                var e = n.current;
                if (e) return ro(e)
            }, []), (0, eN.jsx)(rN, rl(ri({}, e), {
                ref: o,
                trapFocus: r.open,
                disableOutsidePointerEvents: !0,
                onCloseAutoFocus: eW(e.onCloseAutoFocus, function(e) {
                    var t;
                    e.preventDefault(), null == (t = r.triggerRef.current) || t.focus()
                }),
                onPointerDownOutside: eW(e.onPointerDownOutside, function(e) {
                    var t = e.detail.originalEvent,
                        r = 0 === t.button && !0 === t.ctrlKey;
                    (2 === t.button || r) && e.preventDefault()
                }),
                onFocusOutside: eW(e.onFocusOutside, function(e) {
                    return e.preventDefault()
                })
            }))
        }),
        rT = eA.forwardRef(function(e, t) {
            var r = ry(rA, e.__scopeDialog),
                n = eA.useRef(!1),
                o = eA.useRef(!1);
            return (0, eN.jsx)(rN, rl(ri({}, e), {
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
        rN = eA.forwardRef(function(e, t) {
            var r = e.__scopeDialog,
                n = e.trapFocus,
                o = e.onOpenAutoFocus,
                a = e.onCloseAutoFocus,
                i = rc(e, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                l = ry(rA, r),
                c = eA.useRef(null),
                u = eY(t, c);
            return (0, tE.useFocusGuards)(), (0, eN.jsxs)(eN.Fragment, {
                children: [(0, eN.jsx)(tr.FocusScope, {
                    asChild: !0,
                    loop: !0,
                    trapped: n,
                    onMountAutoFocus: o,
                    onUnmountAutoFocus: a,
                    children: (0, eN.jsx)(tt.DismissableLayer, rl(ri({
                        role: "dialog",
                        id: l.contentId,
                        "aria-describedby": l.descriptionId,
                        "aria-labelledby": l.titleId,
                        "data-state": rk(l.open)
                    }, i), {
                        ref: u,
                        onDismiss: function() {
                            return l.onOpenChange(!1)
                        }
                    }))
                }), (0, eN.jsxs)(eN.Fragment, {
                    children: [(0, eN.jsx)(rH, {
                        titleId: l.titleId
                    }), (0, eN.jsx)(rF, {
                        contentRef: c,
                        descriptionId: l.descriptionId
                    })]
                })]
            })
        }),
        rC = "DialogTitle";
    eA.forwardRef(function(e, t) {
        var r = e.__scopeDialog,
            n = rc(e, ["__scopeDialog"]),
            o = ry(rC, r);
        return (0, eN.jsx)(th.h2, rl(ri({
            id: o.titleId
        }, n), {
            ref: t
        }))
    }).displayName = rC;
    var rR = "DialogDescription";
    eA.forwardRef(function(e, t) {
        var r = e.__scopeDialog,
            n = rc(e, ["__scopeDialog"]),
            o = ry(rR, r);
        return (0, eN.jsx)(th.p, rl(ri({
            id: o.descriptionId
        }, n), {
            ref: t
        }))
    }).displayName = rR;
    var rU = "DialogClose",
        rM = eA.forwardRef(function(e, t) {
            var r = e.__scopeDialog,
                n = rc(e, ["__scopeDialog"]),
                o = ry(rU, r);
            return (0, eN.jsx)(th.button, rl(ri({
                type: "button"
            }, n), {
                ref: t,
                onClick: eW(e.onClick, function() {
                    return o.onOpenChange(!1)
                })
            }))
        });

    function rk(e) {
        return e ? "open" : "closed"
    }
    rM.displayName = rU;
    var rD = "DialogTitleWarning",
        rB = ru((l = {
            contentName: rA,
            titleName: rC,
            docsSlug: "dialog"
        }, c = eA.createContext(l), (u = function(e) {
            var t = e.children,
                r = eJ(e, ["children"]),
                n = eA.useMemo(function() {
                    return r
                }, Object.values(r));
            return (0, eN.jsx)(c.Provider, {
                value: n,
                children: t
            })
        }).displayName = rD + "Provider", [u, function(e) {
            var t = eA.useContext(c);
            if (t) return t;
            if (void 0 !== l) return l;
            throw Error("`".concat(e, "` must be used within `").concat(rD, "`"))
        }]), 2),
        rL = (rB[0], rB[1]),
        rH = function(e) {
            var t = e.titleId,
                r = rL(rD),
                n = "`".concat(r.contentName, "` requires a `").concat(r.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(r.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(r.docsSlug);
            return eA.useEffect(function() {
                t && (document.getElementById(t) || console.error(n))
            }, [n, t]), null
        },
        rF = function(e) {
            var t = e.contentRef,
                r = e.descriptionId,
                n = rL("DialogDescriptionWarning"),
                o = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(n.contentName, "}.");
            return eA.useEffect(function() {
                var e, n = null == (e = t.current) ? void 0 : e.getAttribute("aria-describedby");
                r && n && (document.getElementById(r) || console.warn(o))
            }, [o, t, r]), null
        };

    function rG(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function rV(e) {
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

    function rW(e, t) {
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

    function rX(e, t) {
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

    function rK(e) {
        return function(e) {
            if (Array.isArray(e)) return rG(e)
        }(e) || function(e) {
            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
        }(e) || function(e) {
            if (e) {
                if ("string" == typeof e) return rG(e, void 0);
                var t = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rG(e, void 0)
            }
        }(e) || function() {
            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }
    var rz = Symbol("radix.slottable");

    function rY(e) {
        return eA.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === rz
    }

    function rZ(e, t, r) {
        return t in e ? Object.defineProperty(e, t, {
            value: r,
            enumerable: !0,
            configurable: !0,
            writable: !0
        }) : e[t] = r, e
    }

    function rq(e) {
        for (var t = 1; t < arguments.length; t++) {
            var r = null != arguments[t] ? arguments[t] : {},
                n = Object.keys(r);
            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                return Object.getOwnPropertyDescriptor(r, e).enumerable
            }))), n.forEach(function(t) {
                rZ(e, t, r[t])
            })
        }
        return e
    }

    function r$(e, t) {
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
    var rJ = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
        var r, n, o, a, i, l = (r = o = "Primitive.".concat(t), (n = eA.forwardRef(function(e, t) {
                var r = e.children,
                    n = rX(e, ["children"]);
                if (eA.isValidElement(r)) {
                    var o, a, i, l, c, u = (c = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                        s = function(e, t) {
                            var r = rV({}, t);
                            for (var n in t) ! function(n) {
                                var o = e[n],
                                    a = t[n];
                                /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                    var n = a.apply(void 0, rK(t));
                                    return o.apply(void 0, rK(t)), n
                                } : o && (r[n] = o) : "style" === n ? r[n] = rV({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                            }(n);
                            return rV({}, e, r)
                        }(n, r.props);
                    return r.type !== eA.Fragment && (s.ref = t ? ez(t, u) : u), eA.cloneElement(r, s)
                }
                return eA.Children.count(r) > 1 ? eA.Children.only(null) : null
            })).displayName = "".concat(r, ".SlotClone"), a = n, (i = eA.forwardRef(function(e, t) {
                var r = e.children,
                    n = rX(e, ["children"]),
                    o = eA.Children.toArray(r),
                    i = o.find(rY);
                if (i) {
                    var l = i.props.children,
                        c = o.map(function(e) {
                            return e !== i ? e : eA.Children.count(l) > 1 ? eA.Children.only(null) : eA.isValidElement(l) ? l.props.children : null
                        });
                    return (0, eN.jsx)(a, rW(rV({}, n), {
                        ref: t,
                        children: eA.isValidElement(l) ? eA.cloneElement(l, void 0, c) : null
                    }))
                }
                return (0, eN.jsx)(a, rW(rV({}, n), {
                    ref: t,
                    children: r
                }))
            })).displayName = "".concat(o, ".Slot"), i),
            c = eA.forwardRef(function(e, r) {
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
                    a = n ? l : t;
                return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, eN.jsx)(a, r$(rq({}, o), {
                    ref: r
                }))
            });
        return c.displayName = "Primitive.".concat(t), r$(rq({}, e), rZ({}, t, c))
    }, {});

    function rQ(e) {
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
    var r0 = Object.freeze({
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
    });

    function r1(e) {
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

    function r2(e, t) {
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
    eA.forwardRef(function(e, t) {
        var r, n;
        return (0, eN.jsx)(rJ.span, (r = rQ({}, e), n = n = {
            ref: t,
            style: rQ({}, r0, e.style)
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
    }).displayName = "VisuallyHidden";
    var r3 = (0, eA.createContext)({
            size: "Medium",
            isModal: !0,
            hasCloseAffordance: !1,
            hasMarginTop: !0,
            hasMarginBottom: !0,
            hasDescription: !1,
            type: "Default"
        }),
        r6 = function() {
            var e = (0, eA.useContext)(r3);
            if (!e) throw Error("Dialog components must be used within a Dialog");
            return e
        },
        r5 = {
            Small: "padding-x-large",
            Medium: "padding-x-xlarge",
            Large: "padding-x-xlarge"
        },
        r4 = {
            Small: "padding-top-large",
            Medium: "padding-top-xlarge",
            Large: "padding-top-xlarge"
        },
        r8 = {
            Small: "padding-bottom-large",
            Medium: "padding-bottom-xlarge",
            Large: "padding-bottom-xlarge"
        },
        r7 = function(e) {
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
                p = e.hasMarginBottom,
                d = void 0 === p || p,
                h = e.hasDescription,
                y = void 0 !== h && h,
                m = e.experimentalDisablePointerEventsStylingOnBody,
                b = void 0 !== m && m,
                v = (0, eA.useMemo)(function() {
                    return {
                        size: o,
                        isModal: l,
                        type: i,
                        hasCloseAffordance: c,
                        closeLabel: u,
                        hasMarginTop: f,
                        hasMarginBottom: d,
                        hasDescription: y
                    }
                }, [o, l, i, c, u, f, d, y]);
            return (0, eA.useEffect)(function() {
                b && setTimeout(function() {
                    Object.assign(document.body.style, {
                        pointerEvents: "unset"
                    })
                }, 0)
            }, [b, t]), eI().createElement(r3.Provider, {
                value: v
            }, eI().createElement(rm, {
                open: t,
                onOpenChange: r
            }, n))
        };
    r7.displayName = "Dialog";
    var r9 = function(e) {
        var t = e.children,
            r = e.className,
            n = e.style,
            o = e.overlayClassName,
            a = e.overlayStyle,
            i = e.onOpenAutoFocus,
            l = r2(e, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
            c = r6(),
            u = c.size,
            s = c.isModal,
            f = c.hasCloseAffordance,
            p = c.closeLabel,
            d = c.hasDescription,
            h = eC("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", s && "bg-common-backdrop", o),
            y = eC("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", r);
        return eI().createElement(rw, null, eI().createElement(rP, {
            className: h,
            style: a
        }, eI().createElement(rI, r1({
            className: y,
            "data-size": u,
            style: n,
            onOpenAutoFocus: i
        }, !d && {
            "aria-describedby": void 0
        }, l), f && eI().createElement("div", {
            className: "absolute foundation-web-dialog-close-container"
        }, eI().createElement(rM, {
            asChild: !0
        }, eI().createElement(eV, {
            variant: "OverMedia",
            size: u,
            isCircular: !0,
            "aria-label": p
        }))), t)))
    };
    r9.displayName = "DialogContent";
    var ne = function(e) {
        var t = e.children,
            r = e.className,
            n = r2(e, ["children", "className"]),
            o = r6(),
            a = o.size,
            i = o.hasMarginTop,
            l = o.hasMarginBottom,
            c = eC(r5[a], i && r4[a], l && r8[a], r);
        return eI().createElement("div", r1({
            className: c
        }, n), t)
    };
    ne.displayName = "DialogBody";
    var nt = function(e) {
        var t = e.children,
            r = e.className,
            n = r2(e, ["children", "className"]),
            o = r6().size,
            a = eC(r5[o], r8[o], r);
        return eI().createElement("div", r1({
            className: a
        }, n), t)
    };
    nt.displayName = "DialogFooter";
    var nr = 0,
        nn = function() {
            var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "\xabr",
                t = (0, eA.useRef)();
            return t.current || (nr += 1, t.current = "".concat(e).concat(nr)), t.current
        };

    function no(e, t) {
        var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
            n = r.checkForDefaultPrevented,
            o = void 0 === n || n;
        return function(r) {
            if (null == e || e(r), !1 === o || !r.defaultPrevented) return null == t ? void 0 : t(r)
        }
    }

    function na(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function ni(e, t) {
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
                if ("string" == typeof e) return na(e, t);
                var r = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return na(e, t)
            }
        }(e, t) || function() {
            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }
    "u" > typeof window && window.document && window.document.createElement;
    var nl = eA[" useInsertionEffect ".trim().toString()] || e2;

    function nc(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function nu(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function ns(e, t) {
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
                if ("string" == typeof e) return nu(e, t);
                var r = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nu(e, t)
            }
        }(e, t) || function() {
            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }
    Symbol("RADIX:SYNC_STATE");
    var nf = function(e) {
        var t, r, n, o, a, i, l, c, u, s, f, p, d, h, y, m, b, v = e.present,
            g = e.children,
            O = (t = v, a = (o = ns(eA.useState(), 2))[0], i = o[1], l = eA.useRef(null), c = eA.useRef(t), u = eA.useRef("none"), f = (s = ns((r = t ? "mounted" : "unmounted", n = {
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
            }, eA.useReducer(function(e, t) {
                var r = n[e][t];
                return null != r ? r : e
            }, r)), 2))[0], p = s[1], eA.useEffect(function() {
                var e = np(l.current);
                u.current = "mounted" === f ? e : "none"
            }, [f]), e2(function() {
                var e = l.current,
                    r = c.current;
                if (r !== t) {
                    var n = u.current,
                        o = np(e);
                    t ? p("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? p("UNMOUNT") : r && n !== o ? p("ANIMATION_OUT") : p("UNMOUNT"), c.current = t
                }
            }, [t, p]), e2(function() {
                if (a) {
                    var e, t, r = null != (e = a.ownerDocument.defaultView) ? e : window,
                        n = function(e) {
                            var n = np(l.current).includes(CSS.escape(e.animationName));
                            if (e.target === a && n && (p("ANIMATION_END"), !c.current)) {
                                var o = a.style.animationFillMode;
                                a.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                    "forwards" === a.style.animationFillMode && (a.style.animationFillMode = o)
                                })
                            }
                        },
                        o = function(e) {
                            e.target === a && (u.current = np(l.current))
                        };
                    return a.addEventListener("animationstart", o), a.addEventListener("animationcancel", n), a.addEventListener("animationend", n),
                        function() {
                            r.clearTimeout(t), a.removeEventListener("animationstart", o), a.removeEventListener("animationcancel", n), a.removeEventListener("animationend", n)
                        }
                }
                p("ANIMATION_END")
            }, [a, p]), {
                isPresent: ["mounted", "unmountSuspended"].includes(f),
                ref: eA.useCallback(function(e) {
                    l.current = e ? getComputedStyle(e) : null, i(e)
                }, [])
            }),
            E = "function" == typeof g ? g({
                present: O.isPresent
            }) : eA.Children.only(g),
            w = eY(O.ref, (b = (m = null == (h = Object.getOwnPropertyDescriptor((d = E).props, "ref")) ? void 0 : h.get) && "isReactWarning" in m && m.isReactWarning) ? d.ref : (b = (m = null == (y = Object.getOwnPropertyDescriptor(d, "ref")) ? void 0 : y.get) && "isReactWarning" in m && m.isReactWarning) ? d.props.ref : d.props.ref || d.ref);
        return "function" == typeof g || O.isPresent ? eA.cloneElement(E, {
            ref: w
        }) : null
    };

    function np(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }

    function nd(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function nh(e) {
        if (Array.isArray(e)) return e
    }

    function ny() {
        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
    }

    function nm(e) {
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

    function nb(e, t) {
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

    function nv(e, t) {
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
        return nh(e) || function(e, t) {
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
        }(e, t) || nE(e, t) || ny()
    }

    function nO(e) {
        return nh(e) || function(e) {
            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
        }(e) || nE(e) || ny()
    }

    function nE(e, t) {
        if (e) {
            if ("string" == typeof e) return nd(e, t);
            var r = Object.prototype.toString.call(e).slice(8, -1);
            if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nd(e, t)
        }
    }
    nf.displayName = "Presence";
    var nw = "Checkbox",
        nS = ng(e0(nw), 2),
        nP = nS[0];
    nS[1];
    var nx = ng(nP(nw), 2),
        nj = nx[0],
        nA = nx[1];

    function nI(e) {
        var t, r, n, o, a, i, l, c, u, s, f, p, d, h, y, m, b, v, g, O, E = e.__scopeCheckbox,
            w = e.checked,
            S = e.children,
            P = e.defaultChecked,
            x = e.disabled,
            j = e.form,
            A = e.name,
            I = e.onCheckedChange,
            _ = e.required,
            T = e.value,
            N = e.internal_do_not_use_render,
            C = ng((s = (u = {
                prop: w,
                defaultProp: null != P && P,
                onChange: I,
                caller: nw
            }).prop, f = u.defaultProp, p = u.onChange, d = u.caller, y = (h = ni((r = (t = {
                defaultProp: f,
                onChange: void 0 === p ? function() {} : p
            }).defaultProp, n = t.onChange, a = (o = ni(eA.useState(r), 2))[0], i = o[1], l = eA.useRef(a), c = eA.useRef(n), nl(function() {
                c.current = n
            }, [n]), eA.useEffect(function() {
                if (l.current !== a) {
                    var e;
                    null == (e = c.current) || e.call(c, a), l.current = a
                }
            }, [a, l]), [a, i, c]), 3))[0], m = h[1], b = h[2], g = (v = void 0 !== s) ? s : y, O = eA.useRef(void 0 !== s), eA.useEffect(function() {
                var e = O.current;
                if (e !== v) {
                    var t = v ? "controlled" : "uncontrolled";
                    console.warn("".concat(d, " is changing from ").concat(e ? "controlled" : "uncontrolled", " to ").concat(t, ". Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component."))
                }
                O.current = v
            }, [v, d]), [g, eA.useCallback(function(e) {
                if (v) {
                    var t, r = "function" == typeof e ? e(s) : e;
                    r !== s && (null == (t = b.current) || t.call(b, r))
                } else m(e)
            }, [v, s, m, b])]), 2),
            R = C[0],
            U = C[1],
            M = ng(eA.useState(null), 2),
            k = M[0],
            D = M[1],
            B = ng(eA.useState(null), 2),
            L = B[0],
            H = B[1],
            F = eA.useRef(!1),
            G = !k || !!j || !!k.closest("form"),
            V = {
                checked: R,
                disabled: x,
                setChecked: U,
                control: k,
                setControl: D,
                name: A,
                form: j,
                value: void 0 === T ? "on" : T,
                hasConsumerStoppedPropagationRef: F,
                required: _,
                defaultChecked: !nk(P) && P,
                isFormControl: G,
                bubbleInput: L,
                setBubbleInput: H
            };
        return (0, eN.jsx)(nj, nb(nm({
            scope: E
        }, V), {
            children: "function" == typeof N ? N(V) : S
        }))
    }
    var n_ = "CheckboxTrigger",
        nT = eA.forwardRef(function(e, t) {
            var r = nO([e, t]),
                n = r[0],
                o = r.slice(1),
                a = n.__scopeCheckbox,
                i = n.onKeyDown,
                l = n.onClick,
                c = nv(n, ["__scopeCheckbox", "onKeyDown", "onClick"]),
                u = ng(o, 1)[0],
                s = nA(n_, a),
                f = s.control,
                p = s.value,
                d = s.disabled,
                h = s.checked,
                y = s.required,
                m = s.setControl,
                b = s.setChecked,
                v = s.hasConsumerStoppedPropagationRef,
                g = s.isFormControl,
                O = s.bubbleInput,
                E = eY(u, m),
                w = eA.useRef(h);
            return eA.useEffect(function() {
                var e = null == f ? void 0 : f.form;
                if (e) {
                    var t = function() {
                        return b(w.current)
                    };
                    return e.addEventListener("reset", t),
                        function() {
                            return e.removeEventListener("reset", t)
                        }
                }
            }, [f, b]), (0, eN.jsx)(rJ.button, nb(nm({
                type: "button",
                role: "checkbox",
                "aria-checked": nk(h) ? "mixed" : h,
                "aria-required": y,
                "data-state": nD(h),
                "data-disabled": d ? "" : void 0,
                disabled: d,
                value: p
            }, c), {
                ref: E,
                onKeyDown: no(i, function(e) {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: no(l, function(e) {
                    b(function(e) {
                        return !!nk(e) || !e
                    }), O && g && (v.current = e.isPropagationStopped(), v.current || e.stopPropagation())
                })
            }))
        });
    nT.displayName = n_;
    var nN = eA.forwardRef(function(e, t) {
        var r = e.__scopeCheckbox,
            n = e.name,
            o = e.checked,
            a = e.defaultChecked,
            i = e.required,
            l = e.disabled,
            c = e.value,
            u = e.onCheckedChange,
            s = e.form,
            f = nv(e, ["__scopeCheckbox", "name", "checked", "defaultChecked", "required", "disabled", "value", "onCheckedChange", "form"]);
        return (0, eN.jsx)(nI, {
            __scopeCheckbox: r,
            checked: o,
            defaultChecked: a,
            disabled: l,
            required: i,
            onCheckedChange: u,
            name: n,
            form: s,
            value: c,
            internal_do_not_use_render: function(e) {
                var n = e.isFormControl;
                return (0, eN.jsxs)(eN.Fragment, {
                    children: [(0, eN.jsx)(nT, nb(nm({}, f), {
                        ref: t,
                        __scopeCheckbox: r
                    })), n && (0, eN.jsx)(nM, {
                        __scopeCheckbox: r
                    })]
                })
            }
        })
    });
    nN.displayName = nw;
    var nC = "CheckboxIndicator",
        nR = eA.forwardRef(function(e, t) {
            var r = e.__scopeCheckbox,
                n = e.forceMount,
                o = nv(e, ["__scopeCheckbox", "forceMount"]),
                a = nA(nC, r);
            return (0, eN.jsx)(nf, {
                present: n || nk(a.checked) || !0 === a.checked,
                children: (0, eN.jsx)(rJ.span, nb(nm({
                    "data-state": nD(a.checked),
                    "data-disabled": a.disabled ? "" : void 0
                }, o), {
                    ref: t,
                    style: nm({
                        pointerEvents: "none"
                    }, e.style)
                }))
            })
        });
    nR.displayName = nC;
    var nU = "CheckboxBubbleInput",
        nM = eA.forwardRef(function(e, t) {
            var r, n, o, a, i, l = nO([e, t]),
                c = l[0],
                u = l.slice(1),
                s = c.__scopeCheckbox,
                f = nv(c, ["__scopeCheckbox"]),
                p = ng(u, 1)[0],
                d = nA(nU, s),
                h = d.control,
                y = d.hasConsumerStoppedPropagationRef,
                m = d.checked,
                b = d.defaultChecked,
                v = d.required,
                g = d.disabled,
                O = d.name,
                E = d.value,
                w = d.form,
                S = d.bubbleInput,
                P = eY(p, d.setBubbleInput),
                x = (r = eA.useRef({
                    value: m,
                    previous: m
                }), eA.useMemo(function() {
                    return r.current.value !== m && (r.current.previous = r.current.value, r.current.value = m), r.current.previous
                }, [m])),
                j = (a = (o = function(e) {
                    if (Array.isArray(e)) return e
                }(n = eA.useState(void 0)) || function(e) {
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
                }(n) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return nc(e, 2);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nc(e, 2)
                    }
                }(n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }())[0], i = o[1], e2(function() {
                    if (h) {
                        i({
                            width: h.offsetWidth,
                            height: h.offsetHeight
                        });
                        var e = new ResizeObserver(function(e) {
                            if (Array.isArray(e) && e.length) {
                                var t, r, n = e[0];
                                if ("borderBoxSize" in n) {
                                    var o = n.borderBoxSize,
                                        a = Array.isArray(o) ? o[0] : o;
                                    t = a.inlineSize, r = a.blockSize
                                } else t = h.offsetWidth, r = h.offsetHeight;
                                i({
                                    width: t,
                                    height: r
                                })
                            }
                        });
                        return e.observe(h, {
                                box: "border-box"
                            }),
                            function() {
                                return e.unobserve(h)
                            }
                    }
                    i(void 0)
                }, [h]), a);
            eA.useEffect(function() {
                if (S) {
                    var e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                        t = !y.current;
                    if (x !== m && e) {
                        var r = new Event("click", {
                            bubbles: t
                        });
                        S.indeterminate = nk(m), e.call(S, !nk(m) && m), S.dispatchEvent(r)
                    }
                }
            }, [S, x, m, y]);
            var A = eA.useRef(!nk(m) && m);
            return (0, eN.jsx)(rJ.input, nb(nm({
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != b ? b : A.current,
                required: v,
                disabled: g,
                name: O,
                value: E,
                form: w
            }, f), {
                tabIndex: -1,
                ref: P,
                style: nb(nm({}, f.style, j), {
                    position: "absolute",
                    pointerEvents: "none",
                    opacity: 0,
                    margin: 0,
                    transform: "translateX(-100%)"
                })
            }))
        });

    function nk(e) {
        return "indeterminate" === e
    }

    function nD(e) {
        return nk(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    nM.displayName = nU;
    var nB = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-600"
        },
        nL = {
            XSmall: "",
            Small: "",
            Medium: "",
            Large: "padding-y-xxsmall"
        },
        nH = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        nF = {
            XSmall: "",
            Small: "padding-top-xxsmall",
            Medium: "padding-top-xxsmall",
            Large: "padding-top-xxsmall"
        },
        nG = function(e) {
            var t = e.label,
                r = e.className,
                n = e.isChecked,
                o = e.isDisabled,
                a = e.size,
                i = e.hint,
                l = e.placement,
                c = e.onCheckedChange,
                u = e.id,
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
                }(e, ["label", "className", "isChecked", "isDisabled", "size", "hint", "placement", "onCheckedChange", "id"]),
                f = nn(),
                p = u || f,
                d = t && eI().createElement("label", {
                    htmlFor: p,
                    className: eC("flex flex-col grow-1 gap-xsmall", !o && "cursor-pointer")
                }, eI().createElement("span", {
                    className: eC(nH[a], nF[a], "content-emphasis")
                }, t), i && eI().createElement("span", {
                    className: "text-body-medium content-default"
                }, i));
            return eI().createElement("div", {
                className: eC("foundation-web-checkbox flex gap-medium", o && "opacity-[0.5]", !o && "cursor-pointer", r)
            }, "End" === l && d, eI().createElement("div", {
                className: eC(nL[a])
            }, eI().createElement(nN, function(e) {
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
                className: eC(nB[a], eR, !o && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
                id: p,
                checked: n,
                disabled: o,
                onCheckedChange: c,
                "aria-label": t
            }, s), eI().createElement(eU, null), eI().createElement(nR, {
                "data-slot": "checkbox-indicator",
                className: eC(nB[a], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
            }))), "Start" === l && d)
        },
        nV = function(e) {
            var t = e.width,
                r = e.height;
            return eI().createElement("svg", {
                className: "foundation-web-loading-spinner",
                width: t,
                height: r,
                viewBox: "0 0 20 20",
                fill: "none",
                xmlns: "http://www.w3.org/2000/svg"
            }, eI().createElement("path", {
                fillRule: "evenodd",
                clipRule: "evenodd",
                fill: "currentColor",
                d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
            }))
        };

    function nW(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function nX(e) {
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

    function nK(e, t) {
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

    function nz(e, t) {
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

    function nY(e) {
        return function(e) {
            if (Array.isArray(e)) return nW(e)
        }(e) || function(e) {
            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
        }(e) || function(e) {
            if (e) {
                if ("string" == typeof e) return nW(e, void 0);
                var t = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nW(e, void 0)
            }
        }(e) || function() {
            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }

    function nZ(e) {
        return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
    }
    var nq = Symbol.for("react.lazy"),
        n$ = eA[" use ".trim().toString()];

    function nJ(e) {
        var t;
        return null != e && (void 0 === e ? "undefined" : nZ(e)) === "object" && "$$typeof" in e && e.$$typeof === nq && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : nZ(t)) === "object" && null !== t && "then" in t
    }
    var nQ = ((e = eA.forwardRef(function(e, t) {
            var r = e.children,
                n = nz(e, ["children"]);
            if (nJ(r) && "function" == typeof n$ && (r = n$(r._payload)), eA.isValidElement(r)) {
                var o, a, i, l, c, u = (c = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                    s = function(e, t) {
                        var r = nX({}, t);
                        for (var n in t) ! function(n) {
                            var o = e[n],
                                a = t[n];
                            /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                var n = a.apply(void 0, nY(t));
                                return o.apply(void 0, nY(t)), n
                            } : o && (r[n] = o) : "style" === n ? r[n] = nX({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                        }(n);
                        return nX({}, e, r)
                    }(n, r.props);
                return r.type !== eA.Fragment && (s.ref = t ? ez(t, u) : u), eA.cloneElement(r, s)
            }
            return eA.Children.count(r) > 1 ? eA.Children.only(null) : null
        })).displayName = "".concat("Slot", ".SlotClone"), s = e, (f = eA.forwardRef(function(e, t) {
            var r = e.children,
                n = nz(e, ["children"]);
            nJ(r) && "function" == typeof n$ && (r = n$(r._payload));
            var o = eA.Children.toArray(r),
                a = o.find(n1);
            if (a) {
                var i = a.props.children,
                    l = o.map(function(e) {
                        return e !== a ? e : eA.Children.count(i) > 1 ? eA.Children.only(null) : eA.isValidElement(i) ? i.props.children : null
                    });
                return (0, eN.jsx)(s, nK(nX({}, n), {
                    ref: t,
                    children: eA.isValidElement(i) ? eA.cloneElement(i, void 0, l) : null
                }))
            }
            return (0, eN.jsx)(s, nK(nX({}, n), {
                ref: t,
                children: r
            }))
        })).displayName = "".concat("Slot", ".Slot"), f),
        n0 = Symbol("radix.slottable");

    function n1(e) {
        return eA.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === n0
    }

    function n2(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function n3(e) {
        if (Array.isArray(e)) return e
    }

    function n6() {
        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
    }

    function n5(e) {
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

    function n4(e, t) {
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

    function n8(e, t) {
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

    function n7(e, t) {
        if (e) {
            if ("string" == typeof e) return n2(e, t);
            var r = Object.prototype.toString.call(e).slice(8, -1);
            if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return n2(e, t)
        }
    }
    var n9 = {
            Large: 24,
            Medium: 20,
            Small: 16,
            XSmall: 12
        },
        oe = {
            Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
            Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
            Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
            XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
        },
        ot = {
            Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
            Standard: ["bg-action-standard", "content-action-standard"],
            SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
            Utility: ["bg-action-subtle", "content-action-standard"],
            Link: ["bg-action-link", "content-system-emphasis"],
            Alert: ["bg-action-alert", "content-action-alert"],
            ActionUtility: ["bg-action-subtle", "content-action-standard"]
        },
        or = {
            Emphasis: ["bg-action-standard", "content-action-standard"],
            Standard: ["bg-action-standard", "content-action-standard"],
            SoftEmphasis: ["bg-action-standard", "content-action-standard"],
            Utility: ["bg-action-subtle", "content-action-standard"],
            Link: ["bg-action-link", "content-system-emphasis"],
            Alert: ["bg-action-standard", "content-action-standard"],
            ActionUtility: ["bg-action-subtle", "content-action-standard"]
        },
        on = (0, eA.forwardRef)(function(e, t) {
            var r, n = n3(r = [e, t]) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(r) || n7(r) || n6(),
                o = n[0],
                a = n.slice(1),
                i = o.children,
                l = o.className,
                c = o.style,
                u = o.isDisabled,
                s = void 0 !== u && u,
                f = o.isLoading,
                p = void 0 !== f && f,
                d = o.icon,
                h = o.size,
                y = void 0 === h ? "Large" : h,
                m = o.variant,
                b = void 0 === m ? "Emphasis" : m,
                v = o.asChild,
                g = n8(o, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                O = (n3(a) || function(e) {
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
                }(a) || n7(a, 1) || n6())[0],
                E = eC("foundation-web-button", s ? "opacity-[0.5]" : [eR, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", oe[y], s ? or[b] : ot[b], l),
                w = n5({
                    textDecoration: "none"
                }, c),
                S = function(e) {
                    return eI().createElement(eI().Fragment, null, eI().createElement(eU, null), p && eI().createElement("div", {
                        "aria-hidden": "true",
                        className: "absolute flex"
                    }, eI().createElement(nV, {
                        width: n9[y],
                        height: n9[y]
                    })), eI().createElement("span", {
                        className: eC("flex items-center min-width-0", "Large" === y || "Medium" === y ? "gap-small" : "gap-xsmall", p && "invisible")
                    }, d && eI().createElement(eH, {
                        name: d,
                        size: y
                    }), eI().createElement("span", {
                        className: "padding-y-xsmall text-truncate-end text-no-wrap"
                    }, e)))
                };
            if (v) {
                g.as;
                var P = n8(g, ["as"]),
                    x = eI().Children.only(i);
                return eI().createElement(nQ, n4(n5({
                    ref: O
                }, P), {
                    className: E,
                    style: w,
                    "aria-disabled": s || void 0
                }), eI().cloneElement(x, {}, S(x.props.children)))
            }
            if ("a" === g.as) {
                g.as;
                var j = g.href,
                    A = n8(g, ["as", "href"]);
                return eI().createElement("a", n4(n5({
                    ref: O
                }, A), {
                    "aria-disabled": s,
                    href: s ? void 0 : j,
                    className: E,
                    style: w
                }), S(i))
            }
            g.as;
            var I = n8(g, ["as"]);
            return eI().createElement("button", n4(n5({
                ref: O,
                type: "button"
            }, I), {
                disabled: s,
                className: E,
                style: w
            }), S(i))
        }),
        oo = "Label.Free",
        oa = "Label.TimedOptionDaysTimerStartsWhenYouBuy",
        oi = function(e) {
            var t = e.translate,
                r = e.price,
                n = e.color,
                o = void 0 === n ? "" : n,
                a = e.useFreeText;
            return 0 === r && (void 0 === a || a) ? (0, eN.jsx)("span", {
                className: "text-robux text-free",
                children: t(oo)
            }) : (0, eN.jsxs)(eI().Fragment, {
                children: [(0, eN.jsx)("span", {
                    className: "icon-robux".concat(o ? "-".concat(o) : "", "-16x16")
                }), (0, eN.jsx)("span", {
                    className: "text-robux ml-1 text-body-medium",
                    children: (0, ef.formatNumber)(r)
                })]
            })
        },
        ol = function(e) {
            var t = e.translate,
                r = e.titleText,
                n = e.currentRobuxBalance;
            return (0, eN.jsxs)("div", {
                id: "rbx-unified-purchase-heading",
                className: "flex flex-row items-center justify-between",
                style: {
                    paddingRight: 42
                },
                children: [(0, eN.jsx)("span", {
                    className: "text-heading-medium",
                    children: r
                }), "number" == typeof n && (0, eN.jsx)("div", {
                    className: "flex flex-row items-center",
                    children: (0, eN.jsx)(oi, {
                        translate: t,
                        price: n,
                        color: "",
                        useFreeText: !1
                    })
                })]
            })
        },
        oc = function(e) {
            var t = e.name;
            return (0, eN.jsx)("span", {
                className: "font-bold",
                children: t
            })
        };

    function ou(e, t) {
        var r = t && t.cache ? t.cache : oh,
            n = t && t.serializer ? t.serializer : op;
        return (t && t.strategy ? t.strategy : function(e, t) {
            var r, n, o = 1 === e.length ? os : of;
            return r = t.cache.create(), n = t.serializer, o.bind(this, e, r, n)
        })(e, {
            cache: r,
            serializer: n
        })
    }

    function os(e, t, r, n) {
        var o = null == n || "number" == typeof n || "boolean" == typeof n ? n : r(n),
            a = t.get(o);
        return void 0 === a && (a = e.call(this, n), t.set(o, a)), a
    }

    function of(e, t, r) {
        var n = Array.prototype.slice.call(arguments, 3),
            o = r(n),
            a = t.get(o);
        return void 0 === a && (a = e.apply(this, n), t.set(o, a)), a
    }
    var op = function() {
            return JSON.stringify(arguments)
        },
        od = function() {
            var e;

            function t() {
                if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                this.cache = Object.create(null)
            }
            return e = [{
                    key: "get",
                    value: function(e) {
                        return this.cache[e]
                    }
                }, {
                    key: "set",
                    value: function(e, t) {
                        this.cache[e] = t
                    }
                }],
                function(e, t) {
                    for (var r = 0; r < t.length; r++) {
                        var n = t[r];
                        n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                    }
                }(t.prototype, e), t
        }(),
        oh = {
            create: function() {
                return new od
            }
        },
        oy = {
            variadic: function(e, t) {
                var r, n;
                return r = t.cache.create(), n = t.serializer, of.bind(this, e, r, n)
            },
            monadic: function(e, t) {
                var r, n;
                return r = t.cache.create(), n = t.serializer, os.bind(this, e, r, n)
            }
        };

    function om(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function ob(e, t, r) {
        return (ob = oE() ? Reflect.construct : function(e, t, r) {
            var n = [null];
            n.push.apply(n, t);
            var o = new(Function.bind.apply(e, n));
            return r && og(o, r.prototype), o
        }).apply(null, arguments)
    }

    function ov(e) {
        return (ov = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
            return e.__proto__ || Object.getPrototypeOf(e)
        })(e)
    }

    function og(e, t) {
        return (og = Object.setPrototypeOf || function(e, t) {
            return e.__proto__ = t, e
        })(e, t)
    }

    function oO(e) {
        var t = "function" == typeof Map ? new Map : void 0;
        return (oO = function(e) {
            if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
            if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
            if (void 0 !== t) {
                if (t.has(e)) return t.get(e);
                t.set(e, r)
            }

            function r() {
                return ob(e, arguments, ov(this).constructor)
            }
            return r.prototype = Object.create(e.prototype, {
                constructor: {
                    value: r,
                    enumerable: !1,
                    writable: !0,
                    configurable: !0
                }
            }), og(r, e)
        })(e)
    }

    function oE() {
        try {
            var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
        } catch (e) {}
        return (oE = function() {
            return !!e
        })()
    }
    var ow = function(e) {
            if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

            function t(e, r) {
                if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                var n, o, a, i = e;
                return r && (i += ": " + r), n = t, o = [i], n = ov(n), (a = function(e, t) {
                    var r;
                    if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                    if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                    return e
                }(this, oE() ? Reflect.construct(n, o || [], ov(this).constructor) : n.apply(this, o))).code = e, r && (a.originalMessage = r), a
            }
            return t.prototype = Object.create(e && e.prototype, {
                constructor: {
                    value: t,
                    writable: !0,
                    configurable: !0
                }
            }), e && og(t, e), t
        }(oO(Error)),
        oS = ((p = oS || {}).MISSING_MESSAGE = "MISSING_MESSAGE", p.MISSING_FORMAT = "MISSING_FORMAT", p.ENVIRONMENT_FALLBACK = "ENVIRONMENT_FALLBACK", p.INSUFFICIENT_PATH = "INSUFFICIENT_PATH", p.INVALID_MESSAGE = "INVALID_MESSAGE", p.INVALID_KEY = "INVALID_KEY", p.FORMATTING_ERROR = "FORMATTING_ERROR", p);

    function oP(e, t) {
        return ou(e, {
            cache: {
                create: function() {
                    return {
                        get: function(e) {
                            return t[e]
                        },
                        set: function(e, r) {
                            t[e] = r
                        }
                    }
                }
            },
            strategy: oy.variadic
        })
    }

    function ox(e, t) {
        return oP(function() {
            for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
            return ob(e, function(e) {
                if (Array.isArray(e)) return om(e)
            }(r) || function(e) {
                if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
            }(r) || function(e) {
                if (e) {
                    if ("string" == typeof e) return om(e, void 0);
                    var t = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return om(e, void 0)
                }
            }(r) || function() {
                throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }())
        }, t)
    }

    function oj(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function oA(e) {
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

    function oI(e, t) {
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
    var o_ = /(?:[Eec]{1,6}|G{1,5}|[Qq]{1,5}|(?:[yYur]+|U{1,5})|[ML]{1,5}|d{1,2}|D{1,3}|F{1}|[abB]{1,5}|[hkHK]{1,2}|w{1,2}|W{1}|m{1,2}|s{1,2}|[zZOvVxX]{1,4})(?=([^']*'[^']*')*[^']*$)/g,
        oT = /[\t-\r \x85\u200E\u200F\u2028\u2029]/i,
        oN = /^\.(?:(0+)(\*)?|(#+)|(0+)(#+))$/g,
        oC = /^(@+)?(\+|#+)?[rs]?$/g,
        oR = /(\*)(0+)|(#+)(0+)|(0+)/g,
        oU = /^(0+)$/;

    function oM(e) {
        var t = {};
        return "r" === e[e.length - 1] ? t.roundingPriority = "morePrecision" : "s" === e[e.length - 1] && (t.roundingPriority = "lessPrecision"), e.replace(oC, function(e, r, n) {
            return "string" != typeof n ? (t.minimumSignificantDigits = r.length, t.maximumSignificantDigits = r.length) : "+" === n ? t.minimumSignificantDigits = r.length : "#" === r[0] ? t.maximumSignificantDigits = r.length : (t.minimumSignificantDigits = r.length, t.maximumSignificantDigits = r.length + ("string" == typeof n ? n.length : 0)), ""
        }), t
    }

    function ok(e) {
        switch (e) {
            case "sign-auto":
                return {
                    signDisplay: "auto"
                };
            case "sign-accounting":
            case "()":
                return {
                    currencySign: "accounting"
                };
            case "sign-always":
            case "+!":
                return {
                    signDisplay: "always"
                };
            case "sign-accounting-always":
            case "()!":
                return {
                    signDisplay: "always", currencySign: "accounting"
                };
            case "sign-except-zero":
            case "+?":
                return {
                    signDisplay: "exceptZero"
                };
            case "sign-accounting-except-zero":
            case "()?":
                return {
                    signDisplay: "exceptZero", currencySign: "accounting"
                };
            case "sign-never":
            case "+_":
                return {
                    signDisplay: "never"
                }
        }
    }

    function oD(e) {
        var t = ok(e);
        return t || {}
    }

    function oB(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function oL(e) {
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

    function oH(e) {
        return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
    }

    function oF(e, t) {
        if (e) {
            if ("string" == typeof e) return oB(e, t);
            var r = Object.prototype.toString.call(e).slice(8, -1);
            if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oB(e, t)
        }
    }
    var oG = ((d = {})[d.EXPECT_ARGUMENT_CLOSING_BRACE = 1] = "EXPECT_ARGUMENT_CLOSING_BRACE", d[d.EMPTY_ARGUMENT = 2] = "EMPTY_ARGUMENT", d[d.MALFORMED_ARGUMENT = 3] = "MALFORMED_ARGUMENT", d[d.EXPECT_ARGUMENT_TYPE = 4] = "EXPECT_ARGUMENT_TYPE", d[d.INVALID_ARGUMENT_TYPE = 5] = "INVALID_ARGUMENT_TYPE", d[d.EXPECT_ARGUMENT_STYLE = 6] = "EXPECT_ARGUMENT_STYLE", d[d.INVALID_NUMBER_SKELETON = 7] = "INVALID_NUMBER_SKELETON", d[d.INVALID_DATE_TIME_SKELETON = 8] = "INVALID_DATE_TIME_SKELETON", d[d.EXPECT_NUMBER_SKELETON = 9] = "EXPECT_NUMBER_SKELETON", d[d.EXPECT_DATE_TIME_SKELETON = 10] = "EXPECT_DATE_TIME_SKELETON", d[d.UNCLOSED_QUOTE_IN_ARGUMENT_STYLE = 11] = "UNCLOSED_QUOTE_IN_ARGUMENT_STYLE", d[d.EXPECT_SELECT_ARGUMENT_OPTIONS = 12] = "EXPECT_SELECT_ARGUMENT_OPTIONS", d[d.EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE = 13] = "EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE", d[d.INVALID_PLURAL_ARGUMENT_OFFSET_VALUE = 14] = "INVALID_PLURAL_ARGUMENT_OFFSET_VALUE", d[d.EXPECT_SELECT_ARGUMENT_SELECTOR = 15] = "EXPECT_SELECT_ARGUMENT_SELECTOR", d[d.EXPECT_PLURAL_ARGUMENT_SELECTOR = 16] = "EXPECT_PLURAL_ARGUMENT_SELECTOR", d[d.EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT = 17] = "EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT", d[d.EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT = 18] = "EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT", d[d.INVALID_PLURAL_ARGUMENT_SELECTOR = 19] = "INVALID_PLURAL_ARGUMENT_SELECTOR", d[d.DUPLICATE_PLURAL_ARGUMENT_SELECTOR = 20] = "DUPLICATE_PLURAL_ARGUMENT_SELECTOR", d[d.DUPLICATE_SELECT_ARGUMENT_SELECTOR = 21] = "DUPLICATE_SELECT_ARGUMENT_SELECTOR", d[d.MISSING_OTHER_CLAUSE = 22] = "MISSING_OTHER_CLAUSE", d[d.INVALID_TAG = 23] = "INVALID_TAG", d[d.INVALID_TAG_NAME = 25] = "INVALID_TAG_NAME", d[d.UNMATCHED_CLOSING_TAG = 26] = "UNMATCHED_CLOSING_TAG", d[d.UNCLOSED_TAG = 27] = "UNCLOSED_TAG", d);

    function oV(e) {
        return !!(e && (void 0 === e ? "undefined" : oH(e)) === "object" && 0 === e.type)
    }

    function oW(e) {
        return !!(e && (void 0 === e ? "undefined" : oH(e)) === "object" && 1 === e.type)
    }
    var oX = /[ \xA0\u1680\u2000-\u200A\u202F\u205F\u3000]/,
        oK = {
            "001": ["H", "h"],
            419: ["h", "H", "hB", "hb"],
            AC: ["H", "h", "hb", "hB"],
            AD: ["H", "hB"],
            AE: ["h", "hB", "hb", "H"],
            AF: ["H", "hb", "hB", "h"],
            AG: ["h", "hb", "H", "hB"],
            AI: ["H", "h", "hb", "hB"],
            AL: ["h", "H", "hB"],
            AM: ["H", "hB"],
            AO: ["H", "hB"],
            AR: ["h", "H", "hB", "hb"],
            AS: ["h", "H"],
            AT: ["H", "hB"],
            AU: ["h", "hb", "H", "hB"],
            AW: ["H", "hB"],
            AX: ["H"],
            AZ: ["H", "hB", "h"],
            BA: ["H", "hB", "h"],
            BB: ["h", "hb", "H", "hB"],
            BD: ["h", "hB", "H"],
            BE: ["H", "hB"],
            BF: ["H", "hB"],
            BG: ["H", "hB", "h"],
            BH: ["h", "hB", "hb", "H"],
            BI: ["H", "h"],
            BJ: ["H", "hB"],
            BL: ["H", "hB"],
            BM: ["h", "hb", "H", "hB"],
            BN: ["hb", "hB", "h", "H"],
            BO: ["h", "H", "hB", "hb"],
            BQ: ["H"],
            BR: ["H", "hB"],
            BS: ["h", "hb", "H", "hB"],
            BT: ["h", "H"],
            BW: ["H", "h", "hb", "hB"],
            BY: ["H", "h"],
            BZ: ["H", "h", "hb", "hB"],
            CA: ["h", "hb", "H", "hB"],
            CC: ["H", "h", "hb", "hB"],
            CD: ["hB", "H"],
            CF: ["H", "h", "hB"],
            CG: ["H", "hB"],
            CH: ["H", "hB", "h"],
            CI: ["H", "hB"],
            CK: ["H", "h", "hb", "hB"],
            CL: ["h", "H", "hB", "hb"],
            CM: ["H", "h", "hB"],
            CN: ["H", "hB", "hb", "h"],
            CO: ["h", "H", "hB", "hb"],
            CP: ["H"],
            CR: ["h", "H", "hB", "hb"],
            CU: ["h", "H", "hB", "hb"],
            CV: ["H", "hB"],
            CW: ["H", "hB"],
            CX: ["H", "h", "hb", "hB"],
            CY: ["h", "H", "hb", "hB"],
            CZ: ["H"],
            DE: ["H", "hB"],
            DG: ["H", "h", "hb", "hB"],
            DJ: ["h", "H"],
            DK: ["H"],
            DM: ["h", "hb", "H", "hB"],
            DO: ["h", "H", "hB", "hb"],
            DZ: ["h", "hB", "hb", "H"],
            EA: ["H", "h", "hB", "hb"],
            EC: ["h", "H", "hB", "hb"],
            EE: ["H", "hB"],
            EG: ["h", "hB", "hb", "H"],
            EH: ["h", "hB", "hb", "H"],
            ER: ["h", "H"],
            ES: ["H", "hB", "h", "hb"],
            ET: ["hB", "hb", "h", "H"],
            FI: ["H"],
            FJ: ["h", "hb", "H", "hB"],
            FK: ["H", "h", "hb", "hB"],
            FM: ["h", "hb", "H", "hB"],
            FO: ["H", "h"],
            FR: ["H", "hB"],
            GA: ["H", "hB"],
            GB: ["H", "h", "hb", "hB"],
            GD: ["h", "hb", "H", "hB"],
            GE: ["H", "hB", "h"],
            GF: ["H", "hB"],
            GG: ["H", "h", "hb", "hB"],
            GH: ["h", "H"],
            GI: ["H", "h", "hb", "hB"],
            GL: ["H", "h"],
            GM: ["h", "hb", "H", "hB"],
            GN: ["H", "hB"],
            GP: ["H", "hB"],
            GQ: ["H", "hB", "h", "hb"],
            GR: ["h", "H", "hb", "hB"],
            GS: ["H", "h", "hb", "hB"],
            GT: ["h", "H", "hB", "hb"],
            GU: ["h", "hb", "H", "hB"],
            GW: ["H", "hB"],
            GY: ["h", "hb", "H", "hB"],
            HK: ["h", "hB", "hb", "H"],
            HN: ["h", "H", "hB", "hb"],
            HR: ["H", "hB"],
            HU: ["H", "h"],
            IC: ["H", "h", "hB", "hb"],
            ID: ["H"],
            IE: ["H", "h", "hb", "hB"],
            IL: ["H", "hB"],
            IM: ["H", "h", "hb", "hB"],
            IN: ["h", "H"],
            IO: ["H", "h", "hb", "hB"],
            IQ: ["h", "hB", "hb", "H"],
            IR: ["hB", "H"],
            IS: ["H"],
            IT: ["H", "hB"],
            JE: ["H", "h", "hb", "hB"],
            JM: ["h", "hb", "H", "hB"],
            JO: ["h", "hB", "hb", "H"],
            JP: ["H", "K", "h"],
            KE: ["hB", "hb", "H", "h"],
            KG: ["H", "h", "hB", "hb"],
            KH: ["hB", "h", "H", "hb"],
            KI: ["h", "hb", "H", "hB"],
            KM: ["H", "h", "hB", "hb"],
            KN: ["h", "hb", "H", "hB"],
            KP: ["h", "H", "hB", "hb"],
            KR: ["h", "H", "hB", "hb"],
            KW: ["h", "hB", "hb", "H"],
            KY: ["h", "hb", "H", "hB"],
            KZ: ["H", "hB"],
            LA: ["H", "hb", "hB", "h"],
            LB: ["h", "hB", "hb", "H"],
            LC: ["h", "hb", "H", "hB"],
            LI: ["H", "hB", "h"],
            LK: ["H", "h", "hB", "hb"],
            LR: ["h", "hb", "H", "hB"],
            LS: ["h", "H"],
            LT: ["H", "h", "hb", "hB"],
            LU: ["H", "h", "hB"],
            LV: ["H", "hB", "hb", "h"],
            LY: ["h", "hB", "hb", "H"],
            MA: ["H", "h", "hB", "hb"],
            MC: ["H", "hB"],
            MD: ["H", "hB"],
            ME: ["H", "hB", "h"],
            MF: ["H", "hB"],
            MG: ["H", "h"],
            MH: ["h", "hb", "H", "hB"],
            MK: ["H", "h", "hb", "hB"],
            ML: ["H"],
            MM: ["hB", "hb", "H", "h"],
            MN: ["H", "h", "hb", "hB"],
            MO: ["h", "hB", "hb", "H"],
            MP: ["h", "hb", "H", "hB"],
            MQ: ["H", "hB"],
            MR: ["h", "hB", "hb", "H"],
            MS: ["H", "h", "hb", "hB"],
            MT: ["H", "h"],
            MU: ["H", "h"],
            MV: ["H", "h"],
            MW: ["h", "hb", "H", "hB"],
            MX: ["h", "H", "hB", "hb"],
            MY: ["hb", "hB", "h", "H"],
            MZ: ["H", "hB"],
            NA: ["h", "H", "hB", "hb"],
            NC: ["H", "hB"],
            NE: ["H"],
            NF: ["H", "h", "hb", "hB"],
            NG: ["H", "h", "hb", "hB"],
            NI: ["h", "H", "hB", "hb"],
            NL: ["H", "hB"],
            NO: ["H", "h"],
            NP: ["H", "h", "hB"],
            NR: ["H", "h", "hb", "hB"],
            NU: ["H", "h", "hb", "hB"],
            NZ: ["h", "hb", "H", "hB"],
            OM: ["h", "hB", "hb", "H"],
            PA: ["h", "H", "hB", "hb"],
            PE: ["h", "H", "hB", "hb"],
            PF: ["H", "h", "hB"],
            PG: ["h", "H"],
            PH: ["h", "hB", "hb", "H"],
            PK: ["h", "hB", "H"],
            PL: ["H", "h"],
            PM: ["H", "hB"],
            PN: ["H", "h", "hb", "hB"],
            PR: ["h", "H", "hB", "hb"],
            PS: ["h", "hB", "hb", "H"],
            PT: ["H", "hB"],
            PW: ["h", "H"],
            PY: ["h", "H", "hB", "hb"],
            QA: ["h", "hB", "hb", "H"],
            RE: ["H", "hB"],
            RO: ["H", "hB"],
            RS: ["H", "hB", "h"],
            RU: ["H"],
            RW: ["H", "h"],
            SA: ["h", "hB", "hb", "H"],
            SB: ["h", "hb", "H", "hB"],
            SC: ["H", "h", "hB"],
            SD: ["h", "hB", "hb", "H"],
            SE: ["H"],
            SG: ["h", "hb", "H", "hB"],
            SH: ["H", "h", "hb", "hB"],
            SI: ["H", "hB"],
            SJ: ["H"],
            SK: ["H"],
            SL: ["h", "hb", "H", "hB"],
            SM: ["H", "h", "hB"],
            SN: ["H", "h", "hB"],
            SO: ["h", "H"],
            SR: ["H", "hB"],
            SS: ["h", "hb", "H", "hB"],
            ST: ["H", "hB"],
            SV: ["h", "H", "hB", "hb"],
            SX: ["H", "h", "hb", "hB"],
            SY: ["h", "hB", "hb", "H"],
            SZ: ["h", "hb", "H", "hB"],
            TA: ["H", "h", "hb", "hB"],
            TC: ["h", "hb", "H", "hB"],
            TD: ["h", "H", "hB"],
            TF: ["H", "h", "hB"],
            TG: ["H", "hB"],
            TH: ["H", "h"],
            TJ: ["H", "h"],
            TL: ["H", "hB", "hb", "h"],
            TM: ["H", "h"],
            TN: ["h", "hB", "hb", "H"],
            TO: ["h", "H"],
            TR: ["H", "hB"],
            TT: ["h", "hb", "H", "hB"],
            TW: ["hB", "hb", "h", "H"],
            TZ: ["hB", "hb", "H", "h"],
            UA: ["H", "hB", "h"],
            UG: ["hB", "hb", "H", "h"],
            UM: ["h", "hb", "H", "hB"],
            US: ["h", "hb", "H", "hB"],
            UY: ["h", "H", "hB", "hb"],
            UZ: ["H", "hB", "h"],
            VA: ["H", "h", "hB"],
            VC: ["h", "hb", "H", "hB"],
            VE: ["h", "H", "hB", "hb"],
            VG: ["h", "hb", "H", "hB"],
            VI: ["h", "hb", "H", "hB"],
            VN: ["H", "h"],
            VU: ["h", "H"],
            WF: ["H", "hB"],
            WS: ["h", "H"],
            XK: ["H", "hB", "h"],
            YE: ["h", "hB", "hb", "H"],
            YT: ["H", "hB"],
            ZA: ["H", "h", "hb", "hB"],
            ZM: ["h", "hb", "H", "hB"],
            ZW: ["H", "h"],
            "af-ZA": ["H", "h", "hB", "hb"],
            "ar-001": ["h", "hB", "hb", "H"],
            "ca-ES": ["H", "h", "hB"],
            "en-001": ["h", "hb", "H", "hB"],
            "en-HK": ["h", "hb", "H", "hB"],
            "en-IL": ["H", "h", "hb", "hB"],
            "en-MY": ["h", "hb", "H", "hB"],
            "es-BR": ["H", "h", "hB", "hb"],
            "es-ES": ["H", "h", "hB", "hb"],
            "es-GQ": ["H", "h", "hB", "hb"],
            "fr-CA": ["H", "h", "hB"],
            "gl-ES": ["H", "h", "hB"],
            "gu-IN": ["hB", "hb", "h", "H"],
            "hi-IN": ["hB", "h", "H"],
            "it-CH": ["H", "h", "hB"],
            "it-IT": ["H", "h", "hB"],
            "kn-IN": ["hB", "h", "H"],
            "ku-SY": ["H", "hB"],
            "ml-IN": ["hB", "h", "H"],
            "mr-IN": ["hB", "hb", "h", "H"],
            "pa-IN": ["hB", "hb", "h", "H"],
            "ta-IN": ["hB", "h", "hb", "H"],
            "te-IN": ["hB", "h", "H"],
            "zu-ZA": ["H", "hB", "hb", "h"]
        },
        oz = new RegExp("^".concat(oX.source, "*")),
        oY = new RegExp("".concat(oX.source, "*$"));

    function oZ(e, t) {
        return {
            start: e,
            end: t
        }
    }
    var oq = !!Object.fromEntries,
        o$ = !!String.prototype.trimStart,
        oJ = !!String.prototype.trimEnd,
        oQ = oq ? Object.fromEntries : function(e) {
            var t = {},
                r = !0,
                n = !1,
                o = void 0;
            try {
                for (var a, i = e[Symbol.iterator](); !(r = (a = i.next()).done); r = !0) {
                    var l, c = (l = a.value, function(e) {
                            if (Array.isArray(e)) return e
                        }(l) || function(e) {
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
                        }(l) || oF(l, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        u = c[0],
                        s = c[1];
                    t[u] = s
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
            return t
        },
        o0 = o$ ? function(e) {
            return e.trimStart()
        } : function(e) {
            return e.replace(oz, "")
        },
        o1 = oJ ? function(e) {
            return e.trimEnd()
        } : function(e) {
            return e.replace(oY, "")
        },
        o2 = RegExp("([^\\u0009-\\u000D\\u0020\\u0085\\u00A0\\u1680\\u2000-\\u200A\\u2028-\\u2029\\u202F\\u205F\\u3000\\u0021-\\u002F\\u003A-\\u0040\\u005B-\\u005E\\u0060\\u007B-\\u007E\\u00A1-\\u00A7\\u00A9\\u00AB-\\u00AC\\u00AE\\u00B0-\\u00B1\\u00B6\\u00BB\\u00BF\\u00D7\\u00F7\\u2010-\\u2027\\u2030-\\u203E\\u2041-\\u2053\\u2055-\\u205E\\u2190-\\u245F\\u2500-\\u2775\\u2794-\\u2BFF\\u2E00-\\u2E7F\\u3001-\\u3003\\u3008-\\u3020\\u3030\\uFD3E-\\uFD3F\\uFE45-\\uFE46]*)", "yu"),
        o3 = function() {
            var e;

            function t(e) {
                var r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                this.message = e, this.position = {
                    offset: 0,
                    line: 1,
                    column: 1
                }, this.ignoreTag = !!r.ignoreTag, this.locale = r.locale, this.requiresOtherClause = !!r.requiresOtherClause, this.shouldParseSkeletons = !!r.shouldParseSkeletons
            }
            return e = [{
                    key: "parse",
                    value: function() {
                        if (0 !== this.offset()) throw Error("parser can only be used once");
                        if (this.message.length > 0) {
                            var e = this.message.charCodeAt(0);
                            if (35 !== e && 39 !== e && 60 !== e && 123 !== e && 125 !== e) {
                                var t = function(e) {
                                    if (0 === e.length) return null;
                                    for (var t = 1, r = 1, n = 0; n < e.length;) {
                                        var o = e.charCodeAt(n);
                                        switch (o) {
                                            case 35:
                                            case 39:
                                            case 60:
                                            case 123:
                                            case 125:
                                                return null
                                        }
                                        if (10 === o) t++, r = 1, n++;
                                        else if (r++, o >= 55296 && o <= 56319 && n + 1 < e.length) {
                                            var a = e.charCodeAt(n + 1);
                                            n += a >= 56320 && a <= 57343 ? 2 : 1
                                        } else n++
                                    }
                                    return {
                                        offset: e.length,
                                        line: t,
                                        column: r
                                    }
                                }(this.message);
                                if (t) {
                                    var r = this.clonePosition();
                                    return this.position = t, {
                                        val: [{
                                            type: 0,
                                            value: this.message,
                                            location: oZ(r, this.clonePosition())
                                        }],
                                        err: null
                                    }
                                }
                            }
                        }
                        return this.parseMessage(0, "", !1)
                    }
                }, {
                    key: "parseMessage",
                    value: function(e, t, r) {
                        for (var n = []; !this.isEOF();) {
                            var o = this.char();
                            if (123 === o) {
                                var a = this.parseArgument(e, r);
                                if (a.err) return a;
                                n.push(a.val)
                            } else if (125 === o && e > 0) break;
                            else if (35 === o && ("plural" === t || "selectordinal" === t)) {
                                var i = this.clonePosition();
                                this.bump(), n.push({
                                    type: 7,
                                    location: oZ(i, this.clonePosition())
                                })
                            } else if (60 !== o || this.ignoreTag || 47 !== this.peek())
                                if (60 === o && !this.ignoreTag && o6(this.peek() || 0)) {
                                    var l = this.parseTag(e, t);
                                    if (l.err) return l;
                                    n.push(l.val)
                                } else {
                                    var c = this.parseLiteral(e, t);
                                    if (c.err) return c;
                                    n.push(c.val)
                                }
                            else if (!r) return this.error(26, oZ(this.clonePosition(), this.clonePosition()));
                            else break
                        }
                        return {
                            val: n,
                            err: null
                        }
                    }
                }, {
                    key: "parseTag",
                    value: function(e, t) {
                        var r = this.clonePosition();
                        this.bump();
                        var n = this.parseTagName();
                        if (this.bumpSpace(), this.bumpIf("/>")) return {
                            val: {
                                type: 0,
                                value: "<".concat(n, "/>"),
                                location: oZ(r, this.clonePosition())
                            },
                            err: null
                        };
                        if (!this.bumpIf(">")) return this.error(23, oZ(r, this.clonePosition()));
                        var o = this.parseMessage(e + 1, t, !0);
                        if (o.err) return o;
                        var a = o.val,
                            i = this.clonePosition();
                        if (!this.bumpIf("</")) return this.error(27, oZ(r, this.clonePosition()));
                        if (this.isEOF() || !o6(this.char())) return this.error(23, oZ(i, this.clonePosition()));
                        var l = this.clonePosition();
                        return n !== this.parseTagName() ? this.error(26, oZ(l, this.clonePosition())) : (this.bumpSpace(), this.bumpIf(">")) ? {
                            val: {
                                type: 8,
                                value: n,
                                children: a,
                                location: oZ(r, this.clonePosition())
                            },
                            err: null
                        } : this.error(23, oZ(i, this.clonePosition()))
                    }
                }, {
                    key: "parseTagName",
                    value: function() {
                        var e, t = this.offset();
                        for (this.bump(); !this.isEOF() && (45 === (e = this.char()) || 46 === e || e >= 48 && e <= 57 || 95 === e || e >= 97 && e <= 122 || e >= 65 && e <= 90 || 183 == e || e >= 192 && e <= 214 || e >= 216 && e <= 246 || e >= 248 && e <= 893 || e >= 895 && e <= 8191 || e >= 8204 && e <= 8205 || e >= 8255 && e <= 8256 || e >= 8304 && e <= 8591 || e >= 11264 && e <= 12271 || e >= 12289 && e <= 55295 || e >= 63744 && e <= 64975 || e >= 65008 && e <= 65533 || e >= 65536 && e <= 983039);) this.bump();
                        return this.message.slice(t, this.offset())
                    }
                }, {
                    key: "parseLiteral",
                    value: function(e, t) {
                        for (var r = this.clonePosition(), n = "";;) {
                            var o = this.tryParseQuote(t);
                            if (o) {
                                n += o;
                                continue
                            }
                            var a = this.tryParseUnquoted(e, t);
                            if (a) {
                                n += a;
                                continue
                            }
                            var i = this.tryParseLeftAngleBracket();
                            if (i) {
                                n += i;
                                continue
                            }
                            break
                        }
                        return {
                            val: {
                                type: 0,
                                value: n,
                                location: oZ(r, this.clonePosition())
                            },
                            err: null
                        }
                    }
                }, {
                    key: "tryParseLeftAngleBracket",
                    value: function() {
                        var e;
                        return this.isEOF() || 60 !== this.char() || !this.ignoreTag && (o6(e = this.peek() || 0) || 47 === e) ? null : (this.bump(), "<")
                    }
                }, {
                    key: "tryParseQuote",
                    value: function(e) {
                        if (this.isEOF() || 39 !== this.char()) return null;
                        switch (this.peek()) {
                            case 39:
                                return this.bump(), this.bump(), "'";
                            case 123:
                            case 60:
                            case 62:
                            case 125:
                                break;
                            case 35:
                                if ("plural" === e || "selectordinal" === e) break;
                                return null;
                            default:
                                return null
                        }
                        this.bump();
                        var t, r = [this.char()];
                        for (this.bump(); !this.isEOF();) {
                            var n = this.char();
                            if (39 === n)
                                if (39 === this.peek()) r.push(39), this.bump();
                                else {
                                    this.bump();
                                    break
                                }
                            else r.push(n);
                            this.bump()
                        }
                        return (t = String).fromCodePoint.apply(t, function(e) {
                            if (Array.isArray(e)) return oB(e)
                        }(r) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || oF(r) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())
                    }
                }, {
                    key: "tryParseUnquoted",
                    value: function(e, t) {
                        if (this.isEOF()) return null;
                        var r = this.char();
                        return 60 === r || 123 === r || 35 === r && ("plural" === t || "selectordinal" === t) || 125 === r && e > 0 ? null : (this.bump(), String.fromCodePoint(r))
                    }
                }, {
                    key: "parseArgument",
                    value: function(e, t) {
                        var r = this.clonePosition();
                        if (this.bump(), this.bumpSpace(), this.isEOF()) return this.error(1, oZ(r, this.clonePosition()));
                        if (125 === this.char()) return this.bump(), this.error(2, oZ(r, this.clonePosition()));
                        var n = this.parseIdentifierIfPossible().value;
                        if (!n) return this.error(3, oZ(r, this.clonePosition()));
                        if (this.bumpSpace(), this.isEOF()) return this.error(1, oZ(r, this.clonePosition()));
                        switch (this.char()) {
                            case 125:
                                return this.bump(), {
                                    val: {
                                        type: 1,
                                        value: n,
                                        location: oZ(r, this.clonePosition())
                                    },
                                    err: null
                                };
                            case 44:
                                if (this.bump(), this.bumpSpace(), this.isEOF()) return this.error(1, oZ(r, this.clonePosition()));
                                return this.parseArgumentOptions(e, t, n, r);
                            default:
                                return this.error(3, oZ(r, this.clonePosition()))
                        }
                    }
                }, {
                    key: "parseIdentifierIfPossible",
                    value: function() {
                        var e, t, r = this.clonePosition(),
                            n = this.offset(),
                            o = (e = this.message, o2.lastIndex = n, null != (t = o2.exec(e)[1]) ? t : ""),
                            a = n + o.length;
                        return this.bumpTo(a), {
                            value: o,
                            location: oZ(r, this.clonePosition())
                        }
                    }
                }, {
                    key: "parseArgumentOptions",
                    value: function(e, t, r, n) {
                        var o = this.clonePosition(),
                            a = this.parseIdentifierIfPossible().value,
                            i = this.clonePosition();
                        switch (a) {
                            case "":
                                return this.error(4, oZ(o, i));
                            case "number":
                            case "date":
                            case "time":
                                this.bumpSpace();
                                var l, c = null;
                                if (this.bumpIf(",")) {
                                    this.bumpSpace();
                                    var u = this.clonePosition(),
                                        s = this.parseSimpleArgStyleIfPossible();
                                    if (s.err) return s;
                                    var f = o1(s.val);
                                    if (0 === f.length) return this.error(6, oZ(this.clonePosition(), this.clonePosition()));
                                    c = {
                                        style: f,
                                        styleLocation: oZ(u, this.clonePosition())
                                    }
                                }
                                var p = this.tryParseArgumentClose(n);
                                if (p.err) return p;
                                var d = oZ(n, this.clonePosition());
                                if (c && c.style.startsWith("::")) {
                                    var h = o0(c.style.slice(2));
                                    if ("number" === a) {
                                        var y = this.parseNumberSkeletonFromString(h, c.styleLocation);
                                        if (y.err) return y;
                                        return {
                                            val: {
                                                type: 2,
                                                value: r,
                                                location: d,
                                                style: y.val
                                            },
                                            err: null
                                        }
                                    }
                                    if (0 === h.length) return this.error(10, d);
                                    var m, b = h;
                                    return this.locale && (b = function(e, t) {
                                        for (var r = "", n = 0; n < e.length; n++) {
                                            var o = e.charAt(n);
                                            if ("j" === o) {
                                                for (var a = 0; n + 1 < e.length && e.charAt(n + 1) === o;) a++, n++;
                                                var i = 1 + (1 & a),
                                                    l = a < 2 ? 1 : 3 + (a >> 1),
                                                    c = function(e) {
                                                        var t, r = e.hourCycle;
                                                        if (void 0 === r && e.hourCycles && e.hourCycles.length && (r = e.hourCycles[0]), r) switch (r) {
                                                            case "h24":
                                                                return "k";
                                                            case "h23":
                                                                return "H";
                                                            case "h12":
                                                                return "h";
                                                            case "h11":
                                                                return "K";
                                                            default:
                                                                throw Error("Invalid hourCycle")
                                                        }
                                                        var n = e.language;
                                                        return "root" !== n && (t = e.maximize().region), (oK[t || ""] || oK[n || ""] || oK["".concat(n, "-001")] || oK["001"])[0]
                                                    }(t);
                                                for (("H" == c || "k" == c) && (l = 0); l-- > 0;) r += "a";
                                                for (; i-- > 0;) r = c + r
                                            } else "J" === o ? r += "H" : r += o
                                        }
                                        return r
                                    }(h, this.locale)), {
                                        val: {
                                            type: "date" === a ? 3 : 4,
                                            value: r,
                                            location: d,
                                            style: {
                                                type: 1,
                                                pattern: b,
                                                location: c.styleLocation,
                                                parsedOptions: this.shouldParseSkeletons ? (m = {}, b.replace(o_, function(e) {
                                                    var t = e.length;
                                                    switch (e[0]) {
                                                        case "G":
                                                            m.era = 4 === t ? "long" : 5 === t ? "narrow" : "short";
                                                            break;
                                                        case "y":
                                                            m.year = 2 === t ? "2-digit" : "numeric";
                                                            break;
                                                        case "Y":
                                                        case "u":
                                                        case "U":
                                                        case "r":
                                                            throw RangeError("`Y/u/U/r` (year) patterns are not supported, use `y` instead");
                                                        case "q":
                                                        case "Q":
                                                            throw RangeError("`q/Q` (quarter) patterns are not supported");
                                                        case "M":
                                                        case "L":
                                                            m.month = ["numeric", "2-digit", "short", "long", "narrow"][t - 1];
                                                            break;
                                                        case "w":
                                                        case "W":
                                                            throw RangeError("`w/W` (week) patterns are not supported");
                                                        case "d":
                                                            m.day = ["numeric", "2-digit"][t - 1];
                                                            break;
                                                        case "D":
                                                        case "F":
                                                        case "g":
                                                            throw RangeError("`D/F/g` (day) patterns are not supported, use `d` instead");
                                                        case "E":
                                                            m.weekday = 4 === t ? "long" : 5 === t ? "narrow" : "short";
                                                            break;
                                                        case "e":
                                                            if (t < 4) throw RangeError("`e..eee` (weekday) patterns are not supported");
                                                            m.weekday = ["short", "long", "narrow", "short"][t - 4];
                                                            break;
                                                        case "c":
                                                            if (t < 4) throw RangeError("`c..ccc` (weekday) patterns are not supported");
                                                            m.weekday = ["short", "long", "narrow", "short"][t - 4];
                                                            break;
                                                        case "a":
                                                            m.hour12 = !0;
                                                            break;
                                                        case "b":
                                                        case "B":
                                                            throw RangeError("`b/B` (period) patterns are not supported, use `a` instead");
                                                        case "h":
                                                            m.hourCycle = "h12", m.hour = ["numeric", "2-digit"][t - 1];
                                                            break;
                                                        case "H":
                                                            m.hourCycle = "h23", m.hour = ["numeric", "2-digit"][t - 1];
                                                            break;
                                                        case "K":
                                                            m.hourCycle = "h11", m.hour = ["numeric", "2-digit"][t - 1];
                                                            break;
                                                        case "k":
                                                            m.hourCycle = "h24", m.hour = ["numeric", "2-digit"][t - 1];
                                                            break;
                                                        case "j":
                                                        case "J":
                                                        case "C":
                                                            throw RangeError("`j/J/C` (hour) patterns are not supported, use `h/H/K/k` instead");
                                                        case "m":
                                                            m.minute = ["numeric", "2-digit"][t - 1];
                                                            break;
                                                        case "s":
                                                            m.second = ["numeric", "2-digit"][t - 1];
                                                            break;
                                                        case "S":
                                                        case "A":
                                                            throw RangeError("`S/A` (second) patterns are not supported, use `s` instead");
                                                        case "z":
                                                            m.timeZoneName = t < 4 ? "short" : "long";
                                                            break;
                                                        case "Z":
                                                        case "O":
                                                        case "v":
                                                        case "V":
                                                        case "X":
                                                        case "x":
                                                            throw RangeError("`Z/O/v/V/X/x` (timeZone) patterns are not supported, use `z` instead")
                                                    }
                                                    return ""
                                                }), m) : {}
                                            }
                                        },
                                        err: null
                                    }
                                }
                                return {
                                    val: {
                                        type: "number" === a ? 2 : "date" === a ? 3 : 4,
                                        value: r,
                                        location: d,
                                        style: null != (l = null == c ? void 0 : c.style) ? l : null
                                    }, err: null
                                };
                            case "plural":
                            case "selectordinal":
                            case "select":
                                var v = this.clonePosition();
                                if (this.bumpSpace(), !this.bumpIf(",")) return this.error(12, oZ(v, oL({}, v)));
                                this.bumpSpace();
                                var g = this.parseIdentifierIfPossible(),
                                    O = 0;
                                if ("select" !== a && "offset" === g.value) {
                                    if (!this.bumpIf(":")) return this.error(13, oZ(this.clonePosition(), this.clonePosition()));
                                    this.bumpSpace();
                                    var E = this.tryParseDecimalInteger(13, 14);
                                    if (E.err) return E;
                                    this.bumpSpace(), g = this.parseIdentifierIfPossible(), O = E.val
                                }
                                var w = this.tryParsePluralOrSelectOptions(e, a, t, g);
                                if (w.err) return w;
                                var S = this.tryParseArgumentClose(n);
                                if (S.err) return S;
                                var P = oZ(n, this.clonePosition());
                                if ("select" === a) return {
                                    val: {
                                        type: 5,
                                        value: r,
                                        options: oQ(w.val),
                                        location: P
                                    },
                                    err: null
                                };
                                return {
                                    val: {
                                        type: 6,
                                        value: r,
                                        options: oQ(w.val),
                                        offset: O,
                                        pluralType: "plural" === a ? "cardinal" : "ordinal",
                                        location: P
                                    }, err: null
                                };
                            default:
                                return this.error(5, oZ(o, i))
                        }
                    }
                }, {
                    key: "tryParseArgumentClose",
                    value: function(e) {
                        return this.isEOF() || 125 !== this.char() ? this.error(1, oZ(e, this.clonePosition())) : (this.bump(), {
                            val: !0,
                            err: null
                        })
                    }
                }, {
                    key: "parseSimpleArgStyleIfPossible",
                    value: function() {
                        for (var e = 0, t = this.clonePosition(); !this.isEOF();) switch (this.char()) {
                            case 39:
                                this.bump();
                                var r = this.clonePosition();
                                if (!this.bumpUntil("'")) return this.error(11, oZ(r, this.clonePosition()));
                                this.bump();
                                break;
                            case 123:
                                e += 1, this.bump();
                                break;
                            case 125:
                                if (!(e > 0)) return {
                                    val: this.message.slice(t.offset, this.offset()),
                                    err: null
                                };
                                e -= 1;
                                break;
                            default:
                                this.bump()
                        }
                        return {
                            val: this.message.slice(t.offset, this.offset()),
                            err: null
                        }
                    }
                }, {
                    key: "parseNumberSkeletonFromString",
                    value: function(e, t) {
                        var r = [];
                        try {
                            r = function(e) {
                                if (0 === e.length) throw Error("Number skeleton cannot be empty");
                                var t = e.split(oT).filter(function(e) {
                                        return e.length > 0
                                    }),
                                    r = [],
                                    n = !0,
                                    o = !1,
                                    a = void 0;
                                try {
                                    for (var i, l = t[Symbol.iterator](); !(n = (i = l.next()).done); n = !0) {
                                        var c = i.value.split("/");
                                        if (0 === c.length) throw Error("Invalid number skeleton");
                                        var u = function(e) {
                                                if (Array.isArray(e)) return e
                                            }(c) || function(e) {
                                                if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                            }(c) || function(e) {
                                                if (e) {
                                                    if ("string" == typeof e) return oj(e, void 0);
                                                    var t = Object.prototype.toString.call(e).slice(8, -1);
                                                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return oj(e, void 0)
                                                }
                                            }(c) || function() {
                                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                            }(),
                                            s = u[0],
                                            f = u.slice(1),
                                            p = !0,
                                            d = !1,
                                            h = void 0;
                                        try {
                                            for (var y, m = f[Symbol.iterator](); !(p = (y = m.next()).done); p = !0) {
                                                var b = y.value;
                                                if (0 === b.length) throw Error("Invalid number skeleton")
                                            }
                                        } catch (e) {
                                            d = !0, h = e
                                        } finally {
                                            try {
                                                p || null == m.return || m.return()
                                            } finally {
                                                if (d) throw h
                                            }
                                        }
                                        r.push({
                                            stem: s,
                                            options: f
                                        })
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
                                return r
                            }(e)
                        } catch (e) {
                            return this.error(7, t)
                        }
                        return {
                            val: {
                                type: 0,
                                tokens: r,
                                location: t,
                                parsedOptions: this.shouldParseSkeletons ? function(e) {
                                    var t = {},
                                        r = !0,
                                        n = !1,
                                        o = void 0;
                                    try {
                                        for (var a, i = e[Symbol.iterator](); !(r = (a = i.next()).done); r = !0) {
                                            var l = a.value;
                                            switch (l.stem) {
                                                case "percent":
                                                case "%":
                                                    t.style = "percent";
                                                    continue;
                                                case "%x100":
                                                    t.style = "percent", t.scale = 100;
                                                    continue;
                                                case "currency":
                                                    t.style = "currency", t.currency = l.options[0];
                                                    continue;
                                                case "group-off":
                                                case ",_":
                                                    t.useGrouping = !1;
                                                    continue;
                                                case "precision-integer":
                                                case ".":
                                                    t.maximumFractionDigits = 0;
                                                    continue;
                                                case "measure-unit":
                                                case "unit":
                                                    t.style = "unit", t.unit = l.options[0].replace(/^(.*?)-/, "");
                                                    continue;
                                                case "compact-short":
                                                case "K":
                                                    t.notation = "compact", t.compactDisplay = "short";
                                                    continue;
                                                case "compact-long":
                                                case "KK":
                                                    t.notation = "compact", t.compactDisplay = "long";
                                                    continue;
                                                case "scientific":
                                                    t = oA(oI(oA({}, t), {
                                                        notation: "scientific"
                                                    }), l.options.reduce(function(e, t) {
                                                        return oA({}, e, oD(t))
                                                    }, {}));
                                                    continue;
                                                case "engineering":
                                                    t = oA(oI(oA({}, t), {
                                                        notation: "engineering"
                                                    }), l.options.reduce(function(e, t) {
                                                        return oA({}, e, oD(t))
                                                    }, {}));
                                                    continue;
                                                case "notation-simple":
                                                    t.notation = "standard";
                                                    continue;
                                                case "unit-width-narrow":
                                                    t.currencyDisplay = "narrowSymbol", t.unitDisplay = "narrow";
                                                    continue;
                                                case "unit-width-short":
                                                    t.currencyDisplay = "code", t.unitDisplay = "short";
                                                    continue;
                                                case "unit-width-full-name":
                                                    t.currencyDisplay = "name", t.unitDisplay = "long";
                                                    continue;
                                                case "unit-width-iso-code":
                                                    t.currencyDisplay = "symbol";
                                                    continue;
                                                case "scale":
                                                    t.scale = parseFloat(l.options[0]);
                                                    continue;
                                                case "rounding-mode-floor":
                                                    t.roundingMode = "floor";
                                                    continue;
                                                case "rounding-mode-ceiling":
                                                    t.roundingMode = "ceil";
                                                    continue;
                                                case "rounding-mode-down":
                                                    t.roundingMode = "trunc";
                                                    continue;
                                                case "rounding-mode-up":
                                                    t.roundingMode = "expand";
                                                    continue;
                                                case "rounding-mode-half-even":
                                                    t.roundingMode = "halfEven";
                                                    continue;
                                                case "rounding-mode-half-down":
                                                    t.roundingMode = "halfTrunc";
                                                    continue;
                                                case "rounding-mode-half-up":
                                                    t.roundingMode = "halfExpand";
                                                    continue;
                                                case "integer-width":
                                                    if (l.options.length > 1) throw RangeError("integer-width stems only accept a single optional option");
                                                    l.options[0].replace(oR, function(e, r, n, o, a, i) {
                                                        if (r) t.minimumIntegerDigits = n.length;
                                                        else if (o && a) throw Error("We currently do not support maximum integer digits");
                                                        else if (i) throw Error("We currently do not support exact integer digits");
                                                        return ""
                                                    });
                                                    continue
                                            }
                                            if (oU.test(l.stem)) {
                                                t.minimumIntegerDigits = l.stem.length;
                                                continue
                                            }
                                            if (oN.test(l.stem)) {
                                                if (l.options.length > 1) throw RangeError("Fraction-precision stems only accept a single optional option");
                                                l.stem.replace(oN, function(e, r, n, o, a, i) {
                                                    return "*" === n ? t.minimumFractionDigits = r.length : o && "#" === o[0] ? t.maximumFractionDigits = o.length : a && i ? (t.minimumFractionDigits = a.length, t.maximumFractionDigits = a.length + i.length) : (t.minimumFractionDigits = r.length, t.maximumFractionDigits = r.length), ""
                                                });
                                                var c = l.options[0];
                                                "w" === c ? t = oI(oA({}, t), {
                                                    trailingZeroDisplay: "stripIfInteger"
                                                }) : c && (t = oA({}, t, oM(c)));
                                                continue
                                            }
                                            if (oC.test(l.stem)) {
                                                t = oA({}, t, oM(l.stem));
                                                continue
                                            }
                                            var u = ok(l.stem);
                                            u && (t = oA({}, t, u));
                                            var s = function(e) {
                                                var t;
                                                if ("E" === e[0] && "E" === e[1] ? (t = {
                                                        notation: "engineering"
                                                    }, e = e.slice(2)) : "E" === e[0] && (t = {
                                                        notation: "scientific"
                                                    }, e = e.slice(1)), t) {
                                                    var r = e.slice(0, 2);
                                                    if ("+!" === r ? (t.signDisplay = "always", e = e.slice(2)) : "+?" === r && (t.signDisplay = "exceptZero", e = e.slice(2)), !oU.test(e)) throw Error("Malformed concise eng/scientific notation");
                                                    t.minimumIntegerDigits = e.length
                                                }
                                                return t
                                            }(l.stem);
                                            s && (t = oA({}, t, s))
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
                                    return t
                                }(r) : {}
                            },
                            err: null
                        }
                    }
                }, {
                    key: "tryParsePluralOrSelectOptions",
                    value: function(e, t, r, n) {
                        for (var o = !1, a = [], i = new Set, l = n.value, c = n.location;;) {
                            if (0 === l.length) {
                                var u, s = this.clonePosition();
                                if ("select" !== t && this.bumpIf("=")) {
                                    var f = this.tryParseDecimalInteger(16, 19);
                                    if (f.err) return f;
                                    c = oZ(s, this.clonePosition()), l = this.message.slice(s.offset, this.offset())
                                } else break
                            }
                            if (i.has(l)) return this.error("select" === t ? 21 : 20, c);
                            "other" === l && (o = !0), this.bumpSpace();
                            var p = this.clonePosition();
                            if (!this.bumpIf("{")) return this.error("select" === t ? 17 : 18, oZ(this.clonePosition(), this.clonePosition()));
                            var d = this.parseMessage(e + 1, t, r);
                            if (d.err) return d;
                            var h = this.tryParseArgumentClose(p);
                            if (h.err) return h;
                            a.push([l, {
                                value: d.val,
                                location: oZ(p, this.clonePosition())
                            }]), i.add(l), this.bumpSpace(), l = (u = this.parseIdentifierIfPossible()).value, c = u.location
                        }
                        return 0 === a.length ? this.error("select" === t ? 15 : 16, oZ(this.clonePosition(), this.clonePosition())) : this.requiresOtherClause && !o ? this.error(22, oZ(this.clonePosition(), this.clonePosition())) : {
                            val: a,
                            err: null
                        }
                    }
                }, {
                    key: "tryParseDecimalInteger",
                    value: function(e, t) {
                        var r = 1,
                            n = this.clonePosition();
                        this.bumpIf("+") || this.bumpIf("-") && (r = -1);
                        for (var o = !1, a = 0; !this.isEOF();) {
                            var i = this.char();
                            if (i >= 48 && i <= 57) o = !0, a = 10 * a + (i - 48), this.bump();
                            else break
                        }
                        var l = oZ(n, this.clonePosition());
                        return o ? Number.isSafeInteger(a *= r) ? {
                            val: a,
                            err: null
                        } : this.error(t, l) : this.error(e, l)
                    }
                }, {
                    key: "offset",
                    value: function() {
                        return this.position.offset
                    }
                }, {
                    key: "isEOF",
                    value: function() {
                        return this.offset() === this.message.length
                    }
                }, {
                    key: "clonePosition",
                    value: function() {
                        return {
                            offset: this.position.offset,
                            line: this.position.line,
                            column: this.position.column
                        }
                    }
                }, {
                    key: "char",
                    value: function() {
                        var e = this.position.offset;
                        if (e >= this.message.length) throw Error("out of bound");
                        var t = this.message.codePointAt(e);
                        if (void 0 === t) throw Error("Offset ".concat(e, " is at invalid UTF-16 code unit boundary"));
                        return t
                    }
                }, {
                    key: "error",
                    value: function(e, t) {
                        return {
                            val: null,
                            err: {
                                kind: e,
                                message: this.message,
                                location: t
                            }
                        }
                    }
                }, {
                    key: "bump",
                    value: function() {
                        if (!this.isEOF()) {
                            var e = this.char();
                            10 === e ? (this.position.line += 1, this.position.column = 1, this.position.offset += 1) : (this.position.column += 1, this.position.offset += e < 65536 ? 1 : 2)
                        }
                    }
                }, {
                    key: "bumpIf",
                    value: function(e) {
                        if (this.message.startsWith(e, this.offset())) {
                            for (var t = 0; t < e.length; t++) this.bump();
                            return !0
                        }
                        return !1
                    }
                }, {
                    key: "bumpUntil",
                    value: function(e) {
                        var t = this.offset(),
                            r = this.message.indexOf(e, t);
                        return r >= 0 ? (this.bumpTo(r), !0) : (this.bumpTo(this.message.length), !1)
                    }
                }, {
                    key: "bumpTo",
                    value: function(e) {
                        if (this.offset() > e) throw Error("targetOffset ".concat(e, " must be greater than or equal to the current offset ").concat(this.offset()));
                        for (e = Math.min(e, this.message.length);;) {
                            var t = this.offset();
                            if (t === e) break;
                            if (t > e) throw Error("targetOffset ".concat(e, " is at invalid UTF-16 code unit boundary"));
                            if (this.bump(), this.isEOF()) break
                        }
                    }
                }, {
                    key: "bumpSpace",
                    value: function() {
                        for (var e; !this.isEOF() && ((e = this.char()) >= 9 && e <= 13 || 32 === e || 133 === e || e >= 8206 && e <= 8207 || 8232 === e || 8233 === e);) this.bump()
                    }
                }, {
                    key: "peek",
                    value: function() {
                        if (this.isEOF()) return null;
                        var e, t = this.char(),
                            r = this.offset();
                        return null != (e = this.message.charCodeAt(r + (t >= 65536 ? 2 : 1))) ? e : null
                    }
                }],
                function(e, t) {
                    for (var r = 0; r < t.length; r++) {
                        var n = t[r];
                        n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                    }
                }(t.prototype, e), t
        }();

    function o6(e) {
        return e >= 97 && e <= 122 || e >= 65 && e <= 90
    }

    function o5(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function o4(e, t, r) {
        return t = ar(t),
            function(e, t) {
                if (t && ("object" === al(t) || "function" == typeof t)) return t;
                if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                return e
            }(e, au() ? Reflect.construct(t, r || [], ar(e).constructor) : t.apply(e, r))
    }

    function o8(e, t) {
        if (!(e instanceof t)) throw TypeError("Cannot call a class as a function")
    }

    function o7(e, t, r) {
        return (o7 = au() ? Reflect.construct : function(e, t, r) {
            var n = [null];
            n.push.apply(n, t);
            var o = new(Function.bind.apply(e, n));
            return r && aa(o, r.prototype), o
        }).apply(null, arguments)
    }

    function o9(e, t) {
        for (var r = 0; r < t.length; r++) {
            var n = t[r];
            n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
        }
    }

    function ae(e, t, r) {
        return t && o9(e.prototype, t), r && o9(e, r), e
    }

    function at() {
        return (at = Object.assign || function(e) {
            for (var t = 1; t < arguments.length; t++) {
                var r = arguments[t];
                for (var n in r) Object.prototype.hasOwnProperty.call(r, n) && (e[n] = r[n])
            }
            return e
        }).apply(this, arguments)
    }

    function ar(e) {
        return (ar = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
            return e.__proto__ || Object.getPrototypeOf(e)
        })(e)
    }

    function an(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");
        e.prototype = Object.create(t && t.prototype, {
            constructor: {
                value: e,
                writable: !0,
                configurable: !0
            }
        }), t && aa(e, t)
    }

    function ao(e) {
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

    function aa(e, t) {
        return (aa = Object.setPrototypeOf || function(e, t) {
            return e.__proto__ = t, e
        })(e, t)
    }

    function ai(e) {
        return function(e) {
            if (Array.isArray(e)) return o5(e)
        }(e) || function(e) {
            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
        }(e) || function(e) {
            if (e) {
                if ("string" == typeof e) return o5(e, void 0);
                var t = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return o5(e, void 0)
            }
        }(e) || function() {
            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }

    function al(e) {
        return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
    }

    function ac(e) {
        var t = "function" == typeof Map ? new Map : void 0;
        return (ac = function(e) {
            if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
            if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
            if (void 0 !== t) {
                if (t.has(e)) return t.get(e);
                t.set(e, r)
            }

            function r() {
                return o7(e, arguments, ar(this).constructor)
            }
            return r.prototype = Object.create(e.prototype, {
                constructor: {
                    value: r,
                    enumerable: !1,
                    writable: !0,
                    configurable: !0
                }
            }), aa(r, e)
        })(e)
    }

    function au() {
        try {
            var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
        } catch (e) {}
        return (au = function() {
            return !!e
        })()
    }
    var as = function(e) {
            function t(e, r, n) {
                var o;
                return o8(this, t), (o = o4(this, t, [e])).code = r, o.originalMessage = n, o
            }
            return an(t, e), ae(t, [{
                key: "toString",
                value: function() {
                    return "[formatjs Error: ".concat(this.code, "] ").concat(this.message)
                }
            }]), t
        }(ac(Error)),
        af = function(e) {
            function t(e, r, n, o) {
                return o8(this, t), o4(this, t, ['Invalid values for "'.concat(e, '": "').concat(r, '". Options are "').concat(Object.keys(n).join('", "'), '"'), "INVALID_VALUE", o])
            }
            return an(t, e), t
        }(as),
        ap = function(e) {
            function t(e, r, n) {
                return o8(this, t), o4(this, t, ['Value for "'.concat(e, '" must be of type ').concat(r), "INVALID_VALUE", n])
            }
            return an(t, e), t
        }(as),
        ad = function(e) {
            function t(e, r) {
                return o8(this, t), o4(this, t, ['The intl string context variable "'.concat(e, '" was not provided to the string "').concat(r, '"'), "MISSING_VALUE", r])
            }
            return an(t, e), t
        }(as);

    function ah(e) {
        return {
            create: function() {
                return {
                    get: function(t) {
                        return e[t]
                    },
                    set: function(t, r) {
                        e[t] = r
                    }
                }
            }
        }
    }
    var ay = ((m = function() {
        function e(t) {
            var r, n = this,
                o = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : e.defaultLocale,
                a = arguments.length > 2 ? arguments[2] : void 0,
                i = arguments.length > 3 ? arguments[3] : void 0;
            if (o8(this, e), this.formatterCache = {
                    number: {},
                    dateTime: {},
                    pluralRules: {}
                }, this.format = function(e) {
                    var t = n.formatToParts(e);
                    if (1 === t.length) return t[0].value;
                    var r = t.reduce(function(e, t) {
                        return e.length && 0 === t.type && "string" == typeof e[e.length - 1] ? e[e.length - 1] += t.value : e.push(t.value), e
                    }, []);
                    return r.length <= 1 ? r[0] || "" : r
                }, this.formatToParts = function(e) {
                    return function e(t, r, n, o, a, i, l) {
                        if (1 === t.length && 0 === t[0].type) return [{
                            type: 0,
                            value: t[0].value
                        }];
                        var c = [],
                            u = !0,
                            s = !1,
                            f = void 0;
                        try {
                            for (var p, d = t[Symbol.iterator](); !(u = (p = d.next()).done); u = !0) {
                                var h = p.value;
                                if (0 === h.type) {
                                    c.push({
                                        type: 0,
                                        value: h.value
                                    });
                                    continue
                                }
                                if (7 === h.type) {
                                    "number" == typeof i && c.push({
                                        type: 0,
                                        value: n.getNumberFormat(r).format(i)
                                    });
                                    continue
                                }
                                var y = h.value;
                                if (!(a && y in a)) throw new ad(y, l);
                                var m = a[y];
                                if (1 === h.type) {
                                    m && "string" != typeof m && "number" != typeof m && (void 0 === m ? "undefined" : al(m)) !== "bigint" || (m = "string" == typeof m || "number" == typeof m || (void 0 === m ? "undefined" : al(m)) === "bigint" ? String(m) : ""), c.push({
                                        type: +("string" != typeof m),
                                        value: m
                                    });
                                    continue
                                }
                                if (3 === h.type) {
                                    var b = "string" == typeof h.style ? o.date[h.style] : oW(h.style) ? h.style.parsedOptions : void 0;
                                    c.push({
                                        type: 0,
                                        value: n.getDateTimeFormat(r, b).format(m)
                                    });
                                    continue
                                }
                                if (4 === h.type) {
                                    var v = "string" == typeof h.style ? o.time[h.style] : oW(h.style) ? h.style.parsedOptions : o.time.medium;
                                    c.push({
                                        type: 0,
                                        value: n.getDateTimeFormat(r, v).format(m)
                                    });
                                    continue
                                }
                                if (2 === h.type) {
                                    var g = "string" == typeof h.style ? o.number[h.style] : oV(h.style) ? h.style.parsedOptions : void 0;
                                    if (g && g.scale) {
                                        var O = g.scale || 1;
                                        if ((void 0 === m ? "undefined" : al(m)) === "bigint") {
                                            if (!Number.isInteger(O)) throw TypeError("Cannot apply fractional scale ".concat(O, " to bigint value. Scale must be an integer when formatting bigint."));
                                            m *= BigInt(O)
                                        } else m *= O
                                    }
                                    c.push({
                                        type: 0,
                                        value: n.getNumberFormat(r, g).format(m)
                                    });
                                    continue
                                }
                                if (8 === h.type) {
                                    var E = h.children,
                                        w = h.value,
                                        S = a[w];
                                    if ("function" != typeof S) throw new ap(w, "function", l);
                                    var P = S(e(E, r, n, o, a, i).map(function(e) {
                                        return e.value
                                    }));
                                    Array.isArray(P) || (P = [P]), c.push.apply(c, ai(P.map(function(e) {
                                        return {
                                            type: +("string" != typeof e),
                                            value: e
                                        }
                                    })))
                                }
                                if (5 === h.type) {
                                    var x = m,
                                        j = (Object.prototype.hasOwnProperty.call(h.options, x) ? h.options[x] : void 0) || h.options.other;
                                    if (!j) throw new af(h.value, m, Object.keys(h.options), l);
                                    c.push.apply(c, ai(e(j.value, r, n, o, a)));
                                    continue
                                }
                                if (6 === h.type) {
                                    var A = "=".concat(m),
                                        I = Object.prototype.hasOwnProperty.call(h.options, A) ? h.options[A] : void 0;
                                    if (!I) {
                                        if (!Intl.PluralRules) throw new as('Intl.PluralRules is not available in this environment.\nTry polyfilling it using "@formatjs/intl-pluralrules"\n', "MISSING_INTL_API", l);
                                        var _ = (void 0 === m ? "undefined" : al(m)) === "bigint" ? Number(m) : m,
                                            T = n.getPluralRules(r, {
                                                type: h.pluralType
                                            }).select(_ - (h.offset || 0));
                                        I = (Object.prototype.hasOwnProperty.call(h.options, T) ? h.options[T] : void 0) || h.options.other
                                    }
                                    if (!I) throw new af(h.value, m, Object.keys(h.options), l);
                                    var N = (void 0 === m ? "undefined" : al(m)) === "bigint" ? Number(m) : m;
                                    c.push.apply(c, ai(e(I.value, r, n, o, a, N - (h.offset || 0))));
                                    continue
                                }
                            }
                        } catch (e) {
                            s = !0, f = e
                        } finally {
                            try {
                                u || null == d.return || d.return()
                            } finally {
                                if (s) throw f
                            }
                        }
                        return c.length < 2 ? c : c.reduce(function(e, t) {
                            var r = e[e.length - 1];
                            return r && 0 === r.type && 0 === t.type ? r.value += t.value : e.push(t), e
                        }, [])
                    }(n.ast, n.locales, n.formatters, n.formats, e, void 0, n.message)
                }, this.resolvedOptions = function() {
                    var e;
                    return {
                        locale: (null == (e = n.resolvedLocale) ? void 0 : e.toString()) || Intl.NumberFormat.supportedLocalesOf(n.locales)[0]
                    }
                }, this.getAst = function() {
                    return n.ast
                }, this.locales = o, this.resolvedLocale = e.resolveLocale(o), "string" == typeof t) {
                if (this.message = t, !e.__parse) throw TypeError("IntlMessageFormat.__parse must be set to process `message` of type `string`");
                var l, c, u = i || {},
                    s = (function(e) {
                        if (null == e) throw TypeError("Cannot destructure " + e)
                    }(u), at({}, u));
                this.ast = e.__parse(t, (l = ao({}, s), c = c = {
                    locale: this.resolvedLocale
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(l, Object.getOwnPropertyDescriptors(c)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(c)).forEach(function(e) {
                    Object.defineProperty(l, e, Object.getOwnPropertyDescriptor(c, e))
                }), l))
            } else this.ast = t;
            if (!Array.isArray(this.ast)) throw TypeError("A message must be provided as a String or AST.");
            this.formats = (r = e.formats, a ? Object.keys(r).reduce(function(e, t) {
                var n, o;
                return e[t] = (n = r[t], (o = a[t]) ? ao({}, n, o, Object.keys(n).reduce(function(e, t) {
                    return e[t] = ao({}, n[t], o[t]), e
                }, {})) : n), e
            }, ao({}, r)) : r), this.formatters = i && i.formatters || function() {
                var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {
                    number: {},
                    dateTime: {},
                    pluralRules: {}
                };
                return {
                    getNumberFormat: ou(function() {
                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                        return o7(Intl.NumberFormat, ai(t))
                    }, {
                        cache: ah(e.number),
                        strategy: oy.variadic
                    }),
                    getDateTimeFormat: ou(function() {
                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                        return o7(Intl.DateTimeFormat, ai(t))
                    }, {
                        cache: ah(e.dateTime),
                        strategy: oy.variadic
                    }),
                    getPluralRules: ou(function() {
                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                        return o7(Intl.PluralRules, ai(t))
                    }, {
                        cache: ah(e.pluralRules),
                        strategy: oy.variadic
                    })
                }
            }(this.formatterCache)
        }
        return ae(e, null, [{
            key: "defaultLocale",
            get: function() {
                return e.memoizedDefaultLocale || (e.memoizedDefaultLocale = new Intl.NumberFormat().resolvedOptions().locale), e.memoizedDefaultLocale
            }
        }]), e
    }()).memoizedDefaultLocale = null, m.resolveLocale = function(e) {
        if (void 0 !== Intl.Locale) {
            var t = Intl.NumberFormat.supportedLocalesOf(e);
            return new Intl.Locale(t.length > 0 ? t[0] : "string" == typeof e ? e : e[0])
        }
    }, m.__parse = function(e) {
        var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
            r = new o3(e, t = oL({
                shouldParseSkeletons: !0,
                requiresOtherClause: !0
            }, t)).parse();
        if (r.err) {
            var n = SyntaxError(oG[r.err.kind]);
            throw n.location = r.err.location, n.originalMessage = r.err.message, n
        }
        return (null == t ? void 0 : t.captureLocation) || function e(t) {
            t.forEach(function(t) {
                if (delete t.location, 5 === t.type || 6 === t.type)
                    for (var r in t.options) delete t.options[r].location, e(t.options[r].value);
                else 2 === t.type && oV(t.style) || (3 === t.type || 4 === t.type) && oW(t.style) ? delete t.style.location : 8 === t.type && e(t.children)
            })
        }(r.val), r.val
    }, m.formats = {
        number: {
            integer: {
                maximumFractionDigits: 0
            },
            currency: {
                style: "currency"
            },
            percent: {
                style: "percent"
            }
        },
        date: {
            short: {
                month: "numeric",
                day: "numeric",
                year: "2-digit"
            },
            medium: {
                month: "short",
                day: "numeric",
                year: "numeric"
            },
            long: {
                month: "long",
                day: "numeric",
                year: "numeric"
            },
            full: {
                weekday: "long",
                month: "long",
                day: "numeric",
                year: "numeric"
            }
        },
        time: {
            short: {
                hour: "numeric",
                minute: "numeric"
            },
            medium: {
                hour: "numeric",
                minute: "numeric",
                second: "numeric"
            },
            long: {
                hour: "numeric",
                minute: "numeric",
                second: "numeric",
                timeZoneName: "short"
            },
            full: {
                hour: "numeric",
                minute: "numeric",
                second: "numeric",
                timeZoneName: "short"
            }
        }
    }, m);

    function am(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function ab(e) {
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

    function av(e, t) {
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

    function ag(e, t) {
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
                if ("string" == typeof e) return am(e, t);
                var r = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return am(e, t)
            }
        }(e, t) || function() {
            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }

    function aO() {
        for (var e, t, r, n, o, a = arguments.length, i = Array(a), l = 0; l < a; l++) i[l] = arguments[l];
        var c = ag(i, 4),
            u = (c[0], c[1]),
            s = c[2],
            f = c[3];
        if (Array.isArray(u)) throw new ow(oS.INVALID_MESSAGE, void 0);
        if ("object" == (void 0 === u ? "undefined" : u && "u" > typeof Symbol && u.constructor === Symbol ? "symbol" : typeof u)) throw new ow(oS.INSUFFICIENT_PATH, void 0);
        if ("string" == typeof u) {
            var p = s || /'[{}<#|']/.test(u) ? void 0 : u;
            if (p) return p
        }
        var d = f.cache,
            h = f.formats,
            y = f.formatters,
            m = f.globalFormats,
            b = f.locale,
            v = f.timeZone;
        y.getMessageFormat || (y.getMessageFormat = oP(function() {
            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
            return new ay(t[0], t[1], t[2], ab({
                formatters: y
            }, t[3]))
        }, d.message));
        try {
            o = y.getMessageFormat(u, b, (e = ay.formats.date, t = ay.formats.time, r = ab({}, null == m ? void 0 : m.dateTime, null == h ? void 0 : h.dateTime), n = {
                date: ab({}, e, r),
                time: ab({}, t, r),
                number: ab({}, null == m ? void 0 : m.number, null == h ? void 0 : h.number)
            }, v && ["date", "time"].forEach(function(e) {
                var t = n[e],
                    r = !0,
                    o = !1,
                    a = void 0;
                try {
                    for (var i, l = Object.entries(t)[Symbol.iterator](); !(r = (i = l.next()).done); r = !0) {
                        var c = ag(i.value, 2),
                            u = c[0],
                            s = c[1];
                        t[u] = ab({
                            timeZone: v
                        }, s)
                    }
                } catch (e) {
                    o = !0, a = e
                } finally {
                    try {
                        r || null == l.return || l.return()
                    } finally {
                        if (o) throw a
                    }
                }
            }), n), {
                formatters: av(ab({}, y), {
                    getDateTimeFormat: function(e, t) {
                        var r;
                        return y.getDateTimeFormat(e, av(ab({}, t), {
                            timeZone: null != (r = null == t ? void 0 : t.timeZone) ? r : v
                        }))
                    }
                })
            })
        } catch (e) {
            throw new ow(oS.INVALID_MESSAGE, void 0)
        }
        var g = o.format(s);
        return (0, eA.isValidElement)(g) || Array.isArray(g) || "string" == typeof g ? g : String(g)
    }

    function aE(e, t) {
        return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
    }

    function aw(e) {
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

    function aS(e, t) {
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

    function aP() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        return t.filter(Boolean).join(".")
    }

    function ax(e) {
        return aP(e.namespace, e.key)
    }

    function aj(e) {
        console.error(e)
    }

    function aA(e, t, r, n) {
        var o = aP(n, r);
        if (!t) throw Error(o);
        var a = t;
        return r.split(".").forEach(function(t) {
            var r = a[t];
            if (null == t || null == r) throw Error(o + " (".concat(e, ")"));
            a = r
        }), a
    }
    aO.raw = !0;
    var aI = (0, eA.createContext)(void 0);

    function a_(e) {
        var t = e.children,
            r = e.formats,
            n = e.getMessageFallback,
            o = e.locale,
            a = e.messages,
            i = e.now,
            l = e.onError,
            c = e.timeZone,
            u = (0, eA.useContext)(aI),
            s = (0, eA.useMemo)(function() {
                return (null == u ? void 0 : u.cache) || {
                    dateTime: {},
                    number: {},
                    message: {},
                    relativeTime: {},
                    pluralRules: {},
                    list: {},
                    displayNames: {}
                }
            }, [o, null == u ? void 0 : u.cache]),
            f = (0, eA.useMemo)(function() {
                return (null == u ? void 0 : u.formatters) || {
                    getDateTimeFormat: ox(Intl.DateTimeFormat, s.dateTime),
                    getNumberFormat: ox(Intl.NumberFormat, s.number),
                    getPluralRules: ox(Intl.PluralRules, s.pluralRules),
                    getRelativeTimeFormat: ox(Intl.RelativeTimeFormat, s.relativeTime),
                    getListFormat: ox(Intl.ListFormat, s.list),
                    getDisplayNames: ox(Intl.DisplayNames, s.displayNames)
                }
            }, [s, null == u ? void 0 : u.formatters]),
            p = (0, eA.useMemo)(function() {
                var e, t, p, d, h, y, m;
                return y = function(e) {
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
                }({}, (t = (e = {
                    locale: o,
                    formats: void 0 === r ? null == u ? void 0 : u.formats : r,
                    getMessageFallback: n || (null == u ? void 0 : u.getMessageFallback),
                    messages: void 0 === a ? null == u ? void 0 : u.messages : a,
                    now: i || (null == u ? void 0 : u.now),
                    onError: l || (null == u ? void 0 : u.onError),
                    timeZone: c || (null == u ? void 0 : u.timeZone)
                }).formats, p = e.getMessageFallback, d = e.messages, h = e.onError, aS(aw({}, function(e, t) {
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
                }(e, ["formats", "getMessageFallback", "messages", "onError"])), {
                    formats: t || void 0,
                    messages: d || void 0,
                    onError: h || aj,
                    getMessageFallback: p || ax
                }))), m = m = {
                    formatters: f,
                    cache: s
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(y, Object.getOwnPropertyDescriptors(m)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(m)).forEach(function(e) {
                    Object.defineProperty(y, e, Object.getOwnPropertyDescriptor(m, e))
                }), y
            }, [s, r, f, n, o, a, i, l, u, c]);
        return (0, eN.jsx)(aI.Provider, {
            value: p,
            children: t
        })
    }

    function aT() {
        var e = (0, eA.useContext)(aI);
        if (!e) throw Error(void 0);
        return e
    }
    var aN = !1,
        aC = "u" < typeof window,
        aR = window.Roblox["core-lib"].index;

    function aU(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function aM(e) {
        return function(e) {
            if (Array.isArray(e)) return aU(e)
        }(e) || function(e) {
            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
        }(e) || function(e) {
            if (e) {
                if ("string" == typeof e) return aU(e, void 0);
                var t = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return aU(e, void 0)
            }
        }(e) || function() {
            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }
    aM(["ar-001", "de-de", "en-us", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn", "zh-cn", "zh-tw"]).concat(aM(["bg-bg", "bn-bd", "bs-ba", "cs-cz", "da-dk", "el-gr", "en-gb", "es-mx", "et-ee", "fi-fi", "fil-ph", "fr-ca", "hr-hr", "hu-hu", "ka-ge", "kk-kz", "km-kh", "lt-lt", "lv-lv", "ms-my", "my-mm", "nb-no", "nl-nl", "pt-pt", "ro-ro", "ru-ru", "si-lk", "sk-sk", "sl-sl", "sq-al", "sr-rs", "sv-se", "uk-ua"]));
    var ak = aM(["ar_001", "de_de", "en_us", "es_es", "fr_fr", "hi_in", "id_id", "it_it", "ja_jp", "ko_kr", "pl_pl", "pt_br", "th_th", "tr_tr", "vi_vn", "zh_cn", "zh_tw"]).concat(aM(["bg_bg", "bn_bd", "bs_ba", "cs_cz", "da_dk", "el_gr", "en_gb", "es_mx", "et_ee", "fi_fi", "fil_ph", "fr_ca", "hr_hr", "hu_hu", "ka_ge", "kk_kz", "km_kh", "lt_lt", "lv_lv", "ms_my", "my_mm", "nb_no", "nl_nl", "pt_pt", "ro_ro", "ru_ru", "si_lk", "sk_sk", "sl_sl", "sq_al", "sr_rs", "sv_se", "uk_ua"])),
        aD = aM(["ar-001", "de-DE", "en-US", "es-ES", "fr-FR", "hi-IN", "id-ID", "it-IT", "ja-JP", "ko-KR", "pl-PL", "pt-BR", "th-TH", "tr-TR", "vi-VN", "zh-CN", "zh-TW"]).concat(aM(["bg-BG", "bn-BD", "bs-BA", "cs-CZ", "da-DK", "el-GR", "en-GB", "es-MX", "et-EE", "fi-FI", "fil-PH", "fr-CA", "hr-HR", "hu-HU", "ka-GE", "kk-KZ", "km-KH", "lt-LT", "lv-LV", "ms-MY", "my-MM", "nb-NO", "nl-NL", "pt-PT", "ro-RO", "ru-RU", "si-LK", "sk-SK", "sl-SL", "sq-AL", "sr-RS", "sv-SE", "uk-UA"]));
    aM(["ar", "de", "es", "fr", "hi", "id", "it", "ja", "ko", "pl", "pt", "th", "tr", "vi"]).concat(aM(["ar-001", "de-de", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn"]));
    var aB = function(e) {
        return e.replaceAll(".", ":")
    };

    function aL(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }
    var aH = function() {
            if ("u" < typeof window) return {};
            var e = window.Roblox;
            return null != e ? e : {}
        },
        aF = function(e) {
            return Object.fromEntries(Object.entries(null != e ? e : {}).flatMap(function(e) {
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
                    }(e) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return aL(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return aL(e, 2)
                        }
                    }(e) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    r = t[0],
                    n = t[1];
                return null == n ? [] : [
                    [aB(r), n]
                ]
            }))
        },
        aG = function(e) {
            var t = aH(),
                r = t.Lang,
                n = t.LangDynamic,
                o = t.LangDynamicDefault;
            return Object.fromEntries(e.map(function(e) {
                return [aB(e), function(e) {
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
                }({}, aF(null == o ? void 0 : o[e]), aF(null == r ? void 0 : r[e]), aF(null == n ? void 0 : n[e]))]
            }))
        },
        aV = function(e) {
            var t, r, n = e.namespaces,
                o = e.locale,
                a = e.children,
                i = n.join(","),
                l = (0, eA.useMemo)(function() {
                    return aG(n)
                }, [i]);
            return (0, eN.jsx)(a_, {
                locale: null != o ? o : null != (t = null != (r = function() {
                    if (!("u" < typeof document)) {
                        var e = document.documentElement.lang;
                        if (e) return (0, aR.arrayIncludes)(aD, e) ? e.toLowerCase() : void 0
                    }
                }()) ? r : function() {
                    if ("u" < typeof document) return;
                    var e, t = document.querySelector('meta[name="locale-data"]');
                    if (null != (e = HTMLMetaElement) && "u" > typeof Symbol && e[Symbol.hasInstance] ? e[Symbol.hasInstance](t) : t instanceof e) {
                        var r = t.dataset.languageCode;
                        if (r && (0, aR.arrayIncludes)(ak, r)) return r.replace("_", "-")
                    }
                }()) ? t : "en-us",
                messages: l,
                children: a
            })
        },
        aW = (0, eA.createContext)(void 0),
        aX = function(e) {
            var t = e.useTranslate;
            return (0, e.render)(t())
        },
        aK = function(e) {
            var t = e.translate,
                r = e.namespaces,
                n = e.useTranslate,
                o = e.render,
                a = null != t ? t : (0, eA.useContext)(aW);
            return a ? (0, eN.jsx)(aW.Provider, {
                value: a,
                children: o(a)
            }) : (0, eN.jsx)(aV, {
                namespaces: r,
                children: (0, eN.jsx)(aX, {
                    useTranslate: n,
                    render: o
                })
            })
        };

    function az(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }
    var aY = "__FN_nvfToKPAOuiV__",
        aZ = new RegExp("".concat(aY, "(\\d+)\\|")),
        aq = function(e, t, r) {
            var n = function(e) {
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
                }({}, r),
                o = {};
            t.forEach(function(e, t) {
                var r = t.toString(),
                    a = "".concat(aY).concat(r, "|"),
                    i = "".concat("__FN_END_nvfToKPAOuiV__").concat(r, "|");
                n[e.opening] = a, n[e.closing] = i, o[r] = {
                    start: a,
                    end: i,
                    render: e.render,
                    used: !1
                }
            });
            var a = function(e) {
                    var t = [],
                        r = aZ.exec(e);
                    if (!r) return [e];
                    r.index > 0 && t.push(e.slice(0, r.index));
                    var n = null == r[1] ? void 0 : o[r[1]];
                    if (null == n) return null;
                    n.used = !0;
                    var i = e.indexOf(n.end);
                    if (i < r.index + r[0].length) return null;
                    var l = a(e.slice(r.index + r[0].length, i));
                    if (null == l) return null;
                    t.push(n.render(l));
                    var c = e.slice(i + n.end.length);
                    if (c.length > 0) {
                        var u = a(c);
                        if (null == u) return null;
                        t.push.apply(t, function(e) {
                            if (Array.isArray(e)) return az(e)
                        }(u) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(u) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return az(e, void 0);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return az(e, void 0)
                            }
                        }(u) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())
                    }
                    return t
                },
                i = a(e(n));
            return null == i || Object.values(o).some(function(e) {
                return !e.used
            }) ? null : i.filter(function(e) {
                return "" !== e
            }).map(function(e, t) {
                return (0, eN.jsx)(eA.Fragment, {
                    children: e
                }, t)
            })
        };

    function a$(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function aJ(e) {
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

    function aQ(e, t) {
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

    function a0(e, t) {
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
                if ("string" == typeof e) return a$(e, t);
                var r = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return a$(e, t)
            }
        }(e, t) || function() {
            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }

    function a1(e, t, r, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, o)
    }

    function a2() {
        return null != b || (b = "".concat(ei().apiGatewayUrl.replace(/\/$/, ""), "/experience-signals-ingest/public")), b
    }
    var a3 = function() {};

    function a6(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function a5(e) {
        return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
    }
    var a4 = function(e, t) {
            return e << 3 | t
        },
        a8 = a4(1, 2),
        a7 = a4(2, 2),
        a9 = a4(5, 2),
        ie = a4(6, 2),
        it = a4(8, 2),
        ir = a4(1, 2),
        io = a4(2, 1),
        ia = a4(3, 0),
        ii = a4(5, 2);
    a4(1, 2), a4(2, 1), a4(3, 0), a4(4, 2), a4(5, 2), a4(6, 0), a4(8, 2);
    var il = a4(4, 0),
        ic = a4(6, 2),
        iu = a4(7, 2);
    a4(1, 0), a4(2, 2);
    var is = a4(1, 2),
        ip = a4(2, 2),
        id = a4(1, 2);
    a4(1, 2), a4(2, 2), a4(1, 2);
    var ih = new TextEncoder,
        iy = function() {
            var e;

            function t() {
                var e;
                if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                e = [], "buf" in this ? Object.defineProperty(this, "buf", {
                    value: e,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : this.buf = e
            }
            return e = [{
                    key: "writeVarint",
                    value: function(e) {
                        var t = (void 0 === e ? "undefined" : a5(e)) === "bigint" ? e : BigInt(Math.trunc(e));
                        for (t < BigInt(0) && (t += BigInt(1) << BigInt(64)); t > BigInt(127);) this.buf.push(128 | Number(t & BigInt(127))), t >>= BigInt(7);
                        this.buf.push(Number(t))
                    }
                }, {
                    key: "writeString",
                    value: function(e) {
                        var t = ih.encode(e);
                        this.writeVarint(t.length);
                        var r = !0,
                            n = !1,
                            o = void 0;
                        try {
                            for (var a, i = t[Symbol.iterator](); !(r = (a = i.next()).done); r = !0) {
                                var l = a.value;
                                this.buf.push(l)
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
                }, {
                    key: "writeBytes",
                    value: function(e) {
                        this.writeVarint(e.length);
                        var t = !0,
                            r = !1,
                            n = void 0;
                        try {
                            for (var o, a = e[Symbol.iterator](); !(t = (o = a.next()).done); t = !0) {
                                var i = o.value;
                                this.buf.push(i)
                            }
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
                }, {
                    key: "writeDouble",
                    value: function(e) {
                        var t = new DataView(new ArrayBuffer(8));
                        t.setFloat64(0, e, !0);
                        for (var r = 0; r < 8; r += 1) this.buf.push(t.getUint8(r))
                    }
                }, {
                    key: "toBytes",
                    value: function() {
                        return new Uint8Array(this.buf)
                    }
                }],
                function(e, t) {
                    for (var r = 0; r < t.length; r++) {
                        var n = t[r];
                        n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                    }
                }(t.prototype, e), t
        }();

    function im(e, t, r) {
        var n = new iy;
        return n.writeVarint(a4(1, 2)), n.writeString(e), n.writeVarint(t), r(n), n.toBytes()
    }

    function ib(e) {
        var t = new iy;
        if (t.writeVarint(ir), t.writeString(e.name), t.writeVarint(io), t.writeDouble(e.value), t.writeVarint(ia), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
            var r = function(e) {
                var t = new iy,
                    r = !0,
                    n = !1,
                    o = void 0;
                try {
                    for (var a, i = Object.entries(e)[Symbol.iterator](); !(r = (a = i.next()).done); r = !0) ! function() {
                        var e, r = (e = a.value, function(e) {
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
                            }(e) || function(e) {
                                if (e) {
                                    if ("string" == typeof e) return a6(e, 2);
                                    var t = Object.prototype.toString.call(e).slice(8, -1);
                                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return a6(e, 2)
                                }
                            }(e) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }()),
                            n = r[0],
                            o = r[1];
                        if ("string" == typeof o) {
                            var i = im(n, a4(2, 2), function(e) {
                                e.writeString(o)
                            });
                            t.writeVarint(a9), t.writeBytes(i)
                        } else if ("boolean" == typeof o) {
                            var l = im(n, a4(2, 0), function(e) {
                                e.writeVarint(+!!o)
                            });
                            t.writeVarint(ie), t.writeBytes(l)
                        } else if ((void 0 === o ? "undefined" : a5(o)) === "bigint") {
                            var c = im(n, a4(2, 0), function(e) {
                                e.writeVarint(o)
                            });
                            t.writeVarint(a7), t.writeBytes(c)
                        } else if ("number" == typeof o)
                            if (Number.isFinite(o))
                                if (Number.isInteger(o) && o >= -0x80000000 && o <= 0x7fffffff) {
                                    var u = im(n, a4(2, 0), function(e) {
                                        e.writeVarint(o)
                                    });
                                    t.writeVarint(a8), t.writeBytes(u)
                                } else if (Number.isInteger(o)) {
                            var s = im(n, a4(2, 0), function(e) {
                                e.writeVarint(BigInt(o))
                            });
                            t.writeVarint(a7), t.writeBytes(s)
                        } else {
                            var f = im(n, a4(2, 1), function(e) {
                                e.writeDouble(o)
                            });
                            t.writeVarint(it), t.writeBytes(f)
                        } else {
                            var p = im(n, a4(2, 2), function(e) {
                                e.writeString(String(o))
                            });
                            t.writeVarint(a9), t.writeBytes(p)
                        }
                    }()
                } catch (e) {
                    n = !0, o = e
                } finally {
                    try {
                        r || null == i.return || i.return()
                    } finally {
                        if (n) throw o
                    }
                }
                return t.toBytes()
            }(e.attributes);
            t.writeVarint(ii), t.writeBytes(r)
        }
        return t.toBytes()
    }

    function iv(e, t, r) {
        var n = new iy;
        n.writeVarint(il), n.writeVarint(r);
        var o = !0,
            a = !1,
            i = void 0;
        try {
            for (var l, c = e[Symbol.iterator](); !(o = (l = c.next()).done); o = !0) {
                var u = l.value;
                n.writeVarint(ic), n.writeBytes(u)
            }
        } catch (e) {
            a = !0, i = e
        } finally {
            try {
                o || null == c.return || c.return()
            } finally {
                if (a) throw i
            }
        }
        var s = !0,
            f = !1,
            p = void 0;
        try {
            for (var d, h = t[Symbol.iterator](); !(s = (d = h.next()).done); s = !0) {
                var y = d.value;
                n.writeVarint(iu), n.writeBytes(y)
            }
        } catch (e) {
            f = !0, p = e
        } finally {
            try {
                s || null == h.return || h.return()
            } finally {
                if (f) throw p
            }
        }
        return n.toBytes()
    }

    function ig(e) {
        var t = new iy;
        t.writeVarint(is), t.writeString("eventstream.enginetelemetry.EngineTelemetryBatchEvent"), t.writeVarint(ip), t.writeBytes(e);
        var r = t.toBytes(),
            n = new iy;
        return n.writeVarint(id), n.writeBytes(r), n.toBytes()
    }
    var iO = /^[a-zA-Z_][a-zA-Z0-9_]*$/;

    function iE(e) {
        return iO.test(e)
    }
    var iw = [],
        iS = !1,
        iP = !1;

    function ix(e, t) {
        var r, n, o, a = e.map(function(e) {
                return {
                    name: e.name,
                    value: e.value,
                    timestampMs: e.timestampMs,
                    attributes: e.attributes
                }
            }),
            i = BigInt(Date.now());
        !0 === t || iP || "u" > typeof document && "hidden" === document.visibilityState ? (r = ig(iv(a.map(ib), [], i)).buffer, fetch("".concat(a2()).concat("/v1/events/single"), {
            method: "POST",
            headers: {
                "Content-Type": "application/x-protobuf"
            },
            body: r,
            credentials: "include",
            keepalive: !0
        }).catch(a3)) : (n = ig(iv(a.map(ib), [], i)), (o = function() {
            var e, t, r, o, a, i, l, c, u, s, f, p, d;
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
            }(this, function(h) {
                switch (h.label) {
                    case 0:
                        if ("u" < typeof CompressionStream) return [2, {
                            body: n.buffer,
                            compressed: !1
                        }];
                        return (t = (e = new CompressionStream("gzip")).writable.getWriter()).write(n).catch(a3), t.close().catch(a3), r = [], [4, (o = e.readable.getReader()).read()];
                    case 1:
                        a = h.sent(), h.label = 2;
                    case 2:
                        if (a.done) return [3, 4];
                        return r.push(a.value), [4, o.read()];
                    case 3:
                        return a = h.sent(), [3, 2];
                    case 4:
                        i = new Uint8Array(r.reduce(function(e, t) {
                            return e + t.length
                        }, 0)), l = 0, c = !0, u = !1, s = void 0;
                        try {
                            for (f = r[Symbol.iterator](); !(c = (p = f.next()).done); c = !0) d = p.value, i.set(d, l), l += d.length
                        } catch (e) {
                            u = !0, s = e
                        } finally {
                            try {
                                c || null == f.return || f.return()
                            } finally {
                                if (u) throw s
                            }
                        }
                        return [2, {
                            body: i.buffer,
                            compressed: !0
                        }]
                }
            })
        }, function() {
            var e = this,
                t = arguments;
            return new Promise(function(r, n) {
                var a = o.apply(e, t);

                function i(e) {
                    a1(a, r, n, i, l, "next", e)
                }

                function l(e) {
                    a1(a, r, n, i, l, "throw", e)
                }
                i(void 0)
            })
        })()).then(function(e) {
            var t = e.body,
                r = e.compressed,
                n = {
                    "Content-Type": "application/x-protobuf"
                };
            return r && (n["Content-Encoding"] = "gzip"), fetch("".concat(a2()).concat("/v1/events/single"), {
                method: "POST",
                headers: n,
                body: t,
                credentials: "include",
                keepalive: !0
            })
        }).catch(a3)
    }

    function ij() {
        var e = !0,
            t = !1,
            r = void 0;
        try {
            for (var n, o = iw[Symbol.iterator](); !(e = (n = o.next()).done); e = !0) {
                var a = n.value.splice(0);
                0 !== a.length && ix(a, !0)
            }
        } catch (e) {
            t = !0, r = e
        } finally {
            try {
                e || null == o.return || o.return()
            } finally {
                if (t) throw r
            }
        }
    }
    var iA = "WwwCommon",
        iI = function(e) {
            var t = e.publish,
                r = e.captureException,
                n = e.featureName;

            function o(e, t, o) {
                if (null != o) {
                    var a, i = (null != (a = Error) && "u" > typeof Symbol && a[Symbol.hasInstance] ? !!a[Symbol.hasInstance](o) : o instanceof a) ? o.name || "Error" : "UnknownError",
                        l = n ? "".concat(n, "_").concat(e) : e;
                    return null == r || r(o, {
                        error_counter: l
                    }), aQ(aJ({}, t), {
                        errorType: i
                    })
                }
                return t
            }
            return {
                trackCounter: function() {
                    for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                    var o = a0(r, 2);
                    t(o[0], o[1])
                },
                trackError: function() {
                    for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                    var a = a0(r, 3),
                        i = a[0],
                        l = a[1],
                        c = a[2],
                        u = o(i, aQ(aJ({}, null != l ? l : {}), {
                            severity: "error"
                        }), c);
                    t(i, u)
                },
                trackCriticalError: function() {
                    for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                    var a = a0(r, 3),
                        i = a[0],
                        l = a[1],
                        c = a[2],
                        u = o(i, aQ(aJ({}, null != l ? l : {}), {
                            severity: "critical"
                        }), c);
                    t(i, u)
                }
            }
        }({
            publish: function(e) {
                var t, r = Math.max(1, 10),
                    n = 250;

                function o(e, t) {
                    console.error(e, t)
                }
                if (!iE(e)) return o('@rbx/web-telemetry: invalid featureName "'.concat(e, '"'), {
                        name: e
                    }),
                    function() {};
                var a = [];
                return iw.push(a), iS || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                        "hidden" === document.visibilityState && ij()
                    }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                        iP = !0, ij()
                    }), iS = !0),
                    function(i, l, c) {
                        var u = "".concat(e, "_").concat(i);
                        if (! function(e, t) {
                                if (!iE(e)) return !1;
                                if (t) {
                                    var r = !0,
                                        n = !1,
                                        o = void 0;
                                    try {
                                        for (var a, i = Object.keys(t)[Symbol.iterator](); !(r = (a = i.next()).done); r = !0) {
                                            var l = a.value;
                                            if (!iE(l)) return !1
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
                                return !0
                            }(u, l)) return void o("@rbx/web-telemetry: invalid event name or attribute key", {
                            name: i,
                            attributes: l
                        });
                        var s = null != c ? c : 1;
                        if (!Number.isFinite(s)) return void o("@rbx/web-telemetry: value must be a finite number", {
                            name: i,
                            attributes: l
                        });
                        var f = l && Object.keys(l).length > 0 ? l : void 0;
                        a.push({
                            name: u,
                            attributes: f,
                            value: s,
                            timestampMs: BigInt(Date.now())
                        }), a.length >= r ? (void 0 !== t && (clearTimeout(t), t = void 0), ix(a.splice(0, r))) : void 0 === t && (t = setTimeout(function() {
                            for (t = void 0; a.length > 0;) ix(a.splice(0, r))
                        }, n))
                    }
            }(iA)
        });
    iI.trackCounter;
    var i_ = iI.trackError;
    iI.trackCriticalError;
    var iT = function() {
            if ("u" > typeof document) {
                var e = document.querySelector('meta[name="page-meta"]');
                return null == e ? void 0 : e.dataset.internalPageName
            }
        },
        iN = function(e, t, r) {
            var n;
            "u" > typeof window && i_(e, {
                key: r,
                namespace: t,
                internalPageName: null != (n = iT()) ? n : "unknown"
            })
        },
        iC = function(e) {
            var t, r, n, o, a, i, l, c, u, s, f, p, d, h = (t = aB(e), r = {
                "!": aT().messages
            }, n = t ? "!.".concat(t) : "!", a = (o = aT()).cache, i = o.formats, l = o.formatters, c = o.getMessageFallback, u = o.locale, s = o.onError, f = o.timeZone, p = r["!"], d = "!" === n ? void 0 : n.slice(2), f || aN || !aC || (aN = !0, s(new ow(oS.ENVIRONMENT_FALLBACK, void 0))), (0, eA.useMemo)(function() {
                var e, t;
                return t = function(e, t, r) {
                        try {
                            if (!t) throw Error(void 0);
                            var n = r ? aA(e, t, r) : t;
                            if (!n) throw Error(r);
                            return n
                        } catch (e) {
                            return new ow(oS.MISSING_MESSAGE, e.message)
                        }
                    }((e = {
                        cache: a,
                        formatters: l,
                        getMessageFallback: c,
                        messages: p,
                        namespace: d,
                        onError: s,
                        formats: i,
                        locale: u,
                        timeZone: f
                    }).locale, e.messages, e.namespace),
                    function(e) {
                        var t = e.cache,
                            r = e.formats,
                            n = e.formatters,
                            o = e.getMessageFallback,
                            a = void 0 === o ? ax : o,
                            i = e.locale,
                            l = e.messagesOrError,
                            c = e.namespace,
                            u = e.onError,
                            s = e.timeZone,
                            f = aE(l, ow);

                        function p(e, t, r, n) {
                            var o = new ow(t, r);
                            return u(o), null != n ? n : a({
                                error: o,
                                key: e,
                                namespace: c
                            })
                        }

                        function d(e, o, d, h) {
                            var y, m, b;
                            if (f) {
                                if (!h) return u(l), a({
                                    error: l,
                                    key: e,
                                    namespace: c
                                });
                                y = h
                            } else try {
                                y = aA(i, l, e, c)
                            } catch (t) {
                                if (!h) return p(e, oS.MISSING_MESSAGE, t.message, h);
                                y = h
                            }
                            try {
                                var v, g = aP(c, e);
                                return aO(g, y, o ? (v = {}, Object.keys(o).forEach(function(e) {
                                    var t, r = 0,
                                        n = o[e];
                                    t = "function" == typeof n ? function(t) {
                                        var o = n(t);
                                        return (0, eA.isValidElement)(o) ? (0, eA.cloneElement)(o, {
                                            key: e + r++
                                        }) : o
                                    } : n, v[e] = t
                                }), v) : o, {
                                    cache: t,
                                    formatters: n,
                                    globalFormats: r,
                                    formats: d,
                                    locale: i,
                                    timeZone: s
                                })
                            } catch (t) {
                                return aE(t, ow) ? (m = t.code, b = t.originalMessage) : (m = oS.FORMATTING_ERROR, b = t.message), p(e, m, b, h)
                            }
                        }

                        function h(e, t, r, n) {
                            var o = d(e, t, r, n);
                            return "string" != typeof o ? p(e, oS.INVALID_MESSAGE, void 0) : o
                        }
                        return h.rich = d, h.markup = function(e, t, r, n) {
                            return d(e, t, r, n)
                        }, h.raw = function(e) {
                            if (f) return u(l), a({
                                error: l,
                                key: e,
                                namespace: c
                            });
                            try {
                                return aA(i, l, e, c)
                            } catch (t) {
                                return p(e, oS.MISSING_MESSAGE, t.message)
                            }
                        }, h.has = function(e) {
                            if (f) return !1;
                            try {
                                return aA(i, l, e, c), !0
                            } catch (e) {
                                return !1
                            }
                        }, h
                    }(aS(aw({}, e), {
                        messagesOrError: t
                    }))
            }, [a, l, c, p, d, s, i, u, f]));
            return (0, eA.useMemo)(function() {
                return Object.assign(function(e, t) {
                    return h(aB(e), t)
                }, {
                    rich: function(e, t) {
                        return h.rich(aB(e), t)
                    },
                    has: function(e) {
                        return h.has(aB(e))
                    },
                    dynamic: function(t, r) {
                        var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "",
                            o = aB(t),
                            a = h.has(o);
                        return a || iN("TranslationKeyNotFound", e, o), a ? h(o, r) : n
                    },
                    html: function(t, r, n) {
                        var o = aB(t);
                        if (!h.has(o)) return iN("TranslationKeyNotFound", e, o), null;
                        var a = aq(function(e) {
                            return h(o, e)
                        }, r, n);
                        return null == a && iN("TranslationMalformed", e, o), a
                    }
                })
            }, [h, e])
        },
        iR = function(e) {
            return e
        },
        iU = ["Purchasing.PurchaseDialog", "Authentication.TwoStepVerification", "Feature.RobloxSubscription", "Feature.NotApproved", "IAPExperience.PurchaseError"].map(iR);
    ["Feature.Item", "CommonUI.Messages"].map(iR), ["Feature.ItemModel"].map(iR);
    var iM = function() {
        var e;
        return e = [iC(iR("Purchasing.PurchaseDialog")), iC(iR("Authentication.TwoStepVerification")), iC(iR("Feature.RobloxSubscription")), iC(iR("Feature.NotApproved")), iC(iR("IAPExperience.PurchaseError"))],
            function(t, r) {
                var n = e.find(function(e) {
                    return e.has(t)
                });
                return n ? n(t, r) : ""
            }
    };

    function ik(e) {
        var t = e.translate,
            r = e.price,
            n = e.color,
            o = void 0 === n ? "" : n,
            a = e.useFreeText;
        return 0 === r && (void 0 === a || a) ? (0, eN.jsx)("span", {
            className: "text-robux text-free",
            children: t(oo)
        }) : (0, eN.jsxs)(eI().Fragment, {
            children: [(0, eN.jsx)("span", {
                className: "icon-robux".concat(o ? "-".concat(o) : "", "-16x16")
            }), (0, eN.jsx)("span", {
                className: "text-robux",
                children: (0, ef.formatNumber)(r)
            })]
        })
    }

    function iD(e) {
        var t = e.translate,
            r = function(e, t) {
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
            }(e, ["translate"]);
        return (0, eN.jsx)(aK, {
            translate: t,
            namespaces: iU,
            useTranslate: iM,
            render: function(e) {
                var t, n;
                return (0, eN.jsx)(ik, (t = function(e) {
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
                }({}, r), n = n = {
                    translate: e
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(n)).forEach(function(e) {
                    Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(n, e))
                }), t))
            }
        })
    }
    var iB = function(e) {
        var t = e.translate,
            r = e.thumbnail,
            n = e.assetName,
            o = e.expectedPrice,
            a = e.displayPrice,
            i = e.priceSuffix,
            l = (e.thumbnailSizePx, e.rentalOptionDays),
            c = void 0 === l ? null : l,
            u = e.discountInformation,
            s = (null == u ? void 0 : u.originalPrice) != null && u.originalPrice > o;
        return (0, eN.jsxs)("div", {
            className: "flex flex-row items-center gap-large",
            children: [(0, eN.jsxs)("div", {
                className: "relative shrink-0 unified-modal-thumbnail-container",
                style: {
                    maxWidth: "40vw",
                    maxHeight: "40vw"
                },
                children: [(0, eN.jsx)("div", {
                    className: "rounded",
                    style: {
                        width: "100%",
                        height: "100%",
                        backgroundColor: "rgba(255,255,255,0.06)"
                    }
                }), (0, eN.jsx)("div", {
                    className: "absolute unified-modal-thumbnail",
                    style: {
                        inset: 0,
                        display: "flex",
                        alignItems: "center",
                        justifyContent: "center"
                    },
                    children: r
                })]
            }), (0, eN.jsxs)("div", {
                className: "min-w-0 flex flex-col gap-small",
                children: [(0, eN.jsx)("span", {
                    className: "text-body-large break-words",
                    children: (0, eN.jsx)(oc, {
                        name: n
                    })
                }), null != c && c > 0 && (0, eN.jsxs)("div", {
                    className: "flex flex-row items-center gap-small",
                    children: [(0, eN.jsx)(eH, {
                        name: "icon-regular-clock"
                    }), (0, eN.jsx)("span", {
                        children: t(oa, {
                            days: c
                        }) || "".concat(c, " days (Timer starts when you buy)")
                    })]
                }), function() {
                    if (s) {
                        var e;
                        return (0, eN.jsxs)("div", {
                            className: "flex flex-row items-center flex-wrap gap-x-small",
                            children: [(0, eN.jsxs)("span", {
                                className: "flex flex-row items-center",
                                children: [(0, eN.jsx)(iD, {
                                    translate: t,
                                    price: o,
                                    color: "",
                                    useFreeText: !1
                                }), i && (0, eN.jsx)("span", {
                                    className: "text-robux",
                                    children: i
                                })]
                            }), (0, eN.jsxs)("span", {
                                className: "flex flex-row items-center",
                                style: {
                                    textDecoration: "line-through",
                                    opacity: .6
                                },
                                children: [(0, eN.jsx)(iD, {
                                    translate: t,
                                    price: null != (e = u.originalPrice) ? e : 0,
                                    color: "",
                                    useFreeText: !1
                                }), i && (0, eN.jsx)("span", {
                                    className: "text-robux",
                                    children: i
                                })]
                            })]
                        })
                    }
                    return a ? (0, eN.jsx)("div", {
                        className: "flex flex-row items-center",
                        children: (0, eN.jsxs)("span", {
                            className: "text-robux",
                            children: [a, i]
                        })
                    }) : (0, eN.jsxs)("div", {
                        className: "flex flex-row items-center",
                        children: [(0, eN.jsx)(iD, {
                            translate: t,
                            price: o,
                            color: "",
                            useFreeText: !1
                        }), i && (0, eN.jsx)("span", {
                            className: "text-robux",
                            children: i
                        })]
                    })
                }()]
            })]
        })
    };

    function iL(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }
    var iH = (0, eA.createContext)(null),
        iF = (0, eA.createContext)(null),
        iG = {
            XSmall: "min-height-600",
            Small: "min-height-800",
            Medium: "min-height-1000",
            Large: "min-height-1200"
        },
        iV = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-xsmall",
            Medium: "padding-y-small",
            Large: "padding-y-small"
        },
        iW = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium",
            Large: "text-title-large"
        },
        iX = {
            XSmall: "size-300",
            Small: "size-400",
            Medium: "size-500",
            Large: "size-600"
        },
        iK = (0, eA.forwardRef)(function(e, t) {
            var r = e.children,
                n = e.className,
                o = e.size,
                a = void 0 === o ? "Medium" : o,
                i = e.hasDivider,
                l = void 0 !== i && i,
                c = e.isContained,
                u = void 0 !== c && c,
                s = e.isDisabled,
                f = void 0 !== s && s,
                p = (0, eA.useMemo)(function() {
                    return {
                        size: a,
                        hasDivider: l,
                        isContained: u,
                        isDisabled: f
                    }
                }, [a, l, u, f]);
            return eI().createElement(iH.Provider, {
                value: p
            }, eI().createElement("div", {
                ref: t,
                className: eC("foundation-web-accordion", "flex flex-col items-start width-full", l && "[&>*:not(:last-child)]:[border-bottom:1px_solid_var(--color-stroke-default)]", n)
            }, r))
        }),
        iz = (0, eA.forwardRef)(function(e, t) {
            var r, n = e.children,
                o = e.className,
                a = e.isDisabled,
                i = void 0 !== a && a,
                l = e.defaultOpen,
                c = e.isOpen,
                u = e.onOpenChange,
                s = (0, eA.useContext)(iH),
                f = function(e) {
                    if (Array.isArray(e)) return e
                }(r = (0, eA.useState)(void 0 !== l && l)) || function(e) {
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
                        if ("string" == typeof e) return iL(e, 2);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return iL(e, 2)
                    }
                }(r) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }(),
                p = f[0],
                d = f[1],
                h = null != c ? c : p,
                y = nn("fui-a-");
            if (!s) throw Error("AccordionItem must be used within Accordion");
            var m = s.isContained,
                b = s.isDisabled,
                v = (0, eA.useCallback)(function(e) {
                    i || b || (void 0 === c && d(e), null == u || u(e))
                }, [i, b, c, u]),
                g = (0, eA.useMemo)(function() {
                    return {
                        isOpen: h,
                        setOpen: v,
                        isDisabled: i,
                        triggerId: "".concat(y, "-trigger"),
                        contentId: "".concat(y, "-content")
                    }
                }, [h, v, i, y]);
            return eI().createElement(iF.Provider, {
                value: g
            }, eI().createElement("div", {
                ref: t,
                "data-contained": m,
                "data-state": h ? "open" : "closed",
                className: eC("foundation-web-accordion-item", "width-full", o)
            }, n))
        }),
        iY = function(e) {
            var t = e.children,
                r = e.className,
                n = (0, eA.useContext)(iH),
                o = (0, eA.useContext)(iF);
            if (!n) throw Error("AccordionItemTrigger must be used within Accordion");
            if (!o) throw Error("AccordionItemTrigger must be used within AccordionItem");
            var a = n.size,
                i = n.isContained,
                l = n.isDisabled,
                c = o.isOpen,
                u = o.setOpen,
                s = o.isDisabled,
                f = l || s;
            return eI().createElement("button", {
                id: o.triggerId,
                type: "button",
                className: eC(eR, "relative flex items-center justify-between gap-small cursor-pointer content-default bg-none stroke-none width-full", iG[a], iV[a], i ? "padding-x-medium" : "padding-x-none", f && ["opacity-[0.5]", "pointer-events-none"], r),
                "aria-expanded": c,
                "aria-controls": o.contentId,
                onClick: function(e) {
                    e.preventDefault(), f || u(!c)
                }
            }, eI().createElement(eU, null), eI().createElement("div", {
                className: "flex items-center min-width-0 grow-1"
            }, eI().createElement("span", {
                className: eC("text-align-x-left", iW[a])
            }, t)), eI().createElement("span", {
                className: eC("foundation-web-accordion-chevron shrink-0", iX[a], "icon icon-regular-chevron-large-down", "motion-safe:transition-transform duration-200"),
                style: {
                    transform: c ? "rotate(180deg)" : "rotate(0deg)"
                }
            }))
        },
        iZ = function(e) {
            var t, r, n = e.children,
                o = e.className,
                a = (0, eA.useContext)(iH),
                i = (0, eA.useContext)(iF);
            if (!a) throw Error("AccordionItemContent must be used within Accordion");
            if (!i) throw Error("AccordionItemContent must be used within AccordionItem");
            var l = a.size,
                c = i.isOpen ? {} : {
                    inert: "inert"
                };
            return eI().createElement("div", (t = function(e) {
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
                id: i.contentId,
                role: "region",
                "aria-labelledby": i.triggerId,
                "aria-hidden": !i.isOpen,
                "data-state": i.isOpen ? "open" : "closed",
                "data-size": l.toLowerCase()
            }, c), r = r = {
                className: eC("foundation-web-accordion-content grid clip width-full motion-safe:transition-all duration-200 ease-standard-out")
            }, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(r)) : (function(e) {
                var t = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var r = Object.getOwnPropertySymbols(e);
                    t.push.apply(t, r)
                }
                return t
            })(Object(r)).forEach(function(e) {
                Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(r, e))
            }), t), eI().createElement("div", {
                className: eC("foundation-web-accordion-content-inner width-full min-height-0 clip padding-top-none padding-bottom-none motion-safe:transition-transform duration-200", !i.isOpen && "pointer-events-none", o)
            }, n))
        };

    function iq(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function i$(e) {
        return function(e) {
            if (Array.isArray(e)) return iq(e)
        }(e) || function(e) {
            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
        }(e) || function(e) {
            if (e) {
                if ("string" == typeof e) return iq(e, void 0);
                var t = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return iq(e, void 0)
            }
        }(e) || function() {
            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }
    var iJ = "__FN_nvfToKPAOuiV__",
        iQ = new RegExp("".concat(iJ, "(\\d+)\\|")),
        i0 = function(e, t, r, n) {
            var o = function(e) {
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
                    n = "".concat(iJ).concat(r, "|"),
                    i = "".concat("__FN_END_nvfToKPAOuiV__").concat(r, "|");
                o[e.opening] = n, o[e.closing] = i, a[r] = {
                    start: n,
                    end: i,
                    render: e.render,
                    used: !1
                }
            });
            var i = e(t, o),
                l = function(e) {
                    var r = [],
                        n = iQ.exec(e);
                    if (!n) return [e];
                    n.index > 0 && r.push(e.slice(0, n.index));
                    var o = n[1] && a[n[1]];
                    if (!o) return console.warn("Unexpected malformed segment", t), [];
                    o.used = !0;
                    var i = e.indexOf(o.end);
                    if (-1 === i) return console.warn("Unexpected malformed segment", t), [];
                    var c = e.slice(n.index + n[0].length, i),
                        u = o.render(l(c));
                    Array.isArray(u) ? r.push.apply(r, i$(u)) : r.push(u);
                    var s = e.slice(i + o.end.length);
                    return s.length > 0 && r.push.apply(r, i$(l(s))), r
                },
                c = l(i).filter(function(e) {
                    return "" !== e
                });
            return Object.values(a).some(function(e) {
                return !e.used
            }) ? (console.warn("Unused segments found", t), []) : c.map(function(e, t) {
                return (0, eN.jsx)(eA.Fragment, {
                    children: e
                }, t)
            })
        };

    function i1(e) {
        return !!(null == e ? void 0 : e.some(function(e) {
            return "ROBLOX_PLUS" === e.discountType || "BlackbirdSubscription" === e.discountCampaign || "RobloxPlusSubscription" === e.discountCampaign || "RobloxSubscription" === e.discountCampaign
        }))
    }
    var i2 = String.fromCodePoint(57346),
        i3 = RegExp("".concat(i2, "|\\\\u\\{E002\\}|\\\\uE002"), "gi"),
        i6 = function(e) {
            var t = e.text,
                r = e.className,
                n = e.id;
            return (0, eN.jsx)("span", {
                id: n,
                className: eC("inline", r),
                children: function(e) {
                    if (i3.lastIndex = 0, !i3.test(e)) return [e];
                    for (var t = [], r = 0, n = RegExp(i3.source, "gi"), o = n.exec(e); o;) {
                        var a = o.index;
                        a > r && t.push(e.slice(r, a)), t.push((0, eN.jsx)("span", {
                            className: "icon-robux-16x16 inline-block align-text-bottom",
                            "aria-hidden": !0
                        }, "robux-icon-".concat(a))), r = a + o[0].length, o = n.exec(e)
                    }
                    return r < e.length && t.push(e.slice(r)), t
                }(t)
            })
        };

    function i5(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }
    var i4 = function(e) {
            var t = e.amount,
                r = Math.abs(t);
            return (0, eN.jsxs)(eI().Fragment, {
                children: [t < 0 && (0, eN.jsx)("span", {
                    className: "text-robux",
                    children: "-"
                }), (0, eN.jsx)("span", {
                    className: "icon-robux-16x16"
                }), (0, eN.jsx)("span", {
                    className: "text-robux",
                    children: (0, ef.formatNumber)(r)
                })]
            })
        },
        i8 = function(e) {
            var t, r = e.translate,
                n = e.normalizedDiscount,
                o = e.savingsSummary,
                a = n.savedAmount,
                i = n.originalPrice,
                l = n.totalPrice,
                c = n.discountLines,
                u = function(e) {
                    if (Array.isArray(e)) return e
                }(t = (0, eA.useState)(!1)) || function(e) {
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
                        if ("string" == typeof e) return i5(e, 2);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return i5(e, 2)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }(),
                s = u[0],
                f = u[1],
                p = i1(c),
                d = null == o ? void 0 : o.trim(),
                h = [{
                    opening: "amountStart",
                    closing: "amountEnd",
                    render: function() {
                        return (0, eN.jsx)(i4, {
                            amount: a
                        })
                    }
                }],
                y = function(e) {
                    var t;
                    return i1([e]) ? e.localizedAttribution ? (0, eN.jsx)(i6, {
                        text: e.localizedAttribution
                    }) : r("Label.PlusBenefitDiscount", {
                        discountPercent: String(null != (t = e.discountPercent) ? t : 0)
                    }) : (0, eN.jsx)(i6, {
                        text: e.label
                    })
                };
            return (0, eN.jsx)(iK, {
                className: "text-body-medium padding-none stroke-default stroke-thick radius-medium",
                children: (0, eN.jsxs)(iz, {
                    isOpen: s,
                    onOpenChange: f,
                    children: [(0, eN.jsx)(iY, {
                        className: eC("!padding-medium bg-shift-100 width-full flex flex-row items-center justify-between", s && "[border-bottom-left-radius:0] [border-bottom-right-radius:0]"),
                        children: (0, eN.jsxs)("div", {
                            className: "flex flex-row items-center gap-x-small content-emphasis",
                            children: [p && !d && (0, eN.jsx)(eH, {
                                name: "icon-regular-roblox-plus",
                                size: "Medium"
                            }), (0, eN.jsx)("span", {
                                children: d ? (0, eN.jsx)(i6, {
                                    text: d
                                }) : p ? i0(r, "Description.SavingWithPlus", h, {
                                    robuxAmount: (0, ef.formatNumber)(a)
                                }) : r("Description.SavingRobux", {
                                    robuxAmount: (0, ef.formatNumber)(a)
                                })
                            })]
                        })
                    }), (0, eN.jsxs)(iZ, {
                        className: "!padding-none",
                        children: [(0, eN.jsxs)("div", {
                            className: "padding-medium padding-bottom-small flex flex-col gap-y-small bg-shift-100 stroke-default stroke-thick",
                            style: {
                                borderTop: "0px",
                                borderLeft: "0px",
                                borderRight: "0px"
                            },
                            children: [(0, eN.jsxs)("div", {
                                className: "flex flex-row items-center justify-between content-default",
                                children: [(0, eN.jsx)("span", {
                                    children: r("Label.Subtotal")
                                }), (0, eN.jsx)("span", {
                                    className: "flex flex-row items-center",
                                    children: (0, eN.jsx)(i4, {
                                        amount: i
                                    })
                                })]
                            }), c.map(function(e, t) {
                                var r;
                                return (0, eN.jsxs)("div", {
                                    className: "flex flex-row items-center justify-between content-default",
                                    children: [(0, eN.jsx)("span", {
                                        children: y(e)
                                    }), (0, eN.jsx)("span", {
                                        className: "flex flex-row items-center",
                                        children: (0, eN.jsx)(i4, {
                                            amount: -e.discountAmount
                                        })
                                    })]
                                }, "".concat(null != (r = e.discountCampaign) ? r : "discount", "-").concat(t))
                            })]
                        }), (0, eN.jsxs)("div", {
                            className: "padding-medium flex flex-row items-center justify-between text-heading-small content-default bg-shift-100",
                            children: [(0, eN.jsx)("span", {
                                children: r("Label.Total")
                            }), (0, eN.jsx)("span", {
                                className: "flex flex-row items-center",
                                children: (0, eN.jsx)(i4, {
                                    amount: l
                                })
                            })]
                        })]
                    })]
                })
            })
        },
        i7 = function(e) {
            var t = e.robuxAmount,
                r = e.price;
            return (0, eN.jsx)("div", {
                className: "rounded-xxlarge radius-medium border padding-medium",
                style: {
                    borderColor: "var(--content-action-standard)"
                },
                children: (0, eN.jsxs)("div", {
                    className: "flex flex-row items-center justify-between gap-medium",
                    children: [(0, eN.jsxs)("div", {
                        className: "flex flex-row items-center",
                        children: [(0, eN.jsx)("span", {
                            className: "icon-robux-16x16"
                        }), (0, eN.jsx)("span", {
                            className: "text-heading-small margin-left-xsmall",
                            children: (0, ef.formatNumber)(t)
                        })]
                    }), (0, eN.jsx)("div", {
                        className: "text-label-large",
                        children: r
                    })]
                })
            })
        };

    function i9(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }
    var le = function(e, t) {
        (0, eA.useEffect)(function() {
            t && (0, eE.fireEvent)("".concat("RenderTracking", "-").concat("Purchase", "-").concat(e))
        }, [t])
    };

    function lt(e, t, r, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, o)
    }

    function lr(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function ln(e, t, r, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, o)
    }

    function lo(e) {
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

    function la(e, t) {
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
                if ("string" == typeof e) return lr(e, t);
                var r = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return lr(e, t)
            }
        }(e, t) || function() {
            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }
    var li = function(e) {
            var t, r, n, o, a, i, l, c, u, s, f, p, d, h, y, m, b, v, g, O, E, w, P, x, j, A, I, _, T, N, R, U, M, k, D, B, L, H = e.translate,
                F = e.expectedPrice,
                G = e.thumbnail,
                V = e.assetName,
                W = e.onAction,
                X = e.onCancel,
                K = e.loading,
                z = e.currentRobuxBalance,
                Y = e.open,
                Z = void 0 !== Y && Y,
                q = e.robuxPackageAmount,
                $ = e.robuxPackagePrice,
                J = e.intl,
                Q = e.priceSuffix,
                ee = e.title,
                et = e.discountInformation,
                er = e.collectibleItemId,
                en = e.rentalOptionDays,
                ei = e.isLimited,
                el = e.packageLoading,
                ec = void 0 !== el && el,
                es = e.onRefetchPackage,
                ef = e.onAcceptOffers,
                ep = e.onDirectPurchase,
                ed = (0, eA.useCallback)(function(e) {
                    null == es || es(null != e ? e : F)
                }, [es, F]),
                eh = (n = void 0 === (r = (t = {
                    collectibleItemId: void 0 === er ? null : er,
                    rentalOptionDays: void 0 === en ? null : en,
                    expectedPrice: F,
                    isLimitedItem: void 0 !== ei && ei,
                    open: Z,
                    onPriceResolved: ed
                }).collectibleItemId) ? null : r, a = void 0 === (o = t.rentalOptionDays) ? null : o, i = t.expectedPrice, l = t.isLimitedItem, u = void 0 !== (c = t.open) && c, s = t.onPriceResolved, f = null != i && i <= 0 || void 0 !== l && l, d = (p = la((0, eA.useState)([]), 2))[0], h = p[1], y = (0, eA.useRef)([]), (0, eA.useEffect)(function() {
                    y.current = d
                }, [d]), b = (m = la((0, eA.useState)(), 2))[0], v = m[1], O = (g = la((0, eA.useState)(void 0), 2))[0], E = g[1], P = (w = la((0, eA.useState)(), 2))[0], x = w[1], A = (j = la((0, eA.useState)(!1), 2))[0], I = j[1], _ = (0, eA.useRef)(0), T = (0, eA.useRef)(s), (0, eA.useEffect)(function() {
                    T.current = s
                }, [s]), N = (0, eA.useCallback)(function(e) {
                    var t;
                    return (t = function() {
                        var t, r, o, i, l, c, u, s, p, d;
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
                        }(this, function(y) {
                            var m, b, g, O;
                            switch (y.label) {
                                case 0:
                                    if (!n || f) return [2];
                                    t = _.current + 1, _.current = t, I(!0), y.label = 1;
                                case 1:
                                    return y.trys.push([1, , 3, 4]), [4, (m = lo({
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
                                    } : {}), (b = function() {
                                        var e, t, r;
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
                                        }(this, function(n) {
                                            switch (n.label) {
                                                case 0:
                                                    e = {
                                                        url: "".concat(ea.EnvironmentUrls.apiGatewayUrl, "/marketplace-sales/v1/cart-pricing"),
                                                        withCredentials: !0
                                                    }, n.label = 1;
                                                case 1:
                                                    return n.trys.push([1, 3, , 4]), [4, eo.post(e, m)];
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
                                            var o = b.apply(e, t);

                                            function a(e) {
                                                lt(o, r, n, a, i, "next", e)
                                            }

                                            function i(e) {
                                                lt(o, r, n, a, i, "throw", e)
                                            }
                                            a(void 0)
                                        })
                                    })())];
                                case 2:
                                    if (p = y.sent(), t !== _.current) return [2];
                                    if (!p) return x(void 0), [2];
                                    return (null == (d = null != (r = null == (l = p.items) ? void 0 : l.find(function(e) {
                                        return e.collectibleItemId === n
                                    })) ? r : null == (c = p.items) ? void 0 : c[0]) ? void 0 : d.priceInRobux) != null && v(d.priceInRobux), E(null != (o = null == d ? void 0 : d.discountInformation) ? o : null), x((null == (u = p.savingsSummary) ? void 0 : u.trim()) || void 0), null == (s = T.current) || s.call(T, null != (i = null == d ? void 0 : d.priceInRobux) ? i : void 0), h(null != (O = null == (g = p.availableOffers) ? void 0 : g.reduce(function(e, t) {
                                        var r, n, o = null == (r = t.localizedDescription) ? void 0 : r.trim();
                                        return t.offerId && o && e.push({
                                            offerId: t.offerId,
                                            localizedText: o,
                                            selected: null != (n = t.selected) && n
                                        }), e
                                    }, [])) ? O : []), [3, 4];
                                case 3:
                                    return t === _.current && I(!1), [7];
                                case 4:
                                    return [2]
                            }
                        })
                    }, function() {
                        var e = this,
                            r = arguments;
                        return new Promise(function(n, o) {
                            var a = t.apply(e, r);

                            function i(e) {
                                ln(a, n, o, i, l, "next", e)
                            }

                            function l(e) {
                                ln(a, n, o, i, l, "throw", e)
                            }
                            i(void 0)
                        })
                    })()
                }, [n, a, f]), (0, eA.useEffect)(function() {
                    if (!u) {
                        _.current += 1, v(void 0), E(void 0), x(void 0), h([]), I(!1);
                        return
                    }
                    n && !f && N().catch(function() {})
                }, [u, n, f, N]), R = (0, eA.useCallback)(function(e, t) {
                    var r = y.current.map(function(r) {
                        var n, o;
                        return r.offerId === e ? (n = lo({}, r), o = o = {
                            selected: t
                        }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(o)) : (function(e) {
                            var t = Object.keys(e);
                            if (Object.getOwnPropertySymbols) {
                                var r = Object.getOwnPropertySymbols(e);
                                t.push.apply(t, r)
                            }
                            return t
                        })(Object(o)).forEach(function(e) {
                            Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(o, e))
                        }), n) : r
                    });
                    y.current = r, h(r);
                    var n = r.filter(function(e) {
                        return !e.selected
                    }).map(function(e) {
                        return e.offerId
                    });
                    N(n.length ? n : void 0).catch(function() {})
                }, [N]), U = (0, eA.useMemo)(function() {
                    return d.filter(function(e) {
                        return e.selected
                    }).map(function(e) {
                        return e.offerId
                    })
                }, [d]), {
                    offerSelections: d,
                    resolvedPrice: b,
                    resolvedDiscountInformation: O,
                    resolvedSavingsSummary: P,
                    isPricingLoading: A,
                    selectedOfferIds: U,
                    handleOfferCheckedChange: R
                }),
                ey = eh.offerSelections,
                em = eh.resolvedPrice,
                eb = eh.resolvedDiscountInformation,
                ev = eh.resolvedSavingsSummary,
                eg = eh.isPricingLoading,
                eO = eh.selectedOfferIds,
                eE = eh.handleOfferCheckedChange,
                ew = null != em ? em : F,
                eS = void 0 !== eb ? eb : et,
                eP = (0, eA.useMemo)(function() {
                    var e, t, r, n, o, a, i;
                    return eS ? (a = null != (e = eS.originalPrice) ? e : 0, {
                        savedAmount: i = null != (t = null != (r = eS.totalDiscountAmount) ? r : eS.totalAmountSaved) ? t : 0,
                        originalPrice: a,
                        totalPrice: a - i,
                        discountLines: null != (n = null == (o = eS.discounts) ? void 0 : o.map(function(e, t) {
                            var r, n, o, a, i = null != (r = null != (n = e.discountAmount) ? n : e.robuxDiscountAmount) ? r : 0,
                                l = (null == (a = e.localizedDiscountAttribution) ? void 0 : a.trim()) || void 0,
                                c = l || e.discountCampaign || "Discount ".concat(t + 1);
                            return {
                                discountAmount: i,
                                discountCampaign: e.discountCampaign || e.discountId || "line-".concat(t),
                                discountType: e.discountType,
                                label: c,
                                localizedAttribution: l,
                                discountPercent: null != (o = e.discountPercentage) ? o : e.robuxDiscountPercentage
                            }
                        })) ? n : []
                    }) : null
                }, [eS]),
                ex = null != z && ew <= z;
            le("UnifiedRobuxUpsellModal", Z);
            var ej = null != ee ? ee : H(C),
                e_ = H("Action.Buy"),
                eT = (D = (k = function(e) {
                    if (Array.isArray(e)) return e
                }(M = (0, eA.useState)(!1)) || function(e) {
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
                }(M) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return i9(e, 2);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return i9(e, 2)
                    }
                }(M) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }())[0], B = k[1], (0, eA.useEffect)(function() {
                    var e;
                    (e = ea.EnvironmentUrls.apiGatewayUrl, {
                        getDmccaLegalTextFeature: function() {
                            return eo.get({
                                retryable: !0,
                                withCredentials: !0,
                                url: "".concat(e, "/access-management/v1/upsell-feature-access?featureName=").concat("ShouldUseDMCCALegalDisclosure")
                            }).then(function(e) {
                                return "Granted" === e.data.access
                            })
                        }
                    }).getDmccaLegalTextFeature().then(function(e) {
                        e && B(!0)
                    }).catch(function(e) {
                        console.warn("Failed to fetch DMCCA feature", e)
                    })
                }, []), L = eu.urlService.getUrlWithLocale(S, J.getRobloxLocale()) + (D ? "#robux-and-premium-membership" : ""), i0(H, "Message.TermsOfUse", [{
                    opening: "aTagStart",
                    closing: "aTagEnd",
                    render: function(e) {
                        return eI().createElement("a", {
                            href: L,
                            target: "_blank",
                            rel: "noreferrer",
                            className: "underline"
                        }, e)
                    }
                }])),
                eC = (0, eA.useCallback)(function() {
                    var e = {
                        purchasePrice: ew,
                        offerIds: eO
                    };
                    ex && ep ? ep(e) : ef ? ef(e) : W()
                }, [ew, eO, ex, ep, ef, W]);
            return (0, eN.jsx)(r7, {
                open: Z,
                onOpenChange: function(e) {
                    !e && X && X()
                },
                isModal: !0,
                size: "Large",
                type: "Default",
                closeLabel: H("Action.Close") || "Close",
                hasCloseAffordance: !0,
                children: (0, eN.jsxs)(r9, {
                    className: "relative width-full",
                    children: [(0, eN.jsxs)(ne, {
                        className: "gap-large flex flex-col",
                        children: [(0, eN.jsx)("div", {
                            className: "margin-bottom-xsmall",
                            children: (0, eN.jsx)(ol, {
                                translate: H,
                                titleText: ej,
                                currentRobuxBalance: z
                            })
                        }), (0, eN.jsx)(iB, {
                            translate: H,
                            thumbnail: G,
                            assetName: V,
                            expectedPrice: ew,
                            priceSuffix: Q,
                            discountInformation: eS
                        }), ey.map(function(e) {
                            var t = "upsell-offer-label-".concat(e.offerId);
                            return (0, eN.jsxs)("label", {
                                htmlFor: "upsell-offer-checkbox-".concat(e.offerId),
                                className: "flex flex-row items-start gap-x-small self-start cursor-pointer",
                                children: [(0, eN.jsx)(nG, {
                                    id: "upsell-offer-checkbox-".concat(e.offerId),
                                    "aria-labelledby": t,
                                    placement: "Start",
                                    size: "Small",
                                    isChecked: e.selected,
                                    onCheckedChange: function(t) {
                                        eE(e.offerId, !0 === t)
                                    },
                                    isDisabled: eg || ec,
                                    "data-testid": "upsell-promo-checkbox-".concat(e.offerId)
                                }), (0, eN.jsx)(i6, {
                                    id: t,
                                    text: e.localizedText,
                                    className: "text-body-medium content-default"
                                })]
                            }, e.offerId)
                        }), eP && eP.savedAmount > 0 && (0, eN.jsx)(i8, {
                            translate: H,
                            normalizedDiscount: eP,
                            savingsSummary: ev
                        }), !ex && null != q && null != $ && (0, eN.jsx)(i7, {
                            robuxAmount: q,
                            price: $
                        })]
                    }), (0, eN.jsx)(nt, {
                        className: "gap-small flex flex-col mt-[40px]",
                        children: (0, eN.jsxs)("div", {
                            className: "flex flex-col items-center text-center width-full gap-medium",
                            children: [(0, eN.jsx)(on, {
                                variant: "Emphasis",
                                className: "width-full shrink-0",
                                onClick: eC,
                                isDisabled: void 0 !== K && K || eg || ec,
                                "data-testid": "purchase-confirm-button",
                                children: e_
                            }), (0, eN.jsx)("div", {
                                className: "text-body-small",
                                children: eT
                            })]
                        })
                    })]
                })
            })
        },
        ll = function(e) {
            var t = e.translate,
                r = function(e, t) {
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
                }(e, ["translate"]);
            return (0, eN.jsx)(aK, {
                translate: t,
                namespaces: iU,
                useTranslate: iM,
                render: function(e) {
                    var t, n;
                    return (0, eN.jsx)(li, (t = function(e) {
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
                    }({}, r), n = n = {
                        translate: e
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(n)).forEach(function(e) {
                        Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(n, e))
                    }), t))
                }
            })
        },
        lc = function(e) {
            var t = e.translate,
                r = e.expectedPrice,
                n = e.thumbnail,
                o = e.assetName,
                a = e.onAction,
                i = e.onCancel,
                l = e.loading,
                c = e.currentRobuxBalance,
                u = e.open,
                s = void 0 !== u && u;
            return le("UnifiedRobuxUpsellTooExpensiveModal", s), (0, eN.jsx)(r7, {
                open: s,
                onOpenChange: function(e) {
                    !e && i && i()
                },
                isModal: !0,
                size: "Large",
                type: "Default",
                closeLabel: t("Action.Close") || "Close",
                hasCloseAffordance: !0,
                children: (0, eN.jsxs)(r9, {
                    className: "relative width-full",
                    children: [(0, eN.jsxs)(ne, {
                        className: "gap-large flex flex-col",
                        children: [(0, eN.jsx)("div", {
                            className: "margin-bottom-xsmall",
                            children: (0, eN.jsx)(ol, {
                                translate: t,
                                titleText: t(k),
                                currentRobuxBalance: c
                            })
                        }), (0, eN.jsx)(iB, {
                            translate: t,
                            thumbnail: n,
                            assetName: o,
                            expectedPrice: r
                        })]
                    }), (0, eN.jsx)(nt, {
                        className: "gap-small flex flex-col mt-[40px]",
                        children: (0, eN.jsx)("div", {
                            className: "flex flex-row-reverse",
                            children: (0, eN.jsx)(on, {
                                "aria-label": t(k),
                                variant: "Emphasis",
                                className: " fill",
                                onClick: a,
                                isDisabled: void 0 !== l && l,
                                "data-testid": "purchase-confirm-button",
                                children: (0, eN.jsxs)("div", {
                                    className: "fill basis-0 inline-flex items-center gap-medium leading-none",
                                    children: [(0, eN.jsx)(eH, {
                                        name: "icon-filled-arrow-up-right-from-square",
                                        className: "align-middle"
                                    }), t(R)]
                                })
                            })
                        })
                    })]
                })
            })
        },
        lu = function(e) {
            var t = e.translate,
                r = function(e, t) {
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
                }(e, ["translate"]);
            return (0, eN.jsx)(aK, {
                translate: t,
                namespaces: iU,
                useTranslate: iM,
                render: function(e) {
                    var t, n;
                    return (0, eN.jsx)(lc, (t = function(e) {
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
                    }({}, r), n = n = {
                        translate: e
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(n)).forEach(function(e) {
                        Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(n, e))
                    }), t))
                }
            })
        },
        ls = function(e) {
            var t = document.createElement("div");
            document.body.appendChild(t);
            var r = function() {
                    eT().unmountComponentAtNode(t), t.remove()
                },
                n = function() {
                    var t;
                    r(), null == (t = e.onCancel) || t.call(e)
                },
                o = function() {
                    var t;
                    !1 !== (null == (t = e.onAccept) ? void 0 : t.call(e)) && n()
                };
            if ("tooExpensive" === e.variant) {
                var a = eI().createElement(lu, {
                    expectedPrice: e.expectedPrice,
                    thumbnail: e.thumbnail,
                    assetName: e.assetName,
                    onAction: o,
                    onCancel: n,
                    open: !0,
                    loading: !1,
                    currentRobuxBalance: e.currentRobuxBalance
                });
                return eT().render(a, t), {
                    close: n,
                    updatePackage: function() {},
                    setPackageLoading: function() {}
                }
            }
            var i = e.upsellProduct,
                l = !1,
                c = e.onAcceptOffers ? function(t) {
                    var r;
                    !1 !== (null == (r = e.onAcceptOffers) ? void 0 : r.call(e, t)) && n()
                } : void 0,
                u = e.onDirectPurchase ? function(t) {
                    var n;
                    null == (n = e.onDirectPurchase) || n.call(e, t), r()
                } : void 0,
                s = function() {
                    var r = eI().createElement(ll, {
                        expectedPrice: e.expectedPrice,
                        thumbnail: e.thumbnail,
                        assetName: e.assetName,
                        assetType: e.assetType,
                        assetTypeDisplayName: e.assetTypeDisplayName,
                        onAction: o,
                        onCancel: n,
                        open: !0,
                        loading: !1,
                        currentRobuxBalance: e.currentRobuxBalance,
                        robuxPackageAmount: null == i ? void 0 : i.robux_amount,
                        robuxPackagePrice: null == i ? void 0 : i.price,
                        packageLoading: l,
                        priceSuffix: e.priceSuffix,
                        title: e.title,
                        discountInformation: e.discountInformation,
                        collectibleItemId: e.collectibleItemId,
                        rentalOptionDays: e.rentalOptionDays,
                        isLimited: e.isLimited,
                        onRefetchPackage: e.onRefetchPackage,
                        onAcceptOffers: c,
                        onDirectPurchase: u
                    });
                    eT().render(r, t)
                };
            return s(), {
                close: n,
                updatePackage: function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                    e && (i = e), l = t, s()
                },
                setPackageLoading: function(e) {
                    l = e, s()
                }
            }
        };

    function lf(e, t, r) {
        return t in e ? Object.defineProperty(e, t, {
            value: r,
            enumerable: !0,
            configurable: !0,
            writable: !0
        }) : e[t] = r, e
    }
    var lp = function() {
        var e;

        function t() {
            var e = this;
            if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
            lf(this, "overlayDiv", null), lf(this, "contentDiv", null), lf(this, "loadingMessageSpan", null), lf(this, "spinnerSpan", null), lf(this, "loadingOverlayElementId", "loading-overlay"), lf(this, "_loadingMessage", void 0), lf(this, "show", function(t) {
                var r = e.getOrCreateOverlayDiv(),
                    n = e.getOrCreateContentDiv(r);
                return e.getOrCreateSpinnerSpan(n), e.updateOrCreateMessage(t), e
            }), lf(this, "hide", function() {
                var t, r, n, o, a, i, l, c;
                null == (r = e.spinnerSpan) || null == (t = r.parentNode) || t.removeChild(e.spinnerSpan), null == (o = e.loadingMessageSpan) || null == (n = o.parentNode) || n.removeChild(e.loadingMessageSpan), null == (i = e.contentDiv) || null == (a = i.parentNode) || a.removeChild(e.contentDiv), null == (c = e.overlayDiv) || null == (l = c.parentNode) || l.removeChild(e.overlayDiv), e.overlayDiv = null, e.contentDiv = null, e.spinnerSpan = null, e.loadingMessageSpan = null
            }), lf(this, "updateMessage", function(t) {
                e._loadingMessage = t, e.updateOrCreateMessage(t)
            }), lf(this, "updateOrCreateMessage", function(t) {
                if (e.overlayDiv) {
                    if (!t) {
                        var r, n;
                        null == (n = e.loadingMessageSpan) || null == (r = n.parentNode) || r.removeChild(e.loadingMessageSpan), e.loadingMessageSpan = null;
                        return
                    }
                    if (e.loadingMessageSpan) e.loadingMessageSpan.innerText = t;
                    else {
                        var o = document.createElement("span");
                        o.innerText = t, o.classList.add("loading-message"), e.getOrCreateContentDiv(e.overlayDiv).appendChild(o), e.loadingMessageSpan = o
                    }
                }
            }), lf(this, "getOrCreateContentDiv", function(t) {
                if (e.contentDiv) return e.contentDiv;
                var r = document.createElement("div");
                return r.classList.add("loading-overlay-content"), e.contentDiv = r, t.appendChild(r), r
            }), lf(this, "getOrCreateOverlayDiv", function() {
                if (e.overlayDiv) return e.overlayDiv;
                var t = document.getElementById(e.loadingOverlayElementId);
                if (t) return e.overlayDiv = t, t;
                var r = document.createElement("div");
                return e.overlayDiv = r, r.id = e.loadingOverlayElementId, r.classList.add("loading-overlay"), document.body.appendChild(r), r
            }), lf(this, "getOrCreateSpinnerSpan", function(t) {
                if (e.spinnerSpan) return e.spinnerSpan;
                var r = document.createElement("span");
                return r.classList.add("spinner", "spinner-default"), t.appendChild(r), e.spinnerSpan = r, r
            })
        }
        return e = [{
                key: "loadingMessage",
                get: function() {
                    return this._loadingMessage
                }
            }],
            function(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var n = t[r];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                }
            }(t.prototype, e), t
    }();

    function ld(e, t, r, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, o)
    }

    function lh(e) {
        w.upsellUtil.expireUpsellCookie(), window.location.href = E.Endpoints.getAbsoluteUrl(e)
    }

    function ly() {
        var e;
        return (e = function() {
            var e;
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
            }(this, function(t) {
                switch (t.label) {
                    case 0:
                        return e = {
                            url: "".concat(ea.EnvironmentUrls.apiGatewayUrl).concat("/vng-payments/v1/getVngShopUrl"),
                            withCredentials: !0
                        }, [4, eo.get(e)];
                    case 1:
                        return [2, t.sent().data.vngShopRedirectUrl]
                }
            })
        }, function() {
            var t = this,
                r = arguments;
            return new Promise(function(n, o) {
                var a = e.apply(t, r);

                function i(e) {
                    ld(a, n, o, i, l, "next", e)
                }

                function l(e) {
                    ld(a, n, o, i, l, "throw", e)
                }
                i(void 0)
            })
        })()
    }

    function lm() {
        (0, E.DeviceMeta)().isDesktop && (0, E.DeviceMeta)().isUniversalApp ? ly().then(function(e) {
            return window.open(e, "_self")
        }).catch(function() {
            return window.open(ea.EnvironmentUrls.vngGamesShopUrl, "_self")
        }) : ly().then(function(e) {
            return window.open(e, "_blank")
        }).catch(function() {
            return window.open(ea.EnvironmentUrls.vngGamesShopUrl, "_blank")
        })
    }

    function lb(e, t, r, n) {
        var o = "<span>".concat(r.get("Message.PurchaseSucceededRobuxBalance", {
                userRobuxBalance: ep(t)
            }), "</span>"),
            a = "<div class='item-content'>\n        <div class='item-card-container item-preview'>\n          <div class='item-card-thumb'>\n            <img alt='item preview' src='".concat(e.itemThumbnailUrl, "'/>\n          </div>\n        </div>\n        <div class='text-center'>\n          ").concat(r.get("Message.PurchaseSucceeded", {
                assetName: e.assetName
            }), "\n          ").concat(o, "\n        </div>\n      </div>"),
            i = e.assetType === _ || "Subscription" === e.assetType,
            l = i ? r.get(L, {}) : r.get("Action.EquipMyAvatar", {});
        E.Dialog.open({
            titleText: r.get("Heading.PurchaseSucceeded", {}),
            bodyContent: a,
            declineText: r.get("Action.BackToShop", {}),
            acceptText: l,
            acceptColor: "btn-primary-md",
            onAccept: function() {
                w.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(w.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, w.paymentFlowAnalyticsService.ENUM_VIEW_NAME.SUCCESS, w.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, w.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.OK, {
                    item_type: e.assetType,
                    item_id: e.productId
                }, !0), eS("AutoPurchaseSucceedEquipMyAvatar", e.assetType);
                var t, r = e.itemPath;
                return ((null === E.Endpoints || void 0 === E.Endpoints ? void 0 : E.Endpoints.supportLocalizedUrls) && (r = E.Endpoints.removeUrlLocale(r)), i) ? r.startsWith(x) ? lh("".concat(e.itemPath, "?#!/store")) : lh(e.itemPath) : void 0 !== (t = E.Endpoints.getAbsoluteUrl("/my/avatar")) && "" !== t && (w.upsellUtil.expireUpsellCookie(), window.location.href = t), !1
            },
            onDecline: function() {
                return n.show(), w.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(w.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, w.paymentFlowAnalyticsService.ENUM_VIEW_NAME.SUCCESS, w.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, w.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.CANCEL, {
                    item_type: e.assetType,
                    item_id: e.productId
                }, !0), eS("AutoPurchaseSucceedBackToShop", e.assetType), lh(e.itemPath), !1
            },
            onCancel: function() {
                return n.show(), w.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(w.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, w.paymentFlowAnalyticsService.ENUM_VIEW_NAME.SUCCESS, w.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, w.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.CANCEL, {
                    item_type: e.assetType,
                    item_id: e.productId
                }, !0), eS("AutoPurchaseSucceedClose", e.assetType), lh(e.itemPath), !1
            },
            allowHtmlContentInBody: !0,
            allowHtmlContentInFooter: !1,
            fieldValidationRequired: !0,
            showDecline: !i,
            dismissable: !1,
            xToCancel: !0
        })
    }

    function lv(e, t) {
        E.Dialog.open({
            titleText: t.get("Heading.ErrorOccured", {}),
            bodyContent: t.get("Message.PurchaseErrorOccured", {}),
            imageUrl: e.alertImageUrl,
            acceptText: t.get(L, {}),
            acceptColor: "btn-secondary-md",
            declineColor: "btn-none",
            dismissable: !0,
            allowHtmlContentInBody: !0
        })
    }

    function lg(e, t, r, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, o)
    }

    function lO(e) {
        return function() {
            var t = this,
                r = arguments;
            return new Promise(function(n, o) {
                var a = e.apply(t, r);

                function i(e) {
                    lg(a, n, o, i, l, "next", e)
                }

                function l(e) {
                    lg(a, n, o, i, l, "throw", e)
                }
                i(void 0)
            })
        }
    }

    function lE(e, t) {
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

    function lw(e, t, r, n) {
        return lO(function() {
            var o, a, i, l, c, u, s, f, p, d, h, y;
            return lE(this, function(m) {
                var b, v, g;
                switch (m.label) {
                    case 0:
                        o = {
                            url: e,
                            withCredentials: !0,
                            retryable: !1,
                            noCache: !0,
                            noPragma: !0
                        }, m.label = 1;
                    case 1:
                        return m.trys.push([1, 3, , 4]), c = function(e) {
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
                            expectedCurrency: t.expectedCurrency,
                            expectedPrice: t.expectedPrice,
                            expectedSellerId: t.expectedSellerId,
                            expectedPromoId: t.expectedPromoId,
                            userAssetId: t.userAssetId,
                            collectibleItemId: null == (a = t.itemDetail) ? void 0 : a.collectibleItemId,
                            collectibleProductId: null == (i = t.itemDetail) ? void 0 : i.collectibleProductId,
                            expectedPurchaserId: E.CurrentUser.userId,
                            expectedPurchaserType: "User",
                            idempotencyKey: ey()
                        }, (null == (l = t.offerIds) ? void 0 : l.length) ? {
                            offerIds: t.offerIds
                        } : {}), [4, eo.post(o, c)];
                    case 2:
                        if (500 === (u = m.sent().data).statusCode) return eS("AutoPurchaseErrorFromPurchaseApi", t.assetType), void 0 === u.showDivID && (u.showDivID = u.showDivId), void 0 === u.AssetID && (u.AssetID = u.assetId), r.hide(), (0, E.ItemPurchase)().openErrorView(u), eg(), [2, Promise.resolve()];
                        return t.isLibrary && E.EventStream && E.UrlParser && (b = u.assetId, v = null === E.CurrentUser || void 0 === E.CurrentUser ? void 0 : E.CurrentUser.userId, s = {
                            assetId: b,
                            category: (g = E.UrlParser.getParametersAsObject()).Category,
                            creatorId: g.CreatorId,
                            genre: g.GenreCsv,
                            page: g.Page,
                            position: g.Position,
                            searchKeyword: g.SearchKeyword,
                            sortAggregation: g.SortAggregation,
                            sortType: g.SortType,
                            userId: v,
                            searchId: g.SearchId
                        }, E.EventStream.SendEventWithTarget("LibraryAssetAcquired", "Marketplace", s, E.EventStream.TargetTypes.WWW)), eS(et, t.assetType), r.hide(), f = t.userBalance - t.expectedPrice, lb(t, f, n, r), [2, Promise.resolve()];
                    case 3:
                        if (p = m.sent(), r.hide(), eS(er, t.assetType), d = p, (void 0 === p ? "undefined" : p && "u" > typeof Symbol && p.constructor === Symbol ? "symbol" : typeof p) != "object" || !("responseText" in d.request)) return [2, Promise.reject(d.request)];
                        if ("Bad Request" === (h = d.request).responseText) lv(t, n);
                        else try {
                            y = JSON.parse(h.responseText || ""), (0, E.ItemPurchase)().openErrorView(y), eg()
                        } catch (e) {
                            return [2, Promise.reject(e)]
                        }
                        return [2, Promise.reject(p)];
                    case 4:
                        return [2]
                }
            })
        })()
    }

    function lS(e) {
        var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : void 0,
            r = arguments.length > 2 ? arguments[2] : void 0,
            n = arguments.length > 3 ? arguments[3] : void 0;
        return lO(function() {
            var o, a, i, l, c, u, s, f, p;
            return lE(this, function(d) {
                if (null == (o = e.itemContainerElemClassList) ? void 0 : o.contains("btn-disabled-primary")) return [2, Promise.resolve()];
                if (l = "".concat(E.EnvironmentUrls.apiGatewayUrl).concat("/game-passes/v1/game-passes/{productId}/purchase".replace("{productId}", e.productId)), c = "".concat(E.EnvironmentUrls.economyApi).concat("/v1/purchases/products/{productId}".replace("{productId}", e.productId)), (null == (a = e.itemDetail) ? void 0 : a.collectibleItemId) && (s = e.itemDetail.collectibleItemInstanceId ? "/marketplace-sales/v1/item/{collectibleItemId}/purchase-resale" : "/marketplace-sales/v1/item/{collectibleItemId}/purchase-item", u = "".concat(E.EnvironmentUrls.apiGatewayUrl).concat(s.replace("{collectibleItemId}", e.itemDetail.collectibleItemId))), t) return [2, t({
                    productId: e.productId,
                    expectedPrice: e.expectedPrice,
                    expectedCurrency: e.expectedCurrency,
                    expectedPromoId: null == (f = e.expectedPromoId) ? void 0 : f.toString(),
                    expectedSellerId: e.expectedSellerId,
                    userAssetId: null == (p = e.userAssetId) ? void 0 : p.toString()
                })];
                if (eS("AutoPurchaseStarted", e.assetType), null == (i = e.itemDetail) ? void 0 : i.subscriptionTargetKey) {
                    var h;
                    return [2, (h = "".concat(E.EnvironmentUrls.apiGatewayUrl).concat("/v1/subscriptions/purchase-with-robux/{subscriptionTargetKey}".replace("{subscriptionTargetKey}", e.itemDetail.subscriptionTargetKey)), lO(function() {
                        var t, o, a;
                        return lE(this, function(i) {
                            switch (i.label) {
                                case 0:
                                    t = {
                                        url: h,
                                        withCredentials: !0,
                                        retryable: !1,
                                        noCache: !0,
                                        noPragma: !0
                                    }, i.label = 1;
                                case 1:
                                    return i.trys.push([1, 3, , 4]), [4, eo.post(t, {
                                        priceInRobux: e.expectedPrice,
                                        idempotencyKey: ey()
                                    })];
                                case 2:
                                    return i.sent(), eS(et, e.assetType), r.hide(), o = e.userBalance - e.expectedPrice, lb(e, o, n, r), [2, Promise.resolve()];
                                case 3:
                                    return a = i.sent(), r.hide(), eS(er, e.assetType), lv(e, n), [2, Promise.reject(a)];
                                case 4:
                                    return [2]
                            }
                        })
                    })())]
                }
                return e.assetType === _ ? [2, lw(l, e, r, n)] : u ? [2, lw(u, e, r, n)] : [2, lw(c, e, r, n)]
            })
        })()
    }

    function lP(e, t, r, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, o)
    }
    var lx = function(e) {
        var t = e.thumbnailImageUrl;
        return (0, eN.jsxs)("div", {
            className: "item-preview",
            style: {
                overflow: "hidden",
                maxWidth: "100%"
            },
            children: [(0, eN.jsx)("div", {
                className: "item-card-thumb",
                children: (0, eN.jsx)("img", {
                    alt: "item preview",
                    src: null != t ? t : "",
                    style: {
                        width: "150px",
                        height: "150px",
                        objectFit: "cover",
                        borderRadius: "8px"
                    }
                })
            }), (0, eN.jsx)("div", {
                className: "item-info text-name"
            })]
        })
    };

    function lj(e, t, r, n, o) {
        var a, i, l = function(e, t) {
            var r, n, o = w.upsellUtil.constants.UPSELL_TARGET_ITEM_URL_REGEX.exec(window.location.pathname);
            if (w.upsellUtil.constants.UPSELL_TARGET_ITEM_URL_REGEX.lastIndex = 0, Array.isArray(o) && o.length > 0 && (n = (function(e) {
                    if (Array.isArray(e)) return e
                }(o) || function(e) {
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
                }(o) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return eb(e, 1);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return eb(e, 1)
                    }
                }(o) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }())[0]), !n || !e || Object.keys(e).length < 4) return "";
            var a = ey(),
                i = "".concat(e.expectedCurrency, ",").concat(e.expectedPrice, ",").concat(e.expectedSellerId, ",").concat(null != (r = e.userassetId) ? r : ""),
                l = e.productId || "";
            l += ",".concat(e.collectibleItemId || ""), l += ",".concat(e.collectibleItemInstanceId || ""), l += ",".concat(e.collectibleProductId || ""), l += ",".concat(e.subscriptionTargetKey || ""), l += ",".concat(encodeURIComponent(e.itemName || ""));
            var c = "".concat(a, ",").concat(n, ",").concat(E.CurrentUser.userId, ",").concat(i, ",").concat(l),
                u = new Date;
            u.setHours(u.getHours() + 1);
            var s = [w.upsellUtil.constants.UPSELL_COOKIE_KEY, "=", encodeURIComponent(c), "; expires=".concat(u.toUTCString()), "; path=/", "; domain=.", ea.EnvironmentUrls.domain, ";"];
            document.cookie = s.join("");
            if (a && (null == t ? void 0 : t.length)) try {
                window.sessionStorage.setItem(em(a), JSON.stringify(t))
            } catch (e) {}
            return a
        }(r && null != n ? (a = function(e) {
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
        }({}, r), i = i = {
            expectedPrice: String(n)
        }, Object.getOwnPropertyDescriptors ? Object.defineProperties(a, Object.getOwnPropertyDescriptors(i)) : (function(e) {
            var t = Object.keys(e);
            if (Object.getOwnPropertySymbols) {
                var r = Object.getOwnPropertySymbols(e);
                t.push.apply(t, r)
            }
            return t
        })(Object(i)).forEach(function(e) {
            Object.defineProperty(a, e, Object.getOwnPropertyDescriptor(i, e))
        }), a) : r, o);
        eS("UpsellContinued", null == r ? void 0 : r.assetType), w.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(w.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, w.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBUX_UPSELL, w.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, w.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.GO_TO_ROBUX_PURCHASE_PAGE), window.location.href = eu.urlService.getAbsoluteUrl("".concat("/upgrades/paymentmethods", "?ap=").concat(e.roblox_product_id, "&UpsellUuid=").concat(l))
    }

    function lA(e, t, r, n) {
        var o = Date.now(),
            a = o - t;
        w.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(w.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, w.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBUX_UPSELL, w.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, e, {
            userBalance: r.userBalanceRobux.toString(),
            itemCost: n.expectedItemPrice.toString(),
            modalImpressionTimeInMs: a.toString(),
            modalStartTimeInMs: t.toString(),
            modalEndTimeInMs: o.toString()
        })
    }

    function lI(e, t, r, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, o)
    }

    function l_(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function lT(e, t, r, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, o)
    }

    function lN(e, t) {
        try {
            E.EventStream.SendEventWithTarget("ItemPurchaseUpsellEvent", e, t, E.EventStream.TargetTypes.WWW)
        } catch (e) {}
    }

    function lC(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function lR(e, t, r, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, o)
    }

    function lU(e) {
        return function() {
            var t = this,
                r = arguments;
            return new Promise(function(n, o) {
                var a = e.apply(t, r);

                function i(e) {
                    lR(a, n, o, i, l, "next", e)
                }

                function l(e) {
                    lR(a, n, o, i, l, "throw", e)
                }
                i(void 0)
            })
        }
    }

    function lM(e, t) {
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
                if ("string" == typeof e) return lC(e, t);
                var r = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return lC(e, t)
            }
        }(e, t) || function() {
            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }

    function lk(e, t) {
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

    function lD(e, t, r, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, o)
    }
    var lB = function(e) {
            var t = document.querySelector('.PurchaseButton[data-product-id="'.concat(e.productId, '"]')),
                r = null == t ? void 0 : t.closest(".store-card"),
                n = null == r ? void 0 : r.querySelector(".gear-passes-asset img");
            return n ? n.src : null
        },
        lL = function(e, t) {
            var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : window.location.pathname;
            if (r.includes(x)) {
                if (!t) throw Error("button data not exist");
                if (eS("UpsellFromGamesPage", t.assetType), "Subscription" === t.assetType) return e.imageurl;
                var n = lB(t);
                if (!n) throw eS("UpsellThumbnailProcessFailed", t.assetType), Error("thumbnail image url process failed");
                return n
            }
            return e.imageurl
        },
        lH = window.HeaderScripts;

    function lF(e, t, r, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, o)
    }

    function lG(e, t, r, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, o)
    }

    function lV(e, t, r, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, o)
    }

    function lW(e) {
        return function() {
            var t = this,
                r = arguments;
            return new Promise(function(n, o) {
                var a = e.apply(t, r);

                function i(e) {
                    lV(a, n, o, i, l, "next", e)
                }

                function l(e) {
                    lV(a, n, o, i, l, "throw", e)
                }
                i(void 0)
            })
        }
    }

    function lX(e, t, r) {
        return t in e ? Object.defineProperty(e, t, {
            value: r,
            enumerable: !0,
            configurable: !0,
            writable: !0
        }) : e[t] = r, e
    }

    function lK(e, t) {
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
    var lz = function() {
        var e;

        function t() {
            var e = this;
            if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
            lX(this, "intl", void 0), lX(this, "intlProvider", void 0), lX(this, "translationResource", void 0), lX(this, "loadingOverlay", void 0), lX(this, "_state", {
                purchased: !1,
                retryRemainTimes: 5,
                timeoutHandle: null
            }), lX(this, "_checkBalanceAndPurchase", function(t, r) {
                return lW(function() {
                    var e, n, o;
                    return lK(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (e = this, this._state.purchased) return [2, Promise.resolve()];
                                a.label = 1;
                            case 1:
                                var i;
                                return a.trys.push([1, 5, , 6]), n = this.translationResource.get("Label.WaitingForRobux", {}), this.loadingOverlay.updateMessage(n), [4, (i = function() {
                                    var e, t, r;
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
                                    }(this, function(n) {
                                        switch (n.label) {
                                            case 0:
                                                e = E.CurrentUser.userId, t = {
                                                    url: "".concat(ea.EnvironmentUrls.economyApi).concat("/v1/users/{userId}/currency".replace("{userId}", e)),
                                                    withCredentials: !0,
                                                    retryable: !1,
                                                    noCache: !0
                                                }, n.label = 1;
                                            case 1:
                                                return n.trys.push([1, 3, , 4]), [4, eo.get(t)];
                                            case 2:
                                                if (200 === (r = n.sent()).status) return [2, r.data.robux];
                                                return [2, Promise.reject()];
                                            case 3:
                                                return [2, Promise.reject(n.sent())];
                                            case 4:
                                                return [2]
                                        }
                                    })
                                }, function() {
                                    var e = this,
                                        t = arguments;
                                    return new Promise(function(r, n) {
                                        var o = i.apply(e, t);

                                        function a(e) {
                                            lD(o, r, n, a, l, "next", e)
                                        }

                                        function l(e) {
                                            lD(o, r, n, a, l, "throw", e)
                                        }
                                        a(void 0)
                                    })
                                })()];
                            case 2:
                                if (t.userBalance = o = a.sent(), !(o >= t.expectedPrice)) return [3, 4];
                                return [4, lS(t, r, this.loadingOverlay, this.translationResource)];
                            case 3:
                                a.sent(), this._stopPeriodicChecking(), this._state.purchased = !0, a.label = 4;
                            case 4:
                                return this._state.purchased || (this._state.retryRemainTimes > 0 ? (this._state.timeoutHandle = window.setTimeout(function() {
                                    return lW(function() {
                                        return lK(this, function(e) {
                                            switch (e.label) {
                                                case 0:
                                                    return [4, this._checkBalanceAndPurchase(t, r)];
                                                case 1:
                                                    return e.sent(), [2]
                                            }
                                        })
                                    }).call(e)
                                }, 1e3), this._state.retryRemainTimes -= 1) : (eS("AutoPurchaseFailedDueToStillLowBalance", null == t ? void 0 : t.assetType), this._processGenericErrorState(t))), [3, 6];
                            case 5:
                                return a.sent(), eS(er, null == t ? void 0 : t.assetType), this._processGenericErrorState(t), [3, 6];
                            case 6:
                                return [2, Promise.resolve()]
                        }
                    })
                }).call(e)
            }), lX(this, "_stopPeriodicChecking", function() {
                e._state.timeoutHandle && (clearTimeout(e._state.timeoutHandle), e._state.timeoutHandle = null)
            }), lX(this, "_processGenericErrorState", function(t) {
                e.loadingOverlay.hide(), lv(t, e.translationResource), eg()
            }), this.intl = new E.Intl, this.intlProvider = new E.TranslationResourceProvider(this.intl), this.translationResource = this.intlProvider.getTranslationResource(j), this.loadingOverlay = new lp
        }
        return e = [{
                key: "startItemUpsellProcess",
                value: function(e, t, r) {
                    return lW(function(e, t, r) {
                        var n, o, a, i, l, c, u, s, f, p, d, h, y, m, b, v, g, O, x, _, T, N, L, F, G, V, W = arguments;
                        return lK(this, function(X) {
                            var K, z, Y, Z, q, Q, et, er, eo, ea, ei;
                            switch (X.label) {
                                case 0:
                                    if (n = W.length > 3 && void 0 !== W[3] ? W[3] : null == (K = document.getElementById(P)) ? void 0 : K.dataset, o = W.length > 4 && void 0 !== W[4] && W[4], !(i = n) || t.isLimited || (null == t || null == (a = t.buyButtonElementDataset) ? void 0 : a.assetType) === "Product") return r(e), [2, Promise.reject(e)];
                                    if (l = w.upsellUtil.constants.UPSELL_TARGET_ITEM_URL_REGEX.exec(window.location.pathname), w.upsellUtil.constants.UPSELL_TARGET_ITEM_URL_REGEX.lastIndex = 0, !Array.isArray(l)) return [3, 5];
                                    X.label = 1;
                                case 1:
                                    return X.trys.push([1, 4, , 5]), [4, (z = function() {
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
                                        }(this, function(e) {
                                            switch (e.label) {
                                                case 0:
                                                    return e.trys.push([0, 2, , 3]), [4, E.Guac.callBehaviour("vng-buy-robux")];
                                                case 1:
                                                    return [2, Promise.resolve(e.sent().shouldShowVng)];
                                                case 2:
                                                    return [2, Promise.reject(e.sent())];
                                                case 3:
                                                    return [2]
                                            }
                                        })
                                    }, function() {
                                        var e = this,
                                            t = arguments;
                                        return new Promise(function(r, n) {
                                            var o = z.apply(e, t);

                                            function a(e) {
                                                lF(o, r, n, a, i, "next", e)
                                            }

                                            function i(e) {
                                                lF(o, r, n, a, i, "throw", e)
                                            }
                                            a(void 0)
                                        })
                                    })()];
                                case 2:
                                    if (X.sent()) return w.paymentFlowAnalyticsService.startRobuxUpsellFlow(null != (c = null == (f = t.buyButtonElementDataset) ? void 0 : f.assetType) ? c : "", !!(null == (p = t.buyButtonElementDataset) ? void 0 : p.userassetId), null != (u = null == (d = t.buyButtonElementDataset) ? void 0 : d.isPrivateServer) && u, null != (s = null == (h = t.buyButtonElementDataset) ? void 0 : h.isPlace) && s, null == (y = t.buyButtonElementDataset) ? void 0 : y.productId), i.thumbnailImageUrl = lL(i, t.buyButtonElementDataset), Y = i, Z = this.translationResource, q = this.intlProvider, er = ep(t.expectedItemPrice), eo = "<div class='item-card-container item-preview'>\n        <div class='item-card-thumb'>\n          <img alt='item preview' src='".concat(null != (Q = Y.thumbnailImageUrl) ? Q : "", "' />\n        </div>\n        <div class='item-info text-name'>\n        <div class='text-overflow item-card-name'>").concat((0, es.escapeHtml)(t.assetName), "</div>\n          <div class='text-robux item-card-price'>").concat(er, "</div>\n        </div>\n      </div>"), eS($, null == (et = t.buyButtonElementDataset) ? void 0 : et.assetType), w.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(w.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, w.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBUX_UPSELL, w.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN), ea = eo + (Z.get(D, {}) || "<div class='modal-message-block text-center border-top'>Sorry, you don't have enough Robux to buy this item. Would you like to purchase a Robux package?</div>"), ei = Z.get("Message.InsufficientRobuxRedirectToExternalPartner", {}) || "<div class='text-footer modal-message-block text-center'> You will be taken to our partner’s page to complete the purchase.</div>", E.Dialog.open({
                                        titleText: Z.get(M, {}) || "Insufficient Robux",
                                        bodyContent: ea,
                                        declineText: Z.get(U, {}),
                                        acceptText: Z.get(R, {}) || "Buy Robux",
                                        onAccept: function() {
                                            var e, r;
                                            return w.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(w.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, w.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBUX_UPSELL, w.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, w.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.BUY_ROBUX), (e = t.buyButtonElementDataset, (r = function() {
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
                                                }(this, function(t) {
                                                    try {
                                                        var r, n, o, a;
                                                        return w.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(w.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, w.paymentFlowAnalyticsService.ENUM_VIEW_NAME.LEAVE_ROBLOX_WARNING, w.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN, w.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.EXTERNAL_LINK_MODAL), eS("ContinueBuyRobuxOnExternalSite", null == e ? void 0 : e.assetType), r = q.getTranslationResource(I), n = q.getTranslationResource(A), o = "<br /><br />", a = r.get(D, {
                                                            lineBreak: o,
                                                            linebreak: o
                                                        }) || "This purchase must be completed on our partner’s website. You will be returned to Roblox after the purchase is completed.<br /><br /> Proceed to partner website for payment?", E.Dialog.open({
                                                            titleText: r.get("Heading.InsufficientRobuxLeaveRoblox", {}) || "Leaving Roblox",
                                                            bodyContent: "<div class='modal-message-block text-center'>".concat(a, "</div>"),
                                                            declineText: n.get(H, {}),
                                                            acceptText: n.get("Action.ContinueToPayment", {}) || "Continue to Payment",
                                                            onAccept: function() {
                                                                w.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(w.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, w.paymentFlowAnalyticsService.ENUM_VIEW_NAME.LEAVE_ROBLOX_WARNING, w.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, w.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.CONTINUE_TO_VNG), eS("ConfirmLeaveRobloxModal", null == e ? void 0 : e.assetType), lm()
                                                            },
                                                            onDecline: function() {
                                                                w.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(w.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, w.paymentFlowAnalyticsService.ENUM_VIEW_NAME.LEAVE_ROBLOX_WARNING, w.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, w.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.CANCEL), eS(ee, null == e ? void 0 : e.assetType)
                                                            },
                                                            onCancel: function() {
                                                                w.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(w.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, w.paymentFlowAnalyticsService.ENUM_VIEW_NAME.LEAVE_ROBLOX_WARNING, w.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, w.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.CANCEL), eS(ee, null == e ? void 0 : e.assetType)
                                                            },
                                                            allowHtmlContentInBody: !0,
                                                            allowHtmlContentInFooter: !1,
                                                            fieldValidationRequired: !0,
                                                            dismissable: !0,
                                                            xToCancel: !0
                                                        }), [2, Promise.resolve()]
                                                    } catch (e) {
                                                        return [2, Promise.reject(e)]
                                                    }
                                                })
                                            }, function() {
                                                var e = this,
                                                    t = arguments;
                                                return new Promise(function(n, o) {
                                                    var a = r.apply(e, t);

                                                    function i(e) {
                                                        lG(a, n, o, i, l, "next", e)
                                                    }

                                                    function l(e) {
                                                        lG(a, n, o, i, l, "throw", e)
                                                    }
                                                    i(void 0)
                                                })
                                            })()).catch(function() {
                                                var e;
                                                eS("LeaveRobloxFailedToShown", null == (e = t.buyButtonElementDataset) ? void 0 : e.assetType), lm()
                                            }), !1
                                        },
                                        onDecline: function() {
                                            var e;
                                            w.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(w.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, w.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBUX_UPSELL, w.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, w.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.CANCEL), eS(J, null == (e = t.buyButtonElementDataset) ? void 0 : e.assetType)
                                        },
                                        onCancel: function() {
                                            var e;
                                            w.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(w.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, w.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBUX_UPSELL, w.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, w.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.CANCEL), eS(J, null == (e = t.buyButtonElementDataset) ? void 0 : e.assetType)
                                        },
                                        allowHtmlContentInBody: !0,
                                        allowHtmlContentInFooter: !0,
                                        footerText: ei,
                                        fieldValidationRequired: !0,
                                        dismissable: !0,
                                        xToCancel: !0
                                    }), [2, Promise.resolve()];
                                    return [4, ec(i, t)];
                                case 3:
                                    if (200 === (m = X.sent()).status) return w.paymentFlowAnalyticsService.startRobuxUpsellFlow(null != (b = null == (O = t.buyButtonElementDataset) ? void 0 : O.assetType) ? b : "", !!(null == (x = t.buyButtonElementDataset) ? void 0 : x.userassetId), null != (v = null == (_ = t.buyButtonElementDataset) ? void 0 : _.isPrivateServer) && v, null != (g = null == (T = t.buyButtonElementDataset) ? void 0 : T.isPlace) && g, null == (N = t.buyButtonElementDataset) ? void 0 : N.productId), i.thumbnailImageUrl = lL(i, t.buyButtonElementDataset), ! function(e, t, r, n, o, a, i) {
                                        var l, c, u = arguments.length > 7 && void 0 !== arguments[7] && arguments[7],
                                            s = ep(t.expectedItemPrice),
                                            f = "<div class='item-card-container item-preview'>\n        <div class='item-card-thumb'>\n          <img alt='item preview' src='".concat(null != (l = r.thumbnailImageUrl) ? l : "", "' />\n        </div>\n        <div class='item-info text-name'>\n        <div class='text-overflow item-card-name'>").concat((0, es.escapeHtml)(t.assetName), "</div>\n          <div class='text-robux item-card-price'>").concat(s, "</div>\n        </div>\n      </div>");
                                        eS($, null == (c = t.buyButtonElementDataset) ? void 0 : c.assetType), w.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(w.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, w.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBUX_UPSELL, w.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN),
                                            function(e, t, r, n, o, a, i, l) {
                                                var c = arguments.length > 8 && void 0 !== arguments[8] && arguments[8],
                                                    u = Date.now(),
                                                    s = "<a class='text-link-secondary terms-of-use-link' target='_blank' href='".concat(eu.urlService.getUrlWithLocale(S, a.getRobloxLocale()), "'>"),
                                                    f = ep(t.shortfallPrice, !1),
                                                    p = ep(o.robux_amount),
                                                    d = o.robux_amount_before_bonus ? ep(o.robux_amount_before_bonus, !1, !0) : "",
                                                    h = e + i.get("Message.InsufficientRobuxNew", {
                                                        divTagStart: "<div class='modal-message-block text-center border-top'>",
                                                        divTagEnd: "</div>",
                                                        robuxNeeded: f,
                                                        robuxPackageAmount: p,
                                                        originalRobuxPackageAmount: d,
                                                        sentenceSplit: "<br>",
                                                        lineBreak: "",
                                                        aTagStart: s,
                                                        aTagEnd: "</a>",
                                                        divTagFooterStart: "<div class='modal-message-block text-center border-top modal-legal-footer'>",
                                                        divTagFooterEnd: "</div>"
                                                    }),
                                                    y = i.get(k, {});

                                                function m() {
                                                    return lA(w.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.BUY_ROBUX_AND_ITEM, u, n, r), ej(o, E.CurrentUser.isUnder13, function() {
                                                        return lj(o, n, r.buyButtonElementDataset)
                                                    }, l, r.buyButtonElementDataset).catch(function() {
                                                        var e;
                                                        eS(en, null == (e = r.buyButtonElementDataset) ? void 0 : e.assetType), lj(o, n, r.buyButtonElementDataset)
                                                    }), !1
                                                }

                                                function b() {
                                                    var e;
                                                    lA(w.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.CANCEL, u, n, r), eS(J, null == (e = r.buyButtonElementDataset) ? void 0 : e.assetType)
                                                }
                                                if (c) {
                                                    var v, g, O, P, x, j, A, I, _ = (null == (P = r.buyButtonElementDataset) ? void 0 : P.assetType) === "Subscription",
                                                        T = _ && r.thumbnail ? r.thumbnail : lx({
                                                            thumbnailImageUrl: null != (v = n.thumbnailImageUrl) ? v : ""
                                                        }),
                                                        N = null != (g = null == (x = r.buyButtonElementDataset) ? void 0 : x.collectibleItemId) ? g : null,
                                                        R = null != (O = null == (j = r.buyButtonElementDataset) ? void 0 : j.rentalOptionDays) ? O : null,
                                                        M = Number(n.userBalanceRobux),
                                                        D = o,
                                                        L = 0;
                                                    I = ls({
                                                        variant: "standard",
                                                        expectedPrice: r.expectedItemPrice,
                                                        upsellProduct: o,
                                                        assetName: r.assetName,
                                                        assetType: (null == (A = r.buyButtonElementDataset) ? void 0 : A.assetType) || "",
                                                        thumbnail: T,
                                                        currentRobuxBalance: M,
                                                        onAccept: m,
                                                        onCancel: b,
                                                        intl: a,
                                                        priceSuffix: _ ? r.priceSuffix : void 0,
                                                        title: _ ? i.get("Action.BuyRobuxAndSubscription", {}) : void 0,
                                                        discountInformation: r.discountInformation,
                                                        collectibleItemId: N,
                                                        rentalOptionDays: R,
                                                        isLimited: r.isLimited,
                                                        onRefetchPackage: function(e) {
                                                            if (!Number.isFinite(M) || !(e <= M)) {
                                                                var t = L += 1;
                                                                null == I || I.setPackageLoading(!0), ec(n, r, e).then(function(e) {
                                                                    t === L && (200 === e.status && e.data ? (D = e.data, null == I || I.updatePackage(e.data, !1)) : null == I || I.setPackageLoading(!1))
                                                                }).catch(function() {
                                                                    t === L && (null == I || I.setPackageLoading(!1))
                                                                })
                                                            }
                                                        },
                                                        onAcceptOffers: function(e) {
                                                            var t = e.purchasePrice,
                                                                o = e.offerIds;
                                                            lA(w.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.BUY_ROBUX_AND_ITEM, u, n, r);
                                                            var a = o.length ? o : void 0;
                                                            return ej(D, E.CurrentUser.isUnder13, function() {
                                                                return lj(D, n, r.buyButtonElementDataset, t, a)
                                                            }, l, r.buyButtonElementDataset).catch(function() {
                                                                var e;
                                                                eS(en, null == (e = r.buyButtonElementDataset) ? void 0 : e.assetType), lj(D, n, r.buyButtonElementDataset, t, a)
                                                            }), !1
                                                        },
                                                        onDirectPurchase: function(e) {
                                                            var t = e.purchasePrice,
                                                                o = e.offerIds;
                                                            lA(w.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.BUY_ROBUX_AND_ITEM, u, n, r), (function(e) {
                                                                var t;
                                                                return (t = function(e) {
                                                                    var t, r, n, o, a, i, l, c, u, s, f, p, d, h;
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
                                                                    }(this, function(y) {
                                                                        switch (y.label) {
                                                                            case 0:
                                                                                return t = e.itemDetail, r = e.itemPurchaseAjaxData, n = e.purchasePrice, o = e.offerIds, a = e.userBalance, i = e.translationResource, d = {
                                                                                    itemContainerElemClassList: void 0,
                                                                                    assetType: null != (l = null == (p = t.buyButtonElementDataset) ? void 0 : p.assetType) ? l : "",
                                                                                    assetName: (0, es.escapeHtml)(t.assetName),
                                                                                    productId: null != (c = null == p ? void 0 : p.productId) ? c : "",
                                                                                    expectedPrice: n,
                                                                                    expectedCurrency: Number(null == p ? void 0 : p.expectedCurrency) || 1,
                                                                                    expectedPromoId: void 0,
                                                                                    expectedSellerId: Number(null == p ? void 0 : p.expectedSellerId) || 0,
                                                                                    userAssetId: (null == p ? void 0 : p.userassetId) ? Number(p.userassetId) : void 0,
                                                                                    context: "",
                                                                                    isLibrary: !1,
                                                                                    itemThumbnailUrl: null != (u = null != (s = r.thumbnailImageUrl) ? s : r.imageurl) ? u : "",
                                                                                    itemPath: window.location.pathname,
                                                                                    alertImageUrl: null != (f = r.alerturl) ? f : "",
                                                                                    userBalance: a,
                                                                                    itemPurchaseAjaxData: r,
                                                                                    itemDetail: p,
                                                                                    offerIds: o.length ? o : void 0
                                                                                }, (h = new lp).show(), h.updateMessage(i.get(B, {})), [4, lS(d, null, h, i)];
                                                                            case 1:
                                                                                return y.sent(), [2]
                                                                        }
                                                                    })
                                                                }, function() {
                                                                    var e = this,
                                                                        r = arguments;
                                                                    return new Promise(function(n, o) {
                                                                        var a = t.apply(e, r);

                                                                        function i(e) {
                                                                            lP(a, n, o, i, l, "next", e)
                                                                        }

                                                                        function l(e) {
                                                                            lP(a, n, o, i, l, "throw", e)
                                                                        }
                                                                        i(void 0)
                                                                    })
                                                                }).apply(this, arguments)
                                                            })({
                                                                itemDetail: r,
                                                                itemPurchaseAjaxData: n,
                                                                purchasePrice: t,
                                                                offerIds: o,
                                                                userBalance: M,
                                                                translationResource: i
                                                            }).catch(function() {})
                                                        }
                                                    });
                                                    return
                                                }
                                                E.Dialog.open({
                                                    titleText: y,
                                                    bodyContent: h,
                                                    footerText: "",
                                                    declineText: i.get(U, {}),
                                                    acceptText: i.get(C, {}),
                                                    acceptColor: "btn-primary-md",
                                                    onAccept: m,
                                                    onDecline: function() {
                                                        var e;
                                                        lA(w.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.CANCEL, u, n, r), eS(J, null == (e = r.buyButtonElementDataset) ? void 0 : e.assetType)
                                                    },
                                                    onCancel: b,
                                                    allowHtmlContentInBody: !0,
                                                    allowHtmlContentInFooter: !1,
                                                    fieldValidationRequired: !0,
                                                    dismissable: !0,
                                                    xToCancel: !0
                                                })
                                            }(f, e, t, r, n, o, a, i, u)
                                    }(e, t, i, m.data, this.intl, this.intlProvider.getTranslationResource(j), this.intlProvider, o), [2, Promise.resolve()];
                                    return 204 === m.status ? eS("UpsellFailedDueToNoAvailablePackage", null == (L = t.buyButtonElementDataset) ? void 0 : L.assetType) : eS("UpsellFailedDueToFailedPackageRequest", null == (F = t.buyButtonElementDataset) ? void 0 : F.assetType), [3, 5];
                                case 4:
                                    return G = X.sent(), eS("UpsellFailed", null == (V = t.buyButtonElementDataset) ? void 0 : V.assetType), r(e), [2, Promise.reject(G)];
                                case 5:
                                    return r(e), [2, Promise.reject(e)]
                            }
                        })
                    }).apply(this, arguments)
                }
            }, {
                key: "showExceedLargestInsufficientRobuxModal",
                value: function(e, t, r) {
                    var n, o, a, i, l = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : null == (n = document.getElementById(P)) ? void 0 : n.dataset,
                        c = arguments.length > 4 && void 0 !== arguments[4] && arguments[4];
                    if (eS("UpsellExceedLargestEntryPoint", null == t ? void 0 : t.assetType), !(null == l ? void 0 : l.imageurl)) {
                        eS("UpsellExceedLargestNoThumbnailImage", null == t ? void 0 : t.assetType), r();
                        return
                    }
                    try {
                        w.paymentFlowAnalyticsService.startRobuxUpsellFlow(null != (o = null == t ? void 0 : t.assetType) ? o : "", !!(null == t ? void 0 : t.userassetId), null != (a = null == t ? void 0 : t.isPrivateServer) && a, null != (i = null == t ? void 0 : t.isPlace) && i, null == t ? void 0 : t.productId),
                            function(e, t, r, n) {
                                var o, a = arguments.length > 4 && void 0 !== arguments[4] && arguments[4],
                                    i = arguments.length > 5 ? arguments[5] : void 0,
                                    l = ep(e),
                                    c = parseInt(r.expectedPrice, 10),
                                    u = ep(c),
                                    s = window.location.pathname;
                                (null === E.Endpoints || void 0 === E.Endpoints ? void 0 : E.Endpoints.supportLocalizedUrls) && (s = E.Endpoints.removeUrlLocale(s));
                                var f = t;
                                s.startsWith(x) && (f = null != (o = lB(r)) ? o : f);
                                var p = "<div class='item-card-container item-preview'>\n        <div class='item-card-thumb'>\n          <img alt='item preview' src='".concat(f, "' />\n        </div>\n        <div class='item-info text-name'>\n        <div class='text-overflow item-card-name'>").concat((0, es.escapeHtml)(r.itemName), "</div>\n          <div class='text-robux item-card-price'>").concat(u, "</div>\n        </div>\n      </div>") + n.get("Message.InsufficientRobuxExceedLargestPackage", {
                                    divTagStart: "<div class='modal-message-block text-center border-top'>",
                                    divTagEnd: "</div>",
                                    robuxNeeded: l
                                });

                                function d() {
                                    var e, t, n, o;
                                    return w.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(w.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, w.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBUX_UPSELL_EXCEED_LARGEST_PACKAGE, w.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, w.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.GO_TO_ROBUX_STORE), eS("UpsellExceedLargestGoToRobuxStoreClicked", null == r ? void 0 : r.assetType), ! function(e, t) {
                                        if (e && t) {
                                            window.location.href = eu.urlService.getUrlWithQueries("/Upgrades/Robux.aspx", {
                                                ctx: ""
                                            });
                                            return
                                        }
                                        window.location.href = E.Endpoints.getAbsoluteUrl("/upgrades/robux?ctx=upsell")
                                    }(null != (e = null == (n = lH.deviceMeta.getDeviceMeta()) ? void 0 : n.isTablet) && e, null != (t = null == (o = lH.deviceMeta.getDeviceMeta()) ? void 0 : o.isUniversalApp) && t), !1
                                }

                                function h() {
                                    w.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(w.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, w.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBUX_UPSELL_EXCEED_LARGEST_PACKAGE, w.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, w.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.CANCEL), eS(J, null == r ? void 0 : r.assetType)
                                }
                                if (w.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(w.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, w.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBUX_UPSELL_EXCEED_LARGEST_PACKAGE, w.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN), eS("UpsellExceedLargestShown", r.assetType), a) {
                                    var y = !0 === r.isPrivateServer && i ? i : lx({
                                        thumbnailImageUrl: null != f ? f : ""
                                    });
                                    ls({
                                        variant: "tooExpensive",
                                        expectedPrice: c,
                                        assetName: r.itemName,
                                        thumbnail: y,
                                        onAccept: d,
                                        onCancel: h
                                    });
                                    return
                                }
                                E.Dialog.open({
                                    titleText: n.get(M, {}),
                                    bodyContent: p,
                                    declineText: n.get(U, {}),
                                    acceptText: n.get("Action.GoToRobuxStore", {}),
                                    acceptColor: "btn-primary-md",
                                    onAccept: d,
                                    onDecline: function() {
                                        w.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(w.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, w.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBUX_UPSELL_EXCEED_LARGEST_PACKAGE, w.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, w.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.CANCEL), eS("UpsellExceedLargestCancelled", null == r ? void 0 : r.assetType)
                                    },
                                    onCancel: h,
                                    allowHtmlContentInBody: !0,
                                    allowHtmlContentInFooter: !1,
                                    fieldValidationRequired: !0,
                                    dismissable: !0,
                                    xToCancel: !0
                                })
                            }(e, l.imageurl, t, this.intlProvider.getTranslationResource(j), c), eS("UpsellExceedLargestModalExpTrue", null == t ? void 0 : t.assetType)
                    } catch (e) {
                        eS("UpsellExceedLargestModalExpError", null == t ? void 0 : t.assetType), r()
                    }
                }
            }, {
                key: "initiateAutoPurchase",
                value: function(e, t) {
                    return lW(function(e, t) {
                        var r, n, o, a, i, l, c, u, s = arguments;
                        return lK(this, function(f) {
                            switch (f.label) {
                                case 0:
                                    r = s.length > 2 && void 0 !== s[2] ? s[2] : document.getElementById(P), n = s.length > 3 && void 0 !== s[3] ? s[3] : document.getElementById("item-container"), this._state = {
                                        purchased: !1,
                                        retryRemainTimes: 5,
                                        timeoutHandle: null
                                    }, this.loadingOverlay.show(), eS("AutoPurchaseEntryPoint", q), f.label = 1;
                                case 1:
                                    var p, d, h;
                                    return f.trys.push([1, 3, , 4]), (!e || !(e.startsWith("/catalog/") || e.startsWith("/bundles/") || e.startsWith("/game-pass/") || e.startsWith(x)) || e.includes("UpsellUuid=")) && (w.upsellUtil.expireUpsellCookie(), window.location.href = E.Endpoints.getAbsoluteUrl("/catalog")), [4, (p = n, d = null == n ? void 0 : n.dataset, h = null == r ? void 0 : r.dataset, lU(function() {
                                        var t, r, n, o, a, i, l, c, u, s, f, y;
                                        return lk(this, function(m) {
                                            switch (m.label) {
                                                case 0:
                                                    return [4, lU(function() {
                                                        var t, r, n, o, a, i, l, c, u;
                                                        return lk(this, function(s) {
                                                            var f, p, y;
                                                            switch (s.label) {
                                                                case 0:
                                                                    if ((t = w.upsellUtil.parseUpsellCookie()) && 0 !== Object.keys(t).length && (!t.targetItemUrl || e.startsWith(t.targetItemUrl)) || (eS("AutoPurchasePotentialHackingActionSpotted2", q), lN(X, {
                                                                            itemPath: e,
                                                                            upsellCookieData: t
                                                                        }), eg(), lh(e)), (r = h) || (eg(), lh(e)), t.subscriptionTargetKey) return o = {
                                                                        expectedPrice: t.expectedPrice || "0",
                                                                        expectedCurrency: t.expectedCurrency || "1",
                                                                        expectedSellerId: t.expectedSellerId || "",
                                                                        assetType: "Subscription",
                                                                        productId: t.productId || "0",
                                                                        itemName: String(t.itemName || (null == d ? void 0 : d.itemName) || ""),
                                                                        subscriptionTargetKey: String(null != (n = t.subscriptionTargetKey) ? n : "")
                                                                    }, [2, [r, o]];
                                                                    s.label = 1;
                                                                case 1:
                                                                    return s.trys.push([1, 3, , 4]), [4, (i = t.collectibleItemId ? null == d ? void 0 : d.productId : t.productId, lU(function() {
                                                                        var t, r;
                                                                        return lk(this, function(n) {
                                                                            switch (n.label) {
                                                                                case 0:
                                                                                    if (!i) return [2, Promise.reject()];
                                                                                    n.label = 1;
                                                                                case 1:
                                                                                    var o;
                                                                                    return n.trys.push([1, 3, , 4]), [4, (o = function() {
                                                                                        var e, t, r, n;
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
                                                                                                    e = "/v1/products/{productId}".replace("{productId}", i), t = {
                                                                                                        url: "".concat(ea.EnvironmentUrls.economyApi).concat(e),
                                                                                                        withCredentials: !0
                                                                                                    }, o.label = 1;
                                                                                                case 1:
                                                                                                    return o.trys.push([1, 3, , 4]), [4, eo.get(t)];
                                                                                                case 2:
                                                                                                    if (200 !== (r = o.sent()).status || "Success" !== r.data.reason) return [2, Promise.reject(null == r || null == (n = r.data) ? void 0 : n.reason)];
                                                                                                    return [2, Promise.resolve(r.data)];
                                                                                                case 3:
                                                                                                    return [2, Promise.reject(o.sent())];
                                                                                                case 4:
                                                                                                    return [2]
                                                                                            }
                                                                                        })
                                                                                    }, function() {
                                                                                        var e = this,
                                                                                            t = arguments;
                                                                                        return new Promise(function(r, n) {
                                                                                            var a = o.apply(e, t);

                                                                                            function i(e) {
                                                                                                lI(a, r, n, i, l, "next", e)
                                                                                            }

                                                                                            function l(e) {
                                                                                                lI(a, r, n, i, l, "throw", e)
                                                                                            }
                                                                                            i(void 0)
                                                                                        })
                                                                                    })()];
                                                                                case 2:
                                                                                    if (!(t = n.sent()) || 0 === Object.keys(t).length) return eS("AutoPurchasePotentialHackingActionSpotted3", q), lN(z, {
                                                                                        itemPath: e,
                                                                                        productId: i
                                                                                    }), [2, Promise.reject()];
                                                                                    return [2, t];
                                                                                case 3:
                                                                                    return r = n.sent(), eS("AutoPurchasePotentialHackingActionSpotted4", q), lN(K, {
                                                                                        itemPath: e,
                                                                                        productId: i,
                                                                                        error: r
                                                                                    }), [2, Promise.reject(r)];
                                                                                case 4:
                                                                                    return [2]
                                                                            }
                                                                        })
                                                                    })())];
                                                                case 2:
                                                                    return a = s.sent(), [3, 4];
                                                                case 3:
                                                                    return l = s.sent(), lN(Y, {
                                                                        itemPath: e,
                                                                        upsellCookieData: t,
                                                                        error: l
                                                                    }), eg(), lh(e), [2, Promise.reject()];
                                                                case 4:
                                                                    return [4, (f = a.assetId, p = a.assetType, (y = function() {
                                                                        var e, t, r, n, o;
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
                                                                                    p === _ ? (t = "/v1/game-passes", e = {
                                                                                        gamePassIds: f
                                                                                    }) : p === T ? (t = "/v1/bundles/thumbnails", e = {
                                                                                        bundleIds: f
                                                                                    }) : (t = "/v1/assets", e = {
                                                                                        assetIds: f
                                                                                    }), e = function(e) {
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
                                                                                    }({}, e, N), r = {
                                                                                        url: "".concat(ea.EnvironmentUrls.thumbnailsApi).concat(t),
                                                                                        withCredentials: !0
                                                                                    }, a.label = 1;
                                                                                case 1:
                                                                                    return a.trys.push([1, 3, , 4]), [4, eo.get(r, e)];
                                                                                case 2:
                                                                                    var i;
                                                                                    if (o = (function(e) {
                                                                                            if (Array.isArray(e)) return e
                                                                                        }(i = (n = a.sent()).data.data) || function(e) {
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
                                                                                        }(i) || function(e) {
                                                                                            if (e) {
                                                                                                if ("string" == typeof e) return l_(e, 1);
                                                                                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                                                                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                                                                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return l_(e, 1)
                                                                                            }
                                                                                        }(i) || function() {
                                                                                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                                                                        }())[0], 200 !== n.status || !o) return [2, Promise.resolve(null)];
                                                                                    return [2, Promise.resolve(o.imageUrl)];
                                                                                case 3:
                                                                                    return a.sent(), [2, Promise.resolve(null)];
                                                                                case 4:
                                                                                    return [2]
                                                                            }
                                                                        })
                                                                    }, function() {
                                                                        var e = this,
                                                                            t = arguments;
                                                                        return new Promise(function(r, n) {
                                                                            var o = y.apply(e, t);

                                                                            function a(e) {
                                                                                lT(o, r, n, a, i, "next", e)
                                                                            }

                                                                            function i(e) {
                                                                                lT(o, r, n, a, i, "throw", e)
                                                                            }
                                                                            a(void 0)
                                                                        })
                                                                    })())];
                                                                case 5:
                                                                    return c = s.sent(), r.imageurl = c || r.imageurl, u = {
                                                                        expectedPrice: t.expectedPrice || "0",
                                                                        expectedCurrency: t.expectedCurrency || "1",
                                                                        expectedSellerId: t.expectedSellerId || "",
                                                                        itemId: a.assetId || (null == d ? void 0 : d.itemId),
                                                                        itemName: a.assetName || (null == d ? void 0 : d.itemName),
                                                                        assetType: a.assetType || (null == d ? void 0 : d.assetType),
                                                                        assetGranted: null == d ? void 0 : d.assetGranted,
                                                                        assetTypeDisplayName: a.assetTypeDisplayName || (null == d ? void 0 : d.assetTypeDisplayName),
                                                                        assetTypeId: null == d ? void 0 : d.assetTypeId,
                                                                        productId: a.productId || t.productId || (null == d ? void 0 : d.productId),
                                                                        itemType: a.assetType || (null == d ? void 0 : d.itemType),
                                                                        currentTime: null == d ? void 0 : d.currentTime,
                                                                        isPurchaseEnabled: null == d ? void 0 : d.isPurchaseEnabled,
                                                                        placeproductpromotionId: null == d ? void 0 : d.placeproductpromotionId,
                                                                        userassetId: t.userAssetId || (null == d ? void 0 : d.userassetId),
                                                                        collectibleItemId: t.collectibleItemId || (null == d ? void 0 : d.collectibleItemId),
                                                                        collectibleItemInstanceId: t.collectibleItemInstanceId || (null == d ? void 0 : d.collectibleItemInstanceId),
                                                                        collectibleProductId: t.collectibleProductId || (null == d ? void 0 : d.collectibleProductId)
                                                                    }, [2, [r, u]]
                                                            }
                                                        })
                                                    })()];
                                                case 1:
                                                    r = (t = lM.apply(void 0, [m.sent(), 2]))[0], o = (n = t[1]).placeproductpromotionId, a = "LibraryItem" === ((null === E.MetaDataValues || void 0 === E.MetaDataValues ? void 0 : E.MetaDataValues.getPageName()) || ""), i = parseInt(r.userBalanceRobux, 10), l = parseInt(n.expectedCurrency, 10), c = parseInt(n.expectedPrice, 10), u = parseInt(n.expectedSellerId, 10), s = {
                                                        itemContainerElemClassList: null == p ? void 0 : p.classList,
                                                        assetType: n.assetType,
                                                        assetName: (0, es.escapeHtml)(n.itemName),
                                                        expectedSellerId: u,
                                                        expectedCurrency: l,
                                                        expectedPrice: c,
                                                        productId: n.productId,
                                                        isLibrary: a,
                                                        itemThumbnailUrl: r.imageurl,
                                                        itemPath: e,
                                                        alertImageUrl: r.alerturl,
                                                        userBalance: i,
                                                        itemPurchaseAjaxData: r,
                                                        itemDetail: n
                                                    }, o && (s.expectedPromoId = parseInt(o, 10)), n.userassetId && (s.userAssetId = parseInt(n.userassetId, 10)), (y = function(e) {
                                                        if (!e) return [];
                                                        try {
                                                            var t = window.sessionStorage.getItem(em(e));
                                                            if (!t) return [];
                                                            var r = JSON.parse(t);
                                                            if (Array.isArray(r)) return r.filter(function(e) {
                                                                return "string" == typeof e
                                                            });
                                                            return []
                                                        } catch (e) {
                                                            return []
                                                        }
                                                    }(f = w.upsellUtil.parseUpsellCookie().upsellUuid)).length && (s.offerIds = y);
                                                    if (f) try {
                                                        window.sessionStorage.removeItem(em(f))
                                                    } catch (e) {}
                                                    return [2, s]
                                            }
                                        })
                                    })())];
                                case 2:
                                    return o = f.sent(), [3, 4];
                                case 3:
                                    return f.sent(), this.loadingOverlay.hide(), eg(), [2, Promise.resolve()];
                                case 4:
                                    a = this.translationResource.get(B, {}), i = o.userBalance, l = o.expectedPrice, f.label = 5;
                                case 5:
                                    if (f.trys.push([5, 9, , 10]), e.startsWith(x) && (null == (c = document.getElementById("tab-store")) || c.click()), !(i > l)) return [3, 7];
                                    return this.loadingOverlay.updateMessage(a), [4, lS(o, t, this.loadingOverlay, this.translationResource)];
                                case 6:
                                    return f.sent(), this._state.purchased = !0, [2, Promise.resolve()];
                                case 7:
                                    return [4, this._checkBalanceAndPurchase(o, t)];
                                case 8:
                                    return f.sent(), [3, 10];
                                case 9:
                                    return u = f.sent(), this.loadingOverlay.hide(), eS(er, null == o ? void 0 : o.assetType), lN(Z, {
                                        itemPurchaseObj: o,
                                        error: u
                                    }), eg(), [3, 10];
                                case 10:
                                    return [2, Promise.resolve()]
                            }
                        })
                    }).apply(this, arguments)
                }
            }],
            function(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var n = t[r];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                }
            }(t.prototype, e), t
    }();
    void 0 === window.Roblox && (window.Roblox = {}), void 0 === window.Roblox.ItemPurchaseUpsellService && (window.Roblox.ItemPurchaseUpsellService = new lz)
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("ItemPurchaseUpsell");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/itemPurchaseUpsell-c6ed91bddb5f453d.js.map
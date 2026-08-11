! function() {
    try {
        var t = "undefined" != typeof window ? window : "undefined" != typeof global ? global : "undefined" != typeof globalThis ? globalThis : "undefined" != typeof self ? self : {};
        t.SENTRY_RELEASE = {
            id: "5960d68f3004fe1e0dcd4f2002dbf68fb28a00f7"
        };
        var n = (new t.Error).stack;
        n && (t._sentryDebugIds = t._sentryDebugIds || {}, t._sentryDebugIds[n] = "c4037931-1d51-4c8c-8524-9f329f4ca222", t._sentryDebugIdIdentifier = "sentry-dbid-c4037931-1d51-4c8c-8524-9f329f4ca222")
    } catch (t) {}
}(),
function() {
    "use strict";
    var t = {
            375: function(t, n, r) {
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
            var t, n, o, a, i, l, c, s, u = window.Roblox,
                d = window.CoreRobloxUtilities,
                f = "/info/terms",
                p = "ItemPurchaseAjaxData",
                m = "/games/",
                v = "Purchasing.PurchaseDialog",
                y = "CommonUI.Controls",
                h = "Feature.Premium",
                b = "Game Pass",
                g = "Bundle",
                w = {
                    size: "150x150",
                    format: "Png",
                    isCircular: !1
                },
                E = "Action.BuyRobuxAndItem",
                x = "Action.BuyRobux",
                S = "Action.Cancel",
                P = "Heading.InsufficientRobux",
                O = "Heading.InsufficientRobuxNew",
                A = "Message.InsufficientRobuxAskToPurchasePackage",
                I = "Label.PurchasingTheItem",
                N = "Action.Ok",
                C = "Action.Cancel",
                T = "U13PaymentModal",
                _ = "ParentalConsentWarningPaymentModal13To17",
                j = "U13MonthlyThreshold1Modal",
                U = "U13MonthlyThreshold2Modal",
                R = "COOKIE_PARSE_FAILED",
                M = "PRODUCT_INFO_REQUEST_FAILED",
                k = "PRODUCT_INFO_EMPTY",
                D = "PRODUCT_ID_NOT_EXIST",
                L = "UPSELL_FAILED",
                F = "NoTypeParsedYet",
                B = "UpsellShown",
                W = "UpsellCancelled",
                G = "UpsellCancelledFromU13Modal",
                V = "CancelledFromLeaveRobloxModal",
                z = "AutoPurchaseSucceed",
                X = "AutoPurchaseFailed",
                H = "U13PaymentModalFailedToShow",
                Y = window.Roblox["core-scripts"].http.http,
                K = window.Roblox["core-scripts"].environmentUrls;

            function q(t, n, r, o, a, i, l) {
                try {
                    var c = t[i](l),
                        s = c.value
                } catch (t) {
                    r(t);
                    return
                }
                c.done ? n(s) : Promise.resolve(s).then(o, a)
            }

            function $(t, n, r) {
                var o;
                return (o = function() {
                    var o, a;
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
                        return l.next = c(0), l.throw = c(1), l.return = c(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                            return this
                        }), l;

                        function c(c) {
                            return function(s) {
                                var u = [c, s];
                                if (r) throw TypeError("Generator is already executing.");
                                for (; l && (l = 0, u[0] && (i = 0)), i;) try {
                                    if (r = 1, o && (a = 2 & u[0] ? o.return : u[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, u[1])).done) return a;
                                    switch (o = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                        case 0:
                                        case 1:
                                            a = u;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: u[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, o = u[1], u = [0];
                                            continue;
                                        case 7:
                                            u = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                                i.label = u[1];
                                                break
                                            }
                                            if (6 === u[0] && i.label < a[1]) {
                                                i.label = a[1], a = u;
                                                break
                                            }
                                            if (a && i.label < a[2]) {
                                                i.label = a[2], i.ops.push(u);
                                                break
                                            }
                                            a[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    u = n.call(t, i)
                                } catch (t) {
                                    u = [6, t], o = 0
                                } finally {
                                    r = a = 0
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
                                o = {
                                    upsell_platform: "WEB",
                                    user_robux_balance: parseInt(t.userBalanceRobux, 10),
                                    attempt_robux_amount: null != r ? r : n.expectedItemPrice
                                }, a = {
                                    url: "".concat(K.EnvironmentUrls.apiGatewayUrl).concat("/payments-gateway/v1/products/get-upsell-product"),
                                    withCredentials: !0
                                }, i.label = 1;
                            case 1:
                                return i.trys.push([1, 3, , 4]), [4, Y.post(a, o)];
                            case 2:
                                return [2, i.sent()];
                            case 3:
                                return [2, Promise.reject(i.sent())];
                            case 4:
                                return [2]
                        }
                    })
                }, function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, a) {
                        var i = o.apply(t, n);

                        function l(t) {
                            q(i, r, a, l, c, "next", t)
                        }

                        function c(t) {
                            q(i, r, a, l, c, "throw", t)
                        }
                        l(void 0)
                    })
                })()
            }
            var Z = window.CoreUtilities,
                J = window.Roblox["core-scripts"].format.string,
                Q = window.Roblox["core-scripts"].format.number;

            function ee(t) {
                var n = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1],
                    r = arguments.length > 2 && void 0 !== arguments[2] && arguments[2],
                    o = arguments.length > 3 && void 0 !== arguments[3] && arguments[3],
                    a = (0, Q.formatNumber)(t),
                    i = r ? "<s>".concat(a, "</s>") : a;
                return o ? "<span class='icon-robux-16x16 light-theme'></span><span class='text'>".concat(i, "</span>") : n ? "<span class='icon-robux-16x16'></span><span class='text-robux'>".concat(i, "</span>") : "<span class='icon-robux-gray-16x16'></span><span class='text'>".concat(i, "</span>")
            }

            function et(t) {
                return "".concat("RBXUpsellOfferIds:").concat(t)
            }

            function en(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function er(t, n, r, o, a, i, l) {
                try {
                    var c = t[i](l),
                        s = c.value
                } catch (t) {
                    r(t);
                    return
                }
                c.done ? n(s) : Promise.resolve(s).then(o, a)
            }

            function eo() {
                if (d.upsellUtil.expireUpsellCookie(), window.history) {
                    var t = new URL(window.location.href);
                    t.searchParams.delete(d.upsellUtil.constants.UPSELL_QUERY_PARAM_KEY);
                    var n = t.href;
                    window.history.pushState({
                        path: n
                    }, "", n)
                }
            }

            function ea(t, n, r, o, a, i, l) {
                try {
                    var c = t[i](l),
                        s = c.value
                } catch (t) {
                    r(t);
                    return
                }
                c.done ? n(s) : Promise.resolve(s).then(o, a)
            }
            var ei = window.EventTracker;

            function el(t) {
                (0, ei.fireEvent)("WebCatalog" + t)
            }

            function ec(t, n) {
                n === g || "Package" === n ? (0, ei.fireEvent)("WebBundle" + t) : n === b ? (0, ei.fireEvent)("WebGamePass" + t) : n ? el(t) : el("UnknownErrorNoAsset")
            }

            function es(t, n, r, o, a, i, l) {
                try {
                    var c = t[i](l),
                        s = c.value
                } catch (t) {
                    r(t);
                    return
                }
                c.done ? n(s) : Promise.resolve(s).then(o, a)
            }

            function eu(t) {
                d.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(d.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, d.paymentFlowAnalyticsService.ENUM_VIEW_NAME.PURCHASE_WARNING, d.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN, t)
            }

            function ed(t, n, r, o, a) {
                var i;
                return (i = function() {
                    var i, l;
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
                        return l.next = c(0), l.throw = c(1), l.return = c(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                            return this
                        }), l;

                        function c(c) {
                            return function(s) {
                                var u = [c, s];
                                if (r) throw TypeError("Generator is already executing.");
                                for (; l && (l = 0, u[0] && (i = 0)), i;) try {
                                    if (r = 1, o && (a = 2 & u[0] ? o.return : u[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, u[1])).done) return a;
                                    switch (o = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                        case 0:
                                        case 1:
                                            a = u;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: u[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, o = u[1], u = [0];
                                            continue;
                                        case 7:
                                            u = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                                i.label = u[1];
                                                break
                                            }
                                            if (6 === u[0] && i.label < a[1]) {
                                                i.label = a[1], a = u;
                                                break
                                            }
                                            if (a && i.label < a[2]) {
                                                i.label = a[2], i.ops.push(u);
                                                break
                                            }
                                            a[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    u = n.call(t, i)
                                } catch (t) {
                                    u = [6, t], o = 0
                                } finally {
                                    r = a = 0
                                }
                                if (5 & u[0]) throw u[1];
                                return {
                                    value: u[0] ? u[1] : void 0,
                                    done: !0
                                }
                            }
                        }
                    }(this, function(c) {
                        var s, f, p, m, v, b;
                        switch (c.label) {
                            case 0:
                                if (!n) return r(), [2, Promise.resolve()];
                                c.label = 1;
                            case 1:
                                return c.trys.push([1, 3, , 4]), [4, (s = t.roblox_product_id, (f = function() {
                                    var t, n, r;
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
                                        return l.next = c(0), l.throw = c(1), l.return = c(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                                            return this
                                        }), l;

                                        function c(c) {
                                            return function(s) {
                                                var u = [c, s];
                                                if (r) throw TypeError("Generator is already executing.");
                                                for (; l && (l = 0, u[0] && (i = 0)), i;) try {
                                                    if (r = 1, o && (a = 2 & u[0] ? o.return : u[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, u[1])).done) return a;
                                                    switch (o = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                                        case 0:
                                                        case 1:
                                                            a = u;
                                                            break;
                                                        case 4:
                                                            return i.label++, {
                                                                value: u[1],
                                                                done: !1
                                                            };
                                                        case 5:
                                                            i.label++, o = u[1], u = [0];
                                                            continue;
                                                        case 7:
                                                            u = i.ops.pop(), i.trys.pop();
                                                            continue;
                                                        default:
                                                            if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                                i = 0;
                                                                continue
                                                            }
                                                            if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                                                i.label = u[1];
                                                                break
                                                            }
                                                            if (6 === u[0] && i.label < a[1]) {
                                                                i.label = a[1], a = u;
                                                                break
                                                            }
                                                            if (a && i.label < a[2]) {
                                                                i.label = a[2], i.ops.push(u);
                                                                break
                                                            }
                                                            a[2] && i.ops.pop(), i.trys.pop();
                                                            continue
                                                    }
                                                    u = n.call(t, i)
                                                } catch (t) {
                                                    u = [6, t], o = 0
                                                } finally {
                                                    r = a = 0
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
                                                t = {
                                                    productId: s,
                                                    is13To17ScaryModalEnabled: !u.CurrentUser.isPremiumUser
                                                }, n = {
                                                    url: "".concat(K.EnvironmentUrls.apiGatewayUrl).concat("/purchase-warning/v1/purchase-warnings"),
                                                    withCredentials: !0,
                                                    timeout: 5e3
                                                }, o.label = 1;
                                            case 1:
                                                return o.trys.push([1, 3, , 4]), [4, Y.get(n, t)];
                                            case 2:
                                                if (200 !== (r = o.sent()).status || !r.data.action) return [2, Promise.resolve("NoAction")];
                                                return [2, Promise.resolve(r.data.action)];
                                            case 3:
                                                return [2, Promise.reject(o.sent())];
                                            case 4:
                                                return [2]
                                        }
                                    })
                                }, function() {
                                    var t = this,
                                        n = arguments;
                                    return new Promise(function(r, o) {
                                        var a = f.apply(t, n);

                                        function i(t) {
                                            er(a, r, o, i, l, "next", t)
                                        }

                                        function l(t) {
                                            er(a, r, o, i, l, "throw", t)
                                        }
                                        i(void 0)
                                    })
                                })())];
                            case 2:
                                return (i = c.sent()) === T || i === _ || i === j || i === U ? (i === T ? (eu(d.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.U13_PAYMENT_MODAL), ec("ShowU13PaymentModal", null == a ? void 0 : a.assetType)) : i === j ? (eu(d.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.U13_MONTHLY_THRESHOLD_1_MODAL), ec("ShowU13MonthlyThreshold1Modal", null == a ? void 0 : a.assetType)) : i === U ? (eu(d.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.U13_MONTHLY_THRESHOLD_2_MODAL), ec("ShowU13MonthlyThreshold2Modal", null == a ? void 0 : a.assetType)) : (eu(d.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.PAYMENT_MODAL_13_TO_17), ec("ShowParentalConsentWarningPaymentModal13To17Modal", null == a ? void 0 : a.assetType)), p = o.getTranslationResource(h), m = o.getTranslationResource(y), v = {
                                    lineBreak: "<br /><br />",
                                    linebreak: "<br /><br />"
                                }, b = "", i === T ? b = p.get("Description.ScaryModalBodyNew", v) : i === _ ? b = p.get("Description.ScaryModalBody13To17", {}) : i === j ? b = p.get("Description.ScaryModalThreshold1Body", v) : i === U && (b = p.get("Description.ScaryModalThreshold2Body", v)), u.Dialog.open({
                                    titleText: p.get("Heading.ScaryModalTitle", {}),
                                    bodyContent: '<div><span class="text-description">'.concat(b, "</span></div>").concat('<div class="text-center"><div class="icon-warning"></div></div>'),
                                    declineText: m.get(C, {}),
                                    acceptText: m.get("Action.OK", {}),
                                    onAccept: function() {
                                        var t;
                                        return (t = function() {
                                            var t, n;
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
                                                return l.next = c(0), l.throw = c(1), l.return = c(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                                                    return this
                                                }), l;

                                                function c(c) {
                                                    return function(s) {
                                                        var u = [c, s];
                                                        if (r) throw TypeError("Generator is already executing.");
                                                        for (; l && (l = 0, u[0] && (i = 0)), i;) try {
                                                            if (r = 1, o && (a = 2 & u[0] ? o.return : u[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, u[1])).done) return a;
                                                            switch (o = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                                                case 0:
                                                                case 1:
                                                                    a = u;
                                                                    break;
                                                                case 4:
                                                                    return i.label++, {
                                                                        value: u[1],
                                                                        done: !1
                                                                    };
                                                                case 5:
                                                                    i.label++, o = u[1], u = [0];
                                                                    continue;
                                                                case 7:
                                                                    u = i.ops.pop(), i.trys.pop();
                                                                    continue;
                                                                default:
                                                                    if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                                        i = 0;
                                                                        continue
                                                                    }
                                                                    if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                                                        i.label = u[1];
                                                                        break
                                                                    }
                                                                    if (6 === u[0] && i.label < a[1]) {
                                                                        i.label = a[1], a = u;
                                                                        break
                                                                    }
                                                                    if (a && i.label < a[2]) {
                                                                        i.label = a[2], i.ops.push(u);
                                                                        break
                                                                    }
                                                                    a[2] && i.ops.pop(), i.trys.pop();
                                                                    continue
                                                            }
                                                            u = n.call(t, i)
                                                        } catch (t) {
                                                            u = [6, t], o = 0
                                                        } finally {
                                                            r = a = 0
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
                                                        t = {
                                                            acknowledgement: "Confirmed".concat(i)
                                                        }, n = {
                                                            url: "".concat(K.EnvironmentUrls.apiGatewayUrl).concat("/purchase-warning/v1/purchase-warnings/acknowledge"),
                                                            withCredentials: !0,
                                                            timeout: 5e3
                                                        }, o.label = 1;
                                                    case 1:
                                                        return o.trys.push([1, 3, , 4]), [4, Y.post(n, t)];
                                                    case 2:
                                                        return o.sent(), r(), [2, Promise.resolve()];
                                                    case 3:
                                                        return [2, Promise.reject(o.sent())];
                                                    case 4:
                                                        return [2]
                                                }
                                            })
                                        }, function() {
                                            var n = this,
                                                r = arguments;
                                            return new Promise(function(o, a) {
                                                var i = t.apply(n, r);

                                                function l(t) {
                                                    ea(i, o, a, l, c, "next", t)
                                                }

                                                function c(t) {
                                                    ea(i, o, a, l, c, "throw", t)
                                                }
                                                l(void 0)
                                            })
                                        })().then(function() {
                                            i === T ? ec("ConfirmU13PaymentModal", null == a ? void 0 : a.assetType) : i === j ? ec("ConfirmU13MonthlyThreshold1Modal", null == a ? void 0 : a.assetType) : i === U ? ec("ConfirmU13MonthlyThreshold2Modal", null == a ? void 0 : a.assetType) : ec("ConfirmParentalConsentWarningPaymentModal13To17Modal", null == a ? void 0 : a.assetType)
                                        }).catch(function() {
                                            r()
                                        }), !1
                                    },
                                    onDecline: function() {
                                        return ec(G, null == a ? void 0 : a.assetType), eo(), !1
                                    },
                                    onCancel: function() {
                                        return ec(G, null == a ? void 0 : a.assetType), eo(), !1
                                    },
                                    allowHtmlContentInBody: !0,
                                    allowHtmlContentInFooter: !1,
                                    fieldValidationRequired: !0,
                                    dismissable: !0,
                                    xToCancel: !0
                                })) : "RequireEmailVerification" === i ? (ec("U13PaymentModalEmailVerificationTriggered", null == a ? void 0 : a.assetType), null == (l = u.EmailVerificationService.handleUserEmailVerificationRequiredByPurchaseWarning()) || l.then(function(t) {
                                    eu(d.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.REQUIRE_EMAIL_VERIFICATION), (null == t ? void 0 : t.emailAddress) && (null == t ? void 0 : t.verified) && r()
                                })) : (ec("U13PaymentModalNoAction", null == a ? void 0 : a.assetType), r()), [2, Promise.resolve()];
                            case 3:
                                return [2, Promise.reject(c.sent())];
                            case 4:
                                return [2]
                        }
                    })
                }, function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, o) {
                        var a = i.apply(t, n);

                        function l(t) {
                            es(a, r, o, l, c, "next", t)
                        }

                        function c(t) {
                            es(a, r, o, l, c, "throw", t)
                        }
                        l(void 0)
                    })
                })()
            }
            var ef = window.React,
                ep = r.n(ef),
                em = window.ReactDOM,
                ev = r.n(em),
                ey = window.Roblox["core-scripts"].react,
                eh = window.ReactJSX,
                eb = function() {
                    return (eb = Object.assign || function(t) {
                        for (var n, r = 1, o = arguments.length; r < o; r++)
                            for (var a in n = arguments[r]) Object.prototype.hasOwnProperty.call(n, a) && (t[a] = n[a]);
                        return t
                    }).apply(this, arguments)
                };

            function eg(t, n) {
                var r = {};
                for (var o in t) Object.prototype.hasOwnProperty.call(t, o) && 0 > n.indexOf(o) && (r[o] = t[o]);
                if (null != t && "function" == typeof Object.getOwnPropertySymbols) {
                    var a = 0;
                    for (o = Object.getOwnPropertySymbols(t); a < o.length; a++) 0 > n.indexOf(o[a]) && Object.prototype.propertyIsEnumerable.call(t, o[a]) && (r[o[a]] = t[o[a]])
                }
                return r
            }
            var ew = function() {
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
            };

            function eE(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }
            var ex = (null == (eV = globalThis) ? void 0 : eV.document) ? ef.useLayoutEffect : function() {},
                eS = ef[" useId ".trim().toString()] || function() {},
                eP = 0;

            function eO(t) {
                var n, r = (n = ef.useState(eS()), function(t) {
                        if (Array.isArray(t)) return t
                    }(n) || function(t, n) {
                        var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                        if (null != a) {
                            var i = [],
                                l = !0,
                                c = !1;
                            try {
                                for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), i.length !== n); l = !0);
                            } catch (t) {
                                c = !0, o = t
                            } finally {
                                try {
                                    l || null == a.return || a.return()
                                } finally {
                                    if (c) throw o
                                }
                            }
                            return i
                        }
                    }(n, 2) || function(t, n) {
                        if (t) {
                            if ("string" == typeof t) return eE(t, 2);
                            var r = Object.prototype.toString.call(t).slice(8, -1);
                            if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eE(t, n)
                        }
                    }(n, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    o = r[0],
                    a = r[1];
                return ex(function() {
                    t || a(function(t) {
                        return null != t ? t : String(eP++)
                    })
                }, [t]), t || (o ? "radix-".concat(o) : "")
            }

            function eA(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function eI(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function eN(t, n) {
                return null != n && "undefined" != typeof Symbol && n[Symbol.hasInstance] ? !!n[Symbol.hasInstance](t) : t instanceof n
            }

            function eC(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        eI(t, n, r[n])
                    })
                }
                return t
            }

            function eT(t, n) {
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

            function e_(t, n) {
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

            function ej(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var i = [],
                            l = !0,
                            c = !1;
                        try {
                            for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            c = !0, o = t
                        } finally {
                            try {
                                l || null == a.return || a.return()
                            } finally {
                                if (c) throw o
                            }
                        }
                        return i
                    }
                }(t, n) || eR(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function eU(t) {
                return function(t) {
                    if (Array.isArray(t)) return eA(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || eR(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function eR(t, n) {
                if (t) {
                    if ("string" == typeof t) return eA(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eA(t, n)
                }
            }

            function eM(t, n) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    o = r.checkForDefaultPrevented,
                    a = void 0 === o || o;
                return function(r) {
                    if (null == t || t(r), !1 === a || !r.defaultPrevented) return null == n ? void 0 : n(r)
                }
            }

            function ek(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }

            function eD() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return function(t) {
                    var r = !1,
                        o = n.map(function(n) {
                            var o = ek(n, t);
                            return r || "function" != typeof o || (r = !0), o
                        });
                    if (r) return function() {
                        for (var t = 0; t < o.length; t++) {
                            var r = o[t];
                            "function" == typeof r ? r() : ek(n[t], null)
                        }
                    }
                }
            }

            function eL() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return ef.useCallback(eD.apply(void 0, eU(n)), n)
            }
            var eF = Symbol("radix.slottable");

            function eB(t) {
                return ef.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === eF
            }
            var eW = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                var r, o, a, i, l, c = (o = r = "Primitive.".concat(n), (a = ef.forwardRef(function(t, n) {
                        var r = t.children,
                            o = e_(t, ["children"]);
                        if (ef.isValidElement(r)) {
                            var a, i, l, c = (l = null == (a = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (i = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                s = function(t, n) {
                                    var r = eC({}, n);
                                    for (var o in n) ! function(o) {
                                        var a = t[o],
                                            i = n[o];
                                        /^on[A-Z]/.test(o) ? a && i ? r[o] = function() {
                                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                            i.apply(void 0, eU(n)), a.apply(void 0, eU(n))
                                        } : a && (r[o] = a) : "style" === o ? r[o] = eC({}, a, i) : "className" === o && (r[o] = [a, i].filter(Boolean).join(" "))
                                    }(o);
                                    return eC({}, t, r)
                                }(o, r.props);
                            return r.type !== ef.Fragment && (s.ref = n ? eD(n, c) : c), ef.cloneElement(r, s)
                        }
                        return ef.Children.count(r) > 1 ? ef.Children.only(null) : null
                    })).displayName = "".concat(o, ".SlotClone"), i = a, (l = ef.forwardRef(function(t, n) {
                        var r = t.children,
                            o = e_(t, ["children"]),
                            a = ef.Children.toArray(r),
                            l = a.find(eB);
                        if (l) {
                            var c = l.props.children,
                                s = a.map(function(t) {
                                    return t === l ? ef.Children.count(c) > 1 ? ef.Children.only(null) : ef.isValidElement(c) ? c.props.children : null : t
                                });
                            return (0, eh.jsx)(i, eT(eC({}, o), {
                                ref: n,
                                children: ef.isValidElement(c) ? ef.cloneElement(c, void 0, s) : null
                            }))
                        }
                        return (0, eh.jsx)(i, eT(eC({}, o), {
                            ref: n,
                            children: r
                        }))
                    })).displayName = "".concat(r, ".Slot"), l),
                    s = ef.forwardRef(function(t, r) {
                        var o = t.asChild,
                            a = e_(t, ["asChild"]),
                            i = o ? c : n;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, eh.jsx)(i, eT(eC({}, a), {
                            ref: r
                        }))
                    });
                return s.displayName = "Primitive.".concat(n), eT(eC({}, t), eI({}, n, s))
            }, {});

            function eG(t) {
                var n = ef.useRef(t);
                return ef.useEffect(function() {
                    n.current = t
                }), ef.useMemo(function() {
                    return function() {
                        for (var t, r = arguments.length, o = Array(r), a = 0; a < r; a++) o[a] = arguments[a];
                        return null == (t = n.current) ? void 0 : t.call.apply(t, [n].concat(eU(o)))
                    }
                }, [])
            }
            var eV, ez, eX, eH = "dismissableLayer.update",
                eY = ef.createContext({
                    layers: new Set,
                    layersWithOutsidePointerEventsDisabled: new Set,
                    branches: new Set
                }),
                eK = ef.forwardRef(function(t, n) {
                    var r, o, a = t.disableOutsidePointerEvents,
                        i = void 0 !== a && a,
                        l = t.onEscapeKeyDown,
                        c = t.onPointerDownOutside,
                        s = t.onFocusOutside,
                        u = t.onInteractOutside,
                        d = t.onDismiss,
                        f = e_(t, ["disableOutsidePointerEvents", "onEscapeKeyDown", "onPointerDownOutside", "onFocusOutside", "onInteractOutside", "onDismiss"]),
                        p = ef.useContext(eY),
                        m = ej(ef.useState(null), 2),
                        v = m[0],
                        y = m[1],
                        h = null != (o = null == v ? void 0 : v.ownerDocument) ? o : null == (r = globalThis) ? void 0 : r.document,
                        b = ej(ef.useState({}), 2)[1],
                        g = eL(n, function(t) {
                            return y(t)
                        }),
                        w = Array.from(p.layers),
                        E = ej(eU(p.layersWithOutsidePointerEventsDisabled).slice(-1), 1)[0],
                        x = w.indexOf(E),
                        S = v ? w.indexOf(v) : -1,
                        P = p.layersWithOutsidePointerEventsDisabled.size > 0,
                        O = S >= x,
                        A = function(t) {
                            var n, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                                o = eG(t),
                                a = ef.useRef(!1),
                                i = ef.useRef(function() {});
                            return ef.useEffect(function() {
                                var t = function(t) {
                                        if (t.target && !a.current) {
                                            var n = function() {
                                                    e$("dismissableLayer.pointerDownOutside", o, l, {
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
                                r = eU(p.branches).some(function(t) {
                                    return t.contains(n)
                                });
                            O && !r && (null == c || c(t), null == u || u(t), t.defaultPrevented || null == d || d())
                        }, h),
                        I = function(t) {
                            var n, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                                o = eG(t),
                                a = ef.useRef(!1);
                            return ef.useEffect(function() {
                                var t = function(t) {
                                    t.target && !a.current && e$("dismissableLayer.focusOutside", o, {
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
                            eU(p.branches).some(function(t) {
                                return t.contains(n)
                            }) || (null == s || s(t), null == u || u(t), t.defaultPrevented || null == d || d())
                        }, h);
                    return function(t) {
                        var n, r, o = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                            a = (r = ef.useRef(t), ef.useEffect(function() {
                                r.current = t
                            }), ef.useMemo(function() {
                                return function() {
                                    for (var t, n = arguments.length, o = Array(n), a = 0; a < n; a++) o[a] = arguments[a];
                                    return null == (t = r.current) ? void 0 : t.call.apply(t, [r].concat(eU(o)))
                                }
                            }, []));
                        ef.useEffect(function() {
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
                        S === p.layers.size - 1 && (null == l || l(t), !t.defaultPrevented && d && (t.preventDefault(), d()))
                    }, h), ef.useEffect(function() {
                        if (v) return i && (0 === p.layersWithOutsidePointerEventsDisabled.size && (eX = h.body.style.pointerEvents, h.body.style.pointerEvents = "none"), p.layersWithOutsidePointerEventsDisabled.add(v)), p.layers.add(v), eq(),
                            function() {
                                i && 1 === p.layersWithOutsidePointerEventsDisabled.size && (h.body.style.pointerEvents = eX)
                            }
                    }, [v, h, i, p]), ef.useEffect(function() {
                        return function() {
                            v && (p.layers.delete(v), p.layersWithOutsidePointerEventsDisabled.delete(v), eq())
                        }
                    }, [v, p]), ef.useEffect(function() {
                        var t = function() {
                            return b({})
                        };
                        return document.addEventListener(eH, t),
                            function() {
                                return document.removeEventListener(eH, t)
                            }
                    }, []), (0, eh.jsx)(eW.div, eT(eC({}, f), {
                        ref: g,
                        style: eC({
                            pointerEvents: P ? O ? "auto" : "none" : void 0
                        }, t.style),
                        onFocusCapture: eM(t.onFocusCapture, I.onFocusCapture),
                        onBlurCapture: eM(t.onBlurCapture, I.onBlurCapture),
                        onPointerDownCapture: eM(t.onPointerDownCapture, A.onPointerDownCapture)
                    }))
                });

            function eq() {
                var t = new CustomEvent(eH);
                document.dispatchEvent(t)
            }

            function e$(t, n, r, o) {
                var a = o.discrete,
                    i = r.originalEvent.target,
                    l = new CustomEvent(t, {
                        bubbles: !1,
                        cancelable: !0,
                        detail: r
                    });
                n && i.addEventListener(t, n, {
                    once: !0
                }), a ? i && em.flushSync(function() {
                    return i.dispatchEvent(l)
                }) : i.dispatchEvent(l)
            }
            eK.displayName = "DismissableLayer", ef.forwardRef(function(t, n) {
                var r = ef.useContext(eY),
                    o = ef.useRef(null),
                    a = eL(n, o);
                return ef.useEffect(function() {
                    var t = o.current;
                    if (t) return r.branches.add(t),
                        function() {
                            r.branches.delete(t)
                        }
                }, [r.branches]), (0, eh.jsx)(eW.div, eT(eC({}, t), {
                    ref: a
                }))
            }).displayName = "DismissableLayerBranch";
            var eZ = 0;

            function eJ() {
                var t = document.createElement("span");
                return t.setAttribute("data-radix-focus-guard", ""), t.tabIndex = 0, t.style.outline = "none", t.style.opacity = "0", t.style.position = "fixed", t.style.pointerEvents = "none", t
            }

            function eQ(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }

            function e0() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return function(t) {
                    var r = !1,
                        o = n.map(function(n) {
                            var o = eQ(n, t);
                            return r || "function" != typeof o || (r = !0), o
                        });
                    if (r) return function() {
                        for (var t = 0; t < o.length; t++) {
                            var r = o[t];
                            "function" == typeof r ? r() : eQ(n[t], null)
                        }
                    }
                }
            }
            var e1 = Symbol("radix.slottable");

            function e2(t) {
                return ef.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === e1
            }
            var e3 = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                var r, o, a, i, l, c = (o = r = "Primitive.".concat(n), (a = ef.forwardRef(function(t, n) {
                        var r = t.children,
                            o = e_(t, ["children"]);
                        if (ef.isValidElement(r)) {
                            var a, i, l, c = (l = null == (a = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (i = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                s = function(t, n) {
                                    var r = eC({}, n);
                                    for (var o in n) ! function(o) {
                                        var a = t[o],
                                            i = n[o];
                                        /^on[A-Z]/.test(o) ? a && i ? r[o] = function() {
                                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                            i.apply(void 0, eU(n)), a.apply(void 0, eU(n))
                                        } : a && (r[o] = a) : "style" === o ? r[o] = eC({}, a, i) : "className" === o && (r[o] = [a, i].filter(Boolean).join(" "))
                                    }(o);
                                    return eC({}, t, r)
                                }(o, r.props);
                            return r.type !== ef.Fragment && (s.ref = n ? e0(n, c) : c), ef.cloneElement(r, s)
                        }
                        return ef.Children.count(r) > 1 ? ef.Children.only(null) : null
                    })).displayName = "".concat(o, ".SlotClone"), i = a, (l = ef.forwardRef(function(t, n) {
                        var r = t.children,
                            o = e_(t, ["children"]),
                            a = ef.Children.toArray(r),
                            l = a.find(e2);
                        if (l) {
                            var c = l.props.children,
                                s = a.map(function(t) {
                                    return t === l ? ef.Children.count(c) > 1 ? ef.Children.only(null) : ef.isValidElement(c) ? c.props.children : null : t
                                });
                            return (0, eh.jsx)(i, eT(eC({}, o), {
                                ref: n,
                                children: ef.isValidElement(c) ? ef.cloneElement(c, void 0, s) : null
                            }))
                        }
                        return (0, eh.jsx)(i, eT(eC({}, o), {
                            ref: n,
                            children: r
                        }))
                    })).displayName = "".concat(r, ".Slot"), l),
                    s = ef.forwardRef(function(t, r) {
                        var o = t.asChild,
                            a = e_(t, ["asChild"]),
                            i = o ? c : n;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, eh.jsx)(i, eT(eC({}, a), {
                            ref: r
                        }))
                    });
                return s.displayName = "Primitive.".concat(n), eT(eC({}, t), eI({}, n, s))
            }, {});

            function e5(t) {
                var n = ef.useRef(t);
                return ef.useEffect(function() {
                    n.current = t
                }), ef.useMemo(function() {
                    return function() {
                        for (var t, r = arguments.length, o = Array(r), a = 0; a < r; a++) o[a] = arguments[a];
                        return null == (t = n.current) ? void 0 : t.call.apply(t, [n].concat(eU(o)))
                    }
                }, [])
            }
            var e4 = "focusScope.autoFocusOnMount",
                e6 = "focusScope.autoFocusOnUnmount",
                e8 = {
                    bubbles: !1,
                    cancelable: !0
                },
                e7 = ef.forwardRef(function(t, n) {
                    var r = t.loop,
                        o = void 0 !== r && r,
                        a = t.trapped,
                        i = void 0 !== a && a,
                        l = t.onMountAutoFocus,
                        c = t.onUnmountAutoFocus,
                        s = e_(t, ["loop", "trapped", "onMountAutoFocus", "onUnmountAutoFocus"]),
                        u = ej(ef.useState(null), 2),
                        d = u[0],
                        f = u[1],
                        p = e5(l),
                        m = e5(c),
                        v = ef.useRef(null),
                        y = function() {
                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                            return ef.useCallback(e0.apply(void 0, eU(n)), n)
                        }(n, function(t) {
                            return f(t)
                        }),
                        h = ef.useRef({
                            paused: !1,
                            pause: function() {
                                this.paused = !0
                            },
                            resume: function() {
                                this.paused = !1
                            }
                        }).current;
                    ef.useEffect(function() {
                        if (i) {
                            var t = function(t) {
                                    if (!h.paused && d) {
                                        var n = t.target;
                                        d.contains(n) ? v.current = n : tt(v.current, {
                                            select: !0
                                        })
                                    }
                                },
                                n = function(t) {
                                    if (!h.paused && d) {
                                        var n = t.relatedTarget;
                                        null !== n && (d.contains(n) || tt(v.current, {
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
                                    for (var a, i = t[Symbol.iterator](); !(n = (a = i.next()).done); n = !0) a.value.removedNodes.length > 0 && tt(d)
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
                    }, [i, d, h.paused]), ef.useEffect(function() {
                        if (d) {
                            tn.add(h);
                            var t = document.activeElement;
                            if (!d.contains(t)) {
                                var n = new CustomEvent(e4, e8);
                                d.addEventListener(e4, p), d.dispatchEvent(n), n.defaultPrevented || (! function(t) {
                                    var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                                        r = n.select,
                                        o = void 0 !== r && r,
                                        a = document.activeElement,
                                        i = !0,
                                        l = !1,
                                        c = void 0;
                                    try {
                                        for (var s, u = t[Symbol.iterator](); !(i = (s = u.next()).done); i = !0) {
                                            var d = s.value;
                                            if (tt(d, {
                                                    select: o
                                                }), document.activeElement !== a) return
                                        }
                                    } catch (t) {
                                        l = !0, c = t
                                    } finally {
                                        try {
                                            i || null == u.return || u.return()
                                        } finally {
                                            if (l) throw c
                                        }
                                    }
                                }(e9(d).filter(function(t) {
                                    return "A" !== t.tagName
                                }), {
                                    select: !0
                                }), document.activeElement === t && tt(d))
                            }
                            return function() {
                                d.removeEventListener(e4, p), setTimeout(function() {
                                    var n = new CustomEvent(e6, e8);
                                    d.addEventListener(e6, m), d.dispatchEvent(n), n.defaultPrevented || tt(null != t ? t : document.body, {
                                        select: !0
                                    }), d.removeEventListener(e6, m), tn.remove(h)
                                }, 0)
                            }
                        }
                    }, [d, p, m, h]);
                    var b = ef.useCallback(function(t) {
                        if ((o || i) && !h.paused) {
                            var n = "Tab" === t.key && !t.altKey && !t.ctrlKey && !t.metaKey,
                                r = document.activeElement;
                            if (n && r) {
                                var a, l = t.currentTarget,
                                    c = ej([te(a = e9(l), l), te(a.reverse(), l)], 2),
                                    s = c[0],
                                    u = c[1];
                                s && u ? t.shiftKey || r !== u ? t.shiftKey && r === s && (t.preventDefault(), o && tt(u, {
                                    select: !0
                                })) : (t.preventDefault(), o && tt(s, {
                                    select: !0
                                })) : r === l && t.preventDefault()
                            }
                        }
                    }, [o, i, h.paused]);
                    return (0, eh.jsx)(e3.div, eT(eC({
                        tabIndex: -1
                    }, s), {
                        ref: y,
                        onKeyDown: b
                    }))
                });

            function e9(t) {
                for (var n = [], r = document.createTreeWalker(t, NodeFilter.SHOW_ELEMENT, {
                        acceptNode: function(t) {
                            var n = "INPUT" === t.tagName && "hidden" === t.type;
                            return t.disabled || t.hidden || n ? NodeFilter.FILTER_SKIP : t.tabIndex >= 0 ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_SKIP
                        }
                    }); r.nextNode();) n.push(r.currentNode);
                return n
            }

            function te(t, n) {
                var r = !0,
                    o = !1,
                    a = void 0;
                try {
                    for (var i, l = t[Symbol.iterator](); !(r = (i = l.next()).done); r = !0) {
                        var c = i.value;
                        if (! function(t, n) {
                                var r = n.upTo;
                                if ("hidden" === getComputedStyle(t).visibility) return !0;
                                for (; t && (void 0 === r || t !== r);) {
                                    if ("none" === getComputedStyle(t).display) return !0;
                                    t = t.parentElement
                                }
                                return !1
                            }(c, {
                                upTo: n
                            })) return c
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

            function tt(t) {
                var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    r = n.select;
                if (t && t.focus) {
                    var o, a = document.activeElement;
                    t.focus({
                        preventScroll: !0
                    }), t !== a && eN(o = t, HTMLInputElement) && "select" in o && void 0 !== r && r && t.select()
                }
            }
            e7.displayName = "FocusScope";
            var tn = (tL = [], {
                add: function(t) {
                    var n = tL[0];
                    t !== n && (null == n || n.pause()), (tL = tr(tL, t)).unshift(t)
                },
                remove: function(t) {
                    var n;
                    null == (n = (tL = tr(tL, t))[0]) || n.resume()
                }
            });

            function tr(t, n) {
                var r = eU(t),
                    o = r.indexOf(n);
                return -1 !== o && r.splice(o, 1), r
            }

            function to(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }
            var ta = Symbol("radix.slottable");

            function ti(t) {
                return ef.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === ta
            }
            var tl = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                    var r, o, a, i, l, c = (o = r = "Primitive.".concat(n), (a = ef.forwardRef(function(t, n) {
                            var r = t.children,
                                o = e_(t, ["children"]);
                            if (ef.isValidElement(r)) {
                                var a, i, l, c = (l = null == (a = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (i = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                    s = function(t, n) {
                                        var r = eC({}, n);
                                        for (var o in n) ! function(o) {
                                            var a = t[o],
                                                i = n[o];
                                            /^on[A-Z]/.test(o) ? a && i ? r[o] = function() {
                                                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                                i.apply(void 0, eU(n)), a.apply(void 0, eU(n))
                                            } : a && (r[o] = a) : "style" === o ? r[o] = eC({}, a, i) : "className" === o && (r[o] = [a, i].filter(Boolean).join(" "))
                                        }(o);
                                        return eC({}, t, r)
                                    }(o, r.props);
                                return r.type !== ef.Fragment && (s.ref = n ? function() {
                                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                    return function(t) {
                                        var r = !1,
                                            o = n.map(function(n) {
                                                var o = to(n, t);
                                                return r || "function" != typeof o || (r = !0), o
                                            });
                                        if (r) return function() {
                                            for (var t = 0; t < o.length; t++) {
                                                var r = o[t];
                                                "function" == typeof r ? r() : to(n[t], null)
                                            }
                                        }
                                    }
                                }(n, c) : c), ef.cloneElement(r, s)
                            }
                            return ef.Children.count(r) > 1 ? ef.Children.only(null) : null
                        })).displayName = "".concat(o, ".SlotClone"), i = a, (l = ef.forwardRef(function(t, n) {
                            var r = t.children,
                                o = e_(t, ["children"]),
                                a = ef.Children.toArray(r),
                                l = a.find(ti);
                            if (l) {
                                var c = l.props.children,
                                    s = a.map(function(t) {
                                        return t === l ? ef.Children.count(c) > 1 ? ef.Children.only(null) : ef.isValidElement(c) ? c.props.children : null : t
                                    });
                                return (0, eh.jsx)(i, eT(eC({}, o), {
                                    ref: n,
                                    children: ef.isValidElement(c) ? ef.cloneElement(c, void 0, s) : null
                                }))
                            }
                            return (0, eh.jsx)(i, eT(eC({}, o), {
                                ref: n,
                                children: r
                            }))
                        })).displayName = "".concat(r, ".Slot"), l),
                        s = ef.forwardRef(function(t, r) {
                            var o = t.asChild,
                                a = e_(t, ["asChild"]),
                                i = o ? c : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, eh.jsx)(i, eT(eC({}, a), {
                                ref: r
                            }))
                        });
                    return s.displayName = "Primitive.".concat(n), eT(eC({}, t), eI({}, n, s))
                }, {}),
                tc = (null == (ez = globalThis) ? void 0 : ez.document) ? ef.useLayoutEffect : function() {},
                ts = ef.forwardRef(function(t, n) {
                    var r, o, a = t.container,
                        i = e_(t, ["container"]),
                        l = ej(ef.useState(!1), 2),
                        c = l[0],
                        s = l[1];
                    tc(function() {
                        return s(!0)
                    }, []);
                    var u = a || c && (null == (o = globalThis) || null == (r = o.document) ? void 0 : r.body);
                    return u ? ev().createPortal((0, eh.jsx)(tl.div, eT(eC({}, i), {
                        ref: n
                    })), u) : null
                });
            ts.displayName = "Portal";
            var tu = new WeakMap,
                td = new WeakMap,
                tf = {},
                tp = 0,
                tm = function(t) {
                    return t && (t.host || tm(t.parentNode))
                },
                tv = function(t, n, r, o) {
                    var a = (Array.isArray(t) ? t : [t]).map(function(t) {
                        if (n.contains(t)) return t;
                        var r = tm(t);
                        return r && n.contains(r) ? r : (console.error("aria-hidden", t, "in not contained inside", n, ". Doing nothing"), null)
                    }).filter(function(t) {
                        return !!t
                    });
                    tf[r] || (tf[r] = new WeakMap);
                    var i = tf[r],
                        l = [],
                        c = new Set,
                        s = new Set(a),
                        u = function(t) {
                            t && !c.has(t) && (c.add(t), u(t.parentNode))
                        };
                    a.forEach(u);
                    var d = function(t) {
                        t && !s.has(t) && Array.prototype.forEach.call(t.children, function(t) {
                            if (c.has(t)) d(t);
                            else try {
                                var n = t.getAttribute(o),
                                    a = null !== n && "false" !== n,
                                    s = (tu.get(t) || 0) + 1,
                                    u = (i.get(t) || 0) + 1;
                                tu.set(t, s), i.set(t, u), l.push(t), 1 === s && a && td.set(t, !0), 1 === u && t.setAttribute(r, "true"), a || t.setAttribute(o, "true")
                            } catch (n) {
                                console.error("aria-hidden: cannot operate on ", t, n)
                            }
                        })
                    };
                    return d(n), c.clear(), tp++,
                        function() {
                            l.forEach(function(t) {
                                var n = tu.get(t) - 1,
                                    a = i.get(t) - 1;
                                tu.set(t, n), i.set(t, a), n || (td.has(t) || t.removeAttribute(o), td.delete(t)), a || t.removeAttribute(r)
                            }), --tp || (tu = new WeakMap, tu = new WeakMap, td = new WeakMap, tf = {})
                        }
                },
                ty = function(t, n, r) {
                    void 0 === r && (r = "data-aria-hidden");
                    var o = Array.from(Array.isArray(t) ? t : [t]),
                        a = n || ("undefined" == typeof document ? null : (Array.isArray(t) ? t[0] : t).ownerDocument.body);
                    return a ? (o.push.apply(o, Array.from(a.querySelectorAll("[aria-live]"))), tv(o, a, r, "aria-hidden")) : function() {
                        return null
                    }
                },
                th = "right-scroll-bar-position",
                tb = "width-before-scroll-bar";

            function tg(t, n) {
                return "function" == typeof t ? t(n) : t && (t.current = n), t
            }
            var tw = "undefined" != typeof window ? ef.useLayoutEffect : ef.useEffect,
                tE = new WeakMap,
                tx = function(t) {
                    var n = t.sideCar,
                        r = eg(t, ["sideCar"]);
                    if (!n) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                    var o = n.read();
                    if (!o) throw Error("Sidecar medium not found");
                    return ef.createElement(o, eb({}, r))
                };
            tx.isSideCarExport = !0;
            var tS = (void 0 === tF && (tF = {}), (void 0 === tB && (tB = function(t) {
                    return t
                }), tW = [], tG = !1, tV = {
                    read: function() {
                        if (tG) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                        return tW.length ? tW[tW.length - 1] : null
                    },
                    useMedium: function(t) {
                        var n = tB(t, tG);
                        return tW.push(n),
                            function() {
                                tW = tW.filter(function(t) {
                                    return t !== n
                                })
                            }
                    },
                    assignSyncMedium: function(t) {
                        for (tG = !0; tW.length;) {
                            var n = tW;
                            tW = [], n.forEach(t)
                        }
                        tW = {
                            push: function(n) {
                                return t(n)
                            },
                            filter: function() {
                                return tW
                            }
                        }
                    },
                    assignMedium: function(t) {
                        tG = !0;
                        var n = [];
                        if (tW.length) {
                            var r = tW;
                            tW = [], r.forEach(t), n = tW
                        }
                        var o = function() {
                                var r = n;
                                n = [], r.forEach(t)
                            },
                            a = function() {
                                return Promise.resolve().then(o)
                            };
                        a(), tW = {
                            push: function(t) {
                                n.push(t), a()
                            },
                            filter: function(t) {
                                return n = n.filter(t), tW
                            }
                        }
                    }
                }).options = eb({
                    async: !0,
                    ssr: !1
                }, tF), tV),
                tP = function() {},
                tO = ef.forwardRef(function(t, n) {
                    var r, o, a, i, l = ef.useRef(null),
                        c = ef.useState({
                            onScrollCapture: tP,
                            onWheelCapture: tP,
                            onTouchMoveCapture: tP
                        }),
                        s = c[0],
                        u = c[1],
                        d = t.forwardProps,
                        f = t.children,
                        p = t.className,
                        m = t.removeScrollBar,
                        v = t.enabled,
                        y = t.shards,
                        h = t.sideCar,
                        b = t.noIsolation,
                        g = t.inert,
                        w = t.allowPinchZoom,
                        E = t.as,
                        x = t.gapMode,
                        S = eg(t, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        P = (r = [l, n], o = function(t) {
                            return r.forEach(function(n) {
                                return tg(n, t)
                            })
                        }, (a = (0, ef.useState)(function() {
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
                        })[0]).callback = o, i = a.facade, tw(function() {
                            var t = tE.get(i);
                            if (t) {
                                var n = new Set(t),
                                    o = new Set(r),
                                    a = i.current;
                                n.forEach(function(t) {
                                    o.has(t) || tg(t, null)
                                }), o.forEach(function(t) {
                                    n.has(t) || tg(t, a)
                                })
                            }
                            tE.set(i, r)
                        }, [r]), i),
                        O = eb(eb({}, S), s);
                    return ef.createElement(ef.Fragment, null, v && ef.createElement(h, {
                        sideCar: tS,
                        removeScrollBar: m,
                        shards: y,
                        noIsolation: b,
                        inert: g,
                        setCallbacks: u,
                        allowPinchZoom: !!w,
                        lockRef: l,
                        gapMode: x
                    }), d ? ef.cloneElement(ef.Children.only(f), eb(eb({}, O), {
                        ref: P
                    })) : ef.createElement(void 0 === E ? "div" : E, eb({}, O, {
                        className: p,
                        ref: P
                    }), f))
                });
            tO.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, tO.classNames = {
                fullWidth: tb,
                zeroRight: th
            };
            var tA = function() {
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
                tI = function() {
                    var t, n = (t = tA(), function(n, r) {
                        ef.useEffect(function() {
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
                tN = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                tC = function(t) {
                    return parseInt(t || "", 10) || 0
                },
                tT = function(t) {
                    if (void 0 === t && (t = "margin"), "undefined" == typeof window) return tN;
                    var n, r, o, a, i, l = (n = t, o = (r = window.getComputedStyle(document.body))["padding" === n ? "paddingLeft" : "marginLeft"], a = r["padding" === n ? "paddingTop" : "marginTop"], i = r["padding" === n ? "paddingRight" : "marginRight"], [tC(o), tC(a), tC(i)]),
                        c = document.documentElement.clientWidth,
                        s = window.innerWidth;
                    return {
                        left: l[0],
                        top: l[1],
                        right: l[2],
                        gap: Math.max(0, s - c + l[2] - l[0])
                    }
                },
                t_ = tI(),
                tj = "data-scroll-locked",
                tU = function(t, n, r, o) {
                    var a = t.left,
                        i = t.top,
                        l = t.right,
                        c = t.gap;
                    return void 0 === r && (r = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(o, ";\n   padding-right: ").concat(c, "px ").concat(o, ";\n  }\n  body[").concat(tj, "] {\n    overflow: hidden ").concat(o, ";\n    overscroll-behavior: contain;\n    ").concat([n && "position: relative ".concat(o, ";"), "margin" === r && "\n    padding-left: ".concat(a, "px;\n    padding-top: ").concat(i, "px;\n    padding-right: ").concat(l, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(c, "px ").concat(o, ";\n    "), "padding" === r && "padding-right: ".concat(c, "px ").concat(o, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(th, " {\n    right: ").concat(c, "px ").concat(o, ";\n  }\n  \n  .").concat(tb, " {\n    margin-right: ").concat(c, "px ").concat(o, ";\n  }\n  \n  .").concat(th, " .").concat(th, " {\n    right: 0 ").concat(o, ";\n  }\n  \n  .").concat(tb, " .").concat(tb, " {\n    margin-right: 0 ").concat(o, ";\n  }\n  \n  body[").concat(tj, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(c, "px;\n  }\n")
                },
                tR = function() {
                    var t = parseInt(document.body.getAttribute(tj) || "0", 10);
                    return isFinite(t) ? t : 0
                },
                tM = function(t) {
                    var n = t.noRelative,
                        r = t.noImportant,
                        o = t.gapMode,
                        a = void 0 === o ? "margin" : o;
                    ef.useEffect(function() {
                        return document.body.setAttribute(tj, (tR() + 1).toString()),
                            function() {
                                var t = tR() - 1;
                                t <= 0 ? document.body.removeAttribute(tj) : document.body.setAttribute(tj, t.toString())
                            }
                    }, []);
                    var i = ef.useMemo(function() {
                        return tT(a)
                    }, [a]);
                    return ef.createElement(t_, {
                        styles: tU(i, !n, a, r ? "" : "!important")
                    })
                },
                tk = !1;
            if ("undefined" != typeof window) try {
                var tD = Object.defineProperty({}, "passive", {
                    get: function() {
                        return tk = !0, !0
                    }
                });
                window.addEventListener("test", tD, tD), window.removeEventListener("test", tD, tD)
            } catch (t) {
                tk = !1
            }
            var tL, tF, tB, tW, tG, tV, tz, tX = !!tk && {
                    passive: !1
                },
                tH = function(t, n) {
                    if (!eN(t, Element)) return !1;
                    var r = window.getComputedStyle(t);
                    return "hidden" !== r[n] && (r.overflowY !== r.overflowX || "TEXTAREA" === t.tagName || "visible" !== r[n])
                },
                tY = function(t, n) {
                    var r = n.ownerDocument,
                        o = n;
                    do {
                        if ("undefined" != typeof ShadowRoot && eN(o, ShadowRoot) && (o = o.host), tK(t, o)) {
                            var a = tq(t, o);
                            if (a[1] > a[2]) return !0
                        }
                        o = o.parentNode
                    } while (o && o !== r.body);
                    return !1
                },
                tK = function(t, n) {
                    return "v" === t ? tH(n, "overflowY") : tH(n, "overflowX")
                },
                tq = function(t, n) {
                    return "v" === t ? [n.scrollTop, n.scrollHeight, n.clientHeight] : [n.scrollLeft, n.scrollWidth, n.clientWidth]
                },
                t$ = function(t, n, r, o, a) {
                    var i, l = (i = window.getComputedStyle(n).direction, "h" === t && "rtl" === i ? -1 : 1),
                        c = l * o,
                        s = r.target,
                        u = n.contains(s),
                        d = !1,
                        f = c > 0,
                        p = 0,
                        m = 0;
                    do {
                        var v = tq(t, s),
                            y = v[0],
                            h = v[1] - v[2] - l * y;
                        (y || h) && tK(t, s) && (p += h, m += y), s = eN(s, ShadowRoot) ? s.host : s.parentNode
                    } while (!u && s !== document.body || u && (n.contains(s) || n === s));
                    return (f && (a && 1 > Math.abs(p) || !a && c > p) || !f && (a && 1 > Math.abs(m) || !a && -c > m)) && (d = !0), d
                },
                tZ = function(t) {
                    return "changedTouches" in t ? [t.changedTouches[0].clientX, t.changedTouches[0].clientY] : [0, 0]
                },
                tJ = function(t) {
                    return [t.deltaX, t.deltaY]
                },
                tQ = function(t) {
                    return t && "current" in t ? t.current : t
                },
                t0 = 0,
                t1 = [],
                t2 = (tz = function(t) {
                    var n = ef.useRef([]),
                        r = ef.useRef([0, 0]),
                        o = ef.useRef(),
                        a = ef.useState(t0++)[0],
                        i = ef.useState(tI)[0],
                        l = ef.useRef(t);
                    ef.useEffect(function() {
                        l.current = t
                    }, [t]), ef.useEffect(function() {
                        if (t.inert) {
                            document.body.classList.add("block-interactivity-".concat(a));
                            var n = (function(t, n, r) {
                                if (r || 2 == arguments.length)
                                    for (var o, a = 0, i = n.length; a < i; a++) !o && a in n || (o || (o = Array.prototype.slice.call(n, 0, a)), o[a] = n[a]);
                                return t.concat(o || Array.prototype.slice.call(n))
                            })([t.lockRef.current], (t.shards || []).map(tQ), !0).filter(Boolean);
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
                    var c = ef.useCallback(function(t, n) {
                            if ("touches" in t && 2 === t.touches.length || "wheel" === t.type && t.ctrlKey) return !l.current.allowPinchZoom;
                            var a, i = tZ(t),
                                c = r.current,
                                s = "deltaX" in t ? t.deltaX : c[0] - i[0],
                                u = "deltaY" in t ? t.deltaY : c[1] - i[1],
                                d = t.target,
                                f = Math.abs(s) > Math.abs(u) ? "h" : "v";
                            if ("touches" in t && "h" === f && "range" === d.type) return !1;
                            var p = tY(f, d);
                            if (!p) return !0;
                            if (p ? a = f : (a = "v" === f ? "h" : "v", p = tY(f, d)), !p) return !1;
                            if (!o.current && "changedTouches" in t && (s || u) && (o.current = a), !a) return !0;
                            var m = o.current || a;
                            return t$(m, n, t, "h" === m ? s : u, !0)
                        }, []),
                        s = ef.useCallback(function(t) {
                            if (t1.length && t1[t1.length - 1] === i) {
                                var r = "deltaY" in t ? tJ(t) : tZ(t),
                                    o = n.current.filter(function(n) {
                                        var o;
                                        return n.name === t.type && (n.target === t.target || t.target === n.shadowParent) && (o = n.delta, o[0] === r[0] && o[1] === r[1])
                                    })[0];
                                if (o && o.should) t.cancelable && t.preventDefault();
                                else if (!o) {
                                    var a = (l.current.shards || []).map(tQ).filter(Boolean).filter(function(n) {
                                        return n.contains(t.target)
                                    });
                                    (a.length > 0 ? c(t, a[0]) : !l.current.noIsolation) && t.cancelable && t.preventDefault()
                                }
                            }
                        }, []),
                        u = ef.useCallback(function(t, r, o, a) {
                            var i = {
                                name: t,
                                delta: r,
                                target: o,
                                should: a,
                                shadowParent: function(t) {
                                    for (var n = null; null !== t;) eN(t, ShadowRoot) && (n = t.host, t = t.host), t = t.parentNode;
                                    return n
                                }(o)
                            };
                            n.current.push(i), setTimeout(function() {
                                n.current = n.current.filter(function(t) {
                                    return t !== i
                                })
                            }, 1)
                        }, []),
                        d = ef.useCallback(function(t) {
                            r.current = tZ(t), o.current = void 0
                        }, []),
                        f = ef.useCallback(function(n) {
                            u(n.type, tJ(n), n.target, c(n, t.lockRef.current))
                        }, []),
                        p = ef.useCallback(function(n) {
                            u(n.type, tZ(n), n.target, c(n, t.lockRef.current))
                        }, []);
                    ef.useEffect(function() {
                        return t1.push(i), t.setCallbacks({
                                onScrollCapture: f,
                                onWheelCapture: f,
                                onTouchMoveCapture: p
                            }), document.addEventListener("wheel", s, tX), document.addEventListener("touchmove", s, tX), document.addEventListener("touchstart", d, tX),
                            function() {
                                t1 = t1.filter(function(t) {
                                    return t !== i
                                }), document.removeEventListener("wheel", s, tX), document.removeEventListener("touchmove", s, tX), document.removeEventListener("touchstart", d, tX)
                            }
                    }, []);
                    var m = t.removeScrollBar,
                        v = t.inert;
                    return ef.createElement(ef.Fragment, null, v ? ef.createElement(i, {
                        styles: "\n  .block-interactivity-".concat(a, " {pointer-events: none;}\n  .allow-interactivity-").concat(a, " {pointer-events: all;}\n")
                    }) : null, m ? ef.createElement(tM, {
                        gapMode: t.gapMode
                    }) : null)
                }, tS.useMedium(tz), tx),
                t3 = ef.forwardRef(function(t, n) {
                    return ef.createElement(tO, eb({}, t, {
                        ref: n,
                        sideCar: t2
                    }))
                });

            function t5(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function t4(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function t6(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        t4(t, n, r[n])
                    })
                }
                return t
            }

            function t8(t, n) {
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

            function t7(t, n) {
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

            function t9(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var i = [],
                            l = !0,
                            c = !1;
                        try {
                            for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            c = !0, o = t
                        } finally {
                            try {
                                l || null == a.return || a.return()
                            } finally {
                                if (c) throw o
                            }
                        }
                        return i
                    }
                }(t, n) || nt(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ne(t) {
                return function(t) {
                    if (Array.isArray(t)) return t5(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || nt(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nt(t, n) {
                if (t) {
                    if ("string" == typeof t) return t5(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return t5(t, n)
                }
            }

            function nn(t, n) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    o = r.checkForDefaultPrevented,
                    a = void 0 === o || o;
                return function(r) {
                    if (null == t || t(r), !1 === a || !r.defaultPrevented) return null == n ? void 0 : n(r)
                }
            }

            function nr(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }

            function no() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return function(t) {
                    var r = !1,
                        o = n.map(function(n) {
                            var o = nr(n, t);
                            return r || "function" != typeof o || (r = !0), o
                        });
                    if (r) return function() {
                        for (var t = 0; t < o.length; t++) {
                            var r = o[t];
                            "function" == typeof r ? r() : nr(n[t], null)
                        }
                    }
                }
            }

            function na() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return ef.useCallback(no.apply(void 0, ne(n)), n)
            }

            function ni() {
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
                            return t6({}, t, o(n)["__scope".concat(a)])
                        }, {});
                        return ef.useMemo(function() {
                            return t4({}, "__scope".concat(o.scopeName), r)
                        }, [r])
                    }
                };
                return a.scopeName = o.scopeName, a
            }

            function nl(t) {
                var n = ef.useRef(t);
                return ef.useEffect(function() {
                    n.current = t
                }), ef.useMemo(function() {
                    return function() {
                        for (var t, r = arguments.length, o = Array(r), a = 0; a < r; a++) o[a] = arguments[a];
                        return null == (t = n.current) ? void 0 : t.call.apply(t, [n].concat(ne(o)))
                    }
                }, [])
            }
            t3.classNames = tO.classNames;
            var nc = (null == (c = globalThis) ? void 0 : c.document) ? ef.useLayoutEffect : function() {},
                ns = function(t) {
                    var n, r, o, a, i, l, c, s, u, d, f, p, m, v, y = t.present,
                        h = t.children,
                        b = (a = (o = t9(ef.useState(), 2))[0], i = o[1], l = ef.useRef({}), c = ef.useRef(y), s = ef.useRef("none"), d = (u = t9((n = y ? "mounted" : "unmounted", r = {
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
                        }, ef.useReducer(function(t, n) {
                            var o;
                            return null != (o = r[t][n]) ? o : t
                        }, n)), 2))[0], f = u[1], ef.useEffect(function() {
                            var t = nu(l.current);
                            s.current = "mounted" === d ? t : "none"
                        }, [d]), nc(function() {
                            var t = l.current,
                                n = c.current;
                            if (n !== y) {
                                var r = s.current,
                                    o = nu(t);
                                y ? f("MOUNT") : "none" === o || "none" === (null == t ? void 0 : t.display) ? f("UNMOUNT") : f(n && r !== o ? "ANIMATION_OUT" : "UNMOUNT"), c.current = y
                            }
                        }, [y, f]), nc(function() {
                            if (a) {
                                var t, n, r = null != (n = a.ownerDocument.defaultView) ? n : window,
                                    o = function(n) {
                                        var o = nu(l.current).includes(n.animationName);
                                        if (n.target === a && o && (f("ANIMATION_END"), !c.current)) {
                                            var i = a.style.animationFillMode;
                                            a.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                                "forwards" === a.style.animationFillMode && (a.style.animationFillMode = i)
                                            })
                                        }
                                    },
                                    i = function(t) {
                                        t.target === a && (s.current = nu(l.current))
                                    };
                                return a.addEventListener("animationstart", i), a.addEventListener("animationcancel", o), a.addEventListener("animationend", o),
                                    function() {
                                        r.clearTimeout(t), a.removeEventListener("animationstart", i), a.removeEventListener("animationcancel", o), a.removeEventListener("animationend", o)
                                    }
                            }
                            f("ANIMATION_END")
                        }, [a, f]), {
                            isPresent: ["mounted", "unmountSuspended"].includes(d),
                            ref: ef.useCallback(function(t) {
                                t && (l.current = getComputedStyle(t)), i(t)
                            }, [])
                        }),
                        g = "function" == typeof h ? h({
                            present: b.isPresent
                        }) : ef.Children.only(h),
                        w = na(b.ref, (v = null == (p = Object.getOwnPropertyDescriptor(g.props, "ref")) ? void 0 : p.get) && "isReactWarning" in v && v.isReactWarning ? g.ref : (v = null == (m = Object.getOwnPropertyDescriptor(g, "ref")) ? void 0 : m.get) && "isReactWarning" in v && v.isReactWarning ? g.props.ref : g.props.ref || g.ref);
                    return "function" == typeof h || b.isPresent ? ef.cloneElement(g, {
                        ref: w
                    }) : null
                };

            function nu(t) {
                return (null == t ? void 0 : t.animationName) || "none"
            }

            function nd(t) {
                var n, r, o = (n = t, (r = ef.forwardRef(function(t, n) {
                        var r = t.children,
                            o = t7(t, ["children"]);
                        if (ef.isValidElement(r)) {
                            var a, i, l, c = (l = null == (a = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (i = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                s = function(t, n) {
                                    var r = t6({}, n);
                                    for (var o in n) ! function(o) {
                                        var a = t[o],
                                            i = n[o];
                                        /^on[A-Z]/.test(o) ? a && i ? r[o] = function() {
                                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                            i.apply(void 0, ne(n)), a.apply(void 0, ne(n))
                                        } : a && (r[o] = a) : "style" === o ? r[o] = t6({}, a, i) : "className" === o && (r[o] = [a, i].filter(Boolean).join(" "))
                                    }(o);
                                    return t6({}, t, r)
                                }(o, r.props);
                            return r.type !== ef.Fragment && (s.ref = n ? no(n, c) : c), ef.cloneElement(r, s)
                        }
                        return ef.Children.count(r) > 1 ? ef.Children.only(null) : null
                    })).displayName = "".concat(n, ".SlotClone"), r),
                    a = ef.forwardRef(function(t, n) {
                        var r = t.children,
                            a = t7(t, ["children"]),
                            i = ef.Children.toArray(r),
                            l = i.find(np);
                        if (l) {
                            var c = l.props.children,
                                s = i.map(function(t) {
                                    return t === l ? ef.Children.count(c) > 1 ? ef.Children.only(null) : ef.isValidElement(c) ? c.props.children : null : t
                                });
                            return (0, eh.jsx)(o, t8(t6({}, a), {
                                ref: n,
                                children: ef.isValidElement(c) ? ef.cloneElement(c, void 0, s) : null
                            }))
                        }
                        return (0, eh.jsx)(o, t8(t6({}, a), {
                            ref: n,
                            children: r
                        }))
                    });
                return a.displayName = "".concat(t, ".Slot"), a
            }
            ns.displayName = "Presence";
            var nf = Symbol("radix.slottable");

            function np(t) {
                return ef.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === nf
            }
            var nm = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                    var r = nd("Primitive.".concat(n)),
                        o = ef.forwardRef(function(t, o) {
                            var a = t.asChild,
                                i = t7(t, ["asChild"]),
                                l = a ? r : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, eh.jsx)(l, t8(t6({}, i), {
                                ref: o
                            }))
                        });
                    return o.displayName = "Primitive.".concat(n), t8(t6({}, t), t4({}, n, o))
                }, {}),
                nv = "Dialog",
                ny = t9(function(t) {
                    var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        o = function() {
                            var n = r.map(function(t) {
                                return ef.createContext(t)
                            });
                            return function(r) {
                                var o = (null == r ? void 0 : r[t]) || n;
                                return ef.useMemo(function() {
                                    return t4({}, "__scope".concat(t), t8(t6({}, r), t4({}, t, o)))
                                }, [r, o])
                            }
                        };
                    return o.scopeName = t, [function(n, o) {
                        var a = ef.createContext(o),
                            i = r.length;
                        r = ne(r).concat([o]);
                        var l = function(n) {
                            var r, o = n.scope,
                                l = n.children,
                                c = t7(n, ["scope", "children"]),
                                s = (null == o || null == (r = o[t]) ? void 0 : r[i]) || a,
                                u = ef.useMemo(function() {
                                    return c
                                }, Object.values(c));
                            return (0, eh.jsx)(s.Provider, {
                                value: u,
                                children: l
                            })
                        };
                        return l.displayName = n + "Provider", [l, function(r, l) {
                            var c, s = (null == l || null == (c = l[t]) ? void 0 : c[i]) || a,
                                u = ef.useContext(s);
                            if (u) return u;
                            if (void 0 !== o) return o;
                            throw Error("`".concat(r, "` must be used within `").concat(n, "`"))
                        }]
                    }, ni.apply(void 0, [o].concat(ne(n)))]
                }(nv), 2),
                nh = ny[0],
                nb = (ny[1], t9(nh(nv), 2)),
                ng = nb[0],
                nw = nb[1],
                nE = function(t) {
                    var n, r, o, a, i, l, c, s, u, d, f, p, m, v, y, h, b, g = t.__scopeDialog,
                        w = t.children,
                        E = t.open,
                        x = t.defaultOpen,
                        S = t.onOpenChange,
                        P = t.modal,
                        O = ef.useRef(null),
                        A = ef.useRef(null),
                        I = t9((r = (n = {
                            prop: E,
                            defaultProp: x,
                            onChange: S
                        }).prop, m = (p = t9((l = (i = {
                            defaultProp: n.defaultProp,
                            onChange: a = void 0 === (o = n.onChange) ? function() {} : o
                        }).defaultProp, c = i.onChange, u = t9(s = ef.useState(l), 1)[0], d = ef.useRef(u), f = nl(c), ef.useEffect(function() {
                            d.current !== u && (f(u), d.current = u)
                        }, [u, d, f]), s), 2))[0], v = p[1], h = (y = void 0 !== r) ? r : m, b = nl(a), [h, ef.useCallback(function(t) {
                            if (y) {
                                var n = "function" == typeof t ? t(r) : t;
                                n !== r && b(n)
                            } else v(t)
                        }, [y, r, v, b])]), 2),
                        N = I[0],
                        C = I[1];
                    return (0, eh.jsx)(ng, {
                        scope: g,
                        triggerRef: O,
                        contentRef: A,
                        contentId: eO(),
                        titleId: eO(),
                        descriptionId: eO(),
                        open: void 0 !== N && N,
                        onOpenChange: C,
                        onOpenToggle: ef.useCallback(function() {
                            return C(function(t) {
                                return !t
                            })
                        }, [C]),
                        modal: void 0 === P || P,
                        children: w
                    })
                };
            nE.displayName = nv;
            var nx = "DialogTrigger";
            ef.forwardRef(function(t, n) {
                var r = t.__scopeDialog,
                    o = t7(t, ["__scopeDialog"]),
                    a = nw(nx, r),
                    i = na(n, a.triggerRef);
                return (0, eh.jsx)(nm.button, t8(t6({
                    type: "button",
                    "aria-haspopup": "dialog",
                    "aria-expanded": a.open,
                    "aria-controls": a.contentId,
                    "data-state": nW(a.open)
                }, o), {
                    ref: i,
                    onClick: nn(t.onClick, a.onOpenToggle)
                }))
            }).displayName = nx;
            var nS = "DialogPortal",
                nP = t9(nh(nS, {
                    forceMount: void 0
                }), 2),
                nO = nP[0],
                nA = nP[1],
                nI = function(t) {
                    var n = t.__scopeDialog,
                        r = t.forceMount,
                        o = t.children,
                        a = t.container,
                        i = nw(nS, n);
                    return (0, eh.jsx)(nO, {
                        scope: n,
                        forceMount: r,
                        children: ef.Children.map(o, function(t) {
                            return (0, eh.jsx)(ns, {
                                present: r || i.open,
                                children: (0, eh.jsx)(ts, {
                                    asChild: !0,
                                    container: a,
                                    children: t
                                })
                            })
                        })
                    })
                };
            nI.displayName = nS;
            var nN = "DialogOverlay",
                nC = ef.forwardRef(function(t, n) {
                    var r = nA(nN, t.__scopeDialog),
                        o = t.forceMount,
                        a = void 0 === o ? r.forceMount : o,
                        i = t7(t, ["forceMount"]),
                        l = nw(nN, t.__scopeDialog);
                    return l.modal ? (0, eh.jsx)(ns, {
                        present: a || l.open,
                        children: (0, eh.jsx)(n_, t8(t6({}, i), {
                            ref: n
                        }))
                    }) : null
                });
            nC.displayName = nN;
            var nT = nd("DialogOverlay.RemoveScroll"),
                n_ = ef.forwardRef(function(t, n) {
                    var r = t.__scopeDialog,
                        o = t7(t, ["__scopeDialog"]),
                        a = nw(nN, r);
                    return (0, eh.jsx)(t3, {
                        as: nT,
                        allowPinchZoom: !0,
                        shards: [a.contentRef],
                        children: (0, eh.jsx)(nm.div, t8(t6({
                            "data-state": nW(a.open)
                        }, o), {
                            ref: n,
                            style: t6({
                                pointerEvents: "auto"
                            }, o.style)
                        }))
                    })
                }),
                nj = "DialogContent",
                nU = ef.forwardRef(function(t, n) {
                    var r = nA(nj, t.__scopeDialog),
                        o = t.forceMount,
                        a = void 0 === o ? r.forceMount : o,
                        i = t7(t, ["forceMount"]),
                        l = nw(nj, t.__scopeDialog);
                    return (0, eh.jsx)(ns, {
                        present: a || l.open,
                        children: l.modal ? (0, eh.jsx)(nR, t8(t6({}, i), {
                            ref: n
                        })) : (0, eh.jsx)(nM, t8(t6({}, i), {
                            ref: n
                        }))
                    })
                });
            nU.displayName = nj;
            var nR = ef.forwardRef(function(t, n) {
                    var r = nw(nj, t.__scopeDialog),
                        o = ef.useRef(null),
                        a = na(n, r.contentRef, o);
                    return ef.useEffect(function() {
                        var t = o.current;
                        if (t) return ty(t)
                    }, []), (0, eh.jsx)(nk, t8(t6({}, t), {
                        ref: a,
                        trapFocus: r.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: nn(t.onCloseAutoFocus, function(t) {
                            var n;
                            t.preventDefault(), null == (n = r.triggerRef.current) || n.focus()
                        }),
                        onPointerDownOutside: nn(t.onPointerDownOutside, function(t) {
                            var n = t.detail.originalEvent,
                                r = 0 === n.button && !0 === n.ctrlKey;
                            (2 === n.button || r) && t.preventDefault()
                        }),
                        onFocusOutside: nn(t.onFocusOutside, function(t) {
                            return t.preventDefault()
                        })
                    }))
                }),
                nM = ef.forwardRef(function(t, n) {
                    var r = nw(nj, t.__scopeDialog),
                        o = ef.useRef(!1),
                        a = ef.useRef(!1);
                    return (0, eh.jsx)(nk, t8(t6({}, t), {
                        ref: n,
                        trapFocus: !1,
                        disableOutsidePointerEvents: !1,
                        onCloseAutoFocus: function(n) {
                            var i, l;
                            null == (i = t.onCloseAutoFocus) || i.call(t, n), n.defaultPrevented || (o.current || null == (l = r.triggerRef.current) || l.focus(), n.preventDefault()), o.current = !1, a.current = !1
                        },
                        onInteractOutside: function(n) {
                            null == (i = t.onInteractOutside) || i.call(t, n), n.defaultPrevented || (o.current = !0, "pointerdown" === n.detail.originalEvent.type && (a.current = !0));
                            var i, l, c = n.target;
                            (null == (l = r.triggerRef.current) ? void 0 : l.contains(c)) && n.preventDefault(), "focusin" === n.detail.originalEvent.type && a.current && n.preventDefault()
                        }
                    }))
                }),
                nk = ef.forwardRef(function(t, n) {
                    var r = t.__scopeDialog,
                        o = t.trapFocus,
                        a = t.onOpenAutoFocus,
                        i = t.onCloseAutoFocus,
                        l = t7(t, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        c = nw(nj, r),
                        s = ef.useRef(null),
                        u = na(n, s);
                    return ef.useEffect(function() {
                        var t, n, r = document.querySelectorAll("[data-radix-focus-guard]");
                        return document.body.insertAdjacentElement("afterbegin", null != (t = r[0]) ? t : eJ()), document.body.insertAdjacentElement("beforeend", null != (n = r[1]) ? n : eJ()), eZ++,
                            function() {
                                1 === eZ && document.querySelectorAll("[data-radix-focus-guard]").forEach(function(t) {
                                    return t.remove()
                                }), eZ--
                            }
                    }, []), (0, eh.jsxs)(eh.Fragment, {
                        children: [(0, eh.jsx)(e7, {
                            asChild: !0,
                            loop: !0,
                            trapped: o,
                            onMountAutoFocus: a,
                            onUnmountAutoFocus: i,
                            children: (0, eh.jsx)(eK, t8(t6({
                                role: "dialog",
                                id: c.contentId,
                                "aria-describedby": c.descriptionId,
                                "aria-labelledby": c.titleId,
                                "data-state": nW(c.open)
                            }, l), {
                                ref: u,
                                onDismiss: function() {
                                    return c.onOpenChange(!1)
                                }
                            }))
                        }), (0, eh.jsxs)(eh.Fragment, {
                            children: [(0, eh.jsx)(nX, {
                                titleId: c.titleId
                            }), (0, eh.jsx)(nH, {
                                contentRef: s,
                                descriptionId: c.descriptionId
                            })]
                        })]
                    })
                }),
                nD = "DialogTitle";
            ef.forwardRef(function(t, n) {
                var r = t.__scopeDialog,
                    o = t7(t, ["__scopeDialog"]),
                    a = nw(nD, r);
                return (0, eh.jsx)(nm.h2, t8(t6({
                    id: a.titleId
                }, o), {
                    ref: n
                }))
            }).displayName = nD;
            var nL = "DialogDescription";
            ef.forwardRef(function(t, n) {
                var r = t.__scopeDialog,
                    o = t7(t, ["__scopeDialog"]),
                    a = nw(nL, r);
                return (0, eh.jsx)(nm.p, t8(t6({
                    id: a.descriptionId
                }, o), {
                    ref: n
                }))
            }).displayName = nL;
            var nF = "DialogClose",
                nB = ef.forwardRef(function(t, n) {
                    var r = t.__scopeDialog,
                        o = t7(t, ["__scopeDialog"]),
                        a = nw(nF, r);
                    return (0, eh.jsx)(nm.button, t8(t6({
                        type: "button"
                    }, o), {
                        ref: n,
                        onClick: nn(t.onClick, function() {
                            return a.onOpenChange(!1)
                        })
                    }))
                });

            function nW(t) {
                return t ? "open" : "closed"
            }
            nB.displayName = nF;
            var nG = "DialogTitleWarning",
                nV = t9((n = {
                    contentName: nj,
                    titleName: nD,
                    docsSlug: "dialog"
                }, o = ef.createContext(n), (a = function(t) {
                    var n = t.children,
                        r = t7(t, ["children"]),
                        a = ef.useMemo(function() {
                            return r
                        }, Object.values(r));
                    return (0, eh.jsx)(o.Provider, {
                        value: a,
                        children: n
                    })
                }).displayName = nG + "Provider", [a, function(t) {
                    var r = ef.useContext(o);
                    if (r) return r;
                    if (void 0 !== n) return n;
                    throw Error("`".concat(t, "` must be used within `").concat(nG, "`"))
                }]), 2),
                nz = (nV[0], nV[1]),
                nX = function(t) {
                    var n = t.titleId,
                        r = nz(nG),
                        o = "`".concat(r.contentName, "` requires a `").concat(r.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(r.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(r.docsSlug);
                    return ef.useEffect(function() {
                        n && (document.getElementById(n) || console.error(o))
                    }, [o, n]), null
                },
                nH = function(t) {
                    var n = t.contentRef,
                        r = t.descriptionId,
                        o = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(nz("DialogDescriptionWarning").contentName, "}.");
                    return ef.useEffect(function() {
                        var t, a = null == (t = n.current) ? void 0 : t.getAttribute("aria-describedby");
                        r && a && (document.getElementById(r) || console.warn(o))
                    }, [o, n, r]), null
                };

            function nY(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function nK(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function nq(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        nK(t, n, r[n])
                    })
                }
                return t
            }

            function n$(t, n) {
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

            function nZ(t, n) {
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

            function nJ(t) {
                return function(t) {
                    if (Array.isArray(t)) return nY(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return nY(t, void 0);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nY(t, n)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nQ(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }
            var n0 = Symbol("radix.slottable");

            function n1(t) {
                return ef.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === n0
            }
            var n2 = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(t, n) {
                    var r, o, a, i, l, c = (o = r = "Primitive.".concat(n), (a = ef.forwardRef(function(t, n) {
                            var r = t.children,
                                o = nZ(t, ["children"]);
                            if (ef.isValidElement(r)) {
                                var a, i, l, c = (l = null == (a = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (i = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                    s = function(t, n) {
                                        var r = nq({}, n);
                                        for (var o in n) ! function(o) {
                                            var a = t[o],
                                                i = n[o];
                                            /^on[A-Z]/.test(o) ? a && i ? r[o] = function() {
                                                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                                var o = i.apply(void 0, nJ(n));
                                                return a.apply(void 0, nJ(n)), o
                                            } : a && (r[o] = a) : "style" === o ? r[o] = nq({}, a, i) : "className" === o && (r[o] = [a, i].filter(Boolean).join(" "))
                                        }(o);
                                        return nq({}, t, r)
                                    }(o, r.props);
                                return r.type !== ef.Fragment && (s.ref = n ? function() {
                                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                    return function(t) {
                                        var r = !1,
                                            o = n.map(function(n) {
                                                var o = nQ(n, t);
                                                return r || "function" != typeof o || (r = !0), o
                                            });
                                        if (r) return function() {
                                            for (var t = 0; t < o.length; t++) {
                                                var r = o[t];
                                                "function" == typeof r ? r() : nQ(n[t], null)
                                            }
                                        }
                                    }
                                }(n, c) : c), ef.cloneElement(r, s)
                            }
                            return ef.Children.count(r) > 1 ? ef.Children.only(null) : null
                        })).displayName = "".concat(o, ".SlotClone"), i = a, (l = ef.forwardRef(function(t, n) {
                            var r = t.children,
                                o = nZ(t, ["children"]),
                                a = ef.Children.toArray(r),
                                l = a.find(n1);
                            if (l) {
                                var c = l.props.children,
                                    s = a.map(function(t) {
                                        return t === l ? ef.Children.count(c) > 1 ? ef.Children.only(null) : ef.isValidElement(c) ? c.props.children : null : t
                                    });
                                return (0, eh.jsx)(i, n$(nq({}, o), {
                                    ref: n,
                                    children: ef.isValidElement(c) ? ef.cloneElement(c, void 0, s) : null
                                }))
                            }
                            return (0, eh.jsx)(i, n$(nq({}, o), {
                                ref: n,
                                children: r
                            }))
                        })).displayName = "".concat(r, ".Slot"), l),
                        s = ef.forwardRef(function(t, r) {
                            var o = t.asChild,
                                a = nZ(t, ["asChild"]),
                                i = o ? c : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, eh.jsx)(i, n$(nq({}, a), {
                                ref: r
                            }))
                        });
                    return s.displayName = "Primitive.".concat(n), n$(nq({}, t), nK({}, n, s))
                }, {}),
                n3 = Object.freeze({
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

            function n5(t, n) {
                void 0 === n && (n = {});
                var r = n.insertAt;
                if (t && "undefined" != typeof document) {
                    var o = document.head || document.getElementsByTagName("head")[0],
                        a = document.createElement("style");
                    a.type = "text/css", "top" === r && o.firstChild ? o.insertBefore(a, o.firstChild) : o.appendChild(a), a.styleSheet ? a.styleSheet.cssText = t : a.appendChild(document.createTextNode(t))
                }
            }
            ef.forwardRef(function(t, n) {
                return (0, eh.jsx)(n2.span, n$(nq({}, t), {
                    ref: n,
                    style: nq({}, n3, t.style)
                }))
            }).displayName = "VisuallyHidden", n5(".bg-common-backdrop{background-color:var(--color-common-backdrop)}.shadow-transient-high{box-shadow:var(--size-0) var(--size-50) var(--size-100) -.5px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-250) var(--size-500) -.75px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-400) var(--size-800) -1px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-1200) var(--size-1400) -1.5px var(--alpha-color-shadow-subtle)}.shadow-transient-low{box-shadow:var(--size-0) var(--size-50) var(--size-100) -.5px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-250) var(--size-500) -.75px var(--alpha-color-shadow-subtle)}.foundation-web-portal-zindex{z-index:1050}.fui-future-shadow-affixed-low{box-shadow:0 0 var(--size-100) 0 var(--fui-future-alpha-color-shadow-subtle),0 0 var(--size-500) 0 var(--fui-future-alpha-color-shadow-subtle)}:root{--light-mode-stroke-contrast-alpha:rgba(27,37,75,.5);--dark-mode-stroke-contrast-alpha:rgba(208,217,251,.4);--color-stroke-contrast-alpha:var(--light-mode-stroke-contrast-alpha);--alpha-light-mode-shadow-subtle:rgba(0,0,0,.08);--alpha-dark-mode-shadow-subtle:rgba(4,4,8,.25);--alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}@media (prefers-color-scheme:dark){:root{--color-stroke-contrast-alpha:var(--dark-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}}.light-theme{--color-stroke-contrast-alpha:var(--light-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}.dark-theme{--color-stroke-contrast-alpha:var(--dark-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}.system-theme{--color-stroke-contrast-alpha:var(--light-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}@media (prefers-color-scheme:dark){.system-theme{--color-stroke-contrast-alpha:var(--dark-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}}.stroke-contrast-alpha{border-color:var(--color-stroke-contrast-alpha)}.foundation-web-input.focus-within\\:stroke-system-emphasis:focus-within{box-shadow:inset 0 0 0 1px var(--color-system-emphasis)}.foundation-web-input.focus-within\\:stroke-system-alert:focus-within{box-shadow:inset 0 0 0 1px var(--color-system-alert)}");
            var n4 = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                n6 = ep().forwardRef(function(t, n) {
                    var r = t.name,
                        o = t.size,
                        a = t.className,
                        i = (t.children, eg(t, ["name", "size", "className", "children"]));
                    return ep().createElement("span", Object.assign({
                        ref: n,
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-icon",
                        className: ew("grow-0 shrink-0 basis-auto icon", r, n4[void 0 === o ? "Medium" : o], a)
                    }, i))
                });
            n6.displayName = "Icon";
            var n8 = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                n7 = function(t) {
                    var n = t.className;
                    return ep().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: ew("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", n)
                    })
                },
                n9 = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-medium"
                },
                re = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                rt = function(t) {
                    var n = t.variant,
                        r = t.size,
                        o = t.isCircular,
                        a = t.className,
                        i = eg(t, ["variant", "size", "isCircular", "className"]);
                    return ep().createElement("button", Object.assign({
                        type: "button",
                        className: ew("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", n8, re[n], n9[r], o && "radius-circle", a)
                    }, i), ep().createElement(n7, null), ep().createElement(n6, {
                        name: "icon-regular-x",
                        size: r
                    }))
                };
            n5(".foundation-web-dialog-overlay{bottom:0;display:grid;left:0;overflow-y:auto;place-items:center;position:fixed;right:0;top:0}.foundation-web-dialog-close-container{right:var(--size-300);top:var(--size-300);z-index:1}.foundation-web-dialog-hero-media{border-top-left-radius:var(--radius-large);border-top-right-radius:var(--radius-large);margin-left:calc(var(--stroke-standard)*-1);margin-right:calc(var(--stroke-standard)*-1);margin-top:calc(var(--stroke-standard)*-1);overflow:clip}.foundation-web-dialog-content[data-size=Small]{max-width:calc(var(--size-100)*80);min-width:calc(var(--size-100)*75)}.foundation-web-dialog-content[data-size=Medium]{max-width:calc(var(--size-100)*120);min-width:calc(var(--size-100)*75)}.foundation-web-dialog-content[data-size=Large]{max-width:calc(var(--size-100)*160);min-width:calc(var(--size-100)*75)}@keyframes foundation-web-dialog-backdrop-fade-in{0%{opacity:0}to{opacity:1}}@keyframes foundation-web-dialog-backdrop-fade-out{0%{opacity:1}to{opacity:0}}@keyframes foundation-web-dialog-content-scale-in{0%{transform:scale(.975)}to{transform:scale(1)}}@keyframes foundation-web-dialog-content-scale-out{0%{transform:scale(1)}to{transform:scale(.975)}}@media (prefers-reduced-motion:no-preference){.foundation-web-dialog-overlay[data-state=open]{animation:foundation-web-dialog-backdrop-fade-in var(--time-100) var(--ease-linear)}.foundation-web-dialog-overlay[data-state=closed]{animation:foundation-web-dialog-backdrop-fade-out var(--time-100) var(--ease-linear)}.foundation-web-dialog-content[data-state=open]{animation:foundation-web-dialog-content-scale-in var(--time-300) var(--ease-standard-out)}.foundation-web-dialog-content[data-state=closed]{animation:foundation-web-dialog-content-scale-out var(--time-300) var(--ease-standard-out)}}");
            var rn = (0, ef.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    hasDescription: !1,
                    type: "Default"
                }),
                rr = function() {
                    var t = (0, ef.useContext)(rn);
                    if (!t) throw Error("Dialog components must be used within a Dialog");
                    return t
                },
                ro = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                ra = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                ri = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                rl = function(t) {
                    var n = t.open,
                        r = t.onOpenChange,
                        o = t.children,
                        a = t.size,
                        i = t.type,
                        l = void 0 === i ? "Default" : i,
                        c = t.isModal,
                        s = t.hasCloseAffordance,
                        u = t.closeLabel,
                        d = t.hasMarginTop,
                        f = void 0 === d || d,
                        p = t.hasMarginBottom,
                        m = void 0 === p || p,
                        v = t.hasDescription,
                        y = void 0 !== v && v,
                        h = t.experimentalDisablePointerEventsStylingOnBody,
                        b = void 0 !== h && h,
                        g = (0, ef.useMemo)(function() {
                            return {
                                size: a,
                                isModal: c,
                                type: l,
                                hasCloseAffordance: s,
                                closeLabel: u,
                                hasMarginTop: f,
                                hasMarginBottom: m,
                                hasDescription: y
                            }
                        }, [a, c, l, s, u, f, m, y]);
                    return (0, ef.useEffect)(function() {
                        b && setTimeout(function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }, 0)
                    }, [b, n]), ep().createElement(rn.Provider, {
                        value: g
                    }, ep().createElement(nE, {
                        open: n,
                        onOpenChange: r
                    }, o))
                };
            rl.displayName = "Dialog";
            var rc = function(t) {
                var n = t.children,
                    r = t.className,
                    o = t.style,
                    a = t.overlayClassName,
                    i = t.overlayStyle,
                    l = t.onOpenAutoFocus,
                    c = eg(t, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
                    s = rr(),
                    u = s.size,
                    d = s.isModal,
                    f = s.hasCloseAffordance,
                    p = s.closeLabel,
                    m = s.hasDescription,
                    v = ew("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", d && "bg-common-backdrop", a),
                    y = ew("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", r);
                return ep().createElement(nI, null, ep().createElement(nC, {
                    className: v,
                    style: i
                }, ep().createElement(nU, Object.assign({
                    className: y,
                    "data-size": u,
                    style: o,
                    onOpenAutoFocus: l
                }, !m && {
                    "aria-describedby": void 0
                }, c), f && ep().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, ep().createElement(nB, {
                    asChild: !0
                }, ep().createElement(rt, {
                    variant: "OverMedia",
                    size: u,
                    isCircular: !0,
                    "aria-label": p
                }))), n)))
            };
            rc.displayName = "DialogContent";
            var rs = function(t) {
                var n = t.children,
                    r = t.className,
                    o = eg(t, ["children", "className"]),
                    a = rr(),
                    i = a.size,
                    l = a.hasMarginTop,
                    c = a.hasMarginBottom,
                    s = ew(ro[i], l && ra[i], c && ri[i], r);
                return ep().createElement("div", Object.assign({
                    className: s
                }, o), n)
            };
            rs.displayName = "DialogBody";
            var ru = function(t) {
                var n = t.children,
                    r = t.className,
                    o = eg(t, ["children", "className"]),
                    a = rr().size,
                    i = ew(ro[a], ri[a], r);
                return ep().createElement("div", Object.assign({
                    className: i
                }, o), n)
            };

            function rd(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function rf(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function rp(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        rf(t, n, r[n])
                    })
                }
                return t
            }

            function rm(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var i = [],
                            l = !0,
                            c = !1;
                        try {
                            for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            c = !0, o = t
                        } finally {
                            try {
                                l || null == a.return || a.return()
                            } finally {
                                if (c) throw o
                            }
                        }
                        return i
                    }
                }(t, n) || ry(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rv(t) {
                return function(t) {
                    if (Array.isArray(t)) return rd(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || ry(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ry(t, n) {
                if (t) {
                    if ("string" == typeof t) return rd(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rd(t, n)
                }
            }

            function rh(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }

            function rb() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return function(t) {
                    var r = !1,
                        o = n.map(function(n) {
                            var o = rh(n, t);
                            return r || "function" != typeof o || (r = !0), o
                        });
                    if (r) return function() {
                        for (var t = 0; t < o.length; t++) {
                            var r = o[t];
                            "function" == typeof r ? r() : rh(n[t], null)
                        }
                    }
                }
            }

            function rg() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return ef.useCallback(rb.apply(void 0, rv(n)), n)
            }

            function rw() {
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
                            return rp({}, t, o(n)["__scope".concat(a)])
                        }, {});
                        return ef.useMemo(function() {
                            return rf({}, "__scope".concat(o.scopeName), r)
                        }, [r])
                    }
                };
                return a.scopeName = o.scopeName, a
            }

            function rE(t, n) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    o = r.checkForDefaultPrevented,
                    a = void 0 === o || o;
                return function(r) {
                    if (null == t || t(r), !1 === a || !r.defaultPrevented) return null == n ? void 0 : n(r)
                }
            }

            function rx(t) {
                var n = ef.useRef(t);
                return ef.useEffect(function() {
                    n.current = t
                }), ef.useMemo(function() {
                    return function() {
                        for (var t, r = arguments.length, o = Array(r), a = 0; a < r; a++) o[a] = arguments[a];
                        return null == (t = n.current) ? void 0 : t.call.apply(t, [n].concat(rv(o)))
                    }
                }, [])
            }
            ru.displayName = "DialogFooter";
            var rS = (null == (s = globalThis) ? void 0 : s.document) ? ef.useLayoutEffect : function() {},
                rP = function(t) {
                    var n, r, o, a, i, l, c, s, u, d, f, p, m, v, y = t.present,
                        h = t.children,
                        b = (a = (o = rm(ef.useState(), 2))[0], i = o[1], l = ef.useRef({}), c = ef.useRef(y), s = ef.useRef("none"), d = (u = rm((n = y ? "mounted" : "unmounted", r = {
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
                        }, ef.useReducer(function(t, n) {
                            var o;
                            return null != (o = r[t][n]) ? o : t
                        }, n)), 2))[0], f = u[1], ef.useEffect(function() {
                            var t = rO(l.current);
                            s.current = "mounted" === d ? t : "none"
                        }, [d]), rS(function() {
                            var t = l.current,
                                n = c.current;
                            if (n !== y) {
                                var r = s.current,
                                    o = rO(t);
                                y ? f("MOUNT") : "none" === o || "none" === (null == t ? void 0 : t.display) ? f("UNMOUNT") : f(n && r !== o ? "ANIMATION_OUT" : "UNMOUNT"), c.current = y
                            }
                        }, [y, f]), rS(function() {
                            if (a) {
                                var t, n, r = null != (n = a.ownerDocument.defaultView) ? n : window,
                                    o = function(n) {
                                        var o = rO(l.current).includes(n.animationName);
                                        if (n.target === a && o && (f("ANIMATION_END"), !c.current)) {
                                            var i = a.style.animationFillMode;
                                            a.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                                "forwards" === a.style.animationFillMode && (a.style.animationFillMode = i)
                                            })
                                        }
                                    },
                                    i = function(t) {
                                        t.target === a && (s.current = rO(l.current))
                                    };
                                return a.addEventListener("animationstart", i), a.addEventListener("animationcancel", o), a.addEventListener("animationend", o),
                                    function() {
                                        r.clearTimeout(t), a.removeEventListener("animationstart", i), a.removeEventListener("animationcancel", o), a.removeEventListener("animationend", o)
                                    }
                            }
                            f("ANIMATION_END")
                        }, [a, f]), {
                            isPresent: ["mounted", "unmountSuspended"].includes(d),
                            ref: ef.useCallback(function(t) {
                                t && (l.current = getComputedStyle(t)), i(t)
                            }, [])
                        }),
                        g = "function" == typeof h ? h({
                            present: b.isPresent
                        }) : ef.Children.only(h),
                        w = rg(b.ref, (v = null == (p = Object.getOwnPropertyDescriptor(g.props, "ref")) ? void 0 : p.get) && "isReactWarning" in v && v.isReactWarning ? g.ref : (v = null == (m = Object.getOwnPropertyDescriptor(g, "ref")) ? void 0 : m.get) && "isReactWarning" in v && v.isReactWarning ? g.props.ref : g.props.ref || g.ref);
                    return "function" == typeof h || b.isPresent ? ef.cloneElement(g, {
                        ref: w
                    }) : null
                };

            function rO(t) {
                return (null == t ? void 0 : t.animationName) || "none"
            }
            rP.displayName = "Presence";
            var rA = 0,
                rI = function() {
                    var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "\xabr",
                        n = (0, ef.useRef)();
                    return n.current || (rA += 1, n.current = "".concat(t).concat(rA)), n.current
                },
                rN = "opacity-[0.5]";

            function rC(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function rT(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function r_(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        rT(t, n, r[n])
                    })
                }
                return t
            }

            function rj(t, n) {
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

            function rU(t, n) {
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

            function rR(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var i = [],
                            l = !0,
                            c = !1;
                        try {
                            for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            c = !0, o = t
                        } finally {
                            try {
                                l || null == a.return || a.return()
                            } finally {
                                if (c) throw o
                            }
                        }
                        return i
                    }
                }(t, n) || rk(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rM(t) {
                return function(t) {
                    if (Array.isArray(t)) return rC(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || rk(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rk(t, n) {
                if (t) {
                    if ("string" == typeof t) return rC(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rC(t, n)
                }
            }
            n5(".data-\\[state\\=unchecked\\]\\:stroke-contrast-alpha[data-state=unchecked]{border-color:var(--color-stroke-contrast-alpha)}");
            var rD = ef.forwardRef(function(t, n) {
                var r = t.children,
                    o = rU(t, ["children"]),
                    a = ef.Children.toArray(r),
                    i = a.find(rB);
                if (i) {
                    var l = i.props.children,
                        c = a.map(function(t) {
                            return t === i ? ef.Children.count(l) > 1 ? ef.Children.only(null) : ef.isValidElement(l) ? l.props.children : null : t
                        });
                    return (0, eh.jsx)(rL, rj(r_({}, o), {
                        ref: n,
                        children: ef.isValidElement(l) ? ef.cloneElement(l, void 0, c) : null
                    }))
                }
                return (0, eh.jsx)(rL, rj(r_({}, o), {
                    ref: n,
                    children: r
                }))
            });
            rD.displayName = "Slot";
            var rL = ef.forwardRef(function(t, n) {
                var r = t.children,
                    o = rU(t, ["children"]);
                if (ef.isValidElement(r)) {
                    var a, i, l, c = (l = null == (a = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (i = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                        s = function(t, n) {
                            var r = r_({}, n);
                            for (var o in n) ! function(o) {
                                var a = t[o],
                                    i = n[o];
                                /^on[A-Z]/.test(o) ? a && i ? r[o] = function() {
                                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                    i.apply(void 0, rM(n)), a.apply(void 0, rM(n))
                                } : a && (r[o] = a) : "style" === o ? r[o] = r_({}, a, i) : "className" === o && (r[o] = [a, i].filter(Boolean).join(" "))
                            }(o);
                            return r_({}, t, r)
                        }(o, r.props);
                    return r.type !== ef.Fragment && (s.ref = n ? rb(n, c) : c), ef.cloneElement(r, s)
                }
                return ef.Children.count(r) > 1 ? ef.Children.only(null) : null
            });
            rL.displayName = "SlotClone";
            var rF = function(t) {
                var n = t.children;
                return (0, eh.jsx)(eh.Fragment, {
                    children: n
                })
            };

            function rB(t) {
                return ef.isValidElement(t) && t.type === rF
            }
            var rW = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                    var r = ef.forwardRef(function(t, r) {
                        var o = t.asChild,
                            a = rU(t, ["asChild"]),
                            i = o ? rD : n;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, eh.jsx)(i, rj(r_({}, a), {
                            ref: r
                        }))
                    });
                    return r.displayName = "Primitive.".concat(n), rj(r_({}, t), rT({}, n, r))
                }, {}),
                rG = "Checkbox",
                rV = rR(function(t) {
                    var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        o = function() {
                            var n = r.map(function(t) {
                                return ef.createContext(t)
                            });
                            return function(r) {
                                var o = (null == r ? void 0 : r[t]) || n;
                                return ef.useMemo(function() {
                                    var n, a;
                                    return rf({}, "__scope".concat(t), (n = rp({}, r), a = null != (a = rf({}, t, o)) ? a : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(a)) : (function(t, n) {
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
                        var a = ef.createContext(o),
                            i = r.length;
                        r = rv(r).concat([o]);
                        var l = function(n) {
                            var r, o = n.scope,
                                l = n.children,
                                c = function(t, n) {
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
                                s = (null == o || null == (r = o[t]) ? void 0 : r[i]) || a,
                                u = ef.useMemo(function() {
                                    return c
                                }, Object.values(c));
                            return (0, eh.jsx)(s.Provider, {
                                value: u,
                                children: l
                            })
                        };
                        return l.displayName = n + "Provider", [l, function(r, l) {
                            var c, s = (null == l || null == (c = l[t]) ? void 0 : c[i]) || a,
                                u = ef.useContext(s);
                            if (u) return u;
                            if (void 0 !== o) return o;
                            throw Error("`".concat(r, "` must be used within `").concat(n, "`"))
                        }]
                    }, rw.apply(void 0, [o].concat(rv(n)))]
                }(rG), 2),
                rz = rV[0],
                rX = (rV[1], rR(rz(rG), 2)),
                rH = rX[0],
                rY = rX[1],
                rK = ef.forwardRef(function(t, n) {
                    var r, o, a, i, l, c, s, u, d, f, p, m, v, y, h, b, g, w = t.__scopeCheckbox,
                        E = t.name,
                        x = t.checked,
                        S = t.defaultChecked,
                        P = t.required,
                        O = t.disabled,
                        A = t.value,
                        I = void 0 === A ? "on" : A,
                        N = t.onCheckedChange,
                        C = t.form,
                        T = rU(t, ["__scopeCheckbox", "name", "checked", "defaultChecked", "required", "disabled", "value", "onCheckedChange", "form"]),
                        _ = rR(ef.useState(null), 2),
                        j = _[0],
                        U = _[1],
                        R = rg(n, function(t) {
                            return U(t)
                        }),
                        M = ef.useRef(!1),
                        k = !j || C || !!j.closest("form"),
                        D = rR((o = (r = {
                            prop: x,
                            defaultProp: S,
                            onChange: N
                        }).prop, v = (m = rm((c = (l = {
                            defaultProp: r.defaultProp,
                            onChange: i = void 0 === (a = r.onChange) ? function() {} : a
                        }).defaultProp, s = l.onChange, d = rm(u = ef.useState(c), 1)[0], f = ef.useRef(d), p = rx(s), ef.useEffect(function() {
                            f.current !== d && (p(d), f.current = d)
                        }, [d, f, p]), u), 2))[0], y = m[1], b = (h = void 0 !== o) ? o : v, g = rx(i), [b, ef.useCallback(function(t) {
                            if (h) {
                                var n = "function" == typeof t ? t(o) : t;
                                n !== o && g(n)
                            } else y(t)
                        }, [h, o, y, g])]), 2),
                        L = D[0],
                        F = void 0 !== L && L,
                        B = D[1],
                        W = ef.useRef(F);
                    return ef.useEffect(function() {
                        var t = null == j ? void 0 : j.form;
                        if (t) {
                            var n = function() {
                                return B(W.current)
                            };
                            return t.addEventListener("reset", n),
                                function() {
                                    return t.removeEventListener("reset", n)
                                }
                        }
                    }, [j, B]), (0, eh.jsxs)(rH, {
                        scope: w,
                        state: F,
                        disabled: O,
                        children: [(0, eh.jsx)(rW.button, rj(r_({
                            type: "button",
                            role: "checkbox",
                            "aria-checked": rJ(F) ? "mixed" : F,
                            "aria-required": P,
                            "data-state": rQ(F),
                            "data-disabled": O ? "" : void 0,
                            disabled: O,
                            value: I
                        }, T), {
                            ref: R,
                            onKeyDown: rE(t.onKeyDown, function(t) {
                                "Enter" === t.key && t.preventDefault()
                            }),
                            onClick: rE(t.onClick, function(t) {
                                B(function(t) {
                                    return !!rJ(t) || !t
                                }), k && (M.current = t.isPropagationStopped(), M.current || t.stopPropagation())
                            })
                        })), k && (0, eh.jsx)(rZ, {
                            control: j,
                            bubbles: !M.current,
                            name: E,
                            value: I,
                            checked: F,
                            required: P,
                            disabled: O,
                            form: C,
                            style: {
                                transform: "translateX(-100%)"
                            },
                            defaultChecked: !rJ(S) && S
                        })]
                    })
                });
            rK.displayName = rG;
            var rq = "CheckboxIndicator",
                r$ = ef.forwardRef(function(t, n) {
                    var r = t.__scopeCheckbox,
                        o = t.forceMount,
                        a = rU(t, ["__scopeCheckbox", "forceMount"]),
                        i = rY(rq, r);
                    return (0, eh.jsx)(rP, {
                        present: o || rJ(i.state) || !0 === i.state,
                        children: (0, eh.jsx)(rW.span, rj(r_({
                            "data-state": rQ(i.state),
                            "data-disabled": i.disabled ? "" : void 0
                        }, a), {
                            ref: n,
                            style: r_({
                                pointerEvents: "none"
                            }, t.style)
                        }))
                    })
                });
            r$.displayName = rq;
            var rZ = function(t) {
                var n, r, o, a, i = t.control,
                    l = t.checked,
                    c = t.bubbles,
                    s = void 0 === c || c,
                    u = t.defaultChecked,
                    d = rU(t, ["control", "checked", "bubbles", "defaultChecked"]),
                    f = ef.useRef(null),
                    p = (n = ef.useRef({
                        value: l,
                        previous: l
                    }), ef.useMemo(function() {
                        return n.current.value !== l && (n.current.previous = n.current.value, n.current.value = l), n.current.previous
                    }, [l])),
                    m = (o = (r = rm(ef.useState(void 0), 2))[0], a = r[1], rS(function() {
                        if (i) {
                            a({
                                width: i.offsetWidth,
                                height: i.offsetHeight
                            });
                            var t = new ResizeObserver(function(t) {
                                if (Array.isArray(t) && t.length) {
                                    var n, r, o = t[0];
                                    if ("borderBoxSize" in o) {
                                        var l = o.borderBoxSize,
                                            c = Array.isArray(l) ? l[0] : l;
                                        n = c.inlineSize, r = c.blockSize
                                    } else n = i.offsetWidth, r = i.offsetHeight;
                                    a({
                                        width: n,
                                        height: r
                                    })
                                }
                            });
                            return t.observe(i, {
                                    box: "border-box"
                                }),
                                function() {
                                    return t.unobserve(i)
                                }
                        }
                        a(void 0)
                    }, [i]), o);
                ef.useEffect(function() {
                    var t = f.current,
                        n = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set;
                    if (p !== l && n) {
                        var r = new Event("click", {
                            bubbles: s
                        });
                        t.indeterminate = rJ(l), n.call(t, !rJ(l) && l), t.dispatchEvent(r)
                    }
                }, [p, l, s]);
                var v = ef.useRef(!rJ(l) && l);
                return (0, eh.jsx)("input", rj(r_({
                    type: "checkbox",
                    "aria-hidden": !0,
                    defaultChecked: null != u ? u : v.current
                }, d), {
                    tabIndex: -1,
                    ref: f,
                    style: rj(r_({}, t.style, m), {
                        position: "absolute",
                        pointerEvents: "none",
                        opacity: 0,
                        margin: 0
                    })
                }))
            };

            function rJ(t) {
                return "indeterminate" === t
            }

            function rQ(t) {
                return rJ(t) ? "indeterminate" : t ? "checked" : "unchecked"
            }
            var r0 = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-600"
                },
                r1 = {
                    XSmall: "",
                    Small: "",
                    Medium: "",
                    Large: "padding-y-xxsmall"
                },
                r2 = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                r3 = {
                    XSmall: "",
                    Small: "padding-top-xxsmall",
                    Medium: "padding-top-xxsmall",
                    Large: "padding-top-xxsmall"
                },
                r5 = function(t) {
                    var n = t.label,
                        r = t.className,
                        o = t.isChecked,
                        a = t.isDisabled,
                        i = t.size,
                        l = t.hint,
                        c = t.placement,
                        s = t.onCheckedChange,
                        u = t.id,
                        d = eg(t, ["label", "className", "isChecked", "isDisabled", "size", "hint", "placement", "onCheckedChange", "id"]),
                        f = rI(),
                        p = u || f,
                        m = n && ep().createElement("label", {
                            htmlFor: p,
                            className: ew("flex flex-col grow-1 gap-xsmall", !a && "cursor-pointer")
                        }, ep().createElement("span", {
                            className: ew(r2[i], r3[i], "content-emphasis")
                        }, n), l && ep().createElement("span", {
                            className: "text-body-medium content-default"
                        }, l));
                    return ep().createElement("div", {
                        className: ew("foundation-web-checkbox flex gap-medium", a && rN, !a && "cursor-pointer", r)
                    }, "End" === c && m, ep().createElement("div", {
                        className: ew(r1[i])
                    }, ep().createElement(rK, Object.assign({
                        "data-slot": "checkbox",
                        className: ew(r0[i], n8, !a && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
                        id: p,
                        checked: o,
                        disabled: a,
                        onCheckedChange: s,
                        "aria-label": n
                    }, d), ep().createElement(n7, null), ep().createElement(r$, {
                        "data-slot": "checkbox-indicator",
                        className: ew(r0[i], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
                    }))), "Start" === c && m)
                };

            function r4(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function r6(t) {
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

            function r8(t, n) {
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

            function r7(t, n) {
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

            function r9(t) {
                return function(t) {
                    if (Array.isArray(t)) return r4(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return r4(t, void 0);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return r4(t, n)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oe(t) {
                return t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t
            }

            function ot(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }
            var on = Symbol.for("react.lazy"),
                or = ef[" use ".trim().toString()];

            function oo(t) {
                var n;
                return null != t && "object" == (void 0 === t ? "undefined" : oe(t)) && "$$typeof" in t && t.$$typeof === on && "_payload" in t && "object" == oe(n = t._payload) && null !== n && "then" in n
            }
            var oa = ((t = ef.forwardRef(function(t, n) {
                    var r = t.children,
                        o = r7(t, ["children"]);
                    if (oo(r) && "function" == typeof or && (r = or(r._payload)), ef.isValidElement(r)) {
                        var a, i, l, c, s = (c = null == (i = Object.getOwnPropertyDescriptor((a = r).props, "ref")) ? void 0 : i.get) && "isReactWarning" in c && c.isReactWarning ? a.ref : (c = null == (l = Object.getOwnPropertyDescriptor(a, "ref")) ? void 0 : l.get) && "isReactWarning" in c && c.isReactWarning ? a.props.ref : a.props.ref || a.ref,
                            u = function(t, n) {
                                var r = r6({}, n);
                                for (var o in n) ! function(o) {
                                    var a = t[o],
                                        i = n[o];
                                    /^on[A-Z]/.test(o) ? a && i ? r[o] = function() {
                                        for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                        var o = i.apply(void 0, r9(n));
                                        return a.apply(void 0, r9(n)), o
                                    } : a && (r[o] = a) : "style" === o ? r[o] = r6({}, a, i) : "className" === o && (r[o] = [a, i].filter(Boolean).join(" "))
                                }(o);
                                return r6({}, t, r)
                            }(o, r.props);
                        return r.type !== ef.Fragment && (u.ref = n ? function() {
                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                            return function(t) {
                                var r = !1,
                                    o = n.map(function(n) {
                                        var o = ot(n, t);
                                        return r || "function" != typeof o || (r = !0), o
                                    });
                                if (r) return function() {
                                    for (var t = 0; t < o.length; t++) {
                                        var r = o[t];
                                        "function" == typeof r ? r() : ot(n[t], null)
                                    }
                                }
                            }
                        }(n, s) : s), ef.cloneElement(r, u)
                    }
                    return ef.Children.count(r) > 1 ? ef.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), i = t, (l = ef.forwardRef(function(t, n) {
                    var r = t.children,
                        o = r7(t, ["children"]);
                    oo(r) && "function" == typeof or && (r = or(r._payload));
                    var a = ef.Children.toArray(r),
                        l = a.find(ol);
                    if (l) {
                        var c = l.props.children,
                            s = a.map(function(t) {
                                return t === l ? ef.Children.count(c) > 1 ? ef.Children.only(null) : ef.isValidElement(c) ? c.props.children : null : t
                            });
                        return (0, eh.jsx)(i, r8(r6({}, o), {
                            ref: n,
                            children: ef.isValidElement(c) ? ef.cloneElement(c, void 0, s) : null
                        }))
                    }
                    return (0, eh.jsx)(i, r8(r6({}, o), {
                        ref: n,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), l),
                oi = Symbol("radix.slottable");

            function ol(t) {
                return ef.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === oi
            }
            n5("@keyframes rotation{0%{transform:rotate(0deg)}to{transform:rotate(359deg)}}.foundation-web-loading-spinner{animation:rotation 1s linear infinite normal}");
            var oc = function(t) {
                    var n = t.width,
                        r = t.height;
                    return ep().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: n,
                        height: r,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, ep().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                },
                os = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                ou = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                od = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                of = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                op = (0, ef.forwardRef)(function(t, n) {
                    var r = t.children,
                        o = t.className,
                        a = t.style,
                        i = t.isDisabled,
                        l = void 0 !== i && i,
                        c = t.isLoading,
                        s = void 0 !== c && c,
                        u = t.icon,
                        d = t.size,
                        f = void 0 === d ? "Large" : d,
                        p = t.variant,
                        m = void 0 === p ? "Emphasis" : p,
                        v = t.asChild,
                        y = eg(t, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        h = ew("foundation-web-button", l ? rN : [n8, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", ou[f], l ? of [m] : od[m], o),
                        b = Object.assign({
                            textDecoration: "none"
                        }, a),
                        g = function(t) {
                            return ep().createElement(ep().Fragment, null, ep().createElement(n7, null), s && ep().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, ep().createElement(oc, {
                                width: os[f],
                                height: os[f]
                            })), ep().createElement("span", {
                                className: ew("flex items-center min-width-0", "Large" === f || "Medium" === f ? "gap-small" : "gap-xsmall", s && "invisible")
                            }, u && ep().createElement(n6, {
                                name: u,
                                size: f
                            }), ep().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, t)))
                        };
                    if (v) {
                        var w = eg(y, ["as"]),
                            E = ep().Children.only(r);
                        return ep().createElement(oa, Object.assign({
                            ref: n
                        }, w, {
                            className: h,
                            style: b,
                            "aria-disabled": l || void 0
                        }), ep().cloneElement(E, {}, g(E.props.children)))
                    }
                    if ("a" === y.as) {
                        y.as;
                        var x = y.href,
                            S = eg(y, ["as", "href"]);
                        return ep().createElement("a", Object.assign({
                            ref: n
                        }, S, {
                            "aria-disabled": l,
                            href: l ? void 0 : x,
                            className: h,
                            style: b
                        }), g(r))
                    }
                    var P = eg(y, ["as"]);
                    return ep().createElement("button", Object.assign({
                        ref: n,
                        type: "button"
                    }, P, {
                        disabled: l,
                        className: h,
                        style: b
                    }), g(r))
                }),
                om = "Label.Free",
                ov = "Label.TimedOptionDaysTimerStartsWhenYouBuy",
                oy = {
                    common: ["IAPExperience.PurchaseError", "Feature.NotApproved", "Feature.RobloxSubscription"],
                    feature: "Purchasing.PurchaseDialog"
                },
                oh = (0, ey.withTranslations)(function(t) {
                    var n = t.translate,
                        r = t.price,
                        o = t.color,
                        a = void 0 === o ? "" : o,
                        i = t.useFreeText;
                    return 0 === r && (void 0 === i || i) ? (0, eh.jsx)("span", {
                        className: "text-robux text-free",
                        children: n(om)
                    }) : (0, eh.jsxs)(ep().Fragment, {
                        children: [(0, eh.jsx)("span", {
                            className: "icon-robux".concat(a ? "-".concat(a) : "", "-16x16")
                        }), (0, eh.jsx)("span", {
                            className: "text-robux ml-1 text-body-medium",
                            children: (0, Q.formatNumber)(r)
                        })]
                    })
                }, oy),
                ob = function(t) {
                    var n = t.translate,
                        r = t.titleText,
                        o = t.currentRobuxBalance;
                    return (0, eh.jsxs)("div", {
                        id: "rbx-unified-purchase-heading",
                        className: "flex flex-row items-center justify-between",
                        style: {
                            paddingRight: 42
                        },
                        children: [(0, eh.jsx)("span", {
                            className: "text-heading-medium",
                            children: r
                        }), "number" == typeof o && (0, eh.jsx)("div", {
                            className: "flex flex-row items-center",
                            children: (0, eh.jsx)(oh, {
                                translate: n,
                                price: o,
                                color: "",
                                useFreeText: !1
                            })
                        })]
                    })
                },
                og = window.PropTypes,
                ow = r.n(og);

            function oE(t) {
                var n = t.name;
                return (0, eh.jsx)("span", {
                    className: "font-bold",
                    children: n
                })
            }

            function ox(t) {
                var n = t.translate,
                    r = t.price,
                    o = t.color,
                    a = t.useFreeText;
                return 0 === r && a ? (0, eh.jsx)("span", {
                    className: "text-robux text-free",
                    children: n(om)
                }) : (0, eh.jsxs)(ep().Fragment, {
                    children: [(0, eh.jsx)("span", {
                        className: "icon-robux".concat(o ? "-".concat(o) : "", "-16x16")
                    }), (0, eh.jsx)("span", {
                        className: "text-robux",
                        children: (0, Q.formatNumber)(r)
                    })]
                })
            }
            oE.propTypes = {
                name: ow().string.isRequired
            }, ox.defaultProps = {
                color: "",
                useFreeText: !0
            }, ox.propTypes = {
                price: ow().number.isRequired,
                translate: ow().func.isRequired,
                color: ow().string,
                useFreeText: ow().bool
            };
            var oS = (0, ey.withTranslations)(ox, oy),
                oP = function(t) {
                    var n = t.translate,
                        r = t.thumbnail,
                        o = t.assetName,
                        a = t.expectedPrice,
                        i = t.displayPrice,
                        l = t.priceSuffix,
                        c = (t.thumbnailSizePx, t.rentalOptionDays),
                        s = void 0 === c ? null : c,
                        u = t.discountInformation,
                        d = (null == u ? void 0 : u.originalPrice) != null && u.originalPrice > a;
                    return (0, eh.jsxs)("div", {
                        className: "flex flex-row items-center gap-large",
                        children: [(0, eh.jsxs)("div", {
                            className: "relative shrink-0 unified-modal-thumbnail-container",
                            style: {
                                maxWidth: "40vw",
                                maxHeight: "40vw"
                            },
                            children: [(0, eh.jsx)("div", {
                                className: "rounded",
                                style: {
                                    width: "100%",
                                    height: "100%",
                                    backgroundColor: "rgba(255,255,255,0.06)"
                                }
                            }), (0, eh.jsx)("div", {
                                className: "absolute unified-modal-thumbnail",
                                style: {
                                    inset: 0,
                                    display: "flex",
                                    alignItems: "center",
                                    justifyContent: "center"
                                },
                                children: r
                            })]
                        }), (0, eh.jsxs)("div", {
                            className: "min-w-0 flex flex-col gap-small",
                            children: [(0, eh.jsx)("span", {
                                className: "text-body-large break-words",
                                children: (0, eh.jsx)(oE, {
                                    name: o
                                })
                            }), null != s && s > 0 && (0, eh.jsxs)("div", {
                                className: "flex flex-row items-center gap-small",
                                children: [(0, eh.jsx)(n6, {
                                    name: "icon-regular-clock"
                                }), (0, eh.jsx)("span", {
                                    children: n(ov, {
                                        days: s
                                    }) || "".concat(s, " days (Timer starts when you buy)")
                                })]
                            }), d ? (0, eh.jsxs)("div", {
                                className: "flex flex-row items-center flex-wrap gap-x-small",
                                children: [(0, eh.jsxs)("span", {
                                    className: "flex flex-row items-center",
                                    children: [(0, eh.jsx)(oS, {
                                        translate: n,
                                        price: a,
                                        color: "",
                                        useFreeText: !1
                                    }), l && (0, eh.jsx)("span", {
                                        className: "text-robux",
                                        children: l
                                    })]
                                }), (0, eh.jsxs)("span", {
                                    className: "flex flex-row items-center",
                                    style: {
                                        textDecoration: "line-through",
                                        opacity: .6
                                    },
                                    children: [(0, eh.jsx)(oS, {
                                        translate: n,
                                        price: u.originalPrice,
                                        color: "",
                                        useFreeText: !1
                                    }), l && (0, eh.jsx)("span", {
                                        className: "text-robux",
                                        children: l
                                    })]
                                })]
                            }) : i ? (0, eh.jsx)("div", {
                                className: "flex flex-row items-center",
                                children: (0, eh.jsxs)("span", {
                                    className: "text-robux",
                                    children: [i, l]
                                })
                            }) : (0, eh.jsxs)("div", {
                                className: "flex flex-row items-center",
                                children: [(0, eh.jsx)(oS, {
                                    translate: n,
                                    price: a,
                                    color: "",
                                    useFreeText: !1
                                }), l && (0, eh.jsx)("span", {
                                    className: "text-robux",
                                    children: l
                                })]
                            })]
                        })]
                    })
                };

            function oO(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }
            n5(".foundation-web-accordion-content{grid-template-rows:0fr}.foundation-web-accordion-content[data-state=open]{grid-template-rows:1fr}.foundation-web-accordion-content[data-state=open][data-size=xsmall] .foundation-web-accordion-content-inner{padding-bottom:var(--padding-small);padding-top:var(--padding-xsmall)}.foundation-web-accordion-content[data-state=open][data-size=small] .foundation-web-accordion-content-inner{padding-bottom:var(--padding-large);padding-top:var(--padding-xsmall)}.foundation-web-accordion-content[data-state=open][data-size=large] .foundation-web-accordion-content-inner,.foundation-web-accordion-content[data-state=open][data-size=medium] .foundation-web-accordion-content-inner{padding-bottom:var(--padding-xlarge);padding-top:var(--padding-xsmall)}");
            var oA = (0, ef.createContext)(null),
                oI = (0, ef.createContext)(null),
                oN = {
                    XSmall: "min-height-600",
                    Small: "min-height-800",
                    Medium: "min-height-1000",
                    Large: "min-height-1200"
                },
                oC = {
                    XSmall: "padding-y-xsmall",
                    Small: "padding-y-xsmall",
                    Medium: "padding-y-small",
                    Large: "padding-y-small"
                },
                oT = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium",
                    Large: "text-title-large"
                },
                o_ = {
                    XSmall: "size-300",
                    Small: "size-400",
                    Medium: "size-500",
                    Large: "size-600"
                },
                oj = (0, ef.forwardRef)(function(t, n) {
                    var r = t.children,
                        o = t.className,
                        a = t.size,
                        i = void 0 === a ? "Medium" : a,
                        l = t.hasDivider,
                        c = void 0 !== l && l,
                        s = t.isContained,
                        u = void 0 !== s && s,
                        d = t.isDisabled,
                        f = void 0 !== d && d,
                        p = (0, ef.useMemo)(function() {
                            return {
                                size: i,
                                hasDivider: c,
                                isContained: u,
                                isDisabled: f
                            }
                        }, [i, c, u, f]);
                    return ep().createElement(oA.Provider, {
                        value: p
                    }, ep().createElement("div", {
                        ref: n,
                        className: ew("foundation-web-accordion", "flex flex-col items-start width-full", c && "[&>*:not(:last-child)]:[border-bottom:1px_solid_var(--color-stroke-default)]", o)
                    }, r))
                }),
                oU = (0, ef.forwardRef)(function(t, n) {
                    var r, o = t.children,
                        a = t.className,
                        i = t.isDisabled,
                        l = void 0 !== i && i,
                        c = t.defaultOpen,
                        s = t.isOpen,
                        u = t.onOpenChange,
                        d = (0, ef.useContext)(oA),
                        f = (r = (0, ef.useState)(void 0 !== c && c), function(t) {
                            if (Array.isArray(t)) return t
                        }(r) || function(t, n) {
                            var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                            if (null != a) {
                                var i = [],
                                    l = !0,
                                    c = !1;
                                try {
                                    for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), i.length !== n); l = !0);
                                } catch (t) {
                                    c = !0, o = t
                                } finally {
                                    try {
                                        l || null == a.return || a.return()
                                    } finally {
                                        if (c) throw o
                                    }
                                }
                                return i
                            }
                        }(r, 2) || function(t, n) {
                            if (t) {
                                if ("string" == typeof t) return oO(t, 2);
                                var r = Object.prototype.toString.call(t).slice(8, -1);
                                if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oO(t, n)
                            }
                        }(r, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        p = f[0],
                        m = f[1],
                        v = null != s ? s : p,
                        y = rI("fui-a-");
                    if (!d) throw Error("AccordionItem must be used within Accordion");
                    var h = d.isContained,
                        b = d.isDisabled,
                        g = (0, ef.useCallback)(function(t) {
                            l || b || (void 0 === s && m(t), null == u || u(t))
                        }, [l, b, s, u]),
                        w = (0, ef.useMemo)(function() {
                            return {
                                isOpen: v,
                                setOpen: g,
                                isDisabled: l,
                                triggerId: "".concat(y, "-trigger"),
                                contentId: "".concat(y, "-content")
                            }
                        }, [v, g, l, y]);
                    return ep().createElement(oI.Provider, {
                        value: w
                    }, ep().createElement("div", {
                        ref: n,
                        "data-contained": h,
                        "data-state": v ? "open" : "closed",
                        className: ew("foundation-web-accordion-item", "width-full", a)
                    }, o))
                }),
                oR = function(t) {
                    var n = t.children,
                        r = t.className,
                        o = (0, ef.useContext)(oA),
                        a = (0, ef.useContext)(oI);
                    if (!o) throw Error("AccordionItemTrigger must be used within Accordion");
                    if (!a) throw Error("AccordionItemTrigger must be used within AccordionItem");
                    var i = o.size,
                        l = o.isContained,
                        c = o.isDisabled,
                        s = a.isOpen,
                        u = a.setOpen,
                        d = a.isDisabled,
                        f = c || d;
                    return ep().createElement("button", {
                        id: a.triggerId,
                        type: "button",
                        className: ew(n8, "relative flex items-center justify-between gap-small cursor-pointer content-default bg-none stroke-none width-full", oN[i], oC[i], l ? "padding-x-medium" : "padding-x-none", f && [rN, "pointer-events-none"], r),
                        "aria-expanded": s,
                        "aria-controls": a.contentId,
                        onClick: function(t) {
                            t.preventDefault(), f || u(!s)
                        }
                    }, ep().createElement(n7, null), ep().createElement("div", {
                        className: "flex items-center min-width-0 grow-1"
                    }, ep().createElement("span", {
                        className: ew("text-align-x-left", oT[i])
                    }, n)), ep().createElement("span", {
                        className: ew("foundation-web-accordion-chevron shrink-0", o_[i], "icon icon-regular-chevron-large-down", "motion-safe:transition-transform duration-200"),
                        style: {
                            transform: s ? "rotate(180deg)" : "rotate(0deg)"
                        }
                    }))
                },
                oM = function(t) {
                    var n = t.children,
                        r = t.className,
                        o = (0, ef.useContext)(oA),
                        a = (0, ef.useContext)(oI);
                    if (!o) throw Error("AccordionItemContent must be used within Accordion");
                    if (!a) throw Error("AccordionItemContent must be used within AccordionItem");
                    var i = o.size,
                        l = a.isOpen ? {} : {
                            inert: "inert"
                        };
                    return ep().createElement("div", Object.assign({
                        id: a.contentId,
                        role: "region",
                        "aria-labelledby": a.triggerId,
                        "aria-hidden": !a.isOpen,
                        "data-state": a.isOpen ? "open" : "closed",
                        "data-size": i.toLowerCase()
                    }, l, {
                        className: ew("foundation-web-accordion-content grid clip width-full motion-safe:transition-all duration-200 ease-standard-out")
                    }), ep().createElement("div", {
                        className: ew("foundation-web-accordion-content-inner width-full min-height-0 clip padding-top-none padding-bottom-none motion-safe:transition-transform duration-200", !a.isOpen && "pointer-events-none", r)
                    }, n))
                };

            function ok(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function oD(t) {
                return function(t) {
                    if (Array.isArray(t)) return ok(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return ok(t, void 0);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ok(t, n)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var oL = "__FN_nvfToKPAOuiV__",
                oF = new RegExp("".concat(oL, "(\\d+)\\|")),
                oB = function(t, n, r, o) {
                    var a = function(t) {
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
                        }({}, o),
                        i = {};
                    null == r || r.forEach(function(t, n) {
                        var r = n.toString(),
                            o = "".concat(oL).concat(r, "|"),
                            l = "".concat("__FN_END_nvfToKPAOuiV__").concat(r, "|");
                        a[t.opening] = o, a[t.closing] = l, i[r] = {
                            start: o,
                            end: l,
                            render: t.render,
                            used: !1
                        }
                    });
                    var l = t(n, a),
                        c = function(t) {
                            var r = [],
                                o = oF.exec(t);
                            if (!o) return [t];
                            o.index > 0 && r.push(t.slice(0, o.index));
                            var a = o[1] && i[o[1]];
                            if (!a) return console.warn("Unexpected malformed segment", n), [];
                            a.used = !0;
                            var l = t.indexOf(a.end);
                            if (-1 === l) return console.warn("Unexpected malformed segment", n), [];
                            var s = t.slice(o.index + o[0].length, l),
                                u = a.render(c(s));
                            Array.isArray(u) ? r.push.apply(r, oD(u)) : r.push(u);
                            var d = t.slice(l + a.end.length);
                            return d.length > 0 && r.push.apply(r, oD(c(d))), r
                        },
                        s = c(l).filter(function(t) {
                            return "" !== t
                        });
                    return Object.values(i).some(function(t) {
                        return !t.used
                    }) ? (console.warn("Unused segments found", n), []) : s.map(function(t, n) {
                        return (0, eh.jsx)(ef.Fragment, {
                            children: t
                        }, n)
                    })
                };

            function oW(t) {
                return !!(null == t ? void 0 : t.some(function(t) {
                    return "ROBLOX_PLUS" === t.discountType || "BlackbirdSubscription" === t.discountCampaign || "RobloxPlusSubscription" === t.discountCampaign || "RobloxSubscription" === t.discountCampaign
                }))
            }
            var oG = String.fromCodePoint(57346),
                oV = RegExp("".concat(oG, "|\\\\u\\{E002\\}|\\\\uE002"), "gi"),
                oz = function(t) {
                    var n = t.text,
                        r = t.className,
                        o = t.id;
                    return (0, eh.jsx)("span", {
                        id: o,
                        className: ew("inline", r),
                        children: function(t) {
                            if (oV.lastIndex = 0, !oV.test(t)) return [t];
                            for (var n = [], r = 0, o = RegExp(oV.source, "gi"), a = o.exec(t); a;) {
                                var i = a.index;
                                i > r && n.push(t.slice(r, i)), n.push((0, eh.jsx)("span", {
                                    className: "icon-robux-16x16 inline-block align-text-bottom",
                                    "aria-hidden": !0
                                }, "robux-icon-".concat(i))), r = i + a[0].length, a = o.exec(t)
                            }
                            return r < t.length && n.push(t.slice(r)), n
                        }(n)
                    })
                };

            function oX(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }
            var oH = function(t) {
                    var n = t.amount,
                        r = Math.abs(n);
                    return (0, eh.jsxs)(ep().Fragment, {
                        children: [n < 0 && (0, eh.jsx)("span", {
                            className: "text-robux",
                            children: "-"
                        }), (0, eh.jsx)("span", {
                            className: "icon-robux-16x16"
                        }), (0, eh.jsx)("span", {
                            className: "text-robux",
                            children: (0, Q.formatNumber)(r)
                        })]
                    })
                },
                oY = function(t) {
                    var n, r = t.translate,
                        o = t.normalizedDiscount,
                        a = t.savingsSummary,
                        i = o.savedAmount,
                        l = o.originalPrice,
                        c = o.totalPrice,
                        s = o.discountLines,
                        u = (n = (0, ef.useState)(!1), function(t) {
                            if (Array.isArray(t)) return t
                        }(n) || function(t, n) {
                            var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                            if (null != a) {
                                var i = [],
                                    l = !0,
                                    c = !1;
                                try {
                                    for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), i.length !== n); l = !0);
                                } catch (t) {
                                    c = !0, o = t
                                } finally {
                                    try {
                                        l || null == a.return || a.return()
                                    } finally {
                                        if (c) throw o
                                    }
                                }
                                return i
                            }
                        }(n, 2) || function(t, n) {
                            if (t) {
                                if ("string" == typeof t) return oX(t, 2);
                                var r = Object.prototype.toString.call(t).slice(8, -1);
                                if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oX(t, n)
                            }
                        }(n, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        d = u[0],
                        f = u[1],
                        p = oW(s),
                        m = null == a ? void 0 : a.trim(),
                        v = [{
                            opening: "amountStart",
                            closing: "amountEnd",
                            render: function() {
                                return (0, eh.jsx)(oH, {
                                    amount: i
                                })
                            }
                        }],
                        y = function(t) {
                            var n;
                            return oW([t]) ? t.localizedAttribution ? (0, eh.jsx)(oz, {
                                text: t.localizedAttribution
                            }) : r("Label.PlusBenefitDiscount", {
                                discountPercent: String(null != (n = t.discountPercent) ? n : 0)
                            }) : (0, eh.jsx)(oz, {
                                text: t.label
                            })
                        };
                    return (0, eh.jsx)(oj, {
                        className: "text-body-medium padding-none stroke-default stroke-thick radius-medium",
                        children: (0, eh.jsxs)(oU, {
                            isOpen: d,
                            onOpenChange: f,
                            children: [(0, eh.jsx)(oR, {
                                className: ew("!padding-medium bg-shift-100 width-full flex flex-row items-center justify-between", d && "[border-bottom-left-radius:0] [border-bottom-right-radius:0]"),
                                children: (0, eh.jsxs)("div", {
                                    className: "flex flex-row items-center gap-x-small content-emphasis",
                                    children: [p && !m && (0, eh.jsx)(n6, {
                                        name: "icon-regular-roblox-plus",
                                        size: "Medium"
                                    }), (0, eh.jsx)("span", {
                                        children: m ? (0, eh.jsx)(oz, {
                                            text: m
                                        }) : p ? oB(r, "Description.SavingWithPlus", v, {
                                            robuxAmount: (0, Q.formatNumber)(i)
                                        }) : r("Description.SavingRobux", {
                                            robuxAmount: (0, Q.formatNumber)(i)
                                        })
                                    })]
                                })
                            }), (0, eh.jsxs)(oM, {
                                className: "!padding-none",
                                children: [(0, eh.jsxs)("div", {
                                    className: "padding-medium padding-bottom-small flex flex-col gap-y-small bg-shift-100 stroke-default stroke-thick",
                                    style: {
                                        borderTop: "0px",
                                        borderLeft: "0px",
                                        borderRight: "0px"
                                    },
                                    children: [(0, eh.jsxs)("div", {
                                        className: "flex flex-row items-center justify-between content-default",
                                        children: [(0, eh.jsx)("span", {
                                            children: r("Label.Subtotal")
                                        }), (0, eh.jsx)("span", {
                                            className: "flex flex-row items-center",
                                            children: (0, eh.jsx)(oH, {
                                                amount: l
                                            })
                                        })]
                                    }), s.map(function(t, n) {
                                        var r;
                                        return (0, eh.jsxs)("div", {
                                            className: "flex flex-row items-center justify-between content-default",
                                            children: [(0, eh.jsx)("span", {
                                                children: y(t)
                                            }), (0, eh.jsx)("span", {
                                                className: "flex flex-row items-center",
                                                children: (0, eh.jsx)(oH, {
                                                    amount: -t.discountAmount
                                                })
                                            })]
                                        }, "".concat(null != (r = t.discountCampaign) ? r : "discount", "-").concat(n))
                                    })]
                                }), (0, eh.jsxs)("div", {
                                    className: "padding-medium flex flex-row items-center justify-between text-heading-small content-default bg-shift-100",
                                    children: [(0, eh.jsx)("span", {
                                        children: r("Label.Total")
                                    }), (0, eh.jsx)("span", {
                                        className: "flex flex-row items-center",
                                        children: (0, eh.jsx)(oH, {
                                            amount: c
                                        })
                                    })]
                                })]
                            })]
                        })
                    })
                },
                oK = function(t) {
                    var n = t.robuxAmount,
                        r = t.price;
                    return (0, eh.jsx)("div", {
                        className: "rounded-xxlarge radius-medium border padding-medium",
                        style: {
                            borderColor: "var(--content-action-standard)"
                        },
                        children: (0, eh.jsxs)("div", {
                            className: "flex flex-row items-center justify-between gap-medium",
                            children: [(0, eh.jsxs)("div", {
                                className: "flex flex-row items-center",
                                children: [(0, eh.jsx)("span", {
                                    className: "icon-robux-16x16"
                                }), (0, eh.jsx)("span", {
                                    className: "text-heading-small margin-left-xsmall",
                                    children: (0, Q.formatNumber)(n)
                                })]
                            }), (0, eh.jsx)("div", {
                                className: "text-label-large",
                                children: r
                            })]
                        })
                    })
                };

            function oq(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }
            var o$ = function(t, n) {
                (0, ef.useEffect)(function() {
                    n && (0, ei.fireEvent)("".concat("RenderTracking", "-").concat("Purchase", "-").concat(t))
                }, [n])
            };

            function oZ(t, n, r, o, a, i, l) {
                try {
                    var c = t[i](l),
                        s = c.value
                } catch (t) {
                    r(t);
                    return
                }
                c.done ? n(s) : Promise.resolve(s).then(o, a)
            }

            function oJ(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function oQ(t, n, r, o, a, i, l) {
                try {
                    var c = t[i](l),
                        s = c.value
                } catch (t) {
                    r(t);
                    return
                }
                c.done ? n(s) : Promise.resolve(s).then(o, a)
            }

            function o0(t) {
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

            function o1(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var i = [],
                            l = !0,
                            c = !1;
                        try {
                            for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            c = !0, o = t
                        } finally {
                            try {
                                l || null == a.return || a.return()
                            } finally {
                                if (c) throw o
                            }
                        }
                        return i
                    }
                }(t, n) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return oJ(t, n);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oJ(t, n)
                    }
                }(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var o2 = function(t) {
                    var n, r, o, a, i, l, c, s, u, d, p, m, v, y, h, b, g, w, x, S, P, O, A, I, N, C, T, _, j, U, R, M, k, D, L, F, B, W = t.translate,
                        G = t.expectedPrice,
                        V = t.thumbnail,
                        z = t.assetName,
                        X = t.onAction,
                        H = t.onCancel,
                        q = t.loading,
                        $ = t.currentRobuxBalance,
                        J = t.open,
                        Q = void 0 !== J && J,
                        ee = t.robuxPackageAmount,
                        et = t.robuxPackagePrice,
                        en = t.intl,
                        er = t.priceSuffix,
                        eo = t.title,
                        ea = t.discountInformation,
                        ei = t.collectibleItemId,
                        el = t.rentalOptionDays,
                        ec = t.isLimited,
                        es = t.packageLoading,
                        eu = void 0 !== es && es,
                        ed = t.onRefetchPackage,
                        em = t.onAcceptOffers,
                        ev = t.onDirectPurchase,
                        ey = (0, ef.useCallback)(function(t) {
                            null == ed || ed(null != t ? t : G)
                        }, [ed, G]),
                        eb = (o = void 0 === (r = (n = {
                            collectibleItemId: void 0 === ei ? null : ei,
                            rentalOptionDays: void 0 === el ? null : el,
                            expectedPrice: G,
                            isLimitedItem: void 0 !== ec && ec,
                            open: Q,
                            onPriceResolved: ey
                        }).collectibleItemId) ? null : r, i = void 0 === (a = n.rentalOptionDays) ? null : a, l = n.expectedPrice, c = n.isLimitedItem, u = void 0 !== (s = n.open) && s, d = n.onPriceResolved, p = null != l && l <= 0 || void 0 !== c && c, v = (m = o1((0, ef.useState)([]), 2))[0], y = m[1], h = (0, ef.useRef)([]), (0, ef.useEffect)(function() {
                            h.current = v
                        }, [v]), g = (b = o1((0, ef.useState)(), 2))[0], w = b[1], S = (x = o1((0, ef.useState)(void 0), 2))[0], P = x[1], A = (O = o1((0, ef.useState)(), 2))[0], I = O[1], C = (N = o1((0, ef.useState)(!1), 2))[0], T = N[1], _ = (0, ef.useRef)(0), j = (0, ef.useRef)(d), (0, ef.useEffect)(function() {
                            j.current = d
                        }, [d]), U = (0, ef.useCallback)(function(t) {
                            var n;
                            return (n = function() {
                                var n, r, a, l, c, s, u, d, f, m;
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
                                    return l.next = c(0), l.throw = c(1), l.return = c(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                                        return this
                                    }), l;

                                    function c(c) {
                                        return function(s) {
                                            var u = [c, s];
                                            if (r) throw TypeError("Generator is already executing.");
                                            for (; l && (l = 0, u[0] && (i = 0)), i;) try {
                                                if (r = 1, o && (a = 2 & u[0] ? o.return : u[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, u[1])).done) return a;
                                                switch (o = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                                    case 0:
                                                    case 1:
                                                        a = u;
                                                        break;
                                                    case 4:
                                                        return i.label++, {
                                                            value: u[1],
                                                            done: !1
                                                        };
                                                    case 5:
                                                        i.label++, o = u[1], u = [0];
                                                        continue;
                                                    case 7:
                                                        u = i.ops.pop(), i.trys.pop();
                                                        continue;
                                                    default:
                                                        if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                            i = 0;
                                                            continue
                                                        }
                                                        if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                                            i.label = u[1];
                                                            break
                                                        }
                                                        if (6 === u[0] && i.label < a[1]) {
                                                            i.label = a[1], a = u;
                                                            break
                                                        }
                                                        if (a && i.label < a[2]) {
                                                            i.label = a[2], i.ops.push(u);
                                                            break
                                                        }
                                                        a[2] && i.ops.pop(), i.trys.pop();
                                                        continue
                                                }
                                                u = n.call(t, i)
                                            } catch (t) {
                                                u = [6, t], o = 0
                                            } finally {
                                                r = a = 0
                                            }
                                            if (5 & u[0]) throw u[1];
                                            return {
                                                value: u[0] ? u[1] : void 0,
                                                done: !0
                                            }
                                        }
                                    }
                                }(this, function(v) {
                                    var h, b, g, E;
                                    switch (v.label) {
                                        case 0:
                                            if (!o || p) return [2];
                                            n = _.current + 1, _.current = n, T(!0), v.label = 1;
                                        case 1:
                                            return v.trys.push([1, , 3, 4]), [4, (h = o0({
                                                featureKey: "MARKETPLACE_CART",
                                                items: [null != i && i > 0 ? {
                                                    collectibleItemId: o,
                                                    rentalDays: i
                                                } : {
                                                    collectibleItemId: o,
                                                    isPermanent: !0
                                                }]
                                            }, (null == t ? void 0 : t.length) ? {
                                                unselectedOffers: t
                                            } : {}), (b = function() {
                                                var t, n, r;
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
                                                    return l.next = c(0), l.throw = c(1), l.return = c(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                                                        return this
                                                    }), l;

                                                    function c(c) {
                                                        return function(s) {
                                                            var u = [c, s];
                                                            if (r) throw TypeError("Generator is already executing.");
                                                            for (; l && (l = 0, u[0] && (i = 0)), i;) try {
                                                                if (r = 1, o && (a = 2 & u[0] ? o.return : u[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, u[1])).done) return a;
                                                                switch (o = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                                                    case 0:
                                                                    case 1:
                                                                        a = u;
                                                                        break;
                                                                    case 4:
                                                                        return i.label++, {
                                                                            value: u[1],
                                                                            done: !1
                                                                        };
                                                                    case 5:
                                                                        i.label++, o = u[1], u = [0];
                                                                        continue;
                                                                    case 7:
                                                                        u = i.ops.pop(), i.trys.pop();
                                                                        continue;
                                                                    default:
                                                                        if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                                            i = 0;
                                                                            continue
                                                                        }
                                                                        if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                                                            i.label = u[1];
                                                                            break
                                                                        }
                                                                        if (6 === u[0] && i.label < a[1]) {
                                                                            i.label = a[1], a = u;
                                                                            break
                                                                        }
                                                                        if (a && i.label < a[2]) {
                                                                            i.label = a[2], i.ops.push(u);
                                                                            break
                                                                        }
                                                                        a[2] && i.ops.pop(), i.trys.pop();
                                                                        continue
                                                                }
                                                                u = n.call(t, i)
                                                            } catch (t) {
                                                                u = [6, t], o = 0
                                                            } finally {
                                                                r = a = 0
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
                                                            t = {
                                                                url: "".concat(K.EnvironmentUrls.apiGatewayUrl, "/marketplace-sales/v1/cart-pricing"),
                                                                withCredentials: !0
                                                            }, o.label = 1;
                                                        case 1:
                                                            return o.trys.push([1, 3, , 4]), [4, Y.post(t, h)];
                                                        case 2:
                                                            if (200 !== (n = o.sent()).status) return [2, null];
                                                            return [2, null != (r = n.data) ? r : null];
                                                        case 3:
                                                            return o.sent(), [2, null];
                                                        case 4:
                                                            return [2]
                                                    }
                                                })
                                            }, function() {
                                                var t = this,
                                                    n = arguments;
                                                return new Promise(function(r, o) {
                                                    var a = b.apply(t, n);

                                                    function i(t) {
                                                        oZ(a, r, o, i, l, "next", t)
                                                    }

                                                    function l(t) {
                                                        oZ(a, r, o, i, l, "throw", t)
                                                    }
                                                    i(void 0)
                                                })
                                            })())];
                                        case 2:
                                            if (s = v.sent(), n !== _.current) return [2];
                                            if (!s) return I(void 0), [2];
                                            return (null == (d = null != (u = null == (r = s.items) ? void 0 : r.find(function(t) {
                                                return t.collectibleItemId === o
                                            })) ? u : null == (a = s.items) ? void 0 : a[0]) ? void 0 : d.priceInRobux) != null && w(d.priceInRobux), P(null != (f = null == d ? void 0 : d.discountInformation) ? f : null), I((null == (l = s.savingsSummary) ? void 0 : l.trim()) || void 0), null == (c = j.current) || c.call(j, null != (m = null == d ? void 0 : d.priceInRobux) ? m : void 0), y(null != (E = null == (g = s.availableOffers) ? void 0 : g.reduce(function(t, n) {
                                                var r, o, a = null == (r = n.localizedDescription) ? void 0 : r.trim();
                                                return n.offerId && a && t.push({
                                                    offerId: n.offerId,
                                                    localizedText: a,
                                                    selected: null != (o = n.selected) && o
                                                }), t
                                            }, [])) ? E : []), [3, 4];
                                        case 3:
                                            return n === _.current && T(!1), [7];
                                        case 4:
                                            return [2]
                                    }
                                })
                            }, function() {
                                var t = this,
                                    r = arguments;
                                return new Promise(function(o, a) {
                                    var i = n.apply(t, r);

                                    function l(t) {
                                        oQ(i, o, a, l, c, "next", t)
                                    }

                                    function c(t) {
                                        oQ(i, o, a, l, c, "throw", t)
                                    }
                                    l(void 0)
                                })
                            })()
                        }, [o, i, p]), (0, ef.useEffect)(function() {
                            if (!u) {
                                _.current += 1, w(void 0), P(void 0), I(void 0), y([]), T(!1);
                                return
                            }
                            o && !p && U().catch(function() {})
                        }, [u, o, p, U]), R = (0, ef.useCallback)(function(t, n) {
                            var r = h.current.map(function(r) {
                                var o, a;
                                return r.offerId === t ? (o = o0({}, r), a = a = {
                                    selected: n
                                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(o, Object.getOwnPropertyDescriptors(a)) : (function(t, n) {
                                    var r = Object.keys(t);
                                    if (Object.getOwnPropertySymbols) {
                                        var o = Object.getOwnPropertySymbols(t);
                                        r.push.apply(r, o)
                                    }
                                    return r
                                })(Object(a)).forEach(function(t) {
                                    Object.defineProperty(o, t, Object.getOwnPropertyDescriptor(a, t))
                                }), o) : r
                            });
                            h.current = r, y(r);
                            var o = r.filter(function(t) {
                                return !t.selected
                            }).map(function(t) {
                                return t.offerId
                            });
                            U(o.length ? o : void 0).catch(function() {})
                        }, [U]), M = (0, ef.useMemo)(function() {
                            return v.filter(function(t) {
                                return t.selected
                            }).map(function(t) {
                                return t.offerId
                            })
                        }, [v]), {
                            offerSelections: v,
                            resolvedPrice: g,
                            resolvedDiscountInformation: S,
                            resolvedSavingsSummary: A,
                            isPricingLoading: C,
                            selectedOfferIds: M,
                            handleOfferCheckedChange: R
                        }),
                        eg = eb.offerSelections,
                        ew = eb.resolvedPrice,
                        eE = eb.resolvedDiscountInformation,
                        ex = eb.resolvedSavingsSummary,
                        eS = eb.isPricingLoading,
                        eP = eb.selectedOfferIds,
                        eO = eb.handleOfferCheckedChange,
                        eA = null != ew ? ew : G,
                        eI = void 0 !== eE ? eE : ea,
                        eN = (0, ef.useMemo)(function() {
                            var t, n, r, o, a, i, l;
                            return eI ? (i = null != (n = eI.originalPrice) ? n : 0, {
                                savedAmount: l = null != (o = null != (r = eI.totalDiscountAmount) ? r : eI.totalAmountSaved) ? o : 0,
                                originalPrice: i,
                                totalPrice: i - l,
                                discountLines: null != (a = null == (t = eI.discounts) ? void 0 : t.map(function(t, n) {
                                    var r, o, a, i, l = null != (a = null != (o = t.discountAmount) ? o : t.robuxDiscountAmount) ? a : 0,
                                        c = (null == (r = t.localizedDiscountAttribution) ? void 0 : r.trim()) || void 0,
                                        s = c || t.discountCampaign || "Discount ".concat(n + 1);
                                    return {
                                        discountAmount: l,
                                        discountCampaign: t.discountCampaign || t.discountId || "line-".concat(n),
                                        discountType: t.discountType,
                                        label: s,
                                        localizedAttribution: c,
                                        discountPercent: null != (i = t.discountPercentage) ? i : t.robuxDiscountPercentage
                                    }
                                })) ? a : []
                            }) : null
                        }, [eI]),
                        eC = null != $ && eA <= $;
                    o$("UnifiedRobuxUpsellModal", Q);
                    var eT = null != eo ? eo : W(E),
                        e_ = W("Action.Buy"),
                        ej = (L = (k = (0, ef.useState)(!1), D = function(t) {
                            if (Array.isArray(t)) return t
                        }(k) || function(t, n) {
                            var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                            if (null != a) {
                                var i = [],
                                    l = !0,
                                    c = !1;
                                try {
                                    for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), i.length !== n); l = !0);
                                } catch (t) {
                                    c = !0, o = t
                                } finally {
                                    try {
                                        l || null == a.return || a.return()
                                    } finally {
                                        if (c) throw o
                                    }
                                }
                                return i
                            }
                        }(k, 2) || function(t, n) {
                            if (t) {
                                if ("string" == typeof t) return oq(t, 2);
                                var r = Object.prototype.toString.call(t).slice(8, -1);
                                if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oq(t, n)
                            }
                        }(k, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0], F = D[1], (0, ef.useEffect)(function() {
                            var t;
                            (t = K.EnvironmentUrls.apiGatewayUrl, {
                                getDmccaLegalTextFeature: function() {
                                    return Y.get({
                                        retryable: !0,
                                        withCredentials: !0,
                                        url: "".concat(t, "/access-management/v1/upsell-feature-access?featureName=").concat("ShouldUseDMCCALegalDisclosure")
                                    }).then(function(t) {
                                        return "Granted" === t.data.access
                                    })
                                }
                            }).getDmccaLegalTextFeature().then(function(t) {
                                t && F(!0)
                            }).catch(function(t) {
                                console.warn("Failed to fetch DMCCA feature", t)
                            })
                        }, []), B = Z.urlService.getUrlWithLocale(f, en.getRobloxLocale()) + (L ? "#robux-and-premium-membership" : ""), oB(W, "Message.TermsOfUse", [{
                            opening: "aTagStart",
                            closing: "aTagEnd",
                            render: function(t) {
                                return ep().createElement("a", {
                                    href: B,
                                    target: "_blank",
                                    rel: "noreferrer",
                                    className: "underline"
                                }, t)
                            }
                        }])),
                        eU = (0, ef.useCallback)(function() {
                            var t = {
                                purchasePrice: eA,
                                offerIds: eP
                            };
                            eC && ev ? ev(t) : em ? em(t) : X()
                        }, [eA, eP, eC, ev, em, X]);
                    return (0, eh.jsx)(rl, {
                        open: Q,
                        onOpenChange: function(t) {
                            !t && H && H()
                        },
                        isModal: !0,
                        size: "Large",
                        type: "Default",
                        closeLabel: W("Action.Close") || "Close",
                        hasCloseAffordance: !0,
                        children: (0, eh.jsxs)(rc, {
                            className: "relative width-full",
                            children: [(0, eh.jsxs)(rs, {
                                className: "gap-large flex flex-col",
                                children: [(0, eh.jsx)("div", {
                                    className: "margin-bottom-xsmall",
                                    children: (0, eh.jsx)(ob, {
                                        translate: W,
                                        titleText: eT,
                                        currentRobuxBalance: $
                                    })
                                }), (0, eh.jsx)(oP, {
                                    translate: W,
                                    thumbnail: V,
                                    assetName: z,
                                    expectedPrice: eA,
                                    priceSuffix: er,
                                    discountInformation: eI
                                }), eg.map(function(t) {
                                    var n = "upsell-offer-label-".concat(t.offerId);
                                    return (0, eh.jsxs)("label", {
                                        htmlFor: "upsell-offer-checkbox-".concat(t.offerId),
                                        className: "flex flex-row items-start gap-x-small self-start cursor-pointer",
                                        children: [(0, eh.jsx)(r5, {
                                            id: "upsell-offer-checkbox-".concat(t.offerId),
                                            "aria-labelledby": n,
                                            placement: "Start",
                                            size: "Small",
                                            isChecked: t.selected,
                                            onCheckedChange: function(n) {
                                                eO(t.offerId, !0 === n)
                                            },
                                            isDisabled: eS || eu,
                                            "data-testid": "upsell-promo-checkbox-".concat(t.offerId)
                                        }), (0, eh.jsx)(oz, {
                                            id: n,
                                            text: t.localizedText,
                                            className: "text-body-medium content-default"
                                        })]
                                    }, t.offerId)
                                }), eN && eN.savedAmount > 0 && (0, eh.jsx)(oY, {
                                    translate: W,
                                    normalizedDiscount: eN,
                                    savingsSummary: ex
                                }), !eC && null != ee && null != et && (0, eh.jsx)(oK, {
                                    robuxAmount: ee,
                                    price: et
                                })]
                            }), (0, eh.jsx)(ru, {
                                className: "gap-small flex flex-col mt-[40px]",
                                children: (0, eh.jsxs)("div", {
                                    className: "flex flex-col items-center text-center width-full gap-medium",
                                    children: [(0, eh.jsx)(op, {
                                        variant: "Emphasis",
                                        className: "width-full shrink-0",
                                        onClick: eU,
                                        isDisabled: void 0 !== q && q || eS || eu,
                                        "data-testid": "purchase-confirm-button",
                                        children: e_
                                    }), (0, eh.jsx)("div", {
                                        className: "text-body-small",
                                        children: ej
                                    })]
                                })
                            })]
                        })
                    })
                },
                o3 = function(t) {
                    var n = t.translate,
                        r = t.expectedPrice,
                        o = t.thumbnail,
                        a = t.assetName,
                        i = t.onAction,
                        l = t.onCancel,
                        c = t.loading,
                        s = t.currentRobuxBalance,
                        u = t.open,
                        d = void 0 !== u && u;
                    return o$("UnifiedRobuxUpsellTooExpensiveModal", d), (0, eh.jsx)(rl, {
                        open: d,
                        onOpenChange: function(t) {
                            !t && l && l()
                        },
                        isModal: !0,
                        size: "Large",
                        type: "Default",
                        closeLabel: n("Action.Close") || "Close",
                        hasCloseAffordance: !0,
                        children: (0, eh.jsxs)(rc, {
                            className: "relative width-full",
                            children: [(0, eh.jsxs)(rs, {
                                className: "gap-large flex flex-col",
                                children: [(0, eh.jsx)("div", {
                                    className: "margin-bottom-xsmall",
                                    children: (0, eh.jsx)(ob, {
                                        translate: n,
                                        titleText: n(O),
                                        currentRobuxBalance: s
                                    })
                                }), (0, eh.jsx)(oP, {
                                    translate: n,
                                    thumbnail: o,
                                    assetName: a,
                                    expectedPrice: r
                                })]
                            }), (0, eh.jsx)(ru, {
                                className: "gap-small flex flex-col mt-[40px]",
                                children: (0, eh.jsx)("div", {
                                    className: "flex flex-row-reverse",
                                    children: (0, eh.jsx)(op, {
                                        "aria-label": n(O),
                                        variant: "Emphasis",
                                        className: " fill",
                                        onClick: i,
                                        isDisabled: void 0 !== c && c,
                                        "data-testid": "purchase-confirm-button",
                                        children: (0, eh.jsxs)("div", {
                                            className: "fill basis-0 inline-flex items-center gap-medium leading-none",
                                            children: [(0, eh.jsx)(n6, {
                                                name: "icon-filled-arrow-up-right-from-square",
                                                className: "align-middle"
                                            }), n(x)]
                                        })
                                    })
                                })
                            })]
                        })
                    })
                },
                o5 = function(t) {
                    var n = document.createElement("div");
                    document.body.appendChild(n);
                    var r = function() {
                            ev().unmountComponentAtNode(n), n.remove()
                        },
                        o = function() {
                            var n;
                            r(), null == (n = t.onCancel) || n.call(t)
                        },
                        a = function() {
                            var n;
                            !1 !== (null == (n = t.onAccept) ? void 0 : n.call(t)) && o()
                        };
                    if ("tooExpensive" === t.variant) {
                        var i = (0, ey.withTranslations)(o3, oy),
                            l = ep().createElement(i, {
                                expectedPrice: t.expectedPrice,
                                thumbnail: t.thumbnail,
                                assetName: t.assetName,
                                onAction: a,
                                onCancel: o,
                                open: !0,
                                loading: !1,
                                currentRobuxBalance: t.currentRobuxBalance
                            });
                        return ev().render(l, n), {
                            close: o,
                            updatePackage: function() {},
                            setPackageLoading: function() {}
                        }
                    }
                    var c = (0, ey.withTranslations)(o2, oy),
                        s = t.upsellProduct,
                        u = !1,
                        d = t.onAcceptOffers ? function(n) {
                            var r;
                            !1 !== (null == (r = t.onAcceptOffers) ? void 0 : r.call(t, n)) && o()
                        } : void 0,
                        f = t.onDirectPurchase ? function(n) {
                            var o;
                            null == (o = t.onDirectPurchase) || o.call(t, n), r()
                        } : void 0,
                        p = function() {
                            var r = ep().createElement(c, {
                                expectedPrice: t.expectedPrice,
                                thumbnail: t.thumbnail,
                                assetName: t.assetName,
                                assetType: t.assetType,
                                assetTypeDisplayName: t.assetTypeDisplayName,
                                onAction: a,
                                onCancel: o,
                                open: !0,
                                loading: !1,
                                currentRobuxBalance: t.currentRobuxBalance,
                                robuxPackageAmount: null == s ? void 0 : s.robux_amount,
                                robuxPackagePrice: null == s ? void 0 : s.price,
                                packageLoading: u,
                                priceSuffix: t.priceSuffix,
                                title: t.title,
                                discountInformation: t.discountInformation,
                                collectibleItemId: t.collectibleItemId,
                                rentalOptionDays: t.rentalOptionDays,
                                isLimited: t.isLimited,
                                onRefetchPackage: t.onRefetchPackage,
                                onAcceptOffers: d,
                                onDirectPurchase: f
                            });
                            ev().render(r, n)
                        };
                    return p(), {
                        close: o,
                        updatePackage: function(t) {
                            var n = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                            t && (s = t), u = n, p()
                        },
                        setPackageLoading: function(t) {
                            u = t, p()
                        }
                    }
                };

            function o4(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }
            var o6 = function() {
                var t;

                function n() {
                    var t = this;
                    if (!(this instanceof n)) throw TypeError("Cannot call a class as a function");
                    o4(this, "overlayDiv", null), o4(this, "contentDiv", null), o4(this, "loadingMessageSpan", null), o4(this, "spinnerSpan", null), o4(this, "loadingOverlayElementId", "loading-overlay"), o4(this, "_loadingMessage", void 0), o4(this, "show", function(n) {
                        var r = t.getOrCreateOverlayDiv(),
                            o = t.getOrCreateContentDiv(r);
                        return t.getOrCreateSpinnerSpan(o), t.updateOrCreateMessage(n), t
                    }), o4(this, "hide", function() {
                        var n, r, o, a, i, l, c, s;
                        null == (r = t.spinnerSpan) || null == (n = r.parentNode) || n.removeChild(t.spinnerSpan), null == (a = t.loadingMessageSpan) || null == (o = a.parentNode) || o.removeChild(t.loadingMessageSpan), null == (l = t.contentDiv) || null == (i = l.parentNode) || i.removeChild(t.contentDiv), null == (s = t.overlayDiv) || null == (c = s.parentNode) || c.removeChild(t.overlayDiv), t.overlayDiv = null, t.contentDiv = null, t.spinnerSpan = null, t.loadingMessageSpan = null
                    }), o4(this, "updateMessage", function(n) {
                        t._loadingMessage = n, t.updateOrCreateMessage(n)
                    }), o4(this, "updateOrCreateMessage", function(n) {
                        if (t.overlayDiv) {
                            if (!n) {
                                var r, o;
                                null == (o = t.loadingMessageSpan) || null == (r = o.parentNode) || r.removeChild(t.loadingMessageSpan), t.loadingMessageSpan = null;
                                return
                            }
                            if (t.loadingMessageSpan) t.loadingMessageSpan.innerText = n;
                            else {
                                var a = document.createElement("span");
                                a.innerText = n, a.classList.add("loading-message"), t.getOrCreateContentDiv(t.overlayDiv).appendChild(a), t.loadingMessageSpan = a
                            }
                        }
                    }), o4(this, "getOrCreateContentDiv", function(n) {
                        if (t.contentDiv) return t.contentDiv;
                        var r = document.createElement("div");
                        return r.classList.add("loading-overlay-content"), t.contentDiv = r, n.appendChild(r), r
                    }), o4(this, "getOrCreateOverlayDiv", function() {
                        if (t.overlayDiv) return t.overlayDiv;
                        var n = document.getElementById(t.loadingOverlayElementId);
                        if (n) return t.overlayDiv = n, n;
                        var r = document.createElement("div");
                        return t.overlayDiv = r, r.id = t.loadingOverlayElementId, r.classList.add("loading-overlay"), document.body.appendChild(r), r
                    }), o4(this, "getOrCreateSpinnerSpan", function(n) {
                        if (t.spinnerSpan) return t.spinnerSpan;
                        var r = document.createElement("span");
                        return r.classList.add("spinner", "spinner-default"), n.appendChild(r), t.spinnerSpan = r, r
                    })
                }
                return t = [{
                        key: "loadingMessage",
                        get: function() {
                            return this._loadingMessage
                        }
                    }],
                    function(t, n) {
                        for (var r = 0; r < n.length; r++) {
                            var o = n[r];
                            o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(t, o.key, o)
                        }
                    }(n.prototype, t), n
            }();

            function o8(t, n, r, o, a, i, l) {
                try {
                    var c = t[i](l),
                        s = c.value
                } catch (t) {
                    r(t);
                    return
                }
                c.done ? n(s) : Promise.resolve(s).then(o, a)
            }

            function o7(t) {
                d.upsellUtil.expireUpsellCookie(), window.location.href = u.Endpoints.getAbsoluteUrl(t)
            }

            function o9() {
                var t;
                return (t = function() {
                    var t;
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
                        return l.next = c(0), l.throw = c(1), l.return = c(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                            return this
                        }), l;

                        function c(c) {
                            return function(s) {
                                var u = [c, s];
                                if (r) throw TypeError("Generator is already executing.");
                                for (; l && (l = 0, u[0] && (i = 0)), i;) try {
                                    if (r = 1, o && (a = 2 & u[0] ? o.return : u[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, u[1])).done) return a;
                                    switch (o = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                        case 0:
                                        case 1:
                                            a = u;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: u[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, o = u[1], u = [0];
                                            continue;
                                        case 7:
                                            u = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                                i.label = u[1];
                                                break
                                            }
                                            if (6 === u[0] && i.label < a[1]) {
                                                i.label = a[1], a = u;
                                                break
                                            }
                                            if (a && i.label < a[2]) {
                                                i.label = a[2], i.ops.push(u);
                                                break
                                            }
                                            a[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    u = n.call(t, i)
                                } catch (t) {
                                    u = [6, t], o = 0
                                } finally {
                                    r = a = 0
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
                                return t = {
                                    url: "".concat(K.EnvironmentUrls.apiGatewayUrl).concat("/vng-payments/v1/getVngShopUrl"),
                                    withCredentials: !0
                                }, [4, Y.get(t)];
                            case 1:
                                return [2, n.sent().data.vngShopRedirectUrl]
                        }
                    })
                }, function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(o, a) {
                        var i = t.apply(n, r);

                        function l(t) {
                            o8(i, o, a, l, c, "next", t)
                        }

                        function c(t) {
                            o8(i, o, a, l, c, "throw", t)
                        }
                        l(void 0)
                    })
                })()
            }

            function ae() {
                (0, u.DeviceMeta)().isDesktop && (0, u.DeviceMeta)().isUniversalApp ? o9().then(function(t) {
                    return window.open(t, "_self")
                }).catch(function() {
                    return window.open(K.EnvironmentUrls.vngGamesShopUrl, "_self")
                }) : o9().then(function(t) {
                    return window.open(t, "_blank")
                }).catch(function() {
                    return window.open(K.EnvironmentUrls.vngGamesShopUrl, "_blank")
                })
            }

            function at(t, n, r, o) {
                var a = "<span>".concat(r.get("Message.PurchaseSucceededRobuxBalance", {
                        userRobuxBalance: ee(n)
                    }), "</span>"),
                    i = "<div class='item-content'>\n        <div class='item-card-container item-preview'>\n          <div class='item-card-thumb'>\n            <img alt='item preview' src='".concat(t.itemThumbnailUrl, "'/>\n          </div>\n        </div>\n        <div class='text-center'>\n          ").concat(r.get("Message.PurchaseSucceeded", {
                        assetName: t.assetName
                    }), "\n          ").concat(a, "\n        </div>\n      </div>"),
                    l = t.assetType === b || "Subscription" === t.assetType,
                    c = l ? r.get(N, {}) : r.get("Action.EquipMyAvatar", {});
                u.Dialog.open({
                    titleText: r.get("Heading.PurchaseSucceeded", {}),
                    bodyContent: i,
                    declineText: r.get("Action.BackToShop", {}),
                    acceptText: c,
                    acceptColor: "btn-primary-md",
                    onAccept: function() {
                        d.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(d.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, d.paymentFlowAnalyticsService.ENUM_VIEW_NAME.SUCCESS, d.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, d.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.OK, {
                            item_type: t.assetType,
                            item_id: t.productId
                        }, !0), ec("AutoPurchaseSucceedEquipMyAvatar", t.assetType);
                        var n, r = t.itemPath;
                        return ((null === u.Endpoints || void 0 === u.Endpoints ? void 0 : u.Endpoints.supportLocalizedUrls) && (r = u.Endpoints.removeUrlLocale(r)), l) ? r.startsWith(m) ? o7("".concat(t.itemPath, "?#!/store")) : o7(t.itemPath) : void 0 !== (n = u.Endpoints.getAbsoluteUrl("/my/avatar")) && "" !== n && (d.upsellUtil.expireUpsellCookie(), window.location.href = n), !1
                    },
                    onDecline: function() {
                        return o.show(), d.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(d.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, d.paymentFlowAnalyticsService.ENUM_VIEW_NAME.SUCCESS, d.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, d.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.CANCEL, {
                            item_type: t.assetType,
                            item_id: t.productId
                        }, !0), ec("AutoPurchaseSucceedBackToShop", t.assetType), o7(t.itemPath), !1
                    },
                    onCancel: function() {
                        return o.show(), d.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(d.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, d.paymentFlowAnalyticsService.ENUM_VIEW_NAME.SUCCESS, d.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, d.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.CANCEL, {
                            item_type: t.assetType,
                            item_id: t.productId
                        }, !0), ec("AutoPurchaseSucceedClose", t.assetType), o7(t.itemPath), !1
                    },
                    allowHtmlContentInBody: !0,
                    allowHtmlContentInFooter: !1,
                    fieldValidationRequired: !0,
                    showDecline: !l,
                    dismissable: !1,
                    xToCancel: !0
                })
            }

            function an(t, n) {
                u.Dialog.open({
                    titleText: n.get("Heading.ErrorOccured", {}),
                    bodyContent: n.get("Message.PurchaseErrorOccured", {}),
                    imageUrl: t.alertImageUrl,
                    acceptText: n.get(N, {}),
                    acceptColor: "btn-secondary-md",
                    declineColor: "btn-none",
                    dismissable: !0,
                    allowHtmlContentInBody: !0
                })
            }

            function ar(t, n, r, o, a, i, l) {
                try {
                    var c = t[i](l),
                        s = c.value
                } catch (t) {
                    r(t);
                    return
                }
                c.done ? n(s) : Promise.resolve(s).then(o, a)
            }

            function ao(t) {
                return function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(o, a) {
                        var i = t.apply(n, r);

                        function l(t) {
                            ar(i, o, a, l, c, "next", t)
                        }

                        function c(t) {
                            ar(i, o, a, l, c, "throw", t)
                        }
                        l(void 0)
                    })
                }
            }

            function aa(t, n) {
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
                return l.next = c(0), l.throw = c(1), l.return = c(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                    return this
                }), l;

                function c(c) {
                    return function(s) {
                        var u = [c, s];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; l && (l = 0, u[0] && (i = 0)), i;) try {
                            if (r = 1, o && (a = 2 & u[0] ? o.return : u[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, u[1])).done) return a;
                            switch (o = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                case 0:
                                case 1:
                                    a = u;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, o = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                        i.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && i.label < a[1]) {
                                        i.label = a[1], a = u;
                                        break
                                    }
                                    if (a && i.label < a[2]) {
                                        i.label = a[2], i.ops.push(u);
                                        break
                                    }
                                    a[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            u = n.call(t, i)
                        } catch (t) {
                            u = [6, t], o = 0
                        } finally {
                            r = a = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function ai(t, n, r, o) {
                return ao(function() {
                    var a, i, l, c, s, d, f, p, m, v, y, h;
                    return aa(this, function(b) {
                        var g, w, E;
                        switch (b.label) {
                            case 0:
                                a = {
                                    url: t,
                                    withCredentials: !0,
                                    retryable: !1,
                                    noCache: !0,
                                    noPragma: !0
                                }, b.label = 1;
                            case 1:
                                return b.trys.push([1, 3, , 4]), s = function(t) {
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
                                }({
                                    expectedCurrency: n.expectedCurrency,
                                    expectedPrice: n.expectedPrice,
                                    expectedSellerId: n.expectedSellerId,
                                    expectedPromoId: n.expectedPromoId,
                                    userAssetId: n.userAssetId,
                                    collectibleItemId: null == (i = n.itemDetail) ? void 0 : i.collectibleItemId,
                                    collectibleProductId: null == (l = n.itemDetail) ? void 0 : l.collectibleProductId,
                                    expectedPurchaserId: u.CurrentUser.userId,
                                    expectedPurchaserType: "User",
                                    idempotencyKey: Z.uuidService.generateRandomUuid()
                                }, (null == (c = n.offerIds) ? void 0 : c.length) ? {
                                    offerIds: n.offerIds
                                } : {}), [4, Y.post(a, s)];
                            case 2:
                                if (500 === (d = b.sent().data).statusCode) return ec("AutoPurchaseErrorFromPurchaseApi", n.assetType), void 0 === d.showDivID && (d.showDivID = d.showDivId), void 0 === d.AssetID && (d.AssetID = d.assetId), r.hide(), (0, u.ItemPurchase)().openErrorView(d), eo(), [2, Promise.resolve()];
                                return n.isLibrary && u.EventStream && u.UrlParser && (g = d.assetId, w = null === u.CurrentUser || void 0 === u.CurrentUser ? void 0 : u.CurrentUser.userId, f = {
                                    assetId: g,
                                    category: (E = u.UrlParser.getParametersAsObject()).Category,
                                    creatorId: E.CreatorId,
                                    genre: E.GenreCsv,
                                    page: E.Page,
                                    position: E.Position,
                                    searchKeyword: E.SearchKeyword,
                                    sortAggregation: E.SortAggregation,
                                    sortType: E.SortType,
                                    userId: w,
                                    searchId: E.SearchId
                                }, u.EventStream.SendEventWithTarget("LibraryAssetAcquired", "Marketplace", f, u.EventStream.TargetTypes.WWW)), ec(z, n.assetType), r.hide(), p = n.userBalance - n.expectedPrice, at(n, p, o, r), [2, Promise.resolve()];
                            case 3:
                                if (m = b.sent(), r.hide(), ec(X, n.assetType), v = m, (void 0 === m ? "undefined" : m && "undefined" != typeof Symbol && m.constructor === Symbol ? "symbol" : typeof m) != "object" || !("responseText" in v.request)) return [2, Promise.reject(v.request)];
                                if ("Bad Request" === (y = v.request).responseText) an(n, o);
                                else try {
                                    h = JSON.parse(y.responseText || ""), (0, u.ItemPurchase)().openErrorView(h), eo()
                                } catch (t) {
                                    return [2, Promise.reject(t)]
                                }
                                return [2, Promise.reject(m)];
                            case 4:
                                return [2]
                        }
                    })
                })()
            }

            function al(t) {
                var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : void 0,
                    r = arguments.length > 2 ? arguments[2] : void 0,
                    o = arguments.length > 3 ? arguments[3] : void 0;
                return ao(function() {
                    var a, i, l, c, s, d, f, p, m;
                    return aa(this, function(v) {
                        if (null == (a = t.itemContainerElemClassList) ? void 0 : a.contains("btn-disabled-primary")) return [2, Promise.resolve()];
                        if (c = "".concat(u.EnvironmentUrls.apiGatewayUrl).concat("/game-passes/v1/game-passes/{productId}/purchase".replace("{productId}", t.productId)), s = "".concat(u.EnvironmentUrls.economyApi).concat("/v1/purchases/products/{productId}".replace("{productId}", t.productId)), (null == (i = t.itemDetail) ? void 0 : i.collectibleItemId) && (f = t.itemDetail.collectibleItemInstanceId ? "/marketplace-sales/v1/item/{collectibleItemId}/purchase-resale" : "/marketplace-sales/v1/item/{collectibleItemId}/purchase-item", d = "".concat(u.EnvironmentUrls.apiGatewayUrl).concat(f.replace("{collectibleItemId}", t.itemDetail.collectibleItemId))), n) return [2, n({
                            productId: t.productId,
                            expectedPrice: t.expectedPrice,
                            expectedCurrency: t.expectedCurrency,
                            expectedPromoId: null == (p = t.expectedPromoId) ? void 0 : p.toString(),
                            expectedSellerId: t.expectedSellerId,
                            userAssetId: null == (m = t.userAssetId) ? void 0 : m.toString()
                        })];
                        if (ec("AutoPurchaseStarted", t.assetType), null == (l = t.itemDetail) ? void 0 : l.subscriptionTargetKey) {
                            var y;
                            return [2, (y = "".concat(u.EnvironmentUrls.apiGatewayUrl).concat("/v1/subscriptions/purchase-with-robux/{subscriptionTargetKey}".replace("{subscriptionTargetKey}", t.itemDetail.subscriptionTargetKey)), ao(function() {
                                var n, a, i;
                                return aa(this, function(l) {
                                    switch (l.label) {
                                        case 0:
                                            n = {
                                                url: y,
                                                withCredentials: !0,
                                                retryable: !1,
                                                noCache: !0,
                                                noPragma: !0
                                            }, l.label = 1;
                                        case 1:
                                            return l.trys.push([1, 3, , 4]), [4, Y.post(n, {
                                                priceInRobux: t.expectedPrice
                                            })];
                                        case 2:
                                            return l.sent(), ec(z, t.assetType), r.hide(), a = t.userBalance - t.expectedPrice, at(t, a, o, r), [2, Promise.resolve()];
                                        case 3:
                                            return i = l.sent(), r.hide(), ec(X, t.assetType), an(t, o), [2, Promise.reject(i)];
                                        case 4:
                                            return [2]
                                    }
                                })
                            })())]
                        }
                        return t.assetType === b ? [2, ai(c, t, r, o)] : d ? [2, ai(d, t, r, o)] : [2, ai(s, t, r, o)]
                    })
                })()
            }

            function ac(t, n, r, o, a, i, l) {
                try {
                    var c = t[i](l),
                        s = c.value
                } catch (t) {
                    r(t);
                    return
                }
                c.done ? n(s) : Promise.resolve(s).then(o, a)
            }
            var as = function(t) {
                var n = t.thumbnailImageUrl;
                return (0, eh.jsxs)("div", {
                    className: "item-preview",
                    style: {
                        overflow: "hidden",
                        maxWidth: "100%"
                    },
                    children: [(0, eh.jsx)("div", {
                        className: "item-card-thumb",
                        children: (0, eh.jsx)("img", {
                            alt: "item preview",
                            src: null != n ? n : "",
                            style: {
                                width: "150px",
                                height: "150px",
                                objectFit: "cover",
                                borderRadius: "8px"
                            }
                        })
                    }), (0, eh.jsx)("div", {
                        className: "item-info text-name"
                    })]
                })
            };

            function au(t, n, r, o, a) {
                var i, l, c = function(t, n, r) {
                    var o, a, i = d.upsellUtil.constants.UPSELL_TARGET_ITEM_URL_REGEX.exec(window.location.pathname);
                    if (d.upsellUtil.constants.UPSELL_TARGET_ITEM_URL_REGEX.lastIndex = 0, Array.isArray(i) && i.length > 0 && (o = (function(t) {
                            if (Array.isArray(t)) return t
                        }(i) || function(t, n) {
                            var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                            if (null != a) {
                                var i = [],
                                    l = !0,
                                    c = !1;
                                try {
                                    for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), i.length !== n); l = !0);
                                } catch (t) {
                                    c = !0, o = t
                                } finally {
                                    try {
                                        l || null == a.return || a.return()
                                    } finally {
                                        if (c) throw o
                                    }
                                }
                                return i
                            }
                        }(i, 1) || function(t, n) {
                            if (t) {
                                if ("string" == typeof t) return en(t, 1);
                                var r = Object.prototype.toString.call(t).slice(8, -1);
                                if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return en(t, n)
                            }
                        }(i, 1) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }())[0]), !o || !n || Object.keys(n).length < 4) return "";
                    var l = Z.uuidService.generateRandomUuid(),
                        c = "".concat(n.expectedCurrency, ",").concat(n.expectedPrice, ",").concat(n.expectedSellerId, ",").concat(null != (a = n.userassetId) ? a : ""),
                        s = n.productId || "";
                    s += ",".concat(n.collectibleItemId || ""), s += ",".concat(n.collectibleItemInstanceId || ""), s += ",".concat(n.collectibleProductId || ""), s += ",".concat(n.subscriptionTargetKey || ""), s += ",".concat(encodeURIComponent(n.itemName || ""));
                    var f = "".concat(l, ",").concat(o, ",").concat(u.CurrentUser.userId, ",").concat(c, ",").concat(s),
                        p = new Date;
                    p.setHours(p.getHours() + 1);
                    var m = [d.upsellUtil.constants.UPSELL_COOKIE_KEY, "=", encodeURIComponent(f), "; expires=".concat(p.toUTCString()), "; path=/", "; domain=.", K.EnvironmentUrls.domain, ";"];
                    document.cookie = m.join("");
                    if (l && (null == r ? void 0 : r.length)) try {
                        window.sessionStorage.setItem(et(l), JSON.stringify(r))
                    } catch (t) {}
                    return l
                }(0, r && null != o ? (i = function(t) {
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
                }({}, r), l = l = {
                    expectedPrice: String(o)
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(i, Object.getOwnPropertyDescriptors(l)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(l)).forEach(function(t) {
                    Object.defineProperty(i, t, Object.getOwnPropertyDescriptor(l, t))
                }), i) : r, a);
                ec("UpsellContinued", null == r ? void 0 : r.assetType), d.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(d.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, d.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBUX_UPSELL, d.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, d.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.GO_TO_ROBUX_PURCHASE_PAGE), window.location.href = Z.urlService.getAbsoluteUrl("".concat("/upgrades/paymentmethods", "?ap=").concat(t.roblox_product_id, "&UpsellUuid=").concat(c))
            }

            function ad(t, n, r, o) {
                var a = Date.now(),
                    i = a - n;
                d.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(d.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, d.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBUX_UPSELL, d.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, t, {
                    userBalance: r.userBalanceRobux.toString(),
                    itemCost: o.expectedItemPrice.toString(),
                    modalImpressionTimeInMs: i.toString(),
                    modalStartTimeInMs: n.toString(),
                    modalEndTimeInMs: a.toString()
                })
            }

            function af(t, n, r, o, a, i, l) {
                try {
                    var c = t[i](l),
                        s = c.value
                } catch (t) {
                    r(t);
                    return
                }
                c.done ? n(s) : Promise.resolve(s).then(o, a)
            }

            function ap(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function am(t, n, r, o, a, i, l) {
                try {
                    var c = t[i](l),
                        s = c.value
                } catch (t) {
                    r(t);
                    return
                }
                c.done ? n(s) : Promise.resolve(s).then(o, a)
            }

            function av(t, n) {
                try {
                    u.EventStream.SendEventWithTarget("ItemPurchaseUpsellEvent", t, n, u.EventStream.TargetTypes.WWW)
                } catch (t) {}
            }

            function ay(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function ah(t, n, r, o, a, i, l) {
                try {
                    var c = t[i](l),
                        s = c.value
                } catch (t) {
                    r(t);
                    return
                }
                c.done ? n(s) : Promise.resolve(s).then(o, a)
            }

            function ab(t) {
                return function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(o, a) {
                        var i = t.apply(n, r);

                        function l(t) {
                            ah(i, o, a, l, c, "next", t)
                        }

                        function c(t) {
                            ah(i, o, a, l, c, "throw", t)
                        }
                        l(void 0)
                    })
                }
            }

            function ag(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var i = [],
                            l = !0,
                            c = !1;
                        try {
                            for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            c = !0, o = t
                        } finally {
                            try {
                                l || null == a.return || a.return()
                            } finally {
                                if (c) throw o
                            }
                        }
                        return i
                    }
                }(t, n) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return ay(t, n);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ay(t, n)
                    }
                }(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function aw(t, n) {
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
                return l.next = c(0), l.throw = c(1), l.return = c(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                    return this
                }), l;

                function c(c) {
                    return function(s) {
                        var u = [c, s];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; l && (l = 0, u[0] && (i = 0)), i;) try {
                            if (r = 1, o && (a = 2 & u[0] ? o.return : u[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, u[1])).done) return a;
                            switch (o = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                case 0:
                                case 1:
                                    a = u;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, o = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                        i.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && i.label < a[1]) {
                                        i.label = a[1], a = u;
                                        break
                                    }
                                    if (a && i.label < a[2]) {
                                        i.label = a[2], i.ops.push(u);
                                        break
                                    }
                                    a[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            u = n.call(t, i)
                        } catch (t) {
                            u = [6, t], o = 0
                        } finally {
                            r = a = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function aE(t, n, r, o, a, i, l) {
                try {
                    var c = t[i](l),
                        s = c.value
                } catch (t) {
                    r(t);
                    return
                }
                c.done ? n(s) : Promise.resolve(s).then(o, a)
            }
            var ax = function(t) {
                    var n = document.querySelector('.PurchaseButton[data-product-id="'.concat(t.productId, '"]')),
                        r = null == n ? void 0 : n.closest(".store-card"),
                        o = null == r ? void 0 : r.querySelector(".gear-passes-asset img");
                    return o ? o.src : null
                },
                aS = function(t, n) {
                    var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : window.location.pathname;
                    if (r.includes(m)) {
                        if (!n) throw Error("button data not exist");
                        if (ec("UpsellFromGamesPage", n.assetType), "Subscription" === n.assetType) return t.imageurl;
                        var o = ax(n);
                        if (!o) throw ec("UpsellThumbnailProcessFailed", n.assetType), Error("thumbnail image url process failed");
                        return o
                    }
                    return t.imageurl
                },
                aP = window.HeaderScripts;

            function aO(t, n, r, o, a, i, l) {
                try {
                    var c = t[i](l),
                        s = c.value
                } catch (t) {
                    r(t);
                    return
                }
                c.done ? n(s) : Promise.resolve(s).then(o, a)
            }

            function aA(t, n, r, o, a, i, l) {
                try {
                    var c = t[i](l),
                        s = c.value
                } catch (t) {
                    r(t);
                    return
                }
                c.done ? n(s) : Promise.resolve(s).then(o, a)
            }

            function aI(t, n, r, o, a, i, l) {
                try {
                    var c = t[i](l),
                        s = c.value
                } catch (t) {
                    r(t);
                    return
                }
                c.done ? n(s) : Promise.resolve(s).then(o, a)
            }

            function aN(t) {
                return function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(o, a) {
                        var i = t.apply(n, r);

                        function l(t) {
                            aI(i, o, a, l, c, "next", t)
                        }

                        function c(t) {
                            aI(i, o, a, l, c, "throw", t)
                        }
                        l(void 0)
                    })
                }
            }

            function aC(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function aT(t, n) {
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
                return l.next = c(0), l.throw = c(1), l.return = c(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                    return this
                }), l;

                function c(c) {
                    return function(s) {
                        var u = [c, s];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; l && (l = 0, u[0] && (i = 0)), i;) try {
                            if (r = 1, o && (a = 2 & u[0] ? o.return : u[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, u[1])).done) return a;
                            switch (o = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                case 0:
                                case 1:
                                    a = u;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: u[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, o = u[1], u = [0];
                                    continue;
                                case 7:
                                    u = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                        i.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && i.label < a[1]) {
                                        i.label = a[1], a = u;
                                        break
                                    }
                                    if (a && i.label < a[2]) {
                                        i.label = a[2], i.ops.push(u);
                                        break
                                    }
                                    a[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            u = n.call(t, i)
                        } catch (t) {
                            u = [6, t], o = 0
                        } finally {
                            r = a = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var a_ = function() {
                var t;

                function n() {
                    var t = this;
                    if (!(this instanceof n)) throw TypeError("Cannot call a class as a function");
                    aC(this, "intl", void 0), aC(this, "intlProvider", void 0), aC(this, "translationResource", void 0), aC(this, "loadingOverlay", void 0), aC(this, "_state", {
                        purchased: !1,
                        retryRemainTimes: 5,
                        timeoutHandle: null
                    }), aC(this, "_checkBalanceAndPurchase", function(n, r) {
                        return aN(function() {
                            var t, o, a;
                            return aT(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (t = this, this._state.purchased) return [2, Promise.resolve()];
                                        i.label = 1;
                                    case 1:
                                        var l;
                                        return i.trys.push([1, 5, , 6]), o = this.translationResource.get("Label.WaitingForRobux", {}), this.loadingOverlay.updateMessage(o), [4, (l = function() {
                                            var t, n, r;
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
                                                return l.next = c(0), l.throw = c(1), l.return = c(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                                                    return this
                                                }), l;

                                                function c(c) {
                                                    return function(s) {
                                                        var u = [c, s];
                                                        if (r) throw TypeError("Generator is already executing.");
                                                        for (; l && (l = 0, u[0] && (i = 0)), i;) try {
                                                            if (r = 1, o && (a = 2 & u[0] ? o.return : u[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, u[1])).done) return a;
                                                            switch (o = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                                                case 0:
                                                                case 1:
                                                                    a = u;
                                                                    break;
                                                                case 4:
                                                                    return i.label++, {
                                                                        value: u[1],
                                                                        done: !1
                                                                    };
                                                                case 5:
                                                                    i.label++, o = u[1], u = [0];
                                                                    continue;
                                                                case 7:
                                                                    u = i.ops.pop(), i.trys.pop();
                                                                    continue;
                                                                default:
                                                                    if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                                        i = 0;
                                                                        continue
                                                                    }
                                                                    if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                                                        i.label = u[1];
                                                                        break
                                                                    }
                                                                    if (6 === u[0] && i.label < a[1]) {
                                                                        i.label = a[1], a = u;
                                                                        break
                                                                    }
                                                                    if (a && i.label < a[2]) {
                                                                        i.label = a[2], i.ops.push(u);
                                                                        break
                                                                    }
                                                                    a[2] && i.ops.pop(), i.trys.pop();
                                                                    continue
                                                            }
                                                            u = n.call(t, i)
                                                        } catch (t) {
                                                            u = [6, t], o = 0
                                                        } finally {
                                                            r = a = 0
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
                                                        t = u.CurrentUser.userId, n = {
                                                            url: "".concat(K.EnvironmentUrls.economyApi).concat("/v1/users/{userId}/currency".replace("{userId}", t)),
                                                            withCredentials: !0,
                                                            retryable: !1,
                                                            noCache: !0
                                                        }, o.label = 1;
                                                    case 1:
                                                        return o.trys.push([1, 3, , 4]), [4, Y.get(n)];
                                                    case 2:
                                                        if (200 === (r = o.sent()).status) return [2, r.data.robux];
                                                        return [2, Promise.reject()];
                                                    case 3:
                                                        return [2, Promise.reject(o.sent())];
                                                    case 4:
                                                        return [2]
                                                }
                                            })
                                        }, function() {
                                            var t = this,
                                                n = arguments;
                                            return new Promise(function(r, o) {
                                                var a = l.apply(t, n);

                                                function i(t) {
                                                    aE(a, r, o, i, c, "next", t)
                                                }

                                                function c(t) {
                                                    aE(a, r, o, i, c, "throw", t)
                                                }
                                                i(void 0)
                                            })
                                        })()];
                                    case 2:
                                        if (n.userBalance = a = i.sent(), !(a >= n.expectedPrice)) return [3, 4];
                                        return [4, al(n, r, this.loadingOverlay, this.translationResource)];
                                    case 3:
                                        i.sent(), this._stopPeriodicChecking(), this._state.purchased = !0, i.label = 4;
                                    case 4:
                                        return this._state.purchased || (this._state.retryRemainTimes > 0 ? (this._state.timeoutHandle = window.setTimeout(function() {
                                            return aN(function() {
                                                return aT(this, function(t) {
                                                    switch (t.label) {
                                                        case 0:
                                                            return [4, this._checkBalanceAndPurchase(n, r)];
                                                        case 1:
                                                            return t.sent(), [2]
                                                    }
                                                })
                                            }).call(t)
                                        }, 1e3), this._state.retryRemainTimes -= 1) : (ec("AutoPurchaseFailedDueToStillLowBalance", null == n ? void 0 : n.assetType), this._processGenericErrorState(n))), [3, 6];
                                    case 5:
                                        return i.sent(), ec(X, null == n ? void 0 : n.assetType), this._processGenericErrorState(n), [3, 6];
                                    case 6:
                                        return [2, Promise.resolve()]
                                }
                            })
                        }).call(t)
                    }), aC(this, "_stopPeriodicChecking", function() {
                        t._state.timeoutHandle && (clearTimeout(t._state.timeoutHandle), t._state.timeoutHandle = null)
                    }), aC(this, "_processGenericErrorState", function(n) {
                        t.loadingOverlay.hide(), an(n, t.translationResource), eo()
                    }), this.intl = new u.Intl, this.intlProvider = new u.TranslationResourceProvider(this.intl), this.translationResource = this.intlProvider.getTranslationResource(v), this.loadingOverlay = new o6
                }
                return t = [{
                        key: "startItemUpsellProcess",
                        value: function(t, n, r) {
                            return aN(function(t, n, r) {
                                var o, a, i, l, c, s, m, b, g, w, N, T, _, j, U, R, M, k, D, L, F, G, z, X, Y, K, q = arguments;
                                return aT(this, function(Q) {
                                    var et, en, er, eo, ea, ei, el, es, eu, ef, ep;
                                    switch (Q.label) {
                                        case 0:
                                            if (o = q.length > 3 && void 0 !== q[3] ? q[3] : null == (et = document.getElementById(p)) ? void 0 : et.dataset, a = q.length > 4 && void 0 !== q[4] && q[4], !(l = o) || n.isLimited || (null == n || null == (i = n.buyButtonElementDataset) ? void 0 : i.assetType) === "Product") return r(t), [2, Promise.reject(t)];
                                            if (c = d.upsellUtil.constants.UPSELL_TARGET_ITEM_URL_REGEX.exec(window.location.pathname), d.upsellUtil.constants.UPSELL_TARGET_ITEM_URL_REGEX.lastIndex = 0, !Array.isArray(c)) return [3, 5];
                                            Q.label = 1;
                                        case 1:
                                            return Q.trys.push([1, 4, , 5]), [4, (en = function() {
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
                                                    return l.next = c(0), l.throw = c(1), l.return = c(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                                                        return this
                                                    }), l;

                                                    function c(c) {
                                                        return function(s) {
                                                            var u = [c, s];
                                                            if (r) throw TypeError("Generator is already executing.");
                                                            for (; l && (l = 0, u[0] && (i = 0)), i;) try {
                                                                if (r = 1, o && (a = 2 & u[0] ? o.return : u[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, u[1])).done) return a;
                                                                switch (o = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                                                    case 0:
                                                                    case 1:
                                                                        a = u;
                                                                        break;
                                                                    case 4:
                                                                        return i.label++, {
                                                                            value: u[1],
                                                                            done: !1
                                                                        };
                                                                    case 5:
                                                                        i.label++, o = u[1], u = [0];
                                                                        continue;
                                                                    case 7:
                                                                        u = i.ops.pop(), i.trys.pop();
                                                                        continue;
                                                                    default:
                                                                        if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                                            i = 0;
                                                                            continue
                                                                        }
                                                                        if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                                                            i.label = u[1];
                                                                            break
                                                                        }
                                                                        if (6 === u[0] && i.label < a[1]) {
                                                                            i.label = a[1], a = u;
                                                                            break
                                                                        }
                                                                        if (a && i.label < a[2]) {
                                                                            i.label = a[2], i.ops.push(u);
                                                                            break
                                                                        }
                                                                        a[2] && i.ops.pop(), i.trys.pop();
                                                                        continue
                                                                }
                                                                u = n.call(t, i)
                                                            } catch (t) {
                                                                u = [6, t], o = 0
                                                            } finally {
                                                                r = a = 0
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
                                                            return t.trys.push([0, 2, , 3]), [4, u.Guac.callBehaviour("vng-buy-robux")];
                                                        case 1:
                                                            return [2, Promise.resolve(t.sent().shouldShowVng)];
                                                        case 2:
                                                            return [2, Promise.reject(t.sent())];
                                                        case 3:
                                                            return [2]
                                                    }
                                                })
                                            }, function() {
                                                var t = this,
                                                    n = arguments;
                                                return new Promise(function(r, o) {
                                                    var a = en.apply(t, n);

                                                    function i(t) {
                                                        aO(a, r, o, i, l, "next", t)
                                                    }

                                                    function l(t) {
                                                        aO(a, r, o, i, l, "throw", t)
                                                    }
                                                    i(void 0)
                                                })
                                            })()];
                                        case 2:
                                            if (Q.sent()) return d.paymentFlowAnalyticsService.startRobuxUpsellFlow(null != (N = null == (s = n.buyButtonElementDataset) ? void 0 : s.assetType) ? N : "", !!(null == (m = n.buyButtonElementDataset) ? void 0 : m.userassetId), null != (T = null == (b = n.buyButtonElementDataset) ? void 0 : b.isPrivateServer) && T, null != (_ = null == (g = n.buyButtonElementDataset) ? void 0 : g.isPlace) && _, null == (w = n.buyButtonElementDataset) ? void 0 : w.productId), l.thumbnailImageUrl = aS(l, n.buyButtonElementDataset), er = l, eo = this.translationResource, ea = this.intlProvider, es = ee(n.expectedItemPrice), eu = "<div class='item-card-container item-preview'>\n        <div class='item-card-thumb'>\n          <img alt='item preview' src='".concat(null != (el = er.thumbnailImageUrl) ? el : "", "' />\n        </div>\n        <div class='item-info text-name'>\n        <div class='text-overflow item-card-name'>").concat((0, J.escapeHtml)(n.assetName), "</div>\n          <div class='text-robux item-card-price'>").concat(es, "</div>\n        </div>\n      </div>"), ec(B, null == (ei = n.buyButtonElementDataset) ? void 0 : ei.assetType), d.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(d.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, d.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBUX_UPSELL, d.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN), ef = eu + (eo.get(A, {}) || "<div class='modal-message-block text-center border-top'>Sorry, you don't have enough Robux to buy this item. Would you like to purchase a Robux package?</div>"), ep = eo.get("Message.InsufficientRobuxRedirectToExternalPartner", {}) || "<div class='text-footer modal-message-block text-center'> You will be taken to our partner’s page to complete the purchase.</div>", u.Dialog.open({
                                                titleText: eo.get(P, {}) || "Insufficient Robux",
                                                bodyContent: ef,
                                                declineText: eo.get(S, {}),
                                                acceptText: eo.get(x, {}) || "Buy Robux",
                                                onAccept: function() {
                                                    var t, r;
                                                    return d.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(d.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, d.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBUX_UPSELL, d.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, d.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.BUY_ROBUX), (t = n.buyButtonElementDataset, (r = function() {
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
                                                            return l.next = c(0), l.throw = c(1), l.return = c(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                                                                return this
                                                            }), l;

                                                            function c(c) {
                                                                return function(s) {
                                                                    var u = [c, s];
                                                                    if (r) throw TypeError("Generator is already executing.");
                                                                    for (; l && (l = 0, u[0] && (i = 0)), i;) try {
                                                                        if (r = 1, o && (a = 2 & u[0] ? o.return : u[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, u[1])).done) return a;
                                                                        switch (o = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                                                            case 0:
                                                                            case 1:
                                                                                a = u;
                                                                                break;
                                                                            case 4:
                                                                                return i.label++, {
                                                                                    value: u[1],
                                                                                    done: !1
                                                                                };
                                                                            case 5:
                                                                                i.label++, o = u[1], u = [0];
                                                                                continue;
                                                                            case 7:
                                                                                u = i.ops.pop(), i.trys.pop();
                                                                                continue;
                                                                            default:
                                                                                if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                                                    i = 0;
                                                                                    continue
                                                                                }
                                                                                if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                                                                    i.label = u[1];
                                                                                    break
                                                                                }
                                                                                if (6 === u[0] && i.label < a[1]) {
                                                                                    i.label = a[1], a = u;
                                                                                    break
                                                                                }
                                                                                if (a && i.label < a[2]) {
                                                                                    i.label = a[2], i.ops.push(u);
                                                                                    break
                                                                                }
                                                                                a[2] && i.ops.pop(), i.trys.pop();
                                                                                continue
                                                                        }
                                                                        u = n.call(t, i)
                                                                    } catch (t) {
                                                                        u = [6, t], o = 0
                                                                    } finally {
                                                                        r = a = 0
                                                                    }
                                                                    if (5 & u[0]) throw u[1];
                                                                    return {
                                                                        value: u[0] ? u[1] : void 0,
                                                                        done: !0
                                                                    }
                                                                }
                                                            }
                                                        }(this, function(n) {
                                                            try {
                                                                var r, o, a, i;
                                                                return d.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(d.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, d.paymentFlowAnalyticsService.ENUM_VIEW_NAME.LEAVE_ROBLOX_WARNING, d.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN, d.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.EXTERNAL_LINK_MODAL), ec("ContinueBuyRobuxOnExternalSite", null == t ? void 0 : t.assetType), r = ea.getTranslationResource(h), o = ea.getTranslationResource(y), a = "<br /><br />", i = r.get(A, {
                                                                    lineBreak: a,
                                                                    linebreak: a
                                                                }) || "This purchase must be completed on our partner’s website. You will be returned to Roblox after the purchase is completed.<br /><br /> Proceed to partner website for payment?", u.Dialog.open({
                                                                    titleText: r.get("Heading.InsufficientRobuxLeaveRoblox", {}) || "Leaving Roblox",
                                                                    bodyContent: "<div class='modal-message-block text-center'>".concat(i, "</div>"),
                                                                    declineText: o.get(C, {}),
                                                                    acceptText: o.get("Action.ContinueToPayment", {}) || "Continue to Payment",
                                                                    onAccept: function() {
                                                                        d.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(d.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, d.paymentFlowAnalyticsService.ENUM_VIEW_NAME.LEAVE_ROBLOX_WARNING, d.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, d.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.CONTINUE_TO_VNG), ec("ConfirmLeaveRobloxModal", null == t ? void 0 : t.assetType), ae()
                                                                    },
                                                                    onDecline: function() {
                                                                        d.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(d.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, d.paymentFlowAnalyticsService.ENUM_VIEW_NAME.LEAVE_ROBLOX_WARNING, d.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, d.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.CANCEL), ec(V, null == t ? void 0 : t.assetType)
                                                                    },
                                                                    onCancel: function() {
                                                                        d.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(d.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, d.paymentFlowAnalyticsService.ENUM_VIEW_NAME.LEAVE_ROBLOX_WARNING, d.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, d.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.CANCEL), ec(V, null == t ? void 0 : t.assetType)
                                                                    },
                                                                    allowHtmlContentInBody: !0,
                                                                    allowHtmlContentInFooter: !1,
                                                                    fieldValidationRequired: !0,
                                                                    dismissable: !0,
                                                                    xToCancel: !0
                                                                }), [2, Promise.resolve()]
                                                            } catch (t) {
                                                                return [2, Promise.reject(t)]
                                                            }
                                                        })
                                                    }, function() {
                                                        var t = this,
                                                            n = arguments;
                                                        return new Promise(function(o, a) {
                                                            var i = r.apply(t, n);

                                                            function l(t) {
                                                                aA(i, o, a, l, c, "next", t)
                                                            }

                                                            function c(t) {
                                                                aA(i, o, a, l, c, "throw", t)
                                                            }
                                                            l(void 0)
                                                        })
                                                    })()).catch(function() {
                                                        var t;
                                                        ec("LeaveRobloxFailedToShown", null == (t = n.buyButtonElementDataset) ? void 0 : t.assetType), ae()
                                                    }), !1
                                                },
                                                onDecline: function() {
                                                    var t;
                                                    d.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(d.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, d.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBUX_UPSELL, d.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, d.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.CANCEL), ec(W, null == (t = n.buyButtonElementDataset) ? void 0 : t.assetType)
                                                },
                                                onCancel: function() {
                                                    var t;
                                                    d.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(d.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, d.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBUX_UPSELL, d.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, d.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.CANCEL), ec(W, null == (t = n.buyButtonElementDataset) ? void 0 : t.assetType)
                                                },
                                                allowHtmlContentInBody: !0,
                                                allowHtmlContentInFooter: !0,
                                                footerText: ep,
                                                fieldValidationRequired: !0,
                                                dismissable: !0,
                                                xToCancel: !0
                                            }), [2, Promise.resolve()];
                                            return [4, $(l, n)];
                                        case 3:
                                            if (200 === (j = Q.sent()).status) return d.paymentFlowAnalyticsService.startRobuxUpsellFlow(null != (L = null == (U = n.buyButtonElementDataset) ? void 0 : U.assetType) ? L : "", !!(null == (R = n.buyButtonElementDataset) ? void 0 : R.userassetId), null != (F = null == (M = n.buyButtonElementDataset) ? void 0 : M.isPrivateServer) && F, null != (G = null == (k = n.buyButtonElementDataset) ? void 0 : k.isPlace) && G, null == (D = n.buyButtonElementDataset) ? void 0 : D.productId), l.thumbnailImageUrl = aS(l, n.buyButtonElementDataset), ! function(t, n, r, o, a, i, l) {
                                                var c, s, p = arguments.length > 7 && void 0 !== arguments[7] && arguments[7],
                                                    m = ee(n.expectedItemPrice),
                                                    v = "<div class='item-card-container item-preview'>\n        <div class='item-card-thumb'>\n          <img alt='item preview' src='".concat(null != (s = r.thumbnailImageUrl) ? s : "", "' />\n        </div>\n        <div class='item-info text-name'>\n        <div class='text-overflow item-card-name'>").concat((0, J.escapeHtml)(n.assetName), "</div>\n          <div class='text-robux item-card-price'>").concat(m, "</div>\n        </div>\n      </div>");
                                                ec(B, null == (c = n.buyButtonElementDataset) ? void 0 : c.assetType), d.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(d.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, d.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBUX_UPSELL, d.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN),
                                                    function(t, n, r, o, a, i, l, c) {
                                                        var s = arguments.length > 8 && void 0 !== arguments[8] && arguments[8],
                                                            p = Date.now(),
                                                            m = "<a class='text-link-secondary terms-of-use-link' target='_blank' href='".concat(Z.urlService.getUrlWithLocale(f, i.getRobloxLocale()), "'>"),
                                                            v = ee(n.shortfallPrice, !1),
                                                            y = ee(a.robux_amount),
                                                            h = a.robux_amount_before_bonus ? ee(a.robux_amount_before_bonus, !1, !0) : "",
                                                            b = t + l.get("Message.InsufficientRobuxNew", {
                                                                divTagStart: "<div class='modal-message-block text-center border-top'>",
                                                                divTagEnd: "</div>",
                                                                robuxNeeded: v,
                                                                robuxPackageAmount: y,
                                                                originalRobuxPackageAmount: h,
                                                                sentenceSplit: "<br>",
                                                                lineBreak: "",
                                                                aTagStart: m,
                                                                aTagEnd: "</a>",
                                                                divTagFooterStart: "<div class='modal-message-block text-center border-top modal-legal-footer'>",
                                                                divTagFooterEnd: "</div>"
                                                            }),
                                                            g = l.get(O, {});

                                                        function w() {
                                                            return ad(d.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.BUY_ROBUX_AND_ITEM, p, o, r), ed(a, u.CurrentUser.isUnder13, function() {
                                                                return au(a, o, r.buyButtonElementDataset)
                                                            }, c, r.buyButtonElementDataset).catch(function() {
                                                                var t;
                                                                ec(H, null == (t = r.buyButtonElementDataset) ? void 0 : t.assetType), au(a, o, r.buyButtonElementDataset)
                                                            }), !1
                                                        }

                                                        function x() {
                                                            var t;
                                                            ad(d.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.CANCEL, p, o, r), ec(W, null == (t = r.buyButtonElementDataset) ? void 0 : t.assetType)
                                                        }
                                                        if (s) {
                                                            var P, A, N, C, T, _, j, U, R = (null == (P = r.buyButtonElementDataset) ? void 0 : P.assetType) === "Subscription",
                                                                M = R && r.thumbnail ? r.thumbnail : as({
                                                                    thumbnailImageUrl: null != (T = o.thumbnailImageUrl) ? T : ""
                                                                }),
                                                                k = null != (_ = null == (A = r.buyButtonElementDataset) ? void 0 : A.collectibleItemId) ? _ : null,
                                                                D = null != (j = null == (N = r.buyButtonElementDataset) ? void 0 : N.rentalOptionDays) ? j : null,
                                                                L = Number(o.userBalanceRobux),
                                                                F = a,
                                                                B = 0;
                                                            U = o5({
                                                                variant: "standard",
                                                                expectedPrice: r.expectedItemPrice,
                                                                upsellProduct: a,
                                                                assetName: r.assetName,
                                                                assetType: (null == (C = r.buyButtonElementDataset) ? void 0 : C.assetType) || "",
                                                                thumbnail: M,
                                                                currentRobuxBalance: L,
                                                                onAccept: w,
                                                                onCancel: x,
                                                                intl: i,
                                                                priceSuffix: R ? r.priceSuffix : void 0,
                                                                title: R ? l.get("Action.BuyRobuxAndSubscription", {}) : void 0,
                                                                discountInformation: r.discountInformation,
                                                                collectibleItemId: k,
                                                                rentalOptionDays: D,
                                                                isLimited: r.isLimited,
                                                                onRefetchPackage: function(t) {
                                                                    if (!Number.isFinite(L) || !(t <= L)) {
                                                                        var n = B += 1;
                                                                        null == U || U.setPackageLoading(!0), $(o, r, t).then(function(t) {
                                                                            n === B && (200 === t.status && t.data ? (F = t.data, null == U || U.updatePackage(t.data, !1)) : null == U || U.setPackageLoading(!1))
                                                                        }).catch(function() {
                                                                            n === B && (null == U || U.setPackageLoading(!1))
                                                                        })
                                                                    }
                                                                },
                                                                onAcceptOffers: function(t) {
                                                                    var n = t.purchasePrice,
                                                                        a = t.offerIds;
                                                                    ad(d.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.BUY_ROBUX_AND_ITEM, p, o, r);
                                                                    var i = a.length ? a : void 0;
                                                                    return ed(F, u.CurrentUser.isUnder13, function() {
                                                                        return au(F, o, r.buyButtonElementDataset, n, i)
                                                                    }, c, r.buyButtonElementDataset).catch(function() {
                                                                        var t;
                                                                        ec(H, null == (t = r.buyButtonElementDataset) ? void 0 : t.assetType), au(F, o, r.buyButtonElementDataset, n, i)
                                                                    }), !1
                                                                },
                                                                onDirectPurchase: function(t) {
                                                                    var n = t.purchasePrice,
                                                                        a = t.offerIds;
                                                                    ad(d.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.BUY_ROBUX_AND_ITEM, p, o, r), (function(t) {
                                                                        var n;
                                                                        return (n = function(t) {
                                                                            var n, r, o, a, i, l, c, s, u, d, f, p, m, v;
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
                                                                                return l.next = c(0), l.throw = c(1), l.return = c(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                                                                                    return this
                                                                                }), l;

                                                                                function c(c) {
                                                                                    return function(s) {
                                                                                        var u = [c, s];
                                                                                        if (r) throw TypeError("Generator is already executing.");
                                                                                        for (; l && (l = 0, u[0] && (i = 0)), i;) try {
                                                                                            if (r = 1, o && (a = 2 & u[0] ? o.return : u[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, u[1])).done) return a;
                                                                                            switch (o = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                                                                                case 0:
                                                                                                case 1:
                                                                                                    a = u;
                                                                                                    break;
                                                                                                case 4:
                                                                                                    return i.label++, {
                                                                                                        value: u[1],
                                                                                                        done: !1
                                                                                                    };
                                                                                                case 5:
                                                                                                    i.label++, o = u[1], u = [0];
                                                                                                    continue;
                                                                                                case 7:
                                                                                                    u = i.ops.pop(), i.trys.pop();
                                                                                                    continue;
                                                                                                default:
                                                                                                    if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                                                                        i = 0;
                                                                                                        continue
                                                                                                    }
                                                                                                    if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                                                                                        i.label = u[1];
                                                                                                        break
                                                                                                    }
                                                                                                    if (6 === u[0] && i.label < a[1]) {
                                                                                                        i.label = a[1], a = u;
                                                                                                        break
                                                                                                    }
                                                                                                    if (a && i.label < a[2]) {
                                                                                                        i.label = a[2], i.ops.push(u);
                                                                                                        break
                                                                                                    }
                                                                                                    a[2] && i.ops.pop(), i.trys.pop();
                                                                                                    continue
                                                                                            }
                                                                                            u = n.call(t, i)
                                                                                        } catch (t) {
                                                                                            u = [6, t], o = 0
                                                                                        } finally {
                                                                                            r = a = 0
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
                                                                                        return n = t.itemDetail, r = t.itemPurchaseAjaxData, o = t.purchasePrice, a = t.offerIds, i = t.userBalance, l = t.translationResource, m = {
                                                                                            itemContainerElemClassList: void 0,
                                                                                            assetType: null != (s = null == (c = n.buyButtonElementDataset) ? void 0 : c.assetType) ? s : "",
                                                                                            assetName: (0, J.escapeHtml)(n.assetName),
                                                                                            productId: null != (u = null == c ? void 0 : c.productId) ? u : "",
                                                                                            expectedPrice: o,
                                                                                            expectedCurrency: Number(null == c ? void 0 : c.expectedCurrency) || 1,
                                                                                            expectedPromoId: void 0,
                                                                                            expectedSellerId: Number(null == c ? void 0 : c.expectedSellerId) || 0,
                                                                                            userAssetId: (null == c ? void 0 : c.userassetId) ? Number(c.userassetId) : void 0,
                                                                                            context: "",
                                                                                            isLibrary: !1,
                                                                                            itemThumbnailUrl: null != (f = null != (d = r.thumbnailImageUrl) ? d : r.imageurl) ? f : "",
                                                                                            itemPath: window.location.pathname,
                                                                                            alertImageUrl: null != (p = r.alerturl) ? p : "",
                                                                                            userBalance: i,
                                                                                            itemPurchaseAjaxData: r,
                                                                                            itemDetail: c,
                                                                                            offerIds: a.length ? a : void 0
                                                                                        }, (v = new o6).show(), v.updateMessage(l.get(I, {})), [4, al(m, null, v, l)];
                                                                                    case 1:
                                                                                        return y.sent(), [2]
                                                                                }
                                                                            })
                                                                        }, function() {
                                                                            var t = this,
                                                                                r = arguments;
                                                                            return new Promise(function(o, a) {
                                                                                var i = n.apply(t, r);

                                                                                function l(t) {
                                                                                    ac(i, o, a, l, c, "next", t)
                                                                                }

                                                                                function c(t) {
                                                                                    ac(i, o, a, l, c, "throw", t)
                                                                                }
                                                                                l(void 0)
                                                                            })
                                                                        }).apply(this, arguments)
                                                                    })({
                                                                        itemDetail: r,
                                                                        itemPurchaseAjaxData: o,
                                                                        purchasePrice: n,
                                                                        offerIds: a,
                                                                        userBalance: L,
                                                                        translationResource: l
                                                                    }).catch(function() {})
                                                                }
                                                            });
                                                            return
                                                        }
                                                        u.Dialog.open({
                                                            titleText: g,
                                                            bodyContent: b,
                                                            footerText: "",
                                                            declineText: l.get(S, {}),
                                                            acceptText: l.get(E, {}),
                                                            acceptColor: "btn-primary-md",
                                                            onAccept: w,
                                                            onDecline: function() {
                                                                var t;
                                                                ad(d.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.CANCEL, p, o, r), ec(W, null == (t = r.buyButtonElementDataset) ? void 0 : t.assetType)
                                                            },
                                                            onCancel: x,
                                                            allowHtmlContentInBody: !0,
                                                            allowHtmlContentInFooter: !1,
                                                            fieldValidationRequired: !0,
                                                            dismissable: !0,
                                                            xToCancel: !0
                                                        })
                                                    }(v, t, n, r, o, a, i, l, p)
                                            }(t, n, l, j.data, this.intl, this.intlProvider.getTranslationResource(v), this.intlProvider, a), [2, Promise.resolve()];
                                            return 204 === j.status ? ec("UpsellFailedDueToNoAvailablePackage", null == (z = n.buyButtonElementDataset) ? void 0 : z.assetType) : ec("UpsellFailedDueToFailedPackageRequest", null == (X = n.buyButtonElementDataset) ? void 0 : X.assetType), [3, 5];
                                        case 4:
                                            return Y = Q.sent(), ec("UpsellFailed", null == (K = n.buyButtonElementDataset) ? void 0 : K.assetType), r(t), [2, Promise.reject(Y)];
                                        case 5:
                                            return r(t), [2, Promise.reject(t)]
                                    }
                                })
                            }).apply(this, arguments)
                        }
                    }, {
                        key: "showExceedLargestInsufficientRobuxModal",
                        value: function(t, n, r) {
                            var o, a, i, l, c = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : null == (o = document.getElementById(p)) ? void 0 : o.dataset,
                                s = arguments.length > 4 && void 0 !== arguments[4] && arguments[4];
                            if (ec("UpsellExceedLargestEntryPoint", null == n ? void 0 : n.assetType), !(null == c ? void 0 : c.imageurl)) {
                                ec("UpsellExceedLargestNoThumbnailImage", null == n ? void 0 : n.assetType), r();
                                return
                            }
                            try {
                                d.paymentFlowAnalyticsService.startRobuxUpsellFlow(null != (a = null == n ? void 0 : n.assetType) ? a : "", !!(null == n ? void 0 : n.userassetId), null != (i = null == n ? void 0 : n.isPrivateServer) && i, null != (l = null == n ? void 0 : n.isPlace) && l, null == n ? void 0 : n.productId),
                                    function(t, n, r, o) {
                                        var a, i = arguments.length > 4 && void 0 !== arguments[4] && arguments[4],
                                            l = arguments.length > 5 ? arguments[5] : void 0,
                                            c = ee(t),
                                            s = parseInt(r.expectedPrice, 10),
                                            f = ee(s),
                                            p = window.location.pathname;
                                        (null === u.Endpoints || void 0 === u.Endpoints ? void 0 : u.Endpoints.supportLocalizedUrls) && (p = u.Endpoints.removeUrlLocale(p));
                                        var v = n;
                                        p.startsWith(m) && (v = null != (a = ax(r)) ? a : v);
                                        var y = "<div class='item-card-container item-preview'>\n        <div class='item-card-thumb'>\n          <img alt='item preview' src='".concat(v, "' />\n        </div>\n        <div class='item-info text-name'>\n        <div class='text-overflow item-card-name'>").concat((0, J.escapeHtml)(r.itemName), "</div>\n          <div class='text-robux item-card-price'>").concat(f, "</div>\n        </div>\n      </div>") + o.get("Message.InsufficientRobuxExceedLargestPackage", {
                                            divTagStart: "<div class='modal-message-block text-center border-top'>",
                                            divTagEnd: "</div>",
                                            robuxNeeded: c
                                        });

                                        function h() {
                                            var t, n, o, a;
                                            return d.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(d.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, d.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBUX_UPSELL_EXCEED_LARGEST_PACKAGE, d.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, d.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.GO_TO_ROBUX_STORE), ec("UpsellExceedLargestGoToRobuxStoreClicked", null == r ? void 0 : r.assetType), ! function(t, n) {
                                                if (t && n) {
                                                    window.location.href = Z.urlService.getUrlWithQueries("/Upgrades/Robux.aspx", {
                                                        ctx: ""
                                                    });
                                                    return
                                                }
                                                window.location.href = u.Endpoints.getAbsoluteUrl("/upgrades/robux?ctx=upsell")
                                            }(null != (o = null == (t = aP.deviceMeta.getDeviceMeta()) ? void 0 : t.isTablet) && o, null != (a = null == (n = aP.deviceMeta.getDeviceMeta()) ? void 0 : n.isUniversalApp) && a), !1
                                        }

                                        function b() {
                                            d.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(d.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, d.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBUX_UPSELL_EXCEED_LARGEST_PACKAGE, d.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, d.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.CANCEL), ec(W, null == r ? void 0 : r.assetType)
                                        }
                                        if (d.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(d.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, d.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBUX_UPSELL_EXCEED_LARGEST_PACKAGE, d.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN), ec("UpsellExceedLargestShown", r.assetType), i) {
                                            var g = !0 === r.isPrivateServer && l ? l : as({
                                                thumbnailImageUrl: null != v ? v : ""
                                            });
                                            o5({
                                                variant: "tooExpensive",
                                                expectedPrice: s,
                                                assetName: r.itemName,
                                                thumbnail: g,
                                                onAccept: h,
                                                onCancel: b
                                            });
                                            return
                                        }
                                        u.Dialog.open({
                                            titleText: o.get(P, {}),
                                            bodyContent: y,
                                            declineText: o.get(S, {}),
                                            acceptText: o.get("Action.GoToRobuxStore", {}),
                                            acceptColor: "btn-primary-md",
                                            onAccept: h,
                                            onDecline: function() {
                                                d.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(d.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, d.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBUX_UPSELL_EXCEED_LARGEST_PACKAGE, d.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, d.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.CANCEL), ec("UpsellExceedLargestCancelled", null == r ? void 0 : r.assetType)
                                            },
                                            onCancel: b,
                                            allowHtmlContentInBody: !0,
                                            allowHtmlContentInFooter: !1,
                                            fieldValidationRequired: !0,
                                            dismissable: !0,
                                            xToCancel: !0
                                        })
                                    }(t, c.imageurl, n, this.intlProvider.getTranslationResource(v), s), ec("UpsellExceedLargestModalExpTrue", null == n ? void 0 : n.assetType)
                            } catch (t) {
                                ec("UpsellExceedLargestModalExpError", null == n ? void 0 : n.assetType), r()
                            }
                        }
                    }, {
                        key: "initiateAutoPurchase",
                        value: function(t, n) {
                            return aN(function(t, n) {
                                var r, o, a, i, l, c, s, f, v = arguments;
                                return aT(this, function(y) {
                                    switch (y.label) {
                                        case 0:
                                            r = v.length > 2 && void 0 !== v[2] ? v[2] : document.getElementById(p), o = v.length > 3 && void 0 !== v[3] ? v[3] : document.getElementById("item-container"), this._state = {
                                                purchased: !1,
                                                retryRemainTimes: 5,
                                                timeoutHandle: null
                                            }, this.loadingOverlay.show(), ec("AutoPurchaseEntryPoint", F), y.label = 1;
                                        case 1:
                                            var h, E, x;
                                            return y.trys.push([1, 3, , 4]), (!t || !(t.startsWith("/catalog/") || t.startsWith("/bundles/") || t.startsWith("/game-pass/") || t.startsWith(m)) || t.includes("UpsellUuid=")) && (d.upsellUtil.expireUpsellCookie(), window.location.href = u.Endpoints.getAbsoluteUrl("/catalog")), [4, (h = o, E = null == o ? void 0 : o.dataset, x = null == r ? void 0 : r.dataset, ab(function() {
                                                var n, r, o, a, i, l, c, s, f, p, m, v;
                                                return aw(this, function(y) {
                                                    switch (y.label) {
                                                        case 0:
                                                            return [4, ab(function() {
                                                                var n, r, o, a, i, l, c, s, u;
                                                                return aw(this, function(f) {
                                                                    var p, m, v;
                                                                    switch (f.label) {
                                                                        case 0:
                                                                            if ((n = d.upsellUtil.parseUpsellCookie()) && 0 !== Object.keys(n).length && (!n.targetItemUrl || t.startsWith(n.targetItemUrl)) || (ec("AutoPurchasePotentialHackingActionSpotted2", F), av(R, {
                                                                                    itemPath: t,
                                                                                    upsellCookieData: n
                                                                                }), eo(), o7(t)), (r = x) || (eo(), o7(t)), n.subscriptionTargetKey) return a = {
                                                                                expectedPrice: n.expectedPrice || "0",
                                                                                expectedCurrency: n.expectedCurrency || "1",
                                                                                expectedSellerId: n.expectedSellerId || "",
                                                                                assetType: "Subscription",
                                                                                productId: n.productId || "0",
                                                                                itemName: String(n.itemName || (null == E ? void 0 : E.itemName) || ""),
                                                                                subscriptionTargetKey: String(null != (o = n.subscriptionTargetKey) ? o : "")
                                                                            }, [2, [r, a]];
                                                                            f.label = 1;
                                                                        case 1:
                                                                            return f.trys.push([1, 3, , 4]), [4, (l = n.collectibleItemId ? null == E ? void 0 : E.productId : n.productId, ab(function() {
                                                                                var n, r;
                                                                                return aw(this, function(o) {
                                                                                    switch (o.label) {
                                                                                        case 0:
                                                                                            if (!l) return [2, Promise.reject()];
                                                                                            o.label = 1;
                                                                                        case 1:
                                                                                            var a;
                                                                                            return o.trys.push([1, 3, , 4]), [4, (a = function() {
                                                                                                var t, n, r, o;
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
                                                                                                    return l.next = c(0), l.throw = c(1), l.return = c(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                                                                                                        return this
                                                                                                    }), l;

                                                                                                    function c(c) {
                                                                                                        return function(s) {
                                                                                                            var u = [c, s];
                                                                                                            if (r) throw TypeError("Generator is already executing.");
                                                                                                            for (; l && (l = 0, u[0] && (i = 0)), i;) try {
                                                                                                                if (r = 1, o && (a = 2 & u[0] ? o.return : u[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, u[1])).done) return a;
                                                                                                                switch (o = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                                                                                                    case 0:
                                                                                                                    case 1:
                                                                                                                        a = u;
                                                                                                                        break;
                                                                                                                    case 4:
                                                                                                                        return i.label++, {
                                                                                                                            value: u[1],
                                                                                                                            done: !1
                                                                                                                        };
                                                                                                                    case 5:
                                                                                                                        i.label++, o = u[1], u = [0];
                                                                                                                        continue;
                                                                                                                    case 7:
                                                                                                                        u = i.ops.pop(), i.trys.pop();
                                                                                                                        continue;
                                                                                                                    default:
                                                                                                                        if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                                                                                            i = 0;
                                                                                                                            continue
                                                                                                                        }
                                                                                                                        if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                                                                                                            i.label = u[1];
                                                                                                                            break
                                                                                                                        }
                                                                                                                        if (6 === u[0] && i.label < a[1]) {
                                                                                                                            i.label = a[1], a = u;
                                                                                                                            break
                                                                                                                        }
                                                                                                                        if (a && i.label < a[2]) {
                                                                                                                            i.label = a[2], i.ops.push(u);
                                                                                                                            break
                                                                                                                        }
                                                                                                                        a[2] && i.ops.pop(), i.trys.pop();
                                                                                                                        continue
                                                                                                                }
                                                                                                                u = n.call(t, i)
                                                                                                            } catch (t) {
                                                                                                                u = [6, t], o = 0
                                                                                                            } finally {
                                                                                                                r = a = 0
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
                                                                                                            t = "/v1/products/{productId}".replace("{productId}", l), n = {
                                                                                                                url: "".concat(K.EnvironmentUrls.economyApi).concat(t),
                                                                                                                withCredentials: !0
                                                                                                            }, a.label = 1;
                                                                                                        case 1:
                                                                                                            return a.trys.push([1, 3, , 4]), [4, Y.get(n)];
                                                                                                        case 2:
                                                                                                            if (200 !== (r = a.sent()).status || "Success" !== r.data.reason) return [2, Promise.reject(null == r || null == (o = r.data) ? void 0 : o.reason)];
                                                                                                            return [2, Promise.resolve(r.data)];
                                                                                                        case 3:
                                                                                                            return [2, Promise.reject(a.sent())];
                                                                                                        case 4:
                                                                                                            return [2]
                                                                                                    }
                                                                                                })
                                                                                            }, function() {
                                                                                                var t = this,
                                                                                                    n = arguments;
                                                                                                return new Promise(function(r, o) {
                                                                                                    var i = a.apply(t, n);

                                                                                                    function l(t) {
                                                                                                        af(i, r, o, l, c, "next", t)
                                                                                                    }

                                                                                                    function c(t) {
                                                                                                        af(i, r, o, l, c, "throw", t)
                                                                                                    }
                                                                                                    l(void 0)
                                                                                                })
                                                                                            })()];
                                                                                        case 2:
                                                                                            if (!(n = o.sent()) || 0 === Object.keys(n).length) return ec("AutoPurchasePotentialHackingActionSpotted3", F), av(k, {
                                                                                                itemPath: t,
                                                                                                productId: l
                                                                                            }), [2, Promise.reject()];
                                                                                            return [2, n];
                                                                                        case 3:
                                                                                            return r = o.sent(), ec("AutoPurchasePotentialHackingActionSpotted4", F), av(M, {
                                                                                                itemPath: t,
                                                                                                productId: l,
                                                                                                error: r
                                                                                            }), [2, Promise.reject(r)];
                                                                                        case 4:
                                                                                            return [2]
                                                                                    }
                                                                                })
                                                                            })())];
                                                                        case 2:
                                                                            return i = f.sent(), [3, 4];
                                                                        case 3:
                                                                            return c = f.sent(), av(D, {
                                                                                itemPath: t,
                                                                                upsellCookieData: n,
                                                                                error: c
                                                                            }), eo(), o7(t), [2, Promise.reject()];
                                                                        case 4:
                                                                            return [4, (p = i.assetId, m = i.assetType, (v = function() {
                                                                                var t, n, r, o, a;
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
                                                                                    return l.next = c(0), l.throw = c(1), l.return = c(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                                                                                        return this
                                                                                    }), l;

                                                                                    function c(c) {
                                                                                        return function(s) {
                                                                                            var u = [c, s];
                                                                                            if (r) throw TypeError("Generator is already executing.");
                                                                                            for (; l && (l = 0, u[0] && (i = 0)), i;) try {
                                                                                                if (r = 1, o && (a = 2 & u[0] ? o.return : u[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, u[1])).done) return a;
                                                                                                switch (o = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                                                                                                    case 0:
                                                                                                    case 1:
                                                                                                        a = u;
                                                                                                        break;
                                                                                                    case 4:
                                                                                                        return i.label++, {
                                                                                                            value: u[1],
                                                                                                            done: !1
                                                                                                        };
                                                                                                    case 5:
                                                                                                        i.label++, o = u[1], u = [0];
                                                                                                        continue;
                                                                                                    case 7:
                                                                                                        u = i.ops.pop(), i.trys.pop();
                                                                                                        continue;
                                                                                                    default:
                                                                                                        if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                                                                            i = 0;
                                                                                                            continue
                                                                                                        }
                                                                                                        if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                                                                                            i.label = u[1];
                                                                                                            break
                                                                                                        }
                                                                                                        if (6 === u[0] && i.label < a[1]) {
                                                                                                            i.label = a[1], a = u;
                                                                                                            break
                                                                                                        }
                                                                                                        if (a && i.label < a[2]) {
                                                                                                            i.label = a[2], i.ops.push(u);
                                                                                                            break
                                                                                                        }
                                                                                                        a[2] && i.ops.pop(), i.trys.pop();
                                                                                                        continue
                                                                                                }
                                                                                                u = n.call(t, i)
                                                                                            } catch (t) {
                                                                                                u = [6, t], o = 0
                                                                                            } finally {
                                                                                                r = a = 0
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
                                                                                            m === b ? (n = "/v1/game-passes", t = {
                                                                                                gamePassIds: p
                                                                                            }) : m === g ? (n = "/v1/bundles/thumbnails", t = {
                                                                                                bundleIds: p
                                                                                            }) : (n = "/v1/assets", t = {
                                                                                                assetIds: p
                                                                                            }), t = function(t) {
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
                                                                                            }({}, t, w), r = {
                                                                                                url: "".concat(K.EnvironmentUrls.thumbnailsApi).concat(n),
                                                                                                withCredentials: !0
                                                                                            }, i.label = 1;
                                                                                        case 1:
                                                                                            return i.trys.push([1, 3, , 4]), [4, Y.get(r, t)];
                                                                                        case 2:
                                                                                            var l;
                                                                                            if (l = (o = i.sent()).data.data, a = (function(t) {
                                                                                                    if (Array.isArray(t)) return t
                                                                                                }(l) || function(t, n) {
                                                                                                    var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                                                                                                    if (null != a) {
                                                                                                        var i = [],
                                                                                                            l = !0,
                                                                                                            c = !1;
                                                                                                        try {
                                                                                                            for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), i.length !== n); l = !0);
                                                                                                        } catch (t) {
                                                                                                            c = !0, o = t
                                                                                                        } finally {
                                                                                                            try {
                                                                                                                l || null == a.return || a.return()
                                                                                                            } finally {
                                                                                                                if (c) throw o
                                                                                                            }
                                                                                                        }
                                                                                                        return i
                                                                                                    }
                                                                                                }(l, 1) || function(t, n) {
                                                                                                    if (t) {
                                                                                                        if ("string" == typeof t) return ap(t, 1);
                                                                                                        var r = Object.prototype.toString.call(t).slice(8, -1);
                                                                                                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                                                                                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ap(t, n)
                                                                                                    }
                                                                                                }(l, 1) || function() {
                                                                                                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                                                                                }())[0], 200 !== o.status || !a) return [2, Promise.resolve(null)];
                                                                                            return [2, Promise.resolve(a.imageUrl)];
                                                                                        case 3:
                                                                                            return i.sent(), [2, Promise.resolve(null)];
                                                                                        case 4:
                                                                                            return [2]
                                                                                    }
                                                                                })
                                                                            }, function() {
                                                                                var t = this,
                                                                                    n = arguments;
                                                                                return new Promise(function(r, o) {
                                                                                    var a = v.apply(t, n);

                                                                                    function i(t) {
                                                                                        am(a, r, o, i, l, "next", t)
                                                                                    }

                                                                                    function l(t) {
                                                                                        am(a, r, o, i, l, "throw", t)
                                                                                    }
                                                                                    i(void 0)
                                                                                })
                                                                            })())];
                                                                        case 5:
                                                                            return s = f.sent(), r.imageurl = s || r.imageurl, u = {
                                                                                expectedPrice: n.expectedPrice || "0",
                                                                                expectedCurrency: n.expectedCurrency || "1",
                                                                                expectedSellerId: n.expectedSellerId || "",
                                                                                itemId: i.assetId || (null == E ? void 0 : E.itemId),
                                                                                itemName: i.assetName || (null == E ? void 0 : E.itemName),
                                                                                assetType: i.assetType || (null == E ? void 0 : E.assetType),
                                                                                assetGranted: null == E ? void 0 : E.assetGranted,
                                                                                assetTypeDisplayName: i.assetTypeDisplayName || (null == E ? void 0 : E.assetTypeDisplayName),
                                                                                assetTypeId: null == E ? void 0 : E.assetTypeId,
                                                                                productId: i.productId || n.productId || (null == E ? void 0 : E.productId),
                                                                                itemType: i.assetType || (null == E ? void 0 : E.itemType),
                                                                                currentTime: null == E ? void 0 : E.currentTime,
                                                                                isPurchaseEnabled: null == E ? void 0 : E.isPurchaseEnabled,
                                                                                placeproductpromotionId: null == E ? void 0 : E.placeproductpromotionId,
                                                                                userassetId: n.userAssetId || (null == E ? void 0 : E.userassetId),
                                                                                collectibleItemId: n.collectibleItemId || (null == E ? void 0 : E.collectibleItemId),
                                                                                collectibleItemInstanceId: n.collectibleItemInstanceId || (null == E ? void 0 : E.collectibleItemInstanceId),
                                                                                collectibleProductId: n.collectibleProductId || (null == E ? void 0 : E.collectibleProductId)
                                                                            }, [2, [r, u]]
                                                                    }
                                                                })
                                                            })()];
                                                        case 1:
                                                            r = (n = ag.apply(void 0, [y.sent(), 2]))[0], a = (o = n[1]).placeproductpromotionId, i = "LibraryItem" === ((null === u.MetaDataValues || void 0 === u.MetaDataValues ? void 0 : u.MetaDataValues.getPageName()) || ""), l = parseInt(r.userBalanceRobux, 10), c = parseInt(o.expectedCurrency, 10), s = parseInt(o.expectedPrice, 10), f = parseInt(o.expectedSellerId, 10), p = {
                                                                itemContainerElemClassList: null == h ? void 0 : h.classList,
                                                                assetType: o.assetType,
                                                                assetName: (0, J.escapeHtml)(o.itemName),
                                                                expectedSellerId: f,
                                                                expectedCurrency: c,
                                                                expectedPrice: s,
                                                                productId: o.productId,
                                                                isLibrary: i,
                                                                itemThumbnailUrl: r.imageurl,
                                                                itemPath: t,
                                                                alertImageUrl: r.alerturl,
                                                                userBalance: l,
                                                                itemPurchaseAjaxData: r,
                                                                itemDetail: o
                                                            }, a && (p.expectedPromoId = parseInt(a, 10)), o.userassetId && (p.userAssetId = parseInt(o.userassetId, 10)), (v = function(t) {
                                                                if (!t) return [];
                                                                try {
                                                                    var n = window.sessionStorage.getItem(et(t));
                                                                    if (!n) return [];
                                                                    var r = JSON.parse(n);
                                                                    if (Array.isArray(r)) return r.filter(function(t) {
                                                                        return "string" == typeof t
                                                                    });
                                                                    return []
                                                                } catch (t) {
                                                                    return []
                                                                }
                                                            }(m = d.upsellUtil.parseUpsellCookie().upsellUuid)).length && (p.offerIds = v);
                                                            if (m) try {
                                                                window.sessionStorage.removeItem(et(m))
                                                            } catch (t) {}
                                                            return [2, p]
                                                    }
                                                })
                                            })())];
                                        case 2:
                                            return a = y.sent(), [3, 4];
                                        case 3:
                                            return y.sent(), this.loadingOverlay.hide(), eo(), [2, Promise.resolve()];
                                        case 4:
                                            i = this.translationResource.get(I, {}), l = a.userBalance, c = a.expectedPrice, y.label = 5;
                                        case 5:
                                            if (y.trys.push([5, 9, , 10]), t.startsWith(m) && (null == (s = document.getElementById("tab-store")) || s.click()), !(l > c)) return [3, 7];
                                            return this.loadingOverlay.updateMessage(i), [4, al(a, n, this.loadingOverlay, this.translationResource)];
                                        case 6:
                                            return y.sent(), this._state.purchased = !0, [2, Promise.resolve()];
                                        case 7:
                                            return [4, this._checkBalanceAndPurchase(a, n)];
                                        case 8:
                                            return y.sent(), [3, 10];
                                        case 9:
                                            return f = y.sent(), this.loadingOverlay.hide(), ec(X, null == a ? void 0 : a.assetType), av(L, {
                                                itemPurchaseObj: a,
                                                error: f
                                            }), eo(), [3, 10];
                                        case 10:
                                            return [2, Promise.resolve()]
                                    }
                                })
                            }).apply(this, arguments)
                        }
                    }],
                    function(t, n) {
                        for (var r = 0; r < n.length; r++) {
                            var o = n[r];
                            o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(t, o.key, o)
                        }
                    }(n.prototype, t), n
            }();
            r(375), void 0 === window.Roblox && (window.Roblox = {}), void 0 === window.Roblox.ItemPurchaseUpsellService && (window.Roblox.ItemPurchaseUpsellService = new a_)
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("ItemPurchaseUpsell");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/itemPurchaseUpsell-5bd2afb41881a9f8.js.map
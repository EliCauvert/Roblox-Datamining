! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "a8b056429d5c012870feb635b708866ede60c1c2"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "a4d7ebbc-16d1-4446-b14c-f1f56f77d675", e._sentryDebugIdIdentifier = "sentry-dbid-a4d7ebbc-16d1-4446-b14c-f1f56f77d675")
    } catch (e) {}
}(),
function() {
    "use strict";
    var e, t, r, n, o, a, i, l, c, u, s, f, d, p, h, y, m, b, v, g = {},
        O = {};

    function E(e) {
        var t = O[e];
        if (void 0 !== t) return t.exports;
        var r = O[e] = {
            exports: {}
        };
        return g[e](r, r.exports, E), r.exports
    }
    E.m = g, E.n = function(e) {
        var t = e && e.__esModule ? function() {
            return e.default
        } : function() {
            return e
        };
        return E.d(t, {
            a: t
        }), t
    }, E.d = function(e, t) {
        for (var r in t) E.o(t, r) && !E.o(e, r) && Object.defineProperty(e, r, {
            enumerable: !0,
            get: t[r]
        })
    }, E.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, E.r = function(e) {
        "u" > typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, E.nc = void 0, E.rv = function() {
        return "1.7.12"
    }, E.ruid = "bundler=rspack@1.7.12";
    var w = window.Roblox,
        P = window.Roblox["core-scripts"].util.upsell,
        S = window.Roblox["core-scripts"].paymentsFlow,
        x = E.n(S),
        j = "/info/terms",
        I = "ItemPurchaseAjaxData",
        A = "/games/",
        T = "Purchasing.PurchaseDialog",
        _ = "CommonUI.Controls",
        N = "Feature.Premium",
        C = "Game Pass",
        R = "Bundle",
        M = {
            size: "150x150",
            format: "Png",
            isCircular: !1
        },
        U = "Action.BuyRobuxAndItem",
        k = "Action.BuyRobux",
        D = "Action.Cancel",
        B = "Heading.InsufficientRobux",
        L = "Heading.InsufficientRobuxNew",
        H = "Message.InsufficientRobuxAskToPurchasePackage",
        G = "Label.PurchasingTheItem",
        F = "Action.Ok",
        V = "Action.Cancel",
        W = "U13PaymentModal",
        X = "ParentalConsentWarningPaymentModal13To17",
        K = "U13MonthlyThreshold1Modal",
        z = "U13MonthlyThreshold2Modal",
        Y = "COOKIE_PARSE_FAILED",
        Z = "PRODUCT_INFO_REQUEST_FAILED",
        q = "PRODUCT_INFO_EMPTY",
        $ = "PRODUCT_ID_NOT_EXIST",
        J = "UPSELL_FAILED",
        Q = "NoTypeParsedYet",
        ee = "UpsellShown",
        et = "UpsellCancelled",
        er = "UpsellCancelledFromU13Modal",
        en = "CancelledFromLeaveRobloxModal",
        eo = "AutoPurchaseSucceed",
        ea = "AutoPurchaseFailed",
        ei = "U13PaymentModalFailedToShow",
        el = window.Roblox["core-scripts"].http.http,
        ec = window.Roblox["core-scripts"].environmentUrls,
        eu = E.n(ec);

    function es(e, t, r, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, o)
    }

    function ef(e, t, r) {
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
                            url: "".concat(ec.EnvironmentUrls.apiGatewayUrl).concat("/payments-gateway/v1/products/get-upsell-product"),
                            withCredentials: !0
                        }, a.label = 1;
                    case 1:
                        return a.trys.push([1, 3, , 4]), [4, el.post(o, n)];
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
                    es(a, r, o, i, l, "next", e)
                }

                function l(e) {
                    es(a, r, o, i, l, "throw", e)
                }
                i(void 0)
            })
        })()
    }
    var ed = window.Roblox["core-scripts"].format.string,
        ep = window.Roblox["core-scripts"].endpoints,
        eh = window.Roblox["core-scripts"].util.url,
        ey = function(e) {
            if (!e.trim()) return null;
            try {
                return BigInt(e)
            } catch (e) {
                return null
            }
        },
        em = function(e) {
            return e > 0 && e <= Number.MAX_SAFE_INTEGER ? e.toString() : null
        },
        eb = function(e) {
            var t = ey(e);
            return null == t ? null : em(t)
        },
        ev = "blackbird",
        eg = function(e) {
            var t, r, n, o, a = null != (t = e.userid) ? t : e.user,
                i = null == a ? void 0 : null != (r = eb(a)) ? r : void 0;
            if ("string" == typeof i) return {
                isAuthenticated: !0,
                id: i,
                userName: null != (n = e.name) ? n : e.userName,
                displayName: null != (o = e.displayname) ? o : e.userDisplayName,
                isPremiumUser: "true" === e.ispremiumuser || "true" === e.userIsPremium,
                membership: e.membership === ev || e.userMembership === ev ? ev : void 0,
                isVerified: "true" === e.hasverifiedbadge || "true" === e.userHasVerifiedBadge,
                isUnder13: "true" === e.isunder13 || "AgeUnder13" === e.userAgeBracket
            }
        },
        eO = function() {
            if ("u" > typeof document) {
                var e, t;
                return eg(null != (e = null == (t = document.querySelector('meta[name="user-data"]')) ? void 0 : t.dataset) ? e : document.documentElement.dataset)
            }
        },
        eE = window.Roblox["core-scripts"].format.number;

    function ew(e) {
        var t = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1],
            r = arguments.length > 2 && void 0 !== arguments[2] && arguments[2],
            n = arguments.length > 3 && void 0 !== arguments[3] && arguments[3],
            o = (0, eE.formatNumber)(e),
            a = r ? "<s>".concat(o, "</s>") : o;
        return n ? "<span class='icon-robux-16x16 light-theme'></span><span class='text'>".concat(a, "</span>") : t ? "<span class='icon-robux-16x16'></span><span class='text-robux'>".concat(a, "</span>") : "<span class='icon-robux-gray-16x16'></span><span class='text'>".concat(a, "</span>")
    }
    var eP = "function" == typeof crypto.randomUUID,
        eS = function() {
            var e = new Uint8Array(16);
            crypto.getRandomValues(e);
            var t = Array.from(e, function(e, t) {
                return (6 === t ? 15 & e | 64 : 8 === t ? 63 & e | 128 : e).toString(16).padStart(2, "0")
            });
            return "".concat(t.slice(0, 4).join(""), "-").concat(t.slice(4, 6).join(""), "-").concat(t.slice(6, 8).join(""), "-") + "".concat(t.slice(8, 10).join(""), "-").concat(t.slice(10, 16).join(""))
        },
        ex = function() {
            return eP ? crypto.randomUUID() : eS()
        };

    function ej(e) {
        return "".concat("RBXUpsellOfferIds:").concat(e)
    }

    function eI(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function eA(e, t, r, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, o)
    }

    function eT() {
        if (P.expireUpsellCookie(), window.history) {
            var e = new URL(window.location.href);
            e.searchParams.delete(P.constants.UPSELL_QUERY_PARAM_KEY);
            var t = e.href;
            window.history.pushState({
                path: t
            }, "", t)
        }
    }

    function e_(e, t, r, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, o)
    }
    var eN = window.React,
        eC = E.n(eN),
        eR = window.ReactDOM,
        eM = E.n(eR),
        eU = globalThis.document,
        ek = void 0 === eU ? void 0 : eU,
        eD = window.ReactJSX,
        eB = function() {
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
        eL = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
        eH = function(e) {
            var t = e.className;
            return eC().createElement("div", {
                "aria-hidden": !0,
                "data-testid": "foundation-web-state-layer",
                className: eB("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
            })
        };

    function eG(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function eF(e) {
        if (Array.isArray(e)) return e
    }

    function eV() {
        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
    }

    function eW(e, t) {
        if (e) {
            if ("string" == typeof e) return eG(e, t);
            var r = Object.prototype.toString.call(e).slice(8, -1);
            if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eG(e, t)
        }
    }
    var eX = {
            XSmall: "size-[var(--icon-size-xsmall)]",
            Small: "size-[var(--icon-size-small)]",
            Medium: "size-[var(--icon-size-medium)]",
            Large: "size-[var(--icon-size-large)]",
            XLarge: "size-[var(--icon-size-xlarge)]",
            XXLarge: "size-[var(--icon-size-xxlarge)]"
        },
        eK = eC().forwardRef(function(e, t) {
            var r, n = eF(r = [e, t]) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(r) || eW(r) || eV(),
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
                s = (eF(a) || function(e) {
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
                }(a) || eW(a, 1) || eV())[0];
            return eC().createElement("span", function(e) {
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
                className: eB("grow-0 shrink-0 basis-auto icon", i, eX[void 0 === l ? "Medium" : l], c)
            }, u))
        });
    eK.displayName = "Icon";
    var ez = {
            Small: "padding-xsmall",
            Medium: "padding-small",
            Large: "padding-small"
        },
        eY = {
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-100"
        },
        eZ = function(e) {
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
            return eC().createElement("button", function(e) {
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
                className: eB("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", eL, eY[t], ez[r], n && "radius-circle", o)
            }, a), eC().createElement(eH, null), eC().createElement(eK, {
                name: "icon-regular-x",
                size: r
            }))
        };

    function eq(e, t) {
        var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
            n = r.checkForDefaultPrevented,
            o = void 0 === n || n;
        return function(r) {
            if (null == e || e(r), !1 === o || !r.defaultPrevented) return null == t ? void 0 : t(r)
        }
    }

    function e$(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function eJ(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }

    function eQ() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        return function(e) {
            var r = !1,
                n = t.map(function(t) {
                    var n = eJ(t, e);
                    return r || "function" != typeof n || (r = !0), n
                });
            if (r) return function() {
                for (var e = 0; e < n.length; e++) {
                    var r = n[e];
                    "function" == typeof r ? r() : eJ(t[e], null)
                }
            }
        }
    }

    function e0() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        return eN.useCallback(eQ.apply(void 0, function(e) {
            if (Array.isArray(e)) return e$(e)
        }(t) || function(e) {
            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
        }(t) || function(e) {
            if (e) {
                if ("string" == typeof e) return e$(e, void 0);
                var t = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return e$(e, void 0)
            }
        }(t) || function() {
            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()), t)
    }

    function e1(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function e2(e, t, r) {
        return t in e ? Object.defineProperty(e, t, {
            value: r,
            enumerable: !0,
            configurable: !0,
            writable: !0
        }) : e[t] = r, e
    }

    function e3(e) {
        for (var t = 1; t < arguments.length; t++) {
            var r = null != arguments[t] ? arguments[t] : {},
                n = Object.keys(r);
            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                return Object.getOwnPropertyDescriptor(r, e).enumerable
            }))), n.forEach(function(t) {
                e2(e, t, r[t])
            })
        }
        return e
    }

    function e6(e, t) {
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

    function e5(e) {
        return function(e) {
            if (Array.isArray(e)) return e1(e)
        }(e) || function(e) {
            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
        }(e) || function(e) {
            if (e) {
                if ("string" == typeof e) return e1(e, void 0);
                var t = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return e1(e, void 0)
            }
        }(e) || function() {
            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }

    function e4(e) {
        var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
            r = [],
            n = function() {
                var t = r.map(function(e) {
                    return eN.createContext(e)
                });
                return function(r) {
                    var n = (null == r ? void 0 : r[e]) || t;
                    return eN.useMemo(function() {
                        var t, o;
                        return e2({}, "__scope".concat(e), (t = e3({}, r), o = null != (o = e2({}, e, n)) ? o : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(o)) : (function(e) {
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
            var o = eN.createContext(n),
                a = r.length;
            r = e5(r).concat([n]);
            var i = function(t) {
                var r, n = t.scope,
                    i = t.children,
                    l = e6(t, ["scope", "children"]),
                    c = (null == n || null == (r = n[e]) ? void 0 : r[a]) || o,
                    u = eN.useMemo(function() {
                        return l
                    }, Object.values(l));
                return (0, eD.jsx)(c.Provider, {
                    value: u,
                    children: i
                })
            };
            return i.displayName = t + "Provider", [i, function(r, i) {
                var l, c = (null == i || null == (l = i[e]) ? void 0 : l[a]) || o,
                    u = eN.useContext(c);
                if (u) return u;
                if (void 0 !== n) return n;
                throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
            }]
        }, e8.apply(void 0, [n].concat(e5(t)))]
    }

    function e8() {
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
                    return e3({}, e, n(t)["__scope".concat(o)])
                }, {});
                return eN.useMemo(function() {
                    return e2({}, "__scope".concat(n.scopeName), r)
                }, [r])
            }
        };
        return o.scopeName = n.scopeName, o
    }
    var e7 = (null == (h = globalThis) ? void 0 : h.document) ? eN.useLayoutEffect : function() {};

    function e9(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }
    var te = eN[" useId ".trim().toString()] || function() {},
        tt = 0;

    function tr(e) {
        var t, r = function(e) {
                if (Array.isArray(e)) return e
            }(t = eN.useState(te())) || function(e) {
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
                    if ("string" == typeof e) return e9(e, 2);
                    var t = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return e9(e, 2)
                }
            }(t) || function() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }(),
            n = r[0],
            o = r[1];
        return e7(function() {
            e || o(function(e) {
                return null != e ? e : String(tt++)
            })
        }, [e]), e || (n ? "radix-".concat(n) : "")
    }

    function tn(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function to(e) {
        var t = eN.useRef(e);
        return eN.useEffect(function() {
            t.current = e
        }), eN.useMemo(function() {
            return function() {
                for (var e, r = arguments.length, n = Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                    if (Array.isArray(e)) return tn(e)
                }(n) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(n) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return tn(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tn(e, void 0)
                    }
                }(n) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()))
            }
        }, [])
    }

    function ta(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function ti(e, t) {
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
                if ("string" == typeof e) return ta(e, t);
                var r = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ta(e, t)
            }
        }(e, t) || function() {
            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }
    var tl = window.RadixUI["react-dismissable-layer"],
        tc = window.RadixUI["react-focus-scope"];

    function tu(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function ts(e) {
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

    function tf(e, t) {
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

    function td(e, t) {
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

    function tp(e) {
        return function(e) {
            if (Array.isArray(e)) return tu(e)
        }(e) || function(e) {
            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
        }(e) || function(e) {
            if (e) {
                if ("string" == typeof e) return tu(e, void 0);
                var t = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tu(e, void 0)
            }
        }(e) || function() {
            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }

    function th(e) {
        var t, r, n = (t = e, (r = eN.forwardRef(function(e, t) {
                var r = e.children,
                    n = td(e, ["children"]);
                if (eN.isValidElement(r)) {
                    var o, a, i, l, c, u = (c = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                        s = function(e, t) {
                            var r = ts({}, t);
                            for (var n in t) ! function(n) {
                                var o = e[n],
                                    a = t[n];
                                /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                    a.apply(void 0, tp(t)), o.apply(void 0, tp(t))
                                } : o && (r[n] = o) : "style" === n ? r[n] = ts({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                            }(n);
                            return ts({}, e, r)
                        }(n, r.props);
                    return r.type !== eN.Fragment && (s.ref = t ? eQ(t, u) : u), eN.cloneElement(r, s)
                }
                return eN.Children.count(r) > 1 ? eN.Children.only(null) : null
            })).displayName = "".concat(t, ".SlotClone"), r),
            o = eN.forwardRef(function(e, t) {
                var r = e.children,
                    o = td(e, ["children"]),
                    a = eN.Children.toArray(r),
                    i = a.find(tm);
                if (i) {
                    var l = i.props.children,
                        c = a.map(function(e) {
                            return e !== i ? e : eN.Children.count(l) > 1 ? eN.Children.only(null) : eN.isValidElement(l) ? l.props.children : null
                        });
                    return (0, eD.jsx)(n, tf(ts({}, o), {
                        ref: t,
                        children: eN.isValidElement(l) ? eN.cloneElement(l, void 0, c) : null
                    }))
                }
                return (0, eD.jsx)(n, tf(ts({}, o), {
                    ref: t,
                    children: r
                }))
            });
        return o.displayName = "".concat(e, ".Slot"), o
    }
    var ty = Symbol("radix.slottable");

    function tm(e) {
        return eN.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === ty
    }

    function tb(e, t, r) {
        return t in e ? Object.defineProperty(e, t, {
            value: r,
            enumerable: !0,
            configurable: !0,
            writable: !0
        }) : e[t] = r, e
    }

    function tv(e) {
        for (var t = 1; t < arguments.length; t++) {
            var r = null != arguments[t] ? arguments[t] : {},
                n = Object.keys(r);
            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                return Object.getOwnPropertyDescriptor(r, e).enumerable
            }))), n.forEach(function(t) {
                tb(e, t, r[t])
            })
        }
        return e
    }

    function tg(e, t) {
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
    var tO = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
        var r = th("Primitive.".concat(t)),
            n = eN.forwardRef(function(e, n) {
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
                return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, eD.jsx)(i, tg(tv({}, a), {
                    ref: n
                }))
            });
        return n.displayName = "Primitive.".concat(t), tg(tv({}, e), tb({}, t, n))
    }, {});

    function tE(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }
    var tw = eN.forwardRef(function(e, t) {
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
            }(r = eN.useState(!1)) || function(e) {
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
                    if ("string" == typeof e) return tE(e, 2);
                    var t = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tE(e, 2)
                }
            }(r) || function() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }(),
            s = u[0],
            f = u[1];
        e7(function() {
            return f(!0)
        }, []);
        var d = l || s && (null == (i = globalThis) || null == (a = i.document) ? void 0 : a.body);
        return d ? eM().createPortal((0, eD.jsx)(tO.div, (n = function(e) {
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

    function tP(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function tS(e, t) {
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
                if ("string" == typeof e) return tP(e, t);
                var r = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tP(e, t)
            }
        }(e, t) || function() {
            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }
    tw.displayName = "Portal";
    var tx = function(e) {
        var t, r, n, o, a, i, l, c, u, s, f, d, p, h, y, m, b, v = e.present,
            g = e.children,
            O = (t = v, a = (o = tS(eN.useState(), 2))[0], i = o[1], l = eN.useRef({}), c = eN.useRef(t), u = eN.useRef("none"), f = (s = tS((r = t ? "mounted" : "unmounted", n = {
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
            }, eN.useReducer(function(e, t) {
                var r = n[e][t];
                return null != r ? r : e
            }, r)), 2))[0], d = s[1], eN.useEffect(function() {
                var e = tj(l.current);
                u.current = "mounted" === f ? e : "none"
            }, [f]), e7(function() {
                var e = l.current,
                    r = c.current;
                if (r !== t) {
                    var n = u.current,
                        o = tj(e);
                    t ? d("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? d("UNMOUNT") : r && n !== o ? d("ANIMATION_OUT") : d("UNMOUNT"), c.current = t
                }
            }, [t, d]), e7(function() {
                if (a) {
                    var e, t, r = null != (e = a.ownerDocument.defaultView) ? e : window,
                        n = function(e) {
                            var n = tj(l.current).includes(e.animationName);
                            if (e.target === a && n && (d("ANIMATION_END"), !c.current)) {
                                var o = a.style.animationFillMode;
                                a.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                    "forwards" === a.style.animationFillMode && (a.style.animationFillMode = o)
                                })
                            }
                        },
                        o = function(e) {
                            e.target === a && (u.current = tj(l.current))
                        };
                    return a.addEventListener("animationstart", o), a.addEventListener("animationcancel", n), a.addEventListener("animationend", n),
                        function() {
                            r.clearTimeout(t), a.removeEventListener("animationstart", o), a.removeEventListener("animationcancel", n), a.removeEventListener("animationend", n)
                        }
                }
                d("ANIMATION_END")
            }, [a, d]), {
                isPresent: ["mounted", "unmountSuspended"].includes(f),
                ref: eN.useCallback(function(e) {
                    e && (l.current = getComputedStyle(e)), i(e)
                }, [])
            }),
            E = "function" == typeof g ? g({
                present: O.isPresent
            }) : eN.Children.only(g),
            w = e0(O.ref, (b = (m = null == (h = Object.getOwnPropertyDescriptor((p = E).props, "ref")) ? void 0 : h.get) && "isReactWarning" in m && m.isReactWarning) ? p.ref : (b = (m = null == (y = Object.getOwnPropertyDescriptor(p, "ref")) ? void 0 : y.get) && "isReactWarning" in m && m.isReactWarning) ? p.props.ref : p.props.ref || p.ref);
        return "function" == typeof g || O.isPresent ? eN.cloneElement(E, {
            ref: w
        }) : null
    };

    function tj(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    tx.displayName = "Presence";
    var tI = window.RadixUI["react-focus-guards"],
        tA = function() {
            return (tA = Object.assign || function(e) {
                for (var t, r = 1, n = arguments.length; r < n; r++)
                    for (var o in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                return e
            }).apply(this, arguments)
        };

    function tT(e, t) {
        var r = {};
        for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && 0 > t.indexOf(n) && (r[n] = e[n]);
        if (null != e && "function" == typeof Object.getOwnPropertySymbols)
            for (var o = 0, n = Object.getOwnPropertySymbols(e); o < n.length; o++) 0 > t.indexOf(n[o]) && Object.prototype.propertyIsEnumerable.call(e, n[o]) && (r[n[o]] = e[n[o]]);
        return r
    }
    var t_ = "right-scroll-bar-position",
        tN = "width-before-scroll-bar";

    function tC(e, t) {
        return "function" == typeof e ? e(t) : e && (e.current = t), e
    }
    var tR = "u" > typeof window ? eN.useLayoutEffect : eN.useEffect,
        tM = new WeakMap,
        tU = (void 0 === t && (t = {}), (void 0 === r && (r = function(e) {
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
        }).options = tA({
            async: !0,
            ssr: !1
        }, t), a),
        tk = function() {},
        tD = eN.forwardRef(function(e, t) {
            var r, n, o, a, i = eN.useRef(null),
                l = eN.useState({
                    onScrollCapture: tk,
                    onWheelCapture: tk,
                    onTouchMoveCapture: tk
                }),
                c = l[0],
                u = l[1],
                s = e.forwardProps,
                f = e.children,
                d = e.className,
                p = e.removeScrollBar,
                h = e.enabled,
                y = e.shards,
                m = e.sideCar,
                b = e.noRelative,
                v = e.noIsolation,
                g = e.inert,
                O = e.allowPinchZoom,
                E = e.as,
                w = e.gapMode,
                P = tT(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                S = (r = [i, t], n = function(e) {
                    return r.forEach(function(t) {
                        return tC(t, e)
                    })
                }, (o = (0, eN.useState)(function() {
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
                })[0]).callback = n, a = o.facade, tR(function() {
                    var e = tM.get(a);
                    if (e) {
                        var t = new Set(e),
                            n = new Set(r),
                            o = a.current;
                        t.forEach(function(e) {
                            n.has(e) || tC(e, null)
                        }), n.forEach(function(e) {
                            t.has(e) || tC(e, o)
                        })
                    }
                    tM.set(a, r)
                }, [r]), a),
                x = tA(tA({}, P), c);
            return eN.createElement(eN.Fragment, null, h && eN.createElement(m, {
                sideCar: tU,
                removeScrollBar: p,
                shards: y,
                noRelative: b,
                noIsolation: v,
                inert: g,
                setCallbacks: u,
                allowPinchZoom: !!O,
                lockRef: i,
                gapMode: w
            }), s ? eN.cloneElement(eN.Children.only(f), tA(tA({}, x), {
                ref: S
            })) : eN.createElement(void 0 === E ? "div" : E, tA({}, x, {
                className: d,
                ref: S
            }), f))
        });
    tD.defaultProps = {
        enabled: !0,
        removeScrollBar: !0,
        inert: !1
    }, tD.classNames = {
        fullWidth: tN,
        zeroRight: t_
    };
    var tB = function(e) {
        var t = e.sideCar,
            r = tT(e, ["sideCar"]);
        if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
        var n = t.read();
        if (!n) throw Error("Sidecar medium not found");
        return eN.createElement(n, tA({}, r))
    };
    tB.isSideCarExport = !0;
    var tL = function() {
            var e = 0,
                t = null;
            return {
                add: function(r) {
                    if (0 == e && (t = function() {
                            if (!document) return null;
                            var e = document.createElement("style");
                            e.type = "text/css";
                            var t = y || E.nc;
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
        tH = function() {
            var e = tL();
            return function(t, r) {
                eN.useEffect(function() {
                    return e.add(t),
                        function() {
                            e.remove()
                        }
                }, [t && r])
            }
        },
        tG = function() {
            var e = tH();
            return function(t) {
                return e(t.styles, t.dynamic), null
            }
        },
        tF = {
            left: 0,
            top: 0,
            right: 0,
            gap: 0
        },
        tV = function(e) {
            return parseInt(e || "", 10) || 0
        },
        tW = function(e) {
            var t = window.getComputedStyle(document.body),
                r = t["padding" === e ? "paddingLeft" : "marginLeft"],
                n = t["padding" === e ? "paddingTop" : "marginTop"],
                o = t["padding" === e ? "paddingRight" : "marginRight"];
            return [tV(r), tV(n), tV(o)]
        },
        tX = function(e) {
            if (void 0 === e && (e = "margin"), "u" < typeof window) return tF;
            var t = tW(e),
                r = document.documentElement.clientWidth,
                n = window.innerWidth;
            return {
                left: t[0],
                top: t[1],
                right: t[2],
                gap: Math.max(0, n - r + t[2] - t[0])
            }
        },
        tK = tG(),
        tz = "data-scroll-locked",
        tY = function(e, t, r, n) {
            var o = e.left,
                a = e.top,
                i = e.right,
                l = e.gap;
            return void 0 === r && (r = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(n, ";\n   padding-right: ").concat(l, "px ").concat(n, ";\n  }\n  body[").concat(tz, "] {\n    overflow: hidden ").concat(n, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(n, ";"), "margin" === r && "\n    padding-left: ".concat(o, "px;\n    padding-top: ").concat(a, "px;\n    padding-right: ").concat(i, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(l, "px ").concat(n, ";\n    "), "padding" === r && "padding-right: ".concat(l, "px ").concat(n, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(t_, " {\n    right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(tN, " {\n    margin-right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(t_, " .").concat(t_, " {\n    right: 0 ").concat(n, ";\n  }\n  \n  .").concat(tN, " .").concat(tN, " {\n    margin-right: 0 ").concat(n, ";\n  }\n  \n  body[").concat(tz, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(l, "px;\n  }\n")
        },
        tZ = function() {
            var e = parseInt(document.body.getAttribute(tz) || "0", 10);
            return isFinite(e) ? e : 0
        },
        tq = function() {
            eN.useEffect(function() {
                return document.body.setAttribute(tz, (tZ() + 1).toString()),
                    function() {
                        var e = tZ() - 1;
                        e <= 0 ? document.body.removeAttribute(tz) : document.body.setAttribute(tz, e.toString())
                    }
            }, [])
        },
        t$ = function(e) {
            var t = e.noRelative,
                r = e.noImportant,
                n = e.gapMode,
                o = void 0 === n ? "margin" : n;
            tq();
            var a = eN.useMemo(function() {
                return tX(o)
            }, [o]);
            return eN.createElement(tK, {
                styles: tY(a, !t, o, r ? "" : "!important")
            })
        },
        tJ = !1;
    if ("u" > typeof window) try {
        var tQ = Object.defineProperty({}, "passive", {
            get: function() {
                return tJ = !0, !0
            }
        });
        window.addEventListener("test", tQ, tQ), window.removeEventListener("test", tQ, tQ)
    } catch (e) {
        tJ = !1
    }
    var t0 = !!tJ && {
        passive: !1
    };

    function t1(e, t) {
        return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
    }
    var t2 = function(e, t) {
            if (!t1(e, Element)) return !1;
            var r = window.getComputedStyle(e);
            return "hidden" !== r[t] && (r.overflowY !== r.overflowX || "TEXTAREA" === e.tagName || "visible" !== r[t])
        },
        t3 = function(e, t) {
            var r = t.ownerDocument,
                n = t;
            do {
                if ("u" > typeof ShadowRoot && t1(n, ShadowRoot) && (n = n.host), t6(e, n)) {
                    var o = t5(e, n);
                    if (o[1] > o[2]) return !0
                }
                n = n.parentNode
            } while (n && n !== r.body);
            return !1
        },
        t6 = function(e, t) {
            return "v" === e ? t2(t, "overflowY") : t2(t, "overflowX")
        },
        t5 = function(e, t) {
            return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
        },
        t4 = function(e, t, r, n, o) {
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
                var h = t5(e, c),
                    y = h[0],
                    m = h[1] - h[2] - i * y;
                (y || m) && t6(e, c) && (d += m, p += y);
                var b = c.parentNode;
                c = b && b.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? b.host : b
            } while (!u && c !== document.body || u && (t.contains(c) || t === c));
            return f && (o && 1 > Math.abs(d) || !o && l > d) ? s = !0 : !f && (o && 1 > Math.abs(p) || !o && -l > p) && (s = !0), s
        },
        t8 = function(e) {
            return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
        },
        t7 = function(e) {
            return [e.deltaX, e.deltaY]
        },
        t9 = function(e) {
            return e && "current" in e ? e.current : e
        },
        re = 0,
        rt = [],
        rr = (i = function(e) {
            var t = eN.useRef([]),
                r = eN.useRef([0, 0]),
                n = eN.useRef(),
                o = eN.useState(re++)[0],
                a = eN.useState(tG)[0],
                i = eN.useRef(e);
            eN.useEffect(function() {
                i.current = e
            }, [e]), eN.useEffect(function() {
                if (e.inert) {
                    document.body.classList.add("block-interactivity-".concat(o));
                    var t = (function(e, t, r) {
                        if (r || 2 == arguments.length)
                            for (var n, o = 0, a = t.length; o < a; o++) !n && o in t || (n || (n = Array.prototype.slice.call(t, 0, o)), n[o] = t[o]);
                        return e.concat(n || Array.prototype.slice.call(t))
                    })([e.lockRef.current], (e.shards || []).map(t9), !0).filter(Boolean);
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
            var l = eN.useCallback(function(e, t) {
                    if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !i.current.allowPinchZoom;
                    var o, a = t8(e),
                        l = r.current,
                        c = "deltaX" in e ? e.deltaX : l[0] - a[0],
                        u = "deltaY" in e ? e.deltaY : l[1] - a[1],
                        s = e.target,
                        f = Math.abs(c) > Math.abs(u) ? "h" : "v";
                    if ("touches" in e && "h" === f && "range" === s.type) return !1;
                    var d = t3(f, s);
                    if (!d) return !0;
                    if (d ? o = f : (o = "v" === f ? "h" : "v", d = t3(f, s)), !d) return !1;
                    if (!n.current && "changedTouches" in e && (c || u) && (n.current = o), !o) return !0;
                    var p = n.current || o;
                    return t4(p, t, e, "h" === p ? c : u, !0)
                }, []),
                c = eN.useCallback(function(e) {
                    if (rt.length && rt[rt.length - 1] === a) {
                        var r = "deltaY" in e ? t7(e) : t8(e),
                            n = t.current.filter(function(t) {
                                var n;
                                return t.name === e.type && (t.target === e.target || e.target === t.shadowParent) && (n = t.delta, n[0] === r[0] && n[1] === r[1])
                            })[0];
                        if (n && n.should) {
                            e.cancelable && e.preventDefault();
                            return
                        }
                        if (!n) {
                            var o = (i.current.shards || []).map(t9).filter(Boolean).filter(function(t) {
                                return t.contains(e.target)
                            });
                            (o.length > 0 ? l(e, o[0]) : !i.current.noIsolation) && e.cancelable && e.preventDefault()
                        }
                    }
                }, []),
                u = eN.useCallback(function(e, r, n, o) {
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
                s = eN.useCallback(function(e) {
                    r.current = t8(e), n.current = void 0
                }, []),
                f = eN.useCallback(function(t) {
                    u(t.type, t7(t), t.target, l(t, e.lockRef.current))
                }, []),
                d = eN.useCallback(function(t) {
                    u(t.type, t8(t), t.target, l(t, e.lockRef.current))
                }, []);
            eN.useEffect(function() {
                return rt.push(a), e.setCallbacks({
                        onScrollCapture: f,
                        onWheelCapture: f,
                        onTouchMoveCapture: d
                    }), document.addEventListener("wheel", c, t0), document.addEventListener("touchmove", c, t0), document.addEventListener("touchstart", s, t0),
                    function() {
                        rt = rt.filter(function(e) {
                            return e !== a
                        }), document.removeEventListener("wheel", c, t0), document.removeEventListener("touchmove", c, t0), document.removeEventListener("touchstart", s, t0)
                    }
            }, []);
            var p = e.removeScrollBar,
                h = e.inert;
            return eN.createElement(eN.Fragment, null, h ? eN.createElement(a, {
                styles: "\n  .block-interactivity-".concat(o, " {pointer-events: none;}\n  .allow-interactivity-").concat(o, " {pointer-events: all;}\n")
            }) : null, p ? eN.createElement(t$, {
                noRelative: e.noRelative,
                gapMode: e.gapMode
            }) : null)
        }, tU.useMedium(i), tB),
        rn = eN.forwardRef(function(e, t) {
            return eN.createElement(tD, tA({}, e, {
                ref: t,
                sideCar: rr
            }))
        });
    rn.classNames = tD.classNames;
    var ro = new WeakMap,
        ra = new WeakMap,
        ri = {},
        rl = 0,
        rc = function(e) {
            return e && (e.host || rc(e.parentNode))
        },
        ru = function(e, t, r, n) {
            var o = (Array.isArray(e) ? e : [e]).map(function(e) {
                if (t.contains(e)) return e;
                var r = rc(e);
                return r && t.contains(r) ? r : (console.error("aria-hidden", e, "in not contained inside", t, ". Doing nothing"), null)
            }).filter(function(e) {
                return !!e
            });
            ri[r] || (ri[r] = new WeakMap);
            var a = ri[r],
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
                            c = (ro.get(e) || 0) + 1,
                            u = (a.get(e) || 0) + 1;
                        ro.set(e, c), a.set(e, u), i.push(e), 1 === c && o && ra.set(e, !0), 1 === u && e.setAttribute(r, "true"), o || e.setAttribute(n, "true")
                    } catch (t) {
                        console.error("aria-hidden: cannot operate on ", e, t)
                    }
                })
            };
            return s(t), l.clear(), rl++,
                function() {
                    i.forEach(function(e) {
                        var t = ro.get(e) - 1,
                            o = a.get(e) - 1;
                        ro.set(e, t), a.set(e, o), t || (ra.has(e) || e.removeAttribute(n), ra.delete(e)), o || e.removeAttribute(r)
                    }), --rl || (ro = new WeakMap, ro = new WeakMap, ra = new WeakMap, ri = {})
                }
        },
        rs = function(e, t, r) {
            void 0 === r && (r = "data-aria-hidden");
            var n = Array.from(Array.isArray(e) ? e : [e]),
                o = t || ("u" < typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body);
            return o ? (n.push.apply(n, Array.from(o.querySelectorAll("[aria-live], script"))), ru(n, o, r, "aria-hidden")) : function() {
                return null
            }
        };

    function rf(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function rd(e) {
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

    function rp(e, t) {
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

    function rh(e, t) {
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

    function ry(e, t) {
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
                if ("string" == typeof e) return rf(e, t);
                var r = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rf(e, t)
            }
        }(e, t) || function() {
            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }
    var rm = "Dialog",
        rb = ry(e4(rm), 2),
        rv = rb[0];
    rb[1];
    var rg = ry(rv(rm), 2),
        rO = rg[0],
        rE = rg[1],
        rw = function(e) {
            var t, r, n, o, a, i, l, c, u, s, f, d, p, h, y, m, b, v = e.__scopeDialog,
                g = e.children,
                O = e.open,
                E = e.defaultOpen,
                w = e.onOpenChange,
                P = e.modal,
                S = eN.useRef(null),
                x = eN.useRef(null),
                j = ry((u = (c = {
                    prop: O,
                    defaultProp: E,
                    onChange: w
                }).prop, p = (d = ti((r = (t = {
                    defaultProp: c.defaultProp,
                    onChange: f = void 0 === (s = c.onChange) ? function() {} : s
                }).defaultProp, n = t.onChange, a = ti(o = eN.useState(r), 1)[0], i = eN.useRef(a), l = to(n), eN.useEffect(function() {
                    i.current !== a && (l(a), i.current = a)
                }, [a, i, l]), o), 2))[0], h = d[1], m = (y = void 0 !== u) ? u : p, b = to(f), [m, eN.useCallback(function(e) {
                    if (y) {
                        var t = "function" == typeof e ? e(u) : e;
                        t !== u && b(t)
                    } else h(e)
                }, [y, u, h, b])]), 2),
                I = j[0],
                A = j[1];
            return (0, eD.jsx)(rO, {
                scope: v,
                triggerRef: S,
                contentRef: x,
                contentId: tr(),
                titleId: tr(),
                descriptionId: tr(),
                open: void 0 !== I && I,
                onOpenChange: A,
                onOpenToggle: eN.useCallback(function() {
                    return A(function(e) {
                        return !e
                    })
                }, [A]),
                modal: void 0 === P || P,
                children: g
            })
        };
    rw.displayName = rm;
    var rP = "DialogTrigger";
    eN.forwardRef(function(e, t) {
        var r = e.__scopeDialog,
            n = rh(e, ["__scopeDialog"]),
            o = rE(rP, r),
            a = e0(t, o.triggerRef);
        return (0, eD.jsx)(tO.button, rp(rd({
            type: "button",
            "aria-haspopup": "dialog",
            "aria-expanded": o.open,
            "aria-controls": o.contentId,
            "data-state": rV(o.open)
        }, n), {
            ref: a,
            onClick: eq(e.onClick, o.onOpenToggle)
        }))
    }).displayName = rP;
    var rS = "DialogPortal",
        rx = ry(rv(rS, {
            forceMount: void 0
        }), 2),
        rj = rx[0],
        rI = rx[1],
        rA = function(e) {
            var t = e.__scopeDialog,
                r = e.forceMount,
                n = e.children,
                o = e.container,
                a = rE(rS, t);
            return (0, eD.jsx)(rj, {
                scope: t,
                forceMount: r,
                children: eN.Children.map(n, function(e) {
                    return (0, eD.jsx)(tx, {
                        present: r || a.open,
                        children: (0, eD.jsx)(tw, {
                            asChild: !0,
                            container: o,
                            children: e
                        })
                    })
                })
            })
        };
    rA.displayName = rS;
    var rT = "DialogOverlay",
        r_ = eN.forwardRef(function(e, t) {
            var r = rI(rT, e.__scopeDialog),
                n = e.forceMount,
                o = void 0 === n ? r.forceMount : n,
                a = rh(e, ["forceMount"]),
                i = rE(rT, e.__scopeDialog);
            return i.modal ? (0, eD.jsx)(tx, {
                present: o || i.open,
                children: (0, eD.jsx)(rC, rp(rd({}, a), {
                    ref: t
                }))
            }) : null
        });
    r_.displayName = rT;
    var rN = th("DialogOverlay.RemoveScroll"),
        rC = eN.forwardRef(function(e, t) {
            var r = e.__scopeDialog,
                n = rh(e, ["__scopeDialog"]),
                o = rE(rT, r);
            return (0, eD.jsx)(rn, {
                as: rN,
                allowPinchZoom: !0,
                shards: [o.contentRef],
                children: (0, eD.jsx)(tO.div, rp(rd({
                    "data-state": rV(o.open)
                }, n), {
                    ref: t,
                    style: rd({
                        pointerEvents: "auto"
                    }, n.style)
                }))
            })
        }),
        rR = "DialogContent",
        rM = eN.forwardRef(function(e, t) {
            var r = rI(rR, e.__scopeDialog),
                n = e.forceMount,
                o = void 0 === n ? r.forceMount : n,
                a = rh(e, ["forceMount"]),
                i = rE(rR, e.__scopeDialog);
            return (0, eD.jsx)(tx, {
                present: o || i.open,
                children: i.modal ? (0, eD.jsx)(rU, rp(rd({}, a), {
                    ref: t
                })) : (0, eD.jsx)(rk, rp(rd({}, a), {
                    ref: t
                }))
            })
        });
    rM.displayName = rR;
    var rU = eN.forwardRef(function(e, t) {
            var r = rE(rR, e.__scopeDialog),
                n = eN.useRef(null),
                o = e0(t, r.contentRef, n);
            return eN.useEffect(function() {
                var e = n.current;
                if (e) return rs(e)
            }, []), (0, eD.jsx)(rD, rp(rd({}, e), {
                ref: o,
                trapFocus: r.open,
                disableOutsidePointerEvents: !0,
                onCloseAutoFocus: eq(e.onCloseAutoFocus, function(e) {
                    var t;
                    e.preventDefault(), null == (t = r.triggerRef.current) || t.focus()
                }),
                onPointerDownOutside: eq(e.onPointerDownOutside, function(e) {
                    var t = e.detail.originalEvent,
                        r = 0 === t.button && !0 === t.ctrlKey;
                    (2 === t.button || r) && e.preventDefault()
                }),
                onFocusOutside: eq(e.onFocusOutside, function(e) {
                    return e.preventDefault()
                })
            }))
        }),
        rk = eN.forwardRef(function(e, t) {
            var r = rE(rR, e.__scopeDialog),
                n = eN.useRef(!1),
                o = eN.useRef(!1);
            return (0, eD.jsx)(rD, rp(rd({}, e), {
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
        rD = eN.forwardRef(function(e, t) {
            var r = e.__scopeDialog,
                n = e.trapFocus,
                o = e.onOpenAutoFocus,
                a = e.onCloseAutoFocus,
                i = rh(e, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                l = rE(rR, r),
                c = eN.useRef(null),
                u = e0(t, c);
            return (0, tI.useFocusGuards)(), (0, eD.jsxs)(eD.Fragment, {
                children: [(0, eD.jsx)(tc.FocusScope, {
                    asChild: !0,
                    loop: !0,
                    trapped: n,
                    onMountAutoFocus: o,
                    onUnmountAutoFocus: a,
                    children: (0, eD.jsx)(tl.DismissableLayer, rp(rd({
                        role: "dialog",
                        id: l.contentId,
                        "aria-describedby": l.descriptionId,
                        "aria-labelledby": l.titleId,
                        "data-state": rV(l.open)
                    }, i), {
                        ref: u,
                        onDismiss: function() {
                            return l.onOpenChange(!1)
                        }
                    }))
                }), (0, eD.jsxs)(eD.Fragment, {
                    children: [(0, eD.jsx)(rz, {
                        titleId: l.titleId
                    }), (0, eD.jsx)(rY, {
                        contentRef: c,
                        descriptionId: l.descriptionId
                    })]
                })]
            })
        }),
        rB = "DialogTitle",
        rL = eN.forwardRef(function(e, t) {
            var r = e.__scopeDialog,
                n = rh(e, ["__scopeDialog"]),
                o = rE(rB, r);
            return (0, eD.jsx)(tO.h2, rp(rd({
                id: o.titleId
            }, n), {
                ref: t
            }))
        });
    rL.displayName = rB;
    var rH = "DialogDescription";
    eN.forwardRef(function(e, t) {
        var r = e.__scopeDialog,
            n = rh(e, ["__scopeDialog"]),
            o = rE(rH, r);
        return (0, eD.jsx)(tO.p, rp(rd({
            id: o.descriptionId
        }, n), {
            ref: t
        }))
    }).displayName = rH;
    var rG = "DialogClose",
        rF = eN.forwardRef(function(e, t) {
            var r = e.__scopeDialog,
                n = rh(e, ["__scopeDialog"]),
                o = rE(rG, r);
            return (0, eD.jsx)(tO.button, rp(rd({
                type: "button"
            }, n), {
                ref: t,
                onClick: eq(e.onClick, function() {
                    return o.onOpenChange(!1)
                })
            }))
        });

    function rV(e) {
        return e ? "open" : "closed"
    }
    rF.displayName = rG;
    var rW = "DialogTitleWarning",
        rX = ry((l = {
            contentName: rR,
            titleName: rB,
            docsSlug: "dialog"
        }, c = eN.createContext(l), (u = function(e) {
            var t = e.children,
                r = e6(e, ["children"]),
                n = eN.useMemo(function() {
                    return r
                }, Object.values(r));
            return (0, eD.jsx)(c.Provider, {
                value: n,
                children: t
            })
        }).displayName = rW + "Provider", [u, function(e) {
            var t = eN.useContext(c);
            if (t) return t;
            if (void 0 !== l) return l;
            throw Error("`".concat(e, "` must be used within `").concat(rW, "`"))
        }]), 2),
        rK = (rX[0], rX[1]),
        rz = function(e) {
            var t = e.titleId,
                r = rK(rW),
                n = "`".concat(r.contentName, "` requires a `").concat(r.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(r.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(r.docsSlug);
            return eN.useEffect(function() {
                t && (document.getElementById(t) || console.error(n))
            }, [n, t]), null
        },
        rY = function(e) {
            var t = e.contentRef,
                r = e.descriptionId,
                n = rK("DialogDescriptionWarning"),
                o = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(n.contentName, "}.");
            return eN.useEffect(function() {
                var e, n = null == (e = t.current) ? void 0 : e.getAttribute("aria-describedby");
                r && n && (document.getElementById(r) || console.warn(o))
            }, [o, t, r]), null
        };

    function rZ(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
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

    function rJ(e, t) {
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

    function rQ(e) {
        return function(e) {
            if (Array.isArray(e)) return rZ(e)
        }(e) || function(e) {
            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
        }(e) || function(e) {
            if (e) {
                if ("string" == typeof e) return rZ(e, void 0);
                var t = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rZ(e, void 0)
            }
        }(e) || function() {
            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }
    var r0 = Symbol("radix.slottable");

    function r1(e) {
        return eN.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === r0
    }

    function r2(e, t, r) {
        return t in e ? Object.defineProperty(e, t, {
            value: r,
            enumerable: !0,
            configurable: !0,
            writable: !0
        }) : e[t] = r, e
    }

    function r3(e) {
        for (var t = 1; t < arguments.length; t++) {
            var r = null != arguments[t] ? arguments[t] : {},
                n = Object.keys(r);
            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                return Object.getOwnPropertyDescriptor(r, e).enumerable
            }))), n.forEach(function(t) {
                r2(e, t, r[t])
            })
        }
        return e
    }

    function r6(e, t) {
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
    var r5 = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
        var r, n, o, a, i, l = (r = o = "Primitive.".concat(t), (n = eN.forwardRef(function(e, t) {
                var r = e.children,
                    n = rJ(e, ["children"]);
                if (eN.isValidElement(r)) {
                    var o, a, i, l, c, u = (c = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                        s = function(e, t) {
                            var r = rq({}, t);
                            for (var n in t) ! function(n) {
                                var o = e[n],
                                    a = t[n];
                                /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                    var n = a.apply(void 0, rQ(t));
                                    return o.apply(void 0, rQ(t)), n
                                } : o && (r[n] = o) : "style" === n ? r[n] = rq({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                            }(n);
                            return rq({}, e, r)
                        }(n, r.props);
                    return r.type !== eN.Fragment && (s.ref = t ? eQ(t, u) : u), eN.cloneElement(r, s)
                }
                return eN.Children.count(r) > 1 ? eN.Children.only(null) : null
            })).displayName = "".concat(r, ".SlotClone"), a = n, (i = eN.forwardRef(function(e, t) {
                var r = e.children,
                    n = rJ(e, ["children"]),
                    o = eN.Children.toArray(r),
                    i = o.find(r1);
                if (i) {
                    var l = i.props.children,
                        c = o.map(function(e) {
                            return e !== i ? e : eN.Children.count(l) > 1 ? eN.Children.only(null) : eN.isValidElement(l) ? l.props.children : null
                        });
                    return (0, eD.jsx)(a, r$(rq({}, n), {
                        ref: t,
                        children: eN.isValidElement(l) ? eN.cloneElement(l, void 0, c) : null
                    }))
                }
                return (0, eD.jsx)(a, r$(rq({}, n), {
                    ref: t,
                    children: r
                }))
            })).displayName = "".concat(o, ".Slot"), i),
            c = eN.forwardRef(function(e, r) {
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
                return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, eD.jsx)(a, r6(r3({}, o), {
                    ref: r
                }))
            });
        return c.displayName = "Primitive.".concat(t), r6(r3({}, e), r2({}, t, c))
    }, {});

    function r4(e) {
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
    var r8 = Object.freeze({
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
        r7 = eN.forwardRef(function(e, t) {
            var r, n;
            return (0, eD.jsx)(r5.span, (r = r4({}, e), n = n = {
                ref: t,
                style: r4({}, r8, e.style)
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
    r7.displayName = "VisuallyHidden";
    var nt = (0, eN.createContext)({
            size: "Medium",
            isModal: !0,
            hasCloseAffordance: !1,
            hasMarginTop: !0,
            hasMarginBottom: !0,
            hasDescription: !1,
            type: "Default"
        }),
        nr = function() {
            var e = (0, eN.useContext)(nt);
            if (!e) throw Error("Dialog components must be used within a Dialog");
            return e
        },
        nn = {
            Small: "padding-x-large",
            Medium: "padding-x-xlarge",
            Large: "padding-x-xlarge"
        },
        no = {
            Small: "padding-top-large",
            Medium: "padding-top-xlarge",
            Large: "padding-top-xlarge"
        },
        na = {
            Small: "padding-bottom-large",
            Medium: "padding-bottom-xlarge",
            Large: "padding-bottom-xlarge"
        },
        ni = function(e) {
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
                h = e.hasDescription,
                y = void 0 !== h && h,
                m = e.experimentalDisablePointerEventsStylingOnBody,
                b = void 0 !== m && m,
                v = (0, eN.useMemo)(function() {
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
            return (0, eN.useEffect)(function() {
                b && setTimeout(function() {
                    Object.assign(document.body.style, {
                        pointerEvents: "unset"
                    })
                }, 0)
            }, [b, t]), eC().createElement(nt.Provider, {
                value: v
            }, eC().createElement(rw, {
                open: t,
                onOpenChange: r
            }, n))
        };
    ni.displayName = "Dialog";
    var nl = function(e) {
        var t = e.children,
            r = e.className,
            n = e.style,
            o = e.overlayClassName,
            a = e.overlayStyle,
            i = e.onOpenAutoFocus,
            l = ne(e, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
            c = nr(),
            u = c.size,
            s = c.isModal,
            f = c.hasCloseAffordance,
            d = c.closeLabel,
            p = c.hasDescription,
            h = eB("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", s && "bg-common-backdrop", o),
            y = eB("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", r);
        return eC().createElement(rA, null, eC().createElement(r_, {
            className: h,
            style: a
        }, eC().createElement(rM, r9({
            className: y,
            "data-size": u,
            style: n,
            onOpenAutoFocus: i
        }, !p && {
            "aria-describedby": void 0
        }, l), f && eC().createElement("div", {
            className: "absolute foundation-web-dialog-close-container"
        }, eC().createElement(rF, {
            asChild: !0
        }, eC().createElement(eZ, {
            variant: "OverMedia",
            size: u,
            isCircular: !0,
            "aria-label": d
        }))), t)))
    };
    nl.displayName = "DialogContent";
    var nc = function(e) {
        var t = e.children,
            r = e.className,
            n = ne(e, ["children", "className"]),
            o = nr(),
            a = o.size,
            i = o.hasMarginTop,
            l = o.hasMarginBottom,
            c = eB(nn[a], i && no[a], l && na[a], r);
        return eC().createElement("div", r9({
            className: c
        }, n), t)
    };
    nc.displayName = "DialogBody";
    var nu = function(e) {
        var t = e.children,
            r = e.className,
            n = e.hidden,
            o = ne(e, ["children", "className", "hidden"]),
            a = eC().createElement(rL, r9({
                className: r
            }, o), t);
        return n ? eC().createElement(r7, null, a) : a
    };
    nu.displayName = "DialogTitle";
    var ns = function(e) {
        var t = e.children,
            r = e.className,
            n = ne(e, ["children", "className"]),
            o = nr().size,
            a = eB(nn[o], na[o], r);
        return eC().createElement("div", r9({
            className: a
        }, n), t)
    };
    ns.displayName = "DialogFooter";
    var nf = function(e) {
        var t = e.width,
            r = e.height;
        return eC().createElement("svg", {
            className: "foundation-web-loading-spinner",
            width: t,
            height: r,
            viewBox: "0 0 20 20",
            fill: "none",
            xmlns: "http://www.w3.org/2000/svg"
        }, eC().createElement("path", {
            fillRule: "evenodd",
            clipRule: "evenodd",
            fill: "currentColor",
            d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
        }))
    };

    function nd(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function np(e) {
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

    function nh(e, t) {
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

    function ny(e, t) {
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

    function nm(e) {
        return function(e) {
            if (Array.isArray(e)) return nd(e)
        }(e) || function(e) {
            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
        }(e) || function(e) {
            if (e) {
                if ("string" == typeof e) return nd(e, void 0);
                var t = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nd(e, void 0)
            }
        }(e) || function() {
            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }

    function nb(e) {
        return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
    }
    var nv = Symbol.for("react.lazy"),
        ng = eN[" use ".trim().toString()];

    function nO(e) {
        var t;
        return null != e && (void 0 === e ? "undefined" : nb(e)) === "object" && "$$typeof" in e && e.$$typeof === nv && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : nb(t)) === "object" && null !== t && "then" in t
    }
    var nE = ((e = eN.forwardRef(function(e, t) {
            var r = e.children,
                n = ny(e, ["children"]);
            if (nO(r) && "function" == typeof ng && (r = ng(r._payload)), eN.isValidElement(r)) {
                var o, a, i, l, c, u = (c = (l = null == (a = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (i = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                    s = function(e, t) {
                        var r = np({}, t);
                        for (var n in t) ! function(n) {
                            var o = e[n],
                                a = t[n];
                            /^on[A-Z]/.test(n) ? o && a ? r[n] = function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                var n = a.apply(void 0, nm(t));
                                return o.apply(void 0, nm(t)), n
                            } : o && (r[n] = o) : "style" === n ? r[n] = np({}, o, a) : "className" === n && (r[n] = [o, a].filter(Boolean).join(" "))
                        }(n);
                        return np({}, e, r)
                    }(n, r.props);
                return r.type !== eN.Fragment && (s.ref = t ? eQ(t, u) : u), eN.cloneElement(r, s)
            }
            return eN.Children.count(r) > 1 ? eN.Children.only(null) : null
        })).displayName = "".concat("Slot", ".SlotClone"), s = e, (f = eN.forwardRef(function(e, t) {
            var r = e.children,
                n = ny(e, ["children"]);
            nO(r) && "function" == typeof ng && (r = ng(r._payload));
            var o = eN.Children.toArray(r),
                a = o.find(nP);
            if (a) {
                var i = a.props.children,
                    l = o.map(function(e) {
                        return e !== a ? e : eN.Children.count(i) > 1 ? eN.Children.only(null) : eN.isValidElement(i) ? i.props.children : null
                    });
                return (0, eD.jsx)(s, nh(np({}, n), {
                    ref: t,
                    children: eN.isValidElement(i) ? eN.cloneElement(i, void 0, l) : null
                }))
            }
            return (0, eD.jsx)(s, nh(np({}, n), {
                ref: t,
                children: r
            }))
        })).displayName = "".concat("Slot", ".Slot"), f),
        nw = Symbol("radix.slottable");

    function nP(e) {
        return eN.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === nw
    }

    function nS(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function nx(e) {
        if (Array.isArray(e)) return e
    }

    function nj() {
        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
    }

    function nI(e) {
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

    function nA(e, t) {
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

    function nT(e, t) {
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

    function n_(e, t) {
        if (e) {
            if ("string" == typeof e) return nS(e, t);
            var r = Object.prototype.toString.call(e).slice(8, -1);
            if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nS(e, t)
        }
    }
    var nN = {
            Large: 24,
            Medium: 20,
            Small: 16,
            XSmall: 12
        },
        nC = {
            Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
            Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
            Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
            XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
        },
        nR = {
            Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
            Standard: ["bg-action-standard", "content-action-standard"],
            SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
            Utility: ["bg-action-subtle", "content-action-standard"],
            Link: ["bg-action-link", "content-system-emphasis"],
            Alert: ["bg-action-alert", "content-action-alert"],
            ActionUtility: ["bg-action-subtle", "content-action-standard"]
        },
        nM = {
            Emphasis: ["bg-action-standard", "content-action-standard"],
            Standard: ["bg-action-standard", "content-action-standard"],
            SoftEmphasis: ["bg-action-standard", "content-action-standard"],
            Utility: ["bg-action-subtle", "content-action-standard"],
            Link: ["bg-action-link", "content-system-emphasis"],
            Alert: ["bg-action-standard", "content-action-standard"],
            ActionUtility: ["bg-action-subtle", "content-action-standard"]
        },
        nU = (0, eN.forwardRef)(function(e, t) {
            var r, n = nx(r = [e, t]) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(r) || n_(r) || nj(),
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
                h = o.size,
                y = void 0 === h ? "Large" : h,
                m = o.variant,
                b = void 0 === m ? "Emphasis" : m,
                v = o.asChild,
                g = nT(o, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                O = (nx(a) || function(e) {
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
                }(a) || n_(a, 1) || nj())[0],
                E = eB("foundation-web-button", s ? "opacity-[0.5]" : [eL, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", nC[y], s ? nM[b] : nR[b], l),
                w = nI({
                    textDecoration: "none"
                }, c),
                P = function(e) {
                    return eC().createElement(eC().Fragment, null, eC().createElement(eH, null), d && eC().createElement("div", {
                        "aria-hidden": "true",
                        className: "absolute flex"
                    }, eC().createElement(nf, {
                        width: nN[y],
                        height: nN[y]
                    })), eC().createElement("span", {
                        className: eB("flex items-center min-width-0", "Large" === y || "Medium" === y ? "gap-small" : "gap-xsmall", d && "invisible")
                    }, p && eC().createElement(eK, {
                        name: p,
                        size: y
                    }), eC().createElement("span", {
                        className: "padding-y-xsmall text-truncate-end text-no-wrap"
                    }, e)))
                };
            if (v) {
                g.as;
                var S = nT(g, ["as"]),
                    x = eC().Children.only(i);
                return eC().createElement(nE, nA(nI({
                    ref: O
                }, S), {
                    className: E,
                    style: w,
                    "aria-disabled": s || void 0
                }), eC().cloneElement(x, {}, P(x.props.children)))
            }
            if ("a" === g.as) {
                g.as;
                var j = g.href,
                    I = nT(g, ["as", "href"]);
                return eC().createElement("a", nA(nI({
                    ref: O
                }, I), {
                    "aria-disabled": s,
                    href: s ? void 0 : j,
                    className: E,
                    style: w
                }), P(i))
            }
            g.as;
            var A = nT(g, ["as"]);
            return eC().createElement("button", nA(nI({
                ref: O,
                type: "button"
            }, A), {
                disabled: s,
                className: E,
                style: w
            }), P(i))
        });

    function nk(e, t) {
        var r = t && t.cache ? t.cache : nG,
            n = t && t.serializer ? t.serializer : nL;
        return (t && t.strategy ? t.strategy : function(e, t) {
            var r, n, o = 1 === e.length ? nD : nB;
            return r = t.cache.create(), n = t.serializer, o.bind(this, e, r, n)
        })(e, {
            cache: r,
            serializer: n
        })
    }

    function nD(e, t, r, n) {
        var o = null == n || "number" == typeof n || "boolean" == typeof n ? n : r(n),
            a = t.get(o);
        return void 0 === a && (a = e.call(this, n), t.set(o, a)), a
    }

    function nB(e, t, r) {
        var n = Array.prototype.slice.call(arguments, 3),
            o = r(n),
            a = t.get(o);
        return void 0 === a && (a = e.apply(this, n), t.set(o, a)), a
    }
    var nL = function() {
            return JSON.stringify(arguments)
        },
        nH = function() {
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
        nG = {
            create: function() {
                return new nH
            }
        },
        nF = {
            variadic: function(e, t) {
                var r, n;
                return r = t.cache.create(), n = t.serializer, nB.bind(this, e, r, n)
            },
            monadic: function(e, t) {
                var r, n;
                return r = t.cache.create(), n = t.serializer, nD.bind(this, e, r, n)
            }
        };

    function nV(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function nW(e, t, r) {
        return (nW = nY() ? Reflect.construct : function(e, t, r) {
            var n = [null];
            n.push.apply(n, t);
            var o = new(Function.bind.apply(e, n));
            return r && nK(o, r.prototype), o
        }).apply(null, arguments)
    }

    function nX(e) {
        return (nX = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
            return e.__proto__ || Object.getPrototypeOf(e)
        })(e)
    }

    function nK(e, t) {
        return (nK = Object.setPrototypeOf || function(e, t) {
            return e.__proto__ = t, e
        })(e, t)
    }

    function nz(e) {
        var t = "function" == typeof Map ? new Map : void 0;
        return (nz = function(e) {
            if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
            if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
            if (void 0 !== t) {
                if (t.has(e)) return t.get(e);
                t.set(e, r)
            }

            function r() {
                return nW(e, arguments, nX(this).constructor)
            }
            return r.prototype = Object.create(e.prototype, {
                constructor: {
                    value: r,
                    enumerable: !1,
                    writable: !0,
                    configurable: !0
                }
            }), nK(r, e)
        })(e)
    }

    function nY() {
        try {
            var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
        } catch (e) {}
        return (nY = function() {
            return !!e
        })()
    }
    var nZ = function(e) {
            if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

            function t(e, r) {
                if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                var n, o, a, i = e;
                return r && (i += ": " + r), n = t, o = [i], n = nX(n), (a = function(e, t) {
                    var r;
                    if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                    if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                    return e
                }(this, nY() ? Reflect.construct(n, o || [], nX(this).constructor) : n.apply(this, o))).code = e, r && (a.originalMessage = r), a
            }
            return t.prototype = Object.create(e && e.prototype, {
                constructor: {
                    value: t,
                    writable: !0,
                    configurable: !0
                }
            }), e && nK(t, e), t
        }(nz(Error)),
        nq = ((d = nq || {}).MISSING_MESSAGE = "MISSING_MESSAGE", d.MISSING_FORMAT = "MISSING_FORMAT", d.ENVIRONMENT_FALLBACK = "ENVIRONMENT_FALLBACK", d.INSUFFICIENT_PATH = "INSUFFICIENT_PATH", d.INVALID_MESSAGE = "INVALID_MESSAGE", d.INVALID_KEY = "INVALID_KEY", d.FORMATTING_ERROR = "FORMATTING_ERROR", d);

    function n$(e, t) {
        return nk(e, {
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
            strategy: nF.variadic
        })
    }

    function nJ(e, t) {
        return n$(function() {
            for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
            return nW(e, function(e) {
                if (Array.isArray(e)) return nV(e)
            }(r) || function(e) {
                if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
            }(r) || function(e) {
                if (e) {
                    if ("string" == typeof e) return nV(e, void 0);
                    var t = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nV(e, void 0)
                }
            }(r) || function() {
                throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }())
        }, t)
    }

    function nQ(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function n0(e) {
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

    function n1(e, t) {
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
    var n2 = /(?:[Eec]{1,6}|G{1,5}|[Qq]{1,5}|(?:[yYur]+|U{1,5})|[ML]{1,5}|d{1,2}|D{1,3}|F{1}|[abB]{1,5}|[hkHK]{1,2}|w{1,2}|W{1}|m{1,2}|s{1,2}|[zZOvVxX]{1,4})(?=([^']*'[^']*')*[^']*$)/g,
        n3 = /[\t-\r \x85\u200E\u200F\u2028\u2029]/i,
        n6 = /^\.(?:(0+)(\*)?|(#+)|(0+)(#+))$/g,
        n5 = /^(@+)?(\+|#+)?[rs]?$/g,
        n4 = /(\*)(0+)|(#+)(0+)|(0+)/g,
        n8 = /^(0+)$/;

    function n7(e) {
        var t = {};
        return "r" === e[e.length - 1] ? t.roundingPriority = "morePrecision" : "s" === e[e.length - 1] && (t.roundingPriority = "lessPrecision"), e.replace(n5, function(e, r, n) {
            return "string" != typeof n ? (t.minimumSignificantDigits = r.length, t.maximumSignificantDigits = r.length) : "+" === n ? t.minimumSignificantDigits = r.length : "#" === r[0] ? t.maximumSignificantDigits = r.length : (t.minimumSignificantDigits = r.length, t.maximumSignificantDigits = r.length + ("string" == typeof n ? n.length : 0)), ""
        }), t
    }

    function n9(e) {
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

    function oe(e) {
        var t = n9(e);
        return t || {}
    }

    function ot(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function or(e) {
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

    function on(e) {
        return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
    }

    function oo(e, t) {
        if (e) {
            if ("string" == typeof e) return ot(e, t);
            var r = Object.prototype.toString.call(e).slice(8, -1);
            if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ot(e, t)
        }
    }
    var oa = ((p = {})[p.EXPECT_ARGUMENT_CLOSING_BRACE = 1] = "EXPECT_ARGUMENT_CLOSING_BRACE", p[p.EMPTY_ARGUMENT = 2] = "EMPTY_ARGUMENT", p[p.MALFORMED_ARGUMENT = 3] = "MALFORMED_ARGUMENT", p[p.EXPECT_ARGUMENT_TYPE = 4] = "EXPECT_ARGUMENT_TYPE", p[p.INVALID_ARGUMENT_TYPE = 5] = "INVALID_ARGUMENT_TYPE", p[p.EXPECT_ARGUMENT_STYLE = 6] = "EXPECT_ARGUMENT_STYLE", p[p.INVALID_NUMBER_SKELETON = 7] = "INVALID_NUMBER_SKELETON", p[p.INVALID_DATE_TIME_SKELETON = 8] = "INVALID_DATE_TIME_SKELETON", p[p.EXPECT_NUMBER_SKELETON = 9] = "EXPECT_NUMBER_SKELETON", p[p.EXPECT_DATE_TIME_SKELETON = 10] = "EXPECT_DATE_TIME_SKELETON", p[p.UNCLOSED_QUOTE_IN_ARGUMENT_STYLE = 11] = "UNCLOSED_QUOTE_IN_ARGUMENT_STYLE", p[p.EXPECT_SELECT_ARGUMENT_OPTIONS = 12] = "EXPECT_SELECT_ARGUMENT_OPTIONS", p[p.EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE = 13] = "EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE", p[p.INVALID_PLURAL_ARGUMENT_OFFSET_VALUE = 14] = "INVALID_PLURAL_ARGUMENT_OFFSET_VALUE", p[p.EXPECT_SELECT_ARGUMENT_SELECTOR = 15] = "EXPECT_SELECT_ARGUMENT_SELECTOR", p[p.EXPECT_PLURAL_ARGUMENT_SELECTOR = 16] = "EXPECT_PLURAL_ARGUMENT_SELECTOR", p[p.EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT = 17] = "EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT", p[p.EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT = 18] = "EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT", p[p.INVALID_PLURAL_ARGUMENT_SELECTOR = 19] = "INVALID_PLURAL_ARGUMENT_SELECTOR", p[p.DUPLICATE_PLURAL_ARGUMENT_SELECTOR = 20] = "DUPLICATE_PLURAL_ARGUMENT_SELECTOR", p[p.DUPLICATE_SELECT_ARGUMENT_SELECTOR = 21] = "DUPLICATE_SELECT_ARGUMENT_SELECTOR", p[p.MISSING_OTHER_CLAUSE = 22] = "MISSING_OTHER_CLAUSE", p[p.INVALID_TAG = 23] = "INVALID_TAG", p[p.INVALID_TAG_NAME = 25] = "INVALID_TAG_NAME", p[p.UNMATCHED_CLOSING_TAG = 26] = "UNMATCHED_CLOSING_TAG", p[p.UNCLOSED_TAG = 27] = "UNCLOSED_TAG", p);

    function oi(e) {
        return !!(e && (void 0 === e ? "undefined" : on(e)) === "object" && 0 === e.type)
    }

    function ol(e) {
        return !!(e && (void 0 === e ? "undefined" : on(e)) === "object" && 1 === e.type)
    }
    var oc = /[ \xA0\u1680\u2000-\u200A\u202F\u205F\u3000]/,
        ou = {
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
        os = new RegExp("^".concat(oc.source, "*")),
        of = new RegExp("".concat(oc.source, "*$"));

    function od(e, t) {
        return {
            start: e,
            end: t
        }
    }
    var op = !!Object.fromEntries,
        oh = !!String.prototype.trimStart,
        oy = !!String.prototype.trimEnd,
        om = op ? Object.fromEntries : function(e) {
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
                        }(l) || oo(l, 2) || function() {
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
        ob = oh ? function(e) {
            return e.trimStart()
        } : function(e) {
            return e.replace(os, "")
        },
        ov = oy ? function(e) {
            return e.trimEnd()
        } : function(e) {
            return e.replace(of, "")
        },
        og = RegExp("([^\\u0009-\\u000D\\u0020\\u0085\\u00A0\\u1680\\u2000-\\u200A\\u2028-\\u2029\\u202F\\u205F\\u3000\\u0021-\\u002F\\u003A-\\u0040\\u005B-\\u005E\\u0060\\u007B-\\u007E\\u00A1-\\u00A7\\u00A9\\u00AB-\\u00AC\\u00AE\\u00B0-\\u00B1\\u00B6\\u00BB\\u00BF\\u00D7\\u00F7\\u2010-\\u2027\\u2030-\\u203E\\u2041-\\u2053\\u2055-\\u205E\\u2190-\\u245F\\u2500-\\u2775\\u2794-\\u2BFF\\u2E00-\\u2E7F\\u3001-\\u3003\\u3008-\\u3020\\u3030\\uFD3E-\\uFD3F\\uFE45-\\uFE46]*)", "yu"),
        oO = function() {
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
                                            location: od(r, this.clonePosition())
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
                                    location: od(i, this.clonePosition())
                                })
                            } else if (60 !== o || this.ignoreTag || 47 !== this.peek())
                                if (60 === o && !this.ignoreTag && oE(this.peek() || 0)) {
                                    var l = this.parseTag(e, t);
                                    if (l.err) return l;
                                    n.push(l.val)
                                } else {
                                    var c = this.parseLiteral(e, t);
                                    if (c.err) return c;
                                    n.push(c.val)
                                }
                            else if (!r) return this.error(26, od(this.clonePosition(), this.clonePosition()));
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
                                location: od(r, this.clonePosition())
                            },
                            err: null
                        };
                        if (!this.bumpIf(">")) return this.error(23, od(r, this.clonePosition()));
                        var o = this.parseMessage(e + 1, t, !0);
                        if (o.err) return o;
                        var a = o.val,
                            i = this.clonePosition();
                        if (!this.bumpIf("</")) return this.error(27, od(r, this.clonePosition()));
                        if (this.isEOF() || !oE(this.char())) return this.error(23, od(i, this.clonePosition()));
                        var l = this.clonePosition();
                        return n !== this.parseTagName() ? this.error(26, od(l, this.clonePosition())) : (this.bumpSpace(), this.bumpIf(">")) ? {
                            val: {
                                type: 8,
                                value: n,
                                children: a,
                                location: od(r, this.clonePosition())
                            },
                            err: null
                        } : this.error(23, od(i, this.clonePosition()))
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
                                location: od(r, this.clonePosition())
                            },
                            err: null
                        }
                    }
                }, {
                    key: "tryParseLeftAngleBracket",
                    value: function() {
                        var e;
                        return this.isEOF() || 60 !== this.char() || !this.ignoreTag && (oE(e = this.peek() || 0) || 47 === e) ? null : (this.bump(), "<")
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
                            if (Array.isArray(e)) return ot(e)
                        }(r) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || oo(r) || function() {
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
                        if (this.bump(), this.bumpSpace(), this.isEOF()) return this.error(1, od(r, this.clonePosition()));
                        if (125 === this.char()) return this.bump(), this.error(2, od(r, this.clonePosition()));
                        var n = this.parseIdentifierIfPossible().value;
                        if (!n) return this.error(3, od(r, this.clonePosition()));
                        if (this.bumpSpace(), this.isEOF()) return this.error(1, od(r, this.clonePosition()));
                        switch (this.char()) {
                            case 125:
                                return this.bump(), {
                                    val: {
                                        type: 1,
                                        value: n,
                                        location: od(r, this.clonePosition())
                                    },
                                    err: null
                                };
                            case 44:
                                if (this.bump(), this.bumpSpace(), this.isEOF()) return this.error(1, od(r, this.clonePosition()));
                                return this.parseArgumentOptions(e, t, n, r);
                            default:
                                return this.error(3, od(r, this.clonePosition()))
                        }
                    }
                }, {
                    key: "parseIdentifierIfPossible",
                    value: function() {
                        var e, t, r = this.clonePosition(),
                            n = this.offset(),
                            o = (e = this.message, og.lastIndex = n, null != (t = og.exec(e)[1]) ? t : ""),
                            a = n + o.length;
                        return this.bumpTo(a), {
                            value: o,
                            location: od(r, this.clonePosition())
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
                                return this.error(4, od(o, i));
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
                                    var f = ov(s.val);
                                    if (0 === f.length) return this.error(6, od(this.clonePosition(), this.clonePosition()));
                                    c = {
                                        style: f,
                                        styleLocation: od(u, this.clonePosition())
                                    }
                                }
                                var d = this.tryParseArgumentClose(n);
                                if (d.err) return d;
                                var p = od(n, this.clonePosition());
                                if (c && c.style.startsWith("::")) {
                                    var h = ob(c.style.slice(2));
                                    if ("number" === a) {
                                        var y = this.parseNumberSkeletonFromString(h, c.styleLocation);
                                        if (y.err) return y;
                                        return {
                                            val: {
                                                type: 2,
                                                value: r,
                                                location: p,
                                                style: y.val
                                            },
                                            err: null
                                        }
                                    }
                                    if (0 === h.length) return this.error(10, p);
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
                                                        return "root" !== n && (t = e.maximize().region), (ou[t || ""] || ou[n || ""] || ou["".concat(n, "-001")] || ou["001"])[0]
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
                                            location: p,
                                            style: {
                                                type: 1,
                                                pattern: b,
                                                location: c.styleLocation,
                                                parsedOptions: this.shouldParseSkeletons ? (m = {}, b.replace(n2, function(e) {
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
                                        location: p,
                                        style: null != (l = null == c ? void 0 : c.style) ? l : null
                                    }, err: null
                                };
                            case "plural":
                            case "selectordinal":
                            case "select":
                                var v = this.clonePosition();
                                if (this.bumpSpace(), !this.bumpIf(",")) return this.error(12, od(v, or({}, v)));
                                this.bumpSpace();
                                var g = this.parseIdentifierIfPossible(),
                                    O = 0;
                                if ("select" !== a && "offset" === g.value) {
                                    if (!this.bumpIf(":")) return this.error(13, od(this.clonePosition(), this.clonePosition()));
                                    this.bumpSpace();
                                    var E = this.tryParseDecimalInteger(13, 14);
                                    if (E.err) return E;
                                    this.bumpSpace(), g = this.parseIdentifierIfPossible(), O = E.val
                                }
                                var w = this.tryParsePluralOrSelectOptions(e, a, t, g);
                                if (w.err) return w;
                                var P = this.tryParseArgumentClose(n);
                                if (P.err) return P;
                                var S = od(n, this.clonePosition());
                                if ("select" === a) return {
                                    val: {
                                        type: 5,
                                        value: r,
                                        options: om(w.val),
                                        location: S
                                    },
                                    err: null
                                };
                                return {
                                    val: {
                                        type: 6,
                                        value: r,
                                        options: om(w.val),
                                        offset: O,
                                        pluralType: "plural" === a ? "cardinal" : "ordinal",
                                        location: S
                                    }, err: null
                                };
                            default:
                                return this.error(5, od(o, i))
                        }
                    }
                }, {
                    key: "tryParseArgumentClose",
                    value: function(e) {
                        return this.isEOF() || 125 !== this.char() ? this.error(1, od(e, this.clonePosition())) : (this.bump(), {
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
                                if (!this.bumpUntil("'")) return this.error(11, od(r, this.clonePosition()));
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
                                var t = e.split(n3).filter(function(e) {
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
                                                    if ("string" == typeof e) return nQ(e, void 0);
                                                    var t = Object.prototype.toString.call(e).slice(8, -1);
                                                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nQ(e, void 0)
                                                }
                                            }(c) || function() {
                                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                            }(),
                                            s = u[0],
                                            f = u.slice(1),
                                            d = !0,
                                            p = !1,
                                            h = void 0;
                                        try {
                                            for (var y, m = f[Symbol.iterator](); !(d = (y = m.next()).done); d = !0) {
                                                var b = y.value;
                                                if (0 === b.length) throw Error("Invalid number skeleton")
                                            }
                                        } catch (e) {
                                            p = !0, h = e
                                        } finally {
                                            try {
                                                d || null == m.return || m.return()
                                            } finally {
                                                if (p) throw h
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
                                                    t = n0(n1(n0({}, t), {
                                                        notation: "scientific"
                                                    }), l.options.reduce(function(e, t) {
                                                        return n0({}, e, oe(t))
                                                    }, {}));
                                                    continue;
                                                case "engineering":
                                                    t = n0(n1(n0({}, t), {
                                                        notation: "engineering"
                                                    }), l.options.reduce(function(e, t) {
                                                        return n0({}, e, oe(t))
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
                                                    l.options[0].replace(n4, function(e, r, n, o, a, i) {
                                                        if (r) t.minimumIntegerDigits = n.length;
                                                        else if (o && a) throw Error("We currently do not support maximum integer digits");
                                                        else if (i) throw Error("We currently do not support exact integer digits");
                                                        return ""
                                                    });
                                                    continue
                                            }
                                            if (n8.test(l.stem)) {
                                                t.minimumIntegerDigits = l.stem.length;
                                                continue
                                            }
                                            if (n6.test(l.stem)) {
                                                if (l.options.length > 1) throw RangeError("Fraction-precision stems only accept a single optional option");
                                                l.stem.replace(n6, function(e, r, n, o, a, i) {
                                                    return "*" === n ? t.minimumFractionDigits = r.length : o && "#" === o[0] ? t.maximumFractionDigits = o.length : a && i ? (t.minimumFractionDigits = a.length, t.maximumFractionDigits = a.length + i.length) : (t.minimumFractionDigits = r.length, t.maximumFractionDigits = r.length), ""
                                                });
                                                var c = l.options[0];
                                                "w" === c ? t = n1(n0({}, t), {
                                                    trailingZeroDisplay: "stripIfInteger"
                                                }) : c && (t = n0({}, t, n7(c)));
                                                continue
                                            }
                                            if (n5.test(l.stem)) {
                                                t = n0({}, t, n7(l.stem));
                                                continue
                                            }
                                            var u = n9(l.stem);
                                            u && (t = n0({}, t, u));
                                            var s = function(e) {
                                                var t;
                                                if ("E" === e[0] && "E" === e[1] ? (t = {
                                                        notation: "engineering"
                                                    }, e = e.slice(2)) : "E" === e[0] && (t = {
                                                        notation: "scientific"
                                                    }, e = e.slice(1)), t) {
                                                    var r = e.slice(0, 2);
                                                    if ("+!" === r ? (t.signDisplay = "always", e = e.slice(2)) : "+?" === r && (t.signDisplay = "exceptZero", e = e.slice(2)), !n8.test(e)) throw Error("Malformed concise eng/scientific notation");
                                                    t.minimumIntegerDigits = e.length
                                                }
                                                return t
                                            }(l.stem);
                                            s && (t = n0({}, t, s))
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
                                    c = od(s, this.clonePosition()), l = this.message.slice(s.offset, this.offset())
                                } else break
                            }
                            if (i.has(l)) return this.error("select" === t ? 21 : 20, c);
                            "other" === l && (o = !0), this.bumpSpace();
                            var d = this.clonePosition();
                            if (!this.bumpIf("{")) return this.error("select" === t ? 17 : 18, od(this.clonePosition(), this.clonePosition()));
                            var p = this.parseMessage(e + 1, t, r);
                            if (p.err) return p;
                            var h = this.tryParseArgumentClose(d);
                            if (h.err) return h;
                            a.push([l, {
                                value: p.val,
                                location: od(d, this.clonePosition())
                            }]), i.add(l), this.bumpSpace(), l = (u = this.parseIdentifierIfPossible()).value, c = u.location
                        }
                        return 0 === a.length ? this.error("select" === t ? 15 : 16, od(this.clonePosition(), this.clonePosition())) : this.requiresOtherClause && !o ? this.error(22, od(this.clonePosition(), this.clonePosition())) : {
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
                        var l = od(n, this.clonePosition());
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

    function oE(e) {
        return e >= 97 && e <= 122 || e >= 65 && e <= 90
    }

    function ow(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function oP(e, t, r) {
        return t = oT(t),
            function(e, t) {
                if (t && ("object" === oM(t) || "function" == typeof t)) return t;
                if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                return e
            }(e, ok() ? Reflect.construct(t, r || [], oT(e).constructor) : t.apply(e, r))
    }

    function oS(e, t) {
        if (!(e instanceof t)) throw TypeError("Cannot call a class as a function")
    }

    function ox(e, t, r) {
        return (ox = ok() ? Reflect.construct : function(e, t, r) {
            var n = [null];
            n.push.apply(n, t);
            var o = new(Function.bind.apply(e, n));
            return r && oC(o, r.prototype), o
        }).apply(null, arguments)
    }

    function oj(e, t) {
        for (var r = 0; r < t.length; r++) {
            var n = t[r];
            n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
        }
    }

    function oI(e, t, r) {
        return t && oj(e.prototype, t), r && oj(e, r), e
    }

    function oA() {
        return (oA = Object.assign || function(e) {
            for (var t = 1; t < arguments.length; t++) {
                var r = arguments[t];
                for (var n in r) Object.prototype.hasOwnProperty.call(r, n) && (e[n] = r[n])
            }
            return e
        }).apply(this, arguments)
    }

    function oT(e) {
        return (oT = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
            return e.__proto__ || Object.getPrototypeOf(e)
        })(e)
    }

    function o_(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");
        e.prototype = Object.create(t && t.prototype, {
            constructor: {
                value: e,
                writable: !0,
                configurable: !0
            }
        }), t && oC(e, t)
    }

    function oN(e) {
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

    function oC(e, t) {
        return (oC = Object.setPrototypeOf || function(e, t) {
            return e.__proto__ = t, e
        })(e, t)
    }

    function oR(e) {
        return function(e) {
            if (Array.isArray(e)) return ow(e)
        }(e) || function(e) {
            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
        }(e) || function(e) {
            if (e) {
                if ("string" == typeof e) return ow(e, void 0);
                var t = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ow(e, void 0)
            }
        }(e) || function() {
            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }

    function oM(e) {
        return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
    }

    function oU(e) {
        var t = "function" == typeof Map ? new Map : void 0;
        return (oU = function(e) {
            if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
            if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
            if (void 0 !== t) {
                if (t.has(e)) return t.get(e);
                t.set(e, r)
            }

            function r() {
                return ox(e, arguments, oT(this).constructor)
            }
            return r.prototype = Object.create(e.prototype, {
                constructor: {
                    value: r,
                    enumerable: !1,
                    writable: !0,
                    configurable: !0
                }
            }), oC(r, e)
        })(e)
    }

    function ok() {
        try {
            var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
        } catch (e) {}
        return (ok = function() {
            return !!e
        })()
    }
    var oD = function(e) {
            function t(e, r, n) {
                var o;
                return oS(this, t), (o = oP(this, t, [e])).code = r, o.originalMessage = n, o
            }
            return o_(t, e), oI(t, [{
                key: "toString",
                value: function() {
                    return "[formatjs Error: ".concat(this.code, "] ").concat(this.message)
                }
            }]), t
        }(oU(Error)),
        oB = function(e) {
            function t(e, r, n, o) {
                return oS(this, t), oP(this, t, ['Invalid values for "'.concat(e, '": "').concat(r, '". Options are "').concat(Object.keys(n).join('", "'), '"'), "INVALID_VALUE", o])
            }
            return o_(t, e), t
        }(oD),
        oL = function(e) {
            function t(e, r, n) {
                return oS(this, t), oP(this, t, ['Value for "'.concat(e, '" must be of type ').concat(r), "INVALID_VALUE", n])
            }
            return o_(t, e), t
        }(oD),
        oH = function(e) {
            function t(e, r) {
                return oS(this, t), oP(this, t, ['The intl string context variable "'.concat(e, '" was not provided to the string "').concat(r, '"'), "MISSING_VALUE", r])
            }
            return o_(t, e), t
        }(oD);

    function oG(e) {
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
    var oF = ((m = function() {
        function e(t) {
            var r, n = this,
                o = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : e.defaultLocale,
                a = arguments.length > 2 ? arguments[2] : void 0,
                i = arguments.length > 3 ? arguments[3] : void 0;
            if (oS(this, e), this.formatterCache = {
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
                            for (var d, p = t[Symbol.iterator](); !(u = (d = p.next()).done); u = !0) {
                                var h = d.value;
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
                                if (!(a && y in a)) throw new oH(y, l);
                                var m = a[y];
                                if (1 === h.type) {
                                    m && "string" != typeof m && "number" != typeof m && (void 0 === m ? "undefined" : oM(m)) !== "bigint" || (m = "string" == typeof m || "number" == typeof m || (void 0 === m ? "undefined" : oM(m)) === "bigint" ? String(m) : ""), c.push({
                                        type: +("string" != typeof m),
                                        value: m
                                    });
                                    continue
                                }
                                if (3 === h.type) {
                                    var b = "string" == typeof h.style ? o.date[h.style] : ol(h.style) ? h.style.parsedOptions : void 0;
                                    c.push({
                                        type: 0,
                                        value: n.getDateTimeFormat(r, b).format(m)
                                    });
                                    continue
                                }
                                if (4 === h.type) {
                                    var v = "string" == typeof h.style ? o.time[h.style] : ol(h.style) ? h.style.parsedOptions : o.time.medium;
                                    c.push({
                                        type: 0,
                                        value: n.getDateTimeFormat(r, v).format(m)
                                    });
                                    continue
                                }
                                if (2 === h.type) {
                                    var g = "string" == typeof h.style ? o.number[h.style] : oi(h.style) ? h.style.parsedOptions : void 0;
                                    if (g && g.scale) {
                                        var O = g.scale || 1;
                                        if ((void 0 === m ? "undefined" : oM(m)) === "bigint") {
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
                                        P = a[w];
                                    if ("function" != typeof P) throw new oL(w, "function", l);
                                    var S = P(e(E, r, n, o, a, i).map(function(e) {
                                        return e.value
                                    }));
                                    Array.isArray(S) || (S = [S]), c.push.apply(c, oR(S.map(function(e) {
                                        return {
                                            type: +("string" != typeof e),
                                            value: e
                                        }
                                    })))
                                }
                                if (5 === h.type) {
                                    var x = m,
                                        j = (Object.prototype.hasOwnProperty.call(h.options, x) ? h.options[x] : void 0) || h.options.other;
                                    if (!j) throw new oB(h.value, m, Object.keys(h.options), l);
                                    c.push.apply(c, oR(e(j.value, r, n, o, a)));
                                    continue
                                }
                                if (6 === h.type) {
                                    var I = "=".concat(m),
                                        A = Object.prototype.hasOwnProperty.call(h.options, I) ? h.options[I] : void 0;
                                    if (!A) {
                                        if (!Intl.PluralRules) throw new oD('Intl.PluralRules is not available in this environment.\nTry polyfilling it using "@formatjs/intl-pluralrules"\n', "MISSING_INTL_API", l);
                                        var T = (void 0 === m ? "undefined" : oM(m)) === "bigint" ? Number(m) : m,
                                            _ = n.getPluralRules(r, {
                                                type: h.pluralType
                                            }).select(T - (h.offset || 0));
                                        A = (Object.prototype.hasOwnProperty.call(h.options, _) ? h.options[_] : void 0) || h.options.other
                                    }
                                    if (!A) throw new oB(h.value, m, Object.keys(h.options), l);
                                    var N = (void 0 === m ? "undefined" : oM(m)) === "bigint" ? Number(m) : m;
                                    c.push.apply(c, oR(e(A.value, r, n, o, a, N - (h.offset || 0))));
                                    continue
                                }
                            }
                        } catch (e) {
                            s = !0, f = e
                        } finally {
                            try {
                                u || null == p.return || p.return()
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
                    }(u), oA({}, u));
                this.ast = e.__parse(t, (l = oN({}, s), c = c = {
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
                return e[t] = (n = r[t], (o = a[t]) ? oN({}, n, o, Object.keys(n).reduce(function(e, t) {
                    return e[t] = oN({}, n[t], o[t]), e
                }, {})) : n), e
            }, oN({}, r)) : r), this.formatters = i && i.formatters || function() {
                var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {
                    number: {},
                    dateTime: {},
                    pluralRules: {}
                };
                return {
                    getNumberFormat: nk(function() {
                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                        return ox(Intl.NumberFormat, oR(t))
                    }, {
                        cache: oG(e.number),
                        strategy: nF.variadic
                    }),
                    getDateTimeFormat: nk(function() {
                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                        return ox(Intl.DateTimeFormat, oR(t))
                    }, {
                        cache: oG(e.dateTime),
                        strategy: nF.variadic
                    }),
                    getPluralRules: nk(function() {
                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                        return ox(Intl.PluralRules, oR(t))
                    }, {
                        cache: oG(e.pluralRules),
                        strategy: nF.variadic
                    })
                }
            }(this.formatterCache)
        }
        return oI(e, null, [{
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
            r = new oO(e, t = or({
                shouldParseSkeletons: !0,
                requiresOtherClause: !0
            }, t)).parse();
        if (r.err) {
            var n = SyntaxError(oa[r.err.kind]);
            throw n.location = r.err.location, n.originalMessage = r.err.message, n
        }
        return (null == t ? void 0 : t.captureLocation) || function e(t) {
            t.forEach(function(t) {
                if (delete t.location, 5 === t.type || 6 === t.type)
                    for (var r in t.options) delete t.options[r].location, e(t.options[r].value);
                else 2 === t.type && oi(t.style) || (3 === t.type || 4 === t.type) && ol(t.style) ? delete t.style.location : 8 === t.type && e(t.children)
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

    function oV(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function oW(e) {
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

    function oX(e, t) {
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

    function oK(e, t) {
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
                if ("string" == typeof e) return oV(e, t);
                var r = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oV(e, t)
            }
        }(e, t) || function() {
            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }

    function oz() {
        for (var e, t, r, n, o, a = arguments.length, i = Array(a), l = 0; l < a; l++) i[l] = arguments[l];
        var c = oK(i, 4),
            u = (c[0], c[1]),
            s = c[2],
            f = c[3];
        if (Array.isArray(u)) throw new nZ(nq.INVALID_MESSAGE, void 0);
        if ("object" == (void 0 === u ? "undefined" : u && "u" > typeof Symbol && u.constructor === Symbol ? "symbol" : typeof u)) throw new nZ(nq.INSUFFICIENT_PATH, void 0);
        if ("string" == typeof u) {
            var d = s || /'[{}<#|']/.test(u) ? void 0 : u;
            if (d) return d
        }
        var p = f.cache,
            h = f.formats,
            y = f.formatters,
            m = f.globalFormats,
            b = f.locale,
            v = f.timeZone;
        y.getMessageFormat || (y.getMessageFormat = n$(function() {
            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
            return new oF(t[0], t[1], t[2], oW({
                formatters: y
            }, t[3]))
        }, p.message));
        try {
            o = y.getMessageFormat(u, b, (e = oF.formats.date, t = oF.formats.time, r = oW({}, null == m ? void 0 : m.dateTime, null == h ? void 0 : h.dateTime), n = {
                date: oW({}, e, r),
                time: oW({}, t, r),
                number: oW({}, null == m ? void 0 : m.number, null == h ? void 0 : h.number)
            }, v && ["date", "time"].forEach(function(e) {
                var t = n[e],
                    r = !0,
                    o = !1,
                    a = void 0;
                try {
                    for (var i, l = Object.entries(t)[Symbol.iterator](); !(r = (i = l.next()).done); r = !0) {
                        var c = oK(i.value, 2),
                            u = c[0],
                            s = c[1];
                        t[u] = oW({
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
                formatters: oX(oW({}, y), {
                    getDateTimeFormat: function(e, t) {
                        var r;
                        return y.getDateTimeFormat(e, oX(oW({}, t), {
                            timeZone: null != (r = null == t ? void 0 : t.timeZone) ? r : v
                        }))
                    }
                })
            })
        } catch (e) {
            throw new nZ(nq.INVALID_MESSAGE, void 0)
        }
        var g = o.format(s);
        return (0, eN.isValidElement)(g) || Array.isArray(g) || "string" == typeof g ? g : String(g)
    }

    function oY(e, t) {
        return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
    }

    function oZ(e) {
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

    function oq(e, t) {
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

    function o$() {
        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
        return t.filter(Boolean).join(".")
    }

    function oJ(e) {
        return o$(e.namespace, e.key)
    }

    function oQ(e) {
        console.error(e)
    }

    function o0(e, t, r, n) {
        var o = o$(n, r);
        if (!t) throw Error(o);
        var a = t;
        return r.split(".").forEach(function(t) {
            var r = a[t];
            if (null == t || null == r) throw Error(o + " (".concat(e, ")"));
            a = r
        }), a
    }
    oz.raw = !0;
    var o1 = (0, eN.createContext)(void 0);

    function o2(e) {
        var t = e.children,
            r = e.formats,
            n = e.getMessageFallback,
            o = e.locale,
            a = e.messages,
            i = e.now,
            l = e.onError,
            c = e.timeZone,
            u = (0, eN.useContext)(o1),
            s = (0, eN.useMemo)(function() {
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
            f = (0, eN.useMemo)(function() {
                return (null == u ? void 0 : u.formatters) || {
                    getDateTimeFormat: nJ(Intl.DateTimeFormat, s.dateTime),
                    getNumberFormat: nJ(Intl.NumberFormat, s.number),
                    getPluralRules: nJ(Intl.PluralRules, s.pluralRules),
                    getRelativeTimeFormat: nJ(Intl.RelativeTimeFormat, s.relativeTime),
                    getListFormat: nJ(Intl.ListFormat, s.list),
                    getDisplayNames: nJ(Intl.DisplayNames, s.displayNames)
                }
            }, [s, null == u ? void 0 : u.formatters]),
            d = (0, eN.useMemo)(function() {
                var e, t, d, p, h, y, m;
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
                }).formats, d = e.getMessageFallback, p = e.messages, h = e.onError, oq(oZ({}, function(e, t) {
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
                    messages: p || void 0,
                    onError: h || oQ,
                    getMessageFallback: d || oJ
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
        return (0, eD.jsx)(o1.Provider, {
            value: d,
            children: t
        })
    }

    function o3() {
        var e = (0, eN.useContext)(o1);
        if (!e) throw Error(void 0);
        return e
    }
    var o6 = !1,
        o5 = "u" < typeof window,
        o4 = window.Roblox["core-lib"].index;

    function o8(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function o7(e) {
        return function(e) {
            if (Array.isArray(e)) return o8(e)
        }(e) || function(e) {
            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
        }(e) || function(e) {
            if (e) {
                if ("string" == typeof e) return o8(e, void 0);
                var t = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return o8(e, void 0)
            }
        }(e) || function() {
            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }
    o7(["ar-001", "de-de", "en-us", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn", "zh-cn", "zh-tw"]).concat(o7(["bg-bg", "bn-bd", "bs-ba", "cs-cz", "da-dk", "el-gr", "en-gb", "es-mx", "et-ee", "fi-fi", "fil-ph", "fr-ca", "hr-hr", "hu-hu", "ka-ge", "kk-kz", "km-kh", "lt-lt", "lv-lv", "ms-my", "my-mm", "nb-no", "nl-nl", "pt-pt", "ro-ro", "ru-ru", "si-lk", "sk-sk", "sl-sl", "sq-al", "sr-rs", "sv-se", "uk-ua"]));
    var o9 = o7(["ar_001", "de_de", "en_us", "es_es", "fr_fr", "hi_in", "id_id", "it_it", "ja_jp", "ko_kr", "pl_pl", "pt_br", "th_th", "tr_tr", "vi_vn", "zh_cn", "zh_tw"]).concat(o7(["bg_bg", "bn_bd", "bs_ba", "cs_cz", "da_dk", "el_gr", "en_gb", "es_mx", "et_ee", "fi_fi", "fil_ph", "fr_ca", "hr_hr", "hu_hu", "ka_ge", "kk_kz", "km_kh", "lt_lt", "lv_lv", "ms_my", "my_mm", "nb_no", "nl_nl", "pt_pt", "ro_ro", "ru_ru", "si_lk", "sk_sk", "sl_sl", "sq_al", "sr_rs", "sv_se", "uk_ua"])),
        ae = o7(["ar-001", "de-DE", "en-US", "es-ES", "fr-FR", "hi-IN", "id-ID", "it-IT", "ja-JP", "ko-KR", "pl-PL", "pt-BR", "th-TH", "tr-TR", "vi-VN", "zh-CN", "zh-TW"]).concat(o7(["bg-BG", "bn-BD", "bs-BA", "cs-CZ", "da-DK", "el-GR", "en-GB", "es-MX", "et-EE", "fi-FI", "fil-PH", "fr-CA", "hr-HR", "hu-HU", "ka-GE", "kk-KZ", "km-KH", "lt-LT", "lv-LV", "ms-MY", "my-MM", "nb-NO", "nl-NL", "pt-PT", "ro-RO", "ru-RU", "si-LK", "sk-SK", "sl-SL", "sq-AL", "sr-RS", "sv-SE", "uk-UA"]));

    function at() {
        var e, t;
        return null != (e = null != (t = function() {
            if (!("u" < typeof document)) {
                var e = document.documentElement.lang;
                if (e) return (0, o4.arrayIncludes)(ae, e) ? e.toLowerCase() : void 0
            }
        }()) ? t : function() {
            if ("u" < typeof document) return;
            var e, t = document.querySelector('meta[name="locale-data"]');
            if (null != (e = HTMLMetaElement) && "u" > typeof Symbol && e[Symbol.hasInstance] ? e[Symbol.hasInstance](t) : t instanceof e) {
                var r = t.dataset.languageCode;
                if (r && (0, o4.arrayIncludes)(o9, r)) return r.replace("_", "-")
            }
        }()) ? e : "en-us"
    }
    o7(["ar", "de", "es", "fr", "hi", "id", "it", "ja", "ko", "pl", "pt", "th", "tr", "vi"]).concat(o7(["ar-001", "de-de", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn"]));
    var ar = function(e) {
        return e.replaceAll(".", ":")
    };

    function an(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }
    var ao = function() {
            if ("u" < typeof window) return {};
            var e = window.Roblox;
            return null != e ? e : {}
        },
        aa = function(e) {
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
                            if ("string" == typeof e) return an(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return an(e, 2)
                        }
                    }(e) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    r = t[0],
                    n = t[1];
                return null == n ? [] : [
                    [ar(r), n]
                ]
            }))
        },
        ai = function(e) {
            var t = ao(),
                r = t.Lang,
                n = t.LangDynamic,
                o = t.LangDynamicDefault;
            return Object.fromEntries(e.map(function(e) {
                return [ar(e), function(e) {
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
                }({}, aa(null == o ? void 0 : o[e]), aa(null == r ? void 0 : r[e]), aa(null == n ? void 0 : n[e]))]
            }))
        },
        al = function(e) {
            var t = e.namespaces,
                r = e.locale,
                n = e.children,
                o = t.join(","),
                a = (0, eN.useMemo)(function() {
                    return ai(t)
                }, [o]);
            return (0, eD.jsx)(o2, {
                locale: null != r ? r : at(),
                messages: a,
                children: n
            })
        },
        ac = (0, eN.createContext)(void 0),
        au = function(e) {
            var t = e.useTranslate;
            return (0, e.render)(t())
        },
        as = function(e) {
            var t = e.translate,
                r = e.namespaces,
                n = e.useTranslate,
                o = e.render,
                a = null != t ? t : (0, eN.useContext)(ac);
            return a ? (0, eD.jsx)(ac.Provider, {
                value: a,
                children: o(a)
            }) : (0, eD.jsx)(al, {
                namespaces: r,
                children: (0, eD.jsx)(au, {
                    useTranslate: n,
                    render: o
                })
            })
        };

    function af(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }
    var ad = "__FN_nvfToKPAOuiV__",
        ap = new RegExp("".concat(ad, "(\\d+)\\|")),
        ah = function(e, t, r) {
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
                    a = "".concat(ad).concat(r, "|"),
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
                        r = ap.exec(e);
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
                            if (Array.isArray(e)) return af(e)
                        }(u) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(u) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return af(e, void 0);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return af(e, void 0)
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
                return (0, eD.jsx)(eN.Fragment, {
                    children: e
                }, t)
            })
        };

    function ay(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function am(e) {
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

    function ab(e, t) {
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

    function av(e, t) {
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
                if ("string" == typeof e) return ay(e, t);
                var r = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ay(e, t)
            }
        }(e, t) || function() {
            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }

    function ag(e, t, r, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, o)
    }

    function aO() {
        return null != b || (b = "".concat(eu().apiGatewayUrl.replace(/\/$/, ""), "/experience-signals-ingest/public")), b
    }
    var aE = function() {};

    function aw(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function aP(e) {
        return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
    }
    var aS = function(e, t) {
            return e << 3 | t
        },
        ax = aS(1, 2),
        aj = aS(2, 2),
        aI = aS(5, 2),
        aA = aS(6, 2),
        aT = aS(8, 2),
        a_ = aS(1, 2),
        aN = aS(2, 1),
        aC = aS(3, 0),
        aR = aS(5, 2);
    aS(1, 2), aS(2, 1), aS(3, 0), aS(4, 2), aS(5, 2), aS(6, 0), aS(8, 2);
    var aM = aS(4, 0),
        aU = aS(6, 2),
        ak = aS(7, 2);
    aS(1, 0), aS(2, 2);
    var aD = aS(1, 2),
        aB = aS(2, 2),
        aL = aS(1, 2);
    aS(1, 2), aS(2, 2), aS(1, 2);
    var aH = new TextEncoder,
        aG = function() {
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
                        var t = (void 0 === e ? "undefined" : aP(e)) === "bigint" ? e : BigInt(Math.trunc(e));
                        for (t < BigInt(0) && (t += BigInt(1) << BigInt(64)); t > BigInt(127);) this.buf.push(128 | Number(t & BigInt(127))), t >>= BigInt(7);
                        this.buf.push(Number(t))
                    }
                }, {
                    key: "writeString",
                    value: function(e) {
                        var t = aH.encode(e);
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

    function aF(e, t, r) {
        var n = new aG;
        return n.writeVarint(aS(1, 2)), n.writeString(e), n.writeVarint(t), r(n), n.toBytes()
    }

    function aV(e) {
        var t = new aG;
        if (t.writeVarint(a_), t.writeString(e.name), t.writeVarint(aN), t.writeDouble(e.value), t.writeVarint(aC), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
            var r = function(e) {
                var t = new aG,
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
                                    if ("string" == typeof e) return aw(e, 2);
                                    var t = Object.prototype.toString.call(e).slice(8, -1);
                                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return aw(e, 2)
                                }
                            }(e) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }()),
                            n = r[0],
                            o = r[1];
                        if ("string" == typeof o) {
                            var i = aF(n, aS(2, 2), function(e) {
                                e.writeString(o)
                            });
                            t.writeVarint(aI), t.writeBytes(i)
                        } else if ("boolean" == typeof o) {
                            var l = aF(n, aS(2, 0), function(e) {
                                e.writeVarint(+!!o)
                            });
                            t.writeVarint(aA), t.writeBytes(l)
                        } else if ((void 0 === o ? "undefined" : aP(o)) === "bigint") {
                            var c = aF(n, aS(2, 0), function(e) {
                                e.writeVarint(o)
                            });
                            t.writeVarint(aj), t.writeBytes(c)
                        } else if ("number" == typeof o)
                            if (Number.isFinite(o))
                                if (Number.isInteger(o) && o >= -0x80000000 && o <= 0x7fffffff) {
                                    var u = aF(n, aS(2, 0), function(e) {
                                        e.writeVarint(o)
                                    });
                                    t.writeVarint(ax), t.writeBytes(u)
                                } else if (Number.isInteger(o)) {
                            var s = aF(n, aS(2, 0), function(e) {
                                e.writeVarint(BigInt(o))
                            });
                            t.writeVarint(aj), t.writeBytes(s)
                        } else {
                            var f = aF(n, aS(2, 1), function(e) {
                                e.writeDouble(o)
                            });
                            t.writeVarint(aT), t.writeBytes(f)
                        } else {
                            var d = aF(n, aS(2, 2), function(e) {
                                e.writeString(String(o))
                            });
                            t.writeVarint(aI), t.writeBytes(d)
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
            t.writeVarint(aR), t.writeBytes(r)
        }
        return t.toBytes()
    }

    function aW(e, t, r) {
        var n = new aG;
        n.writeVarint(aM), n.writeVarint(r);
        var o = !0,
            a = !1,
            i = void 0;
        try {
            for (var l, c = e[Symbol.iterator](); !(o = (l = c.next()).done); o = !0) {
                var u = l.value;
                n.writeVarint(aU), n.writeBytes(u)
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
            d = void 0;
        try {
            for (var p, h = t[Symbol.iterator](); !(s = (p = h.next()).done); s = !0) {
                var y = p.value;
                n.writeVarint(ak), n.writeBytes(y)
            }
        } catch (e) {
            f = !0, d = e
        } finally {
            try {
                s || null == h.return || h.return()
            } finally {
                if (f) throw d
            }
        }
        return n.toBytes()
    }

    function aX(e) {
        var t = new aG;
        t.writeVarint(aD), t.writeString("eventstream.enginetelemetry.EngineTelemetryBatchEvent"), t.writeVarint(aB), t.writeBytes(e);
        var r = t.toBytes(),
            n = new aG;
        return n.writeVarint(aL), n.writeBytes(r), n.toBytes()
    }
    var aK = /^[a-zA-Z_][a-zA-Z0-9_]*$/;

    function az(e) {
        return aK.test(e)
    }
    var aY = [],
        aZ = !1,
        aq = !1;

    function a$(e, t) {
        var r, n, o, a = e.map(function(e) {
                return {
                    name: e.name,
                    value: e.value,
                    timestampMs: e.timestampMs,
                    attributes: e.attributes
                }
            }),
            i = BigInt(Date.now());
        !0 === t || aq || "u" > typeof document && "hidden" === document.visibilityState ? (r = aX(aW(a.map(aV), [], i)).buffer, fetch("".concat(aO()).concat("/v1/events/single"), {
            method: "POST",
            headers: {
                "Content-Type": "application/x-protobuf"
            },
            body: r,
            credentials: "include",
            keepalive: !0
        }).catch(aE)) : (n = aX(aW(a.map(aV), [], i)), (o = function() {
            var e, t, r, o, a, i, l, c, u, s, f, d, p;
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
                        return (t = (e = new CompressionStream("gzip")).writable.getWriter()).write(n).catch(aE), t.close().catch(aE), r = [], [4, (o = e.readable.getReader()).read()];
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
                            for (f = r[Symbol.iterator](); !(c = (d = f.next()).done); c = !0) p = d.value, i.set(p, l), l += p.length
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
                    ag(a, r, n, i, l, "next", e)
                }

                function l(e) {
                    ag(a, r, n, i, l, "throw", e)
                }
                i(void 0)
            })
        })()).then(function(e) {
            var t = e.body,
                r = e.compressed,
                n = {
                    "Content-Type": "application/x-protobuf"
                };
            return r && (n["Content-Encoding"] = "gzip"), fetch("".concat(aO()).concat("/v1/events/single"), {
                method: "POST",
                headers: n,
                body: t,
                credentials: "include",
                keepalive: !0
            })
        }).catch(aE)
    }

    function aJ() {
        var e = !0,
            t = !1,
            r = void 0;
        try {
            for (var n, o = aY[Symbol.iterator](); !(e = (n = o.next()).done); e = !0) {
                var a = n.value.splice(0);
                0 !== a.length && a$(a, !0)
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
    var aQ = "WwwCommon",
        a0 = function(e) {
            var t = e.publish,
                r = e.captureException,
                n = e.featureName;

            function o(e, t, o) {
                if (null != o) {
                    var a, i = (null != (a = Error) && "u" > typeof Symbol && a[Symbol.hasInstance] ? !!a[Symbol.hasInstance](o) : o instanceof a) ? o.name || "Error" : "UnknownError",
                        l = n ? "".concat(n, "_").concat(e) : e;
                    return null == r || r(o, {
                        error_counter: l
                    }), ab(am({}, t), {
                        errorType: i
                    })
                }
                return t
            }
            return {
                trackCounter: function() {
                    for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                    var o = av(r, 2);
                    t(o[0], o[1])
                },
                trackError: function() {
                    for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                    var a = av(r, 3),
                        i = a[0],
                        l = a[1],
                        c = a[2],
                        u = o(i, ab(am({}, null != l ? l : {}), {
                            severity: "error"
                        }), c);
                    t(i, u)
                },
                trackCriticalError: function() {
                    for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                    var a = av(r, 3),
                        i = a[0],
                        l = a[1],
                        c = a[2],
                        u = o(i, ab(am({}, null != l ? l : {}), {
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
                if (!az(e)) return o('@rbx/web-telemetry: invalid featureName "'.concat(e, '"'), {
                        name: e
                    }),
                    function() {};
                var a = [];
                return aY.push(a), aZ || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                        "hidden" === document.visibilityState && aJ()
                    }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                        aq = !0, aJ()
                    }), aZ = !0),
                    function(i, l, c) {
                        var u = "".concat(e, "_").concat(i);
                        if (! function(e, t) {
                                if (!az(e)) return !1;
                                if (t) {
                                    var r = !0,
                                        n = !1,
                                        o = void 0;
                                    try {
                                        for (var a, i = Object.keys(t)[Symbol.iterator](); !(r = (a = i.next()).done); r = !0) {
                                            var l = a.value;
                                            if (!az(l)) return !1
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
                        }), a.length >= r ? (void 0 !== t && (clearTimeout(t), t = void 0), a$(a.splice(0, r))) : void 0 === t && (t = setTimeout(function() {
                            for (t = void 0; a.length > 0;) a$(a.splice(0, r))
                        }, n))
                    }
            }(aQ)
        });
    a0.trackCounter;
    var a1 = a0.trackError;
    a0.trackCriticalError;
    var a2 = function() {
            if ("u" > typeof document) {
                var e = document.querySelector('meta[name="page-meta"]');
                return null == e ? void 0 : e.dataset.internalPageName
            }
        },
        a3 = function(e, t, r) {
            var n;
            "u" > typeof window && a1(e, {
                key: r,
                namespace: t,
                internalPageName: null != (n = a2()) ? n : "unknown"
            })
        },
        a6 = function(e) {
            var t, r, n, o, a, i, l, c, u, s, f, d, p, h = (t = ar(e), r = {
                "!": o3().messages
            }, n = t ? "!.".concat(t) : "!", a = (o = o3()).cache, i = o.formats, l = o.formatters, c = o.getMessageFallback, u = o.locale, s = o.onError, f = o.timeZone, d = r["!"], p = "!" === n ? void 0 : n.slice(2), f || o6 || !o5 || (o6 = !0, s(new nZ(nq.ENVIRONMENT_FALLBACK, void 0))), (0, eN.useMemo)(function() {
                var e, t;
                return t = function(e, t, r) {
                        try {
                            if (!t) throw Error(void 0);
                            var n = r ? o0(e, t, r) : t;
                            if (!n) throw Error(r);
                            return n
                        } catch (e) {
                            return new nZ(nq.MISSING_MESSAGE, e.message)
                        }
                    }((e = {
                        cache: a,
                        formatters: l,
                        getMessageFallback: c,
                        messages: d,
                        namespace: p,
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
                            a = void 0 === o ? oJ : o,
                            i = e.locale,
                            l = e.messagesOrError,
                            c = e.namespace,
                            u = e.onError,
                            s = e.timeZone,
                            f = oY(l, nZ);

                        function d(e, t, r, n) {
                            var o = new nZ(t, r);
                            return u(o), null != n ? n : a({
                                error: o,
                                key: e,
                                namespace: c
                            })
                        }

                        function p(e, o, p, h) {
                            var y, m, b;
                            if (f) {
                                if (!h) return u(l), a({
                                    error: l,
                                    key: e,
                                    namespace: c
                                });
                                y = h
                            } else try {
                                y = o0(i, l, e, c)
                            } catch (t) {
                                if (!h) return d(e, nq.MISSING_MESSAGE, t.message, h);
                                y = h
                            }
                            try {
                                var v, g = o$(c, e);
                                return oz(g, y, o ? (v = {}, Object.keys(o).forEach(function(e) {
                                    var t, r = 0,
                                        n = o[e];
                                    t = "function" == typeof n ? function(t) {
                                        var o = n(t);
                                        return (0, eN.isValidElement)(o) ? (0, eN.cloneElement)(o, {
                                            key: e + r++
                                        }) : o
                                    } : n, v[e] = t
                                }), v) : o, {
                                    cache: t,
                                    formatters: n,
                                    globalFormats: r,
                                    formats: p,
                                    locale: i,
                                    timeZone: s
                                })
                            } catch (t) {
                                return oY(t, nZ) ? (m = t.code, b = t.originalMessage) : (m = nq.FORMATTING_ERROR, b = t.message), d(e, m, b, h)
                            }
                        }

                        function h(e, t, r, n) {
                            var o = p(e, t, r, n);
                            return "string" != typeof o ? d(e, nq.INVALID_MESSAGE, void 0) : o
                        }
                        return h.rich = p, h.markup = function(e, t, r, n) {
                            return p(e, t, r, n)
                        }, h.raw = function(e) {
                            if (f) return u(l), a({
                                error: l,
                                key: e,
                                namespace: c
                            });
                            try {
                                return o0(i, l, e, c)
                            } catch (t) {
                                return d(e, nq.MISSING_MESSAGE, t.message)
                            }
                        }, h.has = function(e) {
                            if (f) return !1;
                            try {
                                return o0(i, l, e, c), !0
                            } catch (e) {
                                return !1
                            }
                        }, h
                    }(oq(oZ({}, e), {
                        messagesOrError: t
                    }))
            }, [a, l, c, d, p, s, i, u, f]));
            return (0, eN.useMemo)(function() {
                return Object.assign(function(t, r, n) {
                    var o = ar(t);
                    return void 0 === n || h.has(o) ? h(o, r) : (a3("TranslationKeyNotFound", e, o), n)
                }, {
                    rich: function(e, t) {
                        return h.rich(ar(e), t)
                    },
                    has: function(e) {
                        return h.has(ar(e))
                    },
                    dynamic: function(t, r) {
                        var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "",
                            o = ar(t),
                            a = h.has(o);
                        return a || a3("TranslationKeyNotFound", e, o), a ? h(o, r) : n
                    },
                    html: function(t, r, n) {
                        var o = ar(t);
                        if (!h.has(o)) return a3("TranslationKeyNotFound", e, o), null;
                        var a = ah(function(e) {
                            return h(o, e)
                        }, r, n);
                        return null == a && a3("TranslationMalformed", e, o), a
                    }
                })
            }, [h, e])
        },
        a5 = function(e) {
            return e
        },
        a4 = ["Purchasing.PurchaseDialog", "Authentication.TwoStepVerification", "Feature.RobloxSubscription", "Feature.NotApproved", "IAPExperience.PurchaseError"].map(a5);
    ["Feature.Item", "CommonUI.Messages"].map(a5), ["Feature.ItemModel"].map(a5);
    var a8 = function() {
        var e;
        return e = [a6(a5("Purchasing.PurchaseDialog")), a6(a5("Authentication.TwoStepVerification")), a6(a5("Feature.RobloxSubscription")), a6(a5("Feature.NotApproved")), a6(a5("IAPExperience.PurchaseError"))],
            function(t, r) {
                var n = e.find(function(e) {
                    return e.has(t)
                });
                return n ? n(t, r) : ""
            }
    };

    function a7(e) {
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

    function a9(e, t) {
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
    var ie = function(e, t) {
            return t ? (0, eD.jsx)("div", {
                dangerouslySetInnerHTML: {
                    __html: e
                }
            }) : (0, eD.jsx)("div", {
                children: e
            })
        },
        it = function(e) {
            var t = e.titleText,
                r = e.bodyContent,
                n = e.footerText,
                o = e.imageUrl,
                a = e.acceptText,
                i = e.declineText,
                l = e.showDecline,
                c = e.hasCloseAffordance,
                u = void 0 !== c && c,
                s = e.dismissable,
                f = void 0 === s || s,
                d = e.allowHtmlContentInBody,
                p = e.allowHtmlContentInFooter,
                h = e.onAccept,
                y = e.onDecline,
                m = e.onCancel,
                b = e.translate,
                v = function(e) {
                    f || e.preventDefault()
                };
            return (0, eD.jsx)(ni, {
                open: !0,
                onOpenChange: function(e) {
                    e || m()
                },
                isModal: !0,
                size: "Medium",
                hasCloseAffordance: u,
                closeLabel: b("Action.Close") || "Close",
                children: (0, eD.jsxs)(nl, a9(a7({
                    className: "relative width-full"
                }, {
                    onEscapeKeyDown: v,
                    onPointerDownOutside: v
                }), {
                    children: [(0, eD.jsxs)(nc, {
                        className: "purchase-dialog-body gap-large flex flex-col",
                        children: [(0, eD.jsx)(nu, {
                            className: u ? "purchase-dialog-title-with-close text-heading-medium" : "text-heading-medium",
                            children: t
                        }), o && (0, eD.jsx)("div", {
                            className: "flex justify-center",
                            children: (0, eD.jsx)("img", {
                                className: "modal-thumb",
                                src: o,
                                alt: ""
                            })
                        }), r && ie(r, d)]
                    }), (0, eD.jsxs)(ns, {
                        className: "gap-small flex flex-col",
                        children: [(0, eD.jsxs)("div", {
                            className: "gap-small flex flex-row-reverse",
                            children: [(0, eD.jsx)(nU, {
                                variant: "Emphasis",
                                className: "fill basis-0",
                                onClick: h,
                                children: a
                            }), (void 0 === l || l) && i && (0, eD.jsx)(nU, {
                                variant: "Standard",
                                className: "fill basis-0",
                                onClick: y,
                                children: i
                            })]
                        }), (null == n ? void 0 : n.trim()) && (0, eD.jsx)("div", {
                            className: "text-footer text-center",
                            children: ie(n, p)
                        })]
                    })]
                }))
            })
        },
        ir = function(e) {
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
            return (0, eD.jsx)(as, {
                translate: t,
                namespaces: a4,
                useTranslate: a8,
                render: function(e) {
                    return (0, eD.jsx)(it, a9(a7({}, r), {
                        translate: e
                    }))
                }
            })
        };

    function io() {
        null == v || v()
    }

    function ia(e) {
        if (io(), ek) {
            var t = ek.createElement("div");
            ek.body.appendChild(t);
            var r = function() {
                v === r && (v = void 0, eM().unmountComponentAtNode(t), t.remove())
            };
            v = r, eM().render(eC().createElement(ir, {
                titleText: e.titleText,
                bodyContent: e.bodyContent,
                footerText: e.footerText,
                imageUrl: e.imageUrl,
                acceptText: e.acceptText,
                declineText: e.declineText,
                showDecline: e.showDecline,
                hasCloseAffordance: e.xToCancel,
                dismissable: e.dismissable,
                allowHtmlContentInBody: e.allowHtmlContentInBody,
                allowHtmlContentInFooter: e.allowHtmlContentInFooter,
                onAccept: function() {
                    var t, n;
                    if (e.fieldValidationRequired) {
                        (null == (n = e.onAccept) ? void 0 : n.call(e)) !== !1 && r();
                        return
                    }
                    r(), null == (t = e.onAccept) || t.call(e)
                },
                onDecline: function() {
                    var t;
                    r(), null == (t = e.onDecline) || t.call(e)
                },
                onCancel: function() {
                    var t;
                    r(), null == (t = e.onCancel) || t.call(e)
                }
            }), t)
        }
    }
    var ii = window.Roblox["core-lib"].http.index,
        il = window.Roblox["core-lib"].url.index,
        ic = function() {
            return il.Url.parse(eu().metricsApi).getOrThrow().withPath("/v1/games/report-event")
        },
        iu = function(e, t, r) {
            try {
                ii.postUntyped(e().withSearchParams(function(e) {
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
                    name: t
                }, r)), "", {
                    credentials: "include",
                    keepalive: !0,
                    signal: AbortSignal.timeout(3e4)
                })
            } catch (e) {}
        },
        is = function() {
            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
            t.forEach(function(e) {
                iu(ic, e)
            })
        };

    function id(e) {
        is("WebCatalog" + e)
    }

    function ip(e, t) {
        t === R || "Package" === t ? is("WebBundle" + e) : t === C ? is("WebGamePass" + e) : t ? id(e) : id("UnknownErrorNoAsset")
    }

    function ih(e, t, r, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, o)
    }

    function iy(e) {
        x().sendUserPurchaseFlowEvent(x().ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, x().ENUM_VIEW_NAME.PURCHASE_WARNING, x().ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN, e)
    }

    function im(e, t, r, n, o) {
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
                var c, u, s, f, d, p;
                switch (l.label) {
                    case 0:
                        if (!t) return r(), [2, Promise.resolve()];
                        l.label = 1;
                    case 1:
                        return l.trys.push([1, 3, , 4]), [4, (c = e.roblox_product_id, (u = function() {
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
                                        t = {
                                            productId: c,
                                            is13To17ScaryModalEnabled: !(null == (e = eO()) ? void 0 : e.isPremiumUser)
                                        }, r = {
                                            url: "".concat(ec.EnvironmentUrls.apiGatewayUrl).concat("/purchase-warning/v1/purchase-warnings"),
                                            withCredentials: !0,
                                            timeout: 5e3
                                        }, o.label = 1;
                                    case 1:
                                        return o.trys.push([1, 3, , 4]), [4, el.get(r, t)];
                                    case 2:
                                        if (200 !== (n = o.sent()).status || !n.data.action) return [2, Promise.resolve("NoAction")];
                                        return [2, Promise.resolve(n.data.action)];
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
                                var o = u.apply(e, t);

                                function a(e) {
                                    eA(o, r, n, a, i, "next", e)
                                }

                                function i(e) {
                                    eA(o, r, n, a, i, "throw", e)
                                }
                                a(void 0)
                            })
                        })())];
                    case 2:
                        return (a = l.sent()) === W || a === X || a === K || a === z ? (a === W ? (iy(x().ENUM_VIEW_MESSAGE.U13_PAYMENT_MODAL), ip("ShowU13PaymentModal", null == o ? void 0 : o.assetType)) : a === K ? (iy(x().ENUM_VIEW_MESSAGE.U13_MONTHLY_THRESHOLD_1_MODAL), ip("ShowU13MonthlyThreshold1Modal", null == o ? void 0 : o.assetType)) : a === z ? (iy(x().ENUM_VIEW_MESSAGE.U13_MONTHLY_THRESHOLD_2_MODAL), ip("ShowU13MonthlyThreshold2Modal", null == o ? void 0 : o.assetType)) : (iy(x().ENUM_VIEW_MESSAGE.PAYMENT_MODAL_13_TO_17), ip("ShowParentalConsentWarningPaymentModal13To17Modal", null == o ? void 0 : o.assetType)), s = n.getTranslationResource(N), f = n.getTranslationResource(_), d = {
                            lineBreak: "<br /><br />",
                            linebreak: "<br /><br />"
                        }, p = "", a === W ? p = s.get("Description.ScaryModalBodyNew", d) : a === X ? p = s.get("Description.ScaryModalBody13To17", {}) : a === K ? p = s.get("Description.ScaryModalThreshold1Body", d) : a === z && (p = s.get("Description.ScaryModalThreshold2Body", d)), ia({
                            titleText: s.get("Heading.ScaryModalTitle", {}),
                            bodyContent: '<div><span class="text-description">'.concat(p, "</span></div>").concat('<div class="text-center"><div class="icon-warning"></div></div>'),
                            declineText: f.get(V, {}),
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
                                                    url: "".concat(ec.EnvironmentUrls.apiGatewayUrl).concat("/purchase-warning/v1/purchase-warnings/acknowledge"),
                                                    withCredentials: !0,
                                                    timeout: 5e3
                                                }, n.label = 1;
                                            case 1:
                                                return n.trys.push([1, 3, , 4]), [4, el.post(t, e)];
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
                                            e_(a, n, o, i, l, "next", e)
                                        }

                                        function l(e) {
                                            e_(a, n, o, i, l, "throw", e)
                                        }
                                        i(void 0)
                                    })
                                })().then(function() {
                                    a === W ? ip("ConfirmU13PaymentModal", null == o ? void 0 : o.assetType) : a === K ? ip("ConfirmU13MonthlyThreshold1Modal", null == o ? void 0 : o.assetType) : a === z ? ip("ConfirmU13MonthlyThreshold2Modal", null == o ? void 0 : o.assetType) : ip("ConfirmParentalConsentWarningPaymentModal13To17Modal", null == o ? void 0 : o.assetType)
                                }).catch(function() {
                                    r()
                                }), !1
                            },
                            onDecline: function() {
                                return ip(er, null == o ? void 0 : o.assetType), eT(), !1
                            },
                            onCancel: function() {
                                return ip(er, null == o ? void 0 : o.assetType), eT(), !1
                            },
                            allowHtmlContentInBody: !0,
                            allowHtmlContentInFooter: !1,
                            fieldValidationRequired: !0,
                            xToCancel: !0
                        })) : "RequireEmailVerification" === a ? (ip("U13PaymentModalEmailVerificationTriggered", null == o ? void 0 : o.assetType), io(), null == (i = w.EmailVerificationService.handleUserEmailVerificationRequiredByPurchaseWarning()) || i.then(function(e) {
                            iy(x().ENUM_VIEW_MESSAGE.REQUIRE_EMAIL_VERIFICATION), (null == e ? void 0 : e.emailAddress) && (null == e ? void 0 : e.verified) && r()
                        })) : (ip("U13PaymentModalNoAction", null == o ? void 0 : o.assetType), r()), [2, Promise.resolve()];
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
                    ih(o, r, n, i, l, "next", e)
                }

                function l(e) {
                    ih(o, r, n, i, l, "throw", e)
                }
                i(void 0)
            })
        })()
    }
    var ib = 0,
        iv = function() {
            var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "\xabr",
                t = (0, eN.useRef)();
            return t.current || (ib += 1, t.current = "".concat(e).concat(ib)), t.current
        };

    function ig(e, t) {
        var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
            n = r.checkForDefaultPrevented,
            o = void 0 === n || n;
        return function(r) {
            if (null == e || e(r), !1 === o || !r.defaultPrevented) return null == t ? void 0 : t(r)
        }
    }

    function iO(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function iE(e, t) {
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
                if ("string" == typeof e) return iO(e, t);
                var r = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return iO(e, t)
            }
        }(e, t) || function() {
            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }
    "u" > typeof window && window.document && window.document.createElement;
    var iw = eN[" useInsertionEffect ".trim().toString()] || e7;

    function iP(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function iS(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function ix(e, t) {
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
                if ("string" == typeof e) return iS(e, t);
                var r = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return iS(e, t)
            }
        }(e, t) || function() {
            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }
    Symbol("RADIX:SYNC_STATE");
    var ij = function(e) {
        var t, r, n, o, a, i, l, c, u, s, f, d, p, h, y, m, b, v = e.present,
            g = e.children,
            O = (t = v, a = (o = ix(eN.useState(), 2))[0], i = o[1], l = eN.useRef(null), c = eN.useRef(t), u = eN.useRef("none"), f = (s = ix((r = t ? "mounted" : "unmounted", n = {
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
            }, eN.useReducer(function(e, t) {
                var r = n[e][t];
                return null != r ? r : e
            }, r)), 2))[0], d = s[1], eN.useEffect(function() {
                var e = iI(l.current);
                u.current = "mounted" === f ? e : "none"
            }, [f]), e7(function() {
                var e = l.current,
                    r = c.current;
                if (r !== t) {
                    var n = u.current,
                        o = iI(e);
                    t ? d("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? d("UNMOUNT") : r && n !== o ? d("ANIMATION_OUT") : d("UNMOUNT"), c.current = t
                }
            }, [t, d]), e7(function() {
                if (a) {
                    var e, t, r = null != (e = a.ownerDocument.defaultView) ? e : window,
                        n = function(e) {
                            var n = iI(l.current).includes(CSS.escape(e.animationName));
                            if (e.target === a && n && (d("ANIMATION_END"), !c.current)) {
                                var o = a.style.animationFillMode;
                                a.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                    "forwards" === a.style.animationFillMode && (a.style.animationFillMode = o)
                                })
                            }
                        },
                        o = function(e) {
                            e.target === a && (u.current = iI(l.current))
                        };
                    return a.addEventListener("animationstart", o), a.addEventListener("animationcancel", n), a.addEventListener("animationend", n),
                        function() {
                            r.clearTimeout(t), a.removeEventListener("animationstart", o), a.removeEventListener("animationcancel", n), a.removeEventListener("animationend", n)
                        }
                }
                d("ANIMATION_END")
            }, [a, d]), {
                isPresent: ["mounted", "unmountSuspended"].includes(f),
                ref: eN.useCallback(function(e) {
                    l.current = e ? getComputedStyle(e) : null, i(e)
                }, [])
            }),
            E = "function" == typeof g ? g({
                present: O.isPresent
            }) : eN.Children.only(g),
            w = e0(O.ref, (b = (m = null == (h = Object.getOwnPropertyDescriptor((p = E).props, "ref")) ? void 0 : h.get) && "isReactWarning" in m && m.isReactWarning) ? p.ref : (b = (m = null == (y = Object.getOwnPropertyDescriptor(p, "ref")) ? void 0 : y.get) && "isReactWarning" in m && m.isReactWarning) ? p.props.ref : p.props.ref || p.ref);
        return "function" == typeof g || O.isPresent ? eN.cloneElement(E, {
            ref: w
        }) : null
    };

    function iI(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }

    function iA(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function iT(e) {
        if (Array.isArray(e)) return e
    }

    function i_() {
        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
    }

    function iN(e) {
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

    function iC(e, t) {
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

    function iR(e, t) {
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

    function iM(e, t) {
        return iT(e) || function(e, t) {
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
        }(e, t) || ik(e, t) || i_()
    }

    function iU(e) {
        return iT(e) || function(e) {
            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
        }(e) || ik(e) || i_()
    }

    function ik(e, t) {
        if (e) {
            if ("string" == typeof e) return iA(e, t);
            var r = Object.prototype.toString.call(e).slice(8, -1);
            if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return iA(e, t)
        }
    }
    ij.displayName = "Presence";
    var iD = "Checkbox",
        iB = iM(e4(iD), 2),
        iL = iB[0];
    iB[1];
    var iH = iM(iL(iD), 2),
        iG = iH[0],
        iF = iH[1];

    function iV(e) {
        var t, r, n, o, a, i, l, c, u, s, f, d, p, h, y, m, b, v, g, O, E = e.__scopeCheckbox,
            w = e.checked,
            P = e.children,
            S = e.defaultChecked,
            x = e.disabled,
            j = e.form,
            I = e.name,
            A = e.onCheckedChange,
            T = e.required,
            _ = e.value,
            N = e.internal_do_not_use_render,
            C = iM((s = (u = {
                prop: w,
                defaultProp: null != S && S,
                onChange: A,
                caller: iD
            }).prop, f = u.defaultProp, d = u.onChange, p = u.caller, y = (h = iE((r = (t = {
                defaultProp: f,
                onChange: void 0 === d ? function() {} : d
            }).defaultProp, n = t.onChange, a = (o = iE(eN.useState(r), 2))[0], i = o[1], l = eN.useRef(a), c = eN.useRef(n), iw(function() {
                c.current = n
            }, [n]), eN.useEffect(function() {
                if (l.current !== a) {
                    var e;
                    null == (e = c.current) || e.call(c, a), l.current = a
                }
            }, [a, l]), [a, i, c]), 3))[0], m = h[1], b = h[2], g = (v = void 0 !== s) ? s : y, O = eN.useRef(void 0 !== s), eN.useEffect(function() {
                var e = O.current;
                if (e !== v) {
                    var t = v ? "controlled" : "uncontrolled";
                    console.warn("".concat(p, " is changing from ").concat(e ? "controlled" : "uncontrolled", " to ").concat(t, ". Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component."))
                }
                O.current = v
            }, [v, p]), [g, eN.useCallback(function(e) {
                if (v) {
                    var t, r = "function" == typeof e ? e(s) : e;
                    r !== s && (null == (t = b.current) || t.call(b, r))
                } else m(e)
            }, [v, s, m, b])]), 2),
            R = C[0],
            M = C[1],
            U = iM(eN.useState(null), 2),
            k = U[0],
            D = U[1],
            B = iM(eN.useState(null), 2),
            L = B[0],
            H = B[1],
            G = eN.useRef(!1),
            F = !k || !!j || !!k.closest("form"),
            V = {
                checked: R,
                disabled: x,
                setChecked: M,
                control: k,
                setControl: D,
                name: I,
                form: j,
                value: void 0 === _ ? "on" : _,
                hasConsumerStoppedPropagationRef: G,
                required: T,
                defaultChecked: !i$(S) && S,
                isFormControl: F,
                bubbleInput: L,
                setBubbleInput: H
            };
        return (0, eD.jsx)(iG, iC(iN({
            scope: E
        }, V), {
            children: "function" == typeof N ? N(V) : P
        }))
    }
    var iW = "CheckboxTrigger",
        iX = eN.forwardRef(function(e, t) {
            var r = iU([e, t]),
                n = r[0],
                o = r.slice(1),
                a = n.__scopeCheckbox,
                i = n.onKeyDown,
                l = n.onClick,
                c = iR(n, ["__scopeCheckbox", "onKeyDown", "onClick"]),
                u = iM(o, 1)[0],
                s = iF(iW, a),
                f = s.control,
                d = s.value,
                p = s.disabled,
                h = s.checked,
                y = s.required,
                m = s.setControl,
                b = s.setChecked,
                v = s.hasConsumerStoppedPropagationRef,
                g = s.isFormControl,
                O = s.bubbleInput,
                E = e0(u, m),
                w = eN.useRef(h);
            return eN.useEffect(function() {
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
            }, [f, b]), (0, eD.jsx)(r5.button, iC(iN({
                type: "button",
                role: "checkbox",
                "aria-checked": i$(h) ? "mixed" : h,
                "aria-required": y,
                "data-state": iJ(h),
                "data-disabled": p ? "" : void 0,
                disabled: p,
                value: d
            }, c), {
                ref: E,
                onKeyDown: ig(i, function(e) {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: ig(l, function(e) {
                    b(function(e) {
                        return !!i$(e) || !e
                    }), O && g && (v.current = e.isPropagationStopped(), v.current || e.stopPropagation())
                })
            }))
        });
    iX.displayName = iW;
    var iK = eN.forwardRef(function(e, t) {
        var r = e.__scopeCheckbox,
            n = e.name,
            o = e.checked,
            a = e.defaultChecked,
            i = e.required,
            l = e.disabled,
            c = e.value,
            u = e.onCheckedChange,
            s = e.form,
            f = iR(e, ["__scopeCheckbox", "name", "checked", "defaultChecked", "required", "disabled", "value", "onCheckedChange", "form"]);
        return (0, eD.jsx)(iV, {
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
                return (0, eD.jsxs)(eD.Fragment, {
                    children: [(0, eD.jsx)(iX, iC(iN({}, f), {
                        ref: t,
                        __scopeCheckbox: r
                    })), n && (0, eD.jsx)(iq, {
                        __scopeCheckbox: r
                    })]
                })
            }
        })
    });
    iK.displayName = iD;
    var iz = "CheckboxIndicator",
        iY = eN.forwardRef(function(e, t) {
            var r = e.__scopeCheckbox,
                n = e.forceMount,
                o = iR(e, ["__scopeCheckbox", "forceMount"]),
                a = iF(iz, r);
            return (0, eD.jsx)(ij, {
                present: n || i$(a.checked) || !0 === a.checked,
                children: (0, eD.jsx)(r5.span, iC(iN({
                    "data-state": iJ(a.checked),
                    "data-disabled": a.disabled ? "" : void 0
                }, o), {
                    ref: t,
                    style: iN({
                        pointerEvents: "none"
                    }, e.style)
                }))
            })
        });
    iY.displayName = iz;
    var iZ = "CheckboxBubbleInput",
        iq = eN.forwardRef(function(e, t) {
            var r, n, o, a, i, l = iU([e, t]),
                c = l[0],
                u = l.slice(1),
                s = c.__scopeCheckbox,
                f = iR(c, ["__scopeCheckbox"]),
                d = iM(u, 1)[0],
                p = iF(iZ, s),
                h = p.control,
                y = p.hasConsumerStoppedPropagationRef,
                m = p.checked,
                b = p.defaultChecked,
                v = p.required,
                g = p.disabled,
                O = p.name,
                E = p.value,
                w = p.form,
                P = p.bubbleInput,
                S = e0(d, p.setBubbleInput),
                x = (r = eN.useRef({
                    value: m,
                    previous: m
                }), eN.useMemo(function() {
                    return r.current.value !== m && (r.current.previous = r.current.value, r.current.value = m), r.current.previous
                }, [m])),
                j = (a = (o = function(e) {
                    if (Array.isArray(e)) return e
                }(n = eN.useState(void 0)) || function(e) {
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
                        if ("string" == typeof e) return iP(e, 2);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return iP(e, 2)
                    }
                }(n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }())[0], i = o[1], e7(function() {
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
            eN.useEffect(function() {
                if (P) {
                    var e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                        t = !y.current;
                    if (x !== m && e) {
                        var r = new Event("click", {
                            bubbles: t
                        });
                        P.indeterminate = i$(m), e.call(P, !i$(m) && m), P.dispatchEvent(r)
                    }
                }
            }, [P, x, m, y]);
            var I = eN.useRef(!i$(m) && m);
            return (0, eD.jsx)(r5.input, iC(iN({
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != b ? b : I.current,
                required: v,
                disabled: g,
                name: O,
                value: E,
                form: w
            }, f), {
                tabIndex: -1,
                ref: S,
                style: iC(iN({}, f.style, j), {
                    position: "absolute",
                    pointerEvents: "none",
                    opacity: 0,
                    margin: 0,
                    transform: "translateX(-100%)"
                })
            }))
        });

    function i$(e) {
        return "indeterminate" === e
    }

    function iJ(e) {
        return i$(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    iq.displayName = iZ;
    var iQ = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-600"
        },
        i0 = {
            XSmall: "",
            Small: "",
            Medium: "",
            Large: "padding-y-xxsmall"
        },
        i1 = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        i2 = {
            XSmall: "",
            Small: "padding-top-xxsmall",
            Medium: "padding-top-xxsmall",
            Large: "padding-top-xxsmall"
        },
        i3 = function(e) {
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
                f = iv(),
                d = u || f,
                p = t && eC().createElement("label", {
                    htmlFor: d,
                    className: eB("flex flex-col grow-1 gap-xsmall", !o && "cursor-pointer")
                }, eC().createElement("span", {
                    className: eB(i1[a], i2[a], "content-emphasis")
                }, t), i && eC().createElement("span", {
                    className: "text-body-medium content-default"
                }, i));
            return eC().createElement("div", {
                className: eB("foundation-web-checkbox flex gap-medium", o && "opacity-[0.5]", !o && "cursor-pointer", r)
            }, "End" === l && p, eC().createElement("div", {
                className: eB(i0[a])
            }, eC().createElement(iK, function(e) {
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
                className: eB(iQ[a], eL, !o && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
                id: d,
                checked: n,
                disabled: o,
                onCheckedChange: c,
                "aria-label": t
            }, s), eC().createElement(eH, null), eC().createElement(iY, {
                "data-slot": "checkbox-indicator",
                className: eB(iQ[a], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
            }))), "Start" === l && p)
        },
        i6 = "Label.Free",
        i5 = "Label.TimedOptionDaysTimerStartsWhenYouBuy",
        i4 = function(e) {
            var t = e.translate,
                r = e.price,
                n = e.color,
                o = void 0 === n ? "" : n,
                a = e.useFreeText;
            return 0 === r && (void 0 === a || a) ? (0, eD.jsx)("span", {
                className: "text-robux text-free",
                children: t(i6)
            }) : (0, eD.jsxs)(eC().Fragment, {
                children: [(0, eD.jsx)("span", {
                    className: "icon-robux".concat(o ? "-".concat(o) : "", "-16x16")
                }), (0, eD.jsx)("span", {
                    className: "text-robux ml-1 text-body-medium",
                    children: (0, eE.formatNumber)(r)
                })]
            })
        },
        i8 = function(e) {
            var t = e.translate,
                r = e.titleText,
                n = e.currentRobuxBalance;
            return (0, eD.jsxs)("div", {
                id: "rbx-unified-purchase-heading",
                className: "flex flex-row items-center justify-between",
                style: {
                    paddingRight: 42
                },
                children: [(0, eD.jsx)("span", {
                    className: "text-heading-medium",
                    children: r
                }), "number" == typeof n && (0, eD.jsx)("div", {
                    className: "flex flex-row items-center",
                    children: (0, eD.jsx)(i4, {
                        translate: t,
                        price: n,
                        color: "",
                        useFreeText: !1
                    })
                })]
            })
        },
        i7 = function(e) {
            var t = e.name;
            return (0, eD.jsx)("span", {
                className: "font-bold",
                children: t
            })
        };

    function i9(e) {
        var t = e.translate,
            r = e.price,
            n = e.color,
            o = e.useFreeText;
        return 0 === r && (void 0 === o || o) ? (0, eD.jsx)("span", {
            children: t(i6)
        }) : (0, eD.jsxs)("span", {
            className: "text-no-wrap",
            children: [(0, eD.jsx)(eK, {
                name: "icon-regular-robux",
                size: "Small",
                className: "text-align-y-center margin-right-[2px]".concat("gray" === (void 0 === n ? "" : n) ? " content-muted" : "")
            }), (0, eD.jsx)("span", {
                children: (0, eE.formatNumber)(r)
            })]
        })
    }

    function le(e) {
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
        return (0, eD.jsx)(as, {
            translate: t,
            namespaces: a4,
            useTranslate: a8,
            render: function(e) {
                var t, n;
                return (0, eD.jsx)(i9, (t = function(e) {
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
    var lt = function(e) {
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
        return (0, eD.jsxs)("div", {
            className: "flex flex-row items-center gap-large",
            children: [(0, eD.jsxs)("div", {
                className: "relative shrink-0 unified-modal-thumbnail-container",
                style: {
                    maxWidth: "40vw",
                    maxHeight: "40vw"
                },
                children: [(0, eD.jsx)("div", {
                    className: "rounded",
                    style: {
                        width: "100%",
                        height: "100%",
                        backgroundColor: "rgba(255,255,255,0.06)"
                    }
                }), (0, eD.jsx)("div", {
                    className: "absolute unified-modal-thumbnail",
                    style: {
                        inset: 0,
                        display: "flex",
                        alignItems: "center",
                        justifyContent: "center"
                    },
                    children: r
                })]
            }), (0, eD.jsxs)("div", {
                className: "min-w-0 flex flex-col gap-small",
                children: [(0, eD.jsx)("span", {
                    className: "text-body-large break-words",
                    children: (0, eD.jsx)(i7, {
                        name: n
                    })
                }), null != c && c > 0 && (0, eD.jsxs)("div", {
                    className: "flex flex-row items-center gap-small",
                    children: [(0, eD.jsx)(eK, {
                        name: "icon-regular-clock"
                    }), (0, eD.jsx)("span", {
                        children: t(i5, {
                            days: c
                        }) || "".concat(c, " days (Timer starts when you buy)")
                    })]
                }), function() {
                    if (s) {
                        var e;
                        return (0, eD.jsxs)("div", {
                            className: "flex flex-row items-center flex-wrap gap-x-small",
                            children: [(0, eD.jsxs)("span", {
                                className: "flex flex-row items-center",
                                children: [(0, eD.jsx)(le, {
                                    translate: t,
                                    price: o,
                                    color: "",
                                    useFreeText: !1
                                }), i && (0, eD.jsx)("span", {
                                    className: "text-robux",
                                    children: i
                                })]
                            }), (0, eD.jsxs)("span", {
                                className: "flex flex-row items-center",
                                style: {
                                    textDecoration: "line-through",
                                    opacity: .6
                                },
                                children: [(0, eD.jsx)(le, {
                                    translate: t,
                                    price: null != (e = u.originalPrice) ? e : 0,
                                    color: "",
                                    useFreeText: !1
                                }), i && (0, eD.jsx)("span", {
                                    className: "text-robux",
                                    children: i
                                })]
                            })]
                        })
                    }
                    return a ? (0, eD.jsx)("div", {
                        className: "flex flex-row items-center",
                        children: (0, eD.jsxs)("span", {
                            className: "text-robux",
                            children: [a, i]
                        })
                    }) : (0, eD.jsxs)("div", {
                        className: "flex flex-row items-center",
                        children: [(0, eD.jsx)(le, {
                            translate: t,
                            price: o,
                            color: "",
                            useFreeText: !1
                        }), i && (0, eD.jsx)("span", {
                            className: "text-robux",
                            children: i
                        })]
                    })
                }()]
            })]
        })
    };

    function lr(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }
    var ln = (0, eN.createContext)(null),
        lo = (0, eN.createContext)(null),
        la = {
            XSmall: "min-height-600",
            Small: "min-height-800",
            Medium: "min-height-1000",
            Large: "min-height-1200"
        },
        li = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-xsmall",
            Medium: "padding-y-small",
            Large: "padding-y-small"
        },
        ll = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium",
            Large: "text-title-large"
        },
        lc = {
            XSmall: "size-300",
            Small: "size-400",
            Medium: "size-500",
            Large: "size-600"
        },
        lu = (0, eN.forwardRef)(function(e, t) {
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
                d = (0, eN.useMemo)(function() {
                    return {
                        size: a,
                        hasDivider: l,
                        isContained: u,
                        isDisabled: f
                    }
                }, [a, l, u, f]);
            return eC().createElement(ln.Provider, {
                value: d
            }, eC().createElement("div", {
                ref: t,
                className: eB("foundation-web-accordion", "flex flex-col items-start width-full", l && "[&>*:not(:last-child)]:[border-bottom:1px_solid_var(--color-stroke-default)]", n)
            }, r))
        }),
        ls = (0, eN.forwardRef)(function(e, t) {
            var r, n = e.children,
                o = e.className,
                a = e.isDisabled,
                i = void 0 !== a && a,
                l = e.defaultOpen,
                c = e.isOpen,
                u = e.onOpenChange,
                s = (0, eN.useContext)(ln),
                f = function(e) {
                    if (Array.isArray(e)) return e
                }(r = (0, eN.useState)(void 0 !== l && l)) || function(e) {
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
                        if ("string" == typeof e) return lr(e, 2);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return lr(e, 2)
                    }
                }(r) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }(),
                d = f[0],
                p = f[1],
                h = null != c ? c : d,
                y = iv("fui-a-");
            if (!s) throw Error("AccordionItem must be used within Accordion");
            var m = s.isContained,
                b = s.isDisabled,
                v = (0, eN.useCallback)(function(e) {
                    i || b || (void 0 === c && p(e), null == u || u(e))
                }, [i, b, c, u]),
                g = (0, eN.useMemo)(function() {
                    return {
                        isOpen: h,
                        setOpen: v,
                        isDisabled: i,
                        triggerId: "".concat(y, "-trigger"),
                        contentId: "".concat(y, "-content")
                    }
                }, [h, v, i, y]);
            return eC().createElement(lo.Provider, {
                value: g
            }, eC().createElement("div", {
                ref: t,
                "data-contained": m,
                "data-state": h ? "open" : "closed",
                className: eB("foundation-web-accordion-item", "width-full", o)
            }, n))
        }),
        lf = function(e) {
            var t = e.children,
                r = e.className,
                n = (0, eN.useContext)(ln),
                o = (0, eN.useContext)(lo);
            if (!n) throw Error("AccordionItemTrigger must be used within Accordion");
            if (!o) throw Error("AccordionItemTrigger must be used within AccordionItem");
            var a = n.size,
                i = n.isContained,
                l = n.isDisabled,
                c = o.isOpen,
                u = o.setOpen,
                s = o.isDisabled,
                f = l || s;
            return eC().createElement("button", {
                id: o.triggerId,
                type: "button",
                className: eB(eL, "relative flex items-center justify-between gap-small cursor-pointer content-default bg-none stroke-none width-full", la[a], li[a], i ? "padding-x-medium" : "padding-x-none", f && ["opacity-[0.5]", "pointer-events-none"], r),
                "aria-expanded": c,
                "aria-controls": o.contentId,
                onClick: function(e) {
                    e.preventDefault(), f || u(!c)
                }
            }, eC().createElement(eH, null), eC().createElement("div", {
                className: "flex items-center min-width-0 grow-1"
            }, eC().createElement("span", {
                className: eB("text-align-x-left", ll[a])
            }, t)), eC().createElement("span", {
                className: eB("foundation-web-accordion-chevron shrink-0", lc[a], "icon icon-regular-chevron-large-down", "motion-safe:transition-transform duration-200"),
                style: {
                    transform: c ? "rotate(180deg)" : "rotate(0deg)"
                }
            }))
        },
        ld = function(e) {
            var t, r, n = e.children,
                o = e.className,
                a = (0, eN.useContext)(ln),
                i = (0, eN.useContext)(lo);
            if (!a) throw Error("AccordionItemContent must be used within Accordion");
            if (!i) throw Error("AccordionItemContent must be used within AccordionItem");
            var l = a.size,
                c = i.isOpen ? {} : {
                    inert: "inert"
                };
            return eC().createElement("div", (t = function(e) {
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
                className: eB("foundation-web-accordion-content grid clip width-full motion-safe:transition-all duration-200 ease-standard-out")
            }, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(r)) : (function(e) {
                var t = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var r = Object.getOwnPropertySymbols(e);
                    t.push.apply(t, r)
                }
                return t
            })(Object(r)).forEach(function(e) {
                Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(r, e))
            }), t), eC().createElement("div", {
                className: eB("foundation-web-accordion-content-inner width-full min-height-0 clip padding-top-none padding-bottom-none motion-safe:transition-transform duration-200", !i.isOpen && "pointer-events-none", o)
            }, n))
        };

    function lp(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function lh(e) {
        return function(e) {
            if (Array.isArray(e)) return lp(e)
        }(e) || function(e) {
            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
        }(e) || function(e) {
            if (e) {
                if ("string" == typeof e) return lp(e, void 0);
                var t = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return lp(e, void 0)
            }
        }(e) || function() {
            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }
    var ly = "__FN_nvfToKPAOuiV__",
        lm = new RegExp("".concat(ly, "(\\d+)\\|")),
        lb = function(e, t, r, n) {
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
                    n = "".concat(ly).concat(r, "|"),
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
                        n = lm.exec(e);
                    if (!n) return [e];
                    n.index > 0 && r.push(e.slice(0, n.index));
                    var o = n[1] && a[n[1]];
                    if (!o) return console.warn("Unexpected malformed segment", t), [];
                    o.used = !0;
                    var i = e.indexOf(o.end);
                    if (-1 === i) return console.warn("Unexpected malformed segment", t), [];
                    var c = e.slice(n.index + n[0].length, i),
                        u = o.render(l(c));
                    Array.isArray(u) ? r.push.apply(r, lh(u)) : r.push(u);
                    var s = e.slice(i + o.end.length);
                    return s.length > 0 && r.push.apply(r, lh(l(s))), r
                },
                c = l(i).filter(function(e) {
                    return "" !== e
                });
            return Object.values(a).some(function(e) {
                return !e.used
            }) ? (console.warn("Unused segments found", t), []) : c.map(function(e, t) {
                return (0, eD.jsx)(eN.Fragment, {
                    children: e
                }, t)
            })
        };

    function lv(e) {
        return !!(null == e ? void 0 : e.some(function(e) {
            return "ROBLOX_PLUS" === e.discountType || "BlackbirdSubscription" === e.discountCampaign || "RobloxPlusSubscription" === e.discountCampaign || "RobloxSubscription" === e.discountCampaign
        }))
    }
    var lg = String.fromCodePoint(57346),
        lO = RegExp("".concat(lg, "|\\\\u\\{E002\\}|\\\\uE002"), "gi"),
        lE = function(e) {
            var t = e.text,
                r = e.className,
                n = e.id;
            return (0, eD.jsx)("span", {
                id: n,
                className: eB("inline", r),
                children: function(e) {
                    if (lO.lastIndex = 0, !lO.test(e)) return [e];
                    for (var t = [], r = 0, n = RegExp(lO.source, "gi"), o = n.exec(e); o;) {
                        var a = o.index;
                        a > r && t.push(e.slice(r, a)), t.push((0, eD.jsx)("span", {
                            className: "icon-robux-16x16 inline-block align-text-bottom",
                            "aria-hidden": !0
                        }, "robux-icon-".concat(a))), r = a + o[0].length, o = n.exec(e)
                    }
                    return r < e.length && t.push(e.slice(r)), t
                }(t)
            })
        };

    function lw(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }
    var lP = function(e) {
            var t = e.amount,
                r = Math.abs(t);
            return (0, eD.jsxs)(eC().Fragment, {
                children: [t < 0 && (0, eD.jsx)("span", {
                    className: "text-robux",
                    children: "-"
                }), (0, eD.jsx)("span", {
                    className: "icon-robux-16x16"
                }), (0, eD.jsx)("span", {
                    className: "text-robux",
                    children: (0, eE.formatNumber)(r)
                })]
            })
        },
        lS = function(e) {
            var t, r = e.translate,
                n = e.normalizedDiscount,
                o = e.savingsSummary,
                a = n.savedAmount,
                i = n.originalPrice,
                l = n.totalPrice,
                c = n.discountLines,
                u = function(e) {
                    if (Array.isArray(e)) return e
                }(t = (0, eN.useState)(!1)) || function(e) {
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
                        if ("string" == typeof e) return lw(e, 2);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return lw(e, 2)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }(),
                s = u[0],
                f = u[1],
                d = lv(c),
                p = null == o ? void 0 : o.trim(),
                h = [{
                    opening: "amountStart",
                    closing: "amountEnd",
                    render: function() {
                        return (0, eD.jsx)(lP, {
                            amount: a
                        })
                    }
                }],
                y = function(e) {
                    var t;
                    return lv([e]) ? e.localizedAttribution ? (0, eD.jsx)(lE, {
                        text: e.localizedAttribution
                    }) : r("Label.PlusBenefitDiscount", {
                        discountPercent: String(null != (t = e.discountPercent) ? t : 0)
                    }) : (0, eD.jsx)(lE, {
                        text: e.label
                    })
                };
            return (0, eD.jsx)(lu, {
                className: "text-body-medium padding-none stroke-default stroke-thick radius-medium",
                children: (0, eD.jsxs)(ls, {
                    isOpen: s,
                    onOpenChange: f,
                    children: [(0, eD.jsx)(lf, {
                        className: eB("!padding-medium bg-shift-100 width-full flex flex-row items-center justify-between", s && "[border-bottom-left-radius:0] [border-bottom-right-radius:0]"),
                        children: (0, eD.jsxs)("div", {
                            className: "flex flex-row items-center gap-x-small content-emphasis",
                            children: [d && !p && (0, eD.jsx)(eK, {
                                name: "icon-regular-roblox-plus",
                                size: "Medium"
                            }), (0, eD.jsx)("span", {
                                children: p ? (0, eD.jsx)(lE, {
                                    text: p
                                }) : d ? lb(r, "Description.SavingWithPlus", h, {
                                    robuxAmount: (0, eE.formatNumber)(a)
                                }) : r("Description.SavingRobux", {
                                    robuxAmount: (0, eE.formatNumber)(a)
                                })
                            })]
                        })
                    }), (0, eD.jsxs)(ld, {
                        className: "!padding-none",
                        children: [(0, eD.jsxs)("div", {
                            className: "padding-medium padding-bottom-small flex flex-col gap-y-small bg-shift-100 stroke-default stroke-thick",
                            style: {
                                borderTop: "0px",
                                borderLeft: "0px",
                                borderRight: "0px"
                            },
                            children: [(0, eD.jsxs)("div", {
                                className: "flex flex-row items-center justify-between content-default",
                                children: [(0, eD.jsx)("span", {
                                    children: r("Label.Subtotal")
                                }), (0, eD.jsx)("span", {
                                    className: "flex flex-row items-center",
                                    children: (0, eD.jsx)(lP, {
                                        amount: i
                                    })
                                })]
                            }), c.map(function(e, t) {
                                var r;
                                return (0, eD.jsxs)("div", {
                                    className: "flex flex-row items-center justify-between content-default",
                                    children: [(0, eD.jsx)("span", {
                                        children: y(e)
                                    }), (0, eD.jsx)("span", {
                                        className: "flex flex-row items-center",
                                        children: (0, eD.jsx)(lP, {
                                            amount: -e.discountAmount
                                        })
                                    })]
                                }, "".concat(null != (r = e.discountCampaign) ? r : "discount", "-").concat(t))
                            })]
                        }), (0, eD.jsxs)("div", {
                            className: "padding-medium flex flex-row items-center justify-between text-heading-small content-default bg-shift-100",
                            children: [(0, eD.jsx)("span", {
                                children: r("Label.Total")
                            }), (0, eD.jsx)("span", {
                                className: "flex flex-row items-center",
                                children: (0, eD.jsx)(lP, {
                                    amount: l
                                })
                            })]
                        })]
                    })]
                })
            })
        },
        lx = function(e) {
            var t = e.robuxAmount,
                r = e.price;
            return (0, eD.jsx)("div", {
                className: "rounded-xxlarge radius-medium border padding-medium",
                style: {
                    borderColor: "var(--content-action-standard)"
                },
                children: (0, eD.jsxs)("div", {
                    className: "flex flex-row items-center justify-between gap-medium",
                    children: [(0, eD.jsxs)("div", {
                        className: "flex flex-row items-center",
                        children: [(0, eD.jsx)("span", {
                            className: "icon-robux-16x16"
                        }), (0, eD.jsx)("span", {
                            className: "text-heading-small margin-left-xsmall",
                            children: (0, eE.formatNumber)(t)
                        })]
                    }), (0, eD.jsx)("div", {
                        className: "text-label-large",
                        children: r
                    })]
                })
            })
        };

    function lj(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }
    var lI = function(e, t) {
        (0, eN.useEffect)(function() {
            t && is("".concat("RenderTracking", "-").concat("Purchase", "-").concat(e))
        }, [t])
    };

    function lA(e, t, r, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, o)
    }

    function lT(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function l_(e, t, r, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, o)
    }

    function lN(e) {
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

    function lC(e, t) {
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
                if ("string" == typeof e) return lT(e, t);
                var r = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return lT(e, t)
            }
        }(e, t) || function() {
            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }
    var lR = function(e) {
            var t, r, n, o, a, i, l, c, u, s, f, d, p, h, y, m, b, v, g, O, E, w, P, S, x, I, A, T, _, N, C, R, M, k, D, B, L, H, G = e.translate,
                F = e.expectedPrice,
                V = e.thumbnail,
                W = e.assetName,
                X = e.onAction,
                K = e.onCancel,
                z = e.loading,
                Y = e.currentRobuxBalance,
                Z = e.open,
                q = void 0 !== Z && Z,
                $ = e.robuxPackageAmount,
                J = e.robuxPackagePrice,
                Q = e.priceSuffix,
                ee = e.title,
                et = e.discountInformation,
                er = e.collectibleItemId,
                en = e.rentalOptionDays,
                eo = e.isLimited,
                ea = e.packageLoading,
                ei = void 0 !== ea && ea,
                eu = e.onRefetchPackage,
                es = e.onAcceptOffers,
                ef = e.onDirectPurchase,
                ed = (0, eN.useCallback)(function(e) {
                    null == eu || eu(null != e ? e : F)
                }, [eu, F]),
                ep = (u = void 0 === (c = (l = {
                    collectibleItemId: void 0 === er ? null : er,
                    rentalOptionDays: void 0 === en ? null : en,
                    expectedPrice: F,
                    isLimitedItem: void 0 !== eo && eo,
                    open: q,
                    onPriceResolved: ed
                }).collectibleItemId) ? null : c, f = void 0 === (s = l.rentalOptionDays) ? null : s, d = l.expectedPrice, p = l.isLimitedItem, y = void 0 !== (h = l.open) && h, m = l.onPriceResolved, b = null != d && d <= 0 || void 0 !== p && p, g = (v = lC((0, eN.useState)([]), 2))[0], O = v[1], E = (0, eN.useRef)([]), (0, eN.useEffect)(function() {
                    E.current = g
                }, [g]), P = (w = lC((0, eN.useState)(), 2))[0], S = w[1], I = (x = lC((0, eN.useState)(void 0), 2))[0], A = x[1], _ = (T = lC((0, eN.useState)(), 2))[0], N = T[1], R = (C = lC((0, eN.useState)(!1), 2))[0], M = C[1], k = (0, eN.useRef)(0), D = (0, eN.useRef)(m), (0, eN.useEffect)(function() {
                    D.current = m
                }, [m]), B = (0, eN.useCallback)(function(e) {
                    var t;
                    return (t = function() {
                        var t, r, n, o, a, i, l, c, s, d;
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
                        }(this, function(p) {
                            var h, y, m, v;
                            switch (p.label) {
                                case 0:
                                    if (!u || b) return [2];
                                    t = k.current + 1, k.current = t, M(!0), p.label = 1;
                                case 1:
                                    return p.trys.push([1, , 3, 4]), [4, (h = lN({
                                        featureKey: "MARKETPLACE_CART",
                                        items: [null != f && f > 0 ? {
                                            collectibleItemId: u,
                                            rentalDays: f
                                        } : {
                                            collectibleItemId: u,
                                            isPermanent: !0
                                        }]
                                    }, (null == e ? void 0 : e.length) ? {
                                        unselectedOffers: e
                                    } : {}), (y = function() {
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
                                                        url: "".concat(ec.EnvironmentUrls.apiGatewayUrl, "/marketplace-sales/v1/cart-pricing"),
                                                        withCredentials: !0
                                                    }, n.label = 1;
                                                case 1:
                                                    return n.trys.push([1, 3, , 4]), [4, el.post(e, h)];
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
                                            var o = y.apply(e, t);

                                            function a(e) {
                                                lA(o, r, n, a, i, "next", e)
                                            }

                                            function i(e) {
                                                lA(o, r, n, a, i, "throw", e)
                                            }
                                            a(void 0)
                                        })
                                    })())];
                                case 2:
                                    if (s = p.sent(), t !== k.current) return [2];
                                    if (!s) return N(void 0), [2];
                                    return (null == (d = null != (r = null == (a = s.items) ? void 0 : a.find(function(e) {
                                        return e.collectibleItemId === u
                                    })) ? r : null == (i = s.items) ? void 0 : i[0]) ? void 0 : d.priceInRobux) != null && S(d.priceInRobux), A(null != (n = null == d ? void 0 : d.discountInformation) ? n : null), N((null == (l = s.savingsSummary) ? void 0 : l.trim()) || void 0), null == (c = D.current) || c.call(D, null != (o = null == d ? void 0 : d.priceInRobux) ? o : void 0), O(null != (v = null == (m = s.availableOffers) ? void 0 : m.reduce(function(e, t) {
                                        var r, n, o = null == (r = t.localizedDescription) ? void 0 : r.trim();
                                        return t.offerId && o && e.push({
                                            offerId: t.offerId,
                                            localizedText: o,
                                            selected: null != (n = t.selected) && n
                                        }), e
                                    }, [])) ? v : []), [3, 4];
                                case 3:
                                    return t === k.current && M(!1), [7];
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
                                l_(a, n, o, i, l, "next", e)
                            }

                            function l(e) {
                                l_(a, n, o, i, l, "throw", e)
                            }
                            i(void 0)
                        })
                    })()
                }, [u, f, b]), (0, eN.useEffect)(function() {
                    if (!y) {
                        k.current += 1, S(void 0), A(void 0), N(void 0), O([]), M(!1);
                        return
                    }
                    u && !b && B().catch(function() {})
                }, [y, u, b, B]), L = (0, eN.useCallback)(function(e, t) {
                    var r = E.current.map(function(r) {
                        var n, o;
                        return r.offerId === e ? (n = lN({}, r), o = o = {
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
                    E.current = r, O(r);
                    var n = r.filter(function(e) {
                        return !e.selected
                    }).map(function(e) {
                        return e.offerId
                    });
                    B(n.length ? n : void 0).catch(function() {})
                }, [B]), H = (0, eN.useMemo)(function() {
                    return g.filter(function(e) {
                        return e.selected
                    }).map(function(e) {
                        return e.offerId
                    })
                }, [g]), {
                    offerSelections: g,
                    resolvedPrice: P,
                    resolvedDiscountInformation: I,
                    resolvedSavingsSummary: _,
                    isPricingLoading: R,
                    selectedOfferIds: H,
                    handleOfferCheckedChange: L
                }),
                ey = ep.offerSelections,
                em = ep.resolvedPrice,
                eb = ep.resolvedDiscountInformation,
                ev = ep.resolvedSavingsSummary,
                eg = ep.isPricingLoading,
                eO = ep.selectedOfferIds,
                eE = ep.handleOfferCheckedChange,
                ew = null != em ? em : F,
                eP = void 0 !== eb ? eb : et,
                eS = (0, eN.useMemo)(function() {
                    var e, t, r, n, o, a, i;
                    return eP ? (a = null != (e = eP.originalPrice) ? e : 0, {
                        savedAmount: i = null != (t = null != (r = eP.totalDiscountAmount) ? r : eP.totalAmountSaved) ? t : 0,
                        originalPrice: a,
                        totalPrice: a - i,
                        discountLines: null != (n = null == (o = eP.discounts) ? void 0 : o.map(function(e, t) {
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
                }, [eP]),
                ex = null != Y && ew <= Y;
            lI("UnifiedRobuxUpsellModal", q);
            var ej = null != ee ? ee : G(U),
                eI = G("Action.Buy"),
                eA = (t = G, o = (n = function(e) {
                    if (Array.isArray(e)) return e
                }(r = (0, eN.useState)(!1)) || function(e) {
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
                        if ("string" == typeof e) return lj(e, 2);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return lj(e, 2)
                    }
                }(r) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }())[0], a = n[1], (0, eN.useEffect)(function() {
                    var e;
                    (e = ec.EnvironmentUrls.apiGatewayUrl, {
                        getDmccaLegalTextFeature: function() {
                            return el.get({
                                retryable: !0,
                                withCredentials: !0,
                                url: "".concat(e, "/access-management/v1/upsell-feature-access?featureName=").concat("ShouldUseDMCCALegalDisclosure")
                            }).then(function(e) {
                                return "Granted" === e.data.access
                            })
                        }
                    }).getDmccaLegalTextFeature().then(function(e) {
                        e && a(!0)
                    }).catch(function(e) {
                        console.warn("Failed to fetch DMCCA feature", e)
                    })
                }, []), i = (0, eh.getUrlWithLocale)(j, at().replace("-", "_").toLowerCase()) + (o ? "#robux-and-premium-membership" : ""), lb(t, "Message.TermsOfUse", [{
                    opening: "aTagStart",
                    closing: "aTagEnd",
                    render: function(e) {
                        return eC().createElement("a", {
                            href: i,
                            target: "_blank",
                            rel: "noreferrer",
                            className: "underline"
                        }, e)
                    }
                }])),
                eT = (0, eN.useCallback)(function() {
                    var e = {
                        purchasePrice: ew,
                        offerIds: eO
                    };
                    ex && ef ? ef(e) : es ? es(e) : X()
                }, [ew, eO, ex, ef, es, X]);
            return (0, eD.jsx)(ni, {
                open: q,
                onOpenChange: function(e) {
                    !e && K && K()
                },
                isModal: !0,
                size: "Large",
                type: "Default",
                closeLabel: G("Action.Close") || "Close",
                hasCloseAffordance: !0,
                children: (0, eD.jsxs)(nl, {
                    className: "relative width-full",
                    children: [(0, eD.jsxs)(nc, {
                        className: "gap-large flex flex-col",
                        children: [(0, eD.jsx)("div", {
                            className: "margin-bottom-xsmall",
                            children: (0, eD.jsx)(i8, {
                                translate: G,
                                titleText: ej,
                                currentRobuxBalance: Y
                            })
                        }), (0, eD.jsx)(lt, {
                            translate: G,
                            thumbnail: V,
                            assetName: W,
                            expectedPrice: ew,
                            priceSuffix: Q,
                            discountInformation: eP
                        }), ey.map(function(e) {
                            var t = "upsell-offer-label-".concat(e.offerId);
                            return (0, eD.jsxs)("label", {
                                htmlFor: "upsell-offer-checkbox-".concat(e.offerId),
                                className: "flex flex-row items-start gap-x-small self-start cursor-pointer",
                                children: [(0, eD.jsx)(i3, {
                                    id: "upsell-offer-checkbox-".concat(e.offerId),
                                    "aria-labelledby": t,
                                    placement: "Start",
                                    size: "Small",
                                    isChecked: e.selected,
                                    onCheckedChange: function(t) {
                                        eE(e.offerId, !0 === t)
                                    },
                                    isDisabled: eg || ei,
                                    "data-testid": "upsell-promo-checkbox-".concat(e.offerId)
                                }), (0, eD.jsx)(lE, {
                                    id: t,
                                    text: e.localizedText,
                                    className: "text-body-medium content-default"
                                })]
                            }, e.offerId)
                        }), eS && eS.savedAmount > 0 && (0, eD.jsx)(lS, {
                            translate: G,
                            normalizedDiscount: eS,
                            savingsSummary: ev
                        }), !ex && null != $ && null != J && (0, eD.jsx)(lx, {
                            robuxAmount: $,
                            price: J
                        })]
                    }), (0, eD.jsx)(ns, {
                        className: "gap-small flex flex-col mt-[40px]",
                        children: (0, eD.jsxs)("div", {
                            className: "flex flex-col items-center text-center width-full gap-medium",
                            children: [(0, eD.jsx)(nU, {
                                variant: "Emphasis",
                                className: "width-full shrink-0",
                                onClick: eT,
                                isDisabled: void 0 !== z && z || eg || ei,
                                "data-testid": "purchase-confirm-button",
                                children: eI
                            }), (0, eD.jsx)("div", {
                                className: "text-body-small",
                                children: eA
                            })]
                        })
                    })]
                })
            })
        },
        lM = function(e) {
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
            return (0, eD.jsx)(as, {
                translate: t,
                namespaces: a4,
                useTranslate: a8,
                render: function(e) {
                    var t, n;
                    return (0, eD.jsx)(lR, (t = function(e) {
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
        lU = function(e) {
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
            return lI("UnifiedRobuxUpsellTooExpensiveModal", s), (0, eD.jsx)(ni, {
                open: s,
                onOpenChange: function(e) {
                    !e && i && i()
                },
                isModal: !0,
                size: "Large",
                type: "Default",
                closeLabel: t("Action.Close") || "Close",
                hasCloseAffordance: !0,
                children: (0, eD.jsxs)(nl, {
                    className: "relative width-full",
                    children: [(0, eD.jsxs)(nc, {
                        className: "gap-large flex flex-col",
                        children: [(0, eD.jsx)("div", {
                            className: "margin-bottom-xsmall",
                            children: (0, eD.jsx)(i8, {
                                translate: t,
                                titleText: t(L),
                                currentRobuxBalance: c
                            })
                        }), (0, eD.jsx)(lt, {
                            translate: t,
                            thumbnail: n,
                            assetName: o,
                            expectedPrice: r
                        })]
                    }), (0, eD.jsx)(ns, {
                        className: "gap-small flex flex-col mt-[40px]",
                        children: (0, eD.jsx)("div", {
                            className: "flex flex-row-reverse",
                            children: (0, eD.jsx)(nU, {
                                "aria-label": t(L),
                                variant: "Emphasis",
                                className: " fill",
                                onClick: a,
                                isDisabled: void 0 !== l && l,
                                "data-testid": "purchase-confirm-button",
                                children: (0, eD.jsxs)("div", {
                                    className: "fill basis-0 inline-flex items-center gap-medium leading-none",
                                    children: [(0, eD.jsx)(eK, {
                                        name: "icon-filled-arrow-up-right-from-square",
                                        className: "align-middle"
                                    }), t(k)]
                                })
                            })
                        })
                    })]
                })
            })
        },
        lk = function(e) {
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
            return (0, eD.jsx)(as, {
                translate: t,
                namespaces: a4,
                useTranslate: a8,
                render: function(e) {
                    var t, n;
                    return (0, eD.jsx)(lU, (t = function(e) {
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
        lD = function(e) {
            var t = document.createElement("div");
            document.body.appendChild(t);
            var r = function() {
                    eM().unmountComponentAtNode(t), t.remove()
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
                var a = eC().createElement(lk, {
                    expectedPrice: e.expectedPrice,
                    thumbnail: e.thumbnail,
                    assetName: e.assetName,
                    onAction: o,
                    onCancel: n,
                    open: !0,
                    loading: !1,
                    currentRobuxBalance: e.currentRobuxBalance
                });
                return eM().render(a, t), {
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
                    var r = eC().createElement(lM, {
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
                    eM().render(r, t)
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

    function lB(e, t, r) {
        return t in e ? Object.defineProperty(e, t, {
            value: r,
            enumerable: !0,
            configurable: !0,
            writable: !0
        }) : e[t] = r, e
    }
    var lL = function() {
            var e;

            function t() {
                var e = this;
                if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                lB(this, "overlayDiv", null), lB(this, "contentDiv", null), lB(this, "loadingMessageSpan", null), lB(this, "spinnerSpan", null), lB(this, "loadingOverlayElementId", "loading-overlay"), lB(this, "_loadingMessage", void 0), lB(this, "show", function(t) {
                    var r = e.getOrCreateOverlayDiv(),
                        n = e.getOrCreateContentDiv(r);
                    return e.getOrCreateSpinnerSpan(n), e.updateOrCreateMessage(t), e
                }), lB(this, "hide", function() {
                    var t, r, n, o, a, i, l, c;
                    null == (r = e.spinnerSpan) || null == (t = r.parentNode) || t.removeChild(e.spinnerSpan), null == (o = e.loadingMessageSpan) || null == (n = o.parentNode) || n.removeChild(e.loadingMessageSpan), null == (i = e.contentDiv) || null == (a = i.parentNode) || a.removeChild(e.contentDiv), null == (c = e.overlayDiv) || null == (l = c.parentNode) || l.removeChild(e.overlayDiv), e.overlayDiv = null, e.contentDiv = null, e.spinnerSpan = null, e.loadingMessageSpan = null
                }), lB(this, "updateMessage", function(t) {
                    e._loadingMessage = t, e.updateOrCreateMessage(t)
                }), lB(this, "updateOrCreateMessage", function(t) {
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
                }), lB(this, "getOrCreateContentDiv", function(t) {
                    if (e.contentDiv) return e.contentDiv;
                    var r = document.createElement("div");
                    return r.classList.add("loading-overlay-content"), e.contentDiv = r, t.appendChild(r), r
                }), lB(this, "getOrCreateOverlayDiv", function() {
                    if (e.overlayDiv) return e.overlayDiv;
                    var t = document.getElementById(e.loadingOverlayElementId);
                    if (t) return e.overlayDiv = t, t;
                    var r = document.createElement("div");
                    return e.overlayDiv = r, r.id = e.loadingOverlayElementId, r.classList.add("loading-overlay"), document.body.appendChild(r), r
                }), lB(this, "getOrCreateSpinnerSpan", function(t) {
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
        }(),
        lH = window.Roblox["core-scripts"].eventStream,
        lG = window.Roblox["core-scripts"].meta.device;

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

    function lV(e) {
        P.expireUpsellCookie(), window.location.href = (0, ep.getAbsoluteUrl)(e)
    }

    function lW() {
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
                            url: "".concat(ec.EnvironmentUrls.apiGatewayUrl).concat("/vng-payments/v1/getVngShopUrl"),
                            withCredentials: !0
                        }, [4, el.get(e)];
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
                    lF(a, n, o, i, l, "next", e)
                }

                function l(e) {
                    lF(a, n, o, i, l, "throw", e)
                }
                i(void 0)
            })
        })()
    }

    function lX() {
        var e = (0, lG.getDeviceMeta)();
        (null == e ? void 0 : e.isDesktop) && e.isUniversalApp ? lW().then(function(e) {
            return window.open(e, "_self")
        }).catch(function() {
            return window.open(ec.EnvironmentUrls.vngGamesShopUrl, "_self")
        }) : lW().then(function(e) {
            return window.open(e, "_blank")
        }).catch(function() {
            return window.open(ec.EnvironmentUrls.vngGamesShopUrl, "_blank")
        })
    }

    function lK(e, t, r, n) {
        var o = "<span>".concat(r.get("Message.PurchaseSucceededRobuxBalance", {
                userRobuxBalance: ew(t)
            }), "</span>"),
            a = "<div class='item-content'>\n        <div class='item-card-container item-preview'>\n          <div class='item-card-thumb'>\n            <img alt='item preview' src='".concat(e.itemThumbnailUrl, "'/>\n          </div>\n        </div>\n        <div class='text-center'>\n          ").concat(r.get("Message.PurchaseSucceeded", {
                assetName: e.assetName
            }), "\n          ").concat(o, "\n        </div>\n      </div>"),
            i = e.assetType === C || "Subscription" === e.assetType,
            l = i ? r.get(F, {}) : r.get("Action.EquipMyAvatar", {});
        ia({
            titleText: r.get("Heading.PurchaseSucceeded", {}),
            bodyContent: a,
            declineText: r.get("Action.BackToShop", {}),
            acceptText: l,
            onAccept: function() {
                x().sendUserPurchaseFlowEvent(x().ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, x().ENUM_VIEW_NAME.SUCCESS, x().ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, x().ENUM_VIEW_MESSAGE.OK, {
                    item_type: e.assetType,
                    item_id: e.productId
                }, !0), ip("AutoPurchaseSucceedEquipMyAvatar", e.assetType);
                var t, r = e.itemPath;
                return (ep.supportLocalizedUrls && (r = (0, ep.removeUrlLocale)(r)), i) ? r.startsWith(A) ? lV("".concat(e.itemPath, "?#!/store")) : lV(e.itemPath) : void 0 !== (t = (0, ep.getAbsoluteUrl)("/my/avatar")) && "" !== t && (P.expireUpsellCookie(), window.location.href = t), !1
            },
            onDecline: function() {
                return n.show(), x().sendUserPurchaseFlowEvent(x().ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, x().ENUM_VIEW_NAME.SUCCESS, x().ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, x().ENUM_VIEW_MESSAGE.CANCEL, {
                    item_type: e.assetType,
                    item_id: e.productId
                }, !0), ip("AutoPurchaseSucceedBackToShop", e.assetType), lV(e.itemPath), !1
            },
            onCancel: function() {
                return n.show(), x().sendUserPurchaseFlowEvent(x().ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, x().ENUM_VIEW_NAME.SUCCESS, x().ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, x().ENUM_VIEW_MESSAGE.CANCEL, {
                    item_type: e.assetType,
                    item_id: e.productId
                }, !0), ip("AutoPurchaseSucceedClose", e.assetType), lV(e.itemPath), !1
            },
            allowHtmlContentInBody: !0,
            allowHtmlContentInFooter: !1,
            fieldValidationRequired: !0,
            showDecline: !i,
            dismissable: !1,
            xToCancel: !0
        })
    }

    function lz(e, t) {
        ia({
            titleText: t.get("Heading.ErrorOccured", {}),
            bodyContent: t.get("Message.PurchaseErrorOccured", {}),
            imageUrl: e.alertImageUrl,
            acceptText: t.get(F, {}),
            allowHtmlContentInBody: !0
        })
    }

    function lY(e, t, r, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, o)
    }

    function lZ(e) {
        return function() {
            var t = this,
                r = arguments;
            return new Promise(function(n, o) {
                var a = e.apply(t, r);

                function i(e) {
                    lY(a, n, o, i, l, "next", e)
                }

                function l(e) {
                    lY(a, n, o, i, l, "throw", e)
                }
                i(void 0)
            })
        }
    }

    function lq(e, t) {
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

    function l$(e, t, r, n) {
        return lZ(function() {
            var o, a, i, l, c, u, s, f, d, p, h, y, m;
            return lq(this, function(b) {
                var v, g, O, E;
                switch (b.label) {
                    case 0:
                        o = {
                            url: e,
                            withCredentials: !0,
                            retryable: !1,
                            noCache: !0,
                            noPragma: !0
                        }, b.label = 1;
                    case 1:
                        return b.trys.push([1, 3, , 4]), u = function(e) {
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
                            expectedPurchaserId: null == (l = eO()) ? void 0 : l.id,
                            expectedPurchaserType: "User",
                            idempotencyKey: ex()
                        }, (null == (c = t.offerIds) ? void 0 : c.length) ? {
                            offerIds: t.offerIds
                        } : {}), [4, el.post(o, u)];
                    case 2:
                        if (500 === (s = b.sent().data).statusCode) return ip("AutoPurchaseErrorFromPurchaseApi", t.assetType), void 0 === s.showDivID && (s.showDivID = s.showDivId), void 0 === s.AssetID && (s.AssetID = s.assetId), r.hide(), (0, w.ItemPurchase)().openErrorView(s), eT(), [2, Promise.resolve()];
                        return t.isLibrary && (v = s.assetId, O = il.UrlSearchParams.parse(window.location.search, !1), f = {
                            assetId: v,
                            category: (E = function(e) {
                                var t;
                                return null != (t = O.get(e)) ? t : void 0
                            })("Category"),
                            creatorId: E("CreatorId"),
                            genre: E("GenreCsv"),
                            page: E("Page"),
                            position: E("Position"),
                            searchKeyword: E("SearchKeyword"),
                            sortAggregation: E("SortAggregation"),
                            sortType: E("SortType"),
                            userId: null == (g = eO()) ? void 0 : g.id,
                            searchId: E("SearchId")
                        }, (0, lH.sendEventWithTarget)("LibraryAssetAcquired", "Marketplace", f, lH.targetTypes.WWW)), ip(eo, t.assetType), r.hide(), d = t.userBalance - t.expectedPrice, lK(t, d, n, r), [2, Promise.resolve()];
                    case 3:
                        if (p = b.sent(), r.hide(), ip(ea, t.assetType), h = p, (void 0 === p ? "undefined" : p && "u" > typeof Symbol && p.constructor === Symbol ? "symbol" : typeof p) != "object" || !("responseText" in h.request)) return [2, Promise.reject(h.request)];
                        if ("Bad Request" === (y = h.request).responseText) lz(t, n);
                        else try {
                            m = JSON.parse(y.responseText || ""), (0, w.ItemPurchase)().openErrorView(m), eT()
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

    function lJ(e) {
        var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : void 0,
            r = arguments.length > 2 ? arguments[2] : void 0,
            n = arguments.length > 3 ? arguments[3] : void 0;
        return lZ(function() {
            var o, a, i, l, c, u, s, f, d;
            return lq(this, function(p) {
                if (null == (o = e.itemContainerElemClassList) ? void 0 : o.contains("btn-disabled-primary")) return [2, Promise.resolve()];
                if (l = "".concat(ec.EnvironmentUrls.apiGatewayUrl).concat("/game-passes/v1/game-passes/{productId}/purchase".replace("{productId}", e.productId)), c = "".concat(ec.EnvironmentUrls.economyApi).concat("/v1/purchases/products/{productId}".replace("{productId}", e.productId)), (null == (a = e.itemDetail) ? void 0 : a.collectibleItemId) && (s = e.itemDetail.collectibleItemInstanceId ? "/marketplace-sales/v1/item/{collectibleItemId}/purchase-resale" : "/marketplace-sales/v1/item/{collectibleItemId}/purchase-item", u = "".concat(ec.EnvironmentUrls.apiGatewayUrl).concat(s.replace("{collectibleItemId}", e.itemDetail.collectibleItemId))), t) return [2, t({
                    productId: e.productId,
                    expectedPrice: e.expectedPrice,
                    expectedCurrency: e.expectedCurrency,
                    expectedPromoId: null == (f = e.expectedPromoId) ? void 0 : f.toString(),
                    expectedSellerId: e.expectedSellerId,
                    userAssetId: null == (d = e.userAssetId) ? void 0 : d.toString()
                })];
                if (ip("AutoPurchaseStarted", e.assetType), null == (i = e.itemDetail) ? void 0 : i.subscriptionTargetKey) {
                    var h;
                    return [2, (h = "".concat(ec.EnvironmentUrls.apiGatewayUrl).concat("/v1/subscriptions/purchase-with-robux/{subscriptionTargetKey}".replace("{subscriptionTargetKey}", e.itemDetail.subscriptionTargetKey)), lZ(function() {
                        var t, o, a;
                        return lq(this, function(i) {
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
                                    return i.trys.push([1, 3, , 4]), [4, el.post(t, {
                                        priceInRobux: e.expectedPrice,
                                        idempotencyKey: ex()
                                    })];
                                case 2:
                                    return i.sent(), ip(eo, e.assetType), r.hide(), o = e.userBalance - e.expectedPrice, lK(e, o, n, r), [2, Promise.resolve()];
                                case 3:
                                    return a = i.sent(), r.hide(), ip(ea, e.assetType), lz(e, n), [2, Promise.reject(a)];
                                case 4:
                                    return [2]
                            }
                        })
                    })())]
                }
                return e.assetType === C ? [2, l$(l, e, r, n)] : u ? [2, l$(u, e, r, n)] : [2, l$(c, e, r, n)]
            })
        })()
    }

    function lQ(e, t, r, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, o)
    }
    var l0 = function(e) {
        var t = e.thumbnailImageUrl;
        return (0, eD.jsxs)("div", {
            className: "item-preview",
            style: {
                overflow: "hidden",
                maxWidth: "100%"
            },
            children: [(0, eD.jsx)("div", {
                className: "item-card-thumb",
                children: (0, eD.jsx)("img", {
                    alt: "item preview",
                    src: null != t ? t : "",
                    style: {
                        width: "150px",
                        height: "150px",
                        objectFit: "cover",
                        borderRadius: "8px"
                    }
                })
            }), (0, eD.jsx)("div", {
                className: "item-info text-name"
            })]
        })
    };

    function l1(e, t, r, n, o) {
        var a, i, l = function(e, t) {
            var r, n, o, a, i = P.constants.UPSELL_TARGET_ITEM_URL_REGEX.exec(window.location.pathname);
            if (P.constants.UPSELL_TARGET_ITEM_URL_REGEX.lastIndex = 0, Array.isArray(i) && i.length > 0 && (a = (function(e) {
                    if (Array.isArray(e)) return e
                }(i) || function(e) {
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
                        if ("string" == typeof e) return eI(e, 1);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return eI(e, 1)
                    }
                }(i) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }())[0]), !a || !e || Object.keys(e).length < 4) return "";
            var l = ex(),
                c = "".concat(e.expectedCurrency, ",").concat(e.expectedPrice, ",").concat(e.expectedSellerId, ",").concat(null != (r = e.userassetId) ? r : ""),
                u = e.productId || "";
            u += ",".concat(e.collectibleItemId || ""), u += ",".concat(e.collectibleItemInstanceId || ""), u += ",".concat(e.collectibleProductId || ""), u += ",".concat(e.subscriptionTargetKey || ""), u += ",".concat(encodeURIComponent(e.itemName || ""));
            var s = "".concat(l, ",").concat(a, ",").concat(null != (n = null == (o = eO()) ? void 0 : o.id) ? n : "", ",").concat(c, ",").concat(u),
                f = new Date;
            f.setHours(f.getHours() + 1);
            var d = [P.constants.UPSELL_COOKIE_KEY, "=", encodeURIComponent(s), "; expires=".concat(f.toUTCString()), "; path=/", "; domain=.", ec.EnvironmentUrls.domain, ";"];
            document.cookie = d.join("");
            if (l && (null == t ? void 0 : t.length)) try {
                window.sessionStorage.setItem(ej(l), JSON.stringify(t))
            } catch (e) {}
            return l
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
        ip("UpsellContinued", null == r ? void 0 : r.assetType), x().sendUserPurchaseFlowEvent(x().ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, x().ENUM_VIEW_NAME.ROBUX_UPSELL, x().ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, x().ENUM_VIEW_MESSAGE.GO_TO_ROBUX_PURCHASE_PAGE), window.location.href = (0, ep.getAbsoluteUrl)("".concat("/upgrades/paymentmethods", "?ap=").concat(e.roblox_product_id, "&UpsellUuid=").concat(l))
    }

    function l2(e, t, r, n) {
        var o = Date.now(),
            a = o - t;
        x().sendUserPurchaseFlowEvent(x().ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, x().ENUM_VIEW_NAME.ROBUX_UPSELL, x().ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, e, {
            userBalance: r.userBalanceRobux.toString(),
            itemCost: n.expectedItemPrice.toString(),
            modalImpressionTimeInMs: a.toString(),
            modalStartTimeInMs: t.toString(),
            modalEndTimeInMs: o.toString()
        })
    }

    function l3(e, t, r, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, o)
    }

    function l6(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function l5(e, t, r, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, o)
    }

    function l4(e, t) {
        try {
            (0, lH.sendEventWithTarget)("ItemPurchaseUpsellEvent", e, t, lH.targetTypes.WWW)
        } catch (e) {}
    }

    function l8(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
        return n
    }

    function l7(e, t, r, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, o)
    }

    function l9(e) {
        return function() {
            var t = this,
                r = arguments;
            return new Promise(function(n, o) {
                var a = e.apply(t, r);

                function i(e) {
                    l7(a, n, o, i, l, "next", e)
                }

                function l(e) {
                    l7(a, n, o, i, l, "throw", e)
                }
                i(void 0)
            })
        }
    }

    function ce(e, t) {
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
                if ("string" == typeof e) return l8(e, t);
                var r = Object.prototype.toString.call(e).slice(8, -1);
                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return l8(e, t)
            }
        }(e, t) || function() {
            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }

    function ct(e, t) {
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

    function cr(e, t, r, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, o)
    }
    var cn = function(e) {
            var t = document.querySelector('.PurchaseButton[data-product-id="'.concat(e.productId, '"]')),
                r = null == t ? void 0 : t.closest(".store-card"),
                n = null == r ? void 0 : r.querySelector(".gear-passes-asset img");
            return n ? n.src : null
        },
        co = function(e, t) {
            var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : window.location.pathname;
            if (r.includes(A)) {
                if (!t) throw Error("button data not exist");
                if (ip("UpsellFromGamesPage", t.assetType), "Subscription" === t.assetType) return e.imageurl;
                var n = cn(t);
                if (!n) throw ip("UpsellThumbnailProcessFailed", t.assetType), Error("thumbnail image url process failed");
                return n
            }
            return e.imageurl
        },
        ca = window.Roblox["core-scripts"].guac;

    function ci(e, t, r, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, o)
    }

    function cl(e, t, r, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, o)
    }

    function cc(e, t, r, n, o, a, i) {
        try {
            var l = e[a](i),
                c = l.value
        } catch (e) {
            r(e);
            return
        }
        l.done ? t(c) : Promise.resolve(c).then(n, o)
    }

    function cu(e) {
        return function() {
            var t = this,
                r = arguments;
            return new Promise(function(n, o) {
                var a = e.apply(t, r);

                function i(e) {
                    cc(a, n, o, i, l, "next", e)
                }

                function l(e) {
                    cc(a, n, o, i, l, "throw", e)
                }
                i(void 0)
            })
        }
    }

    function cs(e, t, r) {
        return t in e ? Object.defineProperty(e, t, {
            value: r,
            enumerable: !0,
            configurable: !0,
            writable: !0
        }) : e[t] = r, e
    }

    function cf(e, t) {
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
    var cd = function() {
        var e;

        function t() {
            var e = this;
            if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
            cs(this, "intl", void 0), cs(this, "intlProvider", void 0), cs(this, "translationResource", void 0), cs(this, "loadingOverlay", void 0), cs(this, "_state", {
                purchased: !1,
                retryRemainTimes: 5,
                timeoutHandle: null
            }), cs(this, "_checkBalanceAndPurchase", function(t, r) {
                return cu(function() {
                    var e, n, o;
                    return cf(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (e = this, this._state.purchased) return [2, Promise.resolve()];
                                a.label = 1;
                            case 1:
                                var i;
                                return a.trys.push([1, 5, , 6]), n = this.translationResource.get("Label.WaitingForRobux", {}), this.loadingOverlay.updateMessage(n), [4, (i = function() {
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
                                                r = {
                                                    url: "".concat(ec.EnvironmentUrls.economyApi).concat("/v1/users/{userId}/currency".replace("{userId}", null != (e = null == (t = eO()) ? void 0 : t.id) ? e : "")),
                                                    withCredentials: !0,
                                                    retryable: !1,
                                                    noCache: !0
                                                }, o.label = 1;
                                            case 1:
                                                return o.trys.push([1, 3, , 4]), [4, el.get(r)];
                                            case 2:
                                                if (200 === (n = o.sent()).status) return [2, n.data.robux];
                                                return [2, Promise.reject()];
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
                                        var o = i.apply(e, t);

                                        function a(e) {
                                            cr(o, r, n, a, l, "next", e)
                                        }

                                        function l(e) {
                                            cr(o, r, n, a, l, "throw", e)
                                        }
                                        a(void 0)
                                    })
                                })()];
                            case 2:
                                if (t.userBalance = o = a.sent(), !(o >= t.expectedPrice)) return [3, 4];
                                return [4, lJ(t, r, this.loadingOverlay, this.translationResource)];
                            case 3:
                                a.sent(), this._stopPeriodicChecking(), this._state.purchased = !0, a.label = 4;
                            case 4:
                                return this._state.purchased || (this._state.retryRemainTimes > 0 ? (this._state.timeoutHandle = window.setTimeout(function() {
                                    return cu(function() {
                                        return cf(this, function(e) {
                                            switch (e.label) {
                                                case 0:
                                                    return [4, this._checkBalanceAndPurchase(t, r)];
                                                case 1:
                                                    return e.sent(), [2]
                                            }
                                        })
                                    }).call(e)
                                }, 1e3), this._state.retryRemainTimes -= 1) : (ip("AutoPurchaseFailedDueToStillLowBalance", null == t ? void 0 : t.assetType), this._processGenericErrorState(t))), [3, 6];
                            case 5:
                                return a.sent(), ip(ea, null == t ? void 0 : t.assetType), this._processGenericErrorState(t), [3, 6];
                            case 6:
                                return [2, Promise.resolve()]
                        }
                    })
                }).call(e)
            }), cs(this, "_stopPeriodicChecking", function() {
                e._state.timeoutHandle && (clearTimeout(e._state.timeoutHandle), e._state.timeoutHandle = null)
            }), cs(this, "_processGenericErrorState", function(t) {
                e.loadingOverlay.hide(), lz(t, e.translationResource), eT()
            }), this.intl = new w.Intl, this.intlProvider = new w.TranslationResourceProvider(this.intl), this.translationResource = this.intlProvider.getTranslationResource(T), this.loadingOverlay = new lL
        }
        return e = [{
                key: "startItemUpsellProcess",
                value: function(e, t, r) {
                    return cu(function(e, t, r) {
                        var n, o, a, i, l, c, u, s, f, d, p, h, y, m, b, v, g, O, E, w, S, A, C, R, M, F, W = arguments;
                        return cf(this, function(X) {
                            var K, z, Y, Z, q, $, J, Q, er, eo, ea;
                            switch (X.label) {
                                case 0:
                                    if (n = W.length > 3 && void 0 !== W[3] ? W[3] : null == (K = document.getElementById(I)) ? void 0 : K.dataset, o = W.length > 4 && void 0 !== W[4] && W[4], !(i = n) || t.isLimited || (null == t || null == (a = t.buyButtonElementDataset) ? void 0 : a.assetType) === "Product") return r(e), [2, Promise.reject(e)];
                                    if (l = P.constants.UPSELL_TARGET_ITEM_URL_REGEX.exec(window.location.pathname), P.constants.UPSELL_TARGET_ITEM_URL_REGEX.lastIndex = 0, !Array.isArray(l)) return [3, 5];
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
                                                    return e.trys.push([0, 2, , 3]), [4, (0, ca.callBehaviour)("vng-buy-robux")];
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
                                                ci(o, r, n, a, i, "next", e)
                                            }

                                            function i(e) {
                                                ci(o, r, n, a, i, "throw", e)
                                            }
                                            a(void 0)
                                        })
                                    })()];
                                case 2:
                                    if (X.sent()) return x().startRobuxUpsellFlow(null != (c = null == (f = t.buyButtonElementDataset) ? void 0 : f.assetType) ? c : "", !!(null == (d = t.buyButtonElementDataset) ? void 0 : d.userassetId), null != (u = null == (p = t.buyButtonElementDataset) ? void 0 : p.isPrivateServer) && u, null != (s = null == (h = t.buyButtonElementDataset) ? void 0 : h.isPlace) && s, null == (y = t.buyButtonElementDataset) ? void 0 : y.productId), i.thumbnailImageUrl = co(i, t.buyButtonElementDataset), Y = i, Z = this.translationResource, q = this.intlProvider, Q = ew(t.expectedItemPrice), er = "<div class='item-card-container item-preview'>\n        <div class='item-card-thumb'>\n          <img alt='item preview' src='".concat(null != ($ = Y.thumbnailImageUrl) ? $ : "", "' />\n        </div>\n        <div class='item-info text-name'>\n        <div class='text-overflow item-card-name'>").concat((0, ed.escapeHtml)(t.assetName), "</div>\n          <div class='text-robux item-card-price'>").concat(Q, "</div>\n        </div>\n      </div>"), ip(ee, null == (J = t.buyButtonElementDataset) ? void 0 : J.assetType), x().sendUserPurchaseFlowEvent(x().ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, x().ENUM_VIEW_NAME.ROBUX_UPSELL, x().ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN), eo = er + (Z.get(H, {}) || "<div class='modal-message-block text-center border-top'>Sorry, you don't have enough Robux to buy this item. Would you like to purchase a Robux package?</div>"), ea = Z.get("Message.InsufficientRobuxRedirectToExternalPartner", {}) || "<div class='text-footer modal-message-block text-center'> You will be taken to our partner’s page to complete the purchase.</div>", ia({
                                        titleText: Z.get(B, {}) || "Insufficient Robux",
                                        bodyContent: eo,
                                        declineText: Z.get(D, {}),
                                        acceptText: Z.get(k, {}) || "Buy Robux",
                                        onAccept: function() {
                                            var e, r;
                                            return x().sendUserPurchaseFlowEvent(x().ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, x().ENUM_VIEW_NAME.ROBUX_UPSELL, x().ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, x().ENUM_VIEW_MESSAGE.BUY_ROBUX), (e = t.buyButtonElementDataset, (r = function() {
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
                                                        return x().sendUserPurchaseFlowEvent(x().ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, x().ENUM_VIEW_NAME.LEAVE_ROBLOX_WARNING, x().ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN, x().ENUM_VIEW_MESSAGE.EXTERNAL_LINK_MODAL), ip("ContinueBuyRobuxOnExternalSite", null == e ? void 0 : e.assetType), r = q.getTranslationResource(N), n = q.getTranslationResource(_), o = "<br /><br />", a = r.get(H, {
                                                            lineBreak: o,
                                                            linebreak: o
                                                        }) || "This purchase must be completed on our partner’s website. You will be returned to Roblox after the purchase is completed.<br /><br /> Proceed to partner website for payment?", ia({
                                                            titleText: r.get("Heading.InsufficientRobuxLeaveRoblox", {}) || "Leaving Roblox",
                                                            bodyContent: "<div class='modal-message-block text-center'>".concat(a, "</div>"),
                                                            declineText: n.get(V, {}),
                                                            acceptText: n.get("Action.ContinueToPayment", {}) || "Continue to Payment",
                                                            onAccept: function() {
                                                                x().sendUserPurchaseFlowEvent(x().ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, x().ENUM_VIEW_NAME.LEAVE_ROBLOX_WARNING, x().ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, x().ENUM_VIEW_MESSAGE.CONTINUE_TO_VNG), ip("ConfirmLeaveRobloxModal", null == e ? void 0 : e.assetType), lX()
                                                            },
                                                            onDecline: function() {
                                                                x().sendUserPurchaseFlowEvent(x().ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, x().ENUM_VIEW_NAME.LEAVE_ROBLOX_WARNING, x().ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, x().ENUM_VIEW_MESSAGE.CANCEL), ip(en, null == e ? void 0 : e.assetType)
                                                            },
                                                            onCancel: function() {
                                                                x().sendUserPurchaseFlowEvent(x().ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, x().ENUM_VIEW_NAME.LEAVE_ROBLOX_WARNING, x().ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, x().ENUM_VIEW_MESSAGE.CANCEL), ip(en, null == e ? void 0 : e.assetType)
                                                            },
                                                            allowHtmlContentInBody: !0,
                                                            allowHtmlContentInFooter: !1,
                                                            fieldValidationRequired: !0,
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
                                                        cl(a, n, o, i, l, "next", e)
                                                    }

                                                    function l(e) {
                                                        cl(a, n, o, i, l, "throw", e)
                                                    }
                                                    i(void 0)
                                                })
                                            })()).catch(function() {
                                                var e;
                                                ip("LeaveRobloxFailedToShown", null == (e = t.buyButtonElementDataset) ? void 0 : e.assetType), lX()
                                            }), !1
                                        },
                                        onDecline: function() {
                                            var e;
                                            x().sendUserPurchaseFlowEvent(x().ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, x().ENUM_VIEW_NAME.ROBUX_UPSELL, x().ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, x().ENUM_VIEW_MESSAGE.CANCEL), ip(et, null == (e = t.buyButtonElementDataset) ? void 0 : e.assetType)
                                        },
                                        onCancel: function() {
                                            var e;
                                            x().sendUserPurchaseFlowEvent(x().ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, x().ENUM_VIEW_NAME.ROBUX_UPSELL, x().ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, x().ENUM_VIEW_MESSAGE.CANCEL), ip(et, null == (e = t.buyButtonElementDataset) ? void 0 : e.assetType)
                                        },
                                        allowHtmlContentInBody: !0,
                                        allowHtmlContentInFooter: !0,
                                        footerText: ea,
                                        fieldValidationRequired: !0,
                                        xToCancel: !0
                                    }), [2, Promise.resolve()];
                                    return [4, ef(i, t)];
                                case 3:
                                    if (200 === (m = X.sent()).status) return x().startRobuxUpsellFlow(null != (b = null == (O = t.buyButtonElementDataset) ? void 0 : O.assetType) ? b : "", !!(null == (E = t.buyButtonElementDataset) ? void 0 : E.userassetId), null != (v = null == (w = t.buyButtonElementDataset) ? void 0 : w.isPrivateServer) && v, null != (g = null == (S = t.buyButtonElementDataset) ? void 0 : S.isPlace) && g, null == (A = t.buyButtonElementDataset) ? void 0 : A.productId), i.thumbnailImageUrl = co(i, t.buyButtonElementDataset), ! function(e, t, r, n, o, a, i) {
                                        var l, c, u = arguments.length > 7 && void 0 !== arguments[7] && arguments[7],
                                            s = ew(t.expectedItemPrice),
                                            f = "<div class='item-card-container item-preview'>\n        <div class='item-card-thumb'>\n          <img alt='item preview' src='".concat(null != (l = r.thumbnailImageUrl) ? l : "", "' />\n        </div>\n        <div class='item-info text-name'>\n        <div class='text-overflow item-card-name'>").concat((0, ed.escapeHtml)(t.assetName), "</div>\n          <div class='text-robux item-card-price'>").concat(s, "</div>\n        </div>\n      </div>");
                                        ip(ee, null == (c = t.buyButtonElementDataset) ? void 0 : c.assetType), x().sendUserPurchaseFlowEvent(x().ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, x().ENUM_VIEW_NAME.ROBUX_UPSELL, x().ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN),
                                            function(e, t, r, n, o, a, i, l) {
                                                var c = arguments.length > 8 && void 0 !== arguments[8] && arguments[8],
                                                    u = Date.now(),
                                                    s = "<a class='text-link-secondary terms-of-use-link' target='_blank' href='".concat((0, eh.getUrlWithLocale)(j, a.getRobloxLocale()), "'>"),
                                                    f = ew(t.shortfallPrice, !1),
                                                    d = ew(o.robux_amount),
                                                    p = o.robux_amount_before_bonus ? ew(o.robux_amount_before_bonus, !1, !0) : "",
                                                    h = e + i.get("Message.InsufficientRobuxNew", {
                                                        divTagStart: "<div class='modal-message-block text-center border-top'>",
                                                        divTagEnd: "</div>",
                                                        robuxNeeded: f,
                                                        robuxPackageAmount: d,
                                                        originalRobuxPackageAmount: p,
                                                        sentenceSplit: "<br>",
                                                        lineBreak: "",
                                                        aTagStart: s,
                                                        aTagEnd: "</a>",
                                                        divTagFooterStart: "<div class='modal-message-block text-center border-top modal-legal-footer'>",
                                                        divTagFooterEnd: "</div>"
                                                    }),
                                                    y = i.get(L, {});

                                                function m() {
                                                    var e, t;
                                                    return l2(x().ENUM_VIEW_MESSAGE.BUY_ROBUX_AND_ITEM, u, n, r), im(o, null != (e = null == (t = eO()) ? void 0 : t.isUnder13) && e, function() {
                                                        return l1(o, n, r.buyButtonElementDataset)
                                                    }, l, r.buyButtonElementDataset).catch(function() {
                                                        var e;
                                                        ip(ei, null == (e = r.buyButtonElementDataset) ? void 0 : e.assetType), l1(o, n, r.buyButtonElementDataset)
                                                    }), !1
                                                }

                                                function b() {
                                                    var e;
                                                    l2(x().ENUM_VIEW_MESSAGE.CANCEL, u, n, r), ip(et, null == (e = r.buyButtonElementDataset) ? void 0 : e.assetType)
                                                }
                                                if (c) {
                                                    var v, g, O, E, w, P, S, I, A = (null == (E = r.buyButtonElementDataset) ? void 0 : E.assetType) === "Subscription",
                                                        T = A && r.thumbnail ? r.thumbnail : l0({
                                                            thumbnailImageUrl: null != (v = n.thumbnailImageUrl) ? v : ""
                                                        }),
                                                        _ = null != (g = null == (w = r.buyButtonElementDataset) ? void 0 : w.collectibleItemId) ? g : null,
                                                        N = null != (O = null == (P = r.buyButtonElementDataset) ? void 0 : P.rentalOptionDays) ? O : null,
                                                        C = Number(n.userBalanceRobux),
                                                        R = o,
                                                        M = 0;
                                                    I = lD({
                                                        variant: "standard",
                                                        expectedPrice: r.expectedItemPrice,
                                                        upsellProduct: o,
                                                        assetName: r.assetName,
                                                        assetType: (null == (S = r.buyButtonElementDataset) ? void 0 : S.assetType) || "",
                                                        thumbnail: T,
                                                        currentRobuxBalance: C,
                                                        onAccept: m,
                                                        onCancel: b,
                                                        priceSuffix: A ? r.priceSuffix : void 0,
                                                        title: A ? i.get("Action.BuyRobuxAndSubscription", {}) : void 0,
                                                        discountInformation: r.discountInformation,
                                                        collectibleItemId: _,
                                                        rentalOptionDays: N,
                                                        isLimited: r.isLimited,
                                                        onRefetchPackage: function(e) {
                                                            if (!Number.isFinite(C) || !(e <= C)) {
                                                                var t = M += 1;
                                                                null == I || I.setPackageLoading(!0), ef(n, r, e).then(function(e) {
                                                                    t === M && (200 === e.status && e.data ? (R = e.data, null == I || I.updatePackage(e.data, !1)) : null == I || I.setPackageLoading(!1))
                                                                }).catch(function() {
                                                                    t === M && (null == I || I.setPackageLoading(!1))
                                                                })
                                                            }
                                                        },
                                                        onAcceptOffers: function(e) {
                                                            var t, o, a = e.purchasePrice,
                                                                i = e.offerIds;
                                                            l2(x().ENUM_VIEW_MESSAGE.BUY_ROBUX_AND_ITEM, u, n, r);
                                                            var c = i.length ? i : void 0;
                                                            return im(R, null != (t = null == (o = eO()) ? void 0 : o.isUnder13) && t, function() {
                                                                return l1(R, n, r.buyButtonElementDataset, a, c)
                                                            }, l, r.buyButtonElementDataset).catch(function() {
                                                                var e;
                                                                ip(ei, null == (e = r.buyButtonElementDataset) ? void 0 : e.assetType), l1(R, n, r.buyButtonElementDataset, a, c)
                                                            }), !1
                                                        },
                                                        onDirectPurchase: function(e) {
                                                            var t = e.purchasePrice,
                                                                o = e.offerIds;
                                                            l2(x().ENUM_VIEW_MESSAGE.BUY_ROBUX_AND_ITEM, u, n, r), (function(e) {
                                                                var t;
                                                                return (t = function(e) {
                                                                    var t, r, n, o, a, i, l, c, u, s, f, d, p, h;
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
                                                                                return t = e.itemDetail, r = e.itemPurchaseAjaxData, n = e.purchasePrice, o = e.offerIds, a = e.userBalance, i = e.translationResource, p = {
                                                                                    itemContainerElemClassList: void 0,
                                                                                    assetType: null != (l = null == (d = t.buyButtonElementDataset) ? void 0 : d.assetType) ? l : "",
                                                                                    assetName: (0, ed.escapeHtml)(t.assetName),
                                                                                    productId: null != (c = null == d ? void 0 : d.productId) ? c : "",
                                                                                    expectedPrice: n,
                                                                                    expectedCurrency: Number(null == d ? void 0 : d.expectedCurrency) || 1,
                                                                                    expectedPromoId: void 0,
                                                                                    expectedSellerId: Number(null == d ? void 0 : d.expectedSellerId) || 0,
                                                                                    userAssetId: (null == d ? void 0 : d.userassetId) ? Number(d.userassetId) : void 0,
                                                                                    context: "",
                                                                                    isLibrary: !1,
                                                                                    itemThumbnailUrl: null != (u = null != (s = r.thumbnailImageUrl) ? s : r.imageurl) ? u : "",
                                                                                    itemPath: window.location.pathname,
                                                                                    alertImageUrl: null != (f = r.alerturl) ? f : "",
                                                                                    userBalance: a,
                                                                                    itemPurchaseAjaxData: r,
                                                                                    itemDetail: d,
                                                                                    offerIds: o.length ? o : void 0
                                                                                }, (h = new lL).show(), h.updateMessage(i.get(G, {})), [4, lJ(p, null, h, i)];
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
                                                                            lQ(a, n, o, i, l, "next", e)
                                                                        }

                                                                        function l(e) {
                                                                            lQ(a, n, o, i, l, "throw", e)
                                                                        }
                                                                        i(void 0)
                                                                    })
                                                                }).apply(this, arguments)
                                                            })({
                                                                itemDetail: r,
                                                                itemPurchaseAjaxData: n,
                                                                purchasePrice: t,
                                                                offerIds: o,
                                                                userBalance: C,
                                                                translationResource: i
                                                            }).catch(function() {})
                                                        }
                                                    });
                                                    return
                                                }
                                                ia({
                                                    titleText: y,
                                                    bodyContent: h,
                                                    footerText: "",
                                                    declineText: i.get(D, {}),
                                                    acceptText: i.get(U, {}),
                                                    onAccept: m,
                                                    onDecline: function() {
                                                        var e;
                                                        l2(x().ENUM_VIEW_MESSAGE.CANCEL, u, n, r), ip(et, null == (e = r.buyButtonElementDataset) ? void 0 : e.assetType)
                                                    },
                                                    onCancel: b,
                                                    allowHtmlContentInBody: !0,
                                                    allowHtmlContentInFooter: !1,
                                                    fieldValidationRequired: !0,
                                                    xToCancel: !0
                                                })
                                            }(f, e, t, r, n, o, a, i, u)
                                    }(e, t, i, m.data, this.intl, this.intlProvider.getTranslationResource(T), this.intlProvider, o), [2, Promise.resolve()];
                                    return 204 === m.status ? ip("UpsellFailedDueToNoAvailablePackage", null == (C = t.buyButtonElementDataset) ? void 0 : C.assetType) : ip("UpsellFailedDueToFailedPackageRequest", null == (R = t.buyButtonElementDataset) ? void 0 : R.assetType), [3, 5];
                                case 4:
                                    return M = X.sent(), ip("UpsellFailed", null == (F = t.buyButtonElementDataset) ? void 0 : F.assetType), r(e), [2, Promise.reject(M)];
                                case 5:
                                    return r(e), [2, Promise.reject(e)]
                            }
                        })
                    }).apply(this, arguments)
                }
            }, {
                key: "showExceedLargestInsufficientRobuxModal",
                value: function(e, t, r) {
                    var n, o, a, i, l = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : null == (n = document.getElementById(I)) ? void 0 : n.dataset,
                        c = arguments.length > 4 && void 0 !== arguments[4] && arguments[4];
                    if (ip("UpsellExceedLargestEntryPoint", null == t ? void 0 : t.assetType), !(null == l ? void 0 : l.imageurl)) {
                        ip("UpsellExceedLargestNoThumbnailImage", null == t ? void 0 : t.assetType), r();
                        return
                    }
                    try {
                        x().startRobuxUpsellFlow(null != (o = null == t ? void 0 : t.assetType) ? o : "", !!(null == t ? void 0 : t.userassetId), null != (a = null == t ? void 0 : t.isPrivateServer) && a, null != (i = null == t ? void 0 : t.isPlace) && i, null == t ? void 0 : t.productId),
                            function(e, t, r, n) {
                                var o, a = arguments.length > 4 && void 0 !== arguments[4] && arguments[4],
                                    i = arguments.length > 5 ? arguments[5] : void 0,
                                    l = ew(e),
                                    c = parseInt(r.expectedPrice, 10),
                                    u = ew(c),
                                    s = window.location.pathname;
                                ep.supportLocalizedUrls && (s = (0, ep.removeUrlLocale)(s));
                                var f = t;
                                s.startsWith(A) && (f = null != (o = cn(r)) ? o : f);
                                var d = "<div class='item-card-container item-preview'>\n        <div class='item-card-thumb'>\n          <img alt='item preview' src='".concat(f, "' />\n        </div>\n        <div class='item-info text-name'>\n        <div class='text-overflow item-card-name'>").concat((0, ed.escapeHtml)(r.itemName), "</div>\n          <div class='text-robux item-card-price'>").concat(u, "</div>\n        </div>\n      </div>") + n.get("Message.InsufficientRobuxExceedLargestPackage", {
                                    divTagStart: "<div class='modal-message-block text-center border-top'>",
                                    divTagEnd: "</div>",
                                    robuxNeeded: l
                                });

                                function p() {
                                    var e, t, n, o;
                                    return x().sendUserPurchaseFlowEvent(x().ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, x().ENUM_VIEW_NAME.ROBUX_UPSELL_EXCEED_LARGEST_PACKAGE, x().ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, x().ENUM_VIEW_MESSAGE.GO_TO_ROBUX_STORE), ip("UpsellExceedLargestGoToRobuxStoreClicked", null == r ? void 0 : r.assetType), ! function(e, t) {
                                        if (e && t) {
                                            window.location.href = (0, eh.getUrlWithQueries)("/Upgrades/Robux.aspx", {
                                                ctx: ""
                                            });
                                            return
                                        }
                                        window.location.href = (0, ep.getAbsoluteUrl)("/upgrades/robux?ctx=upsell")
                                    }(null != (e = null == (n = (0, lG.getDeviceMeta)()) ? void 0 : n.isTablet) && e, null != (t = null == (o = (0, lG.getDeviceMeta)()) ? void 0 : o.isUniversalApp) && t), !1
                                }

                                function h() {
                                    x().sendUserPurchaseFlowEvent(x().ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, x().ENUM_VIEW_NAME.ROBUX_UPSELL_EXCEED_LARGEST_PACKAGE, x().ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, x().ENUM_VIEW_MESSAGE.CANCEL), ip(et, null == r ? void 0 : r.assetType)
                                }
                                if (x().sendUserPurchaseFlowEvent(x().ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, x().ENUM_VIEW_NAME.ROBUX_UPSELL_EXCEED_LARGEST_PACKAGE, x().ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN), ip("UpsellExceedLargestShown", r.assetType), a) {
                                    var y = !0 === r.isPrivateServer && i ? i : l0({
                                        thumbnailImageUrl: null != f ? f : ""
                                    });
                                    lD({
                                        variant: "tooExpensive",
                                        expectedPrice: c,
                                        assetName: r.itemName,
                                        thumbnail: y,
                                        onAccept: p,
                                        onCancel: h
                                    });
                                    return
                                }
                                ia({
                                    titleText: n.get(B, {}),
                                    bodyContent: d,
                                    declineText: n.get(D, {}),
                                    acceptText: n.get("Action.GoToRobuxStore", {}),
                                    onAccept: p,
                                    onDecline: function() {
                                        x().sendUserPurchaseFlowEvent(x().ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL, !0, x().ENUM_VIEW_NAME.ROBUX_UPSELL_EXCEED_LARGEST_PACKAGE, x().ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, x().ENUM_VIEW_MESSAGE.CANCEL), ip("UpsellExceedLargestCancelled", null == r ? void 0 : r.assetType)
                                    },
                                    onCancel: h,
                                    allowHtmlContentInBody: !0,
                                    allowHtmlContentInFooter: !1,
                                    fieldValidationRequired: !0,
                                    xToCancel: !0
                                })
                            }(e, l.imageurl, t, this.intlProvider.getTranslationResource(T), c), ip("UpsellExceedLargestModalExpTrue", null == t ? void 0 : t.assetType)
                    } catch (e) {
                        ip("UpsellExceedLargestModalExpError", null == t ? void 0 : t.assetType), r()
                    }
                }
            }, {
                key: "initiateAutoPurchase",
                value: function(e, t) {
                    return cu(function(e, t) {
                        var r, n, o, a, i, l, c, u, s = arguments;
                        return cf(this, function(f) {
                            switch (f.label) {
                                case 0:
                                    r = s.length > 2 && void 0 !== s[2] ? s[2] : document.getElementById(I), n = s.length > 3 && void 0 !== s[3] ? s[3] : document.getElementById("item-container"), this._state = {
                                        purchased: !1,
                                        retryRemainTimes: 5,
                                        timeoutHandle: null
                                    }, this.loadingOverlay.show(), ip("AutoPurchaseEntryPoint", Q), f.label = 1;
                                case 1:
                                    var d, p, h;
                                    return f.trys.push([1, 3, , 4]), (!e || !(e.startsWith("/catalog/") || e.startsWith("/bundles/") || e.startsWith("/game-pass/") || e.startsWith(A)) || e.includes("UpsellUuid=")) && (P.expireUpsellCookie(), window.location.href = (0, ep.getAbsoluteUrl)("/catalog")), [4, (d = n, p = null == n ? void 0 : n.dataset, h = null == r ? void 0 : r.dataset, l9(function() {
                                        var t, r, n, o, a, i, l, c, u, s, f, y;
                                        return ct(this, function(m) {
                                            switch (m.label) {
                                                case 0:
                                                    return [4, l9(function() {
                                                        var t, r, n, o, a, i, l, c, u;
                                                        return ct(this, function(s) {
                                                            var f, d, y;
                                                            switch (s.label) {
                                                                case 0:
                                                                    if ((t = P.parseUpsellCookie()) && 0 !== Object.keys(t).length && (!t.targetItemUrl || e.startsWith(t.targetItemUrl)) || (ip("AutoPurchasePotentialHackingActionSpotted2", Q), l4(Y, {
                                                                            itemPath: e,
                                                                            upsellCookieData: t
                                                                        }), eT(), lV(e)), (r = h) || (eT(), lV(e)), t.subscriptionTargetKey) return o = {
                                                                        expectedPrice: t.expectedPrice || "0",
                                                                        expectedCurrency: t.expectedCurrency || "1",
                                                                        expectedSellerId: t.expectedSellerId || "",
                                                                        assetType: "Subscription",
                                                                        productId: t.productId || "0",
                                                                        itemName: String(t.itemName || (null == p ? void 0 : p.itemName) || ""),
                                                                        subscriptionTargetKey: String(null != (n = t.subscriptionTargetKey) ? n : "")
                                                                    }, [2, [r, o]];
                                                                    s.label = 1;
                                                                case 1:
                                                                    return s.trys.push([1, 3, , 4]), [4, (i = t.collectibleItemId ? null == p ? void 0 : p.productId : t.productId, l9(function() {
                                                                        var t, r;
                                                                        return ct(this, function(n) {
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
                                                                                                        url: "".concat(ec.EnvironmentUrls.economyApi).concat(e),
                                                                                                        withCredentials: !0
                                                                                                    }, o.label = 1;
                                                                                                case 1:
                                                                                                    return o.trys.push([1, 3, , 4]), [4, el.get(t)];
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
                                                                                                l3(a, r, n, i, l, "next", e)
                                                                                            }

                                                                                            function l(e) {
                                                                                                l3(a, r, n, i, l, "throw", e)
                                                                                            }
                                                                                            i(void 0)
                                                                                        })
                                                                                    })()];
                                                                                case 2:
                                                                                    if (!(t = n.sent()) || 0 === Object.keys(t).length) return ip("AutoPurchasePotentialHackingActionSpotted3", Q), l4(q, {
                                                                                        itemPath: e,
                                                                                        productId: i
                                                                                    }), [2, Promise.reject()];
                                                                                    return [2, t];
                                                                                case 3:
                                                                                    return r = n.sent(), ip("AutoPurchasePotentialHackingActionSpotted4", Q), l4(Z, {
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
                                                                    return l = s.sent(), l4($, {
                                                                        itemPath: e,
                                                                        upsellCookieData: t,
                                                                        error: l
                                                                    }), eT(), lV(e), [2, Promise.reject()];
                                                                case 4:
                                                                    return [4, (f = a.assetId, d = a.assetType, (y = function() {
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
                                                                                    d === C ? (t = "/v1/game-passes", e = {
                                                                                        gamePassIds: f
                                                                                    }) : d === R ? (t = "/v1/bundles/thumbnails", e = {
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
                                                                                    }({}, e, M), r = {
                                                                                        url: "".concat(ec.EnvironmentUrls.thumbnailsApi).concat(t),
                                                                                        withCredentials: !0
                                                                                    }, a.label = 1;
                                                                                case 1:
                                                                                    return a.trys.push([1, 3, , 4]), [4, el.get(r, e)];
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
                                                                                                if ("string" == typeof e) return l6(e, 1);
                                                                                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                                                                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                                                                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return l6(e, 1)
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
                                                                                l5(o, r, n, a, i, "next", e)
                                                                            }

                                                                            function i(e) {
                                                                                l5(o, r, n, a, i, "throw", e)
                                                                            }
                                                                            a(void 0)
                                                                        })
                                                                    })())];
                                                                case 5:
                                                                    return c = s.sent(), r.imageurl = c || r.imageurl, u = {
                                                                        expectedPrice: t.expectedPrice || "0",
                                                                        expectedCurrency: t.expectedCurrency || "1",
                                                                        expectedSellerId: t.expectedSellerId || "",
                                                                        itemId: a.assetId || (null == p ? void 0 : p.itemId),
                                                                        itemName: a.assetName || (null == p ? void 0 : p.itemName),
                                                                        assetType: a.assetType || (null == p ? void 0 : p.assetType),
                                                                        assetGranted: null == p ? void 0 : p.assetGranted,
                                                                        assetTypeDisplayName: a.assetTypeDisplayName || (null == p ? void 0 : p.assetTypeDisplayName),
                                                                        assetTypeId: null == p ? void 0 : p.assetTypeId,
                                                                        productId: a.productId || t.productId || (null == p ? void 0 : p.productId),
                                                                        itemType: a.assetType || (null == p ? void 0 : p.itemType),
                                                                        currentTime: null == p ? void 0 : p.currentTime,
                                                                        isPurchaseEnabled: null == p ? void 0 : p.isPurchaseEnabled,
                                                                        placeproductpromotionId: null == p ? void 0 : p.placeproductpromotionId,
                                                                        userassetId: t.userAssetId || (null == p ? void 0 : p.userassetId),
                                                                        collectibleItemId: t.collectibleItemId || (null == p ? void 0 : p.collectibleItemId),
                                                                        collectibleItemInstanceId: t.collectibleItemInstanceId || (null == p ? void 0 : p.collectibleItemInstanceId),
                                                                        collectibleProductId: t.collectibleProductId || (null == p ? void 0 : p.collectibleProductId)
                                                                    }, [2, [r, u]]
                                                            }
                                                        })
                                                    })()];
                                                case 1:
                                                    r = (t = ce.apply(void 0, [m.sent(), 2]))[0], o = (n = t[1]).placeproductpromotionId, a = "LibraryItem" === ((null === w.MetaDataValues || void 0 === w.MetaDataValues ? void 0 : w.MetaDataValues.getPageName()) || ""), i = parseInt(r.userBalanceRobux, 10), l = parseInt(n.expectedCurrency, 10), c = parseInt(n.expectedPrice, 10), u = parseInt(n.expectedSellerId, 10), s = {
                                                        itemContainerElemClassList: null == d ? void 0 : d.classList,
                                                        assetType: n.assetType,
                                                        assetName: (0, ed.escapeHtml)(n.itemName),
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
                                                            var t = window.sessionStorage.getItem(ej(e));
                                                            if (!t) return [];
                                                            var r = JSON.parse(t);
                                                            if (Array.isArray(r)) return r.filter(function(e) {
                                                                return "string" == typeof e
                                                            });
                                                            return []
                                                        } catch (e) {
                                                            return []
                                                        }
                                                    }(f = P.parseUpsellCookie().upsellUuid)).length && (s.offerIds = y);
                                                    if (f) try {
                                                        window.sessionStorage.removeItem(ej(f))
                                                    } catch (e) {}
                                                    return [2, s]
                                            }
                                        })
                                    })())];
                                case 2:
                                    return o = f.sent(), [3, 4];
                                case 3:
                                    return f.sent(), this.loadingOverlay.hide(), eT(), [2, Promise.resolve()];
                                case 4:
                                    a = this.translationResource.get(G, {}), i = o.userBalance, l = o.expectedPrice, f.label = 5;
                                case 5:
                                    if (f.trys.push([5, 9, , 10]), e.startsWith(A) && (null == (c = document.getElementById("tab-store")) || c.click()), !(i > l)) return [3, 7];
                                    return this.loadingOverlay.updateMessage(a), [4, lJ(o, t, this.loadingOverlay, this.translationResource)];
                                case 6:
                                    return f.sent(), this._state.purchased = !0, [2, Promise.resolve()];
                                case 7:
                                    return [4, this._checkBalanceAndPurchase(o, t)];
                                case 8:
                                    return f.sent(), [3, 10];
                                case 9:
                                    return u = f.sent(), this.loadingOverlay.hide(), ip(ea, null == o ? void 0 : o.assetType), l4(J, {
                                        itemPurchaseObj: o,
                                        error: u
                                    }), eT(), [3, 10];
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
    void 0 === window.Roblox && (window.Roblox = {}), void 0 === window.Roblox.ItemPurchaseUpsellService && (window.Roblox.ItemPurchaseUpsellService = new cd)
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("ItemPurchaseUpsell");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/itemPurchaseUpsell-8917fb15a051c71a.js.map
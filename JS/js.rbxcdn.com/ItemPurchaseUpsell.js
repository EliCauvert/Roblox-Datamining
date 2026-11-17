! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "44fc9454dc27fb95cac3107e60ec172e51ad6797"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "263cc359-28e3-4979-8698-d6dbb56f9088", e._sentryDebugIdIdentifier = "sentry-dbid-263cc359-28e3-4979-8698-d6dbb56f9088")
    } catch (e) {}
}(),
function() {
    "use strict";
    var e, t, n, r, a, i, o, u, s, l, c, d, h, f, m, p, E, v, g, b, y = {},
        _ = {};

    function A(e) {
        var t = _[e];
        if (void 0 !== t) return t.exports;
        var n = _[e] = {
            exports: {}
        };
        return y[e](n, n.exports, A), n.exports
    }
    A.m = y, A.n = function(e) {
        var t = e && e.__esModule ? function() {
            return e.default
        } : function() {
            return e
        };
        return A.d(t, {
            a: t
        }), t
    }, A.d = function(e, t) {
        for (var n in t) A.o(t, n) && !A.o(e, n) && Object.defineProperty(e, n, {
            enumerable: !0,
            get: t[n]
        })
    }, A.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, A.r = function(e) {
        "u" > typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, A.nc = void 0, A.rv = function() {
        return "1.7.12"
    }, A.ruid = "bundler=rspack@1.7.12";
    var C = window.React,
        P = A.n(C),
        T = window.ReactDOM,
        S = A.n(T),
        x = globalThis.window,
        R = globalThis.document,
        B = void 0 === x ? void 0 : x,
        I = void 0 === R ? void 0 : R;

    function N(e, t, n, r, a, i, o) {
        try {
            var u = e[i](o),
                s = u.value
        } catch (e) {
            n(e);
            return
        }
        u.done ? t(s) : Promise.resolve(s).then(r, a)
    }

    function w(e) {
        return function() {
            var t = this,
                n = arguments;
            return new Promise(function(r, a) {
                var i = e.apply(t, n);

                function o(e) {
                    N(i, r, a, o, u, "next", e)
                }

                function u(e) {
                    N(i, r, a, o, u, "throw", e)
                }
                o(void 0)
            })
        }
    }

    function U(e, t) {
        return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
    }

    function D(e, t) {
        if (!U(e, t)) throw TypeError("Cannot call a class as a function")
    }

    function O(e, t) {
        for (var n = 0; n < t.length; n++) {
            var r = t[n];
            r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
        }
    }

    function F(e, t, n) {
        return t && O(e.prototype, t), n && O(e, n), e
    }

    function M(e, t, n) {
        return t in e ? Object.defineProperty(e, t, {
            value: n,
            enumerable: !0,
            configurable: !0,
            writable: !0
        }) : e[t] = n, e
    }

    function L(e, t) {
        var n, r, a, i = {
                label: 0,
                sent: function() {
                    if (1 & a[0]) throw a[1];
                    return a[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
            u = Object.defineProperty;
        return u(o, "next", {
            value: s(0)
        }), u(o, "throw", {
            value: s(1)
        }), u(o, "return", {
            value: s(2)
        }), "function" == typeof Symbol && u(o, Symbol.iterator, {
            value: function() {
                return this
            }
        }), o;

        function s(u) {
            return function(s) {
                var l = [u, s];
                if (n) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, l[0] && (i = 0)), i;) try {
                    if (n = 1, r && (a = 2 & l[0] ? r.return : l[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, l[1])).done) return a;
                    switch (r = 0, a && (l = [2 & l[0], a.value]), l[0]) {
                        case 0:
                        case 1:
                            a = l;
                            break;
                        case 4:
                            return i.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            i.label++, r = l[1], l = [0];
                            continue;
                        case 7:
                            l = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === l[0] && (!a || l[1] > a[0] && l[1] < a[3])) {
                                i.label = l[1];
                                break
                            }
                            if (6 === l[0] && i.label < a[1]) {
                                i.label = a[1], a = l;
                                break
                            }
                            if (a && i.label < a[2]) {
                                i.label = a[2], i.ops.push(l);
                                break
                            }
                            a[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    l = t.call(e, i)
                } catch (e) {
                    l = [6, e], r = 0
                } finally {
                    n = a = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }
    var k = window.Roblox["core-scripts"].intl.intl,
        H = A.n(k),
        G = window.Roblox["core-scripts"].intl.translation,
        j = window.Roblox["core-lib"].index;

    function W(e) {
        if (Array.isArray(e)) return e
    }

    function V() {
        throw TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
    }

    function X(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
        return r
    }

    function z(e, t) {
        if (e) {
            if ("string" == typeof e) return X(e, t);
            var n = Object.prototype.toString.call(e).slice(8, -1);
            if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return X(e, t)
        }
    }

    function K(e, t) {
        return W(e) || function(e, t) {
            var n, r, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
            if (null != a) {
                var i = [],
                    o = !0,
                    u = !1;
                try {
                    for (a = a.call(e); !(o = (n = a.next()).done) && (i.push(n.value), !t || i.length !== t); o = !0);
                } catch (e) {
                    u = !0, r = e
                } finally {
                    try {
                        o || null == a.return || a.return()
                    } finally {
                        if (u) throw r
                    }
                }
                return i
            }
        }(e, t) || z(e, t) || V()
    }

    function Y(e) {
        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
    }

    function q(e) {
        return function(e) {
            if (Array.isArray(e)) return X(e)
        }(e) || Y(e) || z(e) || function() {
            throw TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }
    q(["ar-001", "de-de", "en-us", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "nl-nl", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn", "zh-cn", "zh-tw"]).concat(q(["bg-bg", "bn-bd", "bs-ba", "cs-cz", "da-dk", "el-gr", "en-gb", "es-mx", "et-ee", "fi-fi", "fil-ph", "fr-ca", "hr-hr", "hu-hu", "ka-ge", "kk-kz", "km-kh", "lt-lt", "lv-lv", "ms-my", "my-mm", "nb-no", "pt-pt", "ro-ro", "ru-ru", "si-lk", "sk-sk", "sl-sl", "sq-al", "sr-rs", "sv-se", "uk-ua"]));
    var Z = q(["ar_001", "de_de", "en_us", "es_es", "fr_fr", "hi_in", "id_id", "it_it", "ja_jp", "ko_kr", "nl_nl", "pl_pl", "pt_br", "th_th", "tr_tr", "vi_vn", "zh_cn", "zh_tw"]).concat(q(["bg_bg", "bn_bd", "bs_ba", "cs_cz", "da_dk", "el_gr", "en_gb", "es_mx", "et_ee", "fi_fi", "fil_ph", "fr_ca", "hr_hr", "hu_hu", "ka_ge", "kk_kz", "km_kh", "lt_lt", "lv_lv", "ms_my", "my_mm", "nb_no", "pt_pt", "ro_ro", "ru_ru", "si_lk", "sk_sk", "sl_sl", "sq_al", "sr_rs", "sv_se", "uk_ua"])),
        Q = q(["ar-001", "de-DE", "en-US", "es-ES", "fr-FR", "hi-IN", "id-ID", "it-IT", "ja-JP", "ko-KR", "nl-NL", "pl-PL", "pt-BR", "th-TH", "tr-TR", "vi-VN", "zh-CN", "zh-TW"]).concat(q(["bg-BG", "bn-BD", "bs-BA", "cs-CZ", "da-DK", "el-GR", "en-GB", "es-MX", "et-EE", "fi-FI", "fil-PH", "fr-CA", "hr-HR", "hu-HU", "ka-GE", "kk-KZ", "km-KH", "lt-LT", "lv-LV", "ms-MY", "my-MM", "nb-NO", "pt-PT", "ro-RO", "ru-RU", "si-LK", "sk-SK", "sl-SL", "sq-AL", "sr-RS", "sv-SE", "uk-UA"])),
        J = function(e) {
            var t = K(e.split("-"), 2),
                n = t[0],
                r = t[1];
            return "".concat(n, "-").concat(null == r ? void 0 : r.toUpperCase())
        };
    q(["ar", "de", "es", "fr", "hi", "id", "it", "ja", "ko", "nl", "pl", "pt", "th", "tr", "vi"]).concat(q(["ar-001", "de-de", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "nl-nl", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn"]));
    var $ = new Map([
        ["zh_cjv", "zh_cn"]
    ]);

    function ee() {
        var e, t;
        return null != (e = null != (t = function() {
            if (!("u" < typeof document)) {
                var e = document.documentElement.lang;
                if (e) return (0, j.arrayIncludes)(Q, e) ? e.toLowerCase() : void 0
            }
        }()) ? t : function() {
            if ("u" < typeof document) return;
            var e, t = document.querySelector('meta[name="locale-data"]');
            if (U(t, HTMLMetaElement)) {
                var n = t.dataset.languageCode;
                if (n) {
                    var r = null != (e = $.get(n)) ? e : n;
                    if ((0, j.arrayIncludes)(Z, r)) return r.replace("_", "-")
                }
            }
        }()) ? e : "en-us"
    }
    var et = function(e, t) {
            var n;
            return (n = ee(), {
                dateTime: function(e, t) {
                    try {
                        return new Intl.DateTimeFormat(J(n), t).format(U(e, Date) ? e : new Date(e))
                    } catch (e) {
                        return ""
                    }
                },
                number: function(e, t) {
                    try {
                        return new Intl.NumberFormat(J(n), t).format(e)
                    } catch (t) {
                        return String(e)
                    }
                }
            }).dateTime(e, t)
        },
        en = window.Roblox["core-scripts"].util.upsell;

    function er(e) {
        for (var t = 1; t < arguments.length; t++) {
            var n = null != arguments[t] ? arguments[t] : {},
                r = Object.keys(n);
            "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                return Object.getOwnPropertyDescriptor(n, e).enumerable
            }))), r.forEach(function(t) {
                M(e, t, n[t])
            })
        }
        return e
    }
    var ea = "function" == typeof crypto.randomUUID,
        ei = function() {
            var e = new Uint8Array(16);
            crypto.getRandomValues(e);
            var t = Array.from(e, function(e, t) {
                return (6 === t ? 15 & e | 64 : 8 === t ? 63 & e | 128 : e).toString(16).padStart(2, "0")
            });
            return "".concat(t.slice(0, 4).join(""), "-").concat(t.slice(4, 6).join(""), "-").concat(t.slice(6, 8).join(""), "-") + "".concat(t.slice(8, 10).join(""), "-").concat(t.slice(10, 16).join(""))
        },
        eo = function() {
            return ea ? crypto.randomUUID() : ei()
        },
        eu = window.Roblox["core-scripts"].meta.device,
        es = window.Roblox["core-scripts"].environmentUrls,
        el = A.n(es);

    function ec(e, t, n) {
        return t in e ? Object.defineProperty(e, t, {
            value: n,
            enumerable: !0,
            configurable: !0,
            writable: !0
        }) : e[t] = n, e
    }
    var ed = function e() {
        var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {
            baseUrl: ""
        };
        if (!U(this, e)) throw TypeError("Cannot call a class as a function");
        ec(this, "configuration", void 0), ec(this, "baseUrl", void 0), this.configuration = t, this.baseUrl = this.configuration.baseUrl
    };

    function eh(e, t, n) {
        return t in e ? Object.defineProperty(e, t, {
            value: n,
            enumerable: !0,
            configurable: !0,
            writable: !0
        }) : e[t] = n, e
    }
    var ef = function() {
            var e;

            function t() {
                var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : new ed;
                if (!U(this, t)) throw TypeError("Cannot call a class as a function");
                eh(this, "configuration", void 0), eh(this, "baseUrl", void 0), this.configuration = e, this.baseUrl = e.baseUrl
            }
            return e = [{
                    key: "sendEvent",
                    value: function(e) {
                        var t = e.localTime,
                            n = e.target,
                            r = e.eventType,
                            a = e.context,
                            i = e.additionalProperties,
                            o = e.currentUrl,
                            u = e.guestId,
                            s = e.sessionId,
                            l = t.toISOString(),
                            c = new URL("".concat(this.baseUrl, "/pe"));
                        return c.searchParams.append("t", n), c.searchParams.append("evt", r), c.searchParams.append("ctx", a), c.searchParams.append("lt", l), c.searchParams.append("url", o || window.location.href), void 0 !== u && c.searchParams.append("gid", u), void 0 !== s && c.searchParams.append("sid", s), void 0 !== i && Object.keys(i).forEach(function(e) {
                            var t;
                            c.searchParams.append(e, (null != (t = i[e]) ? t : "").toString())
                        }), fetch(c.href, {
                            credentials: "same-origin"
                        })
                    }
                }, {
                    key: "sendEventViaImg",
                    value: function(e, t) {
                        var n = e.localTime,
                            r = e.target,
                            a = e.eventType,
                            i = e.context,
                            o = e.additionalProperties,
                            u = e.currentUrl,
                            s = e.guestId,
                            l = e.sessionId,
                            c = n.toISOString(),
                            d = new URL("".concat(this.baseUrl, "/e.png"));
                        d.searchParams.append("t", r), d.searchParams.append("evt", a), d.searchParams.append("ctx", i), d.searchParams.append("lt", c), d.searchParams.append("url", u || window.location.href), void 0 !== s && d.searchParams.append("gid", s), void 0 !== l && d.searchParams.append("sid", l), void 0 !== o && Object.keys(o).forEach(function(e) {
                            var t;
                            d.searchParams.append(e, (null != (t = o[e]) ? t : "").toString())
                        });
                        var h = new Image;
                        return h.src = d.href, h.onload = function() {
                            void 0 !== t && t(!0)
                        }, h.onerror = function(e) {
                            void 0 !== t && t(!1), console.error(e)
                        }, h
                    }
                }],
                function(e, t) {
                    for (var n = 0; n < t.length; n++) {
                        var r = t[n];
                        r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
                    }
                }(t.prototype, e), t
        }(),
        em = function(e) {
            var t, n = "".concat(e, "="),
                r = null == (t = document.cookie.split("; ").find(function(e) {
                    return e.startsWith(n)
                })) ? void 0 : t.slice(n.length);
            return null == r ? null : {
                name: e,
                value: decodeURIComponent(r)
            }
        },
        ep = function(e, t, n) {
            var r, a = null == n.sameSite ? "" : ";samesite=".concat(n.sameSite),
                i = null == n.domain ? "" : ";domain=".concat(n.domain),
                o = ";path=".concat(null != (r = n.path) ? r : "/"),
                u = null == n.expires ? "" : ";expires=".concat(n.expires.toUTCString()),
                s = null == n.maxAge ? "" : ";max-age=".concat(n.maxAge);
            document.cookie = "".concat(e, "=").concat(encodeURIComponent(t), ";secure").concat(a).concat(i).concat(o).concat(u).concat(s)
        },
        eE = function(e, t, n) {
            ep(e, t, n)
        },
        ev = function(e, t) {
            ep(e, "", {
                domain: t.domain,
                path: t.path,
                expires: new Date(0)
            })
        };

    function eg(e, t) {
        return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
            var t = Object.keys(e);
            if (Object.getOwnPropertySymbols) {
                var n = Object.getOwnPropertySymbols(e);
                t.push.apply(t, n)
            }
            return t
        })(Object(t)).forEach(function(n) {
            Object.defineProperty(e, n, Object.getOwnPropertyDescriptor(t, n))
        }), e
    }
    var eb = "RBXPaymentsFlowContext",
        ey = {
            WEB_ROBUX_PURCHASE: "WebRobuxPurchase",
            MOBILE_WEB_ROBUX_PURCHASE: "MobileWebRobuxPurchase",
            MOBILE_WEB_PREMIUM_PURCHASE: "MobileWebPremiumPurchase",
            WEB_PREMIUM_PURCHASE: "WebPremiumPurchase",
            WEB_CATALOG_ROBUX_UPSELL: "WebCatalogRobuxUpsell",
            WEB_CATALOG_PREMIUM_UPSELL: "WebCatalogPremiumUpsell",
            WEB_CATALOG_COLLECTIVE_ITEM_ROBUX_UPSELL: "WebCatalogCollectiveItemRobuxUpsell",
            WEB_CATALOG_BUNDLE_ITEM_ROBUX_UPSELL: "WebCatalogBundleItemRobuxUpsell",
            WEB_PAID_GAME_ROBUX_UPSELL: "WebPaidGameRobuxUpsell",
            WEB_GAME_PASS_ROBUX_UPSELL: "WebGamePassRobuxUpsell",
            WEB_DEVELOPER_PRODUCT_ROBUX_UPSELL: "WebDeveloperProductRobuxUpsell",
            WEB_PRIVATE_SERVER_ROBUX_UPSELL: "WebPrivateServerRobuxUpsell",
            WEB_CATALOG_CART_ROBUX_UPSELL: "WebCatalogCartRobuxUpsell",
            WEBVIEW_ROBUX_PURCHASE: "WebViewRobuxPurchase",
            WEBVIEW_PREMIUM_PURCHASE: "WebViewPremiumPurchase",
            WEB_ROBUX_GIFT_PURCHASE: "WebRobuxGiftPurchase",
            WEB_ROBUX_GIFT_POST_CHECKOUT: "WebRobuxGiftPostCheckout",
            WEB_GIFT_CARD_PURCHASE: "WebGiftCardPurchase",
            WEB_REDEEM_PAGE: "WebRedeemPage",
            WEB_PAYMENT_METHODS_SETTING: "WebPaymentMethodsSetting",
            WEB_ROBLOX_PLUS_PURCHASE: "WebRobloxPlusPurchase",
            MOBILE_WEB_ROBLOX_PLUS_PURCHASE: "MobileWebRobloxPlusPurchase",
            WEBVIEW_ROBLOX_PLUS_PURCHASE: "WebViewRobloxPlusPurchase",
            WEB_CATALOG_SINGLE_ITEM_PLUS_UPSELL: "WebCatalogSingleItemPlusUpsell",
            WEB_CATALOG_RESALE_ITEM_PLUS_UPSELL: "WebCatalogResaleItemPlusUpsell",
            WEB_CATALOG_BUNDLE_ITEM_PLUS_UPSELL: "WebCatalogBundleItemPlusUpsell",
            WEB_DEVELOPER_SUBSCRIPTION_PLUS_UPSELL: "WebDeveloperSubscriptionPlusUpsell",
            WEB_GAME_PASS_PLUS_UPSELL: "WebGamePassPlusUpsell",
            WEB_DEVELOPER_PRODUCT_PLUS_UPSELL: "WebDeveloperProductPlusUpsell",
            WEB_PRIVATE_SERVER_PLUS_UPSELL: "WebPrivateServerPlusUpsell",
            WEB_APP_THEME_PLUS_UPSELL: "WebAppThemePlusUpsell",
            WEB_PROFILE_FRAME_PLUS_UPSELL: "WebProfileFramePlusUpsell"
        },
        e_ = {
            ROBUX_UPSELL: "RobuxUpsell",
            ROBUX_UPSELL_EXCEED_LARGEST_PACKAGE: "RobuxUpsellExceedLargestPackage",
            PURCHASE_WARNING: "PurchaseWarning",
            LEAVE_ROBLOX_WARNING: "LeaveRobloxWarning",
            PREMIUM_DISCLOSURES: "PremiumDisclosures",
            PRODUCT_PURCHASE: "ProductPurchase",
            PRODUCT_PURCHASE_IMPRESSION: "ProductPurchaseImpression",
            PRODUCT_PURCHASE_LOADING: "ProductPurchaseLoading",
            PRODUCT_PURCHASE_QUICK_PAY: "ProductPurchaseQuickPay",
            QUICK_PAY_3DS: "QuickPay3DS",
            PREMIUM_PURCHASE: "PremiumPurchase",
            MEMBERSHIP: "Membership",
            MEMBERSHIP_ANGULAR: "MembershipAngular",
            PREMIUM_UPSELL: "PremiumUpsell",
            PAYMENT_METHOD: "PaymentMethod",
            MOBILE_PAYMENT_METHOD: "MobilePaymentMethod",
            MOBILE_PAYMENT_METHOD_SAMSUNG_PAY: "MobilePaymentMethodSamsungPay",
            MOBILE_PAYMENT_METHOD_REDEEM_CREDIT: "MobilePaymentMethodRedeemCredit",
            NAVIGATION_MENU: "NavigationMenu",
            PREPARE_PAYMENT_ERROR_OCCURRED: "PreparePaymentErrorOccured",
            XSOLLA: "Xsolla",
            XSOLLA_OTHER: "Xsolla Other",
            XSOLLA_SAVED_PAYMENT_METHOD: "Xsolla SavedCard",
            PAYPAL_POST_PROCESS: "Paypal Post Process",
            BRAINTREE_POST_PROCESS: "Braintree Post Process",
            BRAINTREE_PAYPAL_SAVED_PAYMENT: "Braintree PayPal Checkout With Saved Profile",
            ROBLOX_CREDIT: "Roblox Credit",
            ROBLOX_CREDIT_CHECKOUT: "Roblox Credit Checkout",
            ROBLOX_CREDIT_CHECKOUT_WITH_TAX: "Roblox Credit Checkout With Tax",
            ROBLOX_CREDIT_CHECKOUT_WITHOUT_TAX: "Roblox Credit Checkout Without Tax",
            ROBLOX_CREDIT_CAPTCHA: "Roblox Credit Captcha",
            LOADING: "Loading",
            CHECKOUT_SUCCESS: "Checkout Success",
            MOBILE_WEB_CHECKOUT_SUCCESS: "MobileWebCheckoutSuccess",
            SUCCESS: "Success",
            ERROR: "Error",
            NAVIGATION_ROBUX_TEXT: "NavigationRobuxText",
            NAVIGATION_DROPDOWN_MENU: "NavigationDropdownMenu",
            LEFT_NAVIGATION_BAR: "LeftNavigationBar",
            TRANSACTION_PAGE: "TransactionPage",
            CATALOG_LIST_PAGE: "CatalogListPage",
            ROBLOX_CREDIT_SETTING_BILLING_PAGE: "RobloxCreditBillingPage",
            REDEEM_ROBLOX_CARD_PAGE: "RedeemRobloxCardPage",
            PURCHASE_VPC_MODAL: "PurchaseVpcModal",
            OPTIMIZED_PURCHASE_VPC_MODAL: "OptimizedPurchaseVpcModal",
            ROBUX_GIFT_LANDING_PAGE: "RobuxGiftLandingPage",
            ROBUX_GIFT_BUNDLE_MESSAGE_PAGE: "RobuxGiftBundleMessagePage",
            ROBUX_GIFT_PRODUCT_SELECTION: "RobuxGiftProductSelection",
            ROBUX_GIFT_MESSAGE_SELECTION: "RobuxGiftMessageSelection",
            ROBUX_GIFT_PHONE_SUBMISSION: "RobuxGiftPhoneSubmission",
            ROBUX_GIFT_PHONE_AUTHENTICATION: "RobuxGiftPhoneAuthentication",
            ROBUX_GIFT_POST_CHECKOUT_SUCCESS: "RobuxGiftPostCheckoutSuccess",
            ROBUX_GIFT_POST_CHECKOUT_FAILURE: "RobuxGiftPostCheckoutFailure",
            ROBUX_GIFT_REQUEST_BANNER: "WebRobuxGiftRequestBanner",
            GIFT_CARD: "GiftCard",
            SHOP_GIFT_CARDS: "ShopGiftCards",
            ECONOMIC_RESTRICTION_ERROR: "EconomicRestrictionError",
            CREDIT_PACKAGE_PURCHASE_MODAL_WITH_TAX: "CreditPackagePurchaseModalWithTax",
            CREDIT_PACKAGE_PURCHASE_MODAL_WITHOUT_TAX: "CreditPackagePurchaseModalWithoutTax",
            CREDIT_CONVERSION_MODAL_WITH_TAX: "CreditConversionModalWithTax",
            CREDIT_CONVERSION_MODAL_WITHOUT_TAX: "CreditConversionModalWithoutTax",
            CREDIT_BALANCE_BIILLING_ADDRESS_FORM: "CreditBalanceBillingAddressForm",
            ROBUX_REDIRECT_BANNER: "RobuxRedirectBanner",
            NUVEI_REDIRECTED_TO_EXTERNAL_PAYMENT_PAGE: "NuveiRedirectedToExternalPaymentPage",
            NUVEI_SIMPLY_CONNECT_LOADED: "NuveiSimplyConnectLoaded",
            NUVEI_TRANSACTION_APPROVED: "NuveiTransactionApproved",
            NUVEI_TRANSACTION_DECLINED: "NuveiTransactionDeclined",
            NUVEI_TRANSACTION_PENDING: "NuveiTransactionPending",
            NUVEI_SESSION_TIMED_OUT: "NuveiSessionTimedOut",
            NUVEI: "Nuvei",
            ROBUX_GIFT: "RobuxGift",
            ROBUX_GIFT_MODAL: "RobuxGiftModal",
            POST_PURCHASE: "PostPurchase",
            FIRST_TIME_PURCHASE_CONSENT_MODAL: "FirstTimePurchaseConsentModal",
            ROBLOX_PLUS_LANDING: "RobloxPlusLanding",
            ROBLOX_PLUS_UPSELL_BANNER: "RobloxPlusUpsellBanner",
            ROBLOX_PLUS_BUY_ROBUX: "RobloxPlusBuyRobux",
            ROBUX_SEND_TRANSFERS: "RobuxSendTransfers",
            ROBUX_PENDING_TRANSFERS: "RobuxPendingTransfers",
            REDEEM_CREDIT_FOOTER: "RedeemCreditFooter",
            REDEEM_CREDIT_GET_PLUS_MODAL: "RedeemCreditGetPlusModal",
            IOS_PURCHASE_RESTART_ALERT: "IosPurchaseRestartAlert",
            NATIVE_PURCHASE_UI_SHOWN_TIME: "NativePurchaseUiShownTime"
        },
        eA = {
            VIEW_SHOWN: "ViewShown",
            USER_INPUT: "UserInput"
        },
        eC = eg(er({}, {
            U13PaymentModal: "U13PaymentModal",
            U13MonthlyThreshold1Modal: "U13MonthlyThreshold1Modal",
            U13MonthlyThreshold2Modal: "U13MonthlyThreshold2Modal",
            ParentalConsentWarningPaymentModal13To17: "ParentalConsentWarningPaymentModal13To17",
            RequireEmailVerification: "RequireEmailVerification"
        }, {
            FraudPaymentAuthorizationAttempt: "FraudPaymentAuthorizationAttempt",
            FraudVirtualEconomyAbuse: "FraudVirtualEconomyAbuse",
            FraudAbuseOfAffiliateSystem: "FraudAbuseOfAffiliateSystem",
            FraudAttemptedUnauthorizedPaymentMethodUse: "FraudAttemptedUnauthorizedPaymentMethodUse",
            FraudRepeatedRefundRequests: "FraudRepeatedRefundRequests",
            FraudSuspiciousRefundRequests: "FraudSuspiciousRefundRequests",
            FraudUnauthorizedPurchase: "FraudUnauthorizedPurchase",
            FraudUseOfUnauthorizedOffPlatformTransactions: "FraudUseOfUnauthorizedOffPlatformTransactions",
            FraudUseOfUnauthorizedPaymentMethod: "FraudUseOfUnauthorizedPaymentMethod",
            FraudSuspiciousAccountPatterns: "FraudSuspiciousAccountPatterns",
            FraudChargeback: "FraudChargeback",
            None: "None",
            PurchaseNotEnabled: "PurchaseNotEnabled",
            SpendLimitExceeded: "SpendLimitExceeded"
        }), {
            SUBMIT_ORDER: "Submit Order",
            REDEEM: "Redeem",
            BUY_ROBUX: "Buy Robux",
            BUY_ROBUX_AND_ITEM: "Buy Robux and Item",
            BUY_GIFT_CARD: "Buy Gift Card",
            CONTINUE_TO_CASHSTAR: "Continue to Cashstar",
            CONTINUE_TO_VNG: "Continue to Vng",
            EXTERNAL_LINK_MODAL: "External Link Modal",
            CANCEL: "Cancel",
            CLOSE: "Close",
            CONTINUE: "Continue",
            BACK: "Back",
            CARD_NUMBER_FORM: "Card Number Form",
            PAY_NOW: "Pay Now",
            PROCEED_TO_CHECKOUT: "Proceed to Checkout",
            SEND_RECEIPT_TO_EMAIL: "Send receipt to email",
            OPEN_EXTERNAL_LINK: "External Link",
            PAYMENT_METHOD_LIST: "Other payment method list",
            GIFT_CARD: "Gift Card",
            OK: "OK",
            PREMIUM: "Premium",
            GET_PREMIUM: "Get Premium",
            GO_TO_ROBUX_STORE: "Go To Robux Store",
            U13_PAYMENT_MODAL: "U13PaymentModal",
            U13_PARENTAL_CONSENT_WARNING: "U13ParentalConsentWarning",
            PAYMENT_MODAL_13_TO_17: "PaymentModal13To17",
            U13_MONTHLY_THRESHOLD_1_MODAL: "U13MonthlyThreshold1Modal",
            U13_MONTHLY_THRESHOLD_2_MODAL: "U13MonthlyThreshold2Modal",
            REQUIRE_EMAIL_VERIFICATION: "RequireEmailVerification",
            PURCHASE: "PURCHASE",
            REQUIRE_TWO_STEP_VERIFICATION: "RequireTwoStepVerification",
            ROBUX_ICON: "Robux Icon",
            PAGE_REFRESHED: "PageRefreshed",
            BACK_FORWARD_DETECTED: "Back/Forward Triggered",
            PAGE_LOADED_FROM_BACK_FORWARD_CACHE: "Back/Forward Triggered & Loaded From Cache",
            GO_TO_ROBUX_PURCHASE_PAGE: "Go to Robux Purchase Page",
            BILLING_EMAIL_NOT_PREFILLED: "Billing Email Not Prefilled",
            CREDIT_CONVERSION: "Credit Conversion",
            GO_TO_SETTINGS: "Go to Settings",
            PREPARE_PAYMENT_REQUEST_FETCH_FAILED: "PreparePaymentRequestFetchFailed",
            PREPARE_PAYMENT_REQUEST_FLOOD_CHECKED: "PreparePaymentRequestFloodChecked",
            PREPARE_PAYMENT_REQUEST_REDIRECTED: "PreparePaymentRequestRedirected",
            PAYMENT_METHOD_DROPDOWN: "Payment Method Dropdown",
            USE_DIFFERENT_PAYMENT_METHOD: "Use Different Payment Method",
            SAMSUNG_PAY_SELECTED: "Samsung Pay Selected",
            REDEEM_CREDIT_SELECTED: "Redeem Credit Selected",
            GIFT_NOW: "Gift now",
            CHECKOUT: "Checkout",
            VERIFY: "Verify",
            REQUEST_ROBUX: "Request Robux",
            BUY_NOW: "Buy Now",
            ADD_TO_CART: "Add to Cart",
            GIFT_CARD_AMOUNT_BUTTON: "GiftCardAmountButton",
            GIFT_CARD_TYPE_BUTTON: "GiftCardTypeButton",
            GIFT_CARD_RECIPIENT_TYPE_BUTTON: "GiftCardRecipientTypeButton",
            JOIN: "Join",
            BUY_REDIRECT: "Buy (redirect)",
            RETURN_TO_APP: "Return to app",
            SHOW_MORE: "Show more",
            SHOW_LESS: "Show less",
            TOGGLE_ON: "Toggle (on)",
            TOGGLE_OFF: "Toggle (off)",
            BUY: "Buy",
            PURCHASE_SUCCESS: "Purchase Success",
            CONFIRM: "Confirm",
            ROBLOX_PLUS_FREE_TRIAL: "RobloxPlusFreeTrial",
            ROBLOX_PLUS_SUBSCRIBE: "RobloxPlusSubscribe",
            ROBLOX_PLUS_BUNDLE_SHEET_OPENED: "RobloxPlusBundleSheetOpened",
            ROBLOX_PLUS_BUNDLE_TIER_SELECTED: "RobloxPlusBundleTierSelected",
            ROBLOX_PLUS_BILLING_PERIOD_SHEET_OPENED: "RobloxPlusBillingPeriodSheetOpened",
            ROBLOX_PLUS_BILLING_PERIOD_SELECTED: "RobloxPlusBillingPeriodSelected",
            ROBLOX_PLUS_BILLING_PERIOD_SHEET_DISMISSED: "RobloxPlusBillingPeriodSheetDismissed",
            ROBLOX_PLUS_LEARN_MORE: "RobloxPlusLearnMore",
            TRANSFER_SEND_BUTTON: "TransferSendButton",
            TRANSFER_SEND_SHEET: "TransferSendSheet",
            TRANSFER_SEND_USER_SELECTED: "TransferSendUserSelected",
            TRANSFER_PENDING_BUTTON: "TransferPendingButton",
            TRANSFER_PENDING_SHEET: "TransferPendingSheet",
            TRANSFER_PENDING_ACCEPT_CLICK: "TransferPendingAcceptClick",
            GET_PLUS_CLICKED: "GetPlusClicked",
            GET_ROBUX_CLICKED: "GetRobuxClicked",
            TIER_SELECTED: "TierSelected",
            SUBSCRIBE_CLICKED: "SubscribeClicked"
        }),
        eP = {
            ABANDONED: "Abandoned",
            FAILED_PREPARE_PAYMENT_REQUEST: "FailedPreparePaymentRequest",
            PASSED_PREPARE_PAYMENT_REQUEST: "PassedPreparePaymentRequest",
            PASSED_PREPARE_PAYMENT_REQUEST_WITH_TAX: "PassedPreparePaymentRequestWithTax",
            FAILED_UPDATE_ADDRESS_FOR_CHECKOUT_SESSION: "FailedUpdateAddressForCheckoutSession",
            PASSED_UPDATE_ADDRESS_FOR_CHECKOUT_SESSION: "PassedUpdateAddressForCheckoutSession",
            FAILED_GET_APPROXIMATE_USER_LOCATION: "FailedGetApproximateUserLocation",
            PASSED_GET_APPROXIMATE_USER_LOCATION: "PassedGetApproximateUserLocation",
            FAILED_PROCESS_PAYMENT: "FailedProcessPayment",
            PASSED_PROCESS_PAYMENT: "PassedProcessPayment",
            FAILED_GET_NEXT_PURCHASABLE_METADATA: "FailedGetNextPurchasableMetadata",
            PASSED_GET_NEXT_PURCHASABLE_METADATA: "PassedGetNextPurchasableMetadata",
            REDIRECTED_TO_PREMIUM_PAGE: "RedirectedToPremiumPage",
            EXISTING_FLOW_OVERWRITTEN_BY: "ExistingFlowOverwrittenBy",
            PAYMENT_FLOW_STARTED: "PaymentFlowStarted",
            BROWSER_PAGE_CHANGED: "BrowserPageChanged",
            CAPTCHA: "Captcha",
            SUCCESS: "Success",
            ERROR: "Error",
            CONTINUE: "Continue",
            CANCEL: "Cancel",
            PAYMENT_FLOW_ENDED: "PaymentFlowEnded"
        },
        eT = "Game Pass",
        eS = "Private Server",
        ex = "Bundle",
        eR = "Package",
        eB = "Product",
        eI = {
            FLOW_CONTINUE: "payment-user-journey:continue",
            FLOW_REFERRER_VALID: "payment-user-journey:referrer-valid"
        },
        eN = function() {
            return null != B && null != I
        },
        ew = function() {
            return {
                domain: ".".concat(el().domain),
                maxAge: 600
            }
        },
        eU = function() {
            function e(t, n) {
                D(this, e), M(this, "purchaseFlowUuid", void 0), M(this, "triggeringContext", void 0), this.purchaseFlowUuid = t, this.triggeringContext = n
            }
            return F(e, [{
                key: "save",
                value: function() {
                    if (eN()) {
                        var e, t, n = "".concat(null != (e = this.purchaseFlowUuid) ? e : "", ",").concat(null != (t = this.triggeringContext) ? t : ""),
                            r = ew();
                        eE(eb, n, {
                            domain: r.domain,
                            maxAge: r.maxAge
                        })
                    }
                }
            }], [{
                key: "stop",
                value: function() {
                    eN() && ev(eb, {
                        domain: ew().domain
                    })
                }
            }, {
                key: "loadFromCookie",
                value: function() {
                    if (!eN()) return null;
                    var t = em(eb);
                    if (null == t || "" === t.value) return null;
                    var n = K(t.value.split(","), 2),
                        r = n[0],
                        a = n[1];
                    return new e("" === r ? void 0 : r, null != a && (0, j.isStringEnum)(ey, a) ? a : void 0)
                }
            }]), e
        }();

    function eD(e) {
        return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
    }

    function eO() {
        return null != m || (m = "".concat(el().apiGatewayUrl.replace(/\/$/, ""), "/experience-signals-ingest/public")), m
    }
    var eF = function() {},
        eM = function(e, t) {
            return e << 3 | t
        },
        eL = eM(1, 2),
        ek = eM(2, 2),
        eH = eM(5, 2),
        eG = eM(6, 2),
        ej = eM(8, 2),
        eW = eM(1, 2),
        eV = eM(2, 1),
        eX = eM(3, 0),
        ez = eM(5, 2);
    eM(1, 2), eM(2, 1), eM(3, 0), eM(4, 2), eM(5, 2), eM(6, 0), eM(8, 2);
    var eK = eM(4, 0),
        eY = eM(6, 2),
        eq = eM(7, 2);
    eM(1, 0), eM(2, 2);
    var eZ = eM(1, 2),
        eQ = eM(2, 2),
        eJ = eM(1, 2);
    eM(1, 2), eM(2, 2), eM(1, 2);
    var e$ = new TextEncoder,
        e0 = function() {
            function e() {
                D(this, e), M(this, "buf", [])
            }
            return F(e, [{
                key: "writeVarint",
                value: function(e) {
                    var t = (void 0 === e ? "undefined" : eD(e)) === "bigint" ? e : BigInt(Math.trunc(e));
                    for (t < BigInt(0) && (t += BigInt(1) << BigInt(64)); t > BigInt(127);) this.buf.push(128 | Number(t & BigInt(127))), t >>= BigInt(7);
                    this.buf.push(Number(t))
                }
            }, {
                key: "writeString",
                value: function(e) {
                    var t = e$.encode(e);
                    this.writeVarint(t.length);
                    var n = !0,
                        r = !1,
                        a = void 0;
                    try {
                        for (var i, o = t[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) {
                            var u = i.value;
                            this.buf.push(u)
                        }
                    } catch (e) {
                        r = !0, a = e
                    } finally {
                        try {
                            n || null == o.return || o.return()
                        } finally {
                            if (r) throw a
                        }
                    }
                }
            }, {
                key: "writeBytes",
                value: function(e) {
                    this.writeVarint(e.length);
                    var t = !0,
                        n = !1,
                        r = void 0;
                    try {
                        for (var a, i = e[Symbol.iterator](); !(t = (a = i.next()).done); t = !0) {
                            var o = a.value;
                            this.buf.push(o)
                        }
                    } catch (e) {
                        n = !0, r = e
                    } finally {
                        try {
                            t || null == i.return || i.return()
                        } finally {
                            if (n) throw r
                        }
                    }
                }
            }, {
                key: "writeDouble",
                value: function(e) {
                    var t = new DataView(new ArrayBuffer(8));
                    t.setFloat64(0, e, !0);
                    for (var n = 0; n < 8; n += 1) this.buf.push(t.getUint8(n))
                }
            }, {
                key: "toBytes",
                value: function() {
                    return new Uint8Array(this.buf)
                }
            }]), e
        }();

    function e1(e, t, n) {
        var r = new e0;
        return r.writeVarint(eM(1, 2)), r.writeString(e), r.writeVarint(t), n(r), r.toBytes()
    }

    function e2(e) {
        var t = new e0;
        if (t.writeVarint(eW), t.writeString(e.name), t.writeVarint(eV), t.writeDouble(e.value), t.writeVarint(eX), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
            var n = function(e) {
                var t = new e0,
                    n = !0,
                    r = !1,
                    a = void 0;
                try {
                    for (var i, o = Object.entries(e)[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) ! function() {
                        var e = K(i.value, 2),
                            n = e[0],
                            r = e[1];
                        if ("string" == typeof r) {
                            var a = e1(n, eM(2, 2), function(e) {
                                e.writeString(r)
                            });
                            t.writeVarint(eH), t.writeBytes(a)
                        } else if ("boolean" == typeof r) {
                            var o = e1(n, eM(2, 0), function(e) {
                                e.writeVarint(+!!r)
                            });
                            t.writeVarint(eG), t.writeBytes(o)
                        } else if ((void 0 === r ? "undefined" : eD(r)) === "bigint") {
                            var u = e1(n, eM(2, 0), function(e) {
                                e.writeVarint(r)
                            });
                            t.writeVarint(ek), t.writeBytes(u)
                        } else if ("number" == typeof r)
                            if (Number.isFinite(r))
                                if (Number.isInteger(r) && r >= -0x80000000 && r <= 0x7fffffff) {
                                    var s = e1(n, eM(2, 0), function(e) {
                                        e.writeVarint(r)
                                    });
                                    t.writeVarint(eL), t.writeBytes(s)
                                } else if (Number.isInteger(r)) {
                            var l = e1(n, eM(2, 0), function(e) {
                                e.writeVarint(BigInt(r))
                            });
                            t.writeVarint(ek), t.writeBytes(l)
                        } else {
                            var c = e1(n, eM(2, 1), function(e) {
                                e.writeDouble(r)
                            });
                            t.writeVarint(ej), t.writeBytes(c)
                        } else {
                            var d = e1(n, eM(2, 2), function(e) {
                                e.writeString(String(r))
                            });
                            t.writeVarint(eH), t.writeBytes(d)
                        }
                    }()
                } catch (e) {
                    r = !0, a = e
                } finally {
                    try {
                        n || null == o.return || o.return()
                    } finally {
                        if (r) throw a
                    }
                }
                return t.toBytes()
            }(e.attributes);
            t.writeVarint(ez), t.writeBytes(n)
        }
        return t.toBytes()
    }

    function e3(e, t, n) {
        var r = new e0;
        r.writeVarint(eK), r.writeVarint(n);
        var a = !0,
            i = !1,
            o = void 0;
        try {
            for (var u, s = e[Symbol.iterator](); !(a = (u = s.next()).done); a = !0) {
                var l = u.value;
                r.writeVarint(eY), r.writeBytes(l)
            }
        } catch (e) {
            i = !0, o = e
        } finally {
            try {
                a || null == s.return || s.return()
            } finally {
                if (i) throw o
            }
        }
        var c = !0,
            d = !1,
            h = void 0;
        try {
            for (var f, m = t[Symbol.iterator](); !(c = (f = m.next()).done); c = !0) {
                var p = f.value;
                r.writeVarint(eq), r.writeBytes(p)
            }
        } catch (e) {
            d = !0, h = e
        } finally {
            try {
                c || null == m.return || m.return()
            } finally {
                if (d) throw h
            }
        }
        return r.toBytes()
    }

    function e5(e) {
        var t = new e0;
        t.writeVarint(eZ), t.writeString("eventstream.enginetelemetry.EngineTelemetryBatchEvent"), t.writeVarint(eQ), t.writeBytes(e);
        var n = t.toBytes(),
            r = new e0;
        return r.writeVarint(eJ), r.writeBytes(n), r.toBytes()
    }
    var e6 = /^[a-zA-Z_][a-zA-Z0-9_]*$/;

    function e4(e) {
        return e6.test(e)
    }
    var e8 = [],
        e9 = !1,
        e7 = !1;

    function te(e, t) {
        var n, r, a = e.map(function(e) {
                return {
                    name: e.name,
                    value: e.value,
                    timestampMs: e.timestampMs,
                    attributes: e.attributes
                }
            }),
            i = BigInt(Date.now());
        !0 === t || e7 || "u" > typeof document && "hidden" === document.visibilityState ? (n = e5(e3(a.map(e2), [], i)).buffer, fetch("".concat(eO()).concat("/v1/events/single"), {
            method: "POST",
            headers: {
                "Content-Type": "application/x-protobuf"
            },
            body: n,
            credentials: "include",
            keepalive: !0
        }).catch(eF)) : (r = e5(e3(a.map(e2), [], i)), w(function() {
            var e, t, n, a, i, o, u, s, l, c, d, h, f;
            return L(this, function(m) {
                switch (m.label) {
                    case 0:
                        if ("u" < typeof CompressionStream) return [2, {
                            body: r.buffer,
                            compressed: !1
                        }];
                        return (t = (e = new CompressionStream("gzip")).writable.getWriter()).write(r).catch(eF), t.close().catch(eF), n = [], [4, (a = e.readable.getReader()).read()];
                    case 1:
                        i = m.sent(), m.label = 2;
                    case 2:
                        if (i.done) return [3, 4];
                        return n.push(i.value), [4, a.read()];
                    case 3:
                        return i = m.sent(), [3, 2];
                    case 4:
                        o = new Uint8Array(n.reduce(function(e, t) {
                            return e + t.length
                        }, 0)), u = 0, s = !0, l = !1, c = void 0;
                        try {
                            for (d = n[Symbol.iterator](); !(s = (h = d.next()).done); s = !0) f = h.value, o.set(f, u), u += f.length
                        } catch (e) {
                            l = !0, c = e
                        } finally {
                            try {
                                s || null == d.return || d.return()
                            } finally {
                                if (l) throw c
                            }
                        }
                        return [2, {
                            body: o.buffer,
                            compressed: !0
                        }]
                }
            })
        })()).then(function(e) {
            var t = e.body,
                n = e.compressed,
                r = {
                    "Content-Type": "application/x-protobuf"
                };
            return n && (r["Content-Encoding"] = "gzip"), fetch("".concat(eO()).concat("/v1/events/single"), {
                method: "POST",
                headers: r,
                body: t,
                credentials: "include",
                keepalive: !0
            })
        }).catch(eF)
    }

    function tt() {
        var e = !0,
            t = !1,
            n = void 0;
        try {
            for (var r, a = e8[Symbol.iterator](); !(e = (r = a.next()).done); e = !0) {
                var i = r.value.splice(0);
                0 !== i.length && te(i, !0)
            }
        } catch (e) {
            t = !0, n = e
        } finally {
            try {
                e || null == a.return || a.return()
            } finally {
                if (t) throw n
            }
        }
    }

    function tn(e, t) {
        var n, r, a, i = Math.max(1, null != (n = null == t ? void 0 : t.batchSize) ? n : 10),
            o = null != (r = null == t ? void 0 : t.batchIntervalMs) ? r : 250;

        function u(e, n) {
            (null == t ? void 0 : t.onError) ? t.onError(e, n): console.error(e, n)
        }
        if (!e4(e)) return u('@rbx/web-telemetry: invalid featureName "'.concat(e, '"'), {
                name: e
            }),
            function() {};
        var s = [];
        return e8.push(s), e9 || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                "hidden" === document.visibilityState && tt()
            }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                e7 = !0, tt()
            }), e9 = !0),
            function(t, n, r) {
                var l = "".concat(e, "_").concat(t);
                if (! function(e, t) {
                        if (!e4(e)) return !1;
                        if (t) {
                            var n = !0,
                                r = !1,
                                a = void 0;
                            try {
                                for (var i, o = Object.keys(t)[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) {
                                    var u = i.value;
                                    if (!e4(u)) return !1
                                }
                            } catch (e) {
                                r = !0, a = e
                            } finally {
                                try {
                                    n || null == o.return || o.return()
                                } finally {
                                    if (r) throw a
                                }
                            }
                        }
                        return !0
                    }(l, n)) return void u("@rbx/web-telemetry: invalid event name or attribute key", {
                    name: t,
                    attributes: n
                });
                var c = null != r ? r : 1;
                if (!Number.isFinite(c)) return void u("@rbx/web-telemetry: value must be a finite number", {
                    name: t,
                    attributes: n
                });
                var d = n && Object.keys(n).length > 0 ? n : void 0;
                s.push({
                    name: l,
                    attributes: d,
                    value: c,
                    timestampMs: BigInt(Date.now())
                }), s.length >= i ? (void 0 !== a && (clearTimeout(a), a = void 0), te(s.splice(0, i))) : void 0 === a && (a = setTimeout(function() {
                    for (a = void 0; s.length > 0;) te(s.splice(0, i))
                }, o))
            }
    }
    var tr = "PaymentsFlowAnalytics",
        ta = function(e) {
            var t = e.publish,
                n = e.captureException,
                r = e.featureName;

            function a(e, t, a) {
                if (null != a) {
                    var i = U(a, Error) ? a.name || "Error" : "UnknownError",
                        o = r ? "".concat(r, "_").concat(e) : e;
                    return null == n || n(a, {
                        error_counter: o
                    }), eg(er({}, t), {
                        errorType: i
                    })
                }
                return t
            }
            return {
                trackCounter: function() {
                    for (var e = arguments.length, n = Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                    var a = K(n, 2);
                    t(a[0], a[1])
                },
                trackError: function() {
                    for (var e = arguments.length, n = Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                    var i = K(n, 3),
                        o = i[0],
                        u = i[1],
                        s = i[2],
                        l = a(o, eg(er({}, null != u ? u : {}), {
                            severity: "error"
                        }), s);
                    t(o, l)
                },
                trackCriticalError: function() {
                    for (var e = arguments.length, n = Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                    var i = K(n, 3),
                        o = i[0],
                        u = i[1],
                        s = i[2],
                        l = a(o, eg(er({}, null != u ? u : {}), {
                            severity: "critical"
                        }), s);
                    t(o, l)
                }
            }
        }({
            publish: tn(tr),
            captureException: function(e, t) {
                var n;
                null == B || null == (n = B.Sentry) || n.captureException(e, t ? {
                    tags: t
                } : void 0)
            },
            featureName: tr
        }),
        ti = ta.trackCounter,
        to = ta.trackError,
        tu = "__rbxPaymentsFlowListenersAttached",
        ts = function(e) {
            var t = e.currentTarget;
            return null != t && "innerText" in t && "string" == typeof t.innerText ? t.innerText : ""
        },
        tl = function(e) {
            var t;
            null == I || null == (t = I.querySelector("#header li a.robux-menu-btn")) || t.addEventListener("click", function(t) {
                e.sendUserPurchaseFlowEvent({
                    triggerContext: ey.WEB_ROBUX_PURCHASE,
                    isMidPurchaseStep: !1,
                    viewName: e_.NAVIGATION_MENU,
                    purchaseEventType: eA.USER_INPUT,
                    viewMessage: ts(t)
                })
            })
        },
        tc = function(e) {
            var t, n;
            null == I || null == (t = I.querySelector("#item-details #upgrade-button")) || t.addEventListener("click", function() {
                e.sendUserPurchaseFlowEvent({
                    triggerContext: ey.WEB_PREMIUM_PURCHASE,
                    isMidPurchaseStep: !1,
                    viewName: e_.PREMIUM_UPSELL,
                    purchaseEventType: eA.USER_INPUT,
                    viewMessage: eC.GET_PREMIUM
                })
            }), null == I || null == (n = I.querySelector("#item-details .premium-prompt a")) || n.addEventListener("click", function(t) {
                e.sendUserPurchaseFlowEvent({
                    triggerContext: ey.WEB_PREMIUM_PURCHASE,
                    isMidPurchaseStep: !1,
                    viewName: e_.PREMIUM_UPSELL,
                    purchaseEventType: eA.USER_INPUT,
                    viewMessage: ts(t)
                })
            })
        },
        td = function() {
            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
            var r = !0,
                a = !1,
                i = void 0;
            try {
                for (var o, u = t[Symbol.iterator](); !(r = (o = u.next()).done); r = !0) {
                    var s = o.value;
                    if (null != s && "" !== s) return s
                }
            } catch (e) {
                a = !0, i = e
            } finally {
                try {
                    r || null == u.return || u.return()
                } finally {
                    if (a) throw i
                }
            }
            return ""
        },
        th = "__rbxPaymentsFlowUuid",
        tf = function(e) {
            if (null != e && "type" in e && "string" == typeof e.type) return e.type
        },
        tm = [{
            web: ey.WEB_ROBUX_PURCHASE,
            webview: ey.WEBVIEW_ROBUX_PURCHASE,
            mobileWeb: ey.MOBILE_WEB_ROBUX_PURCHASE
        }, {
            web: ey.WEB_PREMIUM_PURCHASE,
            webview: ey.WEBVIEW_PREMIUM_PURCHASE,
            mobileWeb: ey.MOBILE_WEB_PREMIUM_PURCHASE
        }, {
            web: ey.WEB_ROBLOX_PLUS_PURCHASE,
            webview: ey.WEBVIEW_ROBLOX_PLUS_PURCHASE,
            mobileWeb: ey.MOBILE_WEB_ROBLOX_PLUS_PURCHASE
        }],
        tp = new ef(new ed({
            baseUrl: "https://ecsv2.".concat(el().domain, "/www")
        })),
        tE = new(function() {
            function e() {
                D(this, e), M(this, "purchaseFlowUuid", ""), M(this, "triggerContext", void 0), M(this, "ENUM_TRIGGERING_CONTEXT", ey), M(this, "ENUM_VIEW_NAME", e_), M(this, "ENUM_PURCHASE_EVENT_TYPE", eA), M(this, "ENUM_VIEW_MESSAGE", eC), M(this, "ENUM_PURCHASE_STATUS", eP), M(this, "ENUM_CUSTOM_EVENT", eI), M(this, "eventMetadata", {}), M(this, "webStack", void 0), eN() && this.loadOrStartPaymentFlow()
            }
            return F(e, [{
                key: "loadOrStartPaymentFlow",
                value: function() {
                    if (null != B) try {
                        if (this.purchaseFlowUuid || this.tryLoadPreExistingCtx(), this.purchaseFlowUuid || this.adoptSharedFlowUuid(), !this.purchaseFlowUuid) {
                            var t = e.getUrlAnalyticId();
                            this.purchaseFlowUuid = null != t ? t : eo(), this.writePaymentFlowContextIntoCookie()
                        }
                        this.publishSharedFlowUuid()
                    } catch (e) {
                        to("UserPaymentFlowStartFlowError", null, e)
                    }
                }
            }, {
                key: "getPaymentFlowUuid",
                value: function() {
                    return this.adoptSharedFlowUuid(), this.purchaseFlowUuid
                }
            }, {
                key: "setPaymentFlowUuid",
                value: function(e) {
                    this.purchaseFlowUuid = e, this.publishSharedFlowUuid(), this.writePaymentFlowContextIntoCookie()
                }
            }, {
                key: "setWebStack",
                value: function(e) {
                    eN() && (this.webStack = e)
                }
            }, {
                key: "startRobuxUpsellFlow",
                value: function(e) {
                    var t = e.assetType,
                        n = e.isReseller,
                        r = e.itemId;
                    this.eventMetadata.item_type = t, this.eventMetadata.item_id = void 0 === r ? "" : r, t === eT ? this.triggerContext = ey.WEB_GAME_PASS_ROBUX_UPSELL : t === eB ? this.triggerContext = ey.WEB_DEVELOPER_PRODUCT_ROBUX_UPSELL : "Place" === t ? this.triggerContext = ey.WEB_PAID_GAME_ROBUX_UPSELL : t === eS ? this.triggerContext = ey.WEB_PRIVATE_SERVER_ROBUX_UPSELL : t === ex || t === eR ? this.triggerContext = ey.WEB_CATALOG_BUNDLE_ITEM_ROBUX_UPSELL : void 0 !== n && n ? this.triggerContext = ey.WEB_CATALOG_COLLECTIVE_ITEM_ROBUX_UPSELL : this.triggerContext = ey.WEB_CATALOG_ROBUX_UPSELL, this.writePaymentFlowContextIntoCookie()
                }
            }, {
                key: "startRobloxPlusUpsellFlow",
                value: function(e) {
                    var t = e.assetType,
                        n = e.isReseller,
                        r = e.itemId;
                    if (this.eventMetadata.item_type = t, this.eventMetadata.item_id = void 0 === r ? "" : r, void 0 !== n && n) this.triggerContext = ey.WEB_CATALOG_RESALE_ITEM_PLUS_UPSELL;
                    else switch (t) {
                        case eT:
                            this.triggerContext = ey.WEB_GAME_PASS_PLUS_UPSELL;
                            break;
                        case eB:
                            this.triggerContext = ey.WEB_DEVELOPER_PRODUCT_PLUS_UPSELL;
                            break;
                        case eS:
                            this.triggerContext = ey.WEB_PRIVATE_SERVER_PLUS_UPSELL;
                            break;
                        case ex:
                        case eR:
                            this.triggerContext = ey.WEB_CATALOG_BUNDLE_ITEM_PLUS_UPSELL;
                            break;
                        case "Subscription":
                            this.triggerContext = ey.WEB_DEVELOPER_SUBSCRIPTION_PLUS_UPSELL;
                            break;
                        default:
                            this.triggerContext = ey.WEB_CATALOG_SINGLE_ITEM_PLUS_UPSELL
                    }
                    this.writePaymentFlowContextIntoCookie()
                }
            }, {
                key: "sendUserPurchaseFlowEvent",
                value: function(t) {
                    var n = t.triggerContext,
                        r = t.isMidPurchaseStep,
                        a = t.viewName,
                        i = t.purchaseEventType,
                        o = t.viewMessage,
                        u = t.eventMetadata,
                        s = t.isTerminalView;
                    if (eN()) try {
                        var l = e.reclassifyPlatformTriggeringContext({
                            triggerContext: n
                        });
                        if (this.eventMetadata = er({}, this.eventMetadata, void 0 === u ? {} : u), !a && !i && !o) return void to("UserPaymentFlowWrongUsageOfMethod");
                        this.adoptSharedTriggerContext(), !this.triggerContext && (this.triggerContext = l, this.writePaymentFlowContextIntoCookie(), r && ti("UserPaymentFlowMidPurchaseStepTriggeredWithoutCtx")), this.sendEvent({
                            eventName: "UserPurchaseFlow",
                            viewName: a,
                            purchaseEventType: i,
                            viewMessage: o
                        }), void 0 !== s && s && this.handleTerminalPage()
                    } catch (e) {
                        to("UserPaymentFlowSendUserEventError", null, e)
                    }
                }
            }, {
                key: "sendUserPurchaseStatusEvent",
                value: function(t) {
                    var n = t.triggerContext,
                        r = t.status,
                        a = t.viewMessage,
                        i = t.viewName;
                    if (eN()) try {
                        var o = e.reclassifyPlatformTriggeringContext({
                            triggerContext: n
                        });
                        if (!r && !a && !i) return void to("UserPaymentFlowWrongUsageOfMethod");
                        this.adoptSharedTriggerContext(), this.triggerContext || (this.triggerContext = o, this.writePaymentFlowContextIntoCookie()), this.sendEvent({
                            eventName: "UserPurchaseStatus",
                            viewName: i,
                            viewMessage: a,
                            status: r
                        }), e.isTerminalView(i) && this.handleTerminalPage()
                    } catch (e) {
                        to("UserPaymentFlowSendStatusEventError", null, e)
                    }
                }
            }, {
                key: "adoptSharedTriggerContext",
                value: function() {
                    if (!this.triggerContext) {
                        this.adoptSharedFlowUuid();
                        var e = eU.loadFromCookie();
                        (null == e ? void 0 : e.triggeringContext) != null && e.purchaseFlowUuid === this.purchaseFlowUuid && (this.triggerContext = e.triggeringContext)
                    }
                }
            }, {
                key: "adoptSharedFlowUuid",
                value: function() {
                    if (null != B && th in B) {
                        var e = B[th];
                        "string" == typeof e && "" !== e && (this.purchaseFlowUuid = e)
                    }
                }
            }, {
                key: "publishSharedFlowUuid",
                value: function() {
                    null != B && this.purchaseFlowUuid && Object.assign(B, M({}, th, this.purchaseFlowUuid))
                }
            }, {
                key: "writePaymentFlowContextIntoCookie",
                value: function() {
                    this.adoptSharedFlowUuid(), new eU(this.purchaseFlowUuid, this.triggerContext).save()
                }
            }, {
                key: "sendEvent",
                value: function(t) {
                    var n = t.eventName,
                        r = t.viewName,
                        a = t.purchaseEventType,
                        i = t.viewMessage,
                        o = t.status;
                    if (this.adoptSharedFlowUuid(), !this.purchaseFlowUuid || !this.triggerContext) return void to("UserPaymentFlowSendEventWithoutUuidOrCtx");
                    if (null != B) {
                        var u = e.getReferralUrl(),
                            s = e.extractView(u),
                            l = e.extractView(B.location.href),
                            c = JSON.stringify(er({}, this.eventMetadata, void 0 === this.webStack ? {} : {
                                webStack: this.webStack
                            }));
                        tp.sendEventViaImg({
                            target: "www",
                            localTime: new Date,
                            eventType: n,
                            context: this.triggerContext,
                            additionalProperties: {
                                purchase_flow_uuid: this.purchaseFlowUuid,
                                view_name: r,
                                purchase_event_type: a,
                                view_message: i,
                                status: o,
                                refurl: u.substring(0, 200),
                                prev_view_path: s,
                                current_view_path: l,
                                event_metadata: c
                            }
                        })
                    }
                }
            }, {
                key: "tryLoadPreExistingCtx",
                value: function() {
                    if (null != I && null != B) try {
                        var e = I.referrer,
                            t = e && new URL(e).hostname.endsWith(el().domain),
                            n = B.performance.getEntriesByType("navigation")[0],
                            r = tf(n);
                        if (!t && "back_forward" !== r && "reload" !== r) return;
                        var a = eU.loadFromCookie();
                        a && (a.purchaseFlowUuid && (this.purchaseFlowUuid = a.purchaseFlowUuid), a.triggeringContext && (this.triggerContext = a.triggeringContext))
                    } catch (e) {
                        to("UserPaymentFlowLoadPreExistingCtxError", null, e)
                    }
                }
            }, {
                key: "handleTerminalPage",
                value: function() {
                    if (this.purchaseFlowUuid) {
                        if (!this.triggerContext) return void to("UserPaymentFlowFlowEndedWithoutTriggerContext");
                        eU.stop(), this.sendUserPurchaseStatusEvent({
                            triggerContext: this.triggerContext,
                            status: eP.PAYMENT_FLOW_ENDED
                        }), ti("UserPaymentFlowFlowEnded")
                    }
                }
            }], [{
                key: "extractView",
                value: function(e) {
                    if (!e) return "";
                    var t = new URL(e);
                    return t.hostname.endsWith(".".concat(el().domain)) ? t.pathname : "External"
                }
            }, {
                key: "isTerminalView",
                value: function(e) {
                    return e === e_.CHECKOUT_SUCCESS
                }
            }, {
                key: "getReferralUrl",
                value: function() {
                    var e;
                    if (null == I) return "";
                    try {
                        return td(I.referrer, null == B || null == (e = B.frames.top) ? void 0 : e.document.referrer)
                    } catch (e) {
                        return I.referrer
                    }
                }
            }, {
                key: "getUrlAnalyticId",
                value: function() {
                    return null == B ? null : new URLSearchParams(B.location.search).get("analyticId")
                }
            }, {
                key: "reclassifyPlatformTriggeringContext",
                value: function(e) {
                    var t = e.triggerContext,
                        n = (0, eu.getDeviceMeta)(),
                        r = [null == n ? void 0 : n.isAmazonApp, null == n ? void 0 : n.isUWPApp, null == n ? void 0 : n.isIosApp, null == n ? void 0 : n.isAndroidApp].some(function(e) {
                            return !0 === e
                        }),
                        a = !0,
                        i = !1,
                        o = void 0;
                    try {
                        for (var u, s = tm[Symbol.iterator](); !(a = (u = s.next()).done); a = !0) {
                            var l = u.value,
                                c = l.web,
                                d = l.webview,
                                h = l.mobileWeb;
                            if (t === c || t === d) return r ? d : c;
                            if (t === h) return r ? d : h
                        }
                    } catch (e) {
                        i = !0, o = e
                    } finally {
                        try {
                            a || null == s.return || s.return()
                        } finally {
                            if (i) throw o
                        }
                    }
                    return t
                }
            }]), e
        }());
    if (null != I && (null == B || !0 !== Reflect.get(B, tu) && (Object.assign(B, M({}, tu, !0)), 1))) {
        var tv = function() {
            tl(tE), (null == I ? void 0 : I.getElementById("display-price-container")) == null && tc(tE)
        };
        "loading" === I.readyState ? I.addEventListener("DOMContentLoaded", tv) : tv()
    }
    var tg = "/info/terms",
        tb = "ItemPurchaseAjaxData",
        ty = "/games/",
        t_ = "Purchasing.PurchaseDialog",
        tA = "CommonUI.Controls",
        tC = "Feature.Premium",
        tP = "Game Pass",
        tT = "Bundle",
        tS = {
            size: "150x150",
            format: "Png",
            isCircular: !1
        },
        tx = "Action.BuyRobuxAndItem",
        tR = "Action.BuyRobux",
        tB = "Action.Cancel",
        tI = "Heading.InsufficientRobux",
        tN = "Heading.InsufficientRobuxNew",
        tw = "Message.InsufficientRobuxAskToPurchasePackage",
        tU = "Label.PurchasingTheItem",
        tD = "Action.Ok",
        tO = "Action.Cancel",
        tF = "U13PaymentModal",
        tM = "ParentalConsentWarningPaymentModal13To17",
        tL = "U13MonthlyThreshold1Modal",
        tk = "U13MonthlyThreshold2Modal",
        tH = "COOKIE_PARSE_FAILED",
        tG = "PRODUCT_INFO_REQUEST_FAILED",
        tj = "PRODUCT_INFO_EMPTY",
        tW = "PRODUCT_ID_NOT_EXIST",
        tV = "UPSELL_FAILED",
        tX = "NoTypeParsedYet",
        tz = "UpsellShown",
        tK = "UpsellCancelled",
        tY = "UpsellCancelledFromU13Modal",
        tq = "CancelledFromLeaveRobloxModal",
        tZ = "AutoPurchaseSucceed",
        tQ = "AutoPurchaseFailed",
        tJ = "U13PaymentModalFailedToShow",
        t$ = window.Roblox["core-scripts"].http.http;

    function t0(e, t, n) {
        return w(function() {
            var r, a;
            return L(this, function(i) {
                switch (i.label) {
                    case 0:
                        r = {
                            upsell_platform: "WEB",
                            user_robux_balance: parseInt(e.userBalanceRobux, 10),
                            attempt_robux_amount: null != n ? n : t.expectedItemPrice
                        }, a = {
                            url: "".concat(es.EnvironmentUrls.apiGatewayUrl).concat("/payments-gateway/v1/products/get-upsell-product"),
                            withCredentials: !0
                        }, i.label = 1;
                    case 1:
                        return i.trys.push([1, 3, , 4]), [4, t$.post(a, r)];
                    case 2:
                        return [2, i.sent()];
                    case 3:
                        return [2, Promise.reject(i.sent())];
                    case 4:
                        return [2]
                }
            })
        })()
    }
    var t1 = window.Roblox["core-scripts"].format.string,
        t2 = window.Roblox["core-scripts"].endpoints,
        t3 = window.Roblox["core-scripts"].util.url,
        t5 = function(e) {
            if (!e.trim()) return null;
            try {
                return BigInt(e)
            } catch (e) {
                return null
            }
        },
        t6 = function(e) {
            return e > 0 && e <= Number.MAX_SAFE_INTEGER ? e.toString() : null
        },
        t4 = function(e) {
            var t = t5(e);
            return null == t ? null : t6(t)
        },
        t8 = "blackbird",
        t9 = function(e) {
            var t, n, r, a, i = null != (t = e.userid) ? t : e.user,
                o = null == i ? void 0 : null != (n = t4(i)) ? n : void 0;
            if ("string" == typeof o) return {
                isAuthenticated: !0,
                id: o,
                userName: null != (r = e.name) ? r : e.userName,
                displayName: null != (a = e.displayname) ? a : e.userDisplayName,
                isPremiumUser: "true" === e.ispremiumuser || "true" === e.userIsPremium,
                membership: e.membership === t8 || e.userMembership === t8 ? t8 : void 0,
                isVerified: "true" === e.hasverifiedbadge || "true" === e.userHasVerifiedBadge,
                isUnder13: "true" === e.isunder13 || "AgeUnder13" === e.userAgeBracket
            }
        },
        t7 = function() {
            if ("u" > typeof document) {
                var e, t;
                return t9(null != (e = null == (t = document.querySelector('meta[name="user-data"]')) ? void 0 : t.dataset) ? e : document.documentElement.dataset)
            }
        },
        ne = window.Roblox["core-scripts"].format.number;

    function nt(e) {
        var t = !(arguments.length > 1) || void 0 === arguments[1] || arguments[1],
            n = arguments.length > 2 && void 0 !== arguments[2] && arguments[2],
            r = arguments.length > 3 && void 0 !== arguments[3] && arguments[3],
            a = (0, ne.formatNumber)(e),
            i = n ? "<s>".concat(a, "</s>") : a;
        return r ? "<span class='icon-robux-16x16 light-theme'></span><span class='text'>".concat(i, "</span>") : t ? "<span class='icon-robux-16x16'></span><span class='text-robux'>".concat(i, "</span>") : "<span class='icon-robux-gray-16x16'></span><span class='text'>".concat(i, "</span>")
    }

    function nn(e) {
        return "".concat("RBXUpsellOfferIds:").concat(e)
    }

    function nr() {
        if (en.expireUpsellCookie(), window.history) {
            var e = new URL(window.location.href);
            e.searchParams.delete(en.constants.UPSELL_QUERY_PARAM_KEY);
            var t = e.href;
            window.history.pushState({
                path: t
            }, "", t)
        }
    }
    var na = window.ReactJSX,
        ni = [],
        no = 0,
        nu = [],
        ns = function() {
            nu.forEach(function(e) {
                return e(ni)
            })
        };

    function nl() {
        var e = no;
        no += 1;
        var t = !1;
        return {
            render: function(n) {
                t || (ni = ni.some(function(t) {
                    return t.key === e
                }) ? ni.map(function(t) {
                    return t.key === e ? {
                        key: e,
                        element: n
                    } : t
                }) : q(ni).concat([{
                    key: e,
                    element: n
                }]), 0 === nu.length && (null == p || p()), ns())
            },
            remove: function() {
                t = !0, ni.some(function(t) {
                    return t.key === e
                }) && (ni = ni.filter(function(t) {
                    return t.key !== e
                }), ns())
            }
        }
    }

    function nc() {
        var e = K((0, C.useState)(ni), 2),
            t = e[0],
            n = e[1],
            r = K((0, C.useState)(!1), 2),
            a = r[0],
            i = r[1];
        return ((0, C.useEffect)(function() {
            var e = function(t) {
                n(t), i(nu[0] === e)
            };
            return nu.push(e), e(ni),
                function() {
                    nu.splice(nu.indexOf(e), 1), ns()
                }
        }, []), a && 0 !== t.length && I) ? (0, T.createPortal)(t.map(function(e) {
            var t = e.key,
                n = e.element;
            return (0, na.jsx)("div", {
                children: n
            }, t)
        }), I.body) : null
    }

    function nd(e, t) {
        if (null == e) return {};
        var n, r, a, i = {};
        if ("u" > typeof Reflect && Reflect.ownKeys) {
            for (a = 0, n = Reflect.ownKeys(Object(e)); a < n.length; a++) r = n[a], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
            return i
        }
        if (i = function(e, t) {
                if (null == e) return {};
                var n, r, a = {},
                    i = Object.getOwnPropertyNames(e);
                for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }(e, t), Object.getOwnPropertySymbols)
            for (a = 0, n = Object.getOwnPropertySymbols(e); a < n.length; a++) r = n[a], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
        return i
    }
    var nh = function() {
            for (var e, t, n = 0, r = "", a = arguments.length; n < a; n++)(e = arguments[n]) && (t = function e(t) {
                var n, r, a = "";
                if ("string" == typeof t || "number" == typeof t) a += t;
                else if ("object" == (void 0 === t ? "undefined" : eD(t)))
                    if (Array.isArray(t)) {
                        var i = t.length;
                        for (n = 0; n < i; n++) t[n] && (r = e(t[n])) && (a && (a += " "), a += r)
                    } else
                        for (r in t) t[r] && (a && (a += " "), a += r);
                return a
            }(e)) && (r && (r += " "), r += t);
            return r
        },
        nf = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
        nm = function(e) {
            var t = e.className;
            return P().createElement("div", {
                "aria-hidden": !0,
                "data-testid": "foundation-web-state-layer",
                className: nh("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
            })
        };

    function np(e) {
        return W(e) || Y(e) || z(e) || V()
    }
    var nE = {
            XSmall: "size-[var(--icon-size-xsmall)]",
            Small: "size-[var(--icon-size-small)]",
            Medium: "size-[var(--icon-size-medium)]",
            Large: "size-[var(--icon-size-large)]",
            XLarge: "size-[var(--icon-size-xlarge)]",
            XXLarge: "size-[var(--icon-size-xxlarge)]"
        },
        nv = P().forwardRef(function(e, t) {
            var n = np([e, t]),
                r = n[0],
                a = n.slice(1),
                i = r.name,
                o = r.size,
                u = r.className,
                s = (r.children, nd(r, ["name", "size", "className", "children"])),
                l = K(a, 1)[0];
            return P().createElement("span", er({
                ref: l,
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: nh("grow-0 shrink-0 basis-auto icon", i, nE[void 0 === o ? "Medium" : o], u)
            }, s))
        });
    nv.displayName = "Icon";
    var ng = {
            Small: "padding-xsmall",
            Medium: "padding-small",
            Large: "padding-small"
        },
        nb = {
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-100"
        },
        ny = function(e) {
            var t = e.variant,
                n = e.size,
                r = e.isCircular,
                a = e.className,
                i = nd(e, ["variant", "size", "isCircular", "className"]);
            return P().createElement("button", er({
                type: "button",
                className: nh("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", nf, nb[t], ng[n], r && "radius-circle", a)
            }, i), P().createElement(nm, null), P().createElement(nv, {
                name: "icon-regular-x",
                size: n
            }))
        };

    function n_(e, t) {
        var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
            r = n.checkForDefaultPrevented,
            a = void 0 === r || r;
        return function(n) {
            if (null == e || e(n), !1 === a || !n.defaultPrevented) return null == t ? void 0 : t(n)
        }
    }

    function nA(e, t) {
        if ("function" == typeof e) return e(t);
        null != e && (e.current = t)
    }

    function nC() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        return function(e) {
            var n = !1,
                r = t.map(function(t) {
                    var r = nA(t, e);
                    return n || "function" != typeof r || (n = !0), r
                });
            if (n) return function() {
                for (var e = 0; e < r.length; e++) {
                    var n = r[e];
                    "function" == typeof n ? n() : nA(t[e], null)
                }
            }
        }
    }

    function nP() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        return C.useCallback(nC.apply(void 0, q(t)), t)
    }

    function nT(e) {
        var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
            n = [],
            r = function() {
                var t = n.map(function(e) {
                    return C.createContext(e)
                });
                return function(n) {
                    var r = (null == n ? void 0 : n[e]) || t;
                    return C.useMemo(function() {
                        return M({}, "__scope".concat(e), eg(er({}, n), M({}, e, r)))
                    }, [n, r])
                }
            };
        return r.scopeName = e, [function(t, r) {
            var a = C.createContext(r),
                i = n.length;
            n = q(n).concat([r]);
            var o = function(t) {
                var n, r = t.scope,
                    o = t.children,
                    u = nd(t, ["scope", "children"]),
                    s = (null == r || null == (n = r[e]) ? void 0 : n[i]) || a,
                    l = C.useMemo(function() {
                        return u
                    }, Object.values(u));
                return (0, na.jsx)(s.Provider, {
                    value: l,
                    children: o
                })
            };
            return o.displayName = t + "Provider", [o, function(n, o) {
                var u, s = (null == o || null == (u = o[e]) ? void 0 : u[i]) || a,
                    l = C.useContext(s);
                if (l) return l;
                if (void 0 !== r) return r;
                throw Error("`".concat(n, "` must be used within `").concat(t, "`"))
            }]
        }, nS.apply(void 0, [r].concat(q(t)))]
    }

    function nS() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        var r = t[0];
        if (1 === t.length) return r;
        var a = function() {
            var e = t.map(function(e) {
                return {
                    useScope: e(),
                    scopeName: e.scopeName
                }
            });
            return function(t) {
                var n = e.reduce(function(e, n) {
                    var r = n.useScope,
                        a = n.scopeName;
                    return er({}, e, r(t)["__scope".concat(a)])
                }, {});
                return C.useMemo(function() {
                    return M({}, "__scope".concat(r.scopeName), n)
                }, [n])
            }
        };
        return a.scopeName = r.scopeName, a
    }
    var nx = (null == (E = globalThis) ? void 0 : E.document) ? C.useLayoutEffect : function() {},
        nR = C[" useId ".trim().toString()] || function() {},
        nB = 0;

    function nI(e) {
        var t = K(C.useState(nR()), 2),
            n = t[0],
            r = t[1];
        return nx(function() {
            e || r(function(e) {
                return null != e ? e : String(nB++)
            })
        }, [e]), e || (n ? "radix-".concat(n) : "")
    }

    function nN(e) {
        var t = C.useRef(e);
        return C.useEffect(function() {
            t.current = e
        }), C.useMemo(function() {
            return function() {
                for (var e, n = arguments.length, r = Array(n), a = 0; a < n; a++) r[a] = arguments[a];
                return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(q(r)))
            }
        }, [])
    }
    var nw = window.RadixUI["react-dismissable-layer"],
        nU = window.RadixUI["react-focus-scope"];

    function nD(e) {
        var t, n, r = (t = e, (n = C.forwardRef(function(e, t) {
                var n = e.children,
                    r = nd(e, ["children"]);
                if (C.isValidElement(n)) {
                    var a, i, o, u, s, l = (s = (u = null == (i = Object.getOwnPropertyDescriptor((a = n).props, "ref")) ? void 0 : i.get) && "isReactWarning" in u && u.isReactWarning) ? a.ref : (s = (u = null == (o = Object.getOwnPropertyDescriptor(a, "ref")) ? void 0 : o.get) && "isReactWarning" in u && u.isReactWarning) ? a.props.ref : a.props.ref || a.ref,
                        c = function(e, t) {
                            var n = er({}, t);
                            for (var r in t) ! function(r) {
                                var a = e[r],
                                    i = t[r];
                                /^on[A-Z]/.test(r) ? a && i ? n[r] = function() {
                                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                    i.apply(void 0, q(t)), a.apply(void 0, q(t))
                                } : a && (n[r] = a) : "style" === r ? n[r] = er({}, a, i) : "className" === r && (n[r] = [a, i].filter(Boolean).join(" "))
                            }(r);
                            return er({}, e, n)
                        }(r, n.props);
                    return n.type !== C.Fragment && (c.ref = t ? nC(t, l) : l), C.cloneElement(n, c)
                }
                return C.Children.count(n) > 1 ? C.Children.only(null) : null
            })).displayName = "".concat(t, ".SlotClone"), n),
            a = C.forwardRef(function(e, t) {
                var n = e.children,
                    a = nd(e, ["children"]),
                    i = C.Children.toArray(n),
                    o = i.find(nF);
                if (o) {
                    var u = o.props.children,
                        s = i.map(function(e) {
                            return e !== o ? e : C.Children.count(u) > 1 ? C.Children.only(null) : C.isValidElement(u) ? u.props.children : null
                        });
                    return (0, na.jsx)(r, eg(er({}, a), {
                        ref: t,
                        children: C.isValidElement(u) ? C.cloneElement(u, void 0, s) : null
                    }))
                }
                return (0, na.jsx)(r, eg(er({}, a), {
                    ref: t,
                    children: n
                }))
            });
        return a.displayName = "".concat(e, ".Slot"), a
    }
    var nO = Symbol("radix.slottable");

    function nF(e) {
        return C.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === nO
    }
    var nM = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
            var n = nD("Primitive.".concat(t)),
                r = C.forwardRef(function(e, r) {
                    var a = e.asChild,
                        i = nd(e, ["asChild"]),
                        o = a ? n : t;
                    return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, na.jsx)(o, eg(er({}, i), {
                        ref: r
                    }))
                });
            return r.displayName = "Primitive.".concat(t), eg(er({}, e), M({}, t, r))
        }, {}),
        nL = C.forwardRef(function(e, t) {
            var n, r, a = e.container,
                i = nd(e, ["container"]),
                o = K(C.useState(!1), 2),
                u = o[0],
                s = o[1];
            nx(function() {
                return s(!0)
            }, []);
            var l = a || u && (null == (r = globalThis) || null == (n = r.document) ? void 0 : n.body);
            return l ? S().createPortal((0, na.jsx)(nM.div, eg(er({}, i), {
                ref: t
            })), l) : null
        });
    nL.displayName = "Portal";
    var nk = function(e) {
        var t, n, r, a, i, o, u, s, l, c, d, h, f, m, p, E, v, g = e.present,
            b = e.children,
            y = (t = g, i = (a = K(C.useState(), 2))[0], o = a[1], u = C.useRef({}), s = C.useRef(t), l = C.useRef("none"), d = (c = K((n = t ? "mounted" : "unmounted", r = {
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
            }, C.useReducer(function(e, t) {
                var n = r[e][t];
                return null != n ? n : e
            }, n)), 2))[0], h = c[1], C.useEffect(function() {
                var e = nH(u.current);
                l.current = "mounted" === d ? e : "none"
            }, [d]), nx(function() {
                var e = u.current,
                    n = s.current;
                if (n !== t) {
                    var r = l.current,
                        a = nH(e);
                    t ? h("MOUNT") : "none" === a || (null == e ? void 0 : e.display) === "none" ? h("UNMOUNT") : n && r !== a ? h("ANIMATION_OUT") : h("UNMOUNT"), s.current = t
                }
            }, [t, h]), nx(function() {
                if (i) {
                    var e, t, n = null != (e = i.ownerDocument.defaultView) ? e : window,
                        r = function(e) {
                            var r = nH(u.current).includes(e.animationName);
                            if (e.target === i && r && (h("ANIMATION_END"), !s.current)) {
                                var a = i.style.animationFillMode;
                                i.style.animationFillMode = "forwards", t = n.setTimeout(function() {
                                    "forwards" === i.style.animationFillMode && (i.style.animationFillMode = a)
                                })
                            }
                        },
                        a = function(e) {
                            e.target === i && (l.current = nH(u.current))
                        };
                    return i.addEventListener("animationstart", a), i.addEventListener("animationcancel", r), i.addEventListener("animationend", r),
                        function() {
                            n.clearTimeout(t), i.removeEventListener("animationstart", a), i.removeEventListener("animationcancel", r), i.removeEventListener("animationend", r)
                        }
                }
                h("ANIMATION_END")
            }, [i, h]), {
                isPresent: ["mounted", "unmountSuspended"].includes(d),
                ref: C.useCallback(function(e) {
                    e && (u.current = getComputedStyle(e)), o(e)
                }, [])
            }),
            _ = "function" == typeof b ? b({
                present: y.isPresent
            }) : C.Children.only(b),
            A = nP(y.ref, (v = (E = null == (m = Object.getOwnPropertyDescriptor((f = _).props, "ref")) ? void 0 : m.get) && "isReactWarning" in E && E.isReactWarning) ? f.ref : (v = (E = null == (p = Object.getOwnPropertyDescriptor(f, "ref")) ? void 0 : p.get) && "isReactWarning" in E && E.isReactWarning) ? f.props.ref : f.props.ref || f.ref);
        return "function" == typeof b || y.isPresent ? C.cloneElement(_, {
            ref: A
        }) : null
    };

    function nH(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    nk.displayName = "Presence";
    var nG = window.RadixUI["react-focus-guards"],
        nj = function() {
            return (nj = Object.assign || function(e) {
                for (var t, n = 1, r = arguments.length; n < r; n++)
                    for (var a in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a]);
                return e
            }).apply(this, arguments)
        };

    function nW(e, t) {
        var n = {};
        for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && 0 > t.indexOf(r) && (n[r] = e[r]);
        if (null != e && "function" == typeof Object.getOwnPropertySymbols)
            for (var a = 0, r = Object.getOwnPropertySymbols(e); a < r.length; a++) 0 > t.indexOf(r[a]) && Object.prototype.propertyIsEnumerable.call(e, r[a]) && (n[r[a]] = e[r[a]]);
        return n
    }
    var nV = "right-scroll-bar-position",
        nX = "width-before-scroll-bar";

    function nz(e, t) {
        return "function" == typeof e ? e(t) : e && (e.current = t), e
    }
    var nK = "u" > typeof window ? C.useLayoutEffect : C.useEffect,
        nY = new WeakMap,
        nq = (void 0 === t && (t = {}), (void 0 === n && (n = function(e) {
            return e
        }), r = [], a = !1, i = {
            read: function() {
                if (a) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                return r.length ? r[r.length - 1] : null
            },
            useMedium: function(e) {
                var t = n(e, a);
                return r.push(t),
                    function() {
                        r = r.filter(function(e) {
                            return e !== t
                        })
                    }
            },
            assignSyncMedium: function(e) {
                for (a = !0; r.length;) {
                    var t = r;
                    r = [], t.forEach(e)
                }
                r = {
                    push: function(t) {
                        return e(t)
                    },
                    filter: function() {
                        return r
                    }
                }
            },
            assignMedium: function(e) {
                a = !0;
                var t = [];
                if (r.length) {
                    var n = r;
                    r = [], n.forEach(e), t = r
                }
                var i = function() {
                        var n = t;
                        t = [], n.forEach(e)
                    },
                    o = function() {
                        return Promise.resolve().then(i)
                    };
                o(), r = {
                    push: function(e) {
                        t.push(e), o()
                    },
                    filter: function(e) {
                        return t = t.filter(e), r
                    }
                }
            }
        }).options = nj({
            async: !0,
            ssr: !1
        }, t), i),
        nZ = function() {},
        nQ = C.forwardRef(function(e, t) {
            var n, r, a, i, o = C.useRef(null),
                u = C.useState({
                    onScrollCapture: nZ,
                    onWheelCapture: nZ,
                    onTouchMoveCapture: nZ
                }),
                s = u[0],
                l = u[1],
                c = e.forwardProps,
                d = e.children,
                h = e.className,
                f = e.removeScrollBar,
                m = e.enabled,
                p = e.shards,
                E = e.sideCar,
                v = e.noRelative,
                g = e.noIsolation,
                b = e.inert,
                y = e.allowPinchZoom,
                _ = e.as,
                A = e.gapMode,
                P = nW(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                T = (n = [o, t], r = function(e) {
                    return n.forEach(function(t) {
                        return nz(t, e)
                    })
                }, (a = (0, C.useState)(function() {
                    return {
                        value: null,
                        callback: r,
                        facade: {
                            get current() {
                                return a.value
                            },
                            set current(value) {
                                var e = a.value;
                                e !== value && (a.value = value, a.callback(value, e))
                            }
                        }
                    }
                })[0]).callback = r, i = a.facade, nK(function() {
                    var e = nY.get(i);
                    if (e) {
                        var t = new Set(e),
                            r = new Set(n),
                            a = i.current;
                        t.forEach(function(e) {
                            r.has(e) || nz(e, null)
                        }), r.forEach(function(e) {
                            t.has(e) || nz(e, a)
                        })
                    }
                    nY.set(i, n)
                }, [n]), i),
                S = nj(nj({}, P), s);
            return C.createElement(C.Fragment, null, m && C.createElement(E, {
                sideCar: nq,
                removeScrollBar: f,
                shards: p,
                noRelative: v,
                noIsolation: g,
                inert: b,
                setCallbacks: l,
                allowPinchZoom: !!y,
                lockRef: o,
                gapMode: A
            }), c ? C.cloneElement(C.Children.only(d), nj(nj({}, S), {
                ref: T
            })) : C.createElement(void 0 === _ ? "div" : _, nj({}, S, {
                className: h,
                ref: T
            }), d))
        });
    nQ.defaultProps = {
        enabled: !0,
        removeScrollBar: !0,
        inert: !1
    }, nQ.classNames = {
        fullWidth: nX,
        zeroRight: nV
    };
    var nJ = function(e) {
        var t = e.sideCar,
            n = nW(e, ["sideCar"]);
        if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
        var r = t.read();
        if (!r) throw Error("Sidecar medium not found");
        return C.createElement(r, nj({}, n))
    };
    nJ.isSideCarExport = !0;
    var n$ = function() {
            var e = 0,
                t = null;
            return {
                add: function(n) {
                    if (0 == e && (t = function() {
                            if (!document) return null;
                            var e = document.createElement("style");
                            e.type = "text/css";
                            var t = v || A.nc;
                            return t && e.setAttribute("nonce", t), e
                        }())) {
                        var r, a;
                        (r = t).styleSheet ? r.styleSheet.cssText = n : r.appendChild(document.createTextNode(n)), a = t, (document.head || document.getElementsByTagName("head")[0]).appendChild(a)
                    }
                    e++
                },
                remove: function() {
                    --e || !t || (t.parentNode && t.parentNode.removeChild(t), t = null)
                }
            }
        },
        n0 = function() {
            var e = n$();
            return function(t, n) {
                C.useEffect(function() {
                    return e.add(t),
                        function() {
                            e.remove()
                        }
                }, [t && n])
            }
        },
        n1 = function() {
            var e = n0();
            return function(t) {
                return e(t.styles, t.dynamic), null
            }
        },
        n2 = {
            left: 0,
            top: 0,
            right: 0,
            gap: 0
        },
        n3 = function(e) {
            return parseInt(e || "", 10) || 0
        },
        n5 = function(e) {
            var t = window.getComputedStyle(document.body),
                n = t["padding" === e ? "paddingLeft" : "marginLeft"],
                r = t["padding" === e ? "paddingTop" : "marginTop"],
                a = t["padding" === e ? "paddingRight" : "marginRight"];
            return [n3(n), n3(r), n3(a)]
        },
        n6 = function(e) {
            if (void 0 === e && (e = "margin"), "u" < typeof window) return n2;
            var t = n5(e),
                n = document.documentElement.clientWidth,
                r = window.innerWidth;
            return {
                left: t[0],
                top: t[1],
                right: t[2],
                gap: Math.max(0, r - n + t[2] - t[0])
            }
        },
        n4 = n1(),
        n8 = "data-scroll-locked",
        n9 = function(e, t, n, r) {
            var a = e.left,
                i = e.top,
                o = e.right,
                u = e.gap;
            return void 0 === n && (n = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(r, ";\n   padding-right: ").concat(u, "px ").concat(r, ";\n  }\n  body[").concat(n8, "] {\n    overflow: hidden ").concat(r, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(r, ";"), "margin" === n && "\n    padding-left: ".concat(a, "px;\n    padding-top: ").concat(i, "px;\n    padding-right: ").concat(o, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(u, "px ").concat(r, ";\n    "), "padding" === n && "padding-right: ".concat(u, "px ").concat(r, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(nV, " {\n    right: ").concat(u, "px ").concat(r, ";\n  }\n  \n  .").concat(nX, " {\n    margin-right: ").concat(u, "px ").concat(r, ";\n  }\n  \n  .").concat(nV, " .").concat(nV, " {\n    right: 0 ").concat(r, ";\n  }\n  \n  .").concat(nX, " .").concat(nX, " {\n    margin-right: 0 ").concat(r, ";\n  }\n  \n  body[").concat(n8, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(u, "px;\n  }\n")
        },
        n7 = function() {
            var e = parseInt(document.body.getAttribute(n8) || "0", 10);
            return isFinite(e) ? e : 0
        },
        re = function() {
            C.useEffect(function() {
                return document.body.setAttribute(n8, (n7() + 1).toString()),
                    function() {
                        var e = n7() - 1;
                        e <= 0 ? document.body.removeAttribute(n8) : document.body.setAttribute(n8, e.toString())
                    }
            }, [])
        },
        rt = function(e) {
            var t = e.noRelative,
                n = e.noImportant,
                r = e.gapMode,
                a = void 0 === r ? "margin" : r;
            re();
            var i = C.useMemo(function() {
                return n6(a)
            }, [a]);
            return C.createElement(n4, {
                styles: n9(i, !t, a, n ? "" : "!important")
            })
        },
        rn = !1;
    if ("u" > typeof window) try {
        var rr = Object.defineProperty({}, "passive", {
            get: function() {
                return rn = !0, !0
            }
        });
        window.addEventListener("test", rr, rr), window.removeEventListener("test", rr, rr)
    } catch (e) {
        rn = !1
    }
    var ra = !!rn && {
            passive: !1
        },
        ri = function(e, t) {
            if (!U(e, Element)) return !1;
            var n = window.getComputedStyle(e);
            return "hidden" !== n[t] && (n.overflowY !== n.overflowX || "TEXTAREA" === e.tagName || "visible" !== n[t])
        },
        ro = function(e, t) {
            var n = t.ownerDocument,
                r = t;
            do {
                if ("u" > typeof ShadowRoot && U(r, ShadowRoot) && (r = r.host), ru(e, r)) {
                    var a = rs(e, r);
                    if (a[1] > a[2]) return !0
                }
                r = r.parentNode
            } while (r && r !== n.body);
            return !1
        },
        ru = function(e, t) {
            return "v" === e ? ri(t, "overflowY") : ri(t, "overflowX")
        },
        rs = function(e, t) {
            return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
        },
        rl = function(e, t, n, r, a) {
            var i, o = (i = window.getComputedStyle(t).direction, "h" === e && "rtl" === i ? -1 : 1),
                u = o * r,
                s = n.target,
                l = t.contains(s),
                c = !1,
                d = u > 0,
                h = 0,
                f = 0;
            do {
                if (!s) break;
                var m = rs(e, s),
                    p = m[0],
                    E = m[1] - m[2] - o * p;
                (p || E) && ru(e, s) && (h += E, f += p);
                var v = s.parentNode;
                s = v && v.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? v.host : v
            } while (!l && s !== document.body || l && (t.contains(s) || t === s));
            return d && (a && 1 > Math.abs(h) || !a && u > h) ? c = !0 : !d && (a && 1 > Math.abs(f) || !a && -u > f) && (c = !0), c
        },
        rc = function(e) {
            return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
        },
        rd = function(e) {
            return [e.deltaX, e.deltaY]
        },
        rh = function(e) {
            return e && "current" in e ? e.current : e
        },
        rf = 0,
        rm = [],
        rp = (o = function(e) {
            var t = C.useRef([]),
                n = C.useRef([0, 0]),
                r = C.useRef(),
                a = C.useState(rf++)[0],
                i = C.useState(n1)[0],
                o = C.useRef(e);
            C.useEffect(function() {
                o.current = e
            }, [e]), C.useEffect(function() {
                if (e.inert) {
                    document.body.classList.add("block-interactivity-".concat(a));
                    var t = (function(e, t, n) {
                        if (n || 2 == arguments.length)
                            for (var r, a = 0, i = t.length; a < i; a++) !r && a in t || (r || (r = Array.prototype.slice.call(t, 0, a)), r[a] = t[a]);
                        return e.concat(r || Array.prototype.slice.call(t))
                    })([e.lockRef.current], (e.shards || []).map(rh), !0).filter(Boolean);
                    return t.forEach(function(e) {
                            return e.classList.add("allow-interactivity-".concat(a))
                        }),
                        function() {
                            document.body.classList.remove("block-interactivity-".concat(a)), t.forEach(function(e) {
                                return e.classList.remove("allow-interactivity-".concat(a))
                            })
                        }
                }
            }, [e.inert, e.lockRef.current, e.shards]);
            var u = C.useCallback(function(e, t) {
                    if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !o.current.allowPinchZoom;
                    var a, i = rc(e),
                        u = n.current,
                        s = "deltaX" in e ? e.deltaX : u[0] - i[0],
                        l = "deltaY" in e ? e.deltaY : u[1] - i[1],
                        c = e.target,
                        d = Math.abs(s) > Math.abs(l) ? "h" : "v";
                    if ("touches" in e && "h" === d && "range" === c.type) return !1;
                    var h = ro(d, c);
                    if (!h) return !0;
                    if (h ? a = d : (a = "v" === d ? "h" : "v", h = ro(d, c)), !h) return !1;
                    if (!r.current && "changedTouches" in e && (s || l) && (r.current = a), !a) return !0;
                    var f = r.current || a;
                    return rl(f, t, e, "h" === f ? s : l, !0)
                }, []),
                s = C.useCallback(function(e) {
                    if (rm.length && rm[rm.length - 1] === i) {
                        var n = "deltaY" in e ? rd(e) : rc(e),
                            r = t.current.filter(function(t) {
                                var r;
                                return t.name === e.type && (t.target === e.target || e.target === t.shadowParent) && (r = t.delta, r[0] === n[0] && r[1] === n[1])
                            })[0];
                        if (r && r.should) {
                            e.cancelable && e.preventDefault();
                            return
                        }
                        if (!r) {
                            var a = (o.current.shards || []).map(rh).filter(Boolean).filter(function(t) {
                                return t.contains(e.target)
                            });
                            (a.length > 0 ? u(e, a[0]) : !o.current.noIsolation) && e.cancelable && e.preventDefault()
                        }
                    }
                }, []),
                l = C.useCallback(function(e, n, r, a) {
                    var i = {
                        name: e,
                        delta: n,
                        target: r,
                        should: a,
                        shadowParent: function(e) {
                            for (var t = null; null !== e;) U(e, ShadowRoot) && (t = e.host, e = e.host), e = e.parentNode;
                            return t
                        }(r)
                    };
                    t.current.push(i), setTimeout(function() {
                        t.current = t.current.filter(function(e) {
                            return e !== i
                        })
                    }, 1)
                }, []),
                c = C.useCallback(function(e) {
                    n.current = rc(e), r.current = void 0
                }, []),
                d = C.useCallback(function(t) {
                    l(t.type, rd(t), t.target, u(t, e.lockRef.current))
                }, []),
                h = C.useCallback(function(t) {
                    l(t.type, rc(t), t.target, u(t, e.lockRef.current))
                }, []);
            C.useEffect(function() {
                return rm.push(i), e.setCallbacks({
                        onScrollCapture: d,
                        onWheelCapture: d,
                        onTouchMoveCapture: h
                    }), document.addEventListener("wheel", s, ra), document.addEventListener("touchmove", s, ra), document.addEventListener("touchstart", c, ra),
                    function() {
                        rm = rm.filter(function(e) {
                            return e !== i
                        }), document.removeEventListener("wheel", s, ra), document.removeEventListener("touchmove", s, ra), document.removeEventListener("touchstart", c, ra)
                    }
            }, []);
            var f = e.removeScrollBar,
                m = e.inert;
            return C.createElement(C.Fragment, null, m ? C.createElement(i, {
                styles: "\n  .block-interactivity-".concat(a, " {pointer-events: none;}\n  .allow-interactivity-").concat(a, " {pointer-events: all;}\n")
            }) : null, f ? C.createElement(rt, {
                noRelative: e.noRelative,
                gapMode: e.gapMode
            }) : null)
        }, nq.useMedium(o), nJ),
        rE = C.forwardRef(function(e, t) {
            return C.createElement(nQ, nj({}, e, {
                ref: t,
                sideCar: rp
            }))
        });
    rE.classNames = nQ.classNames;
    var rv = new WeakMap,
        rg = new WeakMap,
        rb = {},
        ry = 0,
        r_ = function(e) {
            return e && (e.host || r_(e.parentNode))
        },
        rA = function(e, t, n, r) {
            var a = (Array.isArray(e) ? e : [e]).map(function(e) {
                if (t.contains(e)) return e;
                var n = r_(e);
                return n && t.contains(n) ? n : (console.error("aria-hidden", e, "in not contained inside", t, ". Doing nothing"), null)
            }).filter(function(e) {
                return !!e
            });
            rb[n] || (rb[n] = new WeakMap);
            var i = rb[n],
                o = [],
                u = new Set,
                s = new Set(a),
                l = function(e) {
                    !e || u.has(e) || (u.add(e), l(e.parentNode))
                };
            a.forEach(l);
            var c = function(e) {
                !e || s.has(e) || Array.prototype.forEach.call(e.children, function(e) {
                    if (u.has(e)) c(e);
                    else try {
                        var t = e.getAttribute(r),
                            a = null !== t && "false" !== t,
                            s = (rv.get(e) || 0) + 1,
                            l = (i.get(e) || 0) + 1;
                        rv.set(e, s), i.set(e, l), o.push(e), 1 === s && a && rg.set(e, !0), 1 === l && e.setAttribute(n, "true"), a || e.setAttribute(r, "true")
                    } catch (t) {
                        console.error("aria-hidden: cannot operate on ", e, t)
                    }
                })
            };
            return c(t), u.clear(), ry++,
                function() {
                    o.forEach(function(e) {
                        var t = rv.get(e) - 1,
                            a = i.get(e) - 1;
                        rv.set(e, t), i.set(e, a), t || (rg.has(e) || e.removeAttribute(r), rg.delete(e)), a || e.removeAttribute(n)
                    }), --ry || (rv = new WeakMap, rv = new WeakMap, rg = new WeakMap, rb = {})
                }
        },
        rC = function(e, t, n) {
            void 0 === n && (n = "data-aria-hidden");
            var r = Array.from(Array.isArray(e) ? e : [e]),
                a = t || ("u" < typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body);
            return a ? (r.push.apply(r, Array.from(a.querySelectorAll("[aria-live], script"))), rA(r, a, n, "aria-hidden")) : function() {
                return null
            }
        },
        rP = "Dialog",
        rT = K(nT(rP), 2),
        rS = rT[0];
    rT[1];
    var rx = K(rS(rP), 2),
        rR = rx[0],
        rB = rx[1],
        rI = function(e) {
            var t, n, r, a, i, o, u, s, l, c, d, h, f, m, p, E, v, g = e.__scopeDialog,
                b = e.children,
                y = e.open,
                _ = e.defaultOpen,
                A = e.onOpenChange,
                P = e.modal,
                T = C.useRef(null),
                S = C.useRef(null),
                x = K((l = (s = {
                    prop: y,
                    defaultProp: _,
                    onChange: A
                }).prop, f = (h = K((n = (t = {
                    defaultProp: s.defaultProp,
                    onChange: d = void 0 === (c = s.onChange) ? function() {} : c
                }).defaultProp, r = t.onChange, i = K(a = C.useState(n), 1)[0], o = C.useRef(i), u = nN(r), C.useEffect(function() {
                    o.current !== i && (u(i), o.current = i)
                }, [i, o, u]), a), 2))[0], m = h[1], E = (p = void 0 !== l) ? l : f, v = nN(d), [E, C.useCallback(function(e) {
                    if (p) {
                        var t = "function" == typeof e ? e(l) : e;
                        t !== l && v(t)
                    } else m(e)
                }, [p, l, m, v])]), 2),
                R = x[0],
                B = x[1];
            return (0, na.jsx)(rR, {
                scope: g,
                triggerRef: T,
                contentRef: S,
                contentId: nI(),
                titleId: nI(),
                descriptionId: nI(),
                open: void 0 !== R && R,
                onOpenChange: B,
                onOpenToggle: C.useCallback(function() {
                    return B(function(e) {
                        return !e
                    })
                }, [B]),
                modal: void 0 === P || P,
                children: b
            })
        };
    rI.displayName = rP;
    var rN = "DialogTrigger";
    C.forwardRef(function(e, t) {
        var n = e.__scopeDialog,
            r = nd(e, ["__scopeDialog"]),
            a = rB(rN, n),
            i = nP(t, a.triggerRef);
        return (0, na.jsx)(nM.button, eg(er({
            type: "button",
            "aria-haspopup": "dialog",
            "aria-expanded": a.open,
            "aria-controls": a.contentId,
            "data-state": rQ(a.open)
        }, r), {
            ref: i,
            onClick: n_(e.onClick, a.onOpenToggle)
        }))
    }).displayName = rN;
    var rw = "DialogPortal",
        rU = K(rS(rw, {
            forceMount: void 0
        }), 2),
        rD = rU[0],
        rO = rU[1],
        rF = function(e) {
            var t = e.__scopeDialog,
                n = e.forceMount,
                r = e.children,
                a = e.container,
                i = rB(rw, t);
            return (0, na.jsx)(rD, {
                scope: t,
                forceMount: n,
                children: C.Children.map(r, function(e) {
                    return (0, na.jsx)(nk, {
                        present: n || i.open,
                        children: (0, na.jsx)(nL, {
                            asChild: !0,
                            container: a,
                            children: e
                        })
                    })
                })
            })
        };
    rF.displayName = rw;
    var rM = "DialogOverlay",
        rL = C.forwardRef(function(e, t) {
            var n = rO(rM, e.__scopeDialog),
                r = e.forceMount,
                a = void 0 === r ? n.forceMount : r,
                i = nd(e, ["forceMount"]),
                o = rB(rM, e.__scopeDialog);
            return o.modal ? (0, na.jsx)(nk, {
                present: a || o.open,
                children: (0, na.jsx)(rH, eg(er({}, i), {
                    ref: t
                }))
            }) : null
        });
    rL.displayName = rM;
    var rk = nD("DialogOverlay.RemoveScroll"),
        rH = C.forwardRef(function(e, t) {
            var n = e.__scopeDialog,
                r = nd(e, ["__scopeDialog"]),
                a = rB(rM, n);
            return (0, na.jsx)(rE, {
                as: rk,
                allowPinchZoom: !0,
                shards: [a.contentRef],
                children: (0, na.jsx)(nM.div, eg(er({
                    "data-state": rQ(a.open)
                }, r), {
                    ref: t,
                    style: er({
                        pointerEvents: "auto"
                    }, r.style)
                }))
            })
        }),
        rG = "DialogContent",
        rj = C.forwardRef(function(e, t) {
            var n = rO(rG, e.__scopeDialog),
                r = e.forceMount,
                a = void 0 === r ? n.forceMount : r,
                i = nd(e, ["forceMount"]),
                o = rB(rG, e.__scopeDialog);
            return (0, na.jsx)(nk, {
                present: a || o.open,
                children: o.modal ? (0, na.jsx)(rW, eg(er({}, i), {
                    ref: t
                })) : (0, na.jsx)(rV, eg(er({}, i), {
                    ref: t
                }))
            })
        });
    rj.displayName = rG;
    var rW = C.forwardRef(function(e, t) {
            var n = rB(rG, e.__scopeDialog),
                r = C.useRef(null),
                a = nP(t, n.contentRef, r);
            return C.useEffect(function() {
                var e = r.current;
                if (e) return rC(e)
            }, []), (0, na.jsx)(rX, eg(er({}, e), {
                ref: a,
                trapFocus: n.open,
                disableOutsidePointerEvents: !0,
                onCloseAutoFocus: n_(e.onCloseAutoFocus, function(e) {
                    var t;
                    e.preventDefault(), null == (t = n.triggerRef.current) || t.focus()
                }),
                onPointerDownOutside: n_(e.onPointerDownOutside, function(e) {
                    var t = e.detail.originalEvent,
                        n = 0 === t.button && !0 === t.ctrlKey;
                    (2 === t.button || n) && e.preventDefault()
                }),
                onFocusOutside: n_(e.onFocusOutside, function(e) {
                    return e.preventDefault()
                })
            }))
        }),
        rV = C.forwardRef(function(e, t) {
            var n = rB(rG, e.__scopeDialog),
                r = C.useRef(!1),
                a = C.useRef(!1);
            return (0, na.jsx)(rX, eg(er({}, e), {
                ref: t,
                trapFocus: !1,
                disableOutsidePointerEvents: !1,
                onCloseAutoFocus: function(t) {
                    var i, o;
                    null == (i = e.onCloseAutoFocus) || i.call(e, t), t.defaultPrevented || (r.current || null == (o = n.triggerRef.current) || o.focus(), t.preventDefault()), r.current = !1, a.current = !1
                },
                onInteractOutside: function(t) {
                    null == (i = e.onInteractOutside) || i.call(e, t), t.defaultPrevented || (r.current = !0, "pointerdown" === t.detail.originalEvent.type && (a.current = !0));
                    var i, o, u = t.target;
                    (null == (o = n.triggerRef.current) ? void 0 : o.contains(u)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && a.current && t.preventDefault()
                }
            }))
        }),
        rX = C.forwardRef(function(e, t) {
            var n = e.__scopeDialog,
                r = e.trapFocus,
                a = e.onOpenAutoFocus,
                i = e.onCloseAutoFocus,
                o = nd(e, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                u = rB(rG, n),
                s = C.useRef(null),
                l = nP(t, s);
            return (0, nG.useFocusGuards)(), (0, na.jsxs)(na.Fragment, {
                children: [(0, na.jsx)(nU.FocusScope, {
                    asChild: !0,
                    loop: !0,
                    trapped: r,
                    onMountAutoFocus: a,
                    onUnmountAutoFocus: i,
                    children: (0, na.jsx)(nw.DismissableLayer, eg(er({
                        role: "dialog",
                        id: u.contentId,
                        "aria-describedby": u.descriptionId,
                        "aria-labelledby": u.titleId,
                        "data-state": rQ(u.open)
                    }, o), {
                        ref: l,
                        onDismiss: function() {
                            return u.onOpenChange(!1)
                        }
                    }))
                }), (0, na.jsxs)(na.Fragment, {
                    children: [(0, na.jsx)(r1, {
                        titleId: u.titleId
                    }), (0, na.jsx)(r2, {
                        contentRef: s,
                        descriptionId: u.descriptionId
                    })]
                })]
            })
        }),
        rz = "DialogTitle",
        rK = C.forwardRef(function(e, t) {
            var n = e.__scopeDialog,
                r = nd(e, ["__scopeDialog"]),
                a = rB(rz, n);
            return (0, na.jsx)(nM.h2, eg(er({
                id: a.titleId
            }, r), {
                ref: t
            }))
        });
    rK.displayName = rz;
    var rY = "DialogDescription";
    C.forwardRef(function(e, t) {
        var n = e.__scopeDialog,
            r = nd(e, ["__scopeDialog"]),
            a = rB(rY, n);
        return (0, na.jsx)(nM.p, eg(er({
            id: a.descriptionId
        }, r), {
            ref: t
        }))
    }).displayName = rY;
    var rq = "DialogClose",
        rZ = C.forwardRef(function(e, t) {
            var n = e.__scopeDialog,
                r = nd(e, ["__scopeDialog"]),
                a = rB(rq, n);
            return (0, na.jsx)(nM.button, eg(er({
                type: "button"
            }, r), {
                ref: t,
                onClick: n_(e.onClick, function() {
                    return a.onOpenChange(!1)
                })
            }))
        });

    function rQ(e) {
        return e ? "open" : "closed"
    }
    rZ.displayName = rq;
    var rJ = "DialogTitleWarning",
        r$ = K((u = {
            contentName: rG,
            titleName: rz,
            docsSlug: "dialog"
        }, s = C.createContext(u), (l = function(e) {
            var t = e.children,
                n = nd(e, ["children"]),
                r = C.useMemo(function() {
                    return n
                }, Object.values(n));
            return (0, na.jsx)(s.Provider, {
                value: r,
                children: t
            })
        }).displayName = rJ + "Provider", [l, function(e) {
            var t = C.useContext(s);
            if (t) return t;
            if (void 0 !== u) return u;
            throw Error("`".concat(e, "` must be used within `").concat(rJ, "`"))
        }]), 2),
        r0 = (r$[0], r$[1]),
        r1 = function(e) {
            var t = e.titleId,
                n = r0(rJ),
                r = "`".concat(n.contentName, "` requires a `").concat(n.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(n.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(n.docsSlug);
            return C.useEffect(function() {
                t && (document.getElementById(t) || console.error(r))
            }, [r, t]), null
        },
        r2 = function(e) {
            var t = e.contentRef,
                n = e.descriptionId,
                r = r0("DialogDescriptionWarning"),
                a = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(r.contentName, "}.");
            return C.useEffect(function() {
                var e, r = null == (e = t.current) ? void 0 : e.getAttribute("aria-describedby");
                n && r && (document.getElementById(n) || console.warn(a))
            }, [a, t, n]), null
        },
        r3 = Symbol("radix.slottable");

    function r5(e) {
        return C.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === r3
    }
    var r6 = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
            var n, r, a, i, o, u = (n = a = "Primitive.".concat(t), (r = C.forwardRef(function(e, t) {
                    var n = e.children,
                        r = nd(e, ["children"]);
                    if (C.isValidElement(n)) {
                        var a, i, o, u, s, l = (s = (u = null == (i = Object.getOwnPropertyDescriptor((a = n).props, "ref")) ? void 0 : i.get) && "isReactWarning" in u && u.isReactWarning) ? a.ref : (s = (u = null == (o = Object.getOwnPropertyDescriptor(a, "ref")) ? void 0 : o.get) && "isReactWarning" in u && u.isReactWarning) ? a.props.ref : a.props.ref || a.ref,
                            c = function(e, t) {
                                var n = er({}, t);
                                for (var r in t) ! function(r) {
                                    var a = e[r],
                                        i = t[r];
                                    /^on[A-Z]/.test(r) ? a && i ? n[r] = function() {
                                        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                        var r = i.apply(void 0, q(t));
                                        return a.apply(void 0, q(t)), r
                                    } : a && (n[r] = a) : "style" === r ? n[r] = er({}, a, i) : "className" === r && (n[r] = [a, i].filter(Boolean).join(" "))
                                }(r);
                                return er({}, e, n)
                            }(r, n.props);
                        return n.type !== C.Fragment && (c.ref = t ? nC(t, l) : l), C.cloneElement(n, c)
                    }
                    return C.Children.count(n) > 1 ? C.Children.only(null) : null
                })).displayName = "".concat(n, ".SlotClone"), i = r, (o = C.forwardRef(function(e, t) {
                    var n = e.children,
                        r = nd(e, ["children"]),
                        a = C.Children.toArray(n),
                        o = a.find(r5);
                    if (o) {
                        var u = o.props.children,
                            s = a.map(function(e) {
                                return e !== o ? e : C.Children.count(u) > 1 ? C.Children.only(null) : C.isValidElement(u) ? u.props.children : null
                            });
                        return (0, na.jsx)(i, eg(er({}, r), {
                            ref: t,
                            children: C.isValidElement(u) ? C.cloneElement(u, void 0, s) : null
                        }))
                    }
                    return (0, na.jsx)(i, eg(er({}, r), {
                        ref: t,
                        children: n
                    }))
                })).displayName = "".concat(a, ".Slot"), o),
                s = C.forwardRef(function(e, n) {
                    var r = e.asChild,
                        a = nd(e, ["asChild"]),
                        i = r ? u : t;
                    return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, na.jsx)(i, eg(er({}, a), {
                        ref: n
                    }))
                });
            return s.displayName = "Primitive.".concat(t), eg(er({}, e), M({}, t, s))
        }, {}),
        r4 = Object.freeze({
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
        r8 = C.forwardRef(function(e, t) {
            return (0, na.jsx)(r6.span, eg(er({}, e), {
                ref: t,
                style: er({}, r4, e.style)
            }))
        });
    r8.displayName = "VisuallyHidden";
    var r9 = (0, C.createContext)({
            size: "Medium",
            isModal: !0,
            hasCloseAffordance: !1,
            hasMarginTop: !0,
            hasMarginBottom: !0,
            hasDescription: !1,
            type: "Default"
        }),
        r7 = function() {
            var e = (0, C.useContext)(r9);
            if (!e) throw Error("Dialog components must be used within a Dialog");
            return e
        },
        ae = {
            Small: "padding-x-large",
            Medium: "padding-x-xlarge",
            Large: "padding-x-xlarge"
        },
        at = {
            Small: "padding-top-large",
            Medium: "padding-top-xlarge",
            Large: "padding-top-xlarge"
        },
        an = {
            Small: "padding-bottom-large",
            Medium: "padding-bottom-xlarge",
            Large: "padding-bottom-xlarge"
        },
        ar = function(e) {
            var t = e.open,
                n = e.onOpenChange,
                r = e.children,
                a = e.size,
                i = e.type,
                o = void 0 === i ? "Default" : i,
                u = e.isModal,
                s = e.hasCloseAffordance,
                l = e.closeLabel,
                c = e.hasMarginTop,
                d = void 0 === c || c,
                h = e.hasMarginBottom,
                f = void 0 === h || h,
                m = e.hasDescription,
                p = void 0 !== m && m,
                E = e.experimentalDisablePointerEventsStylingOnBody,
                v = void 0 !== E && E,
                g = (0, C.useMemo)(function() {
                    return {
                        size: a,
                        isModal: u,
                        type: o,
                        hasCloseAffordance: s,
                        closeLabel: l,
                        hasMarginTop: d,
                        hasMarginBottom: f,
                        hasDescription: p
                    }
                }, [a, u, o, s, l, d, f, p]);
            return (0, C.useEffect)(function() {
                v && setTimeout(function() {
                    Object.assign(document.body.style, {
                        pointerEvents: "unset"
                    })
                }, 0)
            }, [v, t]), P().createElement(r9.Provider, {
                value: g
            }, P().createElement(rI, {
                open: t,
                onOpenChange: n
            }, r))
        };
    ar.displayName = "Dialog";
    var aa = function(e) {
        var t = e.children,
            n = e.className,
            r = e.style,
            a = e.overlayClassName,
            i = e.overlayStyle,
            o = e.onOpenAutoFocus,
            u = nd(e, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
            s = r7(),
            l = s.size,
            c = s.isModal,
            d = s.hasCloseAffordance,
            h = s.closeLabel,
            f = s.hasDescription,
            m = nh("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", c && "bg-common-backdrop", a),
            p = nh("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", n);
        return P().createElement(rF, null, P().createElement(rL, {
            className: m,
            style: i
        }, P().createElement(rj, er({
            className: p,
            "data-size": l,
            style: r,
            onOpenAutoFocus: o
        }, !f && {
            "aria-describedby": void 0
        }, u), d && P().createElement("div", {
            className: "absolute foundation-web-dialog-close-container"
        }, P().createElement(rZ, {
            asChild: !0
        }, P().createElement(ny, {
            variant: "OverMedia",
            size: l,
            isCircular: !0,
            "aria-label": h
        }))), t)))
    };
    aa.displayName = "DialogContent";
    var ai = function(e) {
        var t = e.children,
            n = e.className,
            r = nd(e, ["children", "className"]),
            a = r7(),
            i = a.size,
            o = a.hasMarginTop,
            u = a.hasMarginBottom,
            s = nh(ae[i], o && at[i], u && an[i], n);
        return P().createElement("div", er({
            className: s
        }, r), t)
    };
    ai.displayName = "DialogBody";
    var ao = function(e) {
        var t = e.children,
            n = e.className,
            r = e.hidden,
            a = nd(e, ["children", "className", "hidden"]),
            i = P().createElement(rK, er({
                className: n
            }, a), t);
        return r ? P().createElement(r8, null, i) : i
    };
    ao.displayName = "DialogTitle";
    var au = function(e) {
        var t = e.children,
            n = e.className,
            r = nd(e, ["children", "className"]),
            a = r7().size,
            i = nh(ae[a], an[a], n);
        return P().createElement("div", er({
            className: i
        }, r), t)
    };
    au.displayName = "DialogFooter";
    var as = function(e) {
            var t = e.width,
                n = e.height;
            return P().createElement("svg", {
                className: "foundation-web-loading-spinner",
                width: t,
                height: n,
                viewBox: "0 0 20 20",
                fill: "none",
                xmlns: "http://www.w3.org/2000/svg"
            }, P().createElement("path", {
                fillRule: "evenodd",
                clipRule: "evenodd",
                fill: "currentColor",
                d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
            }))
        },
        al = Symbol.for("react.lazy"),
        ac = C[" use ".trim().toString()];

    function ad(e) {
        var t;
        return null != e && (void 0 === e ? "undefined" : eD(e)) === "object" && "$$typeof" in e && e.$$typeof === al && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : eD(t)) === "object" && null !== t && "then" in t
    }
    var ah = ((e = C.forwardRef(function(e, t) {
            var n = e.children,
                r = nd(e, ["children"]);
            if (ad(n) && "function" == typeof ac && (n = ac(n._payload)), C.isValidElement(n)) {
                var a, i, o, u, s, l = (s = (u = null == (i = Object.getOwnPropertyDescriptor((a = n).props, "ref")) ? void 0 : i.get) && "isReactWarning" in u && u.isReactWarning) ? a.ref : (s = (u = null == (o = Object.getOwnPropertyDescriptor(a, "ref")) ? void 0 : o.get) && "isReactWarning" in u && u.isReactWarning) ? a.props.ref : a.props.ref || a.ref,
                    c = function(e, t) {
                        var n = er({}, t);
                        for (var r in t) ! function(r) {
                            var a = e[r],
                                i = t[r];
                            /^on[A-Z]/.test(r) ? a && i ? n[r] = function() {
                                for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                var r = i.apply(void 0, q(t));
                                return a.apply(void 0, q(t)), r
                            } : a && (n[r] = a) : "style" === r ? n[r] = er({}, a, i) : "className" === r && (n[r] = [a, i].filter(Boolean).join(" "))
                        }(r);
                        return er({}, e, n)
                    }(r, n.props);
                return n.type !== C.Fragment && (c.ref = t ? nC(t, l) : l), C.cloneElement(n, c)
            }
            return C.Children.count(n) > 1 ? C.Children.only(null) : null
        })).displayName = "".concat("Slot", ".SlotClone"), c = e, (d = C.forwardRef(function(e, t) {
            var n = e.children,
                r = nd(e, ["children"]);
            ad(n) && "function" == typeof ac && (n = ac(n._payload));
            var a = C.Children.toArray(n),
                i = a.find(am);
            if (i) {
                var o = i.props.children,
                    u = a.map(function(e) {
                        return e !== i ? e : C.Children.count(o) > 1 ? C.Children.only(null) : C.isValidElement(o) ? o.props.children : null
                    });
                return (0, na.jsx)(c, eg(er({}, r), {
                    ref: t,
                    children: C.isValidElement(o) ? C.cloneElement(o, void 0, u) : null
                }))
            }
            return (0, na.jsx)(c, eg(er({}, r), {
                ref: t,
                children: n
            }))
        })).displayName = "".concat("Slot", ".Slot"), d),
        af = Symbol("radix.slottable");

    function am(e) {
        return C.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === af
    }
    var ap = {
            Large: 24,
            Medium: 20,
            Small: 16,
            XSmall: 12
        },
        aE = {
            Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
            Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
            Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
            XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
        },
        av = {
            Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
            Standard: ["bg-action-standard", "content-action-standard"],
            SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
            Utility: ["bg-action-subtle", "content-action-standard"],
            Link: ["bg-action-link", "content-system-emphasis"],
            Alert: ["bg-action-alert", "content-action-alert"],
            ActionUtility: ["bg-action-subtle", "content-action-standard"]
        },
        ag = {
            Emphasis: ["bg-action-standard", "content-action-standard"],
            Standard: ["bg-action-standard", "content-action-standard"],
            SoftEmphasis: ["bg-action-standard", "content-action-standard"],
            Utility: ["bg-action-subtle", "content-action-standard"],
            Link: ["bg-action-link", "content-system-emphasis"],
            Alert: ["bg-action-standard", "content-action-standard"],
            ActionUtility: ["bg-action-subtle", "content-action-standard"]
        },
        ab = (0, C.forwardRef)(function(e, t) {
            var n = np([e, t]),
                r = n[0],
                a = n.slice(1),
                i = r.children,
                o = r.className,
                u = r.style,
                s = r.isDisabled,
                l = void 0 !== s && s,
                c = r.isLoading,
                d = void 0 !== c && c,
                h = r.icon,
                f = r.size,
                m = void 0 === f ? "Large" : f,
                p = r.variant,
                E = void 0 === p ? "Emphasis" : p,
                v = r.asChild,
                g = nd(r, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                b = K(a, 1)[0],
                y = nh("foundation-web-button", l ? "opacity-[0.5]" : [nf, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", aE[m], l ? ag[E] : av[E], o),
                _ = er({
                    textDecoration: "none"
                }, u),
                A = function(e) {
                    return P().createElement(P().Fragment, null, P().createElement(nm, null), d && P().createElement("div", {
                        "aria-hidden": "true",
                        className: "absolute flex"
                    }, P().createElement(as, {
                        width: ap[m],
                        height: ap[m]
                    })), P().createElement("span", {
                        className: nh("flex items-center min-width-0", "Large" === m || "Medium" === m ? "gap-small" : "gap-xsmall", d && "invisible")
                    }, h && P().createElement(nv, {
                        name: h,
                        size: m
                    }), P().createElement("span", {
                        className: "padding-y-xsmall text-truncate-end text-no-wrap"
                    }, e)))
                };
            if (v) {
                g.as;
                var C = nd(g, ["as"]),
                    T = P().Children.only(i);
                return P().createElement(ah, eg(er({
                    ref: b
                }, C), {
                    className: y,
                    style: _,
                    "aria-disabled": l || void 0
                }), P().cloneElement(T, {}, A(T.props.children)))
            }
            if ("a" === g.as) {
                g.as;
                var S = g.href,
                    x = nd(g, ["as", "href"]);
                return P().createElement("a", eg(er({
                    ref: b
                }, x), {
                    "aria-disabled": l,
                    href: l ? void 0 : S,
                    className: y,
                    style: _
                }), A(i))
            }
            g.as;
            var R = nd(g, ["as"]);
            return P().createElement("button", eg(er({
                ref: b,
                type: "button"
            }, R), {
                disabled: l,
                className: y,
                style: _
            }), A(i))
        });

    function ay(e) {
        return (ay = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
            return e.__proto__ || Object.getPrototypeOf(e)
        })(e)
    }

    function a_() {
        try {
            var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
        } catch (e) {}
        return (a_ = function() {
            return !!e
        })()
    }

    function aA(e, t, n) {
        t = ay(t);
        var r = a_() ? Reflect.construct(t, n || [], ay(e).constructor) : t.apply(e, n);
        if (r && ("object" === eD(r) || "function" == typeof r)) return r;
        if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
        return e
    }

    function aC(e, t) {
        return (aC = Object.setPrototypeOf || function(e, t) {
            return e.__proto__ = t, e
        })(e, t)
    }

    function aP(e, t, n) {
        return (aP = a_() ? Reflect.construct : function(e, t, n) {
            var r = [null];
            r.push.apply(r, t);
            var a = new(Function.bind.apply(e, r));
            return n && aC(a, n.prototype), a
        }).apply(null, arguments)
    }

    function aT(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");
        e.prototype = Object.create(t && t.prototype, {
            constructor: {
                value: e,
                writable: !0,
                configurable: !0
            }
        }), t && aC(e, t)
    }

    function aS(e) {
        var t = "function" == typeof Map ? new Map : void 0;
        return (aS = function(e) {
            if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
            if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
            if (void 0 !== t) {
                if (t.has(e)) return t.get(e);
                t.set(e, n)
            }

            function n() {
                return aP(e, arguments, ay(this).constructor)
            }
            return n.prototype = Object.create(e.prototype, {
                constructor: {
                    value: n,
                    enumerable: !1,
                    writable: !0,
                    configurable: !0
                }
            }), aC(n, e)
        })(e)
    }

    function ax(e, t) {
        var n = t && t.cache ? t.cache : aw,
            r = t && t.serializer ? t.serializer : aI;
        return (t && t.strategy ? t.strategy : function(e, t) {
            var n, r, a = 1 === e.length ? aR : aB;
            return n = t.cache.create(), r = t.serializer, a.bind(this, e, n, r)
        })(e, {
            cache: n,
            serializer: r
        })
    }

    function aR(e, t, n, r) {
        var a = null == r || "number" == typeof r || "boolean" == typeof r ? r : n(r),
            i = t.get(a);
        return void 0 === i && (i = e.call(this, r), t.set(a, i)), i
    }

    function aB(e, t, n) {
        var r = Array.prototype.slice.call(arguments, 3),
            a = n(r),
            i = t.get(a);
        return void 0 === i && (i = e.apply(this, r), t.set(a, i)), i
    }
    var aI = function() {
            return JSON.stringify(arguments)
        },
        aN = function() {
            function e() {
                D(this, e), this.cache = Object.create(null)
            }
            return F(e, [{
                key: "get",
                value: function(e) {
                    return this.cache[e]
                }
            }, {
                key: "set",
                value: function(e, t) {
                    this.cache[e] = t
                }
            }]), e
        }(),
        aw = {
            create: function() {
                return new aN
            }
        },
        aU = {
            variadic: function(e, t) {
                var n, r;
                return n = t.cache.create(), r = t.serializer, aB.bind(this, e, n, r)
            },
            monadic: function(e, t) {
                var n, r;
                return n = t.cache.create(), r = t.serializer, aR.bind(this, e, n, r)
            }
        },
        aD = function(e) {
            function t(e, n) {
                D(this, t);
                var r, a = e;
                return n && (a += ": " + n), (r = aA(this, t, [a])).code = e, n && (r.originalMessage = n), r
            }
            return aT(t, e), t
        }(aS(Error)),
        aO = ((h = aO || {}).MISSING_MESSAGE = "MISSING_MESSAGE", h.MISSING_FORMAT = "MISSING_FORMAT", h.ENVIRONMENT_FALLBACK = "ENVIRONMENT_FALLBACK", h.INSUFFICIENT_PATH = "INSUFFICIENT_PATH", h.INVALID_MESSAGE = "INVALID_MESSAGE", h.INVALID_KEY = "INVALID_KEY", h.FORMATTING_ERROR = "FORMATTING_ERROR", h);

    function aF(e, t) {
        return ax(e, {
            cache: {
                create: function() {
                    return {
                        get: function(e) {
                            return t[e]
                        },
                        set: function(e, n) {
                            t[e] = n
                        }
                    }
                }
            },
            strategy: aU.variadic
        })
    }

    function aM(e, t) {
        return aF(function() {
            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
            return aP(e, q(n))
        }, t)
    }

    function aL() {
        return (aL = Object.assign || function(e) {
            for (var t = 1; t < arguments.length; t++) {
                var n = arguments[t];
                for (var r in n) Object.prototype.hasOwnProperty.call(n, r) && (e[r] = n[r])
            }
            return e
        }).apply(this, arguments)
    }
    var ak = /(?:[Eec]{1,6}|G{1,5}|[Qq]{1,5}|(?:[yYur]+|U{1,5})|[ML]{1,5}|d{1,2}|D{1,3}|F{1}|[abB]{1,5}|[hkHK]{1,2}|w{1,2}|W{1}|m{1,2}|s{1,2}|[zZOvVxX]{1,4})(?=([^']*'[^']*')*[^']*$)/g,
        aH = /[\t-\r \x85\u200E\u200F\u2028\u2029]/i,
        aG = /^\.(?:(0+)(\*)?|(#+)|(0+)(#+))$/g,
        aj = /^(@+)?(\+|#+)?[rs]?$/g,
        aW = /(\*)(0+)|(#+)(0+)|(0+)/g,
        aV = /^(0+)$/;

    function aX(e) {
        var t = {};
        return "r" === e[e.length - 1] ? t.roundingPriority = "morePrecision" : "s" === e[e.length - 1] && (t.roundingPriority = "lessPrecision"), e.replace(aj, function(e, n, r) {
            return "string" != typeof r ? (t.minimumSignificantDigits = n.length, t.maximumSignificantDigits = n.length) : "+" === r ? t.minimumSignificantDigits = n.length : "#" === n[0] ? t.maximumSignificantDigits = n.length : (t.minimumSignificantDigits = n.length, t.maximumSignificantDigits = n.length + ("string" == typeof r ? r.length : 0)), ""
        }), t
    }

    function az(e) {
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

    function aK(e) {
        var t = az(e);
        return t || {}
    }
    var aY = ((f = {})[f.EXPECT_ARGUMENT_CLOSING_BRACE = 1] = "EXPECT_ARGUMENT_CLOSING_BRACE", f[f.EMPTY_ARGUMENT = 2] = "EMPTY_ARGUMENT", f[f.MALFORMED_ARGUMENT = 3] = "MALFORMED_ARGUMENT", f[f.EXPECT_ARGUMENT_TYPE = 4] = "EXPECT_ARGUMENT_TYPE", f[f.INVALID_ARGUMENT_TYPE = 5] = "INVALID_ARGUMENT_TYPE", f[f.EXPECT_ARGUMENT_STYLE = 6] = "EXPECT_ARGUMENT_STYLE", f[f.INVALID_NUMBER_SKELETON = 7] = "INVALID_NUMBER_SKELETON", f[f.INVALID_DATE_TIME_SKELETON = 8] = "INVALID_DATE_TIME_SKELETON", f[f.EXPECT_NUMBER_SKELETON = 9] = "EXPECT_NUMBER_SKELETON", f[f.EXPECT_DATE_TIME_SKELETON = 10] = "EXPECT_DATE_TIME_SKELETON", f[f.UNCLOSED_QUOTE_IN_ARGUMENT_STYLE = 11] = "UNCLOSED_QUOTE_IN_ARGUMENT_STYLE", f[f.EXPECT_SELECT_ARGUMENT_OPTIONS = 12] = "EXPECT_SELECT_ARGUMENT_OPTIONS", f[f.EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE = 13] = "EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE", f[f.INVALID_PLURAL_ARGUMENT_OFFSET_VALUE = 14] = "INVALID_PLURAL_ARGUMENT_OFFSET_VALUE", f[f.EXPECT_SELECT_ARGUMENT_SELECTOR = 15] = "EXPECT_SELECT_ARGUMENT_SELECTOR", f[f.EXPECT_PLURAL_ARGUMENT_SELECTOR = 16] = "EXPECT_PLURAL_ARGUMENT_SELECTOR", f[f.EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT = 17] = "EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT", f[f.EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT = 18] = "EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT", f[f.INVALID_PLURAL_ARGUMENT_SELECTOR = 19] = "INVALID_PLURAL_ARGUMENT_SELECTOR", f[f.DUPLICATE_PLURAL_ARGUMENT_SELECTOR = 20] = "DUPLICATE_PLURAL_ARGUMENT_SELECTOR", f[f.DUPLICATE_SELECT_ARGUMENT_SELECTOR = 21] = "DUPLICATE_SELECT_ARGUMENT_SELECTOR", f[f.MISSING_OTHER_CLAUSE = 22] = "MISSING_OTHER_CLAUSE", f[f.INVALID_TAG = 23] = "INVALID_TAG", f[f.INVALID_TAG_NAME = 25] = "INVALID_TAG_NAME", f[f.UNMATCHED_CLOSING_TAG = 26] = "UNMATCHED_CLOSING_TAG", f[f.UNCLOSED_TAG = 27] = "UNCLOSED_TAG", f);

    function aq(e) {
        return !!(e && (void 0 === e ? "undefined" : eD(e)) === "object" && 0 === e.type)
    }

    function aZ(e) {
        return !!(e && (void 0 === e ? "undefined" : eD(e)) === "object" && 1 === e.type)
    }
    var aQ = /[ \xA0\u1680\u2000-\u200A\u202F\u205F\u3000]/,
        aJ = {
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
        a$ = new RegExp("^".concat(aQ.source, "*")),
        a0 = new RegExp("".concat(aQ.source, "*$"));

    function a1(e, t) {
        return {
            start: e,
            end: t
        }
    }
    var a2 = !!Object.fromEntries,
        a3 = !!String.prototype.trimStart,
        a5 = !!String.prototype.trimEnd,
        a6 = a2 ? Object.fromEntries : function(e) {
            var t = {},
                n = !0,
                r = !1,
                a = void 0;
            try {
                for (var i, o = e[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) {
                    var u = K(i.value, 2),
                        s = u[0],
                        l = u[1];
                    t[s] = l
                }
            } catch (e) {
                r = !0, a = e
            } finally {
                try {
                    n || null == o.return || o.return()
                } finally {
                    if (r) throw a
                }
            }
            return t
        },
        a4 = a3 ? function(e) {
            return e.trimStart()
        } : function(e) {
            return e.replace(a$, "")
        },
        a8 = a5 ? function(e) {
            return e.trimEnd()
        } : function(e) {
            return e.replace(a0, "")
        },
        a9 = RegExp("([^\\u0009-\\u000D\\u0020\\u0085\\u00A0\\u1680\\u2000-\\u200A\\u2028-\\u2029\\u202F\\u205F\\u3000\\u0021-\\u002F\\u003A-\\u0040\\u005B-\\u005E\\u0060\\u007B-\\u007E\\u00A1-\\u00A7\\u00A9\\u00AB-\\u00AC\\u00AE\\u00B0-\\u00B1\\u00B6\\u00BB\\u00BF\\u00D7\\u00F7\\u2010-\\u2027\\u2030-\\u203E\\u2041-\\u2053\\u2055-\\u205E\\u2190-\\u245F\\u2500-\\u2775\\u2794-\\u2BFF\\u2E00-\\u2E7F\\u3001-\\u3003\\u3008-\\u3020\\u3030\\uFD3E-\\uFD3F\\uFE45-\\uFE46]*)", "yu"),
        a7 = function() {
            function e(t) {
                var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                D(this, e), this.message = t, this.position = {
                    offset: 0,
                    line: 1,
                    column: 1
                }, this.ignoreTag = !!n.ignoreTag, this.locale = n.locale, this.requiresOtherClause = !!n.requiresOtherClause, this.shouldParseSkeletons = !!n.shouldParseSkeletons
            }
            return F(e, [{
                key: "parse",
                value: function() {
                    if (0 !== this.offset()) throw Error("parser can only be used once");
                    if (this.message.length > 0) {
                        var e = this.message.charCodeAt(0);
                        if (35 !== e && 39 !== e && 60 !== e && 123 !== e && 125 !== e) {
                            var t = function(e) {
                                if (0 === e.length) return null;
                                for (var t = 1, n = 1, r = 0; r < e.length;) {
                                    var a = e.charCodeAt(r);
                                    switch (a) {
                                        case 35:
                                        case 39:
                                        case 60:
                                        case 123:
                                        case 125:
                                            return null
                                    }
                                    if (10 === a) t++, n = 1, r++;
                                    else if (n++, a >= 55296 && a <= 56319 && r + 1 < e.length) {
                                        var i = e.charCodeAt(r + 1);
                                        r += i >= 56320 && i <= 57343 ? 2 : 1
                                    } else r++
                                }
                                return {
                                    offset: e.length,
                                    line: t,
                                    column: n
                                }
                            }(this.message);
                            if (t) {
                                var n = this.clonePosition();
                                return this.position = t, {
                                    val: [{
                                        type: 0,
                                        value: this.message,
                                        location: a1(n, this.clonePosition())
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
                value: function(e, t, n) {
                    for (var r = []; !this.isEOF();) {
                        var a = this.char();
                        if (123 === a) {
                            var i = this.parseArgument(e, n);
                            if (i.err) return i;
                            r.push(i.val)
                        } else if (125 === a && e > 0) break;
                        else if (35 === a && ("plural" === t || "selectordinal" === t)) {
                            var o = this.clonePosition();
                            this.bump(), r.push({
                                type: 7,
                                location: a1(o, this.clonePosition())
                            })
                        } else if (60 !== a || this.ignoreTag || 47 !== this.peek())
                            if (60 === a && !this.ignoreTag && ie(this.peek() || 0)) {
                                var u = this.parseTag(e, t);
                                if (u.err) return u;
                                r.push(u.val)
                            } else {
                                var s = this.parseLiteral(e, t);
                                if (s.err) return s;
                                r.push(s.val)
                            }
                        else if (!n) return this.error(26, a1(this.clonePosition(), this.clonePosition()));
                        else break
                    }
                    return {
                        val: r,
                        err: null
                    }
                }
            }, {
                key: "parseTag",
                value: function(e, t) {
                    var n = this.clonePosition();
                    this.bump();
                    var r = this.parseTagName();
                    if (this.bumpSpace(), this.bumpIf("/>")) return {
                        val: {
                            type: 0,
                            value: "<".concat(r, "/>"),
                            location: a1(n, this.clonePosition())
                        },
                        err: null
                    };
                    if (!this.bumpIf(">")) return this.error(23, a1(n, this.clonePosition()));
                    var a = this.parseMessage(e + 1, t, !0);
                    if (a.err) return a;
                    var i = a.val,
                        o = this.clonePosition();
                    if (!this.bumpIf("</")) return this.error(27, a1(n, this.clonePosition()));
                    if (this.isEOF() || !ie(this.char())) return this.error(23, a1(o, this.clonePosition()));
                    var u = this.clonePosition();
                    return r !== this.parseTagName() ? this.error(26, a1(u, this.clonePosition())) : (this.bumpSpace(), this.bumpIf(">")) ? {
                        val: {
                            type: 8,
                            value: r,
                            children: i,
                            location: a1(n, this.clonePosition())
                        },
                        err: null
                    } : this.error(23, a1(o, this.clonePosition()))
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
                    for (var n = this.clonePosition(), r = "";;) {
                        var a = this.tryParseQuote(t);
                        if (a) {
                            r += a;
                            continue
                        }
                        var i = this.tryParseUnquoted(e, t);
                        if (i) {
                            r += i;
                            continue
                        }
                        var o = this.tryParseLeftAngleBracket();
                        if (o) {
                            r += o;
                            continue
                        }
                        break
                    }
                    return {
                        val: {
                            type: 0,
                            value: r,
                            location: a1(n, this.clonePosition())
                        },
                        err: null
                    }
                }
            }, {
                key: "tryParseLeftAngleBracket",
                value: function() {
                    var e;
                    return this.isEOF() || 60 !== this.char() || !this.ignoreTag && (ie(e = this.peek() || 0) || 47 === e) ? null : (this.bump(), "<")
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
                    var t, n = [this.char()];
                    for (this.bump(); !this.isEOF();) {
                        var r = this.char();
                        if (39 === r)
                            if (39 === this.peek()) n.push(39), this.bump();
                            else {
                                this.bump();
                                break
                            }
                        else n.push(r);
                        this.bump()
                    }
                    return (t = String).fromCodePoint.apply(t, q(n))
                }
            }, {
                key: "tryParseUnquoted",
                value: function(e, t) {
                    if (this.isEOF()) return null;
                    var n = this.char();
                    return 60 === n || 123 === n || 35 === n && ("plural" === t || "selectordinal" === t) || 125 === n && e > 0 ? null : (this.bump(), String.fromCodePoint(n))
                }
            }, {
                key: "parseArgument",
                value: function(e, t) {
                    var n = this.clonePosition();
                    if (this.bump(), this.bumpSpace(), this.isEOF()) return this.error(1, a1(n, this.clonePosition()));
                    if (125 === this.char()) return this.bump(), this.error(2, a1(n, this.clonePosition()));
                    var r = this.parseIdentifierIfPossible().value;
                    if (!r) return this.error(3, a1(n, this.clonePosition()));
                    if (this.bumpSpace(), this.isEOF()) return this.error(1, a1(n, this.clonePosition()));
                    switch (this.char()) {
                        case 125:
                            return this.bump(), {
                                val: {
                                    type: 1,
                                    value: r,
                                    location: a1(n, this.clonePosition())
                                },
                                err: null
                            };
                        case 44:
                            if (this.bump(), this.bumpSpace(), this.isEOF()) return this.error(1, a1(n, this.clonePosition()));
                            return this.parseArgumentOptions(e, t, r, n);
                        default:
                            return this.error(3, a1(n, this.clonePosition()))
                    }
                }
            }, {
                key: "parseIdentifierIfPossible",
                value: function() {
                    var e, t, n = this.clonePosition(),
                        r = this.offset(),
                        a = (e = this.message, a9.lastIndex = r, null != (t = a9.exec(e)[1]) ? t : ""),
                        i = r + a.length;
                    return this.bumpTo(i), {
                        value: a,
                        location: a1(n, this.clonePosition())
                    }
                }
            }, {
                key: "parseArgumentOptions",
                value: function(e, t, n, r) {
                    var a = this.clonePosition(),
                        i = this.parseIdentifierIfPossible().value,
                        o = this.clonePosition();
                    switch (i) {
                        case "":
                            return this.error(4, a1(a, o));
                        case "number":
                        case "date":
                        case "time":
                            this.bumpSpace();
                            var u, s = null;
                            if (this.bumpIf(",")) {
                                this.bumpSpace();
                                var l = this.clonePosition(),
                                    c = this.parseSimpleArgStyleIfPossible();
                                if (c.err) return c;
                                var d = a8(c.val);
                                if (0 === d.length) return this.error(6, a1(this.clonePosition(), this.clonePosition()));
                                s = {
                                    style: d,
                                    styleLocation: a1(l, this.clonePosition())
                                }
                            }
                            var h = this.tryParseArgumentClose(r);
                            if (h.err) return h;
                            var f = a1(r, this.clonePosition());
                            if (s && s.style.startsWith("::")) {
                                var m = a4(s.style.slice(2));
                                if ("number" === i) {
                                    var p = this.parseNumberSkeletonFromString(m, s.styleLocation);
                                    if (p.err) return p;
                                    return {
                                        val: {
                                            type: 2,
                                            value: n,
                                            location: f,
                                            style: p.val
                                        },
                                        err: null
                                    }
                                }
                                if (0 === m.length) return this.error(10, f);
                                var E, v = m;
                                return this.locale && (v = function(e, t) {
                                    for (var n = "", r = 0; r < e.length; r++) {
                                        var a = e.charAt(r);
                                        if ("j" === a) {
                                            for (var i = 0; r + 1 < e.length && e.charAt(r + 1) === a;) i++, r++;
                                            var o = 1 + (1 & i),
                                                u = i < 2 ? 1 : 3 + (i >> 1),
                                                s = function(e) {
                                                    var t, n = e.hourCycle;
                                                    if (void 0 === n && e.hourCycles && e.hourCycles.length && (n = e.hourCycles[0]), n) switch (n) {
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
                                                    var r = e.language;
                                                    return "root" !== r && (t = e.maximize().region), (aJ[t || ""] || aJ[r || ""] || aJ["".concat(r, "-001")] || aJ["001"])[0]
                                                }(t);
                                            for (("H" == s || "k" == s) && (u = 0); u-- > 0;) n += "a";
                                            for (; o-- > 0;) n = s + n
                                        } else "J" === a ? n += "H" : n += a
                                    }
                                    return n
                                }(m, this.locale)), {
                                    val: {
                                        type: "date" === i ? 3 : 4,
                                        value: n,
                                        location: f,
                                        style: {
                                            type: 1,
                                            pattern: v,
                                            location: s.styleLocation,
                                            parsedOptions: this.shouldParseSkeletons ? (E = {}, v.replace(ak, function(e) {
                                                var t = e.length;
                                                switch (e[0]) {
                                                    case "G":
                                                        E.era = 4 === t ? "long" : 5 === t ? "narrow" : "short";
                                                        break;
                                                    case "y":
                                                        E.year = 2 === t ? "2-digit" : "numeric";
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
                                                        E.month = ["numeric", "2-digit", "short", "long", "narrow"][t - 1];
                                                        break;
                                                    case "w":
                                                    case "W":
                                                        throw RangeError("`w/W` (week) patterns are not supported");
                                                    case "d":
                                                        E.day = ["numeric", "2-digit"][t - 1];
                                                        break;
                                                    case "D":
                                                    case "F":
                                                    case "g":
                                                        throw RangeError("`D/F/g` (day) patterns are not supported, use `d` instead");
                                                    case "E":
                                                        E.weekday = 4 === t ? "long" : 5 === t ? "narrow" : "short";
                                                        break;
                                                    case "e":
                                                        if (t < 4) throw RangeError("`e..eee` (weekday) patterns are not supported");
                                                        E.weekday = ["short", "long", "narrow", "short"][t - 4];
                                                        break;
                                                    case "c":
                                                        if (t < 4) throw RangeError("`c..ccc` (weekday) patterns are not supported");
                                                        E.weekday = ["short", "long", "narrow", "short"][t - 4];
                                                        break;
                                                    case "a":
                                                        E.hour12 = !0;
                                                        break;
                                                    case "b":
                                                    case "B":
                                                        throw RangeError("`b/B` (period) patterns are not supported, use `a` instead");
                                                    case "h":
                                                        E.hourCycle = "h12", E.hour = ["numeric", "2-digit"][t - 1];
                                                        break;
                                                    case "H":
                                                        E.hourCycle = "h23", E.hour = ["numeric", "2-digit"][t - 1];
                                                        break;
                                                    case "K":
                                                        E.hourCycle = "h11", E.hour = ["numeric", "2-digit"][t - 1];
                                                        break;
                                                    case "k":
                                                        E.hourCycle = "h24", E.hour = ["numeric", "2-digit"][t - 1];
                                                        break;
                                                    case "j":
                                                    case "J":
                                                    case "C":
                                                        throw RangeError("`j/J/C` (hour) patterns are not supported, use `h/H/K/k` instead");
                                                    case "m":
                                                        E.minute = ["numeric", "2-digit"][t - 1];
                                                        break;
                                                    case "s":
                                                        E.second = ["numeric", "2-digit"][t - 1];
                                                        break;
                                                    case "S":
                                                    case "A":
                                                        throw RangeError("`S/A` (second) patterns are not supported, use `s` instead");
                                                    case "z":
                                                        E.timeZoneName = t < 4 ? "short" : "long";
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
                                            }), E) : {}
                                        }
                                    },
                                    err: null
                                }
                            }
                            return {
                                val: {
                                    type: "number" === i ? 2 : "date" === i ? 3 : 4,
                                    value: n,
                                    location: f,
                                    style: null != (u = null == s ? void 0 : s.style) ? u : null
                                }, err: null
                            };
                        case "plural":
                        case "selectordinal":
                        case "select":
                            var g = this.clonePosition();
                            if (this.bumpSpace(), !this.bumpIf(",")) return this.error(12, a1(g, er({}, g)));
                            this.bumpSpace();
                            var b = this.parseIdentifierIfPossible(),
                                y = 0;
                            if ("select" !== i && "offset" === b.value) {
                                if (!this.bumpIf(":")) return this.error(13, a1(this.clonePosition(), this.clonePosition()));
                                this.bumpSpace();
                                var _ = this.tryParseDecimalInteger(13, 14);
                                if (_.err) return _;
                                this.bumpSpace(), b = this.parseIdentifierIfPossible(), y = _.val
                            }
                            var A = this.tryParsePluralOrSelectOptions(e, i, t, b);
                            if (A.err) return A;
                            var C = this.tryParseArgumentClose(r);
                            if (C.err) return C;
                            var P = a1(r, this.clonePosition());
                            if ("select" === i) return {
                                val: {
                                    type: 5,
                                    value: n,
                                    options: a6(A.val),
                                    location: P
                                },
                                err: null
                            };
                            return {
                                val: {
                                    type: 6,
                                    value: n,
                                    options: a6(A.val),
                                    offset: y,
                                    pluralType: "plural" === i ? "cardinal" : "ordinal",
                                    location: P
                                }, err: null
                            };
                        default:
                            return this.error(5, a1(a, o))
                    }
                }
            }, {
                key: "tryParseArgumentClose",
                value: function(e) {
                    return this.isEOF() || 125 !== this.char() ? this.error(1, a1(e, this.clonePosition())) : (this.bump(), {
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
                            var n = this.clonePosition();
                            if (!this.bumpUntil("'")) return this.error(11, a1(n, this.clonePosition()));
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
                    var n = [];
                    try {
                        n = function(e) {
                            if (0 === e.length) throw Error("Number skeleton cannot be empty");
                            var t = e.split(aH).filter(function(e) {
                                    return e.length > 0
                                }),
                                n = [],
                                r = !0,
                                a = !1,
                                i = void 0;
                            try {
                                for (var o, u = t[Symbol.iterator](); !(r = (o = u.next()).done); r = !0) {
                                    var s = o.value.split("/");
                                    if (0 === s.length) throw Error("Invalid number skeleton");
                                    var l = np(s),
                                        c = l[0],
                                        d = l.slice(1),
                                        h = !0,
                                        f = !1,
                                        m = void 0;
                                    try {
                                        for (var p, E = d[Symbol.iterator](); !(h = (p = E.next()).done); h = !0) {
                                            var v = p.value;
                                            if (0 === v.length) throw Error("Invalid number skeleton")
                                        }
                                    } catch (e) {
                                        f = !0, m = e
                                    } finally {
                                        try {
                                            h || null == E.return || E.return()
                                        } finally {
                                            if (f) throw m
                                        }
                                    }
                                    n.push({
                                        stem: c,
                                        options: d
                                    })
                                }
                            } catch (e) {
                                a = !0, i = e
                            } finally {
                                try {
                                    r || null == u.return || u.return()
                                } finally {
                                    if (a) throw i
                                }
                            }
                            return n
                        }(e)
                    } catch (e) {
                        return this.error(7, t)
                    }
                    return {
                        val: {
                            type: 0,
                            tokens: n,
                            location: t,
                            parsedOptions: this.shouldParseSkeletons ? function(e) {
                                var t = {},
                                    n = !0,
                                    r = !1,
                                    a = void 0;
                                try {
                                    for (var i, o = e[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) {
                                        var u = i.value;
                                        switch (u.stem) {
                                            case "percent":
                                            case "%":
                                                t.style = "percent";
                                                continue;
                                            case "%x100":
                                                t.style = "percent", t.scale = 100;
                                                continue;
                                            case "currency":
                                                t.style = "currency", t.currency = u.options[0];
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
                                                t.style = "unit", t.unit = u.options[0].replace(/^(.*?)-/, "");
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
                                                t = er(eg(er({}, t), {
                                                    notation: "scientific"
                                                }), u.options.reduce(function(e, t) {
                                                    return er({}, e, aK(t))
                                                }, {}));
                                                continue;
                                            case "engineering":
                                                t = er(eg(er({}, t), {
                                                    notation: "engineering"
                                                }), u.options.reduce(function(e, t) {
                                                    return er({}, e, aK(t))
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
                                                t.scale = parseFloat(u.options[0]);
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
                                                if (u.options.length > 1) throw RangeError("integer-width stems only accept a single optional option");
                                                u.options[0].replace(aW, function(e, n, r, a, i, o) {
                                                    if (n) t.minimumIntegerDigits = r.length;
                                                    else if (a && i) throw Error("We currently do not support maximum integer digits");
                                                    else if (o) throw Error("We currently do not support exact integer digits");
                                                    return ""
                                                });
                                                continue
                                        }
                                        if (aV.test(u.stem)) {
                                            t.minimumIntegerDigits = u.stem.length;
                                            continue
                                        }
                                        if (aG.test(u.stem)) {
                                            if (u.options.length > 1) throw RangeError("Fraction-precision stems only accept a single optional option");
                                            u.stem.replace(aG, function(e, n, r, a, i, o) {
                                                return "*" === r ? t.minimumFractionDigits = n.length : a && "#" === a[0] ? t.maximumFractionDigits = a.length : i && o ? (t.minimumFractionDigits = i.length, t.maximumFractionDigits = i.length + o.length) : (t.minimumFractionDigits = n.length, t.maximumFractionDigits = n.length), ""
                                            });
                                            var s = u.options[0];
                                            "w" === s ? t = eg(er({}, t), {
                                                trailingZeroDisplay: "stripIfInteger"
                                            }) : s && (t = er({}, t, aX(s)));
                                            continue
                                        }
                                        if (aj.test(u.stem)) {
                                            t = er({}, t, aX(u.stem));
                                            continue
                                        }
                                        var l = az(u.stem);
                                        l && (t = er({}, t, l));
                                        var c = function(e) {
                                            var t;
                                            if ("E" === e[0] && "E" === e[1] ? (t = {
                                                    notation: "engineering"
                                                }, e = e.slice(2)) : "E" === e[0] && (t = {
                                                    notation: "scientific"
                                                }, e = e.slice(1)), t) {
                                                var n = e.slice(0, 2);
                                                if ("+!" === n ? (t.signDisplay = "always", e = e.slice(2)) : "+?" === n && (t.signDisplay = "exceptZero", e = e.slice(2)), !aV.test(e)) throw Error("Malformed concise eng/scientific notation");
                                                t.minimumIntegerDigits = e.length
                                            }
                                            return t
                                        }(u.stem);
                                        c && (t = er({}, t, c))
                                    }
                                } catch (e) {
                                    r = !0, a = e
                                } finally {
                                    try {
                                        n || null == o.return || o.return()
                                    } finally {
                                        if (r) throw a
                                    }
                                }
                                return t
                            }(n) : {}
                        },
                        err: null
                    }
                }
            }, {
                key: "tryParsePluralOrSelectOptions",
                value: function(e, t, n, r) {
                    for (var a = !1, i = [], o = new Set, u = r.value, s = r.location;;) {
                        if (0 === u.length) {
                            var l, c = this.clonePosition();
                            if ("select" !== t && this.bumpIf("=")) {
                                var d = this.tryParseDecimalInteger(16, 19);
                                if (d.err) return d;
                                s = a1(c, this.clonePosition()), u = this.message.slice(c.offset, this.offset())
                            } else break
                        }
                        if (o.has(u)) return this.error("select" === t ? 21 : 20, s);
                        "other" === u && (a = !0), this.bumpSpace();
                        var h = this.clonePosition();
                        if (!this.bumpIf("{")) return this.error("select" === t ? 17 : 18, a1(this.clonePosition(), this.clonePosition()));
                        var f = this.parseMessage(e + 1, t, n);
                        if (f.err) return f;
                        var m = this.tryParseArgumentClose(h);
                        if (m.err) return m;
                        i.push([u, {
                            value: f.val,
                            location: a1(h, this.clonePosition())
                        }]), o.add(u), this.bumpSpace(), u = (l = this.parseIdentifierIfPossible()).value, s = l.location
                    }
                    return 0 === i.length ? this.error("select" === t ? 15 : 16, a1(this.clonePosition(), this.clonePosition())) : this.requiresOtherClause && !a ? this.error(22, a1(this.clonePosition(), this.clonePosition())) : {
                        val: i,
                        err: null
                    }
                }
            }, {
                key: "tryParseDecimalInteger",
                value: function(e, t) {
                    var n = 1,
                        r = this.clonePosition();
                    this.bumpIf("+") || this.bumpIf("-") && (n = -1);
                    for (var a = !1, i = 0; !this.isEOF();) {
                        var o = this.char();
                        if (o >= 48 && o <= 57) a = !0, i = 10 * i + (o - 48), this.bump();
                        else break
                    }
                    var u = a1(r, this.clonePosition());
                    return a ? Number.isSafeInteger(i *= n) ? {
                        val: i,
                        err: null
                    } : this.error(t, u) : this.error(e, u)
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
                        n = this.message.indexOf(e, t);
                    return n >= 0 ? (this.bumpTo(n), !0) : (this.bumpTo(this.message.length), !1)
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
                        n = this.offset();
                    return null != (e = this.message.charCodeAt(n + (t >= 65536 ? 2 : 1))) ? e : null
                }
            }]), e
        }();

    function ie(e) {
        return e >= 97 && e <= 122 || e >= 65 && e <= 90
    }
    var it = function(e) {
            function t(e, n, r) {
                var a;
                return D(this, t), (a = aA(this, t, [e])).code = n, a.originalMessage = r, a
            }
            return aT(t, e), F(t, [{
                key: "toString",
                value: function() {
                    return "[formatjs Error: ".concat(this.code, "] ").concat(this.message)
                }
            }]), t
        }(aS(Error)),
        ir = function(e) {
            function t(e, n, r, a) {
                return D(this, t), aA(this, t, ['Invalid values for "'.concat(e, '": "').concat(n, '". Options are "').concat(Object.keys(r).join('", "'), '"'), "INVALID_VALUE", a])
            }
            return aT(t, e), t
        }(it),
        ia = function(e) {
            function t(e, n, r) {
                return D(this, t), aA(this, t, ['Value for "'.concat(e, '" must be of type ').concat(n), "INVALID_VALUE", r])
            }
            return aT(t, e), t
        }(it),
        ii = function(e) {
            function t(e, n) {
                return D(this, t), aA(this, t, ['The intl string context variable "'.concat(e, '" was not provided to the string "').concat(n, '"'), "MISSING_VALUE", n])
            }
            return aT(t, e), t
        }(it);

    function io(e) {
        return {
            create: function() {
                return {
                    get: function(t) {
                        return e[t]
                    },
                    set: function(t, n) {
                        e[t] = n
                    }
                }
            }
        }
    }
    var iu = ((g = function() {
        function e(t) {
            var n, r = this,
                a = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : e.defaultLocale,
                i = arguments.length > 2 ? arguments[2] : void 0,
                o = arguments.length > 3 ? arguments[3] : void 0;
            if (D(this, e), this.formatterCache = {
                    number: {},
                    dateTime: {},
                    pluralRules: {}
                }, this.format = function(e) {
                    var t = r.formatToParts(e);
                    if (1 === t.length) return t[0].value;
                    var n = t.reduce(function(e, t) {
                        return e.length && 0 === t.type && "string" == typeof e[e.length - 1] ? e[e.length - 1] += t.value : e.push(t.value), e
                    }, []);
                    return n.length <= 1 ? n[0] || "" : n
                }, this.formatToParts = function(e) {
                    return function e(t, n, r, a, i, o, u) {
                        if (1 === t.length && 0 === t[0].type) return [{
                            type: 0,
                            value: t[0].value
                        }];
                        var s = [],
                            l = !0,
                            c = !1,
                            d = void 0;
                        try {
                            for (var h, f = t[Symbol.iterator](); !(l = (h = f.next()).done); l = !0) {
                                var m = h.value;
                                if (0 === m.type) {
                                    s.push({
                                        type: 0,
                                        value: m.value
                                    });
                                    continue
                                }
                                if (7 === m.type) {
                                    "number" == typeof o && s.push({
                                        type: 0,
                                        value: r.getNumberFormat(n).format(o)
                                    });
                                    continue
                                }
                                var p = m.value;
                                if (!(i && p in i)) throw new ii(p, u);
                                var E = i[p];
                                if (1 === m.type) {
                                    E && "string" != typeof E && "number" != typeof E && (void 0 === E ? "undefined" : eD(E)) !== "bigint" || (E = "string" == typeof E || "number" == typeof E || (void 0 === E ? "undefined" : eD(E)) === "bigint" ? String(E) : ""), s.push({
                                        type: +("string" != typeof E),
                                        value: E
                                    });
                                    continue
                                }
                                if (3 === m.type) {
                                    var v = "string" == typeof m.style ? a.date[m.style] : aZ(m.style) ? m.style.parsedOptions : void 0;
                                    s.push({
                                        type: 0,
                                        value: r.getDateTimeFormat(n, v).format(E)
                                    });
                                    continue
                                }
                                if (4 === m.type) {
                                    var g = "string" == typeof m.style ? a.time[m.style] : aZ(m.style) ? m.style.parsedOptions : a.time.medium;
                                    s.push({
                                        type: 0,
                                        value: r.getDateTimeFormat(n, g).format(E)
                                    });
                                    continue
                                }
                                if (2 === m.type) {
                                    var b = "string" == typeof m.style ? a.number[m.style] : aq(m.style) ? m.style.parsedOptions : void 0;
                                    if (b && b.scale) {
                                        var y = b.scale || 1;
                                        if ((void 0 === E ? "undefined" : eD(E)) === "bigint") {
                                            if (!Number.isInteger(y)) throw TypeError("Cannot apply fractional scale ".concat(y, " to bigint value. Scale must be an integer when formatting bigint."));
                                            E *= BigInt(y)
                                        } else E *= y
                                    }
                                    s.push({
                                        type: 0,
                                        value: r.getNumberFormat(n, b).format(E)
                                    });
                                    continue
                                }
                                if (8 === m.type) {
                                    var _ = m.children,
                                        A = m.value,
                                        C = i[A];
                                    if ("function" != typeof C) throw new ia(A, "function", u);
                                    var P = C(e(_, n, r, a, i, o).map(function(e) {
                                        return e.value
                                    }));
                                    Array.isArray(P) || (P = [P]), s.push.apply(s, q(P.map(function(e) {
                                        return {
                                            type: +("string" != typeof e),
                                            value: e
                                        }
                                    })))
                                }
                                if (5 === m.type) {
                                    var T = E,
                                        S = (Object.prototype.hasOwnProperty.call(m.options, T) ? m.options[T] : void 0) || m.options.other;
                                    if (!S) throw new ir(m.value, E, Object.keys(m.options), u);
                                    s.push.apply(s, q(e(S.value, n, r, a, i)));
                                    continue
                                }
                                if (6 === m.type) {
                                    var x = "=".concat(E),
                                        R = Object.prototype.hasOwnProperty.call(m.options, x) ? m.options[x] : void 0;
                                    if (!R) {
                                        if (!Intl.PluralRules) throw new it('Intl.PluralRules is not available in this environment.\nTry polyfilling it using "@formatjs/intl-pluralrules"\n', "MISSING_INTL_API", u);
                                        var B = (void 0 === E ? "undefined" : eD(E)) === "bigint" ? Number(E) : E,
                                            I = r.getPluralRules(n, {
                                                type: m.pluralType
                                            }).select(B - (m.offset || 0));
                                        R = (Object.prototype.hasOwnProperty.call(m.options, I) ? m.options[I] : void 0) || m.options.other
                                    }
                                    if (!R) throw new ir(m.value, E, Object.keys(m.options), u);
                                    var N = (void 0 === E ? "undefined" : eD(E)) === "bigint" ? Number(E) : E;
                                    s.push.apply(s, q(e(R.value, n, r, a, i, N - (m.offset || 0))));
                                    continue
                                }
                            }
                        } catch (e) {
                            c = !0, d = e
                        } finally {
                            try {
                                l || null == f.return || f.return()
                            } finally {
                                if (c) throw d
                            }
                        }
                        return s.length < 2 ? s : s.reduce(function(e, t) {
                            var n = e[e.length - 1];
                            return n && 0 === n.type && 0 === t.type ? n.value += t.value : e.push(t), e
                        }, [])
                    }(r.ast, r.locales, r.formatters, r.formats, e, void 0, r.message)
                }, this.resolvedOptions = function() {
                    var e;
                    return {
                        locale: (null == (e = r.resolvedLocale) ? void 0 : e.toString()) || Intl.NumberFormat.supportedLocalesOf(r.locales)[0]
                    }
                }, this.getAst = function() {
                    return r.ast
                }, this.locales = a, this.resolvedLocale = e.resolveLocale(a), "string" == typeof t) {
                if (this.message = t, !e.__parse) throw TypeError("IntlMessageFormat.__parse must be set to process `message` of type `string`");
                var u = o || {},
                    s = (function(e) {
                        if (null == e) throw TypeError("Cannot destructure " + e)
                    }(u), aL({}, u));
                this.ast = e.__parse(t, eg(er({}, s), {
                    locale: this.resolvedLocale
                }))
            } else this.ast = t;
            if (!Array.isArray(this.ast)) throw TypeError("A message must be provided as a String or AST.");
            this.formats = (n = e.formats, i ? Object.keys(n).reduce(function(e, t) {
                var r, a;
                return e[t] = (r = n[t], (a = i[t]) ? er({}, r, a, Object.keys(r).reduce(function(e, t) {
                    return e[t] = er({}, r[t], a[t]), e
                }, {})) : r), e
            }, er({}, n)) : n), this.formatters = o && o.formatters || function() {
                var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {
                    number: {},
                    dateTime: {},
                    pluralRules: {}
                };
                return {
                    getNumberFormat: ax(function() {
                        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return aP(Intl.NumberFormat, q(t))
                    }, {
                        cache: io(e.number),
                        strategy: aU.variadic
                    }),
                    getDateTimeFormat: ax(function() {
                        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return aP(Intl.DateTimeFormat, q(t))
                    }, {
                        cache: io(e.dateTime),
                        strategy: aU.variadic
                    }),
                    getPluralRules: ax(function() {
                        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        return aP(Intl.PluralRules, q(t))
                    }, {
                        cache: io(e.pluralRules),
                        strategy: aU.variadic
                    })
                }
            }(this.formatterCache)
        }
        return F(e, null, [{
            key: "defaultLocale",
            get: function() {
                return e.memoizedDefaultLocale || (e.memoizedDefaultLocale = new Intl.NumberFormat().resolvedOptions().locale), e.memoizedDefaultLocale
            }
        }]), e
    }()).memoizedDefaultLocale = null, g.resolveLocale = function(e) {
        if (void 0 !== Intl.Locale) {
            var t = Intl.NumberFormat.supportedLocalesOf(e);
            return new Intl.Locale(t.length > 0 ? t[0] : "string" == typeof e ? e : e[0])
        }
    }, g.__parse = function(e) {
        var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
            n = new a7(e, t = er({
                shouldParseSkeletons: !0,
                requiresOtherClause: !0
            }, t)).parse();
        if (n.err) {
            var r = SyntaxError(aY[n.err.kind]);
            throw r.location = n.err.location, r.originalMessage = n.err.message, r
        }
        return (null == t ? void 0 : t.captureLocation) || function e(t) {
            t.forEach(function(t) {
                if (delete t.location, 5 === t.type || 6 === t.type)
                    for (var n in t.options) delete t.options[n].location, e(t.options[n].value);
                else 2 === t.type && aq(t.style) || (3 === t.type || 4 === t.type) && aZ(t.style) ? delete t.style.location : 8 === t.type && e(t.children)
            })
        }(n.val), n.val
    }, g.formats = {
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
    }, g);

    function is() {
        for (var e, t, n, r, a, i = arguments.length, o = Array(i), u = 0; u < i; u++) o[u] = arguments[u];
        var s = K(o, 4),
            l = (s[0], s[1]),
            c = s[2],
            d = s[3];
        if (Array.isArray(l)) throw new aD(aO.INVALID_MESSAGE, void 0);
        if ("object" == (void 0 === l ? "undefined" : eD(l))) throw new aD(aO.INSUFFICIENT_PATH, void 0);
        if ("string" == typeof l) {
            var h = c || /'[{}<#|']/.test(l) ? void 0 : l;
            if (h) return h
        }
        var f = d.cache,
            m = d.formats,
            p = d.formatters,
            E = d.globalFormats,
            v = d.locale,
            g = d.timeZone;
        p.getMessageFormat || (p.getMessageFormat = aF(function() {
            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
            return new iu(t[0], t[1], t[2], er({
                formatters: p
            }, t[3]))
        }, f.message));
        try {
            a = p.getMessageFormat(l, v, (e = iu.formats.date, t = iu.formats.time, n = er({}, null == E ? void 0 : E.dateTime, null == m ? void 0 : m.dateTime), r = {
                date: er({}, e, n),
                time: er({}, t, n),
                number: er({}, null == E ? void 0 : E.number, null == m ? void 0 : m.number)
            }, g && ["date", "time"].forEach(function(e) {
                var t = r[e],
                    n = !0,
                    a = !1,
                    i = void 0;
                try {
                    for (var o, u = Object.entries(t)[Symbol.iterator](); !(n = (o = u.next()).done); n = !0) {
                        var s = K(o.value, 2),
                            l = s[0],
                            c = s[1];
                        t[l] = er({
                            timeZone: g
                        }, c)
                    }
                } catch (e) {
                    a = !0, i = e
                } finally {
                    try {
                        n || null == u.return || u.return()
                    } finally {
                        if (a) throw i
                    }
                }
            }), r), {
                formatters: eg(er({}, p), {
                    getDateTimeFormat: function(e, t) {
                        var n;
                        return p.getDateTimeFormat(e, eg(er({}, t), {
                            timeZone: null != (n = null == t ? void 0 : t.timeZone) ? n : g
                        }))
                    }
                })
            })
        } catch (e) {
            throw new aD(aO.INVALID_MESSAGE, void 0)
        }
        var b = a.format(c);
        return (0, C.isValidElement)(b) || Array.isArray(b) || "string" == typeof b ? b : String(b)
    }

    function il() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        return t.filter(Boolean).join(".")
    }

    function ic(e) {
        return il(e.namespace, e.key)
    }

    function id(e) {
        console.error(e)
    }

    function ih(e, t, n, r) {
        var a = il(r, n);
        if (!t) throw Error(a);
        var i = t;
        return n.split(".").forEach(function(t) {
            var n = i[t];
            if (null == t || null == n) throw Error(a + " (".concat(e, ")"));
            i = n
        }), i
    }
    is.raw = !0;
    var im = (0, C.createContext)(void 0);

    function ip(e) {
        var t = e.children,
            n = e.formats,
            r = e.getMessageFallback,
            a = e.locale,
            i = e.messages,
            o = e.now,
            u = e.onError,
            s = e.timeZone,
            l = (0, C.useContext)(im),
            c = (0, C.useMemo)(function() {
                return (null == l ? void 0 : l.cache) || {
                    dateTime: {},
                    number: {},
                    message: {},
                    relativeTime: {},
                    pluralRules: {},
                    list: {},
                    displayNames: {}
                }
            }, [a, null == l ? void 0 : l.cache]),
            d = (0, C.useMemo)(function() {
                return (null == l ? void 0 : l.formatters) || {
                    getDateTimeFormat: aM(Intl.DateTimeFormat, c.dateTime),
                    getNumberFormat: aM(Intl.NumberFormat, c.number),
                    getPluralRules: aM(Intl.PluralRules, c.pluralRules),
                    getRelativeTimeFormat: aM(Intl.RelativeTimeFormat, c.relativeTime),
                    getListFormat: aM(Intl.ListFormat, c.list),
                    getDisplayNames: aM(Intl.DisplayNames, c.displayNames)
                }
            }, [c, null == l ? void 0 : l.formatters]),
            h = (0, C.useMemo)(function() {
                var e, t, h, f, m;
                return eg(er({}, (t = (e = {
                    locale: a,
                    formats: void 0 === n ? null == l ? void 0 : l.formats : n,
                    getMessageFallback: r || (null == l ? void 0 : l.getMessageFallback),
                    messages: void 0 === i ? null == l ? void 0 : l.messages : i,
                    now: o || (null == l ? void 0 : l.now),
                    onError: u || (null == l ? void 0 : l.onError),
                    timeZone: s || (null == l ? void 0 : l.timeZone)
                }).formats, h = e.getMessageFallback, f = e.messages, m = e.onError, eg(er({}, nd(e, ["formats", "getMessageFallback", "messages", "onError"])), {
                    formats: t || void 0,
                    messages: f || void 0,
                    onError: m || id,
                    getMessageFallback: h || ic
                }))), {
                    formatters: d,
                    cache: c
                })
            }, [c, n, d, r, a, i, o, u, l, s]);
        return (0, na.jsx)(im.Provider, {
            value: h,
            children: t
        })
    }

    function iE() {
        var e = (0, C.useContext)(im);
        if (!e) throw Error(void 0);
        return e
    }
    var iv = !1,
        ig = "u" < typeof window,
        ib = function(e) {
            return e.replaceAll(".", ":")
        },
        iy = function() {
            if ("u" < typeof window) return {};
            var e = window.Roblox;
            return null != e ? e : {}
        },
        i_ = function(e) {
            return Object.fromEntries(Object.entries(null != e ? e : {}).flatMap(function(e) {
                var t = K(e, 2),
                    n = t[0],
                    r = t[1];
                return null == r ? [] : [
                    [ib(n), r]
                ]
            }))
        },
        iA = function(e) {
            var t = iy(),
                n = t.Lang,
                r = t.LangDynamic,
                a = t.LangDynamicDefault;
            return Object.fromEntries(e.map(function(e) {
                return [ib(e), er({}, i_(null == a ? void 0 : a[e]), i_(null == n ? void 0 : n[e]), i_(null == r ? void 0 : r[e]))]
            }))
        },
        iC = function(e) {
            var t = e.namespaces,
                n = e.locale,
                r = e.children,
                a = t.join(","),
                i = (0, C.useMemo)(function() {
                    return iA(t)
                }, [a]);
            return (0, na.jsx)(ip, {
                locale: null != n ? n : ee(),
                messages: i,
                children: r
            })
        },
        iP = (0, C.createContext)(void 0),
        iT = function(e) {
            var t = e.useTranslate;
            return (0, e.render)(t())
        },
        iS = function(e) {
            var t = e.translate,
                n = e.namespaces,
                r = e.useTranslate,
                a = e.render,
                i = null != t ? t : (0, C.useContext)(iP);
            return i ? (0, na.jsx)(iP.Provider, {
                value: i,
                children: a(i)
            }) : (0, na.jsx)(iC, {
                namespaces: n,
                children: (0, na.jsx)(iT, {
                    useTranslate: r,
                    render: a
                })
            })
        },
        ix = "__FN_nvfToKPAOuiV__",
        iR = "__FN_END_nvfToKPAOuiV__",
        iB = new RegExp("".concat(ix, "(\\d+)\\|")),
        iI = new RegExp("".concat(iR, "(\\d+)\\|")),
        iN = function(e, t, n) {
            var r = er({}, n),
                a = {};
            t.forEach(function(e, t) {
                var n = t.toString(),
                    i = "".concat(ix).concat(n, "|"),
                    o = "".concat(iR).concat(n, "|");
                r[e.opening] = i, r[e.closing] = o, a[n] = {
                    start: i,
                    end: o,
                    render: e.render
                }
            });
            var i = function(e) {
                    var t = [],
                        n = iB.exec(e),
                        r = iI.exec(e);
                    if (r && (!n || r.index < n.index)) return null;
                    if (!n) return [e];
                    n.index > 0 && t.push(e.slice(0, n.index));
                    var o = null == n[1] ? void 0 : a[n[1]];
                    if (null == o) return null;
                    var u = e.indexOf(o.end);
                    if (u < n.index + n[0].length) return null;
                    var s = i(e.slice(n.index + n[0].length, u));
                    if (null == s) return null;
                    t.push(o.render(s));
                    var l = e.slice(u + o.end.length);
                    if (l.length > 0) {
                        var c = i(l);
                        if (null == c) return null;
                        t.push.apply(t, q(c))
                    }
                    return t
                },
                o = i(e(r));
            return null == o ? null : o.filter(function(e) {
                return "" !== e
            }).map(function(e, t) {
                return (0, na.jsx)(C.Fragment, {
                    children: e
                }, t)
            })
        },
        iw = "WwwCommon",
        iU = function(e) {
            var t = e.publish,
                n = e.captureException,
                r = e.featureName;

            function a(e, t, a) {
                if (null != a) {
                    var i = U(a, Error) ? a.name || "Error" : "UnknownError",
                        o = r ? "".concat(r, "_").concat(e) : e;
                    return null == n || n(a, {
                        error_counter: o
                    }), eg(er({}, t), {
                        errorType: i
                    })
                }
                return t
            }
            return {
                trackCounter: function() {
                    for (var e = arguments.length, n = Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                    var a = K(n, 2);
                    t(a[0], a[1])
                },
                trackError: function() {
                    for (var e = arguments.length, n = Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                    var i = K(n, 3),
                        o = i[0],
                        u = i[1],
                        s = i[2],
                        l = a(o, eg(er({}, null != u ? u : {}), {
                            severity: "error"
                        }), s);
                    t(o, l)
                },
                trackCriticalError: function() {
                    for (var e = arguments.length, n = Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                    var i = K(n, 3),
                        o = i[0],
                        u = i[1],
                        s = i[2],
                        l = a(o, eg(er({}, null != u ? u : {}), {
                            severity: "critical"
                        }), s);
                    t(o, l)
                }
            }
        }({
            publish: tn(iw)
        });
    iU.trackCounter;
    var iD = iU.trackError;
    iU.trackCriticalError;
    var iO = function() {
            if ("u" > typeof document) {
                var e = document.querySelector('meta[name="page-meta"]');
                return null == e ? void 0 : e.dataset.internalPageName
            }
        },
        iF = function(e) {
            return "string" == typeof e && e.length > 0
        },
        iM = function(e, t, n) {
            var r;
            "u" > typeof window && iD(e, {
                key: n,
                namespace: t,
                internalPageName: null != (r = iO()) ? r : "unknown"
            })
        },
        iL = function(e) {
            var t, n, r, a, i, o, u, s, l, c, d, h, f, m = (t = ib(e), n = {
                "!": iE().messages
            }, r = t ? "!.".concat(t) : "!", i = (a = iE()).cache, o = a.formats, u = a.formatters, s = a.getMessageFallback, l = a.locale, c = a.onError, d = a.timeZone, h = n["!"], f = "!" === r ? void 0 : r.slice(2), d || iv || !ig || (iv = !0, c(new aD(aO.ENVIRONMENT_FALLBACK, void 0))), (0, C.useMemo)(function() {
                var e, t;
                return t = function(e, t, n) {
                        try {
                            if (!t) throw Error(void 0);
                            var r = n ? ih(e, t, n) : t;
                            if (!r) throw Error(n);
                            return r
                        } catch (e) {
                            return new aD(aO.MISSING_MESSAGE, e.message)
                        }
                    }((e = {
                        cache: i,
                        formatters: u,
                        getMessageFallback: s,
                        messages: h,
                        namespace: f,
                        onError: c,
                        formats: o,
                        locale: l,
                        timeZone: d
                    }).locale, e.messages, e.namespace),
                    function(e) {
                        var t = e.cache,
                            n = e.formats,
                            r = e.formatters,
                            a = e.getMessageFallback,
                            i = void 0 === a ? ic : a,
                            o = e.locale,
                            u = e.messagesOrError,
                            s = e.namespace,
                            l = e.onError,
                            c = e.timeZone,
                            d = U(u, aD);

                        function h(e, t, n, r) {
                            var a = new aD(t, n);
                            return l(a), null != r ? r : i({
                                error: a,
                                key: e,
                                namespace: s
                            })
                        }

                        function f(e, a, f, m) {
                            var p, E, v;
                            if (d) {
                                if (!m) return l(u), i({
                                    error: u,
                                    key: e,
                                    namespace: s
                                });
                                p = m
                            } else try {
                                p = ih(o, u, e, s)
                            } catch (t) {
                                if (!m) return h(e, aO.MISSING_MESSAGE, t.message, m);
                                p = m
                            }
                            try {
                                var g, b = il(s, e);
                                return is(b, p, a ? (g = {}, Object.keys(a).forEach(function(e) {
                                    var t, n = 0,
                                        r = a[e];
                                    t = "function" == typeof r ? function(t) {
                                        var a = r(t);
                                        return (0, C.isValidElement)(a) ? (0, C.cloneElement)(a, {
                                            key: e + n++
                                        }) : a
                                    } : r, g[e] = t
                                }), g) : a, {
                                    cache: t,
                                    formatters: r,
                                    globalFormats: n,
                                    formats: f,
                                    locale: o,
                                    timeZone: c
                                })
                            } catch (t) {
                                return U(t, aD) ? (E = t.code, v = t.originalMessage) : (E = aO.FORMATTING_ERROR, v = t.message), h(e, E, v, m)
                            }
                        }

                        function m(e, t, n, r) {
                            var a = f(e, t, n, r);
                            return "string" != typeof a ? h(e, aO.INVALID_MESSAGE, void 0) : a
                        }
                        return m.rich = f, m.markup = function(e, t, n, r) {
                            return f(e, t, n, r)
                        }, m.raw = function(e) {
                            if (d) return l(u), i({
                                error: u,
                                key: e,
                                namespace: s
                            });
                            try {
                                return ih(o, u, e, s)
                            } catch (t) {
                                return h(e, aO.MISSING_MESSAGE, t.message)
                            }
                        }, m.has = function(e) {
                            if (d) return !1;
                            try {
                                return ih(o, u, e, s), !0
                            } catch (e) {
                                return !1
                            }
                        }, m
                    }(eg(er({}, e), {
                        messagesOrError: t
                    }))
            }, [i, u, s, h, f, c, o, l, d]));
            return (0, C.useMemo)(function() {
                return Object.assign(function(t, n, r) {
                    var a = ib(t);
                    return void 0 === r || m.has(a) ? m(a, n) : (iM("TranslationKeyNotFound", e, a), r)
                }, {
                    rich: function(e, t) {
                        return m.rich(ib(e), t)
                    },
                    has: function(e) {
                        return iF(e) && m.has(ib(e))
                    },
                    dynamic: function(t, n) {
                        var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "";
                        if (!iF(t)) return iM("TranslationKeyNotFound", e, String(t)), r;
                        var a = ib(t),
                            i = m.has(a);
                        return i || iM("TranslationKeyNotFound", e, a), i ? m(a, n) : r
                    },
                    html: function(t, n, r) {
                        if (!iF(t)) return iM("TranslationKeyNotFound", e, String(t)), null;
                        var a = ib(t);
                        if (!m.has(a)) return iM("TranslationKeyNotFound", e, a), null;
                        var i = iN(function(e) {
                            return m(a, e)
                        }, n, r);
                        return null == i && iM("TranslationMalformed", e, a), i
                    }
                })
            }, [m, e])
        },
        ik = function(e) {
            return e
        },
        iH = ["Purchasing.PurchaseDialog", "Authentication.TwoStepVerification", "Feature.RobloxSubscription", "Feature.NotApproved", "IAPExperience.PurchaseError", "Feature.Catalog"].map(ik);
    ["Feature.Item", "CommonUI.Messages"].map(ik), ["Feature.ItemModel"].map(ik);
    var iG = function() {
            var e;
            return e = [iL(ik("Purchasing.PurchaseDialog")), iL(ik("Authentication.TwoStepVerification")), iL(ik("Feature.RobloxSubscription")), iL(ik("Feature.NotApproved")), iL(ik("IAPExperience.PurchaseError")), iL(ik("Feature.Catalog"))],
                function(t, n) {
                    var r = e.find(function(e) {
                        return e.has(t)
                    });
                    return r ? r(t, n) : ""
                }
        },
        ij = function(e, t) {
            return t ? (0, na.jsx)("div", {
                dangerouslySetInnerHTML: {
                    __html: e
                }
            }) : (0, na.jsx)("div", {
                children: e
            })
        },
        iW = function(e) {
            var t = e.titleText,
                n = e.bodyContent,
                r = e.footerText,
                a = e.imageUrl,
                i = e.acceptText,
                o = e.declineText,
                u = e.showDecline,
                s = e.hasCloseAffordance,
                l = void 0 !== s && s,
                c = e.dismissable,
                d = void 0 === c || c,
                h = e.allowHtmlContentInBody,
                f = e.allowHtmlContentInFooter,
                m = e.onAccept,
                p = e.onDecline,
                E = e.onCancel,
                v = e.translate,
                g = function(e) {
                    d || e.preventDefault()
                };
            return (0, na.jsx)(ar, {
                open: !0,
                onOpenChange: function(e) {
                    e || E()
                },
                isModal: !0,
                size: "Medium",
                hasCloseAffordance: l,
                closeLabel: v("Action.Close") || "Close",
                children: (0, na.jsxs)(aa, eg(er({
                    className: "relative width-full"
                }, {
                    onEscapeKeyDown: g,
                    onPointerDownOutside: g
                }), {
                    children: [(0, na.jsxs)(ai, {
                        className: "purchase-dialog-body gap-large flex flex-col",
                        children: [(0, na.jsx)(ao, {
                            className: l ? "purchase-dialog-title-with-close text-heading-medium" : "text-heading-medium",
                            children: t
                        }), a && (0, na.jsx)("div", {
                            className: "flex justify-center",
                            children: (0, na.jsx)("img", {
                                className: "modal-thumb",
                                src: a,
                                alt: ""
                            })
                        }), n && ij(n, h)]
                    }), (0, na.jsxs)(au, {
                        className: "gap-small flex flex-col",
                        children: [(0, na.jsxs)("div", {
                            className: "gap-small flex flex-row-reverse",
                            children: [(0, na.jsx)(ab, {
                                variant: "Emphasis",
                                className: "fill basis-0",
                                onClick: m,
                                children: i
                            }), (void 0 === u || u) && o && (0, na.jsx)(ab, {
                                variant: "Standard",
                                className: "fill basis-0",
                                onClick: p,
                                children: o
                            })]
                        }), (null == r ? void 0 : r.trim()) && (0, na.jsx)("div", {
                            className: "text-footer text-center",
                            children: ij(r, f)
                        })]
                    })]
                }))
            })
        },
        iV = function(e) {
            var t = e.translate,
                n = nd(e, ["translate"]);
            return (0, na.jsx)(iS, {
                translate: t,
                namespaces: iH,
                useTranslate: iG,
                render: function(e) {
                    return (0, na.jsx)(iW, eg(er({}, n), {
                        translate: e
                    }))
                }
            })
        };

    function iX(e) {
        null == b || b();
        var t = nl(),
            n = function() {
                b === n && (b = void 0, t.remove())
            };
        b = n, t.render(P().createElement(iV, {
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
                var t, r;
                if (e.fieldValidationRequired) {
                    (null == (r = e.onAccept) ? void 0 : r.call(e)) !== !1 && n();
                    return
                }
                n(), null == (t = e.onAccept) || t.call(e)
            },
            onDecline: function() {
                var t;
                n(), null == (t = e.onDecline) || t.call(e)
            },
            onCancel: function() {
                var t;
                n(), null == (t = e.onCancel) || t.call(e)
            }
        }))
    }
    var iz = window.Roblox["core-lib"].http.index,
        iK = window.Roblox["core-lib"].url.index,
        iY = function() {
            return iK.Url.parse(el().metricsApi).getOrThrow().withPath("/v1/games/report-event")
        },
        iq = function(e, t, n) {
            try {
                iz.postUntyped(e().withSearchParams(er({
                    name: t
                }, n)), "", {
                    credentials: "include",
                    keepalive: !0,
                    signal: AbortSignal.timeout(3e4)
                })
            } catch (e) {}
        },
        iZ = function() {
            for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
            t.forEach(function(e) {
                iq(iY, e)
            })
        };

    function iQ(e) {
        iZ("WebCatalog" + e)
    }

    function iJ(e, t) {
        t === tT || "Package" === t ? iZ("WebBundle" + e) : t === tP ? iZ("WebGamePass" + e) : t ? iQ(e) : iQ("UnknownErrorNoAsset")
    }

    function i$(e) {
        tE.sendUserPurchaseFlowEvent({
            triggerContext: tE.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL,
            isMidPurchaseStep: !0,
            viewName: tE.ENUM_VIEW_NAME.PURCHASE_WARNING,
            purchaseEventType: tE.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN,
            viewMessage: e
        })
    }

    function i0(e, t, n, r, a) {
        return w(function() {
            var i;
            return L(this, function(o) {
                var u, s, l, c, d;
                switch (o.label) {
                    case 0:
                        if (!t) return n(), [2, Promise.resolve()];
                        o.label = 1;
                    case 1:
                        return o.trys.push([1, 3, , 4]), [4, (u = e.roblox_product_id, w(function() {
                            var e, t, n, r;
                            return L(this, function(a) {
                                switch (a.label) {
                                    case 0:
                                        t = {
                                            productId: u,
                                            is13To17ScaryModalEnabled: !(null == (e = t7()) ? void 0 : e.isPremiumUser)
                                        }, n = {
                                            url: "".concat(es.EnvironmentUrls.apiGatewayUrl).concat("/purchase-warning/v1/purchase-warnings"),
                                            withCredentials: !0,
                                            timeout: 5e3
                                        }, a.label = 1;
                                    case 1:
                                        return a.trys.push([1, 3, , 4]), [4, t$.get(n, t)];
                                    case 2:
                                        if (200 !== (r = a.sent()).status || !r.data.action) return [2, Promise.resolve("NoAction")];
                                        return [2, Promise.resolve(r.data.action)];
                                    case 3:
                                        return [2, Promise.reject(a.sent())];
                                    case 4:
                                        return [2]
                                }
                            })
                        })())];
                    case 2:
                        return (i = o.sent()) === tF || i === tM || i === tL || i === tk ? (i === tF ? (i$(tE.ENUM_VIEW_MESSAGE.U13_PAYMENT_MODAL), iJ("ShowU13PaymentModal", null == a ? void 0 : a.assetType)) : i === tL ? (i$(tE.ENUM_VIEW_MESSAGE.U13_MONTHLY_THRESHOLD_1_MODAL), iJ("ShowU13MonthlyThreshold1Modal", null == a ? void 0 : a.assetType)) : i === tk ? (i$(tE.ENUM_VIEW_MESSAGE.U13_MONTHLY_THRESHOLD_2_MODAL), iJ("ShowU13MonthlyThreshold2Modal", null == a ? void 0 : a.assetType)) : (i$(tE.ENUM_VIEW_MESSAGE.PAYMENT_MODAL_13_TO_17), iJ("ShowParentalConsentWarningPaymentModal13To17Modal", null == a ? void 0 : a.assetType)), s = r.getTranslationResource(tC), l = r.getTranslationResource(tA), c = {
                            lineBreak: "<br /><br />",
                            linebreak: "<br /><br />"
                        }, d = "", i === tF ? d = s.get("Description.ScaryModalBodyNew", c) : i === tM ? d = s.get("Description.ScaryModalBody13To17", {}) : i === tL ? d = s.get("Description.ScaryModalThreshold1Body", c) : i === tk && (d = s.get("Description.ScaryModalThreshold2Body", c)), iX({
                            titleText: s.get("Heading.ScaryModalTitle", {}),
                            bodyContent: '<div><span class="text-description">'.concat(d, "</span></div>").concat('<div class="text-center"><div class="icon-warning"></div></div>'),
                            declineText: l.get(tO, {}),
                            acceptText: l.get("Action.OK", {}),
                            onAccept: function() {
                                return w(function() {
                                    var e, t;
                                    return L(this, function(r) {
                                        switch (r.label) {
                                            case 0:
                                                e = {
                                                    acknowledgement: "Confirmed".concat(i)
                                                }, t = {
                                                    url: "".concat(es.EnvironmentUrls.apiGatewayUrl).concat("/purchase-warning/v1/purchase-warnings/acknowledge"),
                                                    withCredentials: !0,
                                                    timeout: 5e3
                                                }, r.label = 1;
                                            case 1:
                                                return r.trys.push([1, 3, , 4]), [4, t$.post(t, e)];
                                            case 2:
                                                return r.sent(), n(), [2, Promise.resolve()];
                                            case 3:
                                                return [2, Promise.reject(r.sent())];
                                            case 4:
                                                return [2]
                                        }
                                    })
                                })().then(function() {
                                    i === tF ? iJ("ConfirmU13PaymentModal", null == a ? void 0 : a.assetType) : i === tL ? iJ("ConfirmU13MonthlyThreshold1Modal", null == a ? void 0 : a.assetType) : i === tk ? iJ("ConfirmU13MonthlyThreshold2Modal", null == a ? void 0 : a.assetType) : iJ("ConfirmParentalConsentWarningPaymentModal13To17Modal", null == a ? void 0 : a.assetType)
                                }).catch(function() {
                                    n()
                                }), !1
                            },
                            onDecline: function() {
                                return iJ(tY, null == a ? void 0 : a.assetType), nr(), !1
                            },
                            onCancel: function() {
                                return iJ(tY, null == a ? void 0 : a.assetType), nr(), !1
                            },
                            allowHtmlContentInBody: !0,
                            allowHtmlContentInFooter: !1,
                            fieldValidationRequired: !0,
                            xToCancel: !0
                        })) : (iJ("U13PaymentModalNoAction", null == a ? void 0 : a.assetType), n()), [2, Promise.resolve()];
                    case 3:
                        return [2, Promise.reject(o.sent())];
                    case 4:
                        return [2]
                }
            })
        })()
    }
    var i1 = 0,
        i2 = function() {
            var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "\xabr",
                t = (0, C.useRef)();
            return t.current || (i1 += 1, t.current = "".concat(e).concat(i1)), t.current
        },
        i3 = (0, C.createContext)(null);

    function i5(e, t) {
        var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
            r = n.checkForDefaultPrevented,
            a = void 0 === r || r;
        return function(n) {
            if (null == e || e(n), !1 === a || !n.defaultPrevented) return null == t ? void 0 : t(n)
        }
    }(0, C.createContext)(null), (0, C.createContext)(null), "u" > typeof window && window.document && window.document.createElement;
    var i6 = C[" useInsertionEffect ".trim().toString()] || nx;
    Symbol("RADIX:SYNC_STATE");
    var i4 = function(e) {
        var t, n, r, a, i, o, u, s, l, c, d, h, f, m, p, E, v, g = e.present,
            b = e.children,
            y = (t = g, i = (a = K(C.useState(), 2))[0], o = a[1], u = C.useRef(null), s = C.useRef(t), l = C.useRef("none"), d = (c = K((n = t ? "mounted" : "unmounted", r = {
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
            }, C.useReducer(function(e, t) {
                var n = r[e][t];
                return null != n ? n : e
            }, n)), 2))[0], h = c[1], C.useEffect(function() {
                var e = i8(u.current);
                l.current = "mounted" === d ? e : "none"
            }, [d]), nx(function() {
                var e = u.current,
                    n = s.current;
                if (n !== t) {
                    var r = l.current,
                        a = i8(e);
                    t ? h("MOUNT") : "none" === a || (null == e ? void 0 : e.display) === "none" ? h("UNMOUNT") : n && r !== a ? h("ANIMATION_OUT") : h("UNMOUNT"), s.current = t
                }
            }, [t, h]), nx(function() {
                if (i) {
                    var e, t, n = null != (e = i.ownerDocument.defaultView) ? e : window,
                        r = function(e) {
                            var r = i8(u.current).includes(CSS.escape(e.animationName));
                            if (e.target === i && r && (h("ANIMATION_END"), !s.current)) {
                                var a = i.style.animationFillMode;
                                i.style.animationFillMode = "forwards", t = n.setTimeout(function() {
                                    "forwards" === i.style.animationFillMode && (i.style.animationFillMode = a)
                                })
                            }
                        },
                        a = function(e) {
                            e.target === i && (l.current = i8(u.current))
                        };
                    return i.addEventListener("animationstart", a), i.addEventListener("animationcancel", r), i.addEventListener("animationend", r),
                        function() {
                            n.clearTimeout(t), i.removeEventListener("animationstart", a), i.removeEventListener("animationcancel", r), i.removeEventListener("animationend", r)
                        }
                }
                h("ANIMATION_END")
            }, [i, h]), {
                isPresent: ["mounted", "unmountSuspended"].includes(d),
                ref: C.useCallback(function(e) {
                    u.current = e ? getComputedStyle(e) : null, o(e)
                }, [])
            }),
            _ = "function" == typeof b ? b({
                present: y.isPresent
            }) : C.Children.only(b),
            A = nP(y.ref, (v = (E = null == (m = Object.getOwnPropertyDescriptor((f = _).props, "ref")) ? void 0 : m.get) && "isReactWarning" in E && E.isReactWarning) ? f.ref : (v = (E = null == (p = Object.getOwnPropertyDescriptor(f, "ref")) ? void 0 : p.get) && "isReactWarning" in E && E.isReactWarning) ? f.props.ref : f.props.ref || f.ref);
        return "function" == typeof b || y.isPresent ? C.cloneElement(_, {
            ref: A
        }) : null
    };

    function i8(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    i4.displayName = "Presence";
    var i9 = "Checkbox",
        i7 = K(nT(i9), 2),
        oe = i7[0];
    i7[1];
    var ot = K(oe(i9), 2),
        on = ot[0],
        or = ot[1];

    function oa(e) {
        var t, n, r, a, i, o, u, s, l, c, d, h, f, m, p, E, v, g, b, y, _ = e.__scopeCheckbox,
            A = e.checked,
            P = e.children,
            T = e.defaultChecked,
            S = e.disabled,
            x = e.form,
            R = e.name,
            B = e.onCheckedChange,
            I = e.required,
            N = e.value,
            w = e.internal_do_not_use_render,
            U = K((c = (l = {
                prop: A,
                defaultProp: null != T && T,
                onChange: B,
                caller: i9
            }).prop, d = l.defaultProp, h = l.onChange, f = l.caller, p = (m = K((n = (t = {
                defaultProp: d,
                onChange: void 0 === h ? function() {} : h
            }).defaultProp, r = t.onChange, i = (a = K(C.useState(n), 2))[0], o = a[1], u = C.useRef(i), s = C.useRef(r), i6(function() {
                s.current = r
            }, [r]), C.useEffect(function() {
                if (u.current !== i) {
                    var e;
                    null == (e = s.current) || e.call(s, i), u.current = i
                }
            }, [i, u]), [i, o, s]), 3))[0], E = m[1], v = m[2], b = (g = void 0 !== c) ? c : p, y = C.useRef(void 0 !== c), C.useEffect(function() {
                var e = y.current;
                if (e !== g) {
                    var t = g ? "controlled" : "uncontrolled";
                    console.warn("".concat(f, " is changing from ").concat(e ? "controlled" : "uncontrolled", " to ").concat(t, ". Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component."))
                }
                y.current = g
            }, [g, f]), [b, C.useCallback(function(e) {
                if (g) {
                    var t, n = "function" == typeof e ? e(c) : e;
                    n !== c && (null == (t = v.current) || t.call(v, n))
                } else E(e)
            }, [g, c, E, v])]), 2),
            D = U[0],
            O = U[1],
            F = K(C.useState(null), 2),
            M = F[0],
            L = F[1],
            k = K(C.useState(null), 2),
            H = k[0],
            G = k[1],
            j = C.useRef(!1),
            W = !M || !!x || !!M.closest("form"),
            V = {
                checked: D,
                disabled: S,
                setChecked: O,
                control: M,
                setControl: L,
                name: R,
                form: x,
                value: void 0 === N ? "on" : N,
                hasConsumerStoppedPropagationRef: j,
                required: I,
                defaultChecked: !oh(T) && T,
                isFormControl: W,
                bubbleInput: H,
                setBubbleInput: G
            };
        return (0, na.jsx)(on, eg(er({
            scope: _
        }, V), {
            children: "function" == typeof w ? w(V) : P
        }))
    }
    var oi = "CheckboxTrigger",
        oo = C.forwardRef(function(e, t) {
            var n = np([e, t]),
                r = n[0],
                a = n.slice(1),
                i = r.__scopeCheckbox,
                o = r.onKeyDown,
                u = r.onClick,
                s = nd(r, ["__scopeCheckbox", "onKeyDown", "onClick"]),
                l = K(a, 1)[0],
                c = or(oi, i),
                d = c.control,
                h = c.value,
                f = c.disabled,
                m = c.checked,
                p = c.required,
                E = c.setControl,
                v = c.setChecked,
                g = c.hasConsumerStoppedPropagationRef,
                b = c.isFormControl,
                y = c.bubbleInput,
                _ = nP(l, E),
                A = C.useRef(m);
            return C.useEffect(function() {
                var e = null == d ? void 0 : d.form;
                if (e) {
                    var t = function() {
                        return v(A.current)
                    };
                    return e.addEventListener("reset", t),
                        function() {
                            return e.removeEventListener("reset", t)
                        }
                }
            }, [d, v]), (0, na.jsx)(r6.button, eg(er({
                type: "button",
                role: "checkbox",
                "aria-checked": oh(m) ? "mixed" : m,
                "aria-required": p,
                "data-state": of(m),
                "data-disabled": f ? "" : void 0,
                disabled: f,
                value: h
            }, s), {
                ref: _,
                onKeyDown: i5(o, function(e) {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: i5(u, function(e) {
                    v(function(e) {
                        return !!oh(e) || !e
                    }), y && b && (g.current = e.isPropagationStopped(), g.current || e.stopPropagation())
                })
            }))
        });
    oo.displayName = oi;
    var ou = C.forwardRef(function(e, t) {
        var n = e.__scopeCheckbox,
            r = e.name,
            a = e.checked,
            i = e.defaultChecked,
            o = e.required,
            u = e.disabled,
            s = e.value,
            l = e.onCheckedChange,
            c = e.form,
            d = nd(e, ["__scopeCheckbox", "name", "checked", "defaultChecked", "required", "disabled", "value", "onCheckedChange", "form"]);
        return (0, na.jsx)(oa, {
            __scopeCheckbox: n,
            checked: a,
            defaultChecked: i,
            disabled: u,
            required: o,
            onCheckedChange: l,
            name: r,
            form: c,
            value: s,
            internal_do_not_use_render: function(e) {
                var r = e.isFormControl;
                return (0, na.jsxs)(na.Fragment, {
                    children: [(0, na.jsx)(oo, eg(er({}, d), {
                        ref: t,
                        __scopeCheckbox: n
                    })), r && (0, na.jsx)(od, {
                        __scopeCheckbox: n
                    })]
                })
            }
        })
    });
    ou.displayName = i9;
    var os = "CheckboxIndicator",
        ol = C.forwardRef(function(e, t) {
            var n = e.__scopeCheckbox,
                r = e.forceMount,
                a = nd(e, ["__scopeCheckbox", "forceMount"]),
                i = or(os, n);
            return (0, na.jsx)(i4, {
                present: r || oh(i.checked) || !0 === i.checked,
                children: (0, na.jsx)(r6.span, eg(er({
                    "data-state": of(i.checked),
                    "data-disabled": i.disabled ? "" : void 0
                }, a), {
                    ref: t,
                    style: er({
                        pointerEvents: "none"
                    }, e.style)
                }))
            })
        });
    ol.displayName = os;
    var oc = "CheckboxBubbleInput",
        od = C.forwardRef(function(e, t) {
            var n, r, a, i, o = np([e, t]),
                u = o[0],
                s = o.slice(1),
                l = u.__scopeCheckbox,
                c = nd(u, ["__scopeCheckbox"]),
                d = K(s, 1)[0],
                h = or(oc, l),
                f = h.control,
                m = h.hasConsumerStoppedPropagationRef,
                p = h.checked,
                E = h.defaultChecked,
                v = h.required,
                g = h.disabled,
                b = h.name,
                y = h.value,
                _ = h.form,
                A = h.bubbleInput,
                P = nP(d, h.setBubbleInput),
                T = (n = C.useRef({
                    value: p,
                    previous: p
                }), C.useMemo(function() {
                    return n.current.value !== p && (n.current.previous = n.current.value, n.current.value = p), n.current.previous
                }, [p])),
                S = (a = (r = K(C.useState(void 0), 2))[0], i = r[1], nx(function() {
                    if (f) {
                        i({
                            width: f.offsetWidth,
                            height: f.offsetHeight
                        });
                        var e = new ResizeObserver(function(e) {
                            if (Array.isArray(e) && e.length) {
                                var t, n, r = e[0];
                                if ("borderBoxSize" in r) {
                                    var a = r.borderBoxSize,
                                        o = Array.isArray(a) ? a[0] : a;
                                    t = o.inlineSize, n = o.blockSize
                                } else t = f.offsetWidth, n = f.offsetHeight;
                                i({
                                    width: t,
                                    height: n
                                })
                            }
                        });
                        return e.observe(f, {
                                box: "border-box"
                            }),
                            function() {
                                return e.unobserve(f)
                            }
                    }
                    i(void 0)
                }, [f]), a);
            C.useEffect(function() {
                if (A) {
                    var e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                        t = !m.current;
                    if (T !== p && e) {
                        var n = new Event("click", {
                            bubbles: t
                        });
                        A.indeterminate = oh(p), e.call(A, !oh(p) && p), A.dispatchEvent(n)
                    }
                }
            }, [A, T, p, m]);
            var x = C.useRef(!oh(p) && p);
            return (0, na.jsx)(r6.input, eg(er({
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != E ? E : x.current,
                required: v,
                disabled: g,
                name: b,
                value: y,
                form: _
            }, c), {
                tabIndex: -1,
                ref: P,
                style: eg(er({}, c.style, S), {
                    position: "absolute",
                    pointerEvents: "none",
                    opacity: 0,
                    margin: 0,
                    transform: "translateX(-100%)"
                })
            }))
        });

    function oh(e) {
        return "indeterminate" === e
    }

    function of(e) {
        return oh(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    od.displayName = oc;
    var om = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-600"
        },
        op = {
            XSmall: "",
            Small: "",
            Medium: "",
            Large: "padding-y-xxsmall"
        },
        oE = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        ov = {
            XSmall: "",
            Small: "padding-top-xxsmall",
            Medium: "padding-top-xxsmall",
            Large: "padding-top-xxsmall"
        },
        og = function(e) {
            var t, n, r, a, i = e.label,
                o = e.className,
                u = e.isChecked,
                s = e.isDisabled,
                l = e.size,
                c = e.hint,
                d = e.placement,
                h = e.onCheckedChange,
                f = e.id,
                m = e["aria-describedby"],
                p = nd(e, ["label", "className", "isChecked", "isDisabled", "size", "hint", "placement", "onCheckedChange", "id", "aria-describedby"]),
                E = (0, C.useContext)(i3),
                v = null != (t = null != (n = null == E ? void 0 : E.size) ? n : l) ? t : "Medium",
                g = null != (r = null != (a = null == E ? void 0 : E.placement) ? a : d) ? r : "Start",
                b = s || (null == E ? void 0 : E.isDisabled),
                y = i2(),
                _ = f || y,
                A = E && i && c ? "".concat(_, "Hint") : void 0,
                T = i && P().createElement("label", {
                    htmlFor: _,
                    className: nh("flex flex-col grow-1 gap-xsmall", !b && "cursor-pointer")
                }, P().createElement("span", {
                    className: nh(oE[v], ov[v], "content-emphasis")
                }, i), c && P().createElement("span", {
                    id: A,
                    className: nh(E ? oE[v] : "text-body-medium", "content-default")
                }, c));
            return P().createElement("div", {
                className: nh("foundation-web-checkbox flex gap-medium", b && "opacity-[0.5]", !b && "cursor-pointer", o)
            }, "End" === g && T, P().createElement("div", {
                className: nh(op[v])
            }, P().createElement(ou, er({
                "data-slot": "checkbox",
                className: nh(om[v], nf, !b && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
                id: _,
                checked: u,
                disabled: b,
                onCheckedChange: h,
                "aria-label": i,
                "aria-describedby": [m, A].filter(Boolean).join(" ") || void 0
            }, p), P().createElement(nm, null), P().createElement(ol, {
                "data-slot": "checkbox-indicator",
                className: nh(om[v], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
            }))), "Start" === g && T)
        },
        ob = "Label.Free",
        oy = "Label.TimedOptionDaysTimerStartsWhenYouBuy",
        o_ = function(e) {
            var t = e.translate,
                n = e.price,
                r = e.color,
                a = void 0 === r ? "" : r,
                i = e.useFreeText;
            return 0 === n && (void 0 === i || i) ? (0, na.jsx)("span", {
                className: "text-robux text-free",
                children: t(ob)
            }) : (0, na.jsxs)(P().Fragment, {
                children: [(0, na.jsx)("span", {
                    className: "icon-robux".concat(a ? "-".concat(a) : "", "-16x16")
                }), (0, na.jsx)("span", {
                    className: "text-robux text-body-medium",
                    style: {
                        marginLeft: "0.25rem"
                    },
                    children: (0, ne.formatNumber)(n)
                })]
            })
        },
        oA = function(e) {
            var t = e.translate,
                n = e.titleText,
                r = e.currentRobuxBalance;
            return (0, na.jsxs)("div", {
                id: "rbx-unified-purchase-heading",
                className: "flex flex-row items-center justify-between",
                style: {
                    paddingRight: 42
                },
                children: [(0, na.jsx)("span", {
                    className: "text-heading-medium",
                    children: n
                }), "number" == typeof r && (0, na.jsx)("div", {
                    className: "flex flex-row items-center",
                    children: (0, na.jsx)(o_, {
                        translate: t,
                        price: r,
                        color: "",
                        useFreeText: !1
                    })
                })]
            })
        },
        oC = function(e) {
            var t = e.name;
            return (0, na.jsx)("span", {
                className: "font-bold",
                children: t
            })
        };

    function oP(e) {
        var t = e.translate,
            n = e.price,
            r = e.color,
            a = e.useFreeText;
        return 0 === n && (void 0 === a || a) ? (0, na.jsx)("span", {
            children: t(ob)
        }) : (0, na.jsxs)("span", {
            className: "text-no-wrap",
            children: [(0, na.jsx)(nv, {
                name: "icon-regular-robux",
                size: "Small",
                className: "text-align-y-center margin-right-[2px]".concat("gray" === (void 0 === r ? "" : r) ? " content-muted" : "")
            }), (0, na.jsx)("span", {
                children: (0, ne.formatNumber)(n)
            })]
        })
    }

    function oT(e) {
        var t = e.translate,
            n = nd(e, ["translate"]);
        return (0, na.jsx)(iS, {
            translate: t,
            namespaces: iH,
            useTranslate: iG,
            render: function(e) {
                return (0, na.jsx)(oP, eg(er({}, n), {
                    translate: e
                }))
            }
        })
    }
    var oS = function(e) {
            var t = e.translate,
                n = e.thumbnail,
                r = e.assetName,
                a = e.expectedPrice,
                i = e.displayPrice,
                o = e.priceSuffix,
                u = (e.thumbnailSizePx, e.rentalOptionDays),
                s = void 0 === u ? null : u,
                l = e.discountInformation,
                c = (null == l ? void 0 : l.originalPrice) != null && l.originalPrice > a;
            return (0, na.jsxs)("div", {
                className: "flex flex-row items-center gap-large",
                children: [(0, na.jsxs)("div", {
                    className: "relative shrink-0 unified-modal-thumbnail-container",
                    style: {
                        maxWidth: "40vw",
                        maxHeight: "40vw"
                    },
                    children: [(0, na.jsx)("div", {
                        className: "rounded",
                        style: {
                            width: "100%",
                            height: "100%",
                            backgroundColor: "rgba(255,255,255,0.06)"
                        }
                    }), (0, na.jsx)("div", {
                        className: "absolute unified-modal-thumbnail",
                        style: {
                            inset: 0,
                            display: "flex",
                            alignItems: "center",
                            justifyContent: "center"
                        },
                        children: n
                    })]
                }), (0, na.jsxs)("div", {
                    className: "min-w-0 flex flex-col gap-small",
                    children: [(0, na.jsx)("span", {
                        className: "text-body-large break-words",
                        children: (0, na.jsx)(oC, {
                            name: r
                        })
                    }), null != s && s > 0 && (0, na.jsxs)("div", {
                        className: "flex flex-row items-center gap-small",
                        children: [(0, na.jsx)(nv, {
                            name: "icon-regular-clock"
                        }), (0, na.jsx)("span", {
                            children: t(oy, {
                                days: s
                            }) || "".concat(s, " days (Timer starts when you buy)")
                        })]
                    }), function() {
                        if (c) {
                            var e;
                            return (0, na.jsxs)("div", {
                                className: "flex flex-row items-center flex-wrap gap-x-small",
                                children: [(0, na.jsxs)("span", {
                                    className: "flex flex-row items-center",
                                    children: [(0, na.jsx)(oT, {
                                        translate: t,
                                        price: a,
                                        color: "",
                                        useFreeText: !1
                                    }), o && (0, na.jsx)("span", {
                                        className: "text-robux",
                                        children: o
                                    })]
                                }), (0, na.jsxs)("span", {
                                    className: "flex flex-row items-center",
                                    style: {
                                        textDecoration: "line-through",
                                        opacity: .6
                                    },
                                    children: [(0, na.jsx)(oT, {
                                        translate: t,
                                        price: null != (e = l.originalPrice) ? e : 0,
                                        color: "",
                                        useFreeText: !1
                                    }), o && (0, na.jsx)("span", {
                                        className: "text-robux",
                                        children: o
                                    })]
                                })]
                            })
                        }
                        return i ? (0, na.jsx)("div", {
                            className: "flex flex-row items-center",
                            children: (0, na.jsxs)("span", {
                                className: "text-robux",
                                children: [i, o]
                            })
                        }) : (0, na.jsxs)("div", {
                            className: "flex flex-row items-center",
                            children: [(0, na.jsx)(oT, {
                                translate: t,
                                price: a,
                                color: "",
                                useFreeText: !1
                            }), o && (0, na.jsx)("span", {
                                className: "text-robux",
                                children: o
                            })]
                        })
                    }()]
                })]
            })
        },
        ox = (0, C.createContext)(null),
        oR = (0, C.createContext)(null),
        oB = {
            XSmall: "min-height-600",
            Small: "min-height-800",
            Medium: "min-height-1000",
            Large: "min-height-1200"
        },
        oI = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-xsmall",
            Medium: "padding-y-small",
            Large: "padding-y-small"
        },
        oN = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium",
            Large: "text-title-large"
        },
        ow = {
            XSmall: "size-300",
            Small: "size-400",
            Medium: "size-500",
            Large: "size-600"
        },
        oU = (0, C.forwardRef)(function(e, t) {
            var n = e.children,
                r = e.className,
                a = e.size,
                i = void 0 === a ? "Medium" : a,
                o = e.hasDivider,
                u = void 0 !== o && o,
                s = e.isContained,
                l = void 0 !== s && s,
                c = e.isDisabled,
                d = void 0 !== c && c,
                h = (0, C.useMemo)(function() {
                    return {
                        size: i,
                        hasDivider: u,
                        isContained: l,
                        isDisabled: d
                    }
                }, [i, u, l, d]);
            return P().createElement(ox.Provider, {
                value: h
            }, P().createElement("div", {
                ref: t,
                className: nh("foundation-web-accordion", "flex flex-col items-start width-full", u && "[&>*:not(:last-child)]:[border-bottom:1px_solid_var(--color-stroke-default)]", r)
            }, n))
        }),
        oD = (0, C.forwardRef)(function(e, t) {
            var n = e.children,
                r = e.className,
                a = e.isDisabled,
                i = void 0 !== a && a,
                o = e.defaultOpen,
                u = e.isOpen,
                s = e.onOpenChange,
                l = (0, C.useContext)(ox),
                c = K((0, C.useState)(void 0 !== o && o), 2),
                d = c[0],
                h = c[1],
                f = null != u ? u : d,
                m = i2("fui-a-");
            if (!l) throw Error("AccordionItem must be used within Accordion");
            var p = l.isContained,
                E = l.isDisabled,
                v = (0, C.useCallback)(function(e) {
                    i || E || (void 0 === u && h(e), null == s || s(e))
                }, [i, E, u, s]),
                g = (0, C.useMemo)(function() {
                    return {
                        isOpen: f,
                        setOpen: v,
                        isDisabled: i,
                        triggerId: "".concat(m, "-trigger"),
                        contentId: "".concat(m, "-content")
                    }
                }, [f, v, i, m]);
            return P().createElement(oR.Provider, {
                value: g
            }, P().createElement("div", {
                ref: t,
                "data-contained": p,
                "data-state": f ? "open" : "closed",
                className: nh("foundation-web-accordion-item", "width-full", r)
            }, n))
        }),
        oO = function(e) {
            var t = e.children,
                n = e.className,
                r = (0, C.useContext)(ox),
                a = (0, C.useContext)(oR);
            if (!r) throw Error("AccordionItemTrigger must be used within Accordion");
            if (!a) throw Error("AccordionItemTrigger must be used within AccordionItem");
            var i = r.size,
                o = r.isContained,
                u = r.isDisabled,
                s = a.isOpen,
                l = a.setOpen,
                c = a.isDisabled,
                d = u || c;
            return P().createElement("button", {
                id: a.triggerId,
                type: "button",
                className: nh(nf, "relative flex items-center justify-between gap-small cursor-pointer content-default bg-none stroke-none width-full", oB[i], oI[i], o ? "padding-x-medium" : "padding-x-none", d && ["opacity-[0.5]", "pointer-events-none"], n),
                "aria-expanded": s,
                "aria-controls": a.contentId,
                onClick: function(e) {
                    e.preventDefault(), d || l(!s)
                }
            }, P().createElement(nm, null), P().createElement("div", {
                className: "flex items-center min-width-0 grow-1"
            }, P().createElement("span", {
                className: nh("text-align-x-left", oN[i])
            }, t)), P().createElement("span", {
                className: nh("foundation-web-accordion-chevron shrink-0", ow[i], "icon icon-regular-chevron-large-down", "motion-safe:transition-transform duration-200"),
                style: {
                    transform: s ? "rotate(180deg)" : "rotate(0deg)"
                }
            }))
        },
        oF = function(e) {
            var t = e.children,
                n = e.className,
                r = (0, C.useContext)(ox),
                a = (0, C.useContext)(oR);
            if (!r) throw Error("AccordionItemContent must be used within Accordion");
            if (!a) throw Error("AccordionItemContent must be used within AccordionItem");
            var i = r.size,
                o = a.isOpen ? {} : {
                    inert: "inert"
                };
            return P().createElement("div", eg(er({
                id: a.contentId,
                role: "region",
                "aria-labelledby": a.triggerId,
                "aria-hidden": !a.isOpen,
                "data-state": a.isOpen ? "open" : "closed",
                "data-size": i.toLowerCase()
            }, o), {
                className: nh("foundation-web-accordion-content grid clip width-full motion-safe:transition-all duration-200 ease-standard-out")
            }), P().createElement("div", {
                className: nh("foundation-web-accordion-content-inner width-full min-height-0 clip padding-top-none padding-bottom-none motion-safe:transition-transform duration-200", !a.isOpen && "pointer-events-none", n)
            }, t))
        },
        oM = "__FN_nvfToKPAOuiV__",
        oL = new RegExp("".concat(oM, "(\\d+)\\|")),
        ok = function(e, t, n, r) {
            var a = er({}, r),
                i = {};
            null == n || n.forEach(function(e, t) {
                var n = t.toString(),
                    r = "".concat(oM).concat(n, "|"),
                    o = "".concat("__FN_END_nvfToKPAOuiV__").concat(n, "|");
                a[e.opening] = r, a[e.closing] = o, i[n] = {
                    start: r,
                    end: o,
                    render: e.render,
                    used: !1
                }
            });
            var o = e(t, a),
                u = function(e) {
                    var n = [],
                        r = oL.exec(e);
                    if (!r) return [e];
                    r.index > 0 && n.push(e.slice(0, r.index));
                    var a = r[1] && i[r[1]];
                    if (!a) return console.warn("Unexpected malformed segment", t), [];
                    a.used = !0;
                    var o = e.indexOf(a.end);
                    if (-1 === o) return console.warn("Unexpected malformed segment", t), [];
                    var s = e.slice(r.index + r[0].length, o),
                        l = a.render(u(s));
                    Array.isArray(l) ? n.push.apply(n, q(l)) : n.push(l);
                    var c = e.slice(o + a.end.length);
                    return c.length > 0 && n.push.apply(n, q(u(c))), n
                },
                s = u(o).filter(function(e) {
                    return "" !== e
                });
            return Object.values(i).some(function(e) {
                return !e.used
            }) ? (console.warn("Unused segments found", t), []) : s.map(function(e, t) {
                return (0, na.jsx)(C.Fragment, {
                    children: e
                }, t)
            })
        };

    function oH(e) {
        return !!(null == e ? void 0 : e.some(function(e) {
            return "ROBLOX_PLUS" === e.discountType || "BlackbirdSubscription" === e.discountCampaign || "RobloxPlusSubscription" === e.discountCampaign || "RobloxSubscription" === e.discountCampaign
        }))
    }
    var oG = String.fromCodePoint(57346),
        oj = RegExp("".concat(oG, "|\\\\u\\{E002\\}|\\\\uE002"), "gi"),
        oW = function(e) {
            var t = e.text,
                n = e.className,
                r = e.id;
            return (0, na.jsx)("span", {
                id: r,
                className: nh("inline", n),
                children: function(e) {
                    if (oj.lastIndex = 0, !oj.test(e)) return [e];
                    for (var t = [], n = 0, r = RegExp(oj.source, "gi"), a = r.exec(e); a;) {
                        var i = a.index;
                        i > n && t.push(e.slice(n, i)), t.push((0, na.jsx)("span", {
                            className: "icon-robux-16x16 inline-block align-text-bottom",
                            "aria-hidden": !0
                        }, "robux-icon-".concat(i))), n = i + a[0].length, a = r.exec(e)
                    }
                    return n < e.length && t.push(e.slice(n)), t
                }(t)
            })
        },
        oV = function(e) {
            var t = e.amount,
                n = Math.abs(t);
            return (0, na.jsxs)(P().Fragment, {
                children: [t < 0 && (0, na.jsx)("span", {
                    className: "text-robux",
                    children: "-"
                }), (0, na.jsx)("span", {
                    className: "icon-robux-16x16"
                }), (0, na.jsx)("span", {
                    className: "text-robux",
                    children: (0, ne.formatNumber)(n)
                })]
            })
        },
        oX = function(e) {
            var t = e.translate,
                n = e.normalizedDiscount,
                r = e.savingsSummary,
                a = n.savedAmount,
                i = n.originalPrice,
                o = n.totalPrice,
                u = n.discountLines,
                s = K((0, C.useState)(!1), 2),
                l = s[0],
                c = s[1],
                d = oH(u),
                h = null == r ? void 0 : r.trim(),
                f = [{
                    opening: "amountStart",
                    closing: "amountEnd",
                    render: function() {
                        return (0, na.jsx)(oV, {
                            amount: a
                        })
                    }
                }],
                m = function(e) {
                    var n;
                    return oH([e]) ? e.localizedAttribution ? (0, na.jsx)(oW, {
                        text: e.localizedAttribution
                    }) : t("Label.PlusBenefitDiscount", {
                        discountPercent: String(null != (n = e.discountPercent) ? n : 0)
                    }) : (0, na.jsx)(oW, {
                        text: e.label
                    })
                };
            return (0, na.jsx)(oU, {
                className: "text-body-medium padding-none stroke-default stroke-thick radius-medium",
                children: (0, na.jsxs)(oD, {
                    isOpen: l,
                    onOpenChange: c,
                    children: [(0, na.jsx)(oO, {
                        className: nh("!padding-medium bg-shift-100 width-full flex flex-row items-center justify-between", l && "[border-bottom-left-radius:0] [border-bottom-right-radius:0]"),
                        children: (0, na.jsxs)("div", {
                            className: "flex flex-row items-center gap-x-small content-emphasis",
                            children: [d && !h && (0, na.jsx)(nv, {
                                name: "icon-regular-roblox-plus",
                                size: "Medium"
                            }), (0, na.jsx)("span", {
                                children: h ? (0, na.jsx)(oW, {
                                    text: h
                                }) : d ? ok(t, "Description.SavingWithPlus", f, {
                                    robuxAmount: (0, ne.formatNumber)(a)
                                }) : t("Description.SavingRobux", {
                                    robuxAmount: (0, ne.formatNumber)(a)
                                })
                            })]
                        })
                    }), (0, na.jsxs)(oF, {
                        className: "!padding-none",
                        children: [(0, na.jsxs)("div", {
                            className: "padding-medium padding-bottom-small flex flex-col gap-y-small bg-shift-100 stroke-default stroke-thick",
                            style: {
                                borderTop: "0px",
                                borderLeft: "0px",
                                borderRight: "0px"
                            },
                            children: [(0, na.jsxs)("div", {
                                className: "flex flex-row items-center justify-between content-default",
                                children: [(0, na.jsx)("span", {
                                    children: t("Label.Subtotal")
                                }), (0, na.jsx)("span", {
                                    className: "flex flex-row items-center",
                                    children: (0, na.jsx)(oV, {
                                        amount: i
                                    })
                                })]
                            }), u.map(function(e, t) {
                                var n;
                                return (0, na.jsxs)("div", {
                                    className: "flex flex-row items-center justify-between content-default",
                                    children: [(0, na.jsx)("span", {
                                        children: m(e)
                                    }), (0, na.jsx)("span", {
                                        className: "flex flex-row items-center",
                                        children: (0, na.jsx)(oV, {
                                            amount: -e.discountAmount
                                        })
                                    })]
                                }, "".concat(null != (n = e.discountCampaign) ? n : "discount", "-").concat(t))
                            })]
                        }), (0, na.jsxs)("div", {
                            className: "padding-medium flex flex-row items-center justify-between text-heading-small content-default bg-shift-100",
                            children: [(0, na.jsx)("span", {
                                children: t("Label.Total")
                            }), (0, na.jsx)("span", {
                                className: "flex flex-row items-center",
                                children: (0, na.jsx)(oV, {
                                    amount: o
                                })
                            })]
                        })]
                    })]
                })
            })
        },
        oz = {
            Neutral: "bg-shift-200",
            Standard: "bg-shift-200",
            Contrast: "bg-system-contrast",
            Emphasis: "bg-system-emphasis",
            Success: "bg-[rgb(from_var(--color-system-success)_r_g_b_/_0.2)]",
            Warning: "bg-[rgb(from_var(--color-system-warning)_r_g_b_/_0.2)]",
            Alert: "bg-[rgb(from_var(--color-system-alert)_r_g_b_/_0.2)]",
            OverMediaLight: "bg-[var(--light-mode-over-media-0)]",
            OverMedia: "bg-over-media-0"
        },
        oK = {
            Neutral: "content-emphasis",
            Standard: "content-emphasis",
            Contrast: "content-inverse-emphasis",
            Emphasis: "content-[var(--dark-mode-content-emphasis)]",
            Success: "content-emphasis",
            Warning: "content-emphasis",
            Alert: "content-emphasis",
            OverMediaLight: "content-[var(--light-mode-content-emphasis)]",
            OverMedia: "content-emphasis"
        },
        oY = {
            Neutral: "content-emphasis",
            Standard: "content-emphasis",
            Contrast: "content-inverse-emphasis",
            Emphasis: "content-[var(--dark-mode-content-emphasis)]",
            Success: "content-system-success",
            Warning: "content-system-warning",
            Alert: "content-system-alert",
            OverMediaLight: "content-[var(--light-mode-content-emphasis)]",
            OverMedia: "content-emphasis"
        },
        oq = {
            Neutral: "stroke-none",
            Standard: "stroke-none",
            Contrast: "stroke-none",
            Emphasis: "stroke-none",
            Success: "stroke-none",
            Warning: "stroke-none",
            Alert: "stroke-none",
            OverMediaLight: "stroke-none",
            OverMedia: "stroke-none"
        },
        oZ = {
            Small: "height-600",
            XSmall: "height-400"
        },
        oQ = {
            Small: "padding-x-small",
            XSmall: "padding-x-xsmall"
        },
        oJ = {
            Small: "width-600",
            XSmall: "width-400"
        },
        o$ = {
            Small: "text-label-small",
            XSmall: "text-caption-small"
        },
        o0 = {
            Small: "padding-y-xsmall",
            XSmall: "padding-y-none"
        },
        o1 = {
            Small: "XSmall",
            XSmall: "XSmall"
        },
        o2 = {
            Pill: "radius-circle",
            Box: "radius-small"
        },
        o3 = P().forwardRef(function(e, t) {
            var n = np([e, t]),
                r = n[0],
                a = n.slice(1),
                i = r.className,
                o = r.label,
                u = r.variant,
                s = void 0 === u ? "Standard" : u,
                l = r.icon,
                c = r.iconPosition,
                d = void 0 === c ? "Leading" : c,
                h = r.size,
                f = void 0 === h ? "Small" : h,
                m = r.shape,
                p = nd(r, ["className", "label", "variant", "icon", "iconPosition", "size", "shape"]),
                E = K(a, 1)[0],
                v = l && !o,
                g = "padding-x-xxsmall";
            l && (g = "Leading" === d ? "padding-right-xxsmall" : "padding-left-xxsmall");
            var b = l && P().createElement(nv, {
                name: l,
                size: o1[f],
                className: oY[s]
            });
            return P().createElement("div", eg(er({
                ref: E
            }, p), {
                className: nh("foundation-web-badge flex items-center select-none gap-[var(--size-150)]", o2[void 0 === m ? "Pill" : m], oZ[f], v ? [oJ[f], "justify-center"] : ["width-[fit-content]", oQ[f]], oz[s], oK[s], oq[s], i)
            }), "Leading" === d && b, o && P().createElement("span", {
                className: nh("text-no-wrap text-truncate-split", o$[f], o0[f], g, oK[s])
            }, o), "Trailing" === d && b)
        });
    o3.displayName = "Badge";
    var o5 = RegExp("\\s*[(\\uFF08]([^)\\uFF09]*)[)\\uFF09]\\s*$", "u");

    function o6(e) {
        if (!(null == e ? void 0 : e.trim())) return null;
        var t = new Date(e);
        if (Number.isNaN(t.getTime()) || t.getTime() <= Date.now()) return null;
        var n = et(new Date(t.getTime() - 1), {
            month: "short",
            day: "numeric",
            timeZone: "America/Los_Angeles"
        });
        return n.trim() ? n : null
    }
    var o4 = function(e) {
            var t, n, r = e.expirationTimeUtc,
                a = e.translate,
                i = e.id,
                o = (t = function(e) {
                    return a("Label.EndsDate", {
                        date: e
                    }) || "Ends ".concat(e)
                }, (n = o6(r)) ? t(n) : null);
            return o ? (0, na.jsx)(o3, {
                id: i,
                variant: "Neutral",
                size: "Small",
                icon: "icon-regular-clock",
                className: "bg-surface-0 shrink-0",
                label: o,
                "data-testid": "offer-expiration-badge"
            }) : null
        },
        o8 = function(e) {
            var t = e.robuxAmount,
                n = e.price;
            return (0, na.jsx)("div", {
                className: "rounded-xxlarge radius-medium border padding-medium",
                style: {
                    borderColor: "var(--content-action-standard)"
                },
                children: (0, na.jsxs)("div", {
                    className: "flex flex-row items-center justify-between gap-medium",
                    children: [(0, na.jsxs)("div", {
                        className: "flex flex-row items-center",
                        children: [(0, na.jsx)("span", {
                            className: "icon-robux-16x16"
                        }), (0, na.jsx)("span", {
                            className: "text-heading-small margin-left-xsmall",
                            children: (0, ne.formatNumber)(t)
                        })]
                    }), (0, na.jsx)("div", {
                        className: "text-label-large",
                        children: n
                    })]
                })
            })
        },
        o9 = function(e, t) {
            (0, C.useEffect)(function() {
                t && iZ("".concat("RenderTracking", "-").concat("Purchase", "-").concat(e))
            }, [t])
        },
        o7 = function(e) {
            var t, n, r, a, i, o, u, s, l, c, d, h, f, m, p, E, v, g, b, y, _, A, T, S, x, R, B, I, N, U, D, O, F, M, k, H, G, j = e.translate,
                W = e.expectedPrice,
                V = e.thumbnail,
                X = e.assetName,
                z = e.onAction,
                Y = e.onCancel,
                q = e.loading,
                Z = e.currentRobuxBalance,
                Q = e.open,
                J = void 0 !== Q && Q,
                $ = e.robuxPackageAmount,
                et = e.robuxPackagePrice,
                en = e.priceSuffix,
                ea = e.title,
                ei = e.discountInformation,
                eo = e.collectibleItemId,
                eu = e.rentalOptionDays,
                el = e.isLimited,
                ec = e.packageLoading,
                ed = void 0 !== ec && ec,
                eh = e.onRefetchPackage,
                ef = e.onAcceptOffers,
                em = e.onDirectPurchase,
                ep = (0, C.useCallback)(function(e) {
                    null == eh || eh(null != e ? e : W)
                }, [eh, W]),
                eE = (s = void 0 === (u = (o = {
                    collectibleItemId: void 0 === eo ? null : eo,
                    rentalOptionDays: void 0 === eu ? null : eu,
                    expectedPrice: W,
                    isLimitedItem: void 0 !== el && el,
                    open: J,
                    onPriceResolved: ep
                }).collectibleItemId) ? null : u, c = void 0 === (l = o.rentalOptionDays) ? null : l, d = o.expectedPrice, h = o.isLimitedItem, m = void 0 !== (f = o.open) && f, p = o.onPriceResolved, E = null != d && d <= 0 || void 0 !== h && h, g = (v = K((0, C.useState)([]), 2))[0], b = v[1], y = (0, C.useRef)([]), (0, C.useEffect)(function() {
                    y.current = g
                }, [g]), A = (_ = K((0, C.useState)(), 2))[0], T = _[1], x = (S = K((0, C.useState)(void 0), 2))[0], R = S[1], I = (B = K((0, C.useState)(), 2))[0], N = B[1], D = (U = K((0, C.useState)(!1), 2))[0], O = U[1], F = (0, C.useRef)(0), M = (0, C.useRef)(p), (0, C.useEffect)(function() {
                    M.current = p
                }, [p]), k = (0, C.useCallback)(function(e) {
                    return w(function() {
                        var t, n, r, a, i, o, u, l, d, h;
                        return L(this, function(f) {
                            var m, p, v;
                            switch (f.label) {
                                case 0:
                                    if (!s || E) return [2];
                                    t = F.current + 1, F.current = t, O(!0), f.label = 1;
                                case 1:
                                    return f.trys.push([1, , 3, 4]), [4, (m = er({
                                        featureKey: "MARKETPLACE_CART",
                                        items: [null != c && c > 0 ? {
                                            collectibleItemId: s,
                                            rentalDays: c
                                        } : {
                                            collectibleItemId: s,
                                            isPermanent: !0
                                        }]
                                    }, (null == e ? void 0 : e.length) ? {
                                        unselectedOffers: e
                                    } : {}), w(function() {
                                        var e, t, n;
                                        return L(this, function(r) {
                                            switch (r.label) {
                                                case 0:
                                                    e = {
                                                        url: "".concat(es.EnvironmentUrls.apiGatewayUrl, "/marketplace-sales/v1/cart-pricing"),
                                                        withCredentials: !0
                                                    }, r.label = 1;
                                                case 1:
                                                    return r.trys.push([1, 3, , 4]), [4, t$.post(e, m)];
                                                case 2:
                                                    if (200 !== (n = r.sent()).status) return [2, null];
                                                    return [2, null != (t = n.data) ? t : null];
                                                case 3:
                                                    return r.sent(), [2, null];
                                                case 4:
                                                    return [2]
                                            }
                                        })
                                    })())];
                                case 2:
                                    if (d = f.sent(), t !== F.current) return [2];
                                    if (!d) return N(void 0), [2];
                                    return (null == (h = null != (n = null == (i = d.items) ? void 0 : i.find(function(e) {
                                        return e.collectibleItemId === s
                                    })) ? n : null == (o = d.items) ? void 0 : o[0]) ? void 0 : h.priceInRobux) != null && T(h.priceInRobux), R(null != (r = null == h ? void 0 : h.discountInformation) ? r : null), N((null == (u = d.savingsSummary) ? void 0 : u.trim()) || void 0), null == (l = M.current) || l.call(M, null != (a = null == h ? void 0 : h.priceInRobux) ? a : void 0), b(null != (v = null == (p = d.availableOffers) ? void 0 : p.reduce(function(e, t) {
                                        var n = null == (a = t.localizedDescription) ? void 0 : a.trim();
                                        if (t.offerId && n) {
                                            var r, a, i, o, u = (null == (o = t.expirationTimeUtc) ? void 0 : o.trim()) || void 0;
                                            e.push(er({
                                                offerId: t.offerId,
                                                localizedText: (r = o6(u)) ? function(e, t) {
                                                    if (!(null == t ? void 0 : t.trim())) return e.trim();
                                                    var n, r, a = o5.exec(e),
                                                        i = null == a ? void 0 : a[1];
                                                    return null !== a && void 0 !== i && (n = i.toLocaleLowerCase(), 0 !== (r = t.toLocaleLowerCase().split(RegExp("[^\\u0041-\\u005A\\u0061-\\u007A\\u00AA\\u00B5\\u00BA\\u00C0-\\u00D6\\u00D8-\\u00F6\\u00F8-\\u02C1\\u02C6-\\u02D1\\u02E0-\\u02E4\\u02EC\\u02EE\\u0370-\\u0374\\u0376-\\u0377\\u037A-\\u037D\\u037F\\u0386\\u0388-\\u038A\\u038C\\u038E-\\u03A1\\u03A3-\\u03F5\\u03F7-\\u0481\\u048A-\\u052F\\u0531-\\u0556\\u0559\\u0560-\\u0588\\u05D0-\\u05EA\\u05EF-\\u05F2\\u0620-\\u064A\\u066E-\\u066F\\u0671-\\u06D3\\u06D5\\u06E5-\\u06E6\\u06EE-\\u06EF\\u06FA-\\u06FC\\u06FF\\u0710\\u0712-\\u072F\\u074D-\\u07A5\\u07B1\\u07CA-\\u07EA\\u07F4-\\u07F5\\u07FA\\u0800-\\u0815\\u081A\\u0824\\u0828\\u0840-\\u0858\\u0860-\\u086A\\u0870-\\u0887\\u0889-\\u088F\\u08A0-\\u08C9\\u0904-\\u0939\\u093D\\u0950\\u0958-\\u0961\\u0971-\\u0980\\u0985-\\u098C\\u098F-\\u0990\\u0993-\\u09A8\\u09AA-\\u09B0\\u09B2\\u09B6-\\u09B9\\u09BD\\u09CE\\u09DC-\\u09DD\\u09DF-\\u09E1\\u09F0-\\u09F1\\u09FC\\u0A05-\\u0A0A\\u0A0F-\\u0A10\\u0A13-\\u0A28\\u0A2A-\\u0A30\\u0A32-\\u0A33\\u0A35-\\u0A36\\u0A38-\\u0A39\\u0A59-\\u0A5C\\u0A5E\\u0A72-\\u0A74\\u0A85-\\u0A8D\\u0A8F-\\u0A91\\u0A93-\\u0AA8\\u0AAA-\\u0AB0\\u0AB2-\\u0AB3\\u0AB5-\\u0AB9\\u0ABD\\u0AD0\\u0AE0-\\u0AE1\\u0AF9\\u0B05-\\u0B0C\\u0B0F-\\u0B10\\u0B13-\\u0B28\\u0B2A-\\u0B30\\u0B32-\\u0B33\\u0B35-\\u0B39\\u0B3D\\u0B5C-\\u0B5D\\u0B5F-\\u0B61\\u0B71\\u0B83\\u0B85-\\u0B8A\\u0B8E-\\u0B90\\u0B92-\\u0B95\\u0B99-\\u0B9A\\u0B9C\\u0B9E-\\u0B9F\\u0BA3-\\u0BA4\\u0BA8-\\u0BAA\\u0BAE-\\u0BB9\\u0BD0\\u0C05-\\u0C0C\\u0C0E-\\u0C10\\u0C12-\\u0C28\\u0C2A-\\u0C39\\u0C3D\\u0C58-\\u0C5A\\u0C5C-\\u0C5D\\u0C60-\\u0C61\\u0C80\\u0C85-\\u0C8C\\u0C8E-\\u0C90\\u0C92-\\u0CA8\\u0CAA-\\u0CB3\\u0CB5-\\u0CB9\\u0CBD\\u0CDC-\\u0CDE\\u0CE0-\\u0CE1\\u0CF1-\\u0CF2\\u0D04-\\u0D0C\\u0D0E-\\u0D10\\u0D12-\\u0D3A\\u0D3D\\u0D4E\\u0D54-\\u0D56\\u0D5F-\\u0D61\\u0D7A-\\u0D7F\\u0D85-\\u0D96\\u0D9A-\\u0DB1\\u0DB3-\\u0DBB\\u0DBD\\u0DC0-\\u0DC6\\u0E01-\\u0E30\\u0E32-\\u0E33\\u0E40-\\u0E46\\u0E81-\\u0E82\\u0E84\\u0E86-\\u0E8A\\u0E8C-\\u0EA3\\u0EA5\\u0EA7-\\u0EB0\\u0EB2-\\u0EB3\\u0EBD\\u0EC0-\\u0EC4\\u0EC6\\u0EDC-\\u0EDF\\u0F00\\u0F40-\\u0F47\\u0F49-\\u0F6C\\u0F88-\\u0F8C\\u1000-\\u102A\\u103F\\u1050-\\u1055\\u105A-\\u105D\\u1061\\u1065-\\u1066\\u106E-\\u1070\\u1075-\\u1081\\u108E\\u10A0-\\u10C5\\u10C7\\u10CD\\u10D0-\\u10FA\\u10FC-\\u1248\\u124A-\\u124D\\u1250-\\u1256\\u1258\\u125A-\\u125D\\u1260-\\u1288\\u128A-\\u128D\\u1290-\\u12B0\\u12B2-\\u12B5\\u12B8-\\u12BE\\u12C0\\u12C2-\\u12C5\\u12C8-\\u12D6\\u12D8-\\u1310\\u1312-\\u1315\\u1318-\\u135A\\u1380-\\u138F\\u13A0-\\u13F5\\u13F8-\\u13FD\\u1401-\\u166C\\u166F-\\u167F\\u1681-\\u169A\\u16A0-\\u16EA\\u16F1-\\u16F8\\u1700-\\u1711\\u171F-\\u1731\\u1740-\\u1751\\u1760-\\u176C\\u176E-\\u1770\\u1780-\\u17B3\\u17D7\\u17DC\\u1820-\\u1878\\u1880-\\u1884\\u1887-\\u18A8\\u18AA\\u18B0-\\u18F5\\u1900-\\u191E\\u1950-\\u196D\\u1970-\\u1974\\u1980-\\u19AB\\u19B0-\\u19C9\\u1A00-\\u1A16\\u1A20-\\u1A54\\u1AA7\\u1B05-\\u1B33\\u1B45-\\u1B4C\\u1B83-\\u1BA0\\u1BAE-\\u1BAF\\u1BBA-\\u1BE5\\u1C00-\\u1C23\\u1C4D-\\u1C4F\\u1C5A-\\u1C7D\\u1C80-\\u1C8A\\u1C90-\\u1CBA\\u1CBD-\\u1CBF\\u1CE9-\\u1CEC\\u1CEE-\\u1CF3\\u1CF5-\\u1CF6\\u1CFA\\u1D00-\\u1DBF\\u1E00-\\u1F15\\u1F18-\\u1F1D\\u1F20-\\u1F45\\u1F48-\\u1F4D\\u1F50-\\u1F57\\u1F59\\u1F5B\\u1F5D\\u1F5F-\\u1F7D\\u1F80-\\u1FB4\\u1FB6-\\u1FBC\\u1FBE\\u1FC2-\\u1FC4\\u1FC6-\\u1FCC\\u1FD0-\\u1FD3\\u1FD6-\\u1FDB\\u1FE0-\\u1FEC\\u1FF2-\\u1FF4\\u1FF6-\\u1FFC\\u2071\\u207F\\u2090-\\u209C\\u2102\\u2107\\u210A-\\u2113\\u2115\\u2119-\\u211D\\u2124\\u2126\\u2128\\u212A-\\u212D\\u212F-\\u2139\\u213C-\\u213F\\u2145-\\u2149\\u214E\\u2183-\\u2184\\u2C00-\\u2CE4\\u2CEB-\\u2CEE\\u2CF2-\\u2CF3\\u2D00-\\u2D25\\u2D27\\u2D2D\\u2D30-\\u2D67\\u2D6F\\u2D80-\\u2D96\\u2DA0-\\u2DA6\\u2DA8-\\u2DAE\\u2DB0-\\u2DB6\\u2DB8-\\u2DBE\\u2DC0-\\u2DC6\\u2DC8-\\u2DCE\\u2DD0-\\u2DD6\\u2DD8-\\u2DDE\\u2E2F\\u3005-\\u3006\\u3031-\\u3035\\u303B-\\u303C\\u3041-\\u3096\\u309D-\\u309F\\u30A1-\\u30FA\\u30FC-\\u30FF\\u3105-\\u312F\\u3131-\\u318E\\u31A0-\\u31BF\\u31F0-\\u31FF\\u3400-\\u4DBF\\u4E00-\\uA48C\\uA4D0-\\uA4FD\\uA500-\\uA60C\\uA610-\\uA61F\\uA62A-\\uA62B\\uA640-\\uA66E\\uA67F-\\uA69D\\uA6A0-\\uA6E5\\uA717-\\uA71F\\uA722-\\uA788\\uA78B-\\uA7DC\\uA7F1-\\uA801\\uA803-\\uA805\\uA807-\\uA80A\\uA80C-\\uA822\\uA840-\\uA873\\uA882-\\uA8B3\\uA8F2-\\uA8F7\\uA8FB\\uA8FD-\\uA8FE\\uA90A-\\uA925\\uA930-\\uA946\\uA960-\\uA97C\\uA984-\\uA9B2\\uA9CF\\uA9E0-\\uA9E4\\uA9E6-\\uA9EF\\uA9FA-\\uA9FE\\uAA00-\\uAA28\\uAA40-\\uAA42\\uAA44-\\uAA4B\\uAA60-\\uAA76\\uAA7A\\uAA7E-\\uAAAF\\uAAB1\\uAAB5-\\uAAB6\\uAAB9-\\uAABD\\uAAC0\\uAAC2\\uAADB-\\uAADD\\uAAE0-\\uAAEA\\uAAF2-\\uAAF4\\uAB01-\\uAB06\\uAB09-\\uAB0E\\uAB11-\\uAB16\\uAB20-\\uAB26\\uAB28-\\uAB2E\\uAB30-\\uAB5A\\uAB5C-\\uAB69\\uAB70-\\uABE2\\uAC00-\\uD7A3\\uD7B0-\\uD7C6\\uD7CB-\\uD7FB\\uF900-\\uFA6D\\uFA70-\\uFAD9\\uFB00-\\uFB06\\uFB13-\\uFB17\\uFB1D\\uFB1F-\\uFB28\\uFB2A-\\uFB36\\uFB38-\\uFB3C\\uFB3E\\uFB40-\\uFB41\\uFB43-\\uFB44\\uFB46-\\uFBB1\\uFBD3-\\uFD3D\\uFD50-\\uFD8F\\uFD92-\\uFDC7\\uFDF0-\\uFDFB\\uFE70-\\uFE74\\uFE76-\\uFEFC\\uFF21-\\uFF3A\\uFF41-\\uFF5A\\uFF66-\\uFFBE\\uFFC2-\\uFFC7\\uFFCA-\\uFFCF\\uFFD2-\\uFFD7\\uFFDA-\\uFFDC\\u{10000}-\\u{1000B}\\u{1000D}-\\u{10026}\\u{10028}-\\u{1003A}\\u{1003C}-\\u{1003D}\\u{1003F}-\\u{1004D}\\u{10050}-\\u{1005D}\\u{10080}-\\u{100FA}\\u{10280}-\\u{1029C}\\u{102A0}-\\u{102D0}\\u{10300}-\\u{1031F}\\u{1032D}-\\u{10340}\\u{10342}-\\u{10349}\\u{10350}-\\u{10375}\\u{10380}-\\u{1039D}\\u{103A0}-\\u{103C3}\\u{103C8}-\\u{103CF}\\u{10400}-\\u{1049D}\\u{104B0}-\\u{104D3}\\u{104D8}-\\u{104FB}\\u{10500}-\\u{10527}\\u{10530}-\\u{10563}\\u{10570}-\\u{1057A}\\u{1057C}-\\u{1058A}\\u{1058C}-\\u{10592}\\u{10594}-\\u{10595}\\u{10597}-\\u{105A1}\\u{105A3}-\\u{105B1}\\u{105B3}-\\u{105B9}\\u{105BB}-\\u{105BC}\\u{105C0}-\\u{105F3}\\u{10600}-\\u{10736}\\u{10740}-\\u{10755}\\u{10760}-\\u{10767}\\u{10780}-\\u{10785}\\u{10787}-\\u{107B0}\\u{107B2}-\\u{107BA}\\u{10800}-\\u{10805}\\u{10808}\\u{1080A}-\\u{10835}\\u{10837}-\\u{10838}\\u{1083C}\\u{1083F}-\\u{10855}\\u{10860}-\\u{10876}\\u{10880}-\\u{1089E}\\u{108E0}-\\u{108F2}\\u{108F4}-\\u{108F5}\\u{10900}-\\u{10915}\\u{10920}-\\u{10939}\\u{10940}-\\u{10959}\\u{10980}-\\u{109B7}\\u{109BE}-\\u{109BF}\\u{10A00}\\u{10A10}-\\u{10A13}\\u{10A15}-\\u{10A17}\\u{10A19}-\\u{10A35}\\u{10A60}-\\u{10A7C}\\u{10A80}-\\u{10A9C}\\u{10AC0}-\\u{10AC7}\\u{10AC9}-\\u{10AE4}\\u{10B00}-\\u{10B35}\\u{10B40}-\\u{10B55}\\u{10B60}-\\u{10B72}\\u{10B80}-\\u{10B91}\\u{10C00}-\\u{10C48}\\u{10C80}-\\u{10CB2}\\u{10CC0}-\\u{10CF2}\\u{10D00}-\\u{10D23}\\u{10D4A}-\\u{10D65}\\u{10D6F}-\\u{10D85}\\u{10E80}-\\u{10EA9}\\u{10EB0}-\\u{10EB1}\\u{10EC2}-\\u{10EC7}\\u{10F00}-\\u{10F1C}\\u{10F27}\\u{10F30}-\\u{10F45}\\u{10F70}-\\u{10F81}\\u{10FB0}-\\u{10FC4}\\u{10FE0}-\\u{10FF6}\\u{11003}-\\u{11037}\\u{11071}-\\u{11072}\\u{11075}\\u{11083}-\\u{110AF}\\u{110D0}-\\u{110E8}\\u{11103}-\\u{11126}\\u{11144}\\u{11147}\\u{11150}-\\u{11172}\\u{11176}\\u{11183}-\\u{111B2}\\u{111C1}-\\u{111C4}\\u{111DA}\\u{111DC}\\u{11200}-\\u{11211}\\u{11213}-\\u{1122B}\\u{1123F}-\\u{11240}\\u{11280}-\\u{11286}\\u{11288}\\u{1128A}-\\u{1128D}\\u{1128F}-\\u{1129D}\\u{1129F}-\\u{112A8}\\u{112B0}-\\u{112DE}\\u{11305}-\\u{1130C}\\u{1130F}-\\u{11310}\\u{11313}-\\u{11328}\\u{1132A}-\\u{11330}\\u{11332}-\\u{11333}\\u{11335}-\\u{11339}\\u{1133D}\\u{11350}\\u{1135D}-\\u{11361}\\u{11380}-\\u{11389}\\u{1138B}\\u{1138E}\\u{11390}-\\u{113B5}\\u{113B7}\\u{113D1}\\u{113D3}\\u{11400}-\\u{11434}\\u{11447}-\\u{1144A}\\u{1145F}-\\u{11461}\\u{11480}-\\u{114AF}\\u{114C4}-\\u{114C5}\\u{114C7}\\u{11580}-\\u{115AE}\\u{115D8}-\\u{115DB}\\u{11600}-\\u{1162F}\\u{11644}\\u{11680}-\\u{116AA}\\u{116B8}\\u{11700}-\\u{1171A}\\u{11740}-\\u{11746}\\u{11800}-\\u{1182B}\\u{118A0}-\\u{118DF}\\u{118FF}-\\u{11906}\\u{11909}\\u{1190C}-\\u{11913}\\u{11915}-\\u{11916}\\u{11918}-\\u{1192F}\\u{1193F}\\u{11941}\\u{119A0}-\\u{119A7}\\u{119AA}-\\u{119D0}\\u{119E1}\\u{119E3}\\u{11A00}\\u{11A0B}-\\u{11A32}\\u{11A3A}\\u{11A50}\\u{11A5C}-\\u{11A89}\\u{11A9D}\\u{11AB0}-\\u{11AF8}\\u{11BC0}-\\u{11BE0}\\u{11C00}-\\u{11C08}\\u{11C0A}-\\u{11C2E}\\u{11C40}\\u{11C72}-\\u{11C8F}\\u{11D00}-\\u{11D06}\\u{11D08}-\\u{11D09}\\u{11D0B}-\\u{11D30}\\u{11D46}\\u{11D60}-\\u{11D65}\\u{11D67}-\\u{11D68}\\u{11D6A}-\\u{11D89}\\u{11D98}\\u{11DB0}-\\u{11DDB}\\u{11EE0}-\\u{11EF2}\\u{11F02}\\u{11F04}-\\u{11F10}\\u{11F12}-\\u{11F33}\\u{11FB0}\\u{12000}-\\u{12399}\\u{12480}-\\u{12543}\\u{12F90}-\\u{12FF0}\\u{13000}-\\u{1342F}\\u{13441}-\\u{13446}\\u{13460}-\\u{143FA}\\u{14400}-\\u{14646}\\u{16100}-\\u{1611D}\\u{16800}-\\u{16A38}\\u{16A40}-\\u{16A5E}\\u{16A70}-\\u{16ABE}\\u{16AD0}-\\u{16AED}\\u{16B00}-\\u{16B2F}\\u{16B40}-\\u{16B43}\\u{16B63}-\\u{16B77}\\u{16B7D}-\\u{16B8F}\\u{16D40}-\\u{16D6C}\\u{16E40}-\\u{16E7F}\\u{16EA0}-\\u{16EB8}\\u{16EBB}-\\u{16ED3}\\u{16F00}-\\u{16F4A}\\u{16F50}\\u{16F93}-\\u{16F9F}\\u{16FE0}-\\u{16FE1}\\u{16FE3}\\u{16FF2}-\\u{16FF3}\\u{17000}-\\u{18CD5}\\u{18CFF}-\\u{18D1E}\\u{18D80}-\\u{18DF2}\\u{1AFF0}-\\u{1AFF3}\\u{1AFF5}-\\u{1AFFB}\\u{1AFFD}-\\u{1AFFE}\\u{1B000}-\\u{1B122}\\u{1B132}\\u{1B150}-\\u{1B152}\\u{1B155}\\u{1B164}-\\u{1B167}\\u{1B170}-\\u{1B2FB}\\u{1BC00}-\\u{1BC6A}\\u{1BC70}-\\u{1BC7C}\\u{1BC80}-\\u{1BC88}\\u{1BC90}-\\u{1BC99}\\u{1D400}-\\u{1D454}\\u{1D456}-\\u{1D49C}\\u{1D49E}-\\u{1D49F}\\u{1D4A2}\\u{1D4A5}-\\u{1D4A6}\\u{1D4A9}-\\u{1D4AC}\\u{1D4AE}-\\u{1D4B9}\\u{1D4BB}\\u{1D4BD}-\\u{1D4C3}\\u{1D4C5}-\\u{1D505}\\u{1D507}-\\u{1D50A}\\u{1D50D}-\\u{1D514}\\u{1D516}-\\u{1D51C}\\u{1D51E}-\\u{1D539}\\u{1D53B}-\\u{1D53E}\\u{1D540}-\\u{1D544}\\u{1D546}\\u{1D54A}-\\u{1D550}\\u{1D552}-\\u{1D6A5}\\u{1D6A8}-\\u{1D6C0}\\u{1D6C2}-\\u{1D6DA}\\u{1D6DC}-\\u{1D6FA}\\u{1D6FC}-\\u{1D714}\\u{1D716}-\\u{1D734}\\u{1D736}-\\u{1D74E}\\u{1D750}-\\u{1D76E}\\u{1D770}-\\u{1D788}\\u{1D78A}-\\u{1D7A8}\\u{1D7AA}-\\u{1D7C2}\\u{1D7C4}-\\u{1D7CB}\\u{1DF00}-\\u{1DF1E}\\u{1DF25}-\\u{1DF2A}\\u{1E030}-\\u{1E06D}\\u{1E100}-\\u{1E12C}\\u{1E137}-\\u{1E13D}\\u{1E14E}\\u{1E290}-\\u{1E2AD}\\u{1E2C0}-\\u{1E2EB}\\u{1E4D0}-\\u{1E4EB}\\u{1E5D0}-\\u{1E5ED}\\u{1E5F0}\\u{1E6C0}-\\u{1E6DE}\\u{1E6E0}-\\u{1E6E2}\\u{1E6E4}-\\u{1E6E5}\\u{1E6E7}-\\u{1E6ED}\\u{1E6F0}-\\u{1E6F4}\\u{1E6FE}-\\u{1E6FF}\\u{1E7E0}-\\u{1E7E6}\\u{1E7E8}-\\u{1E7EB}\\u{1E7ED}-\\u{1E7EE}\\u{1E7F0}-\\u{1E7FE}\\u{1E800}-\\u{1E8C4}\\u{1E900}-\\u{1E943}\\u{1E94B}\\u{1EE00}-\\u{1EE03}\\u{1EE05}-\\u{1EE1F}\\u{1EE21}-\\u{1EE22}\\u{1EE24}\\u{1EE27}\\u{1EE29}-\\u{1EE32}\\u{1EE34}-\\u{1EE37}\\u{1EE39}\\u{1EE3B}\\u{1EE42}\\u{1EE47}\\u{1EE49}\\u{1EE4B}\\u{1EE4D}-\\u{1EE4F}\\u{1EE51}-\\u{1EE52}\\u{1EE54}\\u{1EE57}\\u{1EE59}\\u{1EE5B}\\u{1EE5D}\\u{1EE5F}\\u{1EE61}-\\u{1EE62}\\u{1EE64}\\u{1EE67}-\\u{1EE6A}\\u{1EE6C}-\\u{1EE72}\\u{1EE74}-\\u{1EE77}\\u{1EE79}-\\u{1EE7C}\\u{1EE7E}\\u{1EE80}-\\u{1EE89}\\u{1EE8B}-\\u{1EE9B}\\u{1EEA1}-\\u{1EEA3}\\u{1EEA5}-\\u{1EEA9}\\u{1EEAB}-\\u{1EEBB}\\u{20000}-\\u{2A6DF}\\u{2A700}-\\u{2B81D}\\u{2B820}-\\u{2CEAD}\\u{2CEB0}-\\u{2EBE0}\\u{2EBF0}-\\u{2EE5D}\\u{2F800}-\\u{2FA1D}\\u{30000}-\\u{3134A}\\u{31350}-\\u{33479}\\u0030-\\u0039\\u00B2-\\u00B3\\u00B9\\u00BC-\\u00BE\\u0660-\\u0669\\u06F0-\\u06F9\\u07C0-\\u07C9\\u0966-\\u096F\\u09E6-\\u09EF\\u09F4-\\u09F9\\u0A66-\\u0A6F\\u0AE6-\\u0AEF\\u0B66-\\u0B6F\\u0B72-\\u0B77\\u0BE6-\\u0BF2\\u0C66-\\u0C6F\\u0C78-\\u0C7E\\u0CE6-\\u0CEF\\u0D58-\\u0D5E\\u0D66-\\u0D78\\u0DE6-\\u0DEF\\u0E50-\\u0E59\\u0ED0-\\u0ED9\\u0F20-\\u0F33\\u1040-\\u1049\\u1090-\\u1099\\u1369-\\u137C\\u16EE-\\u16F0\\u17E0-\\u17E9\\u17F0-\\u17F9\\u1810-\\u1819\\u1946-\\u194F\\u19D0-\\u19DA\\u1A80-\\u1A89\\u1A90-\\u1A99\\u1B50-\\u1B59\\u1BB0-\\u1BB9\\u1C40-\\u1C49\\u1C50-\\u1C59\\u2070\\u2074-\\u2079\\u2080-\\u2089\\u2150-\\u2182\\u2185-\\u2189\\u2460-\\u249B\\u24EA-\\u24FF\\u2776-\\u2793\\u2CFD\\u3007\\u3021-\\u3029\\u3038-\\u303A\\u3192-\\u3195\\u3220-\\u3229\\u3248-\\u324F\\u3251-\\u325F\\u3280-\\u3289\\u32B1-\\u32BF\\uA620-\\uA629\\uA6E6-\\uA6EF\\uA830-\\uA835\\uA8D0-\\uA8D9\\uA900-\\uA909\\uA9D0-\\uA9D9\\uA9F0-\\uA9F9\\uAA50-\\uAA59\\uABF0-\\uABF9\\uFF10-\\uFF19\\u{10107}-\\u{10133}\\u{10140}-\\u{10178}\\u{1018A}-\\u{1018B}\\u{102E1}-\\u{102FB}\\u{10320}-\\u{10323}\\u{10341}\\u{1034A}\\u{103D1}-\\u{103D5}\\u{104A0}-\\u{104A9}\\u{10858}-\\u{1085F}\\u{10879}-\\u{1087F}\\u{108A7}-\\u{108AF}\\u{108FB}-\\u{108FF}\\u{10916}-\\u{1091B}\\u{109BC}-\\u{109BD}\\u{109C0}-\\u{109CF}\\u{109D2}-\\u{109FF}\\u{10A40}-\\u{10A48}\\u{10A7D}-\\u{10A7E}\\u{10A9D}-\\u{10A9F}\\u{10AEB}-\\u{10AEF}\\u{10B58}-\\u{10B5F}\\u{10B78}-\\u{10B7F}\\u{10BA9}-\\u{10BAF}\\u{10CFA}-\\u{10CFF}\\u{10D30}-\\u{10D39}\\u{10D40}-\\u{10D49}\\u{10E60}-\\u{10E7E}\\u{10F1D}-\\u{10F26}\\u{10F51}-\\u{10F54}\\u{10FC5}-\\u{10FCB}\\u{11052}-\\u{1106F}\\u{110F0}-\\u{110F9}\\u{11136}-\\u{1113F}\\u{111D0}-\\u{111D9}\\u{111E1}-\\u{111F4}\\u{112F0}-\\u{112F9}\\u{11450}-\\u{11459}\\u{114D0}-\\u{114D9}\\u{11650}-\\u{11659}\\u{116C0}-\\u{116C9}\\u{116D0}-\\u{116E3}\\u{11730}-\\u{1173B}\\u{118E0}-\\u{118F2}\\u{11950}-\\u{11959}\\u{11BF0}-\\u{11BF9}\\u{11C50}-\\u{11C6C}\\u{11D50}-\\u{11D59}\\u{11DA0}-\\u{11DA9}\\u{11DE0}-\\u{11DE9}\\u{11F50}-\\u{11F59}\\u{11FC0}-\\u{11FD4}\\u{12400}-\\u{1246E}\\u{16130}-\\u{16139}\\u{16A60}-\\u{16A69}\\u{16AC0}-\\u{16AC9}\\u{16B50}-\\u{16B59}\\u{16B5B}-\\u{16B61}\\u{16D70}-\\u{16D79}\\u{16E80}-\\u{16E96}\\u{16FF4}-\\u{16FF6}\\u{1CCF0}-\\u{1CCF9}\\u{1D2C0}-\\u{1D2D3}\\u{1D2E0}-\\u{1D2F3}\\u{1D360}-\\u{1D378}\\u{1D7CE}-\\u{1D7FF}\\u{1E140}-\\u{1E149}\\u{1E2F0}-\\u{1E2F9}\\u{1E4F0}-\\u{1E4F9}\\u{1E5F1}-\\u{1E5FA}\\u{1E8C7}-\\u{1E8CF}\\u{1E950}-\\u{1E959}\\u{1EC71}-\\u{1ECAB}\\u{1ECAD}-\\u{1ECAF}\\u{1ECB1}-\\u{1ECB4}\\u{1ED01}-\\u{1ED2D}\\u{1ED2F}-\\u{1ED3D}\\u{1F100}-\\u{1F10C}\\u{1FBF0}-\\u{1FBF9}]+", "u")).filter(function(e) {
                                                        return e.length > 0
                                                    })).length && r.every(function(e) {
                                                        return RegExp("^\\d+$", "u").test(e) ? RegExp("(?:^|\\D)".concat(e, "(?:\\D|$)"), "u").test(n) : n.includes(e)
                                                    })) ? e.slice(0, a.index).trim() : e.trim()
                                                }(n, r) : n,
                                                selected: null != (i = t.selected) && i
                                            }, u ? {
                                                expirationTimeUtc: u
                                            } : {}))
                                        }
                                        return e
                                    }, [])) ? v : []), [3, 4];
                                case 3:
                                    return t === F.current && O(!1), [7];
                                case 4:
                                    return [2]
                            }
                        })
                    })()
                }, [s, c, E]), (0, C.useEffect)(function() {
                    if (!m) {
                        F.current += 1, T(void 0), R(void 0), N(void 0), b([]), O(!1);
                        return
                    }
                    s && !E && k().catch(function() {})
                }, [m, s, E, k]), H = (0, C.useCallback)(function(e, t) {
                    var n = y.current.map(function(n) {
                        return n.offerId === e ? eg(er({}, n), {
                            selected: t
                        }) : n
                    });
                    y.current = n, b(n);
                    var r = n.filter(function(e) {
                        return !e.selected
                    }).map(function(e) {
                        return e.offerId
                    });
                    k(r.length ? r : void 0).catch(function() {})
                }, [k]), G = (0, C.useMemo)(function() {
                    return g.filter(function(e) {
                        return e.selected
                    }).map(function(e) {
                        return e.offerId
                    })
                }, [g]), {
                    offerSelections: g,
                    resolvedPrice: A,
                    resolvedDiscountInformation: x,
                    resolvedSavingsSummary: I,
                    isPricingLoading: D,
                    selectedOfferIds: G,
                    handleOfferCheckedChange: H
                }),
                ev = eE.offerSelections,
                eb = eE.resolvedPrice,
                ey = eE.resolvedDiscountInformation,
                e_ = eE.resolvedSavingsSummary,
                eA = eE.isPricingLoading,
                eC = eE.selectedOfferIds,
                eP = eE.handleOfferCheckedChange,
                eT = null != eb ? eb : W,
                eS = void 0 !== ey ? ey : ei,
                ex = (0, C.useMemo)(function() {
                    var e, t, n, r, a, i, o;
                    return eS ? (i = null != (e = eS.originalPrice) ? e : 0, {
                        savedAmount: o = null != (t = null != (n = eS.totalDiscountAmount) ? n : eS.totalAmountSaved) ? t : 0,
                        originalPrice: i,
                        totalPrice: i - o,
                        discountLines: null != (r = null == (a = eS.discounts) ? void 0 : a.map(function(e, t) {
                            var n, r, a, i, o = null != (n = null != (r = e.discountAmount) ? r : e.robuxDiscountAmount) ? n : 0,
                                u = (null == (i = e.localizedDiscountAttribution) ? void 0 : i.trim()) || void 0,
                                s = u || e.discountCampaign || "Discount ".concat(t + 1);
                            return {
                                discountAmount: o,
                                discountCampaign: e.discountCampaign || e.discountId || "line-".concat(t),
                                discountType: e.discountType,
                                label: s,
                                localizedAttribution: u,
                                discountPercent: null != (a = e.discountPercentage) ? a : e.robuxDiscountPercentage
                            }
                        })) ? r : []
                    }) : null
                }, [eS]),
                eR = null != Z && eT <= Z;
            o9("UnifiedRobuxUpsellModal", J);
            var eB = null != ea ? ea : j(tx),
                eI = j("Action.Buy"),
                eN = (t = j, r = (n = K((0, C.useState)(!1), 2))[0], a = n[1], (0, C.useEffect)(function() {
                    var e;
                    (e = es.EnvironmentUrls.apiGatewayUrl, {
                        getDmccaLegalTextFeature: function() {
                            return t$.get({
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
                }, []), i = (0, t3.getUrlWithLocale)(tg, ee().replace("-", "_").toLowerCase()) + (r ? "#robux-and-premium-membership" : ""), ok(t, "Message.TermsOfUse", [{
                    opening: "aTagStart",
                    closing: "aTagEnd",
                    render: function(e) {
                        return P().createElement("a", {
                            href: i,
                            target: "_blank",
                            rel: "noreferrer",
                            className: "underline"
                        }, e)
                    }
                }])),
                ew = (0, C.useCallback)(function() {
                    var e = {
                        purchasePrice: eT,
                        offerIds: eC
                    };
                    eR && em ? em(e) : ef ? ef(e) : z()
                }, [eT, eC, eR, em, ef, z]);
            return (0, na.jsx)(ar, {
                open: J,
                onOpenChange: function(e) {
                    !e && Y && Y()
                },
                isModal: !0,
                size: "Large",
                type: "Default",
                closeLabel: j("Action.Close") || "Close",
                hasCloseAffordance: !0,
                children: (0, na.jsxs)(aa, {
                    className: "relative width-full",
                    children: [(0, na.jsxs)(ai, {
                        className: "gap-large flex flex-col",
                        children: [(0, na.jsx)("div", {
                            className: "margin-bottom-xsmall",
                            children: (0, na.jsx)(oA, {
                                translate: j,
                                titleText: eB,
                                currentRobuxBalance: Z
                            })
                        }), (0, na.jsx)(oS, {
                            translate: j,
                            thumbnail: V,
                            assetName: X,
                            expectedPrice: eT,
                            priceSuffix: en,
                            discountInformation: eS
                        }), ev.map(function(e) {
                            var t = "upsell-offer-label-".concat(e.offerId),
                                n = "upsell-offer-expiration-".concat(e.offerId);
                            return (0, na.jsxs)("label", {
                                htmlFor: "upsell-offer-checkbox-".concat(e.offerId),
                                className: "flex flex-row items-start gap-x-small self-start cursor-pointer",
                                children: [(0, na.jsx)(og, {
                                    id: "upsell-offer-checkbox-".concat(e.offerId),
                                    "aria-labelledby": "".concat(t, " ").concat(n),
                                    placement: "Start",
                                    size: "Small",
                                    isChecked: e.selected,
                                    onCheckedChange: function(t) {
                                        eP(e.offerId, !0 === t)
                                    },
                                    isDisabled: eA || ed,
                                    "data-testid": "upsell-promo-checkbox-".concat(e.offerId)
                                }), (0, na.jsxs)("span", {
                                    className: "flex flex-row items-center wrap gap-x-small gap-y-xsmall",
                                    children: [(0, na.jsx)(oW, {
                                        id: t,
                                        text: e.localizedText,
                                        className: "text-body-medium content-default"
                                    }), (0, na.jsx)(o4, {
                                        id: n,
                                        expirationTimeUtc: e.expirationTimeUtc,
                                        translate: j
                                    })]
                                })]
                            }, e.offerId)
                        }), ex && ex.savedAmount > 0 && (0, na.jsx)(oX, {
                            translate: j,
                            normalizedDiscount: ex,
                            savingsSummary: e_
                        }), !eR && null != $ && null != et && (0, na.jsx)(o8, {
                            robuxAmount: $,
                            price: et
                        })]
                    }), (0, na.jsx)(au, {
                        className: "gap-small flex flex-col mt-[40px]",
                        children: (0, na.jsxs)("div", {
                            className: "flex flex-col items-center text-center width-full gap-medium",
                            children: [(0, na.jsx)(ab, {
                                variant: "Emphasis",
                                className: "width-full shrink-0",
                                onClick: ew,
                                isDisabled: void 0 !== q && q || eA || ed,
                                "data-testid": "purchase-confirm-button",
                                children: eI
                            }), (0, na.jsx)("div", {
                                className: "text-body-small",
                                children: eN
                            })]
                        })
                    })]
                })
            })
        },
        ue = function(e) {
            var t = e.translate,
                n = nd(e, ["translate"]);
            return (0, na.jsx)(iS, {
                translate: t,
                namespaces: iH,
                useTranslate: iG,
                render: function(e) {
                    return (0, na.jsx)(o7, eg(er({}, n), {
                        translate: e
                    }))
                }
            })
        },
        ut = function(e) {
            var t = e.translate,
                n = e.expectedPrice,
                r = e.thumbnail,
                a = e.assetName,
                i = e.onAction,
                o = e.onCancel,
                u = e.loading,
                s = e.currentRobuxBalance,
                l = e.open,
                c = void 0 !== l && l;
            return o9("UnifiedRobuxUpsellTooExpensiveModal", c), (0, na.jsx)(ar, {
                open: c,
                onOpenChange: function(e) {
                    !e && o && o()
                },
                isModal: !0,
                size: "Large",
                type: "Default",
                closeLabel: t("Action.Close") || "Close",
                hasCloseAffordance: !0,
                children: (0, na.jsxs)(aa, {
                    className: "relative width-full",
                    children: [(0, na.jsxs)(ai, {
                        className: "gap-large flex flex-col",
                        children: [(0, na.jsx)("div", {
                            className: "margin-bottom-xsmall",
                            children: (0, na.jsx)(oA, {
                                translate: t,
                                titleText: t(tN),
                                currentRobuxBalance: s
                            })
                        }), (0, na.jsx)(oS, {
                            translate: t,
                            thumbnail: r,
                            assetName: a,
                            expectedPrice: n
                        })]
                    }), (0, na.jsx)(au, {
                        className: "gap-small flex flex-col mt-[40px]",
                        children: (0, na.jsx)("div", {
                            className: "flex flex-row-reverse",
                            children: (0, na.jsx)(ab, {
                                "aria-label": t(tN),
                                variant: "Emphasis",
                                className: " fill",
                                onClick: i,
                                isDisabled: void 0 !== u && u,
                                "data-testid": "purchase-confirm-button",
                                children: (0, na.jsxs)("div", {
                                    className: "fill basis-0 inline-flex items-center gap-medium leading-none",
                                    children: [(0, na.jsx)(nv, {
                                        name: "icon-filled-arrow-up-right-from-square",
                                        className: "align-middle"
                                    }), t(tR)]
                                })
                            })
                        })
                    })]
                })
            })
        },
        un = function(e) {
            var t = e.translate,
                n = nd(e, ["translate"]);
            return (0, na.jsx)(iS, {
                translate: t,
                namespaces: iH,
                useTranslate: iG,
                render: function(e) {
                    return (0, na.jsx)(ut, eg(er({}, n), {
                        translate: e
                    }))
                }
            })
        },
        ur = function(e) {
            var t = nl(),
                n = t.remove,
                r = function() {
                    var t;
                    n(), null == (t = e.onCancel) || t.call(e)
                },
                a = function() {
                    var t;
                    !1 !== (null == (t = e.onAccept) ? void 0 : t.call(e)) && r()
                };
            if ("tooExpensive" === e.variant) {
                var i = P().createElement(un, {
                    expectedPrice: e.expectedPrice,
                    thumbnail: e.thumbnail,
                    assetName: e.assetName,
                    onAction: a,
                    onCancel: r,
                    open: !0,
                    loading: !1,
                    currentRobuxBalance: e.currentRobuxBalance
                });
                return t.render(i), {
                    close: r,
                    updatePackage: function() {},
                    setPackageLoading: function() {}
                }
            }
            var o = e.upsellProduct,
                u = !1,
                s = e.onAcceptOffers ? function(t) {
                    var n;
                    !1 !== (null == (n = e.onAcceptOffers) ? void 0 : n.call(e, t)) && r()
                } : void 0,
                l = e.onDirectPurchase ? function(t) {
                    var r;
                    null == (r = e.onDirectPurchase) || r.call(e, t), n()
                } : void 0,
                c = function() {
                    var n = P().createElement(ue, {
                        expectedPrice: e.expectedPrice,
                        thumbnail: e.thumbnail,
                        assetName: e.assetName,
                        assetType: e.assetType,
                        assetTypeDisplayName: e.assetTypeDisplayName,
                        onAction: a,
                        onCancel: r,
                        open: !0,
                        loading: !1,
                        currentRobuxBalance: e.currentRobuxBalance,
                        robuxPackageAmount: null == o ? void 0 : o.robux_amount,
                        robuxPackagePrice: null == o ? void 0 : o.price,
                        packageLoading: u,
                        priceSuffix: e.priceSuffix,
                        title: e.title,
                        discountInformation: e.discountInformation,
                        collectibleItemId: e.collectibleItemId,
                        rentalOptionDays: e.rentalOptionDays,
                        isLimited: e.isLimited,
                        onRefetchPackage: e.onRefetchPackage,
                        onAcceptOffers: s,
                        onDirectPurchase: l
                    });
                    t.render(n)
                };
            return c(), {
                close: r,
                updatePackage: function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                    e && (o = e), u = t, c()
                },
                setPackageLoading: function(e) {
                    u = e, c()
                }
            }
        },
        ua = function() {
            function e() {
                var t = this;
                D(this, e), M(this, "overlayDiv", null), M(this, "contentDiv", null), M(this, "loadingMessageSpan", null), M(this, "spinnerSpan", null), M(this, "loadingOverlayElementId", "loading-overlay"), M(this, "_loadingMessage", void 0), M(this, "show", function(e) {
                    var n = t.getOrCreateOverlayDiv(),
                        r = t.getOrCreateContentDiv(n);
                    return t.getOrCreateSpinnerSpan(r), t.updateOrCreateMessage(e), t
                }), M(this, "hide", function() {
                    var e, n, r, a, i, o, u, s;
                    null == (n = t.spinnerSpan) || null == (e = n.parentNode) || e.removeChild(t.spinnerSpan), null == (a = t.loadingMessageSpan) || null == (r = a.parentNode) || r.removeChild(t.loadingMessageSpan), null == (o = t.contentDiv) || null == (i = o.parentNode) || i.removeChild(t.contentDiv), null == (s = t.overlayDiv) || null == (u = s.parentNode) || u.removeChild(t.overlayDiv), t.overlayDiv = null, t.contentDiv = null, t.spinnerSpan = null, t.loadingMessageSpan = null
                }), M(this, "updateMessage", function(e) {
                    t._loadingMessage = e, t.updateOrCreateMessage(e)
                }), M(this, "updateOrCreateMessage", function(e) {
                    if (t.overlayDiv) {
                        if (!e) {
                            var n, r;
                            null == (r = t.loadingMessageSpan) || null == (n = r.parentNode) || n.removeChild(t.loadingMessageSpan), t.loadingMessageSpan = null;
                            return
                        }
                        if (t.loadingMessageSpan) t.loadingMessageSpan.innerText = e;
                        else {
                            var a = document.createElement("span");
                            a.innerText = e, a.classList.add("loading-message"), t.getOrCreateContentDiv(t.overlayDiv).appendChild(a), t.loadingMessageSpan = a
                        }
                    }
                }), M(this, "getOrCreateContentDiv", function(e) {
                    if (t.contentDiv) return t.contentDiv;
                    var n = document.createElement("div");
                    return n.classList.add("loading-overlay-content"), t.contentDiv = n, e.appendChild(n), n
                }), M(this, "getOrCreateOverlayDiv", function() {
                    if (t.overlayDiv) return t.overlayDiv;
                    var e = document.getElementById(t.loadingOverlayElementId);
                    if (e) return t.overlayDiv = e, e;
                    var n = document.createElement("div");
                    return t.overlayDiv = n, n.id = t.loadingOverlayElementId, n.classList.add("loading-overlay"), document.body.appendChild(n), n
                }), M(this, "getOrCreateSpinnerSpan", function(e) {
                    if (t.spinnerSpan) return t.spinnerSpan;
                    var n = document.createElement("span");
                    return n.classList.add("spinner", "spinner-default"), e.appendChild(n), t.spinnerSpan = n, n
                })
            }
            return F(e, [{
                key: "loadingMessage",
                get: function() {
                    return this._loadingMessage
                }
            }]), e
        }(),
        ui = window.Roblox["core-scripts"].eventStream;

    function uo(e) {
        en.expireUpsellCookie(), window.location.href = (0, t2.getAbsoluteUrl)(e)
    }

    function uu() {
        return w(function() {
            var e;
            return L(this, function(t) {
                switch (t.label) {
                    case 0:
                        return e = {
                            url: "".concat(es.EnvironmentUrls.apiGatewayUrl).concat("/vng-payments/v1/getVngShopUrl"),
                            withCredentials: !0
                        }, [4, t$.get(e)];
                    case 1:
                        return [2, t.sent().data.vngShopRedirectUrl]
                }
            })
        })()
    }

    function us() {
        var e = (0, eu.getDeviceMeta)();
        (null == e ? void 0 : e.isDesktop) && e.isUniversalApp ? uu().then(function(e) {
            return window.open(e, "_self")
        }).catch(function() {
            return window.open(es.EnvironmentUrls.vngGamesShopUrl, "_self")
        }) : uu().then(function(e) {
            return window.open(e, "_blank")
        }).catch(function() {
            return window.open(es.EnvironmentUrls.vngGamesShopUrl, "_blank")
        })
    }

    function ul(e, t, n, r) {
        var a = "<span>".concat(n.get("Message.PurchaseSucceededRobuxBalance", {
                userRobuxBalance: nt(t)
            }), "</span>"),
            i = "<div class='item-content'>\n        <div class='item-card-container item-preview'>\n          <div class='item-card-thumb'>\n            <img alt='item preview' src='".concat(e.itemThumbnailUrl, "'/>\n          </div>\n        </div>\n        <div class='text-center'>\n          ").concat(n.get("Message.PurchaseSucceeded", {
                assetName: e.assetName
            }), "\n          ").concat(a, "\n        </div>\n      </div>"),
            o = e.assetType === tP || "Subscription" === e.assetType,
            u = o ? n.get(tD, {}) : n.get("Action.EquipMyAvatar", {});
        iX({
            titleText: n.get("Heading.PurchaseSucceeded", {}),
            bodyContent: i,
            declineText: n.get("Action.BackToShop", {}),
            acceptText: u,
            onAccept: function() {
                tE.sendUserPurchaseFlowEvent({
                    triggerContext: tE.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL,
                    isMidPurchaseStep: !0,
                    viewName: tE.ENUM_VIEW_NAME.SUCCESS,
                    purchaseEventType: tE.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT,
                    viewMessage: tE.ENUM_VIEW_MESSAGE.OK,
                    eventMetadata: {
                        item_type: e.assetType,
                        item_id: e.productId
                    },
                    isTerminalView: !0
                }), iJ("AutoPurchaseSucceedEquipMyAvatar", e.assetType);
                var t, n = e.itemPath;
                return (t2.supportLocalizedUrls && (n = (0, t2.removeUrlLocale)(n)), o) ? n.startsWith(ty) ? uo("".concat(e.itemPath, "?#!/store")) : uo(e.itemPath) : void 0 !== (t = (0, t2.getAbsoluteUrl)("/my/avatar")) && "" !== t && (en.expireUpsellCookie(), window.location.href = t), !1
            },
            onDecline: function() {
                return r.show(), tE.sendUserPurchaseFlowEvent({
                    triggerContext: tE.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL,
                    isMidPurchaseStep: !0,
                    viewName: tE.ENUM_VIEW_NAME.SUCCESS,
                    purchaseEventType: tE.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT,
                    viewMessage: tE.ENUM_VIEW_MESSAGE.CANCEL,
                    eventMetadata: {
                        item_type: e.assetType,
                        item_id: e.productId
                    },
                    isTerminalView: !0
                }), iJ("AutoPurchaseSucceedBackToShop", e.assetType), uo(e.itemPath), !1
            },
            onCancel: function() {
                return r.show(), tE.sendUserPurchaseFlowEvent({
                    triggerContext: tE.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL,
                    isMidPurchaseStep: !0,
                    viewName: tE.ENUM_VIEW_NAME.SUCCESS,
                    purchaseEventType: tE.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT,
                    viewMessage: tE.ENUM_VIEW_MESSAGE.CANCEL,
                    eventMetadata: {
                        item_type: e.assetType,
                        item_id: e.productId
                    },
                    isTerminalView: !0
                }), iJ("AutoPurchaseSucceedClose", e.assetType), uo(e.itemPath), !1
            },
            allowHtmlContentInBody: !0,
            allowHtmlContentInFooter: !1,
            fieldValidationRequired: !0,
            showDecline: !o,
            dismissable: !1,
            xToCancel: !0
        })
    }

    function uc(e, t) {
        iX({
            titleText: t.get("Heading.ErrorOccured", {}),
            bodyContent: t.get("Message.PurchaseErrorOccured", {}),
            imageUrl: e.alertImageUrl,
            acceptText: t.get(tD, {}),
            allowHtmlContentInBody: !0
        })
    }

    function ud(e, t, n) {
        var r, a = (null != (r = null == B ? void 0 : B.Roblox) ? r : {}).ItemPurchase;
        a ? a().openErrorView(e) : uc(t, n)
    }

    function uh(e, t, n, r) {
        return w(function() {
            var a, i, o, u, s, l, c, d, h, f, m, p, E;
            return L(this, function(v) {
                switch (v.label) {
                    case 0:
                        a = {
                            url: e,
                            withCredentials: !0,
                            retryable: !1,
                            noCache: !0,
                            noPragma: !0
                        }, v.label = 1;
                    case 1:
                        return v.trys.push([1, 3, , 4]), l = er({
                            expectedCurrency: t.expectedCurrency,
                            expectedPrice: t.expectedPrice,
                            expectedSellerId: t.expectedSellerId,
                            expectedPromoId: t.expectedPromoId,
                            userAssetId: t.userAssetId,
                            collectibleItemId: null == (i = t.itemDetail) ? void 0 : i.collectibleItemId,
                            collectibleProductId: null == (o = t.itemDetail) ? void 0 : o.collectibleProductId,
                            expectedPurchaserId: null == (u = t7()) ? void 0 : u.id,
                            expectedPurchaserType: "User",
                            idempotencyKey: eo()
                        }, (null == (s = t.offerIds) ? void 0 : s.length) ? {
                            offerIds: t.offerIds
                        } : {}), [4, t$.post(a, l)];
                    case 2:
                        if (500 === (c = v.sent().data).statusCode) return iJ("AutoPurchaseErrorFromPurchaseApi", t.assetType), void 0 === c.showDivID && (c.showDivID = c.showDivId), void 0 === c.AssetID && (c.AssetID = c.assetId), n.hide(), ud(c, t, r), nr(), [2, Promise.resolve()];
                        if (t.isLibrary) {
                            var g, b, y, _;
                            g = c.assetId, y = iK.UrlSearchParams.parse(window.location.search, !1), d = {
                                assetId: g,
                                category: (_ = function(e) {
                                    var t;
                                    return null != (t = y.get(e)) ? t : void 0
                                })("Category"),
                                creatorId: _("CreatorId"),
                                genre: _("GenreCsv"),
                                page: _("Page"),
                                position: _("Position"),
                                searchKeyword: _("SearchKeyword"),
                                sortAggregation: _("SortAggregation"),
                                sortType: _("SortType"),
                                userId: null == (b = t7()) ? void 0 : b.id,
                                searchId: _("SearchId")
                            }, (0, ui.sendEventWithTarget)("LibraryAssetAcquired", "Marketplace", d, ui.targetTypes.WWW)
                        }
                        return iJ(tZ, t.assetType), n.hide(), h = t.userBalance - t.expectedPrice, ul(t, h, r, n), [2, Promise.resolve()];
                    case 3:
                        if (f = v.sent(), n.hide(), iJ(tQ, t.assetType), m = f, (void 0 === f ? "undefined" : eD(f)) !== "object" || !("responseText" in m.request)) return [2, Promise.reject(m.request)];
                        if ("Bad Request" === (p = m.request).responseText) uc(t, r);
                        else try {
                            E = JSON.parse(p.responseText || ""), ud(E, t, r), nr()
                        } catch (e) {
                            return [2, Promise.reject(e)]
                        }
                        return [2, Promise.reject(f)];
                    case 4:
                        return [2]
                }
            })
        })()
    }

    function uf(e) {
        var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : void 0,
            n = arguments.length > 2 ? arguments[2] : void 0,
            r = arguments.length > 3 ? arguments[3] : void 0;
        return w(function() {
            var a, i, o, u, s, l, c, d, h;
            return L(this, function(f) {
                if (null == (a = e.itemContainerElemClassList) ? void 0 : a.contains("btn-disabled-primary")) return [2, Promise.resolve()];
                if (u = "".concat(es.EnvironmentUrls.apiGatewayUrl).concat("/game-passes/v1/game-passes/{productId}/purchase".replace("{productId}", e.productId)), s = "".concat(es.EnvironmentUrls.economyApi).concat("/v1/purchases/products/{productId}".replace("{productId}", e.productId)), (null == (i = e.itemDetail) ? void 0 : i.collectibleItemId) && (c = e.itemDetail.collectibleItemInstanceId ? "/marketplace-sales/v1/item/{collectibleItemId}/purchase-resale" : "/marketplace-sales/v1/item/{collectibleItemId}/purchase-item", l = "".concat(es.EnvironmentUrls.apiGatewayUrl).concat(c.replace("{collectibleItemId}", e.itemDetail.collectibleItemId))), t) return [2, t({
                    productId: e.productId,
                    expectedPrice: e.expectedPrice,
                    expectedCurrency: e.expectedCurrency,
                    expectedPromoId: null == (d = e.expectedPromoId) ? void 0 : d.toString(),
                    expectedSellerId: e.expectedSellerId,
                    userAssetId: null == (h = e.userAssetId) ? void 0 : h.toString()
                })];
                if (iJ("AutoPurchaseStarted", e.assetType), null == (o = e.itemDetail) ? void 0 : o.subscriptionTargetKey) {
                    var m;
                    return [2, (m = "".concat(es.EnvironmentUrls.apiGatewayUrl).concat("/v1/subscriptions/purchase-with-robux/{subscriptionTargetKey}".replace("{subscriptionTargetKey}", e.itemDetail.subscriptionTargetKey)), w(function() {
                        var t, a, i;
                        return L(this, function(o) {
                            switch (o.label) {
                                case 0:
                                    t = {
                                        url: m,
                                        withCredentials: !0,
                                        retryable: !1,
                                        noCache: !0,
                                        noPragma: !0
                                    }, o.label = 1;
                                case 1:
                                    return o.trys.push([1, 3, , 4]), [4, t$.post(t, {
                                        priceInRobux: e.expectedPrice,
                                        idempotencyKey: eo()
                                    })];
                                case 2:
                                    return o.sent(), iJ(tZ, e.assetType), n.hide(), a = e.userBalance - e.expectedPrice, ul(e, a, r, n), [2, Promise.resolve()];
                                case 3:
                                    return i = o.sent(), n.hide(), iJ(tQ, e.assetType), uc(e, r), [2, Promise.reject(i)];
                                case 4:
                                    return [2]
                            }
                        })
                    })())]
                }
                return e.assetType === tP ? [2, uh(u, e, n, r)] : l ? [2, uh(l, e, n, r)] : [2, uh(s, e, n, r)]
            })
        })()
    }
    var um = function(e) {
        var t = e.thumbnailImageUrl;
        return (0, na.jsxs)("div", {
            className: "item-preview",
            style: {
                overflow: "hidden",
                maxWidth: "100%"
            },
            children: [(0, na.jsx)("div", {
                className: "item-card-thumb",
                children: (0, na.jsx)("img", {
                    alt: "item preview",
                    src: null != t ? t : "",
                    style: {
                        width: "150px",
                        height: "150px",
                        objectFit: "cover",
                        borderRadius: "8px"
                    }
                })
            }), (0, na.jsx)("div", {
                className: "item-info text-name"
            })]
        })
    };

    function up(e, t, n, r, a) {
        var i = function(e, t) {
            var n, r, a, i, o = en.constants.UPSELL_TARGET_ITEM_URL_REGEX.exec(window.location.pathname);
            if (en.constants.UPSELL_TARGET_ITEM_URL_REGEX.lastIndex = 0, Array.isArray(o) && o.length > 0 && (i = K(o, 1)[0]), !i || !e || Object.keys(e).length < 4) return "";
            var u = eo(),
                s = "".concat(e.expectedCurrency, ",").concat(e.expectedPrice, ",").concat(e.expectedSellerId, ",").concat(null != (n = e.userassetId) ? n : ""),
                l = e.productId || "";
            l += ",".concat(e.collectibleItemId || ""), l += ",".concat(e.collectibleItemInstanceId || ""), l += ",".concat(e.collectibleProductId || ""), l += ",".concat(e.subscriptionTargetKey || ""), l += ",".concat(encodeURIComponent(e.itemName || ""));
            var c = "".concat(u, ",").concat(i, ",").concat(null != (r = null == (a = t7()) ? void 0 : a.id) ? r : "", ",").concat(s, ",").concat(l),
                d = new Date;
            d.setHours(d.getHours() + 1);
            var h = [en.constants.UPSELL_COOKIE_KEY, "=", encodeURIComponent(c), "; expires=".concat(d.toUTCString()), "; path=/", "; domain=.", es.EnvironmentUrls.domain, ";"];
            document.cookie = h.join("");
            if (u && (null == t ? void 0 : t.length)) try {
                window.sessionStorage.setItem(nn(u), JSON.stringify(t))
            } catch (e) {}
            return u
        }(n && null != r ? eg(er({}, n), {
            expectedPrice: String(r)
        }) : n, a);
        iJ("UpsellContinued", null == n ? void 0 : n.assetType), tE.sendUserPurchaseFlowEvent({
            triggerContext: tE.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL,
            isMidPurchaseStep: !0,
            viewName: tE.ENUM_VIEW_NAME.ROBUX_UPSELL,
            purchaseEventType: tE.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT,
            viewMessage: tE.ENUM_VIEW_MESSAGE.GO_TO_ROBUX_PURCHASE_PAGE
        }), window.location.href = (0, t2.getAbsoluteUrl)("".concat("/upgrades/paymentmethods", "?ap=").concat(e.roblox_product_id, "&UpsellUuid=").concat(i))
    }

    function uE(e, t, n, r) {
        var a = Date.now(),
            i = a - t;
        tE.sendUserPurchaseFlowEvent({
            triggerContext: tE.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL,
            isMidPurchaseStep: !0,
            viewName: tE.ENUM_VIEW_NAME.ROBUX_UPSELL,
            purchaseEventType: tE.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT,
            viewMessage: e,
            eventMetadata: {
                userBalance: n.userBalanceRobux.toString(),
                itemCost: r.expectedItemPrice.toString(),
                modalImpressionTimeInMs: i.toString(),
                modalStartTimeInMs: t.toString(),
                modalEndTimeInMs: a.toString()
            }
        })
    }
    var uv = window.Roblox["core-scripts"].util.pageName;

    function ug(e, t) {
        try {
            (0, ui.sendEventWithTarget)("ItemPurchaseUpsellEvent", e, t, ui.targetTypes.WWW)
        } catch (e) {}
    }
    var ub = function(e) {
            var t = document.querySelector('.PurchaseButton[data-product-id="'.concat(e.productId, '"]')),
                n = null == t ? void 0 : t.closest(".store-card"),
                r = null == n ? void 0 : n.querySelector(".gear-passes-asset img");
            return r ? r.src : null
        },
        uy = function(e, t) {
            var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : window.location.pathname;
            if (n.includes(ty)) {
                if (!t) throw Error("button data not exist");
                if (iJ("UpsellFromGamesPage", t.assetType), "Subscription" === t.assetType) return e.imageurl;
                var r = ub(t);
                if (!r) throw iJ("UpsellThumbnailProcessFailed", t.assetType), Error("thumbnail image url process failed");
                return r
            }
            return e.imageurl
        },
        u_ = window.Roblox["core-scripts"].guac,
        uA = function() {
            function e(t) {
                var n, r = this;
                D(this, e), M(this, "intl", void 0), M(this, "intlProvider", void 0), M(this, "translationResource", void 0), M(this, "loadingOverlay", void 0), M(this, "_state", {
                    purchased: !1,
                    retryRemainTimes: 5,
                    timeoutHandle: null
                }), M(this, "_checkBalanceAndPurchase", function(e, t) {
                    return w(function() {
                        var n, r, a;
                        return L(this, function(i) {
                            switch (i.label) {
                                case 0:
                                    if (n = this, this._state.purchased) return [2, Promise.resolve()];
                                    i.label = 1;
                                case 1:
                                    return i.trys.push([1, 5, , 6]), r = this.translationResource.get("Label.WaitingForRobux", {}), this.loadingOverlay.updateMessage(r), [4, w(function() {
                                        var e, t, n, r;
                                        return L(this, function(a) {
                                            switch (a.label) {
                                                case 0:
                                                    n = {
                                                        url: "".concat(es.EnvironmentUrls.economyApi).concat("/v1/users/{userId}/currency".replace("{userId}", null != (e = null == (t = t7()) ? void 0 : t.id) ? e : "")),
                                                        withCredentials: !0,
                                                        retryable: !1,
                                                        noCache: !0
                                                    }, a.label = 1;
                                                case 1:
                                                    return a.trys.push([1, 3, , 4]), [4, t$.get(n)];
                                                case 2:
                                                    if (200 === (r = a.sent()).status) return [2, r.data.robux];
                                                    return [2, Promise.reject()];
                                                case 3:
                                                    return [2, Promise.reject(a.sent())];
                                                case 4:
                                                    return [2]
                                            }
                                        })
                                    })()];
                                case 2:
                                    if (e.userBalance = a = i.sent(), !(a >= e.expectedPrice)) return [3, 4];
                                    return [4, uf(e, t, this.loadingOverlay, this.translationResource)];
                                case 3:
                                    i.sent(), this._stopPeriodicChecking(), this._state.purchased = !0, i.label = 4;
                                case 4:
                                    return this._state.purchased || (this._state.retryRemainTimes > 0 ? (this._state.timeoutHandle = window.setTimeout(function() {
                                        return w(function() {
                                            return L(this, function(n) {
                                                switch (n.label) {
                                                    case 0:
                                                        return [4, this._checkBalanceAndPurchase(e, t)];
                                                    case 1:
                                                        return n.sent(), [2]
                                                }
                                            })
                                        }).call(n)
                                    }, 1e3), this._state.retryRemainTimes -= 1) : (iJ("AutoPurchaseFailedDueToStillLowBalance", null == e ? void 0 : e.assetType), this._processGenericErrorState(e))), [3, 6];
                                case 5:
                                    return i.sent(), iJ(tQ, null == e ? void 0 : e.assetType), this._processGenericErrorState(e), [3, 6];
                                case 6:
                                    return [2, Promise.resolve()]
                            }
                        })
                    }).call(r)
                }), M(this, "_stopPeriodicChecking", function() {
                    r._state.timeoutHandle && (clearTimeout(r._state.timeoutHandle), r._state.timeoutHandle = null)
                }), M(this, "_processGenericErrorState", function(e) {
                    r.loadingOverlay.hide(), uc(e, r.translationResource), nr()
                });
                var a = new(H())(t ? ee() : void 0);
                this.intl = a, this.intlProvider = null != (n = null == t ? void 0 : t.intlProvider) ? n : new G.TranslationResourceProvider(a), this.translationResource = this.intlProvider.getTranslationResource(t_), this.loadingOverlay = new ua
            }
            return F(e, [{
                key: "startItemUpsellProcess",
                value: function(e, t, n) {
                    return w(function(e, t, n) {
                        var r, a, i, o, u, s, l, c, d, h, f, m, p, E, v, g, b, y, _ = arguments;
                        return L(this, function(A) {
                            var C, P, T, S, x, R, B, I, N, U;
                            switch (A.label) {
                                case 0:
                                    if (r = _.length > 3 && void 0 !== _[3] ? _[3] : null == (C = document.getElementById(tb)) ? void 0 : C.dataset, a = _.length > 4 && void 0 !== _[4] && _[4], !(o = r) || t.isLimited || (null == t || null == (i = t.buyButtonElementDataset) ? void 0 : i.assetType) === "Product") return n(e), [2, Promise.reject(e)];
                                    if (u = en.constants.UPSELL_TARGET_ITEM_URL_REGEX.exec(window.location.pathname), en.constants.UPSELL_TARGET_ITEM_URL_REGEX.lastIndex = 0, !Array.isArray(u)) return [3, 5];
                                    A.label = 1;
                                case 1:
                                    return A.trys.push([1, 4, , 5]), [4, w(function() {
                                        return L(this, function(e) {
                                            switch (e.label) {
                                                case 0:
                                                    return e.trys.push([0, 2, , 3]), [4, (0, u_.callBehaviour)("vng-buy-robux")];
                                                case 1:
                                                    return [2, Promise.resolve(e.sent().shouldShowVng)];
                                                case 2:
                                                    return [2, Promise.reject(e.sent())];
                                                case 3:
                                                    return [2]
                                            }
                                        })
                                    })()];
                                case 2:
                                    if (A.sent()) return tE.startRobuxUpsellFlow({
                                        assetType: null != (s = null == (l = t.buyButtonElementDataset) ? void 0 : l.assetType) ? s : "",
                                        isReseller: !!(null == (c = t.buyButtonElementDataset) ? void 0 : c.userassetId),
                                        itemId: null == (d = t.buyButtonElementDataset) ? void 0 : d.productId
                                    }), o.thumbnailImageUrl = uy(o, t.buyButtonElementDataset), P = o, T = this.translationResource, S = this.intlProvider, B = nt(t.expectedItemPrice), I = "<div class='item-card-container item-preview'>\n        <div class='item-card-thumb'>\n          <img alt='item preview' src='".concat(null != (x = P.thumbnailImageUrl) ? x : "", "' />\n        </div>\n        <div class='item-info text-name'>\n        <div class='text-overflow item-card-name'>").concat((0, t1.escapeHtml)(t.assetName), "</div>\n          <div class='text-robux item-card-price'>").concat(B, "</div>\n        </div>\n      </div>"), iJ(tz, null == (R = t.buyButtonElementDataset) ? void 0 : R.assetType), tE.sendUserPurchaseFlowEvent({
                                        triggerContext: tE.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL,
                                        isMidPurchaseStep: !0,
                                        viewName: tE.ENUM_VIEW_NAME.ROBUX_UPSELL,
                                        purchaseEventType: tE.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN
                                    }), N = I + (T.get(tw, {}) || "<div class='modal-message-block text-center border-top'>Sorry, you don't have enough Robux to buy this item. Would you like to purchase a Robux package?</div>"), U = T.get("Message.InsufficientRobuxRedirectToExternalPartner", {}) || "<div class='text-footer modal-message-block text-center'> You will be taken to our partner’s page to complete the purchase.</div>", iX({
                                        titleText: T.get(tI, {}) || "Insufficient Robux",
                                        bodyContent: N,
                                        declineText: T.get(tB, {}),
                                        acceptText: T.get(tR, {}) || "Buy Robux",
                                        onAccept: function() {
                                            var e;
                                            return tE.sendUserPurchaseFlowEvent({
                                                triggerContext: tE.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL,
                                                isMidPurchaseStep: !0,
                                                viewName: tE.ENUM_VIEW_NAME.ROBUX_UPSELL,
                                                purchaseEventType: tE.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT,
                                                viewMessage: tE.ENUM_VIEW_MESSAGE.BUY_ROBUX
                                            }), (e = t.buyButtonElementDataset, w(function() {
                                                return L(this, function(t) {
                                                    try {
                                                        var n, r, a, i;
                                                        return tE.sendUserPurchaseFlowEvent({
                                                            triggerContext: tE.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL,
                                                            isMidPurchaseStep: !0,
                                                            viewName: tE.ENUM_VIEW_NAME.LEAVE_ROBLOX_WARNING,
                                                            purchaseEventType: tE.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN,
                                                            viewMessage: tE.ENUM_VIEW_MESSAGE.EXTERNAL_LINK_MODAL
                                                        }), iJ("ContinueBuyRobuxOnExternalSite", null == e ? void 0 : e.assetType), n = S.getTranslationResource(tC), r = S.getTranslationResource(tA), a = "<br /><br />", i = n.get(tw, {
                                                            lineBreak: a,
                                                            linebreak: a
                                                        }) || "This purchase must be completed on our partner’s website. You will be returned to Roblox after the purchase is completed.<br /><br /> Proceed to partner website for payment?", iX({
                                                            titleText: n.get("Heading.InsufficientRobuxLeaveRoblox", {}) || "Leaving Roblox",
                                                            bodyContent: "<div class='modal-message-block text-center'>".concat(i, "</div>"),
                                                            declineText: r.get(tO, {}),
                                                            acceptText: r.get("Action.ContinueToPayment", {}) || "Continue to Payment",
                                                            onAccept: function() {
                                                                tE.sendUserPurchaseFlowEvent({
                                                                    triggerContext: tE.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL,
                                                                    isMidPurchaseStep: !0,
                                                                    viewName: tE.ENUM_VIEW_NAME.LEAVE_ROBLOX_WARNING,
                                                                    purchaseEventType: tE.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT,
                                                                    viewMessage: tE.ENUM_VIEW_MESSAGE.CONTINUE_TO_VNG
                                                                }), iJ("ConfirmLeaveRobloxModal", null == e ? void 0 : e.assetType), us()
                                                            },
                                                            onDecline: function() {
                                                                tE.sendUserPurchaseFlowEvent({
                                                                    triggerContext: tE.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL,
                                                                    isMidPurchaseStep: !0,
                                                                    viewName: tE.ENUM_VIEW_NAME.LEAVE_ROBLOX_WARNING,
                                                                    purchaseEventType: tE.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT,
                                                                    viewMessage: tE.ENUM_VIEW_MESSAGE.CANCEL
                                                                }), iJ(tq, null == e ? void 0 : e.assetType)
                                                            },
                                                            onCancel: function() {
                                                                tE.sendUserPurchaseFlowEvent({
                                                                    triggerContext: tE.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL,
                                                                    isMidPurchaseStep: !0,
                                                                    viewName: tE.ENUM_VIEW_NAME.LEAVE_ROBLOX_WARNING,
                                                                    purchaseEventType: tE.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT,
                                                                    viewMessage: tE.ENUM_VIEW_MESSAGE.CANCEL
                                                                }), iJ(tq, null == e ? void 0 : e.assetType)
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
                                            })()).catch(function() {
                                                var e;
                                                iJ("LeaveRobloxFailedToShown", null == (e = t.buyButtonElementDataset) ? void 0 : e.assetType), us()
                                            }), !1
                                        },
                                        onDecline: function() {
                                            var e;
                                            tE.sendUserPurchaseFlowEvent({
                                                triggerContext: tE.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL,
                                                isMidPurchaseStep: !0,
                                                viewName: tE.ENUM_VIEW_NAME.ROBUX_UPSELL,
                                                purchaseEventType: tE.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT,
                                                viewMessage: tE.ENUM_VIEW_MESSAGE.CANCEL
                                            }), iJ(tK, null == (e = t.buyButtonElementDataset) ? void 0 : e.assetType)
                                        },
                                        onCancel: function() {
                                            var e;
                                            tE.sendUserPurchaseFlowEvent({
                                                triggerContext: tE.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL,
                                                isMidPurchaseStep: !0,
                                                viewName: tE.ENUM_VIEW_NAME.ROBUX_UPSELL,
                                                purchaseEventType: tE.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT,
                                                viewMessage: tE.ENUM_VIEW_MESSAGE.CANCEL
                                            }), iJ(tK, null == (e = t.buyButtonElementDataset) ? void 0 : e.assetType)
                                        },
                                        allowHtmlContentInBody: !0,
                                        allowHtmlContentInFooter: !0,
                                        footerText: U,
                                        fieldValidationRequired: !0,
                                        xToCancel: !0
                                    }), [2, Promise.resolve()];
                                    return [4, t0(o, t)];
                                case 3:
                                    if (200 === (h = A.sent()).status) return tE.startRobuxUpsellFlow({
                                        assetType: null != (f = null == (m = t.buyButtonElementDataset) ? void 0 : m.assetType) ? f : "",
                                        isReseller: !!(null == (p = t.buyButtonElementDataset) ? void 0 : p.userassetId),
                                        itemId: null == (E = t.buyButtonElementDataset) ? void 0 : E.productId
                                    }), o.thumbnailImageUrl = uy(o, t.buyButtonElementDataset), ! function(e, t, n, r, a, i, o) {
                                        var u, s, l = arguments.length > 7 && void 0 !== arguments[7] && arguments[7],
                                            c = nt(t.expectedItemPrice),
                                            d = "<div class='item-card-container item-preview'>\n        <div class='item-card-thumb'>\n          <img alt='item preview' src='".concat(null != (u = n.thumbnailImageUrl) ? u : "", "' />\n        </div>\n        <div class='item-info text-name'>\n        <div class='text-overflow item-card-name'>").concat((0, t1.escapeHtml)(t.assetName), "</div>\n          <div class='text-robux item-card-price'>").concat(c, "</div>\n        </div>\n      </div>");
                                        iJ(tz, null == (s = t.buyButtonElementDataset) ? void 0 : s.assetType), tE.sendUserPurchaseFlowEvent({
                                                triggerContext: tE.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL,
                                                isMidPurchaseStep: !0,
                                                viewName: tE.ENUM_VIEW_NAME.ROBUX_UPSELL,
                                                purchaseEventType: tE.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN
                                            }),
                                            function(e, t, n, r, a, i, o, u) {
                                                var s = arguments.length > 8 && void 0 !== arguments[8] && arguments[8],
                                                    l = Date.now(),
                                                    c = "<a class='text-link-secondary terms-of-use-link' target='_blank' href='".concat((0, t3.getUrlWithLocale)(tg, i.getRobloxLocale()), "'>"),
                                                    d = nt(t.shortfallPrice, !1),
                                                    h = nt(a.robux_amount),
                                                    f = a.robux_amount_before_bonus ? nt(a.robux_amount_before_bonus, !1, !0) : "",
                                                    m = e + o.get("Message.InsufficientRobuxNew", {
                                                        divTagStart: "<div class='modal-message-block text-center border-top'>",
                                                        divTagEnd: "</div>",
                                                        robuxNeeded: d,
                                                        robuxPackageAmount: h,
                                                        originalRobuxPackageAmount: f,
                                                        sentenceSplit: "<br>",
                                                        lineBreak: "",
                                                        aTagStart: c,
                                                        aTagEnd: "</a>",
                                                        divTagFooterStart: "<div class='modal-message-block text-center border-top modal-legal-footer'>",
                                                        divTagFooterEnd: "</div>"
                                                    }),
                                                    p = o.get(tN, {});

                                                function E() {
                                                    var e, t;
                                                    return uE(tE.ENUM_VIEW_MESSAGE.BUY_ROBUX_AND_ITEM, l, r, n), i0(a, null != (e = null == (t = t7()) ? void 0 : t.isUnder13) && e, function() {
                                                        return up(a, r, n.buyButtonElementDataset)
                                                    }, u, n.buyButtonElementDataset).catch(function() {
                                                        var e;
                                                        iJ(tJ, null == (e = n.buyButtonElementDataset) ? void 0 : e.assetType), up(a, r, n.buyButtonElementDataset)
                                                    }), !1
                                                }

                                                function v() {
                                                    var e;
                                                    uE(tE.ENUM_VIEW_MESSAGE.CANCEL, l, r, n), iJ(tK, null == (e = n.buyButtonElementDataset) ? void 0 : e.assetType)
                                                }
                                                if (s) {
                                                    var g, b, y, _, A, C, P, T, S = (null == (_ = n.buyButtonElementDataset) ? void 0 : _.assetType) === "Subscription",
                                                        x = S && n.thumbnail ? n.thumbnail : um({
                                                            thumbnailImageUrl: null != (g = r.thumbnailImageUrl) ? g : ""
                                                        }),
                                                        R = null != (b = null == (A = n.buyButtonElementDataset) ? void 0 : A.collectibleItemId) ? b : null,
                                                        B = null != (y = null == (C = n.buyButtonElementDataset) ? void 0 : C.rentalOptionDays) ? y : null,
                                                        I = Number(r.userBalanceRobux),
                                                        N = a,
                                                        U = 0;
                                                    T = ur({
                                                        variant: "standard",
                                                        expectedPrice: n.expectedItemPrice,
                                                        upsellProduct: a,
                                                        assetName: n.assetName,
                                                        assetType: (null == (P = n.buyButtonElementDataset) ? void 0 : P.assetType) || "",
                                                        thumbnail: x,
                                                        currentRobuxBalance: I,
                                                        onAccept: E,
                                                        onCancel: v,
                                                        priceSuffix: S ? n.priceSuffix : void 0,
                                                        title: S ? o.get("Action.BuyRobuxAndSubscription", {}) : void 0,
                                                        discountInformation: n.discountInformation,
                                                        collectibleItemId: R,
                                                        rentalOptionDays: B,
                                                        isLimited: n.isLimited,
                                                        onRefetchPackage: function(e) {
                                                            if (!Number.isFinite(I) || !(e <= I)) {
                                                                var t = U += 1;
                                                                null == T || T.setPackageLoading(!0), t0(r, n, e).then(function(e) {
                                                                    t === U && (200 === e.status && e.data ? (N = e.data, null == T || T.updatePackage(e.data, !1)) : null == T || T.setPackageLoading(!1))
                                                                }).catch(function() {
                                                                    t === U && (null == T || T.setPackageLoading(!1))
                                                                })
                                                            }
                                                        },
                                                        onAcceptOffers: function(e) {
                                                            var t, a, i = e.purchasePrice,
                                                                o = e.offerIds;
                                                            uE(tE.ENUM_VIEW_MESSAGE.BUY_ROBUX_AND_ITEM, l, r, n);
                                                            var s = o.length ? o : void 0;
                                                            return i0(N, null != (t = null == (a = t7()) ? void 0 : a.isUnder13) && t, function() {
                                                                return up(N, r, n.buyButtonElementDataset, i, s)
                                                            }, u, n.buyButtonElementDataset).catch(function() {
                                                                var e;
                                                                iJ(tJ, null == (e = n.buyButtonElementDataset) ? void 0 : e.assetType), up(N, r, n.buyButtonElementDataset, i, s)
                                                            }), !1
                                                        },
                                                        onDirectPurchase: function(e) {
                                                            var t = e.purchasePrice,
                                                                a = e.offerIds;
                                                            uE(tE.ENUM_VIEW_MESSAGE.BUY_ROBUX_AND_ITEM, l, r, n), (function(e) {
                                                                return w(function(e) {
                                                                    var t, n, r, a, i, o, u, s, l, c, d, h, f, m;
                                                                    return L(this, function(p) {
                                                                        switch (p.label) {
                                                                            case 0:
                                                                                return t = e.itemDetail, n = e.itemPurchaseAjaxData, r = e.purchasePrice, a = e.offerIds, i = e.userBalance, o = e.translationResource, f = {
                                                                                    itemContainerElemClassList: void 0,
                                                                                    assetType: null != (u = null == (h = t.buyButtonElementDataset) ? void 0 : h.assetType) ? u : "",
                                                                                    assetName: (0, t1.escapeHtml)(t.assetName),
                                                                                    productId: null != (s = null == h ? void 0 : h.productId) ? s : "",
                                                                                    expectedPrice: r,
                                                                                    expectedCurrency: Number(null == h ? void 0 : h.expectedCurrency) || 1,
                                                                                    expectedPromoId: void 0,
                                                                                    expectedSellerId: Number(null == h ? void 0 : h.expectedSellerId) || 0,
                                                                                    userAssetId: (null == h ? void 0 : h.userassetId) ? Number(h.userassetId) : void 0,
                                                                                    context: "",
                                                                                    isLibrary: !1,
                                                                                    itemThumbnailUrl: null != (l = null != (c = n.thumbnailImageUrl) ? c : n.imageurl) ? l : "",
                                                                                    itemPath: window.location.pathname,
                                                                                    alertImageUrl: null != (d = n.alerturl) ? d : "",
                                                                                    userBalance: i,
                                                                                    itemPurchaseAjaxData: n,
                                                                                    itemDetail: h,
                                                                                    offerIds: a.length ? a : void 0
                                                                                }, (m = new ua).show(), m.updateMessage(o.get(tU, {})), [4, uf(f, null, m, o)];
                                                                            case 1:
                                                                                return p.sent(), [2]
                                                                        }
                                                                    })
                                                                }).apply(this, arguments)
                                                            })({
                                                                itemDetail: n,
                                                                itemPurchaseAjaxData: r,
                                                                purchasePrice: t,
                                                                offerIds: a,
                                                                userBalance: I,
                                                                translationResource: o
                                                            }).catch(function() {})
                                                        }
                                                    });
                                                    return
                                                }
                                                iX({
                                                    titleText: p,
                                                    bodyContent: m,
                                                    footerText: "",
                                                    declineText: o.get(tB, {}),
                                                    acceptText: o.get(tx, {}),
                                                    onAccept: E,
                                                    onDecline: function() {
                                                        var e;
                                                        uE(tE.ENUM_VIEW_MESSAGE.CANCEL, l, r, n), iJ(tK, null == (e = n.buyButtonElementDataset) ? void 0 : e.assetType)
                                                    },
                                                    onCancel: v,
                                                    allowHtmlContentInBody: !0,
                                                    allowHtmlContentInFooter: !1,
                                                    fieldValidationRequired: !0,
                                                    xToCancel: !0
                                                })
                                            }(d, e, t, n, r, a, i, o, l)
                                    }(e, t, o, h.data, this.intl, this.intlProvider.getTranslationResource(t_), this.intlProvider, a), [2, Promise.resolve()];
                                    return 204 === h.status ? iJ("UpsellFailedDueToNoAvailablePackage", null == (v = t.buyButtonElementDataset) ? void 0 : v.assetType) : iJ("UpsellFailedDueToFailedPackageRequest", null == (g = t.buyButtonElementDataset) ? void 0 : g.assetType), [3, 5];
                                case 4:
                                    return b = A.sent(), iJ("UpsellFailed", null == (y = t.buyButtonElementDataset) ? void 0 : y.assetType), n(e), [2, Promise.reject(b)];
                                case 5:
                                    return n(e), [2, Promise.reject(e)]
                            }
                        })
                    }).apply(this, arguments)
                }
            }, {
                key: "showExceedLargestInsufficientRobuxModal",
                value: function(e, t, n) {
                    var r, a, i = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : null == (r = document.getElementById(tb)) ? void 0 : r.dataset,
                        o = arguments.length > 4 && void 0 !== arguments[4] && arguments[4];
                    if (iJ("UpsellExceedLargestEntryPoint", null == t ? void 0 : t.assetType), !(null == i ? void 0 : i.imageurl)) {
                        iJ("UpsellExceedLargestNoThumbnailImage", null == t ? void 0 : t.assetType), n();
                        return
                    }
                    try {
                        tE.startRobuxUpsellFlow({
                                assetType: null != (a = null == t ? void 0 : t.assetType) ? a : "",
                                isReseller: !!(null == t ? void 0 : t.userassetId),
                                itemId: null == t ? void 0 : t.productId
                            }),
                            function(e, t, n, r) {
                                var a, i = arguments.length > 4 && void 0 !== arguments[4] && arguments[4],
                                    o = arguments.length > 5 ? arguments[5] : void 0,
                                    u = nt(e),
                                    s = parseInt(n.expectedPrice, 10),
                                    l = nt(s),
                                    c = window.location.pathname;
                                t2.supportLocalizedUrls && (c = (0, t2.removeUrlLocale)(c));
                                var d = t;
                                c.startsWith(ty) && (d = null != (a = ub(n)) ? a : d);
                                var h = "<div class='item-card-container item-preview'>\n        <div class='item-card-thumb'>\n          <img alt='item preview' src='".concat(d, "' />\n        </div>\n        <div class='item-info text-name'>\n        <div class='text-overflow item-card-name'>").concat((0, t1.escapeHtml)(n.itemName), "</div>\n          <div class='text-robux item-card-price'>").concat(l, "</div>\n        </div>\n      </div>") + r.get("Message.InsufficientRobuxExceedLargestPackage", {
                                    divTagStart: "<div class='modal-message-block text-center border-top'>",
                                    divTagEnd: "</div>",
                                    robuxNeeded: u
                                });

                                function f() {
                                    var e, t, r, a;
                                    return tE.sendUserPurchaseFlowEvent({
                                        triggerContext: tE.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL,
                                        isMidPurchaseStep: !0,
                                        viewName: tE.ENUM_VIEW_NAME.ROBUX_UPSELL_EXCEED_LARGEST_PACKAGE,
                                        purchaseEventType: tE.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT,
                                        viewMessage: tE.ENUM_VIEW_MESSAGE.GO_TO_ROBUX_STORE
                                    }), iJ("UpsellExceedLargestGoToRobuxStoreClicked", null == n ? void 0 : n.assetType), ! function(e, t) {
                                        if (e && t) {
                                            window.location.href = (0, t3.getUrlWithQueries)("/Upgrades/Robux.aspx", {
                                                ctx: ""
                                            });
                                            return
                                        }
                                        window.location.href = (0, t2.getAbsoluteUrl)("/upgrades/robux?ctx=upsell")
                                    }(null != (e = null == (r = (0, eu.getDeviceMeta)()) ? void 0 : r.isTablet) && e, null != (t = null == (a = (0, eu.getDeviceMeta)()) ? void 0 : a.isUniversalApp) && t), !1
                                }

                                function m() {
                                    tE.sendUserPurchaseFlowEvent({
                                        triggerContext: tE.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL,
                                        isMidPurchaseStep: !0,
                                        viewName: tE.ENUM_VIEW_NAME.ROBUX_UPSELL_EXCEED_LARGEST_PACKAGE,
                                        purchaseEventType: tE.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT,
                                        viewMessage: tE.ENUM_VIEW_MESSAGE.CANCEL
                                    }), iJ(tK, null == n ? void 0 : n.assetType)
                                }
                                if (tE.sendUserPurchaseFlowEvent({
                                        triggerContext: tE.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL,
                                        isMidPurchaseStep: !0,
                                        viewName: tE.ENUM_VIEW_NAME.ROBUX_UPSELL_EXCEED_LARGEST_PACKAGE,
                                        purchaseEventType: tE.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN
                                    }), iJ("UpsellExceedLargestShown", n.assetType), i) {
                                    var p = !0 === n.isPrivateServer && o ? o : um({
                                        thumbnailImageUrl: null != d ? d : ""
                                    });
                                    ur({
                                        variant: "tooExpensive",
                                        expectedPrice: s,
                                        assetName: n.itemName,
                                        thumbnail: p,
                                        onAccept: f,
                                        onCancel: m
                                    });
                                    return
                                }
                                iX({
                                    titleText: r.get(tI, {}),
                                    bodyContent: h,
                                    declineText: r.get(tB, {}),
                                    acceptText: r.get("Action.GoToRobuxStore", {}),
                                    onAccept: f,
                                    onDecline: function() {
                                        tE.sendUserPurchaseFlowEvent({
                                            triggerContext: tE.ENUM_TRIGGERING_CONTEXT.WEB_CATALOG_ROBUX_UPSELL,
                                            isMidPurchaseStep: !0,
                                            viewName: tE.ENUM_VIEW_NAME.ROBUX_UPSELL_EXCEED_LARGEST_PACKAGE,
                                            purchaseEventType: tE.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT,
                                            viewMessage: tE.ENUM_VIEW_MESSAGE.CANCEL
                                        }), iJ("UpsellExceedLargestCancelled", null == n ? void 0 : n.assetType)
                                    },
                                    onCancel: m,
                                    allowHtmlContentInBody: !0,
                                    allowHtmlContentInFooter: !1,
                                    fieldValidationRequired: !0,
                                    xToCancel: !0
                                })
                            }(e, i.imageurl, t, this.intlProvider.getTranslationResource(t_), o), iJ("UpsellExceedLargestModalExpTrue", null == t ? void 0 : t.assetType)
                    } catch (e) {
                        iJ("UpsellExceedLargestModalExpError", null == t ? void 0 : t.assetType), n()
                    }
                }
            }, {
                key: "initiateAutoPurchase",
                value: function(e, t) {
                    return w(function(e, t) {
                        var n, r, a, i, o, u, s, l, c = arguments;
                        return L(this, function(d) {
                            switch (d.label) {
                                case 0:
                                    n = c.length > 2 && void 0 !== c[2] ? c[2] : document.getElementById(tb), r = c.length > 3 && void 0 !== c[3] ? c[3] : document.getElementById("item-container"), this._state = {
                                        purchased: !1,
                                        retryRemainTimes: 5,
                                        timeoutHandle: null
                                    }, this.loadingOverlay.show(), iJ("AutoPurchaseEntryPoint", tX), d.label = 1;
                                case 1:
                                    var h, f, m;
                                    return d.trys.push([1, 3, , 4]), (!e || !(e.startsWith("/catalog/") || e.startsWith("/bundles/") || e.startsWith("/game-pass/") || e.startsWith(ty)) || e.includes("UpsellUuid=")) && (en.expireUpsellCookie(), window.location.href = (0, t2.getAbsoluteUrl)("/catalog")), [4, (h = r, f = null == r ? void 0 : r.dataset, m = null == n ? void 0 : n.dataset, w(function() {
                                        var t, n, r, a, i, o, u, s, l, c, d, p;
                                        return L(this, function(E) {
                                            switch (E.label) {
                                                case 0:
                                                    return [4, w(function() {
                                                        var t, n, r, a, i, o, u, s, l;
                                                        return L(this, function(c) {
                                                            var d, h;
                                                            switch (c.label) {
                                                                case 0:
                                                                    if ((t = en.parseUpsellCookie()) && 0 !== Object.keys(t).length && (!t.targetItemUrl || e.startsWith(t.targetItemUrl)) || (iJ("AutoPurchasePotentialHackingActionSpotted2", tX), ug(tH, {
                                                                            itemPath: e,
                                                                            upsellCookieData: t
                                                                        }), nr(), uo(e)), (n = m) || (nr(), uo(e)), t.subscriptionTargetKey) return a = {
                                                                        expectedPrice: t.expectedPrice || "0",
                                                                        expectedCurrency: t.expectedCurrency || "1",
                                                                        expectedSellerId: t.expectedSellerId || "",
                                                                        assetType: "Subscription",
                                                                        productId: t.productId || "0",
                                                                        itemName: String(t.itemName || (null == f ? void 0 : f.itemName) || ""),
                                                                        subscriptionTargetKey: String(null != (r = t.subscriptionTargetKey) ? r : "")
                                                                    }, [2, [n, a]];
                                                                    c.label = 1;
                                                                case 1:
                                                                    return c.trys.push([1, 3, , 4]), [4, (o = t.collectibleItemId ? null == f ? void 0 : f.productId : t.productId, w(function() {
                                                                        var t, n;
                                                                        return L(this, function(r) {
                                                                            switch (r.label) {
                                                                                case 0:
                                                                                    if (!o) return [2, Promise.reject()];
                                                                                    r.label = 1;
                                                                                case 1:
                                                                                    return r.trys.push([1, 3, , 4]), [4, w(function() {
                                                                                        var e, t, n, r;
                                                                                        return L(this, function(a) {
                                                                                            switch (a.label) {
                                                                                                case 0:
                                                                                                    e = "/v1/products/{productId}".replace("{productId}", o), t = {
                                                                                                        url: "".concat(es.EnvironmentUrls.economyApi).concat(e),
                                                                                                        withCredentials: !0
                                                                                                    }, a.label = 1;
                                                                                                case 1:
                                                                                                    return a.trys.push([1, 3, , 4]), [4, t$.get(t)];
                                                                                                case 2:
                                                                                                    if (200 !== (n = a.sent()).status || "Success" !== n.data.reason) return [2, Promise.reject(null == n || null == (r = n.data) ? void 0 : r.reason)];
                                                                                                    return [2, Promise.resolve(n.data)];
                                                                                                case 3:
                                                                                                    return [2, Promise.reject(a.sent())];
                                                                                                case 4:
                                                                                                    return [2]
                                                                                            }
                                                                                        })
                                                                                    })()];
                                                                                case 2:
                                                                                    if (!(t = r.sent()) || 0 === Object.keys(t).length) return iJ("AutoPurchasePotentialHackingActionSpotted3", tX), ug(tj, {
                                                                                        itemPath: e,
                                                                                        productId: o
                                                                                    }), [2, Promise.reject()];
                                                                                    return [2, t];
                                                                                case 3:
                                                                                    return n = r.sent(), iJ("AutoPurchasePotentialHackingActionSpotted4", tX), ug(tG, {
                                                                                        itemPath: e,
                                                                                        productId: o,
                                                                                        error: n
                                                                                    }), [2, Promise.reject(n)];
                                                                                case 4:
                                                                                    return [2]
                                                                            }
                                                                        })
                                                                    })())];
                                                                case 2:
                                                                    return i = c.sent(), [3, 4];
                                                                case 3:
                                                                    return u = c.sent(), ug(tW, {
                                                                        itemPath: e,
                                                                        upsellCookieData: t,
                                                                        error: u
                                                                    }), nr(), uo(e), [2, Promise.reject()];
                                                                case 4:
                                                                    return [4, (d = i.assetId, h = i.assetType, w(function() {
                                                                        var e, t, n, r, a;
                                                                        return L(this, function(i) {
                                                                            switch (i.label) {
                                                                                case 0:
                                                                                    h === tP ? (t = "/v1/game-passes", e = {
                                                                                        gamePassIds: d
                                                                                    }) : h === tT ? (t = "/v1/bundles/thumbnails", e = {
                                                                                        bundleIds: d
                                                                                    }) : (t = "/v1/assets", e = {
                                                                                        assetIds: d
                                                                                    }), e = er({}, e, tS), n = {
                                                                                        url: "".concat(es.EnvironmentUrls.thumbnailsApi).concat(t),
                                                                                        withCredentials: !0
                                                                                    }, i.label = 1;
                                                                                case 1:
                                                                                    return i.trys.push([1, 3, , 4]), [4, t$.get(n, e)];
                                                                                case 2:
                                                                                    if (a = K((r = i.sent()).data.data, 1)[0], 200 !== r.status || !a) return [2, Promise.resolve(null)];
                                                                                    return [2, Promise.resolve(a.imageUrl)];
                                                                                case 3:
                                                                                    return i.sent(), [2, Promise.resolve(null)];
                                                                                case 4:
                                                                                    return [2]
                                                                            }
                                                                        })
                                                                    })())];
                                                                case 5:
                                                                    return s = c.sent(), n.imageurl = s || n.imageurl, l = {
                                                                        expectedPrice: t.expectedPrice || "0",
                                                                        expectedCurrency: t.expectedCurrency || "1",
                                                                        expectedSellerId: t.expectedSellerId || "",
                                                                        itemId: i.assetId || (null == f ? void 0 : f.itemId),
                                                                        itemName: i.assetName || (null == f ? void 0 : f.itemName),
                                                                        assetType: i.assetType || (null == f ? void 0 : f.assetType),
                                                                        assetGranted: null == f ? void 0 : f.assetGranted,
                                                                        assetTypeDisplayName: i.assetTypeDisplayName || (null == f ? void 0 : f.assetTypeDisplayName),
                                                                        assetTypeId: null == f ? void 0 : f.assetTypeId,
                                                                        productId: i.productId || t.productId || (null == f ? void 0 : f.productId),
                                                                        itemType: i.assetType || (null == f ? void 0 : f.itemType),
                                                                        currentTime: null == f ? void 0 : f.currentTime,
                                                                        isPurchaseEnabled: null == f ? void 0 : f.isPurchaseEnabled,
                                                                        placeproductpromotionId: null == f ? void 0 : f.placeproductpromotionId,
                                                                        userassetId: t.userAssetId || (null == f ? void 0 : f.userassetId),
                                                                        collectibleItemId: t.collectibleItemId || (null == f ? void 0 : f.collectibleItemId),
                                                                        collectibleItemInstanceId: t.collectibleItemInstanceId || (null == f ? void 0 : f.collectibleItemInstanceId),
                                                                        collectibleProductId: t.collectibleProductId || (null == f ? void 0 : f.collectibleProductId)
                                                                    }, [2, [n, l]]
                                                            }
                                                        })
                                                    })()];
                                                case 1:
                                                    n = (t = K.apply(void 0, [E.sent(), 2]))[0], a = (r = t[1]).placeproductpromotionId, i = "LibraryItem" === (uv.PageNameProvider.getInternalPageName() || ""), o = parseInt(n.userBalanceRobux, 10), u = parseInt(r.expectedCurrency, 10), s = parseInt(r.expectedPrice, 10), l = parseInt(r.expectedSellerId, 10), c = {
                                                        itemContainerElemClassList: null == h ? void 0 : h.classList,
                                                        assetType: r.assetType,
                                                        assetName: (0, t1.escapeHtml)(r.itemName),
                                                        expectedSellerId: l,
                                                        expectedCurrency: u,
                                                        expectedPrice: s,
                                                        productId: r.productId,
                                                        isLibrary: i,
                                                        itemThumbnailUrl: n.imageurl,
                                                        itemPath: e,
                                                        alertImageUrl: n.alerturl,
                                                        userBalance: o,
                                                        itemPurchaseAjaxData: n,
                                                        itemDetail: r
                                                    }, a && (c.expectedPromoId = parseInt(a, 10)), r.userassetId && (c.userAssetId = parseInt(r.userassetId, 10)), (p = function(e) {
                                                        if (!e) return [];
                                                        try {
                                                            var t = window.sessionStorage.getItem(nn(e));
                                                            if (!t) return [];
                                                            var n = JSON.parse(t);
                                                            if (Array.isArray(n)) return n.filter(function(e) {
                                                                return "string" == typeof e
                                                            });
                                                            return []
                                                        } catch (e) {
                                                            return []
                                                        }
                                                    }(d = en.parseUpsellCookie().upsellUuid)).length && (c.offerIds = p);
                                                    if (d) try {
                                                        window.sessionStorage.removeItem(nn(d))
                                                    } catch (e) {}
                                                    return [2, c]
                                            }
                                        })
                                    })())];
                                case 2:
                                    return a = d.sent(), [3, 4];
                                case 3:
                                    return d.sent(), this.loadingOverlay.hide(), nr(), [2, Promise.resolve()];
                                case 4:
                                    i = this.translationResource.get(tU, {}), o = a.userBalance, u = a.expectedPrice, d.label = 5;
                                case 5:
                                    if (d.trys.push([5, 9, , 10]), e.startsWith(ty) && (null == (s = document.getElementById("tab-store")) || s.click()), !(o > u)) return [3, 7];
                                    return this.loadingOverlay.updateMessage(i), [4, uf(a, t, this.loadingOverlay, this.translationResource)];
                                case 6:
                                    return d.sent(), this._state.purchased = !0, [2, Promise.resolve()];
                                case 7:
                                    return [4, this._checkBalanceAndPurchase(a, t)];
                                case 8:
                                    return d.sent(), [3, 10];
                                case 9:
                                    return l = d.sent(), this.loadingOverlay.hide(), iJ(tQ, null == a ? void 0 : a.assetType), ug(tV, {
                                        itemPurchaseObj: a,
                                        error: l
                                    }), nr(), [3, 10];
                                case 10:
                                    return [2, Promise.resolve()]
                            }
                        })
                    }).apply(this, arguments)
                }
            }]), e
        }();
    if (void 0 === window.Roblox && (window.Roblox = {}), void 0 === window.Roblox.ItemPurchaseUpsellService) {
        window.Roblox.ItemPurchaseUpsellService = new uA;
        var uC = !1;
        p = function() {
            if (!uC && I) {
                uC = !0;
                var e = I.createElement("div");
                I.body.appendChild(e), (0, T.render)((0, C.createElement)(nc), e)
            }
        }
    }
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected(document.currentScript && document.currentScript.getAttribute("data-bundlename") || "ItemPurchaseUpsell");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/itemPurchaseUpsell-cef791c08807a0f7.js.map
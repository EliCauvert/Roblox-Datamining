! function() {
    var e = {
            942: function(e) {
                function t(e) {
                    return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
                }!
                /*!
                	Copyright (c) 2018 Jed Watson.
                	Licensed under the MIT License (MIT), see
                	http://jedwatson.github.io/classnames
                */
                function() {
                    "use strict";
                    var n = {}.hasOwnProperty;

                    function r() {
                        for (var e = "", o = 0; o < arguments.length; o++) {
                            var i = arguments[o];
                            i && (e = a(e, function(e) {
                                if ("string" == typeof e || "number" == typeof e) return e;
                                if ((void 0 === e ? "undefined" : t(e)) !== "object") return "";
                                if (Array.isArray(e)) return r.apply(null, e);
                                if (e.toString !== Object.prototype.toString && !e.toString.toString().includes("[native code]")) return e.toString();
                                var o = "";
                                for (var i in e) n.call(e, i) && e[i] && (o = a(o, i));
                                return o
                            }(i)))
                        }
                        return e
                    }

                    function a(e, t) {
                        return t ? e ? e + " " + t : e + t : e
                    }
                    e.exports ? (r.default = r, e.exports = r) : "function" == typeof define && "object" === t(define.amd) && define.amd ? define("classnames", [], function() {
                        return r
                    }) : window.classNames = r
                }()
            },
            677: function(e, t, n) {
                "use strict";
                e.exports = {}
            },
            841: function(e, t, n) {
                "use strict";
                e.exports = {}
            },
            227: function(e, t, n) {
                "use strict";
                e.exports = {}
            },
            47: function(e, t, n) {
                "use strict";
                e.exports = {}
            },
            57: function(e, t, n) {
                "use strict";
                e.exports = {}
            }
        },
        t = {};

    function n(r) {
        var a = t[r];
        if (void 0 !== a) return a.exports;
        var o = t[r] = {
            exports: {}
        };
        return e[r](o, o.exports, n), o.exports
    }
    n.m = e, n.n = function(e) {
        var t = e && e.__esModule ? function() {
            return e.default
        } : function() {
            return e
        };
        return n.d(t, {
            a: t
        }), t
    }, n.d = function(e, t) {
        for (var r in t) n.o(t, r) && !n.o(e, r) && Object.defineProperty(e, r, {
            enumerable: !0,
            get: t[r]
        })
    }, n.k = function(e) {
        return "" + e + ".css"
    }, n.g = function() {
        if ("object" == typeof globalThis) return globalThis;
        try {
            return this || Function("return this")()
        } catch (e) {
            if ("object" == typeof window) return window
        }
    }(), n.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, n.r = function(e) {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, n.rv = function() {
        return "1.5.7"
    }, n.g.importScripts && (r = n.g.location + "");
    var r, a = n.g.document;
    if (!r && a && (a.currentScript && "SCRIPT" === a.currentScript.tagName.toUpperCase() && (r = a.currentScript.src), !r)) {
        var o = a.getElementsByTagName("script");
        if (o.length)
            for (var i = o.length - 1; i > -1 && (!r || !/^http(s?):/.test(r));) r = o[i--].src
    }
    if (!r) throw Error("Automatic publicPath is not supported in this browser");
    n.p = r.replace(/^blob:/, "").replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/[^\/]+$/, "/"), n.ruid = "bundler=rspack@1.5.7",
        function() {
            "use strict";
            var e, t, r, a, o, i, s, l, u, c, d, f, p, h, y = window.ReactJSX,
                v = window.Roblox,
                m = n.n(v),
                b = window.Roblox["core-scripts"].react,
                g = window.React,
                w = n.n(g),
                S = window.ReactStyleGuide,
                x = window.ReactUtilities;

            function C(e) {
                return (C = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                    return typeof e
                } : function(e) {
                    return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
                })(e)
            }

            function E(e, t) {
                if (t.length < e) throw TypeError(e + " argument" + (e > 1 ? "s" : "") + " required, but only " + t.length + " present")
            }

            function A(e) {
                E(1, arguments);
                var t, n = Object.prototype.toString.call(e);
                return (null != (t = Date) && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t) || "object" === C(e) && "[object Date]" === n ? new Date(e.getTime()) : "number" == typeof e || "[object Number]" === n ? new Date(e) : (("string" == typeof e || "[object String]" === n) && "undefined" != typeof console && (console.warn("Starting with v2.0.0-beta.1 date-fns doesn't accept strings as date arguments. Please use `parseISO` to parse strings. See: https://github.com/date-fns/date-fns/blob/master/docs/upgradeGuide.md#string-arguments"), console.warn(Error().stack)), new Date(NaN))
            }

            function j(e, t) {
                E(2, arguments);
                var n = A(e),
                    r = A(t),
                    a = n.getTime() - r.getTime();
                return a < 0 ? -1 : a > 0 ? 1 : a
            }
            var k = window.EventTracker;

            function T(e) {
                return (T = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                    return typeof e
                } : function(e) {
                    return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
                })(e)
            }
            var P = "dahlia",
                N = "https://js.stripe.com",
                I = "".concat(N, "/").concat(P, "/stripe.js"),
                U = /^https:\/\/js\.stripe\.com\/v3\/?(\?.*)?$/,
                M = /^https:\/\/js\.stripe\.com\/(v3|[a-z]+)\/stripe\.js(\?.*)?$/,
                O = function() {
                    for (var e = document.querySelectorAll('script[src^="'.concat(N, '"]')), t = 0; t < e.length; t++) {
                        var n, r = e[t];
                        if (n = r.src, U.test(n) || M.test(n)) return r
                    }
                    return null
                },
                D = function(e) {
                    var t = e && !e.advancedFraudSignals ? "?advancedFraudSignals=false" : "",
                        n = document.createElement("script");
                    n.src = "".concat(I).concat(t);
                    var r = document.head || document.body;
                    if (!r) throw Error("Expected document.body not to be null. Stripe.js requires a <body> element.");
                    return r.appendChild(n), n
                },
                _ = function(e, t) {
                    e && e._registerWrapper && e._registerWrapper({
                        name: "stripe-js",
                        version: "9.1.0",
                        startTime: t
                    })
                },
                R = null,
                F = null,
                B = null,
                L = function(e, t, n) {
                    if (null === e) return null;
                    var r, a = t[0];
                    if ("string" != typeof a) throw Error("Expected publishable key to be of type string, got type ".concat(T(a), " instead."));
                    var o = a.match(/^pk_test/),
                        i = 3 === (r = e.version) ? "v3" : r;
                    o && i !== P && console.warn("Stripe.js@".concat(i, " was loaded on the page, but @stripe/stripe-js@").concat("9.1.0", " expected Stripe.js@").concat(P, ". This may result in unexpected behavior. For more information, see https://docs.stripe.com/sdks/stripejs-versioning"));
                    var s = e.apply(void 0, t);
                    return _(s, n), s
                },
                G = !1,
                H = function() {
                    return h ? h : h = (null !== R ? R : (R = new Promise(function(e, t) {
                        if ("undefined" == typeof window || "undefined" == typeof document) return void e(null);
                        if (window.Stripe, window.Stripe) return void e(window.Stripe);
                        try {
                            var n, r = O();
                            r ? r && null !== B && null !== F && (r.removeEventListener("load", B), r.removeEventListener("error", F), null == (n = r.parentNode) || n.removeChild(r), r = D(null)) : r = D(null), B = function() {
                                window.Stripe ? e(window.Stripe) : t(Error("Stripe.js not available"))
                            }, F = function(e) {
                                t(Error("Failed to load Stripe.js", {
                                    cause: e
                                }))
                            }, r.addEventListener("load", B), r.addEventListener("error", F)
                        } catch (e) {
                            t(e);
                            return
                        }
                    })).catch(function(e) {
                        return R = null, Promise.reject(e)
                    })).catch(function(e) {
                        return h = null, Promise.reject(e)
                    })
                };
            Promise.resolve().then(function() {
                return H()
            }).catch(function(e) {
                G || console.warn(e)
            });
            var W = function() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    G = !0;
                    var r = Date.now();
                    return H().then(function(e) {
                        return L(e, t, r)
                    })
                },
                Y = window.PropTypes,
                q = n.n(Y);

            function V(e, t) {
                var n = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var r = Object.getOwnPropertySymbols(e);
                    t && (r = r.filter(function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    })), n.push.apply(n, r)
                }
                return n
            }

            function X(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {};
                    t % 2 ? V(Object(n), !0).forEach(function(t) {
                        Q(e, t, n[t])
                    }) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(n)) : V(Object(n)).forEach(function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(n, t))
                    })
                }
                return e
            }

            function z(e) {
                return (z = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                    return typeof e
                } : function(e) {
                    return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
                })(e)
            }

            function Q(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function $(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = e && ("undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"]);
                    if (null != a) {
                        var o = [],
                            i = !0,
                            s = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            s = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (s) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return K(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(e);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return K(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function K(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            var J = function(e, t, n) {
                    var r = !!n,
                        a = w().useRef(n);
                    w().useEffect(function() {
                        a.current = n
                    }, [n]), w().useEffect(function() {
                        if (!r || !e) return function() {};
                        var n = function() {
                            a.current && a.current.apply(a, arguments)
                        };
                        return e.on(t, n),
                            function() {
                                e.off(t, n)
                            }
                    }, [r, t, e, a])
                },
                Z = function(e) {
                    var t = w().useRef(e);
                    return w().useEffect(function() {
                        t.current = e
                    }, [e]), t.current
                },
                ee = function(e) {
                    return null !== e && "object" === z(e)
                },
                et = "[object Object]",
                en = function e(t, n) {
                    if (!ee(t) || !ee(n)) return t === n;
                    var r = Array.isArray(t);
                    if (r !== Array.isArray(n)) return !1;
                    var a = Object.prototype.toString.call(t) === et;
                    if (a !== (Object.prototype.toString.call(n) === et)) return !1;
                    if (!a && !r) return t === n;
                    var o = Object.keys(t),
                        i = Object.keys(n);
                    if (o.length !== i.length) return !1;
                    for (var s = {}, l = 0; l < o.length; l += 1) s[o[l]] = !0;
                    for (var u = 0; u < i.length; u += 1) s[i[u]] = !0;
                    var c = Object.keys(s);
                    return c.length === o.length && c.every(function(r) {
                        return e(t[r], n[r])
                    })
                },
                er = function(e, t, n) {
                    return ee(e) ? Object.keys(e).reduce(function(r, a) {
                        var o = !ee(t) || !en(e[a], t[a]);
                        return n.includes(a) ? (o && console.warn("Unsupported prop change: options.".concat(a, " is not a mutable property.")), r) : o ? X(X({}, r || {}), {}, Q({}, a, e[a])) : r
                    }, null) : null
                },
                ea = "Invalid prop `stripe` supplied to `Elements`. We recommend using the `loadStripe` utility from `@stripe/stripe-js`. See https://stripe.com/docs/stripe-js/react#elements-props-stripe for details.",
                eo = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : ea;
                    if (null === e || ee(e) && "function" == typeof e.elements && "function" == typeof e.createToken && "function" == typeof e.createPaymentMethod && "function" == typeof e.confirmCardPayment) return e;
                    throw Error(t)
                },
                ei = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : ea;
                    if (ee(e) && "function" == typeof e.then) return {
                        tag: "async",
                        stripePromise: Promise.resolve(e).then(function(e) {
                            return eo(e, t)
                        })
                    };
                    var n = eo(e, t);
                    return null === n ? {
                        tag: "empty"
                    } : {
                        tag: "sync",
                        stripe: n
                    }
                },
                es = function(e) {
                    e && e._registerWrapper && e.registerAppInfo && (e._registerWrapper({
                        name: "react-stripe-js",
                        version: "6.1.0"
                    }), e.registerAppInfo({
                        name: "react-stripe-js",
                        version: "6.1.0",
                        url: "https://stripe.com/docs/stripe-js/react"
                    }))
                },
                el = w().createContext(null);
            el.displayName = "ElementsContext";
            var eu = function(e, t) {
                    if (!e) throw Error("Could not find Elements context; You need to wrap the part of your app that ".concat(t, " in an <Elements> provider."));
                    return e
                },
                ec = function(e) {
                    var t = e.stripe,
                        n = e.options,
                        r = e.children,
                        a = w().useMemo(function() {
                            return ei(t)
                        }, [t]),
                        o = $(w().useState(function() {
                            return {
                                stripe: "sync" === a.tag ? a.stripe : null,
                                elements: "sync" === a.tag ? a.stripe.elements(n) : null
                            }
                        }), 2),
                        i = o[0],
                        s = o[1];
                    w().useEffect(function() {
                        var e = !0,
                            t = function(e) {
                                s(function(t) {
                                    return t.stripe ? t : {
                                        stripe: e,
                                        elements: e.elements(n)
                                    }
                                })
                            };
                        return "async" !== a.tag || i.stripe ? "sync" !== a.tag || i.stripe || t(a.stripe) : a.stripePromise.then(function(n) {
                                n && e && t(n)
                            }),
                            function() {
                                e = !1
                            }
                    }, [a, i, n]);
                    var l = Z(t);
                    w().useEffect(function() {
                        null !== l && l !== t && console.warn("Unsupported prop change on Elements: You cannot change the `stripe` prop after setting it.")
                    }, [l, t]);
                    var u = Z(n);
                    return w().useEffect(function() {
                        if (i.elements) {
                            var e = er(n, u, ["clientSecret", "fonts"]);
                            e && i.elements.update(e)
                        }
                    }, [n, u, i.elements]), w().useEffect(function() {
                        es(i.stripe)
                    }, [i.stripe]), w().createElement(el.Provider, {
                        value: i
                    }, r)
                };
            ec.propTypes = {
                stripe: q().any,
                options: q().object
            };
            q().func.isRequired;
            var ed = w().createContext(null);
            ed.displayName = "CheckoutContext";
            var ef = function(e) {
                    var t = w().useContext(ed),
                        n = w().useContext(el);
                    if (!t) return eu(n, e);
                    if (!n) return t;
                    throw Error("You cannot wrap the part of your app that ".concat(e, " in both a checkout provider and <Elements> provider."))
                },
                ep = ["mode"],
                eh = function(e, t, n) {
                    var r = "".concat(e.charAt(0).toUpperCase() + e.slice(1), "Element"),
                        a = t ? function(e) {
                            ef("mounts <".concat(r, ">"));
                            var t = e.id,
                                n = e.className;
                            return w().createElement("div", {
                                id: t,
                                className: n
                            })
                        } : function(t) {
                            var n, a = t.id,
                                o = t.className,
                                i = t.options,
                                s = void 0 === i ? {} : i,
                                l = t.onBlur,
                                u = t.onFocus,
                                c = t.onReady,
                                d = t.onChange,
                                f = t.onEscape,
                                p = t.onClick,
                                h = t.onLoadError,
                                y = t.onLoaderStart,
                                v = t.onNetworksChange,
                                m = t.onConfirm,
                                b = t.onCancel,
                                g = t.onShippingAddressChange,
                                S = t.onShippingRateChange,
                                x = t.onSavedPaymentMethodRemove,
                                C = t.onSavedPaymentMethodUpdate,
                                E = ef("mounts <".concat(r, ">")),
                                A = "elements" in E ? E.elements : null,
                                j = "checkoutState" in E ? E.checkoutState : null,
                                k = (null == j ? void 0 : j.type) === "success" || (null == j ? void 0 : j.type) === "loading" ? j.sdk : null,
                                T = $(w().useState(null), 2),
                                P = T[0],
                                N = T[1],
                                I = w().useRef(null),
                                U = w().useRef(null);
                            J(P, "blur", l), J(P, "focus", u), J(P, "escape", f), J(P, "click", p), J(P, "loaderror", h), J(P, "loaderstart", y), J(P, "networkschange", v), J(P, "confirm", m), J(P, "cancel", b), J(P, "shippingaddresschange", g), J(P, "shippingratechange", S), J(P, "savedpaymentmethodremove", x), J(P, "savedpaymentmethodupdate", C), J(P, "change", d), c && (n = "expressCheckout" === e ? c : function() {
                                c(P)
                            }), J(P, "ready", n), w().useLayoutEffect(function() {
                                if (null === I.current && null !== U.current && (A || k)) {
                                    var t = null;
                                    if (k) switch (e) {
                                        case "paymentForm":
                                            t = k.createForm(s);
                                            break;
                                        case "payment":
                                            t = k.createPaymentElement(s);
                                            break;
                                        case "address":
                                            if ("mode" in s) {
                                                var n = s.mode,
                                                    a = function(e, t) {
                                                        if (null == e) return {};
                                                        var n, r, a = function(e, t) {
                                                            if (null == e) return {};
                                                            var n, r, a = {},
                                                                o = Object.keys(e);
                                                            for (r = 0; r < o.length; r++) n = o[r], t.indexOf(n) >= 0 || (a[n] = e[n]);
                                                            return a
                                                        }(e, t);
                                                        if (Object.getOwnPropertySymbols) {
                                                            var o = Object.getOwnPropertySymbols(e);
                                                            for (r = 0; r < o.length; r++) n = o[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n])
                                                        }
                                                        return a
                                                    }(s, ep);
                                                if ("shipping" === n) t = k.createShippingAddressElement(a);
                                                else if ("billing" === n) t = k.createBillingAddressElement(a);
                                                else throw Error("Invalid options.mode. mode must be 'billing' or 'shipping'.")
                                            } else throw Error("You must supply options.mode. mode must be 'billing' or 'shipping'.");
                                            break;
                                        case "expressCheckout":
                                            t = k.createExpressCheckoutElement(s);
                                            break;
                                        case "currencySelector":
                                            t = k.createCurrencySelectorElement();
                                            break;
                                        case "taxId":
                                            t = k.createTaxIdElement(s);
                                            break;
                                        default:
                                            throw Error("<".concat(r, "> is not supported inside a checkout provider. Use an <Elements> provider instead."))
                                    } else A && (t = A.create(e, s));
                                    I.current = t, N(t), t && t.mount(U.current)
                                }
                            }, [A, k, s]);
                            var M = Z(s);
                            return w().useEffect(function() {
                                if (I.current) {
                                    var e = er(s, M, ["paymentRequest"]);
                                    e && "update" in I.current && I.current.update(e)
                                }
                            }, [s, M]), w().useLayoutEffect(function() {
                                return function() {
                                    if (I.current && "function" == typeof I.current.destroy) try {
                                        I.current.destroy(), I.current = null
                                    } catch (e) {}
                                }
                            }, []), w().createElement("div", {
                                id: a,
                                className: o,
                                ref: U
                            })
                        };
                    return a.propTypes = {
                        id: q().string,
                        className: q().string,
                        onChange: q().func,
                        onBlur: q().func,
                        onFocus: q().func,
                        onReady: q().func,
                        onEscape: q().func,
                        onClick: q().func,
                        onLoadError: q().func,
                        onLoaderStart: q().func,
                        onNetworksChange: q().func,
                        onConfirm: q().func,
                        onCancel: q().func,
                        onShippingAddressChange: q().func,
                        onShippingRateChange: q().func,
                        onSavedPaymentMethodRemove: q().func,
                        onSavedPaymentMethodUpdate: q().func,
                        options: q().object
                    }, a.displayName = r, a.__elementType = e, a
                },
                ey = "undefined" == typeof window;
            w().createContext(null).displayName = "EmbeddedCheckoutProviderContext", eh("auBankAccount", ey), eh("card", ey), eh("cardNumber", ey), eh("cardExpiry", ey), eh("cardCvc", ey), eh("iban", ey);
            var ev = eh("payment", ey);
            eh("expressCheckout", ey), eh("paymentRequestButton", ey), eh("linkAuthentication", ey);
            var em = eh("address", ey);

            function eb(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function eg(e, t) {
                var n = "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                if (!n) {
                    if (Array.isArray(e) || (n = function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return eb(e, void 0);
                                var n = ({}).toString.call(e).slice(8, -1);
                                return "Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n ? Array.from(e) : "Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n) ? eb(e, void 0) : void 0
                            }
                        }(e)) || t && e && "number" == typeof e.length) {
                        n && (e = n);
                        var r = 0,
                            a = function() {};
                        return {
                            s: a,
                            n: function() {
                                return r >= e.length ? {
                                    done: !0
                                } : {
                                    done: !1,
                                    value: e[r++]
                                }
                            },
                            e: function(e) {
                                throw e
                            },
                            f: a
                        }
                    }
                    throw TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }
                var o, i = !0,
                    s = !1;
                return {
                    s: function() {
                        n = n.call(e)
                    },
                    n: function() {
                        var e = n.next();
                        return i = e.done, e
                    },
                    e: function(e) {
                        s = !0, o = e
                    },
                    f: function() {
                        try {
                            i || null == n.return || n.return()
                        } finally {
                            if (s) throw o
                        }
                    }
                }
            }
            eh("shippingAddress", ey), eh("paymentMethodMessaging", ey), eh("taxId", ey), eh("issuingCardNumberDisplay", ey), eh("issuingCardCvcDisplay", ey), eh("issuingCardExpiryDisplay", ey), eh("issuingCardPinDisplay", ey), eh("issuingCardCopyButton", ey);
            var ew = {
                lessThanXSeconds: {
                    one: "less than a second",
                    other: "less than {{count}} seconds"
                },
                xSeconds: {
                    one: "1 second",
                    other: "{{count}} seconds"
                },
                halfAMinute: "half a minute",
                lessThanXMinutes: {
                    one: "less than a minute",
                    other: "less than {{count}} minutes"
                },
                xMinutes: {
                    one: "1 minute",
                    other: "{{count}} minutes"
                },
                aboutXHours: {
                    one: "about 1 hour",
                    other: "about {{count}} hours"
                },
                xHours: {
                    one: "1 hour",
                    other: "{{count}} hours"
                },
                xDays: {
                    one: "1 day",
                    other: "{{count}} days"
                },
                aboutXWeeks: {
                    one: "about 1 week",
                    other: "about {{count}} weeks"
                },
                xWeeks: {
                    one: "1 week",
                    other: "{{count}} weeks"
                },
                aboutXMonths: {
                    one: "about 1 month",
                    other: "about {{count}} months"
                },
                xMonths: {
                    one: "1 month",
                    other: "{{count}} months"
                },
                aboutXYears: {
                    one: "about 1 year",
                    other: "about {{count}} years"
                },
                xYears: {
                    one: "1 year",
                    other: "{{count}} years"
                },
                overXYears: {
                    one: "over 1 year",
                    other: "over {{count}} years"
                },
                almostXYears: {
                    one: "almost 1 year",
                    other: "almost {{count}} years"
                }
            };

            function eS(e) {
                return function() {
                    var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        n = t.width ? String(t.width) : e.defaultWidth;
                    return e.formats[n] || e.formats[e.defaultWidth]
                }
            }
            var ex = {
                    date: eS({
                        formats: {
                            full: "EEEE, MMMM do, y",
                            long: "MMMM do, y",
                            medium: "MMM d, y",
                            short: "MM/dd/yyyy"
                        },
                        defaultWidth: "full"
                    }),
                    time: eS({
                        formats: {
                            full: "h:mm:ss a zzzz",
                            long: "h:mm:ss a z",
                            medium: "h:mm:ss a",
                            short: "h:mm a"
                        },
                        defaultWidth: "full"
                    }),
                    dateTime: eS({
                        formats: {
                            full: "{{date}} 'at' {{time}}",
                            long: "{{date}} 'at' {{time}}",
                            medium: "{{date}}, {{time}}",
                            short: "{{date}}, {{time}}"
                        },
                        defaultWidth: "full"
                    })
                },
                eC = {
                    lastWeek: "'last' eeee 'at' p",
                    yesterday: "'yesterday at' p",
                    today: "'today at' p",
                    tomorrow: "'tomorrow at' p",
                    nextWeek: "eeee 'at' p",
                    other: "P"
                };

            function eE(e) {
                return function(t, n) {
                    var r;
                    if ("formatting" === (null != n && n.context ? String(n.context) : "standalone") && e.formattingValues) {
                        var a = e.defaultFormattingWidth || e.defaultWidth,
                            o = null != n && n.width ? String(n.width) : a;
                        r = e.formattingValues[o] || e.formattingValues[a]
                    } else {
                        var i = e.defaultWidth,
                            s = null != n && n.width ? String(n.width) : e.defaultWidth;
                        r = e.values[s] || e.values[i]
                    }
                    return r[e.argumentCallback ? e.argumentCallback(t) : t]
                }
            }

            function eA(e) {
                return function(t) {
                    var n, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        a = r.width,
                        o = a && e.matchPatterns[a] || e.matchPatterns[e.defaultMatchWidth],
                        i = t.match(o);
                    if (!i) return null;
                    var s = i[0],
                        l = a && e.parsePatterns[a] || e.parsePatterns[e.defaultParseWidth],
                        u = Array.isArray(l) ? function(e, t) {
                            for (var n = 0; n < e.length; n++)
                                if (t(e[n])) return n
                        }(l, function(e) {
                            return e.test(s)
                        }) : function(e, t) {
                            for (var n in e)
                                if (e.hasOwnProperty(n) && t(e[n])) return n
                        }(l, function(e) {
                            return e.test(s)
                        });
                    return n = e.valueCallback ? e.valueCallback(u) : u, {
                        value: n = r.valueCallback ? r.valueCallback(n) : n,
                        rest: t.slice(s.length)
                    }
                }
            }
            var ej = {
                code: "en-US",
                formatDistance: function(e, t, n) {
                    var r, a = ew[e];
                    if (r = "string" == typeof a ? a : 1 === t ? a.one : a.other.replace("{{count}}", t.toString()), null != n && n.addSuffix)
                        if (n.comparison && n.comparison > 0) return "in " + r;
                        else return r + " ago";
                    return r
                },
                formatLong: ex,
                formatRelative: function(e, t, n, r) {
                    return eC[e]
                },
                localize: {
                    ordinalNumber: function(e, t) {
                        var n = Number(e),
                            r = n % 100;
                        if (r > 20 || r < 10) switch (r % 10) {
                            case 1:
                                return n + "st";
                            case 2:
                                return n + "nd";
                            case 3:
                                return n + "rd"
                        }
                        return n + "th"
                    },
                    era: eE({
                        values: {
                            narrow: ["B", "A"],
                            abbreviated: ["BC", "AD"],
                            wide: ["Before Christ", "Anno Domini"]
                        },
                        defaultWidth: "wide"
                    }),
                    quarter: eE({
                        values: {
                            narrow: ["1", "2", "3", "4"],
                            abbreviated: ["Q1", "Q2", "Q3", "Q4"],
                            wide: ["1st quarter", "2nd quarter", "3rd quarter", "4th quarter"]
                        },
                        defaultWidth: "wide",
                        argumentCallback: function(e) {
                            return e - 1
                        }
                    }),
                    month: eE({
                        values: {
                            narrow: ["J", "F", "M", "A", "M", "J", "J", "A", "S", "O", "N", "D"],
                            abbreviated: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                            wide: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
                        },
                        defaultWidth: "wide"
                    }),
                    day: eE({
                        values: {
                            narrow: ["S", "M", "T", "W", "T", "F", "S"],
                            short: ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"],
                            abbreviated: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
                            wide: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
                        },
                        defaultWidth: "wide"
                    }),
                    dayPeriod: eE({
                        values: {
                            narrow: {
                                am: "a",
                                pm: "p",
                                midnight: "mi",
                                noon: "n",
                                morning: "morning",
                                afternoon: "afternoon",
                                evening: "evening",
                                night: "night"
                            },
                            abbreviated: {
                                am: "AM",
                                pm: "PM",
                                midnight: "midnight",
                                noon: "noon",
                                morning: "morning",
                                afternoon: "afternoon",
                                evening: "evening",
                                night: "night"
                            },
                            wide: {
                                am: "a.m.",
                                pm: "p.m.",
                                midnight: "midnight",
                                noon: "noon",
                                morning: "morning",
                                afternoon: "afternoon",
                                evening: "evening",
                                night: "night"
                            }
                        },
                        defaultWidth: "wide",
                        formattingValues: {
                            narrow: {
                                am: "a",
                                pm: "p",
                                midnight: "mi",
                                noon: "n",
                                morning: "in the morning",
                                afternoon: "in the afternoon",
                                evening: "in the evening",
                                night: "at night"
                            },
                            abbreviated: {
                                am: "AM",
                                pm: "PM",
                                midnight: "midnight",
                                noon: "noon",
                                morning: "in the morning",
                                afternoon: "in the afternoon",
                                evening: "in the evening",
                                night: "at night"
                            },
                            wide: {
                                am: "a.m.",
                                pm: "p.m.",
                                midnight: "midnight",
                                noon: "noon",
                                morning: "in the morning",
                                afternoon: "in the afternoon",
                                evening: "in the evening",
                                night: "at night"
                            }
                        },
                        defaultFormattingWidth: "wide"
                    })
                },
                match: {
                    ordinalNumber: (e = {
                        matchPattern: /^(\d+)(th|st|nd|rd)?/i,
                        parsePattern: /\d+/i,
                        valueCallback: function(e) {
                            return parseInt(e, 10)
                        }
                    }, function(t) {
                        var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                            r = t.match(e.matchPattern);
                        if (!r) return null;
                        var a = r[0],
                            o = t.match(e.parsePattern);
                        if (!o) return null;
                        var i = e.valueCallback ? e.valueCallback(o[0]) : o[0];
                        return {
                            value: i = n.valueCallback ? n.valueCallback(i) : i,
                            rest: t.slice(a.length)
                        }
                    }),
                    era: eA({
                        matchPatterns: {
                            narrow: /^(b|a)/i,
                            abbreviated: /^(b\.?\s?c\.?|b\.?\s?c\.?\s?e\.?|a\.?\s?d\.?|c\.?\s?e\.?)/i,
                            wide: /^(before christ|before common era|anno domini|common era)/i
                        },
                        defaultMatchWidth: "wide",
                        parsePatterns: {
                            any: [/^b/i, /^(a|c)/i]
                        },
                        defaultParseWidth: "any"
                    }),
                    quarter: eA({
                        matchPatterns: {
                            narrow: /^[1234]/i,
                            abbreviated: /^q[1234]/i,
                            wide: /^[1234](th|st|nd|rd)? quarter/i
                        },
                        defaultMatchWidth: "wide",
                        parsePatterns: {
                            any: [/1/i, /2/i, /3/i, /4/i]
                        },
                        defaultParseWidth: "any",
                        valueCallback: function(e) {
                            return e + 1
                        }
                    }),
                    month: eA({
                        matchPatterns: {
                            narrow: /^[jfmasond]/i,
                            abbreviated: /^(jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec)/i,
                            wide: /^(january|february|march|april|may|june|july|august|september|october|november|december)/i
                        },
                        defaultMatchWidth: "wide",
                        parsePatterns: {
                            narrow: [/^j/i, /^f/i, /^m/i, /^a/i, /^m/i, /^j/i, /^j/i, /^a/i, /^s/i, /^o/i, /^n/i, /^d/i],
                            any: [/^ja/i, /^f/i, /^mar/i, /^ap/i, /^may/i, /^jun/i, /^jul/i, /^au/i, /^s/i, /^o/i, /^n/i, /^d/i]
                        },
                        defaultParseWidth: "any"
                    }),
                    day: eA({
                        matchPatterns: {
                            narrow: /^[smtwf]/i,
                            short: /^(su|mo|tu|we|th|fr|sa)/i,
                            abbreviated: /^(sun|mon|tue|wed|thu|fri|sat)/i,
                            wide: /^(sunday|monday|tuesday|wednesday|thursday|friday|saturday)/i
                        },
                        defaultMatchWidth: "wide",
                        parsePatterns: {
                            narrow: [/^s/i, /^m/i, /^t/i, /^w/i, /^t/i, /^f/i, /^s/i],
                            any: [/^su/i, /^m/i, /^tu/i, /^w/i, /^th/i, /^f/i, /^sa/i]
                        },
                        defaultParseWidth: "any"
                    }),
                    dayPeriod: eA({
                        matchPatterns: {
                            narrow: /^(a|p|mi|n|(in the|at) (morning|afternoon|evening|night))/i,
                            any: /^([ap]\.?\s?m\.?|midnight|noon|(in the|at) (morning|afternoon|evening|night))/i
                        },
                        defaultMatchWidth: "any",
                        parsePatterns: {
                            any: {
                                am: /^a/i,
                                pm: /^p/i,
                                midnight: /^mi/i,
                                noon: /^no/i,
                                morning: /morning/i,
                                afternoon: /afternoon/i,
                                evening: /evening/i,
                                night: /night/i
                            }
                        },
                        defaultParseWidth: "any"
                    })
                },
                options: {
                    weekStartsOn: 0,
                    firstWeekContainsDate: 1
                }
            };

            function ek(e) {
                if (null === e || !0 === e || !1 === e) return NaN;
                var t = Number(e);
                return isNaN(t) ? t : t < 0 ? Math.ceil(t) : Math.floor(t)
            }
            var eT = function(e, t) {
                    switch (e) {
                        case "P":
                            return t.date({
                                width: "short"
                            });
                        case "PP":
                            return t.date({
                                width: "medium"
                            });
                        case "PPP":
                            return t.date({
                                width: "long"
                            });
                        default:
                            return t.date({
                                width: "full"
                            })
                    }
                },
                eP = function(e, t) {
                    switch (e) {
                        case "p":
                            return t.time({
                                width: "short"
                            });
                        case "pp":
                            return t.time({
                                width: "medium"
                            });
                        case "ppp":
                            return t.time({
                                width: "long"
                            });
                        default:
                            return t.time({
                                width: "full"
                            })
                    }
                },
                eN = {
                    p: eP,
                    P: function(e, t) {
                        var n, r = e.match(/(P+)(p+)?/) || [],
                            a = r[1],
                            o = r[2];
                        if (!o) return eT(e, t);
                        switch (a) {
                            case "P":
                                n = t.dateTime({
                                    width: "short"
                                });
                                break;
                            case "PP":
                                n = t.dateTime({
                                    width: "medium"
                                });
                                break;
                            case "PPP":
                                n = t.dateTime({
                                    width: "long"
                                });
                                break;
                            default:
                                n = t.dateTime({
                                    width: "full"
                                })
                        }
                        return n.replace("{{date}}", eT(a, t)).replace("{{time}}", eP(o, t))
                    }
                },
                eI = ["D", "DD"],
                eU = ["YY", "YYYY"];

            function eM(e, t, n) {
                if ("YYYY" === e) throw RangeError("Use `yyyy` instead of `YYYY` (in `".concat(t, "`) for formatting years to the input `").concat(n, "`; see: https://github.com/date-fns/date-fns/blob/master/docs/unicodeTokens.md"));
                if ("YY" === e) throw RangeError("Use `yy` instead of `YY` (in `".concat(t, "`) for formatting years to the input `").concat(n, "`; see: https://github.com/date-fns/date-fns/blob/master/docs/unicodeTokens.md"));
                if ("D" === e) throw RangeError("Use `d` instead of `D` (in `".concat(t, "`) for formatting days of the month to the input `").concat(n, "`; see: https://github.com/date-fns/date-fns/blob/master/docs/unicodeTokens.md"));
                if ("DD" === e) throw RangeError("Use `dd` instead of `DD` (in `".concat(t, "`) for formatting days of the month to the input `").concat(n, "`; see: https://github.com/date-fns/date-fns/blob/master/docs/unicodeTokens.md"))
            }

            function eO(e) {
                if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                return e
            }

            function eD(e, t) {
                return (eD = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function e_(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        writable: !0,
                        configurable: !0
                    }
                }), Object.defineProperty(e, "prototype", {
                    writable: !1
                }), t && eD(e, t)
            }

            function eR(e) {
                return (eR = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function eF() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (eF = function() {
                    return !!e
                })()
            }

            function eB(e) {
                var t = eF();
                return function() {
                    var n, r = eR(e);
                    n = t ? Reflect.construct(r, arguments, eR(this).constructor) : r.apply(this, arguments);
                    if (n && ("object" == C(n) || "function" == typeof n)) return n;
                    if (void 0 !== n) throw TypeError("Derived constructors may only return object or undefined");
                    return eO(this)
                }
            }

            function eL(e, t) {
                if (null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !t[Symbol.hasInstance](e) : !(e instanceof t)) throw TypeError("Cannot call a class as a function")
            }

            function eG(e) {
                var t = function(e, t) {
                    if ("object" != C(e) || !e) return e;
                    var n = e[Symbol.toPrimitive];
                    if (void 0 !== n) {
                        var r = n.call(e, t || "default");
                        if ("object" != C(r)) return r;
                        throw TypeError("@@toPrimitive must return a primitive value.")
                    }
                    return ("string" === t ? String : Number)(e)
                }(e, "string");
                return "symbol" == C(t) ? t : t + ""
            }

            function eH(e, t) {
                for (var n = 0; n < t.length; n++) {
                    var r = t[n];
                    r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, eG(r.key), r)
                }
            }

            function eW(e, t, n) {
                return t && eH(e.prototype, t), n && eH(e, n), Object.defineProperty(e, "prototype", {
                    writable: !1
                }), e
            }

            function eY(e, t, n) {
                return (t = eG(t)) in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }
            var eq = function() {
                    function e() {
                        eL(this, e), eY(this, "priority", void 0), eY(this, "subPriority", 0)
                    }
                    return eW(e, [{
                        key: "validate",
                        value: function(e, t) {
                            return !0
                        }
                    }]), e
                }(),
                eV = function(e) {
                    e_(n, e);
                    var t = eB(n);

                    function n(e, r, a, o, i) {
                        var s;
                        return eL(this, n), (s = t.call(this)).value = e, s.validateValue = r, s.setValue = a, s.priority = o, i && (s.subPriority = i), s
                    }
                    return eW(n, [{
                        key: "validate",
                        value: function(e, t) {
                            return this.validateValue(e, this.value, t)
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            return this.setValue(e, t, this.value, n)
                        }
                    }]), n
                }(eq),
                eX = function(e) {
                    e_(n, e);
                    var t = eB(n);

                    function n() {
                        var e;
                        eL(this, n);
                        for (var r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                        return eY(eO(e = t.call.apply(t, [this].concat(a))), "priority", 10), eY(eO(e), "subPriority", -1), e
                    }
                    return eW(n, [{
                        key: "set",
                        value: function(e, t) {
                            if (t.timestampIsSet) return e;
                            var n = new Date(0);
                            return n.setFullYear(e.getUTCFullYear(), e.getUTCMonth(), e.getUTCDate()), n.setHours(e.getUTCHours(), e.getUTCMinutes(), e.getUTCSeconds(), e.getUTCMilliseconds()), n
                        }
                    }]), n
                }(eq),
                ez = function() {
                    function e() {
                        eL(this, e), eY(this, "incompatibleTokens", void 0), eY(this, "priority", void 0), eY(this, "subPriority", void 0)
                    }
                    return eW(e, [{
                        key: "run",
                        value: function(e, t, n, r) {
                            var a = this.parse(e, t, n, r);
                            return a ? {
                                setter: new eV(a.value, this.validate, this.set, this.priority, this.subPriority),
                                rest: a.rest
                            } : null
                        }
                    }, {
                        key: "validate",
                        value: function(e, t, n) {
                            return !0
                        }
                    }]), e
                }(),
                eQ = function(e) {
                    e_(n, e);
                    var t = eB(n);

                    function n() {
                        var e;
                        eL(this, n);
                        for (var r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                        return eY(eO(e = t.call.apply(t, [this].concat(a))), "priority", 140), eY(eO(e), "incompatibleTokens", ["R", "u", "t", "T"]), e
                    }
                    return eW(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            switch (t) {
                                case "G":
                                case "GG":
                                case "GGG":
                                    return n.era(e, {
                                        width: "abbreviated"
                                    }) || n.era(e, {
                                        width: "narrow"
                                    });
                                case "GGGGG":
                                    return n.era(e, {
                                        width: "narrow"
                                    });
                                default:
                                    return n.era(e, {
                                        width: "wide"
                                    }) || n.era(e, {
                                        width: "abbreviated"
                                    }) || n.era(e, {
                                        width: "narrow"
                                    })
                            }
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            return t.era = n, e.setUTCFullYear(n, 0, 1), e.setUTCHours(0, 0, 0, 0), e
                        }
                    }]), n
                }(ez),
                e$ = /^(1[0-2]|0?\d)/,
                eK = /^(3[0-1]|[0-2]?\d)/,
                eJ = /^(36[0-6]|3[0-5]\d|[0-2]?\d?\d)/,
                eZ = /^(5[0-3]|[0-4]?\d)/,
                e0 = /^(2[0-3]|[0-1]?\d)/,
                e1 = /^(2[0-4]|[0-1]?\d)/,
                e2 = /^(1[0-1]|0?\d)/,
                e3 = /^(1[0-2]|0?\d)/,
                e4 = /^[0-5]?\d/,
                e6 = /^[0-5]?\d/,
                e5 = /^\d/,
                e8 = /^\d{1,2}/,
                e7 = /^\d{1,3}/,
                e9 = /^\d{1,4}/,
                te = /^-?\d+/,
                tt = /^-?\d/,
                tn = /^-?\d{1,2}/,
                tr = /^-?\d{1,3}/,
                ta = /^-?\d{1,4}/,
                to = /^([+-])(\d{2})(\d{2})?|Z/,
                ti = /^([+-])(\d{2})(\d{2})|Z/,
                ts = /^([+-])(\d{2})(\d{2})((\d{2}))?|Z/,
                tl = /^([+-])(\d{2}):(\d{2})|Z/,
                tu = /^([+-])(\d{2}):(\d{2})(:(\d{2}))?|Z/;

            function tc(e, t) {
                return e ? {
                    value: t(e.value),
                    rest: e.rest
                } : e
            }

            function td(e, t) {
                var n = t.match(e);
                return n ? {
                    value: parseInt(n[0], 10),
                    rest: t.slice(n[0].length)
                } : null
            }

            function tf(e, t) {
                var n = t.match(e);
                return n ? "Z" === n[0] ? {
                    value: 0,
                    rest: t.slice(1)
                } : {
                    value: ("+" === n[1] ? 1 : -1) * ((n[2] ? parseInt(n[2], 10) : 0) * 36e5 + (n[3] ? parseInt(n[3], 10) : 0) * 6e4 + (n[5] ? parseInt(n[5], 10) : 0) * 1e3),
                    rest: t.slice(n[0].length)
                } : null
            }

            function tp(e, t) {
                switch (e) {
                    case 1:
                        return td(e5, t);
                    case 2:
                        return td(e8, t);
                    case 3:
                        return td(e7, t);
                    case 4:
                        return td(e9, t);
                    default:
                        return td(RegExp("^\\d{1," + e + "}"), t)
                }
            }

            function th(e, t) {
                switch (e) {
                    case 1:
                        return td(tt, t);
                    case 2:
                        return td(tn, t);
                    case 3:
                        return td(tr, t);
                    case 4:
                        return td(ta, t);
                    default:
                        return td(RegExp("^-?\\d{1," + e + "}"), t)
                }
            }

            function ty(e) {
                switch (e) {
                    case "morning":
                        return 4;
                    case "evening":
                        return 17;
                    case "pm":
                    case "noon":
                    case "afternoon":
                        return 12;
                    default:
                        return 0
                }
            }

            function tv(e, t) {
                var n, r = t > 0,
                    a = r ? t : 1 - t;
                if (a <= 50) n = e || 100;
                else {
                    var o = a + 50;
                    n = e + 100 * Math.floor(o / 100) - 100 * (e >= o % 100)
                }
                return r ? n : 1 - n
            }

            function tm(e) {
                return e % 400 == 0 || e % 4 == 0 && e % 100 != 0
            }
            var tb = function(e) {
                    e_(n, e);
                    var t = eB(n);

                    function n() {
                        var e;
                        eL(this, n);
                        for (var r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                        return eY(eO(e = t.call.apply(t, [this].concat(a))), "priority", 130), eY(eO(e), "incompatibleTokens", ["Y", "R", "u", "w", "I", "i", "e", "c", "t", "T"]), e
                    }
                    return eW(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            var r = function(e) {
                                return {
                                    year: e,
                                    isTwoDigitYear: "yy" === t
                                }
                            };
                            switch (t) {
                                case "y":
                                    return tc(tp(4, e), r);
                                case "yo":
                                    return tc(n.ordinalNumber(e, {
                                        unit: "year"
                                    }), r);
                                default:
                                    return tc(tp(t.length, e), r)
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            return t.isTwoDigitYear || t.year > 0
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            var r = e.getUTCFullYear();
                            if (n.isTwoDigitYear) {
                                var a = tv(n.year, r);
                                return e.setUTCFullYear(a, 0, 1), e.setUTCHours(0, 0, 0, 0), e
                            }
                            var o = "era" in t && 1 !== t.era ? 1 - n.year : n.year;
                            return e.setUTCFullYear(o, 0, 1), e.setUTCHours(0, 0, 0, 0), e
                        }
                    }]), n
                }(ez),
                tg = {};

            function tw(e, t) {
                E(1, arguments);
                var n, r, a, o, i, s, l, u, c = ek(null != (n = null != (r = null != (a = null != (o = null == t ? void 0 : t.weekStartsOn) ? o : null == t || null == (i = t.locale) || null == (s = i.options) ? void 0 : s.weekStartsOn) ? a : tg.weekStartsOn) ? r : null == (l = tg.locale) || null == (u = l.options) ? void 0 : u.weekStartsOn) ? n : 0);
                if (!(c >= 0 && c <= 6)) throw RangeError("weekStartsOn must be between 0 and 6 inclusively");
                var d = A(e),
                    f = d.getUTCDay();
                return d.setUTCDate(d.getUTCDate() - (7 * (f < c) + f - c)), d.setUTCHours(0, 0, 0, 0), d
            }

            function tS(e, t) {
                E(1, arguments);
                var n, r, a, o, i, s, l, u, c = A(e),
                    d = c.getUTCFullYear(),
                    f = ek(null != (n = null != (r = null != (a = null != (o = null == t ? void 0 : t.firstWeekContainsDate) ? o : null == t || null == (i = t.locale) || null == (s = i.options) ? void 0 : s.firstWeekContainsDate) ? a : tg.firstWeekContainsDate) ? r : null == (l = tg.locale) || null == (u = l.options) ? void 0 : u.firstWeekContainsDate) ? n : 1);
                if (!(f >= 1 && f <= 7)) throw RangeError("firstWeekContainsDate must be between 1 and 7 inclusively");
                var p = new Date(0);
                p.setUTCFullYear(d + 1, 0, f), p.setUTCHours(0, 0, 0, 0);
                var h = tw(p, t),
                    y = new Date(0);
                y.setUTCFullYear(d, 0, f), y.setUTCHours(0, 0, 0, 0);
                var v = tw(y, t);
                return c.getTime() >= h.getTime() ? d + 1 : c.getTime() >= v.getTime() ? d : d - 1
            }
            var tx = function(e) {
                e_(n, e);
                var t = eB(n);

                function n() {
                    var e;
                    eL(this, n);
                    for (var r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                    return eY(eO(e = t.call.apply(t, [this].concat(a))), "priority", 130), eY(eO(e), "incompatibleTokens", ["y", "R", "u", "Q", "q", "M", "L", "I", "d", "D", "i", "t", "T"]), e
                }
                return eW(n, [{
                    key: "parse",
                    value: function(e, t, n) {
                        var r = function(e) {
                            return {
                                year: e,
                                isTwoDigitYear: "YY" === t
                            }
                        };
                        switch (t) {
                            case "Y":
                                return tc(tp(4, e), r);
                            case "Yo":
                                return tc(n.ordinalNumber(e, {
                                    unit: "year"
                                }), r);
                            default:
                                return tc(tp(t.length, e), r)
                        }
                    }
                }, {
                    key: "validate",
                    value: function(e, t) {
                        return t.isTwoDigitYear || t.year > 0
                    }
                }, {
                    key: "set",
                    value: function(e, t, n, r) {
                        var a = tS(e, r);
                        if (n.isTwoDigitYear) {
                            var o = tv(n.year, a);
                            return e.setUTCFullYear(o, 0, r.firstWeekContainsDate), e.setUTCHours(0, 0, 0, 0), tw(e, r)
                        }
                        var i = "era" in t && 1 !== t.era ? 1 - n.year : n.year;
                        return e.setUTCFullYear(i, 0, r.firstWeekContainsDate), e.setUTCHours(0, 0, 0, 0), tw(e, r)
                    }
                }]), n
            }(ez);

            function tC(e) {
                E(1, arguments);
                var t = A(e),
                    n = t.getUTCDay();
                return t.setUTCDate(t.getUTCDate() - (7 * (n < 1) + n - 1)), t.setUTCHours(0, 0, 0, 0), t
            }
            var tE = function(e) {
                    e_(n, e);
                    var t = eB(n);

                    function n() {
                        var e;
                        eL(this, n);
                        for (var r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                        return eY(eO(e = t.call.apply(t, [this].concat(a))), "priority", 130), eY(eO(e), "incompatibleTokens", ["G", "y", "Y", "u", "Q", "q", "M", "L", "w", "d", "D", "e", "c", "t", "T"]), e
                    }
                    return eW(n, [{
                        key: "parse",
                        value: function(e, t) {
                            return "R" === t ? th(4, e) : th(t.length, e)
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            var r = new Date(0);
                            return r.setUTCFullYear(n, 0, 4), r.setUTCHours(0, 0, 0, 0), tC(r)
                        }
                    }]), n
                }(ez),
                tA = function(e) {
                    e_(n, e);
                    var t = eB(n);

                    function n() {
                        var e;
                        eL(this, n);
                        for (var r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                        return eY(eO(e = t.call.apply(t, [this].concat(a))), "priority", 130), eY(eO(e), "incompatibleTokens", ["G", "y", "Y", "R", "w", "I", "i", "e", "c", "t", "T"]), e
                    }
                    return eW(n, [{
                        key: "parse",
                        value: function(e, t) {
                            return "u" === t ? th(4, e) : th(t.length, e)
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            return e.setUTCFullYear(n, 0, 1), e.setUTCHours(0, 0, 0, 0), e
                        }
                    }]), n
                }(ez),
                tj = function(e) {
                    e_(n, e);
                    var t = eB(n);

                    function n() {
                        var e;
                        eL(this, n);
                        for (var r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                        return eY(eO(e = t.call.apply(t, [this].concat(a))), "priority", 120), eY(eO(e), "incompatibleTokens", ["Y", "R", "q", "M", "L", "w", "I", "d", "D", "i", "e", "c", "t", "T"]), e
                    }
                    return eW(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            switch (t) {
                                case "Q":
                                case "QQ":
                                    return tp(t.length, e);
                                case "Qo":
                                    return n.ordinalNumber(e, {
                                        unit: "quarter"
                                    });
                                case "QQQ":
                                    return n.quarter(e, {
                                        width: "abbreviated",
                                        context: "formatting"
                                    }) || n.quarter(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    });
                                case "QQQQQ":
                                    return n.quarter(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    });
                                default:
                                    return n.quarter(e, {
                                        width: "wide",
                                        context: "formatting"
                                    }) || n.quarter(e, {
                                        width: "abbreviated",
                                        context: "formatting"
                                    }) || n.quarter(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    })
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            return t >= 1 && t <= 4
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            return e.setUTCMonth((n - 1) * 3, 1), e.setUTCHours(0, 0, 0, 0), e
                        }
                    }]), n
                }(ez),
                tk = function(e) {
                    e_(n, e);
                    var t = eB(n);

                    function n() {
                        var e;
                        eL(this, n);
                        for (var r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                        return eY(eO(e = t.call.apply(t, [this].concat(a))), "priority", 120), eY(eO(e), "incompatibleTokens", ["Y", "R", "Q", "M", "L", "w", "I", "d", "D", "i", "e", "c", "t", "T"]), e
                    }
                    return eW(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            switch (t) {
                                case "q":
                                case "qq":
                                    return tp(t.length, e);
                                case "qo":
                                    return n.ordinalNumber(e, {
                                        unit: "quarter"
                                    });
                                case "qqq":
                                    return n.quarter(e, {
                                        width: "abbreviated",
                                        context: "standalone"
                                    }) || n.quarter(e, {
                                        width: "narrow",
                                        context: "standalone"
                                    });
                                case "qqqqq":
                                    return n.quarter(e, {
                                        width: "narrow",
                                        context: "standalone"
                                    });
                                default:
                                    return n.quarter(e, {
                                        width: "wide",
                                        context: "standalone"
                                    }) || n.quarter(e, {
                                        width: "abbreviated",
                                        context: "standalone"
                                    }) || n.quarter(e, {
                                        width: "narrow",
                                        context: "standalone"
                                    })
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            return t >= 1 && t <= 4
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            return e.setUTCMonth((n - 1) * 3, 1), e.setUTCHours(0, 0, 0, 0), e
                        }
                    }]), n
                }(ez),
                tT = function(e) {
                    e_(n, e);
                    var t = eB(n);

                    function n() {
                        var e;
                        eL(this, n);
                        for (var r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                        return eY(eO(e = t.call.apply(t, [this].concat(a))), "incompatibleTokens", ["Y", "R", "q", "Q", "L", "w", "I", "D", "i", "e", "c", "t", "T"]), eY(eO(e), "priority", 110), e
                    }
                    return eW(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            var r = function(e) {
                                return e - 1
                            };
                            switch (t) {
                                case "M":
                                    return tc(td(e$, e), r);
                                case "MM":
                                    return tc(tp(2, e), r);
                                case "Mo":
                                    return tc(n.ordinalNumber(e, {
                                        unit: "month"
                                    }), r);
                                case "MMM":
                                    return n.month(e, {
                                        width: "abbreviated",
                                        context: "formatting"
                                    }) || n.month(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    });
                                case "MMMMM":
                                    return n.month(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    });
                                default:
                                    return n.month(e, {
                                        width: "wide",
                                        context: "formatting"
                                    }) || n.month(e, {
                                        width: "abbreviated",
                                        context: "formatting"
                                    }) || n.month(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    })
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            return t >= 0 && t <= 11
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            return e.setUTCMonth(n, 1), e.setUTCHours(0, 0, 0, 0), e
                        }
                    }]), n
                }(ez),
                tP = function(e) {
                    e_(n, e);
                    var t = eB(n);

                    function n() {
                        var e;
                        eL(this, n);
                        for (var r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                        return eY(eO(e = t.call.apply(t, [this].concat(a))), "priority", 110), eY(eO(e), "incompatibleTokens", ["Y", "R", "q", "Q", "M", "w", "I", "D", "i", "e", "c", "t", "T"]), e
                    }
                    return eW(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            var r = function(e) {
                                return e - 1
                            };
                            switch (t) {
                                case "L":
                                    return tc(td(e$, e), r);
                                case "LL":
                                    return tc(tp(2, e), r);
                                case "Lo":
                                    return tc(n.ordinalNumber(e, {
                                        unit: "month"
                                    }), r);
                                case "LLL":
                                    return n.month(e, {
                                        width: "abbreviated",
                                        context: "standalone"
                                    }) || n.month(e, {
                                        width: "narrow",
                                        context: "standalone"
                                    });
                                case "LLLLL":
                                    return n.month(e, {
                                        width: "narrow",
                                        context: "standalone"
                                    });
                                default:
                                    return n.month(e, {
                                        width: "wide",
                                        context: "standalone"
                                    }) || n.month(e, {
                                        width: "abbreviated",
                                        context: "standalone"
                                    }) || n.month(e, {
                                        width: "narrow",
                                        context: "standalone"
                                    })
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            return t >= 0 && t <= 11
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            return e.setUTCMonth(n, 1), e.setUTCHours(0, 0, 0, 0), e
                        }
                    }]), n
                }(ez),
                tN = function(e) {
                    e_(n, e);
                    var t = eB(n);

                    function n() {
                        var e;
                        eL(this, n);
                        for (var r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                        return eY(eO(e = t.call.apply(t, [this].concat(a))), "priority", 100), eY(eO(e), "incompatibleTokens", ["y", "R", "u", "q", "Q", "M", "L", "I", "d", "D", "i", "t", "T"]), e
                    }
                    return eW(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            switch (t) {
                                case "w":
                                    return td(eZ, e);
                                case "wo":
                                    return n.ordinalNumber(e, {
                                        unit: "week"
                                    });
                                default:
                                    return tp(t.length, e)
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            return t >= 1 && t <= 53
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n, r) {
                            return tw(function(e, t, n) {
                                E(2, arguments);
                                var r = A(e),
                                    a = ek(t),
                                    o = function(e, t) {
                                        E(1, arguments);
                                        var n = A(e);
                                        return Math.round((tw(n, t).getTime() - (function(e, t) {
                                            E(1, arguments);
                                            var n, r, a, o, i, s, l, u, c = ek(null != (n = null != (r = null != (a = null != (o = null == t ? void 0 : t.firstWeekContainsDate) ? o : null == t || null == (i = t.locale) || null == (s = i.options) ? void 0 : s.firstWeekContainsDate) ? a : tg.firstWeekContainsDate) ? r : null == (l = tg.locale) || null == (u = l.options) ? void 0 : u.firstWeekContainsDate) ? n : 1),
                                                d = tS(e, t),
                                                f = new Date(0);
                                            return f.setUTCFullYear(d, 0, c), f.setUTCHours(0, 0, 0, 0), tw(f, t)
                                        })(n, t).getTime()) / 6048e5) + 1
                                    }(r, n) - a;
                                return r.setUTCDate(r.getUTCDate() - 7 * o), r
                            }(e, n, r), r)
                        }
                    }]), n
                }(ez),
                tI = function(e) {
                    e_(n, e);
                    var t = eB(n);

                    function n() {
                        var e;
                        eL(this, n);
                        for (var r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                        return eY(eO(e = t.call.apply(t, [this].concat(a))), "priority", 100), eY(eO(e), "incompatibleTokens", ["y", "Y", "u", "q", "Q", "M", "L", "w", "d", "D", "e", "c", "t", "T"]), e
                    }
                    return eW(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            switch (t) {
                                case "I":
                                    return td(eZ, e);
                                case "Io":
                                    return n.ordinalNumber(e, {
                                        unit: "week"
                                    });
                                default:
                                    return tp(t.length, e)
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            return t >= 1 && t <= 53
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            return tC(function(e, t) {
                                E(2, arguments);
                                var n = A(e),
                                    r = ek(t),
                                    a = function(e) {
                                        E(1, arguments);
                                        var t = A(e);
                                        return Math.round((tC(t).getTime() - (function(e) {
                                            E(1, arguments);
                                            var t = function(e) {
                                                    E(1, arguments);
                                                    var t = A(e),
                                                        n = t.getUTCFullYear(),
                                                        r = new Date(0);
                                                    r.setUTCFullYear(n + 1, 0, 4), r.setUTCHours(0, 0, 0, 0);
                                                    var a = tC(r),
                                                        o = new Date(0);
                                                    o.setUTCFullYear(n, 0, 4), o.setUTCHours(0, 0, 0, 0);
                                                    var i = tC(o);
                                                    return t.getTime() >= a.getTime() ? n + 1 : t.getTime() >= i.getTime() ? n : n - 1
                                                }(e),
                                                n = new Date(0);
                                            return n.setUTCFullYear(t, 0, 4), n.setUTCHours(0, 0, 0, 0), tC(n)
                                        })(t).getTime()) / 6048e5) + 1
                                    }(n) - r;
                                return n.setUTCDate(n.getUTCDate() - 7 * a), n
                            }(e, n))
                        }
                    }]), n
                }(ez),
                tU = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],
                tM = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],
                tO = function(e) {
                    e_(n, e);
                    var t = eB(n);

                    function n() {
                        var e;
                        eL(this, n);
                        for (var r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                        return eY(eO(e = t.call.apply(t, [this].concat(a))), "priority", 90), eY(eO(e), "subPriority", 1), eY(eO(e), "incompatibleTokens", ["Y", "R", "q", "Q", "w", "I", "D", "i", "e", "c", "t", "T"]), e
                    }
                    return eW(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            switch (t) {
                                case "d":
                                    return td(eK, e);
                                case "do":
                                    return n.ordinalNumber(e, {
                                        unit: "date"
                                    });
                                default:
                                    return tp(t.length, e)
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            var n = tm(e.getUTCFullYear()),
                                r = e.getUTCMonth();
                            return n ? t >= 1 && t <= tM[r] : t >= 1 && t <= tU[r]
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            return e.setUTCDate(n), e.setUTCHours(0, 0, 0, 0), e
                        }
                    }]), n
                }(ez),
                tD = function(e) {
                    e_(n, e);
                    var t = eB(n);

                    function n() {
                        var e;
                        eL(this, n);
                        for (var r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                        return eY(eO(e = t.call.apply(t, [this].concat(a))), "priority", 90), eY(eO(e), "subpriority", 1), eY(eO(e), "incompatibleTokens", ["Y", "R", "q", "Q", "M", "L", "w", "I", "d", "E", "i", "e", "c", "t", "T"]), e
                    }
                    return eW(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            switch (t) {
                                case "D":
                                case "DD":
                                    return td(eJ, e);
                                case "Do":
                                    return n.ordinalNumber(e, {
                                        unit: "date"
                                    });
                                default:
                                    return tp(t.length, e)
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            return tm(e.getUTCFullYear()) ? t >= 1 && t <= 366 : t >= 1 && t <= 365
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            return e.setUTCMonth(0, n), e.setUTCHours(0, 0, 0, 0), e
                        }
                    }]), n
                }(ez);

            function t_(e, t, n) {
                E(2, arguments);
                var r, a, o, i, s, l, u, c, d = ek(null != (r = null != (a = null != (o = null != (i = null == n ? void 0 : n.weekStartsOn) ? i : null == n || null == (s = n.locale) || null == (l = s.options) ? void 0 : l.weekStartsOn) ? o : tg.weekStartsOn) ? a : null == (u = tg.locale) || null == (c = u.options) ? void 0 : c.weekStartsOn) ? r : 0);
                if (!(d >= 0 && d <= 6)) throw RangeError("weekStartsOn must be between 0 and 6 inclusively");
                var f = A(e),
                    p = ek(t),
                    h = 7 * ((p % 7 + 7) % 7 < d) + p - f.getUTCDay();
                return f.setUTCDate(f.getUTCDate() + h), f
            }
            var tR = function(e) {
                    e_(n, e);
                    var t = eB(n);

                    function n() {
                        var e;
                        eL(this, n);
                        for (var r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                        return eY(eO(e = t.call.apply(t, [this].concat(a))), "priority", 90), eY(eO(e), "incompatibleTokens", ["D", "i", "e", "c", "t", "T"]), e
                    }
                    return eW(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            switch (t) {
                                case "E":
                                case "EE":
                                case "EEE":
                                    return n.day(e, {
                                        width: "abbreviated",
                                        context: "formatting"
                                    }) || n.day(e, {
                                        width: "short",
                                        context: "formatting"
                                    }) || n.day(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    });
                                case "EEEEE":
                                    return n.day(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    });
                                case "EEEEEE":
                                    return n.day(e, {
                                        width: "short",
                                        context: "formatting"
                                    }) || n.day(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    });
                                default:
                                    return n.day(e, {
                                        width: "wide",
                                        context: "formatting"
                                    }) || n.day(e, {
                                        width: "abbreviated",
                                        context: "formatting"
                                    }) || n.day(e, {
                                        width: "short",
                                        context: "formatting"
                                    }) || n.day(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    })
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            return t >= 0 && t <= 6
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n, r) {
                            return (e = t_(e, n, r)).setUTCHours(0, 0, 0, 0), e
                        }
                    }]), n
                }(ez),
                tF = function(e) {
                    e_(n, e);
                    var t = eB(n);

                    function n() {
                        var e;
                        eL(this, n);
                        for (var r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                        return eY(eO(e = t.call.apply(t, [this].concat(a))), "priority", 90), eY(eO(e), "incompatibleTokens", ["y", "R", "u", "q", "Q", "M", "L", "I", "d", "D", "E", "i", "c", "t", "T"]), e
                    }
                    return eW(n, [{
                        key: "parse",
                        value: function(e, t, n, r) {
                            var a = function(e) {
                                var t = 7 * Math.floor((e - 1) / 7);
                                return (e + r.weekStartsOn + 6) % 7 + t
                            };
                            switch (t) {
                                case "e":
                                case "ee":
                                    return tc(tp(t.length, e), a);
                                case "eo":
                                    return tc(n.ordinalNumber(e, {
                                        unit: "day"
                                    }), a);
                                case "eee":
                                    return n.day(e, {
                                        width: "abbreviated",
                                        context: "formatting"
                                    }) || n.day(e, {
                                        width: "short",
                                        context: "formatting"
                                    }) || n.day(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    });
                                case "eeeee":
                                    return n.day(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    });
                                case "eeeeee":
                                    return n.day(e, {
                                        width: "short",
                                        context: "formatting"
                                    }) || n.day(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    });
                                default:
                                    return n.day(e, {
                                        width: "wide",
                                        context: "formatting"
                                    }) || n.day(e, {
                                        width: "abbreviated",
                                        context: "formatting"
                                    }) || n.day(e, {
                                        width: "short",
                                        context: "formatting"
                                    }) || n.day(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    })
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            return t >= 0 && t <= 6
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n, r) {
                            return (e = t_(e, n, r)).setUTCHours(0, 0, 0, 0), e
                        }
                    }]), n
                }(ez),
                tB = function(e) {
                    e_(n, e);
                    var t = eB(n);

                    function n() {
                        var e;
                        eL(this, n);
                        for (var r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                        return eY(eO(e = t.call.apply(t, [this].concat(a))), "priority", 90), eY(eO(e), "incompatibleTokens", ["y", "R", "u", "q", "Q", "M", "L", "I", "d", "D", "E", "i", "e", "t", "T"]), e
                    }
                    return eW(n, [{
                        key: "parse",
                        value: function(e, t, n, r) {
                            var a = function(e) {
                                var t = 7 * Math.floor((e - 1) / 7);
                                return (e + r.weekStartsOn + 6) % 7 + t
                            };
                            switch (t) {
                                case "c":
                                case "cc":
                                    return tc(tp(t.length, e), a);
                                case "co":
                                    return tc(n.ordinalNumber(e, {
                                        unit: "day"
                                    }), a);
                                case "ccc":
                                    return n.day(e, {
                                        width: "abbreviated",
                                        context: "standalone"
                                    }) || n.day(e, {
                                        width: "short",
                                        context: "standalone"
                                    }) || n.day(e, {
                                        width: "narrow",
                                        context: "standalone"
                                    });
                                case "ccccc":
                                    return n.day(e, {
                                        width: "narrow",
                                        context: "standalone"
                                    });
                                case "cccccc":
                                    return n.day(e, {
                                        width: "short",
                                        context: "standalone"
                                    }) || n.day(e, {
                                        width: "narrow",
                                        context: "standalone"
                                    });
                                default:
                                    return n.day(e, {
                                        width: "wide",
                                        context: "standalone"
                                    }) || n.day(e, {
                                        width: "abbreviated",
                                        context: "standalone"
                                    }) || n.day(e, {
                                        width: "short",
                                        context: "standalone"
                                    }) || n.day(e, {
                                        width: "narrow",
                                        context: "standalone"
                                    })
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            return t >= 0 && t <= 6
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n, r) {
                            return (e = t_(e, n, r)).setUTCHours(0, 0, 0, 0), e
                        }
                    }]), n
                }(ez),
                tL = function(e) {
                    e_(n, e);
                    var t = eB(n);

                    function n() {
                        var e;
                        eL(this, n);
                        for (var r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                        return eY(eO(e = t.call.apply(t, [this].concat(a))), "priority", 90), eY(eO(e), "incompatibleTokens", ["y", "Y", "u", "q", "Q", "M", "L", "w", "d", "D", "E", "e", "c", "t", "T"]), e
                    }
                    return eW(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            var r = function(e) {
                                return 0 === e ? 7 : e
                            };
                            switch (t) {
                                case "i":
                                case "ii":
                                    return tp(t.length, e);
                                case "io":
                                    return n.ordinalNumber(e, {
                                        unit: "day"
                                    });
                                case "iii":
                                    return tc(n.day(e, {
                                        width: "abbreviated",
                                        context: "formatting"
                                    }) || n.day(e, {
                                        width: "short",
                                        context: "formatting"
                                    }) || n.day(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    }), r);
                                case "iiiii":
                                    return tc(n.day(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    }), r);
                                case "iiiiii":
                                    return tc(n.day(e, {
                                        width: "short",
                                        context: "formatting"
                                    }) || n.day(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    }), r);
                                default:
                                    return tc(n.day(e, {
                                        width: "wide",
                                        context: "formatting"
                                    }) || n.day(e, {
                                        width: "abbreviated",
                                        context: "formatting"
                                    }) || n.day(e, {
                                        width: "short",
                                        context: "formatting"
                                    }) || n.day(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    }), r)
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            return t >= 1 && t <= 7
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            return (e = function(e, t) {
                                E(2, arguments);
                                var n = ek(t);
                                n % 7 == 0 && (n -= 7);
                                var r = A(e),
                                    a = 7 * ((n % 7 + 7) % 7 < 1) + n - r.getUTCDay();
                                return r.setUTCDate(r.getUTCDate() + a), r
                            }(e, n)).setUTCHours(0, 0, 0, 0), e
                        }
                    }]), n
                }(ez),
                tG = function(e) {
                    e_(n, e);
                    var t = eB(n);

                    function n() {
                        var e;
                        eL(this, n);
                        for (var r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                        return eY(eO(e = t.call.apply(t, [this].concat(a))), "priority", 80), eY(eO(e), "incompatibleTokens", ["b", "B", "H", "k", "t", "T"]), e
                    }
                    return eW(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            switch (t) {
                                case "a":
                                case "aa":
                                case "aaa":
                                    return n.dayPeriod(e, {
                                        width: "abbreviated",
                                        context: "formatting"
                                    }) || n.dayPeriod(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    });
                                case "aaaaa":
                                    return n.dayPeriod(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    });
                                default:
                                    return n.dayPeriod(e, {
                                        width: "wide",
                                        context: "formatting"
                                    }) || n.dayPeriod(e, {
                                        width: "abbreviated",
                                        context: "formatting"
                                    }) || n.dayPeriod(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    })
                            }
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            return e.setUTCHours(ty(n), 0, 0, 0), e
                        }
                    }]), n
                }(ez),
                tH = function(e) {
                    e_(n, e);
                    var t = eB(n);

                    function n() {
                        var e;
                        eL(this, n);
                        for (var r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                        return eY(eO(e = t.call.apply(t, [this].concat(a))), "priority", 80), eY(eO(e), "incompatibleTokens", ["a", "B", "H", "k", "t", "T"]), e
                    }
                    return eW(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            switch (t) {
                                case "b":
                                case "bb":
                                case "bbb":
                                    return n.dayPeriod(e, {
                                        width: "abbreviated",
                                        context: "formatting"
                                    }) || n.dayPeriod(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    });
                                case "bbbbb":
                                    return n.dayPeriod(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    });
                                default:
                                    return n.dayPeriod(e, {
                                        width: "wide",
                                        context: "formatting"
                                    }) || n.dayPeriod(e, {
                                        width: "abbreviated",
                                        context: "formatting"
                                    }) || n.dayPeriod(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    })
                            }
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            return e.setUTCHours(ty(n), 0, 0, 0), e
                        }
                    }]), n
                }(ez),
                tW = function(e) {
                    e_(n, e);
                    var t = eB(n);

                    function n() {
                        var e;
                        eL(this, n);
                        for (var r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                        return eY(eO(e = t.call.apply(t, [this].concat(a))), "priority", 80), eY(eO(e), "incompatibleTokens", ["a", "b", "t", "T"]), e
                    }
                    return eW(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            switch (t) {
                                case "B":
                                case "BB":
                                case "BBB":
                                    return n.dayPeriod(e, {
                                        width: "abbreviated",
                                        context: "formatting"
                                    }) || n.dayPeriod(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    });
                                case "BBBBB":
                                    return n.dayPeriod(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    });
                                default:
                                    return n.dayPeriod(e, {
                                        width: "wide",
                                        context: "formatting"
                                    }) || n.dayPeriod(e, {
                                        width: "abbreviated",
                                        context: "formatting"
                                    }) || n.dayPeriod(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    })
                            }
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            return e.setUTCHours(ty(n), 0, 0, 0), e
                        }
                    }]), n
                }(ez),
                tY = function(e) {
                    e_(n, e);
                    var t = eB(n);

                    function n() {
                        var e;
                        eL(this, n);
                        for (var r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                        return eY(eO(e = t.call.apply(t, [this].concat(a))), "priority", 70), eY(eO(e), "incompatibleTokens", ["H", "K", "k", "t", "T"]), e
                    }
                    return eW(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            switch (t) {
                                case "h":
                                    return td(e3, e);
                                case "ho":
                                    return n.ordinalNumber(e, {
                                        unit: "hour"
                                    });
                                default:
                                    return tp(t.length, e)
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            return t >= 1 && t <= 12
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            var r = e.getUTCHours() >= 12;
                            return r && n < 12 ? e.setUTCHours(n + 12, 0, 0, 0) : r || 12 !== n ? e.setUTCHours(n, 0, 0, 0) : e.setUTCHours(0, 0, 0, 0), e
                        }
                    }]), n
                }(ez),
                tq = function(e) {
                    e_(n, e);
                    var t = eB(n);

                    function n() {
                        var e;
                        eL(this, n);
                        for (var r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                        return eY(eO(e = t.call.apply(t, [this].concat(a))), "priority", 70), eY(eO(e), "incompatibleTokens", ["a", "b", "h", "K", "k", "t", "T"]), e
                    }
                    return eW(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            switch (t) {
                                case "H":
                                    return td(e0, e);
                                case "Ho":
                                    return n.ordinalNumber(e, {
                                        unit: "hour"
                                    });
                                default:
                                    return tp(t.length, e)
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            return t >= 0 && t <= 23
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            return e.setUTCHours(n, 0, 0, 0), e
                        }
                    }]), n
                }(ez),
                tV = function(e) {
                    e_(n, e);
                    var t = eB(n);

                    function n() {
                        var e;
                        eL(this, n);
                        for (var r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                        return eY(eO(e = t.call.apply(t, [this].concat(a))), "priority", 70), eY(eO(e), "incompatibleTokens", ["h", "H", "k", "t", "T"]), e
                    }
                    return eW(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            switch (t) {
                                case "K":
                                    return td(e2, e);
                                case "Ko":
                                    return n.ordinalNumber(e, {
                                        unit: "hour"
                                    });
                                default:
                                    return tp(t.length, e)
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            return t >= 0 && t <= 11
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            return e.getUTCHours() >= 12 && n < 12 ? e.setUTCHours(n + 12, 0, 0, 0) : e.setUTCHours(n, 0, 0, 0), e
                        }
                    }]), n
                }(ez),
                tX = function(e) {
                    e_(n, e);
                    var t = eB(n);

                    function n() {
                        var e;
                        eL(this, n);
                        for (var r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                        return eY(eO(e = t.call.apply(t, [this].concat(a))), "priority", 70), eY(eO(e), "incompatibleTokens", ["a", "b", "h", "H", "K", "t", "T"]), e
                    }
                    return eW(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            switch (t) {
                                case "k":
                                    return td(e1, e);
                                case "ko":
                                    return n.ordinalNumber(e, {
                                        unit: "hour"
                                    });
                                default:
                                    return tp(t.length, e)
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            return t >= 1 && t <= 24
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            return e.setUTCHours(n <= 24 ? n % 24 : n, 0, 0, 0), e
                        }
                    }]), n
                }(ez),
                tz = function(e) {
                    e_(n, e);
                    var t = eB(n);

                    function n() {
                        var e;
                        eL(this, n);
                        for (var r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                        return eY(eO(e = t.call.apply(t, [this].concat(a))), "priority", 60), eY(eO(e), "incompatibleTokens", ["t", "T"]), e
                    }
                    return eW(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            switch (t) {
                                case "m":
                                    return td(e4, e);
                                case "mo":
                                    return n.ordinalNumber(e, {
                                        unit: "minute"
                                    });
                                default:
                                    return tp(t.length, e)
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            return t >= 0 && t <= 59
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            return e.setUTCMinutes(n, 0, 0), e
                        }
                    }]), n
                }(ez),
                tQ = function(e) {
                    e_(n, e);
                    var t = eB(n);

                    function n() {
                        var e;
                        eL(this, n);
                        for (var r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                        return eY(eO(e = t.call.apply(t, [this].concat(a))), "priority", 50), eY(eO(e), "incompatibleTokens", ["t", "T"]), e
                    }
                    return eW(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            switch (t) {
                                case "s":
                                    return td(e6, e);
                                case "so":
                                    return n.ordinalNumber(e, {
                                        unit: "second"
                                    });
                                default:
                                    return tp(t.length, e)
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            return t >= 0 && t <= 59
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            return e.setUTCSeconds(n, 0), e
                        }
                    }]), n
                }(ez),
                t$ = function(e) {
                    e_(n, e);
                    var t = eB(n);

                    function n() {
                        var e;
                        eL(this, n);
                        for (var r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                        return eY(eO(e = t.call.apply(t, [this].concat(a))), "priority", 30), eY(eO(e), "incompatibleTokens", ["t", "T"]), e
                    }
                    return eW(n, [{
                        key: "parse",
                        value: function(e, t) {
                            return tc(tp(t.length, e), function(e) {
                                return Math.floor(e * Math.pow(10, -t.length + 3))
                            })
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            return e.setUTCMilliseconds(n), e
                        }
                    }]), n
                }(ez),
                tK = function(e) {
                    e_(n, e);
                    var t = eB(n);

                    function n() {
                        var e;
                        eL(this, n);
                        for (var r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                        return eY(eO(e = t.call.apply(t, [this].concat(a))), "priority", 10), eY(eO(e), "incompatibleTokens", ["t", "T", "x"]), e
                    }
                    return eW(n, [{
                        key: "parse",
                        value: function(e, t) {
                            switch (t) {
                                case "X":
                                    return tf(to, e);
                                case "XX":
                                    return tf(ti, e);
                                case "XXXX":
                                    return tf(ts, e);
                                case "XXXXX":
                                    return tf(tu, e);
                                default:
                                    return tf(tl, e)
                            }
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            return t.timestampIsSet ? e : new Date(e.getTime() - n)
                        }
                    }]), n
                }(ez),
                tJ = function(e) {
                    e_(n, e);
                    var t = eB(n);

                    function n() {
                        var e;
                        eL(this, n);
                        for (var r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                        return eY(eO(e = t.call.apply(t, [this].concat(a))), "priority", 10), eY(eO(e), "incompatibleTokens", ["t", "T", "X"]), e
                    }
                    return eW(n, [{
                        key: "parse",
                        value: function(e, t) {
                            switch (t) {
                                case "x":
                                    return tf(to, e);
                                case "xx":
                                    return tf(ti, e);
                                case "xxxx":
                                    return tf(ts, e);
                                case "xxxxx":
                                    return tf(tu, e);
                                default:
                                    return tf(tl, e)
                            }
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            return t.timestampIsSet ? e : new Date(e.getTime() - n)
                        }
                    }]), n
                }(ez),
                tZ = function(e) {
                    e_(n, e);
                    var t = eB(n);

                    function n() {
                        var e;
                        eL(this, n);
                        for (var r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                        return eY(eO(e = t.call.apply(t, [this].concat(a))), "priority", 40), eY(eO(e), "incompatibleTokens", "*"), e
                    }
                    return eW(n, [{
                        key: "parse",
                        value: function(e) {
                            return td(te, e)
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            return [new Date(1e3 * n), {
                                timestampIsSet: !0
                            }]
                        }
                    }]), n
                }(ez),
                t0 = function(e) {
                    e_(n, e);
                    var t = eB(n);

                    function n() {
                        var e;
                        eL(this, n);
                        for (var r = arguments.length, a = Array(r), o = 0; o < r; o++) a[o] = arguments[o];
                        return eY(eO(e = t.call.apply(t, [this].concat(a))), "priority", 20), eY(eO(e), "incompatibleTokens", "*"), e
                    }
                    return eW(n, [{
                        key: "parse",
                        value: function(e) {
                            return td(te, e)
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            return [new Date(n), {
                                timestampIsSet: !0
                            }]
                        }
                    }]), n
                }(ez),
                t1 = {
                    G: new eQ,
                    y: new tb,
                    Y: new tx,
                    R: new tE,
                    u: new tA,
                    Q: new tj,
                    q: new tk,
                    M: new tT,
                    L: new tP,
                    w: new tN,
                    I: new tI,
                    d: new tO,
                    D: new tD,
                    E: new tR,
                    e: new tF,
                    c: new tB,
                    i: new tL,
                    a: new tG,
                    b: new tH,
                    B: new tW,
                    h: new tY,
                    H: new tq,
                    K: new tV,
                    k: new tX,
                    m: new tz,
                    s: new tQ,
                    S: new t$,
                    X: new tK,
                    x: new tJ,
                    t: new tZ,
                    T: new t0
                },
                t2 = /[yYQqMLwIdDecihHKkms]o|(\w)\1*|''|'(''|[^'])+('|$)|./g,
                t3 = /P+p+|P+|p+|''|'(''|[^'])+('|$)|./g,
                t4 = /^'([^]*?)'?$/,
                t6 = /''/g,
                t5 = /\S/,
                t8 = /[a-zA-Z]/;

            function t7(e, t, n, r) {
                E(3, arguments);
                var a = String(e),
                    o = String(t),
                    i = null != (u = null != (c = null == r ? void 0 : r.locale) ? c : tg.locale) ? u : ej;
                if (!i.match) throw RangeError("locale must contain match property");
                var s = ek(null != (d = null != (f = null != (p = null != (h = null == r ? void 0 : r.firstWeekContainsDate) ? h : null == r || null == (y = r.locale) || null == (v = y.options) ? void 0 : v.firstWeekContainsDate) ? p : tg.firstWeekContainsDate) ? f : null == (m = tg.locale) || null == (b = m.options) ? void 0 : b.firstWeekContainsDate) ? d : 1);
                if (!(s >= 1 && s <= 7)) throw RangeError("firstWeekContainsDate must be between 1 and 7 inclusively");
                var l = ek(null != (g = null != (w = null != (S = null != (x = null == r ? void 0 : r.weekStartsOn) ? x : null == r || null == (j = r.locale) || null == (k = j.options) ? void 0 : k.weekStartsOn) ? S : tg.weekStartsOn) ? w : null == (T = tg.locale) || null == (P = T.options) ? void 0 : P.weekStartsOn) ? g : 0);
                if (!(l >= 0 && l <= 6)) throw RangeError("weekStartsOn must be between 0 and 6 inclusively");
                if ("" === o)
                    if ("" === a) return A(n);
                    else return new Date(NaN);
                var u, c, d, f, p, h, y, v, m, b, g, w, S, x, j, k, T, P, N, I = {
                        firstWeekContainsDate: s,
                        weekStartsOn: l,
                        locale: i
                    },
                    U = [new eX],
                    M = o.match(t3).map(function(e) {
                        var t = e[0];
                        return t in eN ? (0, eN[t])(e, i.formatLong) : e
                    }).join("").match(t2),
                    O = [],
                    D = eg(M);
                try {
                    for (D.s(); !(N = D.n()).done;) {
                        var _ = function() {
                            var t, n, s = N.value;
                            null != r && r.useAdditionalWeekYearTokens || (t = s, -1 === eU.indexOf(t)) || eM(s, o, e), null != r && r.useAdditionalDayOfYearTokens || (n = s, -1 === eI.indexOf(n)) || eM(s, o, e);
                            var l = s[0],
                                u = t1[l];
                            if (u) {
                                var c = u.incompatibleTokens;
                                if (Array.isArray(c)) {
                                    var d = O.find(function(e) {
                                        return c.includes(e.token) || e.token === l
                                    });
                                    if (d) throw RangeError("The format string mustn't contain `".concat(d.fullToken, "` and `").concat(s, "` at the same time"))
                                } else if ("*" === u.incompatibleTokens && O.length > 0) throw RangeError("The format string mustn't contain `".concat(s, "` and any other token at the same time"));
                                O.push({
                                    token: l,
                                    fullToken: s
                                });
                                var f = u.run(a, s, i.match, I);
                                if (!f) return {
                                    v: new Date(NaN)
                                };
                                U.push(f.setter), a = f.rest
                            } else {
                                if (l.match(t8)) throw RangeError("Format string contains an unescaped latin alphabet character `" + l + "`");
                                if ("''" === s ? s = "'" : "'" === l && (s = s.match(t4)[1].replace(t6, "'")), 0 !== a.indexOf(s)) return {
                                    v: new Date(NaN)
                                };
                                a = a.slice(s.length)
                            }
                        }();
                        if ("object" === C(_)) return _.v
                    }
                } catch (e) {
                    D.e(e)
                } finally {
                    D.f()
                }
                if (a.length > 0 && t5.test(a)) return new Date(NaN);
                var R = U.map(function(e) {
                        return e.priority
                    }).sort(function(e, t) {
                        return t - e
                    }).filter(function(e, t, n) {
                        return n.indexOf(e) === t
                    }).map(function(e) {
                        return U.filter(function(t) {
                            return t.priority === e
                        }).sort(function(e, t) {
                            return t.subPriority - e.subPriority
                        })
                    }).map(function(e) {
                        return e[0]
                    }),
                    F = A(n);
                if (isNaN(F.getTime())) return new Date(NaN);
                var B, L, G = function(e, t) {
                        return E(2, arguments),
                            function(e, t) {
                                return E(2, arguments), new Date(A(e).getTime() + ek(t))
                            }(e, -ek(t))
                    }(F, ((B = new Date(Date.UTC(F.getFullYear(), F.getMonth(), F.getDate(), F.getHours(), F.getMinutes(), F.getSeconds(), F.getMilliseconds()))).setUTCFullYear(F.getFullYear()), F.getTime() - B.getTime())),
                    H = {},
                    W = eg(R);
                try {
                    for (W.s(); !(L = W.n()).done;) {
                        var Y = L.value;
                        if (!Y.validate(G, I)) return new Date(NaN);
                        var q = Y.set(G, H, I);
                        Array.isArray(q) ? (G = q[0], function(e, t) {
                            if (null == e) throw TypeError("assign requires that input parameter not be null or undefined");
                            for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
                        }(H, q[1])) : G = q
                    }
                } catch (e) {
                    W.e(e)
                } finally {
                    W.f()
                }
                return G
            }
            var t9 = function(e, t) {
                    return "".concat(new v.Intl().getDateTimeFormatter().getCustomDateTime(new Date(e, t - 1), {
                        year: "2-digit",
                        month: "2-digit"
                    }))
                },
                ne = function(e) {
                    var t = t7(e, "MM/yy", new Date);
                    return "Invalid Date" === t.toString() ? [0, 0] : [t.getMonth() + 1, t.getFullYear()]
                },
                nt = function(e) {
                    var t = t7(e, "MM/yy", new Date);
                    return "Invalid Date" === t.toString() ? new Date : t
                },
                nn = window.CoreUtilities,
                nr = function() {
                    return nn.urlService.getAbsoluteUrl("/my/account#!/billing")
                },
                na = {
                    visa: "visa",
                    mastercard: "masterCard",
                    amex: "americanExpress",
                    americanexpress: "americanExpress",
                    discover: "discover",
                    debitcard: "debitCard",
                    redeemcard: "redeemCard",
                    robloxcredit: "robloxCredit",
                    xsollakoreadebitcard: "xsollaKoreaDebitCard",
                    paypal: "paypal",
                    appleappstore: "appleAppStore",
                    googleplaystore: "googlePlayStore",
                    xsollaamazonpay: "xsollaAmazonPay",
                    xboxstore: "xboxStore",
                    xsolla: "xsolla",
                    xsollaoxxo: "xsollaOxxo",
                    xsollaboleto: "xsollaBoleto",
                    xsollapix: "xsollaPix",
                    xsollaother: "xsollaOther",
                    cartes_bancaires: "debitCard",
                    diners: "debitCard",
                    jcb: "debitCard",
                    unionpay: "debitCard"
                },
                no = function(e) {
                    var t = na[e.trim().toLowerCase()];
                    return t || e.toLowerCase()
                },
                ni = ((t = {}).RemovePaymentProfileNotAllowedFailure = "RemovePaymentProfileNotAllowedFailure", t),
                ns = "AddCardClicked",
                nl = "CancelAddCardInModalClicked",
                nu = "AddCardSubmitInModalClicked",
                nc = "DeleteSavedPaymentMethodButtonClicked",
                nd = "CancelCardDeletionInModalButtonClicked",
                nf = "UpdateCardClicked",
                np = "DeleteCardInModalButtonClicked",
                nh = "StripeCustomerEmailAlreadyExists",
                ny = "StripeCustomerEmailDoesNotExist",
                nv = "ConvertCreditToRobuxButtonClicked",
                nm = "UserHasNoSubscription",
                nb = "SubscribeButtonClicked",
                ng = "CancelSubscriptionButtonClicked",
                nw = "CannotDeleteCardWithSubscriptionError",
                nS = "GetPaymentProfileSetupCalled",
                nx = "GetPaymentProfileSetupSucceeded",
                nC = "GetPaymentProfileSetupFailed",
                nE = "GetUserBirthdateCalled",
                nA = "GetUserBirthdateSucceeded",
                nj = "GetUserBirthdateFailed",
                nk = "GetSavedPaymentProfilesCalled",
                nT = "GetSavedPaymentProfilesSucceeded",
                nP = "GetSavedPaymentProfilesFailed",
                nN = "GetSavedPaymentProfilesReturnsNone",
                nI = "DeleteSavedPaymentProfileCalled",
                nU = "DeleteSavedPaymentProfileSucceeded",
                nM = "DeleteSavedPaymentProfileFailed",
                nO = "GetUserPremiumSubscriptionCalled",
                nD = "GetUserPremiumSubscriptionSucceeded",
                n_ = "GetUserPremiumSubscriptionFailed",
                nR = "GetCreditConversionMetadataCalled",
                nF = "GetCreditConversionMetadataSucceeded",
                nB = "GetCreditConversionMetadataFailed",
                nL = "GetCreditConversionMetadataCurrencyCodeNull",
                nG = "VerifyPaymentProfileCreationCalled",
                nH = "VerifyPaymentProfileCreationSucceeded",
                nW = "VerifyPaymentProfileCreationFailed",
                nY = "UpdateSavedPaymentProfileCalled",
                nq = "UpdateSavedPaymentProfileSucceeded",
                nV = "UpdateSavedPaymentProfileFailed",
                nX = "LoadStripeCalled",
                nz = "LoadStripeSucceeded",
                nQ = "LoadStripeFailed",
                n$ = "StripeConfirmSetupIntentCalled",
                nK = "StripeConfirmSetupIntentSucceeded",
                nJ = "StripeConfirmSetupIntentFailed",
                nZ = "incorrect_cvc",
                n0 = "expired_card",
                n1 = "CanChangeSetting";

            function n2(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function n3(e, t, n, r, a, o, i) {
                try {
                    var s = e[o](i),
                        l = s.value
                } catch (e) {
                    n(e);
                    return
                }
                s.done ? t(l) : Promise.resolve(l).then(r, a)
            }

            function n4(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, a) {
                        var o = e.apply(t, n);

                        function i(e) {
                            n3(o, r, a, i, s, "next", e)
                        }

                        function s(e) {
                            n3(o, r, a, i, s, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function n6(e, t) {
                if (e) {
                    if ("string" == typeof e) return n2(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return n2(e, t)
                }
            }

            function n5(e, t) {
                var n, r, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return i.next = s(0), i.throw = s(1), i.return = s(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                    return this
                }), i;

                function s(s) {
                    return function(l) {
                        var u = [s, l];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, u[0] && (o = 0)), o;) try {
                            if (n = 1, r && (a = 2 & u[0] ? r.return : u[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, u[1])).done) return a;
                            switch (r = 0, a && (u = [2 & u[0], a.value]), u[0]) {
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
                                    o.label++, r = u[1], u = [0];
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
                            u = t.call(e, o)
                        } catch (e) {
                            u = [6, e], r = 0
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
            var n8 = ((r = {}).Stripe = "Stripe", r),
                n7 = function(e) {
                    return {
                        withCredentials: !0,
                        url: "".concat(v.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-profile/").concat(e)
                    }
                },
                n9 = function(e) {
                    var t = {
                        retryable: !1,
                        withCredentials: !0,
                        url: "".concat(v.EnvironmentUrls.premiumFeaturesApi, "/v1/users/").concat(e, "/subscriptions")
                    };
                    return nn.httpService.get(t)
                },
                re = function() {
                    return n4(function() {
                        var e, t, n, r, a, o, i;
                        return n5(this, function(s) {
                            switch (s.label) {
                                case 0:
                                    e = !1, t = !1, n = 0, r = 0, a = "USD", o = !1, s.label = 1;
                                case 1:
                                    return s.trys.push([1, 3, , 4]), (0, k.fireEvent)(nR), [4, n4(function() {
                                        var e;
                                        return n5(this, function(t) {
                                            return e = {
                                                withCredentials: !0,
                                                url: "".concat(v.EnvironmentUrls.apiGatewayUrl, "/credit-balance/v1/get-conversion-metadata")
                                            }, [2, nn.httpService.get(e)]
                                        })
                                    })()];
                                case 2:
                                    return (i = s.sent().data).creditBalance >= 0 && null !== i.currencyCode ? (r = i.creditBalance, a = i.currencyCode, o = i.isConvertAllFlowEnabled) : (e = !0, (0, k.fireEvent)(nL)), i.robuxConversionAmount > 0 && (n = i.robuxConversionAmount), t = i.isConvertAllFlowEnabled && i.creditBalance > 0 || i.robuxConversionAmount > 0, (0, k.fireEvent)(nF), [2, [e, t, n, r, a, o]];
                                case 3:
                                    throw s.sent(), (0, k.fireEvent)(nB), Error("Failed to get Robux conversion metadata.");
                                case 4:
                                    return [2]
                            }
                        })
                    })()
                },
                rt = ((a = {}).GlobalTeen = "globalTeen", a.U13 = "u13", a.O18 = "o18", a),
                rn = function() {
                    return n4(function() {
                        var e;
                        return n5(this, function(t) {
                            switch (t.label) {
                                case 0:
                                    return e = {
                                        withCredentials: !0,
                                        url: "".concat(v.EnvironmentUrls.billingApi, "/v1/parental-controls/get-settings")
                                    }, [4, nn.httpService.get(e)];
                                case 1:
                                    return [2, t.sent().data]
                            }
                        })
                    })()
                },
                rr = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : void 0,
                        n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : [];
                    return n4(function() {
                        var r, a, o, i, s;
                        return n5(this, function(l) {
                            switch (l.label) {
                                case 0:
                                    r = {
                                        withCredentials: !0,
                                        url: "".concat(v.EnvironmentUrls.apiGatewayUrl, "/parental-controls-api/v1/parental-controls/consents")
                                    }, l.label = 1;
                                case 1:
                                    return l.trys.push([1, 5, , 6]), [4, nn.httpService.get(r, {
                                        childUserId: e,
                                        consentStatus: "Pending",
                                        consentType: "UpdateUserSetting",
                                        cursor: t
                                    })];
                                case 2:
                                    var u;
                                    if (i = (o = l.sent().data).consents, s = o.nextCursor, (a = n).push.apply(a, function(e) {
                                            if (Array.isArray(e)) return n2(e)
                                        }(u = i || []) || function(e) {
                                            if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                        }(u) || n6(u) || function() {
                                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                        }()), !s) return [3, 4];
                                    return [4, rr(e, s, n)];
                                case 3:
                                    l.sent(), l.label = 4;
                                case 4:
                                    return [2, n];
                                case 5:
                                    throw l.sent(), Error("Failed to fetch pending consent requests");
                                case 6:
                                    return [2]
                            }
                        })
                    })()
                },
                ra = "Heading.SavedCreditCard.Payments",
                ro = "Heading.SavedCreditCard.CreditOrDebitCard",
                ri = "Heading.SavedCreditCard.BillingAddress",
                rs = "Heading.AskMoreRobux",
                rl = "Header.CancelRequest",
                ru = "Heading.MonthlySpendingLimit",
                rc = "Action.Cancel",
                rd = "Action.Save",
                rf = "Description.SavedCreditCard.SavePaymentMethodSomethingWentWrong",
                rp = "Response.SavedCreditCard.GenericSomethingWentWrong",
                rh = "Description.SuccessDialogMessage";

            function ry(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function rv(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            s = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            s = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (s) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return ry(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return ry(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var rm = function() {
                var e = rv((0, S.createModal)(), 2),
                    t = e[0],
                    n = e[1];
                return [function(e) {
                    var r = e.header,
                        a = e.cancelText,
                        o = e.translate,
                        i = e.onDelete,
                        s = e.onNeutral,
                        l = rv((0, g.useState)(!1), 2),
                        u = l[0],
                        c = l[1];
                    return (0, y.jsx)(t, {
                        id: "add-card-modal",
                        title: r,
                        body: a,
                        loading: u,
                        neutralButtonText: o(rc),
                        actionButtonText: o("Action.Delete"),
                        onNeutral: function() {
                            null == s || s(), n.close()
                        },
                        onAction: function() {
                            c(!0), i(), c(!1), n.close()
                        },
                        closeable: !0,
                        size: "md",
                        actionButtonShow: !0
                    })
                }, n]
            };

            function rb(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function rg(e, t, n, r, a, o, i) {
                try {
                    var s = e[o](i),
                        l = s.value
                } catch (e) {
                    n(e);
                    return
                }
                s.done ? t(l) : Promise.resolve(l).then(r, a)
            }
            var rw = function() {
                var e, t = (e = rm(), function(e) {
                        if (Array.isArray(e)) return e
                    }(e) || function(e, t) {
                        var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != a) {
                            var o = [],
                                i = !0,
                                s = !1;
                            try {
                                for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), o.length !== t); i = !0);
                            } catch (e) {
                                s = !0, r = e
                            } finally {
                                try {
                                    i || null == a.return || a.return()
                                } finally {
                                    if (s) throw r
                                }
                            }
                            return o
                        }
                    }(e, 2) || function(e, t) {
                        if (e) {
                            if ("string" == typeof e) return rb(e, 2);
                            var n = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return rb(e, t)
                        }
                    }(e, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    n = t[0];
                return [function(e) {
                    var t = e.translate,
                        r = e.systemFeedbackService,
                        a = e.cannotDeletePaymentMethodModalService,
                        o = e.onDeleteSuccess,
                        i = e.paymentProfileId,
                        s = t("Heading.SavedCreditCard.DeletePaymentMethod"),
                        l = t("Description.SavedCreditCard.AreYouSureDeletePaymentMethod");
                    return (0, y.jsx)(n, {
                        translate: t,
                        header: s,
                        cancelText: l,
                        onDelete: function() {
                            var e;
                            return (e = function() {
                                var e;
                                return function(e, t) {
                                    var n, r, a, o = {
                                            label: 0,
                                            sent: function() {
                                                if (1 & a[0]) throw a[1];
                                                return a[1]
                                            },
                                            trys: [],
                                            ops: []
                                        },
                                        i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                    return i.next = s(0), i.throw = s(1), i.return = s(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                                        return this
                                    }), i;

                                    function s(s) {
                                        return function(l) {
                                            var u = [s, l];
                                            if (n) throw TypeError("Generator is already executing.");
                                            for (; i && (i = 0, u[0] && (o = 0)), o;) try {
                                                if (n = 1, r && (a = 2 & u[0] ? r.return : u[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, u[1])).done) return a;
                                                switch (r = 0, a && (u = [2 & u[0], a.value]), u[0]) {
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
                                                        o.label++, r = u[1], u = [0];
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
                                                u = t.call(e, o)
                                            } catch (e) {
                                                u = [6, e], r = 0
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
                                }(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            (0, k.fireEvent)(np), n.label = 1;
                                        case 1:
                                            return n.trys.push([1, 3, , 4]), (0, k.fireEvent)(nI), [4, n4(function() {
                                                var e;
                                                return n5(this, function(t) {
                                                    return e = n7(i), [2, nn.httpService.delete(e)]
                                                })
                                            })()];
                                        case 2:
                                            return 200 === n.sent().status && ((0, k.fireEvent)(nU), r.success(t("Description.SavedCreditCard.DeletePaymentMethodSuccess")), o()), [3, 4];
                                        case 3:
                                            return (null == (e = n.sent()) ? void 0 : e.status) === 412 && (null == e ? void 0 : e.data) === ni.RemovePaymentProfileNotAllowedFailure ? ((0, k.fireEvent)(nw), a.open()) : ((0, k.fireEvent)(nM), r.warning(t(rp))), [3, 4];
                                        case 4:
                                            return [2]
                                    }
                                })
                            }, function() {
                                var t = this,
                                    n = arguments;
                                return new Promise(function(r, a) {
                                    var o = e.apply(t, n);

                                    function i(e) {
                                        rg(o, r, a, i, s, "next", e)
                                    }

                                    function s(e) {
                                        rg(o, r, a, i, s, "throw", e)
                                    }
                                    i(void 0)
                                })
                            })()
                        },
                        onNeutral: function() {
                            (0, k.fireEvent)(nd)
                        }
                    })
                }, t[1]]
            };

            function rS(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            var rx = function() {
                var e, t = (e = (0, S.createModal)(), function(e) {
                        if (Array.isArray(e)) return e
                    }(e) || function(e, t) {
                        var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != a) {
                            var o = [],
                                i = !0,
                                s = !1;
                            try {
                                for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), o.length !== t); i = !0);
                            } catch (e) {
                                s = !0, r = e
                            } finally {
                                try {
                                    i || null == a.return || a.return()
                                } finally {
                                    if (s) throw r
                                }
                            }
                            return o
                        }
                    }(e, 2) || function(e, t) {
                        if (e) {
                            if ("string" == typeof e) return rS(e, 2);
                            var n = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return rS(e, t)
                        }
                    }(e, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    n = t[0],
                    r = t[1];
                return [function(e) {
                    var t = e.translate,
                        a = t("Heading.SavedCreditCard.CannotDeletePaymentMethod"),
                        o = (0, y.jsx)("div", {
                            className: "cannot-delete-payment-method-text",
                            children: t("Description.SavedCreditCard.CannotDeletePaymentMethod")
                        });
                    return (0, y.jsx)(n, {
                        id: "cannot-delete-card-modal",
                        title: a,
                        body: o,
                        neutralButtonText: t("Action.GotIt") || "Got it",
                        onNeutral: function() {
                            r.close()
                        },
                        closeable: !0,
                        size: "md"
                    })
                }, r]
            };

            function rC(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function rE(e, t, n, r, a, o, i) {
                try {
                    var s = e[o](i),
                        l = s.value
                } catch (e) {
                    n(e);
                    return
                }
                s.done ? t(l) : Promise.resolve(l).then(r, a)
            }

            function rA(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            s = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            s = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (s) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return rC(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return rC(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var rj = function() {
                var e = rA((0, g.useState)(!1), 2),
                    t = e[0],
                    n = e[1],
                    r = (0, g.useMemo)(function() {
                        return {
                            open: function() {
                                return n(!0)
                            },
                            close: function() {
                                return n(!1)
                            }
                        }
                    }, []);
                return [function(e) {
                    var n = e.translate,
                        a = e.onUpdateSuccess,
                        o = e.systemFeedbackService,
                        i = e.paymentProfileId,
                        s = e.cardType,
                        l = e.lastFour,
                        u = e.expMonth,
                        c = e.expYear,
                        d = rA((0, g.useState)(!1), 2),
                        f = d[0],
                        p = d[1],
                        h = rA((0, g.useState)(!1), 2),
                        v = h[0],
                        m = h[1],
                        b = rA((0, g.useState)(t9(c, u)), 2),
                        w = b[0],
                        x = b[1],
                        C = rA((0, g.useState)(!1), 2),
                        E = C[0],
                        A = C[1],
                        j = n("Heading.SavedCreditCard.UpdatePaymentMethod"),
                        T = {
                            __html: n("Description.SavedCreditCard.StripeUpdatePaymentMethodDisclosure", {
                                RobloxTermsLinkStart: '<a href="https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use" class="text-link" target="_blank">',
                                RobloxTermsLinkEnd: "</a>",
                                RobloxPrivacyPolicyLinkStart: '<a href=\'https://en.help.roblox.com/hc/en-us/articles/115004630823-Roblox-Privacy-and-Cookie-Policy\' class="text-link" target="_blank">',
                                RobloxPrivacyPolicyLinkEnd: "</a>",
                                StripeTermsOfUseLinkStart: '<a href="https://stripe.com/legal/end-users" class="text-link" target="_blank">',
                                StripeTermsOfUseLinkEnd: "</a>",
                                StripePrivacyPolicyLinkStart: '<a href=\'https://stripe.com/privacy\' class="text-link" target="_blank">',
                                StripePrivacyPolicyLinkEnd: "</a>"
                            })
                        };
                    (0, g.useEffect)(function() {
                        t || x(t9(c, u)), A(!1), m(!1)
                    }, [u, c]), (0, g.useEffect)(function() {
                        var e = new Date(c, u - 1),
                            t = nt(w),
                            n = new Date(new Date().getFullYear(), new Date().getMonth());
                        m(t !== e && t >= n), A(t < n || t < e)
                    }, [u, c, w]);
                    var P = (0, g.useCallback)(function() {
                        var e;
                        return (e = function() {
                            var e, t, s;
                            return function(e, t) {
                                var n, r, a, o = {
                                        label: 0,
                                        sent: function() {
                                            if (1 & a[0]) throw a[1];
                                            return a[1]
                                        },
                                        trys: [],
                                        ops: []
                                    },
                                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                return i.next = s(0), i.throw = s(1), i.return = s(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                                    return this
                                }), i;

                                function s(s) {
                                    return function(l) {
                                        var u = [s, l];
                                        if (n) throw TypeError("Generator is already executing.");
                                        for (; i && (i = 0, u[0] && (o = 0)), o;) try {
                                            if (n = 1, r && (a = 2 & u[0] ? r.return : u[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, u[1])).done) return a;
                                            switch (r = 0, a && (u = [2 & u[0], a.value]), u[0]) {
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
                                                    o.label++, r = u[1], u = [0];
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
                                            u = t.call(e, o)
                                        } catch (e) {
                                            u = [6, e], r = 0
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
                            }(this, function(l) {
                                switch (l.label) {
                                    case 0:
                                        p(!0), l.label = 1;
                                    case 1:
                                        var u, c;
                                        return l.trys.push([1, 3, , 4]), t = (e = rA(ne(w), 2))[0], s = e[1], (0, k.fireEvent)(nY), [4, (u = t, c = s, n4(function() {
                                            var e;
                                            return n5(this, function(t) {
                                                return e = n7(i), [2, nn.httpService.post(e, {
                                                    expirationMonth: u,
                                                    expirationYear: c
                                                })]
                                            })
                                        })())];
                                    case 2:
                                        return 200 === l.sent().status && ((0, k.fireEvent)(nq), o.success(n("Description.PaymentExpirationUpdateSuccess")), a(t, s)), [3, 4];
                                    case 3:
                                        return l.sent(), (0, k.fireEvent)(nV), o.warning(n(rp)), [3, 4];
                                    case 4:
                                        return p(!1), r.close(), [2]
                                }
                            })
                        }, function() {
                            var t = this,
                                n = arguments;
                            return new Promise(function(r, a) {
                                var o = e.apply(t, n);

                                function i(e) {
                                    rE(o, r, a, i, s, "next", e)
                                }

                                function s(e) {
                                    rE(o, r, a, i, s, "throw", e)
                                }
                                i(void 0)
                            })
                        })()
                    }, [w, a, i, o, n]);
                    return (0, y.jsxs)(S.Modal, {
                        show: t,
                        onHide: r.close,
                        size: "md",
                        id: "update-payment-method-modal",
                        children: [(0, y.jsx)(S.Modal.Header, {
                            title: j,
                            onClose: r.close
                        }), (0, y.jsxs)(S.Modal.Body, {
                            children: [(0, y.jsx)("div", {
                                className: "modal-description font-header-2 text-emphasis",
                                children: n(ro)
                            }), (0, y.jsxs)("div", {
                                className: "fr payment-method-display",
                                children: [(0, y.jsx)("span", {
                                    className: "payment-method-image cardIcon ".concat(no(s))
                                }), (0, y.jsx)("div", {
                                    className: "cardNumber text-emphasis font-header-2",
                                    children: "****".concat(l)
                                })]
                            }), (0, y.jsx)("div", {
                                className: "font-caption-header text-emphasis",
                                children: n("Label.Expiration")
                            }), (0, y.jsx)("input", {
                                type: "string",
                                name: "expiration",
                                placeholder: "MM/YY",
                                className: "expiry-input ".concat(E ? "error-input" : ""),
                                value: w,
                                inputMode: "numeric",
                                onChange: function(e) {
                                    var t = e.target.value;
                                    0 === w.indexOf(t) || (w.length >= 2 && t.startsWith("1/") && (t = "0".concat(t)), (t = t.replace(/\D/g, "")).length > 4 && (t = t.slice(0, 4)), 1 === t.length && "0" !== t && "1" !== t ? t = "0".concat(t, "/") : 2 === t.length && Number(t) > 12 ? t = "0".concat(t.slice(0, 1), "/").concat(t.slice(1)) : t.length >= 2 && t.length <= 4 && (t = "".concat(t.slice(0, 2), "/").concat(t.slice(2)))), x(t)
                                }
                            }), E && (0, y.jsx)("div", {
                                className: "font-caption-body input-error-text",
                                children: n("Error.InvalidExpirationDate")
                            })]
                        }), (0, y.jsx)("div", {
                            className: "footer-divider"
                        }), (0, y.jsxs)(S.Modal.Footer, {
                            children: [(0, y.jsx)("div", {
                                className: "font-caption-body disclosure-text",
                                dangerouslySetInnerHTML: T
                            }), (0, y.jsxs)("div", {
                                className: "modal-buttons",
                                children: [(0, y.jsx)(S.Button, {
                                    variant: S.Button.variants.secondary,
                                    width: S.Button.widths.full,
                                    size: S.Button.sizes.large,
                                    className: "action-button",
                                    onClick: r.close,
                                    children: n("Action.Cancel")
                                }), (0, y.jsx)(S.Button, {
                                    width: S.Button.widths.full,
                                    size: S.Button.sizes.large,
                                    className: "action-button",
                                    isLoading: f,
                                    isDisabled: !v,
                                    onClick: P,
                                    children: n("Action.Save")
                                })]
                            })]
                        })]
                    })
                }, r]
            };

            function rk(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function rT(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            s = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            s = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (s) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return rk(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return rk(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var rP = function(e) {
                var t = e.translate,
                    n = e.systemFeedbackService,
                    r = e.updatePaymentProfiles,
                    a = e.paymentProfileId,
                    o = e.cardType,
                    i = e.lastFour,
                    s = e.expMonth,
                    l = e.expYear,
                    u = rT((0, g.useState)(!1), 2),
                    c = u[0],
                    d = u[1],
                    f = rT(rw(), 2),
                    p = f[0],
                    h = f[1],
                    v = rT(rx(), 2),
                    m = v[0],
                    b = v[1],
                    w = rT((0, g.useState)(!1), 2),
                    S = w[0],
                    x = w[1],
                    C = rT((0, g.useState)(s), 2),
                    E = C[0],
                    A = C[1],
                    j = rT((0, g.useState)(l), 2),
                    T = j[0],
                    P = j[1],
                    N = "****".concat(i),
                    I = "".concat(t("Label.SavedCreditCard.Exp"), " ").concat(t9(T, E));
                (0, g.useEffect)(function() {
                    x(new Date(T, E - 1) < new Date)
                }, [E, T]);
                var U = rT(rj(), 2),
                    M = U[0],
                    O = U[1];
                return c ? null : (0, y.jsxs)("div", {
                    className: "cardContainer",
                    children: [(0, y.jsx)(p, {
                        translate: t,
                        systemFeedbackService: n,
                        cannotDeletePaymentMethodModalService: b,
                        paymentProfileId: a,
                        onDeleteSuccess: function() {
                            r(), d(!0)
                        }
                    }), (0, y.jsx)(m, {
                        translate: t
                    }), (0, y.jsx)(M, {
                        translate: t,
                        onUpdateSuccess: function(e, t) {
                            A(e), P(t)
                        },
                        systemFeedbackService: n,
                        paymentProfileId: a,
                        cardType: o,
                        lastFour: i,
                        expMonth: E,
                        expYear: T
                    }), (0, y.jsx)("span", {
                        className: "payment-method-image cardIcon ".concat(no(o))
                    }), (0, y.jsx)("div", {
                        className: "cardNumber font-bold",
                        children: N
                    }), (0, y.jsx)("div", {
                        className: "cardExpiry",
                        children: I
                    }), (0, y.jsx)("button", {
                        type: "button",
                        className: "btn-generic-edit-sm",
                        onClick: function() {
                            O.open(), (0, k.fireEvent)(nf)
                        },
                        children: (0, y.jsx)("span", {
                            className: "icon-edit"
                        })
                    }), (0, y.jsx)("button", {
                        type: "button",
                        className: "btn-generic-trash-bin-sm",
                        onClick: function() {
                            h.open(), (0, k.fireEvent)(nc)
                        },
                        children: (0, y.jsx)("span", {
                            className: "icon-trash-bin"
                        })
                    }), S && (0, y.jsxs)(g.Fragment, {
                        children: [(0, y.jsx)("span", {
                            className: "icon-remove"
                        }), (0, y.jsx)("div", {
                            className: "card-expired",
                            children: t("Label.Expired")
                        })]
                    })]
                })
            };

            function rN(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function rI(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            s = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            s = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (s) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return rN(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return rN(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var rU = function(e) {
                    var t = e.translate,
                        n = e.systemFeedbackService,
                        r = e.updatePaymentProfiles,
                        a = e.paymentProfileId,
                        o = e.email,
                        i = rI((0, g.useState)(!1), 2),
                        s = i[0],
                        l = i[1],
                        u = rI(rw(), 2),
                        c = u[0],
                        d = u[1],
                        f = rI(rx(), 2),
                        p = f[0],
                        h = f[1];
                    if (s) return null;
                    var v = t("Label.SavedCreditCard.Email") || "Email",
                        m = o ? "".concat(v, ": ").concat(o) : "";
                    return (0, y.jsxs)("div", {
                        className: "cardContainer",
                        children: [(0, y.jsx)(c, {
                            translate: t,
                            systemFeedbackService: n,
                            cannotDeletePaymentMethodModalService: h,
                            paymentProfileId: a,
                            onDeleteSuccess: function() {
                                r(), l(!0)
                            }
                        }), (0, y.jsx)(p, {
                            translate: t
                        }), (0, y.jsx)("span", {
                            className: "payment-method-image cardIcon paypal"
                        }), (0, y.jsx)("div", {
                            className: "cardNumber font-bold",
                            children: t("Label.Paypal")
                        }), o && (0, y.jsx)("div", {
                            className: "paypalEmail",
                            children: m
                        }), (0, y.jsx)("button", {
                            type: "button",
                            className: "btn-generic-edit-sm",
                            style: {
                                visibility: "hidden"
                            },
                            children: (0, y.jsx)("span", {
                                className: "icon-edit"
                            })
                        }), (0, y.jsx)("button", {
                            type: "button",
                            className: "btn-generic-trash-bin-sm",
                            onClick: function() {
                                d.open(), (0, k.fireEvent)(nc)
                            },
                            children: (0, y.jsx)("span", {
                                className: "icon-trash-bin"
                            })
                        })]
                    })
                },
                rM = function(e) {
                    var t = e.translate,
                        n = e.errorCode,
                        r = "";
                    switch (n) {
                        case nZ:
                            r = t("Description.SavedCreditCard.IncorrectCVCErrorMessage") || "Incorrect CVC. Please check your information and try again.";
                            break;
                        case n0:
                            r = t("Description.SavedCreditCard.CardExpiredErrorMessage") || "Card expired. Please review the card details or try a different card.";
                            break;
                        default:
                            return null
                    }
                    return (0, y.jsx)("div", {
                        className: "alert-warning small-oneline form-error-banner",
                        children: r
                    })
                };

            function rO(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function rD(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            s = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            s = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (s) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return rO(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return rO(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var r_ = function(e) {
                var t, n, r = e.translate,
                    a = e.elements,
                    o = e.onFormChange,
                    i = e.updateInputEmail,
                    s = e.stripeEmail,
                    l = e.robloxEmail,
                    u = e.stripeErrorCode,
                    c = rD((0, g.useState)(!1), 2),
                    d = c[0],
                    f = c[1],
                    p = rD((0, g.useState)(!1), 2),
                    h = p[0],
                    v = p[1],
                    m = rD((0, g.useState)("" !== s || "" !== l), 2),
                    b = m[0],
                    w = m[1],
                    S = rD((0, g.useState)("" !== s ? s : l), 2),
                    x = S[0],
                    C = S[1],
                    E = rD((0, g.useState)(!1), 2),
                    A = E[0],
                    j = E[1],
                    k = rD((0, g.useState)(!1), 2),
                    T = k[0],
                    P = k[1],
                    N = {
                        __html: r("Description.SavedCreditCard.StripeAddPaymentMethodDisclosure", {
                            stripeTermsOfUseLinkStart: '<a href="https://stripe.com/legal/end-users" class="text-link" target="_blank">',
                            stripeTermsOfUseLinkEnd: "</a>",
                            stripePrivacyPolicyLinkStart: '<a href=\'https://stripe.com/privacy\' class="text-link" target="_blank">',
                            stripePrivacyPolicyLinkEnd: "</a>"
                        })
                    },
                    I = r("Description.SavedCreditCard.ProvideEmail"),
                    U = r("Label.InvalidEmailFormat"),
                    M = r("Description.SavedCreditCard.EmailCannotBeChanged");
                (0, g.useEffect)(function() {
                    t || (null == (t = null == a ? void 0 : a.getElement("payment")) || t.on("ready", function() {
                        null == t || t.clear()
                    }), null == t || t.on("change", function(e) {
                        f(e.complete)
                    })), n || (null == (n = null == a ? void 0 : a.getElement("address")) || n.on("ready", function() {
                        null == n || n.clear()
                    }), null == n || n.on("change", function(e) {
                        v(e.complete)
                    }))
                }, []), (0, g.useEffect)(function() {
                    o(!d || !h || A || "" === x)
                }, [d, h, x, A]);
                var O = function(e) {
                        var t = e.target.value.trim().replace(/\s/g, ""),
                            n = new RegExp(/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/);
                        j(T && "" !== t && null === n.exec(t)), C(t), i(t)
                    },
                    D = (0, y.jsxs)("div", {
                        children: [(0, y.jsxs)("div", {
                            className: "form-group form-has-feedback ".concat(A ? "form-has-error" : ""),
                            children: [(0, y.jsx)("input", {
                                className: "form-control input-field billing-email-input",
                                type: "email",
                                name: "email",
                                value: x,
                                onChange: function(e) {
                                    return O(e)
                                },
                                disabled: !0
                            }), (0, y.jsx)("span", {
                                className: "icon-status-unavailable"
                            })]
                        }), (0, y.jsx)("div", {
                            className: "form-group form-has-feedback",
                            children: (0, y.jsx)("div", {
                                className: "form-control-label small text email-label",
                                children: M
                            })
                        })]
                    }),
                    _ = (0, y.jsxs)("div", {
                        children: [(0, y.jsxs)("div", {
                            className: "form-group form-has-feedback ".concat(A ? "form-has-error" : ""),
                            children: [(0, y.jsx)("input", {
                                className: "form-control input-field billing-email-input unset-cursor",
                                type: "email",
                                name: "email",
                                value: x,
                                onChange: function(e) {
                                    return O(e)
                                },
                                disabled: b
                            }), T ? (0, y.jsx)("button", {
                                type: "button",
                                className: "icon-button-override",
                                onClick: function() {
                                    i(l), C(l), P(!1), w(!0)
                                },
                                children: (0, y.jsx)("span", {
                                    className: "icon-regenerate"
                                })
                            }) : (0, y.jsx)("button", {
                                type: "button",
                                className: "icon-button-override",
                                onClick: function() {
                                    i(""), C(""), P(!0), w(!1)
                                },
                                children: (0, y.jsx)("span", {
                                    className: "icon-edit"
                                })
                            }), A ? (0, y.jsx)("p", {
                                className: "form-control-label",
                                children: U
                            }) : null]
                        }), (0, y.jsx)("div", {
                            className: "form-group form-has-feedback",
                            children: (0, y.jsx)("div", {
                                className: "form-control-label small text email-label",
                                children: I
                            })
                        })]
                    }),
                    R = (0, y.jsxs)("div", {
                        children: [(0, y.jsx)("div", {
                            className: "form-group form-has-feedback ".concat(A ? "form-has-error" : ""),
                            children: (0, y.jsx)("input", {
                                className: "form-control input-field billing-email-input",
                                type: "email",
                                name: "email",
                                value: x,
                                onChange: function(e) {
                                    return O(e)
                                },
                                disabled: b
                            })
                        }), (0, y.jsx)("div", {
                            className: "form-group form-has-feedback",
                            children: (0, y.jsx)("div", {
                                className: "form-control-label small text email-label",
                                children: I
                            })
                        })]
                    });
                return a ? (0, y.jsxs)("div", {
                    className: "add-card-modal",
                    children: [(0, y.jsx)("h2", {
                        className: "stripe-form-header",
                        children: r(ro)
                    }), (0, y.jsx)(ev, {}), (0, y.jsx)("h2", {
                        className: "stripe-form-header billing-email-header",
                        children: r("Heading.SavedCreditCard.BillingEmail")
                    }), "" !== s ? D : "" !== l ? _ : R, (0, y.jsx)("h2", {
                        className: "stripe-form-header",
                        children: r(ri)
                    }), (0, y.jsx)(em, {
                        options: {
                            mode: "billing"
                        }
                    }), (0, y.jsx)("div", {
                        className: "form-control-label small text stripe-form-disclosure",
                        dangerouslySetInnerHTML: N
                    }), u ? (0, y.jsx)(rM, {
                        translate: r,
                        errorCode: u
                    }) : null]
                }) : (0, y.jsxs)("div", {
                    className: "add-card-modal",
                    children: [(0, y.jsx)("h2", {
                        className: "stripe-form-header",
                        children: r(ro)
                    }), (0, y.jsx)("span", {
                        className: "spinner spinner-default"
                    }), (0, y.jsx)("h2", {
                        className: "stripe-form-header",
                        children: r(ri)
                    }), (0, y.jsx)("span", {
                        className: "spinner spinner-default"
                    })]
                })
            };

            function rR(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function rF(e, t, n, r, a, o, i) {
                try {
                    var s = e[o](i),
                        l = s.value
                } catch (e) {
                    n(e);
                    return
                }
                s.done ? t(l) : Promise.resolve(l).then(r, a)
            }

            function rB(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, a) {
                        var o = e.apply(t, n);

                        function i(e) {
                            rF(o, r, a, i, s, "next", e)
                        }

                        function s(e) {
                            rF(o, r, a, i, s, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function rL(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            s = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            s = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (s) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return rR(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return rR(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rG(e, t) {
                var n, r, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return i.next = s(0), i.throw = s(1), i.return = s(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                    return this
                }), i;

                function s(s) {
                    return function(l) {
                        var u = [s, l];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, u[0] && (o = 0)), o;) try {
                            if (n = 1, r && (a = 2 & u[0] ? r.return : u[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, u[1])).done) return a;
                            switch (r = 0, a && (u = [2 & u[0], a.value]), u[0]) {
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
                                    o.label++, r = u[1], u = [0];
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
                            u = t.call(e, o)
                        } catch (e) {
                            u = [6, e], r = 0
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
            var rH = window.CoreRobloxUtilities,
                rW = "Label.RemainingBalance",
                rY = "Label.ConvertibleCredit",
                rq = "Action.Buy",
                rV = "Action.ConvertToRobux",
                rX = "Message.25PercentMoreRobuxConvert",
                rz = "Alert.RobuxPackagePurchased",
                rQ = "Alert.RobuxPackagePurchaseFailed",
                r$ = "Alert.SuccessfullyConvertedCreditToRobux",
                rK = "Heading.CreditConversionFail",
                rJ = "Alert.GenericFailure",
                rZ = "Header.OrderSummary",
                r0 = "Message.RobuxPurchased",
                r1 = "Message.IncludesUpToTwentyFivePercentMoreRobux",
                r2 = "NewCreditConversionGetNextPurchasableUnexpectedException",
                r3 = "ProcessPaymentRequestFailedStatusCode",
                r4 = "ProcessPaymentUnexpectedException",
                r6 = "ProcessPaymentEconomicRestriction",
                r5 = {
                    500: 400,
                    1e3: 800,
                    2e3: 1700,
                    5250: 4500,
                    11e3: 1e4,
                    24e3: 22500,
                    550: 440,
                    1100: 880,
                    2200: 1870,
                    5800: 4950,
                    12100: 11e3,
                    26400: 25e3
                };

            function r8(e, t, n, r, a, o, i) {
                try {
                    var s = e[o](i),
                        l = s.value
                } catch (e) {
                    n(e);
                    return
                }
                s.done ? t(l) : Promise.resolve(l).then(r, a)
            }

            function r7(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, a) {
                        var o = e.apply(t, n);

                        function i(e) {
                            r8(o, r, a, i, s, "next", e)
                        }

                        function s(e) {
                            r8(o, r, a, i, s, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function r9(e, t) {
                var n, r, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return i.next = s(0), i.throw = s(1), i.return = s(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                    return this
                }), i;

                function s(s) {
                    return function(l) {
                        var u = [s, l];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, u[0] && (o = 0)), o;) try {
                            if (n = 1, r && (a = 2 & u[0] ? r.return : u[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, u[1])).done) return a;
                            switch (r = 0, a && (u = [2 & u[0], a.value]), u[0]) {
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
                                    o.label++, r = u[1], u = [0];
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
                            u = t.call(e, o)
                        } catch (e) {
                            u = [6, e], r = 0
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
            var ae = function(e) {
                    return r7(function() {
                        var t, n;
                        return r9(this, function(r) {
                            return t = {
                                paymentProviderType: "Credit",
                                providerPayload: {
                                    product_id: e || void 0
                                }
                            }, n = {
                                withCredentials: !0,
                                url: "".concat(v.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/process-payment")
                            }, [2, nn.httpService.post(n, t)]
                        })
                    })()
                },
                at = function(e, t) {
                    return r7(function() {
                        var n, r;
                        return r9(this, function(a) {
                            return n = {
                                withCredentials: !0,
                                url: "".concat(v.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/prepare-payment-for-credit-conversion")
                            }, r = {
                                paymentFlowId: rH.paymentFlowAnalyticsService.purchaseFlowUuid,
                                paymentSessionId: null == e ? void 0 : e.id,
                                address: t
                            }, [2, nn.httpService.post(n, r)]
                        })
                    })()
                },
                an = function(e, t, n, r) {
                    var a = e ? rH.paymentFlowAnalyticsService.ENUM_PURCHASE_STATUS.PASSED_PREPARE_PAYMENT_REQUEST : rH.paymentFlowAnalyticsService.ENUM_PURCHASE_STATUS.FAILED_PREPARE_PAYMENT_REQUEST;
                    r && (a = rH.paymentFlowAnalyticsService.ENUM_PURCHASE_STATUS.PASSED_PREPARE_PAYMENT_REQUEST_WITH_TAX);
                    var o = n ? t ? rH.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_PACKAGE_PURCHASE_MODAL_WITH_TAX : rH.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_PACKAGE_PURCHASE_MODAL_WITHOUT_TAX : t ? rH.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_CONVERSION_MODAL_WITH_TAX : rH.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_CONVERSION_MODAL_WITHOUT_TAX;
                    rH.paymentFlowAnalyticsService.sendUserPurchaseStatusEvent(rH.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_REDEEM_PAGE, a, void 0, o)
                },
                ar = function(e) {
                    rH.paymentFlowAnalyticsService.sendUserPurchaseStatusEvent(rH.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_REDEEM_PAGE, e ? rH.paymentFlowAnalyticsService.ENUM_PURCHASE_STATUS.PASSED_GET_NEXT_PURCHASABLE_METADATA : rH.paymentFlowAnalyticsService.ENUM_PURCHASE_STATUS.FAILED_GET_NEXT_PURCHASABLE_METADATA, void 0, void 0)
                },
                aa = function(e, t, n) {
                    var r = n ? t ? rH.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_PACKAGE_PURCHASE_MODAL_WITH_TAX : rH.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_PACKAGE_PURCHASE_MODAL_WITHOUT_TAX : t ? rH.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_CONVERSION_MODAL_WITH_TAX : rH.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_CONVERSION_MODAL_WITHOUT_TAX;
                    rH.paymentFlowAnalyticsService.sendUserPurchaseStatusEvent(rH.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_REDEEM_PAGE, e ? rH.paymentFlowAnalyticsService.ENUM_PURCHASE_STATUS.PASSED_UPDATE_ADDRESS_FOR_CHECKOUT_SESSION : rH.paymentFlowAnalyticsService.ENUM_PURCHASE_STATUS.FAILED_UPDATE_ADDRESS_FOR_CHECKOUT_SESSION, void 0, r)
                },
                ao = function(e, t, n) {
                    var r = n ? t ? rH.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_PACKAGE_PURCHASE_MODAL_WITH_TAX : rH.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_PACKAGE_PURCHASE_MODAL_WITHOUT_TAX : t ? rH.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_CONVERSION_MODAL_WITH_TAX : rH.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_CONVERSION_MODAL_WITHOUT_TAX;
                    rH.paymentFlowAnalyticsService.sendUserPurchaseStatusEvent(rH.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_REDEEM_PAGE, e ? rH.paymentFlowAnalyticsService.ENUM_PURCHASE_STATUS.PASSED_PROCESS_PAYMENT : rH.paymentFlowAnalyticsService.ENUM_PURCHASE_STATUS.FAILED_PROCESS_PAYMENT, void 0, r)
                };

            function ai(e, t, n, r, a, o, i) {
                try {
                    var s = e[o](i),
                        l = s.value
                } catch (e) {
                    n(e);
                    return
                }
                s.done ? t(l) : Promise.resolve(l).then(r, a)
            }

            function as(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, a) {
                        var o = e.apply(t, n);

                        function i(e) {
                            ai(o, r, a, i, s, "next", e)
                        }

                        function s(e) {
                            ai(o, r, a, i, s, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function al(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function au(e, t) {
                var n, r, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return i.next = s(0), i.throw = s(1), i.return = s(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                    return this
                }), i;

                function s(s) {
                    return function(l) {
                        var u = [s, l];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, u[0] && (o = 0)), o;) try {
                            if (n = 1, r && (a = 2 & u[0] ? r.return : u[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, u[1])).done) return a;
                            switch (r = 0, a && (u = [2 & u[0], a.value]), u[0]) {
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
                                    o.label++, r = u[1], u = [0];
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
                            u = t.call(e, o)
                        } catch (e) {
                            u = [6, e], r = 0
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
            var ac = function(e, t) {
                    return as(function() {
                        var n, r;
                        return au(this, function(a) {
                            return n = {
                                withCredentials: !0,
                                url: "".concat(v.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/update-address-for-checkout-session")
                            }, r = {
                                checkoutSessionId: t,
                                address: e
                            }, [2, nn.httpService.post(n, r)]
                        })
                    })()
                },
                ad = function(e, t, n, r, a, o) {
                    var i, s, l = rH.upsellUtil.parseUpsellCookie(),
                        u = al({
                            paymentProviderType: "Credit",
                            providerPayload: (i = al({}, {
                                product_id: e,
                                upsellUuid: l.upsellUuid,
                                upsellItemPath: l.targetItemUrl,
                                checkoutSessionToken: r
                            }), s = s = {
                                productId: e
                            }, Object.getOwnPropertyDescriptors ? Object.defineProperties(i, Object.getOwnPropertyDescriptors(s)) : (function(e, t) {
                                var n = Object.keys(e);
                                if (Object.getOwnPropertySymbols) {
                                    var r = Object.getOwnPropertySymbols(e);
                                    n.push.apply(n, r)
                                }
                                return n
                            })(Object(s)).forEach(function(e) {
                                Object.defineProperty(i, e, Object.getOwnPropertyDescriptor(s, e))
                            }), i),
                            paymentSessionId: a,
                            checkoutSessionId: o
                        }, "" !== n && {
                            billingEmailType: n,
                            billingEmail: t
                        }),
                        c = {
                            withCredentials: !0,
                            url: "".concat(v.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/process-payment")
                        };
                    return nn.httpService.post(c, u)
                },
                af = window.Roblox["core-scripts"].paymentsFlow,
                ap = n.n(af);

            function ah(e, t, n, r, a, o, i) {
                try {
                    var s = e[o](i),
                        l = s.value
                } catch (e) {
                    n(e);
                    return
                }
                s.done ? t(l) : Promise.resolve(l).then(r, a)
            }

            function ay(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var av = ((o = {}).GET = "GET", o.POST = "POST", o),
                am = ((i = {}).PAYMENT = "Payment", i.ROBUX = "Robux", i.ROBUX_GIFTING = "RobuxGifting", i.ROBUX_REDESIGN = "RobuxRedesign", i),
                ab = ((s = {}).VERIFY_PHONE_VERIFICATION_SESSION = "VerifyPhoneVerificationSession", s.LANDING_PAGE_METADATA = "GetLandingPageMetadata", s.GET_USER_NAME = "GetUserName", s.PREPARE_PAYMENT = "PreparePayment", s.GET_METADATA = "GetMetadata", s.GET_PRODUCTS = "GetProducts", s.GET_PAYMENT_METHODS_INFO = "GetPaymentMethodsInfo", s.GET_PURCHASE_WARNING = "GetPurchaseWarning", s.GET_USER_PURCHASE_ELIGIBILITY = "GetUserPurchaseEligibility", s.CREATE_PAYMENT_SESSION = "CreatePaymentSession", s.GET_PAYMENT_SESSION = "GetPaymentSession", s.GET_PAYMENT_SESSION_BY_CHECKOUT_SESSION_ID = "GetPaymentSessionByCheckoutSessionId", s.CREATE_BONUS_SESSION = "CreateBonusSession", s.GET_BONUS_SESSION_BY_CHECKOUT_SESSION_ID = "GetBonusSessionByCheckoutSessionId", s.GET_THUMBNAILS = "GetThumbnails", s.HANDLE_GAME_PASS_JOIN_EVENT = "HandleGamePassJoinEvent", s.GET_ROBUX_BALANCE = "GetRobuxBalance", s.GET_AUTH_TICKET = "GetAuthTicket", s.GET_CLIENT_ASSERTION = "GetClientAssertion", s),
                ag = function(e, t, n) {
                    return new Promise(function(r) {
                        (0, k.fireEvent)("API_COUNTER_".concat(e, "_").concat(t, "_").concat(n || "Throughput")), r()
                    })
                },
                aw = function(e, t, n) {
                    return new Promise(function(r) {
                        (0, k.fireEvent)("ERROR_COUNTER_".concat(e, "_").concat(t, "_").concat(n || "UnknownAxiosError")), r()
                    })
                };

            function aS(e, t, n, r, a) {
                var o;
                return (o = function(e, t, n, r, a) {
                    var o, i, s, l, u, c, d;
                    return function(e, t) {
                        var n, r, a, o = {
                                label: 0,
                                sent: function() {
                                    if (1 & a[0]) throw a[1];
                                    return a[1]
                                },
                                trys: [],
                                ops: []
                            },
                            i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                        return i.next = s(0), i.throw = s(1), i.return = s(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                            return this
                        }), i;

                        function s(s) {
                            return function(l) {
                                var u = [s, l];
                                if (n) throw TypeError("Generator is already executing.");
                                for (; i && (i = 0, u[0] && (o = 0)), o;) try {
                                    if (n = 1, r && (a = 2 & u[0] ? r.return : u[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, u[1])).done) return a;
                                    switch (r = 0, a && (u = [2 & u[0], a.value]), u[0]) {
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
                                            o.label++, r = u[1], u = [0];
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
                                    u = t.call(e, o)
                                } catch (e) {
                                    u = [6, e], r = 0
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
                    }(this, function(f) {
                        switch (f.label) {
                            case 0:
                                o = n.feature, i = n.call, ag(o, i), f.label = 1;
                            case 1:
                                return f.trys.push([1, 3, , 4]), [4, "GET" === e ? nn.httpService.get(t, r) : nn.httpService.post(t, r)];
                            case 2:
                                return l = (s = f.sent()).data, u = s.headers, ag(o, i, 200), [2, (null == a ? void 0 : a(l, u)) || l];
                            case 3:
                                var p, h, y;
                                return (void 0 === (p = c = f.sent()) ? "undefined" : ay(p)) === "object" && "status" in p ? aw(o, i, c.status) : (void 0 === c ? "undefined" : ay(c)) === "object" && "config" in c ? aw(o, i, null == (d = c.response) ? void 0 : d.status) : (console.error(c), h = o, y = i, new Promise(function(e) {
                                    (0, k.fireEvent)("ERROR_COUNTER_".concat(h, "_").concat(y, "_NonAxiosError")), e()
                                })), [2, void 0];
                            case 4:
                                return [2]
                        }
                    })
                }, function() {
                    var e = this,
                        t = arguments;
                    return new Promise(function(n, r) {
                        var a = o.apply(e, t);

                        function i(e) {
                            ah(a, n, r, i, s, "next", e)
                        }

                        function s(e) {
                            ah(a, n, r, i, s, "throw", e)
                        }
                        i(void 0)
                    })
                }).apply(this, arguments)
            }

            function ax(e, t, n, r, a, o, i) {
                try {
                    var s = e[o](i),
                        l = s.value
                } catch (e) {
                    n(e);
                    return
                }
                s.done ? t(l) : Promise.resolve(l).then(r, a)
            }

            function aC(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, a) {
                        var o = e.apply(t, n);

                        function i(e) {
                            ax(o, r, a, i, s, "next", e)
                        }

                        function s(e) {
                            ax(o, r, a, i, s, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function aE(e, t) {
                var n, r, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return i.next = s(0), i.throw = s(1), i.return = s(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                    return this
                }), i;

                function s(s) {
                    return function(l) {
                        var u = [s, l];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, u[0] && (o = 0)), o;) try {
                            if (n = 1, r && (a = 2 & u[0] ? r.return : u[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, u[1])).done) return a;
                            switch (r = 0, a && (u = [2 & u[0], a.value]), u[0]) {
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
                                    o.label++, r = u[1], u = [0];
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
                            u = t.call(e, o)
                        } catch (e) {
                            u = [6, e], r = 0
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

            function aA(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function aj(e, t, n, r, a, o, i) {
                try {
                    var s = e[o](i),
                        l = s.value
                } catch (e) {
                    n(e);
                    return
                }
                s.done ? t(l) : Promise.resolve(l).then(r, a)
            }
            var ak = "paymentSession-".concat((null === v.CurrentUser || void 0 === v.CurrentUser ? void 0 : v.CurrentUser.userId) || "loggedout");

            function aT() {
                var e, t = arguments.length > 0 && void 0 !== arguments[0] && arguments[0],
                    n = (e = (0, g.useState)(t ? void 0 : rH.localStorageService.getLocalStorage(ak)), function(e) {
                        if (Array.isArray(e)) return e
                    }(e) || function(e, t) {
                        var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != a) {
                            var o = [],
                                i = !0,
                                s = !1;
                            try {
                                for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), o.length !== t); i = !0);
                            } catch (e) {
                                s = !0, r = e
                            } finally {
                                try {
                                    i || null == a.return || a.return()
                                } finally {
                                    if (s) throw r
                                }
                            }
                            return o
                        }
                    }(e, 2) || function(e, t) {
                        if (e) {
                            if ("string" == typeof e) return aA(e, 2);
                            var n = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return aA(e, t)
                        }
                    }(e, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    r = n[0],
                    a = n[1],
                    o = (0, g.useCallback)(function(e) {
                        var t;
                        return (t = function() {
                            var t, n;
                            return function(e, t) {
                                var n, r, a, o = {
                                        label: 0,
                                        sent: function() {
                                            if (1 & a[0]) throw a[1];
                                            return a[1]
                                        },
                                        trys: [],
                                        ops: []
                                    },
                                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                return i.next = s(0), i.throw = s(1), i.return = s(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                                    return this
                                }), i;

                                function s(s) {
                                    return function(l) {
                                        var u = [s, l];
                                        if (n) throw TypeError("Generator is already executing.");
                                        for (; i && (i = 0, u[0] && (o = 0)), o;) try {
                                            if (n = 1, r && (a = 2 & u[0] ? r.return : u[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, u[1])).done) return a;
                                            switch (r = 0, a && (u = [2 & u[0], a.value]), u[0]) {
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
                                                    o.label++, r = u[1], u = [0];
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
                                            u = t.call(e, o)
                                        } catch (e) {
                                            u = [6, e], r = 0
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
                            }(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        if (!e) return [3, 2];
                                        return [4, aC(function() {
                                            return aE(this, function(t) {
                                                return [2, aS(av.GET, {
                                                    withCredentials: !0,
                                                    url: "".concat(v.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-sessions/").concat(e)
                                                }, {
                                                    feature: am.PAYMENT,
                                                    call: ab.GET_PAYMENT_SESSION
                                                })]
                                            })
                                        })()];
                                    case 1:
                                        return n = r.sent(), [3, 4];
                                    case 2:
                                        return [4, aC(function() {
                                            return aE(this, function(e) {
                                                return [2, aS(av.POST, {
                                                    withCredentials: !0,
                                                    url: "".concat(v.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-sessions")
                                                }, {
                                                    feature: am.PAYMENT,
                                                    call: ab.CREATE_PAYMENT_SESSION
                                                }, {
                                                    paymentFlowId: ap().getPaymentFlowUuid()
                                                })]
                                            })
                                        })()];
                                    case 3:
                                        n = r.sent(), r.label = 4;
                                    case 4:
                                        if (!(t = n)) return [2];
                                        return rH.localStorageService.setLocalStorage(ak, t.paymentSession), a(t.paymentSession), [2]
                                }
                            })
                        }, function() {
                            var e = this,
                                n = arguments;
                            return new Promise(function(r, a) {
                                var o = t.apply(e, n);

                                function i(e) {
                                    aj(o, r, a, i, s, "next", e)
                                }

                                function s(e) {
                                    aj(o, r, a, i, s, "throw", e)
                                }
                                i(void 0)
                            })
                        })()
                    }, []);
                return (0, g.useEffect)(function() {
                    var e;
                    if (r) {
                        new Date(r.expiresAt) < new Date && o();
                        return
                    }
                    o(null == (e = nn.urlService.getQueryParam("paymentSessionId")) ? void 0 : e.toString())
                }, [o, r]), r
            }
            var aP = ((l = aP || {}).RobloxCredit = "robloxCredit", l.RedeemCard = "redeemCard", l.Credit = "credit", l);

            function aN(e) {
                return void 0 !== e.data && void 0 !== e.data.expirationTimeInMinutes && void 0 !== e.data.failureReason
            }

            function aI(e, t) {
                switch (t) {
                    case "FraudPaymentAuthorizationAttempt":
                    default:
                        return e("Label.Sublabel.FraudPaymentAbuse");
                    case "FraudVirtualEconomyAbuse":
                        return e("Label.Sublabel.FraudVirtualEconomyAbuse");
                    case "FraudAbuseOfAffiliateSystem":
                        return e("Label.Sublabel.FraudAbuseOfTheAffiliateSystem");
                    case "FraudAttemptedUnauthorizedPaymentMethodUse":
                        return e("Label.Sublabel.FraudAttemptedUnauthorizedPaymentMethodUse");
                    case "FraudRepeatedRefundRequests":
                        return e("Label.Sublabel.FraudRepeatedRefundRequests");
                    case "FraudSuspiciousRefundRequests":
                        return e("Label.Sublabel.FraudSuspiciousRefundRequests");
                    case "FraudUnauthorizedPurchase":
                        return e("Label.Sublabel.FraudUnauthorizedPurchase");
                    case "FraudUseOfUnauthorizedOffPlatformTransactions":
                        return e("Label.Sublabel.FraudUseOfUnauthorizedOffPlatformTransactions");
                    case "FraudUseOfUnauthorizedPaymentMethod":
                        return e("Label.Sublabel.FraudUseOfUnauthorizedPaymentMethod");
                    case "FraudSuspiciousAccountPatterns":
                        return e("Label.Sublabel.FraudSuspiciousAccountPatterns");
                    case "FraudChargeback":
                        return e("Label.AbuseType.Chargeback")
                }
            }

            function aU(e) {
                var t = e.translate,
                    n = e.violation,
                    r = Math.ceil(e.timeoutDurationInMinutes / 60);
                if (r > 24) {
                    var a = Math.ceil(r / 24);
                    return t("Text.EconomicRestrictionsDays", {
                        violation: aI(t, n),
                        day: a
                    })
                }
                return t("Text.EconomicRestrictionsHours", {
                    violation: aI(t, n),
                    hour: r
                })
            }
            var aM = function(e, t) {
                var n = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2];
                if (void 0 !== e && n) return {
                    amount: e,
                    currencyCode: t
                }
            };

            function aO(e, t, n, r, a, o, i) {
                try {
                    var s = e[o](i),
                        l = s.value
                } catch (e) {
                    n(e);
                    return
                }
                s.done ? t(l) : Promise.resolve(l).then(r, a)
            }
            var aD = function(e, t) {
                var n;
                return (n = function() {
                    var n, r, a, o, i, s, l, u, c;
                    return function(e, t) {
                        var n, r, a, o = {
                                label: 0,
                                sent: function() {
                                    if (1 & a[0]) throw a[1];
                                    return a[1]
                                },
                                trys: [],
                                ops: []
                            },
                            i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                        return i.next = s(0), i.throw = s(1), i.return = s(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                            return this
                        }), i;

                        function s(s) {
                            return function(l) {
                                var u = [s, l];
                                if (n) throw TypeError("Generator is already executing.");
                                for (; i && (i = 0, u[0] && (o = 0)), o;) try {
                                    if (n = 1, r && (a = 2 & u[0] ? r.return : u[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, u[1])).done) return a;
                                    switch (r = 0, a && (u = [2 & u[0], a.value]), u[0]) {
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
                                            o.label++, r = u[1], u = [0];
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
                                    u = t.call(e, o)
                                } catch (e) {
                                    u = [6, e], r = 0
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
                                return d.trys.push([0, 3, , 4]), [4, e()];
                            case 1:
                                if (200 !== (a = d.sent()).status) return t.onStatusError(a.status), (0, k.fireEvent)("".concat(t.failedStatusPrefix).concat(a.status)), [2];
                                return (l = null != (s = null != (i = null == (o = null == (n = a.data) ? void 0 : n.providerPayload) ? void 0 : o.IsSuccessful) ? i : null == (r = a.data) ? void 0 : r.isSuccess) && s) || !t.unsuccessfulPrefix || (0, k.fireEvent)("".concat(t.unsuccessfulPrefix).concat((null == o ? void 0 : o.ResponseMessage) || "")), [4, t.onSuccess(a, l)];
                            case 2:
                                return d.sent(), [3, 4];
                            case 3:
                                return u = d.sent(), null == (c = t.onError) || c.call(t, u), [3, 4];
                            case 4:
                                return [2]
                        }
                    })
                }, function() {
                    var e = this,
                        t = arguments;
                    return new Promise(function(r, a) {
                        var o = n.apply(e, t);

                        function i(e) {
                            aO(o, r, a, i, s, "next", e)
                        }

                        function s(e) {
                            aO(o, r, a, i, s, "throw", e)
                        }
                        i(void 0)
                    })
                })()
            };

            function a_(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var aR = function(e) {
                    return !!e && (void 0 === e ? "undefined" : a_(e)) === "object" && ("number" == typeof e.status || "object" === a_(e.response) && null !== e.response && "number" == typeof e.response.status)
                },
                aF = function(e) {
                    var t;
                    if (aR(e)) return e.status || (null == (t = e.response) ? void 0 : t.status)
                },
                aB = function(e) {
                    var t;
                    if (aR(e)) return (null == (t = e.response) ? void 0 : t.data) || e.data
                },
                aL = function(e) {
                    var t = aF(e),
                        n = aB(e);
                    return 422 === t && 2 === n
                },
                aG = function(e) {
                    return !!e && (void 0 === e ? "undefined" : e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e) == "object" && "isAxiosError" in e
                };

            function aH(e, t, n) {
                if (aG(n)) {
                    var r;
                    (0, k.fireEvent)("ERROR_COUNTER_".concat(e, "_").concat(t, "_").concat((null == (r = n.response) ? void 0 : r.status) || "UnknownAxiosError"))
                } else(0, k.fireEvent)("ERROR_COUNTER_".concat(e, "_").concat(t, "_NonAxiosError"))
            }

            function aW(e, t, n, r, a, o, i) {
                try {
                    var s = e[o](i),
                        l = s.value
                } catch (e) {
                    n(e);
                    return
                }
                s.done ? t(l) : Promise.resolve(l).then(r, a)
            }

            function aY(e, t, n, r) {
                var a;
                return (a = function(e, t, n, r) {
                    var a, o, i, s, l, u, c, d, f, p, h, y, v, m, b = arguments;
                    return function(e, t) {
                        var n, r, a, o = {
                                label: 0,
                                sent: function() {
                                    if (1 & a[0]) throw a[1];
                                    return a[1]
                                },
                                trys: [],
                                ops: []
                            },
                            i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                        return i.next = s(0), i.throw = s(1), i.return = s(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                            return this
                        }), i;

                        function s(s) {
                            return function(l) {
                                var u = [s, l];
                                if (n) throw TypeError("Generator is already executing.");
                                for (; i && (i = 0, u[0] && (o = 0)), o;) try {
                                    if (n = 1, r && (a = 2 & u[0] ? r.return : u[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, u[1])).done) return a;
                                    switch (r = 0, a && (u = [2 & u[0], a.value]), u[0]) {
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
                                            o.label++, r = u[1], u = [0];
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
                                    u = t.call(e, o)
                                } catch (e) {
                                    u = [6, e], r = 0
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
                    }(this, function(g) {
                        switch (g.label) {
                            case 0:
                                i = void 0 !== (o = (a = b.length > 4 && void 0 !== b[4] ? b[4] : {}).enableRetry) && o, s = a.counterPrefix, u = void 0 === (l = a.showErrorBanner) || l, c = a.onError, f = i ? 2 : 1, p = 1, g.label = 1;
                            case 1:
                                if (!(p <= f)) return [3, 6];
                                g.label = 2;
                            case 2:
                                return g.trys.push([2, 4, , 5]), [4, e()];
                            case 3:
                                return [2, g.sent()];
                            case 4:
                                var w;
                                if (d = h = g.sent(), y = p < f, v = aF(h), aH("CreditConversion", t, h), v && s && (m = y ? "_RETRY" : "", (0, k.fireEvent)("".concat(s).concat(v).concat(m))), y && !(429 === (w = aF(h)) || "UpdateAddress" === t && aL(h)) && (w && w >= 400 && w < 500 ? 408 === w : !w || w >= 500)) return [3, 5];
                                return u && !("UpdateAddress" === t && aL(h)) && 1 && n.warning(r(rJ) || "Something went wrong! Please try again later.", 200, 5e3), c && c(h), [3, 6];
                            case 5:
                                return p++, [3, 1];
                            case 6:
                                throw d
                        }
                    })
                }, function() {
                    var e = this,
                        t = arguments;
                    return new Promise(function(n, r) {
                        var o = a.apply(e, t);

                        function i(e) {
                            aW(o, n, r, i, s, "next", e)
                        }

                        function s(e) {
                            aW(o, n, r, i, s, "throw", e)
                        }
                        i(void 0)
                    })
                }).apply(this, arguments)
            }

            function aq(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function aV(e, t, n, r, a, o, i) {
                try {
                    var s = e[o](i),
                        l = s.value
                } catch (e) {
                    n(e);
                    return
                }
                s.done ? t(l) : Promise.resolve(l).then(r, a)
            }

            function aX(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, a) {
                        var o = e.apply(t, n);

                        function i(e) {
                            aV(o, r, a, i, s, "next", e)
                        }

                        function s(e) {
                            aV(o, r, a, i, s, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function az(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        var r;
                        r = n[t], t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r
                    })
                }
                return e
            }

            function aQ(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            s = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            s = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (s) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return aq(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return aq(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function a$(e, t) {
                var n, r, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return i.next = s(0), i.throw = s(1), i.return = s(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                    return this
                }), i;

                function s(s) {
                    return function(l) {
                        var u = [s, l];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, u[0] && (o = 0)), o;) try {
                            if (n = 1, r && (a = 2 & u[0] ? r.return : u[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, u[1])).done) return a;
                            switch (r = 0, a && (u = [2 & u[0], a.value]), u[0]) {
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
                                    o.label++, r = u[1], u = [0];
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
                            u = t.call(e, o)
                        } catch (e) {
                            u = [6, e], r = 0
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
            var aK = (0, g.createContext)(void 0),
                aJ = function(e) {
                    var t = e.children,
                        n = e.systemFeedbackService,
                        r = e.translate,
                        a = e.onSuccess,
                        o = aT(),
                        i = aQ((0, g.useState)(!1), 2),
                        s = i[0],
                        l = i[1],
                        u = aQ((0, g.useState)(!1), 2),
                        c = u[0],
                        d = u[1],
                        f = aQ((0, g.useState)(!1), 2),
                        p = f[0],
                        h = f[1],
                        m = aQ((0, g.useState)(!1), 2),
                        b = m[0],
                        w = m[1],
                        S = aQ((0, g.useState)(""), 2),
                        x = S[0],
                        C = S[1],
                        E = aQ((0, g.useState)(0), 2),
                        A = E[0],
                        j = E[1],
                        T = aQ((0, g.useState)(0), 2),
                        P = T[0],
                        N = T[1],
                        I = aQ((0, g.useState)(0), 2),
                        U = I[0],
                        M = I[1],
                        O = aQ((0, g.useState)(0), 2),
                        D = O[0],
                        _ = O[1],
                        R = aQ((0, g.useState)(null), 2),
                        F = R[0],
                        B = R[1],
                        L = aQ((0, g.useState)(!1), 2),
                        G = L[0],
                        H = L[1],
                        W = aQ((0, g.useState)(!1), 2),
                        Y = W[0],
                        q = W[1],
                        V = aQ((0, g.useState)(void 0), 2),
                        X = V[0],
                        z = V[1],
                        Q = aQ((0, g.useState)(void 0), 2),
                        $ = Q[0],
                        K = Q[1],
                        J = aQ((0, g.useState)(!1), 2),
                        Z = J[0],
                        ee = J[1],
                        et = aQ((0, g.useState)(!1), 2),
                        en = et[0],
                        er = et[1],
                        ea = aQ((0, g.useState)(!1), 2),
                        eo = ea[0],
                        ei = ea[1],
                        es = aQ((0, g.useState)(!1), 2),
                        el = es[0],
                        eu = es[1],
                        ec = aQ((0, g.useState)(void 0), 2),
                        ed = ec[0],
                        ef = ec[1],
                        ep = aQ((0, g.useState)(void 0), 2),
                        eh = ep[0],
                        ey = ep[1],
                        ev = aQ((0, g.useState)(void 0), 2),
                        em = ev[0],
                        eb = ev[1],
                        eg = aQ((0, g.useState)(!0), 2),
                        ew = eg[0],
                        eS = eg[1],
                        ex = (0, g.useMemo)(function() {
                            return {
                                call: function(e, t, a) {
                                    return aY(e, t, n, r, a)
                                },
                                callWithRetry: function(e, t, a) {
                                    return aY(e, t, n, r, {
                                        enableRetry: !0,
                                        counterPrefix: a
                                    })
                                },
                                callAddressUpdate: function(e, t) {
                                    return aY(e, "UpdateAddress", n, r, {
                                        enableRetry: !0,
                                        counterPrefix: t
                                    })
                                }
                            }
                        }, [n, r]),
                        eC = (0, g.useCallback)(function(e, t) {
                            n.warning(e, 200, 5e3), l(!1), d(!1), t && (window.location.href = nn.urlService.getAbsoluteUrl("/upgrades/robux"))
                        }, [n]),
                        eE = (0, g.useCallback)(function() {
                            eC(r(rJ) || "Something went wrong! Please try again later.", !0)
                        }, [eC, r]),
                        eA = (0, g.useCallback)(function(e, t) {
                            var o = !t;
                            e ? (n.success(r(o ? r$ : rz)), a && a(o)) : n.warning(r(o ? rK : rQ) || r(rJ) || "Something went wrong! Please try again later.", 200, 5e3)
                        }, [n, r, a]),
                        ej = (0, g.useCallback)(function(e) {
                            var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                                n = e.TaxAmount,
                                r = function(e, t) {
                                    if (null == e) return {};
                                    var n, r, a = function(e, t) {
                                        if (null == e) return {};
                                        var n, r, a = {},
                                            o = Object.keys(e);
                                        for (r = 0; r < o.length; r++) n = o[r], t.indexOf(n) >= 0 || (a[n] = e[n]);
                                        return a
                                    }(e, t);
                                    if (Object.getOwnPropertySymbols) {
                                        var o = Object.getOwnPropertySymbols(e);
                                        for (r = 0; r < o.length; r++) n = o[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n])
                                    }
                                    return a
                                }(e, ["TaxAmount"]);
                            void 0 !== n && z(n), B(function(e) {
                                return az({}, e, r)
                            }), H(t), void 0 !== e.CheckoutSessionToken && ey(e.CheckoutSessionToken)
                        }, [B, H, ey, z]),
                        ek = (0, g.useCallback)(function(e) {
                            eu(e.robloxManagedTax), ef(e.checkoutSessionId), void 0 !== e.taxRate && K(e.taxRate), e.providerPayload.CurrencyCode && ej(e.providerPayload, e.hasBillingAddress)
                        }, [eu, ef, ej]),
                        eT = (0, g.useCallback)(function(e, t) {
                            return aX(function() {
                                var n, r;
                                return a$(this, function(a) {
                                    switch (a.label) {
                                        case 0:
                                            if (0 === e.productId) return [2, null];
                                            return [4, ex.call(function() {
                                                var n, r;
                                                return n = e.productId, r = aP.Credit, as(function() {
                                                    var e, a;
                                                    return au(this, function(i) {
                                                        return e = {
                                                            withCredentials: !0,
                                                            url: "".concat(v.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/prepare-payment")
                                                        }, a = {
                                                            paymentMethod: r,
                                                            productId: n,
                                                            paymentSessionId: null == o ? void 0 : o.id,
                                                            paymentFlowId: rH.paymentFlowAnalyticsService.getPaymentFlowUuid(),
                                                            address: t
                                                        }, [2, nn.httpService.post(e, a)]
                                                    })
                                                })()
                                            }, "PreparePayment")];
                                        case 1:
                                            if ((n = a.sent().data).isSuccess) return ek(n), (null == (r = n.selectedProduct) ? void 0 : r.price) !== void 0 && M(n.selectedProduct.price), an(!0, n.robloxManagedTax, !0, null !== n.taxRate), [2, n.checkoutSessionId];
                                            return [2, null]
                                    }
                                })
                            })()
                        }, [o, ek, M, ex]),
                        eP = (0, g.useCallback)(function(e) {
                            return aX(function() {
                                var t;
                                return a$(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            return [4, ex.call(function() {
                                                return at(o, e)
                                            }, "PreparePaymentForCreditConversion")];
                                        case 1:
                                            if ((t = n.sent().data).isSuccess) return ek(t), an(!0, t.robloxManagedTax, !1, null !== t.taxRate), [2, t.checkoutSessionId];
                                            return [2, null]
                                    }
                                })
                            })()
                        }, [o, ek, ex]),
                        eN = (0, g.useCallback)(function(e) {
                            0 !== e.productId ? (l(!0), d(!1), (0, k.fireEvent)("NewCreditConversionGetNextPurchasableProductPurchase")) : (d(!0), l(!1), (0, k.fireEvent)("NewCreditConversionGetNextPurchasableConversion"))
                        }, [l, d]),
                        eI = (0, g.useCallback)(function(e) {
                            d(!1), l(!1), B(function(t) {
                                var n, r;
                                return t ? (n = az({}, t), r = r = {
                                    AvailableCreditBalance: e
                                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(r)) : (function(e, t) {
                                    var n = Object.keys(e);
                                    if (Object.getOwnPropertySymbols) {
                                        var r = Object.getOwnPropertySymbols(e);
                                        n.push.apply(n, r)
                                    }
                                    return n
                                })(Object(r)).forEach(function(e) {
                                    Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(r, e))
                                }), n) : null
                            }), (0, k.fireEvent)("NewCreditConversionGetNextPurchasableCreditBalanceZero")
                        }, [d, l, B]),
                        eU = (0, g.useCallback)(function(e) {
                            j(e.productId), 0 !== e.productId && (e.robuxAmountProductGrant && _(e.robuxAmountProductGrant), e.balanceDue && M(e.balanceDue))
                        }, [j, _, M]),
                        eM = (0, g.useCallback)(function(e, t) {
                            return aX(function() {
                                var n;
                                return a$(this, function(r) {
                                    switch (r.label) {
                                        case 0:
                                            if (eb(t && !Y ? t : void 0), 0 === e.creditBalance || 0 === e.productId && 0 === e.robuxConversionAmount) return eI(e.creditBalance), [2];
                                            eU(e), n = 0 !== e.productId, r.label = 1;
                                        case 1:
                                            if (r.trys.push([1, 6, , 7]), !n) return [3, 3];
                                            return [4, eT(e, t)];
                                        case 2:
                                            return r.sent(), [3, 5];
                                        case 3:
                                            return [4, eP(t)];
                                        case 4:
                                            r.sent(), r.label = 5;
                                        case 5:
                                            return eN(e), [3, 7];
                                        case 6:
                                            return r.sent(), an(!1, el, n), (0, k.fireEvent)(r2), [3, 7];
                                        case 7:
                                            return [2]
                                    }
                                })
                            })()
                        }, [Y, eU, eI, eN, eT, eP, el]),
                        eO = (0, g.useCallback)(function(e) {
                            return aX(function() {
                                var t;
                                return a$(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            return [4, ex.callWithRetry(function() {
                                                return r7(function() {
                                                    var t, n;
                                                    return r9(this, function(r) {
                                                        return t = {
                                                            withCredentials: !0,
                                                            url: "".concat(v.EnvironmentUrls.apiGatewayUrl, "/credit-balance/v1/next-purchasable-metadata")
                                                        }, n = {
                                                            address: e
                                                        }, [2, nn.httpService.post(t, n)]
                                                    })
                                                })()
                                            }, "GetNextPurchasable", "NewCreditConversionGetNextPurchasableFailedStatusCode")];
                                        case 1:
                                            if (200 !== (t = n.sent()).status) throw ar(!1), Error("Get next purchasable metadata failed with status ".concat(t.status));
                                            return ar(!0), [4, eM(t.data, e)];
                                        case 2:
                                            return n.sent(), [2]
                                    }
                                })
                            })()
                        }, [ex, eM]),
                        eD = (0, g.useCallback)(function(e) {
                            return aX(function() {
                                return a$(this, function(t) {
                                    switch (t.label) {
                                        case 0:
                                            h(!0), t.label = 1;
                                        case 1:
                                            return t.trys.push([1, 3, 4, 5]), [4, eO(e)];
                                        case 2:
                                            return t.sent(), [3, 5];
                                        case 3:
                                            return t.sent(), (0, k.fireEvent)(r2), [3, 5];
                                        case 4:
                                            return h(!1), [7];
                                        case 5:
                                            return [2]
                                    }
                                })
                            })()
                        }, [eO]);
                    (0, g.useEffect)(function() {
                        var e, t, n, r, a = null != (e = null == F ? void 0 : F.AvailableCreditBalance) ? e : 0,
                            o = null != (t = null == F ? void 0 : F.RobuxConversionAmount) ? t : 0;
                        n = !b && (!el || Z && !en), r = 0 === A ? a > 0 && o > 0 : a >= U, ei(n && r)
                    }, [en, Z, null == F ? void 0 : F.AvailableCreditBalance, null == F ? void 0 : F.RobuxConversionAmount, U, ew, b, A, el]);
                    var e_ = (0, g.useCallback)(function(e) {
                            ee(e)
                        }, []),
                        eR = (0, g.useCallback)(function(e) {
                            return aX(function() {
                                var t, n, a, o, i, s, l, u, c;
                                return a$(this, function(d) {
                                    switch (d.label) {
                                        case 0:
                                            if (eS(!0), !ed) return [2];
                                            d.label = 1;
                                        case 1:
                                            return d.trys.push([1, 8, , 10]), er(!0), [4, ex.callAddressUpdate(function() {
                                                return ac(e, ed)
                                            }, "UpdateAddressFailedStatusCode")];
                                        case 2:
                                            if (a = (n = (t = d.sent().data).providerPayload).AvailableCreditBalance, o = n.CurrencyCode, i = n.TaxAmount, s = n.CheckoutSessionToken, l = n.RobuxConversionAmount, u = n.TotalDue, c = t.taxRate, !(a < u)) return [3, 7];
                                            d.label = 3;
                                        case 3:
                                            return d.trys.push([3, 5, , 6]), [4, eO(e)];
                                        case 4:
                                        case 5:
                                            return d.sent(), [3, 6];
                                        case 6:
                                            return er(!1), [2];
                                        case 7:
                                            return ej({
                                                AvailableCreditBalance: a,
                                                CurrencyCode: o,
                                                TaxAmount: i,
                                                CheckoutSessionToken: s,
                                                RobuxConversionAmount: l
                                            }, !0), void 0 !== c && K(c), er(!1), [3, 10];
                                        case 8:
                                            var f;
                                            return [4, (f = d.sent(), aX(function() {
                                                return a$(this, function(t) {
                                                    switch (t.label) {
                                                        case 0:
                                                            if (!aL(f)) return [2, !1];
                                                            t.label = 1;
                                                        case 1:
                                                            return t.trys.push([1, 3, , 4]), (0, k.fireEvent)("CreditConversionSwitchedToProductPurchase"), [4, eO(e)];
                                                        case 2:
                                                            return t.sent(), [2, !0];
                                                        case 3:
                                                            return t.sent(), (0, k.fireEvent)("CreditConversionProductSwitchFailed"), [2, !1];
                                                        case 4:
                                                            return [2]
                                                    }
                                                })
                                            })())];
                                        case 9:
                                            if (d.sent()) return [2];
                                            return er(!1), w(!0), C(r(rJ) || "Something went wrong! Please try again later."), [3, 10];
                                        case 10:
                                            return [2]
                                    }
                                })
                            })()
                        }, [ed, ej, eO, eS, r, ex]),
                        eF = (0, g.useCallback)(function(e, t) {
                            return aX(function() {
                                return a$(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            if (!e) return [3, 4];
                                            if (0 === A) return [3, 2];
                                            return [4, eD()];
                                        case 1:
                                            return n.sent(), [3, 3];
                                        case 2:
                                            d(!1), n.label = 3;
                                        case 3:
                                            return N(P + 1), (0, k.fireEvent)("ProcessPaymentNextStep"), [3, 5];
                                        case 4:
                                            l(!1), d(!1), (0, k.fireEvent)("".concat("ProcessPaymentNotSuccessful").concat(t)), n.label = 5;
                                        case 5:
                                            return (0, k.fireEvent)("".concat("ProcessPaymentNotSuccessful").concat(t)), [2]
                                    }
                                })
                            })()
                        }, [eD, P, N, l, d, A]),
                        eB = (0, g.useCallback)(function() {
                            return aX(function() {
                                var e;
                                return a$(this, function(t) {
                                    switch (t.label) {
                                        case 0:
                                            h(!0), t.label = 1;
                                        case 1:
                                            if (t.trys.push([1, 6, 7, 8]), !eh) return [3, 3];
                                            return [4, aD(function() {
                                                return ad(A, "", "", eh, null == o ? void 0 : o.id, ed)
                                            }, {
                                                failedStatusPrefix: r3,
                                                onStatusError: function() {
                                                    eA(!1, A), h(!1)
                                                },
                                                onSuccess: function(e, t) {
                                                    return aX(function() {
                                                        var n, r;
                                                        return a$(this, function(a) {
                                                            switch (a.label) {
                                                                case 0:
                                                                    return r = null == (n = e.data) ? void 0 : n.providerPayload, eA(t, A), [4, eF(t, (null == r ? void 0 : r.ResponseMessage) || "")];
                                                                case 1:
                                                                    return a.sent(), [2]
                                                            }
                                                        })
                                                    })()
                                                }
                                            })];
                                        case 2:
                                            return t.sent(), [3, 5];
                                        case 3:
                                            return [4, aD(function() {
                                                return ae(A)
                                            }, {
                                                failedStatusPrefix: r3,
                                                onStatusError: function() {
                                                    eA(!1, A), h(!1)
                                                },
                                                onSuccess: function(e) {
                                                    return aX(function() {
                                                        var t, n, r, a, o, i;
                                                        return a$(this, function(s) {
                                                            switch (s.label) {
                                                                case 0:
                                                                    return o = null != (a = (null == (r = e.data) ? void 0 : r.isSuccess) && (null == r || null == (t = r.providerPayload) ? void 0 : t.IsSuccessful)) && a, eA(null != (i = null == r ? void 0 : r.isSuccess) && i, A), [4, eF(o, (null == r || null == (n = r.providerPayload) ? void 0 : n.ResponseMessage) || "")];
                                                                case 1:
                                                                    return s.sent(), [2]
                                                            }
                                                        })
                                                    })()
                                                }
                                            })];
                                        case 4:
                                            t.sent(), t.label = 5;
                                        case 5:
                                            return [3, 8];
                                        case 6:
                                            if (aN(e = t.sent())) return eC(aU({
                                                translate: r,
                                                violation: e.data.failureReason,
                                                timeoutDurationInMinutes: e.data.expirationTimeInMinutes
                                            }), !1), (0, k.fireEvent)(r6), [2];
                                            return eE(), (0, k.fireEvent)(r4), [3, 8];
                                        case 7:
                                            return h(!1), [7];
                                        case 8:
                                            return [2]
                                    }
                                })
                            })()
                        }, [eh, A, o, ed, eA, eC, eE, r, eF]),
                        eL = (0, g.useCallback)(function(e) {
                            N(0), w(!1), C(""), eD(e), N(1)
                        }, [eD]),
                        eG = (0, g.useCallback)(function() {
                            l(!1), (0, k.fireEvent)("ProductPurchaseCancelClicked")
                        }, []),
                        eH = (0, g.useCallback)(function() {
                            d(!1), (0, k.fireEvent)("ConversionCancelClicked")
                        }, []),
                        eW = (0, g.useCallback)(function(e) {
                            w(!0), C(e)
                        }, []),
                        eY = (0, g.useCallback)(function(e) {
                            q(void 0 !== e)
                        }, []),
                        eq = (0, g.useMemo)(function() {
                            var e, t, n;
                            return {
                                isPurchaseModalOpen: s,
                                isConvertModalOpen: c,
                                isLoading: p,
                                isError: b,
                                errorMessage: x,
                                productId: A,
                                numberOfPurchase: P,
                                creditBalance: null != (e = null == F ? void 0 : F.AvailableCreditBalance) ? e : 0,
                                currencyCode: null != (t = null == F ? void 0 : F.CurrencyCode) ? t : "",
                                convertedRobuxAmount: null != (n = null == F ? void 0 : F.RobuxConversionAmount) ? n : 0,
                                totalBalanceDue: U,
                                robuxAmountInPackage: D,
                                tax: (null == F ? void 0 : F.CurrencyCode) ? aM(X, F.CurrencyCode, G) : void 0,
                                taxRate: $,
                                taxLoading: en,
                                taxDisplay: Z,
                                isTaxFlowEnabled: el,
                                checkoutSessionId: ed,
                                prefilledAddress: em,
                                isPurchasable: eo,
                                startCreditConversionFlow: eL,
                                closePurchaseModal: eG,
                                closeConvertModal: eH,
                                onUpdatedAddress: eR,
                                onTaxDisplayChange: e_,
                                processPaymentAction: eB,
                                updateError: eW,
                                setSavedUserAddress: eY
                            }
                        }, [s, c, p, b, x, A, P, F, G, X, $, en, Z, U, D, el, ed, em, eo, eL, eG, eH, eR, e_, eB, eW, eY]);
                    return (0, y.jsx)(aK.Provider, {
                        value: eq,
                        children: t
                    })
                },
                aZ = function() {
                    var e = (0, g.useContext)(aK);
                    if (void 0 === e) throw Error("useHeuristicCreditConversionData must be used within a HeuristicCreditConversionContext");
                    return e
                },
                a0 = n(942),
                a1 = n.n(a0),
                a2 = ["JPY"],
                a3 = "PriceTag",
                a4 = {
                    NUMBER_FORMAT_LOCALE_EXCEPTION: "".concat(a3, "NumberFormatLocaleException"),
                    ARABIC_LOCALE_TRIGGERED: "".concat(a3, "ArabicLocale")
                };

            function a6(e) {
                var t = function(e) {
                        var t = e.amount,
                            n = e.currencyCode,
                            r = e.tagClassName,
                            a = Math.abs(t),
                            o = "".concat(a).concat(n),
                            i = a1()("price-tag", r);
                        try {
                            var s, l = (s = Intl.NumberFormat().resolvedOptions().locale).startsWith("ar-") ? ((0, k.fireEvent)(a4.ARABIC_LOCALE_TRIGGERED), s.replace("ar-", "en-")) : s,
                                u = {
                                    style: "currency",
                                    currency: n,
                                    notation: "standard"
                                };
                            a >= 1e4 && !a2.includes(n) && (u.minimumFractionDigits = 0, u.maximumFractionDigits = 2, u.maximumSignificantDigits = 21, u.notation = "compact"), i.split(" ").includes("navbar-compact") && (u.maximumSignificantDigits = 4), o = Intl.NumberFormat(l, u).format(a)
                        } catch (e) {
                            (0, k.fireEvent)(a4.NUMBER_FORMAT_LOCALE_EXCEPTION)
                        }
                        return {
                            formattedAmount: o,
                            isNegative: t < 0,
                            className: i
                        }
                    }({
                        amount: e.amount,
                        currencyCode: e.currencyCode,
                        tagClassName: e.tagClassName
                    }),
                    n = t.formattedAmount,
                    r = t.isNegative,
                    a = t.className;
                return (0, y.jsxs)("div", {
                    className: "d-flex-inline gap-1 justify-content-start align-items-center",
                    children: [r && (0, y.jsx)("span", {
                        className: a,
                        children: "-"
                    }), (0, y.jsx)("span", {
                        className: a,
                        children: n
                    })]
                })
            }
            a6.propTypes = {
                amount: q().number.isRequired,
                currencyCode: q().string.isRequired
            };
            var a5 = {
                    common: ["Feature.Payment"],
                    feature: "Feature.BillingAddress"
                },
                a8 = window.Roblox.ui,
                a7 = {
                    countryLabel: {
                        key: "Label.BillingAddress.Country",
                        default: "Country"
                    },
                    PostalCode: {
                        key: "Label.BillingAddress.PostalCode",
                        default: "Postal Code"
                    },
                    cityLabel: {
                        key: "Label.BillingAddress.City",
                        default: "City"
                    },
                    stateLabel: {
                        key: "Label.BillingAddress.State",
                        default: "State"
                    },
                    provinceLabel: {
                        key: "Label.BillingAddress.Province",
                        default: "Province"
                    },
                    saveBillingInformationLabel: {
                        key: "Button.BillingAddress.SaveBillingInformation",
                        default: "Save Billing Information"
                    },
                    billingInformationHeader: {
                        key: "Header.BillingAddress.BillingInformation",
                        default: "Billing Information"
                    },
                    approximateUserLocationDescription: {
                        key: "Description.BillingAddress.ApproximateUserLocation",
                        default: "Please enter your address so we can accurately calculate tax. In some cases we may use your device’s location."
                    },
                    saveButton: {
                        key: "Button.BillingAddress.Save",
                        default: "Save"
                    },
                    cancelButton: {
                        key: "Button.BillingAddress.Cancel",
                        default: "Cancel"
                    }
                },
                a9 = {
                    US: [{
                        label: "Alabama",
                        value: "Alabama"
                    }, {
                        label: "Alaska",
                        value: "Alaska"
                    }, {
                        label: "Arizona",
                        value: "Arizona"
                    }, {
                        label: "Arkansas",
                        value: "Arkansas"
                    }, {
                        label: "California",
                        value: "California"
                    }, {
                        label: "Colorado",
                        value: "Colorado"
                    }, {
                        label: "Connecticut",
                        value: "Connecticut"
                    }, {
                        label: "Delaware",
                        value: "Delaware"
                    }, {
                        label: "District of Columbia",
                        value: "District of Columbia"
                    }, {
                        label: "Florida",
                        value: "Florida"
                    }, {
                        label: "Georgia",
                        value: "Georgia"
                    }, {
                        label: "Hawaii",
                        value: "Hawaii"
                    }, {
                        label: "Idaho",
                        value: "Idaho"
                    }, {
                        label: "Illinois",
                        value: "Illinois"
                    }, {
                        label: "Indiana",
                        value: "Indiana"
                    }, {
                        label: "Iowa",
                        value: "Iowa"
                    }, {
                        label: "Kansas",
                        value: "Kansas"
                    }, {
                        label: "Kentucky",
                        value: "Kentucky"
                    }, {
                        label: "Louisiana",
                        value: "Louisiana"
                    }, {
                        label: "Maine",
                        value: "Maine"
                    }, {
                        label: "Maryland",
                        value: "Maryland"
                    }, {
                        label: "Massachusetts",
                        value: "Massachusetts"
                    }, {
                        label: "Michigan",
                        value: "Michigan"
                    }, {
                        label: "Minnesota",
                        value: "Minnesota"
                    }, {
                        label: "Mississippi",
                        value: "Mississippi"
                    }, {
                        label: "Missouri",
                        value: "Missouri"
                    }, {
                        label: "Montana",
                        value: "Montana"
                    }, {
                        label: "Nebraska",
                        value: "Nebraska"
                    }, {
                        label: "Nevada",
                        value: "Nevada"
                    }, {
                        label: "New Hampshire",
                        value: "New Hampshire"
                    }, {
                        label: "New Jersey",
                        value: "New Jersey"
                    }, {
                        label: "New Mexico",
                        value: "New Mexico"
                    }, {
                        label: "New York",
                        value: "New York"
                    }, {
                        label: "North Carolina",
                        value: "North Carolina"
                    }, {
                        label: "North Dakota",
                        value: "North Dakota"
                    }, {
                        label: "Ohio",
                        value: "Ohio"
                    }, {
                        label: "Oklahoma",
                        value: "Oklahoma"
                    }, {
                        label: "Oregon",
                        value: "Oregon"
                    }, {
                        label: "Pennsylvania",
                        value: "Pennsylvania"
                    }, {
                        label: "Rhode Island",
                        value: "Rhode Island"
                    }, {
                        label: "South Carolina",
                        value: "South Carolina"
                    }, {
                        label: "South Dakota",
                        value: "South Dakota"
                    }, {
                        label: "Tennessee",
                        value: "Tennessee"
                    }, {
                        label: "Texas",
                        value: "Texas"
                    }, {
                        label: "Utah",
                        value: "Utah"
                    }, {
                        label: "Vermont",
                        value: "Vermont"
                    }, {
                        label: "Virginia",
                        value: "Virginia"
                    }, {
                        label: "Washington",
                        value: "Washington"
                    }, {
                        label: "West Virginia",
                        value: "West Virginia"
                    }, {
                        label: "Wisconsin",
                        value: "Wisconsin"
                    }, {
                        label: "Wyoming",
                        value: "Wyoming"
                    }, {
                        label: "Guam",
                        value: "Guam"
                    }, {
                        label: "Puerto Rico",
                        value: "Puerto Rico"
                    }],
                    CA: [{
                        label: "Alberta",
                        value: "Alberta"
                    }, {
                        label: "British Columbia",
                        value: "British Columbia"
                    }, {
                        label: "Manitoba",
                        value: "Manitoba"
                    }, {
                        label: "New Brunswick",
                        value: "New Brunswick"
                    }, {
                        label: "Newfoundland and Labrador",
                        value: "Newfoundland and Labrador"
                    }, {
                        label: "Nova Scotia",
                        value: "Nova Scotia"
                    }, {
                        label: "Ontario",
                        value: "Ontario"
                    }, {
                        label: "Prince Edward Island",
                        value: "Prince Edward Island"
                    }, {
                        label: "Quebec",
                        value: "Quebec"
                    }, {
                        label: "Saskatchewan",
                        value: "Saskatchewan"
                    }, {
                        label: "Northwest Territories",
                        value: "Northwest Territories"
                    }, {
                        label: "Nunavut",
                        value: "Nunavut"
                    }, {
                        label: "Yukon",
                        value: "Yukon"
                    }]
                },
                oe = [{
                    code: "US",
                    name: "United States",
                    displayName: "United States"
                }, {
                    code: "CA",
                    name: "Canada",
                    displayName: "Canada"
                }];

            function ot(e, t, n, r, a, o, i) {
                try {
                    var s = e[o](i),
                        l = s.value
                } catch (e) {
                    n(e);
                    return
                }
                s.done ? t(l) : Promise.resolve(l).then(r, a)
            }

            function on(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, a) {
                        var o = e.apply(t, n);

                        function i(e) {
                            ot(o, r, a, i, s, "next", e)
                        }

                        function s(e) {
                            ot(o, r, a, i, s, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function or(e, t) {
                var n, r, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return i.next = s(0), i.throw = s(1), i.return = s(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                    return this
                }), i;

                function s(s) {
                    return function(l) {
                        var u = [s, l];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, u[0] && (o = 0)), o;) try {
                            if (n = 1, r && (a = 2 & u[0] ? r.return : u[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, u[1])).done) return a;
                            switch (r = 0, a && (u = [2 & u[0], a.value]), u[0]) {
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
                                    o.label++, r = u[1], u = [0];
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
                            u = t.call(e, o)
                        } catch (e) {
                            u = [6, e], r = 0
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
            var oa = a7.saveBillingInformationLabel,
                oo = oa.key,
                oi = oa.default,
                os = (0, x.withTranslations)(function(e) {
                    var t = e.disabled,
                        n = e.saveBillingInfo,
                        r = e.setSaveBillingInfo,
                        a = e.translate,
                        o = (0, g.useCallback)(function(e) {
                            r(e.target.checked)
                        }, [r]);
                    return (0, y.jsxs)("div", {
                        className: "save-billing-info-checkbox",
                        children: [(0, y.jsx)("input", {
                            id: "save-billing-info",
                            type: "checkbox",
                            className: "larger-checkbox",
                            onChange: o,
                            checked: n,
                            disabled: void 0 !== t && t,
                            tabIndex: 0
                        }), (0, y.jsx)("label", {
                            htmlFor: "save-billing-info",
                            className: "form-label",
                            children: a(oo) || oi
                        })]
                    })
                }, a5);

            function ol(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function ou(e, t, n, r, a, o, i) {
                try {
                    var s = e[o](i),
                        l = s.value
                } catch (e) {
                    n(e);
                    return
                }
                s.done ? t(l) : Promise.resolve(l).then(r, a)
            }

            function oc(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            s = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            s = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (s) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return ol(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return ol(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var od = a7.countryLabel,
                of = od.key,
                op = od.default,
                oh = a7.PostalCode,
                oy = oh.key,
                ov = oh.default,
                om = a7.cityLabel,
                ob = om.key,
                og = om.default,
                ow = a7.stateLabel,
                oS = ow.key,
                ox = ow.default,
                oC = a7.provinceLabel,
                oE = oC.key,
                oA = oC.default,
                oj = a7.saveButton,
                ok = oj.key,
                oT = oj.default,
                oP = a7.cancelButton,
                oN = oP.key,
                oI = oP.default,
                oU = a7.approximateUserLocationDescription,
                oM = oU.key,
                oO = oU.default,
                oD = function() {
                    return (0, y.jsx)("span", {
                        className: "required-indicator",
                        children: "*"
                    })
                },
                o_ = (0, x.withTranslations)(function(e) {
                    var t, n, r, a, o, i, s = e.initialAddress,
                        l = e.hasSavedAddress,
                        u = e.processAddressSave,
                        c = e.onUpdateAddress,
                        d = e.onUpdateSuccess,
                        f = e.onTaxDisplayChange,
                        p = e.hideSaveSection,
                        h = e.triggeringContext,
                        m = e.translate,
                        b = oc((0, g.useState)(!l), 2),
                        w = b[0],
                        x = b[1],
                        C = oc((0, g.useState)(null != (t = null == s ? void 0 : s.country) ? t : "US"), 2),
                        E = C[0],
                        A = C[1],
                        j = oc((0, g.useState)(null != (n = null == s ? void 0 : s.state) ? n : ""), 2),
                        k = j[0],
                        T = j[1],
                        P = oc((0, g.useState)(null != (r = null == s ? void 0 : s.postalCode) ? r : ""), 2),
                        N = P[0],
                        I = P[1],
                        U = oc((0, g.useState)(null != (a = null == s ? void 0 : s.postalCode) ? a : ""), 2),
                        M = U[0],
                        O = U[1],
                        D = oc((0, g.useState)(null != (o = null == s ? void 0 : s.city) ? o : ""), 2),
                        _ = D[0],
                        R = D[1],
                        F = oc((0, g.useState)(null != (i = null == s ? void 0 : s.city) ? i : ""), 2),
                        B = F[0],
                        L = F[1],
                        G = (0, g.useRef)(!0),
                        H = m(oy) || ov,
                        W = m(ob) || og,
                        Y = oe.map(function(e) {
                            return {
                                value: e.code,
                                label: e.displayName
                            }
                        }),
                        q = "US" === E,
                        V = oc((0, g.useState)(!0), 2),
                        X = V[0],
                        z = V[1],
                        Q = oc((0, g.useState)(!1), 2),
                        $ = Q[0],
                        K = Q[1],
                        J = oc((0, g.useState)(l ? s : void 0), 2),
                        Z = J[0],
                        ee = J[1];
                    (0, g.useEffect)(function() {
                        rH.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(h, !0, rH.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_BALANCE_BIILLING_ADDRESS_FORM, rH.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN, void 0, {
                            initial_address_available: s ? "true" : "false",
                            has_saved_address: l ? "true" : "false"
                        })
                    }, [l, s, h]);
                    var et = (0, g.useCallback)(function() {
                            x(!0)
                        }, []),
                        en = (0, g.useCallback)(function() {
                            var e;
                            return (e = function() {
                                return function(e, t) {
                                    var n, r, a, o = {
                                            label: 0,
                                            sent: function() {
                                                if (1 & a[0]) throw a[1];
                                                return a[1]
                                            },
                                            trys: [],
                                            ops: []
                                        },
                                        i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                    return i.next = s(0), i.throw = s(1), i.return = s(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                                        return this
                                    }), i;

                                    function s(s) {
                                        return function(l) {
                                            var u = [s, l];
                                            if (n) throw TypeError("Generator is already executing.");
                                            for (; i && (i = 0, u[0] && (o = 0)), o;) try {
                                                if (n = 1, r && (a = 2 & u[0] ? r.return : u[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, u[1])).done) return a;
                                                switch (r = 0, a && (u = [2 & u[0], a.value]), u[0]) {
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
                                                        o.label++, r = u[1], u = [0];
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
                                                u = t.call(e, o)
                                            } catch (e) {
                                                u = [6, e], r = 0
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
                                }(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            var t;
                                            return e.trys.push([0, 2, , 3]), [4, (t = {
                                                country: E,
                                                state: k,
                                                city: _,
                                                postalCode: M
                                            }, on(function() {
                                                var e, n;
                                                return or(this, function(r) {
                                                    return e = {
                                                        withCredentials: !0,
                                                        url: "".concat(v.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/user-settings-address")
                                                    }, n = {
                                                        address: t
                                                    }, [2, nn.httpService.patch(e, n)]
                                                })
                                            })())];
                                        case 1:
                                            return 200 === e.sent().status && (null == d || d(), ee({
                                                country: E,
                                                state: k,
                                                city: _,
                                                postalCode: M
                                            })), [3, 3];
                                        case 2:
                                            return e.sent(), [3, 3];
                                        case 3:
                                            return [2]
                                    }
                                })
                            }, function() {
                                var t = this,
                                    n = arguments;
                                return new Promise(function(r, a) {
                                    var o = e.apply(t, n);

                                    function i(e) {
                                        ou(o, r, a, i, s, "next", e)
                                    }

                                    function s(e) {
                                        ou(o, r, a, i, s, "throw", e)
                                    }
                                    i(void 0)
                                })
                            })()
                        }, [E, k, _, M, d]);
                    (0, g.useEffect)(function() {
                        u && (p || l || X) && (p || !l) && en()
                    }, [u, E, k, _, M, d, X, en, p, l]);
                    var er = (0, g.useCallback)(function(e) {
                            return !!(e && e.length >= 2)
                        }, []),
                        ea = (0, g.useCallback)(function(e) {
                            return !!e
                        }, []),
                        eo = (0, g.useCallback)(function(e) {
                            return !!(e && 5 === e.length)
                        }, []),
                        ei = (0, g.useCallback)(function() {
                            switch (E) {
                                case "US":
                                    return er(_) && ea(k) && eo(M);
                                case "CA":
                                    return er(_) && ea(k);
                                default:
                                    return !1
                            }
                        }, [E, k, _, M, er, ea, eo]);
                    (0, g.useEffect)(function() {
                        !p && l ? null == f || f(ei() && !w) : null == f || f(ei())
                    }, [p, l, w, ei, f]), (0, g.useEffect)(function() {
                        G.current && (G.current = !1, l) || ei() && (null == c || c({
                            country: E,
                            state: k,
                            city: _,
                            postalCode: M
                        }))
                    }, [ei, E, k, _, M, c]);
                    var es = (0, g.useCallback)(function() {
                            switch (E) {
                                case "US":
                                    return er(B) && ea(k) && eo(N);
                                case "CA":
                                    return er(B) && ea(k);
                                default:
                                    return !1
                            }
                        }, [E, k, B, N, er, ea, eo]),
                        el = (0, g.useCallback)(function() {
                            return E === (null == Z ? void 0 : Z.country) && k === (null == Z ? void 0 : Z.state) && _ === (null == Z ? void 0 : Z.city) && M === (null == Z ? void 0 : Z.postalCode)
                        }, [E, k, _, M, Z]);
                    (0, g.useEffect)(function() {
                        el() || K(es())
                    }, [es, el]);
                    var eu = (0, g.useCallback)(function() {
                            O(N)
                        }, [N]),
                        ec = (0, g.useCallback)(function() {
                            R(B)
                        }, [B]),
                        ed = (0, g.useCallback)(function(e) {
                            A(e.target.value), T(""), R(""), L(""), O(""), I("")
                        }, []),
                        ef = (0, g.useCallback)(function(e) {
                            var t;
                            if (!(null != (t = a9[E]) ? t : []).some(function(t) {
                                    return t.value === e.target.value
                                })) {
                                T(""), O(""), I("");
                                return
                            }
                            T(e.target.value), O(""), I("")
                        }, [E]),
                        ep = (0, g.useMemo)(function() {
                            return (0, y.jsxs)("div", {
                                className: "country-field",
                                children: [(0, y.jsxs)("label", {
                                    htmlFor: "country-select",
                                    className: "form-label",
                                    children: [m(of) || op, " ", (0, y.jsx)(oD, {})]
                                }), (0, y.jsx)(S.NativeDropdown, {
                                    id: "country-select",
                                    selectionItems: Y,
                                    selectedItemvalue: E,
                                    onChange: ed,
                                    className: "country-select-container"
                                })]
                            })
                        }, [Y, ed, E, m]),
                        eh = (0, g.useMemo)(function() {
                            return (0, y.jsxs)("div", {
                                className: "city-field",
                                children: [(0, y.jsxs)("label", {
                                    htmlFor: "city-input",
                                    className: "form-label",
                                    children: [W, " ", (0, y.jsx)(oD, {})]
                                }), (0, y.jsx)("div", {
                                    className: "city-input-container",
                                    children: (0, y.jsx)("input", {
                                        id: "city-input",
                                        type: "text",
                                        value: B,
                                        onChange: function(e) {
                                            L(e.target.value)
                                        },
                                        onBlur: ec,
                                        placeholder: W
                                    })
                                })]
                            })
                        }, [W, B, ec]),
                        ey = (0, g.useMemo)(function() {
                            var e, t = "US" === E ? "Select State" : "Select Province";
                            return (0, y.jsxs)("div", {
                                className: "state-field",
                                children: [(0, y.jsxs)("label", {
                                    htmlFor: "state-select",
                                    className: "form-label",
                                    children: ["US" === E ? m(oS) || ox : m(oE) || oA, " ", (0, y.jsx)(oD, {})]
                                }), (0, y.jsx)(S.NativeDropdown, {
                                    id: "state-select",
                                    placeholder: t,
                                    selectionItems: null != (e = a9[E]) ? e : [],
                                    selectedItemvalue: k || t,
                                    onChange: ef,
                                    className: "state-select-container"
                                })]
                            })
                        }, [ef, k, E, m]),
                        ev = (0, g.useMemo)(function() {
                            return (0, y.jsxs)("div", {
                                className: "zip-code-field",
                                children: [(0, y.jsxs)("label", {
                                    htmlFor: "zip-code-input",
                                    className: "form-label",
                                    children: [H, " ", (0, y.jsx)(oD, {})]
                                }), (0, y.jsx)("div", {
                                    className: "postal-code-input-container",
                                    children: (0, y.jsx)("input", {
                                        id: "postal-code-input",
                                        type: "text",
                                        inputMode: "US" === E ? "numeric" : "text",
                                        pattern: "US" === E ? "[0-9]*" : void 0,
                                        value: N,
                                        onBlur: eu,
                                        onChange: function(e) {
                                            var t = e.target.value;
                                            /^\d*$/.test(t) && (I(t), "US" === E && 5 === t.length && O(t))
                                        },
                                        placeholder: H,
                                        maxLength: "US" === E ? 5 : void 0
                                    })
                                })]
                            })
                        }, [H, E, N, eu]),
                        em = (0, g.useCallback)(function() {
                            return q ? (0, y.jsxs)("div", {
                                className: "form-group billing-address-form-group",
                                children: [(0, y.jsxs)("div", {
                                    className: "billing-fields-row",
                                    children: [ep, eh]
                                }), (0, y.jsxs)("div", {
                                    className: "billing-fields-row",
                                    children: [ey, ev]
                                })]
                            }) : (0, y.jsxs)("div", {
                                className: "form-group billing-address-form-group",
                                children: [(0, y.jsx)("div", {
                                    className: "billing-fields-row",
                                    children: ep
                                }), (0, y.jsxs)("div", {
                                    className: "billing-fields-row",
                                    children: [eh, ey]
                                })]
                            })
                        }, [eh, ep, q, ey, ev]),
                        eb = (0, g.useCallback)(function() {
                            en(), x(!1), K(!1)
                        }, [en, x, K]),
                        eg = (0, g.useCallback)(function() {
                            var e, t, n, r, a, o;
                            O(null != (e = null == Z ? void 0 : Z.postalCode) ? e : ""), I(null != (t = null == Z ? void 0 : Z.postalCode) ? t : ""), R(null != (n = null == Z ? void 0 : Z.city) ? n : ""), L(null != (r = null == Z ? void 0 : Z.city) ? r : ""), T(null != (a = null == Z ? void 0 : Z.state) ? a : ""), A(null != (o = null == Z ? void 0 : Z.country) ? o : "US"), x(!1)
                        }, [Z, O, R, T, A]),
                        ew = (0, g.useMemo)(function() {
                            return l ? (0, y.jsxs)("div", {
                                className: "billing-address-buttons",
                                children: [(0, y.jsx)(S.Button, {
                                    variant: S.Button.variants.growth,
                                    size: S.Button.sizes.medium,
                                    width: S.Button.widths.default,
                                    onClick: eb,
                                    className: "mr-2 save-address-button",
                                    isDisabled: !$,
                                    children: m(ok) || oT
                                }), (0, y.jsx)(S.Button, {
                                    variant: S.Button.variants.control,
                                    size: S.Button.sizes.medium,
                                    width: S.Button.widths.default,
                                    onClick: eg,
                                    className: "ml-2 cancel-address-button",
                                    children: m(oN) || oI
                                })]
                            }) : (0, y.jsx)(os, {
                                saveBillingInfo: X,
                                setSaveBillingInfo: z
                            })
                        }, [eg, eb, $, X, l, m]);
                    if (!w) {
                        var eS = q ? "".concat(null == Z ? void 0 : Z.city, ", ").concat(null == Z ? void 0 : Z.state, ", ").concat(null == Z ? void 0 : Z.postalCode, ", ").concat(null == Z ? void 0 : Z.country) : "".concat(null == Z ? void 0 : Z.city, ", ").concat(null == Z ? void 0 : Z.state, ", ").concat(null == Z ? void 0 : Z.country);
                        return (0, y.jsxs)("div", {
                            className: "formatted-address-container",
                            children: [(0, y.jsx)("p", {
                                className: "formatted-address-label",
                                children: eS
                            }), (0, y.jsx)("button", {
                                type: "button",
                                onClick: et,
                                "aria-label": "Edit billing address",
                                className: "edit-address-button",
                                children: (0, y.jsx)(a8.EditIcon, {})
                            })]
                        })
                    }
                    return (0, y.jsxs)("div", {
                        className: "billing-address-form-container",
                        children: [!p && (0, y.jsx)("p", {
                            className: "approximate-user-location-label",
                            children: m(oM) || oO
                        }), em(), !p && ew]
                    })
                }, a5);

            function oR(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function oF(e, t, n, r, a, o, i) {
                try {
                    var s = e[o](i),
                        l = s.value
                } catch (e) {
                    n(e);
                    return
                }
                s.done ? t(l) : Promise.resolve(l).then(r, a)
            }

            function oB(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, a) {
                        var o = e.apply(t, n);

                        function i(e) {
                            oF(o, r, a, i, s, "next", e)
                        }

                        function s(e) {
                            oF(o, r, a, i, s, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function oL(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            s = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            s = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (s) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return oR(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return oR(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oG(e, t) {
                var n, r, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return i.next = s(0), i.throw = s(1), i.return = s(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                    return this
                }), i;

                function s(s) {
                    return function(l) {
                        var u = [s, l];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, u[0] && (o = 0)), o;) try {
                            if (n = 1, r && (a = 2 & u[0] ? r.return : u[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, u[1])).done) return a;
                            switch (r = 0, a && (u = [2 & u[0], a.value]), u[0]) {
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
                                    o.label++, r = u[1], u = [0];
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
                            u = t.call(e, o)
                        } catch (e) {
                            u = [6, e], r = 0
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
            var oH = a7.billingInformationHeader,
                oW = oH.key,
                oY = oH.default,
                oq = (0, x.withTranslations)(function(e) {
                    var t, n = e.processAddressSave,
                        r = e.onUpdateAddress,
                        a = e.prefilledAddress,
                        o = e.onUpdateSuccess,
                        i = e.onTaxDisplayChange,
                        s = e.hideSaveSection,
                        l = e.onSavedAddressLoaded,
                        u = e.triggeringContext,
                        c = e.translate,
                        d = oL((0, g.useState)(!0), 2),
                        f = d[0],
                        p = d[1],
                        h = oL((0, g.useState)(), 2),
                        m = h[0],
                        b = h[1],
                        w = oL((0, g.useState)(), 2),
                        S = w[0],
                        x = w[1];
                    return ((0, g.useEffect)(function() {
                        if (a) {
                            null == l || l(void 0), p(!1);
                            return
                        }
                        oB(function() {
                            return oG(this, function(e) {
                                switch (e.label) {
                                    case 0:
                                        return [4, Promise.all([oB(function() {
                                            var e, t, n, r;
                                            return oG(this, function(a) {
                                                switch (a.label) {
                                                    case 0:
                                                        return a.trys.push([0, 2, , 3]), [4, on(function() {
                                                            var e, t;
                                                            return or(this, function(n) {
                                                                return e = {
                                                                    withCredentials: !0,
                                                                    url: "".concat(v.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/user-settings-address")
                                                                }, t = {}, [2, nn.httpService.get(e, t)]
                                                            })
                                                        })()];
                                                    case 1:
                                                        return t = (e = a.sent().data.address).country, n = e.state, b(r = {
                                                            country: t,
                                                            state: n,
                                                            city: e.city,
                                                            postalCode: e.postalCode
                                                        }), null == l || l(r), [3, 3];
                                                    case 2:
                                                        return a.sent(), null == l || l(void 0), [3, 3];
                                                    case 3:
                                                        return [2]
                                                }
                                            })
                                        })(), oB(function() {
                                            var e, t, n, r, a, o;
                                            return oG(this, function(i) {
                                                switch (i.label) {
                                                    case 0:
                                                        return i.trys.push([0, 2, , 3]), [4, on(function() {
                                                            var e, t;
                                                            return or(this, function(n) {
                                                                return e = {
                                                                    withCredentials: !0,
                                                                    url: "".concat(v.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/user-location/approximate-location")
                                                                }, t = {}, [2, nn.httpService.get(e, t)]
                                                            })
                                                        })()];
                                                    case 1:
                                                        return n = (t = i.sent().data).countryCode, r = t.subdivision, a = t.city, o = t.postalCode, rH.paymentFlowAnalyticsService.sendUserPurchaseStatusEvent(u, rH.paymentFlowAnalyticsService.ENUM_PURCHASE_STATUS.PASSED_GET_APPROXIMATE_USER_LOCATION, void 0, rH.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_BALANCE_BIILLING_ADDRESS_FORM), oe.some(function(e) {
                                                            return e.code === n
                                                        }) && (null == (e = a9[n]) ? void 0 : e.some(function(e) {
                                                            return e.value === r
                                                        })) && x({
                                                            country: n,
                                                            state: r,
                                                            city: a,
                                                            postalCode: o
                                                        }), [3, 3];
                                                    case 2:
                                                        return i.sent(), rH.paymentFlowAnalyticsService.sendUserPurchaseStatusEvent(u, rH.paymentFlowAnalyticsService.ENUM_PURCHASE_STATUS.FAILED_GET_APPROXIMATE_USER_LOCATION, void 0, rH.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_BALANCE_BIILLING_ADDRESS_FORM), [3, 3];
                                                    case 3:
                                                        return [2]
                                                }
                                            })
                                        })()])];
                                    case 1:
                                        return e.sent(), p(!1), [2]
                                }
                            })
                        })()
                    }, [a, l]), f) ? null : (0, y.jsxs)("div", {
                        className: "billing-info-container",
                        children: [(0, y.jsx)("h5", {
                            className: "billing-info-title",
                            children: c(oW) || oY
                        }), (0, y.jsx)(o_, {
                            processAddressSave: n,
                            initialAddress: null != (t = null != a ? a : m) ? t : S,
                            hasSavedAddress: void 0 !== m,
                            onUpdateAddress: r,
                            onUpdateSuccess: o,
                            onTaxDisplayChange: i,
                            hideSaveSection: s,
                            triggeringContext: u
                        })]
                    })
                }, a5);
            n(841);
            var oV = function(e) {
                    var t = e.processAddressSave,
                        n = e.onUpdateAddress,
                        r = e.prefilledAddress,
                        a = e.onUpdateSuccess,
                        o = e.onTaxDisplayChange,
                        i = e.hideSaveSection,
                        s = e.onSavedAddressLoaded,
                        l = e.triggeringContext;
                    return (0, y.jsx)(oq, {
                        processAddressSave: t,
                        onUpdateAddress: n,
                        prefilledAddress: r,
                        onUpdateSuccess: a,
                        onTaxDisplayChange: o,
                        hideSaveSection: i,
                        onSavedAddressLoaded: s,
                        triggeringContext: l
                    })
                },
                oX = {
                    common: ["CommonUI.Controls", "CommonUI.Features", "IAPExperience.PurchaseError", "Feature.NotApproved", "Feature.PaymentRedeem"],
                    feature: "Purchasing.RedeemGameCard"
                },
                oz = function(e) {
                    var t = e.translate,
                        n = e.tax,
                        r = e.taxRate,
                        a = e.taxDisplay,
                        o = e.visible,
                        i = e.isLoading,
                        s = void 0 !== i && i,
                        l = (0, g.useMemo)(function() {
                            return t("Label.Tax") || "Tax"
                        }, [t]),
                        u = (0, g.useMemo)(function() {
                            return s || null == r || !a ? null : (100 * r).toFixed(2)
                        }, [r, s, a]),
                        c = (0, g.useMemo)(function() {
                            return t("Description.TaxInfoTooltip") || "Tax is determined by billing information"
                        }, [t]);
                    return void 0 === o || o ? (0, y.jsxs)("div", {
                        className: "tax-line d-flex justify-content-between row-pad",
                        children: [(0, y.jsxs)("span", {
                            className: "bold",
                            children: [l, u && " (".concat(u, "%)"), (0, y.jsx)(S.Tooltip, {
                                id: "tax-info-tooltip",
                                placement: "right",
                                content: c,
                                children: (0, y.jsx)(a8.InfoOutlinedIcon, {
                                    className: "tax-info-icon"
                                })
                            })]
                        }), a ? s ? (0, y.jsxs)("div", {
                            className: "calculating-tax",
                            children: [(0, y.jsx)("span", {
                                className: "loading-spinner"
                            }), (0, y.jsx)("span", {
                                children: t("Label.CalculatingTax") || "Calculating tax..."
                            })]
                        }) : n ? (0, y.jsx)(a6, {
                            amount: -1 * (n.amount || 0),
                            currencyCode: n.currencyCode
                        }) : (0, y.jsx)("span", {
                            className: "text-placeholder",
                            children: "—"
                        }) : (0, y.jsx)("span", {
                            className: "text-placeholder",
                            children: "—"
                        })]
                    }) : null
                };

            function oQ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function o$(e, t, n, r, a, o, i) {
                try {
                    var s = e[o](i),
                        l = s.value
                } catch (e) {
                    n(e);
                    return
                }
                s.done ? t(l) : Promise.resolve(l).then(r, a)
            }

            function oK(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            s = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            s = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (s) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return oQ(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return oQ(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            n(47);
            var oJ = oK((0, S.createModal)(), 2),
                oZ = oJ[0],
                o0 = oJ[1],
                o1 = (0, x.withTranslations)(function(e) {
                    var t = e.translate,
                        n = aZ(),
                        r = n.isPurchaseModalOpen,
                        a = n.isLoading,
                        o = n.creditBalance,
                        i = n.totalBalanceDue,
                        s = n.currencyCode,
                        l = n.numberOfPurchase,
                        u = n.robuxAmountInPackage,
                        c = n.tax,
                        d = n.taxRate,
                        f = n.taxLoading,
                        p = n.taxDisplay,
                        h = n.isTaxFlowEnabled,
                        v = n.onUpdatedAddress,
                        m = n.onTaxDisplayChange,
                        b = n.processPaymentAction,
                        x = n.closePurchaseModal,
                        C = n.prefilledAddress,
                        E = n.isPurchasable,
                        A = n.setSavedUserAddress,
                        j = oK((0, g.useState)(!1), 2),
                        k = j[0],
                        T = j[1];
                    (0, g.useEffect)(function() {
                        r ? (o0.open(), rH.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(rH.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_REDEEM_PAGE, !0, h ? rH.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_PACKAGE_PURCHASE_MODAL_WITH_TAX : rH.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_PACKAGE_PURCHASE_MODAL_WITHOUT_TAX, rH.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN)) : o0.close()
                    }, [r, h]);
                    var P = (0, g.useCallback)(function(e) {
                            var t;
                            return (t = function() {
                                var t;
                                return function(e, t) {
                                    var n, r, a, o = {
                                            label: 0,
                                            sent: function() {
                                                if (1 & a[0]) throw a[1];
                                                return a[1]
                                            },
                                            trys: [],
                                            ops: []
                                        },
                                        i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                    return i.next = s(0), i.throw = s(1), i.return = s(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                                        return this
                                    }), i;

                                    function s(s) {
                                        return function(l) {
                                            var u = [s, l];
                                            if (n) throw TypeError("Generator is already executing.");
                                            for (; i && (i = 0, u[0] && (o = 0)), o;) try {
                                                if (n = 1, r && (a = 2 & u[0] ? r.return : u[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, u[1])).done) return a;
                                                switch (r = 0, a && (u = [2 & u[0], a.value]), u[0]) {
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
                                                        o.label++, r = u[1], u = [0];
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
                                                u = t.call(e, o)
                                            } catch (e) {
                                                u = [6, e], r = 0
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
                                }(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            return n.trys.push([0, 2, , 3]), [4, v(e)];
                                        case 1:
                                            return n.sent(), aa(!0, h, !0), [3, 3];
                                        case 2:
                                            return t = n.sent(), aa(!1, h, !0), aH("CreditConversion", "UpdateAddress", t), [3, 3];
                                        case 3:
                                            return [2]
                                    }
                                })
                            }, function() {
                                var e = this,
                                    n = arguments;
                                return new Promise(function(r, a) {
                                    var o = t.apply(e, n);

                                    function i(e) {
                                        o$(o, r, a, i, s, "next", e)
                                    }

                                    function s(e) {
                                        o$(o, r, a, i, s, "throw", e)
                                    }
                                    i(void 0)
                                })
                            })()
                        }, [v, h]),
                        N = (0, g.useCallback)(function() {
                            h && T(!0), b().catch(function(e) {
                                ao(!1, h, !0), aH("CreditConversion", "ProcessPaymentAction", e)
                            }), ao(!0, h, !0)
                        }, [h, b]);
                    return (0, y.jsx)(oZ, {
                        id: "purchase-product-modal",
                        title: t("Heading.BuyRobuxWithCredit"),
                        onClose: x,
                        onNeutral: x,
                        body: (0, y.jsxs)("div", {
                            className: "d-flex flex-direction-column",
                            children: [h && (0, y.jsxs)(w().Fragment, {
                                children: [(0, y.jsx)("div", {
                                    className: "order-summary bold",
                                    children: t(rZ) || "Order Summary"
                                }), (0, y.jsxs)("div", {
                                    className: "purchase-banner",
                                    children: [(0, y.jsx)("span", {
                                        className: "purchase-text",
                                        children: t(r0) || "Robux purchased"
                                    }), (0, y.jsxs)("span", {
                                        className: "robux-amount-container",
                                        children: [(0, y.jsxs)("div", {
                                            className: "robux-amount",
                                            children: [(0, y.jsxs)("span", {
                                                className: "low-cogs-robux-amount-inline",
                                                children: [(0, y.jsx)("span", {
                                                    className: "icon-robux-28x28",
                                                    style: {
                                                        transform: "translateY(-2px)"
                                                    }
                                                }), u]
                                            }), (0, y.jsxs)("span", {
                                                className: "high-cogs-robux-amount-inline",
                                                children: [(0, y.jsx)("span", {
                                                    className: "icon-robux-gray-16x16",
                                                    style: {
                                                        transform: "translateY(-2px)"
                                                    }
                                                }), r5[u]]
                                            })]
                                        }), (0, y.jsx)("div", {
                                            className: "robux-amount-text",
                                            children: t(r1) || "Includes up to 25% more Robux"
                                        })]
                                    })]
                                })]
                            }, "purchase-banner-sections"), (0, y.jsxs)("div", {
                                className: "available-credit d-flex justify-content-between row-pad",
                                children: [(0, y.jsx)("span", {
                                    className: "bold",
                                    children: t("Label.AvailableCredit") || "Available Credit"
                                }), (0, y.jsx)(a6, {
                                    amount: o,
                                    currencyCode: s
                                })]
                            }), (0, y.jsxs)("div", {
                                className: "balance-due d-flex justify-content-between row-pad",
                                children: [(0, y.jsx)("span", {
                                    className: "bold",
                                    children: (t("Label.BalanceDue") || "Balance Due:").replace(":", "")
                                }), (0, y.jsx)(a6, {
                                    amount: -1 * i,
                                    currencyCode: s
                                })]
                            }), (0, y.jsx)(oz, {
                                visible: h,
                                translate: t,
                                tax: c,
                                taxRate: d,
                                isLoading: f,
                                taxDisplay: p
                            }), (0, y.jsx)("div", {
                                className: "rbx-divider"
                            }), (0, y.jsxs)("div", {
                                className: "remaining-balance d-flex justify-content-between row-pad",
                                children: [(0, y.jsx)("span", {
                                    className: "bold",
                                    children: t(rW) || "Remaining Balance"
                                }), (0, y.jsx)(a6, {
                                    amount: o - i - (p && c ? c.amount : 0),
                                    currencyCode: s
                                })]
                            }), !h && (0, y.jsxs)("div", {
                                className: "purchase-prompt",
                                children: [1 === l ? t("Message.Step1LargestAvailablePackageYouCanBuy") || "Largest package you can buy with your available credit:" : t("Message.Step2NextLargestPackage"), (0, y.jsxs)("span", {
                                    className: "robux-amount-inline",
                                    children: [" ", (0, y.jsx)("span", {
                                        className: "icon-robux-16x16",
                                        style: {
                                            transform: "translateY(-2px)"
                                        }
                                    }), u]
                                }), ". ", t(rX)]
                            }), h && (0, y.jsx)(w().Fragment, {
                                children: (0, y.jsx)("div", {
                                    className: "billing-info-section",
                                    children: (0, y.jsx)(oV, {
                                        processAddressSave: k,
                                        onUpdateAddress: P,
                                        onTaxDisplayChange: m,
                                        prefilledAddress: C,
                                        onSavedAddressLoaded: A,
                                        triggeringContext: rH.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_REDEEM_PAGE
                                    })
                                })
                            }, "tax-flow-sections"), (0, y.jsx)("div", {
                                className: "modal-footer-buttons d-flex justify-content-between mt-4",
                                children: a ? (0, y.jsxs)("button", {
                                    type: "button",
                                    className: "btn-growth-md btn-full-width mr-2 loading-button-container",
                                    disabled: !0,
                                    children: [(0, y.jsx)("span", {
                                        className: "loading-button-text",
                                        children: t(rq)
                                    }), (0, y.jsx)("span", {
                                        className: "spinner spinner-sm loading-button-spinner"
                                    })]
                                }) : (0, y.jsx)(S.Button, {
                                    variant: S.Button.variants.growth,
                                    size: S.Button.sizes.medium,
                                    width: S.Button.widths.full,
                                    onClick: N,
                                    isDisabled: !E,
                                    className: "mr-2",
                                    children: t(rq)
                                })
                            })]
                        }),
                        actionButtonShow: !1
                    })
                }, oX);

            function o2(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function o3(e, t, n, r, a, o, i) {
                try {
                    var s = e[o](i),
                        l = s.value
                } catch (e) {
                    n(e);
                    return
                }
                s.done ? t(l) : Promise.resolve(l).then(r, a)
            }

            function o4(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            s = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            s = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (s) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return o2(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return o2(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var o6 = o4((0, S.createModal)(), 2),
                o5 = o6[0],
                o8 = o6[1],
                o7 = (0, x.withTranslations)(function(e) {
                    var t = e.translate,
                        n = aZ(),
                        r = n.isConvertModalOpen,
                        a = n.isLoading,
                        o = n.isPurchasable,
                        i = n.creditBalance,
                        s = n.currencyCode,
                        l = n.convertedRobuxAmount,
                        u = n.numberOfPurchase,
                        c = n.tax,
                        d = n.taxRate,
                        f = n.taxLoading,
                        p = n.taxDisplay,
                        h = n.isTaxFlowEnabled,
                        v = n.onUpdatedAddress,
                        m = n.onTaxDisplayChange,
                        b = n.processPaymentAction,
                        x = n.closeConvertModal,
                        C = n.prefilledAddress,
                        E = n.setSavedUserAddress,
                        A = o4((0, g.useState)(!1), 2),
                        j = A[0],
                        k = A[1];
                    (0, g.useEffect)(function() {
                        r ? (o8.open(), rH.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(rH.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_REDEEM_PAGE, !0, h ? rH.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_CONVERSION_MODAL_WITH_TAX : rH.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_CONVERSION_MODAL_WITHOUT_TAX, rH.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN)) : o8.close()
                    }, [r, h]);
                    var T = (0, g.useCallback)(function() {
                            window.dispatchEvent(new CustomEvent("price-tag:render", {
                                detail: {
                                    targetSelector: ".fiat-price-tag"
                                }
                            }))
                        }, []),
                        P = (0, g.useCallback)(function(e) {
                            var t;
                            return (t = function() {
                                var t;
                                return function(e, t) {
                                    var n, r, a, o = {
                                            label: 0,
                                            sent: function() {
                                                if (1 & a[0]) throw a[1];
                                                return a[1]
                                            },
                                            trys: [],
                                            ops: []
                                        },
                                        i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                    return i.next = s(0), i.throw = s(1), i.return = s(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                                        return this
                                    }), i;

                                    function s(s) {
                                        return function(l) {
                                            var u = [s, l];
                                            if (n) throw TypeError("Generator is already executing.");
                                            for (; i && (i = 0, u[0] && (o = 0)), o;) try {
                                                if (n = 1, r && (a = 2 & u[0] ? r.return : u[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, u[1])).done) return a;
                                                switch (r = 0, a && (u = [2 & u[0], a.value]), u[0]) {
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
                                                        o.label++, r = u[1], u = [0];
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
                                                u = t.call(e, o)
                                            } catch (e) {
                                                u = [6, e], r = 0
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
                                }(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            return n.trys.push([0, 2, , 3]), [4, v(e)];
                                        case 1:
                                            return n.sent(), aa(!0, h, !1), [3, 3];
                                        case 2:
                                            return t = n.sent(), aa(!1, h, !1), aH("CreditConversion", "UpdateAddress", t), [3, 3];
                                        case 3:
                                            return [2]
                                    }
                                })
                            }, function() {
                                var e = this,
                                    n = arguments;
                                return new Promise(function(r, a) {
                                    var o = t.apply(e, n);

                                    function i(e) {
                                        o3(o, r, a, i, s, "next", e)
                                    }

                                    function s(e) {
                                        o3(o, r, a, i, s, "throw", e)
                                    }
                                    i(void 0)
                                })
                            })()
                        }, [h, v]),
                        N = (0, g.useCallback)(function() {
                            h && k(!0), b().catch(function(e) {
                                ao(!1, h, !1), aH("CreditConversion", "ProcessPaymentAction", e)
                            }), ao(!0, h, !1)
                        }, [h, b]);
                    return (0, y.jsx)(o5, {
                        id: "convert-credit-modal",
                        title: t("Label.ConvertCreditSuccess"),
                        onClose: x,
                        onNeutral: x,
                        body: [h && (0, y.jsxs)(w().Fragment, {
                            children: [(0, y.jsx)("div", {
                                className: "order-summary bold",
                                children: t(rZ) || "Order Summary"
                            }, "order-summary"), (0, y.jsxs)("div", {
                                className: "purchase-banner",
                                children: [(0, y.jsx)("span", {
                                    className: "purchase-text",
                                    children: t(r0) || "Robux purchased"
                                }), (0, y.jsxs)("span", {
                                    className: "robux-amount-container",
                                    children: [(0, y.jsxs)("div", {
                                        className: "robux-amount",
                                        children: [(0, y.jsxs)("span", {
                                            className: "low-cogs-robux-amount-inline",
                                            children: [(0, y.jsx)("span", {
                                                className: "icon-robux-28x28",
                                                style: {
                                                    transform: "translateY(-2px)"
                                                }
                                            }), l]
                                        }), l > 5 && (0, y.jsxs)("span", {
                                            className: "high-cogs-robux-amount-inline",
                                            children: [(0, y.jsx)("span", {
                                                className: "icon-robux-gray-16x16",
                                                style: {
                                                    transform: "translateY(-2px)"
                                                }
                                            }), Math.floor(l / 1.25)]
                                        })]
                                    }), (0, y.jsx)("div", {
                                        className: "robux-amount-text",
                                        children: t(r1) || "Includes up to 25% more Robux"
                                    })]
                                })]
                            }, "purchase-banner"), (0, y.jsxs)("div", {
                                className: "available-credit d-flex justify-content-between row-pad",
                                children: [(0, y.jsx)("span", {
                                    className: "bold",
                                    children: t("Label.AvailableCredit") || "Available Credit"
                                }), (0, y.jsx)(a6, {
                                    amount: i,
                                    currencyCode: s
                                })]
                            }, "available-credit"), (0, y.jsxs)("div", {
                                className: "convertible-credit d-flex justify-content-between row-pad",
                                children: [(0, y.jsx)("span", {
                                    className: "bold",
                                    children: t(rY) || "Convertible Credit"
                                }), (0, y.jsx)(a6, {
                                    amount: i - (p && c ? c.amount : 0),
                                    currencyCode: s
                                })]
                            }, "convertible-credit"), (0, y.jsx)(oz, {
                                translate: t,
                                tax: c,
                                taxRate: d,
                                isLoading: f,
                                taxDisplay: p
                            }, "tax-line"), (0, y.jsx)("div", {
                                className: "rbx-divider"
                            }, "divider"), (0, y.jsxs)("div", {
                                className: "remaining-balance d-flex justify-content-between row-pad",
                                children: [(0, y.jsx)("span", {
                                    className: "bold",
                                    children: t(rW) || "Remaining Balance"
                                }), (0, y.jsx)(a6, {
                                    amount: 0,
                                    currencyCode: s
                                })]
                            }), (0, y.jsx)("div", {
                                className: "billing-info-section",
                                children: (0, y.jsx)(oV, {
                                    processAddressSave: j,
                                    onUpdateAddress: P,
                                    onTaxDisplayChange: m,
                                    prefilledAddress: C,
                                    onSavedAddressLoaded: E,
                                    triggeringContext: rH.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_REDEEM_PAGE
                                })
                            }, "billing-info-section")]
                        }, "tax-flow-sections"), !h && (0, y.jsx)("div", {
                            className: "conversion-message",
                            style: {
                                marginTop: "12px"
                            },
                            dangerouslySetInnerHTML: {
                                __html: 1 === u ? t("Message.ConvertCreditToRobux25PercentMore", {
                                    robuxAmount: "".concat('<span class="icon-robux-16x16" style="transform: translateY(-2px)"></span>').concat(l),
                                    boldStart: "<b>",
                                    boldEnd: "</b>"
                                }) : "".concat(t("Message.Step3ConvertRobux", {
                                    remainingCreditBalance: "<span class='fiat-price-tag ml-1' data-amount=".concat(i, " data-currency-code=").concat(s, "></span>"),
                                    lineBreaker: "<br /><br />",
                                    robuxConversionAmount: '<span class="icon-robux-16x16" style="transform: translateY(-2px)"></span><b>'.concat(l, "</b>")
                                }), " ").concat(t(rX))
                            },
                            ref: T
                        }, "conversion-message-".concat(l, "-").concat(i)), (0, y.jsx)("div", {
                            className: "modal-footer-buttons d-flex justify-content-between mt-4",
                            children: a ? (0, y.jsxs)("button", {
                                type: "button",
                                className: "btn-growth-md btn-full-width mr-2 loading-button-container",
                                disabled: !0,
                                children: [(0, y.jsx)("span", {
                                    className: "loading-button-text",
                                    children: t(rV)
                                }), (0, y.jsx)("span", {
                                    className: "spinner spinner-sm loading-button-spinner"
                                })]
                            }) : (0, y.jsx)(S.Button, {
                                variant: S.Button.variants.growth,
                                size: S.Button.sizes.medium,
                                width: S.Button.widths.full,
                                onClick: N,
                                isDisabled: !o,
                                className: "mr-2",
                                children: t(rV)
                            })
                        }, "modal-footer-buttons")],
                        actionButtonShow: !1,
                        size: "md"
                    })
                }, oX),
                o9 = function(e) {
                    var t = e.systemFeedbackService,
                        n = e.translate,
                        r = e.onSuccess,
                        a = (0, g.useRef)(null),
                        o = function() {
                            var e = aZ().startCreditConversionFlow;
                            return (0, g.useEffect)(function() {
                                a.current = e
                            }, [e]), (0, y.jsxs)(g.Fragment, {
                                children: [(0, y.jsx)(o1, {}), (0, y.jsx)(o7, {})]
                            })
                        };
                    return [function() {
                        return (0, y.jsx)(aJ, {
                            systemFeedbackService: t,
                            translate: n,
                            onSuccess: r,
                            children: (0, y.jsx)(o, {})
                        })
                    }, function(e) {
                        var t;
                        null == (t = a.current) || t.call(a, e)
                    }]
                };

            function ie(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function it(e, t, n, r, a, o, i) {
                try {
                    var s = e[o](i),
                        l = s.value
                } catch (e) {
                    n(e);
                    return
                }
                s.done ? t(l) : Promise.resolve(l).then(r, a)
            }

            function ir(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, a) {
                        var o = e.apply(t, n);

                        function i(e) {
                            it(o, r, a, i, s, "next", e)
                        }

                        function s(e) {
                            it(o, r, a, i, s, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function ia(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            s = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            s = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (s) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return ie(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return ie(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function io(e, t) {
                var n, r, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return i.next = s(0), i.throw = s(1), i.return = s(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                    return this
                }), i;

                function s(s) {
                    return function(l) {
                        var u = [s, l];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, u[0] && (o = 0)), o;) try {
                            if (n = 1, r && (a = 2 & u[0] ? r.return : u[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, u[1])).done) return a;
                            switch (r = 0, a && (u = [2 & u[0], a.value]), u[0]) {
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
                                    o.label++, r = u[1], u = [0];
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
                            u = t.call(e, o)
                        } catch (e) {
                            u = [6, e], r = 0
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
            n(227);
            var ii = function() {
                var e = ia((0, S.createModal)(), 2),
                    t = e[0],
                    n = e[1],
                    r = (0, g.useRef)(null),
                    a = (0, g.useRef)(null);
                return [function(e) {
                    var o = e.translate,
                        i = e.systemFeedbackService,
                        s = e.onSuccess,
                        l = aT(),
                        u = ia((0, g.useState)(!1), 2),
                        c = u[0],
                        d = u[1],
                        f = ia((0, g.useState)(void 0), 2),
                        p = f[0],
                        h = f[1],
                        v = ia((0, g.useState)(void 0), 2),
                        m = v[0],
                        b = v[1],
                        x = ia((0, g.useState)(void 0), 2),
                        C = x[0],
                        E = x[1],
                        A = ia((0, g.useState)(0), 2),
                        j = A[0],
                        T = A[1],
                        P = ia((0, g.useState)(void 0), 2),
                        N = P[0],
                        I = P[1],
                        U = ia((0, g.useState)(0), 2),
                        M = U[0],
                        O = U[1],
                        D = ia((0, g.useState)(""), 2),
                        _ = D[0],
                        R = D[1],
                        F = ia((0, g.useState)(!1), 2),
                        B = F[0],
                        L = F[1],
                        G = ia((0, g.useState)(void 0), 2),
                        H = G[0],
                        W = G[1],
                        Y = ia((0, g.useState)(!1), 2),
                        q = Y[0],
                        V = Y[1],
                        X = ia((0, g.useState)(!1), 2),
                        z = (X[0], X[1]),
                        Q = ia((0, g.useState)(!1), 2),
                        $ = Q[0],
                        K = Q[1],
                        J = ia((0, g.useState)(!1), 2),
                        Z = J[0],
                        ee = J[1],
                        et = ia((0, g.useState)(!1), 2),
                        en = et[0],
                        er = et[1],
                        ea = ia((0, g.useState)(!1), 2),
                        eo = ea[0],
                        ei = ea[1],
                        es = ia((0, g.useState)(void 0), 2),
                        el = es[0],
                        eu = es[1],
                        ec = (0, g.useCallback)(function(e) {
                            return ir(function() {
                                var t, n, r, a, o;
                                return io(this, function(i) {
                                    switch (i.label) {
                                        case 0:
                                            return i.trys.push([0, 2, 3, 4]), V(!0), [4, at(l, e)];
                                        case 1:
                                            return (t = i.sent().data).isSuccess && (d(t.robloxManagedTax), h(t.checkoutSessionId), b(t.providerPayload.CheckoutSessionToken), z(t.hasBillingAddress), void 0 !== t.taxRate && E(t.taxRate), T(null != (n = t.providerPayload.RobuxConversionAmount) ? n : 0), I(null != (r = t.providerPayload.StrikethroughRobuxConversionAmount) ? r : void 0), O(null != (a = t.providerPayload.AvailableCreditBalance) ? a : 0), R(null != (o = t.providerPayload.CurrencyCode) ? o : ""), W(aM(t.providerPayload.TaxAmount, t.providerPayload.CurrencyCode, t.hasBillingAddress || void 0 !== e)), an(!0, t.robloxManagedTax, !1, null !== t.taxRate)), [3, 4];
                                        case 2:
                                            return i.sent(), ei(!0), [3, 4];
                                        case 3:
                                            return V(!1), [7];
                                        case 4:
                                            return [2]
                                    }
                                })
                            })()
                        }, [l]);
                    (0, g.useEffect)(function() {
                        r.current = eu, a.current = ec
                    }, [ec]), (0, g.useEffect)(function() {
                        var e = M > 0 && j > 0;
                        er(!eo && (!c || B && !q) && e)
                    }, [M, j, c, B, q, eo]);
                    var ed = (0, g.useCallback)(function(e) {
                            return ir(function() {
                                var t, n, r, a, o, i, s, l, u;
                                return io(this, function(d) {
                                    switch (d.label) {
                                        case 0:
                                            if (d.trys.push([0, 2, , 3]), !p) return [2];
                                            return V(!0), [4, ac(e, p)];
                                        case 1:
                                            return r = (n = (t = d.sent().data).providerPayload).AvailableCreditBalance, a = n.CurrencyCode, o = n.TaxAmount, i = n.CheckoutSessionToken, s = n.RobuxConversionAmount, l = n.StrikethroughRobuxConversionAmount, n.TotalDue, u = t.taxRate, T(null != s ? s : 0), I(null != l ? l : void 0), O(r), R(a), W(aM(o, a, !0)), E(u), b(i), V(!1), aa(!0, c, !1), [3, 3];
                                        case 2:
                                            return d.sent(), ei(!0), aa(!1, c, !1), [3, 3];
                                        case 3:
                                            return [2]
                                    }
                                })
                            })()
                        }, [p, c]),
                        ef = (0, g.useCallback)(function(e) {
                            L(e)
                        }, []),
                        ep = (0, g.useCallback)(function(e, t) {
                            var n = !t;
                            e ? (i.success(o(n ? r$ : rz)), s && s(n)) : i.warning(o(n ? rK : rQ) || o(rJ) || "Something went wrong! Please try again later.", 200, 5e3)
                        }, [i, o, s]),
                        eh = (0, g.useCallback)(function(e, t) {
                            i.warning(e, 200, 5e3), n.close(), t && (window.location.href = nn.urlService.getAbsoluteUrl("/upgrades/robux"))
                        }, [i]),
                        ey = (0, g.useCallback)(function() {
                            return ir(function() {
                                var e;
                                return io(this, function(t) {
                                    switch (t.label) {
                                        case 0:
                                            c && K(!0), ee(!0), t.label = 1;
                                        case 1:
                                            if (t.trys.push([1, 6, 7, 8]), !m) return [3, 3];
                                            return [4, aD(function() {
                                                return ad(0, "", "", m, null == l ? void 0 : l.id, p)
                                            }, {
                                                failedStatusPrefix: r3,
                                                onStatusError: function() {
                                                    ep(!1, 0), ee(!1)
                                                },
                                                onSuccess: function(e, t) {
                                                    ep(t, 0), n.close()
                                                }
                                            })];
                                        case 2:
                                            return t.sent(), [3, 5];
                                        case 3:
                                            return [4, aD(function() {
                                                return ae(0)
                                            }, {
                                                failedStatusPrefix: r3,
                                                onStatusError: function() {
                                                    ep(!1, 0), ee(!1)
                                                },
                                                onSuccess: function(e) {
                                                    var t, r = e.data;
                                                    ep(null != (t = null == r ? void 0 : r.isSuccess) && t, 0), n.close()
                                                }
                                            })];
                                        case 4:
                                            t.sent(), t.label = 5;
                                        case 5:
                                            return ao(!0, c, !1), [3, 8];
                                        case 6:
                                            if (e = t.sent(), ao(!1, c, !1), aN(e)) return eh(aU({
                                                translate: o,
                                                violation: e.data.failureReason,
                                                timeoutDurationInMinutes: e.data.expirationTimeInMinutes
                                            }), !1), (0, k.fireEvent)(r6), [2];
                                            return eh(o(rJ) || "Something went wrong! Please try again later.", !0), (0, k.fireEvent)(r4), [3, 8];
                                        case 7:
                                            return ee(!1), [7];
                                        case 8:
                                            return [2]
                                    }
                                })
                            })()
                        }, [c, m, null == l ? void 0 : l.id, p, ep, eh, o]);
                    return (0, y.jsx)(t, {
                        id: "convert-credit-modal",
                        title: o("Heading.ConvertCreditToRobux") || "Convert credit to Robux",
                        onNeutral: function() {
                            return n.close()
                        },
                        body: [(0, y.jsx)("div", {
                            className: "order-summary bold",
                            children: o(rZ) || "Order Summary"
                        }, "order-summary"), (0, y.jsxs)("div", {
                            className: "purchase-banner",
                            children: [(0, y.jsx)("span", {
                                className: "purchase-text",
                                children: o(r0) || "Robux purchased"
                            }), (0, y.jsx)("span", {
                                className: "robux-amount-container",
                                children: (0, y.jsxs)("div", {
                                    className: "robux-amount",
                                    children: [(0, y.jsxs)("span", {
                                        className: "low-cogs-robux-amount-inline",
                                        children: [(0, y.jsx)("span", {
                                            className: "icon-robux-28x28",
                                            style: {
                                                transform: "translateY(-2px)"
                                            }
                                        }), j]
                                    }), j > (null != N ? N : Math.floor(j / 1.25)) && (0, y.jsxs)("span", {
                                        className: "high-cogs-robux-amount-inline",
                                        children: [(0, y.jsx)("span", {
                                            className: "icon-robux-gray-16x16",
                                            style: {
                                                transform: "translateY(-2px)"
                                            }
                                        }), null != N ? N : Math.floor(j / 1.25)]
                                    })]
                                })
                            })]
                        }, "purchase-banner"), (0, y.jsxs)("div", {
                            className: "available-credit d-flex justify-content-between row-pad",
                            children: [(0, y.jsx)("span", {
                                className: "bold",
                                children: o("Label.AvailableCredit") || "Available Credit"
                            }), (0, y.jsx)(a6, {
                                amount: M,
                                currencyCode: _
                            })]
                        }, "available-credit"), c && (0, y.jsxs)(w().Fragment, {
                            children: [(0, y.jsx)(oz, {
                                translate: o,
                                tax: H,
                                taxRate: C,
                                isLoading: q,
                                taxDisplay: B
                            }, "tax-line"), (0, y.jsxs)("div", {
                                className: "convertible-credit d-flex justify-content-between row-pad",
                                children: [(0, y.jsx)("span", {
                                    className: "bold",
                                    children: o(rY) || "Convertible Credit"
                                }), (0, y.jsx)(a6, {
                                    amount: M - (B && H ? H.amount : 0),
                                    currencyCode: _
                                })]
                            }, "convertible-credit")]
                        }, "tax-flow-sections"), (0, y.jsx)("div", {
                            className: "rbx-divider"
                        }, "divider"), (0, y.jsxs)("div", {
                            className: "remaining-balance d-flex justify-content-between row-pad",
                            children: [(0, y.jsx)("span", {
                                className: "bold",
                                children: o(rW) || "Remaining balance"
                            }), (0, y.jsx)(a6, {
                                amount: 0,
                                currencyCode: _
                            })]
                        }, "remaining-balance"), c && (0, y.jsx)("div", {
                            className: "billing-info-section",
                            children: (0, y.jsx)(oV, {
                                processAddressSave: $,
                                onUpdateAddress: ed,
                                prefilledAddress: el,
                                onTaxDisplayChange: ef,
                                triggeringContext: rH.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_REDEEM_PAGE
                            })
                        }, "billing-info-section"), (0, y.jsx)("div", {
                            className: "modal-footer-buttons d-flex justify-content-between mt-4",
                            children: Z ? (0, y.jsxs)("button", {
                                type: "button",
                                className: "btn-growth-md btn-full-width mr-2 loading-button-container",
                                disabled: !0,
                                children: [(0, y.jsx)("span", {
                                    className: "loading-button-text",
                                    children: o(rV)
                                }), (0, y.jsx)("span", {
                                    className: "spinner spinner-sm loading-button-spinner"
                                })]
                            }) : (0, y.jsx)(S.Button, {
                                variant: S.Button.variants.growth,
                                size: S.Button.sizes.medium,
                                width: S.Button.widths.full,
                                onClick: ey,
                                isDisabled: !en,
                                className: "mr-2",
                                children: o(rV)
                            })
                        }, "modal-footer-buttons")],
                        actionButtonShow: !1,
                        size: "md",
                        closeable: !0
                    })
                }, {
                    open: function(e) {
                        r.current && r.current(e), a.current && a.current(e), n.open()
                    },
                    close: function() {
                        return n.close()
                    }
                }]
            };

            function is(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function il(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            s = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            s = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (s) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return is(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return is(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var iu = function(e) {
                var t = e.translate,
                    n = e.systemFeedbackService,
                    r = e.showConvertButton,
                    a = (e.robuxAmount, e.balance),
                    o = e.currencyCode,
                    i = e.isConvertAllFlowEnabled,
                    s = e.setZeroBalance,
                    l = t("Heading.SavedCreditCard.RobloxCredit"),
                    u = t("Label.SavedCreditCard.Balance"),
                    c = il(o9({
                        systemFeedbackService: n,
                        translate: t,
                        onSuccess: function(e) {
                            s()
                        }
                    }), 2),
                    d = c[0],
                    f = c[1],
                    p = il(ii(), 2),
                    h = p[0],
                    v = p[1];
                return (0, y.jsxs)("div", {
                    className: "roblox-credit-container",
                    children: [(0, y.jsx)(d, {}), i && (0, y.jsx)(h, {
                        systemFeedbackService: n,
                        translate: t,
                        onSuccess: function() {
                            s()
                        }
                    }), (0, y.jsxs)("div", {
                        className: "roblox-credit-header-container",
                        children: [(0, y.jsx)("span", {
                            className: "payment-method-image cardIcon ".concat(no("robloxCredit"))
                        }), (0, y.jsx)("div", {
                            className: "roblox-credit-header text-emphasis",
                            children: l
                        })]
                    }), (0, y.jsxs)("div", {
                        className: "roblox-credit-balance",
                        children: [(0, y.jsx)("div", {
                            className: "balance-prefix",
                            children: u
                        }), (0, y.jsx)(a6, {
                            amount: a,
                            currencyCode: o
                        })]
                    }), r ? (0, y.jsx)(S.Button, {
                        className: "convert-to-robux-button btn-secondary-md",
                        onClick: function() {
                            (0, k.fireEvent)(nv), i ? v.open() : f()
                        },
                        children: t("Heading.SavedCreditCard.ConvertToRobux")
                    }) : null]
                })
            };

            function ic(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function id(e, t, n, r, a, o, i) {
                try {
                    var s = e[o](i),
                        l = s.value
                } catch (e) {
                    n(e);
                    return
                }
                s.done ? t(l) : Promise.resolve(l).then(r, a)
            }

            function ip(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            s = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            s = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (s) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return ic(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return ic(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var ih = function(e) {
                var t = e.translate,
                    n = e.systemFeedbackService,
                    r = ip((0, g.useState)(!0), 2),
                    a = r[0],
                    o = r[1],
                    i = ip((0, g.useState)(!1), 2),
                    s = i[0],
                    l = i[1],
                    u = ip((0, g.useState)(!1), 2),
                    c = u[0],
                    d = u[1],
                    f = ip((0, g.useState)(0), 2),
                    p = f[0],
                    h = f[1],
                    v = ip((0, g.useState)(0), 2),
                    m = v[0],
                    b = v[1],
                    w = ip((0, g.useState)("USD"), 2),
                    S = w[0],
                    x = w[1],
                    C = ip((0, g.useState)(!1), 2),
                    E = C[0],
                    A = C[1],
                    j = t("Heading.SavedCreditCard.OtherPaymentMethods"),
                    k = function() {
                        var e;
                        return (e = function() {
                            var e, t, r, a, i, s, u;
                            return function(e, t) {
                                var n, r, a, o = {
                                        label: 0,
                                        sent: function() {
                                            if (1 & a[0]) throw a[1];
                                            return a[1]
                                        },
                                        trys: [],
                                        ops: []
                                    },
                                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                return i.next = s(0), i.throw = s(1), i.return = s(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                                    return this
                                }), i;

                                function s(s) {
                                    return function(l) {
                                        var u = [s, l];
                                        if (n) throw TypeError("Generator is already executing.");
                                        for (; i && (i = 0, u[0] && (o = 0)), o;) try {
                                            if (n = 1, r && (a = 2 & u[0] ? r.return : u[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, u[1])).done) return a;
                                            switch (r = 0, a && (u = [2 & u[0], a.value]), u[0]) {
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
                                                    o.label++, r = u[1], u = [0];
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
                                            u = t.call(e, o)
                                        } catch (e) {
                                            u = [6, e], r = 0
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
                            }(this, function(c) {
                                switch (c.label) {
                                    case 0:
                                        o(!0), c.label = 1;
                                    case 1:
                                        return c.trys.push([1, 3, , 4]), [4, re()];
                                    case 2:
                                        return t = (e = ip.apply(void 0, [c.sent(), 6]))[0], r = e[1], a = e[2], i = e[3], s = e[4], u = e[5], l(t), d(r), h(a), b(i), x(s), A(u), [3, 4];
                                    case 3:
                                        return c.sent(), n.warning(rp), [3, 4];
                                    case 4:
                                        return o(!1), [2]
                                }
                            })
                        }, function() {
                            var t = this,
                                n = arguments;
                            return new Promise(function(r, a) {
                                var o = e.apply(t, n);

                                function i(e) {
                                    id(o, r, a, i, s, "next", e)
                                }

                                function s(e) {
                                    id(o, r, a, i, s, "throw", e)
                                }
                                i(void 0)
                            })
                        })()
                    };
                return ((0, g.useEffect)(function() {
                    k()
                }, [m]), s) ? (0, y.jsx)("div", {
                    className: "other-payment-methods-container"
                }) : (0, y.jsxs)("div", {
                    className: "other-payment-methods-container",
                    children: [(0, y.jsx)("h5", {
                        children: j
                    }), a ? (0, y.jsx)("span", {
                        className: "spinner spinner-default"
                    }) : (0, y.jsx)(iu, {
                        translate: t,
                        systemFeedbackService: n,
                        showConvertButton: c,
                        robuxAmount: p,
                        balance: m,
                        currencyCode: S,
                        isConvertAllFlowEnabled: E,
                        setZeroBalance: function() {
                            return b(0)
                        }
                    })]
                })
            };

            function iy(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function iv(e, t, n, r, a, o, i) {
                try {
                    var s = e[o](i),
                        l = s.value
                } catch (e) {
                    n(e);
                    return
                }
                s.done ? t(l) : Promise.resolve(l).then(r, a)
            }

            function im(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, a) {
                        var o = e.apply(t, n);

                        function i(e) {
                            iv(o, r, a, i, s, "next", e)
                        }

                        function s(e) {
                            iv(o, r, a, i, s, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function ib(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            s = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            s = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (s) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return iy(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return iy(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ig(e, t) {
                var n, r, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return i.next = s(0), i.throw = s(1), i.return = s(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                    return this
                }), i;

                function s(s) {
                    return function(l) {
                        var u = [s, l];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, u[0] && (o = 0)), o;) try {
                            if (n = 1, r && (a = 2 & u[0] ? r.return : u[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, u[1])).done) return a;
                            switch (r = 0, a && (u = [2 & u[0], a.value]), u[0]) {
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
                                    o.label++, r = u[1], u = [0];
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
                            u = t.call(e, o)
                        } catch (e) {
                            u = [6, e], r = 0
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
            var iw = ib((c = (u = rL((0, S.createModal)(), 2))[0], [function(e) {
                    var t, n = e.translate,
                        r = e.systemFeedbackService,
                        a = e.onSuccess,
                        o = e.stripeEmail,
                        i = e.robloxEmail,
                        s = ef("calls useStripe()").stripe,
                        l = (t = "calls useElements()", eu(w().useContext(el), t)).elements,
                        u = rL((0, g.useState)(!1), 2),
                        f = u[0],
                        p = u[1],
                        h = rL((0, g.useState)(!1), 2),
                        m = h[0],
                        b = h[1],
                        S = rL((0, g.useState)("" !== o ? o : i), 2),
                        x = S[0],
                        C = S[1],
                        E = rL((0, g.useState)(null), 2),
                        A = E[0],
                        j = E[1],
                        T = "",
                        P = n("Heading.SavedCreditCard.AddPaymentMethod"),
                        N = function() {
                            return rB(function() {
                                return rG(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            var t, n;
                                            return e.trys.push([0, 2, , 3]), (0, k.fireEvent)(nG), [4, (t = n8.Stripe, n = T, n4(function() {
                                                var e;
                                                return n5(this, function(r) {
                                                    return e = {
                                                        withCredentials: !0,
                                                        url: "".concat(v.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-profile/by-provider-id/").concat(t, "/").concat(n)
                                                    }, [2, nn.httpService.get(e, {
                                                        paymentProvider: t,
                                                        providerPaymentProfileId: n
                                                    })]
                                                })
                                            })())];
                                        case 1:
                                            if (e.sent()) return (0, k.fireEvent)(nH), [2, !0];
                                            return [3, 3];
                                        case 2:
                                            return e.sent(), (0, k.fireEvent)(nW), [3, 3];
                                        case 3:
                                            return [2, !1]
                                    }
                                })
                            })()
                        },
                        I = function(e, t, o) {
                            return rB(function() {
                                return rG(this, function(i) {
                                    switch (i.label) {
                                        case 0:
                                            return i.trys.push([0, 2, , 3]), [4, e()];
                                        case 1:
                                            if (i.sent()) return r.success(n("Response.SavedCreditCard.SavePaymentMethodSuccess")), a(), p(!1), d.close(), [2];
                                            if (0 === o) return (0, k.fireEvent)(nJ), r.warning(n(rf)), p(!1), d.close(), [2];
                                            return setTimeout(function() {
                                                I(e, t, o - 1)
                                            }, t), [3, 3];
                                        case 2:
                                            return i.sent(), (0, k.fireEvent)(nW), [3, 3];
                                        case 3:
                                            return [2]
                                    }
                                })
                            })()
                        };
                    return (0, y.jsx)(c, {
                        id: "add-card-modal",
                        title: P,
                        body: (0, y.jsx)(r_, {
                            translate: n,
                            elements: l,
                            onFormChange: function(e) {
                                b(e)
                            },
                            updateInputEmail: function(e) {
                                C(e)
                            },
                            stripeEmail: o,
                            robloxEmail: i,
                            stripeErrorCode: A
                        }),
                        loading: f,
                        neutralButtonText: n(rc),
                        actionButtonText: n(rd),
                        onNeutral: function() {
                            (0, k.fireEvent)(nl), d.close()
                        },
                        onAction: function() {
                            (0, k.fireEvent)(nu), rB(function() {
                                var e, t, a, u, c, f, h, y;
                                return rG(this, function(v) {
                                    switch (v.label) {
                                        case 0:
                                            if (!s || !l) return d.close(), [2];
                                            p(!0), j(null), e = "" === o && x !== i ? {
                                                return_url: nr(),
                                                payment_method_data: {
                                                    billing_details: {
                                                        email: x
                                                    },
                                                    allow_redisplay: "always"
                                                }
                                            } : {
                                                return_url: nr(),
                                                payment_method_data: {
                                                    allow_redisplay: "always"
                                                }
                                            }, v.label = 1;
                                        case 1:
                                            return v.trys.push([1, 3, , 4]), (0, k.fireEvent)(n$), [4, s.confirmSetup({
                                                elements: l,
                                                redirect: "if_required",
                                                confirmParams: e
                                            })];
                                        case 2:
                                            if ((null == (u = v.sent()) || null == (t = u.setupIntent) ? void 0 : t.status) === "succeeded")(0, k.fireEvent)(nK), (T = null != (h = null == u || null == (f = u.setupIntent) || null == (c = f.payment_method) ? void 0 : c.toString()) ? h : "") && I(N, 5e3, 3);
                                            else if (null == u || null == (a = u.error) ? void 0 : a.code) {
                                                switch ((0, k.fireEvent)(nJ), u.error.code) {
                                                    case nZ:
                                                    case n0:
                                                        j(null == u || null == (y = u.error) ? void 0 : y.code);
                                                        break;
                                                    case "card_declined":
                                                        r.warning(n("Description.SavedCreditCard.CardDeclinedErrorMessage") || "Card declined. Please review the card details or try a different card."), d.close();
                                                        break;
                                                    default:
                                                        r.warning(n(rf)), d.close()
                                                }
                                                p(!1)
                                            }
                                            return [3, 4];
                                        case 3:
                                            return v.sent(), (0, k.fireEvent)(nJ), r.warning(n(rf)), d.close(), p(!1), [3, 4];
                                        case 4:
                                            return [2]
                                    }
                                })
                            })()
                        },
                        closeable: !0,
                        size: "md",
                        actionButtonShow: !0,
                        disableActionButton: m
                    })
                }, d = u[1]]), 2),
                iS = iw[0],
                ix = iw[1],
                iC = function(e) {
                    var t, n = e.translate,
                        r = e.systemFeedbackService,
                        a = e.hideAddCardButton,
                        o = e.shouldDisplaySavedPaymentMethods,
                        i = e.hideSavedPaymentMethodsIfNoSavedCards,
                        s = !!v.DeviceMeta && ((0, v.DeviceMeta)().isAndroidApp || (0, v.DeviceMeta)().isIosApp),
                        l = ib((0, g.useState)(!0), 2),
                        u = l[0],
                        c = l[1],
                        d = ib((0, g.useState)([]), 2),
                        f = d[0],
                        p = d[1],
                        h = ib((0, g.useState)(null), 2),
                        m = h[0],
                        b = h[1],
                        w = ib((0, g.useState)(""), 2),
                        x = w[0],
                        C = w[1],
                        E = ib((0, g.useState)(""), 2),
                        A = E[0],
                        j = E[1],
                        T = ib((0, g.useState)(""), 2),
                        P = T[0],
                        N = T[1],
                        I = n("Heading.SavedCreditCard.SavedPaymentMethod"),
                        U = n("Description.SavedCreditCard.NoSavedPaymentMethods"),
                        M = function() {
                            return im(function() {
                                var e, t;
                                return ig(this, function(a) {
                                    switch (a.label) {
                                        case 0:
                                            return a.trys.push([0, 2, , 3]), (0, k.fireEvent)(nk), [4, n4(function() {
                                                var e;
                                                return n5(this, function(t) {
                                                    return e = {
                                                        withCredentials: !0,
                                                        url: "".concat(v.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-profiles")
                                                    }, [2, nn.httpService.get(e)]
                                                })
                                            })()];
                                        case 1:
                                            return (null == (t = a.sent()) || null == (e = t.data) ? void 0 : e.length) > 0 && o && p(t.data.slice()), (0, k.fireEvent)(nT), [3, 3];
                                        case 2:
                                            return a.sent(), (0, k.fireEvent)(nP), r.warning(n(rp)), [3, 3];
                                        case 3:
                                            return c(!1), [2]
                                    }
                                })
                            })()
                        };
                    (0, g.useEffect)(function() {
                        M()
                    }, [a, o]);
                    var O = (0, g.useCallback)(function() {
                            return im(function() {
                                return ig(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return [4, im(function() {
                                                var e, t;
                                                return ig(this, function(a) {
                                                    switch (a.label) {
                                                        case 0:
                                                            return a.trys.push([0, 2, , 3]), e = v.EnvironmentUrls.websiteUrl.includes("sitetest1") ? "pk_test_51LNM0XG5RADBkfjhYJlpADA2ArzWIh7gTWTodYNbpEzSiT55dul3VJhaBIVHL0CNyO0gECOz1vPnWArAkjwQ8NBO00Cdf2PxED" : v.EnvironmentUrls.websiteUrl.includes("sitetest3") ? "pk_test_51LNOeQHDRNiW7vlLcKH8TGCpJ7zhaidLdSegE22GCuvQbVUX2xDiGJY6WYaldYyo6qgVxmy1SnSVpSdaqyjfqclU00NQwWntIe" : "pk_live_51LKpO9C8tJWGhK4HEHtny9Dg7xXiQJ1i349cq6KBDusbl8bRHO7QmCKKhX18LPjSirMNTvj3tesq6mhIQuPioeAd0062ZCgoF3", (0, k.fireEvent)(nX), [4, W(e)];
                                                        case 1:
                                                            return t = a.sent(), (0, k.fireEvent)(nz), b(t), [3, 3];
                                                        case 2:
                                                            return a.sent(), (0, k.fireEvent)(nQ), r.warning(n(rp)), [3, 3];
                                                        case 3:
                                                            return [2]
                                                    }
                                                })
                                            })()];
                                        case 1:
                                            return e.sent(), [4, im(function() {
                                                var e, t, a, o, i, s, l, u, c, d, f;
                                                return ig(this, function(p) {
                                                    switch (p.label) {
                                                        case 0:
                                                            var h;
                                                            return p.trys.push([0, 2, , 3]), (0, k.fireEvent)(nS), [4, (h = n8.Stripe, n4(function() {
                                                                var e;
                                                                return n5(this, function(t) {
                                                                    return e = {
                                                                        withCredentials: !0,
                                                                        url: "".concat(v.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-profile/prepare")
                                                                    }, [2, nn.httpService.post(e, {
                                                                        paymentProvider: h
                                                                    })]
                                                                })
                                                            })())];
                                                        case 1:
                                                            return l = p.sent(), (0, k.fireEvent)(nx), C(null != (u = null == l || null == (t = l.data) || null == (e = t.providerPayload) ? void 0 : e.clientSecret) ? u : ""), (null == l || null == (o = l.data) || null == (a = o.providerPayload) ? void 0 : a.stripeCustomerEmail) ? (j(null == l || null == (d = l.data) || null == (c = d.providerPayload) ? void 0 : c.stripeCustomerEmail), (0, k.fireEvent)(nh)) : (0, k.fireEvent)(ny), N(null != (f = null == l || null == (s = l.data) || null == (i = s.providerPayload) ? void 0 : i.robloxUserEmail) ? f : ""), [3, 3];
                                                        case 2:
                                                            return p.sent(), (0, k.fireEvent)(nC), r.warning(n(rp)), [3, 3];
                                                        case 3:
                                                            return [2]
                                                    }
                                                })
                                            })()];
                                        case 2:
                                            return e.sent(), ix.open(), (0, k.fireEvent)(ns), [2]
                                    }
                                })
                            })()
                        }, []),
                        D = (0, g.useCallback)(function() {
                            return im(function() {
                                return ig(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return [4, M()];
                                        case 1:
                                            return e.sent(), [2]
                                    }
                                })
                            })()
                        }, [a, o]),
                        _ = function(e) {
                            if (f) {
                                var t = f.slice();
                                t.splice(e, 1), p(t)
                            }
                        },
                        R = !(i && (null == f ? void 0 : f.length) === 0);
                    return u || (f && f.length > 0 ? t = null == f ? void 0 : f.map(function(e, t) {
                        var a = e.providerPayload;
                        return "paypal" === a.paymentProfileType ? (0, y.jsx)(rU, {
                            translate: n,
                            systemFeedbackService: r,
                            updatePaymentProfiles: function() {
                                return _(t)
                            },
                            paymentProfileId: e.id,
                            email: a.Email
                        }, e.id.substring(0, 4)) : "card" === a.paymentProfileType ? (0, y.jsx)(rP, {
                            translate: n,
                            systemFeedbackService: r,
                            updatePaymentProfiles: function() {
                                return _(t)
                            },
                            paymentProfileId: e.id,
                            cardType: a.CardNetwork,
                            lastFour: a.Last4Digits,
                            expMonth: a.ExpMonth,
                            expYear: a.ExpYear
                        }, e.id.substring(0, 4)) : null
                    }) : (t = R && (0, y.jsx)("div", {
                        className: "no-payment-methods-text",
                        children: U
                    }), (0, k.fireEvent)(nN))), (0, y.jsxs)("div", {
                        className: "payment-methods-settings-container",
                        children: [m && x ? (0, y.jsx)(ec, {
                            stripe: m && x ? m : null,
                            options: m && x ? {
                                clientSecret: x,
                                wallets: {
                                    applePay: "never",
                                    googlePay: "never"
                                },
                                appearance: {
                                    theme: document.body.classList.contains("dark-theme") ? "night" : "stripe",
                                    labels: "above"
                                }
                            } : void 0,
                            children: (0, y.jsx)(iS, {
                                translate: n,
                                systemFeedbackService: r,
                                onSuccess: function() {
                                    D()
                                },
                                stripeEmail: A,
                                robloxEmail: P
                            })
                        }, x) : null, R && (0, y.jsxs)("div", {
                            className: "saved-payment-method-header-container",
                            children: [(0, y.jsx)("h5", {
                                children: I
                            }), s || a ? null : (0, y.jsx)(S.Button, {
                                className: "add-card-button btn-secondary-md",
                                onClick: function() {
                                    O(), (0, k.fireEvent)(ns)
                                },
                                children: n("Action.Add")
                            })]
                        }), u ? (0, y.jsx)("span", {
                            className: "spinner spinner-default"
                        }) : t, s ? null : (0, y.jsx)(ih, {
                            translate: n,
                            systemFeedbackService: r
                        })]
                    })
                },
                iE = window.HeaderScripts,
                iA = function(e) {
                    var t = e.translate,
                        n = e.subscriptionIconClassName,
                        r = e.subscriptionName,
                        a = e.showCancelButton,
                        o = e.cancelSubscriptionUrl,
                        i = e.autoRenewDate,
                        s = e.expirationDate,
                        l = t("Label.SavedCreditCard.RenewsOn"),
                        u = "".concat(l, " ").concat(i),
                        c = t("Label.SavedCreditCard.ExpiresOn"),
                        d = "".concat(c, " ").concat(s);
                    return (0, y.jsxs)("div", {
                        className: "subscription-container",
                        children: [(0, y.jsx)("span", {
                            className: n
                        }), (0, y.jsxs)("div", {
                            className: "subscription-desc",
                            children: [(0, y.jsx)("div", {
                                className: "subscription-header font-bold",
                                children: r
                            }), "" !== i ? (0, y.jsx)("p", {
                                children: u
                            }) : (0, y.jsx)("div", {
                                className: "expiration-text",
                                children: d
                            })]
                        }), "" !== i && a ? (0, y.jsx)(S.Button, {
                            className: "cancel-subscription-button btn-secondary-md",
                            onClick: function() {
                                (0, k.fireEvent)(ng), window.location.href = o
                            },
                            children: t(rc)
                        }) : null]
                    })
                };

            function ij(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function ik(e, t, n, r, a, o, i) {
                try {
                    var s = e[o](i),
                        l = s.value
                } catch (e) {
                    n(e);
                    return
                }
                s.done ? t(l) : Promise.resolve(l).then(r, a)
            }

            function iT(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            s = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            s = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (s) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return ij(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return ij(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var iP = function(e) {
                var t = e.translate,
                    n = e.systemFeedbackService,
                    r = iT((0, g.useState)(null), 2),
                    a = r[0],
                    o = r[1],
                    i = iT((0, g.useState)(!0), 2),
                    s = i[0],
                    l = i[1],
                    u = t("Label.DevSubs") || "Subscriptions",
                    c = t("Description.SavedCreditCard.NoPremium"),
                    d = "",
                    f = function() {
                        var e;
                        return (e = function() {
                            var e;
                            return function(e, t) {
                                var n, r, a, o = {
                                        label: 0,
                                        sent: function() {
                                            if (1 & a[0]) throw a[1];
                                            return a[1]
                                        },
                                        trys: [],
                                        ops: []
                                    },
                                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                return i.next = s(0), i.throw = s(1), i.return = s(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                                    return this
                                }), i;

                                function s(s) {
                                    return function(l) {
                                        var u = [s, l];
                                        if (n) throw TypeError("Generator is already executing.");
                                        for (; i && (i = 0, u[0] && (o = 0)), o;) try {
                                            if (n = 1, r && (a = 2 & u[0] ? r.return : u[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, u[1])).done) return a;
                                            switch (r = 0, a && (u = [2 & u[0], a.value]), u[0]) {
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
                                                    o.label++, r = u[1], u = [0];
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
                                            u = t.call(e, o)
                                        } catch (e) {
                                            u = [6, e], r = 0
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
                            }(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        l(!0), r.label = 1;
                                    case 1:
                                        return r.trys.push([1, 3, , 4]), (0, k.fireEvent)(nO), [4, n9(iE.authenticatedUser.id)];
                                    case 2:
                                        return (null == (e = r.sent()) ? void 0 : e.status) === 200 && ((0, k.fireEvent)(nD), o(null == e ? void 0 : e.data)), [3, 4];
                                    case 3:
                                        return 404 === r.sent().status ? (0, k.fireEvent)(nm) : ((0, k.fireEvent)(n_), n.warning(t(rp))), [3, 4];
                                    case 4:
                                        return l(!1), [2]
                                }
                            })
                        }, function() {
                            var t = this,
                                n = arguments;
                            return new Promise(function(r, a) {
                                var o = e.apply(t, n);

                                function i(e) {
                                    ik(o, r, a, i, s, "next", e)
                                }

                                function s(e) {
                                    ik(o, r, a, i, s, "throw", e)
                                }
                                i(void 0)
                            })
                        })()
                    };
                (0, g.useEffect)(function() {
                    f()
                }, []);
                var p = "",
                    h = "";
                if (null == a ? void 0 : a.subscriptionProductModel.subscriptionName) {
                    var m = new v.Intl().getDateTimeFormatter();
                    (null == a ? void 0 : a.subscriptionProductModel.renewal) && (p = m.getCustomDateTime(null == a ? void 0 : a.subscriptionProductModel.renewal, {
                        month: "short",
                        day: "2-digit",
                        year: "numeric"
                    })), (null == a ? void 0 : a.subscriptionProductModel.expiration) && (h = m.getCustomDateTime(null == a ? void 0 : a.subscriptionProductModel.expiration, {
                        month: "short",
                        day: "2-digit",
                        year: "numeric"
                    }))
                }
                return s ? (0, y.jsxs)("div", {
                    children: [(0, y.jsx)("h2", {
                        className: "main-header",
                        children: u
                    }), (0, y.jsx)("span", {
                        className: "spinner spinner-default"
                    })]
                }) : null !== a ? (0, y.jsxs)("div", {
                    children: [(0, y.jsx)("h2", {
                        className: "main-header",
                        children: u
                    }), (0, y.jsx)(iA, {
                        translate: t,
                        subscriptionIconClassName: "icon-premium-medium",
                        subscriptionName: null == a ? void 0 : a.subscriptionProductModel.subscriptionName,
                        showCancelButton: function() {
                            var e = iE.deviceMeta.getDeviceMeta();
                            if (a && "isDesktop" === a.subscriptionProductModel.purchasePlatform) {
                                if (!(null == e ? void 0 : e.isInApp) || e.isUniversalApp && e.isDesktop && !e.isUWPApp) return d = nn.urlService.getAbsoluteUrl("/upgrades/cancel-subscription"), !0
                            } else if (a && "isAndroidApp" === a.subscriptionProductModel.purchasePlatform && (null == e ? void 0 : e.isAndroidApp)) return d = "https://play.google.com/store/account/subscriptions", !0;
                            return !1
                        }(),
                        cancelSubscriptionUrl: d,
                        autoRenewDate: p,
                        expirationDate: h
                    })]
                }) : (0, y.jsxs)("div", {
                    children: [(0, y.jsx)("h2", {
                        className: "main-header",
                        children: u
                    }), (0, y.jsxs)("div", {
                        className: "subscription-container",
                        children: [(0, y.jsx)("p", {
                            className: "no-subscription-text",
                            children: c
                        }), (0, y.jsx)(S.Button, {
                            className: "subscribe-button btn-secondary-md",
                            onClick: function() {
                                (0, k.fireEvent)(nb), window.location.href = nn.urlService.getAbsoluteUrl("/premium/membership")
                            },
                            children: t("Action.Subscribe")
                        })]
                    })]
                })
            };

            function iN(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            var iI = function(e) {
                    var t, n = e.translate,
                        r = e.titleResourceId,
                        a = e.translatedTitle,
                        o = e.bodyResourceId,
                        i = e.translatedBody,
                        s = e.actionButtonTextResourceId,
                        l = e.neutralButtonTextResourceId,
                        u = e.footerTextResourceId,
                        c = e.size,
                        d = e.footerHyperlink,
                        f = e.onAction,
                        p = e.disableActionButton,
                        h = e.disabledNeutralButton,
                        v = e.shouldCloseModalOnActionButton,
                        m = void 0 === v || v,
                        b = e.onHide,
                        w = void 0 === b ? function() {} : b,
                        x = e.onNeutral,
                        C = (t = (0, g.useState)(!1), function(e) {
                            if (Array.isArray(e)) return e
                        }(t) || function(e, t) {
                            var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != a) {
                                var o = [],
                                    i = !0,
                                    s = !1;
                                try {
                                    for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), o.length !== t); i = !0);
                                } catch (e) {
                                    s = !0, r = e
                                } finally {
                                    try {
                                        i || null == a.return || a.return()
                                    } finally {
                                        if (s) throw r
                                    }
                                }
                                return o
                            }
                        }(t, 2) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return iN(e, 2);
                                var n = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return iN(e, t)
                            }
                        }(t, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        E = C[0],
                        A = C[1],
                        j = (0, g.useMemo)(function() {
                            return {
                                open: function() {
                                    return A(!0)
                                },
                                close: function() {
                                    return A(!1)
                                }
                            }
                        }, []),
                        k = a1()({
                            "modal-half-width-button": l,
                            "modal-full-width-button": !l
                        });
                    return [(0, y.jsxs)(S.Modal, {
                        show: E,
                        onHide: function() {
                            j.close(), w()
                        },
                        backdrop: !0,
                        className: "user-settings-modal",
                        size: void 0 === c ? "lg" : c,
                        "aria-labelledby": "user-settings-modal-title",
                        scrollable: !0,
                        centered: !0,
                        children: [(0, y.jsxs)(S.Modal.Header, {
                            useBaseBootstrapComponent: !0,
                            children: [(0, y.jsx)("div", {
                                className: "user-settings-modal-title-container",
                                children: (0, y.jsx)(S.Modal.Title, {
                                    id: "user-settings-modal-title",
                                    children: a || r && n(r)
                                })
                            }), (0, y.jsx)("button", {
                                type: "button",
                                className: "close close-button",
                                onClick: function() {
                                    j.close(), w()
                                },
                                children: (0, y.jsx)("span", {
                                    className: "icon-close"
                                })
                            })]
                        }), (0, y.jsx)(S.Modal.Body, {
                            children: i || o && n(o)
                        }), (0, y.jsxs)(S.Modal.Footer, {
                            children: [s && (0, y.jsx)(S.Button, {
                                className: k,
                                variant: S.Button.variants.primary,
                                size: S.Button.sizes.medium,
                                isDisabled: p,
                                onClick: function() {
                                    m && j.close(), null == f || f()
                                },
                                children: n(s)
                            }), l && (0, y.jsx)(S.Button, {
                                className: k,
                                variant: S.Button.variants.secondary,
                                size: S.Button.sizes.medium,
                                isDisabled: h,
                                onClick: function() {
                                    j.close(), null == x || x()
                                },
                                children: n(l)
                            })]
                        }), u && d && (0, y.jsx)("div", {
                            className: "text-footer user-settings-modal-text-footer border-top",
                            children: (0, y.jsxs)("span", {
                                children: [(0, y.jsx)("div", {
                                    className: "icon-moreinfo"
                                }), (0, y.jsx)("a", {
                                    className: "text-link user-settings-modal-text-footer-link",
                                    target: "_blank",
                                    rel: "noreferrer",
                                    href: d,
                                    children: n(u)
                                })]
                            })
                        })]
                    }), j]
                },
                iU = "authPageload",
                iM = "authButtonClick",
                iO = "authModalShown",
                iD = "settingsSpending",
                i_ = "spendingDisplayAllowPurchases",
                iR = "spendingHideAllowPurchases",
                iF = "allowPurchases",
                iB = "spendLimit",
                iL = "askParentConfirm",
                iG = "cancelModal",
                iH = "askParent",
                iW = "askParentConfirm",
                iY = "cancelAskParentConfirm",
                iq = "cancelRequest",
                iV = "doNotCancelRequest",
                iX = "Spending",
                iz = "Ask My Parent",
                iQ = "Ask your parent",
                i$ = "Ask now",
                iK = "Cancel",
                iJ = "Cancel request",
                iZ = "Do Not Cancel",
                i0 = function(e, t) {
                    rH.eventStreamService.sendEventWithTarget(e, iD, t)
                },
                i1 = function(e) {
                    i0(iU, {
                        state: e,
                        associatedText: iX
                    })
                },
                i2 = function(e) {
                    i0(iM, {
                        btn: iH,
                        state: e,
                        associatedText: iz
                    })
                },
                i3 = function(e) {
                    i0(iO, {
                        field: iL,
                        state: e,
                        associatedText: iQ
                    })
                },
                i4 = function(e) {
                    i0(iM, {
                        btn: iW,
                        state: e,
                        associatedText: i$
                    })
                },
                i6 = function(e) {
                    i0(iM, {
                        btn: iY,
                        state: e,
                        associatedText: iK
                    })
                },
                i5 = function(e) {
                    i0(iO, {
                        state: e,
                        field: iG,
                        associatedText: iJ
                    })
                },
                i8 = function(e) {
                    i0(iO, {
                        state: e,
                        field: iG,
                        associatedText: iJ
                    })
                },
                i7 = function(e) {
                    i0(iM, {
                        btn: iq,
                        state: e,
                        associatedText: iJ
                    })
                },
                i9 = function(e) {
                    i0(iM, {
                        btn: iV,
                        state: e,
                        associatedText: iZ
                    })
                };

            function se(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function st(e, t, n, r, a, o, i) {
                try {
                    var s = e[o](i),
                        l = s.value
                } catch (e) {
                    n(e);
                    return
                }
                s.done ? t(l) : Promise.resolve(l).then(r, a)
            }
            var sn = function(e) {
                    var t, n = e.systemFeedbackService,
                        r = e.translate,
                        a = e.onSuccess,
                        o = e.consentId,
                        i = e.state,
                        s = (t = iI({
                            translate: r,
                            titleResourceId: rl,
                            bodyResourceId: "Description.CancelSettingUpdateRequest",
                            actionButtonTextResourceId: "Action.Dialog.Yes",
                            neutralButtonTextResourceId: "Action.Dialog.No",
                            size: "sm",
                            onAction: function() {
                                var e;
                                return (e = function() {
                                    return function(e, t) {
                                        var n, r, a, o = {
                                                label: 0,
                                                sent: function() {
                                                    if (1 & a[0]) throw a[1];
                                                    return a[1]
                                                },
                                                trys: [],
                                                ops: []
                                            },
                                            i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                        return i.next = s(0), i.throw = s(1), i.return = s(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                                            return this
                                        }), i;

                                        function s(s) {
                                            return function(l) {
                                                var u = [s, l];
                                                if (n) throw TypeError("Generator is already executing.");
                                                for (; i && (i = 0, u[0] && (o = 0)), o;) try {
                                                    if (n = 1, r && (a = 2 & u[0] ? r.return : u[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, u[1])).done) return a;
                                                    switch (r = 0, a && (u = [2 & u[0], a.value]), u[0]) {
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
                                                            o.label++, r = u[1], u = [0];
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
                                                    u = t.call(e, o)
                                                } catch (e) {
                                                    u = [6, e], r = 0
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
                                    }(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                if (i7(i), !o) return [3, 4];
                                                e.label = 1;
                                            case 1:
                                                return e.trys.push([1, 3, , 4]), [4, n4(function() {
                                                    var e;
                                                    return n5(this, function(t) {
                                                        return e = {
                                                            withCredentials: !0,
                                                            url: "".concat(v.EnvironmentUrls.apiGatewayUrl, "/child-requests-api/v1/cancel-consent-request")
                                                        }, [2, nn.httpService.post(e, {
                                                            consentId: o
                                                        })]
                                                    })
                                                })()];
                                            case 2:
                                                return e.sent(), a(), n.success(r(rh)), [3, 4];
                                            case 3:
                                                return e.sent(), n.warning(r(rp)), [3, 4];
                                            case 4:
                                                return [2]
                                        }
                                    })
                                }, function() {
                                    var t = this,
                                        n = arguments;
                                    return new Promise(function(r, a) {
                                        var o = e.apply(t, n);

                                        function i(e) {
                                            st(o, r, a, i, s, "next", e)
                                        }

                                        function s(e) {
                                            st(o, r, a, i, s, "throw", e)
                                        }
                                        i(void 0)
                                    })
                                })()
                            },
                            onNeutral: function() {
                                i9(i)
                            }
                        }), function(e) {
                            if (Array.isArray(e)) return e
                        }(t) || function(e, t) {
                            var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != a) {
                                var o = [],
                                    i = !0,
                                    s = !1;
                                try {
                                    for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), o.length !== t); i = !0);
                                } catch (e) {
                                    s = !0, r = e
                                } finally {
                                    try {
                                        i || null == a.return || a.return()
                                    } finally {
                                        if (s) throw r
                                    }
                                }
                                return o
                            }
                        }(t, 2) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return se(e, 2);
                                var n = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                                if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return se(e, t)
                            }
                        }(t, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        l = s[0],
                        u = s[1];
                    return [l, {
                        open: function() {
                            i8(i), u.open()
                        },
                        close: u.close
                    }]
                },
                sr = function(e) {
                    var t = e.title,
                        n = e.description,
                        r = e.currentSettingValueComponent,
                        a = e.metadata,
                        o = e.showArrow,
                        i = e.onClick,
                        s = e.footer,
                        l = e.disabled,
                        u = a1()("spending-settings-list-item-container", {
                            "text-disabled": l
                        }),
                        c = a1()("spending-settings-list-item-info", {
                            "text-disabled": l
                        }),
                        d = a1()("spending-settings-list-item-value-arrow", {
                            "text-disabled": l
                        });
                    return (0, y.jsxs)("div", {
                        children: [(0, y.jsxs)("button", {
                            className: u,
                            type: "button",
                            onClick: i,
                            disabled: l,
                            children: [(0, y.jsxs)("div", {
                                className: c,
                                children: [(0, y.jsx)("span", {
                                    className: "spending-setting-name font-body ",
                                    children: t
                                }), n && (0, y.jsx)("span", {
                                    className: "small text",
                                    children: n
                                })]
                            }), a, (r || o) && (0, y.jsxs)("div", {
                                className: d,
                                children: [r, o && (0, y.jsx)("div", {
                                    children: (0, y.jsx)("span", {
                                        className: "icon-chevron-heavy-right"
                                    })
                                })]
                            })]
                        }), s && (0, y.jsx)("p", {
                            className: "spending-settings-list-item-footer small text",
                            dangerouslySetInnerHTML: {
                                __html: s
                            }
                        })]
                    })
                };
            sr.defaultProps = {
                description: void 0,
                currentSettingValueComponent: void 0,
                metadata: void 0,
                showArrow: !1,
                onClick: void 0,
                footer: void 0,
                disabled: !1
            };
            var sa = function(e) {
                    var t = e.translate;
                    return (0, y.jsxs)("div", {
                        className: "setting-option-pill xsmall ",
                        children: [(0, y.jsx)("span", {
                            className: "icon-uiblox-pending themified-icon"
                        }), (0, y.jsx)("span", {
                            className: "setting-option-label",
                            children: t("Label.Pending")
                        })]
                    })
                },
                so = ((f = so || {}).Disabled = "Disabled", f.Enabled = "Enabled", f);

            function si(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function ss(e, t, n, r, a, o, i) {
                try {
                    var s = e[o](i),
                        l = s.value
                } catch (e) {
                    n(e);
                    return
                }
                s.done ? t(l) : Promise.resolve(l).then(r, a)
            }

            function sl(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, a) {
                        var o = e.apply(t, n);

                        function i(e) {
                            ss(o, r, a, i, s, "next", e)
                        }

                        function s(e) {
                            ss(o, r, a, i, s, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function su(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            s = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            s = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (s) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return si(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return si(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function sc(e, t) {
                var n, r, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return i.next = s(0), i.throw = s(1), i.return = s(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                    return this
                }), i;

                function s(s) {
                    return function(l) {
                        var u = [s, l];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, u[0] && (o = 0)), o;) try {
                            if (n = 1, r && (a = 2 & u[0] ? r.return : u[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, u[1])).done) return a;
                            switch (r = 0, a && (u = [2 & u[0], a.value]), u[0]) {
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
                                    o.label++, r = u[1], u = [0];
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
                            u = t.call(e, o)
                        } catch (e) {
                            u = [6, e], r = 0
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
            var sd = function(e) {
                    var t = e.enablePurchaseSettings,
                        n = e.translate,
                        r = e.systemFeedbackService,
                        a = su((0, g.useState)(null), 2),
                        o = a[0],
                        i = a[1],
                        s = su((0, g.useState)(), 2),
                        l = s[0],
                        u = s[1],
                        c = (null == t ? void 0 : t.currentValue) === so.Disabled,
                        d = function() {
                            return sl(function() {
                                return sc(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            var t;
                                            return e.trys.push([0, 2, , 3]), [4, (t = iE.authenticatedUser.id, n4(function() {
                                                var e, n;
                                                return n5(this, function(r) {
                                                    switch (r.label) {
                                                        case 0:
                                                            return [4, rr(t, e, n = [])];
                                                        case 1:
                                                            return r.sent(), [2, n.find(function(e) {
                                                                var t;
                                                                return (null == e || null == (t = e.consentData) ? void 0 : t.monthlySpendLimit) !== void 0
                                                            }) || null]
                                                    }
                                                })
                                            })())];
                                        case 1:
                                            return u(e.sent()), [3, 3];
                                        case 2:
                                            return e.sent(), r.warning(n(rp)), [3, 3];
                                        case 3:
                                            return [2]
                                    }
                                })
                            })()
                        };
                    (0, g.useEffect)(function() {
                        sl(function() {
                            return sc(this, function(e) {
                                switch (e.label) {
                                    case 0:
                                        return e.trys.push([0, 2, , 3]), [4, rn()];
                                    case 1:
                                        return i(e.sent()), [3, 3];
                                    case 2:
                                        return e.sent(), r.warning(n(rp)), [3, 3];
                                    case 3:
                                        return [2]
                                }
                            })
                        })(), d()
                    }, []), (0, g.useEffect)(function() {
                        window.dispatchEvent(new CustomEvent("price-tag:render", {
                            detail: {
                                targetSelector: ".fiat-spending-limit-tag",
                                tagClassName: "font-body"
                            }
                        }))
                    }, [o]);
                    var f = su(iI({
                            translate: n,
                            titleResourceId: rs,
                            bodyResourceId: "Description.AskMoreRobux",
                            actionButtonTextResourceId: "Action.AskMoreRobux",
                            neutralButtonTextResourceId: rc,
                            size: "sm",
                            onAction: function() {
                                return sl(function() {
                                    return sc(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return i4(iB), [4, sl(function() {
                                                    return sc(this, function(e) {
                                                        switch (e.label) {
                                                            case 0:
                                                                return e.trys.push([0, 3, , 4]), [4, v.AccessManagementUpsellV2Service.startAccessManagementUpsell({
                                                                    featureName: n1,
                                                                    isAsyncCall: !1,
                                                                    usePrologue: !1,
                                                                    ampRecourseData: {
                                                                        monthlySpendLimit: null,
                                                                        monthlySpendLimitCurrencyCode: null
                                                                    }
                                                                })];
                                                            case 1:
                                                                return e.sent(), [4, d()];
                                                            case 2:
                                                                return e.sent(), [3, 4];
                                                            case 3:
                                                                return e.sent(), r.warning(n(rp)), [3, 4];
                                                            case 4:
                                                                return [2]
                                                        }
                                                    })
                                                })()];
                                            case 1:
                                                return e.sent(), [2]
                                        }
                                    })
                                })()
                            },
                            onNeutral: function() {
                                i6(iB)
                            }
                        }), 2),
                        p = f[0],
                        h = f[1],
                        m = (null == o ? void 0 : o.monthlySpendLimit) !== null && (null == o ? void 0 : o.monthlySpendLimit) !== void 0,
                        b = (0, y.jsx)("span", {
                            className: "fiat-spending-limit-tag",
                            "data-amount": null == o ? void 0 : o.monthlySpendLimit,
                            "data-currency-code": null == o ? void 0 : o.monthlySpendLimitCurrencyType
                        }),
                        x = su(sn({
                            systemFeedbackService: r,
                            translate: n,
                            consentId: null == l ? void 0 : l.id,
                            onSuccess: d,
                            state: iB
                        }), 2),
                        C = x[0],
                        E = x[1],
                        A = function() {
                            return n("Description.MonthlySpendLimitDisclaimer", {
                                linkStart: '<a href="https://help.roblox.com/hc/articles/4409125091348" class="text-link" target="_blank">',
                                linkEnd: "</a>"
                            })
                        };
                    if (m) return (0, y.jsx)(w().Fragment, {
                        children: (0, y.jsxs)("div", {
                            className: "section-content spending-setting-container",
                            children: [(0, y.jsx)(sr, {
                                disabled: c,
                                title: n(ru),
                                currentSettingValueComponent: (0, y.jsxs)(w().Fragment, {
                                    children: [l && (0, y.jsx)(sa, {
                                        translate: n
                                    }), b]
                                }),
                                onClick: function() {
                                    c || (l ? E.open() : (i3(iB), h.open()))
                                },
                                showArrow: !0,
                                footer: A()
                            }), (0, y.jsx)("div", {
                                className: "request-consent-button-container",
                                children: l && (0, y.jsx)(S.Button, {
                                    variant: S.Button.variants.secondary,
                                    onClick: function() {
                                        i5(iB), E.open()
                                    },
                                    children: n(rl)
                                })
                            }), p, C]
                        })
                    });
                    var j = (0, y.jsx)("span", {
                        className: "text-description",
                        children: n("Label.NoLimit")
                    });
                    return (0, y.jsx)("div", {
                        className: "section-content spending-setting-container",
                        children: (0, y.jsx)(sr, {
                            title: n(ru),
                            currentSettingValueComponent: j,
                            footer: A()
                        })
                    })
                },
                sf = function(e) {
                    var t = e.translate;
                    return (0, y.jsxs)("div", {
                        className: "setting-option-pill xsmall ",
                        children: [(0, y.jsx)("span", {
                            className: "icon-status-private themified-icon"
                        }), (0, y.jsx)("span", {
                            className: "setting-option-label",
                            children: t("Label.Parent")
                        })]
                    })
                },
                sp = ((p = sp || {}).None = "None", p.ParentalConsent = "ParentalConsent", p.SelfUpdateSetting = "SelfUpdateSetting", p.ContentAgeRestrictionVerification = "ContentAgeRestrictionVerification", p.ParentConsentInherited = "ParentConsentInherited", p.Inherited = "Inherited", p),
                sh = function() {
                    var e = new CustomEvent("refetchUserSettingsEvent");
                    window.dispatchEvent(e)
                };

            function sy(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function sv(e, t, n, r, a, o, i) {
                try {
                    var s = e[o](i),
                        l = s.value
                } catch (e) {
                    n(e);
                    return
                }
                s.done ? t(l) : Promise.resolve(l).then(r, a)
            }

            function sm(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, a) {
                        var o = e.apply(t, n);

                        function i(e) {
                            sv(o, r, a, i, s, "next", e)
                        }

                        function s(e) {
                            sv(o, r, a, i, s, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function sb(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            s = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            s = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (s) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return sy(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return sy(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function sg(e, t) {
                var n, r, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return i.next = s(0), i.throw = s(1), i.return = s(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                    return this
                }), i;

                function s(s) {
                    return function(l) {
                        var u = [s, l];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, u[0] && (o = 0)), o;) try {
                            if (n = 1, r && (a = 2 & u[0] ? r.return : u[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, u[1])).done) return a;
                            switch (r = 0, a && (u = [2 & u[0], a.value]), u[0]) {
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
                                    o.label++, r = u[1], u = [0];
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
                            u = t.call(e, o)
                        } catch (e) {
                            u = [6, e], r = 0
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
            var sw = function(e) {
                var t = e.enablePurchaseSettings,
                    n = e.refetchEnablePurchaseSettings,
                    r = e.translate,
                    a = e.systemFeedbackService,
                    o = sb((0, g.useState)(), 2),
                    i = o[0],
                    s = o[1],
                    l = sb((0, g.useState)(!1), 2),
                    u = l[0],
                    c = l[1],
                    d = sb((0, g.useState)(!1), 2),
                    f = d[0],
                    p = d[1],
                    h = sb((0, g.useState)(!1), 2),
                    m = h[0],
                    b = h[1],
                    x = t.currentValue === so.Enabled,
                    C = function() {
                        return sm(function() {
                            return sg(this, function(e) {
                                switch (e.label) {
                                    case 0:
                                        var t;
                                        return e.trys.push([0, 2, , 3]), [4, (t = iE.authenticatedUser.id, n4(function() {
                                            var e, n;
                                            return n5(this, function(r) {
                                                switch (r.label) {
                                                    case 0:
                                                        return [4, rr(t, e, n = [])];
                                                    case 1:
                                                        return r.sent(), [2, n.find(function(e) {
                                                            var t;
                                                            return (null == e || null == (t = e.consentData) ? void 0 : t.enablePurchases) !== void 0
                                                        }) || null]
                                                }
                                            })
                                        })())];
                                    case 1:
                                        return s(e.sent()), p(x), b(!1), [3, 3];
                                    case 2:
                                        return e.sent(), a.warning(r(rp)), [3, 3];
                                    case 3:
                                        return [2]
                                }
                            })
                        })()
                    },
                    E = function() {
                        t.options.forEach(function(e) {
                            var n = e.requirement;
                            e.option.optionValue !== t.currentValue && n === sp.ParentalConsent && c(!0), p(x)
                        })
                    };
                (0, g.useEffect)(function() {
                    C(), E()
                }, [t]);
                var A = sb(sn({
                        systemFeedbackService: a,
                        translate: r,
                        consentId: null == i ? void 0 : i.id,
                        onSuccess: C,
                        state: iF
                    }), 2),
                    j = A[0],
                    k = A[1],
                    T = function() {
                        return sm(function() {
                            var e;
                            return sg(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        if (!u) return [3, 2];
                                        return [4, sm(function() {
                                            return sg(this, function(e) {
                                                switch (e.label) {
                                                    case 0:
                                                        return e.trys.push([0, 3, , 4]), [4, v.AccessManagementUpsellV2Service.startAccessManagementUpsell({
                                                            featureName: n1,
                                                            isAsyncCall: !1,
                                                            usePrologue: !1,
                                                            ampRecourseData: {
                                                                enablePurchases: so.Enabled
                                                            }
                                                        })];
                                                    case 1:
                                                        return e.sent(), [4, C()];
                                                    case 2:
                                                        return e.sent(), [3, 4];
                                                    case 3:
                                                        return e.sent(), a.warning(r(rp)), [3, 4];
                                                    case 4:
                                                        return [2]
                                                }
                                            })
                                        })()];
                                    case 1:
                                        return t.sent(), [3, 3];
                                    case 2:
                                        var o;
                                        (o = e = f ? so.Disabled : so.Enabled, n4(function() {
                                            var e;
                                            return n5(this, function(t) {
                                                return e = {
                                                    withCredentials: !0,
                                                    url: "".concat(v.EnvironmentUrls.userSettingsApi, "/v1/user-settings")
                                                }, [2, nn.httpService.post(e, {
                                                    enablePurchases: o
                                                })]
                                            })
                                        })()).then(function() {
                                            p(e === so.Enabled), a.success(r(rh)), n(), sh()
                                        }).catch(function(e) {
                                            a.warning(r(rp))
                                        }), t.label = 3;
                                    case 3:
                                        return [2]
                                }
                            })
                        })()
                    };
                return (0, y.jsxs)(w().Fragment, {
                    children: [(0, y.jsxs)("div", {
                        className: "section-content spending-setting-container",
                        children: [(0, y.jsx)(sr, {
                            title: r("Heading.AllowPurchases"),
                            currentSettingValueComponent: (0, y.jsxs)(w().Fragment, {
                                children: [i && (0, y.jsx)(sa, {
                                    translate: r
                                }), u && !i && (0, y.jsx)(sf, {
                                    translate: r
                                }), (0, y.jsx)(S.Toggle, {
                                    id: "allow-purchases-toggle",
                                    isOn: f,
                                    onToggle: function() {
                                        return sm(function() {
                                            return sg(this, function(e) {
                                                switch (e.label) {
                                                    case 0:
                                                        if (i) return k.open(), [2];
                                                        if (u && !f !== x) return p(function(e) {
                                                            return !e
                                                        }), b(!0), [2];
                                                        if (u) return [3, 2];
                                                        return [4, T()];
                                                    case 1:
                                                        return e.sent(), [2];
                                                    case 2:
                                                        return p(function(e) {
                                                            return !e
                                                        }), b(!1), [2]
                                                }
                                            })
                                        })()
                                    }
                                })]
                            }),
                            footer: r("Description.AllowPurchaseDisclaimer", {
                                premiumSubscriptionsLinkStart: '<a href="https://help.roblox.com/hc/articles/203312540" class="text-link" target="_blank">',
                                premiumSubscriptionsLinkEnd: "</a>",
                                inExperienceSubscriptionsLinkStart: '<a href="https://help.roblox.com/hc/articles/20292396051220" class="text-link" target="_blank">',
                                inExperienceSubscriptionsLinkEnd: "</a>"
                            })
                        }), (0, y.jsxs)("div", {
                            className: "request-consent-button-container",
                            children: [m && !i && (0, y.jsx)(S.Button, {
                                className: "enable-purchase-action-button",
                                variant: S.Button.variants.primary,
                                onClick: function() {
                                    return sm(function() {
                                        return sg(this, function(e) {
                                            switch (e.label) {
                                                case 0:
                                                    return i2(iF), [4, T()];
                                                case 1:
                                                    return e.sent(), [2]
                                            }
                                        })
                                    })()
                                },
                                children: r(rs)
                            }), i && (0, y.jsx)(S.Button, {
                                className: "enable-purchase-action-button",
                                variant: S.Button.variants.secondary,
                                onClick: function() {
                                    i5(iF), k.open()
                                },
                                children: r(rl)
                            })]
                        })]
                    }), j]
                })
            };

            function sS(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function sx(e, t, n, r, a, o, i) {
                try {
                    var s = e[o](i),
                        l = s.value
                } catch (e) {
                    n(e);
                    return
                }
                s.done ? t(l) : Promise.resolve(l).then(r, a)
            }

            function sC(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            s = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            s = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (s) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return sS(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return sS(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var sE = function(e) {
                var t = e.translate,
                    n = e.systemFeedbackService,
                    r = !!v.DeviceMeta && ((0, v.DeviceMeta)().isAndroidApp || (0, v.DeviceMeta)().isIosApp),
                    a = sC((0, g.useState)(!0), 2),
                    o = a[0],
                    i = a[1],
                    s = sC((0, g.useState)(!0), 2),
                    l = s[0],
                    u = s[1],
                    c = sC((0, g.useState)(!1), 2),
                    d = c[0],
                    f = c[1],
                    p = sC((0, g.useState)(0), 2),
                    h = p[0],
                    m = p[1],
                    b = sC((0, g.useState)(0), 2),
                    w = b[0],
                    S = b[1],
                    x = sC((0, g.useState)("USD"), 2),
                    C = x[0],
                    E = x[1],
                    A = t(ra),
                    j = function() {
                        var e;
                        return (e = function() {
                            var e, t, r, a, o, s;
                            return function(e, t) {
                                var n, r, a, o = {
                                        label: 0,
                                        sent: function() {
                                            if (1 & a[0]) throw a[1];
                                            return a[1]
                                        },
                                        trys: [],
                                        ops: []
                                    },
                                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                return i.next = s(0), i.throw = s(1), i.return = s(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                                    return this
                                }), i;

                                function s(s) {
                                    return function(l) {
                                        var u = [s, l];
                                        if (n) throw TypeError("Generator is already executing.");
                                        for (; i && (i = 0, u[0] && (o = 0)), o;) try {
                                            if (n = 1, r && (a = 2 & u[0] ? r.return : u[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, u[1])).done) return a;
                                            switch (r = 0, a && (u = [2 & u[0], a.value]), u[0]) {
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
                                                    o.label++, r = u[1], u = [0];
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
                                            u = t.call(e, o)
                                        } catch (e) {
                                            u = [6, e], r = 0
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
                            }(this, function(l) {
                                switch (l.label) {
                                    case 0:
                                        i(!0), l.label = 1;
                                    case 1:
                                        return l.trys.push([1, 3, , 4]), [4, re()];
                                    case 2:
                                        return t = (e = sC.apply(void 0, [l.sent(), 5]))[0], r = e[1], a = e[2], o = e[3], s = e[4], u(t), f(r), m(a), S(o), E(s), [3, 4];
                                    case 3:
                                        return l.sent(), n.warning(rp), [3, 4];
                                    case 4:
                                        return i(!1), [2]
                                }
                            })
                        }, function() {
                            var t = this,
                                n = arguments;
                            return new Promise(function(r, a) {
                                var o = e.apply(t, n);

                                function i(e) {
                                    sx(o, r, a, i, s, "next", e)
                                }

                                function s(e) {
                                    sx(o, r, a, i, s, "throw", e)
                                }
                                i(void 0)
                            })
                        })()
                    };
                return ((0, g.useEffect)(function() {
                    j()
                }, [w]), r || l) ? (0, y.jsx)("div", {}) : (0, y.jsxs)("div", {
                    children: [(0, y.jsx)("h2", {
                        children: A
                    }), o ? (0, y.jsx)("span", {
                        className: "spinner spinner-default"
                    }) : (0, y.jsx)(iu, {
                        translate: t,
                        systemFeedbackService: n,
                        showConvertButton: d,
                        robuxAmount: h,
                        balance: w,
                        currencyCode: C,
                        setZeroBalance: function() {
                            return S(0)
                        }
                    })]
                })
            };

            function sA(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function sj(e, t, n, r, a, o, i) {
                try {
                    var s = e[o](i),
                        l = s.value
                } catch (e) {
                    n(e);
                    return
                }
                s.done ? t(l) : Promise.resolve(l).then(r, a)
            }

            function sk(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            s = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            s = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (s) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return sA(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return sA(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var sT = function(e) {
                var t, n = e.translate,
                    r = e.systemFeedbackService,
                    a = sk((0, g.useState)(null), 2),
                    o = a[0],
                    i = a[1],
                    s = sk((0, g.useState)(!0), 2),
                    l = s[0],
                    u = s[1],
                    c = function() {
                        var e;
                        return (e = function() {
                            return function(e, t) {
                                var n, r, a, o = {
                                        label: 0,
                                        sent: function() {
                                            if (1 & a[0]) throw a[1];
                                            return a[1]
                                        },
                                        trys: [],
                                        ops: []
                                    },
                                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                return i.next = s(0), i.throw = s(1), i.return = s(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                                    return this
                                }), i;

                                function s(s) {
                                    return function(l) {
                                        var u = [s, l];
                                        if (n) throw TypeError("Generator is already executing.");
                                        for (; i && (i = 0, u[0] && (o = 0)), o;) try {
                                            if (n = 1, r && (a = 2 & u[0] ? r.return : u[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, u[1])).done) return a;
                                            switch (r = 0, a && (u = [2 & u[0], a.value]), u[0]) {
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
                                                    o.label++, r = u[1], u = [0];
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
                                            u = t.call(e, o)
                                        } catch (e) {
                                            u = [6, e], r = 0
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
                            }(this, function(e) {
                                switch (e.label) {
                                    case 0:
                                        return e.trys.push([0, 2, , 3]), [4, rn()];
                                    case 1:
                                        return i(e.sent()), [3, 3];
                                    case 2:
                                        return e.sent(), r.warning(n(rp)), [3, 3];
                                    case 3:
                                        return u(!1), [2]
                                }
                            })
                        }, function() {
                            var t = this,
                                n = arguments;
                            return new Promise(function(r, a) {
                                var o = e.apply(t, n);

                                function i(e) {
                                    sj(o, r, a, i, s, "next", e)
                                }

                                function s(e) {
                                    sj(o, r, a, i, s, "throw", e)
                                }
                                i(void 0)
                            })
                        })()
                    };
                if ((0, g.useEffect)(function() {
                        c()
                    }, []), l) return (0, y.jsx)("div", {
                    className: "section-content spending-setting-container",
                    children: (0, y.jsx)("span", {
                        className: "spinner spinner-default"
                    })
                });
                if (!(null == o ? void 0 : o.isSpendNotificationSettingEnabledForUser)) return null;
                switch (o.spendNotificationSetting) {
                    case "NotificationsEveryAmountSpent":
                        t = n("Description.SpendNotifications.AllTransactions");
                        break;
                    case "NotificationsOnlyOnThresholdPassed":
                        t = n("Description.SpendNotifications.HighSpend");
                        break;
                    default:
                        t = void 0
                }
                return t ? (0, y.jsx)("div", {
                    className: "section-content spending-setting-container",
                    children: (0, y.jsx)(sr, {
                        title: n("Heading.SpendNotifications"),
                        description: t
                    })
                }) : null
            };

            function sP(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function sN(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            s = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            s = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (s) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return sP(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return sP(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var sI = function() {
                var e = sN((0, g.useState)(!1), 2),
                    t = e[0],
                    n = e[1],
                    r = (0, g.useMemo)(function() {
                        return {
                            open: function() {
                                return n(!0)
                            },
                            close: function() {
                                return n(!1)
                            }
                        }
                    }, []);
                return [function(e) {
                    var n = e.translate,
                        a = e.systemFeedbackService,
                        o = e.onUpdateSuccess,
                        i = e.address,
                        s = sN((0, g.useState)(!1), 2),
                        l = s[0],
                        u = s[1],
                        c = sN((0, g.useState)(!1), 2),
                        d = c[0],
                        f = c[1],
                        p = sN((0, g.useState)(!1), 2),
                        h = p[0],
                        v = p[1],
                        m = sN((0, g.useState)(), 2),
                        b = m[0],
                        w = m[1],
                        x = (0, g.useCallback)(function(e) {
                            switch (e.country) {
                                case "US":
                                    e.city && e.state && e.postalCode && (e.country !== i.country || e.state !== i.state || e.city !== i.city || e.postalCode !== i.postalCode) && (f(!0), w(e));
                                    break;
                                case "CA":
                                    e.city && e.state && (e.country !== i.country || e.state !== i.state || e.city !== i.city) && (f(!0), w(e))
                            }
                        }, [i.city, i.country, i.postalCode, i.state]),
                        C = (0, g.useCallback)(function() {
                            u(!0), v(!0)
                        }, []),
                        E = (0, g.useCallback)(function() {
                            b && (o(b), a.success(n("Description.SavedBillingAddress.UpdatedBillingAddressSuccess")), u(!1), r.close())
                        }, [o, a, n, b]);
                    return (0, y.jsxs)(S.Modal, {
                        show: t,
                        onHide: r.close,
                        size: "md",
                        id: "update-payment-method-modal",
                        children: [(0, y.jsx)(S.Modal.Header, {
                            title: n("Heading.SavedBillingAddress.UpdateBillingAddress"),
                            onClose: r.close
                        }), (0, y.jsx)(S.Modal.Body, {
                            children: (0, y.jsx)(oV, {
                                prefilledAddress: i,
                                onUpdateAddress: x,
                                processAddressSave: h,
                                onUpdateSuccess: E,
                                hideSaveSection: !0,
                                triggeringContext: rH.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_PAYMENT_METHODS_SETTING
                            })
                        }), (0, y.jsx)("div", {
                            className: "footer-divider"
                        }), (0, y.jsx)(S.Modal.Footer, {
                            children: (0, y.jsxs)("div", {
                                className: "modal-buttons",
                                children: [(0, y.jsx)(S.Button, {
                                    variant: S.Button.variants.secondary,
                                    width: S.Button.widths.full,
                                    size: S.Button.sizes.large,
                                    className: "action-button",
                                    onClick: r.close,
                                    children: n(rc)
                                }), (0, y.jsx)(S.Button, {
                                    width: S.Button.widths.full,
                                    size: S.Button.sizes.large,
                                    className: "action-button",
                                    isLoading: l,
                                    isDisabled: !d,
                                    onClick: C,
                                    children: n(rd)
                                })]
                            })
                        })]
                    })
                }, r]
            };

            function sU(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function sM(e, t, n, r, a, o, i) {
                try {
                    var s = e[o](i),
                        l = s.value
                } catch (e) {
                    n(e);
                    return
                }
                s.done ? t(l) : Promise.resolve(l).then(r, a)
            }

            function sO(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, a) {
                        var o = e.apply(t, n);

                        function i(e) {
                            sM(o, r, a, i, s, "next", e)
                        }

                        function s(e) {
                            sM(o, r, a, i, s, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function sD(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            s = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            s = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (s) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return sU(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return sU(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function s_(e, t) {
                var n, r, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return i.next = s(0), i.throw = s(1), i.return = s(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                    return this
                }), i;

                function s(s) {
                    return function(l) {
                        var u = [s, l];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, u[0] && (o = 0)), o;) try {
                            if (n = 1, r && (a = 2 & u[0] ? r.return : u[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, u[1])).done) return a;
                            switch (r = 0, a && (u = [2 & u[0], a.value]), u[0]) {
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
                                    o.label++, r = u[1], u = [0];
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
                            u = t.call(e, o)
                        } catch (e) {
                            u = [6, e], r = 0
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
            var sR = function(e) {
                var t = e.systemFeedbackService,
                    n = e.translate,
                    r = sD((0, g.useState)(), 2),
                    a = r[0],
                    o = r[1],
                    i = n("Heading.SavedGiftCardInformation"),
                    s = n("Heading.SavedBillingAddress.DeleteBillingAddress"),
                    l = n("Description.SavedBillingAddress.AreYouSureDeleteBillingAddress"),
                    u = sD(rm(), 2),
                    c = u[0],
                    d = u[1],
                    f = sD(sI(), 2),
                    p = f[0],
                    h = f[1];
                if ((0, g.useEffect)(function() {
                        sO(function() {
                            var e, t, n;
                            return s_(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return r.trys.push([0, 2, , 3]), [4, n4(function() {
                                            var e, t;
                                            return n5(this, function(n) {
                                                return e = {
                                                    withCredentials: !0,
                                                    url: "".concat(v.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/user-settings-address")
                                                }, t = {}, [2, nn.httpService.get(e, t)]
                                            })
                                        })()];
                                    case 1:
                                        return t = (e = r.sent().data.address).country, n = e.state, o({
                                            country: t,
                                            state: n,
                                            city: e.city,
                                            postalCode: e.postalCode
                                        }), [3, 3];
                                    case 2:
                                        return r.sent(), [3, 3];
                                    case 3:
                                        return [2]
                                }
                            })
                        })()
                    }, []), !a) return null;
                var m = a.postalCode ? "".concat(a.city, ", ").concat(a.state, ", ").concat(a.postalCode, ", ").concat(a.country) : "".concat(a.city, ", ").concat(a.state, ", ").concat(a.country);
                return (0, y.jsxs)("div", {
                    className: "saved-gift-card-information-container",
                    children: [(0, y.jsxs)("h5", {
                        children: [" ", i, " "]
                    }), (0, y.jsxs)("div", {
                        className: "billing-address-container",
                        children: [(0, y.jsx)(c, {
                            translate: n,
                            header: s,
                            cancelText: l,
                            onDelete: function() {
                                return sO(function() {
                                    return s_(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return e.trys.push([0, 2, , 3]), [4, n4(function() {
                                                    var e, t;
                                                    return n5(this, function(n) {
                                                        return e = {
                                                            withCredentials: !0,
                                                            url: "".concat(v.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/user-settings-address")
                                                        }, t = {}, [2, nn.httpService.patch(e, t)]
                                                    })
                                                })()];
                                            case 1:
                                                return e.sent(), t.success(n("Description.SavedBillingAddress.DeleteBillingAddressSuccess")), o(void 0), [3, 3];
                                            case 2:
                                                return e.sent(), t.warning(n(rp)), [3, 3];
                                            case 3:
                                                return [2]
                                        }
                                    })
                                })()
                            }
                        }), (0, y.jsx)(p, {
                            translate: n,
                            systemFeedbackService: t,
                            onUpdateSuccess: function(e) {
                                o(e)
                            },
                            address: a
                        }), (0, y.jsx)("p", {
                            className: "billing-address-label",
                            children: m
                        }), (0, y.jsx)("button", {
                            type: "button",
                            className: "btn-generic-edit-sm",
                            onClick: function() {
                                h.open()
                            },
                            children: (0, y.jsx)("span", {
                                className: "icon-edit"
                            })
                        }), (0, y.jsx)("button", {
                            type: "button",
                            className: "btn-generic-trash-bin-sm",
                            onClick: function() {
                                d.open()
                            },
                            children: (0, y.jsx)("span", {
                                className: "icon-trash-bin"
                            })
                        })]
                    })]
                })
            };

            function sF(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function sB(e, t, n, r, a, o, i) {
                try {
                    var s = e[o](i),
                        l = s.value
                } catch (e) {
                    n(e);
                    return
                }
                s.done ? t(l) : Promise.resolve(l).then(r, a)
            }

            function sL(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, a) {
                        var o = e.apply(t, n);

                        function i(e) {
                            sB(o, r, a, i, s, "next", e)
                        }

                        function s(e) {
                            sB(o, r, a, i, s, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function sG(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            s = !1;
                        try {
                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            s = !0, r = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (s) throw r
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return sF(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return sF(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function sH(e, t) {
                var n, r, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return i.next = s(0), i.throw = s(1), i.return = s(2), "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                    return this
                }), i;

                function s(s) {
                    return function(l) {
                        var u = [s, l];
                        if (n) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, u[0] && (o = 0)), o;) try {
                            if (n = 1, r && (a = 2 & u[0] ? r.return : u[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, u[1])).done) return a;
                            switch (r = 0, a && (u = [2 & u[0], a.value]), u[0]) {
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
                                    o.label++, r = u[1], u = [0];
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
                            u = t.call(e, o)
                        } catch (e) {
                            u = [6, e], r = 0
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
            var sW = function(e) {
                var t = e.translate,
                    n = e.systemFeedbackService,
                    r = sG((0, g.useState)(!0), 2),
                    a = r[0],
                    o = r[1],
                    i = sG((0, g.useState)(!1), 2),
                    s = i[0],
                    l = i[1],
                    u = sG((0, g.useState)(!1), 2),
                    c = u[0],
                    d = u[1],
                    f = sG((0, g.useState)(!1), 2),
                    p = f[0],
                    h = f[1],
                    m = sG((0, g.useState)(), 2),
                    b = m[0],
                    w = m[1],
                    S = sG((0, g.useState)(), 2),
                    x = S[0],
                    C = S[1],
                    T = sG((0, g.useState)(), 2),
                    P = T[0],
                    N = T[1],
                    I = sG((0, g.useState)(!1), 2),
                    U = I[0],
                    M = I[1],
                    O = function() {
                        return sL(function() {
                            return sH(this, function(e) {
                                switch (e.label) {
                                    case 0:
                                        return e.trys.push([0, 2, , 3]), [4, n4(function() {
                                            var e, t, n;
                                            return n5(this, function(r) {
                                                switch (r.label) {
                                                    case 0:
                                                        return e = {
                                                            withCredentials: !0,
                                                            url: "".concat(v.EnvironmentUrls.userSettingsApi, "/v1/user-settings/settings-and-options")
                                                        }, [4, nn.httpService.get(e)];
                                                    case 1:
                                                        return n = function(e) {
                                                            for (var t = 1; t < arguments.length; t++) {
                                                                var n = null != arguments[t] ? arguments[t] : {},
                                                                    r = Object.keys(n);
                                                                "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                                                                    return Object.getOwnPropertyDescriptor(n, e).enumerable
                                                                }))), r.forEach(function(t) {
                                                                    var r;
                                                                    r = n[t], t in e ? Object.defineProperty(e, t, {
                                                                        value: r,
                                                                        enumerable: !0,
                                                                        configurable: !0,
                                                                        writable: !0
                                                                    }) : e[t] = r
                                                                })
                                                            }
                                                            return e
                                                        }({}, (t = r.sent()).data), Object.entries(t.data).forEach(function(e) {
                                                            var t, r = function(e) {
                                                                    if (Array.isArray(e)) return e
                                                                }(e) || function(e, t) {
                                                                    var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                                                    if (null != a) {
                                                                        var o = [],
                                                                            i = !0,
                                                                            s = !1;
                                                                        try {
                                                                            for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), o.length !== t); i = !0);
                                                                        } catch (e) {
                                                                            s = !0, r = e
                                                                        } finally {
                                                                            try {
                                                                                i || null == a.return || a.return()
                                                                            } finally {
                                                                                if (s) throw r
                                                                            }
                                                                        }
                                                                        return o
                                                                    }
                                                                }(e, 2) || n6(e, 2) || function() {
                                                                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                                                }(),
                                                                a = r[0],
                                                                o = r[1];
                                                            ((null == o ? void 0 : o.options) === void 0 || (null == o || null == (t = o.options) ? void 0 : t.length) === 0) && delete n[a]
                                                        }), [2, n]
                                                }
                                            })
                                        })()];
                                    case 1:
                                        return N(e.sent()), [3, 3];
                                    case 2:
                                        return e.sent(), n.warning(t(rp)), [3, 3];
                                    case 3:
                                        return [2]
                                }
                            })
                        })()
                    };
                (0, g.useEffect)(function() {
                    sL(function() {
                        var e;
                        return sH(this, function(r) {
                            switch (r.label) {
                                case 0:
                                    return r.trys.push([0, 2, , 3]), (0, k.fireEvent)(nE), [4, n4(function() {
                                        var e;
                                        return n5(this, function(t) {
                                            return e = {
                                                withCredentials: !0,
                                                url: "".concat(v.EnvironmentUrls.usersApi, "/v1/birthdate")
                                            }, [2, nn.httpService.get(e)]
                                        })
                                    })()];
                                case 1:
                                    return e = r.sent(), (0, k.fireEvent)(nA),
                                        function(e, t) {
                                            E(2, arguments);
                                            var n = A(e),
                                                r = A(t),
                                                a = j(n, r),
                                                o = Math.abs(function(e, t) {
                                                    E(2, arguments);
                                                    var n = A(e),
                                                        r = A(t);
                                                    return n.getFullYear() - r.getFullYear()
                                                }(n, r));
                                            n.setFullYear(1584), r.setFullYear(1584);
                                            var i = j(n, r) === -a,
                                                s = a * (o - Number(i));
                                            return 0 === s ? 0 : s
                                        }(new Date, new Date(e.data.birthYear, e.data.birthMonth - 1, e.data.birthDay)) >= 18 && o(!1), [3, 3];
                                case 2:
                                    return r.sent(), (0, k.fireEvent)(nj), n.warning(t(rp)), [3, 3];
                                case 3:
                                    return [2]
                            }
                        })
                    })(), sL(function() {
                        var e;
                        return sH(this, function(r) {
                            switch (r.label) {
                                case 0:
                                    return r.trys.push([0, 2, , 3]), [4, n4(function() {
                                        var e;
                                        return n5(this, function(t) {
                                            return e = {
                                                withCredentials: !0,
                                                url: "".concat(v.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/stripe/enabled-for-user")
                                            }, [2, nn.httpService.get(e)]
                                        })
                                    })()];
                                case 1:
                                    return d((e = r.sent()).data.isPaymentProviderEnabledForUser), h(e.data.isUserVpcApproved), [3, 3];
                                case 2:
                                    return r.sent(), n.warning(t(rp)), [3, 3];
                                case 3:
                                    return [2]
                            }
                        })
                    })(), sL(function() {
                        var e;
                        return sH(this, function(r) {
                            switch (r.label) {
                                case 0:
                                    return r.trys.push([0, 3, , 4]), [4, n4(function() {
                                        return n5(this, function(e) {
                                            return [2, v.Guac.callBehaviour("account-settings-ui")]
                                        })
                                    })()];
                                case 1:
                                    return w(r.sent()), [4, n4(function() {
                                        var e;
                                        return n5(this, function(t) {
                                            switch (t.label) {
                                                case 0:
                                                    return e = {
                                                        withCredentials: !0,
                                                        url: "".concat(v.EnvironmentUrls.userSettingsApi, "/v1/user-settings/metadata")
                                                    }, [4, nn.httpService.get(e)];
                                                case 1:
                                                    return [2, t.sent().data]
                                            }
                                        })
                                    })()];
                                case 2:
                                    return (e = r.sent()) && C(e), [3, 4];
                                case 3:
                                    return r.sent(), n.warning(t(rp)), [3, 4];
                                case 4:
                                    return [2]
                            }
                        })
                    })(), O(), sL(function() {
                        var e, t;
                        return sH(this, function(n) {
                            switch (n.label) {
                                case 0:
                                    return n.trys.push([0, 2, , 3]), [4, n4(function() {
                                        var e;
                                        return n5(this, function(t) {
                                            switch (t.label) {
                                                case 0:
                                                    return e = {
                                                        withCredentials: !0,
                                                        url: "".concat(v.EnvironmentUrls.apiGatewayUrl, "/parental-controls-api/v1/parental-controls/get-linked-parents")
                                                    }, [4, nn.httpService.get(e)];
                                                case 1:
                                                    return [2, t.sent().data]
                                            }
                                        })
                                    })()];
                                case 1:
                                    return l((null != (t = null == (e = n.sent().parents) ? void 0 : e.length) ? t : 0) > 0), [3, 3];
                                case 2:
                                    return n.sent(), l(!1), [3, 3];
                                case 3:
                                    return [2]
                            }
                        })
                    })(), n4(function() {
                        var e;
                        return n5(this, function(t) {
                            switch (t.label) {
                                case 0:
                                    return e = {
                                        withCredentials: !0,
                                        url: "".concat(v.EnvironmentUrls.apiGatewayUrl, "/v1/subscriptions/metadata")
                                    }, [4, nn.httpService.get(e)];
                                case 1:
                                    return [2, t.sent().data.isPaymentMethodChangesEnabled]
                            }
                        })
                    })().then(function(e) {
                        return M(e)
                    }).catch(function() {
                        return M(!1)
                    })
                }, []);
                var D = (0, g.useRef)(!0);
                (0, g.useEffect)(function() {
                    D.current && P && b && (D.current = !1, (null == b ? void 0 : b.renamePaymentsToSpendingTab) && i1(P.enablePurchases ? i_ : iR))
                }, [b, P]);
                var _ = null;
                switch (null == b ? void 0 : b.spendingNotificationDescription) {
                    case rt.GlobalTeen:
                        _ = (0, y.jsx)("div", {
                            className: "text-description text-new-line",
                            dangerouslySetInnerHTML: {
                                __html: t("Description.SpendingPaymentMethods", {
                                    linkStart: '<a href="https://help.roblox.com/hc/categories/200213820" class="text-link" target="_blank">',
                                    linkEnd: "</a>"
                                })
                            }
                        });
                        break;
                    case rt.U13:
                        _ = (0, y.jsx)("div", {
                            className: "text-description text-new-line",
                            children: t("Description.ChildSide.SpendingRestrictions")
                        });
                    case rt.O18:
                }
                return (0, y.jsxs)("div", {
                    className: "setting-container",
                    children: [(0, y.jsx)("h2", {
                        children: (null == b ? void 0 : b.renamePaymentsToSpendingTab) ? t("Heading.Tab.Spending") : t(ra)
                    }), _, (null == P ? void 0 : P.enablePurchases) !== void 0 && (0, y.jsx)(sw, {
                        enablePurchaseSettings: P.enablePurchases,
                        refetchEnablePurchaseSettings: O,
                        translate: t,
                        systemFeedbackService: n
                    }), (null == x ? void 0 : x.displaySpendLimitSettings) && (0, y.jsx)(sd, {
                        enablePurchaseSettings: null == P ? void 0 : P.enablePurchases,
                        translate: t,
                        systemFeedbackService: n
                    }), a && s && (0, y.jsx)(sT, {
                        translate: t,
                        systemFeedbackService: n
                    }), a && !U ? (0, y.jsx)(sE, {
                        translate: t,
                        systemFeedbackService: n
                    }) : (0, y.jsx)(iC, {
                        translate: t,
                        systemFeedbackService: n,
                        hideAddCardButton: a || !c,
                        shouldDisplaySavedPaymentMethods: c && p,
                        hideSavedPaymentMethodsIfNoSavedCards: a
                    }), (0, y.jsx)(sR, {
                        systemFeedbackService: n,
                        translate: t
                    }), !U && (0, y.jsx)(iP, {
                        translate: t,
                        systemFeedbackService: n
                    })]
                })
            };

            function sY(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            n(57);
            var sq = (0, x.withTranslations)(function(e) {
                var t, n = e.translate,
                    r = (t = (0, S.createSystemFeedback)(), function(e) {
                        if (Array.isArray(e)) return e
                    }(t) || function(e, t) {
                        var n, r, a = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != a) {
                            var o = [],
                                i = !0,
                                s = !1;
                            try {
                                for (a = a.call(e); !(i = (n = a.next()).done) && (o.push(n.value), o.length !== t); i = !0);
                            } catch (e) {
                                s = !0, r = e
                            } finally {
                                try {
                                    i || null == a.return || a.return()
                                } finally {
                                    if (s) throw r
                                }
                            }
                            return o
                        }
                    }(t, 2) || function(e, t) {
                        if (e) {
                            if ("string" == typeof e) return sY(e, 2);
                            var n = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return sY(e, t)
                        }
                    }(t, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    a = r[0],
                    o = r[1];
                return (0, y.jsxs)(w().Fragment, {
                    children: [(0, y.jsx)(sW, {
                        translate: n,
                        systemFeedbackService: o
                    }), (0, y.jsx)(a, {})]
                })
            }, {
                common: ["CommonUI.Features", "CommonUI.Controls", "Purchasing.RedeemGameCard", "Feature.Payment"],
                feature: "Feature.AccountSettings"
            });
            n(677), Object.assign(m(), {
                PaymentSetting: {
                    renderComponent: function(e) {
                        var t = document.getElementById(e);
                        return null !== t && ((0, b.renderWithErrorBoundary)((0, y.jsx)(sq, {}), t), !0)
                    }
                }
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("PaymentMethodsSetting");
//# debugId=f10d8bef-40ef-47ff-9bea-6e62980054f1
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/paymentMethodsSetting-d235e68d39f8d671.js.map
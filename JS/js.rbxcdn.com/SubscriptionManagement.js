! function() {
    try {
        var e = "undefined" != typeof window ? window : "undefined" != typeof global ? global : "undefined" != typeof globalThis ? globalThis : "undefined" != typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "aeec6e2c9e5e7174d78395738d7cffb98fb29789"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "cd31bacd-5c95-485c-a58a-f6f0aca0d6a9", e._sentryDebugIdIdentifier = "sentry-dbid-cd31bacd-5c95-485c-a58a-f6f0aca0d6a9")
    } catch (e) {}
}(),
function() {
    var e = {
            335: function(e, t, r) {
                var n, i;
                n = this, i = function(e, t) {
                    "use strict";

                    function r(e, t) {
                        var r = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var n = Object.getOwnPropertySymbols(e);
                            t && (n = n.filter(function(t) {
                                return Object.getOwnPropertyDescriptor(e, t).enumerable
                            })), r.push.apply(r, n)
                        }
                        return r
                    }

                    function n(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var n = null != arguments[t] ? arguments[t] : {};
                            t % 2 ? r(Object(n), !0).forEach(function(t) {
                                a(e, t, n[t])
                            }) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(n)) : r(Object(n)).forEach(function(t) {
                                Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(n, t))
                            })
                        }
                        return e
                    }

                    function i(e) {
                        return (i = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                            return typeof e
                        } : function(e) {
                            return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
                        })(e)
                    }

                    function a(e, t, r) {
                        return t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r, e
                    }

                    function o(e, t) {
                        return function(e) {
                            if (Array.isArray(e)) return e
                        }(e) || function(e, t) {
                            var r, n, i = e && ("undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"]);
                            if (null != i) {
                                var a = [],
                                    o = !0,
                                    s = !1;
                                try {
                                    for (i = i.call(e); !(o = (r = i.next()).done) && (a.push(r.value), !t || a.length !== t); o = !0);
                                } catch (e) {
                                    s = !0, n = e
                                } finally {
                                    try {
                                        o || null == i.return || i.return()
                                    } finally {
                                        if (s) throw n
                                    }
                                }
                                return a
                            }
                        }(e, t) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return s(e, t);
                                var r = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(e);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return s(e, t)
                            }
                        }(e, t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()
                    }

                    function s(e, t) {
                        (null == t || t > e.length) && (t = e.length);
                        for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                        return n
                    }
                    var c, u, l, d, p, f = {
                        exports: {}
                    };
                    f.exports = (function() {
                        if (p) return d;
                        p = 1;
                        var e = l ? u : (l = 1, u = "SECRET_DO_NOT_PASS_THIS_OR_YOU_WILL_BE_FIRED");

                        function t() {}

                        function r() {}
                        return r.resetWarningCache = t, d = function() {
                            function n(t, r, n, i, a, o) {
                                if (o !== e) {
                                    var s = Error("Calling PropTypes validators directly is not supported by the `prop-types` package. Use PropTypes.checkPropTypes() to call them. Read more at http://fb.me/use-check-prop-types");
                                    throw s.name = "Invariant Violation", s
                                }
                            }

                            function i() {
                                return n
                            }
                            n.isRequired = n;
                            var a = {
                                array: n,
                                bool: n,
                                func: n,
                                number: n,
                                object: n,
                                string: n,
                                symbol: n,
                                any: n,
                                arrayOf: i,
                                element: n,
                                elementType: n,
                                instanceOf: i,
                                node: n,
                                objectOf: i,
                                oneOf: i,
                                oneOfType: i,
                                shape: i,
                                exact: i,
                                checkPropTypes: r,
                                resetWarningCache: t
                            };
                            return a.PropTypes = a, a
                        }
                    })()();
                    var h = (c = f.exports) && c.__esModule && Object.prototype.hasOwnProperty.call(c, "default") ? c.default : c,
                        m = function(e, r, n) {
                            var i = !!n,
                                a = t.useRef(n);
                            t.useEffect(function() {
                                a.current = n
                            }, [n]), t.useEffect(function() {
                                if (!i || !e) return function() {};
                                var t = function() {
                                    a.current && a.current.apply(a, arguments)
                                };
                                return e.on(r, t),
                                    function() {
                                        e.off(r, t)
                                    }
                            }, [i, r, e, a])
                        },
                        b = function(e) {
                            var r = t.useRef(e);
                            return t.useEffect(function() {
                                r.current = e
                            }, [e]), r.current
                        },
                        y = function(e) {
                            return null !== e && "object" === i(e)
                        },
                        v = "[object Object]",
                        g = function e(t, r) {
                            if (!y(t) || !y(r)) return t === r;
                            var n = Array.isArray(t);
                            if (n !== Array.isArray(r)) return !1;
                            var i = Object.prototype.toString.call(t) === v;
                            if (i !== (Object.prototype.toString.call(r) === v)) return !1;
                            if (!i && !n) return t === r;
                            var a = Object.keys(t),
                                o = Object.keys(r);
                            if (a.length !== o.length) return !1;
                            for (var s = {}, c = 0; c < a.length; c += 1) s[a[c]] = !0;
                            for (var u = 0; u < o.length; u += 1) s[o[u]] = !0;
                            var l = Object.keys(s);
                            return l.length === a.length && l.every(function(n) {
                                return e(t[n], r[n])
                            })
                        },
                        w = function(e, t, r) {
                            return y(e) ? Object.keys(e).reduce(function(i, o) {
                                var s = !y(t) || !g(e[o], t[o]);
                                return r.includes(o) ? (s && console.warn("Unsupported prop change: options.".concat(o, " is not a mutable property.")), i) : s ? n(n({}, i || {}), {}, a({}, o, e[o])) : i
                            }, null) : null
                        },
                        P = "Invalid prop `stripe` supplied to `Elements`. We recommend using the `loadStripe` utility from `@stripe/stripe-js`. See https://stripe.com/docs/stripe-js/react#elements-props-stripe for details.",
                        S = function(e) {
                            var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : P;
                            if (null === e || y(e) && "function" == typeof e.elements && "function" == typeof e.createToken && "function" == typeof e.createPaymentMethod && "function" == typeof e.confirmCardPayment) return e;
                            throw Error(t)
                        },
                        x = function(e) {
                            var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : P;
                            if (y(e) && "function" == typeof e.then) return {
                                tag: "async",
                                stripePromise: Promise.resolve(e).then(function(e) {
                                    return S(e, t)
                                })
                            };
                            var r = S(e, t);
                            return null === r ? {
                                tag: "empty"
                            } : {
                                tag: "sync",
                                stripe: r
                            }
                        },
                        E = function(e) {
                            e && e._registerWrapper && e.registerAppInfo && (e._registerWrapper({
                                name: "react-stripe-js",
                                version: "2.8.1"
                            }), e.registerAppInfo({
                                name: "react-stripe-js",
                                version: "2.8.1",
                                url: "https://stripe.com/docs/stripe-js/react"
                            }))
                        },
                        T = t.createContext(null);
                    T.displayName = "ElementsContext";
                    var C = function(e, t) {
                            if (!e) throw Error("Could not find Elements context; You need to wrap the part of your app that ".concat(t, " in an <Elements> provider."));
                            return e
                        },
                        k = function(e) {
                            var r = e.stripe,
                                n = e.options,
                                i = e.children,
                                a = t.useMemo(function() {
                                    return x(r)
                                }, [r]),
                                s = o(t.useState(function() {
                                    return {
                                        stripe: "sync" === a.tag ? a.stripe : null,
                                        elements: "sync" === a.tag ? a.stripe.elements(n) : null
                                    }
                                }), 2),
                                c = s[0],
                                u = s[1];
                            t.useEffect(function() {
                                var e = !0,
                                    t = function(e) {
                                        u(function(t) {
                                            return t.stripe ? t : {
                                                stripe: e,
                                                elements: e.elements(n)
                                            }
                                        })
                                    };
                                return "async" !== a.tag || c.stripe ? "sync" !== a.tag || c.stripe || t(a.stripe) : a.stripePromise.then(function(r) {
                                        r && e && t(r)
                                    }),
                                    function() {
                                        e = !1
                                    }
                            }, [a, c, n]);
                            var l = b(r);
                            t.useEffect(function() {
                                null !== l && l !== r && console.warn("Unsupported prop change on Elements: You cannot change the `stripe` prop after setting it.")
                            }, [l, r]);
                            var d = b(n);
                            return t.useEffect(function() {
                                if (c.elements) {
                                    var e = w(n, d, ["clientSecret", "fonts"]);
                                    e && c.elements.update(e)
                                }
                            }, [n, d, c.elements]), t.useEffect(function() {
                                E(c.stripe)
                            }, [c.stripe]), t.createElement(T.Provider, {
                                value: c
                            }, i)
                        };
                    k.propTypes = {
                        stripe: h.any,
                        options: h.object
                    };
                    var A = function(e) {
                            return C(t.useContext(T), e)
                        },
                        I = function(e) {
                            return (0, e.children)(A("mounts <ElementsConsumer>"))
                        };
                    I.propTypes = {
                        children: h.func.isRequired
                    };
                    var D = ["on", "session"],
                        N = t.createContext(null);
                    N.displayName = "CustomCheckoutSdkContext";
                    var j = function(e, t) {
                            if (!e) throw Error("Could not find CustomCheckoutProvider context; You need to wrap the part of your app that ".concat(t, " in an <CustomCheckoutProvider> provider."));
                            return e
                        },
                        O = t.createContext(null);
                    O.displayName = "CustomCheckoutContext";
                    var M = function(e, t) {
                            if (!e) return null;
                            e.on, e.session;
                            var r = function(e, t) {
                                if (null == e) return {};
                                var r, n, i = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, i = {},
                                        a = Object.keys(e);
                                    for (n = 0; n < a.length; n++) r = a[n], t.indexOf(r) >= 0 || (i[r] = e[r]);
                                    return i
                                }(e, t);
                                if (Object.getOwnPropertySymbols) {
                                    var a = Object.getOwnPropertySymbols(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r])
                                }
                                return i
                            }(e, D);
                            return t ? n(n({}, r), t) : n(n({}, r), e.session())
                        },
                        R = function(e) {
                            var r = e.stripe,
                                n = e.options,
                                i = e.children,
                                a = t.useMemo(function() {
                                    return x(r, "Invalid prop `stripe` supplied to `CustomCheckoutProvider`. We recommend using the `loadStripe` utility from `@stripe/stripe-js`. See https://stripe.com/docs/stripe-js/react#elements-props-stripe for details.")
                                }, [r]),
                                s = o(t.useState(null), 2),
                                c = s[0],
                                u = s[1],
                                l = o(t.useState(function() {
                                    return {
                                        stripe: "sync" === a.tag ? a.stripe : null,
                                        customCheckoutSdk: null
                                    }
                                }), 2),
                                d = l[0],
                                p = l[1],
                                f = function(e, t) {
                                    p(function(r) {
                                        return r.stripe && r.customCheckoutSdk ? r : {
                                            stripe: e,
                                            customCheckoutSdk: t
                                        }
                                    })
                                },
                                h = t.useRef(!1);
                            t.useEffect(function() {
                                var e = !0;
                                return "async" !== a.tag || d.stripe ? "sync" === a.tag && a.stripe && !h.current && (h.current = !0, a.stripe.initCustomCheckout(n).then(function(e) {
                                        e && (f(a.stripe, e), e.on("change", u))
                                    })) : a.stripePromise.then(function(t) {
                                        t && e && !h.current && (h.current = !0, t.initCustomCheckout(n).then(function(e) {
                                            e && (f(t, e), e.on("change", u))
                                        }))
                                    }),
                                    function() {
                                        e = !1
                                    }
                            }, [a, d, n, u]);
                            var m = b(r);
                            t.useEffect(function() {
                                null !== m && m !== r && console.warn("Unsupported prop change on CustomCheckoutProvider: You cannot change the `stripe` prop after setting it.")
                            }, [m, r]);
                            var v = b(n);
                            t.useEffect(function() {
                                if (d.customCheckoutSdk) {
                                    !n.clientSecret || y(v) || g(n.clientSecret, v.clientSecret) || console.warn("Unsupported prop change: options.client_secret is not a mutable property.");
                                    var e, t, r = null == v || null == (e = v.elementsOptions) ? void 0 : e.appearance,
                                        i = null == n || null == (t = n.elementsOptions) ? void 0 : t.appearance;
                                    i && !g(i, r) && d.customCheckoutSdk.changeAppearance(i)
                                }
                            }, [n, v, d.customCheckoutSdk]), t.useEffect(function() {
                                E(d.stripe)
                            }, [d.stripe]);
                            var w = t.useMemo(function() {
                                return M(d.customCheckoutSdk, c)
                            }, [d.customCheckoutSdk, c]);
                            return d.customCheckoutSdk ? t.createElement(N.Provider, {
                                value: d
                            }, t.createElement(O.Provider, {
                                value: w
                            }, i)) : null
                        };
                    R.propTypes = {
                        stripe: h.any,
                        options: h.shape({
                            clientSecret: h.string.isRequired,
                            elementsOptions: h.object
                        }).isRequired
                    };
                    var U = function(e) {
                            var r = t.useContext(N),
                                n = t.useContext(T);
                            if (r && n) throw Error("You cannot wrap the part of your app that ".concat(e, " in both <CustomCheckoutProvider> and <Elements> providers."));
                            return r ? j(r, e) : C(n, e)
                        },
                        L = function(e, r) {
                            var n = "".concat(e.charAt(0).toUpperCase() + e.slice(1), "Element"),
                                i = r ? function(e) {
                                    U("mounts <".concat(n, ">"));
                                    var r = e.id,
                                        i = e.className;
                                    return t.createElement("div", {
                                        id: r,
                                        className: i
                                    })
                                } : function(r) {
                                    var i, a = r.id,
                                        s = r.className,
                                        c = r.options,
                                        u = void 0 === c ? {} : c,
                                        l = r.onBlur,
                                        d = r.onFocus,
                                        p = r.onReady,
                                        f = r.onChange,
                                        h = r.onEscape,
                                        y = r.onClick,
                                        v = r.onLoadError,
                                        g = r.onLoaderStart,
                                        P = r.onNetworksChange,
                                        S = r.onConfirm,
                                        x = r.onCancel,
                                        E = r.onShippingAddressChange,
                                        T = r.onShippingRateChange,
                                        C = U("mounts <".concat(n, ">")),
                                        k = "elements" in C ? C.elements : null,
                                        A = "customCheckoutSdk" in C ? C.customCheckoutSdk : null,
                                        I = o(t.useState(null), 2),
                                        D = I[0],
                                        N = I[1],
                                        j = t.useRef(null),
                                        O = t.useRef(null);
                                    m(D, "blur", l), m(D, "focus", d), m(D, "escape", h), m(D, "click", y), m(D, "loaderror", v), m(D, "loaderstart", g), m(D, "networkschange", P), m(D, "confirm", S), m(D, "cancel", x), m(D, "shippingaddresschange", E), m(D, "shippingratechange", T), m(D, "change", f), p && (i = "expressCheckout" === e ? p : function() {
                                        p(D)
                                    }), m(D, "ready", i), t.useLayoutEffect(function() {
                                        if (null === j.current && null !== O.current && (k || A)) {
                                            var t = null;
                                            A ? t = A.createElement(e, u) : k && (t = k.create(e, u)), j.current = t, N(t), t && t.mount(O.current)
                                        }
                                    }, [k, A, u]);
                                    var M = b(u);
                                    return t.useEffect(function() {
                                        if (j.current) {
                                            var e = w(u, M, ["paymentRequest"]);
                                            e && "update" in j.current && j.current.update(e)
                                        }
                                    }, [u, M]), t.useLayoutEffect(function() {
                                        return function() {
                                            if (j.current && "function" == typeof j.current.destroy) try {
                                                j.current.destroy(), j.current = null
                                            } catch (e) {}
                                        }
                                    }, []), t.createElement("div", {
                                        id: a,
                                        className: s,
                                        ref: O
                                    })
                                };
                            return i.propTypes = {
                                id: h.string,
                                className: h.string,
                                onChange: h.func,
                                onBlur: h.func,
                                onFocus: h.func,
                                onReady: h.func,
                                onEscape: h.func,
                                onClick: h.func,
                                onLoadError: h.func,
                                onLoaderStart: h.func,
                                onNetworksChange: h.func,
                                onConfirm: h.func,
                                onCancel: h.func,
                                onShippingAddressChange: h.func,
                                onShippingRateChange: h.func,
                                options: h.object
                            }, i.displayName = n, i.__elementType = e, i
                        },
                        _ = "undefined" == typeof window,
                        B = t.createContext(null);
                    B.displayName = "EmbeddedCheckoutProviderContext";
                    var Y = function() {
                            var e = t.useContext(B);
                            if (!e) throw Error("<EmbeddedCheckout> must be used within <EmbeddedCheckoutProvider>");
                            return e
                        },
                        F = _ ? function(e) {
                            var r = e.id,
                                n = e.className;
                            return Y(), t.createElement("div", {
                                id: r,
                                className: n
                            })
                        } : function(e) {
                            var r = e.id,
                                n = e.className,
                                i = Y().embeddedCheckout,
                                a = t.useRef(!1),
                                o = t.useRef(null);
                            return t.useLayoutEffect(function() {
                                return !a.current && i && null !== o.current && (i.mount(o.current), a.current = !0),
                                    function() {
                                        if (a.current && i) try {
                                            i.unmount(), a.current = !1
                                        } catch (e) {}
                                    }
                            }, [i]), t.createElement("div", {
                                ref: o,
                                id: r,
                                className: n
                            })
                        },
                        H = L("auBankAccount", _),
                        q = L("card", _),
                        W = L("cardNumber", _),
                        G = L("cardExpiry", _),
                        V = L("cardCvc", _),
                        K = L("fpxBank", _),
                        z = L("iban", _),
                        X = L("idealBank", _),
                        Q = L("p24Bank", _),
                        $ = L("epsBank", _),
                        J = L("payment", _),
                        Z = L("expressCheckout", _),
                        ee = L("currencySelector", _),
                        et = L("paymentRequestButton", _),
                        er = L("linkAuthentication", _),
                        en = L("address", _),
                        ei = L("shippingAddress", _),
                        ea = L("paymentMethodMessaging", _),
                        eo = L("affirmMessage", _),
                        es = L("afterpayClearpayMessage", _);
                    e.AddressElement = en, e.AffirmMessageElement = eo, e.AfterpayClearpayMessageElement = es, e.AuBankAccountElement = H, e.CardCvcElement = V, e.CardElement = q, e.CardExpiryElement = G, e.CardNumberElement = W, e.CurrencySelectorElement = ee, e.CustomCheckoutProvider = R, e.Elements = k, e.ElementsConsumer = I, e.EmbeddedCheckout = F, e.EmbeddedCheckoutProvider = function(e) {
                        var r = e.stripe,
                            n = e.options,
                            i = e.children,
                            a = t.useMemo(function() {
                                return x(r, "Invalid prop `stripe` supplied to `EmbeddedCheckoutProvider`. We recommend using the `loadStripe` utility from `@stripe/stripe-js`. See https://stripe.com/docs/stripe-js/react#elements-props-stripe for details.")
                            }, [r]),
                            s = t.useRef(null),
                            c = t.useRef(null),
                            u = o(t.useState({
                                embeddedCheckout: null
                            }), 2),
                            l = u[0],
                            d = u[1];
                        t.useEffect(function() {
                            if (!c.current && !s.current) {
                                var e = function(e) {
                                    c.current || s.current || (c.current = e, s.current = c.current.initEmbeddedCheckout(n).then(function(e) {
                                        d({
                                            embeddedCheckout: e
                                        })
                                    }))
                                };
                                "async" === a.tag && !c.current && (n.clientSecret || n.fetchClientSecret) ? a.stripePromise.then(function(t) {
                                    t && e(t)
                                }) : "sync" === a.tag && !c.current && (n.clientSecret || n.fetchClientSecret) && e(a.stripe)
                            }
                        }, [a, n, l, c]), t.useEffect(function() {
                            return function() {
                                l.embeddedCheckout ? (s.current = null, l.embeddedCheckout.destroy()) : s.current && s.current.then(function() {
                                    s.current = null, l.embeddedCheckout && l.embeddedCheckout.destroy()
                                })
                            }
                        }, [l.embeddedCheckout]), t.useEffect(function() {
                            E(c)
                        }, [c]);
                        var p = b(r);
                        t.useEffect(function() {
                            null !== p && p !== r && console.warn("Unsupported prop change on EmbeddedCheckoutProvider: You cannot change the `stripe` prop after setting it.")
                        }, [p, r]);
                        var f = b(n);
                        return t.useEffect(function() {
                            if (null != f) {
                                if (null == n) return void console.warn("Unsupported prop change on EmbeddedCheckoutProvider: You cannot unset options after setting them.");
                                void 0 === n.clientSecret && void 0 === n.fetchClientSecret && console.warn("Invalid props passed to EmbeddedCheckoutProvider: You must provide one of either `options.fetchClientSecret` or `options.clientSecret`."), null != f.clientSecret && n.clientSecret !== f.clientSecret && console.warn("Unsupported prop change on EmbeddedCheckoutProvider: You cannot change the client secret after setting it. Unmount and create a new instance of EmbeddedCheckoutProvider instead."), null != f.fetchClientSecret && n.fetchClientSecret !== f.fetchClientSecret && console.warn("Unsupported prop change on EmbeddedCheckoutProvider: You cannot change fetchClientSecret after setting it. Unmount and create a new instance of EmbeddedCheckoutProvider instead."), null != f.onComplete && n.onComplete !== f.onComplete && console.warn("Unsupported prop change on EmbeddedCheckoutProvider: You cannot change the onComplete option after setting it."), null != f.onShippingDetailsChange && n.onShippingDetailsChange !== f.onShippingDetailsChange && console.warn("Unsupported prop change on EmbeddedCheckoutProvider: You cannot change the onShippingDetailsChange option after setting it."), null != f.onLineItemsChange && n.onLineItemsChange !== f.onLineItemsChange && console.warn("Unsupported prop change on EmbeddedCheckoutProvider: You cannot change the onLineItemsChange option after setting it.")
                            }
                        }, [f, n]), t.createElement(B.Provider, {
                            value: l
                        }, i)
                    }, e.EpsBankElement = $, e.ExpressCheckoutElement = Z, e.FpxBankElement = K, e.IbanElement = z, e.IdealBankElement = X, e.LinkAuthenticationElement = er, e.P24BankElement = Q, e.PaymentElement = J, e.PaymentMethodMessagingElement = ea, e.PaymentRequestButtonElement = et, e.ShippingAddressElement = ei, e.useCustomCheckout = function() {
                        j(t.useContext(N), "calls useCustomCheckout()");
                        var e = t.useContext(O);
                        if (!e) throw Error("Could not find CustomCheckout Context; You need to wrap the part of your app that calls useCustomCheckout() in an <CustomCheckoutProvider> provider.");
                        return e
                    }, e.useElements = function() {
                        return A("calls useElements()").elements
                    }, e.useStripe = function() {
                        return U("calls useStripe()").stripe
                    }
                }, "object" == (t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) ? i(t, r(609)) : "function" == typeof define && define.amd ? define(["exports", "react"], i) : i((n = "undefined" != typeof globalThis ? globalThis : n || self).ReactStripe = {}, n.React)
            },
            275: function(e, t) {
                "use strict";

                function r(e) {
                    return (r = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                        return typeof e
                    } : function(e) {
                        return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
                    })(e)
                }
                var n, i = "https://js.stripe.com/v3",
                    a = /^https:\/\/js\.stripe\.com\/v3\/?(\?.*)?$/,
                    o = "loadStripe.setLoadParameters was called but an existing Stripe.js script already exists in the document; existing script parameters will be used",
                    s = function() {
                        for (var e = document.querySelectorAll('script[src^="'.concat(i, '"]')), t = 0; t < e.length; t++) {
                            var r = e[t];
                            if (a.test(r.src)) return r
                        }
                        return null
                    },
                    c = function(e) {
                        var t = e && !e.advancedFraudSignals ? "?advancedFraudSignals=false" : "",
                            r = document.createElement("script");
                        r.src = "".concat(i).concat(t);
                        var n = document.head || document.body;
                        if (!n) throw Error("Expected document.body not to be null. Stripe.js requires a <body> element.");
                        return n.appendChild(r), r
                    },
                    u = function(e, t) {
                        e && e._registerWrapper && e._registerWrapper({
                            name: "stripe-js",
                            version: "3.4.1",
                            startTime: t
                        })
                    },
                    l = null,
                    d = null,
                    p = null,
                    f = function(e, t, r) {
                        if (null === e) return null;
                        var n = e.apply(void 0, t);
                        return u(n, r), n
                    },
                    h = function(e) {
                        var t = "invalid load parameters; expected object of shape\n\n    {advancedFraudSignals: boolean}\n\nbut received\n\n    ".concat(JSON.stringify(e), "\n");
                        if (null === e || "object" !== r(e)) throw Error(t);
                        if (1 === Object.keys(e).length && "boolean" == typeof e.advancedFraudSignals) return e;
                        throw Error(t)
                    },
                    m = !1,
                    b = function() {
                        for (var e, t = arguments.length, r = Array(t), i = 0; i < t; i++) r[i] = arguments[i];
                        m = !0;
                        var a = Date.now();
                        return (e = n, null !== l ? l : (l = new Promise(function(t, r) {
                            if ("undefined" == typeof window || "undefined" == typeof document) return void t(null);
                            if (window.Stripe && e && console.warn(o), window.Stripe) return void t(window.Stripe);
                            try {
                                var n, i = s();
                                i && e ? console.warn(o) : i ? i && null !== p && null !== d && (i.removeEventListener("load", p), i.removeEventListener("error", d), null == (n = i.parentNode) || n.removeChild(i), i = c(e)) : i = c(e), p = function() {
                                    window.Stripe ? t(window.Stripe) : r(Error("Stripe.js not available"))
                                }, d = function() {
                                    r(Error("Failed to load Stripe.js"))
                                }, i.addEventListener("load", p), i.addEventListener("error", d)
                            } catch (e) {
                                r(e);
                                return
                            }
                        })).catch(function(e) {
                            return l = null, Promise.reject(e)
                        })).then(function(e) {
                            return f(e, r, a)
                        })
                    };
                b.setLoadParameters = function(e) {
                    if (!(m && n && Object.keys(h(e)).reduce(function(t, r) {
                            var i;
                            return t && e[r] === (null == (i = n) ? void 0 : i[r])
                        }, !0))) {
                        if (m) throw Error("You cannot change load parameters after calling loadStripe");
                        n = h(e)
                    }
                }, t.loadStripe = b
            },
            687: function(e, t, r) {
                e.exports = r(275)
            },
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
                    var r = {}.hasOwnProperty;

                    function n() {
                        for (var e = "", a = 0; a < arguments.length; a++) {
                            var o = arguments[a];
                            o && (e = i(e, function(e) {
                                if ("string" == typeof e || "number" == typeof e) return e;
                                if ((void 0 === e ? "undefined" : t(e)) !== "object") return "";
                                if (Array.isArray(e)) return n.apply(null, e);
                                if (e.toString !== Object.prototype.toString && !e.toString.toString().includes("[native code]")) return e.toString();
                                var a = "";
                                for (var o in e) r.call(e, o) && e[o] && (a = i(a, o));
                                return a
                            }(o)))
                        }
                        return e
                    }

                    function i(e, t) {
                        return t ? e ? e + " " + t : e + t : e
                    }
                    e.exports ? (n.default = n, e.exports = n) : "function" == typeof define && "object" === t(define.amd) && define.amd ? define("classnames", [], function() {
                        return n
                    }) : window.classNames = n
                }()
            },
            964: function(e, t) {
                "use strict";
                Object.defineProperty(t, "__esModule", {
                    value: !0
                });
                var r, n, i, a = {
                        exports: {}
                    },
                    o = a.exports = {};

                function s() {
                    throw Error("setTimeout has not been defined")
                }

                function c() {
                    throw Error("clearTimeout has not been defined")
                }
                try {
                    r = "function" == typeof setTimeout ? setTimeout : s
                } catch (e) {
                    r = s
                }
                try {
                    n = "function" == typeof clearTimeout ? clearTimeout : c
                } catch (e) {
                    n = c
                }

                function u(e) {
                    if (r === setTimeout) return setTimeout(e, 0);
                    if ((r === s || !r) && setTimeout) return r = setTimeout, setTimeout(e, 0);
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
                var l = [],
                    d = !1,
                    p = -1;

                function f() {
                    d && i && (d = !1, i.length ? l = i.concat(l) : p = -1, l.length && h())
                }

                function h() {
                    if (!d) {
                        var e = u(f);
                        d = !0;
                        for (var t = l.length; t;) {
                            for (i = l, l = []; ++p < t;) i && i[p].run();
                            p = -1, t = l.length
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

                function m(e, t) {
                    this.fun = e, this.array = t
                }

                function b() {}

                function y() {}
                o.nextTick = function(e) {
                    var t = Array(arguments.length - 1);
                    if (arguments.length > 1)
                        for (var r = 1; r < arguments.length; r++) t[r - 1] = arguments[r];
                    l.push(new m(e, t)), 1 !== l.length || d || u(h)
                }, m.prototype.run = function() {
                    this.fun.apply(null, this.array)
                }, o.title = "browser", o.browser = !0, o.env = {}, o.argv = [], o.version = "", o.versions = {}, o.on = b, o.addListener = b, o.once = b, o.off = b, o.removeListener = b, o.removeAllListeners = b, o.emit = b, o.prependListener = b, o.prependOnceListener = b, o.listeners = function(e) {
                    return []
                }, o.binding = function(e) {
                    throw Error("process.binding is not supported")
                }, o.cwd = function() {
                    return "/"
                }, o.chdir = function(e) {
                    throw Error("process.chdir is not supported")
                }, o.umask = function() {
                    return 0
                };
                var v = a.exports.browser,
                    g = a.exports.binding,
                    w = {},
                    P = "browser",
                    S = "browser",
                    x = "browser",
                    E = [],
                    T = {
                        nextTick: a.exports.nextTick,
                        title: a.exports.title,
                        browser: v,
                        env: a.exports.env,
                        argv: a.exports.argv,
                        version: a.exports.version,
                        versions: a.exports.versions,
                        on: a.exports.on,
                        addListener: a.exports.addListener,
                        once: a.exports.once,
                        off: a.exports.off,
                        removeListener: a.exports.removeListener,
                        removeAllListeners: a.exports.removeAllListeners,
                        emit: a.exports.emit,
                        emitWarning: y,
                        prependListener: a.exports.prependListener,
                        prependOnceListener: a.exports.prependOnceListener,
                        listeners: a.exports.listeners,
                        binding: g,
                        cwd: a.exports.cwd,
                        chdir: a.exports.chdir,
                        umask: a.exports.umask,
                        exit: y,
                        pid: 1,
                        features: w,
                        kill: y,
                        dlopen: y,
                        uptime: y,
                        memoryUsage: y,
                        uvCounters: y,
                        platform: P,
                        arch: S,
                        execPath: x,
                        execArgv: E
                    };
                t.addListener = a.exports.addListener, t.arch = S, t.argv = a.exports.argv, t.binding = g, t.browser = v, t.chdir = a.exports.chdir, t.cwd = a.exports.cwd, t.default = T, t.dlopen = y, t.emit = a.exports.emit, t.emitWarning = y, t.env = a.exports.env, t.execArgv = E, t.execPath = x, t.exit = y, t.features = w, t.kill = y, t.listeners = a.exports.listeners, t.memoryUsage = y, t.nextTick = a.exports.nextTick, t.off = a.exports.off, t.on = a.exports.on, t.once = a.exports.once, t.pid = 1, t.platform = P, t.prependListener = a.exports.prependListener, t.prependOnceListener = a.exports.prependOnceListener, t.removeAllListeners = a.exports.removeAllListeners, t.removeListener = a.exports.removeListener, t.title = a.exports.title, t.umask = a.exports.umask, t.uptime = y, t.uvCounters = y, t.version = a.exports.version, t.versions = a.exports.versions, t = e.exports = T
            },
            201: function(e, t, r) {
                "use strict";
                e.exports = {}
            },
            172: function(e, t, r) {
                "use strict";
                e.exports = {}
            },
            563: function(e, t, r) {
                "use strict";
                e.exports = {}
            },
            664: function(e, t, r) {
                "use strict";
                e.exports = {}
            },
            746: function(e, t, r) {
                "use strict";
                e.exports = {}
            },
            534: function(e, t, r) {
                "use strict";
                e.exports = {}
            },
            553: function(e, t, r) {
                "use strict";
                e.exports = {}
            },
            999: function(e, t, r) {
                "use strict";
                e.exports = {}
            },
            908: function(e, t, r) {
                "use strict";
                e.exports = {}
            },
            412: function(e, t, r) {
                "use strict";
                e.exports = {}
            },
            97: function(e, t, r) {
                "use strict";
                e.exports = {}
            },
            887: function(e, t, r) {
                "use strict";
                e.exports = {}
            },
            582: function(e, t, r) {
                "use strict";
                e.exports = {}
            },
            609: function(e) {
                "use strict";
                e.exports = window.React
            }
        },
        t = {};

    function r(n) {
        var i = t[n];
        if (void 0 !== i) return i.exports;
        var a = t[n] = {
            exports: {}
        };
        return e[n].call(a.exports, a, a.exports, r), a.exports
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
    }, r.k = function(e) {
        return "" + e + ".css"
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
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, r.rv = function() {
        return "1.5.7"
    }, r.g.importScripts && (n = r.g.location + "");
    var n, i = r.g.document;
    if (!n && i && (i.currentScript && "SCRIPT" === i.currentScript.tagName.toUpperCase() && (n = i.currentScript.src), !n)) {
        var a = i.getElementsByTagName("script");
        if (a.length)
            for (var o = a.length - 1; o > -1 && (!n || !/^http(s?):/.test(n));) n = a[o--].src
    }
    if (!n) throw Error("Automatic publicPath is not supported in this browser");
    r.p = n.replace(/^blob:/, "").replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/[^\/]+$/, "/"), r.ruid = "bundler=rspack@1.5.7",
        function() {
            "use strict";
            var e, t, n, i, a, o, s, c, u, l, d, p, f, h, m, b, y, v, g = window.ReactJSX;
            r(201);
            var w = r(609),
                P = r.n(w),
                S = window.ReactDOM,
                x = window.Roblox,
                E = r.n(x),
                T = window.ReactUtilities,
                C = window.ReactRouterDOM,
                k = window.Roblox.ui,
                A = {
                    common: ["CommonUI.Features", "CommonUI.Controls", "Feature.RobloxSubscription"],
                    feature: "Feature.AccountSettings"
                };
            r(97);
            var I = window.EventTracker,
                D = window.HeaderScripts,
                N = window.CoreUtilities;

            function j(e, t) {
                return null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            r(964);
            var O = function(e, t) {
                return (O = Object.setPrototypeOf || j({
                    __proto__: []
                }, Array) && function(e, t) {
                    e.__proto__ = t
                } || function(e, t) {
                    for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
                })(e, t)
            };

            function M(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                function r() {
                    this.constructor = e
                }
                O(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
            }
            var R = function() {
                return (R = Object.assign || function(e) {
                    for (var t, r = 1, n = arguments.length; r < n; r++)
                        for (var i in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
                    return e
                }).apply(this, arguments)
            };

            function U(e, t, r, n) {
                return new(r || (r = Promise))(function(i, a) {
                    function o(e) {
                        try {
                            c(n.next(e))
                        } catch (e) {
                            a(e)
                        }
                    }

                    function s(e) {
                        try {
                            c(n.throw(e))
                        } catch (e) {
                            a(e)
                        }
                    }

                    function c(e) {
                        var t;
                        e.done ? i(e.value) : (j(t = e.value, r) ? t : new r(function(e) {
                            e(t)
                        })).then(o, s)
                    }
                    c((n = n.apply(e, t || [])).next())
                })
            }

            function L(e, t) {
                var r, n, i, a = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return o.next = s(0), o.throw = s(1), o.return = s(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
                    return this
                }), o;

                function s(s) {
                    return function(c) {
                        var u = [s, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; o && (o = 0, u[0] && (a = 0)), a;) try {
                            if (r = 1, n && (i = 2 & u[0] ? n.return : u[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, u[1])).done) return i;
                            switch (n = 0, i && (u = [2 & u[0], i.value]), u[0]) {
                                case 0:
                                case 1:
                                    i = u;
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
                                    if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!i || u[1] > i[0] && u[1] < i[3])) {
                                        a.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && a.label < i[1]) {
                                        a.label = i[1], i = u;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(u);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            u = t.call(e, a)
                        } catch (e) {
                            u = [6, e], n = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            "function" == typeof SuppressedError && SuppressedError;
            var _, B = function(e) {
                    return e.replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/\d+/, "/number")
                },
                Y = function(e, t) {
                    return !1 === t.ok && !1 === [401, 403, 404].includes(t.status) && e(Error("Network error"), {
                        tags: {
                            apiUrl: B(t.url),
                            apiStatus: null == t ? void 0 : t.status,
                            cors: !1
                        }
                    }), t
                },
                F = function(e, t) {
                    e(Error("Network error"), {
                        tags: {
                            apiUrl: B(t),
                            cors: !0
                        }
                    })
                },
                H = function() {
                    function e(e) {
                        this.captureException = e
                    }
                    return e.prototype.post = function(e) {
                        return U(this, void 0, void 0, function() {
                            return L(this, function(t) {
                                return [2, Y(this.captureException, e.response)]
                            })
                        })
                    }, e.prototype.onError = function(e) {
                        return U(this, void 0, void 0, function() {
                            return L(this, function(t) {
                                return F(this.captureException, e.url), [2]
                            })
                        })
                    }, e
                }(),
                q = function(e) {
                    if (document) {
                        var t, r, n = document.getElementById("hba-frame");
                        return null === n && ((t = document.createElement("iframe")).id = "hba-frame", t.style.cssText = "position: fixed; top: 0; left: 0; width: 0%; height: 0%; z-index: -1", t.src = "https://www.".concat(e, "/hba/iframe"), r = t, n = (null == document ? void 0 : document.body) ? document.body.appendChild(r) : null), n
                    }
                    return null
                },
                W = function() {
                    var e = window.location.hostname.split(".").slice(0, -2).join(".");
                    return e.includes("create") ? "creator_hub" : e.includes("advertise") ? "ads_manager" : "creator_hub"
                },
                G = function(e, t) {
                    try {
                        fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                            method: "POST",
                            body: JSON.stringify({
                                name: "load_time_hba_frame",
                                value: t,
                                labelValues: {
                                    origin_site: W()
                                }
                            })
                        })
                    } catch (e) {}
                },
                V = function(e, t) {
                    try {
                        fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                            method: "POST",
                            body: JSON.stringify({
                                name: "response_time_hba_frame",
                                value: t,
                                labelValues: {
                                    origin_site: W()
                                }
                            })
                        })
                    } catch (e) {}
                },
                K = function(e, t, r) {
                    return void 0 === r && (r = 1500), new Promise(function(n, i) {
                        var a, o, s = performance.now(),
                            c = window.setTimeout(function() {
                                G(e, performance.now() - s),
                                    function(e) {
                                        try {
                                            fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                                                method: "POST",
                                                body: JSON.stringify({
                                                    name: "event_hba_frame",
                                                    value: 1,
                                                    labelValues: {
                                                        event_type: "FrameLoadTimedOut",
                                                        origin_site: W()
                                                    }
                                                })
                                            })
                                        } catch (e) {}
                                    }(e), i(Error("Promise timed out after ".concat(r, " ms")))
                            }, r),
                            u = a = function(t) {
                                var r = t.data;
                                t.origin === "https://www.".concat(e) && "dataFromHbaFrame" === r.msg && "loaded" === r.data.type && (window.removeEventListener("message", a, !1), window.clearTimeout(c), G(e, performance.now() - s), n())
                            };
                        window.addEventListener("message", u, !1), null == (o = t.contentWindow) || o.postMessage({
                            msg: "checkLoadedRequest"
                        }, "https://www.".concat(e))
                    })
                },
                z = function(e, t, r, n, i, a, o) {
                    var s;
                    if (void 0 === o && (o = 100), window) {
                        var c, u = performance.now(),
                            l = window.setTimeout(function() {
                                V(r, performance.now() - u),
                                    function(e) {
                                        try {
                                            fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                                                method: "POST",
                                                body: JSON.stringify({
                                                    name: "event_hba_frame",
                                                    value: 1,
                                                    labelValues: {
                                                        event_type: "FrameResponseTimedOut",
                                                        origin_site: W()
                                                    }
                                                })
                                            })
                                        } catch (e) {}
                                    }(r), e({
                                        url: i.url,
                                        init: i.init
                                    })
                            }, o),
                            d = c = function(t) {
                                var n = t.data,
                                    o = i.url,
                                    s = i.init;
                                if (t.origin === "https://www.".concat(r) && "dataFromHbaFrame" === n.msg && "batHeader" === n.data.type && (!n.data.identifier || n.data.identifier === a))
                                    if (!n.data.isError && n.data.batHeader) {
                                        window.clearTimeout(l), window.removeEventListener("message", c, !1), V(r, performance.now() - u);
                                        var d = n.data.batHeader;
                                        e({
                                            url: o,
                                            init: R(R({}, s), {
                                                headers: R(R({}, s.headers), {
                                                    "x-bound-auth-token": d["x-bound-auth-token"]
                                                })
                                            })
                                        })
                                    } else window.clearTimeout(l), window.removeEventListener("message", c, !1), V(r, performance.now() - u), e({
                                        url: o,
                                        init: s
                                    })
                            };
                        window.addEventListener("message", d, !1), null == (s = n.contentWindow) || s.postMessage({
                            msg: "signSubdomainRequest",
                            identifier: a,
                            serializedSubdomainRequestData: JSON.stringify({
                                url: i.url,
                                requestInit: i.init
                            })
                        }, "https://www.".concat(r))
                    }
                },
                X = function() {
                    return crypto.randomUUID()
                },
                Q = function() {
                    function e(e, t, r) {
                        void 0 === t && (t = 1500), void 0 === r && (r = 100), this.robloxSiteDomain = e, this.hbaFrameAlreadyLoaded = !1, this.hbaFrameLoadFailed = !1, this.hbaFrame = null, this.loadTimeOut = t, this.dataTimeOut = r
                    }
                    return e.prototype.getOrCreateHbaFrame = function() {
                        return q(this.robloxSiteDomain)
                    }, e.prototype.pre = function(e) {
                        var t = this;
                        return new Promise(function(r, n) {
                            var i = e.url,
                                a = e.init;
                            if (t.hbaFrame = t.getOrCreateHbaFrame(), null !== t.hbaFrame) {
                                var o = X();
                                t.hbaFrameAlreadyLoaded ? z(r, 0, t.robloxSiteDomain, t.hbaFrame, e, o, t.dataTimeOut) : t.hbaFrameLoadFailed ? r({
                                    url: i,
                                    init: a
                                }) : K(t.robloxSiteDomain, t.hbaFrame, t.loadTimeOut).then(function() {
                                    t.hbaFrame ? (t.hbaFrameAlreadyLoaded = !0, z(r, 0, t.robloxSiteDomain, t.hbaFrame, e, o, t.dataTimeOut)) : r({
                                        url: i,
                                        init: a
                                    })
                                }).catch(function() {
                                    t.hbaFrameLoadFailed = !0, r({
                                        url: i,
                                        init: a
                                    })
                                })
                            } else r({
                                url: i,
                                init: a
                            })
                        })
                    }, e
                }();
            (t = _ || (_ = {})).UNKNOWN = "unknown", t.INVALIDATED = "invalidated", t.ABANDONED = "abandoned", t.LOADFAILED = "loadfailed";
            var $ = function(e) {
                    function t(t) {
                        var r = e.call(this, "challenge error for challenge kind ".concat(t.kind)) || this;
                        return r.parameters = t, r
                    }
                    return M(t, e), t.prototype.match = function(e) {
                        return this.parameters.kind === e.parameters.kind && JSON.stringify(this.parameters.data) === JSON.stringify(e.parameters.data)
                    }, t.prototype.matchAbandoned = function(e) {
                        return this.match(e) && e.parameters.kind === _.ABANDONED
                    }, t
                }(Error),
                J = "rblx-challenge-id",
                Z = "rblx-challenge-type",
                ee = "rblx-challenge-metadata",
                et = function(e, t) {
                    return 403 === e.status && e.headers.has(J) && e.headers.has(Z) && e.headers.has(ee) && "iframe" === t
                },
                er = function(e) {
                    var t, r, n, i, a, o, s, c, u, l = e.url,
                        d = e.request,
                        p = e.response,
                        f = e.robloxSiteDomain,
                        h = (a = new URLSearchParams([
                            ["challenge-type", "generic"],
                            ["dark-mode", "true"],
                            ["barista-mode", "true"],
                            ["generic-challenge-type", null != (t = p.headers.get(Z)) ? t : ""],
                            ["generic-challenge-id", null != (r = p.headers.get(J)) ? r : ""],
                            ["challenge-metadata-json", null != (n = p.headers.get(ee)) ? n : ""],
                            ["origin", null != (i = window.location.hostname.split(".").slice(0, -2).join(".")) ? i : ""]
                        ]), o = new URL("https://www.".concat(f, "/challenge/cdn/hybrid?").concat(a.toString())), (s = document.createElement("iframe")).id = "challenge-frame", s.allowFullscreen = !0, s.setAttribute("allowtransparency", "true"), s.setAttribute("allow", "publickey-credentials-get;publickey-credentials-create"), s.style.cssText = "position: fixed; top: 0; left: 0; width: 100%; height: 100%; visibility: hidden; color-scheme: normal; border: none; z-index: 2147483647;", s.src = o.toString(), s.onload = function() {
                            s.style.visibility = "visible"
                        }, c = s, document && document.body ? document.body.appendChild(c) : null);
                    return new Promise(function(e, t) {
                        window && h && (u = function(r) {
                            var n, i, a, o, s, c, u, f, h, m, b;
                            if (r.data && r.data.genericChallengeResponse) switch (r.data.genericChallengeResponse.type) {
                                case "challengeAbandoned":
                                    t(new $({
                                        kind: _.ABANDONED,
                                        data: {
                                            challengeType: null != (n = p.headers.get(Z)) ? n : ""
                                        }
                                    }));
                                    break;
                                case "challengeDisplayed":
                                    break;
                                case "challengeCompleted":
                                    (u = r.data.genericChallengeResponse.data).challengeType && u.metadata ? e((f = u.metadata, fetch(l, R(R({}, d), {
                                        headers: R(R({}, d.headers), ((h = {})[J] = null != (m = p.headers.get(J)) ? m : "", h[ee] = btoa(JSON.stringify(f)), h[Z] = null != (b = p.headers.get(Z)) ? b : "", h))
                                    })))) : t(new $({
                                        kind: _.UNKNOWN,
                                        data: {
                                            challengeType: null != (i = p.headers.get(Z)) ? i : ""
                                        }
                                    }));
                                    break;
                                case "challengeInvalidated":
                                    t((u = r.data.genericChallengeResponse.data) && u.challengeType && u.metadata ? new $({
                                        kind: _.INVALIDATED,
                                        data: u
                                    }) : new $({
                                        kind: _.INVALIDATED,
                                        data: {
                                            challengeType: null != (a = p.headers.get(Z)) ? a : ""
                                        }
                                    }));
                                    break;
                                case "challengeParsed":
                                    !1 === (u = r.data.genericChallengeResponse.data).parsed && t(new $({
                                        kind: _.UNKNOWN,
                                        data: {
                                            challengeType: null != (o = p.headers.get(Z)) ? o : ""
                                        }
                                    }));
                                    break;
                                case "challengeInitialized":
                                    !1 === (u = r.data.genericChallengeResponse.data).initialized && t(new $({
                                        kind: _.UNKNOWN,
                                        data: {
                                            challengeType: null != (s = p.headers.get(Z)) ? s : ""
                                        }
                                    }));
                                    break;
                                case "challengePageLoaded":
                                    !1 === (u = r.data.genericChallengeResponse.data).pageLoaded && t(new $({
                                        kind: _.LOADFAILED,
                                        data: {
                                            challengeType: null != (c = p.headers.get(Z)) ? c : ""
                                        }
                                    }))
                            }
                        }, window.addEventListener("message", u, !1))
                    }).finally(function() {
                        null == h || h.remove(), u && window.removeEventListener("message", u, !1)
                    })
                },
                en = function() {
                    function e(e, t) {
                        void 0 === t && (t = "iframe"), this.robloxSiteDomain = e, this.genericChallengeMiddlewareType = t
                    }
                    return e.prototype.post = function(e) {
                        var t = e.url,
                            r = e.init,
                            n = e.response;
                        return et(n, this.genericChallengeMiddlewareType) ? er({
                            url: t,
                            request: r,
                            response: n,
                            robloxSiteDomain: this.robloxSiteDomain
                        }) : Promise.resolve(n)
                    }, e
                }(),
                ei = function(e) {
                    var t = e.elapsedTime,
                        r = e.url,
                        n = e.status;
                    return {
                        eventName: "apiVitals",
                        parameters: {
                            elapsedTime: String(t),
                            apiUrl: r,
                            statusCode: String(n)
                        }
                    }
                },
                ea = function() {
                    function e(e) {
                        this.unifiedLogger = e
                    }
                    return e.prototype.post = function(e) {
                        return this.unifiedLogger.logApiVitalsEvent(ei({
                            elapsedTime: e.elapsedTime,
                            url: e.url,
                            status: e.response.status
                        })), Promise.resolve(e.response)
                    }, e
                }(),
                eo = "x-csrf-token",
                es = ["POST", "PATCH", "DELETE", "PUT"],
                ec = function() {
                    var e, t = "";
                    try {
                        "undefined" != typeof window && (t = null != (e = localStorage.getItem(eo)) ? e : "")
                    } catch (e) {
                        console.warn("Error reading localStorage key “".concat(eo, "”:"), e)
                    }
                    return t
                },
                eu = ec(),
                el = function(e) {
                    try {
                        eu = e, "undefined" != typeof window && localStorage.setItem(eo, e)
                    } catch (e) {
                        console.warn("Error setting localStorage key “".concat(eo, "”:"), e)
                    }
                },
                ed = function() {
                    function e() {
                        this.currentToken = ec()
                    }
                    return e.prototype.pre = function(e) {
                        var t, r = e.url,
                            n = e.init,
                            i = this.currentToken;
                        return n.headers && "object" == ((t = n.headers) && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) && eo in n.headers && (i = n.headers[eo]) && (this.currentToken = i, el(i)), n.method && es.includes(n.method) ? Promise.resolve({
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
                            a = i.headers.get(eo);
                        return 403 === i.status && i.headers.has(eo) && null !== a ? (this.currentToken = a, el(a), t(r, this.prepareRequestInit(n))) : Promise.resolve(i)
                    }, e.prototype.prepareRequestInit = function(e) {
                        var t;
                        return R(R({}, e), {
                            headers: R(R({}, e.headers), ((t = {})[eo] = this.currentToken, t))
                        })
                    }, e
                }(),
                ep = [],
                ef = function(e) {
                    ep = ep.filter(function(t) {
                        return t !== e
                    })
                },
                eh = function(e) {
                    var t = e.url;
                    503 === e.status && ep.forEach(function(e) {
                        return e(t)
                    })
                },
                em = function() {
                    function e() {}
                    return e.prototype.subscribe = function(e) {
                        return ep.push(e),
                            function() {
                                return ef(e)
                            }
                    }, e.prototype.unsubscribe = function(e) {
                        return ef(e)
                    }, e.prototype.post = function(e) {
                        var t = e.response;
                        return eh(t), Promise.resolve(t)
                    }, e
                }(),
                eb = new ed,
                ey = new em,
                ev = [function(e) {
                    return e.captureException ? new H(e.captureException) : void 0
                }, function(e) {
                    return e.robloxSiteDomain && e.enableBoundAuthToken ? new Q(e.robloxSiteDomain, e.boundAuthTokenLoadTimeout, e.boundAuthTokenDataTimeout) : void 0
                }, function(e) {
                    return e.robloxSiteDomain ? new en(e.robloxSiteDomain, e.genericChallengeMiddlewareType) : void 0
                }, function(e) {
                    return e.unifiedLogger ? new ea(e.unifiedLogger) : void 0
                }, function() {
                    return eb
                }, function() {
                    return ey
                }],
                eg = function() {
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
                                        var a = i + (i.length ? "[".concat(r, "]") : r);
                                        if (j(n, Array)) {
                                            var o = n.map(function(e) {
                                                return encodeURIComponent(String(e))
                                            }).join("&".concat(encodeURIComponent(a), "="));
                                            return "".concat(encodeURIComponent(a), "=").concat(o)
                                        }
                                        return j(n, Set) ? t(r, Array.from(n), i) : j(n, Date) ? "".concat(encodeURIComponent(a), "=").concat(encodeURIComponent(n.toISOString())) : j(n, Object) ? e(n, a) : "".concat(encodeURIComponent(a), "=").concat(encodeURIComponent(String(n)))
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
                                return U(e, void 0, void 0, function() {
                                    return L(this, function(e) {
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
                ew = new eg,
                eP = function() {
                    function e(e) {
                        void 0 === e && (e = ew);
                        var t = this;
                        this.configuration = e, this.fetchApi = function(e, r) {
                            return U(t, void 0, void 0, function() {
                                var t, n, i, a, o, s, c, u, l, d, p, f;
                                return L(this, function(h) {
                                    switch (h.label) {
                                        case 0:
                                            t = {
                                                url: e,
                                                init: r
                                            }, n = 0, i = this.middleware, h.label = 1;
                                        case 1:
                                            return n < i.length ? (f = i[n]).pre ? [4, f.pre(R({
                                                fetch: this.fetchApi
                                            }, t))] : [3, 3] : [3, 4];
                                        case 2:
                                            t = h.sent() || t, h.label = 3;
                                        case 3:
                                            return n++, [3, 1];
                                        case 4:
                                            a = void 0, o = performance.now(), h.label = 5;
                                        case 5:
                                            return h.trys.push([5, 7, , 12]), [4, (this.configuration.fetchApi || fetch)(t.url, t.init)];
                                        case 6:
                                            return a = h.sent(), s = performance.now(), [3, 12];
                                        case 7:
                                            c = h.sent(), s = performance.now(), u = 0, l = this.middleware, h.label = 8;
                                        case 8:
                                            return u < l.length ? (f = l[u]).onError ? [4, f.onError({
                                                fetch: this.fetchApi,
                                                url: t.url,
                                                init: t.init,
                                                error: c,
                                                response: a ? a.clone() : void 0
                                            })] : [3, 10] : [3, 11];
                                        case 9:
                                            a = h.sent() || a, h.label = 10;
                                        case 10:
                                            return u++, [3, 8];
                                        case 11:
                                            if (void 0 === a) throw j(c, Error) ? new ex(c, "The request failed and the interceptors did not return an alternative response") : c;
                                            return [3, 12];
                                        case 12:
                                            d = 0, p = this.middleware, h.label = 13;
                                        case 13:
                                            return d < p.length ? (f = p[d]).post ? [4, f.post({
                                                fetch: this.fetchApi,
                                                url: t.url,
                                                init: t.init,
                                                response: a.clone(),
                                                elapsedTime: s - o
                                            })] : [3, 15] : [3, 16];
                                        case 14:
                                            a = h.sent() || a, h.label = 15;
                                        case 15:
                                            return d++, [3, 13];
                                        case 16:
                                            return [2, a]
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
                        return U(this, void 0, void 0, function() {
                            var r, n, i, a;
                            return L(this, function(o) {
                                switch (o.label) {
                                    case 0:
                                        return [4, this.createFetchParams(e, t)];
                                    case 1:
                                        return n = (r = o.sent()).url, i = r.init, [4, this.fetchApi(n, i)];
                                    case 2:
                                        if ((a = o.sent()) && a.status >= 200 && a.status < 300) return [2, a];
                                        throw new eS(a, "Response from ".concat(a.url, " returned an error code ").concat(a.status))
                                }
                            })
                        })
                    }, e.prototype.createFetchParams = function(e, t) {
                        return U(this, void 0, void 0, function() {
                            var r, n, i, a, o, s, c, u = this;
                            return L(this, function(l) {
                                var d, p;
                                switch (l.label) {
                                    case 0:
                                        return r = this.configuration.basePath + e.path, void 0 !== e.query && 0 !== Object.keys(e.query).length && (r += "?" + this.configuration.queryParamsStringify(e.query)), Object.keys(n = Object.assign({}, this.configuration.headers, e.headers)).forEach(function(e) {
                                            return void 0 === n[e] ? delete n[e] : {}
                                        }), i = "function" == typeof t ? t : function() {
                                            return U(u, void 0, void 0, function() {
                                                return L(this, function(e) {
                                                    return [2, t]
                                                })
                                            })
                                        }, a = {
                                            method: e.method,
                                            headers: n,
                                            body: e.body,
                                            credentials: this.configuration.credentials
                                        }, s = [R({}, a)], [4, i({
                                            init: a,
                                            context: e
                                        })];
                                    case 1:
                                        return o = R.apply(void 0, s.concat([l.sent()])), c = R(R({}, o), {
                                            body: (d = o.body, "undefined" != typeof FormData && j(d, FormData) || j(o.body, URLSearchParams) || (p = o.body, "undefined" != typeof Blob && j(p, Blob)) ? o.body : JSON.stringify(o.body))
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
                eS = function(e) {
                    function t(t, r) {
                        var n = e.call(this, r) || this;
                        return n.response = t, n.name = "ResponseError", n
                    }
                    return M(t, e), t
                }(Error),
                ex = function(e) {
                    function t(t, r) {
                        var n = e.call(this, r) || this;
                        return n.cause = t, n.name = "FetchError", n
                    }
                    return M(t, e), t
                }(Error),
                eE = function(e) {
                    function t(t, r) {
                        var n = e.call(this, r) || this;
                        return n.field = t, n.name = "RequiredError", n
                    }
                    return M(t, e), t
                }(Error);

            function eT(e, t) {
                return null != e[t]
            }
            var eC = function() {
                    function e(e, t) {
                        void 0 === t && (t = function(e) {
                            return e
                        }), this.raw = e, this.transformer = t
                    }
                    return e.prototype.value = function() {
                        return U(this, void 0, void 0, function() {
                            var e;
                            return L(this, function(t) {
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
                ek = ((function(e) {
                    this.raw = e
                }).prototype.value = function() {
                    return U(this, void 0, void 0, function() {
                        return L(this, function(e) {
                            return [2, void 0]
                        })
                    })
                }, (function(e) {
                    this.raw = e
                }).prototype.value = function() {
                    return U(this, void 0, void 0, function() {
                        return L(this, function(e) {
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
                    return U(this, void 0, void 0, function() {
                        return L(this, function(e) {
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
                        var r, n = R({}, t),
                            i = n.middleware || [];
                        return i.unshift.apply(i, (r = t, ev.map(function(e) {
                            return e(r)
                        }).filter(function(e) {
                            return e
                        }))), n.middleware = i, e.call(this, n) || this
                    }
                    return M(t, e), t
                }(eg));

            function eA(e, t) {
                return null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var eI = function(e, t) {
                return (eI = Object.setPrototypeOf || eA({
                    __proto__: []
                }, Array) && function(e, t) {
                    e.__proto__ = t
                } || function(e, t) {
                    for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
                })(e, t)
            };

            function eD(e, t, r, n) {
                return new(r || (r = Promise))(function(i, a) {
                    function o(e) {
                        try {
                            c(n.next(e))
                        } catch (e) {
                            a(e)
                        }
                    }

                    function s(e) {
                        try {
                            c(n.throw(e))
                        } catch (e) {
                            a(e)
                        }
                    }

                    function c(e) {
                        var t;
                        e.done ? i(e.value) : (eA(t = e.value, r) ? t : new r(function(e) {
                            e(t)
                        })).then(o, s)
                    }
                    c((n = n.apply(e, t || [])).next())
                })
            }

            function eN(e, t) {
                var r, n, i, a = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return o.next = s(0), o.throw = s(1), o.return = s(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
                    return this
                }), o;

                function s(s) {
                    return function(c) {
                        var u = [s, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; o && (o = 0, u[0] && (a = 0)), a;) try {
                            if (r = 1, n && (i = 2 & u[0] ? n.return : u[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, u[1])).done) return i;
                            switch (n = 0, i && (u = [2 & u[0], i.value]), u[0]) {
                                case 0:
                                case 1:
                                    i = u;
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
                                    if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!i || u[1] > i[0] && u[1] < i[3])) {
                                        a.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && a.label < i[1]) {
                                        a.label = i[1], i = u;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(u);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            u = t.call(e, a)
                        } catch (e) {
                            u = [6, e], n = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function ej(e) {
                return e
            }
            "function" == typeof SuppressedError && SuppressedError;

            function eO(e, t) {
                return null == e ? e : {
                    currencyCode: e.currencyCode,
                    units: e.units,
                    nanos: e.nanos
                }
            }

            function eM(e) {
                return e
            }

            function eR(e) {
                var t, r;
                return null == (t = e) ? t : {
                    offerType: eT(t, "offerType") ? t.offerType : void 0,
                    freeTrialOffer: eT(t, "freeTrialOffer") ? null == (r = t.freeTrialOffer) ? r : {
                        periodType: r.periodType,
                        duration: r.duration,
                        estimatedTrialEndDate: eT(r, "estimatedTrialEndDate") ? null === r.estimatedTrialEndDate ? null : new Date(r.estimatedTrialEndDate) : void 0
                    } : void 0
                }
            }
            var eU = "CurrencySubscription",
                eL = "Blackbird";

            function e_(e) {
                var t;
                return null == (t = e) ? t : {
                    type: t.type,
                    id: t.id
                }
            }

            function eB(e) {
                var t;
                return null == (t = e) ? t : {
                    tierId: t.tierId,
                    periodIndex: t.periodIndex,
                    discountPercent: t.discountPercent
                }
            }

            function eY(e) {
                var t, r, n, i, a, o, s;
                return null == (t = e) ? t : {
                    productKey: e_(t.productKey),
                    periodType: t.periodType,
                    periodCount: t.periodCount,
                    localizedPrice: eO(t.localizedPrice),
                    localizedPriceDisplayString: t.localizedPriceDisplayString,
                    localizedStrikethroughPrice: eO(t.localizedStrikethroughPrice),
                    localizedStrikethroughPriceDisplayString: t.localizedStrikethroughPriceDisplayString,
                    productTypeDetails: null == (r = t.productTypeDetails) ? r : {
                        currencySubscriptionProductDetails: eT(r, "currencySubscriptionProductDetails") ? null == (n = r.currencySubscriptionProductDetails) ? n : {
                            currencyType: n.currencyType,
                            entitledAmountMicros: n.entitledAmountMicros
                        } : void 0,
                        developerSubscriptionProductDetails: eT(r, "developerSubscriptionProductDetails") ? null == (i = r.developerSubscriptionProductDetails) ? i : {
                            universeId: i.universeId,
                            imageAssetId: i.imageAssetId,
                            localizedName: i.localizedName,
                            localizedDescription: i.localizedDescription
                        } : void 0,
                        robloxSubscriptionProductDetails: eT(r, "robloxSubscriptionProductDetails") ? null == (a = r.robloxSubscriptionProductDetails) ? a : {
                            featureConfig: null == (o = a.featureConfig) ? o : {
                                virtualTransactionDiscounts: null === o.virtualTransactionDiscounts ? null : o.virtualTransactionDiscounts.map(eB),
                                isRobuxTransferEnabled: o.isRobuxTransferEnabled,
                                isTradingEnabled: o.isTradingEnabled,
                                isUgcPublishingEnabled: o.isUgcPublishingEnabled,
                                privateServerDiscounts: null === o.privateServerDiscounts ? null : o.privateServerDiscounts.map(eB),
                                currencySubscriptionConfig: null == (s = o.currencySubscriptionConfig) ? s : {
                                    currencyType: s.currencyType,
                                    entitledAmountMicros: s.entitledAmountMicros
                                }
                            }
                        } : void 0
                    },
                    eligibleOffers: t.eligibleOffers.map(eR)
                }
            }

            function eF(e) {
                var t, r, n, i, a, o, s;
                return null == (t = e) ? t : {
                    productKey: e_(t.productKey),
                    periodType: t.periodType,
                    displayPrice: eO(t.displayPrice),
                    activationTimestampMs: t.activationTimestampMs,
                    expirationTimestampMs: t.expirationTimestampMs,
                    nextRenewalTimestampMs: t.nextRenewalTimestampMs,
                    paymentProvider: eM(t.paymentProvider),
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
                    activeOffers: t.activeOffers.map(eR),
                    productTypeMembershipDetails: null == (i = t.productTypeMembershipDetails) ? i : {
                        robloxSubscriptionMembershipDetails: eT(i, "robloxSubscriptionMembershipDetails") ? null == (a = i.robloxSubscriptionMembershipDetails) ? a : {
                            features: null == (o = a.features) ? o : {
                                productType: o.productType,
                                virtualTransactionDiscountTierId: o.virtualTransactionDiscountTierId,
                                isRobuxTransferEnabled: o.isRobuxTransferEnabled,
                                isTradingEnabled: o.isTradingEnabled,
                                isUgcPublishingEnabled: o.isUgcPublishingEnabled,
                                privateServerDiscountTierId: o.privateServerDiscountTierId
                            },
                            currencySubscriptionBenefit: null == (s = a.currencySubscriptionBenefit) ? s : {
                                currencyType: s.currencyType,
                                entitledAmountMicrosPerGrantingPeriod: s.entitledAmountMicrosPerGrantingPeriod,
                                grantingPeriodType: s.grantingPeriodType
                            }
                        } : void 0
                    },
                    productInfo: eY(t.productInfo)
                }
            }
            var eH = function(e) {
                    function t() {
                        return null !== e && e.apply(this, arguments) || this
                    }
                    return function(e, t) {
                        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                        function r() {
                            this.constructor = e
                        }
                        eI(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
                    }(t, e), t.prototype.subscriptionsV2GetProductDisplayPriceRaw = function(e, t) {
                        return eD(this, void 0, void 0, function() {
                            var r, n;
                            return eN(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new eE("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetProductDisplayPrice.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new eE("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetProductDisplayPrice.");
                                        return r = {}, n = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (n["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/display-price".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eC(i.sent(), function(e) {
                                            return null == e ? e : {
                                                displayPrice: eO(e.displayPrice)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2GetProductDisplayPrice = function(e, t) {
                        return eD(this, void 0, void 0, function() {
                            return eN(this, function(r) {
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
                        return eD(this, void 0, void 0, function() {
                            var r, n;
                            return eN(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new eE("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetProductPaymentMetadata.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new eE("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetProductPaymentMetadata.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/payment-metadata".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eC(i.sent(), function(e) {
                                            return null == e ? e : {
                                                paymentMethods: e.paymentMethods.map(ej),
                                                paymentProviders: e.paymentProviders.map(eM)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2GetProductPaymentMetadata = function(e, t) {
                        return eD(this, void 0, void 0, function() {
                            return eN(this, function(r) {
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
                        return eD(this, void 0, void 0, function() {
                            var r, n;
                            return eN(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new eE("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetSubscriptionProductInfo.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new eE("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetSubscriptionProductInfo.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eC(i.sent(), function(e) {
                                            return null == e ? e : {
                                                subscriptionProductInfo: eY(e.subscriptionProductInfo)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2GetSubscriptionProductInfo = function(e, t) {
                        return eD(this, void 0, void 0, function() {
                            return eN(this, function(r) {
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
                        return eD(this, void 0, void 0, function() {
                            var r, n;
                            return eN(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        return r = {}, void 0 !== e.productType && (r.ProductType = e.productType), void 0 !== e.includePurchased && (r.IncludePurchased = e.includePurchased), void 0 !== e.includeBundles && (r.IncludeBundles = e.includeBundles), void 0 !== e.purchasePlatform && (r.PurchasePlatform = e.purchasePlatform), void 0 !== e.skipEligibilityCheck && (r.SkipEligibilityCheck = e.skipEligibilityCheck), void 0 !== e.grantType && (r.GrantType = e.grantType), void 0 !== e.paymentProvider && (r.PaymentProvider = e.paymentProvider), n = {}, [4, this.request({
                                            path: "/v2/products",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eC(i.sent(), function(e) {
                                            return null == e ? e : {
                                                productKeys: e.productKeys.map(e_),
                                                products: e.products.map(eY)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ListAvailableSubscriptionProducts = function() {
                        return eD(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), eN(this, function(r) {
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
                    }, t.prototype.subscriptionsV2ListSubscriptionsRaw = function(e, t) {
                        return eD(this, void 0, void 0, function() {
                            var r, n;
                            return eN(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        return r = {}, void 0 !== e.productType && (r.ProductType = e.productType), void 0 !== e.expirationTimestampMsStart && (r.ExpirationTimestampMsStart = e.expirationTimestampMsStart), void 0 !== e.expirationTimestampMsEnd && (r.ExpirationTimestampMsEnd = e.expirationTimestampMsEnd), void 0 !== e.cursor && (r.Cursor = e.cursor), void 0 !== e.resultsPerPage && (r.ResultsPerPage = e.resultsPerPage), n = {}, [4, this.request({
                                            path: "/v2/user/subscriptions",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eC(i.sent(), function(e) {
                                            return null == e ? e : {
                                                subscriptions: e.subscriptions.map(eF),
                                                hasMore: e.hasMore,
                                                cursor: e.cursor
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ListSubscriptions = function() {
                        return eD(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), eN(this, function(r) {
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
                        return eD(this, void 0, void 0, function() {
                            var r, n;
                            return eN(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new eE("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2PreparePurchaseV2.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new eE("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2PreparePurchaseV2.");
                                        return r = {}, (n = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxUniverseId && null !== e.robloxUniverseId && (n["Roblox-Universe-Id"] = String(e.robloxUniverseId)), [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/prepare-purchase".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
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
                                                    paymentSessionId: e.paymentSessionId
                                                }
                                            }(e.preparePurchaseV2Request)
                                        }, t)];
                                    case 1:
                                        return [2, new eC(i.sent(), function(e) {
                                            var t, r, n, i, a, o;
                                            return null == e ? e : {
                                                paymentProvider: eM(e.paymentProvider),
                                                providerPurchasePayload: null == (t = e.providerPurchasePayload) ? t : {
                                                    stripePurchasePayload: eT(t, "stripePurchasePayload") ? null == (r = t.stripePurchasePayload) ? r : {
                                                        checkoutUrl: r.checkoutUrl
                                                    } : void 0,
                                                    appleAppStorePurchasePayload: eT(t, "appleAppStorePurchasePayload") ? null == (n = t.appleAppStorePurchasePayload) ? n : {
                                                        appAccountToken: n.appAccountToken,
                                                        partnerBillingJwtToken: n.partnerBillingJwtToken,
                                                        partnerBillingGenericProductId: n.partnerBillingGenericProductId
                                                    } : void 0,
                                                    googlePlayStorePurchasePayload: eT(t, "googlePlayStorePurchasePayload") ? null == (i = t.googlePlayStorePurchasePayload) ? i : {
                                                        providerProductId: i.providerProductId,
                                                        providerProductType: i.providerProductType,
                                                        chargeRequestId: i.chargeRequestId,
                                                        offerId: eT(i, "offerId") ? i.offerId : void 0
                                                    } : void 0,
                                                    creditBalancePurchasePayload: eT(t, "creditBalancePurchasePayload") ? null == (a = t.creditBalancePurchasePayload) ? a : {
                                                        checkoutUrl: a.checkoutUrl
                                                    } : void 0,
                                                    braintreePurchasePayload: eT(t, "braintreePurchasePayload") ? null == (o = t.braintreePurchasePayload) ? o : {
                                                        productToken: o.productToken,
                                                        price: o.price,
                                                        currencyCode: o.currencyCode,
                                                        clientAuthorizationToken: o.clientAuthorizationToken
                                                    } : void 0
                                                },
                                                nativeProviderPurchasePayloadString: e.nativeProviderPurchasePayloadString
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2PreparePurchaseV2 = function(e, t) {
                        return eD(this, void 0, void 0, function() {
                            return eN(this, function(r) {
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
                }(eP),
                eq = ((n = {}).ANDROID_APP = "isAndroidApp", n.AMAZON_APP = "isAmazonApp", n.IOS_APP = "isIosApp", n.UWP_APP = "isUwpApp", n.XBOX_APP = "isXboxApp", n.UNIVERSAL_APP = "isUniversalApp", n.DESKTOP = "isDesktop", n),
                eW = ((i = {}).SUBSCRIPTION = "Subscription", i.PRIVATE_SERVER = "PrivateServer", i),
                eG = ((a = {}).INVALID = "Invalid", a.MONTH = "Month", a.YEAR = "Year", a),
                eV = ((o = {}).INVALID = "Invalid", o.DESKTOP = "Desktop", o.APPLE = "Apple", o.GOOGLE = "Google", o.INTERNAL = "Internal", o),
                eK = ((s = {})[s.INVALID = 0] = "INVALID", s[s.UNKNOWN = 1] = "UNKNOWN", s[s.INVALID_PRODUCT = 2] = "INVALID_PRODUCT", s[s.PRODUCT_NOT_FOR_SALE = 3] = "PRODUCT_NOT_FOR_SALE", s[s.USER_ALREADY_SUBSCRIBED = 4] = "USER_ALREADY_SUBSCRIBED", s[s.SAVED_CC_REQUIRED = 5] = "SAVED_CC_REQUIRED", s[s.VPC_REQUIRED = 6] = "VPC_REQUIRED", s[s.VPC_PENDING_APPROVAL = 7] = "VPC_PENDING_APPROVAL", s[s.INVALID_INPUT = 8] = "INVALID_INPUT", s[s.PURCHASE_PLATFORM_NOT_SUPPORTED = 9] = "PURCHASE_PLATFORM_NOT_SUPPORTED", s[s.INVALID_SALE_LOCATION = 10] = "INVALID_SALE_LOCATION", s[s.USER_HAS_SPEND_LIMIT_SET = 11] = "USER_HAS_SPEND_LIMIT_SET", s[s.RESTRICTED_USER = 12] = "RESTRICTED_USER", s[s.UNSUPPORTED_LOCALE = 13] = "UNSUPPORTED_LOCALE", s[s.UNAUTHORIZED = 14] = "UNAUTHORIZED", s[s.EXCEED_PARENTAL_SPEND_LIMIT = 15] = "EXCEED_PARENTAL_SPEND_LIMIT", s),
                ez = ((c = {}).INVALID = "Invalid", c.STRIPE = "Stripe", c.APPLEAPPSTORE = "AppleAppStore", c.GOOGLEPLAYSTORE = "GooglePlayStore", c.CREDITBALANCE = "CreditBalance", c.BRAINTREE = "Braintree", c),
                eX = ((u = {}).CANCEL = "cancel", u.RESUBSCRIBE = "resubscribe", u),
                eQ = x.EnvironmentUrls.apiGatewayUrl,
                e$ = x.EnvironmentUrls.premiumFeaturesApi,
                eJ = {
                    url: {
                        getAbuseReportRevampUrl: function(e) {
                            var t = new URLSearchParams({
                                abuseVector: e.abuseVector,
                                submitterId: e.submitterId,
                                targetId: e.targetId,
                                custom: e.custom || ""
                            });
                            return "/report-abuse/?".concat(t.toString())
                        },
                        getSubscriptions: {
                            url: "".concat(eQ, "/v1/subscriptions/active-subscription-products"),
                            withCredentials: !0
                        },
                        getSubscriptionStatuses: function(e) {
                            return {
                                url: "".concat(eQ, "/v1/subscriptions/statuses?").concat(e.map(function(e) {
                                    return "subscriptionProductTargetKeys=".concat(e)
                                }).join("&")),
                                withCredentials: !0
                            }
                        },
                        getSubscriptionMetadata: {
                            url: "".concat(eQ, "/v1/subscriptions/metadata"),
                            withCredentials: !0
                        },
                        getSubscriptionPaymentMethods: function(e) {
                            return {
                                url: "".concat(eQ, "/v1/subscriptions/payment-methods/").concat(e),
                                withCredentials: !0
                            }
                        },
                        purchaseSubscription: function(e) {
                            return {
                                url: "".concat(eQ, "/v1/subscriptions/prepare-purchase/").concat(e, "/web"),
                                withCredentials: !0
                            }
                        },
                        purchaseWithRobux: function(e) {
                            return {
                                url: "".concat(eQ, "/v1/subscriptions/purchase-with-robux/").concat(e),
                                withCredentials: !0
                            }
                        },
                        getUserPremiumSubscription: function(e) {
                            return {
                                url: "".concat(e$, "/v1/users/").concat(e, "/subscriptions/details"),
                                withCredentials: !0
                            }
                        },
                        getUserSubscriptions: {
                            url: "".concat(eQ, "/v1/subscriptions/user"),
                            withCredentials: !0
                        },
                        cancelSubscription: function(e) {
                            return {
                                url: "".concat(eQ, "/v1/subscriptions/").concat(e, "/cancel"),
                                withCredentials: !0
                            }
                        },
                        cancelPremiumSubscription: function(e) {
                            return {
                                url: "".concat(e$, "/v1/users/").concat(e, "/subscriptions/cancel"),
                                withCredentials: !0
                            }
                        },
                        dismissSubscriptionNotification: function(e) {
                            return {
                                url: "".concat(eQ, "/v1/subscriptions/").concat(e, "/dismiss-notification"),
                                withCredentials: !0
                            }
                        },
                        updateSubscriptionPaymentProfile: function(e) {
                            return {
                                withCredentials: !0,
                                url: "".concat(x.EnvironmentUrls.apiGatewayUrl, "/v1/subscriptions/").concat(e, "/payment-methods")
                            }
                        },
                        verifyPaymentProfileCreation: function(e) {
                            return {
                                url: "".concat(eQ, "/payments-gateway/v1/payment-profile/by-provider-id/").concat(ez.STRIPE, "/").concat(e),
                                withCredentials: !0
                            }
                        },
                        getSavedPaymentProfiles: function() {
                            return {
                                withCredentials: !0,
                                url: "".concat(x.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-profiles")
                            }
                        },
                        getPaymentProfileSetupUrlConfig: function() {
                            return {
                                withCredentials: !0,
                                url: "".concat(x.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-profile/prepare")
                            }
                        },
                        getStripeEnabledForUserConfig: function() {
                            return {
                                withCredentials: !0,
                                url: "".concat(x.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/stripe/enabled-for-user")
                            }
                        },
                        updatePaymentProfile: function(e) {
                            return {
                                url: "".concat(eQ, "/payments-gateway/v1/payment-profile/").concat(e),
                                withCredentials: !0
                            }
                        },
                        submitSafetyEvent: {
                            url: "".concat(eQ, "/abuse-reporting/v1/safety-event"),
                            retryable: !0,
                            withCredentials: !0
                        },
                        getUserCreditBalance: function() {
                            return {
                                url: "".concat(eQ, "/credit-balance/v1/get-credit-balance"),
                                withCredentials: !0
                            }
                        },
                        getUserBirthdateUrlConfig: function() {
                            return {
                                withCredentials: !0,
                                url: "".concat(x.EnvironmentUrls.usersApi, "/v1/birthdate")
                            }
                        },
                        getSubscriptionResubscribeEligibility: function(e) {
                            return {
                                withCredentials: !0,
                                url: "".concat(eQ, "/v1/subscriptions/").concat(e, "/eligibility")
                            }
                        },
                        resubscribeSubscription: function(e) {
                            return {
                                withCredentials: !0,
                                url: "".concat(eQ, "/v1/subscriptions/").concat(e, "/resubscribe")
                            }
                        },
                        updateVipServerSubscription: function(e) {
                            return {
                                withCredentials: !0,
                                url: "".concat(x.EnvironmentUrls.gamesApi, "/v1/vip-servers/").concat(e, "/subscription")
                            }
                        },
                        getMyPrivateServers: function() {
                            return {
                                withCredentials: !0,
                                url: "".concat(x.EnvironmentUrls.gamesApi, "/v1/private-servers/my-private-servers")
                            }
                        }
                    }
                },
                eZ = new Map(Object.values(ez).filter(function(e) {
                    return e !== ez.INVALID
                }).map(function(e) {
                    return [e.toLowerCase(), e]
                }));

            function e0(e) {
                var t;
                return eZ.get(null != (t = null == e ? void 0 : e.toLowerCase()) ? t : "")
            }

            function e1(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function e2(e, t, r, n, i, a, o) {
                try {
                    var s = e[a](o),
                        c = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(c) : Promise.resolve(c).then(n, i)
            }

            function e3(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, i) {
                        var a = e.apply(t, r);

                        function o(e) {
                            e2(a, n, i, o, s, "next", e)
                        }

                        function s(e) {
                            e2(a, n, i, o, s, "throw", e)
                        }
                        o(void 0)
                    })
                }
            }

            function e4(e) {
                return function(e) {
                    if (Array.isArray(e)) return e1(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return e1(e, void 0);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return e1(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function e6(e, t) {
                var r, n, i, a = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return o.next = s(0), o.throw = s(1), o.return = s(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
                    return this
                }), o;

                function s(s) {
                    return function(c) {
                        var u = [s, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; o && (o = 0, u[0] && (a = 0)), a;) try {
                            if (r = 1, n && (i = 2 & u[0] ? n.return : u[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, u[1])).done) return i;
                            switch (n = 0, i && (u = [2 & u[0], i.value]), u[0]) {
                                case 0:
                                case 1:
                                    i = u;
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
                                    if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!i || u[1] > i[0] && u[1] < i[3])) {
                                        a.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && a.label < i[1]) {
                                        a.label = i[1], i = u;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(u);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            u = t.call(e, a)
                        } catch (e) {
                            u = [6, e], n = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var e5 = function(e, t) {
                    return e3(function() {
                        var r, n, i, a, o, s, c, u, l, d, p, f;
                        return e6(this, function(h) {
                            switch (h.label) {
                                case 0:
                                    r = eJ.url.getUserSubscriptions, n = [], i = !0, h.label = 1;
                                case 1:
                                    if (!i) return [3, 3];
                                    return u = {
                                        resultsPerPage: 20,
                                        cursor: a,
                                        expirationTimestampMsStart: e ? e.getTime() : 0,
                                        expirationTimestampMsEnd: t ? t.getTime() : 0
                                    }, [4, N.httpService.get(r, u)];
                                case 2:
                                    return p = (null != (d = null == (o = (l = h.sent()).data) ? void 0 : o.subscriptions) ? d : []).map(function(e) {
                                        var t, r;
                                        return {
                                            subscriptionTargetKey: e.subscriptionTargetKey,
                                            name: e.name,
                                            description: e.description,
                                            subscriptionProviderName: e.subscriptionProviderName,
                                            iconImageAssetId: e.imageAssetId,
                                            price: e.price,
                                            priceInRobux: null != (t = e.priceInRobux) ? t : null,
                                            subscriptionPeriod: e.subscriptionPeriod,
                                            expiration: new Date(e.expirationTimestampMs),
                                            renewal: new Date(e.nextRenewalTimestampMs),
                                            purchasePlatform: e.purchasePlatform,
                                            cardInfo: null != (r = e.paymentProfileCardInfo) ? r : void 0,
                                            providerId: e.providerId,
                                            paymentProvider: e0(e.paymentProvider),
                                            showLowBalanceNotification: e.showLowBalanceNotification,
                                            paymentProfileId: e.paymentProfileId
                                        }
                                    }), n = e4(n).concat(e4(p)), i = null != (f = null == (s = l.data) ? void 0 : s.hasMore) && f, a = null == (c = l.data) ? void 0 : c.cursor, [3, 1];
                                case 3:
                                    return [2, n]
                            }
                        })
                    })()
                },
                e8 = new eH(new ek({
                    basePath: "".concat(x.EnvironmentUrls.apiGatewayUrl, "/subscriptions"),
                    credentials: "include"
                })),
                e7 = function(e) {
                    return e3(function() {
                        var t;
                        return e6(this, function(r) {
                            switch (r.label) {
                                case 0:
                                    return r.trys.push([0, 2, , 3]), [4, e8.subscriptionsV2ListSubscriptions({
                                        productType: e,
                                        expirationTimestampMsStart: Date.now(),
                                        resultsPerPage: 100
                                    })];
                                case 1:
                                    return [2, null != (t = r.sent().subscriptions) ? t : []];
                                case 2:
                                    return r.sent(), [2, []];
                                case 3:
                                    return [2]
                            }
                        })
                    })()
                },
                e9 = {
                    Blackbird: "RBP",
                    RobloxPlus: "RBP",
                    CurrencySubscription: "CUR",
                    DeveloperSubscription: "EXP",
                    Premium: "PRM"
                },
                te = function(e, t) {
                    var r = e9[e];
                    return r ? "".concat(r, "-").concat(t) : null
                },
                tt = function(e) {
                    if (e) return {
                        cardNetwork: e.cardNetwork,
                        last4Digits: e.lastFourDigits,
                        expMonth: e.expirationMonth,
                        expYear: e.expirationYear
                    }
                },
                tr = function(e) {
                    var t, r, n;
                    if (null == e) throw Error("mapV2ToUserSubscription: displayPrice is required");
                    return {
                        amount: (null != (t = e.units) ? t : 0) + (null != (r = e.nanos) ? r : 0) / 1e9,
                        currencyCode: null != (n = e.currencyCode) ? n : ""
                    }
                },
                tn = function(e) {
                    var t, r, n, i, a, o, s, c, u, l, d, p, f, h = null != (u = null == (t = e.productKey) ? void 0 : t.type) ? u : "";
                    return {
                        subscriptionTargetKey: null != (d = te(h, null != (l = null == (r = e.productKey) ? void 0 : r.id) ? l : "")) ? d : "",
                        name: h,
                        subscriptionProviderName: "Roblox",
                        productType: h || void 0,
                        price: tr(e.displayPrice),
                        subscriptionPeriod: e.periodType,
                        periodCount: null == (n = e.productInfo) ? void 0 : n.periodCount,
                        expiration: new Date(e.expirationTimestampMs),
                        renewal: new Date(e.nextRenewalTimestampMs ? e.nextRenewalTimestampMs : 0),
                        paymentProvider: e0(e.paymentProvider),
                        cardInfo: tt(null == (i = e.paymentProfile) ? void 0 : i.cardInfo),
                        paymentProfileId: null != (p = null == (a = e.paymentProfile) ? void 0 : a.id) ? p : "",
                        purchasePlatform: e.purchasePlatform,
                        subscriptionOffers: (null == (o = e.activeOffers) ? void 0 : o.length) ? e.activeOffers : void 0,
                        currencySubscriptionBenefit: null != (f = null == (c = e.productTypeMembershipDetails) || null == (s = c.robloxSubscriptionMembershipDetails) ? void 0 : s.currencySubscriptionBenefit) ? f : null
                    }
                },
                ti = r(942),
                ta = r.n(ti),
                to = window.ReactStyleGuide,
                ts = window.RobloxThumbnails;

            function tc(e, t) {
                var r = {};
                for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && 0 > t.indexOf(n) && (r[n] = e[n]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols) {
                    var i = 0;
                    for (n = Object.getOwnPropertySymbols(e); i < n.length; i++) 0 > t.indexOf(n[i]) && Object.prototype.propertyIsEnumerable.call(e, n[i]) && (r[n[i]] = e[n[i]])
                }
                return r
            }
            var tu = function() {
                    for (var e, t, r = 0, n = "", i = arguments.length; r < i; r++)(e = arguments[r]) && (t = function e(t) {
                        var r, n, i = "";
                        if ("string" == typeof t || "number" == typeof t) i += t;
                        else if ("object" == (void 0 === t ? "undefined" : t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t))
                            if (Array.isArray(t)) {
                                var a = t.length;
                                for (r = 0; r < a; r++) t[r] && (n = e(t[r])) && (i && (i += " "), i += n)
                            } else
                                for (n in t) t[n] && (i && (i += " "), i += n);
                        return i
                    }(e)) && (n && (n += " "), n += t);
                    return n
                },
                tl = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]"
                },
                td = P().forwardRef(function(e, t) {
                    var r = e.name,
                        n = e.size,
                        i = e.className,
                        a = (e.children, tc(e, ["name", "size", "className", "children"]));
                    return P().createElement("span", Object.assign({
                        ref: t,
                        role: "presentation",
                        className: tu("grow-0 shrink-0 basis-auto icon", r, tl[void 0 === n ? "Medium" : n], i)
                    }, a))
                });
            td.displayName = "Icon";
            var tp = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                tf = function() {
                    return P().createElement("div", {
                        role: "presentation",
                        className: "absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none"
                    })
                },
                th = "opacity-[0.5]",
                tm = {
                    Small: "XSmall",
                    Medium: "Small",
                    Large: "Medium"
                },
                tb = {
                    Small: ["height-600", "text-label-small"],
                    Medium: ["height-800", "text-label-medium"],
                    Large: ["height-1000", "text-label-medium"]
                },
                ty = {
                    Small: "padding-left-small",
                    Medium: "padding-left-medium",
                    Large: "padding-left-large"
                },
                tv = {
                    Small: "padding-left-small",
                    Medium: "padding-left-medium",
                    Large: "padding-left-medium"
                },
                tg = {
                    Small: "padding-right-small",
                    Medium: "padding-right-medium",
                    Large: "padding-right-large"
                },
                tw = {
                    Small: "padding-right-small",
                    Medium: "padding-right-medium",
                    Large: "padding-right-medium"
                },
                tP = {
                    Small: "padding-left-xsmall",
                    Medium: "padding-left-[var(--size-150)]",
                    Large: "padding-left-small"
                },
                tS = {
                    Small: "padding-right-[var(--size-150)]",
                    Medium: "padding-right-small",
                    Large: "padding-right-[var(--size-250)]"
                },
                tx = {
                    Standard: "bg-shift-300",
                    Utility: "bg-none"
                },
                tE = (0, w.forwardRef)(function(e, t) {
                    var r = e.className,
                        n = e.style,
                        i = e.text,
                        a = e.isDisabled,
                        o = void 0 !== a && a,
                        s = e.size,
                        c = void 0 === s ? "Medium" : s,
                        u = e.variant,
                        l = void 0 === u ? "Standard" : u,
                        d = e.leading,
                        p = e.trailing,
                        f = tc(e, ["className", "style", "text", "isDisabled", "size", "variant", "leading", "trailing"]),
                        h = tu(o ? th : [tp, "cursor-pointer"], "relative flex justify-center items-center radius-circle stroke-none", null == d ? ty[c] : tv[c], null == p ? tg[c] : tw[c], tb[c], r),
                        m = P().createElement(P().Fragment, null, P().createElement(tf, null), d && P().createElement(td, {
                            name: d,
                            size: tm[c]
                        }), P().createElement("span", {
                            className: tu("padding-y-xsmall text-no-wrap text-truncate-end", null != d && tP[c], null != p && tS[c])
                        }, i), p && P().createElement(td, {
                            name: p,
                            size: tm[c]
                        })),
                        b = Object.assign({
                            textDecoration: "none"
                        }, n);
                    if ("a" === f.as) {
                        f.as;
                        var y = f.href,
                            v = tc(f, ["as", "href"]);
                        return P().createElement("a", Object.assign({
                            ref: t
                        }, v, {
                            "aria-disabled": o,
                            href: o ? void 0 : y,
                            className: tu(h, tx[l], "content-action-utility"),
                            style: b
                        }), m)
                    }
                    f.as;
                    var g = f.isChecked,
                        w = f.onCheckedChange,
                        S = tc(f, ["as", "isChecked", "onCheckedChange"]);
                    return P().createElement("button", Object.assign({
                        ref: t,
                        type: "button"
                    }, S, {
                        className: tu(g ? "bg-inverse-surface-0" : tx[l], g ? "content-inverse-emphasis" : "content-action-utility", h),
                        style: b,
                        "aria-pressed": g,
                        disabled: o,
                        onClick: null == w ? void 0 : function() {
                            return w(!g)
                        }
                    }), m)
                });
            r(534);
            var tT = function(e) {
                    var t = e.price,
                        r = e.period,
                        n = e.periodCount,
                        i = e.className,
                        a = (0, (0, T.useTranslation)().translate)("Label.SubscriptionDuration", {
                            periodType: r,
                            periodCount: null != n ? n : 1
                        }),
                        o = " / ".concat(a).concat("resubscribe" === i ? "." : "");
                    return (0, w.useEffect)(function() {
                        window.dispatchEvent(new CustomEvent("price-tag:render", {
                            detail: {
                                tagClassName: "".concat(i, "-price text-description"),
                                targetSelector: ".".concat(i, "-price-tag")
                            }
                        }))
                    }, [t, i]), (0, g.jsxs)("span", {
                        className: "price-period",
                        children: [(0, g.jsx)("span", {
                            className: "".concat(i, "-price-tag"),
                            "data-amount": t.amount,
                            "data-currency-code": t.currencyCode
                        }), (0, g.jsx)("span", {
                            className: "".concat(i, "-period text-description"),
                            children: o
                        })]
                    })
                },
                tC = function(e) {
                    var t = e.priceInRobux,
                        r = e.totalDiscountAmountInRobux,
                        n = e.isLoading,
                        i = (0, T.useTranslation)().translate;
                    if (void 0 !== n && n) return (0, g.jsx)(k.Skeleton, {
                        animate: !0,
                        variant: "text",
                        width: 120,
                        height: 22
                    });
                    if (!((null != t ? t : 0) > 0) && (null != r ? r : 0) > 0) return (0, g.jsxs)("span", {
                        className: "flex items-center gap-xsmall",
                        children: [(0, g.jsx)(td, {
                            name: "icon-regular-roblox-plus",
                            size: "Small"
                        }), (0, g.jsx)("span", {
                            children: i("Label.Subscriptions.FreeWithPlus")
                        })]
                    });
                    var a = " ".concat(i("Label.Subscriptions.PerMonth"));
                    return (0, g.jsxs)("span", {
                        className: "robux-amount",
                        children: [(0, g.jsx)("span", {
                            className: "icon-robux-16x16"
                        }), (0, g.jsxs)("span", {
                            className: "price-period",
                            children: [(0, g.jsx)("span", {
                                className: "text-robux",
                                children: null == t ? void 0 : t.toString()
                            }), (0, g.jsx)("span", {
                                className: "subscription-period text-description",
                                children: a
                            })]
                        })]
                    })
                },
                tk = function(e) {
                    var t = e.expiration,
                        r = e.renewal,
                        n = (0, T.useTranslation)().translate,
                        i = 0 === r.getTime() || t < r,
                        a = (i ? t : r).toLocaleDateString(void 0, {
                            day: "2-digit",
                            month: "short",
                            year: "numeric"
                        }),
                        o = "".concat(n(i ? "Label.Subscriptions.Expires" : "Label.Subscriptions.Renews"), " ").concat(a);
                    return (0, g.jsx)("span", {
                        className: ta()("subscription-date", "text-description", {
                            "text-alert": i
                        }),
                        children: o
                    })
                };

            function tA(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            r(908);
            var tI = ((l = {}).LOW_BALANCE_WARNING = "LowBalanceWarning", l.LOW_BALANCE_GRACE_PERIOD = "LowBalanceGracePeriod", l),
                tD = function(e, t, r) {
                    if (!e) return null;
                    var n = new Date;
                    return t < n && n < r ? "LowBalanceGracePeriod" : "LowBalanceWarning"
                },
                tN = (tA(y = {}, "LowBalanceWarning", "icon-status-alert"), tA(y, "LowBalanceGracePeriod", "icon-warning"), y),
                tj = ((d = {}).VISA = "visa", d.DISCOVER = "discover", d.MASTERCARD = "mastercard", d.AMERICANEXPRESS = "americanexpress", d.AMEX = "amex", d.DEBIT = "debitcard", d),
                tO = function(e) {
                    switch (e) {
                        case tj.AMEX:
                        case tj.AMERICANEXPRESS:
                            return "icon-amex";
                        case tj.DISCOVER:
                            return "icon-discover";
                        case tj.MASTERCARD:
                            return "icon-mastercard";
                        case tj.VISA:
                            return "icon-visa";
                        case tj.DEBIT:
                            return "icon-debit";
                        default:
                            return "icon-generic-card"
                    }
                },
                tM = function(e, t, r) {
                    var n = e.find(function(e) {
                        return e.id === t
                    });
                    return void 0 === n && void 0 !== r && void 0 === (n = e.find(function(e) {
                        return e.providerPayload.CardNetwork === r.cardNetwork && e.providerPayload.ExpMonth === r.expMonth && e.providerPayload.ExpYear === r.expYear && e.providerPayload.Last4Digits === r.last4Digits
                    })) ? {
                        id: "restricted",
                        providerPayload: {
                            CardNetwork: r.cardNetwork,
                            ExpMonth: r.expMonth,
                            ExpYear: r.expYear,
                            Last4Digits: r.last4Digits
                        }
                    } : n
                },
                tR = function(e, t, r) {
                    var n = "icon-generic-card";
                    switch (e) {
                        case eV.APPLE:
                        case eq.IOS_APP:
                            n = "icon-apple";
                            break;
                        case eV.GOOGLE:
                        case eq.ANDROID_APP:
                            n = "icon-google";
                            break;
                        case eV.DESKTOP:
                        case eV.INTERNAL:
                        case eq.DESKTOP:
                            if (t) switch (t) {
                                case ez.CREDITBALANCE:
                                    n = "icon-roblox-credit";
                                    break;
                                case ez.BRAINTREE:
                                    n = "icon-paypal";
                                    break;
                                case ez.STRIPE:
                                    r && (n = tO(r.cardNetwork));
                                    break;
                                default:
                                    n = "icon-generic-card"
                            }
                            break;
                        default:
                            n = "icon-generic-card"
                    }
                    return n
                },
                tU = function(e, t) {
                    return 0 === e.getTime() || t <= e
                },
                tL = function(e) {
                    var t;
                    return null != (t = null == e ? void 0 : e.some(function(e) {
                        return "FreeTrial" === e.offerType
                    })) && t
                };

            function t_(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tB(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var a = [],
                            o = !0,
                            s = !1;
                        try {
                            for (i = i.call(e); !(o = (r = i.next()).done) && (a.push(r.value), !t || a.length !== t); o = !0);
                        } catch (e) {
                            s = !0, n = e
                        } finally {
                            try {
                                o || null == i.return || i.return()
                            } finally {
                                if (s) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return t_(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return t_(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var tY = function(e) {
                    var t = e.subscriptionName,
                        r = e.subscriptionProviderName,
                        n = e.subscriptionPaymentProvider,
                        i = e.iconImageAssetId,
                        a = e.price,
                        o = e.priceInRobux,
                        s = e.subscriptionPeriod,
                        c = e.periodCount,
                        u = e.expiration,
                        l = e.renewal,
                        d = e.isPremium,
                        p = e.productType,
                        f = e.purchasePlatform,
                        h = e.showLowBalanceNotification,
                        m = void 0 !== h && h,
                        b = e.subscriptionOffers,
                        y = e.onClick,
                        v = (0, T.useTranslation)().translate,
                        P = tB((0, w.useState)(null), 2),
                        S = P[0],
                        x = P[1],
                        E = tB((0, w.useState)(!1), 2),
                        C = E[0],
                        k = E[1],
                        A = tB((0, w.useState)(""), 2),
                        I = A[0],
                        D = A[1];
                    (0, w.useEffect)(function() {
                        k(null !== S && n === ez.CREDITBALANCE), S && n === ez.CREDITBALANCE && D(tN[S])
                    }, [S, n]), (0, w.useEffect)(function() {
                        x(tD(m, l, u))
                    }, [m, u, l]);
                    var N = null != o && o > 0 || null != a && f !== eV.INTERNAL;
                    return (0, g.jsxs)("button", {
                        className: "subcard-container",
                        onClick: y,
                        type: "button",
                        children: [(0, g.jsx)("div", {
                            className: "subcard-icon-container",
                            children: void 0 !== d && d ? (0, g.jsx)("span", {
                                className: "premium-icon"
                            }) : p === eL ? (0, g.jsx)(td, {
                                className: "blackbird-icon",
                                name: "icon-regular-roblox-plus",
                                size: "Large"
                            }) : p === eU ? (0, g.jsx)("span", {
                                className: "premium-icon"
                            }) : (0, g.jsx)(ts.Thumbnail2d, {
                                targetId: void 0 === i ? 0 : i,
                                type: ts.ThumbnailTypes.assetThumbnail,
                                imgClassName: "subcard-icon",
                                containerClass: "thumbnail-card-container",
                                altName: t
                            })
                        }), (0, g.jsxs)("div", {
                            className: "subcard-info",
                            children: [(0, g.jsxs)("div", {
                                className: "subcard-info-primary",
                                children: [(0, g.jsx)("span", {
                                    className: "subscription-name font-body",
                                    children: t
                                }), (0, g.jsx)("span", {
                                    className: "subscription-provider text-description",
                                    children: r
                                })]
                            }), (0, g.jsxs)("div", {
                                className: "subcard-info-secondary",
                                children: [null != o && o > 0 ? (0, g.jsx)(tC, {
                                    priceInRobux: o
                                }) : a && f !== eV.INTERNAL ? (0, g.jsx)(tT, {
                                    price: a,
                                    period: s,
                                    periodCount: c,
                                    className: "subscription"
                                }) : (0, g.jsx)(tk, {
                                    expiration: u,
                                    renewal: l
                                }), N && (0, g.jsxs)("div", {
                                    className: "subscription-billing-cycle-info",
                                    children: [(0, g.jsx)(tk, {
                                        expiration: u,
                                        renewal: l
                                    }), tL(b) && (0, g.jsx)(tE, {
                                        as: "button",
                                        isChecked: !1,
                                        size: "Small",
                                        text: v("Label.FreeTrial"),
                                        variant: "Standard"
                                    })]
                                }), !N && tL(b) && (0, g.jsx)(tE, {
                                    as: "button",
                                    isChecked: !1,
                                    size: "Small",
                                    text: v("Label.FreeTrial"),
                                    variant: "Standard"
                                })]
                            })]
                        }), (0, g.jsx)("div", {
                            className: "warning-icon",
                            children: C && (0, g.jsx)("span", {
                                className: I
                            })
                        }), (0, g.jsx)("span", {
                            className: "icon-right more-details"
                        })]
                    })
                },
                tF = function(e) {
                    return e.name.toLowerCase().includes("12 months") || e.name.toLowerCase().includes("annual")
                },
                tH = function(e) {
                    return tF(e) ? eG.YEAR : eG.MONTH
                },
                tq = function(e) {
                    return tF(e) ? "Roblox Annual Premium" : e.name
                };
            r(887);
            var tW = function(e) {
                var t = e.privateServer,
                    r = e.isPriceLoading,
                    n = e.onClick,
                    i = (0, T.useTranslation)().translate,
                    a = new Date(t.expirationDate),
                    o = t.willRenew ? a : new Date(0),
                    s = i("Label.PrivateServer", {
                        privateServerName: t.name
                    });
                return (0, g.jsxs)("button", {
                    className: "subcard-container",
                    onClick: n,
                    type: "button",
                    children: [(0, g.jsx)("div", {
                        className: "subcard-icon-container",
                        children: (0, g.jsx)(ts.Thumbnail2d, {
                            targetId: t.universeId,
                            type: ts.ThumbnailTypes.gameIcon,
                            imgClassName: "subcard-icon",
                            containerClass: "thumbnail-card-container",
                            altName: t.name
                        })
                    }), (0, g.jsxs)("div", {
                        className: "subcard-info",
                        children: [(0, g.jsxs)("div", {
                            className: "subcard-info-primary",
                            children: [(0, g.jsx)("span", {
                                className: "subscription-name font-body",
                                children: s
                            }), (0, g.jsx)("span", {
                                className: "subscription-provider text-description",
                                children: t.universeName
                            })]
                        }), (0, g.jsxs)("div", {
                            className: "subcard-info-secondary",
                            children: [(0, g.jsx)(tC, {
                                priceInRobux: t.priceInRobux,
                                totalDiscountAmountInRobux: t.totalDiscountAmountInRobux,
                                isLoading: void 0 !== r && r
                            }), (0, g.jsx)(tk, {
                                expiration: a,
                                renewal: o
                            })]
                        })]
                    }), (0, g.jsx)("div", {
                        className: "warning-icon"
                    }), (0, g.jsx)("span", {
                        className: "icon-right more-details"
                    })]
                })
            };

            function tG(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tV(e) {
                return function(e) {
                    if (Array.isArray(e)) return tG(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return tG(e, void 0);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tG(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var tK = function(e) {
                    var t = e.premiumSubscription,
                        r = e.subscriptionList,
                        n = e.emptyText,
                        i = e.resultsPerPage,
                        a = e.currentPage,
                        o = e.onChangePage,
                        s = e.onSelectSubscription,
                        c = e.onSelectPrivateServer,
                        u = e.isPriceLoading,
                        l = void 0 !== u && u,
                        d = (0, T.useTranslation)().translate,
                        p = (0, w.useMemo)(function() {
                            var e = function(e) {
                                    switch (e.productType) {
                                        case eL:
                                            if (e.currencySubscriptionBenefit && e.currencySubscriptionBenefit.entitledAmountMicrosPerGrantingPeriod > 0) return "Plus ".concat(e.currencySubscriptionBenefit.entitledAmountMicrosPerGrantingPeriod / 1e6);
                                            return d("Label.Blackbird");
                                        case eU:
                                            return d("Label.CurrencySubscription");
                                        default:
                                            return e.name
                                    }
                                },
                                n = function(t) {
                                    if (t.type === eW.PRIVATE_SERVER) {
                                        var r = t.privateServer;
                                        return r ? (0, g.jsx)(tW, {
                                            privateServer: r,
                                            isPriceLoading: l,
                                            onClick: c ? function() {
                                                return c(r)
                                            } : void 0
                                        }, r.privateServerId) : null
                                    }
                                    var n = t.subscription;
                                    return n ? (0, g.jsx)(tY, {
                                        subscriptionName: e(n),
                                        subscriptionProviderName: n.subscriptionProviderName,
                                        subscriptionPaymentProvider: n.paymentProvider,
                                        iconImageAssetId: n.iconImageAssetId,
                                        productType: n.productType,
                                        price: n.price,
                                        priceInRobux: n.priceInRobux,
                                        purchasePlatform: n.purchasePlatform,
                                        subscriptionPeriod: n.subscriptionPeriod,
                                        periodCount: n.periodCount,
                                        expiration: n.expiration,
                                        renewal: n.renewal,
                                        showLowBalanceNotification: n.showLowBalanceNotification,
                                        subscriptionOffers: n.subscriptionOffers,
                                        onClick: s ? function() {
                                            return s(function(e) {
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
                                            }({}, n), !1)
                                        } : void 0
                                    }, n.subscriptionTargetKey) : null
                                },
                                i = function(e) {
                                    var t;
                                    return e.type === eW.SUBSCRIPTION && (null == (t = e.subscription) ? void 0 : t.productType) === eL
                                },
                                a = r.filter(i).map(n),
                                o = r.filter(function(e) {
                                    return !i(e)
                                }).map(n),
                                u = t ? (0, g.jsx)(tY, {
                                    subscriptionName: tq(t),
                                    subscriptionProviderName: t.subscriptionProviderName,
                                    price: t.price,
                                    subscriptionPeriod: tH(t),
                                    expiration: new Date(t.expiration),
                                    renewal: new Date(t.renewal),
                                    showLowBalanceNotification: t.showLowBalanceNotification,
                                    isPremium: !0,
                                    onClick: s ? function() {
                                        return s(t, !0)
                                    } : void 0
                                }, "premium") : null;
                            return tV(a).concat([u], tV(o)).filter(function(e) {
                                return null !== e
                            })
                        }, [t, r, s, c, l, d]),
                        f = p.slice((a - 1) * i, Math.min(a * i, p.length)),
                        h = Math.ceil(p.length / i),
                        m = p.length > i ? (0, g.jsx)("div", {
                            className: "overview-pagination-container",
                            children: (0, g.jsx)(to.Pagination, {
                                current: a,
                                total: h,
                                onChange: o,
                                hasNext: !0
                            })
                        }) : null;
                    return (0, g.jsx)("div", {
                        className: ta()({
                            "no-active": 0 === p.length
                        }),
                        children: p.length > 0 ? (0, g.jsxs)(P().Fragment, {
                            children: [f, m]
                        }) : (0, g.jsx)("span", {
                            className: "text-description",
                            children: n
                        })
                    })
                },
                tz = window.Roblox["core-scripts"].react,
                tX = function(e) {
                    var t = e.iconName,
                        r = e.label;
                    return (0, g.jsxs)("div", {
                        className: "gap-x-medium align-items-center flex flex-row",
                        children: [(0, g.jsx)(td, {
                            name: t,
                            size: "Large"
                        }), (0, g.jsx)("span", {
                            className: "[font-size:var(--font-size-350)]",
                            children: r
                        })]
                    })
                },
                tQ = function(e) {
                    var t = e.featureConfig,
                        r = e.periodType,
                        n = e.currencySubscriptionBenefit,
                        i = (0, tz.useTranslation)(),
                        a = i.translate,
                        o = i.intl,
                        s = (0, w.useMemo)(function() {
                            var e;
                            return null == (e = t.virtualTransactionDiscounts) ? void 0 : e.find(function(e) {
                                return 0 === e.periodIndex
                            })
                        }, [t]),
                        c = (0, w.useMemo)(function() {
                            var e;
                            return null == (e = t.virtualTransactionDiscounts) ? void 0 : e.filter(function(e) {
                                return e.periodIndex > 0
                            }).reduce(function(e, t) {
                                return null === e || t.periodIndex < e.periodIndex ? t : e
                            }, null)
                        }, [t]);
                    return (0, g.jsxs)("div", {
                        className: "gap-y-xlarge flex flex-col",
                        children: [s && (0, g.jsx)(tX, {
                            iconName: "icon-regular-tag",
                            label: a("Description.Benefit.DiscountBase", {
                                discountPercent: o.n(.01 * s.discountPercent, {
                                    style: "percent"
                                })
                            })
                        }), c && (0, g.jsx)(tX, {
                            iconName: "icon-regular-tag-arrow-up",
                            label: a("Description.Benefit.DiscountNext", {
                                productName: a("Label.Blackbird"),
                                discountPercent: o.n(.01 * c.discountPercent, {
                                    style: "percent"
                                }),
                                discountPeriodCount: o.n(c.periodIndex),
                                discountPeriodUnit: r
                            })
                        }), (0, g.jsx)(tX, {
                            iconName: "icon-regular-controller",
                            label: a("Label.BlackbirdPSDiscount")
                        }), n && n.entitledAmountMicrosPerGrantingPeriod > 0 && (0, g.jsx)(tX, {
                            iconName: "icon-regular-robux",
                            label: a("Description.Benefit.RobuxStipend", {
                                amount: o.n(Math.round(n.entitledAmountMicrosPerGrantingPeriod / 1e6)),
                                periodType: n.grantingPeriodType
                            })
                        }), t.isRobuxTransferEnabled && (0, g.jsx)(tX, {
                            iconName: "icon-regular-robux",
                            label: a("Description.Benefit.RobuxTransfers")
                        }), t.isTradingEnabled && (0, g.jsx)(tX, {
                            iconName: "icon-regular-hand-two-arrows-horizontal",
                            label: a("Description.Benefit.TradeResellItems")
                        }), t.isUgcPublishingEnabled && (0, g.jsx)(tX, {
                            iconName: "icon-regular-arrow-up-from-landscape-rectangle",
                            label: a("Description.Benefit.PublishItems")
                        })]
                    })
                },
                t$ = function(e) {
                    var t = e.title,
                        r = e.body;
                    return (0, g.jsxs)("div", {
                        className: "bg-shift-200 radius-medium padding-medium gap-medium width-full flex items-center",
                        children: [(0, g.jsx)("div", {
                            className: "radius-medium size-[50px] shrink-0 overflow-hidden",
                            children: (0, g.jsx)("img", {
                                alt: t,
                                className: "size-full object-cover",
                                src: "https://images.rbxcdn.com/e111b658028dba05.gif"
                            })
                        }), (0, g.jsxs)("div", {
                            className: "min-width-0 grow-1 shrink-1 flex basis-0 flex-col justify-center",
                            children: [(0, g.jsx)("span", {
                                className: "text-title-medium content-emphasis",
                                children: t
                            }), (0, g.jsx)("span", {
                                className: "text-body-medium content-default",
                                children: r
                            })]
                        })]
                    })
                },
                tJ = function(e) {
                    var t = e.title,
                        r = e.body;
                    return (0, g.jsxs)("div", {
                        className: "bg-shift-200 radius-medium padding-medium gap-medium width-full flex items-center",
                        children: [(0, g.jsx)("div", {
                            className: "radius-medium size-[50px] shrink-0 flex items-center justify-center",
                            children: (0, g.jsx)(td, {
                                className: "!size-900",
                                name: "icon-regular-roblox-plus"
                            })
                        }), (0, g.jsxs)("div", {
                            className: "min-width-0 grow-1 shrink-1 flex basis-0 flex-col justify-center",
                            children: [(0, g.jsx)("span", {
                                className: "text-title-medium content-emphasis",
                                children: t
                            }), (0, g.jsx)("span", {
                                className: "text-body-medium content-default",
                                children: r
                            })]
                        })]
                    })
                };
            N.urlService.getAbsoluteUrl("/upgrades/redeem?ap=0&subscriptionTargetKey="), N.urlService.getAbsoluteUrl("/upgrades/checkout/success");
            var tZ = N.urlService.getAbsoluteUrl("/redeem"),
                t0 = N.urlService.getAbsoluteUrl("/giftcards");
            N.urlService.getAbsoluteUrl("/my/account#!/billing"), r(664);
            var t1 = (0, w.createContext)(null),
                t2 = function() {
                    var e = (0, w.useContext)(t1);
                    if (null === e) throw Error("System feedback context was not provided in the current scope!");
                    return e
                };

            function t3(e, t) {
                return null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function t4(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var t6 = function e() {
                var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {
                    baseUrl: ""
                };
                if (!t3(this, e)) throw TypeError("Cannot call a class as a function");
                t4(this, "configuration", void 0), t4(this, "baseUrl", void 0), this.configuration = t, this.baseUrl = this.configuration.baseUrl
            };

            function t5(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var t8 = function() {
                var e;

                function t() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : new t6;
                    if (!t3(this, t)) throw TypeError("Cannot call a class as a function");
                    t5(this, "configuration", void 0), t5(this, "baseUrl", void 0), this.configuration = e, this.baseUrl = e.baseUrl
                }
                return e = [{
                        key: "sendEvent",
                        value: function(e) {
                            var t = e.localTime,
                                r = e.target,
                                n = e.eventType,
                                i = e.context,
                                a = e.additionalProperties,
                                o = e.currentUrl,
                                s = e.guestId,
                                c = e.sessionId,
                                u = t.toISOString(),
                                l = new URL("".concat(this.baseUrl, "/pe"));
                            return l.searchParams.append("t", r), l.searchParams.append("evt", n), l.searchParams.append("ctx", i), l.searchParams.append("lt", u), l.searchParams.append("url", o || window.location.href), void 0 !== s && l.searchParams.append("gid", s), void 0 !== c && l.searchParams.append("sid", c), void 0 !== a && Object.keys(a).forEach(function(e) {
                                var t;
                                l.searchParams.append(e, (null != (t = a[e]) ? t : "").toString())
                            }), fetch(l.href, {
                                credentials: "same-origin"
                            })
                        }
                    }, {
                        key: "sendEventViaImg",
                        value: function(e, t) {
                            var r = e.localTime,
                                n = e.target,
                                i = e.eventType,
                                a = e.context,
                                o = e.additionalProperties,
                                s = e.currentUrl,
                                c = e.guestId,
                                u = e.sessionId,
                                l = r.toISOString(),
                                d = new URL("".concat(this.baseUrl, "/e.png"));
                            d.searchParams.append("t", n), d.searchParams.append("evt", i), d.searchParams.append("ctx", a), d.searchParams.append("lt", l), d.searchParams.append("url", s || window.location.href), void 0 !== c && d.searchParams.append("gid", c), void 0 !== u && d.searchParams.append("sid", u), void 0 !== o && Object.keys(o).forEach(function(e) {
                                var t;
                                d.searchParams.append(e, (null != (t = o[e]) ? t : "").toString())
                            });
                            var p = new Image;
                            return p.src = d.href, p.onload = function() {
                                void 0 !== t && t(!0)
                            }, p.onerror = function(e) {
                                void 0 !== t && t(!1), console.error(e)
                            }, p
                        }
                    }],
                    function(e, t) {
                        for (var r = 0; r < t.length; r++) {
                            var n = t[r];
                            n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                        }
                    }(t.prototype, e), t
            }();

            function t7(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var t9 = x.EnvironmentUrls.domain,
                re = ((p = {}).INVALID = "INVALID", p.PAGE_LOAD = "PAGE_LOAD", p.VIEW_ACTIVE = "VIEW_ACTIVE", p.VIEW_INACTIVE = "VIEW_INACTIVE", p.CLICK_CANCEL = "CLICK_CANCEL", p.CANCEL_SUCCESS = "CANCEL_SUCCESS", p.EMAIL_REFERER_PAGE_LOAD = "EMAIL_REFERER_PAGE_LOAD", p.CLICK_EDIT_PAYMENT_METHOD = "CLICK_EDIT_PAYMENT_METHOD", p.CLICK_UPDATE_PAYMENT_METHOD = "CLICK_UPDATE_PAYMENT_METHOD", p.UPDATE_PAYMENT_METHOD_SUCCESS = "UPDATE_PAYMENT_METHOD_SUCCESS", p.UPDATE_PAYMENT_METHOD_EXPIRATION_SUCCESS = "UPDATE_PAYMENT_METHOD_EXPIRATION_SUCCESS", p.UPDATE_PAYMENT_METHOD_ADD_CARD_CLICKED = "UPDATE_PAYMENT_METHOD_ADD_CARD_CLICKED", p.UPDATE_PAYMENT_METHOD_ADD_CARD_SUCCESS = "UPDATE_PAYMENT_METHOD_ADD_CARD_SUCCESS", p.UPDATE_PAYMENT_METHOD_FAILURE = "UPDATE_PAYMENT_METHOD_FAILURE", p.UPDATE_PAYMENT_METHOD_EXPIRATION_FAILURE = "UPDATE_PAYMENT_METHOD_EXPIRATION_FAILURE", p.UPDATE_PAYMENT_METHOD_ADD_CARD_FAILURE = "UPDATE_PAYMENT_METHOD_ADD_CARD_FAILURE", p.RESUBSCRIBE_SUCCESS = "RESUBSCRIBE_SUCCESS", p.CLICK_RESUBSCRIBE = "CLICK_RESUBSCRIBE", p),
                rt = new t8(new t6({
                    baseUrl: "https://ecsv2.".concat(t9, "/www")
                })),
                rr = function(e, t) {
                    var r = {
                        userAction: e
                    };
                    if (t) {
                        var n, i = (n = t.subscriptionTargetKey.split("-"), function(e) {
                                if (Array.isArray(e)) return e
                            }(n) || function(e, t) {
                                var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                if (null != i) {
                                    var a = [],
                                        o = !0,
                                        s = !1;
                                    try {
                                        for (i = i.call(e); !(o = (r = i.next()).done) && (a.push(r.value), a.length !== t); o = !0);
                                    } catch (e) {
                                        s = !0, n = e
                                    } finally {
                                        try {
                                            o || null == i.return || i.return()
                                        } finally {
                                            if (s) throw n
                                        }
                                    }
                                    return a
                                }
                            }(n, 2) || function(e, t) {
                                if (e) {
                                    if ("string" == typeof e) return t7(e, 2);
                                    var r = Object.prototype.toString.call(e).slice(8, -1);
                                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return t7(e, t)
                                }
                            }(n, 2) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }()),
                            a = i[0],
                            o = i[1];
                        if (!a || !o) return null;
                        r.subscriptionProviderId = "Roblox" === t.subscriptionProviderName ? "Roblox" : t.providerId, r.subscriptionProductTypePrefix = a, r.subscriptionId = o, r.localizedSubscriptionName = t.name, r.isActive = t.expiration > new Date
                    }
                    var s = {
                        target: "www",
                        localTime: new Date,
                        eventType: "SubscriptionManagement",
                        context: "",
                        additionalProperties: function(e) {
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
                        }({}, r)
                    };
                    if (rk.has(e)) {
                        var c = rk.get(e);
                        void 0 !== c && (0, I.fireEvent)(c)
                    }
                    return rt.sendEventViaImg(s)
                },
                rn = "UserHasNoSubscription",
                ri = "CancelSubscriptionButtonClicked",
                ra = "PaymentFailureEmailDirectLink",
                ro = "SubscriptionsClickUpdatePaymentMethod",
                rs = "SubscriptionsUpdatePaymentMethodSuccess",
                rc = "SubscriptionsUpdatePaymentMethodFailure",
                ru = "SubscriptionsUpdatePaymentMethodAddCardClicked",
                rl = "SubscriptionsUpdatePaymentMethodAddCardSuccess",
                rd = "SubscriptionsUpdatePaymentMethodAddCardFailed",
                rp = "SubscriptionsUpdatePaymentMethodAddLimitedCardSuccess",
                rf = "SubscriptionsClickResubscribe",
                rh = "SubscriptionsResubscribeSuccess",
                rm = "GetUserPremiumSubscriptionCalled",
                rb = "GetUserPremiumSubscriptionSucceeded",
                ry = "GetUserPremiumSubscriptionFailed",
                rv = "GetSavedPaymentProfilesCalled",
                rg = "GetSavedPaymentProfilesSucceeded",
                rw = "GetSavedPaymentProfilesFailed",
                rP = "DeleteSavedPaymentProfileCalled",
                rS = "DeleteSavedPaymentProfileSucceeded",
                rx = "DeleteSavedPaymentProfileFailed",
                rE = "UpdateSavedPaymentProfileCalled",
                rT = "UpdateSavedPaymentProfileSucceeded",
                rC = "UpdateSavedPaymentProfileFailed",
                rk = new Map([
                    [re.CLICK_UPDATE_PAYMENT_METHOD, ro],
                    [re.UPDATE_PAYMENT_METHOD_SUCCESS, rs],
                    [re.UPDATE_PAYMENT_METHOD_FAILURE, rc],
                    [re.EMAIL_REFERER_PAGE_LOAD, ra],
                    [re.UPDATE_PAYMENT_METHOD_ADD_CARD_CLICKED, ru],
                    [re.UPDATE_PAYMENT_METHOD_ADD_CARD_SUCCESS, rl],
                    [re.UPDATE_PAYMENT_METHOD_ADD_CARD_FAILURE, rd],
                    [re.CLICK_RESUBSCRIBE, rf],
                    [re.RESUBSCRIBE_SUCCESS, rh]
                ]);

            function rA(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rI(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var a = [],
                            o = !0,
                            s = !1;
                        try {
                            for (i = i.call(e); !(o = (r = i.next()).done) && (a.push(r.value), !t || a.length !== t); o = !0);
                        } catch (e) {
                            s = !0, n = e
                        } finally {
                            try {
                                o || null == i.return || i.return()
                            } finally {
                                if (s) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return rA(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rA(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var rD = function(e) {
                var t = e.className,
                    r = e.subscription,
                    n = e.onCancel,
                    i = e.isPremium,
                    a = void 0 !== i && i,
                    o = (0, T.useTranslation)().translate,
                    s = rI((0, w.useState)(!1), 2),
                    c = s[0],
                    u = s[1],
                    l = rI((0, w.useState)(!1), 2),
                    d = l[0],
                    p = l[1],
                    f = rI((0, w.useState)(!1), 2),
                    h = f[0],
                    m = f[1],
                    b = t2().systemFeedbackService,
                    y = D.deviceMeta.getDeviceMeta();
                (0, w.useEffect)(function() {
                    tU(r.renewal, r.expiration) && u(!0)
                }, [r.renewal, r.expiration]);
                var v = r.renewal.toLocaleDateString(void 0, {
                    day: "2-digit",
                    month: "short",
                    year: "numeric"
                });
                return (0, g.jsxs)(P().Fragment, {
                    children: [!c && (!a || r.purchasePlatform === eq.DESKTOP || r.purchasePlatform === eq.ANDROID_APP && (null == y ? void 0 : y.isAndroidApp)) && (0, g.jsx)("button", {
                        type: "button",
                        className: t,
                        onClick: function() {
                            a || rr(re.CLICK_CANCEL, r), p(!0)
                        },
                        children: o("Action.CancelRenewal")
                    }), (0, g.jsxs)(to.Modal, {
                        show: d,
                        onHide: function() {
                            return p(!1)
                        },
                        children: [(0, g.jsx)(to.Modal.Header, {
                            className: "cancel-modal-header",
                            title: o("Action.CancelSubscription"),
                            showCloseButton: !0,
                            onClose: function() {
                                return p(!1)
                            }
                        }), (0, g.jsx)(to.Modal.Body, {
                            children: r.productType === eL ? (0, g.jsxs)(P().Fragment, {
                                children: [(0, g.jsx)("p", {
                                    children: o("Message.Subscriptions.PlusCancelBody", {
                                        subscriptionExpirationDate: v
                                    })
                                }), (0, g.jsx)("p", {
                                    children: o("Message.Subscriptions.PlusCancelBody2")
                                })]
                            }) : o("Message.Subscriptions.AccessUntil", {
                                subscriptionExpirationDate: v
                            })
                        }), (0, g.jsxs)(to.Modal.Footer, {
                            className: "cancel-modal-footer",
                            children: [(0, g.jsx)("button", {
                                type: "button",
                                className: "btn-secondary-md btn-full-width",
                                onClick: function() {
                                    return p(!1)
                                },
                                children: o("Action.Subscriptions.StopCancel")
                            }), (0, g.jsx)("button", {
                                type: "button",
                                className: "btn-cta-md btn-full-width",
                                onClick: function() {
                                    var e, t, i;
                                    if (a) {
                                        if ((0, I.fireEvent)(ri), r.purchasePlatform === eq.ANDROID_APP && (null == y ? void 0 : y.isAndroidApp)) {
                                            window.location.href = "https://play.google.com/store/account/subscriptions";
                                            return
                                        }
                                        t = D.authenticatedUser.id, e = e3(function() {
                                            var e;
                                            return e6(this, function(r) {
                                                switch (r.label) {
                                                    case 0:
                                                        return e = eJ.url.cancelPremiumSubscription(t), [4, N.httpService.post(e)];
                                                    case 1:
                                                        return r.sent(), [2]
                                                }
                                            })
                                        })()
                                    } else i = r.subscriptionTargetKey, e = e3(function() {
                                        var e;
                                        return e6(this, function(t) {
                                            switch (t.label) {
                                                case 0:
                                                    return e = eJ.url.cancelSubscription(i), [4, N.httpService.post(e)];
                                                case 1:
                                                    return t.sent(), [2]
                                            }
                                        })
                                    })();
                                    p(!1), e.then(function() {
                                        b.success(o("Response.Subscriptions.CancelSuccess")), u(!0), n && n(a, r.subscriptionTargetKey), a || rr(re.CANCEL_SUCCESS, r)
                                    }).catch(function() {
                                        return m(!0)
                                    })
                                },
                                children: o("Action.Subscriptions.CancelSubscription")
                            })]
                        })]
                    }), (0, g.jsxs)(to.Modal, {
                        show: h,
                        onHide: function() {
                            return m(!1)
                        },
                        children: [(0, g.jsx)(to.Modal.Header, {
                            className: "cancel-modal-header",
                            title: o("Heading.Dialog.DefaultError"),
                            showCloseButton: !0,
                            onClose: function() {
                                return m(!1)
                            }
                        }), (0, g.jsxs)(to.Modal.Body, {
                            className: "cancel-error-body",
                            children: [o("Response.Subscriptions.CancelUnknownError"), (0, g.jsx)("span", {
                                className: "icon-status-alert-xl"
                            })]
                        }), (0, g.jsx)(to.Modal.Footer, {
                            className: "cancel-modal-footer",
                            children: (0, g.jsx)("button", {
                                type: "button",
                                className: "btn-cta-md btn-full-width",
                                onClick: function() {
                                    return m(!1)
                                },
                                children: o("Action.Dialog.Success")
                            })
                        })]
                    })]
                })
            };

            function rN(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rj(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var a = [],
                            o = !0,
                            s = !1;
                        try {
                            for (i = i.call(e); !(o = (r = i.next()).done) && (a.push(r.value), !t || a.length !== t); o = !0);
                        } catch (e) {
                            s = !0, n = e
                        } finally {
                            try {
                                o || null == i.return || i.return()
                            } finally {
                                if (s) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return rN(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rN(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            r(999);
            var rO = function(e) {
                var t = e.className,
                    r = e.subscription,
                    n = e.onResubscribe,
                    i = e.isPremium,
                    a = void 0 !== i && i,
                    o = e.assumeEligible,
                    s = void 0 !== o && o,
                    c = (0, T.useTranslation)().translate,
                    u = rj((0, w.useState)(s), 2),
                    l = u[0],
                    d = u[1],
                    p = rj((0, w.useState)(!1), 2),
                    f = p[0],
                    h = p[1],
                    m = rj((0, w.useState)(!1), 2),
                    b = m[0],
                    y = m[1],
                    v = t2().systemFeedbackService;
                (0, w.useEffect)(function() {
                    if (!s) {
                        var e;
                        (e = {
                            subscriptionProductTargetKey: r.subscriptionTargetKey
                        }, e3(function() {
                            return e6(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        return t.trys.push([0, 2, , 3]), [4, N.httpService.get(eJ.url.getSubscriptionResubscribeEligibility(e.subscriptionProductTargetKey))];
                                    case 1:
                                        return [2, t.sent().data];
                                    case 2:
                                        return t.sent(), [2, {
                                            canResubscribe: !1
                                        }];
                                    case 3:
                                        return [2]
                                }
                            })
                        })()).then(function(e) {
                            e && d(e.canResubscribe)
                        }).catch(function() {
                            d(!1)
                        })
                    }
                }, [r.subscriptionTargetKey, s]);
                var S = r.expiration.toLocaleDateString(void 0, {
                        day: "2-digit",
                        month: "short",
                        year: "numeric"
                    }),
                    x = a ? tH(r) : r.subscriptionPeriod || eG.MONTH,
                    E = a ? void 0 : r.periodCount,
                    C = !a && "priceInRobux" in r ? r.priceInRobux : null,
                    k = null != C && C > 0;
                return (0, g.jsxs)(P().Fragment, {
                    children: [l && (0, g.jsx)("button", {
                        type: "button",
                        className: t,
                        onClick: function() {
                            !a && "subscriptionTargetKey" in r && rr(re.CLICK_RESUBSCRIBE, r), h(!0)
                        },
                        "data-testid": "resubscribe",
                        children: c("Action.Resubscribe")
                    }), (0, g.jsxs)(to.Modal, {
                        show: f,
                        onHide: function() {
                            return h(!1)
                        },
                        children: [(0, g.jsx)(to.Modal.Header, {
                            className: "resubscribe-modal-header",
                            title: c("Action.Resubscribe"),
                            showCloseButton: !0,
                            onClose: function() {
                                return h(!1)
                            }
                        }), (0, g.jsx)(to.Modal.Body, {
                            className: "resubscribe-modal-body",
                            children: function() {
                                if (k) return (0, g.jsx)("div", {
                                    children: (0, g.jsxs)("div", {
                                        className: "description-top",
                                        children: [(0, g.jsx)("span", {
                                            children: c("Message.Subscriptions.ResubscribeConfirmationP1", {
                                                subscriptionName: r.name,
                                                subscriptionRenewalDate: S
                                            })
                                        }), " ", (0, g.jsxs)("span", {
                                            children: [c("Message.Subscriptions.ResubscribeConfirmationP2"), " "]
                                        }), (0, g.jsx)(tC, {
                                            priceInRobux: C
                                        })]
                                    })
                                });
                                if (r.cardInfo) {
                                    var e = "****".concat(r.cardInfo.last4Digits);
                                    return (0, g.jsxs)("div", {
                                        children: [(0, g.jsxs)("div", {
                                            className: "description-top",
                                            children: [(0, g.jsx)("span", {
                                                children: c("Message.Subscriptions.ResubscribeConfirmationP1", {
                                                    subscriptionName: r.name,
                                                    subscriptionRenewalDate: S
                                                })
                                            }), (0, g.jsxs)("div", {
                                                className: "resubscribe-payment-container",
                                                children: [(0, g.jsx)("span", {
                                                    className: ta()("resubscribe-card-icon", tR(r.purchasePlatform, r.paymentProvider, r.cardInfo))
                                                }), (0, g.jsx)("span", {
                                                    className: "card-four-digits",
                                                    children: e
                                                })]
                                            }), (0, g.jsxs)("span", {
                                                children: [c("Message.Subscriptions.ResubscribeConfirmationP2"), " "]
                                            }), (0, g.jsx)(tT, {
                                                price: r.price,
                                                period: x,
                                                periodCount: E,
                                                className: "resubscribe"
                                            })]
                                        }), (0, g.jsx)("div", {
                                            className: "description-bottom",
                                            children: c("Message.Subscriptions.ResubscribeConfirmationP3")
                                        })]
                                    })
                                }
                                return (0, g.jsx)("div", {})
                            }()
                        }), (0, g.jsxs)(to.Modal.Footer, {
                            className: "resubscribe-modal-footer",
                            children: [(0, g.jsx)("button", {
                                type: "button",
                                className: "btn-secondary-md btn-full-width",
                                onClick: function() {
                                    return h(!1)
                                },
                                children: c("Action.Cancel")
                            }), (0, g.jsx)("button", {
                                type: "button",
                                className: "btn-cta-md btn-full-width",
                                onClick: function() {
                                    var e;
                                    h(!1), (e = {
                                        subscriptionProductTargetKey: r.subscriptionTargetKey
                                    }, e3(function() {
                                        var t;
                                        return e6(this, function(r) {
                                            switch (r.label) {
                                                case 0:
                                                    return t = eJ.url.resubscribeSubscription(e.subscriptionProductTargetKey), [4, N.httpService.post(t)];
                                                case 1:
                                                    return r.sent(), [2]
                                            }
                                        })
                                    })()).then(function() {
                                        v.success(c("Response.Subscriptions.ResubscribeSuccess")), d(!1), n && n(a, "subscriptionTargetKey" in r ? r.subscriptionTargetKey : void 0), !a && "subscriptionTargetKey" in r && rr(re.RESUBSCRIBE_SUCCESS, r)
                                    }).catch(function() {
                                        return y(!0)
                                    })
                                },
                                children: c("Action.Resubscribe")
                            })]
                        })]
                    }), (0, g.jsxs)(to.Modal, {
                        show: b,
                        onHide: function() {
                            return y(!1)
                        },
                        children: [(0, g.jsx)(to.Modal.Header, {
                            className: "resubscribe-modal-header",
                            title: c("Heading.Dialog.DefaultError"),
                            showCloseButton: !0,
                            onClose: function() {
                                return y(!1)
                            }
                        }), (0, g.jsxs)(to.Modal.Body, {
                            className: "resubscribe-error-body",
                            children: [c("Error.GenericError"), (0, g.jsx)("span", {
                                className: "icon-status-alert-xl"
                            })]
                        }), (0, g.jsx)(to.Modal.Footer, {
                            className: "resubscribe-modal-footer",
                            children: (0, g.jsx)("button", {
                                type: "button",
                                className: "btn-cta-md btn-full-width",
                                onClick: function() {
                                    return y(!1)
                                },
                                children: c("Action.Dialog.Success")
                            })
                        })]
                    })]
                })
            };

            function rM(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rR(e) {
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

            function rU(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function rL(e, t) {
                if (null == e) return {};
                var r, n, i = function(e, t) {
                    if (null == e) return {};
                    var r, n, i = {},
                        a = Object.keys(e);
                    for (n = 0; n < a.length; n++) r = a[n], t.indexOf(r) >= 0 || (i[r] = e[r]);
                    return i
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var a = Object.getOwnPropertySymbols(e);
                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r])
                }
                return i
            }

            function r_(e) {
                return function(e) {
                    if (Array.isArray(e)) return rM(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return rM(e, void 0);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rM(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rB(e) {
                return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function rY(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }
            var rF = Symbol.for("react.lazy"),
                rH = w[" use ".trim().toString()];

            function rq(e) {
                var t;
                return null != e && "object" == (void 0 === e ? "undefined" : rB(e)) && "$$typeof" in e && e.$$typeof === rF && "_payload" in e && "object" == rB(t = e._payload) && null !== t && "then" in t
            }
            var rW = ((e = w.forwardRef(function(e, t) {
                    var r = e.children,
                        n = rL(e, ["children"]);
                    if (rq(r) && "function" == typeof rH && (r = rH(r._payload)), w.isValidElement(r)) {
                        var i, a, o, s, c = (s = null == (a = Object.getOwnPropertyDescriptor((i = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in s && s.isReactWarning ? i.ref : (s = null == (o = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : o.get) && "isReactWarning" in s && s.isReactWarning ? i.props.ref : i.props.ref || i.ref,
                            u = function(e, t) {
                                var r = rR({}, t);
                                for (var n in t) ! function(n) {
                                    var i = e[n],
                                        a = t[n];
                                    /^on[A-Z]/.test(n) ? i && a ? r[n] = function() {
                                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                        var n = a.apply(void 0, r_(t));
                                        return i.apply(void 0, r_(t)), n
                                    } : i && (r[n] = i) : "style" === n ? r[n] = rR({}, i, a) : "className" === n && (r[n] = [i, a].filter(Boolean).join(" "))
                                }(n);
                                return rR({}, e, r)
                            }(n, r.props);
                        return r.type !== w.Fragment && (u.ref = t ? function() {
                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                            return function(e) {
                                var r = !1,
                                    n = t.map(function(t) {
                                        var n = rY(t, e);
                                        return r || "function" != typeof n || (r = !0), n
                                    });
                                if (r) return function() {
                                    for (var e = 0; e < n.length; e++) {
                                        var r = n[e];
                                        "function" == typeof r ? r() : rY(t[e], null)
                                    }
                                }
                            }
                        }(t, c) : c), w.cloneElement(r, u)
                    }
                    return w.Children.count(r) > 1 ? w.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), f = e, (h = w.forwardRef(function(e, t) {
                    var r = e.children,
                        n = rL(e, ["children"]);
                    rq(r) && "function" == typeof rH && (r = rH(r._payload));
                    var i = w.Children.toArray(r),
                        a = i.find(rV);
                    if (a) {
                        var o = a.props.children,
                            s = i.map(function(e) {
                                return e === a ? w.Children.count(o) > 1 ? w.Children.only(null) : w.isValidElement(o) ? o.props.children : null : e
                            });
                        return (0, g.jsx)(f, rU(rR({}, n), {
                            ref: t,
                            children: w.isValidElement(o) ? w.cloneElement(o, void 0, s) : null
                        }))
                    }
                    return (0, g.jsx)(f, rU(rR({}, n), {
                        ref: t,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), h),
                rG = Symbol("radix.slottable");

            function rV(e) {
                return w.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === rG
            }
            var rK = {
                    Large: "size-1200",
                    Medium: "size-1000",
                    Small: "size-800",
                    XSmall: "size-600"
                },
                rz = {
                    XSmall: "size-300",
                    Small: "size-400",
                    Medium: "size-500",
                    Large: "size-500"
                },
                rX = {
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
                rQ = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-alert",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                r$ = {
                    Emphasis: "bg-action-standard",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                rJ = {
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
                rZ = {
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
                r0 = (0, w.forwardRef)(function(e, t) {
                    var r = e.className,
                        n = e.icon,
                        i = e.ariaLabel,
                        a = e.isDisabled,
                        o = void 0 !== a && a,
                        s = e.isCircular,
                        c = e.size,
                        u = void 0 === c ? "Large" : c,
                        l = e.variant,
                        d = void 0 === l ? "Emphasis" : l,
                        p = e.iconColor,
                        f = void 0 === p ? "Default" : p,
                        h = e.asChild,
                        m = e.children,
                        b = tc(e, ["className", "icon", "ariaLabel", "isDisabled", "isCircular", "size", "variant", "iconColor", "asChild", "children"]),
                        y = tu("foundation-web-icon-button", o ? th : [tp, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", rK[u], rX[u][void 0 !== s && s ? "circular" : "square"], o ? r$[d] : rQ[d], r),
                        v = P().createElement(P().Fragment, null, P().createElement(tf, null), P().createElement("span", {
                            className: tu("icon", n, rz[u], o ? rZ[f][d] : rJ[f][d])
                        }));
                    if (h) {
                        var g = tc(b, ["as"]),
                            w = P().Children.only(m);
                        return P().createElement(rW, Object.assign({
                            ref: t
                        }, g, {
                            className: y,
                            "aria-label": i,
                            "aria-disabled": o || void 0
                        }), P().cloneElement(w, {}, v))
                    }
                    if ("a" === b.as) {
                        b.as;
                        var S = b.href,
                            x = tc(b, ["as", "href"]);
                        return P().createElement("a", Object.assign({
                            ref: t
                        }, x, {
                            "aria-label": i,
                            "aria-disabled": o,
                            href: o ? void 0 : S,
                            className: y
                        }), v)
                    }
                    var E = tc(b, ["as"]);
                    return P().createElement("button", Object.assign({
                        ref: t,
                        type: "button"
                    }, E, {
                        "aria-label": i,
                        disabled: o,
                        className: y
                    }), v)
                });
            r(746);
            var r1 = function(e) {
                var t = e.purchasePlatform,
                    r = e.paymentProvider,
                    n = e.cardInfo,
                    i = e.creditBalance,
                    a = e.isPaymentProfileEditingAllowed,
                    o = e.onEditClick,
                    s = (0, T.useTranslation)().translate;
                (0, w.useEffect)(function() {
                    window.dispatchEvent(new CustomEvent("price-tag:render", {
                        detail: {
                            tagClassName: "remaining-credit-balance text-description",
                            targetSelector: ".credit-balance-price-tag"
                        }
                    }))
                }, [i]);
                var c = null;
                if ((t === eV.DESKTOP || t === eq.DESKTOP) && n && r === ez.STRIPE) {
                    var u = new Date(n.expYear, n.expMonth - 1),
                        l = "".concat(s("Label.SavedCreditCard.Exp"), " ").concat(u.toLocaleDateString(void 0, {
                            month: "2-digit",
                            year: "2-digit"
                        })),
                        d = "****".concat(n.last4Digits);
                    c = (0, g.jsxs)(w.Fragment, {
                        children: [(0, g.jsx)("span", {
                            className: "card-four-digits",
                            children: d
                        }), (0, g.jsx)("span", {
                            className: "card-expiraton text-description",
                            children: l
                        }), r === ez.STRIPE && a && (0, g.jsx)(r0, {
                            className: "edit-payment-method-button",
                            icon: "icon-regular-pencil-square",
                            ariaLabel: s("Action.EditPaymentMethod"),
                            title: s("Action.EditPaymentMethod"),
                            size: "Small",
                            variant: "Utility",
                            onClick: o
                        })]
                    })
                } else if (t === eV.DESKTOP && r === ez.CREDITBALANCE) c = (0, g.jsxs)("span", {
                    className: "purchase-platform-text text-description",
                    children: [(0, g.jsx)("span", {
                        className: "font-bold text-emphasis credit-label",
                        children: s("Label.RobloxCredit")
                    }), (0, g.jsxs)("span", {
                        children: [s("Label.Balance"), ":"]
                    }), (0, g.jsx)("span", {
                        className: "credit-balance-price-tag",
                        "data-amount": i.creditBalance,
                        "data-currency-code": i.currencyCode
                    })]
                });
                else {
                    var p = "";
                    switch (t) {
                        case eV.DESKTOP:
                            p = r === ez.BRAINTREE ? s("Label.Subscriptions.PaypalPayment") || "Paypal" : s("Label.Subscriptions.DesktopPayment");
                            break;
                        case eV.APPLE:
                            p = s("Label.Subscriptions.ApplePayment");
                            break;
                        case eV.GOOGLE:
                            p = s("Label.Subscriptions.GooglePayment")
                    }
                    c = (0, g.jsx)("span", {
                        className: "purchase-platform-text text-description",
                        children: p
                    })
                }
                return (0, g.jsxs)("div", {
                    className: "payment-method-container",
                    children: [(0, g.jsx)("span", {
                        className: ta()("card-icon", tR(t, r, n))
                    }), c]
                })
            };

            function r2(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            r(412), r(172);
            var r3 = ((m = {}).ERROR = "error", m.WARNING = "warning", m),
                r4 = function(e) {
                    var t, r = e.title,
                        n = e.body,
                        i = e.bannerType,
                        a = e.showDismiss,
                        o = e.onDismiss,
                        s = (t = (0, w.useState)(""), function(e) {
                            if (Array.isArray(e)) return e
                        }(t) || function(e, t) {
                            var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != i) {
                                var a = [],
                                    o = !0,
                                    s = !1;
                                try {
                                    for (i = i.call(e); !(o = (r = i.next()).done) && (a.push(r.value), a.length !== t); o = !0);
                                } catch (e) {
                                    s = !0, n = e
                                } finally {
                                    try {
                                        o || null == i.return || i.return()
                                    } finally {
                                        if (s) throw n
                                    }
                                }
                                return a
                            }
                        }(t, 2) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return r2(e, 2);
                                var r = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return r2(e, t)
                            }
                        }(t, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        c = s[0],
                        u = s[1];
                    return (0, w.useEffect)(function() {
                        switch (i) {
                            case "warning":
                                u("warning-banner");
                                break;
                            case "error":
                                u("error-banner")
                        }
                    }, [i]), (0, g.jsxs)("div", {
                        className: "banner-container ".concat(c),
                        children: [(0, g.jsx)("div", {
                            className: "icon-status-alert banner-icon"
                        }), (0, g.jsxs)("div", {
                            className: "message",
                            children: [(0, g.jsx)("span", {
                                className: "font-header-2 banner-title",
                                children: r
                            }), n]
                        }), a && (0, g.jsx)("button", {
                            type: "button",
                            className: "banner-close-button",
                            onClick: function() {
                                return o()
                            },
                            children: (0, g.jsx)("span", {
                                className: "icon-close banner-icon"
                            })
                        })]
                    })
                };

            function r6(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function r5(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var a = [],
                            o = !0,
                            s = !1;
                        try {
                            for (i = i.call(e); !(o = (r = i.next()).done) && (a.push(r.value), !t || a.length !== t); o = !0);
                        } catch (e) {
                            s = !0, n = e
                        } finally {
                            try {
                                o || null == i.return || i.return()
                            } finally {
                                if (s) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return r6(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return r6(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var r8 = function(e) {
                var t = e.type,
                    r = e.onNotificationDismiss,
                    n = (0, T.useTranslation)().translate,
                    i = r5((0, w.useState)(r3.WARNING), 2),
                    a = i[0],
                    o = i[1],
                    s = r5((0, w.useState)(""), 2),
                    c = s[0],
                    u = s[1];
                return (0, w.useEffect)(function() {
                    switch (t) {
                        case tI.LOW_BALANCE_WARNING:
                            o(r3.WARNING), u(n("Banner.Header.LowBalanceWarning"));
                            break;
                        case tI.LOW_BALANCE_GRACE_PERIOD:
                            o(r3.ERROR), u(n("Banner.Header.InsufficientBalance"))
                    }
                }, [n, t]), (0, g.jsx)(r4, {
                    title: c,
                    body: (0, g.jsx)("span", {
                        className: "font-caption-header banner-body",
                        dangerouslySetInnerHTML: {
                            __html: n("Banner.Message.LowBalance", {
                                redeemUrlStartTag: "<a href=".concat(tZ, ' class="text-link" target="_blank">'),
                                redeemUrlEndTag: "</a>",
                                giftCardUrlStartTag: "<a href=".concat(t0, ' class="text-link" target="_blank">'),
                                giftCardUrlEndTag: "</a>"
                            })
                        }
                    }),
                    bannerType: a,
                    showDismiss: !0,
                    onDismiss: r
                })
            };

            function r7(e, t, r, n, i, a, o) {
                try {
                    var s = e[a](o),
                        c = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(c) : Promise.resolve(c).then(n, i)
            }
            var r9 = function(e) {
                var t;
                return (t = function() {
                    var t, r, n;
                    return function(e, t) {
                        var r, n, i, a = {
                                label: 0,
                                sent: function() {
                                    if (1 & i[0]) throw i[1];
                                    return i[1]
                                },
                                trys: [],
                                ops: []
                            },
                            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                        return o.next = s(0), o.throw = s(1), o.return = s(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
                            return this
                        }), o;

                        function s(s) {
                            return function(c) {
                                var u = [s, c];
                                if (r) throw TypeError("Generator is already executing.");
                                for (; o && (o = 0, u[0] && (a = 0)), a;) try {
                                    if (r = 1, n && (i = 2 & u[0] ? n.return : u[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, u[1])).done) return i;
                                    switch (n = 0, i && (u = [2 & u[0], i.value]), u[0]) {
                                        case 0:
                                        case 1:
                                            i = u;
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
                                            if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                a = 0;
                                                continue
                                            }
                                            if (3 === u[0] && (!i || u[1] > i[0] && u[1] < i[3])) {
                                                a.label = u[1];
                                                break
                                            }
                                            if (6 === u[0] && a.label < i[1]) {
                                                a.label = i[1], i = u;
                                                break
                                            }
                                            if (i && a.label < i[2]) {
                                                a.label = i[2], a.ops.push(u);
                                                break
                                            }
                                            i[2] && a.ops.pop(), a.trys.pop();
                                            continue
                                    }
                                    u = t.call(e, a)
                                } catch (e) {
                                    u = [6, e], n = 0
                                } finally {
                                    r = i = 0
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
                                return i.trys.push([0, 2, , 3]), [4, N.httpService.get({
                                    url: "".concat(x.EnvironmentUrls.gamesApi, "/v1/games"),
                                    withCredentials: !0
                                }, {
                                    universeIds: [e]
                                })];
                            case 1:
                                return [2, null != (n = null == (r = i.sent().data.data) || null == (t = r[0]) ? void 0 : t.rootPlaceId) ? n : null];
                            case 2:
                                return i.sent(), [2, null];
                            case 3:
                                return [2]
                        }
                    })
                }, function() {
                    var e = this,
                        r = arguments;
                    return new Promise(function(n, i) {
                        var a = t.apply(e, r);

                        function o(e) {
                            r7(a, n, i, o, s, "next", e)
                        }

                        function s(e) {
                            r7(a, n, i, o, s, "throw", e)
                        }
                        o(void 0)
                    })
                })()
            };

            function ne(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nt(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var a = [],
                            o = !0,
                            s = !1;
                        try {
                            for (i = i.call(e); !(o = (r = i.next()).done) && (a.push(r.value), !t || a.length !== t); o = !0);
                        } catch (e) {
                            s = !0, n = e
                        } finally {
                            try {
                                o || null == i.return || i.return()
                            } finally {
                                if (s) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return ne(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ne(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var nr = function(e, t) {
                    return t
                },
                nn = function(e) {
                    var t, r = e.subscription,
                        n = e.isPremium,
                        i = e.creditBalance,
                        a = e.subscriptionMetadata,
                        o = e.onStatusChange,
                        s = e.onNotificationDismiss,
                        c = e.onBack,
                        u = e.onEditPaymentMethodClick,
                        l = e.blackbirdProductInfo,
                        d = e.isFaeFreeTrial,
                        p = void 0 !== d && d,
                        f = (0, T.useTranslation)().translate,
                        h = nt((0, w.useState)(null), 2),
                        m = h[0],
                        b = h[1],
                        y = nt((0, w.useState)(!1), 2),
                        v = y[0],
                        P = y[1],
                        S = nt((0, w.useState)(!1), 2),
                        x = S[0],
                        E = S[1],
                        C = !nr(r, n) && r.productType === eL,
                        A = (0, w.useCallback)(function(e) {
                            e.preventDefault(), !nr(r, n) && r.providerId && r9(r.providerId).then(function(e) {
                                e && (window.location.href = "/games/".concat(e))
                            }).catch(function() {})
                        }, [r, n]);
                    (0, w.useEffect)(function() {
                        var e;
                        b(tD(null != (e = r.showLowBalanceNotification) && e, r.renewal, r.expiration))
                    }, [r]), (0, w.useEffect)(function() {
                        if (r.cardInfo) {
                            var e = new Date(r.cardInfo.expYear, r.cardInfo.expMonth - 1),
                                t = new Date;
                            P(e < new Date(t.getFullYear(), t.getMonth() + 1))
                        }
                    }, [r]);
                    var I = nr(r, n) ? tH(r) : r.subscriptionPeriod || eG.MONTH,
                        D = function() {
                            if (nr(r, n)) return tq(r);
                            switch (r.productType) {
                                case eL:
                                    if (r.currencySubscriptionBenefit && r.currencySubscriptionBenefit.entitledAmountMicrosPerGrantingPeriod > 0) return "Plus ".concat(r.currencySubscriptionBenefit.entitledAmountMicrosPerGrantingPeriod / 1e6);
                                    return f("Label.Blackbird");
                                case eU:
                                    return f("Label.CurrencySubscription");
                                default:
                                    return r.name
                            }
                        }(),
                        N = nr(r, n) && (r.purchasePlatform === eq.IOS_APP || r.purchasePlatform === eq.ANDROID_APP);
                    return (0, g.jsxs)("div", {
                        children: [m && r.showLowBalanceNotification && (0, g.jsx)(r8, {
                            type: m,
                            onNotificationDismiss: function() {
                                return s(nr(r, n) ? "PRM-".concat(r.premiumFeatureId) : r.subscriptionTargetKey)
                            }
                        }), !r.showLowBalanceNotification && r.cardInfo && r.paymentProvider === ez.STRIPE && v && (0, g.jsx)(r4, {
                            title: f("Heading.PaymentMethodAboutToExpire"),
                            body: (0, g.jsx)("span", {
                                className: "font-caption-header banner-body",
                                children: f("Description.UpdatePaymentMethodToAvoidCancellation")
                            }),
                            bannerType: r3.WARNING,
                            showDismiss: !1,
                            onDismiss: function() {
                                return P(!1)
                            }
                        }), (0, g.jsxs)("div", {
                            className: "subscription-details-container",
                            children: [(0, g.jsxs)("button", {
                                type: "button",
                                onClick: c,
                                className: "details-back-button btn-generic-back-sm",
                                children: [(0, g.jsx)("span", {
                                    className: "icon-back"
                                }), f("Action.Back")]
                            }), C && (0, g.jsx)("div", {
                                className: p ? "margin-bottom-medium" : "margin-bottom-large",
                                style: {
                                    gridColumn: "1 / -1"
                                },
                                children: (0, g.jsx)(t$, {
                                    body: f("Description.Subscriptions.BannerBody"),
                                    imageAssetId: 0x4dd938eb5e32,
                                    title: f("Description.Subscriptions.BannerTitle")
                                })
                            }), C && p && (0, g.jsx)("div", {
                                className: "margin-bottom-large",
                                style: {
                                    gridColumn: "1 / -1"
                                },
                                children: (0, g.jsx)(tJ, {
                                    title: f("Header.FreeTrialBannerTitle"),
                                    body: f("Subtext.FreeTrialBanner", {
                                        date: r.expiration.toLocaleDateString(void 0, {
                                            day: "2-digit",
                                            month: "short",
                                            year: "numeric"
                                        })
                                    })
                                })
                            }), (0, g.jsxs)("div", {
                                className: "details-info",
                                children: [(0, g.jsx)("div", {
                                    className: ta()("detail-card-icon-container", {
                                        "detail-card-icon-container--blackbird": C
                                    }),
                                    children: nr(r, n) ? (0, g.jsx)("span", {
                                        className: "premium-icon"
                                    }) : r.productType === eL ? (0, g.jsx)(td, {
                                        className: "!size-900",
                                        name: "icon-regular-roblox-plus"
                                    }) : r.productType === eU ? (0, g.jsx)("span", {
                                        className: "premium-icon"
                                    }) : (0, g.jsx)(ts.Thumbnail2d, {
                                        targetId: null != (t = r.iconImageAssetId) ? t : 0,
                                        type: ts.ThumbnailTypes.assetThumbnail,
                                        imgClassName: "detail-icon",
                                        containerClass: "thumbnail-detail-container",
                                        altName: r.name
                                    })
                                }), (0, g.jsx)("h2", {
                                    className: "detail-subscription-name",
                                    children: D
                                }), !nr(r, n) && r.providerId ? (0, g.jsx)(k.Link, {
                                    href: "/games/".concat(r.providerId),
                                    onClick: A,
                                    underline: "hover",
                                    className: "text-description",
                                    children: r.subscriptionProviderName
                                }) : (0, g.jsx)("span", {
                                    className: "detail-subscription-proider text-description",
                                    children: r.subscriptionProviderName
                                }), !nr(r, n) && null != r.priceInRobux && r.priceInRobux > 0 ? (0, g.jsx)(tC, {
                                    priceInRobux: r.priceInRobux
                                }) : r.price && r.purchasePlatform !== eV.INTERNAL && (0, g.jsx)(tT, {
                                    price: r.price,
                                    period: I,
                                    periodCount: nr(r, n) ? void 0 : r.periodCount,
                                    className: "subscription"
                                }), (0, g.jsxs)("div", {
                                    className: "subscription-billing-cycle-info",
                                    children: [(0, g.jsx)(tk, {
                                        expiration: r.expiration,
                                        renewal: r.renewal
                                    }), tL(r.subscriptionOffers) && (0, g.jsx)(tE, {
                                        as: "button",
                                        isChecked: !1,
                                        size: "Small",
                                        text: f("Label.FreeTrial"),
                                        variant: "Standard"
                                    })]
                                }), !nr(r, n) && !(null != r.priceInRobux && r.priceInRobux > 0) && r.purchasePlatform !== eV.INTERNAL && (0, g.jsx)(r1, {
                                    purchasePlatform: r.purchasePlatform,
                                    paymentProvider: r.paymentProvider,
                                    cardInfo: r.cardInfo,
                                    creditBalance: i,
                                    isPaymentProfileEditingAllowed: a.isSubscriptionPaymentProfileUpdatingEnabled,
                                    onEditClick: u
                                }), nr(r, n) && r.paymentProfileId && (0, g.jsx)(r1, {
                                    purchasePlatform: r.purchasePlatform,
                                    paymentProvider: r.paymentProvider,
                                    cardInfo: r.cardInfo,
                                    creditBalance: i,
                                    isPaymentProfileEditingAllowed: a.isSubscriptionPaymentProfileUpdatingEnabled,
                                    onEditClick: u
                                }), N && (0, g.jsx)("p", {
                                    dangerouslySetInnerHTML: {
                                        __html: f("Message.Subscriptions.PremiumAppStoreCancel", {
                                            aTagStartWithHref: "<a href=",
                                            cancelHelpPagesLink: '"'.concat("https://help.roblox.com/hc/articles/360029312472", '"'),
                                            hrefEnd: ' class="text-link" target="_blank">',
                                            aTagEnd: "</a>"
                                        })
                                    }
                                })]
                            }), tU(r.renewal, r.expiration) ? (0, g.jsx)(rO, {
                                subscription: r,
                                onResubscribe: function() {
                                    return o ? o(n, !1, r.subscriptionTargetKey) : void 0
                                },
                                isPremium: n,
                                assumeEligible: x,
                                className: "resubscribe btn-cta-md"
                            }) : (0, g.jsx)(rD, {
                                subscription: r,
                                onCancel: function() {
                                    E(!0), o && o(n, !0, r.subscriptionTargetKey)
                                },
                                isPremium: n,
                                className: "cancel-renewal btn-control-md"
                            }), (0, g.jsxs)("div", {
                                className: "description-container",
                                children: [(0, g.jsx)("h3", {
                                    className: "detail-description-header",
                                    children: f(C ? "Label.Subscriptions.SubscriptionBenefits" : "Label.Subscriptions.SubscriptionDescription")
                                }), function() {
                                    if (nr(r, n)) return (0, g.jsxs)("div", {
                                        className: "detail-description",
                                        children: [(0, g.jsx)("p", {
                                            children: f("Description.Subscriptions.Premium")
                                        }), (0, g.jsxs)("span", {
                                            className: "premium-benefit-container",
                                            children: [(0, g.jsx)("span", {
                                                className: "icon-menu-games-on"
                                            }), (0, g.jsx)("p", {
                                                children: f("Description.Subscriptions.PremiumBenefits")
                                            })]
                                        }), (0, g.jsxs)("span", {
                                            className: "premium-benefit-container",
                                            children: [(0, g.jsx)("span", {
                                                className: "icon-robux-28x28"
                                            }), (0, g.jsx)("p", {
                                                children: f("Description.Subscriptions.MoreRobux")
                                            })]
                                        }), (0, g.jsxs)("span", {
                                            className: "premium-benefit-container",
                                            children: [(0, g.jsx)("span", {
                                                className: "icon-menu-trade"
                                            }), (0, g.jsx)("p", {
                                                children: f("Description.Subscriptions.Trade")
                                            })]
                                        }), r.robuxStipendAmount >= 1e3 && (0, g.jsxs)("span", {
                                            className: "premium-benefit-container",
                                            children: [(0, g.jsx)("span", {
                                                className: "icon-menu-creations"
                                            }), (0, g.jsx)("p", {
                                                children: f("Description.Subscriptions.MarketplaceSell")
                                            })]
                                        })]
                                    });
                                    switch (r.productType) {
                                        case eL:
                                            if (l) return (0, g.jsx)("div", {
                                                className: "detail-description content-default",
                                                children: (0, g.jsx)(tz.TranslationProvider, {
                                                    config: ["Feature.RobloxSubscription"],
                                                    children: (0, g.jsx)(tQ, {
                                                        featureConfig: l.featureConfig,
                                                        periodType: l.periodType,
                                                        currencySubscriptionBenefit: r.currencySubscriptionBenefit
                                                    })
                                                })
                                            });
                                            return (0, g.jsx)("p", {
                                                className: "detail-description",
                                                children: f("Description.Subscriptions.Blackbird")
                                            });
                                        case eU:
                                            return (0, g.jsx)("p", {
                                                className: "detail-description",
                                                children: f("Description.Subscriptions.CurrencySubscription")
                                            });
                                        default:
                                            return (0, g.jsx)("p", {
                                                className: "detail-description",
                                                children: r.description
                                            })
                                    }
                                }()]
                            })]
                        })]
                    })
                };

            function ni(e, t, r, n, i, a, o) {
                try {
                    var s = e[a](o),
                        c = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(c) : Promise.resolve(c).then(n, i)
            }

            function na(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, i) {
                        var a = e.apply(t, r);

                        function o(e) {
                            ni(a, n, i, o, s, "next", e)
                        }

                        function s(e) {
                            ni(a, n, i, o, s, "throw", e)
                        }
                        o(void 0)
                    })
                }
            }

            function no(e, t) {
                var r, n, i, a = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return o.next = s(0), o.throw = s(1), o.return = s(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
                    return this
                }), o;

                function s(s) {
                    return function(c) {
                        var u = [s, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; o && (o = 0, u[0] && (a = 0)), a;) try {
                            if (r = 1, n && (i = 2 & u[0] ? n.return : u[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, u[1])).done) return i;
                            switch (n = 0, i && (u = [2 & u[0], i.value]), u[0]) {
                                case 0:
                                case 1:
                                    i = u;
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
                                    if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!i || u[1] > i[0] && u[1] < i[3])) {
                                        a.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && a.label < i[1]) {
                                        a.label = i[1], i = u;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(u);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            u = t.call(e, a)
                        } catch (e) {
                            u = [6, e], n = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var ns = r(687),
                nc = r(335);

            function nu(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            r(563);
            var nl = "Error.GenericError";

            function nd(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function np(e, t, r, n, i, a, o) {
                try {
                    var s = e[a](o),
                        c = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(c) : Promise.resolve(c).then(n, i)
            }

            function nf(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var a = [],
                            o = !0,
                            s = !1;
                        try {
                            for (i = i.call(e); !(o = (r = i.next()).done) && (a.push(r.value), !t || a.length !== t); o = !0);
                        } catch (e) {
                            s = !0, n = e
                        } finally {
                            try {
                                o || null == i.return || i.return()
                            } finally {
                                if (s) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return nd(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nd(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            nu(v = {}, eK.INVALID, nl), nu(v, eK.INVALID_INPUT, nl), nu(v, eK.INVALID_PRODUCT, nl), nu(v, eK.INVALID_SALE_LOCATION, nl), nu(v, eK.PURCHASE_PLATFORM_NOT_SUPPORTED, nl), nu(v, eK.RESTRICTED_USER, "Message.CannotPlayInExperience"), nu(v, eK.SAVED_CC_REQUIRED, nl), nu(v, eK.UNKNOWN, nl), nu(v, eK.UNSUPPORTED_LOCALE, "Message.SubscriptionNotAvailableInCountry"), nu(v, eK.USER_ALREADY_SUBSCRIBED, nl), nu(v, eK.USER_HAS_SPEND_LIMIT_SET, "Message.MonthlySpendRestrictions.SubscriptionUnavailable"), nu(v, eK.EXCEED_PARENTAL_SPEND_LIMIT, "Message.MonthlySpendRestrictionsMonthlyLimitExceed"), nu(v, eK.VPC_PENDING_APPROVAL, nl), nu(v, eK.VPC_REQUIRED, "Message.ParentPermissionVPC");
            var nh = function(e) {
                var t = e.children,
                    r = nf((0, w.useState)(null), 2),
                    n = r[0],
                    i = r[1],
                    a = nf((0, w.useState)(""), 2),
                    o = a[0],
                    s = a[1],
                    c = t2().systemFeedbackService,
                    u = (0, T.useTranslation)().translate;
                return ((0, w.useEffect)(function() {
                    var e;
                    (e = function() {
                        var e;
                        return function(e, t) {
                            var r, n, i, a = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & i[0]) throw i[1];
                                        return i[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return o.next = s(0), o.throw = s(1), o.return = s(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
                                return this
                            }), o;

                            function s(s) {
                                return function(c) {
                                    var u = [s, c];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; o && (o = 0, u[0] && (a = 0)), a;) try {
                                        if (r = 1, n && (i = 2 & u[0] ? n.return : u[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, u[1])).done) return i;
                                        switch (n = 0, i && (u = [2 & u[0], i.value]), u[0]) {
                                            case 0:
                                            case 1:
                                                i = u;
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
                                                if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                    a = 0;
                                                    continue
                                                }
                                                if (3 === u[0] && (!i || u[1] > i[0] && u[1] < i[3])) {
                                                    a.label = u[1];
                                                    break
                                                }
                                                if (6 === u[0] && a.label < i[1]) {
                                                    a.label = i[1], i = u;
                                                    break
                                                }
                                                if (i && a.label < i[2]) {
                                                    a.label = i[2], a.ops.push(u);
                                                    break
                                                }
                                                i[2] && a.ops.pop(), a.trys.pop();
                                                continue
                                        }
                                        u = t.call(e, a)
                                    } catch (e) {
                                        u = [6, e], n = 0
                                    } finally {
                                        r = i = 0
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
                                    return t.trys.push([0, 3, , 4]), e = x.EnvironmentUrls.websiteUrl.includes("sitetest1") ? "pk_test_51LNM0XG5RADBkfjhYJlpADA2ArzWIh7gTWTodYNbpEzSiT55dul3VJhaBIVHL0CNyO0gECOz1vPnWArAkjwQ8NBO00Cdf2PxED" : x.EnvironmentUrls.websiteUrl.includes("sitetest3") ? "pk_test_51LNOeQHDRNiW7vlLcKH8TGCpJ7zhaidLdSegE22GCuvQbVUX2xDiGJY6WYaldYyo6qgVxmy1SnSVpSdaqyjfqclU00NQwWntIe" : "pk_live_51LKpO9C8tJWGhK4HEHtny9Dg7xXiQJ1i349cq6KBDusbl8bRHO7QmCKKhX18LPjSirMNTvj3tesq6mhIQuPioeAd0062ZCgoF3", [4, (0, ns.loadStripe)(e)];
                                case 1:
                                    return i(t.sent()), [4, na(function() {
                                        var e, t, r, n;
                                        return no(this, function(i) {
                                            switch (i.label) {
                                                case 0:
                                                    return [4, N.httpService.post(eJ.url.getPaymentProfileSetupUrlConfig(), {
                                                        paymentProvider: "Stripe"
                                                    })];
                                                case 1:
                                                    return [2, null != (n = null == (r = i.sent()) || null == (t = r.data) || null == (e = t.providerPayload) ? void 0 : e.clientSecret) ? n : ""]
                                            }
                                        })
                                    })()];
                                case 2:
                                    return s(t.sent()), [3, 4];
                                case 3:
                                    return t.sent(), c.warning(u(nl)), [3, 4];
                                case 4:
                                    return [2]
                            }
                        })
                    }, function() {
                        var t = this,
                            r = arguments;
                        return new Promise(function(n, i) {
                            var a = e.apply(t, r);

                            function o(e) {
                                np(a, n, i, o, s, "next", e)
                            }

                            function s(e) {
                                np(a, n, i, o, s, "throw", e)
                            }
                            o(void 0)
                        })
                    })()
                }, [c, u]), n && o) ? (0, g.jsx)(nc.Elements, {
                    stripe: n && o ? n : null,
                    options: n && o ? {
                        clientSecret: o,
                        appearance: {
                            theme: document.body.classList.contains("dark-theme") ? "night" : "stripe",
                            labels: "above",
                            rules: {
                                ".Input": {
                                    backgroundColor: document.body.classList.contains("dark-theme") ? "black" : "white"
                                }
                            }
                        }
                    } : void 0,
                    children: t
                }, o) : (0, g.jsx)(w.Fragment, {})
            };

            function nm(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nb(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var a = [],
                            o = !0,
                            s = !1;
                        try {
                            for (i = i.call(e); !(o = (r = i.next()).done) && (a.push(r.value), !t || a.length !== t); o = !0);
                        } catch (e) {
                            s = !0, n = e
                        } finally {
                            try {
                                o || null == i.return || i.return()
                            } finally {
                                if (s) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return nm(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nm(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            r(582);
            var ny = function(e) {
                var t = e.onFormStatusChange,
                    r = e.showEmail,
                    n = e.showDisclosure,
                    i = e.headerText,
                    a = nb((0, w.useState)(!1), 2),
                    o = a[0],
                    s = a[1],
                    c = (0, T.useTranslation)().translate,
                    u = (0, nc.useElements)(),
                    l = (0, w.useRef)(null),
                    d = (0, w.useRef)(null),
                    p = nb((0, w.useState)(""), 2),
                    f = p[0],
                    h = p[1],
                    m = nb((0, w.useState)(!1), 2),
                    b = m[0],
                    y = m[1],
                    v = nb((0, w.useState)(!1), 2),
                    P = v[0],
                    S = v[1],
                    x = {
                        __html: c("Message.StripeAddPaymentMethodDisclosure", {
                            stripeTermsOfUseLinkStart: '<a href="https://stripe.com/legal/end-users" class="text-link" target="_blank">',
                            stripeTermsOfUseLinkEnd: "</a>",
                            stripePrivacyPolicyLinkStart: '<a href=\'https://stripe.com/privacy\' class="text-link" target="_blank">',
                            stripePrivacyPolicyLinkEnd: "</a>"
                        })
                    },
                    E = (0, w.useCallback)(function(e) {
                        var t = e.target.value.trim().replace(/\s/g, ""),
                            r = new RegExp(/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/);
                        s("" !== t && null === r.exec(t)), h(t)
                    }, [h]);
                return (0, w.useEffect)(function() {
                    if (!l.current && (l.current = null == u ? void 0 : u.getElement("payment"), l.current)) {
                        var e;
                        l.current.on("ready", function() {
                            var e;
                            null == (e = l.current) || e.clear()
                        }), null == (e = l.current) || e.on("change", function(e) {
                            y(e.complete)
                        })
                    }!d.current && (d.current = null == u ? void 0 : u.getElement("address"), d.current && (d.current.on("ready", function() {
                        var e;
                        null == (e = d.current) || e.clear()
                    }), d.current.on("change", function(e) {
                        S(e.complete)
                    })))
                }, [u]), (0, w.useEffect)(function() {
                    t(b && P && !o && (!r || "" !== f))
                }, [b, P, f, o, t, r]), (0, g.jsxs)("div", {
                    children: [i && (0, g.jsx)("div", {
                        className: "font-header-2 text-emphasis stripe-header",
                        children: i
                    }), (0, g.jsx)(nc.PaymentElement, {
                        options: {
                            wallets: {
                                applePay: "never",
                                googlePay: "never"
                            }
                        }
                    }), r && (0, g.jsxs)(w.Fragment, {
                        children: [(0, g.jsx)("div", {
                            className: "font-header-2 text-emphasis stripe-header billing-email-header",
                            children: c("Heading.BillingEmail")
                        }), (0, g.jsx)("div", {
                            className: "form-group form-has-feedback ".concat(o ? "form-has-error" : ""),
                            children: (0, g.jsx)("input", {
                                className: "form-control input-field billing-email-input",
                                type: "email",
                                name: "email",
                                value: f,
                                onChange: function(e) {
                                    return E(e)
                                }
                            })
                        }), (0, g.jsx)("div", {
                            className: "form-group form-has-feedback",
                            children: (0, g.jsx)("div", {
                                className: "form-control-label small text email-label",
                                children: c("Message.StripeEmailInputSubText")
                            })
                        })]
                    }), (0, g.jsx)("div", {
                        className: "font-header-2 text-emphasis stripe-header",
                        children: c("Heading.BillingAddress")
                    }), (0, g.jsx)(nc.AddressElement, {
                        options: {
                            mode: "billing"
                        }
                    }), n && (0, g.jsx)("div", {
                        className: "form-control-label small text stripe-form-disclosure",
                        dangerouslySetInnerHTML: x
                    })]
                })
            };

            function nv(e) {
                return (nv = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                    return typeof e
                } : function(e) {
                    return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
                })(e)
            }

            function ng(e, t) {
                if (t.length < e) throw TypeError(e + " argument" + (e > 1 ? "s" : "") + " required, but only " + t.length + " present")
            }

            function nw(e) {
                ng(1, arguments);
                var t, r = Object.prototype.toString.call(e);
                return (null != (t = Date) && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t) || "object" === nv(e) && "[object Date]" === r ? new Date(e.getTime()) : "number" == typeof e || "[object Number]" === r ? new Date(e) : (("string" == typeof e || "[object String]" === r) && "undefined" != typeof console && (console.warn("Starting with v2.0.0-beta.1 date-fns doesn't accept strings as date arguments. Please use `parseISO` to parse strings. See: https://github.com/date-fns/date-fns/blob/master/docs/upgradeGuide.md#string-arguments"), console.warn(Error().stack)), new Date(NaN))
            }

            function nP(e) {
                if (null === e || !0 === e || !1 === e) return NaN;
                var t = Number(e);
                return isNaN(t) ? t : t < 0 ? Math.ceil(t) : Math.floor(t)
            }

            function nS(e, t) {
                return ng(2, arguments),
                    function(e, t) {
                        return ng(2, arguments), new Date(nw(e).getTime() + nP(t))
                    }(e, -nP(t))
            }

            function nx(e) {
                ng(1, arguments);
                var t = nw(e),
                    r = t.getUTCDay();
                return t.setUTCDate(t.getUTCDate() - (7 * (r < 1) + r - 1)), t.setUTCHours(0, 0, 0, 0), t
            }

            function nE(e) {
                ng(1, arguments);
                var t = nw(e),
                    r = t.getUTCFullYear(),
                    n = new Date(0);
                n.setUTCFullYear(r + 1, 0, 4), n.setUTCHours(0, 0, 0, 0);
                var i = nx(n),
                    a = new Date(0);
                a.setUTCFullYear(r, 0, 4), a.setUTCHours(0, 0, 0, 0);
                var o = nx(a);
                return t.getTime() >= i.getTime() ? r + 1 : t.getTime() >= o.getTime() ? r : r - 1
            }

            function nT(e) {
                ng(1, arguments);
                var t = nw(e);
                return Math.round((nx(t).getTime() - (function(e) {
                    ng(1, arguments);
                    var t = nE(e),
                        r = new Date(0);
                    return r.setUTCFullYear(t, 0, 4), r.setUTCHours(0, 0, 0, 0), nx(r)
                })(t).getTime()) / 6048e5) + 1
            }
            ny.defaultProps = {
                headerText: ""
            };
            var nC = {};

            function nk(e, t) {
                ng(1, arguments);
                var r, n, i, a, o, s, c, u, l = nP(null != (r = null != (n = null != (i = null != (a = null == t ? void 0 : t.weekStartsOn) ? a : null == t || null == (o = t.locale) || null == (s = o.options) ? void 0 : s.weekStartsOn) ? i : nC.weekStartsOn) ? n : null == (c = nC.locale) || null == (u = c.options) ? void 0 : u.weekStartsOn) ? r : 0);
                if (!(l >= 0 && l <= 6)) throw RangeError("weekStartsOn must be between 0 and 6 inclusively");
                var d = nw(e),
                    p = d.getUTCDay();
                return d.setUTCDate(d.getUTCDate() - (7 * (p < l) + p - l)), d.setUTCHours(0, 0, 0, 0), d
            }

            function nA(e, t) {
                ng(1, arguments);
                var r, n, i, a, o, s, c, u, l = nw(e),
                    d = l.getUTCFullYear(),
                    p = nP(null != (r = null != (n = null != (i = null != (a = null == t ? void 0 : t.firstWeekContainsDate) ? a : null == t || null == (o = t.locale) || null == (s = o.options) ? void 0 : s.firstWeekContainsDate) ? i : nC.firstWeekContainsDate) ? n : null == (c = nC.locale) || null == (u = c.options) ? void 0 : u.firstWeekContainsDate) ? r : 1);
                if (!(p >= 1 && p <= 7)) throw RangeError("firstWeekContainsDate must be between 1 and 7 inclusively");
                var f = new Date(0);
                f.setUTCFullYear(d + 1, 0, p), f.setUTCHours(0, 0, 0, 0);
                var h = nk(f, t),
                    m = new Date(0);
                m.setUTCFullYear(d, 0, p), m.setUTCHours(0, 0, 0, 0);
                var b = nk(m, t);
                return l.getTime() >= h.getTime() ? d + 1 : l.getTime() >= b.getTime() ? d : d - 1
            }

            function nI(e, t) {
                ng(1, arguments);
                var r = nw(e);
                return Math.round((nk(r, t).getTime() - (function(e, t) {
                    ng(1, arguments);
                    var r, n, i, a, o, s, c, u, l = nP(null != (r = null != (n = null != (i = null != (a = null == t ? void 0 : t.firstWeekContainsDate) ? a : null == t || null == (o = t.locale) || null == (s = o.options) ? void 0 : s.firstWeekContainsDate) ? i : nC.firstWeekContainsDate) ? n : null == (c = nC.locale) || null == (u = c.options) ? void 0 : u.firstWeekContainsDate) ? r : 1),
                        d = nA(e, t),
                        p = new Date(0);
                    return p.setUTCFullYear(d, 0, l), p.setUTCHours(0, 0, 0, 0), nk(p, t)
                })(r, t).getTime()) / 6048e5) + 1
            }

            function nD(e, t) {
                for (var r = Math.abs(e).toString(); r.length < t;) r = "0" + r;
                return (e < 0 ? "-" : "") + r
            }
            var nN = function(e, t) {
                    var r = e.getUTCFullYear(),
                        n = r > 0 ? r : 1 - r;
                    return nD("yy" === t ? n % 100 : n, t.length)
                },
                nj = function(e, t) {
                    var r = e.getUTCMonth();
                    return "M" === t ? String(r + 1) : nD(r + 1, 2)
                },
                nO = function(e, t) {
                    var r = t.length;
                    return nD(Math.floor(e.getUTCMilliseconds() * Math.pow(10, r - 3)), t.length)
                };

            function nM(e, t) {
                var r = e > 0 ? "-" : "+",
                    n = Math.abs(e),
                    i = Math.floor(n / 60),
                    a = n % 60;
                return 0 === a ? r + String(i) : r + String(i) + (t || "") + nD(a, 2)
            }

            function nR(e, t) {
                return e % 60 == 0 ? (e > 0 ? "-" : "+") + nD(Math.abs(e) / 60, 2) : nU(e, t)
            }

            function nU(e, t) {
                var r = Math.abs(e);
                return (e > 0 ? "-" : "+") + nD(Math.floor(r / 60), 2) + (t || "") + nD(r % 60, 2)
            }
            var nL = {
                    G: function(e, t, r) {
                        var n = +(e.getUTCFullYear() > 0);
                        switch (t) {
                            case "G":
                            case "GG":
                            case "GGG":
                                return r.era(n, {
                                    width: "abbreviated"
                                });
                            case "GGGGG":
                                return r.era(n, {
                                    width: "narrow"
                                });
                            default:
                                return r.era(n, {
                                    width: "wide"
                                })
                        }
                    },
                    y: function(e, t, r) {
                        if ("yo" === t) {
                            var n = e.getUTCFullYear();
                            return r.ordinalNumber(n > 0 ? n : 1 - n, {
                                unit: "year"
                            })
                        }
                        return nN(e, t)
                    },
                    Y: function(e, t, r, n) {
                        var i = nA(e, n),
                            a = i > 0 ? i : 1 - i;
                        return "YY" === t ? nD(a % 100, 2) : "Yo" === t ? r.ordinalNumber(a, {
                            unit: "year"
                        }) : nD(a, t.length)
                    },
                    R: function(e, t) {
                        return nD(nE(e), t.length)
                    },
                    u: function(e, t) {
                        return nD(e.getUTCFullYear(), t.length)
                    },
                    Q: function(e, t, r) {
                        var n = Math.ceil((e.getUTCMonth() + 1) / 3);
                        switch (t) {
                            case "Q":
                                return String(n);
                            case "QQ":
                                return nD(n, 2);
                            case "Qo":
                                return r.ordinalNumber(n, {
                                    unit: "quarter"
                                });
                            case "QQQ":
                                return r.quarter(n, {
                                    width: "abbreviated",
                                    context: "formatting"
                                });
                            case "QQQQQ":
                                return r.quarter(n, {
                                    width: "narrow",
                                    context: "formatting"
                                });
                            default:
                                return r.quarter(n, {
                                    width: "wide",
                                    context: "formatting"
                                })
                        }
                    },
                    q: function(e, t, r) {
                        var n = Math.ceil((e.getUTCMonth() + 1) / 3);
                        switch (t) {
                            case "q":
                                return String(n);
                            case "qq":
                                return nD(n, 2);
                            case "qo":
                                return r.ordinalNumber(n, {
                                    unit: "quarter"
                                });
                            case "qqq":
                                return r.quarter(n, {
                                    width: "abbreviated",
                                    context: "standalone"
                                });
                            case "qqqqq":
                                return r.quarter(n, {
                                    width: "narrow",
                                    context: "standalone"
                                });
                            default:
                                return r.quarter(n, {
                                    width: "wide",
                                    context: "standalone"
                                })
                        }
                    },
                    M: function(e, t, r) {
                        var n = e.getUTCMonth();
                        switch (t) {
                            case "M":
                            case "MM":
                                return nj(e, t);
                            case "Mo":
                                return r.ordinalNumber(n + 1, {
                                    unit: "month"
                                });
                            case "MMM":
                                return r.month(n, {
                                    width: "abbreviated",
                                    context: "formatting"
                                });
                            case "MMMMM":
                                return r.month(n, {
                                    width: "narrow",
                                    context: "formatting"
                                });
                            default:
                                return r.month(n, {
                                    width: "wide",
                                    context: "formatting"
                                })
                        }
                    },
                    L: function(e, t, r) {
                        var n = e.getUTCMonth();
                        switch (t) {
                            case "L":
                                return String(n + 1);
                            case "LL":
                                return nD(n + 1, 2);
                            case "Lo":
                                return r.ordinalNumber(n + 1, {
                                    unit: "month"
                                });
                            case "LLL":
                                return r.month(n, {
                                    width: "abbreviated",
                                    context: "standalone"
                                });
                            case "LLLLL":
                                return r.month(n, {
                                    width: "narrow",
                                    context: "standalone"
                                });
                            default:
                                return r.month(n, {
                                    width: "wide",
                                    context: "standalone"
                                })
                        }
                    },
                    w: function(e, t, r, n) {
                        var i = nI(e, n);
                        return "wo" === t ? r.ordinalNumber(i, {
                            unit: "week"
                        }) : nD(i, t.length)
                    },
                    I: function(e, t, r) {
                        var n = nT(e);
                        return "Io" === t ? r.ordinalNumber(n, {
                            unit: "week"
                        }) : nD(n, t.length)
                    },
                    d: function(e, t, r) {
                        var n, i;
                        return "do" === t ? r.ordinalNumber(e.getUTCDate(), {
                            unit: "date"
                        }) : (n = e, i = t, nD(n.getUTCDate(), i.length))
                    },
                    D: function(e, t, r) {
                        var n = function(e) {
                            ng(1, arguments);
                            var t = nw(e),
                                r = t.getTime();
                            return t.setUTCMonth(0, 1), t.setUTCHours(0, 0, 0, 0), Math.floor((r - t.getTime()) / 864e5) + 1
                        }(e);
                        return "Do" === t ? r.ordinalNumber(n, {
                            unit: "dayOfYear"
                        }) : nD(n, t.length)
                    },
                    E: function(e, t, r) {
                        var n = e.getUTCDay();
                        switch (t) {
                            case "E":
                            case "EE":
                            case "EEE":
                                return r.day(n, {
                                    width: "abbreviated",
                                    context: "formatting"
                                });
                            case "EEEEE":
                                return r.day(n, {
                                    width: "narrow",
                                    context: "formatting"
                                });
                            case "EEEEEE":
                                return r.day(n, {
                                    width: "short",
                                    context: "formatting"
                                });
                            default:
                                return r.day(n, {
                                    width: "wide",
                                    context: "formatting"
                                })
                        }
                    },
                    e: function(e, t, r, n) {
                        var i = e.getUTCDay(),
                            a = (i - n.weekStartsOn + 8) % 7 || 7;
                        switch (t) {
                            case "e":
                                return String(a);
                            case "ee":
                                return nD(a, 2);
                            case "eo":
                                return r.ordinalNumber(a, {
                                    unit: "day"
                                });
                            case "eee":
                                return r.day(i, {
                                    width: "abbreviated",
                                    context: "formatting"
                                });
                            case "eeeee":
                                return r.day(i, {
                                    width: "narrow",
                                    context: "formatting"
                                });
                            case "eeeeee":
                                return r.day(i, {
                                    width: "short",
                                    context: "formatting"
                                });
                            default:
                                return r.day(i, {
                                    width: "wide",
                                    context: "formatting"
                                })
                        }
                    },
                    c: function(e, t, r, n) {
                        var i = e.getUTCDay(),
                            a = (i - n.weekStartsOn + 8) % 7 || 7;
                        switch (t) {
                            case "c":
                                return String(a);
                            case "cc":
                                return nD(a, t.length);
                            case "co":
                                return r.ordinalNumber(a, {
                                    unit: "day"
                                });
                            case "ccc":
                                return r.day(i, {
                                    width: "abbreviated",
                                    context: "standalone"
                                });
                            case "ccccc":
                                return r.day(i, {
                                    width: "narrow",
                                    context: "standalone"
                                });
                            case "cccccc":
                                return r.day(i, {
                                    width: "short",
                                    context: "standalone"
                                });
                            default:
                                return r.day(i, {
                                    width: "wide",
                                    context: "standalone"
                                })
                        }
                    },
                    i: function(e, t, r) {
                        var n = e.getUTCDay(),
                            i = 0 === n ? 7 : n;
                        switch (t) {
                            case "i":
                                return String(i);
                            case "ii":
                                return nD(i, t.length);
                            case "io":
                                return r.ordinalNumber(i, {
                                    unit: "day"
                                });
                            case "iii":
                                return r.day(n, {
                                    width: "abbreviated",
                                    context: "formatting"
                                });
                            case "iiiii":
                                return r.day(n, {
                                    width: "narrow",
                                    context: "formatting"
                                });
                            case "iiiiii":
                                return r.day(n, {
                                    width: "short",
                                    context: "formatting"
                                });
                            default:
                                return r.day(n, {
                                    width: "wide",
                                    context: "formatting"
                                })
                        }
                    },
                    a: function(e, t, r) {
                        var n = e.getUTCHours() / 12 >= 1 ? "pm" : "am";
                        switch (t) {
                            case "a":
                            case "aa":
                                return r.dayPeriod(n, {
                                    width: "abbreviated",
                                    context: "formatting"
                                });
                            case "aaa":
                                return r.dayPeriod(n, {
                                    width: "abbreviated",
                                    context: "formatting"
                                }).toLowerCase();
                            case "aaaaa":
                                return r.dayPeriod(n, {
                                    width: "narrow",
                                    context: "formatting"
                                });
                            default:
                                return r.dayPeriod(n, {
                                    width: "wide",
                                    context: "formatting"
                                })
                        }
                    },
                    b: function(e, t, r) {
                        var n, i = e.getUTCHours();
                        switch (n = 12 === i ? "noon" : 0 === i ? "midnight" : i / 12 >= 1 ? "pm" : "am", t) {
                            case "b":
                            case "bb":
                                return r.dayPeriod(n, {
                                    width: "abbreviated",
                                    context: "formatting"
                                });
                            case "bbb":
                                return r.dayPeriod(n, {
                                    width: "abbreviated",
                                    context: "formatting"
                                }).toLowerCase();
                            case "bbbbb":
                                return r.dayPeriod(n, {
                                    width: "narrow",
                                    context: "formatting"
                                });
                            default:
                                return r.dayPeriod(n, {
                                    width: "wide",
                                    context: "formatting"
                                })
                        }
                    },
                    B: function(e, t, r) {
                        var n, i = e.getUTCHours();
                        switch (n = i >= 17 ? "evening" : i >= 12 ? "afternoon" : i >= 4 ? "morning" : "night", t) {
                            case "B":
                            case "BB":
                            case "BBB":
                                return r.dayPeriod(n, {
                                    width: "abbreviated",
                                    context: "formatting"
                                });
                            case "BBBBB":
                                return r.dayPeriod(n, {
                                    width: "narrow",
                                    context: "formatting"
                                });
                            default:
                                return r.dayPeriod(n, {
                                    width: "wide",
                                    context: "formatting"
                                })
                        }
                    },
                    h: function(e, t, r) {
                        if ("ho" === t) {
                            var n, i, a = e.getUTCHours() % 12;
                            return 0 === a && (a = 12), r.ordinalNumber(a, {
                                unit: "hour"
                            })
                        }
                        return n = e, i = t, nD(n.getUTCHours() % 12 || 12, i.length)
                    },
                    H: function(e, t, r) {
                        var n, i;
                        return "Ho" === t ? r.ordinalNumber(e.getUTCHours(), {
                            unit: "hour"
                        }) : (n = e, i = t, nD(n.getUTCHours(), i.length))
                    },
                    K: function(e, t, r) {
                        var n = e.getUTCHours() % 12;
                        return "Ko" === t ? r.ordinalNumber(n, {
                            unit: "hour"
                        }) : nD(n, t.length)
                    },
                    k: function(e, t, r) {
                        var n = e.getUTCHours();
                        return (0 === n && (n = 24), "ko" === t) ? r.ordinalNumber(n, {
                            unit: "hour"
                        }) : nD(n, t.length)
                    },
                    m: function(e, t, r) {
                        var n, i;
                        return "mo" === t ? r.ordinalNumber(e.getUTCMinutes(), {
                            unit: "minute"
                        }) : (n = e, i = t, nD(n.getUTCMinutes(), i.length))
                    },
                    s: function(e, t, r) {
                        var n, i;
                        return "so" === t ? r.ordinalNumber(e.getUTCSeconds(), {
                            unit: "second"
                        }) : (n = e, i = t, nD(n.getUTCSeconds(), i.length))
                    },
                    S: function(e, t) {
                        return nO(e, t)
                    },
                    X: function(e, t, r, n) {
                        var i = (n._originalDate || e).getTimezoneOffset();
                        if (0 === i) return "Z";
                        switch (t) {
                            case "X":
                                return nR(i);
                            case "XXXX":
                            case "XX":
                                return nU(i);
                            default:
                                return nU(i, ":")
                        }
                    },
                    x: function(e, t, r, n) {
                        var i = (n._originalDate || e).getTimezoneOffset();
                        switch (t) {
                            case "x":
                                return nR(i);
                            case "xxxx":
                            case "xx":
                                return nU(i);
                            default:
                                return nU(i, ":")
                        }
                    },
                    O: function(e, t, r, n) {
                        var i = (n._originalDate || e).getTimezoneOffset();
                        switch (t) {
                            case "O":
                            case "OO":
                            case "OOO":
                                return "GMT" + nM(i, ":");
                            default:
                                return "GMT" + nU(i, ":")
                        }
                    },
                    z: function(e, t, r, n) {
                        var i = (n._originalDate || e).getTimezoneOffset();
                        switch (t) {
                            case "z":
                            case "zz":
                            case "zzz":
                                return "GMT" + nM(i, ":");
                            default:
                                return "GMT" + nU(i, ":")
                        }
                    },
                    t: function(e, t, r, n) {
                        return nD(Math.floor((n._originalDate || e).getTime() / 1e3), t.length)
                    },
                    T: function(e, t, r, n) {
                        return nD((n._originalDate || e).getTime(), t.length)
                    }
                },
                n_ = function(e, t) {
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
                nB = function(e, t) {
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
                nY = {
                    p: nB,
                    P: function(e, t) {
                        var r, n = e.match(/(P+)(p+)?/) || [],
                            i = n[1],
                            a = n[2];
                        if (!a) return n_(e, t);
                        switch (i) {
                            case "P":
                                r = t.dateTime({
                                    width: "short"
                                });
                                break;
                            case "PP":
                                r = t.dateTime({
                                    width: "medium"
                                });
                                break;
                            case "PPP":
                                r = t.dateTime({
                                    width: "long"
                                });
                                break;
                            default:
                                r = t.dateTime({
                                    width: "full"
                                })
                        }
                        return r.replace("{{date}}", n_(i, t)).replace("{{time}}", nB(a, t))
                    }
                };

            function nF(e) {
                var t = new Date(Date.UTC(e.getFullYear(), e.getMonth(), e.getDate(), e.getHours(), e.getMinutes(), e.getSeconds(), e.getMilliseconds()));
                return t.setUTCFullYear(e.getFullYear()), e.getTime() - t.getTime()
            }
            var nH = ["D", "DD"],
                nq = ["YY", "YYYY"];

            function nW(e) {
                return -1 !== nH.indexOf(e)
            }

            function nG(e) {
                return -1 !== nq.indexOf(e)
            }

            function nV(e, t, r) {
                if ("YYYY" === e) throw RangeError("Use `yyyy` instead of `YYYY` (in `".concat(t, "`) for formatting years to the input `").concat(r, "`; see: https://github.com/date-fns/date-fns/blob/master/docs/unicodeTokens.md"));
                if ("YY" === e) throw RangeError("Use `yy` instead of `YY` (in `".concat(t, "`) for formatting years to the input `").concat(r, "`; see: https://github.com/date-fns/date-fns/blob/master/docs/unicodeTokens.md"));
                if ("D" === e) throw RangeError("Use `d` instead of `D` (in `".concat(t, "`) for formatting days of the month to the input `").concat(r, "`; see: https://github.com/date-fns/date-fns/blob/master/docs/unicodeTokens.md"));
                if ("DD" === e) throw RangeError("Use `dd` instead of `DD` (in `".concat(t, "`) for formatting days of the month to the input `").concat(r, "`; see: https://github.com/date-fns/date-fns/blob/master/docs/unicodeTokens.md"))
            }
            var nK = {
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

            function nz(e) {
                return function() {
                    var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        r = t.width ? String(t.width) : e.defaultWidth;
                    return e.formats[r] || e.formats[e.defaultWidth]
                }
            }
            var nX = {
                    date: nz({
                        formats: {
                            full: "EEEE, MMMM do, y",
                            long: "MMMM do, y",
                            medium: "MMM d, y",
                            short: "MM/dd/yyyy"
                        },
                        defaultWidth: "full"
                    }),
                    time: nz({
                        formats: {
                            full: "h:mm:ss a zzzz",
                            long: "h:mm:ss a z",
                            medium: "h:mm:ss a",
                            short: "h:mm a"
                        },
                        defaultWidth: "full"
                    }),
                    dateTime: nz({
                        formats: {
                            full: "{{date}} 'at' {{time}}",
                            long: "{{date}} 'at' {{time}}",
                            medium: "{{date}}, {{time}}",
                            short: "{{date}}, {{time}}"
                        },
                        defaultWidth: "full"
                    })
                },
                nQ = {
                    lastWeek: "'last' eeee 'at' p",
                    yesterday: "'yesterday at' p",
                    today: "'today at' p",
                    tomorrow: "'tomorrow at' p",
                    nextWeek: "eeee 'at' p",
                    other: "P"
                };

            function n$(e) {
                return function(t, r) {
                    var n;
                    if ("formatting" === (null != r && r.context ? String(r.context) : "standalone") && e.formattingValues) {
                        var i = e.defaultFormattingWidth || e.defaultWidth,
                            a = null != r && r.width ? String(r.width) : i;
                        n = e.formattingValues[a] || e.formattingValues[i]
                    } else {
                        var o = e.defaultWidth,
                            s = null != r && r.width ? String(r.width) : e.defaultWidth;
                        n = e.values[s] || e.values[o]
                    }
                    return n[e.argumentCallback ? e.argumentCallback(t) : t]
                }
            }

            function nJ(e) {
                return function(t) {
                    var r, n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        i = n.width,
                        a = i && e.matchPatterns[i] || e.matchPatterns[e.defaultMatchWidth],
                        o = t.match(a);
                    if (!o) return null;
                    var s = o[0],
                        c = i && e.parsePatterns[i] || e.parsePatterns[e.defaultParseWidth],
                        u = Array.isArray(c) ? function(e, t) {
                            for (var r = 0; r < e.length; r++)
                                if (t(e[r])) return r
                        }(c, function(e) {
                            return e.test(s)
                        }) : function(e, t) {
                            for (var r in e)
                                if (e.hasOwnProperty(r) && t(e[r])) return r
                        }(c, function(e) {
                            return e.test(s)
                        });
                    return r = e.valueCallback ? e.valueCallback(u) : u, {
                        value: r = n.valueCallback ? n.valueCallback(r) : r,
                        rest: t.slice(s.length)
                    }
                }
            }
            var nZ = {
                    code: "en-US",
                    formatDistance: function(e, t, r) {
                        var n, i = nK[e];
                        if (n = "string" == typeof i ? i : 1 === t ? i.one : i.other.replace("{{count}}", t.toString()), null != r && r.addSuffix)
                            if (r.comparison && r.comparison > 0) return "in " + n;
                            else return n + " ago";
                        return n
                    },
                    formatLong: nX,
                    formatRelative: function(e, t, r, n) {
                        return nQ[e]
                    },
                    localize: {
                        ordinalNumber: function(e, t) {
                            var r = Number(e),
                                n = r % 100;
                            if (n > 20 || n < 10) switch (n % 10) {
                                case 1:
                                    return r + "st";
                                case 2:
                                    return r + "nd";
                                case 3:
                                    return r + "rd"
                            }
                            return r + "th"
                        },
                        era: n$({
                            values: {
                                narrow: ["B", "A"],
                                abbreviated: ["BC", "AD"],
                                wide: ["Before Christ", "Anno Domini"]
                            },
                            defaultWidth: "wide"
                        }),
                        quarter: n$({
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
                        month: n$({
                            values: {
                                narrow: ["J", "F", "M", "A", "M", "J", "J", "A", "S", "O", "N", "D"],
                                abbreviated: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                                wide: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
                            },
                            defaultWidth: "wide"
                        }),
                        day: n$({
                            values: {
                                narrow: ["S", "M", "T", "W", "T", "F", "S"],
                                short: ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"],
                                abbreviated: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
                                wide: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
                            },
                            defaultWidth: "wide"
                        }),
                        dayPeriod: n$({
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
                        ordinalNumber: (b = {
                            matchPattern: /^(\d+)(th|st|nd|rd)?/i,
                            parsePattern: /\d+/i,
                            valueCallback: function(e) {
                                return parseInt(e, 10)
                            }
                        }, function(e) {
                            var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                                r = e.match(b.matchPattern);
                            if (!r) return null;
                            var n = r[0],
                                i = e.match(b.parsePattern);
                            if (!i) return null;
                            var a = b.valueCallback ? b.valueCallback(i[0]) : i[0];
                            return {
                                value: a = t.valueCallback ? t.valueCallback(a) : a,
                                rest: e.slice(n.length)
                            }
                        }),
                        era: nJ({
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
                        quarter: nJ({
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
                        month: nJ({
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
                        day: nJ({
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
                        dayPeriod: nJ({
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
                },
                n0 = /[yYQqMLwIdDecihHKkms]o|(\w)\1*|''|'(''|[^'])+('|$)|./g,
                n1 = /P+p+|P+|p+|''|'(''|[^'])+('|$)|./g,
                n2 = /^'([^]*?)'?$/,
                n3 = /''/g,
                n4 = /[a-zA-Z]/;

            function n6(e, t, r) {
                ng(2, arguments);
                var n, i, a, o, s, c, u, l, d, p, f, h, m, b, y, v, g, w, P = String(t),
                    S = null != (n = null != (i = null == r ? void 0 : r.locale) ? i : nC.locale) ? n : nZ,
                    x = nP(null != (a = null != (o = null != (s = null != (c = null == r ? void 0 : r.firstWeekContainsDate) ? c : null == r || null == (u = r.locale) || null == (l = u.options) ? void 0 : l.firstWeekContainsDate) ? s : nC.firstWeekContainsDate) ? o : null == (d = nC.locale) || null == (p = d.options) ? void 0 : p.firstWeekContainsDate) ? a : 1);
                if (!(x >= 1 && x <= 7)) throw RangeError("firstWeekContainsDate must be between 1 and 7 inclusively");
                var E = nP(null != (f = null != (h = null != (m = null != (b = null == r ? void 0 : r.weekStartsOn) ? b : null == r || null == (y = r.locale) || null == (v = y.options) ? void 0 : v.weekStartsOn) ? m : nC.weekStartsOn) ? h : null == (g = nC.locale) || null == (w = g.options) ? void 0 : w.weekStartsOn) ? f : 0);
                if (!(E >= 0 && E <= 6)) throw RangeError("weekStartsOn must be between 0 and 6 inclusively");
                if (!S.localize) throw RangeError("locale must contain localize property");
                if (!S.formatLong) throw RangeError("locale must contain formatLong property");
                var T = nw(e);
                if (! function(e) {
                        return ng(1, arguments), (!! function(e) {
                            var t;
                            return ng(1, arguments), (null != (t = Date) && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t) || "object" === nv(e) && "[object Date]" === Object.prototype.toString.call(e)
                        }(e) || "number" == typeof e) && !isNaN(Number(nw(e)))
                    }(T)) throw RangeError("Invalid time value");
                var C = nF(T),
                    k = nS(T, C),
                    A = {
                        firstWeekContainsDate: x,
                        weekStartsOn: E,
                        locale: S,
                        _originalDate: T
                    };
                return P.match(n1).map(function(e) {
                    var t = e[0];
                    return "p" === t || "P" === t ? (0, nY[t])(e, S.formatLong) : e
                }).join("").match(n0).map(function(n) {
                    if ("''" === n) return "'";
                    var i, a, o = n[0];
                    if ("'" === o) {
                        return (a = (i = n).match(n2)) ? a[1].replace(n3, "'") : i
                    }
                    var s = nL[o];
                    if (s) return !(null != r && r.useAdditionalWeekYearTokens) && nG(n) && nV(n, t, String(e)), !(null != r && r.useAdditionalDayOfYearTokens) && nW(n) && nV(n, t, String(e)), s(k, n, S.localize, A);
                    if (o.match(n4)) throw RangeError("Format string contains an unescaped latin alphabet character `" + o + "`");
                    return n
                }).join("")
            }

            function n5(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function n8(e, t) {
                var r = "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                if (!r) {
                    if (Array.isArray(e) || (r = function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return n5(e, void 0);
                                var r = ({}).toString.call(e).slice(8, -1);
                                return "Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r ? Array.from(e) : "Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r) ? n5(e, void 0) : void 0
                            }
                        }(e)) || t && e && "number" == typeof e.length) {
                        r && (e = r);
                        var n = 0,
                            i = function() {};
                        return {
                            s: i,
                            n: function() {
                                return n >= e.length ? {
                                    done: !0
                                } : {
                                    done: !1,
                                    value: e[n++]
                                }
                            },
                            e: function(e) {
                                throw e
                            },
                            f: i
                        }
                    }
                    throw TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }
                var a, o = !0,
                    s = !1;
                return {
                    s: function() {
                        r = r.call(e)
                    },
                    n: function() {
                        var e = r.next();
                        return o = e.done, e
                    },
                    e: function(e) {
                        s = !0, a = e
                    },
                    f: function() {
                        try {
                            o || null == r.return || r.return()
                        } finally {
                            if (s) throw a
                        }
                    }
                }
            }

            function n7(e) {
                if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                return e
            }

            function n9(e, t) {
                return (n9 = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function ie(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        writable: !0,
                        configurable: !0
                    }
                }), Object.defineProperty(e, "prototype", {
                    writable: !1
                }), t && n9(e, t)
            }

            function it(e) {
                return (it = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function ir() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (ir = function() {
                    return !!e
                })()
            }

            function ii(e) {
                var t = ir();
                return function() {
                    var r, n = it(e);
                    r = t ? Reflect.construct(n, arguments, it(this).constructor) : n.apply(this, arguments);
                    if (r && ("object" == nv(r) || "function" == typeof r)) return r;
                    if (void 0 !== r) throw TypeError("Derived constructors may only return object or undefined");
                    return n7(this)
                }
            }

            function ia(e, t) {
                if (null != t && "undefined" != typeof Symbol && t[Symbol.hasInstance] ? !t[Symbol.hasInstance](e) : !(e instanceof t)) throw TypeError("Cannot call a class as a function")
            }

            function io(e) {
                var t = function(e, t) {
                    if ("object" != nv(e) || !e) return e;
                    var r = e[Symbol.toPrimitive];
                    if (void 0 !== r) {
                        var n = r.call(e, t || "default");
                        if ("object" != nv(n)) return n;
                        throw TypeError("@@toPrimitive must return a primitive value.")
                    }
                    return ("string" === t ? String : Number)(e)
                }(e, "string");
                return "symbol" == nv(t) ? t : t + ""
            }

            function is(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var n = t[r];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, io(n.key), n)
                }
            }

            function ic(e, t, r) {
                return t && is(e.prototype, t), r && is(e, r), Object.defineProperty(e, "prototype", {
                    writable: !1
                }), e
            }

            function iu(e, t, r) {
                return (t = io(t)) in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var il = function() {
                    function e() {
                        ia(this, e), iu(this, "priority", void 0), iu(this, "subPriority", 0)
                    }
                    return ic(e, [{
                        key: "validate",
                        value: function(e, t) {
                            return !0
                        }
                    }]), e
                }(),
                id = function(e) {
                    ie(r, e);
                    var t = ii(r);

                    function r(e, n, i, a, o) {
                        var s;
                        return ia(this, r), (s = t.call(this)).value = e, s.validateValue = n, s.setValue = i, s.priority = a, o && (s.subPriority = o), s
                    }
                    return ic(r, [{
                        key: "validate",
                        value: function(e, t) {
                            return this.validateValue(e, this.value, t)
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return this.setValue(e, t, this.value, r)
                        }
                    }]), r
                }(il),
                ip = function(e) {
                    ie(r, e);
                    var t = ii(r);

                    function r() {
                        var e;
                        ia(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return iu(n7(e = t.call.apply(t, [this].concat(i))), "priority", 10), iu(n7(e), "subPriority", -1), e
                    }
                    return ic(r, [{
                        key: "set",
                        value: function(e, t) {
                            if (t.timestampIsSet) return e;
                            var r = new Date(0);
                            return r.setFullYear(e.getUTCFullYear(), e.getUTCMonth(), e.getUTCDate()), r.setHours(e.getUTCHours(), e.getUTCMinutes(), e.getUTCSeconds(), e.getUTCMilliseconds()), r
                        }
                    }]), r
                }(il),
                ih = function() {
                    function e() {
                        ia(this, e), iu(this, "incompatibleTokens", void 0), iu(this, "priority", void 0), iu(this, "subPriority", void 0)
                    }
                    return ic(e, [{
                        key: "run",
                        value: function(e, t, r, n) {
                            var i = this.parse(e, t, r, n);
                            return i ? {
                                setter: new id(i.value, this.validate, this.set, this.priority, this.subPriority),
                                rest: i.rest
                            } : null
                        }
                    }, {
                        key: "validate",
                        value: function(e, t, r) {
                            return !0
                        }
                    }]), e
                }(),
                im = function(e) {
                    ie(r, e);
                    var t = ii(r);

                    function r() {
                        var e;
                        ia(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return iu(n7(e = t.call.apply(t, [this].concat(i))), "priority", 140), iu(n7(e), "incompatibleTokens", ["R", "u", "t", "T"]), e
                    }
                    return ic(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "G":
                                case "GG":
                                case "GGG":
                                    return r.era(e, {
                                        width: "abbreviated"
                                    }) || r.era(e, {
                                        width: "narrow"
                                    });
                                case "GGGGG":
                                    return r.era(e, {
                                        width: "narrow"
                                    });
                                default:
                                    return r.era(e, {
                                        width: "wide"
                                    }) || r.era(e, {
                                        width: "abbreviated"
                                    }) || r.era(e, {
                                        width: "narrow"
                                    })
                            }
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return t.era = r, e.setUTCFullYear(r, 0, 1), e.setUTCHours(0, 0, 0, 0), e
                        }
                    }]), r
                }(ih),
                ib = /^(1[0-2]|0?\d)/,
                iy = /^(3[0-1]|[0-2]?\d)/,
                iv = /^(36[0-6]|3[0-5]\d|[0-2]?\d?\d)/,
                ig = /^(5[0-3]|[0-4]?\d)/,
                iw = /^(2[0-3]|[0-1]?\d)/,
                iP = /^(2[0-4]|[0-1]?\d)/,
                iS = /^(1[0-1]|0?\d)/,
                ix = /^(1[0-2]|0?\d)/,
                iE = /^[0-5]?\d/,
                iT = /^[0-5]?\d/,
                iC = /^\d/,
                ik = /^\d{1,2}/,
                iA = /^\d{1,3}/,
                iI = /^\d{1,4}/,
                iD = /^-?\d+/,
                iN = /^-?\d/,
                ij = /^-?\d{1,2}/,
                iO = /^-?\d{1,3}/,
                iM = /^-?\d{1,4}/,
                iR = /^([+-])(\d{2})(\d{2})?|Z/,
                iU = /^([+-])(\d{2})(\d{2})|Z/,
                iL = /^([+-])(\d{2})(\d{2})((\d{2}))?|Z/,
                i_ = /^([+-])(\d{2}):(\d{2})|Z/,
                iB = /^([+-])(\d{2}):(\d{2})(:(\d{2}))?|Z/;

            function iY(e, t) {
                return e ? {
                    value: t(e.value),
                    rest: e.rest
                } : e
            }

            function iF(e, t) {
                var r = t.match(e);
                return r ? {
                    value: parseInt(r[0], 10),
                    rest: t.slice(r[0].length)
                } : null
            }

            function iH(e, t) {
                var r = t.match(e);
                return r ? "Z" === r[0] ? {
                    value: 0,
                    rest: t.slice(1)
                } : {
                    value: ("+" === r[1] ? 1 : -1) * ((r[2] ? parseInt(r[2], 10) : 0) * 36e5 + (r[3] ? parseInt(r[3], 10) : 0) * 6e4 + (r[5] ? parseInt(r[5], 10) : 0) * 1e3),
                    rest: t.slice(r[0].length)
                } : null
            }

            function iq(e, t) {
                switch (e) {
                    case 1:
                        return iF(iC, t);
                    case 2:
                        return iF(ik, t);
                    case 3:
                        return iF(iA, t);
                    case 4:
                        return iF(iI, t);
                    default:
                        return iF(RegExp("^\\d{1," + e + "}"), t)
                }
            }

            function iW(e, t) {
                switch (e) {
                    case 1:
                        return iF(iN, t);
                    case 2:
                        return iF(ij, t);
                    case 3:
                        return iF(iO, t);
                    case 4:
                        return iF(iM, t);
                    default:
                        return iF(RegExp("^-?\\d{1," + e + "}"), t)
                }
            }

            function iG(e) {
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

            function iV(e, t) {
                var r, n = t > 0,
                    i = n ? t : 1 - t;
                if (i <= 50) r = e || 100;
                else {
                    var a = i + 50;
                    r = e + 100 * Math.floor(a / 100) - 100 * (e >= a % 100)
                }
                return n ? r : 1 - r
            }

            function iK(e) {
                return e % 400 == 0 || e % 4 == 0 && e % 100 != 0
            }
            var iz = function(e) {
                    ie(r, e);
                    var t = ii(r);

                    function r() {
                        var e;
                        ia(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return iu(n7(e = t.call.apply(t, [this].concat(i))), "priority", 130), iu(n7(e), "incompatibleTokens", ["Y", "R", "u", "w", "I", "i", "e", "c", "t", "T"]), e
                    }
                    return ic(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            var n = function(e) {
                                return {
                                    year: e,
                                    isTwoDigitYear: "yy" === t
                                }
                            };
                            switch (t) {
                                case "y":
                                    return iY(iq(4, e), n);
                                case "yo":
                                    return iY(r.ordinalNumber(e, {
                                        unit: "year"
                                    }), n);
                                default:
                                    return iY(iq(t.length, e), n)
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            return t.isTwoDigitYear || t.year > 0
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            var n = e.getUTCFullYear();
                            if (r.isTwoDigitYear) {
                                var i = iV(r.year, n);
                                return e.setUTCFullYear(i, 0, 1), e.setUTCHours(0, 0, 0, 0), e
                            }
                            var a = "era" in t && 1 !== t.era ? 1 - r.year : r.year;
                            return e.setUTCFullYear(a, 0, 1), e.setUTCHours(0, 0, 0, 0), e
                        }
                    }]), r
                }(ih),
                iX = function(e) {
                    ie(r, e);
                    var t = ii(r);

                    function r() {
                        var e;
                        ia(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return iu(n7(e = t.call.apply(t, [this].concat(i))), "priority", 130), iu(n7(e), "incompatibleTokens", ["y", "R", "u", "Q", "q", "M", "L", "I", "d", "D", "i", "t", "T"]), e
                    }
                    return ic(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            var n = function(e) {
                                return {
                                    year: e,
                                    isTwoDigitYear: "YY" === t
                                }
                            };
                            switch (t) {
                                case "Y":
                                    return iY(iq(4, e), n);
                                case "Yo":
                                    return iY(r.ordinalNumber(e, {
                                        unit: "year"
                                    }), n);
                                default:
                                    return iY(iq(t.length, e), n)
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            return t.isTwoDigitYear || t.year > 0
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r, n) {
                            var i = nA(e, n);
                            if (r.isTwoDigitYear) {
                                var a = iV(r.year, i);
                                return e.setUTCFullYear(a, 0, n.firstWeekContainsDate), e.setUTCHours(0, 0, 0, 0), nk(e, n)
                            }
                            var o = "era" in t && 1 !== t.era ? 1 - r.year : r.year;
                            return e.setUTCFullYear(o, 0, n.firstWeekContainsDate), e.setUTCHours(0, 0, 0, 0), nk(e, n)
                        }
                    }]), r
                }(ih),
                iQ = function(e) {
                    ie(r, e);
                    var t = ii(r);

                    function r() {
                        var e;
                        ia(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return iu(n7(e = t.call.apply(t, [this].concat(i))), "priority", 130), iu(n7(e), "incompatibleTokens", ["G", "y", "Y", "u", "Q", "q", "M", "L", "w", "d", "D", "e", "c", "t", "T"]), e
                    }
                    return ic(r, [{
                        key: "parse",
                        value: function(e, t) {
                            return "R" === t ? iW(4, e) : iW(t.length, e)
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            var n = new Date(0);
                            return n.setUTCFullYear(r, 0, 4), n.setUTCHours(0, 0, 0, 0), nx(n)
                        }
                    }]), r
                }(ih),
                i$ = function(e) {
                    ie(r, e);
                    var t = ii(r);

                    function r() {
                        var e;
                        ia(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return iu(n7(e = t.call.apply(t, [this].concat(i))), "priority", 130), iu(n7(e), "incompatibleTokens", ["G", "y", "Y", "R", "w", "I", "i", "e", "c", "t", "T"]), e
                    }
                    return ic(r, [{
                        key: "parse",
                        value: function(e, t) {
                            return "u" === t ? iW(4, e) : iW(t.length, e)
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return e.setUTCFullYear(r, 0, 1), e.setUTCHours(0, 0, 0, 0), e
                        }
                    }]), r
                }(ih),
                iJ = function(e) {
                    ie(r, e);
                    var t = ii(r);

                    function r() {
                        var e;
                        ia(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return iu(n7(e = t.call.apply(t, [this].concat(i))), "priority", 120), iu(n7(e), "incompatibleTokens", ["Y", "R", "q", "M", "L", "w", "I", "d", "D", "i", "e", "c", "t", "T"]), e
                    }
                    return ic(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "Q":
                                case "QQ":
                                    return iq(t.length, e);
                                case "Qo":
                                    return r.ordinalNumber(e, {
                                        unit: "quarter"
                                    });
                                case "QQQ":
                                    return r.quarter(e, {
                                        width: "abbreviated",
                                        context: "formatting"
                                    }) || r.quarter(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    });
                                case "QQQQQ":
                                    return r.quarter(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    });
                                default:
                                    return r.quarter(e, {
                                        width: "wide",
                                        context: "formatting"
                                    }) || r.quarter(e, {
                                        width: "abbreviated",
                                        context: "formatting"
                                    }) || r.quarter(e, {
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
                        value: function(e, t, r) {
                            return e.setUTCMonth((r - 1) * 3, 1), e.setUTCHours(0, 0, 0, 0), e
                        }
                    }]), r
                }(ih),
                iZ = function(e) {
                    ie(r, e);
                    var t = ii(r);

                    function r() {
                        var e;
                        ia(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return iu(n7(e = t.call.apply(t, [this].concat(i))), "priority", 120), iu(n7(e), "incompatibleTokens", ["Y", "R", "Q", "M", "L", "w", "I", "d", "D", "i", "e", "c", "t", "T"]), e
                    }
                    return ic(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "q":
                                case "qq":
                                    return iq(t.length, e);
                                case "qo":
                                    return r.ordinalNumber(e, {
                                        unit: "quarter"
                                    });
                                case "qqq":
                                    return r.quarter(e, {
                                        width: "abbreviated",
                                        context: "standalone"
                                    }) || r.quarter(e, {
                                        width: "narrow",
                                        context: "standalone"
                                    });
                                case "qqqqq":
                                    return r.quarter(e, {
                                        width: "narrow",
                                        context: "standalone"
                                    });
                                default:
                                    return r.quarter(e, {
                                        width: "wide",
                                        context: "standalone"
                                    }) || r.quarter(e, {
                                        width: "abbreviated",
                                        context: "standalone"
                                    }) || r.quarter(e, {
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
                        value: function(e, t, r) {
                            return e.setUTCMonth((r - 1) * 3, 1), e.setUTCHours(0, 0, 0, 0), e
                        }
                    }]), r
                }(ih),
                i0 = function(e) {
                    ie(r, e);
                    var t = ii(r);

                    function r() {
                        var e;
                        ia(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return iu(n7(e = t.call.apply(t, [this].concat(i))), "incompatibleTokens", ["Y", "R", "q", "Q", "L", "w", "I", "D", "i", "e", "c", "t", "T"]), iu(n7(e), "priority", 110), e
                    }
                    return ic(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            var n = function(e) {
                                return e - 1
                            };
                            switch (t) {
                                case "M":
                                    return iY(iF(ib, e), n);
                                case "MM":
                                    return iY(iq(2, e), n);
                                case "Mo":
                                    return iY(r.ordinalNumber(e, {
                                        unit: "month"
                                    }), n);
                                case "MMM":
                                    return r.month(e, {
                                        width: "abbreviated",
                                        context: "formatting"
                                    }) || r.month(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    });
                                case "MMMMM":
                                    return r.month(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    });
                                default:
                                    return r.month(e, {
                                        width: "wide",
                                        context: "formatting"
                                    }) || r.month(e, {
                                        width: "abbreviated",
                                        context: "formatting"
                                    }) || r.month(e, {
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
                        value: function(e, t, r) {
                            return e.setUTCMonth(r, 1), e.setUTCHours(0, 0, 0, 0), e
                        }
                    }]), r
                }(ih),
                i1 = function(e) {
                    ie(r, e);
                    var t = ii(r);

                    function r() {
                        var e;
                        ia(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return iu(n7(e = t.call.apply(t, [this].concat(i))), "priority", 110), iu(n7(e), "incompatibleTokens", ["Y", "R", "q", "Q", "M", "w", "I", "D", "i", "e", "c", "t", "T"]), e
                    }
                    return ic(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            var n = function(e) {
                                return e - 1
                            };
                            switch (t) {
                                case "L":
                                    return iY(iF(ib, e), n);
                                case "LL":
                                    return iY(iq(2, e), n);
                                case "Lo":
                                    return iY(r.ordinalNumber(e, {
                                        unit: "month"
                                    }), n);
                                case "LLL":
                                    return r.month(e, {
                                        width: "abbreviated",
                                        context: "standalone"
                                    }) || r.month(e, {
                                        width: "narrow",
                                        context: "standalone"
                                    });
                                case "LLLLL":
                                    return r.month(e, {
                                        width: "narrow",
                                        context: "standalone"
                                    });
                                default:
                                    return r.month(e, {
                                        width: "wide",
                                        context: "standalone"
                                    }) || r.month(e, {
                                        width: "abbreviated",
                                        context: "standalone"
                                    }) || r.month(e, {
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
                        value: function(e, t, r) {
                            return e.setUTCMonth(r, 1), e.setUTCHours(0, 0, 0, 0), e
                        }
                    }]), r
                }(ih),
                i2 = function(e) {
                    ie(r, e);
                    var t = ii(r);

                    function r() {
                        var e;
                        ia(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return iu(n7(e = t.call.apply(t, [this].concat(i))), "priority", 100), iu(n7(e), "incompatibleTokens", ["y", "R", "u", "q", "Q", "M", "L", "I", "d", "D", "i", "t", "T"]), e
                    }
                    return ic(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "w":
                                    return iF(ig, e);
                                case "wo":
                                    return r.ordinalNumber(e, {
                                        unit: "week"
                                    });
                                default:
                                    return iq(t.length, e)
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            return t >= 1 && t <= 53
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r, n) {
                            return nk(function(e, t, r) {
                                ng(2, arguments);
                                var n = nw(e),
                                    i = nP(t),
                                    a = nI(n, r) - i;
                                return n.setUTCDate(n.getUTCDate() - 7 * a), n
                            }(e, r, n), n)
                        }
                    }]), r
                }(ih),
                i3 = function(e) {
                    ie(r, e);
                    var t = ii(r);

                    function r() {
                        var e;
                        ia(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return iu(n7(e = t.call.apply(t, [this].concat(i))), "priority", 100), iu(n7(e), "incompatibleTokens", ["y", "Y", "u", "q", "Q", "M", "L", "w", "d", "D", "e", "c", "t", "T"]), e
                    }
                    return ic(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "I":
                                    return iF(ig, e);
                                case "Io":
                                    return r.ordinalNumber(e, {
                                        unit: "week"
                                    });
                                default:
                                    return iq(t.length, e)
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            return t >= 1 && t <= 53
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return nx(function(e, t) {
                                ng(2, arguments);
                                var r = nw(e),
                                    n = nP(t),
                                    i = nT(r) - n;
                                return r.setUTCDate(r.getUTCDate() - 7 * i), r
                            }(e, r))
                        }
                    }]), r
                }(ih),
                i4 = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],
                i6 = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],
                i5 = function(e) {
                    ie(r, e);
                    var t = ii(r);

                    function r() {
                        var e;
                        ia(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return iu(n7(e = t.call.apply(t, [this].concat(i))), "priority", 90), iu(n7(e), "subPriority", 1), iu(n7(e), "incompatibleTokens", ["Y", "R", "q", "Q", "w", "I", "D", "i", "e", "c", "t", "T"]), e
                    }
                    return ic(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "d":
                                    return iF(iy, e);
                                case "do":
                                    return r.ordinalNumber(e, {
                                        unit: "date"
                                    });
                                default:
                                    return iq(t.length, e)
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            var r = iK(e.getUTCFullYear()),
                                n = e.getUTCMonth();
                            return r ? t >= 1 && t <= i6[n] : t >= 1 && t <= i4[n]
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return e.setUTCDate(r), e.setUTCHours(0, 0, 0, 0), e
                        }
                    }]), r
                }(ih),
                i8 = function(e) {
                    ie(r, e);
                    var t = ii(r);

                    function r() {
                        var e;
                        ia(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return iu(n7(e = t.call.apply(t, [this].concat(i))), "priority", 90), iu(n7(e), "subpriority", 1), iu(n7(e), "incompatibleTokens", ["Y", "R", "q", "Q", "M", "L", "w", "I", "d", "E", "i", "e", "c", "t", "T"]), e
                    }
                    return ic(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "D":
                                case "DD":
                                    return iF(iv, e);
                                case "Do":
                                    return r.ordinalNumber(e, {
                                        unit: "date"
                                    });
                                default:
                                    return iq(t.length, e)
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            return iK(e.getUTCFullYear()) ? t >= 1 && t <= 366 : t >= 1 && t <= 365
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return e.setUTCMonth(0, r), e.setUTCHours(0, 0, 0, 0), e
                        }
                    }]), r
                }(ih);

            function i7(e, t, r) {
                ng(2, arguments);
                var n, i, a, o, s, c, u, l, d = nP(null != (n = null != (i = null != (a = null != (o = null == r ? void 0 : r.weekStartsOn) ? o : null == r || null == (s = r.locale) || null == (c = s.options) ? void 0 : c.weekStartsOn) ? a : nC.weekStartsOn) ? i : null == (u = nC.locale) || null == (l = u.options) ? void 0 : l.weekStartsOn) ? n : 0);
                if (!(d >= 0 && d <= 6)) throw RangeError("weekStartsOn must be between 0 and 6 inclusively");
                var p = nw(e),
                    f = nP(t),
                    h = 7 * ((f % 7 + 7) % 7 < d) + f - p.getUTCDay();
                return p.setUTCDate(p.getUTCDate() + h), p
            }
            var i9 = function(e) {
                    ie(r, e);
                    var t = ii(r);

                    function r() {
                        var e;
                        ia(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return iu(n7(e = t.call.apply(t, [this].concat(i))), "priority", 90), iu(n7(e), "incompatibleTokens", ["D", "i", "e", "c", "t", "T"]), e
                    }
                    return ic(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "E":
                                case "EE":
                                case "EEE":
                                    return r.day(e, {
                                        width: "abbreviated",
                                        context: "formatting"
                                    }) || r.day(e, {
                                        width: "short",
                                        context: "formatting"
                                    }) || r.day(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    });
                                case "EEEEE":
                                    return r.day(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    });
                                case "EEEEEE":
                                    return r.day(e, {
                                        width: "short",
                                        context: "formatting"
                                    }) || r.day(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    });
                                default:
                                    return r.day(e, {
                                        width: "wide",
                                        context: "formatting"
                                    }) || r.day(e, {
                                        width: "abbreviated",
                                        context: "formatting"
                                    }) || r.day(e, {
                                        width: "short",
                                        context: "formatting"
                                    }) || r.day(e, {
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
                        value: function(e, t, r, n) {
                            return (e = i7(e, r, n)).setUTCHours(0, 0, 0, 0), e
                        }
                    }]), r
                }(ih),
                ae = function(e) {
                    ie(r, e);
                    var t = ii(r);

                    function r() {
                        var e;
                        ia(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return iu(n7(e = t.call.apply(t, [this].concat(i))), "priority", 90), iu(n7(e), "incompatibleTokens", ["y", "R", "u", "q", "Q", "M", "L", "I", "d", "D", "E", "i", "c", "t", "T"]), e
                    }
                    return ic(r, [{
                        key: "parse",
                        value: function(e, t, r, n) {
                            var i = function(e) {
                                var t = 7 * Math.floor((e - 1) / 7);
                                return (e + n.weekStartsOn + 6) % 7 + t
                            };
                            switch (t) {
                                case "e":
                                case "ee":
                                    return iY(iq(t.length, e), i);
                                case "eo":
                                    return iY(r.ordinalNumber(e, {
                                        unit: "day"
                                    }), i);
                                case "eee":
                                    return r.day(e, {
                                        width: "abbreviated",
                                        context: "formatting"
                                    }) || r.day(e, {
                                        width: "short",
                                        context: "formatting"
                                    }) || r.day(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    });
                                case "eeeee":
                                    return r.day(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    });
                                case "eeeeee":
                                    return r.day(e, {
                                        width: "short",
                                        context: "formatting"
                                    }) || r.day(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    });
                                default:
                                    return r.day(e, {
                                        width: "wide",
                                        context: "formatting"
                                    }) || r.day(e, {
                                        width: "abbreviated",
                                        context: "formatting"
                                    }) || r.day(e, {
                                        width: "short",
                                        context: "formatting"
                                    }) || r.day(e, {
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
                        value: function(e, t, r, n) {
                            return (e = i7(e, r, n)).setUTCHours(0, 0, 0, 0), e
                        }
                    }]), r
                }(ih),
                at = function(e) {
                    ie(r, e);
                    var t = ii(r);

                    function r() {
                        var e;
                        ia(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return iu(n7(e = t.call.apply(t, [this].concat(i))), "priority", 90), iu(n7(e), "incompatibleTokens", ["y", "R", "u", "q", "Q", "M", "L", "I", "d", "D", "E", "i", "e", "t", "T"]), e
                    }
                    return ic(r, [{
                        key: "parse",
                        value: function(e, t, r, n) {
                            var i = function(e) {
                                var t = 7 * Math.floor((e - 1) / 7);
                                return (e + n.weekStartsOn + 6) % 7 + t
                            };
                            switch (t) {
                                case "c":
                                case "cc":
                                    return iY(iq(t.length, e), i);
                                case "co":
                                    return iY(r.ordinalNumber(e, {
                                        unit: "day"
                                    }), i);
                                case "ccc":
                                    return r.day(e, {
                                        width: "abbreviated",
                                        context: "standalone"
                                    }) || r.day(e, {
                                        width: "short",
                                        context: "standalone"
                                    }) || r.day(e, {
                                        width: "narrow",
                                        context: "standalone"
                                    });
                                case "ccccc":
                                    return r.day(e, {
                                        width: "narrow",
                                        context: "standalone"
                                    });
                                case "cccccc":
                                    return r.day(e, {
                                        width: "short",
                                        context: "standalone"
                                    }) || r.day(e, {
                                        width: "narrow",
                                        context: "standalone"
                                    });
                                default:
                                    return r.day(e, {
                                        width: "wide",
                                        context: "standalone"
                                    }) || r.day(e, {
                                        width: "abbreviated",
                                        context: "standalone"
                                    }) || r.day(e, {
                                        width: "short",
                                        context: "standalone"
                                    }) || r.day(e, {
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
                        value: function(e, t, r, n) {
                            return (e = i7(e, r, n)).setUTCHours(0, 0, 0, 0), e
                        }
                    }]), r
                }(ih),
                ar = function(e) {
                    ie(r, e);
                    var t = ii(r);

                    function r() {
                        var e;
                        ia(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return iu(n7(e = t.call.apply(t, [this].concat(i))), "priority", 90), iu(n7(e), "incompatibleTokens", ["y", "Y", "u", "q", "Q", "M", "L", "w", "d", "D", "E", "e", "c", "t", "T"]), e
                    }
                    return ic(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            var n = function(e) {
                                return 0 === e ? 7 : e
                            };
                            switch (t) {
                                case "i":
                                case "ii":
                                    return iq(t.length, e);
                                case "io":
                                    return r.ordinalNumber(e, {
                                        unit: "day"
                                    });
                                case "iii":
                                    return iY(r.day(e, {
                                        width: "abbreviated",
                                        context: "formatting"
                                    }) || r.day(e, {
                                        width: "short",
                                        context: "formatting"
                                    }) || r.day(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    }), n);
                                case "iiiii":
                                    return iY(r.day(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    }), n);
                                case "iiiiii":
                                    return iY(r.day(e, {
                                        width: "short",
                                        context: "formatting"
                                    }) || r.day(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    }), n);
                                default:
                                    return iY(r.day(e, {
                                        width: "wide",
                                        context: "formatting"
                                    }) || r.day(e, {
                                        width: "abbreviated",
                                        context: "formatting"
                                    }) || r.day(e, {
                                        width: "short",
                                        context: "formatting"
                                    }) || r.day(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    }), n)
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            return t >= 1 && t <= 7
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return (e = function(e, t) {
                                ng(2, arguments);
                                var r = nP(t);
                                r % 7 == 0 && (r -= 7);
                                var n = nw(e),
                                    i = 7 * ((r % 7 + 7) % 7 < 1) + r - n.getUTCDay();
                                return n.setUTCDate(n.getUTCDate() + i), n
                            }(e, r)).setUTCHours(0, 0, 0, 0), e
                        }
                    }]), r
                }(ih),
                an = function(e) {
                    ie(r, e);
                    var t = ii(r);

                    function r() {
                        var e;
                        ia(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return iu(n7(e = t.call.apply(t, [this].concat(i))), "priority", 80), iu(n7(e), "incompatibleTokens", ["b", "B", "H", "k", "t", "T"]), e
                    }
                    return ic(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "a":
                                case "aa":
                                case "aaa":
                                    return r.dayPeriod(e, {
                                        width: "abbreviated",
                                        context: "formatting"
                                    }) || r.dayPeriod(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    });
                                case "aaaaa":
                                    return r.dayPeriod(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    });
                                default:
                                    return r.dayPeriod(e, {
                                        width: "wide",
                                        context: "formatting"
                                    }) || r.dayPeriod(e, {
                                        width: "abbreviated",
                                        context: "formatting"
                                    }) || r.dayPeriod(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    })
                            }
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return e.setUTCHours(iG(r), 0, 0, 0), e
                        }
                    }]), r
                }(ih),
                ai = function(e) {
                    ie(r, e);
                    var t = ii(r);

                    function r() {
                        var e;
                        ia(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return iu(n7(e = t.call.apply(t, [this].concat(i))), "priority", 80), iu(n7(e), "incompatibleTokens", ["a", "B", "H", "k", "t", "T"]), e
                    }
                    return ic(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "b":
                                case "bb":
                                case "bbb":
                                    return r.dayPeriod(e, {
                                        width: "abbreviated",
                                        context: "formatting"
                                    }) || r.dayPeriod(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    });
                                case "bbbbb":
                                    return r.dayPeriod(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    });
                                default:
                                    return r.dayPeriod(e, {
                                        width: "wide",
                                        context: "formatting"
                                    }) || r.dayPeriod(e, {
                                        width: "abbreviated",
                                        context: "formatting"
                                    }) || r.dayPeriod(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    })
                            }
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return e.setUTCHours(iG(r), 0, 0, 0), e
                        }
                    }]), r
                }(ih),
                aa = function(e) {
                    ie(r, e);
                    var t = ii(r);

                    function r() {
                        var e;
                        ia(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return iu(n7(e = t.call.apply(t, [this].concat(i))), "priority", 80), iu(n7(e), "incompatibleTokens", ["a", "b", "t", "T"]), e
                    }
                    return ic(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "B":
                                case "BB":
                                case "BBB":
                                    return r.dayPeriod(e, {
                                        width: "abbreviated",
                                        context: "formatting"
                                    }) || r.dayPeriod(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    });
                                case "BBBBB":
                                    return r.dayPeriod(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    });
                                default:
                                    return r.dayPeriod(e, {
                                        width: "wide",
                                        context: "formatting"
                                    }) || r.dayPeriod(e, {
                                        width: "abbreviated",
                                        context: "formatting"
                                    }) || r.dayPeriod(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    })
                            }
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return e.setUTCHours(iG(r), 0, 0, 0), e
                        }
                    }]), r
                }(ih),
                ao = function(e) {
                    ie(r, e);
                    var t = ii(r);

                    function r() {
                        var e;
                        ia(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return iu(n7(e = t.call.apply(t, [this].concat(i))), "priority", 70), iu(n7(e), "incompatibleTokens", ["H", "K", "k", "t", "T"]), e
                    }
                    return ic(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "h":
                                    return iF(ix, e);
                                case "ho":
                                    return r.ordinalNumber(e, {
                                        unit: "hour"
                                    });
                                default:
                                    return iq(t.length, e)
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            return t >= 1 && t <= 12
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            var n = e.getUTCHours() >= 12;
                            return n && r < 12 ? e.setUTCHours(r + 12, 0, 0, 0) : n || 12 !== r ? e.setUTCHours(r, 0, 0, 0) : e.setUTCHours(0, 0, 0, 0), e
                        }
                    }]), r
                }(ih),
                as = function(e) {
                    ie(r, e);
                    var t = ii(r);

                    function r() {
                        var e;
                        ia(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return iu(n7(e = t.call.apply(t, [this].concat(i))), "priority", 70), iu(n7(e), "incompatibleTokens", ["a", "b", "h", "K", "k", "t", "T"]), e
                    }
                    return ic(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "H":
                                    return iF(iw, e);
                                case "Ho":
                                    return r.ordinalNumber(e, {
                                        unit: "hour"
                                    });
                                default:
                                    return iq(t.length, e)
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            return t >= 0 && t <= 23
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return e.setUTCHours(r, 0, 0, 0), e
                        }
                    }]), r
                }(ih),
                ac = function(e) {
                    ie(r, e);
                    var t = ii(r);

                    function r() {
                        var e;
                        ia(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return iu(n7(e = t.call.apply(t, [this].concat(i))), "priority", 70), iu(n7(e), "incompatibleTokens", ["h", "H", "k", "t", "T"]), e
                    }
                    return ic(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "K":
                                    return iF(iS, e);
                                case "Ko":
                                    return r.ordinalNumber(e, {
                                        unit: "hour"
                                    });
                                default:
                                    return iq(t.length, e)
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            return t >= 0 && t <= 11
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return e.getUTCHours() >= 12 && r < 12 ? e.setUTCHours(r + 12, 0, 0, 0) : e.setUTCHours(r, 0, 0, 0), e
                        }
                    }]), r
                }(ih),
                au = function(e) {
                    ie(r, e);
                    var t = ii(r);

                    function r() {
                        var e;
                        ia(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return iu(n7(e = t.call.apply(t, [this].concat(i))), "priority", 70), iu(n7(e), "incompatibleTokens", ["a", "b", "h", "H", "K", "t", "T"]), e
                    }
                    return ic(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "k":
                                    return iF(iP, e);
                                case "ko":
                                    return r.ordinalNumber(e, {
                                        unit: "hour"
                                    });
                                default:
                                    return iq(t.length, e)
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            return t >= 1 && t <= 24
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return e.setUTCHours(r <= 24 ? r % 24 : r, 0, 0, 0), e
                        }
                    }]), r
                }(ih),
                al = function(e) {
                    ie(r, e);
                    var t = ii(r);

                    function r() {
                        var e;
                        ia(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return iu(n7(e = t.call.apply(t, [this].concat(i))), "priority", 60), iu(n7(e), "incompatibleTokens", ["t", "T"]), e
                    }
                    return ic(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "m":
                                    return iF(iE, e);
                                case "mo":
                                    return r.ordinalNumber(e, {
                                        unit: "minute"
                                    });
                                default:
                                    return iq(t.length, e)
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            return t >= 0 && t <= 59
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return e.setUTCMinutes(r, 0, 0), e
                        }
                    }]), r
                }(ih),
                ad = function(e) {
                    ie(r, e);
                    var t = ii(r);

                    function r() {
                        var e;
                        ia(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return iu(n7(e = t.call.apply(t, [this].concat(i))), "priority", 50), iu(n7(e), "incompatibleTokens", ["t", "T"]), e
                    }
                    return ic(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "s":
                                    return iF(iT, e);
                                case "so":
                                    return r.ordinalNumber(e, {
                                        unit: "second"
                                    });
                                default:
                                    return iq(t.length, e)
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            return t >= 0 && t <= 59
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return e.setUTCSeconds(r, 0), e
                        }
                    }]), r
                }(ih),
                ap = function(e) {
                    ie(r, e);
                    var t = ii(r);

                    function r() {
                        var e;
                        ia(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return iu(n7(e = t.call.apply(t, [this].concat(i))), "priority", 30), iu(n7(e), "incompatibleTokens", ["t", "T"]), e
                    }
                    return ic(r, [{
                        key: "parse",
                        value: function(e, t) {
                            return iY(iq(t.length, e), function(e) {
                                return Math.floor(e * Math.pow(10, -t.length + 3))
                            })
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return e.setUTCMilliseconds(r), e
                        }
                    }]), r
                }(ih),
                af = function(e) {
                    ie(r, e);
                    var t = ii(r);

                    function r() {
                        var e;
                        ia(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return iu(n7(e = t.call.apply(t, [this].concat(i))), "priority", 10), iu(n7(e), "incompatibleTokens", ["t", "T", "x"]), e
                    }
                    return ic(r, [{
                        key: "parse",
                        value: function(e, t) {
                            switch (t) {
                                case "X":
                                    return iH(iR, e);
                                case "XX":
                                    return iH(iU, e);
                                case "XXXX":
                                    return iH(iL, e);
                                case "XXXXX":
                                    return iH(iB, e);
                                default:
                                    return iH(i_, e)
                            }
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return t.timestampIsSet ? e : new Date(e.getTime() - r)
                        }
                    }]), r
                }(ih),
                ah = function(e) {
                    ie(r, e);
                    var t = ii(r);

                    function r() {
                        var e;
                        ia(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return iu(n7(e = t.call.apply(t, [this].concat(i))), "priority", 10), iu(n7(e), "incompatibleTokens", ["t", "T", "X"]), e
                    }
                    return ic(r, [{
                        key: "parse",
                        value: function(e, t) {
                            switch (t) {
                                case "x":
                                    return iH(iR, e);
                                case "xx":
                                    return iH(iU, e);
                                case "xxxx":
                                    return iH(iL, e);
                                case "xxxxx":
                                    return iH(iB, e);
                                default:
                                    return iH(i_, e)
                            }
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return t.timestampIsSet ? e : new Date(e.getTime() - r)
                        }
                    }]), r
                }(ih),
                am = function(e) {
                    ie(r, e);
                    var t = ii(r);

                    function r() {
                        var e;
                        ia(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return iu(n7(e = t.call.apply(t, [this].concat(i))), "priority", 40), iu(n7(e), "incompatibleTokens", "*"), e
                    }
                    return ic(r, [{
                        key: "parse",
                        value: function(e) {
                            return iF(iD, e)
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return [new Date(1e3 * r), {
                                timestampIsSet: !0
                            }]
                        }
                    }]), r
                }(ih),
                ab = function(e) {
                    ie(r, e);
                    var t = ii(r);

                    function r() {
                        var e;
                        ia(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return iu(n7(e = t.call.apply(t, [this].concat(i))), "priority", 20), iu(n7(e), "incompatibleTokens", "*"), e
                    }
                    return ic(r, [{
                        key: "parse",
                        value: function(e) {
                            return iF(iD, e)
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return [new Date(r), {
                                timestampIsSet: !0
                            }]
                        }
                    }]), r
                }(ih),
                ay = {
                    G: new im,
                    y: new iz,
                    Y: new iX,
                    R: new iQ,
                    u: new i$,
                    Q: new iJ,
                    q: new iZ,
                    M: new i0,
                    L: new i1,
                    w: new i2,
                    I: new i3,
                    d: new i5,
                    D: new i8,
                    E: new i9,
                    e: new ae,
                    c: new at,
                    i: new ar,
                    a: new an,
                    b: new ai,
                    B: new aa,
                    h: new ao,
                    H: new as,
                    K: new ac,
                    k: new au,
                    m: new al,
                    s: new ad,
                    S: new ap,
                    X: new af,
                    x: new ah,
                    t: new am,
                    T: new ab
                },
                av = /[yYQqMLwIdDecihHKkms]o|(\w)\1*|''|'(''|[^'])+('|$)|./g,
                ag = /P+p+|P+|p+|''|'(''|[^'])+('|$)|./g,
                aw = /^'([^]*?)'?$/,
                aP = /''/g,
                aS = /\S/,
                ax = /[a-zA-Z]/;

            function aE(e, t, r, n) {
                ng(3, arguments);
                var i = String(e),
                    a = String(t),
                    o = null != (u = null != (l = null == n ? void 0 : n.locale) ? l : nC.locale) ? u : nZ;
                if (!o.match) throw RangeError("locale must contain match property");
                var s = nP(null != (d = null != (p = null != (f = null != (h = null == n ? void 0 : n.firstWeekContainsDate) ? h : null == n || null == (m = n.locale) || null == (b = m.options) ? void 0 : b.firstWeekContainsDate) ? f : nC.firstWeekContainsDate) ? p : null == (y = nC.locale) || null == (v = y.options) ? void 0 : v.firstWeekContainsDate) ? d : 1);
                if (!(s >= 1 && s <= 7)) throw RangeError("firstWeekContainsDate must be between 1 and 7 inclusively");
                var c = nP(null != (g = null != (w = null != (P = null != (S = null == n ? void 0 : n.weekStartsOn) ? S : null == n || null == (x = n.locale) || null == (E = x.options) ? void 0 : E.weekStartsOn) ? P : nC.weekStartsOn) ? w : null == (T = nC.locale) || null == (C = T.options) ? void 0 : C.weekStartsOn) ? g : 0);
                if (!(c >= 0 && c <= 6)) throw RangeError("weekStartsOn must be between 0 and 6 inclusively");
                if ("" === a)
                    if ("" === i) return nw(r);
                    else return new Date(NaN);
                var u, l, d, p, f, h, m, b, y, v, g, w, P, S, x, E, T, C, k, A = {
                        firstWeekContainsDate: s,
                        weekStartsOn: c,
                        locale: o
                    },
                    I = [new ip],
                    D = a.match(ag).map(function(e) {
                        var t = e[0];
                        return t in nY ? (0, nY[t])(e, o.formatLong) : e
                    }).join("").match(av),
                    N = [],
                    j = n8(D);
                try {
                    for (j.s(); !(k = j.n()).done;) {
                        var O = function() {
                            var t = k.value;
                            !(null != n && n.useAdditionalWeekYearTokens) && nG(t) && nV(t, a, e), !(null != n && n.useAdditionalDayOfYearTokens) && nW(t) && nV(t, a, e);
                            var r = t[0],
                                s = ay[r];
                            if (s) {
                                var c = s.incompatibleTokens;
                                if (Array.isArray(c)) {
                                    var u = N.find(function(e) {
                                        return c.includes(e.token) || e.token === r
                                    });
                                    if (u) throw RangeError("The format string mustn't contain `".concat(u.fullToken, "` and `").concat(t, "` at the same time"))
                                } else if ("*" === s.incompatibleTokens && N.length > 0) throw RangeError("The format string mustn't contain `".concat(t, "` and any other token at the same time"));
                                N.push({
                                    token: r,
                                    fullToken: t
                                });
                                var l = s.run(i, t, o.match, A);
                                if (!l) return {
                                    v: new Date(NaN)
                                };
                                I.push(l.setter), i = l.rest
                            } else {
                                if (r.match(ax)) throw RangeError("Format string contains an unescaped latin alphabet character `" + r + "`");
                                if ("''" === t ? t = "'" : "'" === r && (t = t.match(aw)[1].replace(aP, "'")), 0 !== i.indexOf(t)) return {
                                    v: new Date(NaN)
                                };
                                i = i.slice(t.length)
                            }
                        }();
                        if ("object" === nv(O)) return O.v
                    }
                } catch (e) {
                    j.e(e)
                } finally {
                    j.f()
                }
                if (i.length > 0 && aS.test(i)) return new Date(NaN);
                var M = I.map(function(e) {
                        return e.priority
                    }).sort(function(e, t) {
                        return t - e
                    }).filter(function(e, t, r) {
                        return r.indexOf(e) === t
                    }).map(function(e) {
                        return I.filter(function(t) {
                            return t.priority === e
                        }).sort(function(e, t) {
                            return t.subPriority - e.subPriority
                        })
                    }).map(function(e) {
                        return e[0]
                    }),
                    R = nw(r);
                if (isNaN(R.getTime())) return new Date(NaN);
                var U, L = nS(R, nF(R)),
                    _ = {},
                    B = n8(M);
                try {
                    for (B.s(); !(U = B.n()).done;) {
                        var Y = U.value;
                        if (!Y.validate(L, A)) return new Date(NaN);
                        var F = Y.set(L, _, A);
                        Array.isArray(F) ? (L = F[0], function(e, t) {
                            if (null == e) throw TypeError("assign requires that input parameter not be null or undefined");
                            for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
                        }(_, F[1])) : L = F
                    }
                } catch (e) {
                    B.e(e)
                } finally {
                    B.f()
                }
                return L
            }

            function aT(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aC(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var a = [],
                            o = !0,
                            s = !1;
                        try {
                            for (i = i.call(e); !(o = (r = i.next()).done) && (a.push(r.value), !t || a.length !== t); o = !0);
                        } catch (e) {
                            s = !0, n = e
                        } finally {
                            try {
                                o || null == i.return || i.return()
                            } finally {
                                if (s) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return aT(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aT(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var ak = function(e, t) {
                    return "".concat(e.toString().padStart(2, "0"), "/").concat(n6(aE(t.toString(), "yyyy", new Date), "yy"))
                },
                aA = function(e) {
                    if (!e.includes("/")) return [0, 0];
                    var t = aC(e.split("/"), 2),
                        r = t[0],
                        n = t[1];
                    return !r || !n || 1 > Number.parseInt(r, 10) || Number.parseInt(r, 10) > 12 || 2 !== n.length ? [0, 0] : [Number.parseInt(r, 10), Number.parseInt(n6(aE(Number.parseInt(n, 10).toString(), "yy", new Date), "yyyy"), 10)]
                },
                aI = function(e) {
                    var t = aC(aA(e), 2),
                        r = t[0],
                        n = t[1];
                    return 0 === r || 0 === n ? new Date : new Date(n, r - 1)
                };

            function aD(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aN(e, t, r, n, i, a, o) {
                try {
                    var s = e[a](o),
                        c = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(c) : Promise.resolve(c).then(n, i)
            }

            function aj(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, i) {
                        var a = e.apply(t, r);

                        function o(e) {
                            aN(a, n, i, o, s, "next", e)
                        }

                        function s(e) {
                            aN(a, n, i, o, s, "throw", e)
                        }
                        o(void 0)
                    })
                }
            }

            function aO(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var a = [],
                            o = !0,
                            s = !1;
                        try {
                            for (i = i.call(e); !(o = (r = i.next()).done) && (a.push(r.value), !t || a.length !== t); o = !0);
                        } catch (e) {
                            s = !0, n = e
                        } finally {
                            try {
                                o || null == i.return || i.return()
                            } finally {
                                if (s) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return aD(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aD(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function aM(e, t) {
                var r, n, i, a = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return o.next = s(0), o.throw = s(1), o.return = s(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
                    return this
                }), o;

                function s(s) {
                    return function(c) {
                        var u = [s, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; o && (o = 0, u[0] && (a = 0)), a;) try {
                            if (r = 1, n && (i = 2 & u[0] ? n.return : u[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, u[1])).done) return i;
                            switch (n = 0, i && (u = [2 & u[0], i.value]), u[0]) {
                                case 0:
                                case 1:
                                    i = u;
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
                                    if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!i || u[1] > i[0] && u[1] < i[3])) {
                                        a.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && a.label < i[1]) {
                                        a.label = i[1], i = u;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(u);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            u = t.call(e, a)
                        } catch (e) {
                            u = [6, e], n = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var aR = function(e) {
                var t = e.subscriptionId,
                    r = e.paymentProfiles,
                    n = e.defaultPaymentProfile,
                    i = e.isOpen,
                    a = e.isUserUnder18,
                    o = e.subscription,
                    s = e.onClose,
                    c = e.onSave,
                    u = e.onPaymentProfileExpirationUpdate,
                    l = e.fetchSavedPaymentProfiles,
                    d = (0, T.useTranslation)().translate,
                    p = aO((0, w.useState)(!1), 2),
                    f = p[0],
                    h = p[1],
                    m = aO((0, w.useState)(!1), 2),
                    b = m[0],
                    y = m[1],
                    v = aO((0, w.useState)(null), 2),
                    S = (v[0], v[1]),
                    x = aO((0, w.useState)(n), 2),
                    E = x[0],
                    C = x[1],
                    k = aO((0, w.useState)(!1), 2),
                    A = k[0],
                    D = k[1],
                    j = aO((0, w.useState)(ak(n.providerPayload.ExpMonth, n.providerPayload.ExpYear)), 2),
                    O = j[0],
                    M = j[1],
                    R = t2().systemFeedbackService,
                    U = aO((0, w.useState)(!1), 2),
                    L = U[0],
                    _ = U[1],
                    B = aO(P().useState(!1), 2),
                    Y = B[0],
                    F = B[1],
                    H = (0, w.useRef)(null),
                    q = (0, nc.useStripe)(),
                    W = (0, nc.useElements)(),
                    G = (0, w.useRef)("");
                (0, w.useEffect)(function() {
                    if (!L) {
                        var e = new Date(E.providerPayload.ExpYear, E.providerPayload.ExpMonth - 1),
                            t = aI(O),
                            r = new Date(new Date().getFullYear(), new Date().getMonth());
                        y(t !== e && t >= r || E.id !== n.id), F(t < r || t < e)
                    }
                }, [n.id, O, E, L]);
                var V = (0, w.useCallback)(function() {
                        var e;
                        (null == (e = H.current) ? void 0 : e.scrollTop) && (H.current.scrollTop = 0), D(!1)
                    }, []),
                    K = (0, w.useCallback)(function() {
                        _(!1), V(), y(!1), h(!1), s()
                    }, [V, s]),
                    z = (0, w.useCallback)(function(e, i) {
                        return aj(function() {
                            var s, p, f, m, b, v;
                            return aM(this, function(g) {
                                var w, P, S;
                                switch (g.label) {
                                    case 0:
                                        if (rr(re.CLICK_UPDATE_PAYMENT_METHOD, o), h(!0), y(!1), !i || !(aI(i) > new Date(E.providerPayload.ExpYear, E.providerPayload.ExpMonth - 1))) return [3, 4];
                                        f = (p = aO(aA(i), 2))[0], m = p[1], g.label = 1;
                                    case 1:
                                        return g.trys.push([1, 3, , 4]), (0, I.fireEvent)(rE), [4, (w = f, P = m, na(function() {
                                            return no(this, function(t) {
                                                switch (t.label) {
                                                    case 0:
                                                        return [4, N.httpService.post(eJ.url.updatePaymentProfile(e), {
                                                            expirationMonth: w,
                                                            expirationYear: P
                                                        })];
                                                    case 1:
                                                        return [2, 200 === t.sent().status]
                                                }
                                            })
                                        })())];
                                    case 2:
                                        return g.sent(), s = "Description.PaymentExpirationUpdateSuccess", rr(re.UPDATE_PAYMENT_METHOD_EXPIRATION_SUCCESS, o), (0, I.fireEvent)(rT), u(E, f, m), [3, 4];
                                    case 3:
                                        return g.sent(), (0, I.fireEvent)(rC), rr(re.UPDATE_PAYMENT_METHOD_EXPIRATION_FAILURE, o), R.warning(d("Error.PaymentMethodUpdateFailed")), s = "", [3, 4];
                                    case 4:
                                        if ("" === s || e === n.id) return [3, 12];
                                        g.label = 5;
                                    case 5:
                                        return g.trys.push([5, 11, , 12]), (0, I.fireEvent)(rE), [4, e3(function() {
                                            var r;
                                            return e6(this, function(n) {
                                                switch (n.label) {
                                                    case 0:
                                                        return r = eJ.url.updateSubscriptionPaymentProfile(t), [4, N.httpService.post(r, {
                                                            paymentProfileId: e
                                                        })];
                                                    case 1:
                                                        return n.sent(), [2]
                                                }
                                            })
                                        })()];
                                    case 6:
                                        if (g.sent(), (0, I.fireEvent)(rT), rr(re.UPDATE_PAYMENT_METHOD_SUCCESS, o), s = "Message.PaymentUpdateSuccess", !a) return [3, 10];
                                        g.label = 7;
                                    case 7:
                                        return g.trys.push([7, 9, , 10]), (0, I.fireEvent)(rP), [4, (S = n.id, na(function() {
                                            return no(this, function(e) {
                                                switch (e.label) {
                                                    case 0:
                                                        return [4, N.httpService.delete(eJ.url.updatePaymentProfile(S))];
                                                    case 1:
                                                        return [2, 200 === e.sent().status]
                                                }
                                            })
                                        })())];
                                    case 8:
                                        return g.sent(), (0, I.fireEvent)(rS), [3, 10];
                                    case 9:
                                        throw b = g.sent(), (0, I.fireEvent)(rx), b;
                                    case 10:
                                        return [3, 12];
                                    case 11:
                                        return g.sent(), (0, I.fireEvent)(rC), rr(re.UPDATE_PAYMENT_METHOD_FAILURE, o), R.warning(d("Error.PaymentMethodUpdateFailed")), V(), h(!1), K(), [3, 12];
                                    case 12:
                                        if (V(), h(!1), void 0 === s || "" === s || (R.success(d(s)), "Message.PaymentUpdateSuccess" !== s)) return [3, 15];
                                        if (void 0 !== (v = r.find(function(t) {
                                                return t.id === e
                                            }))) return [3, 14];
                                        return [4, l()];
                                    case 13:
                                        v = g.sent().find(function(t) {
                                            return t.id === e
                                        }), g.label = 14;
                                    case 14:
                                        c(v), g.label = 15;
                                    case 15:
                                        return K(), [2]
                                }
                            })
                        })()
                    }, [V, K, n.id, l, a, u, c, r, E, o, t, R, d]),
                    X = (0, w.useCallback)(function() {
                        return aj(function() {
                            var e;
                            return aM(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        var r;
                                        return t.trys.push([0, 2, , 3]), [4, (r = G.current, na(function() {
                                            var e, t;
                                            return no(this, function(n) {
                                                switch (n.label) {
                                                    case 0:
                                                        return [4, N.httpService.get(eJ.url.verifyPaymentProfileCreation(r))];
                                                    case 1:
                                                        return [2, null == (t = n.sent()) || null == (e = t.data) ? void 0 : e.id]
                                                }
                                            })
                                        })())];
                                    case 1:
                                        if (e = t.sent()) return [2, e];
                                        return [3, 3];
                                    case 2:
                                        return t.sent(), [3, 3];
                                    case 3:
                                        return [2, ""]
                                }
                            })
                        })()
                    }, []),
                    Q = (0, w.useCallback)(function(e, t, r) {
                        return aj(function() {
                            var n;
                            return aM(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        return i.trys.push([0, 4, , 5]), [4, e()];
                                    case 1:
                                        if (void 0 === (n = i.sent()) || "" === n) return [3, 3];
                                        return [4, z(n, "")];
                                    case 2:
                                        return i.sent(), rr(re.UPDATE_PAYMENT_METHOD_ADD_CARD_SUCCESS, o), h(!1), [2];
                                    case 3:
                                        if (0 === r) return h(!1), [2];
                                        return setTimeout(function() {
                                            return aj(function() {
                                                return aM(this, function(n) {
                                                    switch (n.label) {
                                                        case 0:
                                                            return [4, Q(e, t, r - 1)];
                                                        case 1:
                                                            return n.sent(), [2]
                                                    }
                                                })
                                            })()
                                        }, t), [3, 5];
                                    case 4:
                                        return i.sent(), R.warning(d("Description.SavedCreditCard.SavePaymentMethodSomethingWentWrong")), [3, 5];
                                    case 5:
                                        return [2]
                                }
                            })
                        })()
                    }, [o, R, d, z]),
                    $ = (0, w.useCallback)(function() {
                        return aj(function() {
                            var e, t, r, n, i, s, c, u, l;
                            return aM(this, function(p) {
                                switch (p.label) {
                                    case 0:
                                        if (!q || !W) return [2];
                                        h(!0), t = {
                                            payment_method_data: {
                                                billing_details: {},
                                                allow_redisplay: e = a ? "limited" : "always"
                                            }
                                        }, p.label = 1;
                                    case 1:
                                        return p.trys.push([1, 7, , 8]), [4, q.confirmSetup({
                                            elements: W,
                                            confirmParams: t,
                                            redirect: "if_required"
                                        })];
                                    case 2:
                                        if ((null == (i = p.sent()) || null == (r = i.setupIntent) ? void 0 : r.status) !== "succeeded") return [3, 5];
                                        if (G.current = null != (u = null == i || null == (c = i.setupIntent) || null == (s = c.payment_method) ? void 0 : s.toString()) ? u : "", !G.current) return [3, 4];
                                        return [4, Q(X, 3e3, 3)];
                                    case 3:
                                        p.sent(), p.label = 4;
                                    case 4:
                                        return "limited" === e && (0, I.fireEvent)(rp), [3, 6];
                                    case 5:
                                        if (null == i || null == (n = i.error) ? void 0 : n.code) {
                                            switch (rr(re.UPDATE_PAYMENT_METHOD_ADD_CARD_FAILURE, o), i.error.code) {
                                                case "incorrect_cvc":
                                                case "expired_card":
                                                    S(null == i || null == (l = i.error) ? void 0 : l.code);
                                                    break;
                                                case "card_declined":
                                                    R.warning(d("Description.SavedCreditCard.CardDeclinedErrorMessage")), K();
                                                    break;
                                                default:
                                                    R.warning(d("MessageUnknownError"))
                                            }
                                            h(!1)
                                        }
                                        p.label = 6;
                                    case 6:
                                        return [3, 8];
                                    case 7:
                                        return p.sent(), h(!1), [3, 8];
                                    case 8:
                                        return [2]
                                }
                            })
                        })()
                    }, [q, W, a, Q, X, o, R, d, K]),
                    J = (0, w.useCallback)(function(e) {
                        return (0, g.jsxs)("div", {
                            className: "payment-method-container",
                            children: [(0, g.jsx)("span", {
                                className: ta()("card-icon", tO(e.providerPayload.CardNetwork))
                            }), (0, g.jsxs)("span", {
                                className: "card-four-digits text-emphasis",
                                children: ["****", e.providerPayload.Last4Digits]
                            })]
                        })
                    }, []),
                    Z = {
                        __html: d("Description.SavedCreditCard.StripeUpdatePaymentMethodDisclosure", {
                            RobloxTermsLinkStart: '<a href="https://help.roblox.com/hc/articles/115004647846-Roblox-Terms-of-Use" class="text-link" target="_blank">',
                            RobloxTermsLinkEnd: "</a>",
                            RobloxPrivacyPolicyLinkStart: '<a href=\'https://help.roblox.com/hc/articles/115004630823-Roblox-Privacy-and-Cookie-Policy\' class="text-link" target="_blank">',
                            RobloxPrivacyPolicyLinkEnd: "</a>",
                            StripeTermsOfUseLinkStart: '<a href="https://stripe.com/legal/end-users" class="text-link" target="_blank">',
                            StripeTermsOfUseLinkEnd: "</a>",
                            StripePrivacyPolicyLinkStart: '<a href=\'https://stripe.com/privacy\' class="text-link" target="_blank">',
                            StripePrivacyPolicyLinkEnd: "</a>"
                        })
                    },
                    ee = (0, w.useCallback)(function(e) {
                        return (0, g.jsx)("button", {
                            type: "button",
                            className: "dropdown-selection-button",
                            onClick: function() {
                                C(e), h(e.id === n.id), M(ak(e.providerPayload.ExpMonth, e.providerPayload.ExpYear)), V(), _(!1), y(!0)
                            },
                            children: J(e)
                        }, e.id)
                    }, [V, n.id, J]);
                return void 0 === n ? (0, g.jsx)(w.Fragment, {}) : (0, g.jsxs)(to.Modal, {
                    show: i,
                    onHide: K,
                    size: "md",
                    className: "subscription-update-payment-method",
                    children: [(0, g.jsx)(to.Modal.Header, {
                        title: d("Heading.SavedCreditCard.UpdatePaymentMethod"),
                        onClose: K
                    }), (0, g.jsxs)(to.Modal.Body, {
                        children: [(0, g.jsx)("div", {
                            className: "modal-description font-header-2 text-emphasis",
                            children: d("Heading.SavedCreditCard.CreditOrDebitCard")
                        }), (0, g.jsxs)("div", {
                            className: "custom-select",
                            children: [(0, g.jsxs)("button", {
                                id: "select-payment-profile-button",
                                type: "button",
                                role: "combobox",
                                className: ta()("select-button", {
                                    active: A
                                }),
                                "aria-labelledby": "select-payment-profile-button",
                                "aria-haspopup": "listbox",
                                "aria-expanded": "false",
                                "aria-controls": "select-payment-profile-dropdown",
                                onClick: function() {
                                    A ? V() : D(!0)
                                },
                                children: [!L && J(E), L && (0, g.jsx)("span", {
                                    className: "text-emphasis",
                                    children: d("Heading.NewCreditOrDebitCard")
                                }), (0, g.jsx)("span", {
                                    className: A ? "icon-up" : "icon-down"
                                })]
                            }), (0, g.jsxs)("div", {
                                id: "select-payment-profile-dropdown",
                                role: "listbox",
                                ref: H,
                                className: ta()("select-dropdown", {
                                    active: A
                                }),
                                children: [!a && r.filter(function(e) {
                                    return e.providerPayload !== E.providerPayload
                                }).map(function(e) {
                                    return ee(e)
                                }), (0, g.jsx)("button", {
                                    type: "button",
                                    className: "dropdown-selection-button",
                                    onClick: function() {
                                        V(), rr(re.UPDATE_PAYMENT_METHOD_ADD_CARD_CLICKED, o), _(!0)
                                    },
                                    children: (0, g.jsx)("div", {
                                        className: "text-emphasis payment-method-container ",
                                        children: d("Heading.NewCreditOrDebitCard")
                                    })
                                })]
                            })]
                        }), !L && (0, g.jsxs)(w.Fragment, {
                            children: [(0, g.jsx)("div", {
                                className: "font-caption-header text-emphasis",
                                children: d("Label.Expiration")
                            }), (0, g.jsx)("input", {
                                type: "string",
                                name: "expiration",
                                placeholder: "MM/YY",
                                className: "expiry-input ".concat(Y ? "error-input" : ""),
                                value: O,
                                inputMode: "numeric",
                                onChange: function(e) {
                                    var t = e.target.value;
                                    O.startsWith(t) || (O.length >= 2 && t.startsWith("1/") && (t = "0".concat(t)), (t = t.replace(/\D/g, "")).length > 4 && (t = t.slice(0, 4)), 1 === t.length && "0" !== t && "1" !== t ? t = "0".concat(t, "/") : 2 === t.length && Number(t) > 12 ? t = "0".concat(t.slice(0, 1), "/").concat(t.slice(1)) : t.length >= 2 && t.length <= 4 && (t = "".concat(t.slice(0, 2), "/").concat(t.slice(2)))), M(t)
                                }
                            }), Y && (0, g.jsx)("div", {
                                className: "font-caption-body input-error-text",
                                children: d("Error.InvalidExpirationDate")
                            })]
                        }), L && (0, g.jsx)(ny, {
                            showEmail: !1,
                            showDisclosure: !1,
                            onFormStatusChange: function(e) {
                                return y(e)
                            }
                        })]
                    }), (0, g.jsx)("div", {
                        className: "footer-divider"
                    }), (0, g.jsxs)(to.Modal.Footer, {
                        children: [(0, g.jsx)("span", {
                            className: "font-caption-body",
                            dangerouslySetInnerHTML: Z
                        }), (0, g.jsxs)("div", {
                            className: "modal-buttons",
                            children: [(0, g.jsx)(to.Button, {
                                variant: to.Button.variants.secondary,
                                width: to.Button.widths.full,
                                size: to.Button.sizes.large,
                                className: "action-button",
                                onClick: K,
                                children: d("Action.Cancel")
                            }), (0, g.jsxs)(to.Button, {
                                width: to.Button.widths.full,
                                size: to.Button.sizes.large,
                                className: "action-button",
                                isLoading: f,
                                isDisabled: !b,
                                onClick: function() {
                                    return aj(function() {
                                        return aM(this, function(e) {
                                            switch (e.label) {
                                                case 0:
                                                    if (L) return [3, 2];
                                                    return [4, z(E.id, O)];
                                                case 1:
                                                    e.sent(), e.label = 2;
                                                case 2:
                                                    if (!L) return [3, 4];
                                                    return [4, $()];
                                                case 3:
                                                    e.sent(), e.label = 4;
                                                case 4:
                                                    return [2]
                                            }
                                        })
                                    })()
                                },
                                children: [!f && d("Action.Save"), f && (0, g.jsx)("span", {
                                    className: "spinner spinner-sm"
                                })]
                            })]
                        })]
                    })]
                })
            };

            function aU(e, t, r, n, i, a, o) {
                try {
                    var s = e[a](o),
                        c = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(c) : Promise.resolve(c).then(n, i)
            }
            var aL = function() {
                var e;
                return (e = function() {
                    return function(e, t) {
                        var r, n, i, a = {
                                label: 0,
                                sent: function() {
                                    if (1 & i[0]) throw i[1];
                                    return i[1]
                                },
                                trys: [],
                                ops: []
                            },
                            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                        return o.next = s(0), o.throw = s(1), o.return = s(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
                            return this
                        }), o;

                        function s(s) {
                            return function(c) {
                                var u = [s, c];
                                if (r) throw TypeError("Generator is already executing.");
                                for (; o && (o = 0, u[0] && (a = 0)), a;) try {
                                    if (r = 1, n && (i = 2 & u[0] ? n.return : u[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, u[1])).done) return i;
                                    switch (n = 0, i && (u = [2 & u[0], i.value]), u[0]) {
                                        case 0:
                                        case 1:
                                            i = u;
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
                                            if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                a = 0;
                                                continue
                                            }
                                            if (3 === u[0] && (!i || u[1] > i[0] && u[1] < i[3])) {
                                                a.label = u[1];
                                                break
                                            }
                                            if (6 === u[0] && a.label < i[1]) {
                                                a.label = i[1], i = u;
                                                break
                                            }
                                            if (i && a.label < i[2]) {
                                                a.label = i[2], a.ops.push(u);
                                                break
                                            }
                                            i[2] && a.ops.pop(), a.trys.pop();
                                            continue
                                    }
                                    u = t.call(e, a)
                                } catch (e) {
                                    u = [6, e], n = 0
                                } finally {
                                    r = i = 0
                                }
                                if (5 & u[0]) throw u[1];
                                return {
                                    value: u[0] ? u[1] : void 0,
                                    done: !0
                                }
                            }
                        }
                    }(this, function(e) {
                        return [2, N.httpService.get(eJ.url.getUserBirthdateUrlConfig())]
                    })
                }, function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, i) {
                        var a = e.apply(t, r);

                        function o(e) {
                            aU(a, n, i, o, s, "next", e)
                        }

                        function s(e) {
                            aU(a, n, i, o, s, "throw", e)
                        }
                        o(void 0)
                    })
                })()
            };

            function a_(e, t) {
                ng(2, arguments);
                var r = nw(e),
                    n = nw(t),
                    i = r.getTime() - n.getTime();
                return i < 0 ? -1 : i > 0 ? 1 : i
            }

            function aB(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aY(e, t, r, n, i, a, o) {
                try {
                    var s = e[a](o),
                        c = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(c) : Promise.resolve(c).then(n, i)
            }

            function aF(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, i) {
                        var a = e.apply(t, r);

                        function o(e) {
                            aY(a, n, i, o, s, "next", e)
                        }

                        function s(e) {
                            aY(a, n, i, o, s, "throw", e)
                        }
                        o(void 0)
                    })
                }
            }

            function aH(e) {
                return function(e) {
                    if (Array.isArray(e)) return aB(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return aB(e, void 0);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aB(e, t)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function aq(e, t) {
                var r, n, i, a = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return o.next = s(0), o.throw = s(1), o.return = s(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
                    return this
                }), o;

                function s(s) {
                    return function(c) {
                        var u = [s, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; o && (o = 0, u[0] && (a = 0)), a;) try {
                            if (r = 1, n && (i = 2 & u[0] ? n.return : u[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, u[1])).done) return i;
                            switch (n = 0, i && (u = [2 & u[0], i.value]), u[0]) {
                                case 0:
                                case 1:
                                    i = u;
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
                                    if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!i || u[1] > i[0] && u[1] < i[3])) {
                                        a.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && a.label < i[1]) {
                                        a.label = i[1], i = u;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(u);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            u = t.call(e, a)
                        } catch (e) {
                            u = [6, e], n = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var aW = function(e) {
                    var t, r, n;
                    return null != (n = null == (r = e.metadata) || null == (t = r.privateServerSubscriptionTags) ? void 0 : t.includes("RobloxSubscription")) && n
                },
                aG = function(e) {
                    var t, r, n = Date.parse(e.expirationDate) > Date.now(),
                        i = (null != (t = e.priceInRobux) ? t : 0) > 0,
                        a = (null != (r = e.totalDiscountAmountInRobux) ? r : 0) > 0 && !aW(e);
                    return n && (i || a)
                },
                aV = function() {
                    return aF(function() {
                        var e, t, r, n, i, a;
                        return aq(this, function(o) {
                            switch (o.label) {
                                case 0:
                                    e = 100, t = 100, r = "", n = [], i = 0, o.label = 1;
                                case 1:
                                    var s, c;
                                    if (!(i < t)) return [3, 4];
                                    return [4, (s = r, c = e, aF(function() {
                                        var e;
                                        return aq(this, function(t) {
                                            switch (t.label) {
                                                case 0:
                                                    return e = {
                                                        privateServersTab: "MyPrivateServers",
                                                        cursor: s,
                                                        itemsPerPage: c
                                                    }, [4, N.httpService.get(eJ.url.getMyPrivateServers(), e)];
                                                case 1:
                                                    return [2, t.sent().data]
                                            }
                                        })
                                    })())];
                                case 2:
                                    if (a = o.sent(), n = aH(n).concat(aH(a.data.filter(aG))), !a.nextPageCursor) return [3, 4];
                                    r = a.nextPageCursor, o.label = 3;
                                case 3:
                                    return i++, [3, 1];
                                case 4:
                                    return [2, n]
                            }
                        })
                    })()
                };
            r(553);
            var aK = function(e) {
                var t, r, n, i, a = e.privateServer,
                    o = e.willRenew,
                    s = e.open,
                    c = e.setOpen,
                    u = e.onConfirm,
                    l = e.submitting,
                    d = (0, T.useTranslation)().translate,
                    p = new Date(a.expirationDate).toLocaleDateString(void 0, {
                        day: "2-digit",
                        month: "short",
                        year: "numeric"
                    }),
                    f = (0, N.escapeHtml)()(a.name),
                    h = (0, N.escapeHtml)()(a.universeName);
                return o ? (t = d("Heading.Unsubscribe"), r = d("Text.UnsubscribePrivateServer", {
                    privateServerName: f,
                    privateServerProviderName: h,
                    expiryDate: p
                }), n = d("Heading.Unsubscribe")) : (t = d("Heading.RenewSubscription"), r = (0, g.jsx)("div", {
                    dangerouslySetInnerHTML: {
                        __html: d("Text.RenewPrivateServerSubscription.V2", {
                            privateServerName: f,
                            privateServerProviderName: h,
                            robuxIcon: "<span class='icon-robux-16x16'></span>",
                            priceInRobux: null != (i = a.priceInRobux) ? i : 0
                        })
                    }
                }), n = d("Button.Renew")), (0, g.jsxs)(k.Dialog, {
                    className: "private-server-subscription-modal",
                    maxWidth: "Medium",
                    open: s,
                    onClose: function() {
                        return c(!1)
                    },
                    TransitionProps: {
                        timeout: 0
                    },
                    children: [(0, g.jsx)(k.DialogTitle, {
                        className: "private-server-subscription-modal-title",
                        children: t
                    }), (0, g.jsx)(k.DialogContent, {
                        className: "private-server-subscription-modal-content",
                        dividers: !0,
                        children: (0, g.jsx)(k.DialogContentText, {
                            children: r
                        })
                    }), (0, g.jsxs)(k.DialogActions, {
                        className: "private-server-subscription-modal-footer",
                        children: [(0, g.jsx)(k.Button, {
                            className: "action-button",
                            variant: "contained",
                            color: "secondary",
                            onClick: function() {
                                return c(!1)
                            },
                            children: d("Action.Dialog.Cancel")
                        }), (0, g.jsx)(k.Button, {
                            className: "action-button",
                            variant: "contained",
                            onClick: u,
                            disabled: l,
                            children: n
                        })]
                    })]
                })
            };

            function az(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aX(e, t, r, n, i, a, o) {
                try {
                    var s = e[a](o),
                        c = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(c) : Promise.resolve(c).then(n, i)
            }

            function aQ(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var a = [],
                            o = !0,
                            s = !1;
                        try {
                            for (i = i.call(e); !(o = (r = i.next()).done) && (a.push(r.value), !t || a.length !== t); o = !0);
                        } catch (e) {
                            s = !0, n = e
                        } finally {
                            try {
                                o || null == i.return || i.return()
                            } finally {
                                if (s) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return az(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return az(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var a$ = function(e) {
                var t = e.privateServer,
                    r = e.onBack,
                    n = (0, T.useTranslation)().translate,
                    i = t2().systemFeedbackService,
                    a = aQ((0, w.useState)(!1), 2),
                    o = a[0],
                    s = a[1],
                    c = aQ((0, w.useState)(!1), 2),
                    u = c[0],
                    l = c[1],
                    d = aQ((0, w.useState)(t.willRenew), 2),
                    p = d[0],
                    f = d[1],
                    h = aQ((0, w.useState)(t.priceInRobux), 2),
                    m = h[0],
                    b = h[1],
                    y = aQ((0, w.useState)(t.expirationDate), 2),
                    v = y[0],
                    P = y[1],
                    S = "/private-server/configure/".concat(t.privateServerId),
                    x = n("Label.PrivateServer", {
                        privateServerName: t.name
                    }),
                    E = p ? n("Heading.Unsubscribe") : n("Heading.RenewSubscription"),
                    C = new Date(v),
                    A = p ? C : new Date(0),
                    I = (0, w.useCallback)(function() {
                        var e;
                        return (e = function() {
                            var e;
                            return function(e, t) {
                                var r, n, i, a = {
                                        label: 0,
                                        sent: function() {
                                            if (1 & i[0]) throw i[1];
                                            return i[1]
                                        },
                                        trys: [],
                                        ops: []
                                    },
                                    o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                return o.next = s(0), o.throw = s(1), o.return = s(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
                                    return this
                                }), o;

                                function s(s) {
                                    return function(c) {
                                        var u = [s, c];
                                        if (r) throw TypeError("Generator is already executing.");
                                        for (; o && (o = 0, u[0] && (a = 0)), a;) try {
                                            if (r = 1, n && (i = 2 & u[0] ? n.return : u[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, u[1])).done) return i;
                                            switch (n = 0, i && (u = [2 & u[0], i.value]), u[0]) {
                                                case 0:
                                                case 1:
                                                    i = u;
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
                                                    if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                                        a = 0;
                                                        continue
                                                    }
                                                    if (3 === u[0] && (!i || u[1] > i[0] && u[1] < i[3])) {
                                                        a.label = u[1];
                                                        break
                                                    }
                                                    if (6 === u[0] && a.label < i[1]) {
                                                        a.label = i[1], i = u;
                                                        break
                                                    }
                                                    if (i && a.label < i[2]) {
                                                        a.label = i[2], a.ops.push(u);
                                                        break
                                                    }
                                                    i[2] && a.ops.pop(), a.trys.pop();
                                                    continue
                                            }
                                            u = t.call(e, a)
                                        } catch (e) {
                                            u = [6, e], n = 0
                                        } finally {
                                            r = i = 0
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
                                        s(!0), r.label = 1;
                                    case 1:
                                        var a, o;
                                        return r.trys.push([1, 3, 4, 5]), [4, (a = {
                                            price: null != m ? m : 0,
                                            active: !p
                                        }, o = t.privateServerId.toString(), aF(function() {
                                            return aq(this, function(e) {
                                                switch (e.label) {
                                                    case 0:
                                                        return [4, N.httpService.patch(eJ.url.updateVipServerSubscription(o), function(e) {
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
                                                        }({}, a))];
                                                    case 1:
                                                        return [2, e.sent().data]
                                                }
                                            })
                                        })())];
                                    case 2:
                                        return e = r.sent(), i.success(n("Message.PrivateServerChanged")), f(e.active), b(e.price), P(e.expirationDate), [3, 5];
                                    case 3:
                                        return r.sent(), i.warning(n("Error.GenericError")), [3, 5];
                                    case 4:
                                        return s(!1), l(!1), [7];
                                    case 5:
                                        return [2]
                                }
                            })
                        }, function() {
                            var t = this,
                                r = arguments;
                            return new Promise(function(n, i) {
                                var a = e.apply(t, r);

                                function o(e) {
                                    aX(a, n, i, o, s, "next", e)
                                }

                                function s(e) {
                                    aX(a, n, i, o, s, "throw", e)
                                }
                                o(void 0)
                            })
                        })()
                    }, [m, t.privateServerId, s, f, b, P, l, i, n, p]);
                return (0, g.jsx)("div", {
                    children: (0, g.jsxs)("div", {
                        className: "subscription-details-container private-server-details-container",
                        children: [(0, g.jsxs)("button", {
                            type: "button",
                            onClick: r,
                            className: "details-back-button btn-generic-back-sm",
                            children: [(0, g.jsx)("span", {
                                className: "icon-back"
                            }), n("Action.Back")]
                        }), (0, g.jsxs)("div", {
                            className: "details-info",
                            children: [(0, g.jsx)(aK, {
                                privateServer: t,
                                open: u,
                                setOpen: l,
                                onConfirm: I,
                                willRenew: p,
                                submitting: o
                            }), (0, g.jsxs)("div", {
                                className: "thumbnail-and-button-container",
                                children: [(0, g.jsx)("div", {
                                    className: "detail-card-icon-container",
                                    children: (0, g.jsx)(ts.Thumbnail2d, {
                                        targetId: t.universeId,
                                        type: ts.ThumbnailTypes.gameIcon,
                                        imgClassName: "detail-icon",
                                        containerClass: "thumbnail-detail-container",
                                        altName: t.universeName
                                    })
                                }), (0, g.jsx)(k.Button, {
                                    variant: "contained",
                                    className: "subscribe-button",
                                    color: p ? "secondary" : void 0,
                                    disabled: o || u,
                                    onClick: function() {
                                        return l(!0)
                                    },
                                    children: E
                                })]
                            }), (0, g.jsx)("h2", {
                                className: "detail-subscription-name",
                                children: x
                            }), (0, g.jsx)(k.Link, {
                                href: "/games/".concat(t.placeId),
                                underline: "hover",
                                className: "text-description",
                                children: t.universeName
                            }), (0, g.jsx)(tC, {
                                priceInRobux: m,
                                totalDiscountAmountInRobux: t.totalDiscountAmountInRobux
                            }), (0, g.jsx)(tk, {
                                expiration: C,
                                renewal: A
                            }), (0, g.jsx)(k.Button, {
                                variant: "text",
                                component: "a",
                                size: "small",
                                startIcon: (0, g.jsx)(k.EditIcon, {}),
                                href: S,
                                className: "configure-private-server-button",
                                children: n("Label.ConfigurePrivateServer")
                            }), (0, g.jsx)(k.Divider, {
                                className: "divider"
                            })]
                        })]
                    })
                })
            };

            function aJ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aZ(e, t, r, n, i, a, o) {
                try {
                    var s = e[a](o),
                        c = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(c) : Promise.resolve(c).then(n, i)
            }

            function a0(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, i) {
                        var a = e.apply(t, r);

                        function o(e) {
                            aZ(a, n, i, o, s, "next", e)
                        }

                        function s(e) {
                            aZ(a, n, i, o, s, "throw", e)
                        }
                        o(void 0)
                    })
                }
            }

            function a1(e) {
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

            function a2(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        r.push.apply(r, n)
                    }
                    return r
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function a3(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != i) {
                        var a = [],
                            o = !0,
                            s = !1;
                        try {
                            for (i = i.call(e); !(o = (r = i.next()).done) && (a.push(r.value), !t || a.length !== t); o = !0);
                        } catch (e) {
                            s = !0, n = e
                        } finally {
                            try {
                                o || null == i.return || i.return()
                            } finally {
                                if (s) throw n
                            }
                        }
                        return a
                    }
                }(e, t) || a6(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function a4(e) {
                return function(e) {
                    if (Array.isArray(e)) return aJ(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || a6(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function a6(e, t) {
                if (e) {
                    if ("string" == typeof e) return aJ(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aJ(e, t)
                }
            }

            function a5(e, t) {
                var r, n, i, a = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return o.next = s(0), o.throw = s(1), o.return = s(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
                    return this
                }), o;

                function s(s) {
                    return function(c) {
                        var u = [s, c];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; o && (o = 0, u[0] && (a = 0)), a;) try {
                            if (r = 1, n && (i = 2 & u[0] ? n.return : u[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, u[1])).done) return i;
                            switch (n = 0, i && (u = [2 & u[0], i.value]), u[0]) {
                                case 0:
                                case 1:
                                    i = u;
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
                                    if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === u[0] && (!i || u[1] > i[0] && u[1] < i[3])) {
                                        a.label = u[1];
                                        break
                                    }
                                    if (6 === u[0] && a.label < i[1]) {
                                        a.label = i[1], i = u;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(u);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            u = t.call(e, a)
                        } catch (e) {
                            u = [6, e], n = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & u[0]) throw u[1];
                        return {
                            value: u[0] ? u[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var a8 = function() {
                var e = a3((0, w.useState)(null), 2),
                    t = e[0],
                    r = e[1],
                    n = a3((0, w.useState)([]), 2),
                    i = n[0],
                    a = n[1],
                    o = a3((0, w.useState)([]), 2),
                    s = o[0],
                    c = o[1],
                    u = a3((0, w.useState)([]), 2),
                    l = u[0],
                    d = u[1],
                    p = a3((0, w.useState)(null), 2),
                    f = p[0],
                    h = p[1],
                    m = a3((0, w.useState)(!1), 2),
                    b = m[0],
                    y = m[1],
                    v = a3((0, w.useState)({
                        creditBalance: 0,
                        currencyCode: ""
                    }), 2),
                    S = v[0],
                    x = v[1],
                    E = a3((0, w.useState)(1), 2),
                    k = E[0],
                    A = E[1],
                    j = a3((0, w.useState)({
                        isWebPurchasingEnabled: !1,
                        isSubscriptionPaymentProfileUpdatingEnabled: !1
                    }), 2),
                    O = j[0],
                    M = j[1],
                    R = (0, T.useTranslation)().translate,
                    U = a3((0, w.useState)(null), 2),
                    L = U[0],
                    _ = U[1],
                    B = a3((0, w.useState)(!1), 2),
                    Y = B[0],
                    F = B[1],
                    H = a3((0, w.useState)(null), 2),
                    q = H[0],
                    W = H[1],
                    G = a3((0, w.useState)(!1), 2),
                    V = G[0],
                    K = G[1],
                    z = a3((0, w.useState)(!1), 2),
                    X = z[0],
                    Q = z[1],
                    $ = a3((0, w.useState)(), 2),
                    J = $[0],
                    Z = $[1],
                    ee = a3((0, w.useState)(void 0), 2),
                    et = ee[0],
                    er = ee[1],
                    en = a3((0, w.useState)([]), 2),
                    ei = en[0],
                    ea = en[1],
                    eo = a3((0, w.useState)(!0), 2),
                    es = eo[0],
                    ec = eo[1],
                    eu = a3((0, w.useState)(!1), 2),
                    el = eu[0],
                    ed = eu[1],
                    ep = a3((0, w.useState)(!1), 2),
                    ef = ep[0],
                    eh = ep[1],
                    em = a3((0, w.useState)(null), 2),
                    eb = em[0],
                    ey = em[1],
                    ev = a3((0, w.useState)(null), 2),
                    eg = ev[0],
                    ew = ev[1],
                    eP = a3((0, w.useState)(!1), 2),
                    eS = eP[0],
                    ex = eP[1],
                    eE = function() {
                        return ex(!1)
                    },
                    eT = function(e) {
                        rr(re.CLICK_EDIT_PAYMENT_METHOD, e), ex(!0)
                    },
                    eC = (0, C.useHistory)(),
                    ek = t2(),
                    eA = ek.SystemFeedback,
                    eI = ek.systemFeedbackService,
                    eD = function() {
                        return a0(function() {
                            var e, t;
                            return a5(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return r.trys.push([0, 2, , 3]), (0, I.fireEvent)(rv), [4, na(function() {
                                            return no(this, function(e) {
                                                return [2, N.httpService.get(eJ.url.getSavedPaymentProfiles())]
                                            })
                                        })()];
                                    case 1:
                                        if ((null == (t = r.sent()) || null == (e = t.data) ? void 0 : e.length) > 0) return ea(t.data.slice()), [2, t.data];
                                        return (0, I.fireEvent)(rg), [3, 3];
                                    case 2:
                                        return r.sent(), (0, I.fireEvent)(rw), [3, 3];
                                    case 3:
                                        return [2, []]
                                }
                            })
                        })()
                    },
                    eN = (0, w.useCallback)(function(e) {
                        r(e), _(e)
                    }, [r, _]);
                (0, w.useEffect)(function() {
                    rr(re.PAGE_LOAD)
                }, []), (0, w.useEffect)(function() {
                    if (0 !== i.length) {
                        var e = new URLSearchParams(window.location.search),
                            r = e.get("id"),
                            n = e.get("type");
                        if (r && n) {
                            var a = te(n, r);
                            if (a) {
                                var o = i.find(function(e) {
                                    return e.subscriptionTargetKey === a
                                });
                                o && (_(o), F(!0), rr(re.EMAIL_REFERER_PAGE_LOAD, o))
                            }
                            return
                        }
                        var s = window.location.hash;
                        if (s.startsWith("#!/subscriptions?subscription=")) {
                            var c = s.substring(30);
                            if (null !== c && "" !== c)
                                if (c.startsWith("PRM")) K(!0), _(t), rr(re.EMAIL_REFERER_PAGE_LOAD);
                                else {
                                    var u = i.find(function(e) {
                                        return e.subscriptionTargetKey === c
                                    });
                                    u && (_(u), rr(re.EMAIL_REFERER_PAGE_LOAD, u))
                                }
                        }
                    }
                }, [L, t, i]), (0, w.useEffect)(function() {
                    na(function() {
                        return no(this, function(e) {
                            return [2, N.httpService.get(eJ.url.getStripeEnabledForUserConfig())]
                        })
                    })().then(function(e) {
                        eh(e.data.isPaymentProviderEnabledForUser), ed(e.data.isUserVpcApproved)
                    }).catch(function() {
                        eh(!1), ed(!1)
                    }), eD().catch(function() {
                        return eI.warning("Failed to load payment profiles")
                    }), aL().then(function(e) {
                        var t, r, n;
                        ec((t = e.data.birthDay, r = e.data.birthMonth, n = e.data.birthYear, 18 > function(e, t) {
                            ng(2, arguments);
                            var r = nw(e),
                                n = nw(t),
                                i = a_(r, n),
                                a = Math.abs(function(e, t) {
                                    ng(2, arguments);
                                    var r = nw(e),
                                        n = nw(t);
                                    return r.getFullYear() - n.getFullYear()
                                }(r, n));
                            r.setFullYear(1584), n.setFullYear(1584);
                            var o = a_(r, n) === -i,
                                s = i * (a - Number(o));
                            return 0 === s ? 0 : s
                        }(new Date, new Date(n, r - 1, t))))
                    }).catch(function() {
                        eI.warning("Something went wrong.")
                    }), e3(function() {
                        return e6(this, function(e) {
                            switch (e.label) {
                                case 0:
                                    return [4, N.httpService.get(eJ.url.getSubscriptionMetadata)];
                                case 1:
                                    return [2, e.sent().data]
                            }
                        })
                    })().then(function(e) {
                        return M(e)
                    }).catch(function() {
                        return M({
                            isWebPurchasingEnabled: !1,
                            isSubscriptionPaymentProfileUpdatingEnabled: !1
                        })
                    })
                }, [eI]), (0, w.useEffect)(function() {
                    if (t) {
                        var e, r, n, i, a;
                        t.showLowBalanceNotification = X, void 0 !== J && (t.paymentProvider = J), t.cardInfo = {
                            cardNetwork: null != (e = null == et ? void 0 : et.providerPayload.CardNetwork) ? e : "",
                            last4Digits: null != (r = null == et ? void 0 : et.providerPayload.Last4Digits) ? r : "",
                            expMonth: null != (n = null == et ? void 0 : et.providerPayload.ExpMonth) ? n : 0,
                            expYear: null != (i = null == et ? void 0 : et.providerPayload.ExpYear) ? i : 0
                        }, t.paymentProfileId = null != (a = null == et ? void 0 : et.id) ? a : "", (null == et ? void 0 : et.providerPayload.CardNetwork) && (null == et ? void 0 : et.providerPayload.Last4Digits) && (null == et ? void 0 : et.providerPayload.ExpMonth) && (null == et ? void 0 : et.providerPayload.ExpYear) && (t.purchasePlatform = eq.DESKTOP)
                    }
                }, [X, t, J, null == et ? void 0 : et.providerPayload.CardNetwork, null == et ? void 0 : et.providerPayload.Last4Digits, null == et ? void 0 : et.providerPayload.ExpMonth, null == et ? void 0 : et.providerPayload.ExpYear, null == et ? void 0 : et.id]), (0, w.useEffect)(function() {
                    var e;
                    (0, I.fireEvent)(rm), (e = D.authenticatedUser.id, e3(function() {
                        var t, r, n, i, a;
                        return e6(this, function(o) {
                            switch (o.label) {
                                case 0:
                                    t = eJ.url.getUserPremiumSubscription(e), o.label = 1;
                                case 1:
                                    return o.trys.push([1, 3, , 4]), [4, N.httpService.get(t)];
                                case 2:
                                    return n = (r = o.sent()).data.price ? {
                                        amount: r.data.price.amount,
                                        currencyCode: r.data.price.currency.currencyCode
                                    } : null, [2, {
                                        premiumFeatureId: (i = r.data.subscriptionProductModel).premiumFeatureId,
                                        robuxStipendAmount: i.robuxStipendAmount,
                                        expiration: new Date(i.expiration),
                                        renewal: new Date(i.renewal),
                                        created: new Date(i.created),
                                        purchasePlatform: i.purchasePlatform,
                                        name: i.subscriptionName,
                                        price: n,
                                        subscriptionProviderName: "Roblox",
                                        subscriptionTargetKey: "PRM-".concat(i.premiumFeatureId),
                                        showLowBalanceNotification: !1,
                                        paymentProfileId: ""
                                    }];
                                case 3:
                                    if (404 === (a = o.sent()).status) return [2, null];
                                    throw a;
                                case 4:
                                    return [2]
                            }
                        })
                    })()).then(function(e) {
                        null === e ? (0, I.fireEvent)(rn) : (0, I.fireEvent)(rb), r(e), V && _(e)
                    }).catch(function() {
                        (0, I.fireEvent)(ry), eI.warning(R("MessageUnknownError"))
                    })
                }, [V, eI, R]), (0, w.useEffect)(function() {
                    Promise.all([e5(new Date).then(function(e) {
                        var t, r, n, i, a, o, s, c, u, l = e.filter(function(e) {
                                return e.subscriptionTargetKey.startsWith("EXP")
                            }),
                            d = e.filter(function(e) {
                                return e.subscriptionTargetKey.startsWith("RBP") || e.subscriptionTargetKey.startsWith("CUR")
                            }),
                            p = e.find(function(e) {
                                return e.subscriptionTargetKey.startsWith("PRM")
                            });
                        return p && (Q(null != (a = p.showLowBalanceNotification) && a), Z(p.paymentProvider), er({
                            id: p.paymentProfileId,
                            providerPayload: {
                                CardNetwork: null != (o = null == (t = p.cardInfo) ? void 0 : t.cardNetwork) ? o : "",
                                Last4Digits: null != (s = null == (r = p.cardInfo) ? void 0 : r.last4Digits) ? s : "",
                                ExpMonth: null != (c = null == (n = p.cardInfo) ? void 0 : n.expMonth) ? c : 0,
                                ExpYear: null != (u = null == (i = p.cardInfo) ? void 0 : i.expYear) ? u : 0
                            }
                        })), {
                            devSubs: l,
                            v1RobloxOwnedSubs: d
                        }
                    }), Promise.all([e7(eL), e7(eU)]).then(function(e) {
                        var t, r, n, i, a, o = a3(e, 2),
                            s = o[0],
                            c = o[1],
                            u = null == (t = s[0]) ? void 0 : t.productInfo,
                            l = null == u || null == (n = u.productTypeDetails) || null == (r = n.robloxSubscriptionProductDetails) ? void 0 : r.featureConfig;
                        u && l && h({
                            featureConfig: l,
                            periodType: u.periodType
                        });
                        var d = null == (a = s[0]) || null == (i = a.productKey) ? void 0 : i.id;
                        return d && e3(function() {
                            var e, t;
                            return e6(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return r.trys.push([0, 2, , 3]), [4, e8.subscriptionsV2ListAvailableSubscriptionProducts({
                                            productType: eL,
                                            includePurchased: !0,
                                            grantType: "FaeFreeTrial"
                                        })];
                                    case 1:
                                        return [2, null != (t = null == (e = r.sent().products.find(function(e) {
                                            return "Week" === e.periodType
                                        })) ? void 0 : e.productKey.id) ? t : null];
                                    case 2:
                                        return r.sent(), [2, null];
                                    case 3:
                                        return [2]
                                }
                            })
                        })().then(function(e) {
                            return y(e === d)
                        }).catch(function() {
                            return y(!1)
                        }), a4(s.map(tn)).concat(a4(c.map(tn)))
                    })]).then(function(e) {
                        var t = a3(e, 2),
                            r = t[0],
                            n = r.devSubs,
                            i = r.v1RobloxOwnedSubs,
                            o = t[1],
                            s = new Set(o.map(function(e) {
                                return e.subscriptionTargetKey
                            })),
                            c = i.filter(function(e) {
                                return !s.has(e.subscriptionTargetKey)
                            });
                        a(a4(n).concat(a4(o), a4(c)))
                    }).catch(function() {
                        eI.warning(R("MessageUnknownError"))
                    }), aV().then(function(e) {
                        return c(e)
                    }).catch(function() {
                        return eI.warning(R("MessageUnknownError"))
                    })
                }, [eI, R]), (0, w.useEffect)(function() {
                    var e = i.map(function(e) {
                            return {
                                type: eW.SUBSCRIPTION,
                                subscription: e,
                                privateServer: null,
                                name: e.name,
                                providerName: e.subscriptionProviderName
                            }
                        }),
                        t = s.map(function(e) {
                            return {
                                type: eW.PRIVATE_SERVER,
                                subscription: null,
                                privateServer: e,
                                name: e.name,
                                providerName: e.universeName
                            }
                        });
                    d(a4(e).concat(a4(t)).sort(function(e, t) {
                        if (e.type === eW.SUBSCRIPTION && t.type === eW.PRIVATE_SERVER) return -1;
                        if (e.type === eW.PRIVATE_SERVER && t.type === eW.SUBSCRIPTION) return 1;
                        var r = e.providerName.localeCompare(t.providerName);
                        return 0 !== r ? r : e.name.localeCompare(t.name)
                    }))
                }, [i, s]), (0, w.useEffect)(function() {
                    e3(function() {
                        var e;
                        return e6(this, function(t) {
                            switch (t.label) {
                                case 0:
                                    return e = eJ.url.getUserCreditBalance(), [4, N.httpService.get(e)];
                                case 1:
                                    return [2, t.sent().data]
                            }
                        })
                    })().then(function(e) {
                        null != e && x(e)
                    }).catch(function(e) {
                        e.status !== N.httpResponseCodes.notFound && eI.warning(R("MessageUnknownError"))
                    })
                }, [eI, R]), (0, w.useEffect)(function() {
                    if (eg && eb) {
                        var e = Date.now(),
                            t = !1,
                            r = function() {
                                return a0(function() {
                                    return a5(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return [4, a0(function() {
                                                    var e, t, r, n, i, o;
                                                    return a5(this, function(s) {
                                                        switch (s.label) {
                                                            case 0:
                                                                return [4, Promise.all([e5(new Date).then(function(e) {
                                                                    return e.filter(function(e) {
                                                                        return e.subscriptionTargetKey.startsWith("EXP")
                                                                    })
                                                                }), Promise.all([e7(eL), e7(eU)]), aV()])];
                                                            case 1:
                                                                return t = (e = a3.apply(void 0, [s.sent(), 3]))[0], n = (r = a3(e[1], 2))[0], i = r[1], o = e[2], a(a4(a4(t).concat(a4(n.map(tn)))).concat(a4(i.map(tn)))), c(o), [2]
                                                        }
                                                    })
                                                })().catch(function() {})];
                                            case 1:
                                                return e.sent(), ew(null), ey(null), [2]
                                        }
                                    })
                                })()
                            },
                            n = setInterval(function() {
                                return a0(function() {
                                    var i, a;
                                    return a5(this, function(o) {
                                        switch (o.label) {
                                            case 0:
                                                if (t) return [2];
                                                if (!(Date.now() - e >= 1e4)) return [3, 2];
                                                return clearInterval(n), [4, r()];
                                            case 1:
                                                return o.sent(), [2];
                                            case 2:
                                                t = !0, o.label = 3;
                                            case 3:
                                                return o.trys.push([3, 7, 8, 9]), [4, e7(eL)];
                                            case 4:
                                                if (!(i = o.sent().map(tn).find(function(e) {
                                                        return e.subscriptionTargetKey === eb
                                                    }))) return [2];
                                                switch (a = !1, eg) {
                                                    case eX.CANCEL:
                                                        a = tU(i.renewal, i.expiration);
                                                        break;
                                                    case eX.RESUBSCRIBE:
                                                        a = !tU(i.renewal, i.expiration)
                                                }
                                                if (!a) return [3, 6];
                                                return clearInterval(n), [4, r()];
                                            case 5:
                                                o.sent(), o.label = 6;
                                            case 6:
                                                return [3, 9];
                                            case 7:
                                                return o.sent(), [3, 9];
                                            case 8:
                                                return t = !1, [7];
                                            case 9:
                                                return [2]
                                        }
                                    })
                                })()
                            }, 500);
                        return function() {
                            return clearInterval(n)
                        }
                    }
                }, [eg, eb]);
                var ej = (0, w.useCallback)(function(e, t) {
                        _(e), K(t), t || rr(re.VIEW_ACTIVE, e)
                    }, []),
                    eO = (0, w.useCallback)(function(e) {
                        W(e)
                    }, []),
                    eM = function() {
                        if (Y) {
                            F(!1), window.history.back();
                            return
                        }
                        _(null), W(null), K(!1), eC.push("#!/subscriptions")
                    },
                    eR = function(e, n, o) {
                        if (e && t && n) {
                            var s = a2(a1({}, t), {
                                expiration: t.renewal,
                                renewal: new Date(0)
                            });
                            r(s), L && V && L.subscriptionTargetKey === o && _(s)
                        }
                        if (e && t && !n) {
                            var c = a2(a1({}, t), {
                                renewal: t.expiration
                            });
                            r(c), L && V && L.subscriptionTargetKey === o && _(c)
                        }
                        var u = a4(i),
                            l = u.find(function(e) {
                                return e.subscriptionTargetKey === o
                            });
                        !e && n && l && (l.expiration = l.renewal, l.renewal = new Date(0), a(u), l.productType === eL ? (_(null), eC.push("#!/subscriptions"), ey(o), ew(eX.CANCEL)) : L && !V && L.subscriptionTargetKey === o && _(l)), e || n || !l || (l.renewal = l.expiration, a(u), l.productType === eL && (ey(o), ew(eX.RESUBSCRIBE)), L && !V && L.subscriptionTargetKey === o && _(l))
                    },
                    e_ = function(e) {
                        var t = a4(i),
                            r = t.find(function(t) {
                                return t.subscriptionTargetKey === e
                            });
                        r && (r.showLowBalanceNotification = !1, a(t)), L && L.subscriptionTargetKey === e && _(a2(a1({}, L), {
                            showLowBalanceNotification: !1
                        }))
                    },
                    eB = function(e, r) {
                        if (e.startsWith("PRM") && t) return void eN(a2(a1({}, t), {
                            cardInfo: {
                                cardNetwork: r.providerPayload.CardNetwork,
                                last4Digits: r.providerPayload.Last4Digits,
                                expMonth: r.providerPayload.ExpMonth,
                                expYear: r.providerPayload.ExpYear
                            },
                            paymentProfileId: r.id
                        }));
                        var n = a4(i).find(function(t) {
                            return t.subscriptionTargetKey === e
                        });
                        n && (n.cardInfo = {
                            cardNetwork: r.providerPayload.CardNetwork,
                            last4Digits: r.providerPayload.Last4Digits,
                            expMonth: r.providerPayload.ExpMonth,
                            expYear: r.providerPayload.ExpYear
                        }, n.paymentProfileId = r.id), L && n && L.subscriptionTargetKey === e && _(a2(a1({}, L), {
                            cardInfo: n.cardInfo
                        }))
                    },
                    eY = function(e, r, n, i) {
                        var a = a2(a1({}, r), {
                            providerPayload: a2(a1({}, r.providerPayload), {
                                ExpMonth: n,
                                ExpYear: i
                            })
                        });
                        (ea(a4(ei.filter(function(e) {
                            return e.id !== r.id
                        })).concat([a])), e.startsWith("PRM") && t) ? eN(a2(a1({}, t), {
                            cardInfo: {
                                cardNetwork: a.providerPayload.CardNetwork,
                                last4Digits: a.providerPayload.Last4Digits,
                                expMonth: a.providerPayload.ExpMonth,
                                expYear: a.providerPayload.ExpYear
                            },
                            paymentProfileId: r.id
                        })): L && L.subscriptionTargetKey === e && _(a2(a1({}, L), {
                            cardInfo: {
                                cardNetwork: a.providerPayload.CardNetwork,
                                last4Digits: a.providerPayload.Last4Digits,
                                expMonth: a.providerPayload.ExpMonth,
                                expYear: a.providerPayload.ExpYear
                            }
                        }))
                    },
                    eF = !t || t.expiration < new Date,
                    eH = (0, g.jsxs)(P().Fragment, {
                        children: [(0, g.jsx)("h3", {
                            className: "subscription-count font-header-2",
                            children: R("Heading.Subscriptions.Active", {
                                activeNumber: l.length + +!!t
                            })
                        }), (0, g.jsx)(tK, {
                            premiumSubscription: eF ? null : t,
                            subscriptionList: l,
                            emptyText: R("Description.Subscriptions.NoActive"),
                            onSelectSubscription: ej,
                            onSelectPrivateServer: eO,
                            resultsPerPage: 10,
                            currentPage: k,
                            onChangePage: A,
                            isPriceLoading: null != eg
                        })]
                    });
                return (0, g.jsxs)("div", {
                    className: "subscription-management-container",
                    children: [(0, g.jsx)("h2", {
                        className: "subscription-title",
                        children: R("Heading.Tab.Subscriptions")
                    }), function() {
                        if (q) return (0, g.jsx)(a$, {
                            privateServer: q,
                            onBack: eM
                        });
                        if (L) {
                            var e;
                            return (0, g.jsxs)(w.Fragment, {
                                children: [(0, g.jsx)(nn, {
                                    subscription: L,
                                    isPremium: V,
                                    creditBalance: S,
                                    onStatusChange: eR,
                                    onNotificationDismiss: e_,
                                    onBack: eM,
                                    subscriptionMetadata: O,
                                    blackbirdProductInfo: f,
                                    isFaeFreeTrial: b,
                                    onEditPaymentMethodClick: function() {
                                        void 0 !== tM(ei, L.paymentProfileId, L.cardInfo) && eT(L)
                                    }
                                }), L.paymentProvider === ez.STRIPE && "" !== L.paymentProfileId && void 0 !== tM(ei, L.paymentProfileId, L.cardInfo) && ef && (0, g.jsx)(nh, {
                                    children: (0, g.jsx)(aR, {
                                        subscriptionId: L.subscriptionTargetKey,
                                        isUserUnder18: es && !el,
                                        paymentProfiles: ei,
                                        isOpen: eS,
                                        subscription: L,
                                        onClose: eE,
                                        onSave: function(e) {
                                            eB(L.subscriptionTargetKey, e)
                                        },
                                        onPaymentProfileExpirationUpdate: function(e, t, r) {
                                            return eY(L.subscriptionTargetKey, e, t, r)
                                        },
                                        fetchSavedPaymentProfiles: eD,
                                        defaultPaymentProfile: null != (e = tM(ei, L.paymentProfileId, L.cardInfo)) ? e : {
                                            providerPayload: {
                                                CardNetwork: "",
                                                Last4Digits: "",
                                                ExpMonth: 0,
                                                ExpYear: 0
                                            },
                                            id: ""
                                        }
                                    })
                                })]
                            })
                        }
                        return null
                    }() || eH, (0, g.jsx)("p", {
                        className: "subscription-help-text small text",
                        dangerouslySetInnerHTML: {
                            __html: R("Label.SubscriptionsHelpWithLink", {
                                aTagStartWithHref: "<a href=",
                                subscriptionsHelpPagesLink: '"'.concat("https://help.roblox.com/hc/sections/20316062241172", '"'),
                                hrefEnd: ' class="text-link" target="_blank">',
                                aTagEnd: "</a>"
                            })
                        }
                    }), (0, g.jsx)(eA, {})]
                })
            };

            function a7(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var a9 = function(e) {
                    var t, r = e.children,
                        n = (t = (0, to.createSystemFeedback)(), function(e) {
                            if (Array.isArray(e)) return e
                        }(t) || function(e, t) {
                            var r, n, i = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != i) {
                                var a = [],
                                    o = !0,
                                    s = !1;
                                try {
                                    for (i = i.call(e); !(o = (r = i.next()).done) && (a.push(r.value), a.length !== t); o = !0);
                                } catch (e) {
                                    s = !0, n = e
                                } finally {
                                    try {
                                        o || null == i.return || i.return()
                                    } finally {
                                        if (s) throw n
                                    }
                                }
                                return a
                            }
                        }(t, 2) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return a7(e, 2);
                                var r = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return a7(e, t)
                            }
                        }(t, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        i = n[0],
                        a = n[1];
                    return (0, g.jsx)(t1.Provider, {
                        value: {
                            SystemFeedback: i,
                            systemFeedbackService: a
                        },
                        children: r
                    })
                },
                oe = function() {
                    var e = (0, T.useTheme)();
                    return (0, g.jsx)(k.UIThemeProvider, {
                        theme: e,
                        cssBaselineMode: "disabled",
                        children: (0, g.jsx)(T.TranslationProvider, {
                            config: A,
                            children: (0, g.jsx)(a9, {
                                children: (0, g.jsx)(C.BrowserRouter, {
                                    children: (0, g.jsx)(a8, {})
                                })
                            })
                        })
                    })
                };
            Object.assign(E(), {
                SubscriptionManagement: {
                    renderComponent: function(e) {
                        var t = document.getElementById(e);
                        return null !== t && ((0, S.unmountComponentAtNode)(t), (0, S.render)((0, g.jsx)(oe, {}), t), !0)
                    }
                }
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("SubscriptionManagement");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/subscriptionManagement-0bda13f76d71cc70.js.map
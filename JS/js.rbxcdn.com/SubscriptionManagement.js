! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "293b975bde1f6c214128f0f559e81a9eeeebce16"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "3705d68a-ed02-44bb-a80e-af342b94d9e2", e._sentryDebugIdIdentifier = "sentry-dbid-3705d68a-ed02-44bb-a80e-af342b94d9e2")
    } catch (e) {}
}(),
function() {
    var e = {
            199: function(e, t, r) {
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
                            var r, n, i = e && ("u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"]);
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
                    var u, c, l, d, p, f = {
                        exports: {}
                    };
                    f.exports = (function() {
                        if (p) return d;
                        p = 1;
                        var e = l ? c : (l = 1, c = "SECRET_DO_NOT_PASS_THIS_OR_YOU_WILL_BE_FIRED");

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
                    var h = (u = f.exports) && u.__esModule && Object.prototype.hasOwnProperty.call(u, "default") ? u.default : u,
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
                            for (var s = {}, u = 0; u < a.length; u += 1) s[a[u]] = !0;
                            for (var c = 0; c < o.length; c += 1) s[o[c]] = !0;
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
                        O = function(e) {
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
                                u = s[0],
                                c = s[1];
                            t.useEffect(function() {
                                var e = !0,
                                    t = function(e) {
                                        c(function(t) {
                                            return t.stripe ? t : {
                                                stripe: e,
                                                elements: e.elements(n)
                                            }
                                        })
                                    };
                                return "async" !== a.tag || u.stripe ? "sync" !== a.tag || u.stripe || t(a.stripe) : a.stripePromise.then(function(r) {
                                        r && e && t(r)
                                    }),
                                    function() {
                                        e = !1
                                    }
                            }, [a, u, n]);
                            var l = b(r);
                            t.useEffect(function() {
                                null !== l && l !== r && console.warn("Unsupported prop change on Elements: You cannot change the `stripe` prop after setting it.")
                            }, [l, r]);
                            var d = b(n);
                            return t.useEffect(function() {
                                if (u.elements) {
                                    var e = w(n, d, ["clientSecret", "fonts"]);
                                    e && u.elements.update(e)
                                }
                            }, [n, d, u.elements]), t.useEffect(function() {
                                E(u.stripe)
                            }, [u.stripe]), t.createElement(T.Provider, {
                                value: u
                            }, i)
                        };
                    O.propTypes = {
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
                    var j = ["on", "session"],
                        k = t.createContext(null);
                    k.displayName = "CustomCheckoutSdkContext";
                    var D = function(e, t) {
                            if (!e) throw Error("Could not find CustomCheckoutProvider context; You need to wrap the part of your app that ".concat(t, " in an <CustomCheckoutProvider> provider."));
                            return e
                        },
                        N = t.createContext(null);
                    N.displayName = "CustomCheckoutContext";
                    var R = function(e, t) {
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
                            }(e, j);
                            return t ? n(n({}, r), t) : n(n({}, r), e.session())
                        },
                        M = function(e) {
                            var r = e.stripe,
                                n = e.options,
                                i = e.children,
                                a = t.useMemo(function() {
                                    return x(r, "Invalid prop `stripe` supplied to `CustomCheckoutProvider`. We recommend using the `loadStripe` utility from `@stripe/stripe-js`. See https://stripe.com/docs/stripe-js/react#elements-props-stripe for details.")
                                }, [r]),
                                s = o(t.useState(null), 2),
                                u = s[0],
                                c = s[1],
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
                                        e && (f(a.stripe, e), e.on("change", c))
                                    })) : a.stripePromise.then(function(t) {
                                        t && e && !h.current && (h.current = !0, t.initCustomCheckout(n).then(function(e) {
                                            e && (f(t, e), e.on("change", c))
                                        }))
                                    }),
                                    function() {
                                        e = !1
                                    }
                            }, [a, d, n, c]);
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
                                return R(d.customCheckoutSdk, u)
                            }, [d.customCheckoutSdk, u]);
                            return d.customCheckoutSdk ? t.createElement(k.Provider, {
                                value: d
                            }, t.createElement(N.Provider, {
                                value: w
                            }, i)) : null
                        };
                    M.propTypes = {
                        stripe: h.any,
                        options: h.shape({
                            clientSecret: h.string.isRequired,
                            elementsOptions: h.object
                        }).isRequired
                    };
                    var U = function(e) {
                            var r = t.useContext(k),
                                n = t.useContext(T);
                            if (r && n) throw Error("You cannot wrap the part of your app that ".concat(e, " in both <CustomCheckoutProvider> and <Elements> providers."));
                            return r ? D(r, e) : C(n, e)
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
                                        u = r.options,
                                        c = void 0 === u ? {} : u,
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
                                        O = "elements" in C ? C.elements : null,
                                        A = "customCheckoutSdk" in C ? C.customCheckoutSdk : null,
                                        I = o(t.useState(null), 2),
                                        j = I[0],
                                        k = I[1],
                                        D = t.useRef(null),
                                        N = t.useRef(null);
                                    m(j, "blur", l), m(j, "focus", d), m(j, "escape", h), m(j, "click", y), m(j, "loaderror", v), m(j, "loaderstart", g), m(j, "networkschange", P), m(j, "confirm", S), m(j, "cancel", x), m(j, "shippingaddresschange", E), m(j, "shippingratechange", T), m(j, "change", f), p && (i = "expressCheckout" === e ? p : function() {
                                        p(j)
                                    }), m(j, "ready", i), t.useLayoutEffect(function() {
                                        if (null === D.current && null !== N.current && (O || A)) {
                                            var t = null;
                                            A ? t = A.createElement(e, c) : O && (t = O.create(e, c)), D.current = t, k(t), t && t.mount(N.current)
                                        }
                                    }, [O, A, c]);
                                    var R = b(c);
                                    return t.useEffect(function() {
                                        if (D.current) {
                                            var e = w(c, R, ["paymentRequest"]);
                                            e && "update" in D.current && D.current.update(e)
                                        }
                                    }, [c, R]), t.useLayoutEffect(function() {
                                        return function() {
                                            if (D.current && "function" == typeof D.current.destroy) try {
                                                D.current.destroy(), D.current = null
                                            } catch (e) {}
                                        }
                                    }, []), t.createElement("div", {
                                        id: a,
                                        className: s,
                                        ref: N
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
                        _ = "u" < typeof window,
                        B = t.createContext(null);
                    B.displayName = "EmbeddedCheckoutProviderContext";
                    var F = function() {
                            var e = t.useContext(B);
                            if (!e) throw Error("<EmbeddedCheckout> must be used within <EmbeddedCheckoutProvider>");
                            return e
                        },
                        Y = _ ? function(e) {
                            var r = e.id,
                                n = e.className;
                            return F(), t.createElement("div", {
                                id: r,
                                className: n
                            })
                        } : function(e) {
                            var r = e.id,
                                n = e.className,
                                i = F().embeddedCheckout,
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
                        q = L("auBankAccount", _),
                        H = L("card", _),
                        V = L("cardNumber", _),
                        W = L("cardExpiry", _),
                        G = L("cardCvc", _),
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
                    e.AddressElement = en, e.AffirmMessageElement = eo, e.AfterpayClearpayMessageElement = es, e.AuBankAccountElement = q, e.CardCvcElement = G, e.CardElement = H, e.CardExpiryElement = W, e.CardNumberElement = V, e.CurrencySelectorElement = ee, e.CustomCheckoutProvider = M, e.Elements = O, e.ElementsConsumer = I, e.EmbeddedCheckout = Y, e.EmbeddedCheckoutProvider = function(e) {
                        var r = e.stripe,
                            n = e.options,
                            i = e.children,
                            a = t.useMemo(function() {
                                return x(r, "Invalid prop `stripe` supplied to `EmbeddedCheckoutProvider`. We recommend using the `loadStripe` utility from `@stripe/stripe-js`. See https://stripe.com/docs/stripe-js/react#elements-props-stripe for details.")
                            }, [r]),
                            s = t.useRef(null),
                            u = t.useRef(null),
                            c = o(t.useState({
                                embeddedCheckout: null
                            }), 2),
                            l = c[0],
                            d = c[1];
                        t.useEffect(function() {
                            if (!u.current && !s.current) {
                                var e = function(e) {
                                    u.current || s.current || (u.current = e, s.current = u.current.initEmbeddedCheckout(n).then(function(e) {
                                        d({
                                            embeddedCheckout: e
                                        })
                                    }))
                                };
                                "async" === a.tag && !u.current && (n.clientSecret || n.fetchClientSecret) ? a.stripePromise.then(function(t) {
                                    t && e(t)
                                }) : "sync" === a.tag && !u.current && (n.clientSecret || n.fetchClientSecret) && e(a.stripe)
                            }
                        }, [a, n, l, u]), t.useEffect(function() {
                            return function() {
                                l.embeddedCheckout ? (s.current = null, l.embeddedCheckout.destroy()) : s.current && s.current.then(function() {
                                    s.current = null, l.embeddedCheckout && l.embeddedCheckout.destroy()
                                })
                            }
                        }, [l.embeddedCheckout]), t.useEffect(function() {
                            E(u)
                        }, [u]);
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
                        D(t.useContext(k), "calls useCustomCheckout()");
                        var e = t.useContext(N);
                        if (!e) throw Error("Could not find CustomCheckout Context; You need to wrap the part of your app that calls useCustomCheckout() in an <CustomCheckoutProvider> provider.");
                        return e
                    }, e.useElements = function() {
                        return A("calls useElements()").elements
                    }, e.useStripe = function() {
                        return U("calls useStripe()").stripe
                    }
                }, "object" == (t && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) ? i(t, r(609)) : "function" == typeof define && define.amd ? define(["exports", "react"], i) : i((n = "u" > typeof globalThis ? globalThis : n || self).ReactStripe = {}, n.React)
            },
            890: function(e, t) {
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
                    u = function(e) {
                        var t = e && !e.advancedFraudSignals ? "?advancedFraudSignals=false" : "",
                            r = document.createElement("script");
                        r.src = "".concat(i).concat(t);
                        var n = document.head || document.body;
                        if (!n) throw Error("Expected document.body not to be null. Stripe.js requires a <body> element.");
                        return n.appendChild(r), r
                    },
                    c = function(e, t) {
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
                        return c(n, r), n
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
                            if ("u" < typeof window || "u" < typeof document) return void t(null);
                            if (window.Stripe && e && console.warn(o), window.Stripe) return void t(window.Stripe);
                            try {
                                var n, i = s();
                                i && e ? console.warn(o) : i ? i && null !== p && null !== d && (i.removeEventListener("load", p), i.removeEventListener("error", d), null == (n = i.parentNode) || n.removeChild(i), i = u(e)) : i = u(e), p = function() {
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
            696: function(e, t, r) {
                e.exports = r(890)
            },
            611: function(e) {
                function t(e) {
                    return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
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
            773: function(e, t) {
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

                function u() {
                    throw Error("clearTimeout has not been defined")
                }
                try {
                    r = "function" == typeof setTimeout ? setTimeout : s
                } catch (e) {
                    r = s
                }
                try {
                    n = "function" == typeof clearTimeout ? clearTimeout : u
                } catch (e) {
                    n = u
                }

                function c(e) {
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
                        var e = c(f);
                        d = !0;
                        for (var t = l.length; t;) {
                            for (i = l, l = []; ++p < t;) i && i[p].run();
                            p = -1, t = l.length
                        }
                        i = null, d = !1,
                            function(e) {
                                if (n === clearTimeout) return clearTimeout(e);
                                if ((n === u || !n) && clearTimeout) return n = clearTimeout, clearTimeout(e);
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
                    l.push(new m(e, t)), 1 !== l.length || d || c(h)
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
                t.addListener = a.exports.addListener, t.arch = S, t.argv = a.exports.argv, t.binding = g, t.browser = v, t.chdir = a.exports.chdir, t.cwd = a.exports.cwd, t.default = T, t.dlopen = y, t.emit = a.exports.emit, t.emitWarning = y, t.env = a.exports.env, t.execArgv = E, t.execPath = x, t.exit = y, t.features = w, t.kill = y, t.listeners = a.exports.listeners, t.memoryUsage = y, t.nextTick = a.exports.nextTick, t.off = a.exports.off, t.on = a.exports.on, t.once = a.exports.once, t.pid = 1, t.platform = P, t.prependListener = a.exports.prependListener, t.prependOnceListener = a.exports.prependOnceListener, t.removeAllListeners = a.exports.removeAllListeners, t.removeListener = a.exports.removeListener, t.title = a.exports.title, t.umask = a.exports.umask, t.uptime = y, t.uvCounters = y, t.version = a.exports.version, t.versions = a.exports.versions, e.exports = T
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
        }, r.o = function(e, t) {
            return Object.prototype.hasOwnProperty.call(e, t)
        }, r.r = function(e) {
            "u" > typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
                value: "Module"
            }), Object.defineProperty(e, "__esModule", {
                value: !0
            })
        }, r.rv = function() {
            return "1.7.12"
        }, r.ruid = "bundler=rspack@1.7.12",
        function() {
            "use strict";
            var e, t, n, i, a, o, s, u, c, l, d, p, f, h, m, b, y, v, g = window.ReactJSX,
                w = r(609),
                P = r.n(w),
                S = window.ReactDOM,
                x = window.Roblox,
                E = r.n(x),
                T = window.ReactUtilities,
                C = window.ReactRouterDOM,
                O = window.TanstackQuery,
                A = window.Roblox.ui,
                I = window.Roblox["core-scripts"].react,
                j = {
                    common: ["CommonUI.Features", "CommonUI.Controls", "Feature.RobloxSubscription"],
                    feature: "Feature.AccountSettings"
                },
                k = window.EventTracker,
                D = window.HeaderScripts,
                N = window.CoreUtilities;

            function R(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var M = function(e, t) {
                return (M = Object.setPrototypeOf || R({
                    __proto__: []
                }, Array) && function(e, t) {
                    e.__proto__ = t
                } || function(e, t) {
                    for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
                })(e, t)
            };

            function U(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                function r() {
                    this.constructor = e
                }
                M(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
            }
            var L = function() {
                return (L = Object.assign || function(e) {
                    for (var t, r = 1, n = arguments.length; r < n; r++)
                        for (var i in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
                    return e
                }).apply(this, arguments)
            };

            function _(e, t, r, n) {
                return new(r || (r = Promise))(function(i, a) {
                    function o(e) {
                        try {
                            u(n.next(e))
                        } catch (e) {
                            a(e)
                        }
                    }

                    function s(e) {
                        try {
                            u(n.throw(e))
                        } catch (e) {
                            a(e)
                        }
                    }

                    function u(e) {
                        var t;
                        e.done ? i(e.value) : (R(t = e.value, r) ? t : new r(function(e) {
                            e(t)
                        })).then(o, s)
                    }
                    u((n = n.apply(e, t || [])).next())
                })
            }

            function B(e, t) {
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
                    return function(u) {
                        var c = [s, u];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; o && (o = 0, c[0] && (a = 0)), a;) try {
                            if (r = 1, n && (i = 2 & c[0] ? n.return : c[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, c[1])).done) return i;
                            switch (n = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                                case 0:
                                case 1:
                                    i = c;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                        a.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && a.label < i[1]) {
                                        a.label = i[1], i = c;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(c);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            c = t.call(e, a)
                        } catch (e) {
                            c = [6, e], n = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function F(e, t, r) {
                if (r || 2 == arguments.length)
                    for (var n, i = 0, a = t.length; i < a; i++) !n && i in t || (n || (n = Array.prototype.slice.call(t, 0, i)), n[i] = t[i]);
                return e.concat(n || Array.prototype.slice.call(t))
            }
            "function" == typeof SuppressedError && SuppressedError;
            var Y = {
                    envName: ""
                },
                q = !1,
                H = function() {
                    try {
                        if ("u" < typeof window) return L({}, Y);
                        var e = localStorage.getItem("Roblox.MrRouterConfig");
                        if (null == e) return L({}, Y);
                        var t = JSON.parse(e);
                        if ("object" != (void 0 === t ? "undefined" : t && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) || null === t) return L({}, Y);
                        var r = L(L({}, Y), "envName" in t && "string" == typeof t.envName && {
                            envName: t.envName
                        });
                        return r.envName && !q && (q = !0, console.warn('[MrRouter] Routing to non-production environment: "'.concat(r.envName, '"'))), r
                    } catch (e) {
                        return L({}, Y)
                    }
                },
                V = "mrrouter-env",
                W = "tracestate",
                G = "traceparent",
                K = function(e) {
                    var t = e.indexOf("=");
                    return (-1 === t ? e : e.slice(0, t)).trim()
                },
                z = function(e, t) {
                    var r = "".concat(V, "=").concat(encodeURIComponent(t)),
                        n = null == e ? void 0 : e.trim(),
                        i = n ? n.split(",") : [],
                        a = i.findIndex(function(e) {
                            return K(e) === V
                        });
                    if (-1 === a) return F(F([], i.map(function(e) {
                        return e.trim()
                    }), !0), [r], !1).join(",");
                    var o = i.filter(function(e) {
                        return K(e) !== V
                    }).map(function(e) {
                        return e.trim()
                    });
                    return o.splice(a, 0, r), o.join(",")
                },
                X = function(e) {
                    var t = new Uint8Array(e);
                    return crypto.getRandomValues(t), Array.from(t, function(e) {
                        return e.toString(16).padStart(2, "0")
                    }).join("")
                },
                Q = "u" > typeof crypto && "function" == typeof crypto.randomUUID,
                $ = function() {
                    return Q ? crypto.randomUUID().replaceAll("-", "").slice(0, 32) : X(16)
                },
                J = function() {
                    return Q ? crypto.randomUUID().replaceAll("-", "").slice(0, 16) : X(8)
                },
                Z = function(e) {
                    var t = H().envName;
                    if (t.length > 0 && (e[W] = z(e[W], t), !e[G])) {
                        var r = $(),
                            n = J();
                        e[G] = "00-".concat(r, "-").concat(n, "-01")
                    }
                };

            function ee(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            r(773);
            var et, er = function(e) {
                    return e.replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/\d+/, "/number")
                },
                en = function(e, t) {
                    return !1 === t.ok && !1 === [401, 403, 404].includes(t.status) && e(Error("Network error"), {
                        tags: {
                            apiUrl: er(t.url),
                            apiStatus: null == t ? void 0 : t.status,
                            cors: !1
                        }
                    }), t
                },
                ei = function(e, t) {
                    e(Error("Network error"), {
                        tags: {
                            apiUrl: er(t),
                            cors: !0
                        }
                    })
                },
                ea = function() {
                    function e(e) {
                        this.captureException = e
                    }
                    return e.prototype.post = function(e) {
                        return _(this, void 0, void 0, function() {
                            return B(this, function(t) {
                                return [2, en(this.captureException, e.response)]
                            })
                        })
                    }, e.prototype.onError = function(e) {
                        return _(this, void 0, void 0, function() {
                            return B(this, function(t) {
                                return ei(this.captureException, e.url), [2]
                            })
                        })
                    }, e
                }(),
                eo = function(e) {
                    if (document) {
                        var t, r, n = document.getElementById("hba-frame");
                        return null === n && ((t = document.createElement("iframe")).id = "hba-frame", t.style.cssText = "position: fixed; top: 0; left: 0; width: 0%; height: 0%; z-index: -1", t.src = "https://www.".concat(e, "/hba/iframe"), r = t, n = (null == document ? void 0 : document.body) ? document.body.appendChild(r) : null), n
                    }
                    return null
                },
                es = function() {
                    var e = window.location.hostname.split(".").slice(0, -2).join(".");
                    return e.includes("create") ? "creator_hub" : e.includes("advertise") ? "ads_manager" : "creator_hub"
                },
                eu = function(e, t) {
                    try {
                        fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                            method: "POST",
                            body: JSON.stringify({
                                name: "load_time_hba_frame",
                                value: t,
                                labelValues: {
                                    origin_site: es()
                                }
                            })
                        })
                    } catch (e) {}
                },
                ec = function(e, t) {
                    try {
                        fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                            method: "POST",
                            body: JSON.stringify({
                                name: "response_time_hba_frame",
                                value: t,
                                labelValues: {
                                    origin_site: es()
                                }
                            })
                        })
                    } catch (e) {}
                },
                el = function(e, t, r) {
                    return void 0 === r && (r = 1500), new Promise(function(n, i) {
                        var a, o, s = performance.now(),
                            u = window.setTimeout(function() {
                                eu(e, performance.now() - s),
                                    function(e) {
                                        try {
                                            fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                                                method: "POST",
                                                body: JSON.stringify({
                                                    name: "event_hba_frame",
                                                    value: 1,
                                                    labelValues: {
                                                        event_type: "FrameLoadTimedOut",
                                                        origin_site: es()
                                                    }
                                                })
                                            })
                                        } catch (e) {}
                                    }(e), i(Error("Promise timed out after ".concat(r, " ms")))
                            }, r),
                            c = a = function(t) {
                                var r = t.data;
                                t.origin === "https://www.".concat(e) && "dataFromHbaFrame" === r.msg && "loaded" === r.data.type && (window.removeEventListener("message", a, !1), window.clearTimeout(u), eu(e, performance.now() - s), n())
                            };
                        window.addEventListener("message", c, !1), null == (o = t.contentWindow) || o.postMessage({
                            msg: "checkLoadedRequest"
                        }, "https://www.".concat(e))
                    })
                },
                ed = function(e, t, r, n, i, a, o) {
                    var s;
                    if (void 0 === o && (o = 100), window) {
                        var u, c = performance.now(),
                            l = window.setTimeout(function() {
                                ec(r, performance.now() - c),
                                    function(e) {
                                        try {
                                            fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                                                method: "POST",
                                                body: JSON.stringify({
                                                    name: "event_hba_frame",
                                                    value: 1,
                                                    labelValues: {
                                                        event_type: "FrameResponseTimedOut",
                                                        origin_site: es()
                                                    }
                                                })
                                            })
                                        } catch (e) {}
                                    }(r), e({
                                        url: i.url,
                                        init: i.init
                                    })
                            }, o),
                            d = u = function(t) {
                                var n = t.data,
                                    o = i.url,
                                    s = i.init;
                                if (t.origin === "https://www.".concat(r) && "dataFromHbaFrame" === n.msg && "batHeader" === n.data.type && (!n.data.identifier || n.data.identifier === a))
                                    if (!n.data.isError && n.data.batHeader) {
                                        window.clearTimeout(l), window.removeEventListener("message", u, !1), ec(r, performance.now() - c);
                                        var d = n.data.batHeader;
                                        e({
                                            url: o,
                                            init: L(L({}, s), {
                                                headers: L(L({}, s.headers), {
                                                    "x-bound-auth-token": d["x-bound-auth-token"]
                                                })
                                            })
                                        })
                                    } else window.clearTimeout(l), window.removeEventListener("message", u, !1), ec(r, performance.now() - c), e({
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
                ep = function() {
                    return crypto.randomUUID()
                },
                ef = function() {
                    function e(e, t, r) {
                        void 0 === t && (t = 1500), void 0 === r && (r = 100), this.robloxSiteDomain = e, this.hbaFrameAlreadyLoaded = !1, this.hbaFrameLoadFailed = !1, this.hbaFrame = null, this.loadTimeOut = t, this.dataTimeOut = r
                    }
                    return e.prototype.getOrCreateHbaFrame = function() {
                        return eo(this.robloxSiteDomain)
                    }, e.prototype.pre = function(e) {
                        var t = this;
                        return new Promise(function(r, n) {
                            var i = e.url,
                                a = e.init;
                            if (t.hbaFrame = t.getOrCreateHbaFrame(), null !== t.hbaFrame) {
                                var o = ep();
                                t.hbaFrameAlreadyLoaded ? ed(r, 0, t.robloxSiteDomain, t.hbaFrame, e, o, t.dataTimeOut) : t.hbaFrameLoadFailed ? r({
                                    url: i,
                                    init: a
                                }) : el(t.robloxSiteDomain, t.hbaFrame, t.loadTimeOut).then(function() {
                                    t.hbaFrame ? (t.hbaFrameAlreadyLoaded = !0, ed(r, 0, t.robloxSiteDomain, t.hbaFrame, e, o, t.dataTimeOut)) : r({
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
            (t = et || (et = {})).UNKNOWN = "unknown", t.INVALIDATED = "invalidated", t.ABANDONED = "abandoned", t.LOADFAILED = "loadfailed";
            var eh = function(e) {
                    function t(t) {
                        var r = e.call(this, "challenge error for challenge kind ".concat(t.kind)) || this;
                        return r.parameters = t, r
                    }
                    return U(t, e), t.prototype.match = function(e) {
                        return this.parameters.kind === e.parameters.kind && JSON.stringify(this.parameters.data) === JSON.stringify(e.parameters.data)
                    }, t.prototype.matchAbandoned = function(e) {
                        return this.match(e) && e.parameters.kind === et.ABANDONED
                    }, t
                }(Error),
                em = "rblx-challenge-id",
                eb = "rblx-challenge-type",
                ey = "rblx-challenge-metadata",
                ev = function(e, t) {
                    return 403 === e.status && e.headers.has(em) && e.headers.has(eb) && e.headers.has(ey) && "iframe" === t
                },
                eg = function(e) {
                    var t, r, n, i, a, o, s, u, c, l = e.url,
                        d = e.request,
                        p = e.response,
                        f = e.robloxSiteDomain,
                        h = (a = new URLSearchParams([
                            ["challenge-type", "generic"],
                            ["dark-mode", "true"],
                            ["barista-mode", "true"],
                            ["generic-challenge-type", null != (t = p.headers.get(eb)) ? t : ""],
                            ["generic-challenge-id", null != (r = p.headers.get(em)) ? r : ""],
                            ["challenge-metadata-json", null != (n = p.headers.get(ey)) ? n : ""],
                            ["origin", null != (i = window.location.hostname.split(".").slice(0, -2).join(".")) ? i : ""]
                        ]), o = new URL("https://www.".concat(f, "/challenge/cdn/hybrid?").concat(a.toString())), (s = document.createElement("iframe")).id = "challenge-frame", s.allowFullscreen = !0, s.setAttribute("allowtransparency", "true"), s.setAttribute("allow", "publickey-credentials-get;publickey-credentials-create"), s.style.cssText = "position: fixed; top: 0; left: 0; width: 100%; height: 100%; visibility: hidden; color-scheme: normal; border: none; z-index: 2147483647;", s.src = o.toString(), s.onload = function() {
                            s.style.visibility = "visible"
                        }, u = s, document && document.body ? document.body.appendChild(u) : null);
                    return new Promise(function(e, t) {
                        window && h && (c = function(r) {
                            var n, i, a, o, s, u, c, f, h, m, b;
                            if (r.data && r.data.genericChallengeResponse) switch (r.data.genericChallengeResponse.type) {
                                case "challengeAbandoned":
                                    t(new eh({
                                        kind: et.ABANDONED,
                                        data: {
                                            challengeType: null != (n = p.headers.get(eb)) ? n : ""
                                        }
                                    }));
                                    break;
                                case "challengeDisplayed":
                                    break;
                                case "challengeCompleted":
                                    (c = r.data.genericChallengeResponse.data).challengeType && c.metadata ? e((f = c.metadata, fetch(l, L(L({}, d), {
                                        headers: L(L({}, d.headers), ((h = {})[em] = null != (m = p.headers.get(em)) ? m : "", h[ey] = btoa(JSON.stringify(f)), h[eb] = null != (b = p.headers.get(eb)) ? b : "", h))
                                    })))) : t(new eh({
                                        kind: et.UNKNOWN,
                                        data: {
                                            challengeType: null != (i = p.headers.get(eb)) ? i : ""
                                        }
                                    }));
                                    break;
                                case "challengeInvalidated":
                                    t((c = r.data.genericChallengeResponse.data) && c.challengeType && c.metadata ? new eh({
                                        kind: et.INVALIDATED,
                                        data: c
                                    }) : new eh({
                                        kind: et.INVALIDATED,
                                        data: {
                                            challengeType: null != (a = p.headers.get(eb)) ? a : ""
                                        }
                                    }));
                                    break;
                                case "challengeParsed":
                                    !1 === (c = r.data.genericChallengeResponse.data).parsed && t(new eh({
                                        kind: et.UNKNOWN,
                                        data: {
                                            challengeType: null != (o = p.headers.get(eb)) ? o : ""
                                        }
                                    }));
                                    break;
                                case "challengeInitialized":
                                    !1 === (c = r.data.genericChallengeResponse.data).initialized && t(new eh({
                                        kind: et.UNKNOWN,
                                        data: {
                                            challengeType: null != (s = p.headers.get(eb)) ? s : ""
                                        }
                                    }));
                                    break;
                                case "challengePageLoaded":
                                    !1 === (c = r.data.genericChallengeResponse.data).pageLoaded && t(new eh({
                                        kind: et.LOADFAILED,
                                        data: {
                                            challengeType: null != (u = p.headers.get(eb)) ? u : ""
                                        }
                                    }))
                            }
                        }, window.addEventListener("message", c, !1))
                    }).finally(function() {
                        null == h || h.remove(), c && window.removeEventListener("message", c, !1)
                    })
                },
                ew = function() {
                    function e(e, t) {
                        void 0 === t && (t = "iframe"), this.robloxSiteDomain = e, this.genericChallengeMiddlewareType = t
                    }
                    return e.prototype.post = function(e) {
                        var t = e.url,
                            r = e.init,
                            n = e.response;
                        return ev(n, this.genericChallengeMiddlewareType) ? eg({
                            url: t,
                            request: r,
                            response: n,
                            robloxSiteDomain: this.robloxSiteDomain
                        }) : Promise.resolve(n)
                    }, e
                }(),
                eP = function(e) {
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
                eS = function() {
                    function e(e) {
                        this.unifiedLogger = e
                    }
                    return e.prototype.post = function(e) {
                        return this.unifiedLogger.logApiVitalsEvent(eP({
                            elapsedTime: e.elapsedTime,
                            url: e.url,
                            status: e.response.status,
                            schemaPath: e.schemaPath
                        })), Promise.resolve(e.response)
                    }, e
                }(),
                ex = "x-csrf-token",
                eE = ["POST", "PATCH", "DELETE", "PUT"],
                eT = function() {
                    var e, t = "";
                    try {
                        "u" > typeof window && (t = null != (e = localStorage.getItem(ex)) ? e : "")
                    } catch (e) {
                        console.warn("Error reading localStorage key “".concat(ex, "”:"), e)
                    }
                    return t
                },
                eC = eT(),
                eO = function(e) {
                    try {
                        eC = e, "u" > typeof window && localStorage.setItem(ex, e)
                    } catch (e) {
                        console.warn("Error setting localStorage key “".concat(ex, "”:"), e)
                    }
                },
                eA = function() {
                    function e() {
                        this.currentToken = eT()
                    }
                    return e.prototype.pre = function(e) {
                        var t, r = e.url,
                            n = e.init,
                            i = this.currentToken;
                        return n.headers && "object" == ((t = n.headers) && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) && ex in n.headers && (i = n.headers[ex]) && (this.currentToken = i, eO(i)), n.method && eE.includes(n.method) ? Promise.resolve({
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
                            a = i.headers.get(ex);
                        return 403 === i.status && i.headers.has(ex) && null !== a ? (this.currentToken = a, eO(a), t(r, this.prepareRequestInit(n))) : Promise.resolve(i)
                    }, e.prototype.prepareRequestInit = function(e) {
                        var t;
                        return L(L({}, e), {
                            headers: L(L({}, e.headers), ((t = {})[ex] = this.currentToken, t))
                        })
                    }, e
                }(),
                eI = [],
                ej = function(e) {
                    eI = eI.filter(function(t) {
                        return t !== e
                    })
                },
                ek = function(e) {
                    var t = e.url;
                    503 === e.status && eI.forEach(function(e) {
                        return e(t)
                    })
                },
                eD = function() {
                    function e() {}
                    return e.prototype.subscribe = function(e) {
                        return eI.push(e),
                            function() {
                                return ej(e)
                            }
                    }, e.prototype.unsubscribe = function(e) {
                        return ej(e)
                    }, e.prototype.post = function(e) {
                        var t = e.response;
                        return ek(t), Promise.resolve(t)
                    }, e
                }(),
                eN = function() {
                    function e() {}
                    return e.prototype.pre = function(e) {
                        var t = e.url,
                            r = e.init;
                        if (!H().envName) return Promise.resolve({
                            url: t,
                            init: r
                        });
                        var n = L({}, r.headers);
                        return Z(n), Promise.resolve({
                            url: t,
                            init: L(L({}, r), {
                                headers: n
                            })
                        })
                    }, e
                }(),
                eR = new eA,
                eM = new eD,
                eU = [function(e) {
                    return e.captureException ? new ea(e.captureException) : void 0
                }, function(e) {
                    return e.robloxSiteDomain && e.enableBoundAuthToken ? new ef(e.robloxSiteDomain, e.boundAuthTokenLoadTimeout, e.boundAuthTokenDataTimeout) : void 0
                }, function(e) {
                    return e.robloxSiteDomain ? new ew(e.robloxSiteDomain, e.genericChallengeMiddlewareType) : void 0
                }, function(e) {
                    return e.unifiedLogger ? new eS(e.unifiedLogger) : void 0
                }, function() {
                    return eR
                }, function() {
                    return eM
                }, function(e) {
                    return e.enableMrRouter ? new eN : void 0
                }],
                eL = function() {
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
                                        if (ee(n, Array)) {
                                            var o = n.map(function(e) {
                                                return encodeURIComponent(String(e))
                                            }).join("&".concat(encodeURIComponent(a), "="));
                                            return "".concat(encodeURIComponent(a), "=").concat(o)
                                        }
                                        return ee(n, Set) ? t(r, Array.from(n), i) : ee(n, Date) ? "".concat(encodeURIComponent(a), "=").concat(encodeURIComponent(n.toISOString())) : ee(n, Object) ? e(n, a) : "".concat(encodeURIComponent(a), "=").concat(encodeURIComponent(String(n)))
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
                                return _(e, void 0, void 0, function() {
                                    return B(this, function(e) {
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
                e_ = new eL,
                eB = function() {
                    function e(e) {
                        void 0 === e && (e = e_);
                        var t = this;
                        this.configuration = e, this.fetchApi = function(e, r, n) {
                            return _(t, void 0, void 0, function() {
                                var t, i, a, o, s, u, c, l, d, p, f, h, m, b = this;
                                return B(this, function(y) {
                                    switch (y.label) {
                                        case 0:
                                            t = function(e, t) {
                                                return b.fetchApi(e, t, n)
                                            }, i = {
                                                url: e,
                                                init: r
                                            }, a = 0, o = this.middleware, y.label = 1;
                                        case 1:
                                            return a < o.length ? (m = o[a]).pre ? [4, m.pre(L({
                                                fetch: t
                                            }, i))] : [3, 3] : [3, 4];
                                        case 2:
                                            i = y.sent() || i, y.label = 3;
                                        case 3:
                                            return a++, [3, 1];
                                        case 4:
                                            s = void 0, u = performance.now(), y.label = 5;
                                        case 5:
                                            return y.trys.push([5, 7, , 12]), [4, (this.configuration.fetchApi || fetch)(i.url, i.init)];
                                        case 6:
                                            return s = y.sent(), c = performance.now(), [3, 12];
                                        case 7:
                                            l = y.sent(), c = performance.now(), d = 0, p = this.middleware, y.label = 8;
                                        case 8:
                                            return d < p.length ? (m = p[d]).onError ? [4, m.onError({
                                                fetch: t,
                                                url: i.url,
                                                init: i.init,
                                                error: l,
                                                response: s ? s.clone() : void 0
                                            })] : [3, 10] : [3, 11];
                                        case 9:
                                            s = y.sent() || s, y.label = 10;
                                        case 10:
                                            return d++, [3, 8];
                                        case 11:
                                            if (void 0 === s) throw ee(l, Error) ? new eY(l, "The request failed and the interceptors did not return an alternative response") : l;
                                            return [3, 12];
                                        case 12:
                                            f = 0, h = this.middleware, y.label = 13;
                                        case 13:
                                            return f < h.length ? (m = h[f]).post ? [4, m.post({
                                                fetch: t,
                                                url: i.url,
                                                init: i.init,
                                                response: s.clone(),
                                                elapsedTime: c - u,
                                                schemaPath: n
                                            })] : [3, 15] : [3, 16];
                                        case 14:
                                            s = y.sent() || s, y.label = 15;
                                        case 15:
                                            return f++, [3, 13];
                                        case 16:
                                            return [2, s]
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
                        return _(this, void 0, void 0, function() {
                            var r, n, i, a;
                            return B(this, function(o) {
                                switch (o.label) {
                                    case 0:
                                        return [4, this.createFetchParams(e, t)];
                                    case 1:
                                        return n = (r = o.sent()).url, i = r.init, [4, this.fetchApi(n, i, e.schemaPath)];
                                    case 2:
                                        if ((a = o.sent()) && a.status >= 200 && a.status < 300) return [2, a];
                                        throw new eF(a, "Response from ".concat(a.url, " returned an error code ").concat(a.status))
                                }
                            })
                        })
                    }, e.prototype.createFetchParams = function(e, t) {
                        return _(this, void 0, void 0, function() {
                            var r, n, i, a, o, s, u, c = this;
                            return B(this, function(l) {
                                var d, p;
                                switch (l.label) {
                                    case 0:
                                        return r = this.configuration.basePath + e.path, void 0 !== e.query && 0 !== Object.keys(e.query).length && (r += "?" + this.configuration.queryParamsStringify(e.query)), Object.keys(n = Object.assign({}, this.configuration.headers, e.headers)).forEach(function(e) {
                                            return void 0 === n[e] ? delete n[e] : {}
                                        }), i = "function" == typeof t ? t : function() {
                                            return _(c, void 0, void 0, function() {
                                                return B(this, function(e) {
                                                    return [2, t]
                                                })
                                            })
                                        }, a = {
                                            method: e.method,
                                            headers: n,
                                            body: e.body,
                                            credentials: this.configuration.credentials
                                        }, s = [L({}, a)], [4, i({
                                            init: a,
                                            context: e
                                        })];
                                    case 1:
                                        return o = L.apply(void 0, s.concat([l.sent()])), u = L(L({}, o), {
                                            body: (d = o.body, "u" > typeof FormData && ee(d, FormData) || ee(o.body, URLSearchParams) || (p = o.body, "u" > typeof Blob && ee(p, Blob)) ? o.body : JSON.stringify(o.body))
                                        }), [2, {
                                            url: r,
                                            init: u
                                        }]
                                }
                            })
                        })
                    }, e.prototype.clone = function() {
                        var e = new(0, this.constructor)(this.configuration);
                        return e.middleware = this.middleware.slice(), e
                    }, e.jsonRegex = RegExp("^(:?application/json|[^;/ 	]+/[^;/ 	]+[+]json)[ 	]*(:?;.*)?$", "i"), e
                }(),
                eF = function(e) {
                    function t(t, r) {
                        var n = e.call(this, r) || this;
                        return n.response = t, n.name = "ResponseError", n
                    }
                    return U(t, e), t
                }(Error),
                eY = function(e) {
                    function t(t, r) {
                        var n = e.call(this, r) || this;
                        return n.cause = t, n.name = "FetchError", n
                    }
                    return U(t, e), t
                }(Error),
                eq = function(e) {
                    function t(t, r) {
                        var n = e.call(this, r) || this;
                        return n.field = t, n.name = "RequiredError", n
                    }
                    return U(t, e), t
                }(Error);

            function eH(e, t) {
                return null != e[t]
            }
            var eV = function() {
                    function e(e, t) {
                        void 0 === t && (t = function(e) {
                            return e
                        }), this.raw = e, this.transformer = t
                    }
                    return e.prototype.value = function() {
                        return _(this, void 0, void 0, function() {
                            var e;
                            return B(this, function(t) {
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
                eW = ((function(e) {
                    this.raw = e
                }).prototype.value = function() {
                    return _(this, void 0, void 0, function() {
                        return B(this, function(e) {
                            return [2, void 0]
                        })
                    })
                }, (function(e) {
                    this.raw = e
                }).prototype.value = function() {
                    return _(this, void 0, void 0, function() {
                        return B(this, function(e) {
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
                    return _(this, void 0, void 0, function() {
                        return B(this, function(e) {
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
                        var r, n = L({}, t),
                            i = n.middleware || [];
                        return i.unshift.apply(i, (r = t, eU.map(function(e) {
                            return e(r)
                        }).filter(function(e) {
                            return e
                        }))), n.middleware = i, e.call(this, n) || this
                    }
                    return U(t, e), t
                }(eL));

            function eG(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var eK = function(e, t) {
                return (eK = Object.setPrototypeOf || eG({
                    __proto__: []
                }, Array) && function(e, t) {
                    e.__proto__ = t
                } || function(e, t) {
                    for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
                })(e, t)
            };

            function ez(e, t, r, n) {
                return new(r || (r = Promise))(function(i, a) {
                    function o(e) {
                        try {
                            u(n.next(e))
                        } catch (e) {
                            a(e)
                        }
                    }

                    function s(e) {
                        try {
                            u(n.throw(e))
                        } catch (e) {
                            a(e)
                        }
                    }

                    function u(e) {
                        var t;
                        e.done ? i(e.value) : (eG(t = e.value, r) ? t : new r(function(e) {
                            e(t)
                        })).then(o, s)
                    }
                    u((n = n.apply(e, t || [])).next())
                })
            }

            function eX(e, t) {
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
                    return function(u) {
                        var c = [s, u];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; o && (o = 0, c[0] && (a = 0)), a;) try {
                            if (r = 1, n && (i = 2 & c[0] ? n.return : c[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, c[1])).done) return i;
                            switch (n = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                                case 0:
                                case 1:
                                    i = c;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                        a.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && a.label < i[1]) {
                                        a.label = i[1], i = c;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(c);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            c = t.call(e, a)
                        } catch (e) {
                            c = [6, e], n = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function eQ(e) {
                return e
            }
            "function" == typeof SuppressedError && SuppressedError;

            function e$(e, t) {
                return null == e ? e : {
                    currencyCode: e.currencyCode,
                    units: e.units,
                    nanos: e.nanos
                }
            }

            function eJ(e) {
                return e
            }

            function eZ(e) {
                var t, r;
                return null == (t = e) ? t : {
                    offerType: eH(t, "offerType") ? t.offerType : void 0,
                    freeTrialOffer: eH(t, "freeTrialOffer") ? null == (r = t.freeTrialOffer) ? r : {
                        periodType: r.periodType,
                        duration: r.duration,
                        estimatedTrialEndDate: eH(r, "estimatedTrialEndDate") ? null === r.estimatedTrialEndDate ? null : new Date(r.estimatedTrialEndDate) : void 0
                    } : void 0
                }
            }
            var e0 = "CurrencySubscription",
                e1 = "Blackbird";

            function e2(e) {
                var t;
                return null == (t = e) ? t : {
                    type: t.type,
                    id: t.id
                }
            }

            function e3(e) {
                var t;
                return null == (t = e) ? t : {
                    tierId: t.tierId,
                    periodIndex: t.periodIndex,
                    discountPercent: t.discountPercent
                }
            }

            function e4(e) {
                var t, r, n, i, a, o, s, u, c;
                return null == (t = e) ? t : {
                    productKey: e2(t.productKey),
                    periodType: t.periodType,
                    periodCount: t.periodCount,
                    localizedPrice: e$(t.localizedPrice),
                    localizedPriceDisplayString: t.localizedPriceDisplayString,
                    localizedStrikethroughPrice: e$(t.localizedStrikethroughPrice),
                    localizedStrikethroughPriceDisplayString: t.localizedStrikethroughPriceDisplayString,
                    productTypeDetails: null == (r = t.productTypeDetails) ? r : {
                        currencySubscriptionProductDetails: eH(r, "currencySubscriptionProductDetails") ? null == (n = r.currencySubscriptionProductDetails) ? n : {
                            currencyType: n.currencyType,
                            entitledAmountMicros: n.entitledAmountMicros
                        } : void 0,
                        developerSubscriptionProductDetails: eH(r, "developerSubscriptionProductDetails") ? null == (i = r.developerSubscriptionProductDetails) ? i : {
                            universeId: i.universeId,
                            imageAssetId: i.imageAssetId,
                            localizedName: i.localizedName,
                            localizedDescription: i.localizedDescription
                        } : void 0,
                        robloxSubscriptionProductDetails: eH(r, "robloxSubscriptionProductDetails") ? null == (a = r.robloxSubscriptionProductDetails) ? a : {
                            featureConfig: null == (o = a.featureConfig) ? o : {
                                virtualTransactionDiscounts: null === o.virtualTransactionDiscounts ? null : o.virtualTransactionDiscounts.map(e3),
                                isRobuxTransferEnabled: o.isRobuxTransferEnabled,
                                isTradingEnabled: o.isTradingEnabled,
                                isUgcPublishingEnabled: o.isUgcPublishingEnabled,
                                privateServerDiscounts: null === o.privateServerDiscounts ? null : o.privateServerDiscounts.map(e3),
                                currencySubscriptionConfig: null == (s = o.currencySubscriptionConfig) ? s : {
                                    currencyType: s.currencyType,
                                    entitledAmountMicros: s.entitledAmountMicros
                                },
                                coreContentPublishingConfig: null == (u = o.coreContentPublishingConfig) ? u : {
                                    minimumPeriodIndex: u.minimumPeriodIndex
                                },
                                isAppThemesEnabled: o.isAppThemesEnabled,
                                isProfileFrameEnabled: o.isProfileFrameEnabled,
                                isAiBackgroundEnabled: o.isAiBackgroundEnabled,
                                robuxTransferConfig: null == (c = o.robuxTransferConfig) ? c : {
                                    isElevatedLimitEnabled: c.isElevatedLimitEnabled
                                }
                            }
                        } : void 0
                    },
                    eligibleOffers: t.eligibleOffers.map(eZ)
                }
            }

            function e6(e) {
                var t;
                return null == (t = e) ? t : {
                    referralId: t.referralId,
                    senderUserId: t.senderUserId,
                    status: t.status,
                    createdTimestampMs: t.createdTimestampMs
                }
            }

            function e5(e) {
                var t, r, n, i, a, o, s;
                return null == (t = e) ? t : {
                    productKey: e2(t.productKey),
                    periodType: t.periodType,
                    displayPrice: e$(t.displayPrice),
                    activationTimestampMs: t.activationTimestampMs,
                    expirationTimestampMs: t.expirationTimestampMs,
                    nextRenewalTimestampMs: t.nextRenewalTimestampMs,
                    paymentProvider: eJ(t.paymentProvider),
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
                    activeOffers: t.activeOffers.map(eZ),
                    productTypeMembershipDetails: null == (i = t.productTypeMembershipDetails) ? i : {
                        robloxSubscriptionMembershipDetails: eH(i, "robloxSubscriptionMembershipDetails") ? null == (a = i.robloxSubscriptionMembershipDetails) ? a : {
                            features: null == (o = a.features) ? o : {
                                productType: o.productType,
                                virtualTransactionDiscountTierId: o.virtualTransactionDiscountTierId,
                                isRobuxTransferEnabled: o.isRobuxTransferEnabled,
                                isTradingEnabled: o.isTradingEnabled,
                                isUgcPublishingEnabled: o.isUgcPublishingEnabled,
                                privateServerDiscountTierId: o.privateServerDiscountTierId,
                                isCoreContentPublishingEnabled: o.isCoreContentPublishingEnabled,
                                isAppThemesEnabled: o.isAppThemesEnabled,
                                isProfileFrameEnabled: o.isProfileFrameEnabled,
                                isAiBackgroundEnabled: o.isAiBackgroundEnabled,
                                isRobuxTransferElevatedLimitEnabled: o.isRobuxTransferElevatedLimitEnabled
                            },
                            currencySubscriptionBenefit: null == (s = a.currencySubscriptionBenefit) ? s : {
                                currencyType: s.currencyType,
                                entitledAmountMicrosPerGrantingPeriod: s.entitledAmountMicrosPerGrantingPeriod,
                                grantingPeriodType: s.grantingPeriodType
                            }
                        } : void 0
                    },
                    productInfo: e4(t.productInfo)
                }
            }
            var e8 = function(e) {
                    function t() {
                        return null !== e && e.apply(this, arguments) || this
                    }
                    return function(e, t) {
                        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                        function r() {
                            this.constructor = e
                        }
                        eK(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
                    }(t, e), t.prototype.subscriptionsV2CheckSubscriptionReferralEligibilityRaw = function(e, t) {
                        return ez(this, void 0, void 0, function() {
                            var r, n;
                            return eX(this, function(i) {
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
                                        return [2, new eV(i.sent(), function(e) {
                                            return null == e ? e : {
                                                eligibility: e.eligibility
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2CheckSubscriptionReferralEligibility = function() {
                        return ez(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), eX(this, function(r) {
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
                        return ez(this, void 0, void 0, function() {
                            var r, n;
                            return eX(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new eq("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2ClaimSubscriptionProduct.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new eq("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2ClaimSubscriptionProduct.");
                                        return r = {}, void 0 !== e.grantType && (r.grantType = e.grantType), n = {}, [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/claim".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                            schemaPath: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/claim",
                                            method: "POST",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eV(i.sent())]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ClaimSubscriptionProduct = function(e, t) {
                        return ez(this, void 0, void 0, function() {
                            return eX(this, function(r) {
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
                        return ez(this, void 0, void 0, function() {
                            var r, n;
                            return eX(this, function(i) {
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
                                        return [2, new eV(i.sent(), function(e) {
                                            return null == e ? e : {
                                                referralId: e.referralId
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2CreateSubscriptionReferral = function() {
                        return ez(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), eX(this, function(r) {
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
                        return ez(this, void 0, void 0, function() {
                            var t, r;
                            return eX(this, function(n) {
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
                                        return [2, new eV(n.sent(), function(e) {
                                            return null == e ? e : {
                                                deepLinkUrl: e.deepLinkUrl
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2CreateSubscriptionReferralLink = function(e) {
                        return ez(this, void 0, void 0, function() {
                            return eX(this, function(t) {
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
                        return ez(this, void 0, void 0, function() {
                            var r, n;
                            return eX(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new eq("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetProductDisplayPrice.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new eq("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetProductDisplayPrice.");
                                        return r = {}, n = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (n["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/display-price".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                            schemaPath: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/display-price",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eV(i.sent(), function(e) {
                                            return null == e ? e : {
                                                displayPrice: e$(e.displayPrice)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2GetProductDisplayPrice = function(e, t) {
                        return ez(this, void 0, void 0, function() {
                            return eX(this, function(r) {
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
                        return ez(this, void 0, void 0, function() {
                            var r, n;
                            return eX(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new eq("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetProductPaymentMetadata.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new eq("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetProductPaymentMetadata.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/payment-metadata".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                            schemaPath: "/v2/products/{subscriptionProductType}/{subscriptionProductId}/payment-metadata",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eV(i.sent(), function(e) {
                                            return null == e ? e : {
                                                paymentMethods: e.paymentMethods.map(eQ),
                                                paymentProviders: e.paymentProviders.map(eJ)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2GetProductPaymentMetadata = function(e, t) {
                        return ez(this, void 0, void 0, function() {
                            return eX(this, function(r) {
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
                        return ez(this, void 0, void 0, function() {
                            var r, n;
                            return eX(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new eq("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2GetSubscriptionProductInfo.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new eq("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2GetSubscriptionProductInfo.");
                                        return r = {}, n = {}, [4, this.request({
                                            path: "/v2/products/{subscriptionProductType}/{subscriptionProductId}".replace("{".concat("subscriptionProductType", "}"), encodeURIComponent(String(e.subscriptionProductType))).replace("{".concat("subscriptionProductId", "}"), encodeURIComponent(String(e.subscriptionProductId))),
                                            schemaPath: "/v2/products/{subscriptionProductType}/{subscriptionProductId}",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eV(i.sent(), function(e) {
                                            return null == e ? e : {
                                                subscriptionProductInfo: e4(e.subscriptionProductInfo)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2GetSubscriptionProductInfo = function(e, t) {
                        return ez(this, void 0, void 0, function() {
                            return eX(this, function(r) {
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
                        return ez(this, void 0, void 0, function() {
                            var r, n;
                            return eX(this, function(i) {
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
                                        return [2, new eV(i.sent(), function(e) {
                                            return null == e ? e : {
                                                productKeys: e.productKeys.map(e2),
                                                products: e.products.map(e4)
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ListAvailableSubscriptionProducts = function() {
                        return ez(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), eX(this, function(r) {
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
                        return ez(this, void 0, void 0, function() {
                            var r, n;
                            return eX(this, function(i) {
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
                                        return [2, new eV(i.sent(), function(e) {
                                            return null == e ? e : {
                                                referrals: e.referrals.map(e6),
                                                nextCursor: e.nextCursor,
                                                hasMore: e.hasMore
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ListSubscriptionReferrals = function() {
                        return ez(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), eX(this, function(r) {
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
                        return ez(this, void 0, void 0, function() {
                            var r, n;
                            return eX(this, function(i) {
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
                                        return [2, new eV(i.sent(), function(e) {
                                            return null == e ? e : {
                                                subscriptions: e.subscriptions.map(e5),
                                                hasMore: e.hasMore,
                                                cursor: e.cursor
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.subscriptionsV2ListSubscriptions = function() {
                        return ez(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), eX(this, function(r) {
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
                        return ez(this, void 0, void 0, function() {
                            var r, n;
                            return eX(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        if (null === e.subscriptionProductType || void 0 === e.subscriptionProductType) throw new eq("subscriptionProductType", "Required parameter requestParameters.subscriptionProductType was null or undefined when calling subscriptionsV2PreparePurchaseV2.");
                                        if (null === e.subscriptionProductId || void 0 === e.subscriptionProductId) throw new eq("subscriptionProductId", "Required parameter requestParameters.subscriptionProductId was null or undefined when calling subscriptionsV2PreparePurchaseV2.");
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
                                        return [2, new eV(i.sent(), function(e) {
                                            var t, r, n, i, a, o;
                                            return null == e ? e : {
                                                paymentProvider: eJ(e.paymentProvider),
                                                providerPurchasePayload: null == (t = e.providerPurchasePayload) ? t : {
                                                    stripePurchasePayload: eH(t, "stripePurchasePayload") ? null == (r = t.stripePurchasePayload) ? r : {
                                                        checkoutUrl: r.checkoutUrl
                                                    } : void 0,
                                                    appleAppStorePurchasePayload: eH(t, "appleAppStorePurchasePayload") ? null == (n = t.appleAppStorePurchasePayload) ? n : {
                                                        appAccountToken: n.appAccountToken,
                                                        partnerBillingJwtToken: n.partnerBillingJwtToken,
                                                        partnerBillingGenericProductId: n.partnerBillingGenericProductId
                                                    } : void 0,
                                                    googlePlayStorePurchasePayload: eH(t, "googlePlayStorePurchasePayload") ? null == (i = t.googlePlayStorePurchasePayload) ? i : {
                                                        providerProductId: i.providerProductId,
                                                        providerProductType: i.providerProductType,
                                                        chargeRequestId: i.chargeRequestId,
                                                        offerId: eH(i, "offerId") ? i.offerId : void 0
                                                    } : void 0,
                                                    creditBalancePurchasePayload: eH(t, "creditBalancePurchasePayload") ? null == (a = t.creditBalancePurchasePayload) ? a : {
                                                        checkoutUrl: a.checkoutUrl,
                                                        checkoutToken: eH(a, "checkoutToken") ? a.checkoutToken : void 0,
                                                        robloxManagedTax: eH(a, "robloxManagedTax") ? a.robloxManagedTax : void 0,
                                                        requiresBillingAddress: eH(a, "requiresBillingAddress") ? a.requiresBillingAddress : void 0,
                                                        chargeRequestId: eH(a, "chargeRequestId") ? a.chargeRequestId : void 0,
                                                        baseAmount: eH(a, "baseAmount") ? a.baseAmount : void 0,
                                                        taxAmount: eH(a, "taxAmount") ? a.taxAmount : void 0,
                                                        totalAmount: eH(a, "totalAmount") ? a.totalAmount : void 0,
                                                        currencyCode: eH(a, "currencyCode") ? a.currencyCode : void 0
                                                    } : void 0,
                                                    braintreePurchasePayload: eH(t, "braintreePurchasePayload") ? null == (o = t.braintreePurchasePayload) ? o : {
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
                        return ez(this, void 0, void 0, function() {
                            return eX(this, function(r) {
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
                }(eB),
                e7 = ((n = {}).ANDROID_APP = "isAndroidApp", n.AMAZON_APP = "isAmazonApp", n.IOS_APP = "isIosApp", n.UWP_APP = "isUwpApp", n.XBOX_APP = "isXboxApp", n.UNIVERSAL_APP = "isUniversalApp", n.DESKTOP = "isDesktop", n),
                e9 = ((i = {}).SUBSCRIPTION = "Subscription", i.PRIVATE_SERVER = "PrivateServer", i),
                te = ((a = {}).INVALID = "Invalid", a.MONTH = "Month", a.YEAR = "Year", a),
                tt = ((o = {}).INVALID = "Invalid", o.DESKTOP = "Desktop", o.APPLE = "Apple", o.GOOGLE = "Google", o.INTERNAL = "Internal", o),
                tr = ((s = {})[s.INVALID = 0] = "INVALID", s[s.UNKNOWN = 1] = "UNKNOWN", s[s.INVALID_PRODUCT = 2] = "INVALID_PRODUCT", s[s.PRODUCT_NOT_FOR_SALE = 3] = "PRODUCT_NOT_FOR_SALE", s[s.USER_ALREADY_SUBSCRIBED = 4] = "USER_ALREADY_SUBSCRIBED", s[s.SAVED_CC_REQUIRED = 5] = "SAVED_CC_REQUIRED", s[s.VPC_REQUIRED = 6] = "VPC_REQUIRED", s[s.VPC_PENDING_APPROVAL = 7] = "VPC_PENDING_APPROVAL", s[s.INVALID_INPUT = 8] = "INVALID_INPUT", s[s.PURCHASE_PLATFORM_NOT_SUPPORTED = 9] = "PURCHASE_PLATFORM_NOT_SUPPORTED", s[s.INVALID_SALE_LOCATION = 10] = "INVALID_SALE_LOCATION", s[s.USER_HAS_SPEND_LIMIT_SET = 11] = "USER_HAS_SPEND_LIMIT_SET", s[s.RESTRICTED_USER = 12] = "RESTRICTED_USER", s[s.UNSUPPORTED_LOCALE = 13] = "UNSUPPORTED_LOCALE", s[s.UNAUTHORIZED = 14] = "UNAUTHORIZED", s[s.EXCEED_PARENTAL_SPEND_LIMIT = 15] = "EXCEED_PARENTAL_SPEND_LIMIT", s),
                tn = ((u = {}).INVALID = "Invalid", u.STRIPE = "Stripe", u.APPLEAPPSTORE = "AppleAppStore", u.GOOGLEPLAYSTORE = "GooglePlayStore", u.CREDITBALANCE = "CreditBalance", u.BRAINTREE = "Braintree", u),
                ti = ((c = {}).CANCEL = "cancel", c.RESUBSCRIBE = "resubscribe", c),
                ta = x.EnvironmentUrls.apiGatewayUrl,
                to = x.EnvironmentUrls.premiumFeaturesApi,
                ts = {
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
                            url: "".concat(ta, "/v1/subscriptions/active-subscription-products"),
                            withCredentials: !0
                        },
                        getSubscriptionStatuses: function(e) {
                            return {
                                url: "".concat(ta, "/v1/subscriptions/statuses?").concat(e.map(function(e) {
                                    return "subscriptionProductTargetKeys=".concat(e)
                                }).join("&")),
                                withCredentials: !0
                            }
                        },
                        getSubscriptionMetadata: {
                            url: "".concat(ta, "/v1/subscriptions/metadata"),
                            withCredentials: !0
                        },
                        getSubscriptionPaymentMethods: function(e) {
                            return {
                                url: "".concat(ta, "/v1/subscriptions/payment-methods/").concat(e),
                                withCredentials: !0
                            }
                        },
                        purchaseSubscription: function(e) {
                            return {
                                url: "".concat(ta, "/v1/subscriptions/prepare-purchase/").concat(e, "/web"),
                                withCredentials: !0
                            }
                        },
                        purchaseWithRobux: function(e) {
                            return {
                                url: "".concat(ta, "/v1/subscriptions/purchase-with-robux/").concat(e),
                                withCredentials: !0
                            }
                        },
                        getUserPremiumSubscription: function(e) {
                            return {
                                url: "".concat(to, "/v1/users/").concat(e, "/subscriptions/details"),
                                withCredentials: !0
                            }
                        },
                        getUserSubscriptions: {
                            url: "".concat(ta, "/v1/subscriptions/user"),
                            withCredentials: !0
                        },
                        cancelSubscription: function(e) {
                            return {
                                url: "".concat(ta, "/v1/subscriptions/").concat(e, "/cancel"),
                                withCredentials: !0
                            }
                        },
                        cancelPremiumSubscription: function(e) {
                            return {
                                url: "".concat(to, "/v1/users/").concat(e, "/subscriptions/cancel"),
                                withCredentials: !0
                            }
                        },
                        dismissSubscriptionNotification: function(e) {
                            return {
                                url: "".concat(ta, "/v1/subscriptions/").concat(e, "/dismiss-notification"),
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
                                url: "".concat(ta, "/payments-gateway/v1/payment-profile/by-provider-id/").concat(tn.STRIPE, "/").concat(e),
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
                                url: "".concat(ta, "/payments-gateway/v1/payment-profile/").concat(e),
                                withCredentials: !0
                            }
                        },
                        submitSafetyEvent: {
                            url: "".concat(ta, "/abuse-reporting/v1/safety-event"),
                            retryable: !0,
                            withCredentials: !0
                        },
                        getUserCreditBalance: function() {
                            return {
                                url: "".concat(ta, "/credit-balance/v1/get-credit-balance"),
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
                                url: "".concat(ta, "/v1/subscriptions/").concat(e, "/eligibility")
                            }
                        },
                        resubscribeSubscription: function(e) {
                            return {
                                withCredentials: !0,
                                url: "".concat(ta, "/v1/subscriptions/").concat(e, "/resubscribe")
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
                tu = new Map(Object.values(tn).filter(function(e) {
                    return e !== tn.INVALID
                }).map(function(e) {
                    return [e.toLowerCase(), e]
                }));

            function tc(e) {
                var t;
                return tu.get(null != (t = null == e ? void 0 : e.toLowerCase()) ? t : "")
            }

            function tl(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function td(e, t, r, n, i, a, o) {
                try {
                    var s = e[a](o),
                        u = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(u) : Promise.resolve(u).then(n, i)
            }

            function tp(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, i) {
                        var a = e.apply(t, r);

                        function o(e) {
                            td(a, n, i, o, s, "next", e)
                        }

                        function s(e) {
                            td(a, n, i, o, s, "throw", e)
                        }
                        o(void 0)
                    })
                }
            }

            function tf(e) {
                return function(e) {
                    if (Array.isArray(e)) return tl(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return tl(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tl(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function th(e, t) {
                var r, n, i, a = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    s = Object.defineProperty;
                return s(o, "next", {
                    value: u(0)
                }), s(o, "throw", {
                    value: u(1)
                }), s(o, "return", {
                    value: u(2)
                }), "function" == typeof Symbol && s(o, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), o;

                function u(s) {
                    return function(u) {
                        var c = [s, u];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; o && (o = 0, c[0] && (a = 0)), a;) try {
                            if (r = 1, n && (i = 2 & c[0] ? n.return : c[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, c[1])).done) return i;
                            switch (n = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                                case 0:
                                case 1:
                                    i = c;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                        a.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && a.label < i[1]) {
                                        a.label = i[1], i = c;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(c);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            c = t.call(e, a)
                        } catch (e) {
                            c = [6, e], n = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var tm = function(e, t) {
                    return tp(function() {
                        var r, n, i, a, o, s, u, c, l, d, p, f;
                        return th(this, function(h) {
                            switch (h.label) {
                                case 0:
                                    r = ts.url.getUserSubscriptions, n = [], i = !0, h.label = 1;
                                case 1:
                                    if (!i) return [3, 3];
                                    return d = {
                                        resultsPerPage: 20,
                                        cursor: a,
                                        expirationTimestampMsStart: e ? e.getTime() : 0,
                                        expirationTimestampMsEnd: t ? t.getTime() : 0
                                    }, [4, N.httpService.get(r, d)];
                                case 2:
                                    return f = (null != (o = null == (u = (p = h.sent()).data) ? void 0 : u.subscriptions) ? o : []).map(function(e) {
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
                                            paymentProvider: tc(e.paymentProvider),
                                            showLowBalanceNotification: e.showLowBalanceNotification,
                                            paymentProfileId: e.paymentProfileId
                                        }
                                    }), n = tf(n).concat(tf(f)), i = null != (s = null == (c = p.data) ? void 0 : c.hasMore) && s, a = null == (l = p.data) ? void 0 : l.cursor, [3, 1];
                                case 3:
                                    return [2, n]
                            }
                        })
                    })()
                },
                tb = new e8(new eW({
                    basePath: "".concat(x.EnvironmentUrls.apiGatewayUrl, "/subscriptions"),
                    credentials: "include"
                })),
                ty = function(e) {
                    return tp(function() {
                        var t;
                        return th(this, function(r) {
                            switch (r.label) {
                                case 0:
                                    return r.trys.push([0, 2, , 3]), [4, tb.subscriptionsV2ListSubscriptions({
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
                tv = {
                    Blackbird: "RBP",
                    RobloxPlus: "RBP",
                    CurrencySubscription: "CUR",
                    DeveloperSubscription: "EXP",
                    Premium: "PRM"
                },
                tg = function(e, t) {
                    var r = tv[e];
                    return r ? "".concat(r, "-").concat(t) : null
                },
                tw = function(e) {
                    if (e) return {
                        cardNetwork: e.cardNetwork,
                        last4Digits: e.lastFourDigits,
                        expMonth: e.expirationMonth,
                        expYear: e.expirationYear
                    }
                },
                tP = function(e) {
                    var t, r, n;
                    if (null == e) throw Error("mapV2ToUserSubscription: displayPrice is required");
                    return {
                        amount: (null != (t = e.units) ? t : 0) + (null != (r = e.nanos) ? r : 0) / 1e9,
                        currencyCode: null != (n = e.currencyCode) ? n : ""
                    }
                },
                tS = function(e) {
                    var t, r, n, i, a, o, s, u, c, l, d, p, f, h = null != (t = null == (o = e.productKey) ? void 0 : o.type) ? t : "";
                    return {
                        subscriptionTargetKey: null != (n = tg(h, null != (r = null == (s = e.productKey) ? void 0 : s.id) ? r : "")) ? n : "",
                        name: h,
                        subscriptionProviderName: "Roblox",
                        productType: h || void 0,
                        price: tP(e.displayPrice),
                        subscriptionPeriod: e.periodType,
                        periodCount: null == (u = e.productInfo) ? void 0 : u.periodCount,
                        expiration: new Date(e.expirationTimestampMs),
                        renewal: new Date(e.nextRenewalTimestampMs ? e.nextRenewalTimestampMs : 0),
                        paymentProvider: tc(e.paymentProvider),
                        cardInfo: tw(null == (c = e.paymentProfile) ? void 0 : c.cardInfo),
                        paymentProfileId: null != (i = null == (l = e.paymentProfile) ? void 0 : l.id) ? i : "",
                        purchasePlatform: e.purchasePlatform,
                        subscriptionOffers: (null == (d = e.activeOffers) ? void 0 : d.length) ? e.activeOffers : void 0,
                        currencySubscriptionBenefit: null != (a = null == (f = e.productTypeMembershipDetails) || null == (p = f.robloxSubscriptionMembershipDetails) ? void 0 : p.currencySubscriptionBenefit) ? a : null
                    }
                },
                tx = r(611),
                tE = r.n(tx),
                tT = window.ReactStyleGuide,
                tC = window.RobloxThumbnails,
                tO = function() {
                    for (var e, t, r = 0, n = "", i = arguments.length; r < i; r++)(e = arguments[r]) && (t = function e(t) {
                        var r, n, i = "";
                        if ("string" == typeof t || "number" == typeof t) i += t;
                        else if ("object" == (void 0 === t ? "undefined" : t && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t))
                            if (Array.isArray(t)) {
                                var a = t.length;
                                for (r = 0; r < a; r++) t[r] && (n = e(t[r])) && (i && (i += " "), i += n)
                            } else
                                for (n in t) t[n] && (i && (i += " "), i += n);
                        return i
                    }(e)) && (n && (n += " "), n += t);
                    return n
                };

            function tA(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tI(e) {
                if (Array.isArray(e)) return e
            }

            function tj() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function tk(e, t) {
                if (e) {
                    if ("string" == typeof e) return tA(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tA(e, t)
                }
            }
            var tD = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                tN = P().forwardRef(function(e, t) {
                    var r, n = tI(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || tk(r) || tj(),
                        i = n[0],
                        a = n.slice(1),
                        o = i.name,
                        s = i.size,
                        u = i.className,
                        c = (i.children, function(e, t) {
                            if (null == e) return {};
                            var r, n, i, a = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                                return a
                            }
                            if (a = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, i = {},
                                        a = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                                    return i
                                }(e, t), Object.getOwnPropertySymbols)
                                for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                            return a
                        }(i, ["name", "size", "className", "children"])),
                        l = (tI(a) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    a = !0,
                                    o = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (i.push(t.value), 1 !== i.length); a = !0);
                                } catch (e) {
                                    o = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (o) throw r
                                    }
                                }
                                return i
                            }
                        }(a) || tk(a, 1) || tj())[0];
                    return P().createElement("span", function(e) {
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
                        ref: l,
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-icon",
                        className: tO("grow-0 shrink-0 basis-auto icon", o, tD[void 0 === s ? "Medium" : s], u)
                    }, c))
                });
            tN.displayName = "Icon";
            var tR = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                tM = function(e) {
                    var t = e.className;
                    return P().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: tO("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                },
                tU = "opacity-[0.5]";

            function tL(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function t_(e) {
                if (Array.isArray(e)) return e
            }

            function tB() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function tF(e) {
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

            function tY(e, t) {
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

            function tq(e, t) {
                if (null == e) return {};
                var r, n, i, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, i = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                        return i
                    }(e, t), Object.getOwnPropertySymbols)
                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function tH(e, t) {
                if (e) {
                    if ("string" == typeof e) return tL(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tL(e, t)
                }
            }
            var tV = {
                    Small: "XSmall",
                    Medium: "Small",
                    Large: "Medium"
                },
                tW = {
                    Small: ["height-600", "text-label-small"],
                    Medium: ["height-800", "text-label-medium"],
                    Large: ["height-1000", "text-label-medium"]
                },
                tG = {
                    Small: "padding-left-small",
                    Medium: "padding-left-medium",
                    Large: "padding-left-large"
                },
                tK = {
                    Small: "padding-left-small",
                    Medium: "padding-left-medium",
                    Large: "padding-left-medium"
                },
                tz = {
                    Small: "padding-right-small",
                    Medium: "padding-right-medium",
                    Large: "padding-right-large"
                },
                tX = {
                    Small: "padding-right-small",
                    Medium: "padding-right-medium",
                    Large: "padding-right-medium"
                },
                tQ = {
                    Small: "padding-left-xsmall",
                    Medium: "padding-left-[var(--size-150)]",
                    Large: "padding-left-small"
                },
                t$ = {
                    Small: "padding-right-[var(--size-150)]",
                    Medium: "padding-right-small",
                    Large: "padding-right-[var(--size-250)]"
                },
                tJ = {
                    Standard: "bg-shift-300",
                    Utility: "bg-none"
                },
                tZ = {
                    Small: "size-[var(--icon-size-xsmall)]",
                    Medium: "size-[var(--icon-size-small)]",
                    Large: "size-[var(--icon-size-medium)]"
                },
                t0 = function(e) {
                    var t = e.iconName,
                        r = e.node,
                        n = e.size;
                    return null != t ? P().createElement(tN, {
                        name: t,
                        size: tV[n]
                    }) : null != r ? P().createElement("span", {
                        className: tO("inline-flex items-center justify-center shrink-0", tZ[n])
                    }, r) : null
                },
                t1 = (0, w.forwardRef)(function(e, t) {
                    var r, n = t_(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || tH(r) || tB(),
                        i = n[0],
                        a = n.slice(1),
                        o = i.className,
                        s = i.style,
                        u = i.text,
                        c = i.isDisabled,
                        l = void 0 !== c && c,
                        d = i.size,
                        p = void 0 === d ? "Medium" : d,
                        f = i.variant,
                        h = void 0 === f ? "Standard" : f,
                        m = i.leadingIconName,
                        b = i.leadingIconNode,
                        y = i.trailingIconName,
                        v = i.trailingIconNode,
                        g = tq(i, ["className", "style", "text", "isDisabled", "size", "variant", "leadingIconName", "leadingIconNode", "trailingIconName", "trailingIconNode"]),
                        w = (t_(a) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    a = !0,
                                    o = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (i.push(t.value), 1 !== i.length); a = !0);
                                } catch (e) {
                                    o = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (o) throw r
                                    }
                                }
                                return i
                            }
                        }(a) || tH(a, 1) || tB())[0],
                        S = null != m || null != b,
                        x = null != y || null != v,
                        E = tO(l ? tU : [tR, "cursor-pointer"], "relative flex justify-center items-center radius-circle stroke-none", S ? tK[p] : tG[p], x ? tX[p] : tz[p], tW[p], o),
                        T = P().createElement(P().Fragment, null, P().createElement(tM, null), P().createElement(t0, {
                            iconName: m,
                            node: b,
                            size: p
                        }), P().createElement("span", {
                            className: tO("padding-y-xsmall text-no-wrap text-truncate-end", S && tQ[p], x && t$[p])
                        }, u), P().createElement(t0, {
                            iconName: y,
                            node: v,
                            size: p
                        })),
                        C = tF({
                            textDecoration: "none"
                        }, s);
                    if ("a" === g.as) {
                        g.as;
                        var O = g.href,
                            A = tq(g, ["as", "href"]);
                        return P().createElement("a", tY(tF({
                            ref: w
                        }, A), {
                            "aria-disabled": l,
                            href: l ? void 0 : O,
                            className: tO(E, tJ[h], "content-action-utility"),
                            style: C
                        }), T)
                    }
                    g.as;
                    var I = g.isChecked,
                        j = g.onCheckedChange,
                        k = tq(g, ["as", "isChecked", "onCheckedChange"]);
                    return P().createElement("button", tY(tF({
                        ref: w,
                        type: "button"
                    }, k), {
                        className: tO(I ? "bg-inverse-surface-0" : tJ[h], I ? "content-inverse-emphasis" : "content-action-utility", E),
                        style: C,
                        "aria-pressed": I,
                        disabled: l,
                        onClick: null == j ? void 0 : function() {
                            return j(!I)
                        }
                    }), T)
                }),
                t2 = function(e) {
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
                t3 = function(e) {
                    var t = e.priceInRobux,
                        r = e.totalDiscountAmountInRobux,
                        n = e.isLoading,
                        i = e.freeUntil,
                        a = (0, T.useTranslation)().translate;
                    if (void 0 !== n && n) return (0, g.jsx)(A.Skeleton, {
                        animate: !0,
                        variant: "text",
                        width: 120,
                        height: 22
                    });
                    if (!((null != t ? t : 0) > 0) && (null != r ? r : 0) > 0) {
                        var o = i ? a("Label.Subscriptions.FreeWithPlusUntil", {
                            freeExpirationDate: i.toLocaleDateString(void 0, {
                                day: "2-digit",
                                month: "short",
                                year: "numeric"
                            })
                        }) : a("Label.Subscriptions.FreeWithPlus");
                        return (0, g.jsxs)("span", {
                            className: "flex items-center gap-xsmall",
                            children: [(0, g.jsx)(tN, {
                                name: "icon-regular-roblox-plus",
                                size: "Small"
                            }), (0, g.jsx)("span", {
                                children: o
                            })]
                        })
                    }
                    var s = " ".concat(a("Label.Subscriptions.PerMonth"));
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
                                children: s
                            })]
                        })]
                    })
                },
                t4 = function(e) {
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
                        className: tE()("subscription-date", "text-description", {
                            "text-alert": i
                        }),
                        children: o
                    })
                };

            function t6(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var t5 = ((l = {}).LOW_BALANCE_WARNING = "LowBalanceWarning", l.LOW_BALANCE_GRACE_PERIOD = "LowBalanceGracePeriod", l),
                t8 = function(e, t, r) {
                    if (!e) return null;
                    var n = new Date;
                    return t < n && n < r ? "LowBalanceGracePeriod" : "LowBalanceWarning"
                },
                t7 = (t6(y = {}, "LowBalanceWarning", "icon-status-alert"), t6(y, "LowBalanceGracePeriod", "icon-warning"), y),
                t9 = ((d = {}).VISA = "visa", d.DISCOVER = "discover", d.MASTERCARD = "mastercard", d.AMERICANEXPRESS = "americanexpress", d.AMEX = "amex", d.DEBIT = "debitcard", d),
                re = function(e) {
                    switch (e) {
                        case t9.AMEX:
                        case t9.AMERICANEXPRESS:
                            return "icon-amex";
                        case t9.DISCOVER:
                            return "icon-discover";
                        case t9.MASTERCARD:
                            return "icon-mastercard";
                        case t9.VISA:
                            return "icon-visa";
                        case t9.DEBIT:
                            return "icon-debit";
                        default:
                            return "icon-generic-card"
                    }
                },
                rt = function(e, t, r) {
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
                rr = function(e, t, r) {
                    var n = "icon-generic-card";
                    switch (e) {
                        case tt.APPLE:
                        case e7.IOS_APP:
                            n = "icon-apple";
                            break;
                        case tt.GOOGLE:
                        case e7.ANDROID_APP:
                            n = "icon-google";
                            break;
                        case tt.DESKTOP:
                        case tt.INTERNAL:
                        case e7.DESKTOP:
                            if (t) switch (t) {
                                case tn.CREDITBALANCE:
                                    n = "icon-roblox-credit";
                                    break;
                                case tn.BRAINTREE:
                                    n = "icon-paypal";
                                    break;
                                case tn.STRIPE:
                                    r && (n = re(r.cardNetwork));
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
                rn = function(e, t) {
                    return 0 === e.getTime() || t <= e
                },
                ri = function(e) {
                    var t;
                    return null != (t = null == e ? void 0 : e.some(function(e) {
                        return "FreeTrial" === e.offerType
                    })) && t
                };

            function ra(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ro(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
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
                        if ("string" == typeof e) return ra(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ra(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var rs = function(e) {
                    var t = e.subscriptionName,
                        r = e.subscriptionProviderName,
                        n = e.subscriptionPaymentProvider,
                        i = e.iconImageAssetId,
                        a = e.price,
                        o = e.priceInRobux,
                        s = e.subscriptionPeriod,
                        u = e.periodCount,
                        c = e.expiration,
                        l = e.renewal,
                        d = e.isPremium,
                        p = e.productType,
                        f = e.purchasePlatform,
                        h = e.showLowBalanceNotification,
                        m = void 0 !== h && h,
                        b = e.subscriptionOffers,
                        y = e.onClick,
                        v = (0, T.useTranslation)().translate,
                        P = ro((0, w.useState)(null), 2),
                        S = P[0],
                        x = P[1],
                        E = ro((0, w.useState)(!1), 2),
                        C = E[0],
                        O = E[1],
                        A = ro((0, w.useState)(""), 2),
                        I = A[0],
                        j = A[1];
                    (0, w.useEffect)(function() {
                        O(null !== S && n === tn.CREDITBALANCE), S && n === tn.CREDITBALANCE && j(t7[S])
                    }, [S, n]), (0, w.useEffect)(function() {
                        x(t8(m, l, c))
                    }, [m, c, l]);
                    var k = null != o && o > 0 || null != a && f !== tt.INTERNAL;
                    return (0, g.jsxs)("button", {
                        className: "subcard-container",
                        onClick: y,
                        type: "button",
                        children: [(0, g.jsx)("div", {
                            className: "subcard-icon-container",
                            children: void 0 !== d && d ? (0, g.jsx)("span", {
                                className: "premium-icon"
                            }) : p === e1 ? (0, g.jsx)(tN, {
                                className: "blackbird-icon",
                                name: "icon-regular-roblox-plus",
                                size: "Large"
                            }) : p === e0 ? (0, g.jsx)("span", {
                                className: "premium-icon"
                            }) : (0, g.jsx)(tC.Thumbnail2d, {
                                targetId: void 0 === i ? 0 : i,
                                type: tC.ThumbnailTypes.assetThumbnail,
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
                                children: [null != o && o > 0 ? (0, g.jsx)(t3, {
                                    priceInRobux: o
                                }) : a && f !== tt.INTERNAL ? (0, g.jsx)(t2, {
                                    price: a,
                                    period: s,
                                    periodCount: u,
                                    className: "subscription"
                                }) : (0, g.jsx)(t4, {
                                    expiration: c,
                                    renewal: l
                                }), k && (0, g.jsxs)("div", {
                                    className: "subscription-billing-cycle-info",
                                    children: [(0, g.jsx)(t4, {
                                        expiration: c,
                                        renewal: l
                                    }), ri(b) && (0, g.jsx)(t1, {
                                        as: "button",
                                        isChecked: !1,
                                        size: "Small",
                                        text: v("Label.FreeTrial"),
                                        variant: "Standard"
                                    })]
                                }), !k && ri(b) && (0, g.jsx)(t1, {
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
                ru = function(e) {
                    return e.name.toLowerCase().includes("12 months") || e.name.toLowerCase().includes("annual")
                },
                rc = function(e) {
                    return ru(e) ? te.YEAR : te.MONTH
                },
                rl = function(e) {
                    return ru(e) ? "Roblox Annual Premium" : e.name
                };

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
            var rf = function(e) {
                    return rp(rd({}, e), {
                        expirationDate: new Date(e.expirationDate)
                    })
                },
                rh = {
                    enforcementStartDate: new Date(0),
                    plusFreePrivateServerCap: 0,
                    displayPlusFreePrivateServers: !1
                },
                rm = function(e) {
                    var t, r, n;
                    return null != (t = null == (n = e.metadata) || null == (r = n.privateServerSubscriptionTags) ? void 0 : r.includes("RobloxSubscription")) && t
                },
                rb = function(e) {
                    var t;
                    return (null != (t = e.priceInRobux) ? t : 0) > 0
                },
                ry = function(e) {
                    return e.expirationDate.getTime() > Date.now()
                },
                rv = function(e) {
                    var t, r;
                    return (null != (t = e.priceInRobux) ? t : 0) === 0 && (null != (r = e.totalDiscountAmountInRobux) ? r : 0) > 0
                },
                rg = function(e) {
                    var t, r = (null != (t = e.totalDiscountAmountInRobux) ? t : 0) > 0 && !rm(e);
                    return ry(e) && (rb(e) || r)
                },
                rw = function(e) {
                    return ry(e) && (rb(e) || rv(e))
                },
                rP = function(e, t) {
                    var r = e.expirationDate.getTime(),
                        n = t.getTime();
                    if (r >= n) return new Date(r);
                    var i = Math.ceil((n - r) / 2592e6);
                    return new Date(r + 2592e6 * i)
                },
                rS = function(e) {
                    var t = e.expirationDate,
                        r = e.willRenew,
                        n = e.benefitCapOutcome,
                        i = e.firstRenewalOnOrAfterEnforcement,
                        a = t,
                        o = r ? t : new Date(0);
                    return "expires" === n && void 0 !== i && (a = !r && t < i ? t : i, o = new Date(0)), {
                        expiryDateWithCap: a,
                        renewalDateWithCap: o
                    }
                },
                rx = function(e, t) {
                    var r = t.plusFreePrivateServerCap,
                        n = e.map(function(e) {
                            return rp(rd({}, e), {
                                benefitCapOutcome: "none",
                                firstRenewalOnOrAfterEnforcement: rP(e, t.enforcementStartDate)
                            })
                        }),
                        i = new Map;
                    n.forEach(function(e) {
                        var r;
                        if (rv(e) && (r = t.enforcementStartDate, e.willRenew || e.expirationDate >= r)) {
                            var n, a = null != (n = i.get(e.universeId)) ? n : [];
                            a.push(e), i.set(e.universeId, a)
                        }
                    });
                    var a = new Set,
                        o = !0,
                        s = !1,
                        u = void 0;
                    try {
                        for (var c, l = i.values()[Symbol.iterator](); !(o = (c = l.next()).done); o = !0) {
                            var d = c.value;
                            d.length <= r || d.toSorted(function(e, t) {
                                var r = e.firstRenewalOnOrAfterEnforcement.getTime() - t.firstRenewalOnOrAfterEnforcement.getTime();
                                return 0 !== r ? r : e.privateServerId - t.privateServerId
                            }).slice(0, d.length - r).forEach(function(e) {
                                return a.add(e.privateServerId)
                            })
                        }
                    } catch (e) {
                        s = !0, u = e
                    } finally {
                        try {
                            o || null == l.return || l.return()
                        } finally {
                            if (s) throw u
                        }
                    }
                    return n.map(function(e) {
                        var t = "none";
                        return a.has(e.privateServerId) && (t = rm(e) ? "expires" : "becomesPaid"), rp(rd({}, e), {
                            benefitCapOutcome: t
                        })
                    })
                },
                rE = function(e) {
                    var t = e.privateServer,
                        r = e.isPriceLoading,
                        n = e.onClick,
                        i = (0, T.useTranslation)().translate,
                        a = rS({
                            expirationDate: t.expirationDate,
                            willRenew: t.willRenew,
                            benefitCapOutcome: t.benefitCapOutcome,
                            firstRenewalOnOrAfterEnforcement: t.firstRenewalOnOrAfterEnforcement
                        }),
                        o = a.expiryDateWithCap,
                        s = a.renewalDateWithCap,
                        u = "becomesPaid" === t.benefitCapOutcome ? t.firstRenewalOnOrAfterEnforcement : void 0,
                        c = i("Label.PrivateServer", {
                            privateServerName: t.name
                        });
                    return (0, g.jsxs)("button", {
                        className: "subcard-container",
                        onClick: n,
                        type: "button",
                        children: [(0, g.jsx)("div", {
                            className: "subcard-icon-container",
                            children: (0, g.jsx)(tC.Thumbnail2d, {
                                targetId: t.universeId,
                                type: tC.ThumbnailTypes.gameIcon,
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
                                    children: c
                                }), (0, g.jsx)("span", {
                                    className: "subscription-provider text-description",
                                    children: t.universeName
                                })]
                            }), (0, g.jsxs)("div", {
                                className: "subcard-info-secondary",
                                children: [(0, g.jsx)(t3, {
                                    priceInRobux: t.priceInRobux,
                                    totalDiscountAmountInRobux: t.totalDiscountAmountInRobux,
                                    isLoading: void 0 !== r && r,
                                    freeUntil: u
                                }), (0, g.jsx)(t4, {
                                    expiration: o,
                                    renewal: s
                                })]
                            })]
                        }), (0, g.jsx)("div", {
                            className: "warning-icon"
                        }), (0, g.jsx)("span", {
                            className: "icon-right more-details"
                        })]
                    })
                };

            function rT(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rC(e) {
                return function(e) {
                    if (Array.isArray(e)) return rT(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return rT(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rT(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var rO = function(e) {
                    var t = e.premiumSubscription,
                        r = e.subscriptionList,
                        n = e.emptyText,
                        i = e.resultsPerPage,
                        a = e.currentPage,
                        o = e.onChangePage,
                        s = e.onSelectSubscription,
                        u = e.onSelectPrivateServer,
                        c = e.isPriceLoading,
                        l = void 0 !== c && c,
                        d = (0, T.useTranslation)().translate,
                        p = (0, w.useMemo)(function() {
                            var e = function(e) {
                                    switch (e.productType) {
                                        case e1:
                                            if (e.currencySubscriptionBenefit && e.currencySubscriptionBenefit.entitledAmountMicrosPerGrantingPeriod > 0) return "Plus ".concat(e.currencySubscriptionBenefit.entitledAmountMicrosPerGrantingPeriod / 1e6);
                                            return d("Label.Blackbird");
                                        case e0:
                                            return d("Label.CurrencySubscription");
                                        default:
                                            return e.name
                                    }
                                },
                                n = function(t) {
                                    if (t.type === e9.PRIVATE_SERVER) {
                                        var r = t.privateServer;
                                        return r ? (0, g.jsx)(rE, {
                                            privateServer: r,
                                            isPriceLoading: l,
                                            onClick: u ? function() {
                                                return u(r)
                                            } : void 0
                                        }, r.privateServerId) : null
                                    }
                                    var n = t.subscription;
                                    return n ? (0, g.jsx)(rs, {
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
                                    return e.type === e9.SUBSCRIPTION && (null == (t = e.subscription) ? void 0 : t.productType) === e1
                                },
                                a = r.filter(i).map(n),
                                o = r.filter(function(e) {
                                    return !i(e)
                                }).map(n),
                                c = t ? (0, g.jsx)(rs, {
                                    subscriptionName: rl(t),
                                    subscriptionProviderName: t.subscriptionProviderName,
                                    price: t.price,
                                    subscriptionPeriod: rc(t),
                                    expiration: new Date(t.expiration),
                                    renewal: new Date(t.renewal),
                                    showLowBalanceNotification: t.showLowBalanceNotification,
                                    isPremium: !0,
                                    onClick: s ? function() {
                                        return s(t, !0)
                                    } : void 0
                                }, "premium") : null;
                            return rC(a).concat([c], rC(o)).filter(function(e) {
                                return null !== e
                            })
                        }, [t, r, s, u, l, d]),
                        f = p.slice((a - 1) * i, Math.min(a * i, p.length)),
                        h = Math.ceil(p.length / i),
                        m = p.length > i ? (0, g.jsx)("div", {
                            className: "overview-pagination-container",
                            children: (0, g.jsx)(tT.Pagination, {
                                current: a,
                                total: h,
                                onChange: o,
                                hasNext: !0
                            })
                        }) : null;
                    return (0, g.jsx)("div", {
                        className: tE()({
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
                rA = function(e) {
                    var t = e.iconName,
                        r = e.label;
                    return (0, g.jsxs)("div", {
                        className: "gap-x-medium align-items-center flex flex-row",
                        children: [(0, g.jsx)(tN, {
                            name: t,
                            size: "Large"
                        }), (0, g.jsx)("span", {
                            className: "[font-size:var(--font-size-350)]",
                            children: r
                        })]
                    })
                },
                rI = function(e) {
                    var t = e.featureConfig,
                        r = e.currencySubscriptionBenefit,
                        n = (0, I.useTranslation)(),
                        i = n.translate,
                        a = n.intl,
                        o = (0, w.useMemo)(function() {
                            var e;
                            return null == (e = t.virtualTransactionDiscounts) ? void 0 : e.find(function(e) {
                                return 0 === e.periodIndex
                            })
                        }, [t]),
                        s = (0, w.useMemo)(function() {
                            var e;
                            return null == (e = t.virtualTransactionDiscounts) ? void 0 : e.filter(function(e) {
                                return e.periodIndex > 0
                            }).reduce(function(e, t) {
                                return null === e || t.periodIndex < e.periodIndex ? t : e
                            }, null)
                        }, [t]);
                    return (0, g.jsxs)("div", {
                        className: "gap-y-xlarge flex flex-col",
                        children: [o && (s ? (0, g.jsx)(rA, {
                            iconName: "icon-regular-tag",
                            label: i("Description.Benefit.DiscountV2")
                        }) : (0, g.jsx)(rA, {
                            iconName: "icon-regular-tag",
                            label: i("Description.Benefit.DiscountBase", {
                                discountPercent: a.n(.01 * o.discountPercent, {
                                    style: "percent"
                                })
                            })
                        })), (0, g.jsx)(rA, {
                            iconName: "icon-regular-paint-brush",
                            label: i("Description.Benefit.Customize")
                        }), (0, g.jsx)(rA, {
                            iconName: "icon-regular-controller",
                            label: i("Label.BlackbirdPSDiscount")
                        }), r && r.entitledAmountMicrosPerGrantingPeriod > 0 && (0, g.jsx)(rA, {
                            iconName: "icon-regular-robux",
                            label: i("Description.Benefit.RobuxStipend", {
                                amount: a.n(Math.round(r.entitledAmountMicrosPerGrantingPeriod / 1e6)),
                                periodType: r.grantingPeriodType
                            })
                        }), t.isRobuxTransferEnabled && (0, g.jsx)(rA, {
                            iconName: "icon-regular-robux",
                            label: i("Description.Benefit.RobuxTransfers")
                        }), t.isTradingEnabled && (0, g.jsx)(rA, {
                            iconName: "icon-regular-hand-two-arrows-horizontal",
                            label: i("Description.Benefit.TradeResellItems")
                        }), t.isUgcPublishingEnabled && (0, g.jsx)(rA, {
                            iconName: "icon-regular-arrow-up-from-landscape-rectangle",
                            label: i("Description.Benefit.PublishItems")
                        })]
                    })
                },
                rj = function(e) {
                    var t = e.width,
                        r = e.height;
                    return P().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: t,
                        height: r,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, P().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                };

            function rk(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function rD(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

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

            function rR(e, t) {
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

            function rM(e, t) {
                if (null == e) return {};
                var r, n, i, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, i = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                        return i
                    }(e, t), Object.getOwnPropertySymbols)
                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function rU(e) {
                return function(e) {
                    if (Array.isArray(e)) return rD(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return rD(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rD(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rL(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var r_ = Symbol.for("react.lazy"),
                rB = w[" use ".trim().toString()];

            function rF(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : rL(e)) === "object" && "$$typeof" in e && e.$$typeof === r_ && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : rL(t)) === "object" && null !== t && "then" in t
            }
            var rY = ((e = w.forwardRef(function(e, t) {
                    var r = e.children,
                        n = rM(e, ["children"]);
                    if (rF(r) && "function" == typeof rB && (r = rB(r._payload)), w.isValidElement(r)) {
                        var i, a, o, s, u, c = (u = (s = null == (a = Object.getOwnPropertyDescriptor((i = r).props, "ref")) ? void 0 : a.get) && "isReactWarning" in s && s.isReactWarning) ? i.ref : (u = (s = null == (o = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : o.get) && "isReactWarning" in s && s.isReactWarning) ? i.props.ref : i.props.ref || i.ref,
                            l = function(e, t) {
                                var r = rN({}, t);
                                for (var n in t) ! function(n) {
                                    var i = e[n],
                                        a = t[n];
                                    /^on[A-Z]/.test(n) ? i && a ? r[n] = function() {
                                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                        var n = a.apply(void 0, rU(t));
                                        return i.apply(void 0, rU(t)), n
                                    } : i && (r[n] = i) : "style" === n ? r[n] = rN({}, i, a) : "className" === n && (r[n] = [i, a].filter(Boolean).join(" "))
                                }(n);
                                return rN({}, e, r)
                            }(n, r.props);
                        return r.type !== w.Fragment && (l.ref = t ? function() {
                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                            return function(e) {
                                var r = !1,
                                    n = t.map(function(t) {
                                        var n = rk(t, e);
                                        return r || "function" != typeof n || (r = !0), n
                                    });
                                if (r) return function() {
                                    for (var e = 0; e < n.length; e++) {
                                        var r = n[e];
                                        "function" == typeof r ? r() : rk(t[e], null)
                                    }
                                }
                            }
                        }(t, c) : c), w.cloneElement(r, l)
                    }
                    return w.Children.count(r) > 1 ? w.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), p = e, (f = w.forwardRef(function(e, t) {
                    var r = e.children,
                        n = rM(e, ["children"]);
                    rF(r) && "function" == typeof rB && (r = rB(r._payload));
                    var i = w.Children.toArray(r),
                        a = i.find(rH);
                    if (a) {
                        var o = a.props.children,
                            s = i.map(function(e) {
                                return e !== a ? e : w.Children.count(o) > 1 ? w.Children.only(null) : w.isValidElement(o) ? o.props.children : null
                            });
                        return (0, g.jsx)(p, rR(rN({}, n), {
                            ref: t,
                            children: w.isValidElement(o) ? w.cloneElement(o, void 0, s) : null
                        }))
                    }
                    return (0, g.jsx)(p, rR(rN({}, n), {
                        ref: t,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), f),
                rq = Symbol("radix.slottable");

            function rH(e) {
                return w.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === rq
            }

            function rV(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rW(e) {
                if (Array.isArray(e)) return e
            }

            function rG() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function rK(e) {
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

            function rz(e, t) {
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
                var r, n, i, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, i = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                        return i
                    }(e, t), Object.getOwnPropertySymbols)
                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function rQ(e, t) {
                if (e) {
                    if ("string" == typeof e) return rV(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rV(e, t)
                }
            }
            var r$ = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                rJ = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                rZ = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                r0 = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                r1 = (0, w.forwardRef)(function(e, t) {
                    var r, n = rW(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || rQ(r) || rG(),
                        i = n[0],
                        a = n.slice(1),
                        o = i.children,
                        s = i.className,
                        u = i.style,
                        c = i.isDisabled,
                        l = void 0 !== c && c,
                        d = i.isLoading,
                        p = void 0 !== d && d,
                        f = i.icon,
                        h = i.size,
                        m = void 0 === h ? "Large" : h,
                        b = i.variant,
                        y = void 0 === b ? "Emphasis" : b,
                        v = i.asChild,
                        g = rX(i, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        w = (rW(a) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    a = !0,
                                    o = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (i.push(t.value), 1 !== i.length); a = !0);
                                } catch (e) {
                                    o = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (o) throw r
                                    }
                                }
                                return i
                            }
                        }(a) || rQ(a, 1) || rG())[0],
                        S = tO("foundation-web-button", l ? tU : [tR, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", rJ[m], l ? r0[y] : rZ[y], s),
                        x = rK({
                            textDecoration: "none"
                        }, u),
                        E = function(e) {
                            return P().createElement(P().Fragment, null, P().createElement(tM, null), p && P().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, P().createElement(rj, {
                                width: r$[m],
                                height: r$[m]
                            })), P().createElement("span", {
                                className: tO("flex items-center min-width-0", "Large" === m || "Medium" === m ? "gap-small" : "gap-xsmall", p && "invisible")
                            }, f && P().createElement(tN, {
                                name: f,
                                size: m
                            }), P().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (v) {
                        g.as;
                        var T = rX(g, ["as"]),
                            C = P().Children.only(o);
                        return P().createElement(rY, rz(rK({
                            ref: w
                        }, T), {
                            className: S,
                            style: x,
                            "aria-disabled": l || void 0
                        }), P().cloneElement(C, {}, E(C.props.children)))
                    }
                    if ("a" === g.as) {
                        g.as;
                        var O = g.href,
                            A = rX(g, ["as", "href"]);
                        return P().createElement("a", rz(rK({
                            ref: w
                        }, A), {
                            "aria-disabled": l,
                            href: l ? void 0 : O,
                            className: S,
                            style: x
                        }), E(o))
                    }
                    g.as;
                    var I = rX(g, ["as"]);
                    return P().createElement("button", rz(rK({
                        ref: w,
                        type: "button"
                    }, I), {
                        disabled: l,
                        className: S,
                        style: x
                    }), E(o))
                }),
                r2 = function(e) {
                    var t = e.title,
                        r = e.body,
                        n = e.equipText,
                        i = e.onEquip,
                        a = e.onItemDetailsClick,
                        o = null != a;
                    return (0, g.jsxs)("div", {
                        "aria-label": o ? t : void 0,
                        className: "bg-shift-200 radius-medium padding-medium gap-medium width-full flex items-center ".concat(o ? "hover:bg-surface-100 cursor-pointer" : ""),
                        role: o ? "button" : void 0,
                        tabIndex: o ? 0 : void 0,
                        onClick: a,
                        onKeyDown: o ? function(e) {
                            e.target === e.currentTarget && ("Enter" === e.key || " " === e.key) && (e.preventDefault(), null == a || a())
                        } : void 0,
                        children: [(0, g.jsx)("div", {
                            className: "radius-medium size-[50px] shrink-0 overflow-hidden",
                            children: (0, g.jsx)("img", {
                                alt: t,
                                className: "size-full object-cover",
                                src: "https://images.rbxcdn.com/edf7aeadb32b5c26.png"
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
                        }), null != n && null != i && (0, g.jsx)(r1, {
                            className: "shrink-0",
                            size: "Medium",
                            variant: "Standard",
                            onClick: function(e) {
                                e.stopPropagation(), null == i || i()
                            },
                            children: n
                        })]
                    })
                },
                r3 = function(e) {
                    var t = e.title,
                        r = e.body;
                    return (0, g.jsxs)("div", {
                        className: "bg-shift-200 radius-medium padding-medium gap-medium width-full flex items-center",
                        children: [(0, g.jsx)("div", {
                            className: "radius-medium size-[50px] shrink-0 flex items-center justify-center",
                            children: (0, g.jsx)(tN, {
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
            var r4 = N.urlService.getAbsoluteUrl("/redeem"),
                r6 = N.urlService.getAbsoluteUrl("/giftcards");
            N.urlService.getAbsoluteUrl("/my/account#!/billing");
            var r5 = (0, w.createContext)(null),
                r8 = function() {
                    var e = (0, w.useContext)(r5);
                    if (null === e) throw Error("System feedback context was not provided in the current scope!");
                    return e
                };

            function r7(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function r9(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var ne = function e() {
                var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {
                    baseUrl: ""
                };
                if (!r7(this, e)) throw TypeError("Cannot call a class as a function");
                r9(this, "configuration", void 0), r9(this, "baseUrl", void 0), this.configuration = t, this.baseUrl = this.configuration.baseUrl
            };

            function nt(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var nr = function() {
                var e;

                function t() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : new ne;
                    if (!r7(this, t)) throw TypeError("Cannot call a class as a function");
                    nt(this, "configuration", void 0), nt(this, "baseUrl", void 0), this.configuration = e, this.baseUrl = e.baseUrl
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
                                u = e.sessionId,
                                c = t.toISOString(),
                                l = new URL("".concat(this.baseUrl, "/pe"));
                            return l.searchParams.append("t", r), l.searchParams.append("evt", n), l.searchParams.append("ctx", i), l.searchParams.append("lt", c), l.searchParams.append("url", o || window.location.href), void 0 !== s && l.searchParams.append("gid", s), void 0 !== u && l.searchParams.append("sid", u), void 0 !== a && Object.keys(a).forEach(function(e) {
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
                                u = e.guestId,
                                c = e.sessionId,
                                l = r.toISOString(),
                                d = new URL("".concat(this.baseUrl, "/e.png"));
                            d.searchParams.append("t", n), d.searchParams.append("evt", i), d.searchParams.append("ctx", a), d.searchParams.append("lt", l), d.searchParams.append("url", s || window.location.href), void 0 !== u && d.searchParams.append("gid", u), void 0 !== c && d.searchParams.append("sid", c), void 0 !== o && Object.keys(o).forEach(function(e) {
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

            function nn(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var ni = x.EnvironmentUrls.domain,
                na = ((h = {}).INVALID = "INVALID", h.PAGE_LOAD = "PAGE_LOAD", h.VIEW_ACTIVE = "VIEW_ACTIVE", h.VIEW_INACTIVE = "VIEW_INACTIVE", h.CLICK_CANCEL = "CLICK_CANCEL", h.CANCEL_SUCCESS = "CANCEL_SUCCESS", h.EMAIL_REFERER_PAGE_LOAD = "EMAIL_REFERER_PAGE_LOAD", h.CLICK_EDIT_PAYMENT_METHOD = "CLICK_EDIT_PAYMENT_METHOD", h.CLICK_UPDATE_PAYMENT_METHOD = "CLICK_UPDATE_PAYMENT_METHOD", h.UPDATE_PAYMENT_METHOD_SUCCESS = "UPDATE_PAYMENT_METHOD_SUCCESS", h.UPDATE_PAYMENT_METHOD_EXPIRATION_SUCCESS = "UPDATE_PAYMENT_METHOD_EXPIRATION_SUCCESS", h.UPDATE_PAYMENT_METHOD_ADD_CARD_CLICKED = "UPDATE_PAYMENT_METHOD_ADD_CARD_CLICKED", h.UPDATE_PAYMENT_METHOD_ADD_CARD_SUCCESS = "UPDATE_PAYMENT_METHOD_ADD_CARD_SUCCESS", h.UPDATE_PAYMENT_METHOD_FAILURE = "UPDATE_PAYMENT_METHOD_FAILURE", h.UPDATE_PAYMENT_METHOD_EXPIRATION_FAILURE = "UPDATE_PAYMENT_METHOD_EXPIRATION_FAILURE", h.UPDATE_PAYMENT_METHOD_ADD_CARD_FAILURE = "UPDATE_PAYMENT_METHOD_ADD_CARD_FAILURE", h.RESUBSCRIBE_SUCCESS = "RESUBSCRIBE_SUCCESS", h.CLICK_RESUBSCRIBE = "CLICK_RESUBSCRIBE", h),
                no = new nr(new ne({
                    baseUrl: "https://ecsv2.".concat(ni, "/www")
                })),
                ns = function(e, t) {
                    var r = {
                        userAction: e
                    };
                    if (t) {
                        var n, i = function(e) {
                                if (Array.isArray(e)) return e
                            }(n = t.subscriptionTargetKey.split("-")) || function(e) {
                                var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                if (null != n) {
                                    var i = [],
                                        a = !0,
                                        o = !1;
                                    try {
                                        for (n = n.call(e); !(a = (t = n.next()).done) && (i.push(t.value), 2 !== i.length); a = !0);
                                    } catch (e) {
                                        o = !0, r = e
                                    } finally {
                                        try {
                                            a || null == n.return || n.return()
                                        } finally {
                                            if (o) throw r
                                        }
                                    }
                                    return i
                                }
                            }(n) || function(e) {
                                if (e) {
                                    if ("string" == typeof e) return nn(e, 2);
                                    var t = Object.prototype.toString.call(e).slice(8, -1);
                                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nn(e, 2)
                                }
                            }(n) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }(),
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
                    if (nD.has(e)) {
                        var u = nD.get(e);
                        void 0 !== u && (0, k.fireEvent)(u)
                    }
                    return no.sendEventViaImg(s)
                },
                nu = "UserHasNoSubscription",
                nc = "CancelSubscriptionButtonClicked",
                nl = "PaymentFailureEmailDirectLink",
                nd = "SubscriptionsClickUpdatePaymentMethod",
                np = "SubscriptionsUpdatePaymentMethodSuccess",
                nf = "SubscriptionsUpdatePaymentMethodFailure",
                nh = "SubscriptionsUpdatePaymentMethodAddCardClicked",
                nm = "SubscriptionsUpdatePaymentMethodAddCardSuccess",
                nb = "SubscriptionsUpdatePaymentMethodAddCardFailed",
                ny = "SubscriptionsUpdatePaymentMethodAddLimitedCardSuccess",
                nv = "SubscriptionsClickResubscribe",
                ng = "SubscriptionsResubscribeSuccess",
                nw = "GetUserPremiumSubscriptionCalled",
                nP = "GetUserPremiumSubscriptionSucceeded",
                nS = "GetUserPremiumSubscriptionFailed",
                nx = "GetSavedPaymentProfilesCalled",
                nE = "GetSavedPaymentProfilesSucceeded",
                nT = "GetSavedPaymentProfilesFailed",
                nC = "DeleteSavedPaymentProfileCalled",
                nO = "DeleteSavedPaymentProfileSucceeded",
                nA = "DeleteSavedPaymentProfileFailed",
                nI = "UpdateSavedPaymentProfileCalled",
                nj = "UpdateSavedPaymentProfileSucceeded",
                nk = "UpdateSavedPaymentProfileFailed",
                nD = new Map([
                    [na.CLICK_UPDATE_PAYMENT_METHOD, nd],
                    [na.UPDATE_PAYMENT_METHOD_SUCCESS, np],
                    [na.UPDATE_PAYMENT_METHOD_FAILURE, nf],
                    [na.EMAIL_REFERER_PAGE_LOAD, nl],
                    [na.UPDATE_PAYMENT_METHOD_ADD_CARD_CLICKED, nh],
                    [na.UPDATE_PAYMENT_METHOD_ADD_CARD_SUCCESS, nm],
                    [na.UPDATE_PAYMENT_METHOD_ADD_CARD_FAILURE, nb],
                    [na.CLICK_RESUBSCRIBE, nv],
                    [na.RESUBSCRIBE_SUCCESS, ng]
                ]);

            function nN(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nR(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
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
                        if ("string" == typeof e) return nN(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nN(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var nM = function(e) {
                var t = e.className,
                    r = e.subscription,
                    n = e.onCancel,
                    i = e.isPremium,
                    a = void 0 !== i && i,
                    o = (0, T.useTranslation)().translate,
                    s = nR((0, w.useState)(!1), 2),
                    u = s[0],
                    c = s[1],
                    l = nR((0, w.useState)(!1), 2),
                    d = l[0],
                    p = l[1],
                    f = nR((0, w.useState)(!1), 2),
                    h = f[0],
                    m = f[1],
                    b = r8().systemFeedbackService,
                    y = D.deviceMeta.getDeviceMeta();
                (0, w.useEffect)(function() {
                    rn(r.renewal, r.expiration) && c(!0)
                }, [r.renewal, r.expiration]);
                var v = r.renewal.toLocaleDateString(void 0, {
                    day: "2-digit",
                    month: "short",
                    year: "numeric"
                });
                return (0, g.jsxs)(P().Fragment, {
                    children: [!u && (!a || r.purchasePlatform === e7.DESKTOP || r.purchasePlatform === e7.ANDROID_APP && (null == y ? void 0 : y.isAndroidApp)) && (0, g.jsx)("button", {
                        type: "button",
                        className: t,
                        onClick: function() {
                            a || ns(na.CLICK_CANCEL, r), p(!0)
                        },
                        children: o("Action.CancelRenewal")
                    }), (0, g.jsxs)(tT.Modal, {
                        show: d,
                        onHide: function() {
                            return p(!1)
                        },
                        children: [(0, g.jsx)(tT.Modal.Header, {
                            className: "cancel-modal-header",
                            title: o("Action.CancelSubscription"),
                            showCloseButton: !0,
                            onClose: function() {
                                return p(!1)
                            }
                        }), (0, g.jsx)(tT.Modal.Body, {
                            children: r.productType === e1 ? (0, g.jsxs)(P().Fragment, {
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
                        }), (0, g.jsxs)(tT.Modal.Footer, {
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
                                        if ((0, k.fireEvent)(nc), r.purchasePlatform === e7.ANDROID_APP && (null == y ? void 0 : y.isAndroidApp)) {
                                            window.location.href = "https://play.google.com/store/account/subscriptions";
                                            return
                                        }
                                        t = D.authenticatedUser.id, e = tp(function() {
                                            var e;
                                            return th(this, function(r) {
                                                switch (r.label) {
                                                    case 0:
                                                        return e = ts.url.cancelPremiumSubscription(t), [4, N.httpService.post(e)];
                                                    case 1:
                                                        return r.sent(), [2]
                                                }
                                            })
                                        })()
                                    } else i = r.subscriptionTargetKey, e = tp(function() {
                                        var e;
                                        return th(this, function(t) {
                                            switch (t.label) {
                                                case 0:
                                                    return e = ts.url.cancelSubscription(i), [4, N.httpService.post(e)];
                                                case 1:
                                                    return t.sent(), [2]
                                            }
                                        })
                                    })();
                                    p(!1), e.then(function() {
                                        b.success(o("Response.Subscriptions.CancelSuccess")), c(!0), n && n(a, r.subscriptionTargetKey), a || ns(na.CANCEL_SUCCESS, r)
                                    }).catch(function() {
                                        return m(!0)
                                    })
                                },
                                children: o("Action.Subscriptions.CancelSubscription")
                            })]
                        })]
                    }), (0, g.jsxs)(tT.Modal, {
                        show: h,
                        onHide: function() {
                            return m(!1)
                        },
                        children: [(0, g.jsx)(tT.Modal.Header, {
                            className: "cancel-modal-header",
                            title: o("Heading.Dialog.DefaultError"),
                            showCloseButton: !0,
                            onClose: function() {
                                return m(!1)
                            }
                        }), (0, g.jsxs)(tT.Modal.Body, {
                            className: "cancel-error-body",
                            children: [o("Response.Subscriptions.CancelUnknownError"), (0, g.jsx)("span", {
                                className: "icon-status-alert-xl"
                            })]
                        }), (0, g.jsx)(tT.Modal.Footer, {
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

            function nU(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nL(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
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
                        if ("string" == typeof e) return nU(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nU(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var n_ = function(e) {
                var t = e.className,
                    r = e.subscription,
                    n = e.onResubscribe,
                    i = e.isPremium,
                    a = void 0 !== i && i,
                    o = e.assumeEligible,
                    s = void 0 !== o && o,
                    u = (0, T.useTranslation)().translate,
                    c = nL((0, w.useState)(s), 2),
                    l = c[0],
                    d = c[1],
                    p = nL((0, w.useState)(!1), 2),
                    f = p[0],
                    h = p[1],
                    m = nL((0, w.useState)(!1), 2),
                    b = m[0],
                    y = m[1],
                    v = r8().systemFeedbackService;
                (0, w.useEffect)(function() {
                    if (!s) {
                        var e;
                        (e = {
                            subscriptionProductTargetKey: r.subscriptionTargetKey
                        }, tp(function() {
                            return th(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        return t.trys.push([0, 2, , 3]), [4, N.httpService.get(ts.url.getSubscriptionResubscribeEligibility(e.subscriptionProductTargetKey))];
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
                    x = a ? rc(r) : r.subscriptionPeriod || te.MONTH,
                    E = a ? void 0 : r.periodCount,
                    C = !a && "priceInRobux" in r ? r.priceInRobux : null,
                    O = null != C && C > 0;
                return (0, g.jsxs)(P().Fragment, {
                    children: [l && (0, g.jsx)("button", {
                        type: "button",
                        className: t,
                        onClick: function() {
                            !a && "subscriptionTargetKey" in r && ns(na.CLICK_RESUBSCRIBE, r), h(!0)
                        },
                        "data-testid": "resubscribe",
                        children: u("Action.Resubscribe")
                    }), (0, g.jsxs)(tT.Modal, {
                        show: f,
                        onHide: function() {
                            return h(!1)
                        },
                        children: [(0, g.jsx)(tT.Modal.Header, {
                            className: "resubscribe-modal-header",
                            title: u("Action.Resubscribe"),
                            showCloseButton: !0,
                            onClose: function() {
                                return h(!1)
                            }
                        }), (0, g.jsx)(tT.Modal.Body, {
                            className: "resubscribe-modal-body",
                            children: function() {
                                if (O) return (0, g.jsx)("div", {
                                    children: (0, g.jsxs)("div", {
                                        className: "description-top",
                                        children: [(0, g.jsx)("span", {
                                            children: u("Message.Subscriptions.ResubscribeConfirmationP1", {
                                                subscriptionName: r.name,
                                                subscriptionRenewalDate: S
                                            })
                                        }), " ", (0, g.jsxs)("span", {
                                            children: [u("Message.Subscriptions.ResubscribeConfirmationP2"), " "]
                                        }), (0, g.jsx)(t3, {
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
                                                children: u("Message.Subscriptions.ResubscribeConfirmationP1", {
                                                    subscriptionName: r.name,
                                                    subscriptionRenewalDate: S
                                                })
                                            }), (0, g.jsxs)("div", {
                                                className: "resubscribe-payment-container",
                                                children: [(0, g.jsx)("span", {
                                                    className: tE()("resubscribe-card-icon", rr(r.purchasePlatform, r.paymentProvider, r.cardInfo))
                                                }), (0, g.jsx)("span", {
                                                    className: "card-four-digits",
                                                    children: e
                                                })]
                                            }), (0, g.jsxs)("span", {
                                                children: [u("Message.Subscriptions.ResubscribeConfirmationP2"), " "]
                                            }), (0, g.jsx)(t2, {
                                                price: r.price,
                                                period: x,
                                                periodCount: E,
                                                className: "resubscribe"
                                            })]
                                        }), (0, g.jsx)("div", {
                                            className: "description-bottom",
                                            children: u("Message.Subscriptions.ResubscribeConfirmationP3")
                                        })]
                                    })
                                }
                                return (0, g.jsx)("div", {})
                            }()
                        }), (0, g.jsxs)(tT.Modal.Footer, {
                            className: "resubscribe-modal-footer",
                            children: [(0, g.jsx)("button", {
                                type: "button",
                                className: "btn-secondary-md btn-full-width",
                                onClick: function() {
                                    return h(!1)
                                },
                                children: u("Action.Cancel")
                            }), (0, g.jsx)("button", {
                                type: "button",
                                className: "btn-cta-md btn-full-width",
                                onClick: function() {
                                    var e;
                                    h(!1), (e = {
                                        subscriptionProductTargetKey: r.subscriptionTargetKey
                                    }, tp(function() {
                                        var t;
                                        return th(this, function(r) {
                                            switch (r.label) {
                                                case 0:
                                                    return t = ts.url.resubscribeSubscription(e.subscriptionProductTargetKey), [4, N.httpService.post(t)];
                                                case 1:
                                                    return r.sent(), [2]
                                            }
                                        })
                                    })()).then(function() {
                                        v.success(u("Response.Subscriptions.ResubscribeSuccess")), d(!1), n && n(a, "subscriptionTargetKey" in r ? r.subscriptionTargetKey : void 0), !a && "subscriptionTargetKey" in r && ns(na.RESUBSCRIBE_SUCCESS, r)
                                    }).catch(function() {
                                        return y(!0)
                                    })
                                },
                                children: u("Action.Resubscribe")
                            })]
                        })]
                    }), (0, g.jsxs)(tT.Modal, {
                        show: b,
                        onHide: function() {
                            return y(!1)
                        },
                        children: [(0, g.jsx)(tT.Modal.Header, {
                            className: "resubscribe-modal-header",
                            title: u("Heading.Dialog.DefaultError"),
                            showCloseButton: !0,
                            onClose: function() {
                                return y(!1)
                            }
                        }), (0, g.jsxs)(tT.Modal.Body, {
                            className: "resubscribe-error-body",
                            children: [u("Error.GenericError"), (0, g.jsx)("span", {
                                className: "icon-status-alert-xl"
                            })]
                        }), (0, g.jsx)(tT.Modal.Footer, {
                            className: "resubscribe-modal-footer",
                            children: (0, g.jsx)("button", {
                                type: "button",
                                className: "btn-cta-md btn-full-width",
                                onClick: function() {
                                    return y(!1)
                                },
                                children: u("Action.Dialog.Success")
                            })
                        })]
                    })]
                })
            };

            function nB(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nF(e) {
                if (Array.isArray(e)) return e
            }

            function nY() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function nq(e) {
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

            function nH(e, t) {
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

            function nV(e, t) {
                if (null == e) return {};
                var r, n, i, a = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (i = 0, r = Reflect.ownKeys(Object(e)); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                    return a
                }
                if (a = function(e, t) {
                        if (null == e) return {};
                        var r, n, i = {},
                            a = Object.getOwnPropertyNames(e);
                        for (n = 0; n < a.length; n++) r = a[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (i[r] = e[r]);
                        return i
                    }(e, t), Object.getOwnPropertySymbols)
                    for (i = 0, r = Object.getOwnPropertySymbols(e); i < r.length; i++) n = r[i], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n]);
                return a
            }

            function nW(e, t) {
                if (e) {
                    if ("string" == typeof e) return nB(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nB(e, t)
                }
            }
            var nG = {
                    Large: "size-1200",
                    Medium: "size-1000",
                    Small: "size-800",
                    XSmall: "size-600"
                },
                nK = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-700"
                },
                nz = {
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
                nX = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-alert",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                nQ = {
                    Emphasis: "bg-action-standard",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                n$ = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-shift-300",
                    OverMedia: "bg-over-media-0"
                },
                nJ = {
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
                nZ = {
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
                n0 = (0, w.forwardRef)(function(e, t) {
                    var r, n, i = nF(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || nW(r) || nY(),
                        a = i[0],
                        o = i.slice(1),
                        s = a.className,
                        u = a.icon,
                        c = a.ariaLabel,
                        l = a.isDisabled,
                        d = void 0 !== l && l,
                        p = a.isCircular,
                        f = a.isSelected,
                        h = a.size,
                        m = void 0 === h ? "Large" : h,
                        b = a.variant,
                        y = void 0 === b ? "Emphasis" : b,
                        v = a.iconColor,
                        g = void 0 === v ? "Default" : v,
                        w = a.asChild,
                        S = a.children,
                        x = nV(a, ["className", "icon", "ariaLabel", "isDisabled", "isCircular", "isSelected", "size", "variant", "iconColor", "asChild", "children"]),
                        E = (nF(o) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    a = !0,
                                    o = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (i.push(t.value), 1 !== i.length); a = !0);
                                } catch (e) {
                                    o = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (o) throw r
                                    }
                                }
                                return i
                            }
                        }(o) || nW(o, 1) || nY())[0];
                    n = d ? nQ[y] : void 0 !== f && f ? n$[y] : nX[y];
                    var T = tO("foundation-web-icon-button", d ? tU : [tR, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", nG[m], nz[m][void 0 !== p && p ? "circular" : "square"], n, s),
                        C = P().createElement(P().Fragment, null, P().createElement(tM, null), P().createElement("span", {
                            className: tO("icon", u, nK[m], d ? nZ[g][y] : nJ[g][y])
                        }));
                    if (w) {
                        x.as;
                        var O = nV(x, ["as"]),
                            A = P().Children.only(S);
                        return P().createElement(rY, nH(nq({
                            ref: E
                        }, O), {
                            className: T,
                            "aria-label": c,
                            "aria-disabled": d || void 0
                        }), P().cloneElement(A, {}, C))
                    }
                    if ("a" === x.as) {
                        x.as;
                        var I = x.href,
                            j = nV(x, ["as", "href"]);
                        return P().createElement("a", nH(nq({
                            ref: E
                        }, j), {
                            "aria-label": c,
                            "aria-disabled": d,
                            href: d ? void 0 : I,
                            className: T
                        }), C)
                    }
                    x.as;
                    var k = nV(x, ["as"]);
                    return P().createElement("button", nH(nq({
                        ref: E,
                        type: "button"
                    }, k), {
                        "aria-label": c,
                        disabled: d,
                        className: T
                    }), C)
                }),
                n1 = function(e) {
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
                    var u = null;
                    if ((t === tt.DESKTOP || t === e7.DESKTOP) && n && r === tn.STRIPE) {
                        var c = new Date(n.expYear, n.expMonth - 1),
                            l = "".concat(s("Label.SavedCreditCard.Exp"), " ").concat(c.toLocaleDateString(void 0, {
                                month: "2-digit",
                                year: "2-digit"
                            })),
                            d = "****".concat(n.last4Digits);
                        u = (0, g.jsxs)(w.Fragment, {
                            children: [(0, g.jsx)("span", {
                                className: "card-four-digits",
                                children: d
                            }), (0, g.jsx)("span", {
                                className: "card-expiraton text-description",
                                children: l
                            }), r === tn.STRIPE && a && (0, g.jsx)(n0, {
                                className: "edit-payment-method-button",
                                icon: "icon-regular-pencil-square",
                                ariaLabel: s("Action.EditPaymentMethod"),
                                title: s("Action.EditPaymentMethod"),
                                size: "Small",
                                variant: "Utility",
                                onClick: o
                            })]
                        })
                    } else if (t === tt.DESKTOP && r === tn.CREDITBALANCE) u = (0, g.jsxs)("span", {
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
                            case tt.DESKTOP:
                                p = r === tn.BRAINTREE ? s("Label.Subscriptions.PaypalPayment") || "Paypal" : s("Label.Subscriptions.DesktopPayment");
                                break;
                            case tt.APPLE:
                                p = s("Label.Subscriptions.ApplePayment");
                                break;
                            case tt.GOOGLE:
                                p = s("Label.Subscriptions.GooglePayment")
                        }
                        u = (0, g.jsx)("span", {
                            className: "purchase-platform-text text-description",
                            children: p
                        })
                    }
                    return (0, g.jsxs)("div", {
                        className: "payment-method-container",
                        children: [(0, g.jsx)("span", {
                            className: tE()("card-icon", rr(t, r, n))
                        }), u]
                    })
                };

            function n2(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var n3 = ((m = {}).ERROR = "error", m.WARNING = "warning", m),
                n4 = function(e) {
                    var t, r = e.title,
                        n = e.body,
                        i = e.bannerType,
                        a = e.showDismiss,
                        o = e.onDismiss,
                        s = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, w.useState)("")) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    a = !0,
                                    o = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (i.push(t.value), 2 !== i.length); a = !0);
                                } catch (e) {
                                    o = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (o) throw r
                                    }
                                }
                                return i
                            }
                        }(t) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return n2(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return n2(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        u = s[0],
                        c = s[1];
                    return (0, w.useEffect)(function() {
                        switch (i) {
                            case "warning":
                                c("warning-banner");
                                break;
                            case "error":
                                c("error-banner")
                        }
                    }, [i]), (0, g.jsxs)("div", {
                        className: "banner-container ".concat(u),
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

            function n6(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function n5(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
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
                        if ("string" == typeof e) return n6(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return n6(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var n8 = function(e) {
                var t = e.type,
                    r = e.onNotificationDismiss,
                    n = (0, T.useTranslation)().translate,
                    i = n5((0, w.useState)(n3.WARNING), 2),
                    a = i[0],
                    o = i[1],
                    s = n5((0, w.useState)(""), 2),
                    u = s[0],
                    c = s[1];
                return (0, w.useEffect)(function() {
                    switch (t) {
                        case t5.LOW_BALANCE_WARNING:
                            o(n3.WARNING), c(n("Banner.Header.LowBalanceWarning"));
                            break;
                        case t5.LOW_BALANCE_GRACE_PERIOD:
                            o(n3.ERROR), c(n("Banner.Header.InsufficientBalance"))
                    }
                }, [n, t]), (0, g.jsx)(n4, {
                    title: u,
                    body: (0, g.jsx)("span", {
                        className: "font-caption-header banner-body",
                        dangerouslySetInnerHTML: {
                            __html: n("Banner.Message.LowBalance", {
                                redeemUrlStartTag: "<a href=".concat(r4, ' class="text-link" target="_blank">'),
                                redeemUrlEndTag: "</a>",
                                giftCardUrlStartTag: "<a href=".concat(r6, ' class="text-link" target="_blank">'),
                                giftCardUrlEndTag: "</a>"
                            })
                        }
                    }),
                    bannerType: a,
                    showDismiss: !0,
                    onDismiss: r
                })
            };

            function n7(e, t, r, n, i, a, o) {
                try {
                    var s = e[a](o),
                        u = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(u) : Promise.resolve(u).then(n, i)
            }
            var n9 = function(e) {
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
                            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                            s = Object.defineProperty;
                        return s(o, "next", {
                            value: u(0)
                        }), s(o, "throw", {
                            value: u(1)
                        }), s(o, "return", {
                            value: u(2)
                        }), "function" == typeof Symbol && s(o, Symbol.iterator, {
                            value: function() {
                                return this
                            }
                        }), o;

                        function u(s) {
                            return function(u) {
                                var c = [s, u];
                                if (r) throw TypeError("Generator is already executing.");
                                for (; o && (o = 0, c[0] && (a = 0)), a;) try {
                                    if (r = 1, n && (i = 2 & c[0] ? n.return : c[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, c[1])).done) return i;
                                    switch (n = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                                        case 0:
                                        case 1:
                                            i = c;
                                            break;
                                        case 4:
                                            return a.label++, {
                                                value: c[1],
                                                done: !1
                                            };
                                        case 5:
                                            a.label++, n = c[1], c = [0];
                                            continue;
                                        case 7:
                                            c = a.ops.pop(), a.trys.pop();
                                            continue;
                                        default:
                                            if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                a = 0;
                                                continue
                                            }
                                            if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                                a.label = c[1];
                                                break
                                            }
                                            if (6 === c[0] && a.label < i[1]) {
                                                a.label = i[1], i = c;
                                                break
                                            }
                                            if (i && a.label < i[2]) {
                                                a.label = i[2], a.ops.push(c);
                                                break
                                            }
                                            i[2] && a.ops.pop(), a.trys.pop();
                                            continue
                                    }
                                    c = t.call(e, a)
                                } catch (e) {
                                    c = [6, e], n = 0
                                } finally {
                                    r = i = 0
                                }
                                if (5 & c[0]) throw c[1];
                                return {
                                    value: c[0] ? c[1] : void 0,
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
                                return [2, null != (t = null == (n = i.sent().data.data) || null == (r = n[0]) ? void 0 : r.rootPlaceId) ? t : null];
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
                            n7(a, n, i, o, s, "next", e)
                        }

                        function s(e) {
                            n7(a, n, i, o, s, "throw", e)
                        }
                        o(void 0)
                    })
                })()
            };

            function ie(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function it(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
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
                        if ("string" == typeof e) return ie(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ie(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var ir = function(e, t) {
                    return t
                },
                ii = function(e) {
                    var t, r = e.subscription,
                        n = e.isPremium,
                        i = e.creditBalance,
                        a = e.subscriptionMetadata,
                        o = e.onStatusChange,
                        s = e.onNotificationDismiss,
                        u = e.onBack,
                        c = e.onEditPaymentMethodClick,
                        l = e.blackbirdProductInfo,
                        d = e.isFaeFreeTrial,
                        p = void 0 !== d && d,
                        f = (0, T.useTranslation)().translate,
                        h = it((0, w.useState)(null), 2),
                        m = h[0],
                        b = h[1],
                        y = it((0, w.useState)(!1), 2),
                        v = y[0],
                        P = y[1],
                        S = it((0, w.useState)(!1), 2),
                        x = S[0],
                        E = S[1],
                        C = !ir(r, n) && r.productType === e1,
                        O = (0, w.useCallback)(function(e) {
                            e.preventDefault(), !ir(r, n) && r.providerId && n9(r.providerId).then(function(e) {
                                e && (window.location.href = "/games/".concat(e))
                            }).catch(function() {})
                        }, [r, n]);
                    (0, w.useEffect)(function() {
                        var e;
                        b(t8(null != (e = r.showLowBalanceNotification) && e, r.renewal, r.expiration))
                    }, [r]), (0, w.useEffect)(function() {
                        if (r.cardInfo) {
                            var e = new Date(r.cardInfo.expYear, r.cardInfo.expMonth - 1),
                                t = new Date;
                            P(e < new Date(t.getFullYear(), t.getMonth() + 1))
                        }
                    }, [r]);
                    var j = ir(r, n) ? rc(r) : r.subscriptionPeriod || te.MONTH,
                        k = function() {
                            if (ir(r, n)) return rl(r);
                            switch (r.productType) {
                                case e1:
                                    if (r.currencySubscriptionBenefit && r.currencySubscriptionBenefit.entitledAmountMicrosPerGrantingPeriod > 0) return "Plus ".concat(r.currencySubscriptionBenefit.entitledAmountMicrosPerGrantingPeriod / 1e6);
                                    return f("Label.Blackbird");
                                case e0:
                                    return f("Label.CurrencySubscription");
                                default:
                                    return r.name
                            }
                        }(),
                        D = ir(r, n) && (r.purchasePlatform === e7.IOS_APP || r.purchasePlatform === e7.ANDROID_APP);
                    return (0, g.jsx)("div", {
                        children: (0, g.jsxs)("div", {
                            className: "subscription-details-container",
                            children: [(0, g.jsxs)("button", {
                                type: "button",
                                onClick: u,
                                className: "details-back-button btn-generic-back-sm",
                                children: [(0, g.jsx)("span", {
                                    className: "icon-back"
                                }), f("Action.Back")]
                            }), m && r.showLowBalanceNotification && (0, g.jsx)("div", {
                                className: "margin-bottom-medium",
                                style: {
                                    gridColumn: "1 / 2"
                                },
                                children: (0, g.jsx)(n8, {
                                    type: m,
                                    onNotificationDismiss: function() {
                                        return s(ir(r, n) ? "PRM-".concat(r.premiumFeatureId) : r.subscriptionTargetKey)
                                    }
                                })
                            }), !r.showLowBalanceNotification && r.cardInfo && r.paymentProvider === tn.STRIPE && v && (0, g.jsx)("div", {
                                className: "margin-bottom-medium",
                                style: {
                                    gridColumn: "1 / 2"
                                },
                                children: (0, g.jsx)(n4, {
                                    title: f("Heading.PaymentMethodAboutToExpire"),
                                    body: (0, g.jsx)("span", {
                                        className: "font-caption-header banner-body",
                                        children: f("Description.UpdatePaymentMethodToAvoidCancellation")
                                    }),
                                    bannerType: n3.WARNING,
                                    showDismiss: !1,
                                    onDismiss: function() {
                                        return P(!1)
                                    }
                                })
                            }), C && !1, C && p && (0, g.jsx)("div", {
                                className: "margin-bottom-large",
                                style: {
                                    gridColumn: "1 / 2"
                                },
                                children: (0, g.jsx)(r3, {
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
                                    className: tE()("detail-card-icon-container", {
                                        "detail-card-icon-container--blackbird": C
                                    }),
                                    children: ir(r, n) ? (0, g.jsx)("span", {
                                        className: "premium-icon"
                                    }) : r.productType === e1 ? (0, g.jsx)(tN, {
                                        className: "!size-900",
                                        name: "icon-regular-roblox-plus"
                                    }) : r.productType === e0 ? (0, g.jsx)("span", {
                                        className: "premium-icon"
                                    }) : (0, g.jsx)(tC.Thumbnail2d, {
                                        targetId: null != (t = r.iconImageAssetId) ? t : 0,
                                        type: tC.ThumbnailTypes.assetThumbnail,
                                        imgClassName: "detail-icon",
                                        containerClass: "thumbnail-detail-container",
                                        altName: r.name
                                    })
                                }), (0, g.jsx)("h2", {
                                    className: "detail-subscription-name",
                                    children: k
                                }), !ir(r, n) && r.providerId ? (0, g.jsx)(A.Link, {
                                    href: "/games/".concat(r.providerId),
                                    onClick: O,
                                    underline: "hover",
                                    className: "text-description",
                                    children: r.subscriptionProviderName
                                }) : (0, g.jsx)("span", {
                                    className: "detail-subscription-proider text-description",
                                    children: r.subscriptionProviderName
                                }), !ir(r, n) && null != r.priceInRobux && r.priceInRobux > 0 ? (0, g.jsx)(t3, {
                                    priceInRobux: r.priceInRobux
                                }) : r.price && r.purchasePlatform !== tt.INTERNAL && (0, g.jsx)(t2, {
                                    price: r.price,
                                    period: j,
                                    periodCount: ir(r, n) ? void 0 : r.periodCount,
                                    className: "subscription"
                                }), (0, g.jsxs)("div", {
                                    className: "subscription-billing-cycle-info",
                                    children: [(0, g.jsx)(t4, {
                                        expiration: r.expiration,
                                        renewal: r.renewal
                                    }), ri(r.subscriptionOffers) && (0, g.jsx)(t1, {
                                        as: "button",
                                        isChecked: !1,
                                        size: "Small",
                                        text: f("Label.FreeTrial"),
                                        variant: "Standard"
                                    })]
                                }), !ir(r, n) && !(null != r.priceInRobux && r.priceInRobux > 0) && r.purchasePlatform !== tt.INTERNAL && (0, g.jsx)(n1, {
                                    purchasePlatform: r.purchasePlatform,
                                    paymentProvider: r.paymentProvider,
                                    cardInfo: r.cardInfo,
                                    creditBalance: i,
                                    isPaymentProfileEditingAllowed: a.isSubscriptionPaymentProfileUpdatingEnabled,
                                    onEditClick: c
                                }), ir(r, n) && r.paymentProfileId && (0, g.jsx)(n1, {
                                    purchasePlatform: r.purchasePlatform,
                                    paymentProvider: r.paymentProvider,
                                    cardInfo: r.cardInfo,
                                    creditBalance: i,
                                    isPaymentProfileEditingAllowed: a.isSubscriptionPaymentProfileUpdatingEnabled,
                                    onEditClick: c
                                }), D && (0, g.jsx)("p", {
                                    dangerouslySetInnerHTML: {
                                        __html: f("Message.Subscriptions.PremiumAppStoreCancel", {
                                            aTagStartWithHref: "<a href=",
                                            cancelHelpPagesLink: '"'.concat("https://help.roblox.com/hc/articles/360029312472", '"'),
                                            hrefEnd: ' class="text-link" target="_blank">',
                                            aTagEnd: "</a>"
                                        })
                                    }
                                })]
                            }), rn(r.renewal, r.expiration) ? (0, g.jsx)(n_, {
                                subscription: r,
                                onResubscribe: function() {
                                    return o ? o(n, !1, r.subscriptionTargetKey) : void 0
                                },
                                isPremium: n,
                                assumeEligible: x,
                                className: "resubscribe btn-cta-md"
                            }) : (0, g.jsx)(nM, {
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
                                    if (ir(r, n)) return (0, g.jsxs)("div", {
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
                                        case e1:
                                            if (l) return (0, g.jsx)("div", {
                                                className: "detail-description content-default",
                                                children: (0, g.jsx)(I.TranslationProvider, {
                                                    config: ["Feature.RobloxSubscription"],
                                                    children: (0, g.jsx)(rI, {
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
                                        case e0:
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
                        })
                    })
                };

            function ia(e, t, r, n, i, a, o) {
                try {
                    var s = e[a](o),
                        u = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(u) : Promise.resolve(u).then(n, i)
            }

            function io(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, i) {
                        var a = e.apply(t, r);

                        function o(e) {
                            ia(a, n, i, o, s, "next", e)
                        }

                        function s(e) {
                            ia(a, n, i, o, s, "throw", e)
                        }
                        o(void 0)
                    })
                }
            }

            function is(e, t) {
                var r, n, i, a = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    s = Object.defineProperty;
                return s(o, "next", {
                    value: u(0)
                }), s(o, "throw", {
                    value: u(1)
                }), s(o, "return", {
                    value: u(2)
                }), "function" == typeof Symbol && s(o, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), o;

                function u(s) {
                    return function(u) {
                        var c = [s, u];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; o && (o = 0, c[0] && (a = 0)), a;) try {
                            if (r = 1, n && (i = 2 & c[0] ? n.return : c[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, c[1])).done) return i;
                            switch (n = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                                case 0:
                                case 1:
                                    i = c;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                        a.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && a.label < i[1]) {
                                        a.label = i[1], i = c;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(c);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            c = t.call(e, a)
                        } catch (e) {
                            c = [6, e], n = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var iu = r(696),
                ic = r(199);

            function il(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var id = "Error.GenericError";

            function ip(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ih(e, t, r, n, i, a, o) {
                try {
                    var s = e[a](o),
                        u = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(u) : Promise.resolve(u).then(n, i)
            }

            function im(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
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
                        if ("string" == typeof e) return ip(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ip(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            il(v = {}, tr.INVALID, id), il(v, tr.INVALID_INPUT, id), il(v, tr.INVALID_PRODUCT, id), il(v, tr.INVALID_SALE_LOCATION, id), il(v, tr.PURCHASE_PLATFORM_NOT_SUPPORTED, id), il(v, tr.RESTRICTED_USER, "Message.CannotPlayInExperience"), il(v, tr.SAVED_CC_REQUIRED, id), il(v, tr.UNKNOWN, id), il(v, tr.UNSUPPORTED_LOCALE, "Message.SubscriptionNotAvailableInCountry"), il(v, tr.USER_ALREADY_SUBSCRIBED, id), il(v, tr.USER_HAS_SPEND_LIMIT_SET, "Message.MonthlySpendRestrictions.SubscriptionUnavailable"), il(v, tr.EXCEED_PARENTAL_SPEND_LIMIT, "Message.MonthlySpendRestrictionsMonthlyLimitExceed"), il(v, tr.VPC_PENDING_APPROVAL, id), il(v, tr.VPC_REQUIRED, "Message.ParentPermissionVPC");
            var ib = function(e) {
                var t = e.children,
                    r = im((0, w.useState)(null), 2),
                    n = r[0],
                    i = r[1],
                    a = im((0, w.useState)(""), 2),
                    o = a[0],
                    s = a[1],
                    u = r8().systemFeedbackService,
                    c = (0, T.useTranslation)().translate;
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
                                o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                s = Object.defineProperty;
                            return s(o, "next", {
                                value: u(0)
                            }), s(o, "throw", {
                                value: u(1)
                            }), s(o, "return", {
                                value: u(2)
                            }), "function" == typeof Symbol && s(o, Symbol.iterator, {
                                value: function() {
                                    return this
                                }
                            }), o;

                            function u(s) {
                                return function(u) {
                                    var c = [s, u];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; o && (o = 0, c[0] && (a = 0)), a;) try {
                                        if (r = 1, n && (i = 2 & c[0] ? n.return : c[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, c[1])).done) return i;
                                        switch (n = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                                            case 0:
                                            case 1:
                                                i = c;
                                                break;
                                            case 4:
                                                return a.label++, {
                                                    value: c[1],
                                                    done: !1
                                                };
                                            case 5:
                                                a.label++, n = c[1], c = [0];
                                                continue;
                                            case 7:
                                                c = a.ops.pop(), a.trys.pop();
                                                continue;
                                            default:
                                                if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                    a = 0;
                                                    continue
                                                }
                                                if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                                    a.label = c[1];
                                                    break
                                                }
                                                if (6 === c[0] && a.label < i[1]) {
                                                    a.label = i[1], i = c;
                                                    break
                                                }
                                                if (i && a.label < i[2]) {
                                                    a.label = i[2], a.ops.push(c);
                                                    break
                                                }
                                                i[2] && a.ops.pop(), a.trys.pop();
                                                continue
                                        }
                                        c = t.call(e, a)
                                    } catch (e) {
                                        c = [6, e], n = 0
                                    } finally {
                                        r = i = 0
                                    }
                                    if (5 & c[0]) throw c[1];
                                    return {
                                        value: c[0] ? c[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(t) {
                            switch (t.label) {
                                case 0:
                                    return t.trys.push([0, 3, , 4]), e = x.EnvironmentUrls.websiteUrl.includes("sitetest1") ? "pk_test_51LNM0XG5RADBkfjhYJlpADA2ArzWIh7gTWTodYNbpEzSiT55dul3VJhaBIVHL0CNyO0gECOz1vPnWArAkjwQ8NBO00Cdf2PxED" : x.EnvironmentUrls.websiteUrl.includes("sitetest3") ? "pk_test_51LNOeQHDRNiW7vlLcKH8TGCpJ7zhaidLdSegE22GCuvQbVUX2xDiGJY6WYaldYyo6qgVxmy1SnSVpSdaqyjfqclU00NQwWntIe" : "pk_live_51LKpO9C8tJWGhK4HEHtny9Dg7xXiQJ1i349cq6KBDusbl8bRHO7QmCKKhX18LPjSirMNTvj3tesq6mhIQuPioeAd0062ZCgoF3", [4, (0, iu.loadStripe)(e)];
                                case 1:
                                    return i(t.sent()), [4, io(function() {
                                        var e, t, r, n;
                                        return is(this, function(i) {
                                            switch (i.label) {
                                                case 0:
                                                    return [4, N.httpService.post(ts.url.getPaymentProfileSetupUrlConfig(), {
                                                        paymentProvider: "Stripe"
                                                    })];
                                                case 1:
                                                    return [2, null != (e = null == (n = i.sent()) || null == (r = n.data) || null == (t = r.providerPayload) ? void 0 : t.clientSecret) ? e : ""]
                                            }
                                        })
                                    })()];
                                case 2:
                                    return s(t.sent()), [3, 4];
                                case 3:
                                    return t.sent(), u.warning(c(id)), [3, 4];
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
                                ih(a, n, i, o, s, "next", e)
                            }

                            function s(e) {
                                ih(a, n, i, o, s, "throw", e)
                            }
                            o(void 0)
                        })
                    })()
                }, [u, c]), n && o) ? (0, g.jsx)(ic.Elements, {
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

            function iy(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iv(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
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
                        if ("string" == typeof e) return iy(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return iy(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var ig = function(e) {
                var t = e.onFormStatusChange,
                    r = e.showEmail,
                    n = e.showDisclosure,
                    i = e.headerText,
                    a = iv((0, w.useState)(!1), 2),
                    o = a[0],
                    s = a[1],
                    u = (0, T.useTranslation)().translate,
                    c = (0, ic.useElements)(),
                    l = (0, w.useRef)(null),
                    d = (0, w.useRef)(null),
                    p = iv((0, w.useState)(""), 2),
                    f = p[0],
                    h = p[1],
                    m = iv((0, w.useState)(!1), 2),
                    b = m[0],
                    y = m[1],
                    v = iv((0, w.useState)(!1), 2),
                    P = v[0],
                    S = v[1],
                    x = {
                        __html: u("Message.StripeAddPaymentMethodDisclosure", {
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
                    if (!l.current && (l.current = null == c ? void 0 : c.getElement("payment"), l.current)) {
                        var e;
                        l.current.on("ready", function() {
                            var e;
                            null == (e = l.current) || e.clear()
                        }), null == (e = l.current) || e.on("change", function(e) {
                            y(e.complete)
                        })
                    }!d.current && (d.current = null == c ? void 0 : c.getElement("address"), d.current && (d.current.on("ready", function() {
                        var e;
                        null == (e = d.current) || e.clear()
                    }), d.current.on("change", function(e) {
                        S(e.complete)
                    })))
                }, [c]), (0, w.useEffect)(function() {
                    t(b && P && !o && (!r || "" !== f))
                }, [b, P, f, o, t, r]), (0, g.jsxs)("div", {
                    children: [i && (0, g.jsx)("div", {
                        className: "font-header-2 text-emphasis stripe-header",
                        children: i
                    }), (0, g.jsx)(ic.PaymentElement, {
                        options: {
                            wallets: {
                                applePay: "never",
                                googlePay: "never"
                            }
                        }
                    }), r && (0, g.jsxs)(w.Fragment, {
                        children: [(0, g.jsx)("div", {
                            className: "font-header-2 text-emphasis stripe-header billing-email-header",
                            children: u("Heading.BillingEmail")
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
                                children: u("Message.StripeEmailInputSubText")
                            })
                        })]
                    }), (0, g.jsx)("div", {
                        className: "font-header-2 text-emphasis stripe-header",
                        children: u("Heading.BillingAddress")
                    }), (0, g.jsx)(ic.AddressElement, {
                        options: {
                            mode: "billing"
                        }
                    }), n && (0, g.jsx)("div", {
                        className: "form-control-label small text stripe-form-disclosure",
                        dangerouslySetInnerHTML: x
                    })]
                })
            };

            function iw(e) {
                return (iw = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                    return typeof e
                } : function(e) {
                    return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
                })(e)
            }

            function iP(e, t) {
                if (t.length < e) throw TypeError(e + " argument" + (e > 1 ? "s" : "") + " required, but only " + t.length + " present")
            }

            function iS(e) {
                iP(1, arguments);
                var t, r = Object.prototype.toString.call(e);
                return (null != (t = Date) && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t) || "object" === iw(e) && "[object Date]" === r ? new Date(e.getTime()) : "number" == typeof e || "[object Number]" === r ? new Date(e) : (("string" == typeof e || "[object String]" === r) && "u" > typeof console && (console.warn("Starting with v2.0.0-beta.1 date-fns doesn't accept strings as date arguments. Please use `parseISO` to parse strings. See: https://github.com/date-fns/date-fns/blob/master/docs/upgradeGuide.md#string-arguments"), console.warn(Error().stack)), new Date(NaN))
            }

            function ix(e) {
                if (null === e || !0 === e || !1 === e) return NaN;
                var t = Number(e);
                return isNaN(t) ? t : t < 0 ? Math.ceil(t) : Math.floor(t)
            }

            function iE(e, t) {
                return iP(2, arguments),
                    function(e, t) {
                        return iP(2, arguments), new Date(iS(e).getTime() + ix(t))
                    }(e, -ix(t))
            }

            function iT(e) {
                iP(1, arguments);
                var t = iS(e),
                    r = t.getUTCDay();
                return t.setUTCDate(t.getUTCDate() - (7 * (r < 1) + r - 1)), t.setUTCHours(0, 0, 0, 0), t
            }

            function iC(e) {
                iP(1, arguments);
                var t = iS(e),
                    r = t.getUTCFullYear(),
                    n = new Date(0);
                n.setUTCFullYear(r + 1, 0, 4), n.setUTCHours(0, 0, 0, 0);
                var i = iT(n),
                    a = new Date(0);
                a.setUTCFullYear(r, 0, 4), a.setUTCHours(0, 0, 0, 0);
                var o = iT(a);
                return t.getTime() >= i.getTime() ? r + 1 : t.getTime() >= o.getTime() ? r : r - 1
            }

            function iO(e) {
                iP(1, arguments);
                var t = iS(e);
                return Math.round((iT(t).getTime() - (function(e) {
                    iP(1, arguments);
                    var t = iC(e),
                        r = new Date(0);
                    return r.setUTCFullYear(t, 0, 4), r.setUTCHours(0, 0, 0, 0), iT(r)
                })(t).getTime()) / 6048e5) + 1
            }
            ig.defaultProps = {
                headerText: ""
            };
            var iA = {};

            function iI(e, t) {
                iP(1, arguments);
                var r, n, i, a, o, s, u, c, l = ix(null != (r = null != (n = null != (i = null != (a = null == t ? void 0 : t.weekStartsOn) ? a : null == t || null == (o = t.locale) || null == (s = o.options) ? void 0 : s.weekStartsOn) ? i : iA.weekStartsOn) ? n : null == (u = iA.locale) || null == (c = u.options) ? void 0 : c.weekStartsOn) ? r : 0);
                if (!(l >= 0 && l <= 6)) throw RangeError("weekStartsOn must be between 0 and 6 inclusively");
                var d = iS(e),
                    p = d.getUTCDay();
                return d.setUTCDate(d.getUTCDate() - (7 * (p < l) + p - l)), d.setUTCHours(0, 0, 0, 0), d
            }

            function ij(e, t) {
                iP(1, arguments);
                var r, n, i, a, o, s, u, c, l = iS(e),
                    d = l.getUTCFullYear(),
                    p = ix(null != (r = null != (n = null != (i = null != (a = null == t ? void 0 : t.firstWeekContainsDate) ? a : null == t || null == (o = t.locale) || null == (s = o.options) ? void 0 : s.firstWeekContainsDate) ? i : iA.firstWeekContainsDate) ? n : null == (u = iA.locale) || null == (c = u.options) ? void 0 : c.firstWeekContainsDate) ? r : 1);
                if (!(p >= 1 && p <= 7)) throw RangeError("firstWeekContainsDate must be between 1 and 7 inclusively");
                var f = new Date(0);
                f.setUTCFullYear(d + 1, 0, p), f.setUTCHours(0, 0, 0, 0);
                var h = iI(f, t),
                    m = new Date(0);
                m.setUTCFullYear(d, 0, p), m.setUTCHours(0, 0, 0, 0);
                var b = iI(m, t);
                return l.getTime() >= h.getTime() ? d + 1 : l.getTime() >= b.getTime() ? d : d - 1
            }

            function ik(e, t) {
                iP(1, arguments);
                var r = iS(e);
                return Math.round((iI(r, t).getTime() - (function(e, t) {
                    iP(1, arguments);
                    var r, n, i, a, o, s, u, c, l = ix(null != (r = null != (n = null != (i = null != (a = null == t ? void 0 : t.firstWeekContainsDate) ? a : null == t || null == (o = t.locale) || null == (s = o.options) ? void 0 : s.firstWeekContainsDate) ? i : iA.firstWeekContainsDate) ? n : null == (u = iA.locale) || null == (c = u.options) ? void 0 : c.firstWeekContainsDate) ? r : 1),
                        d = ij(e, t),
                        p = new Date(0);
                    return p.setUTCFullYear(d, 0, l), p.setUTCHours(0, 0, 0, 0), iI(p, t)
                })(r, t).getTime()) / 6048e5) + 1
            }

            function iD(e, t) {
                for (var r = Math.abs(e).toString(); r.length < t;) r = "0" + r;
                return (e < 0 ? "-" : "") + r
            }
            var iN = function(e, t) {
                    var r = e.getUTCFullYear(),
                        n = r > 0 ? r : 1 - r;
                    return iD("yy" === t ? n % 100 : n, t.length)
                },
                iR = function(e, t) {
                    var r = e.getUTCMonth();
                    return "M" === t ? String(r + 1) : iD(r + 1, 2)
                },
                iM = function(e, t) {
                    var r = t.length;
                    return iD(Math.floor(e.getUTCMilliseconds() * Math.pow(10, r - 3)), t.length)
                };

            function iU(e, t) {
                var r = e > 0 ? "-" : "+",
                    n = Math.abs(e),
                    i = Math.floor(n / 60),
                    a = n % 60;
                return 0 === a ? r + String(i) : r + String(i) + (t || "") + iD(a, 2)
            }

            function iL(e, t) {
                return e % 60 == 0 ? (e > 0 ? "-" : "+") + iD(Math.abs(e) / 60, 2) : i_(e, t)
            }

            function i_(e, t) {
                var r = Math.abs(e);
                return (e > 0 ? "-" : "+") + iD(Math.floor(r / 60), 2) + (t || "") + iD(r % 60, 2)
            }
            var iB = {
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
                        return iN(e, t)
                    },
                    Y: function(e, t, r, n) {
                        var i = ij(e, n),
                            a = i > 0 ? i : 1 - i;
                        return "YY" === t ? iD(a % 100, 2) : "Yo" === t ? r.ordinalNumber(a, {
                            unit: "year"
                        }) : iD(a, t.length)
                    },
                    R: function(e, t) {
                        return iD(iC(e), t.length)
                    },
                    u: function(e, t) {
                        return iD(e.getUTCFullYear(), t.length)
                    },
                    Q: function(e, t, r) {
                        var n = Math.ceil((e.getUTCMonth() + 1) / 3);
                        switch (t) {
                            case "Q":
                                return String(n);
                            case "QQ":
                                return iD(n, 2);
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
                                return iD(n, 2);
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
                                return iR(e, t);
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
                                return iD(n + 1, 2);
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
                        var i = ik(e, n);
                        return "wo" === t ? r.ordinalNumber(i, {
                            unit: "week"
                        }) : iD(i, t.length)
                    },
                    I: function(e, t, r) {
                        var n = iO(e);
                        return "Io" === t ? r.ordinalNumber(n, {
                            unit: "week"
                        }) : iD(n, t.length)
                    },
                    d: function(e, t, r) {
                        var n, i;
                        return "do" === t ? r.ordinalNumber(e.getUTCDate(), {
                            unit: "date"
                        }) : (n = e, i = t, iD(n.getUTCDate(), i.length))
                    },
                    D: function(e, t, r) {
                        var n = function(e) {
                            iP(1, arguments);
                            var t = iS(e),
                                r = t.getTime();
                            return t.setUTCMonth(0, 1), t.setUTCHours(0, 0, 0, 0), Math.floor((r - t.getTime()) / 864e5) + 1
                        }(e);
                        return "Do" === t ? r.ordinalNumber(n, {
                            unit: "dayOfYear"
                        }) : iD(n, t.length)
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
                                return iD(a, 2);
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
                                return iD(a, t.length);
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
                                return iD(i, t.length);
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
                        return n = e, i = t, iD(n.getUTCHours() % 12 || 12, i.length)
                    },
                    H: function(e, t, r) {
                        var n, i;
                        return "Ho" === t ? r.ordinalNumber(e.getUTCHours(), {
                            unit: "hour"
                        }) : (n = e, i = t, iD(n.getUTCHours(), i.length))
                    },
                    K: function(e, t, r) {
                        var n = e.getUTCHours() % 12;
                        return "Ko" === t ? r.ordinalNumber(n, {
                            unit: "hour"
                        }) : iD(n, t.length)
                    },
                    k: function(e, t, r) {
                        var n = e.getUTCHours();
                        return (0 === n && (n = 24), "ko" === t) ? r.ordinalNumber(n, {
                            unit: "hour"
                        }) : iD(n, t.length)
                    },
                    m: function(e, t, r) {
                        var n, i;
                        return "mo" === t ? r.ordinalNumber(e.getUTCMinutes(), {
                            unit: "minute"
                        }) : (n = e, i = t, iD(n.getUTCMinutes(), i.length))
                    },
                    s: function(e, t, r) {
                        var n, i;
                        return "so" === t ? r.ordinalNumber(e.getUTCSeconds(), {
                            unit: "second"
                        }) : (n = e, i = t, iD(n.getUTCSeconds(), i.length))
                    },
                    S: function(e, t) {
                        return iM(e, t)
                    },
                    X: function(e, t, r, n) {
                        var i = (n._originalDate || e).getTimezoneOffset();
                        if (0 === i) return "Z";
                        switch (t) {
                            case "X":
                                return iL(i);
                            case "XXXX":
                            case "XX":
                                return i_(i);
                            default:
                                return i_(i, ":")
                        }
                    },
                    x: function(e, t, r, n) {
                        var i = (n._originalDate || e).getTimezoneOffset();
                        switch (t) {
                            case "x":
                                return iL(i);
                            case "xxxx":
                            case "xx":
                                return i_(i);
                            default:
                                return i_(i, ":")
                        }
                    },
                    O: function(e, t, r, n) {
                        var i = (n._originalDate || e).getTimezoneOffset();
                        switch (t) {
                            case "O":
                            case "OO":
                            case "OOO":
                                return "GMT" + iU(i, ":");
                            default:
                                return "GMT" + i_(i, ":")
                        }
                    },
                    z: function(e, t, r, n) {
                        var i = (n._originalDate || e).getTimezoneOffset();
                        switch (t) {
                            case "z":
                            case "zz":
                            case "zzz":
                                return "GMT" + iU(i, ":");
                            default:
                                return "GMT" + i_(i, ":")
                        }
                    },
                    t: function(e, t, r, n) {
                        return iD(Math.floor((n._originalDate || e).getTime() / 1e3), t.length)
                    },
                    T: function(e, t, r, n) {
                        return iD((n._originalDate || e).getTime(), t.length)
                    }
                },
                iF = function(e, t) {
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
                iY = function(e, t) {
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
                iq = {
                    p: iY,
                    P: function(e, t) {
                        var r, n = e.match(/(P+)(p+)?/) || [],
                            i = n[1],
                            a = n[2];
                        if (!a) return iF(e, t);
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
                        return r.replace("{{date}}", iF(i, t)).replace("{{time}}", iY(a, t))
                    }
                };

            function iH(e) {
                var t = new Date(Date.UTC(e.getFullYear(), e.getMonth(), e.getDate(), e.getHours(), e.getMinutes(), e.getSeconds(), e.getMilliseconds()));
                return t.setUTCFullYear(e.getFullYear()), e.getTime() - t.getTime()
            }
            var iV = ["D", "DD"],
                iW = ["YY", "YYYY"];

            function iG(e) {
                return -1 !== iV.indexOf(e)
            }

            function iK(e) {
                return -1 !== iW.indexOf(e)
            }

            function iz(e, t, r) {
                if ("YYYY" === e) throw RangeError("Use `yyyy` instead of `YYYY` (in `".concat(t, "`) for formatting years to the input `").concat(r, "`; see: https://github.com/date-fns/date-fns/blob/master/docs/unicodeTokens.md"));
                if ("YY" === e) throw RangeError("Use `yy` instead of `YY` (in `".concat(t, "`) for formatting years to the input `").concat(r, "`; see: https://github.com/date-fns/date-fns/blob/master/docs/unicodeTokens.md"));
                if ("D" === e) throw RangeError("Use `d` instead of `D` (in `".concat(t, "`) for formatting days of the month to the input `").concat(r, "`; see: https://github.com/date-fns/date-fns/blob/master/docs/unicodeTokens.md"));
                if ("DD" === e) throw RangeError("Use `dd` instead of `DD` (in `".concat(t, "`) for formatting days of the month to the input `").concat(r, "`; see: https://github.com/date-fns/date-fns/blob/master/docs/unicodeTokens.md"))
            }
            var iX = {
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

            function iQ(e) {
                return function() {
                    var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        r = t.width ? String(t.width) : e.defaultWidth;
                    return e.formats[r] || e.formats[e.defaultWidth]
                }
            }
            var i$ = {
                    date: iQ({
                        formats: {
                            full: "EEEE, MMMM do, y",
                            long: "MMMM do, y",
                            medium: "MMM d, y",
                            short: "MM/dd/yyyy"
                        },
                        defaultWidth: "full"
                    }),
                    time: iQ({
                        formats: {
                            full: "h:mm:ss a zzzz",
                            long: "h:mm:ss a z",
                            medium: "h:mm:ss a",
                            short: "h:mm a"
                        },
                        defaultWidth: "full"
                    }),
                    dateTime: iQ({
                        formats: {
                            full: "{{date}} 'at' {{time}}",
                            long: "{{date}} 'at' {{time}}",
                            medium: "{{date}}, {{time}}",
                            short: "{{date}}, {{time}}"
                        },
                        defaultWidth: "full"
                    })
                },
                iJ = {
                    lastWeek: "'last' eeee 'at' p",
                    yesterday: "'yesterday at' p",
                    today: "'today at' p",
                    tomorrow: "'tomorrow at' p",
                    nextWeek: "eeee 'at' p",
                    other: "P"
                };

            function iZ(e) {
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

            function i0(e) {
                return function(t) {
                    var r, n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        i = n.width,
                        a = i && e.matchPatterns[i] || e.matchPatterns[e.defaultMatchWidth],
                        o = t.match(a);
                    if (!o) return null;
                    var s = o[0],
                        u = i && e.parsePatterns[i] || e.parsePatterns[e.defaultParseWidth],
                        c = Array.isArray(u) ? function(e, t) {
                            for (var r = 0; r < e.length; r++)
                                if (t(e[r])) return r
                        }(u, function(e) {
                            return e.test(s)
                        }) : function(e, t) {
                            for (var r in e)
                                if (e.hasOwnProperty(r) && t(e[r])) return r
                        }(u, function(e) {
                            return e.test(s)
                        });
                    return r = e.valueCallback ? e.valueCallback(c) : c, {
                        value: r = n.valueCallback ? n.valueCallback(r) : r,
                        rest: t.slice(s.length)
                    }
                }
            }
            var i1 = {
                    code: "en-US",
                    formatDistance: function(e, t, r) {
                        var n, i = iX[e];
                        if (n = "string" == typeof i ? i : 1 === t ? i.one : i.other.replace("{{count}}", t.toString()), null != r && r.addSuffix)
                            if (r.comparison && r.comparison > 0) return "in " + n;
                            else return n + " ago";
                        return n
                    },
                    formatLong: i$,
                    formatRelative: function(e, t, r, n) {
                        return iJ[e]
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
                        era: iZ({
                            values: {
                                narrow: ["B", "A"],
                                abbreviated: ["BC", "AD"],
                                wide: ["Before Christ", "Anno Domini"]
                            },
                            defaultWidth: "wide"
                        }),
                        quarter: iZ({
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
                        month: iZ({
                            values: {
                                narrow: ["J", "F", "M", "A", "M", "J", "J", "A", "S", "O", "N", "D"],
                                abbreviated: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                                wide: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
                            },
                            defaultWidth: "wide"
                        }),
                        day: iZ({
                            values: {
                                narrow: ["S", "M", "T", "W", "T", "F", "S"],
                                short: ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"],
                                abbreviated: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
                                wide: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
                            },
                            defaultWidth: "wide"
                        }),
                        dayPeriod: iZ({
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
                        era: i0({
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
                        quarter: i0({
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
                        month: i0({
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
                        day: i0({
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
                        dayPeriod: i0({
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
                i2 = /[yYQqMLwIdDecihHKkms]o|(\w)\1*|''|'(''|[^'])+('|$)|./g,
                i3 = /P+p+|P+|p+|''|'(''|[^'])+('|$)|./g,
                i4 = /^'([^]*?)'?$/,
                i6 = /''/g,
                i5 = /[a-zA-Z]/;

            function i8(e, t, r) {
                iP(2, arguments);
                var n, i, a, o, s, u, c, l, d, p, f, h, m, b, y, v, g, w, P = String(t),
                    S = null != (n = null != (i = null == r ? void 0 : r.locale) ? i : iA.locale) ? n : i1,
                    x = ix(null != (a = null != (o = null != (s = null != (u = null == r ? void 0 : r.firstWeekContainsDate) ? u : null == r || null == (c = r.locale) || null == (l = c.options) ? void 0 : l.firstWeekContainsDate) ? s : iA.firstWeekContainsDate) ? o : null == (d = iA.locale) || null == (p = d.options) ? void 0 : p.firstWeekContainsDate) ? a : 1);
                if (!(x >= 1 && x <= 7)) throw RangeError("firstWeekContainsDate must be between 1 and 7 inclusively");
                var E = ix(null != (f = null != (h = null != (m = null != (b = null == r ? void 0 : r.weekStartsOn) ? b : null == r || null == (y = r.locale) || null == (v = y.options) ? void 0 : v.weekStartsOn) ? m : iA.weekStartsOn) ? h : null == (g = iA.locale) || null == (w = g.options) ? void 0 : w.weekStartsOn) ? f : 0);
                if (!(E >= 0 && E <= 6)) throw RangeError("weekStartsOn must be between 0 and 6 inclusively");
                if (!S.localize) throw RangeError("locale must contain localize property");
                if (!S.formatLong) throw RangeError("locale must contain formatLong property");
                var T = iS(e);
                if (! function(e) {
                        return iP(1, arguments), (!! function(e) {
                            var t;
                            return iP(1, arguments), (null != (t = Date) && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t) || "object" === iw(e) && "[object Date]" === Object.prototype.toString.call(e)
                        }(e) || "number" == typeof e) && !isNaN(Number(iS(e)))
                    }(T)) throw RangeError("Invalid time value");
                var C = iH(T),
                    O = iE(T, C),
                    A = {
                        firstWeekContainsDate: x,
                        weekStartsOn: E,
                        locale: S,
                        _originalDate: T
                    };
                return P.match(i3).map(function(e) {
                    var t = e[0];
                    return "p" === t || "P" === t ? (0, iq[t])(e, S.formatLong) : e
                }).join("").match(i2).map(function(n) {
                    if ("''" === n) return "'";
                    var i, a, o = n[0];
                    if ("'" === o) {
                        return (a = (i = n).match(i4)) ? a[1].replace(i6, "'") : i
                    }
                    var s = iB[o];
                    if (s) return !(null != r && r.useAdditionalWeekYearTokens) && iK(n) && iz(n, t, String(e)), !(null != r && r.useAdditionalDayOfYearTokens) && iG(n) && iz(n, t, String(e)), s(O, n, S.localize, A);
                    if (o.match(i5)) throw RangeError("Format string contains an unescaped latin alphabet character `" + o + "`");
                    return n
                }).join("")
            }

            function i7(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function i9(e, t) {
                var r = "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                if (!r) {
                    if (Array.isArray(e) || (r = function(e) {
                            if (e) {
                                if ("string" == typeof e) return i7(e, void 0);
                                var t = ({}).toString.call(e).slice(8, -1);
                                return "Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t ? Array.from(e) : "Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t) ? i7(e, void 0) : void 0
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

            function ae(e) {
                if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                return e
            }

            function at(e, t) {
                return (at = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function ar(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        writable: !0,
                        configurable: !0
                    }
                }), Object.defineProperty(e, "prototype", {
                    writable: !1
                }), t && at(e, t)
            }

            function an(e) {
                return (an = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function ai() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (ai = function() {
                    return !!e
                })()
            }

            function aa(e) {
                var t = ai();
                return function() {
                    var r, n = an(e);
                    r = t ? Reflect.construct(n, arguments, an(this).constructor) : n.apply(this, arguments);
                    if (r && ("object" == iw(r) || "function" == typeof r)) return r;
                    if (void 0 !== r) throw TypeError("Derived constructors may only return object or undefined");
                    return ae(this)
                }
            }

            function ao(e, t) {
                if (null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !t[Symbol.hasInstance](e) : !(e instanceof t)) throw TypeError("Cannot call a class as a function")
            }

            function as(e) {
                var t = function(e, t) {
                    if ("object" != iw(e) || !e) return e;
                    var r = e[Symbol.toPrimitive];
                    if (void 0 !== r) {
                        var n = r.call(e, t || "default");
                        if ("object" != iw(n)) return n;
                        throw TypeError("@@toPrimitive must return a primitive value.")
                    }
                    return ("string" === t ? String : Number)(e)
                }(e, "string");
                return "symbol" == iw(t) ? t : t + ""
            }

            function au(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var n = t[r];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, as(n.key), n)
                }
            }

            function ac(e, t, r) {
                return t && au(e.prototype, t), r && au(e, r), Object.defineProperty(e, "prototype", {
                    writable: !1
                }), e
            }

            function al(e, t, r) {
                return (t = as(t)) in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var ad = function() {
                    function e() {
                        ao(this, e), al(this, "priority", void 0), al(this, "subPriority", 0)
                    }
                    return ac(e, [{
                        key: "validate",
                        value: function(e, t) {
                            return !0
                        }
                    }]), e
                }(),
                ap = function(e) {
                    ar(r, e);
                    var t = aa(r);

                    function r(e, n, i, a, o) {
                        var s;
                        return ao(this, r), (s = t.call(this)).value = e, s.validateValue = n, s.setValue = i, s.priority = a, o && (s.subPriority = o), s
                    }
                    return ac(r, [{
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
                }(ad),
                af = function(e) {
                    ar(r, e);
                    var t = aa(r);

                    function r() {
                        var e;
                        ao(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return al(ae(e = t.call.apply(t, [this].concat(i))), "priority", 10), al(ae(e), "subPriority", -1), e
                    }
                    return ac(r, [{
                        key: "set",
                        value: function(e, t) {
                            if (t.timestampIsSet) return e;
                            var r = new Date(0);
                            return r.setFullYear(e.getUTCFullYear(), e.getUTCMonth(), e.getUTCDate()), r.setHours(e.getUTCHours(), e.getUTCMinutes(), e.getUTCSeconds(), e.getUTCMilliseconds()), r
                        }
                    }]), r
                }(ad),
                ah = function() {
                    function e() {
                        ao(this, e), al(this, "incompatibleTokens", void 0), al(this, "priority", void 0), al(this, "subPriority", void 0)
                    }
                    return ac(e, [{
                        key: "run",
                        value: function(e, t, r, n) {
                            var i = this.parse(e, t, r, n);
                            return i ? {
                                setter: new ap(i.value, this.validate, this.set, this.priority, this.subPriority),
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
                am = function(e) {
                    ar(r, e);
                    var t = aa(r);

                    function r() {
                        var e;
                        ao(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return al(ae(e = t.call.apply(t, [this].concat(i))), "priority", 140), al(ae(e), "incompatibleTokens", ["R", "u", "t", "T"]), e
                    }
                    return ac(r, [{
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
                }(ah),
                ab = /^(1[0-2]|0?\d)/,
                ay = /^(3[0-1]|[0-2]?\d)/,
                av = /^(36[0-6]|3[0-5]\d|[0-2]?\d?\d)/,
                ag = /^(5[0-3]|[0-4]?\d)/,
                aw = /^(2[0-3]|[0-1]?\d)/,
                aP = /^(2[0-4]|[0-1]?\d)/,
                aS = /^(1[0-1]|0?\d)/,
                ax = /^(1[0-2]|0?\d)/,
                aE = /^[0-5]?\d/,
                aT = /^[0-5]?\d/,
                aC = /^\d/,
                aO = /^\d{1,2}/,
                aA = /^\d{1,3}/,
                aI = /^\d{1,4}/,
                aj = /^-?\d+/,
                ak = /^-?\d/,
                aD = /^-?\d{1,2}/,
                aN = /^-?\d{1,3}/,
                aR = /^-?\d{1,4}/,
                aM = /^([+-])(\d{2})(\d{2})?|Z/,
                aU = /^([+-])(\d{2})(\d{2})|Z/,
                aL = /^([+-])(\d{2})(\d{2})((\d{2}))?|Z/,
                a_ = /^([+-])(\d{2}):(\d{2})|Z/,
                aB = /^([+-])(\d{2}):(\d{2})(:(\d{2}))?|Z/;

            function aF(e, t) {
                return e ? {
                    value: t(e.value),
                    rest: e.rest
                } : e
            }

            function aY(e, t) {
                var r = t.match(e);
                return r ? {
                    value: parseInt(r[0], 10),
                    rest: t.slice(r[0].length)
                } : null
            }

            function aq(e, t) {
                var r = t.match(e);
                return r ? "Z" === r[0] ? {
                    value: 0,
                    rest: t.slice(1)
                } : {
                    value: ("+" === r[1] ? 1 : -1) * ((r[2] ? parseInt(r[2], 10) : 0) * 36e5 + (r[3] ? parseInt(r[3], 10) : 0) * 6e4 + (r[5] ? parseInt(r[5], 10) : 0) * 1e3),
                    rest: t.slice(r[0].length)
                } : null
            }

            function aH(e, t) {
                switch (e) {
                    case 1:
                        return aY(aC, t);
                    case 2:
                        return aY(aO, t);
                    case 3:
                        return aY(aA, t);
                    case 4:
                        return aY(aI, t);
                    default:
                        return aY(RegExp("^\\d{1," + e + "}"), t)
                }
            }

            function aV(e, t) {
                switch (e) {
                    case 1:
                        return aY(ak, t);
                    case 2:
                        return aY(aD, t);
                    case 3:
                        return aY(aN, t);
                    case 4:
                        return aY(aR, t);
                    default:
                        return aY(RegExp("^-?\\d{1," + e + "}"), t)
                }
            }

            function aW(e) {
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

            function aG(e, t) {
                var r, n = t > 0,
                    i = n ? t : 1 - t;
                if (i <= 50) r = e || 100;
                else {
                    var a = i + 50;
                    r = e + 100 * Math.floor(a / 100) - 100 * (e >= a % 100)
                }
                return n ? r : 1 - r
            }

            function aK(e) {
                return e % 400 == 0 || e % 4 == 0 && e % 100 != 0
            }
            var az = function(e) {
                    ar(r, e);
                    var t = aa(r);

                    function r() {
                        var e;
                        ao(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return al(ae(e = t.call.apply(t, [this].concat(i))), "priority", 130), al(ae(e), "incompatibleTokens", ["Y", "R", "u", "w", "I", "i", "e", "c", "t", "T"]), e
                    }
                    return ac(r, [{
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
                                    return aF(aH(4, e), n);
                                case "yo":
                                    return aF(r.ordinalNumber(e, {
                                        unit: "year"
                                    }), n);
                                default:
                                    return aF(aH(t.length, e), n)
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
                                var i = aG(r.year, n);
                                return e.setUTCFullYear(i, 0, 1), e.setUTCHours(0, 0, 0, 0), e
                            }
                            var a = "era" in t && 1 !== t.era ? 1 - r.year : r.year;
                            return e.setUTCFullYear(a, 0, 1), e.setUTCHours(0, 0, 0, 0), e
                        }
                    }]), r
                }(ah),
                aX = function(e) {
                    ar(r, e);
                    var t = aa(r);

                    function r() {
                        var e;
                        ao(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return al(ae(e = t.call.apply(t, [this].concat(i))), "priority", 130), al(ae(e), "incompatibleTokens", ["y", "R", "u", "Q", "q", "M", "L", "I", "d", "D", "i", "t", "T"]), e
                    }
                    return ac(r, [{
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
                                    return aF(aH(4, e), n);
                                case "Yo":
                                    return aF(r.ordinalNumber(e, {
                                        unit: "year"
                                    }), n);
                                default:
                                    return aF(aH(t.length, e), n)
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
                            var i = ij(e, n);
                            if (r.isTwoDigitYear) {
                                var a = aG(r.year, i);
                                return e.setUTCFullYear(a, 0, n.firstWeekContainsDate), e.setUTCHours(0, 0, 0, 0), iI(e, n)
                            }
                            var o = "era" in t && 1 !== t.era ? 1 - r.year : r.year;
                            return e.setUTCFullYear(o, 0, n.firstWeekContainsDate), e.setUTCHours(0, 0, 0, 0), iI(e, n)
                        }
                    }]), r
                }(ah),
                aQ = function(e) {
                    ar(r, e);
                    var t = aa(r);

                    function r() {
                        var e;
                        ao(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return al(ae(e = t.call.apply(t, [this].concat(i))), "priority", 130), al(ae(e), "incompatibleTokens", ["G", "y", "Y", "u", "Q", "q", "M", "L", "w", "d", "D", "e", "c", "t", "T"]), e
                    }
                    return ac(r, [{
                        key: "parse",
                        value: function(e, t) {
                            return "R" === t ? aV(4, e) : aV(t.length, e)
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            var n = new Date(0);
                            return n.setUTCFullYear(r, 0, 4), n.setUTCHours(0, 0, 0, 0), iT(n)
                        }
                    }]), r
                }(ah),
                a$ = function(e) {
                    ar(r, e);
                    var t = aa(r);

                    function r() {
                        var e;
                        ao(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return al(ae(e = t.call.apply(t, [this].concat(i))), "priority", 130), al(ae(e), "incompatibleTokens", ["G", "y", "Y", "R", "w", "I", "i", "e", "c", "t", "T"]), e
                    }
                    return ac(r, [{
                        key: "parse",
                        value: function(e, t) {
                            return "u" === t ? aV(4, e) : aV(t.length, e)
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return e.setUTCFullYear(r, 0, 1), e.setUTCHours(0, 0, 0, 0), e
                        }
                    }]), r
                }(ah),
                aJ = function(e) {
                    ar(r, e);
                    var t = aa(r);

                    function r() {
                        var e;
                        ao(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return al(ae(e = t.call.apply(t, [this].concat(i))), "priority", 120), al(ae(e), "incompatibleTokens", ["Y", "R", "q", "M", "L", "w", "I", "d", "D", "i", "e", "c", "t", "T"]), e
                    }
                    return ac(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "Q":
                                case "QQ":
                                    return aH(t.length, e);
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
                }(ah),
                aZ = function(e) {
                    ar(r, e);
                    var t = aa(r);

                    function r() {
                        var e;
                        ao(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return al(ae(e = t.call.apply(t, [this].concat(i))), "priority", 120), al(ae(e), "incompatibleTokens", ["Y", "R", "Q", "M", "L", "w", "I", "d", "D", "i", "e", "c", "t", "T"]), e
                    }
                    return ac(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "q":
                                case "qq":
                                    return aH(t.length, e);
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
                }(ah),
                a0 = function(e) {
                    ar(r, e);
                    var t = aa(r);

                    function r() {
                        var e;
                        ao(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return al(ae(e = t.call.apply(t, [this].concat(i))), "incompatibleTokens", ["Y", "R", "q", "Q", "L", "w", "I", "D", "i", "e", "c", "t", "T"]), al(ae(e), "priority", 110), e
                    }
                    return ac(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            var n = function(e) {
                                return e - 1
                            };
                            switch (t) {
                                case "M":
                                    return aF(aY(ab, e), n);
                                case "MM":
                                    return aF(aH(2, e), n);
                                case "Mo":
                                    return aF(r.ordinalNumber(e, {
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
                }(ah),
                a1 = function(e) {
                    ar(r, e);
                    var t = aa(r);

                    function r() {
                        var e;
                        ao(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return al(ae(e = t.call.apply(t, [this].concat(i))), "priority", 110), al(ae(e), "incompatibleTokens", ["Y", "R", "q", "Q", "M", "w", "I", "D", "i", "e", "c", "t", "T"]), e
                    }
                    return ac(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            var n = function(e) {
                                return e - 1
                            };
                            switch (t) {
                                case "L":
                                    return aF(aY(ab, e), n);
                                case "LL":
                                    return aF(aH(2, e), n);
                                case "Lo":
                                    return aF(r.ordinalNumber(e, {
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
                }(ah),
                a2 = function(e) {
                    ar(r, e);
                    var t = aa(r);

                    function r() {
                        var e;
                        ao(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return al(ae(e = t.call.apply(t, [this].concat(i))), "priority", 100), al(ae(e), "incompatibleTokens", ["y", "R", "u", "q", "Q", "M", "L", "I", "d", "D", "i", "t", "T"]), e
                    }
                    return ac(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "w":
                                    return aY(ag, e);
                                case "wo":
                                    return r.ordinalNumber(e, {
                                        unit: "week"
                                    });
                                default:
                                    return aH(t.length, e)
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
                            return iI(function(e, t, r) {
                                iP(2, arguments);
                                var n = iS(e),
                                    i = ix(t),
                                    a = ik(n, r) - i;
                                return n.setUTCDate(n.getUTCDate() - 7 * a), n
                            }(e, r, n), n)
                        }
                    }]), r
                }(ah),
                a3 = function(e) {
                    ar(r, e);
                    var t = aa(r);

                    function r() {
                        var e;
                        ao(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return al(ae(e = t.call.apply(t, [this].concat(i))), "priority", 100), al(ae(e), "incompatibleTokens", ["y", "Y", "u", "q", "Q", "M", "L", "w", "d", "D", "e", "c", "t", "T"]), e
                    }
                    return ac(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "I":
                                    return aY(ag, e);
                                case "Io":
                                    return r.ordinalNumber(e, {
                                        unit: "week"
                                    });
                                default:
                                    return aH(t.length, e)
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
                            return iT(function(e, t) {
                                iP(2, arguments);
                                var r = iS(e),
                                    n = ix(t),
                                    i = iO(r) - n;
                                return r.setUTCDate(r.getUTCDate() - 7 * i), r
                            }(e, r))
                        }
                    }]), r
                }(ah),
                a4 = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],
                a6 = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],
                a5 = function(e) {
                    ar(r, e);
                    var t = aa(r);

                    function r() {
                        var e;
                        ao(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return al(ae(e = t.call.apply(t, [this].concat(i))), "priority", 90), al(ae(e), "subPriority", 1), al(ae(e), "incompatibleTokens", ["Y", "R", "q", "Q", "w", "I", "D", "i", "e", "c", "t", "T"]), e
                    }
                    return ac(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "d":
                                    return aY(ay, e);
                                case "do":
                                    return r.ordinalNumber(e, {
                                        unit: "date"
                                    });
                                default:
                                    return aH(t.length, e)
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            var r = aK(e.getUTCFullYear()),
                                n = e.getUTCMonth();
                            return r ? t >= 1 && t <= a6[n] : t >= 1 && t <= a4[n]
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return e.setUTCDate(r), e.setUTCHours(0, 0, 0, 0), e
                        }
                    }]), r
                }(ah),
                a8 = function(e) {
                    ar(r, e);
                    var t = aa(r);

                    function r() {
                        var e;
                        ao(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return al(ae(e = t.call.apply(t, [this].concat(i))), "priority", 90), al(ae(e), "subpriority", 1), al(ae(e), "incompatibleTokens", ["Y", "R", "q", "Q", "M", "L", "w", "I", "d", "E", "i", "e", "c", "t", "T"]), e
                    }
                    return ac(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "D":
                                case "DD":
                                    return aY(av, e);
                                case "Do":
                                    return r.ordinalNumber(e, {
                                        unit: "date"
                                    });
                                default:
                                    return aH(t.length, e)
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            return aK(e.getUTCFullYear()) ? t >= 1 && t <= 366 : t >= 1 && t <= 365
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return e.setUTCMonth(0, r), e.setUTCHours(0, 0, 0, 0), e
                        }
                    }]), r
                }(ah);

            function a7(e, t, r) {
                iP(2, arguments);
                var n, i, a, o, s, u, c, l, d = ix(null != (n = null != (i = null != (a = null != (o = null == r ? void 0 : r.weekStartsOn) ? o : null == r || null == (s = r.locale) || null == (u = s.options) ? void 0 : u.weekStartsOn) ? a : iA.weekStartsOn) ? i : null == (c = iA.locale) || null == (l = c.options) ? void 0 : l.weekStartsOn) ? n : 0);
                if (!(d >= 0 && d <= 6)) throw RangeError("weekStartsOn must be between 0 and 6 inclusively");
                var p = iS(e),
                    f = ix(t),
                    h = 7 * ((f % 7 + 7) % 7 < d) + f - p.getUTCDay();
                return p.setUTCDate(p.getUTCDate() + h), p
            }
            var a9 = function(e) {
                    ar(r, e);
                    var t = aa(r);

                    function r() {
                        var e;
                        ao(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return al(ae(e = t.call.apply(t, [this].concat(i))), "priority", 90), al(ae(e), "incompatibleTokens", ["D", "i", "e", "c", "t", "T"]), e
                    }
                    return ac(r, [{
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
                            return (e = a7(e, r, n)).setUTCHours(0, 0, 0, 0), e
                        }
                    }]), r
                }(ah),
                oe = function(e) {
                    ar(r, e);
                    var t = aa(r);

                    function r() {
                        var e;
                        ao(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return al(ae(e = t.call.apply(t, [this].concat(i))), "priority", 90), al(ae(e), "incompatibleTokens", ["y", "R", "u", "q", "Q", "M", "L", "I", "d", "D", "E", "i", "c", "t", "T"]), e
                    }
                    return ac(r, [{
                        key: "parse",
                        value: function(e, t, r, n) {
                            var i = function(e) {
                                var t = 7 * Math.floor((e - 1) / 7);
                                return (e + n.weekStartsOn + 6) % 7 + t
                            };
                            switch (t) {
                                case "e":
                                case "ee":
                                    return aF(aH(t.length, e), i);
                                case "eo":
                                    return aF(r.ordinalNumber(e, {
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
                            return (e = a7(e, r, n)).setUTCHours(0, 0, 0, 0), e
                        }
                    }]), r
                }(ah),
                ot = function(e) {
                    ar(r, e);
                    var t = aa(r);

                    function r() {
                        var e;
                        ao(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return al(ae(e = t.call.apply(t, [this].concat(i))), "priority", 90), al(ae(e), "incompatibleTokens", ["y", "R", "u", "q", "Q", "M", "L", "I", "d", "D", "E", "i", "e", "t", "T"]), e
                    }
                    return ac(r, [{
                        key: "parse",
                        value: function(e, t, r, n) {
                            var i = function(e) {
                                var t = 7 * Math.floor((e - 1) / 7);
                                return (e + n.weekStartsOn + 6) % 7 + t
                            };
                            switch (t) {
                                case "c":
                                case "cc":
                                    return aF(aH(t.length, e), i);
                                case "co":
                                    return aF(r.ordinalNumber(e, {
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
                            return (e = a7(e, r, n)).setUTCHours(0, 0, 0, 0), e
                        }
                    }]), r
                }(ah),
                or = function(e) {
                    ar(r, e);
                    var t = aa(r);

                    function r() {
                        var e;
                        ao(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return al(ae(e = t.call.apply(t, [this].concat(i))), "priority", 90), al(ae(e), "incompatibleTokens", ["y", "Y", "u", "q", "Q", "M", "L", "w", "d", "D", "E", "e", "c", "t", "T"]), e
                    }
                    return ac(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            var n = function(e) {
                                return 0 === e ? 7 : e
                            };
                            switch (t) {
                                case "i":
                                case "ii":
                                    return aH(t.length, e);
                                case "io":
                                    return r.ordinalNumber(e, {
                                        unit: "day"
                                    });
                                case "iii":
                                    return aF(r.day(e, {
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
                                    return aF(r.day(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    }), n);
                                case "iiiiii":
                                    return aF(r.day(e, {
                                        width: "short",
                                        context: "formatting"
                                    }) || r.day(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    }), n);
                                default:
                                    return aF(r.day(e, {
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
                                iP(2, arguments);
                                var r = ix(t);
                                r % 7 == 0 && (r -= 7);
                                var n = iS(e),
                                    i = 7 * ((r % 7 + 7) % 7 < 1) + r - n.getUTCDay();
                                return n.setUTCDate(n.getUTCDate() + i), n
                            }(e, r)).setUTCHours(0, 0, 0, 0), e
                        }
                    }]), r
                }(ah),
                on = function(e) {
                    ar(r, e);
                    var t = aa(r);

                    function r() {
                        var e;
                        ao(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return al(ae(e = t.call.apply(t, [this].concat(i))), "priority", 80), al(ae(e), "incompatibleTokens", ["b", "B", "H", "k", "t", "T"]), e
                    }
                    return ac(r, [{
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
                            return e.setUTCHours(aW(r), 0, 0, 0), e
                        }
                    }]), r
                }(ah),
                oi = function(e) {
                    ar(r, e);
                    var t = aa(r);

                    function r() {
                        var e;
                        ao(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return al(ae(e = t.call.apply(t, [this].concat(i))), "priority", 80), al(ae(e), "incompatibleTokens", ["a", "B", "H", "k", "t", "T"]), e
                    }
                    return ac(r, [{
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
                            return e.setUTCHours(aW(r), 0, 0, 0), e
                        }
                    }]), r
                }(ah),
                oa = function(e) {
                    ar(r, e);
                    var t = aa(r);

                    function r() {
                        var e;
                        ao(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return al(ae(e = t.call.apply(t, [this].concat(i))), "priority", 80), al(ae(e), "incompatibleTokens", ["a", "b", "t", "T"]), e
                    }
                    return ac(r, [{
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
                            return e.setUTCHours(aW(r), 0, 0, 0), e
                        }
                    }]), r
                }(ah),
                oo = function(e) {
                    ar(r, e);
                    var t = aa(r);

                    function r() {
                        var e;
                        ao(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return al(ae(e = t.call.apply(t, [this].concat(i))), "priority", 70), al(ae(e), "incompatibleTokens", ["H", "K", "k", "t", "T"]), e
                    }
                    return ac(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "h":
                                    return aY(ax, e);
                                case "ho":
                                    return r.ordinalNumber(e, {
                                        unit: "hour"
                                    });
                                default:
                                    return aH(t.length, e)
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
                }(ah),
                os = function(e) {
                    ar(r, e);
                    var t = aa(r);

                    function r() {
                        var e;
                        ao(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return al(ae(e = t.call.apply(t, [this].concat(i))), "priority", 70), al(ae(e), "incompatibleTokens", ["a", "b", "h", "K", "k", "t", "T"]), e
                    }
                    return ac(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "H":
                                    return aY(aw, e);
                                case "Ho":
                                    return r.ordinalNumber(e, {
                                        unit: "hour"
                                    });
                                default:
                                    return aH(t.length, e)
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
                }(ah),
                ou = function(e) {
                    ar(r, e);
                    var t = aa(r);

                    function r() {
                        var e;
                        ao(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return al(ae(e = t.call.apply(t, [this].concat(i))), "priority", 70), al(ae(e), "incompatibleTokens", ["h", "H", "k", "t", "T"]), e
                    }
                    return ac(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "K":
                                    return aY(aS, e);
                                case "Ko":
                                    return r.ordinalNumber(e, {
                                        unit: "hour"
                                    });
                                default:
                                    return aH(t.length, e)
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
                }(ah),
                oc = function(e) {
                    ar(r, e);
                    var t = aa(r);

                    function r() {
                        var e;
                        ao(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return al(ae(e = t.call.apply(t, [this].concat(i))), "priority", 70), al(ae(e), "incompatibleTokens", ["a", "b", "h", "H", "K", "t", "T"]), e
                    }
                    return ac(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "k":
                                    return aY(aP, e);
                                case "ko":
                                    return r.ordinalNumber(e, {
                                        unit: "hour"
                                    });
                                default:
                                    return aH(t.length, e)
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
                }(ah),
                ol = function(e) {
                    ar(r, e);
                    var t = aa(r);

                    function r() {
                        var e;
                        ao(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return al(ae(e = t.call.apply(t, [this].concat(i))), "priority", 60), al(ae(e), "incompatibleTokens", ["t", "T"]), e
                    }
                    return ac(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "m":
                                    return aY(aE, e);
                                case "mo":
                                    return r.ordinalNumber(e, {
                                        unit: "minute"
                                    });
                                default:
                                    return aH(t.length, e)
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
                }(ah),
                od = function(e) {
                    ar(r, e);
                    var t = aa(r);

                    function r() {
                        var e;
                        ao(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return al(ae(e = t.call.apply(t, [this].concat(i))), "priority", 50), al(ae(e), "incompatibleTokens", ["t", "T"]), e
                    }
                    return ac(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "s":
                                    return aY(aT, e);
                                case "so":
                                    return r.ordinalNumber(e, {
                                        unit: "second"
                                    });
                                default:
                                    return aH(t.length, e)
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
                }(ah),
                op = function(e) {
                    ar(r, e);
                    var t = aa(r);

                    function r() {
                        var e;
                        ao(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return al(ae(e = t.call.apply(t, [this].concat(i))), "priority", 30), al(ae(e), "incompatibleTokens", ["t", "T"]), e
                    }
                    return ac(r, [{
                        key: "parse",
                        value: function(e, t) {
                            return aF(aH(t.length, e), function(e) {
                                return Math.floor(e * Math.pow(10, -t.length + 3))
                            })
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return e.setUTCMilliseconds(r), e
                        }
                    }]), r
                }(ah),
                of = function(e) {
                    ar(r, e);
                    var t = aa(r);

                    function r() {
                        var e;
                        ao(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return al(ae(e = t.call.apply(t, [this].concat(i))), "priority", 10), al(ae(e), "incompatibleTokens", ["t", "T", "x"]), e
                    }
                    return ac(r, [{
                        key: "parse",
                        value: function(e, t) {
                            switch (t) {
                                case "X":
                                    return aq(aM, e);
                                case "XX":
                                    return aq(aU, e);
                                case "XXXX":
                                    return aq(aL, e);
                                case "XXXXX":
                                    return aq(aB, e);
                                default:
                                    return aq(a_, e)
                            }
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return t.timestampIsSet ? e : new Date(e.getTime() - r)
                        }
                    }]), r
                }(ah),
                oh = function(e) {
                    ar(r, e);
                    var t = aa(r);

                    function r() {
                        var e;
                        ao(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return al(ae(e = t.call.apply(t, [this].concat(i))), "priority", 10), al(ae(e), "incompatibleTokens", ["t", "T", "X"]), e
                    }
                    return ac(r, [{
                        key: "parse",
                        value: function(e, t) {
                            switch (t) {
                                case "x":
                                    return aq(aM, e);
                                case "xx":
                                    return aq(aU, e);
                                case "xxxx":
                                    return aq(aL, e);
                                case "xxxxx":
                                    return aq(aB, e);
                                default:
                                    return aq(a_, e)
                            }
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return t.timestampIsSet ? e : new Date(e.getTime() - r)
                        }
                    }]), r
                }(ah),
                om = function(e) {
                    ar(r, e);
                    var t = aa(r);

                    function r() {
                        var e;
                        ao(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return al(ae(e = t.call.apply(t, [this].concat(i))), "priority", 40), al(ae(e), "incompatibleTokens", "*"), e
                    }
                    return ac(r, [{
                        key: "parse",
                        value: function(e) {
                            return aY(aj, e)
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return [new Date(1e3 * r), {
                                timestampIsSet: !0
                            }]
                        }
                    }]), r
                }(ah),
                ob = function(e) {
                    ar(r, e);
                    var t = aa(r);

                    function r() {
                        var e;
                        ao(this, r);
                        for (var n = arguments.length, i = Array(n), a = 0; a < n; a++) i[a] = arguments[a];
                        return al(ae(e = t.call.apply(t, [this].concat(i))), "priority", 20), al(ae(e), "incompatibleTokens", "*"), e
                    }
                    return ac(r, [{
                        key: "parse",
                        value: function(e) {
                            return aY(aj, e)
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return [new Date(r), {
                                timestampIsSet: !0
                            }]
                        }
                    }]), r
                }(ah),
                oy = {
                    G: new am,
                    y: new az,
                    Y: new aX,
                    R: new aQ,
                    u: new a$,
                    Q: new aJ,
                    q: new aZ,
                    M: new a0,
                    L: new a1,
                    w: new a2,
                    I: new a3,
                    d: new a5,
                    D: new a8,
                    E: new a9,
                    e: new oe,
                    c: new ot,
                    i: new or,
                    a: new on,
                    b: new oi,
                    B: new oa,
                    h: new oo,
                    H: new os,
                    K: new ou,
                    k: new oc,
                    m: new ol,
                    s: new od,
                    S: new op,
                    X: new of,
                    x: new oh,
                    t: new om,
                    T: new ob
                },
                ov = /[yYQqMLwIdDecihHKkms]o|(\w)\1*|''|'(''|[^'])+('|$)|./g,
                og = /P+p+|P+|p+|''|'(''|[^'])+('|$)|./g,
                ow = /^'([^]*?)'?$/,
                oP = /''/g,
                oS = /\S/,
                ox = /[a-zA-Z]/;

            function oE(e, t, r, n) {
                iP(3, arguments);
                var i = String(e),
                    a = String(t),
                    o = null != (c = null != (l = null == n ? void 0 : n.locale) ? l : iA.locale) ? c : i1;
                if (!o.match) throw RangeError("locale must contain match property");
                var s = ix(null != (d = null != (p = null != (f = null != (h = null == n ? void 0 : n.firstWeekContainsDate) ? h : null == n || null == (m = n.locale) || null == (b = m.options) ? void 0 : b.firstWeekContainsDate) ? f : iA.firstWeekContainsDate) ? p : null == (y = iA.locale) || null == (v = y.options) ? void 0 : v.firstWeekContainsDate) ? d : 1);
                if (!(s >= 1 && s <= 7)) throw RangeError("firstWeekContainsDate must be between 1 and 7 inclusively");
                var u = ix(null != (g = null != (w = null != (P = null != (S = null == n ? void 0 : n.weekStartsOn) ? S : null == n || null == (x = n.locale) || null == (E = x.options) ? void 0 : E.weekStartsOn) ? P : iA.weekStartsOn) ? w : null == (T = iA.locale) || null == (C = T.options) ? void 0 : C.weekStartsOn) ? g : 0);
                if (!(u >= 0 && u <= 6)) throw RangeError("weekStartsOn must be between 0 and 6 inclusively");
                if ("" === a)
                    if ("" === i) return iS(r);
                    else return new Date(NaN);
                var c, l, d, p, f, h, m, b, y, v, g, w, P, S, x, E, T, C, O, A = {
                        firstWeekContainsDate: s,
                        weekStartsOn: u,
                        locale: o
                    },
                    I = [new af],
                    j = a.match(og).map(function(e) {
                        var t = e[0];
                        return t in iq ? (0, iq[t])(e, o.formatLong) : e
                    }).join("").match(ov),
                    k = [],
                    D = i9(j);
                try {
                    for (D.s(); !(O = D.n()).done;) {
                        var N = function() {
                            var t = O.value;
                            !(null != n && n.useAdditionalWeekYearTokens) && iK(t) && iz(t, a, e), !(null != n && n.useAdditionalDayOfYearTokens) && iG(t) && iz(t, a, e);
                            var r = t[0],
                                s = oy[r];
                            if (s) {
                                var u = s.incompatibleTokens;
                                if (Array.isArray(u)) {
                                    var c = k.find(function(e) {
                                        return u.includes(e.token) || e.token === r
                                    });
                                    if (c) throw RangeError("The format string mustn't contain `".concat(c.fullToken, "` and `").concat(t, "` at the same time"))
                                } else if ("*" === s.incompatibleTokens && k.length > 0) throw RangeError("The format string mustn't contain `".concat(t, "` and any other token at the same time"));
                                k.push({
                                    token: r,
                                    fullToken: t
                                });
                                var l = s.run(i, t, o.match, A);
                                if (!l) return {
                                    v: new Date(NaN)
                                };
                                I.push(l.setter), i = l.rest
                            } else {
                                if (r.match(ox)) throw RangeError("Format string contains an unescaped latin alphabet character `" + r + "`");
                                if ("''" === t ? t = "'" : "'" === r && (t = t.match(ow)[1].replace(oP, "'")), 0 !== i.indexOf(t)) return {
                                    v: new Date(NaN)
                                };
                                i = i.slice(t.length)
                            }
                        }();
                        if ("object" === iw(N)) return N.v
                    }
                } catch (e) {
                    D.e(e)
                } finally {
                    D.f()
                }
                if (i.length > 0 && oS.test(i)) return new Date(NaN);
                var R = I.map(function(e) {
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
                    M = iS(r);
                if (isNaN(M.getTime())) return new Date(NaN);
                var U, L = iE(M, iH(M)),
                    _ = {},
                    B = i9(R);
                try {
                    for (B.s(); !(U = B.n()).done;) {
                        var F = U.value;
                        if (!F.validate(L, A)) return new Date(NaN);
                        var Y = F.set(L, _, A);
                        Array.isArray(Y) ? (L = Y[0], function(e, t) {
                            if (null == e) throw TypeError("assign requires that input parameter not be null or undefined");
                            for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
                        }(_, Y[1])) : L = Y
                    }
                } catch (e) {
                    B.e(e)
                } finally {
                    B.f()
                }
                return L
            }

            function oT(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oC(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
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
                        if ("string" == typeof e) return oT(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oT(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var oO = function(e, t) {
                    return "".concat(e.toString().padStart(2, "0"), "/").concat(i8(oE(t.toString(), "yyyy", new Date), "yy"))
                },
                oA = function(e) {
                    if (!e.includes("/")) return [0, 0];
                    var t = oC(e.split("/"), 2),
                        r = t[0],
                        n = t[1];
                    return !r || !n || 1 > Number.parseInt(r, 10) || Number.parseInt(r, 10) > 12 || 2 !== n.length ? [0, 0] : [Number.parseInt(r, 10), Number.parseInt(i8(oE(Number.parseInt(n, 10).toString(), "yy", new Date), "yyyy"), 10)]
                },
                oI = function(e) {
                    var t = oC(oA(e), 2),
                        r = t[0],
                        n = t[1];
                    return 0 === r || 0 === n ? new Date : new Date(n, r - 1)
                };

            function oj(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ok(e, t, r, n, i, a, o) {
                try {
                    var s = e[a](o),
                        u = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(u) : Promise.resolve(u).then(n, i)
            }

            function oD(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, i) {
                        var a = e.apply(t, r);

                        function o(e) {
                            ok(a, n, i, o, s, "next", e)
                        }

                        function s(e) {
                            ok(a, n, i, o, s, "throw", e)
                        }
                        o(void 0)
                    })
                }
            }

            function oN(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
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
                        if ("string" == typeof e) return oj(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oj(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oR(e, t) {
                var r, n, i, a = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    s = Object.defineProperty;
                return s(o, "next", {
                    value: u(0)
                }), s(o, "throw", {
                    value: u(1)
                }), s(o, "return", {
                    value: u(2)
                }), "function" == typeof Symbol && s(o, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), o;

                function u(s) {
                    return function(u) {
                        var c = [s, u];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; o && (o = 0, c[0] && (a = 0)), a;) try {
                            if (r = 1, n && (i = 2 & c[0] ? n.return : c[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, c[1])).done) return i;
                            switch (n = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                                case 0:
                                case 1:
                                    i = c;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                        a.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && a.label < i[1]) {
                                        a.label = i[1], i = c;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(c);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            c = t.call(e, a)
                        } catch (e) {
                            c = [6, e], n = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var oM = function(e) {
                var t = e.subscriptionId,
                    r = e.paymentProfiles,
                    n = e.defaultPaymentProfile,
                    i = e.isOpen,
                    a = e.isUserUnder18,
                    o = e.subscription,
                    s = e.onClose,
                    u = e.onSave,
                    c = e.onPaymentProfileExpirationUpdate,
                    l = e.fetchSavedPaymentProfiles,
                    d = (0, T.useTranslation)().translate,
                    p = oN((0, w.useState)(!1), 2),
                    f = p[0],
                    h = p[1],
                    m = oN((0, w.useState)(!1), 2),
                    b = m[0],
                    y = m[1],
                    v = oN((0, w.useState)(null), 2),
                    S = (v[0], v[1]),
                    x = oN((0, w.useState)(n), 2),
                    E = x[0],
                    C = x[1],
                    O = oN((0, w.useState)(!1), 2),
                    A = O[0],
                    I = O[1],
                    j = oN((0, w.useState)(oO(n.providerPayload.ExpMonth, n.providerPayload.ExpYear)), 2),
                    D = j[0],
                    R = j[1],
                    M = r8().systemFeedbackService,
                    U = oN((0, w.useState)(!1), 2),
                    L = U[0],
                    _ = U[1],
                    B = oN(P().useState(!1), 2),
                    F = B[0],
                    Y = B[1],
                    q = (0, w.useRef)(null),
                    H = (0, ic.useStripe)(),
                    V = (0, ic.useElements)(),
                    W = (0, w.useRef)("");
                (0, w.useEffect)(function() {
                    if (!L) {
                        var e = new Date(E.providerPayload.ExpYear, E.providerPayload.ExpMonth - 1),
                            t = oI(D),
                            r = new Date(new Date().getFullYear(), new Date().getMonth());
                        y(t !== e && t >= r || E.id !== n.id), Y(t < r || t < e)
                    }
                }, [n.id, D, E, L]);
                var G = (0, w.useCallback)(function() {
                        var e;
                        (null == (e = q.current) ? void 0 : e.scrollTop) && (q.current.scrollTop = 0), I(!1)
                    }, []),
                    K = (0, w.useCallback)(function() {
                        _(!1), G(), y(!1), h(!1), s()
                    }, [G, s]),
                    z = (0, w.useCallback)(function(e, i) {
                        return oD(function() {
                            var s, p, f, m, b, v;
                            return oR(this, function(g) {
                                var w, P, S;
                                switch (g.label) {
                                    case 0:
                                        if (ns(na.CLICK_UPDATE_PAYMENT_METHOD, o), h(!0), y(!1), !i || !(oI(i) > new Date(E.providerPayload.ExpYear, E.providerPayload.ExpMonth - 1))) return [3, 4];
                                        f = (p = oN(oA(i), 2))[0], m = p[1], g.label = 1;
                                    case 1:
                                        return g.trys.push([1, 3, , 4]), (0, k.fireEvent)(nI), [4, (w = f, P = m, io(function() {
                                            return is(this, function(t) {
                                                switch (t.label) {
                                                    case 0:
                                                        return [4, N.httpService.post(ts.url.updatePaymentProfile(e), {
                                                            expirationMonth: w,
                                                            expirationYear: P
                                                        })];
                                                    case 1:
                                                        return [2, 200 === t.sent().status]
                                                }
                                            })
                                        })())];
                                    case 2:
                                        return g.sent(), s = "Description.PaymentExpirationUpdateSuccess", ns(na.UPDATE_PAYMENT_METHOD_EXPIRATION_SUCCESS, o), (0, k.fireEvent)(nj), c(E, f, m), [3, 4];
                                    case 3:
                                        return g.sent(), (0, k.fireEvent)(nk), ns(na.UPDATE_PAYMENT_METHOD_EXPIRATION_FAILURE, o), M.warning(d("Error.PaymentMethodUpdateFailed")), s = "", [3, 4];
                                    case 4:
                                        if ("" === s || e === n.id) return [3, 12];
                                        g.label = 5;
                                    case 5:
                                        return g.trys.push([5, 11, , 12]), (0, k.fireEvent)(nI), [4, tp(function() {
                                            var r;
                                            return th(this, function(n) {
                                                switch (n.label) {
                                                    case 0:
                                                        return r = ts.url.updateSubscriptionPaymentProfile(t), [4, N.httpService.post(r, {
                                                            paymentProfileId: e
                                                        })];
                                                    case 1:
                                                        return n.sent(), [2]
                                                }
                                            })
                                        })()];
                                    case 6:
                                        if (g.sent(), (0, k.fireEvent)(nj), ns(na.UPDATE_PAYMENT_METHOD_SUCCESS, o), s = "Message.PaymentUpdateSuccess", !a) return [3, 10];
                                        g.label = 7;
                                    case 7:
                                        return g.trys.push([7, 9, , 10]), (0, k.fireEvent)(nC), [4, (S = n.id, io(function() {
                                            return is(this, function(e) {
                                                switch (e.label) {
                                                    case 0:
                                                        return [4, N.httpService.delete(ts.url.updatePaymentProfile(S))];
                                                    case 1:
                                                        return [2, 200 === e.sent().status]
                                                }
                                            })
                                        })())];
                                    case 8:
                                        return g.sent(), (0, k.fireEvent)(nO), [3, 10];
                                    case 9:
                                        throw b = g.sent(), (0, k.fireEvent)(nA), b;
                                    case 10:
                                        return [3, 12];
                                    case 11:
                                        return g.sent(), (0, k.fireEvent)(nk), ns(na.UPDATE_PAYMENT_METHOD_FAILURE, o), M.warning(d("Error.PaymentMethodUpdateFailed")), G(), h(!1), K(), [3, 12];
                                    case 12:
                                        if (G(), h(!1), void 0 === s || "" === s || (M.success(d(s)), "Message.PaymentUpdateSuccess" !== s)) return [3, 15];
                                        if (void 0 !== (v = r.find(function(t) {
                                                return t.id === e
                                            }))) return [3, 14];
                                        return [4, l()];
                                    case 13:
                                        v = g.sent().find(function(t) {
                                            return t.id === e
                                        }), g.label = 14;
                                    case 14:
                                        u(v), g.label = 15;
                                    case 15:
                                        return K(), [2]
                                }
                            })
                        })()
                    }, [G, K, n.id, l, a, c, u, r, E, o, t, M, d]),
                    X = (0, w.useCallback)(function() {
                        return oD(function() {
                            var e;
                            return oR(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        var r;
                                        return t.trys.push([0, 2, , 3]), [4, (r = W.current, io(function() {
                                            var e, t;
                                            return is(this, function(n) {
                                                switch (n.label) {
                                                    case 0:
                                                        return [4, N.httpService.get(ts.url.verifyPaymentProfileCreation(r))];
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
                        return oD(function() {
                            var n;
                            return oR(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        return i.trys.push([0, 4, , 5]), [4, e()];
                                    case 1:
                                        if (void 0 === (n = i.sent()) || "" === n) return [3, 3];
                                        return [4, z(n, "")];
                                    case 2:
                                        return i.sent(), ns(na.UPDATE_PAYMENT_METHOD_ADD_CARD_SUCCESS, o), h(!1), [2];
                                    case 3:
                                        if (0 === r) return h(!1), [2];
                                        return setTimeout(function() {
                                            return oD(function() {
                                                return oR(this, function(n) {
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
                                        return i.sent(), M.warning(d("Description.SavedCreditCard.SavePaymentMethodSomethingWentWrong")), [3, 5];
                                    case 5:
                                        return [2]
                                }
                            })
                        })()
                    }, [o, M, d, z]),
                    $ = (0, w.useCallback)(function() {
                        return oD(function() {
                            var e, t, r, n, i, s, u, c, l;
                            return oR(this, function(p) {
                                switch (p.label) {
                                    case 0:
                                        if (!H || !V) return [2];
                                        h(!0), t = {
                                            payment_method_data: {
                                                billing_details: {},
                                                allow_redisplay: e = a ? "limited" : "always"
                                            }
                                        }, p.label = 1;
                                    case 1:
                                        return p.trys.push([1, 7, , 8]), [4, H.confirmSetup({
                                            elements: V,
                                            confirmParams: t,
                                            redirect: "if_required"
                                        })];
                                    case 2:
                                        if ((null == (i = p.sent()) || null == (r = i.setupIntent) ? void 0 : r.status) !== "succeeded") return [3, 5];
                                        if (W.current = null != (s = null == i || null == (c = i.setupIntent) || null == (u = c.payment_method) ? void 0 : u.toString()) ? s : "", !W.current) return [3, 4];
                                        return [4, Q(X, 3e3, 3)];
                                    case 3:
                                        p.sent(), p.label = 4;
                                    case 4:
                                        return "limited" === e && (0, k.fireEvent)(ny), [3, 6];
                                    case 5:
                                        if (null == i || null == (n = i.error) ? void 0 : n.code) {
                                            switch (ns(na.UPDATE_PAYMENT_METHOD_ADD_CARD_FAILURE, o), i.error.code) {
                                                case "incorrect_cvc":
                                                case "expired_card":
                                                    S(null == i || null == (l = i.error) ? void 0 : l.code);
                                                    break;
                                                case "card_declined":
                                                    M.warning(d("Description.SavedCreditCard.CardDeclinedErrorMessage")), K();
                                                    break;
                                                default:
                                                    M.warning(d("MessageUnknownError"))
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
                    }, [H, V, a, Q, X, o, M, d, K]),
                    J = (0, w.useCallback)(function(e) {
                        return (0, g.jsxs)("div", {
                            className: "payment-method-container",
                            children: [(0, g.jsx)("span", {
                                className: tE()("card-icon", re(e.providerPayload.CardNetwork))
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
                                C(e), h(e.id === n.id), R(oO(e.providerPayload.ExpMonth, e.providerPayload.ExpYear)), G(), _(!1), y(!0)
                            },
                            children: J(e)
                        }, e.id)
                    }, [G, n.id, J]);
                return void 0 === n ? (0, g.jsx)(w.Fragment, {}) : (0, g.jsxs)(tT.Modal, {
                    show: i,
                    onHide: K,
                    size: "md",
                    className: "subscription-update-payment-method",
                    children: [(0, g.jsx)(tT.Modal.Header, {
                        title: d("Heading.SavedCreditCard.UpdatePaymentMethod"),
                        onClose: K
                    }), (0, g.jsxs)(tT.Modal.Body, {
                        children: [(0, g.jsx)("div", {
                            className: "modal-description font-header-2 text-emphasis",
                            children: d("Heading.SavedCreditCard.CreditOrDebitCard")
                        }), (0, g.jsxs)("div", {
                            className: "custom-select",
                            children: [(0, g.jsxs)("button", {
                                id: "select-payment-profile-button",
                                type: "button",
                                role: "combobox",
                                className: tE()("select-button", {
                                    active: A
                                }),
                                "aria-labelledby": "select-payment-profile-button",
                                "aria-haspopup": "listbox",
                                "aria-expanded": "false",
                                "aria-controls": "select-payment-profile-dropdown",
                                onClick: function() {
                                    A ? G() : I(!0)
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
                                ref: q,
                                className: tE()("select-dropdown", {
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
                                        G(), ns(na.UPDATE_PAYMENT_METHOD_ADD_CARD_CLICKED, o), _(!0)
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
                                className: "expiry-input ".concat(F ? "error-input" : ""),
                                value: D,
                                inputMode: "numeric",
                                onChange: function(e) {
                                    var t = e.target.value;
                                    D.startsWith(t) || (D.length >= 2 && t.startsWith("1/") && (t = "0".concat(t)), (t = t.replace(/\D/g, "")).length > 4 && (t = t.slice(0, 4)), 1 === t.length && "0" !== t && "1" !== t ? t = "0".concat(t, "/") : 2 === t.length && Number(t) > 12 ? t = "0".concat(t.slice(0, 1), "/").concat(t.slice(1)) : t.length >= 2 && t.length <= 4 && (t = "".concat(t.slice(0, 2), "/").concat(t.slice(2)))), R(t)
                                }
                            }), F && (0, g.jsx)("div", {
                                className: "font-caption-body input-error-text",
                                children: d("Error.InvalidExpirationDate")
                            })]
                        }), L && (0, g.jsx)(ig, {
                            showEmail: !1,
                            showDisclosure: !1,
                            onFormStatusChange: function(e) {
                                return y(e)
                            }
                        })]
                    }), (0, g.jsx)("div", {
                        className: "footer-divider"
                    }), (0, g.jsxs)(tT.Modal.Footer, {
                        children: [(0, g.jsx)("span", {
                            className: "font-caption-body",
                            dangerouslySetInnerHTML: Z
                        }), (0, g.jsxs)("div", {
                            className: "modal-buttons",
                            children: [(0, g.jsx)(tT.Button, {
                                variant: tT.Button.variants.secondary,
                                width: tT.Button.widths.full,
                                size: tT.Button.sizes.large,
                                className: "action-button",
                                onClick: K,
                                children: d("Action.Cancel")
                            }), (0, g.jsxs)(tT.Button, {
                                width: tT.Button.widths.full,
                                size: tT.Button.sizes.large,
                                className: "action-button",
                                isLoading: f,
                                isDisabled: !b,
                                onClick: function() {
                                    return oD(function() {
                                        return oR(this, function(e) {
                                            switch (e.label) {
                                                case 0:
                                                    if (L) return [3, 2];
                                                    return [4, z(E.id, D)];
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

            function oU(e, t, r, n, i, a, o) {
                try {
                    var s = e[a](o),
                        u = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(u) : Promise.resolve(u).then(n, i)
            }
            var oL = function() {
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
                            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                            s = Object.defineProperty;
                        return s(o, "next", {
                            value: u(0)
                        }), s(o, "throw", {
                            value: u(1)
                        }), s(o, "return", {
                            value: u(2)
                        }), "function" == typeof Symbol && s(o, Symbol.iterator, {
                            value: function() {
                                return this
                            }
                        }), o;

                        function u(s) {
                            return function(u) {
                                var c = [s, u];
                                if (r) throw TypeError("Generator is already executing.");
                                for (; o && (o = 0, c[0] && (a = 0)), a;) try {
                                    if (r = 1, n && (i = 2 & c[0] ? n.return : c[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, c[1])).done) return i;
                                    switch (n = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                                        case 0:
                                        case 1:
                                            i = c;
                                            break;
                                        case 4:
                                            return a.label++, {
                                                value: c[1],
                                                done: !1
                                            };
                                        case 5:
                                            a.label++, n = c[1], c = [0];
                                            continue;
                                        case 7:
                                            c = a.ops.pop(), a.trys.pop();
                                            continue;
                                        default:
                                            if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                a = 0;
                                                continue
                                            }
                                            if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                                a.label = c[1];
                                                break
                                            }
                                            if (6 === c[0] && a.label < i[1]) {
                                                a.label = i[1], i = c;
                                                break
                                            }
                                            if (i && a.label < i[2]) {
                                                a.label = i[2], a.ops.push(c);
                                                break
                                            }
                                            i[2] && a.ops.pop(), a.trys.pop();
                                            continue
                                    }
                                    c = t.call(e, a)
                                } catch (e) {
                                    c = [6, e], n = 0
                                } finally {
                                    r = i = 0
                                }
                                if (5 & c[0]) throw c[1];
                                return {
                                    value: c[0] ? c[1] : void 0,
                                    done: !0
                                }
                            }
                        }
                    }(this, function(e) {
                        return [2, N.httpService.get(ts.url.getUserBirthdateUrlConfig())]
                    })
                }, function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, i) {
                        var a = e.apply(t, r);

                        function o(e) {
                            oU(a, n, i, o, s, "next", e)
                        }

                        function s(e) {
                            oU(a, n, i, o, s, "throw", e)
                        }
                        o(void 0)
                    })
                })()
            };

            function o_(e, t) {
                iP(2, arguments);
                var r = iS(e),
                    n = iS(t),
                    i = r.getTime() - n.getTime();
                return i < 0 ? -1 : i > 0 ? 1 : i
            }

            function oB(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var oF = function(e, t) {
                return (oF = Object.setPrototypeOf || oB({
                    __proto__: []
                }, Array) && function(e, t) {
                    e.__proto__ = t
                } || function(e, t) {
                    for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
                })(e, t)
            };

            function oY(e, t, r, n) {
                return new(r || (r = Promise))(function(i, a) {
                    function o(e) {
                        try {
                            u(n.next(e))
                        } catch (e) {
                            a(e)
                        }
                    }

                    function s(e) {
                        try {
                            u(n.throw(e))
                        } catch (e) {
                            a(e)
                        }
                    }

                    function u(e) {
                        var t;
                        e.done ? i(e.value) : (oB(t = e.value, r) ? t : new r(function(e) {
                            e(t)
                        })).then(o, s)
                    }
                    u((n = n.apply(e, t || [])).next())
                })
            }

            function oq(e, t) {
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
                    return function(u) {
                        var c = [s, u];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; o && (o = 0, c[0] && (a = 0)), a;) try {
                            if (r = 1, n && (i = 2 & c[0] ? n.return : c[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, c[1])).done) return i;
                            switch (n = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                                case 0:
                                case 1:
                                    i = c;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                        a.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && a.label < i[1]) {
                                        a.label = i[1], i = c;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(c);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            c = t.call(e, a)
                        } catch (e) {
                            c = [6, e], n = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            "function" == typeof SuppressedError && SuppressedError;
            var oH = function(e) {
                    function t() {
                        return null !== e && e.apply(this, arguments) || this
                    }
                    return function(e, t) {
                        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                        function r() {
                            this.constructor = e
                        }
                        oF(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
                    }(t, e), t.prototype.privateServersGetPrivateServersSystemSettingsRaw = function(e, t) {
                        return oY(this, void 0, void 0, function() {
                            var r, n;
                            return oq(this, function(i) {
                                switch (i.label) {
                                    case 0:
                                        return r = {}, n = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (n["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                            path: "/v2/private-servers/system-settings",
                                            schemaPath: "/v2/private-servers/system-settings",
                                            method: "GET",
                                            headers: n,
                                            query: r
                                        }, t)];
                                    case 1:
                                        return [2, new eV(i.sent(), function(e) {
                                            return null == e ? e : {
                                                enforcementStartDate: new Date(e.enforcementStartDate),
                                                plusFreePrivateServerCap: e.plusFreePrivateServerCap,
                                                displayPlusFreePrivateServers: e.displayPlusFreePrivateServers
                                            }
                                        })]
                                }
                            })
                        })
                    }, t.prototype.privateServersGetPrivateServersSystemSettings = function() {
                        return oY(this, arguments, void 0, function(e, t) {
                            return void 0 === e && (e = {}), oq(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return [4, this.privateServersGetPrivateServersSystemSettingsRaw(e, t)];
                                    case 1:
                                        return [4, r.sent().value()];
                                    case 2:
                                        return [2, r.sent()]
                                }
                            })
                        })
                    }, t
                }(eB),
                oV = window.Roblox["core-scripts"].environmentUrls,
                oW = r.n(oV);

            function oG(e, t, r, n, i, a, o) {
                try {
                    var s = e[a](o),
                        u = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(u) : Promise.resolve(u).then(n, i)
            }

            function oK(e) {
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
            var oz = new oH(new eW({
                    basePath: "".concat(oW().apiGatewayUrl, "/private-servers-api-v2"),
                    credentials: "include"
                })),
                oX = function(e, t) {
                    var r;
                    return (r = function() {
                        var r;
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
                                o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                s = Object.defineProperty;
                            return s(o, "next", {
                                value: u(0)
                            }), s(o, "throw", {
                                value: u(1)
                            }), s(o, "return", {
                                value: u(2)
                            }), "function" == typeof Symbol && s(o, Symbol.iterator, {
                                value: function() {
                                    return this
                                }
                            }), o;

                            function u(s) {
                                return function(u) {
                                    var c = [s, u];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; o && (o = 0, c[0] && (a = 0)), a;) try {
                                        if (r = 1, n && (i = 2 & c[0] ? n.return : c[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, c[1])).done) return i;
                                        switch (n = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                                            case 0:
                                            case 1:
                                                i = c;
                                                break;
                                            case 4:
                                                return a.label++, {
                                                    value: c[1],
                                                    done: !1
                                                };
                                            case 5:
                                                a.label++, n = c[1], c = [0];
                                                continue;
                                            case 7:
                                                c = a.ops.pop(), a.trys.pop();
                                                continue;
                                            default:
                                                if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                    a = 0;
                                                    continue
                                                }
                                                if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                                    a.label = c[1];
                                                    break
                                                }
                                                if (6 === c[0] && a.label < i[1]) {
                                                    a.label = i[1], i = c;
                                                    break
                                                }
                                                if (i && a.label < i[2]) {
                                                    a.label = i[2], a.ops.push(c);
                                                    break
                                                }
                                                i[2] && a.ops.pop(), a.trys.pop();
                                                continue
                                        }
                                        c = t.call(e, a)
                                    } catch (e) {
                                        c = [6, e], n = 0
                                    } finally {
                                        r = i = 0
                                    }
                                    if (5 & c[0]) throw c[1];
                                    return {
                                        value: c[0] ? c[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(n) {
                            switch (n.label) {
                                case 0:
                                    return [4, N.httpService.patch(ts.url.updateVipServerSubscription(t), oK({}, e))];
                                case 1:
                                    var i, a;
                                    return [2, (i = oK({}, r = n.sent().data), a = a = {
                                        expirationDate: new Date(r.expirationDate)
                                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(i, Object.getOwnPropertyDescriptors(a)) : (function(e) {
                                        var t = Object.keys(e);
                                        if (Object.getOwnPropertySymbols) {
                                            var r = Object.getOwnPropertySymbols(e);
                                            t.push.apply(t, r)
                                        }
                                        return t
                                    })(Object(a)).forEach(function(e) {
                                        Object.defineProperty(i, e, Object.getOwnPropertyDescriptor(a, e))
                                    }), i)]
                            }
                        })
                    }, function() {
                        var e = this,
                            t = arguments;
                        return new Promise(function(n, i) {
                            var a = r.apply(e, t);

                            function o(e) {
                                oG(a, n, i, o, s, "next", e)
                            }

                            function s(e) {
                                oG(a, n, i, o, s, "throw", e)
                            }
                            o(void 0)
                        })
                    })()
                },
                oQ = function(e) {
                    var t, r, n, i, a = e.privateServer,
                        o = e.willRenew,
                        s = e.open,
                        u = e.setOpen,
                        c = e.onConfirm,
                        l = e.submitting,
                        d = (0, T.useTranslation)().translate,
                        p = a.expirationDate.toLocaleDateString(void 0, {
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
                    }), n = d("Button.Renew")), (0, g.jsxs)(A.Dialog, {
                        className: "private-server-subscription-modal",
                        maxWidth: "Medium",
                        open: s,
                        onClose: function() {
                            return u(!1)
                        },
                        TransitionProps: {
                            timeout: 0
                        },
                        children: [(0, g.jsx)(A.DialogTitle, {
                            className: "private-server-subscription-modal-title",
                            children: t
                        }), (0, g.jsx)(A.DialogContent, {
                            className: "private-server-subscription-modal-content",
                            dividers: !0,
                            children: (0, g.jsx)(A.DialogContentText, {
                                children: r
                            })
                        }), (0, g.jsxs)(A.DialogActions, {
                            className: "private-server-subscription-modal-footer",
                            children: [(0, g.jsx)(A.Button, {
                                className: "action-button",
                                variant: "contained",
                                color: "secondary",
                                onClick: function() {
                                    return u(!1)
                                },
                                children: d("Action.Dialog.Cancel")
                            }), (0, g.jsx)(A.Button, {
                                className: "action-button",
                                variant: "contained",
                                onClick: c,
                                disabled: l,
                                children: n
                            })]
                        })]
                    })
                };

            function o$(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oJ(e, t, r, n, i, a, o) {
                try {
                    var s = e[a](o),
                        u = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(u) : Promise.resolve(u).then(n, i)
            }

            function oZ(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
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
                        if ("string" == typeof e) return o$(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return o$(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var o0 = function(e) {
                    var t = e.privateServer,
                        r = e.onBack,
                        n = (0, T.useTranslation)().translate,
                        i = r8().systemFeedbackService,
                        a = oZ((0, w.useState)(!1), 2),
                        o = a[0],
                        s = a[1],
                        u = oZ((0, w.useState)(!1), 2),
                        c = u[0],
                        l = u[1],
                        d = oZ((0, w.useState)(t.willRenew), 2),
                        p = d[0],
                        f = d[1],
                        h = oZ((0, w.useState)(t.priceInRobux), 2),
                        m = h[0],
                        b = h[1],
                        y = oZ((0, w.useState)(t.expirationDate), 2),
                        v = y[0],
                        P = y[1],
                        S = "/private-server/configure/".concat(t.privateServerId),
                        x = n("Label.PrivateServer", {
                            privateServerName: t.name
                        }),
                        E = p ? n("Heading.Unsubscribe") : n("Heading.RenewSubscription"),
                        C = rS({
                            expirationDate: v,
                            willRenew: p,
                            benefitCapOutcome: t.benefitCapOutcome,
                            firstRenewalOnOrAfterEnforcement: t.firstRenewalOnOrAfterEnforcement
                        }),
                        O = C.expiryDateWithCap,
                        I = C.renewalDateWithCap,
                        j = "becomesPaid" === t.benefitCapOutcome ? t.firstRenewalOnOrAfterEnforcement : void 0,
                        k = (0, w.useCallback)(function() {
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
                                        o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                        s = Object.defineProperty;
                                    return s(o, "next", {
                                        value: u(0)
                                    }), s(o, "throw", {
                                        value: u(1)
                                    }), s(o, "return", {
                                        value: u(2)
                                    }), "function" == typeof Symbol && s(o, Symbol.iterator, {
                                        value: function() {
                                            return this
                                        }
                                    }), o;

                                    function u(s) {
                                        return function(u) {
                                            var c = [s, u];
                                            if (r) throw TypeError("Generator is already executing.");
                                            for (; o && (o = 0, c[0] && (a = 0)), a;) try {
                                                if (r = 1, n && (i = 2 & c[0] ? n.return : c[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, c[1])).done) return i;
                                                switch (n = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                                                    case 0:
                                                    case 1:
                                                        i = c;
                                                        break;
                                                    case 4:
                                                        return a.label++, {
                                                            value: c[1],
                                                            done: !1
                                                        };
                                                    case 5:
                                                        a.label++, n = c[1], c = [0];
                                                        continue;
                                                    case 7:
                                                        c = a.ops.pop(), a.trys.pop();
                                                        continue;
                                                    default:
                                                        if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                                            a = 0;
                                                            continue
                                                        }
                                                        if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                                            a.label = c[1];
                                                            break
                                                        }
                                                        if (6 === c[0] && a.label < i[1]) {
                                                            a.label = i[1], i = c;
                                                            break
                                                        }
                                                        if (i && a.label < i[2]) {
                                                            a.label = i[2], a.ops.push(c);
                                                            break
                                                        }
                                                        i[2] && a.ops.pop(), a.trys.pop();
                                                        continue
                                                }
                                                c = t.call(e, a)
                                            } catch (e) {
                                                c = [6, e], n = 0
                                            } finally {
                                                r = i = 0
                                            }
                                            if (5 & c[0]) throw c[1];
                                            return {
                                                value: c[0] ? c[1] : void 0,
                                                done: !0
                                            }
                                        }
                                    }
                                }(this, function(r) {
                                    switch (r.label) {
                                        case 0:
                                            s(!0), r.label = 1;
                                        case 1:
                                            return r.trys.push([1, 3, 4, 5]), [4, oX({
                                                price: null != m ? m : 0,
                                                active: !p
                                            }, t.privateServerId.toString())];
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
                                        oJ(a, n, i, o, s, "next", e)
                                    }

                                    function s(e) {
                                        oJ(a, n, i, o, s, "throw", e)
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
                                children: [(0, g.jsx)(oQ, {
                                    privateServer: t,
                                    open: c,
                                    setOpen: l,
                                    onConfirm: k,
                                    willRenew: p,
                                    submitting: o
                                }), (0, g.jsxs)("div", {
                                    className: "thumbnail-and-button-container",
                                    children: [(0, g.jsx)("div", {
                                        className: "detail-card-icon-container",
                                        children: (0, g.jsx)(tC.Thumbnail2d, {
                                            targetId: t.universeId,
                                            type: tC.ThumbnailTypes.gameIcon,
                                            imgClassName: "detail-icon",
                                            containerClass: "thumbnail-detail-container",
                                            altName: t.universeName
                                        })
                                    }), (0, g.jsx)(A.Button, {
                                        variant: "contained",
                                        className: "subscribe-button",
                                        color: p ? "secondary" : void 0,
                                        disabled: o || c,
                                        onClick: function() {
                                            return l(!0)
                                        },
                                        children: E
                                    })]
                                }), (0, g.jsx)("h2", {
                                    className: "detail-subscription-name",
                                    children: x
                                }), (0, g.jsx)(A.Link, {
                                    href: "/games/".concat(t.placeId),
                                    underline: "hover",
                                    className: "text-description",
                                    children: t.universeName
                                }), (0, g.jsx)(t3, {
                                    priceInRobux: m,
                                    totalDiscountAmountInRobux: t.totalDiscountAmountInRobux,
                                    freeUntil: j
                                }), (0, g.jsx)(t4, {
                                    expiration: O,
                                    renewal: I
                                }), (0, g.jsx)(A.Button, {
                                    variant: "text",
                                    component: "a",
                                    size: "small",
                                    startIcon: (0, g.jsx)(A.EditIcon, {}),
                                    href: S,
                                    className: "configure-private-server-button",
                                    children: n("Label.ConfigurePrivateServer")
                                }), (0, g.jsx)(A.Divider, {
                                    className: "divider"
                                })]
                            })]
                        })
                    })
                },
                o1 = window.Roblox["core-scripts"].http.http,
                o2 = function() {
                    return ["privateServers", "all"]
                };

            function o3(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function o4(e, t, r, n, i, a, o) {
                try {
                    var s = e[a](o),
                        u = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(u) : Promise.resolve(u).then(n, i)
            }

            function o6(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, i) {
                        var a = e.apply(t, r);

                        function o(e) {
                            o4(a, n, i, o, s, "next", e)
                        }

                        function s(e) {
                            o4(a, n, i, o, s, "throw", e)
                        }
                        o(void 0)
                    })
                }
            }

            function o5(e) {
                return function(e) {
                    if (Array.isArray(e)) return o3(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return o3(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return o3(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function o8(e, t) {
                var r, n, i, a = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    s = Object.defineProperty;
                return s(o, "next", {
                    value: u(0)
                }), s(o, "throw", {
                    value: u(1)
                }), s(o, "return", {
                    value: u(2)
                }), "function" == typeof Symbol && s(o, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), o;

                function u(s) {
                    return function(u) {
                        var c = [s, u];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; o && (o = 0, c[0] && (a = 0)), a;) try {
                            if (r = 1, n && (i = 2 & c[0] ? n.return : c[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, c[1])).done) return i;
                            switch (n = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                                case 0:
                                case 1:
                                    i = c;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                        a.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && a.label < i[1]) {
                                        a.label = i[1], i = c;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(c);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            c = t.call(e, a)
                        } catch (e) {
                            c = [6, e], n = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }

            function o7(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function o9(e, t, r, n, i, a, o) {
                try {
                    var s = e[a](o),
                        u = s.value
                } catch (e) {
                    r(e);
                    return
                }
                s.done ? t(u) : Promise.resolve(u).then(n, i)
            }

            function se(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, i) {
                        var a = e.apply(t, r);

                        function o(e) {
                            o9(a, n, i, o, s, "next", e)
                        }

                        function s(e) {
                            o9(a, n, i, o, s, "throw", e)
                        }
                        o(void 0)
                    })
                }
            }

            function st(e) {
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

            function sr(e, t) {
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

            function sn(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, i = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
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
                }(e, t) || sa(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function si(e) {
                return function(e) {
                    if (Array.isArray(e)) return o7(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || sa(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function sa(e, t) {
                if (e) {
                    if ("string" == typeof e) return o7(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return o7(e, t)
                }
            }

            function so(e, t) {
                var r, n, i, a = {
                        label: 0,
                        sent: function() {
                            if (1 & i[0]) throw i[1];
                            return i[1]
                        },
                        trys: [],
                        ops: []
                    },
                    o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    s = Object.defineProperty;
                return s(o, "next", {
                    value: u(0)
                }), s(o, "throw", {
                    value: u(1)
                }), s(o, "return", {
                    value: u(2)
                }), "function" == typeof Symbol && s(o, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), o;

                function u(s) {
                    return function(u) {
                        var c = [s, u];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; o && (o = 0, c[0] && (a = 0)), a;) try {
                            if (r = 1, n && (i = 2 & c[0] ? n.return : c[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, c[1])).done) return i;
                            switch (n = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                                case 0:
                                case 1:
                                    i = c;
                                    break;
                                case 4:
                                    return a.label++, {
                                        value: c[1],
                                        done: !1
                                    };
                                case 5:
                                    a.label++, n = c[1], c = [0];
                                    continue;
                                case 7:
                                    c = a.ops.pop(), a.trys.pop();
                                    continue;
                                default:
                                    if (!(i = (i = a.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                        a = 0;
                                        continue
                                    }
                                    if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                        a.label = c[1];
                                        break
                                    }
                                    if (6 === c[0] && a.label < i[1]) {
                                        a.label = i[1], i = c;
                                        break
                                    }
                                    if (i && a.label < i[2]) {
                                        a.label = i[2], a.ops.push(c);
                                        break
                                    }
                                    i[2] && a.ops.pop(), a.trys.pop();
                                    continue
                            }
                            c = t.call(e, a)
                        } catch (e) {
                            c = [6, e], n = 0
                        } finally {
                            r = i = 0
                        }
                        if (5 & c[0]) throw c[1];
                        return {
                            value: c[0] ? c[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var ss = [],
                su = [],
                sc = function() {
                    var e = sn((0, w.useState)(null), 2),
                        t = e[0],
                        r = e[1],
                        n = sn((0, w.useState)([]), 2),
                        i = n[0],
                        a = n[1],
                        o = sn((0, w.useState)([]), 2),
                        s = o[0],
                        u = o[1],
                        c = sn((0, w.useState)(null), 2),
                        l = c[0],
                        d = c[1],
                        p = sn((0, w.useState)(!1), 2),
                        f = p[0],
                        h = p[1],
                        m = sn((0, w.useState)({
                            creditBalance: 0,
                            currencyCode: ""
                        }), 2),
                        b = m[0],
                        y = m[1],
                        v = sn((0, w.useState)(1), 2),
                        S = v[0],
                        x = v[1],
                        E = sn((0, w.useState)({
                            isWebPurchasingEnabled: !1,
                            isSubscriptionPaymentProfileUpdatingEnabled: !1
                        }), 2),
                        A = E[0],
                        I = E[1],
                        j = (0, T.useTranslation)().translate,
                        R = sn((0, w.useState)(null), 2),
                        M = R[0],
                        U = R[1],
                        L = sn((0, w.useState)(!1), 2),
                        _ = L[0],
                        B = L[1],
                        F = sn((0, w.useState)(null), 2),
                        Y = F[0],
                        q = F[1],
                        H = sn((0, w.useState)(!1), 2),
                        V = H[0],
                        W = H[1],
                        G = sn((0, w.useState)(!1), 2),
                        K = G[0],
                        z = G[1],
                        X = sn((0, w.useState)(), 2),
                        Q = X[0],
                        $ = X[1],
                        J = sn((0, w.useState)(void 0), 2),
                        Z = J[0],
                        ee = J[1],
                        et = sn((0, w.useState)([]), 2),
                        er = et[0],
                        en = et[1],
                        ei = sn((0, w.useState)(!0), 2),
                        ea = ei[0],
                        eo = ei[1],
                        es = sn((0, w.useState)(!1), 2),
                        eu = es[0],
                        ec = es[1],
                        el = sn((0, w.useState)(!1), 2),
                        ed = el[0],
                        ep = el[1],
                        ef = sn((0, w.useState)(null), 2),
                        eh = ef[0],
                        em = ef[1],
                        eb = sn((0, w.useState)(null), 2),
                        ey = eb[0],
                        ev = eb[1],
                        eg = sn((0, w.useState)(!1), 2),
                        ew = eg[0],
                        eP = eg[1],
                        eS = function() {
                            return eP(!1)
                        },
                        ex = function(e) {
                            ns(na.CLICK_EDIT_PAYMENT_METHOD, e), eP(!0)
                        },
                        eE = (0, C.useHistory)(),
                        eT = r8(),
                        eC = eT.SystemFeedback,
                        eO = eT.systemFeedbackService,
                        eA = (0, O.useQueryClient)(),
                        eI = function() {
                            var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                            return (0, O.useQuery)(function(e) {
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
                                queryKey: ["privateServers", "systemSettings"],
                                queryFn: function(e) {
                                    var t = e.signal;
                                    return oz.privateServersGetPrivateServersSystemSettings(void 0, {
                                        signal: t
                                    })
                                },
                                retry: 3
                            }, e))
                        }(),
                        ej = eI.data,
                        ek = eI.isError,
                        eD = function() {
                            var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                            return (0, O.useQuery)(function(e) {
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
                                queryKey: o2(),
                                queryFn: function() {
                                    return o6(function() {
                                        var e, t, r, n, i, a;
                                        return o8(this, function(o) {
                                            switch (o.label) {
                                                case 0:
                                                    e = 100, t = 100, r = "", n = [], i = 0, o.label = 1;
                                                case 1:
                                                    var s, u;
                                                    if (!(i < t)) return [3, 4];
                                                    return [4, (s = r, u = e, o6(function() {
                                                        var e;
                                                        return o8(this, function(t) {
                                                            switch (t.label) {
                                                                case 0:
                                                                    return e = {
                                                                        privateServersTab: "MyPrivateServers",
                                                                        cursor: s,
                                                                        itemsPerPage: u
                                                                    }, [4, o1.get(ts.url.getMyPrivateServers(), e)];
                                                                case 1:
                                                                    return [2, t.sent().data]
                                                            }
                                                        })
                                                    })())];
                                                case 2:
                                                    if (a = o.sent(), n = o5(n).concat(o5(a.data.map(rf))), !a.nextPageCursor) return [3, 4];
                                                    r = a.nextPageCursor, o.label = 3;
                                                case 3:
                                                    return i++, [3, 1];
                                                case 4:
                                                    return [2, n]
                                            }
                                        })
                                    })()
                                },
                                retry: !1
                            }, e))
                        }({
                            onError: function() {
                                return eO.warning(j("MessageUnknownError"))
                            }
                        }).data,
                        eN = void 0 === eD ? ss : eD,
                        eR = (0, w.useMemo)(function() {
                            var e = null != ej ? ej : ek ? rh : void 0;
                            if (void 0 === e) return su;
                            var t = eN.filter(e.displayPlusFreePrivateServers ? rw : rg);
                            return e.displayPlusFreePrivateServers ? rx(t, e) : t.map(function(e) {
                                return sr(st({}, e), {
                                    benefitCapOutcome: "none",
                                    firstRenewalOnOrAfterEnforcement: new Date(0)
                                })
                            })
                        }, [eN, ej, ek]),
                        eM = function() {
                            return se(function() {
                                var e, t;
                                return so(this, function(r) {
                                    switch (r.label) {
                                        case 0:
                                            return r.trys.push([0, 2, , 3]), (0, k.fireEvent)(nx), [4, io(function() {
                                                return is(this, function(e) {
                                                    return [2, N.httpService.get(ts.url.getSavedPaymentProfiles())]
                                                })
                                            })()];
                                        case 1:
                                            if ((null == (t = r.sent()) || null == (e = t.data) ? void 0 : e.length) > 0) return en(t.data.slice()), [2, t.data];
                                            return (0, k.fireEvent)(nE), [3, 3];
                                        case 2:
                                            return r.sent(), (0, k.fireEvent)(nT), [3, 3];
                                        case 3:
                                            return [2, []]
                                    }
                                })
                            })()
                        },
                        eU = (0, w.useCallback)(function(e) {
                            r(e), U(e)
                        }, [r, U]);
                    (0, w.useEffect)(function() {
                        ns(na.PAGE_LOAD)
                    }, []), (0, w.useEffect)(function() {
                        if (0 !== i.length) {
                            var e = new URLSearchParams(window.location.search),
                                r = e.get("id"),
                                n = e.get("type");
                            if (r && n) {
                                var a = tg(n, r);
                                if (a) {
                                    var o = i.find(function(e) {
                                        return e.subscriptionTargetKey === a
                                    });
                                    o && (U(o), B(!0), ns(na.EMAIL_REFERER_PAGE_LOAD, o))
                                }
                                return
                            }
                            var s = window.location.hash;
                            if (s.startsWith("#!/subscriptions?subscription=")) {
                                var u = s.substring(30);
                                if (null !== u && "" !== u)
                                    if (u.startsWith("PRM")) W(!0), U(t), ns(na.EMAIL_REFERER_PAGE_LOAD);
                                    else {
                                        var c = i.find(function(e) {
                                            return e.subscriptionTargetKey === u
                                        });
                                        c && (U(c), ns(na.EMAIL_REFERER_PAGE_LOAD, c))
                                    }
                            }
                        }
                    }, [M, t, i]), (0, w.useEffect)(function() {
                        io(function() {
                            return is(this, function(e) {
                                return [2, N.httpService.get(ts.url.getStripeEnabledForUserConfig())]
                            })
                        })().then(function(e) {
                            ep(e.data.isPaymentProviderEnabledForUser), ec(e.data.isUserVpcApproved)
                        }).catch(function() {
                            ep(!1), ec(!1)
                        }), eM().catch(function() {
                            return eO.warning("Failed to load payment profiles")
                        }), oL().then(function(e) {
                            var t, r, n;
                            eo((t = e.data.birthDay, r = e.data.birthMonth, n = e.data.birthYear, 18 > function(e, t) {
                                iP(2, arguments);
                                var r = iS(e),
                                    n = iS(t),
                                    i = o_(r, n),
                                    a = Math.abs(function(e, t) {
                                        iP(2, arguments);
                                        var r = iS(e),
                                            n = iS(t);
                                        return r.getFullYear() - n.getFullYear()
                                    }(r, n));
                                r.setFullYear(1584), n.setFullYear(1584);
                                var o = o_(r, n) === -i,
                                    s = i * (a - Number(o));
                                return 0 === s ? 0 : s
                            }(new Date, new Date(n, r - 1, t))))
                        }).catch(function() {
                            eO.warning("Something went wrong.")
                        }), tp(function() {
                            return th(this, function(e) {
                                switch (e.label) {
                                    case 0:
                                        return [4, N.httpService.get(ts.url.getSubscriptionMetadata)];
                                    case 1:
                                        return [2, e.sent().data]
                                }
                            })
                        })().then(function(e) {
                            return I(e)
                        }).catch(function() {
                            return I({
                                isWebPurchasingEnabled: !1,
                                isSubscriptionPaymentProfileUpdatingEnabled: !1
                            })
                        })
                    }, [eO]), (0, w.useEffect)(function() {
                        if (t) {
                            var e, r, n, i, a;
                            t.showLowBalanceNotification = K, void 0 !== Q && (t.paymentProvider = Q), t.cardInfo = {
                                cardNetwork: null != (e = null == Z ? void 0 : Z.providerPayload.CardNetwork) ? e : "",
                                last4Digits: null != (r = null == Z ? void 0 : Z.providerPayload.Last4Digits) ? r : "",
                                expMonth: null != (n = null == Z ? void 0 : Z.providerPayload.ExpMonth) ? n : 0,
                                expYear: null != (i = null == Z ? void 0 : Z.providerPayload.ExpYear) ? i : 0
                            }, t.paymentProfileId = null != (a = null == Z ? void 0 : Z.id) ? a : "", (null == Z ? void 0 : Z.providerPayload.CardNetwork) && (null == Z ? void 0 : Z.providerPayload.Last4Digits) && (null == Z ? void 0 : Z.providerPayload.ExpMonth) && (null == Z ? void 0 : Z.providerPayload.ExpYear) && (t.purchasePlatform = e7.DESKTOP)
                        }
                    }, [K, t, Q, null == Z ? void 0 : Z.providerPayload.CardNetwork, null == Z ? void 0 : Z.providerPayload.Last4Digits, null == Z ? void 0 : Z.providerPayload.ExpMonth, null == Z ? void 0 : Z.providerPayload.ExpYear, null == Z ? void 0 : Z.id]), (0, w.useEffect)(function() {
                        var e;
                        (0, k.fireEvent)(nw), (e = D.authenticatedUser.id, tp(function() {
                            var t, r, n, i, a;
                            return th(this, function(o) {
                                switch (o.label) {
                                    case 0:
                                        t = ts.url.getUserPremiumSubscription(e), o.label = 1;
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
                            null === e ? (0, k.fireEvent)(nu) : (0, k.fireEvent)(nP), r(e), V && U(e)
                        }).catch(function() {
                            (0, k.fireEvent)(nS), eO.warning(j("MessageUnknownError"))
                        })
                    }, [V, eO, j]), (0, w.useEffect)(function() {
                        Promise.all([tm(new Date).then(function(e) {
                            var t, r, n, i, a, o, s, u, c, l = e.filter(function(e) {
                                    return e.subscriptionTargetKey.startsWith("EXP")
                                }),
                                d = e.filter(function(e) {
                                    return e.subscriptionTargetKey.startsWith("RBP") || e.subscriptionTargetKey.startsWith("CUR")
                                }),
                                p = e.find(function(e) {
                                    return e.subscriptionTargetKey.startsWith("PRM")
                                });
                            return p && (z(null != (t = p.showLowBalanceNotification) && t), $(p.paymentProvider), ee({
                                id: p.paymentProfileId,
                                providerPayload: {
                                    CardNetwork: null != (r = null == (o = p.cardInfo) ? void 0 : o.cardNetwork) ? r : "",
                                    Last4Digits: null != (n = null == (s = p.cardInfo) ? void 0 : s.last4Digits) ? n : "",
                                    ExpMonth: null != (i = null == (u = p.cardInfo) ? void 0 : u.expMonth) ? i : 0,
                                    ExpYear: null != (a = null == (c = p.cardInfo) ? void 0 : c.expYear) ? a : 0
                                }
                            })), {
                                devSubs: l,
                                v1RobloxOwnedSubs: d
                            }
                        }), Promise.all([ty(e1), ty(e0)]).then(function(e) {
                            var t, r, n, i, a, o = sn(e, 2),
                                s = o[0],
                                u = o[1],
                                c = null == (t = s[0]) ? void 0 : t.productInfo,
                                l = null == c || null == (n = c.productTypeDetails) || null == (r = n.robloxSubscriptionProductDetails) ? void 0 : r.featureConfig;
                            c && l && d({
                                featureConfig: l,
                                periodType: c.periodType
                            });
                            var p = null == (a = s[0]) || null == (i = a.productKey) ? void 0 : i.id;
                            return p && tp(function() {
                                var e, t;
                                return th(this, function(r) {
                                    switch (r.label) {
                                        case 0:
                                            return r.trys.push([0, 2, , 3]), [4, tb.subscriptionsV2ListAvailableSubscriptionProducts({
                                                productType: e1,
                                                includePurchased: !0,
                                                grantType: "FaeFreeTrial"
                                            })];
                                        case 1:
                                            return [2, null != (e = null == (t = r.sent().products.find(function(e) {
                                                return "Week" === e.periodType
                                            })) ? void 0 : t.productKey.id) ? e : null];
                                        case 2:
                                            return r.sent(), [2, null];
                                        case 3:
                                            return [2]
                                    }
                                })
                            })().then(function(e) {
                                return h(e === p)
                            }).catch(function() {
                                return h(!1)
                            }), si(s.map(tS)).concat(si(u.map(tS)))
                        })]).then(function(e) {
                            var t = sn(e, 2),
                                r = t[0],
                                n = r.devSubs,
                                i = r.v1RobloxOwnedSubs,
                                o = t[1],
                                s = new Set(o.map(function(e) {
                                    return e.subscriptionTargetKey
                                })),
                                u = i.filter(function(e) {
                                    return !s.has(e.subscriptionTargetKey)
                                });
                            a(si(n).concat(si(o), si(u)))
                        }).catch(function() {
                            eO.warning(j("MessageUnknownError"))
                        })
                    }, [eO, j]), (0, w.useEffect)(function() {
                        var e = i.map(function(e) {
                                return {
                                    type: e9.SUBSCRIPTION,
                                    subscription: e,
                                    privateServer: null,
                                    name: e.name,
                                    providerName: e.subscriptionProviderName
                                }
                            }),
                            t = eR.map(function(e) {
                                return {
                                    type: e9.PRIVATE_SERVER,
                                    subscription: null,
                                    privateServer: e,
                                    name: e.name,
                                    providerName: e.universeName
                                }
                            });
                        u(si(e).concat(si(t)).sort(function(e, t) {
                            if (e.type === e9.SUBSCRIPTION && t.type === e9.PRIVATE_SERVER) return -1;
                            if (e.type === e9.PRIVATE_SERVER && t.type === e9.SUBSCRIPTION) return 1;
                            var r = e.providerName.localeCompare(t.providerName);
                            return 0 !== r ? r : e.name.localeCompare(t.name)
                        }))
                    }, [i, eR]), (0, w.useEffect)(function() {
                        tp(function() {
                            var e;
                            return th(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        return e = ts.url.getUserCreditBalance(), [4, N.httpService.get(e)];
                                    case 1:
                                        return [2, t.sent().data]
                                }
                            })
                        })().then(function(e) {
                            null != e && y(e)
                        }).catch(function(e) {
                            e.status !== N.httpResponseCodes.notFound && eO.warning(j("MessageUnknownError"))
                        })
                    }, [eO, j]);
                    var eL = sn((0, w.useState)(function() {
                            return new Set
                        }), 2),
                        e_ = eL[0],
                        eB = eL[1];
                    (0, w.useEffect)(function() {
                        var e = Date.now(),
                            t = !1,
                            r = i.map(function(r) {
                                if (r.productType !== e1 || r.paymentProvider !== tn.CREDITBALANCE || !r.price || r.price.amount <= 0 || 0 >= r.renewal.getTime()) return r;
                                var n, i = e >= r.renewal.getTime() - 6048e5 && b.currencyCode === r.price.currencyCode && b.creditBalance < r.price.amount && !e_.has(r.subscriptionTargetKey);
                                return (null != (n = r.showLowBalanceNotification) && n) === i ? r : (t = !0, sr(st({}, r), {
                                    showLowBalanceNotification: i
                                }))
                            });
                        t && a(r)
                    }, [i, b, e_]), (0, w.useEffect)(function() {
                        if (ey && eh) {
                            var e = Date.now(),
                                t = !1,
                                r = function() {
                                    return se(function() {
                                        return so(this, function(e) {
                                            switch (e.label) {
                                                case 0:
                                                    return [4, se(function() {
                                                        var e, t, r, n, i;
                                                        return so(this, function(o) {
                                                            switch (o.label) {
                                                                case 0:
                                                                    return [4, Promise.all([tm(new Date).then(function(e) {
                                                                        return e.filter(function(e) {
                                                                            return e.subscriptionTargetKey.startsWith("EXP")
                                                                        })
                                                                    }), Promise.all([ty(e1), ty(e0)])])];
                                                                case 1:
                                                                    return t = (e = sn.apply(void 0, [o.sent(), 2]))[0], n = (r = sn(e[1], 2))[0], i = r[1], a(si(si(t).concat(si(n.map(tS)))).concat(si(i.map(tS)))), [4, eA.invalidateQueries({
                                                                        queryKey: o2()
                                                                    })];
                                                                case 2:
                                                                    return o.sent(), [2]
                                                            }
                                                        })
                                                    })().catch(function() {})];
                                                case 1:
                                                    return e.sent(), ev(null), em(null), [2]
                                            }
                                        })
                                    })()
                                },
                                n = setInterval(function() {
                                    return se(function() {
                                        var i, a;
                                        return so(this, function(o) {
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
                                                    return o.trys.push([3, 7, 8, 9]), [4, ty(e1)];
                                                case 4:
                                                    if (!(i = o.sent().map(tS).find(function(e) {
                                                            return e.subscriptionTargetKey === eh
                                                        }))) return [2];
                                                    switch (a = !1, ey) {
                                                        case ti.CANCEL:
                                                            a = rn(i.renewal, i.expiration);
                                                            break;
                                                        case ti.RESUBSCRIBE:
                                                            a = !rn(i.renewal, i.expiration)
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
                    }, [ey, eh, eA]);
                    var eF = (0, w.useCallback)(function(e, t) {
                            U(e), W(t), t || ns(na.VIEW_ACTIVE, e)
                        }, []),
                        eY = (0, w.useCallback)(function(e) {
                            q(e)
                        }, []),
                        eq = function() {
                            if (_) {
                                B(!1), window.history.back();
                                return
                            }
                            U(null), q(null), W(!1), eE.push("#!/subscriptions")
                        },
                        eH = function(e, n, o) {
                            if (e && t && n) {
                                var s = sr(st({}, t), {
                                    expiration: t.renewal,
                                    renewal: new Date(0)
                                });
                                r(s), M && V && M.subscriptionTargetKey === o && U(s)
                            }
                            if (e && t && !n) {
                                var u = sr(st({}, t), {
                                    renewal: t.expiration
                                });
                                r(u), M && V && M.subscriptionTargetKey === o && U(u)
                            }
                            var c = si(i),
                                l = c.find(function(e) {
                                    return e.subscriptionTargetKey === o
                                });
                            !e && n && l && (l.expiration = l.renewal, l.renewal = new Date(0), a(c), l.productType === e1 ? (U(null), eE.push("#!/subscriptions"), em(o), ev(ti.CANCEL)) : M && !V && M.subscriptionTargetKey === o && U(l)), e || n || !l || (l.renewal = l.expiration, a(c), l.productType === e1 && (em(o), ev(ti.RESUBSCRIBE)), M && !V && M.subscriptionTargetKey === o && U(l))
                        },
                        eV = function(e) {
                            e && eB(function(t) {
                                return new Set(t).add(e)
                            });
                            var t = si(i),
                                r = t.find(function(t) {
                                    return t.subscriptionTargetKey === e
                                });
                            r && (r.showLowBalanceNotification = !1, a(t)), M && M.subscriptionTargetKey === e && U(sr(st({}, M), {
                                showLowBalanceNotification: !1
                            }))
                        },
                        eW = function(e, r) {
                            if (e.startsWith("PRM") && t) return void eU(sr(st({}, t), {
                                cardInfo: {
                                    cardNetwork: r.providerPayload.CardNetwork,
                                    last4Digits: r.providerPayload.Last4Digits,
                                    expMonth: r.providerPayload.ExpMonth,
                                    expYear: r.providerPayload.ExpYear
                                },
                                paymentProfileId: r.id
                            }));
                            var n = si(i).find(function(t) {
                                return t.subscriptionTargetKey === e
                            });
                            n && (n.cardInfo = {
                                cardNetwork: r.providerPayload.CardNetwork,
                                last4Digits: r.providerPayload.Last4Digits,
                                expMonth: r.providerPayload.ExpMonth,
                                expYear: r.providerPayload.ExpYear
                            }, n.paymentProfileId = r.id), M && n && M.subscriptionTargetKey === e && U(sr(st({}, M), {
                                cardInfo: n.cardInfo
                            }))
                        },
                        eG = function(e, r, n, i) {
                            var a = sr(st({}, r), {
                                providerPayload: sr(st({}, r.providerPayload), {
                                    ExpMonth: n,
                                    ExpYear: i
                                })
                            });
                            (en(si(er.filter(function(e) {
                                return e.id !== r.id
                            })).concat([a])), e.startsWith("PRM") && t) ? eU(sr(st({}, t), {
                                cardInfo: {
                                    cardNetwork: a.providerPayload.CardNetwork,
                                    last4Digits: a.providerPayload.Last4Digits,
                                    expMonth: a.providerPayload.ExpMonth,
                                    expYear: a.providerPayload.ExpYear
                                },
                                paymentProfileId: r.id
                            })): M && M.subscriptionTargetKey === e && U(sr(st({}, M), {
                                cardInfo: {
                                    cardNetwork: a.providerPayload.CardNetwork,
                                    last4Digits: a.providerPayload.Last4Digits,
                                    expMonth: a.providerPayload.ExpMonth,
                                    expYear: a.providerPayload.ExpYear
                                }
                            }))
                        },
                        eK = !t || t.expiration < new Date,
                        ez = (0, g.jsxs)(P().Fragment, {
                            children: [(0, g.jsx)("h3", {
                                className: "subscription-count font-header-2",
                                children: j("Heading.Subscriptions.Active", {
                                    activeNumber: s.length + +!!t
                                })
                            }), (0, g.jsx)(rO, {
                                premiumSubscription: eK ? null : t,
                                subscriptionList: s,
                                emptyText: j("Description.Subscriptions.NoActive"),
                                onSelectSubscription: eF,
                                onSelectPrivateServer: eY,
                                resultsPerPage: 10,
                                currentPage: S,
                                onChangePage: x,
                                isPriceLoading: null != ey
                            })]
                        });
                    return (0, g.jsxs)("div", {
                        className: "subscription-management-container",
                        children: [(0, g.jsx)("h2", {
                            className: "subscription-title",
                            children: j("Heading.Tab.Subscriptions")
                        }), function() {
                            if (Y) return (0, g.jsx)(o0, {
                                privateServer: Y,
                                onBack: eq
                            });
                            if (M) {
                                var e;
                                return (0, g.jsxs)(w.Fragment, {
                                    children: [(0, g.jsx)(ii, {
                                        subscription: M,
                                        isPremium: V,
                                        creditBalance: b,
                                        onStatusChange: eH,
                                        onNotificationDismiss: eV,
                                        onBack: eq,
                                        subscriptionMetadata: A,
                                        blackbirdProductInfo: l,
                                        isFaeFreeTrial: f,
                                        onEditPaymentMethodClick: function() {
                                            void 0 !== rt(er, M.paymentProfileId, M.cardInfo) && ex(M)
                                        }
                                    }), M.paymentProvider === tn.STRIPE && "" !== M.paymentProfileId && void 0 !== rt(er, M.paymentProfileId, M.cardInfo) && ed && (0, g.jsx)(ib, {
                                        children: (0, g.jsx)(oM, {
                                            subscriptionId: M.subscriptionTargetKey,
                                            isUserUnder18: ea && !eu,
                                            paymentProfiles: er,
                                            isOpen: ew,
                                            subscription: M,
                                            onClose: eS,
                                            onSave: function(e) {
                                                eW(M.subscriptionTargetKey, e)
                                            },
                                            onPaymentProfileExpirationUpdate: function(e, t, r) {
                                                return eG(M.subscriptionTargetKey, e, t, r)
                                            },
                                            fetchSavedPaymentProfiles: eM,
                                            defaultPaymentProfile: null != (e = rt(er, M.paymentProfileId, M.cardInfo)) ? e : {
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
                        }() || ez, (0, g.jsx)("p", {
                            className: "subscription-help-text small text",
                            dangerouslySetInnerHTML: {
                                __html: j("Label.SubscriptionsHelpWithLink", {
                                    aTagStartWithHref: "<a href=",
                                    subscriptionsHelpPagesLink: '"'.concat("https://help.roblox.com/hc/sections/20316062241172", '"'),
                                    hrefEnd: ' class="text-link" target="_blank">',
                                    aTagEnd: "</a>"
                                })
                            }
                        }), (0, g.jsx)(eC, {})]
                    })
                };

            function sl(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var sd = function(e) {
                    var t, r = e.children,
                        n = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, tT.createSystemFeedback)()) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var i = [],
                                    a = !0,
                                    o = !1;
                                try {
                                    for (n = n.call(e); !(a = (t = n.next()).done) && (i.push(t.value), 2 !== i.length); a = !0);
                                } catch (e) {
                                    o = !0, r = e
                                } finally {
                                    try {
                                        a || null == n.return || n.return()
                                    } finally {
                                        if (o) throw r
                                    }
                                }
                                return i
                            }
                        }(t) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return sl(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return sl(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        i = n[0],
                        a = n[1];
                    return (0, g.jsx)(r5.Provider, {
                        value: {
                            SystemFeedback: i,
                            systemFeedbackService: a
                        },
                        children: r
                    })
                },
                sp = function() {
                    var e = (0, T.useTheme)();
                    return (0, g.jsx)(A.UIThemeProvider, {
                        theme: "dark" === e ? "foundation-dark" : "foundation-light",
                        cssBaselineMode: "disabled",
                        children: (0, g.jsx)(O.QueryClientProvider, {
                            client: I.queryClient,
                            children: (0, g.jsx)(T.TranslationProvider, {
                                config: j,
                                children: (0, g.jsx)(sd, {
                                    children: (0, g.jsx)(C.BrowserRouter, {
                                        children: (0, g.jsx)(sc, {})
                                    })
                                })
                            })
                        })
                    })
                };
            Object.assign(E(), {
                SubscriptionManagement: {
                    renderComponent: function(e) {
                        var t = document.getElementById(e);
                        return null !== t && ((0, S.unmountComponentAtNode)(t), (0, S.render)((0, g.jsx)(sp, {}), t), !0)
                    }
                }
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("SubscriptionManagement");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/subscriptionManagement-53cbf264c05e1a19.js.map
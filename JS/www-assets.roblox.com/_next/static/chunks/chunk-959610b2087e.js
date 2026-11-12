;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "a7410b82-096f-ba7e-57ef-871245588d42")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 579149, (e, t, r) => {
    e.e,
        function(e, t) {
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
                        i(e, t, n[t])
                    }) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(n)) : r(Object(n)).forEach(function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(n, t))
                    })
                }
                return e
            }

            function a(e) {
                return (a = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                    return typeof e
                } : function(e) {
                    return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
                })(e)
            }

            function i(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function s(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, a = e && ("u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"]);
                    if (null != a) {
                        var i = [],
                            s = !0,
                            l = !1;
                        try {
                            for (a = a.call(e); !(s = (r = a.next()).done) && (i.push(r.value), !t || i.length !== t); s = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                s || null == a.return || a.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return l(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(e);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return l(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function l(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var o, c, u, d, m, p = {
                exports: {}
            };
            p.exports = (function() {
                if (m) return d;
                m = 1;
                var e = u ? c : (u = 1, c = "SECRET_DO_NOT_PASS_THIS_OR_YOU_WILL_BE_FIRED");

                function t() {}

                function r() {}
                return r.resetWarningCache = t, d = function() {
                    function n(t, r, n, a, i, s) {
                        if (s !== e) {
                            var l = Error("Calling PropTypes validators directly is not supported by the `prop-types` package. Use PropTypes.checkPropTypes() to call them. Read more at http://fb.me/use-check-prop-types");
                            throw l.name = "Invariant Violation", l
                        }
                    }

                    function a() {
                        return n
                    }
                    n.isRequired = n;
                    var i = {
                        array: n,
                        bool: n,
                        func: n,
                        number: n,
                        object: n,
                        string: n,
                        symbol: n,
                        any: n,
                        arrayOf: a,
                        element: n,
                        elementType: n,
                        instanceOf: a,
                        node: n,
                        objectOf: a,
                        oneOf: a,
                        oneOfType: a,
                        shape: a,
                        exact: a,
                        checkPropTypes: r,
                        resetWarningCache: t
                    };
                    return i.PropTypes = i, i
                }
            })()();
            var h = (o = p.exports) && o.__esModule && Object.prototype.hasOwnProperty.call(o, "default") ? o.default : o,
                f = function(e, r, n) {
                    var a = !!n,
                        i = t.useRef(n);
                    t.useEffect(function() {
                        i.current = n
                    }, [n]), t.useEffect(function() {
                        if (!a || !e) return function() {};
                        var t = function() {
                            i.current && i.current.apply(i, arguments)
                        };
                        return e.on(r, t),
                            function() {
                                e.off(r, t)
                            }
                    }, [a, r, e, i])
                },
                g = function(e) {
                    var r = t.useRef(e);
                    return t.useEffect(function() {
                        r.current = e
                    }, [e]), r.current
                },
                x = function(e) {
                    return null !== e && "object" === a(e)
                },
                b = "[object Object]",
                y = function e(t, r) {
                    if (!x(t) || !x(r)) return t === r;
                    var n = Array.isArray(t);
                    if (n !== Array.isArray(r)) return !1;
                    var a = Object.prototype.toString.call(t) === b;
                    if (a !== (Object.prototype.toString.call(r) === b)) return !1;
                    if (!a && !n) return t === r;
                    var i = Object.keys(t),
                        s = Object.keys(r);
                    if (i.length !== s.length) return !1;
                    for (var l = {}, o = 0; o < i.length; o += 1) l[i[o]] = !0;
                    for (var c = 0; c < s.length; c += 1) l[s[c]] = !0;
                    var u = Object.keys(l);
                    return u.length === i.length && u.every(function(n) {
                        return e(t[n], r[n])
                    })
                },
                v = function(e, t, r) {
                    return x(e) ? Object.keys(e).reduce(function(a, s) {
                        var l = !x(t) || !y(e[s], t[s]);
                        return r.includes(s) ? (l && console.warn("Unsupported prop change: options.".concat(s, " is not a mutable property.")), a) : l ? n(n({}, a || {}), {}, i({}, s, e[s])) : a
                    }, null) : null
                },
                S = "Invalid prop `stripe` supplied to `Elements`. We recommend using the `loadStripe` utility from `@stripe/stripe-js`. See https://stripe.com/docs/stripe-js/react#elements-props-stripe for details.",
                P = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : S;
                    if (null === e || x(e) && "function" == typeof e.elements && "function" == typeof e.createToken && "function" == typeof e.createPaymentMethod && "function" == typeof e.confirmCardPayment) return e;
                    throw Error(t)
                },
                C = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : S;
                    if (x(e) && "function" == typeof e.then) return {
                        tag: "async",
                        stripePromise: Promise.resolve(e).then(function(e) {
                            return P(e, t)
                        })
                    };
                    var r = P(e, t);
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
                w = t.createContext(null);
            w.displayName = "ElementsContext";
            var N = function(e, t) {
                    if (!e) throw Error("Could not find Elements context; You need to wrap the part of your app that ".concat(t, " in an <Elements> provider."));
                    return e
                },
                k = function(e) {
                    var r = e.stripe,
                        n = e.options,
                        a = e.children,
                        i = t.useMemo(function() {
                            return C(r)
                        }, [r]),
                        l = s(t.useState(function() {
                            return {
                                stripe: "sync" === i.tag ? i.stripe : null,
                                elements: "sync" === i.tag ? i.stripe.elements(n) : null
                            }
                        }), 2),
                        o = l[0],
                        c = l[1];
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
                        return "async" !== i.tag || o.stripe ? "sync" !== i.tag || o.stripe || t(i.stripe) : i.stripePromise.then(function(r) {
                                r && e && t(r)
                            }),
                            function() {
                                e = !1
                            }
                    }, [i, o, n]);
                    var u = g(r);
                    t.useEffect(function() {
                        null !== u && u !== r && console.warn("Unsupported prop change on Elements: You cannot change the `stripe` prop after setting it.")
                    }, [u, r]);
                    var d = g(n);
                    return t.useEffect(function() {
                        if (o.elements) {
                            var e = v(n, d, ["clientSecret", "fonts"]);
                            e && o.elements.update(e)
                        }
                    }, [n, d, o.elements]), t.useEffect(function() {
                        E(o.stripe)
                    }, [o.stripe]), t.createElement(w.Provider, {
                        value: o
                    }, a)
                };
            k.propTypes = {
                stripe: h.any,
                options: h.object
            };
            var T = function(e) {
                    return N(t.useContext(w), e)
                },
                j = function(e) {
                    return (0, e.children)(T("mounts <ElementsConsumer>"))
                };
            j.propTypes = {
                children: h.func.isRequired
            };
            var A = ["on", "session"],
                M = t.createContext(null);
            M.displayName = "CustomCheckoutSdkContext";
            var R = function(e, t) {
                    if (!e) throw Error("Could not find CustomCheckoutProvider context; You need to wrap the part of your app that ".concat(t, " in an <CustomCheckoutProvider> provider."));
                    return e
                },
                I = t.createContext(null);
            I.displayName = "CustomCheckoutContext";
            var U = function(e, t) {
                    if (!e) return null;
                    e.on, e.session;
                    var r = function(e, t) {
                        if (null == e) return {};
                        var r, n, a = function(e, t) {
                            if (null == e) return {};
                            var r, n, a = {},
                                i = Object.keys(e);
                            for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || (a[r] = e[r]);
                            return a
                        }(e, t);
                        if (Object.getOwnPropertySymbols) {
                            var i = Object.getOwnPropertySymbols(e);
                            for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (a[r] = e[r])
                        }
                        return a
                    }(e, A);
                    return t ? n(n({}, r), t) : n(n({}, r), e.session())
                },
                _ = function(e) {
                    var r = e.stripe,
                        n = e.options,
                        a = e.children,
                        i = t.useMemo(function() {
                            return C(r, "Invalid prop `stripe` supplied to `CustomCheckoutProvider`. We recommend using the `loadStripe` utility from `@stripe/stripe-js`. See https://stripe.com/docs/stripe-js/react#elements-props-stripe for details.")
                        }, [r]),
                        l = s(t.useState(null), 2),
                        o = l[0],
                        c = l[1],
                        u = s(t.useState(function() {
                            return {
                                stripe: "sync" === i.tag ? i.stripe : null,
                                customCheckoutSdk: null
                            }
                        }), 2),
                        d = u[0],
                        m = u[1],
                        p = function(e, t) {
                            m(function(r) {
                                return r.stripe && r.customCheckoutSdk ? r : {
                                    stripe: e,
                                    customCheckoutSdk: t
                                }
                            })
                        },
                        h = t.useRef(!1);
                    t.useEffect(function() {
                        var e = !0;
                        return "async" !== i.tag || d.stripe ? "sync" === i.tag && i.stripe && !h.current && (h.current = !0, i.stripe.initCustomCheckout(n).then(function(e) {
                                e && (p(i.stripe, e), e.on("change", c))
                            })) : i.stripePromise.then(function(t) {
                                t && e && !h.current && (h.current = !0, t.initCustomCheckout(n).then(function(e) {
                                    e && (p(t, e), e.on("change", c))
                                }))
                            }),
                            function() {
                                e = !1
                            }
                    }, [i, d, n, c]);
                    var f = g(r);
                    t.useEffect(function() {
                        null !== f && f !== r && console.warn("Unsupported prop change on CustomCheckoutProvider: You cannot change the `stripe` prop after setting it.")
                    }, [f, r]);
                    var b = g(n);
                    t.useEffect(function() {
                        if (d.customCheckoutSdk) {
                            !n.clientSecret || x(b) || y(n.clientSecret, b.clientSecret) || console.warn("Unsupported prop change: options.client_secret is not a mutable property.");
                            var e, t, r = null == b || null == (e = b.elementsOptions) ? void 0 : e.appearance,
                                a = null == n || null == (t = n.elementsOptions) ? void 0 : t.appearance;
                            a && !y(a, r) && d.customCheckoutSdk.changeAppearance(a)
                        }
                    }, [n, b, d.customCheckoutSdk]), t.useEffect(function() {
                        E(d.stripe)
                    }, [d.stripe]);
                    var v = t.useMemo(function() {
                        return U(d.customCheckoutSdk, o)
                    }, [d.customCheckoutSdk, o]);
                    return d.customCheckoutSdk ? t.createElement(M.Provider, {
                        value: d
                    }, t.createElement(I.Provider, {
                        value: v
                    }, a)) : null
                };
            _.propTypes = {
                stripe: h.any,
                options: h.shape({
                    clientSecret: h.string.isRequired,
                    elementsOptions: h.object
                }).isRequired
            };
            var F = function(e) {
                    var r = t.useContext(M),
                        n = t.useContext(w);
                    if (r && n) throw Error("You cannot wrap the part of your app that ".concat(e, " in both <CustomCheckoutProvider> and <Elements> providers."));
                    return r ? R(r, e) : N(n, e)
                },
                L = function(e, r) {
                    var n = "".concat(e.charAt(0).toUpperCase() + e.slice(1), "Element"),
                        a = r ? function(e) {
                            F("mounts <".concat(n, ">"));
                            var r = e.id,
                                a = e.className;
                            return t.createElement("div", {
                                id: r,
                                className: a
                            })
                        } : function(r) {
                            var a, i = r.id,
                                l = r.className,
                                o = r.options,
                                c = void 0 === o ? {} : o,
                                u = r.onBlur,
                                d = r.onFocus,
                                m = r.onReady,
                                p = r.onChange,
                                h = r.onEscape,
                                x = r.onClick,
                                b = r.onLoadError,
                                y = r.onLoaderStart,
                                S = r.onNetworksChange,
                                P = r.onConfirm,
                                C = r.onCancel,
                                E = r.onShippingAddressChange,
                                w = r.onShippingRateChange,
                                N = F("mounts <".concat(n, ">")),
                                k = "elements" in N ? N.elements : null,
                                T = "customCheckoutSdk" in N ? N.customCheckoutSdk : null,
                                j = s(t.useState(null), 2),
                                A = j[0],
                                M = j[1],
                                R = t.useRef(null),
                                I = t.useRef(null);
                            f(A, "blur", u), f(A, "focus", d), f(A, "escape", h), f(A, "click", x), f(A, "loaderror", b), f(A, "loaderstart", y), f(A, "networkschange", S), f(A, "confirm", P), f(A, "cancel", C), f(A, "shippingaddresschange", E), f(A, "shippingratechange", w), f(A, "change", p), m && (a = "expressCheckout" === e ? m : function() {
                                m(A)
                            }), f(A, "ready", a), t.useLayoutEffect(function() {
                                if (null === R.current && null !== I.current && (k || T)) {
                                    var t = null;
                                    T ? t = T.createElement(e, c) : k && (t = k.create(e, c)), R.current = t, M(t), t && t.mount(I.current)
                                }
                            }, [k, T, c]);
                            var U = g(c);
                            return t.useEffect(function() {
                                if (R.current) {
                                    var e = v(c, U, ["paymentRequest"]);
                                    e && "update" in R.current && R.current.update(e)
                                }
                            }, [c, U]), t.useLayoutEffect(function() {
                                return function() {
                                    if (R.current && "function" == typeof R.current.destroy) try {
                                        R.current.destroy(), R.current = null
                                    } catch (e) {}
                                }
                            }, []), t.createElement("div", {
                                id: i,
                                className: l,
                                ref: I
                            })
                        };
                    return a.propTypes = {
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
                    }, a.displayName = n, a.__elementType = e, a
                },
                D = "u" < typeof window,
                B = t.createContext(null);
            B.displayName = "EmbeddedCheckoutProviderContext";
            var O = function() {
                    var e = t.useContext(B);
                    if (!e) throw Error("<EmbeddedCheckout> must be used within <EmbeddedCheckoutProvider>");
                    return e
                },
                G = D ? function(e) {
                    var r = e.id,
                        n = e.className;
                    return O(), t.createElement("div", {
                        id: r,
                        className: n
                    })
                } : function(e) {
                    var r = e.id,
                        n = e.className,
                        a = O().embeddedCheckout,
                        i = t.useRef(!1),
                        s = t.useRef(null);
                    return t.useLayoutEffect(function() {
                        return !i.current && a && null !== s.current && (a.mount(s.current), i.current = !0),
                            function() {
                                if (i.current && a) try {
                                    a.unmount(), i.current = !1
                                } catch (e) {}
                            }
                    }, [a]), t.createElement("div", {
                        ref: s,
                        id: r,
                        className: n
                    })
                },
                z = L("auBankAccount", D),
                V = L("card", D),
                W = L("cardNumber", D),
                K = L("cardExpiry", D),
                H = L("cardCvc", D),
                Q = L("fpxBank", D),
                $ = L("iban", D),
                q = L("idealBank", D),
                Y = L("p24Bank", D),
                X = L("epsBank", D),
                J = L("payment", D),
                Z = L("expressCheckout", D),
                ee = L("currencySelector", D),
                et = L("paymentRequestButton", D),
                er = L("linkAuthentication", D),
                en = L("address", D),
                ea = L("shippingAddress", D),
                ei = L("paymentMethodMessaging", D),
                es = L("affirmMessage", D),
                el = L("afterpayClearpayMessage", D);
            e.AddressElement = en, e.AffirmMessageElement = es, e.AfterpayClearpayMessageElement = el, e.AuBankAccountElement = z, e.CardCvcElement = H, e.CardElement = V, e.CardExpiryElement = K, e.CardNumberElement = W, e.CurrencySelectorElement = ee, e.CustomCheckoutProvider = _, e.Elements = k, e.ElementsConsumer = j, e.EmbeddedCheckout = G, e.EmbeddedCheckoutProvider = function(e) {
                var r = e.stripe,
                    n = e.options,
                    a = e.children,
                    i = t.useMemo(function() {
                        return C(r, "Invalid prop `stripe` supplied to `EmbeddedCheckoutProvider`. We recommend using the `loadStripe` utility from `@stripe/stripe-js`. See https://stripe.com/docs/stripe-js/react#elements-props-stripe for details.")
                    }, [r]),
                    l = t.useRef(null),
                    o = t.useRef(null),
                    c = s(t.useState({
                        embeddedCheckout: null
                    }), 2),
                    u = c[0],
                    d = c[1];
                t.useEffect(function() {
                    if (!o.current && !l.current) {
                        var e = function(e) {
                            o.current || l.current || (o.current = e, l.current = o.current.initEmbeddedCheckout(n).then(function(e) {
                                d({
                                    embeddedCheckout: e
                                })
                            }))
                        };
                        "async" === i.tag && !o.current && (n.clientSecret || n.fetchClientSecret) ? i.stripePromise.then(function(t) {
                            t && e(t)
                        }) : "sync" === i.tag && !o.current && (n.clientSecret || n.fetchClientSecret) && e(i.stripe)
                    }
                }, [i, n, u, o]), t.useEffect(function() {
                    return function() {
                        u.embeddedCheckout ? (l.current = null, u.embeddedCheckout.destroy()) : l.current && l.current.then(function() {
                            l.current = null, u.embeddedCheckout && u.embeddedCheckout.destroy()
                        })
                    }
                }, [u.embeddedCheckout]), t.useEffect(function() {
                    E(o)
                }, [o]);
                var m = g(r);
                t.useEffect(function() {
                    null !== m && m !== r && console.warn("Unsupported prop change on EmbeddedCheckoutProvider: You cannot change the `stripe` prop after setting it.")
                }, [m, r]);
                var p = g(n);
                return t.useEffect(function() {
                    if (null != p) {
                        if (null == n) return void console.warn("Unsupported prop change on EmbeddedCheckoutProvider: You cannot unset options after setting them.");
                        void 0 === n.clientSecret && void 0 === n.fetchClientSecret && console.warn("Invalid props passed to EmbeddedCheckoutProvider: You must provide one of either `options.fetchClientSecret` or `options.clientSecret`."), null != p.clientSecret && n.clientSecret !== p.clientSecret && console.warn("Unsupported prop change on EmbeddedCheckoutProvider: You cannot change the client secret after setting it. Unmount and create a new instance of EmbeddedCheckoutProvider instead."), null != p.fetchClientSecret && n.fetchClientSecret !== p.fetchClientSecret && console.warn("Unsupported prop change on EmbeddedCheckoutProvider: You cannot change fetchClientSecret after setting it. Unmount and create a new instance of EmbeddedCheckoutProvider instead."), null != p.onComplete && n.onComplete !== p.onComplete && console.warn("Unsupported prop change on EmbeddedCheckoutProvider: You cannot change the onComplete option after setting it."), null != p.onShippingDetailsChange && n.onShippingDetailsChange !== p.onShippingDetailsChange && console.warn("Unsupported prop change on EmbeddedCheckoutProvider: You cannot change the onShippingDetailsChange option after setting it."), null != p.onLineItemsChange && n.onLineItemsChange !== p.onLineItemsChange && console.warn("Unsupported prop change on EmbeddedCheckoutProvider: You cannot change the onLineItemsChange option after setting it.")
                    }
                }, [p, n]), t.createElement(B.Provider, {
                    value: u
                }, a)
            }, e.EpsBankElement = X, e.ExpressCheckoutElement = Z, e.FpxBankElement = Q, e.IbanElement = $, e.IdealBankElement = q, e.LinkAuthenticationElement = er, e.P24BankElement = Y, e.PaymentElement = J, e.PaymentMethodMessagingElement = ei, e.PaymentRequestButtonElement = et, e.ShippingAddressElement = ea, e.useCustomCheckout = function() {
                R(t.useContext(M), "calls useCustomCheckout()");
                var e = t.useContext(I);
                if (!e) throw Error("Could not find CustomCheckout Context; You need to wrap the part of your app that calls useCustomCheckout() in an <CustomCheckoutProvider> provider.");
                return e
            }, e.useElements = function() {
                return T("calls useElements()").elements
            }, e.useStripe = function() {
                return F("calls useStripe()").stripe
            }
        }(r, e.r(420482))
}, 921743, e => {
    e.q("https://www-assets.roblox.com/_next/static/media/blue_check_12x12.svg.01ey6hbizodff.svg")
}, 354624, (e, t, r) => {
    "use strict";

    function n(e) {
        return (n = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
            return typeof e
        } : function(e) {
            return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
        })(e)
    }
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var a, i = "https://js.stripe.com/v3",
        s = /^https:\/\/js\.stripe\.com\/v3\/?(\?.*)?$/,
        l = "loadStripe.setLoadParameters was called but an existing Stripe.js script already exists in the document; existing script parameters will be used",
        o = function() {
            for (var e = document.querySelectorAll('script[src^="'.concat(i, '"]')), t = 0; t < e.length; t++) {
                var r = e[t];
                if (s.test(r.src)) return r
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
        d = null,
        m = null,
        p = null,
        h = function(e, t, r) {
            if (null === e) return null;
            var n = e.apply(void 0, t);
            return u(n, r), n
        },
        f = function(e) {
            var t = "invalid load parameters; expected object of shape\n\n    {advancedFraudSignals: boolean}\n\nbut received\n\n    ".concat(JSON.stringify(e), "\n");
            if (null === e || "object" !== n(e)) throw Error(t);
            if (1 === Object.keys(e).length && "boolean" == typeof e.advancedFraudSignals) return e;
            throw Error(t)
        },
        g = !1,
        x = function() {
            for (var e, t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
            g = !0;
            var i = Date.now();
            return (e = a, null !== d ? d : (d = new Promise(function(t, r) {
                if ("u" < typeof window || "u" < typeof document) return void t(null);
                if (window.Stripe && e && console.warn(l), window.Stripe) return void t(window.Stripe);
                try {
                    var n, a = o();
                    a && e ? console.warn(l) : a ? a && null !== p && null !== m && (a.removeEventListener("load", p), a.removeEventListener("error", m), null == (n = a.parentNode) || n.removeChild(a), a = c(e)) : a = c(e), p = function() {
                        window.Stripe ? t(window.Stripe) : r(Error("Stripe.js not available"))
                    }, m = function() {
                        r(Error("Failed to load Stripe.js"))
                    }, a.addEventListener("load", p), a.addEventListener("error", m)
                } catch (e) {
                    r(e);
                    return
                }
            })).catch(function(e) {
                return d = null, Promise.reject(e)
            })).then(function(e) {
                return h(e, r, i)
            })
        };
    x.setLoadParameters = function(e) {
        if (!(g && a && Object.keys(f(e)).reduce(function(t, r) {
                var n;
                return t && e[r] === (null == (n = a) ? void 0 : n[r])
            }, !0))) {
            if (g) throw Error("You cannot change load parameters after calling loadStripe");
            a = f(e)
        }
    }, r.loadStripe = x
}, 562528, (e, t, r) => {
    t.exports = e.r(354624)
}, 518623, e => {
    "use strict";
    let t, r, n;
    var a, i, s, l, o, c, u, d, m, p, h, f, g, x, b, y, v, S, P, C, E, w, N, k, T, j, A, M, R, I, U = e.i(19836),
        _ = e.i(910030),
        F = e.i(391855),
        L = e.i(420482),
        D = e.i(144674),
        B = e.i(778935),
        O = e.i(55001),
        G = e.i(520250),
        z = e.i(326404),
        V = e.i(378944),
        W = e.i(7284);
    let K = {
            Info: "icon-filled-circle-i",
            Warning: "icon-filled-triangle-exclamation",
            Success: "icon-filled-circle-check",
            Error: "icon-filled-circle-x"
        },
        H = {
            Info: "var(--color-system-emphasis)",
            Warning: "var(--color-system-warning)",
            Success: "var(--color-extended-green-700, var(--color-system-success))",
            Error: "var(--color-action-alert-foreground)"
        },
        Q = {
            Info: "stroke-emphasis",
            Warning: "stroke-system-warning",
            Success: "stroke-emphasis",
            Error: "stroke-system-alert"
        },
        $ = {
            Info: "rgb(from var(--color-system-neutral) r g b / 0.1)",
            Warning: "rgb(from var(--color-system-warning) r g b / 0.16)",
            Success: "rgb(from var(--color-system-success) r g b / 0.1)",
            Error: "rgb(from var(--color-system-alert) r g b / 0.16)"
        },
        q = e => {
            let {
                label: t,
                href: r,
                linkTarget: n,
                onAction: a,
                variant: i
            } = e;
            return n ? L.default.createElement(O.Button, {
                asChild: !0,
                size: "Small",
                variant: i,
                onClick: a
            }, L.default.cloneElement(n, {}, t)) : r ? L.default.createElement(O.Button, {
                as: "a",
                href: r,
                size: "Small",
                variant: i,
                onClick: a
            }, t) : L.default.createElement(O.Button, {
                size: "Small",
                variant: i,
                onClick: a
            }, t)
        },
        Y = e => {
            let {
                label: t,
                href: r,
                linkTarget: n,
                onAction: a
            } = e;
            return n ? L.default.createElement(z.Link, {
                asChild: !0,
                onClick: a,
                size: "Medium",
                variant: "Standalone",
                underline: "always"
            }, L.default.cloneElement(n, {}, t)) : r ? L.default.createElement(z.Link, {
                href: r,
                onClick: a,
                size: "Medium",
                variant: "Standalone",
                underline: "always"
            }, t) : L.default.createElement(z.Link, {
                as: "button",
                onClick: a,
                size: "Medium",
                variant: "Standalone",
                underline: "always"
            }, t)
        },
        X = (0, L.forwardRef)((e, t) => {
            let {
                children: r,
                variant: n = "System",
                severity: a = "Info",
                primaryActionLabel: i,
                primaryActionHref: s,
                primaryActionLinkTarget: l,
                onPrimaryAction: o,
                secondaryActionLabel: c,
                secondaryActionHref: u,
                secondaryActionLinkTarget: d,
                onSecondaryAction: m,
                hasCloseAffordance: p = !0,
                closeLabel: h = "Dismiss alert",
                onDismiss: f,
                className: g,
                style: x,
                ...b
            } = e, y = (0, G.default)("foundation-web-alert-message-"), v = !!i, S = !!c, P = !!(p && f), C = "Feedback" === n && (v || S || P), E = "Warning" === a || "Error" === a ? "alert" : "status", w = null;
            v && (w = S ? L.default.createElement(q, {
                label: i || "",
                href: s,
                linkTarget: l,
                onAction: o,
                variant: "Standard"
            }) : L.default.createElement(Y, {
                label: i || "",
                href: s,
                linkTarget: l,
                onAction: o
            }));
            let N = S ? L.default.createElement(q, {
                label: c || "",
                href: u,
                linkTarget: d,
                onAction: m,
                variant: "Utility"
            }) : null;
            return L.default.createElement("div", {
                ref: t,
                role: C ? "region" : E,
                "aria-labelledby": C ? y : void 0,
                className: (0, W.default)("foundation-web-alert relative width-full stroke-standard", "System" === n ? "[border-left-width:0] [border-right-width:0]" : "radius-medium", Q[a], g),
                ...b
            }, L.default.createElement("div", {
                "aria-hidden": "true",
                className: (0, W.default)("absolute inset-[0] pointer-events-none", "Feedback" === n && "radius-medium"),
                style: {
                    backgroundColor: $[a]
                }
            }), L.default.createElement("div", {
                className: "relative flex items-start gap-x-medium padding-x-large padding-y-small min-width-0"
            }, L.default.createElement("div", {
                className: "flex items-start padding-y-xsmall self-stretch shrink-0"
            }, L.default.createElement("div", {
                className: "relative flex items-start padding-y-xxsmall"
            }, "Warning" !== a && L.default.createElement("span", {
                "aria-hidden": "true",
                className: "absolute width-[10px] height-[14px] top-[5px]",
                style: {
                    left: "50%",
                    transform: "translateX(-50%)",
                    backgroundColor: "var(--dark-mode-content-emphasis)"
                }
            }), L.default.createElement(B.Icon, {
                "aria-hidden": "true",
                name: K[a],
                size: "Medium",
                className: "relative",
                style: {
                    color: H[a]
                }
            }))), L.default.createElement("div", {
                className: (0, W.default)("flex grow-1 basis-0 min-width-0 items-start gap-x-medium gap-y-small", S ? "flex-col" : "wrap")
            }, L.default.createElement("div", {
                id: C ? y : void 0,
                role: C ? E : void 0,
                className: (0, W.default)("flex items-center padding-top-[var(--size-150)] text-body-medium text-wrap content-emphasis [overflow-wrap:anywhere]", S ? "width-full min-width-0" : "grow-1 basis-0 min-width-[min(200px,100%)]")
            }, r), (w || N) && L.default.createElement("div", {
                className: (0, W.default)("flex items-center gap-small wrap shrink-0", !S && "padding-y-[var(--size-150)]")
            }, w, N)), P && L.default.createElement(V.CloseAffordance, {
                variant: "Utility",
                size: "Medium",
                isCircular: !0,
                className: "content-emphasis shrink-0 padding-[var(--size-150)]",
                "aria-label": h,
                onClick: f
            })))
        });
    var J = e.i(357355);
    let Z = (0, L.createContext)(null),
        ee = e => {
            let {
                children: t,
                closeLabel: r
            } = e, [n, a] = (0, L.useState)(null), i = (0, L.useRef)(0), s = (0, L.useCallback)((e, t, r) => {
                i.current += 1, a({
                    id: i.current,
                    title: t,
                    severity: e,
                    shouldAutoDismiss: r?.shouldAutoDismiss ?? "Success" === e
                })
            }, []), l = (0, L.useMemo)(() => ({
                success: (e, t) => {
                    s("Success", e, t)
                },
                warning: (e, t) => {
                    s("Warning", e, t)
                },
                alert: (e, t) => {
                    s("Error", e, t)
                },
                info: (e, t) => {
                    s("Info", e, t)
                }
            }), [s]), o = (0, L.useMemo)(() => ({
                toastService: l
            }), [l]), c = (0, L.useCallback)(() => {
                a(null)
            }, []);
            return (0, L.useEffect)(() => {
                if (!n?.shouldAutoDismiss || !J.window) return;
                let e = n.id,
                    t = J.window.setTimeout(() => {
                        a(t => t?.id === e ? null : t)
                    }, 4e3);
                return () => {
                    J.window?.clearTimeout(t)
                }
            }, [n]), (0, U.jsxs)(Z.Provider, {
                value: o,
                children: [t, n && (0, U.jsx)("div", {
                    className: "bg-surface-0",
                    style: {
                        position: "fixed",
                        left: "50%",
                        bottom: "max(var(--padding-xxlarge, 32px), env(safe-area-inset-bottom))",
                        transform: "translateX(-50%)",
                        zIndex: "var(--foundation-portal-zindex, 9999)",
                        width: "min(480px, calc(100% - 2 * var(--margin-small, 16px)))"
                    },
                    children: (0, U.jsx)(X, {
                        variant: "Feedback",
                        severity: n.severity,
                        onDismiss: c,
                        closeLabel: r,
                        hasCloseAffordance: !0,
                        className: "padding-top-large padding-bottom-large",
                        children: n.title
                    }, n.id)
                })]
            })
        },
        et = () => {
            let e = (0, L.useContext)(Z);
            if (!e) throw Error("useToast must be used within a ToastProvider");
            return e
        };
    var er = e.i(361185),
        en = e.i(883355),
        ea = e.i(126392),
        ei = e.i(245837);
    async function es(e, t) {
        return t({
            method: "GET",
            url: `${ei.EnvironmentUrls.apiGatewayUrl}/payments-gateway/v1/feature/metadata`,
            config: {
                withCredentials: !0,
                params: {
                    userId: e
                }
            },
            eventCounterProps: {
                call: "GetFeatureMetadata"
            }
        })
    }

    function el(e) {
        return `firstTimePurchaseConsentAcknowledged_${e}`
    }
    var eo = e.i(673518);
    let ec = (0, L.createContext)({
            limitedTimeBonusItem: {
                bannerImageUrls: [],
                creatorDisplayNames: [],
                displayNames: [],
                ids: [],
                imageUrls: []
            },
            bonusItemBannerImageUrl: "",
            bonusItemDisplayName: "",
            bonusItemId: void 0,
            bonusItemImageUrl: "",
            buyRobuxPageData: {
                sections: []
            },
            getPurchaseUrl: () => "",
            giftingAvatarImageUrl: "",
            giftingUrl: "",
            isSubscriber: !1,
            paymentSession: void 0,
            productIds: [],
            purchaseFlowId: void 0,
            robuxBalance: void 0,
            sectionNames: [],
            subscriptionProductIds: [],
            upsellProduct: void 0,
            urlParams: {
                ctx: void 0,
                product_id: void 0,
                showHeader: void 0
            },
            collectibleBonusItemMetadata: void 0,
            shouldShowFirstTimePurchaseConsent: void 0,
            markConsentAcknowledged: () => void 0,
            productBadgeSlotCount: 0,
            atLeastOneProductHasBonusAmount: !1,
            deviceMeta: eo.defaultDeviceMeta
        }),
        eu = "buyRobuxCtx",
        ed = "buyRobuxProductId";
    var em = e.i(9701),
        ep = e.i(252250),
        eh = e.i(248951),
        ef = e.i(83311),
        eg = e.i(333982);
    let ex = {
            featureName: "BuyRobuxRedesign",
            team: "Economy > Payments & Fraud",
            internalPageName: ["Robux", "LeanerRobuxRedesignModel", "robuxRedesign"],
            features: {
                health: {
                    counters: ["PageLoad", "PageView"],
                    criticalErrors: ["BuyRobuxPageReactCrash", "NoPageData", "NoRoot", "ParsePageDataFailed", "SectionReactCrash", "SendRobuxButtonReactCrash", "StripeReactCrash"]
                },
                page: {
                    apiCalls: ["AcknowledgePurchaseWarning", "CheckUserPurchaseSetting", "GetEnablePurchaseSetting", "GetPaymentProfiles", "GetPendingEnablePurchaseConsentRequests", "GetPurchaseWarning", "GetQuickPayMetadata", "GetRobuxBalance", "GetThumbnails", "PreparePayment", "ProcessPayment", "GetClientAssertionV2", "GetAuthTicketV2", "GetMyFriends", "UserSearch"],
                    counters: [{
                        name: "GetMyFriends_API",
                        dimensions: ["status"]
                    }, "ClickShowMore"]
                },
                bonusItems: {
                    counters: [{
                        name: "BonusItemMissingMetadata",
                        dimensions: ["productType"]
                    }, {
                        name: "BonusItemUnsupportedType",
                        dimensions: ["productType"]
                    }]
                },
                purchase: {
                    counters: [{
                        name: "StartPurchase",
                        dimensions: ["isQuickPay"]
                    }, "DesktopPurchaseRedirect", "MobilePurchaseRedirect", "IneligiblePurchase", "UnsupportedPlatform", "UnexpectedPurchaseRedirectCall", "PurchaseRedirectUrlEmpty", "QuickPayUpsell", "IosPurchaseRestartAlertShown", {
                        name: "NativePurchaseUiShownTime",
                        dimensions: ["bucket", "tapCount", "appMinorVersion", "isSub"]
                    }],
                    errors: ["ApplePayAvailabilityException"]
                },
                purchaseEligibility: {
                    counters: [{
                        name: "PurchaseEligibility",
                        dimensions: ["failureReason"]
                    }, "PurchaseEligibilityFailedToFetch", "EconomicRestrictionModalShown", "AccessManagementUpsellModalShown", {
                        name: "AccessManagementUpsellResult",
                        dimensions: ["result"]
                    }, "PurchaseDisabledModalShownDisabledBySelf", "PurchaseDisabledModalShownParentalConsent"],
                    errors: ["AccessManagementUpsellException"]
                },
                purchaseWarning: {
                    counters: [{
                        name: "PurchaseWarningModalShown",
                        dimensions: ["action"]
                    }, {
                        name: "StoppedPurchaseWarning",
                        dimensions: ["action"]
                    }, "PurchaseWarningAcknowledged"],
                    errors: ["PurchaseWarningAcknowledgeFailed"]
                },
                firstTimePurchaseConsent: {
                    counters: ["FirstTimePurchaseConsentNotFetchedInTime"],
                    flows: [{
                        id: "firstTimePurchaseConsent",
                        title: "First-time purchase consent gate",
                        steps: [{
                            counter: "FirstTimePurchaseConsentShown",
                            role: "start"
                        }, {
                            counter: "FirstTimePurchaseConsentConfirmed",
                            role: "success"
                        }, {
                            counter: "FirstTimePurchaseConsentDismiss",
                            role: "drop"
                        }]
                    }]
                },
                gifting: {
                    counters: ["RobuxGiftingModalShown", "RobuxGiftingModalClosed", "RobuxGiftingCopyUrl", {
                        name: "RobuxGiftingShare",
                        dimensions: ["method"]
                    }, "RobuxGiftingShareDismissed", "RobuxGiftingQrGenerated"],
                    errors: ["RobuxGiftingCopyFailed", "RobuxGiftingShareFailed"]
                },
                quickPay: {
                    counters: [{
                        name: "QuickPayPaymentFlow",
                        dimensions: ["step"],
                        steps: {
                            dimension: "step",
                            values: [{
                                value: "start",
                                role: "start"
                            }, {
                                value: "complete",
                                role: "success"
                            }, {
                                value: "redirect",
                                role: "success"
                            }, {
                                value: "3dsModalShown",
                                role: "neutral"
                            }, {
                                value: "noData",
                                role: "error"
                            }, {
                                value: "error",
                                role: "error"
                            }, {
                                value: "3dsError",
                                role: "error"
                            }]
                        }
                    }, {
                        name: "QuickPayPreparePaymentFlow",
                        dimensions: ["step"],
                        steps: {
                            dimension: "step",
                            values: [{
                                value: "start",
                                role: "start"
                            }, {
                                value: "success",
                                role: "success"
                            }, {
                                value: "redirect",
                                role: "success"
                            }, {
                                value: "error",
                                role: "error"
                            }, {
                                value: "noData",
                                role: "error"
                            }, {
                                value: "genericChallengeAbandoned",
                                role: "error"
                            }, {
                                value: "profileRemovedByFraud",
                                role: "error"
                            }]
                        }
                    }, {
                        name: "QuickPayGetMetadataFlow",
                        dimensions: ["step"],
                        steps: {
                            dimension: "step",
                            values: [{
                                value: "start",
                                role: "start"
                            }, {
                                value: "success",
                                role: "success"
                            }, {
                                value: "ineligible",
                                role: "drop"
                            }, {
                                value: "noPaymentProfiles",
                                role: "error"
                            }, {
                                value: "noEligiblePaymentProfiles",
                                role: "error"
                            }, {
                                value: "noData",
                                role: "error"
                            }]
                        }
                    }, {
                        name: "QuickPayPaymentMethodSelected",
                        dimensions: ["method"]
                    }, "QuickPaySubscribeAndSaveRedirect", {
                        name: "QuickPay3DSFlow",
                        dimensions: ["step"],
                        steps: {
                            dimension: "step",
                            values: [{
                                value: "start",
                                role: "start"
                            }, {
                                value: "messageReceived",
                                role: "neutral"
                            }, {
                                value: "success",
                                role: "success"
                            }, {
                                value: "error",
                                role: "error"
                            }, {
                                value: "urlNotSet",
                                role: "error"
                            }, {
                                value: "clientSecretNotSet",
                                role: "error"
                            }, {
                                value: "stripeError",
                                role: "error"
                            }, {
                                value: "unsuccessful",
                                role: "error"
                            }]
                        }
                    }],
                    errors: [{
                        name: "QuickPayStripeProcessPaymentError",
                        dimensions: ["stripeErrorCode"]
                    }, "QuickPayPreparePaymentNoPaymentProfile", "QuickPayStripeException", "QuickPayPercentStringException"]
                },
                subscriptionV2: {
                    counters: [{
                        name: "SubscriptionV2SubscribeClick",
                        dimensions: ["isFreeTrial", "productId", "isRedirect"]
                    }, "SubscriptionV2LearnMoreClick", "SubscriptionV2NoPrimaryProduct", {
                        name: "SubscriptionV2SectionShown",
                        dimensions: ["variant", "tierCount", "isFreeTrial"]
                    }, {
                        name: "PlusBillingPeriodSelectionExperimentEvaluated",
                        dimensions: ["variant"]
                    }, "PlusBillingPeriodSelectionExperimentExposed", "PlusBillingPeriodSelectionExposureBeforeAssignment"],
                    errors: ["PlusBillingPeriodSelectionExperimentFetchFailed", "PlusBillingPeriodSelectionLayerExposureError"]
                },
                transfers: {
                    counters: ["TransferSendImpression", "TransferSendSheetView", {
                        name: "TransferSendUserSelected",
                        dimensions: ["source"]
                    }, "TransferPendingImpression", "TransferPendingSheetView", "TransferPendingAcceptClick", "PendingTransferDeepLink", "SendTransferDeepLink"],
                    errors: ["QRCodeGenerationFailed"]
                },
                userSearch: {
                    counters: ["UserSearchStarted", "UserSearchNoResults", "UserSearchUserSelected"]
                },
                redirect: {
                    counters: ["MobileRedirectUrlGenerationStarted", "MobileRedirectUrlGenerationSuccess", {
                        name: "MobileToWebPurchaseRedirect",
                        dimensions: ["version"]
                    }, "LoginRedirectLoggingExposureWithoutExperimentAccess", {
                        name: "LoginRedirectExperimentEvaluated",
                        dimensions: ["variant", "appType"]
                    }, "LoginRedirectExperimentExposed", {
                        name: "LoginRedirectUnsupportedIos",
                        dimensions: ["iosMajorVersion", "appType"]
                    }, {
                        name: "RedirectClickTime",
                        dimensions: ["bucket"]
                    }, "StampRedirectStartTsFailed"],
                    errors: ["MobileRedirectUrlGenerationFailed", "LoginRedirectExperimentFetchFailed", "LoginRedirectLayerExposureError"]
                },
                limitedTimeBonus: {
                    errors: ["ResolveLimitedTimeBonusExpirationInvalidTimestamp"]
                }
            }
        },
        eb = (0, eg.createFireTelemetryCounter)(ex.featureName),
        {
            trackCounter: ey,
            trackError: ev,
            trackCriticalError: eS
        } = (0, em.createTrackers)(ex, {
            publish: eb,
            captureException: eh.captureException
        }),
        eP = (0, ef.createWithApiMetricsV2)(eb, eh.captureException),
        {
            reportPageLoad: eC,
            reportPageView: eE
        } = (t = "function" == typeof(a = {
            publishCounter: eb
        }) ? a : a.publishCounter, r = !1, n = !1, {
            reportPageLoad: function() {
                if (!r) {
                    r = !0;
                    try {
                        t("PageLoad")
                    } catch {}
                }
            },
            reportPageView: function() {
                if (!n) {
                    n = !0;
                    try {
                        t("PageView")
                    } catch {}
                }
            }
        }),
        ew = (0, ep.createObsErrorBoundary)({
            publish: eb,
            captureException: eh.captureException,
            featureName: ex.featureName
        });
    var eN = ((i = {}).GET = "GET", i.POST = "POST", i),
        ek = ((s = {}).ACKNOWLEDGE_PURCHASE_WARNING = "AcknowledgePurchaseWarning", s.CHECK_USER_PURCHASE_SETTING = "CheckUserPurchaseSetting", s.GET_ENABLE_PURCHASES_SETTING = "GetEnablePurchaseSetting", s.GET_PAYMENT_PROFILES = "GetPaymentProfiles", s.GET_PENDING_ENABLE_PURCHASE_CONSENT_REQUESTS = "GetPendingEnablePurchaseConsentRequests", s.GET_PURCHASE_WARNING = "GetPurchaseWarning", s.GET_QUICK_PAY_METADATA = "GetQuickPayMetadata", s.GET_ROBUX_BALANCE = "GetRobuxBalance", s.GET_THUMBNAILS = "GetThumbnails", s.PREPARE_PAYMENT = "PreparePayment", s.PROCESS_PAYMENT = "ProcessPayment", s.GET_CLIENT_ASSERTION_V2 = "GetClientAssertionV2", s.GET_AUTH_TICKET_V2 = "GetAuthTicketV2", s.GET_MY_FRIENDS = "GetMyFriends", s.USER_SEARCH = "UserSearch", s);
    async function eT(e, t, r, n, a, i) {
        let {
            url: s,
            ...l
        } = r;
        return ("GET" === e ? eP({
            method: "GET",
            url: s,
            config: {
                ...l,
                params: n
            },
            eventCounterProps: {
                call: t
            }
        }) : eP({
            method: "POST",
            url: s,
            config: l,
            eventCounterProps: {
                call: t
            },
            data: n ?? {}
        })).then(e => {
            let {
                data: t,
                headers: r
            } = e;
            return a?.(t, r) ?? t
        }).catch(e => {
            if (i) throw e
        })
    }
    let ej = async e => eT(eN.GET, ek.GET_ROBUX_BALANCE, {
        url: `${ei.EnvironmentUrls.economyApi}/v1/users/${e}/currency`,
        withCredentials: !0
    });
    var eA = ((l = {}).Completed = "Completed", l.Pending = "Pending", l);
    let eM = async e => eT(eN.POST, ek.GET_THUMBNAILS, {
        url: `${ei.EnvironmentUrls.thumbnailsApi}/v1/batch`,
        withCredentials: !0
    }, e), eR = (0, L.createContext)({
        trackEconomicRestrictionErrorShown: () => void 0,
        trackGiftCardClick: () => void 0,
        trackPurchase: () => void 0,
        trackPurchaseDisabledConfirm: () => void 0,
        trackPurchaseDisabledNeutral: () => void 0,
        trackPurchaseDisabledShown: () => void 0,
        trackPurchaseWarningShown: () => void 0,
        trackQuickPay3DSShown: () => void 0,
        trackQuickPayClick: () => void 0,
        trackQuickPayClickPaymentMethodDropdown: () => void 0,
        trackQuickPayClose: () => void 0,
        trackQuickPayPurchase: () => void 0,
        trackQuickPayShown: () => void 0,
        trackQuickPayUseDifferentPaymentMethod: () => void 0,
        trackRobuxGiftClick: () => void 0,
        trackRobuxGiftShown: () => void 0,
        trackSubscriptionV2Shown: () => void 0,
        trackSubscriptionV2SubscribeClick: () => void 0,
        trackSubscriptionV2LearnMoreClick: () => void 0,
        trackRedirectClick: () => void 0,
        trackSamsungPaymentMethodsCancel: () => void 0,
        trackSamsungPaymentMethodsRedeemCreditClick: () => void 0,
        trackSamsungPaymentMethodsSamsungPayClick: () => void 0,
        trackSamsungPaymentMethodsShown: () => void 0,
        trackTransferSendImpression: () => void 0,
        trackTransferSendSheetView: () => void 0,
        trackTransferSendUserSelected: e => void 0,
        trackPendingTransfersImpression: () => void 0,
        trackPendingTransfersSheetView: () => void 0,
        trackPendingTransfersAcceptClick: () => void 0
    }), eI = e => e.isDesktop && !e.isUWPApp && !e.isPcGdkApp || !e.isAmazonApp && !e.isUWPApp && !e.isIosApp && !e.isAndroidApp && !e.isPcGdkApp, eU = e => e.isAmazonApp || e.isUWPApp || e.isIosApp || e.isAndroidApp || e.isPcGdkApp, {
        ENUM_TRIGGERING_CONTEXT: {
            MOBILE_WEB_PREMIUM_PURCHASE: e_,
            MOBILE_WEB_ROBUX_PURCHASE: eF,
            WEBVIEW_PREMIUM_PURCHASE: eL,
            WEBVIEW_ROBUX_PURCHASE: eD,
            WEB_PREMIUM_PURCHASE: eB,
            WEB_ROBUX_PURCHASE: eO
        }
    } = D.paymentFlowAnalyticsService;

    function eG(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
        return eU(e) ? t ? eL : eD : e.isDesktop ? t ? eB : eO : t ? e_ : eF
    }
    var ez = e.i(836931);
    let eV = "data-section-type",
        eW = "data-product-id",
        eK = "data-subscription-product-id",
        eH = "data-subscription-product-type",
        eQ = [eV, eW, eK].map(e => `[${e}]`).join(", ");

    function e$(e) {
        return {
            [eV]: e.sectionType
        }
    }
    let {
        ENUM_VIEW_NAME: {
            ROBLOX_PLUS_BUY_ROBUX: eq
        },
        ENUM_PURCHASE_EVENT_TYPE: {
            USER_INPUT: eY,
            VIEW_SHOWN: eX
        },
        ENUM_VIEW_MESSAGE: {
            ROBLOX_PLUS_FREE_TRIAL: eJ,
            ROBLOX_PLUS_SUBSCRIBE: eZ,
            ROBLOX_PLUS_LEARN_MORE: e0
        }
    } = D.paymentFlowAnalyticsService;
    var e1 = e.i(951605);
    let {
        ENUM_VIEW_NAME: {
            ROBUX_SEND_TRANSFERS: e2,
            ROBUX_PENDING_TRANSFERS: e3
        },
        ENUM_PURCHASE_EVENT_TYPE: {
            VIEW_SHOWN: e5,
            USER_INPUT: e4
        },
        ENUM_VIEW_MESSAGE: {
            TRANSFER_SEND_BUTTON: e8,
            TRANSFER_SEND_SHEET: e6,
            TRANSFER_SEND_USER_SELECTED: e9,
            TRANSFER_PENDING_BUTTON: e7,
            TRANSFER_PENDING_SHEET: te,
            TRANSFER_PENDING_ACCEPT_CLICK: tt
        }
    } = D.paymentFlowAnalyticsService;

    function tr(e) {
        let {
            children: t
        } = e, r = function() {
            let {
                limitedTimeBonusItem: e,
                bonusItemId: t,
                paymentSession: r,
                productIds: n,
                robuxBalance: a,
                sectionNames: i,
                subscriptionProductIds: s,
                urlParams: l,
                deviceMeta: o
            } = (0, L.useContext)(ec), c = function() {
                let [e, t] = (0, L.useState)();
                return (0, L.useEffect)(() => {
                    if (void 0 === J.window) return;
                    let e = J.window.location.href.includes("sitetest1") ? "merchant.sitetest1.robloxlabs.com.stripe" : "merchant.www.roblox.com.stripe",
                        {
                            ApplePaySession: r
                        } = J.window;
                    (async () => {
                        try {
                            if (!r?.canMakePayments()) return void t(!1);
                            let n = await r.canMakePaymentsWithActiveCard(e);
                            t(!!n)
                        } catch (e) {
                            ev("ApplePayAvailabilityException", null, e), t(!1)
                        }
                    })()
                }, []), e
            }(), {
                seenProducts: u,
                seenSections: d,
                seenSubscriptionProducts: m
            } = function() {
                let e = (0, L.useRef)(new Set),
                    t = (0, L.useRef)(new Set),
                    r = (0, L.useRef)(new Map),
                    [n, a] = (0, L.useState)({
                        seenProducts: [],
                        seenSections: [],
                        seenSubscriptionProducts: []
                    }),
                    i = (0, L.useCallback)(() => {
                        a({
                            seenProducts: [...t.current],
                            seenSections: [...e.current],
                            seenSubscriptionProducts: Array.from(r.current, e => {
                                let [t, r] = e;
                                return {
                                    subscriptionProductId: t,
                                    subscriptionProductType: r
                                }
                            })
                        })
                    }, []),
                    [s, l] = (0, L.useMemo)(() => {
                        let e;
                        return [function() {
                            for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                            clearTimeout(e), e = setTimeout(() => {
                                i(...r)
                            }, 250)
                        }, () => {
                            clearTimeout(e)
                        }]
                    }, [i]),
                    o = (0, L.useMemo)(() => [{
                        attr: eV,
                        record: t => {
                            let r = t.getAttribute(eV);
                            return !(!r || e.current.has(r)) && (e.current.add(r), !0)
                        }
                    }, {
                        attr: eW,
                        record: e => {
                            let r = e.getAttribute(eW);
                            return !(!r || t.current.has(r)) && (t.current.add(r), !0)
                        }
                    }, {
                        attr: eK,
                        record: e => {
                            let t = e.getAttribute(eK);
                            if (!t || r.current.has(t)) return !1;
                            let n = e.getAttribute(eH) ?? "";
                            return r.current.set(t, n), !0
                        }
                    }], []),
                    c = (0, L.useCallback)((e, t) => {
                        let r = !1;
                        for (let n of e) {
                            if (!n.isIntersecting) continue;
                            let {
                                target: e
                            } = n;
                            for (let {
                                    attr: n,
                                    record: a
                                }
                                of o)
                                if (e.hasAttribute(n)) {
                                    a(e) && (r = !0), t.unobserve(e);
                                    break
                                }
                        }
                        r && s()
                    }, [s, o]);
                return (0, L.useEffect)(() => {
                    let e = J.document?.getElementById("robux-redesign-page");
                    if (!e) return;
                    let t = [...e.querySelectorAll(eQ)];
                    if (0 === t.length) return;
                    let r = (0, ez.observeIntersection)({
                        elements: t,
                        threshold: .5
                    }, c);
                    return () => {
                        r(), l()
                    }
                }, [c, l]), n
            }(), {
                ENUM_VIEW_NAME: {
                    PREMIUM_PURCHASE: p,
                    PRODUCT_PURCHASE: h,
                    PRODUCT_PURCHASE_IMPRESSION: f
                },
                ENUM_PURCHASE_EVENT_TYPE: {
                    VIEW_SHOWN: g,
                    USER_INPUT: x
                }
            } = D.paymentFlowAnalyticsService, b = (0, L.useMemo)(() => ({
                applePayAvailability: c?.toString() ?? "",
                ctx: l.ctx ?? "",
                limitedTimeBonusItemIds: e.ids.toString(),
                paymentSessionId: r?.id ?? "",
                personalizedBonusItem: t?.toString() ?? "",
                robuxBalance: a?.toString() ?? "",
                robuxPackageIds: n.toString(),
                sectionNames: i.toString(),
                subscriptionProductIds: s.toString()
            }), [c, l, e, r, t, a, n, i, s]), y = (0, L.useCallback)((e, t, r, n) => {
                D.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent({
                    triggerContext: eG(o, e === p),
                    isMidPurchaseStep: !0,
                    viewName: e,
                    purchaseEventType: t,
                    viewMessage: r,
                    eventMetadata: {
                        ...b,
                        ...n
                    }
                })
            }, [b, p, o]), v = (0, L.useCallback)((e, t, r) => {
                D.paymentFlowAnalyticsService.sendUserPurchaseStatusEvent({
                    triggerContext: eG(o, e === p),
                    status: t,
                    viewMessage: r,
                    viewName: e
                })
            }, [p, o]);
            return (0, L.useEffect)(() => {
                void 0 !== a && void 0 !== c && y(h, g)
            }, [a, c, y, h, g]), (0, L.useEffect)(() => {
                (u.length > 0 || d.length > 0 || m.length > 0) && y(f, x, void 0, {
                    seenProducts: u.toString(),
                    seenSections: d.toString(),
                    seenSubscriptionProducts: JSON.stringify(m)
                })
            }, [u, d, m, y, f, x]), {
                trackFlow: y,
                trackStatus: v
            }
        }(), n = function(e) {
            let {
                trackFlow: t
            } = e, {
                ENUM_VIEW_MESSAGE: {
                    BUY_NOW: r
                },
                ENUM_VIEW_NAME: {
                    GIFT_CARD: n
                },
                ENUM_PURCHASE_EVENT_TYPE: {
                    USER_INPUT: a
                }
            } = D.paymentFlowAnalyticsService;
            return {
                trackGiftCardClick: (0, L.useCallback)(() => {
                    t(n, a, r)
                }, [t, n, a, r])
            }
        }(r), a = function(e) {
            let {
                trackFlow: t
            } = e, r = (0, L.useCallback)(() => {
                t(e2, e5, e8), ey("TransferSendImpression")
            }, [t]), n = (0, L.useCallback)(() => {
                t(e2, e5, e6), ey("TransferSendSheetView")
            }, [t]), a = (0, L.useCallback)(e => {
                t(e2, e4, e9), ey("TransferSendUserSelected", {
                    source: e
                })
            }, [t]), i = (0, L.useCallback)(() => {
                t(e3, e5, e7), ey("TransferPendingImpression")
            }, [t]);
            return {
                trackTransferSendImpression: r,
                trackTransferSendSheetView: n,
                trackTransferSendUserSelected: a,
                trackPendingTransfersImpression: i,
                trackPendingTransfersSheetView: (0, L.useCallback)(() => {
                    t(e3, e5, te), ey("TransferPendingSheetView")
                }, [t]),
                trackPendingTransfersAcceptClick: (0, L.useCallback)(() => {
                    t(e3, e4, tt), ey("TransferPendingAcceptClick")
                }, [t])
            }
        }(r), i = function(e) {
            let {
                trackFlow: t
            } = e, {
                ENUM_VIEW_MESSAGE: {
                    CANCEL: r,
                    REDEEM_CREDIT_SELECTED: n,
                    SAMSUNG_PAY_SELECTED: a
                },
                ENUM_VIEW_NAME: {
                    MOBILE_PAYMENT_METHOD: i,
                    MOBILE_PAYMENT_METHOD_REDEEM_CREDIT: s,
                    MOBILE_PAYMENT_METHOD_SAMSUNG_PAY: l
                },
                ENUM_PURCHASE_EVENT_TYPE: {
                    USER_INPUT: o,
                    VIEW_SHOWN: c
                }
            } = D.paymentFlowAnalyticsService, u = (0, L.useCallback)(() => {
                t(i, o, r)
            }, [t, i, o, r]), d = (0, L.useCallback)(() => {
                t(s, o, n)
            }, [t, s, o, n]);
            return {
                trackSamsungPaymentMethodsCancel: u,
                trackSamsungPaymentMethodsRedeemCreditClick: d,
                trackSamsungPaymentMethodsSamsungPayClick: (0, L.useCallback)(() => {
                    t(l, o, a)
                }, [t, l, o, a]),
                trackSamsungPaymentMethodsShown: (0, L.useCallback)(() => {
                    t(i, c)
                }, [t, i, c])
            }
        }(r), s = function(e) {
            let {
                trackFlow: t
            } = e, {
                ENUM_VIEW_NAME: {
                    PREMIUM_PURCHASE: r,
                    PRODUCT_PURCHASE: n
                },
                ENUM_PURCHASE_EVENT_TYPE: {
                    USER_INPUT: a
                }
            } = D.paymentFlowAnalyticsService;
            return {
                trackPurchase: (0, L.useCallback)((e, i, s) => {
                    let {
                        defaultDisplayName: l,
                        productId: o
                    } = e;
                    t(i ? r : n, a, `${o},${l}`, {
                        productId: o,
                        purchaseFromSectionType: s ?? "Unknown"
                    })
                }, [t, r, n, a])
            }
        }(r), l = function(e) {
            let {
                trackFlow: t
            } = e, {
                ENUM_VIEW_MESSAGE: {
                    CANCEL: r,
                    CLOSE: n,
                    GO_TO_SETTINGS: a
                },
                ENUM_VIEW_NAME: {
                    ECONOMIC_RESTRICTION_ERROR: i,
                    OPTIMIZED_PURCHASE_VPC_MODAL: s,
                    PURCHASE_VPC_MODAL: l
                },
                ENUM_PURCHASE_EVENT_TYPE: {
                    USER_INPUT: o,
                    VIEW_SHOWN: c
                }
            } = D.paymentFlowAnalyticsService, u = (0, L.useCallback)(() => {
                t(i, c)
            }, [t, i, c]), d = (0, L.useCallback)(e => {
                t(e ? s : l, o, a)
            }, [t, s, l, o, a]);
            return {
                trackEconomicRestrictionErrorShown: u,
                trackPurchaseDisabledConfirm: d,
                trackPurchaseDisabledNeutral: (0, L.useCallback)(e => {
                    t(e ? s : l, o, e ? n : r)
                }, [t, s, l, o, n, r]),
                trackPurchaseDisabledShown: (0, L.useCallback)(e => {
                    t(e ? s : l, c, e1.UserPurchaseSettingFailureReason.PurchaseNotEnabled)
                }, [t, s, l, c])
            }
        }(r), o = function(e) {
            let {
                trackFlow: t
            } = e, {
                ENUM_VIEW_NAME: {
                    PURCHASE_WARNING: r
                },
                ENUM_PURCHASE_EVENT_TYPE: {
                    VIEW_SHOWN: n
                }
            } = D.paymentFlowAnalyticsService;
            return {
                trackPurchaseWarningShown: (0, L.useCallback)(e => {
                    t(r, n, e)
                }, [t, r, n])
            }
        }(r), c = function(e) {
            let {
                trackFlow: t,
                trackStatus: r
            } = e, {
                ENUM_PURCHASE_STATUS: {
                    SUCCESS: n
                },
                ENUM_VIEW_MESSAGE: {
                    CANCEL: a,
                    PAY_NOW: i,
                    PAYMENT_METHOD_DROPDOWN: s,
                    USE_DIFFERENT_PAYMENT_METHOD: l
                },
                ENUM_VIEW_NAME: {
                    PRODUCT_PURCHASE_QUICK_PAY: o,
                    QUICK_PAY_3DS: c
                },
                ENUM_PURCHASE_EVENT_TYPE: {
                    USER_INPUT: u,
                    VIEW_SHOWN: d
                }
            } = D.paymentFlowAnalyticsService, m = (0, L.useCallback)(() => {
                t(o, u, i)
            }, [t, o, u, i]), p = (0, L.useCallback)(() => {
                t(o, u, s)
            }, [t, o, u, s]), h = (0, L.useCallback)(() => {
                t(o, u, a)
            }, [t, o, u, a]), f = (0, L.useCallback)(e => {
                r(o, n, e?.productId)
            }, [r, o, n]), g = (0, L.useCallback)(e => {
                let {
                    productId: r
                } = e;
                t(o, d, void 0, {
                    productId: r
                })
            }, [t, o, d]);
            return {
                trackQuickPay3DSShown: (0, L.useCallback)(() => {
                    t(c, d)
                }, [t, c, d]),
                trackQuickPayClick: m,
                trackQuickPayClickPaymentMethodDropdown: p,
                trackQuickPayClose: h,
                trackQuickPayPurchase: f,
                trackQuickPayShown: g,
                trackQuickPayUseDifferentPaymentMethod: (0, L.useCallback)(() => {
                    t(o, u, l)
                }, [t, o, u, l])
            }
        }(r), u = function(e) {
            let {
                trackFlow: t
            } = e, {
                ENUM_VIEW_MESSAGE: {
                    REQUEST_ROBUX: r
                },
                ENUM_VIEW_NAME: {
                    ROBUX_GIFT: n,
                    ROBUX_GIFT_MODAL: a
                },
                ENUM_PURCHASE_EVENT_TYPE: {
                    USER_INPUT: i,
                    VIEW_SHOWN: s
                }
            } = D.paymentFlowAnalyticsService;
            return {
                trackRobuxGiftClick: (0, L.useCallback)(() => {
                    t(n, i, r)
                }, [t, n, i, r]),
                trackRobuxGiftShown: (0, L.useCallback)(() => {
                    t(a, s, r)
                }, [t, a, s, r])
            }
        }(r), d = function(e) {
            let {
                trackFlow: t
            } = e, r = (0, L.useCallback)(e => {
                t(eq, eX, void 0, {
                    isFreeTrial: String(e)
                })
            }, [t]);
            return {
                trackSubscriptionV2Shown: r,
                trackSubscriptionV2SubscribeClick: (0, L.useCallback)(e => {
                    let {
                        isFreeTrial: r,
                        productId: n,
                        isRedirect: a
                    } = e;
                    ey("SubscriptionV2SubscribeClick", {
                        isFreeTrial: String(r),
                        productId: n,
                        isRedirect: String(a)
                    }), t(eq, eY, r ? eJ : eZ, {
                        isFreeTrial: String(r),
                        productId: n,
                        isRedirect: String(a)
                    })
                }, [t]),
                trackSubscriptionV2LearnMoreClick: (0, L.useCallback)(() => {
                    ey("SubscriptionV2LearnMoreClick"), t(eq, eY, e0)
                }, [t])
            }
        }(r), m = function(e) {
            let {
                trackFlow: t
            } = e;
            return {
                trackRedirectClick: (0, L.useCallback)(e => {
                    let {
                        product: r,
                        isSubscriptionRedirect: n,
                        loginRedirectVersion: a
                    } = e;
                    ey("MobileToWebPurchaseRedirect", {
                        version: a ?? "none"
                    }), t(r ? n ? D.paymentFlowAnalyticsService.ENUM_VIEW_NAME.PREMIUM_PURCHASE : D.paymentFlowAnalyticsService.ENUM_VIEW_NAME.PRODUCT_PURCHASE : D.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBUX_REDIRECT_BANNER, D.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, D.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.BUY_REDIRECT, {
                        productId: r?.productId.toString() ?? ""
                    })
                }, [t])
            }
        }(r), p = (0, L.useMemo)(() => ({
            ...n,
            ...i,
            ...s,
            ...l,
            ...o,
            ...c,
            ...u,
            ...d,
            ...m,
            ...a
        }), [n, i, s, l, o, c, u, d, m, a]);
        return (0, U.jsx)(eR.Provider, {
            value: p,
            children: t
        })
    }
    var tn = e.i(579149),
        ta = e.i(420546),
        ti = e.i(679025),
        ts = e.i(695524),
        tl = L;
    let to = "u" < typeof __SENTRY_DEBUG__ || __SENTRY_DEBUG__;
    var tc = e.i(285586),
        tu = e.i(59172);
    let td = Symbol.for("react.forward_ref"),
        tm = Symbol.for("react.memo"),
        tp = {};
    tp[td] = {
        $$typeof: !0,
        render: !0,
        defaultProps: !0,
        displayName: !0,
        propTypes: !0
    }, tp[tm] = {
        $$typeof: !0,
        compare: !0,
        defaultProps: !0,
        displayName: !0,
        propTypes: !0,
        type: !0
    }, Object.defineProperty.bind(Object), Object.getOwnPropertyNames.bind(Object), Object.getOwnPropertySymbols?.bind(Object), Object.getOwnPropertyDescriptor.bind(Object), Object.getPrototypeOf.bind(Object);
    let th = {
        componentStack: null,
        error: null,
        eventId: null
    };
    class tf extends tl.Component {
        componentDidCatch(e, t) {
            let {
                componentStack: r
            } = t, {
                beforeCapture: n,
                onError: a,
                showDialog: i,
                dialogOptions: s
            } = this.props;
            (0, ta.withScope)(l => {
                n && n(l, e, r);
                let o = function(e, t, r) {
                    let n, {
                        componentStack: a
                    } = t;
                    if (null !== (n = L.version.match(/^([^.]+)/)) && parseInt(n[0]) >= 17 && (0, tu.isError)(e) && a) {
                        let t, r = Error(e.message);
                        r.name = `React ErrorBoundary ${e.name}`, r.stack = a, t = new WeakSet,
                            function e(r, n) {
                                if (!t.has(r)) {
                                    if (r.cause) return t.add(r), e(r.cause, n);
                                    r.cause = n
                                }
                            }(e, r)
                    }
                    return (0, ta.withScope)(t => (t.setContext("react", {
                        componentStack: a
                    }), (0, tc.captureException)(e, r)))
                }(e, t, {
                    mechanism: {
                        handled: null != this.props.handled ? this.props.handled : !!this.props.fallback,
                        type: "auto.function.react.error_boundary"
                    }
                });
                a && a(e, r, o), i && (this._lastEventId = o, this._openFallbackReportDialog && (0, ti.showReportDialog)({
                    ...s,
                    eventId: o
                })), this.setState({
                    error: e,
                    componentStack: r,
                    eventId: o
                })
            })
        }
        componentDidMount() {
            let {
                onMount: e
            } = this.props;
            e && e()
        }
        componentWillUnmount() {
            let {
                error: e,
                componentStack: t,
                eventId: r
            } = this.state, {
                onUnmount: n
            } = this.props;
            n && (this.state === th ? n(null, null, null) : n(e, t, r)), this._cleanupHook && (this._cleanupHook(), this._cleanupHook = void 0)
        }
        resetErrorBoundary() {
            let {
                onReset: e
            } = this.props, {
                error: t,
                componentStack: r,
                eventId: n
            } = this.state;
            e && e(t, r, n), this.setState(th)
        }
        render() {
            let {
                fallback: e,
                children: t
            } = this.props, r = this.state;
            if (null === r.componentStack) return "function" == typeof t ? t() : t;
            let n = "function" == typeof e ? tl.createElement(e, {
                error: r.error,
                componentStack: r.componentStack,
                resetError: () => this.resetErrorBoundary(),
                eventId: r.eventId
            }) : e;
            return tl.isValidElement(n) ? n : (e && to && ts.debug.warn("fallback did not produce a valid ReactElement"), null)
        }
        constructor(e) {
            super(e), this.state = th, this._openFallbackReportDialog = !0;
            const t = (0, ta.getClient)();
            t && e.showDialog && (this._openFallbackReportDialog = !1, this._cleanupHook = t.on("afterSendEvent", t => {
                !t.type && this._lastEventId && t.event_id === this._lastEventId && (0, ti.showReportDialog)({
                    ...e.dialogOptions,
                    eventId: this._lastEventId
                })
            }))
        }
    }
    var tg = e.i(698178),
        tx = e.i(251734);

    function tb(e) {
        let {
            isOpen: t,
            onConfirm: r,
            onCancel: n,
            publishMetric: a,
            triggerContext: i,
            title: s,
            description: l,
            confirmation: o,
            continueLabel: c,
            cancelLabel: u
        } = e, [d, m] = (0, L.useState)(!1), p = (0, L.useRef)(!1);
        (0, L.useEffect)(() => {
            t && !p.current && (p.current = !0, D.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent({
                triggerContext: i,
                isMidPurchaseStep: !0,
                viewName: D.paymentFlowAnalyticsService.ENUM_VIEW_NAME.FIRST_TIME_PURCHASE_CONSENT_MODAL,
                purchaseEventType: D.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN
            })), t || (p.current = !1)
        }, [t, i]);
        let h = (0, L.useCallback)(e => {
                m(!0 === e), D.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent({
                    triggerContext: i,
                    isMidPurchaseStep: !0,
                    viewName: D.paymentFlowAnalyticsService.ENUM_VIEW_NAME.FIRST_TIME_PURCHASE_CONSENT_MODAL,
                    purchaseEventType: D.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT,
                    eventMetadata: {
                        checkboxState: String(!0 === e)
                    }
                })
            }, [i]),
            f = (0, L.useCallback)(() => {
                a("FirstTimePurchaseConsent_Confirmed"), D.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent({
                    triggerContext: i,
                    isMidPurchaseStep: !0,
                    viewName: D.paymentFlowAnalyticsService.ENUM_VIEW_NAME.FIRST_TIME_PURCHASE_CONSENT_MODAL,
                    purchaseEventType: D.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT,
                    viewMessage: D.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.CONFIRM
                }), m(!1), r()
            }, [r, a, i]),
            g = (0, L.useCallback)(() => {
                a("FirstTimePurchaseConsent_Cancelled"), D.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent({
                    triggerContext: i,
                    isMidPurchaseStep: !0,
                    viewName: D.paymentFlowAnalyticsService.ENUM_VIEW_NAME.FIRST_TIME_PURCHASE_CONSENT_MODAL,
                    purchaseEventType: D.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT,
                    viewMessage: D.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.CANCEL
                }), m(!1), n()
            }, [n, a, i]);
        return (0, U.jsx)(tx.Dialog, {
            open: t,
            onOpenChange: e => {
                e || g()
            },
            size: "Small",
            isModal: !0,
            hasCloseAffordance: !1,
            children: (0, U.jsxs)(tx.DialogContent, {
                children: [(0, U.jsxs)(tx.DialogBody, {
                    children: [(0, U.jsx)("div", {
                        className: "text-heading-small content-emphasis padding-y-[4px]",
                        children: s
                    }), (0, U.jsx)("div", {
                        className: "text-body-medium padding-bottom-large content-default",
                        children: l
                    }), (0, U.jsxs)("div", {
                        className: "flex flex-row gap-medium",
                        children: [(0, U.jsx)(tg.Checkbox, {
                            isChecked: d,
                            onCheckedChange: h,
                            label: "",
                            size: "Medium",
                            placement: "Start"
                        }), (0, U.jsx)("div", {
                            className: "text-body-small content-emphasis",
                            children: o
                        })]
                    })]
                }), (0, U.jsx)(tx.DialogFooter, {
                    children: (0, U.jsxs)("div", {
                        className: "flex flex-col gap-small padding-top-xsmall",
                        children: [(0, U.jsx)(O.Button, {
                            isDisabled: !d,
                            onClick: f,
                            variant: "Emphasis",
                            size: "Medium",
                            children: c
                        }), (0, U.jsx)(O.Button, {
                            className: "width-full",
                            onClick: g,
                            variant: "Standard",
                            size: "Medium",
                            children: u
                        })]
                    })
                })]
            })
        })
    }
    let ty = (0, L.createContext)({
        purchaseDisabled: {
            closeModal: () => void 0,
            hasUserDisabledPurchases: !1,
            isOpen: !1,
            openModal: () => void 0,
            showVPCOptimization: !1
        },
        purchaseWarning: {
            action: void 0,
            closeModal: () => void 0,
            continuePurchase: () => void 0,
            isOpen: !1,
            openModal: () => void 0
        },
        quickPay: {
            closeModal: () => void 0,
            isOpen: !1,
            openModal: () => void 0
        },
        quickPay3DS: {
            closeModal: () => void 0,
            isOpen: !1,
            openModal: () => void 0,
            url: ""
        },
        robuxGifting: {
            closeModal: () => void 0,
            isOpen: !1,
            openModal: () => void 0
        },
        redirectError: {
            closeModal: () => void 0,
            isOpen: !1,
            openModal: () => void 0
        },
        samsungPaymentMethods: {
            closeModal: () => void 0,
            isBonus: !1,
            isOpen: !1,
            isSubscription: !1,
            openModal: () => void 0,
            product: void 0
        },
        firstTimePurchaseConsent: {
            closeModal: () => void 0,
            continuePurchase: void 0,
            isOpen: !1,
            openModal: () => void 0
        }
    });
    var tv = ((o = {}).U13PaymentModal = "U13PaymentModal", o.U13MonthlyThreshold1Modal = "U13MonthlyThreshold1Modal", o.U13MonthlyThreshold2Modal = "U13MonthlyThreshold2Modal", o.ParentalConsentWarningPaymentModal13To17 = "ParentalConsentWarningPaymentModal13To17", o);
    let tS = async (e, t) => eT(eN.GET, ek.GET_PURCHASE_WARNING, {
        url: `${ei.EnvironmentUrls.apiGatewayUrl}/purchase-warning/v1/purchase-warnings`,
        withCredentials: !0
    }, {
        is13To17ScaryModalEnabled: e,
        productId: t
    }), tP = async e => eP({
        method: "POST",
        url: `${ei.EnvironmentUrls.apiGatewayUrl}/purchase-warning/v1/purchase-warnings/acknowledge`,
        data: {
            acknowledgement: `Confirmed${e}`
        },
        config: {
            withCredentials: !0
        },
        eventCounterProps: {
            call: "AcknowledgePurchaseWarning"
        }
    }), tC = "<br /><br />";

    function tE() {
        let {
            purchaseWarning: {
                action: e,
                closeModal: t,
                continuePurchase: r,
                isOpen: n
            }
        } = (0, L.useContext)(ty), a = (0, er.useTranslations)("Feature.Premium"), i = (0, er.useTranslations)("CommonUI.Controls"), s = (0, L.useMemo)(() => {
            switch (e) {
                case tv.U13PaymentModal:
                    return a("Description.ScaryModalBodyNew", {
                        lineBreak: tC
                    });
                case tv.ParentalConsentWarningPaymentModal13To17:
                    return a("Description.ScaryModalBody13To17");
                case tv.U13MonthlyThreshold1Modal:
                    return a("Description.ScaryModalThreshold1Body", {
                        linebreak: tC
                    });
                case tv.U13MonthlyThreshold2Modal:
                    return a("Description.ScaryModalThreshold2Body", {
                        linebreak: tC
                    });
                default:
                    return null
            }
        }, [e, a]), l = (0, L.useCallback)(() => {
            e && tP(e).then(() => {
                ey("PurchaseWarningAcknowledged")
            }).catch(e => {
                ev("PurchaseWarningAcknowledgeFailed", {}, e)
            }).finally(() => {
                t(), r?.()
            })
        }, [e, t, r]);
        return (0, U.jsx)(tx.Dialog, {
            open: n,
            onOpenChange: t,
            isModal: !0,
            hasCloseAffordance: !0,
            closeLabel: i("Action.Close"),
            size: "Medium",
            children: (0, U.jsxs)(tx.DialogContent, {
                children: [(0, U.jsxs)(tx.DialogBody, {
                    className: "flex flex-col gap-medium",
                    children: [(0, U.jsx)(tx.DialogTitle, {
                        children: a("Heading.ScaryModalTitle")
                    }), (0, U.jsx)("div", {
                        children: s && (0, U.jsx)("div", {
                            children: (0, U.jsx)("span", {
                                className: "text-description",
                                dangerouslySetInnerHTML: {
                                    __html: s
                                }
                            })
                        })
                    })]
                }), (0, U.jsx)(tx.DialogFooter, {
                    children: (0, U.jsxs)("div", {
                        className: "flex flex-row gap-medium",
                        children: [(0, U.jsx)(O.Button, {
                            onClick: l,
                            variant: "Emphasis",
                            className: "width-full",
                            children: i("Action.OK")
                        }), (0, U.jsx)(O.Button, {
                            onClick: t,
                            variant: "Standard",
                            className: "width-full",
                            children: i("Action.Cancel")
                        })]
                    })
                })]
            })
        })
    }

    function tw() {
        let {
            purchaseDisabled: {
                closeModal: e,
                hasUserDisabledPurchases: t,
                isOpen: r,
                showVPCOptimization: n
            }
        } = (0, L.useContext)(ty), {
            trackPurchaseDisabledConfirm: a,
            trackPurchaseDisabledNeutral: i
        } = (0, L.useContext)(eR), s = (0, er.useTranslations)("Common.VerifiedParentalConsent"), [l, o] = (0, L.useMemo)(() => n && !t ? [s("Label.RequestPending"), s("Description.ExistingPendingRequestRedirectToSettings")] : n && t ? [s("Label.UpdateYourSettings"), s("Description.EnablePurchasesInSettings")] : [s("Label.AskParent"), s("Description.SpendingRestrictionWithSettings")], [n, t, s]), c = (0, L.useCallback)(() => {
            void 0 !== J.window && (a(n), J.window.location.href = "/my/account#!/billing")
        }, [a, n]), u = (0, L.useCallback)(() => {
            i(n), e()
        }, [i, n, e]);
        return (0, U.jsx)(tx.Dialog, {
            open: r,
            onOpenChange: e => {
                e || u()
            },
            size: "Medium",
            isModal: !0,
            hasCloseAffordance: !0,
            closeLabel: s("Action.Close"),
            children: (0, U.jsxs)(tx.DialogContent, {
                children: [(0, U.jsxs)(tx.DialogBody, {
                    children: [(0, U.jsx)(tx.DialogTitle, {
                        children: (0, U.jsx)("div", {
                            children: l
                        })
                    }), (0, U.jsx)("div", {
                        className: "text-body-large",
                        children: o
                    })]
                }), (0, U.jsx)(tx.DialogFooter, {
                    children: (0, U.jsxs)("div", {
                        className: "flex flex-row gap-small",
                        children: [(0, U.jsx)(O.Button, {
                            onClick: c,
                            variant: "Emphasis",
                            className: "width-full",
                            children: s("Action.GoToSettings")
                        }), (0, U.jsx)(O.Button, {
                            onClick: u,
                            variant: "Standard",
                            className: "width-full",
                            children: s("Action.Close")
                        })]
                    })
                })]
            })
        })
    }
    var tN = e.i(424935),
        tk = e.i(677810),
        tT = e.i(263730),
        tj = e.i(698870);

    function tA() {
        let [e, t] = (0, L.useState)(!1), {
            deviceMeta: r,
            giftingAvatarImageUrl: n,
            giftingUrl: a
        } = (0, L.useContext)(ec), {
            robuxGifting: {
                closeModal: i,
                isOpen: s
            }
        } = (0, L.useContext)(ty), l = (0, er.useTranslations)("Feature.GiftingProducts"), {
            handleCopyUrl: o,
            handleShareLink: c,
            qrImgSrc: u
        } = function(e, t) {
            let [r, n] = (0, L.useState)("");
            return (0, L.useEffect)(() => {
                async function t() {
                    try {
                        n(await (0, tj.toDataURL)(e, {
                            errorCorrectionLevel: "H",
                            margin: 0,
                            width: 306
                        })), ey("RobuxGiftingQrGenerated")
                    } catch (e) {
                        ev("QRCodeGenerationFailed", null, e)
                    }
                }
                e && t()
            }, [e]), {
                handleCopyUrl: (0, L.useCallback)(() => {
                    void 0 !== J.navigator && e && J.navigator.clipboard.writeText(e).catch(e => {
                        ev("RobuxGiftingCopyFailed", null, e)
                    })
                }, [e]),
                handleShareLink: (0, L.useCallback)(() => {
                    if (void 0 === J.window || void 0 === J.navigator || !e) return;
                    let {
                        DOMException: r
                    } = J.window;
                    if (t.isIosDevice || t.isAndroidDevice || t.isUniversalApp) {
                        ey("RobuxGiftingShare", {
                            method: "native"
                        }), J.navigator.share({
                            url: e
                        }).catch(e => {
                            e instanceof r && "AbortError" === e.name ? ey("RobuxGiftingShareDismissed") : ev("RobuxGiftingShareFailed", null, e)
                        });
                        return
                    }
                    ey("RobuxGiftingShare", {
                        method: "mailto"
                    }), J.window.location.href = `mailto:?body=${encodeURIComponent(e)}`
                }, [t, e]),
                qrImgSrc: r
            }
        }(a, r), d = (0, ea.getCurrentUser)(), m = null != d, p = (0, L.useRef)(!1);
        if ((0, L.useEffect)(() => {
                m && (s ? ey("RobuxGiftingModalShown") : p.current && ey("RobuxGiftingModalClosed"), p.current = s)
            }, [m, s]), !d) return null;
        let {
            displayName: h,
            userName: f
        } = d, g = `@${f}`;
        return (0, U.jsx)(tx.Dialog, {
            open: s,
            onOpenChange: i,
            size: "Medium",
            isModal: !0,
            hasCloseAffordance: !0,
            closeLabel: l("Action.Gifting.Close"),
            children: (0, U.jsxs)(tx.DialogContent, {
                children: [(0, U.jsxs)(tx.DialogBody, {
                    className: "flex flex-col gap-large",
                    children: [(0, U.jsx)(tx.DialogTitle, {
                        children: (0, U.jsx)("div", {
                            className: "text-heading-medium",
                            children: l("Heading.Gifting.RequestRobux")
                        })
                    }), (0, U.jsxs)("div", {
                        className: "flex flex-col gap-medium",
                        children: [(0, U.jsx)("div", {
                            className: "text-body-large",
                            children: l("Message.Gifting.RequestRobuxDescriptionLine1")
                        }), (0, U.jsx)("div", {
                            className: "text-body-small",
                            children: l("Message.Gifting.RequestRobuxDescriptionLine2")
                        })]
                    }), (0, U.jsxs)("div", {
                        className: "flex flex-col gap-medium bg-[var(--color-extended-white-100)] items-center justify-center radius-large padding-large",
                        children: [(0, U.jsx)("div", {
                            className: "width-[158px] height-[158px] flex justify-center items-center",
                            style: {
                                backgroundImage: `url(${u})`,
                                backgroundPosition: "center",
                                backgroundSize: "contain",
                                transform: "rotate(22.7deg)",
                                marginTop: 28,
                                marginBottom: 20
                            },
                            children: (0, U.jsx)("div", {
                                className: "width-[56px] height-[56px] bg-[var(--color-extended-white-100)]",
                                children: (0, U.jsx)("span", {
                                    className: "clip",
                                    style: {
                                        float: "left"
                                    },
                                    children: n && (0, U.jsx)("img", {
                                        className: "width-full height-full",
                                        style: {
                                            opacity: 1,
                                            transition: "opacity .5s",
                                            transform: "scale(1.25) rotate(-22.7deg)"
                                        },
                                        src: n,
                                        alt: "user avatar"
                                    })
                                })
                            })
                        }), (0, U.jsxs)("div", {
                            className: "text-align-x-center content-[var(--color-extended-gray-700)]",
                            children: [h && (0, U.jsx)("div", {
                                className: "text-title-large",
                                children: h
                            }), g && (0, U.jsx)("div", {
                                className: "text-body-small",
                                children: g
                            })]
                        })]
                    }), (0, U.jsx)("div", {
                        children: (0, U.jsxs)("div", {
                            className: "flex flex-row gap-small items-end",
                            children: [(0, U.jsx)(tk.TextInput, {
                                value: a,
                                onClick: e => {
                                    e.currentTarget.select()
                                },
                                label: l("Action.Gifting.CopyAndShareUrl")
                            }), (0, U.jsx)(tT.Tooltip, {
                                position: "left-center",
                                open: e,
                                title: l("Message.Gifting.UrlCopied"),
                                children: (0, U.jsx)(tT.TooltipTrigger, {
                                    asChild: !0,
                                    children: (0, U.jsx)(tN.IconButton, {
                                        icon: "icon-regular-chain-link",
                                        size: "Large",
                                        ariaLabel: l("Action.Gifting.CopyAndShareUrl"),
                                        onClick: () => {
                                            ey("RobuxGiftingCopyUrl"), o(), t(!0), setTimeout(() => {
                                                t(!1)
                                            }, 2e3)
                                        },
                                        variant: "Standard"
                                    })
                                })
                            })]
                        })
                    })]
                }), (0, U.jsx)(tx.DialogFooter, {
                    children: (0, U.jsxs)("div", {
                        className: "flex flex-row gap-small justify-center",
                        children: [(0, U.jsx)(O.Button, {
                            variant: "Standard",
                            onClick: i,
                            className: "width-full",
                            children: l("Action.Gifting.Close")
                        }), (0, U.jsx)(O.Button, {
                            variant: "Emphasis",
                            onClick: c,
                            icon: "icon-regular-arrow-up-from-landscape-rectangle",
                            className: "width-full",
                            children: l("Action.Gifting.ShareUrl")
                        })]
                    })
                })]
            })
        })
    }
    var tM = e.i(155581),
        tR = e.i(967715),
        tI = e.i(495039),
        tU = e.i(908740),
        t_ = e.i(453893);
    let tF = L.createContext({
            hasCloseAffordance: !1,
            titleId: "",
            descriptionId: ""
        }),
        tL = e => {
            let t = window.matchMedia?.("(pointer: coarse)")?.matches ?? !1,
                r = document.activeElement?.matches(":focus-visible");
            t && !r && e.preventDefault()
        },
        tD = e => {
            let {
                open: t,
                defaultOpen: r,
                onOpenChange: n,
                children: a
            } = e;
            return L.createElement(t_.Root, {
                open: t,
                defaultOpen: r,
                onOpenChange: n
            }, a)
        },
        tB = e => {
            let {
                asChild: t,
                className: r,
                children: n
            } = e;
            return L.createElement(t_.Trigger, {
                asChild: t,
                className: r
            }, n)
        },
        tO = e => {
            let {
                position: t,
                hasBeak: r = !0,
                hasCloseAffordance: n,
                closeLabel: a,
                onOpenAutoFocus: i,
                className: s,
                children: l
            } = e, [o, c] = t.split("-"), u = "dark" === (0, tU.default)() ? "light" : "dark", d = (0, G.default)("fui-edu-tooltip"), m = `${d}-title`, p = `${d}-desc`, h = L.useMemo(() => ({
                hasCloseAffordance: !!n,
                titleId: m,
                descriptionId: p
            }), [n, m, p]);
            return L.createElement(t_.Portal, null, L.createElement(t_.Content, {
                side: o,
                align: c,
                sideOffset: 6,
                "aria-labelledby": m,
                "aria-describedby": p,
                onOpenAutoFocus: i ?? tL,
                className: (0, W.default)("light" === u ? "color-mode-light" : "color-mode-dark", "relative foundation-web-portal-zindex bg-surface-100 radius-medium shadow-transient-low", "min-width-[240px] max-width-[296px]", s)
            }, r && L.createElement(t_.Arrow, {
                asChild: !0
            }, L.createElement("div", {
                style: {
                    color: "var(--color-surface-100)"
                }
            }, L.createElement(tI.Beak, null))), n && L.createElement("div", {
                className: "absolute top-[var(--size-50)] right-[var(--size-100)]"
            }, L.createElement(t_.Close, {
                asChild: !0
            }, L.createElement(V.CloseAffordance, {
                variant: "Utility",
                size: "Medium",
                isCircular: !0,
                "aria-label": a || ""
            }))), L.createElement(tF.Provider, {
                value: h
            }, l)))
        },
        tG = e => {
            let {
                children: t,
                className: r
            } = e, {
                hasCloseAffordance: n
            } = L.useContext(tF);
            return L.createElement("div", {
                className: (0, W.default)("padding-medium", n && "padding-right-[var(--size-1100)]", r)
            }, t)
        },
        tz = e => {
            let {
                children: t,
                className: r
            } = e, {
                descriptionId: n
            } = L.useContext(tF);
            return L.createElement("div", {
                id: n,
                className: (0, W.default)("text-body-medium content-default padding-top-xsmall", r)
            }, t)
        };
    var tV = e.i(433424),
        tW = e.i(417902);
    let tK = e => {
        let {
            ariaLabel: t
        } = e;
        return (0, U.jsx)("div", {
            className: "fixed width-full height-full flex items-center justify-center",
            style: {
                zIndex: 1030,
                top: 0,
                left: 0,
                backgroundColor: "var(--color-common-backdrop)"
            },
            children: (0, U.jsx)(tV.ProgressCircle, {
                ariaLabel: t,
                variant: "Indeterminate",
                size: "Large"
            })
        })
    };
    var tH = e.i(120274),
        tQ = e.i(682259);
    let t$ = ["icon-regular-star", "icon-regular-circle-star", "icon-regular-shopping-basket-check", "icon-regular-flame", "icon-filled-robux", "icon-regular-wallet", "icon-regular-tag"],
        tq = e => (0, tQ.arrayIncludes)(t$, e);

    function tY(e) {
        return (Number(e.units ?? "0") + (e.nanos ?? 0) / 1e9).toString()
    }
    let tX = e => {
        let {
            Nanos: t,
            Units: r
        } = e;
        return parseFloat((r + t / 1e9).toFixed(2))
    };
    var tJ = e.i(255447),
        tZ = e.i(559170);
    let t0 = e => e?.paymentProfileType === "paypal",
        t1 = "****";

    function t2(e, t) {
        return new Intl.DateTimeFormat("default", {
            month: "2-digit",
            year: "2-digit"
        }).format(new Date(t, e - 1))
    }

    function t3(e) {
        let {
            expirationLabel: t,
            payload: r
        } = e, n = "payment-method-container text-body-small medium:text-body-large";
        return t0(r) ? (0, U.jsxs)("span", {
            className: n,
            children: [(0, U.jsx)("span", {
                className: "payment-method-image card-icon icon-paypal"
            }), (0, U.jsx)("span", {
                className: "paypal-email",
                children: r.Email
            })]
        }) : (0, U.jsxs)("span", {
            className: n,
            children: [(0, U.jsx)("span", {
                className: `payment-method-image card-icon ${function(e){switch(e.toLowerCase()){case"amex":case"americanexpress":return"icon-amex";case"discover":return"icon-discover";case"mastercard":return"icon-mastercard";case"visa":return"icon-visa";case"debit":return"icon-debit";default:return"icon-generic-card"}}(r.CardNetwork)}`
            }), (0, U.jsxs)("span", {
                className: "card-number",
                children: [(0, U.jsx)("span", {
                    className: "card-asterisk-mask",
                    children: t1
                }), (0, U.jsx)("span", {
                    className: "payment-profile-label",
                    children: r.Last4Digits
                })]
            }), (0, U.jsx)("span", {
                className: "card-exp-key",
                children: t
            }), (0, U.jsx)("span", {
                className: "card-exp-value",
                children: t2(r.ExpMonth, r.ExpYear)
            })]
        })
    }

    function t5(e) {
        var t, r;
        let {
            error: n,
            onSelectPaymentProfile: a,
            paymentProfiles: i,
            selectedPaymentProfile: s
        } = e, {
            trackQuickPayClickPaymentMethodDropdown: l
        } = (0, L.useContext)(eR), o = (0, er.useTranslations)("Feature.Premium"), c = i.length > 1;
        return s?.providerPayload ? (0, U.jsx)(tJ.Dropdown, {
            size: "Large",
            value: s.id,
            placeholder: (t = s.providerPayload, r = o("QuickPay.Expiration"), t0(t) ? t.Email ?? "" : `${t1}${t.Last4Digits} ${r} ${t2(t.ExpMonth,t.ExpYear)}`),
            hasError: !!n,
            hint: n && o.has(n) ? o(n) : void 0,
            onOpenChange: e => {
                e && c && l()
            },
            onValueChange: e => {
                if (e === s.id) return;
                let t = i.find(t => t.id === e);
                t && a(t)
            },
            children: (0, U.jsx)(tZ.Menu, {
                children: (0, U.jsx)(tZ.MenuSection, {
                    children: i.map(e => (0, U.jsx)(tZ.MenuItem, {
                        value: e.id,
                        title: (0, U.jsx)(t3, {
                            expirationLabel: o("QuickPay.Expiration"),
                            payload: e.providerPayload
                        })
                    }, e.id))
                })
            })
        }) : null
    }
    var t4 = e.i(371078);
    let t8 = "https://stripe.com/legal/consumer",
        t6 = (0, t4.getAbsoluteUrl)("/info/terms"),
        t9 = (0, t4.getAbsoluteUrl)("/info/privacy"),
        t7 = (0, t4.getAbsoluteUrl)("/my/account#!/billing");

    function re(e, t, r) {
        return {
            closing: t,
            opening: e,
            render: e => (0, U.jsx)("a", {
                href: r,
                className: "text-link",
                children: e
            })
        }
    }
    let rt = [re("termsLinkStart", "termsLinkEnd", t6), re("privacyLinkStart", "privacyLinkEnd", t9), re("billingLinkStart", "billingLinkEnd", t7), re("stripeTermsLinkStart", "stripeTermsLinkEnd", t8), re("stripePrivacyLinkStart", "stripePrivacyLinkEnd", t8)];

    function rr(e) {
        let {
            translationKey: t
        } = e, {
            translateFullKey: r
        } = (0, er.useFullKeyTranslations)();
        return (0, U.jsx)("div", {
            className: "legal-disclosure-container",
            children: (0, U.jsx)("p", {
                className: "text-footer legal-text-holder content-default",
                style: {
                    fontSize: 10
                },
                children: r.html(t ?? "Feature.BuyRobux.Message.QuickPay.LegalDisclosureText", rt)
            })
        })
    }
    let rn = e => {
        let {
            amount: {
                nanos: t,
                units: r
            }
        } = e;
        return Number(r ?? 0) + (t ?? 0) / 1e9
    };

    function ra(e) {
        let {
            isChecked: t,
            onToggle: r,
            offer: {
                initialPrice: n,
                recurringPrice: a,
                robuxAmount: i
            }
        } = e, s = (0, er.useTranslations)("Feature.Payment");
        return (0, U.jsx)("div", {
            className: "margin-top-small",
            "data-testid": "quick-pay-subscribe-and-save-offer",
            children: (0, U.jsx)(tg.Checkbox, {
                label: s.html("Label.SubscribeAndSaveV2", [{
                    opening: "robuxIconStart",
                    closing: "robuxIconEnd",
                    render: () => (0, U.jsx)(B.Icon, {
                        name: "icon-regular-robux",
                        size: "Small",
                        style: {
                            verticalAlign: "text-top"
                        }
                    })
                }, {
                    opening: "initialPriceStart",
                    closing: "initialPriceEnd",
                    render: () => (0, U.jsx)(tH.PriceTag, {
                        amount: rn(n),
                        currencyCode: n.amount.currencyCode,
                        tagClassName: "line-through"
                    })
                }, {
                    opening: "recurringPriceStart",
                    closing: "recurringPriceEnd",
                    render: () => (0, U.jsx)(tH.PriceTag, {
                        amount: rn(a),
                        currencyCode: a.amount.currencyCode
                    })
                }, {
                    opening: "subscriptionTermsStart",
                    closing: "subscriptionTermsEnd",
                    render: e => (0, U.jsx)("a", {
                        href: "https://en.help.roblox.com/hc/en-us/articles/46804865425300-Roblox-Subscription-Terms",
                        target: "_blank",
                        rel: "noopener noreferrer",
                        className: "content-link underline",
                        children: e
                    })
                }], {
                    robuxAmount: (0, tM.formatNumber)(i)
                }),
                size: "Medium",
                placement: "Start",
                onCheckedChange: r,
                isChecked: t
            })
        })
    }
    var ri = e.i(564035);
    let rs = {
        src: e.i(921743).default,
        width: 12,
        height: 12,
        blurWidth: 0,
        blurHeight: 0
    };

    function rl(e) {
        let {
            size: t
        } = e;
        return (0, U.jsx)("img", {
            src: (0, ri.assetUrl)(rs),
            alt: "blue check icon",
            style: {
                width: t,
                height: t
            }
        })
    }

    function ro(e) {
        let {
            isBonusItem: t,
            legalDisclosureTranslationKey: r,
            paymentProfiles: n,
            preparePaymentProviderPayload: a,
            processPaymentForQuickPay: i,
            process3DSForQuickPay: s,
            redirectToPurchase: l,
            selectPaymentProfile: o,
            selectedPaymentProfile: c,
            selectedProduct: u,
            stripe: d,
            taxTitle: m,
            subscribedRobuxProductOffers: p = [],
            isSubscribeAndSaveChecked: h = !1,
            toggleSubscribeAndSave: f = () => void 0
        } = e, {
            bonusItemDisplayName: g,
            bonusItemId: x,
            bonusItemImageUrl: b,
            collectibleBonusItemMetadata: y,
            buyRobuxPageData: v,
            getPurchaseUrl: S
        } = (0, L.useContext)(ec), {
            quickPay: {
                closeModal: P,
                isOpen: C
            }
        } = (0, L.useContext)(ty), {
            trackQuickPayClose: E,
            trackQuickPayUseDifferentPaymentMethod: w
        } = (0, L.useContext)(eR), N = (0, er.useTranslations)("Feature.Premium"), k = (0, er.useTranslations)("Feature.BuyRobux"), T = (0, er.useTranslations)("Feature.PersonalizedBonus"), j = (0, er.useTranslations)("Feature.Payment"), {
            translateFullKey: A
        } = (0, er.useFullKeyTranslations)(), M = (0, L.useMemo)(() => {
            if (u)
                for (let e of v.sections) {
                    let t = e.limitedTimeBonus?.limitedTimeBonuses.find(e => e.robuxProductIds.includes(u.productId));
                    if (t) return t.displayableBonus.collectibleItemMetadata
                }
        }, [u, v.sections]), R = !!(M ?? (t && x) ?? y), I = u ? p.find(e => e.productId === u.productId) : void 0, _ = !!(h && I), F = u?.price.amount ?? {
            currencyCode: "USD"
        }, [D, G] = (0, L.useState)(!1), [z, V] = (0, L.useState)(!1), [W, K] = (0, L.useState)(""), H = (0, L.useCallback)(async e => {
            K(""), G(!0);
            let {
                error: t,
                isLoading: r
            } = await i(e);
            t && K(t), G(r)
        }, [i]), Q = (0, L.useCallback)(() => {
            E(), P(), K("")
        }, [E, P]), $ = (0, L.useCallback)(() => {
            if (!u || void 0 === J.window) return;
            let e = S(u, !1),
                t = e.includes("?") ? "&" : "?";
            ey("QuickPaySubscribeAndSaveRedirect"), J.window.location.href = `${e}${t}subscribeAndSave=1`
        }, [S, u]), q = (0, L.useCallback)(() => {
            w(), l(), P()
        }, [w, l, P]), [Y = 0, X = 0] = (0, L.useMemo)(() => a ? [tX(a.amountTotal), tX(a.taxAmountExclusive)] : [], [a]), Z = (0, L.useCallback)(e => {
            (async e => {
                let t = await s(e);
                t && K(t)
            })(e)
        }, [s]), ee = (0, L.useMemo)(() => (0, U.jsxs)("div", {
            className: "flex-container Placeholder Placeholder--animating",
            children: [(0, U.jsx)("span", {
                className: "Text Text-color--gray400 Text-fontSize--14 Text--tabularNumbers"
            }), (0, U.jsx)("span", {
                children: "$0.00"
            })]
        }), []);
        if ((0, L.useEffect)(() => (J.window?.addEventListener("message", Z), () => {
                J.window?.removeEventListener("message", Z)
            }), [Z]), !d || !u || !c) return null;
        let et = N("Label.PlusAmountMoreLower", {
            amount: (0, tM.formatNumber)(Number(u.bonusRobuxAmount))
        });
        return (0, U.jsx)(tx.Dialog, {
            open: C,
            onOpenChange: e => {
                e || Q()
            },
            size: "Large",
            hasCloseAffordance: !0,
            closeLabel: N("Button.OneClickPay.Cancel"),
            isModal: !0,
            children: (0, U.jsxs)(tx.DialogContent, {
                children: [(0, U.jsxs)(tx.DialogBody, {
                    children: [(0, U.jsx)(tx.DialogTitle, {
                        className: "text-heading-medium content-emphasis",
                        children: (0, U.jsx)("div", {
                            children: N("Message.OneClickPay.Title")
                        })
                    }), (0, U.jsx)(tW.Divider, {
                        className: "margin-y-small"
                    }), (0, U.jsxs)("div", {
                        className: "product",
                        children: [(0, U.jsxs)("div", {
                            className: "icon-wrapper",
                            children: [(0, U.jsx)(B.Icon, {
                                name: "icon-filled-robux",
                                size: "XXLarge",
                                style: {
                                    height: 60,
                                    width: 60,
                                    color: "var(--color-content-emphasis)"
                                }
                            }), (0, U.jsxs)("div", {
                                className: "product-detail",
                                children: [(0, U.jsx)("div", {
                                    className: "product-name",
                                    children: k("Label.RobuxQuantity", {
                                        quantity: (0, tM.formatNumber)(Number(u.robuxAmount))
                                    })
                                }), (0, U.jsx)(tH.PriceTag, {
                                    tagClassName: "product-price",
                                    amount: Number(tY(F)),
                                    currencyCode: F.currencyCode
                                })]
                            }), u.bonusRobuxAmount && u.bonusRobuxTagIcon && tq(u.bonusRobuxTagIcon) && (0, U.jsx)("div", {
                                className: "margin-top-[14px] margin-left-[6px] self-start",
                                children: (0, U.jsx)(tR.Badge, {
                                    variant: "Contrast",
                                    icon: u.bonusRobuxTagIcon,
                                    label: u.bonusRobuxTagTranslationKey ? A(u.bonusRobuxTagTranslationKey, {
                                        amount: (0, tM.formatNumber)(Number(u.bonusRobuxAmount))
                                    }, et) : et,
                                    className: "text-overflow",
                                    size: "XSmall"
                                })
                            })]
                        }), R && (0, U.jsxs)(L.Fragment, {
                            children: [(0, U.jsx)(B.Icon, {
                                name: "icon-filled-plus-large",
                                size: "XXLarge"
                            }), (0, U.jsxs)("div", {
                                className: "bonus-item-card-small",
                                children: [M ? (0, U.jsx)("img", {
                                    src: M.image2dUrl,
                                    alt: "bonus item",
                                    className: "height-[60px] width-auto max-width-full object-contain shrink-0"
                                }) : b ? (0, U.jsx)("div", {
                                    className: "icon-upsell-item-small-preview thumbnail-2d-container",
                                    children: (0, U.jsx)("img", {
                                        src: b,
                                        alt: "bonus item",
                                        className: "width-full height-full"
                                    })
                                }) : y ? (0, U.jsx)("img", {
                                    src: y.image2dUrl,
                                    alt: "bonus item",
                                    className: "width-[60px] height-[60px]"
                                }) : null, (0, U.jsxs)("div", {
                                    className: "description-container",
                                    children: [(0, U.jsx)("div", {
                                        className: "description-title",
                                        children: M ? A(M.translationKey, void 0, "Bonus Item") : g ?? A(y?.translationKey ?? "", void 0, "Bonus Item")
                                    }), (0, U.jsx)("div", {
                                        className: "description-subtitle",
                                        children: M?.creatorDisplayName ? (0, U.jsxs)("div", {
                                            className: "flex flex-row gap-xsmall self-stretch items-center justify-start margin-top-[8px]",
                                            children: [(0, U.jsx)("div", {
                                                className: "text-label-small medium:text-label-medium content-default",
                                                children: M.creatorDisplayName
                                            }), M.creatorIsVerified && (0, U.jsx)(rl, {
                                                size: 12
                                            })]
                                        }) : b ? N("Message.OneClickPay.BonusVirtualItem") : y ? (0, U.jsxs)("div", {
                                            className: "flex flex-row gap-xsmall self-stretch items-center justify-start margin-top-[8px]",
                                            children: [(0, U.jsx)("div", {
                                                className: "text-label-small medium:text-label-medium content-default",
                                                children: T("Label.ByRoblox")
                                            }), (0, U.jsx)(rl, {
                                                size: 12
                                            })]
                                        }) : null
                                    })]
                                })]
                            })]
                        })]
                    }), I && (0, U.jsx)(ra, {
                        isChecked: h,
                        onToggle: f,
                        offer: I
                    }), (0, U.jsxs)("div", {
                        className: "price-info space-between-container",
                        children: [(0, U.jsx)("div", {
                            className: "subtotal",
                            children: N("Message.OneClickPay.Subtotal")
                        }), (0, U.jsx)(tH.PriceTag, {
                            tagClassName: "subtotal-price",
                            amount: Number(tY(F)),
                            currencyCode: F.currencyCode
                        })]
                    }), (0, U.jsxs)("div", {
                        className: "tax-info space-between-container",
                        children: [(0, U.jsx)("div", {
                            className: "tax",
                            children: a ? (0, U.jsxs)(L.Fragment, {
                                children: [(0, U.jsx)("span", {
                                    className: "tax-text",
                                    children: m
                                }), (0, U.jsxs)(tD, {
                                    open: z,
                                    onOpenChange: V,
                                    children: [(0, U.jsx)(tB, {
                                        asChild: !0,
                                        children: (0, U.jsx)(tN.IconButton, {
                                            icon: "icon-regular-circle-question",
                                            size: "XSmall",
                                            variant: "Utility",
                                            ariaLabel: N("Message.OneClickPay.TaxTooltip")
                                        })
                                    }), (0, U.jsx)(tO, {
                                        position: "right-center",
                                        hasCloseAffordance: !0,
                                        closeLabel: N("Action.Close"),
                                        children: (0, U.jsx)(tG, {
                                            children: (0, U.jsx)(tz, {
                                                children: N("Message.OneClickPay.TaxTooltip")
                                            })
                                        })
                                    })]
                                })]
                            }) : ee
                        }), a ? (0, U.jsx)(tH.PriceTag, {
                            tagClassName: "tax-price",
                            amount: X,
                            currencyCode: F.currencyCode
                        }) : ee]
                    }), (0, U.jsx)(tW.Divider, {
                        style: {
                            margin: "8px 0"
                        }
                    }), (0, U.jsxs)("div", {
                        className: "space-between-container",
                        children: [(0, U.jsx)("div", {
                            className: "total-due",
                            children: N("Message.OneClickPay.TotalDue")
                        }), a ? (0, U.jsx)(tH.PriceTag, {
                            tagClassName: "total-due-price",
                            amount: Y,
                            currencyCode: F.currencyCode
                        }) : ee]
                    }), (0, U.jsxs)("div", {
                        className: "payment-method-info flex flex-col gap-small",
                        children: [(0, U.jsx)("span", {
                            children: N("Message.OneClickPay.AmountChargedTo")
                        }), (0, U.jsx)(t5, {
                            error: W,
                            onSelectPaymentProfile: o,
                            paymentProfiles: n,
                            selectedPaymentProfile: c
                        })]
                    }), (0, U.jsx)("div", {
                        className: "use-a-different-payment-method",
                        children: (0, U.jsx)("div", {
                            role: "button",
                            tabIndex: 0,
                            onClick: q,
                            children: N("Message.OneClickPay.RedirectToOldFlow")
                        })
                    }), (0, U.jsx)(tW.Divider, {
                        style: {
                            margin: "8px 0"
                        }
                    }), (0, U.jsx)("div", {
                        className: "margin-top-small",
                        children: (0, U.jsx)(rr, {
                            translationKey: r
                        })
                    })]
                }), (0, U.jsxs)(tx.DialogFooter, {
                    children: [(0, U.jsx)("div", {
                        className: "loading text-align-x-center",
                        children: D && (0, U.jsx)(tV.ProgressCircle, {
                            variant: "Indeterminate",
                            ariaLabel: k("Label.Loading")
                        })
                    }), !D && (0, U.jsxs)("div", {
                        className: "flex flex-row gap-small justify-center",
                        children: [(0, U.jsx)(O.Button, {
                            isDisabled: !_ && !a,
                            variant: "Emphasis",
                            className: "min-width-[90px]",
                            size: "Medium",
                            onClick: () => {
                                _ ? $() : a && H(a)
                            },
                            children: _ ? j("Action.Continue") : N("Button.OneClickPay.PayNow")
                        }), (0, U.jsx)(O.Button, {
                            variant: "Standard",
                            onClick: Q,
                            className: "min-width-[90px]",
                            size: "Medium",
                            children: N("Button.OneClickPay.Cancel")
                        })]
                    })]
                })]
            })
        })
    }
    let rc = e => {
        let t = (0, er.useTranslations)("Feature.BuyRobux");
        return (0, U.jsxs)("div", {
            children: [e.isQuickPayLoading && (0, U.jsx)(tK, {
                ariaLabel: t("Label.Loading")
            }), (0, U.jsx)(ro, {
                ...e
            })]
        })
    };

    function ru() {
        let {
            quickPay3DS: {
                closeModal: e,
                isOpen: t,
                url: r
            }
        } = (0, L.useContext)(ty), n = (0, er.useTranslations)("Feature.Premium");
        return (0, U.jsx)(tx.Dialog, {
            open: t,
            onOpenChange: e,
            isModal: !0,
            hasCloseAffordance: !0,
            closeLabel: n("Action.Close"),
            size: "Small",
            children: (0, U.jsx)(tx.DialogContent, {
                children: (0, U.jsxs)(tx.DialogBody, {
                    className: "flex flex-col gap-medium",
                    children: [(0, U.jsx)(tx.DialogTitle, {
                        children: n("QuickPay.Authentication")
                    }), (0, U.jsx)("div", {
                        className: "width-full clip",
                        children: (0, U.jsx)("iframe", {
                            title: "3DS Modal",
                            src: r,
                            width: 400,
                            height: 640,
                            style: {
                                border: 0
                            }
                        })
                    })]
                })
            })
        })
    }
    let rd = e => {
        let {
            onClick: t,
            title: r,
            iconComponent: n
        } = e;
        return (0, U.jsxs)("button", {
            className: "width-full flex flex-row gap-small bg-action-standard stroke-none justify-between items-center padding-large radius-medium",
            type: "button",
            onClick: t,
            children: [n, (0, U.jsx)("div", {
                className: "text-body-large",
                children: r
            })]
        })
    };

    function rm(e) {
        let {
            handleClose: t,
            handleRedeemCreditClick: r,
            handleSamsungPayClick: n
        } = e, {
            samsungPaymentMethods: {
                isOpen: a
            }
        } = (0, L.useContext)(ty), i = (0, er.useTranslations)("Feature.Premium");
        return (0, U.jsx)(tx.Dialog, {
            open: a,
            onOpenChange: t,
            isModal: !0,
            hasCloseAffordance: !0,
            closeLabel: i("Action.Close"),
            size: "Large",
            children: (0, U.jsx)(tx.DialogContent, {
                children: (0, U.jsxs)(tx.DialogBody, {
                    className: "flex flex-col gap-medium",
                    children: [(0, U.jsx)(tx.DialogTitle, {
                        children: (0, U.jsx)("div", {
                            className: "margin-right-large",
                            children: i("Message.MobilePaymentMethod.BottomSheetTitle")
                        })
                    }), (0, U.jsxs)("div", {
                        className: "flex flex-col gap-medium",
                        children: [(0, U.jsx)(rd, {
                            onClick: n,
                            title: i("Message.MobilePaymentMethod.MilkyWayCheckout"),
                            iconComponent: (0, U.jsx)("div", {
                                className: "icon-samsung-pay width-[34px] height-[34px]"
                            })
                        }), (0, U.jsx)(rd, {
                            onClick: r,
                            title: i("Message.MobilePaymentMethod.RobloxCredit"),
                            iconComponent: (0, U.jsx)("div", {
                                className: "payment-method-image robloxCredit width-[42px] height-[28px]"
                            })
                        })]
                    })]
                })
            })
        })
    }
    let rp = [
            ["responseEnd", "PrimaryDataReady", ["startTime", "redirectStart", "redirectEnd", "domainLookupStart", "domainLookupEnd", "connectStart", "secureConnectionStart", "connectEnd", "requestStart", "responseStart", "domInteractive"]],
            ["domContentLoadedEventStart", "DataProcessingStarted", []],
            ["domContentLoadedEventEnd", "RenderStarted", ["loadEventStart", "loadEventEnd"]]
        ],
        {
            reportInteractive: rh
        } = function(e) {
            if (!J.window) return {
                reportInteractive: () => void 0
            };
            try {
                let t, r, n, a, i, s, l = !1,
                    o = !1,
                    c = !1,
                    u = !1,
                    d = l => {
                        let {
                            partial: o
                        } = l;
                        try {
                            let l;
                            if (u) return;
                            let c = new URLSearchParams(J.window?.location.search ?? "").get("ttiStartMs"),
                                d = null === c ? NaN : Number(c);
                            if (!Number.isFinite(d)) {
                                u = !0;
                                return
                            }
                            u = !0, i?.disconnect(), s?.disconnect();
                            let m = performance.getEntriesByType("navigation").at(0),
                                p = e => e + performance.timeOrigin - d,
                                h = function(e) {
                                    let {
                                        navTiming: t,
                                        firstPaintMs: r,
                                        serverTiming: n,
                                        deltaMs: a,
                                        serverDeltaMs: i
                                    } = e;
                                    return t ? rp.reduce((e, s) => {
                                        let [l, o, c] = s, u = t[l], d = c?.reduce((e, r) => {
                                            let n = t[r];
                                            return n ? [...e, {
                                                name: r,
                                                deltaMs: a(n)
                                            }] : e
                                        }, []);
                                        "DataProcessingStarted" === o && r && d && d.push({
                                            name: "first-paint",
                                            deltaMs: a(r)
                                        });
                                        let m = u ? a(u) : void 0;
                                        return ("PrimaryDataReady" === o && n && d && (d.push({
                                            name: "serverRequestStart",
                                            deltaMs: i(n.requestStartMs)
                                        }, {
                                            name: "serverRequestEnd",
                                            deltaMs: i(n.requestEndMs)
                                        }), void 0 === m && (m = i(n.requestEndMs))), void 0 === m) ? e : [...e, {
                                            name: o,
                                            id: "web",
                                            deltaMs: m,
                                            subphases: d
                                        }]
                                    }, []) : []
                                }({
                                    navTiming: m,
                                    firstPaintMs: r,
                                    serverTiming: (e => {
                                        let t = e?.serverTiming;
                                        if (!t) return;
                                        let r = t.find(e => "rbxReqStart" === e.name)?.duration,
                                            n = t.find(e => "rbxReqEnd" === e.name)?.duration;
                                        if (void 0 !== r && void 0 !== n && Number.isFinite(r) && Number.isFinite(n)) return {
                                            requestStartMs: r,
                                            requestEndMs: n
                                        }
                                    })(m),
                                    deltaMs: p,
                                    serverDeltaMs: e => e - d
                                });
                            void 0 !== n && h.push({
                                name: "SurfaceMounted",
                                id: "web",
                                deltaMs: p(n)
                            }), void 0 !== t && h.push({
                                name: "DataProcessingCompleted",
                                id: "web",
                                deltaMs: p(t)
                            }), void 0 !== a && h.push({
                                name: "FunctionallyReady",
                                id: "web",
                                deltaMs: p(a)
                            }), o || h.push({
                                name: "SurfaceReady",
                                id: "web",
                                deltaMs: p(performance.now())
                            });
                            let f = h.filter(e => Number.isFinite(e.deltaMs)).map(e => e.subphases ? {
                                ...e,
                                subphases: e.subphases.filter(e => Number.isFinite(e.deltaMs))
                            } : e);
                            (l = J.window?.Roblox, l?.Hybrid?.Navigation)?.navigateToFeature({
                                feature: "TTIComplete",
                                eventName: e,
                                milestones: f
                            })
                        } catch {}
                    },
                    m = () => {
                        l && c && o && d({
                            partial: !1
                        })
                    },
                    p = () => {
                        d({
                            partial: !0
                        })
                    };
                if (J.document && ("complete" === J.document.readyState ? o = !0 : J.window && J.window.addEventListener("load", () => {
                        o = !0, m()
                    }, {
                        once: !0
                    }), J.document.addEventListener("visibilitychange", () => {
                        J.document?.visibilityState === "hidden" && p()
                    })), J.window && (J.window.addEventListener("pagehide", p), J.window.addEventListener("unload", p)), "u" > typeof PerformanceObserver) try {
                    (i = new PerformanceObserver(e => {
                        for (let t of e.getEntries())
                            if ("first-paint" === t.name ? r = t.startTime : "first-contentful-paint" === t.name && (n = t.startTime), void 0 !== r && void 0 !== n) {
                                i?.disconnect();
                                break
                            }
                    })).observe({
                        type: "paint",
                        buffered: !0
                    }), (s = new PerformanceObserver(e => {
                        let t = e.getEntries().at(-1);
                        t && (a = t.startTime, c = !0, m())
                    })).observe({
                        type: "largest-contentful-paint",
                        buffered: !0
                    })
                } catch {}
                return {
                    reportInteractive: () => {
                        l || (l = !0, t = performance.now(), m())
                    }
                }
            } catch {
                return {
                    reportInteractive: () => void 0
                }
            }
        }("BuyRobux_WebView_TTI"),
        rf = (0, eg.createFireTelemetryCounter)("BuyRobuxRedesign"),
        rg = (0, ef.createWithApiMetrics)(rf);

    function rx() {
        let e = (0, er.useTranslations)("CommonUI.Controls"),
            t = (0, er.useTranslations)("Feature.Premium"),
            {
                redirectError: {
                    isOpen: r,
                    closeModal: n
                }
            } = (0, L.useContext)(ty);
        return (0, U.jsx)(tx.Dialog, {
            open: r,
            onOpenChange: n,
            size: "Medium",
            isModal: !0,
            hasCloseAffordance: !0,
            closeLabel: e("Action.Close"),
            children: (0, U.jsx)(tx.DialogContent, {
                children: (0, U.jsxs)(tx.DialogBody, {
                    children: [(0, U.jsx)(tx.DialogTitle, {
                        children: t("Message.SomethingWentWrong")
                    }), (0, U.jsx)("div", {
                        className: "text-body-large",
                        children: t("Message.PleaseTryAgain")
                    })]
                })
            })
        })
    }
    let rb = () => {
            if (void 0 === J.navigator) return null;
            let e = /RobloxApp\/\d+\.(\d+)/.exec(J.navigator.userAgent);
            if (e?.[1] == null) return null;
            let t = Number.parseInt(e[1], 10);
            return Number.isNaN(t) ? null : t
        },
        ry = e => {
            if (!e.isAndroidApp) return !1;
            let t = rb();
            return null !== t && t >= 743
        },
        rv = e => {
            let t = J.window ? new URL(e, J.window.location.href).href : e;
            return `roblox://open-external?url=${encodeURIComponent(t)}`
        },
        rS = (e, t) => ry(t) ? {
            href: rv(e)
        } : {
            href: e,
            target: "_blank"
        },
        rP = e => {
            let {
                children: t,
                modals: r,
                quickPay: n,
                samsungPaymentMethods: a
            } = e, i = (0, er.useTranslations)("Feature.VerifiedParentalControls"), {
                markConsentAcknowledged: s,
                deviceMeta: l
            } = (0, L.useContext)(ec), o = (0, L.useCallback)(e => {
                eS("StripeReactCrash", null, e)
            }, []), c = (0, L.useCallback)(() => {
                ey("FirstTimePurchaseConsentConfirmed"), s(), r.firstTimePurchaseConsent.closeModal(), r.firstTimePurchaseConsent.continuePurchase?.()
            }, [s, r.firstTimePurchaseConsent]), u = (0, L.useCallback)(() => {
                ey("FirstTimePurchaseConsentDismiss"), r.firstTimePurchaseConsent.closeModal()
            }, [r.firstTimePurchaseConsent]);
            return (0, U.jsxs)(ty.Provider, {
                value: r,
                children: [t, (0, U.jsx)(rm, {
                    ...a
                }), (0, U.jsx)(tE, {}), (0, U.jsx)(tw, {}), (0, U.jsx)(tA, {}), n.stripe && (0, U.jsx)(tf, {
                    onError: o,
                    children: (0, U.jsxs)(tn.Elements, {
                        stripe: n.stripe,
                        children: [(0, U.jsx)(rc, {
                            ...n
                        }), (0, U.jsx)(ru, {})]
                    })
                }), (0, U.jsx)(rx, {}), (0, U.jsx)(tb, {
                    title: i("Label.AskParentFirst"),
                    description: i.html("Description.ParentalApprovalRequired", [{
                        opening: "learnLinkStart",
                        closing: "learnLinkEnd",
                        render: e => (0, U.jsx)("a", {
                            ...rS("https://en.help.roblox.com/hc/en-us/articles/4409558125460-Monthly-Spending-Limits-and-Notifications-FAQ", l),
                            className: "color-content-default [text-decoration:underline] [text-underline-position:from-font]",
                            rel: "noreferrer",
                            children: e
                        })
                    }]),
                    confirmation: i.html("Description.ParentalApprovalConfirmation", [{
                        opening: "termsLinkStart",
                        closing: "termsLinkEnd",
                        render: e => (0, U.jsx)("a", {
                            ...rS("https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use", l),
                            className: "color-content-emphasis [text-decoration:underline] [text-underline-position:from-font]",
                            rel: "noreferrer",
                            children: e
                        })
                    }]),
                    continueLabel: i("Action.Continue"),
                    cancelLabel: i("Action.Cancel"),
                    isOpen: r.firstTimePurchaseConsent.isOpen,
                    onConfirm: c,
                    onCancel: u,
                    publishMetric: rf,
                    triggerContext: eG(l)
                })]
            })
        },
        rC = (0, L.createContext)({
            selectedProduct: void 0,
            purchaseProduct: () => void 0,
            purchaseNonRedirectProduct: () => Promise.resolve()
        });
    (c = {}).AllAges = "AllAges", c.NinePlus = "NinePlus", c.ThirteenPlus = "ThirteenPlus", c.SeventeenPlus = "SeventeenPlus", c.EighteenPlus = "EighteenPlus", (u = {}).Discoverable = "Discoverable", u.NotDiscoverable = "NotDiscoverable", (d = {}).Light = "Light", d.Dark = "Dark", (m = {}).Default = "Default", m.Amethyst = "Amethyst", m.Emerald = "Emerald", m.Peridot = "Peridot", m.Rose = "Rose", m.Ruby = "Ruby", m.CosmicDust = "CosmicDust", m.PolarFreeze = "PolarFreeze", m.SuperCharge = "SuperCharge", m.ElectricLime = "ElectricLime", m.LavaGlow = "LavaGlow", m.StarBurst = "StarBurst", m.PixelPop = "PixelPop", m.NebulaDrift = "NebulaDrift", m.NitroFrost = "NitroFrost", m.CircuitRush = "CircuitRush", m.KineticEnergy = "KineticEnergy", m.InfernoBlast = "InfernoBlast", m.HyperPlum = "HyperPlum", m.QuantumPulse = "QuantumPulse", m.Classic = "Classic", m.Halloween2026 = "Halloween2026", (p = {}).AllUsers = "All", p.Friends = "Friends", p.Following = "Following", p.Followers = "Followers", p.NoOne = "NoOne", p.TrustedFriends = "TrustedFriends", (h = {}).AllUsers = "AllUsers", h.Friends = "Friends", h.FriendsAndFollowing = "FriendsAndFollowing", h.FriendsFollowingAndFollowers = "FriendsFollowingAndFollowers", h.NoOne = "NoOne", h.TrustedFriends = "TrustedFriends", (f = {}).Default = "NotificationsOnlyOnThresholdPassed", f.AllNotifications = "NotificationsEveryAmountSpent", f.NotificationsOff = "NotificationsOff", (g = {}).Yes = "Yes", g.No = "No", (x = {}).Enabled = "Enabled", x.Disabled = "Disabled", (b = {}).Allowed = "Allowed", b.Disallowed = "Disallowed", (y = {}).OlderAgeGroupsAllowed = "OlderAgeGroupsAllowed", y.SimilarAgeGroupsOnly = "SimilarAgeGroupsOnly", y.SimilarOrTrustedConnections = "SimilarOrTrustedConnections", y.NoOne = "NoOne", (v = {}).AllAgeGroups = "AllAgeGroups", v.SimilarAgeGroupsAndTrustedFriends = "SimilarAgeGroupsAndTrustedFriends", v.TrustedFriends = "TrustedFriends", v.NoOne = "NoOne", (S = {}).AllConnections = "AllConnections", S.TrustedConnectionsOnly = "TrustedConnectionsOnly", S.NoOne = "NoOne", (P = {}).None = "None", P.Low = "Low", P.Medium = "Medium", P.High = "High", (C = {}).G = "ACB_AGE_G", C.PG = "ACB_AGE_PG", C.M = "ACB_AGE_M", C.MA15 = "ACB_AGE_MA15", C.R18 = "ACB_AGE_R18", (E = {}).AlwaysAsk = "AlwaysAsk", E.TrustedFriendsAutoApproved = "TrustedFriendsAutoApproved", (w = {}).contentAgeRestriction = "contentAgeRestriction", w.phoneNumberDiscoverability = "phoneNumberDiscoverability", w.whoCanChatWithMeInApp = "whoCanChatWithMeInApp", w.whoCanJoinMeInExperiences = "whoCanJoinMeInExperiences", w.whoCanSeeMyInventory = "whoCanSeeMyInventory", w.whoCanTradeWithMe = "whoCanTradeWithMe", w.tradeQualityFilter = "tradeQualityFilter", w.themeType = "themeType", w.accountTheme = "accountTheme", w.canUploadContacts = "canUploadContacts", w.updateFriendsAboutMyActivity = "updateFriendsAboutMyActivity", w.privateServerPrivacy = "privateServerPrivacy", w.allowSellShareData = "allowSellShareData", w.allowPersonalizedAdvertising = "allowPersonalizedAdvertising", w.monthlySpendLimit = "monthlySpendLimit", w.spendNotifications = "spendNotifications", w.monthlySpendLimitCurrencyCode = "monthlySpendLimitCurrencyCode", w.monthlySpendLimitNotificationType = "monthlySpendLimitNotificationType", w.enablePurchases = "enablePurchases", w.whoCanGroupChatWithMeInApp = "whoCanGroupChatWithMeInApp", w.whoCanWhisperChatWithMeInExperiences = "whoCanWhisperChatWithMeInExperiences", w.whoCanChatWithMeInExperiences = "whoCanChatWithMeInExperiences", w.dailyScreenTimeLimit = "dailyScreenTimeLimit", w.whoCanSeeMySocialNetworks = "whoCanSeeMySocialNetworks", w.allowThirdPartyAppPermissions = "allowThirdPartyAppPermissions", w.allowEnablePushNotifications = "allowEnablePushNotifications", w.allowEnableEmailNotifications = "allowEnableEmailNotifications", w.allowEnableGroupNotifications = "allowEnableGroupNotifications", w.allowEnableExperienceNotifications = "allowEnableExperienceNotifications", w.allowVoiceDataUsage = "allowVoiceDataUsage", w.whoCanOneOnOnePartyWithMe = "whoCanOneOnOnePartyWithMe", w.whoCanGroupPartyWithMe = "whoCanGroupPartyWithMe", w.doNotDisturb = "doNotDisturb", w.doNotDisturbTimeWindow = "doNotDisturbTimeWindow", w.whoCanSeeMyOnlineStatus = "whoCanSeeMyOnlineStatus", w.allowSensitiveIssues = "allowSensitiveIssues", w.allowMarketingEmailNotifications = "allowMarketingEmailNotifications", w.AllowPromotionalOffersNotifications = "AllowPromotionalOffersNotifications", w.allowCrossAgeGroupStudioCollaboration = "allowCrossAgeGroupStudioCollaboration", w.allowFacialAgeEstimation = "allowFacialAgeEstimation", w.whoCanPartyWithMe = "whoCanPartyWithMe", w.whoCanUsePartyChatWithMe = "whoCanUsePartyChatWithMe", w.whoCanUsePartyVoiceWithMe = "whoCanUsePartyVoiceWithMe", w.aggregatedDesktopNotifications = "aggregatedDesktopNotifications", w.allowPresetChat = "allowPresetChat", w.privatePlaytest = "privatePlaytest", w.allowIdentityVerification = "allowIdentityVerification", w.robuxTransferLimits = "robuxTransferLimits", w.robuxTransferApprovalMode = "robuxTransferApprovalMode", w.iarcAgeRating = "iarcAgeRating", w.allowThirdPartyFriendAccess = "allowThirdPartyFriendAccess", w.whoCanSeeMyFriendsList = "whoCanSeeMyFriendsList", w.whoCanSeeMyPastUsernames = "whoCanSeeMyPastUsernames", w.whoCanSeeMyAboutSection = "whoCanSeeMyAboutSection", (N = {}).Value = "Value", N.Integer = "Integer";
    var rE = ((k = {}).None = "None", k.ParentalConsent = "ParentalConsent", k.SelfUpdateSetting = "SelfUpdateSetting", k.ContentAgeRestrictionVerification = "ContentAgeRestrictionVerification", k.FacialAgeEstimation = "FacialAgeEstimation", k.IdVerification = "IdVerification", k.VpcForFae = "VpcForFae", k.AgeCheckPending = "AgeCheckPending", k.ParentConsentInherited = "ParentConsentInherited", k.Inherited = "Inherited", k.ReadableButNotActionable = "ReadableButNotActionable", k),
        rw = e.i(266712),
        rN = ((T = {}).FraudPaymentAuthorizationAttempt = "FraudPaymentAuthorizationAttempt", T.FraudVirtualEconomyAbuse = "FraudVirtualEconomyAbuse", T.FraudAbuseOfAffiliateSystem = "FraudAbuseOfAffiliateSystem", T.FraudAttemptedUnauthorizedPaymentMethodUse = "FraudAttemptedUnauthorizedPaymentMethodUse", T.FraudRepeatedRefundRequests = "FraudRepeatedRefundRequests", T.FraudSuspiciousRefundRequests = "FraudSuspiciousRefundRequests", T.FraudUnauthorizedPurchase = "FraudUnauthorizedPurchase", T.FraudUseOfUnauthorizedOffPlatformTransactions = "FraudUseOfUnauthorizedOffPlatformTransactions", T.FraudUseOfUnauthorizedPaymentMethod = "FraudUseOfUnauthorizedPaymentMethod", T.FraudSuspiciousAccountPatterns = "FraudSuspiciousAccountPatterns", T.FraudChargeback = "FraudChargeback", T.None = "None", T.PurchaseNotEnabled = "PurchaseNotEnabled", T.SpendLimitExceeded = "SpendLimitExceeded", T),
        rk = ((j = {}).BuyRobuxPage = "BuyRobuxPage", j.BuyRobuxPagePreselectedProduct = "BuyRobuxPagePreselectedProduct", j),
        rT = ((A = {}).INVALID = "Invalid", A.AMUSEMENT_TAX = "AmusementTax", A.COMMUNICATIONS_TAX = "CommunicationsTax", A.GST = "Gst", A.HST = "Hst", A.IGST = "Igst", A.JCT = "Jct", A.LEASE_TAX = "LeaseTax", A.PST = "Pst", A.QST = "Qst", A.RST = "Rst", A.SALES_TAX = "SalesTax", A.VAT = "Vat", A.SUMMED = "Summed", A.SERVICE_TAX = "ServiceTax", A.UNKNOWN = "Unknown", A),
        rj = ((M = {}).INCORRECT_CVC = "incorrect_cvc", M.CARD_DECLINED = "card_declined", M.EXPIRED_CARD = "expired_card", M.INSUFFICIENT_FUNDS = "insufficient_funds", M.BALANCE_INSUFFICIENT = "balance_insufficient", M);
    let rA = async () => eT(eN.POST, ek.CHECK_USER_PURCHASE_SETTING, {
        url: `${ei.EnvironmentUrls.apiGatewayUrl}/payments-gateway/v1/check-user-purchase-settings`,
        withCredentials: !0
    }, {}), rM = async function(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
            r = new URLSearchParams({
                quickPayFlowType: e
            });
        return t.forEach(e => {
            r.append("productIds", e)
        }), eT(eN.GET, ek.GET_QUICK_PAY_METADATA, {
            url: `${ei.EnvironmentUrls.apiGatewayUrl}/payments-gateway/v1/get-quick-pay-metadata`,
            withCredentials: !0
        }, r)
    }, rR = async () => eT(eN.GET, ek.GET_PAYMENT_PROFILES, {
        url: `${ei.EnvironmentUrls.apiGatewayUrl}/payments-gateway/v1/payment-profiles`,
        withCredentials: !0
    }), rI = async (e, t, r, n, a) => eT(eN.POST, ek.PREPARE_PAYMENT, {
        url: `${ei.EnvironmentUrls.apiGatewayUrl}/payments-gateway/v1/prepare-payment`,
        withCredentials: !0
    }, {
        isQuickPay: !0,
        paymentFlowId: e,
        paymentMethod: t,
        paymentSessionId: r,
        productId: n,
        quickPaySelectedPaymentProfileId: a
    }, void 0, !0), rU = async e => eT(eN.POST, ek.PROCESS_PAYMENT, {
        url: `${ei.EnvironmentUrls.apiGatewayUrl}/payments-gateway/v1/process-payment`,
        withCredentials: !0
    }, e), r_ = async (e, t, r) => eT(eN.GET, ek.GET_PENDING_ENABLE_PURCHASE_CONSENT_REQUESTS, {
        url: `${ei.EnvironmentUrls.apiGatewayUrl}/parental-controls-api/v1/parental-controls/consents`,
        withCredentials: !0
    }, {
        childUserId: e,
        consentStatus: "Pending",
        consentType: t,
        cursor: r
    }), rF = async (e, t) => {
        let r, n = [];
        do {
            let a = await r_(e, t, r);
            a ? (n = [...n, ...a.consents], r = a.nextCursor) : r = void 0
        } while (r) return n.find(e => {
            let {
                consentData: t
            } = e;
            return t?.enablePurchases
        })
    }, rL = async () => eT(eN.GET, ek.GET_ENABLE_PURCHASES_SETTING, {
        url: `${ei.EnvironmentUrls.userSettingsApi}/v1/user-settings/settings-and-options?requestedUserSettings=enablePurchases`,
        withCredentials: !0
    });
    var rD = e.i(139047);
    let rB = async () => await (0, rD.callBehaviour)("texas-u18-vpc-optimization"), rO = async () => {
        try {
            return await (0, rD.callBehaviour)("app-policy")
        } catch {
            return {}
        }
    };
    var rG = e.i(868275),
        rz = e.i(154286);
    let rV = "/login-redirect",
        rW = "Payments.LoginRedirect.ExposureBased",
        rK = new class {
            async getExperimentBasedPathname(e) {
                if (!(0, ea.getCurrentUser)()?.id) return {
                    pathname: rV,
                    isInExperiment: !1
                };
                let t = e.appType.trim().replace(/\s+/g, "_"),
                    r = (() => {
                        if (void 0 === J.navigator) return null;
                        let e = /(?:iPhone OS|CPU OS) (\d+)[._]/.exec(J.navigator.userAgent);
                        if (e?.[1] == null) return null;
                        let t = Number.parseInt(e[1], 10);
                        return Number.isNaN(t) ? null : t
                    })();
                if (null !== r && r < 18) return ey("LoginRedirectUnsupportedIos", {
                    iosMajorVersion: r.toString(),
                    appType: t
                }), {
                    pathname: rV,
                    isInExperiment: !1
                };
                let n = (await rz.default.getAllValuesForLayer(rW)).variant;
                return "number" == typeof n ? (this.isExperimentAccessed = !0, ey("LoginRedirectExperimentEvaluated", {
                    variant: n.toString(),
                    appType: t
                }), {
                    pathname: 1 === n ? "/login-redirect/v2" : rV,
                    isInExperiment: !0
                }) : (ey("LoginRedirectExperimentEvaluated", {
                    variant: "unknown",
                    appType: t
                }), {
                    pathname: rV,
                    isInExperiment: !1
                })
            }
            logLayerExposure() {
                this.isExperimentAccessed ? (ey("LoginRedirectExperimentExposed"), rz.default.logLayerExposure(rW)) : ey("LoginRedirectLoggingExposureWithoutExperimentAccess")
            }
            constructor() {
                (0, rG._)(this, "isExperimentAccessed", !1)
            }
        },
        rH = [{
            maxMs: 12e4,
            label: "0-2"
        }, {
            maxMs: 24e4,
            label: "2-4"
        }, {
            maxMs: 36e4,
            label: "4-6"
        }, {
            maxMs: 48e4,
            label: "6-8"
        }, {
            maxMs: 6e5,
            label: "8-10"
        }];

    function rQ(e) {
        if (void 0 !== J.window) try {
            let {
                currentTarget: t
            } = e;
            if (!(t instanceof J.window.HTMLAnchorElement) || !t.getAttribute("href")) return;
            t.href = function(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : Date.now();
                if (void 0 === J.window) return e;
                let r = new URL(e, J.window.location.origin);
                return (r.searchParams.set("redirectStartTs", String(t)), /^https?:\/\//i.test(e)) ? r.toString() : `${r.pathname}${r.search}${r.hash}`
            }(t.href)
        } catch {
            ey("StampRedirectStartTsFailed")
        }
    }
    let r$ = null,
        rq = [{
            maxMs: 1e3,
            label: "0-1s"
        }, {
            maxMs: 2e3,
            label: "1-2s"
        }, {
            maxMs: 5e3,
            label: "2-5s"
        }, {
            maxMs: 1e4,
            label: "5-10s"
        }, {
            maxMs: 3e4,
            label: "10-30s"
        }],
        rY = [{
            max: 1,
            label: "1"
        }, {
            max: 2,
            label: "2"
        }, {
            max: 3,
            label: "3"
        }];

    function rX(e, t, r) {
        let n;
        if (!e.isIosApp && !e.isAndroidApp) return;
        let a = {
            appMinorVersion: null == (n = rb()) ? "unknown" : String(n),
            isSub: String(t),
            productId: r,
            triggerContext: eG(e, t)
        };
        ! function(e) {
            let {
                onUiShown: t,
                uiShownTimeoutMs: r = 3e4
            } = e, n = J.window, a = J.document;
            if (void 0 === n || void 0 === a) return;
            if (r$) return r$.recordTap();
            let i = Date.now(),
                s = {
                    tapCount: 1,
                    recordTap: () => void 0
                },
                l = () => {
                    r$ === s && (r$ = null, void 0 !== s.shownTimer && n.clearTimeout(s.shownTimer), void 0 !== s.onBlur && n.removeEventListener("blur", s.onBlur))
                };
            s.recordTap = () => {
                s.tapCount += 1
            }, r$ = s, s.onBlur = e => {
                if (e.target !== n || r$ !== s) return;
                let r = Date.now() - i,
                    {
                        tapCount: a
                    } = s;
                l(), t?.({
                    outcome: "shown",
                    elapsedMs: r,
                    tapCount: a
                })
            }, s.shownTimer = n.setTimeout(() => {
                if (r$ !== s) return;
                let {
                    tapCount: e
                } = s;
                l(), t?.({
                    outcome: "timeout",
                    tapCount: e
                })
            }, r), n.addEventListener("blur", s.onBlur)
        }({
            onUiShown: e => {
                var t, r;
                let n, i;
                ey("NativePurchaseUiShownTime", {
                    bucket: "shown" === e.outcome ? (t = e.elapsedMs, n = rq.find(e => {
                        let {
                            maxMs: r
                        } = e;
                        return t <= r
                    }), n?.label ?? "timeout") : e.outcome,
                    tapCount: (r = e.tapCount, i = rY.find(e => {
                        let {
                            max: t
                        } = e;
                        return r <= t
                    }), i?.label ?? "4+"),
                    appMinorVersion: a.appMinorVersion,
                    isSub: a.isSub
                }), D.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent({
                    triggerContext: a.triggerContext,
                    isMidPurchaseStep: !0,
                    viewName: D.paymentFlowAnalyticsService.ENUM_VIEW_NAME.NATIVE_PURCHASE_UI_SHOWN_TIME,
                    purchaseEventType: D.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN,
                    eventMetadata: {
                        appMinorVersion: a.appMinorVersion,
                        isSub: a.isSub,
                        productId: a.productId,
                        outcome: e.outcome,
                        tapCount: String(e.tapCount),
                        ..."shown" === e.outcome ? {
                            elapsedMs: String(e.elapsedMs)
                        } : {}
                    }
                })
            }
        })
    }

    function rJ(e) {
        let {
            children: t,
            quickPay: r,
            samsungPaymentMethods: n
        } = e;
        return (0, U.jsx)(rC.Provider, {
            value: function(e, t) {
                let {
                    isQuickPay: r,
                    paymentProfiles: n,
                    markRedirectHandled: a,
                    preparePaymentForQuickPay: i,
                    shouldRedirectToPurchase: s
                } = e, {
                    markRedirectHandled: l,
                    shouldRedirectToPurchase: o
                } = t, {
                    getPurchaseUrl: c,
                    upsellProduct: u,
                    redirect: d,
                    shouldShowFirstTimePurchaseConsent: m,
                    deviceMeta: p
                } = (0, L.useContext)(ec), h = eU(p), f = eI(p), {
                    quickPay: {
                        openModal: g
                    },
                    samsungPaymentMethods: {
                        openModal: x
                    },
                    redirectError: {
                        openModal: b
                    },
                    firstTimePurchaseConsent: {
                        openModal: y
                    }
                } = (0, L.useContext)(ty), {
                    trackPurchase: v,
                    trackRedirectClick: S
                } = (0, L.useContext)(eR), {
                    isStoppedByPurchaseWarning: P
                } = function() {
                    let {
                        isSubscriber: e,
                        deviceMeta: t
                    } = (0, L.useContext)(ec), r = eU(t), n = eI(t), {
                        purchaseWarning: {
                            openModal: a
                        }
                    } = (0, L.useContext)(ty), [i, s] = (0, L.useState)(!1);
                    return (0, L.useEffect)(() => {
                        let e = J.document?.getElementById("robux-container-base")?.dataset;
                        e && s("true" === e.isScaryModalEnabled)
                    }, []), {
                        isStoppedByPurchaseWarning: (0, L.useCallback)(async (t, s, l, o) => {
                            if (n && !i) return !1;
                            let c = await tS(!n && !e && !s, t.productId);
                            if (!c) return !1;
                            let {
                                action: u
                            } = c, d = u === tv.U13PaymentModal || u === tv.U13MonthlyThreshold1Modal || u === tv.U13MonthlyThreshold2Modal, m = u === tv.ParentalConsentWarningPaymentModal13To17 && r;
                            return (!!d || !!m) && (ey("PurchaseWarningModalShown", {
                                action: u
                            }), a(u, () => {
                                o(t, s, l)
                            }), !0)
                        }, [r, n, i, e, a])
                    }
                }(), {
                    isUserEligibleForPurchase: C
                } = function() {
                    let {
                        toastService: e
                    } = et(), {
                        purchaseDisabled: {
                            openModal: t
                        }
                    } = (0, L.useContext)(ty), {
                        trackEconomicRestrictionErrorShown: r
                    } = (0, L.useContext)(eR), {
                        deviceMeta: n
                    } = (0, L.useContext)(ec), a = eU(n), i = eI(n), s = (0, er.useTranslations)("Feature.Premium"), l = (0, er.useTranslations)("Feature.NotApproved"), o = (0, er.useTranslations)("IAPExperience.PurchaseError"), [c, u] = (0, L.useState)(), d = (0, L.useCallback)(async () => {
                        let e = (0, ea.getCurrentUser)()?.id;
                        return void 0 !== e && !!await rF(e, "UpdateUserSetting")
                    }, []), m = (0, L.useCallback)(async () => {
                        let e = await rL();
                        if (!e?.enablePurchases) return !1;
                        let {
                            currentValue: t,
                            options: r
                        } = e.enablePurchases;
                        return r?.some(e => {
                            let {
                                option: {
                                    optionValue: r
                                },
                                requirement: n
                            } = e;
                            return r !== t && n === rE.SelfUpdateSetting
                        }) ?? !1
                    }, []), p = (0, L.useCallback)(async () => {
                        let {
                            texasU18VPCOptimizationEnabled: e,
                            texasU18VPCOptimizationEnabledForEveryone: t
                        } = await rB();
                        u(!!(e && t))
                    }, []), h = (0, L.useCallback)(async () => {
                        try {
                            let e = await (0, rw.startAccessManagementUpsell)({
                                ampRecourseData: {
                                    enablePurchases: "Enabled"
                                },
                                featureName: "CanChangeSetting",
                                namespace: "account_management/SettingsChange",
                                isAsyncCall: !1,
                                usePrologue: !0
                            });
                            "boolean" == typeof e && ey("AccessManagementUpsellResult", {
                                result: String(e)
                            })
                        } catch (e) {
                            ev("AccessManagementUpsellException", null, e)
                        }
                    }, []), f = (0, L.useCallback)(async () => {
                        if (i || !a) return !0;
                        let n = await rA();
                        if (!n) return ey("PurchaseEligibilityFailedToFetch"), e.warning(s("Heading.GeneralError")), !1;
                        if (n.expirationTimeInMinutes) {
                            r();
                            let t = Math.ceil(n.expirationTimeInMinutes / 60),
                                a = function(e) {
                                    switch (e) {
                                        case rN.FraudPaymentAuthorizationAttempt:
                                            return "Label.Sublabel.FraudPaymentAbuse";
                                        case rN.FraudVirtualEconomyAbuse:
                                            return "Label.Sublabel.FraudVirtualEconomyAbuse";
                                        case rN.FraudAbuseOfAffiliateSystem:
                                            return "Label.Sublabel.FraudAbuseOfTheAffiliateSystem";
                                        case rN.FraudAttemptedUnauthorizedPaymentMethodUse:
                                            return "Label.Sublabel.FraudAttemptedUnauthorizedPaymentMethodUse";
                                        case rN.FraudRepeatedRefundRequests:
                                            return "Label.Sublabel.FraudRepeatedRefundRequests";
                                        case rN.FraudSuspiciousRefundRequests:
                                            return "Label.Sublabel.FraudSuspiciousRefundRequests";
                                        case rN.FraudUnauthorizedPurchase:
                                            return "Label.Sublabel.FraudUnauthorizedPurchase";
                                        case rN.FraudUseOfUnauthorizedOffPlatformTransactions:
                                            return "Label.Sublabel.FraudUseOfUnauthorizedOffPlatformTransactions";
                                        case rN.FraudUseOfUnauthorizedPaymentMethod:
                                            return "Label.Sublabel.FraudUseOfUnauthorizedPaymentMethod";
                                        case rN.FraudSuspiciousAccountPatterns:
                                            return "Label.Sublabel.FraudSuspiciousAccountPatterns";
                                        case rN.FraudChargeback:
                                            return "Label.AbuseType.Chargeback";
                                        case rN.None:
                                        case rN.PurchaseNotEnabled:
                                        case rN.SpendLimitExceeded:
                                            return "";
                                        default:
                                            return "Label.Sublabel.FraudPaymentAbuse"
                                    }
                                }(n.failureReason),
                                i = l.has(a) ? l(a) : "";
                            return e.warning(t > 24 ? o("Text.EconomicRestrictionsDays", {
                                day: Math.ceil(t / 24),
                                violation: i
                            }) : o("Text.EconomicRestrictionsHours", {
                                hour: t,
                                violation: i
                            })), ey("EconomicRestrictionModalShown"), !1
                        }
                        if (n.isEligible) return !0;
                        let u = await d(),
                            p = await m();
                        return !c || u || p || n.failureReason !== rN.PurchaseNotEnabled ? c && p && n.failureReason === rN.PurchaseNotEnabled ? (ey("PurchaseDisabledModalShownDisabledBySelf"), t(c, p)) : u || n.failureReason === rN.PurchaseNotEnabled ? (ey("PurchaseDisabledModalShownParentalConsent"), t(!!c, p)) : (ey("PurchaseEligibility", {
                            failureReason: n.failureReason
                        }), e.warning(s("Heading.GeneralError"))) : (ey("AccessManagementUpsellModalShown"), await h()), !1
                    }, [r, e, s, l, o, d, m, c, h, t, a, i]);
                    return (0, L.useEffect)(() => {
                        p()
                    }, [p]), {
                        isUserEligibleForPurchase: f
                    }
                }(), [E, w] = (0, L.useState)(), [N, k] = (0, L.useState)(), [T, j] = (0, L.useState)(!1), [A, M] = (0, L.useState)(!1), [R, I] = (0, L.useState)(""), [U, _] = (0, L.useState)(), F = (0, L.useCallback)((e, t, r) => {
                    if (void 0 !== J.window) {
                        if (f) {
                            ey("DesktopPurchaseRedirect"), J.window.location.href = r;
                            return
                        }
                        if (!h) return void ey("UnsupportedPlatform");
                        rX(p, t, e.productId), ey("MobilePurchaseRedirect"), J.window.location.href = r
                    }
                }, [p, h, f]), D = (0, L.useCallback)(async (e, t, n, a) => {
                    r && !n ? await i(e, t, n) : await P(e, n, a, F) ? ey("StoppedPurchaseWarning", {
                        action: "PurchaseFlow"
                    }) : F(e, n, a)
                }, [r, i, P, F]), B = (0, L.useCallback)(async (e, t, n, a) => {
                    ey("StartPurchase", {
                        isQuickPay: r ? "true" : "false"
                    }), v(e, t, a);
                    let i = c(e, t);
                    (I(i), await C()) ? await D(e, n, t, i): ey("IneligiblePurchase")
                }, [r, v, c, C, D]), O = (0, L.useCallback)(e => {
                    let {
                        product: t,
                        event: r,
                        isSubscription: n
                    } = e;
                    try {
                        var a;
                        let e;
                        ey("RedirectClickTime", {
                            bucket: (a = performance.now(), e = rH.find(e => {
                                let {
                                    maxMs: t
                                } = e;
                                return a <= t
                            }), e?.label ?? "10+")
                        })
                    } catch {}
                    if (!d) {
                        r.preventDefault(), ey("UnexpectedPurchaseRedirectCall");
                        return
                    }
                    if ("" === d.url) {
                        r.preventDefault(), ey("PurchaseRedirectUrlEmpty"), d.refreshAuthTicket(), b();
                        return
                    }
                    rQ(r), S({
                        isSubscriptionRedirect: n,
                        loginRedirectVersion: d.isInExperiment ? d.url.includes("/v2") ? "v2" : "v1" : void 0,
                        product: t
                    }), d.refreshAuthTicket()
                }, [d, S, b]), G = (0, L.useCallback)(async function(e) {
                    let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                        r = arguments.length > 2 && void 0 !== arguments[2] && arguments[2],
                        n = arguments.length > 3 ? arguments[3] : void 0;
                    (w(e), k(n), j(t), M(r), p.isSamsungGalaxyStoreApp) ? x(e, t, r): await B(e, t, r, n)
                }, [p.isSamsungGalaxyStoreApp, x, B]), z = (0, L.useCallback)(async function(e) {
                    let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                        r = arguments.length > 2 && void 0 !== arguments[2] && arguments[2],
                        n = arguments.length > 3 ? arguments[3] : void 0;
                    if (!1 === m) return void await G(e, t, r, n);
                    if (void 0 === m) {
                        ey("FirstTimePurchaseConsentNotFetchedInTime"), _({
                            product: e,
                            isSub: t,
                            isBonus: r,
                            sectionType: n
                        });
                        return
                    }
                    y(() => {
                        G(e, t, r, n)
                    })
                }, [m, y, G]), V = (0, L.useCallback)(e => {
                    let {
                        product: t,
                        isRedirect: r,
                        isSubscription: n,
                        isBonus: a,
                        sectionType: i
                    } = e;
                    if (r) {
                        try {
                            rK.logLayerExposure()
                        } catch (e) {
                            ev("LoginRedirectLayerExposureError", null, e)
                        }
                        O(e)
                    } else z(t, n, a, i)
                }, [O, z]);
                return (0, L.useEffect)(() => {
                    if (void 0 === m || !U) return;
                    _(void 0);
                    let {
                        product: e,
                        isSub: t,
                        isBonus: r,
                        sectionType: n
                    } = U;
                    m ? y(() => {
                        G(e, t, r, n)
                    }) : G(e, t, r, n)
                }, [m, U, y, G]), (0, L.useEffect)(() => {
                    s && E && (F(E, T, R), a())
                }, [s, E, F, T, R, a]), (0, L.useEffect)(() => {
                    o && E && (B(E, T, A, N), l())
                }, [o, E, B, T, A, N, l]), (0, L.useEffect)(() => {
                    r && p.isUniversalApp && u && n.length && (ey("QuickPayUpsell"), g(u), z(u))
                }, [p.isUniversalApp, r, u, n, g, z]), (0, L.useMemo)(() => ({
                    selectedProduct: E,
                    purchaseProduct: V,
                    purchaseNonRedirectProduct: z
                }), [E, V, z])
            }(r, n),
            children: t
        })
    }
    var rZ = e.i(562528),
        r0 = e.i(871623),
        r1 = ((R = {}).CardDeclined = "Message.QuickPay.CardDeclinedError", R.CardExpired = "Message.QuickPay.ExpiredCardError", R.GenericError = "Message.QuickPay.GenericError", R.InsufficientFunds = "Message.QuickPay.InsufficientFundsError", R);
    let r2 = (e, t) => {
        ev("QuickPay3DSFlow", {
            step: e
        }, t), ev("QuickPayPaymentFlow", {
            step: "3dsError"
        })
    };
    (I = {}).Default = "Message.QuickPay.Tax", I.GST = "Message.QuickPay.GST", I.HST = "Message.QuickPay.HST", I.IVA = "Message.QuickPay.IVA", I.JCT = "Message.QuickPay.JCT", I.Sales = "Message.QuickPay.SalesTax", I.Service = "Message.QuickPay.ServiceTax", I.TVA = "Messsage.QuickPay.TVA", I.VAT = "Message.QuickPay.VAT";
    var r3 = e.i(851460);

    function r5(e) {
        let {
            children: t
        } = e, r = function() {
            let {
                trackPurchaseDisabledShown: e,
                trackPurchaseWarningShown: t,
                trackQuickPayShown: r,
                trackQuickPay3DSShown: n,
                trackRobuxGiftShown: a,
                trackSamsungPaymentMethodsShown: i
            } = (0, L.useContext)(eR), [s, l] = (0, L.useState)(!1), [o, c] = (0, L.useState)(!1), [u, d] = (0, L.useState)(!1), [m, p] = (0, L.useState)(!1), [h, f] = (0, L.useState)(!1), [g, x] = (0, L.useState)(!1), [b, y] = (0, L.useState)(!1), [v, S] = (0, L.useState)(), [P, C] = (0, L.useState)(), [E, w] = (0, L.useState)(!1), [N, k] = (0, L.useState)(!1), [T, j] = (0, L.useState)(), [A, M] = (0, L.useState)(!1), [R, I] = (0, L.useState)(!1), [U, _] = (0, L.useState)(""), [F, D] = (0, L.useState)(!1), [B, O] = (0, L.useState)(), G = (0, L.useCallback)((t, r) => {
                e(t), I(t), M(r), c(!0)
            }, [e]), z = (0, L.useCallback)((e, r) => {
                t(e), S(e), C(() => r), l(!0)
            }, [t]), V = (0, L.useCallback)(e => {
                r(e), d(!0)
            }, [r]), W = (0, L.useCallback)(e => {
                n(), _(e), p(!0)
            }, [n]), K = (0, L.useCallback)(() => {
                a(), f(!0)
            }, [a]), H = (0, L.useCallback)((e, t, r) => {
                i(), j(e), k(t), w(r), y(!0)
            }, [i]), Q = (0, L.useCallback)(() => {
                c(!1), I(!1), M(!1)
            }, []), $ = (0, L.useCallback)(() => {
                l(!1), S(void 0), C(void 0)
            }, []), q = (0, L.useCallback)(() => {
                d(!1)
            }, []), Y = (0, L.useCallback)(() => {
                p(!1)
            }, []), X = (0, L.useCallback)(() => {
                f(!1)
            }, []), J = (0, L.useCallback)(() => {
                x(!1)
            }, []), Z = (0, L.useCallback)(() => {
                x(!0)
            }, []), ee = (0, L.useCallback)(() => {
                y(!1)
            }, []), et = (0, L.useCallback)(e => {
                ey("FirstTimePurchaseConsentShown"), O(() => e), D(!0)
            }, []), er = (0, L.useCallback)(() => {
                D(!1), O(void 0)
            }, []);
            return (0, L.useMemo)(() => ({
                purchaseDisabled: {
                    closeModal: Q,
                    hasUserDisabledPurchases: A,
                    isOpen: o,
                    openModal: G,
                    showVPCOptimization: R
                },
                purchaseWarning: {
                    action: v,
                    closeModal: $,
                    continuePurchase: P,
                    isOpen: s,
                    openModal: z
                },
                quickPay: {
                    closeModal: q,
                    isOpen: u,
                    openModal: V
                },
                quickPay3DS: {
                    closeModal: Y,
                    isOpen: m,
                    openModal: W,
                    url: U
                },
                robuxGifting: {
                    closeModal: X,
                    isOpen: h,
                    openModal: K
                },
                redirectError: {
                    closeModal: J,
                    isOpen: g,
                    openModal: Z
                },
                samsungPaymentMethods: {
                    closeModal: ee,
                    isBonus: E,
                    isOpen: b,
                    isSubscription: N,
                    openModal: H,
                    product: T
                },
                firstTimePurchaseConsent: {
                    closeModal: er,
                    continuePurchase: B,
                    isOpen: F,
                    openModal: et
                }
            }), [ee, E, b, N, H, T, Q, A, o, G, R, v, $, P, s, z, q, u, V, Y, m, W, U, X, h, K, J, g, Z, er, B, F, et])
        }(), n = function(e) {
            let {
                quickPay: {
                    openModal: t
                },
                quickPay3DS: {
                    closeModal: r,
                    openModal: n,
                    url: a
                }
            } = e, {
                getPurchaseUrl: i,
                paymentSession: s,
                productIds: l,
                purchaseFlowId: o,
                urlParams: c,
                deviceMeta: u
            } = (0, L.useContext)(ec), d = eU(u), {
                trackQuickPayClick: m,
                trackQuickPayPurchase: p
            } = (0, L.useContext)(eR), h = (0, er.useTranslations)("Feature.Premium"), [f, g] = (0, L.useState)(), [x, b] = (0, L.useState)(!1), [y, v] = (0, L.useState)(!1), [S, P] = (0, L.useState)(!1), [C, E] = (0, L.useState)(""), [w, N] = (0, L.useState)([]), [k, T] = (0, L.useState)(), [j, A] = (0, L.useState)(!1), [M, R] = (0, L.useState)(), [I, U] = (0, L.useState)(), [_, F] = (0, L.useState)(null), [D, B] = (0, L.useState)(!1), [O, G] = (0, L.useState)([]), [z, V] = (0, L.useState)(!1), W = (0, L.useRef)(0), K = (0, L.useCallback)(e => {
                let t;
                if (!e) return;
                let r = "unknown";
                (t = e.providerPayload, t?.paymentProfileType === "card") ? r = "card": t0(e.providerPayload) && (r = "paypal"), ey("QuickPayPaymentMethodSelected", {
                    method: r
                })
            }, []), H = (0, L.useCallback)(async () => {
                let e = rk.BuyRobuxPage;
                c.product_id && u.isUniversalApp && (e = rk.BuyRobuxPagePreselectedProduct), ey("QuickPayGetMetadataFlow", {
                    step: "start"
                });
                let t = await rM(e, l);
                if (!t) return void ev("QuickPayGetMetadataFlow", {
                    step: "noData"
                });
                let r = t.subscribedRobuxProductOffers ?? [];
                if (E(t.legalDisclosureTranslationKey), G(r), !t.isUserEligible) return void ey("QuickPayGetMetadataFlow", {
                    step: "ineligible"
                });
                let n = await rR();
                if (!n?.length) return void ev("QuickPayGetMetadataFlow", {
                    step: "noPaymentProfiles"
                });
                let a = n.filter(e => void 0 === e.isQuickPayEnabled || !0 === e.isQuickPayEnabled);
                a.length ? (ey("QuickPayGetMetadataFlow", {
                    step: "success"
                }), a.sort((e, t) => t.lastChargeTime - e.lastChargeTime), v(!0), N(a), R(a[0]), K(a[0])) : ev("QuickPayGetMetadataFlow", {
                    step: "noEligiblePaymentProfiles"
                })
            }, [u.isUniversalApp, c.product_id, K, l]), Q = (0, L.useCallback)(async () => {
                if (void 0 !== J.window) try {
                    let e = function() {
                            if (void 0 === J.window) throw Error("Stripe public API key selection requires a browser environment");
                            return J.window.location.href.includes("sitetest1") ? "pk_test_51LNM0XG5RADBkfjhYJlpADA2ArzWIh7gTWTodYNbpEzSiT55dul3VJhaBIVHL0CNyO0gECOz1vPnWArAkjwQ8NBO00Cdf2PxED" : J.window.location.href.includes("sitetest3") ? "pk_test_51LNOeQHDRNiW7vlLcKH8TGCpJ7zhaidLdSegE22GCuvQbVUX2xDiGJY6WYaldYyo6qgVxmy1SnSVpSdaqyjfqclU00NQwWntIe" : "pk_live_51LKpO9C8tJWGhK4HEHtny9Dg7xXiQJ1i349cq6KBDusbl8bRHO7QmCKKhX18LPjSirMNTvj3tesq6mhIQuPioeAd0062ZCgoF3"
                        }(),
                        t = await (0, rZ.loadStripe)(e);
                    F(t)
                } catch (e) {
                    ev("QuickPayStripeException", null, e)
                }
            }, []), $ = (0, L.useCallback)(async (e, r, n, a) => {
                if (void 0 === J.window) return;
                T(void 0), g(void 0), b(r), P(n), U(e), B(!0);
                let l = a ?? M;
                if (!l) {
                    ev("QuickPayPreparePaymentNoPaymentProfile"), B(!1);
                    return
                }
                if (!o || !s) return;
                W.current += 1;
                let c = W.current,
                    u = t0(l.providerPayload);
                ey("QuickPayPreparePaymentFlow", {
                    step: "start"
                });
                let {
                    data: d,
                    isError: m
                } = await rI(o, u ? "BraintreePaypal" : "StripeCard", s.id, e.productId, l.id).then(r => (B(!1), t(e), {
                    data: r,
                    isError: !1
                })).catch(t => {
                    B(!1), T(null), g(null), "object" == typeof t && null !== t && "parameters" in t && "object" == typeof t.parameters && null !== t.parameters && "kind" in t.parameters && "abandoned" === t.parameters.kind ? ev("QuickPayPreparePaymentFlow", {
                        step: "genericChallengeAbandoned"
                    }) : "RemovedPaymentProfile" === (e => {
                        if (!("object" == typeof e && null !== e && "config" in e)) return;
                        let t = e.response?.data;
                        if ("object" != typeof t || null === t || !("failureReason" in t)) return;
                        let {
                            failureReason: r
                        } = t;
                        return "string" == typeof r ? r : void 0
                    })(t) ? ev("QuickPayPreparePaymentFlow", {
                        step: "profileRemovedByFraud"
                    }) : ev("QuickPayPreparePaymentFlow", {
                        step: "error"
                    }, t);
                    let r = i(e, n);
                    return void 0 !== J.window && (J.window.location.href = r), {
                        data: void 0,
                        isError: !0
                    }
                });
                if (W.current === c) {
                    if (!d) {
                        m || ev("QuickPayPreparePaymentFlow", {
                            step: "noData"
                        });
                        return
                    }
                    if (d.providerPayload?.redirectionPath) {
                        T(null), g(null);
                        let t = i(e, n);
                        1 === w.length && t && (ey("QuickPayPreparePaymentFlow", {
                            step: "redirect"
                        }), J.window.location.href = t);
                        return
                    }
                    ey("QuickPayPreparePaymentFlow", {
                        step: "success"
                    }), T(d.providerPayload), g(d.checkoutSessionId)
                }
            }, [t, M, o, s, i, w.length]), q = (0, L.useCallback)(async e => {
                if (void 0 === J.window) return {
                    isLoading: !1
                };
                m();
                let t = t0(M?.providerPayload);
                if (!s) return {
                    isLoading: !1
                };
                ey("QuickPayPaymentFlow", {
                    step: "start"
                });
                let r = await rU({
                    checkoutSessionId: f ?? void 0,
                    paymentProviderType: t ? "BraintreePayPal" : "StripeCard",
                    paymentSessionId: s.id,
                    providerPayload: e,
                    quickPaySelectedPaymentProfileId: M?.id
                });
                if (!r) return ev("QuickPayPaymentFlow", {
                    step: "noData"
                }), I && await $(I, x, S), {
                    error: r1.GenericError,
                    isLoading: !1
                };
                let {
                    providerPayload: a
                } = r, {
                    StripeErrorCode: i
                } = a;
                if (i) {
                    let e;
                    switch (ev("QuickPayStripeProcessPaymentError", {
                            stripeErrorCode: i
                        }), ev("QuickPayPaymentFlow", {
                            step: "error"
                        }), i) {
                        case rj.CARD_DECLINED:
                            e = r1.CardDeclined;
                            break;
                        case rj.EXPIRED_CARD:
                            e = r1.CardExpired;
                            break;
                        case rj.INSUFFICIENT_FUNDS:
                        case rj.BALANCE_INSUFFICIENT:
                            e = r1.InsufficientFunds;
                            break;
                        case rj.INCORRECT_CVC:
                        default:
                            e = r1.GenericError
                    }
                    return {
                        error: e,
                        isLoading: !0
                    }
                }
                let l = a.redirectToUrl ?? a.RedirectionUrl;
                if (l)
                    if (t) return ey("QuickPayPaymentFlow", {
                        step: "redirect"
                    }), J.window.location.href = l, {
                        isLoading: !0
                    };
                    else return ey("QuickPayPaymentFlow", {
                        step: "3dsModalShown"
                    }), ey("QuickPay3DSFlow", {
                        step: "start"
                    }), n(l), {
                        isLoading: !1
                    };
                return ey("QuickPayPaymentFlow", {
                    step: "complete"
                }), p(I), J.window.location.href = `/upgrades/checkout/success?checkoutSessionId=${f}`, {
                    isLoading: !0
                }
            }, [m, $, I, x, S, p, f, n, M, s]), Y = (0, L.useMemo)(() => {
                let e;
                if (!k) return h("Message.QuickPay.Tax");
                let {
                    taxType: t,
                    taxAmountExclusive: r,
                    billingCountryCode: n,
                    taxPercentageDecimal: a
                } = k;
                if (0 === r.Units && 0 === r.Nanos || !t) return h("Message.QuickPay.Tax");
                let i = "";
                try {
                    let e = new r0.default,
                        t = parseFloat(a);
                    t > 0 && (i = e.n(t))
                } catch (e) {
                    ev("QuickPayPercentStringException", null, e)
                }
                switch (t) {
                    case rT.GST:
                        e = "Message.QuickPay.GST";
                        break;
                    case rT.VAT:
                        if (["AE", "CO", "ID", "IS", "TR", "UA", "VN", "ZA"].includes(n.toUpperCase())) {
                            e = "Message.QuickPay.Tax";
                            break
                        }
                        if (["SP", "IT"].includes(n.toUpperCase())) {
                            e = "Message.QuickPay.IVA";
                            break
                        }
                        if (["FR"].includes(n.toUpperCase())) {
                            e = "Messsage.QuickPay.TVA";
                            break
                        }
                        e = "Message.QuickPay.VAT";
                        break;
                    case rT.JCT:
                        e = "Message.QuickPay.JCT";
                        break;
                    case rT.HST:
                        e = "Message.QuickPay.HST";
                        break;
                    case rT.SALES_TAX:
                        e = "Message.QuickPay.SalesTax";
                        break;
                    case rT.SERVICE_TAX:
                        e = "Message.QuickPay.ServiceTax";
                        break;
                    case rT.SUMMED:
                    case rT.UNKNOWN:
                    case rT.INVALID:
                    case rT.AMUSEMENT_TAX:
                    case rT.COMMUNICATIONS_TAX:
                    case rT.IGST:
                    case rT.LEASE_TAX:
                    case rT.PST:
                    case rT.QST:
                    case rT.RST:
                    default:
                        e = "Message.QuickPay.Tax"
                }
                return h(e) + (i.length > 0 ? ` (${i}%)` : "")
            }, [k, h]), X = (0, L.useCallback)(async e => {
                if (void 0 !== J.window && "3DS-authentication-complete" === e.data.type && e.data.url && _) {
                    ey("QuickPay3DSFlow", {
                        step: "messageReceived"
                    });
                    try {
                        if (!a || !(e => {
                                try {
                                    let t = new URL(e);
                                    return "http:" === t.protocol || "https:" === t.protocol
                                } catch (e) {
                                    return (0, eh.captureException)(e), !1
                                }
                            })(a)) return r2("urlNotSet"), r1.GenericError;
                        let e = new URL(a).searchParams.get("payment_intent_client_secret");
                        if (!e) return r2("clientSecretNotSet"), r1.GenericError;
                        let {
                            error: t,
                            paymentIntent: r
                        } = await _.retrievePaymentIntent(e);
                        if (t) return r2("stripeError", t), r1.GenericError;
                        if ("succeeded" !== r.status) return r2("unsuccessful"), r1.GenericError;
                        ey("QuickPay3DSFlow", {
                            step: "success"
                        }), J.window.location.href = `/upgrades/checkout/success?checkoutSessionId=${f}`;
                        return
                    } catch (e) {
                        return r2("error", e), r1.GenericError
                    } finally {
                        r()
                    }
                }
            }, [_, a, r, f]), Z = (0, L.useCallback)(e => {
                R(e), K(e), I && $(I, x, S, e).catch(eh.captureException)
            }, [K, I, $, x, S]), ee = (0, L.useCallback)(() => {
                V(e => !e)
            }, []), et = (0, L.useCallback)(() => {
                A(!0)
            }, []), en = (0, L.useCallback)(() => {
                A(!1)
            }, []);
            return (0, L.useEffect)(() => {
                d || H().catch(eh.captureException)
            }, [H, d]), (0, L.useEffect)(() => {
                !d && y && Q().catch(eh.captureException)
            }, [d, y, Q]), (0, L.useMemo)(() => ({
                checkoutSessionId: f,
                isBonusItem: x,
                isQuickPay: y,
                legalDisclosureTranslationKey: C,
                markRedirectHandled: en,
                paymentProfiles: w,
                preparePaymentForQuickPay: $,
                preparePaymentProviderPayload: k,
                process3DSForQuickPay: X,
                processPaymentForQuickPay: q,
                redirectToPurchase: et,
                selectPaymentProfile: Z,
                selectedPaymentProfile: M,
                selectedProduct: I,
                shouldRedirectToPurchase: j,
                stripe: _,
                taxTitle: Y,
                isQuickPayLoading: D,
                subscribedRobuxProductOffers: O,
                isSubscribeAndSaveChecked: z,
                toggleSubscribeAndSave: ee
            }), [f, x, y, C, en, w, $, k, q, et, Z, M, I, j, _, O, z, ee, Y, X, D])
        }(r), a = function(e) {
            let {
                samsungPaymentMethods: {
                    closeModal: t,
                    product: r
                }
            } = e, {
                trackSamsungPaymentMethodsCancel: n,
                trackSamsungPaymentMethodsRedeemCreditClick: a,
                trackSamsungPaymentMethodsSamsungPayClick: i
            } = (0, L.useContext)(eR), [s, l] = (0, L.useState)(!1), o = (0, L.useCallback)(() => {
                i(), l(!0), t()
            }, [i, t]), c = (0, L.useCallback)(() => {
                void 0 !== J.window && (a(), J.window.location.href = `/upgrades/redeem?${r3.UrlSearchParams.new({ap:r?.productId??"",pm:"redeemCard"}).toString()}`, t())
            }, [a, r, t]);
            return {
                handleClose: (0, L.useCallback)(() => {
                    n(), t()
                }, [n, t]),
                handleRedeemCreditClick: c,
                handleSamsungPayClick: o,
                markRedirectHandled: (0, L.useCallback)(() => {
                    l(!1)
                }, []),
                shouldRedirectToPurchase: s
            }
        }(r);
        return (0, U.jsx)(rP, {
            modals: r,
            quickPay: n,
            samsungPaymentMethods: a,
            children: (0, U.jsx)(rJ, {
                quickPay: n,
                samsungPaymentMethods: a,
                children: t
            })
        })
    }
    let r4 = "/mobile-app-upgrades/buy";
    var r8 = e.i(264458);

    function r6(e) {
        let {
            ...t
        } = e;
        return (0, U.jsx)("div", {
            "data-slot": "card",
            className: "self-stretch flex flex-col items-start gap-medium",
            ...t
        })
    }

    function r9(e) {
        let {
            className: t,
            ...r
        } = e;
        return (0, U.jsx)("div", {
            className: (0, r8.default)("buy-robux-section-header self-stretch flex flex-row items-start text-heading-small medium:text-heading-large", t),
            ...r
        })
    }

    function r7(e) {
        let {
            ...t
        } = e;
        return (0, U.jsx)("div", {
            className: (0, r8.default)("self-stretch flex flex-row items-start content-emphasis text-body-medium", t.className),
            ...t
        })
    }

    function ne(e) {
        let {
            banner: t,
            children: r,
            isPrimary: n,
            ...a
        } = e;
        return t ? (0, U.jsxs)("div", {
            className: (0, r8.default)("radius-large flex flex-col items-start self-stretch", {
                "bg-surface-100": n,
                "stroke-standard": !n,
                "stroke-default": !n
            }),
            children: [t, (0, U.jsx)("div", {
                className: "flex flex-col items-start self-stretch gap-xlarge robux-section",
                ...a,
                children: r
            })]
        }) : (0, U.jsx)("div", {
            className: (0, r8.default)("radius-large flex flex-col items-start self-stretch gap-xlarge robux-section", {
                "bg-surface-100": n,
                "stroke-standard": !n,
                "stroke-default": !n
            }),
            ...a,
            children: r
        })
    }
    let nt = e => {
        let {
            icon: t,
            label: r
        } = e, n = t && tq(t);
        return (0, U.jsx)(tR.Badge, {
            variant: "Neutral",
            icon: n ? t : void 0,
            label: r,
            className: "text-overflow"
        })
    };

    function nr(e) {
        let {
            amount: t,
            nonPromotionalAmount: r,
            inlineBadgeIcon: n,
            inlineBadgeTranslationKey: a,
            bonusRobuxAmount: i,
            bonusRobuxTagIcon: s,
            bonusRobuxTagTranslationKey: l
        } = e, {
            productBadgeSlotCount: o,
            deviceMeta: c
        } = (0, L.useContext)(ec), u = eU(c), d = (0, er.useTranslations)("Feature.Premium"), {
            translateFullKey: m
        } = (0, er.useFullKeyTranslations)(), p = i ? (0, tM.formatNumber)(Number(i)) : void 0, h = d("Label.PlusAmountMoreLower", {
            amount: p ?? ""
        });
        return (0, U.jsxs)("div", {
            className: `robux-amount-item flex ${r?"flex-col":"flex-row"} num-badges-${o} justify-start gap-small wrap`,
            children: [(0, U.jsx)("div", {
                className: "flex gap-small items-center",
                children: (0, U.jsxs)("div", {
                    className: `flex flex-row justify-start items-center gap-small margin-right-xsmall ${s?"medium:width-[230px]":"large:width-[230px]"} wrap`,
                    "data-testid": "robux-amount-column",
                    children: [(0, U.jsxs)("div", {
                        className: "flex flex-row justify-start items-center gap-xsmall content-emphasis",
                        children: [(0, U.jsx)(B.Icon, {
                            name: "icon-filled-robux",
                            size: "Small",
                            className: "robux-amount-icon"
                        }), (0, U.jsx)("span", {
                            className: "text-title-large small:text-heading-small min-[400px]:text-heading-medium large:text-heading-large",
                            style: {
                                lineHeight: "var(--line-height-100)"
                            },
                            children: (0, tM.formatNumber)(Number(t))
                        })]
                    }), r && (0, U.jsxs)("div", {
                        className: "flex flex-row justify-start items-center gap-xsmall relative text-overflow content-muted",
                        children: [(0, U.jsx)("div", {
                            className: "robux-amount-strike-through"
                        }), (0, U.jsx)(B.Icon, {
                            name: "icon-filled-robux",
                            size: "XSmall",
                            className: "robux-amount-strike-icon"
                        }), (0, U.jsx)("span", {
                            className: "text-title-medium min-[400px]:text-title-large large:text-heading-small",
                            children: (0, tM.formatNumber)(Number(r))
                        })]
                    })]
                })
            }), (i ?? a) && (0, U.jsxs)("div", {
                className: "flex flex-row gap-small",
                children: [i && (s ? (0, U.jsx)(nt, {
                    icon: s,
                    label: l ? m(l, {
                        amount: p ?? ""
                    }, h) : h
                }) : (0, U.jsx)("div", {
                    className: (0, r8.default)(u ? "block" : "hidden", "large:block"),
                    "data-testid": "bonus-pill",
                    children: (0, U.jsx)(nt, {
                        label: h
                    })
                })), a && (0, U.jsx)(nt, {
                    icon: n,
                    label: m(a)
                })]
            })]
        })
    }
    let nn = e => {
        let {
            product: t,
            isExpanded: r,
            onProductClick: n,
            buttonProps: a
        } = e, {
            className: i,
            ...s
        } = a ?? {};
        return (0, U.jsxs)("div", {
            ...{
                [eW]: t.productId
            },
            className: (0, r8.default)("self-stretch flex flex-row justify-between items-center gap-small", {
                hidden: t.isCollapsible && !r
            }),
            children: [(0, U.jsx)(nr, {
                amount: t.robuxAmount,
                nonPromotionalAmount: t.nonPromotionalPlatformRobuxAmount,
                bonusRobuxAmount: t.bonusRobuxAmount,
                bonusRobuxTagIcon: t.bonusRobuxTagIcon,
                bonusRobuxTagTranslationKey: t.bonusRobuxTagTranslationKey,
                inlineBadgeIcon: t.inlineBadgeIcon,
                inlineBadgeTranslationKey: t.inlineBadgeTranslationKey
            }), (0, U.jsx)(O.Button, {
                variant: t.isCallToAction ? "Emphasis" : "Standard",
                size: "Small",
                className: (0, r8.default)(i, "text-label-medium shrink-0", "small:height-1000 small:padding-x-medium small:text-label-medium small:[&_.icon]:size-[var(--icon-size-medium)] small:[&>span]:gap-small"),
                onClick: e => {
                    n(t, e)
                },
                ...s,
                icon: "a" === s.as && s.href ? "icon-regular-arrow-up-right-from-square" : void 0,
                children: (0, U.jsx)(tH.PriceTag, {
                    tagClassName: "robux-price-tag",
                    currencyCode: t.price.amount.currencyCode,
                    amount: Number(tY(t.price.amount))
                })
            })]
        }, t.productId)
    };

    function na(e) {
        let {
            onProductClick: t,
            products: r,
            OverrideProductItemComponent: n
        } = e, a = (0, er.useTranslations)("Feature.Premium"), [i, s] = (0, L.useState)(!1), l = (0, L.useMemo)(() => r.some(e => e.isCollapsible), [r]), o = (0, L.useCallback)(() => {
            ey("ClickShowMore"), s(e => !e)
        }, []), c = n ?? nn;
        return (0, U.jsxs)(L.Fragment, {
            children: [r.map(e => (0, U.jsx)(c, {
                product: e,
                isExpanded: i,
                onProductClick: t,
                buttonProps: {
                    className: "min-width-[90px] small:min-width-[120px] medium:min-width-[200px]"
                }
            }, e.productId)), l && (0, U.jsx)(O.Button, {
                variant: "ActionUtility",
                size: "Small",
                className: "self-stretch flex flex-row height-500",
                onClick: o,
                children: (0, U.jsxs)("div", {
                    className: "flex flex-row justify-center items-center gap-small text-title-medium content-default padding-none",
                    children: [a(i ? "Action.ShowLess" : "Action.ShowMore"), i ? (0, U.jsx)(B.Icon, {
                        name: "icon-filled-chevron-large-up"
                    }) : (0, U.jsx)(B.Icon, {
                        name: "icon-filled-chevron-large-down"
                    })]
                })
            })]
        })
    }
    let ni = e => t => (0, U.jsx)(nn, {
        ...t,
        buttonProps: {
            className: t.buttonProps?.className,
            as: "a",
            href: `${e}&ap=${t.product.productId}`,
            rel: "noreferrer",
            role: "button",
            target: "_blank"
        }
    });

    function ns(e) {
        let {
            metadata: t
        } = e, r = (0, er.useTranslations)("Feature.PersonalizedBonus"), {
            bonusItemBannerImageUrl: n,
            bonusItemImageUrl: a,
            deviceMeta: i
        } = (0, L.useContext)(ec), s = eU(i), l = eI(i), o = (0, L.useCallback)(() => {
            void 0 !== J.window && (s || l ? J.window.location.href = "/support" : J.window.open("/support", "_blank"))
        }, [s, l]);
        return (0, U.jsxs)("div", {
            className: "color-mode-dark dark-theme self-stretch flex flex-row justify-start items-center gap-large clip relative buy-robux-page min-height-[112px]",
            style: {
                borderTopLeftRadius: "var(--radius-large)",
                borderTopRightRadius: "var(--radius-large)"
            },
            children: [(0, U.jsx)("div", {
                className: "absolute height-full width-full",
                style: {
                    flexGrow: 0,
                    flexShrink: 0,
                    backgroundColor: "var(--color-extended-gray-1200)"
                }
            }), n && (0, U.jsx)("div", {
                className: "absolute height-full width-full",
                style: {
                    backgroundImage: `url("${n}")`,
                    backgroundPositionY: "44%",
                    backgroundPositionX: "center",
                    backgroundSize: "852px",
                    opacity: .4
                },
                title: "bonus item banner image"
            }), (0, U.jsx)("div", {
                className: "absolute height-full width-full",
                style: {
                    backgroundImage: "linear-gradient(to right, rgba(18, 18, 21, 1), rgb(18, 18, 21, 0))"
                }
            }), (0, U.jsx)("div", {
                className: "width-2000 height-2000 margin-left-small",
                style: {
                    zIndex: 1
                },
                children: a && (0, U.jsx)("img", {
                    src: a,
                    alt: "bonus item",
                    className: "width-full height-full"
                })
            }), (0, U.jsx)("div", {
                style: {
                    margin: "auto auto auto 0",
                    padding: "21px 16px 21px 0",
                    zIndex: 1
                },
                children: (0, U.jsxs)("div", {
                    className: "flex flex-col gap-xsmall self-stretch items-start justify-center",
                    children: [(0, U.jsxs)("div", {
                        className: "flex flex-row items-center text-title-large content-[var(--dark-mode-content-emphasis)] text-wrap",
                        children: [(0, U.jsx)("div", {
                            children: t.experienceDisplayName
                        }), (0, U.jsx)(tT.Tooltip, {
                            position: "bottom-center",
                            title: r("Action.ReportItem"),
                            children: (0, U.jsx)(tT.TooltipTrigger, {
                                asChild: !0,
                                children: (0, U.jsx)(tN.IconButton, {
                                    variant: "Utility",
                                    size: "XSmall",
                                    icon: "icon-regular-circle-i",
                                    ariaLabel: "More information",
                                    onClick: o
                                })
                            })
                        })]
                    }), (0, U.jsx)("div", {
                        className: "text-body-large content-[var(--dark-mode-content-default)] text-wrap",
                        children: t.gamePassDisplayName
                    })]
                })
            })]
        })
    }
    let nl = new Intl.DateTimeFormat("en-US", {
            timeZone: "America/Los_Angeles",
            year: "numeric",
            month: "numeric",
            day: "numeric"
        }),
        no = Date.UTC(2026, 3, 1);

    function nc(e) {
        let {
            metadata: t
        } = e, {
            translateFullKey: r
        } = (0, er.useFullKeyTranslations)(), n = (0, er.useTranslations)("Feature.PersonalizedBonus"), a = (0, L.useMemo)(() => {
            let e, t;
            return e = nl.formatToParts(new Date), t = Number(e.find(e => "year" === e.type)?.value), Math.max(Math.ceil((no - Date.UTC(t, Number(e.find(e => "month" === e.type)?.value) - 1, Number(e.find(e => "day" === e.type)?.value))) / 864e5), 0)
        }, []);
        return (0, U.jsxs)("div", {
            className: "collectible-item-bonus-item-banner flex flex-row gap-large self-stretch items-center justify-start overflow-hidden padding-x-medium padding-bottom-medium padding-top-large medium:padding-x-xlarge buy-robux-page",
            style: {
                borderTopLeftRadius: "8px",
                borderTopRightRadius: "8px"
            },
            children: [(0, U.jsx)("img", {
                src: t.image2dUrl,
                alt: "bonus item",
                className: "min-width-2000 max-width-2000 min-height-2000 max-height-2000 medium:min-width-3000 medium:max-width-3000 medium:min-height-3000 medium:max-height-3000"
            }), (0, U.jsxs)("div", {
                className: "flex flex-col gap-small medium:gap-medium self-stretch items-start justify-center",
                children: [(0, U.jsx)("div", {
                    className: "text-title-large medium:text-heading-small content-emphasis text-wrap",
                    children: r(t.translationKey)
                }), (0, U.jsxs)("div", {
                    className: "flex flex-col small:flex-row gap-medium self-stretch items-start justify-start",
                    children: [(0, U.jsxs)("div", {
                        className: "flex flex-row gap-xsmall self-stretch items-center justify-start",
                        children: [(0, U.jsx)("div", {
                            className: "text-label-small medium:text-label-medium content-default",
                            children: n("Label.ByRoblox")
                        }), (0, U.jsx)(rl, {
                            size: 12
                        })]
                    }), (0, U.jsx)(tR.Badge, {
                        variant: "Contrast",
                        icon: "icon-regular-clock",
                        label: n(1 === a ? "Label.LastDay" : "Label.DaysLeft", {
                            daysLeft: a
                        }),
                        className: "text-overflow"
                    })]
                })]
            })]
        })
    }
    let nu = e => {
        let {
            personalizedBonus: t
        } = e, [r] = t.bonuses;
        if (!r) return null;
        let {
            collectibleItemMetadata: n,
            gamePassMetadata: a,
            virtualPurchasingProductType: i
        } = r, s = i.toString();
        return "PRODUCT_TYPE_COLLECTIBLE_ITEM" === s ? n ? (0, U.jsx)(nc, {
            metadata: n
        }) : (ey("BonusItemMissingMetadata", {
            productType: s
        }), null) : "PRODUCT_TYPE_GAME_PASS_PRODUCT" === s ? a ? (0, U.jsx)(ns, {
            metadata: a
        }) : (ey("BonusItemMissingMetadata", {
            productType: s
        }), null) : (ey("BonusItemUnsupportedType", {
            productType: s
        }), null)
    };

    function nd(e) {
        let {
            isPrimary: t,
            sectionBase: r,
            personalizedBonus: n
        } = e, {
            purchaseProduct: a
        } = (0, L.useContext)(rC), {
            redirect: i
        } = (0, L.useContext)(ec), {
            translateFullKey: s
        } = (0, er.useFullKeyTranslations)(), l = (0, L.useCallback)((e, t) => {
            a({
                product: e,
                event: t,
                isRedirect: !!(n.isRedirect && i?.url),
                isSubscription: !1,
                isBonus: !0,
                sectionType: "PersonalizedBonus"
            })
        }, [a, n.isRedirect, i]), o = (0, L.useMemo)(() => n.isRedirect && i?.url ? ni(i.url) : nn, [n.isRedirect, i?.url]);
        return (0, U.jsxs)(r6, {
            ...e$(r),
            children: [(0, U.jsxs)("div", {
                children: [(0, U.jsx)(r9, {
                    children: s(r.sectionHeaderTranslationKey)
                }), n.bodyTranslationKey && (0, U.jsx)(r7, {
                    children: s(n.bodyTranslationKey)
                })]
            }), (0, U.jsx)(ne, {
                isPrimary: t,
                banner: (0, U.jsx)(nu, {
                    personalizedBonus: n
                }),
                children: (0, U.jsx)(na, {
                    onProductClick: l,
                    products: r.products ?? [],
                    OverrideProductItemComponent: o
                })
            })]
        })
    }

    function nm(e) {
        let {
            daysLeft: t
        } = e, r = (0, er.useTranslations)("Feature.PersonalizedBonus");
        return (0, U.jsx)(tR.Badge, {
            variant: "Contrast",
            label: 1 === t ? r("Label.LastDay", {
                daysLeft: 1
            }) : r("Label.DaysLeft", {
                daysLeft: t
            }),
            className: "shrink-0"
        })
    }

    function np(e) {
        if (void 0 === e) return {
            success: !1,
            error: "ABSENT"
        };
        let t = Number(e);
        if ("string" == typeof e && "" === e.trim() || !Number.isFinite(t)) return ev("ResolveLimitedTimeBonusExpirationInvalidTimestamp"), {
            success: !1,
            error: "INVALID_TIMESTAMP"
        };
        let r = t - Date.now();
        return r <= 0 ? {
            success: !1,
            error: "EXPIRED"
        } : {
            success: !0,
            value: Math.ceil(r / 864e5)
        }
    }

    function nh(e) {
        let {
            isPrimary: t,
            sectionBase: r
        } = e, {
            purchaseNonRedirectProduct: n
        } = (0, L.useContext)(rC), {
            atLeastOneProductHasBonusAmount: a,
            deviceMeta: i
        } = (0, L.useContext)(ec), {
            translateFullKey: s
        } = (0, er.useFullKeyTranslations)(), l = r.productsList?.bodyTranslationKey, o = np(r.productsList?.promotionExpirationTimestampMs), c = l ? s.html(l, [{
            opening: "termsLinkStart",
            closing: "termsLinkEnd",
            render: e => (0, U.jsx)("a", {
                ...rS("/info/terms", i),
                className: "text-link",
                children: e
            })
        }]) : void 0, u = (0, L.useCallback)(e => {
            n(e, !1, !1, "ProductsList")
        }, [n]);
        return (0, U.jsxs)(r6, {
            ...e$(r),
            children: [(0, U.jsxs)("div", {
                className: "flex flex-col gap-xsmall self-stretch",
                children: [(0, U.jsxs)("div", {
                    className: "flex flex-row justify-between items-center self-stretch",
                    children: [(0, U.jsx)(r9, {
                        children: s(r.sectionHeaderTranslationKey)
                    }), o.success && (0, U.jsx)(nm, {
                        daysLeft: o.value
                    })]
                }), l && (0, U.jsx)(r7, {
                    className: (0, r8.default)({
                        "text-body-small": !a
                    }),
                    children: (0, U.jsx)("span", {
                        children: c ?? s(l)
                    })
                })]
            }), (0, U.jsx)(ne, {
                isPrimary: t,
                children: (0, U.jsx)(na, {
                    onProductClick: u,
                    products: r.products ?? []
                })
            })]
        })
    }

    function nf(e) {
        let {
            isPrimary: t,
            sectionBase: r
        } = e, {
            purchaseNonRedirectProduct: n
        } = (0, L.useContext)(rC), {
            translateFullKey: a
        } = (0, er.useFullKeyTranslations)(), i = (0, L.useCallback)(e => {
            n(e, !1, !1, "Recommended")
        }, [n]), [s] = r.products ?? [];
        return s ? (0, U.jsxs)(r6, {
            ...e$(r),
            children: [(0, U.jsx)(r9, {
                children: a(r.sectionHeaderTranslationKey)
            }), (0, U.jsx)(ne, {
                isPrimary: t,
                children: (0, U.jsxs)("div", {
                    className: "flex flex-col self-stretch medium:flex-row medium:justify-between medium:items-center",
                    children: [(0, U.jsx)("div", {
                        className: "flex flex-col self-stretch gap-small padding-bottom-large medium:padding-bottom-none medium:self-auto",
                        children: (0, U.jsx)(nr, {
                            amount: s.robuxAmount,
                            nonPromotionalAmount: s.nonPromotionalPlatformRobuxAmount
                        })
                    }), (0, U.jsx)(O.Button, {
                        onClick: () => {
                            i(s)
                        },
                        ...{
                            [eW]: s.productId
                        },
                        className: "text-label-medium shrink-0 width-full medium:width-[200px]",
                        variant: s.isCallToAction ? "Emphasis" : "Standard",
                        size: "Medium",
                        children: (0, U.jsx)(tH.PriceTag, {
                            tagClassName: "robux-price-tag",
                            amount: Number(tY(s.price.amount)),
                            currencyCode: s.price.amount.currencyCode
                        })
                    })]
                })
            })]
        }) : null
    }

    function ng(e) {
        let {
            isPrimary: t,
            title: r,
            body: n,
            buttonText: a,
            buttonClickHandler: i
        } = e;
        return (0, U.jsxs)("div", {
            className: "flex flex-col self-stretch medium:flex-row medium:justify-between medium:items-center",
            children: [(0, U.jsxs)("div", {
                className: "flex flex-col self-stretch gap-small padding-bottom-large medium:padding-bottom-none",
                children: [(0, U.jsx)("div", {
                    className: "self-stretch text-heading-small content-emphasis",
                    children: r
                }), (0, U.jsx)("div", {
                    className: "self-stretch text-body-medium content-emphasis",
                    children: n
                })]
            }), (0, U.jsx)(O.Button, {
                onClick: i,
                className: "text-label-medium width-full medium:width-[200px]",
                size: "Medium",
                variant: t ? "Emphasis" : "Standard",
                children: a
            })]
        })
    }

    function nx(e) {
        let {
            isPrimary: t,
            sectionBase: r,
            giftCard: n
        } = e, {
            trackGiftCardClick: a
        } = (0, L.useContext)(eR), {
            deviceMeta: i
        } = (0, L.useContext)(ec), {
            translateFullKey: s
        } = (0, er.useFullKeyTranslations)(), l = (0, er.useTranslations)("Feature.Premium"), o = (0, L.useCallback)(() => {
            a(), J.window?.location.assign(ry(i) ? rv(n.redirectUrl) : n.redirectUrl)
        }, [i, a, n.redirectUrl]);
        return (0, U.jsxs)(r6, {
            ...e$(r),
            children: [(0, U.jsx)(r9, {
                children: s(r.sectionHeaderTranslationKey)
            }), (0, U.jsx)(ne, {
                isPrimary: t,
                children: (0, U.jsx)(ng, {
                    title: s(n.titleTranslationKey, void 0, l("Description.GiftCard")),
                    body: s(n.bodyTranslationKey),
                    buttonText: s(n.buttonTextTranslationKey),
                    buttonClickHandler: o
                })
            })]
        })
    }

    function nb(e) {
        let {
            isPrimary: t,
            robuxGift: r,
            sectionBase: n
        } = e, {
            robuxGifting: {
                openModal: a
            }
        } = (0, L.useContext)(ty), {
            trackRobuxGiftClick: i
        } = (0, L.useContext)(eR), {
            translateFullKey: s
        } = (0, er.useFullKeyTranslations)(), l = (0, L.useCallback)(() => {
            i(), a()
        }, [i, a]);
        return (0, U.jsxs)(r6, {
            ...e$(n),
            children: [(0, U.jsx)(r9, {
                children: s(n.sectionHeaderTranslationKey)
            }), (0, U.jsx)(ne, {
                isPrimary: t,
                children: (0, U.jsx)(ng, {
                    title: s(r.titleTranslationKey),
                    body: s(r.bodyTranslationKey),
                    buttonText: s(r.buttonTextTranslationKey),
                    buttonClickHandler: l
                })
            })]
        })
    }
    var ny = e.i(309380),
        nv = e.i(431545),
        nS = e.i(660053),
        nP = e.i(349030),
        nC = e.i(380688),
        nE = e.i(190187),
        nw = e.i(176489),
        nN = e.i(231756),
        nk = e.i(306627);
    let nT = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600"
        },
        nj = {
            XSmall: "size-150",
            Small: "size-200",
            Medium: "size-250"
        },
        nA = {
            XSmall: "size-1200",
            Small: "size-1400",
            Medium: "size-1600"
        },
        nM = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium"
        },
        nR = {
            XSmall: void 0,
            Small: "padding-top-xxsmall",
            Medium: "padding-y-xxsmall"
        },
        nI = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium"
        },
        nU = {
            XSmall: "padding-medium",
            Small: "padding-large",
            Medium: "padding-xlarge"
        },
        n_ = {
            XSmall: "Small",
            Small: "Medium",
            Medium: "Large"
        },
        nF = (0, L.forwardRef)((e, t) => {
            let {
                layout: r,
                size: n,
                type: a,
                isDisabled: i,
                label: s,
                description: l,
                media: o,
                icon: c,
                metadata: u,
                isSelected: d,
                onSelect: m,
                hideSelectedIndicator: p = !1
            } = e, h = (0, L.useMemo)(() => s && L.default.createElement("div", {
                className: (0, W.default)(nM[n], nR[n], "content-emphasis text-align-x-start", "clip [display:-webkit-box] [-webkit-line-clamp:3] [-webkit-box-orient:vertical]")
            }, s), [s, n]), f = (0, L.useMemo)(() => u && L.default.createElement("div", {
                className: (0, W.default)("text-caption-small content-default text-align-x-start", "text-truncate-split text-no-wrap width-full")
            }, u), [u]), g = (0, L.useMemo)(() => l && L.default.createElement("div", {
                className: (0, W.default)(nI[n], "content-default text-align-x-start")
            }, l), [l, n]), x = (0, L.useMemo)(() => c && L.default.createElement(nk.Icon, {
                name: c,
                size: n_[n]
            }), [c, n]), b = (0, L.useMemo)(() => {
                switch (a) {
                    case "Checkmark":
                        return d && L.default.createElement(nk.Icon, {
                            name: "icon-filled-check",
                            size: n_[n]
                        });
                    case "Checkbox":
                        return L.default.createElement("div", {
                            className: (0, W.default)(nT[n], "flex items-center justify-center radius-small padding-none content-default", d ? "stroke-none" : "stroke-standard stroke-emphasis", d ? "bg-system-contrast" : "bg-none")
                        }, d && L.default.createElement("div", {
                            className: (0, W.default)(nT[n], "content-inverse-emphasis icon icon-filled-check")
                        }));
                    case "Radio":
                        return L.default.createElement("div", {
                            className: (0, W.default)(nT[n], "radius-circle flex items-center justify-center stroke-emphasis stroke-standard", d ? "bg-system-contrast" : "bg-none")
                        }, d && L.default.createElement("div", {
                            className: (0, W.default)("radius-circle bg-inverse-action-sub-emphasis", nj[n])
                        }));
                    default:
                        return console.error(`Invalid OptionSelector type ${a}`), null
                }
            }, [a, n, d]), y = (0, L.useMemo)(() => o && L.default.createElement("div", {
                className: (0, W.default)(nA[n], "flex items-center justify-center clip shrink-0")
            }, o), [o, n]), v = (0, L.useMemo)(() => {
                let e = !p && L.default.createElement("div", {
                    className: nT[n]
                }, b);
                switch (r) {
                    case "Horizontal":
                        return L.default.createElement("div", {
                            className: "flex gap-large"
                        }, y, L.default.createElement("div", {
                            className: "flex flex-col gap-xsmall fill clip"
                        }, L.default.createElement("div", {
                            className: "flex gap-small items-start"
                        }, L.default.createElement("div", {
                            className: "flex flex-col items-start fill clip"
                        }, L.default.createElement("div", {
                            className: "flex gap-small items-center width-full"
                        }, x, h), f), e), g));
                    case "Vertical":
                        return L.default.createElement("div", {
                            className: "flex flex-col gap-xsmall"
                        }, L.default.createElement("div", {
                            className: "flex gap-small"
                        }, L.default.createElement("div", {
                            className: "flex flex-col gap-medium fill min-width-0"
                        }, y, L.default.createElement("div", {
                            className: "flex flex-col gap-xsmall"
                        }, x, h, f)), e), g);
                    default:
                        return console.error(`Invalid OptionSelector layout ${r}`), null
                }
            }, [r, y, x, h, g, b, n, f, p]);
            return L.default.createElement("button", {
                type: "button",
                className: (0, W.default)("bg-none width-full radius-medium stroke-standard", nw.interactable, d ? "stroke-system-contrast" : "stroke-emphasis", nU[n], i ? nN.disabledOpacity : "cursor-pointer"),
                disabled: i,
                ref: t,
                onClick: () => m()
            }, L.default.createElement(nw.StateLayer, null), v)
        });
    nF.displayName = "OptionSelector";
    var nL = e.i(782009);

    function nD(e) {
        let {
            price: t,
            strikethroughPrice: r
        } = e;
        if (!r || r.currencyCode !== t.currencyCode || r.amount <= t.amount) return;
        let n = Math.round((1 - t.amount / r.amount) * 100);
        return n > 0 ? n : void 0
    }
    let nB = e => {
        let t, {
                option: r,
                isSelected: n,
                isBestValue: a,
                onSelect: i
            } = e,
            {
                translate: s
            } = (0, nv.useTranslation)(),
            l = (0, nL.useFormatter)(),
            o = e => {
                let {
                    amount: t,
                    currencyCode: r
                } = e;
                return l.number(t, {
                    style: "currency",
                    currency: r
                })
            },
            c = nD(r),
            u = o({
                amount: r.price.amount / r.months,
                currencyCode: r.price.currencyCode
            });
        r.months > 1 && (t = void 0 === c ? s("Action.PricePerMonth", {
            price: u,
            periodType: ny.PeriodType.Month
        }) : s("Label.BillingPeriodSavings", {
            pricePerMonth: u,
            savingsPercent: l.number(c / 100, {
                style: "percent"
            })
        }));
        let d = (0, U.jsxs)("div", {
            className: "width-full min-height-1000 gap-small flex flex-row items-center justify-between",
            children: [(0, U.jsxs)("div", {
                className: "min-width-0 flex flex-col items-start",
                children: [(0, U.jsxs)("div", {
                    className: "gap-xsmall flex flex-row items-center",
                    children: [(0, U.jsx)("span", {
                        className: "text-title-medium content-emphasis",
                        children: ((e, t) => {
                            switch (e) {
                                case 1:
                                    return t("Label.BillingPeriodMonthly");
                                case 3:
                                    return t("Label.BillingPeriodThreeMonths");
                                case 6:
                                    return t("Label.BillingPeriodSixMonths");
                                case 12:
                                    return t("Label.BillingPeriodYearly");
                                default:
                                    return t((0, nP.getSubscriptionPeriodTranslationKey)(ny.PeriodType.Month, e), {
                                        periodCount: e
                                    })
                            }
                        })(r.months, s)
                    }), a && (0, U.jsx)(nE.Badge, {
                        label: s("Label.BestValue"),
                        size: "XSmall",
                        variant: "Neutral"
                    })]
                }), t && (0, U.jsx)("span", {
                    className: "text-body-medium content-default",
                    children: t
                })]
            }), (0, U.jsxs)("div", {
                className: "gap-small flex shrink-0 flex-row items-center",
                children: [void 0 !== c && r.strikethroughPrice && (0, U.jsx)("span", {
                    className: "text-label-medium line-through [color:var(--color-extended-gray-600)]",
                    children: o(r.strikethroughPrice)
                }), (0, U.jsx)("span", {
                    className: "text-label-medium content-emphasis",
                    children: o(r.price)
                })]
            })]
        });
        return (0, U.jsx)("div", {
            "data-testid": `billing-period-option-${r.productId}`,
            children: (0, U.jsx)(nF, {
                hideSelectedIndicator: !0,
                isSelected: n,
                label: void 0,
                layout: "Horizontal",
                metadata: d,
                size: "XSmall",
                type: "Checkmark",
                onSelect: i
            })
        })
    };
    var nO = e.i(559659);
    let nG = {
            featureName: "SubscriptionsCommon",
            team: "Economy > Payments & Fraud > Subscriptions",
            features: {
                billingPeriodSheet: {
                    counters: [{
                        name: "BillingPeriodSheetShown",
                        dimensions: ["viewName", "termMonths"]
                    }, {
                        name: "BillingPeriodOptionSelected",
                        dimensions: ["viewName", "months"]
                    }, {
                        name: "BillingPeriodSubscribeClick",
                        dimensions: ["viewName", "months", "isFreeTrial"]
                    }, {
                        name: "BillingPeriodSheetDismissed",
                        dimensions: ["viewName", "months"]
                    }]
                },
                plusReferrals: {
                    apiCalls: ["SenderReferralEligibility", "PendingPlusReferrals", "PlusSubscriberAccess"]
                }
            }
        },
        nz = (0, eg.createFireTelemetryCounter)(nG.featureName),
        nV = (0, nO.createFireTelemetryHistogram)(nG.featureName, {}),
        {
            trackCounter: nW
        } = (0, em.createTrackers)(nG, {
            publish: nz
        }),
        {
            ENUM_PURCHASE_EVENT_TYPE: nK,
            ENUM_VIEW_MESSAGE: nH
        } = D.paymentFlowAnalyticsService,
        nQ = (e, t, r, n) => {
            let {
                analyticsContext: a,
                paymentSessionId: i
            } = e;
            D.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent({
                triggerContext: a.triggeringContext,
                isMidPurchaseStep: !1,
                viewName: a.viewName,
                purchaseEventType: t,
                viewMessage: r,
                eventMetadata: i ? {
                    ...n,
                    paymentSessionId: i
                } : n
            })
        },
        n$ = e => ({
            productId: e.productId,
            months: String(e.months)
        });
    var nq = e.i(910866),
        nY = e.i(482131);
    let nX = [{
            opening: "linkStart",
            closing: "linkEnd",
            render: e => (0, U.jsx)("a", {
                className: "underline",
                href: nq.SUBSCRIPTION_TERMS_URL,
                rel: "noopener noreferrer",
                target: "_blank",
                children: e
            })
        }],
        nJ = e => {
            let {
                isOpen: t,
                onOpenChange: r,
                options: n,
                analyticsContext: a,
                deviceMeta: i,
                paymentSessionId: s,
                referrerId: l,
                isDisabled: o = !1,
                onOptionSelect: c,
                onSubscribeClick: u,
                onMobilePurchaseInitiated: d
            } = e, {
                translate: m
            } = (0, nv.useTranslation)(), [p, h] = (0, L.useState)(), f = (0, L.useRef)(!1), g = (0, L.useMemo)(() => {
                let e;
                return n.forEach(t => {
                    let r = nD(t);
                    void 0 !== r && (!e || r > e.savings || r === e.savings && t.months > e.months) && (e = {
                        productId: t.productId,
                        savings: r,
                        months: t.months
                    })
                }), e?.productId
            }, [n]);
            (0, L.useEffect)(() => {
                if (!t) {
                    f.current = !1;
                    return
                }
                if (!f.current && 0 !== n.length && s) {
                    var e;
                    let t;
                    f.current = !0, e = {
                        analyticsContext: a,
                        paymentSessionId: s
                    }, t = n.map(e => e.months).sort((e, t) => e - t).join(","), nQ(e, nK.VIEW_SHOWN, nH.ROBLOX_PLUS_BILLING_PERIOD_SHEET_OPENED, {
                        termMonths: t
                    }), nW("BillingPeriodSheetShown", {
                        viewName: e.analyticsContext.viewName,
                        termMonths: t
                    })
                }
            }, [a, t, n, s]);
            let x = n.find(e => e.productId === p) ?? n[0];
            if (!x) return null;
            let b = {
                    analyticsContext: a,
                    paymentSessionId: s
                },
                {
                    freeTrialEndDate: y,
                    freeTrialDuration: v,
                    freeTrialPeriodType: S
                } = x,
                P = void 0 !== v && void 0 !== S ? (0, nP.getFreeTrialDisplay)({
                    freeTrialOffer: {
                        duration: v,
                        periodType: S
                    }
                }, ny.PeriodType.Month) : null,
                C = void 0 === y ? (0, nC.translateHtml)(m, "Description.SubscriptionLegalBillingCycle", nX) : P ? (0, nC.translateHtml)(m, "Description.SubscriptionFreeTrialLegalV2", nX, {
                    date: y.toLocaleDateString(void 0, {
                        year: "numeric",
                        month: "long",
                        day: "numeric"
                    }),
                    trialDuration: String(P.trialDuration),
                    trialPeriodLabel: m(P.trialPeriodKey),
                    billingPeriodLabel: m(P.billingPeriodKey)
                }) : (0, nC.translateHtml)(m, "Description.SubscriptionFreeTrialLegal", nX, {
                    date: y.toLocaleDateString(void 0, {
                        year: "numeric",
                        month: "long",
                        day: "numeric"
                    })
                });
            return (0, U.jsx)(nS.SheetRoot, {
                open: t,
                onOpenChange: e => {
                    e || (nQ(b, nK.USER_INPUT, nH.ROBLOX_PLUS_BILLING_PERIOD_SHEET_DISMISSED, n$(x)), nW("BillingPeriodSheetDismissed", {
                        viewName: b.analyticsContext.viewName,
                        months: String(x.months)
                    })), r(e)
                },
                children: (0, U.jsxs)(nS.SheetContent, {
                    centerSheetSize: "Medium",
                    closeLabel: m("Action.Close"),
                    largeScreenVariant: "center",
                    children: [(0, U.jsx)(nS.SheetTitle, {
                        children: m("Heading.ChooseBillingPeriod")
                    }), (0, U.jsxs)(nS.SheetBody, {
                        className: "gap-y-xxlarge padding-bottom-medium flex flex-col",
                        "data-testid": "billing-period-sheet-body",
                        children: [(0, U.jsx)("p", {
                            className: "text-body-medium content-default",
                            children: m("Description.ChooseBillingPeriod")
                        }), (0, U.jsx)("div", {
                            className: "gap-y-medium flex flex-col",
                            children: n.map(e => (0, U.jsx)(nB, {
                                isBestValue: e.productId === g,
                                isSelected: e.productId === x.productId,
                                option: e,
                                onSelect: () => {
                                    e.productId !== x.productId && (nQ(b, nK.USER_INPUT, nH.ROBLOX_PLUS_BILLING_PERIOD_SELECTED, n$(e)), nW("BillingPeriodOptionSelected", {
                                        viewName: b.analyticsContext.viewName,
                                        months: String(e.months)
                                    })), h(e.productId), c?.(e)
                                }
                            }, e.productId))
                        })]
                    }), (0, U.jsx)(nS.SheetActions, {
                        children: (0, U.jsxs)("div", {
                            className: "gap-y-medium flex flex-col",
                            children: [(0, U.jsx)(nY.default, {
                                className: "width-full",
                                deviceMeta: i,
                                isDisabled: o,
                                paymentSessionId: s,
                                productId: x.productId,
                                productType: x.productType,
                                referrerId: l,
                                size: "Medium",
                                trackSubscriptionButtonClick: () => {
                                    let e;
                                    e = void 0 !== x.freeTrialEndDate, nQ(b, nK.USER_INPUT, e ? nH.ROBLOX_PLUS_FREE_TRIAL : nH.ROBLOX_PLUS_SUBSCRIBE, {
                                        ...n$(x),
                                        isFreeTrial: String(e)
                                    }), nW("BillingPeriodSubscribeClick", {
                                        viewName: b.analyticsContext.viewName,
                                        months: String(x.months),
                                        isFreeTrial: String(e)
                                    }), u?.(x)
                                },
                                onMobilePurchaseInitiated: d,
                                children: m(void 0 === y ? "Action.Subscribe" : "Action.TryItForFree")
                            }), (0, U.jsx)("p", {
                                className: "text-body-small content-default text-align-x-left",
                                "data-testid": "billing-period-legal-footer",
                                children: C
                            })]
                        })
                    })]
                })
            })
        },
        nZ = () => {
            let {
                translate: e
            } = (0, nv.useTranslation)(), t = e("Label.Learnmore");
            return (0, U.jsxs)(nS.SheetContent, {
                centerSheetSize: "Large",
                closeLabel: e("Action.Close"),
                largeScreenVariant: "center",
                mobilePortraitClassName: "![height:97vh] ![max-height:97vh]",
                children: [(0, U.jsx)(nS.SheetTitle, {
                    visuallyHideTitleText: !0,
                    children: t
                }), (0, U.jsx)(nS.SheetBody, {
                    hasPaddingX: !1,
                    children: (0, U.jsx)("iframe", {
                        className: "width-full medium:[height:88vh] [height:95vh]",
                        sandbox: "allow-scripts allow-same-origin allow-forms allow-popups allow-popups-to-escape-sandbox allow-modals",
                        src: "/plus",
                        style: {
                            border: 0,
                            display: "block",
                            marginTop: "-42px"
                        },
                        title: t
                    })
                })]
            })
        };
    var n0 = e.i(801354),
        n1 = e.i(51267);
    let n2 = ["icon-regular-tag", "icon-regular-controller", "icon-regular-robux"],
        n3 = ["icon-regular-tag", "icon-regular-tag-arrow-up", "icon-regular-controller", "icon-regular-robux", "icon-regular-hand-two-arrows-horizontal", "icon-regular-arrow-up-from-landscape-rectangle"];

    function n5(e) {
        let t = n3.indexOf(e);
        return -1 === t ? Number.MAX_SAFE_INTEGER : t
    }

    function n4(e) {
        let t = n2.indexOf(e);
        return -1 === t ? Number.MAX_SAFE_INTEGER : t
    }
    let n8 = {
            PERIOD_TYPE_WEEK: "weeks",
            PERIOD_TYPE_MONTH: "months",
            PERIOD_TYPE_YEAR: "years"
        },
        n6 = {
            discountPercentage: {
                rename: "discountPercent"
            },
            periodType: {
                mapValue: e => n8[String(e)] ?? String(e)
            }
        };

    function n9(e) {
        let t = {};
        for (let [r, n] of Object.entries(e))
            if ("iconName" !== r && "benefitTranslationKey" !== r && "object" == typeof n)
                for (let [e, r] of Object.entries(n)) {
                    let n = n6[e],
                        a = n?.rename ?? e,
                        i = n?.mapValue ? n.mapValue(r) : r;
                    t[a] = i
                }
        return Object.keys(t).length > 0 ? t : void 0
    }

    function n7(e) {
        let {
            benefits: t,
            translate: r
        } = e, n = t.filter(e => {
            var t;
            return t = e.iconName, n2.includes(t)
        }).sort((e, t) => n4(e.iconName) - n4(t.iconName));
        return (0, U.jsx)(L.Fragment, {
            children: n.map((e, t) => (0, U.jsx)(n1.BenefitItem, {
                iconName: e.iconName,
                label: r(e.benefitTranslationKey, n9(e))
            }, `compact-${e.benefitTranslationKey}-${String(t)}`))
        })
    }

    function ae(e) {
        let {
            benefits: t,
            translate: r
        } = e;
        if (0 === t.length) return null;
        let n = t.toSorted((e, t) => n5(e.iconName) - n5(t.iconName)),
            a = Math.ceil(n.length / 2),
            i = n.slice(0, a),
            s = n.slice(a);
        return (0, U.jsxs)("div", {
            className: "gap-x-large gap-y-large width-full grid [grid-template-columns:repeat(2,minmax(0,1fr))]",
            children: [(0, U.jsx)("div", {
                className: "gap-y-large min-width-0 flex flex-col",
                children: i.map((e, t) => (0, U.jsx)(n1.BenefitItem, {
                    iconName: e.iconName,
                    label: r(e.benefitTranslationKey, n9(e))
                }, `lg-left-${e.benefitTranslationKey}-${String(t)}`))
            }), (0, U.jsx)("div", {
                className: "gap-y-large min-width-0 flex flex-col",
                children: s.map((e, t) => (0, U.jsx)(n1.BenefitItem, {
                    iconName: e.iconName,
                    label: r(e.benefitTranslationKey, n9(e))
                }, `lg-right-${e.benefitTranslationKey}-${String(t)}`))
            })]
        })
    }
    var at = e.i(836260),
        ar = e.i(882792);
    let an = {
            PRODUCT_TYPE_ROBLOX_PLUS: ny.ProductType.Blackbird
        },
        aa = {
            PERIOD_TYPE_MONTH: ny.PeriodType.Month,
            PERIOD_TYPE_YEAR: ny.PeriodType.Year,
            PERIOD_TYPE_WEEK: ny.PeriodType.Week
        },
        ai = e => {
            let {
                subscriptionV2: t,
                deviceMeta: r,
                isPrimary: n,
                onSubscriptionSectionViewShown: a,
                onSubscriptionSubscribeClick: i,
                onLearnMoreClick: s,
                learnMoreHref: l,
                paymentSessionId: o,
                onSubscribeOverride: c
            } = e, {
                translate: u
            } = (0, nv.useTranslation)(), d = t.products[0], m = d ? an[d.subscriptionProductType] : void 0, p = d ? aa[d.periodType] : void 0, h = null != d && void 0 !== m;
            (0, L.useEffect)(() => {
                h && a()
            }, [h, a]), (0, L.useEffect)(() => {
                d ? m || (0, ar.trackCounter)("Error_RobloxSubscriptionWidget_InvalidSubscriptionProductType") : (0, ar.trackCounter)("Error_RobloxSubscriptionWidget_NoPrimaryProduct")
            }, [d, m]);
            let f = null != d ? {
                    currencyCode: d.price.currencyCode,
                    units: function(e) {
                        if (null == e) return 0;
                        if ("number" == typeof e) return Number.isFinite(e) ? e : 0;
                        let t = Number(e);
                        return Number.isFinite(t) ? t : 0
                    }(d.price.units),
                    nanos: d.price.nanos ?? 0
                } : {
                    currencyCode: "USD",
                    units: 0,
                    nanos: 0
                },
                g = (0, at.default)(f);
            if (!d || !m) return null;
            let x = (Array.isArray(d.offers) ? d.offers : []).some(e => null != e.freeTrial),
                b = Array.isArray(d.benefits) ? d.benefits : [],
                y = x ? u("Action.TryItForFree") : u("Action.PricePerMonth", {
                    price: g,
                    periodType: p ?? ny.PeriodType.Month
                }),
                v = u("Label.Learnmore"),
                S = "width-full text-label-medium height-1000 [display:none] medium:[display:flex]";
            return (0, U.jsxs)("div", {
                className: "gap-y-xlarge flex flex-col",
                children: [(0, U.jsxs)("div", {
                    className: "gap-x-small min-width-0 flex flex-row flex-wrap justify-between",
                    children: [(0, U.jsxs)("div", {
                        className: "gap-x-medium flex items-center",
                        children: [(0, U.jsx)(nk.Icon, {
                            name: "icon-regular-roblox-plus",
                            size: "Large"
                        }), (0, U.jsx)("span", {
                            className: "text-label-large content-emphasis text-no-wrap",
                            children: u("Title.GetBlackbird")
                        })]
                    }), x && (0, U.jsxs)("div", {
                        className: "gap-x-small text-label-large flex shrink-0 flex-row items-center",
                        children: [(0, U.jsxs)("div", {
                            className: "relative flex flex-row [color:var(--color-extended-gray-600)]",
                            children: [(0, U.jsx)("span", {
                                className: "robux-amount-strike-through"
                            }), (0, U.jsx)("span", {
                                children: g
                            })]
                        }), (0, U.jsx)("span", {
                            children: u("Label.Free") || "Free"
                        })]
                    })]
                }), (0, U.jsx)("div", {
                    className: "gap-x-large gap-y-small medium:hidden flex flex-col",
                    "data-testid": "subscription-compact-benefits",
                    children: (0, U.jsx)(n7, {
                        benefits: b,
                        translate: u
                    })
                }), (0, U.jsx)("div", {
                    className: "medium:block hidden",
                    children: (0, U.jsx)(ae, {
                        benefits: b,
                        translate: u
                    })
                }), (0, U.jsxs)("div", {
                    className: "gap-x-small medium:gap-x-xlarge width-full flex flex-row",
                    children: [c ? (0, U.jsx)(n0.Button, {
                        className: "width-full text-label-medium",
                        size: "Medium",
                        variant: n ? "Emphasis" : "Standard",
                        onClick: c,
                        children: y
                    }) : (0, U.jsx)(nY.default, {
                        className: "width-full text-label-medium",
                        deviceMeta: r,
                        loadingStateDisabled: !0,
                        paymentSessionId: o,
                        productId: d.subscriptionProductId,
                        productType: m,
                        size: "Medium",
                        trackSubscriptionButtonClick: i,
                        variant: n ? "Emphasis" : "Standard",
                        children: y
                    }), null != l ? (0, U.jsx)(n0.Button, {
                        as: "a",
                        className: S,
                        href: l,
                        size: "Medium",
                        variant: "Standard",
                        onClick: s,
                        children: v
                    }) : (0, U.jsx)(n0.Button, {
                        className: S,
                        size: "Medium",
                        variant: "Standard",
                        onClick: s,
                        children: v
                    })]
                })]
            })
        };
    var as = e.i(418945);
    let al = "Payments.BuyRobux.PlusBillingPeriodSelection",
        ao = new class {
            isTreatment() {
                return this.assignment ??= this.fetchIsTreatment().finally(() => {
                    this.isResolved = !0
                }), this.assignment
            }
            async fetchIsTreatment() {
                if (!(0, ea.getCurrentUser)()?.id) return !1;
                try {
                    let e = (await rz.default.getAllValuesForLayer(al)).plusBillingPeriodSelectionVariant;
                    if (0 !== e && 1 !== e) return ey("PlusBillingPeriodSelectionExperimentEvaluated", {
                        variant: "unknown"
                    }), !1;
                    return this.isEnrolled = !0, ey("PlusBillingPeriodSelectionExperimentEvaluated", {
                        variant: e.toString()
                    }), 1 === e
                } catch (e) {
                    return ev("PlusBillingPeriodSelectionExperimentFetchFailed", null, e), !1
                }
            }
            logLayerExposure() {
                if (!this.isResolved) return void ey("PlusBillingPeriodSelectionExposureBeforeAssignment");
                if (this.isEnrolled && !this.hasLoggedExposure) {
                    this.hasLoggedExposure = !0;
                    try {
                        rz.default.logLayerExposure(al), ey("PlusBillingPeriodSelectionExperimentExposed")
                    } catch (e) {
                        throw this.hasLoggedExposure = !1, e
                    }
                }
            }
            constructor() {
                (0, rG._)(this, "isEnrolled", !1), (0, rG._)(this, "isResolved", !1), (0, rG._)(this, "hasLoggedExposure", !1), (0, rG._)(this, "assignment", void 0)
            }
        };
    var ac = e.i(31081);

    function au() {}
    let ad = (0, L.createContext)({
            itemCount: 0,
            currentPage: -1,
            canNext: !1,
            canPrev: !1,
            allVisible: !0,
            goTo: au,
            next: au,
            prev: au,
            registerItem: () => au
        }),
        am = (0, L.createContext)(null),
        ap = 0,
        ah = {
            position: "absolute",
            top: "50%",
            left: 0,
            transform: "translateY(-50%)",
            zIndex: 10
        },
        af = {
            position: "absolute",
            top: "50%",
            right: 0,
            transform: "translateY(-50%)",
            zIndex: 10
        },
        ag = {
            borderRadius: "9999px",
            border: "none",
            padding: 0,
            cursor: "pointer",
            transition: "opacity var(--time-100) var(--ease-linear)"
        };

    function ax(e, t) {
        return `Page ${String(e+1)} of ${String(t)}`
    }
    let ab = Object.assign(function(e) {
        let {
            children: t,
            className: r,
            ariaLabel: n
        } = e, a = (0, L.useRef)(null), i = (0, L.useRef)(new Map), s = (0, L.useRef)(null), [, l] = (0, L.useState)(0), o = (0, L.useCallback)(() => {
            l(e => e + 1)
        }, []), c = [], u = 0;
        i.current.forEach(e => {
            e.isVisible && c.push(u), u += 1
        });
        let d = i.current.size,
            m = c.length,
            p = c[0] ?? -1,
            h = c.at(-1) ?? -1,
            f = p > 0,
            g = h >= 0 && h < d - 1,
            x = d > 0 && m === d,
            b = (0, L.useCallback)(e => {
                let t = [...i.current.values()][e];
                null != t && null != a.current && a.current.scrollTo({
                    left: t.element.offsetLeft - a.current.offsetLeft,
                    behavior: "smooth"
                })
            }, []),
            y = (0, L.useCallback)(() => {
                b(h >= 0 ? Math.min(d - 1, h + 1) : 0)
            }, [b, d, h]),
            v = (0, L.useCallback)(() => {
                p <= 0 ? b(0) : b(Math.max(0, p - Math.max(1, m)))
            }, [p, b, m]),
            S = (0, L.useCallback)((e, t) => (i.current.set(e, {
                element: t,
                isVisible: !1
            }), s.current?.observe(t), o(), () => {
                s.current?.unobserve(t), i.current.delete(e), o()
            }), [o]);
        (0, L.useEffect)(() => {
            let e = a.current,
                t = J.window?.IntersectionObserver;
            if (null == e || void 0 === t) return;
            let r = new t(e => {
                let t = [];
                e.forEach(e => {
                    let {
                        target: r,
                        intersectionRatio: n
                    } = e;
                    i.current.forEach((e, a) => {
                        if (e.element !== r) return;
                        let s = n >= .6;
                        e.isVisible !== s && (i.current.set(a, {
                            element: e.element,
                            isVisible: s
                        }), t.push(!0))
                    })
                }), t.length > 0 && o()
            }, {
                root: e,
                threshold: [0, .6, 1]
            });
            return s.current = r, i.current.forEach(e => {
                r.observe(e.element)
            }), () => {
                r.disconnect(), s.current = null
            }
        }, [o]);
        let P = (0, L.useMemo)(() => ({
            itemCount: d,
            currentPage: p,
            canPrev: f,
            canNext: g,
            allVisible: x,
            goTo: b,
            next: y,
            prev: v,
            registerItem: S
        }), [x, g, f, p, b, d, y, v, S]);
        return (0, U.jsx)(ad.Provider, {
            value: P,
            children: (0, U.jsx)(am.Provider, {
                value: a,
                children: (0, U.jsx)("div", {
                    "aria-label": n,
                    className: (0, r8.default)("relative min-width-0 clip-x", r),
                    "data-testid": "carousel-root",
                    role: null != n ? "region" : void 0,
                    children: t
                })
            })
        })
    }, {
        Track: function(e) {
            let {
                className: t,
                children: r,
                gap: n = "medium",
                ...a
            } = e, i = (0, L.useContext)(am), s = (0, L.useCallback)(e => {
                null != i && (i.current = e)
            }, [i]);
            return (0, U.jsx)("div", {
                ref: s,
                className: (0, r8.default)("flex flex-row min-width-0 width-full scroll-x", "large" === n ? "gap-large" : "gap-medium", t),
                "data-testid": "carousel-track",
                style: {
                    scrollSnapType: "x mandatory",
                    scrollBehavior: "smooth",
                    scrollbarWidth: "none"
                },
                ...a,
                children: r
            })
        },
        Item: function(e) {
            let {
                className: t,
                children: r,
                ...n
            } = e, {
                registerItem: a
            } = (0, L.useContext)(ad), i = (0, L.useRef)(null), s = (0, L.useRef)("");
            return "" === s.current && (ap += 1, s.current = `carousel-item-${String(ap)}`), (0, L.useEffect)(() => {
                let e = i.current;
                if (null != e) return a(s.current, e)
            }, [a]), (0, U.jsx)("div", {
                ref: i,
                className: (0, r8.default)("carousel-item shrink-0", t),
                style: {
                    scrollSnapAlign: "start"
                },
                ...n,
                children: r
            })
        },
        PrevButton: function(e) {
            let {
                ariaLabel: t,
                className: r
            } = e, {
                canPrev: n,
                prev: a
            } = (0, L.useContext)(ad);
            return n ? (0, U.jsx)(tN.IconButton, {
                ariaLabel: t,
                className: (0, r8.default)(r),
                "data-testid": "carousel-prev-button",
                icon: "icon-filled-chevron-large-left",
                isCircular: !0,
                onClick: a,
                size: "Medium",
                style: ah,
                variant: "OverMedia"
            }) : null
        },
        NextButton: function(e) {
            let {
                ariaLabel: t,
                className: r
            } = e, {
                canNext: n,
                next: a
            } = (0, L.useContext)(ad);
            return n ? (0, U.jsx)(tN.IconButton, {
                ariaLabel: t,
                className: (0, r8.default)(r),
                "data-testid": "carousel-next-button",
                icon: "icon-filled-chevron-large-right",
                isCircular: !0,
                onClick: a,
                size: "Medium",
                style: af,
                variant: "OverMedia"
            }) : null
        },
        Indicator: function(e) {
            let {
                className: t,
                formatDotLabel: r = ax
            } = e, {
                itemCount: n,
                currentPage: a,
                allVisible: i,
                goTo: s
            } = (0, L.useContext)(ad);
            return n <= 1 || i ? null : (0, U.jsx)("div", {
                className: (0, r8.default)("flex flex-row items-center justify-center gap-small", t),
                "data-testid": "carousel-indicator",
                role: "tablist",
                children: Array.from({
                    length: n
                }, (e, t) => {
                    let i = t === a;
                    return (0, U.jsx)("button", {
                        "aria-label": r(t, n),
                        "aria-selected": i,
                        className: "content-emphasis size-[8px] bg-action-standard",
                        "data-testid": `carousel-indicator-dot-${String(t)}`,
                        onClick: () => {
                            s(t)
                        },
                        role: "tab",
                        style: {
                            ...ag,
                            opacity: i ? 1 : .22
                        },
                        type: "button"
                    }, t)
                })
            })
        }
    });
    var ay = e.i(745911);
    let av = [{
            iconName: "icon-regular-tag",
            translationKey: "Description.Benefit.DiscountBuyRobux",
            getParams: e => {
                let {
                    discountPercent: t
                } = e;
                return {
                    discountPercent: t
                }
            }
        }, {
            iconName: "icon-regular-controller",
            translationKey: "Description.Benefit.PrivateServersExpandedTitle"
        }, {
            iconName: "icon-regular-robux",
            translationKey: "Description.Benefit.RobuxTransfers"
        }, {
            iconName: "icon-regular-paint-brush",
            translationKey: "Description.Benefit.ProfileFrameAppTheme"
        }],
        aS = [{
            iconName: "icon-regular-roblox-plus",
            translationKey: "Description.Benefit.AllPlus.V2"
        }, {
            iconName: "icon-regular-robux",
            translationKey: "Description.Benefit.RobuxAllowance",
            getParams: e => {
                let {
                    robuxAmount: t
                } = e;
                return {
                    amount: t
                }
            }
        }, {
            iconName: "icon-regular-pig",
            translationKey: "Description.Benefit.BetterValue.V2",
            isVisible: e => {
                let {
                    oldAmount: t
                } = e;
                return null != t
            },
            getParams: e => {
                let {
                    oldAmount: t
                } = e;
                return {
                    oldAmount: t ?? ""
                }
            }
        }],
        aP = e => {
            let {
                iconName: t,
                benefit: r
            } = e;
            return (0, U.jsxs)("li", {
                className: "flex flex-row items-center gap-medium medium:gap-large",
                children: [(0, U.jsx)(B.Icon, {
                    className: "size-[20px]",
                    name: t,
                    size: "Medium"
                }), (0, U.jsx)("span", {
                    className: "text-body-medium content-default",
                    children: r
                })]
            })
        };

    function aC(e) {
        if (null == e) return 0;
        if ("number" == typeof e) return Number.isFinite(e) ? e : 0;
        let t = Number(e);
        return Number.isFinite(t) ? t : 0
    }
    let aE = e => {
            let {
                product: t,
                robuxAllowance: r
            } = e, n = (0, er.useTranslations)("Feature.RobloxSubscription"), a = (0, ay.useFormatter)(), i = (t.benefits ?? []).reduce((e, t) => Math.max(e, t.plusDiscountSubscriptionBenefits?.discountPercentage ?? 0), 0), s = a.number(i / 100, {
                style: "percent",
                maximumFractionDigits: 0
            }), l = a.number(aC(t.price.units) + (t.price.nanos ?? 0) * 1e-9, {
                style: "currency",
                currency: t.price.currencyCode
            }), o = t.strikethroughPrice ? a.number(aC(t.strikethroughPrice.units) + (t.strikethroughPrice.nanos ?? 0) * 1e-9, {
                style: "currency",
                currency: t.strikethroughPrice.currencyCode
            }) : null, c = a.number(r), u = r > 0 ? aS : av, d = {
                discountPercent: s,
                robuxAmount: c,
                oldAmount: o,
                newAmount: l
            };
            return (0, U.jsx)("ul", {
                className: "flex flex-col gap-medium padding-y-small",
                style: {
                    listStyle: "none",
                    paddingInlineStart: 0,
                    marginBlock: 0
                },
                children: u.filter(e => e.isVisible?.(d) ?? !0).map((e, t) => {
                    let {
                        iconName: r,
                        translationKey: a,
                        getParams: i
                    } = e;
                    return (0, U.jsx)(aP, {
                        benefit: n(a, i?.(d)),
                        iconName: r
                    }, `${r}-${String(t)}`)
                })
            })
        },
        aw = {
            PRODUCT_TYPE_ROBLOX_PLUS: "Blackbird"
        };

    function aN(e) {
        if (null == e) return 0;
        let t = Number.parseInt(e, 10);
        return Number.isFinite(t) && t > 0 ? t : 0
    }

    function ak(e) {
        return function(e) {
            if (null == e) return 0;
            if ("number" == typeof e) return Number.isFinite(e) ? e : 0;
            let t = Number(e);
            return Number.isFinite(t) ? t : 0
        }(e.units) + (e.nanos ?? 0) * 1e-9
    }

    function aT(e) {
        switch (e) {
            case "PERIOD_TYPE_WEEK":
                return "Week";
            case "PERIOD_TYPE_MONTH":
                return "Month";
            case "PERIOD_TYPE_YEAR":
                return "Year"
        }
    }
    let aj = e => {
            let {
                href: t,
                onClick: r,
                isEmphasized: n,
                children: a
            } = e;
            return (0, U.jsx)(O.Button, {
                as: "a",
                className: "width-full",
                href: t,
                icon: "icon-regular-arrow-up-right-from-square",
                onClick: r,
                rel: "noreferrer",
                role: "button",
                size: "Medium",
                target: "_blank",
                variant: n ? "Emphasis" : "Standard",
                children: a
            })
        },
        aA = e => {
            let {
                product: t,
                deviceMeta: r,
                isEmphasized: n,
                isPrimary: a,
                onSubscribeClick: i,
                onSubscribeOverride: s,
                paymentSessionId: l,
                redirect: o
            } = e, c = (0, er.useTranslations)("Feature.RobloxSubscription"), u = (0, ay.useFormatter)(), d = (0, L.useMemo)(() => {
                if (void 0 === J.window || !o?.url) return "";
                let e = new URL(o.url, J.window.location.origin);
                return e.searchParams.set("ctx", "subscription"), e.searchParams.set("type", "RobloxPlus"), e.searchParams.set("id", t.subscriptionProductId), `${e.pathname}${e.search}`
            }, [o?.url, t.subscriptionProductId]), m = aw[t.subscriptionProductType];
            if (null == m) return null;
            let p = aN(t.robuxAmount),
                h = p > 0 ? `Plus ${String(p)}` : "Roblox Plus",
                f = (Array.isArray(t.offers) ? t.offers : []).some(e => e.freeTrial),
                g = !!t.isRedirect,
                x = u.number(ak(t.price), {
                    style: "currency",
                    currency: t.price.currencyCode
                }),
                b = t.strikethroughPrice ? u.number(ak(t.strikethroughPrice), {
                    style: "currency",
                    currency: t.strikethroughPrice.currencyCode
                }) : null,
                y = f ? c("Action.TryItForFree") : c("Action.PricePerMonth", {
                    price: x,
                    periodType: aT(t.periodType)
                });
            return (0, U.jsxs)("div", {
                className: (0, r8.default)("radius-large padding-medium flex flex-col items-stretch justify-between gap-small height-full", {
                    "bg-surface-100": a,
                    "stroke-standard": !a,
                    "stroke-default": !a
                }),
                "data-testid": `subscription-tile-${t.subscriptionProductId}`,
                ...{
                    [eK]: t.subscriptionProductId,
                    [eH]: t.subscriptionProductType
                },
                children: [(0, U.jsxs)("div", {
                    className: "flex flex-row items-center justify-between gap-large",
                    children: [(0, U.jsx)("h3", {
                        className: "text-label-large content-emphasis text-truncate-end",
                        children: h
                    }), (0, U.jsxs)("div", {
                        className: "flex flex-row items-center justify-end gap-small",
                        children: [b && (0, U.jsx)("span", {
                            className: "text-title-medium text-no-wrap content-muted line-through",
                            children: b
                        }), (0, U.jsx)("span", {
                            className: "text-title-medium content-emphasis text-no-wrap",
                            children: x
                        })]
                    })]
                }), (0, U.jsx)(aE, {
                    product: t,
                    robuxAllowance: p
                }), g ? (0, U.jsx)(aj, {
                    href: d,
                    onClick: e => {
                        rQ(e), i?.({
                            isFreeTrial: !1,
                            productId: t.subscriptionProductId,
                            isRedirect: !0
                        }), o?.refreshAuthTicket()
                    },
                    isEmphasized: n,
                    children: y
                }) : s ? (0, U.jsx)(O.Button, {
                    className: "width-full",
                    onClick: s,
                    size: "Medium",
                    variant: n ? "Emphasis" : "Standard",
                    children: y
                }) : (0, U.jsx)(nY.default, {
                    className: "width-full",
                    deviceMeta: r,
                    paymentSessionId: l,
                    productId: t.subscriptionProductId,
                    productType: m,
                    size: "Medium",
                    trackSubscriptionButtonClick: () => {
                        i?.({
                            isFreeTrial: f,
                            productId: t.subscriptionProductId,
                            isRedirect: !1
                        })
                    },
                    variant: n ? "Emphasis" : "Standard",
                    children: y
                })]
            })
        };

    function aM(e) {
        let {
            subscriptionV2: t,
            deviceMeta: r,
            isPrimary: n,
            onSubscriptionSectionViewShown: a,
            onSubscriptionSubscribeClick: i,
            baseProductId: s,
            onBaseProductSubscribe: l,
            paymentSessionId: o,
            redirect: c
        } = e, {
            products: u
        } = t, d = "dark" === (0, ac.useResolvedColorMode)() ? "color-mode-light light-theme" : "color-mode-dark dark-theme";
        return ((0, L.useEffect)(() => {
            u.length > 0 && a()
        }, []), 0 === u.length) ? null : (0, U.jsxs)(ab, {
            ariaLabel: "Roblox Plus subscription tiers",
            className: "self-stretch bleed-section-padding",
            children: [(0, U.jsx)("div", {
                className: d,
                children: (0, U.jsx)(ab.PrevButton, {
                    ariaLabel: "Previous tier",
                    className: "hidden medium:flex"
                })
            }), (0, U.jsx)(ab.Track, {
                className: "bleed-section-padding-track bundle-carousel-track-cap",
                children: u.map((e, t) => (0, U.jsx)(ab.Item, {
                    className: "flex flex-col width-[313px] medium:width-[242px]",
                    children: (0, U.jsx)(aA, {
                        deviceMeta: r,
                        isEmphasized: n && 0 === t,
                        isPrimary: n,
                        onSubscribeClick: i,
                        onSubscribeOverride: e.subscriptionProductId === s ? l : void 0,
                        paymentSessionId: o,
                        product: e,
                        redirect: c
                    })
                }, e.subscriptionProductId))
            }), (0, U.jsx)("div", {
                className: d,
                children: (0, U.jsx)(ab.NextButton, {
                    ariaLabel: "Next tier",
                    className: "hidden medium:flex"
                })
            }), (0, U.jsx)(ab.Indicator, {
                className: "padding-top-medium medium:hidden"
            })]
        })
    }
    let aR = e => (function(e, t) {
            let r = null != t && t > 0 ? t : 1;
            switch (e) {
                case ny.PeriodType.Month:
                    return r;
                case ny.PeriodType.Year:
                    return 12 * r;
                case ny.PeriodType.Week:
                    return
            }
        })(aT(e.periodType), e.periodCount),
        aI = e => void 0 !== aw[e.subscriptionProductType] && 0 === aN(e.robuxAmount) && void 0 !== aR(e),
        aU = e => {
            let t = (e => {
                var t;
                let r = e.offers?.find(e => e.freeTrial)?.freeTrial;
                if (r && ("PERIOD_TYPE_WEEK" === (t = r.periodType) || "PERIOD_TYPE_MONTH" === t || "PERIOD_TYPE_YEAR" === t)) return {
                    duration: r.duration,
                    periodType: aT(r.periodType)
                }
            })(e);
            return {
                productId: e.subscriptionProductId,
                productType: aw[e.subscriptionProductType] ?? "",
                months: aR(e) ?? 1,
                price: {
                    amount: ak(e.price),
                    currencyCode: e.price.currencyCode
                },
                strikethroughPrice: e.strikethroughPrice && {
                    amount: ak(e.strikethroughPrice),
                    currencyCode: e.strikethroughPrice.currencyCode
                },
                freeTrialEndDate: t ? (0, nP.addBillingPeriod)(Date.now(), t.duration, t.periodType) : void 0,
                freeTrialDuration: t?.duration,
                freeTrialPeriodType: t?.periodType
            }
        },
        a_ = "/plus",
        aF = "text-label-medium text-default [text-decoration:underline] [text-underline-position:from-font]";

    function aL(e) {
        let t, {
                isPrimary: r,
                sectionBase: n,
                subscriptionV2: a
            } = e,
            i = (0, er.useTranslations)("Feature.RobloxSubscription"),
            {
                translateFullKey: s
            } = (0, er.useFullKeyTranslations)(),
            {
                paymentSession: l,
                redirect: o,
                deviceMeta: c
            } = (0, L.useContext)(ec),
            {
                trackSubscriptionV2Shown: u,
                trackSubscriptionV2SubscribeClick: d,
                trackSubscriptionV2LearnMoreClick: m
            } = {
                trackSubscriptionV2Shown: (t = (0, L.useContext)(eR)).trackSubscriptionV2Shown,
                trackSubscriptionV2SubscribeClick: t.trackSubscriptionV2SubscribeClick,
                trackSubscriptionV2LearnMoreClick: t.trackSubscriptionV2LearnMoreClick
            },
            [p, h] = (0, L.useState)(!1),
            {
                isInApp: f
            } = c,
            g = (0, L.useCallback)(() => {
                m(), f && h(!0)
            }, [f, m]),
            x = (0, L.useCallback)(e => {
                e || h(!1)
            }, []),
            b = (0, L.useCallback)(e => {
                ("Enter" === e.key || " " === e.key) && (e.preventDefault(), g())
            }, [g]),
            {
                tileProducts: y,
                billingPeriodOptions: v
            } = (0, L.useMemo)(() => {
                var e;
                let t, r, n;
                return r = (t = (e = a.products).filter(aI)).some(e => 1 === aR(e)), n = t.some(e => (aR(e) ?? 0) > 1), r && n ? {
                    tileProducts: e.filter(e => !aI(e) || 1 === aR(e)),
                    billingPeriodOptions: t.map(aU)
                } : {
                    tileProducts: e,
                    billingPeriodOptions: []
                }
            }, [a.products]),
            S = (0, L.useMemo)(() => ({
                ...a,
                products: y
            }), [a, y]),
            P = y.at(0),
            C = v.find(e => 1 === e.months)?.productId,
            {
                isTreatment: E,
                logExposure: w
            } = function(e) {
                let [t, r] = (0, L.useState)(!1);
                (0, L.useEffect)(() => {
                    e && (async () => {
                        r(await ao.isTreatment())
                    })()
                }, [e]);
                let n = (0, L.useCallback)(() => {
                    if (e) try {
                        ao.logLayerExposure()
                    } catch (e) {
                        ev("PlusBillingPeriodSelectionLayerExposureError", null, e)
                    }
                }, [e]);
                return {
                    isTreatment: e && t,
                    logExposure: n
                }
            }(y.some(e => e.subscriptionProductId === C && !e.isRedirect)),
            [N, k] = (0, L.useState)(!1),
            T = (0, L.useMemo)(() => ({
                triggeringContext: eG(c),
                viewName: D.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBLOX_PLUS_BUY_ROBUX
            }), [c]),
            j = (0, L.useCallback)(() => {
                w(), k(!0)
            }, [w]),
            A = (0, L.useCallback)(() => {
                k(!1)
            }, []),
            M = (0, L.useCallback)(e => {
                e.productId === C && w(), d(e), e.isRedirect || rX(c, !0, e.productId)
            }, [C, c, w, d]),
            R = (0, L.useCallback)(e => {
                ey("SubscriptionV2SubscribeClick", {
                    isFreeTrial: String(void 0 !== e.freeTrialEndDate),
                    productId: e.productId,
                    isRedirect: "false"
                }), rX(c, !0, e.productId)
            }, [c]),
            I = (0, L.useMemo)(() => y.some(e => e.offers?.some(e => !!e.freeTrial) ?? !1), [y]),
            _ = null != P;
        (0, L.useEffect)(() => {
            _ && ey("SubscriptionV2SectionShown", {
                variant: y.length > 1 ? "carousel" : "single",
                tierCount: String(y.length),
                isFreeTrial: String(I)
            })
        }, []);
        let F = (0, L.useCallback)(() => {
                u(I)
            }, [u, I]),
            O = (0, L.useCallback)(() => {
                M({
                    isFreeTrial: I,
                    productId: P?.subscriptionProductId ?? "Unknown",
                    isRedirect: !1
                })
            }, [M, I, P]);
        if (!P) return ey("SubscriptionV2NoPrimaryProduct"), null;
        let G = i("Label.Learnmore"),
            z = y.length > 1;
        return (0, U.jsxs)(r6, {
            "data-testid": "section-subscription-v2",
            ...e$(n),
            children: [(0, U.jsx)(r9, {
                children: (0, U.jsxs)("div", {
                    className: "flex flex-row width-full justify-between items-center",
                    children: [(0, U.jsxs)("div", {
                        className: "flex flex-row items-center gap-x-small medium:gap-x-medium",
                        children: [(0, U.jsx)(B.Icon, {
                            name: "icon-regular-roblox-plus",
                            size: "Large",
                            className: "medium:size-[var(--icon-size-xlarge)]"
                        }), s(n.sectionHeaderTranslationKey)]
                    }), f ? (0, U.jsx)("span", {
                        className: (0, r8.default)(aF, "cursor-pointer", {
                            "medium:[display:none]": !z
                        }),
                        "data-testid": "header-learn-more-trigger",
                        onClick: g,
                        onKeyDown: b,
                        role: "button",
                        tabIndex: 0,
                        children: G
                    }) : (0, U.jsx)("a", {
                        className: (0, r8.default)(aF, {
                            "medium:[display:none]": !z
                        }),
                        "data-testid": "header-learn-more-link",
                        href: a_,
                        onClick: m,
                        children: G
                    })]
                })
            }), z ? (0, U.jsx)(aM, {
                baseProductId: C,
                deviceMeta: c,
                isPrimary: !!r,
                onBaseProductSubscribe: E ? j : void 0,
                onSubscriptionSectionViewShown: F,
                onSubscriptionSubscribeClick: M,
                paymentSessionId: l?.id,
                redirect: o,
                subscriptionV2: S
            }) : (0, U.jsx)(ne, {
                isPrimary: r,
                children: (0, U.jsx)("div", {
                    className: "self-stretch medium:flex-row medium:justify-between",
                    children: (0, U.jsx)(ai, {
                        deviceMeta: c,
                        isPrimary: !!r,
                        onSubscriptionSectionViewShown: F,
                        onSubscriptionSubscribeClick: O,
                        subscriptionV2: S,
                        onLearnMoreClick: g,
                        learnMoreHref: f ? void 0 : a_,
                        paymentSessionId: l?.id,
                        onSubscribeOverride: E ? j : void 0
                    })
                })
            }), f && (0, U.jsx)(as.SheetRoot, {
                open: p,
                onOpenChange: x,
                children: (0, U.jsx)(nZ, {})
            }), E && (0, U.jsx)(nJ, {
                analyticsContext: T,
                deviceMeta: c,
                isOpen: N,
                options: v,
                paymentSessionId: l?.id,
                onMobilePurchaseInitiated: A,
                onOpenChange: k,
                onSubscribeClick: R
            })]
        })
    }
    let aD = () => {
        let {
            robuxBalance: e
        } = (0, L.useContext)(ec);
        return "number" != typeof e ? null : (0, U.jsxs)(L.Fragment, {
            children: [(0, U.jsx)(B.Icon, {
                name: "icon-filled-robux"
            }), (0, U.jsx)("span", {
                className: "text-label-medium content-action-standard",
                children: (0, tM.formatNumber)(e)
            })]
        })
    };

    function aB(e) {
        let {
            transfers: t
        } = e, {
            buyRobuxPageData: {
                pageHeaderMetadata: r
            },
            urlParams: n,
            deviceMeta: a
        } = (0, L.useContext)(ec), i = eU(a), {
            translateFullKey: s
        } = (0, er.useFullKeyTranslations)(), l = "true" === n.showHeader, o = l && !t ? (0, U.jsx)("div", {
            className: "self-stretch flex flex-row space-between items-center",
            style: {
                position: "sticky",
                top: "calc(10px + env(safe-area-inset-top))",
                zIndex: 1,
                marginTop: "-4px"
            },
            children: (0, U.jsx)("div", {
                className: "flex flex-row justify-center items-center gap-small height-1000 padding-left-medium padding-right-large radius-circle bg-surface-0 margin-left-auto",
                children: (0, U.jsx)(aD, {})
            })
        }) : null;
        if (!r) return o;
        let {
            promotionalRobuxPercentage: c,
            strikethroughPromotionalRobuxPercentage: u,
            translationKey: d
        } = r, m = {
            used: !1
        }, p = c && u ? s.html(d, [{
            opening: "divTagStart",
            closing: "divTagEnd",
            render: e => (m.used = !0, (0, U.jsx)("span", {
                className: "line-through [font-weight:normal] [color:var(--color-extended-gray-600)]",
                children: e
            }))
        }], {
            strikethroughPercentage: u,
            percentage: c
        }) : void 0, h = null != p, f = h && m.used, g = (0, U.jsx)("h1", {
            className: (0, r8.default)("self-stretch text-align-x-left text-section-title content-emphasis large:text-align-x-center padding-y-none", !f && "large:margin-x-[120px]"),
            children: h ? p : s(d, c ? {
                percentage: c
            } : {})
        });
        return l ? (0, U.jsxs)(L.Fragment, {
            children: [o, (0, U.jsx)("div", {
                className: "flex flex-col justify-center items-center self-stretch padding-bottom-medium large:padding-y-xxlarge large:gap-large gap-small",
                children: g
            })]
        }) : (0, U.jsxs)("div", {
            className: "flex flex-col justify-center items-center self-stretch padding-bottom-medium large:padding-y-xxlarge large:gap-large gap-small padding-top-xlarge",
            children: [!i && !t && (0, U.jsx)("div", {
                className: "self-stretch flex flex-row justify-end items-center large:hidden",
                children: (0, U.jsx)("div", {
                    className: "flex flex-row justify-center items-center gap-small height-1000 padding-left-medium padding-right-large radius-circle bg-surface-0",
                    children: (0, U.jsx)(aD, {})
                })
            }), g]
        })
    }
    let aO = [{
            questionKey: "Action.WhatAreRobuxQuestion",
            answerKey: "Action.WhatAreRobuxAnswer"
        }, {
            questionKey: "Action.WhereAreMyRobuxQuestion",
            answerKey: "Action.WhereAreMyRobuxAnswer"
        }, {
            questionKey: "Action.DoRobuxExpireQuestion",
            answerKey: "Action.DoRobuxExpireAnswer"
        }],
        aG = {
            questionKey: "Action.HowToRedeemGiftCardQuestion",
            answerKey: "Action.HowToRedeemGiftCardAnswer"
        };

    function az() {
        let e = (0, er.useTranslations)("Feature.BuyRobux"),
            {
                deviceMeta: t
            } = (0, L.useContext)(ec),
            [r, n] = (0, L.useState)(() => new Set),
            a = eI(t) ? [...aO, aG] : aO,
            i = (0, L.useCallback)(e => {
                n(t => {
                    let r = new Set(t);
                    return r.has(e) ? r.delete(e) : r.add(e), r
                })
            }, []);
        return (0, U.jsxs)(r6, {
            children: [(0, U.jsx)(r9, {
                children: e("Heading.FAQ")
            }), (0, U.jsx)("div", {
                className: "self-stretch flex flex-col items-stretch gap-medium large:gap-large",
                children: a.map(t => {
                    let {
                        questionKey: n,
                        answerKey: a
                    } = t, s = e.has(n), l = e.has(a);
                    if (!s || !l) return null;
                    let o = [];
                    "Action.WhereAreMyRobuxAnswer" === a ? o = [{
                        opening: "transactionsLinkStart",
                        closing: "transactionsLinkEnd",
                        render: e => (0, U.jsx)("a", {
                            href: (0, t4.getAbsoluteUrl)("/transactions"),
                            className: "text-link",
                            children: e
                        })
                    }] : a === aG.answerKey && (o = [{
                        opening: "redeemLinkStart",
                        closing: "redeemLinkEnd",
                        render: e => (0, U.jsx)("a", {
                            href: (0, t4.getAbsoluteUrl)("/redeem"),
                            className: "text-link",
                            children: e
                        })
                    }]);
                    let c = r.has(n),
                        u = `faq-panel-${n}`;
                    return (0, U.jsxs)("div", {
                        className: "radius-medium stroke-standard stroke-default overflow-hidden padding-x-medium padding-y-small",
                        children: [(0, U.jsxs)("div", {
                            role: "button",
                            "aria-expanded": c,
                            "aria-controls": u,
                            tabIndex: 0,
                            className: "width-full cursor-pointer flex flex-row items-center justify-between height-1000 content-default",
                            onClick: () => {
                                i(n)
                            },
                            onKeyDown: e => {
                                ("Enter" === e.key || " " === e.key) && (e.preventDefault(), i(n))
                            },
                            children: [(0, U.jsx)("span", {
                                className: "text-align-x-left text-title-medium",
                                children: e(n)
                            }), (0, U.jsx)(B.Icon, {
                                name: c ? "icon-regular-chevron-large-up" : "icon-regular-chevron-large-down",
                                size: "Medium",
                                className: "content-emphasis"
                            })]
                        }), c && (0, U.jsx)("div", {
                            id: u,
                            role: "region",
                            "aria-label": e(n),
                            className: "padding-bottom-medium text-body-medium content-default",
                            style: {
                                whiteSpace: "pre-wrap"
                            },
                            children: e.html(a, o)
                        })]
                    }, n)
                })
            })]
        })
    }
    var aV = e.i(708923),
        aW = e.i(739472),
        aK = e.i(309937),
        aH = e.i(641928);
    let aQ = async (e, t) => {
        let r = `${e}_API`,
            n = performance.now();
        nz(r, {
            statusCode: "Throughput"
        });
        try {
            let e = await t();
            return nz(r, {
                statusCode: "200"
            }), e
        } catch (e) {
            throw nz(r, {
                statusCode: (e => {
                    if (null == e) return "NetworkError";
                    if ("object" == typeof e) {
                        let {
                            status: t,
                            response: r,
                            name: n,
                            code: a
                        } = e;
                        if ("number" == typeof t) return t.toString();
                        if ("number" == typeof r?.status) return r.status.toString();
                        if ("FetchError" === n) return "NetworkError";
                        if ("string" == typeof a) return a
                    }
                    return "UnknownError"
                })(e)
            }), e
        } finally {
            nV(`${r}_LatencyMs`, void 0, performance.now() - n)
        }
    }, a$ = [];
    var aq = e.i(938759),
        aq = aq,
        aY = e.i(283023);

    function aX(e) {
        let {
            surface: t,
            entrypoint: r,
            referrerId: n
        } = e, a = new URL("roblox://navigation/plus_subscribe"), i = {
            surface: t,
            entrypoint: r
        };
        return void 0 !== n && (i.referrer_id = String(n)), a.search = new URLSearchParams(i).toString(), a.toString()
    }
    var aJ = e.i(907119),
        aJ = aJ,
        aZ = e.i(41621);
    let a0 = {
        XSmall: {
            containerSize: "height-600 width-600",
            iconSize: "Small"
        },
        Small: {
            containerSize: "height-800 width-800",
            iconSize: "Medium"
        }
    };

    function a1(e) {
        let {
            thumbnailUrl: t,
            displayName: r,
            size: n,
            className: a = ""
        } = e, {
            containerSize: i,
            iconSize: s
        } = a0[n];
        return (0, U.jsx)("div", {
            className: `${i} radius-circle clip flex items-center justify-center shrink-0 ${a}`,
            children: t ? (0, U.jsx)("img", {
                src: t,
                alt: r,
                className: "height-full width-full object-cover"
            }) : (0, U.jsx)(B.Icon, {
                name: "icon-regular-person",
                size: s
            })
        })
    }
    let a2 = "radial-gradient(circle at -10px 12px, transparent 14px, black 14px)";

    function a3(e) {
        let {
            pendingTransfers: t
        } = e;
        if (0 === t.length) return null;
        let r = t.length > 3,
            n = t.slice(0, r ? 2 : 3),
            a = n.length + +!!r,
            i = e => ({
                position: "relative",
                marginLeft: 0 === e ? 0 : -2,
                zIndex: a - e,
                ...e > 0 && {
                    maskImage: a2,
                    WebkitMaskImage: a2
                }
            });
        return (0, U.jsxs)("div", {
            className: "flex flex-row items-center shrink-0",
            children: [n.map((e, t) => (0, U.jsx)("div", {
                style: i(t),
                children: (0, U.jsx)(a1, {
                    thumbnailUrl: e.sender.thumbnailUrl,
                    displayName: e.sender.displayName,
                    size: "XSmall",
                    className: "bg-shift-200"
                })
            }, e.transferRequestId)), r && (0, U.jsx)("div", {
                style: i(n.length),
                children: (0, U.jsx)("div", {
                    "aria-hidden": "true",
                    className: "height-600 width-600 radius-circle bg-shift-200 flex items-center justify-center shrink-0",
                    children: (0, U.jsx)(B.Icon, {
                        name: "icon-filled-three-dots-horizontal",
                        size: "XSmall"
                    })
                })
            })]
        })
    }
    var aq = aq,
        aJ = aJ,
        a5 = e.i(941127),
        a4 = e.i(459475);

    function a8(e) {
        let {
            iconName: t,
            title: r,
            metadata: n,
            onSelect: a
        } = e;
        return (0, U.jsx)(a5.ListItem, {
            className: "padding-x-none [&>div]:padding-y-small",
            divider: "None",
            isContained: !0,
            leading: (0, U.jsx)("span", {
                className: "bg-shift-200 radius-circle size-1200 flex items-center justify-center",
                children: (0, U.jsx)(B.Icon, {
                    name: t,
                    size: "Large"
                })
            }),
            metadata: n,
            size: "Medium",
            title: r,
            trailing: (0, U.jsx)(a4.ListItemChevronTrailingAccessory, {}),
            onSelect: a
        })
    }
    var a6 = e.i(358239),
        a9 = e.i(175067);

    function a7(e, t) {
        if (void 0 !== J.window)
            if (eU(t)) J.window.location.href = e;
            else if (t.isIosDevice || t.isAndroidDevice || (0, a6.isIos13Ipad)() || t.isChromeOs) {
            let t;
            J.window.location.href = ((t = new URL("https://ro.blox.com/Ebh5")).search = new URLSearchParams({
                pid: "buy-robux-currency-transfer",
                is_retargeting: "false",
                deep_link_value: e
            }).toString(), t.toString())
        } else if (t.isDesktop && !t.isUniversalApp) {
            let t = (0, a9.getGameLauncher)();
            t ? t.startDeepLinkFlow(e) : J.window.Roblox.ProtocolHandlerClientInterface?.startDeepLinkFlow ? J.window.Roblox.ProtocolHandlerClientInterface.startDeepLinkFlow(e) : J.window.location.href = e
        } else J.window.location.href = e
    }

    function ie(e) {
        let t = new URL("roblox://navigation/currency_transfer");
        return t.search = new URLSearchParams(e).toString(), t.toString()
    }

    function it(e) {
        let {
            transfer: t,
            acceptTranslationKey: r
        } = e, {
            translateFullKey: n
        } = (0, er.useFullKeyTranslations)(), {
            trackPendingTransfersAcceptClick: a
        } = (0, L.useContext)(eR), {
            deviceMeta: i
        } = (0, L.useContext)(ec);
        return (0, U.jsxs)("div", {
            className: "flex flex-row items-center justify-between gap-small padding-medium radius-medium stroke-standard stroke-default",
            children: [(0, U.jsxs)("div", {
                className: "flex flex-row items-center gap-small",
                children: [(0, U.jsx)(a1, {
                    thumbnailUrl: t.sender.thumbnailUrl,
                    displayName: t.sender.displayName,
                    size: "Small",
                    className: "bg-surface-200"
                }), (0, U.jsxs)("div", {
                    className: "flex flex-col",
                    children: [(0, U.jsx)("span", {
                        className: "text-label-medium content-emphasis",
                        children: t.sender.displayName
                    }), (0, U.jsx)("span", {
                        className: "text-body-small content-muted",
                        children: new Date(Number(t.createdTimestampMs)).toLocaleDateString("default", {
                            month: "short",
                            day: "numeric",
                            year: "numeric"
                        })
                    })]
                })]
            }), (0, U.jsxs)("div", {
                className: "flex flex-row items-center gap-small",
                children: [(0, U.jsxs)("div", {
                    className: "flex flex-row items-center gap-xsmall",
                    children: [(0, U.jsx)(B.Icon, {
                        name: "icon-regular-robux",
                        size: "Small"
                    }), (0, U.jsx)("span", {
                        className: "text-label-medium content-emphasis",
                        children: (0, tM.formatNumber)(Number(t.netTransferRobuxAmount))
                    })]
                }), (0, U.jsx)(O.Button, {
                    size: "Small",
                    variant: "Standard",
                    onClick: () => {
                        var e;
                        a(), e = t.transferRequestId, ey("PendingTransferDeepLink"), a7(ie({
                            direction: "receive",
                            transferrequestid: `RXT-${e}`
                        }), i)
                    },
                    children: n(r)
                })]
            })]
        })
    }

    function ir(e) {
        let {
            pendingTransfers: t,
            acceptTransfersTranslationKey: r
        } = e, n = (0, er.useTranslations)("Feature.BuyRobux");
        return (0, U.jsxs)(as.SheetContent, {
            centerSheetSize: "Medium",
            closeLabel: "Close",
            largeScreenVariant: "center",
            children: [(0, U.jsx)(as.SheetTitle, {
                children: n("Heading.PendingTransfers")
            }), (0, U.jsx)(as.SheetBody, {
                children: (0, U.jsx)("div", {
                    className: "flex flex-col gap-medium padding-bottom-xlarge overflow-y-auto",
                    style: {
                        maxHeight: "60vh"
                    },
                    children: t.map(e => (0, U.jsx)(it, {
                        transfer: e,
                        acceptTranslationKey: r
                    }, e.transferRequestId))
                })
            })]
        })
    }

    function ia(e) {
        let {
            pendingTransfers: t,
            acceptTransfersTranslationKey: r
        } = e, n = (0, er.useTranslations)("Feature.BuyRobux"), [a, i] = (0, L.useState)(!1), s = (0, L.useMemo)(() => t.reduce((e, t) => e + Number(t.netTransferRobuxAmount), 0), [t]), l = (0, tM.formatNumber)(t.length), o = (0, tM.formatNumber)(s), c = 1 === t.length;
        return (0, U.jsxs)(L.Fragment, {
            children: [(0, U.jsx)(a8, {
                iconName: "icon-regular-robux",
                metadata: n("Label.AcceptTheseRobux", void 0, "Accept these Robux"),
                title: n(c ? "Label.PendingTransfersSummary.Singular" : "Label.PendingTransfersSummary.Plural", {
                    count: l,
                    robux: o
                }, c ? `${l} person sent you ${o} Robux` : `${l} people sent you ${o} Robux`),
                onSelect: () => {
                    i(!0)
                }
            }), (0, U.jsx)(as.SheetRoot, {
                open: a,
                onOpenChange: i,
                children: (0, U.jsx)(ir, {
                    acceptTransfersTranslationKey: r,
                    pendingTransfers: t
                })
            })]
        })
    }

    function ii(e) {
        let {
            referral: t,
            shouldDeeplinkToReferral: r
        } = e, n = (0, er.useTranslations)("Feature.RobloxSubscription"), a = (0, ay.useFormatter)(), {
            handle: i,
            isLoading: s
        } = (0, aZ.useReferrerHandle)(String(t.senderUserId)), {
            deviceMeta: l
        } = (0, L.useContext)(ec), [o, c] = (0, L.useState)(!1), u = n("Heading.ReferralRecipientEntry", {
            amount: a.number(nq.REFERRAL_REWARD_ROBUX)
        }, `Join Plus to get ${a.number(nq.REFERRAL_REWARD_ROBUX)} Robux`);
        return s ? null : (0, U.jsxs)(L.Fragment, {
            children: [(0, U.jsx)(a8, {
                iconName: "icon-regular-roblox-plus",
                metadata: i ? u : void 0,
                title: i ? n("Description.ReferralPendingRequest", {
                    displayName: i
                }, `${i} referred you to Plus`) : u,
                onSelect: () => {
                    if (r) {
                        aJ.default.buyRobuxReferralReviewClick(String(t.senderUserId), t.referralId), a7(aX({
                            surface: "PlusReferralLandingSheet",
                            entrypoint: "BuyRobuxPage",
                            referrerId: t.senderUserId
                        }), l);
                        return
                    }
                    c(!0)
                }
            }), (0, U.jsx)(aq.default, {
                invite: {
                    referrerId: String(t.senderUserId)
                },
                open: o,
                surface: aY.PlusReferralSurface.BuyRobuxPage,
                onOpenChange: c
            })]
        })
    }

    function is(e) {
        let {
            pendingTransfers: t,
            acceptTransfersTranslationKey: r,
            pendingReferrals: n,
            shouldDeeplinkToReferral: a
        } = e, i = (0, er.useTranslations)("Feature.BuyRobux");
        return (0, U.jsxs)(as.SheetContent, {
            centerSheetSize: "Medium",
            closeLabel: "Close",
            largeScreenVariant: "center",
            children: [(0, U.jsx)(as.SheetTitle, {
                children: i("Heading.ReviewPendingRequests", void 0, "Review pending requests")
            }), (0, U.jsx)(as.SheetBody, {
                children: (0, U.jsxs)("div", {
                    className: "flex flex-col gap-xsmall padding-bottom-xlarge overflow-y-auto",
                    style: {
                        maxHeight: "60vh"
                    },
                    children: [r && t.length > 0 ? (0, U.jsx)(ia, {
                        acceptTransfersTranslationKey: r,
                        pendingTransfers: t
                    }) : null, n.map(e => (0, U.jsx)(ii, {
                        referral: e,
                        shouldDeeplinkToReferral: a
                    }, e.referralId))]
                })
            })]
        })
    }

    function il(e) {
        let [t, r] = (0, L.useState)({}), n = (0, L.useRef)(t);
        return n.current = t, (0, L.useEffect)(() => {
            let t = e.map(e => "contentId" in e ? e.contentId : e.id).filter(e => !(e in n.current));
            if (0 === t.length) return;
            let a = t.map(e => ({
                format: "png",
                includeProfileFrame: !0,
                requestId: e,
                size: "48x48",
                targetId: e,
                type: "AvatarHeadshot"
            }));
            (async () => {
                let e = await eM(a);
                if (!e?.data) return;
                let t = {};
                for (let r of e.data) r.state === eA.Completed && (t[r.targetId] = r.imageUrl);
                r(e => ({
                    ...e,
                    ...t
                }))
            })()
        }, [e]), t
    }

    function io(e) {
        let {
            countLabel: t
        } = e;
        return (0, U.jsxs)(L.Fragment, {
            children: [(0, U.jsxs)("span", {
                className: "relative flex shrink-0 items-center justify-center",
                children: [(0, U.jsx)("span", {
                    className: "radius-circle absolute size-[11px] bg-[var(--color-extended-gray-100)]",
                    "data-testid": "info-mark-disc"
                }), (0, U.jsx)(B.Icon, {
                    className: "content-system-emphasis relative",
                    name: "icon-filled-circle-i",
                    size: "Medium"
                })]
            }), (0, U.jsx)("span", {
                className: "text-label-medium content-emphasis",
                children: t
            })]
        })
    }

    function ic(e) {
        let {
            referral: t,
            handle: r
        } = e, n = (0, er.useTranslations)("Feature.RobloxSubscription"), a = il((0, L.useMemo)(() => [{
            id: t.senderUserId
        }], [t.senderUserId]));
        return (0, U.jsxs)(L.Fragment, {
            children: [(0, U.jsx)(a1, {
                className: "bg-shift-200",
                displayName: r,
                size: "XSmall",
                thumbnailUrl: a[t.senderUserId]
            }), (0, U.jsx)("span", {
                className: "text-label-medium content-emphasis text-truncate-end",
                children: n.has("Label.ReferralPendingRequestSummary") ? n("Label.ReferralPendingRequestSummary", {
                    displayName: r
                }) : `${r} referred you`
            })]
        })
    }

    function iu(e) {
        let {
            pendingTransfers: t,
            totalRobux: r
        } = e, n = (0, er.useTranslations)("Feature.BuyRobux"), a = 1 === t.length ? "Label.PendingTransfersSummary.Singular" : "Label.PendingTransfersSummary.Plural";
        return (0, U.jsxs)(L.Fragment, {
            children: [(0, U.jsx)(a3, {
                pendingTransfers: t
            }), (0, U.jsx)("span", {
                className: "text-label-medium content-emphasis",
                children: n(a, {
                    count: (0, tM.formatNumber)(t.length),
                    robux: (0, tM.formatNumber)(r)
                })
            })]
        })
    }

    function id(e) {
        let {
            transfers: t,
            pendingReferrals: r,
            shouldDeeplinkToReferral: n
        } = e, a = (0, er.useTranslations)("Feature.BuyRobux"), i = (0, er.useTranslations)("Feature.RobloxSubscription"), {
            translateFullKey: s
        } = (0, er.useFullKeyTranslations)(), {
            trackPendingTransfersImpression: l,
            trackPendingTransfersSheetView: o
        } = (0, L.useContext)(eR), {
            deviceMeta: c
        } = (0, L.useContext)(ec), [u, d] = (0, L.useState)(!1), [m, p] = (0, L.useState)(!1), h = (0, L.useMemo)(() => t?.pendingTransfers ?? [], [t]), f = 0 === h.length ? r.at(0) : void 0, {
            handle: g,
            isLoading: x
        } = (0, aZ.useReferrerHandle)(f ? String(f.senderUserId) : void 0);
        (0, L.useEffect)(() => {
            h.length > 0 && l()
        }, [h, l]), (0, L.useEffect)(() => {
            let e = r.at(0);
            void 0 !== e && aJ.default.buyRobuxReferralImpression(String(e.senderUserId), e.referralId)
        }, [r]);
        let b = e => {
                e && h.length > 0 && o(), d(e)
            },
            y = (0, L.useMemo)(() => h.reduce((e, t) => e + Number(t.netTransferRobuxAmount), 0), [h]),
            v = h.length + r.length;
        if (0 === v || void 0 !== f && x) return null;
        let S = void 0 !== g ? f : void 0,
            P = h.length > 0 && 0 === r.length,
            C = (0, tM.formatNumber)(v),
            E = a(1 === v ? "Label.PendingRequestsSummary.Singular" : "Label.PendingRequestsSummary.Plural", {
                count: C
            }, 1 === v ? `${C} pending request` : `${C} pending requests`),
            w = () => {
                if (n && 0 === h.length) {
                    let e = r.at(0);
                    if (void 0 !== e) {
                        aJ.default.buyRobuxReferralReviewClick(String(e.senderUserId), e.referralId), a7(aX({
                            surface: "PlusReferralLandingSheet",
                            entrypoint: "BuyRobuxPage",
                            referrerId: e.senderUserId
                        }), c);
                        return
                    }
                }
                if (void 0 !== S) {
                    aJ.default.buyRobuxReferralReviewClick(String(S.senderUserId), S.referralId), p(!0);
                    return
                }
                let e = r.at(0);
                void 0 !== e && aJ.default.buyRobuxReferralReviewClick(String(e.senderUserId), e.referralId), b(!0)
            };
        return (0, U.jsxs)(L.Fragment, {
            children: [(0, U.jsxs)("div", {
                className: `flex flex-row items-center justify-between gap-small width-full${P?" medium:justify-end":""}`,
                children: [(0, U.jsx)("div", {
                    className: "flex flex-row items-center gap-small min-width-0",
                    children: P ? (0, U.jsx)(iu, {
                        pendingTransfers: h,
                        totalRobux: y
                    }) : void 0 === S ? (0, U.jsx)(io, {
                        countLabel: E
                    }) : (0, U.jsx)(ic, {
                        handle: g ?? "",
                        referral: S
                    })
                }), P && (0, U.jsx)("span", {
                    className: "content-default none medium:block",
                    children: "•"
                }), (0, U.jsx)("a", {
                    className: "text-title-medium text-link underline cursor-pointer shrink-0",
                    onClick: w,
                    onKeyDown: e => {
                        "Enter" === e.key && (e.preventDefault(), w())
                    },
                    role: "button",
                    tabIndex: 0,
                    children: P && t ? s(t.acceptTransfersTranslationKey) : i("Action.Review", void 0, "Review")
                })]
            }), P && t ? (0, U.jsx)(as.SheetRoot, {
                open: u,
                onOpenChange: b,
                children: (0, U.jsx)(ir, {
                    pendingTransfers: h,
                    acceptTransfersTranslationKey: t.acceptTransfersTranslationKey
                })
            }) : void 0 === S ? (0, U.jsx)(as.SheetRoot, {
                open: u,
                onOpenChange: b,
                children: (0, U.jsx)(is, {
                    pendingTransfers: h,
                    acceptTransfersTranslationKey: t?.acceptTransfersTranslationKey,
                    pendingReferrals: r,
                    shouldDeeplinkToReferral: n
                })
            }) : (0, U.jsx)(aq.default, {
                invite: {
                    referrerId: String(S.senderUserId)
                },
                open: m,
                surface: aY.PlusReferralSurface.BuyRobuxPage,
                onOpenChange: p
            })]
        })
    }

    function im(e) {
        let {
            iconSize: t,
            textClassName: r
        } = e, {
            robuxBalance: n
        } = (0, L.useContext)(ec);
        return "number" != typeof n ? null : (0, U.jsxs)(L.Fragment, {
            children: [(0, U.jsx)(B.Icon, {
                name: "icon-filled-robux",
                size: t
            }), (0, U.jsx)("span", {
                className: (0, r8.default)("font-builder-extended content-action-standard", r),
                children: (0, tM.formatNumber)(n)
            })]
        })
    }
    var ip = e.i(932598);
    let ih = async (e, t) => eT(eN.GET, ek.USER_SEARCH, {
        url: `${ei.EnvironmentUrls.apiGatewayUrl}/search-api/omni-search`,
        withCredentials: !0
    }, {
        verticalType: "user",
        searchQuery: e,
        sessionId: t,
        globalSessionId: t
    }), ig = [];
    var ix = e.i(941918),
        ib = e.i(986592),
        iy = e.i(556010);
    let iv = {
            XSmall: "padding-x-small",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-medium"
        },
        iS = {
            XSmall: "gap-x-xsmall",
            Small: "gap-x-small",
            Medium: "gap-x-small",
            Large: "gap-x-small"
        },
        iP = {
            XSmall: "height-600",
            Small: "height-800",
            Medium: "height-1000",
            Large: "height-1200"
        },
        iC = {
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
        iE = {
            XSmall: ["text-body-small", "placeholder:text-body-small"],
            Small: ["text-body-small", "placeholder:text-body-small"],
            Medium: ["text-body-medium", "placeholder:text-body-medium"],
            Large: ["text-body-large", "placeholder:text-body-large"]
        },
        iw = "Large",
        iN = (0, L.forwardRef)((e, t) => {
            let {
                label: r,
                leadingIconName: n,
                trailingIconName: a,
                leadingIconNode: i,
                trailingIconNode: s,
                hasError: l,
                error: o,
                helperText: c,
                size: u = iw,
                variant: d = "Standard",
                shape: m = "Rounded",
                isRequired: p,
                isDisabled: h,
                className: f,
                style: g,
                inputContainerClassName: x,
                inputContainerStyle: b,
                id: y,
                placeholder: v = "Search",
                ...S
            } = e, P = (0, G.default)(), C = y || P, E = `${C}-description`, w = u ?? iw, N = l || !!o, k = o || c, T = n ?? (void 0 === i ? "icon-regular-magnifying-glass" : void 0), j = (0, L.useMemo)(() => T ? L.default.createElement(B.Icon, {
                name: T,
                size: w,
                className: "content-emphasis",
                "data-testid": "search-input-leading-icon"
            }) : i, [T, i, w]), A = (0, L.useMemo)(() => a ? L.default.createElement(B.Icon, {
                name: a,
                size: w,
                className: "content-emphasis",
                "data-testid": "search-input-trailing-icon"
            }) : s, [w, a, s]);
            return L.default.createElement("div", {
                "data-testid": "search-input-wrapper",
                className: (0, W.default)("flex width-full flex-col gap-small", f, {
                    [ib.disabledOpacity]: h
                }),
                style: g
            }, r && L.default.createElement("label", {
                htmlFor: C,
                className: (0, W.default)("text-title-small content-emphasis")
            }, r, p && L.default.createElement(L.default.Fragment, null, " ", L.default.createElement("span", {
                className: "content-default"
            }, "*"))), L.default.createElement("div", {
                "data-testid": "search-input-container",
                className: (0, W.default)("foundation-web-input flex items-center width-full", !h && "relative clip group/interactable focus-visible:outline-focus disabled:outline-none", iy.INPUT_STROKE_BY_VARIANT[d], iy.INPUT_BACKGROUND_BY_VARIANT[d], x, iP[w], iC[m][w], iv[w], iS[w], N ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis"),
                style: b
            }, L.default.createElement(ix.StateLayer, {
                className: "pointer-events-none"
            }), j && L.default.createElement("div", {
                className: "flex shrink-0 items-center"
            }, j), L.default.createElement("input", {
                type: "search",
                id: C,
                ref: t,
                placeholder: v,
                className: (0, W.default)("width-full min-width-0 padding-none bg-none stroke-none outline-none content-emphasis placeholder:content-muted [appearance:none]", iE[w], "[&::-webkit-search-cancel-button]:hidden [&::-webkit-search-decoration]:hidden [&::-webkit-search-results-button]:hidden [&::-webkit-search-results-decoration]:hidden"),
                "aria-invalid": N,
                "aria-describedby": k ? E : void 0,
                required: p,
                disabled: h,
                ...S
            }), A && L.default.createElement("div", {
                className: "flex shrink-0 items-center",
                "data-testid": "search-input-trailing-accessory"
            }, A)), k && L.default.createElement("span", {
                id: E,
                className: (0, W.default)("text-caption-small", {
                    "content-system-alert": N,
                    "content-default": !N
                })
            }, k))
        });

    function ik(e) {
        let {
            searchText: t,
            setSearchText: r,
            clearSearch: n
        } = e, a = (0, er.useTranslations)("Feature.BuyRobux")("Label.Search");
        return (0, U.jsx)(iN, {
            size: "Medium",
            shape: "Pill",
            className: "send-robux-search-input",
            name: "user-search",
            value: t,
            placeholder: a,
            leadingIconName: "icon-regular-magnifying-glass",
            maxLength: 30,
            autoComplete: "off",
            autoCorrect: "off",
            autoCapitalize: "off",
            spellCheck: !1,
            "data-1p-ignore": !0,
            "data-lpignore": "true",
            "data-form-type": "other",
            onChange: e => {
                r(e.target.value.replace(/\s+/g, ""))
            },
            onKeyDown: e => {
                "Escape" === e.key && (e.preventDefault(), n())
            },
            "aria-label": a
        })
    }
    iN.displayName = "SearchInput";
    var iT = e.i(361261),
        ij = e.i(177326),
        iA = e.i(809510);

    function iM(e) {
        let {
            friend: t,
            thumbnailUrl: r,
            onSelectUser: n,
            isFocused: a = !1
        } = e, i = (0, er.useTranslations)("Feature.RobloxSubscription"), s = () => {
            n({
                id: t.id
            })
        }, l = (0, ij.useIsPlusBadgeEnabled)() && !0 === t.isRobloxPlus;
        return (0, U.jsxs)("div", {
            className: (0, r8.default)("flex flex-row items-center gap-small padding-small width-full cursor-pointer shrink-0", a ? "bg-surface-300" : "bg-none"),
            style: {
                borderRadius: 12
            },
            onClick: s,
            onKeyDown: e => {
                ("Enter" === e.key || " " === e.key) && (e.preventDefault(), s())
            },
            role: "option",
            tabIndex: 0,
            "aria-selected": a,
            "aria-label": t.combinedName ?? "",
            children: [(0, U.jsx)("div", {
                className: "height-800 width-800 radius-circle clip shrink-0 bg-surface-300 flex items-center justify-center",
                children: r ? (0, U.jsx)("img", {
                    src: r,
                    alt: t.combinedName ?? "",
                    className: "height-full width-full object-cover"
                }) : (0, U.jsx)(B.Icon, {
                    name: "icon-regular-person",
                    size: "Small"
                })
            }), (0, U.jsxs)("div", {
                className: "flex flex-row items-center gap-xsmall",
                children: [(0, U.jsx)("span", {
                    className: "text-body-medium content-emphasis",
                    children: t.combinedName
                }), t.hasVerifiedBadge && (0, U.jsx)(rl, {
                    size: 12
                }), l && (0, U.jsx)(iT.DisplayNameBadges, {
                    isRobloxPlus: !0,
                    size: "Small",
                    plusBadgeAriaLabel: i(iA.PLUS_BADGE_ARIA_LABEL_KEY, void 0, iA.PLUS_BADGE_ARIA_LABEL)
                })]
            })]
        })
    }
    var iR = e.i(992228);

    function iI(e) {
        let {
            displayName: t,
            username: r,
            thumbnailUrl: n,
            badges: a,
            isFocused: i = !1,
            onSelect: s
        } = e, l = r ? `@${r}` : void 0;
        return (0, U.jsxs)("div", {
            className: (0, r8.default)("flex flex-row items-center gap-medium padding-x-none send-robux-user-row width-full cursor-pointer shrink-0 radius-medium", i ? "bg-surface-300" : "bg-none", !i && "hover:bg-shift-200"),
            onClick: s,
            onKeyDown: e => {
                ("Enter" === e.key || " " === e.key) && (e.preventDefault(), s())
            },
            role: "option",
            tabIndex: 0,
            "aria-selected": i,
            "aria-label": l ? `${t} ${l}` : t,
            children: [(0, U.jsx)(iR.Avatar, {
                src: n,
                alt: t,
                size: "Large",
                className: "bg-shift-200"
            }), (0, U.jsxs)("div", {
                className: "flex flex-col min-width-0 width-full padding-y-xsmall",
                "data-testid": "user-row-text",
                children: [(0, U.jsxs)("span", {
                    className: "inline-flex items-center gap-xsmall content-emphasis min-width-0 width-full clip",
                    "data-testid": "user-row-name",
                    children: [(0, U.jsx)("span", {
                        className: "min-width-0 text-title-medium text-truncate-end text-no-wrap",
                        children: t
                    }), a]
                }), l && (0, U.jsx)("span", {
                    className: "text-body-medium content-default text-truncate-end text-no-wrap width-full",
                    children: l
                })]
            })]
        })
    }

    function iU(e) {
        let {
            friend: t,
            thumbnailUrl: r,
            onSelectUser: n
        } = e, a = (0, er.useTranslations)("Feature.RobloxSubscription"), i = (0, ij.useIsPlusBadgeEnabled)() && !0 === t.isRobloxPlus, s = [t.hasVerifiedBadge ? (0, U.jsx)(rl, {
            size: 12
        }, "verified") : null, i ? (0, U.jsx)(iT.DisplayNameBadges, {
            isRobloxPlus: !0,
            size: "Small",
            plusBadgeAriaLabel: a(iA.PLUS_BADGE_ARIA_LABEL_KEY, void 0, iA.PLUS_BADGE_ARIA_LABEL)
        }, "roblox-plus") : null];
        return (0, U.jsx)(iI, {
            displayName: t.combinedName ?? "",
            thumbnailUrl: r,
            badges: s,
            onSelect: () => {
                n({
                    id: t.id
                })
            }
        })
    }

    function i_(e) {
        let {
            friends: t,
            isLoading: r,
            error: n,
            ariaLabel: a,
            onSelectUser: i,
            showEmptyState: s = !0,
            rowVariant: l = "Dropdown",
            useInternalScroll: o = !0
        } = e, c = (0, er.useTranslations)("Feature.BuyRobux"), u = il(t), d = (0, r8.default)("flex flex-col", o && "overflow-y-auto hide-scrollbar friends-listbox-cap");
        return s && (n || !r && 0 === t.length) ? (0, U.jsx)("div", {
            className: "flex items-center justify-center padding-medium",
            children: (0, U.jsx)("span", {
                className: "text-body-medium content-muted",
                children: c("EmptyState.NoFriends")
            })
        }) : r || 0 !== t.length ? r ? (0, U.jsx)("div", {
            className: (0, r8.default)(d, "gap-small"),
            role: "listbox",
            "aria-label": a,
            children: (0, U.jsxs)("div", {
                className: "flex flex-row items-center gap-small padding-small",
                "aria-busy": "true",
                children: [(0, U.jsx)("div", {
                    className: (0, r8.default)("radius-circle shrink-0", "InlineFilter" === l ? "height-1200 width-1200 bg-shift-200" : "height-800 width-800 bg-surface-300")
                }), (0, U.jsx)("div", {
                    className: "height-xsmall width-full bg-surface-300 radius-medium"
                })]
            })
        }) : (0, U.jsx)("div", {
            className: d,
            role: "listbox",
            "aria-label": a,
            children: t.map(e => "InlineFilter" === l ? (0, U.jsx)(iU, {
                friend: e,
                thumbnailUrl: u[e.id],
                onSelectUser: i
            }, e.id) : (0, U.jsx)(iM, {
                friend: e,
                thumbnailUrl: u[e.id],
                onSelectUser: i
            }, e.id))
        }) : null
    }
    var iF = e.i(888104);
    e.i(350223);
    var iL = e.i(874296),
        iD = e.i(646424),
        iB = e.i(587541);
    let iO = iL.object({
            profileDetails: iL.nullish(iL.array(iL.looseObject({
                userId: iL.number(),
                hasRobloxSubscription: iL.nullish(iL.boolean())
            })))
        }),
        iG = async e => {
            let t = [...new Set(e)];
            if (0 === t.length) return {};
            let r = iB.Url.parse(ei.default.apiGatewayUrl).getOrThrow().withPath("/user-profile-api/v1/user/profiles/get-profiles"),
                n = await iD.post(r, {
                    userIds: t,
                    fields: [iA.PLUS_PROFILE_FIELD]
                }, iO, {
                    credentials: "include",
                    headers: {
                        Accept: "application/json"
                    },
                    retry: iD.defaultBrowserRetryDelay
                }),
                a = {};
            for (let e of n.getOrThrow().profileDetails ?? []) a[e.userId] = !0 === e.hasRobloxSubscription;
            return a
        }, iz = new Map, iV = !1, iW = async () => {
            let e = iz;
            if (iz = new Map, iV = !1, 0 === e.size) return;
            let t = [...e.keys()];
            try {
                let r = await iG(t);
                for (let n of t)
                    for (let {
                            resolve: t
                        }
                        of e.get(n) ?? []) t(!0 === r[n])
            } catch (r) {
                for (let n of t)
                    for (let {
                            reject: t
                        }
                        of e.get(n) ?? []) t(r)
            }
        };

    function iK(e) {
        var t;
        let r, n, a, i, s, {
                users: l,
                onSelectUser: o,
                hasSectionAbove: c = !1
            } = e,
            u = (0, er.useTranslations)("Feature.RobloxSubscription"),
            d = (0, er.useTranslations)("Feature.BuyRobux"),
            m = u(iA.PLUS_BADGE_ARIA_LABEL_KEY),
            p = il(l),
            {
                data: h
            } = (t = (0, L.useMemo)(() => l.map(e => e.contentId), [l]), r = (0, ij.useIsPlusBadgeEnabled)(), n = (0, L.useMemo)(() => [...new Set(t)].sort((e, t) => e - t), [t]), a = (0, iF.useQueries)({
                queries: n.map(e => ({
                    queryKey: ["identity-badges/plusStatus/byUser", e],
                    queryFn: () => new Promise((t, r) => {
                        let n = iz.get(e) ?? [];
                        n.push({
                            resolve: t,
                            reject: r
                        }), iz.set(e, n), iV || (iV = !0, queueMicrotask(() => {
                            iW().catch(() => void 0)
                        }))
                    }),
                    enabled: r,
                    staleTime: 1 / 0
                }))
            }), i = {}, s = !1, n.forEach((e, t) => {
                i[e] = a[t]?.data === !0, a[t]?.isFetching && (s = !0)
            }), {
                data: i,
                isLoading: s
            }),
            f = (0, L.useCallback)(e => {
                ey("UserSearchUserSelected"), o(e)
            }, [o]);
        if (0 === l.length) return null;
        let g = d("Label.PeopleWithCount", {
            count: l.length
        });
        return (0, U.jsxs)("div", {
            className: (0, r8.default)("flex flex-col", c && "padding-top-large"),
            "data-testid": "people-search-results",
            children: [(0, U.jsx)("h2", {
                className: "text-title-large content-emphasis bg-surface-100 send-robux-section-heading",
                style: {
                    position: "sticky",
                    top: 0,
                    zIndex: 1
                },
                children: g
            }), (0, U.jsx)("div", {
                role: "listbox",
                "aria-label": g,
                children: l.map(e => {
                    let t = [e.hasVerifiedBadge ? (0, U.jsx)(rl, {
                        size: 12
                    }, "verified") : null, !0 === h[e.contentId] ? (0, U.jsx)(iT.DisplayNameBadges, {
                        isRobloxPlus: !0,
                        size: "Small",
                        plusBadgeAriaLabel: m
                    }, "roblox-plus") : null];
                    return (0, U.jsx)(iI, {
                        displayName: e.displayName,
                        username: e.username,
                        thumbnailUrl: p[e.contentId],
                        badges: t,
                        onSelect: () => {
                            f(e)
                        }
                    }, e.contentId)
                })
            })]
        })
    }
    let iH = e => e.trim().toLowerCase().replace(/\s+/g, "");

    function iQ(e) {
        let {
            friends: t,
            isLoading: r,
            error: n,
            isLoggedIn: a,
            onSelectUser: i
        } = e, s = (0, er.useTranslations)("Feature.BuyRobux"), l = (0, ea.getCurrentUser)(), o = void 0 === l ? void 0 : (0, ea.userIdToNumber)(l.id), {
            searchText: c,
            setSearchText: u,
            users: d,
            isSearching: m,
            clearSearch: p
        } = function() {
            let {
                maxResults: e = 3,
                excludedUserIds: t = ig,
                invalidateRequestOnClear: r = !1
            } = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}, [n, a] = (0, L.useState)(""), i = (0, nv.useDebounce)(n, 500), [s, l] = (0, L.useState)([]), [o, c] = (0, L.useState)(!1), u = (0, L.useRef)(""), d = (0, L.useMemo)(() => (0, ip.generateRandomUuid)(), []);
            (0, L.useEffect)(() => {
                n !== i && c(!0)
            }, [n, i]);
            let m = (0, L.useCallback)(() => {
                    r && (u.current = ""), a(""), l([])
                }, [r]),
                p = (0, L.useCallback)(async n => {
                    let a = n.trim();
                    if (a.length < 3) {
                        r && (u.current = ""), l([]), c(!1);
                        return
                    }
                    let i = (0, ip.generateRandomUuid)();
                    u.current = i;
                    try {
                        c(!0), ey("UserSearchStarted");
                        let r = await ih(a, d);
                        if (u.current !== i) return;
                        let n = r?.searchResults[0]?.contents.filter(e => !t.includes(e.contentId)).slice(0, e) ?? [];
                        l(n), void 0 !== r && 0 === n.length && ey("UserSearchNoResults")
                    } finally {
                        u.current === i && c(!1)
                    }
                }, [t, r, e, d]);
            return (0, L.useEffect)(() => {
                p(i)
            }, [i, p]), {
                searchText: n,
                setSearchText: a,
                users: s,
                isSearching: o,
                clearSearch: m
            }
        }({
            maxResults: 25,
            excludedUserIds: (0, L.useMemo)(() => void 0 !== o && o > 0 ? [o] : [], [o]),
            invalidateRequestOnClear: !0
        }), h = iH(c), f = h.length > 0, g = (0, L.useMemo)(() => new Set(m ? [] : d.map(e => e.contentId)), [m, d]), x = (0, L.useMemo)(() => f ? t.filter(e => iH(e.combinedName ?? "").includes(h) || g.has(e.id)) : t, [t, f, h, g]), b = (0, L.useMemo)(() => new Set(t.map(e => e.id)), [t]), y = (0, L.useMemo)(() => d.filter(e => !b.has(e.contentId)), [b, d]), v = (0, L.useCallback)(e => {
            i({
                userId: e.contentId,
                context: "search"
            })
        }, [i]), S = {
            count: x.length
        }, P = a ? s("Label.MyFriendsWithCount", S) : "", C = a && (r || x.length > 0), E = h.length >= 3 && !m && !r && 0 === x.length && 0 === y.length;
        return (0, U.jsxs)(L.default.Fragment, {
            children: [(0, U.jsx)("div", {
                className: "send-robux-search-row shrink-0 bg-surface-100 padding-x-xlarge padding-top-xsmall padding-bottom-large",
                "data-testid": "send-robux-search-row",
                children: (0, U.jsx)(ik, {
                    searchText: c,
                    setSearchText: u,
                    clearSearch: p
                })
            }), (0, U.jsx)(as.SheetBody, {
                className: "hide-scrollbar clip-x send-robux-sheet-body-inset",
                children: (0, U.jsxs)("div", {
                    className: "flex flex-col padding-bottom-large",
                    children: [C && (0, U.jsxs)("div", {
                        className: "flex flex-col",
                        "data-testid": "send-robux-friends-section",
                        children: [(0, U.jsx)("h2", {
                            className: "text-title-large content-emphasis bg-surface-100 send-robux-section-heading",
                            style: {
                                position: "sticky",
                                top: 0,
                                zIndex: 1
                            },
                            children: P
                        }), (0, U.jsx)(i_, {
                            friends: x,
                            isLoading: r,
                            error: n,
                            ariaLabel: P,
                            showEmptyState: !1,
                            rowVariant: "InlineFilter",
                            useInternalScroll: !1,
                            onSelectUser: e => {
                                i({
                                    userId: e.id,
                                    context: "friends_list"
                                })
                            }
                        })]
                    }), !m && f && (0, U.jsx)(iK, {
                        users: y,
                        onSelectUser: v,
                        hasSectionAbove: C
                    }), E && (0, U.jsx)("div", {
                        className: "flex items-center justify-center padding-medium",
                        role: "status",
                        "aria-live": "polite",
                        children: (0, U.jsx)("span", {
                            className: "text-body-medium content-muted",
                            children: s("Label.NoResultsFound")
                        })
                    })]
                })
            })]
        })
    }
    var i$ = e.i(10224);
    let iq = async e => {
        let t = {
                url: `${ei.default.friendsApi}/v1/users/${e}/friends/online`,
                retryable: !0,
                withCredentials: !0
            },
            {
                data: r
            } = await i$.get(t);
        return r
    }, iY = async (e, t) => {
        let r = `${ei.default.friendsApi}/v1/users/${e}/friends/find`,
            n = {
                url: t ? `${r}?userSort=1` : r,
                retryable: !0,
                withCredentials: !0
            },
            {
                data: a
            } = await i$.get(n);
        return a
    }, iX = async e => {
        let t = {
                url: `${ei.default.apiGatewayUrl}/user-profile-api/v1/user/profiles/get-profiles`,
                retryable: !0,
                withCredentials: !0
            },
            {
                data: r
            } = await i$.post(t, {
                userIds: e,
                fields: ["names.combinedName", "isVerified", "hasRobloxSubscription"]
            });
        return r
    }, iJ = async (e, t) => {
        if (!t) return [];
        try {
            let {
                data: t
            } = await iq(e);
            return t
        } catch (e) {
            return console.error("Error fetching online friends:", e), []
        }
    }, iZ = async (e, t) => {
        try {
            let {
                PageItems: r
            } = await iY(e, t);
            return r
        } catch (e) {
            return console.error("Error fetching friends:", e), []
        }
    }, i0 = async (e, t) => {
        let [r, n] = await Promise.all([iJ(e, t), iZ(e, t)]);
        r.sort((e, t) => t.sortScore - e.sortScore);
        let a = new Map;
        for (let e of r) a.set(e.id, e.userPresence);
        let i = r.map(e => e.id),
            s = n.filter(e => !i.includes(e.id)).map(e => e.id),
            l = [...i, ...s];
        if (0 === l.length) return [];
        let o = new Map((await iX(l)).profileDetails.map(e => [e.userId, e])),
            c = [];
        return l.forEach(e => {
            let t = a.has(e),
                r = {
                    isOnline: t,
                    isInGame: t && a.get(e)?.UserPresenceType === "InGame",
                    lastLocation: t ? a.get(e)?.lastLocation : void 0,
                    gameId: t ? a.get(e)?.gameInstanceId : void 0,
                    universeId: t ? a.get(e)?.universeId : void 0,
                    placeId: t ? a.get(e)?.placeId : void 0
                },
                n = o.get(e);
            c.push({
                id: e,
                combinedName: n?.names.combinedName,
                presence: r,
                hasVerifiedBadge: n?.isVerified ?? !1,
                isRobloxPlus: n?.hasRobloxSubscription === !0
            })
        }), c
    };

    function i1() {
        let {
            robuxBalance: e
        } = (0, L.useContext)(ec);
        return null == e ? null : (0, U.jsxs)("div", {
            className: "flex flex-row items-center gap-xsmall",
            children: [(0, U.jsx)(B.Icon, {
                name: "icon-regular-robux",
                size: "Small"
            }), (0, U.jsx)("span", {
                className: "text-label-medium content-emphasis",
                children: (0, tM.formatNumber)(e)
            })]
        })
    }

    function i2() {
        let e = (0, er.useTranslations)("Feature.BuyRobux"),
            {
                trackTransferSendUserSelected: t
            } = (0, L.useContext)(eR),
            {
                deviceMeta: r
            } = (0, L.useContext)(ec),
            {
                friends: n,
                isLoading: a,
                error: i,
                isLoggedIn: s
            } = function() {
                let [e, t] = (0, L.useState)([]), [r, n] = (0, L.useState)(!0), [a, i] = (0, L.useState)(null), s = (0, ea.getCurrentUser)()?.id, l = void 0 !== s;
                return (0, L.useEffect)(() => {
                    if (void 0 === s) return void n(!1);
                    let e = {
                        cancelled: !1
                    };
                    return (async () => {
                        ey("GetMyFriends_API", {
                            status: "Throughput"
                        });
                        try {
                            let r = await i0((0, ea.userIdToNumber)(s), !0);
                            ey("GetMyFriends_API", {
                                status: "200"
                            }), e.cancelled || t(r)
                        } catch (r) {
                            let t = r instanceof Error ? r : Error(String(r));
                            ((0, eh.captureException)(t), "object" == typeof r && null !== r && ("response" in r || "status" in r)) ? ey("GetMyFriends_API", {
                                status: (r.response?.status ?? r.status)?.toString() ?? "UnknownError"
                            }): ey("GetMyFriends_API", {
                                status: "UnknownError"
                            }), e.cancelled || i(t)
                        } finally {
                            e.cancelled || n(!1)
                        }
                    })(), () => {
                        e.cancelled = !0
                    }
                }, [l, s]), {
                    friends: e,
                    isLoading: r,
                    error: a,
                    isLoggedIn: l
                }
            }(),
            l = (0, L.useCallback)(e => {
                let {
                    userId: n,
                    context: a
                } = e;
                t(a), ey("SendTransferDeepLink"), a7(ie({
                    direction: "send",
                    userid: String(n),
                    transferorigination: "buyRobux"
                }), r)
            }, [r, t]);
        return (0, U.jsxs)(as.SheetContent, {
            centerSheetSize: "Medium",
            closeLabel: "Close",
            largeScreenVariant: "center",
            mobilePortraitClassName: "![height:92vh] ![max-height:92vh] ![padding-bottom:env(safe-area-inset-bottom)]",
            children: [(0, U.jsx)(as.SheetTitle, {
                className: "relative bg-surface-100 shrink-0 [z-index:6] ![padding-top:11px]",
                utilities: (0, U.jsx)(i1, {}),
                children: (0, U.jsxs)("div", {
                    className: "flex flex-row items-center gap-xsmall",
                    children: [(0, U.jsx)(B.Icon, {
                        name: "icon-regular-roblox-plus",
                        size: "Large"
                    }), e("Heading.SendRobux")]
                })
            }), (0, U.jsx)(iQ, {
                friends: n,
                isLoading: a,
                error: i,
                isLoggedIn: s,
                onSelectUser: l
            })]
        })
    }

    function i3(e) {
        let {
            translationKey: t,
            className: r,
            size: n = "Medium"
        } = e, {
            translateFullKey: a
        } = (0, er.useFullKeyTranslations)(), [i, s] = (0, L.useState)(!1), {
            trackTransferSendImpression: l,
            trackTransferSendSheetView: o
        } = (0, L.useContext)(eR), c = !!(0, ea.getCurrentUser)()?.id, u = (0, L.useCallback)(e => {
            e && o(), s(e)
        }, [o]);
        (0, L.useEffect)(() => {
            l()
        }, [l]);
        let d = (0, L.useCallback)(e => {
                eS("SendRobuxButtonReactCrash", null, e)
            }, []),
            m = (0, L.useCallback)(() => {
                if (!c) {
                    if (void 0 === J.window) return;
                    let e = `${J.window.location.pathname}${J.window.location.search}`;
                    J.window.location.href = `/login?ReturnUrl=${encodeURIComponent(e)}`;
                    return
                }
                u(!0)
            }, [c, u]);
        return (0, U.jsxs)(tf, {
            onError: d,
            children: [(0, U.jsx)(O.Button, {
                className: r,
                icon: "icon-regular-arrow-up-from-line",
                size: n,
                variant: "Standard",
                onClick: m,
                children: a(t)
            }), (0, U.jsx)(as.SheetRoot, {
                open: i,
                onOpenChange: u,
                children: (0, U.jsx)(i2, {})
            })]
        })
    }
    let i5 = "sticky medium:static top-[env(safe-area-inset-top)] medium:top-[auto] margin-top-[env(safe-area-inset-top)] [z-index:10] flex flex-col self-stretch medium:self-end medium:margin-top-[16px] medium:margin-right-[16px]",
        i4 = "flex flex-col gap-large bg-surface-100 padding-y-medium padding-x-large small:padding-x-xlarge self-stretch";

    function i8(e) {
        let {
            transfersSection: t,
            robuxGiftSection: r
        } = e, {
            robuxGifting: {
                openModal: n
            }
        } = (0, L.useContext)(ty), {
            trackRobuxGiftClick: a
        } = (0, L.useContext)(eR), {
            deviceMeta: i
        } = (0, L.useContext)(ec), s = eU(i), {
            translateFullKey: l
        } = (0, er.useFullKeyTranslations)(), {
            pendingReferrals: o
        } = (() => {
            let e = (0, aW.isReferralEnabled)() && null !== (0, aK.userId)() && !(0, aK.isBlackbirdUser)(),
                {
                    data: t,
                    isLoading: r
                } = (0, aV.useQuery)({
                    queryKey: ["plus-referrals", "pending"],
                    enabled: e,
                    queryFn: async () => {
                        let {
                            referrals: e
                        } = await aQ("PendingPlusReferrals", () => aH.subscriptionsV2Api.subscriptionsV2ListSubscriptionReferrals({
                            status: ny.SubscriptionReferralStatus.NUMBER_1,
                            pageSize: 5
                        }));
                        return e
                    }
                }),
                n = t ?? a$;
            return {
                pendingReferrals: n,
                latestPendingReferral: n.at(0),
                isLoading: e && r
            }
        })(), c = (0, aV.useQuery)({
            queryKey: ["guac/app-policy"],
            queryFn: rO,
            staleTime: 1 / 0,
            enabled: s
        }), u = s && c.data?.ShouldDeeplinkToReferral === !0, d = s && !u ? [] : o, m = t?.transfers, p = r?.robuxGift, h = !!m?.pendingTransfers?.length || d.length > 0, f = h ? (0, U.jsx)("div", {
            className: "flex padding-y-medium padding-x-medium medium:padding-x-large self-stretch radius-medium justify-center bg-shift-100 stroke-standard stroke-default",
            children: (0, U.jsx)(id, {
                transfers: m,
                pendingReferrals: d,
                shouldDeeplinkToReferral: u
            })
        }) : null;
        return m ? (0, U.jsx)("div", {
            ...e$(t),
            className: i5,
            children: (0, U.jsxs)("div", {
                className: (0, r8.default)(i4, {
                    "medium:radius-medium": h,
                    "medium:radius-circle": !h
                }),
                children: [(0, U.jsxs)("div", {
                    className: (0, r8.default)("flex flex-row items-center gap-large medium:padding-left-none justify-between medium:justify-end", {
                        "padding-left-[58px]": s
                    }),
                    children: [(0, U.jsx)("div", {
                        className: "flex flex-row justify-center items-center gap-xsmall medium:padding-left-none",
                        children: (0, U.jsx)(im, {
                            iconSize: "Large",
                            textClassName: "text-title-large [font-size:var(--font-size-500)] medium:[font-size:var(--font-size-600)]"
                        })
                    }), (0, U.jsxs)("div", {
                        className: "flex flex-row gap-small",
                        children: [(0, U.jsx)(i3, {
                            translationKey: m.sendButtonTextTranslationKey,
                            className: "text-label-medium content-action-standard shrink-0 [padding-right:12px]",
                            size: "Small"
                        }), p && (0, U.jsx)(O.Button, {
                            ...e$(r),
                            className: "text-label-medium content-action-standard shrink-0 [padding-right:12px]",
                            icon: "icon-regular-arrow-down-to-line",
                            size: "Small",
                            variant: "Standard",
                            onClick: () => {
                                a(), n()
                            },
                            children: l(p.buttonTextTranslationKey)
                        })]
                    })]
                }), f]
            })
        }) : f ? (0, U.jsx)("div", {
            className: i5,
            children: (0, U.jsx)("div", {
                className: (0, r8.default)(i4, "medium:radius-medium"),
                children: f
            })
        }) : null
    }

    function i6(e) {
        let {
            isPrimary: t,
            sectionBase: r,
            redirectOptions: n
        } = e, {
            translateFullKey: a
        } = (0, er.useFullKeyTranslations)(), {
            purchaseProduct: i
        } = (0, L.useContext)(rC), {
            atLeastOneProductHasBonusAmount: s,
            redirect: l
        } = (0, L.useContext)(ec), o = np(n.promotionExpirationTimestampMs), c = (0, L.useMemo)(() => ni(l?.url ?? ""), [l?.url]);
        return (0, U.jsxs)(r6, {
            ...e$(r),
            children: [(0, U.jsxs)("div", {
                className: "flex flex-col gap-xsmall self-stretch",
                children: [(0, U.jsxs)("div", {
                    className: "flex flex-row justify-between items-center self-stretch",
                    children: [(0, U.jsx)(r9, {
                        children: a(s ? r.sectionHeaderTranslationKey : n.titleTranslationKey)
                    }), o.success && (0, U.jsx)(nm, {
                        daysLeft: o.value
                    })]
                }), n.bodyTranslationKey && (0, U.jsx)(r7, {
                    children: a(n.bodyTranslationKey)
                })]
            }), (0, U.jsx)(ne, {
                isPrimary: t,
                children: (0, U.jsx)(na, {
                    onProductClick: (e, t) => {
                        i({
                            product: e,
                            event: t,
                            isRedirect: !0,
                            isSubscription: !1,
                            isBonus: !1,
                            sectionType: "RedirectProductList"
                        })
                    },
                    products: r.products ?? [],
                    OverrideProductItemComponent: c
                })
            })]
        })
    }
    let i9 = {
            "1:1": "aspect-1-1",
            "5:4": "aspect-5-4",
            "4:5": "aspect-4-5",
            "4:3": "aspect-4-3",
            "16:9": "aspect-16-9",
            "2:1": "aspect-2-1"
        },
        i7 = (0, L.forwardRef)((e, t) => {
            let {
                className: r,
                aspectRatio: n = "1:1",
                alt: a,
                containerClassName: i,
                ...s
            } = e;
            return L.default.createElement("div", {
                className: (0, W.default)("foundation-web-media clip", i9[n], i)
            }, L.default.createElement("img", {
                ref: t,
                className: (0, W.default)("foundation-web-media-image", r),
                alt: a,
                ...s
            }))
        });

    function se(e) {
        let {
            product: t,
            redirectUrl: r,
            onPurchaseClick: n
        } = e, a = r ? {
            as: "a",
            href: `${r}&ap=${t.productId}`,
            rel: "noreferrer",
            role: "button",
            target: "_blank"
        } : {};
        return (0, U.jsxs)("div", {
            className: "self-stretch flex flex-row justify-between items-center gap-small",
            ...{
                [eW]: t.productId
            },
            children: [(0, U.jsx)("div", {
                className: "min-width-0 flex-1",
                children: (0, U.jsx)(nr, {
                    amount: t.robuxAmount,
                    nonPromotionalAmount: t.nonPromotionalPlatformRobuxAmount,
                    bonusRobuxAmount: t.bonusRobuxAmount,
                    bonusRobuxTagIcon: t.bonusRobuxTagIcon,
                    bonusRobuxTagTranslationKey: t.bonusRobuxTagTranslationKey,
                    inlineBadgeIcon: t.inlineBadgeIcon,
                    inlineBadgeTranslationKey: t.inlineBadgeTranslationKey
                })
            }), (0, U.jsx)(O.Button, {
                variant: t.isCallToAction ? "Emphasis" : "Standard",
                size: "Small",
                className: (0, r8.default)("min-width-[90px] small:min-width-[120px] medium:min-width-[200px] text-label-medium shrink-0", "small:height-1000 small:padding-x-medium small:text-label-medium small:[&_.icon]:size-[var(--icon-size-medium)] small:[&>span]:gap-small"),
                onClick: e => {
                    n(t, e)
                },
                ...a,
                icon: r ? "icon-regular-arrow-up-right-from-square" : void 0,
                children: (0, U.jsx)(tH.PriceTag, {
                    tagClassName: "robux-price-tag",
                    currencyCode: t.price.amount.currencyCode,
                    amount: Number(tY(t.price.amount))
                })
            })]
        })
    }

    function st(e) {
        let {
            item: t,
            products: r,
            totalCards: n,
            redirectUrl: a,
            onPurchaseClick: i
        } = e, {
            translateFullKey: s
        } = (0, er.useFullKeyTranslations)(), l = t.displayableBonus.collectibleItemMetadata, o = l ? s(l.translationKey, void 0, "Bonus Item") : t.displayableBonus.gamePassMetadata?.gamePassDisplayName ?? "";
        return (0, U.jsxs)("div", {
            className: "self-stretch radius-large flex flex-col",
            style: {
                overflow: "hidden"
            },
            children: [(0, U.jsxs)("div", {
                className: `relative bg-shift-200 ${n>1?"min-height-[120px]":"min-height-[186px] medium:min-height-[204px]"}`,
                children: [l?.backgroundImage2dUrl && (0, U.jsx)(i7, {
                    aspectRatio: "16:9",
                    src: l.backgroundImage2dUrl,
                    alt: "",
                    containerClassName: "absolute inset-0 width-full height-full",
                    className: "width-full height-full object-cover"
                }), (0, U.jsx)("div", {
                    className: "absolute inset-0 bg-[rgba(0,0,0,0.4)]"
                }), (0, U.jsxs)("div", {
                    className: (0, r8.default)("relative z-10 padding-xlarge flex height-full", 1 === n ? "flex-col items-center justify-end" : "flex-row items-center", {
                        "gap-medium": 1 === n,
                        "gap-xlarge": 1 !== n
                    }),
                    children: [l?.image2dUrl && (0, U.jsx)("img", {
                        src: l.image2dUrl,
                        alt: o,
                        className: (0, r8.default)("radius-medium object-contain shrink-0", {
                            "height-[150px] width-auto max-width-full": 1 === n,
                            "height-[75px] width-auto max-width-full": 1 !== n
                        })
                    }), (0, U.jsxs)("div", {
                        className: `flex flex-col gap-xsmall medium:gap-small ${1===n?"self-start":""}`,
                        children: [(0, U.jsx)("span", {
                            className: "text-title-large medium:text-heading-medium content-emphasis",
                            children: o
                        }), l?.creatorDisplayName && (0, U.jsxs)("span", {
                            className: "text-body-medium content-emphasis flex items-center gap-xsmall",
                            children: [l.creatorDisplayName, l.creatorIsVerified && (0, U.jsx)(rl, {
                                size: 16
                            })]
                        })]
                    })]
                })]
            }), (0, U.jsx)("div", {
                className: "self-stretch flex flex-col gap-xlarge padding-medium medium:padding-xlarge bg-shift-400",
                "data-testid": "ltb-robux-packages",
                children: r.map(e => (0, U.jsx)(se, {
                    product: e,
                    redirectUrl: a,
                    onPurchaseClick: i
                }, e.productId))
            })]
        })
    }

    function sr(e) {
        let {
            isPrimary: t,
            sectionBase: r,
            limitedTimeBonus: n
        } = e, {
            purchaseProduct: a
        } = (0, L.useContext)(rC), {
            redirect: i
        } = (0, L.useContext)(ec), {
            translateFullKey: s
        } = (0, er.useFullKeyTranslations)(), l = (0, L.useMemo)(() => {
            let e = r.products ?? [];
            return n.limitedTimeBonuses.reduce((t, r) => {
                let {
                    collectibleItemMetadata: n,
                    gamePassMetadata: a
                } = r.displayableBonus;
                if (!n && !a) return ey("BonusItemMissingMetadata", {
                    productType: "LimitedTimeBonus"
                }), t;
                let i = e.filter(e => r.robuxProductIds.some(t => t === e.productId));
                return i.length > 0 && t.push({
                    item: r,
                    products: i
                }), t
            }, [])
        }, [n.limitedTimeBonuses, r.products]), o = (0, L.useCallback)((e, t) => {
            a({
                product: e,
                event: t,
                isRedirect: !!(n.isRedirect && i?.url),
                isSubscription: !1,
                isBonus: !0,
                sectionType: "LimitedTimeBonus"
            })
        }, [a, n.isRedirect, i]);
        if (0 === l.length) return null;
        let c = np(n.expirationTimestampMs);
        return (0, U.jsxs)(r6, {
            ...e$(r),
            children: [(0, U.jsxs)("div", {
                className: "self-stretch flex flex-row items-center justify-between gap-medium",
                "data-testid": "ltb-section-header-row",
                children: [(0, U.jsx)(r9, {
                    className: "self-auto min-width-0 flex-1 medium:self-stretch medium:flex-none",
                    children: s(r.sectionHeaderTranslationKey, void 0, "Limited-time avatar items")
                }), c.success && (0, U.jsx)(nm, {
                    daysLeft: c.value
                })]
            }), n.bodyTranslationKey && (0, U.jsx)(r7, {
                children: s(n.bodyTranslationKey)
            }), (0, U.jsx)("div", {
                className: "self-stretch flex flex-col gap-xlarge medium:gap-xxlarge",
                children: l.map(e => {
                    let {
                        item: t,
                        products: r
                    } = e;
                    return (0, U.jsx)(st, {
                        item: t,
                        products: r,
                        totalCards: l.length,
                        redirectUrl: n.isRedirect && i?.url ? i.url : void 0,
                        onPurchaseClick: o
                    }, t.robuxProductIds.join("-"))
                })
            })]
        })
    }

    function sn() {
        let {
            buyRobuxPageData: e,
            deviceMeta: t
        } = (0, L.useContext)(ec), r = eU(t), n = (0, L.useMemo)(() => e.sections.find(e => e.transfers), [e.sections]), a = n?.transfers, i = (0, L.useMemo)(() => e.sections.find(e => e.robuxGift), [e.sections]), s = (0, L.useCallback)(e => {
            eS("SectionReactCrash", null, e)
        }, []), l = (0, L.useCallback)((e, t) => {
            let r;
            if (t.transfers || null != a && t.robuxGift) return e;
            let n = {
                    isPrimary: 0 === e.length,
                    sectionBase: t
                },
                {
                    giftCard: i,
                    limitedTimeBonus: l,
                    personalizedBonus: o,
                    productsList: c,
                    recommended: u,
                    robuxGift: d,
                    sectionHeaderTranslationKey: m,
                    subscriptionV2: p,
                    redirect: h
                } = t;
            if (h) r = (0, U.jsx)(i6, {
                ...n,
                redirectOptions: h
            });
            else if (c) r = (0, U.jsx)(nh, {
                ...n
            });
            else if (u) r = (0, U.jsx)(nf, {
                ...n,
                recommended: u
            });
            else if (o) r = (0, U.jsx)(nd, {
                ...n,
                personalizedBonus: o
            });
            else if (d) r = (0, U.jsx)(nb, {
                ...n,
                robuxGift: d
            });
            else if (p) p.products.forEach(e => {
                e.benefits?.forEach(t => {
                    t.plusDiscountSubscriptionBenefits && (t.plusDiscountSubscriptionBenefits.periodType = e.periodType)
                })
            }), r = (0, U.jsx)(aL, {
                ...n,
                subscriptionV2: p
            });
            else if (i) r = (0, U.jsx)(nx, {
                ...n,
                giftCard: i
            });
            else {
                if (!l) return console.error(`Unknown section type: ${m}`), e;
                r = (0, U.jsx)(sr, {
                    ...n,
                    limitedTimeBonus: l
                })
            }
            return [...e, (0, U.jsx)(tf, {
                onError: s,
                children: r
            }, m)]
        }, [s, a]), o = (0, L.useMemo)(() => e.sections.reduce(l, []), [e.sections, l]);
        return (0, U.jsxs)("div", {
            className: "flex flex-col items-center",
            children: [(0, U.jsx)("div", {
                className: "buy-robux-background"
            }), (0, U.jsx)(i8, {
                transfersSection: n,
                robuxGiftSection: i
            }), (0, U.jsxs)("div", {
                className: (0, r8.default)("buy-robux-content padding-x-large small:padding-x-xlarge", {
                    "is-in-app": r
                }),
                children: [(0, U.jsx)(aB, {
                    transfers: a
                }), o, (0, U.jsx)(az, {})]
            })]
        })
    }
    i7.displayName = "Media";
    let sa = async () => eT(eN.GET, ek.GET_CLIENT_ASSERTION_V2, {
        url: `${ei.EnvironmentUrls.authApi}/v1/client-assertion/`,
        withCredentials: !0
    }), si = async e => eT(eN.POST, ek.GET_AUTH_TICKET_V2, {
        url: `${ei.EnvironmentUrls.authApi}/v1/authentication-ticket/`,
        withCredentials: !0
    }, {
        clientAssertion: e
    }, (e, t) => t["rbx-authentication-ticket"]), ss = async () => {
        let e = await sa();
        return si(e?.clientAssertion)
    }, sl = async () => await ss() ?? "", so = `paymentSession-${(0,ea.getCurrentUser)()?.id??"loggedout"}`, sc = e => {
        let t, {
            enhancedBuyRobuxPageData: r,
            urlParams: n,
            deviceMeta: a
        } = e;
        ! function() {
            let {
                urlParams: e
            } = (0, L.useContext)(ec), [t, r] = (0, L.useMemo)(() => [e.ctx, e.product_id], [e]);
            (0, L.useEffect)(() => {
                t ? (0, en.setItem)(eu, t) : (0, en.removeItem)(eu)
            }, [t]), (0, L.useEffect)(() => {
                r ? (0, en.setItem)(ed, r) : (0, en.removeItem)(ed)
            }, [r])
        }();
        let i = et(),
            s = (0, L.useRef)(!1),
            l = r.buyRobuxPageData.legalDisclosureTermsUrlPath;
        (0, L.useEffect)(() => {
            a.isIosApp && l && !s.current && (s.current = !0, ey("IosPurchaseRestartAlertShown"), D.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent({
                triggerContext: eG(a),
                isMidPurchaseStep: !0,
                viewName: D.paymentFlowAnalyticsService.ENUM_VIEW_NAME.IOS_PURCHASE_RESTART_ALERT,
                purchaseEventType: D.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN
            }), i.toastService.info(l))
        }, [a, i.toastService, l]);
        let {
            limitedTimeBonusItem: o,
            bonusItemDisplayName: c,
            bonusItemId: u,
            bonusItemRootPlaceId: d,
            giftingUrl: m,
            isSubscriber: p,
            productIds: h,
            sectionNames: f,
            subscriptionProductIds: g,
            upsellProduct: x,
            collectibleBonusItemMetadata: b,
            productBadgeSlotCount: y,
            atLeastOneProductHasBonusAmount: v,
            buyRobuxPageData: S
        } = r, {
            paymentSession: P,
            purchaseFlowId: C
        } = r.buyRobuxPageData;
        (0, L.useEffect)(() => {
            P && (0, en.setItem)(so, P)
        }, [P]);
        let E = (t = P?.id, (0, L.useCallback)((e, r) => {
                let {
                    productId: n,
                    providerProductId: i
                } = e;
                return a.isAndroidApp && i ? `${r4}?${r3.UrlSearchParams.new({id:i.toLowerCase(),...void 0!==t?{paymentSessionId:t}:{},recurring:r&&!i.endsWith("onemonth")}).toString()}` : (a.isAmazonApp || a.isUWPApp) && i ? `${r4}?${r3.UrlSearchParams.new({id:i.toLowerCase()}).toString()}` : a.isIosApp && i ? `${r4}?${r3.UrlSearchParams.new({id:i,...void 0!==t?{paymentSessionId:t}:{}}).toString()}` : `/upgrades/paymentmethods?${r3.UrlSearchParams.new({ap:n,page:"RobuxRedesign",...void 0!==t?{paymentSessionId:t}:{}}).toString()}`
            }, [a, t])),
            w = function() {
                let e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0],
                    [t, r] = (0, L.useState)(void 0);
                return (0, L.useEffect)(() => {
                    let e = (0, ea.getCurrentUser)()?.id;
                    void 0 === e ? r(0) : (async e => {
                        let t = await ej(e);
                        t ? r(t.robux) : r(null)
                    })(e)
                }, [e]), t
            }(),
            {
                shouldShowFirstTimePurchaseConsent: N,
                markConsentAcknowledged: k
            } = function(e, t) {
                let [r, n] = (0, L.useState)();
                return (0, L.useEffect)(() => {
                    let r = !1;
                    return e && "true" !== (0, en.getItem)(el(e)) ? ((async () => {
                        let a = await es(e, t);
                        r || n(!!a?.shouldShowFirstTimePurchaseConsent)
                    })(), () => {
                        r = !0
                    }) : void n(!1)
                }, [e, t]), {
                    shouldShowFirstTimePurchaseConsent: r,
                    markConsentAcknowledged: (0, L.useCallback)(() => {
                        e && (0, en.setItem)(el(e), "true")
                    }, [e])
                }
            }((0, ea.getCurrentUser)()?.id, rg),
            T = function(e) {
                let {
                    deviceMeta: t,
                    paymentSession: r,
                    isEnabled: n
                } = e, [a, i] = (0, L.useState)(), [s, l] = (0, L.useState)(rV), [o, c] = (0, L.useState)(!1), u = r?.id, d = (0, L.useCallback)(() => {
                    ey("MobileRedirectUrlGenerationStarted"), sl().then(i).catch(e => {
                        ev("MobileRedirectUrlGenerationFailed", null, e)
                    })
                }, []);
                (0, L.useEffect)(() => {
                    n && u && (d(), rK.getExperimentBasedPathname(t).then(e => {
                        let {
                            pathname: t,
                            isInExperiment: r
                        } = e;
                        l(t), c(r)
                    }).catch(e => {
                        ev("LoginRedirectExperimentFetchFailed", null, e)
                    }))
                }, [t, d, n, u]);
                let m = (0, L.useMemo)(() => {
                    if (!a || !u) return "";
                    let e = (0, ea.getCurrentUser)();
                    return (e => {
                        let {
                            authTicket: t,
                            paymentSessionId: r,
                            returnUrl: n,
                            loginRedirectPathname: a,
                            isInExperiment: i,
                            userId: s
                        } = e, l = r3.UrlSearchParams.new({
                            analyticId: D.paymentFlowAnalyticsService.purchaseFlowUuid,
                            at: t,
                            ctx: "redirect",
                            ...i && {
                                expFlow: "1"
                            },
                            paymentSessionId: r,
                            returnUrl: n,
                            tuid: s
                        }).toString();
                        return `${a}?${l}`
                    })({
                        authTicket: a,
                        paymentSessionId: u,
                        returnUrl: "/upgrades/paymentmethods",
                        loginRedirectPathname: s,
                        isInExperiment: o,
                        userId: void 0 === e ? 0 : (0, ea.userIdToNumber)(e.id)
                    })
                }, [a, u, s, o]);
                if (n && u) return {
                    url: m,
                    isInExperiment: o,
                    refreshAuthTicket: d
                }
            }({
                deviceMeta: a,
                paymentSession: P,
                isEnabled: (a.isIosApp || a.isAndroidApp) && S.sections.some(e => e.redirect ?? e.personalizedBonus?.isRedirect ?? e.limitedTimeBonus?.isRedirect ?? e.subscriptionV2?.products.some(e => e.isRedirect))
            }),
            {
                bonusItemBannerImageUrl: j,
                bonusItemImageUrl: A,
                giftingAvatarImageUrl: M
            } = function(e) {
                let {
                    bonusItemId: t,
                    giftingUrl: r,
                    bonusItemRootPlaceId: n
                } = e, [a, i] = (0, L.useState)(""), [s, l] = (0, L.useState)(""), [o, c] = (0, L.useState)(""), u = (0, L.useCallback)(async e => {
                    let {
                        bonusItemId: t,
                        giftingUrl: r,
                        bonusItemRootPlaceId: n
                    } = e, a = [], s = (0, ea.getCurrentUser)()?.id;
                    t && a.push({
                        format: "png",
                        requestId: t,
                        size: "150x150",
                        targetId: t,
                        type: "GamePass"
                    }), r && void 0 !== s && a.push({
                        format: "png",
                        requestId: s,
                        size: "150x150",
                        targetId: s,
                        type: "AvatarHeadshot"
                    }), n && a.push({
                        format: "png",
                        requestId: n,
                        size: "768x432",
                        targetId: n,
                        type: "GameThumbnail"
                    });
                    let o = await eM(a);
                    o?.data.forEach(e => {
                        e.state === eA.Completed && (e.targetId.toString() === t && l(e.imageUrl), e.targetId.toString() === s && c(e.imageUrl), e.targetId.toString() === n && i(e.imageUrl))
                    })
                }, []);
                return (0, L.useEffect)(() => {
                    (n || t || r) && u({
                        bonusItemId: t,
                        bonusItemRootPlaceId: n,
                        giftingUrl: r
                    })
                }, [n, t, r, u]), {
                    bonusItemBannerImageUrl: a,
                    bonusItemImageUrl: s,
                    giftingAvatarImageUrl: o
                }
            }({
                bonusItemId: u,
                bonusItemRootPlaceId: d,
                giftingUrl: m
            }),
            R = (0, L.useMemo)(() => ({
                deviceMeta: a,
                limitedTimeBonusItem: o,
                bonusItemBannerImageUrl: j,
                bonusItemDisplayName: c,
                bonusItemId: u,
                bonusItemImageUrl: A,
                buyRobuxPageData: S,
                getPurchaseUrl: E,
                giftingAvatarImageUrl: M,
                giftingUrl: m,
                isSubscriber: p,
                paymentSession: P,
                productIds: h,
                purchaseFlowId: C,
                robuxBalance: w,
                sectionNames: f,
                subscriptionProductIds: g,
                upsellProduct: x,
                urlParams: n,
                redirect: T,
                collectibleBonusItemMetadata: b,
                shouldShowFirstTimePurchaseConsent: N,
                markConsentAcknowledged: k,
                productBadgeSlotCount: y,
                atLeastOneProductHasBonusAmount: v
            }), [o, u, j, c, A, S, E, M, m, p, P, h, C, w, f, g, x, n, T, b, N, k, y, v, a]);
        return (0, U.jsxs)(ec.Provider, {
            value: R,
            children: [(0, U.jsx)("div", {
                id: "generic-challenge-container",
                "data-testid": "generic-challenge-container"
            }), (0, U.jsx)(tr, {
                children: (0, U.jsx)(r5, {
                    children: (0, U.jsx)(sn, {})
                })
            })]
        })
    }, su = new _.QueryClient({
        defaultOptions: {
            queries: {
                retry: !1,
                refetchOnMount: !1,
                refetchOnWindowFocus: !1,
                refetchOnReconnect: !1
            }
        }
    }), sd = e => {
        let {
            children: t
        } = e, r = (0, er.useTranslations)("CommonUI.Controls");
        return (0, U.jsx)(ee, {
            closeLabel: r("Action.Close"),
            children: t
        })
    };
    e.s(["RobuxRedesign", 0, e => {
        D.paymentFlowAnalyticsService.setWebStack("nextjs"), (0, L.useEffect)(() => {
            eC(), rh(), eE()
        });
        let {
            purchaseFlowId: t
        } = e.enhancedBuyRobuxPageData.buyRobuxPageData;
        return t && D.paymentFlowAnalyticsService.setPaymentFlowUuid(t), (0, U.jsx)(ew, {
            name: "BuyRobuxPageReactCrash",
            children: (0, U.jsx)(F.QueryClientProvider, {
                client: su,
                children: (0, U.jsx)(sd, {
                    children: (0, U.jsx)(sc, {
                        ...e
                    })
                })
            })
        })
    }, "queryClient", 0, su], 518623)
}]);

//# debugId=a7410b82-096f-ba7e-57ef-871245588d42
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0e4drnsef.~1s.js.map
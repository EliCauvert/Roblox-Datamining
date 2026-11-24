;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "1c6bcc7f-3232-23b7-47e2-a9d03101c6a2")
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
                E = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : S;
                    if (null === e || x(e) && "function" == typeof e.elements && "function" == typeof e.createToken && "function" == typeof e.createPaymentMethod && "function" == typeof e.confirmCardPayment) return e;
                    throw Error(t)
                },
                C = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : S;
                    if (x(e) && "function" == typeof e.then) return {
                        tag: "async",
                        stripePromise: Promise.resolve(e).then(function(e) {
                            return E(e, t)
                        })
                    };
                    var r = E(e, t);
                    return null === r ? {
                        tag: "empty"
                    } : {
                        tag: "sync",
                        stripe: r
                    }
                },
                P = function(e) {
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
                        P(o.stripe)
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
                R = t.createContext(null);
            R.displayName = "CustomCheckoutSdkContext";
            var M = function(e, t) {
                    if (!e) throw Error("Could not find CustomCheckoutProvider context; You need to wrap the part of your app that ".concat(t, " in an <CustomCheckoutProvider> provider."));
                    return e
                },
                I = t.createContext(null);
            I.displayName = "CustomCheckoutContext";
            var _ = function(e, t) {
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
                U = function(e) {
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
                        P(d.stripe)
                    }, [d.stripe]);
                    var v = t.useMemo(function() {
                        return _(d.customCheckoutSdk, o)
                    }, [d.customCheckoutSdk, o]);
                    return d.customCheckoutSdk ? t.createElement(R.Provider, {
                        value: d
                    }, t.createElement(I.Provider, {
                        value: v
                    }, a)) : null
                };
            U.propTypes = {
                stripe: h.any,
                options: h.shape({
                    clientSecret: h.string.isRequired,
                    elementsOptions: h.object
                }).isRequired
            };
            var L = function(e) {
                    var r = t.useContext(R),
                        n = t.useContext(w);
                    if (r && n) throw Error("You cannot wrap the part of your app that ".concat(e, " in both <CustomCheckoutProvider> and <Elements> providers."));
                    return r ? M(r, e) : N(n, e)
                },
                F = function(e, r) {
                    var n = "".concat(e.charAt(0).toUpperCase() + e.slice(1), "Element"),
                        a = r ? function(e) {
                            L("mounts <".concat(n, ">"));
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
                                E = r.onConfirm,
                                C = r.onCancel,
                                P = r.onShippingAddressChange,
                                w = r.onShippingRateChange,
                                N = L("mounts <".concat(n, ">")),
                                k = "elements" in N ? N.elements : null,
                                T = "customCheckoutSdk" in N ? N.customCheckoutSdk : null,
                                j = s(t.useState(null), 2),
                                A = j[0],
                                R = j[1],
                                M = t.useRef(null),
                                I = t.useRef(null);
                            f(A, "blur", u), f(A, "focus", d), f(A, "escape", h), f(A, "click", x), f(A, "loaderror", b), f(A, "loaderstart", y), f(A, "networkschange", S), f(A, "confirm", E), f(A, "cancel", C), f(A, "shippingaddresschange", P), f(A, "shippingratechange", w), f(A, "change", p), m && (a = "expressCheckout" === e ? m : function() {
                                m(A)
                            }), f(A, "ready", a), t.useLayoutEffect(function() {
                                if (null === M.current && null !== I.current && (k || T)) {
                                    var t = null;
                                    T ? t = T.createElement(e, c) : k && (t = k.create(e, c)), M.current = t, R(t), t && t.mount(I.current)
                                }
                            }, [k, T, c]);
                            var _ = g(c);
                            return t.useEffect(function() {
                                if (M.current) {
                                    var e = v(c, _, ["paymentRequest"]);
                                    e && "update" in M.current && M.current.update(e)
                                }
                            }, [c, _]), t.useLayoutEffect(function() {
                                return function() {
                                    if (M.current && "function" == typeof M.current.destroy) try {
                                        M.current.destroy(), M.current = null
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
                z = F("auBankAccount", D),
                V = F("card", D),
                W = F("cardNumber", D),
                K = F("cardExpiry", D),
                H = F("cardCvc", D),
                Q = F("fpxBank", D),
                $ = F("iban", D),
                Y = F("idealBank", D),
                q = F("p24Bank", D),
                X = F("epsBank", D),
                J = F("payment", D),
                Z = F("expressCheckout", D),
                ee = F("currencySelector", D),
                et = F("paymentRequestButton", D),
                er = F("linkAuthentication", D),
                en = F("address", D),
                ea = F("shippingAddress", D),
                ei = F("paymentMethodMessaging", D),
                es = F("affirmMessage", D),
                el = F("afterpayClearpayMessage", D);
            e.AddressElement = en, e.AffirmMessageElement = es, e.AfterpayClearpayMessageElement = el, e.AuBankAccountElement = z, e.CardCvcElement = H, e.CardElement = V, e.CardExpiryElement = K, e.CardNumberElement = W, e.CurrencySelectorElement = ee, e.CustomCheckoutProvider = U, e.Elements = k, e.ElementsConsumer = j, e.EmbeddedCheckout = G, e.EmbeddedCheckoutProvider = function(e) {
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
                    P(o)
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
            }, e.EpsBankElement = X, e.ExpressCheckoutElement = Z, e.FpxBankElement = Q, e.IbanElement = $, e.IdealBankElement = Y, e.LinkAuthenticationElement = er, e.P24BankElement = q, e.PaymentElement = J, e.PaymentMethodMessagingElement = ei, e.PaymentRequestButtonElement = et, e.ShippingAddressElement = ea, e.useCustomCheckout = function() {
                M(t.useContext(R), "calls useCustomCheckout()");
                var e = t.useContext(I);
                if (!e) throw Error("Could not find CustomCheckout Context; You need to wrap the part of your app that calls useCustomCheckout() in an <CustomCheckoutProvider> provider.");
                return e
            }, e.useElements = function() {
                return T("calls useElements()").elements
            }, e.useStripe = function() {
                return L("calls useStripe()").stripe
            }
        }(r, e.r(371847))
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
    let t, r, n, a, i, s;
    var l, o, c, u, d, m, p, h, f, g, x, b, y, v, S, E, C, P, w, N, k, T, j, A, R, M, I, _, U, L, F = e.i(809804),
        D = e.i(910030),
        B = e.i(391855),
        O = e.i(371847),
        G = e.i(144674),
        z = e.i(491965),
        V = e.i(982249),
        W = e.i(511336),
        K = e.i(312319),
        H = e.i(964433),
        Q = e.i(7284);
    let $ = {
            Info: "icon-filled-circle-i",
            Warning: "icon-filled-triangle-exclamation",
            Success: "icon-filled-circle-check",
            Error: "icon-filled-circle-x"
        },
        Y = {
            Info: "var(--color-system-emphasis)",
            Warning: "var(--color-system-warning)",
            Success: "var(--color-extended-green-700, var(--color-system-success))",
            Error: "var(--color-action-alert-foreground)"
        },
        q = {
            Info: "stroke-emphasis",
            Warning: "stroke-system-warning",
            Success: "stroke-emphasis",
            Error: "stroke-system-alert"
        },
        X = {
            Info: "rgb(from var(--color-system-neutral) r g b / 0.1)",
            Warning: "rgb(from var(--color-system-warning) r g b / 0.16)",
            Success: "rgb(from var(--color-system-success) r g b / 0.1)",
            Error: "rgb(from var(--color-system-alert) r g b / 0.16)"
        },
        J = e => {
            let {
                label: t,
                href: r,
                linkTarget: n,
                onAction: a,
                variant: i
            } = e;
            return n ? O.default.createElement(V.Button, {
                asChild: !0,
                size: "Small",
                variant: i,
                onClick: a
            }, O.default.cloneElement(n, {}, t)) : r ? O.default.createElement(V.Button, {
                as: "a",
                href: r,
                size: "Small",
                variant: i,
                onClick: a
            }, t) : O.default.createElement(V.Button, {
                size: "Small",
                variant: i,
                onClick: a
            }, t)
        },
        Z = e => {
            let {
                label: t,
                href: r,
                linkTarget: n,
                onAction: a
            } = e;
            return n ? O.default.createElement(K.Link, {
                asChild: !0,
                onClick: a,
                size: "Medium",
                variant: "Standalone",
                underline: "always"
            }, O.default.cloneElement(n, {}, t)) : r ? O.default.createElement(K.Link, {
                href: r,
                onClick: a,
                size: "Medium",
                variant: "Standalone",
                underline: "always"
            }, t) : O.default.createElement(K.Link, {
                as: "button",
                onClick: a,
                size: "Medium",
                variant: "Standalone",
                underline: "always"
            }, t)
        },
        ee = (0, O.forwardRef)((e, t) => {
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
            } = e, y = (0, W.default)("foundation-web-alert-message-"), v = !!i, S = !!c, E = !!(p && f), C = "Feedback" === n && (v || S || E), P = "Warning" === a || "Error" === a ? "alert" : "status", w = null;
            v && (w = S ? O.default.createElement(J, {
                label: i || "",
                href: s,
                linkTarget: l,
                onAction: o,
                variant: "Standard"
            }) : O.default.createElement(Z, {
                label: i || "",
                href: s,
                linkTarget: l,
                onAction: o
            }));
            let N = S ? O.default.createElement(J, {
                label: c || "",
                href: u,
                linkTarget: d,
                onAction: m,
                variant: "Utility"
            }) : null;
            return O.default.createElement("div", {
                ref: t,
                role: C ? "region" : P,
                "aria-labelledby": C ? y : void 0,
                className: (0, Q.default)("foundation-web-alert relative width-full stroke-standard", "System" === n ? "[border-left-width:0] [border-right-width:0]" : "radius-medium", q[a], g),
                ...b
            }, O.default.createElement("div", {
                "aria-hidden": "true",
                className: (0, Q.default)("absolute inset-[0] pointer-events-none", "Feedback" === n && "radius-medium"),
                style: {
                    backgroundColor: X[a]
                }
            }), O.default.createElement("div", {
                className: "relative flex items-start gap-x-medium padding-x-large padding-y-small min-width-0"
            }, O.default.createElement("div", {
                className: "flex items-start padding-y-xsmall self-stretch shrink-0"
            }, O.default.createElement("div", {
                className: "relative flex items-start padding-y-xxsmall"
            }, "Warning" !== a && O.default.createElement("span", {
                "aria-hidden": "true",
                className: "absolute width-[10px] height-[14px] top-[5px]",
                style: {
                    left: "50%",
                    transform: "translateX(-50%)",
                    backgroundColor: "var(--dark-mode-content-emphasis)"
                }
            }), O.default.createElement(z.Icon, {
                "aria-hidden": "true",
                name: $[a],
                size: "Medium",
                className: "relative",
                style: {
                    color: Y[a]
                }
            }))), O.default.createElement("div", {
                className: (0, Q.default)("flex grow-1 basis-0 min-width-0 items-start gap-x-medium gap-y-small", S ? "flex-col" : "wrap")
            }, O.default.createElement("div", {
                id: C ? y : void 0,
                role: C ? P : void 0,
                className: (0, Q.default)("flex items-center padding-top-[var(--size-150)] text-body-medium text-wrap content-emphasis [overflow-wrap:anywhere]", S ? "width-full min-width-0" : "grow-1 basis-0 min-width-[min(200px,100%)]")
            }, r), (w || N) && O.default.createElement("div", {
                className: (0, Q.default)("flex items-center gap-small wrap shrink-0", !S && "padding-y-[var(--size-150)]")
            }, w, N)), E && O.default.createElement(H.CloseAffordance, {
                variant: "Utility",
                size: "Medium",
                isCircular: !0,
                className: "content-emphasis shrink-0 padding-[var(--size-150)]",
                "aria-label": h,
                onClick: f
            })))
        });
    var et = e.i(357355);
    let er = (0, O.createContext)(null),
        en = e => {
            let {
                children: t,
                closeLabel: r
            } = e, [n, a] = (0, O.useState)(null), i = (0, O.useRef)(0), s = (0, O.useCallback)((e, t, r) => {
                i.current += 1, a({
                    id: i.current,
                    title: t,
                    severity: e,
                    shouldAutoDismiss: r?.shouldAutoDismiss ?? "Success" === e
                })
            }, []), l = (0, O.useMemo)(() => ({
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
            }), [s]), o = (0, O.useMemo)(() => ({
                toastService: l
            }), [l]), c = (0, O.useCallback)(() => {
                a(null)
            }, []);
            return (0, O.useEffect)(() => {
                if (!n?.shouldAutoDismiss || !et.window) return;
                let e = n.id,
                    t = et.window.setTimeout(() => {
                        a(t => t?.id === e ? null : t)
                    }, 4e3);
                return () => {
                    et.window?.clearTimeout(t)
                }
            }, [n]), (0, F.jsxs)(er.Provider, {
                value: o,
                children: [t, n && (0, F.jsx)("div", {
                    className: "bg-surface-0",
                    style: {
                        position: "fixed",
                        left: "50%",
                        bottom: "max(var(--padding-xxlarge, 32px), env(safe-area-inset-bottom))",
                        transform: "translateX(-50%)",
                        zIndex: "var(--foundation-portal-zindex, 9999)",
                        width: "min(480px, calc(100% - 2 * var(--margin-small, 16px)))"
                    },
                    children: (0, F.jsx)(ee, {
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
        ea = () => {
            let e = (0, O.useContext)(er);
            if (!e) throw Error("useToast must be used within a ToastProvider");
            return e
        };
    var ei = e.i(361185),
        es = e.i(883355),
        el = e.i(126392),
        eo = e.i(245837);
    async function ec(e, t) {
        return t({
            method: "GET",
            url: `${eo.EnvironmentUrls.apiGatewayUrl}/payments-gateway/v1/feature/metadata`,
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

    function eu(e) {
        return `firstTimePurchaseConsentAcknowledged_${e}`
    }
    var ed = e.i(673518);
    let em = (0, O.createContext)({
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
            deviceMeta: ed.defaultDeviceMeta
        }),
        ep = "buyRobuxCtx",
        eh = "buyRobuxProductId";
    var ef = e.i(500154),
        eg = e.i(610006),
        ex = e.i(31326);
    let eb = new Set(["componentStack"]),
        ey = (e, t) => {
            if (console.error(e, t), !t) return void(0, ex.captureException)(e);
            let r = {},
                n = {};
            for (let [e, a] of Object.entries(t)) eb.has(e) ? n[e] = a : r[e] = a;
            (0, ex.captureException)(e, {
                ...Object.keys(r).length > 0 ? {
                    tags: r
                } : {},
                ...Object.keys(n).length > 0 ? {
                    extra: n
                } : {}
            })
        };
    var ev = e.i(83311),
        eS = e.i(333982);
    let eE = {
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
                earlyClick: {
                    counters: [{
                        name: "EarlyClickTap",
                        dimensions: ["outcome", "kind", "waitingFor", "waitBucket", "tapCount", "os"],
                        steps: {
                            dimension: "outcome",
                            values: [{
                                value: "held",
                                role: "start"
                            }, {
                                value: "replayed",
                                role: "success"
                            }, {
                                value: "activationLost",
                                role: "drop"
                            }, {
                                value: "gaveUp",
                                role: "error"
                            }, {
                                value: "expired",
                                role: "error"
                            }, {
                                value: "abandoned",
                                role: "drop"
                            }, {
                                value: "dropped",
                                role: "drop"
                            }, {
                                value: "replaced",
                                role: "drop"
                            }]
                        }
                    }]
                },
                limitedTimeBonus: {
                    errors: ["ResolveLimitedTimeBonusExpirationInvalidTimestamp"]
                }
            }
        },
        eC = (0, eS.createFireTelemetryCounter)(eE.featureName),
        {
            trackCounter: eP,
            trackError: ew,
            trackCriticalError: eN
        } = (0, ef.createTrackers)(eE, {
            publish: eC,
            captureException: ey,
            featureName: eE.featureName
        }),
        ek = (0, ev.createWithApiMetricsV2)(eC, ey),
        {
            reportPageLoad: eT,
            reportPageView: ej,
            reportNoRoot: eA
        } = (l = {
            publishCounter: eC
        }, n = "function" == typeof(r = (t = !1, l)) ? r : r.publishCounter, i = (a = (e, t) => {
            let r = !1;
            return a => {
                if (!r) {
                    r = !0;
                    try {
                        let r = t ? {
                            ...a,
                            severity: t
                        } : a;
                        r ? n(e, r) : n(e)
                    } catch {}
                }
            }
        })("PageLoad"), s = a("PageView"), t ? {
            reportPageLoad: i,
            reportPageView: s
        } : {
            reportPageLoad: i,
            reportPageView: s,
            reportNoRoot: a("NoRoot", "critical")
        }),
        eR = (0, eg.createObsErrorBoundary)(eE, {
            publish: eC,
            captureException: ey,
            featureName: eE.featureName
        });
    var eM = ((o = {}).GET = "GET", o.POST = "POST", o),
        eI = ((c = {}).ACKNOWLEDGE_PURCHASE_WARNING = "AcknowledgePurchaseWarning", c.CHECK_USER_PURCHASE_SETTING = "CheckUserPurchaseSetting", c.GET_ENABLE_PURCHASES_SETTING = "GetEnablePurchaseSetting", c.GET_PAYMENT_PROFILES = "GetPaymentProfiles", c.GET_PENDING_ENABLE_PURCHASE_CONSENT_REQUESTS = "GetPendingEnablePurchaseConsentRequests", c.GET_PURCHASE_WARNING = "GetPurchaseWarning", c.GET_QUICK_PAY_METADATA = "GetQuickPayMetadata", c.GET_ROBUX_BALANCE = "GetRobuxBalance", c.GET_THUMBNAILS = "GetThumbnails", c.PREPARE_PAYMENT = "PreparePayment", c.PROCESS_PAYMENT = "ProcessPayment", c.GET_CLIENT_ASSERTION_V2 = "GetClientAssertionV2", c.GET_AUTH_TICKET_V2 = "GetAuthTicketV2", c.GET_MY_FRIENDS = "GetMyFriends", c.USER_SEARCH = "UserSearch", c);
    async function e_(e, t, r, n, a, i) {
        let {
            url: s,
            ...l
        } = r;
        return ("GET" === e ? ek({
            method: "GET",
            url: s,
            config: {
                ...l,
                params: n
            },
            eventCounterProps: {
                call: t
            }
        }) : ek({
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
    let eU = async e => e_(eM.GET, eI.GET_ROBUX_BALANCE, {
        url: `${eo.EnvironmentUrls.economyApi}/v1/users/${e}/currency`,
        withCredentials: !0
    });
    var eL = ((u = {}).Completed = "Completed", u.Pending = "Pending", u);
    let eF = async e => e_(eM.POST, eI.GET_THUMBNAILS, {
        url: `${eo.EnvironmentUrls.thumbnailsApi}/v1/batch`,
        withCredentials: !0
    }, e), eD = (0, O.createContext)({
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
        trackEarlyClick: () => void 0,
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
    }), eB = e => e.isDesktop && !e.isUWPApp && !e.isPcGdkApp || !e.isAmazonApp && !e.isUWPApp && !e.isIosApp && !e.isAndroidApp && !e.isPcGdkApp, eO = e => e.isAmazonApp || e.isUWPApp || e.isIosApp || e.isAndroidApp || e.isPcGdkApp, {
        ENUM_TRIGGERING_CONTEXT: {
            MOBILE_WEB_PREMIUM_PURCHASE: eG,
            MOBILE_WEB_ROBUX_PURCHASE: ez,
            WEBVIEW_PREMIUM_PURCHASE: eV,
            WEBVIEW_ROBUX_PURCHASE: eW,
            WEB_PREMIUM_PURCHASE: eK,
            WEB_ROBUX_PURCHASE: eH
        }
    } = G.paymentFlowAnalyticsService;

    function eQ(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
        return eO(e) ? t ? eV : eW : e.isDesktop ? t ? eK : eH : t ? eG : ez
    }
    var e$ = e.i(836931);
    let eY = "data-section-type",
        eq = "data-product-id",
        eX = "data-subscription-product-id",
        eJ = "data-subscription-product-type",
        eZ = [eY, eq, eX].map(e => `[${e}]`).join(", ");

    function e0(e) {
        return {
            [eY]: e.sectionType
        }
    }
    let {
        ENUM_VIEW_NAME: {
            ROBLOX_PLUS_BUY_ROBUX: e1
        },
        ENUM_PURCHASE_EVENT_TYPE: {
            USER_INPUT: e2,
            VIEW_SHOWN: e3
        },
        ENUM_VIEW_MESSAGE: {
            ROBLOX_PLUS_FREE_TRIAL: e5,
            ROBLOX_PLUS_SUBSCRIBE: e6,
            ROBLOX_PLUS_LEARN_MORE: e4
        }
    } = G.paymentFlowAnalyticsService;
    var e8 = e.i(951605);
    e.i(912035);
    var e9 = e.i(934045);
    let e7 = e => Math.max(0, (et.window?.performance.now() ?? e.startedAt) - e.startedAt),
        te = (e, t) => t ? `product:${e}|${t}` : `product:${e}`,
        tt = (e, t) => !!e && void 0 !== t,
        tr = (e, t) => t ? e : void 0,
        tn = {
            tabIndex: 0,
            onKeyDown: e => {
                ("Enter" === e.key || " " === e.key) && (e.preventDefault(), e.currentTarget.click())
            }
        },
        ta = e => {
            let t = et.window?.robuxEarlyClick;
            if (t?.key === e) return et.window?.clearTimeout(t.timer), delete et.window?.[e9.EARLY_CLICK_STATE_KEY], t
        },
        ti = e => {
            e.removeAttribute(e9.EARLY_CLICK_PENDING_ATTR), e.removeAttribute("aria-busy")
        },
        ts = function(e, t) {
            let {
                onReplay: r,
                onActivationLost: n,
                requiresUserActivation: a = !1
            } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {}, i = et.window?.robuxEarlyClick;
            i?.key !== t ? e.setAttribute(e9.EARLY_CLICK_HYDRATED_ATTR, "") : et.window?.setTimeout(() => {
                if (!e.isConnected) return;
                let i = e.querySelector(e9.EARLY_CLICK_CTA_SELECTOR);
                if (!i?.isConnected) return;
                e.setAttribute(e9.EARLY_CLICK_HYDRATED_ATTR, "");
                let s = ta(t);
                if (!s) return;
                ti(e);
                let l = et.navigator?.userActivation;
                a && l?.isActive === !1 ? n?.(s) : (i.click(), r?.(s))
            }, 0)
        },
        tl = (0, O.createContext)(void 0),
        to = e => {
            let {
                scope: t,
                children: r
            } = e;
            return (0, F.jsx)(tl.Provider, {
                value: t,
                children: r
            })
        },
        tc = [{
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
        }],
        tu = new Set,
        td = e => tu.has(e) ? "redirectUrl" : "hydration",
        tm = (e, t, r, n, a, i) => {
            e({
                outcome: t,
                ...(e => {
                    let t = e.indexOf(":");
                    if (-1 === t) return {
                        kind: "product",
                        productId: e
                    };
                    let r = "subscription" === e.slice(0, t) ? "subscription" : "product",
                        n = e.slice(t + 1),
                        a = "product" === r ? n.lastIndexOf("|") : -1;
                    return {
                        kind: r,
                        productId: -1 === a ? n : n.slice(0, a)
                    }
                })(r),
                waitingFor: i ?? td(r),
                waitMs: n,
                taps: a
            })
        },
        tp = (e, t) => {
            if (t.isHeldReported) return;
            let r = td(t.key);
            Object.assign(t, {
                isHeldReported: !0,
                waitingFor: r
            }), tm(e, "held", t.key, e7(t), t.taps, r)
        },
        th = (e, t, r) => {
            r.isOutcomeReported || (tp(e, r), Object.assign(r, {
                isOutcomeReported: !0
            }), tm(e, t, r.key, e7(r), r.taps, r.waitingFor))
        },
        tf = (0, O.createContext)({
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
        }),
        tg = function(e, t) {
            let {
                enabled: r = !0,
                onReplay: n,
                onActivationLost: a,
                requiresUserActivation: i
            } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {}, s = (0, O.useRef)({
                onReplay: n,
                onActivationLost: a
            });
            (0, O.useEffect)(() => {
                s.current = {
                    onReplay: n,
                    onActivationLost: a
                }
            }, [n, a]), (0, O.useEffect)(() => {
                r && e.current && ts(e.current, t, {
                    onReplay: e => s.current.onReplay?.(e),
                    onActivationLost: e => s.current.onActivationLost?.(e),
                    requiresUserActivation: i
                })
            }, [r, t, i, e])
        },
        tx = function(e) {
            let t, {
                    isEnabled: r = !0,
                    isRedirect: n = !1,
                    isAwaitingUrl: a = !1,
                    onReplay: i
                } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                s = r && !0,
                l = (0, O.useRef)(null),
                {
                    trackEarlyClick: o
                } = (0, O.useContext)(eD);
            (0, O.useEffect)(() => s && n ? (tu.add(e), () => {
                tu.delete(e)
            }) : () => void 0, [e, s, n]);
            let c = (0, O.useCallback)((e, t) => {
                th(o, e, t)
            }, [o]);
            tg(l, e, {
                enabled: s && !a,
                requiresUserActivation: n,
                onReplay: (0, O.useCallback)(e => {
                    c("replayed", e), i?.(e)
                }, [c, i]),
                onActivationLost: (0, O.useCallback)(e => {
                    c("activationLost", e)
                }, [c])
            });
            let {
                redirectError: {
                    openModal: u
                }
            } = (0, O.useContext)(tf);
            return ((e, t, r) => {
                let {
                    enabled: n,
                    afterMs: a = 1e4,
                    onGiveUp: i
                } = r, s = (0, O.useRef)(i);
                (0, O.useEffect)(() => {
                    s.current = i
                }, [i]), (0, O.useEffect)(() => {
                    let r, i = e.current;
                    if (!n || !i || !et.window) return;
                    let l = et.window,
                        o = () => {
                            void 0 !== r && (l.clearTimeout(r), r = void 0)
                        },
                        c = () => {
                            let e = l.robuxEarlyClick;
                            if (e?.key !== t) return void o();
                            if (void 0 !== r) return;
                            let n = Math.max(0, l.performance.now() - e.startedAt);
                            r = l.setTimeout(() => {
                                let e;
                                if (r = void 0, l.robuxEarlyClick?.key !== t) return;
                                let n = (i.setAttribute(e9.EARLY_CLICK_HYDRATED_ATTR, ""), e = ta(t), ti(i), e);
                                n && s.current?.(n)
                            }, Math.max(0, a - n))
                        };
                    return c(), l.addEventListener(e9.EARLY_CLICK_EVENT, c), () => {
                        l.removeEventListener(e9.EARLY_CLICK_EVENT, c), o()
                    }
                }, [n, t, a, e])
            })(l, e, {
                enabled: s && a,
                onGiveUp: (0, O.useCallback)(e => {
                    c("gaveUp", e), u()
                }, [c, u])
            }), {
                ref: l,
                ...s ? (t = et.window?.robuxEarlyClick?.key === e, {
                    [e9.EARLY_CLICK_ROW_ATTR]: e,
                    [e9.EARLY_CLICK_PENDING_ATTR]: t ? "" : void 0,
                    "aria-busy": !!t || void 0
                }) : {}
            }
        },
        tb = function(e) {
            let {
                isEnabled: t
            } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            return tx(e, {
                isEnabled: t
            })
        },
        ty = (e, t) => {
            let {
                isRedirect: r,
                hasUrl: n
            } = t, a = r && !n;
            return {
                isAwaitingUrl: a,
                rowProps: tx(e, {
                    isRedirect: r,
                    isAwaitingUrl: a
                }),
                linkProps: a ? tn : {}
            }
        },
        {
            ENUM_VIEW_NAME: {
                EARLY_CLICK: tv
            },
            ENUM_PURCHASE_EVENT_TYPE: {
                USER_INPUT: tS
            }
        } = G.paymentFlowAnalyticsService,
        {
            ENUM_VIEW_NAME: {
                ROBUX_SEND_TRANSFERS: tE,
                ROBUX_PENDING_TRANSFERS: tC
            },
            ENUM_PURCHASE_EVENT_TYPE: {
                VIEW_SHOWN: tP,
                USER_INPUT: tw
            },
            ENUM_VIEW_MESSAGE: {
                TRANSFER_SEND_BUTTON: tN,
                TRANSFER_SEND_SHEET: tk,
                TRANSFER_SEND_USER_SELECTED: tT,
                TRANSFER_PENDING_BUTTON: tj,
                TRANSFER_PENDING_SHEET: tA,
                TRANSFER_PENDING_ACCEPT_CLICK: tR
            }
        } = G.paymentFlowAnalyticsService;

    function tM(e) {
        var t;
        let {
            children: r
        } = e, n = function() {
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
            } = (0, O.useContext)(em), c = function() {
                let [e, t] = (0, O.useState)();
                return (0, O.useEffect)(() => {
                    if (void 0 === et.window) return;
                    let e = et.window.location.href.includes("sitetest1") ? "merchant.sitetest1.robloxlabs.com.stripe" : "merchant.www.roblox.com.stripe",
                        {
                            ApplePaySession: r
                        } = et.window;
                    (async () => {
                        try {
                            if (!r?.canMakePayments()) return void t(!1);
                            let n = await r.canMakePaymentsWithActiveCard(e);
                            t(!!n)
                        } catch (e) {
                            ew("ApplePayAvailabilityException", null, e), t(!1)
                        }
                    })()
                }, []), e
            }(), {
                seenProducts: u,
                seenSections: d,
                seenSubscriptionProducts: m
            } = function() {
                let e = (0, O.useRef)(new Set),
                    t = (0, O.useRef)(new Set),
                    r = (0, O.useRef)(new Map),
                    [n, a] = (0, O.useState)({
                        seenProducts: [],
                        seenSections: [],
                        seenSubscriptionProducts: []
                    }),
                    i = (0, O.useCallback)(() => {
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
                    [s, l] = (0, O.useMemo)(() => {
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
                    o = (0, O.useMemo)(() => [{
                        attr: eY,
                        record: t => {
                            let r = t.getAttribute(eY);
                            return !(!r || e.current.has(r)) && (e.current.add(r), !0)
                        }
                    }, {
                        attr: eq,
                        record: e => {
                            let r = e.getAttribute(eq);
                            return !(!r || t.current.has(r)) && (t.current.add(r), !0)
                        }
                    }, {
                        attr: eX,
                        record: e => {
                            let t = e.getAttribute(eX);
                            if (!t || r.current.has(t)) return !1;
                            let n = e.getAttribute(eJ) ?? "";
                            return r.current.set(t, n), !0
                        }
                    }], []),
                    c = (0, O.useCallback)((e, t) => {
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
                return (0, O.useEffect)(() => {
                    let e = et.document?.getElementById("robux-redesign-page");
                    if (!e) return;
                    let t = [...e.querySelectorAll(eZ)];
                    if (0 === t.length) return;
                    let r = (0, e$.observeIntersection)({
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
            } = G.paymentFlowAnalyticsService, b = (0, O.useMemo)(() => ({
                applePayAvailability: c?.toString() ?? "",
                ctx: l.ctx ?? "",
                limitedTimeBonusItemIds: e.ids.toString(),
                paymentSessionId: r?.id ?? "",
                personalizedBonusItem: t?.toString() ?? "",
                robuxBalance: a?.toString() ?? "",
                robuxPackageIds: n.toString(),
                sectionNames: i.toString(),
                subscriptionProductIds: s.toString()
            }), [c, l, e, r, t, a, n, i, s]), y = (0, O.useCallback)((e, t, r, n) => {
                G.paymentFlowAnalyticsService.sendUserPurchaseFlowEventViaFetch({
                    triggerContext: eQ(o, e === p),
                    isMidPurchaseStep: !0,
                    viewName: e,
                    purchaseEventType: t,
                    viewMessage: r,
                    eventMetadata: {
                        ...b,
                        ...n
                    }
                })
            }, [b, p, o]), v = (0, O.useCallback)((e, t, r) => {
                G.paymentFlowAnalyticsService.sendUserPurchaseStatusEventViaFetch({
                    triggerContext: eQ(o, e === p),
                    status: t,
                    viewMessage: r,
                    viewName: e
                })
            }, [p, o]);
            return (0, O.useEffect)(() => {
                G.paymentFlowAnalyticsService.sendUserPurchaseFlowEventViaFetch({
                    triggerContext: eQ(o, !1),
                    isMidPurchaseStep: !0,
                    viewName: h,
                    purchaseEventType: g,
                    eventMetadata: b
                })
            }, [b, o, h, g]), (0, O.useEffect)(() => {
                (u.length > 0 || d.length > 0 || m.length > 0) && y(f, x, void 0, {
                    seenProducts: u.toString(),
                    seenSections: d.toString(),
                    seenSubscriptionProducts: JSON.stringify(m)
                })
            }, [u, d, m, y, f, x]), {
                trackFlow: y,
                trackStatus: v
            }
        }(), a = function(e) {
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
            } = G.paymentFlowAnalyticsService;
            return {
                trackGiftCardClick: (0, O.useCallback)(() => {
                    t(n, a, r)
                }, [t, n, a, r])
            }
        }(n), i = function(e) {
            let {
                trackFlow: t
            } = e, r = (0, O.useCallback)(() => {
                t(tE, tP, tN), eP("TransferSendImpression")
            }, [t]), n = (0, O.useCallback)(() => {
                t(tE, tP, tk), eP("TransferSendSheetView")
            }, [t]), a = (0, O.useCallback)(e => {
                t(tE, tw, tT), eP("TransferSendUserSelected", {
                    source: e
                })
            }, [t]), i = (0, O.useCallback)(() => {
                t(tC, tP, tj), eP("TransferPendingImpression")
            }, [t]);
            return {
                trackTransferSendImpression: r,
                trackTransferSendSheetView: n,
                trackTransferSendUserSelected: a,
                trackPendingTransfersImpression: i,
                trackPendingTransfersSheetView: (0, O.useCallback)(() => {
                    t(tC, tP, tA), eP("TransferPendingSheetView")
                }, [t]),
                trackPendingTransfersAcceptClick: (0, O.useCallback)(() => {
                    t(tC, tw, tR), eP("TransferPendingAcceptClick")
                }, [t])
            }
        }(n), s = function(e) {
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
            } = G.paymentFlowAnalyticsService, u = (0, O.useCallback)(() => {
                t(i, o, r)
            }, [t, i, o, r]), d = (0, O.useCallback)(() => {
                t(s, o, n)
            }, [t, s, o, n]);
            return {
                trackSamsungPaymentMethodsCancel: u,
                trackSamsungPaymentMethodsRedeemCreditClick: d,
                trackSamsungPaymentMethodsSamsungPayClick: (0, O.useCallback)(() => {
                    t(l, o, a)
                }, [t, l, o, a]),
                trackSamsungPaymentMethodsShown: (0, O.useCallback)(() => {
                    t(i, c)
                }, [t, i, c])
            }
        }(n), l = function(e) {
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
            } = G.paymentFlowAnalyticsService;
            return {
                trackPurchase: (0, O.useCallback)((e, i, s) => {
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
        }(n), o = function(e) {
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
            } = G.paymentFlowAnalyticsService, u = (0, O.useCallback)(() => {
                t(i, c)
            }, [t, i, c]), d = (0, O.useCallback)(e => {
                t(e ? s : l, o, a)
            }, [t, s, l, o, a]);
            return {
                trackEconomicRestrictionErrorShown: u,
                trackPurchaseDisabledConfirm: d,
                trackPurchaseDisabledNeutral: (0, O.useCallback)(e => {
                    t(e ? s : l, o, e ? n : r)
                }, [t, s, l, o, n, r]),
                trackPurchaseDisabledShown: (0, O.useCallback)(e => {
                    t(e ? s : l, c, e8.UserPurchaseSettingFailureReason.PurchaseNotEnabled)
                }, [t, s, l, c])
            }
        }(n), c = function(e) {
            let {
                trackFlow: t
            } = e, {
                ENUM_VIEW_NAME: {
                    PURCHASE_WARNING: r
                },
                ENUM_PURCHASE_EVENT_TYPE: {
                    VIEW_SHOWN: n
                }
            } = G.paymentFlowAnalyticsService;
            return {
                trackPurchaseWarningShown: (0, O.useCallback)(e => {
                    t(r, n, e)
                }, [t, r, n])
            }
        }(n), u = function(e) {
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
            } = G.paymentFlowAnalyticsService, m = (0, O.useCallback)(() => {
                t(o, u, i)
            }, [t, o, u, i]), p = (0, O.useCallback)(() => {
                t(o, u, s)
            }, [t, o, u, s]), h = (0, O.useCallback)(() => {
                t(o, u, a)
            }, [t, o, u, a]), f = (0, O.useCallback)(e => {
                r(o, n, e?.productId)
            }, [r, o, n]), g = (0, O.useCallback)(e => {
                let {
                    productId: r
                } = e;
                t(o, d, void 0, {
                    productId: r
                })
            }, [t, o, d]);
            return {
                trackQuickPay3DSShown: (0, O.useCallback)(() => {
                    t(c, d)
                }, [t, c, d]),
                trackQuickPayClick: m,
                trackQuickPayClickPaymentMethodDropdown: p,
                trackQuickPayClose: h,
                trackQuickPayPurchase: f,
                trackQuickPayShown: g,
                trackQuickPayUseDifferentPaymentMethod: (0, O.useCallback)(() => {
                    t(o, u, l)
                }, [t, o, u, l])
            }
        }(n), d = function(e) {
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
            } = G.paymentFlowAnalyticsService;
            return {
                trackRobuxGiftClick: (0, O.useCallback)(() => {
                    t(n, i, r)
                }, [t, n, i, r]),
                trackRobuxGiftShown: (0, O.useCallback)(() => {
                    t(a, s, r)
                }, [t, a, s, r])
            }
        }(n), m = function(e) {
            let {
                trackFlow: t
            } = e, r = (0, O.useCallback)(e => {
                t(e1, e3, void 0, {
                    isFreeTrial: String(e)
                })
            }, [t]);
            return {
                trackSubscriptionV2Shown: r,
                trackSubscriptionV2SubscribeClick: (0, O.useCallback)(e => {
                    let {
                        isFreeTrial: r,
                        productId: n,
                        isRedirect: a
                    } = e;
                    eP("SubscriptionV2SubscribeClick", {
                        isFreeTrial: String(r),
                        productId: n,
                        isRedirect: String(a)
                    }), t(e1, e2, r ? e5 : e6, {
                        isFreeTrial: String(r),
                        productId: n,
                        isRedirect: String(a)
                    })
                }, [t]),
                trackSubscriptionV2LearnMoreClick: (0, O.useCallback)(() => {
                    eP("SubscriptionV2LearnMoreClick"), t(e1, e2, e4)
                }, [t])
            }
        }(n), p = function(e) {
            let {
                trackFlow: t
            } = e;
            return {
                trackRedirectClick: (0, O.useCallback)(e => {
                    let {
                        product: r,
                        isSubscriptionRedirect: n,
                        loginRedirectVersion: a
                    } = e;
                    eP("MobileToWebPurchaseRedirect", {
                        version: a ?? "none"
                    }), t(r ? n ? G.paymentFlowAnalyticsService.ENUM_VIEW_NAME.PREMIUM_PURCHASE : G.paymentFlowAnalyticsService.ENUM_VIEW_NAME.PRODUCT_PURCHASE : G.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBUX_REDIRECT_BANNER, G.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT, G.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.BUY_REDIRECT, {
                        productId: r?.productId.toString() ?? ""
                    })
                }, [t])
            }
        }(n), h = function(e) {
            let {
                trackFlow: t
            } = e, {
                deviceMeta: r
            } = (0, O.useContext)(em);
            return {
                trackEarlyClick: (0, O.useCallback)(e => {
                    let {
                        outcome: n,
                        kind: a,
                        productId: i,
                        waitingFor: s,
                        waitMs: l,
                        taps: o
                    } = e;
                    eP("EarlyClickTap", {
                        outcome: n,
                        kind: a,
                        waitingFor: s,
                        waitBucket: tc.find(e => {
                            let {
                                maxMs: t
                            } = e;
                            return l <= t
                        })?.label ?? "10s+",
                        tapCount: o <= 1 ? "1" : 2 === o ? "2" : 3 === o ? "3" : "4+",
                        os: r.operatingSystem
                    }), t(tv, tS, void 0, {
                        outcome: n,
                        kind: a,
                        productId: i,
                        waitingFor: s,
                        waitMs: String(Math.round(l)),
                        taps: String(o)
                    })
                }, [r.operatingSystem, t])
            }
        }(n);
        t = h.trackEarlyClick, (0, O.useEffect)(() => {
            if (!et.window || !et.document) return;
            let e = et.window,
                r = et.document;
            e.robuxEarlyClickReactReady = !0;
            let n = () => {
                    let r, n, a = e.robuxEarlyClick;
                    a && tp(t, a), (r = et.window?.robuxEarlyClickExpired ?? [], delete et.window?.robuxEarlyClickExpired, r).forEach(e => {
                        let {
                            key: r,
                            taps: n,
                            waitMs: a,
                            isHeldReported: i,
                            waitingFor: s
                        } = e;
                        i || tm(t, "held", r, a, n, s), tm(t, "expired", r, a, n, s)
                    }), (n = et.window?.robuxEarlyClickDiscarded ?? [], delete et.window?.robuxEarlyClickDiscarded, n).forEach(e => {
                        let {
                            key: r,
                            taps: n,
                            waitMs: a,
                            isHeldReported: i,
                            reason: s,
                            waitingFor: l
                        } = e;
                        i || tm(t, "held", r, a, n, l), tm(t, s, r, a, n, l)
                    })
                },
                a = () => {
                    let n = e.robuxEarlyClick;
                    "hidden" === r.visibilityState && n && th(t, "abandoned", n)
                };
            return n(), e.addEventListener(e9.EARLY_CLICK_EVENT, n), e.addEventListener("visibilitychange", a, !0), () => {
                e.removeEventListener(e9.EARLY_CLICK_EVENT, n), e.removeEventListener("visibilitychange", a, !0)
            }
        }, [t]);
        let f = (0, O.useMemo)(() => ({
            ...a,
            ...s,
            ...l,
            ...o,
            ...c,
            ...u,
            ...d,
            ...m,
            ...p,
            ...h,
            ...i
        }), [a, s, l, o, c, u, d, m, p, h, i]);
        return (0, F.jsx)(eD.Provider, {
            value: f,
            children: r
        })
    }
    var tI = e.i(579149),
        t_ = e.i(420546),
        tU = e.i(679025),
        tL = e.i(695524),
        tF = O;
    let tD = "u" < typeof __SENTRY_DEBUG__ || __SENTRY_DEBUG__;
    var tB = e.i(285586),
        tO = e.i(59172);
    let tG = Symbol.for("react.forward_ref"),
        tz = Symbol.for("react.memo"),
        tV = {};
    tV[tG] = {
        $$typeof: !0,
        render: !0,
        defaultProps: !0,
        displayName: !0,
        propTypes: !0
    }, tV[tz] = {
        $$typeof: !0,
        compare: !0,
        defaultProps: !0,
        displayName: !0,
        propTypes: !0,
        type: !0
    }, Object.defineProperty.bind(Object), Object.getOwnPropertyNames.bind(Object), Object.getOwnPropertySymbols?.bind(Object), Object.getOwnPropertyDescriptor.bind(Object), Object.getPrototypeOf.bind(Object);
    let tW = {
        componentStack: null,
        error: null,
        eventId: null
    };
    class tK extends tF.Component {
        componentDidCatch(e, t) {
            let {
                componentStack: r
            } = t, {
                beforeCapture: n,
                onError: a,
                showDialog: i,
                dialogOptions: s
            } = this.props;
            (0, t_.withScope)(l => {
                n && n(l, e, r);
                let o = function(e, t, r) {
                    let n, {
                        componentStack: a
                    } = t;
                    if (null !== (n = O.version.match(/^([^.]+)/)) && parseInt(n[0]) >= 17 && (0, tO.isError)(e) && a) {
                        let t, r = Error(e.message);
                        r.name = `React ErrorBoundary ${e.name}`, r.stack = a, t = new WeakSet,
                            function e(r, n) {
                                if (!t.has(r)) {
                                    if (r.cause) return t.add(r), e(r.cause, n);
                                    r.cause = n
                                }
                            }(e, r)
                    }
                    return (0, t_.withScope)(t => (t.setContext("react", {
                        componentStack: a
                    }), (0, tB.captureException)(e, r)))
                }(e, t, {
                    mechanism: {
                        handled: null != this.props.handled ? this.props.handled : !!this.props.fallback,
                        type: "auto.function.react.error_boundary"
                    }
                });
                a && a(e, r, o), i && (this._lastEventId = o, this._openFallbackReportDialog && (0, tU.showReportDialog)({
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
            n && (this.state === tW ? n(null, null, null) : n(e, t, r)), this._cleanupHook && (this._cleanupHook(), this._cleanupHook = void 0)
        }
        resetErrorBoundary() {
            let {
                onReset: e
            } = this.props, {
                error: t,
                componentStack: r,
                eventId: n
            } = this.state;
            e && e(t, r, n), this.setState(tW)
        }
        render() {
            let {
                fallback: e,
                children: t
            } = this.props, r = this.state;
            if (null === r.componentStack) return "function" == typeof t ? t() : t;
            let n = "function" == typeof e ? tF.createElement(e, {
                error: r.error,
                componentStack: r.componentStack,
                resetError: () => this.resetErrorBoundary(),
                eventId: r.eventId
            }) : e;
            return tF.isValidElement(n) ? n : (e && tD && tL.debug.warn("fallback did not produce a valid ReactElement"), null)
        }
        constructor(e) {
            super(e), this.state = tW, this._openFallbackReportDialog = !0;
            const t = (0, t_.getClient)();
            t && e.showDialog && (this._openFallbackReportDialog = !1, this._cleanupHook = t.on("afterSendEvent", t => {
                !t.type && this._lastEventId && t.event_id === this._lastEventId && (0, tU.showReportDialog)({
                    ...e.dialogOptions,
                    eventId: this._lastEventId
                })
            }))
        }
    }
    var tH = e.i(727516),
        tQ = e.i(332210);

    function t$(e) {
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
        } = e, [d, m] = (0, O.useState)(!1), p = (0, O.useRef)(!1);
        (0, O.useEffect)(() => {
            t && !p.current && (p.current = !0, G.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent({
                triggerContext: i,
                isMidPurchaseStep: !0,
                viewName: G.paymentFlowAnalyticsService.ENUM_VIEW_NAME.FIRST_TIME_PURCHASE_CONSENT_MODAL,
                purchaseEventType: G.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN
            })), t || (p.current = !1)
        }, [t, i]);
        let h = (0, O.useCallback)(e => {
                m(!0 === e), G.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent({
                    triggerContext: i,
                    isMidPurchaseStep: !0,
                    viewName: G.paymentFlowAnalyticsService.ENUM_VIEW_NAME.FIRST_TIME_PURCHASE_CONSENT_MODAL,
                    purchaseEventType: G.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT,
                    eventMetadata: {
                        checkboxState: String(!0 === e)
                    }
                })
            }, [i]),
            f = (0, O.useCallback)(() => {
                a("FirstTimePurchaseConsent_Confirmed"), G.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent({
                    triggerContext: i,
                    isMidPurchaseStep: !0,
                    viewName: G.paymentFlowAnalyticsService.ENUM_VIEW_NAME.FIRST_TIME_PURCHASE_CONSENT_MODAL,
                    purchaseEventType: G.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT,
                    viewMessage: G.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.CONFIRM
                }), m(!1), r()
            }, [r, a, i]),
            g = (0, O.useCallback)(() => {
                a("FirstTimePurchaseConsent_Cancelled"), G.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent({
                    triggerContext: i,
                    isMidPurchaseStep: !0,
                    viewName: G.paymentFlowAnalyticsService.ENUM_VIEW_NAME.FIRST_TIME_PURCHASE_CONSENT_MODAL,
                    purchaseEventType: G.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.USER_INPUT,
                    viewMessage: G.paymentFlowAnalyticsService.ENUM_VIEW_MESSAGE.CANCEL
                }), m(!1), n()
            }, [n, a, i]);
        return (0, F.jsx)(tQ.Dialog, {
            open: t,
            onOpenChange: e => {
                e || g()
            },
            size: "Small",
            isModal: !0,
            hasCloseAffordance: !1,
            children: (0, F.jsxs)(tQ.DialogContent, {
                children: [(0, F.jsxs)(tQ.DialogBody, {
                    children: [(0, F.jsx)("div", {
                        className: "text-heading-small content-emphasis padding-y-[4px]",
                        children: s
                    }), (0, F.jsx)("div", {
                        className: "text-body-medium padding-bottom-large content-default",
                        children: l
                    }), (0, F.jsxs)("div", {
                        className: "flex flex-row gap-medium",
                        children: [(0, F.jsx)(tH.Checkbox, {
                            isChecked: d,
                            onCheckedChange: h,
                            label: "",
                            size: "Medium",
                            placement: "Start"
                        }), (0, F.jsx)("div", {
                            className: "text-body-small content-emphasis",
                            children: o
                        })]
                    })]
                }), (0, F.jsx)(tQ.DialogFooter, {
                    children: (0, F.jsxs)("div", {
                        className: "flex flex-col gap-small padding-top-xsmall",
                        children: [(0, F.jsx)(V.Button, {
                            isDisabled: !d,
                            onClick: f,
                            variant: "Emphasis",
                            size: "Medium",
                            children: c
                        }), (0, F.jsx)(V.Button, {
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
    var tY = ((d = {}).U13PaymentModal = "U13PaymentModal", d.U13MonthlyThreshold1Modal = "U13MonthlyThreshold1Modal", d.U13MonthlyThreshold2Modal = "U13MonthlyThreshold2Modal", d.ParentalConsentWarningPaymentModal13To17 = "ParentalConsentWarningPaymentModal13To17", d);
    let tq = async (e, t) => e_(eM.GET, eI.GET_PURCHASE_WARNING, {
        url: `${eo.EnvironmentUrls.apiGatewayUrl}/purchase-warning/v1/purchase-warnings`,
        withCredentials: !0
    }, {
        is13To17ScaryModalEnabled: e,
        productId: t
    }), tX = async e => ek({
        method: "POST",
        url: `${eo.EnvironmentUrls.apiGatewayUrl}/purchase-warning/v1/purchase-warnings/acknowledge`,
        data: {
            acknowledgement: `Confirmed${e}`
        },
        config: {
            withCredentials: !0
        },
        eventCounterProps: {
            call: "AcknowledgePurchaseWarning"
        }
    }), tJ = "<br /><br />";

    function tZ() {
        let {
            purchaseWarning: {
                action: e,
                closeModal: t,
                continuePurchase: r,
                isOpen: n
            }
        } = (0, O.useContext)(tf), a = (0, ei.useTranslations)("Feature.Premium"), i = (0, ei.useTranslations)("CommonUI.Controls"), s = (0, O.useMemo)(() => {
            switch (e) {
                case tY.U13PaymentModal:
                    return a("Description.ScaryModalBodyNew", {
                        lineBreak: tJ
                    });
                case tY.ParentalConsentWarningPaymentModal13To17:
                    return a("Description.ScaryModalBody13To17");
                case tY.U13MonthlyThreshold1Modal:
                    return a("Description.ScaryModalThreshold1Body", {
                        linebreak: tJ
                    });
                case tY.U13MonthlyThreshold2Modal:
                    return a("Description.ScaryModalThreshold2Body", {
                        linebreak: tJ
                    });
                default:
                    return null
            }
        }, [e, a]), l = (0, O.useCallback)(() => {
            e && tX(e).then(() => {
                eP("PurchaseWarningAcknowledged")
            }).catch(e => {
                ew("PurchaseWarningAcknowledgeFailed", {}, e)
            }).finally(() => {
                t(), r?.()
            })
        }, [e, t, r]);
        return (0, F.jsx)(tQ.Dialog, {
            open: n,
            onOpenChange: t,
            isModal: !0,
            hasCloseAffordance: !0,
            closeLabel: i("Action.Close"),
            size: "Medium",
            children: (0, F.jsxs)(tQ.DialogContent, {
                children: [(0, F.jsxs)(tQ.DialogBody, {
                    className: "flex flex-col gap-medium",
                    children: [(0, F.jsx)(tQ.DialogTitle, {
                        children: a("Heading.ScaryModalTitle")
                    }), (0, F.jsx)("div", {
                        children: s && (0, F.jsx)("div", {
                            children: (0, F.jsx)("span", {
                                className: "text-description",
                                dangerouslySetInnerHTML: {
                                    __html: s
                                }
                            })
                        })
                    })]
                }), (0, F.jsx)(tQ.DialogFooter, {
                    children: (0, F.jsxs)("div", {
                        className: "flex flex-row gap-medium",
                        children: [(0, F.jsx)(V.Button, {
                            onClick: l,
                            variant: "Emphasis",
                            className: "width-full",
                            children: i("Action.OK")
                        }), (0, F.jsx)(V.Button, {
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

    function t0() {
        let {
            purchaseDisabled: {
                closeModal: e,
                hasUserDisabledPurchases: t,
                isOpen: r,
                showVPCOptimization: n
            }
        } = (0, O.useContext)(tf), {
            trackPurchaseDisabledConfirm: a,
            trackPurchaseDisabledNeutral: i
        } = (0, O.useContext)(eD), s = (0, ei.useTranslations)("Common.VerifiedParentalConsent"), [l, o] = (0, O.useMemo)(() => n && !t ? [s("Label.RequestPending"), s("Description.ExistingPendingRequestRedirectToSettings")] : n && t ? [s("Label.UpdateYourSettings"), s("Description.EnablePurchasesInSettings")] : [s("Label.AskParent"), s("Description.SpendingRestrictionWithSettings")], [n, t, s]), c = (0, O.useCallback)(() => {
            void 0 !== et.window && (a(n), et.window.location.href = "/my/account#!/billing")
        }, [a, n]), u = (0, O.useCallback)(() => {
            i(n), e()
        }, [i, n, e]);
        return (0, F.jsx)(tQ.Dialog, {
            open: r,
            onOpenChange: e => {
                e || u()
            },
            size: "Medium",
            isModal: !0,
            hasCloseAffordance: !0,
            closeLabel: s("Action.Close"),
            children: (0, F.jsxs)(tQ.DialogContent, {
                children: [(0, F.jsxs)(tQ.DialogBody, {
                    children: [(0, F.jsx)(tQ.DialogTitle, {
                        children: (0, F.jsx)("div", {
                            children: l
                        })
                    }), (0, F.jsx)("div", {
                        className: "text-body-large",
                        children: o
                    })]
                }), (0, F.jsx)(tQ.DialogFooter, {
                    children: (0, F.jsxs)("div", {
                        className: "flex flex-row gap-small",
                        children: [(0, F.jsx)(V.Button, {
                            onClick: c,
                            variant: "Emphasis",
                            className: "width-full",
                            children: s("Action.GoToSettings")
                        }), (0, F.jsx)(V.Button, {
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
    var t1 = e.i(939747),
        t2 = e.i(242637),
        t3 = e.i(459089),
        t5 = e.i(698870);

    function t6() {
        let [e, t] = (0, O.useState)(!1), {
            deviceMeta: r,
            giftingAvatarImageUrl: n,
            giftingUrl: a
        } = (0, O.useContext)(em), {
            robuxGifting: {
                closeModal: i,
                isOpen: s
            }
        } = (0, O.useContext)(tf), l = (0, ei.useTranslations)("Feature.GiftingProducts"), {
            handleCopyUrl: o,
            handleShareLink: c,
            qrImgSrc: u
        } = function(e, t) {
            let [r, n] = (0, O.useState)("");
            return (0, O.useEffect)(() => {
                async function t() {
                    try {
                        n(await (0, t5.toDataURL)(e, {
                            errorCorrectionLevel: "H",
                            margin: 0,
                            width: 306
                        })), eP("RobuxGiftingQrGenerated")
                    } catch (e) {
                        ew("QRCodeGenerationFailed", null, e)
                    }
                }
                e && t()
            }, [e]), {
                handleCopyUrl: (0, O.useCallback)(() => {
                    void 0 !== et.navigator && e && et.navigator.clipboard.writeText(e).catch(e => {
                        ew("RobuxGiftingCopyFailed", null, e)
                    })
                }, [e]),
                handleShareLink: (0, O.useCallback)(() => {
                    if (void 0 === et.window || void 0 === et.navigator || !e) return;
                    let {
                        DOMException: r
                    } = et.window;
                    if (t.isIosDevice || t.isAndroidDevice || t.isUniversalApp) {
                        eP("RobuxGiftingShare", {
                            method: "native"
                        }), et.navigator.share({
                            url: e
                        }).catch(e => {
                            e instanceof r && "AbortError" === e.name ? eP("RobuxGiftingShareDismissed") : ew("RobuxGiftingShareFailed", null, e)
                        });
                        return
                    }
                    eP("RobuxGiftingShare", {
                        method: "mailto"
                    }), et.window.location.href = `mailto:?body=${encodeURIComponent(e)}`
                }, [t, e]),
                qrImgSrc: r
            }
        }(a, r), d = (0, el.getCurrentUser)(), m = null != d, p = (0, O.useRef)(!1);
        if ((0, O.useEffect)(() => {
                m && (s ? eP("RobuxGiftingModalShown") : p.current && eP("RobuxGiftingModalClosed"), p.current = s)
            }, [m, s]), !d) return null;
        let {
            displayName: h,
            userName: f
        } = d, g = `@${f}`;
        return (0, F.jsx)(tQ.Dialog, {
            open: s,
            onOpenChange: i,
            size: "Medium",
            isModal: !0,
            hasCloseAffordance: !0,
            closeLabel: l("Action.Gifting.Close"),
            children: (0, F.jsxs)(tQ.DialogContent, {
                children: [(0, F.jsxs)(tQ.DialogBody, {
                    className: "flex flex-col gap-large",
                    children: [(0, F.jsx)(tQ.DialogTitle, {
                        children: (0, F.jsx)("div", {
                            className: "text-heading-medium",
                            children: l("Heading.Gifting.RequestRobux")
                        })
                    }), (0, F.jsxs)("div", {
                        className: "flex flex-col gap-medium",
                        children: [(0, F.jsx)("div", {
                            className: "text-body-large",
                            children: l("Message.Gifting.RequestRobuxDescriptionLine1")
                        }), (0, F.jsx)("div", {
                            className: "text-body-small",
                            children: l("Message.Gifting.RequestRobuxDescriptionLine2")
                        })]
                    }), (0, F.jsxs)("div", {
                        className: "flex flex-col gap-medium bg-[var(--color-extended-white-100)] items-center justify-center radius-large padding-large",
                        children: [(0, F.jsx)("div", {
                            className: "width-[158px] height-[158px] flex justify-center items-center",
                            style: {
                                backgroundImage: `url(${u})`,
                                backgroundPosition: "center",
                                backgroundSize: "contain",
                                transform: "rotate(22.7deg)",
                                marginTop: 28,
                                marginBottom: 20
                            },
                            children: (0, F.jsx)("div", {
                                className: "width-[56px] height-[56px] bg-[var(--color-extended-white-100)]",
                                children: (0, F.jsx)("span", {
                                    className: "clip",
                                    style: {
                                        float: "left"
                                    },
                                    children: n && (0, F.jsx)("img", {
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
                        }), (0, F.jsxs)("div", {
                            className: "text-align-x-center content-[var(--color-extended-gray-700)]",
                            children: [h && (0, F.jsx)("div", {
                                className: "text-title-large",
                                children: h
                            }), g && (0, F.jsx)("div", {
                                className: "text-body-small",
                                children: g
                            })]
                        })]
                    }), (0, F.jsx)("div", {
                        children: (0, F.jsxs)("div", {
                            className: "flex flex-row gap-small items-end",
                            children: [(0, F.jsx)(t2.TextInput, {
                                value: a,
                                onClick: e => {
                                    e.currentTarget.select()
                                },
                                label: l("Action.Gifting.CopyAndShareUrl")
                            }), (0, F.jsx)(t3.Tooltip, {
                                position: "left-center",
                                open: e,
                                title: l("Message.Gifting.UrlCopied"),
                                children: (0, F.jsx)(t3.TooltipTrigger, {
                                    asChild: !0,
                                    children: (0, F.jsx)(t1.IconButton, {
                                        icon: "icon-regular-chain-link",
                                        size: "Large",
                                        ariaLabel: l("Action.Gifting.CopyAndShareUrl"),
                                        onClick: () => {
                                            eP("RobuxGiftingCopyUrl"), o(), t(!0), setTimeout(() => {
                                                t(!1)
                                            }, 2e3)
                                        },
                                        variant: "Standard"
                                    })
                                })
                            })]
                        })
                    })]
                }), (0, F.jsx)(tQ.DialogFooter, {
                    children: (0, F.jsxs)("div", {
                        className: "flex flex-row gap-small justify-center",
                        children: [(0, F.jsx)(V.Button, {
                            variant: "Standard",
                            onClick: i,
                            className: "width-full",
                            children: l("Action.Gifting.Close")
                        }), (0, F.jsx)(V.Button, {
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
    var t4 = e.i(155581),
        t8 = e.i(659209),
        t9 = e.i(644165),
        t7 = e.i(641614),
        re = e.i(453893);
    let rt = O.createContext({
            hasCloseAffordance: !1,
            titleId: "",
            descriptionId: ""
        }),
        rr = e => {
            let t = window.matchMedia?.("(pointer: coarse)")?.matches ?? !1,
                r = document.activeElement?.matches(":focus-visible");
            t && !r && e.preventDefault()
        },
        rn = e => {
            let {
                open: t,
                defaultOpen: r,
                onOpenChange: n,
                children: a
            } = e;
            return O.createElement(re.Root, {
                open: t,
                defaultOpen: r,
                onOpenChange: n
            }, a)
        },
        ra = e => {
            let {
                asChild: t,
                className: r,
                children: n
            } = e;
            return O.createElement(re.Trigger, {
                asChild: t,
                className: r
            }, n)
        },
        ri = e => {
            let {
                position: t,
                hasBeak: r = !0,
                hasCloseAffordance: n,
                closeLabel: a,
                onOpenAutoFocus: i,
                className: s,
                children: l
            } = e, [o, c] = t.split("-"), u = "dark" === (0, t7.default)() ? "light" : "dark", d = (0, W.default)("fui-edu-tooltip"), m = `${d}-title`, p = `${d}-desc`, h = O.useMemo(() => ({
                hasCloseAffordance: !!n,
                titleId: m,
                descriptionId: p
            }), [n, m, p]);
            return O.createElement(re.Portal, null, O.createElement(re.Content, {
                side: o,
                align: c,
                sideOffset: 6,
                "aria-labelledby": m,
                "aria-describedby": p,
                onOpenAutoFocus: i ?? rr,
                className: (0, Q.default)("light" === u ? "color-mode-light" : "color-mode-dark", "relative foundation-web-portal-zindex bg-surface-100 radius-medium shadow-transient-low", "min-width-[240px] max-width-[296px]", s)
            }, r && O.createElement(re.Arrow, {
                asChild: !0
            }, O.createElement("div", {
                style: {
                    color: "var(--color-surface-100)"
                }
            }, O.createElement(t9.Beak, null))), n && O.createElement("div", {
                className: "absolute top-[var(--size-50)] right-[var(--size-100)]"
            }, O.createElement(re.Close, {
                asChild: !0
            }, O.createElement(H.CloseAffordance, {
                variant: "Utility",
                size: "Medium",
                isCircular: !0,
                "aria-label": a || ""
            }))), O.createElement(rt.Provider, {
                value: h
            }, l)))
        },
        rs = e => {
            let {
                children: t,
                className: r
            } = e, {
                hasCloseAffordance: n
            } = O.useContext(rt);
            return O.createElement("div", {
                className: (0, Q.default)("padding-medium", n && "padding-right-[var(--size-1100)]", r)
            }, t)
        },
        rl = e => {
            let {
                children: t,
                className: r
            } = e, {
                descriptionId: n
            } = O.useContext(rt);
            return O.createElement("div", {
                id: n,
                className: (0, Q.default)("text-body-medium content-default padding-top-xsmall", r)
            }, t)
        };
    var ro = e.i(411425),
        rc = e.i(638516);
    let ru = e => {
        let {
            ariaLabel: t
        } = e;
        return (0, F.jsx)("div", {
            className: "fixed width-full height-full flex items-center justify-center",
            style: {
                zIndex: 1030,
                top: 0,
                left: 0,
                backgroundColor: "var(--color-common-backdrop)"
            },
            children: (0, F.jsx)(ro.ProgressCircle, {
                ariaLabel: t,
                variant: "Indeterminate",
                size: "Large"
            })
        })
    };
    var rd = e.i(120274),
        rm = e.i(682259);
    let rp = ["icon-regular-star", "icon-regular-circle-star", "icon-regular-shopping-basket-check", "icon-regular-flame", "icon-filled-robux", "icon-regular-wallet", "icon-regular-tag"],
        rh = e => (0, rm.arrayIncludes)(rp, e);

    function rf(e) {
        return (Number(e.units ?? "0") + (e.nanos ?? 0) / 1e9).toString()
    }
    let rg = e => {
        let {
            Nanos: t,
            Units: r
        } = e;
        return parseFloat((r + t / 1e9).toFixed(2))
    };
    var rx = e.i(713633),
        rb = e.i(726799);
    let ry = e => e?.paymentProfileType === "paypal",
        rv = "****";

    function rS(e, t) {
        return new Intl.DateTimeFormat("default", {
            month: "2-digit",
            year: "2-digit"
        }).format(new Date(t, e - 1))
    }

    function rE(e) {
        let {
            expirationLabel: t,
            payload: r
        } = e, n = "payment-method-container text-body-small medium:text-body-large";
        return ry(r) ? (0, F.jsxs)("span", {
            className: n,
            children: [(0, F.jsx)("span", {
                className: "payment-method-image card-icon icon-paypal"
            }), (0, F.jsx)("span", {
                className: "paypal-email",
                children: r.Email
            })]
        }) : (0, F.jsxs)("span", {
            className: n,
            children: [(0, F.jsx)("span", {
                className: `payment-method-image card-icon ${function(e){switch(e.toLowerCase()){case"amex":case"americanexpress":return"icon-amex";case"discover":return"icon-discover";case"mastercard":return"icon-mastercard";case"visa":return"icon-visa";case"debit":return"icon-debit";default:return"icon-generic-card"}}(r.CardNetwork)}`
            }), (0, F.jsxs)("span", {
                className: "card-number",
                children: [(0, F.jsx)("span", {
                    className: "card-asterisk-mask",
                    children: rv
                }), (0, F.jsx)("span", {
                    className: "payment-profile-label",
                    children: r.Last4Digits
                })]
            }), (0, F.jsx)("span", {
                className: "card-exp-key",
                children: t
            }), (0, F.jsx)("span", {
                className: "card-exp-value",
                children: rS(r.ExpMonth, r.ExpYear)
            })]
        })
    }

    function rC(e) {
        var t, r;
        let {
            error: n,
            onSelectPaymentProfile: a,
            paymentProfiles: i,
            selectedPaymentProfile: s
        } = e, {
            trackQuickPayClickPaymentMethodDropdown: l
        } = (0, O.useContext)(eD), o = (0, ei.useTranslations)("Feature.Premium"), c = i.length > 1;
        return s?.providerPayload ? (0, F.jsx)(rx.Dropdown, {
            size: "Large",
            value: s.id,
            placeholder: (t = s.providerPayload, r = o("QuickPay.Expiration"), ry(t) ? t.Email ?? "" : `${rv}${t.Last4Digits} ${r} ${rS(t.ExpMonth,t.ExpYear)}`),
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
            children: (0, F.jsx)(rb.Menu, {
                children: (0, F.jsx)(rb.MenuSection, {
                    children: i.map(e => (0, F.jsx)(rb.MenuItem, {
                        value: e.id,
                        title: (0, F.jsx)(rE, {
                            expirationLabel: o("QuickPay.Expiration"),
                            payload: e.providerPayload
                        })
                    }, e.id))
                })
            })
        }) : null
    }
    var rP = e.i(371078);
    let rw = "https://stripe.com/legal/consumer",
        rN = (0, rP.getAbsoluteUrl)("/info/terms"),
        rk = (0, rP.getAbsoluteUrl)("/info/privacy"),
        rT = (0, rP.getAbsoluteUrl)("/my/account#!/billing");

    function rj(e, t, r) {
        return {
            closing: t,
            opening: e,
            render: e => (0, F.jsx)("a", {
                href: r,
                className: "text-link",
                children: e
            })
        }
    }
    let rA = [rj("termsLinkStart", "termsLinkEnd", rN), rj("privacyLinkStart", "privacyLinkEnd", rk), rj("billingLinkStart", "billingLinkEnd", rT), rj("stripeTermsLinkStart", "stripeTermsLinkEnd", rw), rj("stripePrivacyLinkStart", "stripePrivacyLinkEnd", rw)];

    function rR(e) {
        let {
            translationKey: t
        } = e, {
            translateFullKey: r
        } = (0, ei.useFullKeyTranslations)();
        return (0, F.jsx)("div", {
            className: "legal-disclosure-container",
            children: (0, F.jsx)("p", {
                className: "text-footer legal-text-holder content-default",
                style: {
                    fontSize: 10
                },
                children: r.html(t ?? "Feature.BuyRobux.Message.QuickPay.LegalDisclosureText", rA)
            })
        })
    }
    let rM = e => {
        let {
            amount: {
                nanos: t,
                units: r
            }
        } = e;
        return Number(r ?? 0) + (t ?? 0) / 1e9
    };

    function rI(e) {
        let {
            isChecked: t,
            onToggle: r,
            offer: {
                initialPrice: n,
                recurringPrice: a,
                robuxAmount: i
            }
        } = e, s = (0, ei.useTranslations)("Feature.Payment");
        return (0, F.jsx)("div", {
            className: "margin-top-small",
            "data-testid": "quick-pay-subscribe-and-save-offer",
            children: (0, F.jsx)(tH.Checkbox, {
                label: s.html("Label.SubscribeAndSaveV2", [{
                    opening: "robuxIconStart",
                    closing: "robuxIconEnd",
                    render: () => (0, F.jsx)(z.Icon, {
                        name: "icon-regular-robux",
                        size: "Small",
                        style: {
                            verticalAlign: "text-top"
                        }
                    })
                }, {
                    opening: "initialPriceStart",
                    closing: "initialPriceEnd",
                    render: () => (0, F.jsx)(rd.PriceTag, {
                        amount: rM(n),
                        currencyCode: n.amount.currencyCode,
                        tagClassName: "line-through"
                    })
                }, {
                    opening: "recurringPriceStart",
                    closing: "recurringPriceEnd",
                    render: () => (0, F.jsx)(rd.PriceTag, {
                        amount: rM(a),
                        currencyCode: a.amount.currencyCode
                    })
                }, {
                    opening: "subscriptionTermsStart",
                    closing: "subscriptionTermsEnd",
                    render: e => (0, F.jsx)("a", {
                        href: "https://en.help.roblox.com/hc/en-us/articles/46804865425300-Roblox-Subscription-Terms",
                        target: "_blank",
                        rel: "noopener noreferrer",
                        className: "content-link underline",
                        children: e
                    })
                }], {
                    robuxAmount: (0, t4.formatNumber)(i)
                }),
                size: "Medium",
                placement: "Start",
                onCheckedChange: r,
                isChecked: t
            })
        })
    }
    var r_ = e.i(564035);
    let rU = {
        src: e.i(921743).default,
        width: 12,
        height: 12,
        blurWidth: 0,
        blurHeight: 0
    };

    function rL(e) {
        let {
            size: t
        } = e;
        return (0, F.jsx)("img", {
            src: (0, r_.assetUrl)(rU),
            alt: "blue check icon",
            style: {
                width: t,
                height: t
            }
        })
    }

    function rF(e) {
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
        } = (0, O.useContext)(em), {
            quickPay: {
                closeModal: E,
                isOpen: C
            }
        } = (0, O.useContext)(tf), {
            trackQuickPayClose: P,
            trackQuickPayUseDifferentPaymentMethod: w
        } = (0, O.useContext)(eD), N = (0, ei.useTranslations)("Feature.Premium"), k = (0, ei.useTranslations)("Feature.BuyRobux"), T = (0, ei.useTranslations)("Feature.PersonalizedBonus"), j = (0, ei.useTranslations)("Feature.Payment"), {
            translateFullKey: A
        } = (0, ei.useFullKeyTranslations)(), R = (0, O.useMemo)(() => {
            if (u)
                for (let e of v.sections) {
                    let t = e.limitedTimeBonus?.limitedTimeBonuses.find(e => e.robuxProductIds.includes(u.productId));
                    if (t) return t.displayableBonus.collectibleItemMetadata
                }
        }, [u, v.sections]), M = !!(R ?? (t && x) ?? y), I = u ? p.find(e => e.productId === u.productId) : void 0, _ = !!(h && I), U = u?.price.amount ?? {
            currencyCode: "USD"
        }, [L, D] = (0, O.useState)(!1), [B, G] = (0, O.useState)(!1), [W, K] = (0, O.useState)(""), H = (0, O.useCallback)(async e => {
            K(""), D(!0);
            let {
                error: t,
                isLoading: r
            } = await i(e);
            t && K(t), D(r)
        }, [i]), Q = (0, O.useCallback)(() => {
            P(), E(), K("")
        }, [P, E]), $ = (0, O.useCallback)(() => {
            if (!u || void 0 === et.window) return;
            let e = S(u, !1),
                t = e.includes("?") ? "&" : "?";
            eP("QuickPaySubscribeAndSaveRedirect"), et.window.location.href = `${e}${t}subscribeAndSave=1`
        }, [S, u]), Y = (0, O.useCallback)(() => {
            w(), l(), E()
        }, [w, l, E]), [q = 0, X = 0] = (0, O.useMemo)(() => a ? [rg(a.amountTotal), rg(a.taxAmountExclusive)] : [], [a]), J = (0, O.useCallback)(e => {
            (async e => {
                let t = await s(e);
                t && K(t)
            })(e)
        }, [s]), Z = (0, O.useMemo)(() => (0, F.jsxs)("div", {
            className: "flex-container Placeholder Placeholder--animating",
            children: [(0, F.jsx)("span", {
                className: "Text Text-color--gray400 Text-fontSize--14 Text--tabularNumbers"
            }), (0, F.jsx)("span", {
                children: "$0.00"
            })]
        }), []);
        if ((0, O.useEffect)(() => (et.window?.addEventListener("message", J), () => {
                et.window?.removeEventListener("message", J)
            }), [J]), !d || !u || !c) return null;
        let ee = N("Label.PlusAmountMoreLower", {
            amount: (0, t4.formatNumber)(Number(u.bonusRobuxAmount))
        });
        return (0, F.jsx)(tQ.Dialog, {
            open: C,
            onOpenChange: e => {
                e || Q()
            },
            size: "Large",
            hasCloseAffordance: !0,
            closeLabel: N("Button.OneClickPay.Cancel"),
            isModal: !0,
            children: (0, F.jsxs)(tQ.DialogContent, {
                children: [(0, F.jsxs)(tQ.DialogBody, {
                    children: [(0, F.jsx)(tQ.DialogTitle, {
                        className: "text-heading-medium content-emphasis",
                        children: (0, F.jsx)("div", {
                            children: N("Message.OneClickPay.Title")
                        })
                    }), (0, F.jsx)(rc.Divider, {
                        className: "margin-y-small"
                    }), (0, F.jsxs)("div", {
                        className: "product",
                        children: [(0, F.jsxs)("div", {
                            className: "icon-wrapper",
                            children: [(0, F.jsx)(z.Icon, {
                                name: "icon-filled-robux",
                                size: "XXLarge",
                                style: {
                                    height: 60,
                                    width: 60,
                                    color: "var(--color-content-emphasis)"
                                }
                            }), (0, F.jsxs)("div", {
                                className: "product-detail",
                                children: [(0, F.jsx)("div", {
                                    className: "product-name",
                                    children: k("Label.RobuxQuantity", {
                                        quantity: (0, t4.formatNumber)(Number(u.robuxAmount))
                                    })
                                }), (0, F.jsx)(rd.PriceTag, {
                                    tagClassName: "product-price",
                                    amount: Number(rf(U)),
                                    currencyCode: U.currencyCode
                                })]
                            }), u.bonusRobuxAmount && u.bonusRobuxTagIcon && rh(u.bonusRobuxTagIcon) && (0, F.jsx)("div", {
                                className: "margin-top-[14px] margin-left-[6px] self-start",
                                children: (0, F.jsx)(t8.Badge, {
                                    variant: "Contrast",
                                    icon: u.bonusRobuxTagIcon,
                                    label: u.bonusRobuxTagTranslationKey ? A(u.bonusRobuxTagTranslationKey, {
                                        amount: (0, t4.formatNumber)(Number(u.bonusRobuxAmount))
                                    }, ee) : ee,
                                    className: "text-overflow",
                                    size: "XSmall"
                                })
                            })]
                        }), M && (0, F.jsxs)(O.Fragment, {
                            children: [(0, F.jsx)(z.Icon, {
                                name: "icon-filled-plus-large",
                                size: "XXLarge"
                            }), (0, F.jsxs)("div", {
                                className: "bonus-item-card-small",
                                children: [R ? (0, F.jsx)("img", {
                                    src: R.image2dUrl,
                                    alt: "bonus item",
                                    className: "height-[60px] width-auto max-width-full object-contain shrink-0"
                                }) : b ? (0, F.jsx)("div", {
                                    className: "icon-upsell-item-small-preview thumbnail-2d-container",
                                    children: (0, F.jsx)("img", {
                                        src: b,
                                        alt: "bonus item",
                                        className: "width-full height-full"
                                    })
                                }) : y ? (0, F.jsx)("img", {
                                    src: y.image2dUrl,
                                    alt: "bonus item",
                                    className: "width-[60px] height-[60px]"
                                }) : null, (0, F.jsxs)("div", {
                                    className: "description-container",
                                    children: [(0, F.jsx)("div", {
                                        className: "description-title",
                                        children: R ? A(R.translationKey, void 0, "Bonus Item") : g ?? A(y?.translationKey ?? "", void 0, "Bonus Item")
                                    }), (0, F.jsx)("div", {
                                        className: "description-subtitle",
                                        children: R?.creatorDisplayName ? (0, F.jsxs)("div", {
                                            className: "flex flex-row gap-xsmall self-stretch items-center justify-start margin-top-[8px]",
                                            children: [(0, F.jsx)("div", {
                                                className: "text-label-small medium:text-label-medium content-default",
                                                children: R.creatorDisplayName
                                            }), R.creatorIsVerified && (0, F.jsx)(rL, {
                                                size: 12
                                            })]
                                        }) : b ? N("Message.OneClickPay.BonusVirtualItem") : y ? (0, F.jsxs)("div", {
                                            className: "flex flex-row gap-xsmall self-stretch items-center justify-start margin-top-[8px]",
                                            children: [(0, F.jsx)("div", {
                                                className: "text-label-small medium:text-label-medium content-default",
                                                children: T("Label.ByRoblox")
                                            }), (0, F.jsx)(rL, {
                                                size: 12
                                            })]
                                        }) : null
                                    })]
                                })]
                            })]
                        })]
                    }), I && (0, F.jsx)(rI, {
                        isChecked: h,
                        onToggle: f,
                        offer: I
                    }), (0, F.jsxs)("div", {
                        className: "price-info space-between-container",
                        children: [(0, F.jsx)("div", {
                            className: "subtotal",
                            children: N("Message.OneClickPay.Subtotal")
                        }), (0, F.jsx)(rd.PriceTag, {
                            tagClassName: "subtotal-price",
                            amount: Number(rf(U)),
                            currencyCode: U.currencyCode
                        })]
                    }), (0, F.jsxs)("div", {
                        className: "tax-info space-between-container",
                        children: [(0, F.jsx)("div", {
                            className: "tax",
                            children: a ? (0, F.jsxs)(O.Fragment, {
                                children: [(0, F.jsx)("span", {
                                    className: "tax-text",
                                    children: m
                                }), (0, F.jsxs)(rn, {
                                    open: B,
                                    onOpenChange: G,
                                    children: [(0, F.jsx)(ra, {
                                        asChild: !0,
                                        children: (0, F.jsx)(t1.IconButton, {
                                            icon: "icon-regular-circle-question",
                                            size: "XSmall",
                                            variant: "Utility",
                                            ariaLabel: N("Message.OneClickPay.TaxTooltip")
                                        })
                                    }), (0, F.jsx)(ri, {
                                        position: "right-center",
                                        hasCloseAffordance: !0,
                                        closeLabel: N("Action.Close"),
                                        children: (0, F.jsx)(rs, {
                                            children: (0, F.jsx)(rl, {
                                                children: N("Message.OneClickPay.TaxTooltip")
                                            })
                                        })
                                    })]
                                })]
                            }) : Z
                        }), a ? (0, F.jsx)(rd.PriceTag, {
                            tagClassName: "tax-price",
                            amount: X,
                            currencyCode: U.currencyCode
                        }) : Z]
                    }), (0, F.jsx)(rc.Divider, {
                        style: {
                            margin: "8px 0"
                        }
                    }), (0, F.jsxs)("div", {
                        className: "space-between-container",
                        children: [(0, F.jsx)("div", {
                            className: "total-due",
                            children: N("Message.OneClickPay.TotalDue")
                        }), a ? (0, F.jsx)(rd.PriceTag, {
                            tagClassName: "total-due-price",
                            amount: q,
                            currencyCode: U.currencyCode
                        }) : Z]
                    }), (0, F.jsxs)("div", {
                        className: "payment-method-info flex flex-col gap-small",
                        children: [(0, F.jsx)("span", {
                            children: N("Message.OneClickPay.AmountChargedTo")
                        }), (0, F.jsx)(rC, {
                            error: W,
                            onSelectPaymentProfile: o,
                            paymentProfiles: n,
                            selectedPaymentProfile: c
                        })]
                    }), (0, F.jsx)("div", {
                        className: "use-a-different-payment-method",
                        children: (0, F.jsx)("div", {
                            role: "button",
                            tabIndex: 0,
                            onClick: Y,
                            children: N("Message.OneClickPay.RedirectToOldFlow")
                        })
                    }), (0, F.jsx)(rc.Divider, {
                        style: {
                            margin: "8px 0"
                        }
                    }), (0, F.jsx)("div", {
                        className: "margin-top-small",
                        children: (0, F.jsx)(rR, {
                            translationKey: r
                        })
                    })]
                }), (0, F.jsxs)(tQ.DialogFooter, {
                    children: [(0, F.jsx)("div", {
                        className: "loading text-align-x-center",
                        children: L && (0, F.jsx)(ro.ProgressCircle, {
                            variant: "Indeterminate",
                            ariaLabel: k("Label.Loading")
                        })
                    }), !L && (0, F.jsxs)("div", {
                        className: "flex flex-row gap-small justify-center",
                        children: [(0, F.jsx)(V.Button, {
                            isDisabled: !_ && !a,
                            variant: "Emphasis",
                            className: "min-width-[90px]",
                            size: "Medium",
                            onClick: () => {
                                _ ? $() : a && H(a)
                            },
                            children: _ ? j("Action.Continue") : N("Button.OneClickPay.PayNow")
                        }), (0, F.jsx)(V.Button, {
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
    let rD = e => {
        let t = (0, ei.useTranslations)("Feature.BuyRobux");
        return (0, F.jsxs)("div", {
            children: [e.isQuickPayLoading && (0, F.jsx)(ru, {
                ariaLabel: t("Label.Loading")
            }), (0, F.jsx)(rF, {
                ...e
            })]
        })
    };

    function rB() {
        let {
            quickPay3DS: {
                closeModal: e,
                isOpen: t,
                url: r
            }
        } = (0, O.useContext)(tf), n = (0, ei.useTranslations)("Feature.Premium");
        return (0, F.jsx)(tQ.Dialog, {
            open: t,
            onOpenChange: e,
            isModal: !0,
            hasCloseAffordance: !0,
            closeLabel: n("Action.Close"),
            size: "Small",
            children: (0, F.jsx)(tQ.DialogContent, {
                children: (0, F.jsxs)(tQ.DialogBody, {
                    className: "flex flex-col gap-medium",
                    children: [(0, F.jsx)(tQ.DialogTitle, {
                        children: n("QuickPay.Authentication")
                    }), (0, F.jsx)("div", {
                        className: "width-full clip",
                        children: (0, F.jsx)("iframe", {
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
    let rO = e => {
        let {
            onClick: t,
            title: r,
            iconComponent: n
        } = e;
        return (0, F.jsxs)("button", {
            className: "width-full flex flex-row gap-small bg-action-standard stroke-none justify-between items-center padding-large radius-medium",
            type: "button",
            onClick: t,
            children: [n, (0, F.jsx)("div", {
                className: "text-body-large",
                children: r
            })]
        })
    };

    function rG(e) {
        let {
            handleClose: t,
            handleRedeemCreditClick: r,
            handleSamsungPayClick: n
        } = e, {
            samsungPaymentMethods: {
                isOpen: a
            }
        } = (0, O.useContext)(tf), i = (0, ei.useTranslations)("Feature.Premium");
        return (0, F.jsx)(tQ.Dialog, {
            open: a,
            onOpenChange: t,
            isModal: !0,
            hasCloseAffordance: !0,
            closeLabel: i("Action.Close"),
            size: "Large",
            children: (0, F.jsx)(tQ.DialogContent, {
                children: (0, F.jsxs)(tQ.DialogBody, {
                    className: "flex flex-col gap-medium",
                    children: [(0, F.jsx)(tQ.DialogTitle, {
                        children: (0, F.jsx)("div", {
                            className: "margin-right-large",
                            children: i("Message.MobilePaymentMethod.BottomSheetTitle")
                        })
                    }), (0, F.jsxs)("div", {
                        className: "flex flex-col gap-medium",
                        children: [(0, F.jsx)(rO, {
                            onClick: n,
                            title: i("Message.MobilePaymentMethod.MilkyWayCheckout"),
                            iconComponent: (0, F.jsx)("div", {
                                className: "icon-samsung-pay width-[34px] height-[34px]"
                            })
                        }), (0, F.jsx)(rO, {
                            onClick: r,
                            title: i("Message.MobilePaymentMethod.RobloxCredit"),
                            iconComponent: (0, F.jsx)("div", {
                                className: "payment-method-image robloxCredit width-[42px] height-[28px]"
                            })
                        })]
                    })]
                })
            })
        })
    }
    let rz = [
            ["responseEnd", "PrimaryDataReady", ["startTime", "redirectStart", "redirectEnd", "domainLookupStart", "domainLookupEnd", "connectStart", "secureConnectionStart", "connectEnd", "requestStart", "responseStart", "domInteractive"]],
            ["domContentLoadedEventStart", "DataProcessingStarted", []],
            ["domContentLoadedEventEnd", "RenderStarted", ["loadEventStart", "loadEventEnd"]]
        ],
        {
            reportInteractive: rV
        } = function(e) {
            if (!et.window) return {
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
                            let c = new URLSearchParams(et.window?.location.search ?? "").get("ttiStartMs"),
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
                                    return t ? rz.reduce((e, s) => {
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
                            (l = et.window?.Roblox, l?.Hybrid?.Navigation)?.navigateToFeature({
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
                if (et.document && ("complete" === et.document.readyState ? o = !0 : et.window && et.window.addEventListener("load", () => {
                        o = !0, m()
                    }, {
                        once: !0
                    }), et.document.addEventListener("visibilitychange", () => {
                        et.document?.visibilityState === "hidden" && p()
                    })), et.window && (et.window.addEventListener("pagehide", p), et.window.addEventListener("unload", p)), "u" > typeof PerformanceObserver) try {
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
        rW = (0, eS.createFireTelemetryCounter)("BuyRobuxRedesign"),
        rK = (0, ev.createWithApiMetrics)(rW);

    function rH() {
        let e = (0, ei.useTranslations)("CommonUI.Controls"),
            t = (0, ei.useTranslations)("Feature.Premium"),
            {
                redirectError: {
                    isOpen: r,
                    closeModal: n
                }
            } = (0, O.useContext)(tf);
        return (0, F.jsx)(tQ.Dialog, {
            open: r,
            onOpenChange: n,
            size: "Medium",
            isModal: !0,
            hasCloseAffordance: !0,
            closeLabel: e("Action.Close"),
            children: (0, F.jsx)(tQ.DialogContent, {
                children: (0, F.jsxs)(tQ.DialogBody, {
                    children: [(0, F.jsx)(tQ.DialogTitle, {
                        children: t("Message.SomethingWentWrong")
                    }), (0, F.jsx)("div", {
                        className: "text-body-large",
                        children: t("Message.PleaseTryAgain")
                    })]
                })
            })
        })
    }
    let rQ = () => {
            if (void 0 === et.navigator) return null;
            let e = /RobloxApp\/\d+\.(\d+)/.exec(et.navigator.userAgent);
            if (e?.[1] == null) return null;
            let t = Number.parseInt(e[1], 10);
            return Number.isNaN(t) ? null : t
        },
        r$ = e => {
            if (!e.isAndroidApp) return !1;
            let t = rQ();
            return null !== t && t >= 743
        },
        rY = e => {
            let t = et.window ? new URL(e, et.window.location.href).href : e;
            return `roblox://open-external?url=${encodeURIComponent(t)}`
        },
        rq = (e, t) => r$(t) ? {
            href: rY(e)
        } : {
            href: e,
            target: "_blank"
        },
        rX = e => {
            let {
                children: t,
                modals: r,
                quickPay: n,
                samsungPaymentMethods: a
            } = e, i = (0, ei.useTranslations)("Feature.VerifiedParentalControls"), {
                markConsentAcknowledged: s,
                deviceMeta: l
            } = (0, O.useContext)(em), o = (0, O.useCallback)(e => {
                eN("StripeReactCrash", null, e)
            }, []), c = (0, O.useCallback)(() => {
                eP("FirstTimePurchaseConsentConfirmed"), s(), r.firstTimePurchaseConsent.closeModal(), r.firstTimePurchaseConsent.continuePurchase?.()
            }, [s, r.firstTimePurchaseConsent]), u = (0, O.useCallback)(() => {
                eP("FirstTimePurchaseConsentDismiss"), r.firstTimePurchaseConsent.closeModal()
            }, [r.firstTimePurchaseConsent]);
            return (0, F.jsxs)(tf.Provider, {
                value: r,
                children: [t, (0, F.jsx)(rG, {
                    ...a
                }), (0, F.jsx)(tZ, {}), (0, F.jsx)(t0, {}), (0, F.jsx)(t6, {}), n.stripe && (0, F.jsx)(tK, {
                    onError: o,
                    children: (0, F.jsxs)(tI.Elements, {
                        stripe: n.stripe,
                        children: [(0, F.jsx)(rD, {
                            ...n
                        }), (0, F.jsx)(rB, {})]
                    })
                }), (0, F.jsx)(rH, {}), (0, F.jsx)(t$, {
                    title: i("Label.AskParentFirst"),
                    description: i.html("Description.ParentalApprovalRequired", [{
                        opening: "learnLinkStart",
                        closing: "learnLinkEnd",
                        render: e => (0, F.jsx)("a", {
                            ...rq("https://en.help.roblox.com/hc/en-us/articles/4409558125460-Monthly-Spending-Limits-and-Notifications-FAQ", l),
                            className: "color-content-default [text-decoration:underline] [text-underline-position:from-font]",
                            rel: "noreferrer",
                            children: e
                        })
                    }]),
                    confirmation: i.html("Description.ParentalApprovalConfirmation", [{
                        opening: "termsLinkStart",
                        closing: "termsLinkEnd",
                        render: e => (0, F.jsx)("a", {
                            ...rq("https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use", l),
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
                    publishMetric: rW,
                    triggerContext: eQ(l)
                })]
            })
        },
        rJ = (0, O.createContext)({
            selectedProduct: void 0,
            purchaseProduct: () => void 0,
            purchaseNonRedirectProduct: () => Promise.resolve()
        });
    (m = {}).AllAges = "AllAges", m.NinePlus = "NinePlus", m.ThirteenPlus = "ThirteenPlus", m.SeventeenPlus = "SeventeenPlus", m.EighteenPlus = "EighteenPlus", (p = {}).Discoverable = "Discoverable", p.NotDiscoverable = "NotDiscoverable", (h = {}).Light = "Light", h.Dark = "Dark", (f = {}).Default = "Default", f.Amethyst = "Amethyst", f.Emerald = "Emerald", f.Peridot = "Peridot", f.Rose = "Rose", f.Ruby = "Ruby", f.CosmicDust = "CosmicDust", f.PolarFreeze = "PolarFreeze", f.SuperCharge = "SuperCharge", f.ElectricLime = "ElectricLime", f.LavaGlow = "LavaGlow", f.StarBurst = "StarBurst", f.PixelPop = "PixelPop", f.NebulaDrift = "NebulaDrift", f.NitroFrost = "NitroFrost", f.CircuitRush = "CircuitRush", f.KineticEnergy = "KineticEnergy", f.InfernoBlast = "InfernoBlast", f.HyperPlum = "HyperPlum", f.QuantumPulse = "QuantumPulse", f.Classic = "Classic", f.Halloween2026 = "Halloween2026", (g = {}).AllUsers = "All", g.Friends = "Friends", g.Following = "Following", g.Followers = "Followers", g.NoOne = "NoOne", g.TrustedFriends = "TrustedFriends", (x = {}).AllUsers = "AllUsers", x.Friends = "Friends", x.FriendsAndFollowing = "FriendsAndFollowing", x.FriendsFollowingAndFollowers = "FriendsFollowingAndFollowers", x.NoOne = "NoOne", x.TrustedFriends = "TrustedFriends", (b = {}).Default = "NotificationsOnlyOnThresholdPassed", b.AllNotifications = "NotificationsEveryAmountSpent", b.NotificationsOff = "NotificationsOff", (y = {}).Yes = "Yes", y.No = "No", (v = {}).Enabled = "Enabled", v.Disabled = "Disabled", (S = {}).Allowed = "Allowed", S.Disallowed = "Disallowed", (E = {}).OlderAgeGroupsAllowed = "OlderAgeGroupsAllowed", E.SimilarAgeGroupsOnly = "SimilarAgeGroupsOnly", E.SimilarOrTrustedConnections = "SimilarOrTrustedConnections", E.NoOne = "NoOne", (C = {}).AllAgeGroups = "AllAgeGroups", C.SimilarAgeGroupsAndTrustedFriends = "SimilarAgeGroupsAndTrustedFriends", C.TrustedFriends = "TrustedFriends", C.NoOne = "NoOne", (P = {}).AllConnections = "AllConnections", P.TrustedConnectionsOnly = "TrustedConnectionsOnly", P.NoOne = "NoOne", (w = {}).None = "None", w.Low = "Low", w.Medium = "Medium", w.High = "High", (N = {}).G = "ACB_AGE_G", N.PG = "ACB_AGE_PG", N.M = "ACB_AGE_M", N.MA15 = "ACB_AGE_MA15", N.R18 = "ACB_AGE_R18", (k = {}).AlwaysAsk = "AlwaysAsk", k.TrustedFriendsAutoApproved = "TrustedFriendsAutoApproved", (T = {}).contentAgeRestriction = "contentAgeRestriction", T.phoneNumberDiscoverability = "phoneNumberDiscoverability", T.whoCanChatWithMeInApp = "whoCanChatWithMeInApp", T.whoCanJoinMeInExperiences = "whoCanJoinMeInExperiences", T.whoCanSeeMyInventory = "whoCanSeeMyInventory", T.whoCanTradeWithMe = "whoCanTradeWithMe", T.tradeQualityFilter = "tradeQualityFilter", T.themeType = "themeType", T.accountTheme = "accountTheme", T.canUploadContacts = "canUploadContacts", T.updateFriendsAboutMyActivity = "updateFriendsAboutMyActivity", T.privateServerPrivacy = "privateServerPrivacy", T.allowSellShareData = "allowSellShareData", T.allowPersonalizedAdvertising = "allowPersonalizedAdvertising", T.monthlySpendLimit = "monthlySpendLimit", T.spendNotifications = "spendNotifications", T.monthlySpendLimitCurrencyCode = "monthlySpendLimitCurrencyCode", T.monthlySpendLimitNotificationType = "monthlySpendLimitNotificationType", T.enablePurchases = "enablePurchases", T.whoCanGroupChatWithMeInApp = "whoCanGroupChatWithMeInApp", T.whoCanWhisperChatWithMeInExperiences = "whoCanWhisperChatWithMeInExperiences", T.whoCanChatWithMeInExperiences = "whoCanChatWithMeInExperiences", T.dailyScreenTimeLimit = "dailyScreenTimeLimit", T.whoCanSeeMySocialNetworks = "whoCanSeeMySocialNetworks", T.allowThirdPartyAppPermissions = "allowThirdPartyAppPermissions", T.allowEnablePushNotifications = "allowEnablePushNotifications", T.allowEnableEmailNotifications = "allowEnableEmailNotifications", T.allowEnableGroupNotifications = "allowEnableGroupNotifications", T.allowEnableExperienceNotifications = "allowEnableExperienceNotifications", T.allowVoiceDataUsage = "allowVoiceDataUsage", T.whoCanOneOnOnePartyWithMe = "whoCanOneOnOnePartyWithMe", T.whoCanGroupPartyWithMe = "whoCanGroupPartyWithMe", T.doNotDisturb = "doNotDisturb", T.doNotDisturbTimeWindow = "doNotDisturbTimeWindow", T.whoCanSeeMyOnlineStatus = "whoCanSeeMyOnlineStatus", T.allowSensitiveIssues = "allowSensitiveIssues", T.allowMarketingEmailNotifications = "allowMarketingEmailNotifications", T.AllowPromotionalOffersNotifications = "AllowPromotionalOffersNotifications", T.allowCrossAgeGroupStudioCollaboration = "allowCrossAgeGroupStudioCollaboration", T.allowFacialAgeEstimation = "allowFacialAgeEstimation", T.whoCanPartyWithMe = "whoCanPartyWithMe", T.whoCanUsePartyChatWithMe = "whoCanUsePartyChatWithMe", T.whoCanUsePartyVoiceWithMe = "whoCanUsePartyVoiceWithMe", T.aggregatedDesktopNotifications = "aggregatedDesktopNotifications", T.allowPresetChat = "allowPresetChat", T.privatePlaytest = "privatePlaytest", T.allowIdentityVerification = "allowIdentityVerification", T.robuxTransferLimits = "robuxTransferLimits", T.robuxTransferApprovalMode = "robuxTransferApprovalMode", T.iarcAgeRating = "iarcAgeRating", T.allowThirdPartyFriendAccess = "allowThirdPartyFriendAccess", T.whoCanSeeMyFriendsList = "whoCanSeeMyFriendsList", T.whoCanSeeMyPastUsernames = "whoCanSeeMyPastUsernames", T.whoCanSeeMyAboutSection = "whoCanSeeMyAboutSection", (j = {}).Value = "Value", j.Integer = "Integer";
    var rZ = ((A = {}).None = "None", A.ParentalConsent = "ParentalConsent", A.SelfUpdateSetting = "SelfUpdateSetting", A.ContentAgeRestrictionVerification = "ContentAgeRestrictionVerification", A.FacialAgeEstimation = "FacialAgeEstimation", A.IdVerification = "IdVerification", A.VpcForFae = "VpcForFae", A.AgeCheckPending = "AgeCheckPending", A.ParentConsentInherited = "ParentConsentInherited", A.Inherited = "Inherited", A.ReadableButNotActionable = "ReadableButNotActionable", A),
        r0 = e.i(266712),
        r1 = ((R = {}).FraudPaymentAuthorizationAttempt = "FraudPaymentAuthorizationAttempt", R.FraudVirtualEconomyAbuse = "FraudVirtualEconomyAbuse", R.FraudAbuseOfAffiliateSystem = "FraudAbuseOfAffiliateSystem", R.FraudAttemptedUnauthorizedPaymentMethodUse = "FraudAttemptedUnauthorizedPaymentMethodUse", R.FraudRepeatedRefundRequests = "FraudRepeatedRefundRequests", R.FraudSuspiciousRefundRequests = "FraudSuspiciousRefundRequests", R.FraudUnauthorizedPurchase = "FraudUnauthorizedPurchase", R.FraudUseOfUnauthorizedOffPlatformTransactions = "FraudUseOfUnauthorizedOffPlatformTransactions", R.FraudUseOfUnauthorizedPaymentMethod = "FraudUseOfUnauthorizedPaymentMethod", R.FraudSuspiciousAccountPatterns = "FraudSuspiciousAccountPatterns", R.FraudChargeback = "FraudChargeback", R.None = "None", R.PurchaseNotEnabled = "PurchaseNotEnabled", R.SpendLimitExceeded = "SpendLimitExceeded", R),
        r2 = ((M = {}).BuyRobuxPage = "BuyRobuxPage", M.BuyRobuxPagePreselectedProduct = "BuyRobuxPagePreselectedProduct", M),
        r3 = ((I = {}).INVALID = "Invalid", I.AMUSEMENT_TAX = "AmusementTax", I.COMMUNICATIONS_TAX = "CommunicationsTax", I.GST = "Gst", I.HST = "Hst", I.IGST = "Igst", I.JCT = "Jct", I.LEASE_TAX = "LeaseTax", I.PST = "Pst", I.QST = "Qst", I.RST = "Rst", I.SALES_TAX = "SalesTax", I.VAT = "Vat", I.SUMMED = "Summed", I.SERVICE_TAX = "ServiceTax", I.UNKNOWN = "Unknown", I),
        r5 = ((_ = {}).INCORRECT_CVC = "incorrect_cvc", _.CARD_DECLINED = "card_declined", _.EXPIRED_CARD = "expired_card", _.INSUFFICIENT_FUNDS = "insufficient_funds", _.BALANCE_INSUFFICIENT = "balance_insufficient", _);
    let r6 = async () => e_(eM.POST, eI.CHECK_USER_PURCHASE_SETTING, {
        url: `${eo.EnvironmentUrls.apiGatewayUrl}/payments-gateway/v1/check-user-purchase-settings`,
        withCredentials: !0
    }, {}), r4 = async function(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
            r = new URLSearchParams({
                quickPayFlowType: e
            });
        return t.forEach(e => {
            r.append("productIds", e)
        }), e_(eM.GET, eI.GET_QUICK_PAY_METADATA, {
            url: `${eo.EnvironmentUrls.apiGatewayUrl}/payments-gateway/v1/get-quick-pay-metadata`,
            withCredentials: !0
        }, r)
    }, r8 = async () => e_(eM.GET, eI.GET_PAYMENT_PROFILES, {
        url: `${eo.EnvironmentUrls.apiGatewayUrl}/payments-gateway/v1/payment-profiles`,
        withCredentials: !0
    }), r9 = async (e, t, r, n, a) => e_(eM.POST, eI.PREPARE_PAYMENT, {
        url: `${eo.EnvironmentUrls.apiGatewayUrl}/payments-gateway/v1/prepare-payment`,
        withCredentials: !0
    }, {
        isQuickPay: !0,
        paymentFlowId: e,
        paymentMethod: t,
        paymentSessionId: r,
        productId: n,
        quickPaySelectedPaymentProfileId: a
    }, void 0, !0), r7 = async e => e_(eM.POST, eI.PROCESS_PAYMENT, {
        url: `${eo.EnvironmentUrls.apiGatewayUrl}/payments-gateway/v1/process-payment`,
        withCredentials: !0
    }, e), ne = async (e, t, r) => e_(eM.GET, eI.GET_PENDING_ENABLE_PURCHASE_CONSENT_REQUESTS, {
        url: `${eo.EnvironmentUrls.apiGatewayUrl}/parental-controls-api/v1/parental-controls/consents`,
        withCredentials: !0
    }, {
        childUserId: e,
        consentStatus: "Pending",
        consentType: t,
        cursor: r
    }), nt = async (e, t) => {
        let r, n = [];
        do {
            let a = await ne(e, t, r);
            a ? (n = [...n, ...a.consents], r = a.nextCursor) : r = void 0
        } while (r) return n.find(e => {
            let {
                consentData: t
            } = e;
            return t?.enablePurchases
        })
    }, nr = async () => e_(eM.GET, eI.GET_ENABLE_PURCHASES_SETTING, {
        url: `${eo.EnvironmentUrls.userSettingsApi}/v1/user-settings/settings-and-options?requestedUserSettings=enablePurchases`,
        withCredentials: !0
    });
    var nn = e.i(139047);
    let na = async () => await (0, nn.callBehaviour)("texas-u18-vpc-optimization"), ni = async () => {
        try {
            return await (0, nn.callBehaviour)("app-policy")
        } catch {
            return {}
        }
    };
    var ns = e.i(868275),
        nl = e.i(154286);
    let no = "/login-redirect",
        nc = "Payments.LoginRedirect.ExposureBased",
        nu = new class {
            async getExperimentBasedPathname(e) {
                if (!(0, el.getCurrentUser)()?.id) return {
                    pathname: no,
                    isInExperiment: !1
                };
                let t = e.appType.trim().replace(/\s+/g, "_"),
                    r = (() => {
                        if (void 0 === et.navigator) return null;
                        let e = /(?:iPhone OS|CPU OS) (\d+)[._]/.exec(et.navigator.userAgent);
                        if (e?.[1] == null) return null;
                        let t = Number.parseInt(e[1], 10);
                        return Number.isNaN(t) ? null : t
                    })();
                if (null !== r && r < 18) return eP("LoginRedirectUnsupportedIos", {
                    iosMajorVersion: r.toString(),
                    appType: t
                }), {
                    pathname: no,
                    isInExperiment: !1
                };
                let n = (await nl.default.getAllValuesForLayer(nc)).variant;
                return "number" == typeof n ? (this.isExperimentAccessed = !0, eP("LoginRedirectExperimentEvaluated", {
                    variant: n.toString(),
                    appType: t
                }), {
                    pathname: 1 === n ? "/login-redirect/v2" : no,
                    isInExperiment: !0
                }) : (eP("LoginRedirectExperimentEvaluated", {
                    variant: "unknown",
                    appType: t
                }), {
                    pathname: no,
                    isInExperiment: !1
                })
            }
            logLayerExposure() {
                this.isExperimentAccessed ? (eP("LoginRedirectExperimentExposed"), nl.default.logLayerExposure(nc)) : eP("LoginRedirectLoggingExposureWithoutExperimentAccess")
            }
            constructor() {
                (0, ns._)(this, "isExperimentAccessed", !1)
            }
        },
        nd = [{
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

    function nm(e) {
        if (void 0 !== et.window) try {
            let {
                currentTarget: t
            } = e;
            if (!(t instanceof et.window.HTMLAnchorElement) || !t.getAttribute("href")) return;
            t.href = function(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : Date.now();
                if (void 0 === et.window) return e;
                let r = new URL(e, et.window.location.origin);
                return (r.searchParams.set("redirectStartTs", String(t)), /^https?:\/\//i.test(e)) ? r.toString() : `${r.pathname}${r.search}${r.hash}`
            }(t.href)
        } catch {
            eP("StampRedirectStartTsFailed")
        }
    }
    let np = null,
        nh = [{
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
        nf = [{
            max: 1,
            label: "1"
        }, {
            max: 2,
            label: "2"
        }, {
            max: 3,
            label: "3"
        }];

    function ng(e, t, r) {
        let n;
        if (!e.isIosApp && !e.isAndroidApp) return;
        let a = {
            appMinorVersion: null == (n = rQ()) ? "unknown" : String(n),
            isSub: String(t),
            productId: r,
            triggerContext: eQ(e, t)
        };
        ! function(e) {
            let {
                onUiShown: t,
                uiShownTimeoutMs: r = 3e4
            } = e, n = et.window, a = et.document;
            if (void 0 === n || void 0 === a) return;
            if (np) return np.recordTap();
            let i = Date.now(),
                s = {
                    tapCount: 1,
                    recordTap: () => void 0
                },
                l = () => {
                    np === s && (np = null, void 0 !== s.shownTimer && n.clearTimeout(s.shownTimer), void 0 !== s.onBlur && n.removeEventListener("blur", s.onBlur))
                };
            s.recordTap = () => {
                s.tapCount += 1
            }, np = s, s.onBlur = e => {
                if (e.target !== n || np !== s) return;
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
                if (np !== s) return;
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
                eP("NativePurchaseUiShownTime", {
                    bucket: "shown" === e.outcome ? (t = e.elapsedMs, n = nh.find(e => {
                        let {
                            maxMs: r
                        } = e;
                        return t <= r
                    }), n?.label ?? "timeout") : e.outcome,
                    tapCount: (r = e.tapCount, i = nf.find(e => {
                        let {
                            max: t
                        } = e;
                        return r <= t
                    }), i?.label ?? "4+"),
                    appMinorVersion: a.appMinorVersion,
                    isSub: a.isSub
                }), G.paymentFlowAnalyticsService.sendUserPurchaseFlowEventViaFetch({
                    triggerContext: a.triggerContext,
                    isMidPurchaseStep: !0,
                    viewName: G.paymentFlowAnalyticsService.ENUM_VIEW_NAME.NATIVE_PURCHASE_UI_SHOWN_TIME,
                    purchaseEventType: G.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN,
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

    function nx(e) {
        let {
            children: t,
            quickPay: r,
            samsungPaymentMethods: n
        } = e;
        return (0, F.jsx)(rJ.Provider, {
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
                } = (0, O.useContext)(em), h = eO(p), f = eB(p), {
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
                } = (0, O.useContext)(tf), {
                    trackPurchase: v,
                    trackRedirectClick: S
                } = (0, O.useContext)(eD), {
                    isStoppedByPurchaseWarning: E
                } = function() {
                    let {
                        isSubscriber: e,
                        deviceMeta: t
                    } = (0, O.useContext)(em), r = eO(t), n = eB(t), {
                        purchaseWarning: {
                            openModal: a
                        }
                    } = (0, O.useContext)(tf), [i, s] = (0, O.useState)(!1);
                    return (0, O.useEffect)(() => {
                        let e = et.document?.getElementById("robux-container-base")?.dataset;
                        e && s("true" === e.isScaryModalEnabled)
                    }, []), {
                        isStoppedByPurchaseWarning: (0, O.useCallback)(async (t, s, l, o) => {
                            if (n && !i) return !1;
                            let c = await tq(!n && !e && !s, t.productId);
                            if (!c) return !1;
                            let {
                                action: u
                            } = c, d = u === tY.U13PaymentModal || u === tY.U13MonthlyThreshold1Modal || u === tY.U13MonthlyThreshold2Modal, m = u === tY.ParentalConsentWarningPaymentModal13To17 && r;
                            return (!!d || !!m) && (eP("PurchaseWarningModalShown", {
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
                    } = ea(), {
                        purchaseDisabled: {
                            openModal: t
                        }
                    } = (0, O.useContext)(tf), {
                        trackEconomicRestrictionErrorShown: r
                    } = (0, O.useContext)(eD), {
                        deviceMeta: n
                    } = (0, O.useContext)(em), a = eO(n), i = eB(n), s = (0, ei.useTranslations)("Feature.Premium"), l = (0, ei.useTranslations)("Feature.NotApproved"), o = (0, ei.useTranslations)("IAPExperience.PurchaseError"), [c, u] = (0, O.useState)(), d = (0, O.useCallback)(async () => {
                        let e = (0, el.getCurrentUser)()?.id;
                        return void 0 !== e && !!await nt(e, "UpdateUserSetting")
                    }, []), m = (0, O.useCallback)(async () => {
                        let e = await nr();
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
                            return r !== t && n === rZ.SelfUpdateSetting
                        }) ?? !1
                    }, []), p = (0, O.useCallback)(async () => {
                        let {
                            texasU18VPCOptimizationEnabled: e,
                            texasU18VPCOptimizationEnabledForEveryone: t
                        } = await na();
                        u(!!(e && t))
                    }, []), h = (0, O.useCallback)(async () => {
                        try {
                            let e = await (0, r0.startAccessManagementUpsell)({
                                ampRecourseData: {
                                    enablePurchases: "Enabled"
                                },
                                featureName: "CanChangeSetting",
                                namespace: "account_management/SettingsChange",
                                isAsyncCall: !1,
                                usePrologue: !0
                            });
                            "boolean" == typeof e && eP("AccessManagementUpsellResult", {
                                result: String(e)
                            })
                        } catch (e) {
                            ew("AccessManagementUpsellException", null, e)
                        }
                    }, []), f = (0, O.useCallback)(async () => {
                        if (i || !a) return !0;
                        let n = await r6();
                        if (!n) return eP("PurchaseEligibilityFailedToFetch"), e.warning(s("Heading.GeneralError")), !1;
                        if (n.expirationTimeInMinutes) {
                            r();
                            let t = Math.ceil(n.expirationTimeInMinutes / 60),
                                a = function(e) {
                                    switch (e) {
                                        case r1.FraudPaymentAuthorizationAttempt:
                                            return "Label.Sublabel.FraudPaymentAbuse";
                                        case r1.FraudVirtualEconomyAbuse:
                                            return "Label.Sublabel.FraudVirtualEconomyAbuse";
                                        case r1.FraudAbuseOfAffiliateSystem:
                                            return "Label.Sublabel.FraudAbuseOfTheAffiliateSystem";
                                        case r1.FraudAttemptedUnauthorizedPaymentMethodUse:
                                            return "Label.Sublabel.FraudAttemptedUnauthorizedPaymentMethodUse";
                                        case r1.FraudRepeatedRefundRequests:
                                            return "Label.Sublabel.FraudRepeatedRefundRequests";
                                        case r1.FraudSuspiciousRefundRequests:
                                            return "Label.Sublabel.FraudSuspiciousRefundRequests";
                                        case r1.FraudUnauthorizedPurchase:
                                            return "Label.Sublabel.FraudUnauthorizedPurchase";
                                        case r1.FraudUseOfUnauthorizedOffPlatformTransactions:
                                            return "Label.Sublabel.FraudUseOfUnauthorizedOffPlatformTransactions";
                                        case r1.FraudUseOfUnauthorizedPaymentMethod:
                                            return "Label.Sublabel.FraudUseOfUnauthorizedPaymentMethod";
                                        case r1.FraudSuspiciousAccountPatterns:
                                            return "Label.Sublabel.FraudSuspiciousAccountPatterns";
                                        case r1.FraudChargeback:
                                            return "Label.AbuseType.Chargeback";
                                        case r1.None:
                                        case r1.PurchaseNotEnabled:
                                        case r1.SpendLimitExceeded:
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
                            })), eP("EconomicRestrictionModalShown"), !1
                        }
                        if (n.isEligible) return !0;
                        let u = await d(),
                            p = await m();
                        return !c || u || p || n.failureReason !== r1.PurchaseNotEnabled ? c && p && n.failureReason === r1.PurchaseNotEnabled ? (eP("PurchaseDisabledModalShownDisabledBySelf"), t(c, p)) : u || n.failureReason === r1.PurchaseNotEnabled ? (eP("PurchaseDisabledModalShownParentalConsent"), t(!!c, p)) : (eP("PurchaseEligibility", {
                            failureReason: n.failureReason
                        }), e.warning(s("Heading.GeneralError"))) : (eP("AccessManagementUpsellModalShown"), await h()), !1
                    }, [r, e, s, l, o, d, m, c, h, t, a, i]);
                    return (0, O.useEffect)(() => {
                        p()
                    }, [p]), {
                        isUserEligibleForPurchase: f
                    }
                }(), [P, w] = (0, O.useState)(), [N, k] = (0, O.useState)(), [T, j] = (0, O.useState)(!1), [A, R] = (0, O.useState)(!1), [M, I] = (0, O.useState)(""), [_, U] = (0, O.useState)(), L = (0, O.useCallback)((e, t, r) => {
                    if (void 0 !== et.window) {
                        if (f) {
                            eP("DesktopPurchaseRedirect"), et.window.location.href = r;
                            return
                        }
                        if (!h) return void eP("UnsupportedPlatform");
                        ng(p, t, e.productId), eP("MobilePurchaseRedirect"), et.window.location.href = r
                    }
                }, [p, h, f]), F = (0, O.useCallback)(async (e, t, n, a) => {
                    r && !n ? await i(e, t, n) : await E(e, n, a, L) ? eP("StoppedPurchaseWarning", {
                        action: "PurchaseFlow"
                    }) : L(e, n, a)
                }, [r, i, E, L]), D = (0, O.useCallback)(async (e, t, n, a) => {
                    eP("StartPurchase", {
                        isQuickPay: r ? "true" : "false"
                    }), v(e, t, a);
                    let i = c(e, t);
                    (I(i), await C()) ? await F(e, n, t, i): eP("IneligiblePurchase")
                }, [r, v, c, C, F]), B = (0, O.useCallback)(e => {
                    let {
                        product: t,
                        event: r,
                        isSubscription: n
                    } = e;
                    try {
                        var a;
                        let e;
                        eP("RedirectClickTime", {
                            bucket: (a = performance.now(), e = nd.find(e => {
                                let {
                                    maxMs: t
                                } = e;
                                return a <= t
                            }), e?.label ?? "10+")
                        })
                    } catch {}
                    if (!d) {
                        r.preventDefault(), eP("UnexpectedPurchaseRedirectCall");
                        return
                    }
                    if ("" === d.url) {
                        r.preventDefault(), eP("PurchaseRedirectUrlEmpty"), d.refreshAuthTicket(), b();
                        return
                    }
                    nm(r), S({
                        isSubscriptionRedirect: n,
                        loginRedirectVersion: d.isInExperiment ? d.url.includes("/v2") ? "v2" : "v1" : void 0,
                        product: t
                    }), d.refreshAuthTicket()
                }, [d, S, b]), G = (0, O.useCallback)(async function(e) {
                    let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                        r = arguments.length > 2 && void 0 !== arguments[2] && arguments[2],
                        n = arguments.length > 3 ? arguments[3] : void 0;
                    (w(e), k(n), j(t), R(r), p.isSamsungGalaxyStoreApp) ? x(e, t, r): await D(e, t, r, n)
                }, [p.isSamsungGalaxyStoreApp, x, D]), z = (0, O.useCallback)(async function(e) {
                    let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                        r = arguments.length > 2 && void 0 !== arguments[2] && arguments[2],
                        n = arguments.length > 3 ? arguments[3] : void 0;
                    if (!1 === m) return void await G(e, t, r, n);
                    if (void 0 === m) {
                        eP("FirstTimePurchaseConsentNotFetchedInTime"), U({
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
                }, [m, y, G]), V = (0, O.useCallback)(e => {
                    let {
                        product: t,
                        isRedirect: r,
                        isSubscription: n,
                        isBonus: a,
                        sectionType: i
                    } = e;
                    if (r) {
                        try {
                            nu.logLayerExposure()
                        } catch (e) {
                            ew("LoginRedirectLayerExposureError", null, e)
                        }
                        B(e)
                    } else z(t, n, a, i)
                }, [B, z]);
                return (0, O.useEffect)(() => {
                    if (void 0 === m || !_) return;
                    U(void 0);
                    let {
                        product: e,
                        isSub: t,
                        isBonus: r,
                        sectionType: n
                    } = _;
                    m ? y(() => {
                        G(e, t, r, n)
                    }) : G(e, t, r, n)
                }, [m, _, y, G]), (0, O.useEffect)(() => {
                    s && P && (L(P, T, M), a())
                }, [s, P, L, T, M, a]), (0, O.useEffect)(() => {
                    o && P && (D(P, T, A, N), l())
                }, [o, P, D, T, A, N, l]), (0, O.useEffect)(() => {
                    r && p.isUniversalApp && u && n.length && (eP("QuickPayUpsell"), g(u), z(u))
                }, [p.isUniversalApp, r, u, n, g, z]), (0, O.useMemo)(() => ({
                    selectedProduct: P,
                    purchaseProduct: V,
                    purchaseNonRedirectProduct: z
                }), [P, V, z])
            }(r, n),
            children: t
        })
    }
    var nb = e.i(562528),
        ny = e.i(248951),
        nv = e.i(871623),
        nS = ((U = {}).CardDeclined = "Message.QuickPay.CardDeclinedError", U.CardExpired = "Message.QuickPay.ExpiredCardError", U.GenericError = "Message.QuickPay.GenericError", U.InsufficientFunds = "Message.QuickPay.InsufficientFundsError", U);
    let nE = (e, t) => {
        ew("QuickPay3DSFlow", {
            step: e
        }, t), ew("QuickPayPaymentFlow", {
            step: "3dsError"
        })
    };
    (L = {}).Default = "Message.QuickPay.Tax", L.GST = "Message.QuickPay.GST", L.HST = "Message.QuickPay.HST", L.IVA = "Message.QuickPay.IVA", L.JCT = "Message.QuickPay.JCT", L.Sales = "Message.QuickPay.SalesTax", L.Service = "Message.QuickPay.ServiceTax", L.TVA = "Messsage.QuickPay.TVA", L.VAT = "Message.QuickPay.VAT";
    var nC = e.i(851460);

    function nP(e) {
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
            } = (0, O.useContext)(eD), [s, l] = (0, O.useState)(!1), [o, c] = (0, O.useState)(!1), [u, d] = (0, O.useState)(!1), [m, p] = (0, O.useState)(!1), [h, f] = (0, O.useState)(!1), [g, x] = (0, O.useState)(!1), [b, y] = (0, O.useState)(!1), [v, S] = (0, O.useState)(), [E, C] = (0, O.useState)(), [P, w] = (0, O.useState)(!1), [N, k] = (0, O.useState)(!1), [T, j] = (0, O.useState)(), [A, R] = (0, O.useState)(!1), [M, I] = (0, O.useState)(!1), [_, U] = (0, O.useState)(""), [L, F] = (0, O.useState)(!1), [D, B] = (0, O.useState)(), G = (0, O.useCallback)((t, r) => {
                e(t), I(t), R(r), c(!0)
            }, [e]), z = (0, O.useCallback)((e, r) => {
                t(e), S(e), C(() => r), l(!0)
            }, [t]), V = (0, O.useCallback)(e => {
                r(e), d(!0)
            }, [r]), W = (0, O.useCallback)(e => {
                n(), U(e), p(!0)
            }, [n]), K = (0, O.useCallback)(() => {
                a(), f(!0)
            }, [a]), H = (0, O.useCallback)((e, t, r) => {
                i(), j(e), k(t), w(r), y(!0)
            }, [i]), Q = (0, O.useCallback)(() => {
                c(!1), I(!1), R(!1)
            }, []), $ = (0, O.useCallback)(() => {
                l(!1), S(void 0), C(void 0)
            }, []), Y = (0, O.useCallback)(() => {
                d(!1)
            }, []), q = (0, O.useCallback)(() => {
                p(!1)
            }, []), X = (0, O.useCallback)(() => {
                f(!1)
            }, []), J = (0, O.useCallback)(() => {
                x(!1)
            }, []), Z = (0, O.useCallback)(() => {
                x(!0)
            }, []), ee = (0, O.useCallback)(() => {
                y(!1)
            }, []), et = (0, O.useCallback)(e => {
                eP("FirstTimePurchaseConsentShown"), B(() => e), F(!0)
            }, []), er = (0, O.useCallback)(() => {
                F(!1), B(void 0)
            }, []);
            return (0, O.useMemo)(() => ({
                purchaseDisabled: {
                    closeModal: Q,
                    hasUserDisabledPurchases: A,
                    isOpen: o,
                    openModal: G,
                    showVPCOptimization: M
                },
                purchaseWarning: {
                    action: v,
                    closeModal: $,
                    continuePurchase: E,
                    isOpen: s,
                    openModal: z
                },
                quickPay: {
                    closeModal: Y,
                    isOpen: u,
                    openModal: V
                },
                quickPay3DS: {
                    closeModal: q,
                    isOpen: m,
                    openModal: W,
                    url: _
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
                    isBonus: P,
                    isOpen: b,
                    isSubscription: N,
                    openModal: H,
                    product: T
                },
                firstTimePurchaseConsent: {
                    closeModal: er,
                    continuePurchase: D,
                    isOpen: L,
                    openModal: et
                }
            }), [ee, P, b, N, H, T, Q, A, o, G, M, v, $, E, s, z, Y, u, V, q, m, W, _, X, h, K, J, g, Z, er, D, L, et])
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
            } = (0, O.useContext)(em), d = eO(u), {
                trackQuickPayClick: m,
                trackQuickPayPurchase: p
            } = (0, O.useContext)(eD), h = (0, ei.useTranslations)("Feature.Premium"), [f, g] = (0, O.useState)(), [x, b] = (0, O.useState)(!1), [y, v] = (0, O.useState)(!1), [S, E] = (0, O.useState)(!1), [C, P] = (0, O.useState)(""), [w, N] = (0, O.useState)([]), [k, T] = (0, O.useState)(), [j, A] = (0, O.useState)(!1), [R, M] = (0, O.useState)(), [I, _] = (0, O.useState)(), [U, L] = (0, O.useState)(null), [F, D] = (0, O.useState)(!1), [B, G] = (0, O.useState)([]), [z, V] = (0, O.useState)(!1), W = (0, O.useRef)(0), K = (0, O.useCallback)(e => {
                let t;
                if (!e) return;
                let r = "unknown";
                (t = e.providerPayload, t?.paymentProfileType === "card") ? r = "card": ry(e.providerPayload) && (r = "paypal"), eP("QuickPayPaymentMethodSelected", {
                    method: r
                })
            }, []), H = (0, O.useCallback)(async () => {
                let e = r2.BuyRobuxPage;
                c.product_id && u.isUniversalApp && (e = r2.BuyRobuxPagePreselectedProduct), eP("QuickPayGetMetadataFlow", {
                    step: "start"
                });
                let t = await r4(e, l);
                if (!t) return void ew("QuickPayGetMetadataFlow", {
                    step: "noData"
                });
                let r = t.subscribedRobuxProductOffers ?? [];
                if (P(t.legalDisclosureTranslationKey), G(r), !t.isUserEligible) return void eP("QuickPayGetMetadataFlow", {
                    step: "ineligible"
                });
                let n = await r8();
                if (!n?.length) return void ew("QuickPayGetMetadataFlow", {
                    step: "noPaymentProfiles"
                });
                let a = n.filter(e => void 0 === e.isQuickPayEnabled || !0 === e.isQuickPayEnabled);
                a.length ? (eP("QuickPayGetMetadataFlow", {
                    step: "success"
                }), a.sort((e, t) => t.lastChargeTime - e.lastChargeTime), v(!0), N(a), M(a[0]), K(a[0])) : ew("QuickPayGetMetadataFlow", {
                    step: "noEligiblePaymentProfiles"
                })
            }, [u.isUniversalApp, c.product_id, K, l]), Q = (0, O.useCallback)(async () => {
                if (void 0 !== et.window) try {
                    let e = function() {
                            if (void 0 === et.window) throw Error("Stripe public API key selection requires a browser environment");
                            return et.window.location.href.includes("sitetest1") ? "pk_test_51LNM0XG5RADBkfjhYJlpADA2ArzWIh7gTWTodYNbpEzSiT55dul3VJhaBIVHL0CNyO0gECOz1vPnWArAkjwQ8NBO00Cdf2PxED" : et.window.location.href.includes("sitetest3") ? "pk_test_51LNOeQHDRNiW7vlLcKH8TGCpJ7zhaidLdSegE22GCuvQbVUX2xDiGJY6WYaldYyo6qgVxmy1SnSVpSdaqyjfqclU00NQwWntIe" : "pk_live_51LKpO9C8tJWGhK4HEHtny9Dg7xXiQJ1i349cq6KBDusbl8bRHO7QmCKKhX18LPjSirMNTvj3tesq6mhIQuPioeAd0062ZCgoF3"
                        }(),
                        t = await (0, nb.loadStripe)(e);
                    L(t)
                } catch (e) {
                    ew("QuickPayStripeException", null, e)
                }
            }, []), $ = (0, O.useCallback)(async (e, r, n, a) => {
                if (void 0 === et.window) return;
                T(void 0), g(void 0), b(r), E(n), _(e), D(!0);
                let l = a ?? R;
                if (!l) {
                    ew("QuickPayPreparePaymentNoPaymentProfile"), D(!1);
                    return
                }
                if (!o || !s) return;
                W.current += 1;
                let c = W.current,
                    u = ry(l.providerPayload);
                eP("QuickPayPreparePaymentFlow", {
                    step: "start"
                });
                let {
                    data: d,
                    isError: m
                } = await r9(o, u ? "BraintreePaypal" : "StripeCard", s.id, e.productId, l.id).then(r => (D(!1), t(e), {
                    data: r,
                    isError: !1
                })).catch(t => {
                    D(!1), T(null), g(null), "object" == typeof t && null !== t && "parameters" in t && "object" == typeof t.parameters && null !== t.parameters && "kind" in t.parameters && "abandoned" === t.parameters.kind ? ew("QuickPayPreparePaymentFlow", {
                        step: "genericChallengeAbandoned"
                    }) : "RemovedPaymentProfile" === (e => {
                        if (!("object" == typeof e && null !== e && "config" in e)) return;
                        let t = e.response?.data;
                        if ("object" != typeof t || null === t || !("failureReason" in t)) return;
                        let {
                            failureReason: r
                        } = t;
                        return "string" == typeof r ? r : void 0
                    })(t) ? ew("QuickPayPreparePaymentFlow", {
                        step: "profileRemovedByFraud"
                    }) : ew("QuickPayPreparePaymentFlow", {
                        step: "error"
                    }, t);
                    let r = i(e, n);
                    return void 0 !== et.window && (et.window.location.href = r), {
                        data: void 0,
                        isError: !0
                    }
                });
                if (W.current === c) {
                    if (!d) {
                        m || ew("QuickPayPreparePaymentFlow", {
                            step: "noData"
                        });
                        return
                    }
                    if (d.providerPayload?.redirectionPath) {
                        T(null), g(null);
                        let t = i(e, n);
                        1 === w.length && t && (eP("QuickPayPreparePaymentFlow", {
                            step: "redirect"
                        }), et.window.location.href = t);
                        return
                    }
                    eP("QuickPayPreparePaymentFlow", {
                        step: "success"
                    }), T(d.providerPayload), g(d.checkoutSessionId)
                }
            }, [t, R, o, s, i, w.length]), Y = (0, O.useCallback)(async e => {
                if (void 0 === et.window) return {
                    isLoading: !1
                };
                m();
                let t = ry(R?.providerPayload);
                if (!s) return {
                    isLoading: !1
                };
                eP("QuickPayPaymentFlow", {
                    step: "start"
                });
                let r = await r7({
                    checkoutSessionId: f ?? void 0,
                    paymentProviderType: t ? "BraintreePayPal" : "StripeCard",
                    paymentSessionId: s.id,
                    providerPayload: e,
                    quickPaySelectedPaymentProfileId: R?.id
                });
                if (!r) return ew("QuickPayPaymentFlow", {
                    step: "noData"
                }), I && await $(I, x, S), {
                    error: nS.GenericError,
                    isLoading: !1
                };
                let {
                    providerPayload: a
                } = r, {
                    StripeErrorCode: i
                } = a;
                if (i) {
                    let e;
                    switch (ew("QuickPayStripeProcessPaymentError", {
                            stripeErrorCode: i
                        }), ew("QuickPayPaymentFlow", {
                            step: "error"
                        }), i) {
                        case r5.CARD_DECLINED:
                            e = nS.CardDeclined;
                            break;
                        case r5.EXPIRED_CARD:
                            e = nS.CardExpired;
                            break;
                        case r5.INSUFFICIENT_FUNDS:
                        case r5.BALANCE_INSUFFICIENT:
                            e = nS.InsufficientFunds;
                            break;
                        case r5.INCORRECT_CVC:
                        default:
                            e = nS.GenericError
                    }
                    return {
                        error: e,
                        isLoading: !0
                    }
                }
                let l = a.redirectToUrl ?? a.RedirectionUrl;
                if (l)
                    if (t) return eP("QuickPayPaymentFlow", {
                        step: "redirect"
                    }), et.window.location.href = l, {
                        isLoading: !0
                    };
                    else return eP("QuickPayPaymentFlow", {
                        step: "3dsModalShown"
                    }), eP("QuickPay3DSFlow", {
                        step: "start"
                    }), n(l), {
                        isLoading: !1
                    };
                return eP("QuickPayPaymentFlow", {
                    step: "complete"
                }), p(I), et.window.location.href = `/upgrades/checkout/success?checkoutSessionId=${f}`, {
                    isLoading: !0
                }
            }, [m, $, I, x, S, p, f, n, R, s]), q = (0, O.useMemo)(() => {
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
                    let e = new nv.default,
                        t = parseFloat(a);
                    t > 0 && (i = e.n(t))
                } catch (e) {
                    ew("QuickPayPercentStringException", null, e)
                }
                switch (t) {
                    case r3.GST:
                        e = "Message.QuickPay.GST";
                        break;
                    case r3.VAT:
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
                    case r3.JCT:
                        e = "Message.QuickPay.JCT";
                        break;
                    case r3.HST:
                        e = "Message.QuickPay.HST";
                        break;
                    case r3.SALES_TAX:
                        e = "Message.QuickPay.SalesTax";
                        break;
                    case r3.SERVICE_TAX:
                        e = "Message.QuickPay.ServiceTax";
                        break;
                    case r3.SUMMED:
                    case r3.UNKNOWN:
                    case r3.INVALID:
                    case r3.AMUSEMENT_TAX:
                    case r3.COMMUNICATIONS_TAX:
                    case r3.IGST:
                    case r3.LEASE_TAX:
                    case r3.PST:
                    case r3.QST:
                    case r3.RST:
                    default:
                        e = "Message.QuickPay.Tax"
                }
                return h(e) + (i.length > 0 ? ` (${i}%)` : "")
            }, [k, h]), X = (0, O.useCallback)(async e => {
                if (void 0 !== et.window && "3DS-authentication-complete" === e.data.type && e.data.url && U) {
                    eP("QuickPay3DSFlow", {
                        step: "messageReceived"
                    });
                    try {
                        if (!a || !(e => {
                                try {
                                    let t = new URL(e);
                                    return "http:" === t.protocol || "https:" === t.protocol
                                } catch (e) {
                                    return (0, ny.captureException)(e), !1
                                }
                            })(a)) return nE("urlNotSet"), nS.GenericError;
                        let e = new URL(a).searchParams.get("payment_intent_client_secret");
                        if (!e) return nE("clientSecretNotSet"), nS.GenericError;
                        let {
                            error: t,
                            paymentIntent: r
                        } = await U.retrievePaymentIntent(e);
                        if (t) return nE("stripeError", t), nS.GenericError;
                        if ("succeeded" !== r.status) return nE("unsuccessful"), nS.GenericError;
                        eP("QuickPay3DSFlow", {
                            step: "success"
                        }), et.window.location.href = `/upgrades/checkout/success?checkoutSessionId=${f}`;
                        return
                    } catch (e) {
                        return nE("error", e), nS.GenericError
                    } finally {
                        r()
                    }
                }
            }, [U, a, r, f]), J = (0, O.useCallback)(e => {
                M(e), K(e), I && $(I, x, S, e).catch(ny.captureException)
            }, [K, I, $, x, S]), Z = (0, O.useCallback)(() => {
                V(e => !e)
            }, []), ee = (0, O.useCallback)(() => {
                A(!0)
            }, []), er = (0, O.useCallback)(() => {
                A(!1)
            }, []);
            return (0, O.useEffect)(() => {
                d || H().catch(ny.captureException)
            }, [H, d]), (0, O.useEffect)(() => {
                !d && y && Q().catch(ny.captureException)
            }, [d, y, Q]), (0, O.useMemo)(() => ({
                checkoutSessionId: f,
                isBonusItem: x,
                isQuickPay: y,
                legalDisclosureTranslationKey: C,
                markRedirectHandled: er,
                paymentProfiles: w,
                preparePaymentForQuickPay: $,
                preparePaymentProviderPayload: k,
                process3DSForQuickPay: X,
                processPaymentForQuickPay: Y,
                redirectToPurchase: ee,
                selectPaymentProfile: J,
                selectedPaymentProfile: R,
                selectedProduct: I,
                shouldRedirectToPurchase: j,
                stripe: U,
                taxTitle: q,
                isQuickPayLoading: F,
                subscribedRobuxProductOffers: B,
                isSubscribeAndSaveChecked: z,
                toggleSubscribeAndSave: Z
            }), [f, x, y, C, er, w, $, k, Y, ee, J, R, I, j, U, B, z, Z, q, X, F])
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
            } = (0, O.useContext)(eD), [s, l] = (0, O.useState)(!1), o = (0, O.useCallback)(() => {
                i(), l(!0), t()
            }, [i, t]), c = (0, O.useCallback)(() => {
                void 0 !== et.window && (a(), et.window.location.href = `/upgrades/redeem?${nC.UrlSearchParams.new({ap:r?.productId??"",pm:"redeemCard"}).toString()}`, t())
            }, [a, r, t]);
            return {
                handleClose: (0, O.useCallback)(() => {
                    n(), t()
                }, [n, t]),
                handleRedeemCreditClick: c,
                handleSamsungPayClick: o,
                markRedirectHandled: (0, O.useCallback)(() => {
                    l(!1)
                }, []),
                shouldRedirectToPurchase: s
            }
        }(r);
        return (0, F.jsx)(rX, {
            modals: r,
            quickPay: n,
            samsungPaymentMethods: a,
            children: (0, F.jsx)(nx, {
                quickPay: n,
                samsungPaymentMethods: a,
                children: t
            })
        })
    }
    let nw = "/mobile-app-upgrades/buy";
    var nN = e.i(264458);

    function nk(e) {
        let {
            ...t
        } = e;
        return (0, F.jsx)("div", {
            "data-slot": "card",
            className: "self-stretch flex flex-col items-start gap-medium",
            ...t
        })
    }

    function nT(e) {
        let {
            className: t,
            ...r
        } = e;
        return (0, F.jsx)("div", {
            className: (0, nN.default)("buy-robux-section-header self-stretch flex flex-row items-start text-heading-small medium:text-heading-large", t),
            ...r
        })
    }

    function nj(e) {
        let {
            ...t
        } = e;
        return (0, F.jsx)("div", {
            className: (0, nN.default)("self-stretch flex flex-row items-start content-emphasis text-body-medium", t.className),
            ...t
        })
    }

    function nA(e) {
        let {
            banner: t,
            children: r,
            isPrimary: n,
            ...a
        } = e;
        return t ? (0, F.jsxs)("div", {
            className: (0, nN.default)("radius-large flex flex-col items-start self-stretch", {
                "bg-surface-100": n,
                "stroke-standard": !n,
                "stroke-default": !n
            }),
            children: [t, (0, F.jsx)("div", {
                className: "flex flex-col items-start self-stretch gap-xlarge robux-section",
                ...a,
                children: r
            })]
        }) : (0, F.jsx)("div", {
            className: (0, nN.default)("radius-large flex flex-col items-start self-stretch gap-xlarge robux-section", {
                "bg-surface-100": n,
                "stroke-standard": !n,
                "stroke-default": !n
            }),
            ...a,
            children: r
        })
    }
    let nR = e => {
        let {
            icon: t,
            label: r
        } = e, n = t && rh(t);
        return (0, F.jsx)(t8.Badge, {
            variant: "Neutral",
            icon: n ? t : void 0,
            label: r,
            className: "text-overflow"
        })
    };

    function nM(e) {
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
        } = (0, O.useContext)(em), u = eO(c), d = (0, ei.useTranslations)("Feature.Premium"), {
            translateFullKey: m
        } = (0, ei.useFullKeyTranslations)(), p = i ? (0, t4.formatNumber)(Number(i)) : void 0, h = d("Label.PlusAmountMoreLower", {
            amount: p ?? ""
        });
        return (0, F.jsxs)("div", {
            className: `robux-amount-item flex ${r?"flex-col":"flex-row"} num-badges-${o} justify-start gap-small wrap`,
            children: [(0, F.jsx)("div", {
                className: "flex gap-small items-center",
                children: (0, F.jsxs)("div", {
                    className: `flex flex-row justify-start items-center gap-small margin-right-xsmall ${s?"medium:width-[230px]":"large:width-[230px]"} wrap`,
                    "data-testid": "robux-amount-column",
                    children: [(0, F.jsxs)("div", {
                        className: "flex flex-row justify-start items-center gap-xsmall content-emphasis",
                        children: [(0, F.jsx)(z.Icon, {
                            name: "icon-filled-robux",
                            size: "Small",
                            className: "robux-amount-icon"
                        }), (0, F.jsx)("span", {
                            className: "text-title-large small:text-heading-small min-[400px]:text-heading-medium large:text-heading-large",
                            style: {
                                lineHeight: "var(--line-height-100)"
                            },
                            children: (0, t4.formatNumber)(Number(t))
                        })]
                    }), r && (0, F.jsxs)("div", {
                        className: "flex flex-row justify-start items-center gap-xsmall relative text-overflow content-muted",
                        children: [(0, F.jsx)("div", {
                            className: "robux-amount-strike-through"
                        }), (0, F.jsx)(z.Icon, {
                            name: "icon-filled-robux",
                            size: "XSmall",
                            className: "robux-amount-strike-icon"
                        }), (0, F.jsx)("span", {
                            className: "text-title-medium min-[400px]:text-title-large large:text-heading-small",
                            children: (0, t4.formatNumber)(Number(r))
                        })]
                    })]
                })
            }), (i ?? a) && (0, F.jsxs)("div", {
                className: "flex flex-row gap-small",
                children: [i && (s ? (0, F.jsx)(nR, {
                    icon: s,
                    label: l ? m(l, {
                        amount: p ?? ""
                    }, h) : h
                }) : (0, F.jsx)("div", {
                    className: (0, nN.default)(u ? "block" : "hidden", "large:block"),
                    "data-testid": "bonus-pill",
                    children: (0, F.jsx)(nR, {
                        label: h
                    })
                })), a && (0, F.jsx)(nR, {
                    icon: n,
                    label: m(a)
                })]
            })]
        })
    }
    let nI = e => {
        let {
            product: t,
            isExpanded: r,
            onProductClick: n,
            buttonProps: a
        } = e, i = (0, O.useContext)(tl), s = a?.as === "a" ? a : void 0, {
            rowProps: l,
            linkProps: o
        } = ty(te(t.productId, i), {
            isRedirect: !!s,
            hasUrl: !!s?.href
        }), {
            className: c,
            ...u
        } = a ?? {};
        return (0, F.jsxs)("div", {
            ...{
                [eq]: t.productId
            },
            ...l,
            className: (0, nN.default)("self-stretch flex flex-row justify-between items-center gap-small", {
                hidden: t.isCollapsible && !r
            }),
            children: [(0, F.jsx)(nM, {
                amount: t.robuxAmount,
                nonPromotionalAmount: t.nonPromotionalPlatformRobuxAmount,
                bonusRobuxAmount: t.bonusRobuxAmount,
                bonusRobuxTagIcon: t.bonusRobuxTagIcon,
                bonusRobuxTagTranslationKey: t.bonusRobuxTagTranslationKey,
                inlineBadgeIcon: t.inlineBadgeIcon,
                inlineBadgeTranslationKey: t.inlineBadgeTranslationKey
            }), (0, F.jsx)(V.Button, {
                variant: t.isCallToAction ? "Emphasis" : "Standard",
                size: "Small",
                className: (0, nN.default)(c, "text-label-medium shrink-0", "small:height-1000 small:padding-x-medium small:text-label-medium small:[&_.icon]:size-[var(--icon-size-medium)] small:[&>span]:gap-small"),
                onClick: e => {
                    n(t, e)
                },
                ...u,
                ...o,
                icon: "a" === u.as && u.href ? "icon-regular-arrow-up-right-from-square" : void 0,
                children: (0, F.jsx)(rd.PriceTag, {
                    tagClassName: "robux-price-tag",
                    currencyCode: t.price.amount.currencyCode,
                    amount: Number(rf(t.price.amount))
                })
            })]
        }, t.productId)
    };

    function n_(e) {
        let {
            onProductClick: t,
            products: r,
            OverrideProductItemComponent: n
        } = e, a = (0, ei.useTranslations)("Feature.Premium"), [i, s] = (0, O.useState)(!1), l = (0, O.useMemo)(() => r.some(e => e.isCollapsible), [r]), o = (0, O.useCallback)(() => {
            eP("ClickShowMore"), s(e => !e)
        }, []), c = n ?? nI;
        return (0, F.jsxs)(O.Fragment, {
            children: [r.map(e => (0, F.jsx)(c, {
                product: e,
                isExpanded: i,
                onProductClick: t,
                buttonProps: {
                    className: "min-width-[90px] small:min-width-[120px] medium:min-width-[200px]"
                }
            }, e.productId)), l && (0, F.jsx)(V.Button, {
                variant: "ActionUtility",
                size: "Small",
                className: "self-stretch flex flex-row height-500",
                onClick: o,
                children: (0, F.jsxs)("div", {
                    className: "flex flex-row justify-center items-center gap-small text-title-medium content-default padding-none",
                    children: [a(i ? "Action.ShowLess" : "Action.ShowMore"), i ? (0, F.jsx)(z.Icon, {
                        name: "icon-filled-chevron-large-up"
                    }) : (0, F.jsx)(z.Icon, {
                        name: "icon-filled-chevron-large-down"
                    })]
                })
            })]
        })
    }
    let nU = e => t => (0, F.jsx)(nI, {
        ...t,
        buttonProps: {
            className: t.buttonProps?.className,
            as: "a",
            href: tr(`${e}&ap=${t.product.productId}`, !!e),
            rel: "noreferrer",
            role: "button",
            target: "_blank"
        }
    });
    var nL = e.i(256368),
        nF = e.i(532486);

    function nD(e) {
        let {
            surfaceKey: t,
            className: r,
            reportItem: n
        } = e, [a, i] = (0, O.useState)(!1), s = (0, ei.useTranslations)("Feature.BuyRobux")("Action.ContentPersonalization", void 0, "Content personalization");
        return (0, F.jsxs)(nL.Popover, {
            open: a,
            onOpenChange: i,
            children: [(0, F.jsx)(nL.PopoverTrigger, {
                asChild: !0,
                children: (0, F.jsx)(t1.IconButton, {
                    className: (0, nN.default)("bg-none shrink-0", r),
                    icon: "icon-regular-three-dots-horizontal",
                    ariaLabel: s,
                    variant: "Utility",
                    size: "Small"
                })
            }), (0, F.jsx)(nL.PopoverContent, {
                side: "bottom",
                align: "end",
                ariaLabel: s,
                children: (0, F.jsxs)(rb.Menu, {
                    size: "Medium",
                    children: [(0, F.jsx)(rb.MenuItem, {
                        value: "personalized-recommendations",
                        title: s,
                        leading: (0, F.jsx)(z.Icon, {
                            name: "icon-regular-gear"
                        }),
                        onSelect: () => {
                            i(!1), (0, nF.openAccountSettings)({
                                surfaceKey: t
                            })
                        }
                    }), n && (0, F.jsx)(rb.MenuItem, {
                        value: "report-item",
                        title: n.title,
                        leading: (0, F.jsx)(z.Icon, {
                            name: "icon-regular-circle-i"
                        }),
                        onSelect: () => {
                            i(!1), n.onSelect()
                        }
                    })]
                })
            })]
        })
    }

    function nB(e) {
        let {
            metadata: t,
            showPersonalizedRecommendationsMenu: r
        } = e, n = (0, ei.useTranslations)("Feature.PersonalizedBonus"), {
            bonusItemBannerImageUrl: a,
            bonusItemImageUrl: i,
            deviceMeta: s
        } = (0, O.useContext)(em), l = eO(s), o = eB(s), c = (0, O.useCallback)(() => {
            void 0 !== et.window && (l || o ? et.window.location.href = "/support" : et.window.open("/support", "_blank"))
        }, [l, o]);
        return (0, F.jsxs)("div", {
            className: "color-mode-dark dark-theme self-stretch flex flex-row justify-start items-center gap-large clip relative buy-robux-page min-height-[112px]",
            style: {
                borderTopLeftRadius: "var(--radius-large)",
                borderTopRightRadius: "var(--radius-large)"
            },
            children: [(0, F.jsx)("div", {
                className: "absolute height-full width-full",
                style: {
                    flexGrow: 0,
                    flexShrink: 0,
                    backgroundColor: "var(--color-extended-gray-1200)"
                }
            }), a && (0, F.jsx)("div", {
                className: "absolute height-full width-full",
                style: {
                    backgroundImage: `url("${a}")`,
                    backgroundPositionY: "44%",
                    backgroundPositionX: "center",
                    backgroundSize: "852px",
                    opacity: .4
                },
                title: "bonus item banner image"
            }), (0, F.jsx)("div", {
                className: "absolute height-full width-full",
                style: {
                    backgroundImage: "linear-gradient(to right, rgba(18, 18, 21, 1), rgb(18, 18, 21, 0))"
                }
            }), (0, F.jsx)("div", {
                className: "width-2000 height-2000 margin-left-small shrink-0",
                style: {
                    zIndex: 1
                },
                children: i && (0, F.jsx)("img", {
                    src: i,
                    alt: "bonus item",
                    className: "width-full height-full"
                })
            }), (0, F.jsx)("div", {
                className: "min-width-0",
                style: {
                    margin: "auto auto auto 0",
                    padding: "21px 16px 21px 0",
                    zIndex: 1
                },
                children: (0, F.jsxs)("div", {
                    className: "flex flex-col gap-xsmall self-stretch items-start justify-center",
                    children: [(0, F.jsxs)("div", {
                        className: "flex flex-row items-center max-width-full text-title-large content-[var(--dark-mode-content-emphasis)] text-wrap",
                        children: [(0, F.jsx)("div", {
                            className: "min-width-0 text-truncate-end text-no-wrap",
                            children: t.experienceDisplayName
                        }), !r && (0, F.jsx)(t3.Tooltip, {
                            position: "bottom-center",
                            title: n("Action.ReportItem"),
                            children: (0, F.jsx)(t3.TooltipTrigger, {
                                asChild: !0,
                                children: (0, F.jsx)(t1.IconButton, {
                                    variant: "Utility",
                                    size: "XSmall",
                                    icon: "icon-regular-circle-i",
                                    ariaLabel: "More information",
                                    onClick: c
                                })
                            })
                        })]
                    }), (0, F.jsx)("div", {
                        className: "text-body-large content-[var(--dark-mode-content-default)] text-wrap",
                        children: t.gamePassDisplayName
                    })]
                })
            }), r && (0, F.jsx)(nD, {
                surfaceKey: "Web_BuyRobux_BonusItem",
                className: "shrink-0 relative z-10 margin-right-medium medium:margin-x-large",
                reportItem: {
                    title: n("Action.ReportItem"),
                    onSelect: c
                }
            })]
        })
    }
    let nO = new Intl.DateTimeFormat("en-US", {
            timeZone: "America/Los_Angeles",
            year: "numeric",
            month: "numeric",
            day: "numeric"
        }),
        nG = Date.UTC(2026, 3, 1);

    function nz(e) {
        let {
            metadata: t,
            showPersonalizedRecommendationsMenu: r
        } = e, {
            translateFullKey: n
        } = (0, ei.useFullKeyTranslations)(), a = (0, ei.useTranslations)("Feature.PersonalizedBonus"), i = (0, O.useMemo)(() => {
            let e, t;
            return e = nO.formatToParts(new Date), t = Number(e.find(e => "year" === e.type)?.value), Math.max(Math.ceil((nG - Date.UTC(t, Number(e.find(e => "month" === e.type)?.value) - 1, Number(e.find(e => "day" === e.type)?.value))) / 864e5), 0)
        }, []);
        return (0, F.jsxs)("div", {
            className: "collectible-item-bonus-item-banner flex flex-row gap-large self-stretch items-center justify-start overflow-hidden padding-x-medium padding-bottom-medium padding-top-large medium:padding-x-xlarge buy-robux-page",
            style: {
                borderTopLeftRadius: "8px",
                borderTopRightRadius: "8px"
            },
            children: [(0, F.jsx)("img", {
                src: t.image2dUrl,
                alt: "bonus item",
                className: "min-width-2000 max-width-2000 min-height-2000 max-height-2000 medium:min-width-3000 medium:max-width-3000 medium:min-height-3000 medium:max-height-3000"
            }), (0, F.jsxs)("div", {
                className: "flex flex-col grow-1 gap-small medium:gap-medium self-stretch items-start justify-center",
                children: [(0, F.jsx)("div", {
                    className: "text-title-large medium:text-heading-small content-emphasis text-wrap",
                    children: n(t.translationKey)
                }), (0, F.jsxs)("div", {
                    className: "flex flex-col small:flex-row gap-medium self-stretch items-start justify-start",
                    children: [(0, F.jsxs)("div", {
                        className: "flex flex-row gap-xsmall self-stretch items-center justify-start",
                        children: [(0, F.jsx)("div", {
                            className: "text-label-small medium:text-label-medium content-default",
                            children: a("Label.ByRoblox")
                        }), (0, F.jsx)(rL, {
                            size: 12
                        })]
                    }), (0, F.jsx)(t8.Badge, {
                        variant: "Contrast",
                        icon: "icon-regular-clock",
                        label: a(1 === i ? "Label.LastDay" : "Label.DaysLeft", {
                            daysLeft: i
                        }),
                        className: "text-overflow"
                    })]
                })]
            }), r && (0, F.jsx)(nD, {
                surfaceKey: "Web_BuyRobux_BonusItem",
                className: "shrink-0"
            })]
        })
    }
    let nV = e => {
        let {
            personalizedBonus: t,
            showPersonalizedRecommendationsMenu: r
        } = e, [n] = t.bonuses;
        if (!n) return null;
        let {
            collectibleItemMetadata: a,
            gamePassMetadata: i,
            virtualPurchasingProductType: s
        } = n, l = s.toString();
        return "PRODUCT_TYPE_COLLECTIBLE_ITEM" === l ? a ? (0, F.jsx)(nz, {
            metadata: a,
            showPersonalizedRecommendationsMenu: r
        }) : (eP("BonusItemMissingMetadata", {
            productType: l
        }), null) : "PRODUCT_TYPE_GAME_PASS_PRODUCT" === l ? i ? (0, F.jsx)(nB, {
            metadata: i,
            showPersonalizedRecommendationsMenu: r
        }) : (eP("BonusItemMissingMetadata", {
            productType: l
        }), null) : (eP("BonusItemUnsupportedType", {
            productType: l
        }), null)
    };

    function nW(e) {
        let {
            isPrimary: t,
            sectionBase: r,
            personalizedBonus: n
        } = e, {
            purchaseProduct: a
        } = (0, O.useContext)(rJ), {
            redirect: i
        } = (0, O.useContext)(em), {
            translateFullKey: s
        } = (0, ei.useFullKeyTranslations)(), l = tt(n.isRedirect, i), o = i?.url ?? "", c = (0, O.useCallback)((e, t) => {
            a({
                product: e,
                event: t,
                isRedirect: l,
                isSubscription: !1,
                isBonus: !0,
                sectionType: "PersonalizedBonus"
            })
        }, [a, l]), u = (0, O.useMemo)(() => l ? nU(o) : nI, [l, o]);
        return (0, F.jsxs)(nk, {
            ...e0(r),
            children: [(0, F.jsxs)("div", {
                children: [(0, F.jsx)(nT, {
                    children: s(r.sectionHeaderTranslationKey)
                }), n.bodyTranslationKey && (0, F.jsx)(nj, {
                    children: s(n.bodyTranslationKey)
                })]
            }), (0, F.jsx)(nA, {
                isPrimary: t,
                banner: (0, F.jsx)(nV, {
                    personalizedBonus: n,
                    showPersonalizedRecommendationsMenu: r.showPersonalizedRecommendationsMenu
                }),
                children: (0, F.jsx)(to, {
                    scope: "personalizedBonus",
                    children: (0, F.jsx)(n_, {
                        onProductClick: c,
                        products: r.products ?? [],
                        OverrideProductItemComponent: u
                    })
                })
            })]
        })
    }

    function nK(e) {
        let {
            daysLeft: t
        } = e, r = (0, ei.useTranslations)("Feature.PersonalizedBonus");
        return (0, F.jsx)(t8.Badge, {
            variant: "Contrast",
            label: 1 === t ? r("Label.LastDay", {
                daysLeft: 1
            }) : r("Label.DaysLeft", {
                daysLeft: t
            }),
            className: "shrink-0"
        })
    }

    function nH(e) {
        if (void 0 === e) return {
            success: !1,
            error: "ABSENT"
        };
        let t = Number(e);
        if ("string" == typeof e && "" === e.trim() || !Number.isFinite(t)) return ew("ResolveLimitedTimeBonusExpirationInvalidTimestamp"), {
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

    function nQ(e) {
        let {
            isPrimary: t,
            sectionBase: r
        } = e, {
            purchaseNonRedirectProduct: n
        } = (0, O.useContext)(rJ), {
            atLeastOneProductHasBonusAmount: a,
            deviceMeta: i
        } = (0, O.useContext)(em), {
            translateFullKey: s
        } = (0, ei.useFullKeyTranslations)(), l = r.productsList?.bodyTranslationKey, o = nH(r.productsList?.promotionExpirationTimestampMs), c = l ? s.html(l, [{
            opening: "termsLinkStart",
            closing: "termsLinkEnd",
            render: e => (0, F.jsx)("a", {
                ...rq("/info/terms", i),
                className: "text-link",
                children: e
            })
        }]) : void 0, u = (0, O.useCallback)(e => {
            n(e, !1, !1, "ProductsList")
        }, [n]);
        return (0, F.jsxs)(nk, {
            ...e0(r),
            children: [(0, F.jsxs)("div", {
                className: "flex flex-col gap-xsmall self-stretch",
                children: [(0, F.jsxs)("div", {
                    className: "flex flex-row justify-between items-center self-stretch",
                    children: [(0, F.jsx)(nT, {
                        children: s(r.sectionHeaderTranslationKey)
                    }), (0, F.jsxs)("div", {
                        className: "flex flex-row items-center gap-small",
                        children: [o.success && (0, F.jsx)(nK, {
                            daysLeft: o.value
                        }), r.showPersonalizedRecommendationsMenu && (0, F.jsx)(nD, {
                            surfaceKey: "Web_BuyRobux_Packages"
                        })]
                    })]
                }), l && (0, F.jsx)(nj, {
                    className: (0, nN.default)({
                        "text-body-small": !a
                    }),
                    children: (0, F.jsx)("span", {
                        children: c ?? s(l)
                    })
                })]
            }), (0, F.jsx)(nA, {
                isPrimary: t,
                children: (0, F.jsx)(to, {
                    scope: "productsList",
                    children: (0, F.jsx)(n_, {
                        onProductClick: u,
                        products: r.products ?? []
                    })
                })
            })]
        })
    }

    function n$(e) {
        let {
            isPrimary: t,
            sectionBase: r
        } = e, {
            purchaseNonRedirectProduct: n
        } = (0, O.useContext)(rJ), {
            translateFullKey: a
        } = (0, ei.useFullKeyTranslations)(), i = (0, O.useCallback)(e => {
            n(e, !1, !1, "Recommended")
        }, [n]), [s] = r.products ?? [], l = tb(te(s?.productId ?? "recommended", "recommended"), {
            isEnabled: !!s
        });
        return s ? (0, F.jsxs)(nk, {
            ...e0(r),
            children: [(0, F.jsxs)("div", {
                className: "flex flex-row justify-between items-center self-stretch",
                children: [(0, F.jsx)(nT, {
                    children: a(r.sectionHeaderTranslationKey)
                }), r.showPersonalizedRecommendationsMenu && (0, F.jsx)(nD, {
                    surfaceKey: "Web_BuyRobux_Packages"
                })]
            }), (0, F.jsx)(nA, {
                isPrimary: t,
                children: (0, F.jsxs)("div", {
                    className: "flex flex-col self-stretch medium:flex-row medium:justify-between medium:items-center",
                    ...l,
                    children: [(0, F.jsx)("div", {
                        className: "flex flex-col self-stretch gap-small padding-bottom-large medium:padding-bottom-none medium:self-auto",
                        children: (0, F.jsx)(nM, {
                            amount: s.robuxAmount,
                            nonPromotionalAmount: s.nonPromotionalPlatformRobuxAmount
                        })
                    }), (0, F.jsx)(V.Button, {
                        onClick: () => {
                            i(s)
                        },
                        ...{
                            [eq]: s.productId
                        },
                        className: "text-label-medium shrink-0 width-full medium:width-[200px]",
                        variant: s.isCallToAction ? "Emphasis" : "Standard",
                        size: "Medium",
                        children: (0, F.jsx)(rd.PriceTag, {
                            tagClassName: "robux-price-tag",
                            amount: Number(rf(s.price.amount)),
                            currencyCode: s.price.amount.currencyCode
                        })
                    })]
                })
            })]
        }) : null
    }

    function nY(e) {
        let {
            isPrimary: t,
            title: r,
            body: n,
            buttonText: a,
            buttonClickHandler: i
        } = e;
        return (0, F.jsxs)("div", {
            className: "flex flex-col self-stretch medium:flex-row medium:justify-between medium:items-center",
            children: [(0, F.jsxs)("div", {
                className: "flex flex-col self-stretch gap-small padding-bottom-large medium:padding-bottom-none",
                children: [(0, F.jsx)("div", {
                    className: "self-stretch text-heading-small content-emphasis",
                    children: r
                }), (0, F.jsx)("div", {
                    className: "self-stretch text-body-medium content-emphasis",
                    children: n
                })]
            }), (0, F.jsx)(V.Button, {
                onClick: i,
                className: "text-label-medium width-full medium:width-[200px]",
                size: "Medium",
                variant: t ? "Emphasis" : "Standard",
                children: a
            })]
        })
    }

    function nq(e) {
        let {
            isPrimary: t,
            sectionBase: r,
            giftCard: n
        } = e, {
            trackGiftCardClick: a
        } = (0, O.useContext)(eD), {
            deviceMeta: i
        } = (0, O.useContext)(em), {
            translateFullKey: s
        } = (0, ei.useFullKeyTranslations)(), l = (0, ei.useTranslations)("Feature.Premium"), o = (0, O.useCallback)(() => {
            a(), et.window?.location.assign(r$(i) ? rY(n.redirectUrl) : n.redirectUrl)
        }, [i, a, n.redirectUrl]);
        return (0, F.jsxs)(nk, {
            ...e0(r),
            children: [(0, F.jsx)(nT, {
                children: s(r.sectionHeaderTranslationKey)
            }), (0, F.jsx)(nA, {
                isPrimary: t,
                children: (0, F.jsx)(nY, {
                    title: s(n.titleTranslationKey, void 0, l("Description.GiftCard")),
                    body: s(n.bodyTranslationKey),
                    buttonText: s(n.buttonTextTranslationKey),
                    buttonClickHandler: o
                })
            })]
        })
    }

    function nX(e) {
        let {
            isPrimary: t,
            robuxGift: r,
            sectionBase: n
        } = e, {
            robuxGifting: {
                openModal: a
            }
        } = (0, O.useContext)(tf), {
            trackRobuxGiftClick: i
        } = (0, O.useContext)(eD), {
            translateFullKey: s
        } = (0, ei.useFullKeyTranslations)(), l = (0, O.useCallback)(() => {
            i(), a()
        }, [i, a]);
        return (0, F.jsxs)(nk, {
            ...e0(n),
            children: [(0, F.jsx)(nT, {
                children: s(n.sectionHeaderTranslationKey)
            }), (0, F.jsx)(nA, {
                isPrimary: t,
                children: (0, F.jsx)(nY, {
                    title: s(r.titleTranslationKey),
                    body: s(r.bodyTranslationKey),
                    buttonText: s(r.buttonTextTranslationKey),
                    buttonClickHandler: l
                })
            })]
        })
    }
    var nJ = e.i(822969),
        nZ = e.i(431545),
        n0 = e.i(465385),
        n1 = e.i(349030),
        n2 = e.i(380688),
        n3 = e.i(35039),
        n5 = e.i(118085),
        n6 = e.i(773228),
        n4 = e.i(687328);
    let n8 = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600"
        },
        n9 = {
            XSmall: "size-150",
            Small: "size-200",
            Medium: "size-250"
        },
        n7 = {
            XSmall: "size-1200",
            Small: "size-1400",
            Medium: "size-1600"
        },
        ae = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium"
        },
        at = {
            XSmall: void 0,
            Small: "padding-top-xxsmall",
            Medium: "padding-y-xxsmall"
        },
        ar = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium"
        },
        an = {
            XSmall: "padding-medium",
            Small: "padding-large",
            Medium: "padding-xlarge"
        },
        aa = {
            XSmall: "Small",
            Small: "Medium",
            Medium: "Large"
        },
        ai = (0, O.forwardRef)((e, t) => {
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
            } = e, h = (0, O.useMemo)(() => s && O.default.createElement("div", {
                className: (0, Q.default)(ae[n], at[n], "content-emphasis text-align-x-start", "clip [display:-webkit-box] [-webkit-line-clamp:3] [-webkit-box-orient:vertical]")
            }, s), [s, n]), f = (0, O.useMemo)(() => u && O.default.createElement("div", {
                className: (0, Q.default)("text-caption-small content-default text-align-x-start", "text-truncate-split text-no-wrap width-full")
            }, u), [u]), g = (0, O.useMemo)(() => l && O.default.createElement("div", {
                className: (0, Q.default)(ar[n], "content-default text-align-x-start")
            }, l), [l, n]), x = (0, O.useMemo)(() => c && O.default.createElement(n4.Icon, {
                name: c,
                size: aa[n]
            }), [c, n]), b = (0, O.useMemo)(() => {
                switch (a) {
                    case "Checkmark":
                        return d && O.default.createElement(n4.Icon, {
                            name: "icon-filled-check",
                            size: aa[n]
                        });
                    case "Checkbox":
                        return O.default.createElement("div", {
                            className: (0, Q.default)(n8[n], "flex items-center justify-center radius-small padding-none content-default", d ? "stroke-none" : "stroke-standard stroke-emphasis", d ? "bg-system-contrast" : "bg-none")
                        }, d && O.default.createElement("div", {
                            className: (0, Q.default)(n8[n], "content-inverse-emphasis icon icon-filled-check")
                        }));
                    case "Radio":
                        return O.default.createElement("div", {
                            className: (0, Q.default)(n8[n], "radius-circle flex items-center justify-center stroke-emphasis stroke-standard", d ? "bg-system-contrast" : "bg-none")
                        }, d && O.default.createElement("div", {
                            className: (0, Q.default)("radius-circle bg-inverse-action-sub-emphasis", n9[n])
                        }));
                    default:
                        return console.error(`Invalid OptionSelector type ${a}`), null
                }
            }, [a, n, d]), y = (0, O.useMemo)(() => o && O.default.createElement("div", {
                className: (0, Q.default)(n7[n], "flex items-center justify-center clip shrink-0")
            }, o), [o, n]), v = (0, O.useMemo)(() => {
                let e = !p && O.default.createElement("div", {
                    className: n8[n]
                }, b);
                switch (r) {
                    case "Horizontal":
                        return O.default.createElement("div", {
                            className: "flex gap-large"
                        }, y, O.default.createElement("div", {
                            className: "flex flex-col gap-xsmall fill clip"
                        }, O.default.createElement("div", {
                            className: "flex gap-small items-start"
                        }, O.default.createElement("div", {
                            className: "flex flex-col items-start fill clip"
                        }, O.default.createElement("div", {
                            className: "flex gap-small items-center width-full"
                        }, x, h), f), e), g));
                    case "Vertical":
                        return O.default.createElement("div", {
                            className: "flex flex-col gap-xsmall"
                        }, O.default.createElement("div", {
                            className: "flex gap-small"
                        }, O.default.createElement("div", {
                            className: "flex flex-col gap-medium fill min-width-0"
                        }, y, O.default.createElement("div", {
                            className: "flex flex-col gap-xsmall"
                        }, x, h, f)), e), g);
                    default:
                        return console.error(`Invalid OptionSelector layout ${r}`), null
                }
            }, [r, y, x, h, g, b, n, f, p]);
            return O.default.createElement("button", {
                type: "button",
                className: (0, Q.default)("bg-none width-full radius-medium stroke-standard", n5.interactable, d ? "stroke-system-contrast" : "stroke-emphasis", an[n], i ? n6.disabledOpacity : "cursor-pointer"),
                disabled: i,
                ref: t,
                onClick: () => m()
            }, O.default.createElement(n5.StateLayer, null), v)
        });
    ai.displayName = "OptionSelector";
    var as = e.i(782009);

    function al(e) {
        let {
            price: t,
            strikethroughPrice: r
        } = e;
        if (!r || r.currencyCode !== t.currencyCode || r.amount <= t.amount) return;
        let n = Math.round((1 - t.amount / r.amount) * 100);
        return n > 0 ? n : void 0
    }
    let ao = e => {
        let t, {
                option: r,
                isSelected: n,
                isBestValue: a,
                onSelect: i
            } = e,
            {
                translate: s
            } = (0, nZ.useTranslation)(),
            l = (0, as.useFormatter)(),
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
            c = al(r),
            u = o({
                amount: r.price.amount / r.months,
                currencyCode: r.price.currencyCode
            });
        r.months > 1 && (t = void 0 === c ? s("Action.PricePerMonth", {
            price: u,
            periodType: nJ.PeriodType.Month
        }) : s("Label.BillingPeriodSavings", {
            pricePerMonth: u,
            savingsPercent: l.number(c / 100, {
                style: "percent"
            })
        }));
        let d = (0, F.jsxs)("div", {
            className: "width-full min-height-1000 gap-small flex flex-row items-center justify-between",
            children: [(0, F.jsxs)("div", {
                className: "min-width-0 flex flex-col items-start",
                children: [(0, F.jsxs)("div", {
                    className: "gap-xsmall flex flex-row items-center",
                    children: [(0, F.jsx)("span", {
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
                                    return t((0, n1.getSubscriptionPeriodTranslationKey)(nJ.PeriodType.Month, e), {
                                        periodCount: e
                                    })
                            }
                        })(r.months, s)
                    }), a && (0, F.jsx)(n3.Badge, {
                        label: s("Label.BestValue"),
                        size: "XSmall",
                        variant: "Neutral"
                    })]
                }), t && (0, F.jsx)("span", {
                    className: "text-body-medium content-default",
                    children: t
                })]
            }), (0, F.jsxs)("div", {
                className: "gap-small flex shrink-0 flex-row items-center",
                children: [void 0 !== c && r.strikethroughPrice && (0, F.jsx)("span", {
                    className: "text-label-medium line-through [color:var(--color-extended-gray-600)]",
                    children: o(r.strikethroughPrice)
                }), (0, F.jsx)("span", {
                    className: "text-label-medium content-emphasis",
                    children: o(r.price)
                })]
            })]
        });
        return (0, F.jsx)("div", {
            "data-testid": `billing-period-option-${r.productId}`,
            children: (0, F.jsx)(ai, {
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
    var ac = e.i(559659);
    let au = {
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
        ad = (0, eS.createFireTelemetryCounter)(au.featureName),
        am = (0, ac.createFireTelemetryHistogram)(au.featureName, {}),
        {
            trackCounter: ap
        } = (0, ef.createTrackers)(au, {
            publish: ad
        }),
        {
            ENUM_PURCHASE_EVENT_TYPE: ah,
            ENUM_VIEW_MESSAGE: af
        } = G.paymentFlowAnalyticsService,
        ag = (e, t, r, n) => {
            let {
                analyticsContext: a,
                paymentSessionId: i
            } = e;
            G.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent({
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
        ax = e => ({
            productId: e.productId,
            months: String(e.months)
        });
    var ab = e.i(910866),
        ay = e.i(482131);
    let av = [{
            opening: "linkStart",
            closing: "linkEnd",
            render: e => (0, F.jsx)("a", {
                className: "underline",
                href: ab.SUBSCRIPTION_TERMS_URL,
                rel: "noopener noreferrer",
                target: "_blank",
                children: e
            })
        }],
        aS = e => {
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
            } = (0, nZ.useTranslation)(), [p, h] = (0, O.useState)(), f = (0, O.useRef)(!1), g = (0, O.useMemo)(() => {
                let e;
                return n.forEach(t => {
                    let r = al(t);
                    void 0 !== r && (!e || r > e.savings || r === e.savings && t.months > e.months) && (e = {
                        productId: t.productId,
                        savings: r,
                        months: t.months
                    })
                }), e?.productId
            }, [n]);
            (0, O.useEffect)(() => {
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
                    }, t = n.map(e => e.months).sort((e, t) => e - t).join(","), ag(e, ah.VIEW_SHOWN, af.ROBLOX_PLUS_BILLING_PERIOD_SHEET_OPENED, {
                        termMonths: t
                    }), ap("BillingPeriodSheetShown", {
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
                E = void 0 !== v && void 0 !== S ? (0, n1.getFreeTrialDisplay)({
                    freeTrialOffer: {
                        duration: v,
                        periodType: S
                    }
                }, nJ.PeriodType.Month) : null,
                C = void 0 === y ? (0, n2.translateHtml)(m, "Description.SubscriptionLegalBillingCycle", av) : E ? (0, n2.translateHtml)(m, "Description.SubscriptionFreeTrialLegalV2", av, {
                    date: y.toLocaleDateString(void 0, {
                        year: "numeric",
                        month: "long",
                        day: "numeric"
                    }),
                    trialDuration: String(E.trialDuration),
                    trialPeriodLabel: m(E.trialPeriodKey),
                    billingPeriodLabel: m(E.billingPeriodKey)
                }) : (0, n2.translateHtml)(m, "Description.SubscriptionFreeTrialLegal", av, {
                    date: y.toLocaleDateString(void 0, {
                        year: "numeric",
                        month: "long",
                        day: "numeric"
                    })
                });
            return (0, F.jsx)(n0.SheetRoot, {
                open: t,
                onOpenChange: e => {
                    e || (ag(b, ah.USER_INPUT, af.ROBLOX_PLUS_BILLING_PERIOD_SHEET_DISMISSED, ax(x)), ap("BillingPeriodSheetDismissed", {
                        viewName: b.analyticsContext.viewName,
                        months: String(x.months)
                    })), r(e)
                },
                children: (0, F.jsxs)(n0.SheetContent, {
                    centerSheetSize: "Medium",
                    closeLabel: m("Action.Close"),
                    largeScreenVariant: "center",
                    children: [(0, F.jsx)(n0.SheetTitle, {
                        children: m("Heading.ChooseBillingPeriod")
                    }), (0, F.jsxs)(n0.SheetBody, {
                        className: "gap-y-xxlarge padding-bottom-medium flex flex-col",
                        "data-testid": "billing-period-sheet-body",
                        children: [(0, F.jsx)("p", {
                            className: "text-body-medium content-default",
                            children: m("Description.ChooseBillingPeriod")
                        }), (0, F.jsx)("div", {
                            className: "gap-y-medium flex flex-col",
                            children: n.map(e => (0, F.jsx)(ao, {
                                isBestValue: e.productId === g,
                                isSelected: e.productId === x.productId,
                                option: e,
                                onSelect: () => {
                                    e.productId !== x.productId && (ag(b, ah.USER_INPUT, af.ROBLOX_PLUS_BILLING_PERIOD_SELECTED, ax(e)), ap("BillingPeriodOptionSelected", {
                                        viewName: b.analyticsContext.viewName,
                                        months: String(e.months)
                                    })), h(e.productId), c?.(e)
                                }
                            }, e.productId))
                        })]
                    }), (0, F.jsx)(n0.SheetActions, {
                        children: (0, F.jsxs)("div", {
                            className: "gap-y-medium flex flex-col",
                            children: [(0, F.jsx)(ay.default, {
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
                                    e = void 0 !== x.freeTrialEndDate, ag(b, ah.USER_INPUT, e ? af.ROBLOX_PLUS_FREE_TRIAL : af.ROBLOX_PLUS_SUBSCRIBE, {
                                        ...ax(x),
                                        isFreeTrial: String(e)
                                    }), ap("BillingPeriodSubscribeClick", {
                                        viewName: b.analyticsContext.viewName,
                                        months: String(x.months),
                                        isFreeTrial: String(e)
                                    }), u?.(x)
                                },
                                onMobilePurchaseInitiated: d,
                                children: m(void 0 === y ? "Action.Subscribe" : "Action.TryItForFree")
                            }), (0, F.jsx)("p", {
                                className: "text-body-small content-default text-align-x-left",
                                "data-testid": "billing-period-legal-footer",
                                children: C
                            })]
                        })
                    })]
                })
            })
        },
        aE = () => {
            let {
                translate: e
            } = (0, nZ.useTranslation)(), t = e("Label.Learnmore");
            return (0, F.jsxs)(n0.SheetContent, {
                centerSheetSize: "Large",
                closeLabel: e("Action.Close"),
                largeScreenVariant: "center",
                mobilePortraitClassName: "![height:97vh] ![max-height:97vh]",
                children: [(0, F.jsx)(n0.SheetTitle, {
                    visuallyHideTitleText: !0,
                    children: t
                }), (0, F.jsx)(n0.SheetBody, {
                    hasPaddingX: !1,
                    children: (0, F.jsx)("iframe", {
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
    var aC = e.i(300350),
        aP = e.i(51267);
    let aw = ["icon-regular-tag", "icon-regular-controller", "icon-regular-robux"],
        aN = ["icon-regular-tag", "icon-regular-tag-arrow-up", "icon-regular-controller", "icon-regular-robux", "icon-regular-hand-two-arrows-horizontal", "icon-regular-arrow-up-from-landscape-rectangle"];

    function ak(e) {
        let t = aN.indexOf(e);
        return -1 === t ? Number.MAX_SAFE_INTEGER : t
    }

    function aT(e) {
        let t = aw.indexOf(e);
        return -1 === t ? Number.MAX_SAFE_INTEGER : t
    }
    let aj = {
            PERIOD_TYPE_WEEK: "weeks",
            PERIOD_TYPE_MONTH: "months",
            PERIOD_TYPE_YEAR: "years"
        },
        aA = {
            discountPercentage: {
                rename: "discountPercent"
            },
            periodType: {
                mapValue: e => aj[String(e)] ?? String(e)
            }
        };

    function aR(e) {
        let t = {};
        for (let [r, n] of Object.entries(e))
            if ("iconName" !== r && "benefitTranslationKey" !== r && "object" == typeof n)
                for (let [e, r] of Object.entries(n)) {
                    let n = aA[e],
                        a = n?.rename ?? e,
                        i = n?.mapValue ? n.mapValue(r) : r;
                    t[a] = i
                }
        return Object.keys(t).length > 0 ? t : void 0
    }

    function aM(e) {
        let {
            benefits: t,
            translate: r
        } = e, n = t.filter(e => {
            var t;
            return t = e.iconName, aw.includes(t)
        }).sort((e, t) => aT(e.iconName) - aT(t.iconName));
        return (0, F.jsx)(O.Fragment, {
            children: n.map((e, t) => (0, F.jsx)(aP.BenefitItem, {
                iconName: e.iconName,
                label: r(e.benefitTranslationKey, aR(e))
            }, `compact-${e.benefitTranslationKey}-${String(t)}`))
        })
    }

    function aI(e) {
        let {
            benefits: t,
            translate: r
        } = e;
        if (0 === t.length) return null;
        let n = t.toSorted((e, t) => ak(e.iconName) - ak(t.iconName)),
            a = Math.ceil(n.length / 2),
            i = n.slice(0, a),
            s = n.slice(a);
        return (0, F.jsxs)("div", {
            className: "gap-x-large gap-y-large width-full grid [grid-template-columns:repeat(2,minmax(0,1fr))]",
            children: [(0, F.jsx)("div", {
                className: "gap-y-large min-width-0 flex flex-col",
                children: i.map((e, t) => (0, F.jsx)(aP.BenefitItem, {
                    iconName: e.iconName,
                    label: r(e.benefitTranslationKey, aR(e))
                }, `lg-left-${e.benefitTranslationKey}-${String(t)}`))
            }), (0, F.jsx)("div", {
                className: "gap-y-large min-width-0 flex flex-col",
                children: s.map((e, t) => (0, F.jsx)(aP.BenefitItem, {
                    iconName: e.iconName,
                    label: r(e.benefitTranslationKey, aR(e))
                }, `lg-right-${e.benefitTranslationKey}-${String(t)}`))
            })]
        })
    }
    var a_ = e.i(836260),
        aU = e.i(882792);
    let aL = {
            PRODUCT_TYPE_ROBLOX_PLUS: nJ.ProductType.Blackbird
        },
        aF = {
            PERIOD_TYPE_MONTH: nJ.PeriodType.Month,
            PERIOD_TYPE_YEAR: nJ.PeriodType.Year,
            PERIOD_TYPE_WEEK: nJ.PeriodType.Week
        },
        aD = e => {
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
            } = (0, nZ.useTranslation)(), d = t.products[0], m = d ? aL[d.subscriptionProductType] : void 0, p = d ? aF[d.periodType] : void 0, h = null != d && void 0 !== m;
            (0, O.useEffect)(() => {
                h && a()
            }, [h, a]), (0, O.useEffect)(() => {
                d ? m || (0, aU.trackCounter)("Error_RobloxSubscriptionWidget_InvalidSubscriptionProductType") : (0, aU.trackCounter)("Error_RobloxSubscriptionWidget_NoPrimaryProduct")
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
                g = (0, a_.default)(f);
            if (!d || !m) return null;
            let x = (Array.isArray(d.offers) ? d.offers : []).some(e => null != e.freeTrial),
                b = Array.isArray(d.benefits) ? d.benefits : [],
                y = x ? u("Action.TryItForFree") : u("Action.PricePerMonth", {
                    price: g,
                    periodType: p ?? nJ.PeriodType.Month
                }),
                v = u("Label.Learnmore"),
                S = "width-full text-label-medium height-1000 [display:none] medium:[display:flex]";
            return (0, F.jsxs)("div", {
                className: "gap-y-xlarge flex flex-col",
                children: [(0, F.jsxs)("div", {
                    className: "gap-x-small min-width-0 flex flex-row flex-wrap justify-between",
                    children: [(0, F.jsxs)("div", {
                        className: "gap-x-medium flex items-center",
                        children: [(0, F.jsx)(n4.Icon, {
                            name: "icon-regular-roblox-plus",
                            size: "Large"
                        }), (0, F.jsx)("span", {
                            className: "text-label-large content-emphasis text-no-wrap",
                            children: u("Title.GetBlackbird")
                        })]
                    }), x && (0, F.jsxs)("div", {
                        className: "gap-x-small text-label-large flex shrink-0 flex-row items-center",
                        children: [(0, F.jsxs)("div", {
                            className: "relative flex flex-row [color:var(--color-extended-gray-600)]",
                            children: [(0, F.jsx)("span", {
                                className: "robux-amount-strike-through"
                            }), (0, F.jsx)("span", {
                                children: g
                            })]
                        }), (0, F.jsx)("span", {
                            children: u("Label.Free") || "Free"
                        })]
                    })]
                }), (0, F.jsx)("div", {
                    className: "gap-x-large gap-y-small medium:hidden flex flex-col",
                    "data-testid": "subscription-compact-benefits",
                    children: (0, F.jsx)(aM, {
                        benefits: b,
                        translate: u
                    })
                }), (0, F.jsx)("div", {
                    className: "medium:block hidden",
                    children: (0, F.jsx)(aI, {
                        benefits: b,
                        translate: u
                    })
                }), (0, F.jsxs)("div", {
                    className: "gap-x-small medium:gap-x-xlarge width-full flex flex-row",
                    children: [c ? (0, F.jsx)(aC.Button, {
                        className: "width-full text-label-medium",
                        size: "Medium",
                        variant: n ? "Emphasis" : "Standard",
                        onClick: c,
                        children: y
                    }) : (0, F.jsx)(ay.default, {
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
                    }), null != l ? (0, F.jsx)(aC.Button, {
                        as: "a",
                        className: S,
                        href: l,
                        size: "Medium",
                        variant: "Standard",
                        onClick: s,
                        children: v
                    }) : (0, F.jsx)(aC.Button, {
                        className: S,
                        size: "Medium",
                        variant: "Standard",
                        onClick: s,
                        children: v
                    })]
                })]
            })
        };
    var aB = e.i(207626);
    let aO = "Payments.BuyRobux.PlusBillingPeriodSelection",
        aG = new class {
            isTreatment() {
                return this.assignment ??= this.fetchIsTreatment().finally(() => {
                    this.isResolved = !0
                }), this.assignment
            }
            async fetchIsTreatment() {
                if (!(0, el.getCurrentUser)()?.id) return !1;
                try {
                    let e = (await nl.default.getAllValuesForLayer(aO)).plusBillingPeriodSelectionVariant;
                    if (0 !== e && 1 !== e) return eP("PlusBillingPeriodSelectionExperimentEvaluated", {
                        variant: "unknown"
                    }), !1;
                    return this.isEnrolled = !0, eP("PlusBillingPeriodSelectionExperimentEvaluated", {
                        variant: e.toString()
                    }), 1 === e
                } catch (e) {
                    return ew("PlusBillingPeriodSelectionExperimentFetchFailed", null, e), !1
                }
            }
            logLayerExposure() {
                if (!this.isResolved) return void eP("PlusBillingPeriodSelectionExposureBeforeAssignment");
                if (this.isEnrolled && !this.hasLoggedExposure) {
                    this.hasLoggedExposure = !0;
                    try {
                        nl.default.logLayerExposure(aO), eP("PlusBillingPeriodSelectionExperimentExposed")
                    } catch (e) {
                        throw this.hasLoggedExposure = !1, e
                    }
                }
            }
            constructor() {
                (0, ns._)(this, "isEnrolled", !1), (0, ns._)(this, "isResolved", !1), (0, ns._)(this, "hasLoggedExposure", !1), (0, ns._)(this, "assignment", void 0)
            }
        };
    var az = e.i(91122);

    function aV() {}
    let aW = (0, O.createContext)({
            itemCount: 0,
            currentPage: -1,
            canNext: !1,
            canPrev: !1,
            allVisible: !0,
            goTo: aV,
            next: aV,
            prev: aV,
            registerItem: () => aV
        }),
        aK = (0, O.createContext)(null),
        aH = 0,
        aQ = {
            position: "absolute",
            top: "50%",
            left: 0,
            transform: "translateY(-50%)",
            zIndex: 10
        },
        a$ = {
            position: "absolute",
            top: "50%",
            right: 0,
            transform: "translateY(-50%)",
            zIndex: 10
        },
        aY = {
            borderRadius: "9999px",
            border: "none",
            padding: 0,
            cursor: "pointer",
            transition: "opacity var(--time-100) var(--ease-linear)"
        };

    function aq(e, t) {
        return `Page ${String(e+1)} of ${String(t)}`
    }
    let aX = Object.assign(function(e) {
        let {
            children: t,
            className: r,
            ariaLabel: n
        } = e, a = (0, O.useRef)(null), i = (0, O.useRef)(new Map), s = (0, O.useRef)(null), [, l] = (0, O.useState)(0), o = (0, O.useCallback)(() => {
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
            b = (0, O.useCallback)(e => {
                let t = [...i.current.values()][e];
                null != t && null != a.current && a.current.scrollTo({
                    left: t.element.offsetLeft - a.current.offsetLeft,
                    behavior: "smooth"
                })
            }, []),
            y = (0, O.useCallback)(() => {
                b(h >= 0 ? Math.min(d - 1, h + 1) : 0)
            }, [b, d, h]),
            v = (0, O.useCallback)(() => {
                p <= 0 ? b(0) : b(Math.max(0, p - Math.max(1, m)))
            }, [p, b, m]),
            S = (0, O.useCallback)((e, t) => (i.current.set(e, {
                element: t,
                isVisible: !1
            }), s.current?.observe(t), o(), () => {
                s.current?.unobserve(t), i.current.delete(e), o()
            }), [o]);
        (0, O.useEffect)(() => {
            let e = a.current,
                t = et.window?.IntersectionObserver;
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
        let E = (0, O.useMemo)(() => ({
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
        return (0, F.jsx)(aW.Provider, {
            value: E,
            children: (0, F.jsx)(aK.Provider, {
                value: a,
                children: (0, F.jsx)("div", {
                    "aria-label": n,
                    className: (0, nN.default)("relative min-width-0 clip-x", r),
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
            } = e, i = (0, O.useContext)(aK), s = (0, O.useCallback)(e => {
                null != i && (i.current = e)
            }, [i]);
            return (0, F.jsx)("div", {
                ref: s,
                className: (0, nN.default)("flex flex-row min-width-0 width-full scroll-x", "large" === n ? "gap-large" : "gap-medium", t),
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
            } = (0, O.useContext)(aW), i = (0, O.useRef)(null), s = (0, O.useRef)("");
            return "" === s.current && (aH += 1, s.current = `carousel-item-${String(aH)}`), (0, O.useEffect)(() => {
                let e = i.current;
                if (null != e) return a(s.current, e)
            }, [a]), (0, F.jsx)("div", {
                ref: i,
                className: (0, nN.default)("carousel-item shrink-0", t),
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
            } = (0, O.useContext)(aW);
            return n ? (0, F.jsx)(t1.IconButton, {
                ariaLabel: t,
                className: (0, nN.default)(r),
                "data-testid": "carousel-prev-button",
                icon: "icon-filled-chevron-large-left",
                isCircular: !0,
                onClick: a,
                size: "Medium",
                style: aQ,
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
            } = (0, O.useContext)(aW);
            return n ? (0, F.jsx)(t1.IconButton, {
                ariaLabel: t,
                className: (0, nN.default)(r),
                "data-testid": "carousel-next-button",
                icon: "icon-filled-chevron-large-right",
                isCircular: !0,
                onClick: a,
                size: "Medium",
                style: a$,
                variant: "OverMedia"
            }) : null
        },
        Indicator: function(e) {
            let {
                className: t,
                formatDotLabel: r = aq
            } = e, {
                itemCount: n,
                currentPage: a,
                allVisible: i,
                goTo: s
            } = (0, O.useContext)(aW);
            return n <= 1 || i ? null : (0, F.jsx)("div", {
                className: (0, nN.default)("flex flex-row items-center justify-center gap-small", t),
                "data-testid": "carousel-indicator",
                role: "tablist",
                children: Array.from({
                    length: n
                }, (e, t) => {
                    let i = t === a;
                    return (0, F.jsx)("button", {
                        "aria-label": r(t, n),
                        "aria-selected": i,
                        className: "content-emphasis size-[8px] bg-action-standard",
                        "data-testid": `carousel-indicator-dot-${String(t)}`,
                        onClick: () => {
                            s(t)
                        },
                        role: "tab",
                        style: {
                            ...aY,
                            opacity: i ? 1 : .22
                        },
                        type: "button"
                    }, t)
                })
            })
        }
    });
    var aJ = e.i(745911);
    let aZ = [{
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
        a0 = [{
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
        a1 = e => {
            let {
                iconName: t,
                benefit: r
            } = e;
            return (0, F.jsxs)("li", {
                className: "flex flex-row items-center gap-medium medium:gap-large",
                children: [(0, F.jsx)(z.Icon, {
                    className: "size-[20px]",
                    name: t,
                    size: "Medium"
                }), (0, F.jsx)("span", {
                    className: "text-body-medium content-default",
                    children: r
                })]
            })
        };

    function a2(e) {
        if (null == e) return 0;
        if ("number" == typeof e) return Number.isFinite(e) ? e : 0;
        let t = Number(e);
        return Number.isFinite(t) ? t : 0
    }
    let a3 = e => {
            let {
                product: t,
                robuxAllowance: r
            } = e, n = (0, ei.useTranslations)("Feature.RobloxSubscription"), a = (0, aJ.useFormatter)(), i = (t.benefits ?? []).reduce((e, t) => Math.max(e, t.plusDiscountSubscriptionBenefits?.discountPercentage ?? 0), 0), s = a.number(i / 100, {
                style: "percent",
                maximumFractionDigits: 0
            }), l = a.number(a2(t.price.units) + (t.price.nanos ?? 0) * 1e-9, {
                style: "currency",
                currency: t.price.currencyCode
            }), o = t.strikethroughPrice ? a.number(a2(t.strikethroughPrice.units) + (t.strikethroughPrice.nanos ?? 0) * 1e-9, {
                style: "currency",
                currency: t.strikethroughPrice.currencyCode
            }) : null, c = a.number(r), u = r > 0 ? a0 : aZ, d = {
                discountPercent: s,
                robuxAmount: c,
                oldAmount: o,
                newAmount: l
            };
            return (0, F.jsx)("ul", {
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
                    return (0, F.jsx)(a1, {
                        benefit: n(a, i?.(d)),
                        iconName: r
                    }, `${r}-${String(t)}`)
                })
            })
        },
        a5 = {
            PRODUCT_TYPE_ROBLOX_PLUS: "Blackbird"
        };

    function a6(e) {
        if (null == e) return 0;
        let t = Number.parseInt(e, 10);
        return Number.isFinite(t) && t > 0 ? t : 0
    }

    function a4(e) {
        return function(e) {
            if (null == e) return 0;
            if ("number" == typeof e) return Number.isFinite(e) ? e : 0;
            let t = Number(e);
            return Number.isFinite(t) ? t : 0
        }(e.units) + (e.nanos ?? 0) * 1e-9
    }

    function a8(e) {
        switch (e) {
            case "PERIOD_TYPE_WEEK":
                return "Week";
            case "PERIOD_TYPE_MONTH":
                return "Month";
            case "PERIOD_TYPE_YEAR":
                return "Year"
        }
    }
    let a9 = e => {
            let {
                href: t,
                linkProps: r,
                onClick: n,
                isEmphasized: a,
                children: i
            } = e;
            return (0, F.jsx)(V.Button, {
                as: "a",
                className: "width-full",
                href: t,
                icon: "icon-regular-arrow-up-right-from-square",
                onClick: n,
                rel: "noreferrer",
                role: "button",
                size: "Medium",
                target: "_blank",
                variant: a ? "Emphasis" : "Standard",
                ...r,
                children: i
            })
        },
        a7 = e => {
            let t, {
                    product: r,
                    deviceMeta: n,
                    isEmphasized: a,
                    isPrimary: i,
                    onSubscribeClick: s,
                    onSubscribeOverride: l,
                    paymentSessionId: o,
                    redirect: c
                } = e,
                u = (0, ei.useTranslations)("Feature.RobloxSubscription"),
                d = (0, aJ.useFormatter)(),
                {
                    redirectError: {
                        openModal: m
                    }
                } = (0, O.useContext)(tf),
                p = (0, O.useMemo)(() => {
                    if (void 0 === et.window || !c?.url) return;
                    let e = new URL(c.url, et.window.location.origin);
                    return e.searchParams.set("ctx", "subscription"), e.searchParams.set("type", "RobloxPlus"), e.searchParams.set("id", r.subscriptionProductId), `${e.pathname}${e.search}`
                }, [c?.url, r.subscriptionProductId]),
                h = !!r.isRedirect,
                f = !!p,
                {
                    isAwaitingUrl: g,
                    linkProps: x,
                    rowProps: b
                } = ty((t = r.subscriptionProductId, `subscription:${t}`), {
                    isRedirect: h,
                    hasUrl: f
                }),
                y = a5[r.subscriptionProductType];
            if (null == y) return null;
            let v = a6(r.robuxAmount),
                S = v > 0 ? `Plus ${String(v)}` : "Roblox Plus",
                E = (Array.isArray(r.offers) ? r.offers : []).some(e => e.freeTrial),
                C = d.number(a4(r.price), {
                    style: "currency",
                    currency: r.price.currencyCode
                }),
                P = r.strikethroughPrice ? d.number(a4(r.strikethroughPrice), {
                    style: "currency",
                    currency: r.strikethroughPrice.currencyCode
                }) : null,
                w = E ? u("Action.TryItForFree") : u("Action.PricePerMonth", {
                    price: C,
                    periodType: a8(r.periodType)
                });
            return (0, F.jsxs)("div", {
                className: (0, nN.default)("radius-large padding-medium flex flex-col items-stretch justify-between gap-small height-full", {
                    "bg-surface-100": i,
                    "stroke-standard": !i,
                    "stroke-default": !i
                }),
                "data-testid": `subscription-tile-${r.subscriptionProductId}`,
                ...{
                    [eX]: r.subscriptionProductId,
                    [eJ]: r.subscriptionProductType
                },
                ...b,
                children: [(0, F.jsxs)("div", {
                    className: "flex flex-row items-center justify-between gap-large",
                    children: [(0, F.jsx)("h3", {
                        className: "text-label-large content-emphasis text-truncate-end",
                        children: S
                    }), (0, F.jsxs)("div", {
                        className: "flex flex-row items-center justify-end gap-small",
                        children: [P && (0, F.jsx)("span", {
                            className: "text-title-medium text-no-wrap content-muted line-through",
                            children: P
                        }), (0, F.jsx)("span", {
                            className: "text-title-medium content-emphasis text-no-wrap",
                            children: C
                        })]
                    })]
                }), (0, F.jsx)(a3, {
                    product: r,
                    robuxAllowance: v
                }), h ? (0, F.jsx)(a9, {
                    href: tr(p ?? "", f),
                    linkProps: x,
                    onClick: e => {
                        if (g) {
                            e.preventDefault(), eP("PurchaseRedirectUrlEmpty"), c?.refreshAuthTicket(), m();
                            return
                        }
                        nm(e), s?.({
                            isFreeTrial: !1,
                            productId: r.subscriptionProductId,
                            isRedirect: !0
                        }), c?.refreshAuthTicket()
                    },
                    isEmphasized: a,
                    children: w
                }) : l ? (0, F.jsx)(V.Button, {
                    className: "width-full",
                    onClick: l,
                    size: "Medium",
                    variant: a ? "Emphasis" : "Standard",
                    children: w
                }) : (0, F.jsx)(ay.default, {
                    className: "width-full",
                    deviceMeta: n,
                    paymentSessionId: o,
                    productId: r.subscriptionProductId,
                    productType: y,
                    size: "Medium",
                    trackSubscriptionButtonClick: () => {
                        s?.({
                            isFreeTrial: E,
                            productId: r.subscriptionProductId,
                            isRedirect: !1
                        })
                    },
                    variant: a ? "Emphasis" : "Standard",
                    children: w
                })]
            })
        };

    function ie(e) {
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
        } = t, d = "dark" === (0, az.useResolvedColorMode)() ? "color-mode-light light-theme" : "color-mode-dark dark-theme";
        return ((0, O.useEffect)(() => {
            u.length > 0 && a()
        }, []), 0 === u.length) ? null : (0, F.jsxs)(aX, {
            ariaLabel: "Roblox Plus subscription tiers",
            className: "self-stretch bleed-section-padding",
            children: [(0, F.jsx)("div", {
                className: d,
                children: (0, F.jsx)(aX.PrevButton, {
                    ariaLabel: "Previous tier",
                    className: "hidden medium:flex"
                })
            }), (0, F.jsx)(aX.Track, {
                className: "bleed-section-padding-track bundle-carousel-track-cap",
                children: u.map((e, t) => (0, F.jsx)(aX.Item, {
                    className: "flex flex-col width-[313px] medium:width-[242px]",
                    children: (0, F.jsx)(a7, {
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
            }), (0, F.jsx)("div", {
                className: d,
                children: (0, F.jsx)(aX.NextButton, {
                    ariaLabel: "Next tier",
                    className: "hidden medium:flex"
                })
            }), (0, F.jsx)(aX.Indicator, {
                className: "padding-top-medium medium:hidden"
            })]
        })
    }
    let it = e => (function(e, t) {
            let r = null != t && t > 0 ? t : 1;
            switch (e) {
                case nJ.PeriodType.Month:
                    return r;
                case nJ.PeriodType.Year:
                    return 12 * r;
                case nJ.PeriodType.Week:
                    return
            }
        })(a8(e.periodType), e.periodCount),
        ir = e => void 0 !== a5[e.subscriptionProductType] && 0 === a6(e.robuxAmount) && void 0 !== it(e),
        ia = e => {
            let t = (e => {
                var t;
                let r = e.offers?.find(e => e.freeTrial)?.freeTrial;
                if (r && ("PERIOD_TYPE_WEEK" === (t = r.periodType) || "PERIOD_TYPE_MONTH" === t || "PERIOD_TYPE_YEAR" === t)) return {
                    duration: r.duration,
                    periodType: a8(r.periodType)
                }
            })(e);
            return {
                productId: e.subscriptionProductId,
                productType: a5[e.subscriptionProductType] ?? "",
                months: it(e) ?? 1,
                price: {
                    amount: a4(e.price),
                    currencyCode: e.price.currencyCode
                },
                strikethroughPrice: e.strikethroughPrice && {
                    amount: a4(e.strikethroughPrice),
                    currencyCode: e.strikethroughPrice.currencyCode
                },
                freeTrialEndDate: t ? (0, n1.addBillingPeriod)(Date.now(), t.duration, t.periodType) : void 0,
                freeTrialDuration: t?.duration,
                freeTrialPeriodType: t?.periodType
            }
        },
        ii = "/plus",
        is = "text-label-medium text-default [text-decoration:underline] [text-underline-position:from-font]";

    function il(e) {
        let t, {
                isPrimary: r,
                sectionBase: n,
                subscriptionV2: a
            } = e,
            i = (0, ei.useTranslations)("Feature.RobloxSubscription"),
            {
                translateFullKey: s
            } = (0, ei.useFullKeyTranslations)(),
            {
                paymentSession: l,
                redirect: o,
                deviceMeta: c
            } = (0, O.useContext)(em),
            {
                trackSubscriptionV2Shown: u,
                trackSubscriptionV2SubscribeClick: d,
                trackSubscriptionV2LearnMoreClick: m
            } = {
                trackSubscriptionV2Shown: (t = (0, O.useContext)(eD)).trackSubscriptionV2Shown,
                trackSubscriptionV2SubscribeClick: t.trackSubscriptionV2SubscribeClick,
                trackSubscriptionV2LearnMoreClick: t.trackSubscriptionV2LearnMoreClick
            },
            [p, h] = (0, O.useState)(!1),
            {
                isInApp: f
            } = c,
            g = (0, O.useCallback)(() => {
                m(), f && h(!0)
            }, [f, m]),
            x = (0, O.useCallback)(e => {
                e || h(!1)
            }, []),
            b = (0, O.useCallback)(e => {
                ("Enter" === e.key || " " === e.key) && (e.preventDefault(), g())
            }, [g]),
            {
                tileProducts: y,
                billingPeriodOptions: v
            } = (0, O.useMemo)(() => {
                var e;
                let t, r, n;
                return r = (t = (e = a.products).filter(ir)).some(e => 1 === it(e)), n = t.some(e => (it(e) ?? 0) > 1), r && n ? {
                    tileProducts: e.filter(e => !ir(e) || 1 === it(e)),
                    billingPeriodOptions: t.map(ia)
                } : {
                    tileProducts: e,
                    billingPeriodOptions: []
                }
            }, [a.products]),
            S = (0, O.useMemo)(() => ({
                ...a,
                products: y
            }), [a, y]),
            E = y.at(0),
            C = v.find(e => 1 === e.months)?.productId,
            {
                isTreatment: P,
                logExposure: w
            } = function(e) {
                let [t, r] = (0, O.useState)(!1);
                (0, O.useEffect)(() => {
                    e && (async () => {
                        r(await aG.isTreatment())
                    })()
                }, [e]);
                let n = (0, O.useCallback)(() => {
                    if (e) try {
                        aG.logLayerExposure()
                    } catch (e) {
                        ew("PlusBillingPeriodSelectionLayerExposureError", null, e)
                    }
                }, [e]);
                return {
                    isTreatment: e && t,
                    logExposure: n
                }
            }(y.some(e => e.subscriptionProductId === C && !e.isRedirect)),
            [N, k] = (0, O.useState)(!1),
            T = (0, O.useMemo)(() => ({
                triggeringContext: eQ(c),
                viewName: G.paymentFlowAnalyticsService.ENUM_VIEW_NAME.ROBLOX_PLUS_BUY_ROBUX
            }), [c]),
            j = (0, O.useCallback)(() => {
                w(), k(!0)
            }, [w]),
            A = (0, O.useCallback)(() => {
                k(!1)
            }, []),
            R = (0, O.useCallback)(e => {
                e.productId === C && w(), d(e), e.isRedirect || ng(c, !0, e.productId)
            }, [C, c, w, d]),
            M = (0, O.useCallback)(e => {
                eP("SubscriptionV2SubscribeClick", {
                    isFreeTrial: String(void 0 !== e.freeTrialEndDate),
                    productId: e.productId,
                    isRedirect: "false"
                }), ng(c, !0, e.productId)
            }, [c]),
            I = (0, O.useMemo)(() => y.some(e => e.offers?.some(e => !!e.freeTrial) ?? !1), [y]),
            _ = null != E;
        (0, O.useEffect)(() => {
            _ && eP("SubscriptionV2SectionShown", {
                variant: y.length > 1 ? "carousel" : "single",
                tierCount: String(y.length),
                isFreeTrial: String(I)
            })
        }, []);
        let U = (0, O.useCallback)(() => {
                u(I)
            }, [u, I]),
            L = (0, O.useCallback)(() => {
                R({
                    isFreeTrial: I,
                    productId: E?.subscriptionProductId ?? "Unknown",
                    isRedirect: !1
                })
            }, [R, I, E]);
        if (!E) return eP("SubscriptionV2NoPrimaryProduct"), null;
        let D = i("Label.Learnmore"),
            B = y.length > 1;
        return (0, F.jsxs)(nk, {
            "data-testid": "section-subscription-v2",
            ...e0(n),
            children: [(0, F.jsx)(nT, {
                children: (0, F.jsxs)("div", {
                    className: "flex flex-row width-full justify-between items-center",
                    children: [(0, F.jsxs)("div", {
                        className: "flex flex-row items-center gap-x-small medium:gap-x-medium",
                        children: [(0, F.jsx)(z.Icon, {
                            name: "icon-regular-roblox-plus",
                            size: "Large",
                            className: "medium:size-[var(--icon-size-xlarge)]"
                        }), s(n.sectionHeaderTranslationKey)]
                    }), f ? (0, F.jsx)("span", {
                        className: (0, nN.default)(is, "cursor-pointer", {
                            "medium:[display:none]": !B
                        }),
                        "data-testid": "header-learn-more-trigger",
                        onClick: g,
                        onKeyDown: b,
                        role: "button",
                        tabIndex: 0,
                        children: D
                    }) : (0, F.jsx)("a", {
                        className: (0, nN.default)(is, {
                            "medium:[display:none]": !B
                        }),
                        "data-testid": "header-learn-more-link",
                        href: ii,
                        onClick: m,
                        children: D
                    })]
                })
            }), B ? (0, F.jsx)(ie, {
                baseProductId: C,
                deviceMeta: c,
                isPrimary: !!r,
                onBaseProductSubscribe: P ? j : void 0,
                onSubscriptionSectionViewShown: U,
                onSubscriptionSubscribeClick: R,
                paymentSessionId: l?.id,
                redirect: o,
                subscriptionV2: S
            }) : (0, F.jsx)(nA, {
                isPrimary: r,
                children: (0, F.jsx)("div", {
                    className: "self-stretch medium:flex-row medium:justify-between",
                    children: (0, F.jsx)(aD, {
                        deviceMeta: c,
                        isPrimary: !!r,
                        onSubscriptionSectionViewShown: U,
                        onSubscriptionSubscribeClick: L,
                        subscriptionV2: S,
                        onLearnMoreClick: g,
                        learnMoreHref: f ? void 0 : ii,
                        paymentSessionId: l?.id,
                        onSubscribeOverride: P ? j : void 0
                    })
                })
            }), f && (0, F.jsx)(aB.SheetRoot, {
                open: p,
                onOpenChange: x,
                children: (0, F.jsx)(aE, {})
            }), P && (0, F.jsx)(aS, {
                analyticsContext: T,
                deviceMeta: c,
                isOpen: N,
                options: v,
                paymentSessionId: l?.id,
                onMobilePurchaseInitiated: A,
                onOpenChange: k,
                onSubscribeClick: M
            })]
        })
    }
    let io = () => {
        let {
            robuxBalance: e
        } = (0, O.useContext)(em);
        return "number" != typeof e ? null : (0, F.jsxs)(O.Fragment, {
            children: [(0, F.jsx)(z.Icon, {
                name: "icon-filled-robux"
            }), (0, F.jsx)("span", {
                className: "text-label-medium content-action-standard",
                children: (0, t4.formatNumber)(e)
            })]
        })
    };

    function ic(e) {
        let {
            transfers: t
        } = e, {
            buyRobuxPageData: {
                pageHeaderMetadata: r
            },
            urlParams: n,
            deviceMeta: a
        } = (0, O.useContext)(em), i = eO(a), {
            translateFullKey: s
        } = (0, ei.useFullKeyTranslations)(), l = "true" === n.showHeader, o = l && !t ? (0, F.jsx)("div", {
            className: "self-stretch flex flex-row space-between items-center",
            style: {
                position: "sticky",
                top: "calc(10px + env(safe-area-inset-top))",
                zIndex: 1,
                marginTop: "-4px"
            },
            children: (0, F.jsx)("div", {
                className: "flex flex-row justify-center items-center gap-small height-1000 padding-left-medium padding-right-large radius-circle bg-surface-0 margin-left-auto",
                children: (0, F.jsx)(io, {})
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
            render: e => (m.used = !0, (0, F.jsx)("span", {
                className: "line-through [font-weight:normal] [color:var(--color-extended-gray-600)]",
                children: e
            }))
        }], {
            strikethroughPercentage: u,
            percentage: c
        }) : void 0, h = null != p, f = h && m.used, g = (0, F.jsx)("h1", {
            className: (0, nN.default)("self-stretch text-align-x-left text-section-title content-emphasis large:text-align-x-center padding-y-none", !f && "large:margin-x-[120px]"),
            children: h ? p : s(d, c ? {
                percentage: c
            } : {})
        });
        return l ? (0, F.jsxs)(O.Fragment, {
            children: [o, (0, F.jsx)("div", {
                className: "flex flex-col justify-center items-center self-stretch padding-bottom-medium large:padding-y-xxlarge large:gap-large gap-small",
                children: g
            })]
        }) : (0, F.jsxs)("div", {
            className: "flex flex-col justify-center items-center self-stretch padding-bottom-medium large:padding-y-xxlarge large:gap-large gap-small padding-top-xlarge",
            children: [!i && !t && (0, F.jsx)("div", {
                className: "self-stretch flex flex-row justify-end items-center large:hidden",
                children: (0, F.jsx)("div", {
                    className: "flex flex-row justify-center items-center gap-small height-1000 padding-left-medium padding-right-large radius-circle bg-surface-0",
                    children: (0, F.jsx)(io, {})
                })
            }), g]
        })
    }
    let iu = [{
            questionKey: "Action.WhatAreRobuxQuestion",
            answerKey: "Action.WhatAreRobuxAnswer"
        }, {
            questionKey: "Action.WhereAreMyRobuxQuestion",
            answerKey: "Action.WhereAreMyRobuxAnswer"
        }, {
            questionKey: "Action.DoRobuxExpireQuestion",
            answerKey: "Action.DoRobuxExpireAnswer"
        }],
        id = {
            questionKey: "Action.HowToRedeemGiftCardQuestion",
            answerKey: "Action.HowToRedeemGiftCardAnswer"
        };

    function im() {
        let e = (0, ei.useTranslations)("Feature.BuyRobux"),
            {
                deviceMeta: t
            } = (0, O.useContext)(em),
            [r, n] = (0, O.useState)(() => new Set),
            a = eB(t) ? [...iu, id] : iu,
            i = (0, O.useCallback)(e => {
                n(t => {
                    let r = new Set(t);
                    return r.has(e) ? r.delete(e) : r.add(e), r
                })
            }, []);
        return (0, F.jsxs)(nk, {
            children: [(0, F.jsx)(nT, {
                children: e("Heading.FAQ")
            }), (0, F.jsx)("div", {
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
                        render: e => (0, F.jsx)("a", {
                            href: (0, rP.getAbsoluteUrl)("/transactions"),
                            className: "text-link",
                            children: e
                        })
                    }] : a === id.answerKey && (o = [{
                        opening: "redeemLinkStart",
                        closing: "redeemLinkEnd",
                        render: e => (0, F.jsx)("a", {
                            href: (0, rP.getAbsoluteUrl)("/redeem"),
                            className: "text-link",
                            children: e
                        })
                    }]);
                    let c = r.has(n),
                        u = `faq-panel-${n}`;
                    return (0, F.jsxs)("div", {
                        className: "radius-medium stroke-standard stroke-default overflow-hidden padding-x-medium padding-y-small",
                        children: [(0, F.jsxs)("div", {
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
                            children: [(0, F.jsx)("span", {
                                className: "text-align-x-left text-title-medium",
                                children: e(n)
                            }), (0, F.jsx)(z.Icon, {
                                name: c ? "icon-regular-chevron-large-up" : "icon-regular-chevron-large-down",
                                size: "Medium",
                                className: "content-emphasis"
                            })]
                        }), c && (0, F.jsx)("div", {
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
    var ip = e.i(708923),
        ih = e.i(739472),
        ig = e.i(309937),
        ix = e.i(641928);
    let ib = async (e, t) => {
        let r = `${e}_API`,
            n = performance.now();
        ad(r, {
            statusCode: "Throughput"
        });
        try {
            let e = await t();
            return ad(r, {
                statusCode: "200"
            }), e
        } catch (e) {
            throw ad(r, {
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
            am(`${r}_LatencyMs`, void 0, performance.now() - n)
        }
    }, iy = [];
    var iv = e.i(938759),
        iv = iv,
        iS = e.i(283023);

    function iE(e) {
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
    var iC = e.i(907119),
        iC = iC,
        iP = e.i(41621);
    let iw = {
        XSmall: {
            containerSize: "height-600 width-600",
            iconSize: "Small"
        },
        Small: {
            containerSize: "height-800 width-800",
            iconSize: "Medium"
        }
    };

    function iN(e) {
        let {
            thumbnailUrl: t,
            displayName: r,
            size: n,
            className: a = ""
        } = e, {
            containerSize: i,
            iconSize: s
        } = iw[n];
        return (0, F.jsx)("div", {
            className: `${i} radius-circle clip flex items-center justify-center shrink-0 ${a}`,
            children: t ? (0, F.jsx)("img", {
                src: t,
                alt: r,
                className: "height-full width-full object-cover"
            }) : (0, F.jsx)(z.Icon, {
                name: "icon-regular-person",
                size: s
            })
        })
    }
    let ik = "radial-gradient(circle at -10px 12px, transparent 14px, black 14px)";

    function iT(e) {
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
                    maskImage: ik,
                    WebkitMaskImage: ik
                }
            });
        return (0, F.jsxs)("div", {
            className: "flex flex-row items-center shrink-0",
            children: [n.map((e, t) => (0, F.jsx)("div", {
                style: i(t),
                children: (0, F.jsx)(iN, {
                    thumbnailUrl: e.sender.thumbnailUrl,
                    displayName: e.sender.displayName,
                    size: "XSmall",
                    className: "bg-shift-200"
                })
            }, e.transferRequestId)), r && (0, F.jsx)("div", {
                style: i(n.length),
                children: (0, F.jsx)("div", {
                    "aria-hidden": "true",
                    className: "height-600 width-600 radius-circle bg-shift-200 flex items-center justify-center shrink-0",
                    children: (0, F.jsx)(z.Icon, {
                        name: "icon-filled-three-dots-horizontal",
                        size: "XSmall"
                    })
                })
            })]
        })
    }
    var iv = iv,
        iC = iC,
        ij = e.i(195567),
        iA = e.i(175055);

    function iR(e) {
        let {
            iconName: t,
            title: r,
            metadata: n,
            onSelect: a
        } = e;
        return (0, F.jsx)(ij.ListItem, {
            className: "padding-x-none [&>div]:padding-y-small",
            divider: "None",
            isContained: !0,
            leading: (0, F.jsx)("span", {
                className: "bg-shift-200 radius-circle size-1200 flex items-center justify-center",
                children: (0, F.jsx)(z.Icon, {
                    name: t,
                    size: "Large"
                })
            }),
            metadata: n,
            size: "Medium",
            title: r,
            trailing: (0, F.jsx)(iA.ListItemChevronTrailingAccessory, {}),
            onSelect: a
        })
    }
    var iM = e.i(358239),
        iI = e.i(175067);

    function i_(e, t) {
        if (void 0 !== et.window)
            if (eO(t)) et.window.location.href = e;
            else if (t.isIosDevice || t.isAndroidDevice || (0, iM.isIos13Ipad)() || t.isChromeOs) {
            let t;
            et.window.location.href = ((t = new URL("https://ro.blox.com/Ebh5")).search = new URLSearchParams({
                pid: "buy-robux-currency-transfer",
                is_retargeting: "false",
                deep_link_value: e
            }).toString(), t.toString())
        } else if (t.isDesktop && !t.isUniversalApp) {
            let t = (0, iI.getGameLauncher)();
            t ? t.startDeepLinkFlow(e) : et.window.Roblox.ProtocolHandlerClientInterface?.startDeepLinkFlow ? et.window.Roblox.ProtocolHandlerClientInterface.startDeepLinkFlow(e) : et.window.location.href = e
        } else et.window.location.href = e
    }

    function iU(e) {
        let t = new URL("roblox://navigation/currency_transfer");
        return t.search = new URLSearchParams(e).toString(), t.toString()
    }

    function iL(e) {
        let {
            transfer: t,
            acceptTranslationKey: r
        } = e, {
            translateFullKey: n
        } = (0, ei.useFullKeyTranslations)(), {
            trackPendingTransfersAcceptClick: a
        } = (0, O.useContext)(eD), {
            deviceMeta: i
        } = (0, O.useContext)(em);
        return (0, F.jsxs)("div", {
            className: "flex flex-row items-center justify-between gap-small padding-medium radius-medium stroke-standard stroke-default",
            children: [(0, F.jsxs)("div", {
                className: "flex flex-row items-center gap-small",
                children: [(0, F.jsx)(iN, {
                    thumbnailUrl: t.sender.thumbnailUrl,
                    displayName: t.sender.displayName,
                    size: "Small",
                    className: "bg-surface-200"
                }), (0, F.jsxs)("div", {
                    className: "flex flex-col",
                    children: [(0, F.jsx)("span", {
                        className: "text-label-medium content-emphasis",
                        children: t.sender.displayName
                    }), (0, F.jsx)("span", {
                        className: "text-body-small content-muted",
                        children: new Date(Number(t.createdTimestampMs)).toLocaleDateString("default", {
                            month: "short",
                            day: "numeric",
                            year: "numeric"
                        })
                    })]
                })]
            }), (0, F.jsxs)("div", {
                className: "flex flex-row items-center gap-small",
                children: [(0, F.jsxs)("div", {
                    className: "flex flex-row items-center gap-xsmall",
                    children: [(0, F.jsx)(z.Icon, {
                        name: "icon-regular-robux",
                        size: "Small"
                    }), (0, F.jsx)("span", {
                        className: "text-label-medium content-emphasis",
                        children: (0, t4.formatNumber)(Number(t.netTransferRobuxAmount))
                    })]
                }), (0, F.jsx)(V.Button, {
                    size: "Small",
                    variant: "Standard",
                    onClick: () => {
                        var e;
                        a(), e = t.transferRequestId, eP("PendingTransferDeepLink"), i_(iU({
                            direction: "receive",
                            transferrequestid: `RXT-${e}`
                        }), i)
                    },
                    children: n(r)
                })]
            })]
        })
    }

    function iF(e) {
        let {
            pendingTransfers: t,
            acceptTransfersTranslationKey: r
        } = e, n = (0, ei.useTranslations)("Feature.BuyRobux");
        return (0, F.jsxs)(aB.SheetContent, {
            centerSheetSize: "Medium",
            closeLabel: "Close",
            largeScreenVariant: "center",
            children: [(0, F.jsx)(aB.SheetTitle, {
                children: n("Heading.PendingTransfers")
            }), (0, F.jsx)(aB.SheetBody, {
                children: (0, F.jsx)("div", {
                    className: "flex flex-col gap-medium padding-bottom-xlarge overflow-y-auto",
                    style: {
                        maxHeight: "60vh"
                    },
                    children: t.map(e => (0, F.jsx)(iL, {
                        transfer: e,
                        acceptTranslationKey: r
                    }, e.transferRequestId))
                })
            })]
        })
    }

    function iD(e) {
        let {
            pendingTransfers: t,
            acceptTransfersTranslationKey: r
        } = e, n = (0, ei.useTranslations)("Feature.BuyRobux"), [a, i] = (0, O.useState)(!1), s = (0, O.useMemo)(() => t.reduce((e, t) => e + Number(t.netTransferRobuxAmount), 0), [t]), l = (0, t4.formatNumber)(t.length), o = (0, t4.formatNumber)(s), c = 1 === t.length;
        return (0, F.jsxs)(O.Fragment, {
            children: [(0, F.jsx)(iR, {
                iconName: "icon-regular-robux",
                metadata: n("Label.AcceptTheseRobux", void 0, "Accept these Robux"),
                title: n(c ? "Label.PendingTransfersSummary.Singular" : "Label.PendingTransfersSummary.Plural", {
                    count: l,
                    robux: o
                }, c ? `${l} person sent you ${o} Robux` : `${l} people sent you ${o} Robux`),
                onSelect: () => {
                    i(!0)
                }
            }), (0, F.jsx)(aB.SheetRoot, {
                open: a,
                onOpenChange: i,
                children: (0, F.jsx)(iF, {
                    acceptTransfersTranslationKey: r,
                    pendingTransfers: t
                })
            })]
        })
    }

    function iB(e) {
        let {
            referral: t,
            shouldDeeplinkToReferral: r
        } = e, n = (0, ei.useTranslations)("Feature.RobloxSubscription"), a = (0, aJ.useFormatter)(), {
            handle: i,
            isLoading: s
        } = (0, iP.useReferrerHandle)(String(t.senderUserId)), {
            deviceMeta: l
        } = (0, O.useContext)(em), [o, c] = (0, O.useState)(!1), u = n("Heading.ReferralRecipientEntry", {
            amount: a.number(ab.REFERRAL_REWARD_ROBUX)
        }, `Join Plus to get ${a.number(ab.REFERRAL_REWARD_ROBUX)} Robux`);
        return s ? null : (0, F.jsxs)(O.Fragment, {
            children: [(0, F.jsx)(iR, {
                iconName: "icon-regular-roblox-plus",
                metadata: i ? u : void 0,
                title: i ? n("Description.ReferralPendingRequest", {
                    displayName: i
                }, `${i} referred you to Plus`) : u,
                onSelect: () => {
                    if (r) {
                        iC.default.buyRobuxReferralReviewClick(String(t.senderUserId), t.referralId), i_(iE({
                            surface: "PlusReferralLandingSheet",
                            entrypoint: "BuyRobuxPage",
                            referrerId: t.senderUserId
                        }), l);
                        return
                    }
                    c(!0)
                }
            }), (0, F.jsx)(iv.default, {
                invite: {
                    referrerId: String(t.senderUserId)
                },
                open: o,
                surface: iS.PlusReferralSurface.BuyRobuxPage,
                onOpenChange: c
            })]
        })
    }

    function iO(e) {
        let {
            pendingTransfers: t,
            acceptTransfersTranslationKey: r,
            pendingReferrals: n,
            shouldDeeplinkToReferral: a
        } = e, i = (0, ei.useTranslations)("Feature.BuyRobux");
        return (0, F.jsxs)(aB.SheetContent, {
            centerSheetSize: "Medium",
            closeLabel: "Close",
            largeScreenVariant: "center",
            children: [(0, F.jsx)(aB.SheetTitle, {
                children: i("Heading.ReviewPendingRequests", void 0, "Review pending requests")
            }), (0, F.jsx)(aB.SheetBody, {
                children: (0, F.jsxs)("div", {
                    className: "flex flex-col gap-xsmall padding-bottom-xlarge overflow-y-auto",
                    style: {
                        maxHeight: "60vh"
                    },
                    children: [r && t.length > 0 ? (0, F.jsx)(iD, {
                        acceptTransfersTranslationKey: r,
                        pendingTransfers: t
                    }) : null, n.map(e => (0, F.jsx)(iB, {
                        referral: e,
                        shouldDeeplinkToReferral: a
                    }, e.referralId))]
                })
            })]
        })
    }

    function iG(e) {
        let [t, r] = (0, O.useState)({}), n = (0, O.useRef)(t);
        return n.current = t, (0, O.useEffect)(() => {
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
                let e = await eF(a);
                if (!e?.data) return;
                let t = {};
                for (let r of e.data) r.state === eL.Completed && (t[r.targetId] = r.imageUrl);
                r(e => ({
                    ...e,
                    ...t
                }))
            })()
        }, [e]), t
    }

    function iz(e) {
        let {
            countLabel: t
        } = e;
        return (0, F.jsxs)(O.Fragment, {
            children: [(0, F.jsxs)("span", {
                className: "relative flex shrink-0 items-center justify-center",
                children: [(0, F.jsx)("span", {
                    className: "radius-circle absolute size-[11px] bg-[var(--color-extended-gray-100)]",
                    "data-testid": "info-mark-disc"
                }), (0, F.jsx)(z.Icon, {
                    className: "content-system-emphasis relative",
                    name: "icon-filled-circle-i",
                    size: "Medium"
                })]
            }), (0, F.jsx)("span", {
                className: "text-label-medium content-emphasis",
                children: t
            })]
        })
    }

    function iV(e) {
        let {
            referral: t,
            handle: r
        } = e, n = (0, ei.useTranslations)("Feature.RobloxSubscription"), a = iG((0, O.useMemo)(() => [{
            id: t.senderUserId
        }], [t.senderUserId]));
        return (0, F.jsxs)(O.Fragment, {
            children: [(0, F.jsx)(iN, {
                className: "bg-shift-200",
                displayName: r,
                size: "XSmall",
                thumbnailUrl: a[t.senderUserId]
            }), (0, F.jsx)("span", {
                className: "text-label-medium content-emphasis text-truncate-end",
                children: n.has("Label.ReferralPendingRequestSummary") ? n("Label.ReferralPendingRequestSummary", {
                    displayName: r
                }) : `${r} referred you`
            })]
        })
    }

    function iW(e) {
        let {
            pendingTransfers: t,
            totalRobux: r
        } = e, n = (0, ei.useTranslations)("Feature.BuyRobux"), a = 1 === t.length ? "Label.PendingTransfersSummary.Singular" : "Label.PendingTransfersSummary.Plural";
        return (0, F.jsxs)(O.Fragment, {
            children: [(0, F.jsx)(iT, {
                pendingTransfers: t
            }), (0, F.jsx)("span", {
                className: "text-label-medium content-emphasis",
                children: n(a, {
                    count: (0, t4.formatNumber)(t.length),
                    robux: (0, t4.formatNumber)(r)
                })
            })]
        })
    }

    function iK(e) {
        let {
            transfers: t,
            pendingReferrals: r,
            shouldDeeplinkToReferral: n
        } = e, a = (0, ei.useTranslations)("Feature.BuyRobux"), i = (0, ei.useTranslations)("Feature.RobloxSubscription"), {
            translateFullKey: s
        } = (0, ei.useFullKeyTranslations)(), {
            trackPendingTransfersImpression: l,
            trackPendingTransfersSheetView: o
        } = (0, O.useContext)(eD), {
            deviceMeta: c
        } = (0, O.useContext)(em), [u, d] = (0, O.useState)(!1), [m, p] = (0, O.useState)(!1), h = (0, O.useMemo)(() => t?.pendingTransfers ?? [], [t]), f = 0 === h.length ? r.at(0) : void 0, {
            handle: g,
            isLoading: x
        } = (0, iP.useReferrerHandle)(f ? String(f.senderUserId) : void 0);
        (0, O.useEffect)(() => {
            h.length > 0 && l()
        }, [h, l]), (0, O.useEffect)(() => {
            let e = r.at(0);
            void 0 !== e && iC.default.buyRobuxReferralImpression(String(e.senderUserId), e.referralId)
        }, [r]);
        let b = e => {
                e && h.length > 0 && o(), d(e)
            },
            y = (0, O.useMemo)(() => h.reduce((e, t) => e + Number(t.netTransferRobuxAmount), 0), [h]),
            v = h.length + r.length;
        if (0 === v || void 0 !== f && x) return null;
        let S = void 0 !== g ? f : void 0,
            E = h.length > 0 && 0 === r.length,
            C = (0, t4.formatNumber)(v),
            P = a(1 === v ? "Label.PendingRequestsSummary.Singular" : "Label.PendingRequestsSummary.Plural", {
                count: C
            }, 1 === v ? `${C} pending request` : `${C} pending requests`),
            w = () => {
                if (n && 0 === h.length) {
                    let e = r.at(0);
                    if (void 0 !== e) {
                        iC.default.buyRobuxReferralReviewClick(String(e.senderUserId), e.referralId), i_(iE({
                            surface: "PlusReferralLandingSheet",
                            entrypoint: "BuyRobuxPage",
                            referrerId: e.senderUserId
                        }), c);
                        return
                    }
                }
                if (void 0 !== S) {
                    iC.default.buyRobuxReferralReviewClick(String(S.senderUserId), S.referralId), p(!0);
                    return
                }
                let e = r.at(0);
                void 0 !== e && iC.default.buyRobuxReferralReviewClick(String(e.senderUserId), e.referralId), b(!0)
            };
        return (0, F.jsxs)(O.Fragment, {
            children: [(0, F.jsxs)("div", {
                className: `flex flex-row items-center justify-between gap-small width-full${E?" medium:justify-end":""}`,
                children: [(0, F.jsx)("div", {
                    className: "flex flex-row items-center gap-small min-width-0",
                    children: E ? (0, F.jsx)(iW, {
                        pendingTransfers: h,
                        totalRobux: y
                    }) : void 0 === S ? (0, F.jsx)(iz, {
                        countLabel: P
                    }) : (0, F.jsx)(iV, {
                        handle: g ?? "",
                        referral: S
                    })
                }), E && (0, F.jsx)("span", {
                    className: "content-default none medium:block",
                    children: "•"
                }), (0, F.jsx)("a", {
                    className: "text-title-medium text-link underline cursor-pointer shrink-0",
                    onClick: w,
                    onKeyDown: e => {
                        "Enter" === e.key && (e.preventDefault(), w())
                    },
                    role: "button",
                    tabIndex: 0,
                    children: E && t ? s(t.acceptTransfersTranslationKey) : i("Action.Review", void 0, "Review")
                })]
            }), E && t ? (0, F.jsx)(aB.SheetRoot, {
                open: u,
                onOpenChange: b,
                children: (0, F.jsx)(iF, {
                    pendingTransfers: h,
                    acceptTransfersTranslationKey: t.acceptTransfersTranslationKey
                })
            }) : void 0 === S ? (0, F.jsx)(aB.SheetRoot, {
                open: u,
                onOpenChange: b,
                children: (0, F.jsx)(iO, {
                    pendingTransfers: h,
                    acceptTransfersTranslationKey: t?.acceptTransfersTranslationKey,
                    pendingReferrals: r,
                    shouldDeeplinkToReferral: n
                })
            }) : (0, F.jsx)(iv.default, {
                invite: {
                    referrerId: String(S.senderUserId)
                },
                open: m,
                surface: iS.PlusReferralSurface.BuyRobuxPage,
                onOpenChange: p
            })]
        })
    }

    function iH(e) {
        let {
            iconSize: t,
            textClassName: r
        } = e, {
            robuxBalance: n
        } = (0, O.useContext)(em);
        return "number" != typeof n ? null : (0, F.jsxs)(O.Fragment, {
            children: [(0, F.jsx)(z.Icon, {
                name: "icon-filled-robux",
                size: t
            }), (0, F.jsx)("span", {
                className: (0, nN.default)("font-builder-extended content-action-standard", r),
                children: (0, t4.formatNumber)(n)
            })]
        })
    }
    var iQ = e.i(932598);
    let i$ = async (e, t) => e_(eM.GET, eI.USER_SEARCH, {
        url: `${eo.EnvironmentUrls.apiGatewayUrl}/search-api/omni-search`,
        withCredentials: !0
    }, {
        verticalType: "user",
        searchQuery: e,
        sessionId: t,
        globalSessionId: t
    }), iY = [];
    var iq = e.i(885065),
        iX = e.i(826550),
        iJ = e.i(227801);
    let iZ = {
            XSmall: "padding-x-small",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-medium"
        },
        i0 = {
            XSmall: "gap-x-xsmall",
            Small: "gap-x-small",
            Medium: "gap-x-small",
            Large: "gap-x-small"
        },
        i1 = {
            XSmall: "height-600",
            Small: "height-800",
            Medium: "height-1000",
            Large: "height-1200"
        },
        i2 = {
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
        i3 = {
            XSmall: ["text-body-small", "placeholder:text-body-small"],
            Small: ["text-body-small", "placeholder:text-body-small"],
            Medium: ["text-body-medium", "placeholder:text-body-medium"],
            Large: ["text-body-large", "placeholder:text-body-large"]
        },
        i5 = "Large",
        i6 = (0, O.forwardRef)((e, t) => {
            let {
                label: r,
                leadingIconName: n,
                trailingIconName: a,
                leadingIconNode: i,
                trailingIconNode: s,
                hasError: l,
                error: o,
                helperText: c,
                size: u = i5,
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
            } = e, E = (0, W.default)(), C = y || E, P = `${C}-description`, w = u ?? i5, N = l || !!o, k = o || c, T = n ?? (void 0 === i ? "icon-regular-magnifying-glass" : void 0), j = (0, O.useMemo)(() => T ? O.default.createElement(z.Icon, {
                name: T,
                size: w,
                className: "content-emphasis",
                "data-testid": "search-input-leading-icon"
            }) : i, [T, i, w]), A = (0, O.useMemo)(() => a ? O.default.createElement(z.Icon, {
                name: a,
                size: w,
                className: "content-emphasis",
                "data-testid": "search-input-trailing-icon"
            }) : s, [w, a, s]);
            return O.default.createElement("div", {
                "data-testid": "search-input-wrapper",
                className: (0, Q.default)("flex width-full flex-col gap-small", f, {
                    [iX.disabledOpacity]: h
                }),
                style: g
            }, r && O.default.createElement("label", {
                htmlFor: C,
                className: (0, Q.default)("text-title-small content-emphasis")
            }, r, p && O.default.createElement(O.default.Fragment, null, " ", O.default.createElement("span", {
                className: "content-default"
            }, "*"))), O.default.createElement("div", {
                "data-testid": "search-input-container",
                className: (0, Q.default)("foundation-web-input flex items-center width-full", !h && "relative clip group/interactable focus-visible:outline-focus disabled:outline-none", iJ.INPUT_STROKE_BY_VARIANT[d], iJ.INPUT_BACKGROUND_BY_VARIANT[d], x, i1[w], i2[m][w], iZ[w], i0[w], N ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis"),
                style: b
            }, O.default.createElement(iq.StateLayer, {
                className: "pointer-events-none"
            }), j && O.default.createElement("div", {
                className: "flex shrink-0 items-center"
            }, j), O.default.createElement("input", {
                type: "search",
                id: C,
                ref: t,
                placeholder: v,
                className: (0, Q.default)("width-full min-width-0 padding-none bg-none stroke-none outline-none content-emphasis placeholder:content-muted [appearance:none]", i3[w], "[&::-webkit-search-cancel-button]:hidden [&::-webkit-search-decoration]:hidden [&::-webkit-search-results-button]:hidden [&::-webkit-search-results-decoration]:hidden"),
                "aria-invalid": N,
                "aria-describedby": k ? P : void 0,
                required: p,
                disabled: h,
                ...S
            }), A && O.default.createElement("div", {
                className: "flex shrink-0 items-center",
                "data-testid": "search-input-trailing-accessory"
            }, A)), k && O.default.createElement("span", {
                id: P,
                className: (0, Q.default)("text-caption-small", {
                    "content-system-alert": N,
                    "content-default": !N
                })
            }, k))
        });

    function i4(e) {
        let {
            searchText: t,
            setSearchText: r,
            clearSearch: n
        } = e, a = (0, ei.useTranslations)("Feature.BuyRobux")("Label.Search");
        return (0, F.jsx)(i6, {
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
    i6.displayName = "SearchInput";
    var i8 = e.i(361261),
        i9 = e.i(177326),
        i7 = e.i(809510);

    function se(e) {
        let {
            friend: t,
            thumbnailUrl: r,
            onSelectUser: n,
            isFocused: a = !1
        } = e, i = (0, ei.useTranslations)("Feature.RobloxSubscription"), s = () => {
            n({
                id: t.id
            })
        }, l = (0, i9.useIsPlusBadgeEnabled)() && !0 === t.isRobloxPlus;
        return (0, F.jsxs)("div", {
            className: (0, nN.default)("flex flex-row items-center gap-small padding-small width-full cursor-pointer shrink-0", a ? "bg-surface-300" : "bg-none"),
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
            children: [(0, F.jsx)("div", {
                className: "height-800 width-800 radius-circle clip shrink-0 bg-surface-300 flex items-center justify-center",
                children: r ? (0, F.jsx)("img", {
                    src: r,
                    alt: t.combinedName ?? "",
                    className: "height-full width-full object-cover"
                }) : (0, F.jsx)(z.Icon, {
                    name: "icon-regular-person",
                    size: "Small"
                })
            }), (0, F.jsxs)("div", {
                className: "flex flex-row items-center gap-xsmall",
                children: [(0, F.jsx)("span", {
                    className: "text-body-medium content-emphasis",
                    children: t.combinedName
                }), t.hasVerifiedBadge && (0, F.jsx)(rL, {
                    size: 12
                }), l && (0, F.jsx)(i8.DisplayNameBadges, {
                    isRobloxPlus: !0,
                    size: "Small",
                    plusBadgeAriaLabel: i(i7.PLUS_BADGE_ARIA_LABEL_KEY, void 0, i7.PLUS_BADGE_ARIA_LABEL)
                })]
            })]
        })
    }
    var st = e.i(998315);

    function sr(e) {
        let {
            displayName: t,
            username: r,
            thumbnailUrl: n,
            badges: a,
            isFocused: i = !1,
            onSelect: s
        } = e, l = r ? `@${r}` : void 0;
        return (0, F.jsxs)("div", {
            className: (0, nN.default)("flex flex-row items-center gap-medium padding-x-none send-robux-user-row width-full cursor-pointer shrink-0 radius-medium", i ? "bg-surface-300" : "bg-none", !i && "hover:bg-shift-200"),
            onClick: s,
            onKeyDown: e => {
                ("Enter" === e.key || " " === e.key) && (e.preventDefault(), s())
            },
            role: "option",
            tabIndex: 0,
            "aria-selected": i,
            "aria-label": l ? `${t} ${l}` : t,
            children: [(0, F.jsx)(st.Avatar, {
                src: n,
                alt: t,
                size: "Large",
                className: "bg-shift-200"
            }), (0, F.jsxs)("div", {
                className: "flex flex-col min-width-0 width-full padding-y-xsmall",
                "data-testid": "user-row-text",
                children: [(0, F.jsxs)("span", {
                    className: "inline-flex items-center gap-xsmall content-emphasis min-width-0 width-full clip",
                    "data-testid": "user-row-name",
                    children: [(0, F.jsx)("span", {
                        className: "min-width-0 text-title-medium text-truncate-end text-no-wrap",
                        children: t
                    }), a]
                }), l && (0, F.jsx)("span", {
                    className: "text-body-medium content-default text-truncate-end text-no-wrap width-full",
                    children: l
                })]
            })]
        })
    }

    function sn(e) {
        let {
            friend: t,
            thumbnailUrl: r,
            onSelectUser: n
        } = e, a = (0, ei.useTranslations)("Feature.RobloxSubscription"), i = (0, i9.useIsPlusBadgeEnabled)() && !0 === t.isRobloxPlus, s = [t.hasVerifiedBadge ? (0, F.jsx)(rL, {
            size: 12
        }, "verified") : null, i ? (0, F.jsx)(i8.DisplayNameBadges, {
            isRobloxPlus: !0,
            size: "Small",
            plusBadgeAriaLabel: a(i7.PLUS_BADGE_ARIA_LABEL_KEY, void 0, i7.PLUS_BADGE_ARIA_LABEL)
        }, "roblox-plus") : null];
        return (0, F.jsx)(sr, {
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

    function sa(e) {
        let {
            friends: t,
            isLoading: r,
            error: n,
            ariaLabel: a,
            onSelectUser: i,
            showEmptyState: s = !0,
            rowVariant: l = "Dropdown",
            useInternalScroll: o = !0
        } = e, c = (0, ei.useTranslations)("Feature.BuyRobux"), u = iG(t), d = (0, nN.default)("flex flex-col", o && "overflow-y-auto hide-scrollbar friends-listbox-cap");
        return s && (n || !r && 0 === t.length) ? (0, F.jsx)("div", {
            className: "flex items-center justify-center padding-medium",
            children: (0, F.jsx)("span", {
                className: "text-body-medium content-muted",
                children: c("EmptyState.NoFriends")
            })
        }) : r || 0 !== t.length ? r ? (0, F.jsx)("div", {
            className: (0, nN.default)(d, "gap-small"),
            role: "listbox",
            "aria-label": a,
            children: (0, F.jsxs)("div", {
                className: "flex flex-row items-center gap-small padding-small",
                "aria-busy": "true",
                children: [(0, F.jsx)("div", {
                    className: (0, nN.default)("radius-circle shrink-0", "InlineFilter" === l ? "height-1200 width-1200 bg-shift-200" : "height-800 width-800 bg-surface-300")
                }), (0, F.jsx)("div", {
                    className: "height-xsmall width-full bg-surface-300 radius-medium"
                })]
            })
        }) : (0, F.jsx)("div", {
            className: d,
            role: "listbox",
            "aria-label": a,
            children: t.map(e => "InlineFilter" === l ? (0, F.jsx)(sn, {
                friend: e,
                thumbnailUrl: u[e.id],
                onSelectUser: i
            }, e.id) : (0, F.jsx)(se, {
                friend: e,
                thumbnailUrl: u[e.id],
                onSelectUser: i
            }, e.id))
        }) : null
    }
    var si = e.i(888104);
    e.i(350223);
    var ss = e.i(874296),
        sl = e.i(646424),
        so = e.i(587541);
    let sc = ss.object({
            profileDetails: ss.nullish(ss.array(ss.looseObject({
                userId: ss.number(),
                hasRobloxSubscription: ss.nullish(ss.boolean())
            })))
        }),
        su = async e => {
            let t = [...new Set(e)];
            if (0 === t.length) return {};
            let r = so.Url.parse(eo.default.apiGatewayUrl).getOrThrow().withPath("/user-profile-api/v1/user/profiles/get-profiles"),
                n = await sl.post(r, {
                    userIds: t,
                    fields: [i7.PLUS_PROFILE_FIELD]
                }, sc, {
                    credentials: "include",
                    headers: {
                        Accept: "application/json"
                    },
                    retry: sl.defaultBrowserRetryDelay
                }),
                a = {};
            for (let e of n.getOrThrow().profileDetails ?? []) a[e.userId] = !0 === e.hasRobloxSubscription;
            return a
        }, sd = new Map, sm = !1, sp = async () => {
            let e = sd;
            if (sd = new Map, sm = !1, 0 === e.size) return;
            let t = [...e.keys()];
            try {
                let r = await su(t);
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

    function sh(e) {
        var t;
        let r, n, a, i, s, {
                users: l,
                onSelectUser: o,
                hasSectionAbove: c = !1
            } = e,
            u = (0, ei.useTranslations)("Feature.RobloxSubscription"),
            d = (0, ei.useTranslations)("Feature.BuyRobux"),
            m = u(i7.PLUS_BADGE_ARIA_LABEL_KEY),
            p = iG(l),
            {
                data: h
            } = (t = (0, O.useMemo)(() => l.map(e => e.contentId), [l]), r = (0, i9.useIsPlusBadgeEnabled)(), n = (0, O.useMemo)(() => [...new Set(t)].sort((e, t) => e - t), [t]), a = (0, si.useQueries)({
                queries: n.map(e => ({
                    queryKey: ["identity-badges/plusStatus/byUser", e],
                    queryFn: () => new Promise((t, r) => {
                        let n = sd.get(e) ?? [];
                        n.push({
                            resolve: t,
                            reject: r
                        }), sd.set(e, n), sm || (sm = !0, queueMicrotask(() => {
                            sp().catch(() => void 0)
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
            f = (0, O.useCallback)(e => {
                eP("UserSearchUserSelected"), o(e)
            }, [o]);
        if (0 === l.length) return null;
        let g = d("Label.PeopleWithCount", {
            count: l.length
        });
        return (0, F.jsxs)("div", {
            className: (0, nN.default)("flex flex-col", c && "padding-top-large"),
            "data-testid": "people-search-results",
            children: [(0, F.jsx)("h2", {
                className: "text-title-large content-emphasis bg-surface-100 send-robux-section-heading",
                style: {
                    position: "sticky",
                    top: 0,
                    zIndex: 1
                },
                children: g
            }), (0, F.jsx)("div", {
                role: "listbox",
                "aria-label": g,
                children: l.map(e => {
                    let t = [e.hasVerifiedBadge ? (0, F.jsx)(rL, {
                        size: 12
                    }, "verified") : null, !0 === h[e.contentId] ? (0, F.jsx)(i8.DisplayNameBadges, {
                        isRobloxPlus: !0,
                        size: "Small",
                        plusBadgeAriaLabel: m
                    }, "roblox-plus") : null];
                    return (0, F.jsx)(sr, {
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
    let sf = e => e.trim().toLowerCase().replace(/\s+/g, "");

    function sg(e) {
        let {
            friends: t,
            isLoading: r,
            error: n,
            isLoggedIn: a,
            onSelectUser: i
        } = e, s = (0, ei.useTranslations)("Feature.BuyRobux"), l = (0, el.getCurrentUser)(), o = void 0 === l ? void 0 : (0, el.userIdToNumber)(l.id), {
            searchText: c,
            setSearchText: u,
            users: d,
            isSearching: m,
            clearSearch: p
        } = function() {
            let {
                maxResults: e = 3,
                excludedUserIds: t = iY,
                invalidateRequestOnClear: r = !1
            } = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}, [n, a] = (0, O.useState)(""), i = (0, nZ.useDebounce)(n, 500), [s, l] = (0, O.useState)([]), [o, c] = (0, O.useState)(!1), u = (0, O.useRef)(""), d = (0, O.useMemo)(() => (0, iQ.generateRandomUuid)(), []);
            (0, O.useEffect)(() => {
                n !== i && c(!0)
            }, [n, i]);
            let m = (0, O.useCallback)(() => {
                    r && (u.current = ""), a(""), l([])
                }, [r]),
                p = (0, O.useCallback)(async n => {
                    let a = n.trim();
                    if (a.length < 3) {
                        r && (u.current = ""), l([]), c(!1);
                        return
                    }
                    let i = (0, iQ.generateRandomUuid)();
                    u.current = i;
                    try {
                        c(!0), eP("UserSearchStarted");
                        let r = await i$(a, d);
                        if (u.current !== i) return;
                        let n = r?.searchResults[0]?.contents.filter(e => !t.includes(e.contentId)).slice(0, e) ?? [];
                        l(n), void 0 !== r && 0 === n.length && eP("UserSearchNoResults")
                    } finally {
                        u.current === i && c(!1)
                    }
                }, [t, r, e, d]);
            return (0, O.useEffect)(() => {
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
            excludedUserIds: (0, O.useMemo)(() => void 0 !== o && o > 0 ? [o] : [], [o]),
            invalidateRequestOnClear: !0
        }), h = sf(c), f = h.length > 0, g = (0, O.useMemo)(() => new Set(m ? [] : d.map(e => e.contentId)), [m, d]), x = (0, O.useMemo)(() => f ? t.filter(e => sf(e.combinedName ?? "").includes(h) || g.has(e.id)) : t, [t, f, h, g]), b = (0, O.useMemo)(() => new Set(t.map(e => e.id)), [t]), y = (0, O.useMemo)(() => d.filter(e => !b.has(e.contentId)), [b, d]), v = (0, O.useCallback)(e => {
            i({
                userId: e.contentId,
                context: "search"
            })
        }, [i]), S = {
            count: x.length
        }, E = a ? s("Label.MyFriendsWithCount", S) : "", C = a && (r || x.length > 0), P = h.length >= 3 && !m && !r && 0 === x.length && 0 === y.length;
        return (0, F.jsxs)(O.default.Fragment, {
            children: [(0, F.jsx)("div", {
                className: "send-robux-search-row shrink-0 bg-surface-100 padding-x-xlarge padding-top-xsmall padding-bottom-large",
                "data-testid": "send-robux-search-row",
                children: (0, F.jsx)(i4, {
                    searchText: c,
                    setSearchText: u,
                    clearSearch: p
                })
            }), (0, F.jsx)(aB.SheetBody, {
                className: "hide-scrollbar clip-x send-robux-sheet-body-inset",
                children: (0, F.jsxs)("div", {
                    className: "flex flex-col padding-bottom-large",
                    children: [C && (0, F.jsxs)("div", {
                        className: "flex flex-col",
                        "data-testid": "send-robux-friends-section",
                        children: [(0, F.jsx)("h2", {
                            className: "text-title-large content-emphasis bg-surface-100 send-robux-section-heading",
                            style: {
                                position: "sticky",
                                top: 0,
                                zIndex: 1
                            },
                            children: E
                        }), (0, F.jsx)(sa, {
                            friends: x,
                            isLoading: r,
                            error: n,
                            ariaLabel: E,
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
                    }), !m && f && (0, F.jsx)(sh, {
                        users: y,
                        onSelectUser: v,
                        hasSectionAbove: C
                    }), P && (0, F.jsx)("div", {
                        className: "flex items-center justify-center padding-medium",
                        role: "status",
                        "aria-live": "polite",
                        children: (0, F.jsx)("span", {
                            className: "text-body-medium content-muted",
                            children: s("Label.NoResultsFound")
                        })
                    })]
                })
            })]
        })
    }
    var sx = e.i(10224);
    let sb = async e => {
        let t = {
                url: `${eo.default.friendsApi}/v1/users/${e}/friends/online`,
                retryable: !0,
                withCredentials: !0
            },
            {
                data: r
            } = await sx.get(t);
        return r
    }, sy = async (e, t) => {
        let r = `${eo.default.friendsApi}/v1/users/${e}/friends/find`,
            n = {
                url: t ? `${r}?userSort=1` : r,
                retryable: !0,
                withCredentials: !0
            },
            {
                data: a
            } = await sx.get(n);
        return a
    }, sv = async e => {
        let t = {
                url: `${eo.default.apiGatewayUrl}/user-profile-api/v1/user/profiles/get-profiles`,
                retryable: !0,
                withCredentials: !0
            },
            {
                data: r
            } = await sx.post(t, {
                userIds: e,
                fields: ["names.combinedName", "isVerified", "hasRobloxSubscription"]
            });
        return r
    }, sS = async (e, t) => {
        if (!t) return [];
        try {
            let {
                data: t
            } = await sb(e);
            return t
        } catch (e) {
            return console.error("Error fetching online friends:", e), []
        }
    }, sE = async (e, t) => {
        try {
            let {
                PageItems: r
            } = await sy(e, t);
            return r
        } catch (e) {
            return console.error("Error fetching friends:", e), []
        }
    }, sC = async (e, t) => {
        let [r, n] = await Promise.all([sS(e, t), sE(e, t)]);
        r.sort((e, t) => t.sortScore - e.sortScore);
        let a = new Map;
        for (let e of r) a.set(e.id, e.userPresence);
        let i = r.map(e => e.id),
            s = n.filter(e => !i.includes(e.id)).map(e => e.id),
            l = [...i, ...s];
        if (0 === l.length) return [];
        let o = new Map((await sv(l)).profileDetails.map(e => [e.userId, e])),
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

    function sP() {
        let {
            robuxBalance: e
        } = (0, O.useContext)(em);
        return null == e ? null : (0, F.jsxs)("div", {
            className: "flex flex-row items-center gap-xsmall",
            children: [(0, F.jsx)(z.Icon, {
                name: "icon-regular-robux",
                size: "Small"
            }), (0, F.jsx)("span", {
                className: "text-label-medium content-emphasis",
                children: (0, t4.formatNumber)(e)
            })]
        })
    }

    function sw() {
        let e = (0, ei.useTranslations)("Feature.BuyRobux"),
            {
                trackTransferSendUserSelected: t
            } = (0, O.useContext)(eD),
            {
                deviceMeta: r
            } = (0, O.useContext)(em),
            {
                friends: n,
                isLoading: a,
                error: i,
                isLoggedIn: s
            } = function() {
                let [e, t] = (0, O.useState)([]), [r, n] = (0, O.useState)(!0), [a, i] = (0, O.useState)(null), s = (0, el.getCurrentUser)()?.id, l = void 0 !== s;
                return (0, O.useEffect)(() => {
                    if (void 0 === s) return void n(!1);
                    let e = {
                        cancelled: !1
                    };
                    return (async () => {
                        eP("GetMyFriends_API", {
                            status: "Throughput"
                        });
                        try {
                            let r = await sC((0, el.userIdToNumber)(s), !0);
                            eP("GetMyFriends_API", {
                                status: "200"
                            }), e.cancelled || t(r)
                        } catch (r) {
                            let t = r instanceof Error ? r : Error(String(r));
                            ((0, ny.captureException)(t), "object" == typeof r && null !== r && ("response" in r || "status" in r)) ? eP("GetMyFriends_API", {
                                status: (r.response?.status ?? r.status)?.toString() ?? "UnknownError"
                            }): eP("GetMyFriends_API", {
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
            l = (0, O.useCallback)(e => {
                let {
                    userId: n,
                    context: a
                } = e;
                t(a), eP("SendTransferDeepLink"), i_(iU({
                    direction: "send",
                    userid: String(n),
                    transferorigination: "buyRobux"
                }), r)
            }, [r, t]);
        return (0, F.jsxs)(aB.SheetContent, {
            centerSheetSize: "Medium",
            closeLabel: "Close",
            largeScreenVariant: "center",
            mobilePortraitClassName: "![height:92vh] ![max-height:92vh] ![padding-bottom:env(safe-area-inset-bottom)]",
            children: [(0, F.jsx)(aB.SheetTitle, {
                className: "relative bg-surface-100 shrink-0 [z-index:6] ![padding-top:11px]",
                utilities: (0, F.jsx)(sP, {}),
                children: (0, F.jsxs)("div", {
                    className: "flex flex-row items-center gap-xsmall",
                    children: [(0, F.jsx)(z.Icon, {
                        name: "icon-regular-roblox-plus",
                        size: "Large"
                    }), e("Heading.SendRobux")]
                })
            }), (0, F.jsx)(sg, {
                friends: n,
                isLoading: a,
                error: i,
                isLoggedIn: s,
                onSelectUser: l
            })]
        })
    }

    function sN(e) {
        let {
            translationKey: t,
            className: r,
            size: n = "Medium"
        } = e, {
            translateFullKey: a
        } = (0, ei.useFullKeyTranslations)(), [i, s] = (0, O.useState)(!1), {
            trackTransferSendImpression: l,
            trackTransferSendSheetView: o
        } = (0, O.useContext)(eD), c = !!(0, el.getCurrentUser)()?.id, u = (0, O.useCallback)(e => {
            e && o(), s(e)
        }, [o]);
        (0, O.useEffect)(() => {
            l()
        }, [l]);
        let d = (0, O.useCallback)(e => {
                eN("SendRobuxButtonReactCrash", null, e)
            }, []),
            m = (0, O.useCallback)(() => {
                if (!c) {
                    if (void 0 === et.window) return;
                    let e = `${et.window.location.pathname}${et.window.location.search}`;
                    et.window.location.href = `/login?ReturnUrl=${encodeURIComponent(e)}`;
                    return
                }
                u(!0)
            }, [c, u]);
        return (0, F.jsxs)(tK, {
            onError: d,
            children: [(0, F.jsx)(V.Button, {
                className: r,
                icon: "icon-regular-arrow-up-from-line",
                size: n,
                variant: "Standard",
                onClick: m,
                children: a(t)
            }), (0, F.jsx)(aB.SheetRoot, {
                open: i,
                onOpenChange: u,
                children: (0, F.jsx)(sw, {})
            })]
        })
    }
    let sk = "sticky medium:static top-[env(safe-area-inset-top)] medium:top-[auto] margin-top-[env(safe-area-inset-top)] [z-index:10] flex flex-col self-stretch medium:self-end medium:margin-top-[16px] medium:margin-right-[16px]",
        sT = "flex flex-col gap-large bg-surface-100 padding-y-medium padding-x-large small:padding-x-xlarge self-stretch";

    function sj(e) {
        let {
            transfersSection: t,
            robuxGiftSection: r
        } = e, {
            robuxGifting: {
                openModal: n
            }
        } = (0, O.useContext)(tf), {
            trackRobuxGiftClick: a
        } = (0, O.useContext)(eD), {
            deviceMeta: i
        } = (0, O.useContext)(em), s = eO(i), {
            translateFullKey: l
        } = (0, ei.useFullKeyTranslations)(), {
            pendingReferrals: o
        } = (() => {
            let e = (0, ih.isReferralEnabled)() && null !== (0, ig.userId)() && !(0, ig.isBlackbirdUser)(),
                {
                    data: t,
                    isLoading: r
                } = (0, ip.useQuery)({
                    queryKey: ["plus-referrals", "pending"],
                    enabled: e,
                    queryFn: async () => {
                        let {
                            referrals: e
                        } = await ib("PendingPlusReferrals", () => ix.subscriptionsV2Api.subscriptionsV2ListSubscriptionReferrals({
                            status: nJ.SubscriptionReferralStatus.NUMBER_1,
                            pageSize: 5
                        }));
                        return e
                    }
                }),
                n = t ?? iy;
            return {
                pendingReferrals: n,
                latestPendingReferral: n.at(0),
                isLoading: e && r
            }
        })(), c = (0, ip.useQuery)({
            queryKey: ["guac/app-policy"],
            queryFn: ni,
            staleTime: 1 / 0,
            enabled: s
        }), u = s && c.data?.ShouldDeeplinkToReferral === !0, d = s && !u ? [] : o, m = t?.transfers, p = r?.robuxGift, h = !!m?.pendingTransfers?.length || d.length > 0, f = h ? (0, F.jsx)("div", {
            className: "flex padding-y-medium padding-x-medium medium:padding-x-large self-stretch radius-medium justify-center bg-shift-100 stroke-standard stroke-default",
            children: (0, F.jsx)(iK, {
                transfers: m,
                pendingReferrals: d,
                shouldDeeplinkToReferral: u
            })
        }) : null;
        return m ? (0, F.jsx)("div", {
            ...e0(t),
            className: sk,
            children: (0, F.jsxs)("div", {
                className: (0, nN.default)(sT, {
                    "medium:radius-medium": h,
                    "medium:radius-circle": !h
                }),
                children: [(0, F.jsxs)("div", {
                    className: (0, nN.default)("flex flex-row items-center gap-large medium:padding-left-none justify-between medium:justify-end", {
                        "padding-left-[58px]": s
                    }),
                    children: [(0, F.jsx)("div", {
                        className: "flex flex-row justify-center items-center gap-xsmall medium:padding-left-none",
                        children: (0, F.jsx)(iH, {
                            iconSize: "Large",
                            textClassName: "text-title-large [font-size:var(--font-size-500)] medium:[font-size:var(--font-size-600)]"
                        })
                    }), (0, F.jsxs)("div", {
                        className: "flex flex-row gap-small",
                        children: [(0, F.jsx)(sN, {
                            translationKey: m.sendButtonTextTranslationKey,
                            className: "text-label-medium content-action-standard shrink-0 [padding-right:12px]",
                            size: "Small"
                        }), p && (0, F.jsx)(V.Button, {
                            ...e0(r),
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
        }) : f ? (0, F.jsx)("div", {
            className: sk,
            children: (0, F.jsx)("div", {
                className: (0, nN.default)(sT, "medium:radius-medium"),
                children: f
            })
        }) : null
    }

    function sA(e) {
        let {
            isPrimary: t,
            sectionBase: r,
            redirectOptions: n
        } = e, {
            translateFullKey: a
        } = (0, ei.useFullKeyTranslations)(), {
            purchaseProduct: i
        } = (0, O.useContext)(rJ), {
            atLeastOneProductHasBonusAmount: s,
            redirect: l
        } = (0, O.useContext)(em), o = nH(n.promotionExpirationTimestampMs), c = (0, O.useMemo)(() => nU(l?.url ?? ""), [l?.url]);
        return (0, F.jsxs)(nk, {
            ...e0(r),
            children: [(0, F.jsxs)("div", {
                className: "flex flex-col gap-xsmall self-stretch",
                children: [(0, F.jsxs)("div", {
                    className: "flex flex-row justify-between items-center self-stretch",
                    children: [(0, F.jsx)(nT, {
                        children: a(s ? r.sectionHeaderTranslationKey : n.titleTranslationKey)
                    }), (0, F.jsxs)("div", {
                        className: "flex flex-row items-center gap-small",
                        children: [o.success && (0, F.jsx)(nK, {
                            daysLeft: o.value
                        }), r.showPersonalizedRecommendationsMenu && (0, F.jsx)(nD, {
                            surfaceKey: "Web_BuyRobux_Packages"
                        })]
                    })]
                }), n.bodyTranslationKey && (0, F.jsx)(nj, {
                    children: a(n.bodyTranslationKey)
                })]
            }), (0, F.jsx)(nA, {
                isPrimary: t,
                children: (0, F.jsx)(to, {
                    scope: "redirect",
                    children: (0, F.jsx)(n_, {
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
                })
            })]
        })
    }
    let sR = {
            "1:1": "aspect-1-1",
            "5:4": "aspect-5-4",
            "4:5": "aspect-4-5",
            "4:3": "aspect-4-3",
            "16:9": "aspect-16-9",
            "2:1": "aspect-2-1"
        },
        sM = (0, O.forwardRef)((e, t) => {
            let {
                className: r,
                aspectRatio: n = "1:1",
                alt: a,
                containerClassName: i,
                ...s
            } = e;
            return O.default.createElement("div", {
                className: (0, Q.default)("foundation-web-media clip", sR[n], i)
            }, O.default.createElement("img", {
                ref: t,
                className: (0, Q.default)("foundation-web-media-image", r),
                alt: a,
                ...s
            }))
        });

    function sI(e) {
        let {
            product: t,
            redirectUrl: r,
            cardKey: n,
            onPurchaseClick: a
        } = e, i = void 0 !== r, s = !!r, {
            rowProps: l,
            linkProps: o
        } = ty(te(t.productId, `limitedTimeBonus:${n}`), {
            isRedirect: i,
            hasUrl: s
        }), c = i ? {
            as: "a",
            href: tr(`${r}&ap=${t.productId}`, s),
            rel: "noreferrer",
            role: "button",
            target: "_blank"
        } : {};
        return (0, F.jsxs)("div", {
            className: "self-stretch flex flex-row justify-between items-center gap-small",
            ...{
                [eq]: t.productId
            },
            ...l,
            children: [(0, F.jsx)("div", {
                className: "min-width-0 flex-1",
                children: (0, F.jsx)(nM, {
                    amount: t.robuxAmount,
                    nonPromotionalAmount: t.nonPromotionalPlatformRobuxAmount,
                    bonusRobuxAmount: t.bonusRobuxAmount,
                    bonusRobuxTagIcon: t.bonusRobuxTagIcon,
                    bonusRobuxTagTranslationKey: t.bonusRobuxTagTranslationKey,
                    inlineBadgeIcon: t.inlineBadgeIcon,
                    inlineBadgeTranslationKey: t.inlineBadgeTranslationKey
                })
            }), (0, F.jsx)(V.Button, {
                variant: t.isCallToAction ? "Emphasis" : "Standard",
                size: "Small",
                className: (0, nN.default)("min-width-[90px] small:min-width-[120px] medium:min-width-[200px] text-label-medium shrink-0", "small:height-1000 small:padding-x-medium small:text-label-medium small:[&_.icon]:size-[var(--icon-size-medium)] small:[&>span]:gap-small"),
                onClick: e => {
                    a(t, e)
                },
                ...c,
                ...o,
                icon: r ? "icon-regular-arrow-up-right-from-square" : void 0,
                children: (0, F.jsx)(rd.PriceTag, {
                    tagClassName: "robux-price-tag",
                    currencyCode: t.price.amount.currencyCode,
                    amount: Number(rf(t.price.amount))
                })
            })]
        })
    }

    function s_(e) {
        let {
            item: t,
            products: r,
            totalCards: n,
            redirectUrl: a,
            showPersonalizedRecommendationsMenu: i,
            onPurchaseClick: s
        } = e, {
            translateFullKey: l
        } = (0, ei.useFullKeyTranslations)(), o = t.displayableBonus.collectibleItemMetadata, c = o ? l(o.translationKey, void 0, "Bonus Item") : t.displayableBonus.gamePassMetadata?.gamePassDisplayName ?? "";
        return (0, F.jsxs)("div", {
            className: "self-stretch radius-large flex flex-col",
            style: {
                overflow: "hidden"
            },
            children: [(0, F.jsxs)("div", {
                className: `relative bg-shift-200 ${n>1?"min-height-[120px]":"min-height-[186px] medium:min-height-[204px]"}`,
                children: [o?.backgroundImage2dUrl && (0, F.jsx)(sM, {
                    aspectRatio: "16:9",
                    src: o.backgroundImage2dUrl,
                    alt: "",
                    containerClassName: "absolute inset-0 width-full height-full",
                    className: "width-full height-full object-cover"
                }), (0, F.jsx)("div", {
                    className: "absolute inset-0 bg-[rgba(0,0,0,0.4)]"
                }), (0, F.jsxs)("div", {
                    className: (0, nN.default)("relative z-10 padding-xlarge flex height-full", 1 === n ? "flex-col items-center justify-end" : "flex-row items-center", {
                        "gap-medium": 1 === n,
                        "gap-xlarge": 1 !== n
                    }),
                    children: [o?.image2dUrl && (0, F.jsx)("img", {
                        src: o.image2dUrl,
                        alt: c,
                        className: (0, nN.default)("radius-medium object-contain shrink-0", {
                            "height-[150px] width-auto max-width-full": 1 === n,
                            "height-[75px] width-auto max-width-full": 1 !== n
                        })
                    }), (0, F.jsxs)("div", {
                        className: `flex flex-col gap-xsmall medium:gap-small ${1===n?"self-start":""}`,
                        children: [(0, F.jsx)("span", {
                            className: "text-title-large medium:text-heading-medium content-emphasis",
                            children: c
                        }), o?.creatorDisplayName && (0, F.jsxs)("span", {
                            className: "text-body-medium content-emphasis flex items-center gap-xsmall",
                            children: [o.creatorDisplayName, o.creatorIsVerified && (0, F.jsx)(rL, {
                                size: 16
                            })]
                        })]
                    })]
                }), i && (0, F.jsx)("div", {
                    className: "absolute z-20",
                    style: {
                        top: "16px",
                        insetInlineEnd: "16px"
                    },
                    children: (0, F.jsx)(nD, {
                        surfaceKey: "Web_BuyRobux_BonusItem"
                    })
                })]
            }), (0, F.jsx)("div", {
                className: "self-stretch flex flex-col gap-xlarge padding-medium medium:padding-xlarge bg-shift-400",
                "data-testid": "ltb-robux-packages",
                children: r.map(e => (0, F.jsx)(sI, {
                    product: e,
                    redirectUrl: a,
                    cardKey: t.robuxProductIds.join("-"),
                    onPurchaseClick: s
                }, e.productId))
            })]
        })
    }

    function sU(e) {
        let {
            isPrimary: t,
            sectionBase: r,
            limitedTimeBonus: n
        } = e, {
            purchaseProduct: a
        } = (0, O.useContext)(rJ), {
            redirect: i
        } = (0, O.useContext)(em), {
            translateFullKey: s
        } = (0, ei.useFullKeyTranslations)(), l = (0, O.useMemo)(() => {
            let e = r.products ?? [];
            return n.limitedTimeBonuses.reduce((t, r) => {
                let {
                    collectibleItemMetadata: n,
                    gamePassMetadata: a
                } = r.displayableBonus;
                if (!n && !a) return eP("BonusItemMissingMetadata", {
                    productType: "LimitedTimeBonus"
                }), t;
                let i = e.filter(e => r.robuxProductIds.some(t => t === e.productId));
                return i.length > 0 && t.push({
                    item: r,
                    products: i
                }), t
            }, [])
        }, [n.limitedTimeBonuses, r.products]), o = tt(n.isRedirect, i), c = (0, O.useCallback)((e, t) => {
            a({
                product: e,
                event: t,
                isRedirect: o,
                isSubscription: !1,
                isBonus: !0,
                sectionType: "LimitedTimeBonus"
            })
        }, [a, o]);
        if (0 === l.length) return null;
        let u = nH(n.expirationTimestampMs);
        return (0, F.jsxs)(nk, {
            ...e0(r),
            children: [(0, F.jsxs)("div", {
                className: "self-stretch flex flex-row items-center justify-between gap-medium",
                "data-testid": "ltb-section-header-row",
                children: [(0, F.jsx)(nT, {
                    className: "self-auto min-width-0 flex-1 medium:self-stretch medium:flex-none",
                    children: s(r.sectionHeaderTranslationKey, void 0, "Limited-time avatar items")
                }), u.success && (0, F.jsx)(nK, {
                    daysLeft: u.value
                })]
            }), n.bodyTranslationKey && (0, F.jsx)(nj, {
                children: s(n.bodyTranslationKey)
            }), (0, F.jsx)("div", {
                className: "self-stretch flex flex-col gap-xlarge medium:gap-xxlarge",
                children: l.map(e => {
                    let {
                        item: t,
                        products: n
                    } = e;
                    return (0, F.jsx)(s_, {
                        item: t,
                        products: n,
                        totalCards: l.length,
                        redirectUrl: o ? i?.url : void 0,
                        showPersonalizedRecommendationsMenu: r.showPersonalizedRecommendationsMenu,
                        onPurchaseClick: c
                    }, t.robuxProductIds.join("-"))
                })
            })]
        })
    }

    function sL() {
        let {
            buyRobuxPageData: e,
            deviceMeta: t
        } = (0, O.useContext)(em), r = eO(t), n = (0, O.useMemo)(() => e.sections.find(e => e.transfers), [e.sections]), a = n?.transfers, i = (0, O.useMemo)(() => e.sections.find(e => e.robuxGift), [e.sections]), s = (0, O.useCallback)(e => {
            eN("SectionReactCrash", null, e)
        }, []), l = (0, O.useCallback)((e, t) => {
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
            if (h) r = (0, F.jsx)(sA, {
                ...n,
                redirectOptions: h
            });
            else if (c) r = (0, F.jsx)(nQ, {
                ...n
            });
            else if (u) r = (0, F.jsx)(n$, {
                ...n,
                recommended: u
            });
            else if (o) r = (0, F.jsx)(nW, {
                ...n,
                personalizedBonus: o
            });
            else if (d) r = (0, F.jsx)(nX, {
                ...n,
                robuxGift: d
            });
            else if (p) p.products.forEach(e => {
                e.benefits?.forEach(t => {
                    t.plusDiscountSubscriptionBenefits && (t.plusDiscountSubscriptionBenefits.periodType = e.periodType)
                })
            }), r = (0, F.jsx)(il, {
                ...n,
                subscriptionV2: p
            });
            else if (i) r = (0, F.jsx)(nq, {
                ...n,
                giftCard: i
            });
            else {
                if (!l) return console.error(`Unknown section type: ${m}`), e;
                r = (0, F.jsx)(sU, {
                    ...n,
                    limitedTimeBonus: l
                })
            }
            return [...e, (0, F.jsx)(tK, {
                onError: s,
                children: r
            }, m)]
        }, [s, a]), o = (0, O.useMemo)(() => e.sections.reduce(l, []), [e.sections, l]);
        return (0, F.jsxs)("div", {
            className: "flex flex-col items-center",
            children: [(0, F.jsx)("div", {
                className: "buy-robux-background"
            }), (0, F.jsx)(sj, {
                transfersSection: n,
                robuxGiftSection: i
            }), (0, F.jsxs)("div", {
                className: (0, nN.default)("buy-robux-content padding-x-large small:padding-x-xlarge", {
                    "is-in-app": r
                }),
                children: [(0, F.jsx)(ic, {
                    transfers: a
                }), o, (0, F.jsx)(im, {})]
            })]
        })
    }
    sM.displayName = "Media";
    let sF = async () => e_(eM.GET, eI.GET_CLIENT_ASSERTION_V2, {
        url: `${eo.EnvironmentUrls.authApi}/v1/client-assertion/`,
        withCredentials: !0
    }), sD = async e => e_(eM.POST, eI.GET_AUTH_TICKET_V2, {
        url: `${eo.EnvironmentUrls.authApi}/v1/authentication-ticket/`,
        withCredentials: !0
    }, {
        clientAssertion: e
    }, (e, t) => t["rbx-authentication-ticket"]), sB = async () => {
        let e = await sF();
        return sD(e?.clientAssertion)
    }, sO = async () => await sB() ?? "", sG = `paymentSession-${(0,el.getCurrentUser)()?.id??"loggedout"}`, sz = e => {
        let t, {
            enhancedBuyRobuxPageData: r,
            urlParams: n,
            deviceMeta: a
        } = e;
        ! function() {
            let {
                urlParams: e
            } = (0, O.useContext)(em), [t, r] = (0, O.useMemo)(() => [e.ctx, e.product_id], [e]);
            (0, O.useEffect)(() => {
                t ? (0, es.setItem)(ep, t) : (0, es.removeItem)(ep)
            }, [t]), (0, O.useEffect)(() => {
                r ? (0, es.setItem)(eh, r) : (0, es.removeItem)(eh)
            }, [r])
        }();
        let i = ea(),
            s = (0, O.useRef)(!1),
            l = r.buyRobuxPageData.legalDisclosureTermsUrlPath;
        (0, O.useEffect)(() => {
            a.isIosApp && l && !s.current && (s.current = !0, eP("IosPurchaseRestartAlertShown"), G.paymentFlowAnalyticsService.sendUserPurchaseFlowEventViaFetch({
                triggerContext: eQ(a),
                isMidPurchaseStep: !0,
                viewName: G.paymentFlowAnalyticsService.ENUM_VIEW_NAME.IOS_PURCHASE_RESTART_ALERT,
                purchaseEventType: G.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN
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
            paymentSession: E,
            purchaseFlowId: C
        } = r.buyRobuxPageData;
        (0, O.useEffect)(() => {
            E && (0, es.setItem)(sG, E)
        }, [E]);
        let P = (t = E?.id, (0, O.useCallback)((e, r) => {
                let {
                    productId: n,
                    providerProductId: i
                } = e;
                return a.isAndroidApp && i ? `${nw}?${nC.UrlSearchParams.new({id:i.toLowerCase(),...void 0!==t?{paymentSessionId:t}:{},recurring:r&&!i.endsWith("onemonth")}).toString()}` : (a.isAmazonApp || a.isUWPApp) && i ? `${nw}?${nC.UrlSearchParams.new({id:i.toLowerCase()}).toString()}` : a.isIosApp && i ? `${nw}?${nC.UrlSearchParams.new({id:i,...void 0!==t?{paymentSessionId:t}:{}}).toString()}` : `/upgrades/paymentmethods?${nC.UrlSearchParams.new({ap:n,page:"RobuxRedesign",...void 0!==t?{paymentSessionId:t}:{}}).toString()}`
            }, [a, t])),
            w = function() {
                let e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0],
                    [t, r] = (0, O.useState)(void 0);
                return (0, O.useEffect)(() => {
                    let e = (0, el.getCurrentUser)()?.id;
                    void 0 === e ? r(0) : (async e => {
                        let t = await eU(e);
                        t ? r(t.robux) : r(null)
                    })(e)
                }, [e]), t
            }(),
            {
                shouldShowFirstTimePurchaseConsent: N,
                markConsentAcknowledged: k
            } = function(e, t) {
                let [r, n] = (0, O.useState)();
                return (0, O.useEffect)(() => {
                    let r = !1;
                    return e && "true" !== (0, es.getItem)(eu(e)) ? ((async () => {
                        let a = await ec(e, t);
                        r || n(!!a?.shouldShowFirstTimePurchaseConsent)
                    })(), () => {
                        r = !0
                    }) : void n(!1)
                }, [e, t]), {
                    shouldShowFirstTimePurchaseConsent: r,
                    markConsentAcknowledged: (0, O.useCallback)(() => {
                        e && (0, es.setItem)(eu(e), "true")
                    }, [e])
                }
            }((0, el.getCurrentUser)()?.id, rK),
            T = function(e) {
                let {
                    deviceMeta: t,
                    paymentSession: r,
                    isEnabled: n
                } = e, [a, i] = (0, O.useState)(), [s, l] = (0, O.useState)(no), [o, c] = (0, O.useState)(!1), u = r?.id, d = (0, O.useCallback)(() => {
                    eP("MobileRedirectUrlGenerationStarted"), sO().then(i).catch(e => {
                        ew("MobileRedirectUrlGenerationFailed", null, e)
                    })
                }, []);
                (0, O.useEffect)(() => {
                    n && u && (d(), nu.getExperimentBasedPathname(t).then(e => {
                        let {
                            pathname: t,
                            isInExperiment: r
                        } = e;
                        l(t), c(r)
                    }).catch(e => {
                        ew("LoginRedirectExperimentFetchFailed", null, e)
                    }))
                }, [t, d, n, u]);
                let m = (0, O.useMemo)(() => {
                    if (!a || !u) return "";
                    let e = (0, el.getCurrentUser)();
                    return (e => {
                        let {
                            authTicket: t,
                            paymentSessionId: r,
                            returnUrl: n,
                            loginRedirectPathname: a,
                            isInExperiment: i,
                            userId: s
                        } = e, l = nC.UrlSearchParams.new({
                            analyticId: G.paymentFlowAnalyticsService.purchaseFlowUuid,
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
                        userId: void 0 === e ? 0 : (0, el.userIdToNumber)(e.id)
                    })
                }, [a, u, s, o]);
                if (n && u) return {
                    url: m,
                    isInExperiment: o,
                    refreshAuthTicket: d
                }
            }({
                deviceMeta: a,
                paymentSession: E,
                isEnabled: (a.isIosApp || a.isAndroidApp) && S.sections.some(e => e.redirect ?? e.personalizedBonus?.isRedirect ?? e.limitedTimeBonus?.isRedirect ?? e.subscriptionV2?.products.some(e => e.isRedirect))
            }),
            {
                bonusItemBannerImageUrl: j,
                bonusItemImageUrl: A,
                giftingAvatarImageUrl: R
            } = function(e) {
                let {
                    bonusItemId: t,
                    giftingUrl: r,
                    bonusItemRootPlaceId: n
                } = e, [a, i] = (0, O.useState)(""), [s, l] = (0, O.useState)(""), [o, c] = (0, O.useState)(""), u = (0, O.useCallback)(async e => {
                    let {
                        bonusItemId: t,
                        giftingUrl: r,
                        bonusItemRootPlaceId: n
                    } = e, a = [], s = (0, el.getCurrentUser)()?.id;
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
                    let o = await eF(a);
                    o?.data.forEach(e => {
                        e.state === eL.Completed && (e.targetId.toString() === t && l(e.imageUrl), e.targetId.toString() === s && c(e.imageUrl), e.targetId.toString() === n && i(e.imageUrl))
                    })
                }, []);
                return (0, O.useEffect)(() => {
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
            M = (0, O.useMemo)(() => ({
                deviceMeta: a,
                limitedTimeBonusItem: o,
                bonusItemBannerImageUrl: j,
                bonusItemDisplayName: c,
                bonusItemId: u,
                bonusItemImageUrl: A,
                buyRobuxPageData: S,
                getPurchaseUrl: P,
                giftingAvatarImageUrl: R,
                giftingUrl: m,
                isSubscriber: p,
                paymentSession: E,
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
            }), [o, u, j, c, A, S, P, R, m, p, E, h, C, w, f, g, x, n, T, b, N, k, y, v, a]);
        return (0, F.jsxs)(em.Provider, {
            value: M,
            children: [(0, F.jsx)("div", {
                id: "generic-challenge-container",
                "data-testid": "generic-challenge-container"
            }), (0, F.jsx)(tM, {
                children: (0, F.jsx)(nP, {
                    children: (0, F.jsx)(sL, {})
                })
            })]
        })
    }, sV = (0, ac.createFireTelemetryHistogram)("BuyRobuxRedesign", {}), sW = !1, sK = (e, t) => {
        if (null == e || !Number.isFinite(e)) return;
        let r = Math.round(t - e);
        return r >= 0 ? r : void 0
    }, sH = new D.QueryClient({
        defaultOptions: {
            queries: {
                retry: !1,
                refetchOnMount: !1,
                refetchOnWindowFocus: !1,
                refetchOnReconnect: !1
            }
        }
    }), sQ = e => {
        let {
            children: t
        } = e, r = (0, ei.useTranslations)("CommonUI.Controls");
        return (0, F.jsx)(en, {
            closeLabel: r("Action.Close"),
            children: t
        })
    };
    e.s(["RobuxRedesign", 0, e => {
        G.paymentFlowAnalyticsService.setWebStack("nextjs"), (0, O.useEffect)(() => {
            eT(), rV(), ej()
        }), (0, O.useEffect)(() => {
            (e => {
                if (sW || null == et.window) return;
                sW = !0;
                let t = et.window.performance.now(),
                    [r] = et.window.performance.getEntriesByType("navigation"),
                    n = null != r && "requestStart" in r && "number" == typeof r.requestStart ? r.requestStart : void 0,
                    a = et.window.performance.getEntriesByType("paint"),
                    i = a.find(e => "first-contentful-paint" === e.name) ?? a.find(e => "first-paint" === e.name),
                    s = sK(n, t),
                    l = sK(i?.startTime, t);
                null != s && sV("HydrationSinceRequest", void 0, s), null != l && sV("HydrationSincePaint", void 0, l), (null != s || null != l) && G.paymentFlowAnalyticsService.sendUserPurchaseFlowEventViaFetch({
                    triggerContext: eQ(e),
                    isMidPurchaseStep: !0,
                    viewName: G.paymentFlowAnalyticsService.ENUM_VIEW_NAME.BUY_ROBUX_HYDRATION,
                    purchaseEventType: G.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN,
                    eventMetadata: {
                        ...null != s ? {
                            sinceRequestMs: String(s)
                        } : {},
                        ...null != l ? {
                            sincePaintMs: String(l)
                        } : {}
                    }
                })
            })(e.deviceMeta)
        }, [e.deviceMeta]);
        let {
            purchaseFlowId: t
        } = e.enhancedBuyRobuxPageData.buyRobuxPageData;
        return t && G.paymentFlowAnalyticsService.setPaymentFlowUuid(t), (0, F.jsx)(eR, {
            name: "BuyRobuxPageReactCrash",
            children: (0, F.jsx)(B.QueryClientProvider, {
                client: sH,
                children: (0, F.jsx)(sQ, {
                    children: (0, F.jsx)(sz, {
                        ...e
                    })
                })
            })
        })
    }, "queryClient", 0, sH], 518623)
}]);

//# debugId=1c6bcc7f-3232-23b7-47e2-a9d03101c6a2
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0v5fgf5cataaq.js.map
! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "b6287495c64504c2ac59b864c339e4b56107f081"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "ea18e0a9-d1d9-4f39-b110-46efc63a3eec", e._sentryDebugIdIdentifier = "sentry-dbid-ea18e0a9-d1d9-4f39-b110-46efc63a3eec")
    } catch (e) {}
}(),
function() {
    var e = {
            179: function(e, t, r) {
                var n, a;
                n = this, a = function(e, t) {
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
                                o(e, t, n[t])
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

                    function o(e, t, r) {
                        return t in e ? Object.defineProperty(e, t, {
                            value: r,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = r, e
                    }

                    function i(e, t) {
                        if (null == e) return {};
                        var r, n, a = function(e, t) {
                            if (null == e) return {};
                            var r, n, a = {},
                                o = Object.keys(e);
                            for (n = 0; n < o.length; n++) r = o[n], t.indexOf(r) >= 0 || (a[r] = e[r]);
                            return a
                        }(e, t);
                        if (Object.getOwnPropertySymbols) {
                            var o = Object.getOwnPropertySymbols(e);
                            for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (a[r] = e[r])
                        }
                        return a
                    }

                    function u(e, t) {
                        return function(e) {
                            if (Array.isArray(e)) return e
                        }(e) || function(e, t) {
                            var r, n, a = e && ("u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"]);
                            if (null != a) {
                                var o = [],
                                    i = !0,
                                    u = !1;
                                try {
                                    for (a = a.call(e); !(i = (r = a.next()).done) && (o.push(r.value), !t || o.length !== t); i = !0);
                                } catch (e) {
                                    u = !0, n = e
                                } finally {
                                    try {
                                        i || null == a.return || a.return()
                                    } finally {
                                        if (u) throw n
                                    }
                                }
                                return o
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
                    var s, c, f, d, p, h = {
                        exports: {}
                    };
                    h.exports = (function() {
                        if (p) return d;
                        p = 1;
                        var e = f ? c : (f = 1, c = "SECRET_DO_NOT_PASS_THIS_OR_YOU_WILL_BE_FIRED");

                        function t() {}

                        function r() {}
                        return r.resetWarningCache = t, d = function() {
                            function n(t, r, n, a, o, i) {
                                if (i !== e) {
                                    var u = Error("Calling PropTypes validators directly is not supported by the `prop-types` package. Use PropTypes.checkPropTypes() to call them. Read more at http://fb.me/use-check-prop-types");
                                    throw u.name = "Invariant Violation", u
                                }
                            }

                            function a() {
                                return n
                            }
                            n.isRequired = n;
                            var o = {
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
                            return o.PropTypes = o, o
                        }
                    })()();
                    var y = (s = h.exports) && s.__esModule && Object.prototype.hasOwnProperty.call(s, "default") ? s.default : s,
                        v = function(e, r, n) {
                            var a = !!n,
                                o = t.useRef(n);
                            t.useEffect(function() {
                                o.current = n
                            }, [n]), t.useEffect(function() {
                                if (!a || !e) return function() {};
                                var t = function() {
                                    o.current && o.current.apply(o, arguments)
                                };
                                return e.on(r, t),
                                    function() {
                                        e.off(r, t)
                                    }
                            }, [a, r, e, o])
                        },
                        m = function(e) {
                            var r = t.useRef(e);
                            return t.useEffect(function() {
                                r.current = e
                            }, [e]), r.current
                        },
                        b = function(e) {
                            return null !== e && "object" === a(e)
                        },
                        g = "[object Object]",
                        w = function e(t, r) {
                            if (!b(t) || !b(r)) return t === r;
                            var n = Array.isArray(t);
                            if (n !== Array.isArray(r)) return !1;
                            var a = Object.prototype.toString.call(t) === g;
                            if (a !== (Object.prototype.toString.call(r) === g)) return !1;
                            if (!a && !n) return t === r;
                            var o = Object.keys(t),
                                i = Object.keys(r);
                            if (o.length !== i.length) return !1;
                            for (var u = {}, l = 0; l < o.length; l += 1) u[o[l]] = !0;
                            for (var s = 0; s < i.length; s += 1) u[i[s]] = !0;
                            var c = Object.keys(u);
                            return c.length === o.length && c.every(function(n) {
                                return e(t[n], r[n])
                            })
                        },
                        S = function(e, t, r) {
                            return b(e) ? Object.keys(e).reduce(function(a, i) {
                                var u = !b(t) || !w(e[i], t[i]);
                                return r.includes(i) ? (u && console.warn("Unsupported prop change: options.".concat(i, " is not a mutable property.")), a) : u ? n(n({}, a || {}), {}, o({}, i, e[i])) : a
                            }, null) : null
                        },
                        x = "Invalid prop `stripe` supplied to `Elements`. We recommend using the `loadStripe` utility from `@stripe/stripe-js`. See https://stripe.com/docs/stripe-js/react#elements-props-stripe for details.",
                        C = function(e) {
                            var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : x;
                            if (null === e || b(e) && "function" == typeof e.elements && "function" == typeof e.createToken && "function" == typeof e.createPaymentMethod && "function" == typeof e.confirmCardPayment) return e;
                            throw Error(t)
                        },
                        E = function(e) {
                            var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : x;
                            if (b(e) && "function" == typeof e.then) return {
                                tag: "async",
                                stripePromise: Promise.resolve(e).then(function(e) {
                                    return C(e, t)
                                })
                            };
                            var r = C(e, t);
                            return null === r ? {
                                tag: "empty"
                            } : {
                                tag: "sync",
                                stripe: r
                            }
                        },
                        A = function(e) {
                            e && e._registerWrapper && e.registerAppInfo && (e._registerWrapper({
                                name: "react-stripe-js",
                                version: "3.10.0"
                            }), e.registerAppInfo({
                                name: "react-stripe-js",
                                version: "3.10.0",
                                url: "https://stripe.com/docs/stripe-js/react"
                            }))
                        },
                        k = t.createContext(null);
                    k.displayName = "ElementsContext";
                    var j = function(e, t) {
                            if (!e) throw Error("Could not find Elements context; You need to wrap the part of your app that ".concat(t, " in an <Elements> provider."));
                            return e
                        },
                        P = function(e) {
                            var r = e.stripe,
                                n = e.options,
                                a = e.children,
                                o = t.useMemo(function() {
                                    return E(r)
                                }, [r]),
                                i = u(t.useState(function() {
                                    return {
                                        stripe: "sync" === o.tag ? o.stripe : null,
                                        elements: "sync" === o.tag ? o.stripe.elements(n) : null
                                    }
                                }), 2),
                                l = i[0],
                                s = i[1];
                            t.useEffect(function() {
                                var e = !0,
                                    t = function(e) {
                                        s(function(t) {
                                            return t.stripe ? t : {
                                                stripe: e,
                                                elements: e.elements(n)
                                            }
                                        })
                                    };
                                return "async" !== o.tag || l.stripe ? "sync" !== o.tag || l.stripe || t(o.stripe) : o.stripePromise.then(function(r) {
                                        r && e && t(r)
                                    }),
                                    function() {
                                        e = !1
                                    }
                            }, [o, l, n]);
                            var c = m(r);
                            t.useEffect(function() {
                                null !== c && c !== r && console.warn("Unsupported prop change on Elements: You cannot change the `stripe` prop after setting it.")
                            }, [c, r]);
                            var f = m(n);
                            return t.useEffect(function() {
                                if (l.elements) {
                                    var e = S(n, f, ["clientSecret", "fonts"]);
                                    e && l.elements.update(e)
                                }
                            }, [n, f, l.elements]), t.useEffect(function() {
                                A(l.stripe)
                            }, [l.stripe]), t.createElement(k.Provider, {
                                value: l
                            }, a)
                        };
                    P.propTypes = {
                        stripe: y.any,
                        options: y.object
                    };
                    var T = function(e) {
                            return j(t.useContext(k), e)
                        },
                        N = function(e) {
                            return (0, e.children)(T("mounts <ElementsConsumer>"))
                        };
                    N.propTypes = {
                        children: y.func.isRequired
                    };
                    var O = ["on", "session"],
                        I = t.createContext(null);
                    I.displayName = "CheckoutSdkContext";
                    var U = function(e, t) {
                            if (!e) throw Error("Could not find CheckoutProvider context; You need to wrap the part of your app that ".concat(t, " in an <CheckoutProvider> provider."));
                            return e
                        },
                        M = t.createContext(null);
                    M.displayName = "CheckoutContext";
                    var _ = function(e, t) {
                            if (!e) return null;
                            e.on, e.session;
                            var r = i(e, O);
                            return t ? Object.assign(t, r) : Object.assign(e.session(), r)
                        },
                        D = function(e) {
                            var r = e.stripe,
                                n = e.options,
                                a = e.children,
                                o = t.useMemo(function() {
                                    return E(r, "Invalid prop `stripe` supplied to `CheckoutProvider`. We recommend using the `loadStripe` utility from `@stripe/stripe-js`. See https://stripe.com/docs/stripe-js/react#elements-props-stripe for details.")
                                }, [r]),
                                i = u(t.useState(null), 2),
                                l = i[0],
                                s = i[1],
                                c = u(t.useState(function() {
                                    return {
                                        stripe: "sync" === o.tag ? o.stripe : null,
                                        checkoutSdk: null
                                    }
                                }), 2),
                                f = c[0],
                                d = c[1],
                                p = function(e, t) {
                                    d(function(r) {
                                        return r.stripe && r.checkoutSdk ? r : {
                                            stripe: e,
                                            checkoutSdk: t
                                        }
                                    })
                                },
                                h = t.useRef(!1);
                            t.useEffect(function() {
                                var e = !0;
                                return "async" !== o.tag || f.stripe ? "sync" === o.tag && o.stripe && !h.current && (h.current = !0, o.stripe.initCheckout(n).then(function(e) {
                                        e && (p(o.stripe, e), e.on("change", s))
                                    })) : o.stripePromise.then(function(t) {
                                        t && e && !h.current && (h.current = !0, t.initCheckout(n).then(function(e) {
                                            e && (p(t, e), e.on("change", s))
                                        }))
                                    }),
                                    function() {
                                        e = !1
                                    }
                            }, [o, f, n, s]);
                            var y = m(r);
                            t.useEffect(function() {
                                null !== y && y !== r && console.warn("Unsupported prop change on CheckoutProvider: You cannot change the `stripe` prop after setting it.")
                            }, [y, r]);
                            var v = m(n),
                                b = m(f.checkoutSdk);
                            t.useEffect(function() {
                                if (f.checkoutSdk) {
                                    var e, t, r, a, o = !!(!b && f.checkoutSdk),
                                        i = null == v || null == (e = v.elementsOptions) ? void 0 : e.appearance,
                                        u = null == n || null == (t = n.elementsOptions) ? void 0 : t.appearance,
                                        l = !w(u, i);
                                    u && (l || o) && f.checkoutSdk.changeAppearance(u);
                                    var s = null == v || null == (r = v.elementsOptions) ? void 0 : r.fonts,
                                        c = null == n || null == (a = n.elementsOptions) ? void 0 : a.fonts,
                                        d = !w(s, c);
                                    c && (d || o) && f.checkoutSdk.loadFonts(c)
                                }
                            }, [n, v, f.checkoutSdk, b]), t.useEffect(function() {
                                A(f.stripe)
                            }, [f.stripe]);
                            var g = t.useMemo(function() {
                                return _(f.checkoutSdk, l)
                            }, [f.checkoutSdk, l]);
                            return f.checkoutSdk ? t.createElement(I.Provider, {
                                value: f
                            }, t.createElement(M.Provider, {
                                value: g
                            }, a)) : null
                        };
                    D.propTypes = {
                        stripe: y.any,
                        options: y.shape({
                            fetchClientSecret: y.func.isRequired,
                            elementsOptions: y.object
                        }).isRequired
                    };
                    var R = function(e) {
                            var r = t.useContext(I),
                                n = t.useContext(k);
                            if (r && n) throw Error("You cannot wrap the part of your app that ".concat(e, " in both <CheckoutProvider> and <Elements> providers."));
                            return r ? U(r, e) : j(n, e)
                        },
                        B = ["mode"],
                        F = function(e, r) {
                            var n = "".concat(e.charAt(0).toUpperCase() + e.slice(1), "Element"),
                                a = r ? function(e) {
                                    R("mounts <".concat(n, ">"));
                                    var r = e.id,
                                        a = e.className;
                                    return t.createElement("div", {
                                        id: r,
                                        className: a
                                    })
                                } : function(r) {
                                    var a, o = r.id,
                                        l = r.className,
                                        s = r.options,
                                        c = void 0 === s ? {} : s,
                                        f = r.onBlur,
                                        d = r.onFocus,
                                        p = r.onReady,
                                        h = r.onChange,
                                        y = r.onEscape,
                                        b = r.onClick,
                                        g = r.onLoadError,
                                        w = r.onLoaderStart,
                                        x = r.onNetworksChange,
                                        C = r.onConfirm,
                                        E = r.onCancel,
                                        A = r.onShippingAddressChange,
                                        k = r.onShippingRateChange,
                                        j = r.onSavedPaymentMethodRemove,
                                        P = r.onSavedPaymentMethodUpdate,
                                        T = R("mounts <".concat(n, ">")),
                                        N = "elements" in T ? T.elements : null,
                                        O = "checkoutSdk" in T ? T.checkoutSdk : null,
                                        I = u(t.useState(null), 2),
                                        U = I[0],
                                        M = I[1],
                                        _ = t.useRef(null),
                                        D = t.useRef(null);
                                    v(U, "blur", f), v(U, "focus", d), v(U, "escape", y), v(U, "click", b), v(U, "loaderror", g), v(U, "loaderstart", w), v(U, "networkschange", x), v(U, "confirm", C), v(U, "cancel", E), v(U, "shippingaddresschange", A), v(U, "shippingratechange", k), v(U, "savedpaymentmethodremove", j), v(U, "savedpaymentmethodupdate", P), v(U, "change", h), p && (a = "expressCheckout" === e ? p : function() {
                                        p(U)
                                    }), v(U, "ready", a), t.useLayoutEffect(function() {
                                        if (null === _.current && null !== D.current && (N || O)) {
                                            var t = null;
                                            if (O) switch (e) {
                                                case "payment":
                                                    t = O.createPaymentElement(c);
                                                    break;
                                                case "address":
                                                    if ("mode" in c) {
                                                        var r = c.mode,
                                                            a = i(c, B);
                                                        if ("shipping" === r) t = O.createShippingAddressElement(a);
                                                        else if ("billing" === r) t = O.createBillingAddressElement(a);
                                                        else throw Error("Invalid options.mode. mode must be 'billing' or 'shipping'.")
                                                    } else throw Error("You must supply options.mode. mode must be 'billing' or 'shipping'.");
                                                    break;
                                                case "expressCheckout":
                                                    t = O.createExpressCheckoutElement(c);
                                                    break;
                                                case "currencySelector":
                                                    t = O.createCurrencySelectorElement();
                                                    break;
                                                case "taxId":
                                                    t = O.createTaxIdElement(c);
                                                    break;
                                                default:
                                                    throw Error("Invalid Element type ".concat(n, ". You must use either the <PaymentElement />, <AddressElement options={{mode: 'shipping'}} />, <AddressElement options={{mode: 'billing'}} />, or <ExpressCheckoutElement />."))
                                            } else N && (t = N.create(e, c));
                                            _.current = t, M(t), t && t.mount(D.current)
                                        }
                                    }, [N, O, c]);
                                    var F = m(c);
                                    return t.useEffect(function() {
                                        if (_.current) {
                                            var e = S(c, F, ["paymentRequest"]);
                                            e && "update" in _.current && _.current.update(e)
                                        }
                                    }, [c, F]), t.useLayoutEffect(function() {
                                        return function() {
                                            if (_.current && "function" == typeof _.current.destroy) try {
                                                _.current.destroy(), _.current = null
                                            } catch (e) {}
                                        }
                                    }, []), t.createElement("div", {
                                        id: o,
                                        className: l,
                                        ref: D
                                    })
                                };
                            return a.propTypes = {
                                id: y.string,
                                className: y.string,
                                onChange: y.func,
                                onBlur: y.func,
                                onFocus: y.func,
                                onReady: y.func,
                                onEscape: y.func,
                                onClick: y.func,
                                onLoadError: y.func,
                                onLoaderStart: y.func,
                                onNetworksChange: y.func,
                                onConfirm: y.func,
                                onCancel: y.func,
                                onShippingAddressChange: y.func,
                                onShippingRateChange: y.func,
                                onSavedPaymentMethodRemove: y.func,
                                onSavedPaymentMethodUpdate: y.func,
                                options: y.object
                            }, a.displayName = n, a.__elementType = e, a
                        },
                        L = "u" < typeof window,
                        G = t.createContext(null);
                    G.displayName = "EmbeddedCheckoutProviderContext";
                    var H = function() {
                            var e = t.useContext(G);
                            if (!e) throw Error("<EmbeddedCheckout> must be used within <EmbeddedCheckoutProvider>");
                            return e
                        },
                        W = L ? function(e) {
                            var r = e.id,
                                n = e.className;
                            return H(), t.createElement("div", {
                                id: r,
                                className: n
                            })
                        } : function(e) {
                            var r = e.id,
                                n = e.className,
                                a = H().embeddedCheckout,
                                o = t.useRef(!1),
                                i = t.useRef(null);
                            return t.useLayoutEffect(function() {
                                return !o.current && a && null !== i.current && (a.mount(i.current), o.current = !0),
                                    function() {
                                        if (o.current && a) try {
                                            a.unmount(), o.current = !1
                                        } catch (e) {}
                                    }
                            }, [a]), t.createElement("div", {
                                ref: i,
                                id: r,
                                className: n
                            })
                        },
                        Y = F("auBankAccount", L),
                        V = F("card", L),
                        z = F("cardNumber", L),
                        q = F("cardExpiry", L),
                        X = F("cardCvc", L),
                        $ = F("fpxBank", L),
                        Q = F("iban", L),
                        K = F("idealBank", L),
                        J = F("p24Bank", L),
                        Z = F("epsBank", L),
                        ee = F("payment", L),
                        et = F("expressCheckout", L),
                        er = F("currencySelector", L),
                        en = F("paymentRequestButton", L),
                        ea = F("linkAuthentication", L),
                        eo = F("address", L),
                        ei = F("shippingAddress", L),
                        eu = F("paymentMethodMessaging", L),
                        el = F("affirmMessage", L),
                        es = F("afterpayClearpayMessage", L),
                        ec = F("taxId", L);
                    e.AddressElement = eo, e.AffirmMessageElement = el, e.AfterpayClearpayMessageElement = es, e.AuBankAccountElement = Y, e.CardCvcElement = X, e.CardElement = V, e.CardExpiryElement = q, e.CardNumberElement = z, e.CheckoutProvider = D, e.CurrencySelectorElement = er, e.Elements = P, e.ElementsConsumer = N, e.EmbeddedCheckout = W, e.EmbeddedCheckoutProvider = function(e) {
                        var r = e.stripe,
                            n = e.options,
                            a = e.children,
                            o = t.useMemo(function() {
                                return E(r, "Invalid prop `stripe` supplied to `EmbeddedCheckoutProvider`. We recommend using the `loadStripe` utility from `@stripe/stripe-js`. See https://stripe.com/docs/stripe-js/react#elements-props-stripe for details.")
                            }, [r]),
                            i = t.useRef(null),
                            l = t.useRef(null),
                            s = u(t.useState({
                                embeddedCheckout: null
                            }), 2),
                            c = s[0],
                            f = s[1];
                        t.useEffect(function() {
                            if (!l.current && !i.current) {
                                var e = function(e) {
                                    l.current || i.current || (l.current = e, i.current = l.current.initEmbeddedCheckout(n).then(function(e) {
                                        f({
                                            embeddedCheckout: e
                                        })
                                    }))
                                };
                                "async" === o.tag && !l.current && (n.clientSecret || n.fetchClientSecret) ? o.stripePromise.then(function(t) {
                                    t && e(t)
                                }) : "sync" === o.tag && !l.current && (n.clientSecret || n.fetchClientSecret) && e(o.stripe)
                            }
                        }, [o, n, c, l]), t.useEffect(function() {
                            return function() {
                                c.embeddedCheckout ? (i.current = null, c.embeddedCheckout.destroy()) : i.current && i.current.then(function() {
                                    i.current = null, c.embeddedCheckout && c.embeddedCheckout.destroy()
                                })
                            }
                        }, [c.embeddedCheckout]), t.useEffect(function() {
                            A(l)
                        }, [l]);
                        var d = m(r);
                        t.useEffect(function() {
                            null !== d && d !== r && console.warn("Unsupported prop change on EmbeddedCheckoutProvider: You cannot change the `stripe` prop after setting it.")
                        }, [d, r]);
                        var p = m(n);
                        return t.useEffect(function() {
                            if (null != p) {
                                if (null == n) return void console.warn("Unsupported prop change on EmbeddedCheckoutProvider: You cannot unset options after setting them.");
                                void 0 === n.clientSecret && void 0 === n.fetchClientSecret && console.warn("Invalid props passed to EmbeddedCheckoutProvider: You must provide one of either `options.fetchClientSecret` or `options.clientSecret`."), null != p.clientSecret && n.clientSecret !== p.clientSecret && console.warn("Unsupported prop change on EmbeddedCheckoutProvider: You cannot change the client secret after setting it. Unmount and create a new instance of EmbeddedCheckoutProvider instead."), null != p.fetchClientSecret && n.fetchClientSecret !== p.fetchClientSecret && console.warn("Unsupported prop change on EmbeddedCheckoutProvider: You cannot change fetchClientSecret after setting it. Unmount and create a new instance of EmbeddedCheckoutProvider instead."), null != p.onComplete && n.onComplete !== p.onComplete && console.warn("Unsupported prop change on EmbeddedCheckoutProvider: You cannot change the onComplete option after setting it."), null != p.onShippingDetailsChange && n.onShippingDetailsChange !== p.onShippingDetailsChange && console.warn("Unsupported prop change on EmbeddedCheckoutProvider: You cannot change the onShippingDetailsChange option after setting it."), null != p.onLineItemsChange && n.onLineItemsChange !== p.onLineItemsChange && console.warn("Unsupported prop change on EmbeddedCheckoutProvider: You cannot change the onLineItemsChange option after setting it.")
                            }
                        }, [p, n]), t.createElement(G.Provider, {
                            value: c
                        }, a)
                    }, e.EpsBankElement = Z, e.ExpressCheckoutElement = et, e.FpxBankElement = $, e.IbanElement = Q, e.IdealBankElement = K, e.LinkAuthenticationElement = ea, e.P24BankElement = J, e.PaymentElement = ee, e.PaymentMethodMessagingElement = eu, e.PaymentRequestButtonElement = en, e.ShippingAddressElement = ei, e.TaxIdElement = ec, e.useCheckout = function() {
                        U(t.useContext(I), "calls useCheckout()");
                        var e = t.useContext(M);
                        if (!e) throw Error("Could not find Checkout Context; You need to wrap the part of your app that calls useCheckout() in an <CheckoutProvider> provider.");
                        return e
                    }, e.useElements = function() {
                        return T("calls useElements()").elements
                    }, e.useStripe = function() {
                        return R("calls useStripe()").stripe
                    }
                }, "object" == (t && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t) ? a(t, r(609)) : "function" == typeof define && define.amd ? define(["exports", "react"], a) : a((n = "u" > typeof globalThis ? globalThis : n || self).ReactStripe = {}, n.React)
            },
            742: function(e, t) {
                "use strict";
                t.byteLength = function(e) {
                    var t = l(e),
                        r = t[0],
                        n = t[1];
                    return (r + n) * 3 / 4 - n
                }, t.toByteArray = function(e) {
                    var t, r, o = l(e),
                        i = o[0],
                        u = o[1],
                        s = new a((i + u) * 3 / 4 - u),
                        c = 0,
                        f = u > 0 ? i - 4 : i;
                    for (r = 0; r < f; r += 4) t = n[e.charCodeAt(r)] << 18 | n[e.charCodeAt(r + 1)] << 12 | n[e.charCodeAt(r + 2)] << 6 | n[e.charCodeAt(r + 3)], s[c++] = t >> 16 & 255, s[c++] = t >> 8 & 255, s[c++] = 255 & t;
                    return 2 === u && (t = n[e.charCodeAt(r)] << 2 | n[e.charCodeAt(r + 1)] >> 4, s[c++] = 255 & t), 1 === u && (t = n[e.charCodeAt(r)] << 10 | n[e.charCodeAt(r + 1)] << 4 | n[e.charCodeAt(r + 2)] >> 2, s[c++] = t >> 8 & 255, s[c++] = 255 & t), s
                }, t.fromByteArray = function(e) {
                    for (var t, n = e.length, a = n % 3, o = [], i = 0, u = n - a; i < u; i += 16383) o.push(function(e, t, n) {
                        for (var a, o = [], i = t; i < n; i += 3) a = (e[i] << 16 & 0xff0000) + (e[i + 1] << 8 & 65280) + (255 & e[i + 2]), o.push(r[a >> 18 & 63] + r[a >> 12 & 63] + r[a >> 6 & 63] + r[63 & a]);
                        return o.join("")
                    }(e, i, i + 16383 > u ? u : i + 16383));
                    return 1 === a ? o.push(r[(t = e[n - 1]) >> 2] + r[t << 4 & 63] + "==") : 2 === a && o.push(r[(t = (e[n - 2] << 8) + e[n - 1]) >> 10] + r[t >> 4 & 63] + r[t << 2 & 63] + "="), o.join("")
                };
                for (var r = [], n = [], a = "u" > typeof Uint8Array ? Uint8Array : Array, o = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", i = 0, u = o.length; i < u; ++i) r[i] = o[i], n[o.charCodeAt(i)] = i;

                function l(e) {
                    var t = e.length;
                    if (t % 4 > 0) throw Error("Invalid string. Length must be a multiple of 4");
                    var r = e.indexOf("="); - 1 === r && (r = t);
                    var n = r === t ? 0 : 4 - r % 4;
                    return [r, n]
                }
                n[45] = 62, n[95] = 63
            },
            564: function(e, t, r) {
                "use strict";

                function n(e) {
                    return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
                }
                var a = r(742),
                    o = r(619),
                    i = "function" == typeof Symbol && "function" == typeof Symbol.for ? Symbol.for("nodejs.util.inspect.custom") : null;

                function u(e) {
                    if (e > 0x7fffffff) throw RangeError('The value "' + e + '" is invalid for option "size"');
                    var t = new Uint8Array(e);
                    return Object.setPrototypeOf(t, l.prototype), t
                }

                function l(e, t, r) {
                    if ("number" == typeof e) {
                        if ("string" == typeof t) throw TypeError('The "string" argument must be of type string. Received type number');
                        return f(e)
                    }
                    return s(e, t, r)
                }

                function s(e, t, r) {
                    if ("string" == typeof e) {
                        var a = e,
                            o = t;
                        if (("string" != typeof o || "" === o) && (o = "utf8"), !l.isEncoding(o)) throw TypeError("Unknown encoding: " + o);
                        var i = 0 | y(a, o),
                            s = u(i),
                            c = s.write(a, o);
                        return c !== i && (s = s.slice(0, c)), s
                    }
                    if (ArrayBuffer.isView(e)) {
                        var f = e;
                        if (N(f, Uint8Array)) {
                            var v = new Uint8Array(f);
                            return p(v.buffer, v.byteOffset, v.byteLength)
                        }
                        return d(f)
                    }
                    if (null == e) throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + (void 0 === e ? "undefined" : n(e)));
                    if (N(e, ArrayBuffer) || e && N(e.buffer, ArrayBuffer) || "u" > typeof SharedArrayBuffer && (N(e, SharedArrayBuffer) || e && N(e.buffer, SharedArrayBuffer))) return p(e, t, r);
                    if ("number" == typeof e) throw TypeError('The "value" argument must not be of type number. Received type number');
                    var m = e.valueOf && e.valueOf();
                    if (null != m && m !== e) return l.from(m, t, r);
                    var b = function(e) {
                        if (l.isBuffer(e)) {
                            var t = 0 | h(e.length),
                                r = u(t);
                            return 0 === r.length || e.copy(r, 0, 0, t), r
                        }
                        return void 0 !== e.length ? "number" != typeof e.length || function(e) {
                            return e != e
                        }(e.length) ? u(0) : d(e) : "Buffer" === e.type && Array.isArray(e.data) ? d(e.data) : void 0
                    }(e);
                    if (b) return b;
                    if ("u" > typeof Symbol && null != Symbol.toPrimitive && "function" == typeof e[Symbol.toPrimitive]) return l.from(e[Symbol.toPrimitive]("string"), t, r);
                    throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + (void 0 === e ? "undefined" : n(e)))
                }

                function c(e) {
                    if ("number" != typeof e) throw TypeError('"size" argument must be of type number');
                    if (e < 0) throw RangeError('The value "' + e + '" is invalid for option "size"')
                }

                function f(e) {
                    return c(e), u(e < 0 ? 0 : 0 | h(e))
                }

                function d(e) {
                    for (var t = e.length < 0 ? 0 : 0 | h(e.length), r = u(t), n = 0; n < t; n += 1) r[n] = 255 & e[n];
                    return r
                }

                function p(e, t, r) {
                    var n;
                    if (t < 0 || e.byteLength < t) throw RangeError('"offset" is outside of buffer bounds');
                    if (e.byteLength < t + (r || 0)) throw RangeError('"length" is outside of buffer bounds');
                    return Object.setPrototypeOf(n = void 0 === t && void 0 === r ? new Uint8Array(e) : void 0 === r ? new Uint8Array(e, t) : new Uint8Array(e, t, r), l.prototype), n
                }

                function h(e) {
                    if (e >= 0x7fffffff) throw RangeError("Attempt to allocate Buffer larger than maximum size: 0x7fffffff bytes");
                    return 0 | e
                }

                function y(e, t) {
                    if (l.isBuffer(e)) return e.length;
                    if (ArrayBuffer.isView(e) || N(e, ArrayBuffer)) return e.byteLength;
                    if ("string" != typeof e) throw TypeError('The "string" argument must be one of type string, Buffer, or ArrayBuffer. Received type ' + (void 0 === e ? "undefined" : n(e)));
                    var r = e.length,
                        a = arguments.length > 2 && !0 === arguments[2];
                    if (!a && 0 === r) return 0;
                    for (var o = !1;;) switch (t) {
                        case "ascii":
                        case "latin1":
                        case "binary":
                            return r;
                        case "utf8":
                        case "utf-8":
                            return j(e).length;
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return 2 * r;
                        case "hex":
                            return r >>> 1;
                        case "base64":
                            return P(e).length;
                        default:
                            if (o) return a ? -1 : j(e).length;
                            t = ("" + t).toLowerCase(), o = !0
                    }
                }

                function v(e, t, r) {
                    var n, o, i, u = !1;
                    if ((void 0 === t || t < 0) && (t = 0), t > this.length || ((void 0 === r || r > this.length) && (r = this.length), r <= 0 || (r >>>= 0) <= (t >>>= 0))) return "";
                    for (e || (e = "utf8");;) switch (e) {
                        case "hex":
                            return function(e, t, r) {
                                var n = e.length;
                                (!t || t < 0) && (t = 0), (!r || r < 0 || r > n) && (r = n);
                                for (var a = "", o = t; o < r; ++o) a += O[e[o]];
                                return a
                            }(this, t, r);
                        case "utf8":
                        case "utf-8":
                            return w(this, t, r);
                        case "ascii":
                            return function(e, t, r) {
                                var n = "";
                                r = Math.min(e.length, r);
                                for (var a = t; a < r; ++a) n += String.fromCharCode(127 & e[a]);
                                return n
                            }(this, t, r);
                        case "latin1":
                        case "binary":
                            return function(e, t, r) {
                                var n = "";
                                r = Math.min(e.length, r);
                                for (var a = t; a < r; ++a) n += String.fromCharCode(e[a]);
                                return n
                            }(this, t, r);
                        case "base64":
                            return n = this, o = t, i = r, 0 === o && i === n.length ? a.fromByteArray(n) : a.fromByteArray(n.slice(o, i));
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return function(e, t, r) {
                                for (var n = e.slice(t, r), a = "", o = 0; o < n.length - 1; o += 2) a += String.fromCharCode(n[o] + 256 * n[o + 1]);
                                return a
                            }(this, t, r);
                        default:
                            if (u) throw TypeError("Unknown encoding: " + e);
                            e = (e + "").toLowerCase(), u = !0
                    }
                }

                function m(e, t, r) {
                    var n = e[t];
                    e[t] = e[r], e[r] = n
                }

                function b(e, t, r, n, a) {
                    var o;
                    if (0 === e.length) return -1;
                    if ("string" == typeof r ? (n = r, r = 0) : r > 0x7fffffff ? r = 0x7fffffff : r < -0x80000000 && (r = -0x80000000), (o = r *= 1) != o && (r = a ? 0 : e.length - 1), r < 0 && (r = e.length + r), r >= e.length)
                        if (a) return -1;
                        else r = e.length - 1;
                    else if (r < 0)
                        if (!a) return -1;
                        else r = 0;
                    if ("string" == typeof t && (t = l.from(t, n)), l.isBuffer(t)) return 0 === t.length ? -1 : g(e, t, r, n, a);
                    if ("number" == typeof t) {
                        if (t &= 255, "function" == typeof Uint8Array.prototype.indexOf)
                            if (a) return Uint8Array.prototype.indexOf.call(e, t, r);
                            else return Uint8Array.prototype.lastIndexOf.call(e, t, r);
                        return g(e, [t], r, n, a)
                    }
                    throw TypeError("val must be string, number or Buffer")
                }

                function g(e, t, r, n, a) {
                    var o, i = 1,
                        u = e.length,
                        l = t.length;
                    if (void 0 !== n && ("ucs2" === (n = String(n).toLowerCase()) || "ucs-2" === n || "utf16le" === n || "utf-16le" === n)) {
                        if (e.length < 2 || t.length < 2) return -1;
                        i = 2, u /= 2, l /= 2, r /= 2
                    }

                    function s(e, t) {
                        return 1 === i ? e[t] : e.readUInt16BE(t * i)
                    }
                    if (a) {
                        var c = -1;
                        for (o = r; o < u; o++)
                            if (s(e, o) === s(t, -1 === c ? 0 : o - c)) {
                                if (-1 === c && (c = o), o - c + 1 === l) return c * i
                            } else - 1 !== c && (o -= o - c), c = -1
                    } else
                        for (r + l > u && (r = u - l), o = r; o >= 0; o--) {
                            for (var f = !0, d = 0; d < l; d++)
                                if (s(e, o + d) !== s(t, d)) {
                                    f = !1;
                                    break
                                } if (f) return o
                        }
                    return -1
                }

                function w(e, t, r) {
                    r = Math.min(e.length, r);
                    for (var n = [], a = t; a < r;) {
                        var o, i, u, l, s = e[a],
                            c = null,
                            f = s > 239 ? 4 : s > 223 ? 3 : s > 191 ? 2 : 1;
                        if (a + f <= r) switch (f) {
                            case 1:
                                s < 128 && (c = s);
                                break;
                            case 2:
                                (192 & (o = e[a + 1])) == 128 && (l = (31 & s) << 6 | 63 & o) > 127 && (c = l);
                                break;
                            case 3:
                                o = e[a + 1], i = e[a + 2], (192 & o) == 128 && (192 & i) == 128 && (l = (15 & s) << 12 | (63 & o) << 6 | 63 & i) > 2047 && (l < 55296 || l > 57343) && (c = l);
                                break;
                            case 4:
                                o = e[a + 1], i = e[a + 2], u = e[a + 3], (192 & o) == 128 && (192 & i) == 128 && (192 & u) == 128 && (l = (15 & s) << 18 | (63 & o) << 12 | (63 & i) << 6 | 63 & u) > 65535 && l < 1114112 && (c = l)
                        }
                        null === c ? (c = 65533, f = 1) : c > 65535 && (c -= 65536, n.push(c >>> 10 & 1023 | 55296), c = 56320 | 1023 & c), n.push(c), a += f
                    }
                    var d = n,
                        p = d.length;
                    if (p <= 4096) return String.fromCharCode.apply(String, d);
                    for (var h = "", y = 0; y < p;) h += String.fromCharCode.apply(String, d.slice(y, y += 4096));
                    return h
                }

                function S(e, t, r) {
                    if (e % 1 != 0 || e < 0) throw RangeError("offset is not uint");
                    if (e + t > r) throw RangeError("Trying to access beyond buffer length")
                }

                function x(e, t, r, n, a, o) {
                    if (!l.isBuffer(e)) throw TypeError('"buffer" argument must be a Buffer instance');
                    if (t > a || t < o) throw RangeError('"value" argument is out of bounds');
                    if (r + n > e.length) throw RangeError("Index out of range")
                }

                function C(e, t, r, n, a, o) {
                    if (r + n > e.length || r < 0) throw RangeError("Index out of range")
                }

                function E(e, t, r, n, a) {
                    return t *= 1, r >>>= 0, a || C(e, t, r, 4, 34028234663852886e22, -34028234663852886e22), o.write(e, t, r, n, 23, 4), r + 4
                }

                function A(e, t, r, n, a) {
                    return t *= 1, r >>>= 0, a || C(e, t, r, 8, 17976931348623157e292, -17976931348623157e292), o.write(e, t, r, n, 52, 8), r + 8
                }
                t.Buffer = l, t.SlowBuffer = function(e) {
                    return +e != e && (e = 0), l.alloc(+e)
                }, t.INSPECT_MAX_BYTES = 50, t.kMaxLength = 0x7fffffff, l.TYPED_ARRAY_SUPPORT = function() {
                    try {
                        var e = new Uint8Array(1),
                            t = {
                                foo: function() {
                                    return 42
                                }
                            };
                        return Object.setPrototypeOf(t, Uint8Array.prototype), Object.setPrototypeOf(e, t), 42 === e.foo()
                    } catch (e) {
                        return !1
                    }
                }(), !l.TYPED_ARRAY_SUPPORT && "u" > typeof console && "function" == typeof console.error && console.error("This browser lacks typed array (Uint8Array) support which is required by `buffer` v5.x. Use `buffer` v4.x if you require old browser support."), Object.defineProperty(l.prototype, "parent", {
                    enumerable: !0,
                    get: function() {
                        if (l.isBuffer(this)) return this.buffer
                    }
                }), Object.defineProperty(l.prototype, "offset", {
                    enumerable: !0,
                    get: function() {
                        if (l.isBuffer(this)) return this.byteOffset
                    }
                }), l.poolSize = 8192, l.from = function(e, t, r) {
                    return s(e, t, r)
                }, Object.setPrototypeOf(l.prototype, Uint8Array.prototype), Object.setPrototypeOf(l, Uint8Array), l.alloc = function(e, t, r) {
                    return (c(e), e <= 0) ? u(e) : void 0 !== t ? "string" == typeof r ? u(e).fill(t, r) : u(e).fill(t) : u(e)
                }, l.allocUnsafe = function(e) {
                    return f(e)
                }, l.allocUnsafeSlow = function(e) {
                    return f(e)
                }, l.isBuffer = function(e) {
                    return null != e && !0 === e._isBuffer && e !== l.prototype
                }, l.compare = function(e, t) {
                    if (N(e, Uint8Array) && (e = l.from(e, e.offset, e.byteLength)), N(t, Uint8Array) && (t = l.from(t, t.offset, t.byteLength)), !l.isBuffer(e) || !l.isBuffer(t)) throw TypeError('The "buf1", "buf2" arguments must be one of type Buffer or Uint8Array');
                    if (e === t) return 0;
                    for (var r = e.length, n = t.length, a = 0, o = Math.min(r, n); a < o; ++a)
                        if (e[a] !== t[a]) {
                            r = e[a], n = t[a];
                            break
                        } return r < n ? -1 : +(n < r)
                }, l.isEncoding = function(e) {
                    switch (String(e).toLowerCase()) {
                        case "hex":
                        case "utf8":
                        case "utf-8":
                        case "ascii":
                        case "latin1":
                        case "binary":
                        case "base64":
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return !0;
                        default:
                            return !1
                    }
                }, l.concat = function(e, t) {
                    if (!Array.isArray(e)) throw TypeError('"list" argument must be an Array of Buffers');
                    if (0 === e.length) return l.alloc(0);
                    if (void 0 === t)
                        for (r = 0, t = 0; r < e.length; ++r) t += e[r].length;
                    var r, n = l.allocUnsafe(t),
                        a = 0;
                    for (r = 0; r < e.length; ++r) {
                        var o = e[r];
                        if (N(o, Uint8Array)) a + o.length > n.length ? l.from(o).copy(n, a) : Uint8Array.prototype.set.call(n, o, a);
                        else if (l.isBuffer(o)) o.copy(n, a);
                        else throw TypeError('"list" argument must be an Array of Buffers');
                        a += o.length
                    }
                    return n
                }, l.byteLength = y, l.prototype._isBuffer = !0, l.prototype.swap16 = function() {
                    var e = this.length;
                    if (e % 2 != 0) throw RangeError("Buffer size must be a multiple of 16-bits");
                    for (var t = 0; t < e; t += 2) m(this, t, t + 1);
                    return this
                }, l.prototype.swap32 = function() {
                    var e = this.length;
                    if (e % 4 != 0) throw RangeError("Buffer size must be a multiple of 32-bits");
                    for (var t = 0; t < e; t += 4) m(this, t, t + 3), m(this, t + 1, t + 2);
                    return this
                }, l.prototype.swap64 = function() {
                    var e = this.length;
                    if (e % 8 != 0) throw RangeError("Buffer size must be a multiple of 64-bits");
                    for (var t = 0; t < e; t += 8) m(this, t, t + 7), m(this, t + 1, t + 6), m(this, t + 2, t + 5), m(this, t + 3, t + 4);
                    return this
                }, l.prototype.toString = function() {
                    var e = this.length;
                    return 0 === e ? "" : 0 == arguments.length ? w(this, 0, e) : v.apply(this, arguments)
                }, l.prototype.toLocaleString = l.prototype.toString, l.prototype.equals = function(e) {
                    if (!l.isBuffer(e)) throw TypeError("Argument must be a Buffer");
                    return this === e || 0 === l.compare(this, e)
                }, l.prototype.inspect = function() {
                    var e = "",
                        r = t.INSPECT_MAX_BYTES;
                    return e = this.toString("hex", 0, r).replace(/(.{2})/g, "$1 ").trim(), this.length > r && (e += " ... "), "<Buffer " + e + ">"
                }, i && (l.prototype[i] = l.prototype.inspect), l.prototype.compare = function(e, t, r, a, o) {
                    if (N(e, Uint8Array) && (e = l.from(e, e.offset, e.byteLength)), !l.isBuffer(e)) throw TypeError('The "target" argument must be one of type Buffer or Uint8Array. Received type ' + (void 0 === e ? "undefined" : n(e)));
                    if (void 0 === t && (t = 0), void 0 === r && (r = e ? e.length : 0), void 0 === a && (a = 0), void 0 === o && (o = this.length), t < 0 || r > e.length || a < 0 || o > this.length) throw RangeError("out of range index");
                    if (a >= o && t >= r) return 0;
                    if (a >= o) return -1;
                    if (t >= r) return 1;
                    if (t >>>= 0, r >>>= 0, a >>>= 0, o >>>= 0, this === e) return 0;
                    for (var i = o - a, u = r - t, s = Math.min(i, u), c = this.slice(a, o), f = e.slice(t, r), d = 0; d < s; ++d)
                        if (c[d] !== f[d]) {
                            i = c[d], u = f[d];
                            break
                        } return i < u ? -1 : +(u < i)
                }, l.prototype.includes = function(e, t, r) {
                    return -1 !== this.indexOf(e, t, r)
                }, l.prototype.indexOf = function(e, t, r) {
                    return b(this, e, t, r, !0)
                }, l.prototype.lastIndexOf = function(e, t, r) {
                    return b(this, e, t, r, !1)
                }, l.prototype.write = function(e, t, r, n) {
                    if (void 0 === t) n = "utf8", r = this.length, t = 0;
                    else if (void 0 === r && "string" == typeof t) n = t, r = this.length, t = 0;
                    else if (isFinite(t)) t >>>= 0, isFinite(r) ? (r >>>= 0, void 0 === n && (n = "utf8")) : (n = r, r = void 0);
                    else throw Error("Buffer.write(string, encoding, offset[, length]) is no longer supported");
                    var a, o, i, u, l, s, c, f, d = this.length - t;
                    if ((void 0 === r || r > d) && (r = d), e.length > 0 && (r < 0 || t < 0) || t > this.length) throw RangeError("Attempt to write outside buffer bounds");
                    n || (n = "utf8");
                    for (var p = !1;;) switch (n) {
                        case "hex":
                            return function(e, t, r, n) {
                                r = Number(r) || 0;
                                var a = e.length - r;
                                n ? (n = Number(n)) > a && (n = a) : n = a;
                                var o = t.length;
                                n > o / 2 && (n = o / 2);
                                for (var i = 0; i < n; ++i) {
                                    var u, l = parseInt(t.substr(2 * i, 2), 16);
                                    if ((u = l) != u) break;
                                    e[r + i] = l
                                }
                                return i
                            }(this, e, t, r);
                        case "utf8":
                        case "utf-8":
                            return a = t, o = r, T(j(e, this.length - a), this, a, o);
                        case "ascii":
                        case "latin1":
                        case "binary":
                            return i = t, u = r, T(function(e) {
                                for (var t = [], r = 0; r < e.length; ++r) t.push(255 & e.charCodeAt(r));
                                return t
                            }(e), this, i, u);
                        case "base64":
                            return l = t, s = r, T(P(e), this, l, s);
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return c = t, f = r, T(function(e, t) {
                                for (var r, n, a = [], o = 0; o < e.length && !((t -= 2) < 0); ++o) n = (r = e.charCodeAt(o)) >> 8, a.push(r % 256), a.push(n);
                                return a
                            }(e, this.length - c), this, c, f);
                        default:
                            if (p) throw TypeError("Unknown encoding: " + n);
                            n = ("" + n).toLowerCase(), p = !0
                    }
                }, l.prototype.toJSON = function() {
                    return {
                        type: "Buffer",
                        data: Array.prototype.slice.call(this._arr || this, 0)
                    }
                }, l.prototype.slice = function(e, t) {
                    var r = this.length;
                    e = ~~e, t = void 0 === t ? r : ~~t, e < 0 ? (e += r) < 0 && (e = 0) : e > r && (e = r), t < 0 ? (t += r) < 0 && (t = 0) : t > r && (t = r), t < e && (t = e);
                    var n = this.subarray(e, t);
                    return Object.setPrototypeOf(n, l.prototype), n
                }, l.prototype.readUintLE = l.prototype.readUIntLE = function(e, t, r) {
                    e >>>= 0, t >>>= 0, r || S(e, t, this.length);
                    for (var n = this[e], a = 1, o = 0; ++o < t && (a *= 256);) n += this[e + o] * a;
                    return n
                }, l.prototype.readUintBE = l.prototype.readUIntBE = function(e, t, r) {
                    e >>>= 0, t >>>= 0, r || S(e, t, this.length);
                    for (var n = this[e + --t], a = 1; t > 0 && (a *= 256);) n += this[e + --t] * a;
                    return n
                }, l.prototype.readUint8 = l.prototype.readUInt8 = function(e, t) {
                    return e >>>= 0, t || S(e, 1, this.length), this[e]
                }, l.prototype.readUint16LE = l.prototype.readUInt16LE = function(e, t) {
                    return e >>>= 0, t || S(e, 2, this.length), this[e] | this[e + 1] << 8
                }, l.prototype.readUint16BE = l.prototype.readUInt16BE = function(e, t) {
                    return e >>>= 0, t || S(e, 2, this.length), this[e] << 8 | this[e + 1]
                }, l.prototype.readUint32LE = l.prototype.readUInt32LE = function(e, t) {
                    return e >>>= 0, t || S(e, 4, this.length), (this[e] | this[e + 1] << 8 | this[e + 2] << 16) + 0x1000000 * this[e + 3]
                }, l.prototype.readUint32BE = l.prototype.readUInt32BE = function(e, t) {
                    return e >>>= 0, t || S(e, 4, this.length), 0x1000000 * this[e] + (this[e + 1] << 16 | this[e + 2] << 8 | this[e + 3])
                }, l.prototype.readIntLE = function(e, t, r) {
                    e >>>= 0, t >>>= 0, r || S(e, t, this.length);
                    for (var n = this[e], a = 1, o = 0; ++o < t && (a *= 256);) n += this[e + o] * a;
                    return n >= (a *= 128) && (n -= Math.pow(2, 8 * t)), n
                }, l.prototype.readIntBE = function(e, t, r) {
                    e >>>= 0, t >>>= 0, r || S(e, t, this.length);
                    for (var n = t, a = 1, o = this[e + --n]; n > 0 && (a *= 256);) o += this[e + --n] * a;
                    return o >= (a *= 128) && (o -= Math.pow(2, 8 * t)), o
                }, l.prototype.readInt8 = function(e, t) {
                    return (e >>>= 0, t || S(e, 1, this.length), 128 & this[e]) ? -((255 - this[e] + 1) * 1) : this[e]
                }, l.prototype.readInt16LE = function(e, t) {
                    e >>>= 0, t || S(e, 2, this.length);
                    var r = this[e] | this[e + 1] << 8;
                    return 32768 & r ? 0xffff0000 | r : r
                }, l.prototype.readInt16BE = function(e, t) {
                    e >>>= 0, t || S(e, 2, this.length);
                    var r = this[e + 1] | this[e] << 8;
                    return 32768 & r ? 0xffff0000 | r : r
                }, l.prototype.readInt32LE = function(e, t) {
                    return e >>>= 0, t || S(e, 4, this.length), this[e] | this[e + 1] << 8 | this[e + 2] << 16 | this[e + 3] << 24
                }, l.prototype.readInt32BE = function(e, t) {
                    return e >>>= 0, t || S(e, 4, this.length), this[e] << 24 | this[e + 1] << 16 | this[e + 2] << 8 | this[e + 3]
                }, l.prototype.readFloatLE = function(e, t) {
                    return e >>>= 0, t || S(e, 4, this.length), o.read(this, e, !0, 23, 4)
                }, l.prototype.readFloatBE = function(e, t) {
                    return e >>>= 0, t || S(e, 4, this.length), o.read(this, e, !1, 23, 4)
                }, l.prototype.readDoubleLE = function(e, t) {
                    return e >>>= 0, t || S(e, 8, this.length), o.read(this, e, !0, 52, 8)
                }, l.prototype.readDoubleBE = function(e, t) {
                    return e >>>= 0, t || S(e, 8, this.length), o.read(this, e, !1, 52, 8)
                }, l.prototype.writeUintLE = l.prototype.writeUIntLE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, r >>>= 0, !n) {
                        var a = Math.pow(2, 8 * r) - 1;
                        x(this, e, t, r, a, 0)
                    }
                    var o = 1,
                        i = 0;
                    for (this[t] = 255 & e; ++i < r && (o *= 256);) this[t + i] = e / o & 255;
                    return t + r
                }, l.prototype.writeUintBE = l.prototype.writeUIntBE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, r >>>= 0, !n) {
                        var a = Math.pow(2, 8 * r) - 1;
                        x(this, e, t, r, a, 0)
                    }
                    var o = r - 1,
                        i = 1;
                    for (this[t + o] = 255 & e; --o >= 0 && (i *= 256);) this[t + o] = e / i & 255;
                    return t + r
                }, l.prototype.writeUint8 = l.prototype.writeUInt8 = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || x(this, e, t, 1, 255, 0), this[t] = 255 & e, t + 1
                }, l.prototype.writeUint16LE = l.prototype.writeUInt16LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || x(this, e, t, 2, 65535, 0), this[t] = 255 & e, this[t + 1] = e >>> 8, t + 2
                }, l.prototype.writeUint16BE = l.prototype.writeUInt16BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || x(this, e, t, 2, 65535, 0), this[t] = e >>> 8, this[t + 1] = 255 & e, t + 2
                }, l.prototype.writeUint32LE = l.prototype.writeUInt32LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || x(this, e, t, 4, 0xffffffff, 0), this[t + 3] = e >>> 24, this[t + 2] = e >>> 16, this[t + 1] = e >>> 8, this[t] = 255 & e, t + 4
                }, l.prototype.writeUint32BE = l.prototype.writeUInt32BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || x(this, e, t, 4, 0xffffffff, 0), this[t] = e >>> 24, this[t + 1] = e >>> 16, this[t + 2] = e >>> 8, this[t + 3] = 255 & e, t + 4
                }, l.prototype.writeIntLE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, !n) {
                        var a = Math.pow(2, 8 * r - 1);
                        x(this, e, t, r, a - 1, -a)
                    }
                    var o = 0,
                        i = 1,
                        u = 0;
                    for (this[t] = 255 & e; ++o < r && (i *= 256);) e < 0 && 0 === u && 0 !== this[t + o - 1] && (u = 1), this[t + o] = (e / i | 0) - u & 255;
                    return t + r
                }, l.prototype.writeIntBE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, !n) {
                        var a = Math.pow(2, 8 * r - 1);
                        x(this, e, t, r, a - 1, -a)
                    }
                    var o = r - 1,
                        i = 1,
                        u = 0;
                    for (this[t + o] = 255 & e; --o >= 0 && (i *= 256);) e < 0 && 0 === u && 0 !== this[t + o + 1] && (u = 1), this[t + o] = (e / i | 0) - u & 255;
                    return t + r
                }, l.prototype.writeInt8 = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || x(this, e, t, 1, 127, -128), e < 0 && (e = 255 + e + 1), this[t] = 255 & e, t + 1
                }, l.prototype.writeInt16LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || x(this, e, t, 2, 32767, -32768), this[t] = 255 & e, this[t + 1] = e >>> 8, t + 2
                }, l.prototype.writeInt16BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || x(this, e, t, 2, 32767, -32768), this[t] = e >>> 8, this[t + 1] = 255 & e, t + 2
                }, l.prototype.writeInt32LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || x(this, e, t, 4, 0x7fffffff, -0x80000000), this[t] = 255 & e, this[t + 1] = e >>> 8, this[t + 2] = e >>> 16, this[t + 3] = e >>> 24, t + 4
                }, l.prototype.writeInt32BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || x(this, e, t, 4, 0x7fffffff, -0x80000000), e < 0 && (e = 0xffffffff + e + 1), this[t] = e >>> 24, this[t + 1] = e >>> 16, this[t + 2] = e >>> 8, this[t + 3] = 255 & e, t + 4
                }, l.prototype.writeFloatLE = function(e, t, r) {
                    return E(this, e, t, !0, r)
                }, l.prototype.writeFloatBE = function(e, t, r) {
                    return E(this, e, t, !1, r)
                }, l.prototype.writeDoubleLE = function(e, t, r) {
                    return A(this, e, t, !0, r)
                }, l.prototype.writeDoubleBE = function(e, t, r) {
                    return A(this, e, t, !1, r)
                }, l.prototype.copy = function(e, t, r, n) {
                    if (!l.isBuffer(e)) throw TypeError("argument should be a Buffer");
                    if (r || (r = 0), n || 0 === n || (n = this.length), t >= e.length && (t = e.length), t || (t = 0), n > 0 && n < r && (n = r), n === r || 0 === e.length || 0 === this.length) return 0;
                    if (t < 0) throw RangeError("targetStart out of bounds");
                    if (r < 0 || r >= this.length) throw RangeError("Index out of range");
                    if (n < 0) throw RangeError("sourceEnd out of bounds");
                    n > this.length && (n = this.length), e.length - t < n - r && (n = e.length - t + r);
                    var a = n - r;
                    return this === e && "function" == typeof Uint8Array.prototype.copyWithin ? this.copyWithin(t, r, n) : Uint8Array.prototype.set.call(e, this.subarray(r, n), t), a
                }, l.prototype.fill = function(e, t, r, n) {
                    if ("string" == typeof e) {
                        if ("string" == typeof t ? (n = t, t = 0, r = this.length) : "string" == typeof r && (n = r, r = this.length), void 0 !== n && "string" != typeof n) throw TypeError("encoding must be a string");
                        if ("string" == typeof n && !l.isEncoding(n)) throw TypeError("Unknown encoding: " + n);
                        if (1 === e.length) {
                            var a, o = e.charCodeAt(0);
                            ("utf8" === n && o < 128 || "latin1" === n) && (e = o)
                        }
                    } else "number" == typeof e ? e &= 255 : "boolean" == typeof e && (e = Number(e));
                    if (t < 0 || this.length < t || this.length < r) throw RangeError("Out of range index");
                    if (r <= t) return this;
                    if (t >>>= 0, r = void 0 === r ? this.length : r >>> 0, e || (e = 0), "number" == typeof e)
                        for (a = t; a < r; ++a) this[a] = e;
                    else {
                        var i = l.isBuffer(e) ? e : l.from(e, n),
                            u = i.length;
                        if (0 === u) throw TypeError('The value "' + e + '" is invalid for argument "value"');
                        for (a = 0; a < r - t; ++a) this[a + t] = i[a % u]
                    }
                    return this
                };
                var k = /[^+/0-9A-Za-z-_]/g;

                function j(e, t) {
                    t = t || 1 / 0;
                    for (var r, n = e.length, a = null, o = [], i = 0; i < n; ++i) {
                        if ((r = e.charCodeAt(i)) > 55295 && r < 57344) {
                            if (!a) {
                                if (r > 56319 || i + 1 === n) {
                                    (t -= 3) > -1 && o.push(239, 191, 189);
                                    continue
                                }
                                a = r;
                                continue
                            }
                            if (r < 56320) {
                                (t -= 3) > -1 && o.push(239, 191, 189), a = r;
                                continue
                            }
                            r = (a - 55296 << 10 | r - 56320) + 65536
                        } else a && (t -= 3) > -1 && o.push(239, 191, 189);
                        if (a = null, r < 128) {
                            if ((t -= 1) < 0) break;
                            o.push(r)
                        } else if (r < 2048) {
                            if ((t -= 2) < 0) break;
                            o.push(r >> 6 | 192, 63 & r | 128)
                        } else if (r < 65536) {
                            if ((t -= 3) < 0) break;
                            o.push(r >> 12 | 224, r >> 6 & 63 | 128, 63 & r | 128)
                        } else if (r < 1114112) {
                            if ((t -= 4) < 0) break;
                            o.push(r >> 18 | 240, r >> 12 & 63 | 128, r >> 6 & 63 | 128, 63 & r | 128)
                        } else throw Error("Invalid code point")
                    }
                    return o
                }

                function P(e) {
                    return a.toByteArray(function(e) {
                        if ((e = (e = e.split("=")[0]).trim().replace(k, "")).length < 2) return "";
                        for (; e.length % 4 != 0;) e += "=";
                        return e
                    }(e))
                }

                function T(e, t, r, n) {
                    for (var a = 0; a < n && !(a + r >= t.length) && !(a >= e.length); ++a) t[a + r] = e[a];
                    return a
                }

                function N(e, t) {
                    return (null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t) || null != e && null != e.constructor && null != e.constructor.name && e.constructor.name === t.name
                }
                var O = function() {
                    for (var e = "0123456789abcdef", t = Array(256), r = 0; r < 16; ++r)
                        for (var n = 16 * r, a = 0; a < 16; ++a) t[n + a] = e[r] + e[a];
                    return t
                }()
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
                        for (var e = "", o = 0; o < arguments.length; o++) {
                            var i = arguments[o];
                            i && (e = a(e, function(e) {
                                if ("string" == typeof e || "number" == typeof e) return e;
                                if ((void 0 === e ? "undefined" : t(e)) !== "object") return "";
                                if (Array.isArray(e)) return n.apply(null, e);
                                if (e.toString !== Object.prototype.toString && !e.toString.toString().includes("[native code]")) return e.toString();
                                var o = "";
                                for (var i in e) r.call(e, i) && e[i] && (o = a(o, i));
                                return o
                            }(i)))
                        }
                        return e
                    }

                    function a(e, t) {
                        return t ? e ? e + " " + t : e + t : e
                    }
                    e.exports ? (n.default = n, e.exports = n) : "function" == typeof define && "object" === t(define.amd) && define.amd ? define("classnames", [], function() {
                        return n
                    }) : window.classNames = n
                }()
            },
            619: function(e, t) {
                /*! ieee754. BSD-3-Clause License. Feross Aboukhadijeh <https://feross.org/opensource> */
                t.read = function(e, t, r, n, a) {
                    var o, i, u = 8 * a - n - 1,
                        l = (1 << u) - 1,
                        s = l >> 1,
                        c = -7,
                        f = r ? a - 1 : 0,
                        d = r ? -1 : 1,
                        p = e[t + f];
                    for (f += d, o = p & (1 << -c) - 1, p >>= -c, c += u; c > 0; o = 256 * o + e[t + f], f += d, c -= 8);
                    for (i = o & (1 << -c) - 1, o >>= -c, c += n; c > 0; i = 256 * i + e[t + f], f += d, c -= 8);
                    if (0 === o) o = 1 - s;
                    else {
                        if (o === l) return i ? NaN : 1 / 0 * (p ? -1 : 1);
                        i += Math.pow(2, n), o -= s
                    }
                    return (p ? -1 : 1) * i * Math.pow(2, o - n)
                }, t.write = function(e, t, r, n, a, o) {
                    var i, u, l, s = 8 * o - a - 1,
                        c = (1 << s) - 1,
                        f = c >> 1,
                        d = 5960464477539062e-23 * (23 === a),
                        p = n ? 0 : o - 1,
                        h = n ? 1 : -1,
                        y = +(t < 0 || 0 === t && 1 / t < 0);
                    for (isNaN(t = Math.abs(t)) || t === 1 / 0 ? (u = +!!isNaN(t), i = c) : (i = Math.floor(Math.log(t) / Math.LN2), t * (l = Math.pow(2, -i)) < 1 && (i--, l *= 2), i + f >= 1 ? t += d / l : t += d * Math.pow(2, 1 - f), t * l >= 2 && (i++, l /= 2), i + f >= c ? (u = 0, i = c) : i + f >= 1 ? (u = (t * l - 1) * Math.pow(2, a), i += f) : (u = t * Math.pow(2, f - 1) * Math.pow(2, a), i = 0)); a >= 8; e[r + p] = 255 & u, p += h, u /= 256, a -= 8);
                    for (i = i << a | u, s += a; s > 0; e[r + p] = 255 & i, p += h, i /= 256, s -= 8);
                    e[r + p - h] |= 128 * y
                }
            },
            848: function(e, t, r) {
                "use strict";
                var n = r(564).Buffer;

                function a(e) {
                    return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
                }
                var o = void 0 !== n,
                    i = /"(?:_|\\u005[Ff])(?:_|\\u005[Ff])(?:p|\\u0070)(?:r|\\u0072)(?:o|\\u006[Ff])(?:t|\\u0074)(?:o|\\u006[Ff])(?:_|\\u005[Ff])(?:_|\\u005[Ff])"\s*:/,
                    u = /"(?:c|\\u0063)(?:o|\\u006[Ff])(?:n|\\u006[Ee])(?:s|\\u0073)(?:t|\\u0074)(?:r|\\u0072)(?:u|\\u0075)(?:c|\\u0063)(?:t|\\u0074)(?:o|\\u006[Ff])(?:r|\\u0072)"\s*:/;

                function l(e, t, r) {
                    null == r && null !== t && (void 0 === t ? "undefined" : a(t)) === "object" && (r = t, t = void 0), o && n.isBuffer(e) && (e = e.toString()), e && 65279 === e.charCodeAt(0) && (e = e.slice(1));
                    var l = JSON.parse(e, t);
                    if (null === l || (void 0 === l ? "undefined" : a(l)) !== "object") return l;
                    var c = r && r.protoAction || "error",
                        f = r && r.constructorAction || "error";
                    if ("ignore" === c && "ignore" === f) return l;
                    if ("ignore" !== c && "ignore" !== f) {
                        if (!1 === i.test(e) && !1 === u.test(e)) return l
                    } else if ("ignore" !== c && "ignore" === f) {
                        if (!1 === i.test(e)) return l
                    } else if (!1 === u.test(e)) return l;
                    return s(l, {
                        protoAction: c,
                        constructorAction: f,
                        safe: r && r.safe
                    })
                }

                function s(e) {
                    for (var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, r = t.protoAction, n = void 0 === r ? "error" : r, o = t.constructorAction, i = void 0 === o ? "error" : o, u = t.safe, l = [e]; l.length;) {
                        var s = l;
                        l = [];
                        var c = !0,
                            f = !1,
                            d = void 0;
                        try {
                            for (var p, h = s[Symbol.iterator](); !(c = (p = h.next()).done); c = !0) {
                                var y = p.value;
                                if ("ignore" !== n && Object.prototype.hasOwnProperty.call(y, "__proto__")) {
                                    if (!0 === u) return null;
                                    if ("error" === n) throw SyntaxError("Object contains forbidden prototype property");
                                    delete y.__proto__
                                }
                                if ("ignore" !== i && Object.prototype.hasOwnProperty.call(y, "constructor") && null !== y.constructor && "object" === a(y.constructor) && Object.prototype.hasOwnProperty.call(y.constructor, "prototype")) {
                                    if (!0 === u) return null;
                                    if ("error" === i) throw SyntaxError("Object contains forbidden prototype property");
                                    delete y.constructor
                                }
                                for (var v in y) {
                                    var m = y[v];
                                    m && (void 0 === m ? "undefined" : a(m)) === "object" && l.push(m)
                                }
                            }
                        } catch (e) {
                            f = !0, d = e
                        } finally {
                            try {
                                c || null == h.return || h.return()
                            } finally {
                                if (f) throw d
                            }
                        }
                    }
                    return e
                }

                function c(e, t, r) {
                    var n = Error.stackTraceLimit;
                    Error.stackTraceLimit = 0;
                    try {
                        return l(e, t, r)
                    } finally {
                        Error.stackTraceLimit = n
                    }
                }
                e.exports = c, e.exports.default = c, e.exports.parse = c, e.exports.safeParse = function(e, t) {
                    var r = Error.stackTraceLimit;
                    Error.stackTraceLimit = 0;
                    try {
                        return l(e, t, {
                            safe: !0
                        })
                    } catch (e) {
                        return
                    } finally {
                        Error.stackTraceLimit = r
                    }
                }, e.exports.scan = s
            },
            609: function(e) {
                "use strict";
                e.exports = window.React
            }
        },
        t = {};

    function r(n) {
        var a = t[n];
        if (void 0 !== a) return a.exports;
        var o = t[n] = {
            exports: {}
        };
        return e[n].call(o.exports, o, o.exports, r), o.exports
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
            var e, t, n, a, o, i, u, l, s, c, f, d, p, h, y, v, m, b = window.ReactJSX,
                g = window.Roblox,
                w = r.n(g),
                S = window.Roblox["core-scripts"].react,
                x = r(609),
                C = r.n(x),
                E = window.ReactStyleGuide,
                A = window.ReactUtilities;

            function k(e) {
                return (k = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                    return typeof e
                } : function(e) {
                    return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
                })(e)
            }

            function j(e, t) {
                if (t.length < e) throw TypeError(e + " argument" + (e > 1 ? "s" : "") + " required, but only " + t.length + " present")
            }

            function P(e) {
                j(1, arguments);
                var t, r = Object.prototype.toString.call(e);
                return (null != (t = Date) && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t) || "object" === k(e) && "[object Date]" === r ? new Date(e.getTime()) : "number" == typeof e || "[object Number]" === r ? new Date(e) : (("string" == typeof e || "[object String]" === r) && "u" > typeof console && (console.warn("Starting with v2.0.0-beta.1 date-fns doesn't accept strings as date arguments. Please use `parseISO` to parse strings. See: https://github.com/date-fns/date-fns/blob/master/docs/upgradeGuide.md#string-arguments"), console.warn(Error().stack)), new Date(NaN))
            }

            function T(e, t) {
                j(2, arguments);
                var r = P(e),
                    n = P(t),
                    a = r.getTime() - n.getTime();
                return a < 0 ? -1 : a > 0 ? 1 : a
            }
            var N = window.EventTracker,
                O = "basil",
                I = "https://js.stripe.com",
                U = "".concat(I, "/").concat(O, "/stripe.js"),
                M = /^https:\/\/js\.stripe\.com\/v3\/?(\?.*)?$/,
                _ = /^https:\/\/js\.stripe\.com\/(v3|[a-z]+)\/stripe\.js(\?.*)?$/,
                D = function() {
                    for (var e = document.querySelectorAll('script[src^="'.concat(I, '"]')), t = 0; t < e.length; t++) {
                        var r, n = e[t];
                        if (r = n.src, M.test(r) || _.test(r)) return n
                    }
                    return null
                },
                R = function(e) {
                    var t = e && !e.advancedFraudSignals ? "?advancedFraudSignals=false" : "",
                        r = document.createElement("script");
                    r.src = "".concat(U).concat(t);
                    var n = document.head || document.body;
                    if (!n) throw Error("Expected document.body not to be null. Stripe.js requires a <body> element.");
                    return n.appendChild(r), r
                },
                B = function(e, t) {
                    e && e._registerWrapper && e._registerWrapper({
                        name: "stripe-js",
                        version: "7.9.0",
                        startTime: t
                    })
                },
                F = null,
                L = null,
                G = null,
                H = function(e, t, r) {
                    if (null === e) return null;
                    var n, a = t[0].match(/^pk_test/),
                        o = 3 === (n = e.version) ? "v3" : n;
                    a && o !== O && console.warn("Stripe.js@".concat(o, " was loaded on the page, but @stripe/stripe-js@").concat("7.9.0", " expected Stripe.js@").concat(O, ". This may result in unexpected behavior. For more information, see https://docs.stripe.com/sdks/stripejs-versioning"));
                    var i = e.apply(void 0, t);
                    return B(i, r), i
                },
                W = !1,
                Y = function() {
                    return p || (p = (null !== F ? F : (F = new Promise(function(e, t) {
                        if ("u" < typeof window || "u" < typeof document) return void e(null);
                        if (window.Stripe, window.Stripe) return void e(window.Stripe);
                        try {
                            var r, n = D();
                            n ? n && null !== G && null !== L && (n.removeEventListener("load", G), n.removeEventListener("error", L), null == (r = n.parentNode) || r.removeChild(n), n = R(null)) : n = R(null), G = function() {
                                window.Stripe ? e(window.Stripe) : t(Error("Stripe.js not available"))
                            }, L = function(e) {
                                t(Error("Failed to load Stripe.js", {
                                    cause: e
                                }))
                            }, n.addEventListener("load", G), n.addEventListener("error", L)
                        } catch (e) {
                            t(e);
                            return
                        }
                    })).catch(function(e) {
                        return F = null, Promise.reject(e)
                    })).catch(function(e) {
                        return p = null, Promise.reject(e)
                    }))
                };
            Promise.resolve().then(function() {
                return Y()
            }).catch(function(e) {
                W || console.warn(e)
            });
            var V = function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    W = !0;
                    var n = Date.now();
                    return Y().then(function(e) {
                        return H(e, t, n)
                    })
                },
                z = r(179);

            function q(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function X(e, t) {
                var r = "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                if (!r) {
                    if (Array.isArray(e) || (r = function(e) {
                            if (e) {
                                if ("string" == typeof e) return q(e, void 0);
                                var t = ({}).toString.call(e).slice(8, -1);
                                return "Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t ? Array.from(e) : "Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t) ? q(e, void 0) : void 0
                            }
                        }(e)) || t && e && "number" == typeof e.length) {
                        r && (e = r);
                        var n = 0,
                            a = function() {};
                        return {
                            s: a,
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
                            f: a
                        }
                    }
                    throw TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }
                var o, i = !0,
                    u = !1;
                return {
                    s: function() {
                        r = r.call(e)
                    },
                    n: function() {
                        var e = r.next();
                        return i = e.done, e
                    },
                    e: function(e) {
                        u = !0, o = e
                    },
                    f: function() {
                        try {
                            i || null == r.return || r.return()
                        } finally {
                            if (u) throw o
                        }
                    }
                }
            }
            var $ = {
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

            function Q(e) {
                return function() {
                    var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        r = t.width ? String(t.width) : e.defaultWidth;
                    return e.formats[r] || e.formats[e.defaultWidth]
                }
            }
            var K = {
                    date: Q({
                        formats: {
                            full: "EEEE, MMMM do, y",
                            long: "MMMM do, y",
                            medium: "MMM d, y",
                            short: "MM/dd/yyyy"
                        },
                        defaultWidth: "full"
                    }),
                    time: Q({
                        formats: {
                            full: "h:mm:ss a zzzz",
                            long: "h:mm:ss a z",
                            medium: "h:mm:ss a",
                            short: "h:mm a"
                        },
                        defaultWidth: "full"
                    }),
                    dateTime: Q({
                        formats: {
                            full: "{{date}} 'at' {{time}}",
                            long: "{{date}} 'at' {{time}}",
                            medium: "{{date}}, {{time}}",
                            short: "{{date}}, {{time}}"
                        },
                        defaultWidth: "full"
                    })
                },
                J = {
                    lastWeek: "'last' eeee 'at' p",
                    yesterday: "'yesterday at' p",
                    today: "'today at' p",
                    tomorrow: "'tomorrow at' p",
                    nextWeek: "eeee 'at' p",
                    other: "P"
                };

            function Z(e) {
                return function(t, r) {
                    var n;
                    if ("formatting" === (null != r && r.context ? String(r.context) : "standalone") && e.formattingValues) {
                        var a = e.defaultFormattingWidth || e.defaultWidth,
                            o = null != r && r.width ? String(r.width) : a;
                        n = e.formattingValues[o] || e.formattingValues[a]
                    } else {
                        var i = e.defaultWidth,
                            u = null != r && r.width ? String(r.width) : e.defaultWidth;
                        n = e.values[u] || e.values[i]
                    }
                    return n[e.argumentCallback ? e.argumentCallback(t) : t]
                }
            }

            function ee(e) {
                return function(t) {
                    var r, n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        a = n.width,
                        o = a && e.matchPatterns[a] || e.matchPatterns[e.defaultMatchWidth],
                        i = t.match(o);
                    if (!i) return null;
                    var u = i[0],
                        l = a && e.parsePatterns[a] || e.parsePatterns[e.defaultParseWidth],
                        s = Array.isArray(l) ? function(e, t) {
                            for (var r = 0; r < e.length; r++)
                                if (t(e[r])) return r
                        }(l, function(e) {
                            return e.test(u)
                        }) : function(e, t) {
                            for (var r in e)
                                if (e.hasOwnProperty(r) && t(e[r])) return r
                        }(l, function(e) {
                            return e.test(u)
                        });
                    return r = e.valueCallback ? e.valueCallback(s) : s, {
                        value: r = n.valueCallback ? n.valueCallback(r) : r,
                        rest: t.slice(u.length)
                    }
                }
            }
            var et = {
                code: "en-US",
                formatDistance: function(e, t, r) {
                    var n, a = $[e];
                    if (n = "string" == typeof a ? a : 1 === t ? a.one : a.other.replace("{{count}}", t.toString()), null != r && r.addSuffix)
                        if (r.comparison && r.comparison > 0) return "in " + n;
                        else return n + " ago";
                    return n
                },
                formatLong: K,
                formatRelative: function(e, t, r, n) {
                    return J[e]
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
                    era: Z({
                        values: {
                            narrow: ["B", "A"],
                            abbreviated: ["BC", "AD"],
                            wide: ["Before Christ", "Anno Domini"]
                        },
                        defaultWidth: "wide"
                    }),
                    quarter: Z({
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
                    month: Z({
                        values: {
                            narrow: ["J", "F", "M", "A", "M", "J", "J", "A", "S", "O", "N", "D"],
                            abbreviated: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                            wide: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
                        },
                        defaultWidth: "wide"
                    }),
                    day: Z({
                        values: {
                            narrow: ["S", "M", "T", "W", "T", "F", "S"],
                            short: ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"],
                            abbreviated: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
                            wide: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
                        },
                        defaultWidth: "wide"
                    }),
                    dayPeriod: Z({
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
                        var r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                            n = t.match(e.matchPattern);
                        if (!n) return null;
                        var a = n[0],
                            o = t.match(e.parsePattern);
                        if (!o) return null;
                        var i = e.valueCallback ? e.valueCallback(o[0]) : o[0];
                        return {
                            value: i = r.valueCallback ? r.valueCallback(i) : i,
                            rest: t.slice(a.length)
                        }
                    }),
                    era: ee({
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
                    quarter: ee({
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
                    month: ee({
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
                    day: ee({
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
                    dayPeriod: ee({
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

            function er(e) {
                if (null === e || !0 === e || !1 === e) return NaN;
                var t = Number(e);
                return isNaN(t) ? t : t < 0 ? Math.ceil(t) : Math.floor(t)
            }
            var en = function(e, t) {
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
                ea = function(e, t) {
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
                eo = {
                    p: ea,
                    P: function(e, t) {
                        var r, n = e.match(/(P+)(p+)?/) || [],
                            a = n[1],
                            o = n[2];
                        if (!o) return en(e, t);
                        switch (a) {
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
                        return r.replace("{{date}}", en(a, t)).replace("{{time}}", ea(o, t))
                    }
                },
                ei = ["D", "DD"],
                eu = ["YY", "YYYY"];

            function el(e, t, r) {
                if ("YYYY" === e) throw RangeError("Use `yyyy` instead of `YYYY` (in `".concat(t, "`) for formatting years to the input `").concat(r, "`; see: https://github.com/date-fns/date-fns/blob/master/docs/unicodeTokens.md"));
                if ("YY" === e) throw RangeError("Use `yy` instead of `YY` (in `".concat(t, "`) for formatting years to the input `").concat(r, "`; see: https://github.com/date-fns/date-fns/blob/master/docs/unicodeTokens.md"));
                if ("D" === e) throw RangeError("Use `d` instead of `D` (in `".concat(t, "`) for formatting days of the month to the input `").concat(r, "`; see: https://github.com/date-fns/date-fns/blob/master/docs/unicodeTokens.md"));
                if ("DD" === e) throw RangeError("Use `dd` instead of `DD` (in `".concat(t, "`) for formatting days of the month to the input `").concat(r, "`; see: https://github.com/date-fns/date-fns/blob/master/docs/unicodeTokens.md"))
            }

            function es(e) {
                if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                return e
            }

            function ec(e, t) {
                return (ec = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function ef(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        writable: !0,
                        configurable: !0
                    }
                }), Object.defineProperty(e, "prototype", {
                    writable: !1
                }), t && ec(e, t)
            }

            function ed(e) {
                return (ed = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function ep() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (ep = function() {
                    return !!e
                })()
            }

            function eh(e) {
                var t = ep();
                return function() {
                    var r, n = ed(e);
                    r = t ? Reflect.construct(n, arguments, ed(this).constructor) : n.apply(this, arguments);
                    if (r && ("object" == k(r) || "function" == typeof r)) return r;
                    if (void 0 !== r) throw TypeError("Derived constructors may only return object or undefined");
                    return es(this)
                }
            }

            function ey(e, t) {
                if (null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !t[Symbol.hasInstance](e) : !(e instanceof t)) throw TypeError("Cannot call a class as a function")
            }

            function ev(e) {
                var t = function(e, t) {
                    if ("object" != k(e) || !e) return e;
                    var r = e[Symbol.toPrimitive];
                    if (void 0 !== r) {
                        var n = r.call(e, t || "default");
                        if ("object" != k(n)) return n;
                        throw TypeError("@@toPrimitive must return a primitive value.")
                    }
                    return ("string" === t ? String : Number)(e)
                }(e, "string");
                return "symbol" == k(t) ? t : t + ""
            }

            function em(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var n = t[r];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, ev(n.key), n)
                }
            }

            function eb(e, t, r) {
                return t && em(e.prototype, t), r && em(e, r), Object.defineProperty(e, "prototype", {
                    writable: !1
                }), e
            }

            function eg(e, t, r) {
                return (t = ev(t)) in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }
            var ew = function() {
                    function e() {
                        ey(this, e), eg(this, "priority", void 0), eg(this, "subPriority", 0)
                    }
                    return eb(e, [{
                        key: "validate",
                        value: function(e, t) {
                            return !0
                        }
                    }]), e
                }(),
                eS = function(e) {
                    ef(r, e);
                    var t = eh(r);

                    function r(e, n, a, o, i) {
                        var u;
                        return ey(this, r), (u = t.call(this)).value = e, u.validateValue = n, u.setValue = a, u.priority = o, i && (u.subPriority = i), u
                    }
                    return eb(r, [{
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
                }(ew),
                ex = function(e) {
                    ef(r, e);
                    var t = eh(r);

                    function r() {
                        var e;
                        ey(this, r);
                        for (var n = arguments.length, a = Array(n), o = 0; o < n; o++) a[o] = arguments[o];
                        return eg(es(e = t.call.apply(t, [this].concat(a))), "priority", 10), eg(es(e), "subPriority", -1), e
                    }
                    return eb(r, [{
                        key: "set",
                        value: function(e, t) {
                            if (t.timestampIsSet) return e;
                            var r = new Date(0);
                            return r.setFullYear(e.getUTCFullYear(), e.getUTCMonth(), e.getUTCDate()), r.setHours(e.getUTCHours(), e.getUTCMinutes(), e.getUTCSeconds(), e.getUTCMilliseconds()), r
                        }
                    }]), r
                }(ew),
                eC = function() {
                    function e() {
                        ey(this, e), eg(this, "incompatibleTokens", void 0), eg(this, "priority", void 0), eg(this, "subPriority", void 0)
                    }
                    return eb(e, [{
                        key: "run",
                        value: function(e, t, r, n) {
                            var a = this.parse(e, t, r, n);
                            return a ? {
                                setter: new eS(a.value, this.validate, this.set, this.priority, this.subPriority),
                                rest: a.rest
                            } : null
                        }
                    }, {
                        key: "validate",
                        value: function(e, t, r) {
                            return !0
                        }
                    }]), e
                }(),
                eE = function(e) {
                    ef(r, e);
                    var t = eh(r);

                    function r() {
                        var e;
                        ey(this, r);
                        for (var n = arguments.length, a = Array(n), o = 0; o < n; o++) a[o] = arguments[o];
                        return eg(es(e = t.call.apply(t, [this].concat(a))), "priority", 140), eg(es(e), "incompatibleTokens", ["R", "u", "t", "T"]), e
                    }
                    return eb(r, [{
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
                }(eC),
                eA = /^(1[0-2]|0?\d)/,
                ek = /^(3[0-1]|[0-2]?\d)/,
                ej = /^(36[0-6]|3[0-5]\d|[0-2]?\d?\d)/,
                eP = /^(5[0-3]|[0-4]?\d)/,
                eT = /^(2[0-3]|[0-1]?\d)/,
                eN = /^(2[0-4]|[0-1]?\d)/,
                eO = /^(1[0-1]|0?\d)/,
                eI = /^(1[0-2]|0?\d)/,
                eU = /^[0-5]?\d/,
                eM = /^[0-5]?\d/,
                e_ = /^\d/,
                eD = /^\d{1,2}/,
                eR = /^\d{1,3}/,
                eB = /^\d{1,4}/,
                eF = /^-?\d+/,
                eL = /^-?\d/,
                eG = /^-?\d{1,2}/,
                eH = /^-?\d{1,3}/,
                eW = /^-?\d{1,4}/,
                eY = /^([+-])(\d{2})(\d{2})?|Z/,
                eV = /^([+-])(\d{2})(\d{2})|Z/,
                ez = /^([+-])(\d{2})(\d{2})((\d{2}))?|Z/,
                eq = /^([+-])(\d{2}):(\d{2})|Z/,
                eX = /^([+-])(\d{2}):(\d{2})(:(\d{2}))?|Z/;

            function e$(e, t) {
                return e ? {
                    value: t(e.value),
                    rest: e.rest
                } : e
            }

            function eQ(e, t) {
                var r = t.match(e);
                return r ? {
                    value: parseInt(r[0], 10),
                    rest: t.slice(r[0].length)
                } : null
            }

            function eK(e, t) {
                var r = t.match(e);
                return r ? "Z" === r[0] ? {
                    value: 0,
                    rest: t.slice(1)
                } : {
                    value: ("+" === r[1] ? 1 : -1) * ((r[2] ? parseInt(r[2], 10) : 0) * 36e5 + (r[3] ? parseInt(r[3], 10) : 0) * 6e4 + (r[5] ? parseInt(r[5], 10) : 0) * 1e3),
                    rest: t.slice(r[0].length)
                } : null
            }

            function eJ(e, t) {
                switch (e) {
                    case 1:
                        return eQ(e_, t);
                    case 2:
                        return eQ(eD, t);
                    case 3:
                        return eQ(eR, t);
                    case 4:
                        return eQ(eB, t);
                    default:
                        return eQ(RegExp("^\\d{1," + e + "}"), t)
                }
            }

            function eZ(e, t) {
                switch (e) {
                    case 1:
                        return eQ(eL, t);
                    case 2:
                        return eQ(eG, t);
                    case 3:
                        return eQ(eH, t);
                    case 4:
                        return eQ(eW, t);
                    default:
                        return eQ(RegExp("^-?\\d{1," + e + "}"), t)
                }
            }

            function e0(e) {
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

            function e1(e, t) {
                var r, n = t > 0,
                    a = n ? t : 1 - t;
                if (a <= 50) r = e || 100;
                else {
                    var o = a + 50;
                    r = e + 100 * Math.floor(o / 100) - 100 * (e >= o % 100)
                }
                return n ? r : 1 - r
            }

            function e2(e) {
                return e % 400 == 0 || e % 4 == 0 && e % 100 != 0
            }
            var e3 = function(e) {
                    ef(r, e);
                    var t = eh(r);

                    function r() {
                        var e;
                        ey(this, r);
                        for (var n = arguments.length, a = Array(n), o = 0; o < n; o++) a[o] = arguments[o];
                        return eg(es(e = t.call.apply(t, [this].concat(a))), "priority", 130), eg(es(e), "incompatibleTokens", ["Y", "R", "u", "w", "I", "i", "e", "c", "t", "T"]), e
                    }
                    return eb(r, [{
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
                                    return e$(eJ(4, e), n);
                                case "yo":
                                    return e$(r.ordinalNumber(e, {
                                        unit: "year"
                                    }), n);
                                default:
                                    return e$(eJ(t.length, e), n)
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
                                var a = e1(r.year, n);
                                return e.setUTCFullYear(a, 0, 1), e.setUTCHours(0, 0, 0, 0), e
                            }
                            var o = "era" in t && 1 !== t.era ? 1 - r.year : r.year;
                            return e.setUTCFullYear(o, 0, 1), e.setUTCHours(0, 0, 0, 0), e
                        }
                    }]), r
                }(eC),
                e4 = {};

            function e6(e, t) {
                j(1, arguments);
                var r, n, a, o, i, u, l, s, c = er(null != (r = null != (n = null != (a = null != (o = null == t ? void 0 : t.weekStartsOn) ? o : null == t || null == (i = t.locale) || null == (u = i.options) ? void 0 : u.weekStartsOn) ? a : e4.weekStartsOn) ? n : null == (l = e4.locale) || null == (s = l.options) ? void 0 : s.weekStartsOn) ? r : 0);
                if (!(c >= 0 && c <= 6)) throw RangeError("weekStartsOn must be between 0 and 6 inclusively");
                var f = P(e),
                    d = f.getUTCDay();
                return f.setUTCDate(f.getUTCDate() - (7 * (d < c) + d - c)), f.setUTCHours(0, 0, 0, 0), f
            }

            function e5(e, t) {
                j(1, arguments);
                var r, n, a, o, i, u, l, s, c = P(e),
                    f = c.getUTCFullYear(),
                    d = er(null != (r = null != (n = null != (a = null != (o = null == t ? void 0 : t.firstWeekContainsDate) ? o : null == t || null == (i = t.locale) || null == (u = i.options) ? void 0 : u.firstWeekContainsDate) ? a : e4.firstWeekContainsDate) ? n : null == (l = e4.locale) || null == (s = l.options) ? void 0 : s.firstWeekContainsDate) ? r : 1);
                if (!(d >= 1 && d <= 7)) throw RangeError("firstWeekContainsDate must be between 1 and 7 inclusively");
                var p = new Date(0);
                p.setUTCFullYear(f + 1, 0, d), p.setUTCHours(0, 0, 0, 0);
                var h = e6(p, t),
                    y = new Date(0);
                y.setUTCFullYear(f, 0, d), y.setUTCHours(0, 0, 0, 0);
                var v = e6(y, t);
                return c.getTime() >= h.getTime() ? f + 1 : c.getTime() >= v.getTime() ? f : f - 1
            }
            var e8 = function(e) {
                ef(r, e);
                var t = eh(r);

                function r() {
                    var e;
                    ey(this, r);
                    for (var n = arguments.length, a = Array(n), o = 0; o < n; o++) a[o] = arguments[o];
                    return eg(es(e = t.call.apply(t, [this].concat(a))), "priority", 130), eg(es(e), "incompatibleTokens", ["y", "R", "u", "Q", "q", "M", "L", "I", "d", "D", "i", "t", "T"]), e
                }
                return eb(r, [{
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
                                return e$(eJ(4, e), n);
                            case "Yo":
                                return e$(r.ordinalNumber(e, {
                                    unit: "year"
                                }), n);
                            default:
                                return e$(eJ(t.length, e), n)
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
                        var a = e5(e, n);
                        if (r.isTwoDigitYear) {
                            var o = e1(r.year, a);
                            return e.setUTCFullYear(o, 0, n.firstWeekContainsDate), e.setUTCHours(0, 0, 0, 0), e6(e, n)
                        }
                        var i = "era" in t && 1 !== t.era ? 1 - r.year : r.year;
                        return e.setUTCFullYear(i, 0, n.firstWeekContainsDate), e.setUTCHours(0, 0, 0, 0), e6(e, n)
                    }
                }]), r
            }(eC);

            function e7(e) {
                j(1, arguments);
                var t = P(e),
                    r = t.getUTCDay();
                return t.setUTCDate(t.getUTCDate() - (7 * (r < 1) + r - 1)), t.setUTCHours(0, 0, 0, 0), t
            }
            var e9 = function(e) {
                    ef(r, e);
                    var t = eh(r);

                    function r() {
                        var e;
                        ey(this, r);
                        for (var n = arguments.length, a = Array(n), o = 0; o < n; o++) a[o] = arguments[o];
                        return eg(es(e = t.call.apply(t, [this].concat(a))), "priority", 130), eg(es(e), "incompatibleTokens", ["G", "y", "Y", "u", "Q", "q", "M", "L", "w", "d", "D", "e", "c", "t", "T"]), e
                    }
                    return eb(r, [{
                        key: "parse",
                        value: function(e, t) {
                            return "R" === t ? eZ(4, e) : eZ(t.length, e)
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            var n = new Date(0);
                            return n.setUTCFullYear(r, 0, 4), n.setUTCHours(0, 0, 0, 0), e7(n)
                        }
                    }]), r
                }(eC),
                te = function(e) {
                    ef(r, e);
                    var t = eh(r);

                    function r() {
                        var e;
                        ey(this, r);
                        for (var n = arguments.length, a = Array(n), o = 0; o < n; o++) a[o] = arguments[o];
                        return eg(es(e = t.call.apply(t, [this].concat(a))), "priority", 130), eg(es(e), "incompatibleTokens", ["G", "y", "Y", "R", "w", "I", "i", "e", "c", "t", "T"]), e
                    }
                    return eb(r, [{
                        key: "parse",
                        value: function(e, t) {
                            return "u" === t ? eZ(4, e) : eZ(t.length, e)
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return e.setUTCFullYear(r, 0, 1), e.setUTCHours(0, 0, 0, 0), e
                        }
                    }]), r
                }(eC),
                tt = function(e) {
                    ef(r, e);
                    var t = eh(r);

                    function r() {
                        var e;
                        ey(this, r);
                        for (var n = arguments.length, a = Array(n), o = 0; o < n; o++) a[o] = arguments[o];
                        return eg(es(e = t.call.apply(t, [this].concat(a))), "priority", 120), eg(es(e), "incompatibleTokens", ["Y", "R", "q", "M", "L", "w", "I", "d", "D", "i", "e", "c", "t", "T"]), e
                    }
                    return eb(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "Q":
                                case "QQ":
                                    return eJ(t.length, e);
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
                }(eC),
                tr = function(e) {
                    ef(r, e);
                    var t = eh(r);

                    function r() {
                        var e;
                        ey(this, r);
                        for (var n = arguments.length, a = Array(n), o = 0; o < n; o++) a[o] = arguments[o];
                        return eg(es(e = t.call.apply(t, [this].concat(a))), "priority", 120), eg(es(e), "incompatibleTokens", ["Y", "R", "Q", "M", "L", "w", "I", "d", "D", "i", "e", "c", "t", "T"]), e
                    }
                    return eb(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "q":
                                case "qq":
                                    return eJ(t.length, e);
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
                }(eC),
                tn = function(e) {
                    ef(r, e);
                    var t = eh(r);

                    function r() {
                        var e;
                        ey(this, r);
                        for (var n = arguments.length, a = Array(n), o = 0; o < n; o++) a[o] = arguments[o];
                        return eg(es(e = t.call.apply(t, [this].concat(a))), "incompatibleTokens", ["Y", "R", "q", "Q", "L", "w", "I", "D", "i", "e", "c", "t", "T"]), eg(es(e), "priority", 110), e
                    }
                    return eb(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            var n = function(e) {
                                return e - 1
                            };
                            switch (t) {
                                case "M":
                                    return e$(eQ(eA, e), n);
                                case "MM":
                                    return e$(eJ(2, e), n);
                                case "Mo":
                                    return e$(r.ordinalNumber(e, {
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
                }(eC),
                ta = function(e) {
                    ef(r, e);
                    var t = eh(r);

                    function r() {
                        var e;
                        ey(this, r);
                        for (var n = arguments.length, a = Array(n), o = 0; o < n; o++) a[o] = arguments[o];
                        return eg(es(e = t.call.apply(t, [this].concat(a))), "priority", 110), eg(es(e), "incompatibleTokens", ["Y", "R", "q", "Q", "M", "w", "I", "D", "i", "e", "c", "t", "T"]), e
                    }
                    return eb(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            var n = function(e) {
                                return e - 1
                            };
                            switch (t) {
                                case "L":
                                    return e$(eQ(eA, e), n);
                                case "LL":
                                    return e$(eJ(2, e), n);
                                case "Lo":
                                    return e$(r.ordinalNumber(e, {
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
                }(eC),
                to = function(e) {
                    ef(r, e);
                    var t = eh(r);

                    function r() {
                        var e;
                        ey(this, r);
                        for (var n = arguments.length, a = Array(n), o = 0; o < n; o++) a[o] = arguments[o];
                        return eg(es(e = t.call.apply(t, [this].concat(a))), "priority", 100), eg(es(e), "incompatibleTokens", ["y", "R", "u", "q", "Q", "M", "L", "I", "d", "D", "i", "t", "T"]), e
                    }
                    return eb(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "w":
                                    return eQ(eP, e);
                                case "wo":
                                    return r.ordinalNumber(e, {
                                        unit: "week"
                                    });
                                default:
                                    return eJ(t.length, e)
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
                            return e6(function(e, t, r) {
                                j(2, arguments);
                                var n = P(e),
                                    a = er(t),
                                    o = function(e, t) {
                                        j(1, arguments);
                                        var r = P(e);
                                        return Math.round((e6(r, t).getTime() - (function(e, t) {
                                            j(1, arguments);
                                            var r, n, a, o, i, u, l, s, c = er(null != (r = null != (n = null != (a = null != (o = null == t ? void 0 : t.firstWeekContainsDate) ? o : null == t || null == (i = t.locale) || null == (u = i.options) ? void 0 : u.firstWeekContainsDate) ? a : e4.firstWeekContainsDate) ? n : null == (l = e4.locale) || null == (s = l.options) ? void 0 : s.firstWeekContainsDate) ? r : 1),
                                                f = e5(e, t),
                                                d = new Date(0);
                                            return d.setUTCFullYear(f, 0, c), d.setUTCHours(0, 0, 0, 0), e6(d, t)
                                        })(r, t).getTime()) / 6048e5) + 1
                                    }(n, r) - a;
                                return n.setUTCDate(n.getUTCDate() - 7 * o), n
                            }(e, r, n), n)
                        }
                    }]), r
                }(eC),
                ti = function(e) {
                    ef(r, e);
                    var t = eh(r);

                    function r() {
                        var e;
                        ey(this, r);
                        for (var n = arguments.length, a = Array(n), o = 0; o < n; o++) a[o] = arguments[o];
                        return eg(es(e = t.call.apply(t, [this].concat(a))), "priority", 100), eg(es(e), "incompatibleTokens", ["y", "Y", "u", "q", "Q", "M", "L", "w", "d", "D", "e", "c", "t", "T"]), e
                    }
                    return eb(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "I":
                                    return eQ(eP, e);
                                case "Io":
                                    return r.ordinalNumber(e, {
                                        unit: "week"
                                    });
                                default:
                                    return eJ(t.length, e)
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
                            return e7(function(e, t) {
                                j(2, arguments);
                                var r = P(e),
                                    n = er(t),
                                    a = function(e) {
                                        j(1, arguments);
                                        var t = P(e);
                                        return Math.round((e7(t).getTime() - (function(e) {
                                            j(1, arguments);
                                            var t = function(e) {
                                                    j(1, arguments);
                                                    var t = P(e),
                                                        r = t.getUTCFullYear(),
                                                        n = new Date(0);
                                                    n.setUTCFullYear(r + 1, 0, 4), n.setUTCHours(0, 0, 0, 0);
                                                    var a = e7(n),
                                                        o = new Date(0);
                                                    o.setUTCFullYear(r, 0, 4), o.setUTCHours(0, 0, 0, 0);
                                                    var i = e7(o);
                                                    return t.getTime() >= a.getTime() ? r + 1 : t.getTime() >= i.getTime() ? r : r - 1
                                                }(e),
                                                r = new Date(0);
                                            return r.setUTCFullYear(t, 0, 4), r.setUTCHours(0, 0, 0, 0), e7(r)
                                        })(t).getTime()) / 6048e5) + 1
                                    }(r) - n;
                                return r.setUTCDate(r.getUTCDate() - 7 * a), r
                            }(e, r))
                        }
                    }]), r
                }(eC),
                tu = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],
                tl = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],
                ts = function(e) {
                    ef(r, e);
                    var t = eh(r);

                    function r() {
                        var e;
                        ey(this, r);
                        for (var n = arguments.length, a = Array(n), o = 0; o < n; o++) a[o] = arguments[o];
                        return eg(es(e = t.call.apply(t, [this].concat(a))), "priority", 90), eg(es(e), "subPriority", 1), eg(es(e), "incompatibleTokens", ["Y", "R", "q", "Q", "w", "I", "D", "i", "e", "c", "t", "T"]), e
                    }
                    return eb(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "d":
                                    return eQ(ek, e);
                                case "do":
                                    return r.ordinalNumber(e, {
                                        unit: "date"
                                    });
                                default:
                                    return eJ(t.length, e)
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            var r = e2(e.getUTCFullYear()),
                                n = e.getUTCMonth();
                            return r ? t >= 1 && t <= tl[n] : t >= 1 && t <= tu[n]
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return e.setUTCDate(r), e.setUTCHours(0, 0, 0, 0), e
                        }
                    }]), r
                }(eC),
                tc = function(e) {
                    ef(r, e);
                    var t = eh(r);

                    function r() {
                        var e;
                        ey(this, r);
                        for (var n = arguments.length, a = Array(n), o = 0; o < n; o++) a[o] = arguments[o];
                        return eg(es(e = t.call.apply(t, [this].concat(a))), "priority", 90), eg(es(e), "subpriority", 1), eg(es(e), "incompatibleTokens", ["Y", "R", "q", "Q", "M", "L", "w", "I", "d", "E", "i", "e", "c", "t", "T"]), e
                    }
                    return eb(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "D":
                                case "DD":
                                    return eQ(ej, e);
                                case "Do":
                                    return r.ordinalNumber(e, {
                                        unit: "date"
                                    });
                                default:
                                    return eJ(t.length, e)
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            return e2(e.getUTCFullYear()) ? t >= 1 && t <= 366 : t >= 1 && t <= 365
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return e.setUTCMonth(0, r), e.setUTCHours(0, 0, 0, 0), e
                        }
                    }]), r
                }(eC);

            function tf(e, t, r) {
                j(2, arguments);
                var n, a, o, i, u, l, s, c, f = er(null != (n = null != (a = null != (o = null != (i = null == r ? void 0 : r.weekStartsOn) ? i : null == r || null == (u = r.locale) || null == (l = u.options) ? void 0 : l.weekStartsOn) ? o : e4.weekStartsOn) ? a : null == (s = e4.locale) || null == (c = s.options) ? void 0 : c.weekStartsOn) ? n : 0);
                if (!(f >= 0 && f <= 6)) throw RangeError("weekStartsOn must be between 0 and 6 inclusively");
                var d = P(e),
                    p = er(t),
                    h = 7 * ((p % 7 + 7) % 7 < f) + p - d.getUTCDay();
                return d.setUTCDate(d.getUTCDate() + h), d
            }
            var td = function(e) {
                    ef(r, e);
                    var t = eh(r);

                    function r() {
                        var e;
                        ey(this, r);
                        for (var n = arguments.length, a = Array(n), o = 0; o < n; o++) a[o] = arguments[o];
                        return eg(es(e = t.call.apply(t, [this].concat(a))), "priority", 90), eg(es(e), "incompatibleTokens", ["D", "i", "e", "c", "t", "T"]), e
                    }
                    return eb(r, [{
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
                            return (e = tf(e, r, n)).setUTCHours(0, 0, 0, 0), e
                        }
                    }]), r
                }(eC),
                tp = function(e) {
                    ef(r, e);
                    var t = eh(r);

                    function r() {
                        var e;
                        ey(this, r);
                        for (var n = arguments.length, a = Array(n), o = 0; o < n; o++) a[o] = arguments[o];
                        return eg(es(e = t.call.apply(t, [this].concat(a))), "priority", 90), eg(es(e), "incompatibleTokens", ["y", "R", "u", "q", "Q", "M", "L", "I", "d", "D", "E", "i", "c", "t", "T"]), e
                    }
                    return eb(r, [{
                        key: "parse",
                        value: function(e, t, r, n) {
                            var a = function(e) {
                                var t = 7 * Math.floor((e - 1) / 7);
                                return (e + n.weekStartsOn + 6) % 7 + t
                            };
                            switch (t) {
                                case "e":
                                case "ee":
                                    return e$(eJ(t.length, e), a);
                                case "eo":
                                    return e$(r.ordinalNumber(e, {
                                        unit: "day"
                                    }), a);
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
                            return (e = tf(e, r, n)).setUTCHours(0, 0, 0, 0), e
                        }
                    }]), r
                }(eC),
                th = function(e) {
                    ef(r, e);
                    var t = eh(r);

                    function r() {
                        var e;
                        ey(this, r);
                        for (var n = arguments.length, a = Array(n), o = 0; o < n; o++) a[o] = arguments[o];
                        return eg(es(e = t.call.apply(t, [this].concat(a))), "priority", 90), eg(es(e), "incompatibleTokens", ["y", "R", "u", "q", "Q", "M", "L", "I", "d", "D", "E", "i", "e", "t", "T"]), e
                    }
                    return eb(r, [{
                        key: "parse",
                        value: function(e, t, r, n) {
                            var a = function(e) {
                                var t = 7 * Math.floor((e - 1) / 7);
                                return (e + n.weekStartsOn + 6) % 7 + t
                            };
                            switch (t) {
                                case "c":
                                case "cc":
                                    return e$(eJ(t.length, e), a);
                                case "co":
                                    return e$(r.ordinalNumber(e, {
                                        unit: "day"
                                    }), a);
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
                            return (e = tf(e, r, n)).setUTCHours(0, 0, 0, 0), e
                        }
                    }]), r
                }(eC),
                ty = function(e) {
                    ef(r, e);
                    var t = eh(r);

                    function r() {
                        var e;
                        ey(this, r);
                        for (var n = arguments.length, a = Array(n), o = 0; o < n; o++) a[o] = arguments[o];
                        return eg(es(e = t.call.apply(t, [this].concat(a))), "priority", 90), eg(es(e), "incompatibleTokens", ["y", "Y", "u", "q", "Q", "M", "L", "w", "d", "D", "E", "e", "c", "t", "T"]), e
                    }
                    return eb(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            var n = function(e) {
                                return 0 === e ? 7 : e
                            };
                            switch (t) {
                                case "i":
                                case "ii":
                                    return eJ(t.length, e);
                                case "io":
                                    return r.ordinalNumber(e, {
                                        unit: "day"
                                    });
                                case "iii":
                                    return e$(r.day(e, {
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
                                    return e$(r.day(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    }), n);
                                case "iiiiii":
                                    return e$(r.day(e, {
                                        width: "short",
                                        context: "formatting"
                                    }) || r.day(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    }), n);
                                default:
                                    return e$(r.day(e, {
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
                                j(2, arguments);
                                var r = er(t);
                                r % 7 == 0 && (r -= 7);
                                var n = P(e),
                                    a = 7 * ((r % 7 + 7) % 7 < 1) + r - n.getUTCDay();
                                return n.setUTCDate(n.getUTCDate() + a), n
                            }(e, r)).setUTCHours(0, 0, 0, 0), e
                        }
                    }]), r
                }(eC),
                tv = function(e) {
                    ef(r, e);
                    var t = eh(r);

                    function r() {
                        var e;
                        ey(this, r);
                        for (var n = arguments.length, a = Array(n), o = 0; o < n; o++) a[o] = arguments[o];
                        return eg(es(e = t.call.apply(t, [this].concat(a))), "priority", 80), eg(es(e), "incompatibleTokens", ["b", "B", "H", "k", "t", "T"]), e
                    }
                    return eb(r, [{
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
                            return e.setUTCHours(e0(r), 0, 0, 0), e
                        }
                    }]), r
                }(eC),
                tm = function(e) {
                    ef(r, e);
                    var t = eh(r);

                    function r() {
                        var e;
                        ey(this, r);
                        for (var n = arguments.length, a = Array(n), o = 0; o < n; o++) a[o] = arguments[o];
                        return eg(es(e = t.call.apply(t, [this].concat(a))), "priority", 80), eg(es(e), "incompatibleTokens", ["a", "B", "H", "k", "t", "T"]), e
                    }
                    return eb(r, [{
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
                            return e.setUTCHours(e0(r), 0, 0, 0), e
                        }
                    }]), r
                }(eC),
                tb = function(e) {
                    ef(r, e);
                    var t = eh(r);

                    function r() {
                        var e;
                        ey(this, r);
                        for (var n = arguments.length, a = Array(n), o = 0; o < n; o++) a[o] = arguments[o];
                        return eg(es(e = t.call.apply(t, [this].concat(a))), "priority", 80), eg(es(e), "incompatibleTokens", ["a", "b", "t", "T"]), e
                    }
                    return eb(r, [{
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
                            return e.setUTCHours(e0(r), 0, 0, 0), e
                        }
                    }]), r
                }(eC),
                tg = function(e) {
                    ef(r, e);
                    var t = eh(r);

                    function r() {
                        var e;
                        ey(this, r);
                        for (var n = arguments.length, a = Array(n), o = 0; o < n; o++) a[o] = arguments[o];
                        return eg(es(e = t.call.apply(t, [this].concat(a))), "priority", 70), eg(es(e), "incompatibleTokens", ["H", "K", "k", "t", "T"]), e
                    }
                    return eb(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "h":
                                    return eQ(eI, e);
                                case "ho":
                                    return r.ordinalNumber(e, {
                                        unit: "hour"
                                    });
                                default:
                                    return eJ(t.length, e)
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
                }(eC),
                tw = function(e) {
                    ef(r, e);
                    var t = eh(r);

                    function r() {
                        var e;
                        ey(this, r);
                        for (var n = arguments.length, a = Array(n), o = 0; o < n; o++) a[o] = arguments[o];
                        return eg(es(e = t.call.apply(t, [this].concat(a))), "priority", 70), eg(es(e), "incompatibleTokens", ["a", "b", "h", "K", "k", "t", "T"]), e
                    }
                    return eb(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "H":
                                    return eQ(eT, e);
                                case "Ho":
                                    return r.ordinalNumber(e, {
                                        unit: "hour"
                                    });
                                default:
                                    return eJ(t.length, e)
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
                }(eC),
                tS = function(e) {
                    ef(r, e);
                    var t = eh(r);

                    function r() {
                        var e;
                        ey(this, r);
                        for (var n = arguments.length, a = Array(n), o = 0; o < n; o++) a[o] = arguments[o];
                        return eg(es(e = t.call.apply(t, [this].concat(a))), "priority", 70), eg(es(e), "incompatibleTokens", ["h", "H", "k", "t", "T"]), e
                    }
                    return eb(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "K":
                                    return eQ(eO, e);
                                case "Ko":
                                    return r.ordinalNumber(e, {
                                        unit: "hour"
                                    });
                                default:
                                    return eJ(t.length, e)
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
                }(eC),
                tx = function(e) {
                    ef(r, e);
                    var t = eh(r);

                    function r() {
                        var e;
                        ey(this, r);
                        for (var n = arguments.length, a = Array(n), o = 0; o < n; o++) a[o] = arguments[o];
                        return eg(es(e = t.call.apply(t, [this].concat(a))), "priority", 70), eg(es(e), "incompatibleTokens", ["a", "b", "h", "H", "K", "t", "T"]), e
                    }
                    return eb(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "k":
                                    return eQ(eN, e);
                                case "ko":
                                    return r.ordinalNumber(e, {
                                        unit: "hour"
                                    });
                                default:
                                    return eJ(t.length, e)
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
                }(eC),
                tC = function(e) {
                    ef(r, e);
                    var t = eh(r);

                    function r() {
                        var e;
                        ey(this, r);
                        for (var n = arguments.length, a = Array(n), o = 0; o < n; o++) a[o] = arguments[o];
                        return eg(es(e = t.call.apply(t, [this].concat(a))), "priority", 60), eg(es(e), "incompatibleTokens", ["t", "T"]), e
                    }
                    return eb(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "m":
                                    return eQ(eU, e);
                                case "mo":
                                    return r.ordinalNumber(e, {
                                        unit: "minute"
                                    });
                                default:
                                    return eJ(t.length, e)
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
                }(eC),
                tE = function(e) {
                    ef(r, e);
                    var t = eh(r);

                    function r() {
                        var e;
                        ey(this, r);
                        for (var n = arguments.length, a = Array(n), o = 0; o < n; o++) a[o] = arguments[o];
                        return eg(es(e = t.call.apply(t, [this].concat(a))), "priority", 50), eg(es(e), "incompatibleTokens", ["t", "T"]), e
                    }
                    return eb(r, [{
                        key: "parse",
                        value: function(e, t, r) {
                            switch (t) {
                                case "s":
                                    return eQ(eM, e);
                                case "so":
                                    return r.ordinalNumber(e, {
                                        unit: "second"
                                    });
                                default:
                                    return eJ(t.length, e)
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
                }(eC),
                tA = function(e) {
                    ef(r, e);
                    var t = eh(r);

                    function r() {
                        var e;
                        ey(this, r);
                        for (var n = arguments.length, a = Array(n), o = 0; o < n; o++) a[o] = arguments[o];
                        return eg(es(e = t.call.apply(t, [this].concat(a))), "priority", 30), eg(es(e), "incompatibleTokens", ["t", "T"]), e
                    }
                    return eb(r, [{
                        key: "parse",
                        value: function(e, t) {
                            return e$(eJ(t.length, e), function(e) {
                                return Math.floor(e * Math.pow(10, -t.length + 3))
                            })
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return e.setUTCMilliseconds(r), e
                        }
                    }]), r
                }(eC),
                tk = function(e) {
                    ef(r, e);
                    var t = eh(r);

                    function r() {
                        var e;
                        ey(this, r);
                        for (var n = arguments.length, a = Array(n), o = 0; o < n; o++) a[o] = arguments[o];
                        return eg(es(e = t.call.apply(t, [this].concat(a))), "priority", 10), eg(es(e), "incompatibleTokens", ["t", "T", "x"]), e
                    }
                    return eb(r, [{
                        key: "parse",
                        value: function(e, t) {
                            switch (t) {
                                case "X":
                                    return eK(eY, e);
                                case "XX":
                                    return eK(eV, e);
                                case "XXXX":
                                    return eK(ez, e);
                                case "XXXXX":
                                    return eK(eX, e);
                                default:
                                    return eK(eq, e)
                            }
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return t.timestampIsSet ? e : new Date(e.getTime() - r)
                        }
                    }]), r
                }(eC),
                tj = function(e) {
                    ef(r, e);
                    var t = eh(r);

                    function r() {
                        var e;
                        ey(this, r);
                        for (var n = arguments.length, a = Array(n), o = 0; o < n; o++) a[o] = arguments[o];
                        return eg(es(e = t.call.apply(t, [this].concat(a))), "priority", 10), eg(es(e), "incompatibleTokens", ["t", "T", "X"]), e
                    }
                    return eb(r, [{
                        key: "parse",
                        value: function(e, t) {
                            switch (t) {
                                case "x":
                                    return eK(eY, e);
                                case "xx":
                                    return eK(eV, e);
                                case "xxxx":
                                    return eK(ez, e);
                                case "xxxxx":
                                    return eK(eX, e);
                                default:
                                    return eK(eq, e)
                            }
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return t.timestampIsSet ? e : new Date(e.getTime() - r)
                        }
                    }]), r
                }(eC),
                tP = function(e) {
                    ef(r, e);
                    var t = eh(r);

                    function r() {
                        var e;
                        ey(this, r);
                        for (var n = arguments.length, a = Array(n), o = 0; o < n; o++) a[o] = arguments[o];
                        return eg(es(e = t.call.apply(t, [this].concat(a))), "priority", 40), eg(es(e), "incompatibleTokens", "*"), e
                    }
                    return eb(r, [{
                        key: "parse",
                        value: function(e) {
                            return eQ(eF, e)
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return [new Date(1e3 * r), {
                                timestampIsSet: !0
                            }]
                        }
                    }]), r
                }(eC),
                tT = function(e) {
                    ef(r, e);
                    var t = eh(r);

                    function r() {
                        var e;
                        ey(this, r);
                        for (var n = arguments.length, a = Array(n), o = 0; o < n; o++) a[o] = arguments[o];
                        return eg(es(e = t.call.apply(t, [this].concat(a))), "priority", 20), eg(es(e), "incompatibleTokens", "*"), e
                    }
                    return eb(r, [{
                        key: "parse",
                        value: function(e) {
                            return eQ(eF, e)
                        }
                    }, {
                        key: "set",
                        value: function(e, t, r) {
                            return [new Date(r), {
                                timestampIsSet: !0
                            }]
                        }
                    }]), r
                }(eC),
                tN = {
                    G: new eE,
                    y: new e3,
                    Y: new e8,
                    R: new e9,
                    u: new te,
                    Q: new tt,
                    q: new tr,
                    M: new tn,
                    L: new ta,
                    w: new to,
                    I: new ti,
                    d: new ts,
                    D: new tc,
                    E: new td,
                    e: new tp,
                    c: new th,
                    i: new ty,
                    a: new tv,
                    b: new tm,
                    B: new tb,
                    h: new tg,
                    H: new tw,
                    K: new tS,
                    k: new tx,
                    m: new tC,
                    s: new tE,
                    S: new tA,
                    X: new tk,
                    x: new tj,
                    t: new tP,
                    T: new tT
                },
                tO = /[yYQqMLwIdDecihHKkms]o|(\w)\1*|''|'(''|[^'])+('|$)|./g,
                tI = /P+p+|P+|p+|''|'(''|[^'])+('|$)|./g,
                tU = /^'([^]*?)'?$/,
                tM = /''/g,
                t_ = /\S/,
                tD = /[a-zA-Z]/;

            function tR(e, t, r, n) {
                j(3, arguments);
                var a = String(e),
                    o = String(t),
                    i = null != (s = null != (c = null == n ? void 0 : n.locale) ? c : e4.locale) ? s : et;
                if (!i.match) throw RangeError("locale must contain match property");
                var u = er(null != (f = null != (d = null != (p = null != (h = null == n ? void 0 : n.firstWeekContainsDate) ? h : null == n || null == (y = n.locale) || null == (v = y.options) ? void 0 : v.firstWeekContainsDate) ? p : e4.firstWeekContainsDate) ? d : null == (m = e4.locale) || null == (b = m.options) ? void 0 : b.firstWeekContainsDate) ? f : 1);
                if (!(u >= 1 && u <= 7)) throw RangeError("firstWeekContainsDate must be between 1 and 7 inclusively");
                var l = er(null != (g = null != (w = null != (S = null != (x = null == n ? void 0 : n.weekStartsOn) ? x : null == n || null == (C = n.locale) || null == (E = C.options) ? void 0 : E.weekStartsOn) ? S : e4.weekStartsOn) ? w : null == (A = e4.locale) || null == (T = A.options) ? void 0 : T.weekStartsOn) ? g : 0);
                if (!(l >= 0 && l <= 6)) throw RangeError("weekStartsOn must be between 0 and 6 inclusively");
                if ("" === o)
                    if ("" === a) return P(r);
                    else return new Date(NaN);
                var s, c, f, d, p, h, y, v, m, b, g, w, S, x, C, E, A, T, N, O = {
                        firstWeekContainsDate: u,
                        weekStartsOn: l,
                        locale: i
                    },
                    I = [new ex],
                    U = o.match(tI).map(function(e) {
                        var t = e[0];
                        return t in eo ? (0, eo[t])(e, i.formatLong) : e
                    }).join("").match(tO),
                    M = [],
                    _ = X(U);
                try {
                    for (_.s(); !(N = _.n()).done;) {
                        var D = function() {
                            var t, r, u = N.value;
                            null != n && n.useAdditionalWeekYearTokens || (t = u, -1 === eu.indexOf(t)) || el(u, o, e), null != n && n.useAdditionalDayOfYearTokens || (r = u, -1 === ei.indexOf(r)) || el(u, o, e);
                            var l = u[0],
                                s = tN[l];
                            if (s) {
                                var c = s.incompatibleTokens;
                                if (Array.isArray(c)) {
                                    var f = M.find(function(e) {
                                        return c.includes(e.token) || e.token === l
                                    });
                                    if (f) throw RangeError("The format string mustn't contain `".concat(f.fullToken, "` and `").concat(u, "` at the same time"))
                                } else if ("*" === s.incompatibleTokens && M.length > 0) throw RangeError("The format string mustn't contain `".concat(u, "` and any other token at the same time"));
                                M.push({
                                    token: l,
                                    fullToken: u
                                });
                                var d = s.run(a, u, i.match, O);
                                if (!d) return {
                                    v: new Date(NaN)
                                };
                                I.push(d.setter), a = d.rest
                            } else {
                                if (l.match(tD)) throw RangeError("Format string contains an unescaped latin alphabet character `" + l + "`");
                                if ("''" === u ? u = "'" : "'" === l && (u = u.match(tU)[1].replace(tM, "'")), 0 !== a.indexOf(u)) return {
                                    v: new Date(NaN)
                                };
                                a = a.slice(u.length)
                            }
                        }();
                        if ("object" === k(D)) return D.v
                    }
                } catch (e) {
                    _.e(e)
                } finally {
                    _.f()
                }
                if (a.length > 0 && t_.test(a)) return new Date(NaN);
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
                    B = P(r);
                if (isNaN(B.getTime())) return new Date(NaN);
                var F, L, G = function(e, t) {
                        return j(2, arguments),
                            function(e, t) {
                                return j(2, arguments), new Date(P(e).getTime() + er(t))
                            }(e, -er(t))
                    }(B, ((F = new Date(Date.UTC(B.getFullYear(), B.getMonth(), B.getDate(), B.getHours(), B.getMinutes(), B.getSeconds(), B.getMilliseconds()))).setUTCFullYear(B.getFullYear()), B.getTime() - F.getTime())),
                    H = {},
                    W = X(R);
                try {
                    for (W.s(); !(L = W.n()).done;) {
                        var Y = L.value;
                        if (!Y.validate(G, O)) return new Date(NaN);
                        var V = Y.set(G, H, O);
                        Array.isArray(V) ? (G = V[0], function(e, t) {
                            if (null == e) throw TypeError("assign requires that input parameter not be null or undefined");
                            for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
                        }(H, V[1])) : G = V
                    }
                } catch (e) {
                    W.e(e)
                } finally {
                    W.f()
                }
                return G
            }
            var tB = function(e, t) {
                    return new g.Intl().getDateTimeFormatter().getCustomDateTime(new Date(e, t - 1), {
                        year: "2-digit",
                        month: "2-digit"
                    })
                },
                tF = function(e) {
                    var t = tR(e, "MM/yy", new Date);
                    return "Invalid Date" === t.toString() ? [0, 0] : [t.getMonth() + 1, t.getFullYear()]
                },
                tL = function(e) {
                    var t = tR(e, "MM/yy", new Date);
                    return "Invalid Date" === t.toString() ? new Date : t
                },
                tG = window.CoreUtilities,
                tH = function() {
                    return tG.urlService.getAbsoluteUrl("/my/account#!/billing")
                },
                tW = {
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
                tY = function(e) {
                    var t = tW[e.trim().toLowerCase()];
                    return t || e.toLowerCase()
                },
                tV = ((t = {}).RemovePaymentProfileNotAllowedFailure = "RemovePaymentProfileNotAllowedFailure", t),
                tz = "AddCardClicked",
                tq = "CancelAddCardInModalClicked",
                tX = "AddCardSubmitInModalClicked",
                t$ = "DeleteSavedPaymentMethodButtonClicked",
                tQ = "CancelCardDeletionInModalButtonClicked",
                tK = "UpdateCardClicked",
                tJ = "DeleteCardInModalButtonClicked",
                tZ = "StripeCustomerEmailAlreadyExists",
                t0 = "StripeCustomerEmailDoesNotExist",
                t1 = "ConvertCreditToRobuxButtonClicked",
                t2 = "UserHasNoSubscription",
                t3 = "SubscribeButtonClicked",
                t4 = "CancelSubscriptionButtonClicked",
                t6 = "CannotDeleteCardWithSubscriptionError",
                t5 = "GetPaymentProfileSetupCalled",
                t8 = "GetPaymentProfileSetupSucceeded",
                t7 = "GetPaymentProfileSetupFailed",
                t9 = "GetUserBirthdateCalled",
                re = "GetUserBirthdateSucceeded",
                rt = "GetUserBirthdateFailed",
                rr = "GetSavedPaymentProfilesCalled",
                rn = "GetSavedPaymentProfilesSucceeded",
                ra = "GetSavedPaymentProfilesFailed",
                ro = "GetSavedPaymentProfilesReturnsNone",
                ri = "DeleteSavedPaymentProfileCalled",
                ru = "DeleteSavedPaymentProfileSucceeded",
                rl = "DeleteSavedPaymentProfileFailed",
                rs = "GetUserPremiumSubscriptionCalled",
                rc = "GetUserPremiumSubscriptionSucceeded",
                rf = "GetUserPremiumSubscriptionFailed",
                rd = "GetCreditConversionMetadataCalled",
                rp = "GetCreditConversionMetadataSucceeded",
                rh = "GetCreditConversionMetadataFailed",
                ry = "GetCreditConversionMetadataCurrencyCodeNull",
                rv = "VerifyPaymentProfileCreationCalled",
                rm = "VerifyPaymentProfileCreationSucceeded",
                rb = "VerifyPaymentProfileCreationFailed",
                rg = "UpdateSavedPaymentProfileCalled",
                rw = "UpdateSavedPaymentProfileSucceeded",
                rS = "UpdateSavedPaymentProfileFailed",
                rx = "LoadStripeCalled",
                rC = "LoadStripeSucceeded",
                rE = "LoadStripeFailed",
                rA = "StripeConfirmSetupIntentCalled",
                rk = "StripeConfirmSetupIntentSucceeded",
                rj = "StripeConfirmSetupIntentFailed",
                rP = "incorrect_cvc",
                rT = "expired_card",
                rN = "CanChangeSetting",
                rO = "account_management/SettingsChange";

            function rI(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rU(e, t, r, n, a, o, i) {
                try {
                    var u = e[o](i),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, a)
            }

            function rM(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, a) {
                        var o = e.apply(t, r);

                        function i(e) {
                            rU(o, n, a, i, u, "next", e)
                        }

                        function u(e) {
                            rU(o, n, a, i, u, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function r_(e, t) {
                if (e) {
                    if ("string" == typeof e) return rI(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rI(e, t)
                }
            }

            function rD(e, t) {
                var r, n, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    u = Object.defineProperty;
                return u(i, "next", {
                    value: l(0)
                }), u(i, "throw", {
                    value: l(1)
                }), u(i, "return", {
                    value: l(2)
                }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function l(u) {
                    return function(l) {
                        var s = [u, l];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, s[0] && (o = 0)), o;) try {
                            if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                            switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                case 0:
                                case 1:
                                    a = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < a[1]) {
                                        o.label = a[1], a = s;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(s);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], n = 0
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
            var rR = ((n = {}).Stripe = "Stripe", n),
                rB = function(e) {
                    return {
                        withCredentials: !0,
                        url: "".concat(g.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-profile/").concat(e)
                    }
                },
                rF = function(e) {
                    var t = {
                        retryable: !1,
                        withCredentials: !0,
                        url: "".concat(g.EnvironmentUrls.premiumFeaturesApi, "/v1/users/").concat(e, "/subscriptions")
                    };
                    return tG.httpService.get(t)
                },
                rL = function() {
                    return rM(function() {
                        var e, t, r, n, a, o, i;
                        return rD(this, function(u) {
                            switch (u.label) {
                                case 0:
                                    e = !1, t = !1, r = 0, n = 0, a = "USD", o = !1, u.label = 1;
                                case 1:
                                    return u.trys.push([1, 3, , 4]), (0, N.fireEvent)(rd), [4, rM(function() {
                                        var e;
                                        return rD(this, function(t) {
                                            return e = {
                                                withCredentials: !0,
                                                url: "".concat(g.EnvironmentUrls.apiGatewayUrl, "/credit-balance/v1/get-conversion-metadata")
                                            }, [2, tG.httpService.get(e)]
                                        })
                                    })()];
                                case 2:
                                    return (i = u.sent().data).creditBalance >= 0 && null !== i.currencyCode ? (n = i.creditBalance, a = i.currencyCode, o = i.isConvertAllFlowEnabled) : (e = !0, (0, N.fireEvent)(ry)), i.robuxConversionAmount > 0 && (r = i.robuxConversionAmount), t = i.isConvertAllFlowEnabled && i.creditBalance > 0 || i.robuxConversionAmount > 0, (0, N.fireEvent)(rp), [2, [e, t, r, n, a, o]];
                                case 3:
                                    throw u.sent(), (0, N.fireEvent)(rh), Error("Failed to get Robux conversion metadata.");
                                case 4:
                                    return [2]
                            }
                        })
                    })()
                },
                rG = ((a = {}).GlobalTeen = "globalTeen", a.U13 = "u13", a.O18 = "o18", a),
                rH = function() {
                    return rM(function() {
                        var e;
                        return rD(this, function(t) {
                            switch (t.label) {
                                case 0:
                                    return e = {
                                        withCredentials: !0,
                                        url: "".concat(g.EnvironmentUrls.billingApi, "/v1/parental-controls/get-settings")
                                    }, [4, tG.httpService.get(e)];
                                case 1:
                                    return [2, t.sent().data]
                            }
                        })
                    })()
                },
                rW = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : void 0,
                        r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : [];
                    return rM(function() {
                        var n, a, o, i, u;
                        return rD(this, function(l) {
                            switch (l.label) {
                                case 0:
                                    n = {
                                        withCredentials: !0,
                                        url: "".concat(g.EnvironmentUrls.apiGatewayUrl, "/parental-controls-api/v1/parental-controls/consents")
                                    }, l.label = 1;
                                case 1:
                                    return l.trys.push([1, 5, , 6]), [4, tG.httpService.get(n, {
                                        childUserId: e,
                                        consentStatus: "Pending",
                                        consentType: "UpdateUserSetting",
                                        cursor: t
                                    })];
                                case 2:
                                    var s;
                                    if (i = (o = l.sent().data).consents, u = o.nextCursor, (a = r).push.apply(a, function(e) {
                                            if (Array.isArray(e)) return rI(e)
                                        }(s = i || []) || function(e) {
                                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                        }(s) || r_(s) || function() {
                                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                        }()), !u) return [3, 4];
                                    return [4, rW(e, u, r)];
                                case 3:
                                    l.sent(), l.label = 4;
                                case 4:
                                    return [2, r];
                                case 5:
                                    throw l.sent(), Error("Failed to fetch pending consent requests");
                                case 6:
                                    return [2]
                            }
                        })
                    })()
                },
                rY = "Heading.SavedCreditCard.Payments",
                rV = "Heading.SavedCreditCard.CreditOrDebitCard",
                rz = "Heading.SavedCreditCard.BillingAddress",
                rq = "Heading.AskMoreRobux",
                rX = "Header.CancelRequest",
                r$ = "Heading.MonthlySpendingLimit",
                rQ = "Action.Cancel",
                rK = "Action.Save",
                rJ = "Description.SavedCreditCard.SavePaymentMethodSomethingWentWrong",
                rZ = "Response.SavedCreditCard.GenericSomethingWentWrong",
                r0 = "Description.SuccessDialogMessage";

            function r1(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function r2(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (r = a.next()).done) && (o.push(r.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, n = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return r1(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return r1(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var r3 = function() {
                var e = r2((0, E.createModal)(), 2),
                    t = e[0],
                    r = e[1];
                return [function(e) {
                    var n = e.header,
                        a = e.cancelText,
                        o = e.translate,
                        i = e.onDelete,
                        u = e.onNeutral,
                        l = r2((0, x.useState)(!1), 2),
                        s = l[0],
                        c = l[1];
                    return (0, b.jsx)(t, {
                        id: "add-card-modal",
                        title: n,
                        body: a,
                        loading: s,
                        neutralButtonText: o(rQ),
                        actionButtonText: o("Action.Delete"),
                        onNeutral: function() {
                            null == u || u(), r.close()
                        },
                        onAction: function() {
                            c(!0), i(), c(!1), r.close()
                        },
                        closeable: !0,
                        size: "md",
                        actionButtonShow: !0
                    })
                }, r]
            };

            function r4(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function r6(e, t, r, n, a, o, i) {
                try {
                    var u = e[o](i),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, a)
            }
            var r5 = function() {
                var e, t = function(e) {
                        if (Array.isArray(e)) return e
                    }(e = r3()) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var a = [],
                                o = !0,
                                i = !1;
                            try {
                                for (n = n.call(e); !(o = (t = n.next()).done) && (a.push(t.value), 2 !== a.length); o = !0);
                            } catch (e) {
                                i = !0, r = e
                            } finally {
                                try {
                                    o || null == n.return || n.return()
                                } finally {
                                    if (i) throw r
                                }
                            }
                            return a
                        }
                    }(e) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return r4(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return r4(e, 2)
                        }
                    }(e) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    r = t[0];
                return [function(e) {
                    var t = e.translate,
                        n = e.systemFeedbackService,
                        a = e.cannotDeletePaymentMethodModalService,
                        o = e.onDeleteSuccess,
                        i = e.paymentProfileId,
                        u = t("Heading.SavedCreditCard.DeletePaymentMethod"),
                        l = t("Description.SavedCreditCard.AreYouSureDeletePaymentMethod");
                    return (0, b.jsx)(r, {
                        translate: t,
                        header: u,
                        cancelText: l,
                        onDelete: function() {
                            var e;
                            return (e = function() {
                                var e;
                                return function(e, t) {
                                    var r, n, a, o = {
                                            label: 0,
                                            sent: function() {
                                                if (1 & a[0]) throw a[1];
                                                return a[1]
                                            },
                                            trys: [],
                                            ops: []
                                        },
                                        i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                        u = Object.defineProperty;
                                    return u(i, "next", {
                                        value: l(0)
                                    }), u(i, "throw", {
                                        value: l(1)
                                    }), u(i, "return", {
                                        value: l(2)
                                    }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                                        value: function() {
                                            return this
                                        }
                                    }), i;

                                    function l(u) {
                                        return function(l) {
                                            var s = [u, l];
                                            if (r) throw TypeError("Generator is already executing.");
                                            for (; i && (i = 0, s[0] && (o = 0)), o;) try {
                                                if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                                                switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                                    case 0:
                                                    case 1:
                                                        a = s;
                                                        break;
                                                    case 4:
                                                        return o.label++, {
                                                            value: s[1],
                                                            done: !1
                                                        };
                                                    case 5:
                                                        o.label++, n = s[1], s = [0];
                                                        continue;
                                                    case 7:
                                                        s = o.ops.pop(), o.trys.pop();
                                                        continue;
                                                    default:
                                                        if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                            o = 0;
                                                            continue
                                                        }
                                                        if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                                            o.label = s[1];
                                                            break
                                                        }
                                                        if (6 === s[0] && o.label < a[1]) {
                                                            o.label = a[1], a = s;
                                                            break
                                                        }
                                                        if (a && o.label < a[2]) {
                                                            o.label = a[2], o.ops.push(s);
                                                            break
                                                        }
                                                        a[2] && o.ops.pop(), o.trys.pop();
                                                        continue
                                                }
                                                s = t.call(e, o)
                                            } catch (e) {
                                                s = [6, e], n = 0
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
                                }(this, function(r) {
                                    switch (r.label) {
                                        case 0:
                                            (0, N.fireEvent)(tJ), r.label = 1;
                                        case 1:
                                            return r.trys.push([1, 3, , 4]), (0, N.fireEvent)(ri), [4, rM(function() {
                                                var e;
                                                return rD(this, function(t) {
                                                    return e = rB(i), [2, tG.httpService.delete(e)]
                                                })
                                            })()];
                                        case 2:
                                            return 200 === r.sent().status && ((0, N.fireEvent)(ru), n.success(t("Description.SavedCreditCard.DeletePaymentMethodSuccess")), o()), [3, 4];
                                        case 3:
                                            return (null == (e = r.sent()) ? void 0 : e.status) === 412 && (null == e ? void 0 : e.data) === tV.RemovePaymentProfileNotAllowedFailure ? ((0, N.fireEvent)(t6), a.open()) : ((0, N.fireEvent)(rl), n.warning(t(rZ))), [3, 4];
                                        case 4:
                                            return [2]
                                    }
                                })
                            }, function() {
                                var t = this,
                                    r = arguments;
                                return new Promise(function(n, a) {
                                    var o = e.apply(t, r);

                                    function i(e) {
                                        r6(o, n, a, i, u, "next", e)
                                    }

                                    function u(e) {
                                        r6(o, n, a, i, u, "throw", e)
                                    }
                                    i(void 0)
                                })
                            })()
                        },
                        onNeutral: function() {
                            (0, N.fireEvent)(tQ)
                        }
                    })
                }, t[1]]
            };

            function r8(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var r7 = function() {
                var e, t = function(e) {
                        if (Array.isArray(e)) return e
                    }(e = (0, E.createModal)()) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var a = [],
                                o = !0,
                                i = !1;
                            try {
                                for (n = n.call(e); !(o = (t = n.next()).done) && (a.push(t.value), 2 !== a.length); o = !0);
                            } catch (e) {
                                i = !0, r = e
                            } finally {
                                try {
                                    o || null == n.return || n.return()
                                } finally {
                                    if (i) throw r
                                }
                            }
                            return a
                        }
                    }(e) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return r8(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return r8(e, 2)
                        }
                    }(e) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    r = t[0],
                    n = t[1];
                return [function(e) {
                    var t = e.translate,
                        a = t("Heading.SavedCreditCard.CannotDeletePaymentMethod"),
                        o = (0, b.jsx)("div", {
                            className: "cannot-delete-payment-method-text",
                            children: t("Description.SavedCreditCard.CannotDeletePaymentMethod")
                        });
                    return (0, b.jsx)(r, {
                        id: "cannot-delete-card-modal",
                        title: a,
                        body: o,
                        neutralButtonText: t("Action.GotIt") || "Got it",
                        onNeutral: function() {
                            n.close()
                        },
                        closeable: !0,
                        size: "md"
                    })
                }, n]
            };

            function r9(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ne(e, t, r, n, a, o, i) {
                try {
                    var u = e[o](i),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, a)
            }

            function nt(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (r = a.next()).done) && (o.push(r.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, n = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return r9(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return r9(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var nr = function() {
                var e = nt((0, x.useState)(!1), 2),
                    t = e[0],
                    r = e[1],
                    n = (0, x.useMemo)(function() {
                        return {
                            open: function() {
                                r(!0)
                            },
                            close: function() {
                                r(!1)
                            }
                        }
                    }, []);
                return [function(e) {
                    var r = e.translate,
                        a = e.onUpdateSuccess,
                        o = e.systemFeedbackService,
                        i = e.paymentProfileId,
                        u = e.cardType,
                        l = e.lastFour,
                        s = e.expMonth,
                        c = e.expYear,
                        f = nt((0, x.useState)(!1), 2),
                        d = f[0],
                        p = f[1],
                        h = nt((0, x.useState)(!1), 2),
                        y = h[0],
                        v = h[1],
                        m = nt((0, x.useState)(tB(c, s)), 2),
                        g = m[0],
                        w = m[1],
                        S = nt((0, x.useState)(!1), 2),
                        C = S[0],
                        A = S[1],
                        k = r("Heading.SavedCreditCard.UpdatePaymentMethod"),
                        j = {
                            __html: r("Description.SavedCreditCard.StripeUpdatePaymentMethodDisclosure", {
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
                    (0, x.useEffect)(function() {
                        t || w(tB(c, s)), A(!1), v(!1)
                    }, [s, c]), (0, x.useEffect)(function() {
                        var e = new Date(c, s - 1),
                            t = tL(g),
                            r = new Date(new Date().getFullYear(), new Date().getMonth());
                        v(t !== e && t >= r), A(t < r || t < e)
                    }, [s, c, g]);
                    var P = (0, x.useCallback)(function() {
                        var e;
                        return (e = function() {
                            var e, t, u;
                            return function(e, t) {
                                var r, n, a, o = {
                                        label: 0,
                                        sent: function() {
                                            if (1 & a[0]) throw a[1];
                                            return a[1]
                                        },
                                        trys: [],
                                        ops: []
                                    },
                                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                    u = Object.defineProperty;
                                return u(i, "next", {
                                    value: l(0)
                                }), u(i, "throw", {
                                    value: l(1)
                                }), u(i, "return", {
                                    value: l(2)
                                }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                                    value: function() {
                                        return this
                                    }
                                }), i;

                                function l(u) {
                                    return function(l) {
                                        var s = [u, l];
                                        if (r) throw TypeError("Generator is already executing.");
                                        for (; i && (i = 0, s[0] && (o = 0)), o;) try {
                                            if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                                            switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                                case 0:
                                                case 1:
                                                    a = s;
                                                    break;
                                                case 4:
                                                    return o.label++, {
                                                        value: s[1],
                                                        done: !1
                                                    };
                                                case 5:
                                                    o.label++, n = s[1], s = [0];
                                                    continue;
                                                case 7:
                                                    s = o.ops.pop(), o.trys.pop();
                                                    continue;
                                                default:
                                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                        o = 0;
                                                        continue
                                                    }
                                                    if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                                        o.label = s[1];
                                                        break
                                                    }
                                                    if (6 === s[0] && o.label < a[1]) {
                                                        o.label = a[1], a = s;
                                                        break
                                                    }
                                                    if (a && o.label < a[2]) {
                                                        o.label = a[2], o.ops.push(s);
                                                        break
                                                    }
                                                    a[2] && o.ops.pop(), o.trys.pop();
                                                    continue
                                            }
                                            s = t.call(e, o)
                                        } catch (e) {
                                            s = [6, e], n = 0
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
                            }(this, function(l) {
                                switch (l.label) {
                                    case 0:
                                        p(!0), l.label = 1;
                                    case 1:
                                        var s, c;
                                        return l.trys.push([1, 3, , 4]), t = (e = nt(tF(g), 2))[0], u = e[1], (0, N.fireEvent)(rg), [4, (s = t, c = u, rM(function() {
                                            var e;
                                            return rD(this, function(t) {
                                                return e = rB(i), [2, tG.httpService.post(e, {
                                                    expirationMonth: s,
                                                    expirationYear: c
                                                })]
                                            })
                                        })())];
                                    case 2:
                                        return 200 === l.sent().status && ((0, N.fireEvent)(rw), o.success(r("Description.PaymentExpirationUpdateSuccess")), a(t, u)), [3, 4];
                                    case 3:
                                        return l.sent(), (0, N.fireEvent)(rS), o.warning(r(rZ)), [3, 4];
                                    case 4:
                                        return p(!1), n.close(), [2]
                                }
                            })
                        }, function() {
                            var t = this,
                                r = arguments;
                            return new Promise(function(n, a) {
                                var o = e.apply(t, r);

                                function i(e) {
                                    ne(o, n, a, i, u, "next", e)
                                }

                                function u(e) {
                                    ne(o, n, a, i, u, "throw", e)
                                }
                                i(void 0)
                            })
                        })()
                    }, [g, a, i, o, r]);
                    return (0, b.jsxs)(E.Modal, {
                        show: t,
                        onHide: n.close,
                        size: "md",
                        id: "update-payment-method-modal",
                        children: [(0, b.jsx)(E.Modal.Header, {
                            title: k,
                            onClose: n.close
                        }), (0, b.jsxs)(E.Modal.Body, {
                            children: [(0, b.jsx)("div", {
                                className: "modal-description font-header-2 text-emphasis",
                                children: r(rV)
                            }), (0, b.jsxs)("div", {
                                className: "fr payment-method-display",
                                children: [(0, b.jsx)("span", {
                                    className: "payment-method-image cardIcon ".concat(tY(u))
                                }), (0, b.jsx)("div", {
                                    className: "cardNumber text-emphasis font-header-2",
                                    children: "****".concat(l)
                                })]
                            }), (0, b.jsx)("div", {
                                className: "font-caption-header text-emphasis",
                                children: r("Label.Expiration")
                            }), (0, b.jsx)("input", {
                                type: "string",
                                name: "expiration",
                                placeholder: "MM/YY",
                                className: "expiry-input ".concat(C ? "error-input" : ""),
                                value: g,
                                inputMode: "numeric",
                                onChange: function(e) {
                                    var t = e.target.value;
                                    g.startsWith(t) || (g.length >= 2 && t.startsWith("1/") && (t = "0".concat(t)), (t = t.replace(/\D/g, "")).length > 4 && (t = t.slice(0, 4)), 1 === t.length && "0" !== t && "1" !== t ? t = "0".concat(t, "/") : 2 === t.length && Number(t) > 12 ? t = "0".concat(t.slice(0, 1), "/").concat(t.slice(1)) : t.length >= 2 && t.length <= 4 && (t = "".concat(t.slice(0, 2), "/").concat(t.slice(2)))), w(t)
                                }
                            }), C && (0, b.jsx)("div", {
                                className: "font-caption-body input-error-text",
                                children: r("Error.InvalidExpirationDate")
                            })]
                        }), (0, b.jsx)("div", {
                            className: "footer-divider"
                        }), (0, b.jsxs)(E.Modal.Footer, {
                            children: [(0, b.jsx)("div", {
                                className: "font-caption-body disclosure-text",
                                dangerouslySetInnerHTML: j
                            }), (0, b.jsxs)("div", {
                                className: "modal-buttons",
                                children: [(0, b.jsx)(E.Button, {
                                    variant: E.Button.variants.secondary,
                                    width: E.Button.widths.full,
                                    size: E.Button.sizes.large,
                                    className: "action-button",
                                    onClick: function() {
                                        n.close()
                                    },
                                    children: r("Action.Cancel")
                                }), (0, b.jsx)(E.Button, {
                                    width: E.Button.widths.full,
                                    size: E.Button.sizes.large,
                                    className: "action-button",
                                    isLoading: d,
                                    isDisabled: !y,
                                    onClick: P,
                                    children: r("Action.Save")
                                })]
                            })]
                        })]
                    })
                }, n]
            };

            function nn(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function na(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (r = a.next()).done) && (o.push(r.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, n = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return nn(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nn(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var no = function(e) {
                var t = e.translate,
                    r = e.systemFeedbackService,
                    n = e.updatePaymentProfiles,
                    a = e.paymentProfileId,
                    o = e.cardType,
                    i = e.lastFour,
                    u = e.expMonth,
                    l = e.expYear,
                    s = na((0, x.useState)(!1), 2),
                    c = s[0],
                    f = s[1],
                    d = na(r5(), 2),
                    p = d[0],
                    h = d[1],
                    y = na(r7(), 2),
                    v = y[0],
                    m = y[1],
                    g = na((0, x.useState)(!1), 2),
                    w = g[0],
                    S = g[1],
                    C = na((0, x.useState)(u), 2),
                    E = C[0],
                    A = C[1],
                    k = na((0, x.useState)(l), 2),
                    j = k[0],
                    P = k[1],
                    T = "****".concat(i),
                    O = "".concat(t("Label.SavedCreditCard.Exp"), " ").concat(tB(j, E));
                (0, x.useEffect)(function() {
                    S(new Date(j, E - 1) < new Date)
                }, [E, j]);
                var I = na(nr(), 2),
                    U = I[0],
                    M = I[1];
                return c ? null : (0, b.jsxs)("div", {
                    className: "cardContainer",
                    children: [(0, b.jsx)(p, {
                        translate: t,
                        systemFeedbackService: r,
                        cannotDeletePaymentMethodModalService: m,
                        paymentProfileId: a,
                        onDeleteSuccess: function() {
                            n(), f(!0)
                        }
                    }), (0, b.jsx)(v, {
                        translate: t
                    }), (0, b.jsx)(U, {
                        translate: t,
                        onUpdateSuccess: function(e, t) {
                            A(e), P(t)
                        },
                        systemFeedbackService: r,
                        paymentProfileId: a,
                        cardType: o,
                        lastFour: i,
                        expMonth: E,
                        expYear: j
                    }), (0, b.jsx)("span", {
                        className: "payment-method-image cardIcon ".concat(tY(o))
                    }), (0, b.jsx)("div", {
                        className: "cardNumber font-bold",
                        children: T
                    }), (0, b.jsx)("div", {
                        className: "cardExpiry",
                        children: O
                    }), (0, b.jsx)("button", {
                        type: "button",
                        className: "btn-generic-edit-sm",
                        onClick: function() {
                            M.open(), (0, N.fireEvent)(tK)
                        },
                        children: (0, b.jsx)("span", {
                            className: "icon-edit"
                        })
                    }), (0, b.jsx)("button", {
                        type: "button",
                        className: "btn-generic-trash-bin-sm",
                        onClick: function() {
                            h.open(), (0, N.fireEvent)(t$)
                        },
                        children: (0, b.jsx)("span", {
                            className: "icon-trash-bin"
                        })
                    }), w && (0, b.jsxs)(x.Fragment, {
                        children: [(0, b.jsx)("span", {
                            className: "icon-remove"
                        }), (0, b.jsx)("div", {
                            className: "card-expired",
                            children: t("Label.Expired")
                        })]
                    })]
                })
            };

            function ni(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nu(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (r = a.next()).done) && (o.push(r.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, n = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return ni(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ni(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var nl = function(e) {
                    var t = e.translate,
                        r = e.systemFeedbackService,
                        n = e.updatePaymentProfiles,
                        a = e.paymentProfileId,
                        o = e.email,
                        i = nu((0, x.useState)(!1), 2),
                        u = i[0],
                        l = i[1],
                        s = nu(r5(), 2),
                        c = s[0],
                        f = s[1],
                        d = nu(r7(), 2),
                        p = d[0],
                        h = d[1];
                    if (u) return null;
                    var y = t("Label.SavedCreditCard.Email") || "Email",
                        v = o ? "".concat(y, ": ").concat(o) : "";
                    return (0, b.jsxs)("div", {
                        className: "cardContainer",
                        children: [(0, b.jsx)(c, {
                            translate: t,
                            systemFeedbackService: r,
                            cannotDeletePaymentMethodModalService: h,
                            paymentProfileId: a,
                            onDeleteSuccess: function() {
                                n(), l(!0)
                            }
                        }), (0, b.jsx)(p, {
                            translate: t
                        }), (0, b.jsx)("span", {
                            className: "payment-method-image cardIcon paypal"
                        }), (0, b.jsx)("div", {
                            className: "cardNumber font-bold",
                            children: t("Label.Paypal")
                        }), o && (0, b.jsx)("div", {
                            className: "paypalEmail",
                            children: v
                        }), (0, b.jsx)("button", {
                            type: "button",
                            className: "btn-generic-edit-sm",
                            style: {
                                visibility: "hidden"
                            },
                            children: (0, b.jsx)("span", {
                                className: "icon-edit"
                            })
                        }), (0, b.jsx)("button", {
                            type: "button",
                            className: "btn-generic-trash-bin-sm",
                            onClick: function() {
                                f.open(), (0, N.fireEvent)(t$)
                            },
                            children: (0, b.jsx)("span", {
                                className: "icon-trash-bin"
                            })
                        })]
                    })
                },
                ns = function(e) {
                    var t = e.translate,
                        r = e.errorCode,
                        n = "";
                    switch (r) {
                        case rP:
                            n = t("Description.SavedCreditCard.IncorrectCVCErrorMessage") || "Incorrect CVC. Please check your information and try again.";
                            break;
                        case rT:
                            n = t("Description.SavedCreditCard.CardExpiredErrorMessage") || "Card expired. Please review the card details or try a different card.";
                            break;
                        default:
                            return null
                    }
                    return (0, b.jsx)("div", {
                        className: "alert-warning small-oneline form-error-banner",
                        children: n
                    })
                };

            function nc(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nf(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (r = a.next()).done) && (o.push(r.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, n = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return nc(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nc(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var nd = function(e) {
                var t, r, n = e.translate,
                    a = e.elements,
                    o = e.onFormChange,
                    i = e.updateInputEmail,
                    u = e.stripeEmail,
                    l = e.robloxEmail,
                    s = e.stripeErrorCode,
                    c = nf((0, x.useState)(!1), 2),
                    f = c[0],
                    d = c[1],
                    p = nf((0, x.useState)(!1), 2),
                    h = p[0],
                    y = p[1],
                    v = nf((0, x.useState)("" !== u || "" !== l), 2),
                    m = v[0],
                    g = v[1],
                    w = nf((0, x.useState)("" !== u ? u : l), 2),
                    S = w[0],
                    C = w[1],
                    E = nf((0, x.useState)(!1), 2),
                    A = E[0],
                    k = E[1],
                    j = nf((0, x.useState)(!1), 2),
                    P = j[0],
                    T = j[1],
                    N = {
                        __html: n("Description.SavedCreditCard.StripeAddPaymentMethodDisclosure", {
                            stripeTermsOfUseLinkStart: '<a href="https://stripe.com/legal/end-users" class="text-link" target="_blank">',
                            stripeTermsOfUseLinkEnd: "</a>",
                            stripePrivacyPolicyLinkStart: '<a href=\'https://stripe.com/privacy\' class="text-link" target="_blank">',
                            stripePrivacyPolicyLinkEnd: "</a>"
                        })
                    },
                    O = n("Description.SavedCreditCard.ProvideEmail"),
                    I = n("Label.InvalidEmailFormat"),
                    U = n("Description.SavedCreditCard.EmailCannotBeChanged");
                (0, x.useEffect)(function() {
                    t || (null == (t = null == a ? void 0 : a.getElement("payment")) || t.on("ready", function() {
                        null == t || t.clear()
                    }), null == t || t.on("change", function(e) {
                        d(e.complete)
                    })), r || (null == (r = null == a ? void 0 : a.getElement("address")) || r.on("ready", function() {
                        null == r || r.clear()
                    }), null == r || r.on("change", function(e) {
                        y(e.complete)
                    }))
                }, []), (0, x.useEffect)(function() {
                    o(!f || !h || A || "" === S)
                }, [f, h, S, A]);
                var M = function(e) {
                        var t = e.target.value.trim().replace(/\s/g, "");
                        k(P && "" !== t && null === /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.exec(t)), C(t), i(t)
                    },
                    _ = (0, b.jsxs)("div", {
                        children: [(0, b.jsxs)("div", {
                            className: "form-group form-has-feedback ".concat(A ? "form-has-error" : ""),
                            children: [(0, b.jsx)("input", {
                                className: "form-control input-field billing-email-input",
                                type: "email",
                                name: "email",
                                value: S,
                                onChange: M,
                                disabled: !0
                            }), (0, b.jsx)("span", {
                                className: "icon-status-unavailable"
                            })]
                        }), (0, b.jsx)("div", {
                            className: "form-group form-has-feedback",
                            children: (0, b.jsx)("div", {
                                className: "form-control-label small text email-label",
                                children: U
                            })
                        })]
                    }),
                    D = (0, b.jsxs)("div", {
                        children: [(0, b.jsxs)("div", {
                            className: "form-group form-has-feedback ".concat(A ? "form-has-error" : ""),
                            children: [(0, b.jsx)("input", {
                                className: "form-control input-field billing-email-input unset-cursor",
                                type: "email",
                                name: "email",
                                value: S,
                                onChange: M,
                                disabled: m
                            }), P ? (0, b.jsx)("button", {
                                type: "button",
                                className: "icon-button-override",
                                onClick: function() {
                                    i(l), C(l), T(!1), g(!0)
                                },
                                children: (0, b.jsx)("span", {
                                    className: "icon-regenerate"
                                })
                            }) : (0, b.jsx)("button", {
                                type: "button",
                                className: "icon-button-override",
                                onClick: function() {
                                    i(""), C(""), T(!0), g(!1)
                                },
                                children: (0, b.jsx)("span", {
                                    className: "icon-edit"
                                })
                            }), A ? (0, b.jsx)("p", {
                                className: "form-control-label",
                                children: I
                            }) : null]
                        }), (0, b.jsx)("div", {
                            className: "form-group form-has-feedback",
                            children: (0, b.jsx)("div", {
                                className: "form-control-label small text email-label",
                                children: O
                            })
                        })]
                    }),
                    R = (0, b.jsxs)("div", {
                        children: [(0, b.jsx)("div", {
                            className: "form-group form-has-feedback ".concat(A ? "form-has-error" : ""),
                            children: (0, b.jsx)("input", {
                                className: "form-control input-field billing-email-input",
                                type: "email",
                                name: "email",
                                value: S,
                                onChange: M,
                                disabled: m
                            })
                        }), (0, b.jsx)("div", {
                            className: "form-group form-has-feedback",
                            children: (0, b.jsx)("div", {
                                className: "form-control-label small text email-label",
                                children: O
                            })
                        })]
                    });
                return a ? (0, b.jsxs)("div", {
                    className: "add-card-modal",
                    children: [(0, b.jsx)("h2", {
                        className: "stripe-form-header",
                        children: n(rV)
                    }), (0, b.jsx)(z.PaymentElement, {}), (0, b.jsx)("h2", {
                        className: "stripe-form-header billing-email-header",
                        children: n("Heading.SavedCreditCard.BillingEmail")
                    }), "" !== u ? _ : "" !== l ? D : R, (0, b.jsx)("h2", {
                        className: "stripe-form-header",
                        children: n(rz)
                    }), (0, b.jsx)(z.AddressElement, {
                        options: {
                            mode: "billing"
                        }
                    }), (0, b.jsx)("div", {
                        className: "form-control-label small text stripe-form-disclosure",
                        dangerouslySetInnerHTML: N
                    }), s ? (0, b.jsx)(ns, {
                        translate: n,
                        errorCode: s
                    }) : null]
                }) : (0, b.jsxs)("div", {
                    className: "add-card-modal",
                    children: [(0, b.jsx)("h2", {
                        className: "stripe-form-header",
                        children: n(rV)
                    }), (0, b.jsx)("span", {
                        className: "spinner spinner-default"
                    }), (0, b.jsx)("h2", {
                        className: "stripe-form-header",
                        children: n(rz)
                    }), (0, b.jsx)("span", {
                        className: "spinner spinner-default"
                    })]
                })
            };

            function np(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nh(e, t, r, n, a, o, i) {
                try {
                    var u = e[o](i),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, a)
            }

            function ny(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, a) {
                        var o = e.apply(t, r);

                        function i(e) {
                            nh(o, n, a, i, u, "next", e)
                        }

                        function u(e) {
                            nh(o, n, a, i, u, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function nv(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (r = a.next()).done) && (o.push(r.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, n = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return np(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return np(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nm(e, t) {
                var r, n, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    u = Object.defineProperty;
                return u(i, "next", {
                    value: l(0)
                }), u(i, "throw", {
                    value: l(1)
                }), u(i, "return", {
                    value: l(2)
                }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function l(u) {
                    return function(l) {
                        var s = [u, l];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, s[0] && (o = 0)), o;) try {
                            if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                            switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                case 0:
                                case 1:
                                    a = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < a[1]) {
                                        o.label = a[1], a = s;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(s);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], n = 0
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
            var nb = function(e) {
                    if (!e.trim()) return null;
                    try {
                        return BigInt(e)
                    } catch (e) {
                        return null
                    }
                },
                ng = function(e) {
                    return e > 0 && e <= Number.MAX_SAFE_INTEGER ? e.toString() : null
                },
                nw = function(e) {
                    var t = nb(e);
                    return null == t ? null : ng(t)
                },
                nS = "blackbird",
                nx = function(e) {
                    var t, r, n, a, o = null != (t = e.userid) ? t : e.user,
                        i = null == o ? void 0 : null != (r = nw(o)) ? r : void 0;
                    if ("string" == typeof i) return {
                        isAuthenticated: !0,
                        id: i,
                        userName: null != (n = e.name) ? n : e.userName,
                        displayName: null != (a = e.displayname) ? a : e.userDisplayName,
                        isPremiumUser: "true" === e.ispremiumuser || "true" === e.userIsPremium,
                        membership: e.membership === nS || e.userMembership === nS ? nS : void 0,
                        isVerified: "true" === e.hasverifiedbadge || "true" === e.userHasVerifiedBadge,
                        isUnder13: "true" === e.isunder13 || "AgeUnder13" === e.userAgeBracket
                    }
                };

            function nC(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nE(e, t, r, n, a, o, i) {
                try {
                    var u = e[o](i),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, a)
            }

            function nA(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, a) {
                        var o = e.apply(t, r);

                        function i(e) {
                            nE(o, n, a, i, u, "next", e)
                        }

                        function u(e) {
                            nE(o, n, a, i, u, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function nk(e, t) {
                if (!(e instanceof t)) throw TypeError("Cannot call a class as a function")
            }

            function nj(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var n = t[r];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                }
            }

            function nP(e, t, r) {
                return t && nj(e.prototype, t), r && nj(e, r), e
            }

            function nT(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function nN(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function nO(e, t) {
                var r, n, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    u = Object.defineProperty;
                return u(i, "next", {
                    value: l(0)
                }), u(i, "throw", {
                    value: l(1)
                }), u(i, "return", {
                    value: l(2)
                }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function l(u) {
                    return function(l) {
                        var s = [u, l];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, s[0] && (o = 0)), o;) try {
                            if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                            switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                case 0:
                                case 1:
                                    a = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < a[1]) {
                                        o.label = a[1], a = s;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(s);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], n = 0
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
            var nI = function() {
                    function e(t) {
                        nk(this, e), nT(this, "value", void 0), this.value = t
                    }
                    return nP(e, [{
                        key: "cast",
                        value: function() {
                            return this
                        }
                    }, {
                        key: "isOk",
                        value: function() {
                            return !0
                        }
                    }, {
                        key: "isErr",
                        value: function() {
                            return !1
                        }
                    }, {
                        key: "map",
                        value: function(t) {
                            return new e(t(this.value))
                        }
                    }, {
                        key: "mapErr",
                        value: function(e) {
                            return this.cast()
                        }
                    }, {
                        key: "andThen",
                        value: function(e) {
                            return e(this.value)
                        }
                    }, {
                        key: "andThenAsync",
                        value: function(e) {
                            return e(this.value)
                        }
                    }, {
                        key: "orElse",
                        value: function(e) {
                            return this.cast()
                        }
                    }, {
                        key: "orElseAsync",
                        value: function(e) {
                            return nM.fromResult(this.cast())
                        }
                    }, {
                        key: "inspect",
                        value: function(e) {
                            return e(this.value), this
                        }
                    }, {
                        key: "inspectErr",
                        value: function(e) {
                            return this
                        }
                    }, {
                        key: "match",
                        value: function(e, t) {
                            return e(this.value)
                        }
                    }, {
                        key: "getOrDefault",
                        value: function(e) {
                            return this.value
                        }
                    }, {
                        key: "getOrNull",
                        value: function() {
                            return this.value
                        }
                    }, {
                        key: "getOrElse",
                        value: function(e) {
                            return this.value
                        }
                    }, {
                        key: "getOrThrow",
                        value: function() {
                            return this.value
                        }
                    }, {
                        key: "getErrOrNull",
                        value: function() {
                            return null
                        }
                    }]), e
                }(),
                nU = function() {
                    function e(t) {
                        nk(this, e), nT(this, "error", void 0), this.error = t
                    }
                    return nP(e, [{
                        key: "cast",
                        value: function() {
                            return this
                        }
                    }, {
                        key: "isOk",
                        value: function() {
                            return !1
                        }
                    }, {
                        key: "isErr",
                        value: function() {
                            return !0
                        }
                    }, {
                        key: "map",
                        value: function(e) {
                            return this.cast()
                        }
                    }, {
                        key: "mapErr",
                        value: function(t) {
                            return new e(t(this.error))
                        }
                    }, {
                        key: "andThen",
                        value: function(e) {
                            return this.cast()
                        }
                    }, {
                        key: "andThenAsync",
                        value: function(e) {
                            return nM.fromResult(this.cast())
                        }
                    }, {
                        key: "orElse",
                        value: function(e) {
                            return e(this.error)
                        }
                    }, {
                        key: "orElseAsync",
                        value: function(e) {
                            return e(this.error)
                        }
                    }, {
                        key: "inspect",
                        value: function(e) {
                            return this
                        }
                    }, {
                        key: "inspectErr",
                        value: function(e) {
                            return e(this.error), this
                        }
                    }, {
                        key: "match",
                        value: function(e, t) {
                            return t(this.error)
                        }
                    }, {
                        key: "getOrDefault",
                        value: function(e) {
                            return e
                        }
                    }, {
                        key: "getOrNull",
                        value: function() {
                            return null
                        }
                    }, {
                        key: "getOrElse",
                        value: function(e) {
                            return e()
                        }
                    }, {
                        key: "getOrThrow",
                        value: function() {
                            throw this.error
                        }
                    }, {
                        key: "getErrOrNull",
                        value: function() {
                            return this.error
                        }
                    }]), e
                }();
            (h || (h = {})).all = function(e) {
                var t = e.findIndex(function(e) {
                    return e.isErr()
                });
                return -1 === t ? new nI(e.map(function(e) {
                    return e.getOrNull()
                })) : e[t]
            };
            var nM = function() {
                    function e(t) {
                        nk(this, e), nT(this, "promise", void 0), this.promise = t
                    }
                    return nP(e, [{
                        key: "map",
                        value: function(t) {
                            return new e(this.promise.then(function(e) {
                                return nA(function() {
                                    var r, n;
                                    return nO(this, function(a) {
                                        switch (a.label) {
                                            case 0:
                                                if (!e.isOk()) return [3, 2];
                                                return n = nI.bind, [4, t(e.value)];
                                            case 1:
                                                return r = new(n.apply(nI, [void 0, a.sent()])), [3, 3];
                                            case 2:
                                                r = e.cast(), a.label = 3;
                                            case 3:
                                                return [2, r]
                                        }
                                    })
                                })()
                            }))
                        }
                    }, {
                        key: "mapErr",
                        value: function(t) {
                            return new e(this.promise.then(function(e) {
                                return nA(function() {
                                    var r, n;
                                    return nO(this, function(a) {
                                        switch (a.label) {
                                            case 0:
                                                if (!e.isErr()) return [3, 2];
                                                return n = nU.bind, [4, t(e.error)];
                                            case 1:
                                                return r = new(n.apply(nU, [void 0, a.sent()])), [3, 3];
                                            case 2:
                                                r = e.cast(), a.label = 3;
                                            case 3:
                                                return [2, r]
                                        }
                                    })
                                })()
                            }))
                        }
                    }, {
                        key: "andThen",
                        value: function(t) {
                            return new e(this.promise.then(function(r) {
                                if (r.isErr()) return r.cast();
                                var n = t(r.value);
                                return nN(n, e) ? n.promise : n
                            }))
                        }
                    }, {
                        key: "orElse",
                        value: function(t) {
                            return new e(this.promise.then(function(r) {
                                if (r.isOk()) return r.cast();
                                var n = t(r.error);
                                return nN(n, e) ? n.promise : n
                            }))
                        }
                    }, {
                        key: "then",
                        value: function(e, t) {
                            return this.promise.then(e, t)
                        }
                    }, {
                        key: "inspect",
                        value: function(t) {
                            return new e(this.promise.then(function(e) {
                                return e.isOk() && t(e.value), e
                            }))
                        }
                    }, {
                        key: "inspectErr",
                        value: function(t) {
                            return new e(this.promise.then(function(e) {
                                return e.isErr() && t(e.error), e
                            }))
                        }
                    }, {
                        key: "match",
                        value: function(e, t) {
                            return this.promise.then(function(r) {
                                return r.match(e, t)
                            })
                        }
                    }, {
                        key: "getOrDefault",
                        value: function(e) {
                            return this.promise.then(function(t) {
                                return t.getOrDefault(e)
                            })
                        }
                    }, {
                        key: "getOrNull",
                        value: function() {
                            return this.promise.then(function(e) {
                                return e.getOrNull()
                            })
                        }
                    }, {
                        key: "getOrElse",
                        value: function(e) {
                            return this.promise.then(function(t) {
                                return t.getOrElse(e)
                            })
                        }
                    }, {
                        key: "getOrThrow",
                        value: function() {
                            return this.promise.then(function(e) {
                                return e.getOrThrow()
                            })
                        }
                    }, {
                        key: "getErrOrNull",
                        value: function() {
                            return this.promise.then(function(e) {
                                return e.getErrOrNull()
                            })
                        }
                    }], [{
                        key: "fromResult",
                        value: function(t) {
                            return new e(Promise.resolve(t))
                        }
                    }, {
                        key: "fromPromise",
                        value: function(t, r) {
                            return new e(t.then(function(e) {
                                return new nI(e)
                            }).catch(function(e) {
                                return new nU(r(e))
                            }))
                        }
                    }, {
                        key: "fromPromiseResult",
                        value: function(t) {
                            return new e(t)
                        }
                    }, {
                        key: "fromExecutor",
                        value: function(t) {
                            return new e(new Promise(function(e) {
                                t(e)
                            }))
                        }
                    }, {
                        key: "from",
                        value: function(t) {
                            return nN(t, e) ? t : nN(t, Promise) ? e.fromPromiseResult(t) : e.fromResult(t)
                        }
                    }, {
                        key: "fn",
                        value: function(t) {
                            return function() {
                                for (var r = arguments.length, n = Array(r), a = 0; a < r; a++) n[a] = arguments[a];
                                return e.fromPromiseResult(t.apply(void 0, function(e) {
                                    if (Array.isArray(e)) return nC(e)
                                }(n) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(n) || function(e) {
                                    if (e) {
                                        if ("string" == typeof e) return nC(e, void 0);
                                        var t = Object.prototype.toString.call(e).slice(8, -1);
                                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nC(e, void 0)
                                    }
                                }(n) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()))
                            }
                        }
                    }, {
                        key: "all",
                        value: function(t) {
                            return new e(Promise.all(t).then(h.all))
                        }
                    }]), e
                }(),
                n_ = function(e) {
                    return new nI(e)
                },
                nD = function(e) {
                    return new nU(e)
                },
                nR = r(848);

            function nB(e, t, r) {
                return t = nH(t),
                    function(e, t) {
                        if (t && ("object" === nV(t) || "function" == typeof t)) return t;
                        if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                        return e
                    }(e, nq() ? Reflect.construct(t, r || [], nH(e).constructor) : t.apply(e, r))
            }

            function nF(e, t) {
                if (!(e instanceof t)) throw TypeError("Cannot call a class as a function")
            }

            function nL(e, t, r) {
                return (nL = nq() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var a = new(Function.bind.apply(e, n));
                    return r && nY(a, r.prototype), a
                }).apply(null, arguments)
            }

            function nG(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function nH(e) {
                return (nH = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function nW(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        writable: !0,
                        configurable: !0
                    }
                }), t && nY(e, t)
            }

            function nY(e, t) {
                return (nY = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function nV(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
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
                        return nL(e, arguments, nH(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), nY(r, e)
                })(e)
            }

            function nq() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (nq = function() {
                    return !!e
                })()
            }
            var nX = function(e) {
                    function t(e) {
                        var r;
                        return nF(this, t), nG(r = nB(this, t, [e.error.message, {
                            cause: e
                        }]), "cause", void 0), r.cause = e, r
                    }
                    return nW(t, e), t
                }(nz(Error)),
                n$ = function(e) {
                    function t(e) {
                        var r;
                        return nF(this, t), nG(r = nB(this, t, [e.message, {
                            cause: e
                        }]), "cause", void 0), r.cause = e, r
                    }
                    return nW(t, e), t
                }(nz(Error)),
                nQ = function(e) {
                    var t;
                    try {
                        t = JSON.parse(e)
                    } catch (e) {
                        return nD(new nX({
                            code: "Syntax",
                            error: e
                        }))
                    }
                    if (null != t && (void 0 === t ? "undefined" : nV(t)) === "object") try {
                        (0, nR.scan)(t)
                    } catch (e) {
                        return nD(new nX({
                            code: "PrototypeProperty",
                            error: e
                        }))
                    }
                    return n_(t)
                },
                nK = function(e, t) {
                    try {
                        return n_(JSON.stringify(e, void 0, t))
                    } catch (e) {
                        return nD(new n$(e))
                    }
                };

            function nJ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nZ(e, t, r) {
                return (nZ = n3() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var a = new(Function.bind.apply(e, n));
                    return r && n1(a, r.prototype), a
                }).apply(null, arguments)
            }

            function n0(e) {
                return (n0 = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function n1(e, t) {
                return (n1 = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function n2(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (n2 = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return nZ(e, arguments, n0(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), n1(r, e)
                })(e)
            }

            function n3() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (n3 = function() {
                    return !!e
                })()
            }
            var n4 = function(e) {
                    try {
                        localStorage.removeItem(e)
                    } catch (e) {}
                },
                n6 = function(e) {
                    var t = null;
                    try {
                        t = localStorage.getItem(e)
                    } catch (e) {}
                    return null == t ? null : nQ(t).getOrNull()
                },
                n5 = function(e) {
                    if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                    function t(e) {
                        var r, n, a, o, i;
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        return n = t, a = [e.code, {
                            cause: e
                        }], n = n0(n), r = function(e, t) {
                            var r;
                            if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                            if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                            return e
                        }(this, n3() ? Reflect.construct(n, a || [], n0(this).constructor) : n.apply(this, a)), i = void 0, (o = "cause") in r ? Object.defineProperty(r, o, {
                            value: i,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : r[o] = i, r.cause = e, r
                    }
                    return t.prototype = Object.create(e && e.prototype, {
                        constructor: {
                            value: t,
                            writable: !0,
                            configurable: !0
                        }
                    }), e && n1(t, e), t
                }(n2(Error)),
                n8 = function(e, t) {
                    var r = nK(t);
                    if (r.isErr()) return nD(new n5({
                        code: "JsonSerialization",
                        error: r.error
                    }));
                    try {
                        return localStorage.setItem(e, r.value), n_(null)
                    } catch (e) {
                        return nD(new n5({
                            code: "Unknown",
                            error: e
                        }))
                    }
                },
                n7 = 0,
                n9 = function(e) {
                    n7 = Number.MAX_SAFE_INTEGER;
                    var t = n6("expiryList");
                    if (null != t && 0 !== t.version) return nD(new n5({
                        code: "PageRefreshNeeded"
                    }));
                    var r = Date.now(),
                        n = {},
                        a = !0,
                        o = !1,
                        i = void 0;
                    try {
                        for (var u, l, s = Object.entries(null != (u = null == t ? void 0 : t.data) ? u : {})[Symbol.iterator](); !(a = (l = s.next()).done); a = !0) {
                            var c, f = (c = l.value, function(e) {
                                    if (Array.isArray(e)) return e
                                }(c) || function(e) {
                                    var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                    if (null != n) {
                                        var a = [],
                                            o = !0,
                                            i = !1;
                                        try {
                                            for (n = n.call(e); !(o = (t = n.next()).done) && (a.push(t.value), 2 !== a.length); o = !0);
                                        } catch (e) {
                                            i = !0, r = e
                                        } finally {
                                            try {
                                                o || null == n.return || n.return()
                                            } finally {
                                                if (i) throw r
                                            }
                                        }
                                        return a
                                    }
                                }(c) || function(e) {
                                    if (e) {
                                        if ("string" == typeof e) return nJ(e, 2);
                                        var t = Object.prototype.toString.call(e).slice(8, -1);
                                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nJ(e, 2)
                                    }
                                }(c) || function() {
                                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()),
                                d = f[0],
                                p = f[1];
                            if (d === (null == e ? void 0 : e.key)) {
                                var h = e.options.maxAge;
                                if (null != h) {
                                    var y = r + h;
                                    n7 = Math.min(n7, y), n[d] = y
                                }
                            } else r >= p ? n4(d) : (n7 = Math.min(n7, p), n[d] = p)
                        }
                    } catch (e) {
                        o = !0, i = e
                    } finally {
                        try {
                            a || null == s.return || s.return()
                        } finally {
                            if (o) throw i
                        }
                    }
                    return n8("expiryList", {
                        version: 0,
                        data: n
                    })
                },
                ae = function(e, t) {
                    var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
                    return n9({
                        key: e,
                        options: r
                    }).andThen(function() {
                        return n8(e, t)
                    })
                },
                at = window.Roblox["core-scripts"].environmentUrls,
                ar = r.n(at),
                an = window.Roblox["core-scripts"].paymentsFlow,
                aa = r.n(an);

            function ao(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ai(e) {
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

            function au(e, t) {
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

            function al(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (r = a.next()).done) && (o.push(r.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, n = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return ao(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ao(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function as(e, t) {
                var r = t.publish,
                    n = t.captureException,
                    a = t.featureName;

                function o(e, t, r) {
                    if (null != r) {
                        var o, i = (null != (o = Error) && "u" > typeof Symbol && o[Symbol.hasInstance] ? !!o[Symbol.hasInstance](r) : r instanceof o) ? r.name || "Error" : "UnknownError",
                            u = a ? "".concat(a, "_").concat(e) : e;
                        return null == n || n(r, {
                            error_counter: u
                        }), au(ai({}, t), {
                            errorType: i
                        })
                    }
                    return t
                }
                return {
                    trackCounter: function() {
                        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        var a = al(t, 2);
                        r(a[0], a[1])
                    },
                    trackError: function() {
                        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        var a = al(t, 3),
                            i = a[0],
                            u = a[1],
                            l = a[2],
                            s = o(i, au(ai({}, null != u ? u : {}), {
                                severity: "error"
                            }), l);
                        r(i, s)
                    },
                    trackCriticalError: function() {
                        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        var a = al(t, 3),
                            i = a[0],
                            u = a[1],
                            l = a[2],
                            s = o(i, au(ai({}, null != u ? u : {}), {
                                severity: "critical"
                            }), l);
                        r(i, s)
                    }
                }
            }
            var ac = globalThis.window,
                af = void 0 === ac ? void 0 : ac,
                ad = function(e, t) {
                    var r;
                    null == af || null == (r = af.Sentry) || r.captureException(e, t ? {
                        tags: t
                    } : void 0)
                },
                ap = window.Roblox["core-scripts"].http.http;

            function ah(e, t, r, n, a, o, i) {
                try {
                    var u = e[o](i),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, a)
            }

            function ay(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, a) {
                        var o = e.apply(t, r);

                        function i(e) {
                            ah(o, n, a, i, u, "next", e)
                        }

                        function u(e) {
                            ah(o, n, a, i, u, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function av(e) {
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

            function am(e, t) {
                var r, n, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    u = Object.defineProperty;
                return u(i, "next", {
                    value: l(0)
                }), u(i, "throw", {
                    value: l(1)
                }), u(i, "return", {
                    value: l(2)
                }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function l(u) {
                    return function(l) {
                        var s = [u, l];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, s[0] && (o = 0)), o;) try {
                            if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                            switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                case 0:
                                case 1:
                                    a = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < a[1]) {
                                        o.label = a[1], a = s;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(s);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], n = 0
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

            function ab(e) {
                return (void 0 === e ? "undefined" : e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e) == "object" && "config" in e
            }

            function ag(e) {
                return function(t) {
                    return ay(function() {
                        var r, n, a, o, i, u, l, s, c;
                        return am(this, function(f) {
                            switch (f.label) {
                                case 0:
                                    r = t.eventCounterProps.call, e(n = "".concat(r, "_API"), {
                                        statusCode: "Throughput"
                                    }), f.label = 1;
                                case 1:
                                    return f.trys.push([1, 3, , 4]), [4, "GET" === t.method ? (0, ap.get)(av({
                                        url: t.url,
                                        fullError: !0
                                    }, t.config), null == (a = t.config) ? void 0 : a.params) : (0, ap.post)(av({
                                        url: t.url,
                                        fullError: !0
                                    }, t.config), t.data)];
                                case 2:
                                    return o = f.sent().data, e(n, {
                                        statusCode: "200"
                                    }), [2, o];
                                case 3:
                                    return ab(i = f.sent()) ? u = null != (l = null != (s = i.code) ? s : null == i || null == (c = i.response) ? void 0 : c.status.toString()) ? l : "UnknownAxiosError" : (u = "UnknownError", console.error(i)), e(n, {
                                        statusCode: u
                                    }), [2, void 0];
                                case 4:
                                    return [2]
                            }
                        })
                    })()
                }
            }

            function aw(e, t) {
                return function(r) {
                    return ay(function() {
                        var n, a, o, i, u, l, s, c, f;
                        return am(this, function(d) {
                            switch (d.label) {
                                case 0:
                                    n = r.eventCounterProps.call, e(a = "".concat(n, "_API"), {
                                        statusCode: "Throughput"
                                    }), d.label = 1;
                                case 1:
                                    if (d.trys.push([1, 8, , 9]), o = av({
                                            url: r.url,
                                            fullError: !0
                                        }, r.config), "GET" !== r.method) return [3, 3];
                                    return [4, (0, ap.get)(o, null == (u = r.config) ? void 0 : u.params)];
                                case 2:
                                case 4:
                                    return i = d.sent(), [3, 7];
                                case 3:
                                    if ("POST" !== r.method) return [3, 5];
                                    return [4, (0, ap.post)(o, r.data)];
                                case 5:
                                    return [4, (0, ap.delete)(o, r.data)];
                                case 6:
                                    i = d.sent(), d.label = 7;
                                case 7:
                                    return l = i.data, s = i.headers, e(a, {
                                        statusCode: "200"
                                    }), [2, {
                                        data: l,
                                        headers: s
                                    }];
                                case 8:
                                    throw f = function(e) {
                                            if (ab(e)) {
                                                var t, r, n;
                                                return null != (t = null != (r = e.code) ? r : null == e || null == (n = e.response) ? void 0 : n.status.toString()) ? t : "UnknownAxiosError"
                                            }
                                            return "UnknownError"
                                        }(c = d.sent()), e(a, {
                                            statusCode: f
                                        }),
                                        function(e) {
                                            if (!ab(e)) return !0;
                                            var t, r = null == (t = e.response) ? void 0 : t.status;
                                            return void 0 === r || r >= 500
                                        }(c) && t(c, {
                                            call: n,
                                            statusCode: f
                                        }), c;
                                case 9:
                                    return [2]
                            }
                        })
                    })()
                }
            }

            function aS(e, t, r, n, a, o, i) {
                try {
                    var u = e[o](i),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, a)
            }

            function ax() {
                return null != y || (y = "".concat(ar().apiGatewayUrl.replace(/\/$/, ""), "/experience-signals-ingest/public")), y
            }
            var aC = function() {};

            function aE(e, t) {
                fetch("".concat(ax()).concat(e), {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-protobuf"
                    },
                    body: t,
                    credentials: "include",
                    keepalive: !0
                }).catch(aC)
            }

            function aA(e, t) {
                var r;
                (r = function() {
                    var e, r, n, a, o, i, u, l, s, c, f, d, p;
                    return function(e, t) {
                        var r, n, a, o = {
                                label: 0,
                                sent: function() {
                                    if (1 & a[0]) throw a[1];
                                    return a[1]
                                },
                                trys: [],
                                ops: []
                            },
                            i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                            u = Object.defineProperty;
                        return u(i, "next", {
                            value: l(0)
                        }), u(i, "throw", {
                            value: l(1)
                        }), u(i, "return", {
                            value: l(2)
                        }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                            value: function() {
                                return this
                            }
                        }), i;

                        function l(u) {
                            return function(l) {
                                var s = [u, l];
                                if (r) throw TypeError("Generator is already executing.");
                                for (; i && (i = 0, s[0] && (o = 0)), o;) try {
                                    if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                                    switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                        case 0:
                                        case 1:
                                            a = s;
                                            break;
                                        case 4:
                                            return o.label++, {
                                                value: s[1],
                                                done: !1
                                            };
                                        case 5:
                                            o.label++, n = s[1], s = [0];
                                            continue;
                                        case 7:
                                            s = o.ops.pop(), o.trys.pop();
                                            continue;
                                        default:
                                            if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                o = 0;
                                                continue
                                            }
                                            if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                                o.label = s[1];
                                                break
                                            }
                                            if (6 === s[0] && o.label < a[1]) {
                                                o.label = a[1], a = s;
                                                break
                                            }
                                            if (a && o.label < a[2]) {
                                                o.label = a[2], o.ops.push(s);
                                                break
                                            }
                                            a[2] && o.ops.pop(), o.trys.pop();
                                            continue
                                    }
                                    s = t.call(e, o)
                                } catch (e) {
                                    s = [6, e], n = 0
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
                    }(this, function(h) {
                        switch (h.label) {
                            case 0:
                                if ("u" < typeof CompressionStream) return [2, {
                                    body: t.buffer,
                                    compressed: !1
                                }];
                                return (r = (e = new CompressionStream("gzip")).writable.getWriter()).write(t).catch(aC), r.close().catch(aC), n = [], [4, (a = e.readable.getReader()).read()];
                            case 1:
                                o = h.sent(), h.label = 2;
                            case 2:
                                if (o.done) return [3, 4];
                                return n.push(o.value), [4, a.read()];
                            case 3:
                                return o = h.sent(), [3, 2];
                            case 4:
                                i = new Uint8Array(n.reduce(function(e, t) {
                                    return e + t.length
                                }, 0)), u = 0, l = !0, s = !1, c = void 0;
                                try {
                                    for (f = n[Symbol.iterator](); !(l = (d = f.next()).done); l = !0) p = d.value, i.set(p, u), u += p.length
                                } catch (e) {
                                    s = !0, c = e
                                } finally {
                                    try {
                                        l || null == f.return || f.return()
                                    } finally {
                                        if (s) throw c
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
                    return new Promise(function(n, a) {
                        var o = r.apply(e, t);

                        function i(e) {
                            aS(o, n, a, i, u, "next", e)
                        }

                        function u(e) {
                            aS(o, n, a, i, u, "throw", e)
                        }
                        i(void 0)
                    })
                })().then(function(t) {
                    var r = t.body,
                        n = t.compressed,
                        a = {
                            "Content-Type": "application/x-protobuf"
                        };
                    return n && (a["Content-Encoding"] = "gzip"), fetch("".concat(ax()).concat(e), {
                        method: "POST",
                        headers: a,
                        body: r,
                        credentials: "include",
                        keepalive: !0
                    })
                }).catch(aC)
            }

            function ak(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aj(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var aP = function(e, t) {
                    return e << 3 | t
                },
                aT = aP(1, 2),
                aN = aP(2, 2),
                aO = aP(5, 2),
                aI = aP(6, 2),
                aU = aP(8, 2),
                aM = aP(1, 2),
                a_ = aP(2, 1),
                aD = aP(3, 0),
                aR = aP(5, 2),
                aB = aP(1, 2),
                aF = aP(2, 1),
                aL = aP(3, 0),
                aG = aP(4, 2),
                aH = aP(5, 2),
                aW = aP(6, 0),
                aY = aP(8, 2),
                aV = aP(4, 0),
                az = aP(6, 2),
                aq = aP(7, 2),
                aX = aP(1, 0),
                a$ = aP(2, 2),
                aQ = aP(1, 2),
                aK = aP(2, 2),
                aJ = aP(1, 2),
                aZ = aP(1, 2),
                a0 = aP(2, 2),
                a1 = aP(1, 2),
                a2 = "eventstream.enginetelemetry.EngineTelemetryBatchEvent",
                a3 = new TextEncoder,
                a4 = function() {
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
                                var t = (void 0 === e ? "undefined" : aj(e)) === "bigint" ? e : BigInt(Math.trunc(e));
                                for (t < BigInt(0) && (t += BigInt(1) << BigInt(64)); t > BigInt(127);) this.buf.push(128 | Number(t & BigInt(127))), t >>= BigInt(7);
                                this.buf.push(Number(t))
                            }
                        }, {
                            key: "writeString",
                            value: function(e) {
                                var t = a3.encode(e);
                                this.writeVarint(t.length);
                                var r = !0,
                                    n = !1,
                                    a = void 0;
                                try {
                                    for (var o, i = t[Symbol.iterator](); !(r = (o = i.next()).done); r = !0) {
                                        var u = o.value;
                                        this.buf.push(u)
                                    }
                                } catch (e) {
                                    n = !0, a = e
                                } finally {
                                    try {
                                        r || null == i.return || i.return()
                                    } finally {
                                        if (n) throw a
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
                                    for (var a, o = e[Symbol.iterator](); !(t = (a = o.next()).done); t = !0) {
                                        var i = a.value;
                                        this.buf.push(i)
                                    }
                                } catch (e) {
                                    r = !0, n = e
                                } finally {
                                    try {
                                        t || null == o.return || o.return()
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

            function a6(e, t, r) {
                var n = new a4;
                return n.writeVarint(aP(1, 2)), n.writeString(e), n.writeVarint(t), r(n), n.toBytes()
            }

            function a5(e) {
                var t = new a4,
                    r = !0,
                    n = !1,
                    a = void 0;
                try {
                    for (var o, i = Object.entries(e)[Symbol.iterator](); !(r = (o = i.next()).done); r = !0) ! function() {
                        var e, r = (e = o.value, function(e) {
                                if (Array.isArray(e)) return e
                            }(e) || function(e) {
                                var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                if (null != n) {
                                    var a = [],
                                        o = !0,
                                        i = !1;
                                    try {
                                        for (n = n.call(e); !(o = (t = n.next()).done) && (a.push(t.value), 2 !== a.length); o = !0);
                                    } catch (e) {
                                        i = !0, r = e
                                    } finally {
                                        try {
                                            o || null == n.return || n.return()
                                        } finally {
                                            if (i) throw r
                                        }
                                    }
                                    return a
                                }
                            }(e) || function(e) {
                                if (e) {
                                    if ("string" == typeof e) return ak(e, 2);
                                    var t = Object.prototype.toString.call(e).slice(8, -1);
                                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ak(e, 2)
                                }
                            }(e) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }()),
                            n = r[0],
                            a = r[1];
                        if ("string" == typeof a) {
                            var i = a6(n, aP(2, 2), function(e) {
                                e.writeString(a)
                            });
                            t.writeVarint(aO), t.writeBytes(i)
                        } else if ("boolean" == typeof a) {
                            var u = a6(n, aP(2, 0), function(e) {
                                e.writeVarint(+!!a)
                            });
                            t.writeVarint(aI), t.writeBytes(u)
                        } else if ((void 0 === a ? "undefined" : aj(a)) === "bigint") {
                            var l = a6(n, aP(2, 0), function(e) {
                                e.writeVarint(a)
                            });
                            t.writeVarint(aN), t.writeBytes(l)
                        } else if ("number" == typeof a)
                            if (Number.isFinite(a))
                                if (Number.isInteger(a) && a >= -0x80000000 && a <= 0x7fffffff) {
                                    var s = a6(n, aP(2, 0), function(e) {
                                        e.writeVarint(a)
                                    });
                                    t.writeVarint(aT), t.writeBytes(s)
                                } else if (Number.isInteger(a)) {
                            var c = a6(n, aP(2, 0), function(e) {
                                e.writeVarint(BigInt(a))
                            });
                            t.writeVarint(aN), t.writeBytes(c)
                        } else {
                            var f = a6(n, aP(2, 1), function(e) {
                                e.writeDouble(a)
                            });
                            t.writeVarint(aU), t.writeBytes(f)
                        } else {
                            var d = a6(n, aP(2, 2), function(e) {
                                e.writeString(String(a))
                            });
                            t.writeVarint(aO), t.writeBytes(d)
                        }
                    }()
                } catch (e) {
                    n = !0, a = e
                } finally {
                    try {
                        r || null == i.return || i.return()
                    } finally {
                        if (n) throw a
                    }
                }
                return t.toBytes()
            }

            function a8(e) {
                var t = new a4;
                if (t.writeVarint(aM), t.writeString(e.name), t.writeVarint(a_), t.writeDouble(e.value), t.writeVarint(aD), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
                    var r = a5(e.attributes);
                    t.writeVarint(aR), t.writeBytes(r)
                }
                return t.toBytes()
            }

            function a7(e) {
                var t = new a4;
                if (t.writeVarint(aB), t.writeString(e.name), t.writeVarint(aF), t.writeDouble(e.sum), t.writeVarint(aL), t.writeVarint(e.count), e.countsInBuckets.length > 0) {
                    var r = new a4,
                        n = !0,
                        a = !1,
                        o = void 0;
                    try {
                        for (var i, u = e.countsInBuckets[Symbol.iterator](); !(n = (i = u.next()).done); n = !0) {
                            var l = i.value;
                            r.writeVarint(l)
                        }
                    } catch (e) {
                        a = !0, o = e
                    } finally {
                        try {
                            n || null == u.return || u.return()
                        } finally {
                            if (a) throw o
                        }
                    }
                    var s = r.toBytes();
                    t.writeVarint(aG), t.writeBytes(s)
                }
                if (e.bucketIndices.length > 0) {
                    var c = new a4,
                        f = !0,
                        d = !1,
                        p = void 0;
                    try {
                        for (var h, y = e.bucketIndices[Symbol.iterator](); !(f = (h = y.next()).done); f = !0) {
                            var v = h.value;
                            c.writeVarint(v)
                        }
                    } catch (e) {
                        d = !0, p = e
                    } finally {
                        try {
                            f || null == y.return || y.return()
                        } finally {
                            if (d) throw p
                        }
                    }
                    var m = c.toBytes();
                    t.writeVarint(aH), t.writeBytes(m)
                }
                if (t.writeVarint(aW), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
                    var b = a5(e.attributes);
                    t.writeVarint(aY), t.writeBytes(b)
                }
                return t.toBytes()
            }

            function a9(e, t, r) {
                var n = new a4;
                n.writeVarint(aV), n.writeVarint(r);
                var a = !0,
                    o = !1,
                    i = void 0;
                try {
                    for (var u, l = e[Symbol.iterator](); !(a = (u = l.next()).done); a = !0) {
                        var s = u.value;
                        n.writeVarint(az), n.writeBytes(s)
                    }
                } catch (e) {
                    o = !0, i = e
                } finally {
                    try {
                        a || null == l.return || l.return()
                    } finally {
                        if (o) throw i
                    }
                }
                var c = !0,
                    f = !1,
                    d = void 0;
                try {
                    for (var p, h = t[Symbol.iterator](); !(c = (p = h.next()).done); c = !0) {
                        var y = p.value;
                        n.writeVarint(aq), n.writeBytes(y)
                    }
                } catch (e) {
                    f = !0, d = e
                } finally {
                    try {
                        c || null == h.return || h.return()
                    } finally {
                        if (f) throw d
                    }
                }
                return n.toBytes()
            }

            function oe(e, t, r, n, a) {
                var o = new a4;
                o.writeVarint(aX), o.writeVarint(n), o.writeVarint(a$), o.writeString(a), o.writeVarint(aV), o.writeVarint(r);
                var i = !0,
                    u = !1,
                    l = void 0;
                try {
                    for (var s, c = e[Symbol.iterator](); !(i = (s = c.next()).done); i = !0) {
                        var f = s.value;
                        o.writeVarint(az), o.writeBytes(f)
                    }
                } catch (e) {
                    u = !0, l = e
                } finally {
                    try {
                        i || null == c.return || c.return()
                    } finally {
                        if (u) throw l
                    }
                }
                var d = !0,
                    p = !1,
                    h = void 0;
                try {
                    for (var y, v = t[Symbol.iterator](); !(d = (y = v.next()).done); d = !0) {
                        var m = y.value;
                        o.writeVarint(aq), o.writeBytes(m)
                    }
                } catch (e) {
                    p = !0, h = e
                } finally {
                    try {
                        d || null == v.return || v.return()
                    } finally {
                        if (p) throw h
                    }
                }
                return o.toBytes()
            }

            function ot(e) {
                var t = new a4;
                t.writeVarint(aQ), t.writeString(a2), t.writeVarint(aK), t.writeBytes(e);
                var r = t.toBytes(),
                    n = new a4;
                return n.writeVarint(aJ), n.writeBytes(r), n.toBytes()
            }

            function or(e) {
                var t = new a4;
                t.writeVarint(aZ), t.writeString(a2);
                var r = !0,
                    n = !1,
                    a = void 0;
                try {
                    for (var o, i = e[Symbol.iterator](); !(r = (o = i.next()).done); r = !0) {
                        var u = o.value;
                        t.writeVarint(a0), t.writeBytes(u)
                    }
                } catch (e) {
                    n = !0, a = e
                } finally {
                    try {
                        r || null == i.return || i.return()
                    } finally {
                        if (n) throw a
                    }
                }
                var l = t.toBytes(),
                    s = new a4;
                return s.writeVarint(a1), s.writeBytes(l), s.toBytes()
            }
            var on = /^[a-zA-Z_][a-zA-Z0-9_]*$/;

            function oa(e) {
                return on.test(e)
            }
            var oo = [],
                oi = !1,
                ou = !1;

            function ol(e, t) {
                var r = e.map(function(e) {
                        return {
                            name: e.name,
                            value: e.value,
                            timestampMs: e.timestampMs,
                            attributes: e.attributes
                        }
                    }),
                    n = BigInt(Date.now());
                !0 === t || ou || "u" > typeof document && "hidden" === document.visibilityState ? aE("/v1/events/single", ot(a9(r.map(a8), [], n)).buffer) : aA("/v1/events/single", ot(a9(r.map(a8), [], n)))
            }

            function os() {
                var e = !0,
                    t = !1,
                    r = void 0;
                try {
                    for (var n, a = oo[Symbol.iterator](); !(e = (n = a.next()).done); e = !0) {
                        var o = n.value.splice(0);
                        0 !== o.length && ol(o, !0)
                    }
                } catch (e) {
                    t = !0, r = e
                } finally {
                    try {
                        e || null == a.return || a.return()
                    } finally {
                        if (t) throw r
                    }
                }
            }

            function oc(e, t) {
                var r, n, a, o = Math.max(1, null != (r = null == t ? void 0 : t.batchSize) ? r : 10),
                    i = null != (n = null == t ? void 0 : t.batchIntervalMs) ? n : 250;

                function u(e, r) {
                    (null == t ? void 0 : t.onError) ? t.onError(e, r): console.error(e, r)
                }
                if (!oa(e)) return u('@rbx/web-telemetry: invalid featureName "'.concat(e, '"'), {
                        name: e
                    }),
                    function() {};
                var l = [];
                return oo.push(l), oi || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                        "hidden" === document.visibilityState && os()
                    }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                        ou = !0, os()
                    }), oi = !0),
                    function(t, r, n) {
                        var s = "".concat(e, "_").concat(t);
                        if (! function(e, t) {
                                if (!oa(e)) return !1;
                                if (t) {
                                    var r = !0,
                                        n = !1,
                                        a = void 0;
                                    try {
                                        for (var o, i = Object.keys(t)[Symbol.iterator](); !(r = (o = i.next()).done); r = !0) {
                                            var u = o.value;
                                            if (!oa(u)) return !1
                                        }
                                    } catch (e) {
                                        n = !0, a = e
                                    } finally {
                                        try {
                                            r || null == i.return || i.return()
                                        } finally {
                                            if (n) throw a
                                        }
                                    }
                                }
                                return !0
                            }(s, r)) return void u("@rbx/web-telemetry: invalid event name or attribute key", {
                            name: t,
                            attributes: r
                        });
                        var c = null != n ? n : 1;
                        if (!Number.isFinite(c)) return void u("@rbx/web-telemetry: value must be a finite number", {
                            name: t,
                            attributes: r
                        });
                        var f = r && Object.keys(r).length > 0 ? r : void 0;
                        l.push({
                            name: s,
                            attributes: f,
                            value: c,
                            timestampMs: BigInt(Date.now())
                        }), l.length >= o ? (void 0 !== a && (clearTimeout(a), a = void 0), ol(l.splice(0, o))) : void 0 === a && (a = setTimeout(function() {
                            for (a = void 0; l.length > 0;) ol(l.splice(0, o))
                        }, i))
                    }
            }
            var of = {
                featureName: "PaymentsPackage",
                team: "Economy > Payments & Fraud",
                features: {
                    PriceTag: {
                        counters: [{
                            name: "PriceTag_ArabicLocaleTriggered"
                        }],
                        criticalErrors: [{
                            name: "PriceTag_NumberFormatLocaleException",
                            dimensions: ["currencyCode", "internalPageName"]
                        }, {
                            name: "PriceTag_DataNotValid",
                            dimensions: ["currencyCode"]
                        }]
                    },
                    RobuxBalance: {
                        counters: [{
                            name: "RobuxBalance_UpdatedOnRefetch"
                        }],
                        apiCalls: ["GetRobuxBalance"]
                    },
                    PaymentSession: {
                        apiCalls: ["CreatePaymentSession", "GetPaymentSession", "GetPaymentSessionByCheckoutSessionId"]
                    },
                    Metadata: {
                        apiCalls: ["GetMetadata"]
                    },
                    PersonalizedBonusItem: {
                        apiCalls: ["CreateOrGetBonusSessionByPaymentSessionId", "GetDisplayableBonusForProduct", "GetBonusSessionByCheckoutSessionId", "GetThumbnails", "HandleGameJoinEvent"]
                    },
                    CreditConversion: {
                        errors: [{
                            name: "Error_CreditConversion_ApiFailed",
                            dimensions: ["call", "statusCode"]
                        }]
                    },
                    CreditBalancePayment: {
                        errors: [{
                            name: "Error_CreditBalancePayment_UpdateAddressFailed",
                            dimensions: ["statusCode"]
                        }]
                    }
                }
            }, od = oc(of.featureName), op = as(of, {
                publish: od,
                captureException: ad
            }), oh = op.trackCounter, oy = op.trackError, ov = op.trackCriticalError, om = aw(od, ad);

            function ob(e, t, r, n, a, o, i) {
                try {
                    var u = e[o](i),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, a)
            }

            function og(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, a) {
                        var o = e.apply(t, r);

                        function i(e) {
                            ob(o, n, a, i, u, "next", e)
                        }

                        function u(e) {
                            ob(o, n, a, i, u, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function ow(e, t) {
                var r, n, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    u = Object.defineProperty;
                return u(i, "next", {
                    value: l(0)
                }), u(i, "throw", {
                    value: l(1)
                }), u(i, "return", {
                    value: l(2)
                }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function l(u) {
                    return function(l) {
                        var s = [u, l];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, s[0] && (o = 0)), o;) try {
                            if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                            switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                case 0:
                                case 1:
                                    a = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < a[1]) {
                                        o.label = a[1], a = s;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(s);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], n = 0
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

            function oS(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ox(e, t, r, n, a, o, i) {
                try {
                    var u = e[o](i),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, a)
            }

            function oC(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (r = a.next()).done) && (o.push(r.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, n = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return oS(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oS(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }(o = {
                publish: od,
                captureException: ad,
                featureName: of.featureName
            }).publish, o.captureException, o.featureName, x.Component;
            var oE = "paymentSession-".concat(null != (v = null == (m = function() {
                if ("u" > typeof document) {
                    var e, t;
                    return nx(null != (e = null == (t = document.querySelector('meta[name="user-data"]')) ? void 0 : t.dataset) ? e : document.documentElement.dataset)
                }
            }()) ? void 0 : m.id) ? v : "loggedout");

            function oA() {
                var e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
                return function() {
                    var e, t = arguments.length > 0 && void 0 !== arguments[0] && arguments[0],
                        r = oC((0, x.useState)(t ? void 0 : null !== (Date.now() >= n7 && n9(), e = n6(oE)) && void 0 !== e ? e : void 0), 2),
                        n = r[0],
                        a = r[1],
                        o = oC((0, x.useState)(!1), 2),
                        i = o[0],
                        u = o[1],
                        l = (0, x.useCallback)(function(e) {
                            var t;
                            return (t = function() {
                                var t, r;
                                return function(e, t) {
                                    var r, n, a, o = {
                                            label: 0,
                                            sent: function() {
                                                if (1 & a[0]) throw a[1];
                                                return a[1]
                                            },
                                            trys: [],
                                            ops: []
                                        },
                                        i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                        u = Object.defineProperty;
                                    return u(i, "next", {
                                        value: l(0)
                                    }), u(i, "throw", {
                                        value: l(1)
                                    }), u(i, "return", {
                                        value: l(2)
                                    }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                                        value: function() {
                                            return this
                                        }
                                    }), i;

                                    function l(u) {
                                        return function(l) {
                                            var s = [u, l];
                                            if (r) throw TypeError("Generator is already executing.");
                                            for (; i && (i = 0, s[0] && (o = 0)), o;) try {
                                                if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                                                switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                                    case 0:
                                                    case 1:
                                                        a = s;
                                                        break;
                                                    case 4:
                                                        return o.label++, {
                                                            value: s[1],
                                                            done: !1
                                                        };
                                                    case 5:
                                                        o.label++, n = s[1], s = [0];
                                                        continue;
                                                    case 7:
                                                        s = o.ops.pop(), o.trys.pop();
                                                        continue;
                                                    default:
                                                        if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                            o = 0;
                                                            continue
                                                        }
                                                        if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                                            o.label = s[1];
                                                            break
                                                        }
                                                        if (6 === s[0] && o.label < a[1]) {
                                                            o.label = a[1], a = s;
                                                            break
                                                        }
                                                        if (a && o.label < a[2]) {
                                                            o.label = a[2], o.ops.push(s);
                                                            break
                                                        }
                                                        a[2] && o.ops.pop(), o.trys.pop();
                                                        continue
                                                }
                                                s = t.call(e, o)
                                            } catch (e) {
                                                s = [6, e], n = 0
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
                                }(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            if (!e) return [3, 2];
                                            return [4, og(function() {
                                                return ow(this, function(t) {
                                                    return [2, om({
                                                        method: "GET",
                                                        url: "".concat(at.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-sessions/").concat(e),
                                                        config: {
                                                            withCredentials: !0
                                                        },
                                                        eventCounterProps: {
                                                            call: "GetPaymentSession"
                                                        }
                                                    }).then(function(e) {
                                                        return e.data
                                                    }).catch(function() {})]
                                                })
                                            })()];
                                        case 1:
                                            return r = n.sent(), [3, 4];
                                        case 2:
                                            return [4, og(function() {
                                                return ow(this, function(e) {
                                                    return [2, om({
                                                        method: "POST",
                                                        url: "".concat(at.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-sessions"),
                                                        data: {
                                                            paymentFlowId: aa().getPaymentFlowUuid()
                                                        },
                                                        config: {
                                                            withCredentials: !0
                                                        },
                                                        eventCounterProps: {
                                                            call: "CreatePaymentSession"
                                                        }
                                                    }).then(function(e) {
                                                        return e.data
                                                    }).catch(function() {})]
                                                })
                                            })()];
                                        case 3:
                                            r = n.sent(), n.label = 4;
                                        case 4:
                                            if (!(t = r)) return [2];
                                            return ae(oE, t.paymentSession), a(t.paymentSession), [2]
                                    }
                                })
                            }, function() {
                                var e = this,
                                    r = arguments;
                                return new Promise(function(n, a) {
                                    var o = t.apply(e, r);

                                    function i(e) {
                                        ox(o, n, a, i, u, "next", e)
                                    }

                                    function u(e) {
                                        ox(o, n, a, i, u, "throw", e)
                                    }
                                    i(void 0)
                                })
                            })()
                        }, []);
                    return (0, x.useEffect)(function() {
                        if (n) {
                            new Date(n.expiresAt) < new Date && (u(!0), l());
                            return
                        }
                        var e, t = null == (e = tG.urlService.getQueryParam("paymentSessionId")) ? void 0 : e.toString();
                        t || u(!0), l(t)
                    }, [l, n]), (0, x.useMemo)(function() {
                        return {
                            paymentSession: n,
                            wasCreatedByCurrentClient: i
                        }
                    }, [n, i])
                }(e).paymentSession
            }

            function ok(e, t, r, n, a, o, i) {
                try {
                    var u = e[o](i),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, a)
            }
            var oj = function(e, t) {
                var r;
                return (r = function() {
                    var r, n, a, o, i, u, l, s, c;
                    return function(e, t) {
                        var r, n, a, o = {
                                label: 0,
                                sent: function() {
                                    if (1 & a[0]) throw a[1];
                                    return a[1]
                                },
                                trys: [],
                                ops: []
                            },
                            i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                            u = Object.defineProperty;
                        return u(i, "next", {
                            value: l(0)
                        }), u(i, "throw", {
                            value: l(1)
                        }), u(i, "return", {
                            value: l(2)
                        }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                            value: function() {
                                return this
                            }
                        }), i;

                        function l(u) {
                            return function(l) {
                                var s = [u, l];
                                if (r) throw TypeError("Generator is already executing.");
                                for (; i && (i = 0, s[0] && (o = 0)), o;) try {
                                    if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                                    switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                        case 0:
                                        case 1:
                                            a = s;
                                            break;
                                        case 4:
                                            return o.label++, {
                                                value: s[1],
                                                done: !1
                                            };
                                        case 5:
                                            o.label++, n = s[1], s = [0];
                                            continue;
                                        case 7:
                                            s = o.ops.pop(), o.trys.pop();
                                            continue;
                                        default:
                                            if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                o = 0;
                                                continue
                                            }
                                            if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                                o.label = s[1];
                                                break
                                            }
                                            if (6 === s[0] && o.label < a[1]) {
                                                o.label = a[1], a = s;
                                                break
                                            }
                                            if (a && o.label < a[2]) {
                                                o.label = a[2], o.ops.push(s);
                                                break
                                            }
                                            a[2] && o.ops.pop(), o.trys.pop();
                                            continue
                                    }
                                    s = t.call(e, o)
                                } catch (e) {
                                    s = [6, e], n = 0
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
                    }(this, function(f) {
                        switch (f.label) {
                            case 0:
                                return f.trys.push([0, 3, , 4]), [4, e()];
                            case 1:
                                if (200 !== (i = f.sent()).status) return t.onStatusError(i.status), (0, N.fireEvent)("".concat(t.failedStatusPrefix).concat(i.status)), [2];
                                return (l = null != (r = null != (n = null == (u = null == (a = i.data) ? void 0 : a.providerPayload) ? void 0 : u.IsSuccessful) ? n : null == (o = i.data) ? void 0 : o.isSuccess) && r) || !t.unsuccessfulPrefix || (0, N.fireEvent)("".concat(t.unsuccessfulPrefix).concat((null == u ? void 0 : u.ResponseMessage) || "")), [4, t.onSuccess(i, l)];
                            case 2:
                                return f.sent(), [3, 4];
                            case 3:
                                return s = f.sent(), null == (c = t.onError) || c.call(t, s), [3, 4];
                            case 4:
                                return [2]
                        }
                    })
                }, function() {
                    var e = this,
                        t = arguments;
                    return new Promise(function(n, a) {
                        var o = r.apply(e, t);

                        function i(e) {
                            ok(o, n, a, i, u, "next", e)
                        }

                        function u(e) {
                            ok(o, n, a, i, u, "throw", e)
                        }
                        i(void 0)
                    })
                })()
            };

            function oP(e, t) {
                var r = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2];
                if (void 0 !== e && r) return {
                    amount: e,
                    currencyCode: t
                }
            }
            var oT = window.CoreRobloxUtilities,
                oN = "Label.RemainingBalance",
                oO = "Label.ConvertibleCredit",
                oI = "Action.Buy",
                oU = "Action.ConvertToRobux",
                oM = "Message.25PercentMoreRobuxConvert",
                o_ = "Alert.RobuxPackagePurchased",
                oD = "Alert.RobuxPackagePurchaseFailed",
                oR = "Alert.SuccessfullyConvertedCreditToRobux",
                oB = "Heading.CreditConversionFail",
                oF = "Alert.GenericFailure",
                oL = "Header.OrderSummary",
                oG = "Message.RobuxPurchased",
                oH = "Message.IncludesUpToTwentyFivePercentMoreRobux",
                oW = "ProcessPaymentRequestFailedStatusCode",
                oY = {
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

            function oV(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var oz = [],
                oq = !1,
                oX = !1;

            function o$() {
                var e = !0,
                    t = !1,
                    r = void 0;
                try {
                    for (var n, a = oz[Symbol.iterator](); !(e = (n = a.next()).done); e = !0)(0, n.value)()
                } catch (e) {
                    t = !0, r = e
                } finally {
                    try {
                        e || null == a.return || a.return()
                    } finally {
                        if (t) throw r
                    }
                }
            }
            var oQ = {
                    featureName: "RedeemGiftCard",
                    team: "Economy > Payments & Fraud",
                    features: {
                        health: {
                            apiCalls: ["GetRedemptionStatus"],
                            criticalErrors: ["Error_ReactCrash", "Error_NoRootContainer"],
                            counters: ["Page_Viewed", {
                                name: "GiftCard_RedeemPollStarted",
                                dimensions: ["source"]
                            }, {
                                name: "GiftCard_RedeemPollResolved",
                                dimensions: ["state", "polls", "source"]
                            }, {
                                name: "GiftCard_RedeemPollExhausted",
                                dimensions: ["source"]
                            }, {
                                name: "GiftCard_RedeemPollUnmounted",
                                dimensions: ["source"]
                            }],
                            errors: [{
                                name: "Error_GiftCard_RedeemPollFailed",
                                dimensions: ["reason", "source"]
                            }],
                            flows: [{
                                id: "gift_card_redeem",
                                title: "Gift card redeem (success & failed vs start)",
                                steps: [{
                                    counter: "GiftCard_RedeemStarted",
                                    role: "start",
                                    title: "Started"
                                }, {
                                    counter: "GiftCard_Redeemed",
                                    role: "success",
                                    title: "Redeemed"
                                }, {
                                    counter: "Error_GiftCard_RedeemFailed",
                                    role: "error",
                                    title: "Failed",
                                    dimensions: ["errorCode"]
                                }]
                            }]
                        },
                        scanGiftCard: {
                            apiCalls: ["ScanGiftCard"],
                            counters: ["CameraAccessUnmounted", "CameraRetryClicked"],
                            errors: ["Error_IxpLayerFetchFailed"],
                            flows: [{
                                id: "camera_access",
                                title: "Camera access (success & failed vs start)",
                                steps: [{
                                    counter: "CameraAccessStarted",
                                    role: "start",
                                    title: "Started"
                                }, {
                                    counter: "CameraAccessSuccess",
                                    role: "success",
                                    title: "Success"
                                }, {
                                    counter: "Error_CameraAccessFailed",
                                    role: "error",
                                    title: "Failed"
                                }, {
                                    counter: "Error_CameraAccessUnsupported",
                                    role: "error",
                                    title: "Unsupported"
                                }, {
                                    counter: "Error_CameraAccessException",
                                    role: "error",
                                    title: "Exception"
                                }]
                            }, {
                                id: "scan_attempt",
                                title: "Scan attempt (success & failed vs take photo)",
                                steps: [{
                                    counter: "TakePhotoClicked",
                                    role: "start",
                                    title: "Take photo"
                                }, {
                                    counter: "ScanCodeFound",
                                    role: "success",
                                    title: "Code found"
                                }, {
                                    counter: "ScanNoCodeFound",
                                    role: "error",
                                    title: "No code found"
                                }, {
                                    counter: "Error_ScanRequestFailed",
                                    role: "error",
                                    title: "Request failed"
                                }, {
                                    counter: "Error_ScanDrawImageException",
                                    role: "error",
                                    title: "Draw failed"
                                }]
                            }]
                        },
                        modals: {
                            criticalErrors: ["Error_ConfirmationModal_Crash", "Error_ScanGiftCardModal_Crash"]
                        },
                        creditConversion: {
                            counters: ["GetNextPurchasable_Unexpected", "GetNextPurchasable_CreditBalanceZero", {
                                name: "GetNextPurchasable_Success",
                                dimensions: ["type"]
                            }, {
                                name: "GetConversionMetadata_Failed",
                                dimensions: ["statusCode"]
                            }, {
                                name: "ProcessPayment_Unsuccessful",
                                dimensions: ["type"]
                            }, "ProcessPayment_Redirected", "ProcessPayment_Unexpected", "ProcessPayment_EconomicRestriction", "CreditConversion_SwitchedToProductPurchase", "CreditConversion_ProductSwitchFailed", "CreditConversion_ContinueClicked", "CreditConversion_CancelClicked", "ProductPurchase_CancelClicked", "Conversion_CancelClicked"]
                        },
                        getPlus: {
                            counters: [{
                                name: "GetPlus_AutoOpened",
                                dimensions: ["creditBucket", "currencyCode"]
                            }, {
                                name: "GetPlus_EntryClicked",
                                dimensions: ["creditBucket", "currencyCode"]
                            }, {
                                name: "GetPlus_TierSelected",
                                dimensions: ["tier", "source", "creditBucket", "currencyCode"]
                            }, {
                                name: "GetPlus_SubscribeClicked",
                                dimensions: ["tier"]
                            }, "GetPlus_PreparePurchase_Redirected", "GetPlus_Dismissed", {
                                name: "GetPlus_ListProducts_Success",
                                dimensions: ["hasProducts"]
                            }],
                            errors: ["Error_GetPlus_ListProducts_Failed", {
                                name: "Error_GetPlus_PreparePurchase_Failed",
                                dimensions: ["reason"]
                            }]
                        },
                        conversionFooter: {
                            counters: [{
                                name: "ConversionFooter_Viewed",
                                dimensions: ["getPlusVisible", "getRobuxVisible", "convertVisible", "creditBucket", "currencyCode"]
                            }, {
                                name: "GetRobux_EntryClicked",
                                dimensions: ["buttonType", "creditBucket", "currencyCode"]
                            }]
                        }
                    }
                },
                oK = oc(oQ.featureName);
            ! function(e, t) {
                r = t.flushIntervalMs;
                if (!oa(e)) {
                    return n = '@rbx/web-telemetry: invalid featureName "'.concat(e, '"'), a = {
                        name: e
                    }, t.onError ? t.onError(n, a) : console.error(n, a)
                }
                var r, n, a, o = new Map;
                oz.push(function() {
                    if (0 !== o.size) {
                        var e = o;
                        o = new Map;
                        var t = BigInt(Date.now()),
                            r = Array.from(e.values(), function(e) {
                                var r = function(e) {
                                        var t = [],
                                            r = [],
                                            n = !0,
                                            a = !1,
                                            o = void 0;
                                        try {
                                            for (var i, u = e[Symbol.iterator](); !(n = (i = u.next()).done); n = !0) {
                                                var l, s = (l = i.value, function(e) {
                                                        if (Array.isArray(e)) return e
                                                    }(l) || function(e) {
                                                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                                        if (null != n) {
                                                            var a = [],
                                                                o = !0,
                                                                i = !1;
                                                            try {
                                                                for (n = n.call(e); !(o = (t = n.next()).done) && (a.push(t.value), 2 !== a.length); o = !0);
                                                            } catch (e) {
                                                                i = !0, r = e
                                                            } finally {
                                                                try {
                                                                    o || null == n.return || n.return()
                                                                } finally {
                                                                    if (i) throw r
                                                                }
                                                            }
                                                            return a
                                                        }
                                                    }(l) || function(e) {
                                                        if (e) {
                                                            if ("string" == typeof e) return oV(e, 2);
                                                            var t = Object.prototype.toString.call(e).slice(8, -1);
                                                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return oV(e, 2)
                                                        }
                                                    }(l) || function() {
                                                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                                    }()),
                                                    c = s[0],
                                                    f = s[1];
                                                f > 0 && (t.push(c), r.push(BigInt(f)))
                                            }
                                        } catch (e) {
                                            a = !0, o = e
                                        } finally {
                                            try {
                                                n || null == u.return || u.return()
                                            } finally {
                                                if (a) throw o
                                            }
                                        }
                                        return {
                                            bucketIndices: t,
                                            countsInBuckets: r
                                        }
                                    }(e.bucketCounts),
                                    n = r.bucketIndices,
                                    a = r.countsInBuckets;
                                return {
                                    name: e.name,
                                    sum: e.sum,
                                    count: BigInt(e.count),
                                    bucketIndices: n,
                                    countsInBuckets: a,
                                    timestampMs: t,
                                    attributes: e.attributes
                                }
                            }),
                            n = BigInt(1),
                            a = "u" > typeof crypto && "function" == typeof crypto.randomUUID ? crypto.randomUUID() : "web-telemetry-".concat(Date.now(), "-").concat(Math.random().toString(16).slice(2));
                        oX || "u" > typeof document && "hidden" === document.visibilityState ? aE("/v1/events/optimized", or([oe([], r.map(a7), t, n, a)]).buffer) : aA("/v1/events/optimized", or([oe([], r.map(a7), t, n, a)]))
                    }
                }), oq || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                    "hidden" === document.visibilityState && o$()
                }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                    oX = !0, o$()
                }), oq = !0)
            }(oQ.featureName, {});
            var oJ = as(oQ, {
                    publish: oK,
                    captureException: ad,
                    featureName: oQ.featureName
                }),
                oZ = oJ.trackCounter;

            function o0(e, t, r, n, a, o, i) {
                try {
                    var u = e[o](i),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, a)
            }

            function o1(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, a) {
                        var o = e.apply(t, r);

                        function i(e) {
                            o0(o, n, a, i, u, "next", e)
                        }

                        function u(e) {
                            o0(o, n, a, i, u, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function o2(e, t) {
                var r, n, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    u = Object.defineProperty;
                return u(i, "next", {
                    value: l(0)
                }), u(i, "throw", {
                    value: l(1)
                }), u(i, "return", {
                    value: l(2)
                }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function l(u) {
                    return function(l) {
                        var s = [u, l];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, s[0] && (o = 0)), o;) try {
                            if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                            switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                case 0:
                                case 1:
                                    a = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < a[1]) {
                                        o.label = a[1], a = s;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(s);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], n = 0
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
            oJ.trackError, oJ.trackCriticalError, ag(oK), aw(oK, ad), ag(oK);
            var o3 = function(e) {
                    return o1(function() {
                        var t, r;
                        return o2(this, function(n) {
                            return t = {
                                paymentProviderType: "Credit",
                                providerPayload: {
                                    product_id: e || void 0
                                }
                            }, r = {
                                withCredentials: !0,
                                url: "".concat(at.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/process-payment")
                            }, [2, tG.httpService.post(r, t)]
                        })
                    })()
                },
                o4 = function(e, t) {
                    return o1(function() {
                        var r, n;
                        return o2(this, function(a) {
                            return r = {
                                withCredentials: !0,
                                url: "".concat(at.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/prepare-payment-for-credit-conversion")
                            }, n = {
                                paymentFlowId: oT.paymentFlowAnalyticsService.purchaseFlowUuid,
                                paymentSessionId: null == e ? void 0 : e.id,
                                address: t
                            }, [2, tG.httpService.post(r, n)]
                        })
                    })()
                },
                o6 = function(e, t, r, n) {
                    var a = e ? oT.paymentFlowAnalyticsService.ENUM_PURCHASE_STATUS.PASSED_PREPARE_PAYMENT_REQUEST : oT.paymentFlowAnalyticsService.ENUM_PURCHASE_STATUS.FAILED_PREPARE_PAYMENT_REQUEST;
                    n && (a = oT.paymentFlowAnalyticsService.ENUM_PURCHASE_STATUS.PASSED_PREPARE_PAYMENT_REQUEST_WITH_TAX);
                    var o = r ? t ? oT.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_PACKAGE_PURCHASE_MODAL_WITH_TAX : oT.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_PACKAGE_PURCHASE_MODAL_WITHOUT_TAX : t ? oT.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_CONVERSION_MODAL_WITH_TAX : oT.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_CONVERSION_MODAL_WITHOUT_TAX;
                    oT.paymentFlowAnalyticsService.sendUserPurchaseStatusEvent(oT.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_REDEEM_PAGE, a, void 0, o)
                },
                o5 = function(e) {
                    oT.paymentFlowAnalyticsService.sendUserPurchaseStatusEvent(oT.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_REDEEM_PAGE, e ? oT.paymentFlowAnalyticsService.ENUM_PURCHASE_STATUS.PASSED_GET_NEXT_PURCHASABLE_METADATA : oT.paymentFlowAnalyticsService.ENUM_PURCHASE_STATUS.FAILED_GET_NEXT_PURCHASABLE_METADATA, void 0, void 0)
                },
                o8 = function(e, t, r) {
                    var n = r ? t ? oT.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_PACKAGE_PURCHASE_MODAL_WITH_TAX : oT.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_PACKAGE_PURCHASE_MODAL_WITHOUT_TAX : t ? oT.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_CONVERSION_MODAL_WITH_TAX : oT.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_CONVERSION_MODAL_WITHOUT_TAX;
                    oT.paymentFlowAnalyticsService.sendUserPurchaseStatusEvent(oT.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_REDEEM_PAGE, e ? oT.paymentFlowAnalyticsService.ENUM_PURCHASE_STATUS.PASSED_UPDATE_ADDRESS_FOR_CHECKOUT_SESSION : oT.paymentFlowAnalyticsService.ENUM_PURCHASE_STATUS.FAILED_UPDATE_ADDRESS_FOR_CHECKOUT_SESSION, void 0, n)
                },
                o7 = function(e, t, r) {
                    var n = r ? t ? oT.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_PACKAGE_PURCHASE_MODAL_WITH_TAX : oT.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_PACKAGE_PURCHASE_MODAL_WITHOUT_TAX : t ? oT.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_CONVERSION_MODAL_WITH_TAX : oT.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_CONVERSION_MODAL_WITHOUT_TAX;
                    oT.paymentFlowAnalyticsService.sendUserPurchaseStatusEvent(oT.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_REDEEM_PAGE, e ? oT.paymentFlowAnalyticsService.ENUM_PURCHASE_STATUS.PASSED_PROCESS_PAYMENT : oT.paymentFlowAnalyticsService.ENUM_PURCHASE_STATUS.FAILED_PROCESS_PAYMENT, void 0, n)
                };

            function o9(e, t, r, n, a, o, i) {
                try {
                    var u = e[o](i),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, a)
            }

            function ie(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, a) {
                        var o = e.apply(t, r);

                        function i(e) {
                            o9(o, n, a, i, u, "next", e)
                        }

                        function u(e) {
                            o9(o, n, a, i, u, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function it(e) {
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

            function ir(e, t) {
                var r, n, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    u = Object.defineProperty;
                return u(i, "next", {
                    value: l(0)
                }), u(i, "throw", {
                    value: l(1)
                }), u(i, "return", {
                    value: l(2)
                }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function l(u) {
                    return function(l) {
                        var s = [u, l];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, s[0] && (o = 0)), o;) try {
                            if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                            switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                case 0:
                                case 1:
                                    a = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < a[1]) {
                                        o.label = a[1], a = s;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(s);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], n = 0
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
            var ia = function(e, t) {
                    return ie(function() {
                        var r, n;
                        return ir(this, function(a) {
                            return r = {
                                withCredentials: !0,
                                url: "".concat(at.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/update-address-for-checkout-session")
                            }, n = {
                                checkoutSessionId: t,
                                address: e
                            }, [2, tG.httpService.post(r, n)]
                        })
                    })()
                },
                io = function(e, t, r, n, a, o) {
                    var i, u, l = oT.upsellUtil.parseUpsellCookie(),
                        s = it({
                            paymentProviderType: "Credit",
                            providerPayload: (i = it({}, {
                                product_id: e,
                                upsellUuid: l.upsellUuid,
                                upsellItemPath: l.targetItemUrl,
                                checkoutSessionToken: n
                            }), u = u = {
                                productId: e
                            }, Object.getOwnPropertyDescriptors ? Object.defineProperties(i, Object.getOwnPropertyDescriptors(u)) : (function(e) {
                                var t = Object.keys(e);
                                if (Object.getOwnPropertySymbols) {
                                    var r = Object.getOwnPropertySymbols(e);
                                    t.push.apply(t, r)
                                }
                                return t
                            })(Object(u)).forEach(function(e) {
                                Object.defineProperty(i, e, Object.getOwnPropertyDescriptor(u, e))
                            }), i),
                            paymentSessionId: a,
                            checkoutSessionId: o
                        }, "" !== r && {
                            billingEmailType: r,
                            billingEmail: t
                        }),
                        c = {
                            withCredentials: !0,
                            url: "".concat(at.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/process-payment")
                        };
                    return tG.httpService.post(c, s)
                },
                ii = ((i = ii || {}).RobloxCredit = "robloxCredit", i.RedeemCard = "redeemCard", i.Credit = "credit", i);

            function iu(e) {
                return void 0 !== e.data && void 0 !== e.data.expirationTimeInMinutes && void 0 !== e.data.failureReason
            }

            function il(e, t) {
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

            function is(e) {
                var t = e.translate,
                    r = e.violation,
                    n = Math.ceil(e.timeoutDurationInMinutes / 60);
                if (n > 24) {
                    var a = Math.ceil(n / 24);
                    return t("Text.EconomicRestrictionsDays", {
                        violation: il(t, r),
                        day: a
                    })
                }
                return t("Text.EconomicRestrictionsHours", {
                    violation: il(t, r),
                    hour: n
                })
            }

            function ic(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var id = function(e) {
                    return !!e && (void 0 === e ? "undefined" : ic(e)) === "object" && ("number" == typeof e.status || "object" === ic(e.response) && null !== e.response && "number" == typeof e.response.status)
                },
                ip = function(e) {
                    var t;
                    if (id(e)) return e.status || (null == (t = e.response) ? void 0 : t.status)
                },
                ih = function(e) {
                    var t;
                    if (id(e)) return (null == (t = e.response) ? void 0 : t.data) || e.data
                },
                iy = function(e) {
                    var t = ip(e),
                        r = ih(e);
                    return 422 === t && 2 === r
                };

            function iv(e) {
                if (!((void 0 === e ? "undefined" : e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e) == "object" && null !== e && "config" in e)) return "NonAxiosError";
                var t, r = null == (t = e.response) ? void 0 : t.status;
                return r ? String(r) : "UnknownAxiosError"
            }

            function im(e, t, r, n, a, o, i) {
                try {
                    var u = e[o](i),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, a)
            }

            function ib(e, t, r, n) {
                var a;
                return (a = function(e, t, r, n) {
                    var a, o, i, u, l, s, c, f, d, p, h, y, v, m, b = arguments;
                    return function(e, t) {
                        var r, n, a, o = {
                                label: 0,
                                sent: function() {
                                    if (1 & a[0]) throw a[1];
                                    return a[1]
                                },
                                trys: [],
                                ops: []
                            },
                            i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                            u = Object.defineProperty;
                        return u(i, "next", {
                            value: l(0)
                        }), u(i, "throw", {
                            value: l(1)
                        }), u(i, "return", {
                            value: l(2)
                        }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                            value: function() {
                                return this
                            }
                        }), i;

                        function l(u) {
                            return function(l) {
                                var s = [u, l];
                                if (r) throw TypeError("Generator is already executing.");
                                for (; i && (i = 0, s[0] && (o = 0)), o;) try {
                                    if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                                    switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                        case 0:
                                        case 1:
                                            a = s;
                                            break;
                                        case 4:
                                            return o.label++, {
                                                value: s[1],
                                                done: !1
                                            };
                                        case 5:
                                            o.label++, n = s[1], s = [0];
                                            continue;
                                        case 7:
                                            s = o.ops.pop(), o.trys.pop();
                                            continue;
                                        default:
                                            if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                o = 0;
                                                continue
                                            }
                                            if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                                o.label = s[1];
                                                break
                                            }
                                            if (6 === s[0] && o.label < a[1]) {
                                                o.label = a[1], a = s;
                                                break
                                            }
                                            if (a && o.label < a[2]) {
                                                o.label = a[2], o.ops.push(s);
                                                break
                                            }
                                            a[2] && o.ops.pop(), o.trys.pop();
                                            continue
                                    }
                                    s = t.call(e, o)
                                } catch (e) {
                                    s = [6, e], n = 0
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
                    }(this, function(g) {
                        switch (g.label) {
                            case 0:
                                i = void 0 !== (o = (a = b.length > 4 && void 0 !== b[4] ? b[4] : {}).enableRetry) && o, u = a.counterPrefix, s = void 0 === (l = a.showErrorBanner) || l, c = a.onError, d = i ? 2 : 1, p = 1, g.label = 1;
                            case 1:
                                if (!(p <= d)) return [3, 6];
                                g.label = 2;
                            case 2:
                                return g.trys.push([2, 4, , 5]), [4, e()];
                            case 3:
                                return [2, g.sent()];
                            case 4:
                                var w;
                                if (f = h = g.sent(), y = p < d, v = ip(h), oy("Error_CreditConversion_ApiFailed", {
                                        call: t,
                                        statusCode: iv(h)
                                    }, h), v && u && (m = y ? "_RETRY" : "", (0, N.fireEvent)("".concat(u).concat(v).concat(m))), y && !(429 === (w = ip(h)) || "UpdateAddress" === t && iy(h)) && (w && w >= 400 && w < 500 ? 408 === w : !w || w >= 500)) return [3, 5];
                                return s && !("UpdateAddress" === t && iy(h)) && 1 && r.warning(n(oF) || "Something went wrong! Please try again later.", 200, 5e3), c && c(h), [3, 6];
                            case 5:
                                return p++, [3, 1];
                            case 6:
                                throw f
                        }
                    })
                }, function() {
                    var e = this,
                        t = arguments;
                    return new Promise(function(r, n) {
                        var o = a.apply(e, t);

                        function i(e) {
                            im(o, r, n, i, u, "next", e)
                        }

                        function u(e) {
                            im(o, r, n, i, u, "throw", e)
                        }
                        i(void 0)
                    })
                }).apply(this, arguments)
            }

            function ig(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iw(e, t, r, n, a, o, i) {
                try {
                    var u = e[o](i),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, a)
            }

            function iS(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, a) {
                        var o = e.apply(t, r);

                        function i(e) {
                            iw(o, n, a, i, u, "next", e)
                        }

                        function u(e) {
                            iw(o, n, a, i, u, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function ix(e) {
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
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (r = a.next()).done) && (o.push(r.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, n = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return ig(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ig(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function iE(e, t) {
                var r, n, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    u = Object.defineProperty;
                return u(i, "next", {
                    value: l(0)
                }), u(i, "throw", {
                    value: l(1)
                }), u(i, "return", {
                    value: l(2)
                }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function l(u) {
                    return function(l) {
                        var s = [u, l];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, s[0] && (o = 0)), o;) try {
                            if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                            switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                case 0:
                                case 1:
                                    a = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < a[1]) {
                                        o.label = a[1], a = s;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(s);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], n = 0
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
            var iA = (0, x.createContext)(void 0),
                ik = function(e) {
                    var t = e.children,
                        r = e.systemFeedbackService,
                        n = e.translate,
                        a = e.onSuccess,
                        o = oA(),
                        i = iC((0, x.useState)(!1), 2),
                        u = i[0],
                        l = i[1],
                        s = iC((0, x.useState)(!1), 2),
                        c = s[0],
                        f = s[1],
                        d = iC((0, x.useState)(!1), 2),
                        p = d[0],
                        h = d[1],
                        y = iC((0, x.useState)(!1), 2),
                        v = y[0],
                        m = y[1],
                        g = iC((0, x.useState)(""), 2),
                        w = g[0],
                        S = g[1],
                        C = iC((0, x.useState)(0), 2),
                        E = C[0],
                        A = C[1],
                        k = iC((0, x.useState)(0), 2),
                        j = k[0],
                        P = k[1],
                        T = iC((0, x.useState)(0), 2),
                        N = T[0],
                        O = T[1],
                        I = iC((0, x.useState)(0), 2),
                        U = I[0],
                        M = I[1],
                        _ = iC((0, x.useState)(null), 2),
                        D = _[0],
                        R = _[1],
                        B = iC((0, x.useState)(!1), 2),
                        F = B[0],
                        L = B[1],
                        G = iC((0, x.useState)(!1), 2),
                        H = G[0],
                        W = G[1],
                        Y = iC((0, x.useState)(void 0), 2),
                        V = Y[0],
                        z = Y[1],
                        q = iC((0, x.useState)(void 0), 2),
                        X = q[0],
                        $ = q[1],
                        Q = iC((0, x.useState)(!1), 2),
                        K = Q[0],
                        J = Q[1],
                        Z = iC((0, x.useState)(!1), 2),
                        ee = Z[0],
                        et = Z[1],
                        er = iC((0, x.useState)(!1), 2),
                        en = er[0],
                        ea = er[1],
                        eo = iC((0, x.useState)(!1), 2),
                        ei = eo[0],
                        eu = eo[1],
                        el = iC((0, x.useState)(void 0), 2),
                        es = el[0],
                        ec = el[1],
                        ef = iC((0, x.useState)(void 0), 2),
                        ed = ef[0],
                        ep = ef[1],
                        eh = iC((0, x.useState)(void 0), 2),
                        ey = eh[0],
                        ev = eh[1],
                        em = iC((0, x.useState)(!0), 2),
                        eb = em[0],
                        eg = em[1],
                        ew = (0, x.useMemo)(function() {
                            return {
                                call: function(e, t, a) {
                                    return ib(e, t, r, n, a)
                                },
                                callWithRetry: function(e, t, a) {
                                    return ib(e, t, r, n, {
                                        enableRetry: !0,
                                        counterPrefix: a
                                    })
                                },
                                callAddressUpdate: function(e, t) {
                                    return ib(e, "UpdateAddress", r, n, {
                                        enableRetry: !0,
                                        counterPrefix: t
                                    })
                                }
                            }
                        }, [r, n]),
                        eS = (0, x.useCallback)(function(e, t) {
                            r.warning(e, 200, 5e3), l(!1), f(!1), t && af && (af.location.href = tG.urlService.getAbsoluteUrl("/upgrades/robux"))
                        }, [r]),
                        ex = (0, x.useCallback)(function() {
                            eS(n(oF) || "Something went wrong! Please try again later.", !0)
                        }, [eS, n]),
                        eC = (0, x.useCallback)(function(e, t) {
                            var o = !t;
                            e ? (r.success(n(o ? oR : o_)), a && a(o)) : r.warning(n(o ? oB : oD) || n(oF) || "Something went wrong! Please try again later.", 200, 5e3)
                        }, [r, n, a]),
                        eE = (0, x.useCallback)(function(e) {
                            var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                                r = e.TaxAmount,
                                n = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, a, o = {};
                                    if ("u" > typeof Reflect && Reflect.ownKeys) {
                                        for (a = 0, r = Reflect.ownKeys(Object(e)); a < r.length; a++) n = r[a], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                        return o
                                    }
                                    if (o = function(e, t) {
                                            if (null == e) return {};
                                            var r, n, a = {},
                                                o = Object.getOwnPropertyNames(e);
                                            for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (a[r] = e[r]);
                                            return a
                                        }(e, t), Object.getOwnPropertySymbols)
                                        for (a = 0, r = Object.getOwnPropertySymbols(e); a < r.length; a++) n = r[a], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                    return o
                                }(e, ["TaxAmount"]);
                            void 0 !== r && z(r), R(function(e) {
                                return ix({}, e, n)
                            }), L(t), void 0 !== e.CheckoutSessionToken && ep(e.CheckoutSessionToken)
                        }, [R, L, ep, z]),
                        eA = (0, x.useCallback)(function(e) {
                            eu(e.robloxManagedTax), ec(e.checkoutSessionId), void 0 !== e.taxRate && $(e.taxRate), e.providerPayload.CurrencyCode && eE(e.providerPayload, e.hasBillingAddress)
                        }, [eu, ec, eE]),
                        ek = (0, x.useCallback)(function(e, t) {
                            return iS(function() {
                                var r, n;
                                return iE(this, function(a) {
                                    switch (a.label) {
                                        case 0:
                                            if (0 === e.productId) return [2, null];
                                            return [4, ew.call(function() {
                                                var r, n;
                                                return r = e.productId, n = ii.Credit, ie(function() {
                                                    var e, a;
                                                    return ir(this, function(i) {
                                                        return e = {
                                                            withCredentials: !0,
                                                            url: "".concat(at.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/prepare-payment")
                                                        }, a = {
                                                            paymentMethod: n,
                                                            productId: r,
                                                            paymentSessionId: null == o ? void 0 : o.id,
                                                            paymentFlowId: oT.paymentFlowAnalyticsService.getPaymentFlowUuid(),
                                                            address: t
                                                        }, [2, tG.httpService.post(e, a)]
                                                    })
                                                })()
                                            }, "PreparePayment")];
                                        case 1:
                                            if ((r = a.sent().data).isSuccess) return eA(r), (null == (n = r.selectedProduct) ? void 0 : n.price) !== void 0 && O(r.selectedProduct.price), o6(!0, r.robloxManagedTax, !0, null !== r.taxRate), [2, r.checkoutSessionId];
                                            return [2, null]
                                    }
                                })
                            })()
                        }, [o, eA, O, ew]),
                        ej = (0, x.useCallback)(function(e) {
                            return iS(function() {
                                var t;
                                return iE(this, function(r) {
                                    switch (r.label) {
                                        case 0:
                                            return [4, ew.call(function() {
                                                return o4(o, e)
                                            }, "PreparePaymentForCreditConversion")];
                                        case 1:
                                            if ((t = r.sent().data).isSuccess) return eA(t), o6(!0, t.robloxManagedTax, !1, null !== t.taxRate), [2, t.checkoutSessionId];
                                            return [2, null]
                                    }
                                })
                            })()
                        }, [o, eA, ew]),
                        eP = (0, x.useCallback)(function(e) {
                            0 !== e.productId ? (l(!0), f(!1), oZ("GetNextPurchasable_Success", {
                                type: "productPurchase"
                            })) : (f(!0), l(!1), oZ("GetNextPurchasable_Success", {
                                type: "conversion"
                            }))
                        }, [l, f]),
                        eT = (0, x.useCallback)(function(e) {
                            f(!1), l(!1), R(function(t) {
                                var r, n;
                                return t ? (r = ix({}, t), n = n = {
                                    AvailableCreditBalance: e
                                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e) {
                                    var t = Object.keys(e);
                                    if (Object.getOwnPropertySymbols) {
                                        var r = Object.getOwnPropertySymbols(e);
                                        t.push.apply(t, r)
                                    }
                                    return t
                                })(Object(n)).forEach(function(e) {
                                    Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                                }), r) : null
                            }), oZ("GetNextPurchasable_CreditBalanceZero")
                        }, [f, l, R]),
                        eN = (0, x.useCallback)(function(e) {
                            A(e.productId), 0 !== e.productId && (e.robuxAmountProductGrant && M(e.robuxAmountProductGrant), e.balanceDue && O(e.balanceDue))
                        }, [A, M, O]),
                        eO = (0, x.useCallback)(function(e, t) {
                            return iS(function() {
                                var r;
                                return iE(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            if (ev(t && !H ? t : void 0), 0 === e.creditBalance || 0 === e.productId && 0 === e.robuxConversionAmount) return eT(e.creditBalance), [2];
                                            eN(e), r = 0 !== e.productId, n.label = 1;
                                        case 1:
                                            if (n.trys.push([1, 6, , 7]), !r) return [3, 3];
                                            return [4, ek(e, t)];
                                        case 2:
                                            return n.sent(), [3, 5];
                                        case 3:
                                            return [4, ej(t)];
                                        case 4:
                                            n.sent(), n.label = 5;
                                        case 5:
                                            return eP(e), [3, 7];
                                        case 6:
                                            return n.sent(), o6(!1, ei, r), oZ("GetNextPurchasable_Unexpected"), [3, 7];
                                        case 7:
                                            return [2]
                                    }
                                })
                            })()
                        }, [H, eN, eT, eP, ek, ej, ei]),
                        eI = (0, x.useCallback)(function(e) {
                            return iS(function() {
                                var t;
                                return iE(this, function(r) {
                                    switch (r.label) {
                                        case 0:
                                            return [4, ew.callWithRetry(function() {
                                                return o1(function() {
                                                    var t, r;
                                                    return o2(this, function(n) {
                                                        return t = {
                                                            withCredentials: !0,
                                                            url: "".concat(at.EnvironmentUrls.apiGatewayUrl, "/credit-balance/v1/next-purchasable-metadata")
                                                        }, r = {
                                                            address: e
                                                        }, [2, tG.httpService.post(t, r)]
                                                    })
                                                })()
                                            }, "GetNextPurchasable", "NewCreditConversionGetNextPurchasableFailedStatusCode")];
                                        case 1:
                                            if (200 !== (t = r.sent()).status) throw o5(!1), Error("Get next purchasable metadata failed with status ".concat(t.status));
                                            return o5(!0), [4, eO(t.data, e)];
                                        case 2:
                                            return r.sent(), [2]
                                    }
                                })
                            })()
                        }, [ew, eO]),
                        eU = (0, x.useCallback)(function(e) {
                            return iS(function() {
                                return iE(this, function(t) {
                                    switch (t.label) {
                                        case 0:
                                            h(!0), t.label = 1;
                                        case 1:
                                            return t.trys.push([1, 3, 4, 5]), [4, eI(e)];
                                        case 2:
                                            return t.sent(), [3, 5];
                                        case 3:
                                            return t.sent(), oZ("GetNextPurchasable_Unexpected"), [3, 5];
                                        case 4:
                                            return h(!1), [7];
                                        case 5:
                                            return [2]
                                    }
                                })
                            })()
                        }, [eI]);
                    (0, x.useEffect)(function() {
                        var e, t, r, n, a = null != (e = null == D ? void 0 : D.AvailableCreditBalance) ? e : 0,
                            o = null != (t = null == D ? void 0 : D.RobuxConversionAmount) ? t : 0;
                        r = !v && (!ei || K && !ee), n = 0 === E ? a > 0 && o > 0 : a >= N, ea(r && n)
                    }, [ee, K, null == D ? void 0 : D.AvailableCreditBalance, null == D ? void 0 : D.RobuxConversionAmount, N, eb, v, E, ei]);
                    var eM = (0, x.useCallback)(function(e) {
                            J(e)
                        }, []),
                        e_ = (0, x.useCallback)(function(e) {
                            return iS(function() {
                                var t, r, a, o, i, u, l, s, c;
                                return iE(this, function(f) {
                                    switch (f.label) {
                                        case 0:
                                            if (eg(!0), !es) return [2];
                                            f.label = 1;
                                        case 1:
                                            return f.trys.push([1, 8, , 10]), et(!0), [4, ew.callAddressUpdate(function() {
                                                return ia(e, es)
                                            }, "UpdateAddressFailedStatusCode")];
                                        case 2:
                                            if (a = (r = (t = f.sent().data).providerPayload).AvailableCreditBalance, o = r.CurrencyCode, i = r.TaxAmount, u = r.CheckoutSessionToken, l = r.RobuxConversionAmount, s = r.TotalDue, c = t.taxRate, !(a < s)) return [3, 7];
                                            f.label = 3;
                                        case 3:
                                            return f.trys.push([3, 5, , 6]), [4, eI(e)];
                                        case 4:
                                        case 5:
                                            return f.sent(), [3, 6];
                                        case 6:
                                            return et(!1), [2];
                                        case 7:
                                            return eE({
                                                AvailableCreditBalance: a,
                                                CurrencyCode: o,
                                                TaxAmount: i,
                                                CheckoutSessionToken: u,
                                                RobuxConversionAmount: l
                                            }, !0), void 0 !== c && $(c), et(!1), [3, 10];
                                        case 8:
                                            var d;
                                            return [4, (d = f.sent(), iS(function() {
                                                return iE(this, function(t) {
                                                    switch (t.label) {
                                                        case 0:
                                                            if (!iy(d)) return [2, !1];
                                                            t.label = 1;
                                                        case 1:
                                                            return t.trys.push([1, 3, , 4]), oZ("CreditConversion_SwitchedToProductPurchase"), [4, eI(e)];
                                                        case 2:
                                                            return t.sent(), [2, !0];
                                                        case 3:
                                                            return t.sent(), oZ("CreditConversion_ProductSwitchFailed"), [2, !1];
                                                        case 4:
                                                            return [2]
                                                    }
                                                })
                                            })())];
                                        case 9:
                                            if (f.sent()) return [2];
                                            return et(!1), m(!0), S(n(oF) || "Something went wrong! Please try again later."), [3, 10];
                                        case 10:
                                            return [2]
                                    }
                                })
                            })()
                        }, [es, eE, eI, eg, n, ew]),
                        eD = (0, x.useCallback)(function(e, t) {
                            return iS(function() {
                                var t;
                                return iE(this, function(r) {
                                    switch (r.label) {
                                        case 0:
                                            if (t = 0 !== E ? "productPurchase" : "conversion", !e) return [3, 4];
                                            if (0 === E) return [3, 2];
                                            return [4, eU()];
                                        case 1:
                                            return r.sent(), [3, 3];
                                        case 2:
                                            f(!1), r.label = 3;
                                        case 3:
                                            return P(j + 1), oZ("ProcessPayment_Redirected"), [3, 5];
                                        case 4:
                                            l(!1), f(!1), oZ("ProcessPayment_Unsuccessful", {
                                                type: t
                                            }), r.label = 5;
                                        case 5:
                                            return [2]
                                    }
                                })
                            })()
                        }, [eU, j, P, l, f, E]),
                        eR = (0, x.useCallback)(function() {
                            return iS(function() {
                                var e;
                                return iE(this, function(t) {
                                    switch (t.label) {
                                        case 0:
                                            h(!0), t.label = 1;
                                        case 1:
                                            if (t.trys.push([1, 6, 7, 8]), !ed) return [3, 3];
                                            return [4, oj(function() {
                                                return io(E, "", "", ed, null == o ? void 0 : o.id, es)
                                            }, {
                                                failedStatusPrefix: oW,
                                                onStatusError: function() {
                                                    eC(!1, E), h(!1)
                                                },
                                                onSuccess: function(e, t) {
                                                    return iS(function() {
                                                        var r, n;
                                                        return iE(this, function(a) {
                                                            switch (a.label) {
                                                                case 0:
                                                                    return n = null == (r = e.data) ? void 0 : r.providerPayload, eC(t, E), [4, eD(t, (null == n ? void 0 : n.ResponseMessage) || "")];
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
                                            return [4, oj(function() {
                                                return o3(E)
                                            }, {
                                                failedStatusPrefix: oW,
                                                onStatusError: function() {
                                                    eC(!1, E), h(!1)
                                                },
                                                onSuccess: function(e) {
                                                    return iS(function() {
                                                        var t, r, n, a, o, i;
                                                        return iE(this, function(u) {
                                                            switch (u.label) {
                                                                case 0:
                                                                    return i = null != (t = (null == (o = e.data) ? void 0 : o.isSuccess) && (null == o || null == (n = o.providerPayload) ? void 0 : n.IsSuccessful)) && t, eC(null != (r = null == o ? void 0 : o.isSuccess) && r, E), [4, eD(i, (null == o || null == (a = o.providerPayload) ? void 0 : a.ResponseMessage) || "")];
                                                                case 1:
                                                                    return u.sent(), [2]
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
                                            if (iu(e = t.sent())) return eS(is({
                                                translate: n,
                                                violation: e.data.failureReason,
                                                timeoutDurationInMinutes: e.data.expirationTimeInMinutes
                                            }), !1), oZ("ProcessPayment_EconomicRestriction"), [2];
                                            return ex(), oZ("ProcessPayment_Unexpected"), [3, 8];
                                        case 7:
                                            return h(!1), [7];
                                        case 8:
                                            return [2]
                                    }
                                })
                            })()
                        }, [ed, E, o, es, eC, eS, ex, n, eD]),
                        eB = (0, x.useCallback)(function(e) {
                            P(0), m(!1), S(""), eU(e), P(1)
                        }, [eU]),
                        eF = (0, x.useCallback)(function() {
                            l(!1), oZ("ProductPurchase_CancelClicked")
                        }, []),
                        eL = (0, x.useCallback)(function() {
                            f(!1), oZ("Conversion_CancelClicked")
                        }, []),
                        eG = (0, x.useCallback)(function(e) {
                            m(!0), S(e)
                        }, []),
                        eH = (0, x.useCallback)(function(e) {
                            W(void 0 !== e)
                        }, []),
                        eW = (0, x.useMemo)(function() {
                            var e, t, r;
                            return {
                                isPurchaseModalOpen: u,
                                isConvertModalOpen: c,
                                isLoading: p,
                                isError: v,
                                errorMessage: w,
                                productId: E,
                                numberOfPurchase: j,
                                creditBalance: null != (e = null == D ? void 0 : D.AvailableCreditBalance) ? e : 0,
                                currencyCode: null != (t = null == D ? void 0 : D.CurrencyCode) ? t : "",
                                convertedRobuxAmount: null != (r = null == D ? void 0 : D.RobuxConversionAmount) ? r : 0,
                                totalBalanceDue: N,
                                robuxAmountInPackage: U,
                                tax: (null == D ? void 0 : D.CurrencyCode) ? oP(V, D.CurrencyCode, F) : void 0,
                                taxRate: X,
                                taxLoading: ee,
                                taxDisplay: K,
                                isTaxFlowEnabled: ei,
                                checkoutSessionId: es,
                                prefilledAddress: ey,
                                isPurchasable: en,
                                startCreditConversionFlow: eB,
                                closePurchaseModal: eF,
                                closeConvertModal: eL,
                                onUpdatedAddress: e_,
                                onTaxDisplayChange: eM,
                                processPaymentAction: eR,
                                updateError: eG,
                                setSavedUserAddress: eH
                            }
                        }, [u, c, p, v, w, E, j, D, F, V, X, ee, K, N, U, ei, es, ey, en, eB, eF, eL, e_, eM, eR, eG, eH]);
                    return (0, b.jsx)(iA.Provider, {
                        value: eW,
                        children: t
                    })
                },
                ij = function() {
                    var e = (0, x.useContext)(iA);
                    if (void 0 === e) throw Error("useHeuristicCreditConversionData must be used within a HeuristicCreditConversionContext");
                    return e
                },
                iP = {
                    common: ["Feature.Payment"],
                    feature: "Feature.BillingAddress"
                },
                iT = function() {
                    for (var e, t, r = 0, n = "", a = arguments.length; r < a; r++)(e = arguments[r]) && (t = function e(t) {
                        var r, n, a = "";
                        if ("string" == typeof t || "number" == typeof t) a += t;
                        else if ("object" == (void 0 === t ? "undefined" : t && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t))
                            if (Array.isArray(t)) {
                                var o = t.length;
                                for (r = 0; r < o; r++) t[r] && (n = e(t[r])) && (a && (a += " "), a += n)
                            } else
                                for (n in t) t[n] && (a && (a += " "), a += n);
                        return a
                    }(e)) && (n && (n += " "), n += t);
                    return n
                };

            function iN(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iO(e) {
                if (Array.isArray(e)) return e
            }

            function iI() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function iU(e, t) {
                if (e) {
                    if ("string" == typeof e) return iN(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return iN(e, t)
                }
            }
            var iM = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                i_ = C().forwardRef(function(e, t) {
                    var r, n = iO(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || iU(r) || iI(),
                        a = n[0],
                        o = n.slice(1),
                        i = a.name,
                        u = a.size,
                        l = a.className,
                        s = (a.children, function(e, t) {
                            if (null == e) return {};
                            var r, n, a, o = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (a = 0, r = Reflect.ownKeys(Object(e)); a < r.length; a++) n = r[a], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                                return o
                            }
                            if (o = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, a = {},
                                        o = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < o.length; n++) r = o[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (a[r] = e[r]);
                                    return a
                                }(e, t), Object.getOwnPropertySymbols)
                                for (a = 0, r = Object.getOwnPropertySymbols(e); a < r.length; a++) n = r[a], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n]);
                            return o
                        }(a, ["name", "size", "className", "children"])),
                        c = (iO(o) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var a = [],
                                    o = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(o = (t = n.next()).done) && (a.push(t.value), 1 !== a.length); o = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        o || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return a
                            }
                        }(o) || iU(o, 1) || iI())[0];
                    return C().createElement("span", function(e) {
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
                        ref: c,
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-icon",
                        className: iT("grow-0 shrink-0 basis-auto icon", i, iM[void 0 === u ? "Medium" : u], l)
                    }, s))
                });
            i_.displayName = "Icon";
            var iD = {
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
                iR = {
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
                iB = [{
                    code: "US",
                    name: "United States",
                    displayName: "United States"
                }, {
                    code: "CA",
                    name: "Canada",
                    displayName: "Canada"
                }];

            function iF(e, t, r, n, a, o, i) {
                try {
                    var u = e[o](i),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, a)
            }

            function iL(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, a) {
                        var o = e.apply(t, r);

                        function i(e) {
                            iF(o, n, a, i, u, "next", e)
                        }

                        function u(e) {
                            iF(o, n, a, i, u, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function iG(e, t) {
                var r, n, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    u = Object.defineProperty;
                return u(i, "next", {
                    value: l(0)
                }), u(i, "throw", {
                    value: l(1)
                }), u(i, "return", {
                    value: l(2)
                }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function l(u) {
                    return function(l) {
                        var s = [u, l];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, s[0] && (o = 0)), o;) try {
                            if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                            switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                case 0:
                                case 1:
                                    a = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < a[1]) {
                                        o.label = a[1], a = s;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(s);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], n = 0
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
            var iH = iD.saveBillingInformationLabel,
                iW = iH.key,
                iY = iH.default,
                iV = (0, A.withTranslations)(function(e) {
                    var t = e.disabled,
                        r = e.saveBillingInfo,
                        n = e.setSaveBillingInfo,
                        a = e.translate,
                        o = (0, x.useCallback)(function(e) {
                            n(e.target.checked)
                        }, [n]);
                    return (0, b.jsxs)("div", {
                        className: "save-billing-info-checkbox",
                        children: [(0, b.jsx)("input", {
                            id: "save-billing-info",
                            type: "checkbox",
                            className: "larger-checkbox",
                            onChange: o,
                            checked: r,
                            disabled: void 0 !== t && t,
                            tabIndex: 0
                        }), (0, b.jsx)("label", {
                            htmlFor: "save-billing-info",
                            className: "form-label",
                            children: a(iW) || iY
                        })]
                    })
                }, iP);

            function iz(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iq(e, t, r, n, a, o, i) {
                try {
                    var u = e[o](i),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, a)
            }

            function iX(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (r = a.next()).done) && (o.push(r.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, n = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return iz(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return iz(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var i$ = iD.countryLabel,
                iQ = i$.key,
                iK = i$.default,
                iJ = iD.PostalCode,
                iZ = iJ.key,
                i0 = iJ.default,
                i1 = iD.cityLabel,
                i2 = i1.key,
                i3 = i1.default,
                i4 = iD.stateLabel,
                i6 = i4.key,
                i5 = i4.default,
                i8 = iD.provinceLabel,
                i7 = i8.key,
                i9 = i8.default,
                ue = iD.saveButton,
                ut = ue.key,
                ur = ue.default,
                un = iD.cancelButton,
                ua = un.key,
                uo = un.default,
                ui = iD.approximateUserLocationDescription,
                uu = ui.key,
                ul = ui.default,
                us = function() {
                    return (0, b.jsx)("span", {
                        className: "required-indicator",
                        children: "*"
                    })
                },
                uc = (0, A.withTranslations)(function(e) {
                    var t, r, n, a, o, i, u = e.initialAddress,
                        l = e.hasSavedAddress,
                        s = e.processAddressSave,
                        c = e.onUpdateAddress,
                        f = e.onUpdateSuccess,
                        d = e.onTaxDisplayChange,
                        p = e.hideSaveSection,
                        h = e.triggeringContext,
                        y = e.translate,
                        v = iX((0, x.useState)(!l), 2),
                        m = v[0],
                        g = v[1],
                        w = iX((0, x.useState)(null != (t = null == u ? void 0 : u.country) ? t : "US"), 2),
                        S = w[0],
                        C = w[1],
                        A = iX((0, x.useState)(null != (r = null == u ? void 0 : u.state) ? r : ""), 2),
                        k = A[0],
                        j = A[1],
                        P = iX((0, x.useState)(null != (n = null == u ? void 0 : u.postalCode) ? n : ""), 2),
                        T = P[0],
                        N = P[1],
                        O = iX((0, x.useState)(null != (a = null == u ? void 0 : u.postalCode) ? a : ""), 2),
                        I = O[0],
                        U = O[1],
                        M = iX((0, x.useState)(null != (o = null == u ? void 0 : u.city) ? o : ""), 2),
                        _ = M[0],
                        D = M[1],
                        R = iX((0, x.useState)(null != (i = null == u ? void 0 : u.city) ? i : ""), 2),
                        B = R[0],
                        F = R[1],
                        L = (0, x.useRef)(!0),
                        G = y(iZ) || i0,
                        H = y(i2) || i3,
                        W = iB.map(function(e) {
                            return {
                                value: e.code,
                                label: e.displayName
                            }
                        }),
                        Y = "US" === S,
                        V = iX((0, x.useState)(!0), 2),
                        z = V[0],
                        q = V[1],
                        X = iX((0, x.useState)(!1), 2),
                        $ = X[0],
                        Q = X[1],
                        K = iX((0, x.useState)(l ? u : void 0), 2),
                        J = K[0],
                        Z = K[1];
                    (0, x.useEffect)(function() {
                        oT.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(h, !0, oT.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_BALANCE_BIILLING_ADDRESS_FORM, oT.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN, void 0, {
                            initial_address_available: u ? "true" : "false",
                            has_saved_address: l ? "true" : "false"
                        })
                    }, [l, u, h]);
                    var ee = (0, x.useCallback)(function() {
                            g(!0)
                        }, []),
                        et = (0, x.useCallback)(function() {
                            var e;
                            return (e = function() {
                                return function(e, t) {
                                    var r, n, a, o = {
                                            label: 0,
                                            sent: function() {
                                                if (1 & a[0]) throw a[1];
                                                return a[1]
                                            },
                                            trys: [],
                                            ops: []
                                        },
                                        i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                        u = Object.defineProperty;
                                    return u(i, "next", {
                                        value: l(0)
                                    }), u(i, "throw", {
                                        value: l(1)
                                    }), u(i, "return", {
                                        value: l(2)
                                    }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                                        value: function() {
                                            return this
                                        }
                                    }), i;

                                    function l(u) {
                                        return function(l) {
                                            var s = [u, l];
                                            if (r) throw TypeError("Generator is already executing.");
                                            for (; i && (i = 0, s[0] && (o = 0)), o;) try {
                                                if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                                                switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                                    case 0:
                                                    case 1:
                                                        a = s;
                                                        break;
                                                    case 4:
                                                        return o.label++, {
                                                            value: s[1],
                                                            done: !1
                                                        };
                                                    case 5:
                                                        o.label++, n = s[1], s = [0];
                                                        continue;
                                                    case 7:
                                                        s = o.ops.pop(), o.trys.pop();
                                                        continue;
                                                    default:
                                                        if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                            o = 0;
                                                            continue
                                                        }
                                                        if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                                            o.label = s[1];
                                                            break
                                                        }
                                                        if (6 === s[0] && o.label < a[1]) {
                                                            o.label = a[1], a = s;
                                                            break
                                                        }
                                                        if (a && o.label < a[2]) {
                                                            o.label = a[2], o.ops.push(s);
                                                            break
                                                        }
                                                        a[2] && o.ops.pop(), o.trys.pop();
                                                        continue
                                                }
                                                s = t.call(e, o)
                                            } catch (e) {
                                                s = [6, e], n = 0
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
                                }(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            var t;
                                            return e.trys.push([0, 2, , 3]), [4, (t = {
                                                country: S,
                                                state: k,
                                                city: _,
                                                postalCode: I
                                            }, iL(function() {
                                                var e, r;
                                                return iG(this, function(n) {
                                                    return e = {
                                                        withCredentials: !0,
                                                        url: "".concat(at.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/user-settings-address")
                                                    }, r = {
                                                        address: t
                                                    }, [2, tG.httpService.patch(e, r)]
                                                })
                                            })())];
                                        case 1:
                                            return 200 === e.sent().status && (null == f || f(), Z({
                                                country: S,
                                                state: k,
                                                city: _,
                                                postalCode: I
                                            })), [3, 3];
                                        case 2:
                                            return e.sent(), [3, 3];
                                        case 3:
                                            return [2]
                                    }
                                })
                            }, function() {
                                var t = this,
                                    r = arguments;
                                return new Promise(function(n, a) {
                                    var o = e.apply(t, r);

                                    function i(e) {
                                        iq(o, n, a, i, u, "next", e)
                                    }

                                    function u(e) {
                                        iq(o, n, a, i, u, "throw", e)
                                    }
                                    i(void 0)
                                })
                            })()
                        }, [S, k, _, I, f]);
                    (0, x.useEffect)(function() {
                        s && (p || l || z) && (p || !l) && et()
                    }, [s, S, k, _, I, f, z, et, p, l]);
                    var er = (0, x.useCallback)(function(e) {
                            return !!(e && e.length >= 2)
                        }, []),
                        en = (0, x.useCallback)(function(e) {
                            return !!e
                        }, []),
                        ea = (0, x.useCallback)(function(e) {
                            return !!(e && 5 === e.length)
                        }, []),
                        eo = (0, x.useCallback)(function() {
                            switch (S) {
                                case "US":
                                    return er(_) && en(k) && ea(I);
                                case "CA":
                                    return er(_) && en(k);
                                default:
                                    return !1
                            }
                        }, [S, k, _, I, er, en, ea]);
                    (0, x.useEffect)(function() {
                        !p && l ? null == d || d(eo() && !m) : null == d || d(eo())
                    }, [p, l, m, eo, d]), (0, x.useEffect)(function() {
                        L.current && (L.current = !1, l) || eo() && (null == c || c({
                            country: S,
                            state: k,
                            city: _,
                            postalCode: I
                        }))
                    }, [eo, S, k, _, I, c]);
                    var ei = (0, x.useCallback)(function() {
                            switch (S) {
                                case "US":
                                    return er(B) && en(k) && ea(T);
                                case "CA":
                                    return er(B) && en(k);
                                default:
                                    return !1
                            }
                        }, [S, k, B, T, er, en, ea]),
                        eu = (0, x.useCallback)(function() {
                            return S === (null == J ? void 0 : J.country) && k === (null == J ? void 0 : J.state) && _ === (null == J ? void 0 : J.city) && I === (null == J ? void 0 : J.postalCode)
                        }, [S, k, _, I, J]);
                    (0, x.useEffect)(function() {
                        eu() || Q(ei())
                    }, [ei, eu]);
                    var el = (0, x.useCallback)(function() {
                            U(T)
                        }, [T]),
                        es = (0, x.useCallback)(function() {
                            D(B)
                        }, [B]),
                        ec = (0, x.useCallback)(function(e) {
                            C(e.target.value), j(""), D(""), F(""), U(""), N("")
                        }, []),
                        ef = (0, x.useCallback)(function(e) {
                            var t;
                            if (!(null != (t = iR[S]) ? t : []).some(function(t) {
                                    return t.value === e.target.value
                                })) {
                                j(""), U(""), N("");
                                return
                            }
                            j(e.target.value), U(""), N("")
                        }, [S]),
                        ed = (0, x.useMemo)(function() {
                            return (0, b.jsxs)("div", {
                                className: "country-field",
                                children: [(0, b.jsxs)("label", {
                                    htmlFor: "country-select",
                                    className: "form-label",
                                    children: [y(iQ) || iK, " ", (0, b.jsx)(us, {})]
                                }), (0, b.jsx)(E.NativeDropdown, {
                                    id: "country-select",
                                    selectionItems: W,
                                    selectedItemvalue: S,
                                    onChange: ec,
                                    className: "country-select-container"
                                })]
                            })
                        }, [W, ec, S, y]),
                        ep = (0, x.useMemo)(function() {
                            return (0, b.jsxs)("div", {
                                className: "city-field",
                                children: [(0, b.jsxs)("label", {
                                    htmlFor: "city-input",
                                    className: "form-label",
                                    children: [H, " ", (0, b.jsx)(us, {})]
                                }), (0, b.jsx)("div", {
                                    className: "city-input-container",
                                    children: (0, b.jsx)("input", {
                                        id: "city-input",
                                        type: "text",
                                        value: B,
                                        onChange: function(e) {
                                            F(e.target.value)
                                        },
                                        onBlur: es,
                                        placeholder: H
                                    })
                                })]
                            })
                        }, [H, B, es]),
                        eh = (0, x.useMemo)(function() {
                            var e, t = "US" === S ? "Select State" : "Select Province";
                            return (0, b.jsxs)("div", {
                                className: "state-field",
                                children: [(0, b.jsxs)("label", {
                                    htmlFor: "state-select",
                                    className: "form-label",
                                    children: ["US" === S ? y(i6) || i5 : y(i7) || i9, " ", (0, b.jsx)(us, {})]
                                }), (0, b.jsx)(E.NativeDropdown, {
                                    id: "state-select",
                                    placeholder: t,
                                    selectionItems: null != (e = iR[S]) ? e : [],
                                    selectedItemvalue: k || t,
                                    onChange: ef,
                                    className: "state-select-container"
                                })]
                            })
                        }, [ef, k, S, y]),
                        ey = (0, x.useMemo)(function() {
                            return (0, b.jsxs)("div", {
                                className: "zip-code-field",
                                children: [(0, b.jsxs)("label", {
                                    htmlFor: "zip-code-input",
                                    className: "form-label",
                                    children: [G, " ", (0, b.jsx)(us, {})]
                                }), (0, b.jsx)("div", {
                                    className: "postal-code-input-container",
                                    children: (0, b.jsx)("input", {
                                        id: "postal-code-input",
                                        type: "text",
                                        inputMode: "US" === S ? "numeric" : "text",
                                        pattern: "US" === S ? "[0-9]*" : void 0,
                                        value: T,
                                        onBlur: el,
                                        onChange: function(e) {
                                            var t = e.target.value;
                                            /^\d*$/.test(t) && (N(t), "US" === S && 5 === t.length && U(t))
                                        },
                                        placeholder: G,
                                        maxLength: "US" === S ? 5 : void 0
                                    })
                                })]
                            })
                        }, [G, S, T, el]),
                        ev = (0, x.useCallback)(function() {
                            return Y ? (0, b.jsxs)("div", {
                                className: "form-group billing-address-form-group",
                                children: [(0, b.jsxs)("div", {
                                    className: "billing-fields-row",
                                    children: [ed, ep]
                                }), (0, b.jsxs)("div", {
                                    className: "billing-fields-row",
                                    children: [eh, ey]
                                })]
                            }) : (0, b.jsxs)("div", {
                                className: "form-group billing-address-form-group",
                                children: [(0, b.jsx)("div", {
                                    className: "billing-fields-row",
                                    children: ed
                                }), (0, b.jsxs)("div", {
                                    className: "billing-fields-row",
                                    children: [ep, eh]
                                })]
                            })
                        }, [ep, ed, Y, eh, ey]),
                        em = (0, x.useCallback)(function() {
                            et(), g(!1), Q(!1)
                        }, [et, g, Q]),
                        eb = (0, x.useCallback)(function() {
                            var e, t, r, n, a, o;
                            U(null != (e = null == J ? void 0 : J.postalCode) ? e : ""), N(null != (t = null == J ? void 0 : J.postalCode) ? t : ""), D(null != (r = null == J ? void 0 : J.city) ? r : ""), F(null != (n = null == J ? void 0 : J.city) ? n : ""), j(null != (a = null == J ? void 0 : J.state) ? a : ""), C(null != (o = null == J ? void 0 : J.country) ? o : "US"), g(!1)
                        }, [J, U, D, j, C]),
                        eg = (0, x.useMemo)(function() {
                            return l ? (0, b.jsxs)("div", {
                                className: "billing-address-buttons",
                                children: [(0, b.jsx)(E.Button, {
                                    variant: E.Button.variants.growth,
                                    size: E.Button.sizes.medium,
                                    width: E.Button.widths.default,
                                    onClick: em,
                                    className: "mr-2 save-address-button",
                                    isDisabled: !$,
                                    children: y(ut) || ur
                                }), (0, b.jsx)(E.Button, {
                                    variant: E.Button.variants.control,
                                    size: E.Button.sizes.medium,
                                    width: E.Button.widths.default,
                                    onClick: eb,
                                    className: "ml-2 cancel-address-button",
                                    children: y(ua) || uo
                                })]
                            }) : (0, b.jsx)(iV, {
                                saveBillingInfo: z,
                                setSaveBillingInfo: q
                            })
                        }, [eb, em, $, z, l, y]);
                    if (!m) {
                        var ew = Y ? "".concat(null == J ? void 0 : J.city, ", ").concat(null == J ? void 0 : J.state, ", ").concat(null == J ? void 0 : J.postalCode, ", ").concat(null == J ? void 0 : J.country) : "".concat(null == J ? void 0 : J.city, ", ").concat(null == J ? void 0 : J.state, ", ").concat(null == J ? void 0 : J.country);
                        return (0, b.jsxs)("div", {
                            className: "formatted-address-container",
                            children: [(0, b.jsx)("p", {
                                className: "formatted-address-label",
                                children: ew
                            }), (0, b.jsx)("button", {
                                type: "button",
                                onClick: ee,
                                "aria-label": "Edit billing address",
                                className: "edit-address-button",
                                children: (0, b.jsx)(i_, {
                                    name: "icon-regular-pencil",
                                    size: "Large"
                                })
                            })]
                        })
                    }
                    return (0, b.jsxs)("div", {
                        className: "billing-address-form-container",
                        children: [!p && (0, b.jsx)("p", {
                            className: "approximate-user-location-label",
                            children: y(uu) || ul
                        }), ev(), !p && eg]
                    })
                }, iP);

            function uf(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ud(e, t, r, n, a, o, i) {
                try {
                    var u = e[o](i),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, a)
            }

            function up(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, a) {
                        var o = e.apply(t, r);

                        function i(e) {
                            ud(o, n, a, i, u, "next", e)
                        }

                        function u(e) {
                            ud(o, n, a, i, u, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function uh(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (r = a.next()).done) && (o.push(r.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, n = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return uf(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return uf(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function uy(e, t) {
                var r, n, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    u = Object.defineProperty;
                return u(i, "next", {
                    value: l(0)
                }), u(i, "throw", {
                    value: l(1)
                }), u(i, "return", {
                    value: l(2)
                }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function l(u) {
                    return function(l) {
                        var s = [u, l];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, s[0] && (o = 0)), o;) try {
                            if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                            switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                case 0:
                                case 1:
                                    a = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < a[1]) {
                                        o.label = a[1], a = s;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(s);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], n = 0
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
            var uv = iD.billingInformationHeader,
                um = uv.key,
                ub = uv.default,
                ug = (0, A.withTranslations)(function(e) {
                    var t, r = e.processAddressSave,
                        n = e.onUpdateAddress,
                        a = e.prefilledAddress,
                        o = e.onUpdateSuccess,
                        i = e.onTaxDisplayChange,
                        u = e.hideSaveSection,
                        l = e.onSavedAddressLoaded,
                        s = e.triggeringContext,
                        c = e.translate,
                        f = uh((0, x.useState)(!0), 2),
                        d = f[0],
                        p = f[1],
                        h = uh((0, x.useState)(), 2),
                        y = h[0],
                        v = h[1],
                        m = uh((0, x.useState)(), 2),
                        g = m[0],
                        w = m[1];
                    return ((0, x.useEffect)(function() {
                        if (a) {
                            null == l || l(void 0), p(!1);
                            return
                        }
                        up(function() {
                            return uy(this, function(e) {
                                switch (e.label) {
                                    case 0:
                                        return [4, Promise.all([up(function() {
                                            var e, t, r, n;
                                            return uy(this, function(a) {
                                                switch (a.label) {
                                                    case 0:
                                                        return a.trys.push([0, 2, , 3]), [4, iL(function() {
                                                            var e, t;
                                                            return iG(this, function(r) {
                                                                return e = {
                                                                    withCredentials: !0,
                                                                    url: "".concat(at.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/user-settings-address")
                                                                }, t = {}, [2, tG.httpService.get(e, t)]
                                                            })
                                                        })()];
                                                    case 1:
                                                        return t = (e = a.sent().data.address).country, r = e.state, v(n = {
                                                            country: t,
                                                            state: r,
                                                            city: e.city,
                                                            postalCode: e.postalCode
                                                        }), null == l || l(n), [3, 3];
                                                    case 2:
                                                        return a.sent(), null == l || l(void 0), [3, 3];
                                                    case 3:
                                                        return [2]
                                                }
                                            })
                                        })(), up(function() {
                                            var e, t, r, n, a, o;
                                            return uy(this, function(i) {
                                                switch (i.label) {
                                                    case 0:
                                                        return i.trys.push([0, 2, , 3]), [4, iL(function() {
                                                            var e, t;
                                                            return iG(this, function(r) {
                                                                return e = {
                                                                    withCredentials: !0,
                                                                    url: "".concat(at.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/user-location/approximate-location")
                                                                }, t = {}, [2, tG.httpService.get(e, t)]
                                                            })
                                                        })()];
                                                    case 1:
                                                        return r = (t = i.sent().data).countryCode, n = t.subdivision, a = t.city, o = t.postalCode, oT.paymentFlowAnalyticsService.sendUserPurchaseStatusEvent(s, oT.paymentFlowAnalyticsService.ENUM_PURCHASE_STATUS.PASSED_GET_APPROXIMATE_USER_LOCATION, void 0, oT.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_BALANCE_BIILLING_ADDRESS_FORM), iB.some(function(e) {
                                                            return e.code === r
                                                        }) && (null == (e = iR[r]) ? void 0 : e.some(function(e) {
                                                            return e.value === n
                                                        })) && w({
                                                            country: r,
                                                            state: n,
                                                            city: a,
                                                            postalCode: o
                                                        }), [3, 3];
                                                    case 2:
                                                        return i.sent(), oT.paymentFlowAnalyticsService.sendUserPurchaseStatusEvent(s, oT.paymentFlowAnalyticsService.ENUM_PURCHASE_STATUS.FAILED_GET_APPROXIMATE_USER_LOCATION, void 0, oT.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_BALANCE_BIILLING_ADDRESS_FORM), [3, 3];
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
                    }, [a, l]), d) ? null : (0, b.jsxs)("div", {
                        className: "billing-info-container",
                        children: [(0, b.jsx)("h5", {
                            className: "billing-info-title",
                            children: c(um) || ub
                        }), (0, b.jsx)(uc, {
                            processAddressSave: r,
                            initialAddress: null != (t = null != a ? a : y) ? t : g,
                            hasSavedAddress: void 0 !== y,
                            onUpdateAddress: n,
                            onUpdateSuccess: o,
                            onTaxDisplayChange: i,
                            hideSaveSection: u,
                            triggeringContext: s
                        })]
                    })
                }, iP),
                uw = function(e) {
                    var t = e.processAddressSave,
                        r = e.onUpdateAddress,
                        n = e.prefilledAddress,
                        a = e.onUpdateSuccess,
                        o = e.onTaxDisplayChange,
                        i = e.hideSaveSection,
                        u = e.onSavedAddressLoaded,
                        l = e.triggeringContext;
                    return (0, b.jsx)(ug, {
                        processAddressSave: t,
                        onUpdateAddress: r,
                        prefilledAddress: n,
                        onUpdateSuccess: a,
                        onTaxDisplayChange: o,
                        hideSaveSection: i,
                        onSavedAddressLoaded: u,
                        triggeringContext: l
                    })
                },
                uS = window.PropTypes,
                ux = r.n(uS),
                uC = r(611),
                uE = r.n(uC),
                uA = function() {
                    if ("u" > typeof document) {
                        var e = document.querySelector('meta[name="page-meta"]');
                        return null == e ? void 0 : e.dataset.internalPageName
                    }
                },
                uk = ["JPY"];

            function uj(e) {
                var t = function(e) {
                        var t, r = e.amount,
                            n = e.currencyCode,
                            a = e.tagClassName,
                            o = Math.abs(r),
                            i = "".concat(o).concat(n),
                            u = uE()("price-tag", a);
                        try {
                            var l, s = (l = Intl.NumberFormat().resolvedOptions().locale).startsWith("ar-") ? (oh("PriceTag_ArabicLocaleTriggered"), l.replace("ar-", "en-")) : l,
                                c = {
                                    style: "currency",
                                    currency: n,
                                    notation: "standard"
                                };
                            o >= 1e4 && !uk.includes(n) && (c.minimumFractionDigits = 0, c.maximumFractionDigits = 2, c.maximumSignificantDigits = 21, c.notation = "compact"), u.split(" ").includes("navbar-compact") && (c.maximumSignificantDigits = 4), i = Intl.NumberFormat(s, c).format(o)
                        } catch (e) {
                            ov("PriceTag_NumberFormatLocaleException", {
                                currencyCode: null === n ? "null" : void 0 === n ? "undefined" : "" === n ? "empty" : "string" == typeof n && /^[a-z]{3}$/i.test(n) ? n.toUpperCase() : "invalid",
                                internalPageName: null != (t = uA()) ? t : "unknown"
                            })
                        }
                        return {
                            formattedAmount: i,
                            isNegative: r < 0,
                            className: u
                        }
                    }({
                        amount: e.amount,
                        currencyCode: e.currencyCode,
                        tagClassName: e.tagClassName
                    }),
                    r = t.formattedAmount,
                    n = t.isNegative,
                    a = t.className;
                return (0, b.jsxs)("div", {
                    className: "d-flex-inline gap-1 justify-content-start align-items-center",
                    children: [n && (0, b.jsx)("span", {
                        className: a,
                        children: "-"
                    }), (0, b.jsx)("span", {
                        className: a,
                        children: r
                    })]
                })
            }
            uj.propTypes = {
                amount: ux().number.isRequired,
                currencyCode: ux().string.isRequired
            };
            var uP = {
                    common: ["CommonUI.Controls", "CommonUI.Features", "IAPExperience.PurchaseError", "Feature.NotApproved", "Feature.PaymentRedeem", "Feature.Payment", "Feature.BillingAddress"],
                    feature: "Purchasing.RedeemGameCard"
                },
                uT = function(e) {
                    var t = e.translate,
                        r = e.tax,
                        n = e.taxRate,
                        a = e.taxDisplay,
                        o = e.visible,
                        i = e.isLoading,
                        u = void 0 !== i && i,
                        l = (0, x.useMemo)(function() {
                            return t("Label.Tax") || "Tax"
                        }, [t]),
                        s = (0, x.useMemo)(function() {
                            return u || null == n || !a ? null : (100 * n).toFixed(2)
                        }, [n, u, a]),
                        c = (0, x.useMemo)(function() {
                            return t("Description.TaxInfoTooltip") || "Tax is determined by billing information"
                        }, [t]);
                    return void 0 === o || o ? (0, b.jsxs)("div", {
                        className: "tax-line d-flex justify-content-between row-pad",
                        children: [(0, b.jsxs)("span", {
                            className: "flex items-center gap-xsmall bold",
                            children: [l, s && " (".concat(s, "%)"), (0, b.jsx)(E.Tooltip, {
                                id: "tax-info-tooltip",
                                placement: "right",
                                content: c,
                                children: (0, b.jsx)(i_, {
                                    name: "icon-regular-circle-i",
                                    size: "Large"
                                })
                            })]
                        }), a ? u ? (0, b.jsxs)("div", {
                            className: "calculating-tax",
                            children: [(0, b.jsx)("span", {
                                className: "loading-spinner"
                            }), (0, b.jsx)("span", {
                                children: t("Label.CalculatingTax") || "Calculating tax..."
                            })]
                        }) : r ? (0, b.jsx)(uj, {
                            amount: -1 * (r.amount || 0),
                            currencyCode: r.currencyCode
                        }) : (0, b.jsx)("span", {
                            className: "text-placeholder",
                            children: "—"
                        }) : (0, b.jsx)("span", {
                            className: "text-placeholder",
                            children: "—"
                        })]
                    }) : null
                };

            function uN(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function uO(e, t, r, n, a, o, i) {
                try {
                    var u = e[o](i),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, a)
            }

            function uI(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (r = a.next()).done) && (o.push(r.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, n = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return uN(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return uN(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var uU = uI((0, E.createModal)(), 2),
                uM = uU[0],
                u_ = uU[1],
                uD = (0, A.withTranslations)(function(e) {
                    var t = e.translate,
                        r = ij(),
                        n = r.isPurchaseModalOpen,
                        a = r.isLoading,
                        o = r.creditBalance,
                        i = r.totalBalanceDue,
                        u = r.currencyCode,
                        l = r.numberOfPurchase,
                        s = r.robuxAmountInPackage,
                        c = r.tax,
                        f = r.taxRate,
                        d = r.taxLoading,
                        p = r.taxDisplay,
                        h = r.isTaxFlowEnabled,
                        y = r.onUpdatedAddress,
                        v = r.onTaxDisplayChange,
                        m = r.processPaymentAction,
                        g = r.closePurchaseModal,
                        w = r.prefilledAddress,
                        S = r.isPurchasable,
                        A = r.setSavedUserAddress,
                        k = uI((0, x.useState)(!1), 2),
                        j = k[0],
                        P = k[1];
                    (0, x.useEffect)(function() {
                        n ? (u_.open(), oT.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(oT.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_REDEEM_PAGE, !0, h ? oT.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_PACKAGE_PURCHASE_MODAL_WITH_TAX : oT.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_PACKAGE_PURCHASE_MODAL_WITHOUT_TAX, oT.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN)) : u_.close()
                    }, [n, h]);
                    var T = (0, x.useCallback)(function(e) {
                            var t;
                            return (t = function() {
                                var t;
                                return function(e, t) {
                                    var r, n, a, o = {
                                            label: 0,
                                            sent: function() {
                                                if (1 & a[0]) throw a[1];
                                                return a[1]
                                            },
                                            trys: [],
                                            ops: []
                                        },
                                        i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                        u = Object.defineProperty;
                                    return u(i, "next", {
                                        value: l(0)
                                    }), u(i, "throw", {
                                        value: l(1)
                                    }), u(i, "return", {
                                        value: l(2)
                                    }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                                        value: function() {
                                            return this
                                        }
                                    }), i;

                                    function l(u) {
                                        return function(l) {
                                            var s = [u, l];
                                            if (r) throw TypeError("Generator is already executing.");
                                            for (; i && (i = 0, s[0] && (o = 0)), o;) try {
                                                if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                                                switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                                    case 0:
                                                    case 1:
                                                        a = s;
                                                        break;
                                                    case 4:
                                                        return o.label++, {
                                                            value: s[1],
                                                            done: !1
                                                        };
                                                    case 5:
                                                        o.label++, n = s[1], s = [0];
                                                        continue;
                                                    case 7:
                                                        s = o.ops.pop(), o.trys.pop();
                                                        continue;
                                                    default:
                                                        if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                            o = 0;
                                                            continue
                                                        }
                                                        if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                                            o.label = s[1];
                                                            break
                                                        }
                                                        if (6 === s[0] && o.label < a[1]) {
                                                            o.label = a[1], a = s;
                                                            break
                                                        }
                                                        if (a && o.label < a[2]) {
                                                            o.label = a[2], o.ops.push(s);
                                                            break
                                                        }
                                                        a[2] && o.ops.pop(), o.trys.pop();
                                                        continue
                                                }
                                                s = t.call(e, o)
                                            } catch (e) {
                                                s = [6, e], n = 0
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
                                }(this, function(r) {
                                    switch (r.label) {
                                        case 0:
                                            return r.trys.push([0, 2, , 3]), [4, y(e)];
                                        case 1:
                                            return r.sent(), o8(!0, h, !0), [3, 3];
                                        case 2:
                                            return t = r.sent(), o8(!1, h, !0), oy("Error_CreditConversion_ApiFailed", {
                                                call: "UpdateAddress",
                                                statusCode: iv(t)
                                            }, t), [3, 3];
                                        case 3:
                                            return [2]
                                    }
                                })
                            }, function() {
                                var e = this,
                                    r = arguments;
                                return new Promise(function(n, a) {
                                    var o = t.apply(e, r);

                                    function i(e) {
                                        uO(o, n, a, i, u, "next", e)
                                    }

                                    function u(e) {
                                        uO(o, n, a, i, u, "throw", e)
                                    }
                                    i(void 0)
                                })
                            })()
                        }, [y, h]),
                        N = (0, x.useCallback)(function() {
                            h && P(!0), m().catch(function(e) {
                                o7(!1, h, !0), oy("Error_CreditConversion_ApiFailed", {
                                    call: "ProcessPaymentAction",
                                    statusCode: iv(e)
                                }, e)
                            }), o7(!0, h, !0)
                        }, [h, m]);
                    return (0, b.jsx)(uM, {
                        id: "purchase-product-modal",
                        title: t("Heading.BuyRobuxWithCredit"),
                        onNeutral: g,
                        body: (0, b.jsxs)("div", {
                            className: "d-flex flex-direction-column",
                            children: [h && (0, b.jsxs)(C().Fragment, {
                                children: [(0, b.jsx)("div", {
                                    className: "order-summary bold",
                                    children: t(oL) || "Order Summary"
                                }), (0, b.jsxs)("div", {
                                    className: "purchase-banner",
                                    children: [(0, b.jsx)("span", {
                                        className: "purchase-text",
                                        children: t(oG) || "Robux purchased"
                                    }), (0, b.jsxs)("span", {
                                        className: "robux-amount-container",
                                        children: [(0, b.jsxs)("div", {
                                            className: "robux-amount",
                                            children: [(0, b.jsxs)("span", {
                                                className: "low-cogs-robux-amount-inline",
                                                children: [(0, b.jsx)("span", {
                                                    className: "icon-robux-28x28",
                                                    style: {
                                                        transform: "translateY(-2px)"
                                                    }
                                                }), s]
                                            }), (0, b.jsxs)("span", {
                                                className: "high-cogs-robux-amount-inline",
                                                children: [(0, b.jsx)("span", {
                                                    className: "icon-robux-gray-16x16",
                                                    style: {
                                                        transform: "translateY(-2px)"
                                                    }
                                                }), oY[s]]
                                            })]
                                        }), (0, b.jsx)("div", {
                                            className: "robux-amount-text",
                                            children: t(oH) || "Includes up to 25% more Robux"
                                        })]
                                    })]
                                })]
                            }, "purchase-banner-sections"), (0, b.jsxs)("div", {
                                className: "available-credit d-flex justify-content-between row-pad",
                                children: [(0, b.jsx)("span", {
                                    className: "bold",
                                    children: t("Label.AvailableCredit") || "Available Credit"
                                }), (0, b.jsx)(uj, {
                                    amount: o,
                                    currencyCode: u
                                })]
                            }), (0, b.jsxs)("div", {
                                className: "balance-due d-flex justify-content-between row-pad",
                                children: [(0, b.jsx)("span", {
                                    className: "bold",
                                    children: (t("Label.BalanceDue") || "Balance Due:").replace(":", "")
                                }), (0, b.jsx)(uj, {
                                    amount: -1 * i,
                                    currencyCode: u
                                })]
                            }), (0, b.jsx)(uT, {
                                visible: h,
                                translate: t,
                                tax: c,
                                taxRate: f,
                                isLoading: d,
                                taxDisplay: p
                            }), (0, b.jsx)("div", {
                                className: "rbx-divider"
                            }), (0, b.jsxs)("div", {
                                className: "remaining-balance d-flex justify-content-between row-pad",
                                children: [(0, b.jsx)("span", {
                                    className: "bold",
                                    children: t(oN) || "Remaining Balance"
                                }), (0, b.jsx)(uj, {
                                    amount: o - i - (p && c ? c.amount : 0),
                                    currencyCode: u
                                })]
                            }), !h && (0, b.jsxs)("div", {
                                className: "purchase-prompt",
                                children: [1 === l ? t("Message.Step1LargestAvailablePackageYouCanBuy") || "Largest package you can buy with your available credit:" : t("Message.Step2NextLargestPackage"), (0, b.jsxs)("span", {
                                    className: "robux-amount-inline",
                                    children: [" ", (0, b.jsx)("span", {
                                        className: "icon-robux-16x16",
                                        style: {
                                            transform: "translateY(-2px)"
                                        }
                                    }), s]
                                }), ". ", t(oM)]
                            }), h && (0, b.jsx)(C().Fragment, {
                                children: (0, b.jsx)("div", {
                                    className: "billing-info-section",
                                    children: (0, b.jsx)(uw, {
                                        processAddressSave: j,
                                        onUpdateAddress: T,
                                        onTaxDisplayChange: v,
                                        prefilledAddress: w,
                                        onSavedAddressLoaded: A,
                                        triggeringContext: oT.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_REDEEM_PAGE
                                    })
                                })
                            }, "tax-flow-sections"), (0, b.jsx)("div", {
                                className: "modal-footer-buttons d-flex justify-content-between mt-4",
                                children: a ? (0, b.jsxs)("button", {
                                    type: "button",
                                    className: "btn-growth-md btn-full-width mr-2 loading-button-container",
                                    disabled: !0,
                                    children: [(0, b.jsx)("span", {
                                        className: "loading-button-text",
                                        children: t(oI)
                                    }), (0, b.jsx)("span", {
                                        className: "spinner spinner-sm loading-button-spinner"
                                    })]
                                }) : (0, b.jsx)(E.Button, {
                                    variant: E.Button.variants.growth,
                                    size: E.Button.sizes.medium,
                                    width: E.Button.widths.full,
                                    onClick: N,
                                    isDisabled: !S,
                                    className: "mr-2",
                                    children: t(oI)
                                })
                            })]
                        }),
                        actionButtonShow: !1,
                        size: "md"
                    })
                }, uP);

            function uR(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function uB(e, t, r, n, a, o, i) {
                try {
                    var u = e[o](i),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, a)
            }

            function uF(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (r = a.next()).done) && (o.push(r.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, n = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return uR(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return uR(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var uL = uF((0, E.createModal)(), 2),
                uG = uL[0],
                uH = uL[1],
                uW = (0, A.withTranslations)(function(e) {
                    var t = e.translate,
                        r = ij(),
                        n = r.isConvertModalOpen,
                        a = r.isLoading,
                        o = r.isPurchasable,
                        i = r.creditBalance,
                        u = r.currencyCode,
                        l = r.convertedRobuxAmount,
                        s = r.numberOfPurchase,
                        c = r.tax,
                        f = r.taxRate,
                        d = r.taxLoading,
                        p = r.taxDisplay,
                        h = r.isTaxFlowEnabled,
                        y = r.onUpdatedAddress,
                        v = r.onTaxDisplayChange,
                        m = r.processPaymentAction,
                        g = r.closeConvertModal,
                        w = r.prefilledAddress,
                        S = r.setSavedUserAddress,
                        A = uF((0, x.useState)(!1), 2),
                        k = A[0],
                        j = A[1];
                    (0, x.useEffect)(function() {
                        n ? (uH.open(), oT.paymentFlowAnalyticsService.sendUserPurchaseFlowEvent(oT.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_REDEEM_PAGE, !0, h ? oT.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_CONVERSION_MODAL_WITH_TAX : oT.paymentFlowAnalyticsService.ENUM_VIEW_NAME.CREDIT_CONVERSION_MODAL_WITHOUT_TAX, oT.paymentFlowAnalyticsService.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN)) : uH.close()
                    }, [n, h]);
                    var P = (0, x.useCallback)(function() {
                            null == af || af.dispatchEvent(new af.CustomEvent("price-tag:render", {
                                detail: {
                                    targetSelector: ".fiat-price-tag"
                                }
                            }))
                        }, []),
                        T = (0, x.useCallback)(function(e) {
                            var t;
                            return (t = function() {
                                var t;
                                return function(e, t) {
                                    var r, n, a, o = {
                                            label: 0,
                                            sent: function() {
                                                if (1 & a[0]) throw a[1];
                                                return a[1]
                                            },
                                            trys: [],
                                            ops: []
                                        },
                                        i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                        u = Object.defineProperty;
                                    return u(i, "next", {
                                        value: l(0)
                                    }), u(i, "throw", {
                                        value: l(1)
                                    }), u(i, "return", {
                                        value: l(2)
                                    }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                                        value: function() {
                                            return this
                                        }
                                    }), i;

                                    function l(u) {
                                        return function(l) {
                                            var s = [u, l];
                                            if (r) throw TypeError("Generator is already executing.");
                                            for (; i && (i = 0, s[0] && (o = 0)), o;) try {
                                                if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                                                switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                                    case 0:
                                                    case 1:
                                                        a = s;
                                                        break;
                                                    case 4:
                                                        return o.label++, {
                                                            value: s[1],
                                                            done: !1
                                                        };
                                                    case 5:
                                                        o.label++, n = s[1], s = [0];
                                                        continue;
                                                    case 7:
                                                        s = o.ops.pop(), o.trys.pop();
                                                        continue;
                                                    default:
                                                        if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                            o = 0;
                                                            continue
                                                        }
                                                        if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                                            o.label = s[1];
                                                            break
                                                        }
                                                        if (6 === s[0] && o.label < a[1]) {
                                                            o.label = a[1], a = s;
                                                            break
                                                        }
                                                        if (a && o.label < a[2]) {
                                                            o.label = a[2], o.ops.push(s);
                                                            break
                                                        }
                                                        a[2] && o.ops.pop(), o.trys.pop();
                                                        continue
                                                }
                                                s = t.call(e, o)
                                            } catch (e) {
                                                s = [6, e], n = 0
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
                                }(this, function(r) {
                                    switch (r.label) {
                                        case 0:
                                            return r.trys.push([0, 2, , 3]), [4, y(e)];
                                        case 1:
                                            return r.sent(), o8(!0, h, !1), [3, 3];
                                        case 2:
                                            return t = r.sent(), o8(!1, h, !1), oy("Error_CreditConversion_ApiFailed", {
                                                call: "UpdateAddress",
                                                statusCode: iv(t)
                                            }, t), [3, 3];
                                        case 3:
                                            return [2]
                                    }
                                })
                            }, function() {
                                var e = this,
                                    r = arguments;
                                return new Promise(function(n, a) {
                                    var o = t.apply(e, r);

                                    function i(e) {
                                        uB(o, n, a, i, u, "next", e)
                                    }

                                    function u(e) {
                                        uB(o, n, a, i, u, "throw", e)
                                    }
                                    i(void 0)
                                })
                            })()
                        }, [h, y]),
                        N = (0, x.useCallback)(function() {
                            h && j(!0), m().catch(function(e) {
                                o7(!1, h, !1), oy("Error_CreditConversion_ApiFailed", {
                                    call: "ProcessPaymentAction",
                                    statusCode: iv(e)
                                }, e)
                            }), o7(!0, h, !1)
                        }, [h, m]);
                    return (0, b.jsx)(uG, {
                        id: "convert-credit-modal",
                        title: t("Label.ConvertCreditSuccess"),
                        onNeutral: g,
                        body: [h && (0, b.jsxs)(C().Fragment, {
                            children: [(0, b.jsx)("div", {
                                className: "order-summary bold",
                                children: t(oL) || "Order Summary"
                            }, "order-summary"), (0, b.jsxs)("div", {
                                className: "purchase-banner",
                                children: [(0, b.jsx)("span", {
                                    className: "purchase-text",
                                    children: t(oG) || "Robux purchased"
                                }), (0, b.jsxs)("span", {
                                    className: "robux-amount-container",
                                    children: [(0, b.jsxs)("div", {
                                        className: "robux-amount",
                                        children: [(0, b.jsxs)("span", {
                                            className: "low-cogs-robux-amount-inline",
                                            children: [(0, b.jsx)("span", {
                                                className: "icon-robux-28x28",
                                                style: {
                                                    transform: "translateY(-2px)"
                                                }
                                            }), l]
                                        }), l > 5 && (0, b.jsxs)("span", {
                                            className: "high-cogs-robux-amount-inline",
                                            children: [(0, b.jsx)("span", {
                                                className: "icon-robux-gray-16x16",
                                                style: {
                                                    transform: "translateY(-2px)"
                                                }
                                            }), Math.floor(l / 1.25)]
                                        })]
                                    }), (0, b.jsx)("div", {
                                        className: "robux-amount-text",
                                        children: t(oH) || "Includes up to 25% more Robux"
                                    })]
                                })]
                            }, "purchase-banner"), (0, b.jsxs)("div", {
                                className: "available-credit d-flex justify-content-between row-pad",
                                children: [(0, b.jsx)("span", {
                                    className: "bold",
                                    children: t("Label.AvailableCredit") || "Available Credit"
                                }), (0, b.jsx)(uj, {
                                    amount: i,
                                    currencyCode: u
                                })]
                            }, "available-credit"), (0, b.jsxs)("div", {
                                className: "convertible-credit d-flex justify-content-between row-pad",
                                children: [(0, b.jsx)("span", {
                                    className: "bold",
                                    children: t(oO) || "Convertible Credit"
                                }), (0, b.jsx)(uj, {
                                    amount: i - (p && c ? c.amount : 0),
                                    currencyCode: u
                                })]
                            }, "convertible-credit"), (0, b.jsx)(uT, {
                                translate: t,
                                tax: c,
                                taxRate: f,
                                isLoading: d,
                                taxDisplay: p
                            }, "tax-line"), (0, b.jsx)("div", {
                                className: "rbx-divider"
                            }, "divider"), (0, b.jsxs)("div", {
                                className: "remaining-balance d-flex justify-content-between row-pad",
                                children: [(0, b.jsx)("span", {
                                    className: "bold",
                                    children: t(oN) || "Remaining Balance"
                                }), (0, b.jsx)(uj, {
                                    amount: 0,
                                    currencyCode: u
                                })]
                            }), (0, b.jsx)("div", {
                                className: "billing-info-section",
                                children: (0, b.jsx)(uw, {
                                    processAddressSave: k,
                                    onUpdateAddress: T,
                                    onTaxDisplayChange: v,
                                    prefilledAddress: w,
                                    onSavedAddressLoaded: S,
                                    triggeringContext: oT.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_REDEEM_PAGE
                                })
                            }, "billing-info-section")]
                        }, "tax-flow-sections"), !h && (0, b.jsx)("div", {
                            className: "conversion-message",
                            style: {
                                marginTop: "12px"
                            },
                            dangerouslySetInnerHTML: {
                                __html: 1 === s ? t("Message.ConvertCreditToRobux25PercentMore", {
                                    robuxAmount: "".concat('<span class="icon-robux-16x16" style="transform: translateY(-2px)"></span>').concat(l),
                                    boldStart: "<b>",
                                    boldEnd: "</b>"
                                }) : "".concat(t("Message.Step3ConvertRobux", {
                                    remainingCreditBalance: "<span class='fiat-price-tag ml-1' data-amount=".concat(i, " data-currency-code=").concat(u, "></span>"),
                                    lineBreaker: "<br /><br />",
                                    robuxConversionAmount: '<span class="icon-robux-16x16" style="transform: translateY(-2px)"></span><b>'.concat(l, "</b>")
                                }), " ").concat(t(oM))
                            },
                            ref: P
                        }, "conversion-message-".concat(l, "-").concat(i)), (0, b.jsx)("div", {
                            className: "modal-footer-buttons d-flex justify-content-between mt-4",
                            children: a ? (0, b.jsxs)("button", {
                                type: "button",
                                className: "btn-growth-md btn-full-width mr-2 loading-button-container",
                                disabled: !0,
                                children: [(0, b.jsx)("span", {
                                    className: "loading-button-text",
                                    children: t(oU)
                                }), (0, b.jsx)("span", {
                                    className: "spinner spinner-sm loading-button-spinner"
                                })]
                            }) : (0, b.jsx)(E.Button, {
                                variant: E.Button.variants.growth,
                                size: E.Button.sizes.medium,
                                width: E.Button.widths.full,
                                onClick: N,
                                isDisabled: !o,
                                className: "mr-2",
                                children: t(oU)
                            })
                        }, "modal-footer-buttons")],
                        actionButtonShow: !1,
                        size: "md"
                    })
                }, uP),
                uY = function(e) {
                    var t = e.systemFeedbackService,
                        r = e.translate,
                        n = e.onSuccess,
                        a = (0, x.useRef)(null),
                        o = function() {
                            var e = ij().startCreditConversionFlow;
                            return (0, x.useEffect)(function() {
                                a.current = e
                            }, [e]), (0, b.jsxs)(x.Fragment, {
                                children: [(0, b.jsx)(uD, {}), (0, b.jsx)(uW, {})]
                            })
                        };
                    return [function() {
                        return (0, b.jsx)(ik, {
                            systemFeedbackService: t,
                            translate: r,
                            onSuccess: n,
                            children: (0, b.jsx)(o, {})
                        })
                    }, function(e) {
                        var t;
                        null == (t = a.current) || t.call(a, e)
                    }]
                };

            function uV(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function uz(e, t, r, n, a, o, i) {
                try {
                    var u = e[o](i),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, a)
            }

            function uq(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, a) {
                        var o = e.apply(t, r);

                        function i(e) {
                            uz(o, n, a, i, u, "next", e)
                        }

                        function u(e) {
                            uz(o, n, a, i, u, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function uX(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (r = a.next()).done) && (o.push(r.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, n = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return uV(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return uV(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function u$(e, t) {
                var r, n, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    u = Object.defineProperty;
                return u(i, "next", {
                    value: l(0)
                }), u(i, "throw", {
                    value: l(1)
                }), u(i, "return", {
                    value: l(2)
                }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function l(u) {
                    return function(l) {
                        var s = [u, l];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, s[0] && (o = 0)), o;) try {
                            if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                            switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                case 0:
                                case 1:
                                    a = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < a[1]) {
                                        o.label = a[1], a = s;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(s);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], n = 0
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
            var uQ = function() {
                var e = uX((0, E.createModal)(), 2),
                    t = e[0],
                    r = e[1],
                    n = (0, x.useRef)(null),
                    a = (0, x.useRef)(null);
                return [function(e) {
                    var o = e.translate,
                        i = e.systemFeedbackService,
                        u = e.onSuccess,
                        l = oA(),
                        s = uX((0, x.useState)(!1), 2),
                        c = s[0],
                        f = s[1],
                        d = uX((0, x.useState)(void 0), 2),
                        p = d[0],
                        h = d[1],
                        y = uX((0, x.useState)(void 0), 2),
                        v = y[0],
                        m = y[1],
                        g = uX((0, x.useState)(void 0), 2),
                        w = g[0],
                        S = g[1],
                        A = uX((0, x.useState)(0), 2),
                        k = A[0],
                        j = A[1],
                        P = uX((0, x.useState)(void 0), 2),
                        T = P[0],
                        N = P[1],
                        O = uX((0, x.useState)(0), 2),
                        I = O[0],
                        U = O[1],
                        M = uX((0, x.useState)(""), 2),
                        _ = M[0],
                        D = M[1],
                        R = uX((0, x.useState)(!1), 2),
                        B = R[0],
                        F = R[1],
                        L = uX((0, x.useState)(void 0), 2),
                        G = L[0],
                        H = L[1],
                        W = uX((0, x.useState)(!1), 2),
                        Y = W[0],
                        V = W[1],
                        z = uX((0, x.useState)(!1), 2),
                        q = (z[0], z[1]),
                        X = uX((0, x.useState)(!1), 2),
                        $ = X[0],
                        Q = X[1],
                        K = uX((0, x.useState)(!1), 2),
                        J = K[0],
                        Z = K[1],
                        ee = uX((0, x.useState)(!1), 2),
                        et = ee[0],
                        er = ee[1],
                        en = uX((0, x.useState)(!1), 2),
                        ea = en[0],
                        eo = en[1],
                        ei = uX((0, x.useState)(void 0), 2),
                        eu = ei[0],
                        el = ei[1],
                        es = (0, x.useCallback)(function(e) {
                            return uq(function() {
                                var t, r, n, a, o;
                                return u$(this, function(i) {
                                    switch (i.label) {
                                        case 0:
                                            return i.trys.push([0, 2, 3, 4]), V(!0), [4, o4(l, e)];
                                        case 1:
                                            return (t = i.sent().data).isSuccess && (f(t.robloxManagedTax), h(t.checkoutSessionId), m(t.providerPayload.CheckoutSessionToken), q(t.hasBillingAddress), void 0 !== t.taxRate && S(t.taxRate), j(null != (r = t.providerPayload.RobuxConversionAmount) ? r : 0), N(null != (n = t.providerPayload.StrikethroughRobuxConversionAmount) ? n : void 0), U(null != (a = t.providerPayload.AvailableCreditBalance) ? a : 0), D(null != (o = t.providerPayload.CurrencyCode) ? o : ""), H(oP(t.providerPayload.TaxAmount, t.providerPayload.CurrencyCode, t.hasBillingAddress || void 0 !== e)), o6(!0, t.robloxManagedTax, !1, null !== t.taxRate)), [3, 4];
                                        case 2:
                                            return i.sent(), eo(!0), [3, 4];
                                        case 3:
                                            return V(!1), [7];
                                        case 4:
                                            return [2]
                                    }
                                })
                            })()
                        }, [l]);
                    (0, x.useEffect)(function() {
                        n.current = el, a.current = es
                    }, [es]), (0, x.useEffect)(function() {
                        var e = I > 0 && k > 0;
                        er(!ea && (!c || B && !Y) && e)
                    }, [I, k, c, B, Y, ea]);
                    var ec = (0, x.useCallback)(function(e) {
                            return uq(function() {
                                var t, r, n, a, o, i, u, l, s;
                                return u$(this, function(f) {
                                    switch (f.label) {
                                        case 0:
                                            if (f.trys.push([0, 2, , 3]), !p) return [2];
                                            return V(!0), [4, ia(e, p)];
                                        case 1:
                                            return n = (r = (t = f.sent().data).providerPayload).AvailableCreditBalance, a = r.CurrencyCode, o = r.TaxAmount, i = r.CheckoutSessionToken, u = r.RobuxConversionAmount, l = r.StrikethroughRobuxConversionAmount, r.TotalDue, s = t.taxRate, j(null != u ? u : 0), N(null != l ? l : void 0), U(n), D(a), H(oP(o, a, !0)), S(s), m(i), V(!1), o8(!0, c, !1), [3, 3];
                                        case 2:
                                            return f.sent(), eo(!0), o8(!1, c, !1), [3, 3];
                                        case 3:
                                            return [2]
                                    }
                                })
                            })()
                        }, [p, c]),
                        ef = (0, x.useCallback)(function(e) {
                            F(e)
                        }, []),
                        ed = (0, x.useCallback)(function(e, t) {
                            var r = !t;
                            e ? (i.success(o(r ? oR : o_)), u && u(r)) : i.warning(o(r ? oB : oD) || o(oF) || "Something went wrong! Please try again later.", 200, 5e3)
                        }, [i, o, u]),
                        ep = (0, x.useCallback)(function(e, t) {
                            i.warning(e, 200, 5e3), r.close(), t && af && (af.location.href = tG.urlService.getAbsoluteUrl("/upgrades/robux"))
                        }, [i]),
                        eh = (0, x.useCallback)(function() {
                            return uq(function() {
                                var e;
                                return u$(this, function(t) {
                                    switch (t.label) {
                                        case 0:
                                            c && Q(!0), Z(!0), t.label = 1;
                                        case 1:
                                            if (t.trys.push([1, 6, 7, 8]), !v) return [3, 3];
                                            return [4, oj(function() {
                                                return io(0, "", "", v, null == l ? void 0 : l.id, p)
                                            }, {
                                                failedStatusPrefix: oW,
                                                onStatusError: function() {
                                                    ed(!1, 0), Z(!1)
                                                },
                                                onSuccess: function(e, t) {
                                                    ed(t, 0), r.close()
                                                }
                                            })];
                                        case 2:
                                            return t.sent(), [3, 5];
                                        case 3:
                                            return [4, oj(function() {
                                                return o3(0)
                                            }, {
                                                failedStatusPrefix: oW,
                                                onStatusError: function() {
                                                    ed(!1, 0), Z(!1)
                                                },
                                                onSuccess: function(e) {
                                                    var t, n = e.data;
                                                    ed(null != (t = null == n ? void 0 : n.isSuccess) && t, 0), r.close()
                                                }
                                            })];
                                        case 4:
                                            t.sent(), t.label = 5;
                                        case 5:
                                            return o7(!0, c, !1), [3, 8];
                                        case 6:
                                            if (e = t.sent(), o7(!1, c, !1), iu(e)) return ep(is({
                                                translate: o,
                                                violation: e.data.failureReason,
                                                timeoutDurationInMinutes: e.data.expirationTimeInMinutes
                                            }), !1), oZ("ProcessPayment_EconomicRestriction"), [2];
                                            return ep(o(oF) || "Something went wrong! Please try again later.", !0), oZ("ProcessPayment_Unexpected"), [3, 8];
                                        case 7:
                                            return Z(!1), [7];
                                        case 8:
                                            return [2]
                                    }
                                })
                            })()
                        }, [c, v, null == l ? void 0 : l.id, p, ed, ep, o]);
                    return (0, b.jsx)(t, {
                        id: "convert-credit-modal",
                        title: o("Heading.ConvertCreditToRobux") || "Convert credit to Robux",
                        onNeutral: function() {
                            return r.close()
                        },
                        body: [(0, b.jsx)("div", {
                            className: "order-summary bold",
                            children: o(oL) || "Order Summary"
                        }, "order-summary"), (0, b.jsxs)("div", {
                            className: "purchase-banner",
                            children: [(0, b.jsx)("span", {
                                className: "purchase-text",
                                children: o(oG) || "Robux purchased"
                            }), (0, b.jsx)("span", {
                                className: "robux-amount-container",
                                children: (0, b.jsxs)("div", {
                                    className: "robux-amount",
                                    children: [(0, b.jsxs)("span", {
                                        className: "low-cogs-robux-amount-inline",
                                        children: [(0, b.jsx)("span", {
                                            className: "icon-robux-28x28",
                                            style: {
                                                transform: "translateY(-2px)"
                                            }
                                        }), k]
                                    }), k > (null != T ? T : Math.floor(k / 1.25)) && (0, b.jsxs)("span", {
                                        className: "high-cogs-robux-amount-inline",
                                        children: [(0, b.jsx)("span", {
                                            className: "icon-robux-gray-16x16",
                                            style: {
                                                transform: "translateY(-2px)"
                                            }
                                        }), null != T ? T : Math.floor(k / 1.25)]
                                    })]
                                })
                            })]
                        }, "purchase-banner"), (0, b.jsxs)("div", {
                            className: "available-credit d-flex justify-content-between row-pad",
                            children: [(0, b.jsx)("span", {
                                className: "bold",
                                children: o("Label.AvailableCredit") || "Available Credit"
                            }), (0, b.jsx)(uj, {
                                amount: I,
                                currencyCode: _
                            })]
                        }, "available-credit"), c && (0, b.jsxs)(C().Fragment, {
                            children: [(0, b.jsx)(uT, {
                                translate: o,
                                tax: G,
                                taxRate: w,
                                isLoading: Y,
                                taxDisplay: B
                            }, "tax-line"), (0, b.jsxs)("div", {
                                className: "convertible-credit d-flex justify-content-between row-pad",
                                children: [(0, b.jsx)("span", {
                                    className: "bold",
                                    children: o(oO) || "Convertible Credit"
                                }), (0, b.jsx)(uj, {
                                    amount: I - (B && G ? G.amount : 0),
                                    currencyCode: _
                                })]
                            }, "convertible-credit")]
                        }, "tax-flow-sections"), (0, b.jsx)("div", {
                            className: "rbx-divider"
                        }, "divider"), (0, b.jsxs)("div", {
                            className: "remaining-balance d-flex justify-content-between row-pad",
                            children: [(0, b.jsx)("span", {
                                className: "bold",
                                children: o(oN) || "Remaining balance"
                            }), (0, b.jsx)(uj, {
                                amount: 0,
                                currencyCode: _
                            })]
                        }, "remaining-balance"), c && (0, b.jsx)("div", {
                            className: "billing-info-section",
                            children: (0, b.jsx)(uw, {
                                processAddressSave: $,
                                onUpdateAddress: ec,
                                prefilledAddress: eu,
                                onTaxDisplayChange: ef,
                                triggeringContext: oT.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_REDEEM_PAGE
                            })
                        }, "billing-info-section"), (0, b.jsx)("div", {
                            className: "modal-footer-buttons d-flex justify-content-between mt-4",
                            children: J ? (0, b.jsxs)("button", {
                                type: "button",
                                className: "btn-growth-md btn-full-width mr-2 loading-button-container",
                                disabled: !0,
                                children: [(0, b.jsx)("span", {
                                    className: "loading-button-text",
                                    children: o(oU)
                                }), (0, b.jsx)("span", {
                                    className: "spinner spinner-sm loading-button-spinner"
                                })]
                            }) : (0, b.jsx)(E.Button, {
                                variant: E.Button.variants.growth,
                                size: E.Button.sizes.medium,
                                width: E.Button.widths.full,
                                onClick: eh,
                                isDisabled: !et,
                                className: "mr-2",
                                children: o(oU)
                            })
                        }, "modal-footer-buttons")],
                        actionButtonShow: !1,
                        size: "md",
                        closeable: !0
                    })
                }, {
                    open: function(e) {
                        n.current && n.current(e), a.current && a.current(e), r.open()
                    },
                    close: function() {
                        return r.close()
                    }
                }]
            };

            function uK(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function uJ(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (r = a.next()).done) && (o.push(r.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, n = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return uK(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return uK(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var uZ = function(e) {
                var t = e.translate,
                    r = e.systemFeedbackService,
                    n = e.showConvertButton,
                    a = (e.robuxAmount, e.balance),
                    o = e.currencyCode,
                    i = e.isConvertAllFlowEnabled,
                    u = e.setZeroBalance,
                    l = t("Heading.SavedCreditCard.RobloxCredit"),
                    s = t("Label.SavedCreditCard.Balance"),
                    c = uJ(uY({
                        systemFeedbackService: r,
                        translate: t,
                        onSuccess: function(e) {
                            u()
                        }
                    }), 2),
                    f = c[0],
                    d = c[1],
                    p = uJ(uQ(), 2),
                    h = p[0],
                    y = p[1];
                return (0, b.jsxs)("div", {
                    className: "roblox-credit-container",
                    children: [(0, b.jsx)(f, {}), i && (0, b.jsx)(h, {
                        systemFeedbackService: r,
                        translate: t,
                        onSuccess: function() {
                            u()
                        }
                    }), (0, b.jsxs)("div", {
                        className: "roblox-credit-header-container",
                        children: [(0, b.jsx)("span", {
                            className: "payment-method-image cardIcon ".concat(tY("robloxCredit"))
                        }), (0, b.jsx)("div", {
                            className: "roblox-credit-header text-emphasis",
                            children: l
                        })]
                    }), (0, b.jsxs)("div", {
                        className: "roblox-credit-balance",
                        children: [(0, b.jsx)("div", {
                            className: "balance-prefix",
                            children: s
                        }), (0, b.jsx)(uj, {
                            amount: a,
                            currencyCode: o
                        })]
                    }), n ? (0, b.jsx)(E.Button, {
                        className: "convert-to-robux-button btn-secondary-md",
                        onClick: function() {
                            (0, N.fireEvent)(t1), i ? y.open() : d()
                        },
                        children: t("Heading.SavedCreditCard.ConvertToRobux")
                    }) : null]
                })
            };

            function u0(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function u1(e, t, r, n, a, o, i) {
                try {
                    var u = e[o](i),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, a)
            }

            function u2(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (r = a.next()).done) && (o.push(r.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, n = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return u0(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return u0(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var u3 = function(e) {
                var t = e.translate,
                    r = e.systemFeedbackService,
                    n = u2((0, x.useState)(!0), 2),
                    a = n[0],
                    o = n[1],
                    i = u2((0, x.useState)(!1), 2),
                    u = i[0],
                    l = i[1],
                    s = u2((0, x.useState)(!1), 2),
                    c = s[0],
                    f = s[1],
                    d = u2((0, x.useState)(0), 2),
                    p = d[0],
                    h = d[1],
                    y = u2((0, x.useState)(0), 2),
                    v = y[0],
                    m = y[1],
                    g = u2((0, x.useState)("USD"), 2),
                    w = g[0],
                    S = g[1],
                    C = u2((0, x.useState)(!1), 2),
                    E = C[0],
                    A = C[1],
                    k = t("Heading.SavedCreditCard.OtherPaymentMethods"),
                    j = function() {
                        var e;
                        return (e = function() {
                            var e, t, n, a, i, u, s;
                            return function(e, t) {
                                var r, n, a, o = {
                                        label: 0,
                                        sent: function() {
                                            if (1 & a[0]) throw a[1];
                                            return a[1]
                                        },
                                        trys: [],
                                        ops: []
                                    },
                                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                    u = Object.defineProperty;
                                return u(i, "next", {
                                    value: l(0)
                                }), u(i, "throw", {
                                    value: l(1)
                                }), u(i, "return", {
                                    value: l(2)
                                }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                                    value: function() {
                                        return this
                                    }
                                }), i;

                                function l(u) {
                                    return function(l) {
                                        var s = [u, l];
                                        if (r) throw TypeError("Generator is already executing.");
                                        for (; i && (i = 0, s[0] && (o = 0)), o;) try {
                                            if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                                            switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                                case 0:
                                                case 1:
                                                    a = s;
                                                    break;
                                                case 4:
                                                    return o.label++, {
                                                        value: s[1],
                                                        done: !1
                                                    };
                                                case 5:
                                                    o.label++, n = s[1], s = [0];
                                                    continue;
                                                case 7:
                                                    s = o.ops.pop(), o.trys.pop();
                                                    continue;
                                                default:
                                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                        o = 0;
                                                        continue
                                                    }
                                                    if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                                        o.label = s[1];
                                                        break
                                                    }
                                                    if (6 === s[0] && o.label < a[1]) {
                                                        o.label = a[1], a = s;
                                                        break
                                                    }
                                                    if (a && o.label < a[2]) {
                                                        o.label = a[2], o.ops.push(s);
                                                        break
                                                    }
                                                    a[2] && o.ops.pop(), o.trys.pop();
                                                    continue
                                            }
                                            s = t.call(e, o)
                                        } catch (e) {
                                            s = [6, e], n = 0
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
                            }(this, function(c) {
                                switch (c.label) {
                                    case 0:
                                        o(!0), c.label = 1;
                                    case 1:
                                        return c.trys.push([1, 3, , 4]), [4, rL()];
                                    case 2:
                                        return t = (e = u2.apply(void 0, [c.sent(), 6]))[0], n = e[1], a = e[2], i = e[3], u = e[4], s = e[5], l(t), f(n), h(a), m(i), S(u), A(s), [3, 4];
                                    case 3:
                                        return c.sent(), r.warning(rZ), [3, 4];
                                    case 4:
                                        return o(!1), [2]
                                }
                            })
                        }, function() {
                            var t = this,
                                r = arguments;
                            return new Promise(function(n, a) {
                                var o = e.apply(t, r);

                                function i(e) {
                                    u1(o, n, a, i, u, "next", e)
                                }

                                function u(e) {
                                    u1(o, n, a, i, u, "throw", e)
                                }
                                i(void 0)
                            })
                        })()
                    };
                return ((0, x.useEffect)(function() {
                    j()
                }, [v]), u) ? (0, b.jsx)("div", {
                    className: "other-payment-methods-container"
                }) : (0, b.jsxs)("div", {
                    className: "other-payment-methods-container",
                    children: [(0, b.jsx)("h5", {
                        children: k
                    }), a ? (0, b.jsx)("span", {
                        className: "spinner spinner-default"
                    }) : (0, b.jsx)(uZ, {
                        translate: t,
                        systemFeedbackService: r,
                        showConvertButton: c,
                        robuxAmount: p,
                        balance: v,
                        currencyCode: w,
                        isConvertAllFlowEnabled: E,
                        setZeroBalance: function() {
                            m(0)
                        }
                    })]
                })
            };

            function u4(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function u6(e, t, r, n, a, o, i) {
                try {
                    var u = e[o](i),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, a)
            }

            function u5(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, a) {
                        var o = e.apply(t, r);

                        function i(e) {
                            u6(o, n, a, i, u, "next", e)
                        }

                        function u(e) {
                            u6(o, n, a, i, u, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function u8(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (r = a.next()).done) && (o.push(r.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, n = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return u4(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return u4(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function u7(e, t) {
                var r, n, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    u = Object.defineProperty;
                return u(i, "next", {
                    value: l(0)
                }), u(i, "throw", {
                    value: l(1)
                }), u(i, "return", {
                    value: l(2)
                }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function l(u) {
                    return function(l) {
                        var s = [u, l];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, s[0] && (o = 0)), o;) try {
                            if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                            switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                case 0:
                                case 1:
                                    a = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < a[1]) {
                                        o.label = a[1], a = s;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(s);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], n = 0
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
            var u9 = u8((l = (u = nv((0, E.createModal)(), 2))[0], [function(e) {
                    var t = e.translate,
                        r = e.systemFeedbackService,
                        n = e.onSuccess,
                        a = e.stripeEmail,
                        o = e.robloxEmail,
                        i = (0, z.useStripe)(),
                        u = (0, z.useElements)(),
                        c = nv((0, x.useState)(!1), 2),
                        f = c[0],
                        d = c[1],
                        p = nv((0, x.useState)(!1), 2),
                        h = p[0],
                        y = p[1],
                        v = nv((0, x.useState)("" !== a ? a : o), 2),
                        m = v[0],
                        w = v[1],
                        S = nv((0, x.useState)(null), 2),
                        C = S[0],
                        E = S[1],
                        A = "",
                        k = t("Heading.SavedCreditCard.AddPaymentMethod"),
                        j = function() {
                            return ny(function() {
                                return nm(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            var t, r;
                                            return e.trys.push([0, 2, , 3]), (0, N.fireEvent)(rv), [4, (t = rR.Stripe, r = A, rM(function() {
                                                var e;
                                                return rD(this, function(n) {
                                                    return e = {
                                                        withCredentials: !0,
                                                        url: "".concat(g.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-profile/by-provider-id/").concat(t, "/").concat(r)
                                                    }, [2, tG.httpService.get(e, {
                                                        paymentProvider: t,
                                                        providerPaymentProfileId: r
                                                    })]
                                                })
                                            })())];
                                        case 1:
                                            if (e.sent()) return (0, N.fireEvent)(rm), [2, !0];
                                            return [3, 3];
                                        case 2:
                                            return e.sent(), (0, N.fireEvent)(rb), [3, 3];
                                        case 3:
                                            return [2, !1]
                                    }
                                })
                            })()
                        },
                        P = function(e, a, o) {
                            return ny(function() {
                                return nm(this, function(i) {
                                    switch (i.label) {
                                        case 0:
                                            return i.trys.push([0, 2, , 3]), [4, e()];
                                        case 1:
                                            if (i.sent()) return r.success(t("Response.SavedCreditCard.SavePaymentMethodSuccess")), n(), d(!1), s.close(), [2];
                                            if (0 === o) return (0, N.fireEvent)(rj), r.warning(t(rJ)), d(!1), s.close(), [2];
                                            return setTimeout(function() {
                                                P(e, a, o - 1)
                                            }, a), [3, 3];
                                        case 2:
                                            return i.sent(), (0, N.fireEvent)(rb), [3, 3];
                                        case 3:
                                            return [2]
                                    }
                                })
                            })()
                        };
                    return (0, b.jsx)(l, {
                        id: "add-card-modal",
                        title: k,
                        body: (0, b.jsx)(nd, {
                            translate: t,
                            elements: u,
                            onFormChange: function(e) {
                                y(e)
                            },
                            updateInputEmail: function(e) {
                                w(e)
                            },
                            stripeEmail: a,
                            robloxEmail: o,
                            stripeErrorCode: C
                        }),
                        loading: f,
                        neutralButtonText: t(rQ),
                        actionButtonText: t(rK),
                        onNeutral: function() {
                            (0, N.fireEvent)(tq), s.close()
                        },
                        onAction: function() {
                            (0, N.fireEvent)(tX), ny(function() {
                                var e, n, l, c, f, p, h, y;
                                return nm(this, function(v) {
                                    switch (v.label) {
                                        case 0:
                                            if (!i || !u) return s.close(), [2];
                                            d(!0), E(null), e = "" === a && m !== o ? {
                                                return_url: tH(),
                                                payment_method_data: {
                                                    billing_details: {
                                                        email: m
                                                    },
                                                    allow_redisplay: "always"
                                                }
                                            } : {
                                                return_url: tH(),
                                                payment_method_data: {
                                                    allow_redisplay: "always"
                                                }
                                            }, v.label = 1;
                                        case 1:
                                            return v.trys.push([1, 3, , 4]), (0, N.fireEvent)(rA), [4, i.confirmSetup({
                                                elements: u,
                                                redirect: "if_required",
                                                confirmParams: e
                                            })];
                                        case 2:
                                            if ((null == (c = v.sent()) || null == (n = c.setupIntent) ? void 0 : n.status) === "succeeded")(0, N.fireEvent)(rk), (A = null != (f = null == c || null == (h = c.setupIntent) || null == (p = h.payment_method) ? void 0 : p.toString()) ? f : "") && P(j, 5e3, 3);
                                            else if (null == c || null == (l = c.error) ? void 0 : l.code) {
                                                switch ((0, N.fireEvent)(rj), c.error.code) {
                                                    case rP:
                                                    case rT:
                                                        E(null == c || null == (y = c.error) ? void 0 : y.code);
                                                        break;
                                                    case "card_declined":
                                                        r.warning(t("Description.SavedCreditCard.CardDeclinedErrorMessage") || "Card declined. Please review the card details or try a different card."), s.close();
                                                        break;
                                                    default:
                                                        r.warning(t(rJ)), s.close()
                                                }
                                                d(!1)
                                            }
                                            return [3, 4];
                                        case 3:
                                            return v.sent(), (0, N.fireEvent)(rj), r.warning(t(rJ)), s.close(), d(!1), [3, 4];
                                        case 4:
                                            return [2]
                                    }
                                })
                            })()
                        },
                        closeable: !0,
                        size: "md",
                        actionButtonShow: !0,
                        disableActionButton: h
                    })
                }, s = u[1]]), 2),
                le = u9[0],
                lt = u9[1],
                lr = function(e) {
                    var t, r = e.translate,
                        n = e.systemFeedbackService,
                        a = e.hideAddCardButton,
                        o = e.shouldDisplaySavedPaymentMethods,
                        i = e.hideSavedPaymentMethodsIfNoSavedCards,
                        u = !!g.DeviceMeta && ((0, g.DeviceMeta)().isAndroidApp || (0, g.DeviceMeta)().isIosApp),
                        l = u8((0, x.useState)(!0), 2),
                        s = l[0],
                        c = l[1],
                        f = u8((0, x.useState)([]), 2),
                        d = f[0],
                        p = f[1],
                        h = u8((0, x.useState)(null), 2),
                        y = h[0],
                        v = h[1],
                        m = u8((0, x.useState)(""), 2),
                        w = m[0],
                        S = m[1],
                        C = u8((0, x.useState)(""), 2),
                        A = C[0],
                        k = C[1],
                        j = u8((0, x.useState)(""), 2),
                        P = j[0],
                        T = j[1],
                        O = r("Heading.SavedCreditCard.SavedPaymentMethod"),
                        I = r("Description.SavedCreditCard.NoSavedPaymentMethods"),
                        U = function() {
                            return u5(function() {
                                var e, t;
                                return u7(this, function(a) {
                                    switch (a.label) {
                                        case 0:
                                            return a.trys.push([0, 2, , 3]), (0, N.fireEvent)(rr), [4, rM(function() {
                                                var e;
                                                return rD(this, function(t) {
                                                    return e = {
                                                        withCredentials: !0,
                                                        url: "".concat(g.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-profiles")
                                                    }, [2, tG.httpService.get(e)]
                                                })
                                            })()];
                                        case 1:
                                            return (null == (t = a.sent()) || null == (e = t.data) ? void 0 : e.length) > 0 && o && p(t.data.slice()), (0, N.fireEvent)(rn), [3, 3];
                                        case 2:
                                            return a.sent(), (0, N.fireEvent)(ra), n.warning(r(rZ)), [3, 3];
                                        case 3:
                                            return c(!1), [2]
                                    }
                                })
                            })()
                        };
                    (0, x.useEffect)(function() {
                        U()
                    }, [a, o]);
                    var M = (0, x.useCallback)(function() {
                            return u5(function() {
                                return u7(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return [4, u5(function() {
                                                var e, t;
                                                return u7(this, function(a) {
                                                    switch (a.label) {
                                                        case 0:
                                                            return a.trys.push([0, 2, , 3]), e = g.EnvironmentUrls.websiteUrl.includes("sitetest1") ? "pk_test_51LNM0XG5RADBkfjhYJlpADA2ArzWIh7gTWTodYNbpEzSiT55dul3VJhaBIVHL0CNyO0gECOz1vPnWArAkjwQ8NBO00Cdf2PxED" : g.EnvironmentUrls.websiteUrl.includes("sitetest3") ? "pk_test_51LNOeQHDRNiW7vlLcKH8TGCpJ7zhaidLdSegE22GCuvQbVUX2xDiGJY6WYaldYyo6qgVxmy1SnSVpSdaqyjfqclU00NQwWntIe" : "pk_live_51LKpO9C8tJWGhK4HEHtny9Dg7xXiQJ1i349cq6KBDusbl8bRHO7QmCKKhX18LPjSirMNTvj3tesq6mhIQuPioeAd0062ZCgoF3", (0, N.fireEvent)(rx), [4, V(e)];
                                                        case 1:
                                                            return t = a.sent(), (0, N.fireEvent)(rC), v(t), [3, 3];
                                                        case 2:
                                                            return a.sent(), (0, N.fireEvent)(rE), n.warning(r(rZ)), [3, 3];
                                                        case 3:
                                                            return [2]
                                                    }
                                                })
                                            })()];
                                        case 1:
                                            return e.sent(), [4, u5(function() {
                                                var e, t, a, o, i, u, l, s, c, f, d;
                                                return u7(this, function(p) {
                                                    switch (p.label) {
                                                        case 0:
                                                            var h;
                                                            return p.trys.push([0, 2, , 3]), (0, N.fireEvent)(t5), [4, (h = rR.Stripe, rM(function() {
                                                                var e;
                                                                return rD(this, function(t) {
                                                                    return e = {
                                                                        withCredentials: !0,
                                                                        url: "".concat(g.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-profile/prepare")
                                                                    }, [2, tG.httpService.post(e, {
                                                                        paymentProvider: h
                                                                    })]
                                                                })
                                                            })())];
                                                        case 1:
                                                            return c = p.sent(), (0, N.fireEvent)(t8), S(null != (e = null == c || null == (o = c.data) || null == (a = o.providerPayload) ? void 0 : a.clientSecret) ? e : ""), (null == c || null == (u = c.data) || null == (i = u.providerPayload) ? void 0 : i.stripeCustomerEmail) ? (k(null == c || null == (d = c.data) || null == (f = d.providerPayload) ? void 0 : f.stripeCustomerEmail), (0, N.fireEvent)(tZ)) : (0, N.fireEvent)(t0), T(null != (t = null == c || null == (s = c.data) || null == (l = s.providerPayload) ? void 0 : l.robloxUserEmail) ? t : ""), [3, 3];
                                                        case 2:
                                                            return p.sent(), (0, N.fireEvent)(t7), n.warning(r(rZ)), [3, 3];
                                                        case 3:
                                                            return [2]
                                                    }
                                                })
                                            })()];
                                        case 2:
                                            return e.sent(), lt.open(), (0, N.fireEvent)(tz), [2]
                                    }
                                })
                            })()
                        }, []),
                        _ = (0, x.useCallback)(function() {
                            return u5(function() {
                                return u7(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return [4, U()];
                                        case 1:
                                            return e.sent(), [2]
                                    }
                                })
                            })()
                        }, [a, o]),
                        D = function(e) {
                            if (d) {
                                var t = d.slice();
                                t.splice(e, 1), p(t)
                            }
                        },
                        R = !(i && (null == d ? void 0 : d.length) === 0);
                    return s || (d && d.length > 0 ? t = null == d ? void 0 : d.map(function(e, t) {
                        var a = e.providerPayload;
                        return "paypal" === a.paymentProfileType ? (0, b.jsx)(nl, {
                            translate: r,
                            systemFeedbackService: n,
                            updatePaymentProfiles: function() {
                                D(t)
                            },
                            paymentProfileId: e.id,
                            email: a.Email
                        }, e.id.substring(0, 4)) : "card" === a.paymentProfileType ? (0, b.jsx)(no, {
                            translate: r,
                            systemFeedbackService: n,
                            updatePaymentProfiles: function() {
                                D(t)
                            },
                            paymentProfileId: e.id,
                            cardType: a.CardNetwork,
                            lastFour: a.Last4Digits,
                            expMonth: a.ExpMonth,
                            expYear: a.ExpYear
                        }, e.id.substring(0, 4)) : null
                    }) : (t = R && (0, b.jsx)("div", {
                        className: "no-payment-methods-text",
                        children: I
                    }), (0, N.fireEvent)(ro))), (0, b.jsxs)("div", {
                        className: "payment-methods-settings-container",
                        children: [y && w ? (0, b.jsx)(z.Elements, {
                            stripe: y && w ? y : null,
                            options: y && w ? {
                                clientSecret: w,
                                wallets: {
                                    applePay: "never",
                                    googlePay: "never"
                                },
                                appearance: {
                                    theme: document.body.classList.contains("dark-theme") ? "night" : "stripe",
                                    labels: "above"
                                }
                            } : void 0,
                            children: (0, b.jsx)(le, {
                                translate: r,
                                systemFeedbackService: n,
                                onSuccess: function() {
                                    _()
                                },
                                stripeEmail: A,
                                robloxEmail: P
                            })
                        }, w) : null, R && (0, b.jsxs)("div", {
                            className: "saved-payment-method-header-container",
                            children: [(0, b.jsx)("h5", {
                                children: O
                            }), u || a ? null : (0, b.jsx)(E.Button, {
                                className: "add-card-button btn-secondary-md",
                                onClick: function() {
                                    M(), (0, N.fireEvent)(tz)
                                },
                                children: r("Action.Add")
                            })]
                        }), s ? (0, b.jsx)("span", {
                            className: "spinner spinner-default"
                        }) : t, u ? null : (0, b.jsx)(u3, {
                            translate: r,
                            systemFeedbackService: n
                        })]
                    })
                },
                ln = window.Roblox["core-scripts"].meta.device,
                la = window.Roblox["core-scripts"].meta.user,
                lo = function(e) {
                    var t = e.translate,
                        r = e.subscriptionIconClassName,
                        n = e.subscriptionName,
                        a = e.showCancelButton,
                        o = e.cancelSubscriptionUrl,
                        i = e.autoRenewDate,
                        u = e.expirationDate,
                        l = t("Label.SavedCreditCard.RenewsOn"),
                        s = "".concat(l, " ").concat(i),
                        c = t("Label.SavedCreditCard.ExpiresOn"),
                        f = "".concat(c, " ").concat(u);
                    return (0, b.jsxs)("div", {
                        className: "subscription-container",
                        children: [(0, b.jsx)("span", {
                            className: r
                        }), (0, b.jsxs)("div", {
                            className: "subscription-desc",
                            children: [(0, b.jsx)("div", {
                                className: "subscription-header font-bold",
                                children: n
                            }), "" !== i ? (0, b.jsx)("p", {
                                children: s
                            }) : (0, b.jsx)("div", {
                                className: "expiration-text",
                                children: f
                            })]
                        }), "" !== i && a ? (0, b.jsx)(E.Button, {
                            className: "cancel-subscription-button btn-secondary-md",
                            onClick: function() {
                                (0, N.fireEvent)(t4), window.location.href = o
                            },
                            children: t(rQ)
                        }) : null]
                    })
                };

            function li(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lu(e, t, r, n, a, o, i) {
                try {
                    var u = e[o](i),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, a)
            }

            function ll(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (r = a.next()).done) && (o.push(r.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, n = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return li(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return li(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var ls = function(e) {
                    var t = e.translate,
                        r = e.systemFeedbackService,
                        n = ll((0, x.useState)(null), 2),
                        a = n[0],
                        o = n[1],
                        i = ll((0, x.useState)(!0), 2),
                        u = i[0],
                        l = i[1],
                        s = t("Label.DevSubs") || "Subscriptions",
                        c = t("Description.SavedCreditCard.NoPremium"),
                        f = "",
                        d = function() {
                            var e;
                            return (e = function() {
                                var e, n, a;
                                return function(e, t) {
                                    var r, n, a, o = {
                                            label: 0,
                                            sent: function() {
                                                if (1 & a[0]) throw a[1];
                                                return a[1]
                                            },
                                            trys: [],
                                            ops: []
                                        },
                                        i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                        u = Object.defineProperty;
                                    return u(i, "next", {
                                        value: l(0)
                                    }), u(i, "throw", {
                                        value: l(1)
                                    }), u(i, "return", {
                                        value: l(2)
                                    }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                                        value: function() {
                                            return this
                                        }
                                    }), i;

                                    function l(u) {
                                        return function(l) {
                                            var s = [u, l];
                                            if (r) throw TypeError("Generator is already executing.");
                                            for (; i && (i = 0, s[0] && (o = 0)), o;) try {
                                                if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                                                switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                                    case 0:
                                                    case 1:
                                                        a = s;
                                                        break;
                                                    case 4:
                                                        return o.label++, {
                                                            value: s[1],
                                                            done: !1
                                                        };
                                                    case 5:
                                                        o.label++, n = s[1], s = [0];
                                                        continue;
                                                    case 7:
                                                        s = o.ops.pop(), o.trys.pop();
                                                        continue;
                                                    default:
                                                        if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                            o = 0;
                                                            continue
                                                        }
                                                        if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                                            o.label = s[1];
                                                            break
                                                        }
                                                        if (6 === s[0] && o.label < a[1]) {
                                                            o.label = a[1], a = s;
                                                            break
                                                        }
                                                        if (a && o.label < a[2]) {
                                                            o.label = a[2], o.ops.push(s);
                                                            break
                                                        }
                                                        a[2] && o.ops.pop(), o.trys.pop();
                                                        continue
                                                }
                                                s = t.call(e, o)
                                            } catch (e) {
                                                s = [6, e], n = 0
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
                                }(this, function(i) {
                                    switch (i.label) {
                                        case 0:
                                            l(!0), i.label = 1;
                                        case 1:
                                            return i.trys.push([1, 3, , 4]), (0, N.fireEvent)(rs), [4, rF(null != (e = null == (n = (0, la.authenticatedUser)()) ? void 0 : n.id) ? e : 0)];
                                        case 2:
                                            return (null == (a = i.sent()) ? void 0 : a.status) === 200 && ((0, N.fireEvent)(rc), o(null == a ? void 0 : a.data)), [3, 4];
                                        case 3:
                                            return 404 === i.sent().status ? (0, N.fireEvent)(t2) : ((0, N.fireEvent)(rf), r.warning(t(rZ))), [3, 4];
                                        case 4:
                                            return l(!1), [2]
                                    }
                                })
                            }, function() {
                                var t = this,
                                    r = arguments;
                                return new Promise(function(n, a) {
                                    var o = e.apply(t, r);

                                    function i(e) {
                                        lu(o, n, a, i, u, "next", e)
                                    }

                                    function u(e) {
                                        lu(o, n, a, i, u, "throw", e)
                                    }
                                    i(void 0)
                                })
                            })()
                        };
                    (0, x.useEffect)(function() {
                        d()
                    }, []);
                    var p = "",
                        h = "";
                    if (null == a ? void 0 : a.subscriptionProductModel.subscriptionName) {
                        var y = new g.Intl().getDateTimeFormatter();
                        (null == a ? void 0 : a.subscriptionProductModel.renewal) && (p = y.getCustomDateTime(null == a ? void 0 : a.subscriptionProductModel.renewal, {
                            month: "short",
                            day: "2-digit",
                            year: "numeric"
                        })), (null == a ? void 0 : a.subscriptionProductModel.expiration) && (h = y.getCustomDateTime(null == a ? void 0 : a.subscriptionProductModel.expiration, {
                            month: "short",
                            day: "2-digit",
                            year: "numeric"
                        }))
                    }
                    return u ? (0, b.jsxs)("div", {
                        children: [(0, b.jsx)("h2", {
                            className: "main-header",
                            children: s
                        }), (0, b.jsx)("span", {
                            className: "spinner spinner-default"
                        })]
                    }) : null !== a ? (0, b.jsxs)("div", {
                        children: [(0, b.jsx)("h2", {
                            className: "main-header",
                            children: s
                        }), (0, b.jsx)(lo, {
                            translate: t,
                            subscriptionIconClassName: "icon-premium-medium",
                            subscriptionName: null == a ? void 0 : a.subscriptionProductModel.subscriptionName,
                            showCancelButton: function() {
                                var e = (0, ln.getDeviceMeta)();
                                if (a && "isDesktop" === a.subscriptionProductModel.purchasePlatform) {
                                    if (!(null == e ? void 0 : e.isInApp) || e.isUniversalApp && e.isDesktop && !e.isUWPApp) return f = tG.urlService.getAbsoluteUrl("/upgrades/cancel-subscription"), !0
                                } else if (a && "isAndroidApp" === a.subscriptionProductModel.purchasePlatform && (null == e ? void 0 : e.isAndroidApp)) return f = "https://play.google.com/store/account/subscriptions", !0;
                                return !1
                            }(),
                            cancelSubscriptionUrl: f,
                            autoRenewDate: p,
                            expirationDate: h
                        })]
                    }) : (0, b.jsxs)("div", {
                        children: [(0, b.jsx)("h2", {
                            className: "main-header",
                            children: s
                        }), (0, b.jsxs)("div", {
                            className: "subscription-container",
                            children: [(0, b.jsx)("p", {
                                className: "no-subscription-text",
                                children: c
                            }), (0, b.jsx)(E.Button, {
                                className: "subscribe-button btn-secondary-md",
                                onClick: function() {
                                    (0, N.fireEvent)(t3), window.location.href = tG.urlService.getAbsoluteUrl("/premium/membership")
                                },
                                children: t("Action.Subscribe")
                            })]
                        })]
                    })
                },
                lc = ((c = {}).Default = "NotificationsOnlyOnThresholdPassed", c.AllNotifications = "NotificationsEveryAmountSpent", c.NotificationsOff = "NotificationsOff", c),
                lf = ((f = {}).Enabled = "Enabled", f.Disabled = "Disabled", f),
                ld = ((d = {}).None = "None", d.ParentalConsent = "ParentalConsent", d.SelfUpdateSetting = "SelfUpdateSetting", d.ContentAgeRestrictionVerification = "ContentAgeRestrictionVerification", d.FacialAgeEstimation = "FacialAgeEstimation", d.IdVerification = "IdVerification", d.VpcForFae = "VpcForFae", d.AgeCheckPending = "AgeCheckPending", d.ParentConsentInherited = "ParentConsentInherited", d.Inherited = "Inherited", d.ReadableButNotActionable = "ReadableButNotActionable", d);

            function lp(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var lh = function(e) {
                    var t, r = e.translate,
                        n = e.titleResourceId,
                        a = e.translatedTitle,
                        o = e.bodyResourceId,
                        i = e.translatedBody,
                        u = e.actionButtonTextResourceId,
                        l = e.neutralButtonTextResourceId,
                        s = e.footerTextResourceId,
                        c = e.size,
                        f = e.footerHyperlink,
                        d = e.onAction,
                        p = e.disableActionButton,
                        h = e.disabledNeutralButton,
                        y = e.shouldCloseModalOnActionButton,
                        v = void 0 === y || y,
                        m = e.onHide,
                        g = void 0 === m ? function() {} : m,
                        w = e.onNeutral,
                        S = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, x.useState)(!1)) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var a = [],
                                    o = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(o = (t = n.next()).done) && (a.push(t.value), 2 !== a.length); o = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        o || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return a
                            }
                        }(t) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return lp(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return lp(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        C = S[0],
                        A = S[1],
                        k = (0, x.useMemo)(function() {
                            return {
                                open: function() {
                                    A(!0)
                                },
                                close: function() {
                                    A(!1)
                                }
                            }
                        }, []),
                        j = uE()({
                            "modal-half-width-button": l,
                            "modal-full-width-button": !l
                        });
                    return [(0, b.jsxs)(E.Modal, {
                        show: C,
                        onHide: function() {
                            k.close(), g()
                        },
                        backdrop: !0,
                        className: "user-settings-modal",
                        size: void 0 === c ? "lg" : c,
                        "aria-labelledby": "user-settings-modal-title",
                        scrollable: !0,
                        centered: !0,
                        children: [(0, b.jsxs)(E.Modal.Header, {
                            useBaseBootstrapComponent: !0,
                            children: [(0, b.jsx)("div", {
                                className: "user-settings-modal-title-container",
                                children: (0, b.jsx)(E.Modal.Title, {
                                    id: "user-settings-modal-title",
                                    children: a || n && r(n)
                                })
                            }), (0, b.jsx)("button", {
                                type: "button",
                                className: "close close-button",
                                onClick: function() {
                                    k.close(), g()
                                },
                                children: (0, b.jsx)("span", {
                                    className: "icon-close"
                                })
                            })]
                        }), (0, b.jsx)(E.Modal.Body, {
                            children: i || o && r(o)
                        }), (0, b.jsxs)(E.Modal.Footer, {
                            children: [u && (0, b.jsx)(E.Button, {
                                className: j,
                                variant: E.Button.variants.primary,
                                size: E.Button.sizes.medium,
                                isDisabled: p,
                                onClick: function() {
                                    v && k.close(), null == d || d()
                                },
                                children: r(u)
                            }), l && (0, b.jsx)(E.Button, {
                                className: j,
                                variant: E.Button.variants.secondary,
                                size: E.Button.sizes.medium,
                                isDisabled: h,
                                onClick: function() {
                                    k.close(), null == w || w()
                                },
                                children: r(l)
                            })]
                        }), s && f && (0, b.jsx)("div", {
                            className: "text-footer user-settings-modal-text-footer border-top",
                            children: (0, b.jsxs)("span", {
                                children: [(0, b.jsx)("div", {
                                    className: "icon-moreinfo"
                                }), (0, b.jsx)("a", {
                                    className: "text-link user-settings-modal-text-footer-link",
                                    target: "_blank",
                                    rel: "noreferrer",
                                    href: f,
                                    children: r(s)
                                })]
                            })
                        })]
                    }), k]
                },
                ly = "authPageload",
                lv = "authButtonClick",
                lm = "authModalShown",
                lb = "settingsSpending",
                lg = "spendingDisplayAllowPurchases",
                lw = "spendingHideAllowPurchases",
                lS = "allowPurchases",
                lx = "spendLimit",
                lC = "askParentConfirm",
                lE = "cancelModal",
                lA = "askParent",
                lk = "askParentConfirm",
                lj = "cancelAskParentConfirm",
                lP = "cancelRequest",
                lT = "doNotCancelRequest",
                lN = "Spending",
                lO = "Ask My Parent",
                lI = "Ask your parent",
                lU = "Ask now",
                lM = "Cancel",
                l_ = "Cancel request",
                lD = "Do Not Cancel",
                lR = function(e, t) {
                    oT.eventStreamService.sendEventWithTarget(e, lb, t)
                },
                lB = function(e) {
                    lR(ly, {
                        state: e,
                        associatedText: lN
                    })
                },
                lF = function(e) {
                    lR(lv, {
                        btn: lA,
                        state: e,
                        associatedText: lO
                    })
                },
                lL = function(e) {
                    lR(lm, {
                        field: lC,
                        state: e,
                        associatedText: lI
                    })
                },
                lG = function(e) {
                    lR(lv, {
                        btn: lk,
                        state: e,
                        associatedText: lU
                    })
                },
                lH = function(e) {
                    lR(lv, {
                        btn: lj,
                        state: e,
                        associatedText: lM
                    })
                },
                lW = function(e) {
                    lR(lm, {
                        state: e,
                        field: lE,
                        associatedText: l_
                    })
                },
                lY = function(e) {
                    lR(lm, {
                        state: e,
                        field: lE,
                        associatedText: l_
                    })
                },
                lV = function(e) {
                    lR(lv, {
                        btn: lP,
                        state: e,
                        associatedText: l_
                    })
                },
                lz = function(e) {
                    lR(lv, {
                        btn: lT,
                        state: e,
                        associatedText: lD
                    })
                };

            function lq(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lX(e, t, r, n, a, o, i) {
                try {
                    var u = e[o](i),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, a)
            }
            var l$ = function(e) {
                    var t, r = e.systemFeedbackService,
                        n = e.translate,
                        a = e.onSuccess,
                        o = e.consentId,
                        i = e.state,
                        u = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = lh({
                            translate: n,
                            titleResourceId: rX,
                            bodyResourceId: "Description.CancelSettingUpdateRequest",
                            actionButtonTextResourceId: "Action.Dialog.Yes",
                            neutralButtonTextResourceId: "Action.Dialog.No",
                            size: "sm",
                            onAction: function() {
                                var e;
                                return (e = function() {
                                    return function(e, t) {
                                        var r, n, a, o = {
                                                label: 0,
                                                sent: function() {
                                                    if (1 & a[0]) throw a[1];
                                                    return a[1]
                                                },
                                                trys: [],
                                                ops: []
                                            },
                                            i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                            u = Object.defineProperty;
                                        return u(i, "next", {
                                            value: l(0)
                                        }), u(i, "throw", {
                                            value: l(1)
                                        }), u(i, "return", {
                                            value: l(2)
                                        }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                                            value: function() {
                                                return this
                                            }
                                        }), i;

                                        function l(u) {
                                            return function(l) {
                                                var s = [u, l];
                                                if (r) throw TypeError("Generator is already executing.");
                                                for (; i && (i = 0, s[0] && (o = 0)), o;) try {
                                                    if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                                                    switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                                        case 0:
                                                        case 1:
                                                            a = s;
                                                            break;
                                                        case 4:
                                                            return o.label++, {
                                                                value: s[1],
                                                                done: !1
                                                            };
                                                        case 5:
                                                            o.label++, n = s[1], s = [0];
                                                            continue;
                                                        case 7:
                                                            s = o.ops.pop(), o.trys.pop();
                                                            continue;
                                                        default:
                                                            if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                                o = 0;
                                                                continue
                                                            }
                                                            if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                                                o.label = s[1];
                                                                break
                                                            }
                                                            if (6 === s[0] && o.label < a[1]) {
                                                                o.label = a[1], a = s;
                                                                break
                                                            }
                                                            if (a && o.label < a[2]) {
                                                                o.label = a[2], o.ops.push(s);
                                                                break
                                                            }
                                                            a[2] && o.ops.pop(), o.trys.pop();
                                                            continue
                                                    }
                                                    s = t.call(e, o)
                                                } catch (e) {
                                                    s = [6, e], n = 0
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
                                    }(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                if (lV(i), !o) return [3, 4];
                                                e.label = 1;
                                            case 1:
                                                return e.trys.push([1, 3, , 4]), [4, rM(function() {
                                                    var e;
                                                    return rD(this, function(t) {
                                                        return e = {
                                                            withCredentials: !0,
                                                            url: "".concat(g.EnvironmentUrls.apiGatewayUrl, "/child-requests-api/v1/cancel-consent-request")
                                                        }, [2, tG.httpService.post(e, {
                                                            consentId: o
                                                        })]
                                                    })
                                                })()];
                                            case 2:
                                                return e.sent(), a(), r.success(n(r0)), [3, 4];
                                            case 3:
                                                return e.sent(), r.warning(n(rZ)), [3, 4];
                                            case 4:
                                                return [2]
                                        }
                                    })
                                }, function() {
                                    var t = this,
                                        r = arguments;
                                    return new Promise(function(n, a) {
                                        var o = e.apply(t, r);

                                        function i(e) {
                                            lX(o, n, a, i, u, "next", e)
                                        }

                                        function u(e) {
                                            lX(o, n, a, i, u, "throw", e)
                                        }
                                        i(void 0)
                                    })
                                })()
                            },
                            onNeutral: function() {
                                lz(i)
                            }
                        })) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var a = [],
                                    o = !0,
                                    i = !1;
                                try {
                                    for (n = n.call(e); !(o = (t = n.next()).done) && (a.push(t.value), 2 !== a.length); o = !0);
                                } catch (e) {
                                    i = !0, r = e
                                } finally {
                                    try {
                                        o || null == n.return || n.return()
                                    } finally {
                                        if (i) throw r
                                    }
                                }
                                return a
                            }
                        }(t) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return lq(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return lq(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        l = u[0],
                        s = u[1];
                    return [l, {
                        open: function() {
                            lY(i), s.open()
                        },
                        close: s.close
                    }]
                },
                lQ = function(e) {
                    var t = e.title,
                        r = e.description,
                        n = e.currentSettingValueComponent,
                        a = e.metadata,
                        o = e.showArrow,
                        i = e.onClick,
                        u = e.footer,
                        l = e.disabled,
                        s = uE()("spending-settings-list-item-container", {
                            "text-disabled": l
                        }),
                        c = uE()("spending-settings-list-item-info", {
                            "text-disabled": l
                        }),
                        f = uE()("spending-settings-list-item-value-arrow", {
                            "text-disabled": l
                        });
                    return (0, b.jsxs)("div", {
                        children: [(0, b.jsxs)("button", {
                            className: s,
                            type: "button",
                            onClick: i,
                            disabled: l,
                            children: [(0, b.jsxs)("div", {
                                className: c,
                                children: [(0, b.jsx)("span", {
                                    className: "spending-setting-name font-body ",
                                    children: t
                                }), r && (0, b.jsx)("span", {
                                    className: "small text",
                                    children: r
                                })]
                            }), a, (n || o) && (0, b.jsxs)("div", {
                                className: f,
                                children: [n, o && (0, b.jsx)("div", {
                                    children: (0, b.jsx)("span", {
                                        className: "icon-chevron-heavy-right"
                                    })
                                })]
                            })]
                        }), u && (0, b.jsx)("p", {
                            className: "spending-settings-list-item-footer small text",
                            dangerouslySetInnerHTML: {
                                __html: u
                            }
                        })]
                    })
                };
            lQ.defaultProps = {
                description: void 0,
                currentSettingValueComponent: void 0,
                metadata: void 0,
                showArrow: !1,
                onClick: void 0,
                footer: void 0,
                disabled: !1
            };
            var lK = function(e) {
                var t = e.translate;
                return (0, b.jsxs)("div", {
                    className: "setting-option-pill xsmall ",
                    children: [(0, b.jsx)("span", {
                        className: "icon-uiblox-pending themified-icon"
                    }), (0, b.jsx)("span", {
                        className: "setting-option-label",
                        children: t("Label.Pending")
                    })]
                })
            };

            function lJ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function lZ(e, t, r, n, a, o, i) {
                try {
                    var u = e[o](i),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, a)
            }

            function l0(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, a) {
                        var o = e.apply(t, r);

                        function i(e) {
                            lZ(o, n, a, i, u, "next", e)
                        }

                        function u(e) {
                            lZ(o, n, a, i, u, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function l1(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (r = a.next()).done) && (o.push(r.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, n = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return lJ(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return lJ(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function l2(e, t) {
                var r, n, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    u = Object.defineProperty;
                return u(i, "next", {
                    value: l(0)
                }), u(i, "throw", {
                    value: l(1)
                }), u(i, "return", {
                    value: l(2)
                }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function l(u) {
                    return function(l) {
                        var s = [u, l];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, s[0] && (o = 0)), o;) try {
                            if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                            switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                case 0:
                                case 1:
                                    a = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < a[1]) {
                                        o.label = a[1], a = s;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(s);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], n = 0
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
            var l3 = function(e) {
                    var t = e.enablePurchaseSettings,
                        r = e.translate,
                        n = e.systemFeedbackService,
                        a = l1((0, x.useState)(null), 2),
                        o = a[0],
                        i = a[1],
                        u = l1((0, x.useState)(), 2),
                        l = u[0],
                        s = u[1],
                        c = (null == t ? void 0 : t.currentValue) === lf.Disabled,
                        f = function() {
                            return l0(function() {
                                var e, t;
                                return l2(this, function(a) {
                                    switch (a.label) {
                                        case 0:
                                            var o;
                                            return a.trys.push([0, 2, , 3]), [4, (o = null != (e = null == (t = (0, la.authenticatedUser)()) ? void 0 : t.id) ? e : 0, rM(function() {
                                                var e;
                                                return rD(this, function(t) {
                                                    switch (t.label) {
                                                        case 0:
                                                            return [4, rW(o, void 0, e = [])];
                                                        case 1:
                                                            return t.sent(), [2, e.find(function(e) {
                                                                var t;
                                                                return (null == e || null == (t = e.consentData) ? void 0 : t.monthlySpendLimit) !== void 0
                                                            }) || null]
                                                    }
                                                })
                                            })())];
                                        case 1:
                                            return s(a.sent()), [3, 3];
                                        case 2:
                                            return a.sent(), n.warning(r(rZ)), [3, 3];
                                        case 3:
                                            return [2]
                                    }
                                })
                            })()
                        };
                    (0, x.useEffect)(function() {
                        l0(function() {
                            return l2(this, function(e) {
                                switch (e.label) {
                                    case 0:
                                        return e.trys.push([0, 2, , 3]), [4, rH()];
                                    case 1:
                                        return i(e.sent()), [3, 3];
                                    case 2:
                                        return e.sent(), n.warning(r(rZ)), [3, 3];
                                    case 3:
                                        return [2]
                                }
                            })
                        })(), f()
                    }, []), (0, x.useEffect)(function() {
                        window.dispatchEvent(new CustomEvent("price-tag:render", {
                            detail: {
                                targetSelector: ".fiat-spending-limit-tag",
                                tagClassName: "font-body"
                            }
                        }))
                    }, [o]);
                    var d = l1(lh({
                            translate: r,
                            titleResourceId: rq,
                            bodyResourceId: "Description.AskMoreRobux",
                            actionButtonTextResourceId: "Action.AskMoreRobux",
                            neutralButtonTextResourceId: rQ,
                            size: "sm",
                            onAction: function() {
                                return l0(function() {
                                    return l2(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return lG(lx), [4, l0(function() {
                                                    return l2(this, function(e) {
                                                        switch (e.label) {
                                                            case 0:
                                                                return e.trys.push([0, 3, , 4]), [4, g.AccessManagementUpsellV2Service.startAccessManagementUpsell({
                                                                    featureName: rN,
                                                                    namespace: rO,
                                                                    isAsyncCall: !1,
                                                                    usePrologue: !1,
                                                                    ampRecourseData: {
                                                                        monthlySpendLimit: null,
                                                                        monthlySpendLimitCurrencyCode: null
                                                                    }
                                                                })];
                                                            case 1:
                                                                return e.sent(), [4, f()];
                                                            case 2:
                                                                return e.sent(), [3, 4];
                                                            case 3:
                                                                return e.sent(), n.warning(r(rZ)), [3, 4];
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
                                lH(lx)
                            }
                        }), 2),
                        p = d[0],
                        h = d[1],
                        y = (null == o ? void 0 : o.monthlySpendLimit) !== null && (null == o ? void 0 : o.monthlySpendLimit) !== void 0,
                        v = (0, b.jsx)("span", {
                            className: "fiat-spending-limit-tag",
                            "data-amount": null == o ? void 0 : o.monthlySpendLimit,
                            "data-currency-code": null == o ? void 0 : o.monthlySpendLimitCurrencyType
                        }),
                        m = l1(l$({
                            systemFeedbackService: n,
                            translate: r,
                            consentId: null == l ? void 0 : l.id,
                            onSuccess: f,
                            state: lx
                        }), 2),
                        w = m[0],
                        S = m[1],
                        A = function() {
                            return r("Description.MonthlySpendLimitDisclaimer", {
                                linkStart: '<a href="https://help.roblox.com/hc/articles/4409125091348" class="text-link" target="_blank">',
                                linkEnd: "</a>"
                            })
                        };
                    if (y) return (0, b.jsxs)("div", {
                        className: "section-content spending-setting-container",
                        children: [(0, b.jsx)(lQ, {
                            disabled: c,
                            title: r(r$),
                            currentSettingValueComponent: (0, b.jsxs)(C().Fragment, {
                                children: [l && (0, b.jsx)(lK, {
                                    translate: r
                                }), v]
                            }),
                            onClick: function() {
                                c || (l ? S.open() : (lL(lx), h.open()))
                            },
                            showArrow: !0,
                            footer: A()
                        }), (0, b.jsx)("div", {
                            className: "request-consent-button-container",
                            children: l && (0, b.jsx)(E.Button, {
                                variant: E.Button.variants.secondary,
                                onClick: function() {
                                    lW(lx), S.open()
                                },
                                children: r(rX)
                            })
                        }), p, w]
                    });
                    var k = (0, b.jsx)("span", {
                        className: "text-description",
                        children: r("Label.NoLimit")
                    });
                    return (0, b.jsx)("div", {
                        className: "section-content spending-setting-container",
                        children: (0, b.jsx)(lQ, {
                            title: r(r$),
                            currentSettingValueComponent: k,
                            footer: A()
                        })
                    })
                },
                l4 = function(e) {
                    var t = e.translate;
                    return (0, b.jsxs)("div", {
                        className: "setting-option-pill xsmall ",
                        children: [(0, b.jsx)("span", {
                            className: "icon-status-private themified-icon"
                        }), (0, b.jsx)("span", {
                            className: "setting-option-label",
                            children: t("Label.Parent")
                        })]
                    })
                },
                l6 = function() {
                    var e = new CustomEvent("refetchUserSettingsEvent");
                    window.dispatchEvent(e)
                };

            function l5(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function l8(e, t, r, n, a, o, i) {
                try {
                    var u = e[o](i),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, a)
            }

            function l7(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, a) {
                        var o = e.apply(t, r);

                        function i(e) {
                            l8(o, n, a, i, u, "next", e)
                        }

                        function u(e) {
                            l8(o, n, a, i, u, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function l9(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (r = a.next()).done) && (o.push(r.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, n = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return l5(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return l5(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function se(e, t) {
                var r, n, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    u = Object.defineProperty;
                return u(i, "next", {
                    value: l(0)
                }), u(i, "throw", {
                    value: l(1)
                }), u(i, "return", {
                    value: l(2)
                }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function l(u) {
                    return function(l) {
                        var s = [u, l];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, s[0] && (o = 0)), o;) try {
                            if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                            switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                case 0:
                                case 1:
                                    a = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < a[1]) {
                                        o.label = a[1], a = s;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(s);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], n = 0
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
            var st = function(e) {
                var t = e.enablePurchaseSettings,
                    r = e.refetchEnablePurchaseSettings,
                    n = e.translate,
                    a = e.systemFeedbackService,
                    o = l9((0, x.useState)(), 2),
                    i = o[0],
                    u = o[1],
                    l = l9((0, x.useState)(!1), 2),
                    s = l[0],
                    c = l[1],
                    f = l9((0, x.useState)(!1), 2),
                    d = f[0],
                    p = f[1],
                    h = l9((0, x.useState)(!1), 2),
                    y = h[0],
                    v = h[1],
                    m = t.currentValue === lf.Enabled,
                    w = function() {
                        return l7(function() {
                            var e, t;
                            return se(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        var o;
                                        return r.trys.push([0, 2, , 3]), [4, (o = null != (e = null == (t = (0, la.authenticatedUser)()) ? void 0 : t.id) ? e : 0, rM(function() {
                                            var e;
                                            return rD(this, function(t) {
                                                switch (t.label) {
                                                    case 0:
                                                        return [4, rW(o, void 0, e = [])];
                                                    case 1:
                                                        return t.sent(), [2, e.find(function(e) {
                                                            var t;
                                                            return (null == e || null == (t = e.consentData) ? void 0 : t.enablePurchases) !== void 0
                                                        }) || null]
                                                }
                                            })
                                        })())];
                                    case 1:
                                        return u(r.sent()), p(m), v(!1), [3, 3];
                                    case 2:
                                        return r.sent(), a.warning(n(rZ)), [3, 3];
                                    case 3:
                                        return [2]
                                }
                            })
                        })()
                    },
                    S = function() {
                        var e;
                        null == (e = t.options) || e.forEach(function(e) {
                            var r = e.requirement;
                            e.option.optionValue !== t.currentValue && r === ld.ParentalConsent && c(!0), p(m)
                        })
                    };
                (0, x.useEffect)(function() {
                    w(), S()
                }, [t]);
                var A = l9(l$({
                        systemFeedbackService: a,
                        translate: n,
                        consentId: null == i ? void 0 : i.id,
                        onSuccess: w,
                        state: lS
                    }), 2),
                    k = A[0],
                    j = A[1],
                    P = function() {
                        return l7(function() {
                            var e;
                            return se(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        if (!s) return [3, 2];
                                        return [4, l7(function() {
                                            return se(this, function(e) {
                                                switch (e.label) {
                                                    case 0:
                                                        return e.trys.push([0, 3, , 4]), [4, g.AccessManagementUpsellV2Service.startAccessManagementUpsell({
                                                            featureName: rN,
                                                            namespace: rO,
                                                            isAsyncCall: !1,
                                                            usePrologue: !1,
                                                            ampRecourseData: {
                                                                enablePurchases: lf.Enabled
                                                            }
                                                        })];
                                                    case 1:
                                                        return e.sent(), [4, w()];
                                                    case 2:
                                                        return e.sent(), [3, 4];
                                                    case 3:
                                                        return e.sent(), a.warning(n(rZ)), [3, 4];
                                                    case 4:
                                                        return [2]
                                                }
                                            })
                                        })()];
                                    case 1:
                                        return t.sent(), [3, 3];
                                    case 2:
                                        var o;
                                        (o = e = d ? lf.Disabled : lf.Enabled, rM(function() {
                                            var e;
                                            return rD(this, function(t) {
                                                return e = {
                                                    withCredentials: !0,
                                                    url: "".concat(g.EnvironmentUrls.userSettingsApi, "/v1/user-settings")
                                                }, [2, tG.httpService.post(e, {
                                                    enablePurchases: o
                                                })]
                                            })
                                        })()).then(function() {
                                            p(e === lf.Enabled), a.success(n(r0)), r(), l6()
                                        }).catch(function(e) {
                                            a.warning(n(rZ))
                                        }), t.label = 3;
                                    case 3:
                                        return [2]
                                }
                            })
                        })()
                    };
                return (0, b.jsxs)(C().Fragment, {
                    children: [(0, b.jsxs)("div", {
                        className: "section-content spending-setting-container",
                        children: [(0, b.jsx)(lQ, {
                            title: n("Heading.AllowPurchases"),
                            currentSettingValueComponent: (0, b.jsxs)(C().Fragment, {
                                children: [i && (0, b.jsx)(lK, {
                                    translate: n
                                }), s && !i && (0, b.jsx)(l4, {
                                    translate: n
                                }), (0, b.jsx)(E.Toggle, {
                                    id: "allow-purchases-toggle",
                                    isOn: d,
                                    onToggle: function() {
                                        return l7(function() {
                                            return se(this, function(e) {
                                                switch (e.label) {
                                                    case 0:
                                                        if (i) return j.open(), [2];
                                                        if (s && !d !== m) return p(function(e) {
                                                            return !e
                                                        }), v(!0), [2];
                                                        if (s) return [3, 2];
                                                        return [4, P()];
                                                    case 1:
                                                        return e.sent(), [2];
                                                    case 2:
                                                        return p(function(e) {
                                                            return !e
                                                        }), v(!1), [2]
                                                }
                                            })
                                        })()
                                    }
                                })]
                            }),
                            footer: n("Description.AllowPurchaseDisclaimer", {
                                premiumSubscriptionsLinkStart: '<a href="https://help.roblox.com/hc/articles/203312540" class="text-link" target="_blank">',
                                premiumSubscriptionsLinkEnd: "</a>",
                                inExperienceSubscriptionsLinkStart: '<a href="https://help.roblox.com/hc/articles/20292396051220" class="text-link" target="_blank">',
                                inExperienceSubscriptionsLinkEnd: "</a>"
                            })
                        }), (0, b.jsxs)("div", {
                            className: "request-consent-button-container",
                            children: [y && !i && (0, b.jsx)(E.Button, {
                                className: "enable-purchase-action-button",
                                variant: E.Button.variants.primary,
                                onClick: function() {
                                    return l7(function() {
                                        return se(this, function(e) {
                                            switch (e.label) {
                                                case 0:
                                                    return lF(lS), [4, P()];
                                                case 1:
                                                    return e.sent(), [2]
                                            }
                                        })
                                    })()
                                },
                                children: n(rq)
                            }), i && (0, b.jsx)(E.Button, {
                                className: "enable-purchase-action-button",
                                variant: E.Button.variants.secondary,
                                onClick: function() {
                                    lW(lS), j.open()
                                },
                                children: n(rX)
                            })]
                        })]
                    }), k]
                })
            };

            function sr(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function sn(e, t, r, n, a, o, i) {
                try {
                    var u = e[o](i),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, a)
            }

            function sa(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (r = a.next()).done) && (o.push(r.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, n = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return sr(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return sr(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var so = function(e) {
                var t = e.translate,
                    r = e.systemFeedbackService,
                    n = !!g.DeviceMeta && ((0, g.DeviceMeta)().isAndroidApp || (0, g.DeviceMeta)().isIosApp),
                    a = sa((0, x.useState)(!0), 2),
                    o = a[0],
                    i = a[1],
                    u = sa((0, x.useState)(!0), 2),
                    l = u[0],
                    s = u[1],
                    c = sa((0, x.useState)(!1), 2),
                    f = c[0],
                    d = c[1],
                    p = sa((0, x.useState)(0), 2),
                    h = p[0],
                    y = p[1],
                    v = sa((0, x.useState)(0), 2),
                    m = v[0],
                    w = v[1],
                    S = sa((0, x.useState)("USD"), 2),
                    C = S[0],
                    E = S[1],
                    A = t(rY),
                    k = function() {
                        var e;
                        return (e = function() {
                            var e, t, n, a, o, u;
                            return function(e, t) {
                                var r, n, a, o = {
                                        label: 0,
                                        sent: function() {
                                            if (1 & a[0]) throw a[1];
                                            return a[1]
                                        },
                                        trys: [],
                                        ops: []
                                    },
                                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                    u = Object.defineProperty;
                                return u(i, "next", {
                                    value: l(0)
                                }), u(i, "throw", {
                                    value: l(1)
                                }), u(i, "return", {
                                    value: l(2)
                                }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                                    value: function() {
                                        return this
                                    }
                                }), i;

                                function l(u) {
                                    return function(l) {
                                        var s = [u, l];
                                        if (r) throw TypeError("Generator is already executing.");
                                        for (; i && (i = 0, s[0] && (o = 0)), o;) try {
                                            if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                                            switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                                case 0:
                                                case 1:
                                                    a = s;
                                                    break;
                                                case 4:
                                                    return o.label++, {
                                                        value: s[1],
                                                        done: !1
                                                    };
                                                case 5:
                                                    o.label++, n = s[1], s = [0];
                                                    continue;
                                                case 7:
                                                    s = o.ops.pop(), o.trys.pop();
                                                    continue;
                                                default:
                                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                        o = 0;
                                                        continue
                                                    }
                                                    if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                                        o.label = s[1];
                                                        break
                                                    }
                                                    if (6 === s[0] && o.label < a[1]) {
                                                        o.label = a[1], a = s;
                                                        break
                                                    }
                                                    if (a && o.label < a[2]) {
                                                        o.label = a[2], o.ops.push(s);
                                                        break
                                                    }
                                                    a[2] && o.ops.pop(), o.trys.pop();
                                                    continue
                                            }
                                            s = t.call(e, o)
                                        } catch (e) {
                                            s = [6, e], n = 0
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
                            }(this, function(l) {
                                switch (l.label) {
                                    case 0:
                                        i(!0), l.label = 1;
                                    case 1:
                                        return l.trys.push([1, 3, , 4]), [4, rL()];
                                    case 2:
                                        return t = (e = sa.apply(void 0, [l.sent(), 5]))[0], n = e[1], a = e[2], o = e[3], u = e[4], s(t), d(n), y(a), w(o), E(u), [3, 4];
                                    case 3:
                                        return l.sent(), r.warning(rZ), [3, 4];
                                    case 4:
                                        return i(!1), [2]
                                }
                            })
                        }, function() {
                            var t = this,
                                r = arguments;
                            return new Promise(function(n, a) {
                                var o = e.apply(t, r);

                                function i(e) {
                                    sn(o, n, a, i, u, "next", e)
                                }

                                function u(e) {
                                    sn(o, n, a, i, u, "throw", e)
                                }
                                i(void 0)
                            })
                        })()
                    };
                return ((0, x.useEffect)(function() {
                    k()
                }, [m]), n || l) ? (0, b.jsx)("div", {}) : (0, b.jsxs)("div", {
                    children: [(0, b.jsx)("h2", {
                        children: A
                    }), o ? (0, b.jsx)("span", {
                        className: "spinner spinner-default"
                    }) : (0, b.jsx)(uZ, {
                        translate: t,
                        systemFeedbackService: r,
                        showConvertButton: f,
                        robuxAmount: h,
                        balance: m,
                        currencyCode: C,
                        setZeroBalance: function() {
                            w(0)
                        }
                    })]
                })
            };

            function si(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function su(e, t, r, n, a, o, i) {
                try {
                    var u = e[o](i),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, a)
            }

            function sl(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (r = a.next()).done) && (o.push(r.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, n = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return si(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return si(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var ss = function(e) {
                var t, r = e.translate,
                    n = e.systemFeedbackService,
                    a = sl((0, x.useState)(null), 2),
                    o = a[0],
                    i = a[1],
                    u = sl((0, x.useState)(!0), 2),
                    l = u[0],
                    s = u[1],
                    c = function() {
                        var e;
                        return (e = function() {
                            return function(e, t) {
                                var r, n, a, o = {
                                        label: 0,
                                        sent: function() {
                                            if (1 & a[0]) throw a[1];
                                            return a[1]
                                        },
                                        trys: [],
                                        ops: []
                                    },
                                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                    u = Object.defineProperty;
                                return u(i, "next", {
                                    value: l(0)
                                }), u(i, "throw", {
                                    value: l(1)
                                }), u(i, "return", {
                                    value: l(2)
                                }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                                    value: function() {
                                        return this
                                    }
                                }), i;

                                function l(u) {
                                    return function(l) {
                                        var s = [u, l];
                                        if (r) throw TypeError("Generator is already executing.");
                                        for (; i && (i = 0, s[0] && (o = 0)), o;) try {
                                            if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                                            switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                                case 0:
                                                case 1:
                                                    a = s;
                                                    break;
                                                case 4:
                                                    return o.label++, {
                                                        value: s[1],
                                                        done: !1
                                                    };
                                                case 5:
                                                    o.label++, n = s[1], s = [0];
                                                    continue;
                                                case 7:
                                                    s = o.ops.pop(), o.trys.pop();
                                                    continue;
                                                default:
                                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                        o = 0;
                                                        continue
                                                    }
                                                    if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                                        o.label = s[1];
                                                        break
                                                    }
                                                    if (6 === s[0] && o.label < a[1]) {
                                                        o.label = a[1], a = s;
                                                        break
                                                    }
                                                    if (a && o.label < a[2]) {
                                                        o.label = a[2], o.ops.push(s);
                                                        break
                                                    }
                                                    a[2] && o.ops.pop(), o.trys.pop();
                                                    continue
                                            }
                                            s = t.call(e, o)
                                        } catch (e) {
                                            s = [6, e], n = 0
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
                            }(this, function(e) {
                                switch (e.label) {
                                    case 0:
                                        return e.trys.push([0, 2, , 3]), [4, rH()];
                                    case 1:
                                        return i(e.sent()), [3, 3];
                                    case 2:
                                        return e.sent(), n.warning(r(rZ)), [3, 3];
                                    case 3:
                                        return s(!1), [2]
                                }
                            })
                        }, function() {
                            var t = this,
                                r = arguments;
                            return new Promise(function(n, a) {
                                var o = e.apply(t, r);

                                function i(e) {
                                    su(o, n, a, i, u, "next", e)
                                }

                                function u(e) {
                                    su(o, n, a, i, u, "throw", e)
                                }
                                i(void 0)
                            })
                        })()
                    };
                if ((0, x.useEffect)(function() {
                        c()
                    }, []), l) return (0, b.jsx)("div", {
                    className: "section-content spending-setting-container",
                    children: (0, b.jsx)("span", {
                        className: "spinner spinner-default"
                    })
                });
                if (!(null == o ? void 0 : o.isSpendNotificationSettingEnabledForUser)) return null;
                switch (o.spendNotificationSetting) {
                    case lc.AllNotifications:
                        t = r("Description.SpendNotifications.AllTransactions");
                        break;
                    case lc.Default:
                        t = r("Description.SpendNotifications.HighSpend");
                        break;
                    default:
                        t = void 0
                }
                return t ? (0, b.jsx)("div", {
                    className: "section-content spending-setting-container",
                    children: (0, b.jsx)(lQ, {
                        title: r("Heading.SpendNotifications"),
                        description: t
                    })
                }) : null
            };

            function sc(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function sf(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (r = a.next()).done) && (o.push(r.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, n = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return sc(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return sc(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var sd = function() {
                var e = sf((0, x.useState)(!1), 2),
                    t = e[0],
                    r = e[1],
                    n = (0, x.useMemo)(function() {
                        return {
                            open: function() {
                                r(!0)
                            },
                            close: function() {
                                r(!1)
                            }
                        }
                    }, []);
                return [function(e) {
                    var r = e.translate,
                        a = e.systemFeedbackService,
                        o = e.onUpdateSuccess,
                        i = e.address,
                        u = sf((0, x.useState)(!1), 2),
                        l = u[0],
                        s = u[1],
                        c = sf((0, x.useState)(!1), 2),
                        f = c[0],
                        d = c[1],
                        p = sf((0, x.useState)(!1), 2),
                        h = p[0],
                        y = p[1],
                        v = sf((0, x.useState)(), 2),
                        m = v[0],
                        g = v[1],
                        w = (0, x.useCallback)(function(e) {
                            switch (e.country) {
                                case "US":
                                    e.city && e.state && e.postalCode && (e.country !== i.country || e.state !== i.state || e.city !== i.city || e.postalCode !== i.postalCode) && (d(!0), g(e));
                                    break;
                                case "CA":
                                    e.city && e.state && (e.country !== i.country || e.state !== i.state || e.city !== i.city) && (d(!0), g(e))
                            }
                        }, [i.city, i.country, i.postalCode, i.state]),
                        S = (0, x.useCallback)(function() {
                            s(!0), y(!0)
                        }, []),
                        C = (0, x.useCallback)(function() {
                            m && (o(m), a.success(r("Description.SavedBillingAddress.UpdatedBillingAddressSuccess")), s(!1), n.close())
                        }, [o, a, r, m]);
                    return (0, b.jsxs)(E.Modal, {
                        show: t,
                        onHide: n.close,
                        size: "md",
                        id: "update-payment-method-modal",
                        children: [(0, b.jsx)(E.Modal.Header, {
                            title: r("Heading.SavedBillingAddress.UpdateBillingAddress"),
                            onClose: n.close
                        }), (0, b.jsx)(E.Modal.Body, {
                            children: (0, b.jsx)(uw, {
                                prefilledAddress: i,
                                onUpdateAddress: w,
                                processAddressSave: h,
                                onUpdateSuccess: C,
                                hideSaveSection: !0,
                                triggeringContext: oT.paymentFlowAnalyticsService.ENUM_TRIGGERING_CONTEXT.WEB_PAYMENT_METHODS_SETTING
                            })
                        }), (0, b.jsx)("div", {
                            className: "footer-divider"
                        }), (0, b.jsx)(E.Modal.Footer, {
                            children: (0, b.jsxs)("div", {
                                className: "modal-buttons",
                                children: [(0, b.jsx)(E.Button, {
                                    variant: E.Button.variants.secondary,
                                    width: E.Button.widths.full,
                                    size: E.Button.sizes.large,
                                    className: "action-button",
                                    onClick: function() {
                                        n.close()
                                    },
                                    children: r(rQ)
                                }), (0, b.jsx)(E.Button, {
                                    width: E.Button.widths.full,
                                    size: E.Button.sizes.large,
                                    className: "action-button",
                                    isLoading: l,
                                    isDisabled: !f,
                                    onClick: S,
                                    children: r(rK)
                                })]
                            })
                        })]
                    })
                }, n]
            };

            function sp(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function sh(e, t, r, n, a, o, i) {
                try {
                    var u = e[o](i),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, a)
            }

            function sy(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, a) {
                        var o = e.apply(t, r);

                        function i(e) {
                            sh(o, n, a, i, u, "next", e)
                        }

                        function u(e) {
                            sh(o, n, a, i, u, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function sv(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (r = a.next()).done) && (o.push(r.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, n = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return sp(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return sp(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function sm(e, t) {
                var r, n, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    u = Object.defineProperty;
                return u(i, "next", {
                    value: l(0)
                }), u(i, "throw", {
                    value: l(1)
                }), u(i, "return", {
                    value: l(2)
                }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function l(u) {
                    return function(l) {
                        var s = [u, l];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, s[0] && (o = 0)), o;) try {
                            if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                            switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                case 0:
                                case 1:
                                    a = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < a[1]) {
                                        o.label = a[1], a = s;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(s);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], n = 0
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
            var sb = function(e) {
                var t = e.systemFeedbackService,
                    r = e.translate,
                    n = sv((0, x.useState)(), 2),
                    a = n[0],
                    o = n[1],
                    i = r("Heading.SavedGiftCardInformation"),
                    u = r("Heading.SavedBillingAddress.DeleteBillingAddress"),
                    l = r("Description.SavedBillingAddress.AreYouSureDeleteBillingAddress"),
                    s = sv(r3(), 2),
                    c = s[0],
                    f = s[1],
                    d = sv(sd(), 2),
                    p = d[0],
                    h = d[1];
                if ((0, x.useEffect)(function() {
                        sy(function() {
                            var e, t, r;
                            return sm(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        return n.trys.push([0, 2, , 3]), [4, rM(function() {
                                            var e, t;
                                            return rD(this, function(r) {
                                                return e = {
                                                    withCredentials: !0,
                                                    url: "".concat(g.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/user-settings-address")
                                                }, t = {}, [2, tG.httpService.get(e, t)]
                                            })
                                        })()];
                                    case 1:
                                        return t = (e = n.sent().data.address).country, r = e.state, o({
                                            country: t,
                                            state: r,
                                            city: e.city,
                                            postalCode: e.postalCode
                                        }), [3, 3];
                                    case 2:
                                        return n.sent(), [3, 3];
                                    case 3:
                                        return [2]
                                }
                            })
                        })()
                    }, []), !a) return null;
                var y = a.postalCode ? "".concat(a.city, ", ").concat(a.state, ", ").concat(a.postalCode, ", ").concat(a.country) : "".concat(a.city, ", ").concat(a.state, ", ").concat(a.country);
                return (0, b.jsxs)("div", {
                    className: "saved-gift-card-information-container",
                    children: [(0, b.jsxs)("h5", {
                        children: [" ", i, " "]
                    }), (0, b.jsxs)("div", {
                        className: "billing-address-container",
                        children: [(0, b.jsx)(c, {
                            translate: r,
                            header: u,
                            cancelText: l,
                            onDelete: function() {
                                return sy(function() {
                                    return sm(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return e.trys.push([0, 2, , 3]), [4, rM(function() {
                                                    var e, t;
                                                    return rD(this, function(r) {
                                                        return e = {
                                                            withCredentials: !0,
                                                            url: "".concat(g.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/user-settings-address")
                                                        }, t = {}, [2, tG.httpService.patch(e, t)]
                                                    })
                                                })()];
                                            case 1:
                                                return e.sent(), t.success(r("Description.SavedBillingAddress.DeleteBillingAddressSuccess")), o(void 0), [3, 3];
                                            case 2:
                                                return e.sent(), t.warning(r(rZ)), [3, 3];
                                            case 3:
                                                return [2]
                                        }
                                    })
                                })()
                            }
                        }), (0, b.jsx)(p, {
                            translate: r,
                            systemFeedbackService: t,
                            onUpdateSuccess: function(e) {
                                o(e)
                            },
                            address: a
                        }), (0, b.jsx)("p", {
                            className: "billing-address-label",
                            children: y
                        }), (0, b.jsx)("button", {
                            type: "button",
                            className: "btn-generic-edit-sm",
                            onClick: function() {
                                h.open()
                            },
                            children: (0, b.jsx)("span", {
                                className: "icon-edit"
                            })
                        }), (0, b.jsx)("button", {
                            type: "button",
                            className: "btn-generic-trash-bin-sm",
                            onClick: function() {
                                f.open()
                            },
                            children: (0, b.jsx)("span", {
                                className: "icon-trash-bin"
                            })
                        })]
                    })]
                })
            };

            function sg(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function sw(e, t, r, n, a, o, i) {
                try {
                    var u = e[o](i),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, a)
            }

            function sS(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, a) {
                        var o = e.apply(t, r);

                        function i(e) {
                            sw(o, n, a, i, u, "next", e)
                        }

                        function u(e) {
                            sw(o, n, a, i, u, "throw", e)
                        }
                        i(void 0)
                    })
                }
            }

            function sx(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var o = [],
                            i = !0,
                            u = !1;
                        try {
                            for (a = a.call(e); !(i = (r = a.next()).done) && (o.push(r.value), !t || o.length !== t); i = !0);
                        } catch (e) {
                            u = !0, n = e
                        } finally {
                            try {
                                i || null == a.return || a.return()
                            } finally {
                                if (u) throw n
                            }
                        }
                        return o
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return sg(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return sg(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function sC(e, t) {
                var r, n, a, o = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    i = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    u = Object.defineProperty;
                return u(i, "next", {
                    value: l(0)
                }), u(i, "throw", {
                    value: l(1)
                }), u(i, "return", {
                    value: l(2)
                }), "function" == typeof Symbol && u(i, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), i;

                function l(u) {
                    return function(l) {
                        var s = [u, l];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; i && (i = 0, s[0] && (o = 0)), o;) try {
                            if (r = 1, n && (a = 2 & s[0] ? n.return : s[0] ? n.throw || ((a = n.return) && a.call(n), 0) : n.next) && !(a = a.call(n, s[1])).done) return a;
                            switch (n = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                case 0:
                                case 1:
                                    a = s;
                                    break;
                                case 4:
                                    return o.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    o.label++, n = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = o.ops.pop(), o.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        o = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                        o.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && o.label < a[1]) {
                                        o.label = a[1], a = s;
                                        break
                                    }
                                    if (a && o.label < a[2]) {
                                        o.label = a[2], o.ops.push(s);
                                        break
                                    }
                                    a[2] && o.ops.pop(), o.trys.pop();
                                    continue
                            }
                            s = t.call(e, o)
                        } catch (e) {
                            s = [6, e], n = 0
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
            var sE = function(e) {
                var t = e.translate,
                    r = e.systemFeedbackService,
                    n = sx((0, x.useState)(!0), 2),
                    a = n[0],
                    o = n[1],
                    i = sx((0, x.useState)(!1), 2),
                    u = i[0],
                    l = i[1],
                    s = sx((0, x.useState)(!1), 2),
                    c = s[0],
                    f = s[1],
                    d = sx((0, x.useState)(!1), 2),
                    p = d[0],
                    h = d[1],
                    y = sx((0, x.useState)(), 2),
                    v = y[0],
                    m = y[1],
                    w = sx((0, x.useState)(), 2),
                    S = w[0],
                    C = w[1],
                    E = sx((0, x.useState)(), 2),
                    A = E[0],
                    k = E[1],
                    O = sx((0, x.useState)(!1), 2),
                    I = O[0],
                    U = O[1],
                    M = function() {
                        return sS(function() {
                            return sC(this, function(e) {
                                switch (e.label) {
                                    case 0:
                                        return e.trys.push([0, 2, , 3]), [4, rM(function() {
                                            var e, t, r;
                                            return rD(this, function(n) {
                                                switch (n.label) {
                                                    case 0:
                                                        return e = {
                                                            withCredentials: !0,
                                                            url: "".concat(g.EnvironmentUrls.userSettingsApi, "/v1/user-settings/settings-and-options")
                                                        }, [4, tG.httpService.get(e)];
                                                    case 1:
                                                        return r = function(e) {
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
                                                        }({}, (t = n.sent()).data), Object.entries(t.data).forEach(function(e) {
                                                            var t, n = function(e) {
                                                                    if (Array.isArray(e)) return e
                                                                }(e) || function(e) {
                                                                    var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                                                    if (null != n) {
                                                                        var a = [],
                                                                            o = !0,
                                                                            i = !1;
                                                                        try {
                                                                            for (n = n.call(e); !(o = (t = n.next()).done) && (a.push(t.value), 2 !== a.length); o = !0);
                                                                        } catch (e) {
                                                                            i = !0, r = e
                                                                        } finally {
                                                                            try {
                                                                                o || null == n.return || n.return()
                                                                            } finally {
                                                                                if (i) throw r
                                                                            }
                                                                        }
                                                                        return a
                                                                    }
                                                                }(e) || r_(e, 2) || function() {
                                                                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                                                }(),
                                                                a = n[0],
                                                                o = n[1];
                                                            ((null == o ? void 0 : o.options) === void 0 || (null == o || null == (t = o.options) ? void 0 : t.length) === 0) && delete r[a]
                                                        }), [2, r]
                                                }
                                            })
                                        })()];
                                    case 1:
                                        return k(e.sent()), [3, 3];
                                    case 2:
                                        return e.sent(), r.warning(t(rZ)), [3, 3];
                                    case 3:
                                        return [2]
                                }
                            })
                        })()
                    };
                (0, x.useEffect)(function() {
                    sS(function() {
                        var e;
                        return sC(this, function(n) {
                            switch (n.label) {
                                case 0:
                                    return n.trys.push([0, 2, , 3]), (0, N.fireEvent)(t9), [4, rM(function() {
                                        var e;
                                        return rD(this, function(t) {
                                            return e = {
                                                withCredentials: !0,
                                                url: "".concat(g.EnvironmentUrls.usersApi, "/v1/birthdate")
                                            }, [2, tG.httpService.get(e)]
                                        })
                                    })()];
                                case 1:
                                    return e = n.sent(), (0, N.fireEvent)(re),
                                        function(e, t) {
                                            j(2, arguments);
                                            var r = P(e),
                                                n = P(t),
                                                a = T(r, n),
                                                o = Math.abs(function(e, t) {
                                                    j(2, arguments);
                                                    var r = P(e),
                                                        n = P(t);
                                                    return r.getFullYear() - n.getFullYear()
                                                }(r, n));
                                            r.setFullYear(1584), n.setFullYear(1584);
                                            var i = T(r, n) === -a,
                                                u = a * (o - Number(i));
                                            return 0 === u ? 0 : u
                                        }(new Date, new Date(e.data.birthYear, e.data.birthMonth - 1, e.data.birthDay)) >= 18 && o(!1), [3, 3];
                                case 2:
                                    return n.sent(), (0, N.fireEvent)(rt), r.warning(t(rZ)), [3, 3];
                                case 3:
                                    return [2]
                            }
                        })
                    })(), sS(function() {
                        var e;
                        return sC(this, function(n) {
                            switch (n.label) {
                                case 0:
                                    return n.trys.push([0, 2, , 3]), [4, rM(function() {
                                        var e;
                                        return rD(this, function(t) {
                                            return e = {
                                                withCredentials: !0,
                                                url: "".concat(g.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/stripe/enabled-for-user")
                                            }, [2, tG.httpService.get(e)]
                                        })
                                    })()];
                                case 1:
                                    return f((e = n.sent()).data.isPaymentProviderEnabledForUser), h(e.data.isUserVpcApproved), [3, 3];
                                case 2:
                                    return n.sent(), r.warning(t(rZ)), [3, 3];
                                case 3:
                                    return [2]
                            }
                        })
                    })(), sS(function() {
                        var e;
                        return sC(this, function(n) {
                            switch (n.label) {
                                case 0:
                                    return n.trys.push([0, 3, , 4]), [4, rM(function() {
                                        return rD(this, function(e) {
                                            return [2, g.Guac.callBehaviour("account-settings-ui")]
                                        })
                                    })()];
                                case 1:
                                    return m(n.sent()), [4, rM(function() {
                                        var e;
                                        return rD(this, function(t) {
                                            switch (t.label) {
                                                case 0:
                                                    return e = {
                                                        withCredentials: !0,
                                                        url: "".concat(g.EnvironmentUrls.userSettingsApi, "/v1/user-settings/metadata")
                                                    }, [4, tG.httpService.get(e)];
                                                case 1:
                                                    return [2, t.sent().data]
                                            }
                                        })
                                    })()];
                                case 2:
                                    return (e = n.sent()) && C(e), [3, 4];
                                case 3:
                                    return n.sent(), r.warning(t(rZ)), [3, 4];
                                case 4:
                                    return [2]
                            }
                        })
                    })(), M(), sS(function() {
                        var e, t;
                        return sC(this, function(r) {
                            switch (r.label) {
                                case 0:
                                    return r.trys.push([0, 2, , 3]), [4, rM(function() {
                                        var e;
                                        return rD(this, function(t) {
                                            switch (t.label) {
                                                case 0:
                                                    return e = {
                                                        withCredentials: !0,
                                                        url: "".concat(g.EnvironmentUrls.apiGatewayUrl, "/parental-controls-api/v1/parental-controls/get-linked-parents")
                                                    }, [4, tG.httpService.get(e)];
                                                case 1:
                                                    return [2, t.sent().data]
                                            }
                                        })
                                    })()];
                                case 1:
                                    return l(null != (e = null == (t = r.sent().parents) ? void 0 : t.some(function(e) {
                                        return !0 === e.isRemoteParent
                                    })) && e), [3, 3];
                                case 2:
                                    return r.sent(), l(!1), [3, 3];
                                case 3:
                                    return [2]
                            }
                        })
                    })(), rM(function() {
                        var e;
                        return rD(this, function(t) {
                            switch (t.label) {
                                case 0:
                                    return e = {
                                        withCredentials: !0,
                                        url: "".concat(g.EnvironmentUrls.apiGatewayUrl, "/v1/subscriptions/metadata")
                                    }, [4, tG.httpService.get(e)];
                                case 1:
                                    return [2, t.sent().data.isPaymentMethodChangesEnabled]
                            }
                        })
                    })().then(function(e) {
                        U(e)
                    }).catch(function() {
                        U(!1)
                    })
                }, []);
                var _ = (0, x.useRef)(!0);
                (0, x.useEffect)(function() {
                    _.current && A && v && (_.current = !1, (null == v ? void 0 : v.renamePaymentsToSpendingTab) && lB(A.enablePurchases ? lg : lw))
                }, [v, A]);
                var D = null;
                switch (null == v ? void 0 : v.spendingNotificationDescription) {
                    case rG.GlobalTeen:
                        D = (0, b.jsx)("div", {
                            className: "text-description text-new-line",
                            dangerouslySetInnerHTML: {
                                __html: t("Description.SpendingPaymentMethods", {
                                    linkStart: '<a href="https://help.roblox.com/hc/categories/200213820" class="text-link" target="_blank">',
                                    linkEnd: "</a>"
                                })
                            }
                        });
                        break;
                    case rG.U13:
                        D = (0, b.jsx)("div", {
                            className: "text-description text-new-line",
                            children: t("Description.ChildSide.SpendingRestrictions")
                        });
                    case rG.O18:
                }
                return (0, b.jsxs)("div", {
                    className: "setting-container",
                    children: [(0, b.jsx)("h2", {
                        children: (null == v ? void 0 : v.renamePaymentsToSpendingTab) ? t("Heading.Tab.Spending") : t(rY)
                    }), D, (null == A ? void 0 : A.enablePurchases) !== void 0 && (0, b.jsx)(st, {
                        enablePurchaseSettings: A.enablePurchases,
                        refetchEnablePurchaseSettings: M,
                        translate: t,
                        systemFeedbackService: r
                    }), (null == S ? void 0 : S.displaySpendLimitSettings) && (0, b.jsx)(l3, {
                        enablePurchaseSettings: null == A ? void 0 : A.enablePurchases,
                        translate: t,
                        systemFeedbackService: r
                    }), a && u && (0, b.jsx)(ss, {
                        translate: t,
                        systemFeedbackService: r
                    }), a && !I ? (0, b.jsx)(so, {
                        translate: t,
                        systemFeedbackService: r
                    }) : (0, b.jsx)(lr, {
                        translate: t,
                        systemFeedbackService: r,
                        hideAddCardButton: a || !c,
                        shouldDisplaySavedPaymentMethods: c && p,
                        hideSavedPaymentMethodsIfNoSavedCards: a
                    }), (0, b.jsx)(sb, {
                        systemFeedbackService: r,
                        translate: t
                    }), !I && (0, b.jsx)(ls, {
                        translate: t,
                        systemFeedbackService: r
                    })]
                })
            };

            function sA(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var sk = (0, A.withTranslations)(function(e) {
                var t, r = e.translate,
                    n = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = (0, E.createSystemFeedback)()) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var a = [],
                                o = !0,
                                i = !1;
                            try {
                                for (n = n.call(e); !(o = (t = n.next()).done) && (a.push(t.value), 2 !== a.length); o = !0);
                            } catch (e) {
                                i = !0, r = e
                            } finally {
                                try {
                                    o || null == n.return || n.return()
                                } finally {
                                    if (i) throw r
                                }
                            }
                            return a
                        }
                    }(t) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return sA(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return sA(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    a = n[0],
                    o = n[1];
                return (0, b.jsxs)(C().Fragment, {
                    children: [(0, b.jsx)(sE, {
                        translate: r,
                        systemFeedbackService: o
                    }), (0, b.jsx)(a, {})]
                })
            }, {
                common: ["CommonUI.Features", "CommonUI.Controls", "Purchasing.RedeemGameCard", "Feature.Payment"],
                feature: "Feature.AccountSettings"
            });
            Object.assign(w(), {
                PaymentSetting: {
                    renderComponent: function(e) {
                        var t = document.getElementById(e);
                        return null !== t && ((0, S.renderWithErrorBoundary)((0, b.jsx)(sk, {}), t), !0)
                    }
                }
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("PaymentMethodsSetting");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/paymentMethodsSetting-456c3adb849bbf52.js.map
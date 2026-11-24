! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "6390980c0f58abd1eed918620b80c6acf6534fb8"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "a1179dd6-b092-4357-bc01-b8f1f9e4e1a3", e._sentryDebugIdIdentifier = "sentry-dbid-a1179dd6-b092-4357-bc01-b8f1f9e4e1a3")
    } catch (e) {}
}(),
function() {
    var e = {
            179: function(e, t, n) {
                var r, a, i = n(844);
                r = this, a = function(e, t) {
                    "use strict";

                    function n(e, t) {
                        var n = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t && (r = r.filter(function(t) {
                                return Object.getOwnPropertyDescriptor(e, t).enumerable
                            })), n.push.apply(n, r)
                        }
                        return n
                    }

                    function r(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var r = null != arguments[t] ? arguments[t] : {};
                            t % 2 ? n(Object(r), !0).forEach(function(t) {
                                i(e, t, r[t])
                            }) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(r)) : n(Object(r)).forEach(function(t) {
                                Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(r, t))
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

                    function i(e, t, n) {
                        return t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n, e
                    }

                    function o(e, t) {
                        if (null == e) return {};
                        var n, r, a = function(e, t) {
                            if (null == e) return {};
                            var n, r, a = {},
                                i = Object.keys(e);
                            for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (a[n] = e[n]);
                            return a
                        }(e, t);
                        if (Object.getOwnPropertySymbols) {
                            var i = Object.getOwnPropertySymbols(e);
                            for (r = 0; r < i.length; r++) n = i[r], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (a[n] = e[n])
                        }
                        return a
                    }

                    function s(e, t) {
                        return function(e) {
                            if (Array.isArray(e)) return e
                        }(e) || function(e, t) {
                            var n, r, a = e && ("u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"]);
                            if (null != a) {
                                var i = [],
                                    o = !0,
                                    s = !1;
                                try {
                                    for (a = a.call(e); !(o = (n = a.next()).done) && (i.push(n.value), !t || i.length !== t); o = !0);
                                } catch (e) {
                                    s = !0, r = e
                                } finally {
                                    try {
                                        o || null == a.return || a.return()
                                    } finally {
                                        if (s) throw r
                                    }
                                }
                                return i
                            }
                        }(e, t) || function(e, t) {
                            if (e) {
                                if ("string" == typeof e) return u(e, t);
                                var n = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(e);
                                if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return u(e, t)
                            }
                        }(e, t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()
                    }

                    function u(e, t) {
                        (null == t || t > e.length) && (t = e.length);
                        for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                        return r
                    }
                    var l, c, d, f, h, p = {
                        exports: {}
                    };
                    p.exports = (function() {
                        if (h) return f;
                        h = 1;
                        var e = d ? c : (d = 1, c = "SECRET_DO_NOT_PASS_THIS_OR_YOU_WILL_BE_FIRED");

                        function t() {}

                        function n() {}
                        return n.resetWarningCache = t, f = function() {
                            function r(t, n, r, a, i, o) {
                                if (o !== e) {
                                    var s = Error("Calling PropTypes validators directly is not supported by the `prop-types` package. Use PropTypes.checkPropTypes() to call them. Read more at http://fb.me/use-check-prop-types");
                                    throw s.name = "Invariant Violation", s
                                }
                            }

                            function a() {
                                return r
                            }
                            r.isRequired = r;
                            var i = {
                                array: r,
                                bool: r,
                                func: r,
                                number: r,
                                object: r,
                                string: r,
                                symbol: r,
                                any: r,
                                arrayOf: a,
                                element: r,
                                elementType: r,
                                instanceOf: a,
                                node: r,
                                objectOf: a,
                                oneOf: a,
                                oneOfType: a,
                                shape: a,
                                exact: a,
                                checkPropTypes: n,
                                resetWarningCache: t
                            };
                            return i.PropTypes = i, i
                        }
                    })()();
                    var v = (l = p.exports) && l.__esModule && Object.prototype.hasOwnProperty.call(l, "default") ? l.default : l,
                        m = function(e, n, r) {
                            var a = !!r,
                                i = t.useRef(r);
                            t.useEffect(function() {
                                i.current = r
                            }, [r]), t.useEffect(function() {
                                if (!a || !e) return function() {};
                                var t = function() {
                                    i.current && i.current.apply(i, arguments)
                                };
                                return e.on(n, t),
                                    function() {
                                        e.off(n, t)
                                    }
                            }, [a, n, e, i])
                        },
                        y = function(e) {
                            var n = t.useRef(e);
                            return t.useEffect(function() {
                                n.current = e
                            }, [e]), n.current
                        },
                        b = function(e) {
                            return null !== e && "object" === a(e)
                        },
                        g = "[object Object]",
                        E = function e(t, n) {
                            if (!b(t) || !b(n)) return t === n;
                            var r = Array.isArray(t);
                            if (r !== Array.isArray(n)) return !1;
                            var a = Object.prototype.toString.call(t) === g;
                            if (a !== (Object.prototype.toString.call(n) === g)) return !1;
                            if (!a && !r) return t === n;
                            var i = Object.keys(t),
                                o = Object.keys(n);
                            if (i.length !== o.length) return !1;
                            for (var s = {}, u = 0; u < i.length; u += 1) s[i[u]] = !0;
                            for (var l = 0; l < o.length; l += 1) s[o[l]] = !0;
                            var c = Object.keys(s);
                            return c.length === i.length && c.every(function(r) {
                                return e(t[r], n[r])
                            })
                        },
                        S = function(e, t, n) {
                            return b(e) ? Object.keys(e).reduce(function(a, o) {
                                var s = !b(t) || !E(e[o], t[o]);
                                return n.includes(o) ? (s && console.warn("Unsupported prop change: options.".concat(o, " is not a mutable property.")), a) : s ? r(r({}, a || {}), {}, i({}, o, e[o])) : a
                            }, null) : null
                        },
                        C = "Invalid prop `stripe` supplied to `Elements`. We recommend using the `loadStripe` utility from `@stripe/stripe-js`. See https://stripe.com/docs/stripe-js/react#elements-props-stripe for details.",
                        w = function(e) {
                            var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : C;
                            if (null === e || b(e) && "function" == typeof e.elements && "function" == typeof e.createToken && "function" == typeof e.createPaymentMethod && "function" == typeof e.confirmCardPayment) return e;
                            throw Error(t)
                        },
                        x = function(e) {
                            var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : C;
                            if (b(e) && "function" == typeof e.then) return {
                                tag: "async",
                                stripePromise: Promise.resolve(e).then(function(e) {
                                    return w(e, t)
                                })
                            };
                            var n = w(e, t);
                            return null === n ? {
                                tag: "empty"
                            } : {
                                tag: "sync",
                                stripe: n
                            }
                        },
                        P = function(e) {
                            e && e._registerWrapper && e.registerAppInfo && (e._registerWrapper({
                                name: "react-stripe-js",
                                version: "3.10.0"
                            }), e.registerAppInfo({
                                name: "react-stripe-js",
                                version: "3.10.0",
                                url: "https://stripe.com/docs/stripe-js/react"
                            }))
                        },
                        _ = t.createContext(null);
                    _.displayName = "ElementsContext";
                    var T = function(e, t) {
                            if (!e) throw Error("Could not find Elements context; You need to wrap the part of your app that ".concat(t, " in an <Elements> provider."));
                            return e
                        },
                        A = function(e) {
                            var n = e.stripe,
                                r = e.options,
                                a = e.children,
                                i = t.useMemo(function() {
                                    return x(n)
                                }, [n]),
                                o = s(t.useState(function() {
                                    return {
                                        stripe: "sync" === i.tag ? i.stripe : null,
                                        elements: "sync" === i.tag ? i.stripe.elements(r) : null
                                    }
                                }), 2),
                                u = o[0],
                                l = o[1];
                            t.useEffect(function() {
                                var e = !0,
                                    t = function(e) {
                                        l(function(t) {
                                            return t.stripe ? t : {
                                                stripe: e,
                                                elements: e.elements(r)
                                            }
                                        })
                                    };
                                return "async" !== i.tag || u.stripe ? "sync" !== i.tag || u.stripe || t(i.stripe) : i.stripePromise.then(function(n) {
                                        n && e && t(n)
                                    }),
                                    function() {
                                        e = !1
                                    }
                            }, [i, u, r]);
                            var c = y(n);
                            t.useEffect(function() {
                                null !== c && c !== n && console.warn("Unsupported prop change on Elements: You cannot change the `stripe` prop after setting it.")
                            }, [c, n]);
                            var d = y(r);
                            return t.useEffect(function() {
                                if (u.elements) {
                                    var e = S(r, d, ["clientSecret", "fonts"]);
                                    e && u.elements.update(e)
                                }
                            }, [r, d, u.elements]), t.useEffect(function() {
                                P(u.stripe)
                            }, [u.stripe]), t.createElement(_.Provider, {
                                value: u
                            }, a)
                        };
                    A.propTypes = {
                        stripe: v.any,
                        options: v.object
                    };
                    var U = function(e) {
                            return T(t.useContext(_), e)
                        },
                        N = function(e) {
                            return (0, e.children)(U("mounts <ElementsConsumer>"))
                        };
                    N.propTypes = {
                        children: v.func.isRequired
                    };
                    var R = ["on", "session"],
                        k = t.createContext(null);
                    k.displayName = "CheckoutSdkContext";
                    var O = function(e, t) {
                            if (!e) throw Error("Could not find CheckoutProvider context; You need to wrap the part of your app that ".concat(t, " in an <CheckoutProvider> provider."));
                            return e
                        },
                        I = t.createContext(null);
                    I.displayName = "CheckoutContext";
                    var M = function(e, t) {
                            if (!e) return null;
                            e.on, e.session;
                            var n = o(e, R);
                            return t ? Object.assign(t, n) : Object.assign(e.session(), n)
                        },
                        B = function(e) {
                            var n = e.stripe,
                                r = e.options,
                                a = e.children,
                                i = t.useMemo(function() {
                                    return x(n, "Invalid prop `stripe` supplied to `CheckoutProvider`. We recommend using the `loadStripe` utility from `@stripe/stripe-js`. See https://stripe.com/docs/stripe-js/react#elements-props-stripe for details.")
                                }, [n]),
                                o = s(t.useState(null), 2),
                                u = o[0],
                                l = o[1],
                                c = s(t.useState(function() {
                                    return {
                                        stripe: "sync" === i.tag ? i.stripe : null,
                                        checkoutSdk: null
                                    }
                                }), 2),
                                d = c[0],
                                f = c[1],
                                h = function(e, t) {
                                    f(function(n) {
                                        return n.stripe && n.checkoutSdk ? n : {
                                            stripe: e,
                                            checkoutSdk: t
                                        }
                                    })
                                },
                                p = t.useRef(!1);
                            t.useEffect(function() {
                                var e = !0;
                                return "async" !== i.tag || d.stripe ? "sync" === i.tag && i.stripe && !p.current && (p.current = !0, i.stripe.initCheckout(r).then(function(e) {
                                        e && (h(i.stripe, e), e.on("change", l))
                                    })) : i.stripePromise.then(function(t) {
                                        t && e && !p.current && (p.current = !0, t.initCheckout(r).then(function(e) {
                                            e && (h(t, e), e.on("change", l))
                                        }))
                                    }),
                                    function() {
                                        e = !1
                                    }
                            }, [i, d, r, l]);
                            var v = y(n);
                            t.useEffect(function() {
                                null !== v && v !== n && console.warn("Unsupported prop change on CheckoutProvider: You cannot change the `stripe` prop after setting it.")
                            }, [v, n]);
                            var m = y(r),
                                b = y(d.checkoutSdk);
                            t.useEffect(function() {
                                if (d.checkoutSdk) {
                                    var e, t, n, a, i = !!(!b && d.checkoutSdk),
                                        o = null == m || null == (e = m.elementsOptions) ? void 0 : e.appearance,
                                        s = null == r || null == (t = r.elementsOptions) ? void 0 : t.appearance,
                                        u = !E(s, o);
                                    s && (u || i) && d.checkoutSdk.changeAppearance(s);
                                    var l = null == m || null == (n = m.elementsOptions) ? void 0 : n.fonts,
                                        c = null == r || null == (a = r.elementsOptions) ? void 0 : a.fonts,
                                        f = !E(l, c);
                                    c && (f || i) && d.checkoutSdk.loadFonts(c)
                                }
                            }, [r, m, d.checkoutSdk, b]), t.useEffect(function() {
                                P(d.stripe)
                            }, [d.stripe]);
                            var g = t.useMemo(function() {
                                return M(d.checkoutSdk, u)
                            }, [d.checkoutSdk, u]);
                            return d.checkoutSdk ? t.createElement(k.Provider, {
                                value: d
                            }, t.createElement(I.Provider, {
                                value: g
                            }, a)) : null
                        };
                    B.propTypes = {
                        stripe: v.any,
                        options: v.shape({
                            fetchClientSecret: v.func.isRequired,
                            elementsOptions: v.object
                        }).isRequired
                    };
                    var D = function(e) {
                            var n = t.useContext(k),
                                r = t.useContext(_);
                            if (n && r) throw Error("You cannot wrap the part of your app that ".concat(e, " in both <CheckoutProvider> and <Elements> providers."));
                            return n ? O(n, e) : T(r, e)
                        },
                        L = ["mode"],
                        j = function(e, n) {
                            var r = "".concat(e.charAt(0).toUpperCase() + e.slice(1), "Element"),
                                a = n ? function(e) {
                                    D("mounts <".concat(r, ">"));
                                    var n = e.id,
                                        a = e.className;
                                    return t.createElement("div", {
                                        id: n,
                                        className: a
                                    })
                                } : function(n) {
                                    var a, i = n.id,
                                        u = n.className,
                                        l = n.options,
                                        c = void 0 === l ? {} : l,
                                        d = n.onBlur,
                                        f = n.onFocus,
                                        h = n.onReady,
                                        p = n.onChange,
                                        v = n.onEscape,
                                        b = n.onClick,
                                        g = n.onLoadError,
                                        E = n.onLoaderStart,
                                        C = n.onNetworksChange,
                                        w = n.onConfirm,
                                        x = n.onCancel,
                                        P = n.onShippingAddressChange,
                                        _ = n.onShippingRateChange,
                                        T = n.onSavedPaymentMethodRemove,
                                        A = n.onSavedPaymentMethodUpdate,
                                        U = D("mounts <".concat(r, ">")),
                                        N = "elements" in U ? U.elements : null,
                                        R = "checkoutSdk" in U ? U.checkoutSdk : null,
                                        k = s(t.useState(null), 2),
                                        O = k[0],
                                        I = k[1],
                                        M = t.useRef(null),
                                        B = t.useRef(null);
                                    m(O, "blur", d), m(O, "focus", f), m(O, "escape", v), m(O, "click", b), m(O, "loaderror", g), m(O, "loaderstart", E), m(O, "networkschange", C), m(O, "confirm", w), m(O, "cancel", x), m(O, "shippingaddresschange", P), m(O, "shippingratechange", _), m(O, "savedpaymentmethodremove", T), m(O, "savedpaymentmethodupdate", A), m(O, "change", p), h && (a = "expressCheckout" === e ? h : function() {
                                        h(O)
                                    }), m(O, "ready", a), t.useLayoutEffect(function() {
                                        if (null === M.current && null !== B.current && (N || R)) {
                                            var t = null;
                                            if (R) switch (e) {
                                                case "payment":
                                                    t = R.createPaymentElement(c);
                                                    break;
                                                case "address":
                                                    if ("mode" in c) {
                                                        var n = c.mode,
                                                            a = o(c, L);
                                                        if ("shipping" === n) t = R.createShippingAddressElement(a);
                                                        else if ("billing" === n) t = R.createBillingAddressElement(a);
                                                        else throw Error("Invalid options.mode. mode must be 'billing' or 'shipping'.")
                                                    } else throw Error("You must supply options.mode. mode must be 'billing' or 'shipping'.");
                                                    break;
                                                case "expressCheckout":
                                                    t = R.createExpressCheckoutElement(c);
                                                    break;
                                                case "currencySelector":
                                                    t = R.createCurrencySelectorElement();
                                                    break;
                                                case "taxId":
                                                    t = R.createTaxIdElement(c);
                                                    break;
                                                default:
                                                    throw Error("Invalid Element type ".concat(r, ". You must use either the <PaymentElement />, <AddressElement options={{mode: 'shipping'}} />, <AddressElement options={{mode: 'billing'}} />, or <ExpressCheckoutElement />."))
                                            } else N && (t = N.create(e, c));
                                            M.current = t, I(t), t && t.mount(B.current)
                                        }
                                    }, [N, R, c]);
                                    var j = y(c);
                                    return t.useEffect(function() {
                                        if (M.current) {
                                            var e = S(c, j, ["paymentRequest"]);
                                            e && "update" in M.current && M.current.update(e)
                                        }
                                    }, [c, j]), t.useLayoutEffect(function() {
                                        return function() {
                                            if (M.current && "function" == typeof M.current.destroy) try {
                                                M.current.destroy(), M.current = null
                                            } catch (e) {}
                                        }
                                    }, []), t.createElement("div", {
                                        id: i,
                                        className: u,
                                        ref: B
                                    })
                                };
                            return a.propTypes = {
                                id: v.string,
                                className: v.string,
                                onChange: v.func,
                                onBlur: v.func,
                                onFocus: v.func,
                                onReady: v.func,
                                onEscape: v.func,
                                onClick: v.func,
                                onLoadError: v.func,
                                onLoaderStart: v.func,
                                onNetworksChange: v.func,
                                onConfirm: v.func,
                                onCancel: v.func,
                                onShippingAddressChange: v.func,
                                onShippingRateChange: v.func,
                                onSavedPaymentMethodRemove: v.func,
                                onSavedPaymentMethodUpdate: v.func,
                                options: v.object
                            }, a.displayName = r, a.__elementType = e, a
                        },
                        F = "u" < typeof window,
                        G = t.createContext(null);
                    G.displayName = "EmbeddedCheckoutProviderContext";
                    var W = function() {
                            var e = t.useContext(G);
                            if (!e) throw Error("<EmbeddedCheckout> must be used within <EmbeddedCheckoutProvider>");
                            return e
                        },
                        H = F ? function(e) {
                            var n = e.id,
                                r = e.className;
                            return W(), t.createElement("div", {
                                id: n,
                                className: r
                            })
                        } : function(e) {
                            var n = e.id,
                                r = e.className,
                                a = W().embeddedCheckout,
                                i = t.useRef(!1),
                                o = t.useRef(null);
                            return t.useLayoutEffect(function() {
                                return !i.current && a && null !== o.current && (a.mount(o.current), i.current = !0),
                                    function() {
                                        if (i.current && a) try {
                                            a.unmount(), i.current = !1
                                        } catch (e) {}
                                    }
                            }, [a]), t.createElement("div", {
                                ref: o,
                                id: n,
                                className: r
                            })
                        },
                        V = j("auBankAccount", F),
                        Y = j("card", F),
                        X = j("cardNumber", F),
                        q = j("cardExpiry", F),
                        z = j("cardCvc", F),
                        K = j("fpxBank", F),
                        Q = j("iban", F),
                        J = j("idealBank", F),
                        Z = j("p24Bank", F),
                        $ = j("epsBank", F),
                        ee = j("payment", F),
                        et = j("expressCheckout", F),
                        en = j("currencySelector", F),
                        er = j("paymentRequestButton", F),
                        ea = j("linkAuthentication", F),
                        ei = j("address", F),
                        eo = j("shippingAddress", F),
                        es = j("paymentMethodMessaging", F),
                        eu = j("affirmMessage", F),
                        el = j("afterpayClearpayMessage", F),
                        ec = j("taxId", F);
                    e.AddressElement = ei, e.AffirmMessageElement = eu, e.AfterpayClearpayMessageElement = el, e.AuBankAccountElement = V, e.CardCvcElement = z, e.CardElement = Y, e.CardExpiryElement = q, e.CardNumberElement = X, e.CheckoutProvider = B, e.CurrencySelectorElement = en, e.Elements = A, e.ElementsConsumer = N, e.EmbeddedCheckout = H, e.EmbeddedCheckoutProvider = function(e) {
                        var n = e.stripe,
                            r = e.options,
                            a = e.children,
                            i = t.useMemo(function() {
                                return x(n, "Invalid prop `stripe` supplied to `EmbeddedCheckoutProvider`. We recommend using the `loadStripe` utility from `@stripe/stripe-js`. See https://stripe.com/docs/stripe-js/react#elements-props-stripe for details.")
                            }, [n]),
                            o = t.useRef(null),
                            u = t.useRef(null),
                            l = s(t.useState({
                                embeddedCheckout: null
                            }), 2),
                            c = l[0],
                            d = l[1];
                        t.useEffect(function() {
                            if (!u.current && !o.current) {
                                var e = function(e) {
                                    u.current || o.current || (u.current = e, o.current = u.current.initEmbeddedCheckout(r).then(function(e) {
                                        d({
                                            embeddedCheckout: e
                                        })
                                    }))
                                };
                                "async" === i.tag && !u.current && (r.clientSecret || r.fetchClientSecret) ? i.stripePromise.then(function(t) {
                                    t && e(t)
                                }) : "sync" === i.tag && !u.current && (r.clientSecret || r.fetchClientSecret) && e(i.stripe)
                            }
                        }, [i, r, c, u]), t.useEffect(function() {
                            return function() {
                                c.embeddedCheckout ? (o.current = null, c.embeddedCheckout.destroy()) : o.current && o.current.then(function() {
                                    o.current = null, c.embeddedCheckout && c.embeddedCheckout.destroy()
                                })
                            }
                        }, [c.embeddedCheckout]), t.useEffect(function() {
                            P(u)
                        }, [u]);
                        var f = y(n);
                        t.useEffect(function() {
                            null !== f && f !== n && console.warn("Unsupported prop change on EmbeddedCheckoutProvider: You cannot change the `stripe` prop after setting it.")
                        }, [f, n]);
                        var h = y(r);
                        return t.useEffect(function() {
                            if (null != h) {
                                if (null == r) return void console.warn("Unsupported prop change on EmbeddedCheckoutProvider: You cannot unset options after setting them.");
                                void 0 === r.clientSecret && void 0 === r.fetchClientSecret && console.warn("Invalid props passed to EmbeddedCheckoutProvider: You must provide one of either `options.fetchClientSecret` or `options.clientSecret`."), null != h.clientSecret && r.clientSecret !== h.clientSecret && console.warn("Unsupported prop change on EmbeddedCheckoutProvider: You cannot change the client secret after setting it. Unmount and create a new instance of EmbeddedCheckoutProvider instead."), null != h.fetchClientSecret && r.fetchClientSecret !== h.fetchClientSecret && console.warn("Unsupported prop change on EmbeddedCheckoutProvider: You cannot change fetchClientSecret after setting it. Unmount and create a new instance of EmbeddedCheckoutProvider instead."), null != h.onComplete && r.onComplete !== h.onComplete && console.warn("Unsupported prop change on EmbeddedCheckoutProvider: You cannot change the onComplete option after setting it."), null != h.onShippingDetailsChange && r.onShippingDetailsChange !== h.onShippingDetailsChange && console.warn("Unsupported prop change on EmbeddedCheckoutProvider: You cannot change the onShippingDetailsChange option after setting it."), null != h.onLineItemsChange && r.onLineItemsChange !== h.onLineItemsChange && console.warn("Unsupported prop change on EmbeddedCheckoutProvider: You cannot change the onLineItemsChange option after setting it.")
                            }
                        }, [h, r]), t.createElement(G.Provider, {
                            value: c
                        }, a)
                    }, e.EpsBankElement = $, e.ExpressCheckoutElement = et, e.FpxBankElement = K, e.IbanElement = Q, e.IdealBankElement = J, e.LinkAuthenticationElement = ea, e.P24BankElement = Z, e.PaymentElement = ee, e.PaymentMethodMessagingElement = es, e.PaymentRequestButtonElement = er, e.ShippingAddressElement = eo, e.TaxIdElement = ec, e.useCheckout = function() {
                        O(t.useContext(k), "calls useCheckout()");
                        var e = t.useContext(I);
                        if (!e) throw Error("Could not find Checkout Context; You need to wrap the part of your app that calls useCheckout() in an <CheckoutProvider> provider.");
                        return e
                    }, e.useElements = function() {
                        return U("calls useElements()").elements
                    }, e.useStripe = function() {
                        return D("calls useStripe()").stripe
                    }
                }, "object" === i._(t) ? a(t, n(609)) : "function" == typeof define && define.amd ? define(["exports", "react"], a) : a((r = "u" > typeof globalThis ? globalThis : r || self).ReactStripe = {}, r.React)
            },
            784: function(e, t, n) {
                "use strict";

                function r(e, t) {
                    return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
                }
                n.r(t), n.d(t, {
                    _: function() {
                        return r
                    }
                })
            },
            844: function(e, t, n) {
                "use strict";

                function r(e) {
                    return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
                }
                n.r(t), n.d(t, {
                    _: function() {
                        return r
                    }
                })
            },
            742: function(e, t) {
                "use strict";
                t.byteLength = function(e) {
                    var t = u(e),
                        n = t[0],
                        r = t[1];
                    return (n + r) * 3 / 4 - r
                }, t.toByteArray = function(e) {
                    var t, n, i = u(e),
                        o = i[0],
                        s = i[1],
                        l = new a((o + s) * 3 / 4 - s),
                        c = 0,
                        d = s > 0 ? o - 4 : o;
                    for (n = 0; n < d; n += 4) t = r[e.charCodeAt(n)] << 18 | r[e.charCodeAt(n + 1)] << 12 | r[e.charCodeAt(n + 2)] << 6 | r[e.charCodeAt(n + 3)], l[c++] = t >> 16 & 255, l[c++] = t >> 8 & 255, l[c++] = 255 & t;
                    return 2 === s && (t = r[e.charCodeAt(n)] << 2 | r[e.charCodeAt(n + 1)] >> 4, l[c++] = 255 & t), 1 === s && (t = r[e.charCodeAt(n)] << 10 | r[e.charCodeAt(n + 1)] << 4 | r[e.charCodeAt(n + 2)] >> 2, l[c++] = t >> 8 & 255, l[c++] = 255 & t), l
                }, t.fromByteArray = function(e) {
                    for (var t, r = e.length, a = r % 3, i = [], o = 0, s = r - a; o < s; o += 16383) i.push(function(e, t, r) {
                        for (var a, i = [], o = t; o < r; o += 3) a = (e[o] << 16 & 0xff0000) + (e[o + 1] << 8 & 65280) + (255 & e[o + 2]), i.push(n[a >> 18 & 63] + n[a >> 12 & 63] + n[a >> 6 & 63] + n[63 & a]);
                        return i.join("")
                    }(e, o, o + 16383 > s ? s : o + 16383));
                    return 1 === a ? i.push(n[(t = e[r - 1]) >> 2] + n[t << 4 & 63] + "==") : 2 === a && i.push(n[(t = (e[r - 2] << 8) + e[r - 1]) >> 10] + n[t >> 4 & 63] + n[t << 2 & 63] + "="), i.join("")
                };
                for (var n = [], r = [], a = "u" > typeof Uint8Array ? Uint8Array : Array, i = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", o = 0, s = i.length; o < s; ++o) n[o] = i[o], r[i.charCodeAt(o)] = o;

                function u(e) {
                    var t = e.length;
                    if (t % 4 > 0) throw Error("Invalid string. Length must be a multiple of 4");
                    var n = e.indexOf("="); - 1 === n && (n = t);
                    var r = n === t ? 0 : 4 - n % 4;
                    return [n, r]
                }
                r[45] = 62, r[95] = 63
            },
            564: function(e, t, n) {
                "use strict";
                /*!
                 * The buffer module from node.js, for the browser.
                 *
                 * @author   Feross Aboukhadijeh <https://feross.org>
                 * @license  MIT
                 */
                var r = n(784),
                    a = n(844),
                    i = n(742),
                    o = n(619),
                    s = "function" == typeof Symbol && "function" == typeof Symbol.for ? Symbol.for("nodejs.util.inspect.custom") : null;

                function u(e) {
                    if (e > 0x7fffffff) throw RangeError('The value "' + e + '" is invalid for option "size"');
                    var t = new Uint8Array(e);
                    return Object.setPrototypeOf(t, l.prototype), t
                }

                function l(e, t, n) {
                    if ("number" == typeof e) {
                        if ("string" == typeof t) throw TypeError('The "string" argument must be of type string. Received type number');
                        return f(e)
                    }
                    return c(e, t, n)
                }

                function c(e, t, n) {
                    if ("string" == typeof e) {
                        var r = e,
                            i = t;
                        if (("string" != typeof i || "" === i) && (i = "utf8"), !l.isEncoding(i)) throw TypeError("Unknown encoding: " + i);
                        var o = 0 | m(r, i),
                            s = u(o),
                            c = s.write(r, i);
                        return c !== o && (s = s.slice(0, c)), s
                    }
                    if (ArrayBuffer.isView(e)) {
                        var d = e;
                        if (R(d, Uint8Array)) {
                            var f = new Uint8Array(d);
                            return p(f.buffer, f.byteOffset, f.byteLength)
                        }
                        return h(d)
                    }
                    if (null == e) throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + (void 0 === e ? "undefined" : a._(e)));
                    if (R(e, ArrayBuffer) || e && R(e.buffer, ArrayBuffer) || "u" > typeof SharedArrayBuffer && (R(e, SharedArrayBuffer) || e && R(e.buffer, SharedArrayBuffer))) return p(e, t, n);
                    if ("number" == typeof e) throw TypeError('The "value" argument must not be of type number. Received type number');
                    var y = e.valueOf && e.valueOf();
                    if (null != y && y !== e) return l.from(y, t, n);
                    var b = function(e) {
                        if (l.isBuffer(e)) {
                            var t = 0 | v(e.length),
                                n = u(t);
                            return 0 === n.length || e.copy(n, 0, 0, t), n
                        }
                        return void 0 !== e.length ? "number" != typeof e.length || function(e) {
                            return e != e
                        }(e.length) ? u(0) : h(e) : "Buffer" === e.type && Array.isArray(e.data) ? h(e.data) : void 0
                    }(e);
                    if (b) return b;
                    if ("u" > typeof Symbol && null != Symbol.toPrimitive && "function" == typeof e[Symbol.toPrimitive]) return l.from(e[Symbol.toPrimitive]("string"), t, n);
                    throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + (void 0 === e ? "undefined" : a._(e)))
                }

                function d(e) {
                    if ("number" != typeof e) throw TypeError('"size" argument must be of type number');
                    if (e < 0) throw RangeError('The value "' + e + '" is invalid for option "size"')
                }

                function f(e) {
                    return d(e), u(e < 0 ? 0 : 0 | v(e))
                }

                function h(e) {
                    for (var t = e.length < 0 ? 0 : 0 | v(e.length), n = u(t), r = 0; r < t; r += 1) n[r] = 255 & e[r];
                    return n
                }

                function p(e, t, n) {
                    var r;
                    if (t < 0 || e.byteLength < t) throw RangeError('"offset" is outside of buffer bounds');
                    if (e.byteLength < t + (n || 0)) throw RangeError('"length" is outside of buffer bounds');
                    return Object.setPrototypeOf(r = void 0 === t && void 0 === n ? new Uint8Array(e) : void 0 === n ? new Uint8Array(e, t) : new Uint8Array(e, t, n), l.prototype), r
                }

                function v(e) {
                    if (e >= 0x7fffffff) throw RangeError("Attempt to allocate Buffer larger than maximum size: 0x7fffffff bytes");
                    return 0 | e
                }

                function m(e, t) {
                    if (l.isBuffer(e)) return e.length;
                    if (ArrayBuffer.isView(e) || R(e, ArrayBuffer)) return e.byteLength;
                    if ("string" != typeof e) throw TypeError('The "string" argument must be one of type string, Buffer, or ArrayBuffer. Received type ' + (void 0 === e ? "undefined" : a._(e)));
                    var n = e.length,
                        r = arguments.length > 2 && !0 === arguments[2];
                    if (!r && 0 === n) return 0;
                    for (var i = !1;;) switch (t) {
                        case "ascii":
                        case "latin1":
                        case "binary":
                            return n;
                        case "utf8":
                        case "utf-8":
                            return A(e).length;
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return 2 * n;
                        case "hex":
                            return n >>> 1;
                        case "base64":
                            return U(e).length;
                        default:
                            if (i) return r ? -1 : A(e).length;
                            t = ("" + t).toLowerCase(), i = !0
                    }
                }

                function y(e, t, n) {
                    var r, a, o, s = !1;
                    if ((void 0 === t || t < 0) && (t = 0), t > this.length || ((void 0 === n || n > this.length) && (n = this.length), n <= 0 || (n >>>= 0) <= (t >>>= 0))) return "";
                    for (e || (e = "utf8");;) switch (e) {
                        case "hex":
                            return function(e, t, n) {
                                var r = e.length;
                                (!t || t < 0) && (t = 0), (!n || n < 0 || n > r) && (n = r);
                                for (var a = "", i = t; i < n; ++i) a += k[e[i]];
                                return a
                            }(this, t, n);
                        case "utf8":
                        case "utf-8":
                            return S(this, t, n);
                        case "ascii":
                            return function(e, t, n) {
                                var r = "";
                                n = Math.min(e.length, n);
                                for (var a = t; a < n; ++a) r += String.fromCharCode(127 & e[a]);
                                return r
                            }(this, t, n);
                        case "latin1":
                        case "binary":
                            return function(e, t, n) {
                                var r = "";
                                n = Math.min(e.length, n);
                                for (var a = t; a < n; ++a) r += String.fromCharCode(e[a]);
                                return r
                            }(this, t, n);
                        case "base64":
                            return r = this, a = t, o = n, 0 === a && o === r.length ? i.fromByteArray(r) : i.fromByteArray(r.slice(a, o));
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return function(e, t, n) {
                                for (var r = e.slice(t, n), a = "", i = 0; i < r.length - 1; i += 2) a += String.fromCharCode(r[i] + 256 * r[i + 1]);
                                return a
                            }(this, t, n);
                        default:
                            if (s) throw TypeError("Unknown encoding: " + e);
                            e = (e + "").toLowerCase(), s = !0
                    }
                }

                function b(e, t, n) {
                    var r = e[t];
                    e[t] = e[n], e[n] = r
                }

                function g(e, t, n, r, a) {
                    var i;
                    if (0 === e.length) return -1;
                    if ("string" == typeof n ? (r = n, n = 0) : n > 0x7fffffff ? n = 0x7fffffff : n < -0x80000000 && (n = -0x80000000), (i = n *= 1) != i && (n = a ? 0 : e.length - 1), n < 0 && (n = e.length + n), n >= e.length)
                        if (a) return -1;
                        else n = e.length - 1;
                    else if (n < 0)
                        if (!a) return -1;
                        else n = 0;
                    if ("string" == typeof t && (t = l.from(t, r)), l.isBuffer(t)) return 0 === t.length ? -1 : E(e, t, n, r, a);
                    if ("number" == typeof t) {
                        if (t &= 255, "function" == typeof Uint8Array.prototype.indexOf)
                            if (a) return Uint8Array.prototype.indexOf.call(e, t, n);
                            else return Uint8Array.prototype.lastIndexOf.call(e, t, n);
                        return E(e, [t], n, r, a)
                    }
                    throw TypeError("val must be string, number or Buffer")
                }

                function E(e, t, n, r, a) {
                    var i, o = 1,
                        s = e.length,
                        u = t.length;
                    if (void 0 !== r && ("ucs2" === (r = String(r).toLowerCase()) || "ucs-2" === r || "utf16le" === r || "utf-16le" === r)) {
                        if (e.length < 2 || t.length < 2) return -1;
                        o = 2, s /= 2, u /= 2, n /= 2
                    }

                    function l(e, t) {
                        return 1 === o ? e[t] : e.readUInt16BE(t * o)
                    }
                    if (a) {
                        var c = -1;
                        for (i = n; i < s; i++)
                            if (l(e, i) === l(t, -1 === c ? 0 : i - c)) {
                                if (-1 === c && (c = i), i - c + 1 === u) return c * o
                            } else - 1 !== c && (i -= i - c), c = -1
                    } else
                        for (n + u > s && (n = s - u), i = n; i >= 0; i--) {
                            for (var d = !0, f = 0; f < u; f++)
                                if (l(e, i + f) !== l(t, f)) {
                                    d = !1;
                                    break
                                } if (d) return i
                        }
                    return -1
                }

                function S(e, t, n) {
                    n = Math.min(e.length, n);
                    for (var r = [], a = t; a < n;) {
                        var i, o, s, u, l = e[a],
                            c = null,
                            d = l > 239 ? 4 : l > 223 ? 3 : l > 191 ? 2 : 1;
                        if (a + d <= n) switch (d) {
                            case 1:
                                l < 128 && (c = l);
                                break;
                            case 2:
                                (192 & (i = e[a + 1])) == 128 && (u = (31 & l) << 6 | 63 & i) > 127 && (c = u);
                                break;
                            case 3:
                                i = e[a + 1], o = e[a + 2], (192 & i) == 128 && (192 & o) == 128 && (u = (15 & l) << 12 | (63 & i) << 6 | 63 & o) > 2047 && (u < 55296 || u > 57343) && (c = u);
                                break;
                            case 4:
                                i = e[a + 1], o = e[a + 2], s = e[a + 3], (192 & i) == 128 && (192 & o) == 128 && (192 & s) == 128 && (u = (15 & l) << 18 | (63 & i) << 12 | (63 & o) << 6 | 63 & s) > 65535 && u < 1114112 && (c = u)
                        }
                        null === c ? (c = 65533, d = 1) : c > 65535 && (c -= 65536, r.push(c >>> 10 & 1023 | 55296), c = 56320 | 1023 & c), r.push(c), a += d
                    }
                    var f = r,
                        h = f.length;
                    if (h <= 4096) return String.fromCharCode.apply(String, f);
                    for (var p = "", v = 0; v < h;) p += String.fromCharCode.apply(String, f.slice(v, v += 4096));
                    return p
                }

                function C(e, t, n) {
                    if (e % 1 != 0 || e < 0) throw RangeError("offset is not uint");
                    if (e + t > n) throw RangeError("Trying to access beyond buffer length")
                }

                function w(e, t, n, r, a, i) {
                    if (!l.isBuffer(e)) throw TypeError('"buffer" argument must be a Buffer instance');
                    if (t > a || t < i) throw RangeError('"value" argument is out of bounds');
                    if (n + r > e.length) throw RangeError("Index out of range")
                }

                function x(e, t, n, r, a, i) {
                    if (n + r > e.length || n < 0) throw RangeError("Index out of range")
                }

                function P(e, t, n, r, a) {
                    return t *= 1, n >>>= 0, a || x(e, t, n, 4, 34028234663852886e22, -34028234663852886e22), o.write(e, t, n, r, 23, 4), n + 4
                }

                function _(e, t, n, r, a) {
                    return t *= 1, n >>>= 0, a || x(e, t, n, 8, 17976931348623157e292, -17976931348623157e292), o.write(e, t, n, r, 52, 8), n + 8
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
                }), l.poolSize = 8192, l.from = function(e, t, n) {
                    return c(e, t, n)
                }, Object.setPrototypeOf(l.prototype, Uint8Array.prototype), Object.setPrototypeOf(l, Uint8Array), l.alloc = function(e, t, n) {
                    return (d(e), e <= 0) ? u(e) : void 0 !== t ? "string" == typeof n ? u(e).fill(t, n) : u(e).fill(t) : u(e)
                }, l.allocUnsafe = function(e) {
                    return f(e)
                }, l.allocUnsafeSlow = function(e) {
                    return f(e)
                }, l.isBuffer = function(e) {
                    return null != e && !0 === e._isBuffer && e !== l.prototype
                }, l.compare = function(e, t) {
                    if (R(e, Uint8Array) && (e = l.from(e, e.offset, e.byteLength)), R(t, Uint8Array) && (t = l.from(t, t.offset, t.byteLength)), !l.isBuffer(e) || !l.isBuffer(t)) throw TypeError('The "buf1", "buf2" arguments must be one of type Buffer or Uint8Array');
                    if (e === t) return 0;
                    for (var n = e.length, r = t.length, a = 0, i = Math.min(n, r); a < i; ++a)
                        if (e[a] !== t[a]) {
                            n = e[a], r = t[a];
                            break
                        } return n < r ? -1 : +(r < n)
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
                        for (n = 0, t = 0; n < e.length; ++n) t += e[n].length;
                    var n, r = l.allocUnsafe(t),
                        a = 0;
                    for (n = 0; n < e.length; ++n) {
                        var i = e[n];
                        if (R(i, Uint8Array)) a + i.length > r.length ? l.from(i).copy(r, a) : Uint8Array.prototype.set.call(r, i, a);
                        else if (l.isBuffer(i)) i.copy(r, a);
                        else throw TypeError('"list" argument must be an Array of Buffers');
                        a += i.length
                    }
                    return r
                }, l.byteLength = m, l.prototype._isBuffer = !0, l.prototype.swap16 = function() {
                    var e = this.length;
                    if (e % 2 != 0) throw RangeError("Buffer size must be a multiple of 16-bits");
                    for (var t = 0; t < e; t += 2) b(this, t, t + 1);
                    return this
                }, l.prototype.swap32 = function() {
                    var e = this.length;
                    if (e % 4 != 0) throw RangeError("Buffer size must be a multiple of 32-bits");
                    for (var t = 0; t < e; t += 4) b(this, t, t + 3), b(this, t + 1, t + 2);
                    return this
                }, l.prototype.swap64 = function() {
                    var e = this.length;
                    if (e % 8 != 0) throw RangeError("Buffer size must be a multiple of 64-bits");
                    for (var t = 0; t < e; t += 8) b(this, t, t + 7), b(this, t + 1, t + 6), b(this, t + 2, t + 5), b(this, t + 3, t + 4);
                    return this
                }, l.prototype.toString = function() {
                    var e = this.length;
                    return 0 === e ? "" : 0 == arguments.length ? S(this, 0, e) : y.apply(this, arguments)
                }, l.prototype.toLocaleString = l.prototype.toString, l.prototype.equals = function(e) {
                    if (!l.isBuffer(e)) throw TypeError("Argument must be a Buffer");
                    return this === e || 0 === l.compare(this, e)
                }, l.prototype.inspect = function() {
                    var e = "",
                        n = t.INSPECT_MAX_BYTES;
                    return e = this.toString("hex", 0, n).replace(/(.{2})/g, "$1 ").trim(), this.length > n && (e += " ... "), "<Buffer " + e + ">"
                }, s && (l.prototype[s] = l.prototype.inspect), l.prototype.compare = function(e, t, n, r, i) {
                    if (R(e, Uint8Array) && (e = l.from(e, e.offset, e.byteLength)), !l.isBuffer(e)) throw TypeError('The "target" argument must be one of type Buffer or Uint8Array. Received type ' + (void 0 === e ? "undefined" : a._(e)));
                    if (void 0 === t && (t = 0), void 0 === n && (n = e ? e.length : 0), void 0 === r && (r = 0), void 0 === i && (i = this.length), t < 0 || n > e.length || r < 0 || i > this.length) throw RangeError("out of range index");
                    if (r >= i && t >= n) return 0;
                    if (r >= i) return -1;
                    if (t >= n) return 1;
                    if (t >>>= 0, n >>>= 0, r >>>= 0, i >>>= 0, this === e) return 0;
                    for (var o = i - r, s = n - t, u = Math.min(o, s), c = this.slice(r, i), d = e.slice(t, n), f = 0; f < u; ++f)
                        if (c[f] !== d[f]) {
                            o = c[f], s = d[f];
                            break
                        } return o < s ? -1 : +(s < o)
                }, l.prototype.includes = function(e, t, n) {
                    return -1 !== this.indexOf(e, t, n)
                }, l.prototype.indexOf = function(e, t, n) {
                    return g(this, e, t, n, !0)
                }, l.prototype.lastIndexOf = function(e, t, n) {
                    return g(this, e, t, n, !1)
                }, l.prototype.write = function(e, t, n, r) {
                    if (void 0 === t) r = "utf8", n = this.length, t = 0;
                    else if (void 0 === n && "string" == typeof t) r = t, n = this.length, t = 0;
                    else if (isFinite(t)) t >>>= 0, isFinite(n) ? (n >>>= 0, void 0 === r && (r = "utf8")) : (r = n, n = void 0);
                    else throw Error("Buffer.write(string, encoding, offset[, length]) is no longer supported");
                    var a, i, o, s, u, l, c, d, f = this.length - t;
                    if ((void 0 === n || n > f) && (n = f), e.length > 0 && (n < 0 || t < 0) || t > this.length) throw RangeError("Attempt to write outside buffer bounds");
                    r || (r = "utf8");
                    for (var h = !1;;) switch (r) {
                        case "hex":
                            return function(e, t, n, r) {
                                n = Number(n) || 0;
                                var a = e.length - n;
                                r ? (r = Number(r)) > a && (r = a) : r = a;
                                var i = t.length;
                                r > i / 2 && (r = i / 2);
                                for (var o = 0; o < r; ++o) {
                                    var s, u = parseInt(t.substr(2 * o, 2), 16);
                                    if ((s = u) != s) break;
                                    e[n + o] = u
                                }
                                return o
                            }(this, e, t, n);
                        case "utf8":
                        case "utf-8":
                            return a = t, i = n, N(A(e, this.length - a), this, a, i);
                        case "ascii":
                        case "latin1":
                        case "binary":
                            return o = t, s = n, N(function(e) {
                                for (var t = [], n = 0; n < e.length; ++n) t.push(255 & e.charCodeAt(n));
                                return t
                            }(e), this, o, s);
                        case "base64":
                            return u = t, l = n, N(U(e), this, u, l);
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return c = t, d = n, N(function(e, t) {
                                for (var n, r, a = [], i = 0; i < e.length && !((t -= 2) < 0); ++i) r = (n = e.charCodeAt(i)) >> 8, a.push(n % 256), a.push(r);
                                return a
                            }(e, this.length - c), this, c, d);
                        default:
                            if (h) throw TypeError("Unknown encoding: " + r);
                            r = ("" + r).toLowerCase(), h = !0
                    }
                }, l.prototype.toJSON = function() {
                    return {
                        type: "Buffer",
                        data: Array.prototype.slice.call(this._arr || this, 0)
                    }
                }, l.prototype.slice = function(e, t) {
                    var n = this.length;
                    e = ~~e, t = void 0 === t ? n : ~~t, e < 0 ? (e += n) < 0 && (e = 0) : e > n && (e = n), t < 0 ? (t += n) < 0 && (t = 0) : t > n && (t = n), t < e && (t = e);
                    var r = this.subarray(e, t);
                    return Object.setPrototypeOf(r, l.prototype), r
                }, l.prototype.readUintLE = l.prototype.readUIntLE = function(e, t, n) {
                    e >>>= 0, t >>>= 0, n || C(e, t, this.length);
                    for (var r = this[e], a = 1, i = 0; ++i < t && (a *= 256);) r += this[e + i] * a;
                    return r
                }, l.prototype.readUintBE = l.prototype.readUIntBE = function(e, t, n) {
                    e >>>= 0, t >>>= 0, n || C(e, t, this.length);
                    for (var r = this[e + --t], a = 1; t > 0 && (a *= 256);) r += this[e + --t] * a;
                    return r
                }, l.prototype.readUint8 = l.prototype.readUInt8 = function(e, t) {
                    return e >>>= 0, t || C(e, 1, this.length), this[e]
                }, l.prototype.readUint16LE = l.prototype.readUInt16LE = function(e, t) {
                    return e >>>= 0, t || C(e, 2, this.length), this[e] | this[e + 1] << 8
                }, l.prototype.readUint16BE = l.prototype.readUInt16BE = function(e, t) {
                    return e >>>= 0, t || C(e, 2, this.length), this[e] << 8 | this[e + 1]
                }, l.prototype.readUint32LE = l.prototype.readUInt32LE = function(e, t) {
                    return e >>>= 0, t || C(e, 4, this.length), (this[e] | this[e + 1] << 8 | this[e + 2] << 16) + 0x1000000 * this[e + 3]
                }, l.prototype.readUint32BE = l.prototype.readUInt32BE = function(e, t) {
                    return e >>>= 0, t || C(e, 4, this.length), 0x1000000 * this[e] + (this[e + 1] << 16 | this[e + 2] << 8 | this[e + 3])
                }, l.prototype.readIntLE = function(e, t, n) {
                    e >>>= 0, t >>>= 0, n || C(e, t, this.length);
                    for (var r = this[e], a = 1, i = 0; ++i < t && (a *= 256);) r += this[e + i] * a;
                    return r >= (a *= 128) && (r -= Math.pow(2, 8 * t)), r
                }, l.prototype.readIntBE = function(e, t, n) {
                    e >>>= 0, t >>>= 0, n || C(e, t, this.length);
                    for (var r = t, a = 1, i = this[e + --r]; r > 0 && (a *= 256);) i += this[e + --r] * a;
                    return i >= (a *= 128) && (i -= Math.pow(2, 8 * t)), i
                }, l.prototype.readInt8 = function(e, t) {
                    return (e >>>= 0, t || C(e, 1, this.length), 128 & this[e]) ? -((255 - this[e] + 1) * 1) : this[e]
                }, l.prototype.readInt16LE = function(e, t) {
                    e >>>= 0, t || C(e, 2, this.length);
                    var n = this[e] | this[e + 1] << 8;
                    return 32768 & n ? 0xffff0000 | n : n
                }, l.prototype.readInt16BE = function(e, t) {
                    e >>>= 0, t || C(e, 2, this.length);
                    var n = this[e + 1] | this[e] << 8;
                    return 32768 & n ? 0xffff0000 | n : n
                }, l.prototype.readInt32LE = function(e, t) {
                    return e >>>= 0, t || C(e, 4, this.length), this[e] | this[e + 1] << 8 | this[e + 2] << 16 | this[e + 3] << 24
                }, l.prototype.readInt32BE = function(e, t) {
                    return e >>>= 0, t || C(e, 4, this.length), this[e] << 24 | this[e + 1] << 16 | this[e + 2] << 8 | this[e + 3]
                }, l.prototype.readFloatLE = function(e, t) {
                    return e >>>= 0, t || C(e, 4, this.length), o.read(this, e, !0, 23, 4)
                }, l.prototype.readFloatBE = function(e, t) {
                    return e >>>= 0, t || C(e, 4, this.length), o.read(this, e, !1, 23, 4)
                }, l.prototype.readDoubleLE = function(e, t) {
                    return e >>>= 0, t || C(e, 8, this.length), o.read(this, e, !0, 52, 8)
                }, l.prototype.readDoubleBE = function(e, t) {
                    return e >>>= 0, t || C(e, 8, this.length), o.read(this, e, !1, 52, 8)
                }, l.prototype.writeUintLE = l.prototype.writeUIntLE = function(e, t, n, r) {
                    if (e *= 1, t >>>= 0, n >>>= 0, !r) {
                        var a = Math.pow(2, 8 * n) - 1;
                        w(this, e, t, n, a, 0)
                    }
                    var i = 1,
                        o = 0;
                    for (this[t] = 255 & e; ++o < n && (i *= 256);) this[t + o] = e / i & 255;
                    return t + n
                }, l.prototype.writeUintBE = l.prototype.writeUIntBE = function(e, t, n, r) {
                    if (e *= 1, t >>>= 0, n >>>= 0, !r) {
                        var a = Math.pow(2, 8 * n) - 1;
                        w(this, e, t, n, a, 0)
                    }
                    var i = n - 1,
                        o = 1;
                    for (this[t + i] = 255 & e; --i >= 0 && (o *= 256);) this[t + i] = e / o & 255;
                    return t + n
                }, l.prototype.writeUint8 = l.prototype.writeUInt8 = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || w(this, e, t, 1, 255, 0), this[t] = 255 & e, t + 1
                }, l.prototype.writeUint16LE = l.prototype.writeUInt16LE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || w(this, e, t, 2, 65535, 0), this[t] = 255 & e, this[t + 1] = e >>> 8, t + 2
                }, l.prototype.writeUint16BE = l.prototype.writeUInt16BE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || w(this, e, t, 2, 65535, 0), this[t] = e >>> 8, this[t + 1] = 255 & e, t + 2
                }, l.prototype.writeUint32LE = l.prototype.writeUInt32LE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || w(this, e, t, 4, 0xffffffff, 0), this[t + 3] = e >>> 24, this[t + 2] = e >>> 16, this[t + 1] = e >>> 8, this[t] = 255 & e, t + 4
                }, l.prototype.writeUint32BE = l.prototype.writeUInt32BE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || w(this, e, t, 4, 0xffffffff, 0), this[t] = e >>> 24, this[t + 1] = e >>> 16, this[t + 2] = e >>> 8, this[t + 3] = 255 & e, t + 4
                }, l.prototype.writeIntLE = function(e, t, n, r) {
                    if (e *= 1, t >>>= 0, !r) {
                        var a = Math.pow(2, 8 * n - 1);
                        w(this, e, t, n, a - 1, -a)
                    }
                    var i = 0,
                        o = 1,
                        s = 0;
                    for (this[t] = 255 & e; ++i < n && (o *= 256);) e < 0 && 0 === s && 0 !== this[t + i - 1] && (s = 1), this[t + i] = (e / o | 0) - s & 255;
                    return t + n
                }, l.prototype.writeIntBE = function(e, t, n, r) {
                    if (e *= 1, t >>>= 0, !r) {
                        var a = Math.pow(2, 8 * n - 1);
                        w(this, e, t, n, a - 1, -a)
                    }
                    var i = n - 1,
                        o = 1,
                        s = 0;
                    for (this[t + i] = 255 & e; --i >= 0 && (o *= 256);) e < 0 && 0 === s && 0 !== this[t + i + 1] && (s = 1), this[t + i] = (e / o | 0) - s & 255;
                    return t + n
                }, l.prototype.writeInt8 = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || w(this, e, t, 1, 127, -128), e < 0 && (e = 255 + e + 1), this[t] = 255 & e, t + 1
                }, l.prototype.writeInt16LE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || w(this, e, t, 2, 32767, -32768), this[t] = 255 & e, this[t + 1] = e >>> 8, t + 2
                }, l.prototype.writeInt16BE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || w(this, e, t, 2, 32767, -32768), this[t] = e >>> 8, this[t + 1] = 255 & e, t + 2
                }, l.prototype.writeInt32LE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || w(this, e, t, 4, 0x7fffffff, -0x80000000), this[t] = 255 & e, this[t + 1] = e >>> 8, this[t + 2] = e >>> 16, this[t + 3] = e >>> 24, t + 4
                }, l.prototype.writeInt32BE = function(e, t, n) {
                    return e *= 1, t >>>= 0, n || w(this, e, t, 4, 0x7fffffff, -0x80000000), e < 0 && (e = 0xffffffff + e + 1), this[t] = e >>> 24, this[t + 1] = e >>> 16, this[t + 2] = e >>> 8, this[t + 3] = 255 & e, t + 4
                }, l.prototype.writeFloatLE = function(e, t, n) {
                    return P(this, e, t, !0, n)
                }, l.prototype.writeFloatBE = function(e, t, n) {
                    return P(this, e, t, !1, n)
                }, l.prototype.writeDoubleLE = function(e, t, n) {
                    return _(this, e, t, !0, n)
                }, l.prototype.writeDoubleBE = function(e, t, n) {
                    return _(this, e, t, !1, n)
                }, l.prototype.copy = function(e, t, n, r) {
                    if (!l.isBuffer(e)) throw TypeError("argument should be a Buffer");
                    if (n || (n = 0), r || 0 === r || (r = this.length), t >= e.length && (t = e.length), t || (t = 0), r > 0 && r < n && (r = n), r === n || 0 === e.length || 0 === this.length) return 0;
                    if (t < 0) throw RangeError("targetStart out of bounds");
                    if (n < 0 || n >= this.length) throw RangeError("Index out of range");
                    if (r < 0) throw RangeError("sourceEnd out of bounds");
                    r > this.length && (r = this.length), e.length - t < r - n && (r = e.length - t + n);
                    var a = r - n;
                    return this === e && "function" == typeof Uint8Array.prototype.copyWithin ? this.copyWithin(t, n, r) : Uint8Array.prototype.set.call(e, this.subarray(n, r), t), a
                }, l.prototype.fill = function(e, t, n, r) {
                    if ("string" == typeof e) {
                        if ("string" == typeof t ? (r = t, t = 0, n = this.length) : "string" == typeof n && (r = n, n = this.length), void 0 !== r && "string" != typeof r) throw TypeError("encoding must be a string");
                        if ("string" == typeof r && !l.isEncoding(r)) throw TypeError("Unknown encoding: " + r);
                        if (1 === e.length) {
                            var a, i = e.charCodeAt(0);
                            ("utf8" === r && i < 128 || "latin1" === r) && (e = i)
                        }
                    } else "number" == typeof e ? e &= 255 : "boolean" == typeof e && (e = Number(e));
                    if (t < 0 || this.length < t || this.length < n) throw RangeError("Out of range index");
                    if (n <= t) return this;
                    if (t >>>= 0, n = void 0 === n ? this.length : n >>> 0, e || (e = 0), "number" == typeof e)
                        for (a = t; a < n; ++a) this[a] = e;
                    else {
                        var o = l.isBuffer(e) ? e : l.from(e, r),
                            s = o.length;
                        if (0 === s) throw TypeError('The value "' + e + '" is invalid for argument "value"');
                        for (a = 0; a < n - t; ++a) this[a + t] = o[a % s]
                    }
                    return this
                };
                var T = /[^+/0-9A-Za-z-_]/g;

                function A(e, t) {
                    t = t || 1 / 0;
                    for (var n, r = e.length, a = null, i = [], o = 0; o < r; ++o) {
                        if ((n = e.charCodeAt(o)) > 55295 && n < 57344) {
                            if (!a) {
                                if (n > 56319 || o + 1 === r) {
                                    (t -= 3) > -1 && i.push(239, 191, 189);
                                    continue
                                }
                                a = n;
                                continue
                            }
                            if (n < 56320) {
                                (t -= 3) > -1 && i.push(239, 191, 189), a = n;
                                continue
                            }
                            n = (a - 55296 << 10 | n - 56320) + 65536
                        } else a && (t -= 3) > -1 && i.push(239, 191, 189);
                        if (a = null, n < 128) {
                            if ((t -= 1) < 0) break;
                            i.push(n)
                        } else if (n < 2048) {
                            if ((t -= 2) < 0) break;
                            i.push(n >> 6 | 192, 63 & n | 128)
                        } else if (n < 65536) {
                            if ((t -= 3) < 0) break;
                            i.push(n >> 12 | 224, n >> 6 & 63 | 128, 63 & n | 128)
                        } else if (n < 1114112) {
                            if ((t -= 4) < 0) break;
                            i.push(n >> 18 | 240, n >> 12 & 63 | 128, n >> 6 & 63 | 128, 63 & n | 128)
                        } else throw Error("Invalid code point")
                    }
                    return i
                }

                function U(e) {
                    return i.toByteArray(function(e) {
                        if ((e = (e = e.split("=")[0]).trim().replace(T, "")).length < 2) return "";
                        for (; e.length % 4 != 0;) e += "=";
                        return e
                    }(e))
                }

                function N(e, t, n, r) {
                    for (var a = 0; a < r && !(a + n >= t.length) && !(a >= e.length); ++a) t[a + n] = e[a];
                    return a
                }

                function R(e, t) {
                    return r._(e, t) || null != e && null != e.constructor && null != e.constructor.name && e.constructor.name === t.name
                }
                var k = function() {
                    for (var e = "0123456789abcdef", t = Array(256), n = 0; n < 16; ++n)
                        for (var r = 16 * n, a = 0; a < 16; ++a) t[r + a] = e[n] + e[a];
                    return t
                }()
            },
            611: function(e, t, n) {
                var r = n(844);
                !
                /*!
                	Copyright (c) 2018 Jed Watson.
                	Licensed under the MIT License (MIT), see
                	http://jedwatson.github.io/classnames
                */
                function() {
                    "use strict";
                    var t = {}.hasOwnProperty;

                    function n() {
                        for (var e = "", i = 0; i < arguments.length; i++) {
                            var o = arguments[i];
                            o && (e = a(e, function(e) {
                                if ("string" == typeof e || "number" == typeof e) return e;
                                if ((void 0 === e ? "undefined" : r._(e)) !== "object") return "";
                                if (Array.isArray(e)) return n.apply(null, e);
                                if (e.toString !== Object.prototype.toString && !e.toString.toString().includes("[native code]")) return e.toString();
                                var i = "";
                                for (var o in e) t.call(e, o) && e[o] && (i = a(i, o));
                                return i
                            }(o)))
                        }
                        return e
                    }

                    function a(e, t) {
                        return t ? e ? e + " " + t : e + t : e
                    }
                    e.exports ? (n.default = n, e.exports = n) : "function" == typeof define && "object" === r._(define.amd) && define.amd ? define("classnames", [], function() {
                        return n
                    }) : window.classNames = n
                }()
            },
            619: function(e, t) {
                /*! ieee754. BSD-3-Clause License. Feross Aboukhadijeh <https://feross.org/opensource> */
                t.read = function(e, t, n, r, a) {
                    var i, o, s = 8 * a - r - 1,
                        u = (1 << s) - 1,
                        l = u >> 1,
                        c = -7,
                        d = n ? a - 1 : 0,
                        f = n ? -1 : 1,
                        h = e[t + d];
                    for (d += f, i = h & (1 << -c) - 1, h >>= -c, c += s; c > 0; i = 256 * i + e[t + d], d += f, c -= 8);
                    for (o = i & (1 << -c) - 1, i >>= -c, c += r; c > 0; o = 256 * o + e[t + d], d += f, c -= 8);
                    if (0 === i) i = 1 - l;
                    else {
                        if (i === u) return o ? NaN : 1 / 0 * (h ? -1 : 1);
                        o += Math.pow(2, r), i -= l
                    }
                    return (h ? -1 : 1) * o * Math.pow(2, i - r)
                }, t.write = function(e, t, n, r, a, i) {
                    var o, s, u, l = 8 * i - a - 1,
                        c = (1 << l) - 1,
                        d = c >> 1,
                        f = 5960464477539062e-23 * (23 === a),
                        h = r ? 0 : i - 1,
                        p = r ? 1 : -1,
                        v = +(t < 0 || 0 === t && 1 / t < 0);
                    for (isNaN(t = Math.abs(t)) || t === 1 / 0 ? (s = +!!isNaN(t), o = c) : (o = Math.floor(Math.log(t) / Math.LN2), t * (u = Math.pow(2, -o)) < 1 && (o--, u *= 2), o + d >= 1 ? t += f / u : t += f * Math.pow(2, 1 - d), t * u >= 2 && (o++, u /= 2), o + d >= c ? (s = 0, o = c) : o + d >= 1 ? (s = (t * u - 1) * Math.pow(2, a), o += d) : (s = t * Math.pow(2, d - 1) * Math.pow(2, a), o = 0)); a >= 8; e[n + h] = 255 & s, h += p, s /= 256, a -= 8);
                    for (o = o << a | s, l += a; l > 0; e[n + h] = 255 & o, h += p, o /= 256, l -= 8);
                    e[n + h - p] |= 128 * v
                }
            },
            848: function(e, t, n) {
                "use strict";
                var r = n(564).Buffer,
                    a = n(844),
                    i = void 0 !== r,
                    o = /"(?:_|\\u005[Ff])(?:_|\\u005[Ff])(?:p|\\u0070)(?:r|\\u0072)(?:o|\\u006[Ff])(?:t|\\u0074)(?:o|\\u006[Ff])(?:_|\\u005[Ff])(?:_|\\u005[Ff])"\s*:/,
                    s = /"(?:c|\\u0063)(?:o|\\u006[Ff])(?:n|\\u006[Ee])(?:s|\\u0073)(?:t|\\u0074)(?:r|\\u0072)(?:u|\\u0075)(?:c|\\u0063)(?:t|\\u0074)(?:o|\\u006[Ff])(?:r|\\u0072)"\s*:/;

                function u(e, t, n) {
                    null == n && null !== t && (void 0 === t ? "undefined" : a._(t)) === "object" && (n = t, t = void 0), i && r.isBuffer(e) && (e = e.toString()), e && 65279 === e.charCodeAt(0) && (e = e.slice(1));
                    var u = JSON.parse(e, t);
                    if (null === u || (void 0 === u ? "undefined" : a._(u)) !== "object") return u;
                    var c = n && n.protoAction || "error",
                        d = n && n.constructorAction || "error";
                    if ("ignore" === c && "ignore" === d) return u;
                    if ("ignore" !== c && "ignore" !== d) {
                        if (!1 === o.test(e) && !1 === s.test(e)) return u
                    } else if ("ignore" !== c && "ignore" === d) {
                        if (!1 === o.test(e)) return u
                    } else if (!1 === s.test(e)) return u;
                    return l(u, {
                        protoAction: c,
                        constructorAction: d,
                        safe: n && n.safe
                    })
                }

                function l(e) {
                    for (var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, n = t.protoAction, r = void 0 === n ? "error" : n, i = t.constructorAction, o = void 0 === i ? "error" : i, s = t.safe, u = [e]; u.length;) {
                        var l = u;
                        u = [];
                        var c = !0,
                            d = !1,
                            f = void 0;
                        try {
                            for (var h, p = l[Symbol.iterator](); !(c = (h = p.next()).done); c = !0) {
                                var v = h.value;
                                if ("ignore" !== r && Object.prototype.hasOwnProperty.call(v, "__proto__")) {
                                    if (!0 === s) return null;
                                    if ("error" === r) throw SyntaxError("Object contains forbidden prototype property");
                                    delete v.__proto__
                                }
                                if ("ignore" !== o && Object.prototype.hasOwnProperty.call(v, "constructor") && null !== v.constructor && "object" === a._(v.constructor) && Object.prototype.hasOwnProperty.call(v.constructor, "prototype")) {
                                    if (!0 === s) return null;
                                    if ("error" === o) throw SyntaxError("Object contains forbidden prototype property");
                                    delete v.constructor
                                }
                                for (var m in v) {
                                    var y = v[m];
                                    y && (void 0 === y ? "undefined" : a._(y)) === "object" && u.push(y)
                                }
                            }
                        } catch (e) {
                            d = !0, f = e
                        } finally {
                            try {
                                c || null == p.return || p.return()
                            } finally {
                                if (d) throw f
                            }
                        }
                    }
                    return e
                }

                function c(e, t, n) {
                    var r = Error.stackTraceLimit;
                    Error.stackTraceLimit = 0;
                    try {
                        return u(e, t, n)
                    } finally {
                        Error.stackTraceLimit = r
                    }
                }
                e.exports = c, e.exports.default = c, e.exports.parse = c, e.exports.safeParse = function(e, t) {
                    var n = Error.stackTraceLimit;
                    Error.stackTraceLimit = 0;
                    try {
                        return u(e, t, {
                            safe: !0
                        })
                    } catch (e) {
                        return
                    } finally {
                        Error.stackTraceLimit = n
                    }
                }, e.exports.scan = l
            },
            609: function(e) {
                "use strict";
                e.exports = window.React
            }
        },
        t = {};

    function n(r) {
        var a = t[r];
        if (void 0 !== a) return a.exports;
        var i = t[r] = {
            exports: {}
        };
        return e[r].call(i.exports, i, i.exports, n), i.exports
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
        }, n.o = function(e, t) {
            return Object.prototype.hasOwnProperty.call(e, t)
        }, n.r = function(e) {
            "u" > typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
                value: "Module"
            }), Object.defineProperty(e, "__esModule", {
                value: !0
            })
        }, n.rv = function() {
            return "1.7.12"
        }, n.ruid = "bundler=rspack@1.7.12",
        function() {
            "use strict";
            var e, t, r, a, i, o, s, u, l, c, d, f, h, p, v, m, y, b, g, E, S, C, w = window.ReactJSX,
                x = window.Roblox,
                P = n.n(x),
                _ = window.Roblox["core-scripts"].react;

            function T(e) {
                if (Array.isArray(e)) return e
            }

            function A() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function U(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function N(e, t) {
                if (e) {
                    if ("string" == typeof e) return U(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n) return Array.from(n);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return U(e, t)
                }
            }

            function R(e, t) {
                return T(e) || function(e, t) {
                    var n, r, a = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != a) {
                        var i = [],
                            o = !0,
                            s = !1;
                        try {
                            for (a = a.call(e); !(o = (n = a.next()).done) && (i.push(n.value), !t || i.length !== t); o = !0);
                        } catch (e) {
                            s = !0, r = e
                        } finally {
                            try {
                                o || null == a.return || a.return()
                            } finally {
                                if (s) throw r
                            }
                        }
                        return i
                    }
                }(e, t) || N(e, t) || A()
            }
            var k = n(609),
                O = n.n(k),
                I = window.ReactStyleGuide,
                M = window.ReactUtilities;

            function B(e, t, n, r, a, i, o) {
                try {
                    var s = e[i](o),
                        u = s.value
                } catch (e) {
                    n(e);
                    return
                }
                s.done ? t(u) : Promise.resolve(u).then(r, a)
            }

            function D(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise(function(r, a) {
                        var i = e.apply(t, n);

                        function o(e) {
                            B(i, r, a, o, s, "next", e)
                        }

                        function s(e) {
                            B(i, r, a, o, s, "throw", e)
                        }
                        o(void 0)
                    })
                }
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
                        var l = [s, u];
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
            var j = n(784);

            function F(e) {
                return (F = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                    return typeof e
                } : function(e) {
                    return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
                })(e)
            }

            function G(e, t) {
                if (t.length < e) throw TypeError(e + " argument" + (e > 1 ? "s" : "") + " required, but only " + t.length + " present")
            }

            function W(e) {
                G(1, arguments);
                var t = Object.prototype.toString.call(e);
                return (0, j._)(e, Date) || "object" === F(e) && "[object Date]" === t ? new Date(e.getTime()) : "number" == typeof e || "[object Number]" === t ? new Date(e) : (("string" == typeof e || "[object String]" === t) && "u" > typeof console && (console.warn("Starting with v2.0.0-beta.1 date-fns doesn't accept strings as date arguments. Please use `parseISO` to parse strings. See: https://github.com/date-fns/date-fns/blob/master/docs/upgradeGuide.md#string-arguments"), console.warn(Error().stack)), new Date(NaN))
            }

            function H(e, t) {
                G(2, arguments);
                var n = W(e),
                    r = W(t),
                    a = n.getTime() - r.getTime();
                return a < 0 ? -1 : a > 0 ? 1 : a
            }
            var V = window.EventTracker,
                Y = "basil",
                X = "https://js.stripe.com",
                q = "".concat(X, "/").concat(Y, "/stripe.js"),
                z = /^https:\/\/js\.stripe\.com\/v3\/?(\?.*)?$/,
                K = /^https:\/\/js\.stripe\.com\/(v3|[a-z]+)\/stripe\.js(\?.*)?$/,
                Q = function() {
                    for (var e = document.querySelectorAll('script[src^="'.concat(X, '"]')), t = 0; t < e.length; t++) {
                        var n, r = e[t];
                        if (n = r.src, z.test(n) || K.test(n)) return r
                    }
                    return null
                },
                J = function(e) {
                    var t = e && !e.advancedFraudSignals ? "?advancedFraudSignals=false" : "",
                        n = document.createElement("script");
                    n.src = "".concat(q).concat(t);
                    var r = document.head || document.body;
                    if (!r) throw Error("Expected document.body not to be null. Stripe.js requires a <body> element.");
                    return r.appendChild(n), n
                },
                Z = function(e, t) {
                    e && e._registerWrapper && e._registerWrapper({
                        name: "stripe-js",
                        version: "7.9.0",
                        startTime: t
                    })
                },
                $ = null,
                ee = null,
                et = null,
                en = function(e, t, n) {
                    if (null === e) return null;
                    var r, a = t[0].match(/^pk_test/),
                        i = 3 === (r = e.version) ? "v3" : r;
                    a && i !== Y && console.warn("Stripe.js@".concat(i, " was loaded on the page, but @stripe/stripe-js@").concat("7.9.0", " expected Stripe.js@").concat(Y, ". This may result in unexpected behavior. For more information, see https://docs.stripe.com/sdks/stripejs-versioning"));
                    var o = e.apply(void 0, t);
                    return Z(o, n), o
                },
                er = !1,
                ea = function() {
                    return b || (b = (null !== $ ? $ : ($ = new Promise(function(e, t) {
                        if ("u" < typeof window || "u" < typeof document) return void e(null);
                        if (window.Stripe, window.Stripe) return void e(window.Stripe);
                        try {
                            var n, r = Q();
                            r ? r && null !== et && null !== ee && (r.removeEventListener("load", et), r.removeEventListener("error", ee), null == (n = r.parentNode) || n.removeChild(r), r = J(null)) : r = J(null), et = function() {
                                window.Stripe ? e(window.Stripe) : t(Error("Stripe.js not available"))
                            }, ee = function(e) {
                                t(Error("Failed to load Stripe.js", {
                                    cause: e
                                }))
                            }, r.addEventListener("load", et), r.addEventListener("error", ee)
                        } catch (e) {
                            t(e);
                            return
                        }
                    })).catch(function(e) {
                        return $ = null, Promise.reject(e)
                    })).catch(function(e) {
                        return b = null, Promise.reject(e)
                    }))
                };
            Promise.resolve().then(function() {
                return ea()
            }).catch(function(e) {
                er || console.warn(e)
            });
            var ei = function() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    er = !0;
                    var r = Date.now();
                    return ea().then(function(e) {
                        return en(e, t, r)
                    })
                },
                eo = n(179);

            function es(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function eu(e, t) {
                var n = "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                if (!n) {
                    if (Array.isArray(e) || (n = function(e) {
                            if (e) {
                                if ("string" == typeof e) return es(e, void 0);
                                var t = ({}).toString.call(e).slice(8, -1);
                                return "Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t ? Array.from(e) : "Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t) ? es(e, void 0) : void 0
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
                var i, o = !0,
                    s = !1;
                return {
                    s: function() {
                        n = n.call(e)
                    },
                    n: function() {
                        var e = n.next();
                        return o = e.done, e
                    },
                    e: function(e) {
                        s = !0, i = e
                    },
                    f: function() {
                        try {
                            o || null == n.return || n.return()
                        } finally {
                            if (s) throw i
                        }
                    }
                }
            }
            var el = {
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

            function ec(e) {
                return function() {
                    var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        n = t.width ? String(t.width) : e.defaultWidth;
                    return e.formats[n] || e.formats[e.defaultWidth]
                }
            }
            var ed = {
                    date: ec({
                        formats: {
                            full: "EEEE, MMMM do, y",
                            long: "MMMM do, y",
                            medium: "MMM d, y",
                            short: "MM/dd/yyyy"
                        },
                        defaultWidth: "full"
                    }),
                    time: ec({
                        formats: {
                            full: "h:mm:ss a zzzz",
                            long: "h:mm:ss a z",
                            medium: "h:mm:ss a",
                            short: "h:mm a"
                        },
                        defaultWidth: "full"
                    }),
                    dateTime: ec({
                        formats: {
                            full: "{{date}} 'at' {{time}}",
                            long: "{{date}} 'at' {{time}}",
                            medium: "{{date}}, {{time}}",
                            short: "{{date}}, {{time}}"
                        },
                        defaultWidth: "full"
                    })
                },
                ef = {
                    lastWeek: "'last' eeee 'at' p",
                    yesterday: "'yesterday at' p",
                    today: "'today at' p",
                    tomorrow: "'tomorrow at' p",
                    nextWeek: "eeee 'at' p",
                    other: "P"
                };

            function eh(e) {
                return function(t, n) {
                    var r;
                    if ("formatting" === (null != n && n.context ? String(n.context) : "standalone") && e.formattingValues) {
                        var a = e.defaultFormattingWidth || e.defaultWidth,
                            i = null != n && n.width ? String(n.width) : a;
                        r = e.formattingValues[i] || e.formattingValues[a]
                    } else {
                        var o = e.defaultWidth,
                            s = null != n && n.width ? String(n.width) : e.defaultWidth;
                        r = e.values[s] || e.values[o]
                    }
                    return r[e.argumentCallback ? e.argumentCallback(t) : t]
                }
            }

            function ep(e) {
                return function(t) {
                    var n, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        a = r.width,
                        i = a && e.matchPatterns[a] || e.matchPatterns[e.defaultMatchWidth],
                        o = t.match(i);
                    if (!o) return null;
                    var s = o[0],
                        u = a && e.parsePatterns[a] || e.parsePatterns[e.defaultParseWidth],
                        l = Array.isArray(u) ? function(e, t) {
                            for (var n = 0; n < e.length; n++)
                                if (t(e[n])) return n
                        }(u, function(e) {
                            return e.test(s)
                        }) : function(e, t) {
                            for (var n in e)
                                if (e.hasOwnProperty(n) && t(e[n])) return n
                        }(u, function(e) {
                            return e.test(s)
                        });
                    return n = e.valueCallback ? e.valueCallback(l) : l, {
                        value: n = r.valueCallback ? r.valueCallback(n) : n,
                        rest: t.slice(s.length)
                    }
                }
            }
            var ev = {
                code: "en-US",
                formatDistance: function(e, t, n) {
                    var r, a = el[e];
                    if (r = "string" == typeof a ? a : 1 === t ? a.one : a.other.replace("{{count}}", t.toString()), null != n && n.addSuffix)
                        if (n.comparison && n.comparison > 0) return "in " + r;
                        else return r + " ago";
                    return r
                },
                formatLong: ed,
                formatRelative: function(e, t, n, r) {
                    return ef[e]
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
                    era: eh({
                        values: {
                            narrow: ["B", "A"],
                            abbreviated: ["BC", "AD"],
                            wide: ["Before Christ", "Anno Domini"]
                        },
                        defaultWidth: "wide"
                    }),
                    quarter: eh({
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
                    month: eh({
                        values: {
                            narrow: ["J", "F", "M", "A", "M", "J", "J", "A", "S", "O", "N", "D"],
                            abbreviated: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                            wide: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
                        },
                        defaultWidth: "wide"
                    }),
                    day: eh({
                        values: {
                            narrow: ["S", "M", "T", "W", "T", "F", "S"],
                            short: ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"],
                            abbreviated: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
                            wide: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
                        },
                        defaultWidth: "wide"
                    }),
                    dayPeriod: eh({
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
                            i = t.match(e.parsePattern);
                        if (!i) return null;
                        var o = e.valueCallback ? e.valueCallback(i[0]) : i[0];
                        return {
                            value: o = n.valueCallback ? n.valueCallback(o) : o,
                            rest: t.slice(a.length)
                        }
                    }),
                    era: ep({
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
                    quarter: ep({
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
                    month: ep({
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
                    day: ep({
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
                    dayPeriod: ep({
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

            function em(e) {
                if (null === e || !0 === e || !1 === e) return NaN;
                var t = Number(e);
                return isNaN(t) ? t : t < 0 ? Math.ceil(t) : Math.floor(t)
            }
            var ey = function(e, t) {
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
                eb = function(e, t) {
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
                eg = {
                    p: eb,
                    P: function(e, t) {
                        var n, r = e.match(/(P+)(p+)?/) || [],
                            a = r[1],
                            i = r[2];
                        if (!i) return ey(e, t);
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
                        return n.replace("{{date}}", ey(a, t)).replace("{{time}}", eb(i, t))
                    }
                },
                eE = ["D", "DD"],
                eS = ["YY", "YYYY"];

            function eC(e, t, n) {
                if ("YYYY" === e) throw RangeError("Use `yyyy` instead of `YYYY` (in `".concat(t, "`) for formatting years to the input `").concat(n, "`; see: https://github.com/date-fns/date-fns/blob/master/docs/unicodeTokens.md"));
                if ("YY" === e) throw RangeError("Use `yy` instead of `YY` (in `".concat(t, "`) for formatting years to the input `").concat(n, "`; see: https://github.com/date-fns/date-fns/blob/master/docs/unicodeTokens.md"));
                if ("D" === e) throw RangeError("Use `d` instead of `D` (in `".concat(t, "`) for formatting days of the month to the input `").concat(n, "`; see: https://github.com/date-fns/date-fns/blob/master/docs/unicodeTokens.md"));
                if ("DD" === e) throw RangeError("Use `dd` instead of `DD` (in `".concat(t, "`) for formatting days of the month to the input `").concat(n, "`; see: https://github.com/date-fns/date-fns/blob/master/docs/unicodeTokens.md"))
            }

            function ew(e) {
                if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                return e
            }

            function ex(e, t) {
                return (ex = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function eP(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        writable: !0,
                        configurable: !0
                    }
                }), Object.defineProperty(e, "prototype", {
                    writable: !1
                }), t && ex(e, t)
            }

            function e_(e) {
                return (e_ = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function eT() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (eT = function() {
                    return !!e
                })()
            }

            function eA(e) {
                var t = eT();
                return function() {
                    var n, r = e_(e);
                    n = t ? Reflect.construct(r, arguments, e_(this).constructor) : r.apply(this, arguments);
                    if (n && ("object" == F(n) || "function" == typeof n)) return n;
                    if (void 0 !== n) throw TypeError("Derived constructors may only return object or undefined");
                    return ew(this)
                }
            }

            function eU(e, t) {
                if (!(0, j._)(e, t)) throw TypeError("Cannot call a class as a function")
            }

            function eN(e) {
                var t = function(e, t) {
                    if ("object" != F(e) || !e) return e;
                    var n = e[Symbol.toPrimitive];
                    if (void 0 !== n) {
                        var r = n.call(e, t || "default");
                        if ("object" != F(r)) return r;
                        throw TypeError("@@toPrimitive must return a primitive value.")
                    }
                    return ("string" === t ? String : Number)(e)
                }(e, "string");
                return "symbol" == F(t) ? t : t + ""
            }

            function eR(e, t) {
                for (var n = 0; n < t.length; n++) {
                    var r = t[n];
                    r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, eN(r.key), r)
                }
            }

            function ek(e, t, n) {
                return t && eR(e.prototype, t), n && eR(e, n), Object.defineProperty(e, "prototype", {
                    writable: !1
                }), e
            }

            function eO(e, t, n) {
                return (t = eN(t)) in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }
            var eI = function() {
                    function e() {
                        eU(this, e), eO(this, "priority", void 0), eO(this, "subPriority", 0)
                    }
                    return ek(e, [{
                        key: "validate",
                        value: function(e, t) {
                            return !0
                        }
                    }]), e
                }(),
                eM = function(e) {
                    eP(n, e);
                    var t = eA(n);

                    function n(e, r, a, i, o) {
                        var s;
                        return eU(this, n), (s = t.call(this)).value = e, s.validateValue = r, s.setValue = a, s.priority = i, o && (s.subPriority = o), s
                    }
                    return ek(n, [{
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
                }(eI),
                eB = function(e) {
                    eP(n, e);
                    var t = eA(n);

                    function n() {
                        var e;
                        eU(this, n);
                        for (var r = arguments.length, a = Array(r), i = 0; i < r; i++) a[i] = arguments[i];
                        return eO(ew(e = t.call.apply(t, [this].concat(a))), "priority", 10), eO(ew(e), "subPriority", -1), e
                    }
                    return ek(n, [{
                        key: "set",
                        value: function(e, t) {
                            if (t.timestampIsSet) return e;
                            var n = new Date(0);
                            return n.setFullYear(e.getUTCFullYear(), e.getUTCMonth(), e.getUTCDate()), n.setHours(e.getUTCHours(), e.getUTCMinutes(), e.getUTCSeconds(), e.getUTCMilliseconds()), n
                        }
                    }]), n
                }(eI),
                eD = function() {
                    function e() {
                        eU(this, e), eO(this, "incompatibleTokens", void 0), eO(this, "priority", void 0), eO(this, "subPriority", void 0)
                    }
                    return ek(e, [{
                        key: "run",
                        value: function(e, t, n, r) {
                            var a = this.parse(e, t, n, r);
                            return a ? {
                                setter: new eM(a.value, this.validate, this.set, this.priority, this.subPriority),
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
                eL = function(e) {
                    eP(n, e);
                    var t = eA(n);

                    function n() {
                        var e;
                        eU(this, n);
                        for (var r = arguments.length, a = Array(r), i = 0; i < r; i++) a[i] = arguments[i];
                        return eO(ew(e = t.call.apply(t, [this].concat(a))), "priority", 140), eO(ew(e), "incompatibleTokens", ["R", "u", "t", "T"]), e
                    }
                    return ek(n, [{
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
                }(eD),
                ej = /^(1[0-2]|0?\d)/,
                eF = /^(3[0-1]|[0-2]?\d)/,
                eG = /^(36[0-6]|3[0-5]\d|[0-2]?\d?\d)/,
                eW = /^(5[0-3]|[0-4]?\d)/,
                eH = /^(2[0-3]|[0-1]?\d)/,
                eV = /^(2[0-4]|[0-1]?\d)/,
                eY = /^(1[0-1]|0?\d)/,
                eX = /^(1[0-2]|0?\d)/,
                eq = /^[0-5]?\d/,
                ez = /^[0-5]?\d/,
                eK = /^\d/,
                eQ = /^\d{1,2}/,
                eJ = /^\d{1,3}/,
                eZ = /^\d{1,4}/,
                e$ = /^-?\d+/,
                e0 = /^-?\d/,
                e1 = /^-?\d{1,2}/,
                e2 = /^-?\d{1,3}/,
                e3 = /^-?\d{1,4}/,
                e4 = /^([+-])(\d{2})(\d{2})?|Z/,
                e5 = /^([+-])(\d{2})(\d{2})|Z/,
                e6 = /^([+-])(\d{2})(\d{2})((\d{2}))?|Z/,
                e8 = /^([+-])(\d{2}):(\d{2})|Z/,
                e7 = /^([+-])(\d{2}):(\d{2})(:(\d{2}))?|Z/;

            function e9(e, t) {
                return e ? {
                    value: t(e.value),
                    rest: e.rest
                } : e
            }

            function te(e, t) {
                var n = t.match(e);
                return n ? {
                    value: parseInt(n[0], 10),
                    rest: t.slice(n[0].length)
                } : null
            }

            function tt(e, t) {
                var n = t.match(e);
                return n ? "Z" === n[0] ? {
                    value: 0,
                    rest: t.slice(1)
                } : {
                    value: ("+" === n[1] ? 1 : -1) * ((n[2] ? parseInt(n[2], 10) : 0) * 36e5 + (n[3] ? parseInt(n[3], 10) : 0) * 6e4 + (n[5] ? parseInt(n[5], 10) : 0) * 1e3),
                    rest: t.slice(n[0].length)
                } : null
            }

            function tn(e, t) {
                switch (e) {
                    case 1:
                        return te(eK, t);
                    case 2:
                        return te(eQ, t);
                    case 3:
                        return te(eJ, t);
                    case 4:
                        return te(eZ, t);
                    default:
                        return te(RegExp("^\\d{1," + e + "}"), t)
                }
            }

            function tr(e, t) {
                switch (e) {
                    case 1:
                        return te(e0, t);
                    case 2:
                        return te(e1, t);
                    case 3:
                        return te(e2, t);
                    case 4:
                        return te(e3, t);
                    default:
                        return te(RegExp("^-?\\d{1," + e + "}"), t)
                }
            }

            function ta(e) {
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

            function ti(e, t) {
                var n, r = t > 0,
                    a = r ? t : 1 - t;
                if (a <= 50) n = e || 100;
                else {
                    var i = a + 50;
                    n = e + 100 * Math.floor(i / 100) - 100 * (e >= i % 100)
                }
                return r ? n : 1 - n
            }

            function to(e) {
                return e % 400 == 0 || e % 4 == 0 && e % 100 != 0
            }
            var ts = function(e) {
                    eP(n, e);
                    var t = eA(n);

                    function n() {
                        var e;
                        eU(this, n);
                        for (var r = arguments.length, a = Array(r), i = 0; i < r; i++) a[i] = arguments[i];
                        return eO(ew(e = t.call.apply(t, [this].concat(a))), "priority", 130), eO(ew(e), "incompatibleTokens", ["Y", "R", "u", "w", "I", "i", "e", "c", "t", "T"]), e
                    }
                    return ek(n, [{
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
                                    return e9(tn(4, e), r);
                                case "yo":
                                    return e9(n.ordinalNumber(e, {
                                        unit: "year"
                                    }), r);
                                default:
                                    return e9(tn(t.length, e), r)
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
                                var a = ti(n.year, r);
                                return e.setUTCFullYear(a, 0, 1), e.setUTCHours(0, 0, 0, 0), e
                            }
                            var i = "era" in t && 1 !== t.era ? 1 - n.year : n.year;
                            return e.setUTCFullYear(i, 0, 1), e.setUTCHours(0, 0, 0, 0), e
                        }
                    }]), n
                }(eD),
                tu = {};

            function tl(e, t) {
                G(1, arguments);
                var n, r, a, i, o, s, u, l, c = em(null != (n = null != (r = null != (a = null != (i = null == t ? void 0 : t.weekStartsOn) ? i : null == t || null == (o = t.locale) || null == (s = o.options) ? void 0 : s.weekStartsOn) ? a : tu.weekStartsOn) ? r : null == (u = tu.locale) || null == (l = u.options) ? void 0 : l.weekStartsOn) ? n : 0);
                if (!(c >= 0 && c <= 6)) throw RangeError("weekStartsOn must be between 0 and 6 inclusively");
                var d = W(e),
                    f = d.getUTCDay();
                return d.setUTCDate(d.getUTCDate() - (7 * (f < c) + f - c)), d.setUTCHours(0, 0, 0, 0), d
            }

            function tc(e, t) {
                G(1, arguments);
                var n, r, a, i, o, s, u, l, c = W(e),
                    d = c.getUTCFullYear(),
                    f = em(null != (n = null != (r = null != (a = null != (i = null == t ? void 0 : t.firstWeekContainsDate) ? i : null == t || null == (o = t.locale) || null == (s = o.options) ? void 0 : s.firstWeekContainsDate) ? a : tu.firstWeekContainsDate) ? r : null == (u = tu.locale) || null == (l = u.options) ? void 0 : l.firstWeekContainsDate) ? n : 1);
                if (!(f >= 1 && f <= 7)) throw RangeError("firstWeekContainsDate must be between 1 and 7 inclusively");
                var h = new Date(0);
                h.setUTCFullYear(d + 1, 0, f), h.setUTCHours(0, 0, 0, 0);
                var p = tl(h, t),
                    v = new Date(0);
                v.setUTCFullYear(d, 0, f), v.setUTCHours(0, 0, 0, 0);
                var m = tl(v, t);
                return c.getTime() >= p.getTime() ? d + 1 : c.getTime() >= m.getTime() ? d : d - 1
            }
            var td = function(e) {
                eP(n, e);
                var t = eA(n);

                function n() {
                    var e;
                    eU(this, n);
                    for (var r = arguments.length, a = Array(r), i = 0; i < r; i++) a[i] = arguments[i];
                    return eO(ew(e = t.call.apply(t, [this].concat(a))), "priority", 130), eO(ew(e), "incompatibleTokens", ["y", "R", "u", "Q", "q", "M", "L", "I", "d", "D", "i", "t", "T"]), e
                }
                return ek(n, [{
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
                                return e9(tn(4, e), r);
                            case "Yo":
                                return e9(n.ordinalNumber(e, {
                                    unit: "year"
                                }), r);
                            default:
                                return e9(tn(t.length, e), r)
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
                        var a = tc(e, r);
                        if (n.isTwoDigitYear) {
                            var i = ti(n.year, a);
                            return e.setUTCFullYear(i, 0, r.firstWeekContainsDate), e.setUTCHours(0, 0, 0, 0), tl(e, r)
                        }
                        var o = "era" in t && 1 !== t.era ? 1 - n.year : n.year;
                        return e.setUTCFullYear(o, 0, r.firstWeekContainsDate), e.setUTCHours(0, 0, 0, 0), tl(e, r)
                    }
                }]), n
            }(eD);

            function tf(e) {
                G(1, arguments);
                var t = W(e),
                    n = t.getUTCDay();
                return t.setUTCDate(t.getUTCDate() - (7 * (n < 1) + n - 1)), t.setUTCHours(0, 0, 0, 0), t
            }
            var th = function(e) {
                    eP(n, e);
                    var t = eA(n);

                    function n() {
                        var e;
                        eU(this, n);
                        for (var r = arguments.length, a = Array(r), i = 0; i < r; i++) a[i] = arguments[i];
                        return eO(ew(e = t.call.apply(t, [this].concat(a))), "priority", 130), eO(ew(e), "incompatibleTokens", ["G", "y", "Y", "u", "Q", "q", "M", "L", "w", "d", "D", "e", "c", "t", "T"]), e
                    }
                    return ek(n, [{
                        key: "parse",
                        value: function(e, t) {
                            return "R" === t ? tr(4, e) : tr(t.length, e)
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            var r = new Date(0);
                            return r.setUTCFullYear(n, 0, 4), r.setUTCHours(0, 0, 0, 0), tf(r)
                        }
                    }]), n
                }(eD),
                tp = function(e) {
                    eP(n, e);
                    var t = eA(n);

                    function n() {
                        var e;
                        eU(this, n);
                        for (var r = arguments.length, a = Array(r), i = 0; i < r; i++) a[i] = arguments[i];
                        return eO(ew(e = t.call.apply(t, [this].concat(a))), "priority", 130), eO(ew(e), "incompatibleTokens", ["G", "y", "Y", "R", "w", "I", "i", "e", "c", "t", "T"]), e
                    }
                    return ek(n, [{
                        key: "parse",
                        value: function(e, t) {
                            return "u" === t ? tr(4, e) : tr(t.length, e)
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            return e.setUTCFullYear(n, 0, 1), e.setUTCHours(0, 0, 0, 0), e
                        }
                    }]), n
                }(eD),
                tv = function(e) {
                    eP(n, e);
                    var t = eA(n);

                    function n() {
                        var e;
                        eU(this, n);
                        for (var r = arguments.length, a = Array(r), i = 0; i < r; i++) a[i] = arguments[i];
                        return eO(ew(e = t.call.apply(t, [this].concat(a))), "priority", 120), eO(ew(e), "incompatibleTokens", ["Y", "R", "q", "M", "L", "w", "I", "d", "D", "i", "e", "c", "t", "T"]), e
                    }
                    return ek(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            switch (t) {
                                case "Q":
                                case "QQ":
                                    return tn(t.length, e);
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
                }(eD),
                tm = function(e) {
                    eP(n, e);
                    var t = eA(n);

                    function n() {
                        var e;
                        eU(this, n);
                        for (var r = arguments.length, a = Array(r), i = 0; i < r; i++) a[i] = arguments[i];
                        return eO(ew(e = t.call.apply(t, [this].concat(a))), "priority", 120), eO(ew(e), "incompatibleTokens", ["Y", "R", "Q", "M", "L", "w", "I", "d", "D", "i", "e", "c", "t", "T"]), e
                    }
                    return ek(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            switch (t) {
                                case "q":
                                case "qq":
                                    return tn(t.length, e);
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
                }(eD),
                ty = function(e) {
                    eP(n, e);
                    var t = eA(n);

                    function n() {
                        var e;
                        eU(this, n);
                        for (var r = arguments.length, a = Array(r), i = 0; i < r; i++) a[i] = arguments[i];
                        return eO(ew(e = t.call.apply(t, [this].concat(a))), "incompatibleTokens", ["Y", "R", "q", "Q", "L", "w", "I", "D", "i", "e", "c", "t", "T"]), eO(ew(e), "priority", 110), e
                    }
                    return ek(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            var r = function(e) {
                                return e - 1
                            };
                            switch (t) {
                                case "M":
                                    return e9(te(ej, e), r);
                                case "MM":
                                    return e9(tn(2, e), r);
                                case "Mo":
                                    return e9(n.ordinalNumber(e, {
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
                }(eD),
                tb = function(e) {
                    eP(n, e);
                    var t = eA(n);

                    function n() {
                        var e;
                        eU(this, n);
                        for (var r = arguments.length, a = Array(r), i = 0; i < r; i++) a[i] = arguments[i];
                        return eO(ew(e = t.call.apply(t, [this].concat(a))), "priority", 110), eO(ew(e), "incompatibleTokens", ["Y", "R", "q", "Q", "M", "w", "I", "D", "i", "e", "c", "t", "T"]), e
                    }
                    return ek(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            var r = function(e) {
                                return e - 1
                            };
                            switch (t) {
                                case "L":
                                    return e9(te(ej, e), r);
                                case "LL":
                                    return e9(tn(2, e), r);
                                case "Lo":
                                    return e9(n.ordinalNumber(e, {
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
                }(eD),
                tg = function(e) {
                    eP(n, e);
                    var t = eA(n);

                    function n() {
                        var e;
                        eU(this, n);
                        for (var r = arguments.length, a = Array(r), i = 0; i < r; i++) a[i] = arguments[i];
                        return eO(ew(e = t.call.apply(t, [this].concat(a))), "priority", 100), eO(ew(e), "incompatibleTokens", ["y", "R", "u", "q", "Q", "M", "L", "I", "d", "D", "i", "t", "T"]), e
                    }
                    return ek(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            switch (t) {
                                case "w":
                                    return te(eW, e);
                                case "wo":
                                    return n.ordinalNumber(e, {
                                        unit: "week"
                                    });
                                default:
                                    return tn(t.length, e)
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
                            return tl(function(e, t, n) {
                                G(2, arguments);
                                var r = W(e),
                                    a = em(t),
                                    i = function(e, t) {
                                        G(1, arguments);
                                        var n = W(e);
                                        return Math.round((tl(n, t).getTime() - (function(e, t) {
                                            G(1, arguments);
                                            var n, r, a, i, o, s, u, l, c = em(null != (n = null != (r = null != (a = null != (i = null == t ? void 0 : t.firstWeekContainsDate) ? i : null == t || null == (o = t.locale) || null == (s = o.options) ? void 0 : s.firstWeekContainsDate) ? a : tu.firstWeekContainsDate) ? r : null == (u = tu.locale) || null == (l = u.options) ? void 0 : l.firstWeekContainsDate) ? n : 1),
                                                d = tc(e, t),
                                                f = new Date(0);
                                            return f.setUTCFullYear(d, 0, c), f.setUTCHours(0, 0, 0, 0), tl(f, t)
                                        })(n, t).getTime()) / 6048e5) + 1
                                    }(r, n) - a;
                                return r.setUTCDate(r.getUTCDate() - 7 * i), r
                            }(e, n, r), r)
                        }
                    }]), n
                }(eD),
                tE = function(e) {
                    eP(n, e);
                    var t = eA(n);

                    function n() {
                        var e;
                        eU(this, n);
                        for (var r = arguments.length, a = Array(r), i = 0; i < r; i++) a[i] = arguments[i];
                        return eO(ew(e = t.call.apply(t, [this].concat(a))), "priority", 100), eO(ew(e), "incompatibleTokens", ["y", "Y", "u", "q", "Q", "M", "L", "w", "d", "D", "e", "c", "t", "T"]), e
                    }
                    return ek(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            switch (t) {
                                case "I":
                                    return te(eW, e);
                                case "Io":
                                    return n.ordinalNumber(e, {
                                        unit: "week"
                                    });
                                default:
                                    return tn(t.length, e)
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
                            return tf(function(e, t) {
                                G(2, arguments);
                                var n = W(e),
                                    r = em(t),
                                    a = function(e) {
                                        G(1, arguments);
                                        var t = W(e);
                                        return Math.round((tf(t).getTime() - (function(e) {
                                            G(1, arguments);
                                            var t = function(e) {
                                                    G(1, arguments);
                                                    var t = W(e),
                                                        n = t.getUTCFullYear(),
                                                        r = new Date(0);
                                                    r.setUTCFullYear(n + 1, 0, 4), r.setUTCHours(0, 0, 0, 0);
                                                    var a = tf(r),
                                                        i = new Date(0);
                                                    i.setUTCFullYear(n, 0, 4), i.setUTCHours(0, 0, 0, 0);
                                                    var o = tf(i);
                                                    return t.getTime() >= a.getTime() ? n + 1 : t.getTime() >= o.getTime() ? n : n - 1
                                                }(e),
                                                n = new Date(0);
                                            return n.setUTCFullYear(t, 0, 4), n.setUTCHours(0, 0, 0, 0), tf(n)
                                        })(t).getTime()) / 6048e5) + 1
                                    }(n) - r;
                                return n.setUTCDate(n.getUTCDate() - 7 * a), n
                            }(e, n))
                        }
                    }]), n
                }(eD),
                tS = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],
                tC = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],
                tw = function(e) {
                    eP(n, e);
                    var t = eA(n);

                    function n() {
                        var e;
                        eU(this, n);
                        for (var r = arguments.length, a = Array(r), i = 0; i < r; i++) a[i] = arguments[i];
                        return eO(ew(e = t.call.apply(t, [this].concat(a))), "priority", 90), eO(ew(e), "subPriority", 1), eO(ew(e), "incompatibleTokens", ["Y", "R", "q", "Q", "w", "I", "D", "i", "e", "c", "t", "T"]), e
                    }
                    return ek(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            switch (t) {
                                case "d":
                                    return te(eF, e);
                                case "do":
                                    return n.ordinalNumber(e, {
                                        unit: "date"
                                    });
                                default:
                                    return tn(t.length, e)
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            var n = to(e.getUTCFullYear()),
                                r = e.getUTCMonth();
                            return n ? t >= 1 && t <= tC[r] : t >= 1 && t <= tS[r]
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            return e.setUTCDate(n), e.setUTCHours(0, 0, 0, 0), e
                        }
                    }]), n
                }(eD),
                tx = function(e) {
                    eP(n, e);
                    var t = eA(n);

                    function n() {
                        var e;
                        eU(this, n);
                        for (var r = arguments.length, a = Array(r), i = 0; i < r; i++) a[i] = arguments[i];
                        return eO(ew(e = t.call.apply(t, [this].concat(a))), "priority", 90), eO(ew(e), "subpriority", 1), eO(ew(e), "incompatibleTokens", ["Y", "R", "q", "Q", "M", "L", "w", "I", "d", "E", "i", "e", "c", "t", "T"]), e
                    }
                    return ek(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            switch (t) {
                                case "D":
                                case "DD":
                                    return te(eG, e);
                                case "Do":
                                    return n.ordinalNumber(e, {
                                        unit: "date"
                                    });
                                default:
                                    return tn(t.length, e)
                            }
                        }
                    }, {
                        key: "validate",
                        value: function(e, t) {
                            return to(e.getUTCFullYear()) ? t >= 1 && t <= 366 : t >= 1 && t <= 365
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            return e.setUTCMonth(0, n), e.setUTCHours(0, 0, 0, 0), e
                        }
                    }]), n
                }(eD);

            function tP(e, t, n) {
                G(2, arguments);
                var r, a, i, o, s, u, l, c, d = em(null != (r = null != (a = null != (i = null != (o = null == n ? void 0 : n.weekStartsOn) ? o : null == n || null == (s = n.locale) || null == (u = s.options) ? void 0 : u.weekStartsOn) ? i : tu.weekStartsOn) ? a : null == (l = tu.locale) || null == (c = l.options) ? void 0 : c.weekStartsOn) ? r : 0);
                if (!(d >= 0 && d <= 6)) throw RangeError("weekStartsOn must be between 0 and 6 inclusively");
                var f = W(e),
                    h = em(t),
                    p = 7 * ((h % 7 + 7) % 7 < d) + h - f.getUTCDay();
                return f.setUTCDate(f.getUTCDate() + p), f
            }
            var t_ = function(e) {
                    eP(n, e);
                    var t = eA(n);

                    function n() {
                        var e;
                        eU(this, n);
                        for (var r = arguments.length, a = Array(r), i = 0; i < r; i++) a[i] = arguments[i];
                        return eO(ew(e = t.call.apply(t, [this].concat(a))), "priority", 90), eO(ew(e), "incompatibleTokens", ["D", "i", "e", "c", "t", "T"]), e
                    }
                    return ek(n, [{
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
                            return (e = tP(e, n, r)).setUTCHours(0, 0, 0, 0), e
                        }
                    }]), n
                }(eD),
                tT = function(e) {
                    eP(n, e);
                    var t = eA(n);

                    function n() {
                        var e;
                        eU(this, n);
                        for (var r = arguments.length, a = Array(r), i = 0; i < r; i++) a[i] = arguments[i];
                        return eO(ew(e = t.call.apply(t, [this].concat(a))), "priority", 90), eO(ew(e), "incompatibleTokens", ["y", "R", "u", "q", "Q", "M", "L", "I", "d", "D", "E", "i", "c", "t", "T"]), e
                    }
                    return ek(n, [{
                        key: "parse",
                        value: function(e, t, n, r) {
                            var a = function(e) {
                                var t = 7 * Math.floor((e - 1) / 7);
                                return (e + r.weekStartsOn + 6) % 7 + t
                            };
                            switch (t) {
                                case "e":
                                case "ee":
                                    return e9(tn(t.length, e), a);
                                case "eo":
                                    return e9(n.ordinalNumber(e, {
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
                            return (e = tP(e, n, r)).setUTCHours(0, 0, 0, 0), e
                        }
                    }]), n
                }(eD),
                tA = function(e) {
                    eP(n, e);
                    var t = eA(n);

                    function n() {
                        var e;
                        eU(this, n);
                        for (var r = arguments.length, a = Array(r), i = 0; i < r; i++) a[i] = arguments[i];
                        return eO(ew(e = t.call.apply(t, [this].concat(a))), "priority", 90), eO(ew(e), "incompatibleTokens", ["y", "R", "u", "q", "Q", "M", "L", "I", "d", "D", "E", "i", "e", "t", "T"]), e
                    }
                    return ek(n, [{
                        key: "parse",
                        value: function(e, t, n, r) {
                            var a = function(e) {
                                var t = 7 * Math.floor((e - 1) / 7);
                                return (e + r.weekStartsOn + 6) % 7 + t
                            };
                            switch (t) {
                                case "c":
                                case "cc":
                                    return e9(tn(t.length, e), a);
                                case "co":
                                    return e9(n.ordinalNumber(e, {
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
                            return (e = tP(e, n, r)).setUTCHours(0, 0, 0, 0), e
                        }
                    }]), n
                }(eD),
                tU = function(e) {
                    eP(n, e);
                    var t = eA(n);

                    function n() {
                        var e;
                        eU(this, n);
                        for (var r = arguments.length, a = Array(r), i = 0; i < r; i++) a[i] = arguments[i];
                        return eO(ew(e = t.call.apply(t, [this].concat(a))), "priority", 90), eO(ew(e), "incompatibleTokens", ["y", "Y", "u", "q", "Q", "M", "L", "w", "d", "D", "E", "e", "c", "t", "T"]), e
                    }
                    return ek(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            var r = function(e) {
                                return 0 === e ? 7 : e
                            };
                            switch (t) {
                                case "i":
                                case "ii":
                                    return tn(t.length, e);
                                case "io":
                                    return n.ordinalNumber(e, {
                                        unit: "day"
                                    });
                                case "iii":
                                    return e9(n.day(e, {
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
                                    return e9(n.day(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    }), r);
                                case "iiiiii":
                                    return e9(n.day(e, {
                                        width: "short",
                                        context: "formatting"
                                    }) || n.day(e, {
                                        width: "narrow",
                                        context: "formatting"
                                    }), r);
                                default:
                                    return e9(n.day(e, {
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
                                G(2, arguments);
                                var n = em(t);
                                n % 7 == 0 && (n -= 7);
                                var r = W(e),
                                    a = 7 * ((n % 7 + 7) % 7 < 1) + n - r.getUTCDay();
                                return r.setUTCDate(r.getUTCDate() + a), r
                            }(e, n)).setUTCHours(0, 0, 0, 0), e
                        }
                    }]), n
                }(eD),
                tN = function(e) {
                    eP(n, e);
                    var t = eA(n);

                    function n() {
                        var e;
                        eU(this, n);
                        for (var r = arguments.length, a = Array(r), i = 0; i < r; i++) a[i] = arguments[i];
                        return eO(ew(e = t.call.apply(t, [this].concat(a))), "priority", 80), eO(ew(e), "incompatibleTokens", ["b", "B", "H", "k", "t", "T"]), e
                    }
                    return ek(n, [{
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
                            return e.setUTCHours(ta(n), 0, 0, 0), e
                        }
                    }]), n
                }(eD),
                tR = function(e) {
                    eP(n, e);
                    var t = eA(n);

                    function n() {
                        var e;
                        eU(this, n);
                        for (var r = arguments.length, a = Array(r), i = 0; i < r; i++) a[i] = arguments[i];
                        return eO(ew(e = t.call.apply(t, [this].concat(a))), "priority", 80), eO(ew(e), "incompatibleTokens", ["a", "B", "H", "k", "t", "T"]), e
                    }
                    return ek(n, [{
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
                            return e.setUTCHours(ta(n), 0, 0, 0), e
                        }
                    }]), n
                }(eD),
                tk = function(e) {
                    eP(n, e);
                    var t = eA(n);

                    function n() {
                        var e;
                        eU(this, n);
                        for (var r = arguments.length, a = Array(r), i = 0; i < r; i++) a[i] = arguments[i];
                        return eO(ew(e = t.call.apply(t, [this].concat(a))), "priority", 80), eO(ew(e), "incompatibleTokens", ["a", "b", "t", "T"]), e
                    }
                    return ek(n, [{
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
                            return e.setUTCHours(ta(n), 0, 0, 0), e
                        }
                    }]), n
                }(eD),
                tO = function(e) {
                    eP(n, e);
                    var t = eA(n);

                    function n() {
                        var e;
                        eU(this, n);
                        for (var r = arguments.length, a = Array(r), i = 0; i < r; i++) a[i] = arguments[i];
                        return eO(ew(e = t.call.apply(t, [this].concat(a))), "priority", 70), eO(ew(e), "incompatibleTokens", ["H", "K", "k", "t", "T"]), e
                    }
                    return ek(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            switch (t) {
                                case "h":
                                    return te(eX, e);
                                case "ho":
                                    return n.ordinalNumber(e, {
                                        unit: "hour"
                                    });
                                default:
                                    return tn(t.length, e)
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
                }(eD),
                tI = function(e) {
                    eP(n, e);
                    var t = eA(n);

                    function n() {
                        var e;
                        eU(this, n);
                        for (var r = arguments.length, a = Array(r), i = 0; i < r; i++) a[i] = arguments[i];
                        return eO(ew(e = t.call.apply(t, [this].concat(a))), "priority", 70), eO(ew(e), "incompatibleTokens", ["a", "b", "h", "K", "k", "t", "T"]), e
                    }
                    return ek(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            switch (t) {
                                case "H":
                                    return te(eH, e);
                                case "Ho":
                                    return n.ordinalNumber(e, {
                                        unit: "hour"
                                    });
                                default:
                                    return tn(t.length, e)
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
                }(eD),
                tM = function(e) {
                    eP(n, e);
                    var t = eA(n);

                    function n() {
                        var e;
                        eU(this, n);
                        for (var r = arguments.length, a = Array(r), i = 0; i < r; i++) a[i] = arguments[i];
                        return eO(ew(e = t.call.apply(t, [this].concat(a))), "priority", 70), eO(ew(e), "incompatibleTokens", ["h", "H", "k", "t", "T"]), e
                    }
                    return ek(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            switch (t) {
                                case "K":
                                    return te(eY, e);
                                case "Ko":
                                    return n.ordinalNumber(e, {
                                        unit: "hour"
                                    });
                                default:
                                    return tn(t.length, e)
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
                }(eD),
                tB = function(e) {
                    eP(n, e);
                    var t = eA(n);

                    function n() {
                        var e;
                        eU(this, n);
                        for (var r = arguments.length, a = Array(r), i = 0; i < r; i++) a[i] = arguments[i];
                        return eO(ew(e = t.call.apply(t, [this].concat(a))), "priority", 70), eO(ew(e), "incompatibleTokens", ["a", "b", "h", "H", "K", "t", "T"]), e
                    }
                    return ek(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            switch (t) {
                                case "k":
                                    return te(eV, e);
                                case "ko":
                                    return n.ordinalNumber(e, {
                                        unit: "hour"
                                    });
                                default:
                                    return tn(t.length, e)
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
                }(eD),
                tD = function(e) {
                    eP(n, e);
                    var t = eA(n);

                    function n() {
                        var e;
                        eU(this, n);
                        for (var r = arguments.length, a = Array(r), i = 0; i < r; i++) a[i] = arguments[i];
                        return eO(ew(e = t.call.apply(t, [this].concat(a))), "priority", 60), eO(ew(e), "incompatibleTokens", ["t", "T"]), e
                    }
                    return ek(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            switch (t) {
                                case "m":
                                    return te(eq, e);
                                case "mo":
                                    return n.ordinalNumber(e, {
                                        unit: "minute"
                                    });
                                default:
                                    return tn(t.length, e)
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
                }(eD),
                tL = function(e) {
                    eP(n, e);
                    var t = eA(n);

                    function n() {
                        var e;
                        eU(this, n);
                        for (var r = arguments.length, a = Array(r), i = 0; i < r; i++) a[i] = arguments[i];
                        return eO(ew(e = t.call.apply(t, [this].concat(a))), "priority", 50), eO(ew(e), "incompatibleTokens", ["t", "T"]), e
                    }
                    return ek(n, [{
                        key: "parse",
                        value: function(e, t, n) {
                            switch (t) {
                                case "s":
                                    return te(ez, e);
                                case "so":
                                    return n.ordinalNumber(e, {
                                        unit: "second"
                                    });
                                default:
                                    return tn(t.length, e)
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
                }(eD),
                tj = function(e) {
                    eP(n, e);
                    var t = eA(n);

                    function n() {
                        var e;
                        eU(this, n);
                        for (var r = arguments.length, a = Array(r), i = 0; i < r; i++) a[i] = arguments[i];
                        return eO(ew(e = t.call.apply(t, [this].concat(a))), "priority", 30), eO(ew(e), "incompatibleTokens", ["t", "T"]), e
                    }
                    return ek(n, [{
                        key: "parse",
                        value: function(e, t) {
                            return e9(tn(t.length, e), function(e) {
                                return Math.floor(e * Math.pow(10, -t.length + 3))
                            })
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            return e.setUTCMilliseconds(n), e
                        }
                    }]), n
                }(eD),
                tF = function(e) {
                    eP(n, e);
                    var t = eA(n);

                    function n() {
                        var e;
                        eU(this, n);
                        for (var r = arguments.length, a = Array(r), i = 0; i < r; i++) a[i] = arguments[i];
                        return eO(ew(e = t.call.apply(t, [this].concat(a))), "priority", 10), eO(ew(e), "incompatibleTokens", ["t", "T", "x"]), e
                    }
                    return ek(n, [{
                        key: "parse",
                        value: function(e, t) {
                            switch (t) {
                                case "X":
                                    return tt(e4, e);
                                case "XX":
                                    return tt(e5, e);
                                case "XXXX":
                                    return tt(e6, e);
                                case "XXXXX":
                                    return tt(e7, e);
                                default:
                                    return tt(e8, e)
                            }
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            return t.timestampIsSet ? e : new Date(e.getTime() - n)
                        }
                    }]), n
                }(eD),
                tG = function(e) {
                    eP(n, e);
                    var t = eA(n);

                    function n() {
                        var e;
                        eU(this, n);
                        for (var r = arguments.length, a = Array(r), i = 0; i < r; i++) a[i] = arguments[i];
                        return eO(ew(e = t.call.apply(t, [this].concat(a))), "priority", 10), eO(ew(e), "incompatibleTokens", ["t", "T", "X"]), e
                    }
                    return ek(n, [{
                        key: "parse",
                        value: function(e, t) {
                            switch (t) {
                                case "x":
                                    return tt(e4, e);
                                case "xx":
                                    return tt(e5, e);
                                case "xxxx":
                                    return tt(e6, e);
                                case "xxxxx":
                                    return tt(e7, e);
                                default:
                                    return tt(e8, e)
                            }
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            return t.timestampIsSet ? e : new Date(e.getTime() - n)
                        }
                    }]), n
                }(eD),
                tW = function(e) {
                    eP(n, e);
                    var t = eA(n);

                    function n() {
                        var e;
                        eU(this, n);
                        for (var r = arguments.length, a = Array(r), i = 0; i < r; i++) a[i] = arguments[i];
                        return eO(ew(e = t.call.apply(t, [this].concat(a))), "priority", 40), eO(ew(e), "incompatibleTokens", "*"), e
                    }
                    return ek(n, [{
                        key: "parse",
                        value: function(e) {
                            return te(e$, e)
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            return [new Date(1e3 * n), {
                                timestampIsSet: !0
                            }]
                        }
                    }]), n
                }(eD),
                tH = function(e) {
                    eP(n, e);
                    var t = eA(n);

                    function n() {
                        var e;
                        eU(this, n);
                        for (var r = arguments.length, a = Array(r), i = 0; i < r; i++) a[i] = arguments[i];
                        return eO(ew(e = t.call.apply(t, [this].concat(a))), "priority", 20), eO(ew(e), "incompatibleTokens", "*"), e
                    }
                    return ek(n, [{
                        key: "parse",
                        value: function(e) {
                            return te(e$, e)
                        }
                    }, {
                        key: "set",
                        value: function(e, t, n) {
                            return [new Date(n), {
                                timestampIsSet: !0
                            }]
                        }
                    }]), n
                }(eD),
                tV = {
                    G: new eL,
                    y: new ts,
                    Y: new td,
                    R: new th,
                    u: new tp,
                    Q: new tv,
                    q: new tm,
                    M: new ty,
                    L: new tb,
                    w: new tg,
                    I: new tE,
                    d: new tw,
                    D: new tx,
                    E: new t_,
                    e: new tT,
                    c: new tA,
                    i: new tU,
                    a: new tN,
                    b: new tR,
                    B: new tk,
                    h: new tO,
                    H: new tI,
                    K: new tM,
                    k: new tB,
                    m: new tD,
                    s: new tL,
                    S: new tj,
                    X: new tF,
                    x: new tG,
                    t: new tW,
                    T: new tH
                },
                tY = /[yYQqMLwIdDecihHKkms]o|(\w)\1*|''|'(''|[^'])+('|$)|./g,
                tX = /P+p+|P+|p+|''|'(''|[^'])+('|$)|./g,
                tq = /^'([^]*?)'?$/,
                tz = /''/g,
                tK = /\S/,
                tQ = /[a-zA-Z]/;

            function tJ(e, t, n, r) {
                G(3, arguments);
                var a = String(e),
                    i = String(t),
                    o = null != (l = null != (c = null == r ? void 0 : r.locale) ? c : tu.locale) ? l : ev;
                if (!o.match) throw RangeError("locale must contain match property");
                var s = em(null != (d = null != (f = null != (h = null != (p = null == r ? void 0 : r.firstWeekContainsDate) ? p : null == r || null == (v = r.locale) || null == (m = v.options) ? void 0 : m.firstWeekContainsDate) ? h : tu.firstWeekContainsDate) ? f : null == (y = tu.locale) || null == (b = y.options) ? void 0 : b.firstWeekContainsDate) ? d : 1);
                if (!(s >= 1 && s <= 7)) throw RangeError("firstWeekContainsDate must be between 1 and 7 inclusively");
                var u = em(null != (g = null != (E = null != (S = null != (C = null == r ? void 0 : r.weekStartsOn) ? C : null == r || null == (w = r.locale) || null == (x = w.options) ? void 0 : x.weekStartsOn) ? S : tu.weekStartsOn) ? E : null == (P = tu.locale) || null == (_ = P.options) ? void 0 : _.weekStartsOn) ? g : 0);
                if (!(u >= 0 && u <= 6)) throw RangeError("weekStartsOn must be between 0 and 6 inclusively");
                if ("" === i)
                    if ("" === a) return W(n);
                    else return new Date(NaN);
                var l, c, d, f, h, p, v, m, y, b, g, E, S, C, w, x, P, _, T, A = {
                        firstWeekContainsDate: s,
                        weekStartsOn: u,
                        locale: o
                    },
                    U = [new eB],
                    N = i.match(tX).map(function(e) {
                        var t = e[0];
                        return t in eg ? (0, eg[t])(e, o.formatLong) : e
                    }).join("").match(tY),
                    R = [],
                    k = eu(N);
                try {
                    for (k.s(); !(T = k.n()).done;) {
                        var O = function() {
                            var t, n, s = T.value;
                            null != r && r.useAdditionalWeekYearTokens || (t = s, -1 === eS.indexOf(t)) || eC(s, i, e), null != r && r.useAdditionalDayOfYearTokens || (n = s, -1 === eE.indexOf(n)) || eC(s, i, e);
                            var u = s[0],
                                l = tV[u];
                            if (l) {
                                var c = l.incompatibleTokens;
                                if (Array.isArray(c)) {
                                    var d = R.find(function(e) {
                                        return c.includes(e.token) || e.token === u
                                    });
                                    if (d) throw RangeError("The format string mustn't contain `".concat(d.fullToken, "` and `").concat(s, "` at the same time"))
                                } else if ("*" === l.incompatibleTokens && R.length > 0) throw RangeError("The format string mustn't contain `".concat(s, "` and any other token at the same time"));
                                R.push({
                                    token: u,
                                    fullToken: s
                                });
                                var f = l.run(a, s, o.match, A);
                                if (!f) return {
                                    v: new Date(NaN)
                                };
                                U.push(f.setter), a = f.rest
                            } else {
                                if (u.match(tQ)) throw RangeError("Format string contains an unescaped latin alphabet character `" + u + "`");
                                if ("''" === s ? s = "'" : "'" === u && (s = s.match(tq)[1].replace(tz, "'")), 0 !== a.indexOf(s)) return {
                                    v: new Date(NaN)
                                };
                                a = a.slice(s.length)
                            }
                        }();
                        if ("object" === F(O)) return O.v
                    }
                } catch (e) {
                    k.e(e)
                } finally {
                    k.f()
                }
                if (a.length > 0 && tK.test(a)) return new Date(NaN);
                var I = U.map(function(e) {
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
                    M = W(n);
                if (isNaN(M.getTime())) return new Date(NaN);
                var B, D, L = function(e, t) {
                        return G(2, arguments),
                            function(e, t) {
                                return G(2, arguments), new Date(W(e).getTime() + em(t))
                            }(e, -em(t))
                    }(M, ((B = new Date(Date.UTC(M.getFullYear(), M.getMonth(), M.getDate(), M.getHours(), M.getMinutes(), M.getSeconds(), M.getMilliseconds()))).setUTCFullYear(M.getFullYear()), M.getTime() - B.getTime())),
                    j = {},
                    H = eu(I);
                try {
                    for (H.s(); !(D = H.n()).done;) {
                        var V = D.value;
                        if (!V.validate(L, A)) return new Date(NaN);
                        var Y = V.set(L, j, A);
                        Array.isArray(Y) ? (L = Y[0], function(e, t) {
                            if (null == e) throw TypeError("assign requires that input parameter not be null or undefined");
                            for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
                        }(j, Y[1])) : L = Y
                    }
                } catch (e) {
                    H.e(e)
                } finally {
                    H.f()
                }
                return L
            }
            var tZ = window.Roblox["core-scripts"].intl.intl,
                t$ = n.n(tZ),
                t0 = function(e, t) {
                    return new(t$())().getDateTimeFormatter().getCustomDateTime(new Date(e, t - 1), {
                        year: "2-digit",
                        month: "2-digit"
                    })
                },
                t1 = function(e) {
                    var t = tJ(e, "MM/yy", new Date);
                    return "Invalid Date" === t.toString() ? [0, 0] : [t.getMonth() + 1, t.getFullYear()]
                },
                t2 = function(e) {
                    var t = tJ(e, "MM/yy", new Date);
                    return "Invalid Date" === t.toString() ? new Date : t
                },
                t3 = window.CoreUtilities,
                t4 = function() {
                    return t3.urlService.getAbsoluteUrl("/my/account#!/billing")
                },
                t5 = {
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
                t6 = function(e) {
                    var t = t5[e.trim().toLowerCase()];
                    return t || e.toLowerCase()
                },
                t8 = ((t = {}).RemovePaymentProfileNotAllowedFailure = "RemovePaymentProfileNotAllowedFailure", t),
                t7 = "AddCardClicked",
                t9 = "CancelAddCardInModalClicked",
                ne = "AddCardSubmitInModalClicked",
                nt = "DeleteSavedPaymentMethodButtonClicked",
                nn = "CancelCardDeletionInModalButtonClicked",
                nr = "UpdateCardClicked",
                na = "DeleteCardInModalButtonClicked",
                ni = "StripeCustomerEmailAlreadyExists",
                no = "StripeCustomerEmailDoesNotExist",
                ns = "ConvertCreditToRobuxButtonClicked",
                nu = "UserHasNoSubscription",
                nl = "SubscribeButtonClicked",
                nc = "CancelSubscriptionButtonClicked",
                nd = "CannotDeleteCardWithSubscriptionError",
                nf = "GetPaymentProfileSetupCalled",
                nh = "GetPaymentProfileSetupSucceeded",
                np = "GetPaymentProfileSetupFailed",
                nv = "GetUserBirthdateCalled",
                nm = "GetUserBirthdateSucceeded",
                ny = "GetUserBirthdateFailed",
                nb = "GetSavedPaymentProfilesCalled",
                ng = "GetSavedPaymentProfilesSucceeded",
                nE = "GetSavedPaymentProfilesFailed",
                nS = "GetSavedPaymentProfilesReturnsNone",
                nC = "DeleteSavedPaymentProfileCalled",
                nw = "DeleteSavedPaymentProfileSucceeded",
                nx = "DeleteSavedPaymentProfileFailed",
                nP = "GetUserPremiumSubscriptionCalled",
                n_ = "GetUserPremiumSubscriptionSucceeded",
                nT = "GetUserPremiumSubscriptionFailed",
                nA = "GetCreditConversionMetadataCalled",
                nU = "GetCreditConversionMetadataSucceeded",
                nN = "GetCreditConversionMetadataFailed",
                nR = "GetCreditConversionMetadataCurrencyCodeNull",
                nk = "VerifyPaymentProfileCreationCalled",
                nO = "VerifyPaymentProfileCreationSucceeded",
                nI = "VerifyPaymentProfileCreationFailed",
                nM = "UpdateSavedPaymentProfileCalled",
                nB = "UpdateSavedPaymentProfileSucceeded",
                nD = "UpdateSavedPaymentProfileFailed",
                nL = "LoadStripeCalled",
                nj = "LoadStripeSucceeded",
                nF = "LoadStripeFailed",
                nG = "StripeConfirmSetupIntentCalled",
                nW = "StripeConfirmSetupIntentSucceeded",
                nH = "StripeConfirmSetupIntentFailed",
                nV = "incorrect_cvc",
                nY = "expired_card",
                nX = "CanChangeSetting",
                nq = "account_management/SettingsChange";

            function nz(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function nK(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {},
                        r = Object.keys(n);
                    "function" == typeof Object.getOwnPropertySymbols && (r = r.concat(Object.getOwnPropertySymbols(n).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(n, e).enumerable
                    }))), r.forEach(function(t) {
                        nz(e, t, n[t])
                    })
                }
                return e
            }

            function nQ(e) {
                if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
            }

            function nJ(e) {
                return function(e) {
                    if (Array.isArray(e)) return U(e)
                }(e) || nQ(e) || N(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var nZ = ((r = {}).Stripe = "Stripe", r),
                n$ = function(e) {
                    return {
                        withCredentials: !0,
                        url: "".concat(x.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-profile/").concat(e)
                    }
                },
                n0 = function(e) {
                    var t = {
                        retryable: !1,
                        withCredentials: !0,
                        url: "".concat(x.EnvironmentUrls.premiumFeaturesApi, "/v1/users/").concat(e, "/subscriptions")
                    };
                    return t3.httpService.get(t)
                },
                n1 = function() {
                    return D(function() {
                        var e, t, n, r, a, i, o;
                        return L(this, function(s) {
                            switch (s.label) {
                                case 0:
                                    e = !1, t = !1, n = 0, r = 0, a = "USD", i = !1, s.label = 1;
                                case 1:
                                    return s.trys.push([1, 3, , 4]), (0, V.fireEvent)(nA), [4, D(function() {
                                        var e;
                                        return L(this, function(t) {
                                            return e = {
                                                withCredentials: !0,
                                                url: "".concat(x.EnvironmentUrls.apiGatewayUrl, "/credit-balance/v1/get-conversion-metadata")
                                            }, [2, t3.httpService.get(e)]
                                        })
                                    })()];
                                case 2:
                                    return (o = s.sent().data).creditBalance >= 0 && null !== o.currencyCode ? (r = o.creditBalance, a = o.currencyCode, i = o.isConvertAllFlowEnabled) : (e = !0, (0, V.fireEvent)(nR)), o.robuxConversionAmount > 0 && (n = o.robuxConversionAmount), t = o.isConvertAllFlowEnabled && o.creditBalance > 0 || o.robuxConversionAmount > 0, (0, V.fireEvent)(nU), [2, [e, t, n, r, a, i]];
                                case 3:
                                    throw s.sent(), (0, V.fireEvent)(nN), Error("Failed to get Robux conversion metadata.");
                                case 4:
                                    return [2]
                            }
                        })
                    })()
                },
                n2 = ((a = {}).GlobalTeen = "globalTeen", a.U13 = "u13", a.O18 = "o18", a),
                n3 = function() {
                    return D(function() {
                        var e;
                        return L(this, function(t) {
                            switch (t.label) {
                                case 0:
                                    return e = {
                                        withCredentials: !0,
                                        url: "".concat(x.EnvironmentUrls.billingApi, "/v1/parental-controls/get-settings")
                                    }, [4, t3.httpService.get(e)];
                                case 1:
                                    return [2, t.sent().data]
                            }
                        })
                    })()
                },
                n4 = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : void 0,
                        n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : [];
                    return D(function() {
                        var r, a, i, o, s;
                        return L(this, function(u) {
                            switch (u.label) {
                                case 0:
                                    r = {
                                        withCredentials: !0,
                                        url: "".concat(x.EnvironmentUrls.apiGatewayUrl, "/parental-controls-api/v1/parental-controls/consents")
                                    }, u.label = 1;
                                case 1:
                                    return u.trys.push([1, 5, , 6]), [4, t3.httpService.get(r, {
                                        childUserId: e,
                                        consentStatus: "Pending",
                                        consentType: "UpdateUserSetting",
                                        cursor: t
                                    })];
                                case 2:
                                    if (o = (i = u.sent().data).consents, s = i.nextCursor, (a = n).push.apply(a, nJ(o || [])), !s) return [3, 4];
                                    return [4, n4(e, s, n)];
                                case 3:
                                    u.sent(), u.label = 4;
                                case 4:
                                    return [2, n];
                                case 5:
                                    throw u.sent(), Error("Failed to fetch pending consent requests");
                                case 6:
                                    return [2]
                            }
                        })
                    })()
                },
                n5 = "Heading.SavedCreditCard.Payments",
                n6 = "Heading.SavedCreditCard.CreditOrDebitCard",
                n8 = "Heading.SavedCreditCard.BillingAddress",
                n7 = "Heading.AskMoreRobux",
                n9 = "Header.CancelRequest",
                re = "Heading.MonthlySpendingLimit",
                rt = "Action.Cancel",
                rn = "Action.Save",
                rr = "Description.SavedCreditCard.SavePaymentMethodSomethingWentWrong",
                ra = "Response.SavedCreditCard.GenericSomethingWentWrong",
                ri = "Description.SuccessDialogMessage",
                ro = function() {
                    var e = R((0, I.createModal)(), 2),
                        t = e[0],
                        n = e[1];
                    return [function(e) {
                        var r = e.header,
                            a = e.cancelText,
                            i = e.translate,
                            o = e.onDelete,
                            s = e.onNeutral,
                            u = R((0, k.useState)(!1), 2),
                            l = u[0],
                            c = u[1];
                        return (0, w.jsx)(t, {
                            id: "add-card-modal",
                            title: r,
                            body: a,
                            loading: l,
                            neutralButtonText: i(rt),
                            actionButtonText: i("Action.Delete"),
                            onNeutral: function() {
                                null == s || s(), n.close()
                            },
                            onAction: function() {
                                c(!0), o(), c(!1), n.close()
                            },
                            closeable: !0,
                            size: "md",
                            actionButtonShow: !0
                        })
                    }, n]
                },
                rs = function() {
                    var e = R(ro(), 2),
                        t = e[0];
                    return [function(e) {
                        var n = e.translate,
                            r = e.systemFeedbackService,
                            a = e.cannotDeletePaymentMethodModalService,
                            i = e.onDeleteSuccess,
                            o = e.paymentProfileId,
                            s = n("Heading.SavedCreditCard.DeletePaymentMethod"),
                            u = n("Description.SavedCreditCard.AreYouSureDeletePaymentMethod");
                        return (0, w.jsx)(t, {
                            translate: n,
                            header: s,
                            cancelText: u,
                            onDelete: function() {
                                return D(function() {
                                    var e;
                                    return L(this, function(t) {
                                        switch (t.label) {
                                            case 0:
                                                (0, V.fireEvent)(na), t.label = 1;
                                            case 1:
                                                return t.trys.push([1, 3, , 4]), (0, V.fireEvent)(nC), [4, D(function() {
                                                    var e;
                                                    return L(this, function(t) {
                                                        return e = n$(o), [2, t3.httpService.delete(e)]
                                                    })
                                                })()];
                                            case 2:
                                                return 200 === t.sent().status && ((0, V.fireEvent)(nw), r.success(n("Description.SavedCreditCard.DeletePaymentMethodSuccess")), i()), [3, 4];
                                            case 3:
                                                return (null == (e = t.sent()) ? void 0 : e.status) === 412 && (null == e ? void 0 : e.data) === t8.RemovePaymentProfileNotAllowedFailure ? ((0, V.fireEvent)(nd), a.open()) : ((0, V.fireEvent)(nx), r.warning(n(ra))), [3, 4];
                                            case 4:
                                                return [2]
                                        }
                                    })
                                })()
                            },
                            onNeutral: function() {
                                (0, V.fireEvent)(nn)
                            }
                        })
                    }, e[1]]
                },
                ru = function() {
                    var e = R((0, I.createModal)(), 2),
                        t = e[0],
                        n = e[1];
                    return [function(e) {
                        var r = e.translate,
                            a = r("Heading.SavedCreditCard.CannotDeletePaymentMethod"),
                            i = (0, w.jsx)("div", {
                                className: "cannot-delete-payment-method-text",
                                children: r("Description.SavedCreditCard.CannotDeletePaymentMethod")
                            });
                        return (0, w.jsx)(t, {
                            id: "cannot-delete-card-modal",
                            title: a,
                            body: i,
                            neutralButtonText: r("Action.GotIt") || "Got it",
                            onNeutral: function() {
                                n.close()
                            },
                            closeable: !0,
                            size: "md"
                        })
                    }, n]
                },
                rl = function() {
                    var e = R((0, k.useState)(!1), 2),
                        t = e[0],
                        n = e[1],
                        r = (0, k.useMemo)(function() {
                            return {
                                open: function() {
                                    n(!0)
                                },
                                close: function() {
                                    n(!1)
                                }
                            }
                        }, []);
                    return [function(e) {
                        var n = e.translate,
                            a = e.onUpdateSuccess,
                            i = e.systemFeedbackService,
                            o = e.paymentProfileId,
                            s = e.cardType,
                            u = e.lastFour,
                            l = e.expMonth,
                            c = e.expYear,
                            d = R((0, k.useState)(!1), 2),
                            f = d[0],
                            h = d[1],
                            p = R((0, k.useState)(!1), 2),
                            v = p[0],
                            m = p[1],
                            y = R((0, k.useState)(t0(c, l)), 2),
                            b = y[0],
                            g = y[1],
                            E = R((0, k.useState)(!1), 2),
                            S = E[0],
                            C = E[1],
                            x = n("Heading.SavedCreditCard.UpdatePaymentMethod"),
                            P = {
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
                        (0, k.useEffect)(function() {
                            t || g(t0(c, l)), C(!1), m(!1)
                        }, [l, c]), (0, k.useEffect)(function() {
                            var e = new Date(c, l - 1),
                                t = t2(b),
                                n = new Date(new Date().getFullYear(), new Date().getMonth());
                            m(t !== e && t >= n), C(t < n || t < e)
                        }, [l, c, b]);
                        var _ = (0, k.useCallback)(function() {
                            return D(function() {
                                var e, t, s;
                                return L(this, function(u) {
                                    switch (u.label) {
                                        case 0:
                                            h(!0), u.label = 1;
                                        case 1:
                                            var l, c;
                                            return u.trys.push([1, 3, , 4]), t = (e = R(t1(b), 2))[0], s = e[1], (0, V.fireEvent)(nM), [4, (l = t, c = s, D(function() {
                                                var e;
                                                return L(this, function(t) {
                                                    return e = n$(o), [2, t3.httpService.post(e, {
                                                        expirationMonth: l,
                                                        expirationYear: c
                                                    })]
                                                })
                                            })())];
                                        case 2:
                                            return 200 === u.sent().status && ((0, V.fireEvent)(nB), i.success(n("Description.PaymentExpirationUpdateSuccess")), a(t, s)), [3, 4];
                                        case 3:
                                            return u.sent(), (0, V.fireEvent)(nD), i.warning(n(ra)), [3, 4];
                                        case 4:
                                            return h(!1), r.close(), [2]
                                    }
                                })
                            })()
                        }, [b, a, o, i, n]);
                        return (0, w.jsxs)(I.Modal, {
                            show: t,
                            onHide: r.close,
                            size: "md",
                            id: "update-payment-method-modal",
                            children: [(0, w.jsx)(I.Modal.Header, {
                                title: x,
                                onClose: r.close
                            }), (0, w.jsxs)(I.Modal.Body, {
                                children: [(0, w.jsx)("div", {
                                    className: "modal-description font-header-2 text-emphasis",
                                    children: n(n6)
                                }), (0, w.jsxs)("div", {
                                    className: "fr payment-method-display",
                                    children: [(0, w.jsx)("span", {
                                        className: "payment-method-image cardIcon ".concat(t6(s))
                                    }), (0, w.jsx)("div", {
                                        className: "cardNumber text-emphasis font-header-2",
                                        children: "****".concat(u)
                                    })]
                                }), (0, w.jsx)("div", {
                                    className: "font-caption-header text-emphasis",
                                    children: n("Label.Expiration")
                                }), (0, w.jsx)("input", {
                                    type: "string",
                                    name: "expiration",
                                    placeholder: "MM/YY",
                                    className: "expiry-input ".concat(S ? "error-input" : ""),
                                    value: b,
                                    inputMode: "numeric",
                                    onChange: function(e) {
                                        var t = e.target.value;
                                        b.startsWith(t) || (b.length >= 2 && t.startsWith("1/") && (t = "0".concat(t)), (t = t.replace(/\D/g, "")).length > 4 && (t = t.slice(0, 4)), 1 === t.length && "0" !== t && "1" !== t ? t = "0".concat(t, "/") : 2 === t.length && Number(t) > 12 ? t = "0".concat(t.slice(0, 1), "/").concat(t.slice(1)) : t.length >= 2 && t.length <= 4 && (t = "".concat(t.slice(0, 2), "/").concat(t.slice(2)))), g(t)
                                    }
                                }), S && (0, w.jsx)("div", {
                                    className: "font-caption-body input-error-text",
                                    children: n("Error.InvalidExpirationDate")
                                })]
                            }), (0, w.jsx)("div", {
                                className: "footer-divider"
                            }), (0, w.jsxs)(I.Modal.Footer, {
                                children: [(0, w.jsx)("div", {
                                    className: "font-caption-body disclosure-text",
                                    dangerouslySetInnerHTML: P
                                }), (0, w.jsxs)("div", {
                                    className: "modal-buttons",
                                    children: [(0, w.jsx)(I.Button, {
                                        variant: I.Button.variants.secondary,
                                        width: I.Button.widths.full,
                                        size: I.Button.sizes.large,
                                        className: "action-button",
                                        onClick: function() {
                                            r.close()
                                        },
                                        children: n("Action.Cancel")
                                    }), (0, w.jsx)(I.Button, {
                                        width: I.Button.widths.full,
                                        size: I.Button.sizes.large,
                                        className: "action-button",
                                        isLoading: f,
                                        isDisabled: !v,
                                        onClick: _,
                                        children: n("Action.Save")
                                    })]
                                })]
                            })]
                        })
                    }, r]
                },
                rc = function(e) {
                    var t = e.translate,
                        n = e.systemFeedbackService,
                        r = e.updatePaymentProfiles,
                        a = e.paymentProfileId,
                        i = e.cardType,
                        o = e.lastFour,
                        s = e.expMonth,
                        u = e.expYear,
                        l = R((0, k.useState)(!1), 2),
                        c = l[0],
                        d = l[1],
                        f = R(rs(), 2),
                        h = f[0],
                        p = f[1],
                        v = R(ru(), 2),
                        m = v[0],
                        y = v[1],
                        b = R((0, k.useState)(!1), 2),
                        g = b[0],
                        E = b[1],
                        S = R((0, k.useState)(s), 2),
                        C = S[0],
                        x = S[1],
                        P = R((0, k.useState)(u), 2),
                        _ = P[0],
                        T = P[1],
                        A = "****".concat(o),
                        U = "".concat(t("Label.SavedCreditCard.Exp"), " ").concat(t0(_, C));
                    (0, k.useEffect)(function() {
                        E(new Date(_, C - 1) < new Date)
                    }, [C, _]);
                    var N = R(rl(), 2),
                        O = N[0],
                        I = N[1];
                    return c ? null : (0, w.jsxs)("div", {
                        className: "cardContainer",
                        children: [(0, w.jsx)(h, {
                            translate: t,
                            systemFeedbackService: n,
                            cannotDeletePaymentMethodModalService: y,
                            paymentProfileId: a,
                            onDeleteSuccess: function() {
                                r(), d(!0)
                            }
                        }), (0, w.jsx)(m, {
                            translate: t
                        }), (0, w.jsx)(O, {
                            translate: t,
                            onUpdateSuccess: function(e, t) {
                                x(e), T(t)
                            },
                            systemFeedbackService: n,
                            paymentProfileId: a,
                            cardType: i,
                            lastFour: o,
                            expMonth: C,
                            expYear: _
                        }), (0, w.jsx)("span", {
                            className: "payment-method-image cardIcon ".concat(t6(i))
                        }), (0, w.jsx)("div", {
                            className: "cardNumber font-bold",
                            children: A
                        }), (0, w.jsx)("div", {
                            className: "cardExpiry",
                            children: U
                        }), (0, w.jsx)("button", {
                            type: "button",
                            className: "btn-generic-edit-sm",
                            onClick: function() {
                                I.open(), (0, V.fireEvent)(nr)
                            },
                            children: (0, w.jsx)("span", {
                                className: "icon-edit"
                            })
                        }), (0, w.jsx)("button", {
                            type: "button",
                            className: "btn-generic-trash-bin-sm",
                            onClick: function() {
                                p.open(), (0, V.fireEvent)(nt)
                            },
                            children: (0, w.jsx)("span", {
                                className: "icon-trash-bin"
                            })
                        }), g && (0, w.jsxs)(k.Fragment, {
                            children: [(0, w.jsx)("span", {
                                className: "icon-remove"
                            }), (0, w.jsx)("div", {
                                className: "card-expired",
                                children: t("Label.Expired")
                            })]
                        })]
                    })
                },
                rd = function(e) {
                    var t = e.translate,
                        n = e.systemFeedbackService,
                        r = e.updatePaymentProfiles,
                        a = e.paymentProfileId,
                        i = e.email,
                        o = R((0, k.useState)(!1), 2),
                        s = o[0],
                        u = o[1],
                        l = R(rs(), 2),
                        c = l[0],
                        d = l[1],
                        f = R(ru(), 2),
                        h = f[0],
                        p = f[1];
                    if (s) return null;
                    var v = t("Label.SavedCreditCard.Email") || "Email",
                        m = i ? "".concat(v, ": ").concat(i) : "";
                    return (0, w.jsxs)("div", {
                        className: "cardContainer",
                        children: [(0, w.jsx)(c, {
                            translate: t,
                            systemFeedbackService: n,
                            cannotDeletePaymentMethodModalService: p,
                            paymentProfileId: a,
                            onDeleteSuccess: function() {
                                r(), u(!0)
                            }
                        }), (0, w.jsx)(h, {
                            translate: t
                        }), (0, w.jsx)("span", {
                            className: "payment-method-image cardIcon paypal"
                        }), (0, w.jsx)("div", {
                            className: "cardNumber font-bold",
                            children: t("Label.Paypal")
                        }), i && (0, w.jsx)("div", {
                            className: "paypalEmail",
                            children: m
                        }), (0, w.jsx)("button", {
                            type: "button",
                            className: "btn-generic-edit-sm",
                            style: {
                                visibility: "hidden"
                            },
                            children: (0, w.jsx)("span", {
                                className: "icon-edit"
                            })
                        }), (0, w.jsx)("button", {
                            type: "button",
                            className: "btn-generic-trash-bin-sm",
                            onClick: function() {
                                d.open(), (0, V.fireEvent)(nt)
                            },
                            children: (0, w.jsx)("span", {
                                className: "icon-trash-bin"
                            })
                        })]
                    })
                },
                rf = function(e) {
                    var t = e.translate,
                        n = e.errorCode,
                        r = "";
                    switch (n) {
                        case nV:
                            r = t("Description.SavedCreditCard.IncorrectCVCErrorMessage") || "Incorrect CVC. Please check your information and try again.";
                            break;
                        case nY:
                            r = t("Description.SavedCreditCard.CardExpiredErrorMessage") || "Card expired. Please review the card details or try a different card.";
                            break;
                        default:
                            return null
                    }
                    return (0, w.jsx)("div", {
                        className: "alert-warning small-oneline form-error-banner",
                        children: r
                    })
                },
                rh = function(e) {
                    var t, n, r = e.translate,
                        a = e.elements,
                        i = e.onFormChange,
                        o = e.updateInputEmail,
                        s = e.stripeEmail,
                        u = e.robloxEmail,
                        l = e.stripeErrorCode,
                        c = R((0, k.useState)(!1), 2),
                        d = c[0],
                        f = c[1],
                        h = R((0, k.useState)(!1), 2),
                        p = h[0],
                        v = h[1],
                        m = R((0, k.useState)("" !== s || "" !== u), 2),
                        y = m[0],
                        b = m[1],
                        g = R((0, k.useState)("" !== s ? s : u), 2),
                        E = g[0],
                        S = g[1],
                        C = R((0, k.useState)(!1), 2),
                        x = C[0],
                        P = C[1],
                        _ = R((0, k.useState)(!1), 2),
                        T = _[0],
                        A = _[1],
                        U = {
                            __html: r("Description.SavedCreditCard.StripeAddPaymentMethodDisclosure", {
                                stripeTermsOfUseLinkStart: '<a href="https://stripe.com/legal/end-users" class="text-link" target="_blank">',
                                stripeTermsOfUseLinkEnd: "</a>",
                                stripePrivacyPolicyLinkStart: '<a href=\'https://stripe.com/privacy\' class="text-link" target="_blank">',
                                stripePrivacyPolicyLinkEnd: "</a>"
                            })
                        },
                        N = r("Description.SavedCreditCard.ProvideEmail"),
                        O = r("Label.InvalidEmailFormat"),
                        I = r("Description.SavedCreditCard.EmailCannotBeChanged");
                    (0, k.useEffect)(function() {
                        t || (null == (t = null == a ? void 0 : a.getElement("payment")) || t.on("ready", function() {
                            null == t || t.clear()
                        }), null == t || t.on("change", function(e) {
                            f(e.complete)
                        })), n || (null == (n = null == a ? void 0 : a.getElement("address")) || n.on("ready", function() {
                            null == n || n.clear()
                        }), null == n || n.on("change", function(e) {
                            v(e.complete)
                        }))
                    }, []), (0, k.useEffect)(function() {
                        i(!d || !p || x || "" === E)
                    }, [d, p, E, x]);
                    var M = function(e) {
                            var t = e.target.value.trim().replace(/\s/g, "");
                            P(T && "" !== t && null === /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.exec(t)), S(t), o(t)
                        },
                        B = (0, w.jsxs)("div", {
                            children: [(0, w.jsxs)("div", {
                                className: "form-group form-has-feedback ".concat(x ? "form-has-error" : ""),
                                children: [(0, w.jsx)("input", {
                                    className: "form-control input-field billing-email-input",
                                    type: "email",
                                    name: "email",
                                    value: E,
                                    onChange: M,
                                    disabled: !0
                                }), (0, w.jsx)("span", {
                                    className: "icon-status-unavailable"
                                })]
                            }), (0, w.jsx)("div", {
                                className: "form-group form-has-feedback",
                                children: (0, w.jsx)("div", {
                                    className: "form-control-label small text email-label",
                                    children: I
                                })
                            })]
                        }),
                        D = (0, w.jsxs)("div", {
                            children: [(0, w.jsxs)("div", {
                                className: "form-group form-has-feedback ".concat(x ? "form-has-error" : ""),
                                children: [(0, w.jsx)("input", {
                                    className: "form-control input-field billing-email-input unset-cursor",
                                    type: "email",
                                    name: "email",
                                    value: E,
                                    onChange: M,
                                    disabled: y
                                }), T ? (0, w.jsx)("button", {
                                    type: "button",
                                    className: "icon-button-override",
                                    onClick: function() {
                                        o(u), S(u), A(!1), b(!0)
                                    },
                                    children: (0, w.jsx)("span", {
                                        className: "icon-regenerate"
                                    })
                                }) : (0, w.jsx)("button", {
                                    type: "button",
                                    className: "icon-button-override",
                                    onClick: function() {
                                        o(""), S(""), A(!0), b(!1)
                                    },
                                    children: (0, w.jsx)("span", {
                                        className: "icon-edit"
                                    })
                                }), x ? (0, w.jsx)("p", {
                                    className: "form-control-label",
                                    children: O
                                }) : null]
                            }), (0, w.jsx)("div", {
                                className: "form-group form-has-feedback",
                                children: (0, w.jsx)("div", {
                                    className: "form-control-label small text email-label",
                                    children: N
                                })
                            })]
                        }),
                        L = (0, w.jsxs)("div", {
                            children: [(0, w.jsx)("div", {
                                className: "form-group form-has-feedback ".concat(x ? "form-has-error" : ""),
                                children: (0, w.jsx)("input", {
                                    className: "form-control input-field billing-email-input",
                                    type: "email",
                                    name: "email",
                                    value: E,
                                    onChange: M,
                                    disabled: y
                                })
                            }), (0, w.jsx)("div", {
                                className: "form-group form-has-feedback",
                                children: (0, w.jsx)("div", {
                                    className: "form-control-label small text email-label",
                                    children: N
                                })
                            })]
                        });
                    return a ? (0, w.jsxs)("div", {
                        className: "add-card-modal",
                        children: [(0, w.jsx)("h2", {
                            className: "stripe-form-header",
                            children: r(n6)
                        }), (0, w.jsx)(eo.PaymentElement, {}), (0, w.jsx)("h2", {
                            className: "stripe-form-header billing-email-header",
                            children: r("Heading.SavedCreditCard.BillingEmail")
                        }), "" !== s ? B : "" !== u ? D : L, (0, w.jsx)("h2", {
                            className: "stripe-form-header",
                            children: r(n8)
                        }), (0, w.jsx)(eo.AddressElement, {
                            options: {
                                mode: "billing"
                            }
                        }), (0, w.jsx)("div", {
                            className: "form-control-label small text stripe-form-disclosure",
                            dangerouslySetInnerHTML: U
                        }), l ? (0, w.jsx)(rf, {
                            translate: r,
                            errorCode: l
                        }) : null]
                    }) : (0, w.jsxs)("div", {
                        className: "add-card-modal",
                        children: [(0, w.jsx)("h2", {
                            className: "stripe-form-header",
                            children: r(n6)
                        }), (0, w.jsx)("span", {
                            className: "spinner spinner-default"
                        }), (0, w.jsx)("h2", {
                            className: "stripe-form-header",
                            children: r(n8)
                        }), (0, w.jsx)("span", {
                            className: "spinner spinner-default"
                        })]
                    })
                };

            function rp(e, t) {
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

            function rv(e, t) {
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
            var rm = function(e) {
                    if (!e.trim()) return null;
                    try {
                        return BigInt(e)
                    } catch (e) {
                        return null
                    }
                },
                ry = function(e) {
                    return e > 0 && e <= Number.MAX_SAFE_INTEGER ? e.toString() : null
                },
                rb = function(e) {
                    var t = rm(e);
                    return null == t ? null : ry(t)
                },
                rg = "blackbird",
                rE = function(e) {
                    var t, n, r, a, i = null != (t = e.userid) ? t : e.user,
                        o = null == i ? void 0 : null != (n = rb(i)) ? n : void 0;
                    if ("string" == typeof o) return {
                        isAuthenticated: !0,
                        id: o,
                        userName: null != (r = e.name) ? r : e.userName,
                        displayName: null != (a = e.displayname) ? a : e.userDisplayName,
                        isPremiumUser: "true" === e.ispremiumuser || "true" === e.userIsPremium,
                        membership: e.membership === rg || e.userMembership === rg ? rg : void 0,
                        isVerified: "true" === e.hasverifiedbadge || "true" === e.userHasVerifiedBadge,
                        isUnder13: "true" === e.isunder13 || "AgeUnder13" === e.userAgeBracket
                    }
                };

            function rS(e) {
                return (rS = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function rC() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (rC = function() {
                    return !!e
                })()
            }
            var rw = n(844);

            function rx(e, t, n) {
                t = rS(t);
                var r = rC() ? Reflect.construct(t, n || [], rS(e).constructor) : t.apply(e, n);
                if (r && ("object" === (0, rw._)(r) || "function" == typeof r)) return r;
                if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                return e
            }

            function rP(e, t) {
                if (!(0, j._)(e, t)) throw TypeError("Cannot call a class as a function")
            }

            function r_(e, t) {
                return (r_ = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function rT(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        writable: !0,
                        configurable: !0
                    }
                }), t && r_(e, t)
            }

            function rA(e, t, n) {
                return (rA = rC() ? Reflect.construct : function(e, t, n) {
                    var r = [null];
                    r.push.apply(r, t);
                    var a = new(Function.bind.apply(e, r));
                    return n && r_(a, n.prototype), a
                }).apply(null, arguments)
            }

            function rU(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (rU = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, n)
                    }

                    function n() {
                        return rA(e, arguments, rS(this).constructor)
                    }
                    return n.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: n,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), r_(n, e)
                })(e)
            }

            function rN(e, t) {
                for (var n = 0; n < t.length; n++) {
                    var r = t[n];
                    r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
                }
            }

            function rR(e, t, n) {
                return t && rN(e.prototype, t), n && rN(e, n), e
            }
            var rk = function() {
                    function e(t) {
                        rP(this, e), nz(this, "value", void 0), this.value = t
                    }
                    return rR(e, [{
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
                            return rI.fromResult(this.cast())
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
                rO = function() {
                    function e(t) {
                        rP(this, e), nz(this, "error", void 0), this.error = t
                    }
                    return rR(e, [{
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
                            return rI.fromResult(this.cast())
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
            (g || (g = {})).all = function(e) {
                var t = e.findIndex(function(e) {
                    return e.isErr()
                });
                return -1 === t ? new rk(e.map(function(e) {
                    return e.getOrNull()
                })) : e[t]
            };
            var rI = function() {
                    function e(t) {
                        rP(this, e), nz(this, "promise", void 0), this.promise = t
                    }
                    return rR(e, [{
                        key: "map",
                        value: function(t) {
                            return new e(this.promise.then(function(e) {
                                return D(function() {
                                    var n, r;
                                    return L(this, function(a) {
                                        switch (a.label) {
                                            case 0:
                                                if (!e.isOk()) return [3, 2];
                                                return r = rk.bind, [4, t(e.value)];
                                            case 1:
                                                return n = new(r.apply(rk, [void 0, a.sent()])), [3, 3];
                                            case 2:
                                                n = e.cast(), a.label = 3;
                                            case 3:
                                                return [2, n]
                                        }
                                    })
                                })()
                            }))
                        }
                    }, {
                        key: "mapErr",
                        value: function(t) {
                            return new e(this.promise.then(function(e) {
                                return D(function() {
                                    var n, r;
                                    return L(this, function(a) {
                                        switch (a.label) {
                                            case 0:
                                                if (!e.isErr()) return [3, 2];
                                                return r = rO.bind, [4, t(e.error)];
                                            case 1:
                                                return n = new(r.apply(rO, [void 0, a.sent()])), [3, 3];
                                            case 2:
                                                n = e.cast(), a.label = 3;
                                            case 3:
                                                return [2, n]
                                        }
                                    })
                                })()
                            }))
                        }
                    }, {
                        key: "andThen",
                        value: function(t) {
                            return new e(this.promise.then(function(n) {
                                if (n.isErr()) return n.cast();
                                var r = t(n.value);
                                return (0, j._)(r, e) ? r.promise : r
                            }))
                        }
                    }, {
                        key: "orElse",
                        value: function(t) {
                            return new e(this.promise.then(function(n) {
                                if (n.isOk()) return n.cast();
                                var r = t(n.error);
                                return (0, j._)(r, e) ? r.promise : r
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
                            return this.promise.then(function(n) {
                                return n.match(e, t)
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
                        value: function(t, n) {
                            return new e(t.then(function(e) {
                                return new rk(e)
                            }).catch(function(e) {
                                return new rO(n(e))
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
                            return (0, j._)(t, e) ? t : (0, j._)(t, Promise) ? e.fromPromiseResult(t) : e.fromResult(t)
                        }
                    }, {
                        key: "fn",
                        value: function(t) {
                            return function() {
                                for (var n = arguments.length, r = Array(n), a = 0; a < n; a++) r[a] = arguments[a];
                                return e.fromPromiseResult(t.apply(void 0, nJ(r)))
                            }
                        }
                    }, {
                        key: "all",
                        value: function(t) {
                            return new e(Promise.all(t).then(g.all))
                        }
                    }]), e
                }(),
                rM = function(e) {
                    return new rk(e)
                },
                rB = function(e) {
                    return new rO(e)
                },
                rD = n(848),
                rL = function(e) {
                    function t(e) {
                        var n;
                        return rP(this, t), nz(n = rx(this, t, [e.error.message, {
                            cause: e
                        }]), "cause", void 0), n.cause = e, n
                    }
                    return rT(t, e), t
                }(rU(Error)),
                rj = function(e) {
                    function t(e) {
                        var n;
                        return rP(this, t), nz(n = rx(this, t, [e.message, {
                            cause: e
                        }]), "cause", void 0), n.cause = e, n
                    }
                    return rT(t, e), t
                }(rU(Error)),
                rF = function(e) {
                    var t;
                    try {
                        t = JSON.parse(e)
                    } catch (e) {
                        return rB(new rL({
                            code: "Syntax",
                            error: e
                        }))
                    }
                    if (null != t && (void 0 === t ? "undefined" : (0, rw._)(t)) === "object") try {
                        (0, rD.scan)(t)
                    } catch (e) {
                        return rB(new rL({
                            code: "PrototypeProperty",
                            error: e
                        }))
                    }
                    return rM(t)
                },
                rG = function(e, t) {
                    try {
                        return rM(JSON.stringify(e, void 0, t))
                    } catch (e) {
                        return rB(new rj(e))
                    }
                },
                rW = function(e) {
                    try {
                        localStorage.removeItem(e)
                    } catch (e) {}
                },
                rH = function(e) {
                    var t = null;
                    try {
                        t = localStorage.getItem(e)
                    } catch (e) {}
                    return null == t ? null : rF(t).getOrNull()
                },
                rV = function(e) {
                    function t(e) {
                        var n;
                        return rP(this, t), nz(n = rx(this, t, [e.code, {
                            cause: e
                        }]), "cause", void 0), n.cause = e, n
                    }
                    return rT(t, e), t
                }(rU(Error)),
                rY = function(e, t) {
                    var n = rG(t);
                    if (n.isErr()) return rB(new rV({
                        code: "JsonSerialization",
                        error: n.error
                    }));
                    try {
                        return localStorage.setItem(e, n.value), rM(null)
                    } catch (e) {
                        return rB(new rV({
                            code: "Unknown",
                            error: e
                        }))
                    }
                },
                rX = 0,
                rq = function(e) {
                    rX = Number.MAX_SAFE_INTEGER;
                    var t = rH("expiryList");
                    if (null != t && 0 !== t.version) return rB(new rV({
                        code: "PageRefreshNeeded"
                    }));
                    var n = Date.now(),
                        r = {},
                        a = !0,
                        i = !1,
                        o = void 0;
                    try {
                        for (var s, u, l = Object.entries(null != (s = null == t ? void 0 : t.data) ? s : {})[Symbol.iterator](); !(a = (u = l.next()).done); a = !0) {
                            var c = R(u.value, 2),
                                d = c[0],
                                f = c[1];
                            if (d === (null == e ? void 0 : e.key)) {
                                var h = e.options.maxAge;
                                if (null != h) {
                                    var p = n + h;
                                    rX = Math.min(rX, p), r[d] = p
                                }
                            } else n >= f ? rW(d) : (rX = Math.min(rX, f), r[d] = f)
                        }
                    } catch (e) {
                        i = !0, o = e
                    } finally {
                        try {
                            a || null == l.return || l.return()
                        } finally {
                            if (i) throw o
                        }
                    }
                    return rY("expiryList", {
                        version: 0,
                        data: r
                    })
                },
                rz = function(e, t) {
                    var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
                    return rq({
                        key: e,
                        options: n
                    }).andThen(function() {
                        return rY(e, t)
                    })
                },
                rK = window.Roblox["core-scripts"].environmentUrls,
                rQ = n.n(rK),
                rJ = globalThis.window,
                rZ = globalThis.document,
                r$ = void 0 === rJ ? void 0 : rJ,
                r0 = void 0 === rZ ? void 0 : rZ,
                r1 = "function" == typeof crypto.randomUUID,
                r2 = function() {
                    var e = new Uint8Array(16);
                    crypto.getRandomValues(e);
                    var t = Array.from(e, function(e, t) {
                        return (6 === t ? 15 & e | 64 : 8 === t ? 63 & e | 128 : e).toString(16).padStart(2, "0")
                    });
                    return "".concat(t.slice(0, 4).join(""), "-").concat(t.slice(4, 6).join(""), "-").concat(t.slice(6, 8).join(""), "-") + "".concat(t.slice(8, 10).join(""), "-").concat(t.slice(10, 16).join(""))
                },
                r3 = window.Roblox["core-scripts"].meta.device,
                r4 = function e() {
                    var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {
                        baseUrl: ""
                    };
                    rP(this, e), nz(this, "configuration", void 0), nz(this, "baseUrl", void 0), this.configuration = t, this.baseUrl = t.baseUrl
                },
                r5 = function() {
                    function e() {
                        var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : new r4;
                        rP(this, e), nz(this, "configuration", void 0), nz(this, "baseUrl", void 0), this.configuration = t, this.baseUrl = t.baseUrl
                    }
                    return rR(e, [{
                        key: "sendEvent",
                        value: function(e) {
                            var t = e.localTime,
                                n = e.target,
                                r = e.eventType,
                                a = e.context,
                                i = e.additionalProperties,
                                o = e.currentUrl,
                                s = e.guestId,
                                u = e.sessionId,
                                l = t.toISOString(),
                                c = new URL("".concat(this.baseUrl, "/pe"));
                            return c.searchParams.append("t", n), c.searchParams.append("evt", r), c.searchParams.append("ctx", a), c.searchParams.append("lt", l), c.searchParams.append("url", o || window.location.href), void 0 !== s && c.searchParams.append("gid", s), void 0 !== u && c.searchParams.append("sid", u), void 0 !== i && Object.keys(i).forEach(function(e) {
                                var t;
                                c.searchParams.append(e, (null != (t = i[e]) ? t : "").toString())
                            }), fetch(c.href, {
                                credentials: "same-origin"
                            })
                        }
                    }, {
                        key: "sendEventViaImg",
                        value: function(e, t) {
                            var n = this.buildEventUrl(e),
                                r = new Image;
                            return r.src = n.href, r.onload = function() {
                                void 0 !== t && t(!0)
                            }, r.onerror = function() {
                                void 0 !== t && t(!1)
                            }, r
                        }
                    }, {
                        key: "sendEventViaFetch",
                        value: function(e, t) {
                            return D(function() {
                                var n;
                                return L(this, function(r) {
                                    switch (r.label) {
                                        case 0:
                                            return [4, fetch(this.buildEventUrl(e).href, {
                                                mode: "cors",
                                                credentials: "include",
                                                keepalive: !0
                                            }).then(function(e) {
                                                return e.ok
                                            }, function() {
                                                return !1
                                            })];
                                        case 1:
                                            return n = r.sent(), null == t || t(n), [2]
                                    }
                                })
                            }).call(this)
                        }
                    }, {
                        key: "buildEventUrl",
                        value: function(e) {
                            var t = e.localTime,
                                n = e.target,
                                r = e.eventType,
                                a = e.context,
                                i = e.additionalProperties,
                                o = e.currentUrl,
                                s = e.guestId,
                                u = e.sessionId,
                                l = t.toISOString(),
                                c = new URL("".concat(this.baseUrl, "/e.png"));
                            return c.searchParams.append("t", n), c.searchParams.append("evt", r), c.searchParams.append("ctx", a), c.searchParams.append("lt", l), c.searchParams.append("url", o || window.location.href), void 0 !== s && c.searchParams.append("gid", s), void 0 !== u && c.searchParams.append("sid", u), void 0 !== i && Object.keys(i).forEach(function(e) {
                                var t;
                                c.searchParams.append(e, (null != (t = i[e]) ? t : "").toString())
                            }), c
                        }
                    }]), e
                }(),
                r6 = function(e) {
                    var t, n = "".concat(e, "="),
                        r = null == (t = document.cookie.split("; ").find(function(e) {
                            return e.startsWith(n)
                        })) ? void 0 : t.slice(n.length);
                    return null == r ? null : {
                        name: e,
                        value: decodeURIComponent(r)
                    }
                },
                r8 = function(e, t, n) {
                    var r, a = null == n.sameSite ? "" : ";samesite=".concat(n.sameSite),
                        i = null == n.domain ? "" : ";domain=".concat(n.domain),
                        o = ";path=".concat(null != (r = n.path) ? r : "/"),
                        s = null == n.expires ? "" : ";expires=".concat(n.expires.toUTCString()),
                        u = null == n.maxAge ? "" : ";max-age=".concat(n.maxAge);
                    document.cookie = "".concat(e, "=").concat(encodeURIComponent(t), ";secure").concat(a).concat(i).concat(o).concat(s).concat(u)
                },
                r7 = function(e, t, n) {
                    r8(e, t, n)
                },
                r9 = function(e, t) {
                    r8(e, "", {
                        domain: t.domain,
                        path: t.path,
                        expires: new Date(0)
                    })
                },
                ae = window.Roblox["core-lib"].index,
                at = "RBXPaymentsFlowContext",
                an = {
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
                ar = {
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
                    NATIVE_PURCHASE_UI_SHOWN_TIME: "NativePurchaseUiShownTime",
                    EARLY_CLICK: "EarlyClick",
                    BUY_ROBUX_HYDRATION: "BuyRobuxHydration"
                },
                aa = {
                    VIEW_SHOWN: "ViewShown",
                    USER_INPUT: "UserInput"
                },
                ai = rp(nK({}, {
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
                ao = {
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
                as = "Game Pass",
                au = "Private Server",
                al = "Bundle",
                ac = "Package",
                ad = "Product",
                af = {
                    FLOW_CONTINUE: "payment-user-journey:continue",
                    FLOW_REFERRER_VALID: "payment-user-journey:referrer-valid"
                },
                ah = function() {
                    return null != r$ && null != r0
                },
                ap = function() {
                    return {
                        domain: ".".concat(rQ().domain),
                        maxAge: 600
                    }
                },
                av = function() {
                    function e(t, n) {
                        rP(this, e), nz(this, "purchaseFlowUuid", void 0), nz(this, "triggeringContext", void 0), this.purchaseFlowUuid = t, this.triggeringContext = n
                    }
                    return rR(e, [{
                        key: "save",
                        value: function() {
                            if (ah()) {
                                var e, t, n = "".concat(null != (e = this.purchaseFlowUuid) ? e : "", ",").concat(null != (t = this.triggeringContext) ? t : ""),
                                    r = ap();
                                r7(at, n, {
                                    domain: r.domain,
                                    maxAge: r.maxAge
                                })
                            }
                        }
                    }], [{
                        key: "stop",
                        value: function() {
                            ah() && r9(at, {
                                domain: ap().domain
                            })
                        }
                    }, {
                        key: "loadFromCookie",
                        value: function() {
                            if (!ah()) return null;
                            var t = r6(at);
                            if (null == t || "" === t.value) return null;
                            var n = R(t.value.split(","), 2),
                                r = n[0],
                                a = n[1];
                            return new e("" === r ? void 0 : r, null != a && (0, ae.isStringEnum)(an, a) ? a : void 0)
                        }
                    }]), e
                }();

            function am(e, t) {
                var n = t.publish,
                    r = t.captureException,
                    a = t.featureName;

                function i(e, t, n) {
                    if (null != n) {
                        var i = (0, j._)(n, Error) ? n.name || "Error" : "UnknownError",
                            o = a ? "".concat(a, "_").concat(e) : e;
                        return null == r || r(n, {
                            error_counter: o
                        }), rp(nK({}, t), {
                            errorType: i
                        })
                    }
                    return t
                }
                return {
                    trackCounter: function() {
                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                        var a = R(t, 2);
                        n(a[0], a[1])
                    },
                    trackError: function() {
                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                        var a = R(t, 3),
                            o = a[0],
                            s = a[1],
                            u = a[2],
                            l = i(o, rp(nK({}, null != s ? s : {}), {
                                severity: "error"
                            }), u);
                        n(o, l)
                    },
                    trackCriticalError: function() {
                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                        var a = R(t, 3),
                            o = a[0],
                            s = a[1],
                            u = a[2],
                            l = i(o, rp(nK({}, null != s ? s : {}), {
                                severity: "critical"
                            }), u);
                        n(o, l)
                    }
                }
            }

            function ay() {
                return null != E || (E = "".concat(rQ().apiGatewayUrl.replace(/\/$/, ""), "/experience-signals-ingest/public")), E
            }
            var ab = function() {};

            function ag(e, t) {
                fetch("".concat(ay()).concat(e), {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-protobuf"
                    },
                    body: t,
                    credentials: "include",
                    keepalive: !0
                }).catch(ab)
            }

            function aE(e, t) {
                D(function() {
                    var e, n, r, a, i, o, s, u, l, c, d, f, h;
                    return L(this, function(p) {
                        switch (p.label) {
                            case 0:
                                if ("u" < typeof CompressionStream) return [2, {
                                    body: t.buffer,
                                    compressed: !1
                                }];
                                return (n = (e = new CompressionStream("gzip")).writable.getWriter()).write(t).catch(ab), n.close().catch(ab), r = [], [4, (a = e.readable.getReader()).read()];
                            case 1:
                                i = p.sent(), p.label = 2;
                            case 2:
                                if (i.done) return [3, 4];
                                return r.push(i.value), [4, a.read()];
                            case 3:
                                return i = p.sent(), [3, 2];
                            case 4:
                                o = new Uint8Array(r.reduce(function(e, t) {
                                    return e + t.length
                                }, 0)), s = 0, u = !0, l = !1, c = void 0;
                                try {
                                    for (d = r[Symbol.iterator](); !(u = (f = d.next()).done); u = !0) h = f.value, o.set(h, s), s += h.length
                                } catch (e) {
                                    l = !0, c = e
                                } finally {
                                    try {
                                        u || null == d.return || d.return()
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
                })().then(function(t) {
                    var n = t.body,
                        r = t.compressed,
                        a = {
                            "Content-Type": "application/x-protobuf"
                        };
                    return r && (a["Content-Encoding"] = "gzip"), fetch("".concat(ay()).concat(e), {
                        method: "POST",
                        headers: a,
                        body: n,
                        credentials: "include",
                        keepalive: !0
                    })
                }).catch(ab)
            }
            var aS = function(e, t) {
                    return e << 3 | t
                },
                aC = aS(1, 2),
                aw = aS(2, 2),
                ax = aS(5, 2),
                aP = aS(6, 2),
                a_ = aS(8, 2),
                aT = aS(1, 2),
                aA = aS(2, 1),
                aU = aS(3, 0),
                aN = aS(5, 2),
                aR = aS(1, 2),
                ak = aS(2, 1),
                aO = aS(3, 0),
                aI = aS(4, 2),
                aM = aS(5, 2),
                aB = aS(6, 0),
                aD = aS(8, 2),
                aL = aS(4, 0),
                aj = aS(6, 2),
                aF = aS(7, 2),
                aG = aS(1, 0),
                aW = aS(2, 2),
                aH = aS(1, 2),
                aV = aS(2, 2),
                aY = aS(1, 2),
                aX = aS(1, 2),
                aq = aS(2, 2),
                az = aS(1, 2),
                aK = "eventstream.enginetelemetry.EngineTelemetryBatchEvent",
                aQ = new TextEncoder,
                aJ = function() {
                    function e() {
                        rP(this, e), nz(this, "buf", [])
                    }
                    return rR(e, [{
                        key: "writeVarint",
                        value: function(e) {
                            var t = (void 0 === e ? "undefined" : (0, rw._)(e)) === "bigint" ? e : BigInt(Math.trunc(e));
                            for (t < BigInt(0) && (t += BigInt(1) << BigInt(64)); t > BigInt(127);) this.buf.push(128 | Number(t & BigInt(127))), t >>= BigInt(7);
                            this.buf.push(Number(t))
                        }
                    }, {
                        key: "writeString",
                        value: function(e) {
                            var t = aQ.encode(e);
                            this.writeVarint(t.length);
                            var n = !0,
                                r = !1,
                                a = void 0;
                            try {
                                for (var i, o = t[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) {
                                    var s = i.value;
                                    this.buf.push(s)
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

            function aZ(e, t, n) {
                var r = new aJ;
                return r.writeVarint(aS(1, 2)), r.writeString(e), r.writeVarint(t), n(r), r.toBytes()
            }

            function a$(e) {
                var t = new aJ,
                    n = !0,
                    r = !1,
                    a = void 0;
                try {
                    for (var i, o = Object.entries(e)[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) ! function() {
                        var e = R(i.value, 2),
                            n = e[0],
                            r = e[1];
                        if ("string" == typeof r) {
                            var a = aZ(n, aS(2, 2), function(e) {
                                e.writeString(r)
                            });
                            t.writeVarint(ax), t.writeBytes(a)
                        } else if ("boolean" == typeof r) {
                            var o = aZ(n, aS(2, 0), function(e) {
                                e.writeVarint(+!!r)
                            });
                            t.writeVarint(aP), t.writeBytes(o)
                        } else if ((void 0 === r ? "undefined" : (0, rw._)(r)) === "bigint") {
                            var s = aZ(n, aS(2, 0), function(e) {
                                e.writeVarint(r)
                            });
                            t.writeVarint(aw), t.writeBytes(s)
                        } else if ("number" == typeof r)
                            if (Number.isFinite(r))
                                if (Number.isInteger(r) && r >= -0x80000000 && r <= 0x7fffffff) {
                                    var u = aZ(n, aS(2, 0), function(e) {
                                        e.writeVarint(r)
                                    });
                                    t.writeVarint(aC), t.writeBytes(u)
                                } else if (Number.isInteger(r)) {
                            var l = aZ(n, aS(2, 0), function(e) {
                                e.writeVarint(BigInt(r))
                            });
                            t.writeVarint(aw), t.writeBytes(l)
                        } else {
                            var c = aZ(n, aS(2, 1), function(e) {
                                e.writeDouble(r)
                            });
                            t.writeVarint(a_), t.writeBytes(c)
                        } else {
                            var d = aZ(n, aS(2, 2), function(e) {
                                e.writeString(String(r))
                            });
                            t.writeVarint(ax), t.writeBytes(d)
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
            }

            function a0(e) {
                var t = new aJ;
                if (t.writeVarint(aT), t.writeString(e.name), t.writeVarint(aA), t.writeDouble(e.value), t.writeVarint(aU), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
                    var n = a$(e.attributes);
                    t.writeVarint(aN), t.writeBytes(n)
                }
                return t.toBytes()
            }

            function a1(e) {
                var t = new aJ;
                if (t.writeVarint(aR), t.writeString(e.name), t.writeVarint(ak), t.writeDouble(e.sum), t.writeVarint(aO), t.writeVarint(e.count), e.countsInBuckets.length > 0) {
                    var n = new aJ,
                        r = !0,
                        a = !1,
                        i = void 0;
                    try {
                        for (var o, s = e.countsInBuckets[Symbol.iterator](); !(r = (o = s.next()).done); r = !0) {
                            var u = o.value;
                            n.writeVarint(u)
                        }
                    } catch (e) {
                        a = !0, i = e
                    } finally {
                        try {
                            r || null == s.return || s.return()
                        } finally {
                            if (a) throw i
                        }
                    }
                    var l = n.toBytes();
                    t.writeVarint(aI), t.writeBytes(l)
                }
                if (e.bucketIndices.length > 0) {
                    var c = new aJ,
                        d = !0,
                        f = !1,
                        h = void 0;
                    try {
                        for (var p, v = e.bucketIndices[Symbol.iterator](); !(d = (p = v.next()).done); d = !0) {
                            var m = p.value;
                            c.writeVarint(m)
                        }
                    } catch (e) {
                        f = !0, h = e
                    } finally {
                        try {
                            d || null == v.return || v.return()
                        } finally {
                            if (f) throw h
                        }
                    }
                    var y = c.toBytes();
                    t.writeVarint(aM), t.writeBytes(y)
                }
                if (t.writeVarint(aB), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
                    var b = a$(e.attributes);
                    t.writeVarint(aD), t.writeBytes(b)
                }
                return t.toBytes()
            }

            function a2(e, t, n) {
                var r = new aJ;
                r.writeVarint(aL), r.writeVarint(n);
                var a = !0,
                    i = !1,
                    o = void 0;
                try {
                    for (var s, u = e[Symbol.iterator](); !(a = (s = u.next()).done); a = !0) {
                        var l = s.value;
                        r.writeVarint(aj), r.writeBytes(l)
                    }
                } catch (e) {
                    i = !0, o = e
                } finally {
                    try {
                        a || null == u.return || u.return()
                    } finally {
                        if (i) throw o
                    }
                }
                var c = !0,
                    d = !1,
                    f = void 0;
                try {
                    for (var h, p = t[Symbol.iterator](); !(c = (h = p.next()).done); c = !0) {
                        var v = h.value;
                        r.writeVarint(aF), r.writeBytes(v)
                    }
                } catch (e) {
                    d = !0, f = e
                } finally {
                    try {
                        c || null == p.return || p.return()
                    } finally {
                        if (d) throw f
                    }
                }
                return r.toBytes()
            }

            function a3(e, t, n, r, a) {
                var i = new aJ;
                i.writeVarint(aG), i.writeVarint(r), i.writeVarint(aW), i.writeString(a), i.writeVarint(aL), i.writeVarint(n);
                var o = !0,
                    s = !1,
                    u = void 0;
                try {
                    for (var l, c = e[Symbol.iterator](); !(o = (l = c.next()).done); o = !0) {
                        var d = l.value;
                        i.writeVarint(aj), i.writeBytes(d)
                    }
                } catch (e) {
                    s = !0, u = e
                } finally {
                    try {
                        o || null == c.return || c.return()
                    } finally {
                        if (s) throw u
                    }
                }
                var f = !0,
                    h = !1,
                    p = void 0;
                try {
                    for (var v, m = t[Symbol.iterator](); !(f = (v = m.next()).done); f = !0) {
                        var y = v.value;
                        i.writeVarint(aF), i.writeBytes(y)
                    }
                } catch (e) {
                    h = !0, p = e
                } finally {
                    try {
                        f || null == m.return || m.return()
                    } finally {
                        if (h) throw p
                    }
                }
                return i.toBytes()
            }

            function a4(e) {
                var t = new aJ;
                t.writeVarint(aH), t.writeString(aK), t.writeVarint(aV), t.writeBytes(e);
                var n = t.toBytes(),
                    r = new aJ;
                return r.writeVarint(aY), r.writeBytes(n), r.toBytes()
            }

            function a5(e) {
                var t = new aJ;
                t.writeVarint(aX), t.writeString(aK);
                var n = !0,
                    r = !1,
                    a = void 0;
                try {
                    for (var i, o = e[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) {
                        var s = i.value;
                        t.writeVarint(aq), t.writeBytes(s)
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
                var u = t.toBytes(),
                    l = new aJ;
                return l.writeVarint(az), l.writeBytes(u), l.toBytes()
            }
            var a6 = /^[a-zA-Z_][a-zA-Z0-9_]*$/;

            function a8(e) {
                return a6.test(e)
            }
            var a7 = [],
                a9 = !1,
                ie = !1;

            function it(e, t) {
                var n = e.map(function(e) {
                        return {
                            name: e.name,
                            value: e.value,
                            timestampMs: e.timestampMs,
                            attributes: e.attributes
                        }
                    }),
                    r = BigInt(Date.now());
                !0 === t || ie || "u" > typeof document && "hidden" === document.visibilityState ? ag("/v1/events/single", a4(a2(n.map(a0), [], r)).buffer) : aE("/v1/events/single", a4(a2(n.map(a0), [], r)))
            }

            function ir() {
                var e = !0,
                    t = !1,
                    n = void 0;
                try {
                    for (var r, a = a7[Symbol.iterator](); !(e = (r = a.next()).done); e = !0) {
                        var i = r.value.splice(0);
                        0 !== i.length && it(i, !0)
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

            function ia(e, t) {
                var n, r, a, i = Math.max(1, null != (n = null == t ? void 0 : t.batchSize) ? n : 10),
                    o = null != (r = null == t ? void 0 : t.batchIntervalMs) ? r : 250;

                function s(e, n) {
                    (null == t ? void 0 : t.onError) ? t.onError(e, n): console.error(e, n)
                }
                if (!a8(e)) return s('@rbx/web-telemetry: invalid featureName "'.concat(e, '"'), {
                        name: e
                    }),
                    function() {};
                var u = [];
                return a7.push(u), a9 || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                        "hidden" === document.visibilityState && ir()
                    }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                        ie = !0, ir()
                    }), a9 = !0),
                    function(t, n, r) {
                        var l = "".concat(e, "_").concat(t);
                        if (! function(e, t) {
                                if (!a8(e)) return !1;
                                if (t) {
                                    var n = !0,
                                        r = !1,
                                        a = void 0;
                                    try {
                                        for (var i, o = Object.keys(t)[Symbol.iterator](); !(n = (i = o.next()).done); n = !0) {
                                            var s = i.value;
                                            if (!a8(s)) return !1
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
                            }(l, n)) return void s("@rbx/web-telemetry: invalid event name or attribute key", {
                            name: t,
                            attributes: n
                        });
                        var c = null != r ? r : 1;
                        if (!Number.isFinite(c)) return void s("@rbx/web-telemetry: value must be a finite number", {
                            name: t,
                            attributes: n
                        });
                        var d = n && Object.keys(n).length > 0 ? n : void 0;
                        u.push({
                            name: l,
                            attributes: d,
                            value: c,
                            timestampMs: BigInt(Date.now())
                        }), u.length >= i ? (void 0 !== a && (clearTimeout(a), a = void 0), it(u.splice(0, i))) : void 0 === a && (a = setTimeout(function() {
                            for (a = void 0; u.length > 0;) it(u.splice(0, i))
                        }, o))
                    }
            }
            var ii = function(e, t) {
                    var n;
                    null == r$ || null == (n = r$.Sentry) || n.captureException(e, t ? {
                        tags: t
                    } : void 0)
                },
                io = {
                    featureName: "PaymentsFlowAnalytics",
                    team: "Economy > Payments & Fraud",
                    features: {
                        PaymentFlow: {
                            counters: ["UserPaymentFlowMidPurchaseStepTriggeredWithoutCtx", "UserPaymentFlowFlowEnded", {
                                name: "UserPaymentFlowEventSent",
                                dimensions: ["transport", "requestedTransport", "eventName"]
                            }, {
                                name: "UserPaymentFlowEventFetchFailed",
                                dimensions: ["eventName", "viewName", "platform", "visibility", "elapsed"]
                            }, {
                                name: "UserPaymentFlowEventImgFailed",
                                dimensions: ["eventName", "viewName", "platform", "visibility", "elapsed"]
                            }],
                            errors: ["UserPaymentFlowWrongUsageOfMethod", "UserPaymentFlowSendEventWithoutUuidOrCtx", "UserPaymentFlowLoadPreExistingCtxError", "UserPaymentFlowSendStatusEventError", "UserPaymentFlowSendUserEventError", "UserPaymentFlowStartFlowError", "UserPaymentFlowFlowEndedWithoutTriggerContext", "UserPaymentFlowSendEventKeepaliveError"]
                        }
                    }
                },
                is = ia(io.featureName),
                iu = am(io, {
                    publish: is,
                    captureException: ii,
                    featureName: io.featureName
                }),
                il = iu.trackCounter,
                ic = iu.trackError,
                id = "__rbxPaymentsFlowListenersAttached",
                ih = function(e) {
                    var t = e.currentTarget;
                    return null != t && "innerText" in t && "string" == typeof t.innerText ? t.innerText : ""
                },
                ip = function(e) {
                    var t;
                    null == r0 || null == (t = r0.querySelector("#header li a.robux-menu-btn")) || t.addEventListener("click", function(t) {
                        e.sendUserPurchaseFlowEvent({
                            triggerContext: an.WEB_ROBUX_PURCHASE,
                            isMidPurchaseStep: !1,
                            viewName: ar.NAVIGATION_MENU,
                            purchaseEventType: aa.USER_INPUT,
                            viewMessage: ih(t)
                        })
                    })
                },
                iv = function(e) {
                    var t, n;
                    null == r0 || null == (t = r0.querySelector("#item-details #upgrade-button")) || t.addEventListener("click", function() {
                        e.sendUserPurchaseFlowEvent({
                            triggerContext: an.WEB_PREMIUM_PURCHASE,
                            isMidPurchaseStep: !1,
                            viewName: ar.PREMIUM_UPSELL,
                            purchaseEventType: aa.USER_INPUT,
                            viewMessage: ai.GET_PREMIUM
                        })
                    }), null == r0 || null == (n = r0.querySelector("#item-details .premium-prompt a")) || n.addEventListener("click", function(t) {
                        e.sendUserPurchaseFlowEvent({
                            triggerContext: an.WEB_PREMIUM_PURCHASE,
                            isMidPurchaseStep: !1,
                            viewName: ar.PREMIUM_UPSELL,
                            purchaseEventType: aa.USER_INPUT,
                            viewMessage: ih(t)
                        })
                    })
                },
                im = function() {
                    for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    var r = !0,
                        a = !1,
                        i = void 0;
                    try {
                        for (var o, s = t[Symbol.iterator](); !(r = (o = s.next()).done); r = !0) {
                            var u = o.value;
                            if (null != u && "" !== u) return u
                        }
                    } catch (e) {
                        a = !0, i = e
                    } finally {
                        try {
                            r || null == s.return || s.return()
                        } finally {
                            if (a) throw i
                        }
                    }
                    return ""
                },
                iy = "__rbxPaymentsFlowUuid",
                ib = function(e) {
                    if (null != e && "type" in e && "string" == typeof e.type) return e.type
                },
                ig = [{
                    web: an.WEB_ROBUX_PURCHASE,
                    webview: an.WEBVIEW_ROBUX_PURCHASE,
                    mobileWeb: an.MOBILE_WEB_ROBUX_PURCHASE
                }, {
                    web: an.WEB_PREMIUM_PURCHASE,
                    webview: an.WEBVIEW_PREMIUM_PURCHASE,
                    mobileWeb: an.MOBILE_WEB_PREMIUM_PURCHASE
                }, {
                    web: an.WEB_ROBLOX_PLUS_PURCHASE,
                    webview: an.WEBVIEW_ROBLOX_PLUS_PURCHASE,
                    mobileWeb: an.MOBILE_WEB_ROBLOX_PLUS_PURCHASE
                }],
                iE = new r5(new r4({
                    baseUrl: "https://ecsv2.".concat(rQ().domain, "/www")
                })),
                iS = function() {
                    return "function" == typeof(null == r$ ? void 0 : r$.fetch)
                },
                iC = function() {
                    var e = (0, r3.getDeviceMeta)();
                    return (null == e ? void 0 : e.isIosApp) ? "iosApp" : (null == e ? void 0 : e.isAndroidApp) ? "androidApp" : [null == e ? void 0 : e.isInApp, null == e ? void 0 : e.isAmazonApp, null == e ? void 0 : e.isUWPApp, null == e ? void 0 : e.isXboxApp, null == e ? void 0 : e.isWin32App, null == e ? void 0 : e.isUniversalApp, null == e ? void 0 : e.isSamsungGalaxyStoreApp, null == e ? void 0 : e.isPcGdkApp, null == e ? void 0 : e.isStudio].some(function(e) {
                        return !0 === e
                    }) ? "otherApp" : "browser"
                },
                iw = function() {
                    var e;
                    return null != (e = null == r0 ? void 0 : r0.visibilityState) ? e : "unknown"
                },
                ix = function(e, t, n, r, a) {
                    var i;
                    il(e, {
                        eventName: t,
                        viewName: n,
                        platform: r,
                        visibility: iw(),
                        elapsed: (i = Date.now() - a) < 100 ? "lt100ms" : i < 1e3 ? "lt1s" : i < 1e4 ? "lt10s" : "gte10s"
                    })
                },
                iP = function(e, t, n, r) {
                    var a = iC(),
                        i = null != n ? n : "",
                        o = "fetch" === r && iS() ? "fetch" : "img";
                    il("UserPaymentFlowEventSent", {
                        transport: o,
                        requestedTransport: r,
                        eventName: t
                    });
                    var s = Date.now();
                    "img" === o ? iE.sendEventViaImg(e, function(e) {
                        e || ix("UserPaymentFlowEventImgFailed", t, i, a, s)
                    }) : iE.sendEventViaFetch(e, function(e) {
                        e || ix("UserPaymentFlowEventFetchFailed", t, i, a, s)
                    }).catch(function(e) {
                        ic("UserPaymentFlowSendEventKeepaliveError", null, e)
                    })
                },
                i_ = new(function() {
                    function e() {
                        rP(this, e), nz(this, "purchaseFlowUuid", ""), nz(this, "triggerContext", void 0), nz(this, "ENUM_TRIGGERING_CONTEXT", an), nz(this, "ENUM_VIEW_NAME", ar), nz(this, "ENUM_PURCHASE_EVENT_TYPE", aa), nz(this, "ENUM_VIEW_MESSAGE", ai), nz(this, "ENUM_PURCHASE_STATUS", ao), nz(this, "ENUM_CUSTOM_EVENT", af), nz(this, "eventMetadata", {}), nz(this, "webStack", void 0), ah() && this.loadOrStartPaymentFlow()
                    }
                    return rR(e, [{
                        key: "loadOrStartPaymentFlow",
                        value: function() {
                            if (null != r$) try {
                                if (this.purchaseFlowUuid || this.tryLoadPreExistingCtx(), this.purchaseFlowUuid || this.adoptSharedFlowUuid(), !this.purchaseFlowUuid) {
                                    var t = e.getUrlAnalyticId();
                                    this.purchaseFlowUuid = null != t ? t : r1 ? crypto.randomUUID() : r2(), this.writePaymentFlowContextIntoCookie()
                                }
                                this.publishSharedFlowUuid()
                            } catch (e) {
                                ic("UserPaymentFlowStartFlowError", null, e)
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
                            ah() && (this.webStack = e)
                        }
                    }, {
                        key: "startRobuxUpsellFlow",
                        value: function(e) {
                            var t = e.assetType,
                                n = e.isReseller,
                                r = e.itemId;
                            this.eventMetadata.item_type = t, this.eventMetadata.item_id = void 0 === r ? "" : r, t === as ? this.triggerContext = an.WEB_GAME_PASS_ROBUX_UPSELL : t === ad ? this.triggerContext = an.WEB_DEVELOPER_PRODUCT_ROBUX_UPSELL : "Place" === t ? this.triggerContext = an.WEB_PAID_GAME_ROBUX_UPSELL : t === au ? this.triggerContext = an.WEB_PRIVATE_SERVER_ROBUX_UPSELL : t === al || t === ac ? this.triggerContext = an.WEB_CATALOG_BUNDLE_ITEM_ROBUX_UPSELL : void 0 !== n && n ? this.triggerContext = an.WEB_CATALOG_COLLECTIVE_ITEM_ROBUX_UPSELL : this.triggerContext = an.WEB_CATALOG_ROBUX_UPSELL, this.writePaymentFlowContextIntoCookie()
                        }
                    }, {
                        key: "startRobloxPlusUpsellFlow",
                        value: function(e) {
                            var t = e.assetType,
                                n = e.isReseller,
                                r = e.itemId;
                            if (this.eventMetadata.item_type = t, this.eventMetadata.item_id = void 0 === r ? "" : r, void 0 !== n && n) this.triggerContext = an.WEB_CATALOG_RESALE_ITEM_PLUS_UPSELL;
                            else switch (t) {
                                case as:
                                    this.triggerContext = an.WEB_GAME_PASS_PLUS_UPSELL;
                                    break;
                                case ad:
                                    this.triggerContext = an.WEB_DEVELOPER_PRODUCT_PLUS_UPSELL;
                                    break;
                                case au:
                                    this.triggerContext = an.WEB_PRIVATE_SERVER_PLUS_UPSELL;
                                    break;
                                case al:
                                case ac:
                                    this.triggerContext = an.WEB_CATALOG_BUNDLE_ITEM_PLUS_UPSELL;
                                    break;
                                case "Subscription":
                                    this.triggerContext = an.WEB_DEVELOPER_SUBSCRIPTION_PLUS_UPSELL;
                                    break;
                                default:
                                    this.triggerContext = an.WEB_CATALOG_SINGLE_ITEM_PLUS_UPSELL
                            }
                            this.writePaymentFlowContextIntoCookie()
                        }
                    }, {
                        key: "sendUserPurchaseFlowEvent",
                        value: function(e) {
                            this.sendFlowEvent(e, "img")
                        }
                    }, {
                        key: "sendUserPurchaseFlowEventViaFetch",
                        value: function(e) {
                            this.sendFlowEvent(e, "fetch")
                        }
                    }, {
                        key: "sendFlowEvent",
                        value: function(t, n) {
                            var r = t.triggerContext,
                                a = t.isMidPurchaseStep,
                                i = t.viewName,
                                o = t.purchaseEventType,
                                s = t.viewMessage,
                                u = t.eventMetadata,
                                l = t.isTerminalView;
                            if (ah()) try {
                                var c = e.reclassifyPlatformTriggeringContext({
                                    triggerContext: r
                                });
                                if (this.eventMetadata = nK({}, this.eventMetadata, void 0 === u ? {} : u), !i && !o && !s) return void ic("UserPaymentFlowWrongUsageOfMethod");
                                this.adoptSharedTriggerContext(), !this.triggerContext && (this.triggerContext = c, this.writePaymentFlowContextIntoCookie(), a && il("UserPaymentFlowMidPurchaseStepTriggeredWithoutCtx")), this.sendEvent({
                                    eventName: "UserPurchaseFlow",
                                    viewName: i,
                                    purchaseEventType: o,
                                    viewMessage: s
                                }, n), void 0 !== l && l && this.handleTerminalPage(n)
                            } catch (e) {
                                ic("UserPaymentFlowSendUserEventError", null, e)
                            }
                        }
                    }, {
                        key: "sendUserPurchaseStatusEvent",
                        value: function(e) {
                            this.sendStatusEvent(e, "img")
                        }
                    }, {
                        key: "sendUserPurchaseStatusEventViaFetch",
                        value: function(e) {
                            this.sendStatusEvent(e, "fetch")
                        }
                    }, {
                        key: "sendStatusEvent",
                        value: function(t, n) {
                            var r = t.triggerContext,
                                a = t.status,
                                i = t.viewMessage,
                                o = t.viewName;
                            if (ah()) try {
                                var s = e.reclassifyPlatformTriggeringContext({
                                    triggerContext: r
                                });
                                if (!a && !i && !o) return void ic("UserPaymentFlowWrongUsageOfMethod");
                                this.adoptSharedTriggerContext(), this.triggerContext || (this.triggerContext = s, this.writePaymentFlowContextIntoCookie()), this.sendEvent({
                                    eventName: "UserPurchaseStatus",
                                    viewName: o,
                                    viewMessage: i,
                                    status: a
                                }, n), e.isTerminalView(o) && this.handleTerminalPage(n)
                            } catch (e) {
                                ic("UserPaymentFlowSendStatusEventError", null, e)
                            }
                        }
                    }, {
                        key: "adoptSharedTriggerContext",
                        value: function() {
                            if (!this.triggerContext) {
                                this.adoptSharedFlowUuid();
                                var e = av.loadFromCookie();
                                (null == e ? void 0 : e.triggeringContext) != null && e.purchaseFlowUuid === this.purchaseFlowUuid && (this.triggerContext = e.triggeringContext)
                            }
                        }
                    }, {
                        key: "adoptSharedFlowUuid",
                        value: function() {
                            if (null != r$ && iy in r$) {
                                var e = r$[iy];
                                "string" == typeof e && "" !== e && (this.purchaseFlowUuid = e)
                            }
                        }
                    }, {
                        key: "publishSharedFlowUuid",
                        value: function() {
                            null != r$ && this.purchaseFlowUuid && Object.assign(r$, nz({}, iy, this.purchaseFlowUuid))
                        }
                    }, {
                        key: "writePaymentFlowContextIntoCookie",
                        value: function() {
                            this.adoptSharedFlowUuid(), new av(this.purchaseFlowUuid, this.triggerContext).save()
                        }
                    }, {
                        key: "sendEvent",
                        value: function(t, n) {
                            var r = t.eventName,
                                a = t.viewName,
                                i = t.purchaseEventType,
                                o = t.viewMessage,
                                s = t.status;
                            if (this.adoptSharedFlowUuid(), !this.purchaseFlowUuid || !this.triggerContext) return void ic("UserPaymentFlowSendEventWithoutUuidOrCtx");
                            if (null != r$) {
                                var u = e.getReferralUrl(),
                                    l = e.extractView(u),
                                    c = e.extractView(r$.location.href),
                                    d = "fetch" === n && iS() ? "fetch" : "img",
                                    f = JSON.stringify(rp(nK({}, this.eventMetadata, void 0 === this.webStack ? {} : {
                                        webStack: this.webStack
                                    }), {
                                        eventTransport: d
                                    }));
                                iP({
                                    target: "www",
                                    localTime: new Date,
                                    eventType: r,
                                    context: this.triggerContext,
                                    additionalProperties: {
                                        purchase_flow_uuid: this.purchaseFlowUuid,
                                        view_name: a,
                                        purchase_event_type: i,
                                        view_message: o,
                                        status: s,
                                        refurl: u.substring(0, 200),
                                        prev_view_path: l,
                                        current_view_path: c,
                                        event_metadata: f
                                    }
                                }, r, a, n)
                            }
                        }
                    }, {
                        key: "tryLoadPreExistingCtx",
                        value: function() {
                            if (null != r0 && null != r$) try {
                                var e = r0.referrer,
                                    t = e && new URL(e).hostname.endsWith(rQ().domain),
                                    n = r$.performance.getEntriesByType("navigation")[0],
                                    r = ib(n);
                                if (!t && "back_forward" !== r && "reload" !== r) return;
                                var a = av.loadFromCookie();
                                a && (a.purchaseFlowUuid && (this.purchaseFlowUuid = a.purchaseFlowUuid), a.triggeringContext && (this.triggerContext = a.triggeringContext))
                            } catch (e) {
                                ic("UserPaymentFlowLoadPreExistingCtxError", null, e)
                            }
                        }
                    }, {
                        key: "handleTerminalPage",
                        value: function(e) {
                            if (this.purchaseFlowUuid) {
                                if (!this.triggerContext) return void ic("UserPaymentFlowFlowEndedWithoutTriggerContext");
                                av.stop(), this.sendStatusEvent({
                                    triggerContext: this.triggerContext,
                                    status: ao.PAYMENT_FLOW_ENDED
                                }, e), il("UserPaymentFlowFlowEnded")
                            }
                        }
                    }], [{
                        key: "extractView",
                        value: function(e) {
                            if (!e) return "";
                            var t = new URL(e);
                            return t.hostname.endsWith(".".concat(rQ().domain)) ? t.pathname : "External"
                        }
                    }, {
                        key: "isTerminalView",
                        value: function(e) {
                            return e === ar.CHECKOUT_SUCCESS
                        }
                    }, {
                        key: "getReferralUrl",
                        value: function() {
                            var e;
                            if (null == r0) return "";
                            try {
                                return im(r0.referrer, null == r$ || null == (e = r$.frames.top) ? void 0 : e.document.referrer)
                            } catch (e) {
                                return r0.referrer
                            }
                        }
                    }, {
                        key: "getUrlAnalyticId",
                        value: function() {
                            return null == r$ ? null : new URLSearchParams(r$.location.search).get("analyticId")
                        }
                    }, {
                        key: "reclassifyPlatformTriggeringContext",
                        value: function(e) {
                            var t = e.triggerContext,
                                n = (0, r3.getDeviceMeta)(),
                                r = [null == n ? void 0 : n.isAmazonApp, null == n ? void 0 : n.isUWPApp, null == n ? void 0 : n.isIosApp, null == n ? void 0 : n.isAndroidApp].some(function(e) {
                                    return !0 === e
                                }),
                                a = !0,
                                i = !1,
                                o = void 0;
                            try {
                                for (var s, u = ig[Symbol.iterator](); !(a = (s = u.next()).done); a = !0) {
                                    var l = s.value,
                                        c = l.web,
                                        d = l.webview,
                                        f = l.mobileWeb;
                                    if (t === c || t === d) return r ? d : c;
                                    if (t === f) return r ? d : f
                                }
                            } catch (e) {
                                i = !0, o = e
                            } finally {
                                try {
                                    a || null == u.return || u.return()
                                } finally {
                                    if (i) throw o
                                }
                            }
                            return t
                        }
                    }]), e
                }());
            if (null != r0 && (null == r$ || !0 !== Reflect.get(r$, id) && (Object.assign(r$, nz({}, id, !0)), 1))) {
                var iT = function() {
                    ip(i_), (null == r0 ? void 0 : r0.getElementById("display-price-container")) == null && iv(i_)
                };
                "loading" === r0.readyState ? r0.addEventListener("DOMContentLoaded", iT) : iT()
            }

            function iA(e, t) {
                var n = null != t ? t : e,
                    r = n.publish,
                    a = n.captureException,
                    i = n.featureName;

                function o() {
                    var e;
                    return rP(this, o), e = rx(this, o, arguments), nz(e, "state", {
                        error: null
                    }), e
                }
                return rT(o, k.Component), rR(o, [{
                    key: "componentDidCatch",
                    value: function(e, t) {
                        var n, o = null != (n = this.props.name) ? n : "ReactCrash";
                        r(o, {
                            severity: "critical",
                            errorType: e.name || "Error"
                        });
                        var s = i ? "".concat(i, "_").concat(o) : o;
                        null == a || a(e, nK({
                            error_counter: s
                        }, t.componentStack ? {
                            componentStack: t.componentStack
                        } : {}))
                    }
                }, {
                    key: "render",
                    value: function() {
                        var e = this.state.error;
                        if (e) {
                            var t = this.props.fallback;
                            return "function" == typeof t ? t(e) : void 0 !== t ? t : null
                        }
                        return this.props.children
                    }
                }], [{
                    key: "getDerivedStateFromError",
                    value: function(e) {
                        return {
                            error: e
                        }
                    }
                }]), o
            }
            var iU = window.Roblox["core-scripts"].http.http;

            function iN(e) {
                return (void 0 === e ? "undefined" : (0, rw._)(e)) === "object" && "config" in e
            }

            function iR(e) {
                return function(t) {
                    return D(function() {
                        var n, r, a, i, o, s, u, l, c;
                        return L(this, function(d) {
                            switch (d.label) {
                                case 0:
                                    n = t.eventCounterProps.call, e(r = "".concat(n, "_API"), {
                                        statusCode: "Throughput"
                                    }), d.label = 1;
                                case 1:
                                    return d.trys.push([1, 3, , 4]), [4, "GET" === t.method ? (0, iU.get)(nK({
                                        url: t.url,
                                        fullError: !0
                                    }, t.config), null == (a = t.config) ? void 0 : a.params) : (0, iU.post)(nK({
                                        url: t.url,
                                        fullError: !0
                                    }, t.config), t.data)];
                                case 2:
                                    return i = d.sent().data, e(r, {
                                        statusCode: "200"
                                    }), [2, i];
                                case 3:
                                    return iN(o = d.sent()) ? s = null != (u = null != (l = o.code) ? l : null == o || null == (c = o.response) ? void 0 : c.status.toString()) ? u : "UnknownAxiosError" : (s = "UnknownError", console.error(o)), e(r, {
                                        statusCode: s
                                    }), [2, void 0];
                                case 4:
                                    return [2]
                            }
                        })
                    })()
                }
            }

            function ik(e, t) {
                return function(n) {
                    return D(function() {
                        var r, a, i, o, s, u, l, c, d;
                        return L(this, function(f) {
                            switch (f.label) {
                                case 0:
                                    r = n.eventCounterProps.call, e(a = "".concat(r, "_API"), {
                                        statusCode: "Throughput"
                                    }), f.label = 1;
                                case 1:
                                    if (f.trys.push([1, 8, , 9]), i = nK({
                                            url: n.url,
                                            fullError: !0
                                        }, n.config), "GET" !== n.method) return [3, 3];
                                    return [4, (0, iU.get)(i, null == (s = n.config) ? void 0 : s.params)];
                                case 2:
                                case 4:
                                    return o = f.sent(), [3, 7];
                                case 3:
                                    if ("POST" !== n.method) return [3, 5];
                                    return [4, (0, iU.post)(i, n.data)];
                                case 5:
                                    return [4, (0, iU.delete)(i, n.data)];
                                case 6:
                                    o = f.sent(), f.label = 7;
                                case 7:
                                    return u = o.data, l = o.headers, e(a, {
                                        statusCode: "200"
                                    }), [2, {
                                        data: u,
                                        headers: l
                                    }];
                                case 8:
                                    throw d = function(e) {
                                            if (iN(e)) {
                                                var t, n, r;
                                                return null != (t = null != (n = e.code) ? n : null == e || null == (r = e.response) ? void 0 : r.status.toString()) ? t : "UnknownAxiosError"
                                            }
                                            return "UnknownError"
                                        }(c = f.sent()), e(a, {
                                            statusCode: d
                                        }),
                                        function(e) {
                                            if (!iN(e)) return !0;
                                            var t, n = null == (t = e.response) ? void 0 : t.status;
                                            return void 0 === n || n >= 500
                                        }(c) && t(c, {
                                            call: r,
                                            statusCode: d
                                        }), c;
                                case 9:
                                    return [2]
                            }
                        })
                    })()
                }
            }
            var iO = {
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
                },
                iI = ia(iO.featureName),
                iM = am(iO, {
                    publish: iI,
                    captureException: ii
                }),
                iB = iM.trackCounter,
                iD = iM.trackError,
                iL = iM.trackCriticalError,
                ij = ik(iI, ii);
            iA(iO, {
                publish: iI,
                captureException: ii,
                featureName: iO.featureName
            });
            var iF = "paymentSession-".concat(null != (S = null == (C = function() {
                if ("u" > typeof document) {
                    var e, t;
                    return rE(null != (e = null == (t = document.querySelector('meta[name="user-data"]')) ? void 0 : t.dataset) ? e : document.documentElement.dataset)
                }
            }()) ? void 0 : C.id) ? S : "loggedout");

            function iG() {
                var e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
                return function() {
                    var e, t = arguments.length > 0 && void 0 !== arguments[0] && arguments[0],
                        n = R((0, k.useState)(t ? void 0 : null !== (Date.now() >= rX && rq(), e = rH(iF)) && void 0 !== e ? e : void 0), 2),
                        r = n[0],
                        a = n[1],
                        i = R((0, k.useState)(!1), 2),
                        o = i[0],
                        s = i[1],
                        u = (0, k.useCallback)(function(e) {
                            return D(function() {
                                var t, n;
                                return L(this, function(r) {
                                    switch (r.label) {
                                        case 0:
                                            if (!e) return [3, 2];
                                            return [4, D(function() {
                                                return L(this, function(t) {
                                                    return [2, ij({
                                                        method: "GET",
                                                        url: "".concat(rK.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-sessions/").concat(e),
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
                                            return n = r.sent(), [3, 4];
                                        case 2:
                                            return [4, D(function() {
                                                return L(this, function(e) {
                                                    return [2, ij({
                                                        method: "POST",
                                                        url: "".concat(rK.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-sessions"),
                                                        data: {
                                                            paymentFlowId: i_.getPaymentFlowUuid()
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
                                            n = r.sent(), r.label = 4;
                                        case 4:
                                            if (!(t = n)) return [2];
                                            return rz(iF, t.paymentSession), a(t.paymentSession), [2]
                                    }
                                })
                            })()
                        }, []);
                    return (0, k.useEffect)(function() {
                        if (r) {
                            new Date(r.expiresAt) < new Date && (s(!0), u());
                            return
                        }
                        var e, t = null == (e = t3.urlService.getQueryParam("paymentSessionId")) ? void 0 : e.toString();
                        t || s(!0), u(t)
                    }, [u, r]), (0, k.useMemo)(function() {
                        return {
                            paymentSession: r,
                            wasCreatedByCurrentClient: o
                        }
                    }, [r, o])
                }(e).paymentSession
            }
            var iW = function(e, t) {
                return D(function() {
                    var n, r, a, i, o, s, u, l, c;
                    return L(this, function(d) {
                        switch (d.label) {
                            case 0:
                                return d.trys.push([0, 3, , 4]), [4, e()];
                            case 1:
                                if (200 !== (o = d.sent()).status) return t.onStatusError(o.status), (0, V.fireEvent)("".concat(t.failedStatusPrefix).concat(o.status)), [2];
                                return (u = null != (n = null != (r = null == (s = null == (a = o.data) ? void 0 : a.providerPayload) ? void 0 : s.IsSuccessful) ? r : null == (i = o.data) ? void 0 : i.isSuccess) && n) || !t.unsuccessfulPrefix || (0, V.fireEvent)("".concat(t.unsuccessfulPrefix).concat((null == s ? void 0 : s.ResponseMessage) || "")), [4, t.onSuccess(o, u)];
                            case 2:
                                return d.sent(), [3, 4];
                            case 3:
                                return l = d.sent(), null == (c = t.onError) || c.call(t, l), [3, 4];
                            case 4:
                                return [2]
                        }
                    })
                })()
            };

            function iH(e, t) {
                var n = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2];
                if (void 0 !== e && n) return {
                    amount: e,
                    currencyCode: t
                }
            }
            var iV = "Label.RemainingBalance",
                iY = "Label.ConvertibleCredit",
                iX = "Action.Buy",
                iq = "Action.ConvertToRobux",
                iz = "Message.25PercentMoreRobuxConvert",
                iK = "Alert.RobuxPackagePurchased",
                iQ = "Alert.RobuxPackagePurchaseFailed",
                iJ = "Alert.SuccessfullyConvertedCreditToRobux",
                iZ = "Heading.CreditConversionFail",
                i$ = "Alert.GenericFailure",
                i0 = "Header.OrderSummary",
                i1 = "Message.RobuxPurchased",
                i2 = "Message.IncludesUpToTwentyFivePercentMoreRobux",
                i3 = "ProcessPaymentRequestFailedStatusCode",
                i4 = {
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
                },
                i5 = function() {
                    for (var e, t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                    null == (e = "u" < typeof window ? void 0 : window.Sentry) || e.captureException.apply(e, nJ(n))
                },
                i6 = new Set(["componentStack"]),
                i8 = function(e, t) {
                    if (console.error(e, t), !t) return void i5(e);
                    var n = {},
                        r = {},
                        a = !0,
                        i = !1,
                        o = void 0;
                    try {
                        for (var s, u = Object.entries(t)[Symbol.iterator](); !(a = (s = u.next()).done); a = !0) {
                            var l = R(s.value, 2),
                                c = l[0],
                                d = l[1];
                            i6.has(c) ? r[c] = d : n[c] = d
                        }
                    } catch (e) {
                        i = !0, o = e
                    } finally {
                        try {
                            a || null == u.return || u.return()
                        } finally {
                            if (i) throw o
                        }
                    }
                    i5(e, nK({}, Object.keys(n).length > 0 ? {
                        tags: n
                    } : {}, Object.keys(r).length > 0 ? {
                        extra: r
                    } : {}))
                },
                i7 = [],
                i9 = !1,
                oe = !1;

            function ot() {
                var e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0],
                    t = !0,
                    n = !1,
                    r = void 0;
                try {
                    for (var a, i = i7[Symbol.iterator](); !(t = (a = i.next()).done); t = !0)(0, a.value)(e)
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
            var on = {
                    featureName: "RedeemGiftCard",
                    team: "Economy > Payments & Fraud",
                    internalPageName: "RedeemGiftCard",
                    features: {
                        health: {
                            apiCalls: ["GetRedemptionStatus"],
                            criticalErrors: ["Error_ReactCrash", "NoRoot"],
                            counters: ["PageLoad", "PageView", {
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
                or = ia(on.featureName);
            ! function(e, t) {
                n = t.flushIntervalMs;
                if (!a8(e)) {
                    return r = '@rbx/web-telemetry: invalid featureName "'.concat(e, '"'), a = {
                        name: e
                    }, t.onError ? t.onError(r, a) : console.error(r, a)
                }
                var n, r, a, i = new Map;
                i7.push(function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
                    if (0 !== i.size) {
                        var t = i;
                        i = new Map;
                        var n = BigInt(Date.now()),
                            r = Array.from(t.values(), function(e) {
                                var t = function(e) {
                                        var t = [],
                                            n = [],
                                            r = !0,
                                            a = !1,
                                            i = void 0;
                                        try {
                                            for (var o, s = e[Symbol.iterator](); !(r = (o = s.next()).done); r = !0) {
                                                var u = R(o.value, 2),
                                                    l = u[0],
                                                    c = u[1];
                                                c > 0 && (t.push(l), n.push(BigInt(c)))
                                            }
                                        } catch (e) {
                                            a = !0, i = e
                                        } finally {
                                            try {
                                                r || null == s.return || s.return()
                                            } finally {
                                                if (a) throw i
                                            }
                                        }
                                        return {
                                            bucketIndices: t,
                                            countsInBuckets: n
                                        }
                                    }(e.bucketCounts),
                                    r = t.bucketIndices,
                                    a = t.countsInBuckets;
                                return {
                                    name: e.name,
                                    sum: e.sum,
                                    count: BigInt(e.count),
                                    bucketIndices: r,
                                    countsInBuckets: a,
                                    timestampMs: n,
                                    attributes: e.attributes
                                }
                            }),
                            a = BigInt(1),
                            o = "u" > typeof crypto && "function" == typeof crypto.randomUUID ? crypto.randomUUID() : "web-telemetry-".concat(Date.now(), "-").concat(Math.random().toString(16).slice(2));
                        e || oe || "u" > typeof document && "hidden" === document.visibilityState ? ag("/v1/events/optimized", a5([a3([], r.map(a1), n, a, o)]).buffer) : aE("/v1/events/optimized", a5([a3([], r.map(a1), n, a, o)]))
                    }
                }), i9 || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                    "hidden" === document.visibilityState && ot()
                }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                    oe = !0, ot()
                }), i9 = !0)
            }(on.featureName, {});
            var oa = (s = "function" == typeof(i = !1, o = {
                publishCounter: or
            }) ? o : o.publishCounter, l = (u = function(e, t) {
                var n = !1;
                return function(r) {
                    if (!n) {
                        n = !0;
                        try {
                            var a = t ? rp(nK({}, r), {
                                severity: t
                            }) : r;
                            a ? s(e, a) : s(e)
                        } catch (e) {}
                    }
                }
            })("PageLoad"), c = u("PageView"), i ? {
                reportPageLoad: l,
                reportPageView: c
            } : {
                reportPageLoad: l,
                reportPageView: c,
                reportNoRoot: u("NoRoot", "critical")
            });
            oa.reportPageLoad, oa.reportPageView, oa.reportNoRoot, iA(on, {
                publish: or,
                captureException: i8,
                featureName: on.featureName
            });
            var oi = am(on, {
                    publish: or,
                    captureException: i8,
                    featureName: on.featureName
                }),
                oo = oi.trackCounter;
            oi.trackError, oi.trackCriticalError, iR(or), ik(or, i8), iR(or);
            var os = function(e) {
                    return D(function() {
                        var t, n;
                        return L(this, function(r) {
                            return t = {
                                paymentProviderType: "Credit",
                                providerPayload: {
                                    product_id: e || void 0
                                }
                            }, n = {
                                withCredentials: !0,
                                url: "".concat(rK.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/process-payment")
                            }, [2, t3.httpService.post(n, t)]
                        })
                    })()
                },
                ou = function(e, t) {
                    return D(function() {
                        var n, r;
                        return L(this, function(a) {
                            return n = {
                                withCredentials: !0,
                                url: "".concat(rK.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/prepare-payment-for-credit-conversion")
                            }, r = {
                                paymentFlowId: i_.purchaseFlowUuid,
                                paymentSessionId: null == e ? void 0 : e.id,
                                address: t
                            }, [2, t3.httpService.post(n, r)]
                        })
                    })()
                },
                ol = function(e, t, n, r) {
                    var a = e ? i_.ENUM_PURCHASE_STATUS.PASSED_PREPARE_PAYMENT_REQUEST : i_.ENUM_PURCHASE_STATUS.FAILED_PREPARE_PAYMENT_REQUEST;
                    r && (a = i_.ENUM_PURCHASE_STATUS.PASSED_PREPARE_PAYMENT_REQUEST_WITH_TAX);
                    var i = n ? t ? i_.ENUM_VIEW_NAME.CREDIT_PACKAGE_PURCHASE_MODAL_WITH_TAX : i_.ENUM_VIEW_NAME.CREDIT_PACKAGE_PURCHASE_MODAL_WITHOUT_TAX : t ? i_.ENUM_VIEW_NAME.CREDIT_CONVERSION_MODAL_WITH_TAX : i_.ENUM_VIEW_NAME.CREDIT_CONVERSION_MODAL_WITHOUT_TAX;
                    i_.sendUserPurchaseStatusEvent({
                        triggerContext: i_.ENUM_TRIGGERING_CONTEXT.WEB_REDEEM_PAGE,
                        status: a,
                        viewName: i
                    })
                },
                oc = function(e) {
                    i_.sendUserPurchaseStatusEvent({
                        triggerContext: i_.ENUM_TRIGGERING_CONTEXT.WEB_REDEEM_PAGE,
                        status: e ? i_.ENUM_PURCHASE_STATUS.PASSED_GET_NEXT_PURCHASABLE_METADATA : i_.ENUM_PURCHASE_STATUS.FAILED_GET_NEXT_PURCHASABLE_METADATA
                    })
                },
                od = function(e, t, n) {
                    var r = n ? t ? i_.ENUM_VIEW_NAME.CREDIT_PACKAGE_PURCHASE_MODAL_WITH_TAX : i_.ENUM_VIEW_NAME.CREDIT_PACKAGE_PURCHASE_MODAL_WITHOUT_TAX : t ? i_.ENUM_VIEW_NAME.CREDIT_CONVERSION_MODAL_WITH_TAX : i_.ENUM_VIEW_NAME.CREDIT_CONVERSION_MODAL_WITHOUT_TAX;
                    i_.sendUserPurchaseStatusEvent({
                        triggerContext: i_.ENUM_TRIGGERING_CONTEXT.WEB_REDEEM_PAGE,
                        status: e ? i_.ENUM_PURCHASE_STATUS.PASSED_UPDATE_ADDRESS_FOR_CHECKOUT_SESSION : i_.ENUM_PURCHASE_STATUS.FAILED_UPDATE_ADDRESS_FOR_CHECKOUT_SESSION,
                        viewName: r
                    })
                },
                of = function(e, t, n) {
                    var r = n ? t ? i_.ENUM_VIEW_NAME.CREDIT_PACKAGE_PURCHASE_MODAL_WITH_TAX : i_.ENUM_VIEW_NAME.CREDIT_PACKAGE_PURCHASE_MODAL_WITHOUT_TAX : t ? i_.ENUM_VIEW_NAME.CREDIT_CONVERSION_MODAL_WITH_TAX : i_.ENUM_VIEW_NAME.CREDIT_CONVERSION_MODAL_WITHOUT_TAX;
                    i_.sendUserPurchaseStatusEvent({
                        triggerContext: i_.ENUM_TRIGGERING_CONTEXT.WEB_REDEEM_PAGE,
                        status: e ? i_.ENUM_PURCHASE_STATUS.PASSED_PROCESS_PAYMENT : i_.ENUM_PURCHASE_STATUS.FAILED_PROCESS_PAYMENT,
                        viewName: r
                    })
                },
                oh = window.CoreRobloxUtilities,
                op = function(e, t) {
                    return D(function() {
                        var n, r;
                        return L(this, function(a) {
                            return n = {
                                withCredentials: !0,
                                url: "".concat(rK.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/update-address-for-checkout-session")
                            }, r = {
                                checkoutSessionId: t,
                                address: e
                            }, [2, t3.httpService.post(n, r)]
                        })
                    })()
                },
                ov = function(e, t, n, r, a, i) {
                    var o = oh.upsellUtil.parseUpsellCookie(),
                        s = nK({
                            paymentProviderType: "Credit",
                            providerPayload: rp(nK({}, {
                                product_id: e,
                                upsellUuid: o.upsellUuid,
                                upsellItemPath: o.targetItemUrl,
                                checkoutSessionToken: r
                            }), {
                                productId: e
                            }),
                            paymentSessionId: a,
                            checkoutSessionId: i
                        }, "" !== n && {
                            billingEmailType: n,
                            billingEmail: t
                        }),
                        u = {
                            withCredentials: !0,
                            url: "".concat(rK.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/process-payment")
                        };
                    return t3.httpService.post(u, s)
                },
                om = ((d = om || {}).RobloxCredit = "robloxCredit", d.RedeemCard = "redeemCard", d.Credit = "credit", d);

            function oy(e) {
                return void 0 !== e.data && void 0 !== e.data.expirationTimeInMinutes && void 0 !== e.data.failureReason
            }

            function ob(e, t) {
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

            function og(e) {
                var t = e.translate,
                    n = e.violation,
                    r = Math.ceil(e.timeoutDurationInMinutes / 60);
                if (r > 24) {
                    var a = Math.ceil(r / 24);
                    return t("Text.EconomicRestrictionsDays", {
                        violation: ob(t, n),
                        day: a
                    })
                }
                return t("Text.EconomicRestrictionsHours", {
                    violation: ob(t, n),
                    hour: r
                })
            }
            var oE = function(e) {
                    return !!e && (void 0 === e ? "undefined" : (0, rw._)(e)) === "object" && ("number" == typeof e.status || "object" === (0, rw._)(e.response) && null !== e.response && "number" == typeof e.response.status)
                },
                oS = function(e) {
                    var t;
                    if (oE(e)) return e.status || (null == (t = e.response) ? void 0 : t.status)
                },
                oC = function(e) {
                    var t;
                    if (oE(e)) return (null == (t = e.response) ? void 0 : t.data) || e.data
                },
                ow = function(e) {
                    var t = oS(e),
                        n = oC(e);
                    return 422 === t && 2 === n
                };

            function ox(e) {
                if (!((void 0 === e ? "undefined" : (0, rw._)(e)) === "object" && null !== e && "config" in e)) return "NonAxiosError";
                var t, n = null == (t = e.response) ? void 0 : t.status;
                return n ? String(n) : "UnknownAxiosError"
            }

            function oP(e, t, n, r) {
                return D(function(e, t, n, r) {
                    var a, i, o, s, u, l, c, d, f, h, p, v, m, y, b = arguments;
                    return L(this, function(g) {
                        switch (g.label) {
                            case 0:
                                o = void 0 !== (i = (a = b.length > 4 && void 0 !== b[4] ? b[4] : {}).enableRetry) && i, s = a.counterPrefix, l = void 0 === (u = a.showErrorBanner) || u, c = a.onError, f = o ? 2 : 1, h = 1, g.label = 1;
                            case 1:
                                if (!(h <= f)) return [3, 6];
                                g.label = 2;
                            case 2:
                                return g.trys.push([2, 4, , 5]), [4, e()];
                            case 3:
                                return [2, g.sent()];
                            case 4:
                                var E;
                                if (d = p = g.sent(), v = h < f, m = oS(p), iD("Error_CreditConversion_ApiFailed", {
                                        call: t,
                                        statusCode: ox(p)
                                    }, p), m && s && (y = v ? "_RETRY" : "", (0, V.fireEvent)("".concat(s).concat(m).concat(y))), v && !(429 === (E = oS(p)) || "UpdateAddress" === t && ow(p)) && (E && E >= 400 && E < 500 ? 408 === E : !E || E >= 500)) return [3, 5];
                                return l && !("UpdateAddress" === t && ow(p)) && 1 && n.warning(r(i$) || "Something went wrong! Please try again later.", 200, 5e3), c && c(p), [3, 6];
                            case 5:
                                return h++, [3, 1];
                            case 6:
                                throw d
                        }
                    })
                }).apply(this, arguments)
            }
            var o_ = (0, k.createContext)(void 0),
                oT = function(e) {
                    var t = e.children,
                        n = e.systemFeedbackService,
                        r = e.translate,
                        a = e.onSuccess,
                        i = iG(),
                        o = R((0, k.useState)(!1), 2),
                        s = o[0],
                        u = o[1],
                        l = R((0, k.useState)(!1), 2),
                        c = l[0],
                        d = l[1],
                        f = R((0, k.useState)(!1), 2),
                        h = f[0],
                        p = f[1],
                        v = R((0, k.useState)(!1), 2),
                        m = v[0],
                        y = v[1],
                        b = R((0, k.useState)(""), 2),
                        g = b[0],
                        E = b[1],
                        S = R((0, k.useState)(0), 2),
                        C = S[0],
                        x = S[1],
                        P = R((0, k.useState)(0), 2),
                        _ = P[0],
                        T = P[1],
                        A = R((0, k.useState)(0), 2),
                        U = A[0],
                        N = A[1],
                        O = R((0, k.useState)(0), 2),
                        I = O[0],
                        M = O[1],
                        B = R((0, k.useState)(null), 2),
                        j = B[0],
                        F = B[1],
                        G = R((0, k.useState)(!1), 2),
                        W = G[0],
                        H = G[1],
                        V = R((0, k.useState)(!1), 2),
                        Y = V[0],
                        X = V[1],
                        q = R((0, k.useState)(void 0), 2),
                        z = q[0],
                        K = q[1],
                        Q = R((0, k.useState)(void 0), 2),
                        J = Q[0],
                        Z = Q[1],
                        $ = R((0, k.useState)(!1), 2),
                        ee = $[0],
                        et = $[1],
                        en = R((0, k.useState)(!1), 2),
                        er = en[0],
                        ea = en[1],
                        ei = R((0, k.useState)(!1), 2),
                        eo = ei[0],
                        es = ei[1],
                        eu = R((0, k.useState)(!1), 2),
                        el = eu[0],
                        ec = eu[1],
                        ed = R((0, k.useState)(void 0), 2),
                        ef = ed[0],
                        eh = ed[1],
                        ep = R((0, k.useState)(void 0), 2),
                        ev = ep[0],
                        em = ep[1],
                        ey = R((0, k.useState)(void 0), 2),
                        eb = ey[0],
                        eg = ey[1],
                        eE = R((0, k.useState)(!0), 2),
                        eS = eE[0],
                        eC = eE[1],
                        ew = (0, k.useMemo)(function() {
                            return {
                                call: function(e, t, a) {
                                    return oP(e, t, n, r, a)
                                },
                                callWithRetry: function(e, t, a) {
                                    return oP(e, t, n, r, {
                                        enableRetry: !0,
                                        counterPrefix: a
                                    })
                                },
                                callAddressUpdate: function(e, t) {
                                    return oP(e, "UpdateAddress", n, r, {
                                        enableRetry: !0,
                                        counterPrefix: t
                                    })
                                }
                            }
                        }, [n, r]),
                        ex = (0, k.useCallback)(function(e, t) {
                            n.warning(e, 200, 5e3), u(!1), d(!1), t && r$ && (r$.location.href = t3.urlService.getAbsoluteUrl("/upgrades/robux"))
                        }, [n]),
                        eP = (0, k.useCallback)(function() {
                            ex(r(i$) || "Something went wrong! Please try again later.", !0)
                        }, [ex, r]),
                        e_ = (0, k.useCallback)(function(e, t) {
                            var i = !t;
                            e ? (n.success(r(i ? iJ : iK)), a && a(i)) : n.warning(r(i ? iZ : iQ) || r(i$) || "Something went wrong! Please try again later.", 200, 5e3)
                        }, [n, r, a]),
                        eT = (0, k.useCallback)(function(e) {
                            var t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                                n = e.TaxAmount,
                                r = rv(e, ["TaxAmount"]);
                            void 0 !== n && K(n), F(function(e) {
                                return nK({}, e, r)
                            }), H(t), void 0 !== e.CheckoutSessionToken && em(e.CheckoutSessionToken)
                        }, [F, H, em, K]),
                        eA = (0, k.useCallback)(function(e) {
                            ec(e.robloxManagedTax), eh(e.checkoutSessionId), void 0 !== e.taxRate && Z(e.taxRate), e.providerPayload.CurrencyCode && eT(e.providerPayload, e.hasBillingAddress)
                        }, [ec, eh, eT]),
                        eU = (0, k.useCallback)(function(e, t) {
                            return D(function() {
                                var n, r;
                                return L(this, function(a) {
                                    switch (a.label) {
                                        case 0:
                                            if (0 === e.productId) return [2, null];
                                            return [4, ew.call(function() {
                                                var n, r;
                                                return n = e.productId, r = om.Credit, D(function() {
                                                    var e, a;
                                                    return L(this, function(o) {
                                                        return e = {
                                                            withCredentials: !0,
                                                            url: "".concat(rK.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/prepare-payment")
                                                        }, a = {
                                                            paymentMethod: r,
                                                            productId: n,
                                                            paymentSessionId: null == i ? void 0 : i.id,
                                                            paymentFlowId: i_.getPaymentFlowUuid(),
                                                            address: t
                                                        }, [2, t3.httpService.post(e, a)]
                                                    })
                                                })()
                                            }, "PreparePayment")];
                                        case 1:
                                            if ((n = a.sent().data).isSuccess) return eA(n), (null == (r = n.selectedProduct) ? void 0 : r.price) !== void 0 && N(n.selectedProduct.price), ol(!0, n.robloxManagedTax, !0, null !== n.taxRate), [2, n.checkoutSessionId];
                                            return [2, null]
                                    }
                                })
                            })()
                        }, [i, eA, N, ew]),
                        eN = (0, k.useCallback)(function(e) {
                            return D(function() {
                                var t;
                                return L(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            return [4, ew.call(function() {
                                                return ou(i, e)
                                            }, "PreparePaymentForCreditConversion")];
                                        case 1:
                                            if ((t = n.sent().data).isSuccess) return eA(t), ol(!0, t.robloxManagedTax, !1, null !== t.taxRate), [2, t.checkoutSessionId];
                                            return [2, null]
                                    }
                                })
                            })()
                        }, [i, eA, ew]),
                        eR = (0, k.useCallback)(function(e) {
                            0 !== e.productId ? (u(!0), d(!1), oo("GetNextPurchasable_Success", {
                                type: "productPurchase"
                            })) : (d(!0), u(!1), oo("GetNextPurchasable_Success", {
                                type: "conversion"
                            }))
                        }, [u, d]),
                        ek = (0, k.useCallback)(function(e) {
                            d(!1), u(!1), F(function(t) {
                                return t ? rp(nK({}, t), {
                                    AvailableCreditBalance: e
                                }) : null
                            }), oo("GetNextPurchasable_CreditBalanceZero")
                        }, [d, u, F]),
                        eO = (0, k.useCallback)(function(e) {
                            x(e.productId), 0 !== e.productId && (e.robuxAmountProductGrant && M(e.robuxAmountProductGrant), e.balanceDue && N(e.balanceDue))
                        }, [x, M, N]),
                        eI = (0, k.useCallback)(function(e, t) {
                            return D(function() {
                                var n;
                                return L(this, function(r) {
                                    switch (r.label) {
                                        case 0:
                                            if (eg(t && !Y ? t : void 0), 0 === e.creditBalance || 0 === e.productId && 0 === e.robuxConversionAmount) return ek(e.creditBalance), [2];
                                            eO(e), n = 0 !== e.productId, r.label = 1;
                                        case 1:
                                            if (r.trys.push([1, 6, , 7]), !n) return [3, 3];
                                            return [4, eU(e, t)];
                                        case 2:
                                            return r.sent(), [3, 5];
                                        case 3:
                                            return [4, eN(t)];
                                        case 4:
                                            r.sent(), r.label = 5;
                                        case 5:
                                            return eR(e), [3, 7];
                                        case 6:
                                            return r.sent(), ol(!1, el, n), oo("GetNextPurchasable_Unexpected"), [3, 7];
                                        case 7:
                                            return [2]
                                    }
                                })
                            })()
                        }, [Y, eO, ek, eR, eU, eN, el]),
                        eM = (0, k.useCallback)(function(e) {
                            return D(function() {
                                var t;
                                return L(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            return [4, ew.callWithRetry(function() {
                                                return D(function() {
                                                    var t, n;
                                                    return L(this, function(r) {
                                                        return t = {
                                                            withCredentials: !0,
                                                            url: "".concat(rK.EnvironmentUrls.apiGatewayUrl, "/credit-balance/v1/next-purchasable-metadata")
                                                        }, n = {
                                                            address: e
                                                        }, [2, t3.httpService.post(t, n)]
                                                    })
                                                })()
                                            }, "GetNextPurchasable", "NewCreditConversionGetNextPurchasableFailedStatusCode")];
                                        case 1:
                                            if (200 !== (t = n.sent()).status) throw oc(!1), Error("Get next purchasable metadata failed with status ".concat(t.status));
                                            return oc(!0), [4, eI(t.data, e)];
                                        case 2:
                                            return n.sent(), [2]
                                    }
                                })
                            })()
                        }, [ew, eI]),
                        eB = (0, k.useCallback)(function(e) {
                            return D(function() {
                                return L(this, function(t) {
                                    switch (t.label) {
                                        case 0:
                                            p(!0), t.label = 1;
                                        case 1:
                                            return t.trys.push([1, 3, 4, 5]), [4, eM(e)];
                                        case 2:
                                            return t.sent(), [3, 5];
                                        case 3:
                                            return t.sent(), oo("GetNextPurchasable_Unexpected"), [3, 5];
                                        case 4:
                                            return p(!1), [7];
                                        case 5:
                                            return [2]
                                    }
                                })
                            })()
                        }, [eM]);
                    (0, k.useEffect)(function() {
                        var e, t, n, r, a = null != (e = null == j ? void 0 : j.AvailableCreditBalance) ? e : 0,
                            i = null != (t = null == j ? void 0 : j.RobuxConversionAmount) ? t : 0;
                        n = !m && (!el || ee && !er), r = 0 === C ? a > 0 && i > 0 : a >= U, es(n && r)
                    }, [er, ee, null == j ? void 0 : j.AvailableCreditBalance, null == j ? void 0 : j.RobuxConversionAmount, U, eS, m, C, el]);
                    var eD = (0, k.useCallback)(function(e) {
                            et(e)
                        }, []),
                        eL = (0, k.useCallback)(function(e) {
                            return D(function() {
                                var t, n, a, i, o, s, u, l, c;
                                return L(this, function(d) {
                                    switch (d.label) {
                                        case 0:
                                            if (eC(!0), !ef) return [2];
                                            d.label = 1;
                                        case 1:
                                            return d.trys.push([1, 8, , 10]), ea(!0), [4, ew.callAddressUpdate(function() {
                                                return op(e, ef)
                                            }, "UpdateAddressFailedStatusCode")];
                                        case 2:
                                            if (a = (n = (t = d.sent().data).providerPayload).AvailableCreditBalance, i = n.CurrencyCode, o = n.TaxAmount, s = n.CheckoutSessionToken, u = n.RobuxConversionAmount, l = n.TotalDue, c = t.taxRate, !(a < l)) return [3, 7];
                                            d.label = 3;
                                        case 3:
                                            return d.trys.push([3, 5, , 6]), [4, eM(e)];
                                        case 4:
                                        case 5:
                                            return d.sent(), [3, 6];
                                        case 6:
                                            return ea(!1), [2];
                                        case 7:
                                            return eT({
                                                AvailableCreditBalance: a,
                                                CurrencyCode: i,
                                                TaxAmount: o,
                                                CheckoutSessionToken: s,
                                                RobuxConversionAmount: u
                                            }, !0), void 0 !== c && Z(c), ea(!1), [3, 10];
                                        case 8:
                                            var f;
                                            return [4, (f = d.sent(), D(function() {
                                                return L(this, function(t) {
                                                    switch (t.label) {
                                                        case 0:
                                                            if (!ow(f)) return [2, !1];
                                                            t.label = 1;
                                                        case 1:
                                                            return t.trys.push([1, 3, , 4]), oo("CreditConversion_SwitchedToProductPurchase"), [4, eM(e)];
                                                        case 2:
                                                            return t.sent(), [2, !0];
                                                        case 3:
                                                            return t.sent(), oo("CreditConversion_ProductSwitchFailed"), [2, !1];
                                                        case 4:
                                                            return [2]
                                                    }
                                                })
                                            })())];
                                        case 9:
                                            if (d.sent()) return [2];
                                            return ea(!1), y(!0), E(r(i$) || "Something went wrong! Please try again later."), [3, 10];
                                        case 10:
                                            return [2]
                                    }
                                })
                            })()
                        }, [ef, eT, eM, eC, r, ew]),
                        ej = (0, k.useCallback)(function(e, t) {
                            return D(function() {
                                var t;
                                return L(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            if (t = 0 !== C ? "productPurchase" : "conversion", !e) return [3, 4];
                                            if (0 === C) return [3, 2];
                                            return [4, eB()];
                                        case 1:
                                            return n.sent(), [3, 3];
                                        case 2:
                                            d(!1), n.label = 3;
                                        case 3:
                                            return T(_ + 1), oo("ProcessPayment_Redirected"), [3, 5];
                                        case 4:
                                            u(!1), d(!1), oo("ProcessPayment_Unsuccessful", {
                                                type: t
                                            }), n.label = 5;
                                        case 5:
                                            return [2]
                                    }
                                })
                            })()
                        }, [eB, _, T, u, d, C]),
                        eF = (0, k.useCallback)(function() {
                            return D(function() {
                                var e;
                                return L(this, function(t) {
                                    switch (t.label) {
                                        case 0:
                                            p(!0), t.label = 1;
                                        case 1:
                                            if (t.trys.push([1, 6, 7, 8]), !ev) return [3, 3];
                                            return [4, iW(function() {
                                                return ov(C, "", "", ev, null == i ? void 0 : i.id, ef)
                                            }, {
                                                failedStatusPrefix: i3,
                                                onStatusError: function() {
                                                    e_(!1, C), p(!1)
                                                },
                                                onSuccess: function(e, t) {
                                                    return D(function() {
                                                        var n, r;
                                                        return L(this, function(a) {
                                                            switch (a.label) {
                                                                case 0:
                                                                    return r = null == (n = e.data) ? void 0 : n.providerPayload, e_(t, C), [4, ej(t, (null == r ? void 0 : r.ResponseMessage) || "")];
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
                                            return [4, iW(function() {
                                                return os(C)
                                            }, {
                                                failedStatusPrefix: i3,
                                                onStatusError: function() {
                                                    e_(!1, C), p(!1)
                                                },
                                                onSuccess: function(e) {
                                                    return D(function() {
                                                        var t, n, r, a, i, o;
                                                        return L(this, function(s) {
                                                            switch (s.label) {
                                                                case 0:
                                                                    return o = null != (t = (null == (i = e.data) ? void 0 : i.isSuccess) && (null == i || null == (r = i.providerPayload) ? void 0 : r.IsSuccessful)) && t, e_(null != (n = null == i ? void 0 : i.isSuccess) && n, C), [4, ej(o, (null == i || null == (a = i.providerPayload) ? void 0 : a.ResponseMessage) || "")];
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
                                            if (oy(e = t.sent())) return ex(og({
                                                translate: r,
                                                violation: e.data.failureReason,
                                                timeoutDurationInMinutes: e.data.expirationTimeInMinutes
                                            }), !1), oo("ProcessPayment_EconomicRestriction"), [2];
                                            return eP(), oo("ProcessPayment_Unexpected"), [3, 8];
                                        case 7:
                                            return p(!1), [7];
                                        case 8:
                                            return [2]
                                    }
                                })
                            })()
                        }, [ev, C, i, ef, e_, ex, eP, r, ej]),
                        eG = (0, k.useCallback)(function(e) {
                            T(0), y(!1), E(""), eB(e), T(1)
                        }, [eB]),
                        eW = (0, k.useCallback)(function() {
                            u(!1), oo("ProductPurchase_CancelClicked")
                        }, []),
                        eH = (0, k.useCallback)(function() {
                            d(!1), oo("Conversion_CancelClicked")
                        }, []),
                        eV = (0, k.useCallback)(function(e) {
                            y(!0), E(e)
                        }, []),
                        eY = (0, k.useCallback)(function(e) {
                            X(void 0 !== e)
                        }, []),
                        eX = (0, k.useMemo)(function() {
                            var e, t, n;
                            return {
                                isPurchaseModalOpen: s,
                                isConvertModalOpen: c,
                                isLoading: h,
                                isError: m,
                                errorMessage: g,
                                productId: C,
                                numberOfPurchase: _,
                                creditBalance: null != (e = null == j ? void 0 : j.AvailableCreditBalance) ? e : 0,
                                currencyCode: null != (t = null == j ? void 0 : j.CurrencyCode) ? t : "",
                                convertedRobuxAmount: null != (n = null == j ? void 0 : j.RobuxConversionAmount) ? n : 0,
                                totalBalanceDue: U,
                                robuxAmountInPackage: I,
                                tax: (null == j ? void 0 : j.CurrencyCode) ? iH(z, j.CurrencyCode, W) : void 0,
                                taxRate: J,
                                taxLoading: er,
                                taxDisplay: ee,
                                isTaxFlowEnabled: el,
                                checkoutSessionId: ef,
                                prefilledAddress: eb,
                                isPurchasable: eo,
                                startCreditConversionFlow: eG,
                                closePurchaseModal: eW,
                                closeConvertModal: eH,
                                onUpdatedAddress: eL,
                                onTaxDisplayChange: eD,
                                processPaymentAction: eF,
                                updateError: eV,
                                setSavedUserAddress: eY
                            }
                        }, [s, c, h, m, g, C, _, j, W, z, J, er, ee, U, I, el, ef, eb, eo, eG, eW, eH, eL, eD, eF, eV, eY]);
                    return (0, w.jsx)(o_.Provider, {
                        value: eX,
                        children: t
                    })
                },
                oA = function() {
                    var e = (0, k.useContext)(o_);
                    if (void 0 === e) throw Error("useHeuristicCreditConversionData must be used within a HeuristicCreditConversionContext");
                    return e
                },
                oU = {
                    common: ["Feature.Payment"],
                    feature: "Feature.BillingAddress"
                },
                oN = function() {
                    for (var e, t, n = 0, r = "", a = arguments.length; n < a; n++)(e = arguments[n]) && (t = function e(t) {
                        var n, r, a = "";
                        if ("string" == typeof t || "number" == typeof t) a += t;
                        else if ("object" == (void 0 === t ? "undefined" : (0, rw._)(t)))
                            if (Array.isArray(t)) {
                                var i = t.length;
                                for (n = 0; n < i; n++) t[n] && (r = e(t[n])) && (a && (a += " "), a += r)
                            } else
                                for (r in t) t[r] && (a && (a += " "), a += r);
                        return a
                    }(e)) && (r && (r += " "), r += t);
                    return r
                },
                oR = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                ok = O().forwardRef(function(e, t) {
                    var n, r = T(n = [e, t]) || nQ(n) || N(n) || A(),
                        a = r[0],
                        i = r.slice(1),
                        o = a.name,
                        s = a.size,
                        u = a.className,
                        l = (a.children, rv(a, ["name", "size", "className", "children"])),
                        c = R(i, 1)[0];
                    return O().createElement("span", nK({
                        ref: c,
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-icon",
                        className: oN("grow-0 shrink-0 basis-auto icon", o, oR[void 0 === s ? "Medium" : s], u)
                    }, l))
                });
            ok.displayName = "Icon";
            var oO = {
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
                oI = {
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
                oM = [{
                    code: "US",
                    name: "United States",
                    displayName: "United States"
                }, {
                    code: "CA",
                    name: "Canada",
                    displayName: "Canada"
                }],
                oB = oO.saveBillingInformationLabel,
                oD = oB.key,
                oL = oB.default,
                oj = (0, M.withTranslations)(function(e) {
                    var t = e.disabled,
                        n = e.saveBillingInfo,
                        r = e.setSaveBillingInfo,
                        a = e.translate,
                        i = (0, k.useCallback)(function(e) {
                            r(e.target.checked)
                        }, [r]);
                    return (0, w.jsxs)("div", {
                        className: "save-billing-info-checkbox",
                        children: [(0, w.jsx)("input", {
                            id: "save-billing-info",
                            type: "checkbox",
                            className: "larger-checkbox",
                            onChange: i,
                            checked: n,
                            disabled: void 0 !== t && t,
                            tabIndex: 0
                        }), (0, w.jsx)("label", {
                            htmlFor: "save-billing-info",
                            className: "form-label",
                            children: a(oD) || oL
                        })]
                    })
                }, oU),
                oF = oO.countryLabel,
                oG = oF.key,
                oW = oF.default,
                oH = oO.PostalCode,
                oV = oH.key,
                oY = oH.default,
                oX = oO.cityLabel,
                oq = oX.key,
                oz = oX.default,
                oK = oO.stateLabel,
                oQ = oK.key,
                oJ = oK.default,
                oZ = oO.provinceLabel,
                o$ = oZ.key,
                o0 = oZ.default,
                o1 = oO.saveButton,
                o2 = o1.key,
                o3 = o1.default,
                o4 = oO.cancelButton,
                o5 = o4.key,
                o6 = o4.default,
                o8 = oO.approximateUserLocationDescription,
                o7 = o8.key,
                o9 = o8.default,
                se = function() {
                    return (0, w.jsx)("span", {
                        className: "required-indicator",
                        children: "*"
                    })
                },
                st = (0, M.withTranslations)(function(e) {
                    var t, n, r, a, i, o, s = e.initialAddress,
                        u = e.hasSavedAddress,
                        l = e.processAddressSave,
                        c = e.onUpdateAddress,
                        d = e.onUpdateSuccess,
                        f = e.onTaxDisplayChange,
                        h = e.hideSaveSection,
                        p = e.triggeringContext,
                        v = e.translate,
                        m = R((0, k.useState)(!u), 2),
                        y = m[0],
                        b = m[1],
                        g = R((0, k.useState)(null != (t = null == s ? void 0 : s.country) ? t : "US"), 2),
                        E = g[0],
                        S = g[1],
                        C = R((0, k.useState)(null != (n = null == s ? void 0 : s.state) ? n : ""), 2),
                        x = C[0],
                        P = C[1],
                        _ = R((0, k.useState)(null != (r = null == s ? void 0 : s.postalCode) ? r : ""), 2),
                        T = _[0],
                        A = _[1],
                        U = R((0, k.useState)(null != (a = null == s ? void 0 : s.postalCode) ? a : ""), 2),
                        N = U[0],
                        O = U[1],
                        M = R((0, k.useState)(null != (i = null == s ? void 0 : s.city) ? i : ""), 2),
                        B = M[0],
                        j = M[1],
                        F = R((0, k.useState)(null != (o = null == s ? void 0 : s.city) ? o : ""), 2),
                        G = F[0],
                        W = F[1],
                        H = (0, k.useRef)(!0),
                        V = v(oV) || oY,
                        Y = v(oq) || oz,
                        X = oM.map(function(e) {
                            return {
                                value: e.code,
                                label: e.displayName
                            }
                        }),
                        q = "US" === E,
                        z = R((0, k.useState)(!0), 2),
                        K = z[0],
                        Q = z[1],
                        J = R((0, k.useState)(!1), 2),
                        Z = J[0],
                        $ = J[1],
                        ee = R((0, k.useState)(u ? s : void 0), 2),
                        et = ee[0],
                        en = ee[1];
                    (0, k.useEffect)(function() {
                        i_.sendUserPurchaseFlowEvent({
                            triggerContext: p,
                            isMidPurchaseStep: !0,
                            viewName: i_.ENUM_VIEW_NAME.CREDIT_BALANCE_BIILLING_ADDRESS_FORM,
                            purchaseEventType: i_.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN,
                            eventMetadata: {
                                initial_address_available: s ? "true" : "false",
                                has_saved_address: u ? "true" : "false"
                            }
                        })
                    }, [u, s, p]);
                    var er = (0, k.useCallback)(function() {
                            b(!0)
                        }, []),
                        ea = (0, k.useCallback)(function() {
                            return D(function() {
                                return L(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            var t;
                                            return e.trys.push([0, 2, , 3]), [4, (t = {
                                                country: E,
                                                state: x,
                                                city: B,
                                                postalCode: N
                                            }, D(function() {
                                                var e, n;
                                                return L(this, function(r) {
                                                    return e = {
                                                        withCredentials: !0,
                                                        url: "".concat(rK.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/user-settings-address")
                                                    }, n = {
                                                        address: t
                                                    }, [2, t3.httpService.patch(e, n)]
                                                })
                                            })())];
                                        case 1:
                                            return 200 === e.sent().status && (null == d || d(), en({
                                                country: E,
                                                state: x,
                                                city: B,
                                                postalCode: N
                                            })), [3, 3];
                                        case 2:
                                            return e.sent(), [3, 3];
                                        case 3:
                                            return [2]
                                    }
                                })
                            })()
                        }, [E, x, B, N, d]);
                    (0, k.useEffect)(function() {
                        l && (h || u || K) && (h || !u) && ea()
                    }, [l, E, x, B, N, d, K, ea, h, u]);
                    var ei = (0, k.useCallback)(function(e) {
                            return !!(e && e.length >= 2)
                        }, []),
                        eo = (0, k.useCallback)(function(e) {
                            return !!e
                        }, []),
                        es = (0, k.useCallback)(function(e) {
                            return !!(e && 5 === e.length)
                        }, []),
                        eu = (0, k.useCallback)(function() {
                            switch (E) {
                                case "US":
                                    return ei(B) && eo(x) && es(N);
                                case "CA":
                                    return ei(B) && eo(x);
                                default:
                                    return !1
                            }
                        }, [E, x, B, N, ei, eo, es]);
                    (0, k.useEffect)(function() {
                        !h && u ? null == f || f(eu() && !y) : null == f || f(eu())
                    }, [h, u, y, eu, f]), (0, k.useEffect)(function() {
                        H.current && (H.current = !1, u) || eu() && (null == c || c({
                            country: E,
                            state: x,
                            city: B,
                            postalCode: N
                        }))
                    }, [eu, E, x, B, N, c]);
                    var el = (0, k.useCallback)(function() {
                            switch (E) {
                                case "US":
                                    return ei(G) && eo(x) && es(T);
                                case "CA":
                                    return ei(G) && eo(x);
                                default:
                                    return !1
                            }
                        }, [E, x, G, T, ei, eo, es]),
                        ec = (0, k.useCallback)(function() {
                            return E === (null == et ? void 0 : et.country) && x === (null == et ? void 0 : et.state) && B === (null == et ? void 0 : et.city) && N === (null == et ? void 0 : et.postalCode)
                        }, [E, x, B, N, et]);
                    (0, k.useEffect)(function() {
                        ec() || $(el())
                    }, [el, ec]);
                    var ed = (0, k.useCallback)(function() {
                            O(T)
                        }, [T]),
                        ef = (0, k.useCallback)(function() {
                            j(G)
                        }, [G]),
                        eh = (0, k.useCallback)(function(e) {
                            S(e.target.value), P(""), j(""), W(""), O(""), A("")
                        }, []),
                        ep = (0, k.useCallback)(function(e) {
                            var t;
                            if (!(null != (t = oI[E]) ? t : []).some(function(t) {
                                    return t.value === e.target.value
                                })) {
                                P(""), O(""), A("");
                                return
                            }
                            P(e.target.value), O(""), A("")
                        }, [E]),
                        ev = (0, k.useMemo)(function() {
                            return (0, w.jsxs)("div", {
                                className: "country-field",
                                children: [(0, w.jsxs)("label", {
                                    htmlFor: "country-select",
                                    className: "form-label",
                                    children: [v(oG) || oW, " ", (0, w.jsx)(se, {})]
                                }), (0, w.jsx)(I.NativeDropdown, {
                                    id: "country-select",
                                    selectionItems: X,
                                    selectedItemvalue: E,
                                    onChange: eh,
                                    className: "country-select-container"
                                })]
                            })
                        }, [X, eh, E, v]),
                        em = (0, k.useMemo)(function() {
                            return (0, w.jsxs)("div", {
                                className: "city-field",
                                children: [(0, w.jsxs)("label", {
                                    htmlFor: "city-input",
                                    className: "form-label",
                                    children: [Y, " ", (0, w.jsx)(se, {})]
                                }), (0, w.jsx)("div", {
                                    className: "city-input-container",
                                    children: (0, w.jsx)("input", {
                                        id: "city-input",
                                        type: "text",
                                        value: G,
                                        onChange: function(e) {
                                            W(e.target.value)
                                        },
                                        onBlur: ef,
                                        placeholder: Y
                                    })
                                })]
                            })
                        }, [Y, G, ef]),
                        ey = (0, k.useMemo)(function() {
                            var e, t = "US" === E ? "Select State" : "Select Province";
                            return (0, w.jsxs)("div", {
                                className: "state-field",
                                children: [(0, w.jsxs)("label", {
                                    htmlFor: "state-select",
                                    className: "form-label",
                                    children: ["US" === E ? v(oQ) || oJ : v(o$) || o0, " ", (0, w.jsx)(se, {})]
                                }), (0, w.jsx)(I.NativeDropdown, {
                                    id: "state-select",
                                    placeholder: t,
                                    selectionItems: null != (e = oI[E]) ? e : [],
                                    selectedItemvalue: x || t,
                                    onChange: ep,
                                    className: "state-select-container"
                                })]
                            })
                        }, [ep, x, E, v]),
                        eb = (0, k.useMemo)(function() {
                            return (0, w.jsxs)("div", {
                                className: "zip-code-field",
                                children: [(0, w.jsxs)("label", {
                                    htmlFor: "zip-code-input",
                                    className: "form-label",
                                    children: [V, " ", (0, w.jsx)(se, {})]
                                }), (0, w.jsx)("div", {
                                    className: "postal-code-input-container",
                                    children: (0, w.jsx)("input", {
                                        id: "postal-code-input",
                                        type: "text",
                                        inputMode: "US" === E ? "numeric" : "text",
                                        pattern: "US" === E ? "[0-9]*" : void 0,
                                        value: T,
                                        onBlur: ed,
                                        onChange: function(e) {
                                            var t = e.target.value;
                                            /^\d*$/.test(t) && (A(t), "US" === E && 5 === t.length && O(t))
                                        },
                                        placeholder: V,
                                        maxLength: "US" === E ? 5 : void 0
                                    })
                                })]
                            })
                        }, [V, E, T, ed]),
                        eg = (0, k.useCallback)(function() {
                            return q ? (0, w.jsxs)("div", {
                                className: "form-group billing-address-form-group",
                                children: [(0, w.jsxs)("div", {
                                    className: "billing-fields-row",
                                    children: [ev, em]
                                }), (0, w.jsxs)("div", {
                                    className: "billing-fields-row",
                                    children: [ey, eb]
                                })]
                            }) : (0, w.jsxs)("div", {
                                className: "form-group billing-address-form-group",
                                children: [(0, w.jsx)("div", {
                                    className: "billing-fields-row",
                                    children: ev
                                }), (0, w.jsxs)("div", {
                                    className: "billing-fields-row",
                                    children: [em, ey]
                                })]
                            })
                        }, [em, ev, q, ey, eb]),
                        eE = (0, k.useCallback)(function() {
                            ea(), b(!1), $(!1)
                        }, [ea, b, $]),
                        eS = (0, k.useCallback)(function() {
                            var e, t, n, r, a, i;
                            O(null != (e = null == et ? void 0 : et.postalCode) ? e : ""), A(null != (t = null == et ? void 0 : et.postalCode) ? t : ""), j(null != (n = null == et ? void 0 : et.city) ? n : ""), W(null != (r = null == et ? void 0 : et.city) ? r : ""), P(null != (a = null == et ? void 0 : et.state) ? a : ""), S(null != (i = null == et ? void 0 : et.country) ? i : "US"), b(!1)
                        }, [et, O, j, P, S]),
                        eC = (0, k.useMemo)(function() {
                            return u ? (0, w.jsxs)("div", {
                                className: "billing-address-buttons",
                                children: [(0, w.jsx)(I.Button, {
                                    variant: I.Button.variants.growth,
                                    size: I.Button.sizes.medium,
                                    width: I.Button.widths.default,
                                    onClick: eE,
                                    className: "mr-2 save-address-button",
                                    isDisabled: !Z,
                                    children: v(o2) || o3
                                }), (0, w.jsx)(I.Button, {
                                    variant: I.Button.variants.control,
                                    size: I.Button.sizes.medium,
                                    width: I.Button.widths.default,
                                    onClick: eS,
                                    className: "ml-2 cancel-address-button",
                                    children: v(o5) || o6
                                })]
                            }) : (0, w.jsx)(oj, {
                                saveBillingInfo: K,
                                setSaveBillingInfo: Q
                            })
                        }, [eS, eE, Z, K, u, v]);
                    if (!y) {
                        var ew = q ? "".concat(null == et ? void 0 : et.city, ", ").concat(null == et ? void 0 : et.state, ", ").concat(null == et ? void 0 : et.postalCode, ", ").concat(null == et ? void 0 : et.country) : "".concat(null == et ? void 0 : et.city, ", ").concat(null == et ? void 0 : et.state, ", ").concat(null == et ? void 0 : et.country);
                        return (0, w.jsxs)("div", {
                            className: "formatted-address-container",
                            children: [(0, w.jsx)("p", {
                                className: "formatted-address-label",
                                children: ew
                            }), (0, w.jsx)("button", {
                                type: "button",
                                onClick: er,
                                "aria-label": "Edit billing address",
                                className: "edit-address-button",
                                children: (0, w.jsx)(ok, {
                                    name: "icon-regular-pencil",
                                    size: "Large"
                                })
                            })]
                        })
                    }
                    return (0, w.jsxs)("div", {
                        className: "billing-address-form-container",
                        children: [!h && (0, w.jsx)("p", {
                            className: "approximate-user-location-label",
                            children: v(o7) || o9
                        }), eg(), !h && eC]
                    })
                }, oU),
                sn = oO.billingInformationHeader,
                sr = sn.key,
                sa = sn.default,
                si = (0, M.withTranslations)(function(e) {
                    var t, n = e.processAddressSave,
                        r = e.onUpdateAddress,
                        a = e.prefilledAddress,
                        i = e.onUpdateSuccess,
                        o = e.onTaxDisplayChange,
                        s = e.hideSaveSection,
                        u = e.onSavedAddressLoaded,
                        l = e.triggeringContext,
                        c = e.translate,
                        d = R((0, k.useState)(!0), 2),
                        f = d[0],
                        h = d[1],
                        p = R((0, k.useState)(), 2),
                        v = p[0],
                        m = p[1],
                        y = R((0, k.useState)(), 2),
                        b = y[0],
                        g = y[1];
                    return ((0, k.useEffect)(function() {
                        if (a) {
                            null == u || u(void 0), h(!1);
                            return
                        }
                        D(function() {
                            return L(this, function(e) {
                                switch (e.label) {
                                    case 0:
                                        return [4, Promise.all([D(function() {
                                            var e, t, n, r;
                                            return L(this, function(a) {
                                                switch (a.label) {
                                                    case 0:
                                                        return a.trys.push([0, 2, , 3]), [4, D(function() {
                                                            var e, t;
                                                            return L(this, function(n) {
                                                                return e = {
                                                                    withCredentials: !0,
                                                                    url: "".concat(rK.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/user-settings-address")
                                                                }, t = {}, [2, t3.httpService.get(e, t)]
                                                            })
                                                        })()];
                                                    case 1:
                                                        return t = (e = a.sent().data.address).country, n = e.state, m(r = {
                                                            country: t,
                                                            state: n,
                                                            city: e.city,
                                                            postalCode: e.postalCode
                                                        }), null == u || u(r), [3, 3];
                                                    case 2:
                                                        return a.sent(), null == u || u(void 0), [3, 3];
                                                    case 3:
                                                        return [2]
                                                }
                                            })
                                        })(), D(function() {
                                            var e, t, n, r, a, i;
                                            return L(this, function(o) {
                                                switch (o.label) {
                                                    case 0:
                                                        return o.trys.push([0, 2, , 3]), [4, D(function() {
                                                            var e, t;
                                                            return L(this, function(n) {
                                                                return e = {
                                                                    withCredentials: !0,
                                                                    url: "".concat(rK.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/user-location/approximate-location")
                                                                }, t = {}, [2, t3.httpService.get(e, t)]
                                                            })
                                                        })()];
                                                    case 1:
                                                        return n = (t = o.sent().data).countryCode, r = t.subdivision, a = t.city, i = t.postalCode, i_.sendUserPurchaseStatusEvent({
                                                            triggerContext: l,
                                                            status: i_.ENUM_PURCHASE_STATUS.PASSED_GET_APPROXIMATE_USER_LOCATION,
                                                            viewName: i_.ENUM_VIEW_NAME.CREDIT_BALANCE_BIILLING_ADDRESS_FORM
                                                        }), oM.some(function(e) {
                                                            return e.code === n
                                                        }) && (null == (e = oI[n]) ? void 0 : e.some(function(e) {
                                                            return e.value === r
                                                        })) && g({
                                                            country: n,
                                                            state: r,
                                                            city: a,
                                                            postalCode: i
                                                        }), [3, 3];
                                                    case 2:
                                                        return o.sent(), i_.sendUserPurchaseStatusEvent({
                                                            triggerContext: l,
                                                            status: i_.ENUM_PURCHASE_STATUS.FAILED_GET_APPROXIMATE_USER_LOCATION,
                                                            viewName: i_.ENUM_VIEW_NAME.CREDIT_BALANCE_BIILLING_ADDRESS_FORM
                                                        }), [3, 3];
                                                    case 3:
                                                        return [2]
                                                }
                                            })
                                        })()])];
                                    case 1:
                                        return e.sent(), h(!1), [2]
                                }
                            })
                        })()
                    }, [a, u]), f) ? null : (0, w.jsxs)("div", {
                        className: "billing-info-container",
                        children: [(0, w.jsx)("h5", {
                            className: "billing-info-title",
                            children: c(sr) || sa
                        }), (0, w.jsx)(st, {
                            processAddressSave: n,
                            initialAddress: null != (t = null != a ? a : v) ? t : b,
                            hasSavedAddress: void 0 !== v,
                            onUpdateAddress: r,
                            onUpdateSuccess: i,
                            onTaxDisplayChange: o,
                            hideSaveSection: s,
                            triggeringContext: l
                        })]
                    })
                }, oU),
                so = function(e) {
                    var t = e.processAddressSave,
                        n = e.onUpdateAddress,
                        r = e.prefilledAddress,
                        a = e.onUpdateSuccess,
                        i = e.onTaxDisplayChange,
                        o = e.hideSaveSection,
                        s = e.onSavedAddressLoaded,
                        u = e.triggeringContext;
                    return (0, w.jsx)(si, {
                        processAddressSave: t,
                        onUpdateAddress: n,
                        prefilledAddress: r,
                        onUpdateSuccess: a,
                        onTaxDisplayChange: i,
                        hideSaveSection: o,
                        onSavedAddressLoaded: s,
                        triggeringContext: u
                    })
                },
                ss = window.PropTypes,
                su = n.n(ss),
                sl = n(611),
                sc = n.n(sl),
                sd = function() {
                    if ("u" > typeof document) {
                        var e = document.querySelector('meta[name="page-meta"]');
                        return null == e ? void 0 : e.dataset.internalPageName
                    }
                },
                sf = ["JPY"];

            function sh(e) {
                var t = function(e) {
                        var t, n = e.amount,
                            r = e.currencyCode,
                            a = e.tagClassName,
                            i = Math.abs(n),
                            o = "".concat(i).concat(r),
                            s = sc()("price-tag", a);
                        try {
                            var u, l = (u = Intl.NumberFormat().resolvedOptions().locale).startsWith("ar-") ? (iB("PriceTag_ArabicLocaleTriggered"), u.replace("ar-", "en-")) : u,
                                c = {
                                    style: "currency",
                                    currency: r,
                                    notation: "standard"
                                };
                            i >= 1e4 && !sf.includes(r) && (c.minimumFractionDigits = 0, c.maximumFractionDigits = 2, c.maximumSignificantDigits = 21, c.notation = "compact"), s.split(" ").includes("navbar-compact") && (c.maximumSignificantDigits = 4), o = Intl.NumberFormat(l, c).format(i)
                        } catch (e) {
                            iL("PriceTag_NumberFormatLocaleException", {
                                currencyCode: null === r ? "null" : void 0 === r ? "undefined" : "" === r ? "empty" : "string" == typeof r && /^[a-z]{3}$/i.test(r) ? r.toUpperCase() : "invalid",
                                internalPageName: null != (t = sd()) ? t : "unknown"
                            })
                        }
                        return {
                            formattedAmount: o,
                            isNegative: n < 0,
                            className: s
                        }
                    }({
                        amount: e.amount,
                        currencyCode: e.currencyCode,
                        tagClassName: e.tagClassName
                    }),
                    n = t.formattedAmount,
                    r = t.isNegative,
                    a = t.className;
                return (0, w.jsxs)("div", {
                    className: "inline-flex items-center gap-xsmall",
                    children: [r && (0, w.jsx)("span", {
                        className: a,
                        children: "-"
                    }), (0, w.jsx)("span", {
                        className: a,
                        children: n
                    })]
                })
            }
            sh.propTypes = {
                amount: su().number.isRequired,
                currencyCode: su().string.isRequired
            };
            var sp = {
                    common: ["CommonUI.Controls", "CommonUI.Features", "IAPExperience.PurchaseError", "Feature.NotApproved", "Feature.PaymentRedeem", "Feature.Payment", "Feature.BillingAddress"],
                    feature: "Purchasing.RedeemGameCard"
                },
                sv = function(e) {
                    var t = e.translate,
                        n = e.tax,
                        r = e.taxRate,
                        a = e.taxDisplay,
                        i = e.visible,
                        o = e.isLoading,
                        s = void 0 !== o && o,
                        u = (0, k.useMemo)(function() {
                            return t("Label.Tax") || "Tax"
                        }, [t]),
                        l = (0, k.useMemo)(function() {
                            return s || null == r || !a ? null : (100 * r).toFixed(2)
                        }, [r, s, a]),
                        c = (0, k.useMemo)(function() {
                            return t("Description.TaxInfoTooltip") || "Tax is determined by billing information"
                        }, [t]);
                    return void 0 === i || i ? (0, w.jsxs)("div", {
                        className: "tax-line flex justify-between row-pad",
                        children: [(0, w.jsxs)("span", {
                            className: "flex items-center gap-xsmall bold",
                            children: [u, l && " (".concat(l, "%)"), (0, w.jsx)(I.Tooltip, {
                                id: "tax-info-tooltip",
                                placement: "right",
                                content: c,
                                children: (0, w.jsx)(ok, {
                                    name: "icon-regular-circle-i",
                                    size: "Large"
                                })
                            })]
                        }), a ? s ? (0, w.jsxs)("div", {
                            className: "calculating-tax",
                            children: [(0, w.jsx)("span", {
                                className: "loading-spinner"
                            }), (0, w.jsx)("span", {
                                children: t("Label.CalculatingTax") || "Calculating tax..."
                            })]
                        }) : n ? (0, w.jsx)(sh, {
                            amount: -1 * (n.amount || 0),
                            currencyCode: n.currencyCode
                        }) : (0, w.jsx)("span", {
                            className: "text-placeholder",
                            children: "—"
                        }) : (0, w.jsx)("span", {
                            className: "text-placeholder",
                            children: "—"
                        })]
                    }) : null
                },
                sm = R((0, I.createModal)(), 2),
                sy = sm[0],
                sb = sm[1],
                sg = (0, M.withTranslations)(function(e) {
                    var t = e.translate,
                        n = oA(),
                        r = n.isPurchaseModalOpen,
                        a = n.isLoading,
                        i = n.creditBalance,
                        o = n.totalBalanceDue,
                        s = n.currencyCode,
                        u = n.numberOfPurchase,
                        l = n.robuxAmountInPackage,
                        c = n.tax,
                        d = n.taxRate,
                        f = n.taxLoading,
                        h = n.taxDisplay,
                        p = n.isTaxFlowEnabled,
                        v = n.onUpdatedAddress,
                        m = n.onTaxDisplayChange,
                        y = n.processPaymentAction,
                        b = n.closePurchaseModal,
                        g = n.prefilledAddress,
                        E = n.isPurchasable,
                        S = n.setSavedUserAddress,
                        C = R((0, k.useState)(!1), 2),
                        x = C[0],
                        P = C[1];
                    (0, k.useEffect)(function() {
                        r ? (sb.open(), i_.sendUserPurchaseFlowEvent({
                            triggerContext: i_.ENUM_TRIGGERING_CONTEXT.WEB_REDEEM_PAGE,
                            isMidPurchaseStep: !0,
                            viewName: p ? i_.ENUM_VIEW_NAME.CREDIT_PACKAGE_PURCHASE_MODAL_WITH_TAX : i_.ENUM_VIEW_NAME.CREDIT_PACKAGE_PURCHASE_MODAL_WITHOUT_TAX,
                            purchaseEventType: i_.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN
                        })) : sb.close()
                    }, [r, p]);
                    var _ = (0, k.useCallback)(function(e) {
                            return D(function() {
                                var t;
                                return L(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            return n.trys.push([0, 2, , 3]), [4, v(e)];
                                        case 1:
                                            return n.sent(), od(!0, p, !0), [3, 3];
                                        case 2:
                                            return t = n.sent(), od(!1, p, !0), iD("Error_CreditConversion_ApiFailed", {
                                                call: "UpdateAddress",
                                                statusCode: ox(t)
                                            }, t), [3, 3];
                                        case 3:
                                            return [2]
                                    }
                                })
                            })()
                        }, [v, p]),
                        T = (0, k.useCallback)(function() {
                            p && P(!0), y().catch(function(e) {
                                of(!1, p, !0), iD("Error_CreditConversion_ApiFailed", {
                                    call: "ProcessPaymentAction",
                                    statusCode: ox(e)
                                }, e)
                            }), of(!0, p, !0)
                        }, [p, y]);
                    return (0, w.jsx)(sy, {
                        id: "purchase-product-modal",
                        title: t("Heading.BuyRobuxWithCredit"),
                        onNeutral: b,
                        body: (0, w.jsxs)("div", {
                            className: "flex flex-direction-column",
                            children: [p && (0, w.jsxs)(O().Fragment, {
                                children: [(0, w.jsx)("div", {
                                    className: "order-summary bold",
                                    children: t(i0) || "Order Summary"
                                }), (0, w.jsxs)("div", {
                                    className: "purchase-banner",
                                    children: [(0, w.jsx)("span", {
                                        className: "purchase-text",
                                        children: t(i1) || "Robux purchased"
                                    }), (0, w.jsxs)("span", {
                                        className: "robux-amount-container",
                                        children: [(0, w.jsxs)("div", {
                                            className: "robux-amount",
                                            children: [(0, w.jsxs)("span", {
                                                className: "low-cogs-robux-amount-inline",
                                                children: [(0, w.jsx)("span", {
                                                    className: "icon-robux-28x28",
                                                    style: {
                                                        transform: "translateY(-2px)"
                                                    }
                                                }), l]
                                            }), (0, w.jsxs)("span", {
                                                className: "high-cogs-robux-amount-inline",
                                                children: [(0, w.jsx)("span", {
                                                    className: "icon-robux-gray-16x16",
                                                    style: {
                                                        transform: "translateY(-2px)"
                                                    }
                                                }), i4[l]]
                                            })]
                                        }), (0, w.jsx)("div", {
                                            className: "robux-amount-text",
                                            children: t(i2) || "Includes up to 25% more Robux"
                                        })]
                                    })]
                                })]
                            }, "purchase-banner-sections"), (0, w.jsxs)("div", {
                                className: "available-credit flex justify-between row-pad",
                                children: [(0, w.jsx)("span", {
                                    className: "bold",
                                    children: t("Label.AvailableCredit") || "Available Credit"
                                }), (0, w.jsx)(sh, {
                                    amount: i,
                                    currencyCode: s
                                })]
                            }), (0, w.jsxs)("div", {
                                className: "balance-due flex justify-between row-pad",
                                children: [(0, w.jsx)("span", {
                                    className: "bold",
                                    children: (t("Label.BalanceDue") || "Balance Due:").replace(":", "")
                                }), (0, w.jsx)(sh, {
                                    amount: -1 * o,
                                    currencyCode: s
                                })]
                            }), (0, w.jsx)(sv, {
                                visible: p,
                                translate: t,
                                tax: c,
                                taxRate: d,
                                isLoading: f,
                                taxDisplay: h
                            }), (0, w.jsx)("div", {
                                className: "rbx-divider"
                            }), (0, w.jsxs)("div", {
                                className: "remaining-balance flex justify-between row-pad",
                                children: [(0, w.jsx)("span", {
                                    className: "bold",
                                    children: t(iV) || "Remaining Balance"
                                }), (0, w.jsx)(sh, {
                                    amount: i - o - (h && c ? c.amount : 0),
                                    currencyCode: s
                                })]
                            }), !p && (0, w.jsxs)("div", {
                                className: "purchase-prompt",
                                children: [1 === u ? t("Message.Step1LargestAvailablePackageYouCanBuy") || "Largest package you can buy with your available credit:" : t("Message.Step2NextLargestPackage"), (0, w.jsxs)("span", {
                                    className: "robux-amount-inline",
                                    children: [" ", (0, w.jsx)("span", {
                                        className: "icon-robux-16x16",
                                        style: {
                                            transform: "translateY(-2px)"
                                        }
                                    }), l]
                                }), ". ", t(iz)]
                            }), p && (0, w.jsx)(O().Fragment, {
                                children: (0, w.jsx)("div", {
                                    className: "billing-info-section",
                                    children: (0, w.jsx)(so, {
                                        processAddressSave: x,
                                        onUpdateAddress: _,
                                        onTaxDisplayChange: m,
                                        prefilledAddress: g,
                                        onSavedAddressLoaded: S,
                                        triggeringContext: i_.ENUM_TRIGGERING_CONTEXT.WEB_REDEEM_PAGE
                                    })
                                })
                            }, "tax-flow-sections"), (0, w.jsx)("div", {
                                className: "modal-footer-buttons flex justify-between mt-4",
                                children: a ? (0, w.jsxs)("button", {
                                    type: "button",
                                    className: "btn-growth-md btn-full-width mr-2 loading-button-container",
                                    disabled: !0,
                                    children: [(0, w.jsx)("span", {
                                        className: "loading-button-text",
                                        children: t(iX)
                                    }), (0, w.jsx)("span", {
                                        className: "spinner spinner-sm loading-button-spinner"
                                    })]
                                }) : (0, w.jsx)(I.Button, {
                                    variant: I.Button.variants.growth,
                                    size: I.Button.sizes.medium,
                                    width: I.Button.widths.full,
                                    onClick: T,
                                    isDisabled: !E,
                                    className: "mr-2",
                                    children: t(iX)
                                })
                            })]
                        }),
                        actionButtonShow: !1,
                        size: "md"
                    })
                }, sp),
                sE = R((0, I.createModal)(), 2),
                sS = sE[0],
                sC = sE[1],
                sw = (0, M.withTranslations)(function(e) {
                    var t = e.translate,
                        n = oA(),
                        r = n.isConvertModalOpen,
                        a = n.isLoading,
                        i = n.isPurchasable,
                        o = n.creditBalance,
                        s = n.currencyCode,
                        u = n.convertedRobuxAmount,
                        l = n.numberOfPurchase,
                        c = n.tax,
                        d = n.taxRate,
                        f = n.taxLoading,
                        h = n.taxDisplay,
                        p = n.isTaxFlowEnabled,
                        v = n.onUpdatedAddress,
                        m = n.onTaxDisplayChange,
                        y = n.processPaymentAction,
                        b = n.closeConvertModal,
                        g = n.prefilledAddress,
                        E = n.setSavedUserAddress,
                        S = R((0, k.useState)(!1), 2),
                        C = S[0],
                        x = S[1];
                    (0, k.useEffect)(function() {
                        r ? (sC.open(), i_.sendUserPurchaseFlowEvent({
                            triggerContext: i_.ENUM_TRIGGERING_CONTEXT.WEB_REDEEM_PAGE,
                            isMidPurchaseStep: !0,
                            viewName: p ? i_.ENUM_VIEW_NAME.CREDIT_CONVERSION_MODAL_WITH_TAX : i_.ENUM_VIEW_NAME.CREDIT_CONVERSION_MODAL_WITHOUT_TAX,
                            purchaseEventType: i_.ENUM_PURCHASE_EVENT_TYPE.VIEW_SHOWN
                        })) : sC.close()
                    }, [r, p]);
                    var P = (0, k.useCallback)(function() {
                            null == r$ || r$.dispatchEvent(new r$.CustomEvent("price-tag:render", {
                                detail: {
                                    targetSelector: ".fiat-price-tag"
                                }
                            }))
                        }, []),
                        _ = (0, k.useCallback)(function(e) {
                            return D(function() {
                                var t;
                                return L(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            return n.trys.push([0, 2, , 3]), [4, v(e)];
                                        case 1:
                                            return n.sent(), od(!0, p, !1), [3, 3];
                                        case 2:
                                            return t = n.sent(), od(!1, p, !1), iD("Error_CreditConversion_ApiFailed", {
                                                call: "UpdateAddress",
                                                statusCode: ox(t)
                                            }, t), [3, 3];
                                        case 3:
                                            return [2]
                                    }
                                })
                            })()
                        }, [p, v]),
                        T = (0, k.useCallback)(function() {
                            p && x(!0), y().catch(function(e) {
                                of(!1, p, !1), iD("Error_CreditConversion_ApiFailed", {
                                    call: "ProcessPaymentAction",
                                    statusCode: ox(e)
                                }, e)
                            }), of(!0, p, !1)
                        }, [p, y]);
                    return (0, w.jsx)(sS, {
                        id: "convert-credit-modal",
                        title: t("Label.ConvertCreditSuccess"),
                        onNeutral: b,
                        body: [p && (0, w.jsxs)(O().Fragment, {
                            children: [(0, w.jsx)("div", {
                                className: "order-summary bold",
                                children: t(i0) || "Order Summary"
                            }, "order-summary"), (0, w.jsxs)("div", {
                                className: "purchase-banner",
                                children: [(0, w.jsx)("span", {
                                    className: "purchase-text",
                                    children: t(i1) || "Robux purchased"
                                }), (0, w.jsxs)("span", {
                                    className: "robux-amount-container",
                                    children: [(0, w.jsxs)("div", {
                                        className: "robux-amount",
                                        children: [(0, w.jsxs)("span", {
                                            className: "low-cogs-robux-amount-inline",
                                            children: [(0, w.jsx)("span", {
                                                className: "icon-robux-28x28",
                                                style: {
                                                    transform: "translateY(-2px)"
                                                }
                                            }), u]
                                        }), u > 5 && (0, w.jsxs)("span", {
                                            className: "high-cogs-robux-amount-inline",
                                            children: [(0, w.jsx)("span", {
                                                className: "icon-robux-gray-16x16",
                                                style: {
                                                    transform: "translateY(-2px)"
                                                }
                                            }), Math.floor(u / 1.25)]
                                        })]
                                    }), (0, w.jsx)("div", {
                                        className: "robux-amount-text",
                                        children: t(i2) || "Includes up to 25% more Robux"
                                    })]
                                })]
                            }, "purchase-banner"), (0, w.jsxs)("div", {
                                className: "available-credit flex justify-between row-pad",
                                children: [(0, w.jsx)("span", {
                                    className: "bold",
                                    children: t("Label.AvailableCredit") || "Available Credit"
                                }), (0, w.jsx)(sh, {
                                    amount: o,
                                    currencyCode: s
                                })]
                            }, "available-credit"), (0, w.jsxs)("div", {
                                className: "convertible-credit flex justify-between row-pad",
                                children: [(0, w.jsx)("span", {
                                    className: "bold",
                                    children: t(iY) || "Convertible Credit"
                                }), (0, w.jsx)(sh, {
                                    amount: o - (h && c ? c.amount : 0),
                                    currencyCode: s
                                })]
                            }, "convertible-credit"), (0, w.jsx)(sv, {
                                translate: t,
                                tax: c,
                                taxRate: d,
                                isLoading: f,
                                taxDisplay: h
                            }, "tax-line"), (0, w.jsx)("div", {
                                className: "rbx-divider"
                            }, "divider"), (0, w.jsxs)("div", {
                                className: "remaining-balance flex justify-between row-pad",
                                children: [(0, w.jsx)("span", {
                                    className: "bold",
                                    children: t(iV) || "Remaining Balance"
                                }), (0, w.jsx)(sh, {
                                    amount: 0,
                                    currencyCode: s
                                })]
                            }), (0, w.jsx)("div", {
                                className: "billing-info-section",
                                children: (0, w.jsx)(so, {
                                    processAddressSave: C,
                                    onUpdateAddress: _,
                                    onTaxDisplayChange: m,
                                    prefilledAddress: g,
                                    onSavedAddressLoaded: E,
                                    triggeringContext: i_.ENUM_TRIGGERING_CONTEXT.WEB_REDEEM_PAGE
                                })
                            }, "billing-info-section")]
                        }, "tax-flow-sections"), !p && (0, w.jsx)("div", {
                            className: "conversion-message",
                            style: {
                                marginTop: "12px"
                            },
                            dangerouslySetInnerHTML: {
                                __html: 1 === l ? t("Message.ConvertCreditToRobux25PercentMore", {
                                    robuxAmount: "".concat('<span class="icon-robux-16x16" style="transform: translateY(-2px)"></span>').concat(u),
                                    boldStart: "<b>",
                                    boldEnd: "</b>"
                                }) : "".concat(t("Message.Step3ConvertRobux", {
                                    remainingCreditBalance: "<span class='fiat-price-tag' style='margin-left: 0.25rem' data-amount=".concat(o, " data-currency-code=").concat(s, "></span>"),
                                    lineBreaker: "<br /><br />",
                                    robuxConversionAmount: '<span class="icon-robux-16x16" style="transform: translateY(-2px)"></span><b>'.concat(u, "</b>")
                                }), " ").concat(t(iz))
                            },
                            ref: P
                        }, "conversion-message-".concat(u, "-").concat(o)), (0, w.jsx)("div", {
                            className: "modal-footer-buttons flex justify-between mt-4",
                            children: a ? (0, w.jsxs)("button", {
                                type: "button",
                                className: "btn-growth-md btn-full-width mr-2 loading-button-container",
                                disabled: !0,
                                children: [(0, w.jsx)("span", {
                                    className: "loading-button-text",
                                    children: t(iq)
                                }), (0, w.jsx)("span", {
                                    className: "spinner spinner-sm loading-button-spinner"
                                })]
                            }) : (0, w.jsx)(I.Button, {
                                variant: I.Button.variants.growth,
                                size: I.Button.sizes.medium,
                                width: I.Button.widths.full,
                                onClick: T,
                                isDisabled: !i,
                                className: "mr-2",
                                children: t(iq)
                            })
                        }, "modal-footer-buttons")],
                        actionButtonShow: !1,
                        size: "md"
                    })
                }, sp),
                sx = function(e) {
                    var t = e.systemFeedbackService,
                        n = e.translate,
                        r = e.onSuccess,
                        a = (0, k.useRef)(null),
                        i = function() {
                            var e = oA().startCreditConversionFlow;
                            return (0, k.useEffect)(function() {
                                a.current = e
                            }, [e]), (0, w.jsxs)(k.Fragment, {
                                children: [(0, w.jsx)(sg, {}), (0, w.jsx)(sw, {})]
                            })
                        };
                    return [function() {
                        return (0, w.jsx)(oT, {
                            systemFeedbackService: t,
                            translate: n,
                            onSuccess: r,
                            children: (0, w.jsx)(i, {})
                        })
                    }, function(e) {
                        var t;
                        null == (t = a.current) || t.call(a, e)
                    }]
                },
                sP = function() {
                    var e = R((0, I.createModal)(), 2),
                        t = e[0],
                        n = e[1],
                        r = (0, k.useRef)(null),
                        a = (0, k.useRef)(null);
                    return [function(e) {
                        var i = e.translate,
                            o = e.systemFeedbackService,
                            s = e.onSuccess,
                            u = iG(),
                            l = R((0, k.useState)(!1), 2),
                            c = l[0],
                            d = l[1],
                            f = R((0, k.useState)(void 0), 2),
                            h = f[0],
                            p = f[1],
                            v = R((0, k.useState)(void 0), 2),
                            m = v[0],
                            y = v[1],
                            b = R((0, k.useState)(void 0), 2),
                            g = b[0],
                            E = b[1],
                            S = R((0, k.useState)(0), 2),
                            C = S[0],
                            x = S[1],
                            P = R((0, k.useState)(void 0), 2),
                            _ = P[0],
                            T = P[1],
                            A = R((0, k.useState)(0), 2),
                            U = A[0],
                            N = A[1],
                            M = R((0, k.useState)(""), 2),
                            B = M[0],
                            j = M[1],
                            F = R((0, k.useState)(!1), 2),
                            G = F[0],
                            W = F[1],
                            H = R((0, k.useState)(void 0), 2),
                            V = H[0],
                            Y = H[1],
                            X = R((0, k.useState)(!1), 2),
                            q = X[0],
                            z = X[1],
                            K = R((0, k.useState)(!1), 2),
                            Q = (K[0], K[1]),
                            J = R((0, k.useState)(!1), 2),
                            Z = J[0],
                            $ = J[1],
                            ee = R((0, k.useState)(!1), 2),
                            et = ee[0],
                            en = ee[1],
                            er = R((0, k.useState)(!1), 2),
                            ea = er[0],
                            ei = er[1],
                            eo = R((0, k.useState)(!1), 2),
                            es = eo[0],
                            eu = eo[1],
                            el = R((0, k.useState)(void 0), 2),
                            ec = el[0],
                            ed = el[1],
                            ef = (0, k.useCallback)(function(e) {
                                return D(function() {
                                    var t, n, r, a, i;
                                    return L(this, function(o) {
                                        switch (o.label) {
                                            case 0:
                                                return o.trys.push([0, 2, 3, 4]), z(!0), [4, ou(u, e)];
                                            case 1:
                                                return (t = o.sent().data).isSuccess && (d(t.robloxManagedTax), p(t.checkoutSessionId), y(t.providerPayload.CheckoutSessionToken), Q(t.hasBillingAddress), void 0 !== t.taxRate && E(t.taxRate), x(null != (n = t.providerPayload.RobuxConversionAmount) ? n : 0), T(null != (r = t.providerPayload.StrikethroughRobuxConversionAmount) ? r : void 0), N(null != (a = t.providerPayload.AvailableCreditBalance) ? a : 0), j(null != (i = t.providerPayload.CurrencyCode) ? i : ""), Y(iH(t.providerPayload.TaxAmount, t.providerPayload.CurrencyCode, t.hasBillingAddress || void 0 !== e)), ol(!0, t.robloxManagedTax, !1, null !== t.taxRate)), [3, 4];
                                            case 2:
                                                return o.sent(), eu(!0), [3, 4];
                                            case 3:
                                                return z(!1), [7];
                                            case 4:
                                                return [2]
                                        }
                                    })
                                })()
                            }, [u]);
                        (0, k.useEffect)(function() {
                            r.current = ed, a.current = ef
                        }, [ef]), (0, k.useEffect)(function() {
                            var e = U > 0 && C > 0;
                            ei(!es && (!c || G && !q) && e)
                        }, [U, C, c, G, q, es]);
                        var eh = (0, k.useCallback)(function(e) {
                                return D(function() {
                                    var t, n, r, a, i, o, s, u, l;
                                    return L(this, function(d) {
                                        switch (d.label) {
                                            case 0:
                                                if (d.trys.push([0, 2, , 3]), !h) return [2];
                                                return z(!0), [4, op(e, h)];
                                            case 1:
                                                return r = (n = (t = d.sent().data).providerPayload).AvailableCreditBalance, a = n.CurrencyCode, i = n.TaxAmount, o = n.CheckoutSessionToken, s = n.RobuxConversionAmount, u = n.StrikethroughRobuxConversionAmount, n.TotalDue, l = t.taxRate, x(null != s ? s : 0), T(null != u ? u : void 0), N(r), j(a), Y(iH(i, a, !0)), E(l), y(o), z(!1), od(!0, c, !1), [3, 3];
                                            case 2:
                                                return d.sent(), eu(!0), od(!1, c, !1), [3, 3];
                                            case 3:
                                                return [2]
                                        }
                                    })
                                })()
                            }, [h, c]),
                            ep = (0, k.useCallback)(function(e) {
                                W(e)
                            }, []),
                            ev = (0, k.useCallback)(function(e, t) {
                                var n = !t;
                                e ? (o.success(i(n ? iJ : iK)), s && s(n)) : o.warning(i(n ? iZ : iQ) || i(i$) || "Something went wrong! Please try again later.", 200, 5e3)
                            }, [o, i, s]),
                            em = (0, k.useCallback)(function(e, t) {
                                o.warning(e, 200, 5e3), n.close(), t && r$ && (r$.location.href = t3.urlService.getAbsoluteUrl("/upgrades/robux"))
                            }, [o]),
                            ey = (0, k.useCallback)(function() {
                                return D(function() {
                                    var e;
                                    return L(this, function(t) {
                                        switch (t.label) {
                                            case 0:
                                                c && $(!0), en(!0), t.label = 1;
                                            case 1:
                                                if (t.trys.push([1, 6, 7, 8]), !m) return [3, 3];
                                                return [4, iW(function() {
                                                    return ov(0, "", "", m, null == u ? void 0 : u.id, h)
                                                }, {
                                                    failedStatusPrefix: i3,
                                                    onStatusError: function() {
                                                        ev(!1, 0), en(!1)
                                                    },
                                                    onSuccess: function(e, t) {
                                                        ev(t, 0), n.close()
                                                    }
                                                })];
                                            case 2:
                                                return t.sent(), [3, 5];
                                            case 3:
                                                return [4, iW(function() {
                                                    return os(0)
                                                }, {
                                                    failedStatusPrefix: i3,
                                                    onStatusError: function() {
                                                        ev(!1, 0), en(!1)
                                                    },
                                                    onSuccess: function(e) {
                                                        var t, r = e.data;
                                                        ev(null != (t = null == r ? void 0 : r.isSuccess) && t, 0), n.close()
                                                    }
                                                })];
                                            case 4:
                                                t.sent(), t.label = 5;
                                            case 5:
                                                return of(!0, c, !1), [3, 8];
                                            case 6:
                                                if (e = t.sent(), of(!1, c, !1), oy(e)) return em(og({
                                                    translate: i,
                                                    violation: e.data.failureReason,
                                                    timeoutDurationInMinutes: e.data.expirationTimeInMinutes
                                                }), !1), oo("ProcessPayment_EconomicRestriction"), [2];
                                                return em(i(i$) || "Something went wrong! Please try again later.", !0), oo("ProcessPayment_Unexpected"), [3, 8];
                                            case 7:
                                                return en(!1), [7];
                                            case 8:
                                                return [2]
                                        }
                                    })
                                })()
                            }, [c, m, null == u ? void 0 : u.id, h, ev, em, i]);
                        return (0, w.jsx)(t, {
                            id: "convert-credit-modal",
                            title: i("Heading.ConvertCreditToRobux") || "Convert credit to Robux",
                            onNeutral: function() {
                                return n.close()
                            },
                            body: [(0, w.jsx)("div", {
                                className: "order-summary bold",
                                children: i(i0) || "Order Summary"
                            }, "order-summary"), (0, w.jsxs)("div", {
                                className: "purchase-banner",
                                children: [(0, w.jsx)("span", {
                                    className: "purchase-text",
                                    children: i(i1) || "Robux purchased"
                                }), (0, w.jsx)("span", {
                                    className: "robux-amount-container",
                                    children: (0, w.jsxs)("div", {
                                        className: "robux-amount",
                                        children: [(0, w.jsxs)("span", {
                                            className: "low-cogs-robux-amount-inline",
                                            children: [(0, w.jsx)("span", {
                                                className: "icon-robux-28x28",
                                                style: {
                                                    transform: "translateY(-2px)"
                                                }
                                            }), C]
                                        }), C > (null != _ ? _ : Math.floor(C / 1.25)) && (0, w.jsxs)("span", {
                                            className: "high-cogs-robux-amount-inline",
                                            children: [(0, w.jsx)("span", {
                                                className: "icon-robux-gray-16x16",
                                                style: {
                                                    transform: "translateY(-2px)"
                                                }
                                            }), null != _ ? _ : Math.floor(C / 1.25)]
                                        })]
                                    })
                                })]
                            }, "purchase-banner"), (0, w.jsxs)("div", {
                                className: "available-credit flex justify-between row-pad",
                                children: [(0, w.jsx)("span", {
                                    className: "bold",
                                    children: i("Label.AvailableCredit") || "Available Credit"
                                }), (0, w.jsx)(sh, {
                                    amount: U,
                                    currencyCode: B
                                })]
                            }, "available-credit"), c && (0, w.jsxs)(O().Fragment, {
                                children: [(0, w.jsx)(sv, {
                                    translate: i,
                                    tax: V,
                                    taxRate: g,
                                    isLoading: q,
                                    taxDisplay: G
                                }, "tax-line"), (0, w.jsxs)("div", {
                                    className: "convertible-credit flex justify-between row-pad",
                                    children: [(0, w.jsx)("span", {
                                        className: "bold",
                                        children: i(iY) || "Convertible Credit"
                                    }), (0, w.jsx)(sh, {
                                        amount: U - (G && V ? V.amount : 0),
                                        currencyCode: B
                                    })]
                                }, "convertible-credit")]
                            }, "tax-flow-sections"), (0, w.jsx)("div", {
                                className: "rbx-divider"
                            }, "divider"), (0, w.jsxs)("div", {
                                className: "remaining-balance flex justify-between row-pad",
                                children: [(0, w.jsx)("span", {
                                    className: "bold",
                                    children: i(iV) || "Remaining balance"
                                }), (0, w.jsx)(sh, {
                                    amount: 0,
                                    currencyCode: B
                                })]
                            }, "remaining-balance"), c && (0, w.jsx)("div", {
                                className: "billing-info-section",
                                children: (0, w.jsx)(so, {
                                    processAddressSave: Z,
                                    onUpdateAddress: eh,
                                    prefilledAddress: ec,
                                    onTaxDisplayChange: ep,
                                    triggeringContext: i_.ENUM_TRIGGERING_CONTEXT.WEB_REDEEM_PAGE
                                })
                            }, "billing-info-section"), (0, w.jsx)("div", {
                                className: "modal-footer-buttons flex justify-between mt-4",
                                children: et ? (0, w.jsxs)("button", {
                                    type: "button",
                                    className: "btn-growth-md btn-full-width mr-2 loading-button-container",
                                    disabled: !0,
                                    children: [(0, w.jsx)("span", {
                                        className: "loading-button-text",
                                        children: i(iq)
                                    }), (0, w.jsx)("span", {
                                        className: "spinner spinner-sm loading-button-spinner"
                                    })]
                                }) : (0, w.jsx)(I.Button, {
                                    variant: I.Button.variants.growth,
                                    size: I.Button.sizes.medium,
                                    width: I.Button.widths.full,
                                    onClick: ey,
                                    isDisabled: !ea,
                                    className: "mr-2",
                                    children: i(iq)
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
                },
                s_ = function(e) {
                    var t = e.translate,
                        n = e.systemFeedbackService,
                        r = e.showConvertButton,
                        a = (e.robuxAmount, e.balance),
                        i = e.currencyCode,
                        o = e.isConvertAllFlowEnabled,
                        s = e.setZeroBalance,
                        u = t("Heading.SavedCreditCard.RobloxCredit"),
                        l = t("Label.SavedCreditCard.Balance"),
                        c = R(sx({
                            systemFeedbackService: n,
                            translate: t,
                            onSuccess: function(e) {
                                s()
                            }
                        }), 2),
                        d = c[0],
                        f = c[1],
                        h = R(sP(), 2),
                        p = h[0],
                        v = h[1];
                    return (0, w.jsxs)("div", {
                        className: "roblox-credit-container",
                        children: [(0, w.jsx)(d, {}), o && (0, w.jsx)(p, {
                            systemFeedbackService: n,
                            translate: t,
                            onSuccess: function() {
                                s()
                            }
                        }), (0, w.jsxs)("div", {
                            className: "roblox-credit-header-container",
                            children: [(0, w.jsx)("span", {
                                className: "payment-method-image cardIcon ".concat(t6("robloxCredit"))
                            }), (0, w.jsx)("div", {
                                className: "roblox-credit-header text-emphasis",
                                children: u
                            })]
                        }), (0, w.jsxs)("div", {
                            className: "roblox-credit-balance",
                            children: [(0, w.jsx)("div", {
                                className: "balance-prefix",
                                children: l
                            }), (0, w.jsx)(sh, {
                                amount: a,
                                currencyCode: i
                            })]
                        }), r ? (0, w.jsx)(I.Button, {
                            className: "convert-to-robux-button btn-secondary-md",
                            onClick: function() {
                                (0, V.fireEvent)(ns), o ? v.open() : f()
                            },
                            children: t("Heading.SavedCreditCard.ConvertToRobux")
                        }) : null]
                    })
                },
                sT = function(e) {
                    var t = e.translate,
                        n = e.systemFeedbackService,
                        r = R((0, k.useState)(!0), 2),
                        a = r[0],
                        i = r[1],
                        o = R((0, k.useState)(!1), 2),
                        s = o[0],
                        u = o[1],
                        l = R((0, k.useState)(!1), 2),
                        c = l[0],
                        d = l[1],
                        f = R((0, k.useState)(0), 2),
                        h = f[0],
                        p = f[1],
                        v = R((0, k.useState)(0), 2),
                        m = v[0],
                        y = v[1],
                        b = R((0, k.useState)("USD"), 2),
                        g = b[0],
                        E = b[1],
                        S = R((0, k.useState)(!1), 2),
                        C = S[0],
                        x = S[1],
                        P = t("Heading.SavedCreditCard.OtherPaymentMethods");
                    return ((0, k.useEffect)(function() {
                        D(function() {
                            var e, t, r, a, o, s, l;
                            return L(this, function(c) {
                                switch (c.label) {
                                    case 0:
                                        i(!0), c.label = 1;
                                    case 1:
                                        return c.trys.push([1, 3, , 4]), [4, n1()];
                                    case 2:
                                        return t = (e = R.apply(void 0, [c.sent(), 6]))[0], r = e[1], a = e[2], o = e[3], s = e[4], l = e[5], u(t), d(r), p(a), y(o), E(s), x(l), [3, 4];
                                    case 3:
                                        return c.sent(), n.warning(ra), [3, 4];
                                    case 4:
                                        return i(!1), [2]
                                }
                            })
                        })()
                    }, [m]), s) ? (0, w.jsx)("div", {
                        className: "other-payment-methods-container"
                    }) : (0, w.jsxs)("div", {
                        className: "other-payment-methods-container",
                        children: [(0, w.jsx)("h5", {
                            children: P
                        }), a ? (0, w.jsx)("span", {
                            className: "spinner spinner-default"
                        }) : (0, w.jsx)(s_, {
                            translate: t,
                            systemFeedbackService: n,
                            showConvertButton: c,
                            robuxAmount: h,
                            balance: m,
                            currencyCode: g,
                            isConvertAllFlowEnabled: C,
                            setZeroBalance: function() {
                                y(0)
                            }
                        })]
                    })
                },
                sA = R((h = (f = R((0, I.createModal)(), 2))[0], [function(e) {
                    var t = e.translate,
                        n = e.systemFeedbackService,
                        r = e.onSuccess,
                        a = e.stripeEmail,
                        i = e.robloxEmail,
                        o = (0, eo.useStripe)(),
                        s = (0, eo.useElements)(),
                        u = R((0, k.useState)(!1), 2),
                        l = u[0],
                        c = u[1],
                        d = R((0, k.useState)(!1), 2),
                        f = d[0],
                        v = d[1],
                        m = R((0, k.useState)("" !== a ? a : i), 2),
                        y = m[0],
                        b = m[1],
                        g = R((0, k.useState)(null), 2),
                        E = g[0],
                        S = g[1],
                        C = "",
                        P = t("Heading.SavedCreditCard.AddPaymentMethod"),
                        _ = function() {
                            return D(function() {
                                return L(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            var t, n;
                                            return e.trys.push([0, 2, , 3]), (0, V.fireEvent)(nk), [4, (t = nZ.Stripe, n = C, D(function() {
                                                var e;
                                                return L(this, function(r) {
                                                    return e = {
                                                        withCredentials: !0,
                                                        url: "".concat(x.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-profile/by-provider-id/").concat(t, "/").concat(n)
                                                    }, [2, t3.httpService.get(e, {
                                                        paymentProvider: t,
                                                        providerPaymentProfileId: n
                                                    })]
                                                })
                                            })())];
                                        case 1:
                                            if (e.sent()) return (0, V.fireEvent)(nO), [2, !0];
                                            return [3, 3];
                                        case 2:
                                            return e.sent(), (0, V.fireEvent)(nI), [3, 3];
                                        case 3:
                                            return [2, !1]
                                    }
                                })
                            })()
                        },
                        T = function(e, a, i) {
                            return D(function() {
                                return L(this, function(o) {
                                    switch (o.label) {
                                        case 0:
                                            return o.trys.push([0, 2, , 3]), [4, e()];
                                        case 1:
                                            if (o.sent()) return n.success(t("Response.SavedCreditCard.SavePaymentMethodSuccess")), r(), c(!1), p.close(), [2];
                                            if (0 === i) return (0, V.fireEvent)(nH), n.warning(t(rr)), c(!1), p.close(), [2];
                                            return setTimeout(function() {
                                                T(e, a, i - 1)
                                            }, a), [3, 3];
                                        case 2:
                                            return o.sent(), (0, V.fireEvent)(nI), [3, 3];
                                        case 3:
                                            return [2]
                                    }
                                })
                            })()
                        };
                    return (0, w.jsx)(h, {
                        id: "add-card-modal",
                        title: P,
                        body: (0, w.jsx)(rh, {
                            translate: t,
                            elements: s,
                            onFormChange: function(e) {
                                v(e)
                            },
                            updateInputEmail: function(e) {
                                b(e)
                            },
                            stripeEmail: a,
                            robloxEmail: i,
                            stripeErrorCode: E
                        }),
                        loading: l,
                        neutralButtonText: t(rt),
                        actionButtonText: t(rn),
                        onNeutral: function() {
                            (0, V.fireEvent)(t9), p.close()
                        },
                        onAction: function() {
                            (0, V.fireEvent)(ne), D(function() {
                                var e, r, u, l, d, f, h, v;
                                return L(this, function(m) {
                                    switch (m.label) {
                                        case 0:
                                            if (!o || !s) return p.close(), [2];
                                            c(!0), S(null), e = "" === a && y !== i ? {
                                                return_url: t4(),
                                                payment_method_data: {
                                                    billing_details: {
                                                        email: y
                                                    },
                                                    allow_redisplay: "always"
                                                }
                                            } : {
                                                return_url: t4(),
                                                payment_method_data: {
                                                    allow_redisplay: "always"
                                                }
                                            }, m.label = 1;
                                        case 1:
                                            return m.trys.push([1, 3, , 4]), (0, V.fireEvent)(nG), [4, o.confirmSetup({
                                                elements: s,
                                                redirect: "if_required",
                                                confirmParams: e
                                            })];
                                        case 2:
                                            if ((null == (l = m.sent()) || null == (r = l.setupIntent) ? void 0 : r.status) === "succeeded")(0, V.fireEvent)(nW), (C = null != (d = null == l || null == (h = l.setupIntent) || null == (f = h.payment_method) ? void 0 : f.toString()) ? d : "") && T(_, 5e3, 3);
                                            else if (null == l || null == (u = l.error) ? void 0 : u.code) {
                                                switch ((0, V.fireEvent)(nH), l.error.code) {
                                                    case nV:
                                                    case nY:
                                                        S(null == l || null == (v = l.error) ? void 0 : v.code);
                                                        break;
                                                    case "card_declined":
                                                        n.warning(t("Description.SavedCreditCard.CardDeclinedErrorMessage") || "Card declined. Please review the card details or try a different card."), p.close();
                                                        break;
                                                    default:
                                                        n.warning(t(rr)), p.close()
                                                }
                                                c(!1)
                                            }
                                            return [3, 4];
                                        case 3:
                                            return m.sent(), (0, V.fireEvent)(nH), n.warning(t(rr)), p.close(), c(!1), [3, 4];
                                        case 4:
                                            return [2]
                                    }
                                })
                            })()
                        },
                        closeable: !0,
                        size: "md",
                        actionButtonShow: !0,
                        disableActionButton: f
                    })
                }, p = f[1]]), 2),
                sU = sA[0],
                sN = sA[1],
                sR = function(e) {
                    var t, n = e.translate,
                        r = e.systemFeedbackService,
                        a = e.hideAddCardButton,
                        i = e.shouldDisplaySavedPaymentMethods,
                        o = e.hideSavedPaymentMethodsIfNoSavedCards,
                        s = !!x.DeviceMeta && ((0, x.DeviceMeta)().isAndroidApp || (0, x.DeviceMeta)().isIosApp),
                        u = R((0, k.useState)(!0), 2),
                        l = u[0],
                        c = u[1],
                        d = R((0, k.useState)([]), 2),
                        f = d[0],
                        h = d[1],
                        p = R((0, k.useState)(null), 2),
                        v = p[0],
                        m = p[1],
                        y = R((0, k.useState)(""), 2),
                        b = y[0],
                        g = y[1],
                        E = R((0, k.useState)(""), 2),
                        S = E[0],
                        C = E[1],
                        P = R((0, k.useState)(""), 2),
                        _ = P[0],
                        T = P[1],
                        A = n("Heading.SavedCreditCard.SavedPaymentMethod"),
                        U = n("Description.SavedCreditCard.NoSavedPaymentMethods"),
                        N = function() {
                            return D(function() {
                                var e, t;
                                return L(this, function(a) {
                                    switch (a.label) {
                                        case 0:
                                            return a.trys.push([0, 2, , 3]), (0, V.fireEvent)(nb), [4, D(function() {
                                                var e;
                                                return L(this, function(t) {
                                                    return e = {
                                                        withCredentials: !0,
                                                        url: "".concat(x.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-profiles")
                                                    }, [2, t3.httpService.get(e)]
                                                })
                                            })()];
                                        case 1:
                                            return (null == (t = a.sent()) || null == (e = t.data) ? void 0 : e.length) > 0 && i && h(t.data.slice()), (0, V.fireEvent)(ng), [3, 3];
                                        case 2:
                                            return a.sent(), (0, V.fireEvent)(nE), r.warning(n(ra)), [3, 3];
                                        case 3:
                                            return c(!1), [2]
                                    }
                                })
                            })()
                        };
                    (0, k.useEffect)(function() {
                        N()
                    }, [a, i]);
                    var O = (0, k.useCallback)(function() {
                            return D(function() {
                                return L(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return [4, D(function() {
                                                var e, t;
                                                return L(this, function(a) {
                                                    switch (a.label) {
                                                        case 0:
                                                            return a.trys.push([0, 2, , 3]), e = x.EnvironmentUrls.websiteUrl.includes("sitetest1") ? "pk_test_51LNM0XG5RADBkfjhYJlpADA2ArzWIh7gTWTodYNbpEzSiT55dul3VJhaBIVHL0CNyO0gECOz1vPnWArAkjwQ8NBO00Cdf2PxED" : x.EnvironmentUrls.websiteUrl.includes("sitetest3") ? "pk_test_51LNOeQHDRNiW7vlLcKH8TGCpJ7zhaidLdSegE22GCuvQbVUX2xDiGJY6WYaldYyo6qgVxmy1SnSVpSdaqyjfqclU00NQwWntIe" : "pk_live_51LKpO9C8tJWGhK4HEHtny9Dg7xXiQJ1i349cq6KBDusbl8bRHO7QmCKKhX18LPjSirMNTvj3tesq6mhIQuPioeAd0062ZCgoF3", (0, V.fireEvent)(nL), [4, ei(e)];
                                                        case 1:
                                                            return t = a.sent(), (0, V.fireEvent)(nj), m(t), [3, 3];
                                                        case 2:
                                                            return a.sent(), (0, V.fireEvent)(nF), r.warning(n(ra)), [3, 3];
                                                        case 3:
                                                            return [2]
                                                    }
                                                })
                                            })()];
                                        case 1:
                                            return e.sent(), [4, D(function() {
                                                var e, t, a, i, o, s, u, l, c, d, f;
                                                return L(this, function(h) {
                                                    switch (h.label) {
                                                        case 0:
                                                            var p;
                                                            return h.trys.push([0, 2, , 3]), (0, V.fireEvent)(nf), [4, (p = nZ.Stripe, D(function() {
                                                                var e;
                                                                return L(this, function(t) {
                                                                    return e = {
                                                                        withCredentials: !0,
                                                                        url: "".concat(x.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/payment-profile/prepare")
                                                                    }, [2, t3.httpService.post(e, {
                                                                        paymentProvider: p
                                                                    })]
                                                                })
                                                            })())];
                                                        case 1:
                                                            return c = h.sent(), (0, V.fireEvent)(nh), g(null != (e = null == c || null == (i = c.data) || null == (a = i.providerPayload) ? void 0 : a.clientSecret) ? e : ""), (null == c || null == (s = c.data) || null == (o = s.providerPayload) ? void 0 : o.stripeCustomerEmail) ? (C(null == c || null == (f = c.data) || null == (d = f.providerPayload) ? void 0 : d.stripeCustomerEmail), (0, V.fireEvent)(ni)) : (0, V.fireEvent)(no), T(null != (t = null == c || null == (l = c.data) || null == (u = l.providerPayload) ? void 0 : u.robloxUserEmail) ? t : ""), [3, 3];
                                                        case 2:
                                                            return h.sent(), (0, V.fireEvent)(np), r.warning(n(ra)), [3, 3];
                                                        case 3:
                                                            return [2]
                                                    }
                                                })
                                            })()];
                                        case 2:
                                            return e.sent(), sN.open(), (0, V.fireEvent)(t7), [2]
                                    }
                                })
                            })()
                        }, []),
                        M = (0, k.useCallback)(function() {
                            return D(function() {
                                return L(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return [4, N()];
                                        case 1:
                                            return e.sent(), [2]
                                    }
                                })
                            })()
                        }, [a, i]),
                        B = function(e) {
                            if (f) {
                                var t = f.slice();
                                t.splice(e, 1), h(t)
                            }
                        },
                        j = !(o && (null == f ? void 0 : f.length) === 0);
                    return l || (f && f.length > 0 ? t = null == f ? void 0 : f.map(function(e, t) {
                        var a = e.providerPayload;
                        return "paypal" === a.paymentProfileType ? (0, w.jsx)(rd, {
                            translate: n,
                            systemFeedbackService: r,
                            updatePaymentProfiles: function() {
                                B(t)
                            },
                            paymentProfileId: e.id,
                            email: a.Email
                        }, e.id.substring(0, 4)) : "card" === a.paymentProfileType ? (0, w.jsx)(rc, {
                            translate: n,
                            systemFeedbackService: r,
                            updatePaymentProfiles: function() {
                                B(t)
                            },
                            paymentProfileId: e.id,
                            cardType: a.CardNetwork,
                            lastFour: a.Last4Digits,
                            expMonth: a.ExpMonth,
                            expYear: a.ExpYear
                        }, e.id.substring(0, 4)) : null
                    }) : (t = j && (0, w.jsx)("div", {
                        className: "no-payment-methods-text",
                        children: U
                    }), (0, V.fireEvent)(nS))), (0, w.jsxs)("div", {
                        className: "payment-methods-settings-container",
                        children: [v && b ? (0, w.jsx)(eo.Elements, {
                            stripe: v && b ? v : null,
                            options: v && b ? {
                                clientSecret: b,
                                wallets: {
                                    applePay: "never",
                                    googlePay: "never"
                                },
                                appearance: {
                                    theme: document.body.classList.contains("dark-theme") ? "night" : "stripe",
                                    labels: "above"
                                }
                            } : void 0,
                            children: (0, w.jsx)(sU, {
                                translate: n,
                                systemFeedbackService: r,
                                onSuccess: function() {
                                    M()
                                },
                                stripeEmail: S,
                                robloxEmail: _
                            })
                        }, b) : null, j && (0, w.jsxs)("div", {
                            className: "saved-payment-method-header-container",
                            children: [(0, w.jsx)("h5", {
                                children: A
                            }), s || a ? null : (0, w.jsx)(I.Button, {
                                className: "add-card-button btn-secondary-md",
                                onClick: function() {
                                    O(), (0, V.fireEvent)(t7)
                                },
                                children: n("Action.Add")
                            })]
                        }), l ? (0, w.jsx)("span", {
                            className: "spinner spinner-default"
                        }) : t, s ? null : (0, w.jsx)(sT, {
                            translate: n,
                            systemFeedbackService: r
                        })]
                    })
                },
                sk = window.Roblox["core-scripts"].meta.user,
                sO = function(e) {
                    var t = e.translate,
                        n = e.subscriptionIconClassName,
                        r = e.subscriptionName,
                        a = e.showCancelButton,
                        i = e.cancelSubscriptionUrl,
                        o = e.autoRenewDate,
                        s = e.expirationDate,
                        u = t("Label.SavedCreditCard.RenewsOn"),
                        l = "".concat(u, " ").concat(o),
                        c = t("Label.SavedCreditCard.ExpiresOn"),
                        d = "".concat(c, " ").concat(s);
                    return (0, w.jsxs)("div", {
                        className: "subscription-container",
                        children: [(0, w.jsx)("span", {
                            className: n
                        }), (0, w.jsxs)("div", {
                            className: "subscription-desc",
                            children: [(0, w.jsx)("div", {
                                className: "subscription-header font-bold",
                                children: r
                            }), "" !== o ? (0, w.jsx)("p", {
                                children: l
                            }) : (0, w.jsx)("div", {
                                className: "expiration-text",
                                children: d
                            })]
                        }), "" !== o && a ? (0, w.jsx)(I.Button, {
                            className: "cancel-subscription-button btn-secondary-md",
                            onClick: function() {
                                (0, V.fireEvent)(nc), window.location.href = i
                            },
                            children: t(rt)
                        }) : null]
                    })
                },
                sI = function(e) {
                    var t = e.translate,
                        n = e.systemFeedbackService,
                        r = R((0, k.useState)(null), 2),
                        a = r[0],
                        i = r[1],
                        o = R((0, k.useState)(!0), 2),
                        s = o[0],
                        u = o[1],
                        l = t("Label.DevSubs") || "Subscriptions",
                        c = t("Description.SavedCreditCard.NoPremium"),
                        d = "";
                    (0, k.useEffect)(function() {
                        D(function() {
                            var e, r, a;
                            return L(this, function(o) {
                                switch (o.label) {
                                    case 0:
                                        u(!0), o.label = 1;
                                    case 1:
                                        return o.trys.push([1, 3, , 4]), (0, V.fireEvent)(nP), [4, n0(null != (e = null == (r = (0, sk.authenticatedUser)()) ? void 0 : r.id) ? e : 0)];
                                    case 2:
                                        return (null == (a = o.sent()) ? void 0 : a.status) === 200 && ((0, V.fireEvent)(n_), i(null == a ? void 0 : a.data)), [3, 4];
                                    case 3:
                                        return 404 === o.sent().status ? (0, V.fireEvent)(nu) : ((0, V.fireEvent)(nT), n.warning(t(ra))), [3, 4];
                                    case 4:
                                        return u(!1), [2]
                                }
                            })
                        })()
                    }, []);
                    var f = "",
                        h = "";
                    if (null == a ? void 0 : a.subscriptionProductModel.subscriptionName) {
                        var p = new x.Intl().getDateTimeFormatter();
                        (null == a ? void 0 : a.subscriptionProductModel.renewal) && (f = p.getCustomDateTime(null == a ? void 0 : a.subscriptionProductModel.renewal, {
                            month: "short",
                            day: "2-digit",
                            year: "numeric"
                        })), (null == a ? void 0 : a.subscriptionProductModel.expiration) && (h = p.getCustomDateTime(null == a ? void 0 : a.subscriptionProductModel.expiration, {
                            month: "short",
                            day: "2-digit",
                            year: "numeric"
                        }))
                    }
                    return s ? (0, w.jsxs)("div", {
                        children: [(0, w.jsx)("h2", {
                            className: "main-header",
                            children: l
                        }), (0, w.jsx)("span", {
                            className: "spinner spinner-default"
                        })]
                    }) : null !== a ? (0, w.jsxs)("div", {
                        children: [(0, w.jsx)("h2", {
                            className: "main-header",
                            children: l
                        }), (0, w.jsx)(sO, {
                            translate: t,
                            subscriptionIconClassName: "icon-premium-medium",
                            subscriptionName: null == a ? void 0 : a.subscriptionProductModel.subscriptionName,
                            showCancelButton: function() {
                                var e = (0, r3.getDeviceMeta)();
                                if (a && "isDesktop" === a.subscriptionProductModel.purchasePlatform) {
                                    if (!(null == e ? void 0 : e.isInApp) || e.isUniversalApp && e.isDesktop && !e.isUWPApp) return d = t3.urlService.getAbsoluteUrl("/upgrades/cancel-subscription"), !0
                                } else if (a && "isAndroidApp" === a.subscriptionProductModel.purchasePlatform && (null == e ? void 0 : e.isAndroidApp)) return d = "https://play.google.com/store/account/subscriptions", !0;
                                return !1
                            }(),
                            cancelSubscriptionUrl: d,
                            autoRenewDate: f,
                            expirationDate: h
                        })]
                    }) : (0, w.jsxs)("div", {
                        children: [(0, w.jsx)("h2", {
                            className: "main-header",
                            children: l
                        }), (0, w.jsxs)("div", {
                            className: "subscription-container",
                            children: [(0, w.jsx)("p", {
                                className: "no-subscription-text",
                                children: c
                            }), (0, w.jsx)(I.Button, {
                                className: "subscribe-button btn-secondary-md",
                                onClick: function() {
                                    (0, V.fireEvent)(nl), window.location.href = t3.urlService.getAbsoluteUrl("/premium/membership")
                                },
                                children: t("Action.Subscribe")
                            })]
                        })]
                    })
                },
                sM = ((v = {}).Default = "NotificationsOnlyOnThresholdPassed", v.AllNotifications = "NotificationsEveryAmountSpent", v.NotificationsOff = "NotificationsOff", v),
                sB = ((m = {}).Enabled = "Enabled", m.Disabled = "Disabled", m),
                sD = ((y = {}).None = "None", y.ParentalConsent = "ParentalConsent", y.SelfUpdateSetting = "SelfUpdateSetting", y.ContentAgeRestrictionVerification = "ContentAgeRestrictionVerification", y.FacialAgeEstimation = "FacialAgeEstimation", y.IdVerification = "IdVerification", y.VpcForFae = "VpcForFae", y.AgeCheckPending = "AgeCheckPending", y.ParentConsentInherited = "ParentConsentInherited", y.Inherited = "Inherited", y.ReadableButNotActionable = "ReadableButNotActionable", y),
                sL = function(e) {
                    var t = e.translate,
                        n = e.titleResourceId,
                        r = e.translatedTitle,
                        a = e.bodyResourceId,
                        i = e.translatedBody,
                        o = e.actionButtonTextResourceId,
                        s = e.neutralButtonTextResourceId,
                        u = e.footerTextResourceId,
                        l = e.size,
                        c = e.footerHyperlink,
                        d = e.onAction,
                        f = e.disableActionButton,
                        h = e.disabledNeutralButton,
                        p = e.shouldCloseModalOnActionButton,
                        v = void 0 === p || p,
                        m = e.onHide,
                        y = void 0 === m ? function() {} : m,
                        b = e.onNeutral,
                        g = R((0, k.useState)(!1), 2),
                        E = g[0],
                        S = g[1],
                        C = (0, k.useMemo)(function() {
                            return {
                                open: function() {
                                    S(!0)
                                },
                                close: function() {
                                    S(!1)
                                }
                            }
                        }, []),
                        x = sc()({
                            "modal-half-width-button": s,
                            "modal-full-width-button": !s
                        });
                    return [(0, w.jsxs)(I.Modal, {
                        show: E,
                        onHide: function() {
                            C.close(), y()
                        },
                        backdrop: !0,
                        className: "user-settings-modal",
                        size: void 0 === l ? "lg" : l,
                        "aria-labelledby": "user-settings-modal-title",
                        scrollable: !0,
                        centered: !0,
                        children: [(0, w.jsxs)(I.Modal.Header, {
                            useBaseBootstrapComponent: !0,
                            children: [(0, w.jsx)("div", {
                                className: "user-settings-modal-title-container",
                                children: (0, w.jsx)(I.Modal.Title, {
                                    id: "user-settings-modal-title",
                                    children: r || n && t(n)
                                })
                            }), (0, w.jsx)("button", {
                                type: "button",
                                className: "close close-button",
                                onClick: function() {
                                    C.close(), y()
                                },
                                children: (0, w.jsx)("span", {
                                    className: "icon-close"
                                })
                            })]
                        }), (0, w.jsx)(I.Modal.Body, {
                            children: i || a && t(a)
                        }), (0, w.jsxs)(I.Modal.Footer, {
                            children: [o && (0, w.jsx)(I.Button, {
                                className: x,
                                variant: I.Button.variants.primary,
                                size: I.Button.sizes.medium,
                                isDisabled: f,
                                onClick: function() {
                                    v && C.close(), null == d || d()
                                },
                                children: t(o)
                            }), s && (0, w.jsx)(I.Button, {
                                className: x,
                                variant: I.Button.variants.secondary,
                                size: I.Button.sizes.medium,
                                isDisabled: h,
                                onClick: function() {
                                    C.close(), null == b || b()
                                },
                                children: t(s)
                            })]
                        }), u && c && (0, w.jsx)("div", {
                            className: "text-footer user-settings-modal-text-footer border-top",
                            children: (0, w.jsxs)("span", {
                                children: [(0, w.jsx)("div", {
                                    className: "icon-moreinfo"
                                }), (0, w.jsx)("a", {
                                    className: "text-link user-settings-modal-text-footer-link",
                                    target: "_blank",
                                    rel: "noreferrer",
                                    href: c,
                                    children: t(u)
                                })]
                            })
                        })]
                    }), C]
                },
                sj = "authPageload",
                sF = "authButtonClick",
                sG = "authModalShown",
                sW = "settingsSpending",
                sH = "spendingDisplayAllowPurchases",
                sV = "spendingHideAllowPurchases",
                sY = "allowPurchases",
                sX = "spendLimit",
                sq = "askParentConfirm",
                sz = "cancelModal",
                sK = "askParent",
                sQ = "askParentConfirm",
                sJ = "cancelAskParentConfirm",
                sZ = "cancelRequest",
                s$ = "doNotCancelRequest",
                s0 = "Spending",
                s1 = "Ask My Parent",
                s2 = "Ask your parent",
                s3 = "Ask now",
                s4 = "Cancel",
                s5 = "Cancel request",
                s6 = "Do Not Cancel",
                s8 = function(e, t) {
                    oh.eventStreamService.sendEventWithTarget(e, sW, t)
                },
                s7 = function(e) {
                    s8(sj, {
                        state: e,
                        associatedText: s0
                    })
                },
                s9 = function(e) {
                    s8(sF, {
                        btn: sK,
                        state: e,
                        associatedText: s1
                    })
                },
                ue = function(e) {
                    s8(sG, {
                        field: sq,
                        state: e,
                        associatedText: s2
                    })
                },
                ut = function(e) {
                    s8(sF, {
                        btn: sQ,
                        state: e,
                        associatedText: s3
                    })
                },
                un = function(e) {
                    s8(sF, {
                        btn: sJ,
                        state: e,
                        associatedText: s4
                    })
                },
                ur = function(e) {
                    s8(sG, {
                        state: e,
                        field: sz,
                        associatedText: s5
                    })
                },
                ua = function(e) {
                    s8(sG, {
                        state: e,
                        field: sz,
                        associatedText: s5
                    })
                },
                ui = function(e) {
                    s8(sF, {
                        btn: sZ,
                        state: e,
                        associatedText: s5
                    })
                },
                uo = function(e) {
                    s8(sF, {
                        btn: s$,
                        state: e,
                        associatedText: s6
                    })
                },
                us = function(e) {
                    var t = e.systemFeedbackService,
                        n = e.translate,
                        r = e.onSuccess,
                        a = e.consentId,
                        i = e.state,
                        o = R(sL({
                            translate: n,
                            titleResourceId: n9,
                            bodyResourceId: "Description.CancelSettingUpdateRequest",
                            actionButtonTextResourceId: "Action.Dialog.Yes",
                            neutralButtonTextResourceId: "Action.Dialog.No",
                            size: "sm",
                            onAction: function() {
                                return D(function() {
                                    return L(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                if (ui(i), !a) return [3, 4];
                                                e.label = 1;
                                            case 1:
                                                return e.trys.push([1, 3, , 4]), [4, D(function() {
                                                    var e;
                                                    return L(this, function(t) {
                                                        return e = {
                                                            withCredentials: !0,
                                                            url: "".concat(x.EnvironmentUrls.apiGatewayUrl, "/child-requests-api/v1/cancel-consent-request")
                                                        }, [2, t3.httpService.post(e, {
                                                            consentId: a
                                                        })]
                                                    })
                                                })()];
                                            case 2:
                                                return e.sent(), r(), t.success(n(ri)), [3, 4];
                                            case 3:
                                                return e.sent(), t.warning(n(ra)), [3, 4];
                                            case 4:
                                                return [2]
                                        }
                                    })
                                })()
                            },
                            onNeutral: function() {
                                uo(i)
                            }
                        }), 2),
                        s = o[0],
                        u = o[1];
                    return [s, {
                        open: function() {
                            ua(i), u.open()
                        },
                        close: u.close
                    }]
                },
                uu = function(e) {
                    var t = e.title,
                        n = e.description,
                        r = e.currentSettingValueComponent,
                        a = e.metadata,
                        i = e.showArrow,
                        o = e.onClick,
                        s = e.footer,
                        u = e.disabled,
                        l = sc()("spending-settings-list-item-container", {
                            "text-disabled": u
                        }),
                        c = sc()("spending-settings-list-item-info", {
                            "text-disabled": u
                        }),
                        d = sc()("spending-settings-list-item-value-arrow", {
                            "text-disabled": u
                        });
                    return (0, w.jsxs)("div", {
                        children: [(0, w.jsxs)("button", {
                            className: l,
                            type: "button",
                            onClick: o,
                            disabled: u,
                            children: [(0, w.jsxs)("div", {
                                className: c,
                                children: [(0, w.jsx)("span", {
                                    className: "spending-setting-name font-body ",
                                    children: t
                                }), n && (0, w.jsx)("span", {
                                    className: "small text",
                                    children: n
                                })]
                            }), a, (r || i) && (0, w.jsxs)("div", {
                                className: d,
                                children: [r, i && (0, w.jsx)("div", {
                                    children: (0, w.jsx)("span", {
                                        className: "icon-chevron-heavy-right"
                                    })
                                })]
                            })]
                        }), s && (0, w.jsx)("p", {
                            className: "spending-settings-list-item-footer small text",
                            dangerouslySetInnerHTML: {
                                __html: s
                            }
                        })]
                    })
                };
            uu.defaultProps = {
                description: void 0,
                currentSettingValueComponent: void 0,
                metadata: void 0,
                showArrow: !1,
                onClick: void 0,
                footer: void 0,
                disabled: !1
            };
            var ul = function(e) {
                    var t = e.translate;
                    return (0, w.jsxs)("div", {
                        className: "setting-option-pill xsmall ",
                        children: [(0, w.jsx)("span", {
                            className: "icon-uiblox-pending themified-icon"
                        }), (0, w.jsx)("span", {
                            className: "setting-option-label",
                            children: t("Label.Pending")
                        })]
                    })
                },
                uc = function(e) {
                    var t = e.enablePurchaseSettings,
                        n = e.translate,
                        r = e.systemFeedbackService,
                        a = R((0, k.useState)(null), 2),
                        i = a[0],
                        o = a[1],
                        s = R((0, k.useState)(), 2),
                        u = s[0],
                        l = s[1],
                        c = (null == t ? void 0 : t.currentValue) === sB.Disabled,
                        d = function() {
                            return D(function() {
                                var e, t;
                                return L(this, function(a) {
                                    switch (a.label) {
                                        case 0:
                                            var i;
                                            return a.trys.push([0, 2, , 3]), [4, (i = null != (e = null == (t = (0, sk.authenticatedUser)()) ? void 0 : t.id) ? e : 0, D(function() {
                                                var e;
                                                return L(this, function(t) {
                                                    switch (t.label) {
                                                        case 0:
                                                            return [4, n4(i, void 0, e = [])];
                                                        case 1:
                                                            return t.sent(), [2, e.find(function(e) {
                                                                var t;
                                                                return (null == e || null == (t = e.consentData) ? void 0 : t.monthlySpendLimit) !== void 0
                                                            }) || null]
                                                    }
                                                })
                                            })())];
                                        case 1:
                                            return l(a.sent()), [3, 3];
                                        case 2:
                                            return a.sent(), r.warning(n(ra)), [3, 3];
                                        case 3:
                                            return [2]
                                    }
                                })
                            })()
                        };
                    (0, k.useEffect)(function() {
                        D(function() {
                            return L(this, function(e) {
                                switch (e.label) {
                                    case 0:
                                        return e.trys.push([0, 2, , 3]), [4, n3()];
                                    case 1:
                                        return o(e.sent()), [3, 3];
                                    case 2:
                                        return e.sent(), r.warning(n(ra)), [3, 3];
                                    case 3:
                                        return [2]
                                }
                            })
                        })(), d()
                    }, []), (0, k.useEffect)(function() {
                        window.dispatchEvent(new CustomEvent("price-tag:render", {
                            detail: {
                                targetSelector: ".fiat-spending-limit-tag",
                                tagClassName: "font-body"
                            }
                        }))
                    }, [i]);
                    var f = R(sL({
                            translate: n,
                            titleResourceId: n7,
                            bodyResourceId: "Description.AskMoreRobux",
                            actionButtonTextResourceId: "Action.AskMoreRobux",
                            neutralButtonTextResourceId: rt,
                            size: "sm",
                            onAction: function() {
                                return D(function() {
                                    return L(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return ut(sX), [4, D(function() {
                                                    return L(this, function(e) {
                                                        switch (e.label) {
                                                            case 0:
                                                                return e.trys.push([0, 3, , 4]), [4, x.AccessManagementUpsellV2Service.startAccessManagementUpsell({
                                                                    featureName: nX,
                                                                    namespace: nq,
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
                                                                return e.sent(), r.warning(n(ra)), [3, 4];
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
                                un(sX)
                            }
                        }), 2),
                        h = f[0],
                        p = f[1],
                        v = (null == i ? void 0 : i.monthlySpendLimit) !== null && (null == i ? void 0 : i.monthlySpendLimit) !== void 0,
                        m = (0, w.jsx)("span", {
                            className: "fiat-spending-limit-tag",
                            "data-amount": null == i ? void 0 : i.monthlySpendLimit,
                            "data-currency-code": null == i ? void 0 : i.monthlySpendLimitCurrencyType
                        }),
                        y = R(us({
                            systemFeedbackService: r,
                            translate: n,
                            consentId: null == u ? void 0 : u.id,
                            onSuccess: d,
                            state: sX
                        }), 2),
                        b = y[0],
                        g = y[1],
                        E = function() {
                            return n("Description.MonthlySpendLimitDisclaimer", {
                                linkStart: '<a href="https://help.roblox.com/hc/articles/4409125091348" class="text-link" target="_blank">',
                                linkEnd: "</a>"
                            })
                        };
                    if (v) return (0, w.jsxs)("div", {
                        className: "section-content spending-setting-container",
                        children: [(0, w.jsx)(uu, {
                            disabled: c,
                            title: n(re),
                            currentSettingValueComponent: (0, w.jsxs)(O().Fragment, {
                                children: [u && (0, w.jsx)(ul, {
                                    translate: n
                                }), m]
                            }),
                            onClick: function() {
                                c || (u ? g.open() : (ue(sX), p.open()))
                            },
                            showArrow: !0,
                            footer: E()
                        }), (0, w.jsx)("div", {
                            className: "request-consent-button-container",
                            children: u && (0, w.jsx)(I.Button, {
                                variant: I.Button.variants.secondary,
                                onClick: function() {
                                    ur(sX), g.open()
                                },
                                children: n(n9)
                            })
                        }), h, b]
                    });
                    var S = (0, w.jsx)("span", {
                        className: "text-description",
                        children: n("Label.NoLimit")
                    });
                    return (0, w.jsx)("div", {
                        className: "section-content spending-setting-container",
                        children: (0, w.jsx)(uu, {
                            title: n(re),
                            currentSettingValueComponent: S,
                            footer: E()
                        })
                    })
                },
                ud = function(e) {
                    var t = e.translate;
                    return (0, w.jsxs)("div", {
                        className: "setting-option-pill xsmall ",
                        children: [(0, w.jsx)("span", {
                            className: "icon-status-private themified-icon"
                        }), (0, w.jsx)("span", {
                            className: "setting-option-label",
                            children: t("Label.Parent")
                        })]
                    })
                },
                uf = function() {
                    var e = new CustomEvent("refetchUserSettingsEvent");
                    window.dispatchEvent(e)
                },
                uh = function(e) {
                    var t = e.enablePurchaseSettings,
                        n = e.refetchEnablePurchaseSettings,
                        r = e.translate,
                        a = e.systemFeedbackService,
                        i = R((0, k.useState)(), 2),
                        o = i[0],
                        s = i[1],
                        u = R((0, k.useState)(!1), 2),
                        l = u[0],
                        c = u[1],
                        d = R((0, k.useState)(!1), 2),
                        f = d[0],
                        h = d[1],
                        p = R((0, k.useState)(!1), 2),
                        v = p[0],
                        m = p[1],
                        y = t.currentValue === sB.Enabled,
                        b = function() {
                            return D(function() {
                                var e, t;
                                return L(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            var i;
                                            return n.trys.push([0, 2, , 3]), [4, (i = null != (e = null == (t = (0, sk.authenticatedUser)()) ? void 0 : t.id) ? e : 0, D(function() {
                                                var e;
                                                return L(this, function(t) {
                                                    switch (t.label) {
                                                        case 0:
                                                            return [4, n4(i, void 0, e = [])];
                                                        case 1:
                                                            return t.sent(), [2, e.find(function(e) {
                                                                var t;
                                                                return (null == e || null == (t = e.consentData) ? void 0 : t.enablePurchases) !== void 0
                                                            }) || null]
                                                    }
                                                })
                                            })())];
                                        case 1:
                                            return s(n.sent()), h(y), m(!1), [3, 3];
                                        case 2:
                                            return n.sent(), a.warning(r(ra)), [3, 3];
                                        case 3:
                                            return [2]
                                    }
                                })
                            })()
                        },
                        g = function() {
                            var e;
                            null == (e = t.options) || e.forEach(function(e) {
                                var n = e.requirement;
                                e.option.optionValue !== t.currentValue && n === sD.ParentalConsent && c(!0), h(y)
                            })
                        };
                    (0, k.useEffect)(function() {
                        b(), g()
                    }, [t]);
                    var E = R(us({
                            systemFeedbackService: a,
                            translate: r,
                            consentId: null == o ? void 0 : o.id,
                            onSuccess: b,
                            state: sY
                        }), 2),
                        S = E[0],
                        C = E[1],
                        P = function() {
                            return D(function() {
                                var e;
                                return L(this, function(t) {
                                    switch (t.label) {
                                        case 0:
                                            if (!l) return [3, 2];
                                            return [4, D(function() {
                                                return L(this, function(e) {
                                                    switch (e.label) {
                                                        case 0:
                                                            return e.trys.push([0, 3, , 4]), [4, x.AccessManagementUpsellV2Service.startAccessManagementUpsell({
                                                                featureName: nX,
                                                                namespace: nq,
                                                                isAsyncCall: !1,
                                                                usePrologue: !1,
                                                                ampRecourseData: {
                                                                    enablePurchases: sB.Enabled
                                                                }
                                                            })];
                                                        case 1:
                                                            return e.sent(), [4, b()];
                                                        case 2:
                                                            return e.sent(), [3, 4];
                                                        case 3:
                                                            return e.sent(), a.warning(r(ra)), [3, 4];
                                                        case 4:
                                                            return [2]
                                                    }
                                                })
                                            })()];
                                        case 1:
                                            return t.sent(), [3, 3];
                                        case 2:
                                            var i;
                                            (i = e = f ? sB.Disabled : sB.Enabled, D(function() {
                                                var e;
                                                return L(this, function(t) {
                                                    return e = {
                                                        withCredentials: !0,
                                                        url: "".concat(x.EnvironmentUrls.userSettingsApi, "/v1/user-settings")
                                                    }, [2, t3.httpService.post(e, {
                                                        enablePurchases: i
                                                    })]
                                                })
                                            })()).then(function() {
                                                h(e === sB.Enabled), a.success(r(ri)), n(), uf()
                                            }).catch(function(e) {
                                                a.warning(r(ra))
                                            }), t.label = 3;
                                        case 3:
                                            return [2]
                                    }
                                })
                            })()
                        };
                    return (0, w.jsxs)(O().Fragment, {
                        children: [(0, w.jsxs)("div", {
                            className: "section-content spending-setting-container",
                            children: [(0, w.jsx)(uu, {
                                title: r("Heading.AllowPurchases"),
                                currentSettingValueComponent: (0, w.jsxs)(O().Fragment, {
                                    children: [o && (0, w.jsx)(ul, {
                                        translate: r
                                    }), l && !o && (0, w.jsx)(ud, {
                                        translate: r
                                    }), (0, w.jsx)(I.Toggle, {
                                        id: "allow-purchases-toggle",
                                        isOn: f,
                                        onToggle: function() {
                                            return D(function() {
                                                return L(this, function(e) {
                                                    switch (e.label) {
                                                        case 0:
                                                            if (o) return C.open(), [2];
                                                            if (l && !f !== y) return h(function(e) {
                                                                return !e
                                                            }), m(!0), [2];
                                                            if (l) return [3, 2];
                                                            return [4, P()];
                                                        case 1:
                                                            return e.sent(), [2];
                                                        case 2:
                                                            return h(function(e) {
                                                                return !e
                                                            }), m(!1), [2]
                                                    }
                                                })
                                            })()
                                        }
                                    })]
                                }),
                                footer: r("Description.AllowPurchaseDisclaimer", {
                                    premiumSubscriptionsLinkStart: '<a href="https://help.roblox.com/hc/articles/47967913158164" class="text-link" target="_blank">',
                                    premiumSubscriptionsLinkEnd: "</a>",
                                    inExperienceSubscriptionsLinkStart: '<a href="https://help.roblox.com/hc/articles/20292312961556" class="text-link" target="_blank">',
                                    inExperienceSubscriptionsLinkEnd: "</a>"
                                })
                            }), (0, w.jsxs)("div", {
                                className: "request-consent-button-container",
                                children: [v && !o && (0, w.jsx)(I.Button, {
                                    className: "enable-purchase-action-button",
                                    variant: I.Button.variants.primary,
                                    onClick: function() {
                                        return D(function() {
                                            return L(this, function(e) {
                                                switch (e.label) {
                                                    case 0:
                                                        return s9(sY), [4, P()];
                                                    case 1:
                                                        return e.sent(), [2]
                                                }
                                            })
                                        })()
                                    },
                                    children: r(n7)
                                }), o && (0, w.jsx)(I.Button, {
                                    className: "enable-purchase-action-button",
                                    variant: I.Button.variants.secondary,
                                    onClick: function() {
                                        ur(sY), C.open()
                                    },
                                    children: r(n9)
                                })]
                            })]
                        }), S]
                    })
                },
                up = function(e) {
                    var t = e.translate,
                        n = e.systemFeedbackService,
                        r = !!x.DeviceMeta && ((0, x.DeviceMeta)().isAndroidApp || (0, x.DeviceMeta)().isIosApp),
                        a = R((0, k.useState)(!0), 2),
                        i = a[0],
                        o = a[1],
                        s = R((0, k.useState)(!0), 2),
                        u = s[0],
                        l = s[1],
                        c = R((0, k.useState)(!1), 2),
                        d = c[0],
                        f = c[1],
                        h = R((0, k.useState)(0), 2),
                        p = h[0],
                        v = h[1],
                        m = R((0, k.useState)(0), 2),
                        y = m[0],
                        b = m[1],
                        g = R((0, k.useState)("USD"), 2),
                        E = g[0],
                        S = g[1],
                        C = t(n5);
                    return ((0, k.useEffect)(function() {
                        D(function() {
                            var e, t, r, a, i, s;
                            return L(this, function(u) {
                                switch (u.label) {
                                    case 0:
                                        o(!0), u.label = 1;
                                    case 1:
                                        return u.trys.push([1, 3, , 4]), [4, n1()];
                                    case 2:
                                        return t = (e = R.apply(void 0, [u.sent(), 5]))[0], r = e[1], a = e[2], i = e[3], s = e[4], l(t), f(r), v(a), b(i), S(s), [3, 4];
                                    case 3:
                                        return u.sent(), n.warning(ra), [3, 4];
                                    case 4:
                                        return o(!1), [2]
                                }
                            })
                        })()
                    }, [y]), r || u) ? (0, w.jsx)("div", {}) : (0, w.jsxs)("div", {
                        children: [(0, w.jsx)("h2", {
                            children: C
                        }), i ? (0, w.jsx)("span", {
                            className: "spinner spinner-default"
                        }) : (0, w.jsx)(s_, {
                            translate: t,
                            systemFeedbackService: n,
                            showConvertButton: d,
                            robuxAmount: p,
                            balance: y,
                            currencyCode: E,
                            setZeroBalance: function() {
                                b(0)
                            }
                        })]
                    })
                },
                uv = function(e) {
                    var t, n = e.translate,
                        r = e.systemFeedbackService,
                        a = R((0, k.useState)(null), 2),
                        i = a[0],
                        o = a[1],
                        s = R((0, k.useState)(!0), 2),
                        u = s[0],
                        l = s[1];
                    if ((0, k.useEffect)(function() {
                            D(function() {
                                return L(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return e.trys.push([0, 2, , 3]), [4, n3()];
                                        case 1:
                                            return o(e.sent()), [3, 3];
                                        case 2:
                                            return e.sent(), r.warning(n(ra)), [3, 3];
                                        case 3:
                                            return l(!1), [2]
                                    }
                                })
                            })()
                        }, []), u) return (0, w.jsx)("div", {
                        className: "section-content spending-setting-container",
                        children: (0, w.jsx)("span", {
                            className: "spinner spinner-default"
                        })
                    });
                    if (!(null == i ? void 0 : i.isSpendNotificationSettingEnabledForUser)) return null;
                    switch (i.spendNotificationSetting) {
                        case sM.AllNotifications:
                            t = n("Description.SpendNotifications.AllTransactions");
                            break;
                        case sM.Default:
                            t = n("Description.SpendNotifications.HighSpend");
                            break;
                        default:
                            t = void 0
                    }
                    return t ? (0, w.jsx)("div", {
                        className: "section-content spending-setting-container",
                        children: (0, w.jsx)(uu, {
                            title: n("Heading.SpendNotifications"),
                            description: t
                        })
                    }) : null
                },
                um = function() {
                    var e = R((0, k.useState)(!1), 2),
                        t = e[0],
                        n = e[1],
                        r = (0, k.useMemo)(function() {
                            return {
                                open: function() {
                                    n(!0)
                                },
                                close: function() {
                                    n(!1)
                                }
                            }
                        }, []);
                    return [function(e) {
                        var n = e.translate,
                            a = e.systemFeedbackService,
                            i = e.onUpdateSuccess,
                            o = e.address,
                            s = R((0, k.useState)(!1), 2),
                            u = s[0],
                            l = s[1],
                            c = R((0, k.useState)(!1), 2),
                            d = c[0],
                            f = c[1],
                            h = R((0, k.useState)(!1), 2),
                            p = h[0],
                            v = h[1],
                            m = R((0, k.useState)(), 2),
                            y = m[0],
                            b = m[1],
                            g = (0, k.useCallback)(function(e) {
                                switch (e.country) {
                                    case "US":
                                        e.city && e.state && e.postalCode && (e.country !== o.country || e.state !== o.state || e.city !== o.city || e.postalCode !== o.postalCode) && (f(!0), b(e));
                                        break;
                                    case "CA":
                                        e.city && e.state && (e.country !== o.country || e.state !== o.state || e.city !== o.city) && (f(!0), b(e))
                                }
                            }, [o.city, o.country, o.postalCode, o.state]),
                            E = (0, k.useCallback)(function() {
                                l(!0), v(!0)
                            }, []),
                            S = (0, k.useCallback)(function() {
                                y && (i(y), a.success(n("Description.SavedBillingAddress.UpdatedBillingAddressSuccess")), l(!1), r.close())
                            }, [i, a, n, y]);
                        return (0, w.jsxs)(I.Modal, {
                            show: t,
                            onHide: r.close,
                            size: "md",
                            id: "update-payment-method-modal",
                            children: [(0, w.jsx)(I.Modal.Header, {
                                title: n("Heading.SavedBillingAddress.UpdateBillingAddress"),
                                onClose: r.close
                            }), (0, w.jsx)(I.Modal.Body, {
                                children: (0, w.jsx)(so, {
                                    prefilledAddress: o,
                                    onUpdateAddress: g,
                                    processAddressSave: p,
                                    onUpdateSuccess: S,
                                    hideSaveSection: !0,
                                    triggeringContext: i_.ENUM_TRIGGERING_CONTEXT.WEB_PAYMENT_METHODS_SETTING
                                })
                            }), (0, w.jsx)("div", {
                                className: "footer-divider"
                            }), (0, w.jsx)(I.Modal.Footer, {
                                children: (0, w.jsxs)("div", {
                                    className: "modal-buttons",
                                    children: [(0, w.jsx)(I.Button, {
                                        variant: I.Button.variants.secondary,
                                        width: I.Button.widths.full,
                                        size: I.Button.sizes.large,
                                        className: "action-button",
                                        onClick: function() {
                                            r.close()
                                        },
                                        children: n(rt)
                                    }), (0, w.jsx)(I.Button, {
                                        width: I.Button.widths.full,
                                        size: I.Button.sizes.large,
                                        className: "action-button",
                                        isLoading: u,
                                        isDisabled: !d,
                                        onClick: E,
                                        children: n(rn)
                                    })]
                                })
                            })]
                        })
                    }, r]
                },
                uy = function(e) {
                    var t = e.systemFeedbackService,
                        n = e.translate,
                        r = R((0, k.useState)(), 2),
                        a = r[0],
                        i = r[1],
                        o = n("Heading.SavedGiftCardInformation"),
                        s = n("Heading.SavedBillingAddress.DeleteBillingAddress"),
                        u = n("Description.SavedBillingAddress.AreYouSureDeleteBillingAddress"),
                        l = R(ro(), 2),
                        c = l[0],
                        d = l[1],
                        f = R(um(), 2),
                        h = f[0],
                        p = f[1];
                    if ((0, k.useEffect)(function() {
                            D(function() {
                                var e, t, n;
                                return L(this, function(r) {
                                    switch (r.label) {
                                        case 0:
                                            return r.trys.push([0, 2, , 3]), [4, D(function() {
                                                var e, t;
                                                return L(this, function(n) {
                                                    return e = {
                                                        withCredentials: !0,
                                                        url: "".concat(x.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/user-settings-address")
                                                    }, t = {}, [2, t3.httpService.get(e, t)]
                                                })
                                            })()];
                                        case 1:
                                            return t = (e = r.sent().data.address).country, n = e.state, i({
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
                    var v = a.postalCode ? "".concat(a.city, ", ").concat(a.state, ", ").concat(a.postalCode, ", ").concat(a.country) : "".concat(a.city, ", ").concat(a.state, ", ").concat(a.country);
                    return (0, w.jsxs)("div", {
                        className: "saved-gift-card-information-container",
                        children: [(0, w.jsxs)("h5", {
                            children: [" ", o, " "]
                        }), (0, w.jsxs)("div", {
                            className: "billing-address-container",
                            children: [(0, w.jsx)(c, {
                                translate: n,
                                header: s,
                                cancelText: u,
                                onDelete: function() {
                                    return D(function() {
                                        return L(this, function(e) {
                                            switch (e.label) {
                                                case 0:
                                                    return e.trys.push([0, 2, , 3]), [4, D(function() {
                                                        var e, t;
                                                        return L(this, function(n) {
                                                            return e = {
                                                                withCredentials: !0,
                                                                url: "".concat(x.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/user-settings-address")
                                                            }, t = {}, [2, t3.httpService.patch(e, t)]
                                                        })
                                                    })()];
                                                case 1:
                                                    return e.sent(), t.success(n("Description.SavedBillingAddress.DeleteBillingAddressSuccess")), i(void 0), [3, 3];
                                                case 2:
                                                    return e.sent(), t.warning(n(ra)), [3, 3];
                                                case 3:
                                                    return [2]
                                            }
                                        })
                                    })()
                                }
                            }), (0, w.jsx)(h, {
                                translate: n,
                                systemFeedbackService: t,
                                onUpdateSuccess: function(e) {
                                    i(e)
                                },
                                address: a
                            }), (0, w.jsx)("p", {
                                className: "billing-address-label",
                                children: v
                            }), (0, w.jsx)("button", {
                                type: "button",
                                className: "btn-generic-edit-sm",
                                onClick: function() {
                                    p.open()
                                },
                                children: (0, w.jsx)("span", {
                                    className: "icon-edit"
                                })
                            }), (0, w.jsx)("button", {
                                type: "button",
                                className: "btn-generic-trash-bin-sm",
                                onClick: function() {
                                    d.open()
                                },
                                children: (0, w.jsx)("span", {
                                    className: "icon-trash-bin"
                                })
                            })]
                        })]
                    })
                },
                ub = function(e) {
                    var t = e.translate,
                        n = e.systemFeedbackService,
                        r = R((0, k.useState)(!0), 2),
                        a = r[0],
                        i = r[1],
                        o = R((0, k.useState)(!1), 2),
                        s = o[0],
                        u = o[1],
                        l = R((0, k.useState)(!1), 2),
                        c = l[0],
                        d = l[1],
                        f = R((0, k.useState)(!1), 2),
                        h = f[0],
                        p = f[1],
                        v = R((0, k.useState)(), 2),
                        m = v[0],
                        y = v[1],
                        b = R((0, k.useState)(), 2),
                        g = b[0],
                        E = b[1],
                        S = R((0, k.useState)(), 2),
                        C = S[0],
                        P = S[1],
                        _ = R((0, k.useState)(!1), 2),
                        T = _[0],
                        A = _[1],
                        U = function() {
                            return D(function() {
                                return L(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return e.trys.push([0, 2, , 3]), [4, D(function() {
                                                var e, t, n;
                                                return L(this, function(r) {
                                                    switch (r.label) {
                                                        case 0:
                                                            return e = {
                                                                withCredentials: !0,
                                                                url: "".concat(x.EnvironmentUrls.userSettingsApi, "/v1/user-settings/settings-and-options")
                                                            }, [4, t3.httpService.get(e)];
                                                        case 1:
                                                            return n = nK({}, (t = r.sent()).data), Object.entries(t.data).forEach(function(e) {
                                                                var t, r = R(e, 2),
                                                                    a = r[0],
                                                                    i = r[1];
                                                                ((null == i ? void 0 : i.options) === void 0 || (null == i || null == (t = i.options) ? void 0 : t.length) === 0) && delete n[a]
                                                            }), [2, n]
                                                    }
                                                })
                                            })()];
                                        case 1:
                                            return P(e.sent()), [3, 3];
                                        case 2:
                                            return e.sent(), n.warning(t(ra)), [3, 3];
                                        case 3:
                                            return [2]
                                    }
                                })
                            })()
                        };
                    (0, k.useEffect)(function() {
                        D(function() {
                            var e;
                            return L(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return r.trys.push([0, 2, , 3]), (0, V.fireEvent)(nv), [4, D(function() {
                                            var e;
                                            return L(this, function(t) {
                                                return e = {
                                                    withCredentials: !0,
                                                    url: "".concat(x.EnvironmentUrls.usersApi, "/v1/birthdate")
                                                }, [2, t3.httpService.get(e)]
                                            })
                                        })()];
                                    case 1:
                                        return e = r.sent(), (0, V.fireEvent)(nm),
                                            function(e, t) {
                                                G(2, arguments);
                                                var n = W(e),
                                                    r = W(t),
                                                    a = H(n, r),
                                                    i = Math.abs(function(e, t) {
                                                        G(2, arguments);
                                                        var n = W(e),
                                                            r = W(t);
                                                        return n.getFullYear() - r.getFullYear()
                                                    }(n, r));
                                                n.setFullYear(1584), r.setFullYear(1584);
                                                var o = H(n, r) === -a,
                                                    s = a * (i - Number(o));
                                                return 0 === s ? 0 : s
                                            }(new Date, new Date(e.data.birthYear, e.data.birthMonth - 1, e.data.birthDay)) >= 18 && i(!1), [3, 3];
                                    case 2:
                                        return r.sent(), (0, V.fireEvent)(ny), n.warning(t(ra)), [3, 3];
                                    case 3:
                                        return [2]
                                }
                            })
                        })(), D(function() {
                            var e;
                            return L(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return r.trys.push([0, 2, , 3]), [4, D(function() {
                                            var e;
                                            return L(this, function(t) {
                                                return e = {
                                                    withCredentials: !0,
                                                    url: "".concat(x.EnvironmentUrls.apiGatewayUrl, "/payments-gateway/v1/stripe/enabled-for-user")
                                                }, [2, t3.httpService.get(e)]
                                            })
                                        })()];
                                    case 1:
                                        return d((e = r.sent()).data.isPaymentProviderEnabledForUser), p(e.data.isUserVpcApproved), [3, 3];
                                    case 2:
                                        return r.sent(), n.warning(t(ra)), [3, 3];
                                    case 3:
                                        return [2]
                                }
                            })
                        })(), D(function() {
                            var e;
                            return L(this, function(r) {
                                switch (r.label) {
                                    case 0:
                                        return r.trys.push([0, 3, , 4]), [4, D(function() {
                                            return L(this, function(e) {
                                                return [2, x.Guac.callBehaviour("account-settings-ui")]
                                            })
                                        })()];
                                    case 1:
                                        return y(r.sent()), [4, D(function() {
                                            var e;
                                            return L(this, function(t) {
                                                switch (t.label) {
                                                    case 0:
                                                        return e = {
                                                            withCredentials: !0,
                                                            url: "".concat(x.EnvironmentUrls.userSettingsApi, "/v1/user-settings/metadata")
                                                        }, [4, t3.httpService.get(e)];
                                                    case 1:
                                                        return [2, t.sent().data]
                                                }
                                            })
                                        })()];
                                    case 2:
                                        return (e = r.sent()) && E(e), [3, 4];
                                    case 3:
                                        return r.sent(), n.warning(t(ra)), [3, 4];
                                    case 4:
                                        return [2]
                                }
                            })
                        })(), U(), D(function() {
                            var e, t;
                            return L(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        return n.trys.push([0, 2, , 3]), [4, D(function() {
                                            var e;
                                            return L(this, function(t) {
                                                switch (t.label) {
                                                    case 0:
                                                        return e = {
                                                            withCredentials: !0,
                                                            url: "".concat(x.EnvironmentUrls.apiGatewayUrl, "/parental-controls-api/v1/parental-controls/get-linked-parents")
                                                        }, [4, t3.httpService.get(e)];
                                                    case 1:
                                                        return [2, t.sent().data]
                                                }
                                            })
                                        })()];
                                    case 1:
                                        return u(null != (e = null == (t = n.sent().parents) ? void 0 : t.some(function(e) {
                                            return !0 === e.isRemoteParent
                                        })) && e), [3, 3];
                                    case 2:
                                        return n.sent(), u(!1), [3, 3];
                                    case 3:
                                        return [2]
                                }
                            })
                        })(), D(function() {
                            var e;
                            return L(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        return e = {
                                            withCredentials: !0,
                                            url: "".concat(x.EnvironmentUrls.apiGatewayUrl, "/v1/subscriptions/metadata")
                                        }, [4, t3.httpService.get(e)];
                                    case 1:
                                        return [2, t.sent().data.isPaymentMethodChangesEnabled]
                                }
                            })
                        })().then(function(e) {
                            A(e)
                        }).catch(function() {
                            A(!1)
                        })
                    }, []);
                    var N = (0, k.useRef)(!0);
                    (0, k.useEffect)(function() {
                        N.current && C && m && (N.current = !1, (null == m ? void 0 : m.renamePaymentsToSpendingTab) && s7(C.enablePurchases ? sH : sV))
                    }, [m, C]);
                    var O = null;
                    switch (null == m ? void 0 : m.spendingNotificationDescription) {
                        case n2.GlobalTeen:
                            O = (0, w.jsx)("div", {
                                className: "text-description text-new-line",
                                dangerouslySetInnerHTML: {
                                    __html: t("Description.SpendingPaymentMethods", {
                                        linkStart: '<a href="https://help.roblox.com/hc/categories/200213820" class="text-link" target="_blank">',
                                        linkEnd: "</a>"
                                    })
                                }
                            });
                            break;
                        case n2.U13:
                            O = (0, w.jsx)("div", {
                                className: "text-description text-new-line",
                                children: t("Description.ChildSide.SpendingRestrictions")
                            });
                        case n2.O18:
                    }
                    return (0, w.jsxs)("div", {
                        className: "setting-container",
                        children: [(0, w.jsx)("h2", {
                            children: (null == m ? void 0 : m.renamePaymentsToSpendingTab) ? t("Heading.Tab.Spending") : t(n5)
                        }), O, (null == C ? void 0 : C.enablePurchases) !== void 0 && (0, w.jsx)(uh, {
                            enablePurchaseSettings: C.enablePurchases,
                            refetchEnablePurchaseSettings: U,
                            translate: t,
                            systemFeedbackService: n
                        }), (null == g ? void 0 : g.displaySpendLimitSettings) && (0, w.jsx)(uc, {
                            enablePurchaseSettings: null == C ? void 0 : C.enablePurchases,
                            translate: t,
                            systemFeedbackService: n
                        }), a && s && (0, w.jsx)(uv, {
                            translate: t,
                            systemFeedbackService: n
                        }), a && !T ? (0, w.jsx)(up, {
                            translate: t,
                            systemFeedbackService: n
                        }) : (0, w.jsx)(sR, {
                            translate: t,
                            systemFeedbackService: n,
                            hideAddCardButton: a || !c,
                            shouldDisplaySavedPaymentMethods: c && h,
                            hideSavedPaymentMethodsIfNoSavedCards: a
                        }), (0, w.jsx)(uy, {
                            systemFeedbackService: n,
                            translate: t
                        }), !T && (0, w.jsx)(sI, {
                            translate: t,
                            systemFeedbackService: n
                        })]
                    })
                },
                ug = (0, M.withTranslations)(function(e) {
                    var t = e.translate,
                        n = R((0, I.createSystemFeedback)(), 2),
                        r = n[0],
                        a = n[1];
                    return (0, w.jsxs)(O().Fragment, {
                        children: [(0, w.jsx)(ub, {
                            translate: t,
                            systemFeedbackService: a
                        }), (0, w.jsx)(r, {})]
                    })
                }, {
                    common: ["CommonUI.Features", "CommonUI.Controls", "Purchasing.RedeemGameCard", "Feature.Payment"],
                    feature: "Feature.AccountSettings"
                });
            Object.assign(P(), {
                PaymentSetting: {
                    renderComponent: function(e) {
                        var t = document.getElementById(e);
                        return null !== t && ((0, _.renderWithErrorBoundary)((0, w.jsx)(ug, {}), t), !0)
                    }
                }
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected(document.currentScript && document.currentScript.getAttribute("data-bundlename") || "PaymentMethodsSetting");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/paymentMethodsSetting-1052115ce3a22b47.js.map
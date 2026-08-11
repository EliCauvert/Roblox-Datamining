! function() {
    "use strict";
    var r = {
            n: function(e) {
                var t = e && e.__esModule ? function() {
                    return e.default
                } : function() {
                    return e
                };
                return r.d(t, {
                    a: t
                }), t
            },
            d: function(e, t) {
                for (var n in t) r.o(t, n) && !r.o(e, n) && Object.defineProperty(e, n, {
                    enumerable: !0,
                    get: t[n]
                })
            },
            o: function(e, t) {
                return Object.prototype.hasOwnProperty.call(e, t)
            }
        },
        y = React,
        g = r.n(y),
        t = ReactDOM,
        a = CoreUtilities,
        n = "roblox-credit-container",
        e = PropTypes,
        o = r.n(e),
        i = ReactUtilities,
        h = ReactStyleGuide,
        c = HeaderScripts,
        x = window.EventTracker ? EventTracker : {
            fireEvent: console.log,
            start: console.log,
            endSuccess: console.log,
            endCancel: console.log,
            endFailure: console.log
        },
        u = Roblox.EnvironmentUrls.apiGatewayUrl,
        w = "ProcessPaymentRequestFailedStatusCode",
        R = "ProcessPaymentNotSuccessful",
        E = "ProcessPaymentNotSuccessful",
        C = "ProcessPaymentUnexpectedException",
        S = "GetConversionMetadataFailed";

    function s(e, t, n, r, a, o, i) {
        try {
            var c = e[o](i),
                u = c.value
        } catch (e) {
            return void n(e)
        }
        c.done ? t(u) : Promise.resolve(u).then(r, a)
    }

    function l(c) {
        return function() {
            var e = this,
                i = arguments;
            return new Promise(function(t, n) {
                var r = c.apply(e, i);

                function a(e) {
                    s(r, t, n, a, o, "next", e)
                }

                function o(e) {
                    s(r, t, n, a, o, "throw", e)
                }
                a(void 0)
            })
        }
    }
    var P = function() {
            var e = l(regeneratorRuntime.mark(function e() {
                var t;
                return regeneratorRuntime.wrap(function(e) {
                    for (;;) switch (e.prev = e.next) {
                        case 0:
                            return t = {
                                withCredentials: !0,
                                url: "".concat(u, "/credit-balance/v1/get-conversion-metadata")
                            }, e.abrupt("return", a.httpService.get(t));
                        case 2:
                        case "end":
                            return e.stop()
                    }
                }, e)
            }));
            return function() {
                return e.apply(this, arguments)
            }
        }(),
        A = function() {
            var e = l(regeneratorRuntime.mark(function e() {
                var t, n;
                return regeneratorRuntime.wrap(function(e) {
                    for (;;) switch (e.prev = e.next) {
                        case 0:
                            return t = {
                                paymentProviderType: "Credit"
                            }, n = {
                                withCredentials: !0,
                                url: "".concat(u, "/payments-gateway/v1/process-payment")
                            }, e.abrupt("return", a.httpService.post(n, t));
                        case 3:
                        case "end":
                            return e.stop()
                    }
                }, e)
            }));
            return function() {
                return e.apply(this, arguments)
            }
        }();

    function d(e, t, n, r, a, o, i) {
        try {
            var c = e[o](i),
                u = c.value
        } catch (e) {
            return void n(e)
        }
        c.done ? t(u) : Promise.resolve(u).then(r, a)
    }

    function T(c) {
        return function() {
            var e = this,
                i = arguments;
            return new Promise(function(t, n) {
                var r = c.apply(e, i);

                function a(e) {
                    d(r, t, n, a, o, "next", e)
                }

                function o(e) {
                    d(r, t, n, a, o, "throw", e)
                }
                a(void 0)
            })
        }
    }

    function M(e, t) {
        return function(e) {
            if (Array.isArray(e)) return e
        }(e) || function(e, t) {
            if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
            var n = [],
                r = !0,
                a = !1,
                o = void 0;
            try {
                for (var i, c = e[Symbol.iterator](); !(r = (i = c.next()).done) && (n.push(i.value), !t || n.length !== t); r = !0);
            } catch (e) {
                a = !0, o = e
            } finally {
                try {
                    r || null == c.return || c.return()
                } finally {
                    if (a) throw o
                }
            }
            return n
        }(e, t) || function(e, t) {
            if (!e) return;
            if ("string" == typeof e) return f(e, t);
            var n = Object.prototype.toString.call(e).slice(8, -1);
            "Object" === n && e.constructor && (n = e.constructor.name);
            if ("Map" === n || "Set" === n) return Array.from(e);
            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return f(e, t)
        }(e, t) || function() {
            throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }

    function f(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
        return r
    }
    var k = (p = M((0, h.createModal)(), 2))[0],
        B = p[1],
        D = (m = M((0, h.createSystemFeedback)(), 2))[0],
        I = m[1],
        e = (v = c.deviceMeta.getDeviceMeta()).deviceType,
        p = v.isWin32App,
        m = v.isUWPApp,
        v = v.isInApp,
        U = e === c.deviceMeta.DeviceTypes.computer || p || m || !v;

    function b(e) {
        function t() {
            window.dispatchEvent(new CustomEvent("price-tag:render", {
                detail: {
                    targetSelector: ".fiat-credit-balance-in-setting"
                }
            }))
        }

        function n() {
            B.open().then(function() {
                p(!0), b()
            })
        }
        var a = e.translate,
            r = M((0, y.useState)(null), 2),
            o = r[0],
            i = r[1],
            e = M((0, y.useState)("USD"), 2),
            r = e[0],
            c = e[1],
            e = M((0, y.useState)(null), 2),
            u = e[0],
            s = e[1],
            e = M((0, y.useState)(null), 2),
            l = e[0],
            d = e[1],
            e = M((0, y.useState)(!1), 2),
            f = e[0],
            p = e[1],
            e = g().createElement("div", {
                dangerouslySetInnerHTML: {
                    __html: a("Description.ConfirmRobloxCreditToRobuxRedemption", {
                        balance: "<span class='fiat-credit-balance-in-setting ml-1' data-amount=".concat(o, " data-currency-code=").concat(r, "></span>"),
                        iconRobux: '<span class="icon-robux-16x16"></span>',
                        robuxAmount: u
                    })
                },
                ref: t
            }),
            m = function() {
                var e = T(regeneratorRuntime.mark(function e() {
                    var t, n;
                    return regeneratorRuntime.wrap(function(e) {
                        for (;;) switch (e.prev = e.next) {
                            case 0:
                                return e.next = 2, P();
                            case 2:
                                if (200 !== (t = e.sent).status) return (0, x.fireEvent)(S), (0, x.fireEvent)("".concat(S).concat(t.status)), e.abrupt("return");
                                e.next = 7;
                                break;
                            case 7:
                                n = t.data, s(n.robuxConversionAmount), c(n.currencyCode), i(n.creditBalance), 0 === n.robuxConversionAmount ? d(!1) : d(!0);
                            case 12:
                            case "end":
                                return e.stop()
                        }
                    }, e)
                }));
                return function() {
                    return e.apply(this, arguments)
                }
            }(),
            v = function() {
                var e = T(regeneratorRuntime.mark(function e() {
                    var t, n, r;
                    return regeneratorRuntime.wrap(function(e) {
                        for (;;) switch (e.prev = e.next) {
                            case 0:
                                return e.next = 2, A();
                            case 2:
                                if (200 !== (n = e.sent).status) return (0, x.fireEvent)(w), (0, x.fireEvent)("".concat(w).concat(n.status)), I.warning(a("Message.FailedDebitRobloxCredit")), e.abrupt("return");
                                e.next = 8;
                                break;
                            case 8:
                                (r = n.data).isSuccess && null !== (t = r.providerPayload) && void 0 !== t && t.IsSuccessful ? (I.success(a("Message.RobloxCreditToRobuxRedemptionConfirmation", {
                                    robuxAmount: u
                                })), m()) : (I.warning(a("Message.FailedDebitRobloxCredit")), p(!1), (0, x.fireEvent)(R)), (0, x.fireEvent)(E + r.providerPayload.ResponseMessage);
                            case 11:
                            case "end":
                                return e.stop()
                        }
                    }, e)
                }));
                return function() {
                    return e.apply(this, arguments)
                }
            }(),
            b = function() {
                var e = T(regeneratorRuntime.mark(function e() {
                    return regeneratorRuntime.wrap(function(e) {
                        for (;;) switch (e.prev = e.next) {
                            case 0:
                                return e.prev = 0, e.next = 3, v();
                            case 3:
                                e.next = 9;
                                break;
                            case 5:
                                e.prev = 5, e.t0 = e.catch(0), I.warning(a("Message.FailedDebitRobloxCredit")), (0, x.fireEvent)(C);
                            case 9:
                            case "end":
                                return e.stop()
                        }
                    }, e, null, [
                        [0, 5]
                    ])
                }));
                return function() {
                    return e.apply(this, arguments)
                }
            }();
        (0, y.useEffect)(function() {
            t()
        }, [o, r]), (0, y.useEffect)(function() {
            m()
        }, []);
        return o ? g().createElement("div", null, g().createElement("span", {
            className: "text-label account-settings-label"
        }, a("Heading.RobloxCredit")), g().createElement("p", null, a("Label.LocalizedCurrentBalance") || "Current Balance:", g().createElement("span", {
            className: "fiat-credit-balance-in-setting ml-1",
            "data-amount": o,
            "data-currency-code": r
        })), U && l ? g().createElement(h.Button, {
            id: "redeem-robux-button",
            className: "redeem-robux-button",
            variant: h.Button.variants.secondary,
            size: h.Button.sizes.medium,
            width: h.Button.widths.min,
            isDisabled: f,
            onClick: n
        }, a("Action.ConvertToRobux")) : null, g().createElement(k, {
            title: a("Heading.GetRobux"),
            body: e,
            actionButtonText: a("Action.Redeem"),
            neutralButtonText: a("Action.Cancel"),
            actionButtonShow: !0
        }), g().createElement(D, null)) : null
    }
    b.propTypes = {
        translate: o().func.isRequired
    };
    var F = b;

    function O(e) {
        e = e.translate;
        return g().createElement(F, {
            translate: e
        })
    }
    O.propTypes = {
        translate: o().func.isRequired
    };
    var j = (0, i.withTranslations)(O, {
        common: ["CommonUI.Controls"],
        feature: "Feature.RobloxCredit"
    });
    (0, a.ready)(function() {
        var e = document.getElementById(n);
        e && (0, t.render)(g().createElement(j, null), e), window.addEventListener("hashchange", function() {
            var e;
            "#!/billing" !== window.location.hash || (e = document.getElementById(n)) && (0, t.render)(g().createElement(j, null), e)
        })
    })
}();
//# sourceMappingURL=https://js.rbxcdn.com/70869b8f99daf2017bc36bd9fc4e9224-robloxCredit.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("RobloxCredit");
! function() {
    "use strict";
    var e = {
            n: function(t) {
                var n = t && t.__esModule ? function() {
                    return t.default
                } : function() {
                    return t
                };
                return e.d(n, {
                    a: n
                }), n
            },
            d: function(t, n) {
                for (var r in n) e.o(n, r) && !e.o(t, r) && Object.defineProperty(t, r, {
                    enumerable: !0,
                    get: n[r]
                })
            },
            o: function(e, t) {
                return Object.prototype.hasOwnProperty.call(e, t)
            }
        },
        t = CoreUtilities,
        n = React,
        r = e.n(n),
        a = ReactDOM,
        i = Roblox,
        o = e.n(i),
        c = PropTypes,
        l = e.n(c),
        s = ReactUtilities,
        u = CoreRobloxUtilities,
        d = ReactStyleGuide,
        v = i.EnvironmentUrls.apiGatewayUrl,
        m = ["alt_title", "alt_instruction", "alt_device_specific_instruction"],
        f = function() {
            var e = {
                retryable: !0,
                withCredentials: !0,
                url: "".concat(v, "/auth-token-service/v1/login/create")
            };
            return t.httpService.post(e).then((function(e) {
                return e
            })).catch((function(e) {
                return console.debug(e)
            }))
        },
        p = function(e) {
            var n = {
                retryable: !0,
                url: "".concat(v, "/auth-token-service/v1/login/status")
            };
            return t.httpService.post(n, e).then((function(e) {
                return e
            })).catch((function(e) {
                return console.debug(e)
            }))
        },
        h = function(e) {
            var n = {
                retryable: !0,
                url: "".concat(v, "/auth-token-service/v1/login/cancel")
            };
            return t.httpService.post(n, e).then((function(e) {
                return e
            })).catch((function(e) {
                return console.debug(e)
            }))
        },
        y = function() {
            var e = {
                    retryable: !0,
                    withCredentials: !0,
                    url: "".concat(v, "/product-experimentation-platform/v1/projects/1/layers/Website.Login.CrossDeviceLogin.DisplayCode/values")
                },
                n = {
                    parameters: m.join(",")
                };
            return t.httpService.get(e, n).then((function(e) {
                return null != e && e.data ? e.data : Promise.reject()
            }))
        },
        g = function() {
            return t.httpService.get({
                retryable: !0,
                withCredentials: !0,
                url: "".concat(v, "/auth-token-service/v1/login/metadata")
            })
        };

    function b(e) {
        var t, n = e.code,
            a = e.qrUrl,
            i = e.translate,
            o = e.altTitle,
            c = e.altInstruction,
            l = e.altDeviceSpecificInstruction,
            s = c || i("Label.LoginInstructionsV2");
        t = l ? r().createElement("div", {
            className: "cross-device-login-device-specific-instruction-text font-caption-header",
            dangerouslySetInnerHTML: {
                __html: "".concat(s, "<br>").concat(l)
            }
        }) : r().createElement("div", {
            className: "cross-device-login-instruction-text font-caption-header",
            dangerouslySetInnerHTML: {
                __html: "".concat(s, "<br>").concat(i("Label.LoginLocationV2"))
            }
        });
        return a ? r().createElement("div", null, r().createElement("div", null, r().createElement("b", null, i("Label.QrHeader"))), r().createElement("img", {
            src: a,
            alt: "",
            className: "cross-device-login-display-qr-code-image"
        }), r().createElement("div", {
            className: "cross-device-login-instruction-text font-caption-header"
        }, i("Label.QrInstructions"), r().createElement("br", null), r().createElement("a", {
            href: "https://en.help.roblox.com/hc/en-us/articles/360056582012",
            target: "_blank",
            rel: "noreferrer",
            className: "text-link cross-device-login-instruction-text"
        }, r().createElement("u", null, i("Label.QrTroubleshooting")))), r().createElement("div", {
            className: "cross-device-login-qr-header-text"
        }, r().createElement("b", null, i("Label.CodeHeader"))), r().createElement("div", {
            className: "font-title"
        }, n), r().createElement("div", {
            className: "cross-device-login-instruction-text font-caption-header"
        }, t)) : r().createElement("div", null, r().createElement("div", {
            className: "cross-device-login-display-code-modal-image"
        }), r().createElement("div", {
            className: "font-title"
        }, n), r().createElement("div", {
            className: "cross-device-login-device-prompt-text font-header-2"
        }, o || i("Label.DevicePrompt")), r().createElement("div", {
            className: "cross-device-login-instruction-text font-caption-header"
        }, t))
    }
    b.defaultProps = {
        altTitle: "",
        altInstruction: "",
        altDeviceSpecificInstruction: ""
    }, b.propTypes = {
        translate: l().func.isRequired,
        code: l().string.isRequired,
        qrUrl: l().string.isRequired,
        altTitle: l().string,
        altInstruction: l().string,
        altDeviceSpecificInstruction: l().string
    };
    var E = b;

    function w(e) {
        var t = e.accountName,
            n = e.accountPictureUrl,
            a = e.translate;
        return r().createElement("div", null, r().createElement("div", null, n ? r().createElement("img", {
            className: "cross-device-login-avatar-thumbnail",
            src: n,
            alt: "ph-avatar-headshot"
        }) : r().createElement("div", {
            className: "cross-device-login-display-code-modal-image cross-device-login-ph-avatar-image"
        }), r().createElement("div", {
            className: "cross-device-login-device-prompt-text font-header-2"
        }, a("Label.ConfirmOnDevice")), r().createElement("div", {
            className: "cross-device-login-instruction-text font-caption-header"
        }, a("Label.WebLogginInAs"), " ", r().createElement("span", null, " ", t, " "))))
    }
    w.propTypes = {
        translate: l().func.isRequired,
        accountName: l().func.isRequired,
        accountPictureUrl: l().func.isRequired
    };
    var S = w;

    function x(e, t, n, r, a, i, o) {
        try {
            var c = e[i](o),
                l = c.value
        } catch (e) {
            return void n(e)
        }
        c.done ? t(l) : Promise.resolve(l).then(r, a)
    }

    function C(e, t) {
        return function(e) {
            if (Array.isArray(e)) return e
        }(e) || function(e, t) {
            if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
            var n = [],
                r = !0,
                a = !1,
                i = void 0;
            try {
                for (var o, c = e[Symbol.iterator](); !(r = (o = c.next()).done) && (n.push(o.value), !t || n.length !== t); r = !0);
            } catch (e) {
                a = !0, i = e
            } finally {
                try {
                    r || null == c.return || c.return()
                } finally {
                    if (a) throw i
                }
            }
            return n
        }(e, t) || function(e, t) {
            if (!e) return;
            if ("string" == typeof e) return L(e, t);
            var n = Object.prototype.toString.call(e).slice(8, -1);
            "Object" === n && e.constructor && (n = e.constructor.name);
            if ("Map" === n || "Set" === n) return Array.from(e);
            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return L(e, t)
        }(e, t) || function() {
            throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }

    function L(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
        return r
    }

    function N(e) {
        var t = e.show,
            a = e.onHide,
            i = e.code,
            o = e.qrUrl,
            c = e.accountName,
            l = e.accountPictureUrl,
            s = e.translate,
            u = C((0, n.useState)(""), 2),
            v = u[0],
            m = u[1],
            f = C((0, n.useState)(""), 2),
            p = f[0],
            h = f[1],
            b = C((0, n.useState)(""), 2),
            w = b[0],
            L = b[1];

        function N() {
            var e;
            return e = regeneratorRuntime.mark((function e() {
                var t, n, r;
                return regeneratorRuntime.wrap((function(e) {
                    for (;;) switch (e.prev = e.next) {
                        case 0:
                            return e.next = 2, g();
                        case 2:
                            if (null == (n = e.sent) || null === (t = n.data) || void 0 === t || !t.ShouldEnableCrossDeviceLoginInitiatorExperiments || !/^en\b/.test(navigator.language)) {
                                e.next = 10;
                                break
                            }
                            return e.next = 6, y();
                        case 6:
                            r = e.sent, m(null == r ? void 0 : r.alt_title), h(null == r ? void 0 : r.alt_instruction), L(null == r ? void 0 : r.alt_device_specific_instruction);
                        case 10:
                        case "end":
                            return e.stop()
                    }
                }), e)
            })), N = function() {
                var t = this,
                    n = arguments;
                return new Promise((function(r, a) {
                    var i = e.apply(t, n);

                    function o(e) {
                        x(i, r, a, o, c, "next", e)
                    }

                    function c(e) {
                        x(i, r, a, o, c, "throw", e)
                    }
                    o(void 0)
                }))
            }, N.apply(this, arguments)
        }
        return (0, n.useEffect)((function() {
            return function() {
                return N.apply(this, arguments)
            }()
        }), []), r().createElement(d.Modal, {
            show: t,
            onHide: a,
            className: "cross-device-login-display-code-modal",
            size: "lg",
            "aria-labelledby": "contained-modal-title-vcenter",
            scrollable: "true",
            centered: "true"
        }, r().createElement(d.Modal.Header, {
            useBaseBootstrapComponent: !0
        }, r().createElement("div", {
            className: "cross-device-login-display-code-modal-title-container"
        }, r().createElement("button", {
            type: "button",
            className: "cross-device-login-display-code-modal-title-button",
            onClick: a
        }, r().createElement("span", {
            className: "close icon-close"
        })), r().createElement(d.Modal.Title, {
            id: "contained-modal-title-vcenter"
        }, s("Heading.LoginCode")))), r().createElement(d.Modal.Body, null, c ? r().createElement(S, {
            accountName: c,
            accountPictureUrl: l,
            translate: s
        }) : r().createElement(E, {
            code: i,
            qrUrl: o,
            translate: s,
            altTitle: v,
            altInstruction: p,
            altDeviceSpecificInstruction: w
        })))
    }
    N.propTypes = {
        translate: l().func.isRequired,
        onHide: l().func.isRequired,
        show: l().bool.isRequired,
        code: l().string.isRequired,
        qrUrl: l().string.isRequired,
        accountName: l().string.isRequired,
        accountPictureUrl: l().string.isRequired
    };
    var P = N,
        R = u.eventStreamService.eventTypes,
        q = {
            showModal: {
                name: "showModal",
                type: R.pageLoad,
                context: "crossDeviceKey"
            },
            showProfile: {
                name: "showProfile",
                type: R.pageLoad,
                context: "confirmPrompt"
            }
        };

    function I(e, t, n, r, a, i, o) {
        try {
            var c = e[i](o),
                l = c.value
        } catch (e) {
            return void n(e)
        }
        c.done ? t(l) : Promise.resolve(l).then(r, a)
    }

    function U(e) {
        return function() {
            var t = this,
                n = arguments;
            return new Promise((function(r, a) {
                var i = e.apply(t, n);

                function o(e) {
                    I(i, r, a, o, c, "next", e)
                }

                function c(e) {
                    I(i, r, a, o, c, "throw", e)
                }
                o(void 0)
            }))
        }
    }

    function D(e, t) {
        return function(e) {
            if (Array.isArray(e)) return e
        }(e) || function(e, t) {
            if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
            var n = [],
                r = !0,
                a = !1,
                i = void 0;
            try {
                for (var o, c = e[Symbol.iterator](); !(r = (o = c.next()).done) && (n.push(o.value), !t || n.length !== t); r = !0);
            } catch (e) {
                a = !0, i = e
            } finally {
                try {
                    r || null == c.return || c.return()
                } finally {
                    if (a) throw i
                }
            }
            return n
        }(e, t) || function(e, t) {
            if (!e) return;
            if ("string" == typeof e) return T(e, t);
            var n = Object.prototype.toString.call(e).slice(8, -1);
            "Object" === n && e.constructor && (n = e.constructor.name);
            if ("Map" === n || "Set" === n) return Array.from(e);
            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return T(e, t)
        }(e, t) || function() {
            throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }

    function T(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
        return r
    }
    var M = i.EnvironmentUrls.apiGatewayUrl;

    function k(e) {
        var t = e.translate,
            a = D((0, n.useState)(!1), 2),
            i = a[0],
            o = a[1],
            c = D((0, n.useState)(""), 2),
            l = c[0],
            s = c[1],
            d = D((0, n.useState)(""), 2),
            v = d[0],
            m = d[1],
            y = D((0, n.useState)(""), 2),
            g = y[0],
            b = y[1],
            E = D((0, n.useState)(""), 2),
            w = E[0],
            S = E[1],
            x = D((0, n.useState)(""), 2),
            C = x[0],
            L = x[1],
            N = function(e) {
                e && m("".concat(M, "/auth-token-service").concat(e))
            };
        window.addEventListener("OpenCrossDeviceLoginDisplayCodeModal", (function(e) {
            s(e.detail.code), b(e.detail.privateKey), N(e.detail.imagePath), u.eventStreamService.sendEventWithTarget(q.showModal.type, q.showModal.context, {}), o(!0)
        }), !1);
        var R = function(e) {
                return s(""), m(""), b(""), S(""), L(""), o(!1), e ? h({
                    code: e
                }) : null
            },
            I = function(e) {
                s(e.code), b(e.privateKey), N(e.imagePath), S(""), L("")
            };
        return (0, n.useEffect)((function() {
            var e = null;
            return l && g && (e = setInterval(U(regeneratorRuntime.mark((function t() {
                    var n, r, a, i, o, c, s, d;
                    return regeneratorRuntime.wrap((function(t) {
                        for (;;) switch (t.prev = t.next) {
                            case 0:
                                return n = {
                                    code: l,
                                    privateKey: g
                                }, t.prev = 1, t.next = 4, p(n);
                            case 4:
                                if (r = t.sent, "Cancelled" !== (null == (a = r.data) ? void 0 : a.status)) {
                                    t.next = 12;
                                    break
                                }
                                return t.next = 9, f();
                            case 9:
                                i = t.sent, o = i.data, I(o);
                            case 12:
                                if ("UserLinked" === (null == a ? void 0 : a.status) && ("" === w && u.eventStreamService.sendEventWithTarget(q.showProfile.type, q.showProfile.context, {}), S(a.accountName || "unknown"), L(a.accountPictureUrl)), "Validated" !== (null == a ? void 0 : a.status)) {
                                    t.next = 19;
                                    break
                                }
                                return c = new CustomEvent("OnCrossDeviceCodeValidated", {
                                    detail: {
                                        ctype: "AuthToken",
                                        code: l,
                                        privateKey: g
                                    }
                                }), window.dispatchEvent(c), R(), t.abrupt("return", clearInterval(e));
                            case 19:
                                t.next = 28;
                                break;
                            case 21:
                                return t.prev = 21, t.t0 = t.catch(1), t.next = 25, f();
                            case 25:
                                s = t.sent, d = s.data, I(d);
                            case 28:
                                return t.abrupt("return", !1);
                            case 29:
                            case "end":
                                return t.stop()
                        }
                    }), t, null, [
                        [1, 21]
                    ])
                }))), 5e3)),
                function() {
                    return clearInterval(e)
                }
        }), [w, l, g]), r().createElement(P, {
            show: i,
            code: l,
            qrUrl: v,
            accountName: w,
            accountPictureUrl: C,
            onHide: function() {
                return R(l)
            },
            translate: t
        })
    }
    k.propTypes = {
        translate: l().func.isRequired
    };
    var _ = k;

    function A(e) {
        var t = e.translate;
        return r().createElement(_, {
            translate: t
        })
    }
    A.propTypes = {
        translate: l().func.isRequired
    };
    var O = (0, s.withTranslations)(A, {
        common: [],
        feature: "Authentication.CrossDevice"
    });

    function j() {
        var e = document.getElementById("crossDeviceLoginDisplayCodeModal-container");
        e ? (0, a.render)(r().createElement(O, null), e) : window.requestAnimationFrame(j)
    }
    o().CrossDeviceLoginDisplayCodeService = {
        openModal: function() {
            f().then((function(e) {
                var t = e.data;
                if ("Created" === (null == t ? void 0 : t.status)) {
                    var n = new CustomEvent("OpenCrossDeviceLoginDisplayCodeModal", {
                        detail: {
                            code: t.code,
                            privateKey: t.privateKey,
                            imagePath: t.imagePath
                        }
                    });
                    window.dispatchEvent(n)
                }
            }))
        }
    }, (0, t.ready)((function() {
        j()
    }))
}();
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/fc30f20ddcdc903d5cde4f394e57a93c-crossDeviceLoginDisplayCodeModal.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("CrossDeviceLoginDisplayCode");
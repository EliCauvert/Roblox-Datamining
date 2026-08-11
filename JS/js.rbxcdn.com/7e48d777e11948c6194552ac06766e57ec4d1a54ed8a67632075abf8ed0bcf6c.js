! function() {
    "use strict";
    var n = {
            n: function(e) {
                var r = e && e.__esModule ? function() {
                    return e.default
                } : function() {
                    return e
                };
                return n.d(r, {
                    a: r
                }), r
            },
            d: function(e, r) {
                for (var t in r) n.o(r, t) && !n.o(e, t) && Object.defineProperty(e, t, {
                    enumerable: !0,
                    get: r[t]
                })
            },
            o: function(e, r) {
                return Object.prototype.hasOwnProperty.call(e, r)
            }
        },
        a = CoreUtilities,
        b = React,
        v = n.n(b),
        e = ReactDOM,
        P = Roblox,
        r = n.n(P),
        t = PropTypes,
        o = n.n(t),
        s = ReactUtilities,
        i = "facebookSunsetModal-container",
        c = {
            PasswordBadLength: "Response.PasswordBadLength",
            PasswordComplexity: "Response.PasswordComplexity",
            PasswordContainsUsernameError: "Response.PasswordContainsUsernameError"
        },
        l = ["roblox123", "password", "password1", "password12", "password123", "trustno1", "iloveyou", "princess", "abcd1234", "qwertyui", "qwerty", "football", "baseball", "michael", "jennifer", "michelle", "babygirl", "superman", "12345678", "123456789", "1234567890", "123123123", "69696969", "11111111", "22222222", "33333333", "44444444", "55555555", "66666666", "77777777", "88888888", "99999999", "00000000"];

    function E(e, r) {
        return (t = e).length < 8 || 200 < t.length ? c.PasswordBadLength : e === r ? c.PasswordContainsUsernameError : function(e) {
            for (var r = e.toLowerCase(), t = 0; t < l.length; t++)
                if (r === l[t]) return 1;
            return !!/^[\s]*$/.test(r)
        }(e) ? c.PasswordComplexity : "";
        var t
    }
    var p = ReactStyleGuide;

    function u(e) {
        var r = e.passwordError,
            e = e.translate;
        return v().createElement("p", {
            className: "text-error modal-error-message password-error"
        }, e(r))
    }
    u.propTypes = {
        translate: o().func.isRequired,
        passwordError: o().string.isRequired
    };
    var d = (0, s.withTranslations)(u, {
        common: ["CommonUI.Messages"],
        feature: "Authentication.SignUp"
    });

    function m(e) {
        var r = e.translate,
            t = e.onHide,
            n = e.passwordInputValue,
            a = e.confirmPasswordInputValue,
            o = e.handlePasswordEntered,
            s = e.handlePasswordInputChange,
            i = e.handleConfirmPasswordInputChange,
            c = e.passwordFieldError,
            e = e.confirmPasswordFieldError;
        return v().createElement("div", null, v().createElement(p.Modal.Header, {
            useBaseBootstrapComponent: !0
        }, v().createElement("div", {
            className: "facebook-sunset-modal-title-container"
        }, v().createElement("button", {
            type: "button",
            className: "facebook-sunset-title-button",
            onClick: t
        }, v().createElement("span", {
            className: "close icon-close"
        })), v().createElement(p.Modal.Title, {
            id: "contained-modal-title-vcenter"
        }, r("Heading.AddPassword")))), v().createElement(p.Modal.Body, null, v().createElement("div", null, v().createElement("div", {
            className: "add-password-modal-image"
        }), v().createElement("div", {
            className: "add-password-modal-body-text"
        }, r("Description.AddPasswordModal")), v().createElement("form", null, v().createElement("input", {
            className: "".concat(c ? "input-field-error" : "", " form-control input-field password-input "),
            type: "password",
            placeholder: r("Placeholder.CreatePassword"),
            value: n,
            onChange: s
        }), c && v().createElement(d, {
            passwordError: c,
            translate: r
        }), v().createElement("input", {
            className: "".concat(e ? "input-field-error" : "", " form-control input-field password-input "),
            type: "password",
            placeholder: r("Placeholder.ConfirmPassword"),
            value: a,
            onChange: i
        }), e && v().createElement(d, {
            passwordError: e,
            translate: r
        }))), v().createElement(p.Button, {
            className: "modal-button facebook-sunset-btn",
            variant: p.Button.variants.cta,
            size: p.Button.sizes.medium,
            onClick: o
        }, r("Action.Continue"))))
    }
    m.propTypes = {
        translate: o().func.isRequired,
        onHide: o().func.isRequired,
        passwordInputValue: o().string.isRequired,
        confirmPasswordInputValue: o().string.isRequired,
        handlePasswordEntered: o().func.isRequired,
        handlePasswordInputChange: o().func.isRequired,
        handleConfirmPasswordInputChange: o().func.isRequired,
        passwordFieldError: o().string.isRequired,
        confirmPasswordFieldError: o().string.isRequired
    };
    var f = m;

    function w(e) {
        var r = e.translate,
            e = e.handleClickDone;
        return v().createElement("div", null, v().createElement(p.Modal.Header, {
            useBaseBootstrapComponent: !0
        }, v().createElement("div", {
            className: "facebook-sunset-modal-title-container"
        }, v().createElement("button", {
            type: "button",
            className: "facebook-sunset-title-button",
            onClick: e
        }, v().createElement("span", {
            className: "close icon-close"
        })), v().createElement(p.Modal.Title, {
            id: "contained-modal-title-vcenter"
        }, r("Heading.Success")))), v().createElement(p.Modal.Body, null, v().createElement("div", {
            className: "success-modal-image"
        }), v().createElement("div", {
            className: "facebook-sunset-modal-body-text"
        }, r("Description.AddPasswordModalSuccess")), v().createElement(p.Button, {
            className: "modal-button facebook-sunset-btn",
            variant: p.Button.variants.cta,
            size: p.Button.sizes.medium,
            onClick: e
        }, r("Action.Done"))))
    }
    w.propTypes = {
        translate: o().func.isRequired,
        handleClickDone: o().func.isRequired
    };
    var h = w;

    function g(e) {
        var r = e.show,
            t = e.onHide,
            n = e.translate,
            a = e.passwordInputValue,
            o = e.confirmPasswordInputValue,
            s = e.handlePasswordEntered,
            i = e.handlePasswordInputChange,
            c = e.handleConfirmPasswordInputChange,
            l = e.hasUserAddedPassword,
            u = e.passwordFieldError,
            d = e.confirmPasswordFieldError,
            e = e.handleClickDone;
        return v().createElement(p.Modal, {
            show: r,
            onHide: t,
            className: "facebook-sunset-modal",
            size: "lg",
            centered: "true"
        }, l ? v().createElement(h, {
            translate: n,
            handleClickDone: e
        }) : v().createElement(f, {
            translate: n,
            onHide: t,
            passwordInputValue: a,
            confirmPasswordInputValue: o,
            handlePasswordEntered: s,
            handlePasswordInputChange: i,
            handleConfirmPasswordInputChange: c,
            passwordFieldError: u,
            confirmPasswordFieldError: d
        }))
    }
    g.propTypes = {
        translate: o().func.isRequired,
        passwordInputValue: o().string.isRequired,
        confirmPasswordInputValue: o().string.isRequired,
        handlePasswordEntered: o().func.isRequired,
        handlePasswordInputChange: o().func.isRequired,
        handleConfirmPasswordInputChange: o().func.isRequired,
        onHide: o().func.isRequired,
        show: o().bool.isRequired,
        hasUserAddedPassword: o().bool.isRequired,
        passwordFieldError: o().string.isRequired,
        confirmPasswordFieldError: o().string.isRequired,
        handleClickDone: o().bool.isRequired
    };
    var y = g,
        C = CoreRobloxUtilities,
        R = "Response.PasswordMismatch",
        k = "Response.ErrorTryAgain",
        S = "Response.TooManyAttemptsText",
        I = "\tResponse.AccessDenied",
        q = "Response.InvalidPassword";

    function O(r, e) {
        var t, n = Object.keys(r);
        return Object.getOwnPropertySymbols && (t = Object.getOwnPropertySymbols(r), e && (t = t.filter(function(e) {
            return Object.getOwnPropertyDescriptor(r, e).enumerable
        })), n.push.apply(n, t)), n
    }

    function A(n) {
        for (var e = 1; e < arguments.length; e++) {
            var a = null != arguments[e] ? arguments[e] : {};
            e % 2 ? O(Object(a), !0).forEach(function(e) {
                var r, t;
                r = n, e = a[t = e], t in r ? Object.defineProperty(r, t, {
                    value: e,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : r[t] = e
            }) : Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(a)) : O(Object(a)).forEach(function(e) {
                Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(a, e))
            })
        }
        return n
    }

    function x(e, r) {
        var t = {
                retryable: !0,
                withCredentials: !0,
                url: "".concat(P.EnvironmentUrls.authApi, "/v2/user/passwords/change")
            },
            r = {
                oldPassword: e,
                newPassword: r
            };
        return a.httpService.post(t, r).then(function(e) {
            return e
        }).catch(function(e) {
            return e
        })
    }

    function j() {
        var e = {
            retryable: !0,
            withCredentials: !0,
            url: "".concat(P.EnvironmentUrls.authApi, "/v1/social/").concat("Facebook", "/disconnect")
        };
        return a.httpService.post(e).then(function(e) {
            return e
        }).catch(function(e) {
            return console.debug(e)
        })
    }

    function B(e) {
        C.eventStreamService.sendEventWithTarget(e.type, e.context, A(A({}, e.params), {}, {
            origin: e.origin
        }))
    }
    var M = "facebookSunsetCard",
        F = {
            setPasswordButtonClick: {
                name: "setPassword",
                type: "buttonClick",
                context: M,
                params: {
                    btn: "setPassword"
                },
                origin: t = "homepage"
            },
            setPasswordSuccess: {
                name: "setPasswordSuccess",
                type: "passwordSet",
                context: M,
                params: {},
                origin: t
            }
        };

    function N(e, r, t, n, a, o, s) {
        try {
            var i = e[o](s),
                c = i.value
        } catch (e) {
            return void t(e)
        }
        i.done ? r(c) : Promise.resolve(c).then(n, a)
    }

    function T(e, r) {
        return function(e) {
            if (Array.isArray(e)) return e
        }(e) || function(e, r) {
            if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
            var t = [],
                n = !0,
                a = !1,
                o = void 0;
            try {
                for (var s, i = e[Symbol.iterator](); !(n = (s = i.next()).done) && (t.push(s.value), !r || t.length !== r); n = !0);
            } catch (e) {
                a = !0, o = e
            } finally {
                try {
                    n || null == i.return || i.return()
                } finally {
                    if (a) throw o
                }
            }
            return t
        }(e, r) || function(e, r) {
            if (!e) return;
            if ("string" == typeof e) return U(e, r);
            var t = Object.prototype.toString.call(e).slice(8, -1);
            "Object" === t && e.constructor && (t = e.constructor.name);
            if ("Map" === t || "Set" === t) return Array.from(e);
            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return U(e, r)
        }(e, r) || function() {
            throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }

    function U(e, r) {
        (null == r || r > e.length) && (r = e.length);
        for (var t = 0, n = new Array(r); t < r; t++) n[t] = e[t];
        return n
    }

    function D(e) {
        var r = e.translate,
            t = T((0, b.useState)(!1), 2),
            n = t[0],
            a = t[1],
            e = T((0, b.useState)(!1), 2),
            t = e[0],
            o = e[1],
            e = T((0, b.useState)(""), 2),
            s = e[0],
            c = e[1],
            e = T((0, b.useState)(""), 2),
            l = e[0],
            i = e[1],
            e = T((0, b.useState)(""), 2),
            u = e[0],
            d = e[1],
            e = T((0, b.useState)(""), 2),
            p = e[0],
            m = e[1],
            e = T((0, b.useState)({}), 2),
            f = e[0],
            w = e[1];
        (0, b.useEffect)(function() {
            window.addEventListener("OpenFacebookSunsetModal", function(e) {
                w({
                    closeCallback: e.detail.closeCallback
                }), a(!0)
            }, !1)
        }, []), (0, b.useEffect)(function() {
            var e;
            (u || p) && ((e = E(u, P.CurrentUser.name)) ? c(e) : u !== p ? (c(""), i(R)) : (s || l) && (c(""), i("")))
        }, [u, p]);
        var h = function() {
            var i, e = (i = regeneratorRuntime.mark(function e() {
                var r;
                return regeneratorRuntime.wrap(function(e) {
                    for (;;) switch (e.prev = e.next) {
                        case 0:
                            if (B(F.setPasswordButtonClick), s || l) return e.abrupt("return");
                            e.next = 3;
                            break;
                        case 3:
                            return e.prev = 3, e.next = 6, x("placeholder", u);
                        case 6:
                            if ((r = e.sent) && r.data && r.data.errors && 0 < r.data.errors.length) return function() {
                                switch (r.data.errors[0].code) {
                                    case 2:
                                        c(S);
                                        break;
                                    case 7:
                                        c(q);
                                        break;
                                    case 9:
                                        c(I);
                                        break;
                                    default:
                                        c(k)
                                }
                            }(), e.abrupt("return");
                            e.next = 10;
                            break;
                        case 10:
                            e.next = 16;
                            break;
                        case 12:
                            return e.prev = 12, e.t0 = e.catch(3), c(k), e.abrupt("return");
                        case 16:
                            B(F.setPasswordSuccess), j(), o(!0);
                        case 19:
                        case "end":
                            return e.stop()
                    }
                }, e, null, [
                    [3, 12]
                ])
            }), function() {
                var e = this,
                    s = arguments;
                return new Promise(function(r, t) {
                    var n = i.apply(e, s);

                    function a(e) {
                        N(n, r, t, a, o, "next", e)
                    }

                    function o(e) {
                        N(n, r, t, a, o, "throw", e)
                    }
                    a(void 0)
                })
            });
            return function() {
                return e.apply(this, arguments)
            }
        }();
        return v().createElement(y, {
            show: n,
            onHide: function() {
                d(""), m(""), c(""), i(""), a(!1)
            },
            translate: r,
            passwordInputValue: u,
            confirmPasswordInputValue: p,
            handlePasswordEntered: function() {
                return h()
            },
            handlePasswordInputChange: function(e) {
                d(e.target.value)
            },
            handleConfirmPasswordInputChange: function(e) {
                m(e.target.value)
            },
            hasUserAddedPassword: t,
            passwordFieldError: s,
            confirmPasswordFieldError: l,
            handleClickDone: function() {
                f.closeCallback(!0), a(!1)
            }
        })
    }
    D.propTypes = {
        translate: o().func.isRequired
    };
    var V = D;

    function H(e) {
        e = e.translate;
        return v().createElement(V, {
            translate: e
        })
    }
    H.propTypes = {
        translate: o().func.isRequired
    };
    var z = (0, s.withTranslations)(H, {
        common: ["CommonUI.Controls"],
        feature: "Authentication.Social"
    });

    function L() {
        document.getElementById(i) ? (0, e.render)(v().createElement(z, null), document.getElementById(i)) : window.requestAnimationFrame(L)
    }
    r().FacebookSunsetService = {
        openFacebookSunsetModal: function(e) {
            e = new CustomEvent("OpenFacebookSunsetModal", {
                detail: {
                    closeCallback: e
                }
            });
            window.dispatchEvent(e)
        }
    }, (0, a.ready)(function() {
        i && L()
    })
}();
//# sourceMappingURL=https://js.rbxcdn.com/ed6f5c9a8932a1336c9f-facebookSunsetModal.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("FacebookSunsetModal");
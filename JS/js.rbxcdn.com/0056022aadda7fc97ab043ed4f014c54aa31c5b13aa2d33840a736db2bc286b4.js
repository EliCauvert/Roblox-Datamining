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
        c = CoreUtilities,
        i = React,
        l = r.n(i),
        e = ReactDOM,
        u = Roblox,
        t = r.n(u),
        n = PropTypes,
        o = r.n(n),
        a = ReactUtilities,
        s = "accountRecoveryModal-container",
        d = ReactStyleGuide;

    function m(e) {
        var t = e.show,
            n = e.onHide,
            r = e.translate,
            e = e.onPrimaryAction;
        return l().createElement(d.Modal, {
            show: t,
            onHide: n,
            className: "account-recovery-modal",
            size: "lg",
            "aria-labelledby": "contained-modal-title-vcenter",
            scrollable: "true",
            centered: "true",
            backdrop: "static"
        }, l().createElement(d.Modal.Header, {
            useBaseBootstrapComponent: !0
        }, l().createElement("div", {
            className: "account-recovery-modal-title-container"
        }, l().createElement(d.Modal.Title, {
            id: "contained-modal-title-vcenter"
        }, r("Heading.AccountRecoveryPrompt.Title")))), l().createElement(d.Modal.Body, null, l().createElement("div", {
            className: "account-recovery-modal-body-container"
        }, l().createElement("div", {
            className: "text-lead account-recovery-modal-body-text"
        }, r("Description.AccountRecoveryPrompt.Body")), l().createElement("div", {
            className: "account-recovery-yes-button-container"
        }, l().createElement("button", {
            type: "button",
            className: "btn-primary-lg btn-full-width account-recovery-yes-button",
            onClick: e
        }, r("Action.Yes"))), l().createElement("div", {
            className: "account-recovery-no-button-container"
        }, l().createElement("button", {
            type: "button",
            className: "btn-secondary-lg btn-full-width account-recovery-no-button",
            onClick: n
        }, r("Action.No"))))))
    }
    m.propTypes = {
        translate: o().func.isRequired,
        onPrimaryAction: o().func.isRequired,
        onHide: o().func.isRequired,
        show: o().bool.isRequired
    };
    var y = m,
        p = {
            forgotCredentials: "".concat(u.EnvironmentUrls.websiteUrl, "/login/forgot-password-or-username")
        },
        b = CoreRobloxUtilities,
        f = "forgotPasswordPrompt",
        n = "buttonClick",
        v = {
            modalShown: {
                name: "modalShown",
                type: b.eventStreamService.eventTypes.modalAction,
                context: f,
                params: {
                    aType: "shown"
                }
            },
            yesButtonClick: {
                name: "yesButtonClick",
                type: n,
                context: f,
                params: {
                    btn: "yes"
                }
            },
            noButtonClick: {
                name: "noButtonClick",
                type: n,
                context: f,
                params: {
                    btn: "no"
                }
            }
        },
        g = {
            apiUrls: {
                enrollAbtestingApi: {
                    url: "".concat(u.EnvironmentUrls.abtestingApiSite, "/v1/enrollments"),
                    retryable: !1,
                    withCredentials: !1
                }
            },
            abtestingRequest: {
                subjectType: "BrowserTracker",
                experimentName: "Web.Login.AccountRecoveryPrompt"
            },
            abtestingResponse: {
                status: {
                    enrolled: "Enrolled"
                }
            }
        };

    function w(t, e) {
        var n, r = Object.keys(t);
        return Object.getOwnPropertySymbols && (n = Object.getOwnPropertySymbols(t), e && (n = n.filter(function(e) {
            return Object.getOwnPropertyDescriptor(t, e).enumerable
        })), r.push.apply(r, n)), r
    }

    function h(r) {
        for (var e = 1; e < arguments.length; e++) {
            var o = null != arguments[e] ? arguments[e] : {};
            e % 2 ? w(Object(o), !0).forEach(function(e) {
                var t, n;
                t = r, e = o[n = e], n in t ? Object.defineProperty(t, n, {
                    value: e,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = e
            }) : Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(o)) : w(Object(o)).forEach(function(e) {
                Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(o, e))
            })
        }
        return r
    }

    function E(e) {
        b.eventStreamService.sendEventWithTarget(e.type, e.context, h({}, e.params))
    }

    function O(e, t) {
        return function(e) {
            if (Array.isArray(e)) return e
        }(e) || function(e, t) {
            if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
            var n = [],
                r = !0,
                o = !1,
                a = void 0;
            try {
                for (var c, i = e[Symbol.iterator](); !(r = (c = i.next()).done) && (n.push(c.value), !t || n.length !== t); r = !0);
            } catch (e) {
                o = !0, a = e
            } finally {
                try {
                    r || null == i.return || i.return()
                } finally {
                    if (o) throw a
                }
            }
            return n
        }(e, t) || function(e, t) {
            if (!e) return;
            if ("string" == typeof e) return R(e, t);
            var n = Object.prototype.toString.call(e).slice(8, -1);
            "Object" === n && e.constructor && (n = e.constructor.name);
            if ("Map" === n || "Set" === n) return Array.from(e);
            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return R(e, t)
        }(e, t) || function() {
            throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }

    function R(e, t) {
        (null == t || t > e.length) && (t = e.length);
        for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
        return r
    }

    function A(e) {
        var t = e.translate,
            n = O((0, i.useState)(!1), 2),
            e = n[0],
            r = n[1],
            n = O((0, i.useState)(-1), 2),
            o = n[0],
            a = n[1];
        return (0, i.useEffect)(function() {
            var n, e;
            n = function(e) {
                a(e)
            }, e = [{
                SubjectType: g.abtestingRequest.subjectType,
                SubjectTargetId: u.Cookies.getBrowserTrackerId(),
                ExperimentName: g.abtestingRequest.experimentName
            }], c.httpService.post(g.apiUrls.enrollAbtestingApi, e).then(function(e) {
                var t;
                e.data && e.data.data && 0 < e.data.data.length && (t = e.data.data[0], e = g.abtestingResponse, t.Status === e.status.enrolled && (1 === t.Variation ? n(1) : 2 === t.Variation ? n(3) : n(-1))), n(-1)
            })
        }, []), window.addEventListener("OpenAccountRecoveryModal", function(e) {
            -1 < o && e.detail >= o && (E(v.modalShown), r(!0))
        }, !1), l().createElement(y, {
            show: e,
            onPrimaryAction: function() {
                return E(v.yesButtonClick), void(window.location.href = p.forgotCredentials)
            },
            onHide: function() {
                return E(v.noButtonClick), void r(!1)
            },
            translate: t
        })
    }
    A.propTypes = {
        translate: o().func.isRequired
    };
    var S = A;

    function j(e) {
        e = e.translate;
        return l().createElement(S, {
            translate: e
        })
    }
    j.propTypes = {
        translate: o().func.isRequired
    };
    var P = (0, a.withTranslations)(j, {
        common: ["CommonUI.Controls"],
        feature: "Authentication.ResetPassword"
    });
    t().AccountRecoveryModalService = {
        openAccountRecoveryModal: function(e) {
            e = new CustomEvent("OpenAccountRecoveryModal", {
                detail: e
            });
            window.dispatchEvent(e)
        }
    }, (0, c.ready)(function() {
        document.getElementById(s) && (0, e.render)(l().createElement(P, null), document.getElementById(s))
    })
}();
//# sourceMappingURL=https://js.rbxcdn.com/ed6f5c9a8932a1336c9f-accountRecoveryModal.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("AccountRecoveryModal");
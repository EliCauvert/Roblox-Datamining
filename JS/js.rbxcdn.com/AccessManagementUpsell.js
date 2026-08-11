! function() {
    "use strict";
    var e = {
            n: function(n) {
                var t = n && n.__esModule ? function() {
                    return n.default
                } : function() {
                    return n
                };
                return e.d(t, {
                    a: t
                }), t
            },
            d: function(n, t) {
                for (var a in t) e.o(t, a) && !e.o(n, a) && Object.defineProperty(n, a, {
                    enumerable: !0,
                    get: t[a]
                })
            },
            o: function(e, n) {
                return Object.prototype.hasOwnProperty.call(e, n)
            }
        },
        n = React,
        t = e.n(n),
        a = Roblox,
        r = e.n(a),
        o = ReactDOM,
        c = CoreUtilities,
        i = "access-management-upsell-container-v1",
        s = ReactUtilities,
        l = PropTypes,
        d = e.n(l),
        u = ReactStyleGuide,
        p = "Modal.Title",
        m = "Modal.ContentText",
        f = "Button.AccountInfo",
        v = "/my/account#!/info",
        h = {
            OpenAccessManagementVerificationModal: "OpenAccessManagementVerificationModal"
        },
        g = function(e) {
            void 0 === e && (e = {
                baseUrl: ""
            }), this.configuration = e, this.baseUrl = this.configuration.baseUrl
        },
        w = function() {
            function e(e) {
                void 0 === e && (e = new g), this.configuration = e, this.baseUrl = e.baseUrl
            }
            return e.prototype.sendEvent = function(e) {
                var n = e.localTime,
                    t = e.target,
                    a = e.eventType,
                    r = e.context,
                    o = e.additionalProperties,
                    c = e.currentUrl,
                    i = e.guestId,
                    s = e.sessionId,
                    l = n.toISOString(),
                    d = new URL("".concat(this.baseUrl, "/pe"));
                return d.searchParams.append("t", t), d.searchParams.append("evt", a), d.searchParams.append("ctx", r), d.searchParams.append("lt", l), d.searchParams.append("url", c || window.location.href), void 0 !== i && d.searchParams.append("gid", i), void 0 !== s && d.searchParams.append("sid", s), void 0 !== o && Object.keys(o).forEach((function(e) {
                    var n;
                    d.searchParams.append(e, (null !== (n = o[e]) && void 0 !== n ? n : "").toString())
                })), fetch(d.href, {
                    credentials: "same-origin"
                })
            }, e.prototype.sendEventViaImg = function(e, n) {
                var t = e.localTime,
                    a = e.target,
                    r = e.eventType,
                    o = e.context,
                    c = e.additionalProperties,
                    i = e.currentUrl,
                    s = e.guestId,
                    l = e.sessionId,
                    d = t.toISOString(),
                    u = new URL("".concat(this.baseUrl, "/e.png"));
                u.searchParams.append("t", a), u.searchParams.append("evt", r), u.searchParams.append("ctx", o), u.searchParams.append("lt", d), u.searchParams.append("url", i || window.location.href), void 0 !== s && u.searchParams.append("gid", s), void 0 !== l && u.searchParams.append("sid", l), void 0 !== c && Object.keys(c).forEach((function(e) {
                    var n;
                    u.searchParams.append(e, (null !== (n = c[e]) && void 0 !== n ? n : "").toString())
                }));
                var p = new Image;
                return p.src = u.href, p.onload = function() {
                    void 0 !== n && n(!0)
                }, p.onerror = function(e) {
                    void 0 !== n && n(!1), console.error(e)
                }, p
            }, e
        }(),
        y = function() {
            return y = Object.assign || function(e) {
                for (var n, t = 1, a = arguments.length; t < a; t++)
                    for (var r in n = arguments[t]) Object.prototype.hasOwnProperty.call(n, r) && (e[r] = n[r]);
                return e
            }, y.apply(this, arguments)
        },
        b = a.EnvironmentUrls.domain,
        E = new w(new g({
            baseUrl: "https://ecsv2." + b + "/AccessManagementUpsell"
        })),
        P = {
            sendEvent: function(e) {
                var n = {
                    target: e.name,
                    localTime: new Date,
                    eventType: e.type,
                    context: e.context,
                    additionalProperties: y({}, e.params)
                };
                return E.sendEventViaImg(n)
            }
        },
        M = CoreRobloxUtilities.eventStreamService.eventTypes,
        U = "accessManagementUpsell",
        O = {
            name: "showModal",
            type: M.modalAction,
            context: U,
            params: {
                aType: "shown"
            }
        },
        T = {
            name: "accountSettingsClick",
            type: M.buttonClick,
            context: U,
            params: {
                btn: "accountInfo"
            }
        };

    function A(e) {
        var r = e.translate,
            o = p,
            c = m,
            i = f,
            s = v,
            l = (0, n.useState)(!1),
            d = l[0],
            g = l[1];

        function w() {
            g(!1)
        }
        return (0, n.useEffect)((function() {
            window.addEventListener(h.OpenAccessManagementVerificationModal, (function() {
                g(!0), P.sendEvent(O)
            }), !1)
        }), []), t().createElement(t().Fragment, null, t().createElement(u.Modal, {
            show: d,
            onHide: function() {
                return w()
            },
            size: "sm",
            "aria-labelledby": "access-management-modal-title",
            className: "access-management-upsell-modal",
            scrollable: "true",
            centered: "true"
        }, t().createElement(u.Modal.Header, {
            useBaseBootstrapComponent: !0
        }, t().createElement("button", {
            type: "button",
            className: "close",
            id: "access-management-upsell-close-button",
            onClick: function() {
                return w()
            }
        }, t().createElement("span", {
            className: "icon-close"
        })), t().createElement(u.Modal.Title, {
            id: "access-management-modal-title"
        }, r(o))), t().createElement(u.Modal.Body, null, r(c)), t().createElement(u.Modal.Footer, null, t().createElement(u.Button, {
            variant: u.Button.variants.primary,
            width: "full",
            onClick: function() {
                return e = a.Endpoints.getAbsoluteUrl(s), void("undefined" != typeof window && (window.location.href = e, g(!1), P.sendEvent(T)));
                var e
            },
            className: "modal-button"
        }, r(i)))))
    }
    A.propTypes = {
        translate: d().func.isRequired
    };
    var I = A;
    var S = (0, s.withTranslations)((function(e) {
            var n = e.translate;
            return t().createElement(I, {
                translate: n
            })
        }), {
            common: [],
            feature: "Feature.AgeVerificationUpsell"
        }),
        x = function() {
            return new Promise((function(e) {
                var n = new CustomEvent(h.OpenAccessManagementVerificationModal, {
                    detail: {
                        closeCallback: function(n) {
                            e(n)
                        }
                    }
                });
                window.dispatchEvent(n)
            }))
        };

    function C() {
        var e = document.getElementById(i);
        e ? (0, o.render)(t().createElement(S, null), e) : window.requestAnimationFrame(C)
    }
    r().AccessManagementUpsellService = {
        showAccessManagementVerificationModal: x
    }, (0, c.ready)((function() {
        i && C()
    }))
}();
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/1b6997df8c0ee1aaf38db5694cca4e60-accessManagementUpsell.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("AccessManagementUpsell");
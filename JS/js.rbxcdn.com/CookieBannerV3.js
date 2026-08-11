! function() {
    try {
        var e = "undefined" != typeof window ? window : "undefined" != typeof global ? global : "undefined" != typeof globalThis ? globalThis : "undefined" != typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "0921efeeb7915525c34339f0bd121e150ef14a90"
        };
        var n = (new e.Error).stack;
        n && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[n] = "d149589c-8da3-43bd-aa73-c743a6a48a31", e._sentryDebugIdIdentifier = "sentry-dbid-d149589c-8da3-43bd-aa73-c743a6a48a31")
    } catch (e) {}
}(),
function() {
    var e = {
            942: function(e) {
                function n(e) {
                    return e && "undefined" != typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
                }!
                /*!
                	Copyright (c) 2018 Jed Watson.
                	Licensed under the MIT License (MIT), see
                	http://jedwatson.github.io/classnames
                */
                function() {
                    "use strict";
                    var t = {}.hasOwnProperty;

                    function o() {
                        for (var e = "", i = 0; i < arguments.length; i++) {
                            var a = arguments[i];
                            a && (e = r(e, function(e) {
                                if ("string" == typeof e || "number" == typeof e) return e;
                                if ((void 0 === e ? "undefined" : n(e)) !== "object") return "";
                                if (Array.isArray(e)) return o.apply(null, e);
                                if (e.toString !== Object.prototype.toString && !e.toString.toString().includes("[native code]")) return e.toString();
                                var i = "";
                                for (var a in e) t.call(e, a) && e[a] && (i = r(i, a));
                                return i
                            }(a)))
                        }
                        return e
                    }

                    function r(e, n) {
                        return n ? e ? e + " " + n : e + n : e
                    }
                    e.exports ? (o.default = o, e.exports = o) : "function" == typeof define && "object" === n(define.amd) && define.amd ? define("classnames", [], function() {
                        return o
                    }) : window.classNames = o
                }()
            },
            78: function(e, n, t) {
                "use strict";
                e.exports = {}
            }
        },
        n = {};

    function t(o) {
        var r = n[o];
        if (void 0 !== r) return r.exports;
        var i = n[o] = {
            exports: {}
        };
        return e[o](i, i.exports, t), i.exports
    }
    t.m = e, t.n = function(e) {
        var n = e && e.__esModule ? function() {
            return e.default
        } : function() {
            return e
        };
        return t.d(n, {
            a: n
        }), n
    }, t.d = function(e, n) {
        for (var o in n) t.o(n, o) && !t.o(e, o) && Object.defineProperty(e, o, {
            enumerable: !0,
            get: n[o]
        })
    }, t.k = function(e) {
        return "" + e + ".css"
    }, t.g = function() {
        if ("object" == typeof globalThis) return globalThis;
        try {
            return this || Function("return this")()
        } catch (e) {
            if ("object" == typeof window) return window
        }
    }(), t.o = function(e, n) {
        return Object.prototype.hasOwnProperty.call(e, n)
    }, t.r = function(e) {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }, t.rv = function() {
        return "1.5.7"
    }, t.g.importScripts && (o = t.g.location + "");
    var o, r = t.g.document;
    if (!o && r && (r.currentScript && "SCRIPT" === r.currentScript.tagName.toUpperCase() && (o = r.currentScript.src), !o)) {
        var i = r.getElementsByTagName("script");
        if (i.length)
            for (var a = i.length - 1; a > -1 && (!o || !/^http(s?):/.test(o));) o = i[a--].src
    }
    if (!o) throw Error("Automatic publicPath is not supported in this browser");
    t.p = o.replace(/^blob:/, "").replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/[^\/]+$/, "/"), t.ruid = "bundler=rspack@1.5.7",
        function() {
            "use strict";
            var e = window.ReactJSX,
                n = window.Roblox["core-scripts"].util.ready,
                o = t.n(n),
                r = window.Roblox["core-scripts"].react,
                i = {
                    banner: "banner",
                    consentTool: "consentTool"
                },
                a = window.React,
                s = function(e) {
                    var n, t = "".concat(e, "="),
                        o = null == (n = document.cookie.split("; ").find(function(e) {
                            return e.startsWith(t)
                        })) ? void 0 : n.split("=")[1];
                    return null == o ? null : {
                        name: e,
                        value: decodeURIComponent(o)
                    }
                },
                c = function(e, n, t) {
                    var o, r = null == t.sameSite ? "" : ";samesite=".concat(t.sameSite),
                        i = null == t.domain ? "" : ";domain=".concat(t.domain),
                        a = ";path=".concat(null != (o = t.path) ? o : "/"),
                        s = null == t.expires ? "" : ";expires=".concat(t.expires.toUTCString()),
                        c = null == t.maxAge ? "" : ";max-age=".concat(t.maxAge);
                    document.cookie = "".concat(e, "=").concat(encodeURIComponent(n), ";secure").concat(r).concat(i).concat(a).concat(s).concat(c)
                },
                l = function(e, n, t) {
                    c(e, n, t)
                },
                u = function(e, n) {
                    c(e, "", {
                        domain: n.domain,
                        path: n.path,
                        expires: new Date(0)
                    })
                },
                d = JSON.parse('{"w":["CommonUI.Messages","CommonUI.Controls","Feature.Tracking"]}'),
                f = window.Roblox["core-scripts"].guac;

            function p(e, n, t, o, r, i, a) {
                try {
                    var s = e[i](a),
                        c = s.value
                } catch (e) {
                    t(e);
                    return
                }
                s.done ? n(c) : Promise.resolve(c).then(o, r)
            }
            var h = function() {
                    var e;
                    return (e = function() {
                        return function(e, n) {
                            var t, o, r, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & r[0]) throw r[1];
                                        return r[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                return this
                            }), a;

                            function s(s) {
                                return function(c) {
                                    var l = [s, c];
                                    if (t) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, l[0] && (i = 0)), i;) try {
                                        if (t = 1, o && (r = 2 & l[0] ? o.return : l[0] ? o.throw || ((r = o.return) && r.call(o), 0) : o.next) && !(r = r.call(o, l[1])).done) return r;
                                        switch (o = 0, r && (l = [2 & l[0], r.value]), l[0]) {
                                            case 0:
                                            case 1:
                                                r = l;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: l[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, o = l[1], l = [0];
                                                continue;
                                            case 7:
                                                l = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(r = (r = i.trys).length > 0 && r[r.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === l[0] && (!r || l[1] > r[0] && l[1] < r[3])) {
                                                    i.label = l[1];
                                                    break
                                                }
                                                if (6 === l[0] && i.label < r[1]) {
                                                    i.label = r[1], r = l;
                                                    break
                                                }
                                                if (r && i.label < r[2]) {
                                                    i.label = r[2], i.ops.push(l);
                                                    break
                                                }
                                                r[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        l = n.call(e, i)
                                    } catch (e) {
                                        l = [6, e], o = 0
                                    } finally {
                                        t = r = 0
                                    }
                                    if (5 & l[0]) throw l[1];
                                    return {
                                        value: l[0] ? l[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(e) {
                            switch (e.label) {
                                case 0:
                                    return [4, (0, f.callBehaviour)("cookie-policy")];
                                case 1:
                                    return [2, e.sent()]
                            }
                        })
                    }, function() {
                        var n = this,
                            t = arguments;
                        return new Promise(function(o, r) {
                            var i = e.apply(n, t);

                            function a(e) {
                                p(i, o, r, a, s, "next", e)
                            }

                            function s(e) {
                                p(i, o, r, a, s, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                },
                m = "RBXcb",
                b = "Description.PrivacyPolicy",
                y = "{privacyPolicyLink}",
                x = window.Roblox["core-scripts"].environmentUrls,
                g = t.n(x),
                v = function(e, n) {
                    s(m) && u(m, {
                        domain: g().domain
                    });
                    var t = "",
                        o = [];
                    n.forEach(function(r, i) {
                        e.includes(r) ? t += "".concat(r, "=true&") : (t += "".concat(r, "=false&"), o.push(r)), i === n.length - 1 && (t = t.slice(0, -1))
                    }), o.forEach(function(e) {
                        u(e, {
                            domain: g().domain
                        })
                    }), l(m, t, {
                        maxAge: 15552e3,
                        domain: g().domain
                    })
                },
                k = function() {
                    var e = s(m);
                    return !!e && !!e.value.split("&").find(function(e) {
                        return "true" === e.split("=")[1]
                    })
                },
                j = window.Roblox["core-scripts"].intl.intl,
                w = t.n(j),
                N = window.ReactStyleGuide,
                S = window.CoreUtilities,
                C = window.Roblox["core-scripts"].endpoints,
                A = (0, C.getAbsoluteUrl)("/info/privacy"),
                D = (0, C.getAbsoluteUrl)("/support"),
                E = function(n) {
                    var t = n.nonEssentialCookieList,
                        o = n.closeBanner,
                        r = n.showConsentTool,
                        i = n.translate,
                        s = new(w())().getRobloxLocale(),
                        c = i("Description.CookieBannerContent"),
                        l = c.indexOf(y),
                        u = S.urlService.getUrlWithLocale("string" == typeof A ? A : "", s),
                        d = (0, e.jsx)("span", {
                            className: "text",
                            children: c.substring(0, l)
                        }),
                        f = y.length,
                        p = (0, e.jsx)("span", {
                            className: "text",
                            children: c.substring(l + f)
                        }),
                        h = (0, e.jsx)("a", {
                            className: "text-link",
                            target: "_blank",
                            href: u,
                            rel: "noreferrer",
                            children: i(b)
                        }),
                        m = function(e) {
                            v(e, t), o()
                        };
                    return (0, e.jsxs)(a.Fragment, {
                        children: [(0, e.jsxs)("div", {
                            className: "cookie-banner",
                            children: [(0, e.jsxs)("div", {
                                className: "cookie-description-content",
                                children: [d, h, p]
                            }), (0, e.jsx)("div", {
                                children: (0, e.jsxs)("div", {
                                    className: "cookie-button-container",
                                    children: [(0, e.jsx)(N.Button, {
                                        className: "see-all-link btn-secondary-md consent-tool-link",
                                        onClick: r,
                                        children: i("Action.SetCookieOptions")
                                    }), (0, e.jsxs)("div", {
                                        className: "cookie-btn-float",
                                        children: [(0, e.jsx)(N.Button, {
                                            className: "btn-secondary-lg cookie-btn",
                                            onClick: function() {
                                                m([""])
                                            },
                                            children: i("Action.DeclineAll")
                                        }), (0, e.jsx)(N.Button, {
                                            className: "btn-cta-lg cookie-btn",
                                            onClick: function() {
                                                m(t)
                                            },
                                            children: i("Action.AcceptAll")
                                        })]
                                    })]
                                })
                            })]
                        }), (0, e.jsx)("div", {
                            className: "cookie-banner-bg",
                            onClick: function() {
                                m([""])
                            },
                            "aria-hidden": "true"
                        })]
                    })
                },
                I = t(942),
                R = t.n(I),
                T = "RBXViralAcquisition",
                L = "Description.RBXViralAcquisition",
                B = "RBXSource",
                O = "Description.RBXSource",
                P = "Heading.GoogleAnalytics",
                U = [{
                    label: "Label.DataCollected",
                    content: "Description.DataCollected"
                }, {
                    label: "Label.DataSharing",
                    content: "Description.DataSharing"
                }, {
                    label: "Label.DataRetention",
                    content: "Description.DataRetention"
                }, {
                    label: "Label.DataUse",
                    content: "Description.DataUse"
                }, {
                    label: "Label.DataStorage",
                    content: "Description.Undisclosed"
                }],
                _ = function(n) {
                    var t = n.cookieName,
                        o = n.description;
                    return (0, e.jsxs)("div", {
                        className: "cookie-item",
                        children: [(0, e.jsx)("p", {
                            className: "cookie-name font-body text",
                            children: t
                        }), (0, e.jsx)("p", {
                            className: "cookie-description font-footer",
                            children: o
                        })]
                    })
                },
                H = function(n) {
                    var t = n.translate,
                        o = n.isNonEssentialCookieListVisible,
                        r = R()({
                            hidden: !o
                        }),
                        i = U.map(function(n) {
                            return (0, e.jsxs)("div", {
                                className: "google-analytics-company-info-sec",
                                children: [(0, e.jsx)("p", {
                                    className: "font-caption-header text-emphasis",
                                    children: t(n.label)
                                }), (0, e.jsx)("p", {
                                    className: "font-caption-body text",
                                    children: t(n.content)
                                })]
                            }, n.label)
                        }),
                        a = (0, e.jsx)("a", {
                            className: "text-link",
                            target: "_blank",
                            href: "https://support.google.com/analytics/answer/11397207",
                            rel: "noreferrer",
                            children: t(P)
                        }),
                        s = t("Description.GAReadMore"),
                        c = s.indexOf("{googleAnalyticsLink}"),
                        l = (0, e.jsxs)("p", {
                            className: "font-caption-body text",
                            children: [s.substring(0, c), a]
                        }),
                        u = (0, e.jsxs)("div", {
                            children: [(0, e.jsxs)("a", {
                                className: "font-header-2 text-emphasis",
                                href: "https://marketingplatform.google.com/about/analytics/",
                                children: [t(P), (0, e.jsx)("span", {
                                    className: "icon-nav-external-link-sm cookie-external-link-icon"
                                })]
                            }), (0, e.jsxs)("div", {
                                children: [(0, e.jsx)("span", {
                                    className: "google-analytics-info-subheader",
                                    children: t("Label.OwnedBy")
                                }), (0, e.jsx)("span", {
                                    className: "font-caption-header text-emphasis",
                                    children: "Google Inc."
                                })]
                            }), (0, e.jsx)("p", {
                                className: "text-emphasis google-analytics-company-info-sec",
                                children: t("Heading.GoogleAnalyticsPurpose")
                            }), (0, e.jsx)("span", {
                                className: "font-caption-body text",
                                children: t("Description.GoogleAnalyticsPurpose")
                            }), (0, e.jsx)("p", {
                                className: "text-emphasis google-analytics-company-info-sec",
                                children: t("Heading.CompanyCollection")
                            }), i, l]
                        }),
                        d = (0, e.jsxs)("div", {
                            className: "analytics-cookie-list",
                            children: [(0, e.jsx)(_, {
                                cookieName: T,
                                description: t(L)
                            }), (0, e.jsx)(_, {
                                cookieName: B,
                                description: t(O)
                            })]
                        });
                    return (0, e.jsxs)("div", {
                        className: r,
                        children: [d, u]
                    })
                };

            function G(e, n) {
                (null == n || n > e.length) && (n = e.length);
                for (var t = 0, o = Array(n); t < n; t++) o[t] = e[t];
                return o
            }

            function M(e, n) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, n) {
                    var t, o, r = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != r) {
                        var i = [],
                            a = !0,
                            s = !1;
                        try {
                            for (r = r.call(e); !(a = (t = r.next()).done) && (i.push(t.value), !n || i.length !== n); a = !0);
                        } catch (e) {
                            s = !0, o = e
                        } finally {
                            try {
                                a || null == r.return || r.return()
                            } finally {
                                if (s) throw o
                            }
                        }
                        return i
                    }
                }(e, n) || function(e, n) {
                    if (e) {
                        if ("string" == typeof e) return G(e, n);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return G(e, n)
                    }
                }(e, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var V = M((0, N.createModal)(), 2),
                X = V[0],
                $ = V[1],
                W = function(n) {
                    var t = n.nonEssentialCookieList,
                        o = n.essentialCookieList,
                        r = n.translate,
                        s = n.closeConsentTool,
                        c = k(),
                        l = M((0, a.useState)(c), 2),
                        u = l[0],
                        d = l[1],
                        f = M((0, a.useState)(!1), 2),
                        p = f[0],
                        h = f[1],
                        m = M((0, a.useState)(!1), 2),
                        y = m[0],
                        x = m[1];
                    (0, a.useEffect)(function() {
                        $.open()
                    }, []);
                    var g = R()({
                            hidden: !p
                        }),
                        j = R()("cookie-consent-tool-collaps", {
                            on: y
                        }),
                        C = R()("cookie-consent-tool-collaps font-header-2 text-emphasis ", {
                            on: p
                        }),
                        E = new(w())().getRobloxLocale(),
                        I = S.urlService.getUrlWithLocale("string" == typeof A ? A : "", E),
                        T = (0, e.jsx)("div", {
                            className: "cookie-consent-tool-info-link",
                            children: (0, e.jsxs)("a", {
                                className: "text-link",
                                target: "_blank",
                                href: I,
                                rel: "noreferrer",
                                children: [r(b), (0, e.jsx)("span", {
                                    className: "icon-nav-external-link-sm cookie-external-link-icon"
                                })]
                            })
                        }),
                        L = (0, e.jsx)("div", {
                            className: "cookie-consent-tool-info-link",
                            children: (0, e.jsxs)("a", {
                                className: "text-link",
                                target: "_blank",
                                href: "string" == typeof D ? D : "",
                                rel: "noreferrer",
                                children: [r("Action.RequestData"), (0, e.jsx)("span", {
                                    className: "icon-nav-external-link-sm cookie-external-link-icon"
                                })]
                            })
                        }),
                        B = (0, e.jsxs)("div", {
                            children: [(0, e.jsxs)("div", {
                                className: "static-section",
                                children: [(0, e.jsx)("div", {
                                    className: "font-header-2 text-emphasis google-analytics-company-info-sec",
                                    children: r("Heading.InformationCollection")
                                }), (0, e.jsx)("p", {
                                    className: "font-caption-body text",
                                    children: r("Description.InformationCollection")
                                })]
                            }), (0, e.jsxs)("div", {
                                className: "static-section",
                                children: [(0, e.jsx)("div", {
                                    className: "font-header-2 text-emphasis google-analytics-company-info-sec",
                                    children: r("Heading.InformationCollection2")
                                }), (0, e.jsx)("p", {
                                    className: "font-caption-body text",
                                    children: r("Description.InformationCollection2")
                                })]
                            }), (0, e.jsxs)("div", {
                                className: "static-section",
                                children: [(0, e.jsx)("div", {
                                    className: "font-header-2 text-emphasis google-analytics-company-info-sec",
                                    children: r("Heading.InformationPartnerCollection")
                                }), (0, e.jsx)("p", {
                                    className: "font-caption-body text",
                                    children: r("Description.InformationPartnerCollection")
                                })]
                            })]
                        }),
                        O = (0, e.jsxs)("div", {
                            children: [(0, e.jsx)("button", {
                                className: j,
                                type: "button",
                                onClick: function() {
                                    x(!y)
                                },
                                children: (0, e.jsx)("span", {
                                    className: "font-header-2 text-emphasis",
                                    children: r("Heading.AnalyticsCookies")
                                })
                            }), (0, e.jsx)(N.Toggle, {
                                className: "cookie-toggle",
                                isOn: u,
                                onToggle: function() {
                                    d(!u)
                                }
                            })]
                        }),
                        P = o.map(function(n) {
                            return (0, e.jsx)(_, {
                                cookieName: n.cookieName,
                                description: r(n.description)
                            }, n.cookieName)
                        }),
                        U = (0, e.jsxs)("div", {
                            children: [L, T]
                        }),
                        G = (0, e.jsxs)("div", {
                            className: "essential-cookie-section",
                            children: [(0, e.jsx)("button", {
                                className: C,
                                type: "button",
                                onClick: function() {
                                    h(!p)
                                },
                                children: r("Heading.EssentialCookies")
                            }), (0, e.jsx)("div", {
                                className: g,
                                children: P
                            })]
                        }),
                        V = (0, e.jsxs)("div", {
                            className: "cookie-consent-tool-body",
                            children: [B, U, G, O, (0, e.jsx)(H, {
                                isNonEssentialCookieListVisible: y,
                                translate: r
                            })]
                        });
                    return (0, e.jsx)(X, {
                        title: r("Heading.CookieSettings"),
                        body: V,
                        actionButtonShow: !0,
                        actionButtonText: r("Action.SavePreferences"),
                        neutralButtonText: r("Action.Cancel"),
                        onAction: function() {
                            v(u ? t : [], t), s(null)
                        },
                        onNeutral: function() {
                            s(i.banner)
                        },
                        id: "cookie-consent-tool-modal",
                        size: "lg"
                    })
                };

            function q(e, n) {
                (null == n || n > e.length) && (n = e.length);
                for (var t = 0, o = Array(n); t < n; t++) o[t] = e[t];
                return o
            }

            function F(e, n, t, o, r, i, a) {
                try {
                    var s = e[i](a),
                        c = s.value
                } catch (e) {
                    t(e);
                    return
                }
                s.done ? n(c) : Promise.resolve(c).then(o, r)
            }

            function J(e, n) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, n) {
                    var t, o, r = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != r) {
                        var i = [],
                            a = !0,
                            s = !1;
                        try {
                            for (r = r.call(e); !(a = (t = r.next()).done) && (i.push(t.value), !n || i.length !== n); a = !0);
                        } catch (e) {
                            s = !0, o = e
                        } finally {
                            try {
                                a || null == r.return || r.return()
                            } finally {
                                if (s) throw o
                            }
                        }
                        return i
                    }
                }(e, n) || function(e, n) {
                    if (e) {
                        if ("string" == typeof e) return q(e, n);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return q(e, n)
                    }
                }(e, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var z = (0, r.withTranslations)(function(n) {
                var t = n.translate,
                    o = J((0, a.useState)([]), 2),
                    r = o[0],
                    c = o[1],
                    l = J((0, a.useState)([]), 2),
                    u = l[0],
                    d = l[1],
                    f = J((0, a.useState)(null), 2),
                    p = f[0],
                    b = f[1];
                switch ((0, a.useEffect)(function() {
                        var e, n = s(m);
                        (null == n || "" === n.value) && (e = function() {
                            var e;
                            return function(e, n) {
                                var t, o, r, i = {
                                        label: 0,
                                        sent: function() {
                                            if (1 & r[0]) throw r[1];
                                            return r[1]
                                        },
                                        trys: [],
                                        ops: []
                                    },
                                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                return a.next = s(0), a.throw = s(1), a.return = s(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                                    return this
                                }), a;

                                function s(s) {
                                    return function(c) {
                                        var l = [s, c];
                                        if (t) throw TypeError("Generator is already executing.");
                                        for (; a && (a = 0, l[0] && (i = 0)), i;) try {
                                            if (t = 1, o && (r = 2 & l[0] ? o.return : l[0] ? o.throw || ((r = o.return) && r.call(o), 0) : o.next) && !(r = r.call(o, l[1])).done) return r;
                                            switch (o = 0, r && (l = [2 & l[0], r.value]), l[0]) {
                                                case 0:
                                                case 1:
                                                    r = l;
                                                    break;
                                                case 4:
                                                    return i.label++, {
                                                        value: l[1],
                                                        done: !1
                                                    };
                                                case 5:
                                                    i.label++, o = l[1], l = [0];
                                                    continue;
                                                case 7:
                                                    l = i.ops.pop(), i.trys.pop();
                                                    continue;
                                                default:
                                                    if (!(r = (r = i.trys).length > 0 && r[r.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                                        i = 0;
                                                        continue
                                                    }
                                                    if (3 === l[0] && (!r || l[1] > r[0] && l[1] < r[3])) {
                                                        i.label = l[1];
                                                        break
                                                    }
                                                    if (6 === l[0] && i.label < r[1]) {
                                                        i.label = r[1], r = l;
                                                        break
                                                    }
                                                    if (r && i.label < r[2]) {
                                                        i.label = r[2], i.ops.push(l);
                                                        break
                                                    }
                                                    r[2] && i.ops.pop(), i.trys.pop();
                                                    continue
                                            }
                                            l = n.call(e, i)
                                        } catch (e) {
                                            l = [6, e], o = 0
                                        } finally {
                                            t = r = 0
                                        }
                                        if (5 & l[0]) throw l[1];
                                        return {
                                            value: l[0] ? l[1] : void 0,
                                            done: !0
                                        }
                                    }
                                }
                            }(this, function(n) {
                                switch (n.label) {
                                    case 0:
                                        return [4, h()];
                                    case 1:
                                        return (e = n.sent()).ShouldDisplayCookieBannerV3 && e.EssentialCookieList ? (c(e.NonEssentialCookieList), d(e.EssentialCookieList), b(i.banner)) : v(e.NonEssentialCookieList, e.NonEssentialCookieList), [2]
                                }
                            })
                        }, function() {
                            var n = this,
                                t = arguments;
                            return new Promise(function(o, r) {
                                var i = e.apply(n, t);

                                function a(e) {
                                    F(i, o, r, a, s, "next", e)
                                }

                                function s(e) {
                                    F(i, o, r, a, s, "throw", e)
                                }
                                a(void 0)
                            })
                        })()
                    }, []), p) {
                    case i.banner:
                        return (0, e.jsx)(E, {
                            translate: t,
                            nonEssentialCookieList: r,
                            closeBanner: function() {
                                b(null)
                            },
                            showConsentTool: function() {
                                b(i.consentTool)
                            }
                        });
                    case i.consentTool:
                        return (0, e.jsx)(W, {
                            translate: t,
                            essentialCookieList: u,
                            nonEssentialCookieList: r,
                            closeConsentTool: b
                        });
                    default:
                        return (0, e.jsx)("div", {})
                }
            }, d.w);
            t(78);
            var Y = document.getElementById("cookie-banner-wrapper");
            o()(function() {
                Y && (0, r.renderWithErrorBoundary)((0, e.jsx)(z, {}), Y)
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("CookieBannerV3");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/cookieBannerV3-8cdb1570e906d383.js.map
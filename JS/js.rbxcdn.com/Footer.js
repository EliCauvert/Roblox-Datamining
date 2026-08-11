! function() {
    try {
        var t = "undefined" != typeof window ? window : "undefined" != typeof global ? global : "undefined" != typeof globalThis ? globalThis : "undefined" != typeof self ? self : {};
        t.SENTRY_RELEASE = {
            id: "376c6bc4f77e94bc034c3d609fda1d902de4f65c"
        };
        var n = (new t.Error).stack;
        n && (t._sentryDebugIds = t._sentryDebugIds || {}, t._sentryDebugIds[n] = "23e4f9e8-6fb9-4da9-ae54-e13f2e28cdf4", t._sentryDebugIdIdentifier = "sentry-dbid-23e4f9e8-6fb9-4da9-ae54-e13f2e28cdf4")
    } catch (t) {}
}(),
function() {
    var t = {
            942: function(t) {
                function n(t) {
                    return t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t
                }!
                /*!
                	Copyright (c) 2018 Jed Watson.
                	Licensed under the MIT License (MIT), see
                	http://jedwatson.github.io/classnames
                */
                function() {
                    "use strict";
                    var r = {}.hasOwnProperty;

                    function o() {
                        for (var t = "", i = 0; i < arguments.length; i++) {
                            var l = arguments[i];
                            l && (t = a(t, function(t) {
                                if ("string" == typeof t || "number" == typeof t) return t;
                                if ((void 0 === t ? "undefined" : n(t)) !== "object") return "";
                                if (Array.isArray(t)) return o.apply(null, t);
                                if (t.toString !== Object.prototype.toString && !t.toString.toString().includes("[native code]")) return t.toString();
                                var i = "";
                                for (var l in t) r.call(t, l) && t[l] && (i = a(i, l));
                                return i
                            }(l)))
                        }
                        return t
                    }

                    function a(t, n) {
                        return n ? t ? t + " " + n : t + n : t
                    }
                    t.exports ? (o.default = o, t.exports = o) : "function" == typeof define && "object" === n(define.amd) && define.amd ? define("classnames", [], function() {
                        return o
                    }) : window.classNames = o
                }()
            },
            960: function(t, n, r) {
                "use strict";
                t.exports = {}
            },
            496: function(t, n, r) {
                "use strict";
                t.exports = {}
            }
        },
        n = {};

    function r(o) {
        var a = n[o];
        if (void 0 !== a) return a.exports;
        var i = n[o] = {
            exports: {}
        };
        return t[o](i, i.exports, r), i.exports
    }
    r.m = t, r.n = function(t) {
        var n = t && t.__esModule ? function() {
            return t.default
        } : function() {
            return t
        };
        return r.d(n, {
            a: n
        }), n
    }, r.d = function(t, n) {
        for (var o in n) r.o(n, o) && !r.o(t, o) && Object.defineProperty(t, o, {
            enumerable: !0,
            get: n[o]
        })
    }, r.k = function(t) {
        return "" + t + ".css"
    }, r.g = function() {
        if ("object" == typeof globalThis) return globalThis;
        try {
            return this || Function("return this")()
        } catch (t) {
            if ("object" == typeof window) return window
        }
    }(), r.o = function(t, n) {
        return Object.prototype.hasOwnProperty.call(t, n)
    }, r.r = function(t) {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(t, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(t, "__esModule", {
            value: !0
        })
    }, r.nc = void 0, r.rv = function() {
        return "1.5.7"
    }, r.g.importScripts && (o = r.g.location + "");
    var o, a = r.g.document;
    if (!o && a && (a.currentScript && "SCRIPT" === a.currentScript.tagName.toUpperCase() && (o = a.currentScript.src), !o)) {
        var i = a.getElementsByTagName("script");
        if (i.length)
            for (var l = i.length - 1; l > -1 && (!o || !/^http(s?):/.test(o));) o = i[l--].src
    }
    if (!o) throw Error("Automatic publicPath is not supported in this browser");
    r.p = o.replace(/^blob:/, "").replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/[^\/]+$/, "/"), r.ruid = "bundler=rspack@1.5.7",
        function() {
            "use strict";
            var t, n, o, a, i, l, c, u, s, f, d, p, v, m, h, y, g, b, w, x, S, O, j, E, C, P, A, N, k, R, D, L, T = window.ReactJSX,
                I = window.TanstackQuery,
                M = window.Roblox["core-scripts"].util.ready,
                _ = r.n(M),
                F = window.Roblox["core-scripts"].react,
                W = "data:image/webp;base64,UklGRrADAABXRUJQVlA4WAoAAAAQAAAAOwAAHAAAQUxQSOsAAAABgGNt2zHnHdaetLadLtmNsQDbdlLbtsqkHpSxbX/zj/U9G4iICSCX4uiiGdPdq8/vTNOFUWLyNGXwlFk4ZSf9ye6pKm4tXN+UK90IXLBwPxfgImDPArjr70Q5b4GcUTiUWjCFYiJKvAaxXMaTqMcC2yUKP8I5DM39x/nPmrAAjxqQ9LdIdy9Ir3dI9yYk4zTSZBHDYfnRpzgnkZIhnAExpd+j3KYSiepQqkVEpF3HWNWQY/gBwn4YOY/Y5m8znFz7tT7z9dTsR+5KMkdvBF6Em+EMMXkoTyvfPv/6Z+6aBc/N/1/n22WpcnIJAFZQOCCeAgAAsA4AnQEqPAAdAD6ROJhIJaMiITAb+ACwEglsAJ0yhHXno/mCVb+y7BwXfr7x7eqjbAeYD9bPVz9BvlAdYb6AHlp/uB8G3+A/4Pphu/TXQhi//S809EB69BEZldQNIV/eNVlDmUDW33lPn0iGBlkHEoP7xzvxv4W7IPVKwg+gAO9wOYzsI8BSlu/ljXZqxJsDV2tD+qayuJoxUFkUptaQf93n7fV4hUgJ+Uf/kpj4AqJAtsX5hJKtHHJlA0l7tylf+1SOJ1un0rrDm2Up4a6mCFRb/+W/vzfxAH3D9myHP/NfjX7ifoc/H7vgudmvtLqz+hb9lyHGakbAh+at5OqNY8Lo7/c/Rd1YFFWBSYBdcwPiQzjecF1Xv8R2dj9vKtM9tG+6SEBuPEV31LvRnBpXZ2XjpXFA9v38V7MMCzD2xxa06JeC+cVPiHvpVzfH8c63KCGOBFLltx9UIWiwO/c0fNzieqYIEsY2OIkx/wrhbV4GMtEp1U/7N3a7/Qq9r/h+LEI8sYOrGm1MU2P/BL4fYeBDZFMdJZ519a6U9S4K0wTMro82cnTukNfm7VyZ5hONbhEmAOc3OOYiFKgqzFC716CnyAatzIyDr0CosyN1Uh1epW+K2w7UmZ36T6i2+3vzCUz+pCLHl5zfc3yHC5sTR9yT368/W2zLQGXLxDmulSMj6HAO2VABHUwOJFjwIZT/+SB3RcruT4FqGiItnt6evy0vY4eSL9ALvRwkehZMB6Xj/2dzV507O+xEyOf7DL0zpSV3B/Oxz2jju+fUOFvOLM2J+VLuONA8wTfqy78vrhQfIVlpkdzQ+ZzJ3vL/FVZIgcqzYBBbKgUTEjq/+jSvW3vcOy7IA539GoeB3ydM4gyDy0h9FTsf9CO0fQAAAA==",
                U = [{
                    name: "about",
                    path: "/info/about-us",
                    labelTranslationKey: "Label.AboutUs"
                }, {
                    name: "jobs",
                    path: "/info/jobs",
                    labelTranslationKey: "Label.Jobs"
                }, {
                    name: "newsroom",
                    path: "/info/blog",
                    labelTranslationKey: "Label.Newsroom"
                }, {
                    name: "parents",
                    path: "/info/parents",
                    labelTranslationKey: "Label.Parents"
                }, {
                    name: "help",
                    path: "/info/help",
                    labelTranslationKey: "Label.Help"
                }, {
                    name: "terms",
                    path: "/info/terms",
                    labelTranslationKey: "Label.Terms"
                }, {
                    name: "accessibility",
                    path: "/info/accessibility",
                    labelTranslationKey: "Label.Accessibility"
                }, {
                    name: "privacy",
                    path: "/info/privacy",
                    labelTranslationKey: "Label.Privacy"
                }, {
                    name: "your-privacy-choices",
                    path: "/my/account#!/privacy",
                    labelTranslationKey: "Label.YourPrivacyChoices",
                    postfixIcon: W
                }, {
                    name: "sitemap",
                    path: "/sitemap",
                    labelTranslationKey: "Label.Sitemap"
                }],
                B = [{
                    name: "about",
                    path: "/info/about-us",
                    labelTranslationKey: "Label.AboutUs"
                }, {
                    name: "jobs",
                    path: "/info/jobs",
                    labelTranslationKey: "Label.Jobs"
                }, {
                    name: "newsroom",
                    path: "/info/blog",
                    labelTranslationKey: "Label.Newsroom"
                }, {
                    name: "parents",
                    path: "/info/parents",
                    labelTranslationKey: "Label.Parents"
                }, {
                    name: "giftcards",
                    path: "/giftcards",
                    labelTranslationKey: "Label.GiftCards",
                    cssClass: "giftcards"
                }, {
                    name: "help",
                    path: "/info/help",
                    labelTranslationKey: "Label.Help"
                }, {
                    name: "terms",
                    path: "/info/terms",
                    labelTranslationKey: "Label.Terms"
                }, {
                    name: "accessibility",
                    path: "/info/accessibility",
                    labelTranslationKey: "Label.Accessibility"
                }, {
                    name: "privacy",
                    path: "/info/privacy",
                    labelTranslationKey: "Label.Privacy"
                }, {
                    name: "your-privacy-choices",
                    path: "/my/account#!/privacy",
                    labelTranslationKey: "Label.YourPrivacyChoices",
                    postfixIcon: W
                }, {
                    name: "sitemap",
                    path: "/sitemap",
                    labelTranslationKey: "Label.Sitemap"
                }],
                z = window.PropTypes,
                V = r.n(z),
                H = JSON.parse('{"P":["CommonUI.Features","Common.AlertsAndOptions","Feature.Tracking","Feature.Privacy"]}'),
                K = window.HeaderScripts,
                X = window.Roblox,
                q = window.CoreUtilities;

            function G(t) {
                var n = t.translate,
                    r = new Date().getFullYear();
                return (0, T.jsx)("p", {
                    className: "text-footer footer-note",
                    children: n("Description.CopyRightMessageDynamicYear", {
                        copyrightYear: r
                    })
                })
            }
            G.propTypes = {
                translate: V().func.isRequired
            };
            var Y = window.React,
                Z = r.n(Y),
                $ = r(942),
                Q = r.n($),
                J = window.Roblox["core-scripts"].eventStream,
                ee = window.Roblox["core-scripts"].intl.intl,
                et = r.n(ee),
                en = window.ReactStyleGuide,
                er = "RBXViralAcquisition",
                eo = "Description.RBXViralAcquisition",
                ea = "RBXSource",
                ei = "Description.RBXSource",
                el = "Heading.GoogleAnalytics",
                ec = [{
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
                eu = window.Roblox["core-scripts"].endpoints,
                es = (0, eu.getAbsoluteUrl)("/info/privacy"),
                ef = (0, eu.getAbsoluteUrl)("/support"),
                ed = function(t) {
                    var n = t.cookieName,
                        r = t.description;
                    return (0, T.jsxs)("div", {
                        className: "cookie-item",
                        children: [(0, T.jsx)("p", {
                            className: "cookie-name font-body text",
                            children: n
                        }), (0, T.jsx)("p", {
                            className: "cookie-description font-footer",
                            children: r
                        })]
                    })
                },
                ep = function(t) {
                    var n = t.translate,
                        r = t.isNonEssentialCookieListVisible,
                        o = Q()({
                            hidden: !r
                        }),
                        a = ec.map(function(t) {
                            return (0, T.jsxs)("div", {
                                className: "google-analytics-company-info-sec",
                                children: [(0, T.jsx)("p", {
                                    className: "font-caption-header text-emphasis",
                                    children: n(t.label)
                                }), (0, T.jsx)("p", {
                                    className: "font-caption-body text",
                                    children: n(t.content)
                                })]
                            }, t.label)
                        }),
                        i = (0, T.jsx)("a", {
                            className: "text-link",
                            target: "_blank",
                            href: "https://support.google.com/analytics/answer/11397207",
                            rel: "noreferrer",
                            children: n(el)
                        }),
                        l = n("Description.GAReadMore"),
                        c = l.indexOf("{googleAnalyticsLink}"),
                        u = (0, T.jsxs)("p", {
                            className: "font-caption-body text",
                            children: [l.substring(0, c), i]
                        }),
                        s = (0, T.jsxs)("div", {
                            children: [(0, T.jsxs)("a", {
                                className: "font-header-2 text-emphasis",
                                href: "https://marketingplatform.google.com/about/analytics/",
                                children: [n(el), (0, T.jsx)("span", {
                                    className: "icon-nav-external-link-sm cookie-external-link-icon"
                                })]
                            }), (0, T.jsxs)("div", {
                                children: [(0, T.jsx)("span", {
                                    className: "google-analytics-info-subheader",
                                    children: n("Label.OwnedBy")
                                }), (0, T.jsx)("span", {
                                    className: "font-caption-header text-emphasis",
                                    children: "Google Inc."
                                })]
                            }), (0, T.jsx)("p", {
                                className: "text-emphasis google-analytics-company-info-sec",
                                children: n("Heading.GoogleAnalyticsPurpose")
                            }), (0, T.jsx)("span", {
                                className: "font-caption-body text",
                                children: n("Description.GoogleAnalyticsPurpose")
                            }), (0, T.jsx)("p", {
                                className: "text-emphasis google-analytics-company-info-sec",
                                children: n("Heading.CompanyCollection")
                            }), a, u]
                        }),
                        f = (0, T.jsxs)("div", {
                            className: "analytics-cookie-list",
                            children: [(0, T.jsx)(ed, {
                                cookieName: er,
                                description: n(eo)
                            }), (0, T.jsx)(ed, {
                                cookieName: ea,
                                description: n(ei)
                            })]
                        });
                    return (0, T.jsxs)("div", {
                        className: o,
                        children: [f, s]
                    })
                },
                ev = "RBXcb",
                em = function(t) {
                    var n, r = "".concat(t, "="),
                        o = null == (n = document.cookie.split("; ").find(function(t) {
                            return t.startsWith(r)
                        })) ? void 0 : n.split("=")[1];
                    return null == o ? null : {
                        name: t,
                        value: decodeURIComponent(o)
                    }
                },
                eh = function(t, n, r) {
                    var o, a = null == r.sameSite ? "" : ";samesite=".concat(r.sameSite),
                        i = null == r.domain ? "" : ";domain=".concat(r.domain),
                        l = ";path=".concat(null != (o = r.path) ? o : "/"),
                        c = null == r.expires ? "" : ";expires=".concat(r.expires.toUTCString()),
                        u = null == r.maxAge ? "" : ";max-age=".concat(r.maxAge);
                    document.cookie = "".concat(t, "=").concat(encodeURIComponent(n), ";secure").concat(a).concat(i).concat(l).concat(c).concat(u)
                },
                ey = function(t, n, r) {
                    eh(t, n, r)
                },
                eg = function(t, n) {
                    eh(t, "", {
                        domain: n.domain,
                        path: n.path,
                        expires: new Date(0)
                    })
                },
                eb = window.Roblox["core-scripts"].environmentUrls,
                ew = r.n(eb),
                ex = function(t, n) {
                    em(ev) && eg(ev, {
                        domain: ew().domain
                    });
                    var r = "",
                        o = [];
                    n.forEach(function(a, i) {
                        t.includes(a) ? r += "".concat(a, "=true&") : (r += "".concat(a, "=false&"), o.push(a)), i === n.length - 1 && (r = r.slice(0, -1))
                    }), o.forEach(function(t) {
                        eg(t, {
                            domain: ew().domain
                        })
                    }), ey(ev, r, {
                        maxAge: 15552e3,
                        domain: ew().domain
                    })
                },
                eS = function() {
                    var t = em(ev);
                    return !!t && !!t.value.split("&").find(function(t) {
                        return "true" === t.split("=")[1]
                    })
                };

            function eO(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function ej(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var i = [],
                            l = !0,
                            c = !1;
                        try {
                            for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            c = !0, o = t
                        } finally {
                            try {
                                l || null == a.return || a.return()
                            } finally {
                                if (c) throw o
                            }
                        }
                        return i
                    }
                }(t, n) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return eO(t, n);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eO(t, n)
                    }
                }(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var eE = ej((0, en.createModal)(), 2),
                eC = eE[0],
                eP = eE[1],
                eA = function(t) {
                    var n = t.nonEssentialCookieList,
                        r = t.essentialCookieList,
                        o = t.translate,
                        a = t.closeConsentTool,
                        i = eS(),
                        l = ej((0, Y.useState)(i), 2),
                        c = l[0],
                        u = l[1],
                        s = ej((0, Y.useState)(!1), 2),
                        f = s[0],
                        d = s[1],
                        p = ej((0, Y.useState)(!1), 2),
                        v = p[0],
                        m = p[1];
                    (0, Y.useEffect)(function() {
                        eP.open()
                    }, []);
                    var h = Q()({
                            hidden: !f
                        }),
                        y = Q()("cookie-consent-tool-collaps", {
                            on: v
                        }),
                        g = Q()("cookie-consent-tool-collaps font-header-2 text-emphasis ", {
                            on: f
                        }),
                        b = new(et())().getRobloxLocale(),
                        w = q.urlService.getUrlWithLocale("string" == typeof es ? es : "", b),
                        x = (0, T.jsx)("div", {
                            className: "cookie-consent-tool-info-link",
                            children: (0, T.jsxs)("a", {
                                className: "text-link",
                                target: "_blank",
                                href: w,
                                rel: "noreferrer",
                                children: [o("Description.PrivacyPolicy"), (0, T.jsx)("span", {
                                    className: "icon-nav-external-link-sm cookie-external-link-icon"
                                })]
                            })
                        }),
                        S = (0, T.jsx)("div", {
                            className: "cookie-consent-tool-info-link",
                            children: (0, T.jsxs)("a", {
                                className: "text-link",
                                target: "_blank",
                                href: "string" == typeof ef ? ef : "",
                                rel: "noreferrer",
                                children: [o("Action.RequestData"), (0, T.jsx)("span", {
                                    className: "icon-nav-external-link-sm cookie-external-link-icon"
                                })]
                            })
                        }),
                        O = (0, T.jsxs)("div", {
                            children: [(0, T.jsxs)("div", {
                                className: "static-section",
                                children: [(0, T.jsx)("div", {
                                    className: "font-header-2 text-emphasis google-analytics-company-info-sec",
                                    children: o("Heading.InformationCollection")
                                }), (0, T.jsx)("p", {
                                    className: "font-caption-body text",
                                    children: o("Description.InformationCollection")
                                })]
                            }), (0, T.jsxs)("div", {
                                className: "static-section",
                                children: [(0, T.jsx)("div", {
                                    className: "font-header-2 text-emphasis google-analytics-company-info-sec",
                                    children: o("Heading.InformationCollection2")
                                }), (0, T.jsx)("p", {
                                    className: "font-caption-body text",
                                    children: o("Description.InformationCollection2")
                                })]
                            }), (0, T.jsxs)("div", {
                                className: "static-section",
                                children: [(0, T.jsx)("div", {
                                    className: "font-header-2 text-emphasis google-analytics-company-info-sec",
                                    children: o("Heading.InformationPartnerCollection")
                                }), (0, T.jsx)("p", {
                                    className: "font-caption-body text",
                                    children: o("Description.InformationPartnerCollection")
                                })]
                            })]
                        }),
                        j = (0, T.jsxs)("div", {
                            children: [(0, T.jsx)("button", {
                                className: y,
                                type: "button",
                                onClick: function() {
                                    m(!v)
                                },
                                children: (0, T.jsx)("span", {
                                    className: "font-header-2 text-emphasis",
                                    children: o("Heading.AnalyticsCookies")
                                })
                            }), (0, T.jsx)(en.Toggle, {
                                className: "cookie-toggle",
                                isOn: c,
                                onToggle: function() {
                                    u(!c)
                                }
                            })]
                        }),
                        E = r.map(function(t) {
                            return (0, T.jsx)(ed, {
                                cookieName: t.cookieName,
                                description: o(t.description)
                            }, t.cookieName)
                        }),
                        C = (0, T.jsxs)("div", {
                            children: [S, x]
                        }),
                        P = (0, T.jsxs)("div", {
                            className: "essential-cookie-section",
                            children: [(0, T.jsx)("button", {
                                className: g,
                                type: "button",
                                onClick: function() {
                                    d(!f)
                                },
                                children: o("Heading.EssentialCookies")
                            }), (0, T.jsx)("div", {
                                className: h,
                                children: E
                            })]
                        }),
                        A = (0, T.jsxs)("div", {
                            className: "cookie-consent-tool-body",
                            children: [O, C, P, j, (0, T.jsx)(ep, {
                                isNonEssentialCookieListVisible: v,
                                translate: o
                            })]
                        });
                    return (0, T.jsx)(eC, {
                        title: o("Heading.CookieSettings"),
                        body: A,
                        actionButtonShow: !0,
                        actionButtonText: o("Action.SavePreferences"),
                        neutralButtonText: o("Action.Cancel"),
                        onAction: function() {
                            ex(c ? n : [], n), a(null)
                        },
                        onNeutral: function() {
                            a("banner")
                        },
                        id: "cookie-consent-tool-modal",
                        size: "lg"
                    })
                };

            function eN(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }
            var ek = function(t) {
                    var n, r = t.nonEssentialCookieList,
                        o = t.essentialCookieList,
                        a = t.translate,
                        i = t.onCloseConsentTool,
                        l = (n = (0, Y.useState)(!1), function(t) {
                            if (Array.isArray(t)) return t
                        }(n) || function(t, n) {
                            var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                            if (null != a) {
                                var i = [],
                                    l = !0,
                                    c = !1;
                                try {
                                    for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), i.length !== n); l = !0);
                                } catch (t) {
                                    c = !0, o = t
                                } finally {
                                    try {
                                        l || null == a.return || a.return()
                                    } finally {
                                        if (c) throw o
                                    }
                                }
                                return i
                            }
                        }(n, 2) || function(t, n) {
                            if (t) {
                                if ("string" == typeof t) return eN(t, 2);
                                var r = Object.prototype.toString.call(t).slice(8, -1);
                                if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                                if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eN(t, n)
                            }
                        }(n, 2) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()),
                        c = l[0],
                        u = l[1],
                        s = {
                            open: function() {
                                u(!0)
                            },
                            close: function() {
                                u(!1)
                            }
                        };
                    return [c ? (0, T.jsx)(eA, {
                        translate: a,
                        essentialCookieList: o,
                        nonEssentialCookieList: r,
                        closeConsentTool: function(t) {
                            s.close(), null == i || i(t)
                        }
                    }) : (0, T.jsx)("div", {}), s]
                },
                eR = window.Roblox["core-scripts"].guac;

            function eD(t, n, r, o, a, i, l) {
                try {
                    var c = t[i](l),
                        u = c.value
                } catch (t) {
                    r(t);
                    return
                }
                c.done ? n(u) : Promise.resolve(u).then(o, a)
            }
            var eL = function() {
                var t;
                return (t = function() {
                    var t;
                    return function(t, n) {
                        var r, o, a, i = {
                                label: 0,
                                sent: function() {
                                    if (1 & a[0]) throw a[1];
                                    return a[1]
                                },
                                trys: [],
                                ops: []
                            },
                            l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                        return l.next = c(0), l.throw = c(1), l.return = c(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                            return this
                        }), l;

                        function c(c) {
                            return function(u) {
                                var s = [c, u];
                                if (r) throw TypeError("Generator is already executing.");
                                for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                                    if (r = 1, o && (a = 2 & s[0] ? o.return : s[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, s[1])).done) return a;
                                    switch (o = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                        case 0:
                                        case 1:
                                            a = s;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: s[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, o = s[1], s = [0];
                                            continue;
                                        case 7:
                                            s = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                                i.label = s[1];
                                                break
                                            }
                                            if (6 === s[0] && i.label < a[1]) {
                                                i.label = a[1], a = s;
                                                break
                                            }
                                            if (a && i.label < a[2]) {
                                                i.label = a[2], i.ops.push(s);
                                                break
                                            }
                                            a[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    s = n.call(t, i)
                                } catch (t) {
                                    s = [6, t], o = 0
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
                                return [4, (0, eR.callBehaviour)("cookie-policy")];
                            case 1:
                                if (void 0 !== (t = n.sent())) return [2, t];
                                return [2, {
                                    ShouldDisplayCookieBannerV3: !1,
                                    NonEssentialCookieList: [],
                                    EssentialCookieList: []
                                }]
                        }
                    })
                }, function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(o, a) {
                        var i = t.apply(n, r);

                        function l(t) {
                            eD(i, o, a, l, c, "next", t)
                        }

                        function c(t) {
                            eD(i, o, a, l, c, "throw", t)
                        }
                        l(void 0)
                    })
                })()
            };

            function eT(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function eI(t, n, r, o, a, i, l) {
                try {
                    var c = t[i](l),
                        u = c.value
                } catch (t) {
                    r(t);
                    return
                }
                c.done ? n(u) : Promise.resolve(u).then(o, a)
            }

            function eM(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var i = [],
                            l = !0,
                            c = !1;
                        try {
                            for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            c = !0, o = t
                        } finally {
                            try {
                                l || null == a.return || a.return()
                            } finally {
                                if (c) throw o
                            }
                        }
                        return i
                    }
                }(t, n) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return eT(t, n);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eT(t, n)
                    }
                }(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function e_(t) {
                var n = t.translate,
                    r = eM((0, Y.useState)([]), 2),
                    o = r[0],
                    a = r[1],
                    i = eM((0, Y.useState)([]), 2),
                    l = i[0],
                    c = i[1];
                (0, Y.useEffect)(function() {
                    var t;
                    (t = function() {
                        var t;
                        return function(t, n) {
                            var r, o, a, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & a[0]) throw a[1];
                                        return a[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return l.next = c(0), l.throw = c(1), l.return = c(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                                return this
                            }), l;

                            function c(c) {
                                return function(u) {
                                    var s = [c, u];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                                        if (r = 1, o && (a = 2 & s[0] ? o.return : s[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, s[1])).done) return a;
                                        switch (o = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                            case 0:
                                            case 1:
                                                a = s;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: s[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, o = s[1], s = [0];
                                                continue;
                                            case 7:
                                                s = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                                    i.label = s[1];
                                                    break
                                                }
                                                if (6 === s[0] && i.label < a[1]) {
                                                    i.label = a[1], a = s;
                                                    break
                                                }
                                                if (a && i.label < a[2]) {
                                                    i.label = a[2], i.ops.push(s);
                                                    break
                                                }
                                                a[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        s = n.call(t, i)
                                    } catch (t) {
                                        s = [6, t], o = 0
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
                                    return [4, eL()];
                                case 1:
                                    return (t = n.sent()).ShouldDisplayCookieBannerV3 && t.NonEssentialCookieList && (a(t.NonEssentialCookieList), c(t.EssentialCookieList)), [2]
                            }
                        })
                    }, function() {
                        var n = this,
                            r = arguments;
                        return new Promise(function(o, a) {
                            var i = t.apply(n, r);

                            function l(t) {
                                eI(i, o, a, l, c, "next", t)
                            }

                            function c(t) {
                                eI(i, o, a, l, c, "throw", t)
                            }
                            l(void 0)
                        })
                    })()
                }, []);
                var u = eM(ek({
                        nonEssentialCookieList: o,
                        essentialCookieList: l,
                        translate: n
                    }), 2),
                    s = u[0],
                    f = u[1];
                return l.length > 0 ? (0, T.jsxs)("div", {
                    children: [(0, T.jsx)("button", {
                        onClick: f.open,
                        className: "btn text-footer-nav footer-button-link",
                        type: "button",
                        "data-testid": "cookie-consent-link",
                        children: n("Heading.CookieSettings")
                    }), s]
                }) : null
            }
            e_.propTypes = {
                translate: V().func.isRequired
            };
            var eF = window.Roblox["core-scripts"].util.url,
                eW = window.Roblox["core-scripts"].meta.user,
                eU = function() {
                    return (eU = Object.assign || function(t) {
                        for (var n, r = 1, o = arguments.length; r < o; r++)
                            for (var a in n = arguments[r]) Object.prototype.hasOwnProperty.call(n, a) && (t[a] = n[a]);
                        return t
                    }).apply(this, arguments)
                };

            function eB(t, n) {
                var r = {};
                for (var o in t) Object.prototype.hasOwnProperty.call(t, o) && 0 > n.indexOf(o) && (r[o] = t[o]);
                if (null != t && "function" == typeof Object.getOwnPropertySymbols) {
                    var a = 0;
                    for (o = Object.getOwnPropertySymbols(t); a < o.length; a++) 0 > n.indexOf(o[a]) && Object.prototype.propertyIsEnumerable.call(t, o[a]) && (r[o[a]] = t[o[a]])
                }
                return r
            }
            var ez = function() {
                for (var t, n, r = 0, o = "", a = arguments.length; r < a; r++)(t = arguments[r]) && (n = function t(n) {
                    var r, o, a = "";
                    if ("string" == typeof n || "number" == typeof n) a += n;
                    else if ("object" == (void 0 === n ? "undefined" : n && "undefined" != typeof Symbol && n.constructor === Symbol ? "symbol" : typeof n))
                        if (Array.isArray(n)) {
                            var i = n.length;
                            for (r = 0; r < i; r++) n[r] && (o = t(n[r])) && (a && (a += " "), a += o)
                        } else
                            for (o in n) n[o] && (a && (a += " "), a += o);
                    return a
                }(t)) && (o && (o += " "), o += n);
                return o
            };

            function eV(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }
            var eH = (null == (tr = globalThis) ? void 0 : tr.document) ? Y.useLayoutEffect : function() {},
                eK = Y[" useId ".trim().toString()] || function() {},
                eX = 0;

            function eq(t) {
                var n, r = (n = Y.useState(eK()), function(t) {
                        if (Array.isArray(t)) return t
                    }(n) || function(t, n) {
                        var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                        if (null != a) {
                            var i = [],
                                l = !0,
                                c = !1;
                            try {
                                for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), i.length !== n); l = !0);
                            } catch (t) {
                                c = !0, o = t
                            } finally {
                                try {
                                    l || null == a.return || a.return()
                                } finally {
                                    if (c) throw o
                                }
                            }
                            return i
                        }
                    }(n, 2) || function(t, n) {
                        if (t) {
                            if ("string" == typeof t) return eV(t, 2);
                            var r = Object.prototype.toString.call(t).slice(8, -1);
                            if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eV(t, n)
                        }
                    }(n, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    o = r[0],
                    a = r[1];
                return eH(function() {
                    t || a(function(t) {
                        return null != t ? t : String(eX++)
                    })
                }, [t]), t || (o ? "radix-".concat(o) : "")
            }
            var eG = window.ReactDOM,
                eY = r.n(eG);

            function eZ(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function e$(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function eQ(t, n) {
                return null != n && "undefined" != typeof Symbol && n[Symbol.hasInstance] ? !!n[Symbol.hasInstance](t) : t instanceof n
            }

            function eJ(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        e$(t, n, r[n])
                    })
                }
                return t
            }

            function e0(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function e1(t, n) {
                if (null == t) return {};
                var r, o, a = function(t, n) {
                    if (null == t) return {};
                    var r, o, a = {},
                        i = Object.keys(t);
                    for (o = 0; o < i.length; o++) r = i[o], n.indexOf(r) >= 0 || (a[r] = t[r]);
                    return a
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(t);
                    for (o = 0; o < i.length; o++) r = i[o], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (a[r] = t[r])
                }
                return a
            }

            function e2(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var i = [],
                            l = !0,
                            c = !1;
                        try {
                            for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            c = !0, o = t
                        } finally {
                            try {
                                l || null == a.return || a.return()
                            } finally {
                                if (c) throw o
                            }
                        }
                        return i
                    }
                }(t, n) || e5(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function e3(t) {
                return function(t) {
                    if (Array.isArray(t)) return eZ(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || e5(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function e5(t, n) {
                if (t) {
                    if ("string" == typeof t) return eZ(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eZ(t, n)
                }
            }

            function e4(t, n) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    o = r.checkForDefaultPrevented,
                    a = void 0 === o || o;
                return function(r) {
                    if (null == t || t(r), !1 === a || !r.defaultPrevented) return null == n ? void 0 : n(r)
                }
            }

            function e6(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }

            function e8() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return function(t) {
                    var r = !1,
                        o = n.map(function(n) {
                            var o = e6(n, t);
                            return r || "function" != typeof o || (r = !0), o
                        });
                    if (r) return function() {
                        for (var t = 0; t < o.length; t++) {
                            var r = o[t];
                            "function" == typeof r ? r() : e6(n[t], null)
                        }
                    }
                }
            }

            function e7() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return Y.useCallback(e8.apply(void 0, e3(n)), n)
            }
            var e9 = Symbol("radix.slottable");

            function te(t) {
                return Y.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === e9
            }
            var tt = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                var r, o, a, i, l, c = (o = r = "Primitive.".concat(n), (a = Y.forwardRef(function(t, n) {
                        var r = t.children,
                            o = e1(t, ["children"]);
                        if (Y.isValidElement(r)) {
                            var a, i, l, c = (l = null == (a = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (i = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                u = function(t, n) {
                                    var r = eJ({}, n);
                                    for (var o in n) ! function(o) {
                                        var a = t[o],
                                            i = n[o];
                                        /^on[A-Z]/.test(o) ? a && i ? r[o] = function() {
                                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                            i.apply(void 0, e3(n)), a.apply(void 0, e3(n))
                                        } : a && (r[o] = a) : "style" === o ? r[o] = eJ({}, a, i) : "className" === o && (r[o] = [a, i].filter(Boolean).join(" "))
                                    }(o);
                                    return eJ({}, t, r)
                                }(o, r.props);
                            return r.type !== Y.Fragment && (u.ref = n ? e8(n, c) : c), Y.cloneElement(r, u)
                        }
                        return Y.Children.count(r) > 1 ? Y.Children.only(null) : null
                    })).displayName = "".concat(o, ".SlotClone"), i = a, (l = Y.forwardRef(function(t, n) {
                        var r = t.children,
                            o = e1(t, ["children"]),
                            a = Y.Children.toArray(r),
                            l = a.find(te);
                        if (l) {
                            var c = l.props.children,
                                u = a.map(function(t) {
                                    return t === l ? Y.Children.count(c) > 1 ? Y.Children.only(null) : Y.isValidElement(c) ? c.props.children : null : t
                                });
                            return (0, T.jsx)(i, e0(eJ({}, o), {
                                ref: n,
                                children: Y.isValidElement(c) ? Y.cloneElement(c, void 0, u) : null
                            }))
                        }
                        return (0, T.jsx)(i, e0(eJ({}, o), {
                            ref: n,
                            children: r
                        }))
                    })).displayName = "".concat(r, ".Slot"), l),
                    u = Y.forwardRef(function(t, r) {
                        var o = t.asChild,
                            a = e1(t, ["asChild"]),
                            i = o ? c : n;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, T.jsx)(i, e0(eJ({}, a), {
                            ref: r
                        }))
                    });
                return u.displayName = "Primitive.".concat(n), e0(eJ({}, t), e$({}, n, u))
            }, {});

            function tn(t) {
                var n = Y.useRef(t);
                return Y.useEffect(function() {
                    n.current = t
                }), Y.useMemo(function() {
                    return function() {
                        for (var t, r = arguments.length, o = Array(r), a = 0; a < r; a++) o[a] = arguments[a];
                        return null == (t = n.current) ? void 0 : t.call.apply(t, [n].concat(e3(o)))
                    }
                }, [])
            }
            var tr, to, ta, ti = "dismissableLayer.update",
                tl = Y.createContext({
                    layers: new Set,
                    layersWithOutsidePointerEventsDisabled: new Set,
                    branches: new Set
                }),
                tc = Y.forwardRef(function(t, n) {
                    var r, o, a = t.disableOutsidePointerEvents,
                        i = void 0 !== a && a,
                        l = t.onEscapeKeyDown,
                        c = t.onPointerDownOutside,
                        u = t.onFocusOutside,
                        s = t.onInteractOutside,
                        f = t.onDismiss,
                        d = e1(t, ["disableOutsidePointerEvents", "onEscapeKeyDown", "onPointerDownOutside", "onFocusOutside", "onInteractOutside", "onDismiss"]),
                        p = Y.useContext(tl),
                        v = e2(Y.useState(null), 2),
                        m = v[0],
                        h = v[1],
                        y = null != (o = null == m ? void 0 : m.ownerDocument) ? o : null == (r = globalThis) ? void 0 : r.document,
                        g = e2(Y.useState({}), 2)[1],
                        b = e7(n, function(t) {
                            return h(t)
                        }),
                        w = Array.from(p.layers),
                        x = e2(e3(p.layersWithOutsidePointerEventsDisabled).slice(-1), 1)[0],
                        S = w.indexOf(x),
                        O = m ? w.indexOf(m) : -1,
                        j = p.layersWithOutsidePointerEventsDisabled.size > 0,
                        E = O >= S,
                        C = function(t) {
                            var n, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                                o = tn(t),
                                a = Y.useRef(!1),
                                i = Y.useRef(function() {});
                            return Y.useEffect(function() {
                                var t = function(t) {
                                        if (t.target && !a.current) {
                                            var n = function() {
                                                    ts("dismissableLayer.pointerDownOutside", o, l, {
                                                        discrete: !0
                                                    })
                                                },
                                                l = {
                                                    originalEvent: t
                                                };
                                            "touch" === t.pointerType ? (r.removeEventListener("click", i.current), i.current = n, r.addEventListener("click", i.current, {
                                                once: !0
                                            })) : n()
                                        } else r.removeEventListener("click", i.current);
                                        a.current = !1
                                    },
                                    n = window.setTimeout(function() {
                                        r.addEventListener("pointerdown", t)
                                    }, 0);
                                return function() {
                                    window.clearTimeout(n), r.removeEventListener("pointerdown", t), r.removeEventListener("click", i.current)
                                }
                            }, [r, o]), {
                                onPointerDownCapture: function() {
                                    return a.current = !0
                                }
                            }
                        }(function(t) {
                            var n = t.target,
                                r = e3(p.branches).some(function(t) {
                                    return t.contains(n)
                                });
                            E && !r && (null == c || c(t), null == s || s(t), t.defaultPrevented || null == f || f())
                        }, y),
                        P = function(t) {
                            var n, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                                o = tn(t),
                                a = Y.useRef(!1);
                            return Y.useEffect(function() {
                                var t = function(t) {
                                    t.target && !a.current && ts("dismissableLayer.focusOutside", o, {
                                        originalEvent: t
                                    }, {
                                        discrete: !1
                                    })
                                };
                                return r.addEventListener("focusin", t),
                                    function() {
                                        return r.removeEventListener("focusin", t)
                                    }
                            }, [r, o]), {
                                onFocusCapture: function() {
                                    return a.current = !0
                                },
                                onBlurCapture: function() {
                                    return a.current = !1
                                }
                            }
                        }(function(t) {
                            var n = t.target;
                            e3(p.branches).some(function(t) {
                                return t.contains(n)
                            }) || (null == u || u(t), null == s || s(t), t.defaultPrevented || null == f || f())
                        }, y);
                    return function(t) {
                        var n, r, o = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                            a = (r = Y.useRef(t), Y.useEffect(function() {
                                r.current = t
                            }), Y.useMemo(function() {
                                return function() {
                                    for (var t, n = arguments.length, o = Array(n), a = 0; a < n; a++) o[a] = arguments[a];
                                    return null == (t = r.current) ? void 0 : t.call.apply(t, [r].concat(e3(o)))
                                }
                            }, []));
                        Y.useEffect(function() {
                            var t = function(t) {
                                "Escape" === t.key && a(t)
                            };
                            return o.addEventListener("keydown", t, {
                                    capture: !0
                                }),
                                function() {
                                    return o.removeEventListener("keydown", t, {
                                        capture: !0
                                    })
                                }
                        }, [a, o])
                    }(function(t) {
                        O === p.layers.size - 1 && (null == l || l(t), !t.defaultPrevented && f && (t.preventDefault(), f()))
                    }, y), Y.useEffect(function() {
                        if (m) return i && (0 === p.layersWithOutsidePointerEventsDisabled.size && (ta = y.body.style.pointerEvents, y.body.style.pointerEvents = "none"), p.layersWithOutsidePointerEventsDisabled.add(m)), p.layers.add(m), tu(),
                            function() {
                                i && 1 === p.layersWithOutsidePointerEventsDisabled.size && (y.body.style.pointerEvents = ta)
                            }
                    }, [m, y, i, p]), Y.useEffect(function() {
                        return function() {
                            m && (p.layers.delete(m), p.layersWithOutsidePointerEventsDisabled.delete(m), tu())
                        }
                    }, [m, p]), Y.useEffect(function() {
                        var t = function() {
                            return g({})
                        };
                        return document.addEventListener(ti, t),
                            function() {
                                return document.removeEventListener(ti, t)
                            }
                    }, []), (0, T.jsx)(tt.div, e0(eJ({}, d), {
                        ref: b,
                        style: eJ({
                            pointerEvents: j ? E ? "auto" : "none" : void 0
                        }, t.style),
                        onFocusCapture: e4(t.onFocusCapture, P.onFocusCapture),
                        onBlurCapture: e4(t.onBlurCapture, P.onBlurCapture),
                        onPointerDownCapture: e4(t.onPointerDownCapture, C.onPointerDownCapture)
                    }))
                });

            function tu() {
                var t = new CustomEvent(ti);
                document.dispatchEvent(t)
            }

            function ts(t, n, r, o) {
                var a = o.discrete,
                    i = r.originalEvent.target,
                    l = new CustomEvent(t, {
                        bubbles: !1,
                        cancelable: !0,
                        detail: r
                    });
                n && i.addEventListener(t, n, {
                    once: !0
                }), a ? i && eG.flushSync(function() {
                    return i.dispatchEvent(l)
                }) : i.dispatchEvent(l)
            }
            tc.displayName = "DismissableLayer", Y.forwardRef(function(t, n) {
                var r = Y.useContext(tl),
                    o = Y.useRef(null),
                    a = e7(n, o);
                return Y.useEffect(function() {
                    var t = o.current;
                    if (t) return r.branches.add(t),
                        function() {
                            r.branches.delete(t)
                        }
                }, [r.branches]), (0, T.jsx)(tt.div, e0(eJ({}, t), {
                    ref: a
                }))
            }).displayName = "DismissableLayerBranch";
            var tf = 0;

            function td() {
                Y.useEffect(function() {
                    var t, n, r = document.querySelectorAll("[data-radix-focus-guard]");
                    return document.body.insertAdjacentElement("afterbegin", null != (t = r[0]) ? t : tp()), document.body.insertAdjacentElement("beforeend", null != (n = r[1]) ? n : tp()), tf++,
                        function() {
                            1 === tf && document.querySelectorAll("[data-radix-focus-guard]").forEach(function(t) {
                                return t.remove()
                            }), tf--
                        }
                }, [])
            }

            function tp() {
                var t = document.createElement("span");
                return t.setAttribute("data-radix-focus-guard", ""), t.tabIndex = 0, t.style.outline = "none", t.style.opacity = "0", t.style.position = "fixed", t.style.pointerEvents = "none", t
            }

            function tv(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }

            function tm() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return function(t) {
                    var r = !1,
                        o = n.map(function(n) {
                            var o = tv(n, t);
                            return r || "function" != typeof o || (r = !0), o
                        });
                    if (r) return function() {
                        for (var t = 0; t < o.length; t++) {
                            var r = o[t];
                            "function" == typeof r ? r() : tv(n[t], null)
                        }
                    }
                }
            }
            var th = Symbol("radix.slottable");

            function ty(t) {
                return Y.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === th
            }
            var tg = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                var r, o, a, i, l, c = (o = r = "Primitive.".concat(n), (a = Y.forwardRef(function(t, n) {
                        var r = t.children,
                            o = e1(t, ["children"]);
                        if (Y.isValidElement(r)) {
                            var a, i, l, c = (l = null == (a = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (i = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                u = function(t, n) {
                                    var r = eJ({}, n);
                                    for (var o in n) ! function(o) {
                                        var a = t[o],
                                            i = n[o];
                                        /^on[A-Z]/.test(o) ? a && i ? r[o] = function() {
                                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                            i.apply(void 0, e3(n)), a.apply(void 0, e3(n))
                                        } : a && (r[o] = a) : "style" === o ? r[o] = eJ({}, a, i) : "className" === o && (r[o] = [a, i].filter(Boolean).join(" "))
                                    }(o);
                                    return eJ({}, t, r)
                                }(o, r.props);
                            return r.type !== Y.Fragment && (u.ref = n ? tm(n, c) : c), Y.cloneElement(r, u)
                        }
                        return Y.Children.count(r) > 1 ? Y.Children.only(null) : null
                    })).displayName = "".concat(o, ".SlotClone"), i = a, (l = Y.forwardRef(function(t, n) {
                        var r = t.children,
                            o = e1(t, ["children"]),
                            a = Y.Children.toArray(r),
                            l = a.find(ty);
                        if (l) {
                            var c = l.props.children,
                                u = a.map(function(t) {
                                    return t === l ? Y.Children.count(c) > 1 ? Y.Children.only(null) : Y.isValidElement(c) ? c.props.children : null : t
                                });
                            return (0, T.jsx)(i, e0(eJ({}, o), {
                                ref: n,
                                children: Y.isValidElement(c) ? Y.cloneElement(c, void 0, u) : null
                            }))
                        }
                        return (0, T.jsx)(i, e0(eJ({}, o), {
                            ref: n,
                            children: r
                        }))
                    })).displayName = "".concat(r, ".Slot"), l),
                    u = Y.forwardRef(function(t, r) {
                        var o = t.asChild,
                            a = e1(t, ["asChild"]),
                            i = o ? c : n;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, T.jsx)(i, e0(eJ({}, a), {
                            ref: r
                        }))
                    });
                return u.displayName = "Primitive.".concat(n), e0(eJ({}, t), e$({}, n, u))
            }, {});

            function tb(t) {
                var n = Y.useRef(t);
                return Y.useEffect(function() {
                    n.current = t
                }), Y.useMemo(function() {
                    return function() {
                        for (var t, r = arguments.length, o = Array(r), a = 0; a < r; a++) o[a] = arguments[a];
                        return null == (t = n.current) ? void 0 : t.call.apply(t, [n].concat(e3(o)))
                    }
                }, [])
            }
            var tw = "focusScope.autoFocusOnMount",
                tx = "focusScope.autoFocusOnUnmount",
                tS = {
                    bubbles: !1,
                    cancelable: !0
                },
                tO = Y.forwardRef(function(t, n) {
                    var r = t.loop,
                        o = void 0 !== r && r,
                        a = t.trapped,
                        i = void 0 !== a && a,
                        l = t.onMountAutoFocus,
                        c = t.onUnmountAutoFocus,
                        u = e1(t, ["loop", "trapped", "onMountAutoFocus", "onUnmountAutoFocus"]),
                        s = e2(Y.useState(null), 2),
                        f = s[0],
                        d = s[1],
                        p = tb(l),
                        v = tb(c),
                        m = Y.useRef(null),
                        h = function() {
                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                            return Y.useCallback(tm.apply(void 0, e3(n)), n)
                        }(n, function(t) {
                            return d(t)
                        }),
                        y = Y.useRef({
                            paused: !1,
                            pause: function() {
                                this.paused = !0
                            },
                            resume: function() {
                                this.paused = !1
                            }
                        }).current;
                    Y.useEffect(function() {
                        if (i) {
                            var t = function(t) {
                                    if (!y.paused && f) {
                                        var n = t.target;
                                        f.contains(n) ? m.current = n : tC(m.current, {
                                            select: !0
                                        })
                                    }
                                },
                                n = function(t) {
                                    if (!y.paused && f) {
                                        var n = t.relatedTarget;
                                        null !== n && (f.contains(n) || tC(m.current, {
                                            select: !0
                                        }))
                                    }
                                };
                            document.addEventListener("focusin", t), document.addEventListener("focusout", n);
                            var r = new MutationObserver(function(t) {
                                var n = !0,
                                    r = !1,
                                    o = void 0;
                                if (document.activeElement === document.body) try {
                                    for (var a, i = t[Symbol.iterator](); !(n = (a = i.next()).done); n = !0) a.value.removedNodes.length > 0 && tC(f)
                                } catch (t) {
                                    r = !0, o = t
                                } finally {
                                    try {
                                        n || null == i.return || i.return()
                                    } finally {
                                        if (r) throw o
                                    }
                                }
                            });
                            return f && r.observe(f, {
                                    childList: !0,
                                    subtree: !0
                                }),
                                function() {
                                    document.removeEventListener("focusin", t), document.removeEventListener("focusout", n), r.disconnect()
                                }
                        }
                    }, [i, f, y.paused]), Y.useEffect(function() {
                        if (f) {
                            tP.add(y);
                            var t = document.activeElement;
                            if (!f.contains(t)) {
                                var n = new CustomEvent(tw, tS);
                                f.addEventListener(tw, p), f.dispatchEvent(n), n.defaultPrevented || (! function(t) {
                                    var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                                        r = n.select,
                                        o = void 0 !== r && r,
                                        a = document.activeElement,
                                        i = !0,
                                        l = !1,
                                        c = void 0;
                                    try {
                                        for (var u, s = t[Symbol.iterator](); !(i = (u = s.next()).done); i = !0) {
                                            var f = u.value;
                                            if (tC(f, {
                                                    select: o
                                                }), document.activeElement !== a) return
                                        }
                                    } catch (t) {
                                        l = !0, c = t
                                    } finally {
                                        try {
                                            i || null == s.return || s.return()
                                        } finally {
                                            if (l) throw c
                                        }
                                    }
                                }(tj(f).filter(function(t) {
                                    return "A" !== t.tagName
                                }), {
                                    select: !0
                                }), document.activeElement === t && tC(f))
                            }
                            return function() {
                                f.removeEventListener(tw, p), setTimeout(function() {
                                    var n = new CustomEvent(tx, tS);
                                    f.addEventListener(tx, v), f.dispatchEvent(n), n.defaultPrevented || tC(null != t ? t : document.body, {
                                        select: !0
                                    }), f.removeEventListener(tx, v), tP.remove(y)
                                }, 0)
                            }
                        }
                    }, [f, p, v, y]);
                    var g = Y.useCallback(function(t) {
                        if ((o || i) && !y.paused) {
                            var n = "Tab" === t.key && !t.altKey && !t.ctrlKey && !t.metaKey,
                                r = document.activeElement;
                            if (n && r) {
                                var a, l = t.currentTarget,
                                    c = e2([tE(a = tj(l), l), tE(a.reverse(), l)], 2),
                                    u = c[0],
                                    s = c[1];
                                u && s ? t.shiftKey || r !== s ? t.shiftKey && r === u && (t.preventDefault(), o && tC(s, {
                                    select: !0
                                })) : (t.preventDefault(), o && tC(u, {
                                    select: !0
                                })) : r === l && t.preventDefault()
                            }
                        }
                    }, [o, i, y.paused]);
                    return (0, T.jsx)(tg.div, e0(eJ({
                        tabIndex: -1
                    }, u), {
                        ref: h,
                        onKeyDown: g
                    }))
                });

            function tj(t) {
                for (var n = [], r = document.createTreeWalker(t, NodeFilter.SHOW_ELEMENT, {
                        acceptNode: function(t) {
                            var n = "INPUT" === t.tagName && "hidden" === t.type;
                            return t.disabled || t.hidden || n ? NodeFilter.FILTER_SKIP : t.tabIndex >= 0 ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_SKIP
                        }
                    }); r.nextNode();) n.push(r.currentNode);
                return n
            }

            function tE(t, n) {
                var r = !0,
                    o = !1,
                    a = void 0;
                try {
                    for (var i, l = t[Symbol.iterator](); !(r = (i = l.next()).done); r = !0) {
                        var c = i.value;
                        if (! function(t, n) {
                                var r = n.upTo;
                                if ("hidden" === getComputedStyle(t).visibility) return !0;
                                for (; t && (void 0 === r || t !== r);) {
                                    if ("none" === getComputedStyle(t).display) return !0;
                                    t = t.parentElement
                                }
                                return !1
                            }(c, {
                                upTo: n
                            })) return c
                    }
                } catch (t) {
                    o = !0, a = t
                } finally {
                    try {
                        r || null == l.return || l.return()
                    } finally {
                        if (o) throw a
                    }
                }
            }

            function tC(t) {
                var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    r = n.select;
                if (t && t.focus) {
                    var o, a = document.activeElement;
                    t.focus({
                        preventScroll: !0
                    }), t !== a && eQ(o = t, HTMLInputElement) && "select" in o && void 0 !== r && r && t.select()
                }
            }
            tO.displayName = "FocusScope";
            var tP = (t9 = [], {
                add: function(t) {
                    var n = t9[0];
                    t !== n && (null == n || n.pause()), (t9 = tA(t9, t)).unshift(t)
                },
                remove: function(t) {
                    var n;
                    null == (n = (t9 = tA(t9, t))[0]) || n.resume()
                }
            });

            function tA(t, n) {
                var r = e3(t),
                    o = r.indexOf(n);
                return -1 !== o && r.splice(o, 1), r
            }

            function tN(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }
            var tk = Symbol("radix.slottable");

            function tR(t) {
                return Y.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === tk
            }
            var tD = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                    var r, o, a, i, l, c = (o = r = "Primitive.".concat(n), (a = Y.forwardRef(function(t, n) {
                            var r = t.children,
                                o = e1(t, ["children"]);
                            if (Y.isValidElement(r)) {
                                var a, i, l, c = (l = null == (a = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (i = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                    u = function(t, n) {
                                        var r = eJ({}, n);
                                        for (var o in n) ! function(o) {
                                            var a = t[o],
                                                i = n[o];
                                            /^on[A-Z]/.test(o) ? a && i ? r[o] = function() {
                                                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                                i.apply(void 0, e3(n)), a.apply(void 0, e3(n))
                                            } : a && (r[o] = a) : "style" === o ? r[o] = eJ({}, a, i) : "className" === o && (r[o] = [a, i].filter(Boolean).join(" "))
                                        }(o);
                                        return eJ({}, t, r)
                                    }(o, r.props);
                                return r.type !== Y.Fragment && (u.ref = n ? function() {
                                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                    return function(t) {
                                        var r = !1,
                                            o = n.map(function(n) {
                                                var o = tN(n, t);
                                                return r || "function" != typeof o || (r = !0), o
                                            });
                                        if (r) return function() {
                                            for (var t = 0; t < o.length; t++) {
                                                var r = o[t];
                                                "function" == typeof r ? r() : tN(n[t], null)
                                            }
                                        }
                                    }
                                }(n, c) : c), Y.cloneElement(r, u)
                            }
                            return Y.Children.count(r) > 1 ? Y.Children.only(null) : null
                        })).displayName = "".concat(o, ".SlotClone"), i = a, (l = Y.forwardRef(function(t, n) {
                            var r = t.children,
                                o = e1(t, ["children"]),
                                a = Y.Children.toArray(r),
                                l = a.find(tR);
                            if (l) {
                                var c = l.props.children,
                                    u = a.map(function(t) {
                                        return t === l ? Y.Children.count(c) > 1 ? Y.Children.only(null) : Y.isValidElement(c) ? c.props.children : null : t
                                    });
                                return (0, T.jsx)(i, e0(eJ({}, o), {
                                    ref: n,
                                    children: Y.isValidElement(c) ? Y.cloneElement(c, void 0, u) : null
                                }))
                            }
                            return (0, T.jsx)(i, e0(eJ({}, o), {
                                ref: n,
                                children: r
                            }))
                        })).displayName = "".concat(r, ".Slot"), l),
                        u = Y.forwardRef(function(t, r) {
                            var o = t.asChild,
                                a = e1(t, ["asChild"]),
                                i = o ? c : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, T.jsx)(i, e0(eJ({}, a), {
                                ref: r
                            }))
                        });
                    return u.displayName = "Primitive.".concat(n), e0(eJ({}, t), e$({}, n, u))
                }, {}),
                tL = (null == (to = globalThis) ? void 0 : to.document) ? Y.useLayoutEffect : function() {},
                tT = Y.forwardRef(function(t, n) {
                    var r, o, a = t.container,
                        i = e1(t, ["container"]),
                        l = e2(Y.useState(!1), 2),
                        c = l[0],
                        u = l[1];
                    tL(function() {
                        return u(!0)
                    }, []);
                    var s = a || c && (null == (o = globalThis) || null == (r = o.document) ? void 0 : r.body);
                    return s ? eY().createPortal((0, T.jsx)(tD.div, e0(eJ({}, i), {
                        ref: n
                    })), s) : null
                });
            tT.displayName = "Portal";
            var tI = new WeakMap,
                tM = new WeakMap,
                t_ = {},
                tF = 0,
                tW = function(t) {
                    return t && (t.host || tW(t.parentNode))
                },
                tU = function(t, n, r, o) {
                    var a = (Array.isArray(t) ? t : [t]).map(function(t) {
                        if (n.contains(t)) return t;
                        var r = tW(t);
                        return r && n.contains(r) ? r : (console.error("aria-hidden", t, "in not contained inside", n, ". Doing nothing"), null)
                    }).filter(function(t) {
                        return !!t
                    });
                    t_[r] || (t_[r] = new WeakMap);
                    var i = t_[r],
                        l = [],
                        c = new Set,
                        u = new Set(a),
                        s = function(t) {
                            t && !c.has(t) && (c.add(t), s(t.parentNode))
                        };
                    a.forEach(s);
                    var f = function(t) {
                        t && !u.has(t) && Array.prototype.forEach.call(t.children, function(t) {
                            if (c.has(t)) f(t);
                            else try {
                                var n = t.getAttribute(o),
                                    a = null !== n && "false" !== n,
                                    u = (tI.get(t) || 0) + 1,
                                    s = (i.get(t) || 0) + 1;
                                tI.set(t, u), i.set(t, s), l.push(t), 1 === u && a && tM.set(t, !0), 1 === s && t.setAttribute(r, "true"), a || t.setAttribute(o, "true")
                            } catch (n) {
                                console.error("aria-hidden: cannot operate on ", t, n)
                            }
                        })
                    };
                    return f(n), c.clear(), tF++,
                        function() {
                            l.forEach(function(t) {
                                var n = tI.get(t) - 1,
                                    a = i.get(t) - 1;
                                tI.set(t, n), i.set(t, a), n || (tM.has(t) || t.removeAttribute(o), tM.delete(t)), a || t.removeAttribute(r)
                            }), --tF || (tI = new WeakMap, tI = new WeakMap, tM = new WeakMap, t_ = {})
                        }
                },
                tB = function(t, n, r) {
                    void 0 === r && (r = "data-aria-hidden");
                    var o = Array.from(Array.isArray(t) ? t : [t]),
                        a = n || ("undefined" == typeof document ? null : (Array.isArray(t) ? t[0] : t).ownerDocument.body);
                    return a ? (o.push.apply(o, Array.from(a.querySelectorAll("[aria-live]"))), tU(o, a, r, "aria-hidden")) : function() {
                        return null
                    }
                },
                tz = "right-scroll-bar-position",
                tV = "width-before-scroll-bar";

            function tH(t, n) {
                return "function" == typeof t ? t(n) : t && (t.current = n), t
            }
            var tK = "undefined" != typeof window ? Y.useLayoutEffect : Y.useEffect,
                tX = new WeakMap,
                tq = function(t) {
                    var n = t.sideCar,
                        r = eB(t, ["sideCar"]);
                    if (!n) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                    var o = n.read();
                    if (!o) throw Error("Sidecar medium not found");
                    return Y.createElement(o, eU({}, r))
                };
            tq.isSideCarExport = !0;
            var tG = (void 0 === ne && (ne = {}), (void 0 === nt && (nt = function(t) {
                    return t
                }), nn = [], nr = !1, no = {
                    read: function() {
                        if (nr) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                        return nn.length ? nn[nn.length - 1] : null
                    },
                    useMedium: function(t) {
                        var n = nt(t, nr);
                        return nn.push(n),
                            function() {
                                nn = nn.filter(function(t) {
                                    return t !== n
                                })
                            }
                    },
                    assignSyncMedium: function(t) {
                        for (nr = !0; nn.length;) {
                            var n = nn;
                            nn = [], n.forEach(t)
                        }
                        nn = {
                            push: function(n) {
                                return t(n)
                            },
                            filter: function() {
                                return nn
                            }
                        }
                    },
                    assignMedium: function(t) {
                        nr = !0;
                        var n = [];
                        if (nn.length) {
                            var r = nn;
                            nn = [], r.forEach(t), n = nn
                        }
                        var o = function() {
                                var r = n;
                                n = [], r.forEach(t)
                            },
                            a = function() {
                                return Promise.resolve().then(o)
                            };
                        a(), nn = {
                            push: function(t) {
                                n.push(t), a()
                            },
                            filter: function(t) {
                                return n = n.filter(t), nn
                            }
                        }
                    }
                }).options = eU({
                    async: !0,
                    ssr: !1
                }, ne), no),
                tY = function() {},
                tZ = Y.forwardRef(function(t, n) {
                    var r, o, a, i, l = Y.useRef(null),
                        c = Y.useState({
                            onScrollCapture: tY,
                            onWheelCapture: tY,
                            onTouchMoveCapture: tY
                        }),
                        u = c[0],
                        s = c[1],
                        f = t.forwardProps,
                        d = t.children,
                        p = t.className,
                        v = t.removeScrollBar,
                        m = t.enabled,
                        h = t.shards,
                        y = t.sideCar,
                        g = t.noIsolation,
                        b = t.inert,
                        w = t.allowPinchZoom,
                        x = t.as,
                        S = t.gapMode,
                        O = eB(t, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        j = (r = [l, n], o = function(t) {
                            return r.forEach(function(n) {
                                return tH(n, t)
                            })
                        }, (a = (0, Y.useState)(function() {
                            return {
                                value: null,
                                callback: o,
                                facade: {
                                    get current() {
                                        return a.value
                                    },
                                    set current(e) {
                                        var t = a.value;
                                        t !== e && (a.value = e, a.callback(e, t))
                                    }
                                }
                            }
                        })[0]).callback = o, i = a.facade, tK(function() {
                            var t = tX.get(i);
                            if (t) {
                                var n = new Set(t),
                                    o = new Set(r),
                                    a = i.current;
                                n.forEach(function(t) {
                                    o.has(t) || tH(t, null)
                                }), o.forEach(function(t) {
                                    n.has(t) || tH(t, a)
                                })
                            }
                            tX.set(i, r)
                        }, [r]), i),
                        E = eU(eU({}, O), u);
                    return Y.createElement(Y.Fragment, null, m && Y.createElement(y, {
                        sideCar: tG,
                        removeScrollBar: v,
                        shards: h,
                        noIsolation: g,
                        inert: b,
                        setCallbacks: s,
                        allowPinchZoom: !!w,
                        lockRef: l,
                        gapMode: S
                    }), f ? Y.cloneElement(Y.Children.only(d), eU(eU({}, E), {
                        ref: j
                    })) : Y.createElement(void 0 === x ? "div" : x, eU({}, E, {
                        className: p,
                        ref: j
                    }), d))
                });
            tZ.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, tZ.classNames = {
                fullWidth: tV,
                zeroRight: tz
            };
            var t$ = function() {
                    var t = 0,
                        n = null;
                    return {
                        add: function(o) {
                            var a, i;
                            0 == t && (n = function() {
                                if (!document) return null;
                                var t = document.createElement("style");
                                t.type = "text/css";
                                var n = r.nc;
                                return n && t.setAttribute("nonce", n), t
                            }()) && ((a = n).styleSheet ? a.styleSheet.cssText = o : a.appendChild(document.createTextNode(o)), i = n, (document.head || document.getElementsByTagName("head")[0]).appendChild(i)), t++
                        },
                        remove: function() {
                            --t || !n || (n.parentNode && n.parentNode.removeChild(n), n = null)
                        }
                    }
                },
                tQ = function() {
                    var t, n = (t = t$(), function(n, r) {
                        Y.useEffect(function() {
                            return t.add(n),
                                function() {
                                    t.remove()
                                }
                        }, [n && r])
                    });
                    return function(t) {
                        return n(t.styles, t.dynamic), null
                    }
                },
                tJ = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                t0 = function(t) {
                    return parseInt(t || "", 10) || 0
                },
                t1 = function(t) {
                    if (void 0 === t && (t = "margin"), "undefined" == typeof window) return tJ;
                    var n, r, o, a, i, l = (n = t, o = (r = window.getComputedStyle(document.body))["padding" === n ? "paddingLeft" : "marginLeft"], a = r["padding" === n ? "paddingTop" : "marginTop"], i = r["padding" === n ? "paddingRight" : "marginRight"], [t0(o), t0(a), t0(i)]),
                        c = document.documentElement.clientWidth,
                        u = window.innerWidth;
                    return {
                        left: l[0],
                        top: l[1],
                        right: l[2],
                        gap: Math.max(0, u - c + l[2] - l[0])
                    }
                },
                t2 = tQ(),
                t3 = "data-scroll-locked",
                t5 = function(t, n, r, o) {
                    var a = t.left,
                        i = t.top,
                        l = t.right,
                        c = t.gap;
                    return void 0 === r && (r = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(o, ";\n   padding-right: ").concat(c, "px ").concat(o, ";\n  }\n  body[").concat(t3, "] {\n    overflow: hidden ").concat(o, ";\n    overscroll-behavior: contain;\n    ").concat([n && "position: relative ".concat(o, ";"), "margin" === r && "\n    padding-left: ".concat(a, "px;\n    padding-top: ").concat(i, "px;\n    padding-right: ").concat(l, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(c, "px ").concat(o, ";\n    "), "padding" === r && "padding-right: ".concat(c, "px ").concat(o, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(tz, " {\n    right: ").concat(c, "px ").concat(o, ";\n  }\n  \n  .").concat(tV, " {\n    margin-right: ").concat(c, "px ").concat(o, ";\n  }\n  \n  .").concat(tz, " .").concat(tz, " {\n    right: 0 ").concat(o, ";\n  }\n  \n  .").concat(tV, " .").concat(tV, " {\n    margin-right: 0 ").concat(o, ";\n  }\n  \n  body[").concat(t3, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(c, "px;\n  }\n")
                },
                t4 = function() {
                    var t = parseInt(document.body.getAttribute(t3) || "0", 10);
                    return isFinite(t) ? t : 0
                },
                t6 = function(t) {
                    var n = t.noRelative,
                        r = t.noImportant,
                        o = t.gapMode,
                        a = void 0 === o ? "margin" : o;
                    Y.useEffect(function() {
                        return document.body.setAttribute(t3, (t4() + 1).toString()),
                            function() {
                                var t = t4() - 1;
                                t <= 0 ? document.body.removeAttribute(t3) : document.body.setAttribute(t3, t.toString())
                            }
                    }, []);
                    var i = Y.useMemo(function() {
                        return t1(a)
                    }, [a]);
                    return Y.createElement(t2, {
                        styles: t5(i, !n, a, r ? "" : "!important")
                    })
                },
                t8 = !1;
            if ("undefined" != typeof window) try {
                var t7 = Object.defineProperty({}, "passive", {
                    get: function() {
                        return t8 = !0, !0
                    }
                });
                window.addEventListener("test", t7, t7), window.removeEventListener("test", t7, t7)
            } catch (t) {
                t8 = !1
            }
            var t9, ne, nt, nn, nr, no, na, ni = !!t8 && {
                    passive: !1
                },
                nl = function(t, n) {
                    if (!eQ(t, Element)) return !1;
                    var r = window.getComputedStyle(t);
                    return "hidden" !== r[n] && (r.overflowY !== r.overflowX || "TEXTAREA" === t.tagName || "visible" !== r[n])
                },
                nc = function(t, n) {
                    var r = n.ownerDocument,
                        o = n;
                    do {
                        if ("undefined" != typeof ShadowRoot && eQ(o, ShadowRoot) && (o = o.host), nu(t, o)) {
                            var a = ns(t, o);
                            if (a[1] > a[2]) return !0
                        }
                        o = o.parentNode
                    } while (o && o !== r.body);
                    return !1
                },
                nu = function(t, n) {
                    return "v" === t ? nl(n, "overflowY") : nl(n, "overflowX")
                },
                ns = function(t, n) {
                    return "v" === t ? [n.scrollTop, n.scrollHeight, n.clientHeight] : [n.scrollLeft, n.scrollWidth, n.clientWidth]
                },
                nf = function(t, n, r, o, a) {
                    var i, l = (i = window.getComputedStyle(n).direction, "h" === t && "rtl" === i ? -1 : 1),
                        c = l * o,
                        u = r.target,
                        s = n.contains(u),
                        f = !1,
                        d = c > 0,
                        p = 0,
                        v = 0;
                    do {
                        var m = ns(t, u),
                            h = m[0],
                            y = m[1] - m[2] - l * h;
                        (h || y) && nu(t, u) && (p += y, v += h), u = eQ(u, ShadowRoot) ? u.host : u.parentNode
                    } while (!s && u !== document.body || s && (n.contains(u) || n === u));
                    return (d && (a && 1 > Math.abs(p) || !a && c > p) || !d && (a && 1 > Math.abs(v) || !a && -c > v)) && (f = !0), f
                },
                nd = function(t) {
                    return "changedTouches" in t ? [t.changedTouches[0].clientX, t.changedTouches[0].clientY] : [0, 0]
                },
                np = function(t) {
                    return [t.deltaX, t.deltaY]
                },
                nv = function(t) {
                    return t && "current" in t ? t.current : t
                },
                nm = 0,
                nh = [],
                ny = (na = function(t) {
                    var n = Y.useRef([]),
                        r = Y.useRef([0, 0]),
                        o = Y.useRef(),
                        a = Y.useState(nm++)[0],
                        i = Y.useState(tQ)[0],
                        l = Y.useRef(t);
                    Y.useEffect(function() {
                        l.current = t
                    }, [t]), Y.useEffect(function() {
                        if (t.inert) {
                            document.body.classList.add("block-interactivity-".concat(a));
                            var n = (function(t, n, r) {
                                if (r || 2 == arguments.length)
                                    for (var o, a = 0, i = n.length; a < i; a++) !o && a in n || (o || (o = Array.prototype.slice.call(n, 0, a)), o[a] = n[a]);
                                return t.concat(o || Array.prototype.slice.call(n))
                            })([t.lockRef.current], (t.shards || []).map(nv), !0).filter(Boolean);
                            return n.forEach(function(t) {
                                    return t.classList.add("allow-interactivity-".concat(a))
                                }),
                                function() {
                                    document.body.classList.remove("block-interactivity-".concat(a)), n.forEach(function(t) {
                                        return t.classList.remove("allow-interactivity-".concat(a))
                                    })
                                }
                        }
                    }, [t.inert, t.lockRef.current, t.shards]);
                    var c = Y.useCallback(function(t, n) {
                            if ("touches" in t && 2 === t.touches.length || "wheel" === t.type && t.ctrlKey) return !l.current.allowPinchZoom;
                            var a, i = nd(t),
                                c = r.current,
                                u = "deltaX" in t ? t.deltaX : c[0] - i[0],
                                s = "deltaY" in t ? t.deltaY : c[1] - i[1],
                                f = t.target,
                                d = Math.abs(u) > Math.abs(s) ? "h" : "v";
                            if ("touches" in t && "h" === d && "range" === f.type) return !1;
                            var p = nc(d, f);
                            if (!p) return !0;
                            if (p ? a = d : (a = "v" === d ? "h" : "v", p = nc(d, f)), !p) return !1;
                            if (!o.current && "changedTouches" in t && (u || s) && (o.current = a), !a) return !0;
                            var v = o.current || a;
                            return nf(v, n, t, "h" === v ? u : s, !0)
                        }, []),
                        u = Y.useCallback(function(t) {
                            if (nh.length && nh[nh.length - 1] === i) {
                                var r = "deltaY" in t ? np(t) : nd(t),
                                    o = n.current.filter(function(n) {
                                        var o;
                                        return n.name === t.type && (n.target === t.target || t.target === n.shadowParent) && (o = n.delta, o[0] === r[0] && o[1] === r[1])
                                    })[0];
                                if (o && o.should) t.cancelable && t.preventDefault();
                                else if (!o) {
                                    var a = (l.current.shards || []).map(nv).filter(Boolean).filter(function(n) {
                                        return n.contains(t.target)
                                    });
                                    (a.length > 0 ? c(t, a[0]) : !l.current.noIsolation) && t.cancelable && t.preventDefault()
                                }
                            }
                        }, []),
                        s = Y.useCallback(function(t, r, o, a) {
                            var i = {
                                name: t,
                                delta: r,
                                target: o,
                                should: a,
                                shadowParent: function(t) {
                                    for (var n = null; null !== t;) eQ(t, ShadowRoot) && (n = t.host, t = t.host), t = t.parentNode;
                                    return n
                                }(o)
                            };
                            n.current.push(i), setTimeout(function() {
                                n.current = n.current.filter(function(t) {
                                    return t !== i
                                })
                            }, 1)
                        }, []),
                        f = Y.useCallback(function(t) {
                            r.current = nd(t), o.current = void 0
                        }, []),
                        d = Y.useCallback(function(n) {
                            s(n.type, np(n), n.target, c(n, t.lockRef.current))
                        }, []),
                        p = Y.useCallback(function(n) {
                            s(n.type, nd(n), n.target, c(n, t.lockRef.current))
                        }, []);
                    Y.useEffect(function() {
                        return nh.push(i), t.setCallbacks({
                                onScrollCapture: d,
                                onWheelCapture: d,
                                onTouchMoveCapture: p
                            }), document.addEventListener("wheel", u, ni), document.addEventListener("touchmove", u, ni), document.addEventListener("touchstart", f, ni),
                            function() {
                                nh = nh.filter(function(t) {
                                    return t !== i
                                }), document.removeEventListener("wheel", u, ni), document.removeEventListener("touchmove", u, ni), document.removeEventListener("touchstart", f, ni)
                            }
                    }, []);
                    var v = t.removeScrollBar,
                        m = t.inert;
                    return Y.createElement(Y.Fragment, null, m ? Y.createElement(i, {
                        styles: "\n  .block-interactivity-".concat(a, " {pointer-events: none;}\n  .allow-interactivity-").concat(a, " {pointer-events: all;}\n")
                    }) : null, v ? Y.createElement(t6, {
                        gapMode: t.gapMode
                    }) : null)
                }, tG.useMedium(na), tq),
                ng = Y.forwardRef(function(t, n) {
                    return Y.createElement(tZ, eU({}, t, {
                        ref: n,
                        sideCar: ny
                    }))
                });

            function nb(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function nw(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function nx(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        nw(t, n, r[n])
                    })
                }
                return t
            }

            function nS(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function nO(t, n) {
                if (null == t) return {};
                var r, o, a = function(t, n) {
                    if (null == t) return {};
                    var r, o, a = {},
                        i = Object.keys(t);
                    for (o = 0; o < i.length; o++) r = i[o], n.indexOf(r) >= 0 || (a[r] = t[r]);
                    return a
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(t);
                    for (o = 0; o < i.length; o++) r = i[o], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (a[r] = t[r])
                }
                return a
            }

            function nj(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var i = [],
                            l = !0,
                            c = !1;
                        try {
                            for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            c = !0, o = t
                        } finally {
                            try {
                                l || null == a.return || a.return()
                            } finally {
                                if (c) throw o
                            }
                        }
                        return i
                    }
                }(t, n) || nC(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nE(t) {
                return function(t) {
                    if (Array.isArray(t)) return nb(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || nC(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nC(t, n) {
                if (t) {
                    if ("string" == typeof t) return nb(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return nb(t, n)
                }
            }

            function nP(t, n) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    o = r.checkForDefaultPrevented,
                    a = void 0 === o || o;
                return function(r) {
                    if (null == t || t(r), !1 === a || !r.defaultPrevented) return null == n ? void 0 : n(r)
                }
            }

            function nA(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }

            function nN() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return function(t) {
                    var r = !1,
                        o = n.map(function(n) {
                            var o = nA(n, t);
                            return r || "function" != typeof o || (r = !0), o
                        });
                    if (r) return function() {
                        for (var t = 0; t < o.length; t++) {
                            var r = o[t];
                            "function" == typeof r ? r() : nA(n[t], null)
                        }
                    }
                }
            }

            function nk() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return Y.useCallback(nN.apply(void 0, nE(n)), n)
            }

            function nR() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                var o = n[0];
                if (1 === n.length) return o;
                var a = function() {
                    var t = n.map(function(t) {
                        return {
                            useScope: t(),
                            scopeName: t.scopeName
                        }
                    });
                    return function(n) {
                        var r = t.reduce(function(t, r) {
                            var o = r.useScope,
                                a = r.scopeName;
                            return nx({}, t, o(n)["__scope".concat(a)])
                        }, {});
                        return Y.useMemo(function() {
                            return nw({}, "__scope".concat(o.scopeName), r)
                        }, [r])
                    }
                };
                return a.scopeName = o.scopeName, a
            }

            function nD(t) {
                var n = Y.useRef(t);
                return Y.useEffect(function() {
                    n.current = t
                }), Y.useMemo(function() {
                    return function() {
                        for (var t, r = arguments.length, o = Array(r), a = 0; a < r; a++) o[a] = arguments[a];
                        return null == (t = n.current) ? void 0 : t.call.apply(t, [n].concat(nE(o)))
                    }
                }, [])
            }
            ng.classNames = tZ.classNames;
            var nL = (null == (lv = globalThis) ? void 0 : lv.document) ? Y.useLayoutEffect : function() {},
                nT = function(t) {
                    var n, r, o, a, i, l, c, u, s, f, d, p, v, m, h = t.present,
                        y = t.children,
                        g = (a = (o = nj(Y.useState(), 2))[0], i = o[1], l = Y.useRef({}), c = Y.useRef(h), u = Y.useRef("none"), f = (s = nj((n = h ? "mounted" : "unmounted", r = {
                            mounted: {
                                UNMOUNT: "unmounted",
                                ANIMATION_OUT: "unmountSuspended"
                            },
                            unmountSuspended: {
                                MOUNT: "mounted",
                                ANIMATION_END: "unmounted"
                            },
                            unmounted: {
                                MOUNT: "mounted"
                            }
                        }, Y.useReducer(function(t, n) {
                            var o;
                            return null != (o = r[t][n]) ? o : t
                        }, n)), 2))[0], d = s[1], Y.useEffect(function() {
                            var t = nI(l.current);
                            u.current = "mounted" === f ? t : "none"
                        }, [f]), nL(function() {
                            var t = l.current,
                                n = c.current;
                            if (n !== h) {
                                var r = u.current,
                                    o = nI(t);
                                h ? d("MOUNT") : "none" === o || "none" === (null == t ? void 0 : t.display) ? d("UNMOUNT") : d(n && r !== o ? "ANIMATION_OUT" : "UNMOUNT"), c.current = h
                            }
                        }, [h, d]), nL(function() {
                            if (a) {
                                var t, n, r = null != (n = a.ownerDocument.defaultView) ? n : window,
                                    o = function(n) {
                                        var o = nI(l.current).includes(n.animationName);
                                        if (n.target === a && o && (d("ANIMATION_END"), !c.current)) {
                                            var i = a.style.animationFillMode;
                                            a.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                                "forwards" === a.style.animationFillMode && (a.style.animationFillMode = i)
                                            })
                                        }
                                    },
                                    i = function(t) {
                                        t.target === a && (u.current = nI(l.current))
                                    };
                                return a.addEventListener("animationstart", i), a.addEventListener("animationcancel", o), a.addEventListener("animationend", o),
                                    function() {
                                        r.clearTimeout(t), a.removeEventListener("animationstart", i), a.removeEventListener("animationcancel", o), a.removeEventListener("animationend", o)
                                    }
                            }
                            d("ANIMATION_END")
                        }, [a, d]), {
                            isPresent: ["mounted", "unmountSuspended"].includes(f),
                            ref: Y.useCallback(function(t) {
                                t && (l.current = getComputedStyle(t)), i(t)
                            }, [])
                        }),
                        b = "function" == typeof y ? y({
                            present: g.isPresent
                        }) : Y.Children.only(y),
                        w = nk(g.ref, (m = null == (p = Object.getOwnPropertyDescriptor(b.props, "ref")) ? void 0 : p.get) && "isReactWarning" in m && m.isReactWarning ? b.ref : (m = null == (v = Object.getOwnPropertyDescriptor(b, "ref")) ? void 0 : v.get) && "isReactWarning" in m && m.isReactWarning ? b.props.ref : b.props.ref || b.ref);
                    return "function" == typeof y || g.isPresent ? Y.cloneElement(b, {
                        ref: w
                    }) : null
                };

            function nI(t) {
                return (null == t ? void 0 : t.animationName) || "none"
            }

            function nM(t) {
                var n, r, o = (n = t, (r = Y.forwardRef(function(t, n) {
                        var r = t.children,
                            o = nO(t, ["children"]);
                        if (Y.isValidElement(r)) {
                            var a, i, l, c = (l = null == (a = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (i = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                u = function(t, n) {
                                    var r = nx({}, n);
                                    for (var o in n) ! function(o) {
                                        var a = t[o],
                                            i = n[o];
                                        /^on[A-Z]/.test(o) ? a && i ? r[o] = function() {
                                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                            i.apply(void 0, nE(n)), a.apply(void 0, nE(n))
                                        } : a && (r[o] = a) : "style" === o ? r[o] = nx({}, a, i) : "className" === o && (r[o] = [a, i].filter(Boolean).join(" "))
                                    }(o);
                                    return nx({}, t, r)
                                }(o, r.props);
                            return r.type !== Y.Fragment && (u.ref = n ? nN(n, c) : c), Y.cloneElement(r, u)
                        }
                        return Y.Children.count(r) > 1 ? Y.Children.only(null) : null
                    })).displayName = "".concat(n, ".SlotClone"), r),
                    a = Y.forwardRef(function(t, n) {
                        var r = t.children,
                            a = nO(t, ["children"]),
                            i = Y.Children.toArray(r),
                            l = i.find(nF);
                        if (l) {
                            var c = l.props.children,
                                u = i.map(function(t) {
                                    return t === l ? Y.Children.count(c) > 1 ? Y.Children.only(null) : Y.isValidElement(c) ? c.props.children : null : t
                                });
                            return (0, T.jsx)(o, nS(nx({}, a), {
                                ref: n,
                                children: Y.isValidElement(c) ? Y.cloneElement(c, void 0, u) : null
                            }))
                        }
                        return (0, T.jsx)(o, nS(nx({}, a), {
                            ref: n,
                            children: r
                        }))
                    });
                return a.displayName = "".concat(t, ".Slot"), a
            }
            nT.displayName = "Presence";
            var n_ = Symbol("radix.slottable");

            function nF(t) {
                return Y.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === n_
            }
            var nW = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                    var r = nM("Primitive.".concat(n)),
                        o = Y.forwardRef(function(t, o) {
                            var a = t.asChild,
                                i = nO(t, ["asChild"]),
                                l = a ? r : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, T.jsx)(l, nS(nx({}, i), {
                                ref: o
                            }))
                        });
                    return o.displayName = "Primitive.".concat(n), nS(nx({}, t), nw({}, n, o))
                }, {}),
                nU = "Dialog",
                nB = nj(function(t) {
                    var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        o = function() {
                            var n = r.map(function(t) {
                                return Y.createContext(t)
                            });
                            return function(r) {
                                var o = (null == r ? void 0 : r[t]) || n;
                                return Y.useMemo(function() {
                                    return nw({}, "__scope".concat(t), nS(nx({}, r), nw({}, t, o)))
                                }, [r, o])
                            }
                        };
                    return o.scopeName = t, [function(n, o) {
                        var a = Y.createContext(o),
                            i = r.length;
                        r = nE(r).concat([o]);
                        var l = function(n) {
                            var r, o = n.scope,
                                l = n.children,
                                c = nO(n, ["scope", "children"]),
                                u = (null == o || null == (r = o[t]) ? void 0 : r[i]) || a,
                                s = Y.useMemo(function() {
                                    return c
                                }, Object.values(c));
                            return (0, T.jsx)(u.Provider, {
                                value: s,
                                children: l
                            })
                        };
                        return l.displayName = n + "Provider", [l, function(r, l) {
                            var c, u = (null == l || null == (c = l[t]) ? void 0 : c[i]) || a,
                                s = Y.useContext(u);
                            if (s) return s;
                            if (void 0 !== o) return o;
                            throw Error("`".concat(r, "` must be used within `").concat(n, "`"))
                        }]
                    }, nR.apply(void 0, [o].concat(nE(n)))]
                }(nU), 2),
                nz = nB[0],
                nV = (nB[1], nj(nz(nU), 2)),
                nH = nV[0],
                nK = nV[1],
                nX = function(t) {
                    var n, r, o, a, i, l, c, u, s, f, d, p, v, m, h, y, g, b = t.__scopeDialog,
                        w = t.children,
                        x = t.open,
                        S = t.defaultOpen,
                        O = t.onOpenChange,
                        j = t.modal,
                        E = Y.useRef(null),
                        C = Y.useRef(null),
                        P = nj((r = (n = {
                            prop: x,
                            defaultProp: S,
                            onChange: O
                        }).prop, v = (p = nj((l = (i = {
                            defaultProp: n.defaultProp,
                            onChange: a = void 0 === (o = n.onChange) ? function() {} : o
                        }).defaultProp, c = i.onChange, s = nj(u = Y.useState(l), 1)[0], f = Y.useRef(s), d = nD(c), Y.useEffect(function() {
                            f.current !== s && (d(s), f.current = s)
                        }, [s, f, d]), u), 2))[0], m = p[1], y = (h = void 0 !== r) ? r : v, g = nD(a), [y, Y.useCallback(function(t) {
                            if (h) {
                                var n = "function" == typeof t ? t(r) : t;
                                n !== r && g(n)
                            } else m(t)
                        }, [h, r, m, g])]), 2),
                        A = P[0],
                        N = P[1];
                    return (0, T.jsx)(nH, {
                        scope: b,
                        triggerRef: E,
                        contentRef: C,
                        contentId: eq(),
                        titleId: eq(),
                        descriptionId: eq(),
                        open: void 0 !== A && A,
                        onOpenChange: N,
                        onOpenToggle: Y.useCallback(function() {
                            return N(function(t) {
                                return !t
                            })
                        }, [N]),
                        modal: void 0 === j || j,
                        children: w
                    })
                };
            nX.displayName = nU;
            var nq = "DialogTrigger";
            Y.forwardRef(function(t, n) {
                var r = t.__scopeDialog,
                    o = nO(t, ["__scopeDialog"]),
                    a = nK(nq, r),
                    i = nk(n, a.triggerRef);
                return (0, T.jsx)(nW.button, nS(nx({
                    type: "button",
                    "aria-haspopup": "dialog",
                    "aria-expanded": a.open,
                    "aria-controls": a.contentId,
                    "data-state": rr(a.open)
                }, o), {
                    ref: i,
                    onClick: nP(t.onClick, a.onOpenToggle)
                }))
            }).displayName = nq;
            var nG = "DialogPortal",
                nY = nj(nz(nG, {
                    forceMount: void 0
                }), 2),
                nZ = nY[0],
                n$ = nY[1],
                nQ = function(t) {
                    var n = t.__scopeDialog,
                        r = t.forceMount,
                        o = t.children,
                        a = t.container,
                        i = nK(nG, n);
                    return (0, T.jsx)(nZ, {
                        scope: n,
                        forceMount: r,
                        children: Y.Children.map(o, function(t) {
                            return (0, T.jsx)(nT, {
                                present: r || i.open,
                                children: (0, T.jsx)(tT, {
                                    asChild: !0,
                                    container: a,
                                    children: t
                                })
                            })
                        })
                    })
                };
            nQ.displayName = nG;
            var nJ = "DialogOverlay",
                n0 = Y.forwardRef(function(t, n) {
                    var r = n$(nJ, t.__scopeDialog),
                        o = t.forceMount,
                        a = void 0 === o ? r.forceMount : o,
                        i = nO(t, ["forceMount"]),
                        l = nK(nJ, t.__scopeDialog);
                    return l.modal ? (0, T.jsx)(nT, {
                        present: a || l.open,
                        children: (0, T.jsx)(n2, nS(nx({}, i), {
                            ref: n
                        }))
                    }) : null
                });
            n0.displayName = nJ;
            var n1 = nM("DialogOverlay.RemoveScroll"),
                n2 = Y.forwardRef(function(t, n) {
                    var r = t.__scopeDialog,
                        o = nO(t, ["__scopeDialog"]),
                        a = nK(nJ, r);
                    return (0, T.jsx)(ng, {
                        as: n1,
                        allowPinchZoom: !0,
                        shards: [a.contentRef],
                        children: (0, T.jsx)(nW.div, nS(nx({
                            "data-state": rr(a.open)
                        }, o), {
                            ref: n,
                            style: nx({
                                pointerEvents: "auto"
                            }, o.style)
                        }))
                    })
                }),
                n3 = "DialogContent",
                n5 = Y.forwardRef(function(t, n) {
                    var r = n$(n3, t.__scopeDialog),
                        o = t.forceMount,
                        a = void 0 === o ? r.forceMount : o,
                        i = nO(t, ["forceMount"]),
                        l = nK(n3, t.__scopeDialog);
                    return (0, T.jsx)(nT, {
                        present: a || l.open,
                        children: l.modal ? (0, T.jsx)(n4, nS(nx({}, i), {
                            ref: n
                        })) : (0, T.jsx)(n6, nS(nx({}, i), {
                            ref: n
                        }))
                    })
                });
            n5.displayName = n3;
            var n4 = Y.forwardRef(function(t, n) {
                    var r = nK(n3, t.__scopeDialog),
                        o = Y.useRef(null),
                        a = nk(n, r.contentRef, o);
                    return Y.useEffect(function() {
                        var t = o.current;
                        if (t) return tB(t)
                    }, []), (0, T.jsx)(n8, nS(nx({}, t), {
                        ref: a,
                        trapFocus: r.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: nP(t.onCloseAutoFocus, function(t) {
                            var n;
                            t.preventDefault(), null == (n = r.triggerRef.current) || n.focus()
                        }),
                        onPointerDownOutside: nP(t.onPointerDownOutside, function(t) {
                            var n = t.detail.originalEvent,
                                r = 0 === n.button && !0 === n.ctrlKey;
                            (2 === n.button || r) && t.preventDefault()
                        }),
                        onFocusOutside: nP(t.onFocusOutside, function(t) {
                            return t.preventDefault()
                        })
                    }))
                }),
                n6 = Y.forwardRef(function(t, n) {
                    var r = nK(n3, t.__scopeDialog),
                        o = Y.useRef(!1),
                        a = Y.useRef(!1);
                    return (0, T.jsx)(n8, nS(nx({}, t), {
                        ref: n,
                        trapFocus: !1,
                        disableOutsidePointerEvents: !1,
                        onCloseAutoFocus: function(n) {
                            var i, l;
                            null == (i = t.onCloseAutoFocus) || i.call(t, n), n.defaultPrevented || (o.current || null == (l = r.triggerRef.current) || l.focus(), n.preventDefault()), o.current = !1, a.current = !1
                        },
                        onInteractOutside: function(n) {
                            null == (i = t.onInteractOutside) || i.call(t, n), n.defaultPrevented || (o.current = !0, "pointerdown" === n.detail.originalEvent.type && (a.current = !0));
                            var i, l, c = n.target;
                            (null == (l = r.triggerRef.current) ? void 0 : l.contains(c)) && n.preventDefault(), "focusin" === n.detail.originalEvent.type && a.current && n.preventDefault()
                        }
                    }))
                }),
                n8 = Y.forwardRef(function(t, n) {
                    var r = t.__scopeDialog,
                        o = t.trapFocus,
                        a = t.onOpenAutoFocus,
                        i = t.onCloseAutoFocus,
                        l = nO(t, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        c = nK(n3, r),
                        u = Y.useRef(null),
                        s = nk(n, u);
                    return td(), (0, T.jsxs)(T.Fragment, {
                        children: [(0, T.jsx)(tO, {
                            asChild: !0,
                            loop: !0,
                            trapped: o,
                            onMountAutoFocus: a,
                            onUnmountAutoFocus: i,
                            children: (0, T.jsx)(tc, nS(nx({
                                role: "dialog",
                                id: c.contentId,
                                "aria-describedby": c.descriptionId,
                                "aria-labelledby": c.titleId,
                                "data-state": rr(c.open)
                            }, l), {
                                ref: s,
                                onDismiss: function() {
                                    return c.onOpenChange(!1)
                                }
                            }))
                        }), (0, T.jsxs)(T.Fragment, {
                            children: [(0, T.jsx)(rl, {
                                titleId: c.titleId
                            }), (0, T.jsx)(rc, {
                                contentRef: u,
                                descriptionId: c.descriptionId
                            })]
                        })]
                    })
                }),
                n7 = "DialogTitle",
                n9 = Y.forwardRef(function(t, n) {
                    var r = t.__scopeDialog,
                        o = nO(t, ["__scopeDialog"]),
                        a = nK(n7, r);
                    return (0, T.jsx)(nW.h2, nS(nx({
                        id: a.titleId
                    }, o), {
                        ref: n
                    }))
                });
            n9.displayName = n7;
            var re = "DialogDescription";
            Y.forwardRef(function(t, n) {
                var r = t.__scopeDialog,
                    o = nO(t, ["__scopeDialog"]),
                    a = nK(re, r);
                return (0, T.jsx)(nW.p, nS(nx({
                    id: a.descriptionId
                }, o), {
                    ref: n
                }))
            }).displayName = re;
            var rt = "DialogClose",
                rn = Y.forwardRef(function(t, n) {
                    var r = t.__scopeDialog,
                        o = nO(t, ["__scopeDialog"]),
                        a = nK(rt, r);
                    return (0, T.jsx)(nW.button, nS(nx({
                        type: "button"
                    }, o), {
                        ref: n,
                        onClick: nP(t.onClick, function() {
                            return a.onOpenChange(!1)
                        })
                    }))
                });

            function rr(t) {
                return t ? "open" : "closed"
            }
            rn.displayName = rt;
            var ro = "DialogTitleWarning",
                ra = nj((lu = {
                    contentName: n3,
                    titleName: n7,
                    docsSlug: "dialog"
                }, ls = Y.createContext(lu), (lf = function(t) {
                    var n = t.children,
                        r = nO(t, ["children"]),
                        o = Y.useMemo(function() {
                            return r
                        }, Object.values(r));
                    return (0, T.jsx)(ls.Provider, {
                        value: o,
                        children: n
                    })
                }).displayName = ro + "Provider", [lf, function(t) {
                    var n = Y.useContext(ls);
                    if (n) return n;
                    if (void 0 !== lu) return lu;
                    throw Error("`".concat(t, "` must be used within `").concat(ro, "`"))
                }]), 2),
                ri = (ra[0], ra[1]),
                rl = function(t) {
                    var n = t.titleId,
                        r = ri(ro),
                        o = "`".concat(r.contentName, "` requires a `").concat(r.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(r.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(r.docsSlug);
                    return Y.useEffect(function() {
                        n && (document.getElementById(n) || console.error(o))
                    }, [o, n]), null
                },
                rc = function(t) {
                    var n = t.contentRef,
                        r = t.descriptionId,
                        o = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(ri("DialogDescriptionWarning").contentName, "}.");
                    return Y.useEffect(function() {
                        var t, a = null == (t = n.current) ? void 0 : t.getAttribute("aria-describedby");
                        r && a && (document.getElementById(r) || console.warn(o))
                    }, [o, n, r]), null
                };

            function ru(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function rs(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function rf(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        rs(t, n, r[n])
                    })
                }
                return t
            }

            function rd(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function rp(t, n) {
                if (null == t) return {};
                var r, o, a = function(t, n) {
                    if (null == t) return {};
                    var r, o, a = {},
                        i = Object.keys(t);
                    for (o = 0; o < i.length; o++) r = i[o], n.indexOf(r) >= 0 || (a[r] = t[r]);
                    return a
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(t);
                    for (o = 0; o < i.length; o++) r = i[o], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (a[r] = t[r])
                }
                return a
            }

            function rv(t) {
                return function(t) {
                    if (Array.isArray(t)) return ru(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return ru(t, void 0);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ru(t, n)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rm(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }
            var rh = Symbol("radix.slottable");

            function ry(t) {
                return Y.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === rh
            }
            var rg = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(t, n) {
                    var r, o, a, i, l, c = (o = r = "Primitive.".concat(n), (a = Y.forwardRef(function(t, n) {
                            var r = t.children,
                                o = rp(t, ["children"]);
                            if (Y.isValidElement(r)) {
                                var a, i, l, c = (l = null == (a = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (i = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                    u = function(t, n) {
                                        var r = rf({}, n);
                                        for (var o in n) ! function(o) {
                                            var a = t[o],
                                                i = n[o];
                                            /^on[A-Z]/.test(o) ? a && i ? r[o] = function() {
                                                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                                var o = i.apply(void 0, rv(n));
                                                return a.apply(void 0, rv(n)), o
                                            } : a && (r[o] = a) : "style" === o ? r[o] = rf({}, a, i) : "className" === o && (r[o] = [a, i].filter(Boolean).join(" "))
                                        }(o);
                                        return rf({}, t, r)
                                    }(o, r.props);
                                return r.type !== Y.Fragment && (u.ref = n ? function() {
                                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                    return function(t) {
                                        var r = !1,
                                            o = n.map(function(n) {
                                                var o = rm(n, t);
                                                return r || "function" != typeof o || (r = !0), o
                                            });
                                        if (r) return function() {
                                            for (var t = 0; t < o.length; t++) {
                                                var r = o[t];
                                                "function" == typeof r ? r() : rm(n[t], null)
                                            }
                                        }
                                    }
                                }(n, c) : c), Y.cloneElement(r, u)
                            }
                            return Y.Children.count(r) > 1 ? Y.Children.only(null) : null
                        })).displayName = "".concat(o, ".SlotClone"), i = a, (l = Y.forwardRef(function(t, n) {
                            var r = t.children,
                                o = rp(t, ["children"]),
                                a = Y.Children.toArray(r),
                                l = a.find(ry);
                            if (l) {
                                var c = l.props.children,
                                    u = a.map(function(t) {
                                        return t === l ? Y.Children.count(c) > 1 ? Y.Children.only(null) : Y.isValidElement(c) ? c.props.children : null : t
                                    });
                                return (0, T.jsx)(i, rd(rf({}, o), {
                                    ref: n,
                                    children: Y.isValidElement(c) ? Y.cloneElement(c, void 0, u) : null
                                }))
                            }
                            return (0, T.jsx)(i, rd(rf({}, o), {
                                ref: n,
                                children: r
                            }))
                        })).displayName = "".concat(r, ".Slot"), l),
                        u = Y.forwardRef(function(t, r) {
                            var o = t.asChild,
                                a = rp(t, ["asChild"]),
                                i = o ? c : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, T.jsx)(i, rd(rf({}, a), {
                                ref: r
                            }))
                        });
                    return u.displayName = "Primitive.".concat(n), rd(rf({}, t), rs({}, n, u))
                }, {}),
                rb = Object.freeze({
                    position: "absolute",
                    border: 0,
                    width: 1,
                    height: 1,
                    padding: 0,
                    margin: -1,
                    overflow: "hidden",
                    clip: "rect(0, 0, 0, 0)",
                    whiteSpace: "nowrap",
                    wordWrap: "normal"
                }),
                rw = Y.forwardRef(function(t, n) {
                    return (0, T.jsx)(rg.span, rd(rf({}, t), {
                        ref: n,
                        style: rf({}, rb, t.style)
                    }))
                });

            function rx(t, n) {
                void 0 === n && (n = {});
                var r = n.insertAt;
                if (t && "undefined" != typeof document) {
                    var o = document.head || document.getElementsByTagName("head")[0],
                        a = document.createElement("style");
                    a.type = "text/css", "top" === r && o.firstChild ? o.insertBefore(a, o.firstChild) : o.appendChild(a), a.styleSheet ? a.styleSheet.cssText = t : a.appendChild(document.createTextNode(t))
                }
            }
            rw.displayName = "VisuallyHidden", rx(".bg-common-backdrop{background-color:var(--color-common-backdrop)}.shadow-transient-high{box-shadow:var(--size-0) var(--size-50) var(--size-100) -.5px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-250) var(--size-500) -.75px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-400) var(--size-800) -1px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-1200) var(--size-1400) -1.5px var(--alpha-color-shadow-subtle)}.shadow-transient-low{box-shadow:var(--size-0) var(--size-50) var(--size-100) -.5px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-250) var(--size-500) -.75px var(--alpha-color-shadow-subtle)}.foundation-web-portal-zindex{z-index:1050}.fui-future-shadow-affixed-low{box-shadow:0 0 var(--size-100) 0 var(--fui-future-alpha-color-shadow-subtle),0 0 var(--size-500) 0 var(--fui-future-alpha-color-shadow-subtle)}:root{--light-mode-stroke-contrast-alpha:rgba(27,37,75,.5);--dark-mode-stroke-contrast-alpha:rgba(208,217,251,.4);--color-stroke-contrast-alpha:var(--light-mode-stroke-contrast-alpha);--alpha-light-mode-shadow-subtle:rgba(0,0,0,.08);--alpha-dark-mode-shadow-subtle:rgba(4,4,8,.25);--alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}@media (prefers-color-scheme:dark){:root{--color-stroke-contrast-alpha:var(--dark-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}}.light-theme{--color-stroke-contrast-alpha:var(--light-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}.dark-theme{--color-stroke-contrast-alpha:var(--dark-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}.system-theme{--color-stroke-contrast-alpha:var(--light-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}@media (prefers-color-scheme:dark){.system-theme{--color-stroke-contrast-alpha:var(--dark-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}}.stroke-contrast-alpha{border-color:var(--color-stroke-contrast-alpha)}.foundation-web-input.stroke-contrast-alpha:focus,.foundation-web-input.stroke-contrast-alpha:focus-within,.foundation-web-input.stroke-emphasis:focus,.foundation-web-input.stroke-emphasis:focus-within{border-color:var(--color-system-emphasis);box-shadow:inset 0 0 0 1px var(--color-system-emphasis)}.foundation-web-input.stroke-system-alert:focus,.foundation-web-input.stroke-system-alert:focus-within{box-shadow:inset 0 0 0 1px var(--color-system-alert)}");
            var rS = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]"
                },
                rO = Z().forwardRef(function(t, n) {
                    var r = t.name,
                        o = t.size,
                        a = t.className,
                        i = (t.children, eB(t, ["name", "size", "className", "children"]));
                    return Z().createElement("span", Object.assign({
                        ref: n,
                        role: "presentation",
                        className: ez("grow-0 shrink-0 basis-auto icon", r, rS[void 0 === o ? "Medium" : o], a)
                    }, i))
                });
            rO.displayName = "Icon";
            var rj = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                rE = function(t) {
                    var n = t.className;
                    return Z().createElement("div", {
                        role: "presentation",
                        className: ez("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", n)
                    })
                },
                rC = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-medium"
                },
                rP = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                rA = function(t) {
                    var n = t.variant,
                        r = t.size,
                        o = t.isCircular,
                        a = t.className,
                        i = eB(t, ["variant", "size", "isCircular", "className"]);
                    return Z().createElement("button", Object.assign({
                        type: "button",
                        className: ez("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", rj, rP[n], rC[r], o && "radius-circle", a)
                    }, i), Z().createElement(rE, null), Z().createElement(rO, {
                        name: "icon-regular-x",
                        size: r
                    }))
                };
            rx(".foundation-web-dialog-overlay{bottom:0;display:grid;left:0;overflow-y:auto;place-items:center;position:fixed;right:0;top:0}.foundation-web-dialog-close-container{right:var(--size-300);top:var(--size-300);z-index:1}.foundation-web-dialog-hero-media{border-top-left-radius:var(--radius-large);border-top-right-radius:var(--radius-large);margin-left:calc(var(--stroke-standard)*-1);margin-right:calc(var(--stroke-standard)*-1);margin-top:calc(var(--stroke-standard)*-1);overflow:clip}.foundation-web-dialog-content[data-size=Small]{max-width:calc(var(--size-100)*80);min-width:calc(var(--size-100)*75)}.foundation-web-dialog-content[data-size=Medium]{max-width:calc(var(--size-100)*120);min-width:calc(var(--size-100)*75)}.foundation-web-dialog-content[data-size=Large]{max-width:calc(var(--size-100)*160);min-width:calc(var(--size-100)*75)}@keyframes foundation-web-dialog-backdrop-fade-in{0%{opacity:0}to{opacity:1}}@keyframes foundation-web-dialog-backdrop-fade-out{0%{opacity:1}to{opacity:0}}@keyframes foundation-web-dialog-content-scale-in{0%{transform:scale(.975)}to{transform:scale(1)}}@keyframes foundation-web-dialog-content-scale-out{0%{transform:scale(1)}to{transform:scale(.975)}}@media (prefers-reduced-motion:no-preference){.foundation-web-dialog-overlay[data-state=open]{animation:foundation-web-dialog-backdrop-fade-in var(--time-100) var(--ease-linear)}.foundation-web-dialog-overlay[data-state=closed]{animation:foundation-web-dialog-backdrop-fade-out var(--time-100) var(--ease-linear)}.foundation-web-dialog-content[data-state=open]{animation:foundation-web-dialog-content-scale-in var(--time-300) var(--ease-standard-out)}.foundation-web-dialog-content[data-state=closed]{animation:foundation-web-dialog-content-scale-out var(--time-300) var(--ease-standard-out)}}");
            var rN = (0, Y.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    hasDescription: !1,
                    type: "Default"
                }),
                rk = function() {
                    var t = (0, Y.useContext)(rN);
                    if (!t) throw Error("Dialog components must be used within a Dialog");
                    return t
                },
                rR = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                rD = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                rL = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                rT = function(t) {
                    var n = t.open,
                        r = t.onOpenChange,
                        o = t.children,
                        a = t.size,
                        i = t.type,
                        l = void 0 === i ? "Default" : i,
                        c = t.isModal,
                        u = t.hasCloseAffordance,
                        s = t.closeLabel,
                        f = t.hasMarginTop,
                        d = void 0 === f || f,
                        p = t.hasMarginBottom,
                        v = void 0 === p || p,
                        m = t.hasDescription,
                        h = void 0 !== m && m,
                        y = t.experimentalDisablePointerEventsStylingOnBody,
                        g = void 0 !== y && y,
                        b = (0, Y.useMemo)(function() {
                            return {
                                size: a,
                                isModal: c,
                                type: l,
                                hasCloseAffordance: u,
                                closeLabel: s,
                                hasMarginTop: d,
                                hasMarginBottom: v,
                                hasDescription: h
                            }
                        }, [a, c, l, u, s, d, v, h]);
                    return (0, Y.useEffect)(function() {
                        g && setTimeout(function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }, 0)
                    }, [g, n]), Z().createElement(rN.Provider, {
                        value: b
                    }, Z().createElement(nX, {
                        open: n,
                        onOpenChange: r
                    }, o))
                };
            rT.displayName = "Dialog";
            var rI = function(t) {
                var n = t.children,
                    r = t.className,
                    o = t.style,
                    a = t.overlayClassName,
                    i = t.overlayStyle,
                    l = t.onOpenAutoFocus,
                    c = eB(t, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
                    u = rk(),
                    s = u.size,
                    f = u.isModal,
                    d = u.hasCloseAffordance,
                    p = u.closeLabel,
                    v = u.hasDescription,
                    m = ez("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", f && "bg-common-backdrop", a),
                    h = ez("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", r);
                return Z().createElement(nQ, null, Z().createElement(n0, {
                    className: m,
                    style: i
                }, Z().createElement(n5, Object.assign({
                    className: h,
                    "data-size": s,
                    style: o,
                    onOpenAutoFocus: l
                }, !v && {
                    "aria-describedby": void 0
                }, c), d && Z().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, Z().createElement(rn, {
                    asChild: !0
                }, Z().createElement(rA, {
                    variant: "OverMedia",
                    size: s,
                    isCircular: !0,
                    "aria-label": p
                }))), n)))
            };
            rI.displayName = "DialogContent";
            var rM = function(t) {
                var n = t.children,
                    r = t.className,
                    o = eB(t, ["children", "className"]),
                    a = rk(),
                    i = a.size,
                    l = a.hasMarginTop,
                    c = a.hasMarginBottom,
                    u = ez(rR[i], l && rD[i], c && rL[i], r);
                return Z().createElement("div", Object.assign({
                    className: u
                }, o), n)
            };
            rM.displayName = "DialogBody";
            var r_ = function(t) {
                var n = t.children,
                    r = t.className,
                    o = t.hidden,
                    a = eB(t, ["children", "className", "hidden"]),
                    i = Z().createElement(n9, Object.assign({
                        className: r
                    }, a), n);
                return o ? Z().createElement(rw, null, i) : i
            };
            r_.displayName = "DialogTitle";
            var rF = function(t) {
                var n = t.children,
                    r = t.className,
                    o = eB(t, ["children", "className"]),
                    a = rk().size,
                    i = ez(rR[a], rL[a], r);
                return Z().createElement("div", Object.assign({
                    className: i
                }, o), n)
            };

            function rW(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function rU(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        var o;
                        o = r[n], n in t ? Object.defineProperty(t, n, {
                            value: o,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : t[n] = o
                    })
                }
                return t
            }

            function rB(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function rz(t, n) {
                if (null == t) return {};
                var r, o, a = function(t, n) {
                    if (null == t) return {};
                    var r, o, a = {},
                        i = Object.keys(t);
                    for (o = 0; o < i.length; o++) r = i[o], n.indexOf(r) >= 0 || (a[r] = t[r]);
                    return a
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(t);
                    for (o = 0; o < i.length; o++) r = i[o], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (a[r] = t[r])
                }
                return a
            }

            function rV(t) {
                return function(t) {
                    if (Array.isArray(t)) return rW(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return rW(t, void 0);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rW(t, n)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rH(t) {
                return t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t
            }

            function rK(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }
            rF.displayName = "DialogFooter";
            var rX = Symbol.for("react.lazy"),
                rq = Y[" use ".trim().toString()];

            function rG(t) {
                var n;
                return null != t && "object" == (void 0 === t ? "undefined" : rH(t)) && "$$typeof" in t && t.$$typeof === rX && "_payload" in t && "object" == rH(n = t._payload) && null !== n && "then" in n
            }
            var rY = ((lc = Y.forwardRef(function(t, n) {
                    var r = t.children,
                        o = rz(t, ["children"]);
                    if (rG(r) && "function" == typeof rq && (r = rq(r._payload)), Y.isValidElement(r)) {
                        var a, i, l, c, u = (c = null == (i = Object.getOwnPropertyDescriptor((a = r).props, "ref")) ? void 0 : i.get) && "isReactWarning" in c && c.isReactWarning ? a.ref : (c = null == (l = Object.getOwnPropertyDescriptor(a, "ref")) ? void 0 : l.get) && "isReactWarning" in c && c.isReactWarning ? a.props.ref : a.props.ref || a.ref,
                            s = function(t, n) {
                                var r = rU({}, n);
                                for (var o in n) ! function(o) {
                                    var a = t[o],
                                        i = n[o];
                                    /^on[A-Z]/.test(o) ? a && i ? r[o] = function() {
                                        for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                        var o = i.apply(void 0, rV(n));
                                        return a.apply(void 0, rV(n)), o
                                    } : a && (r[o] = a) : "style" === o ? r[o] = rU({}, a, i) : "className" === o && (r[o] = [a, i].filter(Boolean).join(" "))
                                }(o);
                                return rU({}, t, r)
                            }(o, r.props);
                        return r.type !== Y.Fragment && (s.ref = n ? function() {
                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                            return function(t) {
                                var r = !1,
                                    o = n.map(function(n) {
                                        var o = rK(n, t);
                                        return r || "function" != typeof o || (r = !0), o
                                    });
                                if (r) return function() {
                                    for (var t = 0; t < o.length; t++) {
                                        var r = o[t];
                                        "function" == typeof r ? r() : rK(n[t], null)
                                    }
                                }
                            }
                        }(n, u) : u), Y.cloneElement(r, s)
                    }
                    return Y.Children.count(r) > 1 ? Y.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), ld = lc, (lp = Y.forwardRef(function(t, n) {
                    var r = t.children,
                        o = rz(t, ["children"]);
                    rG(r) && "function" == typeof rq && (r = rq(r._payload));
                    var a = Y.Children.toArray(r),
                        i = a.find(r$);
                    if (i) {
                        var l = i.props.children,
                            c = a.map(function(t) {
                                return t === i ? Y.Children.count(l) > 1 ? Y.Children.only(null) : Y.isValidElement(l) ? l.props.children : null : t
                            });
                        return (0, T.jsx)(ld, rB(rU({}, o), {
                            ref: n,
                            children: Y.isValidElement(l) ? Y.cloneElement(l, void 0, c) : null
                        }))
                    }
                    return (0, T.jsx)(ld, rB(rU({}, o), {
                        ref: n,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), lp),
                rZ = Symbol("radix.slottable");

            function r$(t) {
                return Y.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === rZ
            }
            var rQ = "opacity-[0.5]";
            rx("@keyframes rotation{0%{transform:rotate(0deg)}to{transform:rotate(359deg)}}.foundation-web-loading-spinner{animation:rotation 1s linear infinite normal}");
            var rJ = function(t) {
                    var n = t.width,
                        r = t.height;
                    return Z().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: n,
                        height: r,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, Z().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                },
                r0 = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                r1 = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                r2 = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                r3 = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                r5 = (0, Y.forwardRef)(function(t, n) {
                    var r = t.children,
                        o = t.className,
                        a = t.style,
                        i = t.isDisabled,
                        l = void 0 !== i && i,
                        c = t.isLoading,
                        u = void 0 !== c && c,
                        s = t.icon,
                        f = t.size,
                        d = void 0 === f ? "Large" : f,
                        p = t.variant,
                        v = void 0 === p ? "Emphasis" : p,
                        m = t.asChild,
                        h = eB(t, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        y = ez("foundation-web-button", l ? rQ : [rj, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", r1[d], l ? r3[v] : r2[v], o),
                        g = Object.assign({
                            textDecoration: "none"
                        }, a),
                        b = function(t) {
                            return Z().createElement(Z().Fragment, null, Z().createElement(rE, null), u && Z().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, Z().createElement(rJ, {
                                width: r0[d],
                                height: r0[d]
                            })), Z().createElement("span", {
                                className: ez("flex items-center min-width-0", "Large" === d || "Medium" === d ? "gap-small" : "gap-xsmall", u && "invisible")
                            }, s && Z().createElement(rO, {
                                name: s,
                                size: d
                            }), Z().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, t)))
                        };
                    if (m) {
                        var w = eB(h, ["as"]),
                            x = Z().Children.only(r);
                        return Z().createElement(rY, Object.assign({
                            ref: n
                        }, w, {
                            className: y,
                            style: g,
                            "aria-disabled": l || void 0
                        }), Z().cloneElement(x, {}, b(x.props.children)))
                    }
                    if ("a" === h.as) {
                        h.as;
                        var S = h.href,
                            O = eB(h, ["as", "href"]);
                        return Z().createElement("a", Object.assign({
                            ref: n
                        }, O, {
                            "aria-disabled": l,
                            href: l ? void 0 : S,
                            className: y,
                            style: g
                        }), b(r))
                    }
                    var j = eB(h, ["as"]);
                    return Z().createElement("button", Object.assign({
                        ref: n,
                        type: "button"
                    }, j, {
                        disabled: l,
                        className: y,
                        style: g
                    }), b(r))
                }),
                r4 = window.Roblox["core-scripts"].http.http,
                r6 = function(t, n) {
                    var r = "".concat(ew().apiGatewayUrl, "/access-management/v1/upsell-feature-access"),
                        o = new URLSearchParams({
                            featureName: t,
                            namespace: n
                        });
                    return {
                        retryable: !0,
                        withCredentials: !0,
                        url: "".concat(r, "?").concat(o.toString())
                    }
                };

            function r8(t, n, r, o, a, i, l) {
                try {
                    var c = t[i](l),
                        u = c.value
                } catch (t) {
                    r(t);
                    return
                }
                c.done ? n(u) : Promise.resolve(u).then(o, a)
            }

            function r7(t) {
                return function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(o, a) {
                        var i = t.apply(n, r);

                        function l(t) {
                            r8(i, o, a, l, c, "next", t)
                        }

                        function c(t) {
                            r8(i, o, a, l, c, "throw", t)
                        }
                        l(void 0)
                    })
                }
            }

            function r9(t, n) {
                var r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return l.next = c(0), l.throw = c(1), l.return = c(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                    return this
                }), l;

                function c(c) {
                    return function(u) {
                        var s = [c, u];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                            if (r = 1, o && (a = 2 & s[0] ? o.return : s[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, s[1])).done) return a;
                            switch (o = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                case 0:
                                case 1:
                                    a = s;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, o = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                        i.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && i.label < a[1]) {
                                        i.label = a[1], a = s;
                                        break
                                    }
                                    if (a && i.label < a[2]) {
                                        i.label = a[2], i.ops.push(s);
                                        break
                                    }
                                    a[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            s = n.call(t, i)
                        } catch (t) {
                            s = [6, t], o = 0
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

            function oe(t, n, r, o, a, i, l) {
                try {
                    var c = t[i](l),
                        u = c.value
                } catch (t) {
                    r(t);
                    return
                }
                c.done ? n(u) : Promise.resolve(u).then(o, a)
            }
            var ot = function(t, n) {
                    var r;
                    return (r = function() {
                        var r;
                        return function(t, n) {
                            var r, o, a, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & a[0]) throw a[1];
                                        return a[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return l.next = c(0), l.throw = c(1), l.return = c(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                                return this
                            }), l;

                            function c(c) {
                                return function(u) {
                                    var s = [c, u];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                                        if (r = 1, o && (a = 2 & s[0] ? o.return : s[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, s[1])).done) return a;
                                        switch (o = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                            case 0:
                                            case 1:
                                                a = s;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: s[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, o = s[1], s = [0];
                                                continue;
                                            case 7:
                                                s = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                                    i.label = s[1];
                                                    break
                                                }
                                                if (6 === s[0] && i.label < a[1]) {
                                                    i.label = a[1], a = s;
                                                    break
                                                }
                                                if (a && i.label < a[2]) {
                                                    i.label = a[2], i.ops.push(s);
                                                    break
                                                }
                                                a[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        s = n.call(t, i)
                                    } catch (t) {
                                        s = [6, t], o = 0
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
                        }(this, function(o) {
                            switch (o.label) {
                                case 0:
                                    return r = r6(t, n), [4, r4.get(r)];
                                case 1:
                                    return [2, o.sent().data]
                            }
                        })
                    }, function() {
                        var t = this,
                            n = arguments;
                        return new Promise(function(o, a) {
                            var i = r.apply(t, n);

                            function l(t) {
                                oe(i, o, a, l, c, "next", t)
                            }

                            function c(t) {
                                oe(i, o, a, l, c, "throw", t)
                            }
                            l(void 0)
                        })
                    })()
                },
                on = '<a href="https://en.help.roblox.com/hc/articles/28943243301780" target="_blank" rel="noreferrer" class="text-link">',
                or = "<a href=",
                oo = function(t) {
                    return " onclick=\"if(window.location.pathname.includes('/my/account')){event.preventDefault();window.location.href='".concat(t, '\';window.location.reload();}" class="text-link">')
                },
                oa = "</a>",
                oi = "<br />";

            function ol(t, n, r, o, a, i, l) {
                try {
                    var c = t[i](l),
                        u = c.value
                } catch (t) {
                    r(t);
                    return
                }
                c.done ? n(u) : Promise.resolve(u).then(o, a)
            }
            var oc = function(t) {
                var n = t.showModal,
                    r = t.onModalClose,
                    o = t.translate,
                    a = t.intl,
                    i = (0, I.useQuery)({
                        queryKey: ["yourPrivacyChoicesModal"],
                        queryFn: function() {
                            var t;
                            return (t = function() {
                                var t, n, r, o, a, i;
                                return function(t, n) {
                                    var r, o, a, i = {
                                            label: 0,
                                            sent: function() {
                                                if (1 & a[0]) throw a[1];
                                                return a[1]
                                            },
                                            trys: [],
                                            ops: []
                                        },
                                        l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                    return l.next = c(0), l.throw = c(1), l.return = c(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                                        return this
                                    }), l;

                                    function c(c) {
                                        return function(u) {
                                            var s = [c, u];
                                            if (r) throw TypeError("Generator is already executing.");
                                            for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                                                if (r = 1, o && (a = 2 & s[0] ? o.return : s[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, s[1])).done) return a;
                                                switch (o = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                                    case 0:
                                                    case 1:
                                                        a = s;
                                                        break;
                                                    case 4:
                                                        return i.label++, {
                                                            value: s[1],
                                                            done: !1
                                                        };
                                                    case 5:
                                                        i.label++, o = s[1], s = [0];
                                                        continue;
                                                    case 7:
                                                        s = i.ops.pop(), i.trys.pop();
                                                        continue;
                                                    default:
                                                        if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                            i = 0;
                                                            continue
                                                        }
                                                        if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                                            i.label = s[1];
                                                            break
                                                        }
                                                        if (6 === s[0] && i.label < a[1]) {
                                                            i.label = a[1], a = s;
                                                            break
                                                        }
                                                        if (a && i.label < a[2]) {
                                                            i.label = a[2], i.ops.push(s);
                                                            break
                                                        }
                                                        a[2] && i.ops.pop(), i.trys.pop();
                                                        continue
                                                }
                                                s = n.call(t, i)
                                            } catch (t) {
                                                s = [6, t], o = 0
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
                                            if (r = null != (n = null == (t = (0, eW.authenticatedUser)()) ? void 0 : t.isAuthenticated) && n, o = !!navigator.globalPrivacyControl, !r) return [3, 2];
                                            return [4, r7(function() {
                                                var t;
                                                return r9(this, function(n) {
                                                    switch (n.label) {
                                                        case 0:
                                                            return t = {
                                                                withCredentials: !0,
                                                                url: "".concat(ew().userSettingsApi, "/v1/user-settings/gpc")
                                                            }, [4, r4.post(t)];
                                                        case 1:
                                                            return n.sent(), [2]
                                                    }
                                                })
                                            })()];
                                        case 1:
                                            l.sent(), l.label = 2;
                                        case 2:
                                            if (a = !1, !r) return [3, 4];
                                            return [4, ot("ShouldShowAdsSettings", "account_management/UserSettingsPolicy")];
                                        case 3:
                                            a = "Granted" === l.sent().access, l.label = 4;
                                        case 4:
                                            if (i = !1, !r) return [3, 6];
                                            return [4, r7(function() {
                                                return r9(this, function(t) {
                                                    switch (t.label) {
                                                        case 0:
                                                            return [4, r4.get({
                                                                retryable: !0,
                                                                withCredentials: !0,
                                                                url: "".concat(ew().userSettingsApi, "/v1/user-settings")
                                                            })];
                                                        case 1:
                                                            return [2, t.sent().data]
                                                    }
                                                })
                                            })()];
                                        case 5:
                                            i = "Enabled" === l.sent().allowSellShareData, l.label = 6;
                                        case 6:
                                            return [2, {
                                                isGpcDetected: o,
                                                canUserManageAdsSettings: a,
                                                isAdsSellShareDataEnabled: i
                                            }]
                                    }
                                })
                            }, function() {
                                var n = this,
                                    r = arguments;
                                return new Promise(function(o, a) {
                                    var i = t.apply(n, r);

                                    function l(t) {
                                        ol(i, o, a, l, c, "next", t)
                                    }

                                    function c(t) {
                                        ol(i, o, a, l, c, "throw", t)
                                    }
                                    l(void 0)
                                })
                            })()
                        },
                        enabled: n,
                        cacheTime: 0
                    }),
                    l = i.data,
                    c = i.isLoading,
                    u = i.isError;
                return (0, T.jsx)(rT, {
                    open: n,
                    onOpenChange: r,
                    size: "Small",
                    isModal: !0,
                    hasCloseAffordance: !0,
                    closeLabel: "Action.Close",
                    children: (0, T.jsx)(rI, {
                        children: (0, T.jsxs)(Z().Fragment, {
                            children: [(0, T.jsxs)(rM, {
                                children: [c ? (0, T.jsx)(r_, {
                                    hidden: !0,
                                    className: "text-heading-small",
                                    children: o("Description.Loading")
                                }) : (0, T.jsx)(r_, {
                                    className: "text-heading-small",
                                    children: u ? o("Title.Error") : l.isGpcDetected ? o("Title.GpcDetected") : o("Title.NoGpcDetected")
                                }), function() {
                                    if (c) return (0, T.jsx)(en.Loading, {});
                                    var t, n = (t = a.getRobloxLocale(), (0, eF.getUrlWithLocale)("/my/account#!/privacy/AdPreferences", t)),
                                        r = o("Body.Error"),
                                        i = o("Body.GpcMissingSettingIneligible", {
                                            lineBreak: oi,
                                            aTagStart: on,
                                            aTagEnd: oa
                                        }),
                                        s = o("Body.GpcMissingSettingEligible", {
                                            lineBreak: oi,
                                            aTagWithHref: or,
                                            link: n,
                                            hrefEnd: oo(n),
                                            aTagEnd: oa
                                        }),
                                        f = o("Body.GpcDetectedSettingEnabledIneligible", {
                                            lineBreak: oi,
                                            aTagStart: on,
                                            aTagEnd: oa
                                        }),
                                        d = o("Body.GpcDetectedSettingEnabledEligible", {
                                            lineBreak: oi,
                                            aTagWithHref: or,
                                            link: n,
                                            hrefEnd: oo(n),
                                            aTagEnd: oa
                                        }),
                                        p = o("Body.GpcDetectedSettingDisabledIneligible", {
                                            lineBreak: oi,
                                            aTagStart: on,
                                            aTagEnd: oa
                                        }),
                                        v = o("Body.GpcDetectedSettingDisabledEligible", {
                                            lineBreak: oi,
                                            aTagWithHref: or,
                                            link: n,
                                            hrefEnd: oo(n),
                                            aTagEnd: oa
                                        }),
                                        m = u ? r : l.isGpcDetected ? l.isAdsSellShareDataEnabled ? l.canUserManageAdsSettings ? d : f : l.canUserManageAdsSettings ? v : p : l.canUserManageAdsSettings ? s : i;
                                    return (0, T.jsx)("div", {
                                        className: "text-body-medium",
                                        dangerouslySetInnerHTML: {
                                            __html: m
                                        }
                                    })
                                }()]
                            }), !c && (0, T.jsx)(rF, {
                                className: "width-full",
                                children: (0, T.jsx)(r5, {
                                    className: "width-full",
                                    size: "Large",
                                    variant: "Emphasis",
                                    onClick: r,
                                    children: o("Action.Ok")
                                })
                            })]
                        })
                    })
                })
            };

            function ou(t, n, r, o, a, i, l) {
                try {
                    var c = t[i](l),
                        u = c.value
                } catch (t) {
                    r(t);
                    return
                }
                c.done ? n(u) : Promise.resolve(u).then(o, a)
            }
            var os = function() {
                var t;
                return (t = function() {
                    return function(t, n) {
                        var r, o, a, i = {
                                label: 0,
                                sent: function() {
                                    if (1 & a[0]) throw a[1];
                                    return a[1]
                                },
                                trys: [],
                                ops: []
                            },
                            l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                        return l.next = c(0), l.throw = c(1), l.return = c(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                            return this
                        }), l;

                        function c(c) {
                            return function(u) {
                                var s = [c, u];
                                if (r) throw TypeError("Generator is already executing.");
                                for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                                    if (r = 1, o && (a = 2 & s[0] ? o.return : s[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, s[1])).done) return a;
                                    switch (o = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                        case 0:
                                        case 1:
                                            a = s;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: s[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, o = s[1], s = [0];
                                            continue;
                                        case 7:
                                            s = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                                i.label = s[1];
                                                break
                                            }
                                            if (6 === s[0] && i.label < a[1]) {
                                                i.label = a[1], a = s;
                                                break
                                            }
                                            if (a && i.label < a[2]) {
                                                i.label = a[2], i.ops.push(s);
                                                break
                                            }
                                            a[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    s = n.call(t, i)
                                } catch (t) {
                                    s = [6, t], o = 0
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
                    }(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return t.trys.push([0, 2, , 3]), [4, (0, eR.callBehaviour)("footer-ui")];
                            case 1:
                                return [2, t.sent().IsPrivacyChoiceModalEnabled];
                            case 2:
                                return t.sent(), [2, !1];
                            case 3:
                                return [2]
                        }
                    })
                }, function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(o, a) {
                        var i = t.apply(n, r);

                        function l(t) {
                            ou(i, o, a, l, c, "next", t)
                        }

                        function c(t) {
                            ou(i, o, a, l, c, "throw", t)
                        }
                        l(void 0)
                    })
                })()
            };

            function of(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function od(t) {
                var n, r = t.translate,
                    o = t.intl,
                    a = (n = (0, Y.useState)(!1), function(t) {
                        if (Array.isArray(t)) return t
                    }(n) || function(t, n) {
                        var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                        if (null != a) {
                            var i = [],
                                l = !0,
                                c = !1;
                            try {
                                for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), i.length !== n); l = !0);
                            } catch (t) {
                                c = !0, o = t
                            } finally {
                                try {
                                    l || null == a.return || a.return()
                                } finally {
                                    if (c) throw o
                                }
                            }
                            return i
                        }
                    }(n, 2) || function(t, n) {
                        if (t) {
                            if ("string" == typeof t) return of(t, 2);
                            var r = Object.prototype.toString.call(t).slice(8, -1);
                            if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return of(t, n)
                        }
                    }(n, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()),
                    i = a[0],
                    l = a[1],
                    c = (0, I.useQuery)({
                        queryKey: ["isYourPrivacyChoicesModalEnabled"],
                        queryFn: os,
                        placeholderData: !1
                    }).data,
                    u = U,
                    s = !1,
                    f = document.getElementById("footer-container");
                if (null != f) {
                    var d = f.getAttribute("data-is-giftcards-footer-enabled");
                    null != d && (s = "true" === d.toLowerCase())
                }
                s && (u = B);
                var p = u.map(function(t) {
                    return (0, T.jsx)("li", {
                        className: "footer-link",
                        children: "your-privacy-choices" === t.name && c ? (0, T.jsxs)("button", {
                            onClick: function() {
                                return l(!0)
                            },
                            className: "text-footer-nav footer-button-link",
                            type: "button",
                            children: [r(t.labelTranslationKey), (0, T.jsx)("img", {
                                src: t.postfixIcon,
                                alt: "",
                                className: "footer-postfixIcon"
                            })]
                        }) : (0, T.jsxs)("a", {
                            href: q.urlService.getUrlWithLocale(t.path, o.getRobloxLocale()),
                            className: Q()("text-footer-nav", t.cssClass),
                            target: "_blank",
                            rel: "noreferrer",
                            onClick: function(n) {
                                var r;
                                return r = t.name, void(0, J.sendEventWithTarget)("PageFooter", "click", {
                                    destination: "".concat(r),
                                    source: "".concat(n.currentTarget.ownerDocument.location.pathname)
                                }, J.targetTypes.WWW)
                            },
                            children: [r(t.labelTranslationKey), t.postfixIcon ? (0, T.jsx)("img", {
                                src: t.postfixIcon,
                                alt: "",
                                className: "footer-postfixIcon"
                            }) : ""]
                        })
                    }, t.name)
                });
                return (0, T.jsxs)(Z().Fragment, {
                    children: [(0, T.jsxs)("ul", {
                        className: "row footer-links flex flex-wrap justify-center padding-bottom-xxsmall",
                        children: [p, (0, T.jsx)("li", {
                            children: (0, T.jsx)(e_, {
                                translate: r
                            })
                        })]
                    }), (0, T.jsx)(oc, {
                        showModal: i,
                        onModalClose: function() {
                            return l(!1)
                        },
                        translate: r,
                        intl: o
                    })]
                })
            }
            od.propTypes = {
                translate: V().func.isRequired,
                intl: V().shape({
                    getRobloxLocale: V().func.isRequired
                }).isRequired
            };
            var op = window.CoreRobloxUtilities;

            function ov(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function om(t, n) {
                var r = function(t) {
                        if (Array.isArray(t)) return t
                    }(n) || function(t, n) {
                        var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                        if (null != a) {
                            var i = [],
                                l = !0,
                                c = !1;
                            try {
                                for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), i.length !== n); l = !0);
                            } catch (t) {
                                c = !0, o = t
                            } finally {
                                try {
                                    l || null == a.return || a.return()
                                } finally {
                                    if (c) throw o
                                }
                            }
                            return i
                        }
                    }(n, 2) || function(t, n) {
                        if (t) {
                            if ("string" == typeof t) return ov(t, 2);
                            var r = Object.prototype.toString.call(t).slice(8, -1);
                            if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                            if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ov(t, n)
                        }
                    }(n, 2) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    o = r[0];
                return Math.min(r[1], Math.max(o, t))
            }

            function oh(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function oy(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function og(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        oy(t, n, r[n])
                    })
                }
                return t
            }

            function ob(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function ow(t, n) {
                if (null == t) return {};
                var r, o, a = function(t, n) {
                    if (null == t) return {};
                    var r, o, a = {},
                        i = Object.keys(t);
                    for (o = 0; o < i.length; o++) r = i[o], n.indexOf(r) >= 0 || (a[r] = t[r]);
                    return a
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(t);
                    for (o = 0; o < i.length; o++) r = i[o], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (a[r] = t[r])
                }
                return a
            }

            function ox(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var i = [],
                            l = !0,
                            c = !1;
                        try {
                            for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            c = !0, o = t
                        } finally {
                            try {
                                l || null == a.return || a.return()
                            } finally {
                                if (c) throw o
                            }
                        }
                        return i
                    }
                }(t, n) || oO(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oS(t) {
                return function(t) {
                    if (Array.isArray(t)) return oh(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || oO(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oO(t, n) {
                if (t) {
                    if ("string" == typeof t) return oh(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oh(t, n)
                }
            }

            function oj() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                var o = n[0];
                if (1 === n.length) return o;
                var a = function() {
                    var t = n.map(function(t) {
                        return {
                            useScope: t(),
                            scopeName: t.scopeName
                        }
                    });
                    return function(n) {
                        var r = t.reduce(function(t, r) {
                            var o = r.useScope,
                                a = r.scopeName;
                            return og({}, t, o(n)["__scope".concat(a)])
                        }, {});
                        return Y.useMemo(function() {
                            return oy({}, "__scope".concat(o.scopeName), r)
                        }, [r])
                    }
                };
                return a.scopeName = o.scopeName, a
            }

            function oE(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }

            function oC() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return function(t) {
                    var r = !1,
                        o = n.map(function(n) {
                            var o = oE(n, t);
                            return r || "function" != typeof o || (r = !0), o
                        });
                    if (r) return function() {
                        for (var t = 0; t < o.length; t++) {
                            var r = o[t];
                            "function" == typeof r ? r() : oE(n[t], null)
                        }
                    }
                }
            }

            function oP() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return Y.useCallback(oC.apply(void 0, oS(n)), n)
            }

            function oA(t) {
                var n, r, o = (n = t, (r = Y.forwardRef(function(t, n) {
                        var r = t.children,
                            o = ow(t, ["children"]);
                        if (Y.isValidElement(r)) {
                            var a, i, l, c = (l = null == (a = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (i = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                u = function(t, n) {
                                    var r = og({}, n);
                                    for (var o in n) ! function(o) {
                                        var a = t[o],
                                            i = n[o];
                                        /^on[A-Z]/.test(o) ? a && i ? r[o] = function() {
                                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                            i.apply(void 0, oS(n)), a.apply(void 0, oS(n))
                                        } : a && (r[o] = a) : "style" === o ? r[o] = og({}, a, i) : "className" === o && (r[o] = [a, i].filter(Boolean).join(" "))
                                    }(o);
                                    return og({}, t, r)
                                }(o, r.props);
                            return r.type !== Y.Fragment && (u.ref = n ? oC(n, c) : c), Y.cloneElement(r, u)
                        }
                        return Y.Children.count(r) > 1 ? Y.Children.only(null) : null
                    })).displayName = "".concat(n, ".SlotClone"), r),
                    a = Y.forwardRef(function(t, n) {
                        var r = t.children,
                            a = ow(t, ["children"]),
                            i = Y.Children.toArray(r),
                            l = i.find(ok);
                        if (l) {
                            var c = l.props.children,
                                u = i.map(function(t) {
                                    return t === l ? Y.Children.count(c) > 1 ? Y.Children.only(null) : Y.isValidElement(c) ? c.props.children : null : t
                                });
                            return (0, T.jsx)(o, ob(og({}, a), {
                                ref: n,
                                children: Y.isValidElement(c) ? Y.cloneElement(c, void 0, u) : null
                            }))
                        }
                        return (0, T.jsx)(o, ob(og({}, a), {
                            ref: n,
                            children: r
                        }))
                    });
                return a.displayName = "".concat(t, ".Slot"), a
            }
            var oN = Symbol("radix.slottable");

            function ok(t) {
                return Y.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === oN
            }
            var oR = Y.createContext(void 0);

            function oD(t) {
                var n = Y.useContext(oR);
                return t || n || "ltr"
            }

            function oL(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function oT(t, n, r, o, a, i, l) {
                try {
                    var c = t[i](l),
                        u = c.value
                } catch (t) {
                    r(t);
                    return
                }
                c.done ? n(u) : Promise.resolve(u).then(o, a)
            }

            function oI(t) {
                return function() {
                    var n = this,
                        r = arguments;
                    return new Promise(function(o, a) {
                        var i = t.apply(n, r);

                        function l(t) {
                            oT(i, o, a, l, c, "next", t)
                        }

                        function c(t) {
                            oT(i, o, a, l, c, "throw", t)
                        }
                        l(void 0)
                    })
                }
            }

            function oM(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function o_(t, n) {
                return null != n && "undefined" != typeof Symbol && n[Symbol.hasInstance] ? !!n[Symbol.hasInstance](t) : t instanceof n
            }

            function oF(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        oM(t, n, r[n])
                    })
                }
                return t
            }

            function oW(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function oU(t, n) {
                if (null == t) return {};
                var r, o, a = function(t, n) {
                    if (null == t) return {};
                    var r, o, a = {},
                        i = Object.keys(t);
                    for (o = 0; o < i.length; o++) r = i[o], n.indexOf(r) >= 0 || (a[r] = t[r]);
                    return a
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(t);
                    for (o = 0; o < i.length; o++) r = i[o], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (a[r] = t[r])
                }
                return a
            }

            function oB(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var i = [],
                            l = !0,
                            c = !1;
                        try {
                            for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            c = !0, o = t
                        } finally {
                            try {
                                l || null == a.return || a.return()
                            } finally {
                                if (c) throw o
                            }
                        }
                        return i
                    }
                }(t, n) || oH(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oz(t) {
                return function(t) {
                    if (Array.isArray(t)) return oL(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || oH(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oV(t) {
                return t && "undefined" != typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t
            }

            function oH(t, n) {
                if (t) {
                    if ("string" == typeof t) return oL(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oL(t, n)
                }
            }

            function oK(t, n) {
                var r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & a[0]) throw a[1];
                            return a[1]
                        },
                        trys: [],
                        ops: []
                    },
                    l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                return l.next = c(0), l.throw = c(1), l.return = c(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                    return this
                }), l;

                function c(c) {
                    return function(u) {
                        var s = [c, u];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                            if (r = 1, o && (a = 2 & s[0] ? o.return : s[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, s[1])).done) return a;
                            switch (o = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                case 0:
                                case 1:
                                    a = s;
                                    break;
                                case 4:
                                    return i.label++, {
                                        value: s[1],
                                        done: !1
                                    };
                                case 5:
                                    i.label++, o = s[1], s = [0];
                                    continue;
                                case 7:
                                    s = i.ops.pop(), i.trys.pop();
                                    continue;
                                default:
                                    if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                        i = 0;
                                        continue
                                    }
                                    if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                        i.label = s[1];
                                        break
                                    }
                                    if (6 === s[0] && i.label < a[1]) {
                                        i.label = a[1], a = s;
                                        break
                                    }
                                    if (a && i.label < a[2]) {
                                        i.label = a[2], i.ops.push(s);
                                        break
                                    }
                                    a[2] && i.ops.pop(), i.trys.pop();
                                    continue
                            }
                            s = n.call(t, i)
                        } catch (t) {
                            s = [6, t], o = 0
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
            var oX = ["top", "right", "bottom", "left"],
                oq = Math.min,
                oG = Math.max,
                oY = Math.round,
                oZ = Math.floor,
                o$ = function(t) {
                    return {
                        x: t,
                        y: t
                    }
                },
                oQ = {
                    left: "right",
                    right: "left",
                    bottom: "top",
                    top: "bottom"
                };

            function oJ(t, n) {
                return "function" == typeof t ? t(n) : t
            }

            function o0(t) {
                return t.split("-")[0]
            }

            function o1(t) {
                return t.split("-")[1]
            }

            function o2(t) {
                return "x" === t ? "y" : "x"
            }

            function o3(t) {
                return "y" === t ? "height" : "width"
            }

            function o5(t) {
                var n = t[0];
                return "t" === n || "b" === n ? "y" : "x"
            }

            function o4(t) {
                return t.includes("start") ? t.replace("start", "end") : t.replace("end", "start")
            }
            var o6 = ["left", "right"],
                o8 = ["right", "left"],
                o7 = ["top", "bottom"],
                o9 = ["bottom", "top"];

            function ae(t) {
                var n = o0(t);
                return oQ[n] + t.slice(n.length)
            }

            function at(t) {
                var n, r, o, a;
                return "number" != typeof t ? {
                    top: null != (n = t.top) ? n : 0,
                    right: null != (r = t.right) ? r : 0,
                    bottom: null != (o = t.bottom) ? o : 0,
                    left: null != (a = t.left) ? a : 0
                } : {
                    top: t,
                    right: t,
                    bottom: t,
                    left: t
                }
            }

            function an(t) {
                var n = t.x,
                    r = t.y,
                    o = t.width,
                    a = t.height;
                return {
                    width: o,
                    height: a,
                    top: r,
                    left: n,
                    right: n + o,
                    bottom: r + a,
                    x: n,
                    y: r
                }
            }

            function ar(t, n, r) {
                var o, a = t.reference,
                    i = t.floating,
                    l = o5(n),
                    c = o2(o5(n)),
                    u = o3(c),
                    s = o0(n),
                    f = "y" === l,
                    d = a.x + a.width / 2 - i.width / 2,
                    p = a.y + a.height / 2 - i.height / 2,
                    v = a[u] / 2 - i[u] / 2;
                switch (s) {
                    case "top":
                        o = {
                            x: d,
                            y: a.y - i.height
                        };
                        break;
                    case "bottom":
                        o = {
                            x: d,
                            y: a.y + a.height
                        };
                        break;
                    case "right":
                        o = {
                            x: a.x + a.width,
                            y: p
                        };
                        break;
                    case "left":
                        o = {
                            x: a.x - i.width,
                            y: p
                        };
                        break;
                    default:
                        o = {
                            x: a.x,
                            y: a.y
                        }
                }
                switch (o1(n)) {
                    case "start":
                        o[c] -= v * (r && f ? -1 : 1);
                        break;
                    case "end":
                        o[c] += v * (r && f ? -1 : 1)
                }
                return o
            }

            function ao(t, n) {
                return oI(function() {
                    var r, o, a, i, l, c, u, s, f, d, p, v, m, h, y, g, b, w, x, S, O, j, E, C, P, A, N, k, R, D, L;
                    return oK(this, function(T) {
                        switch (T.label) {
                            case 0:
                                return void 0 === n && (n = {}), o = t.x, a = t.y, i = t.platform, l = t.rects, c = t.elements, u = t.strategy, d = void 0 === (f = (s = oJ(n, t)).boundary) ? "clippingAncestors" : f, v = void 0 === (p = s.rootBoundary) ? "viewport" : p, h = void 0 === (m = s.elementContext) ? "floating" : m, g = void 0 !== (y = s.altBoundary) && y, w = at(void 0 === (b = s.padding) ? 0 : b), x = c[g ? "floating" === h ? "reference" : "floating" : h], P = i.getClippingRect, A = {}, k = null, [4, null == i.isElement ? void 0 : i.isElement(x)];
                            case 1:
                                if (!(k == (r = T.sent()) || r)) return [3, 2];
                                return N = x, [3, 5];
                            case 2:
                                if (R = x.contextElement) return [3, 4];
                                return [4, null == i.getDocumentElement ? void 0 : i.getDocumentElement(c.floating)];
                            case 3:
                                R = T.sent(), T.label = 4;
                            case 4:
                                N = R, T.label = 5;
                            case 5:
                                return [4, P.apply(i, [(A.element = N, A.boundary = d, A.rootBoundary = v, A.strategy = u, A)])];
                            case 6:
                                return S = an.apply(void 0, [T.sent()]), O = "floating" === h ? {
                                    x: o,
                                    y: a,
                                    width: l.floating.width,
                                    height: l.floating.height
                                } : l.reference, [4, null == i.getOffsetParent ? void 0 : i.getOffsetParent(c.floating)];
                            case 7:
                                return j = T.sent(), [4, null == i.isElement ? void 0 : i.isElement(j)];
                            case 8:
                                if (!(D = T.sent())) return [3, 10];
                                return [4, null == i.getScale ? void 0 : i.getScale(j)];
                            case 9:
                                D = T.sent(), T.label = 10;
                            case 10:
                                if (E = D || {
                                        x: 1,
                                        y: 1
                                    }, !i.convertOffsetParentRelativeRectToViewportRelativeRect) return [3, 12];
                                return [4, i.convertOffsetParentRelativeRectToViewportRelativeRect({
                                    elements: c,
                                    rect: O,
                                    offsetParent: j,
                                    strategy: u
                                })];
                            case 11:
                                return L = T.sent(), [3, 13];
                            case 12:
                                L = O, T.label = 13;
                            case 13:
                                return C = an.apply(void 0, [L]), [2, {
                                    top: (S.top - C.top + w.top) / E.y,
                                    bottom: (C.bottom - S.bottom + w.bottom) / E.y,
                                    left: (S.left - C.left + w.left) / E.x,
                                    right: (C.right - S.right + w.right) / E.x
                                }]
                        }
                    })
                })()
            }

            function aa(t, n) {
                return {
                    top: t.top - n.height,
                    right: t.right - n.width,
                    bottom: t.bottom - n.height,
                    left: t.left - n.width
                }
            }

            function ai(t) {
                return oX.some(function(n) {
                    return t[n] >= 0
                })
            }
            var al = new Set(["left", "top"]);

            function ac() {
                return "undefined" != typeof window
            }

            function au(t) {
                return ad(t) ? (t.nodeName || "").toLowerCase() : "#document"
            }

            function as(t) {
                var n;
                return (null == t || null == (n = t.ownerDocument) ? void 0 : n.defaultView) || window
            }

            function af(t) {
                var n;
                return null == (n = (ad(t) ? t.ownerDocument : t.document) || window.document) ? void 0 : n.documentElement
            }

            function ad(t) {
                return !!ac() && (o_(t, Node) || o_(t, as(t).Node))
            }

            function ap(t) {
                return !!ac() && (o_(t, Element) || o_(t, as(t).Element))
            }

            function av(t) {
                return !!ac() && (o_(t, HTMLElement) || o_(t, as(t).HTMLElement))
            }

            function am(t) {
                return !(!ac() || "undefined" == typeof ShadowRoot) && (o_(t, ShadowRoot) || o_(t, as(t).ShadowRoot))
            }

            function ah(t) {
                var n = aj(t),
                    r = n.overflow,
                    o = n.overflowX,
                    a = n.overflowY,
                    i = n.display;
                return /auto|scroll|overlay|hidden|clip/.test(r + a + o) && "inline" !== i && "contents" !== i
            }

            function ay(t) {
                try {
                    if (t.matches(":popover-open")) return !0
                } catch (t) {}
                try {
                    return t.matches(":modal")
                } catch (t) {
                    return !1
                }
            }
            var ag = /transform|translate|scale|rotate|perspective|filter/,
                ab = /paint|layout|strict|content/,
                aw = function(t) {
                    return !!t && "none" !== t
                };

            function ax(t) {
                var n = ap(t) ? aj(t) : t;
                return aw(n.transform) || aw(n.translate) || aw(n.scale) || aw(n.rotate) || aw(n.perspective) || !aS() && (aw(n.backdropFilter) || aw(n.filter)) || ag.test(n.willChange || "") || ab.test(n.contain || "")
            }

            function aS() {
                return null == lm && (lm = "undefined" != typeof CSS && CSS.supports && CSS.supports("-webkit-backdrop-filter", "none")), lm
            }

            function aO(t) {
                return /^(html|body|#document)$/.test(au(t))
            }

            function aj(t) {
                return as(t).getComputedStyle(t)
            }

            function aE(t) {
                return ap(t) ? {
                    scrollLeft: t.scrollLeft,
                    scrollTop: t.scrollTop
                } : {
                    scrollLeft: t.scrollX,
                    scrollTop: t.scrollY
                }
            }

            function aC(t) {
                if ("html" === au(t)) return t;
                var n = t.assignedSlot || t.parentNode || am(t) && t.host || af(t);
                return am(n) ? n.host : n
            }

            function aP(t, n, r) {
                void 0 === n && (n = []), void 0 === r && (r = !0);
                var o, a = function t(n) {
                        var r = aC(n);
                        return aO(r) ? (n.ownerDocument || n).body : av(r) && ah(r) ? r : t(r)
                    }(t),
                    i = a === (null == (o = t.ownerDocument) ? void 0 : o.body),
                    l = as(a);
                if (i) {
                    var c = aA(l);
                    return n.concat(l, l.visualViewport || [], ah(a) ? a : [], c && r ? aP(c) : [])
                }
                return n.concat(a, aP(a, [], r))
            }

            function aA(t) {
                return t.parent && Object.getPrototypeOf(t.parent) ? t.frameElement : null
            }

            function aN(t) {
                var n = aj(t),
                    r = parseFloat(n.width) || 0,
                    o = parseFloat(n.height) || 0,
                    a = av(t),
                    i = a ? t.offsetWidth : r,
                    l = a ? t.offsetHeight : o,
                    c = oY(r) !== i || oY(o) !== l;
                return c && (r = i, o = l), {
                    width: r,
                    height: o,
                    $: c
                }
            }

            function ak(t) {
                return ap(t) ? t : t.contextElement
            }

            function aR(t) {
                var n = ak(t);
                if (!av(n)) return o$(1);
                var r = n.getBoundingClientRect(),
                    o = aN(n),
                    a = o.width,
                    i = o.height,
                    l = o.$,
                    c = (l ? oY(r.width) : r.width) / a,
                    u = (l ? oY(r.height) : r.height) / i;
                return c && Number.isFinite(c) || (c = 1), u && Number.isFinite(u) || (u = 1), {
                    x: c,
                    y: u
                }
            }
            var aD = o$(0);

            function aL(t) {
                var n = as(t);
                return aS() && n.visualViewport ? {
                    x: n.visualViewport.offsetLeft,
                    y: n.visualViewport.offsetTop
                } : aD
            }

            function aT(t, n, r, o) {
                void 0 === n && (n = !1), void 0 === r && (r = !1);
                var a, i = t.getBoundingClientRect(),
                    l = ak(t),
                    c = o$(1);
                n && (o ? ap(o) && (c = aR(o)) : c = aR(t));
                var u = (void 0 === (a = r) && (a = !1), !(!o || a && o !== as(l)) && a) ? aL(l) : o$(0),
                    s = (i.left + u.x) / c.x,
                    f = (i.top + u.y) / c.y,
                    d = i.width / c.x,
                    p = i.height / c.y;
                if (l)
                    for (var v = as(l), m = o && ap(o) ? as(o) : o, h = v, y = aA(h); y && o && m !== h;) {
                        var g = aR(y),
                            b = y.getBoundingClientRect(),
                            w = aj(y),
                            x = b.left + (y.clientLeft + parseFloat(w.paddingLeft)) * g.x,
                            S = b.top + (y.clientTop + parseFloat(w.paddingTop)) * g.y;
                        s *= g.x, f *= g.y, d *= g.x, p *= g.y, s += x, f += S, y = aA(h = as(y))
                    }
                return an({
                    width: d,
                    height: p,
                    x: s,
                    y: f
                })
            }

            function aI(t, n) {
                var r = aE(t).scrollLeft;
                return n ? n.left + r : aT(af(t)).left + r
            }

            function aM(t, n, r) {
                void 0 === r && (r = !1);
                var o = t.getBoundingClientRect();
                return {
                    x: o.left + n.scrollLeft - (r ? 0 : aI(t, o)),
                    y: o.top + n.scrollTop
                }
            }
            var a_ = new Set(["absolute", "fixed"]);

            function aF(t, n, r) {
                if ("viewport" === n) o = function(t, n) {
                    var r = as(t),
                        o = af(t),
                        a = r.visualViewport,
                        i = o.clientWidth,
                        l = o.clientHeight,
                        c = 0,
                        u = 0;
                    if (a) {
                        i = a.width, l = a.height;
                        var s = aS();
                        (!s || s && "fixed" === n) && (c = a.offsetLeft, u = a.offsetTop)
                    }
                    return {
                        width: i,
                        height: l,
                        x: c,
                        y: u
                    }
                }(t, r);
                else if ("document" === n) a = af(t), i = af(a), l = aE(a), c = a.ownerDocument.body, u = oG(i.scrollWidth, i.clientWidth, c.scrollWidth, c.clientWidth), s = oG(i.scrollHeight, i.clientHeight, c.scrollHeight, c.clientHeight), f = -l.scrollLeft + aI(a), d = -l.scrollTop, "rtl" === aj(c).direction && (f += oG(i.clientWidth, c.clientWidth) - u), o = {
                    width: u,
                    height: s,
                    x: f,
                    y: d
                };
                else if (ap(n)) v = (p = aT(n, !0, "fixed" === r)).top + n.clientTop, m = p.left + n.clientLeft, h = av(n) ? aR(n) : o$(1), o = {
                    width: n.clientWidth * h.x,
                    height: n.clientHeight * h.y,
                    x: m * h.x,
                    y: v * h.y
                };
                else {
                    var o, a, i, l, c, u, s, f, d, p, v, m, h, y = aL(t);
                    o = {
                        x: n.x - y.x,
                        y: n.y - y.y,
                        width: n.width,
                        height: n.height
                    }
                }
                return an(o)
            }

            function aW(t, n, r) {
                var o = av(n),
                    a = af(n),
                    i = "fixed" === r,
                    l = aT(t, !0, i, n),
                    c = {
                        scrollLeft: 0,
                        scrollTop: 0
                    },
                    u = o$(0);
                if (o || !o && !i)
                    if (("body" !== au(n) || ah(a)) && (c = aE(n)), o) {
                        var s = aT(n, !0, i, n);
                        u.x = s.x + n.clientLeft, u.y = s.y + n.clientTop
                    } else a && (u.x = aI(a));
                i && !o && a && (u.x = aI(a));
                var f = !a || o || i ? o$(0) : aM(a, c);
                return {
                    x: l.left + c.scrollLeft - u.x - f.x,
                    y: l.top + c.scrollTop - u.y - f.y,
                    width: l.width,
                    height: l.height
                }
            }

            function aU(t) {
                return "static" === aj(t).position
            }

            function aB(t, n) {
                if (!av(t) || "fixed" === aj(t).position) return null;
                if (n) return n(t);
                var r = t.offsetParent;
                return af(t) === r && (r = r.ownerDocument.body), r
            }

            function az(t, n) {
                var r, o = as(t);
                if (ay(t)) return o;
                if (!av(t)) {
                    for (var a = aC(t); a && !aO(a);) {
                        if (ap(a) && !aU(a)) return a;
                        a = aC(a)
                    }
                    return o
                }
                for (var i = aB(t, n); i && (r = i, /^(table|td|th)$/.test(au(r))) && aU(i);) i = aB(i, n);
                return i && aO(i) && aU(i) && !ax(i) ? o : i || function(t) {
                    for (var n = aC(t); av(n) && !aO(n);) {
                        if (ax(n)) return n;
                        if (ay(n)) break;
                        n = aC(n)
                    }
                    return null
                }(t) || o
            }
            var aV = {
                convertOffsetParentRelativeRectToViewportRelativeRect: function(t) {
                    var n = t.elements,
                        r = t.rect,
                        o = t.offsetParent,
                        a = "fixed" === t.strategy,
                        i = af(o),
                        l = !!n && ay(n.floating);
                    if (o === i || l && a) return r;
                    var c = {
                            scrollLeft: 0,
                            scrollTop: 0
                        },
                        u = o$(1),
                        s = o$(0),
                        f = av(o);
                    if ((f || !f && !a) && (("body" !== au(o) || ah(i)) && (c = aE(o)), av(o))) {
                        var d = aT(o);
                        u = aR(o), s.x = d.x + o.clientLeft, s.y = d.y + o.clientTop
                    }
                    var p = !i || f || a ? o$(0) : aM(i, c, !0);
                    return {
                        width: r.width * u.x,
                        height: r.height * u.y,
                        x: r.x * u.x - c.scrollLeft * u.x + s.x + p.x,
                        y: r.y * u.y - c.scrollTop * u.y + s.y + p.y
                    }
                },
                getDocumentElement: af,
                getClippingRect: function(t) {
                    var n = t.element,
                        r = t.boundary,
                        o = t.rootBoundary,
                        a = t.strategy,
                        i = oz("clippingAncestors" === r ? ay(n) ? [] : function(t, n) {
                            var r = n.get(t);
                            if (r) return r;
                            for (var o = aP(t, [], !1).filter(function(t) {
                                    return ap(t) && "body" !== au(t)
                                }), a = null, i = "fixed" === aj(t).position, l = i ? aC(t) : t; ap(l) && !aO(l);) {
                                var c = aj(l),
                                    u = ax(l);
                                u || "fixed" !== c.position || (a = null), (i ? !u && !a : !u && "static" === c.position && a && a_.has(a.position) || ah(l) && !u && function t(n, r) {
                                    var o = aC(n);
                                    return !(o === r || !ap(o) || aO(o)) && ("fixed" === aj(o).position || t(o, r))
                                }(t, l)) ? o = o.filter(function(t) {
                                    return t !== l
                                }) : a = c, l = aC(l)
                            }
                            return n.set(t, o), o
                        }(n, this._c) : [].concat(r)).concat([o]),
                        l = i[0],
                        c = i.reduce(function(t, r) {
                            var o = aF(n, r, a);
                            return t.top = oG(o.top, t.top), t.right = oq(o.right, t.right), t.bottom = oq(o.bottom, t.bottom), t.left = oG(o.left, t.left), t
                        }, aF(n, l, a));
                    return {
                        width: c.right - c.left,
                        height: c.bottom - c.top,
                        x: c.left,
                        y: c.top
                    }
                },
                getOffsetParent: az,
                getElementRects: function(t) {
                    return oI(function() {
                        var n, r, o, a;
                        return oK(this, function(i) {
                            switch (i.label) {
                                case 0:
                                    return n = this.getOffsetParent || az, [4, (0, this.getDimensions)(t.floating)];
                                case 1:
                                    return r = i.sent(), o = {}, a = [t.reference], [4, n(t.floating)];
                                case 2:
                                    return [2, (o.reference = aW.apply(void 0, a.concat([i.sent(), t.strategy])), o.floating = {
                                        x: 0,
                                        y: 0,
                                        width: r.width,
                                        height: r.height
                                    }, o)]
                            }
                        })
                    }).call(this)
                },
                getClientRects: function(t) {
                    return Array.from(t.getClientRects())
                },
                getDimensions: function(t) {
                    var n = aN(t);
                    return {
                        width: n.width,
                        height: n.height
                    }
                },
                getScale: aR,
                isElement: ap,
                isRTL: function(t) {
                    return "rtl" === aj(t).direction
                }
            };

            function aH(t, n) {
                return t.x === n.x && t.y === n.y && t.width === n.width && t.height === n.height
            }

            function aK(t, n, r, o) {
                void 0 === o && (o = {});
                var a = o.ancestorScroll,
                    i = void 0 === a || a,
                    l = o.ancestorResize,
                    c = void 0 === l || l,
                    u = o.elementResize,
                    s = void 0 === u ? "function" == typeof ResizeObserver : u,
                    f = o.layoutShift,
                    d = void 0 === f ? "function" == typeof IntersectionObserver : f,
                    p = o.animationFrame,
                    v = void 0 !== p && p,
                    m = ak(t),
                    h = i || c ? oz(m ? aP(m) : []).concat(oz(aP(n))) : [];
                h.forEach(function(t) {
                    i && t.addEventListener("scroll", r, {
                        passive: !0
                    }), c && t.addEventListener("resize", r)
                });
                var y, g = m && d ? function(t, n) {
                        var r, o = null,
                            a = af(t);

                        function i() {
                            var t;
                            clearTimeout(r), null == (t = o) || t.disconnect(), o = null
                        }
                        return function l(c, u) {
                            void 0 === c && (c = !1), void 0 === u && (u = 1), i();
                            var s = t.getBoundingClientRect(),
                                f = s.left,
                                d = s.top,
                                p = s.width,
                                v = s.height;
                            if (c || n(), p && v) {
                                var m = {
                                        rootMargin: -oZ(d) + "px " + -oZ(a.clientWidth - (f + p)) + "px " + -oZ(a.clientHeight - (d + v)) + "px " + -oZ(f) + "px",
                                        threshold: oG(0, oq(1, u)) || 1
                                    },
                                    h = !0;
                                try {
                                    o = new IntersectionObserver(y, oW(oF({}, m), {
                                        root: a.ownerDocument
                                    }))
                                } catch (t) {
                                    o = new IntersectionObserver(y, m)
                                }
                                o.observe(t)
                            }

                            function y(n) {
                                var o = n[0].intersectionRatio;
                                if (o !== u) {
                                    if (!h) return l();
                                    o ? l(!1, o) : r = setTimeout(function() {
                                        l(!1, 1e-7)
                                    }, 1e3)
                                }
                                1 !== o || aH(s, t.getBoundingClientRect()) || l(), h = !1
                            }
                        }(!0), i
                    }(m, r) : null,
                    b = -1,
                    w = null;
                s && (w = new ResizeObserver(function(t) {
                    var o = oB(t, 1)[0];
                    o && o.target === m && w && (w.unobserve(n), cancelAnimationFrame(b), b = requestAnimationFrame(function() {
                        var t;
                        null == (t = w) || t.observe(n)
                    })), r()
                }), m && !v && w.observe(m), w.observe(n));
                var x = v ? aT(t) : null;
                return v && function n() {
                        var o = aT(t);
                        x && !aH(x, o) && r(), x = o, y = requestAnimationFrame(n)
                    }(), r(),
                    function() {
                        var t;
                        h.forEach(function(t) {
                            i && t.removeEventListener("scroll", r), c && t.removeEventListener("resize", r)
                        }), null == g || g(), null == (t = w) || t.disconnect(), w = null, v && cancelAnimationFrame(y)
                    }
            }
            var aX = function(t) {
                    return {
                        name: "arrow",
                        options: t,
                        fn: function(n) {
                            return oI(function() {
                                var r, o, a, i, l, c, u, s, f, d, p, v, m, h, y, g, b, w, x, S, O, j, E, C, P, A, N, k, R, D, L, T, I, M, _, F, W;
                                return oK(this, function(U) {
                                    switch (U.label) {
                                        case 0:
                                            if (r = n.x, o = n.y, a = n.placement, i = n.rects, l = n.platform, c = n.elements, u = n.middlewareData, f = (s = oJ(t, n) || {}).element, p = void 0 === (d = s.padding) ? 0 : d, null == f) return [2, {}];
                                            return v = at(p), m = {
                                                x: r,
                                                y: o
                                            }, y = o3(h = o2(o5(a))), [4, l.getDimensions(f)];
                                        case 1:
                                            return g = U.sent(), w = (b = "y" === h) ? "top" : "left", x = b ? "bottom" : "right", S = b ? "clientHeight" : "clientWidth", O = i.reference[y] + i.reference[h] - m[h] - i.floating[y], j = m[h] - i.reference[h], [4, null == l.getOffsetParent ? void 0 : l.getOffsetParent(f)];
                                        case 2:
                                            if (!(P = C = (E = U.sent()) ? E[S] : 0)) return [3, 4];
                                            return [4, null == l.isElement ? void 0 : l.isElement(E)];
                                        case 3:
                                            P = U.sent(), U.label = 4;
                                        case 4:
                                            return P || (C = c.floating[S] || i.floating[y]), A = O / 2 - j / 2, N = C / 2 - g[y] / 2 - 1, k = oq(v[w], N), R = oq(v[x], N), D = k, L = C - g[y] - R, I = oG(D, oq(T = C / 2 - g[y] / 2 + A, L)), _ = (M = !u.arrow && null != o1(a) && T !== I && i.reference[y] / 2 - (T < D ? k : R) - g[y] / 2 < 0) ? T < D ? T - D : T - L : 0, [2, (oM(W = {}, h, m[h] + _), oM(W, "data", oF((oM(F = {}, h, I), oM(F, "centerOffset", T - I - _), F), M && {
                                                alignmentOffset: _
                                            })), oM(W, "reset", M), W)]
                                    }
                                })
                            })()
                        }
                    }
                },
                aq = function(t, n, r) {
                    var o, a = new Map,
                        i = oF({
                            platform: aV
                        }, r),
                        l = oW(oF({}, i.platform), {
                            _c: a
                        });
                    return o = oW(oF({}, i), {
                        platform: l
                    }), oI(function() {
                        var r, a, i, l, c, u, s, f, d, p, v, m, h, y, g, b, w, x, S, O, j, E, C, P, A, N;
                        return oK(this, function(k) {
                            switch (k.label) {
                                case 0:
                                    return a = void 0 === (r = o.placement) ? "bottom" : r, l = void 0 === (i = o.strategy) ? "absolute" : i, u = void 0 === (c = o.middleware) ? [] : c, s = o.platform, f = u.filter(Boolean), [4, null == s.isRTL ? void 0 : s.isRTL(n)];
                                case 1:
                                    return d = k.sent(), [4, s.getElementRects({
                                        reference: t,
                                        floating: n,
                                        strategy: l
                                    })];
                                case 2:
                                    m = (v = ar(p = k.sent(), a, d)).x, h = v.y, y = a, g = {}, b = 0, w = 0, k.label = 3;
                                case 3:
                                    if (!(w < f.length)) return [3, 12];
                                    return S = (x = f[w]).name, [4, (0, x.fn)({
                                        x: m,
                                        y: h,
                                        initialPlacement: a,
                                        placement: y,
                                        strategy: l,
                                        middlewareData: g,
                                        rects: p,
                                        platform: s,
                                        elements: {
                                            reference: t,
                                            floating: n
                                        }
                                    })];
                                case 4:
                                    if (j = (O = k.sent()).x, E = O.y, C = O.data, P = O.reset, m = null != j ? j : m, h = null != E ? E : h, g = oW(oF({}, g), oM({}, S, oF({}, g[S], C))), !(P && b <= 50)) return [3, 10];
                                    if (b++, "object" != (void 0 === P ? "undefined" : oV(P))) return [3, 9];
                                    if (P.placement && (y = P.placement), !P.rects) return [3, 8];
                                    if (!0 !== P.rects) return [3, 6];
                                    return [4, s.getElementRects({
                                        reference: t,
                                        floating: n,
                                        strategy: l
                                    })];
                                case 5:
                                    return N = k.sent(), [3, 7];
                                case 6:
                                    N = P.rects, k.label = 7;
                                case 7:
                                    p = N, k.label = 8;
                                case 8:
                                    m = (A = ar(p, y, d)).x, h = A.y, k.label = 9;
                                case 9:
                                    w = -1, k.label = 10;
                                case 10:
                                    k.label = 11;
                                case 11:
                                    return w++, [3, 3];
                                case 12:
                                    return [2, {
                                        x: m,
                                        y: h,
                                        placement: y,
                                        strategy: l,
                                        middlewareData: g
                                    }]
                            }
                        })
                    })()
                },
                aG = "undefined" != typeof document ? Y.useLayoutEffect : function() {};

            function aY(t, n) {
                if (t === n) return !0;
                if ((void 0 === t ? "undefined" : oV(t)) != (void 0 === n ? "undefined" : oV(n))) return !1;
                if ("function" == typeof t && t.toString() === n.toString()) return !0;
                if (t && n && "object" == (void 0 === t ? "undefined" : oV(t))) {
                    if (Array.isArray(t)) {
                        if ((r = t.length) !== n.length) return !1;
                        for (o = r; 0 != o--;)
                            if (!aY(t[o], n[o])) return !1;
                        return !0
                    }
                    if ((r = (a = Object.keys(t)).length) !== Object.keys(n).length) return !1;
                    for (o = r; 0 != o--;)
                        if (!({}).hasOwnProperty.call(n, a[o])) return !1;
                    for (o = r; 0 != o--;) {
                        var r, o, a, i = a[o];
                        if (("_owner" !== i || !t.$$typeof) && !aY(t[i], n[i])) return !1
                    }
                    return !0
                }
                return t != t && n != n
            }

            function aZ(t) {
                return "undefined" == typeof window ? 1 : (t.ownerDocument.defaultView || window).devicePixelRatio || 1
            }

            function a$(t, n) {
                var r = aZ(t);
                return Math.round(n * r) / r
            }

            function aQ(t) {
                var n = Y.useRef(t);
                return aG(function() {
                    n.current = t
                }), n
            }

            function aJ(t) {
                void 0 === t && (t = {});
                var n = t.placement,
                    r = void 0 === n ? "bottom" : n,
                    o = t.strategy,
                    a = void 0 === o ? "absolute" : o,
                    i = t.middleware,
                    l = void 0 === i ? [] : i,
                    c = t.platform,
                    u = t.elements,
                    s = void 0 === u ? {} : u,
                    f = s.reference,
                    d = s.floating,
                    p = t.transform,
                    v = void 0 === p || p,
                    m = t.whileElementsMounted,
                    h = t.open,
                    y = oB(Y.useState({
                        x: 0,
                        y: 0,
                        strategy: a,
                        placement: r,
                        middlewareData: {},
                        isPositioned: !1
                    }), 2),
                    g = y[0],
                    b = y[1],
                    w = oB(Y.useState(l), 2),
                    x = w[0],
                    S = w[1];
                aY(x, l) || S(l);
                var O = oB(Y.useState(null), 2),
                    j = O[0],
                    E = O[1],
                    C = oB(Y.useState(null), 2),
                    P = C[0],
                    A = C[1],
                    N = Y.useCallback(function(t) {
                        t !== L.current && (L.current = t, E(t))
                    }, []),
                    k = Y.useCallback(function(t) {
                        t !== T.current && (T.current = t, A(t))
                    }, []),
                    R = f || j,
                    D = d || P,
                    L = Y.useRef(null),
                    T = Y.useRef(null),
                    I = Y.useRef(g),
                    M = null != m,
                    _ = aQ(m),
                    F = aQ(c),
                    W = aQ(h),
                    U = Y.useCallback(function() {
                        if (L.current && T.current) {
                            var t = {
                                placement: r,
                                strategy: a,
                                middleware: x
                            };
                            F.current && (t.platform = F.current), aq(L.current, T.current, t).then(function(t) {
                                var n = oW(oF({}, t), {
                                    isPositioned: !1 !== W.current
                                });
                                B.current && !aY(I.current, n) && (I.current = n, eG.flushSync(function() {
                                    b(n)
                                }))
                            })
                        }
                    }, [x, r, a, F, W]);
                aG(function() {
                    !1 === h && I.current.isPositioned && (I.current.isPositioned = !1, b(function(t) {
                        return oW(oF({}, t), {
                            isPositioned: !1
                        })
                    }))
                }, [h]);
                var B = Y.useRef(!1);
                aG(function() {
                    return B.current = !0,
                        function() {
                            B.current = !1
                        }
                }, []), aG(function() {
                    if (R && (L.current = R), D && (T.current = D), R && D) {
                        if (_.current) return _.current(R, D, U);
                        U()
                    }
                }, [R, D, U, _, M]);
                var z = Y.useMemo(function() {
                        return {
                            reference: L,
                            floating: T,
                            setReference: N,
                            setFloating: k
                        }
                    }, [N, k]),
                    V = Y.useMemo(function() {
                        return {
                            reference: R,
                            floating: D
                        }
                    }, [R, D]),
                    H = Y.useMemo(function() {
                        var t = {
                            position: a,
                            left: 0,
                            top: 0
                        };
                        if (!V.floating) return t;
                        var n = a$(V.floating, g.x),
                            r = a$(V.floating, g.y);
                        return v ? oF(oW(oF({}, t), {
                            transform: "translate(" + n + "px, " + r + "px)"
                        }), aZ(V.floating) >= 1.5 && {
                            willChange: "transform"
                        }) : {
                            position: a,
                            left: n,
                            top: r
                        }
                    }, [a, v, V.floating, g.x, g.y]);
                return Y.useMemo(function() {
                    return oW(oF({}, g), {
                        update: U,
                        refs: z,
                        elements: V,
                        floatingStyles: H
                    })
                }, [g, U, z, V, H])
            }
            var a0 = function(t, n) {
                    var r;
                    return oW(oF({}, (void 0 === (r = t) && (r = 0), {
                        name: "offset",
                        options: r,
                        fn: function(t) {
                            return oI(function() {
                                var n, o, a, i, l, c, u;
                                return oK(this, function(s) {
                                    switch (s.label) {
                                        case 0:
                                            var f;
                                            return a = t.x, i = t.y, l = t.placement, c = t.middlewareData, [4, (f = r, oI(function() {
                                                var n, r, o, a, i, l, c, u, s, d, p, v, m, h;
                                                return oK(this, function(y) {
                                                    switch (y.label) {
                                                        case 0:
                                                            return n = t.placement, r = t.platform, o = t.elements, [4, null == r.isRTL ? void 0 : r.isRTL(o.floating)];
                                                        case 1:
                                                            return a = y.sent(), i = o0(n), l = o1(n), c = "y" === o5(n), u = al.has(i) ? -1 : 1, s = a && c ? -1 : 1, v = (p = "number" == typeof(d = oJ(f, t)) ? {
                                                                mainAxis: d,
                                                                crossAxis: 0,
                                                                alignmentAxis: null
                                                            } : {
                                                                mainAxis: d.mainAxis || 0,
                                                                crossAxis: d.crossAxis || 0,
                                                                alignmentAxis: d.alignmentAxis
                                                            }).mainAxis, m = p.crossAxis, h = p.alignmentAxis, [2, (l && "number" == typeof h && (m = "end" === l ? -1 * h : h), c ? {
                                                                x: m * s,
                                                                y: v * u
                                                            } : {
                                                                x: v * u,
                                                                y: m * s
                                                            })]
                                                    }
                                                })
                                            })())];
                                        case 1:
                                            return u = s.sent(), [2, l === (null == (n = c.offset) ? void 0 : n.placement) && null != (o = c.arrow) && o.alignmentOffset ? {} : {
                                                x: a + u.x,
                                                y: i + u.y,
                                                data: oW(oF({}, u), {
                                                    placement: l
                                                })
                                            }]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [t, n]
                    })
                },
                a1 = function(t, n) {
                    var r;
                    return oW(oF({}, (void 0 === (r = t) && (r = {}), {
                        name: "shift",
                        options: r,
                        fn: function(t) {
                            return oI(function() {
                                var n, o, a, i, l, c, u, s, f, d, p, v, m, h, y, g, b, w, x, S, O, j;
                                return oK(this, function(E) {
                                    switch (E.label) {
                                        case 0:
                                            return n = t.x, o = t.y, a = t.placement, c = void 0 === (l = (i = oJ(r, t)).mainAxis) || l, s = void 0 !== (u = i.crossAxis) && u, d = void 0 === (f = i.limiter) ? {
                                                fn: function(t) {
                                                    return {
                                                        x: t.x,
                                                        y: t.y
                                                    }
                                                }
                                            } : f, p = oU(i, ["mainAxis", "crossAxis", "limiter"]), v = {
                                                x: n,
                                                y: o
                                            }, [4, ao(t, p)];
                                        case 1:
                                            return m = E.sent(), g = v[y = o2(h = o5(o0(a)))], b = v[h], c && (w = "y" === y ? "bottom" : "right", g = oG(g + m["y" === y ? "top" : "left"], oq(g, g - m[w]))), s && (x = "y" === h ? "bottom" : "right", b = oG(b + m["y" === h ? "top" : "left"], oq(b, b - m[x]))), O = d.fn(oW(oF({}, t), (oM(S = {}, y, g), oM(S, h, b), S))), [2, oW(oF({}, O), {
                                                data: {
                                                    x: O.x - n,
                                                    y: O.y - o,
                                                    enabled: (oM(j = {}, y, c), oM(j, h, s), j)
                                                }
                                            })]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [t, n]
                    })
                },
                a2 = function(t, n) {
                    var r;
                    return oW(oF({}, (void 0 === (r = t) && (r = {}), {
                        options: r,
                        fn: function(t) {
                            var n, o = t.x,
                                a = t.y,
                                i = t.placement,
                                l = t.rects,
                                c = t.middlewareData,
                                u = oJ(r, t),
                                s = u.offset,
                                f = u.mainAxis,
                                d = u.crossAxis,
                                p = {
                                    x: o,
                                    y: a
                                },
                                v = o5(i),
                                m = o2(v),
                                h = p[m],
                                y = p[v],
                                g = oJ(void 0 === s ? 0 : s, t),
                                b = "number" == typeof g ? {
                                    mainAxis: g,
                                    crossAxis: 0
                                } : oF({
                                    mainAxis: 0,
                                    crossAxis: 0
                                }, g);
                            if (void 0 === f || f) {
                                var w = "y" === m ? "height" : "width",
                                    x = l.reference[m] - l.floating[w] + b.mainAxis,
                                    S = l.reference[m] + l.reference[w] - b.mainAxis;
                                h < x ? h = x : h > S && (h = S)
                            }
                            if (void 0 === d || d) {
                                var O, j, E = "y" === m ? "width" : "height",
                                    C = al.has(o0(i)),
                                    P = l.reference[v] - l.floating[E] + (C && (null == (O = c.offset) ? void 0 : O[v]) || 0) + (C ? 0 : b.crossAxis),
                                    A = l.reference[v] + l.reference[E] + (C ? 0 : (null == (j = c.offset) ? void 0 : j[v]) || 0) - (C ? b.crossAxis : 0);
                                y < P ? y = P : y > A && (y = A)
                            }
                            return oM(n = {}, m, h), oM(n, v, y), n
                        }
                    })), {
                        options: [t, n]
                    })
                },
                a3 = function(t, n) {
                    var r;
                    return oW(oF({}, (void 0 === (r = t) && (r = {}), {
                        name: "flip",
                        options: r,
                        fn: function(t) {
                            return oI(function() {
                                var n, o, a, i, l, c, u, s, f, d, p, v, m, h, y, g, b, w, x, S, O, j, E, C, P, A, N, k, R, D, L, T, I, M, _, F, W, U, B, z;
                                return oK(this, function(V) {
                                    var H, K, X, q, G, Y, Z, $, Q, J, ee, et, en, er, eo;
                                    switch (V.label) {
                                        case 0:
                                            if (i = t.placement, l = t.middlewareData, c = t.rects, u = t.initialPlacement, s = t.platform, f = t.elements, v = void 0 === (p = (d = oJ(r, t)).mainAxis) || p, h = void 0 === (m = d.crossAxis) || m, y = d.fallbackPlacements, b = void 0 === (g = d.fallbackStrategy) ? "bestFit" : g, x = void 0 === (w = d.fallbackAxisSideDirection) ? "none" : w, O = void 0 === (S = d.flipAlignment) || S, j = oU(d, ["mainAxis", "crossAxis", "fallbackPlacements", "fallbackStrategy", "fallbackAxisSideDirection", "flipAlignment"]), null != (o = l.arrow) && o.alignmentOffset) return [2, {}];
                                            return E = o0(i), C = o5(u), P = o0(u) === u, [4, null == s.isRTL ? void 0 : s.isRTL(f.floating)];
                                        case 1:
                                            return A = V.sent(), N = y || (P || !O ? [ae(u)] : (K = ae(H = u), [o4(H), K, o4(K)])), k = "none" !== x, !y && k && (n = N).push.apply(n, oz((X = u, q = O, G = x, Y = A, Z = o1(X), $ = function(t, n, r) {
                                                switch (t) {
                                                    case "top":
                                                    case "bottom":
                                                        return r ? n ? o8 : o6 : n ? o6 : o8;
                                                    case "left":
                                                    case "right":
                                                        return n ? o7 : o9;
                                                    default:
                                                        return []
                                                }
                                            }(o0(X), "start" === G, Y), Z && ($ = $.map(function(t) {
                                                return t + "-" + Z
                                            }), q && ($ = $.concat($.map(o4)))), $))), R = [u].concat(oz(N)), [4, ao(t, j)];
                                        case 2:
                                            if (D = V.sent(), L = [], T = (null == (a = l.flip) ? void 0 : a.overflows) || [], v && L.push(D[E]), h && (Q = i, J = c, void 0 === (ee = A) && (ee = !1), et = o1(Q), er = o3(en = o2(o5(Q))), eo = "x" === en ? et === (ee ? "end" : "start") ? "right" : "left" : "start" === et ? "bottom" : "top", J.reference[er] > J.floating[er] && (eo = ae(eo)), I = [eo, ae(eo)], L.push(D[I[0]], D[I[1]])), T = oz(T).concat([{
                                                    placement: i,
                                                    overflows: L
                                                }]), !L.every(function(t) {
                                                    return t <= 0
                                                })) {
                                                if ((W = R[F = ((null == (M = l.flip) ? void 0 : M.index) || 0) + 1]) && ("alignment" !== h || C === o5(W) || T.every(function(t) {
                                                        return o5(t.placement) !== C || t.overflows[0] > 0
                                                    }))) return [2, {
                                                    data: {
                                                        index: F,
                                                        overflows: T
                                                    },
                                                    reset: {
                                                        placement: W
                                                    }
                                                }];
                                                if (!(U = null == (_ = T.filter(function(t) {
                                                        return t.overflows[0] <= 0
                                                    }).sort(function(t, n) {
                                                        return t.overflows[1] - n.overflows[1]
                                                    })[0]) ? void 0 : _.placement)) switch (b) {
                                                    case "bestFit":
                                                        (z = null == (B = T.filter(function(t) {
                                                            if (k) {
                                                                var n = o5(t.placement);
                                                                return n === C || "y" === n
                                                            }
                                                            return !0
                                                        }).map(function(t) {
                                                            return [t.placement, t.overflows.filter(function(t) {
                                                                return t > 0
                                                            }).reduce(function(t, n) {
                                                                return t + n
                                                            }, 0)]
                                                        }).sort(function(t, n) {
                                                            return t[1] - n[1]
                                                        })[0]) ? void 0 : B[0]) && (U = z);
                                                        break;
                                                    case "initialPlacement":
                                                        U = u
                                                }
                                                if (i !== U) return [2, {
                                                    reset: {
                                                        placement: U
                                                    }
                                                }]
                                            }
                                            return [2, {}]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [t, n]
                    })
                },
                a5 = function(t, n) {
                    var r;
                    return oW(oF({}, (void 0 === (r = t) && (r = {}), {
                        name: "size",
                        options: r,
                        fn: function(t) {
                            return oI(function() {
                                var n, o, a, i, l, c, u, s, f, d, p, v, m, h, y, g, b, w, x, S, O, j, E, C, P, A, N, k, R, D;
                                return oK(this, function(L) {
                                    switch (L.label) {
                                        case 0:
                                            return a = t.placement, i = t.rects, l = t.platform, c = t.elements, f = void 0 === (s = (u = oJ(r, t)).apply) ? function() {} : s, [4, ao(t, oU(u, ["apply"]))];
                                        case 1:
                                            if (d = L.sent(), p = o0(a), v = o1(a), m = "y" === o5(a), y = (h = i.floating).width, g = h.height, "top" !== p && "bottom" !== p) return [3, 3];
                                            return b = p, [4, null == l.isRTL ? void 0 : l.isRTL(c.floating)];
                                        case 2:
                                            return w = v === (L.sent() ? "start" : "end") ? "left" : "right", [3, 4];
                                        case 3:
                                            w = p, b = "end" === v ? "top" : "bottom", L.label = 4;
                                        case 4:
                                            return x = g - d.top - d.bottom, S = y - d.left - d.right, O = oq(g - d[b], x), j = oq(y - d[w], S), E = !t.middlewareData.shift, C = O, P = j, null != (n = t.middlewareData.shift) && n.enabled.x && (P = S), null != (o = t.middlewareData.shift) && o.enabled.y && (C = x), E && !v && (A = oG(d.left, 0), N = oG(d.right, 0), k = oG(d.top, 0), R = oG(d.bottom, 0), m ? P = y - 2 * (0 !== A || 0 !== N ? A + N : oG(d.left, d.right)) : C = g - 2 * (0 !== k || 0 !== R ? k + R : oG(d.top, d.bottom))), [4, f(oW(oF({}, t), {
                                                availableWidth: P,
                                                availableHeight: C
                                            }))];
                                        case 5:
                                            return L.sent(), [4, l.getDimensions(c.floating)];
                                        case 6:
                                            return D = L.sent(), [2, y !== D.width || g !== D.height ? {
                                                reset: {
                                                    rects: !0
                                                }
                                            } : {}]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [t, n]
                    })
                },
                a4 = function(t, n) {
                    var r;
                    return oW(oF({}, (void 0 === (r = t) && (r = {}), {
                        name: "hide",
                        options: r,
                        fn: function(t) {
                            return oI(function() {
                                var n, o, a, i, l, c, u;
                                return oK(this, function(s) {
                                    switch (s.label) {
                                        case 0:
                                            switch (n = t.rects, i = void 0 === (a = (o = oJ(r, t)).strategy) ? "referenceHidden" : a, l = oU(o, ["strategy"]), i) {
                                                case "referenceHidden":
                                                    return [3, 1];
                                                case "escaped":
                                                    return [3, 3]
                                            }
                                            return [3, 5];
                                        case 1:
                                            return [4, ao(t, oW(oF({}, l), {
                                                elementContext: "reference"
                                            }))];
                                        case 2:
                                            return [2, {
                                                data: {
                                                    referenceHiddenOffsets: c = aa.apply(void 0, [s.sent(), n.reference]),
                                                    referenceHidden: ai(c)
                                                }
                                            }];
                                        case 3:
                                            return [4, ao(t, oW(oF({}, l), {
                                                altBoundary: !0
                                            }))];
                                        case 4:
                                            return [2, {
                                                data: {
                                                    escapedOffsets: u = aa.apply(void 0, [s.sent(), n.floating]),
                                                    escaped: ai(u)
                                                }
                                            }];
                                        case 5:
                                            return [2, {}];
                                        case 6:
                                            return [2]
                                    }
                                })
                            })()
                        }
                    })), {
                        options: [t, n]
                    })
                },
                a6 = function(t, n) {
                    return oW(oF({}, {
                        name: "arrow",
                        options: t,
                        fn: function(n) {
                            var r = "function" == typeof t ? t(n) : t,
                                o = r.element,
                                a = r.padding;
                            return o && ({}).hasOwnProperty.call(o, "current") ? null != o.current ? aX({
                                element: o.current,
                                padding: a
                            }).fn(n) : {} : o ? aX({
                                element: o,
                                padding: a
                            }).fn(n) : {}
                        }
                    }), {
                        options: [t, n]
                    })
                };

            function a8(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function a7(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function a9(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        a7(t, n, r[n])
                    })
                }
                return t
            }

            function ie(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function it(t, n) {
                if (null == t) return {};
                var r, o, a = function(t, n) {
                    if (null == t) return {};
                    var r, o, a = {},
                        i = Object.keys(t);
                    for (o = 0; o < i.length; o++) r = i[o], n.indexOf(r) >= 0 || (a[r] = t[r]);
                    return a
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(t);
                    for (o = 0; o < i.length; o++) r = i[o], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (a[r] = t[r])
                }
                return a
            }

            function ir(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var i = [],
                            l = !0,
                            c = !1;
                        try {
                            for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            c = !0, o = t
                        } finally {
                            try {
                                l || null == a.return || a.return()
                            } finally {
                                if (c) throw o
                            }
                        }
                        return i
                    }
                }(t, n) || ia(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function io(t) {
                return function(t) {
                    if (Array.isArray(t)) return a8(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || ia(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ia(t, n) {
                if (t) {
                    if ("string" == typeof t) return a8(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return a8(t, n)
                }
            }

            function ii(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }
            var il = Symbol("radix.slottable");

            function ic(t) {
                return Y.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === il
            }
            var iu = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                    var r, o, a, i, l, c = (o = r = "Primitive.".concat(n), (a = Y.forwardRef(function(t, n) {
                            var r = t.children,
                                o = it(t, ["children"]);
                            if (Y.isValidElement(r)) {
                                var a, i, l, c = (l = null == (a = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (i = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                    u = function(t, n) {
                                        var r = a9({}, n);
                                        for (var o in n) ! function(o) {
                                            var a = t[o],
                                                i = n[o];
                                            /^on[A-Z]/.test(o) ? a && i ? r[o] = function() {
                                                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                                i.apply(void 0, io(n)), a.apply(void 0, io(n))
                                            } : a && (r[o] = a) : "style" === o ? r[o] = a9({}, a, i) : "className" === o && (r[o] = [a, i].filter(Boolean).join(" "))
                                        }(o);
                                        return a9({}, t, r)
                                    }(o, r.props);
                                return r.type !== Y.Fragment && (u.ref = n ? function() {
                                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                    return function(t) {
                                        var r = !1,
                                            o = n.map(function(n) {
                                                var o = ii(n, t);
                                                return r || "function" != typeof o || (r = !0), o
                                            });
                                        if (r) return function() {
                                            for (var t = 0; t < o.length; t++) {
                                                var r = o[t];
                                                "function" == typeof r ? r() : ii(n[t], null)
                                            }
                                        }
                                    }
                                }(n, c) : c), Y.cloneElement(r, u)
                            }
                            return Y.Children.count(r) > 1 ? Y.Children.only(null) : null
                        })).displayName = "".concat(o, ".SlotClone"), i = a, (l = Y.forwardRef(function(t, n) {
                            var r = t.children,
                                o = it(t, ["children"]),
                                a = Y.Children.toArray(r),
                                l = a.find(ic);
                            if (l) {
                                var c = l.props.children,
                                    u = a.map(function(t) {
                                        return t === l ? Y.Children.count(c) > 1 ? Y.Children.only(null) : Y.isValidElement(c) ? c.props.children : null : t
                                    });
                                return (0, T.jsx)(i, ie(a9({}, o), {
                                    ref: n,
                                    children: Y.isValidElement(c) ? Y.cloneElement(c, void 0, u) : null
                                }))
                            }
                            return (0, T.jsx)(i, ie(a9({}, o), {
                                ref: n,
                                children: r
                            }))
                        })).displayName = "".concat(r, ".Slot"), l),
                        u = Y.forwardRef(function(t, r) {
                            var o = t.asChild,
                                a = it(t, ["asChild"]),
                                i = o ? c : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, T.jsx)(i, ie(a9({}, a), {
                                ref: r
                            }))
                        });
                    return u.displayName = "Primitive.".concat(n), ie(a9({}, t), a7({}, n, u))
                }, {}),
                is = Y.forwardRef(function(t, n) {
                    var r = t.children,
                        o = t.width,
                        a = t.height,
                        i = it(t, ["children", "width", "height"]);
                    return (0, T.jsx)(iu.svg, ie(a9({}, i), {
                        ref: n,
                        width: void 0 === o ? 10 : o,
                        height: void 0 === a ? 5 : a,
                        viewBox: "0 0 30 10",
                        preserveAspectRatio: "none",
                        children: t.asChild ? r : (0, T.jsx)("polygon", {
                            points: "0,0 30,0 15,10"
                        })
                    }))
                });

            function id(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }

            function ip() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return function(t) {
                    var r = !1,
                        o = n.map(function(n) {
                            var o = id(n, t);
                            return r || "function" != typeof o || (r = !0), o
                        });
                    if (r) return function() {
                        for (var t = 0; t < o.length; t++) {
                            var r = o[t];
                            "function" == typeof r ? r() : id(n[t], null)
                        }
                    }
                }
            }

            function iv() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return Y.useCallback(ip.apply(void 0, io(n)), n)
            }

            function im() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                var o = n[0];
                if (1 === n.length) return o;
                var a = function() {
                    var t = n.map(function(t) {
                        return {
                            useScope: t(),
                            scopeName: t.scopeName
                        }
                    });
                    return function(n) {
                        var r = t.reduce(function(t, r) {
                            var o = r.useScope,
                                a = r.scopeName;
                            return a9({}, t, o(n)["__scope".concat(a)])
                        }, {});
                        return Y.useMemo(function() {
                            return a7({}, "__scope".concat(o.scopeName), r)
                        }, [r])
                    }
                };
                return a.scopeName = o.scopeName, a
            }
            is.displayName = "Arrow";
            var ih = Symbol("radix.slottable");

            function iy(t) {
                return Y.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === ih
            }
            var ig = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                    var r, o, a, i, l, c = (o = r = "Primitive.".concat(n), (a = Y.forwardRef(function(t, n) {
                            var r = t.children,
                                o = it(t, ["children"]);
                            if (Y.isValidElement(r)) {
                                var a, i, l, c = (l = null == (a = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (i = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                    u = function(t, n) {
                                        var r = a9({}, n);
                                        for (var o in n) ! function(o) {
                                            var a = t[o],
                                                i = n[o];
                                            /^on[A-Z]/.test(o) ? a && i ? r[o] = function() {
                                                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                                i.apply(void 0, io(n)), a.apply(void 0, io(n))
                                            } : a && (r[o] = a) : "style" === o ? r[o] = a9({}, a, i) : "className" === o && (r[o] = [a, i].filter(Boolean).join(" "))
                                        }(o);
                                        return a9({}, t, r)
                                    }(o, r.props);
                                return r.type !== Y.Fragment && (u.ref = n ? ip(n, c) : c), Y.cloneElement(r, u)
                            }
                            return Y.Children.count(r) > 1 ? Y.Children.only(null) : null
                        })).displayName = "".concat(o, ".SlotClone"), i = a, (l = Y.forwardRef(function(t, n) {
                            var r = t.children,
                                o = it(t, ["children"]),
                                a = Y.Children.toArray(r),
                                l = a.find(iy);
                            if (l) {
                                var c = l.props.children,
                                    u = a.map(function(t) {
                                        return t === l ? Y.Children.count(c) > 1 ? Y.Children.only(null) : Y.isValidElement(c) ? c.props.children : null : t
                                    });
                                return (0, T.jsx)(i, ie(a9({}, o), {
                                    ref: n,
                                    children: Y.isValidElement(c) ? Y.cloneElement(c, void 0, u) : null
                                }))
                            }
                            return (0, T.jsx)(i, ie(a9({}, o), {
                                ref: n,
                                children: r
                            }))
                        })).displayName = "".concat(r, ".Slot"), l),
                        u = Y.forwardRef(function(t, r) {
                            var o = t.asChild,
                                a = it(t, ["asChild"]),
                                i = o ? c : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, T.jsx)(i, ie(a9({}, a), {
                                ref: r
                            }))
                        });
                    return u.displayName = "Primitive.".concat(n), ie(a9({}, t), a7({}, n, u))
                }, {}),
                ib = (null == (lh = globalThis) ? void 0 : lh.document) ? Y.useLayoutEffect : function() {},
                iw = "Popper",
                ix = ir(function(t) {
                    var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        o = function() {
                            var n = r.map(function(t) {
                                return Y.createContext(t)
                            });
                            return function(r) {
                                var o = (null == r ? void 0 : r[t]) || n;
                                return Y.useMemo(function() {
                                    return a7({}, "__scope".concat(t), ie(a9({}, r), a7({}, t, o)))
                                }, [r, o])
                            }
                        };
                    return o.scopeName = t, [function(n, o) {
                        var a = Y.createContext(o),
                            i = r.length;
                        r = io(r).concat([o]);
                        var l = function(n) {
                            var r, o = n.scope,
                                l = n.children,
                                c = it(n, ["scope", "children"]),
                                u = (null == o || null == (r = o[t]) ? void 0 : r[i]) || a,
                                s = Y.useMemo(function() {
                                    return c
                                }, Object.values(c));
                            return (0, T.jsx)(u.Provider, {
                                value: s,
                                children: l
                            })
                        };
                        return l.displayName = n + "Provider", [l, function(r, l) {
                            var c, u = (null == l || null == (c = l[t]) ? void 0 : c[i]) || a,
                                s = Y.useContext(u);
                            if (s) return s;
                            if (void 0 !== o) return o;
                            throw Error("`".concat(r, "` must be used within `").concat(n, "`"))
                        }]
                    }, im.apply(void 0, [o].concat(io(n)))]
                }(iw), 2),
                iS = ix[0],
                iO = ix[1],
                ij = ir(iS(iw), 2),
                iE = ij[0],
                iC = ij[1],
                iP = function(t) {
                    var n = t.__scopePopper,
                        r = t.children,
                        o = ir(Y.useState(null), 2),
                        a = o[0],
                        i = o[1];
                    return (0, T.jsx)(iE, {
                        scope: n,
                        anchor: a,
                        onAnchorChange: i,
                        children: r
                    })
                };
            iP.displayName = iw;
            var iA = "PopperAnchor",
                iN = Y.forwardRef(function(t, n) {
                    var r = t.__scopePopper,
                        o = t.virtualRef,
                        a = it(t, ["__scopePopper", "virtualRef"]),
                        i = iC(iA, r),
                        l = Y.useRef(null),
                        c = iv(n, l);
                    return Y.useEffect(function() {
                        i.onAnchorChange((null == o ? void 0 : o.current) || l.current)
                    }), o ? null : (0, T.jsx)(ig.div, ie(a9({}, a), {
                        ref: c
                    }))
                });
            iN.displayName = iA;
            var ik = "PopperContent",
                iR = ir(iS(ik), 2),
                iD = iR[0],
                iL = iR[1],
                iT = Y.forwardRef(function(t, n) {
                    var r, o, a, i, l, c, u, s, f, d, p, v, m = t.__scopePopper,
                        h = t.side,
                        y = t.sideOffset,
                        g = t.align,
                        b = void 0 === g ? "center" : g,
                        w = t.alignOffset,
                        x = t.arrowPadding,
                        S = t.avoidCollisions,
                        O = void 0 === S || S,
                        j = t.collisionBoundary,
                        E = void 0 === j ? [] : j,
                        C = t.collisionPadding,
                        P = void 0 === C ? 0 : C,
                        A = t.sticky,
                        N = t.hideWhenDetached,
                        k = t.updatePositionStrategy,
                        R = void 0 === k ? "optimized" : k,
                        D = t.onPlaced,
                        L = it(t, ["__scopePopper", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "avoidCollisions", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "updatePositionStrategy", "onPlaced"]),
                        I = iC(ik, m),
                        M = ir(Y.useState(null), 2),
                        _ = M[0],
                        F = M[1],
                        W = iv(n, function(t) {
                            return F(t)
                        }),
                        U = ir(Y.useState(null), 2),
                        B = U[0],
                        z = U[1],
                        V = (o = (r = ir(Y.useState(void 0), 2))[0], a = r[1], ib(function() {
                            if (B) {
                                a({
                                    width: B.offsetWidth,
                                    height: B.offsetHeight
                                });
                                var t = new ResizeObserver(function(t) {
                                    if (Array.isArray(t) && t.length) {
                                        var n, r, o = t[0];
                                        if ("borderBoxSize" in o) {
                                            var i = o.borderBoxSize,
                                                l = Array.isArray(i) ? i[0] : i;
                                            n = l.inlineSize, r = l.blockSize
                                        } else n = B.offsetWidth, r = B.offsetHeight;
                                        a({
                                            width: n,
                                            height: r
                                        })
                                    }
                                });
                                return t.observe(B, {
                                        box: "border-box"
                                    }),
                                    function() {
                                        return t.unobserve(B)
                                    }
                            }
                            a(void 0)
                        }, [B]), o),
                        H = null != (p = null == V ? void 0 : V.width) ? p : 0,
                        K = null != (v = null == V ? void 0 : V.height) ? v : 0,
                        X = "number" == typeof P ? P : a9({
                            top: 0,
                            right: 0,
                            bottom: 0,
                            left: 0
                        }, P),
                        q = Array.isArray(E) ? E : [E],
                        G = q.length > 0,
                        Z = {
                            padding: X,
                            boundary: q.filter(iF),
                            altBoundary: G
                        },
                        $ = aJ({
                            strategy: "fixed",
                            placement: (void 0 === h ? "bottom" : h) + ("center" !== b ? "-" + b : ""),
                            whileElementsMounted: function() {
                                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                return aK.apply(void 0, io(n).concat([{
                                    animationFrame: "always" === R
                                }]))
                            },
                            elements: {
                                reference: I.anchor
                            },
                            middleware: [a0({
                                mainAxis: (void 0 === y ? 0 : y) + K,
                                alignmentAxis: void 0 === w ? 0 : w
                            }), O && a1(a9({
                                mainAxis: !0,
                                crossAxis: !1,
                                limiter: "partial" === (void 0 === A ? "partial" : A) ? a2() : void 0
                            }, Z)), O && a3(a9({}, Z)), a5(ie(a9({}, Z), {
                                apply: function(t) {
                                    var n = t.elements,
                                        r = t.rects,
                                        o = t.availableWidth,
                                        a = t.availableHeight,
                                        i = r.reference,
                                        l = i.width,
                                        c = i.height,
                                        u = n.floating.style;
                                    u.setProperty("--radix-popper-available-width", "".concat(o, "px")), u.setProperty("--radix-popper-available-height", "".concat(a, "px")), u.setProperty("--radix-popper-anchor-width", "".concat(l, "px")), u.setProperty("--radix-popper-anchor-height", "".concat(c, "px"))
                                }
                            })), B && a6({
                                element: B,
                                padding: void 0 === x ? 0 : x
                            }), iW({
                                arrowWidth: H,
                                arrowHeight: K
                            }), void 0 !== N && N && a4(a9({
                                strategy: "referenceHidden"
                            }, Z))]
                        }),
                        Q = $.refs,
                        J = $.floatingStyles,
                        ee = $.placement,
                        et = $.isPositioned,
                        en = $.middlewareData,
                        er = ir(iU(ee), 2),
                        eo = er[0],
                        ea = er[1],
                        ei = (i = Y.useRef(D), Y.useEffect(function() {
                            i.current = D
                        }), Y.useMemo(function() {
                            return function() {
                                for (var t, n = arguments.length, r = Array(n), o = 0; o < n; o++) r[o] = arguments[o];
                                return null == (t = i.current) ? void 0 : t.call.apply(t, [i].concat(io(r)))
                            }
                        }, []));
                    ib(function() {
                        et && (null == ei || ei())
                    }, [et, ei]);
                    var el = null == (l = en.arrow) ? void 0 : l.x,
                        ec = null == (c = en.arrow) ? void 0 : c.y,
                        eu = 0 !== (null == (u = en.arrow) ? void 0 : u.centerOffset),
                        es = ir(Y.useState(), 2),
                        ef = es[0],
                        ed = es[1];
                    return ib(function() {
                        _ && ed(window.getComputedStyle(_).zIndex)
                    }, [_]), (0, T.jsx)("div", {
                        ref: Q.setFloating,
                        "data-radix-popper-content-wrapper": "",
                        style: a9(ie(a9({}, J), {
                            transform: et ? J.transform : "translate(0, -200%)",
                            minWidth: "max-content",
                            zIndex: ef,
                            "--radix-popper-transform-origin": [null == (s = en.transformOrigin) ? void 0 : s.x, null == (f = en.transformOrigin) ? void 0 : f.y].join(" ")
                        }), (null == (d = en.hide) ? void 0 : d.referenceHidden) && {
                            visibility: "hidden",
                            pointerEvents: "none"
                        }),
                        dir: t.dir,
                        children: (0, T.jsx)(iD, {
                            scope: m,
                            placedSide: eo,
                            onArrowChange: z,
                            arrowX: el,
                            arrowY: ec,
                            shouldHideArrow: eu,
                            children: (0, T.jsx)(ig.div, ie(a9({
                                "data-side": eo,
                                "data-align": ea
                            }, L), {
                                ref: W,
                                style: ie(a9({}, L.style), {
                                    animation: et ? void 0 : "none"
                                })
                            }))
                        })
                    })
                });
            iT.displayName = ik;
            var iI = "PopperArrow",
                iM = {
                    top: "bottom",
                    right: "left",
                    bottom: "top",
                    left: "right"
                },
                i_ = Y.forwardRef(function(t, n) {
                    var r, o = t.__scopePopper,
                        a = it(t, ["__scopePopper"]),
                        i = iL(iI, o),
                        l = iM[i.placedSide];
                    return (0, T.jsx)("span", {
                        ref: i.onArrowChange,
                        style: (a7(r = {
                            position: "absolute",
                            left: i.arrowX,
                            top: i.arrowY
                        }, l, 0), a7(r, "transformOrigin", {
                            top: "",
                            right: "0 0",
                            bottom: "center 0",
                            left: "100% 0"
                        } [i.placedSide]), a7(r, "transform", {
                            top: "translateY(100%)",
                            right: "translateY(50%) rotate(90deg) translateX(-50%)",
                            bottom: "rotate(180deg)",
                            left: "translateY(50%) rotate(-90deg) translateX(50%)"
                        } [i.placedSide]), a7(r, "visibility", i.shouldHideArrow ? "hidden" : void 0), r),
                        children: (0, T.jsx)(is, ie(a9({}, a), {
                            ref: n,
                            style: ie(a9({}, a.style), {
                                display: "block"
                            })
                        }))
                    })
                });

            function iF(t) {
                return null !== t
            }
            i_.displayName = iI;
            var iW = function(t) {
                return {
                    name: "transformOrigin",
                    options: t,
                    fn: function(n) {
                        var r, o, a, i, l, c = n.placement,
                            u = n.rects,
                            s = n.middlewareData,
                            f = 0 !== (null == (r = s.arrow) ? void 0 : r.centerOffset),
                            d = f ? 0 : t.arrowWidth,
                            p = f ? 0 : t.arrowHeight,
                            v = ir(iU(c), 2),
                            m = v[0],
                            h = {
                                start: "0%",
                                center: "50%",
                                end: "100%"
                            } [v[1]],
                            y = (null != (i = null == (o = s.arrow) ? void 0 : o.x) ? i : 0) + d / 2,
                            g = (null != (l = null == (a = s.arrow) ? void 0 : a.y) ? l : 0) + p / 2,
                            b = "",
                            w = "";
                        return "bottom" === m ? (b = f ? h : "".concat(y, "px"), w = -p + "px") : "top" === m ? (b = f ? h : "".concat(y, "px"), w = "".concat(u.floating.height + p, "px")) : "right" === m ? (b = -p + "px", w = f ? h : "".concat(g, "px")) : "left" === m && (b = "".concat(u.floating.width + p, "px"), w = f ? h : "".concat(g, "px")), {
                            data: {
                                x: b,
                                y: w
                            }
                        }
                    }
                }
            };

            function iU(t) {
                var n = ir(t.split("-"), 2),
                    r = n[0],
                    o = n[1];
                return [r, void 0 === o ? "center" : o]
            }
            var iB = 0,
                iz = function() {
                    var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "\xabr",
                        n = (0, Y.useRef)();
                    return n.current || (iB += 1, n.current = "".concat(t).concat(iB)), n.current
                };

            function iV(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function iH(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function iK(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        iH(t, n, r[n])
                    })
                }
                return t
            }

            function iX(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var i = [],
                            l = !0,
                            c = !1;
                        try {
                            for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            c = !0, o = t
                        } finally {
                            try {
                                l || null == a.return || a.return()
                            } finally {
                                if (c) throw o
                            }
                        }
                        return i
                    }
                }(t, n) || iG(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function iq(t) {
                return function(t) {
                    if (Array.isArray(t)) return iV(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || iG(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function iG(t, n) {
                if (t) {
                    if ("string" == typeof t) return iV(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return iV(t, n)
                }
            }

            function iY(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }

            function iZ() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return function(t) {
                    var r = !1,
                        o = n.map(function(n) {
                            var o = iY(n, t);
                            return r || "function" != typeof o || (r = !0), o
                        });
                    if (r) return function() {
                        for (var t = 0; t < o.length; t++) {
                            var r = o[t];
                            "function" == typeof r ? r() : iY(n[t], null)
                        }
                    }
                }
            }

            function i$() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return Y.useCallback(iZ.apply(void 0, iq(n)), n)
            }

            function iQ(t) {
                var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    r = [],
                    o = function() {
                        var n = r.map(function(t) {
                            return Y.createContext(t)
                        });
                        return function(r) {
                            var o = (null == r ? void 0 : r[t]) || n;
                            return Y.useMemo(function() {
                                var n, a;
                                return iH({}, "__scope".concat(t), (n = iK({}, r), a = null != (a = iH({}, t, o)) ? a : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(a)) : (function(t, n) {
                                    var r = Object.keys(t);
                                    if (Object.getOwnPropertySymbols) {
                                        var o = Object.getOwnPropertySymbols(t);
                                        r.push.apply(r, o)
                                    }
                                    return r
                                })(Object(a)).forEach(function(t) {
                                    Object.defineProperty(n, t, Object.getOwnPropertyDescriptor(a, t))
                                }), n))
                            }, [r, o])
                        }
                    };
                return o.scopeName = t, [function(n, o) {
                    var a = Y.createContext(o),
                        i = r.length;
                    r = iq(r).concat([o]);
                    var l = function(n) {
                        var r, o = n.scope,
                            l = n.children,
                            c = function(t, n) {
                                if (null == t) return {};
                                var r, o, a = function(t, n) {
                                    if (null == t) return {};
                                    var r, o, a = {},
                                        i = Object.keys(t);
                                    for (o = 0; o < i.length; o++) r = i[o], n.indexOf(r) >= 0 || (a[r] = t[r]);
                                    return a
                                }(t, n);
                                if (Object.getOwnPropertySymbols) {
                                    var i = Object.getOwnPropertySymbols(t);
                                    for (o = 0; o < i.length; o++) r = i[o], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (a[r] = t[r])
                                }
                                return a
                            }(n, ["scope", "children"]),
                            u = (null == o || null == (r = o[t]) ? void 0 : r[i]) || a,
                            s = Y.useMemo(function() {
                                return c
                            }, Object.values(c));
                        return (0, T.jsx)(u.Provider, {
                            value: s,
                            children: l
                        })
                    };
                    return l.displayName = n + "Provider", [l, function(r, l) {
                        var c, u = (null == l || null == (c = l[t]) ? void 0 : c[i]) || a,
                            s = Y.useContext(u);
                        if (s) return s;
                        if (void 0 !== o) return o;
                        throw Error("`".concat(r, "` must be used within `").concat(n, "`"))
                    }]
                }, iJ.apply(void 0, [o].concat(iq(n)))]
            }

            function iJ() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                var o = n[0];
                if (1 === n.length) return o;
                var a = function() {
                    var t = n.map(function(t) {
                        return {
                            useScope: t(),
                            scopeName: t.scopeName
                        }
                    });
                    return function(n) {
                        var r = t.reduce(function(t, r) {
                            var o = r.useScope,
                                a = r.scopeName;
                            return iK({}, t, o(n)["__scope".concat(a)])
                        }, {});
                        return Y.useMemo(function() {
                            return iH({}, "__scope".concat(o.scopeName), r)
                        }, [r])
                    }
                };
                return a.scopeName = o.scopeName, a
            }

            function i0(t, n) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    o = r.checkForDefaultPrevented,
                    a = void 0 === o || o;
                return function(r) {
                    if (null == t || t(r), !1 === a || !r.defaultPrevented) return null == n ? void 0 : n(r)
                }
            }

            function i1(t) {
                var n = Y.useRef(t);
                return Y.useEffect(function() {
                    n.current = t
                }), Y.useMemo(function() {
                    return function() {
                        for (var t, r = arguments.length, o = Array(r), a = 0; a < r; a++) o[a] = arguments[a];
                        return null == (t = n.current) ? void 0 : t.call.apply(t, [n].concat(iq(o)))
                    }
                }, [])
            }
            var i2 = (null == (ly = globalThis) ? void 0 : ly.document) ? Y.useLayoutEffect : function() {},
                i3 = function(t) {
                    var n, r, o, a, i, l, c, u, s, f, d, p, v, m, h = t.present,
                        y = t.children,
                        g = (a = (o = iX(Y.useState(), 2))[0], i = o[1], l = Y.useRef({}), c = Y.useRef(h), u = Y.useRef("none"), f = (s = iX((n = h ? "mounted" : "unmounted", r = {
                            mounted: {
                                UNMOUNT: "unmounted",
                                ANIMATION_OUT: "unmountSuspended"
                            },
                            unmountSuspended: {
                                MOUNT: "mounted",
                                ANIMATION_END: "unmounted"
                            },
                            unmounted: {
                                MOUNT: "mounted"
                            }
                        }, Y.useReducer(function(t, n) {
                            var o;
                            return null != (o = r[t][n]) ? o : t
                        }, n)), 2))[0], d = s[1], Y.useEffect(function() {
                            var t = i5(l.current);
                            u.current = "mounted" === f ? t : "none"
                        }, [f]), i2(function() {
                            var t = l.current,
                                n = c.current;
                            if (n !== h) {
                                var r = u.current,
                                    o = i5(t);
                                h ? d("MOUNT") : "none" === o || "none" === (null == t ? void 0 : t.display) ? d("UNMOUNT") : d(n && r !== o ? "ANIMATION_OUT" : "UNMOUNT"), c.current = h
                            }
                        }, [h, d]), i2(function() {
                            if (a) {
                                var t, n, r = null != (n = a.ownerDocument.defaultView) ? n : window,
                                    o = function(n) {
                                        var o = i5(l.current).includes(n.animationName);
                                        if (n.target === a && o && (d("ANIMATION_END"), !c.current)) {
                                            var i = a.style.animationFillMode;
                                            a.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                                "forwards" === a.style.animationFillMode && (a.style.animationFillMode = i)
                                            })
                                        }
                                    },
                                    i = function(t) {
                                        t.target === a && (u.current = i5(l.current))
                                    };
                                return a.addEventListener("animationstart", i), a.addEventListener("animationcancel", o), a.addEventListener("animationend", o),
                                    function() {
                                        r.clearTimeout(t), a.removeEventListener("animationstart", i), a.removeEventListener("animationcancel", o), a.removeEventListener("animationend", o)
                                    }
                            }
                            d("ANIMATION_END")
                        }, [a, d]), {
                            isPresent: ["mounted", "unmountSuspended"].includes(f),
                            ref: Y.useCallback(function(t) {
                                t && (l.current = getComputedStyle(t)), i(t)
                            }, [])
                        }),
                        b = "function" == typeof y ? y({
                            present: g.isPresent
                        }) : Y.Children.only(y),
                        w = i$(g.ref, (m = null == (p = Object.getOwnPropertyDescriptor(b.props, "ref")) ? void 0 : p.get) && "isReactWarning" in m && m.isReactWarning ? b.ref : (m = null == (v = Object.getOwnPropertyDescriptor(b, "ref")) ? void 0 : v.get) && "isReactWarning" in m && m.isReactWarning ? b.props.ref : b.props.ref || b.ref);
                    return "function" == typeof y || g.isPresent ? Y.cloneElement(b, {
                        ref: w
                    }) : null
                };

            function i5(t) {
                return (null == t ? void 0 : t.animationName) || "none"
            }

            function i4(t) {
                var n = t.className;
                return Z().createElement("svg", {
                    xmlns: "http://www.w3.org/2000/svg",
                    width: "13",
                    height: "6",
                    viewBox: "0 0 13 6",
                    fill: "none",
                    className: ez("block", n),
                    style: {
                        marginTop: -1
                    }
                }, Z().createElement("path", {
                    d: "M0.249999 0.666628L4.83579 5.25241C5.61683 6.03346 6.88316 6.03346 7.66421 5.25241L12.25 0.666626L0.249999 0.666628Z",
                    fill: "currentColor"
                }))
            }

            function i6(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function i8(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function i7(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        i8(t, n, r[n])
                    })
                }
                return t
            }

            function i9(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function le(t, n) {
                if (null == t) return {};
                var r, o, a = function(t, n) {
                    if (null == t) return {};
                    var r, o, a = {},
                        i = Object.keys(t);
                    for (o = 0; o < i.length; o++) r = i[o], n.indexOf(r) >= 0 || (a[r] = t[r]);
                    return a
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(t);
                    for (o = 0; o < i.length; o++) r = i[o], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (a[r] = t[r])
                }
                return a
            }

            function lt(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var i = [],
                            l = !0,
                            c = !1;
                        try {
                            for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            c = !0, o = t
                        } finally {
                            try {
                                l || null == a.return || a.return()
                            } finally {
                                if (c) throw o
                            }
                        }
                        return i
                    }
                }(t, n) || lr(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ln(t) {
                return function(t) {
                    if (Array.isArray(t)) return i6(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || lr(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function lr(t, n) {
                if (t) {
                    if ("string" == typeof t) return i6(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return i6(t, n)
                }
            }
            i3.displayName = "Presence";
            var lo = Y.forwardRef(function(t, n) {
                var r = t.children,
                    o = le(t, ["children"]),
                    a = Y.Children.toArray(r),
                    i = a.find(ll);
                if (i) {
                    var l = i.props.children,
                        c = a.map(function(t) {
                            return t === i ? Y.Children.count(l) > 1 ? Y.Children.only(null) : Y.isValidElement(l) ? l.props.children : null : t
                        });
                    return (0, T.jsx)(la, i9(i7({}, o), {
                        ref: n,
                        children: Y.isValidElement(l) ? Y.cloneElement(l, void 0, c) : null
                    }))
                }
                return (0, T.jsx)(la, i9(i7({}, o), {
                    ref: n,
                    children: r
                }))
            });
            lo.displayName = "Slot";
            var la = Y.forwardRef(function(t, n) {
                var r = t.children,
                    o = le(t, ["children"]);
                if (Y.isValidElement(r)) {
                    var a, i, l, c = (l = null == (a = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (i = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref;
                    return Y.cloneElement(r, i9(i7({}, function(t, n) {
                        var r = i7({}, n);
                        for (var o in n) ! function(o) {
                            var a = t[o],
                                i = n[o];
                            /^on[A-Z]/.test(o) ? a && i ? r[o] = function() {
                                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                i.apply(void 0, ln(n)), a.apply(void 0, ln(n))
                            } : a && (r[o] = a) : "style" === o ? r[o] = i7({}, a, i) : "className" === o && (r[o] = [a, i].filter(Boolean).join(" "))
                        }(o);
                        return i7({}, t, r)
                    }(o, r.props)), {
                        ref: n ? iZ(n, c) : c
                    }))
                }
                return Y.Children.count(r) > 1 ? Y.Children.only(null) : null
            });
            la.displayName = "SlotClone";
            var li = function(t) {
                var n = t.children;
                return (0, T.jsx)(T.Fragment, {
                    children: n
                })
            };

            function ll(t) {
                return Y.isValidElement(t) && t.type === li
            }
            var lc, lu, ls, lf, ld, lp, lv, lm, lh, ly, lg, lb = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                    var r = Y.forwardRef(function(t, r) {
                        var o = t.asChild,
                            a = le(t, ["asChild"]),
                            i = o ? lo : n;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, T.jsx)(i, i9(i7({}, a), {
                            ref: r
                        }))
                    });
                    return r.displayName = "Primitive.".concat(n), i9(i7({}, t), i8({}, n, r))
                }, {}),
                lw = "dismissableLayer.update",
                lx = Y.createContext({
                    layers: new Set,
                    layersWithOutsidePointerEventsDisabled: new Set,
                    branches: new Set
                }),
                lS = Y.forwardRef(function(t, n) {
                    var r, o, a = t.disableOutsidePointerEvents,
                        i = void 0 !== a && a,
                        l = t.onEscapeKeyDown,
                        c = t.onPointerDownOutside,
                        u = t.onFocusOutside,
                        s = t.onInteractOutside,
                        f = t.onDismiss,
                        d = le(t, ["disableOutsidePointerEvents", "onEscapeKeyDown", "onPointerDownOutside", "onFocusOutside", "onInteractOutside", "onDismiss"]),
                        p = Y.useContext(lx),
                        v = lt(Y.useState(null), 2),
                        m = v[0],
                        h = v[1],
                        y = null != (o = null == m ? void 0 : m.ownerDocument) ? o : null == (r = globalThis) ? void 0 : r.document,
                        g = lt(Y.useState({}), 2)[1],
                        b = i$(n, function(t) {
                            return h(t)
                        }),
                        w = Array.from(p.layers),
                        x = lt(ln(p.layersWithOutsidePointerEventsDisabled).slice(-1), 1)[0],
                        S = w.indexOf(x),
                        O = m ? w.indexOf(m) : -1,
                        j = p.layersWithOutsidePointerEventsDisabled.size > 0,
                        E = O >= S,
                        C = function(t) {
                            var n, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                                o = i1(t),
                                a = Y.useRef(!1),
                                i = Y.useRef(function() {});
                            return Y.useEffect(function() {
                                var t = function(t) {
                                        if (t.target && !a.current) {
                                            var n = function() {
                                                    lj("dismissableLayer.pointerDownOutside", o, l, {
                                                        discrete: !0
                                                    })
                                                },
                                                l = {
                                                    originalEvent: t
                                                };
                                            "touch" === t.pointerType ? (r.removeEventListener("click", i.current), i.current = n, r.addEventListener("click", i.current, {
                                                once: !0
                                            })) : n()
                                        } else r.removeEventListener("click", i.current);
                                        a.current = !1
                                    },
                                    n = window.setTimeout(function() {
                                        r.addEventListener("pointerdown", t)
                                    }, 0);
                                return function() {
                                    window.clearTimeout(n), r.removeEventListener("pointerdown", t), r.removeEventListener("click", i.current)
                                }
                            }, [r, o]), {
                                onPointerDownCapture: function() {
                                    return a.current = !0
                                }
                            }
                        }(function(t) {
                            var n = t.target,
                                r = ln(p.branches).some(function(t) {
                                    return t.contains(n)
                                });
                            E && !r && (null == c || c(t), null == s || s(t), t.defaultPrevented || null == f || f())
                        }, y),
                        P = function(t) {
                            var n, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                                o = i1(t),
                                a = Y.useRef(!1);
                            return Y.useEffect(function() {
                                var t = function(t) {
                                    t.target && !a.current && lj("dismissableLayer.focusOutside", o, {
                                        originalEvent: t
                                    }, {
                                        discrete: !1
                                    })
                                };
                                return r.addEventListener("focusin", t),
                                    function() {
                                        return r.removeEventListener("focusin", t)
                                    }
                            }, [r, o]), {
                                onFocusCapture: function() {
                                    return a.current = !0
                                },
                                onBlurCapture: function() {
                                    return a.current = !1
                                }
                            }
                        }(function(t) {
                            var n = t.target;
                            ln(p.branches).some(function(t) {
                                return t.contains(n)
                            }) || (null == u || u(t), null == s || s(t), t.defaultPrevented || null == f || f())
                        }, y);
                    return function(t) {
                        var n, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                            o = i1(t);
                        Y.useEffect(function() {
                            var t = function(t) {
                                "Escape" === t.key && o(t)
                            };
                            return r.addEventListener("keydown", t, {
                                    capture: !0
                                }),
                                function() {
                                    return r.removeEventListener("keydown", t, {
                                        capture: !0
                                    })
                                }
                        }, [o, r])
                    }(function(t) {
                        O === p.layers.size - 1 && (null == l || l(t), !t.defaultPrevented && f && (t.preventDefault(), f()))
                    }, y), Y.useEffect(function() {
                        if (m) return i && (0 === p.layersWithOutsidePointerEventsDisabled.size && (lg = y.body.style.pointerEvents, y.body.style.pointerEvents = "none"), p.layersWithOutsidePointerEventsDisabled.add(m)), p.layers.add(m), lO(),
                            function() {
                                i && 1 === p.layersWithOutsidePointerEventsDisabled.size && (y.body.style.pointerEvents = lg)
                            }
                    }, [m, y, i, p]), Y.useEffect(function() {
                        return function() {
                            m && (p.layers.delete(m), p.layersWithOutsidePointerEventsDisabled.delete(m), lO())
                        }
                    }, [m, p]), Y.useEffect(function() {
                        var t = function() {
                            return g({})
                        };
                        return document.addEventListener(lw, t),
                            function() {
                                return document.removeEventListener(lw, t)
                            }
                    }, []), (0, T.jsx)(lb.div, i9(i7({}, d), {
                        ref: b,
                        style: i7({
                            pointerEvents: j ? E ? "auto" : "none" : void 0
                        }, t.style),
                        onFocusCapture: i0(t.onFocusCapture, P.onFocusCapture),
                        onBlurCapture: i0(t.onBlurCapture, P.onBlurCapture),
                        onPointerDownCapture: i0(t.onPointerDownCapture, C.onPointerDownCapture)
                    }))
                });

            function lO() {
                var t = new CustomEvent(lw);
                document.dispatchEvent(t)
            }

            function lj(t, n, r, o) {
                var a = o.discrete,
                    i = r.originalEvent.target,
                    l = new CustomEvent(t, {
                        bubbles: !1,
                        cancelable: !0,
                        detail: r
                    });
                n && i.addEventListener(t, n, {
                    once: !0
                }), a ? i && eG.flushSync(function() {
                    return i.dispatchEvent(l)
                }) : i.dispatchEvent(l)
            }
            lS.displayName = "DismissableLayer", Y.forwardRef(function(t, n) {
                var r = Y.useContext(lx),
                    o = Y.useRef(null),
                    a = i$(n, o);
                return Y.useEffect(function() {
                    var t = o.current;
                    if (t) return r.branches.add(t),
                        function() {
                            r.branches.delete(t)
                        }
                }, [r.branches]), (0, T.jsx)(lb.div, i9(i7({}, t), {
                    ref: a
                }))
            }).displayName = "DismissableLayerBranch";
            var lE = Y["useId".toString()] || function() {},
                lC = 0,
                lP = Y.forwardRef(function(t, n) {
                    var r = t.children,
                        o = t.width,
                        a = t.height,
                        i = le(t, ["children", "width", "height"]);
                    return (0, T.jsx)(lb.svg, i9(i7({}, i), {
                        ref: n,
                        width: void 0 === o ? 10 : o,
                        height: void 0 === a ? 5 : a,
                        viewBox: "0 0 30 10",
                        preserveAspectRatio: "none",
                        children: t.asChild ? r : (0, T.jsx)("polygon", {
                            points: "0,0 30,0 15,10"
                        })
                    }))
                });
            lP.displayName = "Arrow";
            var lA = "Popper",
                lN = lt(iQ(lA), 2),
                lk = lN[0],
                lR = lN[1],
                lD = lt(lk(lA), 2),
                lL = lD[0],
                lT = lD[1],
                lI = function(t) {
                    var n = t.__scopePopper,
                        r = t.children,
                        o = lt(Y.useState(null), 2),
                        a = o[0],
                        i = o[1];
                    return (0, T.jsx)(lL, {
                        scope: n,
                        anchor: a,
                        onAnchorChange: i,
                        children: r
                    })
                };
            lI.displayName = lA;
            var lM = "PopperAnchor",
                l_ = Y.forwardRef(function(t, n) {
                    var r = t.__scopePopper,
                        o = t.virtualRef,
                        a = le(t, ["__scopePopper", "virtualRef"]),
                        i = lT(lM, r),
                        l = Y.useRef(null),
                        c = i$(n, l);
                    return Y.useEffect(function() {
                        i.onAnchorChange((null == o ? void 0 : o.current) || l.current)
                    }), o ? null : (0, T.jsx)(lb.div, i9(i7({}, a), {
                        ref: c
                    }))
                });
            l_.displayName = lM;
            var lF = "PopperContent",
                lW = lt(lk(lF), 2),
                lU = lW[0],
                lB = lW[1],
                lz = Y.forwardRef(function(t, n) {
                    var r, o, a, i, l, c, u, s, f, d, p, v = t.__scopePopper,
                        m = t.side,
                        h = t.sideOffset,
                        y = t.align,
                        g = void 0 === y ? "center" : y,
                        b = t.alignOffset,
                        w = t.arrowPadding,
                        x = t.avoidCollisions,
                        S = void 0 === x || x,
                        O = t.collisionBoundary,
                        j = void 0 === O ? [] : O,
                        E = t.collisionPadding,
                        C = void 0 === E ? 0 : E,
                        P = t.sticky,
                        A = t.hideWhenDetached,
                        N = t.updatePositionStrategy,
                        k = void 0 === N ? "optimized" : N,
                        R = t.onPlaced,
                        D = le(t, ["__scopePopper", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "avoidCollisions", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "updatePositionStrategy", "onPlaced"]),
                        L = lT(lF, v),
                        I = lt(Y.useState(null), 2),
                        M = I[0],
                        _ = I[1],
                        F = i$(n, function(t) {
                            return _(t)
                        }),
                        W = lt(Y.useState(null), 2),
                        U = W[0],
                        B = W[1],
                        z = (o = (r = iX(Y.useState(void 0), 2))[0], a = r[1], i2(function() {
                            if (U) {
                                a({
                                    width: U.offsetWidth,
                                    height: U.offsetHeight
                                });
                                var t = new ResizeObserver(function(t) {
                                    if (Array.isArray(t) && t.length) {
                                        var n, r, o = t[0];
                                        if ("borderBoxSize" in o) {
                                            var i = o.borderBoxSize,
                                                l = Array.isArray(i) ? i[0] : i;
                                            n = l.inlineSize, r = l.blockSize
                                        } else n = U.offsetWidth, r = U.offsetHeight;
                                        a({
                                            width: n,
                                            height: r
                                        })
                                    }
                                });
                                return t.observe(U, {
                                        box: "border-box"
                                    }),
                                    function() {
                                        return t.unobserve(U)
                                    }
                            }
                            a(void 0)
                        }, [U]), o),
                        V = null != (d = null == z ? void 0 : z.width) ? d : 0,
                        H = null != (p = null == z ? void 0 : z.height) ? p : 0,
                        K = "number" == typeof C ? C : i7({
                            top: 0,
                            right: 0,
                            bottom: 0,
                            left: 0
                        }, C),
                        X = Array.isArray(j) ? j : [j],
                        q = X.length > 0,
                        G = {
                            padding: K,
                            boundary: X.filter(lX),
                            altBoundary: q
                        },
                        Z = aJ({
                            strategy: "fixed",
                            placement: (void 0 === m ? "bottom" : m) + ("center" !== g ? "-" + g : ""),
                            whileElementsMounted: function() {
                                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                return aK.apply(void 0, ln(n).concat([{
                                    animationFrame: "always" === k
                                }]))
                            },
                            elements: {
                                reference: L.anchor
                            },
                            middleware: [a0({
                                mainAxis: (void 0 === h ? 0 : h) + H,
                                alignmentAxis: void 0 === b ? 0 : b
                            }), S && a1(i7({
                                mainAxis: !0,
                                crossAxis: !1,
                                limiter: "partial" === (void 0 === P ? "partial" : P) ? a2() : void 0
                            }, G)), S && a3(i7({}, G)), a5(i9(i7({}, G), {
                                apply: function(t) {
                                    var n = t.elements,
                                        r = t.rects,
                                        o = t.availableWidth,
                                        a = t.availableHeight,
                                        i = r.reference,
                                        l = i.width,
                                        c = i.height,
                                        u = n.floating.style;
                                    u.setProperty("--radix-popper-available-width", "".concat(o, "px")), u.setProperty("--radix-popper-available-height", "".concat(a, "px")), u.setProperty("--radix-popper-anchor-width", "".concat(l, "px")), u.setProperty("--radix-popper-anchor-height", "".concat(c, "px"))
                                }
                            })), U && a6({
                                element: U,
                                padding: void 0 === w ? 0 : w
                            }), lq({
                                arrowWidth: V,
                                arrowHeight: H
                            }), void 0 !== A && A && a4(i7({
                                strategy: "referenceHidden"
                            }, G))]
                        }),
                        $ = Z.refs,
                        Q = Z.floatingStyles,
                        J = Z.placement,
                        ee = Z.isPositioned,
                        et = Z.middlewareData,
                        en = lt(lG(J), 2),
                        er = en[0],
                        eo = en[1],
                        ea = i1(R);
                    i2(function() {
                        ee && (null == ea || ea())
                    }, [ee, ea]);
                    var ei = null == (i = et.arrow) ? void 0 : i.x,
                        el = null == (l = et.arrow) ? void 0 : l.y,
                        ec = 0 !== (null == (c = et.arrow) ? void 0 : c.centerOffset),
                        eu = lt(Y.useState(), 2),
                        es = eu[0],
                        ef = eu[1];
                    return i2(function() {
                        M && ef(window.getComputedStyle(M).zIndex)
                    }, [M]), (0, T.jsx)("div", {
                        ref: $.setFloating,
                        "data-radix-popper-content-wrapper": "",
                        style: i7(i9(i7({}, Q), {
                            transform: ee ? Q.transform : "translate(0, -200%)",
                            minWidth: "max-content",
                            zIndex: es,
                            "--radix-popper-transform-origin": [null == (u = et.transformOrigin) ? void 0 : u.x, null == (s = et.transformOrigin) ? void 0 : s.y].join(" ")
                        }), (null == (f = et.hide) ? void 0 : f.referenceHidden) && {
                            visibility: "hidden",
                            pointerEvents: "none"
                        }),
                        dir: t.dir,
                        children: (0, T.jsx)(lU, {
                            scope: v,
                            placedSide: er,
                            onArrowChange: B,
                            arrowX: ei,
                            arrowY: el,
                            shouldHideArrow: ec,
                            children: (0, T.jsx)(lb.div, i9(i7({
                                "data-side": er,
                                "data-align": eo
                            }, D), {
                                ref: F,
                                style: i9(i7({}, D.style), {
                                    animation: ee ? void 0 : "none"
                                })
                            }))
                        })
                    })
                });
            lz.displayName = lF;
            var lV = "PopperArrow",
                lH = {
                    top: "bottom",
                    right: "left",
                    bottom: "top",
                    left: "right"
                },
                lK = Y.forwardRef(function(t, n) {
                    var r, o = t.__scopePopper,
                        a = le(t, ["__scopePopper"]),
                        i = lB(lV, o),
                        l = lH[i.placedSide];
                    return (0, T.jsx)("span", {
                        ref: i.onArrowChange,
                        style: (i8(r = {
                            position: "absolute",
                            left: i.arrowX,
                            top: i.arrowY
                        }, l, 0), i8(r, "transformOrigin", {
                            top: "",
                            right: "0 0",
                            bottom: "center 0",
                            left: "100% 0"
                        } [i.placedSide]), i8(r, "transform", {
                            top: "translateY(100%)",
                            right: "translateY(50%) rotate(90deg) translateX(-50%)",
                            bottom: "rotate(180deg)",
                            left: "translateY(50%) rotate(-90deg) translateX(50%)"
                        } [i.placedSide]), i8(r, "visibility", i.shouldHideArrow ? "hidden" : void 0), r),
                        children: (0, T.jsx)(lP, i9(i7({}, a), {
                            ref: n,
                            style: i9(i7({}, a.style), {
                                display: "block"
                            })
                        }))
                    })
                });

            function lX(t) {
                return null !== t
            }
            lK.displayName = lV;
            var lq = function(t) {
                return {
                    name: "transformOrigin",
                    options: t,
                    fn: function(n) {
                        var r, o, a, i, l, c = n.placement,
                            u = n.rects,
                            s = n.middlewareData,
                            f = 0 !== (null == (r = s.arrow) ? void 0 : r.centerOffset),
                            d = f ? 0 : t.arrowWidth,
                            p = f ? 0 : t.arrowHeight,
                            v = lt(lG(c), 2),
                            m = v[0],
                            h = {
                                start: "0%",
                                center: "50%",
                                end: "100%"
                            } [v[1]],
                            y = (null != (i = null == (o = s.arrow) ? void 0 : o.x) ? i : 0) + d / 2,
                            g = (null != (l = null == (a = s.arrow) ? void 0 : a.y) ? l : 0) + p / 2,
                            b = "",
                            w = "";
                        return "bottom" === m ? (b = f ? h : "".concat(y, "px"), w = -p + "px") : "top" === m ? (b = f ? h : "".concat(y, "px"), w = "".concat(u.floating.height + p, "px")) : "right" === m ? (b = -p + "px", w = f ? h : "".concat(g, "px")) : "left" === m && (b = "".concat(u.floating.width + p, "px"), w = f ? h : "".concat(g, "px")), {
                            data: {
                                x: b,
                                y: w
                            }
                        }
                    }
                }
            };

            function lG(t) {
                var n = lt(t.split("-"), 2),
                    r = n[0],
                    o = n[1];
                return [r, void 0 === o ? "center" : o]
            }
            var lY = Y.forwardRef(function(t, n) {
                var r, o, a = t.container,
                    i = le(t, ["container"]),
                    l = lt(Y.useState(!1), 2),
                    c = l[0],
                    u = l[1];
                i2(function() {
                    return u(!0)
                }, []);
                var s = a || c && (null == (o = globalThis) || null == (r = o.document) ? void 0 : r.body);
                return s ? eY().createPortal((0, T.jsx)(lb.div, i9(i7({}, i), {
                    ref: n
                })), s) : null
            });
            lY.displayName = "Portal";
            var lZ = Y.forwardRef(function(t, n) {
                return (0, T.jsx)(lb.span, i9(i7({}, t), {
                    ref: n,
                    style: i7({
                        position: "absolute",
                        border: 0,
                        width: 1,
                        height: 1,
                        padding: 0,
                        margin: -1,
                        overflow: "hidden",
                        clip: "rect(0, 0, 0, 0)",
                        whiteSpace: "nowrap",
                        wordWrap: "normal"
                    }, t.style)
                }))
            });
            lZ.displayName = "VisuallyHidden";
            var l$ = lt(iQ("Tooltip", [lR]), 2),
                lQ = l$[0],
                lJ = (l$[1], lR()),
                l0 = "TooltipProvider",
                l1 = "tooltip.open",
                l2 = lt(lQ(l0), 2),
                l3 = l2[0],
                l5 = l2[1],
                l4 = function(t) {
                    var n = t.__scopeTooltip,
                        r = t.delayDuration,
                        o = t.skipDelayDuration,
                        a = void 0 === o ? 300 : o,
                        i = t.disableHoverableContent,
                        l = t.children,
                        c = lt(Y.useState(!0), 2),
                        u = c[0],
                        s = c[1],
                        f = Y.useRef(!1),
                        d = Y.useRef(0);
                    return Y.useEffect(function() {
                        var t = d.current;
                        return function() {
                            return window.clearTimeout(t)
                        }
                    }, []), (0, T.jsx)(l3, {
                        scope: n,
                        isOpenDelayed: u,
                        delayDuration: void 0 === r ? 700 : r,
                        onOpen: Y.useCallback(function() {
                            window.clearTimeout(d.current), s(!1)
                        }, []),
                        onClose: Y.useCallback(function() {
                            window.clearTimeout(d.current), d.current = window.setTimeout(function() {
                                return s(!0)
                            }, a)
                        }, [a]),
                        isPointerInTransitRef: f,
                        onPointerInTransitChange: Y.useCallback(function(t) {
                            f.current = t
                        }, []),
                        disableHoverableContent: void 0 !== i && i,
                        children: l
                    })
                };
            l4.displayName = l0;
            var l6 = "Tooltip",
                l8 = lt(lQ(l6), 2),
                l7 = l8[0],
                l9 = l8[1],
                ce = function(t) {
                    var n, r, o, a, i, l, c, u, s, f, d, p, v, m, h, y, g, b, w, x, S, O = t.__scopeTooltip,
                        j = t.children,
                        E = t.open,
                        C = t.defaultOpen,
                        P = t.onOpenChange,
                        A = t.disableHoverableContent,
                        N = t.delayDuration,
                        k = l5(l6, t.__scopeTooltip),
                        R = lJ(O),
                        D = lt(Y.useState(null), 2),
                        L = D[0],
                        I = D[1],
                        M = (o = (r = lt(Y.useState(lE()), 2))[0], a = r[1], i2(function() {
                            a(function(t) {
                                return null != t ? t : String(lC++)
                            })
                        }, [n]), n || (o ? "radix-".concat(o) : "")),
                        _ = Y.useRef(0),
                        F = null != A ? A : k.disableHoverableContent,
                        W = null != N ? N : k.delayDuration,
                        U = Y.useRef(!1),
                        B = lt((l = (i = {
                            prop: E,
                            defaultProp: void 0 !== C && C,
                            onChange: function(t) {
                                t ? (k.onOpen(), document.dispatchEvent(new CustomEvent(l1))) : k.onClose(), null == P || P(t)
                            }
                        }).prop, g = (y = iX((f = (s = {
                            defaultProp: i.defaultProp,
                            onChange: u = void 0 === (c = i.onChange) ? function() {} : c
                        }).defaultProp, d = s.onChange, v = iX(p = Y.useState(f), 1)[0], m = Y.useRef(v), h = i1(d), Y.useEffect(function() {
                            m.current !== v && (h(v), m.current = v)
                        }, [v, m, h]), p), 2))[0], b = y[1], x = (w = void 0 !== l) ? l : g, S = i1(u), [x, Y.useCallback(function(t) {
                            if (w) {
                                var n = "function" == typeof t ? t(l) : t;
                                n !== l && S(n)
                            } else b(t)
                        }, [w, l, b, S])]), 2),
                        z = B[0],
                        V = void 0 !== z && z,
                        H = B[1],
                        K = Y.useMemo(function() {
                            return V ? U.current ? "delayed-open" : "instant-open" : "closed"
                        }, [V]),
                        X = Y.useCallback(function() {
                            window.clearTimeout(_.current), _.current = 0, U.current = !1, H(!0)
                        }, [H]),
                        q = Y.useCallback(function() {
                            window.clearTimeout(_.current), _.current = 0, H(!1)
                        }, [H]),
                        G = Y.useCallback(function() {
                            window.clearTimeout(_.current), _.current = window.setTimeout(function() {
                                U.current = !0, H(!0), _.current = 0
                            }, W)
                        }, [W, H]);
                    return Y.useEffect(function() {
                        return function() {
                            _.current && (window.clearTimeout(_.current), _.current = 0)
                        }
                    }, []), (0, T.jsx)(lI, i9(i7({}, R), {
                        children: (0, T.jsx)(l7, {
                            scope: O,
                            contentId: M,
                            open: V,
                            stateAttribute: K,
                            trigger: L,
                            onTriggerChange: I,
                            onTriggerEnter: Y.useCallback(function() {
                                k.isOpenDelayed ? G() : X()
                            }, [k.isOpenDelayed, G, X]),
                            onTriggerLeave: Y.useCallback(function() {
                                F ? q() : (window.clearTimeout(_.current), _.current = 0)
                            }, [q, F]),
                            onOpen: X,
                            onClose: q,
                            disableHoverableContent: F,
                            children: j
                        })
                    }))
                };
            ce.displayName = l6;
            var ct = "TooltipTrigger",
                cn = Y.forwardRef(function(t, n) {
                    var r = t.__scopeTooltip,
                        o = le(t, ["__scopeTooltip"]),
                        a = l9(ct, r),
                        i = l5(ct, r),
                        l = lJ(r),
                        c = i$(n, Y.useRef(null), a.onTriggerChange),
                        u = Y.useRef(!1),
                        s = Y.useRef(!1),
                        f = Y.useCallback(function() {
                            return u.current = !1
                        }, []);
                    return Y.useEffect(function() {
                        return function() {
                            return document.removeEventListener("pointerup", f)
                        }
                    }, [f]), (0, T.jsx)(l_, i9(i7({
                        asChild: !0
                    }, l), {
                        children: (0, T.jsx)(lb.button, i9(i7({
                            "aria-describedby": a.open ? a.contentId : void 0,
                            "data-state": a.stateAttribute
                        }, o), {
                            ref: c,
                            onPointerMove: i0(t.onPointerMove, function(t) {
                                "touch" !== t.pointerType && (s.current || i.isPointerInTransitRef.current || (a.onTriggerEnter(), s.current = !0))
                            }),
                            onPointerLeave: i0(t.onPointerLeave, function() {
                                a.onTriggerLeave(), s.current = !1
                            }),
                            onPointerDown: i0(t.onPointerDown, function() {
                                u.current = !0, document.addEventListener("pointerup", f, {
                                    once: !0
                                })
                            }),
                            onFocus: i0(t.onFocus, function() {
                                u.current || a.onOpen()
                            }),
                            onBlur: i0(t.onBlur, a.onClose),
                            onClick: i0(t.onClick, a.onClose)
                        }))
                    }))
                });
            cn.displayName = ct;
            var cr = "TooltipPortal",
                co = lt(lQ(cr, {
                    forceMount: void 0
                }), 2),
                ca = co[0],
                ci = co[1],
                cl = function(t) {
                    var n = t.__scopeTooltip,
                        r = t.forceMount,
                        o = t.children,
                        a = t.container,
                        i = l9(cr, n);
                    return (0, T.jsx)(ca, {
                        scope: n,
                        forceMount: r,
                        children: (0, T.jsx)(i3, {
                            present: r || i.open,
                            children: (0, T.jsx)(lY, {
                                asChild: !0,
                                container: a,
                                children: o
                            })
                        })
                    })
                };
            cl.displayName = cr;
            var cc = "TooltipContent",
                cu = Y.forwardRef(function(t, n) {
                    var r = ci(cc, t.__scopeTooltip),
                        o = t.forceMount,
                        a = void 0 === o ? r.forceMount : o,
                        i = t.side,
                        l = void 0 === i ? "top" : i,
                        c = le(t, ["forceMount", "side"]),
                        u = l9(cc, t.__scopeTooltip);
                    return (0, T.jsx)(i3, {
                        present: a || u.open,
                        children: u.disableHoverableContent ? (0, T.jsx)(cv, i9(i7({
                            side: l
                        }, c), {
                            ref: n
                        })) : (0, T.jsx)(cs, i9(i7({
                            side: l
                        }, c), {
                            ref: n
                        }))
                    })
                }),
                cs = Y.forwardRef(function(t, n) {
                    var r = l9(cc, t.__scopeTooltip),
                        o = l5(cc, t.__scopeTooltip),
                        a = Y.useRef(null),
                        i = i$(n, a),
                        l = lt(Y.useState(null), 2),
                        c = l[0],
                        u = l[1],
                        s = r.trigger,
                        f = r.onClose,
                        d = a.current,
                        p = o.onPointerInTransitChange,
                        v = Y.useCallback(function() {
                            u(null), p(!1)
                        }, [p]),
                        m = Y.useCallback(function(t, n) {
                            var r, o, a, i, l, c, s = t.currentTarget,
                                f = {
                                    x: t.clientX,
                                    y: t.clientY
                                };
                            u(((c = ln(function(t, n) {
                                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 5,
                                    o = [];
                                switch (n) {
                                    case "top":
                                        o.push({
                                            x: t.x - r,
                                            y: t.y + r
                                        }, {
                                            x: t.x + r,
                                            y: t.y + r
                                        });
                                        break;
                                    case "bottom":
                                        o.push({
                                            x: t.x - r,
                                            y: t.y - r
                                        }, {
                                            x: t.x + r,
                                            y: t.y - r
                                        });
                                        break;
                                    case "left":
                                        o.push({
                                            x: t.x + r,
                                            y: t.y - r
                                        }, {
                                            x: t.x + r,
                                            y: t.y + r
                                        });
                                        break;
                                    case "right":
                                        o.push({
                                            x: t.x - r,
                                            y: t.y - r
                                        }, {
                                            x: t.x - r,
                                            y: t.y + r
                                        })
                                }
                                return o
                            }(f, function(t, n) {
                                var r = Math.abs(n.top - t.y),
                                    o = Math.abs(n.bottom - t.y),
                                    a = Math.abs(n.right - t.x),
                                    i = Math.abs(n.left - t.x);
                                switch (Math.min(r, o, a, i)) {
                                    case i:
                                        return "left";
                                    case a:
                                        return "right";
                                    case r:
                                        return "top";
                                    case o:
                                        return "bottom";
                                    default:
                                        throw Error("unreachable")
                                }
                            }(f, s.getBoundingClientRect()))).concat(ln((o = (r = n.getBoundingClientRect()).top, a = r.right, i = r.bottom, [{
                                x: l = r.left,
                                y: o
                            }, {
                                x: a,
                                y: o
                            }, {
                                x: a,
                                y: i
                            }, {
                                x: l,
                                y: i
                            }]))).slice()).sort(function(t, n) {
                                return t.x < n.x ? -1 : t.x > n.x ? 1 : t.y < n.y ? -1 : +(t.y > n.y)
                            }), function(t) {
                                if (t.length <= 1) return t.slice();
                                for (var n = [], r = 0; r < t.length; r++) {
                                    for (var o = t[r]; n.length >= 2;) {
                                        var a = n[n.length - 1],
                                            i = n[n.length - 2];
                                        if (!((a.x - i.x) * (o.y - i.y) >= (a.y - i.y) * (o.x - i.x))) break;
                                        n.pop()
                                    }
                                    n.push(o)
                                }
                                n.pop();
                                for (var l = [], c = t.length - 1; c >= 0; c--) {
                                    for (var u = t[c]; l.length >= 2;) {
                                        var s = l[l.length - 1],
                                            f = l[l.length - 2];
                                        if (!((s.x - f.x) * (u.y - f.y) >= (s.y - f.y) * (u.x - f.x))) break;
                                        l.pop()
                                    }
                                    l.push(u)
                                }
                                return l.pop(), 1 === n.length && 1 === l.length && n[0].x === l[0].x && n[0].y === l[0].y ? n : n.concat(l)
                            }(c))), p(!0)
                        }, [p]);
                    return Y.useEffect(function() {
                        return function() {
                            return v()
                        }
                    }, [v]), Y.useEffect(function() {
                        if (s && d) {
                            var t = function(t) {
                                    return m(t, d)
                                },
                                n = function(t) {
                                    return m(t, s)
                                };
                            return s.addEventListener("pointerleave", t), d.addEventListener("pointerleave", n),
                                function() {
                                    s.removeEventListener("pointerleave", t), d.removeEventListener("pointerleave", n)
                                }
                        }
                    }, [s, d, m, v]), Y.useEffect(function() {
                        if (c) {
                            var t = function(t) {
                                var n = t.target,
                                    r = {
                                        x: t.clientX,
                                        y: t.clientY
                                    },
                                    o = (null == s ? void 0 : s.contains(n)) || (null == d ? void 0 : d.contains(n)),
                                    a = ! function(t, n) {
                                        for (var r = t.x, o = t.y, a = !1, i = 0, l = n.length - 1; i < n.length; l = i++) {
                                            var c = n[i].x,
                                                u = n[i].y,
                                                s = n[l].x,
                                                f = n[l].y;
                                            u > o != f > o && r < (s - c) * (o - u) / (f - u) + c && (a = !a)
                                        }
                                        return a
                                    }(r, c);
                                o ? v() : a && (v(), f())
                            };
                            return document.addEventListener("pointermove", t),
                                function() {
                                    return document.removeEventListener("pointermove", t)
                                }
                        }
                    }, [s, d, c, f, v]), (0, T.jsx)(cv, i9(i7({}, t), {
                        ref: i
                    }))
                }),
                cf = lt(lQ(l6, {
                    isInside: !1
                }), 2),
                cd = cf[0],
                cp = cf[1],
                cv = Y.forwardRef(function(t, n) {
                    var r = t.__scopeTooltip,
                        o = t.children,
                        a = t["aria-label"],
                        i = t.onEscapeKeyDown,
                        l = t.onPointerDownOutside,
                        c = le(t, ["__scopeTooltip", "children", "aria-label", "onEscapeKeyDown", "onPointerDownOutside"]),
                        u = l9(cc, r),
                        s = lJ(r),
                        f = u.onClose;
                    return Y.useEffect(function() {
                        return document.addEventListener(l1, f),
                            function() {
                                return document.removeEventListener(l1, f)
                            }
                    }, [f]), Y.useEffect(function() {
                        if (u.trigger) {
                            var t = function(t) {
                                var n;
                                (null == (n = t.target) ? void 0 : n.contains(u.trigger)) && f()
                            };
                            return window.addEventListener("scroll", t, {
                                    capture: !0
                                }),
                                function() {
                                    return window.removeEventListener("scroll", t, {
                                        capture: !0
                                    })
                                }
                        }
                    }, [u.trigger, f]), (0, T.jsx)(lS, {
                        asChild: !0,
                        disableOutsidePointerEvents: !1,
                        onEscapeKeyDown: i,
                        onPointerDownOutside: l,
                        onFocusOutside: function(t) {
                            return t.preventDefault()
                        },
                        onDismiss: f,
                        children: (0, T.jsxs)(lz, i9(i7({
                            "data-state": u.stateAttribute
                        }, s, c), {
                            ref: n,
                            style: i9(i7({}, c.style), {
                                "--radix-tooltip-content-transform-origin": "var(--radix-popper-transform-origin)",
                                "--radix-tooltip-content-available-width": "var(--radix-popper-available-width)",
                                "--radix-tooltip-content-available-height": "var(--radix-popper-available-height)",
                                "--radix-tooltip-trigger-width": "var(--radix-popper-anchor-width)",
                                "--radix-tooltip-trigger-height": "var(--radix-popper-anchor-height)"
                            }),
                            children: [(0, T.jsx)(li, {
                                children: o
                            }), (0, T.jsx)(cd, {
                                scope: r,
                                isInside: !0,
                                children: (0, T.jsx)(lZ, {
                                    id: u.contentId,
                                    role: "tooltip",
                                    children: a || o
                                })
                            })]
                        }))
                    })
                });
            cu.displayName = cc;
            var cm = "TooltipArrow",
                ch = Y.forwardRef(function(t, n) {
                    var r = t.__scopeTooltip,
                        o = le(t, ["__scopeTooltip"]),
                        a = lJ(r);
                    return cp(cm, r).isInside ? null : (0, T.jsx)(lK, i9(i7({}, a, o), {
                        ref: n
                    }))
                });

            function cy(t) {
                var n = t.position,
                    r = t.hasBeak,
                    o = t.title,
                    a = t.description,
                    i = t.ariaLabel,
                    l = t.delayDurationMs,
                    c = t.children,
                    u = t.open,
                    s = t.onOpenChange,
                    f = t.contentClassName,
                    d = lt(n.split("-"), 2),
                    p = d[0],
                    v = d[1],
                    m = null != i ? i : "string" == typeof o && null == a ? o : void 0;
                return Y.createElement(l4, {
                    delayDuration: void 0 === l ? 500 : l
                }, Y.createElement(ce, {
                    open: u,
                    onOpenChange: s
                }, c, Y.createElement(cl, null, Y.createElement(cu, {
                    side: p,
                    align: v,
                    "aria-label": m,
                    className: ez("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", f),
                    sideOffset: 5
                }, (void 0 === r || r) && Y.createElement(ch, {
                    asChild: !0
                }, Y.createElement(i4, {
                    className: "content-[var(--inverse-surface-0)]"
                })), Y.createElement("div", {
                    className: "flex flex-col text-truncate-split"
                }, Y.createElement("div", {
                    className: "text-caption-medium content-inverse-default"
                }, o), a && Y.createElement("div", {
                    className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
                }, a))))))
            }

            function cg(t) {
                var n = t.children,
                    r = t.asChild,
                    o = t.className;
                return Y.createElement(cn, {
                    asChild: r,
                    className: o
                }, n)
            }
            ch.displayName = cm;
            var cb = function(t) {
                    var n = t.title,
                        r = t.description,
                        o = t.position;
                    return Z().createElement(cy, {
                        position: void 0 === o ? "top-center" : o,
                        title: n,
                        description: r
                    }, Z().createElement(cg, {
                        asChild: !0
                    }, Z().createElement("span", {
                        role: "button",
                        tabIndex: 0,
                        "aria-label": n,
                        className: "flex items-center content-muted",
                        "data-testid": "label-tooltip-trigger"
                    }, Z().createElement(rO, {
                        name: "icon-regular-circle-i",
                        size: "Small"
                    }))))
                },
                cw = {
                    Standard: "bg-none",
                    Contrast: "bg-shift-200",
                    Utility: "bg-none"
                },
                cx = {
                    Standard: "stroke-standard",
                    Contrast: "stroke-none",
                    Utility: "stroke-none"
                };

            function cS(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function cO(t) {
                if (Array.isArray(t)) return t
            }

            function cj(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function cE(t) {
                if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
            }

            function cC() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function cP(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        cj(t, n, r[n])
                    })
                }
                return t
            }

            function cA(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function cN(t, n) {
                if (null == t) return {};
                var r, o, a = function(t, n) {
                    if (null == t) return {};
                    var r, o, a = {},
                        i = Object.keys(t);
                    for (o = 0; o < i.length; o++) r = i[o], n.indexOf(r) >= 0 || (a[r] = t[r]);
                    return a
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(t);
                    for (o = 0; o < i.length; o++) r = i[o], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (a[r] = t[r])
                }
                return a
            }

            function ck(t, n) {
                return cO(t) || function(t, n) {
                    var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var i = [],
                            l = !0,
                            c = !1;
                        try {
                            for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            c = !0, o = t
                        } finally {
                            try {
                                l || null == a.return || a.return()
                            } finally {
                                if (c) throw o
                            }
                        }
                        return i
                    }
                }(t, n) || cD(t, n) || cC()
            }

            function cR(t) {
                return function(t) {
                    if (Array.isArray(t)) return cS(t)
                }(t) || cE(t) || cD(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function cD(t, n) {
                if (t) {
                    if ("string" == typeof t) return cS(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return cS(t, n)
                }
            }

            function cL(t, n) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    o = r.checkForDefaultPrevented,
                    a = void 0 === o || o;
                return function(r) {
                    if (null == t || t(r), !1 === a || !r.defaultPrevented) return null == n ? void 0 : n(r)
                }
            }

            function cT(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }

            function cI() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return function(t) {
                    var r = !1,
                        o = n.map(function(n) {
                            var o = cT(n, t);
                            return r || "function" != typeof o || (r = !0), o
                        });
                    if (r) return function() {
                        for (var t = 0; t < o.length; t++) {
                            var r = o[t];
                            "function" == typeof r ? r() : cT(n[t], null)
                        }
                    }
                }
            }

            function cM() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return Y.useCallback(cI.apply(void 0, cR(n)), n)
            }

            function c_() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                var o = n[0];
                if (1 === n.length) return o;
                var a = function() {
                    var t = n.map(function(t) {
                        return {
                            useScope: t(),
                            scopeName: t.scopeName
                        }
                    });
                    return function(n) {
                        var r = t.reduce(function(t, r) {
                            var o = r.useScope,
                                a = r.scopeName;
                            return cP({}, t, o(n)["__scope".concat(a)])
                        }, {});
                        return Y.useMemo(function() {
                            return cj({}, "__scope".concat(o.scopeName), r)
                        }, [r])
                    }
                };
                return a.scopeName = o.scopeName, a
            }

            function cF(t) {
                var n, r, o = (n = t, (r = Y.forwardRef(function(t, n) {
                        var r = t.children,
                            o = cN(t, ["children"]);
                        if (Y.isValidElement(r)) {
                            var a, i, l, c = (l = null == (a = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (i = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                u = function(t, n) {
                                    var r = cP({}, n);
                                    for (var o in n) ! function(o) {
                                        var a = t[o],
                                            i = n[o];
                                        /^on[A-Z]/.test(o) ? a && i ? r[o] = function() {
                                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                            i.apply(void 0, cR(n)), a.apply(void 0, cR(n))
                                        } : a && (r[o] = a) : "style" === o ? r[o] = cP({}, a, i) : "className" === o && (r[o] = [a, i].filter(Boolean).join(" "))
                                    }(o);
                                    return cP({}, t, r)
                                }(o, r.props);
                            return r.type !== Y.Fragment && (u.ref = n ? cI(n, c) : c), Y.cloneElement(r, u)
                        }
                        return Y.Children.count(r) > 1 ? Y.Children.only(null) : null
                    })).displayName = "".concat(n, ".SlotClone"), r),
                    a = Y.forwardRef(function(t, n) {
                        var r = t.children,
                            a = cN(t, ["children"]),
                            i = Y.Children.toArray(r),
                            l = i.find(cU);
                        if (l) {
                            var c = l.props.children,
                                u = i.map(function(t) {
                                    return t === l ? Y.Children.count(c) > 1 ? Y.Children.only(null) : Y.isValidElement(c) ? c.props.children : null : t
                                });
                            return (0, T.jsx)(o, cA(cP({}, a), {
                                ref: n,
                                children: Y.isValidElement(c) ? Y.cloneElement(c, void 0, u) : null
                            }))
                        }
                        return (0, T.jsx)(o, cA(cP({}, a), {
                            ref: n,
                            children: r
                        }))
                    });
                return a.displayName = "".concat(t, ".Slot"), a
            }
            var cW = Symbol("radix.slottable");

            function cU(t) {
                return Y.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === cW
            }
            var cB = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(t, n) {
                var r = cF("Primitive.".concat(n)),
                    o = Y.forwardRef(function(t, o) {
                        var a = t.asChild,
                            i = cN(t, ["asChild"]),
                            l = a ? r : n;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, T.jsx)(l, cA(cP({}, i), {
                            ref: o
                        }))
                    });
                return o.displayName = "Primitive.".concat(n), cA(cP({}, t), cj({}, n, o))
            }, {});

            function cz(t) {
                var n = Y.useRef(t);
                return Y.useEffect(function() {
                    n.current = t
                }), Y.useMemo(function() {
                    return function() {
                        for (var t, r = arguments.length, o = Array(r), a = 0; a < r; a++) o[a] = arguments[a];
                        return null == (t = n.current) ? void 0 : t.call.apply(t, [n].concat(cR(o)))
                    }
                }, [])
            }

            function cV(t) {
                var n, r, o, a, i, l, c, u = t.prop,
                    s = t.defaultProp,
                    f = t.onChange,
                    d = void 0 === f ? function() {} : f,
                    p = ck((r = (n = {
                        defaultProp: s,
                        onChange: d
                    }).defaultProp, o = n.onChange, i = ck(a = Y.useState(r), 1)[0], l = Y.useRef(i), c = cz(o), Y.useEffect(function() {
                        l.current !== i && (c(i), l.current = i)
                    }, [i, l, c]), a), 2),
                    v = p[0],
                    m = p[1],
                    h = void 0 !== u,
                    y = h ? u : v,
                    g = cz(d);
                return [y, Y.useCallback(function(t) {
                    if (h) {
                        var n = "function" == typeof t ? t(u) : t;
                        n !== u && g(n)
                    } else m(t)
                }, [h, u, m, g])]
            }
            var cH = (null == (D = globalThis) ? void 0 : D.document) ? Y.useLayoutEffect : function() {},
                cK = Y.forwardRef(function(t, n) {
                    return (0, T.jsx)(cB.span, cA(cP({}, t), {
                        ref: n,
                        style: cP({
                            position: "absolute",
                            border: 0,
                            width: 1,
                            height: 1,
                            padding: 0,
                            margin: -1,
                            overflow: "hidden",
                            clip: "rect(0, 0, 0, 0)",
                            whiteSpace: "nowrap",
                            wordWrap: "normal"
                        }, t.style)
                    }))
                });
            cK.displayName = "VisuallyHidden";
            var cX = [" ", "Enter", "ArrowUp", "ArrowDown"],
                cq = [" ", "Enter"],
                cG = "Select",
                cY = ck((o = (n = ox(function(t) {
                    var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        o = function() {
                            var n = r.map(function(t) {
                                return Y.createContext(t)
                            });
                            return function(r) {
                                var o = (null == r ? void 0 : r[t]) || n;
                                return Y.useMemo(function() {
                                    return oy({}, "__scope".concat(t), ob(og({}, r), oy({}, t, o)))
                                }, [r, o])
                            }
                        };
                    return o.scopeName = t, [function(n, o) {
                        var a = Y.createContext(o),
                            i = r.length;
                        r = oS(r).concat([o]);
                        var l = function(n) {
                            var r, o = n.scope,
                                l = n.children,
                                c = ow(n, ["scope", "children"]),
                                u = (null == o || null == (r = o[t]) ? void 0 : r[i]) || a,
                                s = Y.useMemo(function() {
                                    return c
                                }, Object.values(c));
                            return (0, T.jsx)(u.Provider, {
                                value: s,
                                children: l
                            })
                        };
                        return l.displayName = n + "Provider", [l, function(r, l) {
                            var c, u = (null == l || null == (c = l[t]) ? void 0 : c[i]) || a,
                                s = Y.useContext(u);
                            if (s) return s;
                            if (void 0 !== o) return o;
                            throw Error("`".concat(r, "` must be used within `").concat(n, "`"))
                        }]
                    }, oj.apply(void 0, [o].concat(oS(n)))]
                }(t = cG + "CollectionProvider"), 2))[0], a = n[1], l = (i = ox(o(t, {
                    collectionRef: {
                        current: null
                    },
                    itemMap: new Map
                }), 2))[0], c = i[1], (u = function(t) {
                    var n = t.scope,
                        r = t.children,
                        o = Z().useRef(null),
                        a = Z().useRef(new Map).current;
                    return (0, T.jsx)(l, {
                        scope: n,
                        itemMap: a,
                        collectionRef: o,
                        children: r
                    })
                }).displayName = t, f = oA(s = cG + "CollectionSlot"), (d = Z().forwardRef(function(t, n) {
                    var r = t.scope,
                        o = t.children,
                        a = oP(n, c(s, r).collectionRef);
                    return (0, T.jsx)(f, {
                        ref: a,
                        children: o
                    })
                })).displayName = s, v = "data-radix-collection-item", m = oA(p = cG + "CollectionItemSlot"), (h = Z().forwardRef(function(t, n) {
                    var r, o = t.scope,
                        a = t.children,
                        i = ow(t, ["scope", "children"]),
                        l = Z().useRef(null),
                        u = oP(n, l),
                        s = c(p, o);
                    return Z().useEffect(function() {
                        return s.itemMap.set(l, og({
                                ref: l
                            }, i)),
                            function() {
                                s.itemMap.delete(l)
                            }
                    }), (0, T.jsx)(m, (oy(r = {}, v, ""), oy(r, "ref", u), oy(r, "children", a), r))
                })).displayName = p, [{
                    Provider: u,
                    Slot: d,
                    ItemSlot: h
                }, function(t) {
                    var n = c(cG + "CollectionConsumer", t);
                    return Z().useCallback(function() {
                        var t = n.collectionRef.current;
                        if (!t) return [];
                        var r = Array.from(t.querySelectorAll("[".concat(v, "]")));
                        return Array.from(n.itemMap.values()).sort(function(t, n) {
                            return r.indexOf(t.ref.current) - r.indexOf(n.ref.current)
                        })
                    }, [n.collectionRef, n.itemMap])
                }, a]), 3),
                cZ = cY[0],
                c$ = cY[1],
                cQ = ck(function(t) {
                    var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        o = function() {
                            var n = r.map(function(t) {
                                return Y.createContext(t)
                            });
                            return function(r) {
                                var o = (null == r ? void 0 : r[t]) || n;
                                return Y.useMemo(function() {
                                    return cj({}, "__scope".concat(t), cA(cP({}, r), cj({}, t, o)))
                                }, [r, o])
                            }
                        };
                    return o.scopeName = t, [function(n, o) {
                        var a = Y.createContext(o),
                            i = r.length;
                        r = cR(r).concat([o]);
                        var l = function(n) {
                            var r, o = n.scope,
                                l = n.children,
                                c = cN(n, ["scope", "children"]),
                                u = (null == o || null == (r = o[t]) ? void 0 : r[i]) || a,
                                s = Y.useMemo(function() {
                                    return c
                                }, Object.values(c));
                            return (0, T.jsx)(u.Provider, {
                                value: s,
                                children: l
                            })
                        };
                        return l.displayName = n + "Provider", [l, function(r, l) {
                            var c, u = (null == l || null == (c = l[t]) ? void 0 : c[i]) || a,
                                s = Y.useContext(u);
                            if (s) return s;
                            if (void 0 !== o) return o;
                            throw Error("`".concat(r, "` must be used within `").concat(n, "`"))
                        }]
                    }, c_.apply(void 0, [o].concat(cR(n)))]
                }(cG, [cY[2], iO]), 2),
                cJ = cQ[0],
                c0 = (cQ[1], iO()),
                c1 = ck(cJ(cG), 2),
                c2 = c1[0],
                c3 = c1[1],
                c5 = ck(cJ(cG), 2),
                c4 = c5[0],
                c6 = c5[1],
                c8 = function(t) {
                    var n = t.__scopeSelect,
                        r = t.children,
                        o = t.open,
                        a = t.defaultOpen,
                        i = t.onOpenChange,
                        l = t.value,
                        c = t.defaultValue,
                        u = t.onValueChange,
                        s = t.dir,
                        f = t.name,
                        d = t.autoComplete,
                        p = t.disabled,
                        v = t.required,
                        m = t.form,
                        h = c0(n),
                        y = ck(Y.useState(null), 2),
                        g = y[0],
                        b = y[1],
                        w = ck(Y.useState(null), 2),
                        x = w[0],
                        S = w[1],
                        O = ck(Y.useState(!1), 2),
                        j = O[0],
                        E = O[1],
                        C = oD(s),
                        P = ck(cV({
                            prop: o,
                            defaultProp: a,
                            onChange: i
                        }), 2),
                        A = P[0],
                        N = P[1],
                        k = ck(cV({
                            prop: l,
                            defaultProp: c,
                            onChange: u
                        }), 2),
                        R = k[0],
                        D = k[1],
                        L = Y.useRef(null),
                        I = !g || m || !!g.closest("form"),
                        M = ck(Y.useState(new Set), 2),
                        _ = M[0],
                        F = M[1],
                        W = Array.from(_).map(function(t) {
                            return t.props.value
                        }).join(";");
                    return (0, T.jsx)(iP, cA(cP({}, h), {
                        children: (0, T.jsxs)(c2, {
                            required: v,
                            scope: n,
                            trigger: g,
                            onTriggerChange: b,
                            valueNode: x,
                            onValueNodeChange: S,
                            valueNodeHasChildren: j,
                            onValueNodeHasChildrenChange: E,
                            contentId: eq(),
                            value: R,
                            onValueChange: D,
                            open: void 0 !== A && A,
                            onOpenChange: N,
                            dir: C,
                            triggerPointerDownPosRef: L,
                            disabled: p,
                            children: [(0, T.jsx)(cZ.Provider, {
                                scope: n,
                                children: (0, T.jsx)(c4, {
                                    scope: t.__scopeSelect,
                                    onNativeOptionAdd: Y.useCallback(function(t) {
                                        F(function(n) {
                                            return new Set(n).add(t)
                                        })
                                    }, []),
                                    onNativeOptionRemove: Y.useCallback(function(t) {
                                        F(function(n) {
                                            var r = new Set(n);
                                            return r.delete(t), r
                                        })
                                    }, []),
                                    children: r
                                })
                            }), I ? (0, T.jsxs)(uM, {
                                "aria-hidden": !0,
                                required: v,
                                tabIndex: -1,
                                name: f,
                                autoComplete: d,
                                value: R,
                                onChange: function(t) {
                                    return D(t.target.value)
                                },
                                disabled: p,
                                form: m,
                                children: [void 0 === R ? (0, T.jsx)("option", {
                                    value: ""
                                }) : null, Array.from(_)]
                            }, W) : null]
                        })
                    }))
                };
            c8.displayName = cG;
            var c7 = "SelectTrigger",
                c9 = Y.forwardRef(function(t, n) {
                    var r = t.__scopeSelect,
                        o = t.disabled,
                        a = cN(t, ["__scopeSelect", "disabled"]),
                        i = c0(r),
                        l = c3(c7, r),
                        c = l.disabled || void 0 !== o && o,
                        u = cM(n, l.onTriggerChange),
                        s = c$(r),
                        f = Y.useRef("touch"),
                        d = ck(u_(function(t) {
                            var n = s().filter(function(t) {
                                    return !t.disabled
                                }),
                                r = n.find(function(t) {
                                    return t.value === l.value
                                }),
                                o = uF(n, t, r);
                            void 0 !== o && l.onValueChange(o.value)
                        }), 3),
                        p = d[0],
                        v = d[1],
                        m = d[2],
                        h = function(t) {
                            c || (l.onOpenChange(!0), m()), t && (l.triggerPointerDownPosRef.current = {
                                x: Math.round(t.pageX),
                                y: Math.round(t.pageY)
                            })
                        };
                    return (0, T.jsx)(iN, cA(cP({
                        asChild: !0
                    }, i), {
                        children: (0, T.jsx)(cB.button, cA(cP({
                            type: "button",
                            role: "combobox",
                            "aria-controls": l.contentId,
                            "aria-expanded": l.open,
                            "aria-required": l.required,
                            "aria-autocomplete": "none",
                            dir: l.dir,
                            "data-state": l.open ? "open" : "closed",
                            disabled: c,
                            "data-disabled": c ? "" : void 0,
                            "data-placeholder": uI(l.value) ? "" : void 0
                        }, a), {
                            ref: u,
                            onClick: cL(a.onClick, function(t) {
                                t.currentTarget.focus(), "mouse" !== f.current && h(t)
                            }),
                            onPointerDown: cL(a.onPointerDown, function(t) {
                                f.current = t.pointerType;
                                var n = t.target;
                                n.hasPointerCapture(t.pointerId) && n.releasePointerCapture(t.pointerId), 0 === t.button && !1 === t.ctrlKey && "mouse" === t.pointerType && (h(t), t.preventDefault())
                            }),
                            onKeyDown: cL(a.onKeyDown, function(t) {
                                var n = "" !== p.current;
                                t.ctrlKey || t.altKey || t.metaKey || 1 !== t.key.length || v(t.key), n && " " === t.key || cX.includes(t.key) && (h(), t.preventDefault())
                            })
                        }))
                    }))
                });
            c9.displayName = c7;
            var ue = "SelectValue",
                ut = Y.forwardRef(function(t, n) {
                    var r = t.__scopeSelect,
                        o = (t.className, t.style, t.children),
                        a = t.placeholder,
                        i = cN(t, ["__scopeSelect", "className", "style", "children", "placeholder"]),
                        l = c3(ue, r),
                        c = l.onValueNodeHasChildrenChange,
                        u = void 0 !== o,
                        s = cM(n, l.onValueNodeChange);
                    return cH(function() {
                        c(u)
                    }, [c, u]), (0, T.jsx)(cB.span, cA(cP({}, i), {
                        ref: s,
                        style: {
                            pointerEvents: "none"
                        },
                        children: uI(l.value) ? (0, T.jsx)(T.Fragment, {
                            children: void 0 === a ? "" : a
                        }) : o
                    }))
                });
            ut.displayName = ue;
            var un = Y.forwardRef(function(t, n) {
                t.__scopeSelect;
                var r = t.children,
                    o = cN(t, ["__scopeSelect", "children"]);
                return (0, T.jsx)(cB.span, cA(cP({
                    "aria-hidden": !0
                }, o), {
                    ref: n,
                    children: r || "▼"
                }))
            });
            un.displayName = "SelectIcon";
            var ur = function(t) {
                return (0, T.jsx)(tT, cP({
                    asChild: !0
                }, t))
            };
            ur.displayName = "SelectPortal";
            var uo = "SelectContent",
                ua = Y.forwardRef(function(t, n) {
                    var r = c3(uo, t.__scopeSelect),
                        o = ck(Y.useState(), 2),
                        a = o[0],
                        i = o[1];
                    return (cH(function() {
                        i(new DocumentFragment)
                    }, []), r.open) ? (0, T.jsx)(us, cA(cP({}, t), {
                        ref: n
                    })) : a ? eG.createPortal((0, T.jsx)(ul, {
                        scope: t.__scopeSelect,
                        children: (0, T.jsx)(cZ.Slot, {
                            scope: t.__scopeSelect,
                            children: (0, T.jsx)("div", {
                                children: t.children
                            })
                        })
                    }), a) : null
                });
            ua.displayName = uo;
            var ui = ck(cJ(uo), 2),
                ul = ui[0],
                uc = ui[1],
                uu = cF("SelectContent.RemoveScroll"),
                us = Y.forwardRef(function(t, n) {
                    var r = t.__scopeSelect,
                        o = t.position,
                        a = void 0 === o ? "item-aligned" : o,
                        i = t.onCloseAutoFocus,
                        l = t.onEscapeKeyDown,
                        c = t.onPointerDownOutside,
                        u = t.side,
                        s = t.sideOffset,
                        f = t.align,
                        d = t.alignOffset,
                        p = t.arrowPadding,
                        v = t.collisionBoundary,
                        m = t.collisionPadding,
                        h = t.sticky,
                        y = t.hideWhenDetached,
                        g = t.avoidCollisions,
                        b = cN(t, ["__scopeSelect", "position", "onCloseAutoFocus", "onEscapeKeyDown", "onPointerDownOutside", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "avoidCollisions"]),
                        w = c3(uo, r),
                        x = ck(Y.useState(null), 2),
                        S = x[0],
                        O = x[1],
                        j = ck(Y.useState(null), 2),
                        E = j[0],
                        C = j[1],
                        P = cM(n, function(t) {
                            return O(t)
                        }),
                        A = ck(Y.useState(null), 2),
                        N = A[0],
                        k = A[1],
                        R = ck(Y.useState(null), 2),
                        D = R[0],
                        L = R[1],
                        I = c$(r),
                        M = ck(Y.useState(!1), 2),
                        _ = M[0],
                        F = M[1],
                        W = Y.useRef(!1);
                    Y.useEffect(function() {
                        if (S) return tB(S)
                    }, [S]), td();
                    var U = Y.useCallback(function(t) {
                            var n = cO(u = I().map(function(t) {
                                    return t.ref.current
                                })) || cE(u) || cD(u) || cC(),
                                r = n[0],
                                o = ck(n.slice(1).slice(-1), 1)[0],
                                a = document.activeElement,
                                i = !0,
                                l = !1,
                                c = void 0;
                            try {
                                for (var u, s, f = t[Symbol.iterator](); !(i = (s = f.next()).done); i = !0) {
                                    var d = s.value;
                                    if (d === a || (null == d || d.scrollIntoView({
                                            block: "nearest"
                                        }), d === r && E && (E.scrollTop = 0), d === o && E && (E.scrollTop = E.scrollHeight), null == d || d.focus(), document.activeElement !== a)) return
                                }
                            } catch (t) {
                                l = !0, c = t
                            } finally {
                                try {
                                    i || null == f.return || f.return()
                                } finally {
                                    if (l) throw c
                                }
                            }
                        }, [I, E]),
                        B = Y.useCallback(function() {
                            return U([N, S])
                        }, [U, N, S]);
                    Y.useEffect(function() {
                        _ && B()
                    }, [_, B]);
                    var z = w.onOpenChange,
                        V = w.triggerPointerDownPosRef;
                    Y.useEffect(function() {
                        if (S) {
                            var t = {
                                    x: 0,
                                    y: 0
                                },
                                n = function(n) {
                                    var r, o, a, i;
                                    t = {
                                        x: Math.abs(Math.round(n.pageX) - (null != (a = null == (r = V.current) ? void 0 : r.x) ? a : 0)),
                                        y: Math.abs(Math.round(n.pageY) - (null != (i = null == (o = V.current) ? void 0 : o.y) ? i : 0))
                                    }
                                },
                                r = function(r) {
                                    t.x <= 10 && t.y <= 10 ? r.preventDefault() : S.contains(r.target) || z(!1), document.removeEventListener("pointermove", n), V.current = null
                                };
                            return null !== V.current && (document.addEventListener("pointermove", n), document.addEventListener("pointerup", r, {
                                    capture: !0,
                                    once: !0
                                })),
                                function() {
                                    document.removeEventListener("pointermove", n), document.removeEventListener("pointerup", r, {
                                        capture: !0
                                    })
                                }
                        }
                    }, [S, z, V]), Y.useEffect(function() {
                        var t = function() {
                            return z(!1)
                        };
                        return window.addEventListener("blur", t), window.addEventListener("resize", t),
                            function() {
                                window.removeEventListener("blur", t), window.removeEventListener("resize", t)
                            }
                    }, [z]);
                    var H = ck(u_(function(t) {
                            var n = I().filter(function(t) {
                                    return !t.disabled
                                }),
                                r = n.find(function(t) {
                                    return t.ref.current === document.activeElement
                                }),
                                o = uF(n, t, r);
                            o && setTimeout(function() {
                                return o.ref.current.focus()
                            })
                        }), 2),
                        K = H[0],
                        X = H[1],
                        q = Y.useCallback(function(t, n, r) {
                            var o = !W.current && !r;
                            (void 0 !== w.value && w.value === n || o) && (k(t), o && (W.current = !0))
                        }, [w.value]),
                        G = Y.useCallback(function() {
                            return null == S ? void 0 : S.focus()
                        }, [S]),
                        Z = Y.useCallback(function(t, n, r) {
                            var o = !W.current && !r;
                            (void 0 !== w.value && w.value === n || o) && L(t)
                        }, [w.value]),
                        $ = "popper" === a ? ud : uf,
                        Q = $ === ud ? {
                            side: u,
                            sideOffset: s,
                            align: f,
                            alignOffset: d,
                            arrowPadding: p,
                            collisionBoundary: v,
                            collisionPadding: m,
                            sticky: h,
                            hideWhenDetached: y,
                            avoidCollisions: g
                        } : {};
                    return (0, T.jsx)(ul, {
                        scope: r,
                        content: S,
                        viewport: E,
                        onViewportChange: C,
                        itemRefCallback: q,
                        selectedItem: N,
                        onItemLeave: G,
                        itemTextRefCallback: Z,
                        focusSelectedItem: B,
                        selectedItemText: D,
                        position: a,
                        isPositioned: _,
                        searchRef: K,
                        children: (0, T.jsx)(ng, {
                            as: uu,
                            allowPinchZoom: !0,
                            children: (0, T.jsx)(tO, {
                                asChild: !0,
                                trapped: w.open,
                                onMountAutoFocus: function(t) {
                                    t.preventDefault()
                                },
                                onUnmountAutoFocus: cL(i, function(t) {
                                    var n;
                                    null == (n = w.trigger) || n.focus({
                                        preventScroll: !0
                                    }), t.preventDefault()
                                }),
                                children: (0, T.jsx)(tc, {
                                    asChild: !0,
                                    disableOutsidePointerEvents: !0,
                                    onEscapeKeyDown: l,
                                    onPointerDownOutside: c,
                                    onFocusOutside: function(t) {
                                        return t.preventDefault()
                                    },
                                    onDismiss: function() {
                                        return w.onOpenChange(!1)
                                    },
                                    children: (0, T.jsx)($, cA(cP({
                                        role: "listbox",
                                        id: w.contentId,
                                        "data-state": w.open ? "open" : "closed",
                                        dir: w.dir,
                                        onContextMenu: function(t) {
                                            return t.preventDefault()
                                        }
                                    }, b, Q), {
                                        onPlaced: function() {
                                            return F(!0)
                                        },
                                        ref: P,
                                        style: cP({
                                            display: "flex",
                                            flexDirection: "column",
                                            outline: "none"
                                        }, b.style),
                                        onKeyDown: cL(b.onKeyDown, function(t) {
                                            var n = t.ctrlKey || t.altKey || t.metaKey;
                                            if ("Tab" === t.key && t.preventDefault(), n || 1 !== t.key.length || X(t.key), ["ArrowUp", "ArrowDown", "Home", "End"].includes(t.key)) {
                                                var r = I().filter(function(t) {
                                                    return !t.disabled
                                                }).map(function(t) {
                                                    return t.ref.current
                                                });
                                                if (["ArrowUp", "End"].includes(t.key) && (r = r.slice().reverse()), ["ArrowUp", "ArrowDown"].includes(t.key)) {
                                                    var o = t.target,
                                                        a = r.indexOf(o);
                                                    r = r.slice(a + 1)
                                                }
                                                setTimeout(function() {
                                                    return U(r)
                                                }), t.preventDefault()
                                            }
                                        })
                                    }))
                                })
                            })
                        })
                    })
                });
            us.displayName = "SelectContentImpl";
            var uf = Y.forwardRef(function(t, n) {
                var r = t.__scopeSelect,
                    o = t.onPlaced,
                    a = cN(t, ["__scopeSelect", "onPlaced"]),
                    i = c3(uo, r),
                    l = uc(uo, r),
                    c = ck(Y.useState(null), 2),
                    u = c[0],
                    s = c[1],
                    f = ck(Y.useState(null), 2),
                    d = f[0],
                    p = f[1],
                    v = cM(n, function(t) {
                        return p(t)
                    }),
                    m = c$(r),
                    h = Y.useRef(!1),
                    y = Y.useRef(!0),
                    g = l.viewport,
                    b = l.selectedItem,
                    w = l.selectedItemText,
                    x = l.focusSelectedItem,
                    S = Y.useCallback(function() {
                        if (i.trigger && i.valueNode && u && d && g && b && w) {
                            var t = i.trigger.getBoundingClientRect(),
                                n = d.getBoundingClientRect(),
                                r = i.valueNode.getBoundingClientRect(),
                                a = w.getBoundingClientRect();
                            if ("rtl" !== i.dir) {
                                var l = a.left - n.left,
                                    c = r.left - l,
                                    s = t.left - c,
                                    f = t.width + s,
                                    p = Math.max(f, n.width),
                                    v = om(c, [10, Math.max(10, window.innerWidth - 10 - p)]);
                                u.style.minWidth = f + "px", u.style.left = v + "px"
                            } else {
                                var y = n.right - a.right,
                                    x = window.innerWidth - r.right - y,
                                    S = window.innerWidth - t.right - x,
                                    O = t.width + S,
                                    j = Math.max(O, n.width),
                                    E = om(x, [10, Math.max(10, window.innerWidth - 10 - j)]);
                                u.style.minWidth = O + "px", u.style.right = E + "px"
                            }
                            var C = m(),
                                P = window.innerHeight - 20,
                                A = g.scrollHeight,
                                N = window.getComputedStyle(d),
                                k = parseInt(N.borderTopWidth, 10),
                                R = parseInt(N.paddingTop, 10),
                                D = parseInt(N.borderBottomWidth, 10),
                                L = k + R + A + parseInt(N.paddingBottom, 10) + D,
                                T = Math.min(5 * b.offsetHeight, L),
                                I = window.getComputedStyle(g),
                                M = parseInt(I.paddingTop, 10),
                                _ = parseInt(I.paddingBottom, 10),
                                F = t.top + t.height / 2 - 10,
                                W = b.offsetHeight / 2,
                                U = k + R + (b.offsetTop + W);
                            if (U <= F) {
                                var B = C.length > 0 && b === C[C.length - 1].ref.current;
                                u.style.bottom = "0px";
                                var z = U + Math.max(P - F, W + (B ? _ : 0) + (d.clientHeight - g.offsetTop - g.offsetHeight) + D);
                                u.style.height = z + "px"
                            } else {
                                var V = C.length > 0 && b === C[0].ref.current;
                                u.style.top = "0px";
                                var H = Math.max(F, k + g.offsetTop + (V ? M : 0) + W) + (L - U);
                                u.style.height = H + "px", g.scrollTop = U - F + g.offsetTop
                            }
                            u.style.margin = "".concat(10, "px 0"), u.style.minHeight = T + "px", u.style.maxHeight = P + "px", null == o || o(), requestAnimationFrame(function() {
                                return h.current = !0
                            })
                        }
                    }, [m, i.trigger, i.valueNode, u, d, g, b, w, i.dir, o]);
                cH(function() {
                    return S()
                }, [S]);
                var O = ck(Y.useState(), 2),
                    j = O[0],
                    E = O[1];
                cH(function() {
                    d && E(window.getComputedStyle(d).zIndex)
                }, [d]);
                var C = Y.useCallback(function(t) {
                    t && !0 === y.current && (S(), null == x || x(), y.current = !1)
                }, [S, x]);
                return (0, T.jsx)(uv, {
                    scope: r,
                    contentWrapper: u,
                    shouldExpandOnScrollRef: h,
                    onScrollButtonChange: C,
                    children: (0, T.jsx)("div", {
                        ref: s,
                        style: {
                            display: "flex",
                            flexDirection: "column",
                            position: "fixed",
                            zIndex: j
                        },
                        children: (0, T.jsx)(cB.div, cA(cP({}, a), {
                            ref: v,
                            style: cP({
                                boxSizing: "border-box",
                                maxHeight: "100%"
                            }, a.style)
                        }))
                    })
                })
            });
            uf.displayName = "SelectItemAlignedPosition";
            var ud = Y.forwardRef(function(t, n) {
                var r = t.__scopeSelect,
                    o = t.align,
                    a = t.collisionPadding,
                    i = cN(t, ["__scopeSelect", "align", "collisionPadding"]),
                    l = c0(r);
                return (0, T.jsx)(iT, cA(cP({}, l, i), {
                    ref: n,
                    align: void 0 === o ? "start" : o,
                    collisionPadding: void 0 === a ? 10 : a,
                    style: cA(cP({
                        boxSizing: "border-box"
                    }, i.style), {
                        "--radix-select-content-transform-origin": "var(--radix-popper-transform-origin)",
                        "--radix-select-content-available-width": "var(--radix-popper-available-width)",
                        "--radix-select-content-available-height": "var(--radix-popper-available-height)",
                        "--radix-select-trigger-width": "var(--radix-popper-anchor-width)",
                        "--radix-select-trigger-height": "var(--radix-popper-anchor-height)"
                    })
                }))
            });
            ud.displayName = "SelectPopperPosition";
            var up = ck(cJ(uo, {}), 2),
                uv = up[0],
                um = up[1],
                uh = "SelectViewport",
                uy = Y.forwardRef(function(t, n) {
                    var r = t.__scopeSelect,
                        o = t.nonce,
                        a = cN(t, ["__scopeSelect", "nonce"]),
                        i = uc(uh, r),
                        l = um(uh, r),
                        c = cM(n, i.onViewportChange),
                        u = Y.useRef(0);
                    return (0, T.jsxs)(T.Fragment, {
                        children: [(0, T.jsx)("style", {
                            dangerouslySetInnerHTML: {
                                __html: "[data-radix-select-viewport]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}[data-radix-select-viewport]::-webkit-scrollbar{display:none}"
                            },
                            nonce: o
                        }), (0, T.jsx)(cZ.Slot, {
                            scope: r,
                            children: (0, T.jsx)(cB.div, cA(cP({
                                "data-radix-select-viewport": "",
                                role: "presentation"
                            }, a), {
                                ref: c,
                                style: cP({
                                    position: "relative",
                                    flex: 1,
                                    overflow: "hidden auto"
                                }, a.style),
                                onScroll: cL(a.onScroll, function(t) {
                                    var n = t.currentTarget,
                                        r = l.contentWrapper,
                                        o = l.shouldExpandOnScrollRef;
                                    if ((null == o ? void 0 : o.current) && r) {
                                        var a = Math.abs(u.current - n.scrollTop);
                                        if (a > 0) {
                                            var i = window.innerHeight - 20,
                                                c = Math.max(parseFloat(r.style.minHeight), parseFloat(r.style.height));
                                            if (c < i) {
                                                var s = c + a,
                                                    f = Math.min(i, s),
                                                    d = s - f;
                                                r.style.height = f + "px", "0px" === r.style.bottom && (n.scrollTop = d > 0 ? d : 0, r.style.justifyContent = "flex-end")
                                            }
                                        }
                                    }
                                    u.current = n.scrollTop
                                })
                            }))
                        })]
                    })
                });
            uy.displayName = uh;
            var ug = "SelectGroup",
                ub = ck(cJ(ug), 2),
                uw = ub[0],
                ux = ub[1];
            Y.forwardRef(function(t, n) {
                var r = t.__scopeSelect,
                    o = cN(t, ["__scopeSelect"]),
                    a = eq();
                return (0, T.jsx)(uw, {
                    scope: r,
                    id: a,
                    children: (0, T.jsx)(cB.div, cA(cP({
                        role: "group",
                        "aria-labelledby": a
                    }, o), {
                        ref: n
                    }))
                })
            }).displayName = ug;
            var uS = "SelectLabel";
            Y.forwardRef(function(t, n) {
                var r = t.__scopeSelect,
                    o = cN(t, ["__scopeSelect"]),
                    a = ux(uS, r);
                return (0, T.jsx)(cB.div, cA(cP({
                    id: a.id
                }, o), {
                    ref: n
                }))
            }).displayName = uS;
            var uO = "SelectItem",
                uj = ck(cJ(uO), 2),
                uE = uj[0],
                uC = uj[1],
                uP = Y.forwardRef(function(t, n) {
                    var r = t.__scopeSelect,
                        o = t.value,
                        a = t.disabled,
                        i = void 0 !== a && a,
                        l = t.textValue,
                        c = cN(t, ["__scopeSelect", "value", "disabled", "textValue"]),
                        u = c3(uO, r),
                        s = uc(uO, r),
                        f = u.value === o,
                        d = ck(Y.useState(null != l ? l : ""), 2),
                        p = d[0],
                        v = d[1],
                        m = ck(Y.useState(!1), 2),
                        h = m[0],
                        y = m[1],
                        g = cM(n, function(t) {
                            var n;
                            return null == (n = s.itemRefCallback) ? void 0 : n.call(s, t, o, i)
                        }),
                        b = eq(),
                        w = Y.useRef("touch"),
                        x = function() {
                            i || (u.onValueChange(o), u.onOpenChange(!1))
                        };
                    if ("" === o) throw Error("A <Select.Item /> must have a value prop that is not an empty string. This is because the Select value can be set to an empty string to clear the selection and show the placeholder.");
                    return (0, T.jsx)(uE, {
                        scope: r,
                        value: o,
                        disabled: i,
                        textId: b,
                        isSelected: f,
                        onItemTextChange: Y.useCallback(function(t) {
                            v(function(n) {
                                var r;
                                return n || (null != (r = null == t ? void 0 : t.textContent) ? r : "").trim()
                            })
                        }, []),
                        children: (0, T.jsx)(cZ.ItemSlot, {
                            scope: r,
                            value: o,
                            disabled: i,
                            textValue: p,
                            children: (0, T.jsx)(cB.div, cA(cP({
                                role: "option",
                                "aria-labelledby": b,
                                "data-highlighted": h ? "" : void 0,
                                "aria-selected": f && h,
                                "data-state": f ? "checked" : "unchecked",
                                "aria-disabled": i || void 0,
                                "data-disabled": i ? "" : void 0,
                                tabIndex: i ? void 0 : -1
                            }, c), {
                                ref: g,
                                onFocus: cL(c.onFocus, function() {
                                    return y(!0)
                                }),
                                onBlur: cL(c.onBlur, function() {
                                    return y(!1)
                                }),
                                onClick: cL(c.onClick, function() {
                                    "mouse" !== w.current && x()
                                }),
                                onPointerUp: cL(c.onPointerUp, function() {
                                    "mouse" === w.current && x()
                                }),
                                onPointerDown: cL(c.onPointerDown, function(t) {
                                    w.current = t.pointerType
                                }),
                                onPointerMove: cL(c.onPointerMove, function(t) {
                                    var n;
                                    w.current = t.pointerType, i ? null == (n = s.onItemLeave) || n.call(s) : "mouse" === w.current && t.currentTarget.focus({
                                        preventScroll: !0
                                    })
                                }),
                                onPointerLeave: cL(c.onPointerLeave, function(t) {
                                    var n;
                                    t.currentTarget === document.activeElement && (null == (n = s.onItemLeave) || n.call(s))
                                }),
                                onKeyDown: cL(c.onKeyDown, function(t) {
                                    var n;
                                    "" !== (null == (n = s.searchRef) ? void 0 : n.current) && " " === t.key || (cq.includes(t.key) && x(), " " === t.key && t.preventDefault())
                                })
                            }))
                        })
                    })
                });
            uP.displayName = uO;
            var uA = "SelectItemText",
                uN = Y.forwardRef(function(t, n) {
                    var r = t.__scopeSelect,
                        o = (t.className, t.style, cN(t, ["__scopeSelect", "className", "style"])),
                        a = c3(uA, r),
                        i = uc(uA, r),
                        l = uC(uA, r),
                        c = c6(uA, r),
                        u = ck(Y.useState(null), 2),
                        s = u[0],
                        f = u[1],
                        d = cM(n, function(t) {
                            return f(t)
                        }, l.onItemTextChange, function(t) {
                            var n;
                            return null == (n = i.itemTextRefCallback) ? void 0 : n.call(i, t, l.value, l.disabled)
                        }),
                        p = null == s ? void 0 : s.textContent,
                        v = Y.useMemo(function() {
                            return (0, T.jsx)("option", {
                                value: l.value,
                                disabled: l.disabled,
                                children: p
                            }, l.value)
                        }, [l.disabled, l.value, p]),
                        m = c.onNativeOptionAdd,
                        h = c.onNativeOptionRemove;
                    return cH(function() {
                        return m(v),
                            function() {
                                return h(v)
                            }
                    }, [m, h, v]), (0, T.jsxs)(T.Fragment, {
                        children: [(0, T.jsx)(cB.span, cA(cP({
                            id: l.textId
                        }, o), {
                            ref: d
                        })), l.isSelected && a.valueNode && !a.valueNodeHasChildren ? eG.createPortal(o.children, a.valueNode) : null]
                    })
                });
            uN.displayName = uA;
            var uk = "SelectItemIndicator";
            Y.forwardRef(function(t, n) {
                var r = t.__scopeSelect,
                    o = cN(t, ["__scopeSelect"]);
                return uC(uk, r).isSelected ? (0, T.jsx)(cB.span, cA(cP({
                    "aria-hidden": !0
                }, o), {
                    ref: n
                })) : null
            }).displayName = uk;
            var uR = "SelectScrollUpButton";
            Y.forwardRef(function(t, n) {
                var r = uc(uR, t.__scopeSelect),
                    o = um(uR, t.__scopeSelect),
                    a = ck(Y.useState(!1), 2),
                    i = a[0],
                    l = a[1],
                    c = cM(n, o.onScrollButtonChange);
                return cH(function() {
                    if (r.viewport && r.isPositioned) {
                        var t = function() {
                                l(n.scrollTop > 0)
                            },
                            n = r.viewport;
                        return t(), n.addEventListener("scroll", t),
                            function() {
                                return n.removeEventListener("scroll", t)
                            }
                    }
                }, [r.viewport, r.isPositioned]), i ? (0, T.jsx)(uL, cA(cP({}, t), {
                    ref: c,
                    onAutoScroll: function() {
                        var t = r.viewport,
                            n = r.selectedItem;
                        t && n && (t.scrollTop = t.scrollTop - n.offsetHeight)
                    }
                })) : null
            }).displayName = uR;
            var uD = "SelectScrollDownButton";
            Y.forwardRef(function(t, n) {
                var r = uc(uD, t.__scopeSelect),
                    o = um(uD, t.__scopeSelect),
                    a = ck(Y.useState(!1), 2),
                    i = a[0],
                    l = a[1],
                    c = cM(n, o.onScrollButtonChange);
                return cH(function() {
                    if (r.viewport && r.isPositioned) {
                        var t = function() {
                                var t = n.scrollHeight - n.clientHeight;
                                l(Math.ceil(n.scrollTop) < t)
                            },
                            n = r.viewport;
                        return t(), n.addEventListener("scroll", t),
                            function() {
                                return n.removeEventListener("scroll", t)
                            }
                    }
                }, [r.viewport, r.isPositioned]), i ? (0, T.jsx)(uL, cA(cP({}, t), {
                    ref: c,
                    onAutoScroll: function() {
                        var t = r.viewport,
                            n = r.selectedItem;
                        t && n && (t.scrollTop = t.scrollTop + n.offsetHeight)
                    }
                })) : null
            }).displayName = uD;
            var uL = Y.forwardRef(function(t, n) {
                var r = t.__scopeSelect,
                    o = t.onAutoScroll,
                    a = cN(t, ["__scopeSelect", "onAutoScroll"]),
                    i = uc("SelectScrollButton", r),
                    l = Y.useRef(null),
                    c = c$(r),
                    u = Y.useCallback(function() {
                        null !== l.current && (window.clearInterval(l.current), l.current = null)
                    }, []);
                return Y.useEffect(function() {
                    return function() {
                        return u()
                    }
                }, [u]), cH(function() {
                    var t, n;
                    null == (n = c().find(function(t) {
                        return t.ref.current === document.activeElement
                    })) || null == (t = n.ref.current) || t.scrollIntoView({
                        block: "nearest"
                    })
                }, [c]), (0, T.jsx)(cB.div, cA(cP({
                    "aria-hidden": !0
                }, a), {
                    ref: n,
                    style: cP({
                        flexShrink: 0
                    }, a.style),
                    onPointerDown: cL(a.onPointerDown, function() {
                        null === l.current && (l.current = window.setInterval(o, 50))
                    }),
                    onPointerMove: cL(a.onPointerMove, function() {
                        var t;
                        null == (t = i.onItemLeave) || t.call(i), null === l.current && (l.current = window.setInterval(o, 50))
                    }),
                    onPointerLeave: cL(a.onPointerLeave, function() {
                        u()
                    })
                }))
            });
            Y.forwardRef(function(t, n) {
                t.__scopeSelect;
                var r = cN(t, ["__scopeSelect"]);
                return (0, T.jsx)(cB.div, cA(cP({
                    "aria-hidden": !0
                }, r), {
                    ref: n
                }))
            }).displayName = "SelectSeparator";
            var uT = "SelectArrow";

            function uI(t) {
                return "" === t || void 0 === t
            }
            Y.forwardRef(function(t, n) {
                var r = t.__scopeSelect,
                    o = cN(t, ["__scopeSelect"]),
                    a = c0(r),
                    i = c3(uT, r),
                    l = uc(uT, r);
                return i.open && "popper" === l.position ? (0, T.jsx)(i_, cA(cP({}, a, o), {
                    ref: n
                })) : null
            }).displayName = uT;
            var uM = Y.forwardRef(function(t, n) {
                var r, o = t.value,
                    a = cN(t, ["value"]),
                    i = Y.useRef(null),
                    l = cM(n, i),
                    c = (r = Y.useRef({
                        value: o,
                        previous: o
                    }), Y.useMemo(function() {
                        return r.current.value !== o && (r.current.previous = r.current.value, r.current.value = o), r.current.previous
                    }, [o]));
                return Y.useEffect(function() {
                    var t = i.current,
                        n = Object.getOwnPropertyDescriptor(window.HTMLSelectElement.prototype, "value").set;
                    if (c !== o && n) {
                        var r = new Event("change", {
                            bubbles: !0
                        });
                        n.call(t, o), t.dispatchEvent(r)
                    }
                }, [c, o]), (0, T.jsx)(cK, {
                    asChild: !0,
                    children: (0, T.jsx)("select", cA(cP({}, a), {
                        ref: l,
                        defaultValue: o
                    }))
                })
            });

            function u_(t) {
                var n = cz(t),
                    r = Y.useRef(""),
                    o = Y.useRef(0),
                    a = Y.useCallback(function(t) {
                        var a = r.current + t;
                        n(a),
                            function t(n) {
                                r.current = n, window.clearTimeout(o.current), "" !== n && (o.current = window.setTimeout(function() {
                                    return t("")
                                }, 1e3))
                            }(a)
                    }, [n]),
                    i = Y.useCallback(function() {
                        r.current = "", window.clearTimeout(o.current)
                    }, []);
                return Y.useEffect(function() {
                    return function() {
                        return window.clearTimeout(o.current)
                    }
                }, []), [r, a, i]
            }

            function uF(t, n, r) {
                var o, a = n.length > 1 && Array.from(n).every(function(t) {
                        return t === n[0]
                    }) ? n[0] : n,
                    i = (o = Math.max(r ? t.indexOf(r) : -1, 0), t.map(function(n, r) {
                        return t[(o + r) % t.length]
                    }));
                1 === a.length && (i = i.filter(function(t) {
                    return t !== r
                }));
                var l = i.find(function(t) {
                    return t.textValue.toLowerCase().startsWith(a.toLowerCase())
                });
                return l !== r ? l : void 0
            }
            uM.displayName = "BubbleSelect", rx(".foundation-web-menu-separator{border-top:1px solid var(--color-stroke-default)}");
            var uW = (0, Y.createContext)(null),
                uU = {
                    XSmall: "size-300",
                    Small: "size-400",
                    Medium: "size-500",
                    Large: "size-600"
                },
                uB = {
                    XSmall: "padding-x-medium",
                    Small: "padding-x-medium",
                    Medium: "padding-x-medium",
                    Large: "padding-x-large"
                },
                uz = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium",
                    Large: "text-title-large"
                },
                uV = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                uH = {
                    XSmall: "gap-xsmall",
                    Small: "gap-small",
                    Medium: "gap-small",
                    Large: "gap-small"
                },
                uK = {
                    XSmall: "radius-small",
                    Small: "radius-medium",
                    Medium: "radius-medium",
                    Large: "radius-medium"
                },
                uX = {
                    XSmall: "height-600",
                    Small: "height-800",
                    Medium: "height-1000",
                    Large: "height-1200"
                },
                uq = (0, Y.forwardRef)(function(t, n) {
                    var r = t.label,
                        o = t.labelTooltip,
                        a = t.ariaLabelledBy,
                        i = t.ariaLabel,
                        l = t.className,
                        c = t.size,
                        u = t.variant,
                        s = void 0 === u ? "Standard" : u,
                        f = t.value,
                        d = t.placeholder,
                        p = t.isDisabled,
                        v = t.hasError,
                        m = t.hint,
                        h = t.onValueChange,
                        y = t.onOpenChange,
                        g = t.children,
                        b = iz(),
                        w = (0, Y.useMemo)(function() {
                            return {
                                size: c
                            }
                        }, [c]),
                        x = r ? Z().createElement("span", {
                            id: b,
                            className: ez(uz[c], "content-emphasis")
                        }, r) : null;
                    return Z().createElement(uW.Provider, {
                        value: w
                    }, Z().createElement("div", {
                        className: ez("flex flex-col", p && [rQ, "pointer-events-none"], uH[c], l)
                    }, x && (o ? Z().createElement("div", {
                        className: "flex items-center gap-xsmall"
                    }, x, Z().createElement(cb, Object.assign({}, o))) : x), Z().createElement(c8, {
                        value: f,
                        disabled: p,
                        onValueChange: h,
                        onOpenChange: y
                    }, Z().createElement(c9, {
                        className: ez("relative clip group/interactable outline-none", "foundation-web-input flex items-center justify-between width-full cursor-pointer", cw[s], cx[s], uK[c], uX[c], uB[c], uV[c], v ? "stroke-system-alert" : "stroke-contrast-alpha", void 0 === f ? "content-muted" : "content-default"),
                        ref: n,
                        "aria-labelledby": r ? b : a,
                        "aria-label": i
                    }, Z().createElement(rE, null), Z().createElement("div", {
                        className: "grow-1 text-truncate-split text-align-x-left"
                    }, Z().createElement(ut, {
                        placeholder: d
                    })), Z().createElement(un, {
                        className: ez(uU[c], "icon icon-regular-chevron-large-down content-default")
                    })), Z().createElement(ur, null, Z().createElement(ua, {
                        position: "popper",
                        className: "padding-y-small foundation-web-portal-zindex",
                        style: {
                            maxHeight: "var(--radix-select-content-available-height)"
                        }
                    }, g))), m && Z().createElement("span", {
                        className: ez("text-caption-small", {
                            "content-system-alert": v,
                            "content-default": !v
                        })
                    }, m)))
                });

            function uG(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function uY(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function uZ(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        uY(t, n, r[n])
                    })
                }
                return t
            }

            function u$(t, n) {
                return n = null != n ? n : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(n)) : (function(t, n) {
                    var r = Object.keys(t);
                    if (Object.getOwnPropertySymbols) {
                        var o = Object.getOwnPropertySymbols(t);
                        r.push.apply(r, o)
                    }
                    return r
                })(Object(n)).forEach(function(r) {
                    Object.defineProperty(t, r, Object.getOwnPropertyDescriptor(n, r))
                }), t
            }

            function uQ(t, n) {
                if (null == t) return {};
                var r, o, a = function(t, n) {
                    if (null == t) return {};
                    var r, o, a = {},
                        i = Object.keys(t);
                    for (o = 0; o < i.length; o++) r = i[o], n.indexOf(r) >= 0 || (a[r] = t[r]);
                    return a
                }(t, n);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(t);
                    for (o = 0; o < i.length; o++) r = i[o], !(n.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(t, r) && (a[r] = t[r])
                }
                return a
            }

            function uJ(t, n) {
                return function(t) {
                    if (Array.isArray(t)) return t
                }(t) || function(t, n) {
                    var r, o, a = null == t ? null : "undefined" != typeof Symbol && t[Symbol.iterator] || t["@@iterator"];
                    if (null != a) {
                        var i = [],
                            l = !0,
                            c = !1;
                        try {
                            for (a = a.call(t); !(l = (r = a.next()).done) && (i.push(r.value), !n || i.length !== n); l = !0);
                        } catch (t) {
                            c = !0, o = t
                        } finally {
                            try {
                                l || null == a.return || a.return()
                            } finally {
                                if (c) throw o
                            }
                        }
                        return i
                    }
                }(t, n) || u1(t, n) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function u0(t) {
                return function(t) {
                    if (Array.isArray(t)) return uG(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || u1(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function u1(t, n) {
                if (t) {
                    if ("string" == typeof t) return uG(t, n);
                    var r = Object.prototype.toString.call(t).slice(8, -1);
                    if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return uG(t, n)
                }
            }

            function u2(t, n) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    o = r.checkForDefaultPrevented,
                    a = void 0 === o || o;
                return function(r) {
                    if (null == t || t(r), !1 === a || !r.defaultPrevented) return null == n ? void 0 : n(r)
                }
            }

            function u3(t) {
                var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    r = [],
                    o = function() {
                        var n = r.map(function(t) {
                            return Y.createContext(t)
                        });
                        return function(r) {
                            var o = (null == r ? void 0 : r[t]) || n;
                            return Y.useMemo(function() {
                                return uY({}, "__scope".concat(t), u$(uZ({}, r), uY({}, t, o)))
                            }, [r, o])
                        }
                    };
                return o.scopeName = t, [function(n, o) {
                    var a = Y.createContext(o),
                        i = r.length;
                    r = u0(r).concat([o]);
                    var l = function(n) {
                        var r, o = n.scope,
                            l = n.children,
                            c = uQ(n, ["scope", "children"]),
                            u = (null == o || null == (r = o[t]) ? void 0 : r[i]) || a,
                            s = Y.useMemo(function() {
                                return c
                            }, Object.values(c));
                        return (0, T.jsx)(u.Provider, {
                            value: s,
                            children: l
                        })
                    };
                    return l.displayName = n + "Provider", [l, function(r, l) {
                        var c, u = (null == l || null == (c = l[t]) ? void 0 : c[i]) || a,
                            s = Y.useContext(u);
                        if (s) return s;
                        if (void 0 !== o) return o;
                        throw Error("`".concat(r, "` must be used within `").concat(n, "`"))
                    }]
                }, u5.apply(void 0, [o].concat(u0(n)))]
            }

            function u5() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                var o = n[0];
                if (1 === n.length) return o;
                var a = function() {
                    var t = n.map(function(t) {
                        return {
                            useScope: t(),
                            scopeName: t.scopeName
                        }
                    });
                    return function(n) {
                        var r = t.reduce(function(t, r) {
                            var o = r.useScope,
                                a = r.scopeName;
                            return uZ({}, t, o(n)["__scope".concat(a)])
                        }, {});
                        return Y.useMemo(function() {
                            return uY({}, "__scope".concat(o.scopeName), r)
                        }, [r])
                    }
                };
                return a.scopeName = o.scopeName, a
            }

            function u4(t, n) {
                if ("function" == typeof t) return t(n);
                null != t && (t.current = n)
            }

            function u6() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return function(t) {
                    var r = !1,
                        o = n.map(function(n) {
                            var o = u4(n, t);
                            return r || "function" != typeof o || (r = !0), o
                        });
                    if (r) return function() {
                        for (var t = 0; t < o.length; t++) {
                            var r = o[t];
                            "function" == typeof r ? r() : u4(n[t], null)
                        }
                    }
                }
            }

            function u8() {
                for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return Y.useCallback(u6.apply(void 0, u0(n)), n)
            }

            function u7(t) {
                var n, r, o = (n = t, (r = Y.forwardRef(function(t, n) {
                        var r = t.children,
                            o = uQ(t, ["children"]);
                        if (Y.isValidElement(r)) {
                            var a, i, l, c = (l = null == (a = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning ? r.ref : (l = null == (i = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                                u = function(t, n) {
                                    var r = uZ({}, n);
                                    for (var o in n) ! function(o) {
                                        var a = t[o],
                                            i = n[o];
                                        /^on[A-Z]/.test(o) ? a && i ? r[o] = function() {
                                            for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                                            var o = i.apply(void 0, u0(n));
                                            return a.apply(void 0, u0(n)), o
                                        } : a && (r[o] = a) : "style" === o ? r[o] = uZ({}, a, i) : "className" === o && (r[o] = [a, i].filter(Boolean).join(" "))
                                    }(o);
                                    return uZ({}, t, r)
                                }(o, r.props);
                            return r.type !== Y.Fragment && (u.ref = n ? u6(n, c) : c), Y.cloneElement(r, u)
                        }
                        return Y.Children.count(r) > 1 ? Y.Children.only(null) : null
                    })).displayName = "".concat(n, ".SlotClone"), r),
                    a = Y.forwardRef(function(t, n) {
                        var r = t.children,
                            a = uQ(t, ["children"]),
                            i = Y.Children.toArray(r),
                            l = i.find(se);
                        if (l) {
                            var c = l.props.children,
                                u = i.map(function(t) {
                                    return t === l ? Y.Children.count(c) > 1 ? Y.Children.only(null) : Y.isValidElement(c) ? c.props.children : null : t
                                });
                            return (0, T.jsx)(o, u$(uZ({}, a), {
                                ref: n,
                                children: Y.isValidElement(c) ? Y.cloneElement(c, void 0, u) : null
                            }))
                        }
                        return (0, T.jsx)(o, u$(uZ({}, a), {
                            ref: n,
                            children: r
                        }))
                    });
                return a.displayName = "".concat(t, ".Slot"), a
            }
            uq.displayName = "Dropdown";
            var u9 = Symbol("radix.slottable");

            function se(t) {
                return Y.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === u9
            }
            var st = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(t, n) {
                    var r = u7("Primitive.".concat(n)),
                        o = Y.forwardRef(function(t, o) {
                            var a = t.asChild,
                                i = uQ(t, ["asChild"]),
                                l = a ? r : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, T.jsx)(l, u$(uZ({}, i), {
                                ref: o
                            }))
                        });
                    return o.displayName = "Primitive.".concat(n), u$(uZ({}, t), uY({}, n, o))
                }, {}),
                sn = (null == (L = globalThis) ? void 0 : L.document) ? Y.useLayoutEffect : function() {},
                sr = Y[" useInsertionEffect ".trim().toString()] || sn,
                so = "rovingFocusGroup.onEntryFocus",
                sa = {
                    bubbles: !1,
                    cancelable: !0
                },
                si = "RovingFocusGroup",
                sl = (b = (g = uJ(u3(y = si + "CollectionProvider"), 2))[0], w = g[1], S = (x = uJ(b(y, {
                    collectionRef: {
                        current: null
                    },
                    itemMap: new Map
                }), 2))[0], O = x[1], (j = function(t) {
                    var n = t.scope,
                        r = t.children,
                        o = Z().useRef(null),
                        a = Z().useRef(new Map).current;
                    return (0, T.jsx)(S, {
                        scope: n,
                        itemMap: a,
                        collectionRef: o,
                        children: r
                    })
                }).displayName = y, C = u7(E = si + "CollectionSlot"), (P = Z().forwardRef(function(t, n) {
                    var r = t.scope,
                        o = t.children,
                        a = u8(n, O(E, r).collectionRef);
                    return (0, T.jsx)(C, {
                        ref: a,
                        children: o
                    })
                })).displayName = E, N = "data-radix-collection-item", k = u7(A = si + "CollectionItemSlot"), (R = Z().forwardRef(function(t, n) {
                    var r, o = t.scope,
                        a = t.children,
                        i = uQ(t, ["scope", "children"]),
                        l = Z().useRef(null),
                        c = u8(n, l),
                        u = O(A, o);
                    return Z().useEffect(function() {
                        return u.itemMap.set(l, uZ({
                                ref: l
                            }, i)),
                            function() {
                                u.itemMap.delete(l)
                            }
                    }), (0, T.jsx)(k, (uY(r = {}, N, ""), uY(r, "ref", c), uY(r, "children", a), r))
                })).displayName = A, [{
                    Provider: j,
                    Slot: P,
                    ItemSlot: R
                }, function(t) {
                    var n = O(si + "CollectionConsumer", t);
                    return Z().useCallback(function() {
                        var t = n.collectionRef.current;
                        if (!t) return [];
                        var r = Array.from(t.querySelectorAll("[".concat(N, "]")));
                        return Array.from(n.itemMap.values()).sort(function(t, n) {
                            return r.indexOf(t.ref.current) - r.indexOf(n.ref.current)
                        })
                    }, [n.collectionRef, n.itemMap])
                }, w]),
                sc = uJ(sl, 3),
                su = sc[0],
                ss = sc[1],
                sf = uJ(u3(si, [sc[2]]), 2),
                sd = sf[0],
                sp = (sf[1], uJ(sd(si), 2)),
                sv = sp[0],
                sm = sp[1],
                sh = Y.forwardRef(function(t, n) {
                    return (0, T.jsx)(su.Provider, {
                        scope: t.__scopeRovingFocusGroup,
                        children: (0, T.jsx)(su.Slot, {
                            scope: t.__scopeRovingFocusGroup,
                            children: (0, T.jsx)(sy, u$(uZ({}, t), {
                                ref: n
                            }))
                        })
                    })
                });
            sh.displayName = si;
            var sy = Y.forwardRef(function(t, n) {
                    var r, o, a, i, l, c, u, s, f, d, p, v, m, h, y, g, b, w, x, S, O, j = t.__scopeRovingFocusGroup,
                        E = t.orientation,
                        C = t.loop,
                        P = t.dir,
                        A = t.currentTabStopId,
                        N = t.defaultCurrentTabStopId,
                        k = t.onCurrentTabStopIdChange,
                        R = t.onEntryFocus,
                        D = t.preventScrollOnEntryFocus,
                        L = void 0 !== D && D,
                        I = uQ(t, ["__scopeRovingFocusGroup", "orientation", "loop", "dir", "currentTabStopId", "defaultCurrentTabStopId", "onCurrentTabStopIdChange", "onEntryFocus", "preventScrollOnEntryFocus"]),
                        M = Y.useRef(null),
                        _ = u8(n, M),
                        F = oD(P),
                        W = uJ((o = (r = {
                            prop: A,
                            defaultProp: null != N ? N : null,
                            onChange: k,
                            caller: si
                        }).prop, a = r.defaultProp, i = r.onChange, l = r.caller, y = (h = uJ((u = (c = {
                            defaultProp: a,
                            onChange: void 0 === i ? function() {} : i
                        }).defaultProp, s = c.onChange, d = (f = uJ(Y.useState(u), 2))[0], p = f[1], v = Y.useRef(d), m = Y.useRef(s), sr(function() {
                            m.current = s
                        }, [s]), Y.useEffect(function() {
                            var t;
                            v.current !== d && (null == (t = m.current) || t.call(m, d), v.current = d)
                        }, [d, v]), [d, p, m]), 3))[0], g = h[1], b = h[2], x = (w = void 0 !== o) ? o : y, S = Y.useRef(void 0 !== o), Y.useEffect(function() {
                            var t = S.current;
                            if (t !== w) {
                                var n = w ? "controlled" : "uncontrolled";
                                console.warn("".concat(l, " is changing from ").concat(t ? "controlled" : "uncontrolled", " to ").concat(n, ". Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component."))
                            }
                            S.current = w
                        }, [w, l]), [x, Y.useCallback(function(t) {
                            if (w) {
                                var n, r = "function" == typeof t ? t(o) : t;
                                r !== o && (null == (n = b.current) || n.call(b, r))
                            } else g(t)
                        }, [w, o, g, b])]), 2),
                        U = W[0],
                        B = W[1],
                        z = uJ(Y.useState(!1), 2),
                        V = z[0],
                        H = z[1],
                        K = (O = Y.useRef(R), Y.useEffect(function() {
                            O.current = R
                        }), Y.useMemo(function() {
                            return function() {
                                for (var t, n = arguments.length, r = Array(n), o = 0; o < n; o++) r[o] = arguments[o];
                                return null == (t = O.current) ? void 0 : t.call.apply(t, [O].concat(u0(r)))
                            }
                        }, [])),
                        X = ss(j),
                        q = Y.useRef(!1),
                        G = uJ(Y.useState(0), 2),
                        Z = G[0],
                        $ = G[1];
                    return Y.useEffect(function() {
                        var t = M.current;
                        if (t) return t.addEventListener(so, K),
                            function() {
                                return t.removeEventListener(so, K)
                            }
                    }, [K]), (0, T.jsx)(sv, {
                        scope: j,
                        orientation: E,
                        dir: F,
                        loop: void 0 !== C && C,
                        currentTabStopId: U,
                        onItemFocus: Y.useCallback(function(t) {
                            return B(t)
                        }, [B]),
                        onItemShiftTab: Y.useCallback(function() {
                            return H(!0)
                        }, []),
                        onFocusableItemAdd: Y.useCallback(function() {
                            return $(function(t) {
                                return t + 1
                            })
                        }, []),
                        onFocusableItemRemove: Y.useCallback(function() {
                            return $(function(t) {
                                return t - 1
                            })
                        }, []),
                        children: (0, T.jsx)(st.div, u$(uZ({
                            tabIndex: V || 0 === Z ? -1 : 0,
                            "data-orientation": E
                        }, I), {
                            ref: _,
                            style: uZ({
                                outline: "none"
                            }, t.style),
                            onMouseDown: u2(t.onMouseDown, function() {
                                q.current = !0
                            }),
                            onFocus: u2(t.onFocus, function(t) {
                                var n = !q.current;
                                if (t.target === t.currentTarget && n && !V) {
                                    var r = new CustomEvent(so, sa);
                                    if (t.currentTarget.dispatchEvent(r), !r.defaultPrevented) {
                                        var o = X().filter(function(t) {
                                            return t.focusable
                                        });
                                        sx([o.find(function(t) {
                                            return t.active
                                        }), o.find(function(t) {
                                            return t.id === U
                                        })].concat(u0(o)).filter(Boolean).map(function(t) {
                                            return t.ref.current
                                        }), L)
                                    }
                                }
                                q.current = !1
                            }),
                            onBlur: u2(t.onBlur, function() {
                                return H(!1)
                            })
                        }))
                    })
                }),
                sg = "RovingFocusGroupItem",
                sb = Y.forwardRef(function(t, n) {
                    var r = t.__scopeRovingFocusGroup,
                        o = t.focusable,
                        a = void 0 === o || o,
                        i = t.active,
                        l = t.tabStopId,
                        c = t.children,
                        u = uQ(t, ["__scopeRovingFocusGroup", "focusable", "active", "tabStopId", "children"]),
                        s = eq(),
                        f = l || s,
                        d = sm(sg, r),
                        p = d.currentTabStopId === f,
                        v = ss(r),
                        m = d.onFocusableItemAdd,
                        h = d.onFocusableItemRemove,
                        y = d.currentTabStopId;
                    return Y.useEffect(function() {
                        if (a) return m(),
                            function() {
                                return h()
                            }
                    }, [a, m, h]), (0, T.jsx)(su.ItemSlot, {
                        scope: r,
                        id: f,
                        focusable: a,
                        active: void 0 !== i && i,
                        children: (0, T.jsx)(st.span, u$(uZ({
                            tabIndex: p ? 0 : -1,
                            "data-orientation": d.orientation
                        }, u), {
                            ref: n,
                            onMouseDown: u2(t.onMouseDown, function(t) {
                                a ? d.onItemFocus(f) : t.preventDefault()
                            }),
                            onFocus: u2(t.onFocus, function() {
                                return d.onItemFocus(f)
                            }),
                            onKeyDown: u2(t.onKeyDown, function(t) {
                                if ("Tab" === t.key && t.shiftKey) return void d.onItemShiftTab();
                                if (t.target === t.currentTarget) {
                                    var n, r, o, a, i, l, c = (n = d.orientation, r = d.dir, o = t.key, a = "rtl" !== r ? o : "ArrowLeft" === o ? "ArrowRight" : "ArrowRight" === o ? "ArrowLeft" : o, "vertical" === n && ["ArrowLeft", "ArrowRight"].includes(a) || "horizontal" === n && ["ArrowUp", "ArrowDown"].includes(a) ? void 0 : sw[a]);
                                    if (void 0 !== c) {
                                        if (t.metaKey || t.ctrlKey || t.altKey || t.shiftKey) return;
                                        t.preventDefault();
                                        var u = v().filter(function(t) {
                                            return t.focusable
                                        }).map(function(t) {
                                            return t.ref.current
                                        });
                                        if ("last" === c) u.reverse();
                                        else if ("prev" === c || "next" === c) {
                                            "prev" === c && u.reverse();
                                            var s = u.indexOf(t.currentTarget);
                                            u = d.loop ? (l = s + 1, (i = u).map(function(t, n) {
                                                return i[(l + n) % i.length]
                                            })) : u.slice(s + 1)
                                        }
                                        setTimeout(function() {
                                            return sx(u)
                                        })
                                    }
                                }
                            }),
                            children: "function" == typeof c ? c({
                                isCurrentTabStop: p,
                                hasTabStop: null != y
                            }) : c
                        }))
                    })
                });
            sb.displayName = sg;
            var sw = {
                ArrowLeft: "prev",
                ArrowUp: "prev",
                ArrowRight: "next",
                ArrowDown: "next",
                PageUp: "first",
                Home: "first",
                PageDown: "last",
                End: "last"
            };

            function sx(t) {
                var n = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                    r = document.activeElement,
                    o = !0,
                    a = !1,
                    i = void 0;
                try {
                    for (var l, c = t[Symbol.iterator](); !(o = (l = c.next()).done); o = !0) {
                        var u = l.value;
                        if (u === r || (u.focus({
                                preventScroll: n
                            }), document.activeElement !== r)) return
                    }
                } catch (t) {
                    a = !0, i = t
                } finally {
                    try {
                        o || null == c.return || c.return()
                    } finally {
                        if (a) throw i
                    }
                }
            }
            var sS = {
                    XSmall: "radius-medium",
                    Small: "radius-large",
                    Medium: "radius-large",
                    Large: "radius-large"
                },
                sO = {
                    XSmall: "padding-xsmall",
                    Small: "padding-small",
                    Medium: "padding-small",
                    Large: "padding-small"
                },
                sj = {
                    XSmall: "padding-x-medium",
                    Small: "padding-x-medium",
                    Medium: "padding-x-medium",
                    Large: "padding-x-large"
                },
                sE = {
                    XSmall: "padding-y-xsmall",
                    Small: "padding-y-small",
                    Medium: "padding-y-small",
                    Large: "padding-y-medium"
                },
                sC = {
                    XSmall: "gap-x-medium",
                    Small: "gap-x-medium",
                    Medium: "gap-x-medium",
                    Large: "gap-x-large"
                },
                sP = {
                    XSmall: "gap-y-xxsmall",
                    Small: "gap-y-xxsmall",
                    Medium: "gap-y-xsmall",
                    Large: "gap-y-xsmall"
                },
                sA = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                sN = {
                    XSmall: "radius-small",
                    Small: "radius-medium",
                    Medium: "radius-medium",
                    Large: "radius-medium"
                },
                sk = (0, Y.createContext)(null),
                sR = function() {
                    var t = (0, Y.useContext)(sk);
                    if (!t) throw Error("Menu components must be used within a Menu");
                    return t
                },
                sD = function(t) {
                    var n, r = t.children,
                        o = t.className,
                        a = t.size,
                        i = (0, Y.useContext)(uW),
                        l = i ? "dropdown" : "standalone",
                        c = null != (n = null != a ? a : null == i ? void 0 : i.size) ? n : "Medium",
                        u = (0, Y.useMemo)(function() {
                            return {
                                size: c,
                                mode: l
                            }
                        }, [c, l]),
                        s = ez("foundation-web-menu bg-surface-100 stroke-standard stroke-default shadow-transient-high", sS[c], o),
                        f = "standalone" === l ? Z().createElement(sh, {
                            asChild: !0,
                            orientation: "vertical",
                            loop: !0
                        }, Z().createElement("div", {
                            role: "menu",
                            tabIndex: -1,
                            className: s
                        }, r)) : Z().createElement("div", {
                            className: s
                        }, r);
                    return Z().createElement(sk.Provider, {
                        value: u
                    }, "dropdown" === l ? Z().createElement(uy, {
                        asChild: !0,
                        style: {
                            width: "var(--radix-popper-anchor-width)"
                        }
                    }, f) : f)
                },
                sL = function(t) {
                    var n = t.children,
                        r = t.className,
                        o = sR().size;
                    return Z().createElement("div", {
                        role: "group",
                        className: ez(sO[o], r)
                    }, n)
                },
                sT = function(t) {
                    var n, r = t.value,
                        o = t.leading,
                        a = t.title,
                        i = t.description,
                        l = t.trailing,
                        c = t.disabled,
                        u = t.className,
                        s = t.onSelect,
                        f = t.asChild,
                        d = t.children,
                        p = eB(t, ["value", "leading", "title", "description", "trailing", "disabled", "className", "onSelect", "asChild", "children"]),
                        v = sR(),
                        m = v.size,
                        h = v.mode,
                        y = ez(rj, "foundation-web-menu-item flex items-center content-default text-truncate-split focus-visible:hover:outline-none cursor-pointer stroke-none bg-none text-align-x-left width-full", sA[m], sj[m], sE[m], sC[m], sN[m], c && rQ, c && "pointer-events-none", u),
                        g = Z().createElement("span", {
                            className: "foundation-web-menu-item-title text-no-wrap text-truncate-split content-emphasis"
                        }, a);
                    switch (h) {
                        case "dropdown":
                            g = Z().createElement(uN, {
                                asChild: !0
                            }, g);
                            break;
                        case "standalone":
                            break;
                        default:
                            console.error("Invalid menu mode:", h)
                    }
                    var b = Z().createElement(Z().Fragment, null, !c && Z().createElement(rE, null), o, Z().createElement("div", {
                        className: ez("grow-1 text-truncate-split flex flex-col", sP[m])
                    }, g, i && Z().createElement("div", {
                        className: "foundation-web-menu-item-description content-muted"
                    }, i)), l);
                    if (f) {
                        var w = eB(p, ["as"]),
                            x = Z().Children.only(d),
                            S = void 0 === a && x.props.children;
                        n = Z().createElement(rY, Object.assign({}, w, {
                            role: "standalone" === h ? "menuitem" : void 0,
                            "aria-disabled": c || void 0,
                            className: y,
                            style: {
                                outlineOffset: 0
                            },
                            onClick: c ? void 0 : s
                        }), S ? Z().cloneElement(x, {}, Z().createElement(Z().Fragment, null, !c && Z().createElement(rE, null), x.props.children)) : Z().cloneElement(x, {}, b))
                    } else if ("a" === p.as) {
                        p.as;
                        var O = p.href,
                            j = eB(p, ["as", "href"]);
                        n = Z().createElement("a", Object.assign({}, j, {
                            role: "standalone" === h ? "menuitem" : void 0,
                            "aria-disabled": c,
                            href: c ? void 0 : O,
                            className: y,
                            style: {
                                outlineOffset: 0,
                                textDecoration: "none"
                            },
                            onClick: c ? void 0 : s
                        }), b)
                    } else {
                        var E = eB(p, ["as"]);
                        n = Z().createElement("button", Object.assign({
                            type: "button"
                        }, E, {
                            role: "standalone" === h ? "menuitem" : void 0,
                            "aria-disabled": c,
                            className: y,
                            style: {
                                outlineOffset: 0
                            },
                            onClick: c ? void 0 : s
                        }), b)
                    }
                    return "dropdown" === h ? Z().createElement(uP, {
                        value: r,
                        disabled: c,
                        asChild: !0
                    }, n) : Z().createElement(sb, {
                        asChild: !0,
                        focusable: !0,
                        tabStopId: r
                    }, n)
                };
            rx("@keyframes progress-circle-rotate{0%{transform:rotate(0deg)}to{transform:rotate(1turn)}}.foundation-web-progress-circle-indeterminate{animation:progress-circle-rotate 1.4s linear infinite;transform-origin:50% 50%}");
            var sI = {
                    Small: {
                        dimension: 16,
                        strokeWidth: 2,
                        textClass: "text-caption-small"
                    },
                    Medium: {
                        dimension: 32,
                        strokeWidth: 3,
                        textClass: "text-caption-small",
                        valueContainerSize: 36
                    },
                    Large: {
                        dimension: 48,
                        strokeWidth: 4,
                        textClass: "text-caption-medium",
                        valueContainerSize: 52
                    }
                },
                sM = Z().forwardRef(function(t, n) {
                    var r = t.className,
                        o = t.size,
                        a = void 0 === o ? "Large" : o,
                        i = t.variant,
                        l = t.value,
                        c = t.showValue,
                        u = void 0 !== c && c,
                        s = t.ariaLabel,
                        f = eB(t, ["className", "size", "variant", "value", "showValue", "ariaLabel"]),
                        d = sI[a],
                        p = d.dimension,
                        v = d.strokeWidth,
                        m = d.textClass,
                        h = d.valueContainerSize,
                        y = (p - v) / 2,
                        g = 2 * Math.PI * y,
                        b = p / 2,
                        w = Math.min(100, Math.max(0, void 0 === l ? 0 : l)),
                        x = u && void 0 !== h ? h : p,
                        S = "Determinate" === (void 0 === i ? "Determinate" : i);
                    return Z().createElement("div", Object.assign({
                        ref: n,
                        className: ez("foundation-web-progress-circle inline-flex items-center justify-center", r),
                        role: "progressbar",
                        "aria-label": s,
                        "aria-valuemin": S ? 0 : void 0,
                        "aria-valuemax": S ? 100 : void 0,
                        "aria-valuenow": S ? w : void 0,
                        style: {
                            width: x,
                            height: x
                        }
                    }, f), Z().createElement("svg", {
                        width: p,
                        height: p,
                        viewBox: "0 0 ".concat(p, " ").concat(p),
                        className: "relative"
                    }, Z().createElement("circle", {
                        cx: b,
                        cy: b,
                        r: y,
                        fill: "none",
                        strokeWidth: v,
                        style: {
                            stroke: "var(--color-shift-200)"
                        }
                    }), Z().createElement("circle", {
                        cx: b,
                        cy: b,
                        r: y,
                        fill: "none",
                        strokeWidth: v,
                        strokeDasharray: S ? g : "".concat(.75 * g, " ").concat(.25 * g),
                        strokeDashoffset: S ? g * (1 - w / 100) : 0,
                        strokeLinecap: "round",
                        className: ez(!S && "foundation-web-progress-circle-indeterminate"),
                        style: S ? {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transform: "rotate(-90deg)",
                            transformOrigin: "50% 50%",
                            transition: "stroke-dashoffset 0.3s ease-out"
                        } : {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transformOrigin: "50% 50%"
                        }
                    })), S && u && "Large" === a && Z().createElement("div", {
                        className: ez("absolute content-emphasis flex items-center justify-center", m),
                        "aria-hidden": "true"
                    }, Z().createElement("span", null, Math.round(w)), Z().createElement("span", null, "%")))
                });

            function s_(t, n, r, o, a, i, l) {
                try {
                    var c = t[i](l),
                        u = c.value
                } catch (t) {
                    r(t);
                    return
                }
                c.done ? n(u) : Promise.resolve(u).then(o, a)
            }
            sM.displayName = "ProgressCircle";
            var sF = function() {
                    var t;
                    return (t = function() {
                        return function(t, n) {
                            var r, o, a, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & a[0]) throw a[1];
                                        return a[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                            return l.next = c(0), l.throw = c(1), l.return = c(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                                return this
                            }), l;

                            function c(c) {
                                return function(u) {
                                    var s = [c, u];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                                        if (r = 1, o && (a = 2 & s[0] ? o.return : s[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, s[1])).done) return a;
                                        switch (o = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                            case 0:
                                            case 1:
                                                a = s;
                                                break;
                                            case 4:
                                                return i.label++, {
                                                    value: s[1],
                                                    done: !1
                                                };
                                            case 5:
                                                i.label++, o = s[1], s = [0];
                                                continue;
                                            case 7:
                                                s = i.ops.pop(), i.trys.pop();
                                                continue;
                                            default:
                                                if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                    i = 0;
                                                    continue
                                                }
                                                if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                                    i.label = s[1];
                                                    break
                                                }
                                                if (6 === s[0] && i.label < a[1]) {
                                                    i.label = a[1], a = s;
                                                    break
                                                }
                                                if (a && i.label < a[2]) {
                                                    i.label = a[2], i.ops.push(s);
                                                    break
                                                }
                                                a[2] && i.ops.pop(), i.trys.pop();
                                                continue
                                        }
                                        s = n.call(t, i)
                                    } catch (t) {
                                        s = [6, t], o = 0
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
                        }(this, function(t) {
                            switch (t.label) {
                                case 0:
                                    return [4, q.httpService.post({
                                        url: "".concat(ew().authApi, "/v2/session/refresh"),
                                        withCredentials: !0
                                    }, {})];
                                case 1:
                                    return t.sent(), [2]
                            }
                        })
                    }, function() {
                        var n = this,
                            r = arguments;
                        return new Promise(function(o, a) {
                            var i = t.apply(n, r);

                            function l(t) {
                                s_(i, o, a, l, c, "next", t)
                            }

                            function c(t) {
                                s_(i, o, a, l, c, "throw", t)
                            }
                            l(void 0)
                        })
                    })()
                },
                sW = op.eventStreamService.eventTypes,
                sU = "Localization",
                sB = {
                    changeLanguage: {
                        name: "changeLanguage",
                        type: sW.formInteraction,
                        context: sU,
                        requiredParams: ["userId", "newSupportedLocaleCode", "previousSupportedLocaleCode"]
                    },
                    changeLanguageModal: {
                        name: "changeLanguageModal",
                        type: sW.formInteraction,
                        context: sU,
                        requiredParams: ["userId", "newSupportedLocaleCode"]
                    }
                };

            function sz(t, n) {
                (null == n || n > t.length) && (n = t.length);
                for (var r = 0, o = Array(n); r < n; r++) o[r] = t[r];
                return o
            }

            function sV(t, n, r, o, a, i, l) {
                try {
                    var c = t[i](l),
                        u = c.value
                } catch (t) {
                    r(t);
                    return
                }
                c.done ? n(u) : Promise.resolve(u).then(o, a)
            }

            function sH(t, n, r) {
                return n in t ? Object.defineProperty(t, n, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : t[n] = r, t
            }

            function sK(t) {
                return (sK = Object.setPrototypeOf ? Object.getPrototypeOf : function(t) {
                    return t.__proto__ || Object.getPrototypeOf(t)
                })(t)
            }

            function sX(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        sH(t, n, r[n])
                    })
                }
                return t
            }

            function sq(t, n) {
                return (sq = Object.setPrototypeOf || function(t, n) {
                    return t.__proto__ = n, t
                })(t, n)
            }

            function sG(t) {
                return function(t) {
                    if (Array.isArray(t)) return sz(t)
                }(t) || function(t) {
                    if ("undefined" != typeof Symbol && null != t[Symbol.iterator] || null != t["@@iterator"]) return Array.from(t)
                }(t) || function(t, n) {
                    if (t) {
                        if ("string" == typeof t) return sz(t, void 0);
                        var r = Object.prototype.toString.call(t).slice(8, -1);
                        if ("Object" === r && t.constructor && (r = t.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return sz(t, n)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function sY() {
                try {
                    var t = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (t) {}
                return (sY = function() {
                    return !!t
                })()
            }
            var sZ = op.dataStores.localeDataStore,
                s$ = function(t) {
                    return t.locale && t.locale.nativeName ? t.isEnabledForFullExperience ? t.locale.nativeName : "".concat(t.locale.nativeName, "*") : ""
                },
                sQ = function(t) {
                    var n;
                    if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");

                    function r(t) {
                        var n, o, a;
                        if (!(this instanceof r)) throw TypeError("Cannot call a class as a function");
                        return o = r, a = [t], o = sK(o), (n = function(t, n) {
                            var r;
                            if (n && ("object" == ((r = n) && "undefined" != typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof n)) return n;
                            if (void 0 === t) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                            return t
                        }(this, sY() ? Reflect.construct(o, a || [], sK(this).constructor) : o.apply(this, a))).state = {
                            supportedLocales: [],
                            userLocale: {},
                            showUnsupportedModal: !1,
                            isUserLocaleUnsupported: !1,
                            isLocaleUpdateInProgress: !1
                        }, n.handleNativeLanguageChange = n.handleNativeLanguageChange.bind(n), n.hideUnsupportedModal = n.hideUnsupportedModal.bind(n), n
                    }
                    return r.prototype = Object.create(t && t.prototype, {
                            constructor: {
                                value: r,
                                writable: !0,
                                configurable: !0
                            }
                        }), t && sq(r, t), n = [{
                            key: "componentDidMount",
                            value: function() {
                                this.loadSupportedLocales()
                            }
                        }, {
                            key: "handleLanguageChange",
                            value: function(t) {
                                var n = this,
                                    r = sX({}, t.locale),
                                    o = this.state.userLocale,
                                    a = this.props,
                                    i = a.isAuthenticatedUser,
                                    l = a.onLanguageChange,
                                    c = sX({}, o);
                                i ? (this.setState({
                                    isLocaleUpdateInProgress: !0
                                }), sZ.setUserLocale(r.locale).then(function() {
                                    var o;
                                    return (o = function() {
                                        return function(t, n) {
                                            var r, o, a, i = {
                                                    label: 0,
                                                    sent: function() {
                                                        if (1 & a[0]) throw a[1];
                                                        return a[1]
                                                    },
                                                    trys: [],
                                                    ops: []
                                                },
                                                l = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
                                            return l.next = c(0), l.throw = c(1), l.return = c(2), "function" == typeof Symbol && (l[Symbol.iterator] = function() {
                                                return this
                                            }), l;

                                            function c(c) {
                                                return function(u) {
                                                    var s = [c, u];
                                                    if (r) throw TypeError("Generator is already executing.");
                                                    for (; l && (l = 0, s[0] && (i = 0)), i;) try {
                                                        if (r = 1, o && (a = 2 & s[0] ? o.return : s[0] ? o.throw || ((a = o.return) && a.call(o), 0) : o.next) && !(a = a.call(o, s[1])).done) return a;
                                                        switch (o = 0, a && (s = [2 & s[0], a.value]), s[0]) {
                                                            case 0:
                                                            case 1:
                                                                a = s;
                                                                break;
                                                            case 4:
                                                                return i.label++, {
                                                                    value: s[1],
                                                                    done: !1
                                                                };
                                                            case 5:
                                                                i.label++, o = s[1], s = [0];
                                                                continue;
                                                            case 7:
                                                                s = i.ops.pop(), i.trys.pop();
                                                                continue;
                                                            default:
                                                                if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                                                    i = 0;
                                                                    continue
                                                                }
                                                                if (3 === s[0] && (!a || s[1] > a[0] && s[1] < a[3])) {
                                                                    i.label = s[1];
                                                                    break
                                                                }
                                                                if (6 === s[0] && i.label < a[1]) {
                                                                    i.label = a[1], a = s;
                                                                    break
                                                                }
                                                                if (a && i.label < a[2]) {
                                                                    i.label = a[2], i.ops.push(s);
                                                                    break
                                                                }
                                                                a[2] && i.ops.pop(), i.trys.pop();
                                                                continue
                                                        }
                                                        s = n.call(t, i)
                                                    } catch (t) {
                                                        s = [6, t], o = 0
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
                                                    return [4, sF()];
                                                case 1:
                                                    return n.sent(), t.isEnabledForFullExperience ? l(r) : (this.showUnsupportedLocaleMessage(), this.showUnsupportedLocaleModal(r)), [2]
                                            }
                                        })
                                    }, function() {
                                        var t = this,
                                            n = arguments;
                                        return new Promise(function(r, a) {
                                            var i = o.apply(t, n);

                                            function l(t) {
                                                sV(i, r, a, l, c, "next", t)
                                            }

                                            function c(t) {
                                                sV(i, r, a, l, c, "throw", t)
                                            }
                                            l(void 0)
                                        })
                                    }).call(n)
                                }, function(t) {
                                    console.error(t)
                                }).finally(function() {
                                    n.setState({
                                        isLocaleUpdateInProgress: !1
                                    })
                                })) : l(r), this.setUserLocaleByLocaleCode(r.locale), op.eventStreamService.sendEvent(sB.changeLanguage, {
                                    userId: K.authenticatedUser.id,
                                    newSupportedLocaleCode: r.locale,
                                    previousSupportedLocaleCode: c.locale.locale
                                })
                            }
                        }, {
                            key: "getFoundationSelector",
                            value: function() {
                                var t, n, r = this,
                                    o = this.state,
                                    a = o.supportedLocales,
                                    i = o.userLocale,
                                    l = o.isLocaleUpdateInProgress,
                                    c = (t = Object).assign.apply(t, sG(a.map(function(t) {
                                        return sH({}, t.locale.locale, t)
                                    })));
                                return (0, T.jsx)(uq, {
                                    value: null == i || null == (n = i.locale) ? void 0 : n.locale,
                                    className: "form-group",
                                    onValueChange: function(t) {
                                        return r.handleLanguageChange(c[t])
                                    },
                                    size: "Medium",
                                    placeholder: "Language",
                                    isDisabled: l,
                                    children: (0, T.jsx)(sD, {
                                        children: (0, T.jsx)(sL, {
                                            children: a.map(function(t) {
                                                return (0, T.jsx)(sT, {
                                                    title: s$(t),
                                                    value: t.locale.locale
                                                }, t.locale.id)
                                            })
                                        })
                                    })
                                })
                            }
                        }, {
                            key: "handleNativeLanguageChange",
                            value: function(t) {
                                var n = this.state.supportedLocales,
                                    r = t.target.value,
                                    o = n.find(function(t) {
                                        return t.locale.locale === r
                                    });
                                this.handleLanguageChange(o)
                            }
                        }, {
                            key: "getNativeSelector",
                            value: function() {
                                var t = this.state,
                                    n = t.supportedLocales,
                                    r = t.userLocale,
                                    o = n.map(function(t) {
                                        return {
                                            value: t.locale.locale,
                                            key: t.locale.id,
                                            label: s$(t)
                                        }
                                    }),
                                    a = r.locale && r.locale.locale;
                                return o.length > 0 && (0, T.jsx)("select", {
                                    id: "language-switcher",
                                    className: "flex items-center justify-between width-full bg-none stroke-standard stroke-contrast-alpha cursor-pointer radius-medium height-1000 text-body-medium padding-x-medium",
                                    value: a,
                                    onChange: this.handleNativeLanguageChange,
                                    children: o.map(function(t) {
                                        return (0, T.jsx)("option", {
                                            value: t.value,
                                            className: "flex width-full items-center bg-none padding-x-medium stroke-standard ",
                                            children: t.label
                                        }, t.key)
                                    })
                                })
                            }
                        }, {
                            key: "getSelector",
                            value: function() {
                                return this.props.isNative ? this.getNativeSelector() : this.getFoundationSelector()
                            }
                        }, {
                            key: "setUserLocaleByLocaleCode",
                            value: function(t) {
                                var n = this.findSupportedLocaleByLocaleCode(t);
                                this.setState({
                                    userLocale: sX({}, n)
                                }), n.isEnabledForFullExperience || this.showUnsupportedLocaleMessage()
                            }
                        }, {
                            key: "sortSupportedLocalesByFullExperience",
                            value: function(t) {
                                if (Array.isArray(t)) {
                                    var n = t.filter(function(t) {
                                            return t.isEnabledForFullExperience
                                        }).sort(function(t, n) {
                                            return t.locale.nativeName > n.locale.nativeName ? 1 : -1
                                        }),
                                        r = t.filter(function(t) {
                                            return !t.isEnabledForFullExperience
                                        }).sort(function(t, n) {
                                            return t.locale.nativeName > n.locale.nativeName ? 1 : -1
                                        });
                                    return sG(n).concat(sG(r))
                                }
                                return t
                            }
                        }, {
                            key: "filterLocalesBySeoSupport",
                            value: function(t) {
                                return Array.isArray(t) ? t.filter(function(t) {
                                    return t.isEnabledForFullExperience && 2 === t.locale.language.languageCode.length
                                }).sort(function(t, n) {
                                    return t.locale.nativeName > n.locale.nativeName ? 1 : -1
                                }) : t
                            }
                        }, {
                            key: "findSupportedLocaleByLocaleCode",
                            value: function(t) {
                                return this.state.supportedLocales.find(function(n) {
                                    return n.locale.locale === t
                                })
                            }
                        }, {
                            key: "loadSupportedLocales",
                            value: function() {
                                var t = this;
                                sZ.getLocalesWithCache(6e5).then(function(n) {
                                    t.props.hideSeoUnsupportedLocales ? t.setState({
                                        supportedLocales: t.filterLocalesBySeoSupport(n.data)
                                    }) : t.setState({
                                        supportedLocales: t.sortSupportedLocalesByFullExperience(n.data)
                                    }), t.loadUserLocale()
                                }, function(t) {
                                    console.error(t)
                                })
                            }
                        }, {
                            key: "loadUserLocale",
                            value: function() {
                                var t = this,
                                    n = q.urlService.getQueryParam("locale");
                                if (n) this.setUserLocaleByLocaleCode(n);
                                else {
                                    var r = this.props.isAuthenticatedUser;
                                    sZ.getUserLocale().then(function(n) {
                                        var o = r ? n.data.ugc.locale : n.data.signupAndLogin.locale;
                                        t.setUserLocaleByLocaleCode(o)
                                    }, function(t) {
                                        console.error(t)
                                    })
                                }
                            }
                        }, {
                            key: "showUnsupportedLocaleModal",
                            value: function(t) {
                                this.props.showWarningModalForUnsupportedLocale && (this.setState({
                                    showUnsupportedModal: !0
                                }), op.eventStreamService.sendEvent(sB.changeLanguageModal, {
                                    userId: K.authenticatedUser.id,
                                    newSupportedLocaleCode: t.locale
                                }))
                            }
                        }, {
                            key: "hideUnsupportedModal",
                            value: function() {
                                (0, this.props.onLanguageChange)(this.state.userLocale)
                            }
                        }, {
                            key: "showUnsupportedLocaleMessage",
                            value: function() {
                                this.props.showWarningMessageForUnsupportedLocale && this.setState({
                                    isUserLocaleUnsupported: !0
                                })
                            }
                        }, {
                            key: "render",
                            value: function() {
                                var t = this.props.translate,
                                    n = this.state,
                                    r = n.showUnsupportedModal,
                                    o = n.isUserLocaleUnsupported,
                                    a = n.supportedLocales,
                                    i = n.userLocale;
                                return (0, T.jsxs)(Z().Fragment, {
                                    children: [a.length > 0 && i.locale ? (0, T.jsx)("div", {
                                        className: "language-selector-wrapper",
                                        children: this.getSelector()
                                    }) : (0, T.jsx)(sM, {
                                        variant: "Indeterminate",
                                        size: "Medium"
                                    }), r && (0, T.jsx)(rT, {
                                        open: r,
                                        isModal: !0,
                                        size: "Medium",
                                        type: "Default",
                                        children: (0, T.jsxs)(rI, {
                                            children: [(0, T.jsxs)(rM, {
                                                className: "flex flex-col gap-y-xsmall items-center",
                                                children: [(0, T.jsx)(r_, {
                                                    className: "text-heading-medium",
                                                    children: t("Heading.UnsupportedLanguage")
                                                }), (0, T.jsx)("div", {
                                                    className: "text-body-medium content-default",
                                                    children: t("Description.UnsupportedLanguage")
                                                })]
                                            }), (0, T.jsx)(rF, {
                                                className: "flex gap-x-small items-center",
                                                children: (0, T.jsx)(r5, {
                                                    variant: "Standard",
                                                    className: "fill",
                                                    size: "Medium",
                                                    onClick: this.hideUnsupportedModal,
                                                    children: t("Action.Ok")
                                                })
                                            })]
                                        })
                                    }), o && (0, T.jsx)("div", {
                                        className: "row",
                                        children: (0, T.jsx)("span", {
                                            className: "text text-error",
                                            children: t("Description.UnsupportedLanguage")
                                        })
                                    })]
                                })
                            }
                        }],
                        function(t, n) {
                            for (var r = 0; r < n.length; r++) {
                                var o = n[r];
                                o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(t, o.key, o)
                            }
                        }(r.prototype, n), r
                }(Z().Component);

            function sJ(t) {
                for (var n = 1; n < arguments.length; n++) {
                    var r = null != arguments[n] ? arguments[n] : {},
                        o = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (o = o.concat(Object.getOwnPropertySymbols(r).filter(function(t) {
                        return Object.getOwnPropertyDescriptor(r, t).enumerable
                    }))), o.forEach(function(n) {
                        var o;
                        o = r[n], n in t ? Object.defineProperty(t, n, {
                            value: o,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : t[n] = o
                    })
                }
                return t
            }

            function s0(t) {
                var n = q.pageName.PageNameProvider.getInternalPageName(),
                    r = "CreateAccount" === n || "Landing" === n,
                    o = null === K.authenticatedUser || void 0 === K.authenticatedUser ? void 0 : K.authenticatedUser.isAuthenticated,
                    a = X.DeviceMeta && new X.DeviceMeta,
                    i = a && (a.isPhone || a.isTablet),
                    l = o || r,
                    c = t.translate;
                return (0, T.jsxs)("div", {
                    className: "footer",
                    children: [(0, T.jsx)(od, sJ({}, t)), (0, T.jsxs)("div", {
                        className: "row copyright-container flex items-center justify-between padding-top-xlarge gutter-x-small",
                        children: [(0, T.jsx)("div", {
                            className: "col-sm-6 col-md-3",
                            children: l && (0, T.jsx)(sQ, {
                                translate: c,
                                onLanguageChange: function(t) {
                                    var n = t.locale,
                                        o = t.language;
                                    if (r && n) {
                                        var a = Object.fromEntries(new URLSearchParams(window.location.search)),
                                            i = {
                                                pathname: o.languageCode,
                                                query: a
                                            };
                                        window.location.href = q.urlService.formatUrl(i)
                                    } else window.location.reload()
                                },
                                isAuthenticatedUser: o,
                                showWarningMessageForUnsupportedLocale: !1,
                                hideSeoUnsupportedLocales: r,
                                isNative: i
                            })
                        }), (0, T.jsx)("div", {
                            className: l ? "col-sm-6 col-md-9" : "col-sm-12",
                            children: (0, T.jsx)(G, sJ({}, t))
                        })]
                    })]
                })
            }

            function s1(t) {
                var n = t.translate,
                    r = t.intl;
                return (0, T.jsx)(s0, {
                    translate: n,
                    intl: r
                })
            }
            sQ.defaultProps = {
                onLanguageChange: function() {},
                isAuthenticatedUser: !1,
                isNative: !1,
                showWarningModalForUnsupportedLocale: !0,
                showWarningMessageForUnsupportedLocale: !0,
                hideSeoUnsupportedLocales: !1
            }, sQ.propTypes = {
                isAuthenticatedUser: V().bool,
                onLanguageChange: V().func,
                isNative: V().bool,
                showWarningModalForUnsupportedLocale: V().bool,
                showWarningMessageForUnsupportedLocale: V().bool,
                translate: V().func.isRequired,
                hideSeoUnsupportedLocales: V().bool
            }, s0.propTypes = {
                translate: V().func.isRequired
            }, s1.propTypes = {
                translate: V().func.isRequired,
                intl: V().shape({
                    getRobloxLocale: V().func.isRequired
                }).isRequired
            };
            var s2 = (0, F.withTranslations)(s1, H.P),
                s3 = function(t, n) {
                    X.DeviceMeta && op.hybridService && new X.DeviceMeta().isInApp && op.hybridService.localization && op.hybridService.localization(t, n)
                };

            function s5(t) {
                var n = t.translate,
                    r = null === K.authenticatedUser || void 0 === K.authenticatedUser ? void 0 : K.authenticatedUser.isAuthenticated;
                return (0, T.jsx)(sQ, {
                    onLanguageChange: function(t) {
                        var n = t.locale;
                        n && s3(n, function() {
                            console.warn("Language Change Hybrid Event: ".concat(n))
                        }), window.location.reload()
                    },
                    translate: n,
                    isAuthenticatedUser: r
                })
            }
            window.Roblox.AccountSettingsLanguageSelector = s5, s5.propTypes = {
                translate: V().func.isRequired
            };
            var s4 = (0, F.withTranslations)(s5, H.P);
            r(496), r(960);
            var s6 = "account-settings-language-selector";
            _()(function() {
                var t = document.getElementById("footer-container");
                if (t) {
                    var n = (0, T.jsx)(I.QueryClientProvider, {
                        client: F.queryClient,
                        children: (0, T.jsx)(s2, {})
                    });
                    (0, F.renderWithErrorBoundary)(n, t)
                }
                var r = document.getElementById(s6),
                    o = 10,
                    a = function() {
                        (r = document.getElementById(s6)) || !(o > 0) ? r && (0, F.renderWithErrorBoundary)((0, T.jsx)(s4, {}), r): (o -= 1, setTimeout(a, 200))
                    };
                a(), window.location.pathname.toLowerCase().indexOf("/my/account") > -1 && (window.onhashchange = function() {
                    if ("#!/info" === window.location.hash) {
                        var t = document.getElementById(s6);
                        t && (0, F.renderWithErrorBoundary)((0, T.jsx)(s4, {}), t)
                    }
                })
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("Footer");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/footer-b258a00c7f020d68.js.map